Kế hoạch này **đúng hướng về mặt kiến trúc**, nhưng ở trạng thái hiện tại tôi **chưa coi phần “100% backward compatible với QVM 1.0.1” là đã được chứng minh**. Điểm mạnh nhất là “zero new opcode”; điểm yếu lớn nhất là giả định rằng QVM 1.0.1 đã có một **native syscall/trap path** đủ dùng.

Tôi đánh giá khoảng **7/10 về kiến trúc**, nhưng chỉ khoảng **4–5/10 về bằng chứng tương thích ngược**.

## 1. Điểm đúng và rất đáng giữ

Ý tưởng:

```text
Tersun 1.0.2
    ↓
lowering xuống ISA 1.0.1
    ↓
register convention
    ↓
native dispatch
```

là hướng tốt.

Đặc biệt, việc **không tạo `OP_MOUSE_*`** là quyết định đúng nếu mục tiêu là giữ tập ISA của 1.0.1.

Tuy nhiên cần phân biệt ba loại “backward compatible”:

| Loại                                                                                  | Kế hoạch hiện tại  |
| ------------------------------------------------------------------------------------- | ------------------ |
| **ISA compatibility** — không có opcode mới                                           | ✅ Có vẻ đúng       |
| **Bytecode compatibility** — `.tbc/.qbc` 1.0.2 được loader 1.0.1 chấp nhận            | ⚠️ Chưa chứng minh |
| **Behavioral compatibility** — chạy trên đúng QVM 1.0.1 cũ và mouse thực sự hoạt động | ❌ Chưa chứng minh  |

Đây là điểm quan trọng nhất.

---

# 2. Lỗ hổng lớn nhất: `R[0] = 104` không tự tạo ra syscall

Đoạn này:

```text
R[0] = SYS_MOUSE_CLICK
R[1] = btn
R[2] = x
R[3] = y
```

chỉ có ý nghĩa **nếu QVM 1.0.1 đã có một instruction/cơ chế hiện hữu để nói rằng:**

> “Hãy lấy R0 làm syscall ID và chuyển quyền sang native dispatcher.”

Nếu ISA 1.0.1 hiện tại chỉ có:

```text
OP_INIT
OP_PACK2
OP_UNPACK2
quantum ops
OP_MEASURE
OP_BRANCH3
OP_JUMP
OP_HALT
```

mà **không có `OP_SYSCALL`, `OP_HOSTCALL`, `OP_TRAP`, `OP_NATIVE`, `OP_CALL_HOST` hoặc tương đương**, thì:

```text
MOV R0, 104
```

không thể tự nhiên kích hoạt C++:

```cpp
setun2d_mouse_click(...)
```

Runtime sẽ chỉ thấy các instruction bình thường.

### Đây là “gate” số 1 của toàn bộ thiết kế.

Cần kiểm tra chính xác QVM 1.0.1 có một trong các cơ chế sau không:

```text
existing syscall opcode
existing native-call opcode
existing trap mechanism
existing host-function table
existing reserved instruction semantic
existing ABI bridge
```

Nếu **không có**, thì tuyên bố:

> “không thêm opcode nhưng vẫn gọi native mouse API”

**không thể thực hiện chỉ bằng compiler emitter**.

Khi đó có hai lựa chọn:

### A. Có generic syscall/trap sẵn

Tốt nhất.

Ví dụ:

```text
LOAD R0, 104
LOAD R1, btn
LOAD R2, x
LOAD R3, y
OP_TRAP        ← opcode đã có từ 1.0.1
```

Khi đó thiết kế của bạn rất sạch.

### B. Không có syscall/trap sẵn

Thì phải sửa semantics của một cơ chế hiện hữu hoặc sửa QVM.

Khi ấy vẫn có thể giữ **ISA bytecode không đổi**, nhưng không còn là:

> “QVM 1.0.1 nguyên bản, không sửa gì”

mà chính xác hơn phải gọi:

