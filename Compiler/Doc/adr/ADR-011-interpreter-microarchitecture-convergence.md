# ADR-011: Hội Tụ Vi Kiến Trúc Trình Thông Dịch Thuần (Tier-0 Pure Interpreter Microarchitecture Convergence)

```text
Status:       ACCEPTED & CRYPTOGRAPHICALLY SEALED
Date:         2026-09-20
Deciders:     Virtual Machine & Compiler Architecture Team
Consulted:    Microarchitecture Optimization, CPU PMU Forensics, Ternary Computing
Informed:     Tersun Core Engineering
Verification: 33/33 Cross-Tier Differential Tests Passing (100% Parity) | All Workloads W1-W4 Bit-Exact
Git Anchor:   Commit e738dd91
Artifact:     Code/test_registry/g6r3/g6r3_interpreter.json
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context & Problem Statement)

Sau khi hoàn tất Gate 6 Rebuild (G6R.2.4), engine Tersun sở hữu hệ thống JIT đa tầng (Tier-1 Baseline JIT và Tier-2 Optimizing JIT). Tuy nhiên, theo kết quả phản biện tại `Doc/G6r3rv` (32 Architectural Critiques):
1. **Điểm nghẽn thông dịch viên thuần (Tier-0)**: Trong các kịch bản thực thi không thể hoặc chưa kịp JIT (startup phase, serverless, sandbox hạn chế W^X), bộ thông dịch `run_optimized()` chịu chi phí điều phối lệnh (dispatch overhead) và tải/ghi bộ nhớ ngăn xếp RAM phòng thủ quá mức.
2. **Nhiễu đo đạc & Telemetry**: Các bộ đếm telemetry và profiler nằm trực tiếp trên hot path làm loãng lệnh vi kiến trúc CPU và phá hỏng pipeline nhánh.
3. **Hiện tượng xả ngăn xếp phòng thủ (Defensive FLUSH_TOS)**: Việc xả thanh ghi đỉnh ngăn xếp (TOS) về RAM tại mỗi bước nhảy cơ bản gây áp lực lên L1D cache.
4. **Vòng lặp trong W3 MatMul**: Các phép toán tích lũy inner product $\text{accum} += A[i \cdot K + k] \times B[k \cdot N + j]$ tốn tới 6 lần dispatch bytecode cho mỗi phần tử.

---

## 2. Các Lựa Chọn Thiết Kế & Thực Nghiệm Pháp Y (Considered Alternatives & Forensic Trail)

Nhóm kiến trúc đã thiết lập quy trình kiểm chuẩn vi pháp y 9 bước tuần tự ($B_1 \to B_9$) với mẫu đo đạc $N=30$ runs (ghi nhận Median, P95, CV%):

### 1. Phương án A: Tối ưu hóa dẫn hướng Profile (Generic PGO)
- *Thực nghiệm*: Biên dịch với `-fprofile-generate` $\to$ huấn luyện trên W1-W4 $\to$ biên dịch `-fprofile-use`.
- *Kết quả pháp y*: Kích thước assembly của `run_optimized()` phình to từ 16,657 dòng lên 17,539 dòng. Do bảng nhảy gián tiếp `goto *table[op]` có kích thước lớn, PGO của GCC gây ô nhiễm Indirect Branch Target Buffer (BTB), làm hiệu năng W1 giảm từ 87.05 ms xuống 128.25 ms (suy giảm 32%).
- *Kết luận*: **BÁC BỎ PGO** cho vòng lặp direct-threaded interpreter.

### 2. Phương án B: Ghim thanh ghi kiến trúc không kiểm toán (Blind Register Pinning)
- *Lo ngại lý thuyết*: Trong x86_64, việc ghim `%r12` và `%r13` có thể tước đi 2 thanh ghi callee-saved của bộ cấp phát GCC, làm tăng spill ra stack.
- *Kiểm toán Assembly thực tế (Step B8 Audit)*:
  - Biến thể A (Không pin): 3,170 lệnh truy cập stack frame (`%rsp`/`%rbp`), 8/8 push/pop.
  - Biến thể B (Ghim `%r12=ip, %r13=sp`): 2,734 lệnh truy cập stack frame (delta: **-436 stack accesses eliminated**).
  - Tác động hiệu năng: W1 Fibonacci tăng tốc từ 126.7 ms $\to$ **89.67 ms (1.413x speedup)**.
  - *Kết luận*: **CHẤP NHẬN & TÍCH HỢP GHIM THANH GHI (`-DTERSUN_PIN_REGISTERS`)**.

### 3. Phương án C (Được chọn): Chuỗi Tối Ưu Hóa Cấu Trúc Toàn Diện (G6R.3 Convergence)
- Phân lập 100% telemetry ra khỏi production hot path (`#if !TERSUN_PROFILE`).
- Triển khai siêu lệnh dòng dữ liệu `OP_ADD_LOCAL_IMM` và `OP_FUSED_DOT_STEP_I64`.
- Chuyên biệt hóa đường dẫn truy xuất mảng phẳng `OP_GET_INDEX_ARRAY` với cơ chế zero-allocation cho các toán tử đại số TAFPU.
- Phân tách nhánh lạnh out-of-line (`[[gnu::cold]]`).

