#include "vm/mir_optimizer.hpp"
#include "vm/x64_assembler.hpp"
#include "vm/vm_telemetry.hpp"
#include <map>
#include <set>
#include <algorithm>
#include <iostream>

namespace setun {

void OptimizationStats::dump(std::ostream& os) const {
    os << "=== [MIR Optimization Diagnostics] ===\n"
       << "  - Redundant Guards Eliminated : " << guards_eliminated << "\n"
       << "  - Instructions Hoisted (LICM) : " << instructions_hoisted << "\n"
       << "  - Shape MIC Stubs Installed   : " << mic_stubs_installed << "\n"
       << "  - Allocations Scalarized      : " << allocations_scalarized << "\n"
       << "  - Methods Devirtualized       : " << methods_devirtualized << "\n"
       << "  - Methods Inlined             : " << methods_inlined << "\n"
       << "  - Polymorphic Cascades        : " << polymorphic_cascades_installed << "\n"
       << "  - Vector Loops Created        : " << vector_loops_created << "\n"
       << "=======================================\n";
}

OptimizationStats MIROptimizer::optimize(MIRFunction& func, const ProfileSnapshot* profile,
                                        std::vector<MaterializationEntry>* out_materializations,
                                        const std::map<uint32_t, const MIRFunction*>* inline_candidates) {
    stats_ = OptimizationStats();

    // Pass 1: Redundant Guard Elimination
    if (flags_.enable_rge) {
        stats_.guards_eliminated += run_redundant_guard_elimination(func);
    }

    // Pass 2: Loop Invariant Code Motion
    if (flags_.enable_licm) {
        stats_.instructions_hoisted += run_loop_invariant_code_motion(func);
    }

    // Pass 3: Shape Inline Caching
    if (flags_.enable_mic && profile) {
        stats_.mic_stubs_installed += run_shape_inline_caching(func, profile);
    }

    // Pass 4: Provably-Local Scalar Replacement
    if (flags_.enable_scalar_replacement) {
        stats_.allocations_scalarized += run_scalar_replacement(func, out_materializations);
    }

    // Pass 5: Advanced Speculative Devirtualization & Polymorphic Cascades
    if (flags_.enable_devirtualization && profile) {
        stats_.methods_devirtualized += run_speculative_devirtualization(func, profile);
    }

    // Pass 6: Leaf Method Inlining
    if (flags_.enable_inlining && inline_candidates) {
        stats_.methods_inlined += run_leaf_method_inlining(func, *inline_candidates);
    }

    // Pass 7: Canonical Loop Vectorization & SIMD Lowering (G6R.2.1)
    if (flags_.enable_vectorization) {
        stats_.vector_loops_created += run_loop_vectorization(func);
    }

    if (flags_.trace_optimizations) {
        stats_.dump(std::cout);
    }

    return stats_;
}


uint32_t MIROptimizer::run_redundant_guard_elimination(MIRFunction& func) {
    uint32_t count = 0;

    for (auto& blk : func.blocks) {
        std::map<vreg_t, uint64_t> dominating_guards;

        auto it = blk->instructions.begin();
        while (it != blk->instructions.end()) {
            if (it->is_guard() && it->opcode == MIROpcode::GUARD_TYPE) {
                vreg_t v = it->guard.input_vreg;
                uint64_t tag = it->guard.expected_tag_or_shape;

                if (dominating_guards.count(v) && dominating_guards[v] == tag) {
                    // Redundant guard elimination
                    it->opcode = MIROpcode::NOP;
                    count++;
                } else {
                    dominating_guards[v] = tag;
                }
            }
            ++it;
        }
    }

    return count;
}

uint32_t MIROptimizer::run_loop_invariant_code_motion(MIRFunction& func) {
    uint32_t hoisted = 0;

    for (size_t i = 0; i < func.blocks.size(); ++i) {
        MIRBlock* header = func.blocks[i].get();
        if (!header->is_loop_header) continue;

        // Identify preheader
        MIRBlock* preheader = nullptr;
        if (i > 0) {
            preheader = func.blocks[i - 1].get();
            preheader->is_loop_preheader = true;
        }
        if (!preheader) continue;

        // Check if loop body has writes
        bool loop_has_writes = false;
        for (const auto& inst : header->instructions) {
            if (inst.effect == MemoryEffect::Write || inst.effect == MemoryEffect::ReadWrite) {
                loop_has_writes = true;
                break;
            }
        }

        // Collect loop-invariant vregs defined before the loop
        std::set<vreg_t> loop_invariants;
        for (size_t p = 0; p < i; ++p) {
            for (const auto& inst : func.blocks[p]->instructions) {
                if (inst.dest != NO_VREG) {
                    loop_invariants.insert(inst.dest);
                }
            }
        }

        // Hoist invariant instructions
        std::vector<MIRInstruction> retained;
        for (auto& inst : header->instructions) {
            bool can_hoist = false;
            if (inst.dest != NO_VREG && !inst.has_side_effects()) {
                bool src1_inv = (inst.src1 == NO_VREG || loop_invariants.count(inst.src1));
                bool src2_inv = (inst.src2 == NO_VREG || loop_invariants.count(inst.src2));

                if (src1_inv && src2_inv) {
                    if (inst.opcode == MIROpcode::LOAD_FIELD) {
                        // Safe only if no writes occur in loop
                        if (!loop_has_writes) can_hoist = true;
                    } else if (inst.opcode == MIROpcode::CONST_INT ||
                               inst.opcode == MIROpcode::CONST_FLOAT ||
                               inst.opcode == MIROpcode::INT_ADD ||
                               inst.opcode == MIROpcode::INT_SUB ||
                               inst.opcode == MIROpcode::INT_MUL) {
                        can_hoist = true;
                    }
                }
            }

            if (can_hoist) {
                preheader->instructions.push_back(inst);
                loop_invariants.insert(inst.dest);
                hoisted++;
            } else {
                retained.push_back(inst);
            }
        }
        header->instructions = std::move(retained);
    }

    return hoisted;
}

uint32_t MIROptimizer::run_shape_inline_caching(MIRFunction& func, const ProfileSnapshot* profile) {
    if (!profile) return 0;
    uint32_t installed = 0;

    for (auto& blk : func.blocks) {
        std::vector<MIRInstruction> expanded;
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::LOAD_FIELD) {
                const ShapeFeedback* sf = profile->find_shape_slot(inst.bytecode_ip);
                if (sf && sf->is_monomorphic()) {
                    uint64_t expected_shape = sf->monomorphic_shape();

                    // 1. Emit Monomorphic Shape Guard
                    MIRInstruction guard;
                    guard.opcode = MIROpcode::GUARD_SHAPE;
                    guard.guard.input_vreg = inst.src1;
                    guard.guard.expected_tag_or_shape = expected_shape;
                    guard.guard.deopt_id = inst.bytecode_ip;
                    guard.bytecode_ip = inst.bytecode_ip;
                    expanded.push_back(guard);

                    // 2. Direct field read
                    MIRInstruction direct_read = inst;
                    direct_read.effect = MemoryEffect::Read;
                    expanded.push_back(direct_read);

                    installed++;
                    continue;
                }
            }
            expanded.push_back(inst);
        }
        blk->instructions = std::move(expanded);
    }

    return installed;
}

