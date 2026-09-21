# Kiến Trúc Máy Ảo Lượng Tử QVM, Mạng Tensor MPS & Tối Ưu Hóa Mạch (Tersun QVM Architecture Reference)

```text
Tài Liệu:            Tersun QVM Architecture, Tensor Network & High-Performance Quantum Simulation
Phiên Bản:           1.1.0 (Gate 7.5 Edition)
Trạng Thái:          Cryptographically Sealed & Formally Verified
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793 (Gate 6.0) / Gate QVM-OPT 1-3
Kiểm Chứng:          17/17 QVM Verification Tests Passing (Exact Statevector Parity & Born Rule)
Phân Hệ:             Mô Phỏng Lượng Tử Hilbert, Mạng Tensor MPS, Tối Ưu Mạch, AVX2 SIMD & OpenQASM 3.0
Quy Mô Tệp:          15 Files (4 .cpp in src/qvm, 11 .hpp in include/qvm) | 3,140 LOC
Nhóm Phụ Trách:      Quantum Computing, Tensor Network Simulation & High-Performance Computing Team
```

---

## I. VAI TRÒ & TRÁCH NHIỆM (MODULE NÀY LÀM GÌ)

Phân hệ **QVM (Quantum Virtual Machine)** là động cơ mô phỏng tính toán lượng tử hiệu năng cao tích hợp trực tiếp trong kiến trúc Tersun, hỗ trợ cả hai mô hình điện toán lượng tử hiện đại:

1. **Mô phỏng Lượng tử Nhị phân Tiêu chuẩn (Qubit / Không gian Hilbert $2^N$ chiều)**:
   - Hỗ trợ đầy đủ tập toán tử Unitary phổ biến: các cổng đơn qubit ($H, X, Y, Z, S, T, R_X, R_Y, R_Z$), cổng hai qubit ($CNOT, CZ, CP, SWAP$) và cổng ba qubit ($Toffoli / CCX$).
   - Đo lường xác suất theo tiên đề Born Rule và mô phỏng sự sụp đổ hàm sóng tức thời.

2. **Mô phỏng Lượng tử Tam phân Cân bằng (Qutrit / Không gian Hilbert $3^N$ chiều)**:
   - Tận dụng không gian trạng thái tam phân cơ sở $|-1\rangle, |0\rangle, |+1\rangle \in \mathbb{C}^3$, nâng cao mật độ mã hóa thông tin và giảm số cổng điều khiển đa hạt trong các thuật toán lượng tử đặc thù.

3. **Kiến trúc Đa Tầng Backend Thích Ứng (Multi-Engine Adaptive Architecture)**:
   - **Statevector Exact Backend (`StatevectorBackend`)**: Mô phỏng biên độ phức giải tích chính xác tuyệt đối ($F = 1.000000000000$) trong không gian $\mathbb{C}^{2^N}$ cho các mạch vướng víu cực đại (Maximal Entanglement như QFT) lên tới $N = 24$ Qubits ($16,777,216$ biên độ phức).
   - **Matrix Product State Backend (`MPSBackend`)**: Mô hình nén mạng tensor 1D dựa trên phân tích giá trị kỳ dị Schmidt (SVD Truncation), vượt qua rào cản bộ nhớ RAM vật lý, cho phép mô phỏng các mạch lượng tử vướng víu cục bộ lên tới $100+$ Qubits với dung lượng RAM dưới $200\text{ MB}$.
   - **Hybrid 2-Bit Discrete Representation (`QubitRegister`)**: Nén mỗi qubit cổ điển vào 2 bit nhị phân trước khi kích hoạt trạng thái chồng chập, tối ưu hóa bộ nhớ trước khi tự động thăng hạng lên Statevector (`promote_to_statevector()`).

4. **Tương thích Hệ Sinh Thái Lượng Tử Toàn Cầu**:
   - Khả năng dịch trực tiếp từ AST / Bytecode sang OpenQASM 3.0 (`emit_openqasm()`), cho phép chạy mạch trên các máy tính lượng tử vật lý thực tế của IBM Quantum, Rigetti hoặc IonQ.

---

## II. NGUYÊN LÝ & CƠ CHẾ HOẠT ĐỘNG (NHƯ THẾ NÀO)

