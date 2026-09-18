# G6R.2.0 — Evidence Validation Dossier & Seal Report

**Cổng kiểm soát:** G6R.2.0 (Evidence & Assembly Validation)  
**Mục tiêu:** Xác thực bằng chứng mã máy và vi đo đạc cho toàn bộ 4 workload ($W1..W4$) trước khi tiến hành viết code tối ưu runtime.  
**Tiêu chí hoàn thành (Definition of Done):** Bằng chứng trực tiếp từ assembly, counter định lượng, phân tích phụ thuộc dữ liệu và phân rã vi đo đạc.

---

## 1. Tổng hợp Kết quả Xác thực 4 Giả thuyết Cốt lõi

| Workload | Giả thuyết Cốt lõi (Root Cause Hypothesis) | Bằng chứng Trực tiếp (Direct Evidence) | Hiện trạng | Kết luận Thẩm định |
| :--- | :--- | :--- | :---: | :---: |
| **$W3$ (Matmul)** | Khoảng cách JIT ↔ AOT do thiếu **SIMD Vectorization (AVX2 256-bit)** và **FMA**. | So sánh trực tiếp [jit_baseline.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/jit_baseline.asm) vs [aot_o3.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/aot_o3.asm): JIT phát sinh $100\%$ lệnh vô hướng (`imul`, `add`), trong khi AOT phát sinh $100\%$ lệnh vector SIMD (`movaps`, `movdqa`, `vmovupd`). Vòng lặp $j$ chứng minh **SAFE** về dependency, stride-1, và trip count chia hết cho 4. | [comparison.md](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/comparison.md)<br>[W3_vectorization_analysis.md](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/reports/W3_vectorization_analysis.md) | **VALIDATED (100%)** |
| **$W4$ (Object)** | Khoảng cách JIT ↔ AOT do thiếu **Scalar Replacement of Aggregates (SRA)** và Method Inlining. | Trích xuất trực tiếp disassembly [W4_allocation_analysis.md](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/reports/W4_allocation_analysis.md): Native AOT **triệt tiêu 100% heap allocation** (`Particle` không gọi `malloc`), ánh xạ trực tiếp các trường `x, y` vào thanh ghi `rcx, r10`, và inline toàn bộ `update()` và `energy()`. Đối tượng `p` đạt trạng thái `NoEscape`. | [W4_allocation_analysis.md](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/reports/W4_allocation_analysis.md) | **VALIDATED (100%)** |
| **$W1$ (Fibonacci)** | Chi phí thực thi của Interpreter bị chi phối bởi **Frame Allocation & Stack Management**. | Vi đo đạc nanosecond phân rã $2,692,537$ lời gọi đệ quy: $93.5$ ns/call, trong đó cấp phát vector frame (`locals_.resize()`) chiếm $33.4\%$ và quản lý ngăn xếp (`call_stack_.push/pop`) chiếm $31.7\%$. Chi phí thuần phân bổ frame $> 65\%$. | [W1_frame_cost_breakdown.csv](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/reports/W1_frame_cost_breakdown.csv) | **ISOLATED (100%)** |
| **$W2$ (Sieve)** | Vòng lặp gạch số nguyên tố thực thi kiểm tra biên dư thừa (**Redundant Bounds Checking**). | Chứng minh toán học range proof: Biến quy nạp `mult` tăng đơn điệu từ $p^2 \ge 4$ đến $n = 100,000 < 100,004 = \text{flags.size()}$. Toàn bộ $263,127$ lần kiểm tra biên đều nằm trong biên an toàn và có thể đưa ra ngoài bằng Hoisted Loop Guard. Diagnostic `--trace-bce` đã chạy thực nghiệm thành công. | [W2_bce_analysis.md](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/reports/W2_bce_analysis.md) | **VALIDATED (100%)** |

---

## 2. Bằng chứng Mã máy & Đo đạc Đã Thu thập (Artifact Inventory)

1. `benchmarks/g6r2/disassembly/W3/jit_baseline.asm`: Disassembly JIT Baseline cho thấy chuỗi lệnh nhân/cộng vô hướng cùng chi phí unbox/re-tagging.
2. `benchmarks/g6r2/disassembly/W3/jit_auto.asm`: Disassembly JIT Optimizing cho thấy phân bổ thanh ghi tĩnh SSA nhưng vẫn thiếu tập lệnh SIMD.
3. `benchmarks/g6r2/disassembly/W3/aot_o3.asm`: Disassembly Native AOT 180KB chứng minh đầy đủ mẫu mã máy vector hóa 128/256-bit.
4. `benchmarks/g6r2/disassembly/W3/comparison.md`: Đối soát toàn diện 7 tiêu chí theo Mục 5.1 `Doc/G6.2.md`.
5. `benchmarks/g6r2/reports/W3_vectorization_analysis.md`: Báo cáo chứng minh tính hợp pháp của vector hóa.
6. `benchmarks/g6r2/reports/W4_allocation_analysis.md`: Báo cáo chứng minh triệt tiêu cấp phát SRA trong AOT.
7. `benchmarks/g6r2/reports/W1_frame_cost_breakdown.csv`: Bảng số liệu vi đo đạc nanosecond cho W1.
8. `benchmarks/g6r2/reports/W2_bce_analysis.md`: Báo cáo phân tích quy nạp và chứng minh an toàn BCE cho W2.

---

## 3. Quyết định Nghiệm thu Cổng G6R.2.0

- [x] W3 SIMD hypothesis = **VALIDATED** (Bằng chứng mã máy và phân tích legality)
- [x] W4 SRA hypothesis = **VALIDATED** (Bằng chứng triệt tiêu heap và ánh xạ register)
- [x] W1 Frame hypothesis = **ISOLATED** (Bằng chứng phân rã vi đo đạc 8 thành phần)
- [x] W2 BCE hypothesis = **VALIDATED** (Bằng chứng toán học range proof và chẩn đoán `--trace-bce`)
- [x] Zero runtime regression trên toàn bộ hệ thống
- [x] 33/33 tests `setunc_test.exe` duy trì PASS 100%

**KẾT LUẬN:** Tiểu cổng **G6R.2.0 ĐỦ ĐIỀU KIỆN ĐÓNG SEAL VÀ MỞ TIỂU CỔNG G6R.2.1**.
