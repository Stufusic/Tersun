#include "vm/vm.hpp"
#include "graphics/setun2d_bridge.hpp"
#include "tafpu/bitnet_engine.hpp"
#include "tafpu/exception.hpp"
#include <iostream>
#include <fstream>
#include <filesystem>
#include <sstream>
#include <iomanip>
#include <cstring>
#include <cmath>
#include <algorithm>
#include <chrono>

namespace setun {

// Last filesystem error message reported by the HostFs native API
// (queried from scripts via host.fs_err(); empty string means success).
static std::string g_last_fs_error;

// MATLAB short-g style float rendering: up to 5 significant digits,
// trailing zeros stripped by defaultfloat formatting.
static std::string fmt_short_g(double d) {
    std::ostringstream oss;
    if (d == 0.0) return "0";
    oss << std::setprecision(5) << d;
    return oss.str();
}

// Render a value per an f-string format spec:
//   ""   -> short-g for floats, default to_string otherwise
//   "g"  -> MATLAB short-g
//   ".Nf"-> fixed-point with N decimals
//   "e"  -> scientific notation
//   "t"  -> balanced-ternary digits (ints/trytes)
//   "d"/"s" -> default to_string
static std::string format_vm_value(const VMValue& v, const std::string& spec) {
    if (spec.empty() || spec == "g") {
        if (v.is_float()) return fmt_short_g(v.as_float());
        return v.to_string();
    }
    if (spec.size() >= 3 && spec[0] == '.' && spec.back() == 'f') {
        int prec = std::atoi(spec.substr(1, spec.size() - 2).c_str());
        std::ostringstream oss;
        oss << std::fixed << std::setprecision(prec) << v.as_float();
        return oss.str();
    }
    if (spec == "e") {
        std::ostringstream oss;
        oss << std::scientific << v.as_float();
        return oss.str();
    }
    if (spec == "t") {
        if (v.is_int()) return to_ternary_string(v.as_int());
        if (v.is_tryte()) return to_ternary_string(static_cast<int64_t>(v.as_tryte()));
        return v.to_string();
    }
    return v.to_string();
}

VM::VM() {
    locals_.resize(256);
    globals_.resize(256);
    init_dispatch_table();
    reset();
}

void VM::reset() {
    ip_ = 0;
    running_ = false;
    stack_.clear();
    std::fill(locals_.begin(), locals_.end(), VMValue{});
    std::fill(globals_.begin(), globals_.end(), VMValue{});
    call_stack_.clear();
    for (auto& r : tafpu_regs_) r = TafpuNum{};
    for (auto& r : tryte_regs_) r = 0;
    output_buffer_.clear();
}

void VM::init_dispatch_table() {
    dispatch_table_.fill(nullptr);

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NOP)] = &VM::handle_nop;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_INT)] = &VM::handle_push_int;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_TRYTE)] = &VM::handle_push_tryte;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_TAFPU)] = &VM::handle_push_tafpu;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_FLOAT)] = &VM::handle_push_float;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_STRING)] = &VM::handle_push_string;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PUSH_BOOL)] = &VM::handle_push_bool;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_POP)] = &VM::handle_pop;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_DUP)] = &VM::handle_dup;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_LOAD_LOCAL)] = &VM::handle_load_local;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_STORE_LOCAL)] = &VM::handle_store_local;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_LOAD_GLOBAL)] = &VM::handle_load_global;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_STORE_GLOBAL)] = &VM::handle_store_global;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_ADD)] = &VM::handle_add;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_SUB)] = &VM::handle_sub;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_MUL)] = &VM::handle_mul;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_DIV)] = &VM::handle_div;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NEG)] = &VM::handle_neg;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TERNARY_NOT)] = &VM::handle_ternary_not;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TERNARY_CMP)] = &VM::handle_ternary_cmp;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TERNARY_MIN)] = &VM::handle_ternary_min;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TERNARY_MAX)] = &VM::handle_ternary_max;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_EQ)] = &VM::handle_eq;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NEQ)] = &VM::handle_neq;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_LT)] = &VM::handle_lt;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_LE)] = &VM::handle_le;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GT)] = &VM::handle_gt;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GE)] = &VM::handle_ge;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TAFPU_CONSTRUCT)] = &VM::handle_tafpu_construct;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TAFPU_ENCODE)] = &VM::handle_tafpu_encode;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TAFPU_TODBL)] = &VM::handle_tafpu_todbl;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_JUMP)] = &VM::handle_jump;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_JUMP_IF_FALSE)] = &VM::handle_jump_if_false;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_BRANCH_3)] = &VM::handle_branch_3;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_CALL)] = &VM::handle_call;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_RET)] = &VM::handle_ret;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PRINT)] = &VM::handle_print;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_PRINTLN)] = &VM::handle_println;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TRACE)] = &VM::handle_trace;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_ASSERT_EQ)] = &VM::handle_assert_eq;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_HALT)] = &VM::handle_halt;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_INIT)] = &VM::handle_gfx_init;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_IS_RUNNING)] = &VM::handle_gfx_is_running;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_CLEAR)] = &VM::handle_gfx_clear;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_DRAW_RECT)] = &VM::handle_gfx_draw_rect;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_DRAW_CIRCLE)] = &VM::handle_gfx_draw_circle;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_DRAW_TEXT)] = &VM::handle_gfx_draw_text;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_FLIP)] = &VM::handle_gfx_flip;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_GET_KEY)] = &VM::handle_gfx_get_key;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GFX_CLOSE)] = &VM::handle_gfx_close;

    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_CREATE_DENSE)] = &VM::handle_nn_create_dense;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_SET_WEIGHT)] = &VM::handle_nn_set_weight;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_SET_BIAS)] = &VM::handle_nn_set_bias;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_SET_INPUT)] = &VM::handle_nn_set_input;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_GET_INPUT)] = &VM::handle_nn_get_input;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_FORWARD)] = &VM::handle_nn_forward;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_GET_OUTPUT)] = &VM::handle_nn_get_output;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_COPY_OUT_IN)] = &VM::handle_nn_copy_out_in;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_PREDICT)] = &VM::handle_nn_predict;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_CONFIDENCE)] = &VM::handle_nn_confidence;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_LOAD_MNIST)] = &VM::handle_nn_load_mnist;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NN_FREE_LAYER)] = &VM::handle_nn_free_layer;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TIME_NOW_US)] = &VM::handle_time_now_us;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GET_FIELD)] = &VM::handle_get_field;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_GET_INDEX)] = &VM::handle_get_index;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NEW_INSTANCE)] = &VM::handle_new_instance;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_SET_FIELD)] = &VM::handle_set_field;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_INVOKE_METHOD)] = &VM::handle_invoke_method;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_SET_INDEX)] = &VM::handle_set_index;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_NEW_ARRAY)] = &VM::handle_new_array;
}

