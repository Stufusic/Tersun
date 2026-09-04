# Kiến Trúc Pipeline Trình Biên Dịch Setun-70, TAFPU & Toàn Bộ Hệ Sinh Thái 5 Giai Đoạn

Tài liệu này mô tả chi tiết toàn bộ quy trình xử lý (Pipeline), cấu trúc dữ liệu, tập lệnh (ISA), định dạng nhị phân `.tbc`, giao diện FFI C/C++, bộ thu gom rác Tri-Color GC, mã tổng hợp phần cứng FPGA Verilog RTL, thư viện `stdtaf`, trình quản lý gói `tpm`, kiểm định toán học hình thức Lean 4 và hệ điều hành vi mô Bare-Metal của hệ sinh thái **Setun-70 & TAFPU $\mathbb{Q}(\sqrt{3})$**.

---

## 1. Sơ Đồ Tổng Quan Hệ Sinh Thái (Full 5-Phase Architecture)

```
  Lean 4 Formal Proofs (Doc/FormalVerification_Lean4.lean)
                   │
                   ▼
 Mã Nguồn (.taf / .setun)  ──────►  setun.toml (TPM Package)  ──────►  Host C/C++ (FFI)
           │                                 │                               │
           ▼                                 ▼                               ▼
┌────────────────────────┐       ┌────────────────────────┐       ┌────────────────────────┐
│      Lexer O(N)        │       │   TPM Package Manager  │       │     libsetun_ffi.h     │
│   (Trit/Tryte/@10T1)   │       │   (Init, Build, Test)  │       │  (Zero-latency Bind)   │
└────────────────────────┘       └────────────────────────┘       └────────────────────────┘
           │
           ▼ (Tokens)
┌────────────────────────┐       ┌────────────────────────┐       ┌────────────────────────┐
│  Pratt Parser & Arena  │       │    libstdtaf Library   │       │   Verilog RTL Emitter  │
│  (Arena Allocator O(1))│       │ (Gauss-Jordan, TST, QD)│       │  (--emit-verilog FPGA) │
└────────────────────────┘       └────────────────────────┘       └────────────────────────┘
           │
           ▼ (AST & Symbol Table)
┌────────────────────────┐
│   Bytecode Emitter     │  ───► Đóng gói tệp nhị phân (.tbc) với Magic "SETU"
└────────────────────────┘
           │
           ▼ (Bytecode Stream)
┌────────────────────────┐       ┌────────────────────────┐       ┌────────────────────────┐
│   Setun-70 VM (BTVP)   │ ◄───► │  Tri-Color Garbage Col │ ◄───► │  Bare-Metal Microkernel│
│(1-cycle Branch3, Call) │       │  (Trit -1, 0, +1 GC)   │       │  (Tryte Paging & Sched)│
└────────────────────────┘       └────────────────────────┘       └────────────────────────┘
           │
           ├───────────────────────────────────┼───────────────────────────────────┐
           ▼                                   ▼                                   ▼
┌────────────────────────┐          ┌────────────────────────┐          ┌────────────────────────┐
│   TAFPU Linear Algebra │          │ Exact 3D Geometry & Phy│          │  Production Game Engine│
│  (tmat<R,C> in Q(rt3)) │          │ (Zero-Drift 1,000,000s)│          │ (1,000 NPC in 0.034 ms)│
└────────────────────────┘          └────────────────────────┘          └────────────────────────┘
```

---

## 2. Chi Tiết Các Cấu Phần Trong 5 Giai Đoạn

1. **Giai đoạn 1 ([Plan_part1.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan_part1.md))**:
   - Lõi đại số `TafpuNum` / `TAF_Register` 24 bytes aligned.
   - Phép toán số học đại số $+$, $-$, $*$, $/$ với $0\%$ sai số tích lũy trên $\mathbb{Q}(\sqrt{3})$.
   - Bộ cộng đa Trit BTVP tái hiện chính xác Bảng 1 ($14 + 25 = 39$).
   - Giải thuật Dynamic Encoding đạt mật độ lưới lượng tử Weyl trên 10,000 số thực ngẫu nhiên.

2. **Giai đoạn 2 ([Plan_part2.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan_part2.md))**:
   - Parser phân cấp Pratt $O(N)$ và Arena Allocator cấp phát/giải phóng $O(1)$.
   - Rẽ nhánh 3 hướng (`branch3`) hỗ trợ cả cú pháp `->` và `:` với cơ chế Backpatching.
   - Quản lý CallFrame và đệ quy không giới hạn trên số đại số.
   - Đóng gói file nhị phân `.tbc` với Magic Header `"SETU"`.

