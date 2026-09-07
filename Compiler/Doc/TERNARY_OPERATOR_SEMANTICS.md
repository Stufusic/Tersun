# Đặc tả Toán học Hình thức: Hệ thống Toán tử Tam phân & Số học trong Tersun (Formal Semantics Specification)

> **Mã tài liệu**: `SPEC-TERSUN-OP-1.0`  
> **Phiên bản áp dụng**: Tersun 1.0.3 $\to$ 1.0.4  
> **Trạng thái**: Bản đặc tả chuẩn (Standard Normative Specification - Revision 2)

---

## 1. Không gian Số học & Đại số Tam phân Cân bằng (Balanced Ternary Space)

### 1.1. Tập giá trị Trit đơn vị
Một **trit** $t$ nhận giá trị trong tập đối xứng bậc 3:
$$\mathbb{T} = \{-1, 0, +1\}$$
Trong ký hiệu Setun: $-1 \equiv \bar{1} \equiv \text{T}$, $0 \equiv 0$, $+1 \equiv 1$.

### 1.2. Biểu diễn Tryte cố định độ rộng ($W$-trit Tryte)
Một **tryte** chuẩn trong Tersun có độ rộng $W = 6$ trits:
$$\mathbf{t} = (t_5, t_4, t_3, t_2, t_1, t_0) \in \mathbb{T}^6$$
với $t_0$ có trọng số $3^0 = 1$ và $t_5$ có trọng số $3^5 = 243$.

Giá trị số nguyên tương ứng $\mathcal{V}(\mathbf{t}) \in \mathbb{Z}$ được xác định bằng đa thức cơ số 3:
$$\mathcal{V}(\mathbf{t}) = \sum_{k=0}^{5} t_k \cdot 3^k$$

Khoảng giá trị nguyên biểu diễn được của tryte 6-trit là đối xứng hoàn hảo quanh 0:
$$\left[ -\frac{3^6 - 1}{2}, +\frac{3^6 - 1}{2} \right] = [-364, +364]$$
Tổng số trạng thái khả dĩ là $3^6 = 729$ giá trị.