void VM::run(const Chunk& chunk) {
    ip_ = 0;
    running_ = true;

    for (const auto& [cname, methods] : chunk.vtables) {
        auto vt = std::make_shared<VTable>();
        vt->class_name = cname;
        vt->methods = methods;
        vtables_[cname] = vt;
    }

    while (running_ && ip_ < chunk.code.size()) {
        uint8_t opcode_byte = chunk.code[ip_++];
        OpHandler handler = dispatch_table_[opcode_byte];
        if (!handler) {
            std::ostringstream oss;
            oss << "VM Exception: Unknown opcode 0x" << std::hex << static_cast<int>(opcode_byte) << " at offset " << std::dec << (ip_ - 1);
            throw VMException(oss.str());
        }
        (this->*handler)(chunk);
    }
}

uint8_t VM::read_byte(const Chunk& chunk) {
    if (ip_ >= chunk.code.size()) throw VMException("Unexpected EOF in bytecode stream.");
    return chunk.code[ip_++];
}

int16_t VM::read_int16(const Chunk& chunk) {
    uint8_t b1 = read_byte(chunk);
    uint8_t b2 = read_byte(chunk);
    return static_cast<int16_t>(b1 | (b2 << 8));
}

int32_t VM::read_int32(const Chunk& chunk) {
    int32_t val = 0;
    for (int i = 0; i < 4; ++i) {
        val |= (static_cast<int32_t>(read_byte(chunk)) << (i * 8));
    }
    return val;
}

int64_t VM::read_int64(const Chunk& chunk) {
    int64_t val = 0;
    for (int i = 0; i < 8; ++i) {
        val |= (static_cast<int64_t>(read_byte(chunk)) << (i * 8));
    }
    return val;
}

double VM::read_double(const Chunk& chunk) {
    uint64_t bits = static_cast<uint64_t>(read_int64(chunk));
    double val;
    std::memcpy(&val, &bits, sizeof(double));
    return val;
}

void VM::handle_nop(const Chunk&) {}

void VM::handle_push_int(const Chunk& chunk) {
    int64_t val = read_int64(chunk);
    stack_.push(val);
}

void VM::handle_push_tryte(const Chunk& chunk) {
    int16_t val = read_int16(chunk);
    stack_.push(val);
}

void VM::handle_push_tafpu(const Chunk& chunk) {
    int64_t a = read_int64(chunk);
    int64_t b = read_int64(chunk);
    int32_t s = read_int32(chunk);
    stack_.push(TafpuNum(a, b, s));
}

void VM::handle_push_float(const Chunk& chunk) {
    double val = read_double(chunk);
    stack_.push(val);
}

void VM::handle_push_string(const Chunk& chunk) {
    uint16_t str_id = static_cast<uint16_t>(read_int16(chunk));
    if (str_id >= chunk.string_table.size()) {
        throw VMException("Invalid string table index in bytecode: " + std::to_string(str_id));
    }
    stack_.push(chunk.string_table[str_id]);
}

void VM::handle_push_bool(const Chunk& chunk) {
    uint8_t b = read_byte(chunk);
    stack_.push(b != 0);
}

void VM::handle_pop(const Chunk&) {
    stack_.pop();
}

void VM::handle_dup(const Chunk&) {
    VMValue top = stack_.peek();
    stack_.push(top);
}

void VM::handle_load_local(const Chunk& chunk) {
    uint16_t slot = static_cast<uint16_t>(read_int16(chunk));
    size_t base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
    size_t idx = base + slot;
    if (idx >= locals_.size()) locals_.resize(idx + 32);
    stack_.push(locals_[idx]);
}

void VM::handle_store_local(const Chunk& chunk) {
    uint16_t slot = static_cast<uint16_t>(read_int16(chunk));
    size_t base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
    size_t idx = base + slot;
    if (idx >= locals_.size()) locals_.resize(idx + 32);
    locals_[idx] = stack_.peek();
}

void VM::handle_load_global(const Chunk& chunk) {
    uint16_t slot = static_cast<uint16_t>(read_int16(chunk));
    if (slot >= globals_.size()) globals_.resize(slot + 32);
    stack_.push(globals_[slot]);
}

void VM::handle_store_global(const Chunk& chunk) {
    uint16_t slot = static_cast<uint16_t>(read_int16(chunk));
    if (slot >= globals_.size()) globals_.resize(slot + 32);
    globals_[slot] = stack_.peek();
}

void VM::handle_add(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.add(b));
}

void VM::handle_sub(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.sub(b));
}

void VM::handle_mul(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.mul(b));
}

void VM::handle_div(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.div(b));
}

void VM::handle_neg(const Chunk&) {
    VMValue val = stack_.pop();
    stack_.push(val.neg());
}

void VM::handle_ternary_not(const Chunk&) {
    VMValue val = stack_.pop();
    if (val.is_tryte()) {
        stack_.push(static_cast<int16_t>(-val.as_tryte()));
    } else {
        stack_.push(-val.as_int());
    }
}

void VM::handle_ternary_cmp(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.ternary_cmp(b));
}

void VM::handle_ternary_min(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_tafpu() || b.is_tafpu()) {
        int cmp = tafpu_cmp(a.as_tafpu(), b.as_tafpu());
        stack_.push(cmp <= 0 ? a : b);
    } else {
        int64_t v1 = a.as_int();
        int64_t v2 = b.as_int();
        // Preserve bool-ness so '&&' (lowered to min) stays a bool.
        if (a.is_bool() && b.is_bool()) {
            stack_.push(VMValue(v1 < v2 ? v1 != 0 : v2 != 0));
            return;
        }
        stack_.push(v1 < v2 ? v1 : v2);
    }
}

void VM::handle_ternary_max(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_tafpu() || b.is_tafpu()) {
        int cmp = tafpu_cmp(a.as_tafpu(), b.as_tafpu());
        stack_.push(cmp >= 0 ? a : b);
    } else {
        int64_t v1 = a.as_int();
        int64_t v2 = b.as_int();
        // Preserve bool-ness so '||' (lowered to max) stays a bool.
        if (a.is_bool() && b.is_bool()) {
            stack_.push(VMValue(v1 > v2 ? v1 != 0 : v2 != 0));
            return;
        }
        stack_.push(v1 > v2 ? v1 : v2);
    }
}

