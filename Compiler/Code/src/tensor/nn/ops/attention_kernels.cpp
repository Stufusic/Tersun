#include "tensor/nn/ops/attention_kernels.hpp"
#include <cstring>
#include <vector>

#if defined(_OPENMP)
#include <omp.h>
#endif

namespace setun::tensor::nn::ops {

// ============================================================================
// Microkernel Implementations
// ============================================================================

float vec_dot_product_scalar(const float* a, const float* b, size_t dim) noexcept {
    float sum = 0.0f;
    for (size_t d = 0; d < dim; ++d) {
        sum += a[d] * b[d];
    }
    return sum;
}

float vec_dot_product_avx2_4chain(const float* a, const float* b, size_t dim) noexcept {
#if defined(__AVX2__)
    __m256 acc0 = _mm256_setzero_ps();
    __m256 acc1 = _mm256_setzero_ps();
    __m256 acc2 = _mm256_setzero_ps();
    __m256 acc3 = _mm256_setzero_ps();

    size_t d = 0;
    // Unrolled 32 floats (4 independent 8-float FMA chains) to saturate execution ports
    for (; d + 32 <= dim; d += 32) {
        __m256 a0 = _mm256_loadu_ps(a + d + 0);
        __m256 b0 = _mm256_loadu_ps(b + d + 0);
        acc0 = _mm256_fmadd_ps(a0, b0, acc0);

        __m256 a1 = _mm256_loadu_ps(a + d + 8);
        __m256 b1 = _mm256_loadu_ps(b + d + 8);
        acc1 = _mm256_fmadd_ps(a1, b1, acc1);

        __m256 a2 = _mm256_loadu_ps(a + d + 16);
        __m256 b2 = _mm256_loadu_ps(b + d + 16);
        acc2 = _mm256_fmadd_ps(a2, b2, acc2);

        __m256 a3 = _mm256_loadu_ps(a + d + 24);
        __m256 b3 = _mm256_loadu_ps(b + d + 24);
        acc3 = _mm256_fmadd_ps(a3, b3, acc3);
    }

    acc0 = _mm256_add_ps(_mm256_add_ps(acc0, acc1), _mm256_add_ps(acc2, acc3));

    // Remainder 8 floats
    for (; d + 8 <= dim; d += 8) {
        __m256 a0 = _mm256_loadu_ps(a + d);
        __m256 b0 = _mm256_loadu_ps(b + d);
        acc0 = _mm256_fmadd_ps(a0, b0, acc0);
    }

    // Horizontal reduction of acc0
    __m128 lo = _mm256_castps256_ps128(acc0);
    __m128 hi = _mm256_extractf128_ps(acc0, 1);
    __m128 sum128 = _mm_add_ps(lo, hi);
    sum128 = _mm_hadd_ps(sum128, sum128);
    sum128 = _mm_hadd_ps(sum128, sum128);
    float total = _mm_cvtss_f32(sum128);

    // Remainder scalar fallback (< 8 floats)
    for (; d < dim; ++d) {
        total += a[d] * b[d];
    }
    return total;
#else
    return vec_dot_product_scalar(a, b, dim);
#endif
}

void vec_fma_scale_add_scalar(float* O, float alpha, float p, const float* V, size_t dim) noexcept {
    for (size_t d = 0; d < dim; ++d) {
        O[d] = O[d] * alpha + p * V[d];
    }
}

void vec_fma_scale_add_avx2(float* O, float alpha, float p, const float* V, size_t dim) noexcept {
#if defined(__AVX2__)
    __m256 valpha = _mm256_set1_ps(alpha);
    __m256 vp = _mm256_set1_ps(p);
    size_t d = 0;
    // Unrolled 16 floats (2 x 8-float FMA instructions)
    for (; d + 16 <= dim; d += 16) {
        __m256 o0 = _mm256_loadu_ps(O + d);
        __m256 o1 = _mm256_loadu_ps(O + d + 8);
        __m256 v0 = _mm256_loadu_ps(V + d);
        __m256 v1 = _mm256_loadu_ps(V + d + 8);

        o0 = _mm256_fmadd_ps(o0, valpha, _mm256_mul_ps(vp, v0));
        o1 = _mm256_fmadd_ps(o1, valpha, _mm256_mul_ps(vp, v1));

        _mm256_storeu_ps(O + d, o0);
        _mm256_storeu_ps(O + d + 8, o1);
    }
    for (; d + 8 <= dim; d += 8) {
        __m256 o0 = _mm256_loadu_ps(O + d);
        __m256 v0 = _mm256_loadu_ps(V + d);
        o0 = _mm256_fmadd_ps(o0, valpha, _mm256_mul_ps(vp, v0));
        _mm256_storeu_ps(O + d, o0);
    }
    for (; d < dim; ++d) {
        O[d] = O[d] * alpha + p * V[d];
    }
#else
    vec_fma_scale_add_scalar(O, alpha, p, V, dim);
#endif
}

// ============================================================================
// Tile-Level Online Accumulator Step
// ============================================================================

void attention_tile_step(
    const float* q_vec,
    const float* k_base,
    const float* v_base,
    size_t k_stride,
    size_t v_stride,
    size_t key_begin,
    size_t key_end,
    float scale,
    size_t head_dim,
    float* out_acc,
    float& out_m,
    float& out_l,
    bool simd_qk,
    bool simd_pv
) noexcept {
    for (size_t j = key_begin; j < key_end; ++j) {
        const float* k_vec = k_base + j * k_stride;
        const float* v_vec = v_base + j * v_stride;

        float s_j = 0.0f;
        if (simd_qk) {
            s_j = vec_dot_product_avx2_4chain(q_vec, k_vec, head_dim) * scale;
        } else {
            s_j = vec_dot_product_scalar(q_vec, k_vec, head_dim) * scale;
        }

        float m_new = (s_j > out_m) ? s_j : out_m;
        float alpha = std::exp(out_m - m_new);
        float p = std::exp(s_j - m_new);

        out_l = out_l * alpha + p;
        if (simd_pv) {
            vec_fma_scale_add_avx2(out_acc, alpha, p, v_vec, head_dim);
        } else {
            vec_fma_scale_add_scalar(out_acc, alpha, p, v_vec, head_dim);
        }
        out_m = m_new;
    }
}

static inline void finalize_online_attention(
    float* out_acc,
    float l,
    size_t head_dim,
    bool simd
) noexcept {
    if (l > 1e-12f) {
        float inv_l = 1.0f / l;
        if (simd) {
#if defined(__AVX2__)
            __m256 vinv = _mm256_set1_ps(inv_l);
            size_t d = 0;
            for (; d + 8 <= head_dim; d += 8) {
                __m256 v = _mm256_loadu_ps(out_acc + d);
                _mm256_storeu_ps(out_acc + d, _mm256_mul_ps(v, vinv));
            }
            for (; d < head_dim; ++d) {
                out_acc[d] *= inv_l;
            }
            return;
#endif
        }
        for (size_t d = 0; d < head_dim; ++d) {
            out_acc[d] *= inv_l;
        }
    } else {
        std::memset(out_acc, 0, head_dim * sizeof(float));
    }
}

// ============================================================================
// Stage A0: Scalar Reference (2-pass Softmax with causal mask)
// ============================================================================

void compute_attention_a0_scalar_reference(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t i = 0; i < num_queries; ++i) {
            const float* q_vec = q + (i * num_heads + h) * head_dim;
            float* out_vec = out_ctx + (i * num_heads + h) * head_dim;
            size_t key_limit = is_causal ? std::min(total_keys, i + 1) : total_keys;

            // Pass 1: Find max
            float max_val = -1e30f;
            for (size_t j = 0; j < key_limit; ++j) {
                const float* k_vec = k_head + j * k_token_stride;
                float dot = vec_dot_product_scalar(q_vec, k_vec, head_dim) * scale;
                if (dot > max_val) max_val = dot;
            }

            // Pass 2: Sum exp
            float sum_exp = 0.0f;
            for (size_t j = 0; j < key_limit; ++j) {
                const float* k_vec = k_head + j * k_token_stride;
                float dot = vec_dot_product_scalar(q_vec, k_vec, head_dim) * scale;
                sum_exp += std::exp(dot - max_val);
            }

            // Pass 3: Weighted sum
            std::memset(out_vec, 0, head_dim * sizeof(float));
            if (sum_exp > 1e-12f) {
                float inv_sum = 1.0f / sum_exp;
                for (size_t j = 0; j < key_limit; ++j) {
                    const float* k_vec = k_head + j * k_token_stride;
                    const float* v_vec = v_head + j * v_token_stride;
                    float dot = vec_dot_product_scalar(q_vec, k_vec, head_dim) * scale;
                    float prob = std::exp(dot - max_val) * inv_sum;
                    for (size_t d = 0; d < head_dim; ++d) {
                        out_vec[d] += prob * v_vec[d];
                    }
                }
            }
        }
    }
}

