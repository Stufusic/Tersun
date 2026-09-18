Mình đã đọc kỹ toàn bộ **Gate 5.9 — Tier-2 Optimizing JIT**. So với 5.7 và 5.8, đây là bước nhảy lớn nhất về mặt compiler architecture. Ý tưởng tổng thể **rất tốt**, nhưng bản hiện tại có vài chỗ đang “nhảy cóc” từ Baseline JIT lên một optimizing JIT gần như hoàn chỉnh. Nếu code nguyên văn, rủi ro lớn nhất là **optimizer tạo ra machine code nhanh nhưng không còn tái dựng được trạng thái VM chính xác khi deopt**.

Mình chấm:

| Hạng mục                       |       Điểm |
| ------------------------------ | ---------: |
| Kiến trúc tổng thể             | **9.4/10** |
| Hướng phát triển               | **9.6/10** |
| MachineIR                      | **9.0/10** |
| Type Feedback                  | **8.7/10** |
| Optimizer                      | **8.6/10** |
| Register allocation            | **8.1/10** |
| Escape Analysis                | **6.8/10** |
| Deopt integration              | **7.4/10** |
| Khả năng triển khai nguyên văn | **6.8/10** |

Nền tảng Gate 5.9 dựa trên việc tái sử dụng `MachineState`, `DeoptRecord`, `SafepointTable`, `JITFrame`, `DeoptContinuation` từ Gate 5.8 là quyết định rất đúng hướng. Nhưng câu “tái sử dụng nguyên vẹn” nên chuyển thành **tái sử dụng contract, còn implementation có thể phải mở rộng**. 

---

# 1. Ba thứ mình đánh giá cao nhất

## 1.1. Chuyển sang MachineIR

Đây là bước **bắt buộc** nếu muốn Tersun có optimizing JIT thực sự.

Hiện kế hoạch:

```text
Bytecode + Type Feedback
        ↓
MachineIR SSA CFG
        ↓
Optimization
        ↓
LSRA
        ↓
x86-64
```

rất đúng. 

Nó giải quyết nhược điểm căn bản của Template JIT:

```text
OP_ADD → asm
OP_CMP → asm
OP_JUMP → asm
```

không có nơi để optimizer “nhìn thấy cả chương trình”.

---

# 2. Nhưng `MachineIR` hiện đang hơi lẫn tầng

Danh sách:

```text
CONST_INT
CONST_FLOAT
CONST_TRYTE
...
INT_ADD
FLOAT_ADD
...
GUARD_TYPE
GUARD_OVERFLOW
GUARD_SHAPE
GUARD_BOUNDS
...
CALL_NATIVE
DEOPT
SAFEPOINT
```

rất giàu tính năng. Nhưng nó đang trộn:

```text
machine operation
+
high-level runtime semantics
+
speculation
+
GC/deopt control
```

Mình khuyên phân nhóm rõ:

```text
MIR
├── Values
├── Arithmetic
├── Memory
├── ControlFlow
├── Calls
├── Guards
├── Safepoints
└── Deopt
```

và quan trọng hơn:

### `GUARD_*` phải là first-class instruction

Ví dụ:

```text
GUARD_TYPE
  input = v12
  expected = TAG_INT
  deopt_id = 42
```

để metadata builder biết:

```text
native_pc
→ guard
→ deopt state
```

---

# 3. SSA là đúng, nhưng phải định nghĩa “VM SSA” trước

Mình không khuyên MachineIR vừa tạo đã nhảy thẳng sang một SSA cực kỳ phức tạp.

Nên pipeline:

```text
Bytecode
   ↓
Stack-to-SSA
   ↓
MIR CFG
   ↓
Sparse SSA / Phi
```

để mỗi stack effect của bytecode có semantics rõ.

Ví dụ:

```text
push a
push b
ADD
```

thành:

```text
v1 = LOAD a
v2 = LOAD b
v3 = INT_ADD v1, v2
```

Sau đó optimizer mới hoạt động.

---

# 4. Type Feedback: ý tưởng tốt, nhưng “<1% overhead” không nên là hard claim

Tài liệu yêu cầu thu thập feedback với overhead `<1%`.

Cái này chỉ nên là **benchmark target**, không phải architectural guarantee.

Type feedback cần:

```text
slot
counter
state
```

ví dụ:

