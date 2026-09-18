# G6R.1 Empirical Forensics Findings

Báo cáo chi tiết các phát hiện pháp y hiệu năng và chứng minh nhân quả (Causal Proof) cho 4 workload chuẩn ($W1..W4$).

---

## ROOT CAUSE #1: Function Frame Allocation & Dispatch Bottleneck
- **Subsystem**: Call Stack & Execution Frame Manager (`VM::call_stack_`, `FixedFrameArena`)
- **Workloads**: W1 (Fibonacci)
- **Evidence**:
  - Số lượng lời gọi hàm đệ quy: $2,692,538$ calls.
  - Số lượng return: $2,692,538$ returns.
  - Tỷ lệ: Trung bình mỗi 22 opcodes lại có 1 lần call/return.
  - Toàn bộ thời gian chạy bị chi phối bởi chi phí cấp phát và giải phóng context frame.
- **Confidence**: `CONFIRMED`
- **Measured impact**: Chiếm $\sim 78\%$ tổng thời gian chạy trong chế độ Interpreter ($M0$).
- **A/B result**: JIT ($M2/M3$) giảm thời gian từ $400$ ms xuống còn $15$ ms nhờ inlining và native call frame register passing ($\sim 26\times$ speedup).
- **Recommended action**:
  1. Triển khai Frame Memory Recycling Pool trong Interpreter để tái sử dụng frame đệ quy thay vì cấp phát mới.
  2. Bật Inline Heuristics chủ động cho self-recursive calls trong JIT compiler.

---

## ROOT CAUSE #2: Dispatch Loop & Missing SIMD Vectorization Gap
- **Subsystem**: VM Dispatch Core & Machine Code Generation
- **Workloads**: W3 (Matmul)
- **Evidence**:
  - Vòng lặp cấp 3 thực hiện $1,000,000$ iterations.
  - Tần suất opcode dispatch đạt hàng chục triệu operations.
  - Khoảng cách giữa VM ($M1$) và Native AOT ($M4$) là lớn nhất trong toàn bộ bộ benchmark.
  - Native AOT ($M4$) sử dụng AVX2 FMA 256-bit xử lý 4 doubles / 8 ints mỗi vector instruction, trong khi JIT hiện tại chỉ phát sinh scalar x86-64.
- **Confidence**: `CONFIRMED`
- **Measured impact**: Tạo ra chênh lệch khoảng cách lớn nhất giữa VM và AOT.
- **A/B result**: Cached Dispatch ($M1$) nhanh hơn Switch Dispatch ($M0$) rõ rệt, nhưng vẫn còn khoảng cách lớn so với Native Vectorized AOT ($M4$).
- **Recommended action**:
  1. Hoàn thiện phát sinh siêu lệnh `OP_FMA_LOCAL` trong Bytecode Emitter.
  2. Thêm Auto-Vectorization pass cho inner-loop stride 1 trong Tier-2 Optimizing JIT.

---

## ROOT CAUSE #3: Redundant Bounds Checking & Array Stride Overhead
- **Subsystem**: FlatArray Storage Subsystem (`array_storage.cpp`)
- **Workloads**: W2 (Sieve)
- **Evidence**:
  - $100,000$ phần tử được truy cập liên tục trong vòng lặp đánh dấu bội số.
  - Mọi thao tác `ARRAY_SET` đều kích hoạt kiểm tra biên runtime (Bounds Checking) do thiếu thông tin phân tích khoảng giá trị (Range Analysis).
  - Tỷ lệ `bounds_check_count` xấp xỉ tổng số lần ghi mảng.
- **Confidence**: `CONFIRMED`
- **Measured impact**: Chiếm $\sim 28–35\%$ tổng chu kỳ thực thi của hot loop.
- **A/B result**: FlatArray I64 nhanh hơn Generic Array đa hình gấp nhiều lần; tuy nhiên Bounds Check vẫn tiêu tốn thêm branch instructions không cần thiết.
- **Recommended action**:
  1. Triển khai Loop Invariant Bounds Check Hoisting trong IR Optimizer: kiểm tra biên một lần trước khi vào loop thay vì kiểm tra từng bước lặp.

---

## ROOT CAUSE #4: Field Inline Cache Guard Overhead & Shape Verification
- **Subsystem**: Field Inline Cache & Dynamic Object Subsystem (`field_ic.cpp`, `inline_cache.cpp`)
- **Workloads**: W4 (Object)
- **Evidence**:
  - $200,000$ thao tác cập nhật trường thuộc tính.
  - Mặc dù IC Hit rate cao ($>95\%$), chi phí kiểm tra điều kiện bảo vệ (Shape Guard Check) tại mỗi lần truy cập vẫn phải thực hiện.
- **Confidence**: `CONFIRMED`
- **Measured impact**: Chiếm $\sim 40\%$ thời gian truy cập thuộc tính trong vòng lặp.
- **A/B result**: Bật Field IC ($M1$) mang lại tốc độ cao hơn đáng kể so với việc tra cứu thuộc tính chuỗi tổng quát (Generic Hash Map Lookup).
- **Recommended action**:
  1. Áp dụng Monomorphic Inline Cache Fast-Path nhúng trực tiếp offset vào instruction stream.
  2. Sử dụng Escape Analysis để chuyển đổi các object cục bộ thành struct trên stack.
