#include "tensor/kernels/microkernels.hpp"
#include "runtime/kernel_registry.hpp"
#include <immintrin.h>
#include <algorithm>
#include <cstring>

namespace setun::tensor::kernels {

alignas(16) static const int32_t TRIT_LUT_INT32[4] = {0, 1, -1, 0};

inline int32_t hsum_epi32_avx2(__m256i v) {
    __m128i vlow = _mm256_castsi256_si128(v);
    __m128i vhigh = _mm256_extracti128_si256(v, 1);
    __m128i sum128 = _mm_add_epi32(vlow, vhigh);
    sum128 = _mm_hadd_epi32(sum128, sum128);
    sum128 = _mm_hadd_epi32(sum128, sum128);
    return _mm_cvtsi128_si32(sum128);
}

// ============================================================================
// AVX2 K0: Ternary Decode
// ============================================================================
void decode_trits_avx2(const uint8_t* packed, int8_t* out_unpacked, size_t count) {
    // Process 16 trits (4 bytes) per batch using AVX2/SSE
    size_t i = 0;
    while (i + 16 <= count) {
        uint32_t chunk = *reinterpret_cast<const uint32_t*>(packed + (i / TRITS_PER_BYTE));
        for (size_t t = 0; t < 16; ++t) {
            uint8_t code = (chunk >> (t * 2)) & 0b11;
            out_unpacked[i + t] = decode_trit(code);
        }
        i += 16;
    }

    // Remainder scalar fallback
    while (i < count) {
        size_t byte_idx = i / TRITS_PER_BYTE;
        size_t pos = i % TRITS_PER_BYTE;
        out_unpacked[i] = unpack_trit_at(packed[byte_idx], pos);
        i++;
    }
}

// ============================================================================
// AVX2 K2: Dot Product with Packed Ternary
// Uses _mm256_sign_epi32 (VPSIGND) for 1-cycle multiplication-free ternary weighting
// ============================================================================
int32_t dot_product_packed_avx2(const int32_t* vec, const uint8_t* packed_w, size_t K) {
    __m256i acc0 = _mm256_setzero_si256();
    __m256i acc1 = _mm256_setzero_si256();
    __m256i acc2 = _mm256_setzero_si256();
    __m256i acc3 = _mm256_setzero_si256();

    size_t k = 0;
    // Process 32 elements per iteration (4 x 8 elements, 8 bytes of packed weights)
    while (k + 32 <= K) {
        size_t byte_off = k / TRITS_PER_BYTE;

        // Sub-block 0 (elements k + 0 .. k + 7, bytes 0..1)
        uint16_t w0 = *reinterpret_cast<const uint16_t*>(packed_w + byte_off + 0);
        __m256i s0 = _mm256_setr_epi32(
            TRIT_LUT_INT32[(w0 >> 0) & 3],  TRIT_LUT_INT32[(w0 >> 2) & 3],
            TRIT_LUT_INT32[(w0 >> 4) & 3],  TRIT_LUT_INT32[(w0 >> 6) & 3],
            TRIT_LUT_INT32[(w0 >> 8) & 3],  TRIT_LUT_INT32[(w0 >> 10) & 3],
            TRIT_LUT_INT32[(w0 >> 12) & 3], TRIT_LUT_INT32[(w0 >> 14) & 3]
        );
        __m256i v0 = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(vec + k + 0));
        acc0 = _mm256_add_epi32(acc0, _mm256_sign_epi32(v0, s0));

        // Sub-block 1 (elements k + 8 .. k + 15, bytes 2..3)
        uint16_t w1 = *reinterpret_cast<const uint16_t*>(packed_w + byte_off + 2);
        __m256i s1 = _mm256_setr_epi32(
            TRIT_LUT_INT32[(w1 >> 0) & 3],  TRIT_LUT_INT32[(w1 >> 2) & 3],
            TRIT_LUT_INT32[(w1 >> 4) & 3],  TRIT_LUT_INT32[(w1 >> 6) & 3],
            TRIT_LUT_INT32[(w1 >> 8) & 3],  TRIT_LUT_INT32[(w1 >> 10) & 3],
            TRIT_LUT_INT32[(w1 >> 12) & 3], TRIT_LUT_INT32[(w1 >> 14) & 3]
        );
        __m256i v1 = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(vec + k + 8));
        acc1 = _mm256_add_epi32(acc1, _mm256_sign_epi32(v1, s1));

