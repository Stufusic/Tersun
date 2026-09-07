# rv_Compiler — Review tổng thể dự án Tersun

> Ngày review: 2026-09-06 · HEAD: `2948efe` · Reviewer: ZCode (agent)
> Bản review chi tiết theo thư mục: `Code/rv_Code.md`, `Doc/rv_Doc.md`, `Projects/rv_Projects.md`, `tests/rv_tests.md`, `scratch/rv_scratch.md`

## Tóm tắt điều hành

Tersun 1.0.3 là một toolchain ngôn ngữ tam phân cân bằng (balanced ternary) **chạy được thật trên 4 target**: bytecode VM (.tbc), Q-ISA lượng tử (.qbc), native exe (LLVM AOT) và C-transpile. Sau 3 đợt sửa lớn (core fixes → Tier 1 → Tier 2 + Unicode), trạng thái hiện tại là **"đủ tin cậy để xây sản phẩm"** — ngưỡng reached trước khi bắt đầu Scientific Lab.

## Lịch sử các mốc quan trọng gần đây

| Commit | Nội dung |
|---|---|
| `9d6f88a` → `caf3048` | Release 1.0.0–1.0.2 (baseline khi bắt đầu review) |
| `94f1431` | fix(core): P0 semantics, module resolution, serializer, disasm + `&&` `\|\|` |
| `702594a` | diag có tên file + suite test .stn + CI thật |
| `44586d1` | Tier 1: for/elif/compound/taf3/f-string trên cả 4 target |
| `690de45` | QVM disasm chuẩn ISA, `not`, stdlib collections, class-typed params |
| `304f953` | Tier 2: try/catch, namespace `import as` + pub/priv |
| `2948efe` | Unicode GUI (UTF-8 everywhere) |

## Điểm mạnh (đã verify bằng chạy thử)

1. **Hợp đồng runtime trung thực** — mọi lỗi đều loud: compile error kèm `file:line:col`, field/method thiếu → error, syscall lạ → mã lỗi, file hỏng → từ chối load.
2. **4 target đồng bộ** — cùng một .stn chạy trên VM/QVM/native/C; cấu trúc không hỗ trợ đều báo lỗi rõ thay vì âm thầm.
3. **Test suite tự host** — 10 script .stn + negative tests chạy trong `setunc_test`, CI Windows chạy mỗi push.
4. **Bản sắc ternary thật**: `<=>` + `branch` + Kleene min/max + `taf3` + in trit `:t` — không ngôn ngữ nào khác có.

## Rủi ro / nợ kỹ thuật còn lại (ưu tiên giảm dần)

1. **Trần scale VM**: `OP_CALL` entry 16-bit (~64KB code) — chưa có guard tổng; Q-ISA cap 16 qubit.
2. **Thư viện chuẩn mỏng**: chưa có map/filter/reduce (cần closures — Tầng 3), sort chỉ basic.
3. **Giới hạn đã ghi chú**: emit-c `continue` trong for nhảy về condition; Q-ISA break/label chỉ vòng trong cùng.
4. **Claims tài liệu chưa đối chiếu**: "zero algebraic drift", "100% backward compat" cần benchmark độc lập trước khi public rộng.

## Bước tiếp theo (đã chốt lộ trình)

`std/plot.stn` → `std/lab_math.stn` → Scientific Lab shell + demo Exact Mode (TAFPU vs float). Ngôn ngữ đóng băng trừ khi Lab đòi hỏi.

---

## 🔄 Cập nhật Tier 3 (2026-09-06 · HEAD `2827cc1`)

Năm trong sáu milestone Tier 3 đã hoàn tất, mỗi cái một commit:

| Milestone | Commit | Verify |
|---|---|---|
| M1 Function table (hết trần 64KB) | `a0c27c6` | Chương trình 194KB chạy đúng; .tbc v1 legacy tương thích |
| M2 Closures + map/filter/reduce | `d1fc61a` | `CLOSURES_OK` — lambda capture, snapshot semantics |
| M3 Interface dispatch + conformance | `8989e4c` | `IFACE_OK` — thiếu method báo lỗi đích danh |
| M4 Generics (turbofish + monomorphizer v2 + generic struct) | `28de0da` | `GEN_OK` — inferred + `::< >` |
| M5 Exceptions trên native (emit-c C++ 1:1) | `2827cc1` | Native exe bắt script throw |

