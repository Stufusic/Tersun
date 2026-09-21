# TERSUN ACADEMIC CURRICULUM & MASTER SYLLABUS
## HỆ THỐNG GIÁO TRÌNH KHOA HỌC MÁY TÍNH & KỸ NGHỆ HỆ THỐNG TERSUN
### *(First-Principles Computing, Compiler Construction, Virtual Machines, Balanced Ternary Architecture & Quantum Execution)*

---

```
             ┌─────────────────────────────────────────────────────────────┐
             │       TERSUN COMPUTER SYSTEMS & PROGRAMMING CURRICULUM      │
             │        Hệ Thống Giáo Trình & Kỹ Nghệ Ngôn Ngữ Tersun        │
             └──────────────────────────────┬──────────────────────────────┘
                                            │
                    ┌───────────────────────┴───────────────────────┐
                    ▼                                               ▼
     ┌─────────────────────────────┐                 ┌─────────────────────────────┐
     │  TRACK A: SYSTEM ARCHITECTURE│                 │ TRACK B: SOFTWARE & TERNARY │
     │   Giáo trình Hệ thống Tersun │                 │  Giáo trình Lập trình Tersun│
     │   (Compiler, VM, JIT, AOT)  │                 │ (From First-Principles)     │
     │       [3 Volumes - 24 Ch.]   │                 │     [3 Volumes - 38 Ch.]    │
     └──────────────┬──────────────┘                 └──────────────┬──────────────┘
                    │                                               │
                    └───────────────────────┬───────────────────────┘
                                            ▼
                             ┌─────────────────────────────┐
                             │    CAPSTONE & LAB BENCHMARK │
                             │  TAFPU SIMD, QVM & BitNet   │
                             └─────────────────────────────┘
```

---

## I. LỜI NÓI ĐẦU & TRIẾT LÝ GIÁO DỤC (PREFACE & PEDAGOGICAL PHILOSOPHY)

Hệ thống giáo trình Tersun được biên soạn không nhằm mục đích cung cấp một cuốn sổ tay tra cứu cú pháp đơn thuần, mà là một **hành trình tái khám phá khoa học máy tính từ nguyên lý thứ nhất (First-Principles Engineering Discovery)**. 

### 1. Triết lý "Tái Khám Phá Kiến Trúc Thông Qua Áp Lực Kỹ Thuật"
Mọi kiến trúc tinh vi trong khoa học máy tính—từ Bảng băm (Hash Table), Ngăn xếp hàm (Call Stack), Cây cú pháp trừu tượng (AST), Con trỏ khung (Frame Pointer), Thu gom rác (Garbage Collector), Định dạng số dấu phẩy động (Floating-Point), cho tới Không gian Hilbert trong mô phỏng lượng tử—**chưa bao giờ là kết quả của sự tùy hứng**. Chúng là những lời giải bắt buộc sinh ra khi giải pháp ngây thơ tiền nhiệm sụp đổ trước giới hạn vật lý của phần cứng hoặc độ phức tạp của bài toán.

```
 Problem (Nhu cầu thực tế)
    ↓
 Naive Solution (Giải pháp ngây thơ)
    ↓
 Failure / Bottleneck (Sự sụp đổ / Điểm nghẽn)
    ↓
 Root Cause Analysis (Bóc tách nguyên nhân gốc rễ)
    ↓
 Abstraction & Architecture (Thiết kế kiến trúc)
    ↓
 Implementation & Measurement (Thực thi & Đo lường định lượng)
    ↓
 New Limitation (Giới hạn mới -> Lặp lại chu trình tiến hóa)
```

### 2. Năm Trụ Cột Bất Biến Của Giáo Trình
1. **Trace to the Metal (Truy vết đến tận cùng kim loại bán dẫn)**: Người học khi viết bất kỳ cấu trúc cú pháp nào đều phải giải thích được trọn vẹn luồng biến đổi: `Cú pháp .stn` $\to$ `AST Node` $\to$ `Linear IR / CFG` $\to$ `Bytecode .tbc` $\to$ `Thanh ghi & Con trỏ PC/SP của VM` $\to$ `Hạ mức LLVM SSA` $\to$ `Tập lệnh máy CPU (x86-64 / ARM64)` $\to$ `Bộ nhớ Cache L1/L2`.
2. **Phân biệt rạch ròi 5 tầng nhận thức**:
   - **FACT (Sự thật mã nguồn)**: Thuộc tính hoặc cấu trúc đã được định nghĩa trong mã nguồn C++/Setun.
   - **MEASUREMENT (Đo đạc định lượng)**: Số liệu thực nghiệm (thời gian chạy, cache misses, heap allocation, instructions retired).
   - **HYPOTHESIS (Giả thuyết kỹ thuật)**: Lời giải thích dự kiến cho hiện tượng quan sát được.
   - **INFERENCE (Suy luận logic)**: Lập luận hình thức kết nối giả thuyết với cơ chế phần cứng.
   - **CLAIM (Tuyên bố sau kiểm chứng)**: Kết luận khoa học chỉ được công nhận sau khi có đối chứng thực nghiệm.