*Hệ quả*: Không tồn tại "bit dấu" bất đối xứng như số nhị phân bù 2 (Two's Complement). Phép đổi dấu là phép toán phủ định từng trit:
$$\mathcal{V}(-\mathbf{t}) = -\mathcal{V}(\mathbf{t}) \quad \text{với } (-\mathbf{t})_k = -t_k$$

---

## 2. Đặc tả Toán tử Chia lấy dư `%` (Remainder & Modulo)

### 2.1. Ngữ nghĩa trên Số nguyên Cố định (`int` - 64-bit)
Toán tử `%` trên kiểu `int` tuân thủ chuẩn **Truncated Remainder** (đồng nhất với ISO C99 và chỉ lệnh `srem` của LLVM):

Cho $a, b \in \mathbb{Z}$ với $b \neq 0$:
$$a = q \cdot b + r \quad \text{sao cho } q = \operatorname{trunc}(a / b)$$
Khi đó:
$$r = a \% b = a - \operatorname{trunc}(a / b) \cdot b$$

**Quy tắc dấu**:
- Dấu của phần dư $r$ luôn trùng với dấu của số bị chia $a$ (hoặc bằng $0$).
- Ví dụ kiểm chuẩn:
  $$7 \% 3 = 1, \quad (-7) \% 3 = -1, \quad 7 \% (-3) = 1, \quad (-7) \% (-3) = -1$$

### 2.2. Ngữ nghĩa trên Kiểu Tam phân Cố định (`tryte` - 6-trit)
Toán tử `%` giữa hai toán hạng `tryte` được định nghĩa thông qua giá trị số nguyên cân bằng (numeric value remainder):
$$\mathbf{a} \% \mathbf{b} = \operatorname{tryte}(\mathcal{V}(\mathbf{a}) \% \mathcal{V}(\mathbf{b}))$$

**Định lý Bảo toàn Miền giá trị (Range Invariant Theorem)**:
> Với mọi $\mathbf{a}, \mathbf{b} \in \mathbb{T}^6$ với $\mathcal{V}(\mathbf{b}) \neq 0$:
> Giá trị phần dư $r = \mathcal{V}(\mathbf{a}) \% \mathcal{V}(\mathbf{b})$ luôn thỏa mãn:
> $$|r| < |\mathcal{V}(\mathbf{b})| \le 364 \implies r \in [-363, +363] \subset [-364, +364]$$
> *Chứng minh*: Theo tính chất của phép chia lấy dư cụt (truncated remainder), phần dư nghiêm ngặt nhỏ hơn độ lớn số chia. Vì $|\mathcal{V}(\mathbf{b})| \le 364$, phần dư tối đa là 363, hoàn toàn nằm trọn vẹn trong khoảng biểu diễn của tryte 6-trit.
> *Hệ quả*: Phép chia lấy dư trên `tryte` **không bao giờ bị tràn số (overflow)** và không làm mất độ chính xác.

### 2.3. Xử lý Biên Bắt buộc: Zero-Check Guard & Signed Integer Overflow
Trong chuẩn phần cứng x86-64 và LLVM IR:
1. `b == 0`: Phép toán chia cho 0 gây ra Hardware Exception (`#DE`) hoặc LLVM UB.
2. `a == INT64_MIN && b == -1`: Trong hệ bù 2, thương $\operatorname{INT64\_MIN} / -1 = 2^{63}$ vượt quá `INT64_MAX`, gây tràn số phần cứng trên x86 `idiv` và LLVM UB.

**Hợp đồng Thực thi (Execution Contract)**:
Trước mọi phép tính `a % b`, runtime và compiler bắt buộc phải bảo vệ:
$$\begin{cases}
\text{if } b == 0 &\implies \mathbf{trap}(\text{DivisionByZeroException}) \\
\text{if } a == \text{INT64\_MIN} \land b == -1 &\implies \text{return } 0
\end{cases}$$
- **Trên VM**: Ném ngoại lệ `VMException("Division by zero in integer modulo.")` bắt được qua `try / catch`.
- **Trên LLVM IR & Native**: Chèn basic-block guard kiểm tra cả hai điều kiện trên trước khi phát chỉ lệnh `srem i64`.

---

## 3. Đặc tả Toán tử Logic & Dịch Trit trên Kiểu Tam phân (`tryte`)

### 3.1. Phép toán Logic Kleene theo từng Trit (Tritwise Kleene Logic)
Logic tam phân cân bằng tuân thủ **Đại số Kleene 3 giá trị**:

1. **Toán tử `&` (Tritwise Kleene Min / AND)**:
   $$(\mathbf{a} \mathbin{\&} \mathbf{b})_k = \min(a_k, b_k) \quad \forall k \in [0, 5]$$
   Bảng chân trị:
   | $a_k \backslash b_k$ | $\mathbf{-1}$ | $\mathbf{0}$ | $\mathbf{+1}$ |
   | :---: | :---: | :---: | :---: |
   | $\mathbf{-1}$ | $-1$ | $-1$ | $-1$ |
   | $\mathbf{0}$ | $-1$ | $0$ | $0$ |
   | $\mathbf{+1}$ | $-1$ | $0$ | $+1$ |

2. **Toán tử `|` (Tritwise Kleene Max / OR)**:
   $$(\mathbf{a} \mid \mathbf{b})_k = \max(a_k, b_k) \quad \forall k \in [0, 5]$$
   Bảng chân trị:
   | $a_k \backslash b_k$ | $\mathbf{-1}$ | $\mathbf{0}$ | $\mathbf{+1}$ |
   | :---: | :---: | :---: | :---: |
   | $\mathbf{-1}$ | $-1$ | $0$ | $+1$ |
   | $\mathbf{0}$ | $0$ | $0$ | $+1$ |
   | $\mathbf{+1}$ | $+1$ | $+1$ | $+1$ |

3. **Toán tử `~` (Tritwise Inversion / NOT)**:
   $$(\sim \mathbf{a})_k = -a_k \quad \forall k \in [0, 5]$$

---

### 3.2. Toán tử `^`: Phép cộng GF(3) không nhớ (Tritwise GF(3) Addition)

Tersun định nghĩa toán tử `^` trên `tryte` là **Phép cộng Trường hữu hạn $\mathbb{F}_3$ không nhớ (Uncarried GF(3) Addition)**:
Đồng cấu với nhóm cyclic $(\mathbb{Z}_3, +)$ với ánh xạ đẳng cấu:
$$\phi: \mathbb{T} \to \mathbb{Z}_3, \quad \phi(0) = 0, \quad \phi(1) = 1, \quad \phi(-1) = 2$$
Phép cộng trit được định nghĩa:
$$a_k \oplus_3 b_k = \phi^{-1}\left( (\phi(a_k) + \phi(b_k)) \pmod 3 \right)$$

**Bảng Chân trị Chính thức của `^` trên Trit**:
| $a_k \backslash b_k$ | $\mathbf{-1}$ | $\mathbf{0}$ | $\mathbf{+1}$ | Giải thích toán học |
| :---: | :---: | :---: | :---: | :--- |
| $\mathbf{-1}$ | $\mathbf{+1}$ | $-1$ | $0$ | $(-1) + (-1) = -2 \equiv +1 \pmod 3$ |
| $\mathbf{0}$ | $-1$ | $0$ | $+1$ | Phần tử trung hòa (Neutral element) |
| $\mathbf{+1}$ | $0$ | $+1$ | $\mathbf{-1}$ | $(+1) + (+1) = +2 \equiv -1 \pmod 3$ |

> **Ghi chú Thuật ngữ**:
> Trên kiểu số nguyên 64-bit `int`, `^` là phép toán **Bitwise XOR nhị phân chuẩn**.  
> Trên kiểu `tryte`, `^` là phép toán **Tritwise GF(3) Addition**.

---

### 3.3. Đặc tả Toán tử Dịch Trit (`<<` và `>>`)

Xét tryte $\mathbf{t} = (t_5, t_4, t_3, t_2, t_1, t_0)$ độ rộng cố định $W = 6$ trits. Tham số dịch $k \in \mathbb{Z}$:
- Nếu $k < 0 \implies \mathbf{trap}(\text{InvalidShiftCountException})$.
- Nếu $k \ge 6 \implies$ trả về tryte $0 = (0, 0, 0, 0, 0, 0)$.
- Nếu $k == 0 \implies$ trả về nguyên vẹn tryte $\mathbf{t}$.

#### 1. Dịch trái (`t << k`):
Các trit dịch về phía trọng số cao hơn $k$ vị trí; $k$ trit cao nhất bị loại bỏ (truncation modulo $3^6$); $k$ vị trí thấp trống được điền bằng **trit $0$**:
$$(\mathbf{t} \ll k)_i = \begin{cases} t_{i-k} & \text{nếu } i \ge k \\ 0 & \text{nếu } i < k \end{cases}$$

#### 2. Dịch phải (`t >> k`):
Các trit dịch về phía trọng số thấp hơn $k$ vị trí; $k$ trit thấp nhất bị loại bỏ; $k$ vị trí cao trống được điền bằng **trit $0$**:
$$(\mathbf{t} \gg k)_i = \begin{cases} t_{i+k} & \text{nếu } i + k < 6 \\ 0 & \text{nếu } i + k \ge 6 \end{cases}$$

**Chứng minh Tính đồng nhất giữa Logical Shift và Arithmetic Shift trong Hệ Tam phân Cân bằng**:
> Trong hệ nhị phân bù 2, số âm bắt đầu bằng bit 1, do đó dịch phải số học (Arithmetic Shift Right) bắt buộc phải độn bit dấu 1 để bảo toàn dấu âm.  
> **Ngược lại, trong hệ tam phân cân bằng, trit $0$ chính là gốc tọa độ đối xứng (Neutral Element).** Bản thân các trit âm $\bar{1}$ đã mang dấu âm nội tại ở các trọng số của chúng.
> 
> *Ví dụ*:
> - Xét số âm $-9 = (0, 0, \bar{1}, 0, 0)_3$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, \bar{1}, 0)_3 = -3 = -9 / 3$. Dấu âm và tỷ lệ chia được bảo toàn hoàn hảo.
> - Xét số $14 = (0, 0, 1, \bar{1}, \bar{1}, \bar{1})_3 = 27 - 9 - 3 - 1 = 14$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, 1, \bar{1}, \bar{1})_3 = 9 - 3 - 1 = 5 \approx 14 / 3$.
> - Xét số $-14 = (0, 0, \bar{1}, 1, 1, 1)_3 = -14$. Dịch phải 1 trit điền $0$ cho ra $(0, 0, 0, \bar{1}, 1, 1)_3 = -5 \approx -14 / 3$.
>
> Nếu độn trit dấu $\bar{1}$ vào vị trí cao nhất $t_5$, giá trị sẽ bị cộng thêm $-1 \times 3^5 = -243$, làm biến dạng hoàn toàn giá trị số học.  
> Do đó, trong hệ tam phân cân bằng: **Phép dịch phải số học và phép dịch phải logic là một, và luôn điền trit $0$**. Phép toán này tương đương với phép chia làm tròn cân bằng:
> $$\mathcal{V}(\mathbf{t} \gg k) = \left\lfloor \frac{\mathcal{V}(\mathbf{t})}{3^k} \right\rceil$$

