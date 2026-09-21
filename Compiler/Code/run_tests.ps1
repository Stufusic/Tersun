# Standalone Test Runner for Tersun Toolchain
param (
    [string]$Filter = ""
)

$ErrorActionPreference = "Stop"
$CODE_DIR = $PSScriptRoot

Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host "  Tersun 1.0.3 Test Runner (Canonical Validation)                  " -ForegroundColor Cyan
Write-Host "===================================================================" -ForegroundColor Cyan

$TEST_BIN = Join-Path $CODE_DIR "setunc_test.exe"
if (-not (Test-Path $TEST_BIN)) {
    Write-Host "[ERROR] $TEST_BIN not found. Building toolchain first..." -ForegroundColor Red
    & (Join-Path $CODE_DIR "build_toolchain.bat")
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Build failed!" -ForegroundColor Red
        exit 1
    }
}

$sw = [System.Diagnostics.Stopwatch]::StartNew()
& $TEST_BIN
$rc = $LASTEXITCODE
$sw.Stop()

Write-Host ""
if ($rc -eq 0) {
    Write-Host "===================================================================" -ForegroundColor Green
    Write-Host "  ALL TESTS PASSED! Total Elapsed: $($sw.ElapsedMilliseconds) ms   " -ForegroundColor Green
    Write-Host "===================================================================" -ForegroundColor Green
} else {
    Write-Host "===================================================================" -ForegroundColor Red
    Write-Host "  TEST FAILURE DETECTED! Exit code: $rc                            " -ForegroundColor Red
    Write-Host "===================================================================" -ForegroundColor Red
}

exit $rc
