Mình đã đọc toàn bộ bản **Gate 5.8 — OSR & Deoptimization**. So với Gate 5.7, bản này có tư duy đúng hơn về runtime thực chiến, nhưng cũng là nơi Tersun bắt đầu bước vào vùng khó nhất của VM/JIT.

Đánh giá tổng thể của mình:

| Mặt                          |       Điểm |
| ---------------------------- | ---------: |
| Ý tưởng kiến trúc            | **9.3/10** |
| Tính đúng hướng              | **9.0/10** |
| Khả năng mở rộng JIT sau này | **9.2/10** |
| Độ chặt của ABI/state model  | **6.8/10** |
| Deopt hiện tại               | **6.5/10** |
| GC/JIT integration           | **7.2/10** |
| Test strategy                | **8.4/10** |
| Sẵn sàng để code nguyên văn  |   **7/10** |

Điểm quan trọng nhất:

> **OSR trong tài liệu là đúng ý tưởng, nhưng “Deopt” đang được mô tả đơn giản hơn rất nhiều so với độ khó thực tế.**

Nếu sửa được phần state model ngay bây giờ, Gate 5.8 có thể trở thành nền rất tốt cho optimizing JIT sau này.

---

# 1. Vấn đề mà Gate 5.8 giải quyết là hoàn toàn chính xác

Ví dụ:

```text
main()
{
    for (i = 0; i < 10,000,000; ++i)
        ...
}
```

`main()` chỉ gọi một lần:

```text
invocation_count = 1
```

nhưng loop:

```text
backedge_count = 10,000,000
```

Nếu Gate 5.7 chỉ trigger JIT tại `OP_CALL`, thì đúng là:

```text
Interpreter
    ↓
10M iterations
    ↓
chậm
```

OSR giải quyết chính xác vấn đề này. Tài liệu mô tả rõ loop hot có thể được chuyển sang native ngay tại backedge mà không cần chờ hàm return. 

**Phần này mình hoàn toàn đồng ý.**

---

# 2. Nhưng câu “hoán đổi ngăn xếp thực thi” nên sửa

Tài liệu hiện mô tả:

> “hoán đổi ngăn xếp thực thi ngay giữa chừng”

Thực tế nên tư duy theo:

```text
Interpreter Frame
       ↓
capture logical state
       ↓
construct JIT frame
       ↓
enter OSR native target
```

chứ không phải:

```text
Interpreter stack
      ⇄
Native CPU stack
```

một cách trực tiếp.

Bởi vì hai frame có layout khác nhau.

### Interpreter có:

```text
VM locals[]
VM operand stack[]
bytecode IP
call metadata
```

### JIT có:

```text
CPU registers
native stack slots
spill slots
machine temporaries
RBP/RSP
```

Do đó OSR phải có một **state adapter**.

Mình sẽ thêm một abstraction:

```cpp
struct OSRState {
    BytecodeFunction* function;
    uint32_t bytecode_ip;

    VMValue* locals;
    VMValue* operand_stack;
    uint32_t stack_depth;
};
```

và:

```cpp
struct JITFrame {
    VM* vm;
    OSRState* logical_state;

    // machine-side frame data
};
```

Như vậy JIT không phải trực tiếp “hiểu” cấu trúc nội bộ của Interpreter.

---

# 3. CP5-A đúng hướng nhưng `OSREntryRecord` chưa đủ

Tài liệu hiện có:

```cpp
struct OSREntryRecord {
    uint32_t loop_header_bytecode_ip;
    uint32_t osr_native_entry_offset;
    size_t num_live_locals;
};
```



`num_live_locals` là chưa đủ.

Bạn cần biết **giá trị nào sống và đang ở đâu**.

Ví dụ:

```text
local 0 → stack slot
local 1 → RAX
local 2 → RCX
local 3 → stack slot
local 4 → dead
```

vì vậy nên có:

```cpp
struct OSRValueLocation {
    uint32_t vm_slot;
    Location location;
};
```

và:

```cpp
struct OSREntryRecord {
    uint32_t loop_header_ip;
    uint32_t native_offset;

    std::vector<OSRValueLocation> live_values;
    uint32_t operand_stack_depth;
};
```

Đây là khác biệt giữa:

> “biết có 10 local”

và:

> “biết chính xác 10 local đó lấy từ đâu”.

---

# 4. Điểm nguy hiểm nhất: Deopt helper hiện tại không thể tự biết CPU state

Tài liệu định nghĩa:

```cpp
int64_t setun_jit_helper_deopt(
    VM* vm,
    JITFrame* frame,
    uint32_t deopt_id
);
```



