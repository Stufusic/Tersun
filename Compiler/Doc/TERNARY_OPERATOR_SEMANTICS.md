# Đặc tả Toán học Hình thức: Hệ thống Toán tử Tam phân & Số học trong Tersun
### *(Formal Semantics Specification for Balanced Ternary Operators & Arithmetic)*

> **Mã tài liệu**: `SPEC-TERSUN-OP-2.0`  
> **Phiên bản áp dụng**: Tersun 2.0.0 (Gate 5.8+)  
> **Trạng thái**: Bản Đặc Tả Chuẩn (Standard Normative Specification — Revision 3)  
> **Phạm vi bảo hộ**: Hệ thống thực thi Setun-70 VM, Trình tối ưu hóa Tree Optimizer, Trình biên dịch Baseline JIT, OSR Runtime, và Bộ phát mã LLVM Native AOT.

---

## 1. Không gian Số học & Đại số Tam phân Cân bằng (Balanced Ternary Space)

### 1.1. Tập giá trị Trit đơn vị
Một **trit** $t$ nhận giá trị trong tập đối xứng bậc 3:
$$\mathbb{T} = \{-1, 0, +1\}$$
Trong quy ước ký hiệu Setun:
- $-1 \equiv \bar{1} \equiv \text{T}$ (âm)
- $0 \equiv 0$ (trung hòa / neutral)
- $+1 \equiv 1$ (dương)

### 1.2. Biểu diễn Tryte cố định độ rộng ($W$-trit Tryte)
Một **tryte** chuẩn trong Tersun có độ rộng cố định $W = 6$ trits:
$$\mathbf{t} = (t_5, t_4, t_3, t_2, t_1, t_0) \in \mathbb{T}^6$$
trong đó:
- $t_0$ là trit có trọng số thấp nhất: $3^0 = 1$.
- $t_5$ là trit có trọng số cao nhất: $3^5 = 243$.

Giá trị số nguyên tương ứng $\mathcal{V}(\mathbf{t}) \in \mathbb{Z}$ được xác định bằng đa thức cơ số 3:
$$\mathcal{V}(\mathbf{t}) = \sum_{k=0}^{5} t_k \cdot 3^k$$

Khoảng giá trị nguyên biểu diễn được của tryte 6-trit là đối xứng hoàn hảo quanh $0$:
$$\left[ -\frac{3^6 - 1}{2}, +\frac{3^6 - 1}{2} \right] = [-364, +364]$$
Tổng số trạng thái khả dĩ trong không gian là $3^6 = 729$ giá trị rời rạc.