3. **No Optimization Without Measurement (Không tối ưu hóa vô căn cứ)**: Mọi kỹ thuật (Direct Threading, NaN-Boxing, Arena Allocators, Loop Quickening, SIMD, JIT/OSR) đều có chi phí đánh đổi (trade-offs). Mọi tối ưu hóa bắt buộc phải được định lượng bằng Benchmark Deterministic.
4. **Nghiêm ngặt về số học và tính chính xác đại số**: Phân biệt tuyệt đối giữa *Tính chính xác toán học lý thuyết*, *Tính chính xác của miền biểu diễn số học hữu hạn* và *Sai số làm tròn của số thực xấp xỉ IEEE 754*.
5. **Debugging như một công cụ phẫu thuật kiến trúc**: Lỗi không phải là thứ để che giấu bằng các mẹo vặt (hacks), mà là bằng chứng sống về sự vi phạm bất biến hệ thống (Invariants) và ABI giữa các tầng trừu tượng.

---

## II. CHUẨN ĐẦU RA CỦA KHÓA HỌC (COURSE LEARNING OUTCOMES - CLOs)

Sau khi hoàn thành toàn bộ hệ thống giáo trình, người học đạt được các năng lực chuẩn mực:

- **CLO-1 (Frontend & Compiler Design)**: Thiết kế và triển khai hoàn chỉnh một trình biên dịch hoàn chỉnh: Lexer không cấp phát (Zero-Copy), Parser theo thuật toán Pratt/Top-Down Operator Precedence, Kiểm tra kiểu tĩnh và Monomorphization cho Generics.
- **CLO-2 (IR & Code Optimization)**: Xây dựng biểu diễn trung gian 3 địa chỉ (Linear 3-Address IR), đồ thị dòng điều khiển (CFG), SSA Form, giải thuật khử biểu thức con trùng lặp (CSE), lan truyền bản sao (Copy Propagation) và loại bỏ mã chết (DCE).
- **CLO-3 (Virtual Machine Engineering)**: Xây dựng máy ảo thực thi dạng ngăn xếp (Stack VM) và thanh ghi (Register VM), kỹ thuật đóng gói giá trị NaN-Boxing 64-bit, cơ chế phân phối lệnh kép (Direct Threading vs Switch-Dispatch), và hệ thống Inline Caching cho nạp thuộc tính động.
- **CLO-4 (Memory Management & Runtime)**: Làm chủ cơ chế cấp phát vùng nhớ Arena Allocator O(1), bộ thu gom rác Tri-Color Mark-Sweep GC, quản lý Stack Frames và Exception Unwinding an toàn.
- **CLO-5 (Balanced Ternary & Non-Von Neumann Architecture)**: Nắm vững hệ số tam phân cân bằng $\{-1, 0, 1\}$, giải thuật cộng BTVP không lan truyền sóng nhớ, số học đại số TAFPU trên trường số thực $\mathbb{Q}(\sqrt{3})$, phép nhân tích chập không cần nhân (Multiplication-Free GEMM) ứng dụng cho Ternary AI/BitNet.
- **CLO-6 (JIT Compilation & On-Stack Replacement)**: Nắm vững kiến trúc JIT Compiler, cơ chế phát hiện vòng lặp nóng `OP_LOOP_START`, thay thế khung ngăn xếp tại chỗ (On-Stack Replacement - OSR) và cơ chế giải tỏa suy đoán an toàn (Speculative Deoptimization / Bailout).
- **CLO-7 (Quantum Computation & Hilbert State Simulation)**: Hiểu và mô phỏng được trạng thái lượng tử quy mô lớn đa Qubit/Qutrit, thuật toán Grover, biến đổi Fourier lượng tử (QFT), cơ chế biến đổi bước nhảy tại chỗ không cấp phát bộ nhớ phụ (In-place Strided Transformation) và chạm trần phần cực đại $N=29\text{ Qubits}$ ($536\text{M}$ amplitudes).
- **CLO-8 (Native LLM Runtime & Attention Execution Engine)**: Nắm vững kiến trúc thực thi mô hình Transformer / BitNet b1.58 bản địa, triển khai Tokenizer Byte-Level BPE không cấp phát, bộ lấy mẫu 7 bước Sampler (Repetition/Presence/Frequency Penalties), vòng lặp sinh autoregressive duy trì bất biến Zero-Allocation (`malloc == 0`), thang tối ưu hóa 7 bậc Attention Ladder ($A_0 \to A_6$) với vi nhân SIMD AVX2/FMA, phân vùng song song đơn chủ quyền (Single Owner of Parallelism) qua `ParallelPlanner`, và đo đạc các chỉ số chuẩn TTFT, TPOT và Throughput.

---

## III. BẢN ĐỒ LỘ TRÌNH HỌC TẬP (CURRICULUM ROADMAPS)

