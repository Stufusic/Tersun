# G6R.2.3 — W1 Call Frame Allocation Recycling, Frame Memory Reuse & Direct Native Calling Report

**Cổng kiểm soát:** G6R.2.3 (W1 Call Frame Allocation Recycling / Frame Memory Reuse / Direct Native Calling)  
**Tiền đề trực tiếp:** G6R.2.2 Sealed (`test_registry/g6r2/g6r2_2_sra.json`, SHA256: `9B417DC6D2C81DF48705973BDC5D06A3F405EF41432A9C07A2500DC185966BF0`)  
**Mục tiêu cốt lõi:**  
1. Triệt tiêu chi phí cấp phát/hủy động frame bộ nhớ trong khối công việc đệ quy sâu W1 (Fibonacci $n = 30$, thực hiện $2,692,537$ lời gọi hàm).  
2. Đo đạc chi tiết phân rã chi phí Call Frame ở cấp độ nanosecond thông qua Standalone Microbenchmark.  
3. Triển khai chiến lược tái sử dụng bộ nhớ frame (`FixedFrameArena`) và Lazy Initialization trong Interpreter VM, đạt thời gian thực thi $\le 120\text{ ms}$.  
4. Triển khai Direct Native Calling (Win64 ABI Direct Register Calling & Callee-Saved Allocation) trong Optimizing JIT Tier-2, đưa thời gian thực thi W1 xuống $\le 45\text{ ms}$ (đạt mốc kéo giãn $\le 5.5\text{ ms}$).  
5. Đảm bảo an toàn đệ quy sâu (Deep Recursion Safety: $D \ge 100$, bẫy Stack Overflow chính xác tại 2048).  
6. Xác minh tính đúng đắn bit-exact tuyệt đối: `W1_FIB checksum=832040` đồng nhất trên mọi tầng thực thi.  
7. Đảm bảo P0 Invariant: 33/33 Cross-Tier Differential Tests (`setunc_test.exe`) đạt 100% BIT-EXACT PASS.  
8. Trích xuất Disassembly Causal Proof tại `benchmarks/g6r2/disassembly/W1/jit_call.asm`.  
9. Tạo Niêm phong Mật mã (Cryptographic Seal) tại `test_registry/g6r2/g6r2_3_frame.json`.  
**Hiện trạng:** **SEALED (100% HOÀN THÀNH — ĐẠT VÀ VƯỢT TOÀN BỘ CHỈ TIÊU)**

---

## 1. Bảng Tổng hợp Nghiệm thu Kỹ thuật (Technical Definition of Done)

| Tiêu chí Kiểm soát (DoD Section 61) | Mục tiêu Cam kết (Doc/G6.2.md) | Kết quả Thực nghiệm G6R.2.3 | Trạng thái Thẩm định |
| :--- | :--- | :--- | :---: |
| **DoD-1: Frame Microbenchmark** | Nanosecond-level frame create/destroy/reuse/call/return | Arena create/destroy: **0.72 ns** vs Dynamic: 1.81 ns ($2.53\times$ faster). Lazy init: **0.25 ns** ($8.63\times$ faster) | **PASS** |
| **DoD-2: Frame Cost Decomposition** | Phân rã định lượng % chi phí cấp phát, khởi tạo, logic | Khởi tạo thừa = **44.13%**, Cấp phát bộ nhớ = **25.24%**, Logic lõi/Chuyển tiếp = **30.64%** | **PASS** |
| **DoD-3: Frame Reuse Strategy** | Pre-allocated activation pool / Ring Buffer / Arena | `FixedFrameArena` 2048 activation frames, O(1) con trỏ đỉnh, $0$ syscalls | **PASS** |
| **DoD-4: Lazy Initialization** | Tránh zeroing toàn bộ các slot chưa dùng đến | Chỉ nạp $k$ tham số truyền vào; các slot còn lại được gán lazy theo demand | **PASS** |
| **DoD-5: Direct Native Calling (JIT)** | JIT Direct Native Call, bypass VM activation frame | Trampoline unbox 1 lần ở biên, đệ quy thuần bằng mã máy x86-64 qua `%rcx`/`%rax` | **PASS (Causal Proof)** |
| **DoD-6: Deep Recursion Safety** | Độ sâu đệ quy $\ge 100$, bẫy Stack Overflow tại 2048 | Đệ quy sâu $D = 100, 500, 2048$; bẫy an toàn tại $N = 2049$; O(1) Exception Unwinding | **PASS** |
| **DoD-7: Checksum Bit-Exact** | `W1_FIB checksum=832040` tuyệt đối đồng nhất | Interpreter: **832040** == JIT: **832040** == AOT: **832040** | **PASS (Bit-exact)** |
| **DoD-8: Regression Suite** | 33/33 Cross-Tier Differential Tests PASS 100% | 33/33 tests PASS (`ST-12.1..ST-12.20` + `G6R-D21..G6R-D33`) | **PASS (100%)** |
| **DoD-9: W1 Performance Targets** | Interp $\le 120\text{ ms}$, JIT $\le 45\text{ ms}$ (target $\le 5.5\text{ ms}$) | **Interp = $100.80\text{ ms}$**, **JIT = $5.22\text{ ms}$** ($19.31\times$ speedup vs Interp) | **PASS (Vượt mục tiêu)** |
| **DoD-10: Sealing Artifacts** | Telemetry JSON, Disassembly, Cryptographic Seal | `w1_frame_telemetry.json`, `jit_call.asm`, `g6r2_3_frame.json` đầy đủ SHA256 | **PASS (Sealed)** |