```cpp
enum class FeedbackState {
    Unknown,
    Monomorphic,
    Polymorphic,
    Megamorphic
};
```

và:

```cpp
struct BinaryOpFeedback {
    TypeTag left;
    TypeTag right;
    uint64_t count;
};
```

---

# 5. MIC/PIC là một trong những nâng cấp ngon nhất của Gate 5.9

Phần này cực kỳ đáng làm.

Tài liệu dự kiến:

```asm
cmp [object + SHAPE_OFFSET], EXPECTED_SHAPE
jne deopt
mov rax, [object + FIELD_OFFSET]
```



Nếu object model của Tersun có shape identity ổn định, đây sẽ là bước nhảy lớn.

Nhưng đừng cho MIC/PIC phụ thuộc trực tiếp vào `VMShape*`.

Nên có abstraction:

```cpp
struct ShapeID {
    uint64_t value;
};
```

rồi runtime có:

```text
ShapeID
↓
ShapeDescriptor
```

Lợi ích là JIT không phụ thuộc lifetime của pointer metadata.

---

# 6. MIC → PIC → Megamorphic nên là một state machine

Không nên hard-code:

```text
1 shape = MIC
<=4 = PIC
>4 = mega
```

thành các con số bất biến.

Nên:

```text
UNINITIALIZED
 ↓
MONO
 ↓
POLY
 ↓
MEGA
```

với policy:

```cpp
struct ICPolicy {
    uint8_t max_polymorphic_shapes;
};
```

Con số `4` có thể là default.

---

# 7. RGE: “đúng 1 guard trong pre-header” là hơi mạnh

Tài liệu đặt mục tiêu:

> guard từ O(N) giảm xuống đúng 1 lần ở pre-header.



Không phải lúc nào cũng hợp lệ.

Ví dụ:

```text
loop:
   x = maybe_change_type()
   guard x:int
```

Nếu `x` có thể đổi type trong loop, guard **không thể** kéo ra preheader.

Bạn cần **type-state dataflow**:

```text
TypeFact:
    value
    type
    validity_range
```

Chỉ hoist guard khi:

```text
dominating guard
+
value immutable over region
+
no invalidating operation
```

Nói cách khác:

> **RGE phải là dataflow optimization, không phải search-and-delete.**

---

# 8. LICM hiện đang thiếu Memory Safety model

Tài liệu nói biểu thức bất biến hoặc field load bất biến có thể đẩy ra pre-header.



Nhưng:

```text
obj.field
```

chỉ invariant nếu:

```text
object same
AND
shape same
AND
field not mutated
AND
no aliasing write
```

Ví dụ:

```text
x = obj.a

loop:
   obj.a = ...
   use x
```

không thể LICM.

Do đó LICM phải biết:

```text
MemoryEffects
```

MIR instruction nên mang:

```cpp
enum class MemoryEffect {
    None,
    Read,
    Write,
    ReadWrite
};
```

và alias analysis về sau.

---

# 9. Escape Analysis là phần rủi ro nhất

Đây là chỗ mình **không khuyên triển khai đầy đủ ở Gate 5.9**.

Tài liệu muốn:

```text
Point3D
 ↓
Escape Analysis
 ↓
Scalar Replacement
 ↓
0 heap allocation
```



Ý tưởng rất hay.

Nhưng để làm đúng, phải xử lý:

```text
object passed to function?
stored globally?
returned?
captured by closure?
stored in array?
used by FFI?
```

Nếu object chỉ cần:

```text
return object
```

thì nó escape.

Nếu:

```text
call native(obj)
```

thì cũng có thể escape.

Nếu closure capture:

```text
lambda => obj.x
```

thì lifetime trở nên phức tạp.

### Giải pháp

Gate 5.9 chỉ làm:

> **Scalar Replacement cho allocation patterns cực kỳ hạn chế và chứng minh được local-only.**

Ví dụ:

```text
new Point3D()
store x
store y
load x
load y
```

Không:

```text
closure
array store
return
FFI
global
```

---

# 10. ST-9.6 cần sửa

Hiện yêu cầu:

> 1,000,000 Point3D → 0 byte GC Heap.



Mình sẽ không coi:

```text
0 byte
```

là universal invariant.

Hãy làm 2 phase:

### Phase A

```text
Known-local allocation
→ zero heap allocation
```