Tùy theo định hướng chuyên môn, người học có thể lựa chọn 1 trong 3 lộ trình:

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 1: SYSTEM & COMPILER TRACK                     │
│               (Dành cho Kỹ sư Hệ thống, Trình biên dịch & Máy ảo cấp thấp)             │
│                                                                                        │
│  Sys.Vol 1 (Ch.1-10)    ──►   Sys.Vol 2 (Ch.11-20)     ──►    Sys.Vol 3 (Ch.21-28)     │
│  [Frontend & SSA IR]           [TVM, GC, AOT, LLVM]            [Diagnostics, LLM, SIMD]│
└────────────────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 2: APPLICATION & TERNARY TRACK                 │
│                 (Dành cho Lập trình viên Hệ thống, AI Tam phân & Lượng tử)             │
│                                                                                        │
│  Prog.Vol 1 (Ch.1-22)   ──►   Prog.Vol 2 (Ch.23-30)    ──►    Prog.Vol 3 (Ch.31-40)    │
│  [Core Lang & OOP]             [TAFPU, BitNet, Async]          [AOT, QVM, Native LLM]  │
└────────────────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 3: UNIFIED FULL-STACK MASTERY                  │
│                     (Đào tạo Kỹ sư Trưởng / Kiến trúc sư Hệ thống Toàn diện)           │
│                                                                                        │
│          Song hành từng cặp Chương: Lý thuyết Hệ thống <──> Hiện thực Ngôn ngữ         │
│          Ví dụ: Sys.Ch.5 (Parser C++) song hành Prog.Ch.5 (Lexing & Scanning)         │
│                 Sys.Ch.12-14 (TVM & GC) song hành Prog.Ch.23-24 (Arena & Heap)         │
│                 Sys.Ch.16-17 (LLVM AOT) song hành Prog.Ch.33 (LLVM Lowering)           │
│                 Sys.Ch.23 (JIT & OSR) song hành Prog.Ch.37 (OSR Hot Loops & Flat)      │
│                 Sys.Ch.24 (QVM Stride) song hành Prog.Ch.38 (QVM N=29 & Grover)       │
│                 Sys.Ch.25-28 (LLM Core & SIMD) song hành Prog.Ch.39-40 (BitNet AI REPL)│
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## IV. MỤC LỤC TỔNG THỂ SIÊU LIÊN KẾT (MASTER HYPERLINKED DIRECTORY)

---

### TRACK A: BỘ GIÁO TRÌNH HỆ THỐNG TERSUN
#### *(Tersun Computer Systems Engineering: From First-Principles to Architecture)*

*Bao gồm 3 Tập, 7 Phần lý thuyết chuyên sâu và 24 Chương giải phẫu kiến trúc mã nguồn C++ compiler/VM.*

#### 📘 [TẬP 1: TỪ NGUYÊN LÝ ĐẾN DẠNG GÁN ĐƠN DUY NHẤT SSA (VOL 1)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md)
*Dung lượng: 442.5 KB | 7,082 dòng mã và phân tích học thuật.*

- **Phần Khởi Đầu & Triết Lý**:
  - [I. Triết lý Giáo dục & Phương pháp Học](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L6)
  - [II. Bản đồ Kiến trúc Toàn cảnh (System Architecture Map)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L56)
  - [III. Mục lục Toàn diện 16 Phần Kiến trúc](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L117)
  - [IV. Đồ thị Phụ thuộc Kiến thức & Bảng Tiêu chuẩn 18 Mục](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L369)
- **PHẦN I: BẢN CHẤT CỦA MỘT HỆ THỐNG NGÔN NGỮ LẬP TRÌNH**:
  - [Chương 1: Khoảng trống giữa Ký tự Con người và Điện áp Bán dẫn](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L526)
  - [Chương 2: Thông dịch trực tiếp trên Cây (Tree-Walking) và Thất bại về mặt Hiệu năng](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L1063)
  - [Chương 3: Trình biên dịch (Compiler) đối đầu Máy ảo (Virtual Machine)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L1658)
- **PHẦN II: TẦNG ĐẦU TRÌNH BIÊN DỊCH (FRONTEND PIPELINE)**:
  - [Chương 4: Bộ phân tích Từ tố (Lexer) & Cơ chế Không cấp phát Bộ nhớ (Zero-Copy)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L2211)
  - [Chương 5: Bộ phân tích Cú pháp (Parser), Cây AST & Thuật toán Pratt Parsing](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L2790)
  - [Chương 6: Phân tích Ngữ nghĩa (Semantic Analysis) & Bảng Ký hiệu Đa tầng](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L3351)
  - [Chương 7: Hệ thống Kiểu Tĩnh (Static Type System) & Đa hình Tham số](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L3919)
  - [Chương 8: Kỹ thuật Báo lỗi Thân thiện & Khả năng Tự phục hồi (Resilient Parsing)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L4768)
