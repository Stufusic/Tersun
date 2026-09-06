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
