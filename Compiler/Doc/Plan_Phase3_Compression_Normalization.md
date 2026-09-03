# Kế Hoạch Triển Khai Chi Tiết: Phase 3 - Nén Động Phân Cấp (Adaptive Block Packing), Chống Tràn Số Chu Kỳ (Periodic Normalization) & Thư Viện Tensor Deterministic Lockstep
## *Khắc phục $4\times - 8\times$ RAM • Chuẩn hóa 3-adic & Periodic GCD • Lượng giác Bit-Exact Lockstep*

---

## 1. Mục Tiêu Cốt Lõi Của Phase 3
Hoàn thiện kiến trúc xử lý bộ nhớ, chống tràn số đại số và thư viện Tensor của **Setun 2.0** theo 4 định hướng tối ưu hóa chuyên sâu:

1. **Cơ Chế Nén Động Phân Cấp (Hierarchical Adaptive Block Packing)**:
   - **Tầng 1 (`BitNetTryte8` - 1B / 4 weights)**: Nén $4\times$ cho trọng số mô hình AI tam phân $W \in \{-1, 0, 1\}$.
   - **Tầng 2 (`PackedTafpu16` - 4B / elem)**: Dành cho Input Tensors và tập dữ liệu đã chuẩn hóa trong khoảng $[-364, 364]$ (giảm $87.5\%$ RAM).
   - **Tầng 3 (`PackedTafpu32` - 8B / elem)**: Dành cho dải số trung bình $[-8.38 \times 10^6, 8.38 \times 10^6]$ với 24-bit $A$, 24-bit $B$, 16-bit $S$, bảo toàn $0\%$ sai số cho các bài toán thông dụng (giảm $75\%$ RAM).
   - **Tầng 4 (`TafpuNum_C` - 32B Full Register)**: 64-bit $A$, 64-bit $B$, 32-bit $S$ cho Accumulator, kết quả trung gian và tính toán giải tích lõi.
2. **AOT Periodic Normalization Pass (Giảm Overhead Chu Kỳ CPU)**:
   - Tránh gọi GCD/3-adic shift ở từng phép nhân đơn lẻ. Thay vào đó, áp dụng cơ chế **Loop Unrolling & Periodic Normalization** (chỉ gọi kiểm tra ngưỡng sau mỗi stride $N = 16$ hoặc $32$ phép nhân trong MatMul và vòng lặp sâu).
   - Sử dụng `__builtin_expect` kết hợp ngưỡng $|A|, |B| > 2^{48}$ để CPU branch predictor luôn dự đoán đúng trong $99.9\%$ chu kỳ clock.
3. **Lượng Giác Đại Số Chuẩn Xác & Deterministic Lockstep Math**:
   - **Góc đặc biệt ($k\pi/6, k\pi/3, k\pi/4$)**: Trả về số đại số chính xác $100\%$ trong $\mathbb{Q}(\sqrt{3})$ (ví dụ $\sin(\pi/6) = [1, 0, -2]$, $\cos(\pi/6) = [0, 1, 0]$ tức $\frac{\sqrt{3}}{2}$).
   - **Góc tùy ý**: Triển khai thuật toán **Deterministic Bounded CORDIC** với 32 chu kỳ cố định, cam kết **chuỗi bit kết quả y hệt nhau 100% (Bit-Exact Lockstep)** trên x86-64, ARM64 Apple M4, Graviton và WebAssembly phục vụ đồng bộ mạng vật lý.
4. **Căn Chỉnh Bộ Nhớ Tuyệt Đối (Strict 32/64-Byte Aligned Allocation)**:
   - Cấp phát bộ nhớ căn lề 32-byte (cho AVX2/NEON) và 64-byte (cho AVX-512) qua `std::aligned_alloc` để khai thác tối đa băng thông SIMD Streaming ($\ge 2.0\text{ GB/s}$) và lệnh nạp/ghi trực tiếp (`_mm256_stream_si256`, `vpmovsxbw`).

---

## 2. Thiết Kế Kiến Trúc Phân Cấp & Dòng Chảy Dữ Liệu

```
   ┌──────────────────────────────────────────────────────────────────┐
   │                     STORAGE / RAM BUFFER LAYERS                  │
   │  - Level 1: BitNetTryte8 (1 Byte / 4 weights)                   │
   │  - Level 2: PackedTafpu16 (4 Bytes - Input / Quantized)          │
   │  - Level 3: PackedTafpu32 (8 Bytes - 24b Exact Intermediate)     │
   │  - Strict 32/64-Byte Aligned Memory Buffer (Zero Cache Miss)     │
   └────────────────────────────────┬─────────────────────────────────┘
                                    │
                     SIMD Streaming Vector Unpack
                                    │
                                    ▼
   ┌──────────────────────────────────────────────────────────────────┐
   │                  CPU REGISTERS / ALU COMPUTATION                 │
   │  - Level 4: Full 32-Byte TafpuNum_C (A:64b, B:64b, S:32b)        │
   │  - Periodic Normalization Pass (Stride = 16 / 32)                │
   │  - 3-adic Shift + Binary GCD Reduction (|A|, |B| < 2^48)         │
   │  - Deterministic Lockstep CORDIC (Bit-Exact Across All CPU Arch) │
   └────────────────────────────────┬─────────────────────────────────┘
                                    │
                      SIMD Streaming Vector Pack
                                    │
                                    ▼
   ┌──────────────────────────────────────────────────────────────────┐
   │            WRITE-BACK TO ALIGNED STORAGE TENSOR BUFFER           │
   └──────────────────────────────────────────────────────────────────┘
```

---

## 3. Lộ Trình Triển Khai Chi Tiết Phase 3

### Bước 1: Xây Dựng Cấu Trúc Nén Động & Aligned Allocator ([`packed_tensor.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/packed_tensor.hpp))
- Cài đặt `BitNetTryte8`, `PackedTafpu16`, `PackedTafpu32`.
- Bộ cấp phát căn lề `AlignedAllocator<T, 32>` & `AlignedAllocator<T, 64>`.
- Lớp `PackedTensor` hỗ trợ Streaming Unpack/Pack $\ge 2.0\text{ GB/s}$.

### Bước 2: Xây Dựng Bộ Chuẩn Hóa Chu Kỳ & Chống Tràn Số ([`normalization.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/tafpu/normalization.hpp))
- Cài đặt thuật toán Binary GCD nhanh và 3-adic shift.
- Bộ lọc `tafpu_normalize_periodic(stride=16)` giúp chạy 1M phép tính liên tục mà không tràn `int64_t`.

### Bước 3: Xây Dựng Thư Viện Lượng Giác Deterministic Lockstep ([`std_tensor.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/std_tensor.hpp))
- Bảng đại số chính xác $100\%$ cho các góc đặc biệt $\pi/6, \pi/3, \pi/4$.
- Hàm CORDIC 32 chu kỳ cố định đồng nhất $100\%$ bit-exact trên mọi CPU.
- Hàm khoảng cách Euclidean `norm3d_taf`.

### Bước 4: Xây Dựng Bộ Kiểm Thử Tự Động Phase 3 ([`test_phase3_compression.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/tests/test_phase3_compression.cpp))
- Kiểm thử nén mảng 1 triệu phần tử giảm $87.5\%$ RAM.
- Kiểm thử 1 triệu phép nhân liên tục không tràn số.
- Kiểm thử BitNet GEMM $1024 \times 1024$ và CORDIC Deterministic.
- Tích hợp vào `setunc test` và xác thực $100\%$ PASS.
