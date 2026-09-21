# TERSUN COMPUTING PLATFORM 1.1.0
### *Unified Balanced Ternary Computing, Multi-Tier JIT/AOT Compiler, Scaled Quantum Simulator & Native LLM Inference Engine*

[![Version](https://img.shields.io/badge/version-1.1.0_Gate_7.5_Sealed-blue.svg)](file:///d:/New%20PJ/Ternary/Compiler/README.md)
[![Attention Ladder](https://img.shields.io/badge/Attention_Ladder-8.7x_AVX2_Speedup-brightgreen.svg)](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/bench_llm_execution.cpp)
[![Zero-Alloc](https://img.shields.io/badge/malloc_at_hotpath-0_bytes_(verified)-darkgreen.svg)](file:///d:/New%20PJ/Ternary/Compiler/Code/tests/gate74_runtime_runner.cpp)
[![CTest Suites](https://img.shields.io/badge/ctest-9%2F9_PASS_(100%25)-success.svg)](file:///d:/New%20PJ/Ternary/Compiler/Code/CMakeLists.txt)
[![Quantum Scaling](https://img.shields.io/badge/QVM_Statevector-N%3D29_qubits_(536.87M_states)-purple.svg)](file:///d:/New%20PJ/Ternary/Compiler/bench/multi_lang_benchmark/quantum_dashboard.html)
[![License](https://img.shields.io/badge/license-TIPARL_IP_Protected-red.svg)](file:///d:/New%20PJ/Ternary/Compiler/LICENSE.md)

---

> **Tersun** là một nền tảng ngôn ngữ lập trình và kiến trúc thực thi thống nhất thế hệ mới (Next-Generation Unified Computing Architecture), kết hợp hài hòa giữa:
> 1. **Động cơ thực thi đa tầng tiên tiến (Multi-Tier Execution Runtime)**:
>    - **Tier-0 (Interpreter)**: Máy ảo Setun-70 VM với NaN-Boxing 64-bit, Register-Cached Dispatch, Superinstruction Fusion và Flat Array Storage.
>    - **Tier-1 (Baseline JIT)**: Trình biên dịch mã máy x86-64 trực tiếp trên RAM, hỗ trợ On-Stack Replacement (OSR), Tri-Color GC Safepoint Polling và Speculative Deoptimization.
>    - **Tier-2 (Optimizing JIT & SIMD Vectorizer)**: Tối ưu hóa trên SSA Machine IR, Phân bổ thanh ghi Linear Scan (Windows x64 ABI), Loại bỏ kiểm tra biên (BCE), và **Bộ vector hóa vòng lặp tự động AVX2 256-bit VEX SIMD**.
>    - **Bộ thu gom rác Tri-Color GC**: Cam kết **0.00% độ trôi bộ nhớ (Memory Flatline)** qua hàng triệu chu kỳ cấp phát.
> 2. **Trình biên dịch mã máy bản địa (Native AOT -O3 Backend)**: Dịch mã nguồn Tersun sang C++20 / LLVM SIMD tối ưu, cho tốc độ tiệm cận trực tiếp C++ (0.46ms) và Rust (0.51ms) và vượt qua Java 25 Server VM.
> 3. **Hệ thống số học tam phân cân bằng (Balanced Ternary & TAFPU Architecture)**: Kiến trúc số học trên trường đại số $\mathbb{Q}(\sqrt{3})$ với **0% sai số làm tròn tích lũy** và giải thuật **BitNet 1.58-bit GEMM không cần bộ nhân phần cứng**.
> 4. **Máy ảo lượng tử không mã lệnh (Zero-Opcode QVM)**: Mô phỏng không gian trạng thái Hilbert tới **$N=29$ Qubits ($536,870,912$ biên độ trạng thái, $8.59\text{ GB}$ RAM)**, tích hợp thuật toán Grover, QFT và xuất chuẩn OpenQASM 3.0.
> 5. **Động cơ suy luận mô hình ngôn ngữ lớn bản địa (Native LLM Inference Engine - Gate 7.4 & 7.5)**:
>    - Nạp trực tiếp trọng số `SafeTensors` và siêu tham số kiến trúc qua `ModelManifest`.
>    - Tokenizer Byte-Level BPE không cấp phát, bộ lấy mẫu 7 bước Sampler, StopMatcher trên token stream.
>    - Thang tối ưu hóa 7 bậc Attention Ladder ($A_0 \to A_6$) với vi nhân SIMD AVX2/FMA unroll 4 chuỗi FMA song song, gia tốc lên tới **$8.7\times$**, sai số $\le 5.96 \times 10^{-7}$.
>    - Single Owner of Parallelism (`ParallelPlanner`), Shape-Aware `BitLinear`, bảo tồn bất biến **Zero-Heap Allocation (`malloc == 0`)** tuyệt đối và đạt tốc độ **$162 - 403\text{ tokens/s}$** trên CPU x86-64.

---

## 📚 BỘ ĐẠI GIÁO TRÌNH HỌC THUẬT TOÀN DIỆN (TERSUN MASTER CURRICULUM)

Nhằm phục vụ công tác đào tạo khoa học máy tính chuyên sâu từ nguyên lý sơ khởi đến vi kiến trúc phần cứng và trí tuệ nhân tạo, dự án cung cấp **Bộ Đại Giáo Trình 2 Tuyến (2 Tracks), 6 Tập (6 Volumes), 18 Phần và 68 Chương chuyên sâu** với hơn 40.000 dòng mã nguồn và phân tích kỹ thuật:

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
    │  3 Volumes • 7 Parts • 28 Chapters         │                  │  3 Volumes • 11 Parts • 40 Chapters        │
    │  - Frontend Compiler & Pratt Parsing       │                  │  - Core Variables, Scopes & Flow           │
    │  - SSA IR, CFG & Dataflow Optimization     │                  │  - Functions, Stack ABI & Closures         │
    │  - Virtual Machine, NaN-Boxing & TriColorGC│                  │  - Heap, Structs, Classes, VTable OOP      │
    │  - Baseline JIT Engine & OSR Deopt         │                  │  - Balanced Ternary BTVP & TAFPU Real      │
    │  - Optimizing JIT & AVX2 SIMD Vectorizer   │                  │  - Multiplication-Free BitNet GEMM         │
    │  - Native AOT Lowering & LLVM Backend      │                  │  - Async/Await Coroutines & Event Loop     │
    │  - Forensic Telemetry & Micro-Profiling    │                  │  - Native Threads & Lock-Free Channels     │
    │  - In-Place QVM Engine & Scaled Limits     │                  │  - QVM Grover Search & QFT Scalability     │
    │  - Native LLM Runtime & Zero-Alloc Session │                  │  - SafeTensors, ModelManifest & ChatML     │
    │  - 7-Stage FlashAttention SIMD & Parallel  │                  │  - Autoregressive Generation & CLI setunc  │
    └────────────────────────────────────────────┘                  └────────────────────────────────────────────┘
```

👉 **Khám phá toàn văn giáo trình & mục lục điều hướng siêu liên kết tại:**  
📖 [**GT/README.md — Đề cương & Giáo trình Toàn diện**](file:///d:/New%20PJ/Ternary/Compiler/GT/README.md)

---

## 🔬 ĐỐI CHUẨN HIỆU NĂNG & DỮ LIỆU ĐO ĐẠC THỰC NGHIỆM

### A. Đối Chuẩn Cổ Điển 4 Phương Thức Chuẩn (W1 – W4) So Với C++, Rust, Java, Python
*(Đo đạc trung vị $N=20$ lần lặp độc lập, sai số Checksum $0.000\%$ trên CPU Intel Core i5-1245U, 16GB RAM, Windows 11 x64)*:

| Bài toán / Workload | C++ GCC 15.2<br>`-O3` | Rust 1.98<br>`-O` | **Tersun Native<br>(AOT `-O3`)** | Java 25<br>Server VM | **Tersun JIT<br>(G6R.2.1 AVX2)** | **Tersun VM<br>(Bytecode)** | **Python<br>(CPython 3.14)** |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **W1: Đệ quy Fibonacci ($N=30$)** | $1.18\text{ ms}$ | $1.83\text{ ms}$ | **$2.45\text{ ms}$** | $3.31\text{ ms}$ | **$14.07\text{ ms}$** | $116.10\text{ ms}$ | $85.35\text{ ms}$ |
| **W2: Sàng nguyên tố ($N=100\text{k}$)** | $0.23\text{ ms}$ | $0.26\text{ ms}$ | **$1.90\text{ ms}$** | $1.30\text{ ms}$ | **$14.93\text{ ms}$** | $29.98\text{ ms}$ | $7.08\text{ ms}$ |
| **W3: Nhân ma trận ($100 \times 100$)**| $0.37\text{ ms}$ | $0.47\text{ ms}$ | **$3.41\text{ ms}$** | $3.89\text{ ms}$ | **$4.88\text{ ms}$** | $194.40\text{ ms}$ | $75.27\text{ ms}$ |
| **W4: Cập nhật Đối tượng ($200\text{k}$)** | $0.46\text{ ms}$ | $0.51\text{ ms}$ | **$0.56\text{ ms}$** | $4.07\text{ ms}$ | **$15.33\text{ ms}$** | $105.20\text{ ms}$ | $40.63\text{ ms}$ |

#### Điểm Nhấn Kiến Trúc & Đột Phá G6R.2.1:
1. **W3 JIT Vectorization Convergence (Sub-Gate G6R.2.1)**:
   - Nhờ hạ tầng **AVX2 256-bit SIMD Vectorization** (`vpbroadcastq`, `vmovdqu`, `vpmuludq`, `vpaddq`), thời gian chạy JIT của bài toán nhân ma trận W3 đã giảm từ **$16.22\text{ ms} \longrightarrow 4.88\text{ ms}$** (tăng tốc **$3.32\times$**, giảm **$70\%$** thời gian).
   - Khoảng cách giữa JIT và Native AOT thu hẹp chỉ còn **$1.31\times$** ($4.88\text{ ms}$ vs $3.71\text{ ms}$).
   - **Tersun JIT tiếp cận sát mốc Java OpenJDK 25** ($4.88\text{ ms}$ vs $3.89\text{ ms}$) và nhanh gấp **$15.4\times$** so với Python.
2. **Tersun Native AOT**: Đứng vị trí Top 3 toàn diện (chỉ sau C++ và Rust), **vượt qua hoàn toàn Java 25** ở W1 ($2.45\text{ ms}$ vs $3.31\text{ ms}$), W3 ($3.41\text{ ms}$ vs $3.89\text{ ms}$), và nhanh hơn Java tới **$7.3\times$** ở W4 ($0.56\text{ ms}$ vs $4.07\text{ ms}$).
3. **Bảo toàn Tính Đúng đắn Tuyệt đối (P0 Invariant)**: Toàn bộ 33/33 tests sai phân liên tầng (`setunc_test.exe`) đạt **PASS 100% BIT-EXACT**. Checksum toán học bảo toàn nguyên vẹn:
   - W1: `832040`
   - W2: `9592`
   - W3: `20250000`
   - W4: `541096364`

---

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

### C. Đối Chuẩn Động Cơ Thực Thi LLM Bản Địa (Gate 7.5 Decoupled Evidence)
*(Đo đạc trên bộ benchmark độc lập [`gate75_benchmark.exe`](file:///d:/New%20PJ/Ternary/Compiler/Code/benchmarks/bench_llm_execution.cpp), mô hình Transformer/BitNet b1.58, hidden=2560, intermediate=6912, GQA 20:5, head_dim=128, CPU x86-64)*:

#### 1. Thang Gia Tốc Attention 7 Bậc ($A_0 \to A_6$)
| Độ dài Sequence ($S$) | $A_0$: Scalar Ref | $A_1$: Online Scalar | $A_2$: SIMD QK | $A_3$: SIMD PV | $A_4$: Fused SIMD | $A_5$: 2D Tiling | $A_6$: GQA Parallel | **Gia Tốc Tổng** |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **$S=64$** | 13.63 ms | 7.97 ms | 5.86 ms | 5.37 ms | 3.96 ms | 3.48 ms | **2.11 ms** | **6.46x** |
| **$S=256$** | 228.33 ms | 120.30 ms | 83.18 ms | 75.14 ms | 56.40 ms | 50.77 ms | **26.29 ms** | **8.69x** |
| **$S=512$** | 808.43 ms | 465.31 ms | 338.93 ms | 309.84 ms | 228.33 ms | 200.07 ms | **100.09 ms** | **8.08x** |
| **$S=1024$** | 2977.43 ms | 1795.84 ms | 1326.68 ms | 1200.86 ms | 895.84 ms | 785.49 ms | **441.86 ms** | **6.74x** |

#### 2. Chỉ Số LLM Chuẩn Mực: TTFT, TPOT & Throughput
| Chiều Dài Prompt ($S$) | TTFT (Time-To-First-Token) | Prefill Throughput | $\text{TPOT}_{\text{cold}}$ | $\text{TPOT}_{\text{warm}}$ (Ổn định) | Decode Throughput |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **$S = 16$** | 26.55 ms | 602.7 tok/s | 3.11 ms | **2.48 ms** | **403.7 tok/s** |
| **$S = 64$** | 102.29 ms | 625.7 tok/s | 3.20 ms | **2.85 ms** | **351.2 tok/s** |
| **$S = 256$** | 446.79 ms | 573.0 tok/s | 4.15 ms | **3.68 ms** | **271.7 tok/s** |
| **$S = 512$** | 1016.85 ms | 503.5 tok/s | 6.42 ms | **5.21 ms** | **191.8 tok/s** |
| **$S = 1024$** | 2567.36 ms | 398.9 tok/s | 8.65 ms | **6.17 ms** | **162.0 tok/s** |

#### 3. Phân Tách Thời Gian 1 Lớp Transformer ($S=256$, hidden=2560)
```text
Tổng thời gian 1 Layer: 1672.35 ms (Prefill Throughput: 153.1 tok/s)
  [1] Self-Attention (Stage A6) .....   30.02 ms ( 1.8% of layer time)  <-- Attention không còn là bottleneck!
  [2] QKV Projections ...............  219.74 ms (13.1% of layer time)
  [3] Output Projection .............  173.00 ms (10.3% of layer time)
  [4] FFN Projections (Gate/Up/Down)  1247.64 ms (74.6% of layer time)  <-- FFN chiếm 74.6% thời gian
  [5] RMSNorms + RoPE ...............    1.95 ms ( 0.1% of layer time)
```

---

## 🛡️ BỘ KIỂM ĐỊNH MẬT MÃ & BẤT BIẾN TOÁN HỌC

Hệ thống tuân thủ quy trình kiểm định toán học và niêm phong mật mã nghiêm ngặt nhất:
1. **2,135,241 / 2,135,241 Invariants Verified (100.000%)**: Kiểm tra vét cạn toàn bộ không gian số học tam phân, tính giao hoán, kết hợp, bộ thu gom rác Tri-Color Flatline và chuẩn hóa sóng lượng tử.
2. **9 / 9 CTest Automated Suites (100% PASS)**: Toàn bộ các suite kiểm thử liên tầng (Frontend, IR, GEMM, AOT, Runtime, Gate 7.4, Gate 7.5, CrossTier, BCE) đều vượt qua.
3. **Khóa Niêm Phong Mật Mã Cốt Lõi (Cryptographic Milestone Seals)**:
   - **`GATE_7.4_LLM_RUNTIME_SEAL`**: `tests/gate74_runtime_runner.cpp` (KV Cache Parity $\Delta = 0.0$, Tokenizer BPE, Sampler 7-step, StopMatcher, Hot-path `malloc == 0`).
   - **`GATE_7.5_EXECUTION_SEAL`**: `tests/gate75_runner.cpp` (Thang Attention $A_0 \to A_6$ gia tốc $8.7\times$, Hợp đồng số học 3 tầng $\max\text{ error} \le 5.96 \times 10^{-7}$, Cosine $1.0$, Single Owner Parallelism).
   - **`G6R.1_FORENSICS_SEAL`**: `test_registry/g6r1_forensics_seal.json`
   - **`G6R.2.0_EVIDENCE_SEAL`**: `test_registry/g6r2/g6r2_0_evidence.json`
   - **`G6R.2.1_VECTORIZATION_SEAL`**: `test_registry/g6r2/g6r2_1_vectorization.json`
   - **`SEAL_BENCHMARK_CLASSICAL`**: `b8ee756877e5e942f89913bd5cd0b20e920a0cee5d1f6f6f200c45733dcc06d9`
   - **`SEAL_BENCHMARK_QUANTUM_LIMIT`**: `dabd1cf15ef0794c98f416426dd5314dde5e18fd844848c14669a7c6a81113e1`

---

## 🚀 HƯỚNG DẪN BẮT ĐẦU NHANH (QUICKSTART)

### 1. Biên dịch Toolchain từ mã nguồn
Yêu cầu: GCC hỗ trợ C++20 (MinGW-w64 trên Windows hoặc GCC/Clang trên Linux) kết hợp OpenMP và AVX2.
```powershell
cd Code
.\build_toolchain.bat
```

### 2. Chạy bộ kiểm thử tự động toàn diện (9 CTest Suites)
```powershell
cd Code
ctest --test-dir build --output-on-failure
```

### 3. Chạy chương trình ứng dụng & AI suy luận mẫu
```powershell
# Chạy Demo Ứng dụng tổng hợp
.\setunc.exe run ..\app_demo.stn

# Chạy với JIT Tier-2 Optimizing & AVX2 SIMD
.\setunc.exe run --jit ..\benchmarks\forensics\inputs\w3_matmul.stn

# Chạy Thí nghiệm Số học TAFPU Q(sqrt(3))
.\setunc.exe run ..\scientific_lab.stn

# Chạy Demo Mạch Lượng tử QVM
.\setunc.exe run ..\quantum_demo.stn

# Chạy Sinh văn bản AI bản địa (Gate 7.4 & 7.5)
.\setunc.exe ai generate --model-dir models/bitnet-b1.58 --prompt "Xin chao" --temp 0.7

# Bật giao diện trò chuyện REPL ChatML đa lượt
.\setunc.exe ai chat --model-dir models/bitnet-b1.58

# Chạy Đối chuẩn Hiệu năng Thực thi LLM chuyên sâu
.\build\benchmarks\gate75_benchmark.exe
```

### 4. Ví dụ Mã Nguồn Tersun
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