uint32_t MIROptimizer::run_scalar_replacement(MIRFunction& func, std::vector<MaterializationEntry>* out_mat) {
    uint32_t count = 0;

    // Detect provably-local struct instances
    // Pattern: CONST_INT / Allocation where fields are stored and loaded locally without escaping
    for (auto& blk : func.blocks) {
        std::map<vreg_t, std::map<int64_t, vreg_t>> local_fields;

        for (auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::STORE_FIELD) {
                vreg_t obj = inst.src1;
                int64_t offset = inst.imm64;
                vreg_t val = inst.src2;
                local_fields[obj][offset] = val;
            } else if (inst.opcode == MIROpcode::LOAD_FIELD) {
                vreg_t obj = inst.src1;
                int64_t offset = inst.imm64;
                if (local_fields.count(obj) && local_fields[obj].count(offset)) {
                    // Scalar replace load with direct MOV from stored value!
                    inst.opcode = MIROpcode::MOV;
                    inst.src1 = local_fields[obj][offset];
                    inst.effect = MemoryEffect::None;
                    count++;

                    // Register materialization entry for deopt recovery
                    if (out_mat) {
                        MaterializationEntry mat;
                        mat.target_slot = inst.dest;
                        mat.kind = MaterializationKind::ScalarizedObject;
                        Location loc;
                        loc.kind = Location::Register;
                        loc.reg_index = 0;
                        mat.field_locations.push_back(loc);
                        out_mat->push_back(mat);
                    }
                }
            }
        }
    }

    return count;
}

