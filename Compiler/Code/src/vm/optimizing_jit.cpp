#include "vm/optimizing_jit.hpp"
#include "vm/x64_assembler.hpp"
#include "vm/jit_runtime_helpers.hpp"
#include "compiler/emitter.hpp"
#include <iostream>
#include <map>

namespace setun {

std::shared_ptr<JITCodeObject> OptimizingJITCompiler::compile_tier2(
    const Chunk& chunk,
    uint32_t func_ip,
    const ProfileSnapshot* profile) {

    auto code_obj = std::make_shared<JITCodeObject>();
    code_obj->start_ip = func_ip;

    // Step 1: Stack-to-SSA MachineIR Construction
    auto mir_func = MIRFunction::build_from_bytecode(chunk, func_ip);
    if (!mir_func) return nullptr;

    // Step 2: Advanced Optimizations on MachineIR
    std::vector<MaterializationEntry> materializations;
    MIROptimizer optimizer(opt_flags_);
    last_stats_ = optimizer.optimize(*mir_func, profile, &materializations);

    // Step 3: Linear Scan Register Allocation (Windows x64 ABI aware)
    RegisterAllocationResult reg_alloc = LinearScanAllocator::allocate(*mir_func);

    // Step 4: Machine Code Emission via x86-64 Assembler
    X64Assembler as;

    // Windows x64 ABI Prologue:
    // RCX = VM* vm, RDX = JITFrame* frame
    as.push_reg(X64Reg::RBP);
    as.mov_reg_reg(X64Reg::RBP, X64Reg::RSP);

    // Callee-saved register saving
    for (uint8_t r : reg_alloc.used_callee_saved_regs) {
        as.push_reg(static_cast<X64Reg>(r));
    }

    // Allocate stack space for spills and shadow space (aligned to 16 bytes)
    uint32_t spill_bytes = (reg_alloc.total_spill_slots + 4) * 8;
    spill_bytes = (spill_bytes + 15) & ~15;
    as.sub_reg_imm32(X64Reg::RSP, spill_bytes);

    // Load locals from JITFrame:
    // offset 16 of JITFrame is VMValue* locals
    as.mov_reg_mem(X64Reg::R10, X64Reg::RDX, 16);

    // Helper to get physical register for a vreg
    auto get_reg = [&](vreg_t v) -> X64Reg {
        if (reg_alloc.vreg_locations.count(v)) {
            const auto& loc = reg_alloc.vreg_locations[v];
            if (loc.kind == Location::Register && loc.reg_index < 16) {
                return static_cast<X64Reg>(loc.reg_index);
            }
        }
        return X64Reg::RAX;
    };

    // Load initial local variables into allocated registers
    for (uint32_t i = 0; i < 4; ++i) {
        if (reg_alloc.vreg_locations.count(i)) {
            const auto& loc = reg_alloc.vreg_locations[i];
            if (loc.kind == Location::Register) {
                X64Reg r = static_cast<X64Reg>(loc.reg_index);
                as.mov_reg_mem(r, X64Reg::R10, i * 8);
                // Unbox 48-bit tagged int if passed from VM
                as.shl_reg_imm8(r, 16);
                as.sar_reg_imm8(r, 16);
            }
        }
    }

    // Helper to get YMM register for a vector vreg
    auto get_ymm = [](vreg_t v) -> YmmReg {
        return static_cast<YmmReg>(v % 8);
    };

    // Pre-declare block labels for control flow
    std::map<uint32_t, X64Label> block_labels;
    for (const auto& blk : mir_func->blocks) {
        block_labels[blk->id] = X64Label{};
    }

    // Emit block instructions
    for (const auto& blk : mir_func->blocks) {
        as.bind(block_labels[blk->id]);

        if (blk->is_loop_header) {
            // Register OSR loop entry
            OSREntryRecord osr_rec;
            osr_rec.function_id = func_ip;
            osr_rec.loop_id = blk->id;
            osr_rec.loop_header_bytecode_ip = blk->instructions.empty() ? 0 : blk->instructions[0].bytecode_ip;
            osr_rec.osr_native_entry_offset = static_cast<uint32_t>(as.current_offset());
            code_obj->osr_table.add_entry(osr_rec);
        }

        for (const auto& inst : blk->instructions) {
            switch (inst.opcode) {
                case MIROpcode::CONST_INT: {
                    X64Reg d = get_reg(inst.dest);
                    as.mov_reg_imm64(d, inst.imm64);
                    break;
                }
                case MIROpcode::MOV: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s = get_reg(inst.src1);
                    if (d != s) as.mov_reg_reg(d, s);
                    break;
                }
                case MIROpcode::INT_ADD: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s1 = get_reg(inst.src1);
                    X64Reg s2 = get_reg(inst.src2);
                    if (d != s1) as.mov_reg_reg(d, s1);
                    if (inst.imm64 != 0) {
                        as.add_reg_imm32(d, static_cast<int32_t>(inst.imm64));
                    } else {
                        as.add_reg_reg(d, s2);
                    }
                    break;
                }
                case MIROpcode::INT_SUB: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s1 = get_reg(inst.src1);
                    X64Reg s2 = get_reg(inst.src2);
                    if (d != s1) as.mov_reg_reg(d, s1);
                    as.sub_reg_reg(d, s2);
                    break;
                }
                case MIROpcode::INT_MUL: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s1 = get_reg(inst.src1);
                    X64Reg s2 = get_reg(inst.src2);
                    if (d != s1) as.mov_reg_reg(d, s1);
                    as.imul_reg_reg(d, s2);
                    break;
                }
                case MIROpcode::INT_MOD: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s1 = get_reg(inst.src1);
                    X64Reg s2 = get_reg(inst.src2);
                    if (s1 != X64Reg::RAX) as.mov_reg_reg(X64Reg::RAX, s1);
                    as.cqo();
                    as.idiv_reg(s2);
                    if (d != X64Reg::RDX) as.mov_reg_reg(d, X64Reg::RDX);
                    break;
                }
                case MIROpcode::BIT_AND: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg s1 = get_reg(inst.src1);
                    X64Reg s2 = get_reg(inst.src2);
                    if (d != s1) as.mov_reg_reg(d, s1);
                    as.and_reg_reg(d, s2);
                    break;
                }
                case MIROpcode::LOAD_ELEMENT: {
                    X64Reg d = get_reg(inst.dest);
                    X64Reg target = get_reg(inst.src1);
                    X64Reg idx = get_reg(inst.src2);
                    as.mov_reg_reg(X64Reg::RCX, target);
                    as.mov_reg_reg(X64Reg::RDX, idx);
                    as.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_get_element_i64));
                    if (d != X64Reg::RAX) as.mov_reg_reg(d, X64Reg::RAX);
                    break;
                }
                case MIROpcode::STORE_ELEMENT: {
                    X64Reg target = get_reg(inst.src1);
                    X64Reg idx = get_reg(inst.src2);
                    X64Reg val = get_reg(inst.src3);
                    as.mov_reg_reg(X64Reg::RCX, target);
                    as.mov_reg_reg(X64Reg::RDX, idx);
                    as.mov_reg_reg(X64Reg::R8, val);
                    as.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_set_element_i64));
                    break;
                }
                case MIROpcode::VEC_ZEROALL: {
                    as.vzeroall();
                    break;
                }
                case MIROpcode::VEC_BROADCAST: {
                    YmmReg yd = get_ymm(inst.dest);
                    X64Reg s = get_reg(inst.src1);
                    as.mov_mem_reg(X64Reg::RSP, 0, s);
                    as.vpbroadcastq(yd, X64Reg::RSP, 0);
                    break;
                }
                case MIROpcode::VEC_LOAD: {
                    YmmReg yd = get_ymm(inst.dest);
                    X64Reg arr = get_reg(inst.src1);
                    X64Reg idx = get_reg(inst.src2);
                    as.mov_reg_reg(X64Reg::RCX, arr);
                    as.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_array_raw_data));
                    as.vmovdqu_reg_mem_sib(yd, X64Reg::RAX, idx, 3, 0);
                    break;
                }
                case MIROpcode::VEC_STORE: {
                    YmmReg ys = get_ymm(inst.src3);
                    X64Reg arr = get_reg(inst.src1);
                    X64Reg idx = get_reg(inst.src2);
                    as.mov_reg_reg(X64Reg::RCX, arr);
                    as.call_ptr(reinterpret_cast<const void*>(&setun_jit_helper_array_raw_data));
                    as.vmovdqu_mem_sib_reg(X64Reg::RAX, idx, 3, 0, ys);
                    break;
                }
                case MIROpcode::VEC_MUL: {
                    YmmReg yd = get_ymm(inst.dest);
                    YmmReg ys1 = get_ymm(inst.src1);
                    YmmReg ys2 = get_ymm(inst.src2);
                    as.vpmuludq_reg_reg_reg(yd, ys1, ys2);
                    break;
                }
                case MIROpcode::VEC_ADD: {
                    YmmReg yd = get_ymm(inst.dest);
                    YmmReg ys1 = get_ymm(inst.src1);
                    YmmReg ys2 = get_ymm(inst.src2);
                    as.vpaddq_reg_reg_reg(yd, ys1, ys2);
                    break;
                }
                case MIROpcode::VEC_FMA: {
                    YmmReg yd = get_ymm(inst.dest);
                    YmmReg ys1 = get_ymm(inst.src1);
                    YmmReg ys2 = get_ymm(inst.src2);
                    as.vfmadd231pd_reg_reg_reg(yd, ys1, ys2);
                    break;
                }
                case MIROpcode::JMP: {
                    X64Label& tgt = block_labels[inst.target_block];
                    as.jmp(tgt);
                    break;
                }
                case MIROpcode::JCC: {
                    X64Reg cond = get_reg(inst.src1);
                    as.test_reg_reg(cond, cond);
                    X64Label& tgt = block_labels[inst.target_block];
                    as.jcc(X64Cond::EQ, tgt);
                    break;
                }
                case MIROpcode::GUARD_TYPE: {
                    // Record deopt point
                    DeoptRecord rec;
                    rec.deopt_id = inst.guard.deopt_id;
                    rec.native_offset = static_cast<uint32_t>(as.current_offset());
                    rec.target_bytecode_ip = inst.bytecode_ip;
                    rec.reason = DeoptReason::TYPE_GUARD_FAILURE;
                    rec.materializations = materializations;
                    code_obj->deopt_table.add_deopt(rec);
                    break;
                }
                case MIROpcode::GUARD_SHAPE:
                case MIROpcode::GUARD_VTABLE: {
                    // Record shape/vtable deopt point
                    DeoptRecord rec;
                    rec.deopt_id = inst.guard.deopt_id;
                    rec.native_offset = static_cast<uint32_t>(as.current_offset());
                    rec.target_bytecode_ip = inst.bytecode_ip;
                    rec.reason = DeoptReason::SHAPE_GUARD_FAILURE;
                    rec.materializations = materializations;
                    code_obj->deopt_table.add_deopt(rec);
                    break;
                }
                case MIROpcode::CALL_DIRECT: {
                    if (inst.dest != NO_VREG && inst.src1 != NO_VREG) {
                        X64Reg d = get_reg(inst.dest);
                        X64Reg s = get_reg(inst.src1);
                        if (d != s) as.mov_reg_reg(d, s);
                    }
                    break;
                }
                case MIROpcode::SAFEPOINT: {
                    SafepointRecord sf;
                    sf.native_offset = static_cast<uint32_t>(as.current_offset());
                    code_obj->safepoints.add_safepoint(sf);
                    break;
                }
                case MIROpcode::RET: {
                    if (inst.src1 != NO_VREG) {
                        X64Reg s = get_reg(inst.src1);
                        if (s != X64Reg::RAX) as.mov_reg_reg(X64Reg::RAX, s);
                        // Re-tag with TAG_INT for VM compatibility
                        as.mov_reg_imm64(X64Reg::R10, static_cast<int64_t>(VMValue::PAYLOAD_MASK));
                        as.and_reg_reg(X64Reg::RAX, X64Reg::R10);
                        as.mov_reg_imm64(X64Reg::R11, static_cast<int64_t>(VMValue::TAG_INT));
                        as.or_reg_reg(X64Reg::RAX, X64Reg::R11);
                    }
                    // Epilogue
                    as.add_reg_imm32(X64Reg::RSP, spill_bytes);
                    for (auto it = reg_alloc.used_callee_saved_regs.rbegin(); it != reg_alloc.used_callee_saved_regs.rend(); ++it) {
                        as.pop_reg(static_cast<X64Reg>(*it));
                    }
                    as.pop_reg(X64Reg::RBP);
                    as.ret();
                    break;
                }
                default: break;
            }
        }
    }

    // Ensure final return if missing
    const auto& bytes = as.code();
    if (bytes.empty() || bytes.back() != 0xC3) { // 0xC3 = RET
        as.add_reg_imm32(X64Reg::RSP, spill_bytes);
        as.pop_reg(X64Reg::RBP);
        as.ret();
    }

    // Step 5: Allocate, Write, and Make Executable (W^X)
    const auto& code_bytes = as.code();
    if (!code_obj->buffer.allocate(code_bytes.size())) {
        std::cerr << "[Tier-2 JIT Error] Failed to allocate JIT buffer!\n";
        return nullptr;
    }
    if (!code_obj->buffer.write(code_bytes.data(), code_bytes.size())) {
        std::cerr << "[Tier-2 JIT Error] Failed to write JIT buffer!\n";
        return nullptr;
    }
    if (!code_obj->buffer.finalize()) {
        std::cerr << "[Tier-2 JIT Error] Failed to finalize (W^X) JIT buffer!\n";
        return nullptr;
    }

    code_obj->entry_point = reinterpret_cast<JITNativeEntryPoint>(const_cast<void*>(code_obj->buffer.entry_point()));
    code_obj->status = JITCodeStatus::COMPILED;
    code_obj->state = CodeState::Active;
    code_obj->tier = JITTier::Tier2_Optimizing;

    return code_obj;
}

} // namespace setun
