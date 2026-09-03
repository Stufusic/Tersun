@echo off
setlocal
cd /d "%~dp0"

echo ======================================================================
echo   Launching Setun 2.0 BitNet 1.58-bit AI Neural Network Demo
echo ======================================================================

setunc.exe run mnist_bitnet.stn

echo.
pause