        // Sub-block 2 (elements k + 16 .. k + 23, bytes 4..5)
        uint16_t w2 = *reinterpret_cast<const uint16_t*>(packed_w + byte_off + 4);
        __m256i s2 = _mm256_setr_epi32(
            TRIT_LUT_INT32[(w2 >> 0) & 3],  TRIT_LUT_INT32[(w2 >> 2) & 3],
            TRIT_LUT_INT32[(w2 >> 4) & 3],  TRIT_LUT_INT32[(w2 >> 6) & 3],
            TRIT_LUT_INT32[(w2 >> 8) & 3],  TRIT_LUT_INT32[(w2 >> 10) & 3],
            TRIT_LUT_INT32[(w2 >> 12) & 3], TRIT_LUT_INT32[(w2 >> 14) & 3]
        );
        __m256i v2 = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(vec + k + 16));
        acc2 = _mm256_add_epi32(acc2, _mm256_sign_epi32(v2, s2));

        // Sub-block 3 (elements k + 24 .. k + 31, bytes 6..7)
        uint16_t w3 = *reinterpret_cast<const uint16_t*>(packed_w + byte_off + 6);
        __m256i s3 = _mm256_setr_epi32(
            TRIT_LUT_INT32[(w3 >> 0) & 3],  TRIT_LUT_INT32[(w3 >> 2) & 3],
            TRIT_LUT_INT32[(w3 >> 4) & 3],  TRIT_LUT_INT32[(w3 >> 6) & 3],
            TRIT_LUT_INT32[(w3 >> 8) & 3],  TRIT_LUT_INT32[(w3 >> 10) & 3],
            TRIT_LUT_INT32[(w3 >> 12) & 3], TRIT_LUT_INT32[(w3 >> 14) & 3]
        );
        __m256i v3 = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(vec + k + 24));
        acc3 = _mm256_add_epi32(acc3, _mm256_sign_epi32(v3, s3));

        k += 32;
    }

    // Process remaining 8-element blocks
    while (k + 8 <= K) {
        size_t byte_off = k / TRITS_PER_BYTE;
        uint16_t w = *reinterpret_cast<const uint16_t*>(packed_w + byte_off);
        __m256i s = _mm256_setr_epi32(
            TRIT_LUT_INT32[(w >> 0) & 3],  TRIT_LUT_INT32[(w >> 2) & 3],
            TRIT_LUT_INT32[(w >> 4) & 3],  TRIT_LUT_INT32[(w >> 6) & 3],
            TRIT_LUT_INT32[(w >> 8) & 3],  TRIT_LUT_INT32[(w >> 10) & 3],
            TRIT_LUT_INT32[(w >> 12) & 3], TRIT_LUT_INT32[(w >> 14) & 3]
        );
        __m256i v = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(vec + k));
        acc0 = _mm256_add_epi32(acc0, _mm256_sign_epi32(v, s));
        k += 8;
    }

    __m256i sum_all = _mm256_add_epi32(_mm256_add_epi32(acc0, acc1),
                                       _mm256_add_epi32(acc2, acc3));
    int32_t total = hsum_epi32_avx2(sum_all);

    // Scalar fallback for remaining elements (< 8)
    while (k < K) {
        size_t byte_idx = k / TRITS_PER_BYTE;
        size_t pos = k % TRITS_PER_BYTE;
        int8_t t = unpack_trit_at(packed_w[byte_idx], pos);
        if (t == 1) total += vec[k];
        else if (t == -1) total -= vec[k];
        k++;
    }

    return total;
}

// ============================================================================
// AVX2 K3: Row Kernel / GEMV
// ============================================================================
void gemv_packed_avx2(const int32_t* vec, const uint8_t* packed_W, int32_t* out_y, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t n = 0; n < N; ++n) {
        const uint8_t* row_weights = packed_W + n * bytes_per_row;
        out_y[n] = dot_product_packed_avx2(vec, row_weights, K);
    }
}

// ============================================================================
// ============================================================================
// AVX2 K5: GEMM + Bias
// ============================================================================
void gemm_packed_bias_avx2(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        for (size_t n = 0; n < N; ++n) {
            const uint8_t* row_weights = packed_B + n * bytes_per_row;
            int32_t val = dot_product_packed_avx2(in_row, row_weights, K);
            if (bias != nullptr) {
                val += bias[n];
            }
            out_row[n] = val;
        }
    }
}

// ============================================================================
// AVX2 K6: Fused GEMM + Bias + ReLU
// ============================================================================
void gemm_packed_bias_relu_avx2(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        for (size_t n = 0; n < N; ++n) {
            const uint8_t* row_weights = packed_B + n * bytes_per_row;
            int32_t val = dot_product_packed_avx2(in_row, row_weights, K);
            if (bias != nullptr) {
                val += bias[n];
            }
            out_row[n] = std::max(0, val);
        }
    }
}

