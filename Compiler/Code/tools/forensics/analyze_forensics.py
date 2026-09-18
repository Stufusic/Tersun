#!/usr/bin/env python3
# ==============================================================================
# G6R.1 Forensics Analyzer & Decomposer
# Decomposes total execution time into: Startup / JIT / GC / Dispatch / Exec
# Exports CSV profiles: summary.csv, opcode_histogram.csv, jit_profile.csv,
# array_profile.csv, object_profile.csv, fusion_profile.csv
# ==============================================================================

import os
import sys
import json
import csv

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(os.path.dirname(HERE))
BENCH_DIR = os.path.join(CODE, "benchmarks", "forensics")
NORM_DIR = os.path.join(BENCH_DIR, "normalized")
REPORTS_DIR = os.path.join(BENCH_DIR, "reports")

os.makedirs(REPORTS_DIR, exist_ok=True)

def analyze_matrix(json_path):
    if not os.path.exists(json_path):
        print(f"Error: {json_path} does not exist.")
        return

    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    # 1. Summary CSV (Workload, Mode, Total, Startup, JIT, GC, Exec)
    summary_csv = os.path.join(NORM_DIR, "summary.csv")
    with open(summary_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Total_ms", "Startup_ms", "JIT_ms", "GC_ms", "Exec_ms", "P95_ms", "CV_pct"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                stats = m_data.get("stats", {})
                tel = m_data.get("last_telemetry", {})
                wclock = tel.get("wall_clock", {})
                jit = tel.get("tier_jit", {})
                gc = tel.get("object_ic_gc", {})

                total_ms = stats.get("median_ms", 0.0)
                startup_ms = round(wclock.get("startup_time_ms", 0.0), 2)
                jit_ms = round(jit.get("jit_compile_time_ms", 0.0), 2)
                gc_ms = round(gc.get("gc_pause_total_ns", 0) / 1e6, 2)
                exec_ms = round(max(0.0, total_ms - jit_ms - gc_ms), 2)
                p95_ms = stats.get("p95_ms", 0.0)
                cv_pct = stats.get("cv_pct", 0.0)

                writer.writerow([w_id, m_id, total_ms, startup_ms, jit_ms, gc_ms, exec_ms, p95_ms, cv_pct])
    print(f"Generated: {summary_csv}")

    # 2. Opcode Histogram CSV
    opcode_csv = os.path.join(NORM_DIR, "opcode_histogram.csv")
    with open(opcode_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Opcode_Hex", "Count"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                tel = m_data.get("last_telemetry", {})
                disp = tel.get("dispatch", {})
                op_counts = disp.get("opcode_counts", {})
                for op, count in op_counts.items():
                    writer.writerow([w_id, m_id, op, count])
    print(f"Generated: {opcode_csv}")

    # 3. JIT Profile CSV
    jit_csv = os.path.join(NORM_DIR, "jit_profile.csv")
    with open(jit_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Invocations", "Backedges", "JIT_Compiles", "Compile_ms", "OSR_Count", "Deopts"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                tel = m_data.get("last_telemetry", {})
                jit = tel.get("tier_jit", {})
                writer.writerow([
                    w_id, m_id,
                    jit.get("invocation_count", 0),
                    jit.get("backedge_count", 0),
                    jit.get("jit_compile_count", 0),
                    round(jit.get("jit_compile_time_ms", 0.0), 3),
                    jit.get("osr_count", 0),
                    jit.get("deopt_count", 0)
                ])
    print(f"Generated: {jit_csv}")

    # 4. Array Profile CSV
    arr_csv = os.path.join(NORM_DIR, "array_profile.csv")
    with open(arr_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Generic_Load", "Generic_Store", "Typed_I64_Load", "Typed_I64_Store", "Typed_Ratio", "Bounds_Checks", "Bounds_Elided"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                tel = m_data.get("last_telemetry", {})
                arr = tel.get("array", {})
                writer.writerow([
                    w_id, m_id,
                    arr.get("generic_array_load", 0),
                    arr.get("generic_array_store", 0),
                    arr.get("typed_i64_load", 0),
                    arr.get("typed_i64_store", 0),
                    round(arr.get("typed_access_ratio", 0.0), 4),
                    arr.get("bounds_check_count", 0),
                    arr.get("bounds_check_elided", 0)
                ])
    print(f"Generated: {arr_csv}")

    # 5. Object & IC Profile CSV
    obj_csv = os.path.join(NORM_DIR, "object_profile.csv")
    with open(obj_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Allocs", "Field_Loads", "Field_Stores", "IC_Hits", "IC_Misses", "IC_Hit_Rate", "Shape_Transitions"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                tel = m_data.get("last_telemetry", {})
                obj = tel.get("object_ic_gc", {})
                writer.writerow([
                    w_id, m_id,
                    obj.get("object_alloc_count", 0),
                    obj.get("field_load_count", 0),
                    obj.get("field_store_count", 0),
                    obj.get("field_ic_hit", 0),
                    obj.get("field_ic_miss", 0),
                    round(obj.get("ic_hit_rate", 0.0), 4),
                    obj.get("shape_transition_count", 0)
                ])
    print(f"Generated: {obj_csv}")

    # 6. Fusion Profile CSV
    fus_csv = os.path.join(NORM_DIR, "fusion_profile.csv")
    with open(fus_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["Workload", "Mode", "Candidates", "Fused", "Rejected", "Executed", "Superinstructions"])
        for w_id, modes in data.items():
            for m_id, m_data in modes.items():
                tel = m_data.get("last_telemetry", {})
                fus = tel.get("fusion", {})
                disp = tel.get("dispatch", {})
                writer.writerow([
                    w_id, m_id,
                    fus.get("candidate_patterns", 0),
                    fus.get("fused_count", 0),
                    fus.get("rejected_count", 0),
                    fus.get("fused_opcode_execution_count", 0),
                    disp.get("superinstruction_count", 0)
                ])
    print(f"Generated: {fus_csv}")

if __name__ == "__main__":
    matrix_file = os.path.join(NORM_DIR, "matrix_summary.json")
    if len(sys.argv) > 1:
        matrix_file = sys.argv[1]
    analyze_matrix(matrix_file)
