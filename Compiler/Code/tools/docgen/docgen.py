#!/usr/bin/env python3
"""
Tersun Documentation Generator & Code Inventory Scanner (docgen.py)
Automates extraction of file inventories, lines of code (LOC), and public symbols
across the Tersun compiler and VM codebase.

Target Commit: 133330b5fd9b5cf9b57948abf7de3361eb20b793
Architecture: Tersun 1.0.3 (Gate 6R.2.4 Sealed)
"""

import os
import sys
import json
import re
from pathlib import Path

MODULES = [
    "compiler",
    "vm",
    "tafpu",
    "qvm",
    "kernel",
    "hardware",
    "tools",
    "graphics",
    "ffi"
]

SOURCE_EXTENSIONS = {".cpp", ".cc", ".c", ".hpp", ".h", ".inl", ".inc"}

# Basic regex for C++ symbols
RE_CLASS_STRUCT = re.compile(r'^\s*(?:template\s*<[^>]+>\s*)?(?:class|struct)\s+([A-Za-z0-9_]+)')
RE_ENUM = re.compile(r'^\s*enum\s+(?:class\s+)?([A-Za-z0-9_]+)')
RE_FUNCTION = re.compile(r'^\s*(?:[A-Za-z0-9_:<>&*~]+\s+)+([A-Za-z0-9_~]+)\s*\([^)]*\)\s*(?:const)?\s*(?:noexcept)?\s*(?:override)?\s*[{;]')

def count_lines(filepath):
    total = 0
    blank = 0
    comment = 0
    in_block_comment = False
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                total += 1
                stripped = line.strip()
                if not stripped:
                    blank += 1
                    continue
                if in_block_comment:
                    comment += 1
                    if "*/" in stripped:
                        in_block_comment = False
                    continue
                if stripped.startswith("/*"):
                    comment += 1
                    if "*/" not in stripped:
                        in_block_comment = True
                    continue
                if stripped.startswith("//"):
                    comment += 1
                    continue
    except Exception as e:
        pass
    code = total - blank - comment
    return {"total": total, "blank": blank, "comment": comment, "code": code}

def extract_symbols(filepath):
    symbols = []
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            for idx, line in enumerate(f, 1):
                line_str = line.strip()
                m_cs = RE_CLASS_STRUCT.match(line_str)
                if m_cs:
                    symbols.append({"kind": "type", "name": m_cs.group(1), "line": idx})
                    continue
                m_enum = RE_ENUM.match(line_str)
                if m_enum:
                    symbols.append({"kind": "enum", "name": m_enum.group(1), "line": idx})
                    continue
    except Exception:
        pass
    return symbols

def scan_repository(repo_root):
    src_dir = repo_root / "Code" / "src"
    inc_dir = repo_root / "Code" / "include"
    
    inventory = {mod: {"src_files": [], "inc_files": [], "stats": {"total_files": 0, "total_loc": 0, "code_loc": 0}} for mod in MODULES}
    
    # Scan src
    for mod in MODULES:
        mod_src = src_dir / mod
        if mod_src.exists() and mod_src.is_dir():
            for f in sorted(mod_src.iterdir()):
                if f.is_file() and f.suffix in SOURCE_EXTENSIONS and f.name != f"{mod}.md":
                    lines = count_lines(f)
                    syms = extract_symbols(f)
                    inventory[mod]["src_files"].append({
                        "filename": f.name,
                        "relpath": str(f.relative_to(repo_root)).replace("\\", "/"),
                        "lines": lines,
                        "symbols": [s["name"] for s in syms]
                    })
                    inventory[mod]["stats"]["total_files"] += 1
                    inventory[mod]["stats"]["total_loc"] += lines["total"]
                    inventory[mod]["stats"]["code_loc"] += lines["code"]
                    
        mod_inc = inc_dir / mod
        if mod_inc.exists() and mod_inc.is_dir():
            for f in sorted(mod_inc.iterdir()):
                if f.is_file() and f.suffix in SOURCE_EXTENSIONS:
                    lines = count_lines(f)
                    syms = extract_symbols(f)
                    inventory[mod]["inc_files"].append({
                        "filename": f.name,
                        "relpath": str(f.relative_to(repo_root)).replace("\\", "/"),
                        "lines": lines,
                        "symbols": [s["name"] for s in syms]
                    })
                    inventory[mod]["stats"]["total_files"] += 1
                    inventory[mod]["stats"]["total_loc"] += lines["total"]
                    inventory[mod]["stats"]["code_loc"] += lines["code"]
                    
    return inventory

def main():
    repo_root = Path(__file__).resolve().parent.parent.parent.parent
    inventory = scan_repository(repo_root)
    
    output_json = repo_root / "Code" / "tools" / "docgen" / "inventory_report.json"
    with open(output_json, "w", encoding="utf-8") as f:
        json.dump(inventory, f, indent=2)
        
    print("=== TERSUN ARCHITECTURE INVENTORY SCAN ===")
    total_all_files = 0
    total_all_loc = 0
    for mod in MODULES:
        st = inventory[mod]["stats"]
        src_c = len(inventory[mod]["src_files"])
        inc_c = len(inventory[mod]["inc_files"])
        print(f"[{mod.upper():<10}] Files: {st['total_files']:>2} ({src_c} src, {inc_c} inc) | Total LOC: {st['total_loc']:>6} | Code LOC: {st['code_loc']:>6}")
        total_all_files += st['total_files']
        total_all_loc += st['total_loc']
        
    print("-" * 55)
    print(f"TOTAL: {total_all_files} files across 9 modules | Total LOC: {total_all_loc}")
    print(f"Detailed inventory written to: {output_json}")

if __name__ == "__main__":
    main()
