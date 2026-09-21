#include "runtime/target_capabilities.hpp"
#include "runtime/kernel_abi.hpp"
#include "runtime/kernel_registry.hpp"
#include <iostream>
#include <cassert>

namespace setun::test {

static int g_kernel_invocations = 0;

static runtime::KernelStatus dummy_scalar_kernel(const runtime::KernelContext& ctx) {
    (void)ctx;
    g_kernel_invocations = 10;
    return runtime::KernelStatus::OK;
}

static runtime::KernelStatus dummy_avx2_kernel(const runtime::KernelContext& ctx) {
    (void)ctx;
    g_kernel_invocations = 100;
    return runtime::KernelStatus::OK;
}

void test_target_capabilities_suite() {
    std::cout << "===================================================================\n";
    std::cout << "  [Gate 7.1] Target Capabilities & Kernel Registry Verification    \n";
    std::cout << "===================================================================\n";

    // 1. Dò tìm năng lực phần cứng máy host
    std::cout << "  [G7.1-1] Detecting Host CPU & OS XSAVE Capabilities...\n";
    auto host_caps = runtime::detect_host_capabilities();
    std::cout << "    -> Architecture   : " << runtime::architecture_to_string(host_caps.arch) << " (" << host_caps.arch_name << ")\n";
    std::cout << "    -> Logical Cores  : " << host_caps.logical_cores << "\n";
    std::cout << "    -> AVX2 Supported : " << (host_caps.has_avx2 ? "TRUE (256-bit YMM Enabled via OSXSAVE)" : "FALSE") << "\n";
    std::cout << "    -> FMA Supported  : " << (host_caps.has_fma ? "TRUE" : "FALSE") << "\n";
    std::cout << "    -> Vector Bytes   : " << host_caps.vector_bytes << " bytes\n";
    std::cout << "    -> Memory Profile : " << runtime::memory_profile_to_string(host_caps.memory_profile) << "\n";

#if defined(__x86_64__) || defined(_M_X64)
    assert(host_caps.arch == runtime::Architecture::X86_64);
    assert(host_caps.has_avx2 == true);
    assert(host_caps.vector_bytes == 32);
#endif
    assert(host_caps.logical_cores > 0);
    std::cout << "    -> Host detection validated successfully!\n";

    // 2. Kiểm thử Override Capabilities
    std::cout << "  [G7.1-2] Testing Capability Overrides & Fallback Logic...\n";
    runtime::TargetCapabilities scalar_caps = host_caps;
    scalar_caps.arch = runtime::Architecture::Generic;
    scalar_caps.arch_name = "generic-scalar";
    scalar_caps.has_avx2 = false;
    scalar_caps.has_fma = false;
    scalar_caps.vector_bytes = 0;
    scalar_caps.is_overridden = true;

    runtime::set_active_capabilities(scalar_caps);
    const auto& active = runtime::get_active_capabilities();
    assert(active.arch == runtime::Architecture::Generic);
    assert(active.has_avx2 == false);
    assert(active.vector_bytes == 0);
    std::cout << "    -> Runtime override successfully simulated generic scalar platform!\n";

    // 3. Kiểm thử KernelRegistry và Priority Resolution
    std::cout << "  [G7.1-3] Testing KernelRegistry Dynamic Prioritized Resolution...\n";
    auto& reg = runtime::KernelRegistry::instance();
    reg.clear();

    runtime::KernelDescriptor desc_scalar;
    desc_scalar.name = "gemm_ternary_scalar_oracle";
    desc_scalar.op = runtime::KernelOp::GEMM_TERNARY;
    desc_scalar.arch = runtime::Architecture::Generic;
    desc_scalar.priority = 10;
    desc_scalar.fn = dummy_scalar_kernel;
    reg.register_kernel(desc_scalar);

    runtime::KernelDescriptor desc_avx2;
    desc_avx2.name = "gemm_ternary_avx2_256bit";
    desc_avx2.op = runtime::KernelOp::GEMM_TERNARY;
    desc_avx2.arch = runtime::Architecture::X86_64;
    desc_avx2.priority = 100;
    desc_avx2.fn = dummy_avx2_kernel;
    reg.register_kernel(desc_avx2);

    // Khi target là scalar (no AVX2), phải resolve ra scalar kernel
    runtime::KernelFn resolved_scalar = reg.resolve(runtime::KernelOp::GEMM_TERNARY, scalar_caps);
    assert(resolved_scalar != nullptr);
    runtime::KernelContext ctx;
    g_kernel_invocations = 0;
    resolved_scalar(ctx);
    assert(g_kernel_invocations == 10);
    std::cout << "    -> Fallback resolution correctly selected Scalar Oracle (invocations=" << g_kernel_invocations << ")!\n";

    // Khi target là host_caps (có AVX2), phải resolve ra AVX2 kernel (priority 100 > 10)
    runtime::KernelFn resolved_avx2 = reg.resolve(runtime::KernelOp::GEMM_TERNARY, host_caps);
    assert(resolved_avx2 != nullptr);
    g_kernel_invocations = 0;
    resolved_avx2(ctx);
#if defined(__x86_64__) || defined(_M_X64)
    assert(g_kernel_invocations == 100);
    std::cout << "    -> High-performance resolution correctly selected AVX2 SIMD Kernel (invocations=" << g_kernel_invocations << ")!\n";
#endif

    // Clean up test kernels from global registry
    reg.clear();

    // Reset lại active caps về host caps ban đầu
    runtime::set_active_capabilities(host_caps);
    std::cout << "===================================================================\n";
    std::cout << "  Gate 7.1: All Target Capabilities Tests Passed (100% Success)    \n";
    std::cout << "===================================================================\n";
}

} // namespace setun::test
