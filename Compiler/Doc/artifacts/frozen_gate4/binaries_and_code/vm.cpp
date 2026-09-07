#include "vm/vm.hpp"
#include "vm/text.hpp"
#include "graphics/setun2d_bridge.hpp"
#include "compiler/types.hpp"
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
    locals_.resize(65536);
    globals_.resize(256);
    init_dispatch_table();
    reset();
}

void VM::reset() {
    ip_ = 0;
    running_ = false;
    stack_.clear();
    local_top_ = 64;
    if (locals_.size() < 65536) locals_.resize(65536);
    std::fill(locals_.begin(), locals_.begin() + 1024, VMValue{});
    std::fill(globals_.begin(), globals_.end(), VMValue{});
    try_stack_.clear();
    call_stack_.clear();
    for (auto& r : tafpu_regs_) r = TafpuNum{};
    for (auto& r : tryte_regs_) r = 0;
    output_buffer_.clear();
    telemetry_.reset();
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
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_MOD)] = &VM::handle_mod;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_BIT_AND)] = &VM::handle_bit_and;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_BIT_OR)] = &VM::handle_bit_or;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_BIT_XOR)] = &VM::handle_bit_xor;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_SHL)] = &VM::handle_shl;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_SHR)] = &VM::handle_shr;

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
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_TRY)] = &VM::handle_try;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_THROW)] = &VM::handle_throw;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_POP_TRY)] = &VM::handle_pop_try;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_CLOSURE)] = &VM::handle_closure;
    dispatch_table_[static_cast<uint8_t>(OpCode::OP_CALL_INDIRECT)] = &VM::handle_call_indirect;
}

void VM::run(const Chunk& chunk) {
    switch (dispatch_mode_) {
        case DispatchMode::FUNCTION_POINTER:
            run_function_pointer(chunk);
            break;
        case DispatchMode::SWITCH_LOOP:
            run_switch(chunk);
            break;
        case DispatchMode::DIRECT_THREADED:
            run_threaded(chunk);
            break;
        case DispatchMode::REGISTER_CACHED:
            run_cached(chunk);
            break;
    }
}

void VM::run_function_pointer(const Chunk& chunk) {
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
        try {
            (this->*handler)(chunk);
        } catch (const VMException& e) {
            if (try_stack_.empty()) throw;
            TryFrame frame = try_stack_.back();
            try_stack_.pop_back();
            stack_.truncate(frame.stack_depth);
            if (frame.locals_len <= locals_.size()) locals_.resize(frame.locals_len);
            if (frame.call_depth <= call_stack_.size()) call_stack_.resize(frame.call_depth);
            ip_ = frame.catch_ip;
            stack_.push(VMValue(std::string(e.what())));
        }
    }
}

void VM::run_switch(const Chunk& chunk) {
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
        try {
            switch (static_cast<OpCode>(opcode_byte)) {
                case OpCode::OP_NOP: handle_nop(chunk); break;
                case OpCode::OP_PUSH_INT: handle_push_int(chunk); break;
                case OpCode::OP_PUSH_TRYTE: handle_push_tryte(chunk); break;
                case OpCode::OP_PUSH_TAFPU: handle_push_tafpu(chunk); break;
                case OpCode::OP_PUSH_FLOAT: handle_push_float(chunk); break;
                case OpCode::OP_PUSH_STRING: handle_push_string(chunk); break;
                case OpCode::OP_PUSH_BOOL: handle_push_bool(chunk); break;
                case OpCode::OP_POP: handle_pop(chunk); break;
                case OpCode::OP_DUP: handle_dup(chunk); break;
                case OpCode::OP_LOAD_LOCAL: handle_load_local(chunk); break;
                case OpCode::OP_STORE_LOCAL: handle_store_local(chunk); break;
                case OpCode::OP_LOAD_GLOBAL: handle_load_global(chunk); break;
                case OpCode::OP_STORE_GLOBAL: handle_store_global(chunk); break;
                case OpCode::OP_ADD: handle_add(chunk); break;
                case OpCode::OP_SUB: handle_sub(chunk); break;
                case OpCode::OP_MUL: handle_mul(chunk); break;
                case OpCode::OP_DIV: handle_div(chunk); break;
                case OpCode::OP_NEG: handle_neg(chunk); break;
                case OpCode::OP_TERNARY_NOT: handle_ternary_not(chunk); break;
                case OpCode::OP_TERNARY_CMP: handle_ternary_cmp(chunk); break;
                case OpCode::OP_TERNARY_MIN: handle_ternary_min(chunk); break;
                case OpCode::OP_TERNARY_MAX: handle_ternary_max(chunk); break;
                case OpCode::OP_MOD: handle_mod(chunk); break;
                case OpCode::OP_BIT_AND: handle_bit_and(chunk); break;
                case OpCode::OP_BIT_OR: handle_bit_or(chunk); break;
                case OpCode::OP_BIT_XOR: handle_bit_xor(chunk); break;
                case OpCode::OP_SHL: handle_shl(chunk); break;
                case OpCode::OP_SHR: handle_shr(chunk); break;
                case OpCode::OP_EQ: handle_eq(chunk); break;
                case OpCode::OP_NEQ: handle_neq(chunk); break;
                case OpCode::OP_LT: handle_lt(chunk); break;
                case OpCode::OP_LE: handle_le(chunk); break;
                case OpCode::OP_GT: handle_gt(chunk); break;
                case OpCode::OP_GE: handle_ge(chunk); break;
                case OpCode::OP_TAFPU_CONSTRUCT: handle_tafpu_construct(chunk); break;
                case OpCode::OP_TAFPU_ENCODE: handle_tafpu_encode(chunk); break;
                case OpCode::OP_TAFPU_TODBL: handle_tafpu_todbl(chunk); break;
                case OpCode::OP_JUMP: handle_jump(chunk); break;
                case OpCode::OP_JUMP_IF_FALSE: handle_jump_if_false(chunk); break;
                case OpCode::OP_BRANCH_3: handle_branch_3(chunk); break;
                case OpCode::OP_CALL: handle_call(chunk); break;
                case OpCode::OP_RET: handle_ret(chunk); break;
                case OpCode::OP_PRINT: handle_print(chunk); break;
                case OpCode::OP_PRINTLN: handle_println(chunk); break;
                case OpCode::OP_TRACE: handle_trace(chunk); break;
                case OpCode::OP_ASSERT_EQ: handle_assert_eq(chunk); break;
                case OpCode::OP_HALT: handle_halt(chunk); break;
                case OpCode::OP_GFX_INIT: handle_gfx_init(chunk); break;
                case OpCode::OP_GFX_IS_RUNNING: handle_gfx_is_running(chunk); break;
                case OpCode::OP_GFX_CLEAR: handle_gfx_clear(chunk); break;
                case OpCode::OP_GFX_DRAW_RECT: handle_gfx_draw_rect(chunk); break;
                case OpCode::OP_GFX_DRAW_CIRCLE: handle_gfx_draw_circle(chunk); break;
                case OpCode::OP_GFX_DRAW_TEXT: handle_gfx_draw_text(chunk); break;
                case OpCode::OP_GFX_FLIP: handle_gfx_flip(chunk); break;
                case OpCode::OP_GFX_GET_KEY: handle_gfx_get_key(chunk); break;
                case OpCode::OP_GFX_CLOSE: handle_gfx_close(chunk); break;
                case OpCode::OP_NN_CREATE_DENSE: handle_nn_create_dense(chunk); break;
                case OpCode::OP_NN_SET_WEIGHT: handle_nn_set_weight(chunk); break;
                case OpCode::OP_NN_SET_BIAS: handle_nn_set_bias(chunk); break;
                case OpCode::OP_NN_SET_INPUT: handle_nn_set_input(chunk); break;
                case OpCode::OP_NN_GET_INPUT: handle_nn_get_input(chunk); break;
                case OpCode::OP_NN_FORWARD: handle_nn_forward(chunk); break;
                case OpCode::OP_NN_GET_OUTPUT: handle_nn_get_output(chunk); break;
                case OpCode::OP_NN_COPY_OUT_IN: handle_nn_copy_out_in(chunk); break;
                case OpCode::OP_NN_PREDICT: handle_nn_predict(chunk); break;
                case OpCode::OP_NN_CONFIDENCE: handle_nn_confidence(chunk); break;
                case OpCode::OP_NN_LOAD_MNIST: handle_nn_load_mnist(chunk); break;
                case OpCode::OP_NN_FREE_LAYER: handle_nn_free_layer(chunk); break;
                case OpCode::OP_TIME_NOW_US: handle_time_now_us(chunk); break;
                case OpCode::OP_GET_FIELD: handle_get_field(chunk); break;
                case OpCode::OP_GET_INDEX: handle_get_index(chunk); break;
                case OpCode::OP_NEW_INSTANCE: handle_new_instance(chunk); break;
                case OpCode::OP_SET_FIELD: handle_set_field(chunk); break;
                case OpCode::OP_INVOKE_METHOD: handle_invoke_method(chunk); break;
                case OpCode::OP_SET_INDEX: handle_set_index(chunk); break;
                case OpCode::OP_NEW_ARRAY: handle_new_array(chunk); break;
                case OpCode::OP_TRY: handle_try(chunk); break;
                case OpCode::OP_THROW: handle_throw(chunk); break;
                case OpCode::OP_POP_TRY: handle_pop_try(chunk); break;
                case OpCode::OP_CLOSURE: handle_closure(chunk); break;
                case OpCode::OP_CALL_INDIRECT: handle_call_indirect(chunk); break;
                default: {
                    std::ostringstream oss;
                    oss << "VM Exception: Unknown opcode 0x" << std::hex << static_cast<int>(opcode_byte) << " at offset " << std::dec << (ip_ - 1);
                    throw VMException(oss.str());
                }
            }
        } catch (const VMException& e) {
            if (try_stack_.empty()) throw;
            TryFrame frame = try_stack_.back();
            try_stack_.pop_back();
            stack_.truncate(frame.stack_depth);
            if (frame.locals_len <= locals_.size()) locals_.resize(frame.locals_len);
            if (frame.call_depth <= call_stack_.size()) call_stack_.resize(frame.call_depth);
            ip_ = frame.catch_ip;
            stack_.push(VMValue(std::string(e.what())));
        }
    }
}

