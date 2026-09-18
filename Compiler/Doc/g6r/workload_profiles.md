# G6R.1 Workload Operational Profiles

Tài liệu so sánh hồ sơ hoạt động (Operational Profiles) của 4 workload chuẩn ($W1..W4$) trên hệ sinh thái Tersun VM/JIT.

---

## 1. Bảng So sánh Tổng quan Phổ Hoạt động

| Chỉ số / Đặc tính | W1 (Fibonacci) | W2 (Sieve) | W3 (Matmul) | W4 (Object) |
| :--- | :--- | :--- | :--- | :--- |
| **Đặc thù thuật toán** | Đệ quy sâu (Deep Recursion) | Mảng số học & Sàng lọc | Vòng lặp 3 cấp ($O(N^3)$) | Thao tác trường đối tượng |
| **Opcode chính** | `CALL`, `RET`, `SUB`, `ADD` | `ARRAY_GET`, `ARRAY_SET`, `CMP` | `LOAD`, `STORE`, `MUL`, `ADD` | `FIELD_GET`, `FIELD_SET`, `ALLOC` |
| **Độ sâu Call Stack** | Cực sâu ($>30$ frames) | Nông ($1$ frame) | Nông ($1$ frame) | Trung bình ($2–5$ frames) |
| **Cấp phát Heap** | 0 bytes (0 objects) | $100$ KB (1 buffer) | $240$ KB (3 buffers) | Liên tục (200k objects) |
| **Áp lực GC** | 0% (Không tham gia) | 0% (Không tham gia) | 0% (Không tham gia) | Cao (Kích hoạt minor GC) |
| **Sử dụng FlatArray** | Không | Cốt lõi (I64 FlatArray) | Cốt lõi (1D FlatArray) | Không |
| **Sử dụng Field IC** | Không | Không | Không | Cốt lõi (Monomorphic IC) |
| **Tiềm năng JIT ROI** | Rất cao ($>20\times$) | Cao ($5–10\times$) | Rất cao ($15–30\times$) | Trung bình ($3–5\times$) |
| **Khoảng cách VM vs AOT**| $100–150\times$ | $10–20\times$ | $50–100\times$ (Lớn nhất) | $15–25\times$ |

---

## 2. Phân loại Áp lực Hệ thống Con

- **W1 (Fibonacci)**: Áp lực $100\%$ tập trung vào **Call Frame Subsystem**. Mọi cải tiến về frame creation/destruction sẽ tác động trực tiếp lên W1.
- **W2 (Sieve)**: Áp lực $100\%$ tập trung vào **Array Indexing & Bounds Checking**. Kiểm chứng hoàn hảo cho khả năng tối ưu hóa mảng phẳng.
- **W3 (Matmul)**: Áp lực $100\%$ tập trung vào **Arithmetic Dispatch & Fusion Pipeline**. Phản ánh sự chênh lệch giữa CPU Vectorized Machine Code và Scalar Bytecode Interpretation.
- **W4 (Object)**: Áp lực tập trung vào **Object Layout, Shape Transitions & Dynamic Field Access**. Phản ánh hiệu năng của các tính năng động hướng đối tượng.