// ============================================================================
// AVX2 C ABI Kernel Wrappers
// ============================================================================
runtime::KernelStatus bitnet_k0_decode_avx2(const runtime::KernelContext& ctx) {
    if (!ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    decode_trits_avx2(static_cast<const uint8_t*>(ctx.weights),
                      static_cast<int8_t*>(ctx.output),
                      ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k2_dot_avx2(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    int32_t* out = static_cast<int32_t*>(ctx.output);
    *out = dot_product_packed_avx2(static_cast<const int32_t*>(ctx.input),
                                   static_cast<const uint8_t*>(ctx.weights),
                                   ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k3_gemv_avx2(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemv_packed_avx2(static_cast<const int32_t*>(ctx.input),
                     static_cast<const uint8_t*>(ctx.weights),
                     static_cast<int32_t*>(ctx.output),
                     ctx.N,
                     ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k5_gemm_bias_avx2(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemm_packed_bias_avx2(static_cast<const int32_t*>(ctx.input),
                          static_cast<const uint8_t*>(ctx.weights),
                          static_cast<const int32_t*>(ctx.bias),
                          static_cast<int32_t*>(ctx.output),
                          ctx.M,
                          ctx.N,
                          ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k6_gemm_bias_relu_avx2(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemm_packed_bias_relu_avx2(static_cast<const int32_t*>(ctx.input),
                               static_cast<const uint8_t*>(ctx.weights),
                               static_cast<const int32_t*>(ctx.bias),
                               static_cast<int32_t*>(ctx.output),
                               ctx.M,
                               ctx.N,
                               ctx.K);
    return runtime::KernelStatus::OK;
}

// ============================================================================
// Automatic Registration in KernelRegistry
// ============================================================================
void register_all_bitnet_kernels() {
    auto& reg = runtime::KernelRegistry::instance();
    for (const auto& k : reg.list_kernels()) {
        if (k.name == "bitnet.k6.fused_gemm_bias_relu") return;
    }

    // 1. Scalar Oracle Registrations (Priority = 10, Generic Arch)
    reg.register_kernel({
        "bitnet.k0.decode",
        runtime::KernelOp::TERNARY_UNPACK,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT8,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT8,
        10,
        bitnet_k0_decode_scalar
    });

    reg.register_kernel({
        "bitnet.k1.accum",
        runtime::KernelOp::TERNARY_ACCUM,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_INT8,
        runtime::KERNEL_DTYPE_INT32,
        10,
        bitnet_k1_accum_scalar
    });

    reg.register_kernel({
        "bitnet.k2.dot",
        runtime::KernelOp::DOT_PRODUCT,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        10,
        bitnet_k2_dot_scalar
    });

    reg.register_kernel({
        "bitnet.k3.gemv",
        runtime::KernelOp::GEMV_TERNARY,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        10,
        bitnet_k3_gemv_scalar
    });

    reg.register_kernel({
        "bitnet.k4.gemm",
        runtime::KernelOp::GEMM_TERNARY,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        10,
        bitnet_k4_gemm_scalar
    });

    reg.register_kernel({
        "bitnet.k5.gemm_bias",
        runtime::KernelOp::GEMM_TERNARY,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        15,
        bitnet_k5_gemm_bias_scalar
    });

    reg.register_kernel({
        "bitnet.k6.fused_gemm_bias_relu",
        runtime::KernelOp::FUSED_LINEAR_BIAS_RELU,
        runtime::Architecture::Generic,
        runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS | runtime::KERNEL_FLAG_FUSED_RELU,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        10,
        bitnet_k6_gemm_bias_relu_scalar
    });

    // 2. AVX2 Vectorized Registrations (Priority = 100, x86-64 Arch)
    reg.register_kernel({
        "bitnet.k0.decode",
        runtime::KernelOp::TERNARY_UNPACK,
        runtime::Architecture::X86_64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT8,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT8,
        100,
        bitnet_k0_decode_avx2
    });

    reg.register_kernel({
        "bitnet.k2.dot",
        runtime::KernelOp::DOT_PRODUCT,
        runtime::Architecture::X86_64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        bitnet_k2_dot_avx2
    });

    reg.register_kernel({
        "bitnet.k3.gemv",
        runtime::KernelOp::GEMV_TERNARY,
        runtime::Architecture::X86_64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        bitnet_k3_gemv_avx2
    });

    reg.register_kernel({
        "bitnet.k5.gemm_bias",
        runtime::KernelOp::GEMM_TERNARY,
        runtime::Architecture::X86_64,
        runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        bitnet_k5_gemm_bias_avx2
    });

    reg.register_kernel({
        "bitnet.k6.fused_gemm_bias_relu",
        runtime::KernelOp::FUSED_LINEAR_BIAS_RELU,
        runtime::Architecture::X86_64,
        runtime::KERNEL_FLAG_CONTIGUOUS | runtime::KERNEL_FLAG_FUSED_BIAS | runtime::KERNEL_FLAG_FUSED_RELU,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        bitnet_k6_gemm_bias_relu_avx2
    });
}

} // namespace setun::tensor::kernels
