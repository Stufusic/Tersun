# Gate 7 Baseline Manifest

```text
Manifest ID:      MANIFEST-G7-BASELINE-20260921
Status:           SEALED & IMMUTABLE
Parent Milestone: Gate 7 — Portable AI Compute
Target Gate:      Gate 7.1 — Cross-Architecture AI Validation & Edge Deployment
Generated At:     2026-09-21T03:30:00Z
Compiler:         GCC 15.2.0 (x86_64-w64-mingw32)
Optimization:     -O3 -mavx2 -mfma -fopenmp -DTERSUN_PIN_REGISTERS
```

---

## 1. Bản Tóm Tắt Hiện Trạng Gate 7 (Baseline Snapshot)

Gate 7 đã thiết lập nền tảng tính toán trí tuệ nhân tạo di động (Portable AI Compute Runtime) trên kiến trúc máy chủ x86-64, bao gồm 13 thành phần kiến trúc đã hoàn thiện 100%:

1. **Target Capability Detection**: Nhận diện phần cứng x86_64 qua `cpuid` / `xgetbv` (AVX2, FMA, 256-bit YMM, 12 cores).
2. **Kernel Registry**: Điều phối vi nhân tính toán phân tách theo `KernelOp`, `Architecture`, và `Priority`.
3. **TensorView**: Khung nhìn Tensor zero-copy không sở hữu bộ nhớ, hỗ trợ slicing đa chiều và stride tùy ý.
4. **PackedTernaryLayout v1**: Định dạng nén 2-bit cho trọng số tam phân $\{-1, 0, +1\}$ (Little-Endian, 4 trits/byte).
5. **Tensor IR & Fusion**: Đồ thị tính toán tĩnh với pass tối ưu hóa hợp nhất `MATMUL + ADD_BIAS + RELU` $\to$ `FUSED_LINEAR_BIAS_RELU`.
6. **BitNet Microkernel Ladder K0–K6**: Thang 7 bậc vi nhân tính toán (Unpack, Masks, Dot, GEMV, GEMM, Fused Bias, Fused ReLU).
7. **x86 Scalar Reference Oracle**: Chân lý ngữ nghĩa toán học C++20 độc lập tuyệt đối, bit-exact.
8. **x86 AVX2 SIMD Implementation**: Vector hóa 256-bit YMM không dùng phép nhân, tăng tốc 1.53x - 1.84x.
9. **EdgeArena**: Bộ cấp phát bump tĩnh căn chỉnh 64 bytes (`alignas(64)`), scoped arena markers, zero fragmentation.
10. **SafeTensors Runtime**: Bộ nạp và ghi file chuẩn hóa quốc tế với parser phòng thủ (hardened against corrupt/truncated inputs).
11. **CLI AI Subcommands**: `setunc ai profile`, `setunc ai inspect`, `setunc ai run`, `setunc ai benchmark`.
12. **Zero-Allocation Contract**: Kiểm toán bằng `AllocationProbe`, bảo đảm tuyệt đối 0 phân bổ heap (`malloc=0, free=0, new=0, delete=0`).
13. **Sealed Registry Artifacts**: Niêm phong tại `test_registry/g7/layout_calibration.json` và `test_registry/g7/g7_portable_compute_runtime.json`.

---

## 2. Số Liệu Kiểm Chuẩn Chuẩn Hóa (Benchmark Metrics)

* **Workload**: Mô hình BitNet MNIST 1.58-bit ($784 \to 128 \to 10$, tổng cộng 101,770 tham số).
* **Số lượt suy luận đo kiểm**: 20,000 runs (Warm inference).
* **Độ trễ trung bình (Average Latency)**: $40.0072\text{ µs}$ / inference.
* **Thông lượng (Throughput)**: $24,995\text{ inferences/sec}$ (FPS) trên 1 lõi x86-64 duy nhất.
* **Kích thước trọng số (Ternary Packed)**: $25,960\text{ bytes}$ ($25.35\text{ KB}$).
* **Kích thước tương đương FP32**: $407,080\text{ bytes}$ ($397.54\text{ KB}$).
* **Tỷ lệ nén (Compression Factor)**: $15.68\times$ nhỏ hơn FP32.
* **Số lần cấp phát heap trong forward pass**: $0$ lần.
* **Số lần cấp phát trong bài stress-test 50,000 lượt**: $0$ lần.

---

## 3. Tính Toàn Vẹn Kiểm Thử Hồi Quy (Regression Integrity)

* **Gate 6R Cross-Tier Differential Suite**: 33/33 tests (`G6R-D1`..`G6R-D33`) đạt 100% Bit-Exact Match.
* **Gate 6R BCE Safety Suite**: 6/6 tests (Positive & Negative safety) đạt 100% PASS.
* **Gate 7 Suite**: 100% PASS.
* **Mã thoát của `setunc_test.exe`**: `0` (Success).

---

## 4. Cam Kết Bất Biến (Invariance Clause for Gate 7.1)

Toàn bộ các ngữ nghĩa, định dạng dữ liệu, và kết quả kiểm thử trên đây được coi là **Hằng Số Cơ Sở (Fixed Baseline)**. Quá trình phát triển Gate 7.1:
1. Tuyệt đối không làm thay đổi ngữ nghĩa của Scalar Oracle.
2. Tuyệt đối không làm hỏng bất kỳ test nào trong 33 test G6R và 6 test BCE.
3. Mọi sai khác phát sinh giữa ARM64 NEON, ARM64 Scalar hoặc RISC-V64 đều phải quy chiếu và tuân thủ theo kết quả của Scalar Oracle tại manifest này.
