@echo off
echo ========================================================
echo   Installing Setun-70 & TAFPU Toolchain to User PATH...  
echo ========================================================
set SDK_BIN=%~dp0bin
setx PATH "%PATH%;%SDK_BIN%"
echo.
echo [SUCCESS] Setun-70 Compiler installed! You can now run 'setunc' from any terminal.
pause