// ============================================================================
// Stage A1: Scalar Online Attention
// ============================================================================

void compute_attention_a1_scalar_online(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t i = 0; i < num_queries; ++i) {
            const float* q_vec = q + (i * num_heads + h) * head_dim;
            float* out_vec = out_ctx + (i * num_heads + h) * head_dim;
            size_t key_limit = is_causal ? std::min(total_keys, i + 1) : total_keys;

            std::memset(out_vec, 0, head_dim * sizeof(float));
            float m = -1e30f;
            float l = 0.0f;

            attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                0, key_limit, scale, head_dim, out_vec, m, l, false, false);
            finalize_online_attention(out_vec, l, head_dim, false);
        }
    }
}

// ============================================================================
// Stage A2: AVX2 QK Vector Dot Product
// ============================================================================

void compute_attention_a2_simd_qk(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t i = 0; i < num_queries; ++i) {
            const float* q_vec = q + (i * num_heads + h) * head_dim;
            float* out_vec = out_ctx + (i * num_heads + h) * head_dim;
            size_t key_limit = is_causal ? std::min(total_keys, i + 1) : total_keys;

            std::memset(out_vec, 0, head_dim * sizeof(float));
            float m = -1e30f;
            float l = 0.0f;

            attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                0, key_limit, scale, head_dim, out_vec, m, l, true, false);
            finalize_online_attention(out_vec, l, head_dim, false);
        }
    }
}