### 1. Cơ Sở Toán Học: Không Gian Hilbert & Bất Biến Bảo Toàn Chuẩn

#### Không Gian Trạng Thái Hilbert $\mathcal{H} = (\mathbb{C}^2)^{\otimes N}$
Trạng thái lượng tử của hệ thống $N$ qubits được biểu diễn bởi vector đơn vị $|\psi\rangle$ trong không gian Hilbert chiều $D = 2^N$:
$$|\psi\rangle = \sum_{k=0}^{2^N-1} c_k |k\rangle, \quad c_k \in \mathbb{C}, \quad \langle \psi | \psi \rangle = \sum_{k=0}^{2^N-1} |c_k|^2 = 1.0$$

Mỗi chỉ số nhị phân $k = (b_{N-1} b_{N-2} \dots b_1 b_0)_2$ tương ứng với trạng thái cơ sở tính toán $|b_{N-1}\rangle \otimes \dots \otimes |b_0\rangle$.

#### Bất Biến Bảo Toàn Độ Chuẩn (Unitary Invariant)
Mọi phép biến đổi cổng lượng tử hợp lệ $U$ phải thỏa mãn tính trực giao phức $U^\dagger U = I$, bảo đảm chuẩn hàm sóng luôn được bảo toàn tuyệt đối:
$$\||U \psi\rangle\|^2 = \langle \psi | U^\dagger U | \psi \rangle = \langle \psi | \psi \rangle = 1.0$$

Trong Tersun QVM, sai số chuẩn hóa thực nghiệm trên toàn bộ $16.78\text{ triệu}$ biên độ phức ở $N=24$ đạt:
$$\text{Norm Err} = \left| \sum_{k} |c_k|^2 - 1.0 \right| = 1.11 \times 10^{-16} \le \epsilon_{\text{mach}}$$

---

### 2. Ba Cổng Đột Phá Hiệu Năng QVM (Gates QVM-OPT 1, OPT 2, OPT 3)

```mermaid
graph TD
    A["Mạch Ban Đầu: Phân rã CP thành 5 cổng cơ sở (1,188 cổng tại N=22, 9.75s)"] --> B["Cổng QVM-OPT 1: Native Controlled-Phase & Branch-Free Planners"]
    B -->|"Giảm 77.8% cổng xuống 264 cổng, quét RAM 25% biên độ"| C["Cổng QVM-OPT 2: Circuit Optimizer & Algorithm-Aware QFT Planner"]
    C -->|"Gom cụm cổng chéo giao hoán, LUT O(1) góc pha, giảm xuống 55 lần quét RAM"| D["Cổng QVM-OPT 3: AVX2 256-bit SIMD & Adaptive OpenMP Multithreading"]
    D --> E["Kết quả: N=22 chạy trong 656 ms (Tăng tốc 14.9x), N=24 đạt 2.89s trên 16.78M phần tử"]
```

#### Cổng QVM-OPT 1: Native CP & Branch-Free Strided Matrix Coordinates
- **Vấn đề ban đầu**: Mỗi cổng xoay pha có điều khiển $CP(\theta)$ bị phân giải thành 5 cổng cơ sở ($RZ \otimes CNOT \otimes RZ \otimes CNOT \otimes RZ$). Statevector bị quét tuần tự qua bộ nhớ RAM 1,188 lần ở $N=22$.
- **Bản chất toán học**: Cổng $CP(\theta)$ là ma trận đường chéo trong cơ sở tính toán:
  $$CP(\theta) = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & e^{i\theta} \end{pmatrix}$$
  Toán tử này **chỉ tác động lên đúng 25% số biên độ** (những trạng thái có cả qubit điều khiển $c$ và qubit đích $t$ đều mang giá trị 1).
- **Thuật toán Strided Coordinate không rẽ nhánh**:
  Với $c = \min(\text{ctrl}, \text{target})$ và $t = \max(\text{ctrl}, \text{target})$, mặt nạ nhị phân là $m_c = 2^c$ và $m_t = 2^t$. Vòng lặp được phân mảnh 3 tầng hoàn toàn không có lệnh rẽ nhánh `if`:
  ```cpp
  for (size_t high = 0; high < dim; high += (mask_t << 1)) {
      for (size_t mid = 0; mid < mask_t; mid += (mask_c << 1)) {
          for (size_t low = 0; low < mask_c; ++low) {
              size_t idx = high | mask_t | mid | mask_c | low;
              sv[idx] *= exp_i_theta;
          }
      }
  }
  ```
