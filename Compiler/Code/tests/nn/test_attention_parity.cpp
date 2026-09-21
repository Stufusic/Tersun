#include "tensor/nn/ops/attention_kernels.hpp"
#include <iostream>
#include <vector>
#include <cmath>
#include <random>
#include <cassert>
#include <cstring>
#include <iomanip>

namespace setun::test {

using namespace setun::tensor::nn::ops;

struct ParityMetrics {
    float max_abs{0.0f};
    float max_rel{0.0f};
    float cosine{1.0f};
    bool has_nan_inf{false};
};

static ParityMetrics evaluate_parity(const float* a, const float* b, size_t count) {
    ParityMetrics m;
    double dot_ab = 0.0;
    double norm_a = 0.0;
    double norm_b = 0.0;

    for (size_t i = 0; i < count; ++i) {
        float va = a[i];
        float vb = b[i];

        if (std::isnan(va) || std::isnan(vb) || std::isinf(va) || std::isinf(vb)) {
            m.has_nan_inf = true;
        }

        float diff = std::fabs(va - vb);
        if (diff > m.max_abs) m.max_abs = diff;

        float denom = std::max(std::fabs(va), std::fabs(vb));
        float rel = (denom > 1e-6f) ? (diff / denom) : 0.0f;
        if (rel > m.max_rel) m.max_rel = rel;

        dot_ab += static_cast<double>(va) * static_cast<double>(vb);
        norm_a += static_cast<double>(va) * static_cast<double>(va);
        norm_b += static_cast<double>(vb) * static_cast<double>(vb);
    }

    double denom_norm = std::sqrt(norm_a) * std::sqrt(norm_b);
    m.cosine = (denom_norm > 1e-12) ? static_cast<float>(dot_ab / denom_norm) : 1.0f;
    return m;
}

static void fill_synthetic(float* buf, size_t count, float low, float high, uint32_t seed) {
    std::mt19937 rng(seed);
    std::uniform_real_distribution<float> dist(low, high);
    for (size_t i = 0; i < count; ++i) {
        buf[i] = dist(rng);
    }
}

// -----------------------------------------------------------------------------
// Test Case 1: Differential Ladder (A0 -> A1 -> A2 -> A3 -> A4 -> A5 -> A6)
// -----------------------------------------------------------------------------
static void test_attention_ladder_case(
    size_t S,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    bool is_causal,
    uint32_t seed
) {
    float scale = 1.0f / std::sqrt(static_cast<float>(head_dim));
    size_t q_count = S * num_heads * head_dim;
    size_t kv_count = S * num_kv_heads * head_dim;
    size_t out_count = q_count;

    std::vector<float> Q(q_count);
    std::vector<float> K(kv_count);
    std::vector<float> V(kv_count);

    fill_synthetic(Q.data(), q_count, -1.5f, 1.5f, seed + 1);
    fill_synthetic(K.data(), kv_count, -1.5f, 1.5f, seed + 2);
    fill_synthetic(V.data(), kv_count, -1.5f, 1.5f, seed + 3);

    size_t k_token_stride = num_kv_heads * head_dim;
    size_t v_token_stride = num_kv_heads * head_dim;

    std::vector<float> O_a0(out_count, 0.0f);
    std::vector<float> O_a1(out_count, 0.0f);
    std::vector<float> O_a2(out_count, 0.0f);
    std::vector<float> O_a3(out_count, 0.0f);
    std::vector<float> O_a4(out_count, 0.0f);
    std::vector<float> O_a5(out_count, 0.0f);
    std::vector<float> O_a6(out_count, 0.0f);

    // Run Stage A0: Ground Truth
    run_attention_stage(AttentionStage::A0_ScalarReference, Q.data(), K.data(), V.data(), O_a0.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride);

    // Run Stage A1: Scalar Online
    run_attention_stage(AttentionStage::A1_ScalarOnline, Q.data(), K.data(), V.data(), O_a1.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride);

    // Run Stage A2: SIMD QK
    run_attention_stage(AttentionStage::A2_SimdQK, Q.data(), K.data(), V.data(), O_a2.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride);

    // Run Stage A3: SIMD PV
    run_attention_stage(AttentionStage::A3_SimdPV, Q.data(), K.data(), V.data(), O_a3.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride);

    // Run Stage A4: Fused SIMD
    run_attention_stage(AttentionStage::A4_FusedSIMD, Q.data(), K.data(), V.data(), O_a4.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride);

    // Run Stage A5: 2D Tiled
    AttentionTileConfig tile_cfg{4, 32};
    run_attention_stage(AttentionStage::A5_2DTiled, Q.data(), K.data(), V.data(), O_a5.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride, tile_cfg);

    // Run Stage A6: GQA Parallel (4 threads)
    run_attention_stage(AttentionStage::A6_GQAParallel, Q.data(), K.data(), V.data(), O_a6.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, is_causal, k_token_stride, v_token_stride, tile_cfg, 4);

    // 3-Tier Budget Evaluation
    float max_abs_tol = (S <= 128) ? 1e-4f : 5e-4f;
    float min_cosine = 0.99998f;

    auto m1 = evaluate_parity(O_a0.data(), O_a1.data(), out_count);
    auto m2 = evaluate_parity(O_a0.data(), O_a2.data(), out_count);
    auto m3 = evaluate_parity(O_a0.data(), O_a3.data(), out_count);
    auto m4 = evaluate_parity(O_a0.data(), O_a4.data(), out_count);
    auto m5 = evaluate_parity(O_a0.data(), O_a5.data(), out_count);
    auto m6 = evaluate_parity(O_a0.data(), O_a6.data(), out_count);

    if (m1.has_nan_inf || m2.has_nan_inf || m3.has_nan_inf || m4.has_nan_inf || m5.has_nan_inf || m6.has_nan_inf) {
        std::cerr << "FAIL: NaN or Inf detected in attention output!\n";
        std::abort();
    }
    if (m1.max_abs > max_abs_tol || m2.max_abs > max_abs_tol || m3.max_abs > max_abs_tol ||
        m4.max_abs > max_abs_tol || m5.max_abs > max_abs_tol || m6.max_abs > max_abs_tol) {
        std::cerr << "FAIL: Numerical error exceeded budget: m6.max_abs=" << m6.max_abs << " vs tol=" << max_abs_tol << "\n";
        std::abort();
    }
    if (m1.cosine < min_cosine || m2.cosine < min_cosine || m3.cosine < min_cosine ||
        m4.cosine < min_cosine || m5.cosine < min_cosine || m6.cosine < min_cosine) {
        std::cerr << "FAIL: Cosine similarity dropped: m6.cosine=" << m6.cosine << "\n";
        std::abort();
    }

    std::cout << "  [S=" << std::setw(4) << S << ", H=" << num_heads << ":" << num_kv_heads
              << ", D=" << head_dim << ", Causal=" << is_causal << "] "
              << "A0..A6 Parity: OK (max_abs=" << m6.max_abs << ", cosine=" << m6.cosine << ")\n";
}

// -----------------------------------------------------------------------------
// Test Case 2: Deterministic Execution Under Fixed Threads
// -----------------------------------------------------------------------------
static void test_deterministic_parallelism() {
    std::cout << "--- Testing Deterministic Parallelism (Fixed Threads) ---\n";
    constexpr size_t S = 64;
    constexpr size_t num_heads = 20;
    constexpr size_t num_kv_heads = 5;
    constexpr size_t head_dim = 128;
    float scale = 1.0f / std::sqrt(128.0f);

    size_t q_count = S * num_heads * head_dim;
    size_t kv_count = S * num_kv_heads * head_dim;
    std::vector<float> Q(q_count);
    std::vector<float> K(kv_count);
    std::vector<float> V(kv_count);
    fill_synthetic(Q.data(), q_count, -1.0f, 1.0f, 100);
    fill_synthetic(K.data(), kv_count, -1.0f, 1.0f, 200);
    fill_synthetic(V.data(), kv_count, -1.0f, 1.0f, 300);

    std::vector<float> O_run1(q_count, 0.0f);
    std::vector<float> O_run2(q_count, 0.0f);

    AttentionTileConfig cfg{4, 32};
    run_attention_stage(AttentionStage::A6_GQAParallel, Q.data(), K.data(), V.data(), O_run1.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim, cfg, 4);

    run_attention_stage(AttentionStage::A6_GQAParallel, Q.data(), K.data(), V.data(), O_run2.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim, cfg, 4);

    int cmp = std::memcmp(O_run1.data(), O_run2.data(), q_count * sizeof(float));
    if (cmp != 0) {
        std::cerr << "FAIL: Fixed-thread parallel execution must be bit-for-bit deterministic!\n";
        std::abort();
    }
    std::cout << "  Deterministic Fixed-Thread Parity: OK (memcmp == 0)\n";
}

// -----------------------------------------------------------------------------
// Test Case 3: Causal Masking Integrity (Perturbing Future Keys)
// -----------------------------------------------------------------------------
static void test_causal_integrity() {
    std::cout << "--- Testing Causal Masking Strict Boundary Invariant ---\n";
    constexpr size_t S = 32;
    constexpr size_t num_heads = 4;
    constexpr size_t num_kv_heads = 2;
    constexpr size_t head_dim = 64;
    float scale = 1.0f / std::sqrt(64.0f);

    size_t q_count = S * num_heads * head_dim;
    size_t kv_count = S * num_kv_heads * head_dim;
    std::vector<float> Q(q_count);
    std::vector<float> K1(kv_count), K2(kv_count);
    std::vector<float> V1(kv_count), V2(kv_count);

    fill_synthetic(Q.data(), q_count, -1.0f, 1.0f, 777);
    fill_synthetic(K1.data(), kv_count, -1.0f, 1.0f, 888);
    fill_synthetic(V1.data(), kv_count, -1.0f, 1.0f, 999);
    K2 = K1;
    V2 = V1;

    // Mutate future tokens j >= 10 in K2, V2
    for (size_t j = 10; j < S; ++j) {
        for (size_t d = 0; d < num_kv_heads * head_dim; ++d) {
            K2[j * num_kv_heads * head_dim + d] += 50.0f;
            V2[j * num_kv_heads * head_dim + d] -= 50.0f;
        }
    }

    std::vector<float> O1(q_count, 0.0f);
    std::vector<float> O2(q_count, 0.0f);

    run_attention_stage(AttentionStage::A5_2DTiled, Q.data(), K1.data(), V1.data(), O1.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    run_attention_stage(AttentionStage::A5_2DTiled, Q.data(), K2.data(), V2.data(), O2.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    // For queries i < 10, O1 and O2 MUST be identical!
    for (size_t i = 0; i < 10; ++i) {
        for (size_t h = 0; h < num_heads; ++h) {
            for (size_t d = 0; d < head_dim; ++d) {
                float v1 = O1[(i * num_heads + h) * head_dim + d];
                float v2 = O2[(i * num_heads + h) * head_dim + d];
                if (std::fabs(v1 - v2) >= 1e-6f) {
                    std::cerr << "FAIL: Future key corruption leaked into past query!\n";
                    std::abort();
                }
            }
        }
    }
    std::cout << "  Causal Isolation Invariant for i < 10: OK\n";
}

// -----------------------------------------------------------------------------
// Test Case 4: Adversarial Inputs (Extreme Scores, Negative, Equal)
// -----------------------------------------------------------------------------
static void test_adversarial_suite() {
    std::cout << "--- Testing Adversarial Numerical Cases ---\n";
    constexpr size_t S = 16;
    constexpr size_t num_heads = 4;
    constexpr size_t num_kv_heads = 1;
    constexpr size_t head_dim = 64;
    float scale = 1.0f / std::sqrt(64.0f);

    size_t q_count = S * num_heads * head_dim;
    size_t kv_count = S * num_kv_heads * head_dim;
    std::vector<float> Q(q_count, 0.0f);
    std::vector<float> K(kv_count, 0.0f);
    std::vector<float> V(kv_count, 1.0f);
    std::vector<float> O_ref(q_count, 0.0f);
    std::vector<float> O_opt(q_count, 0.0f);

    // Case 4.1: Extreme positive/negative scores (+50 and -50)
    for (size_t i = 0; i < q_count; ++i) Q[i] = (i % 2 == 0) ? 10.0f : -10.0f;
    for (size_t i = 0; i < kv_count; ++i) K[i] = (i % 2 == 0) ? 5.0f : -5.0f;

    run_attention_stage(AttentionStage::A0_ScalarReference, Q.data(), K.data(), V.data(), O_ref.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    run_attention_stage(AttentionStage::A4_FusedSIMD, Q.data(), K.data(), V.data(), O_opt.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    auto m = evaluate_parity(O_ref.data(), O_opt.data(), q_count);
    assert(!m.has_nan_inf && m.max_abs < 1e-4f);
    std::cout << "  Adversarial Extreme Scores (+-50): OK (max_abs=" << m.max_abs << ")\n";

    // Case 4.2: Large negative scores (all -100.0f)
    for (size_t i = 0; i < q_count; ++i) Q[i] = -20.0f;
    for (size_t i = 0; i < kv_count; ++i) K[i] = 10.0f;

    run_attention_stage(AttentionStage::A0_ScalarReference, Q.data(), K.data(), V.data(), O_ref.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    run_attention_stage(AttentionStage::A4_FusedSIMD, Q.data(), K.data(), V.data(), O_opt.data(),
                        S, S, num_heads, num_kv_heads, head_dim, scale, true, num_kv_heads * head_dim, num_kv_heads * head_dim);

    m = evaluate_parity(O_ref.data(), O_opt.data(), q_count);
    assert(!m.has_nan_inf && m.max_abs < 1e-4f);
    std::cout << "  Adversarial Large Negative Scores: OK (max_abs=" << m.max_abs << ")\n";
}

void test_attention_parity_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  GATE 7.5 TIER 1: MULTI-DIMENSIONAL ATTENTION PARITY MATRIX       \n";
    std::cout << "  Verifying Stages A0 -> A1 -> A2 -> A3 -> A4 -> A5 -> A6           \n";
    std::cout << "===================================================================\n";

    // S in {16, 64, 256, 512, 1024, 2048}
    test_attention_ladder_case(16, 4, 2, 64, true, 1);
    test_attention_ladder_case(16, 4, 2, 64, false, 2);
    test_attention_ladder_case(64, 16, 4, 128, true, 3);
    test_attention_ladder_case(64, 16, 4, 128, false, 4);
    test_attention_ladder_case(256, 20, 5, 128, true, 5);
    test_attention_ladder_case(512, 20, 5, 128, true, 6);
    test_attention_ladder_case(1024, 20, 5, 128, true, 7);
    test_attention_ladder_case(2048, 20, 5, 128, true, 8);

    test_deterministic_parallelism();
    test_causal_integrity();
    test_adversarial_suite();

    std::cout << ">>> ALL 7-STAGE ATTENTION LADDER & ADVERSARIAL TESTS PASSED! <<<\n";
}

} // namespace setun::test
