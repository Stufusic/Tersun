#pragma once

#include "runtime/kernel_abi.hpp"
#include "runtime/target_capabilities.hpp"
#include <string>
#include <vector>
#include <functional>

namespace setun::runtime {

enum class KernelOp : int {
    GEMM_TERNARY = 1,
    GEMV_TERNARY = 2,
    FUSED_LINEAR_BIAS_RELU = 3,
    TERNARY_UNPACK = 4,
    DOT_PRODUCT = 5,
    TERNARY_ACCUM = 6
};

struct KernelDescriptor {
    std::string name;
    KernelOp op{KernelOp::GEMM_TERNARY};
    Architecture arch{Architecture::Generic};
    uint32_t required_flags{KERNEL_FLAG_NONE};
    int input_dtype{KERNEL_DTYPE_INT32};
    int weight_dtype{KERNEL_DTYPE_PACKED_TERNARY_2B};
    int output_dtype{KERNEL_DTYPE_INT32};
    uint32_t priority{10}; // 10 = Scalar Oracle, 50 = NEON, 100 = AVX2
    KernelFn fn{nullptr};
};

class KernelRegistry {
public:
    static KernelRegistry& instance();

    void register_kernel(const KernelDescriptor& desc);
    KernelFn resolve(KernelOp op, const TargetCapabilities& caps, uint32_t flags = KERNEL_FLAG_CONTIGUOUS,
                     int in_dtype = KERNEL_DTYPE_INT32, int wt_dtype = KERNEL_DTYPE_PACKED_TERNARY_2B,
                     int out_dtype = KERNEL_DTYPE_INT32) const;

    KernelFn resolve_forced(KernelOp op, Architecture required_arch, const TargetCapabilities& caps,
                            uint32_t flags = KERNEL_FLAG_CONTIGUOUS,
                            int in_dtype = KERNEL_DTYPE_INT32, int wt_dtype = KERNEL_DTYPE_PACKED_TERNARY_2B,
                            int out_dtype = KERNEL_DTYPE_INT32) const;

    KernelFn resolve(KernelOp op, const TargetCapabilities& caps, const KernelContext& ctx) const {
        return resolve(op, caps, ctx.flags, ctx.input_dtype, ctx.weight_dtype, ctx.output_dtype);
    }

    KernelFn resolve(const std::string& name, const TargetCapabilities& caps, const KernelContext& ctx) const;

    const std::vector<KernelDescriptor>& list_kernels() const;
    void clear();

private:
    KernelRegistry() = default;
    std::vector<KernelDescriptor> kernels_;
};

} // namespace setun::runtime