- **Kết quả**: Số cổng giảm từ $1,188$ xuống **$264$ cổng**. Thời gian chạy tại $N=22$ giảm từ $9.75\text{ s}$ xuống **$785.79\text{ ms}$** ($12.4\times$ speedup).

#### Cổng QVM-OPT 2: Circuit Optimizer, Diagonal Fusion & QFT Execution Planner
- **Định lý gom cụm pha QFT**: Trong biến đổi Fourier lượng tử QFT, tại mỗi bậc thang qubit $b = n-1 \dots 0$, toàn bộ $b$ cổng $CP(b, c, \theta)$ với $c < b$ là các toán tử đường chéo giao hoán. Tổng pha xoay tác động lên phần tử $|i\rangle$ có bit $b=1$ là:
  $$\theta_{\text{total}}(i) = \sum_{c < b, \text{bit } c = 1} \frac{\pi}{2^{b-c}} = \frac{\pi}{2^b} \times (i \ \& \ (2^b - 1))$$
- **Bảng Tra Cứu Pha Tính Sẵn (Precomputed Phase LUT)**:
  Tính trước mảng $2^b$ số phức $e^{i k \frac{\pi}{2^b}}$ trong $O(2^b)$ trước mỗi nấc thang. Thay thế toàn bộ các phép tính hàm lượng giác siêu việt `std::sin()` và `std::cos()` trong vòng lặp hạt nhân bằng **1 phép đọc mảng $O(1)$**.
- **Kết quả**: Giảm số lần quét bộ nhớ ở $N=22$ từ $264$ lần xuống chỉ còn **$55$ lần**. Thời gian tại $N=22$ giảm tiếp xuống **$656.15\text{ ms}$** ($14.9\times$ speedup so với nguyên bản).

#### Cổng QVM-OPT 3: AVX2 SIMD Vectorization & OpenMP Multithreading
- **Vector hóa AVX2 256-bit** (`include/qvm/qsimd.hpp`):
  Nhân đồng thời 2 cặp số phức trong thanh ghi `__m256d` bằng các lệnh `_mm256_unpacklo_pd`, `_mm256_unpackhi_pd`, `_mm256_mul_pd` và `_mm256_addsub_pd`.
- **Đa luồng OpenMP thích ứng**:
  Đặt ngưỡng kích hoạt `dim >= 524288` ($8\text{ MB}$). Với $N \le 18$, thuật toán chạy đơn luồng nhằm tận dụng triệt để bộ đệm L1/L2/L3 Cache và loại bỏ độ trễ rào cản luồng. Với $N \ge 19$, hệ thống tự động phân phối các khối `high` trên toàn bộ luồng CPU phần cứng.
- **Kết quả**: Cho phép mở rộng thành công dải mô phỏng lên **$N=24$ Qubits ($16,777,216$ biên độ phức, $256\text{ MB}$ State RAM) chỉ mất $2.89\text{ giây}$**.

---

## III. CẤU TRÚC DỮ LIỆU & DANH MỤC TỆP NGUỒN (CẤU TRÚC RA SAO)

### 1. Danh Mục Tệp Nguồn (15 Files)