### Phase B

Fuzz các escape patterns:

```text
return
global
array
closure
FFI
```

và xác nhận optimizer **không scalar-replace sai**.

False elimination nguy hiểm hơn heap churn rất nhiều.

---

# 11. LSRA: tên “14 GPRs” chưa chính xác theo nghĩa thực dụng

Tài liệu dự định dùng:

```text
RAX RCX RDX RBX RSI RDI R8-R15
```



Nhưng trong một native function bạn còn phải tôn trọng:

```text
ABI
call-clobbered
callee-saved
reserved VM registers
scratch registers
deopt scratch
GC scratch
```

Không thể coi mọi GPR là freely allocatable.

Mình khuyên:

```text
Reserved:
RSP
RBP
1–2 runtime registers

Available:
remaining allocatable registers
```

và backend tạo:

```cpp
RegisterSet allocatable_registers(ABI, mode);
```

Thay vì hard-code “14”.

---

# 12. Baseline JIT và Tier-2 không nên dùng chung register policy

Tier-1:

```text
simple
stable
debuggable
```

Tier-2:

```text
aggressive
register-heavy
speculative
```

Hai tầng nên dùng cùng:

```text
JIT ABI
```

nhưng **không nhất thiết dùng cùng register convention nội bộ**.

---

# 13. Cái quan trọng nhất: Tier-2 phải compile từ loop/function profile snapshot

Không nên:

```text
Tier-2 hot
→ đọc TFV đang thay đổi
→ compile trực tiếp
```

Nên:

```text
Hotness reached
       ↓
Freeze Profile Snapshot
       ↓
Optimize
       ↓
Generate code
       ↓
Publish JITCode
```

Ví dụ:

```cpp
struct ProfileSnapshot {
    FunctionID function;
    uint64_t invocation_count;
    std::vector<FeedbackSlot> slots;
};
```

Nếu feedback tiếp tục thay đổi sau khi compile, mã cũ vẫn hợp lệ nhờ guard/deopt.

---

# 14. Đây là lý do Deopt phải nâng cấp mạnh ở Gate 5.9

Gate 5.8 có thể deopt:

```text
local → register/stack
```

Nhưng Tier-2 có thể làm:

```text
x dead
y constant
z scalarized object
a rematerialized
```

Vậy DeoptRecord của 5.8 chắc chắn phải mở rộng.

Tức:

> **không tái sử dụng implementation nguyên vẹn; tái sử dụng interface/contract.**

Đây là điểm mình muốn sửa rõ nhất so với kế hoạch hiện tại.

---

# 15. Deopt phải hiểu optimized IR, không chỉ machine location

Ví dụ:

```text
source:
p.x = a + b
```

optimizer biến thành:

```text
p_x = a+b
```

không tồn tại object `p`.

Nếu deopt xảy ra, Interpreter lại cần:

```text
p
p.x
```

Vậy Deopt phải biết:

```text
p = materialize(Point(p_x, p_y))
```

Đây gọi là **materialization**.

Nên thêm:

```cpp
enum class MaterializationKind {
    Direct,
    Constant,
    Rematerialize,
    AllocateObject,
    ScalarizedObject
};
```

---

# 16. Đây là kiến trúc Deopt mình khuyên dùng

```text
                  Tier-2 MIR
                      │
                Optimization
                      │
          ┌───────────┴───────────┐
          │                       │
       Machine             Deopt Metadata
          │                       │
      Native Code           Value Recovery
          │                       │
          │                 ┌─────┴─────┐
          │                 │           │
          │              Location   Materialize
          │                 │           │
          └─────────────────┴───────────┘
                          │
                     Interpreter
```

---

# 17. Có một vấn đề lớn trong mục tiêu “Zero Guard”

Tài liệu ghi:

```text
Normal Fast Path (Zero Guard, Direct Registers)
```

Cái này cần sửa.

Tier-2 không thể “zero guard” theo nghĩa tuyệt đối nếu nó dựa vào speculative specialization.

Đúng hơn:

```text
Fast Path
→ minimal guards
→ guard failure
→ deopt
```

Nếu profile monomorphic:

```text
1 shape
```

có thể chỉ còn:

```text
1 shape guard
```

Không phải zero.

---

# 18. “Tiệm cận C++ -O3” cũng không nên làm mục tiêu Gate

