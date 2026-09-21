# ADR-008: Triệt Tiêu Kiểm Tra Biên Mảng & Đưa Con Trỏ Ra Tiền Tiêu Đề Vòng Lặp Ngoài Cùng (BCE with Preheader Hoisting)

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4 Sealed)
Date:                2026-09-20
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       MIROptimizer::run_loop_bce() (Code/src/vm/mir_optimizer.cpp & Code/src/vm/induction_variable.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

An toàn bộ nhớ là nguyên tắc cốt tử của ngôn ngữ Setun. Theo mặc định, mọi thao tác truy cập mảng `arr[i]` trong bytecode đều sinh ra chỉ thị kiểm tra biên:
$$\text{assert}(0 \le i < \text{arr.length})$$
Nếu vi phạm, hệ thống phải kích hoạt ngoại lệ `IndexOutOfBoundsException`.

Trong các thuật toán xử lý mảng lồng nhau quy mô lớn như **Sàng nguyên tố Eratosthenes (Workload W2 - Sieve of Eratosthenes)**:
- Vòng lặp bên trong chạy hàng triệu lần:
  ```stn
  var mult = i * i;
  while (mult <= n) {
      primes[mult] = 0;
      mult = mult + i;
  }
  ```
- Mỗi lần gán `primes[mult] = 0` đều phải:
  1. Trích xuất con trỏ mảng và độ dài từ cấu trúc đối tượng heap.
  2. So sánh `mult` với `length`.
  3. Rẽ nhánh có điều kiện tới bộ xử lý ngoại lệ.
- **Hậu quả**: Vi xử lý bị nghẽn đường ống lệnh (Pipeline Stall), mất cơ hội tối ưu hóa vector, và thời gian chạy JIT trước tối ưu bị đội lên **$14.93\text{ ms}$**.

---

## 2. Quyết Định (Decision)

Tersun quyết định phát triển gói tối ưu hóa **Bounds Check Elimination (BCE)** kết hợp **Phân Tích Biến Quy Nạp (Induction Variable Analysis - IVA)** và **Đưa Con Trỏ Ra Tiền Tiêu Đề Vòng Lặp Ngoài Cùng (Outermost Preheader Hoisting)**:

### Cơ chế kỹ thuật:
1. **Nhận Diện Biến Quy Nạp & Dạng Chính Tắc Vòng Lặp (IVA)**:
   - Nhận diện biến chỉ số cơ sở $i$ và biến bội số $mult = i \times i$ với bước nhảy hằng số $\Delta = i$.
   - Chứng minh bất biến: $mult \ge 0$.
2. **Chứng Minh Bất Biến Biên Một Lần Trước Vòng Lặp (Range Guarding)**:
   - Trước khi bước vào vòng lặp, hệ thống chèn một phép kiểm tra bảo vệ duy nhất tại Preheader:
     $$\text{guard}(n \le \text{primes.length})$$
   - Khi điều kiện này thỏa mãn, do điều kiện lặp là $mult \le n$, suy ra $mult < \text{primes.length}$ luôn đúng với mọi lần lặp. Toàn bộ các chỉ thị `CHECK_BOUNDS` bên trong thân vòng lặp được chứng minh là dư thừa và bị xóa bỏ ($100\%$ elided).
3. **Đưa Con Trỏ Mảng Ra Ngoài Tiêu Đề Vòng Lặp Ngoài Cùng (Outermost Hoisting)**:
   - Trích xuất con trỏ thô tới vùng đệm mảng `raw_data_ptr` của `primes` và lưu vào một thanh ghi x86-64 vật lý (ví dụ: `R12` hoặc `R15`) ngay từ đầu hàm.
   - Thân vòng lặp bên trong được rút gọn thành chỉ một lệnh ghi bộ nhớ trực tiếp duy nhất:
     ```assembly
     mov byte ptr [r12 + r10], 0
     ```

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Unchecked / Unsafe Arrays (Bắt người dùng tắt kiểm tra biên thủ công)**:
   - *Bác bỏ*: Vi phạm cam kết an toàn bộ nhớ tuyệt đối của Tersun.
2. **Local Preheader Hoisting (Đưa con trỏ ra đầu vòng lặp con)**:
   - *Bác bỏ*: Vẫn phải nạp lại con trỏ mảng mỗi khi vòng lặp cha chuyển bước, không đạt tốc độ tối đa.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/src/vm/mir_optimizer.cpp` & `Code/src/vm/induction_variable.cpp`
  - Symbol: `MIROptimizer::run_loop_bce()`, `InductionVariableAnalyzer::analyze_loop()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 920–1040)
- **Bằng chứng thực nghiệm & Niêm phong mật mã**:
  - **Workload W2 (Sieve)**: Thời gian thực thi giảm ngoạn mục từ $14.93\text{ ms} \to$ **$3.75\text{ ms}$** (Vượt xa mục tiêu cam kết $\le 4.50\text{ ms}$).
  - Đảm bảo tính toán đúng đắn bit-exact: `checksum = 9592`.
  - Bộ test an toàn vi phân: `tests/test_bce_safety.cpp` đạt **6/6 PASS** ($100\%$).
  - Báo cáo niêm phong mật mã: `Doc/g6r/g6r2_4_w2_bounds_check_elimination.md`.
  - Registry JSON: `test_registry/g6r2/g6r2_4_bce.json` (SHA256 bitstream).

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Đạt tốc độ của mã C/C++ thuần không có cờ an toàn, trong khi vẫn giữ nguyên tính an toàn $100\%$ cho ngôn ngữ cấp cao.
- Triệt tiêu hoàn toàn hiện tượng sụt giảm IPC do đoán sai nhánh rẽ.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Nếu kích thước mảng thay đổi động trong vòng lặp (array resize), điều kiện bảo vệ biên sẽ mất hiệu lực.
- *Giải pháp giảm thiểu*: Chỉ áp dụng hoisting cho các mảng có tính chất bất biến kích thước trong phạm vi vòng lặp được bảo vệ; nếu có lệnh resize, hệ thống tự động giáng cấp về kiểm tra biên động.