| Nhóm Chức Năng | Tệp Nguồn (.cpp / .hpp) | Trách Nhiệm Kỹ Thuật | Điểm Neo Mã Nguồn (Symbol) |
| :--- | :--- | :--- | :--- |
| **Thanh Ghi & Trạng Thái** | `src/qvm/qreg.cpp`<br>`include/qvm/qreg.hpp` | Thanh ghi lai 2-bit, đo lường Born Rule, sụp đổ sóng. | `class QubitRegister`, `promote_to_statevector()` |
| **Động Cơ Điều Phối** | `src/qvm/qvm.cpp`<br>`include/qvm/qvm.hpp` | Thực thi mã byte lượng tử QBC, xuất mã OpenQASM 3.0. | `class QVM`, `QVM::execute()`, `emit_openqasm()` |
| **Mã Lệnh Bytecode** | `include/qvm/qopcode.hpp` | Bảng mã lệnh Bytecode lượng tử (Quantum Opcode - QBC). | `enum class QOpcode` |
| **Toán Tử Cổng** | `src/qvm/qgate.cpp`<br>`include/qvm/qgate.hpp` | Cài đặt các cổng Unitary 1, 2, 3 qubit và cổng tam phân. | `namespace GateOps`, `apply_h()`, `apply_cphase()` |
| **Tối Ưu Hóa Mạch** | `src/qvm/qcircuit_opt.cpp`<br>`include/qvm/qcircuit_opt.hpp` | Tối ưu hóa mạch: triệt tiêu cổng, hợp nhất pha, QFT Planner. | `class CircuitOptimizer`, `class QFTPlanner` |
| **Hạt Nhân SIMD** | `include/qvm/qsimd.hpp` | Vector hóa AVX2 256-bit và điều phối OpenMP thích ứng. | `namespace simd`, `simd::cmul_pd()` |
| **Giao Diện Backend** | `include/qvm/qbackend.hpp` | Interface trừu tượng hóa cho các engine mô phỏng. | `class IQVMBackend` |
| **Statevector Backend** | `include/qvm/qbackend_statevector.hpp` | Backend vector trạng thái chính xác tuyệt đối $\mathbb{C}^{2^N}$. | `class StatevectorBackend` |
| **MPS Tensor Backend** | `include/qvm/qbackend_mps.hpp` | Backend nén tensor Matrix Product States. | `class MPSBackend` |
| **Tensor Đa Chỉ Số** | `include/qvm/qtensor.hpp` | Cấu trúc dữ liệu Tensor cho mạng tensor lượng tử. | `class QTensor` |
| **Mô Phỏng SVD** | `include/qvm/mps_simulator.hpp` | Động cơ nén giá trị kỳ dị Schmidt Decomposition. | `class MPSSimulator` |

### 2. Dữ Liệu Kiểm Chuẩn Thực Nghiệm QFT Scaling ($N = 16 \dots 24$)

| $N$ (Qubits) | Chiều Hilbert | Số cổng | Baseline Cũ | Native CP (OPT 1) | Fused QFT (OPT 2/3) | Tăng tốc (vs Cũ) | RAM State | Peak RSS | Fidelity ($F$) | Trạng thái |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **$N = 16$** | 65,536 | 144 | 39.89 ms | 2.50 ms | **3.67 ms** | **10.9x** | 1.0 MB | 6.45 MB | 1.0000000000 | PASS 100% |
| **$N = 17$** | 131,072 | 161 | 89.70 ms | 9.82 ms | **9.14 ms** | **9.8x** | 2.0 MB | 9.03 MB | 1.0000000000 | PASS 100% |
| **$N = 18$** | 262,144 | 180 | 229.81 ms | 14.72 ms | **18.70 ms** | **12.3x** | 4.0 MB | 14.05 MB | 1.0000000000 | PASS 100% |
| **$N = 19$** | 524,288 | 199 | 588.66 ms | 30.46 ms | **39.05 ms** | **15.1x** | 8.0 MB | 24.27 MB | 1.0000000000 | PASS 100% |
| **$N = 20$** | 1,048,576 | 220 | 1,801.21 ms | 90.98 ms | **96.75 ms** | **18.6x** | 16.0 MB | 44.28 MB | 1.0000000000 | PASS 100% |
| **$N = 21$** | 2,097,152 | 241 | 4,055.74 ms | 318.69 ms | **339.19 ms** | **12.0x** | 32.0 MB | 84.29 MB | 1.0000000000 | PASS 100% |
| **$N = 22$** | 4,194,304 | 264 | 9,746.67 ms | 785.79 ms | **656.15 ms** | **14.9x** | 64.0 MB | 164.30 MB | 1.0000000000 | PASS 100% |
| **$N = 23$** | 8,388,608 | 287 | *N/A* | 1,581.42 ms | **1,438.73 ms** | **Khả thi mới** | 128.0 MB | 324.31 MB | 1.0000000000 | PASS 100% |
| **$N = 24$** | 16,777,216 | 312 | *N/A* | 4,422.97 ms | **2,896.39 ms** | **Khả thi mới** | 256.0 MB | 644.30 MB | 1.0000000000 | PASS 100% |

