# ADR-010: Tối Ưu Hóa Mạch Lượng Tử & Lập Lịch Pha Biến Đổi Fourier (QVM-OPT 1..3)

```text
Status:       ACCEPTED & CRYPTOGRAPHICALLY SEALED
Date:         2026-09-20
Deciders:     Quantum Virtual Machine & Compiler Architecture Team
Consulted:    Quantum Algorithms, High-Performance Computing, SIMD Acceleration
Informed:     Tersun Core Engineering
Verification: 17/17 QVM Tests Passing | Continuous Scaling Benchmark N=16..24
Git Anchor:   Commit 133330b5fd9b5cf9b57948abf7de3361eb20b793
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context & Problem Statement)

Trong kiến trúc Tersun 1.0.2 ban đầu, máy ảo lượng tử QVM mô phỏng cổng xoay pha có điều khiển $CP(\theta)$ bằng cách phân giải nó thành 5 cổng cơ sở:
$$CP(\theta) \longrightarrow R_Z(\theta/2) \otimes CNOT \otimes R_Z(-\theta/2) \otimes CNOT \otimes R_Z(\theta/2)$$

Khi thực thi giải thuật biến đổi Fourier lượng tử (QFT) trên $N=22$ Qubits:
- Tổng số cổng bùng nổ lên **$1,188\text{ cổng}$**.
- Statevector $4,194,304$ phần tử phức phải bị quét tuần tự qua bộ nhớ RAM $1,188$ lần.
- Thời gian thực thi tại $N=22$ lên tới **$9,746.67\text{ ms}$** ($9.75\text{ giây}$), bão hòa băng thông bộ nhớ và không thể mở rộng lên $N \ge 23$.

---

## 2. Các Lựa Chọn Thiết Kế Đã Xem Xét (Considered Alternatives)

1. **Phương án A: Chuyển toàn bộ sang Mạng Tensor MPS (Matrix Product States)**
   - *Ưu điểm*: Bộ nhớ RAM chỉ tăng tuyến tính theo số qubit $O(N \cdot \chi^2)$.
   - *Nhược điểm*: Mạch QFT chứa các cổng $CP$ tác động xa giữa tất cả các cặp qubit, tạo ra vướng víu tối đa (Maximal Entanglement). Số chiều liên kết $\chi$ bùng nổ theo hàm mũ $\chi \sim 2^{N/2}$, khiến phép SVD chậm hơn gấp hàng chục lần so với Statevector.
2. **Phương án B: Chỉ viết lại vòng lặp C++ với đa luồng OpenMP**
   - *Ưu điểm*: Dễ cài đặt, không cần thay đổi cấu trúc biểu diễn mạch.
   - *Nhược điểm*: Vẫn phải quét qua bộ nhớ $1,188$ lần và tính hàm lượng giác `std::sin()` / `std::cos()` hàng triệu lần trong mỗi cổng.
3. **Phương án C (Được chọn): Chiến Lược Tối Ưu Hóa Ba Cổng (Three-Gate Optimization Pipeline)**
   - *Cổng QVM-OPT 1*: Cài đặt Native $CP(\theta)$ trực tiếp không phân rã, kết hợp phân mảnh tọa độ nhị phân không rẽ nhánh (Branch-Free Strided Matrix Coordinates).
   - *Cổng QVM-OPT 2*: Xây dựng `CircuitOptimizer` gom cụm các cổng chéo giao hoán (Commuting Diagonal Layers) và `QFTPlanner` với bảng tra cứu góc pha tính trước $O(1)$ LUT.
   - *Cổng QVM-OPT 3*: Vector hóa AVX2 256-bit kết hợp phân luồng OpenMP với ngưỡng kích hoạt thích ứng `dim >= 524288`.

---

## 3. Quyết Định Kiến Trúc (Architecture Decision)

Nhóm kiến trúc quyết định triển khai **Phương án C** với các nguyên tắc sau:

1. **Native Strided Controlled-Phase**:
   Cổng $CP(\theta) = \text{diag}(1, 1, 1, e^{i\theta})$ chỉ được phép chạm vào **đúng 25% biên độ** ($q_{\text{ctrl}} = 1 \land q_{\text{tgt}} = 1$), bỏ qua hoàn toàn 75% không gian còn lại mà không sinh mã rẽ nhánh `if`.
2. **QFT Ladder Phase Folding**:
   Tại mỗi bậc thang $b$, toàn bộ $b$ cổng $CP$ giao hoán được gộp lại thành 1 lần quét bộ nhớ duy nhất. Bảng $2^b$ góc pha phức được tính sẵn trong $O(2^b)$, triệt tiêu $100\%$ các lệnh gọi hàm siêu việt trong vòng lặp chính.
3. **AVX2 SIMD & Adaptive Threading**:
   Xử lý đồng thời 2 số phức 128-bit trên thanh ghi `__m256d`. Ngưỡng phân luồng `dim >= 524288` bảo đảm mạch nhỏ ($N \le 18$) không bị trễ do thread barrier và mạch lớn ($N \ge 19$) tận dụng tối đa 12 luồng CPU.

---

## 4. Hậu Quả & Đánh Giá Kỹ Thuật (Consequences & Evaluation)

### Tác Động Tích Cực (Positive Consequences):
- **Tăng tốc ngoạn mục**: Tại $N=22$, thời gian thực thi giảm từ $9,746.67\text{ ms} \to$ **$656.15\text{ ms}$** (**tăng tốc $14.9\times$**).
- **Mở rộng giới hạn quy mô**: Mô phỏng thành công $N=24$ Qubits ($16,777,216$ trạng thái) chỉ mất **$2,896.39\text{ ms}$** ($2.89\text{ giây}$) với mức RAM $256\text{ MB}$.
- **Bảo toàn tính đúng đắn 100%**:
  - Độ trung thực lượng tử $F = 1.000000000000$.
  - Sai số chuẩn hóa hàm sóng $\text{Norm Err} = 1.11 \times 10^{-16} \le \epsilon_{\text{mach}}$.
  - Toàn bộ 17 bài test vi sai trong `tests/test_qvm.cpp` đạt PASS tuyệt đối.

### Thách Thức & Ràng Buộc (Trade-offs & Constraints):
- **Phụ thuộc phần cứng**: Yêu cầu kiến trúc CPU hỗ trợ tập chỉ thị AVX2 + FMA để đạt hiệu năng đỉnh cao; tuy nhiên hệ thống vẫn tự động fallback an toàn về nhân vô hướng đối với môi trường phần cứng không có AVX2 thông qua macro `#if TERSUN_QVM_HAS_AVX2`.
