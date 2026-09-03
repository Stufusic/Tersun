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
