@echo off
setlocal enabledelayedexpansion

echo ===================================================================
echo   Building Setun 2.0 Balanced Ternary Toolchain with GCC C++20
echo ===================================================================

cd /d "%~dp0"

echo [1/3] Compiling setunc.exe with -O3 optimizations...
g++ -std=c++20 -O3 -Iinclude ^
    src/main.cpp ^
    src/tafpu/trit.cpp src/tafpu/tafpu.cpp src/tafpu/bitnet_engine.cpp ^
    src/compiler/lexer.cpp src/compiler/parser.cpp src/compiler/types.cpp src/compiler/type_checker.cpp src/compiler/monomorphizer.cpp src/compiler/emitter.cpp src/compiler/llvm_emitter.cpp ^
    src/vm/vm.cpp src/vm/gc.cpp src/vm/jit_engine.cpp ^
    src/ffi/libsetun_ffi.cpp ^
    src/hardware/verilog_emitter.cpp ^
    src/tools/tpm.cpp src/tools/bindgen.cpp src/tools/debugger.cpp src/tools/formatter.cpp src/tools/lsp_server.cpp ^
    src/game/game_engine_integration.cpp src/kernel/microkernel.cpp ^
    src/graphics/setun2d_bridge.cpp ^
    tests/test_tafpu.cpp tests/test_btvp_trace.cpp tests/test_compiler.cpp tests/test_vm_branch3.cpp ^
    tests/test_part2.cpp tests/test_part3.cpp tests/test_part4.cpp tests/test_part5.cpp ^
    tests/test_phase1_syntax.cpp tests/test_phase2_llvm.cpp tests/test_phase3_compression.cpp ^
    tests/test_phase4_async.cpp tests/test_phase5_lsp.cpp tests/test_phase1_type_checker.cpp tests/test_main.cpp ^
    -lgdi32 -luser32 -o setunc.exe

if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    exit /b %errorlevel%
)

echo [2/3] Synchronizing setunc.exe to parent directories...
copy /Y setunc.exe "..\setunc.exe" > nul
copy /Y setunc.exe "..\..\setunc.exe" > nul

echo [3/3] Build completed successfully!
echo Binary locations:
echo   - %~dp0setunc.exe
echo   - %~dp0..\setunc.exe
echo   - %~dp0..\..\setunc.exe
echo ===================================================================
