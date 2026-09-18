#pragma once
// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Canonical VM Execution State Contract
// Defines the 3-Layer Formal Runtime Protocol:
//   Layer 1: Logical State (Tersun Language & Bytecode Semantics)
//   Layer 2: Canonical Memory State (VMExecutionState - Single Source of Truth)
//   Layer 3: Transient Optimized State (TOS Cache, Registers, JIT Frame)
//
// Protocol Methods:
//   - materialize() : Syncs Transient State -> Canonical Memory State
//   - handoff()     : Prepares Canonical State for JIT / OSR entry
//   - restore()     : Recovers Canonical State from JIT completion
//   - deopt()       : Reconstructs Canonical State from CPU trap / bailout
// ==============================================================================

#include "vm/value.hpp"
#include "vm/fixed_frame_arena.hpp"
#include <vector>
#include <cstdint>
#include <functional>
#include <stdexcept>

namespace setun {

// Forward declarations
class GCHeap;
struct JITFrame;
struct DeoptRecord;

// Transient Top-of-Stack Cache State
struct TransientTOSState {
    VMValue tos0{};
    VMValue tos1{};
    uint8_t depth{0}; // 0, 1, or 2 active slots
};

// Exception State Descriptor
struct VMExceptionState {
    bool has_exception{false};
    VMValue exception_val{};
    uint32_t unwind_frame_depth{0};
    uint32_t handler_ip{0};
};

class VMExecutionState {
public:
    VMExecutionState();
    ~VMExecutionState() = default;

    // Non-copyable, movable
    VMExecutionState(const VMExecutionState&) = delete;
    VMExecutionState& operator=(const VMExecutionState&) = delete;
    VMExecutionState(VMExecutionState&&) noexcept = default;
    VMExecutionState& operator=(VMExecutionState&&) noexcept = default;

    // ==========================================================================
    // Layer 2: Canonical State Accessors (Source of Truth)
    // ==========================================================================
    [[nodiscard]] std::vector<VMValue>& operand_stack() noexcept { return operand_stack_; }
    [[nodiscard]] const std::vector<VMValue>& operand_stack() const noexcept { return operand_stack_; }
    [[nodiscard]] size_t stack_depth() const noexcept { return operand_stack_.size(); }

    [[nodiscard]] FixedFrameArena& call_stack() noexcept { return call_stack_; }
    [[nodiscard]] const FixedFrameArena& call_stack() const noexcept { return call_stack_; }

    [[nodiscard]] const uint8_t* ip() const noexcept { return ip_; }
    void set_ip(const uint8_t* ip) noexcept { ip_ = ip; }

    [[nodiscard]] VMValue* locals() noexcept { return locals_; }
    [[nodiscard]] const VMValue* locals() const noexcept { return locals_; }
    void set_locals(VMValue* loc, size_t count) noexcept { locals_ = loc; locals_count_ = count; }
    [[nodiscard]] size_t locals_count() const noexcept { return locals_count_; }

    [[nodiscard]] VMExceptionState& exception_state() noexcept { return exception_state_; }
    [[nodiscard]] const VMExceptionState& exception_state() const noexcept { return exception_state_; }

    // ==========================================================================
    // Layer 3: Transient Optimized State Handlers
    // ==========================================================================
    [[nodiscard]] TransientTOSState& transient_tos() noexcept { return transient_tos_; }
    [[nodiscard]] const TransientTOSState& transient_tos() const noexcept { return transient_tos_; }

    // ==========================================================================
    // Formal Runtime Protocol Methods
    // ==========================================================================
    
    // materialize(): Flushes transient TOS cache directly into canonical operand_stack_.
    // Invariant: After materialize(), transient_tos_.depth == 0, operand_stack reflects true logical state.
    void materialize() noexcept;

    // handoff(): Prepares canonical state before passing control to JIT / OSR.
    // Invariant: Materializes TOS, verifies frame boundary, marks handoff active.
    void handoff() noexcept;

    // restore(): Recovers canonical state when JIT returns control to the interpreter.
    // Invariant: Syncs back return values, restores frames, resets handoff flag.
    void restore() noexcept;

    // deopt(): Reconstructs full canonical state from deoptimization bailout.
    void deopt(const JITFrame* jit_frame, const DeoptRecord* deopt_rec) noexcept;

    // GC Roots Enumeration
    // Invariant: Scans operand_stack, locals, and active call frames for Tri-Color GC mark.
    void visit_roots(const std::function<void(VMValue)>& visitor) const;

    // Reset state for new execution run
    void reset() noexcept;

private:
    // Canonical Memory Buffers
    std::vector<VMValue> operand_stack_;
    FixedFrameArena call_stack_;
    const uint8_t* ip_{nullptr};
    VMValue* locals_{nullptr};
    size_t locals_count_{0};

    // Transient State Representation
    TransientTOSState transient_tos_;

    // Exception Tracking
    VMExceptionState exception_state_;

    // Flags
    bool in_jit_handoff_{false};
};

} // namespace setun

namespace tersun {
    using setun::VMExecutionState;
    using setun::TransientTOSState;
    using setun::VMExceptionState;
}