- **PHẦN III: BIỂU DIỄN TRUNG GIAN & SSA (KHỞI ĐẦU)**:
  - [Chương 9: Kiến trúc Mã Trung gian (IR) & Ba Địa chỉ (3-Address Code / Quadruples)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L5534)
  - [Chương 10: Dạng Gán đơn Duy nhất (Static Single Assignment - SSA Form) & Phi-Nodes](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md#L6304)

---

#### 📘 [TẬP 2: TỪ CFG, MÁY ẢO TVM, THU GOM RÁC ĐẾN HẠ TẦNG NATIVE LLVM AOT (VOL 2)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md)
*Dung lượng: 479.7 KB | 7,790 dòng mã và phân tích hệ thống.*

- **PHẦN III: BIỂU DIỄN TRUNG GIAN (TIẾP TỤC)**:
  - [Chương 11: Đồ thị Luồng Điều khiển (Control Flow Graph - CFG) & Khối Cơ bản (Basic Blocks)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L3)
- **PHẦN IV: CỖ MÁY ẢO CỔ ĐIỂN TERSUN (TVM ENGINE)**:
  - [Chương 12: Kiến trúc Máy ảo Tersun (TVM) & Chu trình Lệnh (Instruction Cycle)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L790)
  - [Chương 13: Bố cục Bộ nhớ Máy ảo & Hệ thống Giá trị (VM Value & NaN-Boxing)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L1557)
  - [Chương 14: Hệ thống Quản lý Bộ nhớ Tự động (Tri-Color Ternary GC & Arena Reclamation)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L2315)
  - [Chương 15: Hệ thống Giao tiếp C/C++ FFI & Tích hợp Thư viện Bản địa (FFI & Bindings)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L3056)
- **PHẦN V: NATIVE AOT COMPILATION & LLVM BACKEND**:
  - [Chương 16: Kiến trúc Biên dịch AOT & Hạ mức LLVM (Native AOT & LLVM Lowering)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L3969)
  - [Chương 17: Tối ưu hóa Trung gian LLVM & Vector hóa SIMD (LLVM Passes & SIMD)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L4848)
  - [Chương 18: Mã hóa Nhị phân Cuối & Liên kết Hệ thống (Code Generation, Object Files & Linkers)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L5566)
- **PHẦN VI: RUNTIME NÂNG CAO, ĐỒNG QUY & SỢI NHẸ**:
  - [Chương 19: Lập trình Bất đồng bộ, Sợi nhẹ (Fibers) & Vòng lặp Sự kiện (Async, Fibers & Event Loops)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L6285)
  - [Chương 20: Mô hình Actor & Giao tiếp Kênh truyền Phi khóa (Actor System & Lock-Free Channels)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md#L7039)

---

#### 📘 [TẬP 3: ĐO LƯỜNG VI KIẾN TRÚC, TOOLCHAIN, JIT/OSR, CỖ MÁY LƯỢNG TỬ VÀ TẦNG THỰC THI LLM TỐI ƯU (VOL 3)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md)
*Dung lượng: 210+ KB | 28 Chương giải phẫu toàn diện hệ thống Tersun.*

- **PHẦN VI: RUNTIME NÂNG CAO & CÔNG CỤ HỆ SINH THÁI (HOÀN TẤT)**:
  - [Chương 21: Hệ thống Phân tích Hiệu năng, Đo đạc Đoản mạch & Bộ Tự Chẩn đoán (Telemetry & Diagnostics)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L5)
  - [Chương 22: Hệ sinh thái Công cụ, Trình Quản lý Gói & Tương lai Kiến trúc Tersun (TPM, LSP, Future)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L704)
  - [Chương 23: Kiến trúc JIT Compiler, Thay thế khung giữa vòng lặp (OSR) & Giải tỏa suy đoán an toàn (Speculative Deoptimization)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L1450)
  - [Chương 24: Cỗ máy lượng tử QVM độc lập, Biến đổi bước nhảy không cấp phát & Giới hạn phần cứng thực tế ($N=4\dots30$)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L1566)
- **PHẦN VII: TẦNG THỰC THI MÔ HÌNH NGÔN NGỮ LỚN BẢN ĐỊA & TỐI ƯU HÓA TÍNH TOÁN SONG SONG (GATE 7.4 & 7.5)**:
  - [Chương 25: Kiến Trúc LLM Runtime Bản Địa: Tokenizer Byte-Level BPE, Hợp Đồng Sampler 7 Bước & StopMatcher Không Cấp Phát](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#ch25-llm-runtime)
  - [Chương 26: Quản Trị Bộ Nhớ KV Cache, Bất Biến Zero-Allocation (malloc == 0) & Bằng Chứng Khử Phân Kỳ Vi Sai](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#ch26-kv-cache)
  - [Chương 27: Thang Tối Ưu Hóa Attention 7 Bậc (A0 -> A6), Vi Nhân SIMD AVX2/FMA & Hợp Đồng Số Học 3 Tầng](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#ch27-attention-ladder)
  - [Chương 28: Điều Phối Song Song Độc Quyền (Single Owner of Parallelism), Shape-Aware BitLinear & Đo Đạc Đoản Mạch TTFT/TPOT](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#ch28-parallel-bitlinear)
- **BẢNG QUY CHIẾU & ĐỐI SÁNH TỔNG HỢP**:
  - [Tổng kết Hệ thống 7 Phần Kiến trúc Toàn cảnh (28 Chương)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L1650)

---

### TRACK B: BỘ GIÁO TRÌNH LẬP TRÌNH TERSUN
#### *(First-Principles Tersun Programming: From Hardware Mechanics to Quantum & LLM Applications)*

*Bao gồm 3 Tập, 11 Phần học thuật và 40 Chương triển khai mã nguồn thực chiến từ cơ bản đến đỉnh cao.*

#### 📗 [TẬP 1: CƠ CHẾ BỘ NHỚ, CÚ PHÁP, HÀM, OOP VÀ GENERICS (VOL 1)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md)
*Dung lượng: 533.4 KB | 10,301 dòng mã và giải thích sư phạm.*

- **PHẦN I: NỀN TẢNG KHỞI NGUYÊN (FOUNDATIONS & MOTIVATION)**:
  - [Chapter 1 — Khi Bộ Nhớ Chưa Có Tên (Variables & Values)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L1)
  - [Chapter 2 — Bản Chất Của Biểu Thức (Expressions & Operators)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L450)
  - [Chapter 3 — Quyết Định Rẽ Nhánh (Conditionals & branch3)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L900)
  - [Chapter 4 — Sự Bất Tận Của Thời Gian (Loops & Iteration)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L1400)
- **PHẦN II: NGÔN NGỮ CỐT LÕI TERSUN (TERSUN CORE LANGUAGE)**:
  - [Chương 5: Cú pháp Nhận diện & Bộ Phân tích Từ vựng (Lexing & Scanning)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L1870)
  - [Chương 6: Khai báo Biến, Hệ thống Kiểu & Quản lý Phạm vi (Scopes & Types)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L2350)
  - [Chương 7: Hệ Toán tử Số học, So sánh & Toán tử Tam phân Cân bằng](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L2820)
  - [Chương 8: Vòng lặp, Duyệt dãy & Siêu lệnh OP_LOOP_RANGE_FAST](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L3290)
- **PHẦN III: HÀM, PHÂN RÃ CHỨC NĂNG & QUẢN LÝ NGĂN XẾP**:
  - [Chương 9: Tái sử dụng Mã & Lệnh Nhảy có Khả năng Quay về (Call Stack)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L3770)
  - [Chương 10: Tham số, Truyền Giá trị & Hiệp ước Gọi hàm (ABI & Conventions)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L4250)
  - [Chương 11: Đệ quy, Phân rã Bài toán & Nguy cơ Tràn Ngăn xếp (Recursion)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L4730)
  - [Chương 12: Hàm Vô danh, Biểu thức Lambda & Closure (Closures & Capture)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L5210)
- **PHẦN IV: CẤU TRÚC DỮ LIỆU & BỘ NHỚ HEAP**:
  - [Chương 13: Mảng Động & Chiến Lược Tái Cấp Phát (Vector & Growable Arrays)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L5690)
  - [Chương 14: Chuỗi Ký Tự UTF-8, Bảng Băm & Tra Cứu O(1) (Strings & Hash Maps)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L6170)
  - [Chương 15: Cấu Trúc Bản Ghi (Structs) & Bố Cục Bộ Nhớ Đệm Phẳng (Flat Memory Layout)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L6650)
  - [Chương 16: Con Trỏ Thông Minh & Quản Lý Vùng Nhớ Arena (Arena Allocators)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L7130)
- **PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & BẢNG ẢO**:
  - [Chương 17: Đóng Gói Dữ Liệu & Phương Thức Đối Tượng (Encapsulation)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L7610)
  - [Chương 18: Kế Thừa, Bảng Con Trỏ Ảo (vtable) & Đa Hình Động (Virtual Dispatch)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L8090)
  - [Chương 19: Giao Diện (Interfaces) & Kiểm Tra Hợp Đồng Định Kiểu](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L8570)
  - [Chương 20: Tối Ưu Hóa Bộ Nhớ Đệm Nội Tuyến Cho Đối Tượng (Polymorphic Inline Caching)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L9050)
- **PHẦN VI: HỆ THỐNG KIỂU NÂNG CAO & AN TOÀN BỘ NHỚ**:
  - [Chương 21: Kiểu Dữ Liệu Đại Số & So Khớp Mẫu (Algebraic Data Types & Pattern Matching)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L9530)
  - [Chương 22: Lập Trình Tổng Quát (Generics) & Đơn Hình Hóa (Monomorphization)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L10010)

---

#### 📗 [TẬP 2: TAM PHÂN CÂN BẰNG, TAFPU VÀ BẤT ĐỒNG BỘ COROUTINES (VOL 2)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md)
*Dung lượng: 189.4 KB | 3,360 dòng mã chuyên sâu.*

- **PHẦN VII: TAM PHÂN CÂN BẰNG & VI KIẾN TRÚC TAFPU**:
  - [Chương 23: Bản Chất Số Học Tam Phân Cân Bằng (Balanced Ternary & Trit Operations)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L3)
  - [Chương 24: BTVP — Giải Thuật Cộng Tam Phân Không Lan Truyền Sóng Nhớ (Carry-Free BTVP)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L450)
  - [Chương 25: Trường Số Thực Đại Số $\mathbb{Q}(\sqrt{3})$ & Độ Chính Xác Tuyệt Đối Không Sai Số Làm Tròn](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L900)
  - [Chương 26: BitNet b1.58: Nhân Ma Trận Không Cần Bộ Nhân Phần Cứng (Multiplication-Free GEMM)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L1350)
  - [Chương 27: Bộ Xử Lý TAFPU — Tập Lệnh Nơ-ron Tam Phân Cho Trí Tuệ Nhân Tạo (TAFPU Neurons)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L1820)
  - [Chương 28: Chứng Minh Hình Thức Bằng Trợ Lý Lean 4 (Formal Proof of TAFPU Arithmetic)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L2300)
- **PHẦN VIII: LẬP TRÌNH BẤT ĐỒNG BỘ, ĐA LUỒNG & ĐỒNG BỘ HÓA**:
  - [Chương 29: Coroutines & Cơ Chế Hoãn Thực Thi (Stackless Async/Await)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L2780)
  - [Chương 30: Vòng lặp Sự kiện Đa tầng (Tersun Event Loop & Tri-Priority Scheduler)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L3261)

---

#### 📗 [TẬP 3: NATIVE THREADS, LLVM AOT, JIT/OSR, QVM VÀ ĐIỆN TOÁN LƯỢNG TỬ & LLM RUNTIME (VOL 3)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md)
*Dung lượng: 250+ KB | 40 Chương triển khai hoàn chỉnh ứng dụng hiệu năng cao.*

- **PHẦN VIII: LẬP TRÌNH BẤT ĐỒNG BỘ, ĐA LUỒNG & ĐỒNG BỘ HÓA (HOÀN TẤT)**:
  - [Chương 31: Đa Luồng Thật & Truyền Thông Điệp (Native Threads & Actor Channels)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L6)
  - [Chương 32: An Toàn Bất Đồng Bộ & Đồng Bộ Hóa Không Khóa (Lock-Free Atomics)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L439)
- **PHẦN IX: TRÌNH BIÊN DỊCH NATIVE AOT & BỘ NHỚ TRƯỜNG LƯỢNG TỬ QVM**:
  - [Chương 33: Hạ Tầng Mã Máy LLVM IR & Biên Dịch AOT Đa Nền Tảng (LLVM SSA & Triples)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L851)
  - [Chương 34: Máy Ảo Lượng Tử QVM & Không Gian Hilbert 2-Bit (Zero-Opcode Execution)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L1239)
  - [Chương 35: Cổng Lượng Tử Tam Phân Qutrit & Biến Đổi Hadamard Tam Phân (Qutrit Grover)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L2350)
  - [Chương 36: Giao Thức FFI C-Bindgen & Hệ Sinh Thái Gói TPM (Foreign Function Interface & TPM)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L2354)
- **PHẦN X: HIỆU NĂNG TỐI THƯỢNG VỚI JIT, OSR & MÔ PHỎNG LƯỢNG TỬ ĐẠI QUY MÔ**:
  - [Chương 37: Kỹ Thuật Lập Trình Hiệu Năng Cao: On-Stack Replacement (OSR), Flat Structs & Native AOT Hot Loops](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L3008)
  - [Chương 38: Lập Trình Mô Phỏng Lượng Tử Quy Mô Lớn: Grover, QFT & Chạm Trần Phần Cứng N=29 Qubits](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L3212)
- **PHẦN XI: LẬP TRÌNH MÔ HÌNH AI TAM PHÂN & LLM RUNTIME BẢN ĐỊA (GATE 7.4 & 7.5)**:
  - [Chương 39: Quản Lý Gói Mô Hình & Định Dạng Chat: SafeTensors, ModelManifest & ChatTemplate](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#ch39-model-package)
  - [Chương 40: Lập Trình Suy Luận Tự Hồi Quy & Thực Thi CLI setunc ai](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#ch40-autoregressive-cli)
- **TỔNG KẾT TOÀN DIỆN**:
  - [Tổng Kết Toàn Diện Giáo Trình Lập Trình Tersun (40 Chương - 11 Phần)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L3466)

---

## V. BẢNG QUY CHIẾU MÃ NGUỒN THỰC TẾ & THÍ NGHIỆM THEN CHỐT

Mỗi chương trong giáo trình đều được liên kết trực tiếp với các tệp nguồn trong thư mục [Code/](file:///d:/New%20PJ/Ternary/Compiler/Code) của dự án:

| Khái Niệm / Cấu Trúc | Tệp Nguồn C++ Triển Khai | Chương Hệ Thống | Chương Lập Trình |
| :--- | :--- | :--- | :--- |
| **Lexer & Zero-Copy Token** | [lexer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/lexer.hpp), `lexer.cpp` | Sys.Vol 1: Ch.4 | Prog.Vol 1: Ch.5 |
| **Pratt Parser & AST Nodes** | [parser.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/parser.hpp), [ast.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/ast.hpp) | Sys.Vol 1: Ch.5 | Prog.Vol 1: Ch.1-4 |
| **Type Checker & Generics** | [type_checker.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/type_checker.hpp), [monomorphizer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/monomorphizer.hpp) | Sys.Vol 1: Ch.6, 7 | Prog.Vol 1: Ch.21, 22 |
| **Canonical Ternary IR (Gate 7.3.3)**| [canonical_ternary_ir.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/canonical_ternary_ir.hpp) | Gate 7.3.3 | Sys.Vol 1: Ch.9, 10 |
| **Stack VM & Dispatch Loop** | [vm.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/vm.hpp), `vm.cpp` | Sys.Vol 2: Ch.12, 13 | Prog.Vol 1: Ch.8-10 |
| **NaN-Boxing 64-bit Values** | [value_nanbox.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value_nanbox.hpp) | Sys.Vol 2: Ch.13 | Prog.Vol 1: Ch.6 |
| **Arena & Memory Manager** | [arena.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/arena.hpp) | Sys.Vol 2: Ch.14 | Prog.Vol 2: Ch.23 |
| **Balanced Ternary ALU (TAFPU)**| [tafpu.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tafpu/tafpu.hpp), `trit.cpp` | Sys.Vol 2: Ch.12 | Prog.Vol 2: Ch.25-28 |
| **Native LLVM AOT Compiler**| [llvm_emitter.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/llvm_emitter.hpp) | Sys.Vol 2: Ch.16-18 | Prog.Vol 3: Ch.33 |
| **JIT Compiler & OSR Engine** | `jit_compiler.cpp`, `deopt.cpp` | Sys.Vol 3: Ch.23 | Prog.Vol 3: Ch.37 |
| **Scaled QVM Quantum Engine** | [qvm.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/qvm/qvm.hpp), `qcircuit.cpp` | Sys.Vol 3: Ch.24 | Prog.Vol 3: Ch.34, 35, 38 |
| **Byte-Level BPE Tokenizer (Gate 7.4)** | [tokenizer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tensor/nn/format/tokenizer.hpp), `tokenizer.cpp` | Sys.Vol 3: Ch.25 | Prog.Vol 3: Ch.39 |
| **Sampler & StopMatcher (Gate 7.4)** | [sampler.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tensor/nn/runtime/sampler.hpp), `sampler.cpp` | Sys.Vol 3: Ch.25 | Prog.Vol 3: Ch.40 |
| **KV Cache & Zero-Alloc (Gate 7.4)** | [kv_cache.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tensor/nn/memory/kv_cache.hpp), `inference_session.cpp` | Sys.Vol 3: Ch.26 | Prog.Vol 3: Ch.40 |
| **7-Stage Attention SIMD (Gate 7.5)** | [attention_kernels.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tensor/nn/ops/attention_kernels.hpp), `attention_kernels.cpp` | Sys.Vol 3: Ch.27 | Prog.Vol 3: Ch.40 |
| **ParallelPlanner & BitLinear (Gate 7.5)**| [parallel_planner.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tensor/nn/runtime/parallel_planner.hpp), `bit_linear.cpp` | Sys.Vol 3: Ch.28 | Prog.Vol 3: Ch.40 |

---

## VI. HƯỚNG DẪN THỰC HÀNH & KIỂM CHỨNG TỰ ĐỘNG (LAB & VERIFICATION GUIDE)

Để trải nghiệm trọn vẹn giáo trình, sinh viên và kỹ sư sử dụng trực tiếp bộ công cụ biên dịch `setunc.exe` đã được tối ưu hóa:

1. **Biên dịch & Chạy mã nguồn Setun cơ bản**:
   ```bash
   cd "d:\New PJ\Ternary\Compiler\Code"
   .\setunc.exe run ..\app_demo.stn
   ```

2. **Chạy Thí nghiệm Khoa học Số học TAFPU $\mathbb{Q}(\sqrt{3})$**:
   ```bash
   .\setunc.exe run ..\scientific_lab.stn
   ```

3. **Chạy Mô phỏng Mạch Thuật toán Lượng tử (QVM Execution)**:
   ```bash
   .\setunc.exe run ..\quantum_demo.stn
   ```

4. **Kích Hoạt On-Stack Replacement (OSR) Trong Vòng Lặp Nóng**:
   ```bash
   .\setunc.exe run --jit-osr ..\hot_loop_test.stn
   ```

5. **Biên dịch Mã máy Bản địa AOT Tối Ưu (Native C++ / LLVM Pipeline -O3)**:
   ```bash
   .\setunc.exe aot ..\scientific_lab.stn -o scientific_native.exe -O3
   .\scientific_native.exe
   ```

6. **Chạy Sinh Văn Bản AI Bản Địa Với Mô Hình BitNet (Gate 7.4 & Gate 7.5)**:
   ```bash
   .\setunc.exe ai generate --model-dir path\to\bitnet_model --prompt "Xin chao" --temp 0.7 --max-tokens 64
   ```

7. **Bật Chế Độ Trò Chuyện Tương Tác REPL ChatML Đa Lượt**:
   ```bash
   .\setunc.exe ai chat --model-dir path\to\bitnet_model
   ```

8. **Chạy Đối Chuẩn Hiệu Năng Thực Thi LLM Chuyên Sâu (Gate 7.5 Benchmark)**:
   ```bash
   .\build\benchmarks\gate75_benchmark.exe
   ```

9. **Chạy Kiểm Định Toàn Bộ Hệ Thống Với CTest (9 Test Suites)**:
   ```bash
   ctest --test-dir build --output-on-failure
   ```

---

## VII. BẢN ĐỒ CẦU NỐI TRI THỨC KIẾN TRÚC (ARCHITECTURE KNOWLEDGE BRIDGES)

Để hỗ trợ người học chuyển tiếp từ **nhận thức lý thuyết (Giáo trình GT/)** sang **kỹ nghệ phần mềm thực chiến (Core Docs)** và **quyết định thiết kế thực tế (ADRs & Research Forensics)**, hệ thống thiết lập bảng liên kết trực tiếp dưới đây:

| Chủ Đề Học Tập (GT Curriculum) | Tham Chiếu Kỹ Thuật (Core Doc) | Quyết Định Thiết Kế (ADR) | Bằng Chứng Thực Nghiệm (Forensics & Seal) |
| :--- | :--- | :--- | :--- |
| **NaN-Boxing & Value Model** (Sys.Vol 2: Ch.13) | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | [ADR-001: NaN-Boxing](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-001-nan-boxing-64bit-value.md) | `value.hpp` bitmask canonical verification |
| **Quản Lý Vùng Nhớ & GC** (Sys.Vol 2: Ch.14) | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | [ADR-002: VMArena](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-002-vmarena-handle-indexing.md)<br>[ADR-003: Tri-Color GC](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-003-tri-color-mark-sweep-gc.md) | `GCEngine` generational write barrier benchmarks |
| **Điều Phối Thông Dịch VM** (Sys.Vol 2: Ch.12) | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | [ADR-004: Direct Threading](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-004-direct-threaded-dispatch.md) | BTB miss reduction $18.4\% \to 4.2\%$ |
| **Hợp Đồng Mã Trung Gian (IR)** (Sys.Vol 1: Ch.9-10) | [Code/src/compiler/compiler.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/compiler.md) | [Doc/Rule.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/Rule.md) | SSA Dominance Frontier invariants |
| **Canonical Ternary IR & Tuples** (Gate 7.3.3) | [Code/src/compiler/compiler.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/compiler.md) | Gate 7.3.3 Specification | Hierarchical GEMM & TensorView differential parity |
| **Tối Ưu Hóa JIT, SRA & BCE** (Sys.Vol 3: Ch.23) | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | [ADR-005: Linear Scan](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-005-linear-scan-register-allocator.md)<br>[ADR-007: SRA](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-007-scalar-replacement-of-aggregates.md)<br>[ADR-008: BCE Hoisting](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-008-bounds-check-elimination-hoisting.md) | W2 BCE Seal ($3.75\text{ ms}$ / `G6R.2.4`)<br>W4 SRA Seal ($0.94\text{ ms}$ / `G6R.2.2`) |
| **Vector Hóa SIMD AVX2** (Sys.Vol 2: Ch.17) | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | [ADR-009: AVX2 SIMD](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-009-avx2-simd-stride1-vectorization.md) | W3 SIMD Seal ($4.88\text{ ms}$ / `G6R.2.1`) |
| **Số Học Đại Số $\mathbb{Q}(\sqrt{3})$ & BitNet** (Prog.Vol 2: Ch.25-28) | [Code/src/tafpu/tafpu.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tafpu/tafpu.md) | [Doc/FormalVerification_Lean4.lean](file:///d:/New%20PJ/Ternary/Compiler/Doc/FormalVerification_Lean4.lean) | 4-Level Proof Ladder (Lean 4 machine proven) |
| **Mô Phỏng Lượng Tử QVM & MPS** (Sys.Vol 3: Ch.24) | [Code/src/qvm/qvm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/qvm/qvm.md) | [ADR-010: QVM Optimization](file:///d:/New%20PJ/Ternary/Compiler/Doc/adr/ADR-010-qvm-circuit-optimization-and-qft-scaling.md)<br>[Doc/architecture_overview.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/architecture_overview.md) | [QFT Scaling Report](file:///d:/New%20PJ/Ternary/Compiler/Doc/artifacts/qvm_benchmark/QFT_SCALING_REPORT.md)<br>$N=24$ Qubits trong $2.89\text{ s}$<br>SVD Bond truncation $\chi \le 64$ ($100+$ qubits) |
| **Lập Lịch Vi Nhân Tam Phân** (Prog.Vol 2: Ch.30) | [Code/src/kernel/kernel.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/kernel/kernel.md) | [Doc/architecture_overview.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/architecture_overview.md) | Preemptive RT queue priority tests |
| **LLM Runtime & Zero-Alloc Session** (Sys.Vol 3: Ch.25-26) | [Code/src/tensor/nn/nn.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tensor/nn/nn.md) | Gate 7.4 Specification | `gate74_runtime_tests.exe`: KV parity $\Delta=0.0$, steady `malloc == 0` |
| **Thang Attention 7 Bậc $A_0 \to A_6$** (Sys.Vol 3: Ch.27) | [Code/src/tensor/nn/nn.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tensor/nn/nn.md) | Gate 7.5 Specification | Max error $< 6\times 10^{-7}$, Cosine $1.0$, Attention 6.5x – 8.7x |
| **Single Owner Parallel & BitLinear** (Sys.Vol 3: Ch.28) | [Code/src/tensor/nn/nn.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tensor/nn/nn.md) | Gate 7.5 Specification | Decoupled speedup benchmark, 1T-8T parallel efficiency |

---

> **Bản quyền & Giữ nguyên Nội dung**:  
> Toàn bộ nội dung chi tiết trong các tập giáo trình gốc được bảo toàn 100% nguyên trạng, chuẩn hóa cấu trúc định hướng học thuật và liên kết điều hướng thông suốt qua tài liệu này.