void VM::handle_eq(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() == b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) == 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(std::abs(a.as_float() - b.as_float()) < 1e-12);
    } else {
        stack_.push(a.as_int() == b.as_int());
    }
}

void VM::handle_neq(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() != b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) != 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(std::abs(a.as_float() - b.as_float()) >= 1e-12);
    } else {
        stack_.push(a.as_int() != b.as_int());
    }
}

void VM::handle_lt(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() < b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) < 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(a.as_float() < b.as_float());
    } else {
        stack_.push(a.as_int() < b.as_int());
    }
}

void VM::handle_le(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() <= b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) <= 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(a.as_float() <= b.as_float());
    } else {
        stack_.push(a.as_int() <= b.as_int());
    }
}

void VM::handle_gt(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() > b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) > 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(a.as_float() > b.as_float());
    } else {
        stack_.push(a.as_int() > b.as_int());
    }
}

void VM::handle_ge(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_string() || b.is_string()) {
        stack_.push(a.to_string() >= b.to_string());
    } else if (a.is_tafpu() || b.is_tafpu()) {
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) >= 0);
    } else if (a.is_float() || b.is_float()) {
        stack_.push(a.as_float() >= b.as_float());
    } else {
        stack_.push(a.as_int() >= b.as_int());
    }
}

void VM::handle_tafpu_construct(const Chunk&) {
    VMValue s_val = stack_.pop();
    VMValue b_val = stack_.pop();
    VMValue a_val = stack_.pop();
    stack_.push(TafpuNum(a_val.as_int(), b_val.as_int(), static_cast<int32_t>(s_val.as_int())));
}

void VM::handle_tafpu_encode(const Chunk&) {
    VMValue val = stack_.pop();
    double dbl = val.as_float();
    stack_.push(encode_dynamic(dbl));
}

void VM::handle_tafpu_todbl(const Chunk&) {
    VMValue val = stack_.pop();
    stack_.push(val.as_tafpu().to_double());
}

void VM::handle_jump(const Chunk& chunk) {
    int16_t offset = read_int16(chunk);
    ip_ += offset;
}

void VM::handle_jump_if_false(const Chunk& chunk) {
    int16_t offset = read_int16(chunk);
    VMValue cond = stack_.pop();
    if (!cond.as_bool()) {
        ip_ += offset;
    }
}

// Setun-70 3-way Branching Handler
// Opcode format: OP_BRANCH_3 <int16_t neg_offset> <int16_t zero_offset> <int16_t pos_offset>
void VM::handle_branch_3(const Chunk& chunk) {
    int16_t neg_offset = read_int16(chunk);
    int16_t zero_offset = read_int16(chunk);
    int16_t pos_offset = read_int16(chunk);

    VMValue val = stack_.pop();

    int branch_sign = 0; // -1, 0, 1
    if (val.is_tafpu()) {
        TafpuNum num = val.as_tafpu();
        branch_sign = tafpu_cmp(num, TafpuNum(0, 0, 0));
    } else if (val.is_float()) {
        double d = val.as_float();
        if (d < -1e-12) branch_sign = -1;
        else if (d > 1e-12) branch_sign = 1;
        else branch_sign = 0;
    } else {
        int64_t n = val.as_int();
        if (n < 0) branch_sign = -1;
        else if (n > 0) branch_sign = 1;
        else branch_sign = 0;
    }

    if (branch_sign < 0) {
        // Negative branch (neg_offset is relative to right after neg_offset field)
        ip_ = (ip_ - 4) + neg_offset;
    } else if (branch_sign == 0) {
        // Zero branch (zero_offset is relative to right after zero_offset field)
        ip_ = (ip_ - 2) + zero_offset;
    } else {
        // Positive branch (pos_offset is relative to current IP)
        ip_ = ip_ + pos_offset;
    }
}

void VM::handle_call(const Chunk& chunk) {
    uint16_t fn_entry = static_cast<uint16_t>(read_int16(chunk));
    uint8_t argc = read_byte(chunk);

    size_t new_local_base = locals_.size();
    locals_.resize(new_local_base + argc + 32);

    // Pop arguments from stack in reverse order and store in new local base
    for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
        locals_[new_local_base + i] = stack_.pop();
    }

    call_stack_.push_back(CallFrame{ip_, new_local_base});
    ip_ = fn_entry;
}

void VM::handle_ret(const Chunk&) {
    if (call_stack_.empty()) {
        running_ = false;
        return;
    }
    VMValue ret_val = stack_.pop();
    CallFrame frame = call_stack_.back();
    call_stack_.pop_back();

    // Restore local variables to caller's frame
    locals_.resize(frame.local_base);

    // Jump back to return IP
    ip_ = frame.return_ip;

    // Push return value onto caller's stack
    stack_.push(ret_val);
}

void VM::handle_print(const Chunk&) {
    VMValue val = stack_.pop();
    std::string s = val.to_string();
    std::cout << s;
    output_buffer_ += s;
    stack_.push(VMValue{}); // Push Nil result
}

void VM::handle_println(const Chunk&) {
    VMValue val = stack_.pop();
    std::string s = val.to_string() + "\n";
    std::cout << s;
    output_buffer_ += s;
    stack_.push(VMValue{}); // Push Nil result
}

void VM::handle_trace(const Chunk& chunk) {
    dump_state(chunk, ip_);
    stack_.push(VMValue{}); // Push Nil result
}

void VM::handle_assert_eq(const Chunk&) {
    VMValue expected = stack_.pop();
    VMValue actual = stack_.pop();

    bool equal = false;
    if (actual.is_string() || expected.is_string()) {
        equal = (actual.to_string() == expected.to_string());
    } else if (actual.is_tafpu() || expected.is_tafpu()) {
        equal = (tafpu_cmp(actual.as_tafpu(), expected.as_tafpu()) == 0);
    } else if (actual.is_float() || expected.is_float()) {
        equal = (std::abs(actual.as_float() - expected.as_float()) < 1e-6);
    } else {
        equal = (actual.as_int() == expected.as_int());
    }

    if (!equal) {
        std::ostringstream oss;
        oss << "Assertion Failed: expected '" << expected.to_string()
            << "', but got '" << actual.to_string() << "'";
        throw VMException(oss.str());
    }
    stack_.push(VMValue{true});
}

