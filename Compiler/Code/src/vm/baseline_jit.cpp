#include "vm/baseline_jit.hpp"
#include "vm/jit_runtime_helpers.hpp"
#include <cstring>
#include <iostream>

namespace setun {

bool BaselineJITCompiler::lower_to_lir(const Chunk& chunk, size_t start_ip, size_t end_ip, LIRProgram& out_lir) {
    size_t ip = start_ip;
    if (end_ip > chunk.code.size()) end_ip = chunk.code.size();

    // If chunk begins with OP_JUMP over functions, advance
    if (ip == 0 && chunk.code.size() >= 3 && static_cast<OpCode>(chunk.code[0]) == OpCode::OP_JUMP) {
        int16_t off = static_cast<int16_t>(chunk.code[1] | (chunk.code[2] << 8));
        if (off > 0) {
            ip = 3 + off;
        }
    }

    while (ip < end_ip) {
        size_t cur_ip = ip;
        uint8_t opcode = chunk.code[ip++];
        OpCode op = static_cast<OpCode>(opcode);
        LIRInstruction inst;
        inst.source_bytecode_offset = static_cast<uint32_t>(cur_ip);

        switch (op) {
            case OpCode::OP_NOP: {
                inst.op = LIROpcode::NOP;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_PUSH_INT: {
                if (ip + 8 > chunk.code.size()) return false;
                int64_t val = 0;
                std::memcpy(&val, &chunk.code[ip], 8);
                ip += 8;
                inst.op = LIROpcode::PUSH_INT;
                inst.imm = val;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_LOAD_LOCAL: {
                if (ip + 2 > chunk.code.size()) return false;
                uint16_t slot = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                inst.op = LIROpcode::LOAD_LOCAL;
                inst.arg1 = slot;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_STORE_LOCAL: {
                if (ip + 2 > chunk.code.size()) return false;
                uint16_t slot = static_cast<uint16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                inst.op = LIROpcode::STORE_LOCAL;
                inst.arg1 = slot;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_POP: {
                inst.op = LIROpcode::POP;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_DUP: {
                inst.op = LIROpcode::DUP;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_ADD: {
                inst.op = LIROpcode::ADD;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_SUB: {
                inst.op = LIROpcode::SUB;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_MUL: {
                inst.op = LIROpcode::MUL;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_DIV: {
                inst.op = LIROpcode::DIV;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_MOD: {
                inst.op = LIROpcode::MOD;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_BIT_AND: {
                inst.op = LIROpcode::BIT_AND;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_BIT_OR: {
                inst.op = LIROpcode::BIT_OR;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_BIT_XOR: {
                inst.op = LIROpcode::BIT_XOR;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_NEG: {
                inst.op = LIROpcode::NEG;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_EQ: {
                inst.op = LIROpcode::EQ;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_NEQ: {
                inst.op = LIROpcode::NEQ;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_LT: {
                inst.op = LIROpcode::LT;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_LE: {
                inst.op = LIROpcode::LE;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_GT: {
                inst.op = LIROpcode::GT;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_GE: {
                inst.op = LIROpcode::GE;
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_JUMP: {
                if (ip + 2 > chunk.code.size()) return false;
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target = ip + offset;
                if (offset < 0) {
                    LIRInstruction sp_inst;
                    sp_inst.op = LIROpcode::SAFEPOINT;
                    sp_inst.arg1 = static_cast<uint32_t>(cur_ip);
                    sp_inst.source_bytecode_offset = static_cast<uint32_t>(cur_ip);
                    out_lir.add_instruction(sp_inst);
                }
                inst.op = LIROpcode::JUMP;
                inst.arg1 = static_cast<uint32_t>(target);
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_JUMP_IF_FALSE: {
                if (ip + 2 > chunk.code.size()) return false;
                int16_t offset = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                ip += 2;
                size_t target = ip + offset;
                inst.op = LIROpcode::JUMP_IF_FALSE;
                inst.arg1 = static_cast<uint32_t>(target);
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_BRANCH_3: {
                if (ip + 6 > chunk.code.size()) return false;
                int16_t neg_off = static_cast<int16_t>(chunk.code[ip] | (chunk.code[ip + 1] << 8));
                int16_t zero_off = static_cast<int16_t>(chunk.code[ip + 2] | (chunk.code[ip + 3] << 8));
                int16_t pos_off = static_cast<int16_t>(chunk.code[ip + 4] | (chunk.code[ip + 5] << 8));
                ip += 6;
                inst.op = LIROpcode::BRANCH_3;
                inst.arg1 = static_cast<uint32_t>(ip + neg_off);
                inst.arg2 = static_cast<uint32_t>(ip + zero_off);
                inst.arg3 = static_cast<uint32_t>(ip + pos_off);
                out_lir.add_instruction(inst);
                break;
            }
            case OpCode::OP_RET:
            case OpCode::OP_HALT: {
                inst.op = LIROpcode::RET;
                out_lir.add_instruction(inst);
                return true;
            }
            default: {
                // Unsupported opcode in baseline JIT: fallback to interpreter
                return false;
            }
        }
    }
    return true;
}

bool BaselineJITCompiler::compile_lir(const LIRProgram& lir, JITCodeBuffer& out_buffer, JITSafepointTable& out_safepoints,
                                     OSREntryTable& out_osr_table, DeoptTable& out_deopt_table) {
    asm_.clear();
    out_safepoints.clear();
    out_osr_table.clear();
    out_deopt_table.clear();

    // Map bytecode offsets to labels
    std::unordered_map<uint32_t, X64Label> labels;
    std::vector<uint32_t> loop_headers;

    // First pass: identify all branch target bytecode offsets and loop headers
    for (const auto& inst : lir.instructions()) {
        if (inst.op == LIROpcode::JUMP || inst.op == LIROpcode::JUMP_IF_FALSE) {
            labels[inst.arg1] = X64Label{};
            if (inst.arg1 <= inst.source_bytecode_offset) {
                loop_headers.push_back(inst.arg1);
            }
        } else if (inst.op == LIROpcode::BRANCH_3) {
            labels[inst.arg1] = X64Label{};
            labels[inst.arg2] = X64Label{};
            labels[inst.arg3] = X64Label{};
            if (inst.arg1 <= inst.source_bytecode_offset) loop_headers.push_back(inst.arg1);
            if (inst.arg2 <= inst.source_bytecode_offset) loop_headers.push_back(inst.arg2);
            if (inst.arg3 <= inst.source_bytecode_offset) loop_headers.push_back(inst.arg3);
        }
    }

    // Windows x64 Standard ABI Function Prologue at native offset 0:
    asm_.push_reg(X64Reg::RBP);
    asm_.push_reg(X64Reg::RBX);
    asm_.push_reg(X64Reg::RDI);
    asm_.push_reg(X64Reg::RSI);
    asm_.push_reg(X64Reg::R12);
    asm_.push_reg(X64Reg::R13);
    asm_.push_reg(X64Reg::R14);
    asm_.push_reg(X64Reg::R15);

    asm_.mov_reg_reg(X64Reg::RBP, X64Reg::RSP);
    asm_.sub_reg_imm32(X64Reg::RSP, 520);

    // Save parameters:
    // RCX = VM*
    // RDX = JITFrame*
    asm_.mov_reg_reg(X64Reg::R15, X64Reg::RCX); // R15 = VM*
    asm_.mov_reg_reg(X64Reg::R14, X64Reg::RDX); // R14 = JITFrame*

    X64Label body_entry_label;
    asm_.jmp(body_entry_label); // jump over OSR trampolines to function body

    // Emit OSR Entry Trampolines for every detected loop header
    for (uint32_t lh : loop_headers) {
        uint32_t osr_offset = static_cast<uint32_t>(asm_.current_offset());
        OSREntryRecord rec;
        rec.loop_header_bytecode_ip = lh;
        rec.osr_native_entry_offset = osr_offset;
        rec.num_live_locals = 0;
        for (uint32_t s = 0; s < 16; ++s) {
            rec.live_values.push_back({s, Location::make_stack(static_cast<int32_t>(s * 8))});
        }
        out_osr_table.add_entry(rec);

        // OSR Prologue:
        asm_.push_reg(X64Reg::RBP);
        asm_.push_reg(X64Reg::RBX);
        asm_.push_reg(X64Reg::RDI);
        asm_.push_reg(X64Reg::RSI);
        asm_.push_reg(X64Reg::R12);
        asm_.push_reg(X64Reg::R13);
        asm_.push_reg(X64Reg::R14);
        asm_.push_reg(X64Reg::R15);

        asm_.mov_reg_reg(X64Reg::RBP, X64Reg::RSP);
        asm_.sub_reg_imm32(X64Reg::RSP, 520);

        asm_.mov_reg_reg(X64Reg::R15, X64Reg::RCX); // R15 = VM*
        asm_.mov_reg_reg(X64Reg::R14, X64Reg::RDX); // R14 = JITFrame*

        // Jump directly to the native code label for this loop header!
        X64Label& target_loop_label = labels[lh];
        asm_.jmp(target_loop_label);
    }

    asm_.bind(body_entry_label);

    // Second pass: code generation
    for (size_t i = 0; i < lir.instructions().size(); ++i) {
        const auto& inst = lir.instructions()[i];

        // Bind label at this bytecode offset if targeted
        auto it = labels.find(inst.source_bytecode_offset);
        if (it != labels.end() && !it->second.is_bound()) {
            asm_.bind(it->second);
        }

        switch (inst.op) {
            case LIROpcode::NOP:
                break;

            case LIROpcode::PUSH_INT: {
                int64_t val = inst.imm;
                uint64_t raw = VMValue::TAG_INT | (static_cast<uint64_t>(val) & VMValue::PAYLOAD_MASK);
                asm_.mov_reg_imm64(X64Reg::RAX, static_cast<int64_t>(raw));
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::LOAD_LOCAL: {
                uint32_t slot = inst.arg1;
                // locals pointer is at [r14 + offsetof(JITFrame, locals)]
                asm_.mov_reg_mem(X64Reg::R11, X64Reg::R14, static_cast<int32_t>(offsetof(JITFrame, locals)));
                asm_.mov_reg_mem(X64Reg::RAX, X64Reg::R11, static_cast<int32_t>(slot * 8));
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::STORE_LOCAL: {
                uint32_t slot = inst.arg1;
                asm_.pop_reg(X64Reg::RAX);
                asm_.mov_reg_mem(X64Reg::R11, X64Reg::R14, static_cast<int32_t>(offsetof(JITFrame, locals)));
                asm_.mov_mem_reg(X64Reg::R11, static_cast<int32_t>(slot * 8), X64Reg::RAX);
                break;
            }

            case LIROpcode::POP: {
                asm_.pop_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::DUP: {
                asm_.mov_reg_mem(X64Reg::RAX, X64Reg::RSP, 0);
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::ADD:
            case LIROpcode::SUB:
            case LIROpcode::MUL: {
                asm_.pop_reg(X64Reg::RCX); // b
                asm_.pop_reg(X64Reg::RAX); // a

                // Fast path: sign extend 48-bit ints for both operands
                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);
                asm_.shl_reg_imm8(X64Reg::RCX, 16);
                asm_.sar_reg_imm8(X64Reg::RCX, 16);

                if (inst.op == LIROpcode::ADD) {
                    asm_.add_reg_reg(X64Reg::RAX, X64Reg::RCX);
                } else if (inst.op == LIROpcode::SUB) {
                    asm_.sub_reg_reg(X64Reg::RAX, X64Reg::RCX);
                } else if (inst.op == LIROpcode::MUL) {
                    asm_.imul_reg_reg(X64Reg::RAX, X64Reg::RCX);
                }

                // Re-tag with TAG_INT:
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                asm_.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.or_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::DIV: {
                asm_.pop_reg(X64Reg::RCX); // b
                asm_.pop_reg(X64Reg::RAX); // a

                // Sign-extend 48-bit to 64-bit int:
                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);
                asm_.shl_reg_imm8(X64Reg::RCX, 16);
                asm_.sar_reg_imm8(X64Reg::RCX, 16);

                X64Label non_zero_label;
                asm_.test_reg_reg(X64Reg::RCX, X64Reg::RCX);
                asm_.jcc(X64Cond::NE, non_zero_label);

                // Zero division error helper call:
                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_div_zero_error));

                asm_.bind(non_zero_label);
                asm_.cqo();
                asm_.idiv_reg(X64Reg::RCX);

                // Re-tag
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                asm_.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.or_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::MOD: {
                asm_.pop_reg(X64Reg::RCX); // b
                asm_.pop_reg(X64Reg::RAX); // a

                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);
                asm_.shl_reg_imm8(X64Reg::RCX, 16);
                asm_.sar_reg_imm8(X64Reg::RCX, 16);

                X64Label non_zero_label;
                asm_.test_reg_reg(X64Reg::RCX, X64Reg::RCX);
                asm_.jcc(X64Cond::NE, non_zero_label);

                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_mod_zero_error));

                asm_.bind(non_zero_label);
                asm_.cqo();
                asm_.idiv_reg(X64Reg::RCX);

                // Remainder is in RDX
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                asm_.and_reg_reg(X64Reg::RDX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.or_reg_reg(X64Reg::RDX, X64Reg::R11);
                asm_.push_reg(X64Reg::RDX);
                break;
            }

            case LIROpcode::BIT_AND:
            case LIROpcode::BIT_OR:
            case LIROpcode::BIT_XOR: {
                asm_.pop_reg(X64Reg::RCX); // b
                asm_.pop_reg(X64Reg::RAX); // a
                if (inst.op == LIROpcode::BIT_AND) {
                    asm_.and_reg_reg(X64Reg::RAX, X64Reg::RCX);
                } else if (inst.op == LIROpcode::BIT_OR) {
                    asm_.or_reg_reg(X64Reg::RAX, X64Reg::RCX);
                } else if (inst.op == LIROpcode::BIT_XOR) {
                    asm_.xor_reg_reg(X64Reg::RAX, X64Reg::RCX);
                }
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                asm_.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.or_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::NEG: {
                asm_.pop_reg(X64Reg::RAX);
                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);
                // Negate
                asm_.mov_reg_imm64(X64Reg::R11, 0);
                asm_.sub_reg_reg(X64Reg::R11, X64Reg::RAX);
                asm_.mov_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                asm_.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.or_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::EQ:
            case LIROpcode::NEQ:
            case LIROpcode::LT:
            case LIROpcode::LE:
            case LIROpcode::GT:
            case LIROpcode::GE: {
                asm_.pop_reg(X64Reg::RCX); // b
                asm_.pop_reg(X64Reg::RAX); // a

                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);
                asm_.shl_reg_imm8(X64Reg::RCX, 16);
                asm_.sar_reg_imm8(X64Reg::RCX, 16);

                asm_.cmp_reg_reg(X64Reg::RAX, X64Reg::RCX);

                X64Label true_lbl;
                X64Label end_lbl;

                X64Cond cond = X64Cond::EQ;
                if (inst.op == LIROpcode::EQ) cond = X64Cond::EQ;
                else if (inst.op == LIROpcode::NEQ) cond = X64Cond::NE;
                else if (inst.op == LIROpcode::LT) cond = X64Cond::LT;
                else if (inst.op == LIROpcode::LE) cond = X64Cond::LE;
                else if (inst.op == LIROpcode::GT) cond = X64Cond::GT;
                else if (inst.op == LIROpcode::GE) cond = X64Cond::GE;

                asm_.jcc(cond, true_lbl);
                // False:
                asm_.mov_reg_imm64(X64Reg::RAX, static_cast<int64_t>(VMValue::TAG_BOOL));
                asm_.jmp(end_lbl);
                // True:
                asm_.bind(true_lbl);
                asm_.mov_reg_imm64(X64Reg::RAX, static_cast<int64_t>(VMValue::TAG_BOOL | 1ULL));
                asm_.bind(end_lbl);

                asm_.push_reg(X64Reg::RAX);
                break;
            }

            case LIROpcode::JUMP: {
                X64Label& target = labels[inst.arg1];
                asm_.jmp(target);
                break;
            }

            case LIROpcode::JUMP_IF_FALSE: {
                asm_.pop_reg(X64Reg::RAX);
                X64Label& target = labels[inst.arg1];

                // Check exact boolean false
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::TAG_BOOL));
                asm_.cmp_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.jcc(X64Cond::EQ, target);

                // Check integer 0
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.cmp_reg_reg(X64Reg::RAX, X64Reg::R11);
                asm_.jcc(X64Cond::EQ, target);
                break;
            }

            case LIROpcode::BRANCH_3: {
                asm_.pop_reg(X64Reg::RAX);
                // Sign extend 48-bit int to 64-bit int
                asm_.shl_reg_imm8(X64Reg::RAX, 16);
                asm_.sar_reg_imm8(X64Reg::RAX, 16);

                X64Label& zero_target = labels[inst.arg2];
                X64Label& neg_target = labels[inst.arg1];
                X64Label& pos_target = labels[inst.arg3];

                asm_.test_reg_reg(X64Reg::RAX, X64Reg::RAX);
                asm_.jcc(X64Cond::EQ, zero_target);
                asm_.jcc(X64Cond::LT, neg_target);
                asm_.jmp(pos_target);
                break;
            }

            case LIROpcode::SAFEPOINT: {
                uint32_t sp_id = inst.arg1;
                SafepointRecord rec;
                rec.id = sp_id;
                rec.native_offset = static_cast<uint32_t>(asm_.current_offset());
                rec.bytecode_offset = inst.source_bytecode_offset;
                out_safepoints.add_safepoint(rec);

                // Check VM GC poll flag: [r15 + 184]
                // For now, call safepoint poll helper when requested
                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.mov_reg_reg(X64Reg::RDX, X64Reg::R14); // JITFrame*
                asm_.mov_reg_imm64(X64Reg::R8, static_cast<int64_t>(sp_id));
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_safepoint_poll));
                break;
            }

            case LIROpcode::GUARD_TYPE: {
                uint32_t deopt_target_ip = inst.arg1;
                uint32_t deopt_id = deopt_target_ip;

                DeoptRecord rec;
                rec.deopt_id = deopt_id;
                rec.native_offset = static_cast<uint32_t>(asm_.current_offset());
                rec.target_bytecode_ip = deopt_target_ip;
                rec.reason = DeoptReason::TYPE_GUARD_FAILURE;
                for (uint32_t s = 0; s < 16; ++s) {
                    rec.locals_mapping.push_back(Location::make_stack(static_cast<int32_t>(s * 8)));
                }
                out_deopt_table.add_deopt(rec);

                // Peek operand on top of stack: [RSP]
                asm_.mov_reg_mem(X64Reg::RAX, X64Reg::RSP, 0);
                asm_.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::TAG_MAJOR_MASK));
                asm_.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                asm_.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                asm_.cmp_reg_reg(X64Reg::RAX, X64Reg::R11);

                X64Label ok_label;
                asm_.jcc(X64Cond::EQ, ok_label);

                // Guard failed: call deopt helper
                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.mov_reg_reg(X64Reg::RDX, X64Reg::R14); // JITFrame*
                asm_.mov_reg_imm64(X64Reg::R8, 0);          // MachineState*
                asm_.mov_reg_imm64(X64Reg::R9, static_cast<int64_t>(deopt_id));
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_deopt_machine));

                // Deopt epilogue: unwind frame and return to VM
                asm_.mov_reg_reg(X64Reg::RSP, X64Reg::RBP);
                asm_.pop_reg(X64Reg::R15);
                asm_.pop_reg(X64Reg::R14);
                asm_.pop_reg(X64Reg::R13);
                asm_.pop_reg(X64Reg::R12);
                asm_.pop_reg(X64Reg::RSI);
                asm_.pop_reg(X64Reg::RDI);
                asm_.pop_reg(X64Reg::RBX);
                asm_.pop_reg(X64Reg::RBP);
                asm_.ret();

                asm_.bind(ok_label);
                break;
            }

            case LIROpcode::GUARD_OVERFLOW: {
                uint32_t deopt_target_ip = inst.arg1;
                uint32_t deopt_id = deopt_target_ip;

                DeoptRecord rec;
                rec.deopt_id = deopt_id;
                rec.native_offset = static_cast<uint32_t>(asm_.current_offset());
                rec.target_bytecode_ip = deopt_target_ip;
                rec.reason = DeoptReason::ARITHMETIC_OVERFLOW;
                for (uint32_t s = 0; s < 16; ++s) {
                    rec.locals_mapping.push_back(Location::make_stack(static_cast<int32_t>(s * 8)));
                }
                out_deopt_table.add_deopt(rec);

                X64Label no_overflow_label;
                asm_.jcc(X64Cond::NO, no_overflow_label);

                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.mov_reg_reg(X64Reg::RDX, X64Reg::R14); // JITFrame*
                asm_.mov_reg_imm64(X64Reg::R8, 0);
                asm_.mov_reg_imm64(X64Reg::R9, static_cast<int64_t>(deopt_id));
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_deopt_machine));

                asm_.mov_reg_reg(X64Reg::RSP, X64Reg::RBP);
                asm_.pop_reg(X64Reg::R15);
                asm_.pop_reg(X64Reg::R14);
                asm_.pop_reg(X64Reg::R13);
                asm_.pop_reg(X64Reg::R12);
                asm_.pop_reg(X64Reg::RSI);
                asm_.pop_reg(X64Reg::RDI);
                asm_.pop_reg(X64Reg::RBX);
                asm_.pop_reg(X64Reg::RBP);
                asm_.ret();

                asm_.bind(no_overflow_label);
                break;
            }

            case LIROpcode::DEOPT: {
                uint32_t deopt_target_ip = inst.arg1;
                uint32_t deopt_id = deopt_target_ip;

                DeoptRecord rec;
                rec.deopt_id = deopt_id;
                rec.native_offset = static_cast<uint32_t>(asm_.current_offset());
                rec.target_bytecode_ip = deopt_target_ip;
                rec.reason = DeoptReason::EXPLICIT_BAILOUT;
                for (uint32_t s = 0; s < 16; ++s) {
                    rec.locals_mapping.push_back(Location::make_stack(static_cast<int32_t>(s * 8)));
                }
                out_deopt_table.add_deopt(rec);

                asm_.mov_reg_reg(X64Reg::RCX, X64Reg::R15); // VM*
                asm_.mov_reg_reg(X64Reg::RDX, X64Reg::R14); // JITFrame*
                asm_.mov_reg_imm64(X64Reg::R8, 0);
                asm_.mov_reg_imm64(X64Reg::R9, static_cast<int64_t>(deopt_id));
                asm_.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_deopt_machine));

                asm_.mov_reg_reg(X64Reg::RSP, X64Reg::RBP);
                asm_.pop_reg(X64Reg::R15);
                asm_.pop_reg(X64Reg::R14);
                asm_.pop_reg(X64Reg::R13);
                asm_.pop_reg(X64Reg::R12);
                asm_.pop_reg(X64Reg::RSI);
                asm_.pop_reg(X64Reg::RDI);
                asm_.pop_reg(X64Reg::RBX);
                asm_.pop_reg(X64Reg::RBP);
                asm_.ret();
                break;
            }

            case LIROpcode::RET:
            case LIROpcode::HALT: {
                asm_.pop_reg(X64Reg::RAX); // return value
                asm_.mov_reg_reg(X64Reg::RSP, X64Reg::RBP);
                asm_.pop_reg(X64Reg::R15);
                asm_.pop_reg(X64Reg::R14);
                asm_.pop_reg(X64Reg::R13);
                asm_.pop_reg(X64Reg::R12);
                asm_.pop_reg(X64Reg::RSI);
                asm_.pop_reg(X64Reg::RDI);
                asm_.pop_reg(X64Reg::RBX);
                asm_.pop_reg(X64Reg::RBP);
                asm_.ret();
                break;
            }
        }
    }

    // Default epilogue in case code falls through
    asm_.mov_reg_imm64(X64Reg::RAX, static_cast<int64_t>(VMValue::TAG_INT)); // return 0
    asm_.mov_reg_reg(X64Reg::RSP, X64Reg::RBP);
    asm_.pop_reg(X64Reg::R15);
    asm_.pop_reg(X64Reg::R14);
    asm_.pop_reg(X64Reg::R13);
    asm_.pop_reg(X64Reg::R12);
    asm_.pop_reg(X64Reg::RSI);
    asm_.pop_reg(X64Reg::RDI);
    asm_.pop_reg(X64Reg::RBX);
    asm_.pop_reg(X64Reg::RBP);
    asm_.ret();

    // Write to JITCodeBuffer and finalize (W^X: RW -> RX)
    const auto& bytes = asm_.code();
    if (!out_buffer.allocate(bytes.size())) {
        return false;
    }
    if (!out_buffer.write(bytes.data(), bytes.size())) {
        return false;
    }
    if (!out_buffer.finalize()) {
        return false;
    }

    return true;
}

bool BaselineJITCompiler::compile_chunk(const Chunk& chunk, size_t start_ip, size_t end_ip,
                                       JITCodeBuffer& out_buffer, JITSafepointTable& out_safepoints,
                                       OSREntryTable& out_osr_table, DeoptTable& out_deopt_table) {
    LIRProgram lir;
    if (!lower_to_lir(chunk, start_ip, end_ip, lir)) {
        return false;
    }
    return compile_lir(lir, out_buffer, out_safepoints, out_osr_table, out_deopt_table);
}

} // namespace setun