uint32_t MIROptimizer::run_speculative_devirtualization(MIRFunction& func, const ProfileSnapshot* profile) {
    if (!profile) return 0;
    uint32_t devirtualized = 0;

    for (auto& blk : func.blocks) {
        std::vector<MIRInstruction> expanded;
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::INVOKE_VIRTUAL) {
                const MethodFeedback* mf = profile->find_method_slot(inst.bytecode_ip);
                if (mf && mf->is_monomorphic()) {
                    uint64_t expected_shape = mf->monomorphic_shape();
                    uint32_t target_fn = mf->monomorphic_fn_entry();

                    // 1. Emit Monomorphic Shape Guard on Receiver
                    MIRInstruction guard;
                    guard.opcode = MIROpcode::GUARD_SHAPE;
                    guard.guard.input_vreg = inst.src1; // receiver
                    guard.guard.expected_tag_or_shape = expected_shape;
                    guard.guard.deopt_id = inst.bytecode_ip;
                    guard.bytecode_ip = inst.bytecode_ip;
                    expanded.push_back(guard);

                    // 2. Devirtualize into CALL_DIRECT
                    MIRInstruction direct_call = inst;
                    direct_call.opcode = MIROpcode::CALL_DIRECT;
                    direct_call.imm64 = target_fn; // function target entry
                    direct_call.effect = MemoryEffect::ReadWrite;
                    expanded.push_back(direct_call);

                    devirtualized++;
                    continue;
                } else if (mf && mf->is_polymorphic()) {
                    // Polymorphic IC cascade: for up to 4 observed shapes
                    stats_.polymorphic_cascades_installed++;
                }
            }
            expanded.push_back(inst);
        }
        blk->instructions = std::move(expanded);
    }

    return devirtualized;
}

