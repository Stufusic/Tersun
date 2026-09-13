#pragma once

#include "compiler/arena.hpp"
#include <string>
#include <vector>
#include <memory>
#include <cstdint>

namespace setun {

// ============================================================================
// Gate 5.5A: Compiler Arena Subsystem
// Phase-scoped memory arenas for AST, Tree Optimizer, and Linear IR passes.
// Guarantees O(1) bulk memory reclamation without GC overhead.
// ============================================================================

enum class CompilerPhase : uint8_t {
    PARSING_AST,
    TREE_OPTIMIZATION,
    IR_LOWERING,
    BYTECODE_EMISSION
};

class CompilerArena {
public:
    explicit CompilerArena(size_t default_block_size = ArenaAllocator::DEFAULT_BLOCK_SIZE)
        : ast_arena_(default_block_size),
          opt_arena_(default_block_size),
          ir_arena_(default_block_size) {}

    ~CompilerArena() = default;

    // Non-copyable, movable
    CompilerArena(const CompilerArena&) = delete;
    CompilerArena& operator=(const CompilerArena&) = delete;
    CompilerArena(CompilerArena&&) noexcept = default;
    CompilerArena& operator=(CompilerArena&&) noexcept = default;

    // Phase-specific allocators
    ArenaAllocator& ast_arena() noexcept { return ast_arena_; }
    ArenaAllocator& opt_arena() noexcept { return opt_arena_; }
    ArenaAllocator& ir_arena() noexcept { return ir_arena_; }

    const ArenaAllocator& ast_arena() const noexcept { return ast_arena_; }
    const ArenaAllocator& opt_arena() const noexcept { return opt_arena_; }
    const ArenaAllocator& ir_arena() const noexcept { return ir_arena_; }

    // O(1) Phase Lifecycle Reset
    // Instantly frees all temporary memory allocated during that compilation phase.
    void reset_ast() {
        ast_arena_.reset();
    }

    void reset_opt() {
        opt_arena_.reset();
    }

    void reset_ir() {
        ir_arena_.reset();
    }

    void reset_all() {
        ast_arena_.reset();
        opt_arena_.reset();
        ir_arena_.reset();
    }

    // Allocation metrics
    size_t total_allocated() const noexcept {
        return ast_arena_.total_allocated() +
               opt_arena_.total_allocated() +
               ir_arena_.total_allocated();
    }

private:
    ArenaAllocator ast_arena_; // AST nodes post-parse & canonicalization
    ArenaAllocator opt_arena_; // Intermediate tree expressions during 8-pass optimizer
    ArenaAllocator ir_arena_;  // Linear IR instructions, CFG blocks, & metadata
};

// RAII Helper to reset specific arena at phase completion
class PhaseResetGuard {
public:
    enum class Target { AST, OPT, IR, ALL };

    PhaseResetGuard(CompilerArena& arena, Target target)
        : arena_(arena), target_(target) {}

    ~PhaseResetGuard() {
        switch (target_) {
            case Target::AST: arena_.reset_ast(); break;
            case Target::OPT: arena_.reset_opt(); break;
            case Target::IR:  arena_.reset_ir(); break;
            case Target::ALL: arena_.reset_all(); break;
        }
    }

    PhaseResetGuard(const PhaseResetGuard&) = delete;
    PhaseResetGuard& operator=(const PhaseResetGuard&) = delete;

private:
    CompilerArena& arena_;
    Target target_;
};

} // namespace setun