**Còn lại:** M6 QFT + Grover (thiết kế duyệt: cphase decomposition từ gate có sẵn, QFT/Grover builder, test so biên độ với DFT tham chiếu).

**Kết luận cập nhật:** khoảng cách cấu trúc với một ngôn ngữ scripting phổ thông (Lua/Python mini) đã **khép lại** — closures, generics, interface, exceptions, namespace đều có. Phần còn lại của Tier 3 và hệ sinh thái (tài liệu, packaging) là việc hoàn thiện, không phải năng lực biểu đạt.

---

## ✅ Cập nhật Tier 3 hoàn tất (2026-09-06 · M6)

M6 — QFT + Grover trên Q-ISA: **6/6 milestone Tier 3 đã xong**. Không thêm gate/opcode mới nào; cphase được phân rã ngay lúc build thành các gate primitive có sẵn.

**Triển khai:**
- `QuantumCircuit::cphase(ctrl, target, θ)` — decomposition chuẩn 5 gate: `RZ(θ/2)_ctrl · CNOT · RZ(−θ/2)_tgt · CNOT · RZ(θ/2)_tgt`, đúng bằng CP(θ) lên đến global phase e^{−iθ/4} (vô hình trong |amp|/measurement). Thiết kế duyệt nêu chuỗi 4 gate (2 RZ cùng đặt trên target) — chuỗi đó cho diag(1,1,e^{−iθ/2},e^{+iθ/2}), **không phải** CP(θ), nên đã dùng bản chuẩn 5 gate.
- `QuantumCircuit::qft(n)` — phase ladder MSB-first + cphase(π/2^{b−c}) + bit-reversal swap; convention qubit q = bit q của index (q0 = LSB).
- `QuantumCircuit::grover(n, target)` (n ≤ 3) — oracle X-mask + multi-controlled-Z (n=1: Z, n=2: CZ, n=3: H·TOFFOLI·H = CCZ) + unmask; diffusion H^n X^n CZ X^n H^n; R = ⌊π/4·√N⌋ vòng; **đòi hỏi register khởi đầu |0…0⟩** (builtin tự chuẩn bị uniform).
- Builtins Q-ISA ở `QEmitter`: `qft(n)` / `grover(n, target)` / `qmeasure(q)` (qmeasure đo qubit q vào classical reg q — cầu bắt buộc để run-qvm đọc kết quả; cùng pattern statement-style với bitnet_*). Gate → bytecode qua serializer chung, kèm `QChunk::emit_f64` inline little-endian (đúng format disassembler đã đọc từ trước, không đổi format .qbc).
- `QVM::run` vá dispatch **OP_RX/RY/RZ** (ISA định nghĩa sẵn, disassembler đọc được nhưng interpreter rơi vào `default: halt`) — đây là hoàn thiện ISA hiện có, không phải opcode mới.

**Verify:**
- C++ suite QVM nâng 8/8 → **14/14**: cphase so với ma trận CP phân tích (1e-9, cả phức up-to-global-phase); QFT n=1..5 so với DFT tham chiếu (|amp| 1e-9); Grover so với analytic sin((2R+1)θ) 1e-9 (n=2: 1.0 chính xác; n=3: 0.972 ≥ 0.9); QASM export đếm đúng 3H/6CX/9RZ/1SWAP cho QFT(3); parity bytecode-vs-circuit 65536 amplitudes 1e-9.
- Probe `Code/tests/stn/quantum_algorithms.stn`: `compile --qvm` → `run-qvm` đo exit code **1 deterministic (5/5 lần)** — grover(2,3) khuếch đại |11⟩ đúng 1.0 nên phép đo không flake; `emit-qasm` ra QASM 3.0 đủ 20 gate primitive. Probe được nạp trực tiếp trong test 13/14 nên CI chạm tới file thật.
- Full `setunc_test`: 100% pass.

