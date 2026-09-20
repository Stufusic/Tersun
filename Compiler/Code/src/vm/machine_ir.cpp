#include "vm/machine_ir.hpp"
#include "compiler/emitter.hpp"
#include "vm/opcode.hpp"
#include <iomanip>
#include <set>
#include <map>
#include <cassert>

namespace setun {

std::unique_ptr<MIRFunction> MIRFunction::build_from_bytecode(const Chunk& chunk, uint32_t func_id, size_t start_ip, size_t end_ip) {
    auto func = std::make_unique<MIRFunction>();
    func->function_id = func_id;
    func->num_locals = 64;
    func->next_vreg = 64;

    if (chunk.code.empty()) {
        func->create_block("entry");
        return func;
    }

    if (start_ip == 0 && func_id > 0) {
        start_ip = func_id;
    }
    if (end_ip == 0 || end_ip > chunk.code.size()) {
        end_ip = chunk.code.size();
        for (size_t fe : chunk.function_table) {
            if (fe > start_ip && fe < end_ip) {
                end_ip = fe;
            }
        }
    }

    // Pass 1: Identify Basic Block leader boundaries
    std::set<size_t> leaders;
    leaders.insert(start_ip);

    size_t max_locals = 64;
    size_t ip = start_ip;
    size_t max_target = start_ip;
    while (ip < end_ip && ip < chunk.code.size()) {
        OpCode op = static_cast<OpCode>(chunk.code[ip]);
        size_t cur_ip = ip;
        ip++;

        switch (op) {
            case OpCode::OP_PUSH_INT: ip += 8; break;
            case OpCode::OP_PUSH_TRYTE: ip += 2; break;
            case OpCode::OP_PUSH_FLOAT: ip += 8; break;
            case OpCode::OP_PUSH_STRING: ip += 2; break;
            case OpCode::OP_PUSH_BOOL: ip += 1; break;
            case OpCode::OP_LOAD_LOCAL:
            case OpCode::OP_STORE_LOCAL: {
                uint16_t slot = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                if (slot + 1 > max_locals) max_locals = slot + 1;
                ip += 2;
                break;
            }
            case OpCode::OP_LOAD_GLOBAL:
            case OpCode::OP_STORE_GLOBAL: ip += 2; break;
            case OpCode::OP_JUMP:
            case OpCode::OP_JUMP_IF_FALSE: {
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target = ip + offset;
                leaders.insert(target);
                if (target > max_target) max_target = target;
                if (ip < chunk.code.size()) leaders.insert(ip);
                break;
            }
            case OpCode::OP_LOOP_RANGE_FAST: {
                ip += 6;
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target = ip + offset;
                leaders.insert(target);
                if (target > max_target) max_target = target;
                if (ip < chunk.code.size()) leaders.insert(ip);
                break;
            }
            case OpCode::OP_GET_FIELD:
            case OpCode::OP_SET_FIELD: ip += 2; break;
            case OpCode::OP_NEW_INSTANCE: ip += 3; break;
            case OpCode::OP_CALL:
            case OpCode::OP_CALL_FAST_0:
            case OpCode::OP_CALL_FAST_1:
            case OpCode::OP_INVOKE_METHOD:
            case OpCode::OP_INVOKE_METHOD_IC: ip += 3; break;
            case OpCode::OP_NEW_ARRAY: ip += 2; break;
            case OpCode::OP_BRANCH_3: ip += 6; break;
            case OpCode::OP_TRY: ip += 2; break;
            case OpCode::OP_RET:
            case OpCode::OP_RET_FAST: {
                if (ip < chunk.code.size()) leaders.insert(ip);
                if (start_ip > 0 && ip > max_target && end_ip == chunk.code.size()) {
                    end_ip = ip;
                }
                break;
            }
            default: break;
        }
    }

    func->num_locals = static_cast<uint32_t>(max_locals);
    func->next_vreg = func->num_locals;

    // Map byte offset to MIRBlock*
    std::map<size_t, MIRBlock*> offset_to_block;
    for (size_t l : leaders) {
        if (l >= end_ip) continue;
        MIRBlock* blk = func->create_block("B_" + std::to_string(l));
        offset_to_block[l] = blk;
    }

    // Simulated evaluation stack
    std::vector<vreg_t> eval_stack;

    ip = start_ip;
    MIRBlock* cur_block = offset_to_block[start_ip];

    auto pop_val = [&]() -> vreg_t {
        if (eval_stack.empty()) {
            return func->new_vreg();
        }
        vreg_t v = eval_stack.back();
        eval_stack.pop_back();
        return v;
    };

    while (ip < end_ip && ip < chunk.code.size()) {
        if (offset_to_block.count(ip) && offset_to_block[ip] != cur_block) {
            MIRBlock* next_blk = offset_to_block[ip];
            // Link fallthrough if current block doesn't terminate with jump/ret
            if (!cur_block->instructions.empty()) {
                MIROpcode last_op = cur_block->instructions.back().opcode;
                if (last_op != MIROpcode::JMP && last_op != MIROpcode::RET) {
                    MIRInstruction jmp;
                    jmp.opcode = MIROpcode::JMP;
                    jmp.target_block = next_blk->id;
                    cur_block->instructions.push_back(jmp);
                    cur_block->successors.push_back(next_blk->id);
                    next_blk->predecessors.push_back(cur_block->id);
                } else {
                    eval_stack.clear();
                }
            }
            cur_block = next_blk;
        }

        size_t cur_ip = ip;
        OpCode op = static_cast<OpCode>(chunk.code[ip++]);

        switch (op) {
            case OpCode::OP_PUSH_INT: {
                int64_t val = 0;
                for (int i = 0; i < 8; ++i) val |= (static_cast<uint64_t>(chunk.code[ip++]) << (i * 8));
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CONST_INT;
                inst.dest = d;
                inst.imm64 = val;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_PUSH_FLOAT: {
                uint64_t raw = 0;
                for (int i = 0; i < 8; ++i) raw |= (static_cast<uint64_t>(chunk.code[ip++]) << (i * 8));
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CONST_FLOAT;
                inst.dest = d;
                inst.imm64 = static_cast<int64_t>(raw);
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_LOAD_LOCAL: {
                uint16_t slot = chunk.code[ip] | (chunk.code[ip + 1] << 8);
                ip += 2;
                vreg_t val = (slot < func->num_locals) ? static_cast<vreg_t>(slot) : func->new_vreg();
                eval_stack.push_back(val);
                break;
            }
            case OpCode::OP_STORE_LOCAL: {
                uint16_t slot = chunk.code[ip] | (chunk.code[ip + 1] << 8);
                ip += 2;
                vreg_t val = eval_stack.empty() ? func->new_vreg() : eval_stack.back();
                if (slot < func->num_locals) {
                    vreg_t slot_vreg = static_cast<vreg_t>(slot);
                    MIRInstruction mov;
                    mov.opcode = MIROpcode::MOV;
                    mov.dest = slot_vreg;
                    mov.src1 = val;
                    mov.bytecode_ip = static_cast<uint32_t>(cur_ip);
                    cur_block->instructions.push_back(mov);
                }
                break;
            }
            case OpCode::OP_ADD: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_ADD;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_SUB: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_MUL: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_MUL;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_BIT_AND: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::BIT_AND;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_EQ: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::EQ;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_NEQ: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::NE;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_LT: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::LT;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_LE: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::LE;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_GT: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB; // compare via diff
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::GT;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_GE: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_SUB;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.cond = MIRCondition::GE;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_DIV: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_DIV;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_MOD: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INT_MOD;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_POP: {
                pop_val();
                break;
            }
            case OpCode::OP_DUP: {
                if (!eval_stack.empty()) {
                    eval_stack.push_back(eval_stack.back());
                }
                break;
            }
            case OpCode::OP_GET_INDEX: {
                vreg_t idx = pop_val();
                vreg_t target = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::LOAD_ELEMENT;
                inst.dest = d;
                inst.src1 = target;
                inst.src2 = idx;
                inst.effect = MemoryEffect::Read;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_SET_INDEX: {
                vreg_t val = pop_val();
                vreg_t idx = pop_val();
                vreg_t target = pop_val();
                MIRInstruction inst;
                inst.opcode = MIROpcode::STORE_ELEMENT;
                inst.src1 = target;
                inst.src2 = idx;
                inst.src3 = val;
                inst.effect = MemoryEffect::Write;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                break;
            }
            case OpCode::OP_TERNARY_MIN: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::TERNARY_MIN;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_TERNARY_MAX: {
                vreg_t b = pop_val();
                vreg_t a = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::TERNARY_MAX;
                inst.dest = d;
                inst.src1 = a;
                inst.src2 = b;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_JUMP: {
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target_ip = ip + offset;
                if (offset_to_block.count(target_ip)) {
                    MIRBlock* tgt = offset_to_block[target_ip];
                    if (target_ip <= cur_ip) {
                        tgt->is_loop_header = true;
                    }
                    MIRInstruction inst;
                    inst.opcode = MIROpcode::JMP;
                    inst.target_block = tgt->id;
                    inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                    cur_block->instructions.push_back(inst);
                    cur_block->successors.push_back(tgt->id);
                    tgt->predecessors.push_back(cur_block->id);
                }
                break;
            }
            case OpCode::OP_JUMP_IF_FALSE: {
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target_ip = ip + offset;
                vreg_t cond_vreg = pop_val();
                if (offset_to_block.count(target_ip)) {
                    MIRBlock* tgt = offset_to_block[target_ip];
                    if (target_ip <= cur_ip) {
                        tgt->is_loop_header = true;
                    }
                    MIRInstruction inst;
                    inst.opcode = MIROpcode::JCC;
                    inst.src1 = cond_vreg;
                    inst.cond = MIRCondition::LE; // jump if false/zero
                    inst.target_block = tgt->id;
                    inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                    cur_block->instructions.push_back(inst);
                    cur_block->successors.push_back(tgt->id);
                    tgt->predecessors.push_back(cur_block->id);
                }
                break;
            }
            case OpCode::OP_CALL: {
                uint16_t fn_idx = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                uint8_t argc = chunk.code[ip++];
                std::vector<vreg_t> args(argc);
                for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
                    args[i] = pop_val();
                }
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CALL_DIRECT;
                inst.dest = d;
                if (argc > 0) inst.src1 = args[0];
                if (argc > 1) inst.src2 = args[1];
                if (argc > 2) inst.src3 = args[2];
                inst.extra_args = args;
                inst.imm64 = fn_idx;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_CALL_FAST_0:
            case OpCode::OP_CALL_FAST_1: {
                uint16_t fn_entry = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                uint8_t frame_sz = chunk.code[ip++];
                (void)frame_sz;
                uint8_t argc = (op == OpCode::OP_CALL_FAST_0) ? 0 : 1;
                std::vector<vreg_t> args(argc);
                for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
                    args[i] = pop_val();
                }
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CALL_DIRECT;
                inst.dest = d;
                if (argc > 0) inst.src1 = args[0];
                inst.extra_args = args;
                inst.imm64 = fn_entry;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_RET_FAST: {
                vreg_t val = pop_val();
                MIRInstruction inst;
                inst.opcode = MIROpcode::RET;
                inst.src1 = val;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                break;
            }
            case OpCode::OP_PUSH_STRING: {
                uint16_t sid = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CONST_INT;
                inst.dest = d;
                if (sid < chunk.string_table.size()) {
                    inst.imm64 = static_cast<int64_t>(VMValue(chunk.string_table[sid]).raw_);
                } else {
                    inst.imm64 = sid;
                }
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_TIME_NOW_US: {
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CALL_RUNTIME;
                inst.dest = d;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_PRINT:
            case OpCode::OP_PRINTLN: {
                vreg_t val = pop_val();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CALL_RUNTIME;
                inst.src1 = val;
                inst.imm64 = (op == OpCode::OP_PRINTLN) ? 1 : 0;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(func->new_vreg());
                break;
            }
            case OpCode::OP_NEW_INSTANCE: {
                uint16_t tid = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                uint8_t field_count = chunk.code[ip++];
                for (int i = static_cast<int>(field_count) - 1; i >= 0; --i) {
                    pop_val();
                }
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::ALLOC_OBJECT;
                inst.dest = d;
                inst.imm64 = (static_cast<uint64_t>(tid) << 32) | static_cast<uint64_t>(field_count);
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_NEW_ARRAY: {
                uint16_t count = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                for (int i = 0; i < count; ++i) {
                    pop_val();
                }
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::CALL_RUNTIME;
                inst.dest = d;
                inst.imm64 = 0xAA02; // special tag for setun_jit_helper_new_array
                inst.src1 = static_cast<vreg_t>(count);
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_GET_FIELD: {
                uint16_t fid = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                vreg_t obj = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::LOAD_FIELD;
                inst.dest = d;
                inst.src1 = obj;
                inst.imm64 = fid;
                inst.effect = MemoryEffect::Read;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_SET_FIELD: {
                uint16_t fid = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                vreg_t val = pop_val();
                vreg_t obj = pop_val();
                MIRInstruction inst;
                inst.opcode = MIROpcode::STORE_FIELD;
                inst.src1 = obj;
                inst.src2 = val;
                inst.imm64 = fid;
                inst.effect = MemoryEffect::Write;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                break;
            }
            case OpCode::OP_INVOKE_METHOD: {
                uint16_t mid = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                uint8_t argc = chunk.code[ip++];
                std::vector<vreg_t> args(argc);
                for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
                    args[i] = pop_val();
                }
                vreg_t receiver = pop_val();
                vreg_t d = func->new_vreg();
                MIRInstruction inst;
                inst.opcode = MIROpcode::INVOKE_VIRTUAL;
                inst.dest = d;
                inst.src1 = receiver;
                if (argc > 0) inst.src2 = args[0];
                if (argc > 1) inst.src3 = args[1];
                inst.extra_args = args;
                inst.imm64 = mid;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                eval_stack.push_back(d);
                break;
            }
            case OpCode::OP_RET: {
                vreg_t ret_v = eval_stack.empty() ? NO_VREG : pop_val();
                MIRInstruction inst;
                inst.opcode = MIROpcode::RET;
                inst.src1 = ret_v;
                inst.bytecode_ip = static_cast<uint32_t>(cur_ip);
                cur_block->instructions.push_back(inst);
                break;
            }
            default: break;
        }
    }

    return func;
}

void MIRFunction::dump(std::ostream& os) const {
    os << "MIRFunction #" << function_id << " (vregs: " << next_vreg << "):\n";
    for (const auto& blk : blocks) {
        os << "  " << blk->name;
        if (blk->is_loop_header) os << " [LOOP_HEADER]";
        if (blk->is_loop_preheader) os << " [PREHEADER]";
        os << ":\n";

        for (const auto& inst : blk->instructions) {
            os << "    ";
            if (inst.dest != NO_VREG) {
                os << "v" << inst.dest << " = ";
            }
            switch (inst.opcode) {
                case MIROpcode::CONST_INT: os << "CONST_INT " << inst.imm64; break;
                case MIROpcode::CONST_FLOAT: os << "CONST_FLOAT " << inst.imm64; break;
                case MIROpcode::MOV: os << "MOV v" << inst.src1; break;
                case MIROpcode::INT_ADD: os << "INT_ADD v" << inst.src1 << ", v" << inst.src2; break;
                case MIROpcode::INT_SUB: os << "INT_SUB v" << inst.src1 << ", v" << inst.src2; break;
                case MIROpcode::INT_MUL: os << "INT_MUL v" << inst.src1 << ", v" << inst.src2; break;
                case MIROpcode::BIT_AND: os << "BIT_AND v" << inst.src1 << ", v" << inst.src2; break;
                case MIROpcode::GUARD_TYPE:
                    os << "GUARD_TYPE v" << inst.guard.input_vreg << ", expected=" << std::hex
                       << inst.guard.expected_tag_or_shape << std::dec << " (deopt_id=" << inst.guard.deopt_id << ")";
                    break;
                case MIROpcode::GUARD_SHAPE:
                    os << "GUARD_SHAPE v" << inst.guard.input_vreg << ", shape=" << inst.guard.expected_tag_or_shape
                       << " (deopt_id=" << inst.guard.deopt_id << ")";
                    break;
                case MIROpcode::GUARD_VTABLE:
                    os << "GUARD_VTABLE v" << inst.guard.input_vreg << ", vtable=" << std::hex
                       << inst.guard.expected_tag_or_shape << std::dec << " (deopt_id=" << inst.guard.deopt_id << ")";
                    break;
                case MIROpcode::CALL_DIRECT:
                    os << "CALL_DIRECT fn=" << inst.imm64 << " (args: v" << inst.src1 << ", v" << inst.src2 << ")";
                    break;
                case MIROpcode::INVOKE_VIRTUAL:
                    os << "INVOKE_VIRTUAL method_id=" << inst.imm64 << " receiver=v" << inst.src1;
                    break;
                case MIROpcode::ALLOC_OBJECT:
                    os << "ALLOC_OBJECT type=" << (inst.imm64 >> 32) << " fields=" << (inst.imm64 & 0xFF);
                    break;
                case MIROpcode::LOAD_FIELD:
                    os << "LOAD_FIELD [v" << inst.src1 << " + " << inst.imm64 << "]";
                    break;
                case MIROpcode::STORE_FIELD:
                    os << "STORE_FIELD [v" << inst.src1 << " + " << inst.imm64 << "] = v" << inst.src2;
                    break;
                case MIROpcode::LOAD_ELEMENT:
                    os << "LOAD_ELEMENT v" << inst.src1 << "[v" << inst.src2 << "]";
                    break;
                case MIROpcode::STORE_ELEMENT:
                    os << "STORE_ELEMENT v" << inst.src1 << "[v" << inst.src2 << "] = v" << inst.src3;
                    break;
                case MIROpcode::VEC_BROADCAST:
                    os << "VEC_BROADCAST v" << inst.src1;
                    break;
                case MIROpcode::VEC_LOAD:
                    os << "VEC_LOAD v" << inst.src1 << "[v" << inst.src2 << "]";
                    break;
                case MIROpcode::VEC_STORE:
                    os << "VEC_STORE v" << inst.src1 << "[v" << inst.src2 << "] = v" << inst.src3;
                    break;
                case MIROpcode::VEC_ADD:
                    os << "VEC_ADD v" << inst.src1 << ", v" << inst.src2;
                    break;
                case MIROpcode::VEC_MUL:
                    os << "VEC_MUL v" << inst.src1 << ", v" << inst.src2;
                    break;
                case MIROpcode::VEC_FMA:
                    os << "VEC_FMA v" << inst.src1 << ", v" << inst.src2 << ", v" << inst.src3;
                    break;
                case MIROpcode::VEC_ZEROALL:
                    os << "VEC_ZEROALL";
                    break;
                case MIROpcode::INT_MOD:
                    os << "INT_MOD v" << inst.src1 << ", v" << inst.src2;
                    break;
                case MIROpcode::TERNARY_MIN:
                    os << "TERNARY_MIN v" << inst.src1 << ", v" << inst.src2;
                    break;
                case MIROpcode::TERNARY_MAX:
                    os << "TERNARY_MAX v" << inst.src1 << ", v" << inst.src2;
                    break;
                case MIROpcode::NOP: os << "NOP"; break;
                case MIROpcode::CALL_RUNTIME:
                    os << "CALL_RUNTIME src1=v" << inst.src1 << " imm64=" << inst.imm64;
                    break;
                case MIROpcode::LOAD_ELEMENT_RAW:
                    os << "LOAD_ELEMENT_RAW v" << inst.src1 << "[v" << inst.src2 << "]";
                    break;
                case MIROpcode::STORE_ELEMENT_RAW:
                    os << "STORE_ELEMENT_RAW v" << inst.src1 << "[v" << inst.src2 << "] = v" << inst.src3;
                    break;
                case MIROpcode::JMP: os << "JMP B" << inst.target_block; break;
                case MIROpcode::JCC: os << "JCC v" << inst.src1 << " -> B" << inst.target_block; break;
                case MIROpcode::SAFEPOINT: os << "SAFEPOINT"; break;
                case MIROpcode::RET:
                    os << "RET";
                    if (inst.src1 != NO_VREG) os << " v" << inst.src1;
                    break;
                default: os << "OP #" << static_cast<uint16_t>(inst.opcode); break;
            }
            os << "\n";
        }
    }
}

} // namespace setun
