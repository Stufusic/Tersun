#include "tensor/nn/ops/attention_kernels.hpp"
#include "tensor/nn/ops/attention_ops.hpp"
#include "tensor/nn/ops/bit_linear.hpp"
#include "tensor/nn/ops/rmsnorm.hpp"
#include "tensor/nn/ops/rope.hpp"
#include "tensor/nn/memory/kv_cache.hpp"
#include "tensor/nn/runtime/parallel_planner.hpp"
#include "tensor/edge_arena.hpp"
#include <iostream>
#include <vector>
#include <chrono>
#include <algorithm>
#include <numeric>
#include <cmath>
#include <iomanip>
#include <random>

#if defined(_OPENMP)
#include <omp.h>
#endif

namespace setun::benchmark {

using namespace setun::tensor::nn;
using namespace setun::tensor::nn::ops;
using namespace setun::tensor;

struct BenchStats {
    double median_ms{0.0};
    double min_ms{0.0};
    double p90_ms{0.0};
    double p99_ms{0.0};
    double stddev_ms{0.0};
};

template <typename Fn>
BenchStats run_bench(Fn&& fn, size_t warmup_iters, size_t measure_iters) {
    // 1. Warmup
    for (size_t i = 0; i < warmup_iters; ++i) {
        fn();
    }

    // 2. Measure
    std::vector<double> timings;
    timings.reserve(measure_iters);

    for (size_t i = 0; i < measure_iters; ++i) {
        auto t0 = std::chrono::high_resolution_clock::now();
        fn();
        auto t1 = std::chrono::high_resolution_clock::now();
        double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
        timings.push_back(ms);
    }

    std::sort(timings.begin(), timings.end());
    double sum = std::accumulate(timings.begin(), timings.end(), 0.0);
    double mean = sum / timings.size();

    double sq_diff_sum = 0.0;
    for (double t : timings) {
        sq_diff_sum += (t - mean) * (t - mean);
    }
    double stddev = std::sqrt(sq_diff_sum / timings.size());

    BenchStats s;
    s.min_ms = timings.front();
    s.median_ms = timings[timings.size() / 2];
    s.p90_ms = timings[static_cast<size_t>(timings.size() * 0.90)];
    s.p99_ms = timings[static_cast<size_t>(timings.size() * 0.99)];
    s.stddev_ms = stddev;
    return s;
}

static void fill_synthetic(float* buf, size_t count, float low, float high, uint32_t seed) {
    std::mt19937 rng(seed);
    std::uniform_real_distribution<float> dist(low, high);
    for (size_t i = 0; i < count; ++i) {
        buf[i] = dist(rng);
    }
}

// ============================================================================
// Benchmark 1: Attention Ladder Speedup (A0 -> A6) on BitNet Target Shapes
// ============================================================================
void bench_attention_ladder() {
    std::cout << "\n===================================================================\n";
    std::cout << "  BENCHMARK 1: ATTENTION LADDER SPEEDUP (BitNet H=20:5, D=128)     \n";
    std::cout << "===================================================================\n";

    constexpr size_t num_heads = 20;
    constexpr size_t num_kv_heads = 5;
    constexpr size_t head_dim = 128;
    float scale = 1.0f / std::sqrt(128.0f);

    size_t test_seqs[] = {64, 256, 512, 1024};

    for (size_t S : test_seqs) {
        size_t q_count = S * num_heads * head_dim;
        size_t kv_count = S * num_kv_heads * head_dim;
        std::vector<float> Q(q_count), K(kv_count), V(kv_count), O(q_count);
        fill_synthetic(Q.data(), q_count, -1.0f, 1.0f, 42);
        fill_synthetic(K.data(), kv_count, -1.0f, 1.0f, 43);
        fill_synthetic(V.data(), kv_count, -1.0f, 1.0f, 44);

        size_t k_token_stride = num_kv_heads * head_dim;
        size_t v_token_stride = num_kv_heads * head_dim;

        size_t warmup = 5;
        size_t iters = (S <= 256) ? 30 : 15;

        // Stage A0: Scalar Reference
        auto s_a0 = run_bench([&]() {
            compute_attention_a0_scalar_reference(Q.data(), K.data(), V.data(), O.data(),
                                                  S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                                  k_token_stride, v_token_stride);
        }, 1, (S <= 256) ? 10 : 3);

        // Stage A1: Scalar Online
        auto s_a1 = run_bench([&]() {
            compute_attention_a1_scalar_online(Q.data(), K.data(), V.data(), O.data(),
                                               S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                               k_token_stride, v_token_stride);
        }, warmup, iters);

        // Stage A4: Fused Online SIMD (1 Thread)
        auto s_a4 = run_bench([&]() {
            compute_attention_a4_fused_simd(Q.data(), K.data(), V.data(), O.data(),
                                            S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                            k_token_stride, v_token_stride);
        }, warmup, iters);

        // Stage A5: 2D Query-Key Tiling (1 Thread)
        AttentionTileConfig tile_cfg{4, 32};
        auto s_a5 = run_bench([&]() {
            compute_attention_a5_2d_tiled(Q.data(), K.data(), V.data(), O.data(),
                                          S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                          k_token_stride, v_token_stride, tile_cfg);
        }, warmup, iters);

        // Stage A6: GQA Parallel Attention (4 Threads)
        auto s_a6_4t = run_bench([&]() {
            compute_attention_a6_gqa_parallel(Q.data(), K.data(), V.data(), O.data(),
                                              S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                              k_token_stride, v_token_stride, tile_cfg, 4);
        }, warmup, iters * 2);

        double vec_speedup = s_a0.median_ms / s_a4.median_ms;
        double tile_speedup = s_a4.median_ms / s_a5.median_ms;
        double par_speedup = s_a5.median_ms / s_a6_4t.median_ms;
        double total_speedup = s_a0.median_ms / s_a6_4t.median_ms;

        std::cout << "  [Sequence S = " << std::setw(4) << S << "]\n"
                  << "    A0 Scalar Reference : " << std::fixed << std::setprecision(2) << std::setw(7) << s_a0.median_ms << " ms\n"
                  << "    A1 Scalar Online    : " << std::setw(7) << s_a1.median_ms << " ms (" << (s_a0.median_ms / s_a1.median_ms) << "x vs A0)\n"
                  << "    A4 Fused SIMD (1T)  : " << std::setw(7) << s_a4.median_ms << " ms (" << vec_speedup << "x Vectorization)\n"
                  << "    A5 2D Tiled (1T)    : " << std::setw(7) << s_a5.median_ms << " ms (" << tile_speedup << "x Tiling Locality)\n"
                  << "    A6 GQA Parallel (4T): " << std::setw(7) << s_a6_4t.median_ms << " ms (" << par_speedup << "x Threading)\n"
                  << "    >>> Total Ladder Speedup A0 -> A6: " << std::setprecision(1) << total_speedup << "x <<<\n\n";
    }
}

// ============================================================================
// Benchmark 2: Threading Scaling & Parallel Efficiency (1T, 2T, 4T, 8T)
// ============================================================================
void bench_threading_scaling() {
    std::cout << "\n===================================================================\n";
    std::cout << "  BENCHMARK 2: PARALLEL SCALING & EFFICIENCY (1T, 2T, 4T, 8T)      \n";
    std::cout << "===================================================================\n";

    constexpr size_t S = 512;
    constexpr size_t num_heads = 20;
    constexpr size_t num_kv_heads = 5;
    constexpr size_t head_dim = 128;
    float scale = 1.0f / std::sqrt(128.0f);

    size_t q_count = S * num_heads * head_dim;
    size_t kv_count = S * num_kv_heads * head_dim;
    std::vector<float> Q(q_count), K(kv_count), V(kv_count), O(q_count);
    fill_synthetic(Q.data(), q_count, -1.0f, 1.0f, 42);
    fill_synthetic(K.data(), kv_count, -1.0f, 1.0f, 43);
    fill_synthetic(V.data(), kv_count, -1.0f, 1.0f, 44);

    size_t k_token_stride = num_kv_heads * head_dim;
    size_t v_token_stride = num_kv_heads * head_dim;
    AttentionTileConfig tile_cfg{4, 32};

    uint32_t threads[] = {1, 2, 4, 8};
    double t1_ms = 0.0;

    std::cout << "  Thread | Latency (ms) | Speedup vs 1T | Parallel Efficiency\n";
    std::cout << "  -------+--------------+---------------+--------------------\n";

    for (uint32_t t : threads) {
        auto s = run_bench([&]() {
            compute_attention_a6_gqa_parallel(Q.data(), K.data(), V.data(), O.data(),
                                              S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                              k_token_stride, v_token_stride, tile_cfg, t);
        }, 5, 20);

        if (t == 1) t1_ms = s.median_ms;
        double speedup = t1_ms / s.median_ms;
        double eff = (speedup / t) * 100.0;

        std::cout << "     " << t << "T  |   " << std::fixed << std::setprecision(2) << std::setw(7) << s.median_ms
                  << " ms |    " << std::setprecision(2) << std::setw(5) << speedup << "x     |    "
                  << std::setprecision(1) << std::setw(5) << eff << " %\n";
    }
}

// ============================================================================
// Benchmark 3: Full Transformer Layer Component Breakdown & Roofline
// ============================================================================
void bench_component_breakdown() {
    std::cout << "\n===================================================================\n";
    std::cout << "  BENCHMARK 3: TRANSFORMER LAYER COMPONENT BREAKDOWN & ROOFLINE    \n";
    std::cout << "===================================================================\n";

    constexpr size_t S = 256;
    constexpr size_t hidden = 2560;
    constexpr size_t num_heads = 20;
    constexpr size_t num_kv_heads = 5;
    constexpr size_t head_dim = 128;
    constexpr size_t intermediate = 6824;

    EdgeArena act_arena(32 * 1024 * 1024);
    EdgeArena ws_arena(32 * 1024 * 1024);
    ExecutionContext ctx(act_arena, ws_arena, nullptr, ExecutionMode::Prefill);

    RMSNorm pre_norm("pre_norm", hidden);
    pre_norm.init_constant(1.0f);

    BitLinear q_proj("q_proj", hidden, num_heads * head_dim, false);
    BitLinear k_proj("k_proj", hidden, num_kv_heads * head_dim, false);
    BitLinear v_proj("v_proj", hidden, num_kv_heads * head_dim, false);
    BitLinear out_proj("out_proj", num_heads * head_dim, hidden, false);
    q_proj.init_synthetic(11);
    k_proj.init_synthetic(12);
    v_proj.init_synthetic(13);
    out_proj.init_synthetic(14);

    RoPECache rope(head_dim, 4096);

    RMSNorm post_norm("post_norm", hidden);
    post_norm.init_constant(1.0f);

    BitLinear gate_proj("gate_proj", hidden, intermediate, false);
    BitLinear up_proj("up_proj", hidden, intermediate, false);
    BitLinear down_proj("down_proj", intermediate, hidden, false);
    gate_proj.init_synthetic(21);
    up_proj.init_synthetic(22);
    down_proj.init_synthetic(23);

    std::vector<float> input_buf(S * hidden, 0.5f);
    std::vector<float> norm1_buf(S * hidden);
    std::vector<float> q_buf(S * num_heads * head_dim);
    std::vector<float> k_buf(S * num_kv_heads * head_dim);
    std::vector<float> v_buf(S * num_kv_heads * head_dim);
    std::vector<float> ctx_buf(S * num_heads * head_dim);
    std::vector<float> attn_out(S * hidden);
    std::vector<float> norm2_buf(S * hidden);
    std::vector<float> gate_buf(S * intermediate);
    std::vector<float> up_buf(S * intermediate);
    std::vector<float> ffn_out(S * hidden);

    TensorView in_view(input_buf.data(), TensorShape(S, hidden), TensorDType::FLOAT32);
    TensorView norm1_view(norm1_buf.data(), TensorShape(S, hidden), TensorDType::FLOAT32);
    TensorView q_view(q_buf.data(), TensorShape(S, num_heads * head_dim), TensorDType::FLOAT32);
    TensorView k_view(k_buf.data(), TensorShape(S, num_kv_heads * head_dim), TensorDType::FLOAT32);
    TensorView v_view(v_buf.data(), TensorShape(S, num_kv_heads * head_dim), TensorDType::FLOAT32);
    TensorView ctx_view(ctx_buf.data(), TensorShape(S, num_heads * head_dim), TensorDType::FLOAT32);
    TensorView attn_out_view(attn_out.data(), TensorShape(S, hidden), TensorDType::FLOAT32);
    TensorView norm2_view(norm2_buf.data(), TensorShape(S, hidden), TensorDType::FLOAT32);
    TensorView gate_view(gate_buf.data(), TensorShape(S, intermediate), TensorDType::FLOAT32);
    TensorView up_view(up_buf.data(), TensorShape(S, intermediate), TensorDType::FLOAT32);
    TensorView ffn_out_view(ffn_out.data(), TensorShape(S, hidden), TensorDType::FLOAT32);

    float scale = 1.0f / std::sqrt(128.0f);
    AttentionTileConfig tile_cfg{4, 32};
    size_t k_token_stride = num_kv_heads * head_dim;
    size_t v_token_stride = num_kv_heads * head_dim;

    // Component Timing
    auto s_norm1 = run_bench([&]() { pre_norm.forward(ctx, in_view, norm1_view); }, 2, 10);
    auto s_qkv = run_bench([&]() {
        q_proj.forward(ctx, norm1_view, q_view);
        k_proj.forward(ctx, norm1_view, k_view);
        v_proj.forward(ctx, norm1_view, v_view);
    }, 2, 10);
    auto s_rope = run_bench([&]() {
        for (size_t pos = 0; pos < S; ++pos) {
            rope.apply_multihead(q_buf.data() + pos * num_heads * head_dim, num_heads, head_dim, pos);
            rope.apply_multihead(k_buf.data() + pos * num_kv_heads * head_dim, num_kv_heads, head_dim, pos);
        }
    }, 2, 10);
    auto s_attn = run_bench([&]() {
        compute_attention_a6_gqa_parallel(q_buf.data(), k_buf.data(), v_buf.data(), ctx_buf.data(),
                                          S, S, num_heads, num_kv_heads, head_dim, scale, true,
                                          k_token_stride, v_token_stride, tile_cfg, 4);
    }, 2, 10);
    auto s_out_proj = run_bench([&]() { out_proj.forward(ctx, ctx_view, attn_out_view); }, 2, 10);
    auto s_norm2 = run_bench([&]() { post_norm.forward(ctx, attn_out_view, norm2_view); }, 2, 10);
    auto s_ffn = run_bench([&]() {
        gate_proj.forward(ctx, norm2_view, gate_view);
        up_proj.forward(ctx, norm2_view, up_view);
        down_proj.forward(ctx, gate_view, ffn_out_view);
    }, 2, 10);

    double total_ms = s_norm1.median_ms + s_qkv.median_ms + s_rope.median_ms + s_attn.median_ms
                    + s_out_proj.median_ms + s_norm2.median_ms + s_ffn.median_ms;

    std::cout << "  Layer Component          | Latency (ms) | Percentage\n";
    std::cout << "  -------------------------+--------------+-----------\n";
    auto print_row = [&](const char* name, double ms) {
        double pct = (ms / total_ms) * 100.0;
        std::cout << "  " << std::left << std::setw(25) << name << "|   "
                  << std::fixed << std::setprecision(2) << std::right << std::setw(7) << ms
                  << " ms |   " << std::setprecision(1) << std::setw(5) << pct << " %\n";
    };

    print_row("1. Pre-RMSNorm", s_norm1.median_ms);
    print_row("2. QKV Projections", s_qkv.median_ms);
    print_row("3. Rotary Pos Embedding", s_rope.median_ms);
    print_row("4. Stage A6 GQA Attention", s_attn.median_ms);
    print_row("5. Output Projection", s_out_proj.median_ms);
    print_row("6. Post-RMSNorm", s_norm2.median_ms);
    print_row("7. FFN Gate/Up/Down", s_ffn.median_ms);
    std::cout << "  -------------------------+--------------+-----------\n";
    print_row("Total Transformer Layer", total_ms);

    double tok_s = (static_cast<double>(S) / (total_ms / 1000.0));
    std::cout << "\n  >>> Prefill Throughput (Single Layer): " << std::fixed << std::setprecision(1)
              << tok_s << " tok/s (Sequence S=" << S << ") <<<\n";
}

// ============================================================================
// Benchmark 4: End-to-End LLM Latency (TTFT & TPOT Breakdown)
// ============================================================================
void bench_e2e_llm_metrics() {
    std::cout << "\n===================================================================\n";
    std::cout << "  BENCHMARK 4: TTFT & TPOT BREAKDOWN (Cold vs Warm Steady-State)   \n";
    std::cout << "===================================================================\n";

    constexpr size_t hidden = 2560;
    constexpr size_t num_heads = 20;
    constexpr size_t num_kv_heads = 5;
    constexpr size_t head_dim = 128;

    EdgeArena act_arena(64 * 1024 * 1024);
    EdgeArena ws_arena(32 * 1024 * 1024);
    KVCache kv(1, num_kv_heads, head_dim, 2048);

    ExecutionContext ctx(act_arena, ws_arena, &kv, ExecutionMode::Prefill);
    MultiHeadSelfAttention attn("layer0.attn", 0, hidden, num_heads, num_kv_heads, head_dim, 2048);
    attn.init_synthetic(1234);

    size_t prompt_lengths[] = {16, 64, 256, 512, 1024};
    std::cout << "  Prompt Len (S) | TTFT (ms) | Prefill tok/s | TPOT Cold (ms) | TPOT Warm (ms) | Decode tok/s\n";
    std::cout << "  ---------------+-----------+---------------+----------------+----------------+-------------\n";

    for (size_t S : prompt_lengths) {
        kv.reset();
        ctx.reset_activation_arena();
        ctx.set_mode(ExecutionMode::Prefill);

        std::vector<float> prompt_in(S * hidden, 0.25f);
        std::vector<float> prompt_out(S * hidden);
        TensorView in_view(prompt_in.data(), TensorShape(S, hidden), TensorDType::FLOAT32);
        TensorView out_view(prompt_out.data(), TensorShape(S, hidden), TensorDType::FLOAT32);

        // Measure TTFT
        auto s_ttft = run_bench([&]() {
            kv.reset();
            ctx.reset_activation_arena();
            Status st = attn.forward(ctx, in_view, out_view);
            if (!st.ok()) {
                std::cerr << "TTFT forward failed: " << st.message << "\n";
                std::abort();
            }
        }, 2, 5);

        double prefill_tok_s = static_cast<double>(S) / (s_ttft.median_ms / 1000.0);

        // Measure TPOT Cold (first token decode)
        ctx.set_mode(ExecutionMode::Decode);
        ctx.set_current_step(S);
        std::vector<float> tok_in(hidden, 0.1f);
        std::vector<float> tok_out(hidden);
        TensorView tok_in_v(tok_in.data(), TensorShape(1, hidden), TensorDType::FLOAT32);
        TensorView tok_out_v(tok_out.data(), TensorShape(1, hidden), TensorDType::FLOAT32);

        ctx.reset_activation_arena();
        auto t0 = std::chrono::high_resolution_clock::now();
        Status st_cold = attn.forward(ctx, tok_in_v, tok_out_v);
        auto t1 = std::chrono::high_resolution_clock::now();
        if (!st_cold.ok()) {
            std::cerr << "TPOT cold forward failed: " << st_cold.message << "\n";
            std::abort();
        }
        double tpot_cold_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

        // Measure TPOT Warm (steady-state tokens)
        auto s_tpot_warm = run_bench([&]() {
            ctx.reset_activation_arena();
            Status st_warm = attn.forward(ctx, tok_in_v, tok_out_v);
            if (!st_warm.ok()) {
                std::cerr << "TPOT warm forward failed: " << st_warm.message << "\n";
                std::abort();
            }
        }, 5, 20);

        double decode_tok_s = 1000.0 / s_tpot_warm.median_ms;

        std::cout << "       " << std::setw(4) << S << "      |   "
                  << std::fixed << std::setprecision(2) << std::setw(6) << s_ttft.median_ms << "  |     "
                  << std::setprecision(1) << std::setw(6) << prefill_tok_s << "    |     "
                  << std::setprecision(2) << std::setw(6) << tpot_cold_ms << "     |     "
                  << std::setprecision(2) << std::setw(6) << s_tpot_warm.median_ms << "     |    "
                  << std::setprecision(1) << std::setw(6) << decode_tok_s << "\n";
    }
}

} // namespace setun::benchmark

int main() {
    std::cout << "===================================================================\n";
    std::cout << "    TERSUN GATE 7.5: COMPREHENSIVE LLM EXECUTION BENCHMARK SUITE   \n";
    std::cout << "    Hardware: x86-64 AVX2 + FMA + OpenMP Parallel Runtime          \n";
    std::cout << "===================================================================\n";

    try {
        setun::benchmark::bench_attention_ladder();
        setun::benchmark::bench_threading_scaling();
        setun::benchmark::bench_component_breakdown();
        setun::benchmark::bench_e2e_llm_metrics();

        std::cout << "\n===================================================================\n";
        std::cout << "  >>> GATE 7.5 BENCHMARK HARNESS EXECUTION COMPLETED SUCCESSFULLY <<<\n";
        std::cout << "===================================================================\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "\n[FAIL] Benchmark failed: " << e.what() << "\n";
        return 1;
    }
}