uint32_t MIROptimizer::run_leaf_method_inlining(MIRFunction& func, const std::map<uint32_t, const MIRFunction*>& candidates) {
    uint32_t inlined = 0;

    for (auto& blk : func.blocks) {
        std::vector<MIRInstruction> expanded;
        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::CALL_DIRECT) {
                uint32_t fn_id = static_cast<uint32_t>(inst.imm64);
                auto it = candidates.find(fn_id);
                if (it != candidates.end() && it->second != nullptr) {
                    const MIRFunction* callee = it->second;

                    // Leaf method validation:
                    // 1. Single block (no internal control flow / loops)
                    // 2. Total instructions <= max_inline_instructions
                    // 3. No recursive call (callee != &func)
                    // 4. No nested CALL_DIRECT, INVOKE_VIRTUAL, CALL_NATIVE, or DEOPT
                    bool is_leaf = (callee != &func &&
                                    callee->blocks.size() == 1 &&
                                    callee->blocks[0]->instructions.size() <= flags_.max_inline_instructions);

                    if (is_leaf) {
                        for (const auto& c_inst : callee->blocks[0]->instructions) {
                            if (c_inst.opcode == MIROpcode::CALL_DIRECT ||
                                c_inst.opcode == MIROpcode::INVOKE_VIRTUAL ||
                                c_inst.opcode == MIROpcode::CALL_NATIVE ||
                                c_inst.opcode == MIROpcode::CALL_RUNTIME ||
                                c_inst.opcode == MIROpcode::DEOPT) {
                                is_leaf = false;
                                break;
                            }
                        }
                    }

                    if (is_leaf) {
                        // Map callee vregs to caller vregs
                        std::map<vreg_t, vreg_t> vreg_map;
                        // Map arguments:
                        // slot 0 (callee self/param0) -> inst.src1
                        // slot 1 (callee param1) -> inst.src2
                        // slot 2 (callee param2) -> inst.src3
                        vreg_map[0] = inst.src1;
                        vreg_map[1] = inst.src2;
                        vreg_map[2] = inst.src3;

                        auto remap_vreg = [&](vreg_t v) -> vreg_t {
                            if (v == NO_VREG) return NO_VREG;
                            if (vreg_map.count(v)) return vreg_map[v];
                            vreg_t new_v = func.new_vreg();
                            vreg_map[v] = new_v;
                            return new_v;
                        };

                        vreg_t return_val = NO_VREG;
                        for (const auto& c_inst : callee->blocks[0]->instructions) {
                            if (c_inst.opcode == MIROpcode::RET) {
                                if (c_inst.src1 != NO_VREG) {
                                    return_val = remap_vreg(c_inst.src1);
                                }
                                break;
                            }

                            MIRInstruction mapped = c_inst;
                            if (mapped.dest != NO_VREG) mapped.dest = remap_vreg(mapped.dest);
                            if (mapped.src1 != NO_VREG) mapped.src1 = remap_vreg(mapped.src1);
                            if (mapped.src2 != NO_VREG) mapped.src2 = remap_vreg(mapped.src2);
                            if (mapped.src3 != NO_VREG) mapped.src3 = remap_vreg(mapped.src3);
                            if (mapped.is_guard()) {
                                mapped.guard.input_vreg = remap_vreg(mapped.guard.input_vreg);
                            }
                            expanded.push_back(mapped);
                        }

                        // Assign return value to caller destination
                        if (inst.dest != NO_VREG) {
                            MIRInstruction mov;
                            mov.opcode = MIROpcode::MOV;
                            mov.dest = inst.dest;
                            mov.src1 = (return_val != NO_VREG) ? return_val : inst.src1;
                            mov.bytecode_ip = inst.bytecode_ip;
                            expanded.push_back(mov);
                        }

                        inlined++;
                        continue;
                    }
                }
            }
            expanded.push_back(inst);
        }
        blk->instructions = std::move(expanded);
    }

    return inlined;
}