> [!NOTE]
> **Hệ quả đối xứng**: Khác với số nhị phân bù 2 (Two's Complement) luôn có hiện tượng bất đối xứng (ví dụ `[-128, +127]`), hệ tam phân cân bằng hoàn toàn triệt tiêu bit dấu phụ. Phép đổi dấu số học $-\mathbf{t}$ chính là phép toán phủ định từng trit tại chỗ:
> $$\mathcal{V}(-\mathbf{t}) = -\mathcal{V}(\mathbf{t}) \quad \text{với } (-\mathbf{t})_k = -t_k \quad \forall k \in [0, 5]$$

---

## 2. Đặc tả Toán tử Chia lấy dư `%` (Remainder & Modulo)

### 2.1. Ngữ nghĩa trên Số nguyên Cố định (`int` — 64-bit)
Toán tử `%` trên kiểu `int` tuân thủ chuẩn **Truncated Remainder** (đồng nhất tuyệt đối với ISO C99 và chỉ lệnh `srem` của LLVM IR):

Cho $a, b \in \mathbb{Z}$ với $b \neq 0$:
$$a = q \cdot b + r \quad \text{sao cho } q = \operatorname{trunc}(a / b)$$
Khi đó:
$$r = a \mathbin{\%} b = a - \operatorname{trunc}(a / b) \cdot b$$

**Quy tắc xác định dấu**:
- Dấu của phần dư $r$ luôn trùng với dấu của số bị chia $a$ (hoặc bằng $0$).
- Ví dụ kiểm chuẩn:
  $$7 \mathbin{\%} 3 = 1, \quad (-7) \mathbin{\%} 3 = -1, \quad 7 \mathbin{\%} (-3) = 1, \quad (-7) \mathbin{\%} (-3) = -1$$

### 2.2. Ngữ nghĩa trên Kiểu Tam phân Cố định (`tryte` — 6-trit)
Toán tử `%` giữa hai toán hạng `tryte` được định nghĩa thông qua giá trị số nguyên cân bằng tương ứng:
$$\mathbf{a} \mathbin{\%} \mathbf{b} = \operatorname{tryte}(\mathcal{V}(\mathbf{a}) \mathbin{\%} \mathcal{V}(\mathbf{b}))$$

> [!TIP]
> **Định lý Bảo toàn Miền giá trị (Range Invariant Theorem)**:  
> Với mọi $\mathbf{a}, \mathbf{b} \in \mathbb{T}^6$ thỏa mãn $\mathcal{V}(\mathbf{b}) \neq 0$:  
> Giá trị phần dư $r = \mathcal{V}(\mathbf{a}) \mathbin{\%} \mathcal{V}(\mathbf{b})$ luôn thỏa mãn:
> $$|r| < |\mathcal{V}(\mathbf{b})| \le 364 \implies r \in [-363, +363] \subset [-364, +364]$$  
> *Chứng minh*: Theo tính chất của phép chia lấy dư cụt (truncated remainder), phần dư luôn nghiêm ngặt nhỏ hơn độ lớn tuyệt đối của số chia. Do $|\mathcal{V}(\mathbf{b})| \le 364$, phần dư tối đa là 363, nằm trọn vẹn $100\%$ trong miền biểu diễn của tryte 6-trit.  
> *Hệ quả*: Phép chia lấy dư trên `tryte` **không bao giờ xảy ra tràn số (overflow)** và không làm suy giảm độ chính xác.

### 2.3. Xử lý Biên Bắt buộc: Zero-Check Guard & Signed Integer Overflow
Trong kiến trúc phần cứng x86-64 và LLVM IR:
1. `b == 0`: Phép chia cho 0 kích hoạt ngắt phần cứng Hardware Fault (`#DE`) hoặc gây ra Undefined Behavior (UB) trong LLVM.
2. `a == INT64_MIN && b == -1`: Trong hệ nhị phân bù 2, thương $\operatorname{INT64\_MIN} / -1 = 2^{63}$ vượt quá giới hạn cực đại `INT64_MAX` ($2^{63} - 1$), dẫn đến tràn số phần cứng trên lệnh x86 `idiv` và gây UB.

**Hợp đồng Thực thi Chuẩn mực (Execution Contract)**:
Trước mọi phép tính $a \mathbin{\%} b$, hệ thống runtime và compiler bắt buộc phải thiết lập chốt chặn an toàn:
$$\begin{cases}
\mathbf{trap}(\text{DivisionByZeroException}), & \text{nếu } b = 0 \\
0, & \text{nếu } a = \text{INT64\_MIN} \land b = -1
\end{cases}$$

- **Trên Máy ảo Bytecode VM**: Kích hoạt ngoại lệ `VMException("Division by zero in integer modulo.")`, cho phép bắt an toàn qua khối `try / catch`.
- **Trên LLVM IR & Native AOT**: Tự động chèn khối kiểm tra điều kiện (Basic Block Guard) trước khi phát chỉ lệnh `srem i64`.

---

## 3. Đặc tả Toán tử Logic & Dịch Trit trên Kiểu Tam phân (`tryte`)

### 3.1. Phép toán Logic Kleene theo từng Trit (Tritwise Kleene Logic)
Hệ thống logic tam phân cân bằng tuân thủ **Đại số Kleene 3 giá trị**:

#### 1. Toán tử `&` (Tritwise Kleene Min / AND)
$$(\mathbf{a} \mathbin{\&} \mathbf{b})_k = \min(a_k, b_k) \quad \forall k \in [0, 5]$$

**Bảng Chân Trị Chính Thức**:

| Toán hạng $(a_k, b_k)$ | $b_k = \mathbf{-1}$ | $b_k = \mathbf{0}$ | $b_k = \mathbf{+1}$ |
| :---: | :---: | :---: | :---: |
| **$a_k = \mathbf{-1}$** | $-1$ | $-1$ | $-1$ |
| **$a_k = \mathbf{0}$**  | $-1$ | $0$  | $0$  |
| **$a_k = \mathbf{+1}$** | $-1$ | $0$  | $+1$ |

#### 2. Toán tử `|` (Tritwise Kleene Max / OR)
$$(\mathbf{a} \mathbin{|} \mathbf{b})_k = \max(a_k, b_k) \quad \forall k \in [0, 5]$$

**Bảng Chân Trị Chính Thức**:

| Toán hạng $(a_k, b_k)$ | $b_k = \mathbf{-1}$ | $b_k = \mathbf{0}$ | $b_k = \mathbf{+1}$ |
| :---: | :---: | :---: | :---: |
| **$a_k = \mathbf{-1}$** | $-1$ | $0$  | $+1$ |
| **$a_k = \mathbf{0}$**  | $0$  | $0$  | $+1$ |
| **$a_k = \mathbf{+1}$** | $+1$ | $+1$ | $+1$ |

#### 3. Toán tử `~` (Tritwise Inversion / NOT)
$$(\sim \mathbf{a})_k = -a_k \quad \forall k \in [0, 5]$$

---

### 3.2. Toán tử `^`: Phép cộng Trường Hữu hạn GF(3) Không Nhớ (Tritwise GF(3) Addition)

Tersun định nghĩa toán tử `^` trên kiểu `tryte` là **Phép cộng trường hữu hạn $\mathbb{F}_3$ không nhớ (Uncarried GF(3) Addition)**, đồng cấu với nhóm cyclic $(\mathbb{Z}_3, +)$ thông qua ánh xạ:
$$\phi: \mathbb{T} \to \mathbb{Z}_3, \quad \phi(0) = 0, \quad \phi(+1) = 1, \quad \phi(-1) = 2$$

Phép toán trên từng trit được định nghĩa:
$$a_k \oplus_3 b_k = \phi^{-1}\left( (\phi(a_k) + \phi(b_k)) \pmod 3 \right)$$

**Bảng Chân Trị Chính Thức của `^` trên Trit**:

| Toán hạng $(a_k, b_k)$ | $b_k = \mathbf{-1}$ | $b_k = \mathbf{0}$ | $b_k = \mathbf{+1}$ | Ý nghĩa đại số |
| :---: | :---: | :---: | :---: | :--- |
| **$a_k = \mathbf{-1}$** | $\mathbf{+1}$ | $-1$ | $0$ | $(-1) + (-1) = -2 \equiv +1 \pmod 3$ |
| **$a_k = \mathbf{0}$**  | $-1$ | $0$  | $+1$ | Phần tử trung hòa (Identity element) |
| **$a_k = \mathbf{+1}$** | $0$  | $+1$ | $\mathbf{-1}$ | $(+1) + (+1) = +2 \equiv -1 \pmod 3$ |

> [!IMPORTANT]
> **Quy ước Thuật ngữ Rõ Ràng**:
> - Trên kiểu số nguyên 64-bit `int`: `^` là phép toán **Bitwise XOR nhị phân chuẩn**.
> - Trên kiểu tam phân `tryte`: `^` là phép toán **Tritwise GF(3) Addition**.

---

### 3.3. Đặc tả Toán tử Dịch Trit (`<<` và `>>`)

Xét một tryte $\mathbf{t} = (t_5, t_4, t_3, t_2, t_1, t_0)$ độ rộng cố định $W = 6$ trits. Tham số dịch $k \in \mathbb{Z}$:
- Nếu $k < 0 \implies \mathbf{trap}(\text{InvalidShiftCountException})$.
- Nếu $k \ge 6 \implies$ trả về tryte $0 = (0, 0, 0, 0, 0, 0)$.
- Nếu $k = 0 \implies$ trả về nguyên vẹn tryte $\mathbf{t}$.

#### 1. Dịch trái (`t << k`)
Các trit dịch về phía trọng số cao hơn $k$ vị trí; $k$ trit cao nhất bị loại bỏ (cắt cụt modulo $3^6$); $k$ vị trí thấp trống được điền bằng **trit $0$**:
$$(\mathbf{t} \ll k)_i = \begin{cases} t_{i-k}, & \text{nếu } i \ge k \\ 0, & \text{nếu } i < k \end{cases}$$

#### 2. Dịch phải (`t >> k`)
Các trit dịch về phía trọng số thấp hơn $k$ vị trí; $k$ trit thấp nhất bị loại bỏ; $k$ vị trí cao trống được điền bằng **trit $0$**:
$$(\mathbf{t} \gg k)_i = \begin{cases} t_{i+k}, & \text{nếu } i + k < 6 \\ 0, & \text{nếu } i + k \ge 6 \end{cases}$$

> [!TIP]
> **Chứng minh Tính Đồng Nhất giữa Dịch Logic và Dịch Số Học trong Hệ Tam Phân Cân Bằng**:  
> Trong hệ nhị phân bù 2, số âm có bit cao nhất là 1, nên dịch phải số học (Arithmetic Shift Right) bắt buộc phải độn bit 1 để bảo toàn dấu âm.  
> **Ngược lại, trong hệ tam phân cân bằng, trit $0$ chính là gốc tọa độ đối xứng.** Bản thân các trit âm $\bar{1}$ đã mang dấu âm nội tại ở các trọng số tương ứng:
> 
> - Xét số âm $-9 = (0, 0, \bar{1}, 0, 0)_3$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, \bar{1}, 0)_3 = -3 = -9 / 3$. Dấu âm và tỷ lệ chia được bảo toàn hoàn hảo.
> - Xét số $14 = (0, 0, 1, \bar{1}, \bar{1}, \bar{1})_3 = 27 - 9 - 3 - 1 = 14$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, 1, \bar{1}, \bar{1})_3 = 9 - 3 - 1 = 5 \approx 14 / 3$.
> - Xét số $-14 = (0, 0, \bar{1}, 1, 1, 1)_3 = -14$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, \bar{1}, 1, 1)_3 = -5 \approx -14 / 3$.
>
> Nếu độn trit $\bar{1}$ vào vị trí cao nhất $t_5$, giá trị sẽ bị cộng thêm $-1 \times 3^5 = -243$, làm sai lệch hoàn toàn ngữ nghĩa số học.  
> Do đó, trong hệ tam phân cân bằng: **Phép dịch phải số học và phép dịch phải logic là một, và luôn luôn điền trit $0$**. Phép toán này tương đương với phép chia làm tròn cân bằng:
> $$\mathcal{V}(\mathbf{t} \gg k) = \operatorname{round}\left( \frac{\mathcal{V}(\mathbf{t})}{3^k} \right) = \left\lfloor \frac{\mathcal{V}(\mathbf{t})}{3^k} + \frac{1}{2} \right\rfloor$$

