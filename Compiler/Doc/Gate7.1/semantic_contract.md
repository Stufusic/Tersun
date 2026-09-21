# Gate 7.1 Semantic Contract Specification

```text
Document ID:      CONTRACT-G7.1-SEMANTICS-20260921
Status:           FROZEN & IMMUTABLE
Scope:            Cross-Architecture Invariant Definitions for Tersun AI Compute
Targets:          x86-64, ARM64 (AArch64), RISC-V64, Edge Static Profile
```

---

## 1. Packed Ternary Domain & Layout Contract

### 1.1 Miền Giá Trị Tam Phân (Ternary Domain)
Mọi trọng số BitNet tam phân chỉ nhận các giá trị thuộc tập:
$$\mathcal{T} = \{-1, 0, +1\}$$

### 1.2 Quy Chuẩn Đóng Gói (PackedTernaryLayout v1)
* **Tỷ lệ nén**: 2 bits trên 1 trit (4 trits đóng gói trong 1 byte).
* **Bảng mã hóa 2-bit**:
  - `00_2` (0x0) : Trit mang giá trị $0$.
  - `01_2` (0x1) : Trit mang giá trị $+1$.
  - `10_2` (0x2) : Trit mang giá trị $-1$.
  - `11_2` (0x3) : Giá trị dự trữ (Reserved) / Phần tử đệm (Padding).
* **Trật tự đóng gói (Little-Endian Trit Order)**:
  Trong một byte nhị phân $B = [b_7 b_6 b_5 b_4 b_3 b_2 b_1 b_0]$:
  $$\begin{aligned}
  \text{Trit 0 (Offset 0)} &= (B \gg 0) \ \& \ 0\text{b}11 \\
  \text{Trit 1 (Offset 1)} &= (B \gg 2) \ \& \ 0\text{b}11 \\
  \text{Trit 2 (Offset 2)} &= (B \gg 4) \ \& \ 0\text{b}11 \\
  \text{Trit 3 (Offset 3)} &= (B \gg 6) \ \& \ 0\text{b}11
  \end{aligned}$$
* **Quy tắc Padding**:
  Nếu số chiều $K$ không chia hết cho 4, các trit vượt quá phạm vi $K$ trong byte cuối cùng phải được đệm bằng mã `00_2` hoặc `11_2`. Vi nhân tính toán phải tuân thủ nghiêm ngặt chiều dài hữu hiệu $K$, không được đọc hoặc cộng dồn các trit đệm này.

---

## 2. Hợp Đồng Tích Lũy Số Nguyên (Integer Accumulation Contract)

### 2.1 Không Tràn Số (No-Overflow Bound Formula)
Với mọi phép toán nhân-cộng ma trận tam phân (Ternary GEMV / GEMM), giá trị tích lũy cục bộ phải thỏa mãn bất đẳng thức an toàn:
$$\text{max\_abs\_acc} = K \times \max(|X|) \times \max(|W|) + \max(|B|) \le \text{INT32\_MAX} = 2,147,483,647$$

* Đối với BitNet MNIST tham chiếu ($K=784$, activation $X \in [-128, 127]$, $W \in \{-1, 0, 1\}$, bias $B \in [-1000, 1000]$):
  $$\text{max\_abs\_acc} = 784 \times 128 \times 1 + 1000 = 101,352 \ll 2^{31} - 1$$
  Tích lũy trong kiểu dữ liệu `int32_t` được chứng minh toán học là **tuyệt đối an toàn, không bao giờ xảy ra tràn số nguyên**.
* Nếu mô hình trong tương lai có $\text{max\_abs\_acc} > \text{INT32\_MAX}$, runtime sẽ tự động chuyển sang contract tích lũy `int64_t` tại tầng Tensor IR.