> **QVM 1.0.1-compatible runtime with native host extension**

Hai khái niệm này không giống nhau.

---

# 3. Có một mâu thuẫn trong mục tiêu “Runtime QVM 1.0.1 hiện hành”

Bạn vừa nói:

> Runtime QVM 1.0.1 hiện hành

và kế hoạch lại yêu cầu sửa:

```text
setun2d_bridge.hpp
setun2d_bridge.cpp
```

Điều này có nghĩa runtime thực tế đang được **mở rộng capability**.

Điều đó hoàn toàn ổn, nhưng nên định nghĩa tương thích như sau:

```text
QVM ISA version = 1.0.1
Runtime host implementation = 1.0.1 + Mouse Native Bridge
```

thay vì:

```text
QVM 1.0.1 unchanged
```

Tôi khuyến nghị đổi terminology ngay từ tài liệu, vì đây sẽ là điểm dễ bị reviewer bắt lỗi nhất.

---

# 4. Tôi khuyên tách “generic syscall” khỏi “mouse syscall”

Hiện tại kế hoạch đang hơi gắn chặt:

```text
mouse_click()
        ↓
SYS_MOUSE_CLICK = 104
        ↓
native
```

Thiết kế sạch hơn là:

```text
Tersun built-in
    ↓
generic host_call()
    ↓
existing QVM ABI
    ↓
host syscall table
    ↓
SYS_MOUSE_*
```

Ví dụ:

```text
R0 = HOST_MOUSE
R1 = MOUSE_CLICK
R2 = btn
R3 = x
R4 = y
TRAP
```

hoặc:

```text
R0 = 104
R1 = ...
R2 = ...
R3 = ...
TRAP
```

Quan trọng là **mouse ID phải nằm ở syscall namespace, không phải ISA namespace**.

Tức là:

```text
0x89 = OP_MOUSE_CLICK        ❌
104  = SYS_MOUSE_CLICK       ✅
```

Điểm này trong kế hoạch của bạn là đúng.

---

# 5. `on_click(callback)` hiện đang khó hơn rất nhiều so với các API khác

Các API này khá đơn giản:

```text
mouse_get_x()
mouse_get_y()
mouse_move()
mouse_click()
is_mouse_down()
```

nhưng:

```text
on_click(callback)
```

không chỉ là mouse feature.

Compiler/runtime còn phải hỗ trợ:

```text
function value
      ↓
callback reference
      ↓
persistent storage
      ↓
event dispatcher
      ↓
call callback(btn, x, y)
```

Nếu Tersun 1.0.2 chưa có function pointer/closure/callable object thì `on_click()` sẽ làm phạm vi dự án phình lên đáng kể.

Tôi khuyên **giai đoạn đầu không nên lấy callback làm primitive runtime API**.

Nên thiết kế tầng thấp:

```text
poll_mouse()
mouse_get_x()
mouse_get_y()
mouse_get_button()
is_mouse_down()
```

sau đó `mouse.stn` tự xây:

```text
on_click(...)
```

ở tầng language/library nếu compiler đã có cơ chế callback.

---

# 6. `on_click` và edge detection hiện đang hơi sai semantics

Bạn viết:

```text
thả → nhấn
    ↓
on_click()
```

Tôi không khuyến nghị gọi đó là `click`.

Thông thường nên tách:

```text
button down
button up
click = down + up
```

Ví dụ:

```text
on_mouse_down(btn, x, y)
on_mouse_up(btn, x, y)
on_click(btn, x, y)
```

Nếu chỉ phát `on_click` ngay khi `WM_LBUTTONDOWN`, tên API sẽ dễ gây lỗi logic UI sau này.

Đặc biệt với:

```text
button → slider → drag → release
```

thì `down/up` rõ ràng hơn rất nhiều.

---

# 7. `mouse_get_button() -> int` có vấn đề khi nhiều nút cùng nhấn

Thiết kế:

```text
LEFT   = -1
MIDDLE =  0
RIGHT  = +1
NO BTN = 99
```

