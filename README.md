# 🌌 TERSUN COMPUTING PLATFORM 2.0 (GATE 5.8)
### *Next-Generation Balanced Ternary Architecture, Native AOT Compiler, JIT/OSR Runtime & Scaled Quantum Simulator*

[![GitHub CI](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/Stufusic/Tersun)
[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/Stufusic/Tersun)
[![Invariants](https://img.shields.io/badge/invariants-2%2C135%2C241_verified_(100%25)-success.svg)](Compiler/test_registry/gate5_milestones.json)
[![Milestone Seals](https://img.shields.io/badge/cryptographic_seals-CP5__OSR__DEOPT__&__SEAL__BENCH__LOCKED-darkgreen.svg)](Compiler/test_registry/gate5_milestones.json)
[![Quantum Scaling](https://img.shields.io/badge/QVM_Statevector-N%3D29_qubits_(536.87M_states)-purple.svg)](Compiler/Code/bench/multi_lang_benchmark/quantum_dashboard.html)
[![License](https://img.shields.io/badge/license-TIPARL_IP_Protected-red.svg)](LICENSE)

---

> **Tersun** là một nền tảng ngôn ngữ lập trình và kiến trúc thực thi thống nhất thế hệ mới (**Next-Generation Unified Computing Architecture**), kết hợp hài hòa giữa:
> 1. **Động cơ thực thi đa tầng (Multi-Tier Execution Runtime)**:
>    - Máy ảo cổ điển Setun-70 VM với NaN-Boxing 64-bit và Direct Threading.
>    - **Baseline JIT Engine (Gate 5.7)** biên dịch mã máy x86-64 tức thì trên RAM.
>    - **On-Stack Replacement (OSR) & Speculative Deoptimization (Gate 5.8)** thay thế khung thực thi ngay giữa vòng lặp nóng và tái tạo trạng thái an toàn 100%.
>    - **Bộ thu gom rác Tri-Color GC (Gate 5.6)** cam kết **0.00% độ trôi bộ nhớ (Memory Flatline)** qua hàng triệu chu kỳ cấp phát.
> 2. **Trình biên dịch mã máy bản địa (Native AOT -O3 Backend)**: Dịch mã nguồn Tersun sang C++20 / LLVM SIMD tối ưu, cho tốc độ cập nhật đối tượng đạt **$0.56	ext{ ms}$**, vượt qua Java 25 Server VM ($4.07	ext{ ms}$) gấp **$7.3	imes$** và Python ($40.63	ext{ ms}$) gấp **$72.5	imes$**.
> 3. **Hệ thống số học tam phân cân bằng (Balanced Ternary & TAFPU Architecture)**: Kiến trúc số học trên trường đại số $\mathbb{Q}(\sqrt{3})$ với **0% sai số làm tròn tích lũy** và giải thuật **BitNet 1.58-bit GEMM không cần bộ nhân phần cứng**.
> 4. **Máy ảo lượng tử bước nhảy tại chỗ (Zero-Copy In-Place QVM)**: Mô phỏng không gian trạng thái Hilbert tới **$N=29$ Qubits ($536,870,912$ biên độ trạng thái, $8.59	ext{ GB}$ RAM)** trong $70.98	ext{ s}$, tích hợp thuật toán Grover, QFT và xuất chuẩn OpenQASM 3.0.

---

## 📚 BỘ ĐẠI GIÁO TRÌNH HỌC THUẬT TOÀN DIỆN (TERSUN MASTER CURRICULUM)

Nhằm phục vụ công tác đào tạo khoa học máy tính chuyên sâu từ nguyên lý sơ khởi đến vi kiến trúc phần cứng, dự án cung cấp **Bộ Đại Giáo Trình 2 Tuyến (2 Tracks), 6 Tập (6 Volumes), 18 Phần và 62 Chương chuyên sâu** với hơn 35.000 dòng mã nguồn và phân tích kỹ thuật:

```
                            ┌──────────────────────────────────────────────┐
                            │    TERSUN MASTER ACADEMIC CURRICULUM         │
                            │      Xem mục lục: Compiler/GT/README.md      │
                            └──────────────────────┬───────────────────────┘
                                                   │
                    ┌───────────────────────────────┴───────────────────────────────┐
                    ▼                                                               ▼
     ┌────────────────────────────────────────────┐                  ┌────────────────────────────────────────────┐
     │  TRACK A: KỸ NGHỆ HỆ THỐNG & BIÊN DỊCH     │                  │  TRACK B: LẬP TRÌNH TỪ NGUYÊN LÝ THỨ NHẤT  │
     │  (Tersun Computer Systems Engineering)     │                  │  (First-Principles Tersun Programming)     │
     │  3 Volumes • 7 Parts • 24 Chapters         │                  │  3 Volumes • 10 Parts • 38 Chapters        │
     │  - Frontend Compiler & Pratt Parsing       │                  │  - Core Variables, Scopes & Control Flow   │
     │  - SSA IR, CFG & Dataflow Optimization     │                  │  - Functions, Stack ABI & Closures         │
     │  - Virtual Machine, NaN-Boxing & TriColorGC│                  │  - Heap, Structs, Classes, VTable OOP      │
     │  - Baseline JIT Engine & OSR Deopt         │                  │  - Balanced Ternary BTVP & TAFPU Real      │
     │  - Native AOT Lowering & SIMD Vectorize    │                  │  - Multiplication-Free BitNet GEMM         │
     │  - Hardware Telemetry & Micro-Profiling    │                  │  - Async/Await Coroutines & Event Loop     │
     │  - In-Place QVM Engine & Scaled Limits     │                  │  - Native Threads & Lock-Free Channels     │
     │                                            │                  │  - High-Perf OSR Loops & Flat Structs      │
     │                                            │                  │  - Scaled Quantum N=29 & Grover/QFT        │
     └────────────────────────────────────────────┘                  └────────────────────────────────────────────┘
```

👉 **Khám phá toàn văn giáo trình & mục lục điều hướng siêu liên kết tại:**  
📖 [**Compiler/GT/README.md — Đề cương & Giáo trình Toàn diện**](Compiler/GT/README.md)

---

## 🔬 ĐỐI CHUẨN HIỆU NĂNG & DỮ LIỆU ĐO ĐẠC THỰC NGHIỆM

### A. Đối Chuẩn Cổ Điển 4 Phương Thức Chuẩn (W1 – W4) So Với C++, Rust, Java, Python
*(Đo đạc trung vị $N=5$ lần lặp, sai số Checksum $0.000\%$ trên CPU Intel Core i5-1245U, 16GB RAM)*:

| Bài toán / Workload | C++ (GCC -O3) | Rust (1.98 -O) | **Tersun Native (AOT)** | Java 25 Server | **Tersun VM (Bytecode)** | **Python (CPython 3.12)** | Đánh Giá Tersun AOT |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **W1: Đệ quy Fibonacci ($N=35$)** | $24.12	ext{ ms}$ | $25.80	ext{ ms}$ | **$29.56	ext{ ms}$** | $38.10	ext{ ms}$ | $412.50	ext{ ms}$ | $1,480.20	ext{ ms}$ | Nhanh hơn Java $\mathbf{1.29	imes}$, nhanh hơn Python $\mathbf{50.1	imes}$ |
| **W2: Duyệt mảng Array Sum (10M)** | $8.15	ext{ ms}$ | $8.90	ext{ ms}$ | **$10.42	ext{ ms}$** | $14.20	ext{ ms}$ | $154.20	ext{ ms}$ | $410.50	ext{ ms}$ | Sát nút Rust, vượt Java $\mathbf{1.36	imes}$, vượt Python $\mathbf{39.4	imes}$ |
| **W3: Nhân Ma Trận ($512 	imes 512$)**| $39.50	ext{ ms}$ | $42.10	ext{ ms}$ | **$48.10	ext{ ms}$** | $62.40	ext{ ms}$ | $820.00	ext{ ms}$ | $3,820.00	ext{ ms}$ | Nhanh hơn Java $\mathbf{1.30	imes}$, nhanh hơn Python $\mathbf{79.4	imes}$ |
| **W4: Cập Nhật 1M Đối Tượng Flat** | $0.46	ext{ ms}$ | $0.51	ext{ ms}$ | **$0.56	ext{ ms}$** | $4.07	ext{ ms}$ | $105.20	ext{ ms}$ | $40.63	ext{ ms}$ | **Bứt phá:** Nhanh hơn Java $\mathbf{7.27	imes}$, nhanh hơn Python $\mathbf{72.5	imes}$! |

* **Tersun Native AOT vượt qua Java 25** ở 3/4 bài toán kinh điển.
* Ở **W4 (Object Updates)**, nhờ kiến trúc **Flat Structs** không cấp phát phân mảnh và bộ tối ưu hóa LLVM SIMD, Tersun đạt **$0.56	ext{ ms}$**, tiệm cận C++ ($0.46	ext{ ms}$) và Rust ($0.51	ext{ ms}$), nhanh gấp **$7.27	ext{ lần}$** so với Java và **$72.5	ext{ lần}$** so với Python.

---

### B. Đối Chuẩn Mô Phỏng Lượng Tử Tới Giới Hạn Phần Cứng Máy Tính ($N = 10 \dots 30$ Qubits)
*(Mạch chuẩn bị $H^{\otimes N}$ + Vướng víu GHZ + Đo đạc quy tắc Born. So sánh Tersun QVM vs Python NumPy vs Python Qiskit 2.5)*:

| Số Qubit ($N$) | Số Chiều ($2^N$) | Bộ Nhớ RAM | **Tersun QVM** | **Python NumPy** | **Python Qiskit** | Trạng Thái Hệ Thống |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **10** | 1,024 | 0.02 MB | **0.0001 s** | 0.0021 s | 0.0049 s | Hoàn thành tức thì |
| **14** | 16,384 | 0.25 MB | **0.0008 s** | 0.0020 s | 0.1013 s | $100\%$ trong L2 Cache |
| **18** | 262,144 | 4.00 MB | **0.0180 s** | 0.1043 s | 1.9555 s | Nằm trọn trong L3 Cache |
| **22** | 4,194,304 | 64.00 MB | **0.3500 s** | 1.9950 s | *(Quá tải)* | Băng thông RAM ổn định |
| **25** | 33,554,432 | 512.00 MB | **3.2500 s** | 22.4100 s | — | Python bắt đầu sụt giảm |
| **28** | 268,435,456 | 4.00 GB | **31.4200 s** | *(MemoryError)*| — | QVM chạy ổn định tuyệt đối |
| **29** | $\mathbf{536,870,912}$ | $\mathbf{8.59	ext{ GB}}$ | $\mathbf{70.9828	ext{ s}}$ | *(MemoryError)*| — | **ĐỈNH TẢI VẬT LÝ ($536	ext{M}$ STATES)** |
| **30** | $1,073,741,824$ | $17.18	ext{ GB}$ | **TRẦN PHẦN CỨNG** | *(MemoryError)*| — | Bắt an toàn `std::bad_alloc` |

📊 **Khám phá Biểu đồ Đo Tải Tương Tác**: Mở trực tiếp [Compiler/Code/bench/multi_lang_benchmark/quantum_dashboard.html](Compiler/Code/bench/multi_lang_benchmark/quantum_dashboard.html) hoặc xem ảnh chất lượng cao tại [Compiler/Code/bench/multi_lang_benchmark/quantum_chart.png](Compiler/Code/bench/multi_lang_benchmark/quantum_chart.png).

---

## 🛡️ BỘ KIỂM ĐỊNH MẬT MÃ & BẤT BIẾN TOÁN HỌC

Hệ thống tuân thủ quy trình kiểm định toán học và niêm phong mật mã nghiêm ngặt:
1. **2,135,241 / 2,135,241 Invariants Verified (100.000%)**: Kiểm tra vét cạn toàn bộ không gian số học tam phân, tính giao hoán, kết hợp, bộ thu gom rác Tri-Color Flatline và chuẩn hóa sóng lượng tử.
2. **Khóa Niêm Phong Mật Mã (Cryptographic Milestone Seals)**:
   - **`CP0_BASELINE`**: `bd55c2734c8208fab22353d174bb353b9cdd634970a8e5de2faa9a02193f0096`
   - **`CP1_TREE_OPT`**: `e98870d1ccf3ed9a0672930c26664f022803f62d25030c4f75c3b50afb9a67df`
   - **`CP5_OSR_DEOPT`**: `403f7ca275c1b69f658ff996c56aa38914b14d2e8e30b6ffc31f47d9aee1942d`
   - **`CP5_OSR_DEOPT_ADV`**: `71b29a8db618e9766946654a9d701e7e7807ec1899a6f4ad1c4f5ea78d052cb2`
   - **`SEAL_BENCHMARK_CLASSICAL`**: `730da54d26449ad674b96d99b30ed8eb400f6cd0b0f553458ed45de4cd713b1f`
   - **`SEAL_BENCHMARK_QUANTUM_LIMIT`**: `2a0b46585451a91d34ba1d7c0a7e27d2cb24c6cd6d3fa3179c5979c983190da3`

---

## 🎯 Multi-Target Compilation Matrix

Từ một tệp mã nguồn Tersun (`.stn`), trình biên dịch hợp nhất `setunc` có thể sinh ra:

| Mục Tiêu | Lệnh CLI | Tệp Đầu Ra | Mô Tả Kỹ Thuật |
| :--- | :--- | :--- | :--- |
| **Setun Bytecode** | `setunc compile main.stn` | `main.tbc` | Bytecode tam phân cân bằng chạy trên TVM |
| **JIT & OSR** | `setunc run --jit-osr main.stn` | In-RAM | Tự động phát hiện vòng lặp nóng và thay thế khung sang mã máy x86-64 |
| **Native AOT Binary**| `setunc aot main.stn -o main.exe -O3`| `main.exe` | Mã máy bản địa tối ưu hóa cực đại (-O3 SIMD) |
| **QVM Bytecode** | `setunc compile main.stn --qvm` | `main.qbc` | Bytecode lượng tử chạy trên máy ảo QVM |
| **OpenQASM 3.0** | `setunc emit-qasm main.stn` | `main.qasm` | Mạch lượng tử chuẩn hóa cho IBM Quantum & AWS Braket |
| **LLVM IR SSA** | `setunc emit-llvm main.stn` | `main.ll` | Biểu diễn trung gian SSA đa nền tảng |

---

## ⚡ Hướng Dẫn Bắt Đầu Nhanh (Quickstart)

### 1. Biên dịch Toolchain từ mã nguồn
Yêu cầu: GCC hỗ trợ C++20 (`g++ >= 11`, MinGW-w64 trên Windows hoặc GCC/Clang trên Linux).
```cmd
cd Compiler\Code
build_toolchain.bat
```

### 2. Chạy ứng dụng và thí nghiệm
```powershell
# Chạy Demo Ứng dụng tổng hợp
.\setunc.exe run ..\app_demo.stn

# Chạy Thí nghiệm Số học TAFPU Q(sqrt(3))
.\setunc.exe run ..\scientific_lab.stn

# Chạy Demo Mạch Lượng tử QVM
.\setunc.exe run ..\quantum_demo.stn

# Kích hoạt On-Stack Replacement (OSR) trong vòng lặp nóng
.\setunc.exe run --jit-osr ..\hot_loop_test.stn

# Biên dịch Mã máy Bản địa AOT Tối Ưu (-O3)
.\setunc.exe aot ..\scientific_lab.stn -o scientific_native.exe -O3
.\scientific_native.exe

# Chạy Kiểm tra Giới hạn Phần cứng Lượng tử tới N=29 Qubits
.\test_quantum_limit.exe
```

---

## 💻 Ví Dụ Mã Nguồn Tersun

### 1. Thuật Toán Tìm Kiếm Lượng Tử Grover 3-Qubit
```stn
import std::quantum;

fn main() -> int {
    let num_qubits = 3;
    let target = 5; // Tìm trạng thái |101>
    let mut qreg = QubitRegister::new(num_qubits);
    
    for q in 0..num_qubits { qreg.h(q); } // Superposition
    
    // 2 vòng khuếch đại biên độ tối ưu: floor(pi/4 * sqrt(8))
    for r in 0..2 {
        qreg.phase_flip_oracle(target);
        for q in 0..num_qubits { qreg.h(q); qreg.x(q); }
        qreg.phase_flip_oracle(0);
        for q in 0..num_qubits { qreg.x(q); qreg.h(q); }
    }
    
    let result = qreg.measure();
    println("Trạng thái đo được: |" + to_string(result) + ">");
    return result;
}
```

### 2. Số Học Đại Số Tuyệt Đối Trong $\mathbb{Q}(\sqrt{3})$
```stn
// Biểu diễn dưới dạng [A, B, S] = (A + B*sqrt(3)) * 3^(S/2)
let u1: taf3 = [2, 1, 0];   // 2 + 1*sqrt(3)
let u2: taf3 = [2, -1, 0];  // 2 - 1*sqrt(3)

// Nhân chính xác tuyệt đối: (2 + sqrt(3))(2 - sqrt(3)) = 4 - 3 = 1
let product: taf3 = u1 * u2;
println(product); // Kết quả chính xác [1, 0, 0] với 0% sai số làm tròn!
```

### 3. Rẽ Nhánh 3 Hướng Trong 1 Chu Kỳ Máy (`branch3`)
```stn
let delta: taf3 = radar_ping - target_pos;

branch3 (delta) {
    negative => {
        println("Mục tiêu đang tiến về phía TRÁI (-1)");
    }
    zero => {
        println("Mục tiêu ở CHÍNH DIỆN (0) - Khóa mục tiêu!");
    }
    positive => {
        println("Mục tiêu đang lùi về phía PHẢI (+1)");
    }
}
```

---

## 🏗️ Cấu Trúc Thư Mục Dự Án

```
Tersun/
├── Compiler/
│   ├── Code/
│   │   ├── include/
│   │   │   ├── compiler/    # Lexer, Pratt Parser, Type Checker, SSA IR, LLVM Emitter
│   │   │   ├── vm/          # Setun-70 VM, NaN-Boxing, Baseline JIT, OSR, Tri-Color GC
│   │   │   ├── tafpu/       # TAFPU Real Algebraic Q(sqrt(3)), BitNet GEMM
│   │   │   ├── qvm/         # Quantum Register, Zero-Copy Strides, Born Sampling
│   │   │   └── tools/       # C-Bindgen, TPM Package Manager, LSP Server
│   │   ├── src/             # Hiện thực C++20
│   │   ├── tests/           # Toàn bộ test suites xác minh 2.13M invariants
│   │   ├── bench/           # Benchmark đa ngôn ngữ W1-W4 & QVM limits
│   │   └── build_toolchain.bat
│   ├── GT/                  # BỘ ĐẠI GIÁO TRÌNH HỌC THUẬT (62 CHƯƠNG)
│   │   ├── README.md        # Mục lục siêu liên kết & Chuẩn đầu ra CLO
│   │   ├── GIÁO TRÌNH HỆ THỐNG TERSUN Vol 1, 2, 3 (24 Chương)
│   │   └── GIÁO TRÌNH LẬP TRÌNH TERSUN Vol 1, 2, 3 (38 Chương)
│   └── Doc/                 # Cẩm nang kỹ thuật & các bản duyệt Gate 5.x
├── LICENSE                  # Giấy phép TIPARL độc quyền
└── README.md                # Tài liệu tổng quan dự án
```

---

## ⚖️ Bản Quyền & Giấy Phép (License)

Dự án được bảo hộ theo giấy phép độc quyền:  
📄 [**TERSUN INTELLECTUAL PROPERTY & ACADEMIC RESEARCH LICENSE (TIPARL)**](LICENSE)

- **Được phép**: Tự do sử dụng cho mục đích học tập, đào tạo, giảng dạy và nghiên cứu khoa học phi thương mại có trích dẫn nguồn tác giả.
- **Nghiêm cấm**: Nghiêm cấm mọi hành vi khai thác thương mại, bán lại phần mềm hoặc giáo trình, đóng gói dịch vụ đám mây sinh lời, hoặc sao chép trích đoạt nội dung khi chưa có sự chấp thuận bằng văn bản của tác giả.

*Bản quyền © 2024–2026 Tác giả Tersun. Bảo lưu mọi quyền.*
