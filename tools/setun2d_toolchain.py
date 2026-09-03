"""
================================================================================
SETUN 2.0 - SETUN2D GRAPHICS TOOLCHAIN (Python Automation)
Tự động biên dịch Renderer Java 25 GPU, quản lý tài nguyên và liên kết Setun Studio
================================================================================
"""

import os
import sys
import subprocess
import shutil

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
JAVA_SRC = os.path.join(SCRIPT_DIR, "setun2d", "Setun2DRenderer.java")

def check_environment():
    print("[1/3] Checking Toolchain Environment (C++, Java, Python)...")
    has_java = shutil.which("java") is not None
    has_javac = shutil.which("javac") is not None
    has_gcc = shutil.which("g++") is not None

    print(f"  -> Java Runtime (JRE): {'[OK] ' + shutil.which('java') if has_java else '[MISSING]'}")
    print(f"  -> Java Compiler (JDK): {'[OK] ' + shutil.which('javac') if has_javac else '[MISSING]'}")
    print(f"  -> GCC C++20 Compiler:  {'[OK] ' + shutil.which('g++') if has_gcc else '[MISSING]'}")

    if not (has_java and has_javac):
        print("[ERROR] Java JDK is required for Setun2D GPU Graphics Engine.")
        return False
    return True

def compile_java_renderer():
    print("\n[2/3] Compiling Setun2DRenderer.java (Hardware-Accelerated 2D GPU Engine)...")
    tools_setun2d = os.path.join(SCRIPT_DIR, "setun2d")
    if not os.path.exists(tools_setun2d):
        os.makedirs(tools_setun2d, exist_ok=True)

    cmd = ["javac", "-d", SCRIPT_DIR, os.path.join(tools_setun2d, "Setun2DRenderer.java")]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, cwd=SCRIPT_DIR)
        if proc.returncode == 0:
            print("  -> [SUCCESS] Setun2DRenderer.class compiled successfully!")
            return True
        else:
            print(f"  -> [ERROR] javac failed:\n{proc.stderr}")
            return False
    except Exception as e:
        print(f"  -> [ERROR]: {e}")
        return False

def run_setun_game(stn_path="snake_2d_gui.stn"):
    print(f"\n[3/3] Launching Setun2D Game: {stn_path}...")
    setunc = os.path.join(ROOT_DIR, "setunc.exe")
    if not os.path.exists(setunc):
        setunc = os.path.join(ROOT_DIR, "Compiler", "Code", "setunc.exe")

    target_file = stn_path if os.path.isabs(stn_path) else os.path.join(ROOT_DIR, stn_path)
    if not os.path.exists(target_file):
        print(f"[ERROR] Target Setun script not found: {target_file}")
        return False

    cmd = [setunc, "run", target_file]
    print(f"Executing: {' '.join(cmd)}")
    subprocess.run(cmd, cwd=ROOT_DIR)

def main():
    if not check_environment():
        sys.exit(1)

    if not compile_java_renderer():
        sys.exit(1)

    if len(sys.argv) > 1 and sys.argv[1] == "run":
        target = sys.argv[2] if len(sys.argv) > 2 else "snake_2d_gui.stn"
        run_setun_game(target)
    else:
        print("\n[OK] Setun2D Polyglot Toolchain is 100% READY!")
        print("Usage:")
        print("  python tools/setun2d_toolchain.py build")
        print("  python tools/setun2d_toolchain.py run <file.stn>")

if __name__ == "__main__":
    main()