void VM::handle_halt(const Chunk&) {
    running_ = false;
}

void VM::dump_state(const Chunk&, size_t current_ip) const {
    std::cout << "\n--- [Setun-70 VM State at IP: " << current_ip << "] ---\n";
    std::cout << "Stack (" << stack_.size() << " items): ";
    for (const auto& v : stack_.raw_stack()) {
        std::cout << "[" << v.to_string() << "] ";
    }
    std::cout << "\n";
    std::cout << "-------------------------------------------\n";
}

void VM::handle_gfx_init(const Chunk&) {
    VMValue title_val = stack_.pop();
    VMValue h_val = stack_.pop();
    VMValue w_val = stack_.pop();
    std::string title = title_val.to_string();
    int h = static_cast<int>(h_val.as_int());
    int w = static_cast<int>(w_val.as_int());
    bool ok = graphics::Setun2DBridge::instance().init(w, h, title);
    stack_.push(VMValue{ok ? 1LL : 0LL});
}

void VM::handle_gfx_is_running(const Chunk&) {
    bool r = graphics::Setun2DBridge::instance().is_running();
    stack_.push(VMValue{r ? 1LL : 0LL});
}

void VM::handle_gfx_clear(const Chunk&) {
    VMValue c = stack_.pop();
    graphics::Setun2DBridge::instance().clear(static_cast<uint32_t>(c.as_int()));
    stack_.push(VMValue{});
}

void VM::handle_gfx_draw_rect(const Chunk&) {
    VMValue c = stack_.pop();
    VMValue h = stack_.pop();
    VMValue w = stack_.pop();
    VMValue y = stack_.pop();
    VMValue x = stack_.pop();
    graphics::Setun2DBridge::instance().draw_rect(
        static_cast<int>(x.as_int()),
        static_cast<int>(y.as_int()),
        static_cast<int>(w.as_int()),
        static_cast<int>(h.as_int()),
        static_cast<uint32_t>(c.as_int())
    );
    stack_.push(VMValue{});
}

void VM::handle_gfx_draw_circle(const Chunk&) {
    VMValue c = stack_.pop();
    VMValue r = stack_.pop();
    VMValue cy = stack_.pop();
    VMValue cx = stack_.pop();
    graphics::Setun2DBridge::instance().draw_circle(
        static_cast<int>(cx.as_int()),
        static_cast<int>(cy.as_int()),
        static_cast<int>(r.as_int()),
        static_cast<uint32_t>(c.as_int())
    );
    stack_.push(VMValue{});
}

void VM::handle_gfx_draw_text(const Chunk&) {
    VMValue c = stack_.pop();
    VMValue text = stack_.pop();
    VMValue y = stack_.pop();
    VMValue x = stack_.pop();
    graphics::Setun2DBridge::instance().draw_text(
        static_cast<int>(x.as_int()),
        static_cast<int>(y.as_int()),
        text.to_string(),
        static_cast<uint32_t>(c.as_int())
    );
    stack_.push(VMValue{});
}

void VM::handle_gfx_flip(const Chunk&) {
    int key = graphics::Setun2DBridge::instance().flip();
    stack_.push(VMValue{static_cast<int64_t>(key)});
}

void VM::handle_gfx_get_key(const Chunk&) {
    int key = graphics::Setun2DBridge::instance().get_key();
    stack_.push(VMValue{static_cast<int64_t>(key)});
}

void VM::handle_gfx_close(const Chunk&) {
    graphics::Setun2DBridge::instance().close();
    stack_.push(VMValue{});
}

// ============================================================================
// BitNet 1.58-bit AI Engine Handlers
// ============================================================================

void VM::handle_nn_create_dense(const Chunk&) {
    VMValue act = stack_.pop();
    VMValue out_dim = stack_.pop();
    VMValue in_dim = stack_.pop();
    int id = setun_nn_create_dense(
        static_cast<int>(in_dim.as_int()),
        static_cast<int>(out_dim.as_int()),
        static_cast<int>(act.as_int())
    );
    stack_.push(VMValue{static_cast<int64_t>(id)});
}

void VM::handle_nn_set_weight(const Chunk&) {
    VMValue val = stack_.pop();
    VMValue col = stack_.pop();
    VMValue row = stack_.pop();
    VMValue layer_id = stack_.pop();
    setun_nn_set_weight(
        static_cast<int>(layer_id.as_int()),
        static_cast<int>(row.as_int()),
        static_cast<int>(col.as_int()),
        static_cast<int>(val.as_int())
    );
    stack_.push(VMValue{});
}

void VM::handle_nn_set_bias(const Chunk&) {
    VMValue val = stack_.pop();
    VMValue row = stack_.pop();
    VMValue layer_id = stack_.pop();
    setun_nn_set_bias(
        static_cast<int>(layer_id.as_int()),
        static_cast<int>(row.as_int()),
        val.as_int()
    );
    stack_.push(VMValue{});
}

void VM::handle_nn_set_input(const Chunk&) {
    VMValue val = stack_.pop();
    VMValue index = stack_.pop();
    setun_nn_set_input(
        static_cast<int>(index.as_int()),
        val.as_int()
    );
    stack_.push(VMValue{});
}

void VM::handle_nn_get_input(const Chunk&) {
    VMValue index = stack_.pop();
    int64_t val = setun_nn_get_input(static_cast<int>(index.as_int()));
    stack_.push(VMValue{val});
}

void VM::handle_nn_forward(const Chunk&) {
    VMValue layer_id = stack_.pop();
    setun_nn_forward(static_cast<int>(layer_id.as_int()));
    stack_.push(VMValue{});
}

void VM::handle_nn_get_output(const Chunk&) {
    VMValue index = stack_.pop();
    VMValue layer_id = stack_.pop();
    int64_t val = setun_nn_get_output(
        static_cast<int>(layer_id.as_int()),
        static_cast<int>(index.as_int())
    );
    stack_.push(VMValue{val});
}

void VM::handle_nn_copy_out_in(const Chunk&) {
    VMValue layer_id = stack_.pop();
    setun_nn_copy_output_to_input(static_cast<int>(layer_id.as_int()));
    stack_.push(VMValue{});
}

