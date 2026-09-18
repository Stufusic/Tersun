# G6R.1 Forensics Master Plan

Bản kế hoạch khung điều tra pháp y hiệu năng hậu Gate 6 (Post-Gate-6 Forensics & Workload Root-Cause Investigation).

---

## 1. Mục tiêu
Xác định nguyên nhân gốc rễ (Root Cause) khiến Tersun VM/JIT còn cách xa Native AOT trên 4 workload chuẩn ($W1..W4$), tạo cơ sở số liệu thực nghiệm để lập thứ tự ưu tiên kỹ thuật cho G6R.2.

---

## 2. Các Mốc Triển khai

```text
[x] DAY 1: Freeze Gate 6 Baseline
    ├── Sao chép 4 canonical workloads vào benchmarks/forensics/inputs/
    ├── Tính SHA256 checksum cho binaries và inputs
    └── Xuất benchmarks/forensics/manifests/g6r1_manifest.json

[ ] PHASE A: Mở rộng Telemetry Core
    ├── Mở rộng VMTelemetryManager với đủ 8 nhóm counter
    ├── Hỗ trợ cờ --forensics và --forensics-dump=<path.json>
    └── Biên dịch setunc.exe và libtersun_rt.a

[ ] PHASE B: Forensic Runner
    ├── Cung cấp tools/forensics/run_matrix.py
    └── Hỗ trợ M0..M4, đo Cold vs Warm độc lập, lấy mẫu N=20 runs

[ ] PHASE C: Thực thi Ma trận Đo đạc Baseline
    ├── Chạy 4 workloads x 5 modes x 20 measured runs = 400 runs
    └── Lưu raw datasets và normalized summary

[ ] PHASE D: Phân rã Thời gian & Xuất Profile Tables
    ├── Phân rã Total = Startup + JIT + GC + Exec
    └── Xuất summary.csv, opcode_histogram.csv, jit_profile.csv, array_profile.csv, object_profile.csv, fusion_profile.csv

[ ] PHASE E: Điều tra Sâu Từng Workload (W3 -> W4 -> W1 -> W2)
    ├── W3: Opcode census, Loop dispatch vs arithmetic, Fusion pipeline, Stack TOS
    ├── W4: Census cấp phát, Field IC hit rate, Shape transitions, Tương quan GC
    ├── W1: Function frames, Call/Return overhead, Đệ quy, JIT compilation ROI
    └── W2: Mảng FlatArray, Typed access ratio, Triệt tiêu bounds check, Boxing leak

[ ] PHASE F: Thí nghiệm Cô lập A/B (E1..E7)
    ├── E1: Dispatch (switch vs cached)
    ├── E2: TOS (enabled vs disabled)
    ├── E3: Fusion (enabled vs disabled)
    ├── E4: FlatArray (typed vs generic)
    ├── E5: Field IC (IC on vs off)
    ├── E6: JIT economics (interp vs JIT)
    └── E7: GC / Allocation pressure

[ ] PHASE G: Lập Dossier Reports & Root-Cause Matrix
    ├── Xuất reports W1.md, W2.md, W3.md, W4.md (đủ 15 mục bắt buộc)
    ├── Lập Docs/g6r/root_cause_matrix.md
    └── Lập Docs/g6r/findings.md

[ ] PHASE H: Đóng Seal G6R.1
    ├── Đối soát 12 tiêu chí Stop Conditions
    └── Xuất test_registry/g6r1_forensics_seal.json

[ ] PHASE I: Thiết lập Thứ tự Ưu tiên G6R.2
    ├── Phân loại P0, P1, P2
    └── Dự báo dịch chuyển metric
```
