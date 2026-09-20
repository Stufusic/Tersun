# G6R.1 Decision Log

Nhật ký ghi nhận các quyết định kiến trúc, tiêu chí kỹ thuật và quy tắc thực nghiệm trong G6R.1 Forensics.

---

| Date | Decision ID | Topic | Decision & Rationale | Status |
| :--- | :--- | :--- | :--- | :--- |
| 2026-09-17 | DEC-01 | Baseline Freeze | Đóng băng hoàn toàn Gate 6 baseline vào `build/g6r1/gate6_frozen/setunc.exe` kèm SHA256 checksum và manifest môi trường (`g6r1_manifest.json`) trước khi thực hiện bất kỳ đo đạc mới nào. | **APPROVED** |
| 2026-09-17 | DEC-02 | Telemetry Architecture | Mở rộng `VMTelemetryManager` thành 8 nhóm counter chuyên biệt, đồng bộ trực tiếp từ `VMProfiler` và `VM` mà không làm thay đổi ngữ nghĩa thực thi (Zero Semantic Drift). | **APPROVED** |
| 2026-09-17 | DEC-03 | Mode Standard ($M0..M4$) | Định nghĩa 5 execution modes chuẩn hóa: $M0$ (Interp Switch), $M1$ (Interp Cached), $M2$ (Baseline JIT), $M3$ (Auto-Tier JIT), $M4$ (Native AOT -O3) để đánh giá toàn diện phổ thực thi. | **APPROVED** |
| 2026-09-17 | DEC-04 | Workload Triage Order | Tiến hành điều tra sâu theo thứ tự: $W3 \rightarrow W4 \rightarrow W1 \rightarrow W2$ do $W3$ có khoảng cách VM/AOT lớn nhất, $W4$ bao phủ hệ thống đối tượng, $W1$ bao phủ đệ quy và $W2$ kiểm chứng mảng. | **APPROVED** |
| 2026-09-17 | DEC-05 | Causality Standard | Một nguyên nhân chỉ được phân loại `CONFIRMED` khi có thí nghiệm A/B độc lập chứng minh tính nhân quả (thay đổi duy nhất 1 subsystem). Các phỏng đoán chỉ được xếp `PROBABLE` hoặc `INCONCLUSIVE`. | **APPROVED** |
| 2026-09-18 | DEC-06 | W3 Vectorization Seal | Phê duyệt niêm phong G6R.2.1 (W3 Vectorization & SIMD Lowering): W3 runtime đạt 4.88 ms <= 5.50 ms, bit-exact checksum 20250000, 33/33 tests PASS. | **APPROVED** |
| 2026-09-19 | DEC-07 | W4 SRA & Escape Analysis Seal | Phê duyệt niêm phong G6R.2.2 (W4 Escape Analysis & SRA): W4 runtime đạt 0.94 ms <= 1.80 ms, 100% heap allocation elimination (0 bytes allocated), bit-exact checksum 541096364, 33/33 tests PASS. | **APPROVED** |
| 2026-09-19 | DEC-08 | W1 Frame Optimization & Direct Native Calling Seal | Phê duyệt niêm phong G6R.2.3 (W1 Frame Allocation Recycling & Direct Native Calling): Interpreter đạt 100.80 ms <= 120 ms, JIT đạt 5.22 ms <= 45 ms (speedup 19.31x), bit-exact checksum 832040, 33/33 tests PASS. | **APPROVED** |
| 2026-09-20 | DEC-09 | W2 BCE & Range Propagation Seal | Phê duyệt niêm phong G6R.2.4 (W2 Array Bounds Check Elimination & Range Propagation): JIT đạt 3.75 ms <= 4.50 ms (speedup 16.56%), bit-exact checksum 9592, 0 bounds checks & 0 helper calls in inner loop, total_spill_slots=0, 6/6 safety tests PASS, 33/33 tests PASS. | **APPROVED** |

