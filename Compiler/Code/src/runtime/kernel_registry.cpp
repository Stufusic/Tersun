#include "runtime/kernel_registry.hpp"
#include <algorithm>

namespace setun::runtime {

KernelRegistry& KernelRegistry::instance() {
    static KernelRegistry inst;
    return inst;
}

void KernelRegistry::register_kernel(const KernelDescriptor& desc) {
    kernels_.push_back(desc);
}

KernelFn KernelRegistry::resolve(KernelOp op, const TargetCapabilities& caps, uint32_t flags,
                                 int in_dtype, int wt_dtype, int out_dtype) const {
    const KernelDescriptor* best_match = nullptr;
    uint32_t highest_priority = 0;

    for (const auto& k : kernels_) {
        if (k.op != op) continue;
        if (k.input_dtype != in_dtype) continue;
        if (k.weight_dtype != wt_dtype) continue;
        if (k.output_dtype != out_dtype) continue;
        if ((flags & k.required_flags) != k.required_flags) continue;

        // Architecture check
        bool arch_compatible = false;
        if (k.arch == Architecture::Generic) {
            arch_compatible = true; // Always usable as reference fallback
        } else if (k.arch == Architecture::X86_64) {
            if (caps.arch == Architecture::X86_64 && caps.has_avx2) {
                arch_compatible = true;
            }
        } else if (k.arch == Architecture::ARM64) {
            if (caps.arch == Architecture::ARM64 && caps.has_neon) {
                arch_compatible = true;
            }
        }

        if (!arch_compatible) continue;

        if (best_match == nullptr || k.priority > highest_priority) {
            best_match = &k;
            highest_priority = k.priority;
        }
    }

    return best_match ? best_match->fn : nullptr;
}

KernelFn KernelRegistry::resolve_forced(KernelOp op, Architecture required_arch, const TargetCapabilities& caps,
                                         uint32_t flags, int in_dtype, int wt_dtype, int out_dtype) const {
    const KernelDescriptor* best_match = nullptr;
    uint32_t highest_priority = 0;

    for (const auto& k : kernels_) {
        if (k.op != op) continue;
        if (k.input_dtype != in_dtype) continue;
        if (k.weight_dtype != wt_dtype) continue;
        if (k.output_dtype != out_dtype) continue;
        if ((flags & k.required_flags) != k.required_flags) continue;

        if (k.arch != required_arch) continue;

        // Verify host CPU capability supports required_arch
        if (required_arch == Architecture::X86_64 && (!caps.has_avx2 || caps.arch != Architecture::X86_64)) {
            continue;
        }
        if (required_arch == Architecture::ARM64 && (!caps.has_neon || caps.arch != Architecture::ARM64)) {
            continue;
        }

        if (best_match == nullptr || k.priority > highest_priority) {
            best_match = &k;
            highest_priority = k.priority;
        }
    }

    return best_match ? best_match->fn : nullptr;
}

KernelFn KernelRegistry::resolve(const std::string& name, const TargetCapabilities& caps, const KernelContext& ctx) const {
    const KernelDescriptor* best_match = nullptr;
    uint32_t highest_priority = 0;

    for (const auto& k : kernels_) {
        if (k.name != name) continue;
        if (k.input_dtype != ctx.input_dtype) continue;
        if (k.weight_dtype != ctx.weight_dtype) continue;
        if (k.output_dtype != ctx.output_dtype) continue;
        if ((ctx.flags & k.required_flags) != k.required_flags) continue;

        bool arch_compatible = false;
        if (k.arch == Architecture::Generic) {
            arch_compatible = true;
        } else if (k.arch == Architecture::X86_64) {
            if (caps.arch == Architecture::X86_64 && caps.has_avx2) {
                arch_compatible = true;
            }
        } else if (k.arch == Architecture::ARM64) {
            if (caps.arch == Architecture::ARM64 && caps.has_neon) {
                arch_compatible = true;
            }
        }

        if (!arch_compatible) continue;

        if (best_match == nullptr || k.priority > highest_priority) {
            best_match = &k;
            highest_priority = k.priority;
        }
    }

    return best_match ? best_match->fn : nullptr;
}

const std::vector<KernelDescriptor>& KernelRegistry::list_kernels() const {
    return kernels_;
}

void KernelRegistry::clear() {
    kernels_.clear();
}

} // namespace setun::runtime
