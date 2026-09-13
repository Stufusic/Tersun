#pragma once

#include "compiler/opt_ir.hpp"
#include "compiler/cfg.hpp"

namespace setun {

class IROptimizer {
public:
    IROptimizer() = default;

    bool optimize_function(IRFunction& fn);
    bool optimize_module(IRModule& mod);

    // Individual Pass APIs (có thể gọi độc lập cho test / ablation)
    bool pass_local_cse(BasicBlock& bb);
    bool pass_copy_propagation(BasicBlock& bb);
    bool pass_dead_code_elimination(BasicBlock& bb);
    bool pass_branch_folding(CFG& cfg);
    bool pass_block_merging(CFG& cfg);
    bool pass_loop_induction_tagging(CFG& cfg, IRFunction& fn);

    size_t round_count() const { return round_count_; }
    size_t total_cse_eliminations() const { return total_cse_eliminations_; }
    size_t total_copies_propagated() const { return total_copies_propagated_; }
    size_t total_dce_eliminations() const { return total_dce_eliminations_; }
    size_t total_blocks_merged() const { return total_blocks_merged_; }

private:
    static constexpr size_t MAX_OPT_ROUNDS = 8;

    size_t round_count_{0};
    size_t total_cse_eliminations_{0};
    size_t total_copies_propagated_{0};
    size_t total_dce_eliminations_{0};
    size_t total_blocks_merged_{0};
};

} // namespace setun
