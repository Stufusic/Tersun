#include "vm/jit_runtime_helpers.hpp"
#include "vm/vm.hpp"
#include "vm/value.hpp"
#include "vm/opcode.hpp"
#include "tafpu/exception.hpp"
#include <chrono>

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

void* setun_jit_helper_array_raw_data(uint64_t raw_array_val) {
    VMValue val = VMValue::from_raw(raw_array_val);
    if (val.is_array()) {
        auto arr = val.as_array();
        if (arr) {
            if (arr->rep == ArrayRep::Generic) {
                arr->try_promote();
            }
            if (arr->rep == ArrayRep::I64) {
                return arr->i64_data.data();
            }
            return arr->raw_data();
        }
    }
    return nullptr;
}

int64_t setun_jit_helper_get_element_i64(uint64_t raw_array_val, int64_t idx) {
    if (idx < 0) return 0;
    VMValue val = VMValue::from_raw(raw_array_val);
    if (val.is_array()) {
        auto arr = val.as_array();
        if (arr) {
            if (arr->rep == ArrayRep::I64 && static_cast<size_t>(idx) < arr->i64_data.size()) {
                return arr->i64_data[static_cast<size_t>(idx)];
            }
            if (static_cast<size_t>(idx) < arr->size()) {
                return arr->get(static_cast<size_t>(idx)).as_int();
            }
        }
    }
    return 0;
}

void setun_jit_helper_set_element_i64(uint64_t raw_array_val, int64_t idx, int64_t v) {
    if (idx < 0) return;
    VMValue val = VMValue::from_raw(raw_array_val);
    if (val.is_array()) {
        auto arr = val.as_array();
        if (arr) {
            if (arr->rep == ArrayRep::I64 && static_cast<size_t>(idx) < arr->i64_data.size()) {
                arr->i64_data[static_cast<size_t>(idx)] = v;
                return;
            }
            if (static_cast<size_t>(idx) < arr->size()) {
                arr->set(static_cast<size_t>(idx), VMValue(v));
            }
        }
    }
}

uint64_t setun_jit_helper_new_array(uint64_t count) {
    auto arr = std::make_shared<ArrayObject>();
    arr->rep = ArrayRep::I64;
    arr->i64_data.resize(count, 0);
    return VMValue(arr).raw_;
}

void setun_jit_helper_array_push(uint64_t raw_array_val, int64_t val) {
    VMValue v = VMValue::from_raw(raw_array_val);
    if (v.is_array()) {
        auto arr = v.as_array();
        if (arr) {
            if (arr->rep == ArrayRep::I64) {
                arr->i64_data.push_back(val);
            } else {
                arr->push_back(VMValue(val));
                arr->try_promote();
            }
        }
    }
}

static const auto g_process_start = std::chrono::steady_clock::now();

int64_t setun_jit_helper_time_now_us() {
    auto now = std::chrono::steady_clock::now();
    return std::chrono::duration_cast<std::chrono::microseconds>(now - g_process_start).count();
}

void setun_jit_helper_print(uint64_t val_raw, int32_t is_println) {
    VMValue val = VMValue::from_raw(val_raw);
    if (val.is_string()) {
        if (is_println) {
            std::cout << val.to_string() << "\n";
            std::cout.flush();
        } else {
            std::cout << val.to_string();
        }
    } else if (val.is_int()) {
        if (is_println) {
            std::cout << val.as_int() << "\n";
            std::cout.flush();
        } else {
            std::cout << val.as_int();
        }
    } else {
        // Unboxed int64_t from Tier-2 JIT native register
        int64_t raw_i = static_cast<int64_t>(val_raw);
        if (is_println) {
            std::cout << raw_i << "\n";
            std::cout.flush();
        } else {
            std::cout << raw_i;
        }
    }
}

} // extern "C"

} // namespace setun
