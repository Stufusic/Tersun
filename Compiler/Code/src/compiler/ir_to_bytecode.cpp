#include "compiler/ir_to_bytecode.hpp"
#include "tafpu/exception.hpp"
#include <algorithm>
#include <iostream>

namespace setun {

Chunk IRToBytecodeEmitter::emit(const IRModule& module, const Program* program) {
    chunk_ = Chunk{};
    functions_.clear();
    globals_.clear();
    next_global_slot_ = 0;
    next_fn_index_ = 0;
    unresolved_calls_.clear();

    // Import string table
    for (const auto& s : module.string_table) {
        chunk_.add_string(s);
    }

    // Check if main is defined in functions
    bool has_main = false;
    for (const auto& fn : module.functions) {
        if (fn.name == "main") {
            has_main = true;
            break;
        }
    }

    // 1. Emit Toplevel Instructions
    emit_function(module.toplevel, true);

    // Auto-invoke main() if present in the module
    size_t main_call_patch = 0;
    if (has_main) {
        chunk_.write_opcode(OpCode::OP_CALL, 1);
        main_call_patch = chunk_.code.size();
        chunk_.write_int16(0, 1); // placeholder for main function ID
        chunk_.write_byte(0, 1);  // 0 arguments
        chunk_.write_opcode(OpCode::OP_POP, 1); // Discard main return value
    }

    // Halt top-level execution
    chunk_.write_opcode(OpCode::OP_HALT, 1);

    // 2. Emit User-Defined Functions
    for (const auto& fn : module.functions) {
        emit_function(fn, false);
    }

    // Patch main invocation
    if (has_main) {
        auto it_main = functions_.find("main");
        if (it_main != functions_.end()) {
            uint16_t fn_id = it_main->second;
            chunk_.code[main_call_patch] = static_cast<uint8_t>(fn_id & 0xFF);
            chunk_.code[main_call_patch + 1] = static_cast<uint8_t>((fn_id >> 8) & 0xFF);
        }
    }

    // 3. Patch Unresolved Calls
    for (const auto& uc : unresolved_calls_) {
        auto it = functions_.find(uc.fn_name);
        if (it == functions_.end()) {
            throw CompilerException("[IRToBytecode Error] Undefined function '" + uc.fn_name + "'");
        }
        uint16_t fn_id = it->second;
        chunk_.code[uc.patch_offset] = static_cast<uint8_t>(fn_id & 0xFF);
        chunk_.code[uc.patch_offset + 1] = static_cast<uint8_t>((fn_id >> 8) & 0xFF);
    }

    // 4. Populate V-Tables if Program AST is provided
    if (program) {
        for (const auto* stmt : program->statements) {
            if (!stmt) continue;
            if (const auto* cd = std::get_if<ClassDeclStmt>(&stmt->data)) {
                for (const auto& m : cd->methods) {
                    std::string mangled = cd->name + "_" + m.name;
                    auto it = functions_.find(mangled);
                    if (it != functions_.end()) {
                        chunk_.vtables[cd->name][m.name] = it->second;
                    }
                }
            } else if (const auto* sd = std::get_if<StructDeclStmt>(&stmt->data)) {
                for (const auto& m : sd->methods) {
                    std::string mangled = sd->name + "_" + m.name;
                    auto it = functions_.find(mangled);
                    if (it != functions_.end()) {
                        chunk_.vtables[sd->name][m.name] = it->second;
                    }
                }
            }
        }
    }

    return chunk_;
}

uint16_t IRToBytecodeEmitter::register_function(const std::string& name) {
    uint32_t entry = static_cast<uint32_t>(chunk_.code.size());
    if (chunk_.function_table.empty()) {
        chunk_.function_table.push_back(0);      // index 0 reserved
        chunk_.function_frame_sizes.push_back(32);
        next_fn_index_ = 1;
    }
    uint16_t idx = next_fn_index_++;
    chunk_.function_table.push_back(entry);
    if (chunk_.function_frame_sizes.size() < chunk_.function_table.size()) {
        chunk_.function_frame_sizes.resize(chunk_.function_table.size(), 32);
    }
    functions_[name] = idx;
    return idx;
}

uint16_t IRToBytecodeEmitter::get_global_slot(const std::string& name) {
    auto it = globals_.find(name);
    if (it != globals_.end()) return it->second;
    uint16_t slot = next_global_slot_++;
    globals_[name] = slot;
    return slot;
}

uint16_t IRToBytecodeEmitter::get_local_slot(const IROperand& op, const IRFunction& fn) {
    if (op.is_local()) {
        return static_cast<uint16_t>(op.val_i);
    }
    if (op.is_vreg()) {
        return static_cast<uint16_t>(fn.num_locals + op.val_i);
    }
    return 0;
}

void IRToBytecodeEmitter::push_operand(const IROperand& op, size_t line, const IRFunction& fn) {
    switch (op.kind) {
        case IROperand::Kind::CONST_INT:
            chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
            chunk_.write_int64(op.val_i, line);
            break;
        case IROperand::Kind::CONST_FLOAT:
            chunk_.write_opcode(OpCode::OP_PUSH_FLOAT, line);
            chunk_.write_double(op.val_f, line);
            break;
        case IROperand::Kind::CONST_BOOL:
            chunk_.write_opcode(OpCode::OP_PUSH_BOOL, line);
            chunk_.write_byte(op.val_i ? 1 : 0, line);
            break;
        case IROperand::Kind::CONST_STR: {
            uint16_t sid = chunk_.add_string(op.val_s);
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, line);
            chunk_.write_int16(static_cast<int16_t>(sid), line);
            break;
        }
        case IROperand::Kind::LOCAL_SLOT:
        case IROperand::Kind::VREG: {
            uint16_t slot = get_local_slot(op, fn);
            chunk_.write_opcode(OpCode::OP_LOAD_LOCAL, line);
            chunk_.write_int16(static_cast<int16_t>(slot), line);
            break;
        }
        case IROperand::Kind::NONE:
        default:
            chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
            chunk_.write_int64(0, line);
            break;
    }
}