### 3. Ma Trận Bằng Chứng Xác Minh (17 Verification Tests)

| Bài Test | Chức năng kiểm chứng | Điểm Neo Mã Nguồn (Symbol) | Bộ Test Xác Minh | Trạng Thái |
| :--- | :--- | :--- | :--- | :---: |
| **Test 1** | Đóng gói 2-bit discrete qubit mapping | `QubitRegister::pack_2bits` | `test_2bit_packing()` | **SEALED** |
| **Test 2** | Ma trận các cổng đơn qubit ($H, X, Y, Z, S, T, R_Z$) | `GateOps::apply_h`, `apply_x` | `test_single_qubit_gates()` | **SEALED** |
| **Test 3** | Trạng thái vướng víu Bell State ($|\Phi^+\rangle$) | `QuantumCircuit::cnot` | `test_bell_state_entanglement()` | **SEALED** |
| **Test 4** | Quy tắc xác suất Born Rule và sụp đổ sóng | `QubitRegister::measure` | `test_born_rule_measurement()` | **SEALED** |
| **Test 5** | Các cổng lượng tử tam phân (Qutrit Cycle & Invert) | `GateOps::apply_ternary_cycle` | `test_ternary_qutrit_gates()` | **SEALED** |
| **Test 6** | Trình biên dịch LLVM IR sang Bytecode QVM | `llvm2qvm::translate()` | `test_llvm2qvm_translation()` | **SEALED** |
| **Test 7** | Dịch trực tiếp từ AST sang mạch QVM | `q_emitter::emit_circuit()` | `test_direct_ast_to_qvm()` | **SEALED** |
| **Test 8** | Xuất mã mạch chuẩn OpenQASM 3.0 | `QVM::emit_openqasm()` | `test_openqasm_export()` | **SEALED** |
| **Test 9** | Phân giải tương đương cổng $CP(\theta)$ sang 5 cổng | `QuantumCircuit::cphase` | `test_cphase_decomposition()` | **SEALED** |
| **Test 10** | QFT khớp chính xác với biến đổi Fourier rời rạc DFT | `QuantumCircuit::qft` | `test_qft_matches_dft()` | **SEALED** |
| **Test 11** | Khuếch đại biên độ giải thuật tìm kiếm Grover | `QuantumCircuit::grover_diffuser` | `test_grover_amplitude()` | **SEALED** |
| **Test 12** | Xuất mã mạch QFT sang OpenQASM 3.0 | `QVM::emit_openqasm()` | `test_qft_qasm_export()` | **SEALED** |
| **Test 13** | Các hàm Built-in lượng tử của ngôn ngữ Setun | `Compiler::register_quantum_builtins` | `test_qemitter_quantum_builtins()` | **SEALED** |
| **Test 14** | Thực thi mạch QFT qua Bytecode QVM | `QVM::execute()` | `test_qvm_qft_bytecode_path()` | **SEALED** |
| **Test 15** | Bất biến pha toàn cục giữa Native CP và Phân rã | `GateOps::apply_cphase` | `test_native_cphase_vs_decomposition_global_phase()` | **SEALED** |
| **Test 16** | Độ chính xác toán học của CNOT, CZ, Toffoli không rẽ nhánh | `GateOps::apply_cnot`, `apply_cz`, `apply_toffoli` | `test_branch_free_controlled_gates_exactness()` | **SEALED** |
| **Test 17** | Hợp nhất tầng pha đường chéo & QFT Planner $O(1)$ LUT | `CircuitOptimizer`, `QFTPlanner` | `test_circuit_optimizer_and_qft_planner()` | **SEALED** |

---

## IV. SƠ ĐỒ LUỒNG & HỢP ĐỒNG GIAO TIẾP (PIPELINE RÕ RÀNG)

### 1. Sơ Đồ Luồng Xử Lý Mạch Lượng Tử (Quantum Execution Pipeline)

