cmake_minimum_required(VERSION 3.20)
project(TersunCompiler VERSION 1.0.3 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler optimization & architecture flags
if (MSVC)
    add_compile_options(/W4 /O2 /arch:AVX2 /openmp)
    add_compile_definitions(TERSUN_PIN_REGISTERS)
else()
    add_compile_options(-Wall -Wextra -O3 -mavx2 -mfma -fopenmp)
    add_link_options(-fopenmp)
    add_compile_definitions(TERSUN_PIN_REGISTERS)
endif()

# Include directories
include_directories(include)

# 1. libtafpu: TAFPU Algebraic, Balanced Ternary Arithmetic & BitNet Engine
add_library(tafpu STATIC
    src/tafpu/trit.cpp
    src/tafpu/tafpu.cpp
    src/tafpu/bitnet_engine.cpp
)

# 2. libsetun_compiler: AST, Lexer, Parser, IR, Monomorphizer, Emitters
add_library(setun_compiler STATIC
    src/compiler/lexer.cpp
    src/compiler/parser.cpp
    src/compiler/tree_canonicalize.cpp
    src/compiler/tree_optimizer.cpp
    src/compiler/opt_ir.cpp
    src/compiler/cfg.cpp
    src/compiler/ir_optimizer.cpp
    src/compiler/ir_to_bytecode.cpp
    src/compiler/module_resolver.cpp
    src/compiler/types.cpp
    src/compiler/type_checker.cpp
    src/compiler/monomorphizer.cpp
    src/compiler/emitter.cpp
    src/compiler/llvm_emitter.cpp
    src/compiler/llvm2qvm.cpp
    src/compiler/q_emitter.cpp
    src/compiler/tensor_ir.cpp
    src/compiler/canonical_ternary_ir.cpp
)
target_link_libraries(setun_compiler PRIVATE tafpu)

# 3. libqvm: Quantum Virtual Machine & 2-Bit Qubit Engine
add_library(qvm STATIC
    src/qvm/qreg.cpp
    src/qvm/qgate.cpp
    src/qvm/qcircuit_opt.cpp
    src/qvm/qvm.cpp
)

# 4. libsetun_vm: VM Interpreter, JIT Tier-1, Tier-2 JIT (MachineIR), GC, Superinstructions
add_library(setun_vm STATIC
    src/vm/vm.cpp
    src/vm/vm_profiler.cpp
    src/vm/vm_telemetry.cpp
    src/vm/vm_execution_state.cpp
    src/vm/tos_cache.cpp
    src/vm/field_ic.cpp
    src/vm/tier_cost_model.cpp
    src/vm/superinstruction.cpp
    src/vm/array_storage.cpp
    src/vm/gc.cpp
    src/vm/type_descriptor.cpp
    src/vm/gc_heap.cpp
    src/vm/gc_engine.cpp
    src/vm/gc_debug.cpp
    src/vm/jit_engine.cpp
    src/vm/x64_assembler.cpp
    src/vm/jit_buffer.cpp
    src/vm/jit_runtime_helpers.cpp
    src/vm/jit_lir.cpp
    src/vm/jit_safepoint.cpp
    src/vm/baseline_jit.cpp
    src/vm/jit_manager.cpp
    src/vm/jit_osr.cpp
    src/vm/jit_deopt.cpp
    src/vm/machine_ir.cpp
    src/vm/type_feedback.cpp
    src/vm/jit_materialization.cpp
    src/vm/linear_scan.cpp
    src/vm/escape_analysis.cpp
    src/vm/induction_variable.cpp
    src/vm/mir_optimizer.cpp
    src/vm/optimizing_jit.cpp
    src/vm/runtime_metadata.cpp
    src/vm/inline_cache.cpp
    src/ffi/libsetun_ffi.cpp
    src/hardware/verilog_emitter.cpp
    src/tools/tpm.cpp
    src/tools/bindgen.cpp
    src/tools/debugger.cpp
    src/tools/formatter.cpp
    src/tools/lsp_server.cpp
    src/game/game_engine_integration.cpp
    src/kernel/microkernel.cpp
    src/graphics/setun2d_bridge.cpp
)
target_link_libraries(setun_vm PRIVATE tafpu setun_compiler qvm tersun_ai_core)

# -----------------------------------------------------------------------------
# Gate 7 & 7.1 Portable AI Compute Architecture Subsystems
# -------------------------------------------------------------
# 1. Strictly Scalar Kernel Reference (G7.1-SOC: no auto-vectorization, no SIMD)
add_library(tersun_kernel_scalar STATIC
    src/tensor/kernels/bitnet_scalar_ladder.cpp
)
target_include_directories(tersun_kernel_scalar PUBLIC include)
if(NOT MSVC)
    target_compile_options(tersun_kernel_scalar PRIVATE -O3 -fno-tree-vectorize)
endif()

# 2. AVX2 Multiplication-Free Microkernel Subsystem
add_library(tersun_kernel_avx2 STATIC
    src/tensor/kernels/bitnet_avx2.cpp
)
target_include_directories(tersun_kernel_avx2 PUBLIC include)
if(MSVC)
    target_compile_options(tersun_kernel_avx2 PRIVATE /arch:AVX2)
else()
    target_compile_options(tersun_kernel_avx2 PRIVATE -mavx2 -mfma)
endif()

# 3. ARM64 NEON Vector Microkernel Subsystem
add_library(tersun_kernel_neon STATIC
    src/tensor/kernels/bitnet_neon.cpp
)
target_include_directories(tersun_kernel_neon PUBLIC include)

# 4. Core Tensor & Portable Compute Runtime
add_library(tersun_ai_core STATIC
    src/tensor/tensor.cpp
    src/tensor/edge_arena.cpp
    src/tensor/safetensors_loader.cpp
    src/tensor/bitnet_model.cpp
    src/compiler/tensor_ir.cpp
    src/runtime/target_capabilities.cpp
    src/runtime/kernel_registry.cpp
)
target_include_directories(tersun_ai_core PUBLIC include)
target_link_libraries(tersun_ai_core PUBLIC
    tersun_kernel_scalar
    tersun_kernel_avx2
    tersun_kernel_neon
)

# 4b. Neural Network & LLM Model Runtime (Transformer, Attention, Tokenizer, Sampler, InferenceSession)
add_library(tersun_nn STATIC
    src/tensor/nn/ops/activations.cpp
    src/tensor/nn/ops/attention_kernels.cpp
    src/tensor/nn/ops/attention_ops.cpp
    src/tensor/nn/ops/bit_linear.cpp
    src/tensor/nn/ops/rmsnorm.cpp
    src/tensor/nn/ops/rope.cpp
    src/tensor/nn/ops/softmax.cpp
    src/tensor/nn/models/bitnet_model.cpp
    src/tensor/nn/models/decoder_block.cpp
    src/tensor/nn/models/feed_forward.cpp
    src/tensor/nn/memory/kv_cache.cpp
    src/tensor/nn/graph/liveness_planner.cpp
    src/tensor/nn/format/model_manifest.cpp
    src/tensor/nn/format/model_package.cpp
    src/tensor/nn/format/tokenizer.cpp
    src/tensor/nn/format/chat_template.cpp
    src/tensor/nn/runtime/inference_session.cpp
    src/tensor/nn/runtime/parallel_planner.cpp
)
target_include_directories(tersun_nn PUBLIC include)
target_link_libraries(tersun_nn PUBLIC tersun_ai_core)

# 5. CLI Options Module
add_library(tersun_cli_options STATIC
    src/cli/ai_options.cpp
)
target_include_directories(tersun_cli_options PUBLIC include)

# 6. Minimalist Standalone Edge AI Runner (Zero dependencies on VM/Graphics/JIT)
add_executable(tersun_ai_runner
    src/cli/ai_runner_main.cpp
)
target_include_directories(tersun_ai_runner PUBLIC include)
target_link_libraries(tersun_ai_runner PRIVATE
    tersun_ai_core
    tersun_cli_options
)

# 7. libtersun_rt: Standalone Native Runtime for AOT compiled binaries
add_library(tersun_rt STATIC
    src/tafpu/trit.cpp
    src/tafpu/tafpu.cpp
    src/tafpu/bitnet_engine.cpp
    src/graphics/setun2d_bridge.cpp
)

# 8. setunc: Main CLI Executable
add_executable(setunc
    src/main.cpp
    src/tools/test_runner_stub.cpp
)
target_link_libraries(setunc PRIVATE setun_vm setun_compiler tafpu qvm tersun_nn tersun_ai_core tersun_kernel_avx2 tersun_cli_options)
if (WIN32)
    target_link_libraries(setunc PRIVATE gdi32 user32 comdlg32)
    target_link_libraries(tersun_rt PRIVATE gdi32 user32 comdlg32)
endif()

# 7. setunc_test: Standalone Self-Test Suite
set(TEST_SOURCES
    tests/test_tafpu.cpp
    tests/test_btvp_trace.cpp
    tests/test_compiler.cpp
    tests/test_vm_branch3.cpp
    tests/test_part2.cpp
    tests/test_part3.cpp
    tests/test_part4.cpp
    tests/test_part5.cpp
    tests/test_phase1_syntax.cpp
    tests/test_phase2_llvm.cpp
    tests/test_phase3_compression.cpp
    tests/test_phase4_async.cpp
    tests/test_phase5_lsp.cpp
    tests/test_phase1_type_checker.cpp
    tests/test_tersun_101_llvm.cpp
    tests/test_qvm.cpp
    tests/test_stn_semantics.cpp
    tests/test_gc_tracing_stress.cpp
    tests/test_gc_alloc_stress.cpp
    tests/test_baseline_jit.cpp
    tests/test_osr_deopt.cpp
    tests/test_optimizing_jit.cpp
    tests/test_auto_tiering.cpp
    tests/test_inline_cache.cpp
    tests/test_fixed_frame_arena.cpp
    tests/test_superinstruction.cpp
    tests/test_array_storage.cpp
    tests/test_cross_tier_differential.cpp
    tests/test_bce_safety.cpp
    tests/test_target_capabilities.cpp
    tests/test_tensor_core.cpp
    tests/test_portable_compute.cpp
    tests/test_ternary_language_contract.cpp
    tests/test_dendrite_canonical_lowering.cpp
    tests/test_mutable_slice_contract.cpp
    tests/test_gemv_canonical_lowering.cpp
    tests/test_tuple_and_destructuring.cpp
    tests/test_tensor_view_indexing.cpp
    tests/test_split_at_mut_safety.cpp
    tests/test_epilogue_fusion_parity.cpp
    tests/test_hierarchical_gemm.cpp
    tests/test_main.cpp
    tests/test_main_runner.cpp
)

add_executable(setunc_test ${TEST_SOURCES})
target_compile_definitions(setunc_test PRIVATE TERSUN_VM_INSTRUMENTED)
target_link_libraries(setunc_test PRIVATE setun_vm setun_compiler tafpu qvm tersun_ai_core tersun_cli_options)
if (WIN32)
    target_link_libraries(setunc_test PRIVATE gdi32 user32 comdlg32)
endif()

# Gate 7.3.3 Separated Test Targets (Correctness & Regression)
add_executable(gate733_frontend_tests
    tests/test_tuple_and_destructuring.cpp
    tests/test_tensor_view_indexing.cpp
    tests/test_split_at_mut_safety.cpp
    tests/gate733_frontend_runner.cpp
)
target_compile_definitions(gate733_frontend_tests PRIVATE TERSUN_VM_INSTRUMENTED)
target_link_libraries(gate733_frontend_tests PRIVATE setun_vm setun_compiler tafpu qvm tersun_ai_core tersun_cli_options)
if (WIN32)
    target_link_libraries(gate733_frontend_tests PRIVATE gdi32 user32 comdlg32)
endif()

add_executable(gate733_ir_tests
    tests/test_dendrite_canonical_lowering.cpp
    tests/test_gemv_canonical_lowering.cpp
    tests/test_epilogue_fusion_parity.cpp
    tests/gate733_ir_runner.cpp
)
target_compile_definitions(gate733_ir_tests PRIVATE TERSUN_VM_INSTRUMENTED)
target_link_libraries(gate733_ir_tests PRIVATE setun_vm setun_compiler tafpu qvm tersun_ai_core tersun_cli_options)
if (WIN32)
    target_link_libraries(gate733_ir_tests PRIVATE gdi32 user32 comdlg32)
endif()

add_executable(gate733_gemm_tests
    tests/test_hierarchical_gemm.cpp
    tests/gate733_gemm_runner.cpp
)
target_compile_definitions(gate733_gemm_tests PRIVATE TERSUN_VM_INSTRUMENTED)
target_link_libraries(gate733_gemm_tests PRIVATE setun_vm setun_compiler tafpu qvm tersun_ai_core tersun_cli_options)
if (WIN32)
    target_link_libraries(gate733_gemm_tests PRIVATE gdi32 user32 comdlg32)
endif()

add_executable(gate733_aot_tests
    tests/test_aot_suite.cpp
    tests/gate733_aot_runner.cpp
)
target_compile_definitions(gate733_aot_tests PRIVATE TERSUN_VM_INSTRUMENTED)
target_link_libraries(gate733_aot_tests PRIVATE setun_vm setun_compiler tafpu qvm tersun_ai_core tersun_cli_options)
if (WIN32)
    target_link_libraries(gate733_aot_tests PRIVATE gdi32 user32 comdlg32)
endif()

# Gate 7.3.3 Performance Harness (Standalone Benchmark Executable, Decoupled from CTest Pass/Fail)
add_executable(gate733_benchmark
    benchmarks/bench_4tier_execution.cpp
)
target_link_libraries(gate733_benchmark PRIVATE setun_compiler tersun_ai_core)
if (WIN32)
    target_link_libraries(gate733_benchmark PRIVATE gdi32 user32 comdlg32)
endif()

# Gate 7.5 LLM Execution Optimization Benchmark Harness
add_executable(gate75_benchmark
    benchmarks/bench_llm_execution.cpp
)
target_link_libraries(gate75_benchmark PRIVATE tersun_nn tersun_kernel_avx2 tersun_ai_core)
if (WIN32)
    target_link_libraries(gate75_benchmark PRIVATE gdi32 user32 comdlg32)
endif()

# Gate 7.4 LLM Runtime Correctness Tests
add_executable(gate74_runtime_tests
    tests/nn/test_tokenizer_suite.cpp
    tests/nn/test_sampler_contract.cpp
    tests/nn/test_chat_and_manifest.cpp
    tests/nn/test_kv_cache_parity.cpp
    tests/nn/test_zero_alloc_session.cpp
    tests/gate74_runtime_runner.cpp
)
target_link_libraries(gate74_runtime_tests PRIVATE tersun_nn tersun_kernel_avx2 tersun_ai_core)
if (WIN32)
    target_link_libraries(gate74_runtime_tests PRIVATE gdi32 user32 comdlg32)
endif()

# Gate 7.5 LLM Execution Optimization Tests
add_executable(gate75_tests
    tests/nn/test_attention_parity.cpp
    tests/gate75_runner.cpp
)
target_link_libraries(gate75_tests PRIVATE tersun_nn tersun_kernel_avx2 tersun_ai_core)
if (WIN32)
    target_link_libraries(gate75_tests PRIVATE gdi32 user32 comdlg32)
endif()

# Testing & CTest
enable_testing()
add_test(NAME Gate75Execution COMMAND gate75_tests)
add_test(NAME Gate74Runtime COMMAND gate74_runtime_tests)
add_test(NAME Gate733Frontend COMMAND gate733_frontend_tests)
add_test(NAME Gate733IR COMMAND gate733_ir_tests)
add_test(NAME Gate733GEMM COMMAND gate733_gemm_tests)
add_test(NAME Gate733AOT COMMAND gate733_aot_tests)
add_test(NAME AllTests COMMAND setunc_test)
add_test(NAME CrossTierDifferential COMMAND setunc_test)
add_test(NAME BCESafety COMMAND setunc_test)

# Installation rules
install(TARGETS setunc setunc_test tersun_rt tersun_ai_runner gate733_frontend_tests gate733_ir_tests gate733_gemm_tests gate733_aot_tests gate733_benchmark gate74_runtime_tests gate75_tests gate75_benchmark DESTINATION bin)


