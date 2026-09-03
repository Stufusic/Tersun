# Kế Hoạch Triển Khai Chi Tiết: Xây Dựng Ứng Dụng IDE Độc Lập "Setun Studio" (Logo Số 3 La Mã Ⅲ)
## *Phần mềm IDE hoàn chỉnh • Tạo file & quản lý dự án • Trình soạn thảo cú pháp • 1-Click Run & AOT • Visual Debugger*

---

## 1. Mục Tiêu Cốt Lõi Của Setun Studio IDE
Xây dựng một ứng dụng IDE đồ họa độc lập hoàn chỉnh mang tên **Setun Studio** (tương tự như Python IDLE / VS Code thu nhỏ nhưng chuyên biệt $100\%$ cho điện toán tam phân Setun 2.0):

1. **Nhận Diện Thương Hiệu & Logo**:
   - Biểu tượng **Số 3 La Mã (Ⅲ / III)** cách điệu với ánh sáng Cybernetic Cyan/Emerald, tượng trưng cho 3 trạng thái tam phân $\{-1, 0, 1\}$ và trường số học đại số $\mathbb{Q}(\sqrt{3})$.
2. **Quản Lý Tệp & Tạo File Mới (File Explorer & Project Tree)**:
   - Tạo file mới `.stn` / `.setun` tức thì, mở thư mục dự án, lưu file, đổi tên, xóa file.
   - Các mẫu dự án tạo sẵn (Templates): *Game 3D Physics Zero-Drift, BitNet LLM Inference, TAFPU Math Calculus, Hello Setun*.
3. **Trình Soạn Thảo Mã Nguồn Hiện Đại (Smart Code Editor)**:
   - Tô màu cú pháp TextMate theo thời gian thực (Keywords, Types, F-Strings, `@` MatMul, `branch3`).
   - Đánh số dòng, tự động thụt lề 4-space, tự động đóng ngoặc `{ }`, `[ ]`, `( )`.
   - Báo lỗi cú pháp gạch chân đỏ (Real-time Diagnostics) từ LSP.
4. **Bảng Điều Khiển Thực Thi 1-Click (One-Click Execution Toolbar)**:
   - Nút **▶ Run**: Thực thi mã tức thì qua Setun VM/Interpreter.
   - Nút **⚡ Compile Native AOT**: Biên dịch nhị phân siêu tốc `.exe` qua LLVM AOT Backend.
   - Nút **🪄 Auto Format**: Tự động căn chỉnh code chuẩn (`setunc fmt`).
   - Nút **🔌 C Bindgen**: Quét file header C và tự sinh FFI Wrapper.
5. **Interactive Console & Visual 3-Way Debugger Panel**:
   - Cửa sổ Terminal Output tích hợp hiển thị kết quả chạy.
   - Cửa sổ REPL tương tác trực tiếp: Nhập số học tam phân $[A, B, S]$ và xem kết quả ngay.
   - Bảng trực quan hóa thanh ghi TAFPU $[A, B, S]$ và cờ rẽ nhánh 3 trạng thái $\{-1, 0, +1\}$.

---

## 2. Thiết Kế Kiến Trúc Phần Mềm "Setun Studio"

```
 ┌─────────────────────────────────────────────────────────────────────────────┐
 │  [ Ⅲ ] SETUN STUDIO v2.0  ─  [New File] [Open] [Save] [▶ Run] [⚡ AOT Build]  │
 ├──────────────┬──────────────────────────────────────────────┬───────────────┤
 │ FILE TREE    │ CODE EDITOR (main.stn)                       │ TAFPU MONITOR │
 │ 📁 src/      │ 1 │ fn main() -> int {                       │ [Reg 0]:      │
 │  📄 main.stn │ 2 │     let pos = tvec3([10,0,0], [0,0,0]);  │ A: 10, B: 0   │
 │  📄 math.stn │ 3 │     branch3(pos.x) {                     │ S: 0 (Exact)  │
 │ 📁 assets/   │ 4 │         negative => return -1;           │ ───────────── │
 │ 📄 setun.toml│ 5 │         zero     => return 0;            │ [Branch3 Flag]│
 │              │ 6 │         positive => return 1;            │ [+] POSITIVE  │
 │              │ 7 │     }                                    │ ───────────── │
 │              │ 8 │ }                                        │ Memory: 4 MB  │
 ├──────────────┴──────────────────────────────────────────────┴───────────────┤
 │ TERMINAL & REPL CONSOLE                                                     │
 │ > Output: Successfully compiled to native main.exe in 0.042s (100% PASS)    │
 │ setun> [2, 1, 0] * [2, -1, 0] => [1, 0, 0] (1.00000000, 0% error)          │
 └─────────────────────────────────────────────────────────────────────────────┘
```

---

## 3. Lộ Trình Triển Khai

### Bước 1: Xây Dựng Giao Diện Đồ Họa Setun Studio ([`ide/index.html`](file:///d:/New%20PJ/Ternary/Compiler/Code/ide/index.html), [`style.css`](file:///d:/New%20PJ/Ternary/Compiler/Code/ide/style.css), [`app.js`](file:///d:/New%20PJ/Ternary/Compiler/Code/ide/app.js))
- Logo Số 3 La Mã Ⅲ sắc nét, Dark Mode Cyberpunk sang trọng.
- File Explorer, Smart Editor với Syntax Highlighting, Integrated Terminal & Visual TAFPU Monitor.

### Bước 2: Xây Dựng Máy Chủ Cầu Nối Cục Bộ ([`ide_server.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/ide_server.cpp))
- Cài đặt server phục vụ giao diện và API thực thi code, AOT compile, format, REPL.

### Bước 3: Tạo File Khởi Chạy Nhanh & Tích Hợp Lệnh CLI
- `setun-ide.bat` tại thư mục gốc để mở IDE ngay bằng 1 click.
- Thêm lệnh `setunc ide` / `setunc studio`.
