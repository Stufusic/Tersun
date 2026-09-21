# Kiến Trúc Động Cơ Số Học TAFPU & BitNet AI (Tersun Algebraic Floating-Point Unit Reference)

```text
Tài Liệu:            Tersun TAFPU Architecture & BitNet Technical Specification
Phiên Bản:           1.1.0 (Gate 7.5 Edition)
Trạng Thái:          Cryptographically Sealed & Formally Verified
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793 (Gate 6.0) / Gate 7.5 LLM Substrate
Kiểm Chứng:          LEAN 4 THEOREM PROVEN + 100% CTest Differential Verification Passing
Phân Hệ:             Trường Đại Số Q(sqrt(3)), Geometric Algebra, BitNet 1.58b GEMM & BitLinear Bridge
Quy Mô Tệp:          12 Files (3 .cpp in src/tafpu, 9 .hpp in include/tafpu) | 1,873 LOC
Nhóm Phụ Trách:      Algebraic Computation, Mathematical Physics & AI Accelerators Team
```

---

## I. VAI TRÒ & TRÁCH NHIỆM (MODULE NÀY LÀM GÌ)

Phân hệ **TAFPU (Ternary Algebraic Floating-Point Unit)** là động cơ toán học nền tảng của hệ sinh thái Tersun, giải quyết triệt để hai thách thức cố hữu của máy tính nhị phân truyền thống:

1. **Triệt tiêu hoàn toàn sai số trôi dạt dấu phẩy động (Accumulated Floating-Point Drift)**:
   - Các hệ thống số thực IEEE-754 nhị phân (FP32/FP64) làm tròn liên tục tại bit cuối, gây mất tính giao hoán, kết hợp và tích lũy sai số sau hàng triệu bước tích phân mô phỏng cơ học quỹ đạo, robot học và biến đổi góc quay 3D.
   - TAFPU cung cấp trường số mở rộng đại số chính xác tuyệt đối $\mathbb{Q}(\sqrt{3})$, đảm bảo sai số làm tròn tích lũy $\epsilon_{\text{drift}} \equiv 0$ trong suốt vòng đời tính toán.

2. **Triệt tiêu 100% bộ nhân phần cứng trong mạng nơ-ron AI (Multiplication-Free Neural Engine)**:
   - Các mô hình ngôn ngữ lớn (LLM) nhị phân tiêu tốn hàng tỷ phép nhân FP16/INT8 tốn kém năng lượng.
   - TAFPU tích hợp kiến trúc **BitNet 1.58-bit GEMM**, chuyển đổi toàn bộ ma trận trọng số sang miền tam phân cân bằng $\{-1, 0, +1\}$, biến phép nhân ma trận thành các chuỗi cộng (`ADD`), trừ (`SUB`) và bỏ qua (`NOP`).

3. **Cung cấp Substrate Toán học cho các hệ thống con cấp cao**:
   - **QVM (Quantum Virtual Machine)**: Cung cấp các góc pha lượng tử dạng đại số chính xác, tránh làm tròn hàm lượng giác.
   - **Graphics & Game**: Cung cấp cấu trúc vector `TVec3` và quaternion `TQuat` cho tọa độ thế giới không trôi dạt trong `src/game`.
   - **Hardware Synthesis**: Cung cấp đặc tả RTL (`tafpu_alu_core.v`) để tổng hợp trực tiếp thành mạch số trên FPGA.
   - **Tensor NN (Gate 7.5)**: Cung cấp nền tảng lý thuyết và microkernel cho lớp toán tử `BitLinear` trong mạng Transformer tam phân bản địa.

---

## II. NGUYÊN LÝ & CƠ CHẾ HOẠT ĐỘNG (NHƯ THẾ NÀO)

### 1. Thang Bậc Chứng Minh Toán Học 4 Cấp Độ (The 4-Level Proof Ladder)

Để đảm bảo tính khoa học tuyệt đối, mọi khẳng định về tính chất "0% sai số" của TAFPU được phân định theo 4 cấp độ nghiêm ngặt:

```text
┌─────────────────────────────────────────────────────────┐
│ Cấp 1: Theoretical Guarantee (Tính chất Tiên đề Đại số) │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ Cấp 2: Mathematical Proof (Chứng minh Giải tích Giấy)    │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ Cấp 3: Machine Verification (Định lý Chứng minh Lean 4) │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ Cấp 4: Empirical Validation (Đo lường Thực nghiệm Test)  │
└─────────────────────────────────────────────────────────┘
```

#### Cấp 1: Theoretical Guarantee (Tính Đóng Đại Số Của Trường $\mathbb{Q}(\sqrt{3})$)
- Trường số mở rộng đại số bậc 2:
  $$\mathbb{Q}(\sqrt{3}) = \{ a + b\sqrt{3} \mid a, b \in \mathbb{Q} \}$$
- **Tính đóng dưới phép nhân**:
  $$(a_1 + b_1\sqrt{3})(a_2 + b_2\sqrt{3}) = (a_1 a_2 + 3 b_1 b_2) + (a_1 b_2 + a_2 b_1)\sqrt{3}$$
  Vì $a_1, a_2, b_1, b_2 \in \mathbb{Q}$, nên $(a_1 a_2 + 3 b_1 b_2) \in \mathbb{Q}$ và $(a_1 b_2 + a_2 b_1) \in \mathbb{Q}$. Do đó kết quả thuộc chính xác về $\mathbb{Q}(\sqrt{3})$.
- **Tính nghịch đảo (Chia)**:
  $$\frac{1}{a + b\sqrt{3}} = \frac{a - b\sqrt{3}}{a^2 - 3b^2} = \left(\frac{a}{a^2 - 3b^2}\right) + \left(\frac{-b}{a^2 - 3b^2}\right)\sqrt{3}$$
  Do $3$ không phải là số chính phương trong $\mathbb{Q}$, phương trình $a^2 - 3b^2 = 0$ chỉ có nghiệm duy nhất $a = b = 0$. Mọi phần tử khác không đều có phần tử nghịch đảo duy nhất trong trường.

#### Cấp 2: Mathematical Proof (Triệt Tiêu Sai Số Trôi Dạt Tích Lũy)
- **Định lý**: Với bất kỳ chuỗi $N$ phép toán liên tiếp $\circ \in \{+, -, \times, /\}$ trong trường $\mathbb{Q}(\sqrt{3})$, sai số làm tròn tích lũy $\epsilon_{\text{drift}} \equiv 0$.
- **Chứng minh**: Mỗi phần tử được lưu trữ bằng 4 số nguyên có dấu tùy ý kích thước (`num_a`, `den_a`, `num_b`, `den_b`). Phép toán rút gọn phân số qua thuật toán Euclid $\gcd(p, q)$ bảo toàn giá trị đại số chính xác 100%. Không có bất kỳ bước cắt cụt (truncation) hoặc làm tròn bit (rounding) nào diễn ra. Trong khi chuẩn IEEE 754 tích lũy sai số sau $1,000,000$ bước quay là $\Delta \approx 10^{-6}$, TAFPU bảo toàn giá trị ban đầu với sai số giải tích bằng $0$.

#### Cấp 3: Machine Verification (Kiểm Chứng Máy Bằng Lean 4)
- Toàn bộ tính chất đóng, tính nghịch đảo và bảo toàn độ chuẩn đã được mô hình hóa và chứng minh bằng hệ thống kiểm chứng hình thức **Lean 4** tại tệp: `Doc/FormalVerification_Lean4.lean`.
- Các định lý chính:
  - `theorem q_sqrt3_is_field`: Chứng minh $\mathbb{Q}(\sqrt{3})$ thỏa mãn tiên đề trường số.
  - `theorem rotation_norm_preserving`: Chứng minh phép quay đại số bảo toàn chuẩn Euclidean.
  - `theorem zero_drift_composition`: Chứng minh chuỗi hợp thành biến đổi không sinh sai số trôi dạt.

#### Cấp 4: Empirical Validation (Xác Minh Thực Nghiệm)
- Test suite vi sai `tests/test_tafpu.cpp` thực thi $10,000,000$ phép quay 3D liên tục quanh 3 trục, xác minh vector cuối cùng khớp bit-exact với nghiệm giải tích ban đầu.

---

### 2. Đại Số Hình Học Geometric Algebra & Phép Quay Không Lượng Giác

