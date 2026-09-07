Đúng hướng hơn là **đừng lao thẳng vào một JIT “thông minh”** khi frontend, tree/IR và memory runtime còn chưa sạch. Với Tersun hiện tại, mình sẽ biến Gate 5 thành một **“Optimization + Runtime Foundation Gate”**, rồi mới đẩy JIT lên trên nó.

Một điểm rất quan trọng: **tối ưu AST/tree không đủ để giải quyết toàn bộ khoảng cách hiệu năng**. Nó giúp giảm số phép tính, nhưng nếu VM vẫn tốn nhiều allocation, dispatch, boxing/unboxing và không có GC thì runtime vẫn có thể thua rất xa. Vì vậy Gate 5 nên đi theo chuỗi:

```text
Source
  ↓
AST
  ↓
5.1 Tree Canonicalization
  ↓
5.2 Tree Optimizer
  ↓
5.3 Minimal IR / CFG
  ↓
5.4 IR Optimizer
  ↓
oBC / Tier-1
  ↓
5.5 Runtime Memory Manager
  ↓
5.6 Baseline JIT
  ↓
5.7 OSR + Deopt
  ↓
5.8 JIT Code Cache Reclamation
```

# GATE 5 — TIER-2 BASELINE JIT & RUNTIME OPTIMIZATION FOUNDATION

## 5.0 — Baseline Freeze & Instrumentation

Mục tiêu đầu tiên là **đóng băng một baseline có thể đo được** trước khi tối ưu.

### Việc làm

Gắn counter cho:

```text
opcode execution
basic-block execution
backedge
function entry
allocation
GC allocation pressure
```

Đồng thời đo:

```text
Interpreter dispatch time
opcode execution time
allocation time
boxing/unboxing time
function call overhead
loop overhead
memory usage
```

Tạo profiler output kiểu:

```text
Function: matmul
────────────────────────────
OP_LOAD_LOCAL          18.4%
OP_ADD                 11.2%
OP_MUL                 23.8%
OP_STORE_LOCAL         14.1%
dispatch               21.7%
allocation              4.6%
other                   6.2%
```

Cái này cực quan trọng vì sau này bạn biết **Tersun chậm ở đâu**, thay vì cứ thấy chậm là đổ hết cho JIT.

### Acceptance

Baseline phải reproducible:

```text
same source
same bytecode
same input
≈ same runtime profile
```

và có benchmark suite cố định:

```text
H1 Prime Sieve
H2 Matrix 100x100
H3 Fibonacci
H4 Mandelbrot
H5 numeric loop
H6 function-call heavy
H7 allocation heavy
H8 string/object heavy
```

---

# 5.1 — Tree Canonicalization Engine

Đây là tầng mình muốn làm **trước optimizer**.

Hiện tượng thường gặp là cùng một phép tính nhưng tree có rất nhiều hình dạng khác nhau:

```text
(a + 0)
((a + 2) + 3)
((b * 2) + (b * 3))
```

Canonicalization biến chúng về dạng dễ tối ưu.

Ví dụ:

```text
a + 0      → a
0 + a      → a

a * 1      → a
1 * a      → a

(a + 2) + 3 → a + 5
```

### 5.1.1 Node metadata

Mỗi tree node nên có tối thiểu:

```text
opcode
type
children
constant_value
source_span
has_side_effect
may_trap
overflow_mode
value_category
```

`has_side_effect` và `may_trap` **rất quan trọng**.

Không được biến:

```text
foo() + 0
```

thành:

```text
foo()
```

theo kiểu ngây thơ nếu optimizer có thể làm thay đổi evaluation semantics.

Tương tự phải cẩn thận với:

```text
int48 overflow
division by zero
BigInt promotion
array bounds
null checks
```

### 5.1.2 Canonical ordering

Các phép toán giao hoán:

```text
a + b
b + a
```

có thể canonicalize thành cùng một dạng nội bộ.

Ví dụ:

```text
ADD(min(hash(a), hash(b)),
    max(hash(a), hash(b)))
```

