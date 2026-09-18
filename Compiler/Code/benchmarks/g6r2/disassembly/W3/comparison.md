# W3 (Matmul 100x100) — Machine Code Disassembly Comparison & Forensic Analysis

Tài liệu pháp y mã máy: **G6R.2.0 Sub-Gate Evidence Validation**  
Files đối soát trực tiếp:
- Baseline JIT: [jit_baseline.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/jit_baseline.asm)
- Auto-Tier / Optimizing JIT: [jit_auto.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/jit_auto.asm)
- Native AOT (-O3 GCC/LLVM): [aot_o3.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/aot_o3.asm)

---

## 1. Bảng Tổng hợp Ma trận Đối soát 7 Tiêu chí Kỹ thuật

| Tiêu chí Kiểm tra (Section 5.1 G6.2.md) | Baseline JIT ($M2$) | Auto-Tier JIT ($M3$) | Native AOT ($M4$ -O3) | Đánh giá / Gap Kỹ thuật |
| :--- | :--- | :--- | :--- | :--- |
| **1. Scalar Instructions** | 100% scalar (`imul rax, rcx`, `add rax, rbx`, `shl`, `sar`, `and`, `or`) | 100% scalar (`imul rax, r13`, `add rax, [rdi+rdx*8]`) | Chỉ dùng scalar cho remainder loop ($N \pmod 4$) | **GAP CỐT TỬ**: Cả 2 tầng JIT hiện tại đều phát sinh 100% mã máy vô hướng (scalar). |
| **2. Vector Instructions** | **0% (Không có)** | **0% (Không có)** | **100% SIMD vector instructions** (`movaps`, `movdqa`, `vmovupd`, `vfmadd231pd`) | Native AOT xử lý 2-4 phần tử cùng lúc trong mỗi chu kỳ CPU. JIT xử lý 1 phần tử/chu kỳ. |
| **3. Register Usage** | Chủ yếu dùng stack; register chỉ dùng làm scratch trung gian (`rax, rcx, rdx, rbx, r10, r11`) | Linear Scan Allocator: `r12, r13, r14, r15, rsi, rdi, rax` (Giữ biến trong register) | Toàn bộ 16 thanh ghi x86-64 GP + 16 thanh ghi vector `xmm0..xmm7 / ymm0..ymm7` | AOT tận dụng triệt để cả thanh ghi tổng quát và thanh ghi SIMD 128/256-bit. |
| **4. Loop Structure** | Single-iteration loop, kiểm tra biên từng bước (`cmp rax, 100` $\rightarrow$ `jge`), OSR trampoline | Canonical Loop Header + Body + Backedge Jump (`cmp r12, 100` $\rightarrow$ `jge`) | Vectorized Loop (bước nhảy stride = 4 hoặc 8) + Remainder Scalar Loop | AOT tách biệt vòng lặp vector hóa chính và vòng lặp vét phần dư. |
| **5. Load / Store Pattern** | `pop`, `mov rax, [rdx+rcx*8]`, mask payload, re-tag, `push`, `pop`, `mov [rdx+rcx*8], rax` | Direct 64-bit load/store: `mov rbx, [rsi+rcx*8]`, `mov [rdi+rdx*8], rax` | Aligned / unaligned 128/256-bit memory load: `movaps xmm, [mem]`, `movdqa xmm, [mem]` | Băng thông truy cập bộ nhớ của AOT cao gấp $2\times$ đến $4\times$ so với JIT. |
| **6. Loop Unrolling** | **$1\times$ (Không unroll)** | **$1\times$ (Không unroll)** | **$2\times$ đến $4\times$ unrolled** bên trong thân vòng lặp vector | Giảm $75\%$ số lượng lệnh nhảy điều kiện (branch overhead) trên Native AOT. |
| **7. Fused Multiply-Add (FMA)** | **Không có** (1 lệnh `imul` tách rời + 1 lệnh `add` tách rời) | **Không có** (1 lệnh `imul` tách rời + 1 lệnh `add` tách rời) | **Có FMA / Vectorized FMA** (`vfmadd231pd` hoặc `mulpd + addpd`) | Native AOT tính toán phép nhân và cộng tích lũy trong đúng 1 chu kỳ vi lệnh pipeline. |

