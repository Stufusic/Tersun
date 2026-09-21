@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo [Tersun Toolchain] Configuring via CMake and Ninja...
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
if %errorlevel% neq 0 (
    echo [ERROR] CMake configuration failed!
    exit /b %errorlevel%
)

echo [Tersun Toolchain] Building targets via CMake...
cmake --build build --target setunc setunc_test gate733_frontend_tests gate733_ir_tests gate733_gemm_tests gate733_aot_tests gate733_benchmark
if %errorlevel% neq 0 (
    echo [ERROR] CMake build failed!
    exit /b %errorlevel%
)

echo [Tersun Toolchain] Build complete. Running CTest regression suite...
ctest --test-dir build --output-on-failure
if %errorlevel% neq 0 (
    echo [ERROR] CTest regression tests failed!
    exit /b %errorlevel%
)

echo [Tersun Toolchain] All tests succeeded!
