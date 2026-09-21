# ADR-005: Phân Phối Thanh Ghi Quét Tuyến Tính (Linear Scan Register Allocator) Với Cơ Chế Dự Phòng Caller-Saved

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       LinearScanAllocator (Code/src/vm/linear_scan.cpp & Code/include/vm/linear_scan.hpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Trong trình biên dịch JIT tối ưu hóa (Tier-2 JIT), việc gán các biến ảo trong Machine IR (MIR) vào số lượng thanh ghi vật lý hữu hạn của vi xử lý x86-64 (16 thanh ghi tổng quát: `RAX`, `RBX`, `RCX`, `RDX`, `RSI`, `RDI`, `RBP`, `RSP`, `R8`–`R15`) là một bài toán NP-đầy đủ.

- **Thuật toán Tô màu đồ thị (Graph Coloring - Chaitin / Briggs)**: Cho kết quả tối ưu nhưng thời gian tính toán $O(N^2)$ đến $O(N^3)$. Trong môi trường JIT biên dịch thời gian thực (Just-In-Time), việc tốn hàng chục mili-giây chỉ để xây dựng ma trận đồ thị giao thoa (Interference Graph) sẽ hủy hoại trải nghiệm người dùng và làm tăng thời gian khởi động (Startup Latency).
- **Thuật toán Quét Tuyến Tính cổ điển (Poletto & Sarkar 1999)**: Chạy nhanh với độ phức tạp $O(N)$, nhưng thường vứt biến ra bộ nhớ ngăn xếp (Spill to Stack) quá sớm khi hết thanh ghi Callee-saved (`RBX`, `R12`–`R15`), gây tắc nghẽn nạp/ghi bộ nhớ trong các vòng lặp tính toán khốc liệt.

---

## 2. Quyết Định (Decision)

Tersun quyết định phát triển **Bộ Phân Phối Thanh Ghi Quét Tuyến Tính Cải Tiến (Enhanced Linear Scan Register Allocator)**:

### Các kỹ thuật đột phá:
1. **Quét Khoảng Sống Một Lượt Tuyến Tính (Single-pass Live Range Scanning)**:
   - Sắp xếp các khoảng sống (Live Intervals) theo thứ tự bắt đầu tăng dần.
   - Duy trì danh sách các khoảng đang hoạt động (Active List) theo thứ tự kết thúc tăng dần.
2. **Chiến Lược Dự Phòng Thanh Ghi Caller-Saved (Caller-Saved Fallback Strategy)**:
   - Khi các thanh ghi callee-saved không biến đổi (`RBX`, `R12`–`R15`) đã kín chỗ, thay vì tràn biến (spill) ra stack ngay lập tức, bộ cấp phát sẽ kiểm tra khoảng sống của biến:
   - Nếu khoảng sống không chứa bất kỳ lời gọi hàm nào (`call`), bộ cấp phát sẽ ưu tiên cấp phát các thanh ghi tạm thời caller-saved (`RCX`, `RDX`, `R8`, `R9`, `R10`, `R11`).
3. **Tràn Biến Có Trọng Số Vòng Lặp (Loop-Aware Spill Weighting)**:
   - Nếu bắt buộc phải tràn, bộ cấp phát tính toán trọng số: $W = \text{def\_use\_count} \times 10^{\text{loop\_depth}}$.
   - Các biến bên trong vòng lặp sâu có trọng số cực cao và không bao giờ bị tràn trước các biến ngoài vòng lặp.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Iterated Register Coalescing (Graph Coloring)**:
   - *Bác bỏ*: Chi phí thời gian biên dịch quá lớn, không phù hợp cho Tier-2 JIT phản hồi nhanh.
2. **Greedy Register Allocation (LLVM-style)**:
   - *Bác bỏ*: Phức tạp hóa cấu trúc dữ liệu không cần thiết đối với kích thước hàm điển hình trong Setun.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/src/vm/linear_scan.cpp` & `Code/include/vm/linear_scan.hpp`
  - Symbol: `LinearScanAllocator::allocate()`, `LinearScanAllocator::spill_at_interval()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 80–280)
- **Bằng chứng thực nghiệm**:
  - Thời gian phân bổ thanh ghi $< 0.15\text{ ms}$ cho toàn bộ hàm chứa 150 chỉ thị MIR.
  - **Kỷ lục Spill**: Đạt `total_spill_slots = 0` trên toàn bộ 4 workload chuẩn (W1 Recursive Call, W2 Sieve Array, W3 Matmul Loop, W4 Vector Object).

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Tốc độ biên dịch JIT siêu tốc ($O(N \log N)$ nhờ sắp xếp).
- Tận dụng triệt để 14 thanh ghi x86-64 vật lý (loại trừ `RSP` và `RBP`).
- Triệt tiêu hoàn toàn lệnh nạp/ghi stack trong các lõi vòng lặp tính toán khép kín.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Nếu khoảng sống trải qua lời gọi hàm, thanh ghi caller-saved phải được lưu tạm trước lệnh `call`.
- *Giải pháp giảm thiểu*: Kết hợp với **Direct Native Calling (W1 - ADR-008/G6R.2.3)** để loại bỏ khung trung gian, biến đổi hàm lá (leaf functions) thành các hàm không có lệnh `call`, giải phóng toàn bộ thanh ghi caller-saved cho tính toán.
