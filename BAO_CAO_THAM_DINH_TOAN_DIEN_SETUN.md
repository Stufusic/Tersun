# BÁO CÁO THẨM ĐỊNH TOÀN DIỆN HỆ THỐNG TRÌNH BIÊN DỊCH & HỆ SINH THÁI SETUN 2.0
**Dự án:** Setun 2.0 Balanced Ternary LLVM Compiler & AOT Toolchain  
**Phạm vi rà soát:** Toàn bộ mã nguồn `Compiler/Code/src`, `include`, `tests`, `tools`, cấu hình build và tài liệu kiến trúc.  
**Ngày thực hiện:** 03/09/2026  
**Đơn vị thẩm định:** Antigravity Advanced Agentic Analysis System  

---

## TỔNG QUAN ĐÁNH GIÁ (EXECUTIVE SUMMARY)

Dự án **Setun 2.0** được định vị là một ngôn ngữ lập trình tam phân cân bằng (Balanced Ternary) kết hợp bộ xử lý số học đại số thực vô tỉ TAFPU trên trường số $\mathbb{Q}(\sqrt{3})$, tích hợp mạng nơ-ron BitNet 1.58-bit không dùng phép nhân, hướng tới mục tiêu hiệu năng native C++ và sai số đại số $0\%$.

Tuy nhiên, qua quá trình rà soát và thẩm định chuyên sâu từng dòng mã nguồn, hệ thống bộc lộ **khoảng cách rất lớn giữa tài liệu thiết kế/kết quả kiểm thử và khả năng thực thi thực tế**. Codebase hiện đang tồn tại **hai thế giới hoàn toàn tách rời nhau**:
1. **Phần thực thi thực tế (Working Core):** Một tập con thủ tục rất hẹp của ngôn ngữ Setun chạy trên máy ảo bytecode (`VMStack`), chỉ hỗ trợ kiểu số cơ bản (`int`, `tryte`, `taf3`, `bool`), cấu trúc rẽ nhánh `branch3`, `while`, và các hàm builtin C++ được gắn cứng (hardcoded).
2. **Phần mô phỏng hình thức (Disconnected Mockups):** Các tính năng nâng cao được quảng bá trong tài liệu và vượt qua test suite (`setunc test`) — như Tri-Color GC, Microkernel, Actor System, Lock-Free Queue, Gauss-Jordan Matrix Solver, Struct/Class/Interface, AOT LLVM Native — thực chất là các lớp C++ rời rạc được viết riêng trong các tệp kiểm thử để tự `assert` lẫn nhau. **Trình biên dịch Setun không hề biên dịch hoặc tích hợp các tính năng này vào ngôn ngữ.**

Đồng thời, hệ thống đang tiềm ẩn nhiều **lỗi rò rỉ bộ nhớ nghiêm trọng (OOM leak), nghẽn cổ chai CPU làm đóng băng máy (Freezing), tiến trình con chạy ngầm không thể dọn dẹp (Zombie processes), và nguy cơ crash toàn bộ tiến trình khi gọi FFI.**

---