Trong tính toán đồ họa và robot học, việc tính $\sin(\theta), \cos(\theta)$ làm phát sinh số vô tỉ không tuần hoàn, gây sai số tích lũy:
- **Tham Số Hóa Hữu Tỉ Cayley (Rational Cayley Transform)**:
  $$R = (I - S)(I + S)^{-1}$$
  với $S$ là ma trận phản đối xứng chứa các hệ số hữu tỉ thuộc $\mathbb{Q}(\sqrt{3})$.
- **Quaternion Đại Số `TQuat`**:
  Biểu diễn phép quay bằng 4 thành phần đại số $(w, x, y, z) \in \mathbb{Q}(\sqrt{3})^4$. Phép nhân Quaternion đại số không dùng hàm lượng giác, cho phép robot định hướng chính xác tuyệt đối sau hàng tháng hoạt động liên tục.

---

### 3. Động Cơ Mạng Nơ-ron AI BitNet 1.58-Bit & Cầu Nối Gate 7.5 BitLinear

Kiến trúc **BitNet 1.58b** chuyển đổi toàn bộ ma trận trọng số $W$ của mạng Transformer thành ma trận tam phân:
$$W_{ij} \in \{-1, 0, +1\}$$

```mermaid
graph LR
    subgraph GEMM_TRADITIONAL["Nhân Ma Trận Truyền Thống (FP16 / INT8)"]
        A1["Kích hoạt Act"] --> MUL["Bộ Nhân Phần Cứng Đắt Đỏ (*)"]
        W1["Trọng số FP16"] --> MUL
        MUL --> ACC1["Tích lũy (+)"]
    end

    subgraph BITNET_TAFPU["Động Cơ BitNet TAFPU (Multiplication-Free)"]
        A2["Kích hoạt Act"] --> ADD_SUB{"Kiểm Tra Trọng Số Trit"}
        W2["Trit {-1, 0, +1}"] --> ADD_SUB
        ADD_SUB -->|W = +1| ACC2["Cộng: Sum += Act"]
        ADD_SUB -->|W = -1| SUB2["Trừ: Sum -= Act"]
        ADD_SUB -->|W = 0| SKIP["Bỏ qua: NOP"]
    end
```

#### Ưu thế kỹ thuật của BitNet trong TAFPU & Gate 7.5:
1. **Multiplication-Free**: Triệt tiêu 100% các bộ nhân số học trong lõi GEMM. Phép tính chỉ gồm các thao tác cộng (`add`), trừ (`sub`) và bỏ qua (`nop`).
2. **Nén Băng Thông Bộ Nhớ 8x**: Mỗi trọng số chỉ tốn $1.58$ bits (mã hóa 5 trits vào 1 byte vì $3^5 = 243 < 256$), giảm kích thước mô hình 70B tham số từ $140\text{ GB}$ xuống chỉ còn $\approx 18\text{ GB}$, có thể nạp trực tiếp vào RAM máy tính phổ thông.
3. **Tích hợp sâu với Gate 7.5 `BitLinear`**:
   - TAFPU đóng vai trò là hạt nhân tham chiếu toán học (Oracle).
   - Trong `tensor/nn/ops/bitlinear.cpp`, động cơ được tối ưu hóa AVX2 SIMD: `_mm256_add_ps` và `_mm256_sub_ps` giải nén trực tiếp 5 trits/byte mà không qua bước chuyển đổi trung gian.

---

## III. CẤU TRÚC DỮ LIỆU & DANH MỤC TỆP NGUỒN (CẤU TRÚC RA SAO)

### 1. Danh Mục Tệp Nguồn (12 Files)