rất đẹp về mặt balanced ternary, nhưng:

```text
LEFT + RIGHT
```

không biểu diễn được.

Ví dụ người dùng giữ Left rồi nhấn Right, API phải trả gì?

Không có câu trả lời duy nhất cho:

```text
mouse_get_button()
```

Tôi đề xuất tách:

```text
mouse_get_button()
```

thành **last transition / active event button**, còn trạng thái thực tế nên là:

```text
is_mouse_down(BUTTON_LEFT)
is_mouse_down(BUTTON_MIDDLE)
is_mouse_down(BUTTON_RIGHT)
```

Như vậy API hiện tại vẫn giữ được, còn semantics rõ ràng.

---

# 8. Cần phân biệt tọa độ Window và tọa độ Screen

Đây là vấn đề rất quan trọng đối với:

```cpp
SetCursorPos(x, y);
```

và:

```cpp
GetCursorPos(...)
```

`SetCursorPos()` dùng tọa độ màn hình.

Trong khi:

```text
WM_MOUSEMOVE
```

thường cho tọa độ tương đối cửa sổ/client.

Nếu không chuẩn hóa ngay từ đầu, bạn sẽ có bug dạng:

```text
mouse_get_x() = 300
```

nhưng:

```text
mouse_move(300, 200)
```

lại đưa chuột tới pixel `(300,200)` của **toàn desktop**, không phải `(300,200)` của canvas.

Tôi khuyên đặt rõ:

```text
mouse_get_x/y()
    = application/client coordinates
```

và:

```text
mouse_move()
mouse_click()
    = application coordinates
```

sau đó native bridge thực hiện:

```text
client → screen
```

trước khi gọi `SetCursorPos`.

Nếu thật sự muốn OS automation toàn màn hình, nên có API riêng:

```text
mouse_move_screen(x, y)
mouse_click_screen(...)
```

Đừng trộn hai namespace.

---

# 9. `SendInput` nên tách khỏi input polling

Bạn đang gộp:

```text
input observation
```

và:

```text
OS input injection
```

vào cùng một module.

Về API thì được, nhưng về kiến trúc tôi sẽ chia:

```text
std/mouse.stn
 ├── query
 │    ├── get_x
 │    ├── get_y
 │    ├── button
 │    └── is_down
 │
 ├── events
 │    ├── poll
 │    └── callback
 │
 └── automation
      ├── move
      └── click
```

Điều này cũng thuận lợi nếu sau này QVM có sandbox/capability permission.

---

# 10. `mouse.stn` không nên là nơi quyết định Win32 semantics

Tôi sẽ để:

```text
mouse.stn
```

chỉ biết:

```text
SYS_MOUSE_GET_POS
SYS_MOUSE_GET_BTN
SYS_MOUSE_MOVE
SYS_MOUSE_CLICK
SYS_MOUSE_POLL
```

Còn:

```text
WM_MOUSEMOVE
WM_LBUTTONDOWN
GetCursorPos
SetCursorPos
SendInput
```

phải hoàn toàn nằm trong native host layer.

Kiến trúc lúc đó rất sạch:

```text
Tersun
   ↓
stdlib mouse
   ↓
generic host syscall ABI
   ↓
QVM
   ↓
setun2d_bridge
   ↓
Win32
```

---

# 11. Verification Plan cần mạnh hơn đáng kể

Test:

```powershell
compile ...
run ...
```

chưa đủ để chứng minh backward compatibility.

Tôi sẽ bổ sung **4 lớp test**.

### Test A — Opcode whitelist

Disassemble `.tbc`, kiểm tra:

```text
∀ opcode ∈ emitted bytecode:
    opcode ∈ ISA_1_0_1
```

Đây mới là test “zero opcode bloat”.

### Test B — Loader compatibility

Chạy `.tbc` sinh bởi compiler 1.0.2 bằng:

```text
exact QVM 1.0.1 binary
```