Đây là cùng một lỗi với Gate 5.7.

C++ `-O3` có:

```text
inlining
vectorization
advanced alias analysis
constant propagation
target-specific tuning
```

Tier-2 đầu tiên của Tersun không thể cạnh tranh toàn diện.

Mục tiêu tốt hơn:

```text
Tier-2 > Tier-1
```

một cách ổn định.

Sau đó benchmark:

```text
Tier-2 / C++ -O3
```

là metric nghiên cứu.

---

# 19. ST-9.2 `MIC hit >99.5%` không phải correctness invariant

Tương tự.

Một workload polymorphic hợp lệ có thể:

```text
MIC hit = 50%
```

và compiler vẫn đúng.

Do đó:

```text
MIC hit rate
```

là benchmark.

Không phải:

```text
PASS/FAIL correctness.
```

---

# 20. ST-9.4 cũng cần sửa

Bạn không thể yêu cầu:

```text
exactly 1 guard
```

mọi loop.

Nên kiểm tra:

```text
number_of_guards_after <=
number_of_guards_before
```

và workload-specific expectation:

```text
known invariant loop:
expected = 1
```

Đây là cách kiểm thử compiler đúng hơn.

---

# 21. Nên thêm một optimization correctness oracle

Đây là thứ cực kỳ quan trọng.

Pipeline:

```text
Tier 0
  │
  ├── result A
  │
Tier 1
  │
  ├── result B
  │
Tier 2
  │
  └── result C
```

phải:

```text
A == B == C
```

cho cùng input.

Và khi deopt:

```text
Tier2
 ↓
Deopt
 ↓
Tier0
```

vẫn phải:

```text
result == pure Interpreter
```

---

# 22. Mình muốn thêm “optimization kill switch”

Đây là công cụ debug cực kỳ giá trị.

Ví dụ command:

```text
setunc run program.stn --tier=0
setunc run program.stn --tier=1
setunc run program.stn --tier=2
```

và:

```text
--disable-licm
--disable-rge
--disable-ic
--disable-scalar-replacement
```

Khi benchmark sai:

```text
Tier2 wrong
```

có thể binary-search optimizer.

Ví dụ:

```text
Tier2
 ↓ wrong

disable EA → correct
```

=> bug ở Escape Analysis.

Đây là cách các compiler lớn thường được debug, và cực kỳ đáng đầu tư.

---

# 23. Nên có Optimization Trace

Ví dụ:

```text
Function foo
  Profile:
    BinaryOp#3 = INT/INT 99.8%
    Property#7 = Shape 42 100%

  RGE:
    19 guards → 2

  LICM:
    moved 3 instructions

  IC:
    installed MIC Shape 42

  EA:
    128 allocations → 0

  LSRA:
    17 vregs
    11 registers
    6 spills
```

Cái này sẽ làm Tersun **debug được compiler**, chứ không còn là black box.

---

# 24. Pipeline tối ưu mình khuyên

Đừng triển khai đúng 4 optimization cùng lúc.

Nên:

```text
CP6-A
MachineIR
    ↓
CP6-B
Type Feedback
    ↓
CP6-C
Deopt Metadata
    ↓
CP6-D
LSRA
    ↓
CP6-E
RGE
    ↓
CP6-F
LICM
    ↓
CP6-G
MIC
    ↓
CP6-H
Scalar Replacement
    ↓
CP6-I
Tier Manager
    ↓
CP6-J
Stress + Seal
```

---

# 25. Thứ tự tối ưu hóa bên trong Tier-2

Mình đề xuất:

```text
Bytecode
 ↓
Stack-to-SSA
 ↓
Canonicalization
 ↓
Type Specialization
 ↓
RGE
 ↓
LICM
 ↓
IC lowering
 ↓
Escape Analysis
 ↓
Scalar Replacement
 ↓
Lowering
 ↓
MachineIR
 ↓
LSRA
 ↓
Codegen
```

hoặc nếu muốn MachineIR làm trung tâm tuyệt đối:

```text
Bytecode
 ↓
MIR
 ↓
CFG
 ↓
Dominance
 ↓
Type specialization
 ↓
RGE
 ↓
LICM
 ↓
IC
 ↓
EA/SRA
 ↓
Lowering
 ↓
LSRA
 ↓
X64
```