Không nhất thiết phải dùng hash đúng như ví dụ này; ý chính là **một expression tương đương chỉ có một representation chuẩn**.

Điều này về sau giúp CSE rất nhiều.

### Acceptance

Trên bộ test hiện có:

```text
AST semantics: 100%
source location: 100%
no illegal rewrite
```

và tree normalized phải ổn định:

```text
normalize(normalize(T)) == normalize(T)
```

---

# 5.2 — Tree Optimizer

Đây mới là **module tối ưu tree chính**.

Mình chia nó thành 8 pass nhỏ, không viết một optimizer khổng lồ.

## 5.2.1 Constant Folding

```text
2 + 3       → 5
8 * 4       → 32
10 < 20     → true
```

Typed folding:

```text
int48
int64
float64
bool
string metadata
```

Phải obey đúng semantics overflow/promotion của Tersun.

---

## 5.2.2 Constant Propagation

```text
let x = 10
let y = x + 5
```

→

```text
let x = 10
let y = 15
```

hoặc nếu `x` chết:

```text
let y = 15
```

---

## 5.2.3 Algebraic Simplification

Ví dụ:

```text
x + 0 → x
x - 0 → x
x * 1 → x
x / 1 → x
x * 0 → 0
```

Nhưng phải phụ thuộc semantics.

Ví dụ `x * 0 → 0` **không phải lúc nào cũng an toàn** nếu evaluation của `x` có side effect hoặc có thể trap.

Do đó optimizer không chỉ hỏi:

```text
expression == x * 0
```

mà hỏi:

```text
expression == x * 0
AND x.has_side_effect == false
AND x.may_trap == false
```

---

# 5.2.4 Dead Expression Elimination

Ví dụ:

```text
let x = a * b
return 10
```

nếu `x` không được sử dụng và expression không có side effect:

```text
return 10
```

Đây là chỗ tree optimizer bắt đầu giảm instruction count khá rõ.

---

# 5.2.5 Branch Simplification

```text
if (true) {
    A
} else {
    B
}
```

→

```text
A
```

Hoặc:

```text
if (1 < 2) ...
```

→ direct branch.

---

# 5.2.6 Conditional Folding

```text
x ? true : false
```

→

```text
bool(x)
```

hoặc các trường hợp tương đương tùy semantics ngôn ngữ.

---

# 5.2.7 Strength Reduction

Ví dụ:

```text
x * 2
```

→

```text
x + x
```

hoặc machine-level:

```text
shift
```

Nhưng mình khuyên **không ép hết strength reduction ở Tree layer**.

Tree chỉ ghi nhận canonical form.

Decision thực sự:

```text
mul
→ add
→ shift
```

nên để IR/backend quyết định vì target x86_64 và ARM64 không giống nhau hoàn toàn.

---

# 5.2.8 Local Common Subexpression Elimination

Ví dụ:

```text
a = x * y
b = x * y
```

Tree optimizer có thể phát hiện:

```text
x * y
```

xuất hiện hai lần.

Sau đó tạo:

```text
tmp = x * y
a = tmp
b = tmp
```

Đây là cầu nối quan trọng từ Tree → IR.

---

# 5.2.9 Fixed Point Optimization

Không chạy:

```text
pass1
pass2
pass3
```

một lần duy nhất.

Nên có:

```text
repeat
    changed = false

    constant_fold()
    simplify()
    propagate()
    dce()
    branch_fold()

until changed == false
```

Nhưng phải có giới hạn iteration để tránh optimizer loop.

Ví dụ:

```text
MAX_OPT_ROUNDS = 8
```

---

# 5.3 — Minimal Optimization IR

Đây là module mình **rất khuyên thêm**, vì nếu bỏ qua nó thì sau này Gate 6 sẽ rất đau.

Đừng cố optimizer cả thế giới trên AST.

Pipeline:

```text
AST
 ↓
Tree
 ↓
Optimized Tree
 ↓
Minimal IR
 ↓
CFG
```

### IR node

Ví dụ:

```text
CONST
LOAD_LOCAL
STORE_LOCAL
ADD
SUB
MUL
DIV
CMP
BRANCH
CALL
RETURN
ALLOC
LOAD_FIELD
STORE_FIELD
```

Mỗi instruction có:

```text
result
operands
type
flags
source location
```

### CFG

Tách:

```text
BasicBlock 0
BasicBlock 1
BasicBlock 2
...
```

Ví dụ loop:

```text
        ┌─────────────┐
        │   header    │
        └──────┬──────┘
               ↓
             body
               │
               ↓
           condition
            ↙     ↘
          back    exit
```

Chỉ riêng việc có CFG sạch đã giúp Loop JIT sau này dễ hơn rất nhiều.

---

# 5.4 — Lightweight IR Optimizer

Gate 5 **không cần SSA optimizer quái vật**.

Chỉ cần:

### 5.4.1 Copy propagation

```text
a = b
c = a
```

→

```text
c = b
```

### 5.4.2 Local CSE

```text
t1 = x + y
t2 = x + y
```

→ reuse `t1`.

### 5.4.3 Dead code elimination

Basic-block level.

### 5.4.4 Block merging

```text
B1 → B2
```

nếu B1 chỉ có successor duy nhất và B2 chỉ có predecessor duy nhất:

```text
B1+B2
```

### 5.4.5 Branch folding

### 5.4.6 Simple loop canonicalization

Ví dụ biến loop:

```text
i = i + 1
```

được đánh dấu:

```text
induction variable
```

Chưa cần LICM/GVN/escape analysis cực nặng.

---

# 5.5 — Compiler Memory Reclamation

Cái này **khác runtime GC**.

Trong compiler, đừng để mỗi AST node:

```text
malloc()
```

rồi:

```text
free()
```

Đó là nightmare.

Dùng:

```text
ArenaAllocator
```

Ví dụ:

```text
AST Arena
Tree Arena
IR Arena
Temp Arena
```

Khi compile xong một function:

```text
arena.reset()
```

Toàn bộ temporary tree được thu hồi gần như O(1).

Điều này giúp compiler:

```text
ít malloc hơn
ít fragmentation
dễ debug
compile nhanh hơn
```

Đây nên làm **ngay trong Gate 5.1/5.2**.

---

# 5.6 — Runtime Heap & Garbage Collector

Đây mới là **GC thật sự của Tersun**.

Mình khuyên:

> **Gate 5: Non-moving precise Mark-Sweep GC**

đừng nhảy ngay vào generational compacting GC.

Lý do rất thực tế: Tersun sắp có JIT + OSR + deopt. Moving GC sẽ làm pointer management phức tạp hơn rất mạnh.

Pipeline:

```text
allocate
   ↓
heap
   ↓
GC trigger
   ↓
root scan
   ↓
mark
   ↓
sweep
   ↓
free blocks
```

### 5.6.1 Object Header

Ví dụ:

```text
ObjectHeader {
    type
    size
    gc_flags
    maybe_forwarding_info
}
```

### 5.6.2 Root Set

Phải xác định:

```text
VM stack
locals_
globals
native handles
call frames
JIT frames
temporary roots
```

### 5.6.3 Safepoint

GC chỉ được chạy tại các safe point:

```text
function call
allocation
backedge
explicit safepoint
```

Sau này JIT cũng sinh safepoint metadata.

---

# 5.6.4 Write Barrier

**Chưa cần full generational barrier ngay.**

Chỉ thiết kế abstraction:

```text
gc_write_barrier(parent, child)
```

hiện tại có thể là no-op hoặc barrier đơn giản.

Gate 6 khi làm generational GC thì mở rộng từ đây.

---

# 5.6.5 Allocation Fast Path

Đây mới là thứ rất đáng làm.

Đừng:

```text
allocate()
→ lock
→ full allocator
```

mỗi object.

Có:

```text
Thread/VM allocation pointer
        ↓
bump pointer
        ↓
object
```

Fast path:

```text
if (free_space >= size)
    allocate_inline()
else
    slow_allocate()
```

