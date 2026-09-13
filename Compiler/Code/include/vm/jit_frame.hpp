#pragma once

#include "vm/value.hpp"
#include <cstdint>
#include <cstddef>

namespace setun {

class VM;
struct CallFrame;

// ============================================================================
// Gate 5.8 (Advanced): JIT State Model, MachineState & ABI Specification
// ============================================================================

// Register snapshot captured at guard failure / deopt point
struct MachineState {
    uint64_t gpr[16]{0}; // 0:RAX, 1:RCX, 2:RDX, 3:RBX, 4:RSP, 5:RBP, 6:RSI, 7:RDI, 8-15:R8-R15
    uintptr_t rip{0};
    uintptr_t rsp{0};
    uintptr_t rbp{0};
    uint32_t rflags{0};
};

enum class JITExitReason : uint8_t {
    Return = 0,
    Deopt = 1,
    Exception = 2,
    Yield = 3,
    Bailout = 4
};

struct DeoptContinuation {
    uint32_t bytecode_ip{0};
    uint32_t stack_depth{0};
    size_t local_base{0};
    bool should_resume{true};
};

struct JITExit {
    JITExitReason reason{JITExitReason::Return};
    VMValue value;
    DeoptContinuation continuation;
};

struct JITFrame {
    VM* vm{nullptr};
    void* code_object{nullptr};
    VMValue* locals{nullptr};
    size_t num_locals{0};
    VMValue* stack_base{nullptr};
    size_t stack_depth{0};
    CallFrame* prev_call_frame{nullptr};
    JITFrame* prev_jit_frame{nullptr};
    uint32_t safepoint_id{0};
    int64_t deopt_code{0}; // 0 = normal execution, > 0 = deopt bailout request
    MachineState last_machine_state;
    DeoptContinuation continuation;
    JITExitReason exit_reason{JITExitReason::Return};
};

// Standard native entry point:
// Windows x64 ABI:
//   RCX = VM* vm
//   RDX = JITFrame* frame
// Returns:
//   RAX = 64-bit result raw bits (VMValue::raw_)
typedef int64_t (*JITNativeEntryPoint)(VM* vm, JITFrame* frame);

} // namespace setun