void IRToBytecodeEmitter::store_dst(const IROperand& dst, size_t line, const IRFunction& fn) {
    if (dst.is_none()) {
        chunk_.write_opcode(OpCode::OP_POP, line);
        return;
    }
    uint16_t slot = get_local_slot(dst, fn);
    chunk_.write_opcode(OpCode::OP_STORE_LOCAL, line);
    chunk_.write_int16(static_cast<int16_t>(slot), line);
    chunk_.write_opcode(OpCode::OP_POP, line);
}

void IRToBytecodeEmitter::emit_function(const IRFunction& fn, bool is_toplevel) {
    label_offsets_.clear();
    unresolved_jumps_.clear();
    unresolved_branch3_.clear();

    uint16_t fn_id = 0;
    if (!is_toplevel) {
        fn_id = register_function(fn.name);
    }

    // Compute required frame size (locals + max vreg)
    size_t max_slot = fn.num_locals;
    auto scan_op = [&](const IROperand& op) {
        if (op.is_local()) {
            if (op.val_i + 1 > max_slot) max_slot = op.val_i + 1;
        } else if (op.is_vreg()) {
            size_t s = fn.num_locals + op.val_i + 1;
            if (s > max_slot) max_slot = s;
        }
    };

    for (const auto& inst : fn.instructions) {
        scan_op(inst.dst);
        scan_op(inst.src1);
        scan_op(inst.src2);
        for (const auto& a : inst.args) scan_op(a);
    }
    size_t frame_size = max_slot + 16;
    if (is_toplevel) {
        chunk_.toplevel_frame_size = frame_size;
    } else {
        if (fn_id < chunk_.function_frame_sizes.size()) {
            chunk_.function_frame_sizes[fn_id] = static_cast<uint16_t>(frame_size);
        }
    }

    // First pass: emit instructions
    for (size_t i = 0; i < fn.instructions.size(); ++i) {
        const auto& inst = fn.instructions[i];
        if (is_toplevel && inst.op == IROp::RETURN && i == fn.instructions.size() - 1) {
            // Trailing synthetic return in toplevel is skipped so toplevel proceeds to main call & OP_HALT
            continue;
        }
        emit_instruction(inst, fn);
    }

    // Ensure function ends with OP_RET if not toplevel
    if (!is_toplevel) {
        if (fn.instructions.empty() || fn.instructions.back().op != IROp::RETURN) {
            chunk_.write_opcode(OpCode::OP_PUSH_INT, 1);
            chunk_.write_int64(0, 1);
            chunk_.write_opcode(OpCode::OP_RET, 1);
        }
    }

    // Patch function-local jumps
    for (const auto& uj : unresolved_jumps_) {
        auto it = label_offsets_.find(uj.target_label);
        if (it == label_offsets_.end()) {
            throw CompilerException("[IRToBytecode Error] Unresolved label '" + uj.target_label + "' in " + fn.name);
        }
        chunk_.patch_jump_to(uj.patch_offset, it->second);
    }

    // Patch branch3 targets
    for (const auto& ub : unresolved_branch3_) {
        auto it_neg = label_offsets_.find(ub.label_neg);
        auto it_zero = label_offsets_.find(ub.label_zero);
        auto it_pos = label_offsets_.find(ub.label_pos);
        if (it_neg == label_offsets_.end() || it_zero == label_offsets_.end() || it_pos == label_offsets_.end()) {
            throw CompilerException("[IRToBytecode Error] Unresolved branch3 label in " + fn.name);
        }
        chunk_.patch_jump_to(ub.patch_offset_neg, it_neg->second);
        chunk_.patch_jump_to(ub.patch_offset_zero, it_zero->second);
        chunk_.patch_jump_to(ub.patch_offset_pos, it_pos->second);
    }
}