Đây là một trong những thứ có thể đem lại lợi ích rất lớn ở workload allocation-heavy.

---

# 5.6.6 GC Acceptance

Bắt buộc:

```text
0 reachable object collected
0 double-free
0 use-after-free
0 corrupted object header
0 invalid root
```

và stress:

```text
10^6 allocations
10^7 allocations
nested objects
cyclic objects
temporary objects
large objects
```

Quan trọng hơn benchmark:

> **memory usage phải ổn định khi chương trình chạy dài**, thay vì RAM tăng mãi.

---

# 5.7 — Baseline JIT

Tới đây mới bắt đầu JIT.

Và **Gate 5 chỉ làm Baseline JIT**, không làm optimizing JIT.

Pipeline:

```text
Hot loop
   ↓
IR
   ↓
Lowering
   ↓
Register mapping
   ↓
Machine code
   ↓
Executable memory
```

Ban đầu nên hỗ trợ một subset nhỏ:

```text
LOAD_LOCAL
STORE_LOCAL
CONST
ADD
SUB
MUL
CMP
JUMP
BRANCH
RETURN
```

Sau đó mở rộng:

```text
CALL
ARRAY
FIELD
FLOAT
SIMD
```

Không nên cố compile toàn bộ oBC ngay ngày đầu.

---

# 5.8 — OSR + Deoptimization

Đây là phần khó nhưng architecture đã được chuẩn bị từ 5.3–5.7.

OSR:

```text
Tier-1
   │
   │ hot backedge
   ▼
OSR entry
   │
   ▼
Tier-2 machine code
```

Cần có mapping:

```text
VM local #0 → RAX
VM local #1 → RCX
VM local #2 → stack slot
...
```

Deopt metadata:

```text
machine PC
   ↓
logical bytecode PC
   ↓
virtual locals
   ↓
virtual stack
```

Khi guard fail:

```text
JIT
 ↓
deopt metadata
 ↓
reconstruct VM frame
 ↓
Tier-1
```

---

# 5.9 — JIT Code Cache + Tự Dọn Code

Đây là phần "tự dọn rác" thứ hai, nhưng **khác GC object heap**.

Code:

```text
JIT version #1
JIT version #2
JIT version #3
```

có thể trở thành obsolete.

Ví dụ:

```text
Old assumption
     ↓
guard fails
     ↓
deopt
     ↓
new JIT version
```

Code cũ phải được:

```text
mark obsolete
↓
stop publishing
↓
wait until no thread executes it
↓
reclaim
```

Không được `free()` ngay khi deopt.

Đặc biệt nếu có multithreading, cần cơ chế kiểu:

```text
epoch / generation
```

hoặc tương đương để biết **CPU nào còn đang chạy code cũ**.

---

# 5.10 — Gate 5 Integration Layer

Cuối cùng nối hết:

```text
                 ┌──────────────┐
                 │     AST      │
                 └──────┬───────┘
                        ↓
               ┌─────────────────┐
               │ 5.1 Canonicalize│
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.2 Tree Opt    │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.3 IR / CFG     │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.4 IR Opt       │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │      oBC         │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.5 Heap/GC      │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.7 Baseline JIT │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.8 OSR/Deopt    │
               └───────┬─────────┘
                       ↓
               ┌─────────────────┐
               │ 5.9 Code Reclaim │
               └─────────────────┘
```

# Thứ tự triển khai mình khuyên

Đừng làm theo số thứ tự đơn thuần. Làm theo dependency:

```text
5.0 Baseline
 ↓
5.1 Tree Canonicalization
 ↓
5.2 Tree Optimizer
 ↓
5.3 IR/CFG
 ↓
5.4 Lightweight IR Optimizer
 ↓
5.5 Compiler Arena Reclamation
 ↓
5.6 Runtime Heap + GC
 ↓
5.7 Baseline JIT
 ↓
5.8 OSR + Deopt
 ↓
5.9 JIT Code Cache Reclamation
 ↓
5.10 Full Integration
```

---