**Phát hiện phụ (pre-existing, chưa xử lý):** `Lexer` nhận `string_view` và xử lý sai UTF-8 multibyte ngoài string literal — em dash trong .stn comment làm tokenization sai âm thầm (probe bản đầu dính lỗi này). Cần rv Lexer riêng; probe đã chuyển về ASCII thuần.

**Vị trí file:** `Code/include/qvm/qgate.hpp` (+15), `Code/src/qvm/qgate.cpp` (+91), `Code/include/qvm/qopcode.hpp` (+11), `Code/src/qvm/qvm.cpp` (+30), `Code/include/compiler/q_emitter.hpp` (+3), `Code/src/compiler/q_emitter.cpp` (+115), `Code/tests/test_qvm.cpp` (+357), `Code/tests/stn/quantum_algorithms.stn` (mới) — tổng ~635 dòng / 8 file + 1 probe.

---

## 📊 Benchmark thực đo (2026-09-06 · `Code/bench/`)

Suite benchmark đo thật (thay cho `benchmark_vs_python_rust.py` cũ có số hardcode): **fib(24) đệ quy | vòng 2M có rẽ nhánh | vòng 5M cộng có sawtooth-reset** trên 4 đường thực thi + **QFT(8/12) qua .stn → --qvm** so với pure-Python statevector sim chạy đúng QASM emit ra. Chạy lại bằng `python Code/bench/run_bench.py`.

| Benchmark | Tersun VM (.tbc) | Tersun --native (AOT) | CPython 3.14 | C++ g++ -O3 |
|---|---|---|---|---|
| B1 fib(24) | 27.6 ms | 0.21 ms | 4.6–10 ms | 0.07 ms |
| B2 branchy 2M | 767 ms | 1.1 ms | 175–258 ms | 0.37–0.41 ms |
| B3 sum 5M (sawtooth) | 1,918 ms | 1.2 ms | 478–666 ms | 1.5–5.0 ms |

Quantum (cùng circuit, cùng QASM, register 16 qubit): **QVM (.qbc) 8.3–9.9k gate/s** vs **pure-Python sim 191–196 gate/s** → ~45×; QFT(12) chạy 42 ms trên QVM.

**Đọc kết quả:**
- VM .tbc chậm hơn **CPython 3.14 khoảng 4–6×** — dispatch loop đơn giản, không JIT; đây là điểm yếu hiệu năng rõ nhất.
- Đường --native (emit-c → g++ -O3) nhanh hơn VM **20–600×**, chỉ chậm hơn C++ viết tay ~3× ở fib. Điểm thú vị: mọi `int` được hạ xuống TAFPU (số đại số Q(√3)) — GCC inline + chuyên biệt hóa đường nguyên nên vòng lặp đạt ~1 cycle/iter.
- QVM/C++ statevector ~45× nhanh hơn Python cùng circuit — đủ dùng thực tế (QFT(12) 16 qubit = 42 ms).

**Bug phát hiện khi benchmark (pre-existing, chưa fix):**
1. **VM .tbc: đệ quy dùng biến cục bộ trả SAI kết quả** — `let r = 0; if..else { r = f(n-1)+f(n-2); } return r;` cho 0 thay vì 55; dạng early-return `if..return n; return f(n-1)+f(n-2);` đúng. Đường --native đúng cả hai → bug thuộc VM emitter (frame/scope của local khi gọi đệ quy). Repro: mini 2 hàm trong `Code/bench/` (đã dọn, mô tả ở đây). Test chính thức chỉ cover early-return nên lọt.
2. Ngôn ngữ **không có toán tử modulo/bitwise** — benchmark phải viết lại bằng so sánh.
3. Lexer không chịu UTF-8 multibyte ngoài string literal (đã ghi ở mục M6).
4. `time_now_us` chỉ có ở VM, thiếu ở emit-c → benchmark native phải đo external.