void IRToBytecodeEmitter::emit_instruction(const IRInstruction& inst, const IRFunction& fn) {
    size_t line = inst.line > 0 ? inst.line : 1;

    switch (inst.op) {
        case IROp::NOP:
            chunk_.write_opcode(OpCode::OP_NOP, line);
            break;

        case IROp::LABEL:
            label_offsets_[inst.dst.val_s] = chunk_.code.size();
            break;

        case IROp::CONST_INT:
        case IROp::CONST_FLOAT:
        case IROp::CONST_BOOL:
        case IROp::CONST_STR:
            push_operand(inst.src1, line, fn);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CONST_TRYTE:
            chunk_.write_opcode(OpCode::OP_PUSH_TRYTE, line);
            chunk_.write_int16(static_cast<int16_t>(inst.src1.val_i), line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CONST_TAFPU: {
            chunk_.write_opcode(OpCode::OP_PUSH_TAFPU, line);
            chunk_.write_int64(inst.src1.val_i, line);
            chunk_.write_int64(inst.src2.val_i, line);
            int32_t s = inst.args.empty() ? 0 : static_cast<int32_t>(inst.args[0].val_i);
            chunk_.write_int32(s, line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::CONST_NIL:
            chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
            chunk_.write_int64(0, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::MOVE:
        case IROp::LOAD_LOCAL:
            push_operand(inst.src1, line, fn);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::STORE_LOCAL: {
            push_operand(inst.src1, line, fn);
            uint16_t slot = get_local_slot(inst.dst, fn);
            chunk_.write_opcode(OpCode::OP_STORE_LOCAL, line);
            chunk_.write_int16(static_cast<int16_t>(slot), line);
            chunk_.write_opcode(OpCode::OP_POP, line);
            break;
        }

        case IROp::LOAD_GLOBAL: {
            uint16_t slot = get_global_slot(inst.src1.val_s);
            chunk_.write_opcode(OpCode::OP_LOAD_GLOBAL, line);
            chunk_.write_int16(static_cast<int16_t>(slot), line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::STORE_GLOBAL: {
            push_operand(inst.src1, line, fn);
            std::string gname = inst.dst.val_s.empty() ? inst.src1.val_s : inst.dst.val_s;
            uint16_t slot = get_global_slot(gname);
            chunk_.write_opcode(OpCode::OP_STORE_GLOBAL, line);
            chunk_.write_int16(static_cast<int16_t>(slot), line);
            chunk_.write_opcode(OpCode::OP_POP, line);
            break;
        }

        // Binary Arithmetic
        case IROp::ADD:
        case IROp::TAFPU_ADD:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_ADD, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::SUB:
        case IROp::TAFPU_SUB:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_SUB, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::MUL:
        case IROp::TAFPU_MUL:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_MUL, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::DIV:
        case IROp::TAFPU_DIV:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_DIV, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::MOD:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_MOD, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::NEG:
            push_operand(inst.src1, line, fn);
            chunk_.write_opcode(OpCode::OP_NEG, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::TRIT_NOT:
        case IROp::BIT_NOT:
            push_operand(inst.src1, line, fn);
            chunk_.write_opcode(OpCode::OP_TERNARY_NOT, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::BIT_AND:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_BIT_AND, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::BIT_OR:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_BIT_OR, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::BIT_XOR:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_BIT_XOR, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::SHL:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_SHL, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::SHR:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_SHR, line);
            store_dst(inst.dst, line, fn);
            break;

        // Comparisons
        case IROp::CMP_EQ:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_EQ, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CMP_NE:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_NEQ, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CMP_LT:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_LT, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CMP_LE:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_LE, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CMP_GT:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_GT, line);
            store_dst(inst.dst, line, fn);
            break;

        case IROp::CMP_GE:
            push_operand(inst.src1, line, fn);
            push_operand(inst.src2, line, fn);
            chunk_.write_opcode(OpCode::OP_GE, line);
            store_dst(inst.dst, line, fn);
            break;

        // Control Flow
        case IROp::JUMP: {
            size_t patch = chunk_.emit_jump(OpCode::OP_JUMP, line);
            unresolved_jumps_.push_back({patch, inst.src1.val_s, line});
            break;
        }

        case IROp::BRANCH_IF_FALSE: {
            push_operand(inst.src1, line, fn);
            size_t patch = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, line);
            unresolved_jumps_.push_back({patch, inst.src2.val_s, line});
            break;
        }

        case IROp::BRANCH_IF_TRUE: {
            push_operand(inst.src1, line, fn);
            chunk_.write_opcode(OpCode::OP_PUSH_BOOL, line);
            chunk_.write_byte(0, line);
            chunk_.write_opcode(OpCode::OP_EQ, line); // Invert condition
            size_t patch = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, line);
            unresolved_jumps_.push_back({patch, inst.src2.val_s, line});
            break;
        }

        case IROp::BRANCH3: {
            push_operand(inst.src1, line, fn);
            chunk_.write_opcode(OpCode::OP_BRANCH_3, line);
            size_t p_neg = chunk_.code.size();
            chunk_.write_int16(0, line);
            size_t p_zero = chunk_.code.size();
            chunk_.write_int16(0, line);
            size_t p_pos = chunk_.code.size();
            chunk_.write_int16(0, line);
            std::string l_neg = inst.src2.val_s;
            std::string l_zero = inst.args.size() > 0 ? inst.args[0].val_s : "";
            std::string l_pos = inst.args.size() > 1 ? inst.args[1].val_s : "";
            unresolved_branch3_.push_back({p_neg, p_zero, p_pos, l_neg, l_zero, l_pos, line});
            break;
        }

        // Functions
        case IROp::CALL: {
            const std::string& callee = inst.src1.val_s;

            // Built-in functions
            if (callee == "print") {
                if (!inst.args.empty()) push_operand(inst.args[0], line, fn);
                chunk_.write_opcode(OpCode::OP_PRINT, line);
                if (!inst.dst.is_none()) {
                    chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
                    chunk_.write_int64(0, line);
                    store_dst(inst.dst, line, fn);
                }
                break;
            }
            if (callee == "println") {
                if (!inst.args.empty()) push_operand(inst.args[0], line, fn);
                chunk_.write_opcode(OpCode::OP_PRINTLN, line);
                if (!inst.dst.is_none()) {
                    chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
                    chunk_.write_int64(0, line);
                    store_dst(inst.dst, line, fn);
                }
                break;
            }
            if (callee == "assert_eq") {
                if (inst.args.size() >= 2) {
                    push_operand(inst.args[0], line, fn);
                    push_operand(inst.args[1], line, fn);
                    chunk_.write_opcode(OpCode::OP_ASSERT_EQ, line);
                }
                break;
            }
            if (callee == "time_now_us" || callee == "monotonic_now_us") {
                chunk_.write_opcode(OpCode::OP_TIME_NOW_US, line);
                store_dst(inst.dst, line, fn);
                break;
            }
            if (callee == "to_double") {
                if (!inst.args.empty()) push_operand(inst.args[0], line, fn);
                chunk_.write_opcode(OpCode::OP_TAFPU_TODBL, line);
                store_dst(inst.dst, line, fn);
                break;
            }

            // User-defined function call
            for (const auto& arg : inst.args) {
                push_operand(arg, line, fn);
            }
            chunk_.write_opcode(OpCode::OP_CALL, line);
            size_t patch_offset = chunk_.code.size();
            chunk_.write_int16(0, line); // Placeholder
            chunk_.write_byte(static_cast<uint8_t>(inst.args.size()), line);

            unresolved_calls_.push_back({patch_offset, callee, line});
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::RETURN: {
            if (!inst.src1.is_none()) {
                push_operand(inst.src1, line, fn);
            } else if (!inst.dst.is_none()) {
                push_operand(inst.dst, line, fn);
            } else {
                chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
                chunk_.write_int64(0, line);
            }
            chunk_.write_opcode(OpCode::OP_RET, line);
            break;
        }

        // Heap / Object / Array
        case IROp::ALLOC_ARRAY: {
            int64_t count = inst.src1.val_i;
            for (int64_t i = 0; i < count; ++i) {
                chunk_.write_opcode(OpCode::OP_PUSH_INT, line);
                chunk_.write_int64(0, line);
            }
            chunk_.write_opcode(OpCode::OP_NEW_ARRAY, line);
            chunk_.write_int16(static_cast<int16_t>(count), line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::LOAD_ELEM: {
            push_operand(inst.src1, line, fn); // array
            push_operand(inst.src2, line, fn); // index
            chunk_.write_opcode(OpCode::OP_GET_INDEX, line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::STORE_ELEM: {
            push_operand(inst.dst, line, fn);  // array
            push_operand(inst.src1, line, fn); // index
            push_operand(inst.src2, line, fn); // value
            chunk_.write_opcode(OpCode::OP_SET_INDEX, line);
            break;
        }

        case IROp::ARRAY_LEN: {
            push_operand(inst.src1, line, fn); // array
            uint16_t fid = chunk_.add_string("length");
            chunk_.write_opcode(OpCode::OP_GET_FIELD, line);
            chunk_.write_int16(static_cast<int16_t>(fid), line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::LOAD_FIELD: {
            push_operand(inst.src1, line, fn); // object
            uint16_t fid = chunk_.add_string(inst.src2.val_s);
            chunk_.write_opcode(OpCode::OP_GET_FIELD, line);
            chunk_.write_int16(static_cast<int16_t>(fid), line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::STORE_FIELD: {
            push_operand(inst.dst, line, fn);  // object
            push_operand(inst.src2, line, fn); // value
            uint16_t fid = chunk_.add_string(inst.src1.val_s);
            chunk_.write_opcode(OpCode::OP_SET_FIELD, line);
            chunk_.write_int16(static_cast<int16_t>(fid), line);
            break;
        }

        case IROp::ALLOC_OBJ: {
            uint16_t tid = chunk_.add_string(inst.src1.val_s.empty() ? "Object" : inst.src1.val_s);
            chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, line);
            chunk_.write_int16(static_cast<int16_t>(tid), line);
            chunk_.write_byte(0, line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::INVOKE_METHOD: {
            // Push target object
            push_operand(inst.src1, line, fn);
            // Push arguments
            for (const auto& arg : inst.args) {
                push_operand(arg, line, fn);
            }
            uint16_t mid = chunk_.add_string(inst.src2.val_s);
            chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, line);
            chunk_.write_int16(static_cast<int16_t>(mid), line);
            chunk_.write_byte(static_cast<uint8_t>(inst.args.size()), line);
            store_dst(inst.dst, line, fn);
            break;
        }

        case IROp::VM_FALLBACK:
        default:
            break;
    }
}

} // namespace setun