// ============================================================================
// Stage A3: AVX2 PV Rescale & Accumulator
// ============================================================================

void compute_attention_a3_simd_pv(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t i = 0; i < num_queries; ++i) {
            const float* q_vec = q + (i * num_heads + h) * head_dim;
            float* out_vec = out_ctx + (i * num_heads + h) * head_dim;
            size_t key_limit = is_causal ? std::min(total_keys, i + 1) : total_keys;

            std::memset(out_vec, 0, head_dim * sizeof(float));
            float m = -1e30f;
            float l = 0.0f;

            attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                0, key_limit, scale, head_dim, out_vec, m, l, false, true);
            finalize_online_attention(out_vec, l, head_dim, true);
        }
    }
}

// ============================================================================
// Stage A4: Fused Online SIMD
// ============================================================================

void compute_attention_a4_fused_simd(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t i = 0; i < num_queries; ++i) {
            const float* q_vec = q + (i * num_heads + h) * head_dim;
            float* out_vec = out_ctx + (i * num_heads + h) * head_dim;
            size_t key_limit = is_causal ? std::min(total_keys, i + 1) : total_keys;

            std::memset(out_vec, 0, head_dim * sizeof(float));
            float m = -1e30f;
            float l = 0.0f;

            attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                0, key_limit, scale, head_dim, out_vec, m, l, true, true);
            finalize_online_attention(out_vec, l, head_dim, true);
        }
    }
}

// ============================================================================
// Stage A5: 2D Query-Key Tiling (Bq x Bc)
// ============================================================================