chứ không phải runtime đã rebuild từ source 1.0.2.

### Test C — Semantic compatibility

So sánh:

```text
ordinary programs compiled by 1.0.1
ordinary programs compiled by 1.0.2
```

để đảm bảo mouse feature không làm thay đổi semantics của các chương trình cũ.

### Test D — Native capability test

Test riêng:

```text
SYS_MOUSE_GET_POS
SYS_MOUSE_GET_BTN
SYS_MOUSE_MOVE
SYS_MOUSE_CLICK
SYS_MOUSE_POLL
```

và kiểm tra register ABI:

```text
R0
R1
R2
R3
```

trước/sau syscall.

---

# 12. Tôi còn muốn thêm “Golden Bytecode Test”

Đây sẽ là một test rất mạnh.

Lấy một chương trình không sử dụng mouse:

```text
hello.stn
```

Compiler 1.0.1:

```text
hello_101.tbc
```

Compiler 1.0.2:

```text
hello_102.tbc
```

Sau đó kiểm tra:

```text
semantic-equivalent
```

và tốt hơn nữa:

```text
byte-for-byte identical
```

ở những chương trình không sử dụng tính năng 1.0.2.

Điều này giúp chứng minh:

> Tersun 1.0.2 không vô tình làm thay đổi code generation 1.0.1.

---

# 13. Cấu trúc tôi đề xuất sau khi chỉnh

Tôi sẽ sửa kế hoạch thành:

```text
                    Tersun 1.0.2
                          │
                    mouse.stn API
                          │
                          ▼
                 Compiler Lowering
                          │
                          ▼
              Existing QVM Host ABI
                 / Existing Trap /
                Existing Syscall Path
                          │
                          ▼
                ISA strictly 1.0.1
                          │
                          ▼
                   QVM 1.0.1
                          │
                          ▼
               Native Host Dispatcher
                          │
                  ┌───────┴───────┐
                  │               │
                Query          Injection
                  │               │
             GetCursorPos     SetCursorPos
             WM_MOUSE*        SendInput
```

Và nguyên tắc bắt buộc:

```text
NEW LANGUAGE API        ✅
NEW SYSCALL ID          ✅
NEW HOST IMPLEMENTATION ✅
NEW OPCODE              ❌
NEW ISA                 ❌
```

Đây là cách diễn đạt chính xác hơn rất nhiều so với “không có bất kỳ extension nào”.

---

# 14. Kết luận

**Ý tưởng zero-opcode là đúng và tôi sẽ giữ.** Nhưng tài liệu hiện tại đang nhảy từ:

```text
"không tạo opcode mới"
```

sang:

```text
"QVM 1.0.1 sẽ tự dispatch syscall"
```

mà chưa chứng minh bước trung gian.

Điểm cần xác minh đầu tiên không phải `mouse.stn`, cũng không phải Win32. Mà là:

> **ISA/QVM 1.0.1 hiện tại đã có cơ chế nào để bytecode yêu cầu native host call hay chưa?**

Nếu **có**, kế hoạch này có thể trở thành một kiến trúc rất đẹp và thực sự backward-compatible ở cấp bytecode.

Nếu **không có**, tôi sẽ sửa mục tiêu thành:

> **“Tersun 1.0.2 emits bytecode using only QVM 1.0.1 ISA, with an optional native host extension in the 1.0.1-compatible runtime.”**

Câu này chính xác về kỹ thuật hơn và tránh tuyên bố “100%” quá sớm.

Để tôi kiểm chứng **thực sự** mức 100% thay vì chỉ review kiến trúc, cần xem code QVM 1.0.1 ở phần `switch(opcode)`, định nghĩa opcode và ABI/register/trap hiện tại. Bạn có thể tải repository hoặc các file liên quan lên đây:

Các file quan trọng nhất là `vm/qvm runtime`, `opcode.hpp/enums`, vòng `switch(opcode)`, `emitter.cpp` và phần native/host bridge.