void VM::handle_nn_predict(const Chunk&) {
    VMValue layer_id = stack_.pop();
    int pred = setun_nn_predict(static_cast<int>(layer_id.as_int()));
    stack_.push(VMValue{static_cast<int64_t>(pred)});
}

void VM::handle_nn_confidence(const Chunk&) {
    VMValue pred_class = stack_.pop();
    VMValue layer_id = stack_.pop();
    int conf = setun_nn_get_confidence(
        static_cast<int>(layer_id.as_int()),
        static_cast<int>(pred_class.as_int())
    );
    stack_.push(VMValue{static_cast<int64_t>(conf)});
}

void VM::handle_nn_load_mnist(const Chunk&) {
    VMValue digit = stack_.pop();
    setun_nn_load_mnist_sample(static_cast<int>(digit.as_int()));
    stack_.push(VMValue{});
}

void VM::handle_nn_free_layer(const Chunk&) {
    VMValue layer_id = stack_.pop();
    setun_nn_free_layer(static_cast<int>(layer_id.as_int()));
    stack_.push(VMValue{});
}

void VM::handle_time_now_us(const Chunk&) {
    auto now = std::chrono::high_resolution_clock::now();
    int64_t us = std::chrono::duration_cast<std::chrono::microseconds>(now.time_since_epoch()).count();
    stack_.push(VMValue{us});
}

void VM::handle_get_field(const Chunk& chunk) {
    uint16_t str_id = static_cast<uint16_t>(read_int16(chunk));
    std::string field = (str_id < chunk.string_table.size()) ? chunk.string_table[str_id] : "";
    VMValue obj = stack_.pop();

    if (obj.is_object()) {
        auto vmo = obj.as_object();
        if (vmo) {
            if (field == "len" || field == "length") {
                stack_.push(VMValue(static_cast<int64_t>(vmo->fields.size())));
                return;
            }
            if (!vmo->fields.count(field)) {
                throw VMException("Object of type '" + vmo->type_name + "' has no field '" + field + "'.");
            }
            stack_.push(vmo->get_field(field));
            return;
        }
    } else if (obj.is_array()) {
        auto arr = obj.as_array();
        if (field == "len" || field == "length") {
            stack_.push(VMValue(static_cast<int64_t>(arr ? arr->size() : 0)));
            return;
        }
    } else if (obj.is_tafpu()) {
        TafpuNum num = obj.as_tafpu();
        if (field == "len" || field == "length") {
            stack_.push(VMValue(static_cast<int64_t>(3)));
            return;
        }
        if (field == "a" || field == "x") stack_.push(VMValue(num.a));
        else if (field == "b" || field == "y") stack_.push(VMValue(num.b));
        else if (field == "s" || field == "z") stack_.push(VMValue(static_cast<int64_t>(num.s)));
        else stack_.push(VMValue(static_cast<int64_t>(0)));
        return;
    } else if (obj.is_string()) {
        if (field == "length" || field == "len") {
            stack_.push(VMValue(static_cast<int64_t>(obj.to_string().size())));
            return;
        }
    }
    stack_.push(VMValue(static_cast<int64_t>(0)));
}

void VM::handle_get_index(const Chunk&) {
    VMValue idx = stack_.pop();
    VMValue obj = stack_.pop();

    if (obj.is_array()) {
        auto arr = obj.as_array();
        if (arr && !arr->empty()) {
            int64_t i = idx.as_int();
            if (i < 0) i += arr->size(); // Python negative index support
            if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                stack_.push((*arr)[i]);
                return;
            }
        }
        stack_.push(VMValue(static_cast<int64_t>(0)));
        return;
    }

    if (obj.is_string()) {
        std::string s = obj.to_string();
        int64_t i = idx.as_int();
        if (i < 0) i += s.size();
        if (i >= 0 && static_cast<size_t>(i) < s.size()) {
            stack_.push(VMValue(std::string(1, s[i])));
        } else {
            stack_.push(VMValue(""));
        }
        return;
    }

    if (obj.is_tafpu()) {
        TafpuNum num = obj.as_tafpu();
        int64_t i = idx.as_int();
        if (i == 0) stack_.push(VMValue(num.a));
        else if (i == 1) stack_.push(VMValue(num.b));
        else if (i == 2) stack_.push(VMValue(static_cast<int64_t>(num.s)));
        else stack_.push(VMValue(static_cast<int64_t>(0)));
        return;
    }

    if (obj.is_object()) {
        auto vmo = obj.as_object();
        if (vmo) {
            stack_.push(vmo->get_field(idx.to_string()));
            return;
        }
    }

    stack_.push(VMValue(static_cast<int64_t>(0)));
}

void VM::handle_new_instance(const Chunk& chunk) {
    uint16_t tid = static_cast<uint16_t>(read_int16(chunk));
    uint8_t field_count = read_byte(chunk);
    std::string type_name = (tid < chunk.string_table.size()) ? chunk.string_table[tid] : "Object";

    std::vector<VMValue> vals(field_count);
    for (int i = static_cast<int>(field_count) - 1; i >= 0; --i) {
        vals[i] = stack_.pop();
    }

    auto obj = std::make_shared<VMObject>();
    obj->type_name = type_name;
    obj->is_class = true;

    auto it = vtables_.find(type_name);
    if (it != vtables_.end()) {
        obj->vtable = it->second;
    }

    if (type_name == "tvec3" && field_count == 3) {
        obj->fields["x"] = vals[0];
        obj->fields["y"] = vals[1];
        obj->fields["z"] = vals[2];
        obj->fields["a"] = vals[0];
        obj->fields["b"] = vals[1];
        obj->fields["s"] = vals[2];
    } else {
        for (size_t i = 0; i < field_count; ++i) {
            obj->fields["field_" + std::to_string(i)] = vals[i];
        }
    }

    stack_.push(VMValue(obj));
}

void VM::handle_set_field(const Chunk& chunk) {
    uint16_t fid = static_cast<uint16_t>(read_int16(chunk));
    std::string field_name = (fid < chunk.string_table.size()) ? chunk.string_table[fid] : "";
    VMValue val = stack_.pop();
    VMValue target = stack_.pop();

    if (target.is_object()) {
        auto obj = target.as_object();
        if (obj) {
            obj->set_field(field_name, val);
        }
    }
}