---

## 4. Đặc tả Hàm Thời gian Đơn điệu (`monotonic_now_us`)

- **Bản chất Clock**: Sử dụng `std::chrono::steady_clock` (tương đương `CLOCK_MONOTONIC` trên POSIX hoặc `QueryPerformanceCounter` trên Windows).
- **Tính chất Đảm bảo**: **Monotonic Non-Decreasing** (Đơn điệu không giảm):
  $$\forall t_2 > t_1 \implies \text{monotonic\_now\_us}(t_2) \ge \text{monotonic\_now\_us}(t_1)$$
- **Đơn vị**: Microseconds ($\mu s$).
- **API Surface**:
  - Tên chuẩn: `monotonic_now_us()`
  - Tên alias tương thích ngược: `time_now_us()`
  - Hiện diện đồng bộ 100% trên: VM (`OP_TIME_NOW_US`), LLVM AOT (`@tersun_monotonic_now_us`), và C Transpiler.

---

## 5. Ma trận Kiểm định Toàn diện (Exhaustive Verification Matrix)

Để đạt tính chuẩn xác khoa học tuyệt đối, toàn bộ không gian trạng thái của `tryte` 6-trit ($3^6 = 729$ giá trị) sẽ được kiểm thử vét cạn (exhaustive verification) xuyên suốt các backend:

| Hạng mục kiểm thử | Không gian kiểm thử | Số trường hợp | Tiêu chuẩn kiểm định chéo |
| :--- | :--- | :---: | :--- |
| **`tryte & tryte`** (Kleene Min) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte \| tryte`** (Kleene Max) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte ^ tryte`** (GF(3) Add) | Toàn bộ cặp $(a, b) \in \mathbb{T}^6 \times \mathbb{T}^6$ | $729 \times 729 = \mathbf{531,441}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Ref Truth Table}$ |
| **`tryte % tryte`** (Modulo) | Toàn bộ cặp với $b \neq 0$ | $729 \times 728 = \mathbf{530,712}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Truncated Mod}$ |
| **`tryte << k`** (Shift Left) | Mọi $a \in \mathbb{T}^6$, $k \in [0, 6]$ | $729 \times 7 = \mathbf{5,103}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Trit Shift Def}$ |
| **`tryte >> k`** (Shift Right) | Mọi $a \in \mathbb{T}^6$, $k \in [0, 6]$ | $729 \times 7 = \mathbf{5,103}$ | $\text{VM} \equiv \text{Native AOT} \equiv \text{Trit Shift Def}$ |
| **Edge Case Division** | $b == 0$ và $\text{INT64\_MIN} \% -1$ | Matrix biên | Trap ném ngoại lệ nhất quán |

Tổng cộng hơn **2,100,000 phép toán kiểm định vét cạn** bảo chứng tính tương đương ngữ nghĩa 100% giữa VM, LLVM AOT và C Transpiler.
