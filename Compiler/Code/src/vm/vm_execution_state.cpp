// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Canonical VM Execution State Implementation
// ==============================================================================

#include "vm/vm_execution_state.hpp"
#include "vm/jit_frame.hpp"
#include "vm/jit_deopt.hpp"

namespace setun {

VMExecutionState::VMExecutionState() {
    operand_stack_.reserve(4096);
}

void VMExecutionState::reset() noexcept {
    operand_stack_.clear();
    call_stack_.clear();
    ip_ = nullptr;
    locals_ = nullptr;
    locals_count_ = 0;
    transient_tos_ = TransientTOSState{};
    exception_state_ = VMExceptionState{};
    in_jit_handoff_ = false;
}

void VMExecutionState::materialize() noexcept {
    if (transient_tos_.depth == 0) return;

    if (transient_tos_.depth == 1) {
        operand_stack_.push_back(transient_tos_.tos0);
    } else if (transient_tos_.depth == 2) {
        operand_stack_.push_back(transient_tos_.tos1);
        operand_stack_.push_back(transient_tos_.tos0);
    }

    transient_tos_.depth = 0;
    transient_tos_.tos0 = VMValue{};
    transient_tos_.tos1 = VMValue{};
}

void VMExecutionState::handoff() noexcept {
    materialize();
    in_jit_handoff_ = true;
}

void VMExecutionState::restore() noexcept {
    in_jit_handoff_ = false;
    transient_tos_.depth = 0;
}

void VMExecutionState::deopt(const JITFrame* /*jit_frame*/, const DeoptRecord* /*deopt_rec*/) noexcept {
    in_jit_handoff_ = false;
    transient_tos_.depth = 0;
}

void VMExecutionState::visit_roots(const std::function<void(VMValue)>& visitor) const {
    // 1. Visit operand stack
    for (const auto& val : operand_stack_) {
        visitor(val);
    }

    // 2. Visit transient TOS slots if active
    if (transient_tos_.depth >= 1) visitor(transient_tos_.tos0);
    if (transient_tos_.depth == 2) visitor(transient_tos_.tos1);

    // 3. Visit locals
    if (locals_ && locals_count_ > 0) {
        for (size_t i = 0; i < locals_count_; ++i) {
            visitor(locals_[i]);
        }
    }

    // 4. Visit exception value if present
    if (exception_state_.has_exception) {
        visitor(exception_state_.exception_val);
    }
}

} // namespace setun