---

## 3. Quyết Định Kiến Trúc (Architecture Decisions)

1. **Zero-Instrumentation Hot Path**:
   Định nghĩa cờ `TERSUN_VM_INSTRUMENTED`. Mọi macro điều phối `FAST_DISPATCH()` và `DISPATCH_C()` trong bản build release hoàn toàn không chứa bất kỳ lệnh ghi biến đếm telemetry nào.

2. **Siêu Lệnh Dòng Dữ Liệu Lõi (Dataflow Superinstructions)**:
   - `OP_ADD_LOCAL_IMM` (0xD1, 7 bytes): Hợp nhất `LOAD_LOCAL`, `PUSH_INT`, `ADD`, `STORE_LOCAL` thành 1 dispatch thanh ghi duy nhất.
   - `OP_FUSED_DOT_STEP_I64` (0xD2, 11 bytes): Hợp nhất toàn bộ hạt nhân tích vô hướng trong MatMul, giảm từ 6 VM dispatches xuống còn **1 VM dispatch duy nhất**, rút ngắn thời gian W3 từ 202.3 ms xuống 150.0 ms.

3. **Ghim Thanh Ghi Kiến Trúc Tối Ưu (Register Pinning)**:
   Ghim chính thức `ip` vào `%r12` và `sp` vào `%r13` trên x86_64, triệt tiêu 436 lệnh truy cập stack RAM trong thân hàm `run_optimized()`.

4. **Giải Tuyến Tính Gauss-Jordan Không Cấp Phát Động (Zero-Allocation Fraction-Free Elimination)**:
   Thay thế toàn bộ `std::vector<std::vector<TAF_Register>>` bằng mảng tĩnh compile-time `std::array<std::array<TAF_Register, N + 1>, N>`, triệt tiêu hoàn toàn phân mảnh heap và bảo toàn tính đúng đắn 100% trên $\mathbb{Q}(\sqrt{3})$.

---

## 4. Hậu Quả & Kết Quả Đánh Giá Thực Nghiệm (Consequences & Empirical Results)

### Bảng Chỉ Số Tăng Tốc Toàn Diện ($B_1 \to B_2$):

| Workload Thuật Toán | $B_1$ (G6R.2.4 Baseline) | $B_2$ (G6R.3 Final Converged) | Stage Speedup | Giảm Độ Trễ | Parity Checksum |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **W1: Deep Recursion (Fib 30)** | 103.65 ms | **87.97 ms** | **1.18x** | -15.13% | `832040` (100% Match) |
| **W2: Sieve of Eratosthenes (1M)**| 32.46 ms | **27.99 ms** | **1.16x** | -13.76% | `9592` (100% Match) |
| **W3: Dense MatMul (128x128)** | 202.30 ms | **150.06 ms** | **1.35x** | -25.82% | `20250000` (100% Match) |
| **W4: Vector Objects Lifecycle** | 105.69 ms | **105.74 ms** | **1.00x** | +0.05% | `541096364` (100% Match) |

### Kiểm Chứng Định Tính & Độ Tin Cậy:
- **100% Bit-Exact**: Toàn bộ 4 workload thực thi ở chế độ `--interp` khớp hoàn toàn từng bit với baseline và các tầng JIT.
- **33/33 Cross-Tier Differential Tests Passing**: Bộ kiểm thử vi phân liên tầng (`ST-12.1` tới `ST-12.33`) vượt qua 100% không có sai số.
- **Cryptographic Provenance**: Chứng chỉ niêm phong được ghi nhận tại `test_registry/g6r3/g6r3_interpreter.json` với SHA256: `15adb6816042a49f378307daaeb08fa5c4944b985b29928564982142f55d6016`.