---

## 2. Phân tích Chi tiết Từng Tiêu chí

### 2.1 Scalar vs Vector Instructions
- Trong [jit_baseline.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/jit_baseline.asm) và [jit_auto.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/jit_auto.asm):
  Mỗi phần tử $C[i][j]$ đòi hỏi một lệnh nhân vô hướng `imul rax, rcx` (hoặc `imul rax, r13`) tốn từ 3 đến 4 chu kỳ latency của ALU x86.
- Trong [aot_o3.asm](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/g6r2/disassembly/W3/aot_o3.asm):
  GCC/LLVM sử dụng tập lệnh SIMD (`movaps`, `movdqa`, `vmovupd`), nạp khối 2 đến 4 số nguyên/thực 64-bit cùng lúc và thực thi phép toán song song dữ liệu (SIMD Data Parallelism).

### 2.2 Register Usage & Tagging Overhead
- **Baseline JIT**:
  Tồn tại overhead đóng gói/mở gói kiểu dữ liệu (NaN-boxing / bit-tagging):
  ```nasm
  shl rax, 16
  sar rax, 16               ; Unbox int48 to int64
  ...
  and rax, 0x0000ffffffffffff ; PAYLOAD_MASK
  or  rax, 0x0001000000000000 ; TAG_INT re-tagging
  push rax
  ```
  Quá trình này tốn thêm 6 lệnh CPU vô bổ cho mỗi phép nhân và mỗi phép cộng.
- **Optimizing JIT**:
  Đã loại bỏ được việc push/pop và re-tagging trong thân vòng lặp nhờ phân bổ thanh ghi tĩnh (Linear Scan Allocator). Tuy nhiên, vì thiếu instruction vectorization, nó vẫn chỉ phát sinh lệnh vô hướng `imul rax, r13`.

### 2.3 Memory Access & Stride Pattern
- Trong thuật toán Matmul $i, k, j$ (IKJ layout):
  ```ternary
  for i in range(n) {
      for k in range(n) {
          let a_val = A[i * n + k]; // Loop invariant over j!
          for j in range(n) {
              C[i * n + j] += a_val * B[k * n + j];
          }
      }
  }
  ```
  - `a_val` hoàn toàn bất biến theo biến vòng lặp trong cùng `j`.
  - Mảng $B[k \cdot n + j]$ và mảng $C[i \cdot n + j]$ có địa chỉ ô nhớ tăng tuần tự liên tục theo $j$ (Stride-1 contiguous memory).
  - Native AOT nhận diện mẫu truy cập bộ nhớ này và ánh xạ thành vector loads liên tục.
  - JIT hiện tại tính toán lại chỉ số bằng phép cộng số học vô hướng từng phần tử một.

---

## 3. Kết luận Pháp y & Định hướng G6R.2.1

1. **Xác nhận Giả thuyết G6R.1**:
   Nguyên nhân khiến JIT ($16.22$ ms) chậm hơn Native AOT ($4.43$ ms) xấp xỉ $3.7\times$ **HOÀN TOÀN KHÔNG PHẢI do VM overhead hay Function Call overhead**, mà do sự khác biệt cơ bản về chất lượng mã máy: **SIMD Vectorization (AVX2 256-bit) và FMA**.
2. **Khẳng định tính khả thi (Feasibility)**:
   Mẫu vòng lặp IKJ của W3 có điều kiện lý tưởng cho vector hóa (Stride-1, loop-invariant multiplier `a_val`, không có loop-carried dependency giữa các phần tử $j$ khác nhau).
3. **Yêu cầu kỹ thuật cho Tiểu cổng G6R.2.1**:
   - Bổ sung mã hóa tiền tố VEX (2-byte / 3-byte VEX prefix) vào `X64Assembler`.
   - Bổ sung tập lệnh AVX2: `vmovupd`, `vmulpd`, `vaddpd`, `vfmadd231pd`.
   - Triển khai Canonical Loop Detector & Loop Vectorizer trong `OptimizingJITCompiler`.