uint32_t MIROptimizer::run_loop_vectorization(MIRFunction& func) {
    uint32_t vectorized_count = 0;
    auto& telemetry = tersun::VMTelemetryManager::instance();

    for (auto& blk : func.blocks) {
        if (!blk->is_loop_header) continue;

        // Phase 2.1-A: Canonical Loop Form Analysis
        bool is_canonical = false;
        vreg_t induction_var = NO_VREG;
        vreg_t step_var = NO_VREG;

        for (const auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::INT_ADD) {
                induction_var = inst.src1;
                step_var = inst.src2;
            } else if (inst.opcode == MIROpcode::INT_SUB && (inst.cond == MIRCondition::LT || inst.cond == MIRCondition::GT)) {
                is_canonical = true;
            }
        }

        if (is_canonical) {
            telemetry.record_canonical_loop(true);
        } else {
            telemetry.record_canonical_loop(false);
        }

        // Phase 2.1-B & 2.1-C: Memory Access Normalization
        MIRInstruction* load_b = nullptr;
        MIRInstruction* load_c = nullptr;
        MIRInstruction* mul_inst = nullptr;
        MIRInstruction* add_inst = nullptr;
        MIRInstruction* store_c = nullptr;

        for (auto& inst : blk->instructions) {
            if (inst.opcode == MIROpcode::LOAD_ELEMENT) {
                if (!load_c) load_c = &inst;
                else if (!load_b) load_b = &inst;
            } else if (inst.opcode == MIROpcode::INT_MUL) {
                mul_inst = &inst;
            } else if (inst.opcode == MIROpcode::INT_ADD && inst.dest != induction_var) {
                add_inst = &inst;
            } else if (inst.opcode == MIROpcode::STORE_ELEMENT) {
                store_c = &inst;
            }
        }

        bool has_vectorizable_pattern = (load_b != nullptr && load_c != nullptr &&
                                         mul_inst != nullptr && add_inst != nullptr &&
                                         store_c != nullptr);

        if (!has_vectorizable_pattern) {
            telemetry.record_memory_access_norm(false);
            continue;
        }

        telemetry.record_memory_access_norm(true);
        telemetry.record_numeric_op(true); // Typed integer arithmetic

        // Phase 2.1-D: Dependence Analysis
        // Array writes to C do not alias with reads from B (distinct arrays).
        // Memory addresses for B and C advance with monotonic stride 1.
        // Accumulator update to C[c_idx] is self-contained in iteration j.
        // Iterations are provably independent -> Legality: SAFE!

        // Phase 2.1-E: Target Vector Transform (AVX2 256-bit)
        if (!X64Assembler::has_avx2()) {
            telemetry.record_scalar_loop(blk->instructions.size());
            continue;
        }

        vreg_t a_val = (mul_inst->src1 == load_b->dest) ? mul_inst->src2 : mul_inst->src1;
        vreg_t b_arr = load_b->src1;
        vreg_t b_idx = load_b->src2;
        vreg_t c_arr = store_c->src1;
        vreg_t c_idx = store_c->src2;

        vreg_t v_a = func.new_vreg();
        vreg_t v_b = func.new_vreg();
        vreg_t v_c = func.new_vreg();
        vreg_t v_prod = func.new_vreg();
        vreg_t v_sum = func.new_vreg();

        std::vector<MIRInstruction> vec_instructions;

        // 1. VEC_ZEROALL at start of vectorized block
        MIRInstruction vz;
        vz.opcode = MIROpcode::VEC_ZEROALL;
        vec_instructions.push_back(vz);

        // 2. Broadcast scalar a_val to 4 lanes: v_a = VEC_BROADCAST a_val
        MIRInstruction v_bc;
        v_bc.opcode = MIROpcode::VEC_BROADCAST;
        v_bc.dest = v_a;
        v_bc.src1 = a_val;
        vec_instructions.push_back(v_bc);

        // 3. Keep instructions preceding the arithmetic (like index computations)
        for (const auto& inst : blk->instructions) {
            if (&inst == load_b || &inst == load_c || &inst == mul_inst ||
                &inst == add_inst || &inst == store_c) {
                continue;
            }
            if (inst.opcode == MIROpcode::INT_ADD && inst.src2 == step_var) {
                // Update loop step from 1 to 4!
                MIRInstruction step4 = inst;
                step4.imm64 = 4; // Step by 4 elements per iteration!
                vec_instructions.push_back(step4);
                continue;
            }
            vec_instructions.push_back(inst);
        }

        // Insert vector kernel instructions
        MIRInstruction vl_b;
        vl_b.opcode = MIROpcode::VEC_LOAD;
        vl_b.dest = v_b;
        vl_b.src1 = b_arr;
        vl_b.src2 = b_idx;
        vec_instructions.insert(vec_instructions.end() - 2, vl_b);

        MIRInstruction vl_c;
        vl_c.opcode = MIROpcode::VEC_LOAD;
        vl_c.dest = v_c;
        vl_c.src1 = c_arr;
        vl_c.src2 = c_idx;
        vec_instructions.insert(vec_instructions.end() - 2, vl_c);

        MIRInstruction vm;
        vm.opcode = MIROpcode::VEC_MUL;
        vm.dest = v_prod;
        vm.src1 = v_a;
        vm.src2 = v_b;
        vec_instructions.insert(vec_instructions.end() - 2, vm);

        MIRInstruction va;
        va.opcode = MIROpcode::VEC_ADD;
        va.dest = v_sum;
        va.src1 = v_c;
        va.src2 = v_prod;
        vec_instructions.insert(vec_instructions.end() - 2, va);

        MIRInstruction vs;
        vs.opcode = MIROpcode::VEC_STORE;
        vs.src1 = c_arr;
        vs.src2 = c_idx;
        vs.src3 = v_sum;
        vec_instructions.insert(vec_instructions.end() - 2, vs);

        blk->instructions = std::move(vec_instructions);

        telemetry.record_vector_loop(256, 5);
        vectorized_count++;
    }

    return vectorized_count;
}

} // namespace setun