void VM::run_threaded(const Chunk& chunk) {
#if defined(__GNUC__) || defined(__clang__)
    ip_ = 0;
    running_ = true;

    for (const auto& [cname, methods] : chunk.vtables) {
        auto vt = std::make_shared<VTable>();
        vt->class_name = cname;
        vt->methods = methods;
        vtables_[cname] = vt;
    }

    static void* labels[256];
    static bool inited = false;
    if (__builtin_expect(!inited, 0)) {
        for (int i = 0; i < 256; ++i) labels[i] = &&lbl_unknown;
        #define OP_TARGET(op) labels[static_cast<uint8_t>(OpCode::op)] = &&lbl_##op
        OP_TARGET(OP_NOP);
        OP_TARGET(OP_PUSH_INT);
        OP_TARGET(OP_PUSH_TRYTE);
        OP_TARGET(OP_PUSH_TAFPU);
        OP_TARGET(OP_PUSH_FLOAT);
        OP_TARGET(OP_PUSH_STRING);
        OP_TARGET(OP_PUSH_BOOL);
        OP_TARGET(OP_POP);
        OP_TARGET(OP_DUP);
        OP_TARGET(OP_LOAD_LOCAL);
        OP_TARGET(OP_STORE_LOCAL);
        OP_TARGET(OP_LOAD_GLOBAL);
        OP_TARGET(OP_STORE_GLOBAL);
        OP_TARGET(OP_ADD);
        OP_TARGET(OP_SUB);
        OP_TARGET(OP_MUL);
        OP_TARGET(OP_DIV);
        OP_TARGET(OP_NEG);
        OP_TARGET(OP_TERNARY_NOT);
        OP_TARGET(OP_TERNARY_CMP);
        OP_TARGET(OP_TERNARY_MIN);
        OP_TARGET(OP_TERNARY_MAX);
        OP_TARGET(OP_MOD);
        OP_TARGET(OP_BIT_AND);
        OP_TARGET(OP_BIT_OR);
        OP_TARGET(OP_BIT_XOR);
        OP_TARGET(OP_SHL);
        OP_TARGET(OP_SHR);
        OP_TARGET(OP_EQ);
        OP_TARGET(OP_NEQ);
        OP_TARGET(OP_LT);
        OP_TARGET(OP_LE);
        OP_TARGET(OP_GT);
        OP_TARGET(OP_GE);
        OP_TARGET(OP_TAFPU_CONSTRUCT);
        OP_TARGET(OP_TAFPU_ENCODE);
        OP_TARGET(OP_TAFPU_TODBL);
        OP_TARGET(OP_JUMP);
        OP_TARGET(OP_JUMP_IF_FALSE);
        OP_TARGET(OP_BRANCH_3);
        OP_TARGET(OP_CALL);
        OP_TARGET(OP_RET);
        OP_TARGET(OP_PRINT);
        OP_TARGET(OP_PRINTLN);
        OP_TARGET(OP_TRACE);
        OP_TARGET(OP_ASSERT_EQ);
        OP_TARGET(OP_HALT);
        OP_TARGET(OP_GFX_INIT);
        OP_TARGET(OP_GFX_IS_RUNNING);
        OP_TARGET(OP_GFX_CLEAR);
        OP_TARGET(OP_GFX_DRAW_RECT);
        OP_TARGET(OP_GFX_DRAW_CIRCLE);
        OP_TARGET(OP_GFX_DRAW_TEXT);
        OP_TARGET(OP_GFX_FLIP);
        OP_TARGET(OP_GFX_GET_KEY);
        OP_TARGET(OP_GFX_CLOSE);
        OP_TARGET(OP_NN_CREATE_DENSE);
        OP_TARGET(OP_NN_SET_WEIGHT);
        OP_TARGET(OP_NN_SET_BIAS);
        OP_TARGET(OP_NN_SET_INPUT);
        OP_TARGET(OP_NN_GET_INPUT);
        OP_TARGET(OP_NN_FORWARD);
        OP_TARGET(OP_NN_GET_OUTPUT);
        OP_TARGET(OP_NN_COPY_OUT_IN);
        OP_TARGET(OP_NN_PREDICT);
        OP_TARGET(OP_NN_CONFIDENCE);
        OP_TARGET(OP_NN_LOAD_MNIST);
        OP_TARGET(OP_NN_FREE_LAYER);
        OP_TARGET(OP_TIME_NOW_US);
        OP_TARGET(OP_GET_FIELD);
        OP_TARGET(OP_GET_INDEX);
        OP_TARGET(OP_NEW_INSTANCE);
        OP_TARGET(OP_SET_FIELD);
        OP_TARGET(OP_INVOKE_METHOD);
        OP_TARGET(OP_SET_INDEX);
        OP_TARGET(OP_NEW_ARRAY);
        OP_TARGET(OP_TRY);
        OP_TARGET(OP_THROW);
        OP_TARGET(OP_POP_TRY);
        OP_TARGET(OP_CLOSURE);
        OP_TARGET(OP_CALL_INDIRECT);
        #undef OP_TARGET
        inited = true;
    }

    #define THREADED_DISPATCH() \
        do { \
            if (__builtin_expect(!running_ || ip_ >= chunk.code.size(), 0)) goto lbl_exit; \
            goto *labels[chunk.code[ip_++]]; \
        } while(0)

    #define WRAP_OP(op, body) \
        lbl_##op: \
            try { body; } \
            catch (const VMException& e) { \
                if (try_stack_.empty()) throw; \
                TryFrame frame = try_stack_.back(); \
                try_stack_.pop_back(); \
                stack_.truncate(frame.stack_depth); \
                if (frame.locals_len <= locals_.size()) locals_.resize(frame.locals_len); \
                if (frame.call_depth <= call_stack_.size()) call_stack_.resize(frame.call_depth); \
                ip_ = frame.catch_ip; \
                stack_.push(VMValue(std::string(e.what()))); \
            } \
            THREADED_DISPATCH();

    THREADED_DISPATCH();

    WRAP_OP(OP_NOP, handle_nop(chunk));
    WRAP_OP(OP_PUSH_INT, handle_push_int(chunk));
    WRAP_OP(OP_PUSH_TRYTE, handle_push_tryte(chunk));
    WRAP_OP(OP_PUSH_TAFPU, handle_push_tafpu(chunk));
    WRAP_OP(OP_PUSH_FLOAT, handle_push_float(chunk));
    WRAP_OP(OP_PUSH_STRING, handle_push_string(chunk));
    WRAP_OP(OP_PUSH_BOOL, handle_push_bool(chunk));
    WRAP_OP(OP_POP, handle_pop(chunk));
    WRAP_OP(OP_DUP, handle_dup(chunk));
    WRAP_OP(OP_LOAD_LOCAL, handle_load_local(chunk));
    WRAP_OP(OP_STORE_LOCAL, handle_store_local(chunk));
    WRAP_OP(OP_LOAD_GLOBAL, handle_load_global(chunk));
    WRAP_OP(OP_STORE_GLOBAL, handle_store_global(chunk));
    WRAP_OP(OP_ADD, handle_add(chunk));
    WRAP_OP(OP_SUB, handle_sub(chunk));
    WRAP_OP(OP_MUL, handle_mul(chunk));
    WRAP_OP(OP_DIV, handle_div(chunk));
    WRAP_OP(OP_NEG, handle_neg(chunk));
    WRAP_OP(OP_TERNARY_NOT, handle_ternary_not(chunk));
    WRAP_OP(OP_TERNARY_CMP, handle_ternary_cmp(chunk));
    WRAP_OP(OP_TERNARY_MIN, handle_ternary_min(chunk));
    WRAP_OP(OP_TERNARY_MAX, handle_ternary_max(chunk));
    WRAP_OP(OP_MOD, handle_mod(chunk));
    WRAP_OP(OP_BIT_AND, handle_bit_and(chunk));
    WRAP_OP(OP_BIT_OR, handle_bit_or(chunk));
    WRAP_OP(OP_BIT_XOR, handle_bit_xor(chunk));
    WRAP_OP(OP_SHL, handle_shl(chunk));
    WRAP_OP(OP_SHR, handle_shr(chunk));
    WRAP_OP(OP_EQ, handle_eq(chunk));
    WRAP_OP(OP_NEQ, handle_neq(chunk));
    WRAP_OP(OP_LT, handle_lt(chunk));
    WRAP_OP(OP_LE, handle_le(chunk));
    WRAP_OP(OP_GT, handle_gt(chunk));
    WRAP_OP(OP_GE, handle_ge(chunk));
    WRAP_OP(OP_TAFPU_CONSTRUCT, handle_tafpu_construct(chunk));
    WRAP_OP(OP_TAFPU_ENCODE, handle_tafpu_encode(chunk));
    WRAP_OP(OP_TAFPU_TODBL, handle_tafpu_todbl(chunk));
    WRAP_OP(OP_JUMP, handle_jump(chunk));
    WRAP_OP(OP_JUMP_IF_FALSE, handle_jump_if_false(chunk));
    WRAP_OP(OP_BRANCH_3, handle_branch_3(chunk));
    WRAP_OP(OP_CALL, handle_call(chunk));
    WRAP_OP(OP_RET, handle_ret(chunk));
    WRAP_OP(OP_PRINT, handle_print(chunk));
    WRAP_OP(OP_PRINTLN, handle_println(chunk));
    WRAP_OP(OP_TRACE, handle_trace(chunk));
    WRAP_OP(OP_ASSERT_EQ, handle_assert_eq(chunk));
    WRAP_OP(OP_HALT, handle_halt(chunk));
    WRAP_OP(OP_GFX_INIT, handle_gfx_init(chunk));
    WRAP_OP(OP_GFX_IS_RUNNING, handle_gfx_is_running(chunk));
    WRAP_OP(OP_GFX_CLEAR, handle_gfx_clear(chunk));
    WRAP_OP(OP_GFX_DRAW_RECT, handle_gfx_draw_rect(chunk));
    WRAP_OP(OP_GFX_DRAW_CIRCLE, handle_gfx_draw_circle(chunk));
    WRAP_OP(OP_GFX_DRAW_TEXT, handle_gfx_draw_text(chunk));
    WRAP_OP(OP_GFX_FLIP, handle_gfx_flip(chunk));
    WRAP_OP(OP_GFX_GET_KEY, handle_gfx_get_key(chunk));
    WRAP_OP(OP_GFX_CLOSE, handle_gfx_close(chunk));
    WRAP_OP(OP_NN_CREATE_DENSE, handle_nn_create_dense(chunk));
    WRAP_OP(OP_NN_SET_WEIGHT, handle_nn_set_weight(chunk));
    WRAP_OP(OP_NN_SET_BIAS, handle_nn_set_bias(chunk));
    WRAP_OP(OP_NN_SET_INPUT, handle_nn_set_input(chunk));
    WRAP_OP(OP_NN_GET_INPUT, handle_nn_get_input(chunk));
    WRAP_OP(OP_NN_FORWARD, handle_nn_forward(chunk));
    WRAP_OP(OP_NN_GET_OUTPUT, handle_nn_get_output(chunk));
    WRAP_OP(OP_NN_COPY_OUT_IN, handle_nn_copy_out_in(chunk));
    WRAP_OP(OP_NN_PREDICT, handle_nn_predict(chunk));
    WRAP_OP(OP_NN_CONFIDENCE, handle_nn_confidence(chunk));
    WRAP_OP(OP_NN_LOAD_MNIST, handle_nn_load_mnist(chunk));
    WRAP_OP(OP_NN_FREE_LAYER, handle_nn_free_layer(chunk));
    WRAP_OP(OP_TIME_NOW_US, handle_time_now_us(chunk));
    WRAP_OP(OP_GET_FIELD, handle_get_field(chunk));
    WRAP_OP(OP_GET_INDEX, handle_get_index(chunk));
    WRAP_OP(OP_NEW_INSTANCE, handle_new_instance(chunk));
    WRAP_OP(OP_SET_FIELD, handle_set_field(chunk));
    WRAP_OP(OP_INVOKE_METHOD, handle_invoke_method(chunk));
    WRAP_OP(OP_SET_INDEX, handle_set_index(chunk));
    WRAP_OP(OP_NEW_ARRAY, handle_new_array(chunk));
    WRAP_OP(OP_TRY, handle_try(chunk));
    WRAP_OP(OP_THROW, handle_throw(chunk));
    WRAP_OP(OP_POP_TRY, handle_pop_try(chunk));
    WRAP_OP(OP_CLOSURE, handle_closure(chunk));
    WRAP_OP(OP_CALL_INDIRECT, handle_call_indirect(chunk));

    lbl_unknown: {
        std::ostringstream oss;
        oss << "VM Exception: Unknown opcode at offset " << (ip_ - 1);
        throw VMException(oss.str());
    }

    lbl_exit:
        return;
#else
    run_switch(chunk);
#endif
}

