cmake_minimum_required(VERSION 3.16)
project(SetunTernaryCompiler VERSION 1.0.2 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler optimization flags
if (MSVC)
    add_compile_options(/W4 /O2)
else()
    add_compile_options(-Wall -Wextra -pedantic -O3)
endif()

# Include directories
include_directories(include)

# 1. libtafpu: TAFPU Algebraic & BTVP Arithmetic
add_library(tafpu STATIC
    src/tafpu/trit.cpp
    src/tafpu/tafpu.cpp
    src/tafpu/bitnet_engine.cpp
)

# 2. libsetun_compiler: Lexer, Pratt Parser, AST, Emitter, LLVM AOT Emitter, Q-Emitter, LLVM2QVM
add_library(setun_compiler STATIC
    src/compiler/lexer.cpp
    src/compiler/parser.cpp
    src/compiler/types.cpp
    src/compiler/type_checker.cpp
    src/compiler/monomorphizer.cpp
    src/compiler/emitter.cpp
    src/compiler/llvm_emitter.cpp
    src/compiler/llvm2qvm.cpp
    src/compiler/q_emitter.cpp
)
target_link_libraries(setun_compiler PRIVATE tafpu)

# 3. libqvm: Quantum Virtual Machine & 2-Bit Qubit Engine
add_library(qvm STATIC
    src/qvm/qreg.cpp
    src/qvm/qgate.cpp
    src/qvm/qvm.cpp
)

# 4. libsetun_vm: VM Fetch-Decode-Execute, Stack, GC, FFI, Game Engine, Microkernel, Tools
add_library(setun_vm STATIC
    src/vm/vm.cpp
    src/vm/gc.cpp
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
    src/vm/jit_engine.cpp
)
target_link_libraries(setun_vm PRIVATE tafpu setun_compiler qvm)

# 5. libtersun_rt: Standalone Native Runtime for AOT/LLVM compiled binaries
add_library(tersun_rt STATIC
    src/tafpu/trit.cpp
    src/tafpu/tafpu.cpp
    src/tafpu/bitnet_engine.cpp
    src/graphics/setun2d_bridge.cpp
)

# 6. setunc: CLI Executable & Test Runner
add_executable(setunc
    src/main.cpp
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
    tests/test_main.cpp
)
target_link_libraries(setunc PRIVATE setun_vm setun_compiler tafpu qvm)
if (WIN32)
    target_link_libraries(setunc PRIVATE gdi32 user32)
    target_link_libraries(tersun_rt PRIVATE gdi32 user32)
endif()

# Install rules
install(TARGETS setunc tersun_rt DESTINATION bin)