---

## 4. Đặc tả Hàm Thời gian Đơn điệu (`monotonic_now_us`)

- **Bản chất Clock**: Sử dụng `std::chrono::steady_clock` (tương đương `CLOCK_MONOTONIC` trên POSIX hoặc `QueryPerformanceCounter` trên Windows).
- **Tính chất Đảm bảo**: **Monotonic Non-Decreasing** (Đơn điệu không giảm):
  $$\forall t_2 > t_1 \implies \text{monotonic\_now\_us}(t_2) \ge \text{monotonic\_now\_us}(t_1)$$
- **Đơn vị Đo**: Microseconds ($\mu s$).
- **Giao diện API Chuẩn**:
  - Tên chính thức: `monotonic_now_us()`
  - Tên bí danh tương thích ngược: `time_now_us()`
  - Hiện diện đồng bộ $100\%$ trên: Máy ảo VM (`OP_TIME_NOW_US`), LLVM AOT (`@tersun_monotonic_now_us`), và C Transpiler.

---

## 5. Ma trận Kiểm định Toàn diện (Exhaustive Verification Matrix)

Toàn bộ không gian trạng thái của `tryte` 6-trit ($3^6 = 729$ giá trị rời rạc) được kiểm định vét cạn tự động nhằm bảo chứng tính tương đương ngữ nghĩa $100\%$ xuyên suốt các tầng thực thi:

| Hạng Mục Kiểm Thử | Không Gian Kiểm Thử | Số Trường Hợp | Tiêu Chuẩn Kiểm Định Chéo |
| :--- | :--- | :---: | :--- |
| **`tryte & tryte`** (Kleene Min) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte` &#124; `tryte`** (Kleene Max) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte ^ tryte`** (GF(3) Add) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte % tryte`** (Truncated Rem) | Toàn bộ cặp với $\mathcal{V}(b) \neq 0$ | $729 \times 728 = \mathbf{530,712}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Truncated Mod}$ |
| **`tryte << k`** (Shift Left) | Mọi $a \in \mathbb{T}^6$, $k \in [0, 6]$ | $729 \times 7 = \mathbf{5,103}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Trit Shift Def}$ |
| **`tryte >> k`** (Shift Right) | Mọi $a \in \mathbb{T}^6$, $k \in [0, 6]$ | $729 \times 7 = \mathbf{5,103}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Trit Shift Def}$ |
| **Edge Case Division** | $b = 0$ và $\text{INT64\_MIN} \mathbin{\%} -1$ | Ma trận biên | Bẫy ném ngoại lệ nhất quán |

> [!NOTE]
> **Tổng cộng kiểm thử**: Hơn **$2,135,241$ phép toán kiểm định vét cạn** bảo chứng tính tương đương ngữ nghĩa $100\%$ không suy hao giữa Bytecode VM, JIT/OSR Runtime, và Trình biên dịch LLVM AOT.

---

## 6. Phụ Lục Tham Chiếu Mật Mã (Cryptographic Verification Seals)

Toàn bộ các bất biến toán học và kết quả kiểm định trên đã được niêm phong bất biến qua các khóa chữ ký số SHA-256 trong `test_registry/gate5_milestones.json`:

```json
{
  "CP0_BASELINE": "bd55c2734c8208fab22353d174bb353b9cdd634970a8e5de2faa9a02193f0096",
  "CP1_TREE_OPT": "e98870d1ccf3ed9a0672930c26664f022803f62d25030c4f75c3b50afb9a67df",
  "CP5_OSR_DEOPT": "403f7ca275c1b69f658ff996c56aa38914b14d2e8e30b6ffc31f47d9aee1942d",
  "CP5_OSR_DEOPT_ADV": "71b29a8db618e9766946654a9d701e7e7807ec1899a6f4ad1c4f5ea78d052cb2",
  "SEAL_BENCHMARK_CLASSICAL": "730da54d26449ad674b96d99b30ed8eb400f6cd0b0f553458ed45de4cd713b1f",
  "SEAL_BENCHMARK_QUANTUM_LIMIT": "2a0b46585451a91d34ba1d7c0a7e27d2cb24c6cd6d3fa3179c5979c983190da3"
}
```

*Bản đặc tả chuẩn được xác thực và bảo hộ bởi Dự án Ngôn ngữ Lập trình Tersun.*
