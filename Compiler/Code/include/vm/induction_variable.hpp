#pragma once

#include "vm/machine_ir.hpp"
#include <cstdint>
#include <vector>
#include <map>
#include <set>
#include <optional>
#include <iostream>

namespace setun {

// ============================================================================
// Gate 6R.2.4: Induction Variable Analysis & Loop Range Modeling
// As specified in Compiler/Doc/G6.2.md (Sections 34-39)
// ============================================================================

struct InductionVariable {
    vreg_t var_vreg{NO_VREG};
    vreg_t init_vreg{NO_VREG};
    int64_t init_val{0};
    bool has_const_init{false};

    int64_t step{1};
    bool has_const_step{true};

    vreg_t limit_vreg{NO_VREG};
    int64_t limit_val{0};
    bool has_const_limit{false};

    MIRCondition cond{MIRCondition::NONE};

    int64_t min_val{0};
    int64_t max_val{0};
    bool has_bounded_range{false};
    bool is_non_negative{false};
};

struct NaturalLoop {
    uint32_t id{0};
    uint32_t header_block_id{0};
    uint32_t backedge_block_id{0};
    uint32_t preheader_block_id{0};
    bool has_preheader{false};

    std::set<uint32_t> blocks;
    std::vector<uint32_t> exit_blocks;
    std::map<vreg_t, InductionVariable> induction_vars;
    std::set<vreg_t> invariants;

    bool contains(uint32_t block_id) const {
        return blocks.count(block_id) > 0;
    }
};

class InductionVariableAnalyzer {
public:
    // Identify all natural loops, backedges, invariants and induction variables
    static std::vector<NaturalLoop> analyze_loops(const MIRFunction& func);

    // Compute symbolic and constant ranges for an induction variable
    static bool compute_iv_range(InductionVariable& iv, const NaturalLoop& loop, const MIRFunction& func);
};

} // namespace setun
