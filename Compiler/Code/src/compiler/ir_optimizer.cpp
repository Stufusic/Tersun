#include "compiler/ir_optimizer.hpp"
#include <unordered_map>
#include <unordered_set>
#include <algorithm>

namespace setun {

bool IROptimizer::optimize_module(IRModule& mod) {
    bool changed = false;
    for (auto& fn : mod.functions) {
        changed |= optimize_function(fn);
    }
    changed |= optimize_function(mod.toplevel);
    return changed;
}

bool IROptimizer::optimize_function(IRFunction& fn) {
    if (fn.instructions.empty()) return false;

    auto cfg = CFG::build_from_function(fn);
    bool any_changed = false;
    round_count_ = 0;

    for (size_t r = 0; r < MAX_OPT_ROUNDS; ++r) {
        bool round_changed = false;
        round_count_++;

        // 1. Local CSE & Copy Propagation per BasicBlock
        for (auto& bb : cfg->blocks()) {
            if (bb->is_unreachable) continue;
            round_changed |= pass_local_cse(*bb);
            round_changed |= pass_copy_propagation(*bb);
        }
        round_changed |= pass_dead_code_elimination(*cfg);

        // 2. Control flow simplifications
        round_changed |= pass_branch_folding(*cfg);
        round_changed |= pass_block_merging(*cfg);
        round_changed |= cfg->eliminate_unreachable();

        any_changed |= round_changed;
        if (!round_changed) break;
    }

    // Tag loop induction variables for baseline JIT / loop analysis
    pass_loop_induction_tagging(*cfg, fn);

    // Rebuild flattened instructions
    cfg->rebuild_instructions(fn);
    return any_changed;
}

bool IROptimizer::pass_local_cse(BasicBlock& bb) {
    bool changed = false;
    std::unordered_map<std::string, IROperand> expr_cache;
    std::unordered_set<size_t> mutated_slots;

    for (auto& inst : bb.instructions) {
        // Invalidate local slots if stored
        if (inst.op == IROp::STORE_LOCAL && inst.dst.is_local()) {
            size_t slot = static_cast<size_t>(inst.dst.val_i);
            mutated_slots.insert(slot);
            std::string pat1 = "loc[" + std::to_string(slot) + ":";
            std::string pat2 = "loc[" + std::to_string(slot) + "]";
            // Invalidate any cache entries referencing this slot
            for (auto it = expr_cache.begin(); it != expr_cache.end();) {
                if (it->first.find(pat1) != std::string::npos ||
                    it->first.find(pat2) != std::string::npos) {
                    it = expr_cache.erase(it);
                } else {
                    ++it;
                }
            }
            continue;
        }

        // Invalidate entire cache on calls or side effects
        if (inst.has_side_effect || inst.op == IROp::CALL || inst.op == IROp::INVOKE_METHOD ||
            inst.op == IROp::STORE_ELEM || inst.op == IROp::STORE_FIELD) {
            expr_cache.clear();
            continue;
        }

        // Check if instruction is a pure candidate for CSE
        bool is_candidate = false;
        switch (inst.op) {
            case IROp::ADD:
            case IROp::SUB:
            case IROp::MUL:
            case IROp::BIT_AND:
            case IROp::BIT_OR:
            case IROp::BIT_XOR:
            case IROp::CMP_EQ:
            case IROp::CMP_NE:
            case IROp::CMP_LT:
            case IROp::CMP_LE:
            case IROp::CMP_GT:
            case IROp::CMP_GE:
            case IROp::LOAD_LOCAL:
                is_candidate = true;
                break;
            default:
                break;
        }

        if (!is_candidate || !inst.dst.is_vreg()) continue;

        // Build canonical key
        std::string s1 = inst.src1.to_string();
        std::string s2 = inst.src2.to_string();

        // Commutative canonical ordering
        if ((inst.op == IROp::ADD || inst.op == IROp::MUL ||
             inst.op == IROp::BIT_AND || inst.op == IROp::BIT_OR ||
             inst.op == IROp::BIT_XOR || inst.op == IROp::CMP_EQ ||
             inst.op == IROp::CMP_NE) && s1 > s2) {
            std::swap(s1, s2);
        }

        std::string key = std::string(ir_op_to_string(inst.op)) + ":" + s1 + ":" + s2;

        auto it = expr_cache.find(key);
        if (it != expr_cache.end()) {
            // Match found! Replace current instruction with MOVE dst, prev_vreg
            inst.op = IROp::MOVE;
            inst.src1 = it->second;
            inst.src2 = IROperand::none();
            changed = true;
            total_cse_eliminations_++;
        } else {
            expr_cache[key] = inst.dst;
        }
    }

    return changed;
}

bool IROptimizer::pass_copy_propagation(BasicBlock& bb) {
    bool changed = false;
    std::unordered_map<int64_t, IROperand> copy_map;

    for (auto& inst : bb.instructions) {
        // Apply existing copy mappings to source operands
        if (inst.src1.is_vreg()) {
            auto it = copy_map.find(inst.src1.val_i);
            if (it != copy_map.end()) {
                inst.src1 = it->second;
                changed = true;
                total_copies_propagated_++;
            }
        }
        if (inst.src2.is_vreg()) {
            auto it = copy_map.find(inst.src2.val_i);
            if (it != copy_map.end()) {
                inst.src2 = it->second;
                changed = true;
                total_copies_propagated_++;
            }
        }
        for (auto& arg : inst.args) {
            if (arg.is_vreg()) {
                auto it = copy_map.find(arg.val_i);
                if (it != copy_map.end()) {
                    arg = it->second;
                    changed = true;
                    total_copies_propagated_++;
                }
            }
        }
        if ((inst.op == IROp::STORE_ELEM || inst.op == IROp::STORE_FIELD) && inst.dst.is_vreg()) {
            auto it = copy_map.find(inst.dst.val_i);
            if (it != copy_map.end()) {
                inst.dst = it->second;
                changed = true;
                total_copies_propagated_++;
            }
        }

        // If this instruction is a MOVE v_dst = v_src or const, record mapping
        if (inst.op == IROp::MOVE && inst.dst.is_vreg()) {
            if (inst.src1.is_vreg() || inst.src1.is_const()) {
                copy_map[inst.dst.val_i] = inst.src1;
            }
        }
    }

    return changed;
}

bool IROptimizer::pass_dead_code_elimination(BasicBlock& bb) {
    // Count uses of each virtual register within the block
    std::unordered_map<int64_t, size_t> vreg_uses;
    for (const auto& inst : bb.instructions) {
        if (inst.src1.is_vreg()) vreg_uses[inst.src1.val_i]++;
        if (inst.src2.is_vreg()) vreg_uses[inst.src2.val_i]++;
        for (const auto& arg : inst.args) {
            if (arg.is_vreg()) vreg_uses[arg.val_i]++;
        }
        if ((inst.op == IROp::STORE_ELEM || inst.op == IROp::STORE_FIELD) && inst.dst.is_vreg()) {
            vreg_uses[inst.dst.val_i]++;
        }
    }

    bool changed = false;
    std::vector<IRInstruction> living_instructions;

    for (const auto& inst : bb.instructions) {
        if (inst.dst.is_vreg() && !inst.has_side_effect && !inst.may_trap &&
            inst.op != IROp::CALL && inst.op != IROp::INVOKE_METHOD && inst.op != IROp::RETURN &&
            inst.op != IROp::STORE_LOCAL && inst.op != IROp::STORE_GLOBAL &&
            inst.op != IROp::STORE_ELEM && inst.op != IROp::STORE_FIELD) {
            if (vreg_uses[inst.dst.val_i] == 0) {
                // Dead temporary eliminated!
                changed = true;
                total_dce_eliminations_++;
                continue;
            }
        }
        living_instructions.push_back(inst);
    }

    if (changed) {
        bb.instructions = std::move(living_instructions);
    }
    return changed;
}

bool IROptimizer::pass_dead_code_elimination(CFG& cfg) {
    // Count uses of each virtual register across all reachable blocks in the CFG
    std::unordered_map<int64_t, size_t> vreg_uses;
    for (const auto& bb : cfg.blocks()) {
        if (bb->is_unreachable) continue;
        for (const auto& inst : bb->instructions) {
            if (inst.src1.is_vreg()) vreg_uses[inst.src1.val_i]++;
            if (inst.src2.is_vreg()) vreg_uses[inst.src2.val_i]++;
            for (const auto& arg : inst.args) {
                if (arg.is_vreg()) vreg_uses[arg.val_i]++;
            }
            if ((inst.op == IROp::STORE_ELEM || inst.op == IROp::STORE_FIELD) && inst.dst.is_vreg()) {
                vreg_uses[inst.dst.val_i]++;
            }
        }
    }

    bool changed = false;
    for (auto& bb : cfg.blocks()) {
        if (bb->is_unreachable) continue;
        std::vector<IRInstruction> living_instructions;
        for (const auto& inst : bb->instructions) {
            if (inst.dst.is_vreg() && !inst.has_side_effect && !inst.may_trap &&
                inst.op != IROp::CALL && inst.op != IROp::INVOKE_METHOD && inst.op != IROp::RETURN &&
                inst.op != IROp::STORE_LOCAL && inst.op != IROp::STORE_GLOBAL &&
                inst.op != IROp::STORE_ELEM && inst.op != IROp::STORE_FIELD) {
                if (vreg_uses[inst.dst.val_i] == 0) {
                    // Dead temporary eliminated!
                    changed = true;
                    total_dce_eliminations_++;
                    continue;
                }
            }
            living_instructions.push_back(inst);
        }
        if (living_instructions.size() != bb->instructions.size()) {
            bb->instructions = std::move(living_instructions);
            changed = true;
        }
    }
    return changed;
}

bool IROptimizer::pass_branch_folding(CFG& cfg) {
    bool changed = false;

    for (auto& bb : cfg.blocks()) {
        if (bb->instructions.empty() || bb->is_unreachable) continue;
        auto& term = bb->instructions.back();

        if (term.op == IROp::BRANCH_IF_TRUE && term.src1.kind == IROperand::Kind::CONST_BOOL) {
            bool cond = (term.src1.val_i != 0);
            if (cond) {
                // Always true -> transform to unconditional JUMP
                term.op = IROp::JUMP;
                term.src1 = term.src2;
                term.src2 = IROperand::none();
                changed = true;
            } else {
                // Always false -> eliminate branch (fallthrough)
                bb->instructions.pop_back();
                changed = true;
            }
        } else if (term.op == IROp::BRANCH_IF_FALSE && term.src1.kind == IROperand::Kind::CONST_BOOL) {
            bool cond = (term.src1.val_i != 0);
            if (!cond) {
                // Always false -> transform to unconditional JUMP
                term.op = IROp::JUMP;
                term.src1 = term.src2;
                term.src2 = IROperand::none();
                changed = true;
            } else {
                // Always true -> eliminate branch (fallthrough)
                bb->instructions.pop_back();
                changed = true;
            }
        }
    }

    return changed;
}

bool IROptimizer::pass_block_merging(CFG& cfg) {
    bool any_merged = false;
    while (cfg.merge_blocks()) {
        any_merged = true;
        total_blocks_merged_++;
    }
    return any_merged;
}

bool IROptimizer::pass_loop_induction_tagging(CFG& cfg, IRFunction& fn) {
    (void)fn;
    bool tagged_any = false;

    for (const auto& be : cfg.back_edges()) {
        BasicBlock* header = be.second;
        if (!header) continue;

        // Scan instructions in loop header & latch for induction patterns: i = i + c
        for (auto& inst : header->instructions) {
            if (inst.op == IROp::ADD || inst.op == IROp::SUB) {
                if (inst.src2.is_const() || inst.src1.is_const()) {
                    inst.is_induction_var = true;
                    tagged_any = true;
                }
            }
        }
    }

    return tagged_any;
}

} // namespace setun
