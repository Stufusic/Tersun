#pragma once

#include "vm/opcode.hpp"
#include "vm/value.hpp"
#include "vm/stack.hpp"
#include "compiler/emitter.hpp"
#include "tafpu/exception.hpp"
#include <vector>
#include <array>
#include <functional>
#include <iostream>

namespace setun {

struct CallFrame {
    size_t return_ip{0};
    size_t local_base{0};
};

class VM {
public:
    VM();

    // Execute a compiled bytecode chunk
    void run(const Chunk& chunk);

    // Reset VM state
    void reset();

    // Accessors for testing and inspection
    size_t ip() const { return ip_; }
    const VMStack& stack() const { return stack_; }
    const std::vector<VMValue>& globals() const { return globals_; }
    const std::array<TafpuNum, 8>& tafpu_registers() const { return tafpu_regs_; }
    const std::array<int16_t, 8>& tryte_registers() const { return tryte_regs_; }

    // Last printed output buffer (for test capture)
    std::string last_output() const { return output_buffer_; }
    void clear_output_buffer() { output_buffer_.clear(); }

    // Trace dump
    void dump_state(const Chunk& chunk, size_t ip) const;

private:
    void init_dispatch_table();

    // Dispatch handler type
    using OpHandler = void (VM::*)(const Chunk&);
    std::array<OpHandler, 256> dispatch_table_{};

    // Instruction handlers
    void handle_nop(const Chunk& chunk);
    void handle_push_int(const Chunk& chunk);
    void handle_push_tryte(const Chunk& chunk);
    void handle_push_tafpu(const Chunk& chunk);
    void handle_push_float(const Chunk& chunk);
    void handle_push_string(const Chunk& chunk);
    void handle_push_bool(const Chunk& chunk);
    void handle_pop(const Chunk& chunk);
    void handle_dup(const Chunk& chunk);

    void handle_load_local(const Chunk& chunk);
    void handle_store_local(const Chunk& chunk);
    void handle_load_global(const Chunk& chunk);
    void handle_store_global(const Chunk& chunk);

    void handle_add(const Chunk& chunk);
    void handle_sub(const Chunk& chunk);
    void handle_mul(const Chunk& chunk);
    void handle_div(const Chunk& chunk);
    void handle_neg(const Chunk& chunk);
    void handle_ternary_not(const Chunk& chunk);
    void handle_ternary_cmp(const Chunk& chunk);
    void handle_ternary_min(const Chunk& chunk);
    void handle_ternary_max(const Chunk& chunk);

    void handle_eq(const Chunk& chunk);
    void handle_neq(const Chunk& chunk);
    void handle_lt(const Chunk& chunk);
    void handle_le(const Chunk& chunk);
    void handle_gt(const Chunk& chunk);
    void handle_ge(const Chunk& chunk);

    void handle_tafpu_construct(const Chunk& chunk);
    void handle_tafpu_encode(const Chunk& chunk);
    void handle_tafpu_todbl(const Chunk& chunk);

    void handle_jump(const Chunk& chunk);
    void handle_jump_if_false(const Chunk& chunk);
    void handle_branch_3(const Chunk& chunk); // Setun-70 3-way branch handler

    void handle_call(const Chunk& chunk);
    void handle_ret(const Chunk& chunk);

    void handle_print(const Chunk& chunk);
    void handle_println(const Chunk& chunk);
    void handle_trace(const Chunk& chunk);
    void handle_assert_eq(const Chunk& chunk);
    void handle_halt(const Chunk& chunk);

    // Setun2D Graphics Handlers
    void handle_gfx_init(const Chunk& chunk);
    void handle_gfx_is_running(const Chunk& chunk);
    void handle_gfx_clear(const Chunk& chunk);
    void handle_gfx_draw_rect(const Chunk& chunk);
    void handle_gfx_draw_circle(const Chunk& chunk);
    void handle_gfx_draw_text(const Chunk& chunk);
    void handle_gfx_flip(const Chunk& chunk);
    void handle_gfx_get_key(const Chunk& chunk);
    void handle_gfx_close(const Chunk& chunk);

    // BitNet AI Handlers
    void handle_nn_create_dense(const Chunk& chunk);
    void handle_nn_set_weight(const Chunk& chunk);
    void handle_nn_set_bias(const Chunk& chunk);
    void handle_nn_set_input(const Chunk& chunk);
    void handle_nn_get_input(const Chunk& chunk);
    void handle_nn_forward(const Chunk& chunk);
    void handle_nn_get_output(const Chunk& chunk);
    void handle_nn_copy_out_in(const Chunk& chunk);
    void handle_nn_predict(const Chunk& chunk);
    void handle_nn_confidence(const Chunk& chunk);
    void handle_nn_load_mnist(const Chunk& chunk);
    void handle_nn_free_layer(const Chunk& chunk);
    void handle_time_now_us(const Chunk& chunk);

    void handle_get_field(const Chunk& chunk);
    void handle_get_index(const Chunk& chunk);
    void handle_new_instance(const Chunk& chunk);
    void handle_set_field(const Chunk& chunk);
    void handle_invoke_method(const Chunk& chunk);
    void handle_set_index(const Chunk& chunk);
    void handle_new_array(const Chunk& chunk);

    void register_vtable(const std::string& name, std::shared_ptr<VTable> vt) {
        vtables_[name] = vt;
    }

    std::unordered_map<std::string, std::shared_ptr<VTable>> vtables_;

    // Helpers to read from bytecode stream at IP
    uint8_t read_byte(const Chunk& chunk);
    int16_t read_int16(const Chunk& chunk);
    int32_t read_int32(const Chunk& chunk);
    int64_t read_int64(const Chunk& chunk);
    double read_double(const Chunk& chunk);

    size_t ip_{0};
    bool running_{false};
    VMStack stack_;
    std::vector<VMValue> locals_;
    std::vector<VMValue> globals_;
    std::vector<CallFrame> call_stack_;

    // Setun-70 Registers
    std::array<TafpuNum, 8> tafpu_regs_{};
    std::array<int16_t, 8> tryte_regs_{};

    // Output capture
    mutable std::string output_buffer_;
};

} // namespace setun