3. **Giai đoạn 3 ([Plan_part3.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan_part3.md))**:
   - Thư viện ma trận `tmat<Rows, Cols>` và phép nhân ma trận BitNet 1.58-bit không dùng bộ nhân (Multiplication-free GEMM).
   - Động cơ vật lý và vector 3D `tvec3` với $1,000,000$ bước tích phân chuyển động không trôi tọa độ (Zero-Drift).
   - Đại số Quaternion tam phân `tquat` và bộ chia Newton-Raphson/CORDIC.

4. **Giai đoạn 4 ([Plan_part4.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan_part4.md))**:
   - Giao diện FFI C/C++ (`libsetun_ffi.h`) cho phép nhúng trực tiếp VM vào game engine native.
   - Bộ thu gom rác Tri-Color GC ánh xạ lên logic Trit $\{-1, 0, 1\}$ triệt tiêu rò rỉ bộ nhớ.
   - Bộ phát sinh mã phần cứng Verilog-2001 RTL tổng hợp được cho FPGA ALU Core (`--emit-verilog`).
   - Thư viện `libstdtaf` (Gauss-Jordan, Ternary Search Tree) và Trình quản lý gói `tpm` (`setun.toml`).

5. **Giai đoạn 5 ([Plan_part5.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Plan_part5.md))**:
   - Kiểm định hình thức Lean 4 (`Doc/FormalVerification_Lean4.lean`) chứng minh đẳng cấu và $0\%$ sai số.
   - Tích hợp động cơ game thực chiến với vòng lặp cập nhật 1,000 NPC AI + vật lý chỉ mất **$0.034\text{ ms}$** ($< 1.0\text{ ms}$).
   - Hệ điều hành vi mô Bare-Metal (`microkernel.hpp`) với phân trang bộ nhớ Tryte và lập lịch ưu tiên 3 mức.
   - Tài liệu đặc tả kỹ thuật ngữ pháp EBNF (`Doc/Language_Specification.md`) và sổ tay phần cứng (`Doc/Hardware_Reference_Manual.md`).

---

## 3. Hướng Dẫn Sử Dụng Toàn Diện CLI `setunc`

```bash
# 1. Quản lý gói với TPM (Ternary Package Manager)
./setunc tpm init game_engine
./setunc tpm build
./setunc tpm test

# 2. Biên dịch mã nguồn (.taf / .setun) ra file nhị phân (.tbc)
./setunc compile examples/05_bitnet_ai_and_physics.taf -o examples/05_bitnet_ai_and_physics.tbc
./setunc compile examples/04_recursive_power.taf -o examples/04_recursive_power.tbc

# 3. Chạy trực tiếp mã nguồn hoặc file nhị phân .tbc
./setunc run examples/05_bitnet_ai_and_physics.tbc
./setunc run examples/01_tafpu_demo.setun

# 4. Xuất mã mô tả phần cứng FPGA Verilog RTL
./setunc --emit-verilog

# 5. Xuất mã Assembly trung gian (Disassembly / Dump ASM)
./setunc --dump-asm examples/05_bitnet_ai_and_physics.tbc
./setunc disasm examples/01_tafpu_demo.setun

# 6. Chạy toàn bộ các bộ kiểm thử tự động (100% Verification)
./setunc test

# 7. Tái hiện Bảng 1: Truy vết cộng tam phân BTVP (14 + 25 = 39)
./setunc trace-btvp 14 25

# 8. Đo đạc hiệu năng Microsecond Benchmark (100,000 chu kỳ lặp)
./setunc benchmark

# 9. Mở chế độ dòng lệnh tương tác REPL
./setunc repl

# 10. Tersun 1.0.1 LLVM Native AOT Pipeline
./setunc emit-llvm app_demo.stn -o app_demo.ll
./setunc compile app_demo.stn --llvm -o app_demo.exe
./setunc compile app_demo.stn --native -o app_demo_native.exe
./setunc --version
```

---

## 4. Tersun 1.0.1: Kiến Trúc Hạ Cấp LLVM AOT Native (Phase 1)

Tersun 1.0.1 hoàn thiện việc chuyển đổi trực tiếp AST cấu trúc sang LLVM IR (.ll) và nhị phân Native:

1. **Hệ Kiểu Native (Typed Lowering)**:
   - Kiểu số nguyên: `int` $\to$ `i64`, `tryte` / `trit` $\to$ `i16`.
   - Kiểu thực & luận lý: `float` $\to$ `double`, `bool` $\to$ `i1`.
   - Kiểu chuỗi: `string` $\to$ `i8*`.
   - Cấu trúc dữ liệu: `struct` / `class` $\to$ `%struct.Name*` với truy cập offset qua LLVM `getelementptr inbounds`.
   - Mảng động: `%struct.TersunArray*` với bộ API `@tersun_array_create`, `@tersun_array_push_i64`, `@tersun_array_get_i64`, `@tersun_array_set_i64`.

