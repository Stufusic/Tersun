#pragma once

#include "vm/jit_frame.hpp"
#include <cstdint>

namespace setun {

extern "C" {

// Error helper for integer division by zero
int64_t setun_jit_helper_div_zero_error(VM* vm);

// Error helper for modulo by zero
int64_t setun_jit_helper_mod_zero_error(VM* vm);

// Safepoint polling slow-path helper
int64_t setun_jit_helper_safepoint_poll(VM* vm, JITFrame* frame, uint32_t safepoint_id);

// General call helper: calls a function (either interpreted or compiled JIT)
int64_t setun_jit_helper_call_function(VM* vm, JITFrame* frame, uint32_t func_idx, uint32_t nargs);

// Polymorphic fallback for binary arithmetic / logic
int64_t setun_jit_helper_generic_binary(uint64_t raw_a, uint64_t raw_b, uint32_t op);

// Deoptimization / bailout helper: syncs state and requests return to interpreter
int64_t setun_jit_helper_bailout(VM* vm, JITFrame* frame, uint32_t bytecode_offset);

// Gate 5.8: Full deoptimization handler with target bytecode IP
int64_t setun_jit_helper_deopt(VM* vm, JITFrame* frame, uint32_t deopt_id, uint32_t target_bytecode_ip);

// Gate 5.8 (Advanced): Deopt handler receiving machine register snapshot
int64_t setun_jit_helper_deopt_machine(VM* vm, JITFrame* frame, MachineState* machine, uint32_t deopt_id);

// G6R.2 Array access helpers for JIT
void* setun_jit_helper_array_raw_data(uint64_t raw_array_val);
int64_t setun_jit_helper_get_element_i64(uint64_t raw_array_val, int64_t idx);
void setun_jit_helper_set_element_i64(uint64_t raw_array_val, int64_t idx, int64_t val);

} // extern "C"

} // namespace setun