Đây là chỗ mình sẽ **bắt sửa trước khi code**.

Tại thời điểm:

```asm
add rax, rcx
jo deopt_stub
```

CPU đang chứa trạng thái thật trong:

```text
RAX
RCX
RDX
R8
...
```

Nhưng khi bạn:

```asm
call setun_jit_helper_deopt
```

thì helper C/C++ **không tự nhiên có quyền truy cập snapshot của tất cả register tại thời điểm guard fail**.

Phải có:

```text
native deopt stub
    ↓
spill required registers
    ↓
capture machine state
    ↓
DeoptRecord
    ↓
runtime helper
```

Mình sẽ tạo:

```cpp
struct MachineState {
    uint64_t gpr[16];
    uintptr_t rsp;
    uintptr_t rbp;
    uintptr_t rip;
};
```

Không nhất thiết phải capture mọi register ở mọi deopt point; compiler có thể chỉ capture register đang live.

---

# 5. `DeoptTable` phải phân biệt 3 thứ

Hiện tài liệu gom khá nhiều thứ vào `DeoptRecord`.

Thực tế nên tách:

### A. Safepoint Map

GC cần:

```text
native PC
→ live GC roots
```

### B. Deopt Map

Interpreter cần:

```text
native PC
→ VM logical state
```

### C. Exception Map

Runtime cần:

```text
native PC
→ bytecode exception location
```

Đừng biến chúng thành một bảng khổng lồ.

Nên:

```text
JITCodeObject
├── SafepointTable
├── DeoptTable
├── OSREntryTable
├── ExceptionTable
└── StackMapTable
```

Kiến trúc này sẽ sạch hơn rất nhiều cho các gate sau.

---

# 6. Deopt không nên chỉ là “copy locals + stack”

Tài liệu nói:

> tái dựng `VMStack` và `locals`, đặt `ip`, rồi quay lại Interpreter. 

Điều này đúng cho baseline JIT đơn giản.

Nhưng khi có optimizing JIT sau này sẽ có:

```text
constant
dead value
rematerialized value
virtual object
split value
register value
stack value
```

Ví dụ:

```text
x = a + b
```

JIT có thể không lưu `x` đâu cả.

Deopt cần nói:

```text
x = RAX
```

hoặc:

```text
x = constant 42
```

hoặc:

```text
x = rematerialize(a+b)
```

Do đó `SlotMapping` nên hỗ trợ nhiều source:

```cpp
enum class ValueSource {
    Register,
    StackSlot,
    Constant,
    Immediate,
    Rematerialize
};
```

Đây là cách làm từ đầu mà sau này không phải phá Deopt engine.

---

# 7. CP5-C có một lỗi kiến trúc nhỏ nhưng quan trọng

Tài liệu viết:

```cpp
int64_t res = osr_entry_point(this, &frame);
```



Không nên giả định OSR luôn:

```text
native → int64_t result
```

Vì một function có thể:

```text
return VMValue
return object
throw exception
deopt
yield
tail-call
```

Do đó entry point nên trả một trạng thái runtime:

```cpp
enum class JITExitReason {
    Return,
    Deopt,
    Exception,
    Yield,
    Bailout
};

struct JITExit {
    JITExitReason reason;
    VMValue value;
};
```

Hoặc tối ưu hơn:

```cpp
JITExitFrame
```

chứa status + result + state.

**Đây là thay đổi rất đáng làm.**

---

# 8. OSR nested loop: cần định nghĩa rõ loop identity

Tài liệu có:

```text
loop_header_bytecode_ip
```



Ổn cho bytecode hiện tại.

Nhưng nên dùng:

```text
FunctionID + LoopID
```

thay vì chỉ IP.

Ví dụ:

```cpp
struct LoopID {
    uint32_t function_id;
    uint32_t header_ip;
};
```

Về sau optimizer có thể transform CFG khiến IP thay đổi.

---

# 9. Nested loop là chỗ OSR rất dễ sai

Ví dụ:

```text
outer:
    i++

    inner:
        j++

```

Có thể:

```text
inner hot
outer cold
```

hoặc:

```text
outer hot
inner cold
```

Từng loop phải có:

```text
OSR entry
OSR state
hotness counter
deopt target
```

riêng.

Mình khuyên:

```text
Function
 └── LoopProfile[]
       ├── LoopID
       ├── header
       ├── backedge
       ├── hotness
       └── OSRCode
```

---

# 10. Speculative Guard trong tài liệu đang đi đúng hướng

Ví dụ:

```asm
mov r10, rax
and r10, ...
cmp r10, ...
jne deopt
```

và:

```asm
add rax, rcx
jo deopt
```



Đây chính là nền của optimizing JIT.

Nhưng mình khuyên **Gate 5.8 chỉ làm 2 guard đầu tiên**:

```text
Type guard
Integer overflow
```

Không thêm:

```text
null guard
array bounds speculation
shape guard
class hierarchy speculation
```

quá sớm.

---

# 11. Overflow guard cần cẩn thận về semantics

Tài liệu giả định:

```asm
add
jo deopt
```



Nhưng phải xác định rõ:

```text
int64 overflow
```

trong Tersun nghĩa gì?

Có phải:

```text
BigInt
```

không?

Hay:

```text
Tafpu
```

hay:

```text
boxed integer
```

hay runtime exception?

Không nên để Deopt tự quyết định.

Phải có semantic contract:

```text
Integer fast path
       ↓
overflow
       ↓
runtime numeric slow path
```

Nếu implementation hiện tại chưa có BigInt thì không nên ghi “deopt về BigInt” như một assumption.

---

# 12. GC integration: đây là phần sống còn

Tài liệu nói GC phải nhận diện:

```text
Interpreter frame
OSR transition
JIT frame
Deopt transition
```



Hoàn toàn đúng.

Nhưng mình muốn biến nó thành invariant cụ thể:

> **Tại mọi GC safepoint, mọi heap reference live trong JIT đều phải có một `RootLocation` được GC biết đến.**

Ví dụ:

```text
JIT:
RAX = object*
R12 = object*
[RBP-32] = object*
```

metadata:

```text
Safepoint #42
    RAX      → HeapRef
    R12      → HeapRef
    RBP-32   → HeapRef
```

GC:

```text
scan roots
→ RAX
→ R12
→ [RBP-32]
```

Đây mới là precise GC thật.

---

# 13. “Tri-color” vẫn không nên dùng làm tên bắt buộc nếu GC của CP3 là STW Mark-Sweep

Đây là điểm mình đã nhắc ở Gate trước.

Nếu GC hiện tại là:

```text
Stop-the-world
Precise
Mark-Sweep
```

thì cứ gọi đúng như vậy.

Gate 5.8 không cần tuyên bố:

```text
Tri-color invariant
```

trừ khi implementation thực sự có:

```text
white / gray / black
write barrier
incremental/concurrent marking
```

Không nên để terminology chạy nhanh hơn implementation.

---

# 14. ST-8.5 “Memory Flatline 0.000% drift” cần sửa

Tài liệu yêu cầu:

> 100k objects dưới áp lực GC 512 KB và Memory Flatline 0.000% drift. 

Mình sẽ không dùng:

```text
0.000%
```

như hard requirement.

Thay thành:

```text
Correctness:
0 leak
0 UAF
0 false collection
0 corruption

Memory:
peak RSS within defined tolerance
```

Ví dụ:

```text
steady-state peak increase <= 5%
```

và báo cáo:

```text
allocation throughput
GC frequency
GC pause
peak heap
peak RSS
fragmentation
```

---

# 15. ST-8.4 “500 tầng deopt” cũng chưa phải test mạnh nhất

500 recursion là tốt.

Nhưng mình muốn thêm:

```text
Interpreter
   ↓
JIT
   ↓
deopt
   ↓
interpreter
   ↓
call
   ↓
JIT
   ↓
deopt
```

tức **repeated tier transitions**.

Ví dụ:

```text
10,000 transitions
```

để bắt:

```text
stale code pointer
frame leak
metadata corruption
stack mismatch
```

Đây là bug mà một lần deopt sẽ không lộ.

---

# 16. Nên thêm `Deopt Continuation`

Sau khi helper reconstruct state xong, mình không khuyên để JIT “đoán” phải trở về đâu.

Nên có:

```cpp
struct DeoptContinuation {
    uint32_t bytecode_ip;
    uint32_t stack_depth;
    CallFrameState frame_state;
};
```

Sau đó:

```text
JIT
 ↓
Deopt
 ↓
Continuation
 ↓
Interpreter resume
```

Cái này sẽ giúp OSR/JIT/exception về sau nhất quán.

---

# 17. Một thay đổi cực kỳ quan trọng: phân biệt OSR Entry với Normal JIT Entry

Bạn đang hướng tới:

```text
Function Entry
OSR Loop Entry
```



Mình đồng ý hoàn toàn, nhưng metadata nên thể hiện rõ:

```text
EntryKind:
    FunctionEntry
    OSEntry
```