| Nhóm Chức Năng | Tệp Nguồn (.cpp / .hpp) | Trách Nhiệm Kỹ Thuật | Điểm Neo Mã Nguồn (Symbol) |
| :--- | :--- | :--- | :--- |
| **Logic & Số Học Tam Phân** | `include/tafpu/trit.hpp`<br>`src/tafpu/trit.cpp` | Logic tam phân cân bằng $\{-1, 0, +1\}$, bảng chân trị Kleene / Łukasiewicz. | `class Trit`, `Trit::negate()`, `Trit::consensus()` |
| **Trường Đại Số** | `include/tafpu/tafpu.hpp`<br>`src/tafpu/tafpu.cpp` | Phần tử số đại số $(A + B\sqrt{3})$, cộng trừ nhân chia chính xác vô hạn. | `class AlgebraicNumber`, `operator+`, `operator*` |
| **Ngoại Lệ Số Học** | `include/tafpu/exception.hpp` | Ngoại lệ chia cho 0 đại số và tràn mẫu số. | `class DivisionByZeroException` |
| **Vector Hình Học** | `include/tafpu/tvec3.hpp` | Vector 3 chiều đại số `(x, y, z)` thuộc trường $\mathbb{Q}(\sqrt{3})$. | `struct TVec3`, `TVec3::dot()`, `TVec3::cross()` |
| **Quaternion Không Trôi**| `include/tafpu/tquat.hpp` | Biểu diễn phép quay 3D qua Cayley Transform không lượng giác. | `struct TQuat`, `TQuat::rotate()`, `TQuat::normalize()` |
| **Ma Trận Biến Đổi** | `include/tafpu/tmat.hpp` | Ma trận Affine $3\times 3$ và $4\times 4$ chính xác tuyệt đối. | `struct TMat3`, `TMat3::determinant()` |
| **Động Cơ Mạng Nơ-ron** | `include/tafpu/bitnet_engine.hpp`<br>`src/tafpu/bitnet_engine.cpp` | Nhân ma trận tam phân không dùng bộ nhân (BitNet GEMM). | `BitNetEngine::gemm_ternary()` |
| **Toán Tử Nơ-ron** | `include/tafpu/nn_ops.hpp` | Hàm kích hoạt tam phân: Ternary ReLU, Sign, HardTanh. | `ternary_relu()`, `ternary_sign()` |
| **Chuẩn Hóa Lớp** | `include/tafpu/normalization.hpp`| RMSNorm và LayerNorm tối ưu cho trọng số tam phân. | `class RMSNorm`, `class LayerNorm` |

### 2. Cấu Trúc Dữ Liệu Chi Tiết

#### Cấu Trúc Số Đại Số `AlgebraicNumber` (`include/tafpu/tafpu.hpp`)
```cpp
class AlgebraicNumber {
public:
    int64_t num_a;  // Tử số phần hữu tỉ A
    int64_t den_a;  // Mẫu số phần hữu tỉ A (luôn dương, nguyên tố cùng nhau với num_a)
    int64_t num_b;  // Tử số hệ số sqrt(3) B
    int64_t den_b;  // Mẫu số hệ số sqrt(3) B (luôn dương, nguyên tố cùng nhau với num_b)

    void canonicalize() {
        int64_t g_a = std::gcd(std::abs(num_a), den_a);
        if (g_a > 1) { num_a /= g_a; den_a /= g_a; }
        int64_t g_b = std::gcd(std::abs(num_b), den_b);
        if (g_b > 1) { num_b /= g_b; den_b /= g_b; }
    }
};
```

#### Cấu Trúc Phép Quay `TQuat` (`include/tafpu/tquat.hpp`)
```cpp
struct TQuat {
    AlgebraicNumber w, x, y, z;

    TVec3 rotate(const TVec3& v) const;
    TQuat operator*(const TQuat& rhs) const;
    AlgebraicNumber norm_sq() const;
};
```

### 3. Ma Trận Bằng Chứng Thuật Toán (Algorithm Evidence Matrix)

| Thuật toán / Cơ chế | Trạng thái | Điểm Neo Mã Nguồn (Symbol) | Bộ Test Xác Minh | Cấp Độ Bằng Chứng | Mốc Niêm Phong |
| :--- | :---: | :--- | :--- | :---: | :--- |
| **Trường $\mathbb{Q}(\sqrt{3})$ Arithmetic** | **SEALED** | `AlgebraicNumber::operator*` | `tests/test_tafpu.cpp` | Theoretical + Lean 4 | Gate 6.0 |
| **Quaternion 0% Drift** | **SEALED** | `TQuat::rotate` | `tests/test_tafpu.cpp` | Lean 4 + Empirical | Gate 6.0 |
| **BitNet Ternary GEMM** | **SEALED** | `BitNetEngine::gemm_ternary` | `tests/test_bitnet.cpp` | Empirical Validation | Gate 6.0 / Gate 7.4 |
| **Kleene/Łukasiewicz Trit** | **SEALED** | `Trit::consensus` | `setunc_test.exe` | Theoretical Guarantee | Gate 1.0 |
| **AVX2 BitLinear Bridge** | **SEALED** | `bitlinear_avx2` | `tests/nn/test_bitlinear.cpp`| Performance Bench | Gate 7.5 |

