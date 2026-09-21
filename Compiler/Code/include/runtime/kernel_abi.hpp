#pragma once

#include <cstdint>
#include <cstddef>

namespace setun::runtime {

enum class KernelStatus : int {
    OK = 0,
    INVALID_ARG = 1,
    UNSUPPORTED = 2,
    SHAPE_MISMATCH = 3,
    OVERFLOW_ERR = 4,
    OUT_OF_MEMORY = 5
};

// Flags for kernel dispatch & optimization capabilities
constexpr uint32_t KERNEL_FLAG_NONE           = 0;
constexpr uint32_t KERNEL_FLAG_CONTIGUOUS     = 1 << 0;
constexpr uint32_t KERNEL_FLAG_BLOCKED_K32    = 1 << 1;
constexpr uint32_t KERNEL_FLAG_BLOCKED_K64    = 1 << 2;
constexpr uint32_t KERNEL_FLAG_FUSED_BIAS     = 1 << 3;
constexpr uint32_t KERNEL_FLAG_FUSED_RELU     = 1 << 4;
constexpr uint32_t KERNEL_FLAG_FUSED_SIGN     = 1 << 5;
constexpr uint32_t KERNEL_FLAG_ZERO_ALLOC     = 1 << 6;

// DType IDs for C ABI passing
constexpr int KERNEL_DTYPE_UNKNOWN            = 0;
constexpr int KERNEL_DTYPE_INT8               = 1;
constexpr int KERNEL_DTYPE_INT16              = 2;
constexpr int KERNEL_DTYPE_INT32              = 3;
constexpr int KERNEL_DTYPE_INT64              = 4;
constexpr int KERNEL_DTYPE_FLOAT32            = 5;
constexpr int KERNEL_DTYPE_FLOAT64            = 6;
constexpr int KERNEL_DTYPE_TAF3               = 7;
constexpr int KERNEL_DTYPE_PACKED_TERNARY_2B  = 8; // 4 trits per byte

// Standard Decoupled C ABI for Compute Kernels
struct KernelContext {
    const void* weights{nullptr};
    const void* input{nullptr};
    const void* bias{nullptr};
    void* output{nullptr};
    
    size_t M{0}; // Output rows / batch size
    size_t N{0}; // Output columns / feature count
    size_t K{0}; // Contraction dimension / input features
    
    int input_dtype{KERNEL_DTYPE_INT32};
    int weight_dtype{KERNEL_DTYPE_PACKED_TERNARY_2B};
    int output_dtype{KERNEL_DTYPE_INT32};
    
    uint32_t flags{KERNEL_FLAG_CONTIGUOUS};
    
    void* scratch{nullptr};
    size_t scratch_bytes{0};
};

using KernelFn = KernelStatus (*)(const KernelContext&);

} // namespace setun::runtime
