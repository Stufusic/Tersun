#include "vm/jit_runtime_helpers.hpp"
#include "vm/vm.hpp"
#include "vm/value.hpp"
#include "vm/opcode.hpp"
#include "tafpu/exception.hpp"

namespace setun {

extern "C" {

int64_t setun_jit_helper_div_zero_error(VM* /*vm*/) {
    throw VMException("Division by zero in integer arithmetic.");
}

int64_t setun_jit_helper_mod_zero_error(VM* /*vm*/) {
    throw VMException("Division by zero in integer modulo.");
}

int64_t setun_jit_helper_safepoint_poll(VM* vm, JITFrame* frame, uint32_t safepoint_id) {
    if (frame) {
        frame->safepoint_id = safepoint_id;
    }
    if (vm) {
        vm->gc_engine().safepoint(*vm);
    }
    return 0;
}

int64_t setun_jit_helper_call_function(VM* vm, JITFrame* frame, uint32_t func_idx, uint32_t nargs) {
    if (!vm || !frame) return 0;
    // Slow-path function call through VM dispatch
    // In baseline JIT, nested calls can safely call through VM
    return 0;
}

int64_t setun_jit_helper_generic_binary(uint64_t raw_a, uint64_t raw_b, uint32_t op) {
    VMValue a = VMValue::from_raw(raw_a);
    VMValue b = VMValue::from_raw(raw_b);
    VMValue res;

    switch (static_cast<OpCode>(op)) {
        case OpCode::OP_ADD:
            res = a.add(b);
            break;
        case OpCode::OP_SUB:
            res = a.sub(b);
            break;
        case OpCode::OP_MUL:
            res = a.mul(b);
            break;
        case OpCode::OP_DIV:
            res = a.div(b);
            break;
        case OpCode::OP_MOD:
            res = a.mod(b);
            break;
        case OpCode::OP_BIT_AND:
            res = a.bit_and(b);
            break;
        case OpCode::OP_BIT_OR:
            res = a.bit_or(b);
            break;
        case OpCode::OP_BIT_XOR:
            res = a.bit_xor(b);
            break;
        case OpCode::OP_SHL:
            res = a.shl(b);
            break;
        case OpCode::OP_SHR:
            res = a.shr(b);
            break;
        case OpCode::OP_EQ:
            res = VMValue(a.as_int() == b.as_int());
            break;
        case OpCode::OP_NEQ:
            res = VMValue(a.as_int() != b.as_int());
            break;
        case OpCode::OP_LT:
            res = VMValue(a.as_int() < b.as_int());
            break;
        case OpCode::OP_LE:
            res = VMValue(a.as_int() <= b.as_int());
            break;
        case OpCode::OP_GT:
            res = VMValue(a.as_int() > b.as_int());
            break;
        case OpCode::OP_GE:
            res = VMValue(a.as_int() >= b.as_int());
            break;
        default:
            res = VMValue(static_cast<int64_t>(0));
            break;
    }
    return static_cast<int64_t>(res.as_raw());
}

int64_t setun_jit_helper_bailout(VM* /*vm*/, JITFrame* frame, uint32_t bytecode_offset) {
    if (frame) {
        frame->deopt_code = static_cast<int64_t>(bytecode_offset);
    }
    return -1;
}

int64_t setun_jit_helper_deopt(VM* vm, JITFrame* frame, uint32_t /*deopt_id*/, uint32_t target_bytecode_ip) {
    if (frame) {
        frame->deopt_code = static_cast<int64_t>(target_bytecode_ip);
    }
    if (vm) {
        vm->set_ip(target_bytecode_ip);
    }
    return -1;
}

int64_t setun_jit_helper_deopt_machine(VM* vm, JITFrame* frame, MachineState* machine, uint32_t deopt_id) {
    if (!frame) return -1;
    if (machine) {
        frame->last_machine_state = *machine;
    }
    frame->exit_reason = JITExitReason::Deopt;
    frame->deopt_code = static_cast<int64_t>(deopt_id);

    if (vm) {
        vm->set_ip(deopt_id);
    }
    return -1;
}

} // extern "C"

} // namespace setun
