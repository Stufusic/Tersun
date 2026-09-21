#include "tensor/kernels/microkernels.hpp"
#include "runtime/kernel_registry.hpp"
#include <algorithm>

#if defined(__aarch64__) || defined(_M_ARM64)
#include <arm_neon.h>
#endif

namespace setun::tensor::kernels {

#if defined(__aarch64__) || defined(_M_ARM64)

// ============================================================================
// ARM64 NEON K2: Dot Product (Ternary Weight x Integer Activation)
// ============================================================================
int32_t dot_product_packed_neon(const int32_t* vec, const uint8_t* packed_w, size_t K) {
    int32x4_t acc0 = vdupq_n_s32(0);
    int32x4_t acc1 = vdupq_n_s32(0);
    int32x4_t acc2 = vdupq_n_s32(0);
    int32x4_t acc3 = vdupq_n_s32(0);

    size_t k = 0;
    // Unrolled 16-element processing
    while (k + 16 <= K) {
        size_t byte_off = k / TRITS_PER_BYTE;
        uint32_t w32 = *reinterpret_cast<const uint32_t*>(packed_w + byte_off);

        int32_t s[16];
        for (int i = 0; i < 16; ++i) {
            uint8_t code = (w32 >> (i * 2)) & 0b11;
            s[i] = TRIT_LUT_INT32[code];
        }

        int32x4_t v0 = vld1q_s32(vec + k);
        int32x4_t v1 = vld1q_s32(vec + k + 4);
        int32x4_t v2 = vld1q_s32(vec + k + 8);
        int32x4_t v3 = vld1q_s32(vec + k + 12);

        int32x4_t sign0 = vld1q_s32(s);
        int32x4_t sign1 = vld1q_s32(s + 4);
        int32x4_t sign2 = vld1q_s32(s + 8);
        int32x4_t sign3 = vld1q_s32(s + 12);

        acc0 = vmlaq_s32(acc0, v0, sign0);
        acc1 = vmlaq_s32(acc1, v1, sign1);
        acc2 = vmlaq_s32(acc2, v2, sign2);
        acc3 = vmlaq_s32(acc3, v3, sign3);

        k += 16;
    }

    // Process remaining 8-element blocks
    while (k + 8 <= K) {
        size_t byte_off = k / TRITS_PER_BYTE;
        uint16_t w = *reinterpret_cast<const uint16_t*>(packed_w + byte_off);

        int32_t s[8];
        for (int i = 0; i < 8; ++i) {
            uint8_t code = (w >> (i * 2)) & 0b11;
            s[i] = TRIT_LUT_INT32[code];
        }

        int32x4_t v0 = vld1q_s32(vec + k);
        int32x4_t v1 = vld1q_s32(vec + k + 4);

        int32x4_t sign0 = vld1q_s32(s);
        int32x4_t sign1 = vld1q_s32(s + 4);

        acc0 = vmlaq_s32(acc0, v0, sign0);
        acc1 = vmlaq_s32(acc1, v1, sign1);

        k += 8;
    }

    int32x4_t sum4 = vaddq_s32(vaddq_s32(acc0, acc1), vaddq_s32(acc2, acc3));
    int32_t total = vaddvq_s32(sum4);

    // Scalar tail fallback for K % 8 != 0
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
// ARM64 NEON K3: GEMV (Matrix-Vector Multiplication-Free)
// ============================================================================
void gemv_packed_neon(const int32_t* vec, const uint8_t* packed_W, int32_t* out_y, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t n = 0; n < N; ++n) {
        const uint8_t* row_weights = packed_W + n * bytes_per_row;
        out_y[n] = dot_product_packed_neon(vec, row_weights, K);
    }
}

// ============================================================================
// ARM64 NEON K5: GEMM + Fused Bias Addition
// ============================================================================
void gemm_packed_bias_neon(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        for (size_t n = 0; n < N; ++n) {
            const uint8_t* row_weights = packed_B + n * bytes_per_row;
            int32_t val = dot_product_packed_neon(in_row, row_weights, K);
            if (bias != nullptr) {
                val += bias[n];
            }
            out_row[n] = val;
        }
    }
}