2. **Hạ Cấp Rẽ Nhánh Tam Phân (Branch3 Lowering)**:
   - Biểu thức rẽ nhánh 3 hướng được tính toán qua `@tafpu_cmp_native(val, TAFPU_ZERO)`.
   - Bảng chuyển nhánh `switch i32` điều hướng trực tiếp sang 3 nhãn cơ sở: `negative` ($-1$), `zero` ($0$), `positive` ($+1$) không sinh rẽ nhánh nhị phân dư thừa.

3. **Toán Học Đại Số Tuyệt Đối Trên $\mathbb{Q}(\sqrt{3})$**:
   - Các hàm `@tafpu_add_native`, `@tafpu_sub_native`, `@tafpu_mul_native`, `@tafpu_div_native`, `@tafpu_tilde_native` được định nghĩa inline trực tiếp trong module LLVM IR.
   - Bảo toàn $0\%$ sai số tích luỹ đại số.

4. **Thư Viện Runtime Tĩnh Độc Lập (`libtersun_rt.a`)**:
   - Đóng gói toàn bộ nhân TAFPU, BTVP, BitNet 1.58-bit Engine và Setun2D Window/Renderer thành thư viện liên kết tĩnh `libtersun_rt.a`.
   - Cho phép nhị phân biên dịch từ LLVM IR hoặc Clang/GCC chạy độc lập với tốc độ phần cứng Native C++.

---

## 5. Tersun 1.0.2: Kiến Trúc Máy Ảo Lượng Tử QVM & Gom 2-Bit Thành 1-Qubit (Phase 2 & 3)

Tersun 1.0.2 mở rộng hệ thống sang điện toán lượng tử (Quantum Computing) với cơ chế đóng gói trạng thái 2-bit thành 1-Qubit và hỗ trợ chuẩn công nghiệp OpenQASM 3.0:

1. **Mô Hình Ánh Xạ 2-Bit Lên 1-Qubit:**
   - `00_2` $\to$ $|0\rangle$ (Trit $0$, Ground state)
   - `01_2` $\to$ $|1\rangle$ (Trit $+1$, Excited state)
   - `10_2` $\to$ $|-\rangle = \frac{|0\rangle - |1\rangle}{\sqrt{2}}$ (Trit $-1$, Phase inverted)
   - `11_2` $\to$ **Dual-Role**:
     - *Chế độ lượng tử*: Trạng thái chồng chập $|+\rangle = \frac{|0\rangle + |1\rangle}{\sqrt{2}}$ (Unmeasured)
     - *Chế độ cổ điển*: Trạng thái $\bot$ Nil / NaN / Zero-cost Hardware Exception.

2. **Thanh Ghi Lượng Tử Đóng Gói (Packed Qubit Register):**
   - Đóng gói 32 Qubit ảo vào một từ nhớ nguyên 64-bit (`PackedQubitWord`).
   - Tự động chuyển đổi sang vector trạng thái biên độ phức ($\mathbb{C}^{2^N}$) khi xuất hiện cổng tạo chồng chập ($H$) hoặc vướng víu ($CNOT$).
   - Thu gọn sóng lượng tử theo quy tắc xác suất Born khi thực hiện phép đo (`MEASURE`).

3. **Bộ Chuyển Dịch LLVM $\to$ QVM (`llvm2qvm`):**
   - Phân tích LLVM IR từ Tersun 1.0.1, nhóm cặp bit và chuyển đổi các phép toán logic cổ điển sang cổng lượng tử ($X, CNOT, \text{Toffoli}$).

4. **Bộ Phát Sinh Mã Trực Tiếp Q-Emitter (Tersun 1.0.2):**
   - Biên dịch trực tiếp AST sang mã nhị phân Q-ISA (`.qbc`) với Magic Header `"QSET"` và phiên bản `0x0102`.
   - Xuất mạch lượng tử chuẩn **OpenQASM 3.0** (`.qasm`) tương thích với chip máy tính lượng tử thực tế (IBM Quantum, AWS Braket, Rigetti).

5. **Lệnh CLI Tersun 1.0.2:**
   ```bash
   # Biên dịch trực tiếp sang QVM Bytecode
   ./setunc compile quantum_demo.stn --qvm -o quantum_demo.qbc

   # Chạy mô phỏng trên QVM Simulator
   ./setunc run-qvm quantum_demo.qbc

   # Xuất mã OpenQASM 3.0
   ./setunc emit-qasm quantum_demo.stn -o circuit.qasm

   # Dịch từ LLVM IR sang QVM
   ./setunc llvm2qvm app_demo.ll -o app_from_llvm.qbc
   ```