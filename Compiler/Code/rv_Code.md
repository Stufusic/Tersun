# rv_Code — Review thư mục `Code/` (toolchain)

> Ngày review: 2026-09-06 · HEAD: `2948efe` · Tham chiếu: `src/compiler`, `src/vm`, `src/qvm`, `src/graphics`, `src/tafpu`, `src/tools`, `include/stdtaf`, `tests/`

## Tổng quan sức khỏe: **7.5/10**

~11.000 dòng C++20, build bằng 1 lệnh g++ (build_toolchain.bat) tách 2 binary: `setunc.exe` (production, không kèm test) và `setunc_test.exe` (suite đầy đủ). 0 warning build. Tất cả các phát hiện bên dưới **đã được verify bằng chạy thử** trong các milestone `94f1431 → 2948efe`.

## 1. `src/compiler/` — frontend + emitters

**Đã sửa (đã verify):**
- Type checker: duplicate detection (fn/class/struct/interface/enum), method existence + arity qua `Type::methods` (trước đây map này có sẵn nhưng chưa từng được điền), tham số kiểu tùy chỉnh resolve qua `type_defs_` (`Parameter.custom_type_name`).
- `AmbiguousTripleExpr` + pre-pass phân giải `[a,b,c]` theo ngữ cảnh kiểu (var/field/param/return taf3, anchor tafpu, assert) — 158 chỗ legacy sweep 0 fail.
- ModuleResolver: include path neo theo exe, import-as + rewrite tham chiếu nội bộ, giữ ImportStmt để đăng ký alias, lỗi parse module kèm đường dẫn file.
- Emitter: constructor auto-init `X(args...)` → `init(args...)` kèm arity check; loop-context stack (break/continue/label); `try_depth_` phát `OP_POP_TRY` khi break/return xuyên try; f-string parts + `fmt(spec)`; disassembler đọc đúng operand mọi opcode.
- `emit_class_ctor` là điểm cần giữ sạch: logic constructor nằm 1 chỗ, emit_call và alias-call cùng dùng.

**Còn lại (nợ, chưa sửa):**
- `emit_binary(NULL_COALESCE)` còn case `OP_DUP` chết (parser đã chặn `??` trước đó) — vô hại nhưng nên dọn.
- `OP_CALL` entry `uint16` + jump `int16` — trần 64KB code; chưa có guard tổng cho `chunk_.code.size()`.
- `emit_fstring_lit` với part expression sai kiểu vẫn render được (checker coi ANY) — chấp nhận được.
- Trailing dead code: `handle_get_field` push 0 cho tafpu field lạ đã đổi thành throw — cần theo dõi regression.

## 2. `src/vm/` — bytecode VM

**Đã sửa:** whitelist native host theo `type_name` (hết hijack method user), missing-field → VMException, unknown syscall → -1, ternary min/max giữ bool-ness (cho `&&`/`||`), `fs_err()`, `not` hạ `== false`, stdlib collection (slice/sort/reverse/contains/index_of/concat/join + split/trim), try/catch (OP_TRY/THROW/POP_TRY + TryFrame unwind trong run loop — stack/locals/call_depth restore đúng), Unicode (chr → UTF-8, ulen/uslice/uindex/text_width).

**Còn lại:**
- `locals_.resize` tăng dần theo đệ quy sâu — memory amplification khi recursion nặng.
- `sort()` so sánh qua `to_string` cho chuỗi — không có collation; chấp nhận v1.
- Stack junk không pop khi STORE_LOCAL (peek) — design cũ, vô hại nhưng làm stack phình theo số `let` (đã ghi chú trong rv trước).

## 3. `src/qvm/` — Q-ISA simulator

**Đã sửa:** disassemble khớp 100% `QVM::run` (RX/RY/RZ 8-byte f64, BRANCH3/JUMP absolute + summary gate counts), loader validate (64MB / 1024 qubits).

**Còn lại:** `constant_pool_f64` tồn tại trong QChunk nhưng chưa serialize/dùng; `OP_BRANCH3`/`OP_JUMP`/`OP_PACK2`/`OP_MEASURE` có trong ISA nhưng QEmitter chưa từng phát — Q-ISA hiện là lowering demo (CNOT-as-add là minh họa, không phải Draper adder). Nên nói rõ trong tài liệu trước khi claim chạy trên IBM Quantum.

## 4. `src/graphics/setun2d_bridge.cpp` — GUI Win32

**Đã sửa:** W-window + `TextOutW` + font Segoe UI + WM_CHAR surrogate → codepoint + `text_width()` + stuck-keys khi mất focus + click-latch/flip đúng vòng 1-pump-per-frame.

**Còn lại:** chưa có `GetTextExtentPoint32W` cache (mỗi gọi đo lại — OK cho widget ít text); hover tooltip vẫn heuristic `ulen()*8`; SendInput inject click toàn hệ thống — cần permission flag trước khi phân phối app.

## 5. `src/tafpu/` — TAFPU engine

Chưa review sâu theo dòng trong các milestone này (thay đổi gần nhất chỉ là `to_ternary_string` dùng bởi `:t`). Suite `test_tafpu_*` pass — nhưng các claim "0% sai số" cần benchmark độc lập.

## 6. `src/tools/`, `src/game/`, `src/kernel/`, `src/hardware/`, `src/ffi/`

Lớp module breadth (LSP, debugger, bindgen, TPM, actor, microkernel, verilog) — **chưa được kiểm chứng mức production**, không chặn gì. `test_runner_stub.cpp` là chỗ thay thế run_all_tests khi tách binary.

## 7. `include/stdtaf/` — stdlib tự host

fs/gui/keyboard/mouse + gauss_jordan + tst. GUI widgets tốt (MouseTracker/ScrollView/TextInput đã Unicode-aware). Thiếu: `plot.stn` (đang làm tiếp theo), `lab_math.stn`, collection algorithms (map/filter cần closures — Tầng 3).

## 8. `tests/` — suite

10 script .stn runtime + negative compile tests trong `test_stn_semantics.cpp`; runner đi qua đúng pipeline production (resolve + typecheck + mono + emit + run). Điểm mạnh: test negative assert cả **nội dung** thông báo lỗi. Thiếu: test GUI (headless chỉ verify không crash), test Q-ISA unroll chưa vào suite (probe ngoài).

## Kết luận & việc tiếp theo

Code đạt chuẩn để tiếp tục xây Lab. Ba việc nên cắm vào backlog theo ưu tiên: (1) guard 64KB code size, (2) benchmark độc lập cho claim TAFPU, (3) permission flags cho fs/input trước khi phân phối.
