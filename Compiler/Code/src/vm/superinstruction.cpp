#include "vm/superinstruction.hpp"
#include <cstring>

namespace setun {

std::unordered_set<size_t> SuperInstructionRegistry::collect_jump_targets(const Chunk& chunk) {
    std::unordered_set<size_t> targets;

    // 1. Function entries
    for (uint32_t fn_pc : chunk.function_table) {
        targets.insert(static_cast<size_t>(fn_pc));
    }

    // 2. VTable method entries
    for (const auto& [cname, method_map] : chunk.vtables) {
        for (const auto& [mname, moffset] : method_map) {
            targets.insert(static_cast<size_t>(moffset));
        }
    }

    // 3. Scan bytecode instructions for relative jumps
    size_t ip = 0;
    while (ip < chunk.code.size()) {
        uint8_t op_byte = chunk.code[ip];
        OpCode op = static_cast<OpCode>(op_byte);
        size_t inst_len = 1;

        switch (op) {
            case OpCode::OP_PUSH_INT:
            case OpCode::OP_PUSH_FLOAT:
                inst_len = 9;
                break;
            case OpCode::OP_PUSH_TRYTE:
            case OpCode::OP_PUSH_STRING:
            case OpCode::OP_LOAD_LOCAL:
            case OpCode::OP_STORE_LOCAL:
            case OpCode::OP_LOAD_GLOBAL:
            case OpCode::OP_STORE_GLOBAL:
            case OpCode::OP_GET_FIELD:
            case OpCode::OP_SET_FIELD:
            case OpCode::OP_NEW_ARRAY:
                inst_len = 3;
                break;
            case OpCode::OP_JUMP:
            case OpCode::OP_JUMP_IF_FALSE:
            case OpCode::OP_TRY: {
                if (ip + 2 < chunk.code.size()) {
                    int16_t off = static_cast<int16_t>(chunk.code[ip + 1] | (chunk.code[ip + 2] << 8));
                    size_t target = ip + 3 + off;
                    targets.insert(target);
                }
                inst_len = 3;
                break;
            }
            case OpCode::OP_BRANCH_3: {
                if (ip + 6 < chunk.code.size()) {
                    for (int arm = 0; arm < 3; ++arm) {
                        int16_t off = static_cast<int16_t>(chunk.code[ip + 1 + arm * 2] | (chunk.code[ip + 2 + arm * 2] << 8));
                        size_t rel_base = (arm == 0) ? (ip + 3) : ((arm == 1) ? (ip + 5) : (ip + 7));
                        targets.insert(rel_base + off);
                    }
                }
                inst_len = 7;
                break;
            }
            case OpCode::OP_NEW_INSTANCE:
            case OpCode::OP_INVOKE_METHOD:
            case OpCode::OP_CALL:
            case OpCode::OP_CLOSURE:
                inst_len = 4;
                break;
            case OpCode::OP_PUSH_BOOL:
            case OpCode::OP_CALL_INDIRECT:
                inst_len = 2;
                break;
            case OpCode::OP_PUSH_TAFPU:
                inst_len = 21;
                break;
            default:
                inst_len = 1;
                break;
        }

        ip += inst_len;
    }

    return targets;
}

bool SuperInstructionRegistry::can_fuse_range(const Chunk& chunk,
                                              size_t start_pc,
                                              size_t end_pc,
                                              const std::unordered_set<size_t>& jump_targets) {
    if (end_pc > chunk.code.size() || start_pc >= end_pc) {
        return false;
    }

    // Inspect all instructions beginning strictly after start_pc up to end_pc
    size_t ip = start_pc;
    bool is_first = true;

    while (ip < end_pc) {
        if (!is_first) {
            // Rule 1: No control flow can branch into an intermediate instruction
            if (jump_targets.find(ip) != jump_targets.end()) {
                return false;
            }

            // Rule 2: No intermediate instruction can be a semantic barrier
            OpCode op = static_cast<OpCode>(chunk.code[ip]);
            if (SemanticBarrier::is_barrier(op)) {
                return false;
            }
        }
        is_first = false;

        // Advance to next instruction
        uint8_t op_byte = chunk.code[ip];
        OpCode op = static_cast<OpCode>(op_byte);
        size_t inst_len = 1;

        switch (op) {
            case OpCode::OP_PUSH_INT:
            case OpCode::OP_PUSH_FLOAT:
                inst_len = 9;
                break;
            case OpCode::OP_PUSH_TRYTE:
            case OpCode::OP_PUSH_STRING:
            case OpCode::OP_LOAD_LOCAL:
            case OpCode::OP_STORE_LOCAL:
            case OpCode::OP_LOAD_GLOBAL:
            case OpCode::OP_STORE_GLOBAL:
            case OpCode::OP_GET_FIELD:
            case OpCode::OP_SET_FIELD:
            case OpCode::OP_NEW_ARRAY:
            case OpCode::OP_JUMP:
            case OpCode::OP_JUMP_IF_FALSE:
            case OpCode::OP_TRY:
                inst_len = 3;
                break;
            case OpCode::OP_NEW_INSTANCE:
            case OpCode::OP_INVOKE_METHOD:
            case OpCode::OP_CALL:
            case OpCode::OP_CLOSURE:
                inst_len = 4;
                break;
            case OpCode::OP_PUSH_BOOL:
            case OpCode::OP_CALL_INDIRECT:
                inst_len = 2;
                break;
            case OpCode::OP_BRANCH_3:
                inst_len = 7;
                break;
            case OpCode::OP_PUSH_TAFPU:
                inst_len = 21;
                break;
            default:
                inst_len = 1;
                break;
        }

        ip += inst_len;
    }

    return (ip == end_pc);
}

} // namespace setun