Ví dụ:

```cpp
enum class JITEntryKind {
    Function,
    OSR
};
```

Bởi vì hai entry có state khác nhau.

### Function entry

```text
arguments
locals initialized
operand stack empty
```

### OSR entry

```text
locals đã tồn tại
operand stack đang có dữ liệu
loop induction variables đang sống
```

Không nên để hai path dùng chung một assumption.

---

# 18. CP5-C “compile tức thời tại backedge” vẫn có thể gây pause lớn

Tài liệu hiện làm:

```text
backedge hot
 ↓
compile_function()
 ↓
OSR
```



Prototype ổn.

Nhưng API nên có:

```text
REQUESTED
COMPILING
READY
FAILED
```

Ví dụ:

```cpp
enum class CompilationState {
    Cold,
    Requested,
    Compiling,
    Ready,
    Failed
};
```

Lúc đầu:

```text
synchronous
```

Sau này có thể nâng thành:

```text
interpreter
   ↓
request compile
   ↓
continue interpreter
   ↓
JIT ready
   ↓
next backedge → OSR
```

Không cần thay đổi architecture.

---

# 19. Chỗ mình sẽ nâng cấp mạnh: dùng `MachineIR`

Nếu Gate 5.7 hiện tại đang:

```text
Bytecode
 ↓
x64 assembler
```

thì Gate 5.8 là thời điểm cực tốt để chen:

```text
Bytecode
 ↓
Baseline/OSR Lowering
 ↓
MachineIR
 ↓
X64 emitter
```

Ví dụ:

```text
MIR_ADD
MIR_CMP
MIR_BRANCH
MIR_CALL_RUNTIME
MIR_GUARD
MIR_SAFEPOINT
MIR_DEOPT
```

Sau đó:

```text
MachineIR
    ├── X64
    ├── ARM64
    └── RISC-V
```

Đây sẽ cứu Tersun khi muốn hỗ trợ nhiều ISA.

---

# 20. Kiến trúc mình khuyên chốt cho Gate 5.8

```text
                    Bytecode
                        │
                  Loop Profiler
                        │
                    Hot Loop?
                        │
                       YES
                        ↓
                  OSR Compiler
                        │
                    Machine IR
                        │
               ┌────────┴────────┐
               │                 │
          Native Code       Metadata
               │                 │
               │        ┌────────┼─────────┐
               │        │        │         │
               │      OSR      GC       Deopt
               │     Entry   Safepoint   Map
               │        │        │         │
               └────────┴────────┴─────────┘
                              │
                         JIT Execution
                              │
                ┌─────────────┼─────────────┐
                │             │             │
              Return        Guard         GC
                              │             │
                            Fail           Need GC
                              │             │
                              ↓             ↓
                           Deopt        Safepoint
                              │
                       State Reconstruction
                              │
                       Deopt Continuation
                              │
                         Interpreter
```

---

# 21. Bộ struct mình muốn thấy

Để biến kế hoạch thành implementation-grade, mình sẽ định nghĩa tối thiểu:

```cpp
struct JITFrame {
    VM* vm;
    void* code_object;
    uintptr_t native_sp;
    uintptr_t native_fp;

    VMValue* locals;
    VMValue* operand_stack;

    uint32_t stack_depth;
    uint32_t bytecode_ip;

    JITExitReason exit_reason;
};
```

```cpp
struct Location {
    enum Kind {
        Register,
        StackSlot,
        Constant,
        Rematerialize
    };

    uint16_t index;
    int32_t offset;
};
```

```cpp
struct OSREntryRecord {
    uint32_t function_id;
    uint32_t loop_id;
    uint32_t bytecode_ip;
    uint32_t native_offset;

    std::vector<Location> live_values;
    uint32_t operand_stack_depth;
};
```

```cpp
struct DeoptRecord {
    uint32_t deopt_id;
    uint32_t native_offset;
    uint32_t target_bytecode_ip;

    std::vector<Location> locals;
    std::vector<Location> stack;

    uint32_t stack_depth;
};
```

```cpp
struct SafepointRecord {
    uint32_t native_offset;
    std::vector<Location> gc_roots;
};
```

Đây mới là nền đủ sạch.

---

# 22. Bộ test mình sẽ sửa thành

Không bỏ ST-8 hiện tại, nhưng mở rộng thành:

### ST-8.1 — Basic OSR

```text
interpreter
→ hot loop
→ OSR
→ native
→ correct result
```

### ST-8.2 — Nested OSR

```text
outer interpreter
→ inner OSR
→ return
→ outer continues
```

