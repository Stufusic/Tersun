# TERSUN ACADEMIC CURRICULUM & MASTER SYLLABUS
## HỆ THỐNG GIÁO TRÌNH KHOA HỌC MÁY TÍNH & KỸ NGHỆ HỆ THỐNG TERSUN
### *(First-Principles Computing, Compiler Construction, Virtual Machines, Balanced Ternary Architecture & Quantum Execution)*

---

```
             ┌─────────────────────────────────────────────────────────────┐
             │       TERSUN COMPUTER SYSTEMS & PROGRAMMING CURRICULUM      │
             │           Đại học Khoa học Máy tính & Kỹ thuật Hệ thống     │
             └──────────────────────────────┬──────────────────────────────┘
                                            │
                    ┌───────────────────────┴───────────────────────┐
                    ▼                                               ▼
     ┌─────────────────────────────┐                 ┌─────────────────────────────┐
     │  TRACK A: SYSTEM ARCHITECTURE│                 │ TRACK B: SOFTWARE & TERNARY │
     │   Giáo trình Hệ thống Tersun │                 │  Giáo trình Lập trình Tersun│
     │   (Compiler, VM, JIT, AOT)  │                 │ (From First-Principles)     │
     │       [3 Volumes - 22 Ch.]   │                 │     [3 Volumes - 36 Ch.]    │
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
3. **No Optimization Without Measurement (Không tối ưu hóa vô căn cứ)**: Mọi kỹ thuật (Direct Threading, NaN-Boxing, Arena Allocators, Loop Quickening, SIMD) đều có chi phí đánh đổi (trade-offs). Mọi tối ưu hóa bắt buộc phải được định lượng bằng Benchmark Deterministic.
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
- **CLO-6 (Quantum Computation & Hilbert State Simulation)**: Hiểu và mô phỏng được trạng thái lượng tử đa Qubit/Qutrit, ma trận mật độ, cổng Hadamard tam phân, giải thuật tìm kiếm Grover và kiến trúc máy ảo lượng tử QVM không mã lệnh (Zero-Opcode Execution).

---

## III. BẢN ĐỒ LỘ TRÌNH HỌC TẬP (CURRICULUM ROADMAPS)

Tùy theo định hướng chuyên môn, người học có thể lựa chọn 1 trong 3 lộ trình:

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 1: SYSTEM & COMPILER TRACK                     │
│               (Dành cho Kỹ sư Hệ thống, Trình biên dịch & Máy ảo cấp thấp)             │
│                                                                                        │
│  Sys.Vol 1 (Ch.1-10)    ──►   Sys.Vol 2 (Ch.11-20)     ──►    Sys.Vol 3 (Ch.21-22)     │
│  [Frontend & SSA IR]           [TVM, GC, AOT, LLVM]            [Telemetry & Profiling] │
└────────────────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 2: APPLICATION & TERNARY TRACK                 │
│                 (Dành cho Lập trình viên Hệ thống, AI Tam phân & Lượng tử)             │
│                                                                                        │
│  Prog.Vol 1 (Ch.1-22)   ──►   Prog.Vol 2 (Ch.23-30)    ──►    Prog.Vol 3 (Ch.31-36)    │
│  [Core Lang & OOP]             [TAFPU, BitNet, Async]          [LLVM AOT, QVM Quantum] │
└────────────────────────────────────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                LỘ TRÌNH 3: UNIFIED FULL-STACK MASTERY                  │
│                     (Đào tạo Kỹ sư Trưởng / Kiến trúc sư Hệ thống Toàn diện)           │
│                                                                                        │
│          Song hành từng cặp Chương: Lý thuyết Hệ thống <──> Hiện thực Ngôn ngữ         │
│          Ví dụ: Sys.Ch.5 (Parser C++) song hành Prog.Ch.5 (Lexing & Scanning)         │
│                 Sys.Ch.12-14 (TVM & GC) song hành Prog.Ch.23-24 (Arena & Heap)         │
│                 Sys.Ch.16-17 (LLVM AOT) song hành Prog.Ch.33 (LLVM Lowering)           │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## IV. MỤC LỤC TỔNG THỂ SIÊU LIÊN KẾT (MASTER HYPERLINKED DIRECTORY)

---

### TRACK A: BỘ GIÁO TRÌNH HỆ THỐNG TERSUN
#### *(Tersun Computer Systems Engineering: From First-Principles to Architecture)*

*Bao gồm 3 Tập, 16 Phần lý thuyết chuyên sâu và 22 Chương giải phẫu kiến trúc mã nguồn C++ compiler/VM.*

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

#### 📘 [TẬP 3: ĐO LƯỜNG VI KIẾN TRÚC, TOOLCHAIN VÀ TƯƠNG LAI ĐIỆN TOÁN TAM PHÂN (VOL 3)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md)
*Dung lượng: 96.0 KB | 1,480 dòng phân tích cao cấp và phụ lục tổng kết.*

- **PHẦN VI: RUNTIME NÂNG CAO & CÔNG CỤ HỆ SINH THÁI (HOÀN TẤT)**:
  - [Chương 21: Hệ thống Phân tích Hiệu năng, Đo đạc Đoản mạch & Bộ Tự Chẩn đoán (Telemetry & Diagnostics)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L5)
  - [Chương 22: Hệ sinh thái Công cụ, Trình Quản lý Gói & Tương lai Kiến trúc Tersun (TPM, LSP, Future)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L704)
- **BẢNG QUY CHIẾU & ĐỐI SÁNH TỔNG HỢP**:
  - [Tổng kết Hệ thống 6 Phần Kiến trúc Toàn cảnh](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md#L1447)

---

### TRACK B: BỘ GIÁO TRÌNH LẬP TRÌNH TERSUN
#### *(First-Principles Tersun Programming: From Hardware Mechanics to Quantum Applications)*

*Bao gồm 3 Tập, 9 Phần học thuật và 36 Chương triển khai mã nguồn thực chiến từ cơ bản đến đỉnh cao.*

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
- **PHẦN IV: CẤU TRÚC DỮ LIỆU & QUẢN LÝ BỘ NHỚ HEAP**:
  - [Chương 13: Mảng Động & Bộ nhớ Tuyến tính (Dynamic Arrays & Allocations)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L5700)
  - [Chương 14: Mảng Đa chiều & Ma trận Tam phân (Multi-Dim & Matrices)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L6200)
  - [Chương 15: Chuỗi Ký tự, Định dạng F-String & Bộ nhớ Đệm (Strings & Buffers)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L6700)
  - [Chương 16: Cấu trúc Bản ghi Struct & Bố cục Bộ nhớ (Structs & Layout)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L7200)
- **PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH**:
  - [Chương 17: Lớp (Class), Thuộc tính & Phương thức Khởi tạo (OOP Basics)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L7700)
  - [Chương 18: Kế thừa & Khung Đối tượng (Inheritance & Superclasses)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L8180)
  - [Chương 19: Đa hình & Bảng Phương thức Ảo (Polymorphism, VTable & Dispatch)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L8232)
  - [Chương 20: Giao diện (Interfaces), Traits & Hợp đồng Thiết kế (Contracts)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L8726)
- **PHẦN VI: HỆ THỐNG KIỂU NÂNG CAO (KHỞI ĐẦU)**:
  - [Chương 21: Kiểu Liệt kê Nâng cao (Algebraic Enums & Pattern Matching)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L9275)
  - [Chương 22: Generics & Tham số hóa Kiểu (Generics & Monomorphization)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md#L9774)

---

#### 📗 [TẬP 2: ARENA ALLOCATORS, VI KIẾN TRÚC TAFPU, BITNET VÀ EVENT LOOP (VOL 2)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md)
*Dung lượng: 187.4 KB | 3,745 dòng phân tích vi kiến trúc phần cứng và đồng quy.*

- **PHẦN VI: HỆ THỐNG KIỂU NÂNG CAO & AN TOÀN BỘ NHỚ (TIẾP TỤC)**:
  - [Chương 23: Quản lý Bộ nhớ Vùng chứa (Arena Allocators & Memory Pools)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L8)
  - [Chương 24: Bắt lỗi Ngoại lệ & An toàn Thời gian Chạy (Try/Catch & Unwinding)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L446)
- **PHẦN VII: HỆ THỐNG MÁY TÍNH TAM PHÂN & VI KIẾN TRÚC TAFPU**:
  - [Chương 25: Tryte, BTVP & Phép Cộng Tam phân Cân bằng (Balanced Ternary Adders)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L974)
  - [Chương 26: Số thực TAFPU & Không gian Chiếu $\mathbb{Q}(\sqrt{3})$ (Algebraic Number System)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L1403)
  - [Chương 27: Phép Nhân Không Cần Nhân (@ / Convolution) & SIMD BitNet (Ternary AI)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L1862)
  - [Chương 28: Ngăn xếp Tam phân & Rẽ nhánh 3 hướng (branch3: Setun-70 Dispatch)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L2308)
- **PHẦN VIII: LẬP TRÌNH BẤT ĐỒNG BỘ & EVENT LOOP (KHỞI ĐẦU)**:
  - [Chương 29: Bất đồng bộ & Máy Trạng thái của `async / await` (Coroutines)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L2812)
  - [Chương 30: Vòng lặp Sự kiện Đa tầng (Tersun Event Loop & Tri-Priority Scheduler)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md#L3261)

---

#### 📗 [TẬP 3: NATIVE THREADS, LLVM AOT, QVM VÀ ĐIỆN TOÁN LƯỢNG TỬ (VOL 3)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md)
*Dung lượng: 171.4 KB | 3,120 dòng phân tích điện toán lượng tử và AOT compiler.*

- **PHẦN VIII: LẬP TRÌNH BẤT ĐỒNG BỘ, ĐA LUỒNG & ĐỒNG BỘ HÓA (HOÀN TẤT)**:
  - [Chương 31: Đa Luồng Thật & Truyền Thông Điệp (Native Threads & Actor Channels)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L6)
  - [Chương 32: An Toàn Bất Đồng Bộ & Đồng Bộ Hóa Không Khóa (Lock-Free Atomics)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L439)
- **PHẦN IX: TRÌNH BIÊN DỊCH NATIVE AOT & BỘ NHỚ TRƯỜNG LƯỢNG TỬ QVM**:
  - [Chương 33: Hạ Tầng Mã Máy LLVM IR & Biên Dịch AOT Đa Nền Tảng (LLVM SSA & Triples)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L851)
  - [Chương 34: Máy Ảo Lượng Tử QVM & Không Gian Hilbert 2-Bit (Zero-Opcode Execution)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L1239)
  - [Chương 35: Cổng Lượng Tử Tam Phân Qutrit & Biến Đổi Hadamard Tam Phân (Qutrit Grover)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L2350)
  - [Chương 36: Tổng Kết Toàn Diện Giáo Trình & Tương Lai Điện Toán Tam Phân (Grand Finale)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md#L3003)

---

## V. BẢNG QUY CHIẾU MÃ NGUỒN THỰC TẾ & THÍ NGHIỆM THEN CHỐT

Mỗi chương trong giáo trình đều được liên kết trực tiếp với các tệp nguồn trong thư mục [Code/](file:///d:/New%20PJ/Ternary/Compiler/Code) của dự án:

| Khái Niệm / Cấu Trúc | Tệp Nguồn C++ Triển Khai | Chương Hệ Thống | Chương Lập Trình |
| :--- | :--- | :--- | :--- |
| **Lexer & Zero-Copy Token** | [lexer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/lexer.hpp), `lexer.cpp` | Sys.Vol 1: Ch.4 | Prog.Vol 1: Ch.5 |
| **Pratt Parser & AST Nodes** | [parser.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/parser.hpp), [ast.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/ast.hpp) | Sys.Vol 1: Ch.5 | Prog.Vol 1: Ch.1-4 |
| **Type Checker & Generics** | [type_checker.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/type_checker.hpp), [monomorphizer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/monomorphizer.hpp) | Sys.Vol 1: Ch.6, 7 | Prog.Vol 1: Ch.21, 22 |
| **Tree Optimizer & Passes** | [tree_canonicalize.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/tree_canonicalize.hpp), [tree_optimizer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/tree_optimizer.hpp) | Gate 5.1 & 5.2 | Sys.Vol 1: Ch.9 |
| **Linear IR & CFG Builder** | [opt_ir.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/opt_ir.hpp), [cfg.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/cfg.hpp) | Sys.Vol 1: Ch.9, 10 | Sys.Vol 2: Ch.11 |
| **Stack VM & Dispatch Loop** | [vm.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/vm.hpp), `vm.cpp` | Sys.Vol 2: Ch.12, 13 | Prog.Vol 1: Ch.8-10 |
| **NaN-Boxing 64-bit Values** | [value_nanbox.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value_nanbox.hpp) | Sys.Vol 2: Ch.13 | Prog.Vol 1: Ch.6 |
| **Arena & Memory Manager** | [arena.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/arena.hpp) | Sys.Vol 2: Ch.14 | Prog.Vol 2: Ch.23 |
| **Balanced Ternary ALU (TAFPU)**| [tafpu.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tafpu/tafpu.hpp), `trit.cpp` | Sys.Vol 2: Ch.12 | Prog.Vol 2: Ch.25-28 |
| **Native LLVM AOT Compiler**| [llvm_emitter.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/llvm_emitter.hpp) | Sys.Vol 2: Ch.16-18 | Prog.Vol 3: Ch.33 |
| **Quantum Virtual Machine** | [qvm.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/qvm/qvm.hpp), `qcircuit.cpp` | Sys.Vol 1: Ch.11-13 | Prog.Vol 3: Ch.34, 35 |
| **Telemetry & Diagnostics** | [vm_telemetry.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/vm_telemetry.hpp) | Sys.Vol 3: Ch.21 | Prog.Vol 3: Ch.36 |

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

4. **Biên dịch Mã máy Bản địa AOT (Native C++ / LLVM Pipeline)**:
   ```bash
   .\setunc.exe aot ..\scientific_lab.stn -o scientific_native.exe -O3
   .\scientific_native.exe
   ```

5. **Chạy Bộ Kiểm định 2.13 Triệu Bất Biến Toán học & Lượng tử (Exhaustive Verification)**:
   ```bash
   python bench/bench_gate5_harness.py CP1_TREE_OPT
   ```

---

> **Bản quyền & Giữ nguyên Nội dung**:  
> Toàn bộ nội dung chi tiết trong 6 tập giáo trình gốc được bảo toàn 100% nguyên trạng, chuẩn hóa cấu trúc định hướng học thuật và liên kết điều hướng thông suốt qua tài liệu này.  
> *Đại học Công nghệ & Hệ thống Tính toán Tersun (Tersun Computing Systems Group).*
