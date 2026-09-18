#pragma once

#include "vm/machine_ir.hpp"
#include "vm/jit_osr.hpp"
#include <cstdint>
#include <vector>
#include <map>
#include <set>

namespace setun {

// ============================================================================
// Gate 5.9 (Advanced): Linear Scan Register Allocator (LSRA)
// As specified in Compiler/Doc/rv5.9.md (Sections 11 & 12)
// ============================================================================

// Physical x86-64 register indices (0..15)
// 0:RAX, 1:RCX, 2:RDX, 3:RBX, 4:RSP, 5:RBP, 6:RSI, 7:RDI,
// 8:R8,  9:R9, 10:R10, 11:R11, 12:R12, 13:R13, 14:R14, 15:R15

struct LiveInterval {
    vreg_t vreg{NO_VREG};
    uint32_t start_point{0};
    uint32_t end_point{0};
    int8_t assigned_reg{-1};  // -1 if spilled
    int32_t spill_offset{-1}; // stack offset if spilled

    bool is_spilled() const { return assigned_reg < 0; }
};

struct RegisterSet {
    // Windows x64 ABI allocations:
    // Reserved: RSP (4), RBP (5), R10 (10), R11 (11)
    // Allocatable caller-saved: RAX (0), RCX (1), RDX (2), R8 (8), R9 (9)
    // Allocatable callee-saved: RBX (3), RSI (6), RDI (7), R12 (12), R13 (13), R14 (14), R15 (15)
    static std::vector<uint8_t> get_allocatable_registers();
    static bool is_callee_saved(uint8_t reg);
};

struct RegisterAllocationResult {
    std::map<vreg_t, Location> vreg_locations;
    uint32_t total_spill_slots{0};
    std::set<uint8_t> used_callee_saved_regs;
};

class LinearScanAllocator {
public:
    static RegisterAllocationResult allocate(const MIRFunction& func);
};

} // namespace setun
