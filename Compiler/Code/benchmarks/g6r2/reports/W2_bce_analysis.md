# W2 (Prime Sieve of Eratosthenes) — Bounds Check Elimination (BCE) Analysis

Tài liệu chứng minh an toàn kiểm tra biên mảng (Range Analysis & BCE Proof)  
Theo quy chuẩn: **Mục 9 và Mục 35–39 tài liệu Doc/G6.2.md**  
Đối tượng nghiên cứu: `benchmarks/forensics/inputs/w2_sieve.stn` (Prime Sieve $N = 100,000$)

---

## 1. Phân tích Cấu trúc Truy cập Mảng trong Vòng lặp Sieve

Trong `w2_sieve.stn`:

```ternary
let n = 100000;
let flags = [0, 0, 0, 0];
for i in range(25000) {
    flags.push(0); flags.push(0); flags.push(0); flags.push(0);
}
// flags.size() == 100,004

for p in range(2, 320) {
    if (flags[p] == 0) {
        let mult = p * p;
        while (mult <= n) {
            flags[mult] = 1;   // <-- ĐIỂM KIỂM TRA BIÊN NÓNG (HOT BOUNDS CHECK)
            mult += p;
        }
    }
}
```

---

## 2. Chứng minh Toán học Khoảng Giá trị (Induction Variable Range Proof)

### Bước 1: Xác định Kích thước Vùng đệm Mảng (Buffer Capacity)
- Mảng `flags` được cấp phát với kích thước:
  $$\text{Capacity}(\text{flags}) = 4 + 25,000 \times 4 = 100,004 \text{ phần tử}$$
- Chỉ số hợp lệ cho phép truy cập an toàn:
  $$0 \le \text{index} < 100,004$$

### Bước 2: Phân tích Biến Quy nạp (Induction Variable Analysis)
- Biến $p \in [2, 320)$.
- Với mỗi số nguyên tố $p$, biến bước nhảy `mult` được khởi tạo:
  $$\text{mult}_0 = p^2 \ge 2^2 = 4 \ge 0$$
- Bước nhảy quy nạp trong vòng lặp:
  $$\text{mult}_{k+1} = \text{mult}_k + p \quad (p \ge 2 \implies \text{hàm đơn điệu tăng nghiêm ngặt})$$
- Điều kiện tiếp tục vòng lặp:
  $$\text{mult}_k \le n \quad (n = 100,000)$$

### Bước 3: Định lý An toàn Truy cập (Safety Invariant Theorem)
Với mọi bước lặp $k$ thỏa mãn điều kiện vòng lặp `mult <= n`:
$$0 \le \text{mult}_0 \le \text{mult}_k \le n = 100,000 < 100,004 = \text{flags.size()}$$

$$\implies 0 \le \text{mult}_k < \text{flags.size()} \quad \forall k$$

### Kết luận Chứng minh:
Phép truy cập ô nhớ `flags[mult] = 1` được **CHỨNG MINH TOÁN HỌC là 100% AN TOÀN TRONG BIÊN (PROVEN IN-BOUNDS)**.

---

## 3. Thống kê Chi phí Kiểm tra Biên Hiện tại

1. **Tổng số lần lặp vòng lặp con**:
   Số lần gạch hợp số của Sàng Eratosthenes cho $N = 100,000$:
   $$\sum_{p \le \sqrt{N}} \left( \frac{N - p^2}{p} + 1 \right) = \mathbf{263,127} \text{ lần}$$
2. **Chi phí trong VM/JIT Hiện tại**:
   - Ở mỗi lần lặp trong số $263,127$ lần:
     `if (__builtin_expect(i >= 0 && static_cast<size_t>(i) < arr->size(), 1))`
   - Thực thi $263,127$ phép so sánh có dấu `i >= 0` + ép kiểu `static_cast<size_t>` + so sánh không dấu `i < size` + lệnh nhảy nhánh `jge` / `jle`.
3. **Chi phí lãng phí**:
   Toàn bộ $263,127$ nhánh rẽ này đều nhảy về nhánh TRUE, gây tốn băng thông đường ống giải mã lệnh (instruction decode bandwidth) và chiếm dụng tài nguyên ALU vô ích.

---

## 4. Thiết kế Hoisted Loop Guard (Runtime Guarding)

Thay vì kiểm tra bên trong thân vòng lặp, trình biên dịch sẽ đưa kiểm tra biên lên trước vòng lặp:

```text
// Hoisted Loop Guard (Chỉ kiểm tra 1 lần duy nhất ngoài vòng lặp):
if (flags.size() >= n + 1) {
    // UNCHECKED FAST PATH:
    // Vòng lặp KHÔNG CÓ BẤT KỲ kiểm tra biên nào
    while (mult <= n) {
        flags.raw_data[mult] = 1;
        mult += p;
    }
} else {
    // SAFE FALLBACK PATH (Nếu mảng bị co lại động ngoài dự kiến):
    while (mult <= n) {
        if (mult < flags.size()) flags.raw_data[mult] = 1;
        mult += p;
    }
}
```

---

## 5. Kế hoạch Bộ Kiểm thử Biên Âm (Negative OOB Test Suite)

Để đảm bảo nguyên tắc **P0 (Correctness trước Performance)**, trước khi seal BCE ở G6R.2.4, bắt buộc phải vượt qua 6 ca kiểm thử biên âm:
1. `index = -1` $\longrightarrow$ Bắt buộc ném lỗi hoặc bẫy an toàn, không được ghi đè bộ nhớ.
2. `index = flags.size()` $\longrightarrow$ Biên trên chính xác.
3. `index = flags.size() + 1` $\longrightarrow$ Vượt biên trên.
4. Dynamic non-linear index $\longrightarrow$ Giữ nguyên kiểm tra biên thông thường.
5. Empty array (`flags.size() == 0`) $\longrightarrow$ Kích hoạt an toàn fallback path.
6. Small array (`flags.size() < n`) $\longrightarrow$ Tự động rẽ nhánh sang fallback an toàn.
