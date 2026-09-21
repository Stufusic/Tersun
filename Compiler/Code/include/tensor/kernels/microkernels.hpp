#pragma once

#include "runtime/kernel_abi.hpp"
#include "tensor/packed_ternary_layout.hpp"
#include <cstdint>
#include <cstddef>

namespace setun::tensor::kernels {

// ============================================================================
// Microkernel Ladder (K0 - K6)
// Reference C++20 Scalar Oracle Implementations
// ============================================================================

// K0: Ternary Decode - unpacks 2-bit trits into signed 8-bit integers {-1, 0, +1}
void decode_trits_scalar(const uint8_t* packed, int8_t* out_unpacked, size_t count);

// K1: Vector Ternary Accumulate - adds scalar_mult * trit into accumulator
void vector_ternary_accum_scalar(int32_t* accum, const int8_t* trits, int32_t scalar_mult, size_t count);

// K2: Dot Product with Packed Ternary - multiplication-free dot product (vec * packed_w)
int32_t dot_product_packed_scalar(const int32_t* vec, const uint8_t* packed_w, size_t K);

// K3: Row Kernel / GEMV - matrix-vector product (y = vec * W^T, W is [N x K] packed)
void gemv_packed_scalar(const int32_t* vec, const uint8_t* packed_W, int32_t* out_y, size_t N, size_t K);

// K4: Tiled GEMM - matrix-matrix product (C = A * B^T, A is [M x K], B is [N x K] packed, C is [M x N])
void gemm_packed_scalar(const int32_t* A, const uint8_t* packed_B, int32_t* C, size_t M, size_t N, size_t K);

// K5: GEMM + Bias (C = A * B^T + Bias)
void gemm_packed_bias_scalar(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K);

// K6: Fused GEMM + Bias + ReLU (C = max(0, A * B^T + Bias))
void gemm_packed_bias_relu_scalar(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K);

// ============================================================================
// C ABI Decoupled Kernel Wrappers (runtime::KernelFn)
// ============================================================================
runtime::KernelStatus bitnet_k0_decode_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k1_accum_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k2_dot_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k3_gemv_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k4_gemm_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k5_gemm_bias_scalar(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k6_gemm_bias_relu_scalar(const runtime::KernelContext& ctx);

// ============================================================================
// AVX2 Vectorized SIMD Implementations
// ============================================================================
void decode_trits_avx2(const uint8_t* packed, int8_t* out_unpacked, size_t count);
int32_t dot_product_packed_avx2(const int32_t* vec, const uint8_t* packed_w, size_t K);
void gemv_packed_avx2(const int32_t* vec, const uint8_t* packed_W, int32_t* out_y, size_t N, size_t K);
void gemm_packed_bias_avx2(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K);
void gemm_packed_bias_relu_avx2(const int32_t* A, const uint8_t* packed_B, const int32_t* bias, int32_t* C, size_t M, size_t N, size_t K);

runtime::KernelStatus bitnet_k0_decode_avx2(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k2_dot_avx2(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k3_gemv_avx2(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k5_gemm_bias_avx2(const runtime::KernelContext& ctx);
runtime::KernelStatus bitnet_k6_gemm_bias_relu_avx2(const runtime::KernelContext& ctx);

// ============================================================================
// Automatic Registration in KernelRegistry
// ============================================================================
void register_all_bitnet_kernels();

} // namespace setun::tensor::kernels
