# Kế Hoạch Triển Khai Chi Tiết: Phase 5 - Hệ Sinh Thái Lập Trình Toàn Diện (Language Server Protocol LSP, VS Code Extension, Auto Formatter & Visual Debugger)
## *Language Server setunc lsp • Tô màu cú pháp TextMate • Tự động format setunc fmt • Trình gỡ lỗi trực quan setunc debug*

---

## 1. Mục Tiêu Cốt Lõi Của Phase 5
Xây dựng trải nghiệm lập trình mượt mà, trực quan và hiện đại như Python/TypeScript cho **Setun 2.0**, hỗ trợ đầy đủ các IDE phổ biến (VS Code, Neovim, Helix, CLion):

1. **Language Server Protocol LSP Server (`setunc lsp`)**:
   - Giao thức chuẩn JSON-RPC 2.0 qua `stdin`/`stdout`.
   - **Real-Time Diagnostics (`publishDiagnostics`)**: Báo lỗi cú pháp, kiểm tra kiểu dữ liệu và phát hiện lỗi ngay khi gõ phím với độ trễ $\le 5\text{ ms}$.
   - **Intellisense / Auto-Completion (`completion`)**: Tự động gợi ý từ khóa (`struct`, `class`, `interface`, `match`, `branch3`, `async`, `await`, `comptime`), kiểu số học đại số (`taf3`, `tvec3`, `tryte`, `int`, `string`), các phương thức và thuộc tính.
   - **Hover Information (`hover`)**: Hiển thị định dạng toán học $\mathbb{Q}(\sqrt{3})$, chữ ký hàm và docstrings khi rê chuột qua biến/hàm.
   - **Go-to-Definition (`definition`)**: Nhảy tức thì đến vị trí khai báo hàm, struct, class hoặc interface.
2. **Bộ Tự Động Định Dạng Mã Nguồn (`setunc fmt`)**:
   - Tự động căn lề 4 dấu cách, chuẩn hóa dấu cách quanh toán tử (`@`, `=>`, `->`, `+`, `*`), căn chỉnh khối lệnh `{ ... }` và cấu trúc rẽ nhánh tam phân `branch3`.
3. **Interactive Visual Debugger & Trực Quan Hóa Tam Phân (`setunc debug`)**:
   - Mô phỏng thực thi từng bước (Step-into, Step-over, Breakpoints, Callstack).
   - Bảng thanh ghi trực quan hóa trạng thái 3 nhánh rẽ (`-1, 0, +1`), giá trị đại số chính xác $[A, B, S]$ trong $\mathbb{Q}(\sqrt{3})$ và bộ nhớ nén Tryte Packed Memory.
4. **Gói Mở Rộng VS Code Extension Package (`editors/vscode/`)**:
   - Cung cấp tệp `syntaxes/setun.tmLanguage.json` tô màu cú pháp TextMate Grammar chuẩn xác.
   - Cấu hình tự động khởi chạy `setunc lsp` khi mở tệp `.stn` hoặc `.setun`.

---

## 2. Thiết Kế Kiến Trúc LSP & IDE Tooling Phase 5

```
       ┌─────────────────────────────────────────────────────────┐
       │             IDE CLIENT (VS Code / Neovim / Helix)       │
       └────────────────────────────┬────────────────────────────┘
                                    │ JSON-RPC 2.0 (stdin/stdout)
                                    ▼
       ┌─────────────────────────────────────────────────────────┐
       │                SETUN LSP SERVER (setunc lsp)            │
       │  - JSON-RPC Dispatcher & Request Router                 │
       │  - Incremental Document Store (In-Memory Buffer Cache)  │
       │  - Fast AST Analyzer & Symbol Table Resolver            │
       └───────┬────────────────────┼────────────────────┬───────┘
               │                    │                    │
               ▼                    ▼                    ▼
       [Diagnostics]        [Auto-Completion]     [Hover/Definition]
       - Syntax Errors      - Keywords, Types     - Exact Math Q(√3)
       - Type Mismatches    - Methods, Fields     - Jump to Source AST
```

---

## 3. Lộ Trình 5 Bước Triển Khai

### Bước 1: Xây Dựng LSP JSON-RPC Server ([`lsp_server.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tools/lsp_server.hpp) & [`lsp_server.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/lsp_server.cpp))
- Cài đặt bộ xử lý JSON-RPC cho `initialize`, `textDocument/didOpen`, `textDocument/completion`, `textDocument/hover`, `textDocument/definition`.
- Tích hợp AST Lexer/Parser để trả về chẩn đoán lỗi thời gian thực (`diagnostics`).

### Bước 2: Xây Dựng Bộ Định Dạng Mã Nguồn Setun Formatter ([`formatter.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tools/formatter.hpp) & [`formatter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/formatter.cpp))
- Cài đặt thuật toán format chuẩn 4-space, định dạng các khối `{ }`, cấu trúc rẽ nhánh `branch3` và toán tử `@`.

### Bước 3: Xây Dựng Visual Debugger ([`debugger.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tools/debugger.hpp) & [`debugger.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/debugger.cpp))
- Chạy từng bước (step, next, break) và in bảng thanh ghi TAFPU $[A, B, S]$ trực quan.

### Bước 4: Xây Dựng Gói Extension VS Code ([`editors/vscode/`](file:///d:/New%20PJ/Ternary/Compiler/Code/editors/vscode/))
- Viết `setun.tmLanguage.json` TextMate grammar và `package.json`.

### Bước 5: Xây Dựng Test Suite & Tích Hợp CLI ([`test_phase5_lsp.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/tests/test_phase5_lsp.cpp))
- Kiểm thử toàn diện các giao thức LSP, Formatter, Debugger và chạy `setunc test` đạt $100\%$ PASS.
