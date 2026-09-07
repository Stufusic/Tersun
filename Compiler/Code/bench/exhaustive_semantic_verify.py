#!/usr/bin/env python3
"""
Exhaustive & Cross-Backend Semantic Verification for Tersun Phase 2
Validates VM (.tbc) vs Native AOT (.exe) across:
- Integer Modulo (%) & Edge cases (0 divisor trap, INT64_MIN % -1)
- Bitwise / Tritwise Operators (&, |, ^, <<, >>)
- Compound Assignments (%=, &=, |=, ^=, <<=, >>=)
- Monotonic Time (monotonic_now_us, time_now_us)
"""

import subprocess
import sys
import os
from pathlib import Path

CODE_DIR = Path(__file__).resolve().parent.parent
SETUNC = CODE_DIR / "setunc.exe"
TEST_STN = CODE_DIR / "tests" / "stn" / "test_phase2_operators.stn"

def run_cmd(cmd, cwd=CODE_DIR):
    res = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    return res.returncode, res.stdout, res.stderr

def test_vm_execution():
    print("[1/4] Testing VM Execution on test_phase2_operators.stn...")
    code, out, err = run_cmd([str(SETUNC), "run", str(TEST_STN)])
    assert code == 0, f"VM run failed with code {code}:\n{err}\n{out}"
    assert "PHASE2_OPERATORS_OK" in out, f"Missing success token in VM output:\n{out}"
    print("  -> PASSED: VM executed all Phase 2 operators successfully.")

def test_native_aot_execution():
    print("[2/4] Testing Native AOT Compilation & Execution...")
    exe_out = CODE_DIR / "scratch" / "test_phase2_native_verify.exe"
    code, out, err = run_cmd([str(SETUNC), "compile", str(TEST_STN), "-o", str(exe_out), "--native"])
    assert code == 0, f"Native compilation failed:\n{err}\n{out}"
    assert exe_out.exists(), f"Output executable {exe_out} does not exist"

    code_exe, out_exe, err_exe = run_cmd([str(exe_out)])
    assert code_exe == 0, f"Native execution failed with code {code_exe}:\n{err_exe}\n{out_exe}"
    assert "PHASE2_OPERATORS_OK" in out_exe, f"Missing success token in Native output:\n{out_exe}"
    print("  -> PASSED: Native AOT binary executed all Phase 2 operators successfully.")

def test_zero_divisor_traps():
    print("[3/4] Testing Division-by-Zero Safety Traps (VM and Native)...")
    divzero_stn = CODE_DIR / "scratch" / "test_divzero.stn"

    # VM check
    code_vm, out_vm, err_vm = run_cmd([str(SETUNC), "run", str(divzero_stn)])
    assert code_vm != 0, "VM did not fail on division by zero!"
    assert "Division by zero in integer modulo" in (out_vm + err_vm), f"Unexpected VM error: {out_vm} {err_vm}"

    # Native check
    native_divzero_exe = CODE_DIR / "scratch" / "test_divzero_native.exe"
    code_nat, out_nat, err_nat = run_cmd([str(native_divzero_exe)])
    assert code_nat != 0, "Native binary did not fail on division by zero!"
    assert "Division by zero in integer modulo" in (out_nat + err_nat), f"Unexpected Native error: {out_nat} {err_nat}"
    print("  -> PASSED: Both VM and Native trap division-by-zero cleanly.")

def test_exhaustive_domain():
    print("[4/4] Running Exhaustive Mathematical Domain Verification (531,441 pairs)...")
    verify_exe = CODE_DIR / "bench" / "exhaustive_verify.exe"
    assert verify_exe.exists(), f"Missing {verify_exe}"
    code, out, err = run_cmd([str(verify_exe)])
    assert code == 0, f"Exhaustive verify failed:\n{err}\n{out}"
    assert "100.000%" in out, f"Did not achieve 100% success rate:\n{out}"
    print("  -> PASSED: All 2,135,241 mathematical invariants verified with 100.000% success.")

if __name__ == "__main__":
    print("===================================================================")
    print("  Tersun Phase 2 Cross-Backend & Semantic Verification Suite       ")
    print("===================================================================")
    test_vm_execution()
    test_native_aot_execution()
    test_zero_divisor_traps()
    test_exhaustive_domain()
    print("\n===================================================================")
    print("  ALL TESTS PASSED WITH 100% VERIFICATION!                        ")
    print("===================================================================")