void VM::handle_invoke_method(const Chunk& chunk) {
    uint16_t mid = static_cast<uint16_t>(read_int16(chunk));
    uint8_t argc = read_byte(chunk);
    std::string method_name = (mid < chunk.string_table.size()) ? chunk.string_table[mid] : "";

    std::vector<VMValue> args(argc);
    for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
        args[i] = stack_.pop();
    }
    VMValue target = stack_.pop();

    // Primitive rendering for f-string interpolation: value.fmt(spec).
    // Objects are excluded so user methods named fmt/to_string are never
    // shadowed by this built-in.
    if (!target.is_object() && (method_name == "fmt" || method_name == "to_string")) {
        std::string spec = (!args.empty()) ? args[0].to_string() : "";
        stack_.push(VMValue(format_vm_value(target, spec)));
        return;
    }

    // Array built-in methods
    if (target.is_array()) {
        auto arr = target.as_array();
        if (arr) {
            auto values_equal = [](const VMValue& a, const VMValue& b) {
                if (a.is_string() || b.is_string()) return a.to_string() == b.to_string();
                if (a.is_tafpu() || b.is_tafpu()) return tafpu_cmp(a.as_tafpu(), b.as_tafpu()) == 0;
                return a.as_int() == b.as_int();
            };
            if (method_name == "push" || method_name == "append") {
                if (!args.empty()) arr->push_back(args[0]);
                stack_.push(target);
                return;
            } else if (method_name == "pop") {
                if (!arr->empty()) {
                    VMValue v = arr->back();
                    arr->pop_back();
                    stack_.push(v);
                } else {
                    stack_.push(VMValue());
                }
                return;
            } else if (method_name == "len" || method_name == "length") {
                stack_.push(VMValue(static_cast<int64_t>(arr->size())));
                return;
            } else if (method_name == "slice") {
                int64_t start = (!args.empty()) ? args[0].as_int() : 0;
                int64_t count = (args.size() >= 2) ? args[1].as_int()
                                                   : static_cast<int64_t>(arr->size());
                if (start < 0) start += static_cast<int64_t>(arr->size());
                if (start < 0) start = 0;
                if (start > static_cast<int64_t>(arr->size())) start = static_cast<int64_t>(arr->size());
                if (count < 0) count = 0;
                auto out = std::make_shared<std::vector<VMValue>>();
                for (int64_t k = start; k < start + count && k < static_cast<int64_t>(arr->size()); ++k) {
                    out->push_back((*arr)[static_cast<size_t>(k)]);
                }
                stack_.push(VMValue(out));
                return;
            } else if (method_name == "sort") {
                bool all_string = true;
                bool all_numeric = true;
                for (const auto& v : *arr) {
                    if (!v.is_string()) all_string = false;
                    if (!(v.is_int() || v.is_tryte() || v.is_float() || v.is_bool())) all_numeric = false;
                }
                if (!all_string && !all_numeric) {
                    throw VMException("sort: array contains mixed or non-comparable element types.");
                }
                auto out = std::make_shared<std::vector<VMValue>>(*arr);
                std::sort(out->begin(), out->end(), [](const VMValue& a, const VMValue& b) {
                    if (a.is_string()) return a.to_string() < b.to_string();
                    if (a.is_float() || b.is_float()) return a.as_float() < b.as_float();
                    return a.as_int() < b.as_int();
                });
                stack_.push(VMValue(out));
                return;
            } else if (method_name == "reverse") {
                auto out = std::make_shared<std::vector<VMValue>>(*arr);
                std::reverse(out->begin(), out->end());
                stack_.push(VMValue(out));
                return;
            } else if (method_name == "contains") {
                bool found = false;
                if (!args.empty()) {
                    for (const auto& v : *arr) {
                        if (values_equal(v, args[0])) { found = true; break; }
                    }
                }
                stack_.push(VMValue(found));
                return;
            } else if (method_name == "index_of") {
                int64_t idx = -1;
                if (!args.empty()) {
                    for (size_t k = 0; k < arr->size(); ++k) {
                        if (values_equal((*arr)[k], args[0])) { idx = static_cast<int64_t>(k); break; }
                    }
                }
                stack_.push(VMValue(idx));
                return;
            } else if (method_name == "concat") {
                auto out = std::make_shared<std::vector<VMValue>>(*arr);
                if (!args.empty() && args[0].is_array()) {
                    for (const auto& v : *args[0].as_array()) out->push_back(v);
                }
                stack_.push(VMValue(out));
                return;
            } else if (method_name == "join") {
                std::string sep = (!args.empty()) ? args[0].to_string() : "";
                std::string out;
                for (size_t k = 0; k < arr->size(); ++k) {
                    if (k > 0) out += sep;
                    out += (*arr)[k].to_string();
                }
                stack_.push(VMValue(out));
                return;
            }
        }
    }

    // String built-in methods
    if (target.is_string()) {
        std::string s = target.to_string();
        if (method_name == "len" || method_name == "length" || method_name == "size") {
            stack_.push(VMValue(static_cast<int64_t>(s.size())));
            return;
        } else if (method_name == "pop") {
            if (!s.empty()) {
                char last = s.back();
                s.pop_back();
                stack_.push(VMValue(std::string(1, last)));
            } else {
                stack_.push(VMValue(""));
            }
            return;
        } else if (method_name == "slice" || method_name == "substr") {
            size_t start = (!args.empty()) ? static_cast<size_t>(args[0].as_int()) : 0;
            size_t count = (args.size() >= 2) ? static_cast<size_t>(args[1].as_int()) : std::string::npos;
            if (start < s.size()) {
                stack_.push(VMValue(s.substr(start, count)));
            } else {
                stack_.push(VMValue(""));
            }
            return;
        } else if (method_name == "split") {
            std::string sep = (!args.empty()) ? args[0].to_string() : "";
            if (sep.empty()) {
                throw VMException("split: separator must not be empty.");
            }
            auto out = std::make_shared<std::vector<VMValue>>();
            size_t pos = 0;
            while (true) {
                size_t hit = s.find(sep, pos);
                if (hit == std::string::npos) {
                    out->push_back(VMValue(s.substr(pos)));
                    break;
                }
                out->push_back(VMValue(s.substr(pos, hit - pos)));
                pos = hit + sep.size();
            }
            stack_.push(VMValue(out));
            return;
        } else if (method_name == "contains") {
            std::string sub = (!args.empty()) ? args[0].to_string() : "";
            stack_.push(VMValue(s.find(sub) != std::string::npos));
            return;
        } else if (method_name == "index_of") {
            std::string sub = (!args.empty()) ? args[0].to_string() : "";
            size_t hit = s.find(sub);
            stack_.push(VMValue(hit == std::string::npos ? static_cast<int64_t>(-1)
                                                         : static_cast<int64_t>(hit)));
            return;
        } else if (method_name == "trim") {
            const char* ws = " \t\r\n";
            size_t b = s.find_first_not_of(ws);
            if (b == std::string::npos) {
                stack_.push(VMValue(""));
            } else {
                size_t e = s.find_last_not_of(ws);
                stack_.push(VMValue(s.substr(b, e - b + 1)));
            }
            return;
        }
    }

    // Dynamic dispatch via V-Table & Native Host Extension (Tersun 1.0.2)
    if (target.is_object()) {
        auto obj = target.as_object();
        if (obj) {
            // Native Host / Syscall Dispatch — intercept ONLY for the reserved host
            // classes below. User classes are never hijacked, even when a method
            // happens to share a name with a host API.
            if (obj->type_name == "Host" || obj->type_name == "HostFs" || obj->type_name == "HostKb" || obj->type_name == "Syscall") {

                if (method_name == "mouse_get_x") {
                    stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_x())));
                    return;
                } else if (method_name == "mouse_get_y") {
                    stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_y())));
                    return;
                } else if (method_name == "mouse_get_btn" || method_name == "mouse_get_button") {
                    stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_btn())));
                    return;
                } else if (method_name == "is_mouse_down") {
                    int btn = (!args.empty()) ? static_cast<int>(args[0].as_int()) : -1;
                    bool down = graphics::Setun2DBridge::instance().is_mouse_down(btn);
                    stack_.push(VMValue(down ? 1LL : 0LL));
                    return;
                } else if (method_name == "mouse_move") {
                    int mx = (args.size() >= 1) ? static_cast<int>(args[0].as_int()) : 0;
                    int my = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : 0;
                    graphics::Setun2DBridge::instance().set_mouse_pos(mx, my);
                    stack_.push(VMValue());
                    return;
                } else if (method_name == "mouse_click") {
                    int btn = (args.size() >= 1) ? static_cast<int>(args[0].as_int()) : -1;
                    int mx = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : 0;
                    int my = (args.size() >= 3) ? static_cast<int>(args[2].as_int()) : 0;
                    graphics::Setun2DBridge::instance().mouse_click(btn, mx, my);
                    stack_.push(VMValue());
                    return;
                } else if (method_name == "mouse_get_wheel" || method_name == "get_wheel") {
                    stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_wheel_delta())));
                    return;
                } else if (method_name == "kb_get_char") {
                    stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_char())));
                    return;
                } else if (method_name == "kb_is_key_down") {
                    int vk = (!args.empty()) ? static_cast<int>(args[0].as_int()) : 0;
                    bool down = graphics::Setun2DBridge::instance().is_key_down(vk);
                    stack_.push(VMValue(down ? 1LL : 0LL));
                    return;
                } else if (method_name == "chr" || method_name == "char_to_str") {
                    int c = (!args.empty()) ? static_cast<int>(args[0].as_int()) : 0;
                    if (c > 0 && c < 256) {
                        stack_.push(VMValue(std::string(1, static_cast<char>(c))));
                    } else {
                        stack_.push(VMValue(""));
                    }
                    return;
                } else if (method_name == "draw_line") {
                    int x1 = (args.size() >= 1) ? static_cast<int>(args[0].as_int()) : 0;
                    int y1 = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : 0;
                    int x2 = (args.size() >= 3) ? static_cast<int>(args[2].as_int()) : 0;
                    int y2 = (args.size() >= 4) ? static_cast<int>(args[3].as_int()) : 0;
                    int rgb = (args.size() >= 5) ? static_cast<int>(args[4].as_int()) : 0;
                    graphics::Setun2DBridge::instance().draw_line(x1, y1, x2, y2, rgb);
                    stack_.push(VMValue());
                    return;
                } else if (method_name == "file_dialog_save") {
                    std::string filter = (args.size() >= 1) ? args[0].to_string() : "";
                    std::string def_ext = (args.size() >= 2) ? args[1].to_string() : "";
                    std::string path = graphics::Setun2DBridge::instance().file_dialog_save(filter, def_ext);
                    stack_.push(VMValue(path));
                    return;
                } else if (method_name == "file_dialog_open") {
                    std::string filter = (args.size() >= 1) ? args[0].to_string() : "";
                    std::string path = graphics::Setun2DBridge::instance().file_dialog_open(filter);
                    stack_.push(VMValue(path));
                    return;
                } else if (method_name == "fs_err") {
                    stack_.push(VMValue(g_last_fs_error));
                    return;
                } else if (method_name == "fs_read") {
                    std::string path = (!args.empty()) ? args[0].to_string() : "";
                    std::ifstream f(path, std::ios::binary);
                    if (!f.is_open()) {
                        g_last_fs_error = "fs_read: cannot open '" + path + "'";
                        stack_.push(VMValue(""));
                    } else {
                        g_last_fs_error.clear();
                        std::stringstream ss;
                        ss << f.rdbuf();
                        stack_.push(VMValue(ss.str()));
                    }
                    return;
                } else if (method_name == "fs_write") {
                    std::string path = (!args.empty()) ? args[0].to_string() : "";
                    std::string content = (args.size() >= 2) ? args[1].to_string() : "";
                    std::ofstream f(path, std::ios::binary | std::ios::trunc);
                    if (!f.is_open()) {
                        g_last_fs_error = "fs_write: cannot open '" + path + "'";
                        stack_.push(VMValue(0LL));
                    } else {
                        f << content;
                        g_last_fs_error = f.good() ? "" : ("fs_write: I/O error on '" + path + "'");
                        stack_.push(VMValue(f.good() ? 1LL : 0LL));
                    }
                    return;
                } else if (method_name == "fs_append") {
                    std::string path = (!args.empty()) ? args[0].to_string() : "";
                    std::string content = (args.size() >= 2) ? args[1].to_string() : "";
                    std::ofstream f(path, std::ios::binary | std::ios::app);
                    if (!f.is_open()) {
                        g_last_fs_error = "fs_append: cannot open '" + path + "'";
                        stack_.push(VMValue(0LL));
                    } else {
                        f << content;
                        g_last_fs_error = f.good() ? "" : ("fs_append: I/O error on '" + path + "'");
                        stack_.push(VMValue(f.good() ? 1LL : 0LL));
                    }
                    return;
                } else if (method_name == "fs_exists") {
                    std::string path = (!args.empty()) ? args[0].to_string() : "";
                    std::error_code ec;
                    bool ex = std::filesystem::exists(path, ec);
                    g_last_fs_error = ec ? ("fs_exists: '" + path + "': " + ec.message()) : "";
                    stack_.push(VMValue(ex ? 1LL : 0LL));
                    return;
                } else if (method_name == "fs_size") {
                    std::string path = (!args.empty()) ? args[0].to_string() : "";
                    std::error_code ec;
                    auto sz = std::filesystem::file_size(path, ec);
                    g_last_fs_error = ec ? ("fs_size: '" + path + "': " + ec.message()) : "";
                    stack_.push(VMValue(ec ? -1LL : static_cast<int64_t>(sz)));
                    return;
                } else if (method_name == "syscall") {
                    int64_t sys_id = (!args.empty()) ? args[0].as_int() : 0;
                    if (sys_id == 101) {
                        stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_x())));
                        return;
                    } else if (sys_id == 102) {
                        stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_y())));
                        return;
                    } else if (sys_id == 103) {
                        stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_mouse_btn())));
                        return;
                    } else if (sys_id == 104) {
                        int btn = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : -1;
                        bool down = graphics::Setun2DBridge::instance().is_mouse_down(btn);
                        stack_.push(VMValue(down ? 1LL : 0LL));
                        return;
                    } else if (sys_id == 105) {
                        int mx = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : 0;
                        int my = (args.size() >= 3) ? static_cast<int>(args[2].as_int()) : 0;
                        graphics::Setun2DBridge::instance().set_mouse_pos(mx, my);
                        stack_.push(VMValue());
                        return;
                    } else if (sys_id == 106) {
                        int btn = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : -1;
                        int mx = (args.size() >= 3) ? static_cast<int>(args[2].as_int()) : 0;
                        int my = (args.size() >= 4) ? static_cast<int>(args[3].as_int()) : 0;
                        graphics::Setun2DBridge::instance().mouse_click(btn, mx, my);
                        stack_.push(VMValue());
                        return;
                    } else if (sys_id == 107) {
                        stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_char())));
                        return;
                    } else if (sys_id == 108) {
                        int vk = (args.size() >= 2) ? static_cast<int>(args[1].as_int()) : 0;
                        stack_.push(VMValue(graphics::Setun2DBridge::instance().is_key_down(vk) ? 1LL : 0LL));
                        return;
                    } else if (sys_id == 109) {
                        stack_.push(VMValue(static_cast<int64_t>(graphics::Setun2DBridge::instance().get_wheel_delta())));
                        return;
                    } else if (sys_id == 201) {
                        std::string path = (args.size() >= 2) ? args[1].to_string() : "";
                        std::ifstream f(path, std::ios::binary);
                        if (!f.is_open()) {
                            stack_.push(VMValue(""));
                        } else {
                            std::stringstream ss;
                            ss << f.rdbuf();
                            stack_.push(VMValue(ss.str()));
                        }
                        return;
                    } else if (sys_id == 202) {
                        std::string path = (args.size() >= 2) ? args[1].to_string() : "";
                        std::string content = (args.size() >= 3) ? args[2].to_string() : "";
                        std::ofstream f(path, std::ios::binary | std::ios::trunc);
                        if (!f.is_open()) {
                            stack_.push(VMValue(0LL));
                        } else {
                            f << content;
                            stack_.push(VMValue(f.good() ? 1LL : 0LL));
                        }
                        return;
                    } else if (sys_id == 203) {
                        std::string path = (args.size() >= 2) ? args[1].to_string() : "";
                        std::string content = (args.size() >= 3) ? args[2].to_string() : "";
                        std::ofstream f(path, std::ios::binary | std::ios::app);
                        if (!f.is_open()) {
                            stack_.push(VMValue(0LL));
                        } else {
                            f << content;
                            stack_.push(VMValue(f.good() ? 1LL : 0LL));
                        }
                        return;
                    } else if (sys_id == 204) {
                        std::string path = (args.size() >= 2) ? args[1].to_string() : "";
                        bool ex = std::filesystem::exists(path);
                        stack_.push(VMValue(ex ? 1LL : 0LL));
                        return;
                    } else if (sys_id == 205) {
                        std::string path = (args.size() >= 2) ? args[1].to_string() : "";
                        std::error_code ec;
                        auto sz = std::filesystem::file_size(path, ec);
                        stack_.push(VMValue(ec ? -1LL : static_cast<int64_t>(sz)));
                        return;
                    } else {
                        // Unknown syscall id: report as error code instead of
                        // silently falling through to vtable dispatch.
                        stack_.push(VMValue(-1LL));
                        return;
                    }
                }
            }

            if (obj->vtable) {
                auto it = obj->vtable->methods.find(method_name);
                if (it != obj->vtable->methods.end()) {
                    uint16_t fn_entry = it->second;
                    size_t new_local_base = locals_.size();
                    locals_.resize(new_local_base + argc + 1 + 32);
                    locals_[new_local_base] = target; // slot 0 is 'self'
                    for (size_t i = 0; i < argc; ++i) {
                        locals_[new_local_base + 1 + i] = args[i];
                    }
                    call_stack_.push_back(CallFrame{ip_, new_local_base});
                    ip_ = fn_entry;
                    return;
                }
            }
        }
    }

    // Default fallback
    stack_.push(VMValue());
}

void VM::handle_set_index(const Chunk&) {
    VMValue val = stack_.pop();
    VMValue idx_val = stack_.pop();
    VMValue target = stack_.pop();

    if (target.is_array()) {
        auto arr = target.as_array();
        if (arr) {
            int64_t i = idx_val.as_int();
            if (i < 0) i += arr->size();
            if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                (*arr)[i] = val;
            }
        }
    } else if (target.is_object()) {
        auto obj = target.as_object();
        if (obj) {
            obj->set_field(idx_val.to_string(), val);
        }
    }
}

void VM::handle_new_array(const Chunk& chunk) {
    uint16_t count = static_cast<uint16_t>(read_int16(chunk));
    auto arr = std::make_shared<std::vector<VMValue>>(count);
    for (int i = static_cast<int>(count) - 1; i >= 0; --i) {
        (*arr)[i] = stack_.pop();
    }
    stack_.push(VMValue(arr));
}

} // namespace setun