void VM::run_cached(const Chunk& chunk) {
    OptimizedChunk opt = OptBytecodeOptimizer::optimize(chunk, opt_flags_);
    run_optimized(opt);
}

void VM::run_optimized(OptimizedChunk& chunk) {
#if defined(__GNUC__) || defined(__clang__)
    ip_ = 0;
    running_ = true;

    for (const auto& [cname, methods] : chunk.vtables) {
        auto vt = std::make_shared<VTable>();
        vt->class_name = cname;
        vt->methods = methods;
        vtables_[cname] = vt;
    }

    size_t init_depth = stack_.size();
    uint8_t* code_base = chunk.code.data();
    uint8_t* ip = code_base;
    uint8_t* code_end = code_base + chunk.code.size();
    VMValue* sp = stack_.data() + init_depth;
    VMValue* stack_end = stack_.data() + stack_.capacity();
    size_t toplevel_size = chunk.toplevel_frame_size;
    if (toplevel_size < 32) toplevel_size = 32;
    size_t local_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
    local_top_ = call_stack_.empty() ? toplevel_size : (call_stack_.back().local_base + call_stack_.back().frame_size);

    static void* lbl_table[256];
    static bool inited = false;
    if (__builtin_expect(!inited, 0)) {
        for (int i = 0; i < 256; ++i) lbl_table[i] = &&c_lbl_unknown;
        #define OP_TARGET_C(op) lbl_table[static_cast<uint8_t>(OpCode::op)] = &&c_lbl_##op
        OP_TARGET_C(OP_NOP);
        OP_TARGET_C(OP_PUSH_INT);
        OP_TARGET_C(OP_PUSH_TRYTE);
        OP_TARGET_C(OP_PUSH_TAFPU);
        OP_TARGET_C(OP_PUSH_FLOAT);
        OP_TARGET_C(OP_PUSH_STRING);
        OP_TARGET_C(OP_PUSH_BOOL);
        OP_TARGET_C(OP_POP);
        OP_TARGET_C(OP_DUP);
        OP_TARGET_C(OP_LOAD_LOCAL);
        OP_TARGET_C(OP_STORE_LOCAL);
        OP_TARGET_C(OP_LOAD_GLOBAL);
        OP_TARGET_C(OP_STORE_GLOBAL);
        OP_TARGET_C(OP_ADD);
        OP_TARGET_C(OP_SUB);
        OP_TARGET_C(OP_MUL);
        OP_TARGET_C(OP_DIV);
        OP_TARGET_C(OP_NEG);
        OP_TARGET_C(OP_TERNARY_NOT);
        OP_TARGET_C(OP_TERNARY_CMP);
        OP_TARGET_C(OP_TERNARY_MIN);
        OP_TARGET_C(OP_TERNARY_MAX);
        OP_TARGET_C(OP_MOD);
        OP_TARGET_C(OP_BIT_AND);
        OP_TARGET_C(OP_BIT_OR);
        OP_TARGET_C(OP_BIT_XOR);
        OP_TARGET_C(OP_SHL);
        OP_TARGET_C(OP_SHR);
        OP_TARGET_C(OP_EQ);
        OP_TARGET_C(OP_NEQ);
        OP_TARGET_C(OP_LT);
        OP_TARGET_C(OP_LE);
        OP_TARGET_C(OP_GT);
        OP_TARGET_C(OP_GE);
        OP_TARGET_C(OP_TAFPU_CONSTRUCT);
        OP_TARGET_C(OP_TAFPU_ENCODE);
        OP_TARGET_C(OP_TAFPU_TODBL);
        OP_TARGET_C(OP_JUMP);
        OP_TARGET_C(OP_JUMP_IF_FALSE);
        OP_TARGET_C(OP_BRANCH_3);
        OP_TARGET_C(OP_CALL);
        OP_TARGET_C(OP_RET);
        OP_TARGET_C(OP_PRINT);
        OP_TARGET_C(OP_PRINTLN);
        OP_TARGET_C(OP_TRACE);
        OP_TARGET_C(OP_ASSERT_EQ);
        OP_TARGET_C(OP_HALT);
        OP_TARGET_C(OP_GFX_INIT);
        OP_TARGET_C(OP_GFX_IS_RUNNING);
        OP_TARGET_C(OP_GFX_CLEAR);
        OP_TARGET_C(OP_GFX_DRAW_RECT);
        OP_TARGET_C(OP_GFX_DRAW_CIRCLE);
        OP_TARGET_C(OP_GFX_DRAW_TEXT);
        OP_TARGET_C(OP_GFX_FLIP);
        OP_TARGET_C(OP_GFX_GET_KEY);
        OP_TARGET_C(OP_GFX_CLOSE);
        OP_TARGET_C(OP_NN_CREATE_DENSE);
        OP_TARGET_C(OP_NN_SET_WEIGHT);
        OP_TARGET_C(OP_NN_SET_BIAS);
        OP_TARGET_C(OP_NN_SET_INPUT);
        OP_TARGET_C(OP_NN_GET_INPUT);
        OP_TARGET_C(OP_NN_FORWARD);
        OP_TARGET_C(OP_NN_GET_OUTPUT);
        OP_TARGET_C(OP_NN_COPY_OUT_IN);
        OP_TARGET_C(OP_NN_PREDICT);
        OP_TARGET_C(OP_NN_CONFIDENCE);
        OP_TARGET_C(OP_NN_LOAD_MNIST);
        OP_TARGET_C(OP_NN_FREE_LAYER);
        OP_TARGET_C(OP_TIME_NOW_US);
        OP_TARGET_C(OP_GET_FIELD);
        OP_TARGET_C(OP_GET_INDEX);
        OP_TARGET_C(OP_NEW_INSTANCE);
        OP_TARGET_C(OP_SET_FIELD);
        OP_TARGET_C(OP_INVOKE_METHOD);
        OP_TARGET_C(OP_SET_INDEX);
        OP_TARGET_C(OP_NEW_ARRAY);
        OP_TARGET_C(OP_TRY);
        OP_TARGET_C(OP_THROW);
        OP_TARGET_C(OP_POP_TRY);
        OP_TARGET_C(OP_CLOSURE);
        OP_TARGET_C(OP_CALL_INDIRECT);

        // Gate 4: Tier-1 Specialized Opcodes
        OP_TARGET_C(OP_LOAD_LOCAL_0);
        OP_TARGET_C(OP_LOAD_LOCAL_1);
        OP_TARGET_C(OP_LOAD_LOCAL_2);
        OP_TARGET_C(OP_LOAD_LOCAL_3);
        OP_TARGET_C(OP_STORE_LOCAL_0);
        OP_TARGET_C(OP_STORE_LOCAL_1);
        OP_TARGET_C(OP_STORE_LOCAL_2);
        OP_TARGET_C(OP_STORE_LOCAL_3);
        OP_TARGET_C(OP_INCR_LOCAL_IMM);
        OP_TARGET_C(OP_GET_INDEX_ARRAY);
        OP_TARGET_C(OP_SET_INDEX_ARRAY);
        OP_TARGET_C(OP_LOOP_RANGE_FAST);
        OP_TARGET_C(OP_QUICK_ADD_INT);
        OP_TARGET_C(OP_QUICK_SUB_INT);
        OP_TARGET_C(OP_QUICK_MUL_INT);
        OP_TARGET_C(OP_QUICK_LT_INT);
        OP_TARGET_C(OP_QUICK_LE_INT);
        OP_TARGET_C(OP_QUICK_EQ_INT);
        OP_TARGET_C(OP_GET_FIELD_IC);
        OP_TARGET_C(OP_SET_FIELD_IC);
        #undef OP_TARGET_C
        inited = true;
    }

    #define DISPATCH_C() \
        do { \
            if (__builtin_expect(!running_ || ip >= code_end, 0)) goto c_lbl_exit; \
            telemetry_.total_dispatches++; \
            goto *lbl_table[*ip++]; \
        } while(0)

    #define ENSURE_STACK(n) \
        do { \
            if (__builtin_expect(sp + (n) >= stack_end, 0)) { \
                size_t cur = static_cast<size_t>(sp - stack_.data()); \
                stack_.reserve(stack_.capacity() * 2); \
                sp = stack_.data() + cur; \
                stack_end = stack_.data() + stack_.capacity(); \
            } \
        } while(0)

    #define SYNC_TO_VM() \
        do { \
            ip_ = static_cast<size_t>(ip - code_base); \
            stack_.set_top(static_cast<size_t>(sp - stack_.data())); \
        } while(0)

    #define SYNC_FROM_VM() \
        do { \
            size_t depth = stack_.size(); \
            ip = code_base + ip_; \
            sp = stack_.data() + depth; \
            stack_end = stack_.data() + stack_.capacity(); \
            local_base = call_stack_.empty() ? 0 : call_stack_.back().local_base; \
        } while(0)

    DISPATCH_C();

    c_lbl_OP_NOP:
        DISPATCH_C();

    c_lbl_OP_PUSH_INT: {
        int64_t val;
        std::memcpy(&val, ip, 8);
        ip += 8;
        ENSURE_STACK(1);
        *sp++ = val;
        DISPATCH_C();
    }

    c_lbl_OP_PUSH_TRYTE: {
        int16_t val;
        std::memcpy(&val, ip, 2);
        ip += 2;
        ENSURE_STACK(1);
        *sp++ = val;
        DISPATCH_C();
    }

    c_lbl_OP_PUSH_TAFPU: {
        int64_t a, b;
        int32_t s;
        std::memcpy(&a, ip, 8); ip += 8;
        std::memcpy(&b, ip, 8); ip += 8;
        std::memcpy(&s, ip, 4); ip += 4;
        ENSURE_STACK(1);
        *sp++ = TafpuNum(a, b, s);
        DISPATCH_C();
    }

    c_lbl_OP_PUSH_FLOAT: {
        double val;
        std::memcpy(&val, ip, 8);
        ip += 8;
        ENSURE_STACK(1);
        *sp++ = val;
        DISPATCH_C();
    }

    c_lbl_OP_PUSH_BOOL: {
        uint8_t b = *ip++;
        ENSURE_STACK(1);
        *sp++ = (b != 0);
        DISPATCH_C();
    }

    c_lbl_OP_POP: {
        --sp;
        DISPATCH_C();
    }

    c_lbl_OP_DUP: {
        ENSURE_STACK(1);
        {
            VMValue v = *(sp - 1);
            *sp++ = v;
        }
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_LOCAL: {
        uint16_t slot = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        size_t idx = local_base + slot;
        if (__builtin_expect(idx >= locals_.size(), 0)) locals_.resize(idx + 32);
        ENSURE_STACK(1);
        *sp++ = locals_[idx];
        DISPATCH_C();
    }

    c_lbl_OP_STORE_LOCAL: {
        uint16_t slot = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        size_t idx = local_base + slot;
        if (__builtin_expect(idx >= local_top_, 0)) {
            local_top_ = idx + 8;
            if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
                locals_.resize(locals_.size() * 2);
            }
        }
        if (__builtin_expect(idx >= locals_.size(), 0)) locals_.resize(idx + 32);
        locals_[idx] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_GLOBAL: {
        uint16_t slot = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        if (__builtin_expect(slot >= globals_.size(), 0)) globals_.resize(slot + 32);
        ENSURE_STACK(1);
        *sp++ = globals_[slot];
        DISPATCH_C();
    }

    c_lbl_OP_STORE_GLOBAL: {
        uint16_t slot = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        if (__builtin_expect(slot >= globals_.size(), 0)) globals_.resize(slot + 32);
        globals_[slot] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_ADD: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t sum = a.as_immediate_int_fast() + b.as_immediate_int_fast();
            if (__builtin_expect(sum >= VMValue::MIN_INT48 && sum <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(sum) & VMValue::PAYLOAD_MASK));
                size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
                if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                    uint8_t& counter = chunk.warmup_counters[site_ip];
                    if (++counter >= 8) {
                        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_ADD_INT);
                    }
                }
                DISPATCH_C();
            }
        }
        *sp++ = a.add(b);
        DISPATCH_C();
    }

    c_lbl_OP_SUB: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t diff = a.as_immediate_int_fast() - b.as_immediate_int_fast();
            if (__builtin_expect(diff >= VMValue::MIN_INT48 && diff <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(diff) & VMValue::PAYLOAD_MASK));
                size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
                if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                    uint8_t& counter = chunk.warmup_counters[site_ip];
                    if (++counter >= 8) {
                        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_SUB_INT);
                    }
                }
                DISPATCH_C();
            }
        }
        *sp++ = a.sub(b);
        DISPATCH_C();
    }

    c_lbl_OP_MUL: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t prod = a.as_immediate_int_fast() * b.as_immediate_int_fast();
            if (__builtin_expect(prod >= VMValue::MIN_INT48 && prod <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(prod) & VMValue::PAYLOAD_MASK));
                size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
                if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                    uint8_t& counter = chunk.warmup_counters[site_ip];
                    if (++counter >= 8) {
                        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_MUL_INT);
                    }
                }
                DISPATCH_C();
            }
        }
        *sp++ = a.mul(b);
        DISPATCH_C();
    }

    c_lbl_OP_DIV: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.div(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_MOD: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.mod(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_BIT_AND: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.bit_and(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_BIT_OR: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.bit_or(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_BIT_XOR: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.bit_xor(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_SHL: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.shl(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_SHR: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            *sp++ = a.shr(b);
        }
        DISPATCH_C();
    }

    c_lbl_OP_NEG: {
        {
            VMValue val = *--sp;
            *sp++ = val.neg();
        }
        DISPATCH_C();
    }

    c_lbl_OP_TERNARY_MIN: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            if (a.is_tafpu() || b.is_tafpu()) {
                int cmp = tafpu_cmp(a.as_tafpu(), b.as_tafpu());
                *sp++ = (cmp <= 0 ? a : b);
            } else {
                int64_t v1 = a.as_int();
                int64_t v2 = b.as_int();
                if (a.is_bool() && b.is_bool()) {
                    *sp++ = VMValue(v1 < v2 ? v1 != 0 : v2 != 0);
                } else {
                    *sp++ = VMValue(v1 < v2 ? v1 : v2);
                }
            }
        }
        DISPATCH_C();
    }

    c_lbl_OP_TERNARY_MAX: {
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            if (a.is_tafpu() || b.is_tafpu()) {
                int cmp = tafpu_cmp(a.as_tafpu(), b.as_tafpu());
                *sp++ = (cmp >= 0 ? a : b);
            } else {
                int64_t v1 = a.as_int();
                int64_t v2 = b.as_int();
                if (a.is_bool() && b.is_bool()) {
                    *sp++ = VMValue(v1 > v2 ? v1 != 0 : v2 != 0);
                } else {
                    *sp++ = VMValue(v1 > v2 ? v1 : v2);
                }
            }
        }
        DISPATCH_C();
    }

    c_lbl_OP_EQ: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.raw_ == b.raw_);
            size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
            if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                uint8_t& counter = chunk.warmup_counters[site_ip];
                if (++counter >= 8) code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_EQ_INT);
            }
            DISPATCH_C();
        }
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() == b.as_int());
        else if (a.is_float() || b.is_float()) res = (std::abs(a.as_float() - b.as_float()) < 1e-12);
        else if (a.is_string() || b.is_string()) res = (a.to_string() == b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) == 0);
        else res = (a.as_int() == b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_NEQ: {
        bool res;
        {
            VMValue b = *--sp;
            VMValue a = *--sp;
            if (a.is_int() && b.is_int()) res = (a.as_int() != b.as_int());
            else if (a.is_float() || b.is_float()) res = (std::abs(a.as_float() - b.as_float()) >= 1e-12);
            else if (a.is_string() || b.is_string()) res = (a.to_string() != b.to_string());
            else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) != 0);
            else res = (a.as_int() != b.as_int());
        }
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_LT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() < b.as_immediate_int_fast());
            size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
            if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                uint8_t& counter = chunk.warmup_counters[site_ip];
                if (++counter >= 8) code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_LT_INT);
            }
            DISPATCH_C();
        }
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() < b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() < b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() < b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) < 0);
        else res = (a.as_int() < b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_LE: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() <= b.as_immediate_int_fast());
            size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
            if (__builtin_expect(opt_flags_.enable_quickening && site_ip < chunk.warmup_counters.size(), 1)) {
                uint8_t& counter = chunk.warmup_counters[site_ip];
                if (++counter >= 8) code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_QUICK_LE_INT);
            }
            DISPATCH_C();
        }
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() <= b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() <= b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() <= b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) <= 0);
        else res = (a.as_int() <= b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_GT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() > b.as_immediate_int_fast());
            DISPATCH_C();
        }
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() > b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() > b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() > b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) > 0);
        else res = (a.as_int() > b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_GE: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() >= b.as_immediate_int_fast());
            DISPATCH_C();
        }
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() >= b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() >= b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() >= b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) >= 0);
        else res = (a.as_int() >= b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_JUMP: {
        int16_t offset = static_cast<int16_t>(ip[0] | (ip[1] << 8));
        ip += 2 + offset;
        DISPATCH_C();
    }

    c_lbl_OP_JUMP_IF_FALSE: {
        int16_t offset = static_cast<int16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        bool take = false;
        {
            VMValue cond = *--sp;
            take = !cond.as_bool();
        }
        if (take) ip += offset;
        DISPATCH_C();
    }

    c_lbl_OP_BRANCH_3: {
        int16_t neg_off = static_cast<int16_t>(ip[0] | (ip[1] << 8));
        int16_t zero_off = static_cast<int16_t>(ip[2] | (ip[3] << 8));
        int16_t pos_off = static_cast<int16_t>(ip[4] | (ip[5] << 8));
        ip += 6;
        int branch_sign = 0;
        {
            VMValue val = *--sp;
            if (val.is_tafpu()) {
                branch_sign = tafpu_cmp(val.as_tafpu(), TafpuNum(0, 0, 0));
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
        }
        if (branch_sign < 0) {
            ip = (ip - 4) + neg_off;
        } else if (branch_sign == 0) {
            ip = (ip - 2) + zero_off;
        } else {
            ip = ip + pos_off;
        }
        DISPATCH_C();
    }

    c_lbl_OP_CALL: {
        uint16_t fn_idx = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        uint32_t fn_entry = 0;
        if (chunk.function_table.empty()) {
            fn_entry = fn_idx;
        } else {
            if (__builtin_expect(fn_idx >= chunk.function_table.size(), 0)) {
                SYNC_TO_VM();
                throw VMException("Invalid function index in OP_CALL");
            }
            fn_entry = chunk.function_table[fn_idx];
        }
        uint8_t argc = *ip++;

        size_t callee_frame_size = chunk.get_frame_size(fn_idx, argc);

        size_t new_local_base;
        if (opt_flags_.enable_fast_frames) {
            new_local_base = local_top_;
            #ifndef NDEBUG
            size_t parent_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
            size_t parent_size = call_stack_.empty() ? chunk.toplevel_frame_size : call_stack_.back().frame_size;
            assert(new_local_base >= parent_base + parent_size && "Frame overlap invariant violated: new_local_base < parent end");
            #endif
            local_top_ += callee_frame_size;
            if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
                locals_.resize(locals_.size() * 2);
            }
        } else {
            new_local_base = locals_.size();
            locals_.resize(new_local_base + callee_frame_size);
        }

        for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
            locals_[new_local_base + i] = *--sp;
        }

        call_stack_.push_back(CallFrame{static_cast<size_t>(ip - code_base), new_local_base, static_cast<size_t>(sp - stack_.data()), callee_frame_size});
        local_base = new_local_base;
        ip = code_base + fn_entry;
        DISPATCH_C();
    }

    c_lbl_OP_RET: {
        if (__builtin_expect(call_stack_.empty(), 0)) {
            running_ = false;
            goto c_lbl_exit;
        }
        CallFrame frame = call_stack_.back();
        call_stack_.pop_back();
        {
            VMValue ret_val = *--sp;
            if (opt_flags_.enable_fast_frames) {
                local_top_ = frame.local_base;
            } else {
                locals_.resize(frame.local_base);
            }
            sp = stack_.data() + frame.stack_depth;
            *sp++ = ret_val;
        }
        local_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
        ip = code_base + frame.return_ip;
        DISPATCH_C();
    }

    #define DELEGATE_OP(op, handler) \
        c_lbl_##op: \
            SYNC_TO_VM(); \
            try { handler(chunk); } \
            catch (const VMException& e) { goto c_lbl_catch; } \
            SYNC_FROM_VM(); \
            DISPATCH_C();

    DELEGATE_OP(OP_PUSH_STRING, handle_push_string);
    DELEGATE_OP(OP_TERNARY_NOT, handle_ternary_not);
    DELEGATE_OP(OP_TERNARY_CMP, handle_ternary_cmp);
    DELEGATE_OP(OP_TAFPU_CONSTRUCT, handle_tafpu_construct);
    DELEGATE_OP(OP_TAFPU_ENCODE, handle_tafpu_encode);
    DELEGATE_OP(OP_TAFPU_TODBL, handle_tafpu_todbl);
    DELEGATE_OP(OP_PRINT, handle_print);
    DELEGATE_OP(OP_PRINTLN, handle_println);
    DELEGATE_OP(OP_TRACE, handle_trace);
    DELEGATE_OP(OP_ASSERT_EQ, handle_assert_eq);
    DELEGATE_OP(OP_HALT, handle_halt);
    DELEGATE_OP(OP_GFX_INIT, handle_gfx_init);
    DELEGATE_OP(OP_GFX_IS_RUNNING, handle_gfx_is_running);
    DELEGATE_OP(OP_GFX_CLEAR, handle_gfx_clear);
    DELEGATE_OP(OP_GFX_DRAW_RECT, handle_gfx_draw_rect);
    DELEGATE_OP(OP_GFX_DRAW_CIRCLE, handle_gfx_draw_circle);
    DELEGATE_OP(OP_GFX_DRAW_TEXT, handle_gfx_draw_text);
    DELEGATE_OP(OP_GFX_FLIP, handle_gfx_flip);
    DELEGATE_OP(OP_GFX_GET_KEY, handle_gfx_get_key);
    DELEGATE_OP(OP_GFX_CLOSE, handle_gfx_close);
    DELEGATE_OP(OP_NN_CREATE_DENSE, handle_nn_create_dense);
    DELEGATE_OP(OP_NN_SET_WEIGHT, handle_nn_set_weight);
    DELEGATE_OP(OP_NN_SET_BIAS, handle_nn_set_bias);
    DELEGATE_OP(OP_NN_SET_INPUT, handle_nn_set_input);
    DELEGATE_OP(OP_NN_GET_INPUT, handle_nn_get_input);
    DELEGATE_OP(OP_NN_FORWARD, handle_nn_forward);
    DELEGATE_OP(OP_NN_GET_OUTPUT, handle_nn_get_output);
    DELEGATE_OP(OP_NN_COPY_OUT_IN, handle_nn_copy_out_in);
    DELEGATE_OP(OP_NN_PREDICT, handle_nn_predict);
    DELEGATE_OP(OP_NN_CONFIDENCE, handle_nn_confidence);
    DELEGATE_OP(OP_NN_LOAD_MNIST, handle_nn_load_mnist);
    DELEGATE_OP(OP_NN_FREE_LAYER, handle_nn_free_layer);
    DELEGATE_OP(OP_TIME_NOW_US, handle_time_now_us);
    DELEGATE_OP(OP_GET_FIELD, handle_get_field);
    DELEGATE_OP(OP_NEW_INSTANCE, handle_new_instance);
    DELEGATE_OP(OP_SET_FIELD, handle_set_field);
    DELEGATE_OP(OP_INVOKE_METHOD, handle_invoke_method);
    DELEGATE_OP(OP_TRY, handle_try);
    DELEGATE_OP(OP_THROW, handle_throw);
    DELEGATE_OP(OP_POP_TRY, handle_pop_try);
    DELEGATE_OP(OP_CLOSURE, handle_closure);
    DELEGATE_OP(OP_CALL_INDIRECT, handle_call_indirect);

    c_lbl_OP_NEW_ARRAY: {
        uint16_t count = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        ENSURE_STACK(1);
        {
            auto arr = std::make_shared<std::vector<VMValue>>(count);
            for (int i = static_cast<int>(count) - 1; i >= 0; --i) {
                (*arr)[i] = *--sp;
            }
            *sp++ = VMValue(arr);
        }
        DISPATCH_C();
    }

    c_lbl_OP_GET_INDEX: {
        {
            VMValue idx = *--sp;
            VMValue obj = *--sp;
            if (obj.is_array()) {
                auto arr = obj.as_array();
                if (arr && !arr->empty()) {
                    int64_t i = idx.as_int();
                    if (i < 0) i += arr->size();
                    if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                        *sp++ = (*arr)[i];
                    } else {
                        *sp++ = VMValue(static_cast<int64_t>(0));
                    }
                } else {
                    *sp++ = VMValue(static_cast<int64_t>(0));
                }
            } else if (obj.is_string()) {
                std::string s = obj.to_string();
                int64_t i = idx.as_int();
                if (i < 0) i += s.size();
                if (i >= 0 && static_cast<size_t>(i) < s.size()) {
                    *sp++ = VMValue(std::string(1, s[i]));
                } else {
                    *sp++ = VMValue("");
                }
            } else if (obj.is_tafpu()) {
                TafpuNum num = obj.as_tafpu();
                int64_t i = idx.as_int();
                if (i == 0) *sp++ = VMValue(num.a);
                else if (i == 1) *sp++ = VMValue(num.b);
                else if (i == 2) *sp++ = VMValue(static_cast<int64_t>(num.s));
                else *sp++ = VMValue(static_cast<int64_t>(0));
            } else if (obj.is_object()) {
                auto vmo = obj.as_object();
                if (vmo) {
                    *sp++ = vmo->get_field(idx.to_string());
                } else {
                    *sp++ = VMValue(static_cast<int64_t>(0));
                }
            } else {
                *sp++ = VMValue(static_cast<int64_t>(0));
            }
        }
        DISPATCH_C();
    }

    c_lbl_OP_SET_INDEX: {
        {
            VMValue val = *--sp;
            VMValue idx_val = *--sp;
            VMValue target = *--sp;
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
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_LOCAL_0: {
        ENSURE_STACK(1);
        *sp++ = locals_[local_base + 0];
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_LOCAL_1: {
        ENSURE_STACK(1);
        *sp++ = locals_[local_base + 1];
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_LOCAL_2: {
        ENSURE_STACK(1);
        *sp++ = locals_[local_base + 2];
        DISPATCH_C();
    }

    c_lbl_OP_LOAD_LOCAL_3: {
        ENSURE_STACK(1);
        *sp++ = locals_[local_base + 3];
        DISPATCH_C();
    }

    c_lbl_OP_STORE_LOCAL_0: {
        locals_[local_base + 0] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_STORE_LOCAL_1: {
        locals_[local_base + 1] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_STORE_LOCAL_2: {
        locals_[local_base + 2] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_STORE_LOCAL_3: {
        locals_[local_base + 3] = *(sp - 1);
        DISPATCH_C();
    }

    c_lbl_OP_INCR_LOCAL_IMM: {
        uint16_t slot = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        int16_t imm = static_cast<int16_t>(ip[2] | (ip[3] << 8));
        ip += 4;
        size_t idx = local_base + slot;
        if (__builtin_expect(idx >= local_top_, 0)) {
            local_top_ = idx + 8;
            if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
                locals_.resize(locals_.size() * 2);
            }
        }
        VMValue& cur = locals_[idx];
        if (__builtin_expect(cur.is_immediate_int(), 1)) {
            int64_t sum = cur.as_immediate_int_fast() + imm;
            if (__builtin_expect(sum >= VMValue::MIN_INT48 && sum <= VMValue::MAX_INT48, 1)) {
                cur = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(sum) & VMValue::PAYLOAD_MASK));
                telemetry_.superinstructions_executed++;
                DISPATCH_C();
            }
        }
        cur = cur.add(VMValue(static_cast<int64_t>(imm)));
        DISPATCH_C();
    }

    c_lbl_OP_GET_INDEX_ARRAY: {
        VMValue idx_val = *--sp;
        VMValue target = *--sp;
        if (__builtin_expect(target.is_array() && idx_val.is_immediate_int(), 1)) {
            auto* arr = target.payload()->arr.get();
            if (arr) {
                int64_t i = idx_val.as_immediate_int_fast();
                if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                    *sp++ = (*arr)[i];
                    telemetry_.superinstructions_executed++;
                    DISPATCH_C();
                }
            }
        }
        if (target.is_array()) {
            auto* arr = target.payload()->arr.get();
            if (arr && !arr->empty()) {
                int64_t i = idx_val.as_int();
                if (i < 0) i += arr->size();
                if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                    *sp++ = (*arr)[i];
                } else {
                    *sp++ = VMValue(static_cast<int64_t>(0));
                }
            } else {
                *sp++ = VMValue(static_cast<int64_t>(0));
            }
        } else if (target.is_string()) {
            std::string s = target.to_string();
            int64_t i = idx_val.as_int();
            if (i < 0) i += s.size();
            if (i >= 0 && static_cast<size_t>(i) < s.size()) {
                *sp++ = VMValue(std::string(1, s[i]));
            } else {
                *sp++ = VMValue("");
            }
        } else if (target.is_object()) {
            auto* vmo = target.payload()->obj.get();
            if (vmo) *sp++ = vmo->get_field(idx_val.to_string());
            else *sp++ = VMValue(static_cast<int64_t>(0));
        } else {
            *sp++ = VMValue(static_cast<int64_t>(0));
        }
        DISPATCH_C();
    }

    c_lbl_OP_SET_INDEX_ARRAY: {
        VMValue val = *--sp;
        VMValue idx_val = *--sp;
        VMValue target = *--sp;
        if (__builtin_expect(target.is_array() && idx_val.is_immediate_int(), 1)) {
            auto* arr = target.payload()->arr.get();
            if (arr) {
                int64_t i = idx_val.as_immediate_int_fast();
                if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                    (*arr)[i] = val;
                    telemetry_.superinstructions_executed++;
                    DISPATCH_C();
                }
            }
        }
        if (target.is_array()) {
            auto* arr = target.payload()->arr.get();
            if (arr) {
                int64_t i = idx_val.as_int();
                if (i < 0) i += arr->size();
                if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
                    (*arr)[i] = val;
                }
            }
        } else if (target.is_object()) {
            auto* vmo = target.payload()->obj.get();
            if (vmo) vmo->set_field(idx_val.to_string(), val);
        }
        DISPATCH_C();
    }

    c_lbl_OP_LOOP_RANGE_FAST: {
        uint16_t var_slot  = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        uint16_t stop_slot = static_cast<uint16_t>(ip[2] | (ip[3] << 8));
        uint16_t step_slot = static_cast<uint16_t>(ip[4] | (ip[5] << 8));
        int16_t  exit_dist = static_cast<int16_t>(ip[6] | (ip[7] << 8));
        ip += 8;

        int64_t var_val  = locals_[local_base + var_slot].as_int();
        int64_t stop_val = locals_[local_base + stop_slot].as_int();
        int64_t step_val = locals_[local_base + step_slot].as_int();

        if (__builtin_expect(step_val == 0, 0)) {
            SYNC_TO_VM();
            throw VMException("range() step cannot be zero");
        }

        bool active = (step_val > 0) ? (var_val < stop_val) : (var_val > stop_val);
        if (!active) {
            ip += exit_dist;
        } else {
            telemetry_.loop_fast_iterations++;
        }
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_ADD_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t sum = a.as_immediate_int_fast() + b.as_immediate_int_fast();
            if (__builtin_expect(sum >= VMValue::MIN_INT48 && sum <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(sum) & VMValue::PAYLOAD_MASK));
                telemetry_.quick_hits++;
                DISPATCH_C();
            }
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_ADD);
        *sp++ = a.add(b);
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_SUB_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t diff = a.as_immediate_int_fast() - b.as_immediate_int_fast();
            if (__builtin_expect(diff >= VMValue::MIN_INT48 && diff <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(diff) & VMValue::PAYLOAD_MASK));
                telemetry_.quick_hits++;
                DISPATCH_C();
            }
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_SUB);
        *sp++ = a.sub(b);
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_MUL_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            int64_t prod = a.as_immediate_int_fast() * b.as_immediate_int_fast();
            if (__builtin_expect(prod >= VMValue::MIN_INT48 && prod <= VMValue::MAX_INT48, 1)) {
                *sp++ = VMValue::from_raw(VMValue::TAG_INT | (static_cast<uint64_t>(prod) & VMValue::PAYLOAD_MASK));
                telemetry_.quick_hits++;
                DISPATCH_C();
            }
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_MUL);
        *sp++ = a.mul(b);
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_LT_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() < b.as_immediate_int_fast());
            telemetry_.quick_hits++;
            DISPATCH_C();
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_LT);
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() < b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() < b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() < b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) < 0);
        else res = (a.as_int() < b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_LE_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.as_immediate_int_fast() <= b.as_immediate_int_fast());
            telemetry_.quick_hits++;
            DISPATCH_C();
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_LE);
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() <= b.as_int());
        else if (a.is_float() || b.is_float()) res = (a.as_float() <= b.as_float());
        else if (a.is_string() || b.is_string()) res = (a.to_string() <= b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) <= 0);
        else res = (a.as_int() <= b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_QUICK_EQ_INT: {
        VMValue b = *--sp;
        VMValue a = *--sp;
        if (__builtin_expect(VMValue::is_both_immediate_int(a, b), 1)) {
            *sp++ = VMValue(a.raw_ == b.raw_);
            telemetry_.quick_hits++;
            DISPATCH_C();
        }
        telemetry_.deopt_count++;
        size_t site_ip = static_cast<size_t>(ip - 1 - code_base);
        code_base[site_ip] = static_cast<uint8_t>(OpCode::OP_EQ);
        bool res;
        if (a.is_int() && b.is_int()) res = (a.as_int() == b.as_int());
        else if (a.is_float() || b.is_float()) res = (std::abs(a.as_float() - b.as_float()) < 1e-12);
        else if (a.is_string() || b.is_string()) res = (a.to_string() == b.to_string());
        else if (a.is_tafpu() || b.is_tafpu()) res = (tafpu_cmp(a.as_tafpu(), b.as_tafpu()) == 0);
        else res = (a.as_int() == b.as_int());
        *sp++ = res;
        DISPATCH_C();
    }

    c_lbl_OP_GET_FIELD_IC: {
        uint16_t ic_idx = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        ICSite& ic = chunk.ic_sites[ic_idx];
        VMValue obj = *--sp;

        if (__builtin_expect(obj.is_object(), 1)) {
            auto* vmo = obj.payload()->obj.get();
            if (__builtin_expect(vmo && vmo->shape && vmo->shape->shape_id == ic.expected_shape && ic.expected_shape != 0, 1)) {
                *sp++ = vmo->fields_array[ic.cached_slot];
                telemetry_.ic_hits++;
                DISPATCH_C();
            }
            telemetry_.ic_misses++;
            if (vmo) {
                const std::string& fname = chunk.string_table[ic.str_id];
                if (fname == "len" || fname == "length") {
                    *sp++ = VMValue(static_cast<int64_t>(vmo->field_count()));
                    DISPATCH_C();
                }
                if (vmo->shape) {
                    int slot = vmo->shape->get_slot(fname);
                    if (slot >= 0 && static_cast<size_t>(slot) < vmo->fields_array.size()) {
                        ic.expected_shape = vmo->shape->shape_id;
                        ic.cached_slot = static_cast<uint16_t>(slot);
                        *sp++ = vmo->fields_array[slot];
                        DISPATCH_C();
                    }
                }
                if (vmo->has_field(fname)) {
                    *sp++ = vmo->get_field(fname);
                    DISPATCH_C();
                }
                SYNC_TO_VM();
                throw VMException("Object of type '" + vmo->type_name + "' has no field '" + fname + "'.");
            }
        } else if (obj.is_array()) {
            auto* arr = obj.payload()->arr.get();
            const std::string& fname = chunk.string_table[ic.str_id];
            if (fname == "len" || fname == "length") {
                *sp++ = VMValue(static_cast<int64_t>(arr ? arr->size() : 0));
                DISPATCH_C();
            }
        } else if (obj.is_tafpu()) {
            TafpuNum num = obj.as_tafpu();
            const std::string& fname = chunk.string_table[ic.str_id];
            if (fname == "len" || fname == "length") *sp++ = VMValue(static_cast<int64_t>(3));
            else if (fname == "a" || fname == "x") *sp++ = VMValue(num.a);
            else if (fname == "b" || fname == "y") *sp++ = VMValue(num.b);
            else if (fname == "s" || fname == "z") *sp++ = VMValue(static_cast<int64_t>(num.s));
            else *sp++ = VMValue(static_cast<int64_t>(0));
            DISPATCH_C();
        } else if (obj.is_string()) {
            const std::string& fname = chunk.string_table[ic.str_id];
            if (fname == "length" || fname == "len") {
                *sp++ = VMValue(static_cast<int64_t>(obj.to_string().size()));
                DISPATCH_C();
            }
        }
        *sp++ = VMValue(static_cast<int64_t>(0));
        DISPATCH_C();
    }

    c_lbl_OP_SET_FIELD_IC: {
        uint16_t ic_idx = static_cast<uint16_t>(ip[0] | (ip[1] << 8));
        ip += 2;
        ICSite& ic = chunk.ic_sites[ic_idx];
        VMValue val = *--sp;
        VMValue target = *--sp;

        if (__builtin_expect(target.is_object(), 1)) {
            auto* vmo = target.payload()->obj.get();
            if (__builtin_expect(vmo && vmo->shape && vmo->shape->shape_id == ic.expected_shape && ic.expected_shape != 0, 1)) {
                if (ic.cached_slot < vmo->fields_array.size()) {
                    vmo->fields_array[ic.cached_slot] = val;
                    telemetry_.ic_hits++;
                    DISPATCH_C();
                }
            }
            telemetry_.ic_misses++;
            if (vmo) {
                const std::string& fname = chunk.string_table[ic.str_id];
                vmo->set_field(fname, val);
                if (vmo->shape) {
                    int slot = vmo->shape->get_slot(fname);
                    if (slot >= 0) {
                        ic.expected_shape = vmo->shape->shape_id;
                        ic.cached_slot = static_cast<uint16_t>(slot);
                    }
                }
            }
        }
        DISPATCH_C();
    }

    c_lbl_unknown: {
        SYNC_TO_VM();
        std::ostringstream oss;
        oss << "VM Exception: Unknown opcode at offset " << (ip_ - 1);
        throw VMException(oss.str());
    }

    c_lbl_catch: {
        if (try_stack_.empty()) throw;
        TryFrame frame = try_stack_.back();
        try_stack_.pop_back();
        stack_.truncate(frame.stack_depth);
        if (opt_flags_.enable_fast_frames) {
            local_top_ = frame.locals_len;
        } else {
            if (frame.locals_len <= locals_.size()) locals_.resize(frame.locals_len);
        }
        if (frame.call_depth <= call_stack_.size()) call_stack_.resize(frame.call_depth);
        ip_ = frame.catch_ip;
        stack_.push(VMValue("VM Exception caught"));
        SYNC_FROM_VM();
        DISPATCH_C();
    }

    c_lbl_exit:
        SYNC_TO_VM();
        return;
#else
    run_switch(chunk);
#endif
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

void VM::handle_mod(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.mod(b));
}

