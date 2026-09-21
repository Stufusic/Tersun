#include "tensor/kernels/microkernels.hpp"
#include "runtime/kernel_registry.hpp"
#include <algorithm>
#include <cstring>

namespace setun::tensor::kernels {

// ============================================================================
// K0: Ternary Decode
// ============================================================================
void decode_trits_scalar(const uint8_t* packed, int8_t* out_unpacked, size_t count) {
    size_t full_bytes = count / TRITS_PER_BYTE;
    size_t rem = count % TRITS_PER_BYTE;

    for (size_t b = 0; b < full_bytes; ++b) {
        uint8_t byte_val = packed[b];
        size_t base = b * TRITS_PER_BYTE;
        out_unpacked[base + 0] = decode_trit((byte_val >> 0) & 0b11);
        out_unpacked[base + 1] = decode_trit((byte_val >> 2) & 0b11);
        out_unpacked[base + 2] = decode_trit((byte_val >> 4) & 0b11);
        out_unpacked[base + 3] = decode_trit((byte_val >> 6) & 0b11);
    }

    if (rem > 0) {
        uint8_t byte_val = packed[full_bytes];
        size_t base = full_bytes * TRITS_PER_BYTE;
        for (size_t r = 0; r < rem; ++r) {
            out_unpacked[base + r] = unpack_trit_at(byte_val, r);
        }
    }
}

// ============================================================================
// K1: Vector Ternary Accumulate
// ============================================================================
void vector_ternary_accum_scalar(int32_t* accum, const int8_t* trits, int32_t scalar_mult, size_t count) {
    if (scalar_mult == 0) return;
    for (size_t i = 0; i < count; ++i) {
        int8_t t = trits[i];
        if (t == 1) {
            accum[i] += scalar_mult;
        } else if (t == -1) {
            accum[i] -= scalar_mult;
        }
    }
}

// ============================================================================
// K2: Dot Product (Packed Ternary x Int32 Vector)
// Multiplication-Free: ONLY ADDITIONS AND SUBTRACTIONS
// ============================================================================
int32_t dot_product_packed_scalar(const int32_t* vec, const uint8_t* packed_w, size_t K) {
    int32_t sum = 0;
    size_t full_bytes = K / TRITS_PER_BYTE;
    size_t rem = K % TRITS_PER_BYTE;

    for (size_t b = 0; b < full_bytes; ++b) {
        uint8_t byte_val = packed_w[b];
        size_t base = b * TRITS_PER_BYTE;

        int8_t t0 = decode_trit((byte_val >> 0) & 0b11);
        int8_t t1 = decode_trit((byte_val >> 2) & 0b11);
        int8_t t2 = decode_trit((byte_val >> 4) & 0b11);
        int8_t t3 = decode_trit((byte_val >> 6) & 0b11);

        if (t0 == 1) sum += vec[base + 0]; else if (t0 == -1) sum -= vec[base + 0];
        if (t1 == 1) sum += vec[base + 1]; else if (t1 == -1) sum -= vec[base + 1];
        if (t2 == 1) sum += vec[base + 2]; else if (t2 == -1) sum -= vec[base + 2];
        if (t3 == 1) sum += vec[base + 3]; else if (t3 == -1) sum -= vec[base + 3];
    }

    if (rem > 0) {
        uint8_t byte_val = packed_w[full_bytes];
        size_t base = full_bytes * TRITS_PER_BYTE;
        for (size_t r = 0; r < rem; ++r) {
            int8_t t = unpack_trit_at(byte_val, r);
            if (t == 1) sum += vec[base + r]; else if (t == -1) sum -= vec[base + r];
        }
    }

    return sum;
}

// ============================================================================
// K3: Row Kernel / GEMV (y = vec * W^T, W is [N x K] packed)
// ============================================================================
void gemv_packed_scalar(const int32_t* vec, const uint8_t* packed_W, int32_t* out_y, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t n = 0; n < N; ++n) {
        const uint8_t* row_weights = packed_W + n * bytes_per_row;
        out_y[n] = dot_product_packed_scalar(vec, row_weights, K);
    }
}