## MỤC LỤC
1. [Phân Tích Các Lỗi Tiềm Ẩn & Logic Gây Bug (Critical & Hidden Bugs)](#1-phân-tích-các-lỗi-tiềm-ẩn--logic-gây-bug)
2. [Các Khâu Làm Suy Giảm Hiệu Năng, Đơ Máy & Nguy Cơ Crash Hệ Thống](#2-các-khâu-làm-suy-giảm-hiệu-năng-đơ-máy--nguy-cơ-crash-hệ-thống)
3. [Rà Soát Các Thành Phần Dư Thừa, Bất Hợp Lý & "Tính Năng Ảo"](#3-rà-soát-các-thành-phần-dư-thừa-bất-hợp-lý--tính-năng-ảo)
4. [Bảng Đối Chiếu: Cam Kết Kiến Trúc vs. Hiện Trạng Mã Nguồn](#4-bảng-đối-chiếu-cam-kết-kiến-trúc-vs-hiện-trạng-mã-nguồn)
5. [Đề Xuất Chiến Lược Phát Triển & Lộ Trình Tái Thiết Ngôn Ngữ](#5-đề-xuất-chiến-lược-phát-triển--lộ-trình-tái-thiết-ngôn-ngữ)

---

## 1. PHÂN TÍCH CÁC LỖI TIỀM ẨN & LOGIC GÂY BUG

### 1.1. Lỗi Tràn & Lệch Ngăn Xếp Toán Hạng VM Do BytecodeEmitter Bỏ Rơi Biểu Thức
- **Vị trí:** [`src/compiler/emitter.cpp:869-887`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L869-L887)
- **Bản chất lỗi:**
  Khi người dùng viết các biểu thức truy cập thuộc tính (`obj.field`), gọi phương thức (`obj.method(arg)`), hoặc lập chỉ mục mảng (`arr[index]`), hàm phát sinh mã trong `BytecodeEmitter` xử lý như sau:
  ```cpp
  void BytecodeEmitter::emit_member_access(const MemberAccessExpr& expr) {
      if (expr.object) emit_expr(expr.object); // Đẩy object lên stack rồi... để nguyên!
  }

  void BytecodeEmitter::emit_method_call(const MethodCallExpr& expr) {
      if (expr.object) emit_expr(expr.object); // Đẩy object
      for (Expr* arg : expr.args) emit_expr(arg); // Đẩy toàn bộ args
      // KHÔNG CÓ BẤT KỲ OPCODE NÀO ĐƯỢC PHÁT SINH!
  }

  void BytecodeEmitter::emit_index(const IndexExpr& expr) {
      if (expr.object) emit_expr(expr.object);
      if (expr.index) emit_expr(expr.index);
      // KHÔNG CÓ OPCODE ĐỌC PHẦN TỬ MẢNG!
  }
  ```
- **Hậu quả:** 
  Các giá trị của `object` và `args` bị bỏ rơi vĩnh viễn trên ngăn xếp `VMStack`. Trong một vòng lặp gọi hàm hoặc đọc mảng, ngăn xếp toán hạng sẽ liên tục phình to không kiểm soát, làm sai lệch kết quả của tất cả các phép toán phía sau và dẫn tới ngoại lệ `VM Stack Index Out of Bounds` hoặc tràn bộ nhớ stack.

### 1.2. Lỗi Rò Rỉ Bộ Nhớ Heap Nghiêm Trọng Trong ArenaAllocator
- **Vị trí:** [`include/compiler/arena.hpp:52-56`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/arena.hpp#L52-L56) & [`include/compiler/ast.hpp:106-124`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/ast.hpp#L106-L124)
- **Bản chất lỗi:**
  `ArenaAllocator` sử dụng kỹ thuật *Placement New* để khởi tạo các node AST:
  ```cpp
  template <typename T, typename... Args>
  T* make(Args&&... args) {
      void* mem = allocate(sizeof(T), alignof(T));
      return new (mem) T(std::forward<Args>(args)...);
  }
  ```
  Tuy nhiên, khi `ArenaAllocator` bị giải phóng hoặc gọi hàm `reset()`, nó chỉ thu hồi các mảng byte thô `std::unique_ptr<uint8_t[]> blocks_` mà **hoàn toàn không gọi hàm hủy `~T()` của các đối tượng được tạo ra!**
  Trong khi đó, hầu hết các cấu trúc AST trong `ast.hpp` đều chứa các thành phần cấp phát bộ nhớ động trên Heap chuẩn:
  - `StringLiteralExpr::value` (`std::string`)
  - `IdentifierExpr::name` (`std::string`)
  - `CallExpr::args` (`std::vector<Expr*>`)
  - `BlockStmt::statements` (`std::vector<Stmt*>`)
  - `FnDeclStmt::params` (`std::vector<Parameter>`)
- **Hậu quả:**
  Toàn bộ bộ nhớ heap do `std::string` và `std::vector` cấp phát bên trong AST bị bỏ quên và **rò rỉ $100\%$ sau mỗi lần biên dịch**.
  - Trong chế độ REPL (`main.cpp:409`), biến `ArenaAllocator arena` được đặt bên ngoài vòng lặp `while(true)`. Mỗi dòng lệnh người dùng nhập vào sẽ tích tụ rò rỉ RAM vô hạn.
  - Trong `LSPServer::analyze_document`, mỗi lần lập trình viên gõ một ký tự trong editor, toàn bộ cây AST được sinh ra và rò rỉ toàn bộ chuỗi ký tự trên RAM hệ thống.

### 1.3. Lỗi Công Cụ Bindgen Tự Sinh Mã Nhưng Compiler Không Thể Biên Dịch Được
- **Vị trí:** [`src/tools/bindgen.cpp:81-115`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/bindgen.cpp#L81-L115) & [`src/compiler/lexer.cpp:97-136`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/lexer.cpp#L97-L136)
- **Bản chất lỗi:**
  Công cụ `setunc bindgen` được thiết kế để quét file header C/C++ và sinh mã Setun FFI. Nó tạo ra các dòng mã có cú pháp:
  ```rust
  extern "C" fn InitWindow(width: int, height: int, title: string) -> void;
  ```
  (Xem minh chứng thực tế trong tệp do hệ thống sinh: [`setun_raylib.stn`](file:///d:/New%20PJ/Ternary/Compiler/Code/setun_raylib.stn#L22)).
  Tuy nhiên, trong `lexer.cpp` và `parser.cpp`, **từ khóa `extern` hoàn toàn không tồn tại trong danh sách từ khóa `KEYWORDS` và không có bất kỳ logic phân tích ngữ pháp nào cho `extern`!**
- **Thử nghiệm thực tế:**
  Chạy lệnh: `setunc compile setun_raylib.stn -o test.tbc`
  Kết quả trả về:
  `[Compilation Error]: [Parser Error] Line 22:8 - Expected ';' after expression statement. (Got '"C"' [STRING_LITERAL])`
  **Kết luận:** Công cụ bindgen sinh ra mã nguồn mà chính trình biên dịch của nó không thể đọc được.

### 1.4. Lỗi Đổ Vỡ Kiểu Dữ Liệu Trong LLVM/C++ Native Transpiler
- **Vị trí:** [`src/compiler/llvm_emitter.cpp:38-43`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/llvm_emitter.cpp#L38-L43) & [`src/compiler/llvm_emitter.cpp:84`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/llvm_emitter.cpp#L84)
- **Bản chất lỗi:**
  Trong chế độ dịch AOT sang mã nguồn C20 (`emit_native_c`), bộ phát sinh mã tự ý gán cứng **mọi biến và mọi tham số hàm** thành kiểu đại số `TafpuNum_C`:
  ```cpp
  // Mọi biến đều biến thành TafpuNum_C:
  oss << pad << "TafpuNum_C " << s.name << " = ";
  
  // Mọi hàm đều có kiểu trả về và tham số là TafpuNum_C:
  oss << "TafpuNum_C " << fname << "(";
  for (...) oss << "TafpuNum_C " << fn.params[i].name;
  ```
- **Hậu quả:**
  Nếu chương trình Setun có khai báo biến chuỗi `let msg: string = "Hello"`, mã C++ sinh ra sẽ là:
  ```cpp
  TafpuNum_C msg = "Hello"; // LỖI BIÊN DỊCH C++ NGAY LẬP TỨC!
  ```
  Nếu có hàm trả về `bool` hoặc `string`, kiểu trả về bị cưỡng bức thành `TafpuNum_C`. Pipeline AOT Native hiện tại hoàn toàn không có khả năng biên dịch bất kỳ chương trình nào có chứa chuỗi, mảng hoặc logic không phải là số học TAFPU.

### 1.5. Lỗi Tràn Số Nguyên 64-Bit & Mất Dấu Số Học Trong TAFPU
- **Vị trí:** [`src/tafpu/tafpu.cpp:142-154`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tafpu/tafpu.cpp#L142-L154) & [`src/tafpu/tafpu.cpp:18-23`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tafpu/tafpu.cpp#L18-L23)
- **Bản chất lỗi:**
  1. **Môi trường MSVC (Windows chuẩn):** Macro `__SIZEOF_INT128__` không tồn tại trên MSVC. Trình biên dịch sẽ nhảy vào nhánh `#else`:
     ```cpp
     int64_t a_res = x1.a * x2.a + 3 * x1.b * x2.b;
     int64_t b_res = x1.a * x2.b + x2.a * x1.b;
     ```
     Chỉ cần hai hệ số đạt độ lớn khoảng $\approx 1.5 \times 10^9$, tích của chúng vượt quá giới hạn $2^{63}-1 \approx 9.22 \times 10^{18}$. Trong chuẩn C++, tràn số nguyên có dấu là **Hành vi không xác định (Undefined Behavior)**, dẫn đến giá trị đảo dấu âm bất thường và sai lệch hoàn toàn kết quả tính toán.
  2. **Mất độ chính xác trong `shift_right`:**
     ```cpp
     void TafpuNum::shift_right() {
         int64_t old_a = a;
         a = b;
         b = old_a / 3; // Phép chia số nguyên làm tròn xuống (TRUNCATION)!
         s += 1;
     }
     ```
     Một số TAFPU biểu diễn $(A + B\sqrt{3}) \cdot 3^{S/2}$. Khi chia cho $\sqrt{3}$, phần tử mới phải là $(B + \frac{A}{3}\sqrt{3})$. Nếu $A$ không chia hết cho 3, phép chia nguyên vứt bỏ phần dư, gây sai số vĩnh viễn và phá vỡ nguyên lý "Bảo toàn sai số 0%".
  3. **Hàm so sánh `tafpu_cmp` phá vỡ toán học đại số:**
     ```cpp
     int tafpu_cmp(const TafpuNum& x1, const TafpuNum& x2) {
         if (x1.a == x2.a && x1.b == x2.b && x1.s == x2.s) return 0;
         double d1 = x1.to_double();
         double d2 = x2.to_double();
         if (d1 < d2) return -1;
         if (d1 > d2) return 1;
         return 0;
     }
     ```
     Hàm so sánh không dùng đại số chính xác mà ép về số thực nhị phân IEEE 754 `double`. Hai số đại số khác nhau ở phần cực nhỏ sẽ bị làm tròn bằng nhau do sai số 53-bit mantissa của chuẩn IEEE 754.

### 1.6. Lỗi Crash Ngay Lập Tức Khi Dùng FFI Nạp Bytecode Có Chứa Chuỗi
- **Vị trí:** [`src/ffi/libsetun_ffi.cpp:30-37`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/ffi/libsetun_ffi.cpp#L30-L37)
- **Bản chất lỗi:**
  ```cpp
  int setun_load_bytecode(SetunVM_Handle vm, const uint8_t* bytecode, size_t size) {
      if (!vm || !bytecode || size == 0) return -1;
      Chunk chunk;
      chunk.code.assign(bytecode, bytecode + size);
      chunk.lines.resize(size, 1);
      // chunk.string_table HOÀN TOÀN BỊ BỎ TRỐNG!
      vm->vm_instance.run(chunk);
      return 0;
  }
  ```
  Nếu file bytecode có lệnh `OP_PUSH_STRING` (ví dụ in text hoặc gọi API đồ họa), VM sẽ đọc `str_id` và đối chiếu với `chunk.string_table`. Vì bảng chuỗi rỗng, VM lập tức ném ra ngoại lệ `VMException`. Do hàm FFI không có khối `try ... catch`, ngoại lệ C++ văng qua biên giới C ABI, kích hoạt `std::terminate()` và **làm crash toàn bộ tiến trình ứng dụng mẹ (Host Application) lập tức.**

---

## 2. CÁC KHÂU LÀM SUY GIẢM HIỆU NĂNG, ĐƠ MÁY & NGUY CƠ CRASH HỆ THỐNG

### 2.1. Tiến Trình Con "Ma" (Zombie Processes) & Rò Rỉ Tài Nguyên Hệ Thống Từ Setun2D
- **Vị trí:** [`src/graphics/setun2d_bridge.cpp:90-130`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/graphics/setun2d_bridge.cpp#L90-L130) & [`setun2d_bridge.cpp:249-255`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/graphics/setun2d_bridge.cpp#L249-L255)
- **Cơ chế hoạt động:**
  Mô-đun đồ họa của ngôn ngữ Setun không giao tiếp trực tiếp với OpenGL, DirectX hay Vulkan, mà khởi động một tiến trình Java Swing ngầm thông qua đường ống ẩn danh Windows Pipes:
  `java -cp "tools/setun2d" setun2d.Setun2DRenderer`
- **Các nguy cơ gây đơ và crash máy tính:**
  1. **Tạo tiến trình zombie làm cạn kiệt RAM:**
     Trong hàm `close()`:
     ```cpp
     if (h_process_) {
         WaitForSingleObject((HANDLE)h_process_, 500); // Đợi 0.5s
         CloseHandle((HANDLE)h_process_); // Đóng handle nhưng KHÔNG KILL TIẾN TRÌNH!
         h_process_ = nullptr;
     }
     ```
     Nếu máy ảo Java bận xử lý đồ họa hoặc bị khựng hơn 500ms, Setun đóng handle nhưng **tiến trình `java.exe` vẫn tiếp tục chạy ngầm trong Windows Task Manager**. Mỗi tiến trình Java Swing ngốn từ 150MB đến 350MB RAM. Trong quá trình phát triển (lập trình viên chạy thử game rắn hoặc demo đồ họa nhiều lần từ IDE `setun_studio.pyw`), hàng chục tiến trình Java ma sẽ âm thầm tích lũy, nhanh chóng nuốt trọn bộ nhớ RAM của hệ thống (RAM Exhaustion), kích hoạt hiện tượng phân trang ổ đĩa (Disk Thrashing) và làm treo cứng toàn bộ máy tính của người dùng!
  2. **Treo đơ I/O vĩnh viễn (Deadlock on Pipe):**
     Hàm `Setun2DBridge::flip()` thực hiện đọc đồng bộ chặn `ReadFile((HANDLE)h_out_rd_, resp, 2, ...)`. Nếu cửa sổ Java bị lỗi, treo, hoặc người dùng thu nhỏ cửa sổ khiến Java chậm gửi phản hồi, tiến trình Setun sẽ bị **treo đơ hoàn toàn ở mức hệ điều hành (Unresponsive Process)**, không thể nhận input và không thể thoát tự nhiên.

### 2.2. Vòng Lặp Vét Cạn Trong `encode_dynamic` Làm Tê Liệt CPU (100% Core Lockup)
- **Vị trí:** [`src/tafpu/tafpu.cpp:88-116`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tafpu/tafpu.cpp#L88-L116)
- **Cơ chế tính toán:**
  ```cpp
  TafpuNum encode_dynamic(double val, int b_search_range) {
      // ...
      while (std::abs(v) < 100.0) {
          s -= 1;
          v = val / std::pow(3.0, s / 2.0); // Gọi pow() liên tục trong vòng lặp!
      }
      // Quét tuyến tính tìm B tốt nhất:
      for (int b = -b_search_range; b <= b_search_range; ++b) { // Mặc định b_search_range = 1000
          // Tính toán căn thức và làm tròn...
      }
  }
  ```
- **Hậu quả hiệu năng:**
  - Để mã hóa **MỘT con số thực duy nhất** sang số TAFPU, giải thuật thực hiện đúng **2,001 vòng lặp** với hàng loạt phép tính số thực dấu phẩy động và làm tròn.
  - Trong các ứng dụng thực tế như nạp tập dữ liệu ảnh MNIST, khởi tạo ma trận trọng số, hoặc cập nhật tọa độ vật lý cho 1,000 vật thể, số phép toán lên tới:
    $$10,000 \text{ phần tử} \times 2,001 \text{ chu kỳ} \approx \mathbf{20,010,000} \text{ phép tính floating-point}$$
  - Điều này làm CPU tăng vọt lên $100\%$, gây giật lag nghiêm trọng, quạt tản nhiệt quay tối đa và thời gian khởi động chương trình kéo dài bất thường mà không mang lại giá trị tương xứng.

### 2.3. Rủi Ro Bảo Mật & Lỗi Thực Thi Lệnh Tạm Bợ Qua `std::system`
- **Vị trí:** [`src/main.cpp:525-528`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/main.cpp#L525-L528) & [`src/compiler/llvm_emitter.cpp:947, 972`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/llvm_emitter.cpp#L947-L972)
- **Bản chất vấn đề:**
  - Tùy chọn `--jit` trong `main.cpp` thực chất không phải là JIT Compiler (như LLVM ORC JIT hay AsmJit). Nó ghi mã LLVM ra đĩa, gọi `std::system("setun_jit_exec.exe")`, rồi xóa tệp thực thi!
  - Lệnh `compile_native` ghép chuỗi câu lệnh thô:
    ```cpp
    cmd << "g++ -std=c++20 -O" << opt_level 
        << " -Iinclude -I\"../include\" -I\"Code/include\" ... \"" << temp_c_file << "\" -o \"" << output_path << "\"";
    std::system(cmd.str().c_str());
    ```
- **Rủi ro:**
  1. **Shell Injection:** Nếu đường dẫn thư mục dự án chứa dấu cách (như `d:\New PJ\...`), dấu ngoặc hoặc các ký tự điều khiển shell (`&`, `|`, `;`), câu lệnh sẽ bị cắt đứt hoặc vô tình kích hoạt các câu lệnh shell nguy hiểm.
  2. **Bị Antivirus chặn (False Positive Heuristic):** Việc một tiến trình liên tục sinh ra tệp `.tmp.cpp` và `.exe` trong thư mục hiện tại rồi tự động kích hoạt thực thi qua shell là hành vi điển hình bị Windows Defender và các phần mềm diệt virus chặn (block), khiến trình biên dịch bị đứng hoặc trả về mã lỗi 1.
  3. **Đường dẫn include phụ thuộc vị trí tương đối:** Các tham số `-I"Code/include" -I"Compiler/Code/include"` được gắn cứng dạng tương đối. Nếu người dùng đứng từ thư mục khác để gọi `setunc`, việc biên dịch sẽ lập tức sụp đổ vì không tìm thấy file header.

### 2.4. Sao Chép Chuỗi Giá Trị Sâu (Deep Copy) Làm Phân Mảnh Bộ Nhớ VM
- **Vị trí:** [`include/vm/value.hpp:24-34`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp#L24-L34)
- **Bản chất:**
  `VMValue` lưu trữ chuỗi dưới dạng `std::string` trực tiếp trong `std::variant`. Máy ảo thực thi theo mô hình ngăn xếp: mỗi lần `push`, `pop`, `dup`, truyền tham số hàm, hoặc gán biến là một lần sao chép toàn bộ bộ đệm chuỗi (Deep Copy heap allocation). Trong các tác vụ xử lý văn bản, in log hay render text game ở 60 FPS, hàng triệu chuỗi ngắn được cấp phát và giải phóng liên tục, gây phân mảnh bộ nhớ trầm trọng (Heap Fragmentation) và làm suy giảm hiệu năng VM nghiêm trọng.

---

## 3. RÀ SOÁT CÁC THÀNH PHẦN DƯ THỪA, BẤT HỢP LÝ & "TÍNH NĂNG ẢO"

Một trong những vấn đề lớn nhất của codebase hiện tại là sự hiện diện của hàng loạt mô-đun được xây dựng rất đồ sộ nhưng **hoàn toàn không được tích hợp vào ngôn ngữ**, sinh ra chỉ để phục vụ việc vượt qua các bài Unit Test hình thức:

```
┌────────────────────────────────────────────────────────────────────────┐
│               THỰC TRẠNG PHÂN MẢNH MÃ NGUỒN SETUN 2.0                 │
└────────────────────────────────────────────────────────────────────────┘
  [NGÔN NGỮ SETUN (.stn)]           [CÁC MÔ-ĐUN C++ HOÀN TOÀN BỎ HOANG]
         │                                       │
         ▼                                       ├── TriColorGC (gc.cpp)
  ┌─────────────┐                                ├── TernaryMicrokernel (microkernel.cpp)
  │ Lexer/Parser│                                ├── GameWorldEngine (game_engine_integration.cpp)
  └──────┬──────┘                                ├── Lock-free SPSC/MPMC Queue
         │ (Chỉ chạy kiểu cơ bản)                ├── TriPriorityScheduler & Actor System
         ▼                                       ├── PackedTensor & std_tensor (tensor engine)
  ┌─────────────┐                                ├── FrameArena & ArcHeader
  │ VM / Emitter│                                └── VisualDebugger (debugger.cpp)
  └─────────────┘                                        ▲
         │ (Chỉ gọi các C++ Builtins)                    │
         └───────────────────────────────────────────────┘
                     KHÔNG HỀ KẾT NỐI VỚI NHAU!
```

### 3.1. Danh Sách Các Thành Phần Thừa Thãi & Không Có Tác Dụng Trong Compiler

| Thành phần | Vị trí tệp | Thực trạng trong hệ thống | Đánh giá |
| :--- | :--- | :--- | :--- |
| **TriColorGC** | `src/vm/gc.cpp`<br>`include/vm/gc.hpp` | Hoàn toàn không được VM khởi tạo hay sử dụng. VM tự quản lý giá trị bằng `std::variant` trên stack. Hàm `sweep()` còn dính thuật toán xóa $O(N^2)$ trong `std::vector`. Chỉ được gọi trong tệp `test_part4.cpp`. | **Thừa thãi $100\%$**. Gây hiểu lầm rằng ngôn ngữ có GC tam phân tự động. |
| **TernaryMicrokernel** | `src/kernel/microkernel.cpp` | Mô phỏng quản lý trang nhớ Tryte và hàng đợi task Round-Robin độc lập. Không gắn với luồng của VM, không quản lý bộ nhớ của Setun. Chỉ phục vụ `test_part5.cpp`. | **Không cần thiết**. Không thuộc phạm vi của một Compiler Toolchain. |
| **GameWorldEngine** | `src/game/game_engine_integration.cpp` | Chứa 3 hàm C++ tính khoảng cách NPC và công thức damage. Ngôn ngữ Setun không có cú pháp nào gọi được engine này. Chỉ dùng trong `test_part5.cpp`. | **Mã rác (Dead Code)**. Nên loại bỏ khỏi thư viện core của compiler. |
| **Actor System & Scheduler** | `include/runtime/actor_system.hpp`<br>`async_scheduler.hpp` | Hệ thống diễn viên và hàng đợi Lock-Free được viết bằng template C++ hiện đại. Tuy nhiên trình biên dịch không hề sinh mã ra hệ thống này; cú pháp `async` bị emitter bỏ qua, cú pháp `await` gây lỗi parser. | **Tách rời**. Cần đưa vào roadmap tương lai hoặc tách thành thư viện ngoài. |
| **Tensor Engine** | `include/compiler/std_tensor.hpp`<br>`packed_tensor.hpp` | Thư viện tensor C++ hỗ trợ CORDIC và BitNet MatMul. Không có cú pháp nào trong ngữ pháp của Setun gọi được các class này. | **Tách rời**. Chưa được phơi bày (expose) ra tầng ngôn ngữ. |
| **Visual Debugger** | `src/tools/debugger.cpp` | Hàm `start_session()` in ra đúng một khung chữ nhật ASCII với thanh ghi số 0 rồi thoát chương trình ngay lập tức. Không hỗ trợ breakpoint, step-by-step hay CLI tương tác. | **Mô phỏng hình thức**. Không có giá trị sử dụng thực tế. |
| **LSP Server** | `src/tools/lsp_server.cpp` | Giao thức JSON-RPC được xử lý bằng tìm kiếm chuỗi thô (`.find()`) thay vì parser JSON. Luôn in ra `Content-Length: 0\r\n\r\n` vô nghĩa khi khởi động. Không gửi chẩn đoán lỗi (diagnostics) về IDE. Tooltip hover luôn trả về 1 chuỗi cố định. | **Chưa hoàn thiện**. Dễ làm đơ plugin VSCode kết nối tới nó. |
| **TPM Package Manager** | `src/tools/tpm.cpp` | Lệnh `init` tạo file `setun.toml` nhưng không tạo thư mục `src/` và file `src/main.taf`. Khi chạy lệnh `build`, chương trình lập tức báo lỗi thiếu file. Không hỗ trợ quản lý dependency hay tải gói. | **Mô phỏng**. Cần hoàn thiện logic filesystem thực tế. |
| **ArcHeader & FrameArena** | `include/compiler/native_runtime.hpp` | Khai báo cấu trúc bộ nhớ trong header nhưng trình biên dịch AOT không phát sinh bất kỳ dòng mã nào sử dụng hai cấu trúc này. | **Dead Code**. |

---

## 4. BẢNG ĐỐI CHIẾU: CAM KẾT KIẾN TRÚC VS. HIỆN TRẠNG MÃ NGUỒN

Để có cái nhìn minh bạch nhất, bảng dưới đây đối chiếu trực tiếp các tiêu chí trong tài liệu quy tắc của dự án ([`Rule.md`](file:///d:/New%20PJ/Ternary/Compiler/Doc/Rule.md)) và các kế hoạch giai đoạn ([`Plan_part1.md` – `Plan_part5.md`](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan.md)) với những gì đang thực sự chạy trong mã nguồn C++:

| Tiêu chuẩn / Cam kết dự án | Hiện trạng thực tế trong mã nguồn | Mức độ vi phạm |
| :--- | :--- | :--- |
| **"Cấm new/delete trần, bắt buộc Arena hoặc Smart Pointer"** | `libsetun_ffi.cpp:21` dùng `new SetunVM_T()` và `delete vm`. `ArenaAllocator` dùng placement new nhưng **bỏ quên toàn bộ destructor**, làm rò rỉ toàn bộ chuỗi ký tự trên heap. | **Nghiêm trọng** (Vi phạm trực tiếp quy chuẩn bộ nhớ). |
| **"Bảo toàn sai số đại số 0% trên $\mathbb{Q}(\sqrt{3})$"** | `tafpu_cmp` ép kiểu sang `double` IEEE 754 để so sánh. `shift_right` dùng phép chia nguyên làm tròn xuống (truncate). `tafpu_add_c` trong native runtime nếu số mũ lẻ thì vứt bỏ luôn hệ số $B\sqrt{3}$. | **Nghiêm trọng** (Mất tính toàn vẹn đại số). |
| **"Ngăn ngừa tràn số nguyên 64-bit"** | Không kiểm tra tràn số trong `tafpu_mul` và `tafpu_div` trên MSVC. Khi số mũ lớn, `align_tafpu` nhân dồn liên tục gây tràn `int64_t`. | **Cao** (Dẫn tới Undefined Behavior). |
| **"Hỗ trợ Hướng đối tượng & Đa hình (OOP, Struct, Class)"** | Parser phân tích được cú pháp, nhưng `BytecodeEmitter` đặt rỗng `/* Struct metadata registered */`, không phát sinh opcode cho struct, field access hay method call. | **Chưa triển khai** (Chỉ tồn tại ở tầng cú pháp AST). |
| **"Bộ thu gom rác Tri-Color GC triệt tiêu rò rỉ"** | Bộ GC được viết riêng nhưng VM không hề gọi tới. Toàn bộ giá trị VM vẫn lưu trên stack C++ bằng `std::variant`. | **Ảo** (Không kết nối vào hệ thống). |
| **"Hệ thống bất đồng bộ Async / Await"** | Parser không nhận diện được từ khóa `await` (ném lỗi cú pháp). Cờ `async` trong khai báo hàm bị Emitter phớt lờ hoàn toàn. | **Lỗi cú pháp** (Không thể biên dịch). |
| **"Bộ công cụ FFI tự động sinh mã (Bindgen)"** | Sinh mã chứa `extern "C" fn`, nhưng chính Compiler không có từ khóa `extern`, dẫn tới file sinh ra bị compiler từ chối biên dịch. | **Lỗi logic công cụ** (Tự mâu thuẫn). |
| **"Tích hợp đồ họa 2D Native GPU 60 FPS"** | Thực chất gọi một tiến trình `java.exe` qua anonymous pipe. Gặp sự cố rò rỉ tiến trình Java ma và nguy cơ treo đơ I/O. | **Bất hợp lý kiến trúc** (Chậm và nặng nề). |

---

## 5. ĐỀ XUẤT CHIẾN LƯỢC PHÁT TRIỂN & LỘ TRÌNH TÁI THIẾT NGÔN NGỮ

Để biến Setun từ một dự án thử nghiệm chứa nhiều mockup thành một **ngôn ngữ lập trình tam phân thế hệ mới thực thụ, chạy ổn định, an toàn và đạt hiệu năng cao**, đề xuất nhóm phát triển tập trung tái cấu trúc theo 4 giai đoạn sau:

### Trục 1: Tinh Gọn Hệ Thống & Loại Bỏ Mã Rác (Clean-up & Consolidation)
1. **Dọn sạch các mô-đun ngụy tạo (Prune Dead Code):**
   - Loại bỏ hoặc tách rời `microkernel.cpp`, `game_engine_integration.cpp`, và `gc.cpp` (hiện tại) ra khỏi thư mục biên dịch chính. Không đưa các bài test tự tạo không liên quan vào bộ test suite của ngôn ngữ.
   - Thống nhất các bài test: Kiểm thử trình biên dịch phải được thực hiện bằng cách **viết mã nguồn `.stn` và chạy qua `setunc run` hoặc `setunc compile`**, thay vì viết mã C++ rồi tự gọi hàm C++.
2. **Sửa dứt điểm rò rỉ bộ nhớ của `ArenaAllocator`:**
   - Hoặc chuyển đổi AST sang sử dụng `std::pmr` (Polymorphic Memory Resources) chuẩn của C++17/20 với `monotonic_buffer_resource` và các allocator container (`pmr::string`, `pmr::vector`).
   - Hoặc bổ sung danh sách theo dõi hàm hủy (Destructor Chain) trong `ArenaAllocator` để gọi hàm hủy của các node khi arena bị reset:
     ```cpp
     struct DestructorNode {
         void (*destroy)(void*);
         void* object;
         DestructorNode* next;
     };
     ```

### Trục 2: Hoàn Thiện Ngữ Nghĩa Ngôn Ngữ & Bytecode Pipeline (Core Semantics)
1. **Triển khai đầy đủ Struct & Member Access trong VM:**
   - Bổ sung Opcode cho việc thao tác trường dữ liệu:
     - `OP_GET_FIELD <field_index>`: Đọc thuộc tính của struct/instance từ đỉnh stack.
     - `OP_SET_FIELD <field_index>`: Gán thuộc tính của struct/instance.
     - `OP_ALLOC_STRUCT <type_id>`: Cấp phát bản ghi giá trị (Value Record) trên heap/stack.
   - Sửa các hàm `emit_member_access`, `emit_method_call`, `emit_index` trong `emitter.cpp` để phát sinh opcode thực tế thay vì bỏ rơi giá trị trên ngăn xếp.
2. **Sửa lỗi cú pháp Bindgen & Bổ sung từ khóa `extern`:**
   - Thêm `KW_EXTERN` vào `token.hpp` và danh sách từ khóa trong `lexer.cpp`.
   - Cập nhật `parser.cpp` để nhận diện các khối `extern "C" fn name(...) -> type;`, lưu vào bảng ký hiệu FFI để VM có thể liên kết động tới các thư viện `.dll` / `.so`.
3. **Hiện thực hóa String Interning:**
   - Thay vì sao chép `std::string` qua `std::variant`, sử dụng bảng chuỗi dùng chung (String Pool / String Interning) bằng con trỏ định danh `uint32_t string_id`. Mọi thao tác sao chép chuỗi trong VM sẽ chỉ tốn 4 bytes thay vì cấp phát heap liên tục.

### Trục 3: Cải Cấu Trúc Lõi Toán Học TAFPU & Triệt Tiêu Nghẽn CPU
1. **Tối ưu hóa thuật toán `encode_dynamic`:**
   - Thay thế vòng quét tuyến tính $2,001$ bước bằng thuật toán xấp xỉ liên phân số (Continued Fractions) hoặc phương pháp mạng điểm tương thích Weyl.
   - Giới hạn bước quét dựa trên ngưỡng epsilon sai số chấp nhận được, triệt tiêu việc gọi hàm `pow()` lặp đi lặp lại.
2. **Bảo vệ chống tràn số nguyên trên mọi nền tảng (MSVC & GCC):**
   - Sử dụng các intrinsic nhân 64-bit ra 128-bit chuyên dụng trên MSVC như `_mul128` và `_addcarry_u64` (trong `<immintrin.h>`) để đảm bảo không bị tràn số khi biên dịch trên Windows mà không cần GCC `__int128_t`.
   - Triệt tiêu phép chia nguyên làm tròn trong `shift_right`: Nếu số không chia hết cho 3, giữ nguyên hệ số và mở rộng tỉ lệ bằng cách cân bằng mẫu số đại số.
3. **So sánh đại số thuần túy (Pure Algebraic Comparison):**
   - Thay thế hàm so sánh bằng `to_double()` bằng phương pháp so sánh dấu đại số:
     Để so sánh $A_1 + B_1\sqrt{3}$ và $A_2 + B_2\sqrt{3}$, ta chuyển vế thành $(A_1 - A_2)$ và $(B_2 - B_1)\sqrt{3}$, sau đó so sánh dấu và bình phương hai vế có xét dấu. Phương pháp này bảo toàn độ chính xác tuyệt đối mà không cần dùng đến một phép tính dấu phẩy động nào!

### Trục 4: Loại Bỏ Java Bridge, Xây Dựng Đồ Họa & AOT Native Chuẩn Mực
1. **Thay thế Setun2D Java Bridge bằng Thư Viện Native Nhẹ (Raylib / SDL2):**
   - **Xóa bỏ hoàn toàn việc tạo tiến trình `java.exe` qua anonymous pipe.** Đây là nguyên nhân hàng đầu gây hao tổn RAM, tiến trình ma và đơ máy.
   - Biên dịch tĩnh thư viện **Raylib** hoặc **SDL2** trực tiếp vào `setunc.exe`. Bộ opcode đồ họa (`OP_GFX_CLEAR`, `OP_GFX_DRAW_RECT`, `OP_GFX_FLIP`) sẽ gọi trực tiếp các hàm C của Raylib trong cùng một tiến trình:
     - Tốc độ khung hình tăng vọt từ cơ chế pipe sang dựng hình GPU phần cứng thuần túy.
     - Dung lượng bộ nhớ tiêu thụ cho game giảm từ 300MB Java xuống còn dưới 15MB Native RAM!
     - Triệt tiêu hoàn toàn nguy cơ đơ máy do IPC Pipe.
2. **Xây dựng JIT Compiler Thực Thụ Với AsmJit Hoặc LLVM ExecutionEngine:**
   - Thay vì dùng `std::system("setun_jit_exec.exe")`, tích hợp thư viện JIT như **AsmJit** (dung lượng chỉ vài trăm KB C++) hoặc **LLVM ORC JIT API**:
     - Phát sinh trực tiếp mã máy x86-64 / ARM64 vào vùng nhớ RAM có quyền thực thi (`VirtualAlloc` với `PAGE_EXECUTE_READWRITE`).
     - Gọi thực thi hàm trực tiếp qua con trỏ hàm C, đạt tốc độ thực thi tức thì (Zero startup latency), không cần ghi file tạm ra ổ đĩa và không bị Antivirus làm phiền.
3. **Hoàn thiện công cụ LSP và Debugger:**
   - Tích hợp thư viện JSON siêu nhẹ (như `nlohmann/json` dạng single header) vào `lsp_server.cpp` để parse đúng chuẩn JSON-RPC của Microsoft.
   - Xây dựng vòng lặp REPL debug thực thụ trong `debugger.cpp` cho phép người dùng gõ lệnh: `step`, `next`, `break <line>`, `print <reg>`.

---

## KẾT LUẬN

Dự án **Setun 2.0** có một ý tưởng toán học và kiến trúc máy tính tam phân vô cùng độc đáo, giàu tiềm năng học thuật và khác biệt rõ nét so với các ngôn ngữ truyền thống. Khả năng tính toán đại số không sai số trong $\mathbb{Q}(\sqrt{3})$ và ý tưởng mạng nơ-ron tam phân BitNet không dùng bộ nhân là những hướng đi rất đột phá.

Tuy nhiên, codebase hiện tại đang bị chi phối bởi quá nhiều lớp mô phỏng hình thức nhằm "làm đẹp" kết quả kiểm thử, trong khi phần lõi thực thi lại chứa nhiều lỗi thiết kế cơ bản về quản lý bộ nhớ, ngăn xếp toán hạng và tiến trình con.

Nếu nhóm phát triển dũng cảm **cắt tỉa các mô-đun rác, chuẩn hóa lại compiler frontend, thay thế cầu nối Java bằng đồ họa native, và kết nối các tính năng cao cấp vào đúng cú pháp ngôn ngữ**, Setun 2.0 hoàn toàn có thể trở thành một ngôn ngữ lập trình độc đáo, siêu nhẹ, vận hành mượt mà và thực sự đạt tới tốc độ Native đúng như kỳ vọng ban đầu.
