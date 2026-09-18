#pragma once

#include "vm/opcode.hpp"
#include "compiler/emitter.hpp"
#include <cstddef>
#include <cstdint>
#include <unordered_set>
#include <string>
#include <vector>

namespace setun {

// ============================================================================
// Gate 6.0-D: Semantic Barrier Engine
// Strictly prohibits fusing instructions across safety, GC, exception,
// call-frame, or control-flow divergence boundaries.
// ============================================================================
class SemanticBarrier {
public:
    // Returns true if the opcode represents a semantic barrier that must never
    // be contained within or crossed by a fused superinstruction.
    static inline bool is_barrier(OpCode op) noexcept {
        switch (op) {
            // Function call and method invocation boundaries (frame & TOS changes)
            case OpCode::OP_CALL:
            case OpCode::OP_INVOKE_METHOD:
            case OpCode::OP_CALL_INDIRECT:
            case OpCode::OP_CLOSURE:
            case OpCode::OP_RET:

            // Dynamic allocation boundaries (GC Safepoint requires canonical stack)
            case OpCode::OP_NEW_INSTANCE:
            case OpCode::OP_NEW_ARRAY:

            // Exception & Unwinding boundaries
            case OpCode::OP_TRY:
            case OpCode::OP_THROW:
            case OpCode::OP_POP_TRY:

            // Non-linear control flow
            case OpCode::OP_BRANCH_3:
            case OpCode::OP_HALT:
                return true;

            default:
                return false;
        }
    }

    // Returns true if the opcode is a control flow jump
    static inline bool is_jump(OpCode op) noexcept {
        return op == OpCode::OP_JUMP ||
               op == OpCode::OP_JUMP_IF_FALSE ||
               op == OpCode::OP_BRANCH_3 ||
               op == OpCode::OP_TRY;
    }
};

// ============================================================================
// Gate 6.0-D: Superinstruction Framework & Registry
// Manages pattern matching, cost evaluation, and semantic barrier checks.
// ============================================================================
class SuperInstructionRegistry {
public:
    struct FusionTelemetry {
        uint64_t store_pop_fused{0};
        uint64_t load_load_fused{0};
        uint64_t add_local_store_fused{0};
        uint64_t mul_add_fused{0};
        uint64_t total_fusions{0};

        void reset() { *this = FusionTelemetry{}; }
    };

    static FusionTelemetry& telemetry() noexcept {
        static FusionTelemetry s_telem;
        return s_telem;
    }

    // Scans a canonical chunk to locate all absolute jump and function entry targets.
    // Any target in this set CANNOT have a superinstruction fused across it.
    static std::unordered_set<size_t> collect_jump_targets(const Chunk& chunk);

    // Verifies whether candidate instructions from [start_pc, end_pc) can be safely fused.
    // Invariant: start_pc CAN be a jump target, but no intermediate instruction
    // in (start_pc, end_pc) may be a jump target or a semantic barrier.
    static bool can_fuse_range(const Chunk& chunk,
                               size_t start_pc,
                               size_t end_pc,
                               const std::unordered_set<size_t>& jump_targets);
};

} // namespace setun
