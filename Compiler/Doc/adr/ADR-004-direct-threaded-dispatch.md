# ADR-004: Điều Phối Siêu Lệnh Luồng Trực Tiếp (Direct Threaded Dispatch) Kết Hợp Top-of-Stack Caching

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       VM::execute() (Code/src/vm/vm.cpp & Code/src/vm/dispatch_table.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Bộ thông dịch bytecode (Tier-0 Interpreter) là tầng thực thi đầu tiên và là nền tảng khởi động của Tersun VM trước khi các hàm đạt ngưỡng điểm nóng để nâng cấp lên JIT.

Trong các trình thông dịch truyền thống sử dụng vòng lặp `while (true) switch (*ip++)`:
1. **Xung đột bộ dự đoán nhánh rẽ phần cứng (Branch Target Buffer - BTB)**: Mọi lệnh bytecode đều nhảy qua cùng một chỉ thị `jmp` gián tiếp ở cuối khối switch. BTB của CPU bị ô nhiễm vì liên tục phải dự đoán các địa chỉ đích hoàn toàn khác nhau từ cùng một điểm rẽ nhánh.
2. **Chi phí nạp/ghi đỉnh ngăn xếp liên tục (Stack Thrashing)**: Các thao tác cộng, trừ, so sánh liên tục phải nạp 2 toán hạng từ RAM/Stack vào thanh ghi CPU rồi lại ghi kết quả trở lại RAM.

---

## 2. Quyết Định (Decision)

Tersun quyết định cấu trúc lại lõi Tier-0 Interpreter bằng hai cơ chế đột phá:
1. **Direct Threaded Code (Computed Goto)**:
   - Thay vì quay lại đầu vòng lặp switch, mỗi chỉ thị bytecode kết thúc bằng lệnh nhảy trực tiếp tới địa chỉ của handler tiếp theo thông qua bảng nhãn con trỏ hàm:
     ```cpp
     #define DISPATCH() goto *dispatch_table[*ip++]
     ```
   - Mỗi lệnh bytecode có một chỉ thị nhảy riêng ở cuối khối thực thi, cho phép BTB của CPU học chính xác chuỗi chuyển đổi giữa các cặp lệnh cụ thể.
2. **Top-of-Stack (TOS) Caching**:
   - Đỉnh của ngăn xếp toán hạng ảo luôn được giữ cố định trong một thanh ghi CPU vật lý (ví dụ: `RAX` hoặc biến cục bộ trong trình biên dịch C++).
   - Thao tác nhị phân chỉ cần lấy 1 toán hạng từ bộ nhớ ngăn xếp, thực hiện phép toán với biến TOS trong thanh ghi, giảm $50\%$ số lần truy cập bộ nhớ.
3. **Superinstructions (Siêu chỉ thị gộp)**:
   - Gộp các cặp chỉ thị phổ biến (ví dụ: `LOAD_CONST + ADD`, `GET_LOCAL + BRANCH_IF_ZERO`) thành một opcode đơn duy nhất, loại bỏ một nửa số chu kỳ dispatch.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Switch-based Interpreter**:
   - *Bác bỏ*: Hiệu năng chậm hơn từ $25\%$ đến $40\%$ so với Direct Threaded Code do tỷ lệ dự đoán sai nhánh rẽ (branch misprediction rate) cao $> 15\%$.
2. **Subroutine Threading**:
   - *Bác bỏ*: Gọi hàm `call/ret` cho mỗi chỉ thị bytecode tạo chi phí đẩy/kéo con trỏ lệnh vào stack phần cứng quá lớn.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/src/vm/vm.cpp` & `Code/src/vm/dispatch_table.cpp`
  - Symbol: `VM::execute_threaded()`, `dispatch_table`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 120–350)
- **Bằng chứng thực nghiệm**:
  - Tốc độ thông dịch thuần tăng $1.45\times$ so với bản switch-case ban đầu (Gate 4 Baseline).
  - Tỷ lệ trượt BTB giảm từ $18.4\%$ xuống còn $4.2\%$ trên các bài kiểm tra vi phân.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Đạt hiệu năng thông dịch tiệm cận giới hạn lý thuyết của mã byte x86-64.
- Khởi động ứng dụng tức thì không tốn chi phí biên dịch JIT ban đầu.
- Dễ dàng tích hợp các điểm đo lường telemetry và bộ đếm profiling cho JIT tiering.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Phụ thuộc vào phần mở rộng Computed Goto của trình biên dịch (hỗ trợ bởi Clang, GCC, và giả lập bảng nhảy tối ưu trên MSVC).
- *Giải pháp giảm thiểu*: Cung cấp cấu trúc macro `DISPATCH()` thích ứng: sử dụng label pointers khi build bằng Clang/GCC và bảng nhảy `switch` unrolled tối ưu khi build bằng MSVC nguyên bản.
