# W3 (Matmul) — Vectorization Legality & Opportunity Analysis

Tài liệu thẩm định tính hợp pháp của Vector hóa (Vectorization Legality Report)  
Theo quy chuẩn: **Mục 6 tài liệu Doc/G6.2.md**  
Đối tượng phân tích: Vòng lặp tính toán nhân ma trận trong `benchmarks/forensics/inputs/w3_matmul.stn`

---

## 1. Cấu trúc Vòng lặp Phân tích

```ternary
for i in range(n) {
    for k in range(n) {
        let a_val = A[i * n + k];
        for j in range(n) {
            let c_idx = i * n + j;
            let b_idx = k * n + j;
            C[c_idx] += a_val * B[b_idx];
        }
    }
}
```

Mục tiêu phân tích: Vòng lặp trong cùng (Vòng lặp $j$, với $0 \le j < n$, $n = 100$).

---

## 2. Thẩm định 6 Tiêu chí Hợp pháp (Legality Criteria)

| Tiêu chí Kiểm tra | Hiện trạng trong W3 | Đánh giá Trình biên dịch | Kết luận Hợp pháp |
| :--- | :--- | :--- | :---: |
| **1. Loop-Carried Dependency** | Mỗi bước lặp $j$ truy cập và ghi vào vị trí $C[i \cdot n + j]$ phân biệt duy nhất. | Không có dữ liệu nào được tính ở bước $j$ được sử dụng làm đầu vào cho bước $j+1, j+2, \dots$ | **SAFE** (Độc lập hoàn toàn) |
| **2. Pointer Aliasing** | 3 mảng $A, B, C$ được khởi tạo độc lập từ 3 câu lệnh `ALLOC_ARRAY`. | Vùng nhớ của $B$ (chỉ đọc) và $C$ (đọc/ghi) không hề giao nhau hay chồng lấn con trỏ (Disjoint heaps). | **SAFE** (Không alias) |
| **3. Memory Alignment & Stride** | $C[c\_idx]$ và $B[b\_idx]$ tăng tịnh tiến theo $j$ với bước nhảy Stride = 1 phần tử (8 bytes liên tục). | Truy cập bộ nhớ hoàn toàn liên tục (Contiguous Stride-1 Access). Sử dụng lệnh vector không yêu cầu căn lề (`vmovupd`). | **SAFE** (Stride-1 tối ưu) |
| **4. Typed Element Access** | Cả 3 mảng đều là mảng thuần nhất kiểu `ArrayRep::I64` (hoặc `F64`). | Toàn bộ các phần tử lưu trữ dưới dạng số 64-bit phẳng liên tục, không xen kẽ tag hay con trỏ object. | **SAFE** (Đồng nhất kiểu dữ liệu) |
| **5. Induction Variable & Trip Count** | Biến quy nạp $j$ bắt đầu từ $0$, tăng đều đặn $+1$ mỗi bước, chặn trên cố định $j < n$ ($n = 100$). | Trip count tĩnh / chuẩn hóa: $100$ vòng lặp. $100$ chia hết cho vector width 4 ($100 = 25 \times 4$). | **SAFE** (Canonical Form hoàn hảo) |
| **6. Reduction Dependency** | Biến `a_val` được nạp ở vòng lặp ngoài $k$ và giữ nguyên giá trị (Loop-Invariant) trong suốt $100$ vòng lặp $j$. | `a_val` được broadcast vào toàn bộ 4 lanes của thanh ghi YMM (`_mm256_set1_pd` / broadcast) chỉ 1 lần duy nhất. | **SAFE** (Không có reduction bottleneck) |

---

## 3. Kiến trúc Phát sinh Mã Vector (Proposed Vector CodeGen)

Trình biên dịch Optimizing JIT sẽ biến đổi thân vòng lặp trong cùng thành:

```text
[Loop Invariant Setup]
  ymm0 = broadcast(a_val)     ; Nạp và nhân bản a_val vào cả 4 lane của ymm0

[Vector Loop (Step = 4 elements/iter)]
  j = 0 .. 96 step 4:
    ymm1 = vmovupd [B + (k*n + j)*8]   ; Nạp 4 phần tử B[k*n+j .. k*n+j+3]
    ymm2 = vmovupd [C + (i*n + j)*8]   ; Nạp 4 phần tử C[i*n+j .. i*n+j+3]
    ymm2 = vfmadd231pd ymm2, ymm1, ymm0 ; C += a_val * B (4 phép tính FMA song song trong 1 chu kỳ!)
    vmovupd [C + (i*n + j)*8], ymm2    ; Ghi ngược lại 4 phần tử C
    j += 4

[Remainder Scalar Loop]
  j = 96 .. 100: (Nếu N không chia hết cho 4, xử lý nốt phần dư bằng scalar loop)
```

---

## 4. Kết luận Pháp y

- **Tình trạng khả thi**: **VECTORIZABLE (100% Khả thi)**.
- Không tồn tại bất kỳ rào cản phụ thuộc dữ liệu hay rào cản bộ nhớ nào cản trở việc vector hóa vòng lặp $j$ của W3.
- Ước tính sau khi triển khai AVX2 FMA: Giảm số lệnh thực thi vòng lặp từ $1,000,000$ lệnh vô hướng xuống $250,000$ lệnh vector 256-bit, đưa runtime từ $16.22$ ms $\rightarrow \le 5.50$ ms.