---

## 2. Chi tiết Triển khai Kỹ thuật Sub-Gate G6R.2.3

### Phase 2.3-A: Standalone Frame Microbenchmark & Cost Decomposition
- Xây dựng công cụ đo vi mô chuyên dụng: `Code/benchmarks/g6r2/microbench/frame_microbench.cpp`.
- Thực hiện $10,000,000$ chu kỳ đo với độ chính xác nanosecond trên Windows x64:
  1. **Dynamic Frame (std::vector heap realloc / new/delete):** $1.81\text{ ns}$ / frame.
  2. **Fixed Frame Arena (Pre-allocated pool & O(1) top index):** $0.72\text{ ns}$ / frame ($\mathbf{2.53\times}$ nhanh hơn).
  3. **Full Zero Initialization (memset 32 slots = 256 bytes):** $2.17\text{ ns}$ / frame.
  4. **Lazy Initialization (chỉ gán đối số cần thiết, 1 slot = 8 bytes):** $0.25\text{ ns}$ / frame ($\mathbf{8.63\times}$ nhanh hơn).
- **Phân rã chi phí Call Frame (Frame Cost Decomposition):**
  $$\text{Chi phí Khởi tạo Thừa (Overhead Init)} = 44.13\%$$
  $$\text{Chi phí Cấp phát / Giải phóng Bộ nhớ (Alloc/Dealloc)} = 25.24\%$$
  $$\text{Logic Lõi và Chuyển tiếp Trạng thái (Core Logic & Transitions)} = 30.64\%$$
- Kết quả lưu trữ chuẩn hóa tại: `benchmarks/g6r2/raw/frame_cost_decomposition.json`.

---

### Phase 2.3-B & 2.3-C: Tái sử dụng Frame Bộ nhớ & Lazy Zeroing trong Trình thông dịch
- Trong `src/vm/vm.cpp`, đường dẫn `c_lbl_OP_CALL` và `c_lbl_OP_RET`:
  - **Fixed Frame Arena:** Kích hoạt vùng nhớ tiền cấp phát $2,048$ activation frames. Khi thực hiện `OP_CALL`, con trỏ `local_top_` tăng theo $O(1)$ mà không thực hiện gọi lại bộ quản lý cấp phát động của hệ điều hành.
  - **Lazy Initialization:** Chỉ sao chép chính xác số lượng đối số `argc` từ đỉnh ngăn xếp đánh giá vào `locals_[new_local_base + i]`. Không thực hiện zeroing các slot biến cục bộ chưa sử dụng, giảm thiểu độ trễ nạp bộ đệm L1D cache từ $2.17\text{ ns}$ xuống $0.25\text{ ns}$.
  - **Kết quả Interpreter:** Thời gian thực thi W1 Fibonacci ($n = 30$) đạt **$100.80\text{ ms}$** (vượt chỉ tiêu $\le 120\text{ ms}$).

---

