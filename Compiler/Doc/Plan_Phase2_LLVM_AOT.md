# Kế Hoạch Triển Khai Chi Tiết: Phase 2 - LLVM Multi-Arch Native AOT Backend (Nâng Cấp Toàn Diện Theo rv1.md)
## *Tối ưu hóa x86-64 (AVX-512) • ARM64 (Apple Silicon / Graviton) • RISC-V • WebAssembly*

---

## 1. Mục Tiêu Cốt Lõi & Định Hướng Nâng Cấp
Nâng cấp toàn diện bộ phát sinh mã **Setun 2.0 Native AOT Backend** dựa trên các đóng góp chuyên sâu từ đánh giá kiến trúc [rv1.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/rv1.md):

1. **Chiến Lược C99/C20 High-Speed Transpiler Làm Baseline Ground-Truth (Milestone 1)**:
   - Triển khai phương thức `emit_native_c` và cờ `--emit-c` trước làm nền tảng đối chiếu tính chính xác tuyệt đối (Ground-Truth) cho LLVM IR.
   - Tự động nhúng `__attribute__((always_inline))` và các macro SIMD (`immintrin.h` cho AVX2/AVX-512, `arm_neon.h` cho ARM64), cho phép chạy native tức thì trên mọi trình biên dịch có sẵn (GCC 15, Clang, MSVC).
2. **Quản Trị Bộ Nhớ Native AOT Rõ Ràng (Native Memory Strategy)**:
   - **Tầng Value Types (`struct`, `taf3`, `tvec3`, `tmat`)**: Mặc định $100\%$ Stack-allocated với Value Semantics, $0\text{ns}$ GC overhead.
   - **Tầng Reference Types (`class`, chuỗi ký tự, collections)**: Tích hợp thư viện Runtime siêu nhẹ `native_runtime.hpp` hỗ trợ **Deterministic ARC (Automatic Reference Counting)** kết hợp bộ dọn rác **Native Tri-Color GC** khi chạy AOT.
   - **Frame Arena Allocator**: Vùng nhớ tạm tự động dọn sạch sau mỗi tick game/vật lý, triệt tiêu phân mảnh bộ nhớ.
3. **Bảo Vệ Tính Toàn Vẹn Branchless TAFPU & Khử Rủi Ro LLVM Passes**:
   - Định nghĩa chặt chẽ struct `%struct.TafpuNum = type { i64, i64, i32 }`.
   - Các hàm số học đại số được gắn cờ `alwaysinline` và thuộc tính `nounwind willreturn memory(none)` để LLVM Optimizer Pass không phá vỡ cấu trúc vectorization song song không rẽ nhánh.
   - Sử dụng lệnh `switch` 3 nhánh của LLVM cho `branch3` và `match` để Target Machine tự động hạ cấp xuống cờ CPU tối ưu (`jl`, `je`, `jg` trên x86; `b.lt`, `b.eq`, `b.gt` trên ARM).
4. **Hiện Thực Hóa CPU Auto-Dispatching (Function Multi-Versioning - FMV & IFUNC)**:
   - Trình biên dịch tự động sinh ra nhiều phiên bản cho hàm BitNet GEMM (AVX-512, AVX2/FMA, ARM NEON, Baseline).
   - Tự động chèn khối kiểm tra `__builtin_cpu_supports("avx512f")` / `cpuid` tại runtime để điều hướng phần cứng tới khối lệnh SIMD tối ưu nhất mà không cần biên dịch lại mã nguồn.
5. **Khung Đo Đạc Độ Trễ Vi Mô (Micro-Benchmarking Framework)**:
   - Tích hợp test suite đo lường nano-second / microsecond trực tiếp so sánh 3 môi trường: **Bytecode VM**, **Native C++ Transpile (-O3)** và **LLVM Native AOT**.

---

## 2. Thiết Kế Kiến Trúc Backend Đa Tầng Hoàn Chỉnh

```
                                  HIGH-LEVEL AST / HIR
                                           │
                      ┌────────────────────┴────────────────────┐
                      ▼                                         ▼
        ┌───────────────────────────────┐         ┌───────────────────────────────┐
        │     C99/C20 SIMD Transpiler   │         │    LLVM IR Multi-Arch Builder │
        │     (Baseline Ground-Truth)   │         │    (LLVMEmitter Engine)       │
        │ - immintrin.h / arm_neon.h    │         │ - %struct.TafpuNum {i64,i64,i32}│
        │ - Zero-dependency with GCC 15 │         │ - LLVM Switch 3-Way Branching │
        │ - Function Multi-Versioning   │         │ - Branchless SIMD Packing     │
        └──────────────┬────────────────┘         └───────────────┬───────────────┘
                       │                                          │
                       ├──────────────────────────────────────────┘
                       ▼
        ┌────────────────────────────────────────────────────────┐
        │          Native Memory & Runtime Subsystem             │
        │ - Stack / Value Semantics for Structs (0ns GC)         │
        │ - Native Deterministic ARC & Tri-Color GC for Classes  │
        │ - Frame Arena Allocator for Real-Time Zero Drift       │
        └──────────────────────────────┬─────────────────────────┘
                                       │
                       ┌───────────────┴───────────────┐
                       ▼                               ▼
        ┌───────────────────────────────┐ ┌───────────────────────────────┐
        │   Standalone Native Binary    │ │     Cross-Arch Artifacts      │
        │   (x86-64 .exe / Linux ELF)   │ │  (Apple M4, Graviton, Wasm)   │
        └───────────────────────────────┘ └───────────────────────────────┘
```

---

## 3. Lộ Trình Triển Khai Chi Tiết Phase 2

### Bước 1: Xây dựng Thư Viện Native Runtime (`include/compiler/native_runtime.hpp`)
- Cung cấp các hàm inlined số học TAFPU $\mathbb{Q}(\sqrt{3})$ siêu tốc bằng C/C++.
- Triển khai bộ quản lý bộ nhớ ARC và Frame Arena Allocator.
- Triển khai Function Multi-Versioning (FMV) cho BitNet GEMM với tự động nhận diện AVX-512 / AVX2 / ARM NEON.

### Bước 2: Xây dựng `LLVMEmitter` (`include/compiler/llvm_emitter.hpp` & `src/compiler/llvm_emitter.cpp`)
- Cài đặt bộ sinh mã C20 Transpiler Baseline (`emit_native_c`).
- Cài đặt bộ sinh mã LLVM IR chuẩn hóa (`emit_llvm_ir`).
- Cài đặt pipeline biên dịch ra file thực thi native `.exe` / binary (`compile_native`).

### Bước 3: Cập nhật CLI `src/main.cpp`
- Tích hợp các cờ `--native`, `-O3`, `--emit-c`, `--emit-llvm`, `--target <triple>`.

### Bước 4: Xây dựng Bộ Kiểm Thử & Đo Đạc Micro-Benchmark (`tests/test_phase2_llvm.cpp`)
- Kiểm thử toàn diện 5 module của Phase 2, đo đạc thời gian chạy vi mô và xác thực 0% sai số.
- Tích hợp vào `setunc test` và chạy kiểm thử $100\%$ thành công.
