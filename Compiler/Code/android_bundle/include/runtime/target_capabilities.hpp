#pragma once

#include <cstdint>
#include <cstddef>
#include <string>
#include <vector>

namespace setun::runtime {

enum class Architecture : int {
    Generic = 0,
    X86_64 = 1,
    ARM64 = 2,
    RISCV64 = 3,
    TernaryEmulated = 4
};

enum class MemoryProfile : int {
    DesktopHeap = 0,
    EdgeArena = 1
};

enum class ExecutionMode : int {
    MultiThreaded = 0,
    SingleThreaded = 1
};

struct TargetCapabilities {
    Architecture arch{Architecture::Generic};
    std::string arch_name{"generic-scalar"};
    
    // Vector & ISA Features
    bool has_avx2{false};
    bool has_fma{false};
    bool has_neon{false};
    bool has_rvv{false};
    uint32_t vector_bytes{0}; // 32 for AVX2, 16 for NEON, 0 for scalar
    
    // CPU & Memory Topology
    uint32_t logical_cores{1};
    size_t memory_budget_bytes{0}; // 0 = unlimited / desktop heap
    bool allow_heap_on_hot_path{true};
    
    MemoryProfile memory_profile{MemoryProfile::DesktopHeap};
    ExecutionMode execution_mode{ExecutionMode::MultiThreaded};
    
    bool is_overridden{false};

    bool static_arena_only() const {
        return memory_profile == MemoryProfile::EdgeArena || !allow_heap_on_hot_path;
    }

    static const TargetCapabilities& active();
};

// Detections & Global Registry
TargetCapabilities detect_host_capabilities();
const TargetCapabilities& get_active_capabilities();
void set_active_capabilities(const TargetCapabilities& caps);
void reset_active_capabilities();

std::string architecture_to_string(Architecture arch);
std::string memory_profile_to_string(MemoryProfile profile);

} // namespace setun::runtime