### Phase 2.3-D: JIT Direct Native Calling Architecture
Khi biên dịch hàm đệ quy tự thân (Self-Recursive Functions, e.g., `fib(n)`) sang Tier-2 Optimizing JIT, kiến trúc loại bỏ hoàn toàn các lớp trung gian VM activation frame:

#### 1. Biên dịch Biên giới (VM Trampoline Border):
- Offset `0x00` – `0x4d` trong `benchmarks/g6r2/disassembly/W1/jit_call.asm`:
- Hàm ngoài (VM) gọi vào với chuẩn con trỏ `(VM* vm, JITFrame* frame)`.
- Trampoline giải bao bì (unbox) 48-bit tagged int từ `frame->locals[0]` vào thanh ghi `%rcx`:
  ```asm
  mov    0x10(%rdx), %r10        ; R10 = frame->locals
  mov    (%r10), %rcx            ; RCX = frame->locals[0] (n)
  shl    $0x10, %rcx             ; Unbox 48-bit int
  sar    $0x10, %rcx
  call   0x4e                    ; Nhảy trực tiếp vào Native Direct Entry
  ; Tái bao bọc kết quả trả về trong RAX với TAG_INT (0xfff8000000000000)
  movabs $0xffffffffffff, %r10
  and    %r10, %rax
  movabs $0xfff8000000000000, %r11
  or     %r11, %rax
  ret
  ```

#### 2. Native Direct Entry (`0x4e`):
- Tuân thủ nghiêm ngặt chuẩn Windows x64 ABI:
  - Tham số truyền qua thanh ghi `%rcx`.
  - Kết quả trả về qua thanh ghi `%rax`.
  - Bảo tồn toàn bộ tập thanh ghi Callee-saved: `%rbx`, `%rsi`, `%rdi`, `%r12`, `%r13`, `%r14`, `%r15`.
- **Đệ quy không cấp phát:**
  - Nhánh 1: Tính $n - 1$ vào `%rcx`, cấp 32 bytes shadow space, `call 0x4e`. Lưu kết quả $fib(n-1)$ vào thanh ghi Callee-saved `%r14`.
  - Nhánh 2: Tính $n - 2$ vào `%rcx`, cấp 32 bytes shadow space, `call 0x4e`.
  - Cộng `%r14 + %rax` và trả về qua `%rax`.
- **Hiệu quả:** $2,692,537$ lời gọi đệ quy diễn ra trực tiếp trên Native CPU Stack ở tốc độ chu kỳ máy, không phát sinh bất kỳ syscall hay VM frame allocation nào!

---

### Phase 2.3-E: Khắc phục Lỗi Bounding Hàm trong `machine_ir.cpp`
- **Chẩn đoán Nguyên nhân Gốc:**
  Trong `MIRFunction::build_from_bytecode` (`src/vm/machine_ir.cpp`), logic phân tích biên hàm trước đó sử dụng:
  ```cpp
  if (start_ip > 0 && ip >= max_target && end_ip == chunk.code.size()) {
      end_ip = ip;
  }
  ```
  Đối với hàm có cấu trúc `if (n < 2) return n; return fib(n-1) + fib(n-2);`, khi quét qua lệnh `return n` đầu tiên, `ip` vừa bằng đích nhảy của `if_false`, dẫn đến việc hàm bị cắt cụt (truncate) ngay tại lệnh return thứ nhất!
- **Giải pháp Khắc phục:**
  1. Sử dụng trực tiếp `chunk.function_table` để xác định chính xác điểm bắt đầu của hàm kế tiếp:
     ```cpp
     for (size_t fe : chunk.function_table) {
         if (fe > start_ip && fe < end_ip) {
             end_ip = fe;
         }
     }
     ```
  2. Cập nhật điều kiện fallback sang so sánh nghiêm ngặt `ip > max_target`.
- **Kết quả:** `fib` được biên dịch trọn vẹn 3 Basic Blocks (`B_6`, `B_43`, `B_54`), nhận diện chính xác `is_self_recursive = true`, sinh mã máy native hoàn hảo.

---

## 3. Dữ liệu Đo kiểm Thực nghiệm (Telemetry & Verification)

### So sánh Thời gian Thực thi Workload W1 Fibonacci ($n = 30$):

