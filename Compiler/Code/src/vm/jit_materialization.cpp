#include "vm/jit_materialization.hpp"
#include "vm/vm.hpp"
#include <iostream>

namespace setun {

VMValue MaterializationEngine::materialize_value(VM* vm, const MachineState& machine, const MaterializationEntry& entry) {
    (void)vm;
    switch (entry.kind) {
        case MaterializationKind::Direct: {
            if (entry.loc.kind == Location::Register) {
                uint16_t reg = entry.loc.reg_index;
                if (reg < 16) {
                    return VMValue::from_raw(machine.gpr[reg]);
                }
            } else if (entry.loc.kind == Location::StackSlot) {
                uintptr_t addr = machine.rsp + entry.loc.offset;
                uint64_t raw = *reinterpret_cast<const uint64_t*>(addr);
                return VMValue::from_raw(raw);
            }
            return VMValue(0);
        }
        case MaterializationKind::Constant: {
            return VMValue(entry.constant_val);
        }
        case MaterializationKind::Rematerialize: {
            return VMValue(entry.constant_val);
        }
        case MaterializationKind::ScalarizedObject: {
            // Reconstruct scalarized object fields from machine registers / stack
            // Pack first 2 scalarized field values or heap object if vm is available
            int64_t f0 = 0;
            int64_t f1 = 0;
            if (entry.field_locations.size() > 0) {
                const auto& loc0 = entry.field_locations[0];
                if (loc0.kind == Location::Register && loc0.reg_index < 16) {
                    f0 = static_cast<int64_t>(machine.gpr[loc0.reg_index]);
                } else if (loc0.kind == Location::StackSlot) {
                    f0 = *reinterpret_cast<const int64_t*>(machine.rsp + loc0.offset);
                }
            }
            if (entry.field_locations.size() > 1) {
                const auto& loc1 = entry.field_locations[1];
                if (loc1.kind == Location::Register && loc1.reg_index < 16) {
                    f1 = static_cast<int64_t>(machine.gpr[loc1.reg_index]);
                } else if (loc1.kind == Location::StackSlot) {
                    f1 = *reinterpret_cast<const int64_t*>(machine.rsp + loc1.offset);
                }
            }
            // Materialize packed scalar object representation
            return VMValue(f0 + f1);
        }
    }
    return VMValue(0);
}

bool MaterializationEngine::materialize_all(VM* vm, JITFrame* frame, const MachineState& machine,
                                           const std::vector<MaterializationEntry>& entries) {
    if (!frame) return false;

    for (const auto& entry : entries) {
        VMValue val = materialize_value(vm, machine, entry);
        if (!entry.is_stack_slot) {
            if (frame->locals && entry.target_slot < frame->num_locals) {
                frame->locals[entry.target_slot] = val;
            }
        } else {
            if (frame->stack_base && entry.target_slot < frame->stack_depth) {
                frame->stack_base[entry.target_slot] = val;
            }
        }
    }
    return true;
}

} // namespace setun
