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
