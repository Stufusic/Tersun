# G6R.1 Root-Cause Matrix

Bảng ma trận nguyên nhân gốc rễ giải phẫu hiệu năng Tersun VM & JIT trên 4 workload chuẩn ($W1..W4$).

> [!NOTE]
> Mọi giả thuyết chỉ được gán một trong 4 trạng thái chuẩn:
> - `CONFIRMED`: Có bằng chứng counter định lượng và thực nghiệm A/B chứng minh tính nhân quả (Causality).
> - `PROBABLE`: Có số liệu counter tương quan rõ nét nhưng cần thêm kiểm chứng cách ly.
> - `INCONCLUSIVE`: Số liệu chưa hội tụ hoặc bị nhiễu do yếu tố ngoại cảnh.
> - `REJECTED`: Thực nghiệm chứng minh giả thuyết không ảnh hưởng đáng kể đến khoảng cách hiệu năng.

---

## 1. Bảng Tổng hợp Nguyên nhân Gốc rễ

| Workload | Suspect ID | Nghi vấn Kỹ thuật | Trạng thái (Status) | Bằng chứng Thực nghiệm (Evidence) | Mức độ Ưu tiên |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **W1 (Fibonacci)** | R3 | Overhead tạo và hủy call frame ngăn xếp | **CONFIRMED** | $2.69 \times 10^6$ calls, frame alloc/destroy dominates runtime | **P0** |
| **W1 (Fibonacci)** | R8 | JIT Compile Tax vs Runtime ROI | **PROBABLE** | Compile time bù trừ một phần chi phí đệ quy sâu | **P1** |
| **W1 (Fibonacci)** | R7 | Áp lực Garbage Collector | **REJECTED** | 0 heap allocation trong hot loop Fibonacci, GC = 0 ms | N/A |
| **W2 (Sieve)** | R4 | Tỷ lệ Generic Array truy cập chậm | **CONFIRMED** | FlatArray I64 mang lại tăng tốc vượt trội so với Generic Boxed | **P0** |
| **W2 (Sieve)** | R4-B | Chưa triệt tiêu Bounds Check trong vòng lặp sàng | **PROBABLE** | Mỗi lần gán phần tử đều kiểm tra biên mảng | **P1** |
| **W2 (Sieve)** | R7 | Áp lực Garbage Collector | **REJECTED** | Mảng boolean/int cố định, 0 allocation trong sàng nguyên tố | N/A |
| **W3 (Matmul)** | R1 | Opcode Dispatch Volume quá lớn | **CONFIRMED** | Số lượng opcode dispatch áp đảo so với thao tác số học thuần | **P0** |
| **W3 (Matmul)** | R5 | Đứt gãy pipeline phát sinh/thực thi Fusion | **CONFIRMED** | Candidates $\rightarrow$ Emitted $\rightarrow$ Executed mismatch | **P0** |
| **W3 (Matmul)** | R2 | Top-of-Stack (TOS) cache hit rate | **PROBABLE** | Thao tác stack spill/reload làm tăng memory bus overhead | **P1** |
| **W3 (Matmul)** | R6 | Overhead đối tượng & Inline Cache | **REJECTED** | Matmul thao tác trên mảng 1D thuần, IC không tham gia | N/A |
| **W4 (Object)** | R6 | Field Inline Cache (IC) hit rate & miss handling | **CONFIRMED** | IC Enabled vs Disabled tạo phân hóa hiệu năng rõ rệt | **P0** |
| **W4 (Object)** | R7 | Tần suất cấp phát đối tượng trên Heap | **PROBABLE** | Tốc độ cấp phát 200k objects gây áp lực GC cycle | **P1** |
| **W4 (Object)** | R4 | Data Specialization mảng | **REJECTED** | W4 là benchmark thuộc tính đối tượng, không dùng mảng | N/A |

---

## 2. Tiêu chuẩn Phân loại Ưu tiên (Triage Criteria)

- **P0**: Cần xử lý trực tiếp tại G6R.2 vì đây là nguyên nhân nhân quả then chốt (Primary Root Cause) gây ra trên 50% khoảng cách VM ↔ AOT.
- **P1**: Ảnh hưởng đáng kể (Secondary Cause), cần xử lý tiếp sau P0 để tối ưu hóa triệt để.
- **P2**: Tối ưu hóa vi mô phụ, không phải nút thắt cổ chai chính.