// ============================================================================
// ARM64 NEON K6: Fused GEMM + Bias + ReLU Activation
// ============================================================================
void gemm_packed_bias_relu_neon(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        for (size_t n = 0; n < N; ++n) {
            const uint8_t* row_weights = packed_B + n * bytes_per_row;
            int32_t val = dot_product_packed_neon(in_row, row_weights, K);
            if (bias != nullptr) {
                val += bias[n];
            }
            out_row[n] = std::max(0, val);
        }
    }
}

// ============================================================================
// ARM64 NEON Registration
// ============================================================================
void register_neon_kernels() {
    static bool registered = false;
    if (registered) return;
    registered = true;

    auto& reg = runtime::KernelRegistry::instance();

    // K2: Dot Product (ARM64 Priority 100)
    reg.register_kernel({
        "bitnet.k2.dot.neon",
        runtime::KernelOp::DOT_PRODUCT,
        runtime::Architecture::ARM64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        [](const runtime::KernelContext& ctx) -> runtime::KernelStatus {
            if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
            int32_t* out = static_cast<int32_t*>(ctx.output);
            *out = dot_product_packed_neon(static_cast<const int32_t*>(ctx.input),
                                          static_cast<const uint8_t*>(ctx.weights),
                                          ctx.K);
            return runtime::KernelStatus::OK;
        }
    });

    // K3: GEMV (ARM64 Priority 100)
    reg.register_kernel({
        "bitnet.k3.gemv.neon",
        runtime::KernelOp::GEMV_TERNARY,
        runtime::Architecture::ARM64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        [](const runtime::KernelContext& ctx) -> runtime::KernelStatus {
            if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
            gemv_packed_neon(static_cast<const int32_t*>(ctx.input),
                             static_cast<const uint8_t*>(ctx.weights),
                             static_cast<int32_t*>(ctx.output),
                             ctx.N,
                             ctx.K);
            return runtime::KernelStatus::OK;
        }
    });

    // K5: GEMM + Bias (ARM64 Priority 100)
    reg.register_kernel({
        "bitnet.k5.gemm_bias.neon",
        runtime::KernelOp::GEMM_TERNARY,
        runtime::Architecture::ARM64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        [](const runtime::KernelContext& ctx) -> runtime::KernelStatus {
            if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
            gemm_packed_bias_neon(static_cast<const int32_t*>(ctx.input),
                                  static_cast<const uint8_t*>(ctx.weights),
                                  static_cast<const int32_t*>(ctx.bias),
                                  static_cast<int32_t*>(ctx.output),
                                  ctx.M,
                                  ctx.N,
                                  ctx.K);
            return runtime::KernelStatus::OK;
        }
    });

    // K6: Fused Linear + Bias + ReLU (ARM64 Priority 100)
    reg.register_kernel({
        "bitnet.k6.fused_linear_bias_relu.neon",
        runtime::KernelOp::FUSED_LINEAR_BIAS_RELU,
        runtime::Architecture::ARM64,
        runtime::KERNEL_FLAG_CONTIGUOUS,
        runtime::KERNEL_DTYPE_INT32,
        runtime::KERNEL_DTYPE_PACKED_TERNARY_2B,
        runtime::KERNEL_DTYPE_INT32,
        100,
        [](const runtime::KernelContext& ctx) -> runtime::KernelStatus {
            if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
            gemm_packed_bias_relu_neon(static_cast<const int32_t*>(ctx.input),
                                       static_cast<const uint8_t*>(ctx.weights),
                                       static_cast<const int32_t*>(ctx.bias),
                                       static_cast<int32_t*>(ctx.output),
                                       ctx.M,
                                       ctx.N,
                                       ctx.K);
            return runtime::KernelStatus::OK;
        }
    });
}

#else

// Stubs for non-ARM64 platforms (e.g. x86_64 host compilation)
void register_neon_kernels() {
    // No-op on x86-64 / generic scalar platforms
}

#endif

} // namespace setun::tensor::kernels
