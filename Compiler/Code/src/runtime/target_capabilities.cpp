#include "runtime/target_capabilities.hpp"
#include <cstdlib>
#include <cstring>
#include <thread>
#include <algorithm>

#if defined(_MSC_VER)
    #include <intrin.h>
#elif defined(__GNUC__) || defined(__clang__)
    #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
        #include <cpuid.h>
        #include <immintrin.h>
    #endif
#endif

namespace setun::runtime {

namespace {

TargetCapabilities g_active_caps;
bool g_initialized = false;

static inline uint64_t xgetbv_safe(uint32_t xcr) {
#if defined(_MSC_VER)
    return _xgetbv(xcr);
#elif defined(__GNUC__) || defined(__clang__)
    #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
        uint32_t eax, edx;
        __asm__ volatile("xgetbv" : "=a"(eax), "=d"(edx) : "c"(xcr));
        return (static_cast<uint64_t>(edx) << 32) | eax;
    #else
        (void)xcr;
        return 0;
    #endif
#else
    (void)xcr;
    return 0;
#endif
}

} // namespace

TargetCapabilities detect_host_capabilities() {
    TargetCapabilities caps;
    caps.logical_cores = std::thread::hardware_concurrency();
    if (caps.logical_cores == 0) caps.logical_cores = 1;

#if defined(__x86_64__) || defined(_M_X64)
    caps.arch = Architecture::X86_64;
    caps.arch_name = "x86-64";

    // 1. Dò tìm CPUID
    uint32_t eax = 0, ebx = 0, ecx = 0, edx = 0;
    bool has_osxsave = false;

#if defined(_MSC_VER)
    int cpu_info[4];
    __cpuid(cpu_info, 1);
    ecx = static_cast<uint32_t>(cpu_info[2]);
    edx = static_cast<uint32_t>(cpu_info[3]);
#elif defined(__GNUC__) || defined(__clang__)
    __cpuid(1, eax, ebx, ecx, edx);
#endif

    // Bit 27 của ECX trong CPUID(1) là OSXSAVE
    has_osxsave = (ecx & (1 << 27)) != 0;
    // Bit 12 của ECX trong CPUID(1) là FMA
    caps.has_fma = (ecx & (1 << 12)) != 0;

    // 2. Dò tìm AVX2 qua CPUID Leaf 7, Subleaf 0
#if defined(_MSC_VER)
    __cpuidex(cpu_info, 7, 0);
    ebx = static_cast<uint32_t>(cpu_info[1]);
#elif defined(__GNUC__) || defined(__clang__)
    __cpuid_count(7, 0, eax, ebx, ecx, edx);
#endif

    bool cpuid_has_avx2 = (ebx & (1 << 5)) != 0;

    // 3. Kiểm tra OS XSAVE / XGETBV (tránh crash khi OS chưa kích hoạt YMM state)
    if (has_osxsave && cpuid_has_avx2) {
        uint64_t xcr0 = xgetbv_safe(0);
        // Bit 1 = XMM state, Bit 2 = YMM state
        if ((xcr0 & 0x6) == 0x6) {
            caps.has_avx2 = true;
            caps.vector_bytes = 32; // 256 bits
        }
    }

#elif defined(__aarch64__) || defined(_M_ARM64)
    caps.arch = Architecture::ARM64;
    caps.arch_name = "arm64";
    #if defined(__ARM_NEON) || defined(__ARM_NEON__)
        caps.has_neon = true;
        caps.vector_bytes = 16; // 128 bits
    #endif
#else
    caps.arch = Architecture::Generic;
    caps.arch_name = "generic-scalar";
    caps.vector_bytes = 0;
#endif

    // Kiểm tra biến môi trường TERSUN_TARGET_PROFILE
    const char* env_profile = std::getenv("TERSUN_TARGET_PROFILE");
    if (env_profile != nullptr) {
        std::string p(env_profile);
        std::transform(p.begin(), p.end(), p.begin(), ::tolower);

        if (p == "generic-scalar" || p == "scalar") {
            caps.arch = Architecture::Generic;
            caps.arch_name = "generic-scalar";
            caps.has_avx2 = false;
            caps.has_fma = false;
            caps.has_neon = false;
            caps.vector_bytes = 0;
            caps.is_overridden = true;
        } else if (p == "x86-64-avx2" || p == "avx2") {
            caps.arch = Architecture::X86_64;
            caps.arch_name = "x86-64-avx2";
            caps.has_avx2 = true;
            caps.has_fma = true;
            caps.vector_bytes = 32;
            caps.is_overridden = true;
        } else if (p == "arm64-neon" || p == "neon") {
            caps.arch = Architecture::ARM64;
            caps.arch_name = "arm64-neon";
            caps.has_neon = true;
            caps.vector_bytes = 16;
            caps.is_overridden = true;
        } else if (p == "edge-static" || p == "edge") {
            caps.memory_profile = MemoryProfile::EdgeArena;
            caps.execution_mode = ExecutionMode::SingleThreaded;
            caps.allow_heap_on_hot_path = false;
            caps.memory_budget_bytes = 1024 * 1024; // 1MB default edge budget
            caps.is_overridden = true;
        }
    }

    return caps;
}

const TargetCapabilities& get_active_capabilities() {
    if (!g_initialized) {
        g_active_caps = detect_host_capabilities();
        g_initialized = true;
    }
    return g_active_caps;
}

const TargetCapabilities& TargetCapabilities::active() {
    return get_active_capabilities();
}

void set_active_capabilities(const TargetCapabilities& caps) {
    g_active_caps = caps;
    g_initialized = true;
}

void reset_active_capabilities() {
    g_initialized = false;
    get_active_capabilities();
}

std::string architecture_to_string(Architecture arch) {
    switch (arch) {
        case Architecture::Generic: return "Generic";
        case Architecture::X86_64: return "x86-64";
        case Architecture::ARM64: return "ARM64";
        case Architecture::RISCV64: return "RISC-V 64";
        case Architecture::TernaryEmulated: return "Ternary Emulated";
        default: return "Unknown";
    }
}

std::string memory_profile_to_string(MemoryProfile profile) {
    switch (profile) {
        case MemoryProfile::DesktopHeap: return "Desktop (Dynamic Heap)";
        case MemoryProfile::EdgeArena: return "Edge (Static Arena, No Heap)";
        default: return "Unknown";
    }
}

} // namespace setun::runtime