Mình thích phương án thứ hai hơn.

---

# 26. Kiến trúc cuối cùng nên là

```text
                     TERSUN VM
                         │
                    Type Feedback
                         │
                  Hotness Profiler
                         │
              ┌──────────┼──────────┐
              │          │          │
             T0         T1         T2
         Interpreter  Baseline   Optimizing
                          │          │
                          │       Profile
                          │          ↓
                          │       MIR SSA
                          │          │
                          │    ┌─────┼─────┐
                          │    │     │     │
                          │   RGE   LICM   IC
                          │    │     │     │
                          │    └─────┼─────┘
                          │          ↓
                          │      EA / SRA
                          │          ↓
                          │         LSRA
                          │          ↓
                          │       X64 Code
                          │          │
                          └──────────┤
                                     │
                             Safepoint / Deopt
                                     │
                              Deopt Metadata
                                     │
                              VM Logical State
```

---

# 27. Gate 5.9 nên đóng ở tiêu chuẩn nào?

Mình sẽ không dùng:

```text
2,135,241 invariants
+
MIC >99.5%
+
0 allocation
+
1.8–4.5x
```

làm một mớ hard gate.

Thay vào đó:

### P0 — Correctness

```text
Tier0 == Tier1 == Tier2
100%
```

### P0 — Deopt

```text
mọi deopt point dựng lại logical VM state đúng
```

### P0 — GC

```text
0 false collection
0 UAF
0 corrupted object
```

### P1 — Optimizer

```text
RGE không loại guard sai
LICM không di chuyển side effect
IC không đọc sai shape
EA không loại allocation escape
```

### P1 — Runtime

```text
Tier transition deterministic
JIT cache valid
invalid code không được execute
```

### P2 — Performance

```text
Tier2 > Tier1
```

và benchmark thực tế:

```text
speedup
compile cost
memory overhead
code cache size
```

---

# 28. Verdict

Mình đánh giá **Gate 5.9 là hướng phát triển rất đúng và đủ tham vọng để đưa Tersun từ “VM có JIT” thành “experimental high-performance runtime”**.

Đặc biệt các thành phần:

```text
Type Feedback
MachineIR SSA
RGE
LICM
MIC/PIC
LSRA
Deopt
```

ghép với nhau thành một pipeline rất hợp lý. 

Nhưng có **3 điều mình sẽ bắt sửa trước khi cho agent code**:

### ① `Deopt Metadata` phải nâng cấp thành first-class system

Không thể nói “tái sử dụng nguyên vẹn Gate 5.8”. Phải thêm:

```text
ValueLocation
Materialization
Safepoint
Deopt
Exception
OSR
```

vào cùng một metadata architecture.

### ② Escape Analysis phải thu nhỏ scope

Gate 5.9 chỉ nên tối ưu:

```text
provably local allocation
```

Không đụng closure/FFI/global/complex alias ở phiên bản đầu.

### ③ MachineIR phải trở thành trung tâm

Đừng để:

```text
optimizer → x64 assembler
```

Mà:

```text
Bytecode
 ↓
MachineIR
 ↓
Optimization
 ↓
Lowering
 ↓
Register Allocation
 ↓
MachineIR/LIR
 ↓
x64
```

---

## Mức mình đánh giá sau khi sửa

Nếu triển khai **đúng bản hiện tại**:

> **~6.8/10 về khả năng thành công end-to-end.**

Nếu áp dụng ba sửa đổi trên cộng với `JIT State/Deopt Metadata` chuẩn:

> **~9.1/10 về kiến trúc.**

Và điểm rất đáng chú ý là: **Gate 5.9 không nên là nơi Tersun “chạy nhanh nhất có thể”; nó là nơi Tersun xây được một optimizing compiler đúng đắn.** Khi `MIR + Profile + Deopt + Safepoint + LSRA` đã đúng, các optimization như inlining, constant propagation, LICM nâng cao, vectorization, specialization… ở Gate sau mới thực sự dễ mở rộng.

Nói gọn bằng một đường:

```text
5.7  Native execution
 ↓
5.8  OSR + Deopt
 ↓
5.9  Optimizing MIR + Profile + Register Allocation
 ↓
6.x  Inlining / Speculation / Vectorization / Advanced GC
```

**Đây là hướng mình sẽ chọn cho Tersun.**
