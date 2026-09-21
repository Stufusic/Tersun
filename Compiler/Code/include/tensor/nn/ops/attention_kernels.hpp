#pragma once

#include <cstddef>
#include <cstdint>
#include <cmath>
#include <algorithm>

#if defined(__x86_64__) || defined(_M_X64)
#include <immintrin.h>
#endif

namespace setun::tensor::nn::ops {

// ============================================================================
// Attention Tile Configurations & Stages (A0 -> A6)
// ============================================================================

enum class AttentionStage : uint8_t {
    A0_ScalarReference = 0,
    A1_ScalarOnline    = 1,
    A2_SimdQK          = 2,
    A3_SimdPV          = 3,
    A4_FusedSIMD       = 4,
    A5_2DTiled         = 5,
    A6_GQAParallel     = 6
};

struct AttentionTileConfig {
    size_t query_block{4};   // Bq: queries processed together in 2D Tiling (Prefill)
    size_t key_block{32};    // Bc: keys/values loaded into L1 (32 * 128 * 4 * 2 = 32 KB <= L1)
};

struct AttentionTile {
    const float* q{nullptr};
    const float* k_base{nullptr};
    const float* v_base{nullptr};
    size_t query_pos{0};
    size_t key_begin{0};
    size_t key_end{0};       // Explicit boundary: key_end = is_causal ? (query_pos + 1) : total_keys
    size_t k_stride{0};      // Float stride between consecutive tokens for K
    size_t v_stride{0};      // Float stride between consecutive tokens for V
};

// ============================================================================
// Microkernel Ladder
// ============================================================================

// A0 Reference: Scalar dot product
float vec_dot_product_scalar(const float* a, const float* b, size_t dim) noexcept;

// A2: AVX2 4-Chain Independent FMA Dot Product (unrolled 32-wide + remainder)
float vec_dot_product_avx2_4chain(const float* a, const float* b, size_t dim) noexcept;

// A0 Reference: Scalar rescale + weighted sum (O = O * alpha + p * V)
void vec_fma_scale_add_scalar(float* O, float alpha, float p, const float* V, size_t dim) noexcept;

// A3: AVX2 FMA Rescale & Weighted Accumulator (unrolled 16-wide + remainder)
void vec_fma_scale_add_avx2(float* O, float alpha, float p, const float* V, size_t dim) noexcept;

// Microkernel Dispatchers
inline float vec_dot_product(const float* a, const float* b, size_t dim, bool use_avx2) noexcept {
#if defined(__AVX2__)
    return use_avx2 ? vec_dot_product_avx2_4chain(a, b, dim) : vec_dot_product_scalar(a, b, dim);
#else
    (void)use_avx2;
    return vec_dot_product_scalar(a, b, dim);
#endif
}

inline void vec_fma_scale_add(float* O, float alpha, float p, const float* V, size_t dim, bool use_avx2) noexcept {
#if defined(__AVX2__)
    if (use_avx2) {
        vec_fma_scale_add_avx2(O, alpha, p, V, dim);
    } else {
        vec_fma_scale_add_scalar(O, alpha, p, V, dim);
    }
#else
    (void)use_avx2;
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
) noexcept;

// ============================================================================
// Complete 7-Stage Attention Ladder Implementations
// ============================================================================

// Stage A0: Scalar Reference (2-pass Softmax with causal mask)
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
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A1: Scalar Online Attention (1-pass FlashAttention core, O(1) score scratch)
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
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A2: AVX2 QK Vector Dot Product (A1 + A2)
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
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A3: AVX2 PV Rescale & Accumulator (A1 + A3)
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
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A4: Fused Online SIMD (A1 + A2 + A3)
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
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A5: 2D Query-Key Tiling (Bq x Bc)
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
    AttentionTileConfig tile_cfg = {4, 32},
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Stage A6: GQA-Aware Parallel Attention (Work Unit = KV Head x Q Group x Query Block)
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
    AttentionTileConfig tile_cfg = {4, 32},
    uint32_t num_threads = 0,
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

// Unified Dispatcher for Testing and Execution
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
    AttentionTileConfig tile_cfg = {4, 32},
    uint32_t num_threads = 0,
    size_t k_head_stride = 0,
    size_t v_head_stride = 0
) noexcept;

} // namespace setun::tensor::nn::ops