### 2.2 Tính Toán Không Nhân (Multiplication-Free Semantics)
Vì $W \in \{-1, 0, +1\}$, phép tính $X \times W$ quy về:
$$X \times W = \begin{cases}
+X & \text{nếu } W = +1 \\
0  & \text{nếu } W = 0 \\
-X & \text{nếu } W = -1
\end{cases}$$
Mọi backend (Scalar, AVX2, NEON) đều phải thay thế phép nhân bằng các lệnh cộng (`add`/`vaddq_s32`) và trừ (`sub`/`vsubq_s32`) vector có điều kiện.

---

## 3. Phân Định Miền Ngữ Nghĩa (Exact vs Tolerance Domains)

Hệ thống phân định nghiêm ngặt 2 miền đánh giá:

### 3.1 Miền Chính Xác Tuyệt Đối (Exact Domain — 100% Bit-Exact)
Áp dụng cho:
* Dữ liệu nhị phân đã serialize (SafeTensors byte stream).
* Mảng trọng số nén `PackedTernaryLayout v1`.
* Toàn bộ phép tích lũy số nguyên (K2 Dot product, K3 GEMV, phần số nguyên của K5/K6).
* Nhãn phân loại dự đoán đầu ra (`ArgMax` predicted class index).
* Bộ đếm cấp phát bộ nhớ (`AllocationProbe` count = 0).

*Yêu cầu*: Mọi backend trên mọi kiến trúc CPU (x86_64, ARM64, RISC-V64) phải cho ra kết quả khớp chính xác 100% từng bit. Sai lệch dù chỉ 1 bit cũng bị tính là lỗi ngữ nghĩa (Failure Class `F1_SEMANTIC_MISMATCH`).

### 3.2 Miền Dung Sai (Tolerance Domain)
Áp dụng cho các bước xử lý số thực dấu phẩy động (nếu có, ví dụ RMSNorm, Dequantization scaling factor $S$):
* **Sai số tuyệt đối (Absolute Tolerance)**: $\epsilon_{abs} \le 10^{-5}$.
* **Sai số tương đối (Relative Tolerance)**: $\epsilon_{rel} \le 10^{-4}$.

---

## 4. Hợp Đồng Thứ Tự Byte (Endianness Contract)

* **Quy chuẩn lưu trữ (Wire Format)**: Toàn bộ header SafeTensors (8-byte unsigned integer) và payload nhị phân được chuẩn hóa theo **Little-Endian**.
* **Xử lý đa nền tảng**: Runtime nạp và đọc trực tiếp theo cấu trúc byte little-endian (`b0 | b1<<8 | b2<<16 ...`), không phụ thuộc ngầm vào endianness tự nhiên của CPU host.
* **Kiểm tra máy chủ (Host Check)**: Runtime chủ động kiểm tra endianness tại startup. Nếu chạy trên host Big-Endian, runtime tự động thực hiện byte-swapping để duy trì ngữ nghĩa thống nhất.

---

## 5. Hợp Đồng Quản Lý Bộ Nhớ Biên (Edge Static Arena Contract)

* **Khung ngân sách chuẩn hóa**: `128 KB`, `256 KB`, `512 KB`, `1 MB`.
* **Căn chỉnh bộ nhớ (Alignment)**: Căn chỉnh cố định 64 bytes (`alignas(64)`) cho mọi buffer activation và weights để tối ưu hóa SIMD cacheline.
* **Mô hình lỗi không Exception (Status Code Error Model)**:
  Khi bộ nhớ vượt quá ngân sách chỉ định, hệ sinh thái lõi trả về mã lỗi:
  $$\text{StatusCode::ArenaBudgetExceeded} = 101$$
  tuyệt đối không âm thầm gọi `malloc`, không gây phân mảnh heap và không làm crash tiến trình.
* **Hợp đồng suy luận ổn định (Steady-State Forward Contract)**:
  Trong suốt quá trình thực thi hàm `forward()`:
  $$\text{malloc} = 0, \quad \text{free} = 0, \quad \text{new} = 0, \quad \text{delete} = 0$$