# Các thứ CỐ TÌNH không đưa vào Gate 5

Đây là phần mình nghĩ sẽ giúp Tersun **không bị scope creep**.

Không đưa vào Gate 5:

```text
Full SSA optimizer
GVN
LICM nâng cao
Escape Analysis
Aggressive Inlining
Interprocedural optimization
Speculative devirtualization
Polymorphic Inline Cache
Advanced vectorization
Generational GC
Concurrent GC
Compacting GC
Profile-guided optimizing JIT
```

Toàn bộ đống này để **Gate 6**.

---

# Gate 6 sẽ trông như thế nào?

Lúc đó pipeline mới thành:

```text
AST
 ↓
Tree Optimization
 ↓
SSA
 ↓
CFG
 ↓
GVN
 ↓
DCE
 ↓
SCCP
 ↓
LICM
 ↓
Range Analysis
 ↓
Escape Analysis
 ↓
Inlining
 ↓
Vectorization
 ↓
Register Allocation
 ↓
Optimizing JIT
```

Và lúc đó JIT không còn chỉ là:

> "dịch oBC → machine code"

mà thành:

> **"quan sát runtime → suy luận chương trình → tự tối ưu dựa trên hành vi thực tế."**

---

# Acceptance Criteria mới cho Gate 5

Mình sẽ sửa tiêu chuẩn Gate 5 thành 5 nhóm thay vì chỉ nhìn benchmark JIT.

### Compiler

```text
100% semantic equivalence
2.13M test cases pass
no illegal tree rewrite
no optimizer-induced crash
```

### Tree/IR

```text
constant folding hoạt động
dead subtree elimination
branch folding
local CSE
copy propagation
CFG canonicalization
```

### Memory

```text
no persistent allocation leak
GC reclaim đúng reachable/unreachable objects
long-running workload memory remains bounded
```

### JIT

```text
baseline JIT compile < 1.5 ms cho hot loop mục tiêu
OSR correctness 100%
deopt correctness 100%
```

### Performance

Đừng chỉ đặt:

```text
Python × ?
```

mà đo:

```text
Gate 4 → Gate 5
```

với:

```text
H1 Prime Sieve
H2 Matrix
H3 numeric loop
H4 allocation-heavy
H5 function-heavy
```

Đây mới là phép đo sạch nhất để biết Gate 5 thực sự tạo ra bao nhiêu giá trị.

---

## Và có một điểm rất quan trọng đối với Tersun

**Nếu hiện tại Tersun đang thua Python rất xa thì mình chưa coi JIT là thủ phạm duy nhất.**

Có khả năng bottleneck thực sự nằm ở chuỗi:

```text
AST complexity
→ bytecode quality
→ virtual stack/local movement
→ dispatch
→ object allocation
→ boxing
→ memory management
→ cache locality
```

Cho nên kế hoạch trên có chủ đích đưa **Tree + IR + allocator + GC trước/đồng thời với Baseline JIT**.

Khi Gate 5 hoàn thành, Tersun sẽ có nền tảng kiểu:

```text
                Tersun Gate 5

        Compiler Side
             │
      Tree Optimization
             │
          IR / CFG
             │
       Lightweight Opt
             │
             ▼
          Tier-1 VM
             │
       Hotness Profile
             │
             ▼
       Baseline Tier-2 JIT
          ↙        ↘
        OSR       Deopt
          ↘        ↙
        Runtime State
             │
       ┌─────┴─────┐
       │           │
      GC       Code Reclaim
```

**Đến đây mới có lý do để bước sang Gate 6.**

Gate 5 = **“Tersun chạy native được và runtime không còn mang quá nhiều ballast.”**

Gate 6 = **“Tersun bắt đầu tự suy luận và tối ưu chương trình.”**

Nếu xây đúng ranh giới này, Gate 6 sẽ nhẹ hơn rất nhiều vì **Tree/IR/GC/OSR/deopt interfaces đã được khóa từ Gate 5**, thay vì đến lúc làm optimizing JIT mới phải đập lại compiler core.