void compute_attention_a5_2d_tiled(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    AttentionTileConfig tile_cfg,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t Bq = (tile_cfg.query_block > 0) ? tile_cfg.query_block : 4;
    size_t Bc = (tile_cfg.key_block > 0) ? tile_cfg.key_block : 32;

    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    // Stack scratch buffers for running statistics of query block (max Bq=16)
    float m_block[16];
    float l_block[16];

    for (size_t h = 0; h < num_heads; ++h) {
        size_t kv_h = h / gqa_ratio;
        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        for (size_t q_b = 0; q_b < num_queries; q_b += Bq) {
            size_t q_end = std::min(num_queries, q_b + Bq);
            size_t actual_bq = q_end - q_b;

            for (size_t b = 0; b < actual_bq; ++b) {
                m_block[b] = -1e30f;
                l_block[b] = 0.0f;
                float* out_vec = out_ctx + ((q_b + b) * num_heads + h) * head_dim;
                std::memset(out_vec, 0, head_dim * sizeof(float));
            }

            // Tile across Key/Value blocks Bc
            for (size_t k_b = 0; k_b < total_keys; k_b += Bc) {
                size_t k_end = std::min(total_keys, k_b + Bc);

                for (size_t b = 0; b < actual_bq; ++b) {
                    size_t query_pos = q_b + b;
                    if (is_causal && k_b > query_pos) continue;

                    size_t cur_k_end = is_causal ? std::min(k_end, query_pos + 1) : k_end;
                    if (cur_k_end <= k_b) continue;

                    const float* q_vec = q + (query_pos * num_heads + h) * head_dim;
                    float* out_vec = out_ctx + (query_pos * num_heads + h) * head_dim;

                    attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                        k_b, cur_k_end, scale, head_dim, out_vec, m_block[b], l_block[b], true, true);
                }
            }

            for (size_t b = 0; b < actual_bq; ++b) {
                float* out_vec = out_ctx + ((q_b + b) * num_heads + h) * head_dim;
                finalize_online_attention(out_vec, l_block[b], head_dim, true);
            }
        }
    }
}

// ============================================================================
// Stage A6: GQA-Aware Parallel Attention
// ============================================================================

void compute_attention_a6_gqa_parallel(
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    AttentionTileConfig tile_cfg,
    uint32_t num_threads,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    size_t gqa_ratio = num_heads / num_kv_heads;
    size_t Bq = (tile_cfg.query_block > 0) ? tile_cfg.query_block : 4;
    size_t Bc = (tile_cfg.key_block > 0) ? tile_cfg.key_block : 32;

    size_t k_h_stride = (k_head_stride > 0) ? k_head_stride : head_dim;
    size_t v_h_stride = (v_head_stride > 0) ? v_head_stride : head_dim;

    int nthreads = (num_threads > 0) ? static_cast<int>(num_threads) : 1;

    // Decode Mode (num_queries == 1): Parallel across Heads with static schedule
    if (num_queries == 1) {
#if defined(_OPENMP)
        #pragma omp parallel for schedule(static) num_threads(nthreads)
#endif
        for (int64_t h_idx = 0; h_idx < static_cast<int64_t>(num_heads); ++h_idx) {
            size_t h = static_cast<size_t>(h_idx);
            size_t kv_h = h / gqa_ratio;
            const float* k_head = k + kv_h * k_h_stride;
            const float* v_head = v + kv_h * v_h_stride;

            const float* q_vec = q + h * head_dim;
            float* out_vec = out_ctx + h * head_dim;

            std::memset(out_vec, 0, head_dim * sizeof(float));
            float m = -1e30f;
            float l = 0.0f;

            attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                0, total_keys, scale, head_dim, out_vec, m, l, true, true);
            finalize_online_attention(out_vec, l, head_dim, true);
        }
        return;
    }

    // Prefill Mode (num_queries > 1): GQA Work Units (KV Head x Q Group x Query Blocks)
    // Parallelize across KV Head x Query Blocks
    size_t num_q_blocks = (num_queries + Bq - 1) / Bq;
    int64_t total_work_units = static_cast<int64_t>(num_kv_heads * num_q_blocks);

#if defined(_OPENMP)
    #pragma omp parallel for schedule(dynamic, 1) num_threads(nthreads)
