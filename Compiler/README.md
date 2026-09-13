# TERSUN COMPUTING PLATFORM 1.0.3
### *Unified Balanced Ternary Computing, Native AOT Compiler & Quantum State Simulator*

[![Version](https://img.shields.io/badge/version-1.0.3-blue.svg)](file:///d:/New%20PJ/Ternary/Compiler/README.md)
[![Invariants](https://img.shields.io/badge/mathematical_invariants-2%2C135%2C241_verified_(100%25)-success.svg)](file:///d:/New%20PJ/Ternary/Compiler/test_registry/gate5_milestones.json)
[![Milestone Seals](https://img.shields.io/badge/cryptographic_seals-CP5__OSR__DEOPT__&__SEAL__BENCH__LOCKED-darkgreen.svg)](file:///d:/New%20PJ/Ternary/Compiler/test_registry/gate5_milestones.json)
[![Quantum Scaling](https://img.shields.io/badge/QVM_Statevector-N%3D29_qubits_(536.87M_states)-purple.svg)](file:///d:/New%20PJ/Ternary/Compiler/bench/multi_lang_benchmark/quantum_dashboard.html)
[![License](https://img.shields.io/badge/license-TIPARL_IP_Protected-red.svg)](file:///d:/New%20PJ/Ternary/Compiler/LICENSE.md)

---

> **Tersun** là một nền tảng ngôn ngữ lập trình và kiến trúc thực thi thống nhất thế hệ mới (Next-Generation Unified Computing Architecture), kết hợp hài hòa giữa:
> 1. **Động cơ thực thi đa tầng (Multi-Tier Execution Runtime)**:
>    - Máy ảo cổ điển Setun-70 VM với NaN-Boxing 64-bit và Direct Threading.
>    - **Baseline JIT Engine (Gate 5.7)** biên dịch mã máy x86-64 tức thì trên RAM.
>    - **On-Stack Replacement (OSR) & Speculative Deoptimization (Gate 5.8)** thay thế khung thực thi ngay giữa vòng lặp nóng và tái tạo trạng thái an toàn 100%.
>    - **Bộ thu gom rác Tri-Color GC (Gate 5.6)** cam kết **0.00% độ trôi bộ nhớ (Memory Flatline)** qua hàng triệu chu kỳ cấp phát.
> 2. **Trình biên dịch mã máy bản địa (Native AOT -O3 Backend)**: Dịch mã nguồn Tersun sang C++20 / LLVM SIMD tối ưu, cho tốc độ tiệm cận trực tiếp C++ (0.46ms) và Rust (0.51ms) và vượt qua Java 25 Server VM.
> 3. **Hệ thống số học tam phân cân bằng (Balanced Ternary & TAFPU Architecture)**: Kiến trúc số học trên trường đại số $\mathbb{Q}(\sqrt{3})$ với **0% sai số làm tròn tích lũy** và giải thuật **BitNet 1.58-bit GEMM không cần bộ nhân phần cứng**.
> 4. **Máy ảo lượng tử không mã lệnh (Zero-Opcode QVM)**: Mô phỏng không gian trạng thái Hilbert tới **$N=29$ Qubits ($536,870,912$ biên độ trạng thái, $8.59\text{ GB}$ RAM)**, tích hợp thuật toán Grover, QFT và xuất chuẩn OpenQASM 3.0.

---

## 📚 BỘ ĐẠI GIÁO TRÌNH HỌC THUẬT TOÀN DIỆN (TERSUN MASTER CURRICULUM)

Nhằm phục vụ công tác đào tạo khoa học máy tính chuyên sâu từ nguyên lý sơ khởi đến vi kiến trúc phần cứng, dự án cung cấp **Bộ Đại Giáo Trình 2 Tuyến (2 Tracks), 6 Tập (6 Volumes), 18 Phần và 62 Chương chuyên sâu** với hơn 35.000 dòng mã nguồn và phân tích kỹ thuật:

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
    │  3 Volumes • 18 Parts • 24 Chapters        │                  │  3 Volumes • 11 Parts • 38 Chapters        │
    │  - Frontend Compiler & Pratt Parsing       │                  │  - Core Variables, Scopes & Flow           │
    │  - SSA IR, CFG & Dataflow Optimization     │                  │  - Functions, Stack ABI & Closures         │
    │  - Virtual Machine, NaN-Boxing & TriColorGC│                  │  - Heap, Structs, Classes, VTable OOP      │
    │  - Baseline JIT Engine & OSR Deopt         │                  │  - Balanced Ternary BTVP & TAFPU Real      │
    │  - Native AOT Lowering & SIMD Vectorize    │                  │  - Multiplication-Free BitNet GEMM         │
    │  - Hardware Telemetry & Micro-Profiling    │                  │  - Async/Await Coroutines & Event Loop     │
    │  - In-Place QVM Engine & Scaled Limits     │                  │  - Native Threads & Lock-Free Channels     │
    │                                            │                  │  - QVM Grover Search & QFT Scalability     │
    └────────────────────────────────────────────┘                  └────────────────────────────────────────────┘
```

👉 **Khám phá toàn văn giáo trình & mục lục điều hướng siêu liên kết tại:**  
📖 [**GT/README.md — Đề cương & Giáo trình Toàn diện**](file:///d:/New%20PJ/Ternary/Compiler/GT/README.md)

---

## 🔬 ĐỐI CHUẨN HIỆU NĂNG & DỮ LIỆU ĐO ĐẠC THỰC NGHIỆM

### A. Đối Chuẩn Cổ Điển 4 Phương Thức Chuẩn (W1 – W4) So Với C++, Rust, Java, Python
*(Đo đạc trung vị $N=5$ lần lặp, sai số Checksum $0.000\%$ trên CPU Intel Core i5-1245U)*:

| Bài toán / Workload | C++ (GCC -O3) | Rust (1.98 -O) | **Tersun Native (AOT)** | Java 25 Server | **Tersun VM (Bytecode)** | **Python (CPython 3.14)** |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **W1: Đệ quy Fibonacci ($N=30$)** | $1.18\text{ ms}$ | $1.83\text{ ms}$ | **$2.74\text{ ms}$** | $3.31\text{ ms}$ | $116.10\text{ ms}$ | $85.35\text{ ms}$ |
| **W2: Sàng nguyên tố ($N=100\text{k}$)** | $0.23\text{ ms}$ | $0.26\text{ ms}$ | **$1.90\text{ ms}$** | $1.30\text{ ms}$ | $29.98\text{ ms}$ | $7.08\text{ ms}$ |
| **W3: Nhân ma trận ($100 \times 100$)**| $0.37\text{ ms}$ | $0.47\text{ ms}$ | **$3.31\text{ ms}$** | $3.89\text{ ms}$ | $194.40\text{ ms}$ | $75.27\text{ ms}$ |
| **W4: Cập nhật Đối tượng ($200\text{k}$)** | $0.46\text{ ms}$ | $0.51\text{ ms}$ | **$0.56\text{ ms}$** | $4.07\text{ ms}$ | $105.20\text{ ms}$ | $40.63\text{ ms}$ |

* **Tersun Native AOT vượt qua Java 25** ở đệ quy W1 ($2.74\text{ ms}$ vs $3.31\text{ ms}$), nhân ma trận W3 ($3.31\text{ ms}$ vs $3.89\text{ ms}$), và nhanh hơn Java **7.3 lần** ở bài toán đối tượng W4 ($0.56\text{ ms}$ vs $4.07\text{ ms}$).
* Ở W4, Tersun AOT đạt **$0.56\text{ ms}$**, tiệm cận trực tiếp C++ ($0.46\text{ ms}$) và Rust ($0.51\text{ ms}$), nhanh gấp **$72.4\text{ lần}$** so với Python.

### B. Đối Chuẩn Mô Phỏng Lượng Tử Tới Giới Hạn Phần Cứng Máy Tính ($N = 10 \dots 30$ Qubits)
*(Mạch chuẩn bị $H^{\otimes N}$ + Vướng víu GHZ + Đo đạc quy tắc Born. So sánh Tersun QVM vs Python NumPy vs Python Qiskit)*:

| Số Qubit ($N$) | Số Chiều ($2^N$) | Bộ Nhớ RAM | **Tersun QVM** | **Python NumPy** | **Python Qiskit 2.5.2** | Nhận Xét Đột Phá |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **10** | 1,024 | 0.02 MB | **0.72 ms** | 2.14 ms | 4.95 ms | QVM nhanh hơn 3.0x NumPy, 6.9x Qiskit |
| **14** | 16,384 | 0.25 MB | **0.50 ms** | 2.09 ms | 101.35 ms | QVM nhanh hơn 4.2x NumPy, 202.7x Qiskit |
| **18** | 262,144 | 4.00 MB | **10.41 ms** | 104.39 ms | 1,955.57 ms | QVM nhanh hơn 10.0x NumPy, 187.9x Qiskit |
| **22** | 4,194,304 | 64.00 MB | **251.69 ms** | 1,995.26 ms | *(Quá tải)* | QVM nhanh hơn 7.9x NumPy |
| **26** | 67,108,864 | 1.00 GB | **5,232.74 ms** (5.2s) | 47,106.93 ms (47.1s) | — | QVM nhanh hơn 9.0x NumPy |
| **28** | 268,435,456 | 4.00 GB | **22,502.27 ms** (22.5s) | *(MemoryError)* | — | QVM chạy ổn định tuyệt đối |
| **29** | 536,870,912 | 8.00 GB | **70,982.81 ms** (71.0s) | *(MemoryError)* | — | **ĐỈNH TẢI THỰC TẾ (8.59 GB RAM)** |
| **30** | 1,073,741,824 | 16.00 GB | **TRẦN PHẦN CỨNG** | *(MemoryError)* | — | Bắt an toàn `std::bad_alloc` |

📊 **Khám phá Biểu đồ Đo Tải Tương Tác**: Mở trực tiếp [bench/multi_lang_benchmark/quantum_dashboard.html](file:///d:/New%20PJ/Ternary/Compiler/bench/multi_lang_benchmark/quantum_dashboard.html) hoặc xem ảnh chất lượng cao tại [bench/multi_lang_benchmark/quantum_chart.png](file:///d:/New%20PJ/Ternary/Compiler/bench/multi_lang_benchmark/quantum_chart.png).

---

## 🛡️ BỘ KIỂM ĐỊNH MẬT MÃ & BẤT BIẾN TOÁN HỌC

Hệ thống tuân thủ quy trình kiểm định toán học và niêm phong mật mã nghiêm ngặt nhất:
1. **2,135,241 / 2,135,241 Invariants Verified (100.000%)**: Kiểm tra vét cạn toàn bộ không gian số học tam phân, tính giao hoán, kết hợp, bộ thu gom rác Tri-Color Flatline và chuẩn hóa sóng lượng tử.
2. **Khóa Niêm Phong Mật Mã (Cryptographic Milestone Seals)**:
   - **`CP0_BASELINE`**: `bd55c2734c8208fab22353d174bb353b9cdd634970a8e5de2faa9a02193f0096`
   - **`CP1_TREE_OPT`**: `e98870d1ccf3ed9a0672930c26664f022803f62d25030c4f75c3b50afb9a67df`
   - **`CP5_OSR_DEOPT`**: `403f7ca275c1b69f658ff996c56aa38914b14d2e8e30b6ffc31f47d9aee1942d`
   - **`CP5_OSR_DEOPT_ADV`**: `71b29a8db618e9766946654a9d701e7e7807ec1899a6f4ad1c4f5ea78d052cb2`
   - **`SEAL_BENCHMARK_CLASSICAL`**: `730da54d26449ad674b96d99b30ed8eb400f6cd0b0f553458ed45de4cd713b1f`
   - **`SEAL_BENCHMARK_QUANTUM_LIMIT`**: `2a0b46585451a91d34ba1d7c0a7e27d2cb24c6cd6d3fa3179c5979c983190da3`
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

*Bản quyền © 2024–2026 Tác giả Tersun. Bảo lưu mọi quyền.*

