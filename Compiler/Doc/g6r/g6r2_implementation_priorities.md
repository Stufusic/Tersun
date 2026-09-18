# G6R.2 Implementation Priorities Roadmap

Bản đồ định hướng triển khai kỹ thuật cho Gate 6 Rebuild 2 (G6R.2) được xây dựng hoàn toàn từ số liệu thực nghiệm pháp y và chứng minh nhân quả của G6R.1.

---

## 1. Nguyên tắc Chuyển giao sang G6R.2
1. **Không tối ưu chung chung**: Tuyệt đối không đưa ra các mục tiêu mơ hồ như "tối ưu hóa VM" hay "làm cho nhanh hơn". Mọi đầu việc phải chỉ rõ subsystem, hành động kỹ thuật, và metric dịch chuyển dự kiến.
2. **Causal-First**: Chỉ đầu tư công sức vào các subsystem đã có bằng chứng `CONFIRMED` gây ra khoảng cách hiệu năng lớn trong G6R.1.
3. **Reconciled Budget**: Mỗi cải tiến phải có mục tiêu giảm thời gian cụ thể dựa trên ngân sách chênh lệch thực tế giữa VM/JIT và Native AOT.

---

## 2. Danh mục Ưu tiên Kỹ thuật (P0 / P1 / P2)

### 🔴 ƯU TIÊN P0 (Bắt buộc giải quyết trước tiên)

#### P0.1: SIMD Vectorization & Loop Tiling cho W3 (Matmul)
- **Căn cứ G6R.1**: Khoảng cách W3 JIT ($16.22$ ms) so với Native AOT ($4.43$ ms) gấp $3.66\times$. Native AOT sử dụng AVX2 FMA 256-bit (4 doubles mỗi lệnh), trong khi JIT hiện tại chỉ sinh scalar x86-64. Thí nghiệm $E1$ cũng chứng minh Dispatch Mode thuần tiêu tốn tới $283$ ms.
- **Hành động Kỹ thuật cụ thể**:
  1. Thêm pass **Loop Vectorization (AVX2)** trong Tier-2 Optimizing JIT cho các vòng lặp tính toán mảng phẳng 1D có stride cố định.
  2. Bật **Register-Resident FMA Accumulator**: giữ biến `sum` trong thanh ghi vector `ymm0` thay vì đọc/ghi lại qua stack frame.
- **Dịch chuyển Metric Dự kiến**:
  - `W3 JIT execution_ms`: $\downarrow$ từ $16.22$ ms xuống $\le 5.50$ ms.
  - Tỷ lệ chênh lệch JIT vs Native AOT: $\downarrow$ từ $3.66\times$ xuống $\le 1.25\times$.

#### P0.2: Stack Frame Allocation Recycling Pool cho W1 (Fibonacci)
- **Căn cứ G6R.1**: W1 thực hiện $2,692,538$ calls trong Interpreter ($398.70$ ms) với tỷ lệ $22.5$ opcodes / call. Chi phí cấp phát và giải phóng context frame chi phối hoàn toàn runtime.
- **Hành động Kỹ thuật cụ thể**:
  1. Thay thế việc cấp phát frame động trong Interpreter bằng **Fixed-Depth Pre-allocated Frame Ring Buffer** cho recursion.
  2. Bổ sung **Tail-Call Elimination & Self-Recursion Inlining** trong JIT compiler: tự động chuyển đổi đệ quy đuôi thành vòng lặp while.
- **Dịch chuyển Metric Dự kiến**:
  - `W1 Interpreter execution_ms`: $\downarrow$ từ $251.77$ ms xuống $\le 120.0$ ms.
  - `W1 JIT execution_ms`: $\downarrow$ từ $14.07$ ms xuống $\le 4.50$ ms.

#### P0.3: Escape Analysis & Scalar Replacement cho W4 (Object)
- **Căn cứ G6R.1**: W4 Native AOT đạt tốc độ cực đỉnh $0.57$ ms (nhanh gấp $27\times$ so với JIT $15.33$ ms và gấp $485\times$ so với Interpreter $276.62$ ms). Bằng chứng giải mã AOT cho thấy LLVM đã triệt tiêu hoàn toàn $200k$ heap allocations và đưa các trường `x, y` vào thanh ghi `eax, edx` (Scalar Replacement of Aggregates).
- **Hành động Kỹ thuật cụ thể**:
  1. Thêm thuật toán **Escape Analysis** trong IR Optimizer: xác định các object chỉ tồn tại cục bộ trong hàm/vòng lặp.
  2. Áp dụng **Scalar Replacement**: thay thế con trỏ object bằng các biến nguyên/thực cục bộ (SSA Virtual Registers), loại bỏ hoàn toàn lệnh `ALLOC` và `FIELD_GET/SET`.
- **Dịch chuyển Metric Dự kiến**:
  - `W4 object_alloc_count`: $\downarrow$ từ $200,000$ xuống $0$.
  - `W4 JIT execution_ms`: $\downarrow$ từ $15.33$ ms xuống $\le 1.80$ ms.

---

### 🟡 ƯU TIÊN P1 (Ảnh hưởng Đáng kể)

#### P1.1: Loop Invariant Bounds Check Elimination (BCE) cho W2 (Sieve)
- **Căn cứ G6R.1**: W2 thực hiện hàng trăm nghìn lần ghi mảng với bước nhảy cố định. Mọi thao tác đều phải qua kiểm tra biên an toàn.
- **Hành động Kỹ thuật cụ thể**:
  1. Thêm pass phân tích khoảng giá trị (Range Analysis) trong CFG loop header: kiểm tra điều kiện $N < \text{length}$ trước khi vào vòng lặp và dỡ bỏ checks trong thân vòng lặp.
- **Dịch chuyển Metric Dự kiến**:
  - `bounds_check_count`: $\downarrow$ $85\%$.
  - `W2 JIT execution_ms`: $\downarrow$ từ $14.93$ ms xuống $\le 4.50$ ms.

---

### 🟢 ƯU TIÊN P2 (Tối ưu hóa Vi mô)

#### P2.1: Direct Bytecode Superinstruction Packing
- Đóng gói bytecode 2-byte trực tiếp vào stream cho các mẫu siêu lệnh phổ biến (`OP_LOAD_LOCAL_FAST`, `OP_STORE_POP_FAST`) để giảm footprint kích thước bytecode cache.
