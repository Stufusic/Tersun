#pragma once

#include "vm/jit_frame.hpp"
#include "vm/jit_osr.hpp"
#include <cstdint>
#include <vector>

namespace setun {

class VM;

// ============================================================================
// Gate 5.9 (Advanced): Extended Deopt Materialization Architecture
// As required by Compiler/Doc/rv5.9.md (Sections 14-16)
// ============================================================================

enum class MaterializationKind : uint8_t {
    Direct = 0,            // Read directly from register or stack slot
    Constant = 1,          // Value is a known constant
    Rematerialize = 2,     // Value can be rematerialized
    ScalarizedObject = 3   // Object was scalarized into individual fields
};

struct MaterializationEntry {
    uint32_t target_slot{0}; // VM local slot index or operand stack offset
    bool is_stack_slot{false};
    MaterializationKind kind{MaterializationKind::Direct};
    Location loc;
    int64_t constant_val{0};
    uint64_t shape_id{0};
    std::vector<Location> field_locations; // Register/Stack locations of scalarized fields
};

class MaterializationEngine {
public:
    static VMValue materialize_value(VM* vm, const MachineState& machine, const MaterializationEntry& entry);
    static bool materialize_all(VM* vm, JITFrame* frame, const MachineState& machine,
                               const std::vector<MaterializationEntry>& entries);
};

} // namespace setun
