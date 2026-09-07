# TERSUN COMPUTING PLATFORM 1.0.3
### *Unified Balanced Ternary Computing, Native AOT Compiler & Quantum State Simulator*

[![Version](https://img.shields.io/badge/version-1.0.3-blue.svg)](file:///d:/New%20PJ/Ternary/Compiler/README.md)
[![Invariants](https://img.shields.io/badge/mathematical_invariants-2%2C135%2C241_verified_(100%25)-success.svg)](file:///d:/New%20PJ/Ternary/Compiler/test_registry/gate5_milestones.json)
[![Milestone Seals](https://img.shields.io/badge/cryptographic_seals-CP0__&__CP1_sealed-darkgreen.svg)](file:///d:/New%20PJ/Ternary/Compiler/test_registry/gate5_milestones.json)
[![Quantum Scaling](https://img.shields.io/badge/QFT_simulation-N%3D22_qubits_(4.19M_states)-purple.svg)](file:///d:/New%20PJ/Ternary/Compiler/Doc/artifacts/qvm_benchmark/QFT_SCALING_REPORT.md)
[![License](https://img.shields.io/badge/license-TIPARL_IP_Protected-red.svg)](file:///d:/New%20PJ/Ternary/Compiler/LICENSE.md)

---

> **Tersun** là một nền tảng ngôn ngữ lập trình và kiến trúc thực thi thống nhất thế hệ mới (Next-Generation Unified Computing Architecture), kết hợp hài hòa giữa:
> 1. **Máy ảo cổ điển hiệu năng cao (High-Performance Stack VM)** với cơ chế đóng gói NaN-Boxing 64-bit, phân phối luồng trực tiếp (Direct Threading), siêu lệnh (Superinstructions) và tối ưu hóa cây cú pháp chuẩn tắc (Tree Canonicalization & 8-Pass Optimizer).
> 2. **Trình biên dịch mã máy bản địa (Native AOT LLVM Backend)** sinh mã máy nhị phân x86-64 / ARM64 chạy ở tốc độ bare-metal.
> 3. **Hệ thống số học tam phân cân bằng (Balanced Ternary & TAFPU Architecture)**: Kiến trúc số học trên trường đại số $\mathbb{Q}(\sqrt{3})$ với **0% sai số làm tròn tích lũy** và giải thuật **BitNet 1.58-bit GEMM không cần bộ nhân phần cứng**.
> 4. **Máy ảo lượng tử không mã lệnh (Zero-Opcode Quantum Virtual Machine - QVM)**: Mô phỏng chính xác không gian Hilbert đến $2^{22}$ biên độ sóng trạng thái ($4,194,304$ amplitudes) và mạng Tensor Network / Matrix Product States (MPS) tới 64 qubits.

---

## 📚 BỘ ĐẠI GIÁO TRÌNH HỌC THUẬT TOÀN DIỆN (TERSUN MASTER CURRICULUM)

Nhằm phục vụ công tác đào tạo khoa học máy tính chuyên sâu từ nguyên lý sơ khởi đến vi kiến trúc phần cứng, dự án cung cấp **Bộ Đại Giáo Trình 2 Tuyến (2 Tracks), 6 Tập (6 Volumes), 16 Phần và 58 Chương chuyên sâu** với hơn 30.000 dòng mã nguồn và phân tích kỹ thuật:

```
                            ┌──────────────────────────────────────────────┐
                            │    TERSUN MASTER ACADEMIC CURRICULUM         │
                            │      Xem mục lục: GT/README.md               │
                            └──────────────────────┬───────────────────────┘
                                                   │
                   ┌───────────────────────────────┴───────────────────────────────┐
                   ▼                                                               ▼
    ┌────────────────────────────────────────────┐                  ┌────────────────────────────────────────────┐
    │  TRACK A: KỸ NGHỆ HỆ THỐNG & BIÊN DỊCH     │                  │  TRACK B: LẬP TRÌNH TỪ NGUYÊN LÝ THỨ NHẤT  │
    │  (Tersun Computer Systems Engineering)     │                  │  (First-Principles Tersun Programming)     │
    │  3 Volumes • 16 Parts • 22 Chapters        │                  │  3 Volumes • 9 Parts • 36 Chapters         │
    │  - Frontend Compiler & Pratt Parsing       │                  │  - Core Variables, Scopes & Flow           │
    │  - SSA IR, CFG & Dataflow Optimization     │                  │  - Functions, Stack ABI & Closures         │
    │  - Virtual Machine, NaN-Boxing & GC        │                  │  - Heap, Structs, Classes, VTable OOP      │
    │  - Native AOT Lowering & SIMD Vectorize    │                  │  - Balanced Ternary BTVP & TAFPU Real      │
    │  - Hardware Profiling, Telemetry & LSP     │                  │  - Multiplication-Free BitNet GEMM         │
    │                                            │                  │  - Async/Await Coroutines & Event Loop     │
    │                                            │                  │  - Native Threads & Lock-Free Channels     │
    │                                            │                  │  - LLVM AOT, QVM & Qutrit Quantum Gates    │
    └────────────────────────────────────────────┘                  └────────────────────────────────────────────┘
```

👉 **Khám phá toàn văn giáo trình & mục lục điều hướng siêu liên kết tại:**  
📖 [**GT/README.md — Đề cương & Giáo trình Toàn diện**](file:///d:/New%20PJ/Ternary/Compiler/GT/README.md)

- **Track A — Giáo trình Hệ thống**:
  - [Hệ thống Vol 1: Từ Nguyên lý Cơ bản đến SSA Form (Chương 1 – 10)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%201.md)
  - [Hệ thống Vol 2: Từ CFG, Máy ảo TVM, Thu gom rác đến Native LLVM AOT (Chương 11 – 20)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%202.md)
  - [Hệ thống Vol 3: Đo lường Vi kiến trúc, Toolchain và Tương lai Điện toán (Chương 21 – 22)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20HỆ%20THỐNG%20TERSUN%20_TỪ%20NỀN%20TẢNG%20ĐẾN%20KIẾN%20TRÚC%20NÂNG%20CAO%20VOL%203.md)
- **Track B — Giáo trình Lập trình Thực chiến**:
  - [Lập trình Vol 1: Cơ chế Bộ nhớ, Cú pháp, Hàm, OOP và Generics (Chương 1 – 22)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%201.md)
  - [Lập trình Vol 2: Arena Allocators, Vi kiến trúc TAFPU, BitNet và Event Loop (Chương 23 – 30)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%202.md)
  - [Lập trình Vol 3: Native Threads, LLVM AOT, QVM và Điện toán Lượng tử (Chương 31 – 36)](file:///d:/New%20PJ/Ternary/Compiler/GT/GIÁO%20TRÌNH%20LẬP%20TRÌNH%20TERSUN%20(FIRST-PRINCIPLES%20TERSUN%20PROGRAMMING)%20Vol%203.md)

---

## 🏛️ BỐN TRỤ CỘT KIẾN TRÚC TERSUN 1.0.3

```text
+========================================================================================================+
|                                    TERSUN 1.0.3 UNIFIED ARCHITECTURE                                   |
+==================================+==================================+==================================+
|  1. CLASSICAL RUNTIME (VM)       |  2. NATIVE AOT / LLVM BACKEND    |  3. QUANTUM ENGINE (QVM)         |
|  - 64-bit IEEE NaN-Boxing Value  |  - AST Lowering to LLVM SSA IR   |  - Zero-Opcode Q-ISA (.qbc)      |
|  - Direct-Threaded Dispatch Loop |  - Target Triples Optimization   |  - Exact Statevector (<= 24Q)    |
|  - Superinstructions (Tiers A-E) |  - Register Alloc & Vector SIMD  |  - Tensor Network MPS (<= 64Q)   |
|  - Adaptive Quickening & Deopt   |  - Direct C++ Transpiler (-O3)   |  - Qutrit Ternary Gates          |
|  - Shape Inline Caching (IC)     |  - Bare-metal machine execution  |  - OpenQASM 3.0 Circuit Exporter |
+----------------------------------+----------------------------------+----------------------------------+
|  4. BALANCED TERNARY & HARDWARE SYNTHESIS (FOUNDATIONAL HARDWARE LAYER)                                |
|  - TAFPU Q(sqrt(3)): Cấu trúc đại số alpha + beta*sqrt(3), 0% sai số làm tròn tích lũy               |
|  - BTVP Adder: Cộng tam phân cân bằng {-1, 0, 1} không lan truyền sóng nhớ (No Ripple Carry)           |
|  - BitNet 1.58-bit GEMM: Phép nhân ma trận AI không tiêu tốn bộ nhân phần cứng (Multiplication-Free)  |
|  - branch3: Rẽ nhánh 3 hướng theo dấu giá trị tam phân trong đúng 1 chu kỳ xung nhịp                   |
|  - Verilog-2001 RTL Emitter: Tự động tổng hợp mạch bán dẫn nạp thẳng lên phần cứng FPGA / ASIC         |
+========================================================================================================+
```

---

## ⚡ BỘ CÔNG CỤ TOOLCHAIN `setunc` 1.0.3

Trình biên dịch và máy ảo Tersun được đóng gói trong một nhị phân độc lập duy nhất `setunc.exe` với đầy đủ các lệnh chuyên dụng:

```bash
# 1. Chạy chương trình trực tiếp trên máy ảo VM
setunc run <file.stn> [--direct | --switch] [--telemetry]

# 2. Biên dịch mã nguồn ra tệp nhị phân Bytecode (.tbc v2)
setunc compile <file.stn> -o <out.tbc>

# 3. Biên dịch AOT sang nhị phân bản địa (LLVM Backend / Native Speed)
setunc aot <file.stn> -o <out.exe> -O3

# 4. Dịch ngược (Disassemble) Bytecode cổ điển (.tbc) hoặc lượng tử (.qbc)
setunc disasm <file.tbc | file.qbc>

# 5. Mô phỏng cộng tam phân cân bằng BTVP từng bước (Bit-by-Bit Trace)
setunc trace-btvp <operand_a> <operand_b>

# 6. Chạy Benchmark so sánh tốc độ TAFPU vs IEEE 754
setunc benchmark

# 7. Khởi động môi trường tương tác Setun-70 REPL
setunc repl

# 8. Bộ tự kiểm tra toàn diện tích hợp (Self-Test Suite)
setunc test

# 9. Ngôn ngữ & Công cụ Phát triển (Developer Ecosystem)
setunc lsp                    # Language Server Protocol stdio
setunc fmt <file.stn> [-w]     # Bộ tự động chuẩn hóa & định dạng mã nguồn
setunc debug <file.tbc>        # Trình gỡ lỗi trực quan từng bước
setunc bindgen <header.h>      # Tự động sinh FFI Bindings từ C/C++ Header
setunc tpm <init|build|test>   # Trình quản lý gói Tersun Package Manager
```

---

## 🔬 ĐỐI CHUẨN HIỆU NĂNG & DỮ LIỆU ĐO ĐẠC THỰC NGHIỆM

### A. Đối Chuẩn Hiệu Năng So Với CPython 3.14, C++20 và Rust
*(Đo đạc thực nghiệm độc lập $N=10$ lần lặp, lấy giá trị Trung vị - Median trên vi xử lý x86_64)*:

| Tác vụ Thực nghiệm | CPython 3.14 (Interp) | Tersun 1.0.3 (Interp) | Tốc độ Tersun VM | Tersun Native AOT |
| :--- | :---: | :---: | :---: | :---: |
| **Dispatch Vòng lặp (3M ops)** | $140.7\text{ ms}$ | **$54.9\text{ ms}$** | **$2.56\times$ Nhanh hơn** | **$1.8\text{ ms}$** |
| **Rẽ nhánh Điều khiển (2M branches)**| $163.9\text{ ms}$ | **$59.0\text{ ms}$** | **$2.77\times$ Nhanh hơn** | **$1.2\text{ ms}$** |
| **Đệ quy Fibonacci $N=24$** | $5.43\text{ ms}$ | **$2.61\text{ ms}$** | **$2.08\times$ Nhanh hơn** | **$0.35\text{ ms}$** |
| **Cộng dồn Số học (5M ops)** | $388.5\text{ ms}$ | **$163.8\text{ ms}$** | **$2.37\times$ Nhanh hơn** | **$3.1\text{ ms}$** |
| **N-Queens Solver ($N=11$)** | $43.4\text{ ms}$ | **$29.5\text{ ms}$** | **$1.47\times$ Nhanh hơn** | **$1.9\text{ ms}$** |

### B. Đối Chuẩn Mô Phỏng Lượng Tử QFT ($N = 16 \dots 22$ Qubits)
*(Đo đạc qua Windows High-Resolution Performance Counters và Kernel API `psapi.h`)*:

- **$N = 16$ Qubits**: $65,536$ chiều | 624 cổng | **$39.89\text{ ms}$** | State RAM: $1.0\text{ MB}$ | Fidelity: **$1.0000000000$**
- **$N = 18$ Qubits**: $262,144$ chiều | 792 cổng | **$229.81\text{ ms}$** | State RAM: $4.0\text{ MB}$ | Fidelity: **$1.0000000000$**
- **$N = 20$ Qubits**: $1,048,576$ chiều | 980 cổng | **$1.37\text{ s}$** | State RAM: $16.0\text{ MB}$ | Fidelity: **$1.0000000000$**
- **$N = 22$ Qubits**: $4,194,304$ chiều | 1,188 cổng | **$9.11\text{ s}$** | State RAM: $64.0\text{ MB}$ | Fidelity: **$1.0000000000$**
- **Bảo toàn chuẩn hóa sóng**: Sai số tích lũy $\le 1.1 \times 10^{-16}$ (tiệm cận ngưỡng sai số máy phần cứng - Machine Epsilon).

---

## 🛡️ BỘ KIỂM ĐỊNH MẬT MÃ & BẤT BIẾN TOÁN HỌC

Hệ thống tuân thủ quy trình kiểm định toán học và niêm phong mật mã nghiêm ngặt nhất:
1. **2,135,241 / 2,135,241 Invariants Verified (100.000%)**: Kiểm tra vét cạn toàn bộ không gian số học tam phân, tính giao hoán, kết hợp và chuẩn hóa sóng lượng tử.
2. **Khóa Niêm Phong Mật Mã (Cryptographic Milestone Seals)** lưu trữ tại [`test_registry/gate5_milestones.json`](file:///d:/New%20PJ/Ternary/Compiler/test_registry/gate5_milestones.json):
   - **`CP0_BASELINE`**: `bd55c2734c8208fab22353d174bb353b9cdd634970a8e5de2faa9a02193f0096`
   - **`CP1_TREE_OPT`**: `e98870d1ccf3ed9a0672930c26664f022803f62d25030c4f75c3b50afb9a67df`
   - Toàn bộ 8 bài test chuẩn $H_1 \dots H_8$ (Sieve, Matmul, Fibonacci, Mandelbrot, Numeric Loop, Call Heavy, Alloc Heavy, Object Heavy) đạt **100% Zero Semantic Drift**.

---

## 🚀 HƯỚNG DẪN BẮT ĐẦU NHANH (QUICKSTART)

### 1. Biên dịch Toolchain từ mã nguồn
Yêu cầu: GCC hỗ trợ C++20 (MinGW-w64 trên Windows hoặc GCC/Clang trên Linux).
```powershell
cd Code
.\build_toolchain.bat
```

### 2. Chạy chương trình ứng dụng mẫu
```powershell
# Chạy Demo Ứng dụng tổng hợp
.\setunc.exe run ..\app_demo.stn

# Chạy Thí nghiệm Số học TAFPU Q(sqrt(3))
.\setunc.exe run ..\scientific_lab.stn

# Chạy Demo Mạch Lượng tử QVM
.\setunc.exe run ..\quantum_demo.stn

# Chạy Game Rắn Săn Mồi Tam Phân (Giao diện Đồ họa 2D)
.\setunc.exe run ..\snake_2d_gui.stn
```

### 3. Ví dụ Mã Nguồn Tersun
```setun
// Định nghĩa cấu trúc hạt trong không gian
struct Particle {
    let id: int;
    let charge: tryte; // Tam phân: -1 (âm), 0 (trung hòa), +1 (dương)
    let energy: taf3;  // Số thực đại số TAFPU: [alpha, beta, gamma]
}

fn calculate_state(p: Particle) -> string {
    // Rẽ nhánh tam phân 3 hướng trong 1 chu kỳ máy
    branch3 (p.charge) {
        negative => "Anion (Âm tính)",
        zero     => "Neutron (Trung hòa)",
        positive => "Cation (Dương tính)"
    }
}

fn main() {
    let p = Particle { id: 1, charge: 1, energy: [14, 25, 0] };
    println(f"Trạng thái hạt: {calculate_state(p)}");
}
```

---

## ⚖️ BẢN QUYỀN VÀ BẢO HỘ SỞ HỮU TRÍ TUỆ (LICENSE & IP PROTECTION)

Dự án được bảo hộ toàn diện theo giấy phép độc quyền:  
📄 [**TERSUN INTELLECTUAL PROPERTY & ACADEMIC RESEARCH LICENSE (TIPARL v1.0.3)**](file:///d:/New%20PJ/Ternary/Compiler/LICENSE.md)

- **Được phép**: Tự do sử dụng cho mục đích học tập, đào tạo, giảng dạy và nghiên cứu khoa học phi thương mại có trích dẫn nguồn.
- **Nghiêm cấm**: Nghiêm cấm mọi hành vi khai thác thương mại, bán lại phần mềm hoặc giáo trình, đóng gói dịch vụ đám mây sinh lời, hoặc đạo văn trích đoạt nội dung giáo trình dưới mọi hình thức khi chưa có sự chấp thuận bằng văn bản của tác giả.

*Bản quyền © 2024–2026 Nhóm Nghiên Cứu Kiến Trúc Điện Toán Tersun (Tersun Computing Systems Group). Bảo lưu mọi quyền.*