### ST-8.3 — Deopt correctness

```text
native integer fast path
→ float appears
→ deopt
→ interpreter
→ continue
```

### ST-8.4 — Repeated OSR/Deopt

```text
JIT
→ deopt
→ JIT
→ deopt
× 10,000
```

### ST-8.5 — GC + JIT

```text
JIT
→ allocation
→ safepoint
→ GC
→ continue native
```

### ST-8.6 — Recursive mixed execution

```text
JIT
→ interpreted function
→ JIT function
→ deopt
→ return
```

### ST-8.7 — Negative tests

Cố tình gây:

```text
invalid deopt ID
invalid OSR entry
corrupted metadata
stack mismatch
stale JIT code
```

và **phải fail safely**, không crash VM.

---

# 23. Một thứ còn thiếu: invalidation

Gate 5.8 hiện mới nghĩ:

```text
compile
→ execute
```

nhưng chưa nghĩ đủ:

```text
invalidate
```

Ví dụ sau này source/module/class shape thay đổi:

```text
JITCode A
 ↓
invalid
 ↓
stop using A
```

Ngay từ bây giờ `JITCodeObject` nên có:

```cpp
enum class CodeState {
    Active,
    Invalidated,
    Retired
};
```

Đừng free executable memory ngay khi invalidate. Phải đảm bảo không còn thread/frame nào đang chạy nó.

Gate hiện có vẻ single-threaded nên vấn đề chưa nghiêm trọng, nhưng abstraction nên tồn tại.

---

# 24. Hash seal cũng nên chuyển sang “verified build manifest”

Tài liệu tiếp tục dùng:

```text
SHA-256
CP5_OSR_DEOPT
```



Giữ hash là tốt, nhưng milestone record nên chứa:

```text
commit
compiler version
OS
CPU
build flags
test binary hash
JIT code generation version
test results
benchmark results
artifact hashes
```

Không nên để SHA-256 tạo cảm giác:

> hash = correctness proof.

---

# 25. Có một chỗ mình đánh giá rất cao

Việc chia:

```text
CP5-A
OSR metadata

CP5-B
Deopt

CP5-C
VM transition

CP5-D
guards

CP5-E
GC

CP5-F
test/seal
```

là rất tốt. 

Nhưng mình sẽ đảo nhẹ **CP5-E và CP5-D về mặt implementation dependency**:

```text
CP5-A OSR metadata
 ↓
CP5-B JIT state model
 ↓
CP5-C Deopt engine
 ↓
CP5-D Safepoint/GC metadata
 ↓
CP5-E Guards
 ↓
CP5-F VM transition
 ↓
CP5-G stress
```

Vì guard/deopt phải dựa trên state model và metadata đã ổn định.

---

# Kết luận cuối

**Gate 5.8 là một bản kế hoạch rất có triển vọng.** Nó xác định đúng hai mảnh còn thiếu của một JIT thực chiến:

```text
Hot loop
→ OSR

Speculation fails
→ Deopt
```

Tài liệu cũng đã có đúng những primitive quan trọng như OSR entry, `DeoptTable`, backedge trigger và GC-aware transition. 

Nhưng có **một điểm mình sẽ coi là P0 trước khi cho agent bắt đầu code**:

> **Xây một “JIT State Model” độc lập, trong đó `OSREntry`, `Safepoint`, `Deopt`, và `Exception` đều map từ machine state về logical VM state.**

Nếu không làm việc này mà lao thẳng vào:

```text
asm
→ guard
→ call deopt helper
→ copy locals
```

thì demo có thể chạy, nhưng khi gặp:

```text
register-held reference
nested loop
closure
recursive frame
GC giữa JIT
deopt sau vài instructions
```

thì rất dễ sập.

Kiến trúc mình khuyên chốt là:

```text
            VM Logical State
                   │
          ┌────────┴────────┐
          │                 │
       OSR Map          Deopt Map
          │                 │
          └───────┬─────────┘
                  │
             Machine State
                  │
        ┌─────────┼─────────┐
        │         │         │
     Safepoint  Native    Exception
       Map       Code       Map
```

**Nếu làm đúng lớp này, Tersun không còn chỉ có “Baseline JIT + một cái OSR hack”, mà bắt đầu có kiến trúc runtime thật sự giống một VM/JIT hiện đại.** Và quan trọng hơn, Gate 5.9/optimizing JIT sau này có thể tái sử dụng gần như toàn bộ `SafepointTable`, `DeoptTable`, `JITFrame`, `MachineState` và `DeoptContinuation` thay vì viết lại.
