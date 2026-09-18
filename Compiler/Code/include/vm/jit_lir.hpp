#pragma once

#include "vm/opcode.hpp"
#include <cstdint>
#include <vector>
#include <string>

namespace setun {

enum class LIROpcode : uint8_t {
    NOP = 0,
    PUSH_INT,       // int64_t imm
    LOAD_LOCAL,     // uint16_t slot
    STORE_LOCAL,    // uint16_t slot
    POP,
    DUP,
    ADD,
    SUB,
    MUL,
    DIV,
    MOD,
    BIT_AND,
    BIT_OR,
    BIT_XOR,
    NEG,
    EQ,
    NEQ,
    LT,
    LE,
    GT,
    GE,
    JUMP,           // target_pc
    JUMP_IF_FALSE,  // target_pc
    BRANCH_3,       // neg_pc, zero_pc, pos_pc
    SAFEPOINT,      // safepoint_id
    GUARD_TYPE,     // arg1 = deopt_target_ip
    GUARD_OVERFLOW, // arg1 = deopt_target_ip
    DEOPT,          // arg1 = deopt_target_ip
    GET_INDEX,
    SET_INDEX,
    TERNARY_MIN,
    TERNARY_MAX,
    RET,
    HALT
};

struct LIRInstruction {
    LIROpcode op{LIROpcode::NOP};
    int64_t imm{0};
    uint32_t arg1{0};
    uint32_t arg2{0};
    uint32_t arg3{0};
    uint32_t source_bytecode_offset{0};
};

class LIRProgram {
public:
    void add_instruction(const LIRInstruction& inst) {
        instructions_.push_back(inst);
    }

    const std::vector<LIRInstruction>& instructions() const {
        return instructions_;
    }

    std::string dump() const;

private:
    std::vector<LIRInstruction> instructions_;
};

} // namespace setun