// ============================================================================
// K4: Tiled GEMM (C = A * B^T, A is [M x K], B is [N x K] packed, C is [M x N])
// ============================================================================
void gemm_packed_scalar(const int32_t* A, const uint8_t* packed_B, int32_t* C, size_t M, size_t N, size_t K) {
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        gemv_packed_scalar(in_row, packed_B, out_row, N, K);
    }
}

// ============================================================================
// K5: GEMM + Bias
// ============================================================================
void gemm_packed_bias_scalar(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    gemm_packed_scalar(A, packed_B, C, M, N, K);
    if (bias != nullptr) {
        for (size_t m = 0; m < M; ++m) {
            int32_t* out_row = C + m * N;
            for (size_t n = 0; n < N; ++n) {
                out_row[n] += bias[n];
            }
        }
    }
}

// ============================================================================
// K6: Fused GEMM + Bias + ReLU
// ============================================================================
void gemm_packed_bias_relu_scalar(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K) {
    size_t bytes_per_row = calc_packed_bytes(K);
    for (size_t m = 0; m < M; ++m) {
        const int32_t* in_row = A + m * K;
        int32_t* out_row = C + m * N;
        for (size_t n = 0; n < N; ++n) {
            const uint8_t* row_weights = packed_B + n * bytes_per_row;
            int32_t val = dot_product_packed_scalar(in_row, row_weights, K);
            if (bias != nullptr) {
                val += bias[n];
            }
            out_row[n] = std::max(0, val);
        }
    }
}

// ============================================================================
// C ABI Decoupled Kernel Implementations
// ============================================================================

runtime::KernelStatus bitnet_k0_decode_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    decode_trits_scalar(static_cast<const uint8_t*>(ctx.weights),
                        static_cast<int8_t*>(ctx.output),
                        ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k1_accum_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    int32_t mult = ctx.input ? *static_cast<const int32_t*>(ctx.input) : 1;
    vector_ternary_accum_scalar(static_cast<int32_t*>(ctx.output),
                                static_cast<const int8_t*>(ctx.weights),
                                mult,
                                ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k2_dot_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    int32_t* out = static_cast<int32_t*>(ctx.output);
    *out = dot_product_packed_scalar(static_cast<const int32_t*>(ctx.input),
                                     static_cast<const uint8_t*>(ctx.weights),
                                     ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k3_gemv_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemv_packed_scalar(static_cast<const int32_t*>(ctx.input),
                       static_cast<const uint8_t*>(ctx.weights),
                       static_cast<int32_t*>(ctx.output),
                       ctx.N,
                       ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k4_gemm_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemm_packed_scalar(static_cast<const int32_t*>(ctx.input),
                       static_cast<const uint8_t*>(ctx.weights),
                       static_cast<int32_t*>(ctx.output),
                       ctx.M,
                       ctx.N,
                       ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k5_gemm_bias_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemm_packed_bias_scalar(static_cast<const int32_t*>(ctx.input),
                            static_cast<const uint8_t*>(ctx.weights),
                            static_cast<const int32_t*>(ctx.bias),
                            static_cast<int32_t*>(ctx.output),
                            ctx.M,
                            ctx.N,
                            ctx.K);
    return runtime::KernelStatus::OK;
}

runtime::KernelStatus bitnet_k6_gemm_bias_relu_scalar(const runtime::KernelContext& ctx) {
    if (!ctx.input || !ctx.weights || !ctx.output) return runtime::KernelStatus::INVALID_ARG;
    gemm_packed_bias_relu_scalar(static_cast<const int32_t*>(ctx.input),
                                 static_cast<const uint8_t*>(ctx.weights),
                                 static_cast<const int32_t*>(ctx.bias),
                                 static_cast<int32_t*>(ctx.output),
                                 ctx.M,
                                 ctx.N,
                                 ctx.K);
    return runtime::KernelStatus::OK;
}

} // namespace setun::tensor::kernels
