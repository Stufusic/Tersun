### Kế hoạch Triển khai Giai đoạn 2: Chuỗi Biên dịch Toàn diện & Tự động hóa Bytecode

Giai đoạn 2 tập trung chuyển đổi toàn bộ pipeline từ phân tích chuỗi văn bản mã nguồn (`.taf`) thành mảng bytecode hoàn chỉnh có thể nạp thẳng vào máy ảo Setun-70 mô phỏng, thay thế hoàn toàn việc viết bytecode thủ công.

---

### Module 1: Mở rộng Parser & Xây dựng Cây AST Khối Lệnh (Syntax Trees)

* **Phân tích Cấu trúc Khối & Phạm vi (Block Scope AST):**
* Thiết kế node `BlockNode` chứa danh sách các câu lệnh tuần tự.
* Hỗ trợ cú pháp khai báo biến: `let <identifier>: <type> = <expression>;`.
* Hỗ trợ cú pháp gán lại biến: `<identifier> = <expression>;`.


* **Cấu trúc Rẽ nhánh 3 Hướng (`Branch3Node`):**
* Phân tích khối lệnh rẽ nhánh 3 trạng thái:
```text
branch (expr) {
    -1 -> { /* code khối âm */ }
     0 -> { /* code khối không */ }
    +1 -> { /* code khối dương */ }
}

```


* Xây dựng cấu trúc AST lưu trữ biểu thức điều kiện và 3 con trỏ trỏ tới 3 khối lệnh con riêng biệt.


* **Cấu trúc Vòng lặp Tam phân (`Loop3Node`):**
* Phân tích vòng lặp kiểm tra điều kiện 3 trạng thái hoặc lặp theo bước nhảy Trit.


* **Cấu trúc Định nghĩa Hàm (`FunctionNode`):**
* Phân tích danh sách tham số, kiểu trả về và thân hàm.



---

### Module 2: Phân tích Ngữ nghĩa & Kiểm tra Kiểu Tĩnh (Semantic Analysis & Type Checking)

* **Bảng ký hiệu theo Cấp bậc (Hierarchical Symbol Table):**
* Xây dựng cấu trúc `Scope` dạng cây lồng nhau (Parent/Child scopes) để theo dõi vòng đời và tầm vực biến.
* Ánh xạ mỗi biến cục bộ (Local Variable) vào một chỉ số định danh trên Stack Frame của VM (`local_index`).


* **Trình kiểm tra Kiểu dữ liệu Tĩnh (Static Type Checker):**
* Định nghĩa hệ thống kiểu: `Trit`, `Tryte`, `TAF3`, `TBool`, `Void`.


* Thực hiện kiểm tra tính tương thích kiểu dữ liệu trong các phép gán và biểu thức số học.


* Cấm các phép toán không hợp lệ ở thời điểm biên dịch (Compile-time Error), ví dụ: cấm cộng trực tiếp `tbool` với `taf3` mà không có hàm chuyển đổi tường minh.




* **Bắt lỗi Khai báo & Hằng số:**
* Báo lỗi khi sử dụng biến chưa khai báo hoặc khai báo trùng tên trong cùng một phạm vi.
* Tối ưu hóa hằng số (Constant Folding): Tính toán trước các biểu thức chứa hằng số TAFPU thuần túy ngay trên cây AST trước khi sinh mã.





---

### Module 3: Bộ Sinh Mã Bytecode Tự động (Bytecode Emitter & Patching)

* **Duyệt Cây AST và Ánh xạ Lệnh (AST-to-Bytecode Emitter):**
* Duyệt AST theo thứ tự Hậu tố (Post-order Traversal) để sinh luồng lệnh Stack-based chuẩn xác.
* Quản lý biến cục bộ qua các lệnh mới: `OP_LOAD_LOCAL <index>` và `OP_STORE_LOCAL <index>`.


* **Cơ chế Backpatching cho Nhảy 3 Hướng (3-Way Branch Patching):**
* Khi gặp cấu trúc `branch3`, emitter phát lệnh `OP_JUMP3` với 3 địa chỉ đích tạm thời chưa xác định.
* Duyệt và sinh mã cho từng khối `-1`, `0`, `+1`.
* Ghi đè (Patch) chính xác offset/địa chỉ bytecode thực tế của từng khối vào tham số của `OP_JUMP3`.
* Tự động chèn lệnh nhảy không điều kiện (`OP_JUMP`) ở cuối mỗi khối để thoát khỏi cấu trúc rẽ nhánh về cùng một điểm hội tụ.


* **Quản lý Call Frame & Lời gọi Hàm:**
* Sinh mã cho các lệnh `OP_CALL <func_addr>` và `OP_RETURN`.
* Thiết lập Stack Frame và lưu trữ con trỏ trả về (`Return Address`).



---

### Module 4: Đóng gói Định dạng Nhị phân & CLI Compiler (`setunc`)

* **Thiết kế Định dạng File Nhị phân (`.tbc` - Ternary Bytecode):**
* **Header:** Magic bytes nhận diện file, phiên bản bytecode, kích thước bộ nhớ Tryte yêu cầu.
* **Constant Pool:** Bảng lưu trữ danh sách các hằng số đại số $[A, B, S]$ và chuỗi ký tự.


* **Code Section:** Mảng byte tuyến tính chứa toàn bộ Opcode và toán hạng.


* **Xây dựng Công cụ CLI Trình biên dịch:**
* Tạo binary `setunc` nhận tham số dòng lệnh:
* Biên dịch ra bytecode: `setunc main.taf -o main.tbc`.
* Chạy trực tiếp qua máy ảo: `setunc run main.taf`.
* Xuất mã Assembly trung gian (Disassembly): `setunc --dump-asm main.taf`.





---

### Module 5: Bộ Kiểm thử Mở rộng Giai đoạn 2 (Integration Test Suite)

* **Test Case 1: Phạm vi Biến (Variable Scoping):** Kiểm tra biến cục bộ trong các khối lồng nhau bị hủy đúng lúc khi ra khỏi phạm vi.
* **Test Case 2: Rẽ nhánh Đa tầng (Nested 3-Way Branching):** Kiểm thử độ chính xác của cơ chế backpatching khi lồng nhiều khối `branch3` vào nhau.
* **Test Case 3: Hàm Đệ quy Đại số (Recursive TAFPU Functions):** Viết mã nguồn `.taf` tính toán dãy số hoặc lũy thừa đại số $\mathbb{Q}(\sqrt{3})$ qua đệ quy và thực thi trên máy ảo.


* **Test Case 4: Pipeline Toàn diện (End-to-End Compile & Run):** Đưa file mã nguồn chứa đầy đủ khai báo biến, rẽ nhánh và tính toán số học vào `setunc`, kiểm tra tính toàn vẹn của kết quả cuối cùng.