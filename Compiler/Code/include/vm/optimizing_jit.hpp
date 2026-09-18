#pragma once

#include "vm/machine_ir.hpp"
#include "vm/type_feedback.hpp"
#include "vm/mir_optimizer.hpp"
#include "vm/linear_scan.hpp"
#include "vm/jit_buffer.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_manager.hpp"
#include <memory>
#include <vector>

namespace setun {

// ============================================================================
// Gate 5.9 (Advanced): Optimizing JIT Compiler (Tier-2)
// As specified in Compiler/Doc/rv5.9.md
// ============================================================================

class OptimizingJITCompiler {
public:
    explicit OptimizingJITCompiler(const OptimizationFlags& flags = OptimizationFlags())
        : opt_flags_(flags) {}

    // Compile bytecode chunk with profile snapshot to Tier-2 native code
    std::shared_ptr<JITCodeObject> compile_tier2(
        const Chunk& chunk,
        uint32_t func_ip,
        const ProfileSnapshot* profile = nullptr);

    const OptimizationStats& last_stats() const { return last_stats_; }

private:
    OptimizationFlags opt_flags_;
    OptimizationStats last_stats_;
};

} // namespace setun
