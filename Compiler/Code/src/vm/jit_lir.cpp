#include "vm/jit_lir.hpp"
#include <sstream>

namespace setun {

std::string LIRProgram::dump() const {
    std::ostringstream oss;
    oss << "=== LIR Program (" << instructions_.size() << " instructions) ===\n";
    for (size_t i = 0; i < instructions_.size(); ++i) {
        const auto& inst = instructions_[i];
        oss << "[" << i << "] ";
        switch (inst.op) {
            case LIROpcode::NOP: oss << "NOP"; break;
            case LIROpcode::PUSH_INT: oss << "PUSH_INT " << inst.imm; break;
            case LIROpcode::LOAD_LOCAL: oss << "LOAD_LOCAL slot=" << inst.arg1; break;
            case LIROpcode::STORE_LOCAL: oss << "STORE_LOCAL slot=" << inst.arg1; break;
            case LIROpcode::POP: oss << "POP"; break;
            case LIROpcode::DUP: oss << "DUP"; break;
            case LIROpcode::ADD: oss << "ADD"; break;
            case LIROpcode::SUB: oss << "SUB"; break;
            case LIROpcode::MUL: oss << "MUL"; break;
            case LIROpcode::DIV: oss << "DIV"; break;
            case LIROpcode::MOD: oss << "MOD"; break;
            case LIROpcode::NEG: oss << "NEG"; break;
            case LIROpcode::EQ: oss << "EQ"; break;
            case LIROpcode::NEQ: oss << "NEQ"; break;
            case LIROpcode::LT: oss << "LT"; break;
            case LIROpcode::LE: oss << "LE"; break;
            case LIROpcode::GT: oss << "GT"; break;
            case LIROpcode::GE: oss << "GE"; break;
            case LIROpcode::JUMP: oss << "JUMP target=" << inst.arg1; break;
            case LIROpcode::JUMP_IF_FALSE: oss << "JUMP_IF_FALSE target=" << inst.arg1; break;
            case LIROpcode::BRANCH_3: oss << "BRANCH_3 neg=" << inst.arg1 << " zero=" << inst.arg2 << " pos=" << inst.arg3; break;
            case LIROpcode::SAFEPOINT: oss << "SAFEPOINT id=" << inst.arg1; break;
            case LIROpcode::RET: oss << "RET"; break;
            case LIROpcode::HALT: oss << "HALT"; break;
        }
        oss << " (bc=" << inst.source_bytecode_offset << ")\n";
    }
    return oss.str();
}

} // namespace setun