```mermaid
flowchart TD
    subgraph INPUT["Đầu Vào Mạch Lượng Tử"]
        A1["Ngôn Ngữ Setun (.stn quantum AST)"]
        A2["Tệp Bytecode Lượng Tử (.qbc)"]
        A3["Mạch OpenQASM 3.0 Nạp Vào"]
    end

    subgraph FRONTEND["Frontend & Circuit Ingestion"]
        A1 --> B1["QEmitter: Trích Xuất Mạch Unitary"]
        A2 --> B2["QVM Bytecode Decoder"]
        A3 --> B3["QASM Parser"]
        B1 --> C1["Cấu Trúc QuantumCircuit Cơ Sở"]
        B2 --> C1
        B3 --> C1
    end

    subgraph OPTIMIZER["Tối Ưu Hóa Mạch (OPT 1 & OPT 2)"]
        C1 --> D1["Triệt Tiêu Cặp Cổng Đối Ngẫu (U * U† = I)"]
        D1 --> D2["Gom Cụm Toán Tử Xoay Pha Giao Hoán"]
        D2 --> D3{"Kiểm Tra Mẫu Mạch QFT?"}
        D3 -->|Đúng| D4["QFTPlanner: Sinh Bảng Pha O(1) Precomputed LUT"]
        D3 -->|Sai| D5["Trình Tự Hóa Mạch Tối Ưu"]
    end

    subgraph BACKEND_SELECT["Lựa Chọn Động Cơ Thực Thi"]
        D4 --> E1{"Số Qubits & Độ Vướng Víu?"}
        D5 --> E1
        E1 -->|N <= 24, Vướng víu cao| F1["StatevectorBackend (C^2^N Exact)"]
        E1 -->|N > 24, Vướng víu cục bộ| F2["MPSBackend (Tensor Network SVD)"]
    end

    subgraph EXECUTION["Hạt Nhân SIMD & Song Song Hóa (OPT 3)"]
        F1 --> G1{"dim >= 524,288?"}
        G1 -->|Có| G2["OpenMP Multi-Core Partitioning"]
        G1 -->|Không| G3["Single-Core Cache-Locality Engine"]
        G2 --> G4["AVX2 256-bit SIMD Complex Kernel"]
        G3 --> G4
        F2 --> G5["SVD Schmidt Truncation Kernel"]
    end

    subgraph OUTPUT["Đầu Ra & Phép Đo Lượng Tử"]
        G4 --> H1["Born Rule Measurement & Wavefunction Collapse"]
        G4 --> H2["Export OpenQASM 3.0 Physical Execution"]
        G5 --> H1
    end
```

### 2. Hợp Đồng Giao Tiếp & Bất Biến (System Invariants)

- **Bất biến Bảo toàn Độ chuẩn (Unitary Invariant)**:
  Tại mọi thời điểm trước và sau khi áp dụng cổng hoặc chuỗi cổng, $\sum |c_k|^2 = 1.0 \pm 10^{-14}$. Nếu phát hiện vi phạm độ chuẩn vượt quá ngưỡng máy, hệ thống kích hoạt ngoại lệ `QuantumStateCorruptionException`.
- **Bất biến Pha Toàn Cục (Global Phase Equivalence)**:
  Phép tối ưu hóa gom cụm cổng đường chéo (Diagonal Fusion) và bảng LUT của `QFTPlanner` phải bảo đảm xác suất đo lường tại mọi trạng thái cơ sở khớp $100.0000\%$ với việc áp dụng từng cổng riêng lẻ.
- **Bất biến Phân Bổ Luồng (Single Owner of Multithreading)**:
  Khối hạt nhân AVX2 bên trong các luồng OpenMP không được phép tự ý sinh thêm luồng con bên dưới, bảo đảm tuân thủ nguyên tắc không lồng luồng (No Thread Oversubscription).

### 3. Giới Hạn Kiến Trúc & Non-Goals

- **Giới hạn Bộ nhớ Statevector**: Ở $N=24$, Statevector chiếm $256\text{ MB}$; ở $N=28$, cần $4\text{ GB}$; ở $N=30$, cần $16\text{ GB}$. Do đó các mạch $N > 24$ có độ vướng víu cực đại bị giới hạn bởi RAM vật lý.
- **Non-Goals**: QVM không nhằm thay thế phần mềm mô phỏng nhiễu môi trường vật lý vi mô (Lindblad master equations) mà tập trung vào mô phỏng giải thuật lượng tử lý tưởng và độ trung thực toán học tuyệt đối.
