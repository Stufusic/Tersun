#include "vm/induction_variable.hpp"
#include <queue>
#include <algorithm>

namespace setun {

std::vector<NaturalLoop> InductionVariableAnalyzer::analyze_loops(const MIRFunction& func) {
    std::vector<NaturalLoop> loops;
    if (func.blocks.empty()) return loops;

    // Map block id to block pointer
    std::map<uint32_t, const MIRBlock*> id_to_block;
    for (const auto& blk : func.blocks) {
        id_to_block[blk->id] = blk.get();
    }

    // Step 1: Detect Backedges (edges from a block to an ancestor/header)
    uint32_t loop_counter = 0;
    for (const auto& blk : func.blocks) {
        for (const auto& inst : blk->instructions) {
            uint32_t target = 0xFFFFFFFF;
            if (inst.opcode == MIROpcode::JMP || inst.opcode == MIROpcode::JCC) {
                target = inst.target_block;
            }
            if (target == 0xFFFFFFFF || !id_to_block.count(target)) continue;

            // In our CFG, loop headers have id <= current block and target->is_loop_header
            const MIRBlock* tgt_blk = id_to_block[target];
            if (target <= blk->id && tgt_blk->is_loop_header) {
                // Found backedge: blk->id -> target
                NaturalLoop loop;
                loop.id = loop_counter++;
                loop.header_block_id = target;
                loop.backedge_block_id = blk->id;

                // Step 2: Discover all blocks in the Natural Loop
                loop.blocks.insert(target);
                loop.blocks.insert(blk->id);

                std::queue<uint32_t> worklist;
                if (blk->id != target) {
                    worklist.push(blk->id);
                }

                while (!worklist.empty()) {
                    uint32_t curr = worklist.front();
                    worklist.pop();

                    if (!id_to_block.count(curr)) continue;
                    for (uint32_t pred : id_to_block[curr]->predecessors) {
                        if (loop.blocks.insert(pred).second) {
                            worklist.push(pred);
                        }
                    }
                }

                // Step 3: Find Preheader (predecessor of header not in the loop)
                for (uint32_t pred : tgt_blk->predecessors) {
                    if (!loop.contains(pred)) {
                        loop.preheader_block_id = pred;
                        loop.has_preheader = true;
                        break;
                    }
                }

                // Step 4: Identify Loop-Invariant Definitions
                // Values defined outside the loop or constant across all blocks
                std::set<vreg_t> defined_in_loop;
                for (uint32_t b_id : loop.blocks) {
                    if (!id_to_block.count(b_id)) continue;
                    for (const auto& i : id_to_block[b_id]->instructions) {
                        if (i.dest != NO_VREG) defined_in_loop.insert(i.dest);
                    }
                }

                for (vreg_t v = 0; v < func.next_vreg; ++v) {
                    if (!defined_in_loop.count(v)) {
                        loop.invariants.insert(v);
                    }
                }

                // Step 5: Identify Basic Induction Variables
                // Scan loop blocks for IV updates: v_next = v + step
                std::map<vreg_t, int64_t> constant_defs;
                for (const auto& b : func.blocks) {
                    for (const auto& i : b->instructions) {
                        if (i.opcode == MIROpcode::CONST_INT && i.dest != NO_VREG) {
                            constant_defs[i.dest] = i.imm64;
                        }
                    }
                }

                // Look for loop condition at header
                MIRCondition loop_cond = MIRCondition::NONE;
                vreg_t loop_test_var = NO_VREG;
                vreg_t loop_limit_var = NO_VREG;

                for (const auto& i : tgt_blk->instructions) {
                    if (i.opcode == MIROpcode::INT_SUB && i.cond != MIRCondition::NONE) {
                        loop_cond = i.cond;
                        loop_test_var = i.src1;
                        loop_limit_var = i.src2;
                    } else if (i.opcode == MIROpcode::JCC) {
                        if (loop_cond == MIRCondition::NONE) loop_cond = i.cond;
                        if (loop_test_var == NO_VREG) loop_test_var = i.src1;
                    }
                }

                for (uint32_t b_id : loop.blocks) {
                    if (!id_to_block.count(b_id)) continue;
                    for (const auto& i : id_to_block[b_id]->instructions) {
                        if (i.opcode == MIROpcode::INT_ADD) {
                            // Pattern: dest = src1 + src2
                            // where src1 is the IV and src2 is invariant or constant
                            vreg_t iv_vreg = NO_VREG;
                            int64_t step_val = 0;
                            bool has_const_step = false;

                            if (i.imm64 != 0) {
                                iv_vreg = i.src1;
                                step_val = i.imm64;
                                has_const_step = true;
                            } else if (constant_defs.count(i.src2)) {
                                iv_vreg = i.src1;
                                step_val = constant_defs[i.src2];
                                has_const_step = true;
                            } else if (constant_defs.count(i.src1)) {
                                iv_vreg = i.src2;
                                step_val = constant_defs[i.src1];
                                has_const_step = true;
                            } else if (loop.invariants.count(i.src2)) {
                                iv_vreg = i.src1;
                                step_val = 1; // Symbolic positive step
                                has_const_step = false;
                            }

                            if (iv_vreg != NO_VREG) {
                                InductionVariable iv;
                                iv.var_vreg = (i.dest != NO_VREG) ? i.dest : iv_vreg;
                                iv.step = step_val;
                                iv.has_const_step = has_const_step;

                                if (iv_vreg == loop_test_var || i.dest == loop_test_var) {
                                    iv.cond = loop_cond;
                                    iv.limit_vreg = loop_limit_var;
                                    if (constant_defs.count(loop_limit_var)) {
                                        iv.limit_val = constant_defs[loop_limit_var];
                                        iv.has_const_limit = true;
                                    }
                                }

                                compute_iv_range(iv, loop, func);
                                loop.induction_vars[iv.var_vreg] = iv;
                                loop.induction_vars[iv_vreg] = iv;
                            }
                        }
                    }
                }

                loops.push_back(loop);
            }
        }
    }

    return loops;
}

bool InductionVariableAnalyzer::compute_iv_range(InductionVariable& iv, const NaturalLoop& loop, const MIRFunction& func) {
    // If step is positive and condition is LE or LT with limit
    if (iv.has_const_limit && iv.limit_val > 0) {
        iv.max_val = (iv.cond == MIRCondition::LE) ? iv.limit_val : (iv.limit_val - 1);
        iv.min_val = 0; // Natural loop array indices start >= 0
        iv.has_bounded_range = true;
        iv.is_non_negative = true;
        return true;
    }

    // Symbolic limit bounded by non-negative invariant
    if (iv.limit_vreg != NO_VREG && loop.invariants.count(iv.limit_vreg)) {
        iv.min_val = 0;
        iv.is_non_negative = true;
        iv.has_bounded_range = true;
        return true;
    }

    return false;
}

} // namespace setun
