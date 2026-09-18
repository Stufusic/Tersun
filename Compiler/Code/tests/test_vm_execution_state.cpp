// ==============================================================================
// Tersun Gate 6 Rebuild (G6R) Unit Tests: Canonical VM Execution State
// Tests Layer 1/2/3 invariant transitions, materialize(), handoff(), restore(),
// and GC roots traversal.
// ==============================================================================

#include "vm/vm_execution_state.hpp"
#include <cassert>
#include <iostream>
#include <vector>

using namespace setun;

static void test_vm_execution_state_invariants() {
    std::cout << "[TEST] VMExecutionState Invariants & Protocol...\n";

    VMExecutionState state;
    assert(state.stack_depth() == 0);
    assert(state.transient_tos().depth == 0);

    // 1. Transient TOS manipulation
    state.transient_tos().tos0 = VMValue(42);
    state.transient_tos().depth = 1;
    assert(state.stack_depth() == 0);

    // 2. materialize() flushes TOS into canonical operand stack
    state.materialize();
    assert(state.transient_tos().depth == 0);
    assert(state.stack_depth() == 1);
    assert(state.operand_stack().back() == VMValue(42));

    // 3. 2-slot TOS materialize
    state.transient_tos().tos1 = VMValue(100); // bottom slot
    state.transient_tos().tos0 = VMValue(200); // top slot
    state.transient_tos().depth = 2;

    state.materialize();
    assert(state.transient_tos().depth == 0);
    assert(state.stack_depth() == 3);
    assert(state.operand_stack()[1] == VMValue(100));
    assert(state.operand_stack()[2] == VMValue(200));

    // 4. handoff() & restore()
    state.transient_tos().tos0 = VMValue(999);
    state.transient_tos().depth = 1;
    state.handoff();
    assert(state.transient_tos().depth == 0);
    assert(state.stack_depth() == 4);
    assert(state.operand_stack().back() == VMValue(999));

    state.restore();
    assert(state.transient_tos().depth == 0);

    // 5. GC roots visitor
    std::vector<VMValue> visited;
    state.visit_roots([&](VMValue val) {
        visited.push_back(val);
    });
    assert(visited.size() == 4);
    assert(visited[0] == VMValue(42));
    assert(visited[1] == VMValue(100));
    assert(visited[2] == VMValue(200));
    assert(visited[3] == VMValue(999));

    // 6. Reset
    state.reset();
    assert(state.stack_depth() == 0);
    assert(state.transient_tos().depth == 0);

    std::cout << "  -> PASS: VMExecutionState invariants verified.\n";
}

int main() {
    test_vm_execution_state_invariants();
    return 0;
}