void VM::handle_bit_and(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.bit_and(b));
}

void VM::handle_bit_or(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.bit_or(b));
}

void VM::handle_bit_xor(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.bit_xor(b));
}

void VM::handle_shl(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.shl(b));
}

void VM::handle_shr(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.shr(b));
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
    // Operand is a function-table index (v2) or a direct entry (legacy v1).
    uint16_t fn_idx = static_cast<uint16_t>(read_int16(chunk));
    uint32_t fn_entry = 0;
    if (chunk.function_table.empty()) {
        fn_entry = fn_idx;
    } else {
        if (fn_idx >= chunk.function_table.size()) {
            throw VMException("Invalid function index " + std::to_string(fn_idx) + " in OP_CALL.");
        }
        fn_entry = chunk.function_table[fn_idx];
    }
    uint8_t argc = read_byte(chunk);

    size_t callee_frame_size = 32;
    if (!chunk.function_frame_sizes.empty() && fn_idx < chunk.function_frame_sizes.size()) {
        callee_frame_size = chunk.function_frame_sizes[fn_idx];
    }
    if (callee_frame_size < argc + 8) callee_frame_size = argc + 8;

    size_t new_local_base;
    if (opt_flags_.enable_fast_frames) {
        new_local_base = local_top_;
        #ifndef NDEBUG
        size_t parent_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
        size_t parent_size = call_stack_.empty() ? chunk.toplevel_frame_size : call_stack_.back().frame_size;
        assert(new_local_base >= parent_base + parent_size && "Frame overlap invariant violated in handle_call: new_local_base < parent end");
        #endif
        local_top_ += callee_frame_size;
        if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
            locals_.resize(locals_.size() * 2);
        }
    } else {
        new_local_base = locals_.size();
        locals_.resize(new_local_base + callee_frame_size);
    }

    // Pop arguments from stack in reverse order and store in new local base
    for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
        locals_[new_local_base + i] = stack_.pop();
    }

    call_stack_.push_back(CallFrame{ip_, new_local_base, stack_.size(), callee_frame_size});
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
    if (opt_flags_.enable_fast_frames) {
        local_top_ = frame.local_base;
    } else {
        locals_.resize(frame.local_base);
    }

    // Drop whatever the callee left on the operand stack (STORE ops peek by
    // design) so the caller only sees its own values plus the return value.
    stack_.truncate(frame.stack_depth);

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
        std::cerr << oss.str() << "\n";
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
    auto now = std::chrono::steady_clock::now();
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
                stack_.push(VMValue(static_cast<int64_t>(vmo->field_count())));
                return;
            }
            if (!vmo->has_field(field)) {
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
        obj->set_field("x", vals[0]);
        obj->set_field("y", vals[1]);
        obj->set_field("z", vals[2]);
        obj->set_field("a", vals[0]);
        obj->set_field("b", vals[1]);
        obj->set_field("s", vals[2]);
    } else {
        for (size_t i = 0; i < field_count; ++i) {
            obj->set_field("field_" + std::to_string(i), vals[i]);
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
        } else if (method_name == "ulen") {
            // Unicode codepoint count (len() stays byte-based for compat).
            stack_.push(VMValue(static_cast<int64_t>(text::utf8_codepoint_count(s))));
            return;
        } else if (method_name == "uslice") {
            int64_t start = (!args.empty()) ? args[0].as_int() : 0;
            int64_t count = (args.size() >= 2) ? args[1].as_int() : INT64_MAX;
            std::string out;
            int64_t idx = 0;
            size_t i = 0;
            if (start < 0) start = 0;
            while (i < s.size()) {
                auto [cp, next] = text::utf8_decode_next(s, i);
                if (idx >= start && idx < start + count) {
                    out += text::utf8_encode(cp);
                }
                i = next;
                ++idx;
            }
            stack_.push(VMValue(out));
            return;
        } else if (method_name == "uindex") {
            int64_t want = (!args.empty()) ? args[0].as_int() : 0;
            int64_t idx = 0;
            size_t i = 0;
            while (i < s.size()) {
                auto [cp, next] = text::utf8_decode_next(s, i);
                if (idx == want) {
                    stack_.push(VMValue(text::utf8_encode(cp)));
                    return;
                }
                i = next;
                ++idx;
            }
            stack_.push(VMValue(""));
            return;
        } else if (method_name == "text_width") {
            stack_.push(VMValue(static_cast<int64_t>(
                graphics::Setun2DBridge::instance().text_width(s))));
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
                    // Encode a Unicode codepoint as UTF-8 (ASCII identical to before).
                    uint32_t cp = (!args.empty()) ? static_cast<uint32_t>(args[0].as_int()) : 0;
                    if (cp > 0 && cp <= 0x7FFF) {
                        stack_.push(VMValue(text::utf8_encode(cp)));
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
                    // Method entries are function-table indices (v2) or direct
                    // offsets (legacy v1 chunks with an empty table).
                    uint32_t fn_entry = 0;
                    if (chunk.function_table.empty()) {
                        fn_entry = it->second;
                    } else {
                        if (it->second >= chunk.function_table.size()) {
                            throw VMException("Invalid method index for '" + method_name + "'.");
                        }
                        fn_entry = chunk.function_table[it->second];
                    }
                    size_t callee_frame_size = 32;
                    if (!chunk.function_frame_sizes.empty() && it->second < chunk.function_frame_sizes.size()) {
                        callee_frame_size = chunk.function_frame_sizes[it->second];
                    }
                    if (callee_frame_size < argc + 1 + 8) callee_frame_size = argc + 1 + 8;

                    size_t new_local_base;
                    if (opt_flags_.enable_fast_frames) {
                        new_local_base = local_top_;
                        #ifndef NDEBUG
                        size_t parent_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
                        size_t parent_size = call_stack_.empty() ? chunk.toplevel_frame_size : call_stack_.back().frame_size;
                        assert(new_local_base >= parent_base + parent_size && "Frame overlap invariant violated in invoke_method: new_local_base < parent end");
                        #endif
                        local_top_ += callee_frame_size;
                        if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
                            locals_.resize(locals_.size() * 2);
                        }
                    } else {
                        new_local_base = locals_.size();
                        locals_.resize(new_local_base + callee_frame_size);
                    }
                    locals_[new_local_base] = target; // slot 0 is 'self'
                    for (size_t i = 0; i < argc; ++i) {
                        locals_[new_local_base + 1 + i] = args[i];
                    }
                    call_stack_.push_back(CallFrame{ip_, new_local_base, stack_.size(), callee_frame_size});
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

void VM::handle_try(const Chunk& chunk) {
    int16_t offset = read_int16(chunk);
    TryFrame frame;
    frame.catch_ip = static_cast<size_t>(ip_ + offset);
    frame.stack_depth = stack_.size();
    frame.locals_len = opt_flags_.enable_fast_frames ? local_top_ : locals_.size();
    frame.call_depth = call_stack_.size();
    try_stack_.push_back(frame);
}

void VM::handle_throw(const Chunk&) {
    VMValue msg = stack_.pop();
    throw VMException(msg.to_string());
}

void VM::handle_pop_try(const Chunk&) {
    if (!try_stack_.empty()) {
        try_stack_.pop_back();
    }
}


void VM::handle_closure(const Chunk& chunk) {
    uint16_t fn_idx = static_cast<uint16_t>(read_int16(chunk));
    uint8_t capture_count = read_byte(chunk);
    uint32_t entry = 0;
    if (chunk.function_table.empty()) {
        entry = fn_idx;
    } else {
        if (fn_idx >= chunk.function_table.size()) {
            throw VMException("Invalid function index " + std::to_string(fn_idx) + " in OP_CLOSURE.");
        }
        entry = chunk.function_table[fn_idx];
    }
    std::vector<VMValue> caps;
    caps.reserve(capture_count);
    for (int i = 0; i < static_cast<int>(capture_count); ++i) {
        caps.push_back(stack_.pop());
    }
    auto closure = std::make_shared<VMClosure>();
    closure->entry = entry;
    closure->fn_idx = fn_idx;
    size_t fsize = 32;
    if (!chunk.function_frame_sizes.empty() && fn_idx < chunk.function_frame_sizes.size()) {
        fsize = chunk.function_frame_sizes[fn_idx];
    }
    closure->frame_size = fsize;
    for (int i = static_cast<int>(capture_count) - 1; i >= 0; --i) {
        closure->captures.push_back(caps[static_cast<size_t>(i)]);
    }
    stack_.push(VMValue(closure));
}

void VM::handle_call_indirect(const Chunk& chunk) {
    uint8_t argc = read_byte(chunk);
    VMValue fval = stack_.pop();
    if (!fval.is_function() || !fval.as_closure()) {
        throw VMException("Attempt to call a value that is not a function.");
    }
    auto closure = fval.as_closure();
    size_t cap_count = closure->captures.size();
    size_t callee_frame_size = std::max(closure->frame_size, argc + cap_count + 8);

    size_t new_local_base;
    if (opt_flags_.enable_fast_frames) {
        new_local_base = local_top_;
        #ifndef NDEBUG
        size_t parent_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;
        size_t parent_size = call_stack_.empty() ? chunk.toplevel_frame_size : call_stack_.back().frame_size;
        assert(new_local_base >= parent_base + parent_size && "Frame overlap invariant violated in handle_call_indirect: new_local_base < parent end");
        #endif
        local_top_ += callee_frame_size;
        if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
            locals_.resize(locals_.size() * 2);
        }
    } else {
        new_local_base = locals_.size();
        locals_.resize(new_local_base + callee_frame_size);
    }
    for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
        locals_[new_local_base + static_cast<size_t>(i)] = stack_.pop();
    }
    for (size_t j = 0; j < cap_count; ++j) {
        locals_[new_local_base + argc + j] = closure->captures[j];
    }
    call_stack_.push_back(CallFrame{ip_, new_local_base, stack_.size(), callee_frame_size});
    ip_ = closure->entry;
}

} // namespace setun
