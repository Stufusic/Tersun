#pragma once

#include "vm/machine_ir.hpp"
#include "vm/type_feedback.hpp"
#include "vm/jit_materialization.hpp"
#include "vm/escape_analysis.hpp"
#include <cstdint>
#include <vector>
#include <set>
#include <map>
#include <iostream>

namespace setun {

class Chunk;

// ============================================================================
// Gate 5.9 (Advanced): MachineIR SSA Optimization Passes
// As specified in Compiler/Doc/rv5.9.md (Sections 7-10, 22-25)
// ============================================================================

struct OptimizationFlags {
    bool enable_rge{true};
    bool enable_licm{true};
    bool enable_mic{true};
    bool enable_scalar_replacement{true};
    bool enable_escape_analysis{true};
    bool enable_devirtualization{true};
    bool enable_inlining{true};
    uint32_t max_inline_instructions{32};
    bool enable_vectorization{true};
    uint32_t vector_width{256}; // 256 for AVX2, 128 for SSE
    bool enable_bce{true};
    bool trace_optimizations{false};
};

struct OptimizationStats {
    uint32_t guards_eliminated{0};
    uint32_t instructions_hoisted{0};
    uint32_t mic_stubs_installed{0};
    uint32_t allocations_scalarized{0};
    uint32_t fields_scalarized{0};
    uint32_t escape_candidates{0};
    uint32_t escape_no_escape{0};
    uint32_t methods_devirtualized{0};
    uint32_t methods_inlined{0};
    uint32_t polymorphic_cascades_installed{0};
    uint32_t vector_loops_created{0};
    uint32_t bounds_checks_eliminated{0};
    uint32_t loop_guards_hoisted{0};

    void dump(std::ostream& os = std::cout) const;
};

class MIROptimizer {
public:
    explicit MIROptimizer(const OptimizationFlags& flags = OptimizationFlags())
        : flags_(flags) {}

    OptimizationStats optimize(MIRFunction& func, const ProfileSnapshot* profile = nullptr,
                               std::vector<MaterializationEntry>* out_materializations = nullptr,
                               const std::map<uint32_t, const MIRFunction*>* inline_candidates = nullptr,
                               const Chunk* chunk = nullptr);

    // Pass 1: Redundant Guard Elimination via Dataflow Type-Facts
    uint32_t run_redundant_guard_elimination(MIRFunction& func);

    // Pass 2: Memory-Safe Loop Invariant Code Motion (LICM)
    uint32_t run_loop_invariant_code_motion(MIRFunction& func);

    // Pass 3: ShapeID Inline Caching Lowering
    uint32_t run_shape_inline_caching(MIRFunction& func, const ProfileSnapshot* profile);

    // Pass 4: Monomorphic Method Inlining on Local Objects (G6R.2.2 Phase 2.2-C)
    uint32_t run_monomorphic_method_inlining(MIRFunction& func, const Chunk& chunk);

    // Pass 5: Provably-Local Scalar Replacement & Materialization Generation (G6R.2.2 Phase 2.2-C & 2.2-D)
    uint32_t run_scalar_replacement(MIRFunction& func, std::vector<MaterializationEntry>* out_mat) {
        return run_scalar_replacement(func, nullptr, out_mat);
    }
    uint32_t run_scalar_replacement(MIRFunction& func, const Chunk* chunk, std::vector<MaterializationEntry>* out_mat = nullptr);

    // Pass 6: Advanced Speculative Devirtualization & Polymorphic Cascades (Gate 5.9.2)
    uint32_t run_speculative_devirtualization(MIRFunction& func, const ProfileSnapshot* profile);

    // Pass 7: Leaf Method Inlining for Devirtualized Direct Calls (Gate 5.9.2)
    uint32_t run_leaf_method_inlining(MIRFunction& func, const std::map<uint32_t, const MIRFunction*>& candidates);

    // Pass 8: Canonical Loop Vectorization & SIMD Lowering (G6R.2.1)
    uint32_t run_loop_vectorization(MIRFunction& func);

    // Pass 8.5: Induction Variable Analysis & Bounds Check Elimination (G6R.2.4)
    uint32_t run_bounds_check_elimination(MIRFunction& func, const Chunk* chunk = nullptr);

    // Pass 9: Intra-Block Copy Propagation
    uint32_t run_copy_propagation(MIRFunction& func);

    // Pass 10: Dead Code Elimination
    uint32_t run_dead_code_elimination(MIRFunction& func);

private:
    OptimizationFlags flags_;
    OptimizationStats stats_;
};

} // namespace setun

