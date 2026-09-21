# ADR-009: Vector Hóa Song Song SIMD AVX2 256-Bit Cho Vòng Lặp Bước Nhảy Đơn Vị (Stride-1)

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4 / Sealed G6R.2.1)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       X64Assembler & MIROptimizer (Code/src/vm/x64_assembler.cpp & Code/src/vm/mir_optimizer.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Các phép toán đại số tuyến tính như nhân ma trận (Matrix Multiplication - GEMM), tích vô hướng (Dot Product), và biến đổi hình học trong **Workload W3 (Dense Matmul)** đòi hỏi thực hiện hàng triệu phép nhân và cộng lặp đi lặp lại trên các mảng số nguyên hoặc số thực liên tục.

- Khi thực thi ở chế độ vô hướng (Scalar JIT):
  - Mỗi nhịp đồng hồ chỉ xử lý được 1 cặp số nguyên 64-bit (`imul`, `add`).
  - Đường ống vi xử lý x86-64 lãng phí các thanh ghi vector 256-bit (`YMM0`–`YMM15`) mạnh mẽ vốn có trên tất cả các dòng chip hiện đại (Intel Haswell+ / AMD Zen+).
  - Trước khi tối ưu, **Workload W3** chạy mất **$16.22\text{ ms}$**.

---

## 2. Quyết Định (Decision)

Tersun quyết định tích hợp tầng **Bộ Phát Mã SIMD AVX2 256-Bit (AVX2 Vectorization Engine)** trực tiếp vào Machine IR (MIR) và bộ phát mã máy x86-64 (`X64Assembler`):

### Cơ chế kỹ thuật:
1. **Phát Hiện Mẫu Vòng Lặp Bước Nhảy Đơn Vị (Stride-1 Pattern Detection)**:
   - Phân tích biến quy nạp để nhận diện vòng lặp truy cập bộ nhớ tuần tự liên tục: $A[k], B[k \times N + j]$.
   - Kiểm tra tính căn lề và tính độc lập dữ liệu (No Loop-Carried Dependency).
2. **Hạ Tầng Tập Lệnh VEX 256-Bit**:
   - Sử dụng tiền tố mã hóa VEX để tránh chi phí chuyển đổi trạng thái AVX-SSE penalty.
   - `vpbroadcastq`: Phát tán một phần tử ma trận $A$ ra toàn bộ 4 làn của thanh ghi `YMM`.
   - `vmovdqu`: Nạp 4 phần tử 64-bit liên tiếp của ma trận $B$ vào thanh ghi `YMM`.
   - `vpmuludq` & `vpaddq`: Thực hiện 4 phép nhân và 4 phép cộng tích lũy 64-bit song song mỗi chỉ thị.
3. **Pha Dọn Đuôi Vòng Lặp (Scalar Epilogue)**:
   - Xử lý các phần tử dư thừa khi kích thước ma trận không chia hết cho 4 bằng vòng lặp vô hướng thông thường, đảm bảo kết quả chính xác bit-exact cho mọi kích thước ma trận.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **SSE2 128-bit Vectorization**:
   - *Bác bỏ*: Chỉ xử lý được 2 phần tử 64-bit song song, hiệu năng chỉ bằng một nửa so với AVX2 256-bit.
2. **AVX-512**:
   - *Bác bỏ*: Gây hiện tượng tụt xung nhịp CPU (Frequency Downclocking) trên một số thế hệ chip Intel Skylake-X, và không được hỗ trợ phổ quát trên kiến trúc AMD Zen đời đầu. AVX2 mang lại sự cân bằng hoàn hảo giữa hiệu năng đỉnh cao và độ tương thích phần cứng rộng khắp.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/src/vm/x64_assembler.cpp` & `Code/src/vm/mir_optimizer.cpp`
  - Symbol: `X64Assembler::emit_simd_loop()`, `X64Assembler::vpaddq()`, `X64Assembler::vpbroadcastq()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 410–560)
- **Bằng chứng thực nghiệm & Niêm phong mật mã**:
  - **Workload W3 (Matmul)**: Thời gian thực thi giảm từ $16.22\text{ ms} \to$ **$4.88\text{ ms}$** (nhanh gấp **$3.32\times$**).
  - Số lượng chỉ thị vô hướng giảm $74.2\%$, số lượng chỉ thị vector AVX2 tăng từ $0 \to 128,000$ lệnh.
  - Niêm phong mật mã tại: `test_registry/g6r2/g6r2_1_simd.json`.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Khai thác tối đa sức mạnh tính toán song song của phần cứng máy tính hiện đại.
- Tiệm cận thông lượng của các thư viện tính toán số học BLAS chuyên nghiệp.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Yêu cầu CPU có hỗ trợ AVX2 (bắt buộc phần cứng từ 2013 trở lại đây).
- *Giải pháp giảm thiểu*: Tích hợp cơ chế phát hiện cờ CPUID trong thời gian chạy (`CPUFeatureDetector::has_avx2()`); nếu vi xử lý không hỗ trợ, VM tự động lùi về (fallback) đường dẫn vô hướng đã tối ưu hóa qua Linear Scan.
