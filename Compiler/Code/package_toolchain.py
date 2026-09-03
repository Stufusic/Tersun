import os
import shutil
import zipfile

def package_sdk():
    base_dir = os.path.dirname(os.path.abspath(__file__))
    dist_dir = os.path.join(base_dir, "dist", "setun-sdk")
    
    os.makedirs(os.path.join(dist_dir, "bin"), exist_ok=True)
    os.makedirs(os.path.join(dist_dir, "include"), exist_ok=True)
    os.makedirs(os.path.join(dist_dir, "examples"), exist_ok=True)
    os.makedirs(os.path.join(dist_dir, "doc"), exist_ok=True)

    # 2. Copy Executable binary
    exe_name = "setunc.exe" if os.name == "nt" else "setunc"
    src_exe = os.path.join(base_dir, exe_name)
    if os.path.exists(src_exe):
        shutil.copy2(src_exe, os.path.join(dist_dir, "bin", exe_name))
        print(f"[OK] Copied {exe_name} to bin/")
    else:
        print(f"[WARN] {exe_name} not found. Please compile first!")

    # 3. Copy Headers (FFI & Standard Library)
    src_include = os.path.join(base_dir, "include")
    if os.path.exists(src_include):
        shutil.copytree(src_include, os.path.join(dist_dir, "include"), dirs_exist_ok=True)
        print("[OK] Copied C/C++ Headers and stdtaf library to include/")

    # 4. Copy Example scripts
    src_examples = os.path.join(base_dir, "examples")
    if os.path.exists(src_examples):
        shutil.copytree(src_examples, os.path.join(dist_dir, "examples"), dirs_exist_ok=True)
        print("[OK] Copied examples to examples/")

    # 5. Copy Documentation
    doc_dir = os.path.abspath(os.path.join(base_dir, "..", "Doc"))
    if os.path.exists(doc_dir):
        for f in os.listdir(doc_dir):
            if f.endswith(".md") or f.endswith(".lean") or f.endswith(".pdf"):
                shutil.copy2(os.path.join(doc_dir, f), os.path.join(dist_dir, "doc", f))
        print("[OK] Copied Documentation and Lean 4 formal proofs to doc/")

    # 6. Create Windows install.bat
    install_bat = os.path.join(dist_dir, "install.bat")
    with open(install_bat, "w", encoding="utf-8") as f:
        f.write("@echo off\n")
        f.write("echo ========================================================\n")
        f.write("echo   Installing Setun-70 & TAFPU Toolchain to User PATH...  \n")
        f.write("echo ========================================================\n")
        f.write("set SDK_BIN=%~dp0bin\n")
        f.write("setx PATH \"%PATH%;%SDK_BIN%\"\n")
        f.write("echo.\n")
        f.write("echo [SUCCESS] Setun-70 Compiler installed! You can now run 'setunc' from any terminal.\n")
        f.write("pause\n")

    # 7. Create Linux/macOS install.sh
    install_sh = os.path.join(dist_dir, "install.sh")
    with open(install_sh, "w", encoding="utf-8") as f:
        f.write("#!/usr/bin/env bash\n")
        f.write("set -e\n")
        f.write("echo 'Installing Setun-70 Toolchain to /usr/local/bin...'\n")
        f.write("sudo cp $(dirname \"$0\")/bin/setunc /usr/local/bin/\n")
        f.write("echo '[SUCCESS] Setun-70 Compiler installed! Run: setunc test'\n")

    # 8. Create ZIP bundle
    zip_path = os.path.join(base_dir, "dist", "setun-sdk-v1.0.0.zip")
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(dist_dir):
            for file in files:
                abs_file = os.path.join(root, file)
                rel_file = os.path.relpath(abs_file, dist_dir)
                zipf.write(abs_file, rel_file)
    print(f"\n[DONE] Package created successfully: {zip_path}\n")

if __name__ == "__main__":
    package_sdk()
