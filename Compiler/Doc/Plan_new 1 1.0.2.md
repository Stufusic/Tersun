Standard Library Expansion (Mở rộng thư viện chuẩn):

Giữ nguyên tập lệnh (Instruction Set) của QVM 1.0.1.

Viết module thao tác máy ở bản 1.0.2 hoàn toàn bằng Tersun, biên dịch thẳng ra các opcode tính toán/gọi hàm có sẵn của 1.0.1 mà không thêm opcode lạ.

Pipeline xử lý cho Tersun 1.0.2
Plaintext
[Mã nguồn Tersun 1.0.2 (Module Chuột / Phím)]
                     │
                     ▼
       [Compiler Frontend 1.0.2]
       (Lexer -> Parser -> AST)
                     │
                     ▼
      [Bytecode Emitter (Chuẩn 1.0.1)]
                     │
                     ▼
             [Tệp QVM Bytecode]
                     │
                     ▼
            [QVM 1.0.1 Runtime] ──(Syscall/Native Hook)──> [Hệ điều hành / OS Input]
3 bước triển khai cụ thể
Bước 1: Chuẩn hóa giao diện Module ở Tersun 1.0.2

Định nghĩa các hàm cấp cao trong thư viện: mouse_click(button, x, y), mouse_move(x, y), on_click(callback).

Bước 2: Thiết lập cơ chế Native Dispatch

Đảm bảo Tersun 1.0.2 biên dịch các hàm trên thành lệnh gọi FFI/Syscall ID đã định nghĩa từ thời 1.0.1.

Tránh tuyệt đối việc tự ý thêm Opcode mới (như OP_MOUSE_CLICK) vào file bytecode, vì QVM 1.0.1 khi đọc sẽ báo lỗi Unknown Opcode hoặc crash do không có handler trong vòng lặp switch(opcode).

Bước 3: Đóng gói Event Loop

Các tương tác chuột cần vòng lặp lắng nghe liên tục. Hãy thiết kế module ở Tersun 1.0.2 theo cơ chế non-blocking hoặc xử lý trực tiếp trên một thread riêng nếu QVM 1.0.1 hỗ trợ multi-threading/async.