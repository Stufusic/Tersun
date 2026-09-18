#include "vm/jit_deopt.hpp"
#include "vm/jit_frame.hpp"
#include "vm/vm.hpp"

namespace setun {

static VMValue extract_location_value(const Location& loc, const MachineState& machine, const JITFrame* frame) {
    switch (loc.kind) {
        case Location::Register: {
            if (loc.reg_index < 16) {
                return VMValue::from_raw(machine.gpr[loc.reg_index]);
            }
            break;
        }
        case Location::StackSlot: {
            // Read relative to RBP or fallback to locals
            if (machine.rbp != 0) {
                const uint64_t* ptr = reinterpret_cast<const uint64_t*>(machine.rbp + loc.offset);
                return VMValue::from_raw(*ptr);
            } else if (frame && frame->locals && loc.offset >= 0) {
                size_t slot = static_cast<size_t>(loc.offset / 8);
                if (slot < frame->num_locals) {
                    return frame->locals[slot];
                }
            }
            break;
        }
        case Location::Constant: {
            return VMValue(loc.constant_val);
        }
        case Location::Rematerialize: {
            return VMValue(static_cast<int64_t>(0));
        }
    }
    return VMValue();
}

bool reconstruct_interpreter_state(VM* vm, JITFrame* frame, const DeoptRecord& rec) {
    if (!vm || !frame) return false;

    // 1. Sync live locals from JITFrame to VM locals
    if (frame->locals && frame->num_locals > 0) {
        if (vm->locals().size() < frame->num_locals) {
            vm->locals().resize(frame->num_locals);
        }
        for (size_t i = 0; i < frame->num_locals; ++i) {
            vm->locals()[i] = frame->locals[i];
        }
    }

    // 2. Set VM instruction pointer to target bytecode IP for deopt resumption
    vm->set_ip(rec.target_bytecode_ip);

    // 3. Mark deopt_code in frame
    frame->deopt_code = static_cast<int64_t>(rec.target_bytecode_ip);

    return true;
}

bool reconstruct_interpreter_state_advanced(
    VM* vm, JITFrame* frame, const MachineState& machine, const DeoptRecord& rec, DeoptContinuation& out_cont) {
    if (!vm || !frame) return false;

    // Save machine snapshot into frame
    frame->last_machine_state = machine;
    frame->exit_reason = JITExitReason::Deopt;

    // 1. Extract locals according to rec.locals_mapping if provided
    if (!rec.locals_mapping.empty()) {
        if (vm->locals().size() < rec.locals_mapping.size()) {
            vm->locals().resize(rec.locals_mapping.size());
        }
        for (size_t i = 0; i < rec.locals_mapping.size(); ++i) {
            vm->locals()[i] = extract_location_value(rec.locals_mapping[i], machine, frame);
            if (frame->locals && i < frame->num_locals) {
                frame->locals[i] = vm->locals()[i];
            }
        }
    } else if (frame->locals && frame->num_locals > 0) {
        // Fallback to sync direct locals buffer
        if (vm->locals().size() < frame->num_locals) {
            vm->locals().resize(frame->num_locals);
        }
        for (size_t i = 0; i < frame->num_locals; ++i) {
            vm->locals()[i] = frame->locals[i];
        }
    }

    // 2. Reconstruct operand stack if mappings provided
    if (!rec.stack_mapping.empty()) {
        vm->stack().clear();
        for (size_t i = 0; i < rec.stack_mapping.size(); ++i) {
            vm->stack().push(extract_location_value(rec.stack_mapping[i], machine, frame));
        }
    }

    // 3. Process Materialization Entries (Gate 5.9 Tier-2 JIT)
    if (!rec.materializations.empty()) {
        MaterializationEngine::materialize_all(vm, frame, machine, rec.materializations);
    }

    // 4. Setup deopt continuation
    out_cont.bytecode_ip = rec.target_bytecode_ip;
    out_cont.stack_depth = static_cast<uint32_t>(vm->stack().size());
    out_cont.local_base = 0;
    out_cont.should_resume = true;

    frame->continuation = out_cont;
    frame->deopt_code = static_cast<int64_t>(rec.target_bytecode_ip);
    vm->set_ip(rec.target_bytecode_ip);

    return true;
}

} // namespace setun