#endif
    for (int64_t work_idx = 0; work_idx < total_work_units; ++work_idx) {
        size_t kv_h = static_cast<size_t>(work_idx / num_q_blocks);
        size_t q_block_idx = static_cast<size_t>(work_idx % num_q_blocks);

        size_t q_b = q_block_idx * Bq;
        size_t q_end = std::min(num_queries, q_b + Bq);
        size_t actual_bq = q_end - q_b;

        size_t q_head_start = kv_h * gqa_ratio;
        size_t q_head_end = q_head_start + gqa_ratio;

        const float* k_head = k + kv_h * k_h_stride;
        const float* v_head = v + kv_h * v_h_stride;

        // For all Q heads belonging to this GQA Group
        for (size_t h = q_head_start; h < q_head_end; ++h) {
            float m_block[16];
            float l_block[16];

            for (size_t b = 0; b < actual_bq; ++b) {
                m_block[b] = -1e30f;
                l_block[b] = 0.0f;
                float* out_vec = out_ctx + ((q_b + b) * num_heads + h) * head_dim;
                std::memset(out_vec, 0, head_dim * sizeof(float));
            }

            // Tile across Key/Value blocks Bc
            for (size_t k_b = 0; k_b < total_keys; k_b += Bc) {
                size_t k_end = std::min(total_keys, k_b + Bc);

                for (size_t b = 0; b < actual_bq; ++b) {
                    size_t query_pos = q_b + b;
                    if (is_causal && k_b > query_pos) continue;

                    size_t cur_k_end = is_causal ? std::min(k_end, query_pos + 1) : k_end;
                    if (cur_k_end <= k_b) continue;

                    const float* q_vec = q + (query_pos * num_heads + h) * head_dim;
                    float* out_vec = out_ctx + (query_pos * num_heads + h) * head_dim;

                    attention_tile_step(q_vec, k_head, v_head, k_token_stride, v_token_stride,
                                        k_b, cur_k_end, scale, head_dim, out_vec, m_block[b], l_block[b], true, true);
                }
            }

            for (size_t b = 0; b < actual_bq; ++b) {
                float* out_vec = out_ctx + ((q_b + b) * num_heads + h) * head_dim;
                finalize_online_attention(out_vec, l_block[b], head_dim, true);
            }
        }
    }
}

// ============================================================================
// Unified Dispatcher
// ============================================================================

void run_attention_stage(
    AttentionStage stage,
    const float* q,
    const float* k,
    const float* v,
    float* out_ctx,
    size_t num_queries,
    size_t total_keys,
    size_t num_heads,
    size_t num_kv_heads,
    size_t head_dim,
    float scale,
    bool is_causal,
    size_t k_token_stride,
    size_t v_token_stride,
    AttentionTileConfig tile_cfg,
    uint32_t num_threads,
    size_t k_head_stride,
    size_t v_head_stride
) noexcept {
    switch (stage) {
        case AttentionStage::A0_ScalarReference:
            compute_attention_a0_scalar_reference(q, k, v, out_ctx, num_queries, total_keys,
                                                  num_heads, num_kv_heads, head_dim, scale, is_causal,
                                                  k_token_stride, v_token_stride, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A1_ScalarOnline:
            compute_attention_a1_scalar_online(q, k, v, out_ctx, num_queries, total_keys,
                                               num_heads, num_kv_heads, head_dim, scale, is_causal,
                                               k_token_stride, v_token_stride, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A2_SimdQK:
            compute_attention_a2_simd_qk(q, k, v, out_ctx, num_queries, total_keys,
                                         num_heads, num_kv_heads, head_dim, scale, is_causal,
                                         k_token_stride, v_token_stride, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A3_SimdPV:
            compute_attention_a3_simd_pv(q, k, v, out_ctx, num_queries, total_keys,
                                         num_heads, num_kv_heads, head_dim, scale, is_causal,
                                         k_token_stride, v_token_stride, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A4_FusedSIMD:
            compute_attention_a4_fused_simd(q, k, v, out_ctx, num_queries, total_keys,
                                            num_heads, num_kv_heads, head_dim, scale, is_causal,
                                            k_token_stride, v_token_stride, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A5_2DTiled:
            compute_attention_a5_2d_tiled(q, k, v, out_ctx, num_queries, total_keys,
                                          num_heads, num_kv_heads, head_dim, scale, is_causal,
                                          k_token_stride, v_token_stride, tile_cfg, k_head_stride, v_head_stride);
            break;
        case AttentionStage::A6_GQAParallel:
            compute_attention_a6_gqa_parallel(q, k, v, out_ctx, num_queries, total_keys,
                                              num_heads, num_kv_heads, head_dim, scale, is_causal,
                                              k_token_stride, v_token_stride, tile_cfg, num_threads, k_head_stride, v_head_stride);
            break;
    }
}

} // namespace setun::tensor::nn::ops