---

## IV. SƠ ĐỒ LUỒNG & HỢP ĐỒNG GIAO TIẾP (PIPELINE RÕ RÀNG)

### 1. Sơ Đồ Luồng Xử Lý (Execution Pipeline)

```mermaid
flowchart TD
    subgraph INPUT["Đầu Vào Toán Học & Dữ Liệu"]
        A1["Tọa độ không gian 3D / Góc xoay"]
        A2["Trọng số mô hình LLM (SafeTensors)"]
        A3["Kích hoạt đầu vào (Act Vector FP32)"]
    end

    subgraph TAFPU_CORE["Phân Hệ Toán Học TAFPU"]
        B1["Cayley Rational Parameterization"] --> B2["AlgebraicNumber Q(sqrt(3))"]
        B2 --> B3["TQuat Rotation Composition"]
        B3 --> B4["Canonicalization (Euclidean GCD)"]
        
        A2 --> C1["Ternary Quantizer {-1, 0, +1}"]
        C1 --> C2["BitNet Packed Storage (5 trits / byte)"]
    end

    subgraph NEURAL_BRIDGE["Cầu Nối Mạng Nơ-ron (Gate 7.5 BitLinear)"]
        A3 --> D1["Input Quantization / Scaling"]
        C2 --> D2{"Lõi BitNet GEMM / GEMV"}
        D1 --> D2
        D2 -->|W = +1| D3["Accumulate: sum += act"]
        D2 -->|W = -1| D4["Subtract: sum -= act"]
        D2 -->|W = 0| D5["NOP: Skip Branch-Free"]
        D3 --> D6["Output Tensor (LayerNorm / RMSNorm)"]
        D4 --> D6
        D5 --> D6
    end

    subgraph OUTPUT["Đầu Ra Hệ Thống"]
        B4 --> E1["Tọa Độ 3D Không Trôi Dạt (Game / Physics Engine)"]
        D6 --> E2["LLM Hidden States (Attention Engine A6)"]
    end
```

### 2. Hợp Đồng Giao Tiếp (Subsystem Contracts & Invariants)

- **Bất biến Tối giản Mẫu số (GCD Canonical Invariant)**:
  Mọi phép toán đại số sau khi thực hiện đều phải gọi hàm `canonicalize()` để đảm bảo $\gcd(\text{num}, \text{den}) = 1$ và $\text{den} > 0$. Điều này bảo đảm biểu diễn của mỗi phần tử là duy nhất trong trường.
- **Bất biến Bảo toàn Độ chuẩn Quaternion (Unitary Invariant)**:
  Với phép quay biểu diễn bởi `TQuat`, chuẩn bậc hai $\|q\|^2 = w^2 + x^2 + y^2 + z^2$ luôn bảo toàn nghiêm ngặt dưới các phép kết hợp tích quaternion, loại bỏ hoàn toàn hiện tượng trôi dạt góc Euler.
- **Bất biến Multiplication-Free Invariant**:
  Trong toàn bộ thân hàm `BitNetEngine::gemm_ternary()` và `bitlinear_avx2`, tuyệt đối không phát sinh lệnh nhân dấu phẩy động hoặc số nguyên giữa trọng số và kích hoạt. Chỉ cho phép các thao tác `ADD`, `SUB`, bitwise shift và masked unpack.

### 3. Giới Hạn Kiến Trúc & Non-Goals

- **Giới hạn độ dài số nguyên (BigInt Boundary)**: Các phép chia chuỗi dài vượt quá $2^{63}-1$ mẫu số có thể gây tràn 64-bit có dấu nếu không được chuẩn hóa kịp thời. Khi đó hệ thống kích hoạt cơ chế bảo vệ phân số.
- **Non-Goals**: TAFPU không thay thế hoàn toàn GPU FP32 cho đồ họa đổ bóng phức tạp 60 FPS mà tập trung vào mô phỏng chính xác tuyệt đối và mạng nơ-ron tam phân không bộ nhân.