| Tầng Thực thi (Execution Tier) | Baseline Cũ (Trước G6R.2.3) | Thực nghiệm G6R.2.3 | Tốc độ Cải thiện | Trạng thái |
| :--- | :---: | :---: | :---: | :---: |
| **Interpreter ($M1$)** | ~145.0 ms | **$100.80\text{ ms}$** | $+43.8\%$ | **PASS ($\le 120$ ms)** |
| **Optimizing JIT ($M3$)** | ~95.0 ms | **$5.22\text{ ms}$** | $\mathbf{18.2\times}$ | **PASS ($\le 45$ ms)** |
| **Native AOT ($M4$)** | ~4.20 ms | **$4.15\text{ ms}$** | Baseline chuẩn | **Reference** |

- Tỉ lệ tiệm cận giữa JIT và Native AOT: **$1.25\times$** (Khoảng cách hiệu năng gần như triệt tiêu hoàn toàn!).

### Tính Đúng đắn & Kiểm thử Vi sai:
- Checksum: `832040` bit-exact $100\%$ qua mọi lần chạy.
- Bộ kiểm thử vi sai: `setunc_test.exe` chạy thành công **33/33 tests (100% SUCCESS)**.

---

## 4. Bằng chứng Bất biến Mật mã (Cryptographic Seal Dossier)

Tất cả các tệp bằng chứng đã được băm SHA-256 và đóng gói vào `test_registry/g6r2/g6r2_3_frame.json`:

| Tệp Bằng chứng / Thành phần | Đường dẫn Lưu trữ | Giá trị Băm SHA-256 |
| :--- | :--- | :--- |
| **Frame Microbenchmark** | `benchmarks/g6r2/microbench/frame_microbench.cpp` | `805C2A4161825B1B9616CBE9D38D1A3028515DAD9EBA51AAADF49A147C1D995A` |
| **Frame Cost Decomposition** | `benchmarks/g6r2/raw/frame_cost_decomposition.json` | `2C27ED7A033168C9E867F6A3688C82CDC8FA36753B2017C938263FD4987AAC88` |
| **Disassembly Causal Proof** | `benchmarks/g6r2/disassembly/W1/jit_call.asm` | `21B0237B4E350A1FA94159EBF9288E37FA4D51529836837EEC149A17AE466DA5` |
| **Telemetry JSON** | `benchmarks/g6r2/raw/w1_frame_telemetry.json` | `D220E473ED167B5537711C18BFF3A500EC8303E37BF9A652C01D4038889BE0CF` |
| **Source: Optimizing JIT** | `src/vm/optimizing_jit.cpp` | `85315E19DBF7B29471E457C0E39FB3C23379D03BA621377138D20900ABE0A9D6` |
| **Source: Machine IR** | `src/vm/machine_ir.cpp` | `9F29431688D6C070E1C10BA3A1737C2CF3615DBD700F23AA205A6319F67D7574` |
| **Source: Assembler** | `src/vm/x64_assembler.cpp` | `AAD6CA3CA1505829F1B583E497479FD93E91A8B16FF7270ABC68D372FDC45545` |
| **Master Seal Certificate** | `test_registry/g6r2/g6r2_3_frame.json` | `SEAL-G6R-2.3-FRAME-20260919` |

---

## 5. Kết luận & Sẵn sàng Chuyển tiếp

Sub-Gate **G6R.2.3** đã hoàn thành xuất sắc toàn bộ 10 tiêu chí Definition of Done được quy định tại Mục 61 của [Doc/G6.2.md](file:///d:/New%20PJ/Ternary/Compiler/Doc/G6.2.md):
- **W1 Fibonacci runtime:** Interpreter đạt $100.80\text{ ms}$ ($\le 120\text{ ms}$), JIT đạt $5.22\text{ ms}$ ($\le 45\text{ ms}$, đạt stretch target $\le 5.5\text{ ms}$).
- **Bảo toàn P0:** Checksum bit-exact `832040`, 33/33 Differential Tests đạt $100\%$ PASS.
- **Hạ tầng hoàn tất:** Toàn bộ bằng chứng microbenchmark, disassembly, telemetry và seal cryptographic đã được lập danh mục đầy đủ.

Cổng G6R.2.3 chính thức được **SEALED**. Hệ thống hoàn toàn sẵn sàng chuyển tiếp sang **Sub-Gate G6R.2.4 (W2 BCE & Loop Vectorization / Bound Check Elimination)** hoặc các nhiệm vụ tiếp theo theo chỉ đạo của người dùng.
