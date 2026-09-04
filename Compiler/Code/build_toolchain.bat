@echo off
setlocal enabledelayedexpansion

echo ===================================================================
echo   Building Tersun 1.0.2 Balanced Ternary Quantum (QVM) Toolchain with GCC C++20
echo ===================================================================

cd /d "%~dp0"

echo [1/4] Compiling setunc.exe with -O3 optimizations...
g++ -std=c++20 -O3 -Iinclude ^
    src/main.cpp ^
    src/tafpu/trit.cpp src/tafpu/tafpu.cpp src/tafpu/bitnet_engine.cpp ^
    src/compiler/lexer.cpp src/compiler/parser.cpp src/compiler/types.cpp src/compiler/type_checker.cpp src/compiler/monomorphizer.cpp src/compiler/emitter.cpp src/compiler/llvm_emitter.cpp ^
    src/compiler/llvm2qvm.cpp src/compiler/q_emitter.cpp ^
    src/qvm/qreg.cpp src/qvm/qgate.cpp src/qvm/qvm.cpp ^
    src/vm/vm.cpp src/vm/gc.cpp src/vm/jit_engine.cpp ^
    src/ffi/libsetun_ffi.cpp ^
    src/hardware/verilog_emitter.cpp ^
    src/tools/tpm.cpp src/tools/bindgen.cpp src/tools/debugger.cpp src/tools/formatter.cpp src/tools/lsp_server.cpp ^
    src/game/game_engine_integration.cpp src/kernel/microkernel.cpp ^
    src/graphics/setun2d_bridge.cpp ^
    tests/test_tafpu.cpp tests/test_btvp_trace.cpp tests/test_compiler.cpp tests/test_vm_branch3.cpp ^
    tests/test_part2.cpp tests/test_part3.cpp tests/test_part4.cpp tests/test_part5.cpp ^
    tests/test_phase1_syntax.cpp tests/test_phase2_llvm.cpp tests/test_phase3_compression.cpp ^
    tests/test_phase4_async.cpp tests/test_phase5_lsp.cpp tests/test_phase1_type_checker.cpp tests/test_tersun_101_llvm.cpp tests/test_qvm.cpp tests/test_main.cpp ^
    -lgdi32 -luser32 -o setunc.exe

if %errorlevel% neq 0 (
    echo [ERROR] setunc.exe compilation failed!
    exit /b %errorlevel%
)

echo [2/4] Compiling standalone runtime libtersun_rt.a...
g++ -std=c++20 -O3 -Iinclude -c src/tafpu/trit.cpp src/tafpu/tafpu.cpp src/tafpu/bitnet_engine.cpp src/graphics/setun2d_bridge.cpp
if %errorlevel% neq 0 (
    echo [ERROR] Runtime object compilation failed!
    exit /b %errorlevel%
)
ar rcs libtersun_rt.a trit.o tafpu.o bitnet_engine.o setun2d_bridge.o
del /Q trit.o tafpu.o bitnet_engine.o setun2d_bridge.o > nul 2>&1

echo [3/4] Synchronizing binaries to parent directories...
copy /Y setunc.exe "..\setunc.exe" > nul
copy /Y setunc.exe "..\..\setunc.exe" > nul
copy /Y libtersun_rt.a "..\libtersun_rt.a" > nul
copy /Y libtersun_rt.a "..\..\libtersun_rt.a" > nul

echo [4/4] Build completed successfully!
echo Binary locations:
echo   - %~dp0setunc.exe
echo   - %~dp0libtersun_rt.a
echo   - %~dp0..\setunc.exe
echo   - %~dp0..\..\setunc.exe
echo ===================================================================
