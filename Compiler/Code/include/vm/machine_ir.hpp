#pragma once

#include "vm/value.hpp"
#include <cstdint>
#include <vector>
#include <string>
#include <memory>
#include <iostream>

namespace setun {

// ============================================================================
// Gate 5.9 (Advanced): MachineIR (MIR SSA) Architecture
// ============================================================================

using vreg_t = uint32_t;
constexpr vreg_t NO_VREG = 0xFFFFFFFF;

// Opcode classification strictly separated according to rv5.9.md (Section 2)
enum class MIROpcode : uint16_t {
    // 1. Values & Movement
    NOP = 0,
    MOV,
    PHI,
    CONST_INT,
    CONST_FLOAT,
    CONST_TRYTE,
    CONST_NULL,

    // 2. Specialized Arithmetic (Type-Specialized)
    INT_ADD,
    INT_SUB,
    INT_MUL,
    INT_DIV,
    INT_MOD,
    FLOAT_ADD,
    FLOAT_SUB,
    FLOAT_MUL,
    FLOAT_DIV,
    TRYTE_ADD,
    TRYTE_SUB,
    TRYTE_MUL,
    BIT_AND,
    BIT_OR,
    BIT_XOR,
    SHL,
    SHR,

    // 3. Memory & Effects
    LOAD_FIELD,
    STORE_FIELD,
    LOAD_ELEMENT,
    STORE_ELEMENT,

    // 4. Control Flow & Calls
    JMP,
    JCC,
    CALL_NATIVE,
    CALL_RUNTIME,
    CALL_DIRECT,
    INVOKE_VIRTUAL,
    RET,

    // 5. First-Class Speculative Guards
    GUARD_TYPE,
    GUARD_OVERFLOW,
    GUARD_SHAPE,
    GUARD_VTABLE,
    GUARD_BOUNDS,

    // 6. Runtime Coordination
    DEOPT,
    SAFEPOINT,

    // 7. SIMD / Vector Operations (G6R.2.1)
    VEC_BROADCAST,
    VEC_LOAD,
    VEC_STORE,
    VEC_ADD,
    VEC_MUL,
    VEC_FMA,
    VEC_ZEROALL,

    // 8. Ternary Arithmetic
    TERNARY_MIN,
    TERNARY_MAX
};

enum class MemoryEffect : uint8_t {
    None = 0,
    Read = 1,
    Write = 2,
    ReadWrite = 3
};

enum class MIRCondition : uint8_t {
    EQ = 0,
    NE,
    LT,
    LE,
    GT,
    GE,
    OVERFLOW,
    NO_OVERFLOW
};

struct MIRGuardInfo {
    vreg_t input_vreg{NO_VREG};
    uint64_t expected_tag_or_shape{0};
    uint32_t deopt_pc{0};
    uint8_t deopt_reason{0};
    uint32_t deopt_id{0};
    const char* reason{nullptr};
};

struct MIRInstruction {
    MIROpcode opcode{MIROpcode::NOP};
    vreg_t dest{NO_VREG};
    vreg_t src1{NO_VREG};
    vreg_t src2{NO_VREG};
    vreg_t src3{NO_VREG};
    int64_t imm64{0};
    MIRCondition cond{MIRCondition::EQ};
    MemoryEffect effect{MemoryEffect::None};
    uint32_t target_block{0};
    uint32_t bytecode_ip{0};
    MIRGuardInfo guard;

    // PHI incoming nodes: (predecessor_block_id, vreg)
    std::vector<std::pair<uint32_t, vreg_t>> phi_incoming;

    bool is_guard() const {
        return opcode == MIROpcode::GUARD_TYPE ||
               opcode == MIROpcode::GUARD_OVERFLOW ||
               opcode == MIROpcode::GUARD_SHAPE ||
               opcode == MIROpcode::GUARD_VTABLE ||
               opcode == MIROpcode::GUARD_BOUNDS;
    }

    bool has_side_effects() const {
        return is_guard() ||
               opcode == MIROpcode::STORE_FIELD ||
               opcode == MIROpcode::STORE_ELEMENT ||
               opcode == MIROpcode::VEC_STORE ||
               opcode == MIROpcode::CALL_NATIVE ||
               opcode == MIROpcode::CALL_RUNTIME ||
               opcode == MIROpcode::CALL_DIRECT ||
               opcode == MIROpcode::INVOKE_VIRTUAL ||
               opcode == MIROpcode::DEOPT ||
               opcode == MIROpcode::SAFEPOINT ||
               opcode == MIROpcode::RET;
    }
};

struct MIRBlock {
    uint32_t id{0};
    std::string name;
    std::vector<MIRInstruction> instructions;
    std::vector<uint32_t> predecessors;
    std::vector<uint32_t> successors;
    bool is_loop_header{false};
    bool is_loop_preheader{false};
    uint32_t loop_backedge_block{0};
};

class Chunk;

struct MIRFunction {
    uint32_t function_id{0};
    std::vector<std::unique_ptr<MIRBlock>> blocks;
    vreg_t next_vreg{0};
    uint32_t num_params{0};
    uint32_t num_locals{0};

    vreg_t new_vreg() {
        return next_vreg++;
    }

    MIRBlock* create_block(const std::string& name = "") {
        auto blk = std::make_unique<MIRBlock>();
        blk->id = static_cast<uint32_t>(blocks.size());
        blk->name = name.empty() ? ("B" + std::to_string(blk->id)) : name;
        MIRBlock* ptr = blk.get();
        blocks.push_back(std::move(blk));
        return ptr;
    }

    MIRBlock* get_block(uint32_t id) {
        if (id < blocks.size()) return blocks[id].get();
        return nullptr;
    }

    // Build initial Stack-to-SSA MachineIR from bytecode Chunk
    static std::unique_ptr<MIRFunction> build_from_bytecode(const Chunk& chunk, uint32_t func_id = 0);

    // Diagnostic print
    void dump(std::ostream& os = std::cout) const;
};

} // namespace setun
