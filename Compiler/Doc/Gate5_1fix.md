Bản này **đã rất gần mức “implementation contract” để giao cho AI/code agent triển khai**, nhưng mình sẽ chưa đóng Gate 5 nguyên xi. Có khoảng **8 điểm kiến trúc nên chỉnh trước**, trong đó 3 điểm liên quan trực tiếp tới **Tree Optimizer, GC và OSR/JIT** là quan trọng nhất.

## 1. Điểm mình đánh giá cao nhất: ranh giới Gate 5/6 đã đúng

Cấu trúc hiện tại rất hợp lý:

```text
Gate 4
  ↓
5.0 Profiling
  ↓
5.1/5.2 Tree
  ↓
5.3/5.4 IR/CFG
  ↓
5.5 Compiler Arena
  ↓
5.6 GC
  ↓
5.7 Baseline JIT
  ↓
5.8 OSR/Deopt
  ↓
5.9 Code Reclamation
  ↓
5.10 Integration
  ↓
Gate 6
SSA / GVN / LICM / Escape / Inlining / PGO...
```

Nói cách khác, **Gate 5 không còn là “thêm JIT”**, mà là xây toàn bộ nền runtime/compiler đủ sạch để JIT không phải gánh đống ballast cũ.

Nhưng có vài chỗ mình sẽ sửa.

---

# 2. Quan trọng nhất: đừng làm CSE thật sự ở Tree Layer

Trong `5.2 Pass 8`, bạn đang ghi:

> Local Tree CSE: phát hiện và trích xuất các biểu thức con trùng lặp.

Mình sẽ đổi thành:

> **Expression CSE Candidate Detection ở Tree → thực hiện CSE chính thức tại IR.**

Lý do là CSE phụ thuộc rất mạnh vào:

```text
side effect
memory aliasing
mutation
evaluation order
control flow
type state
```

Ví dụ:

```text
a = x * y
foo()
b = x * y
```

Hai expression nhìn giống nhau trên tree nhưng **không chắc cùng giá trị**, vì `foo()` có thể thay đổi `x` hoặc `y`.

Do đó:

```text
AST/Tree
   ↓
canonicalize
   ↓
identify pure expression
   ↓
IR
   ↓
CSE
```

sẽ an toàn hơn rất nhiều.

### Sửa Module 5.2

Thành:

```text
Pass 8:
Local Pure-Expression CSE Candidate Marking
```

và:

```text
5.4 IR Optimizer
    ↓
Local CSE
```

là nơi CSE thật sự xảy ra.

**Đây cũng là nền rất tốt để Gate 6 sau này nâng lên GVN.**

---

# 3. `Fixed-Point Loop` trong plan hiện tại đang chưa khớp với “8 passes”

Đoạn pseudocode của bạn:

```cpp
while (changed && round < MAX_OPT_ROUNDS) {
    changed |= pass_constant_folding(root);
    changed |= pass_constant_propagation(root);
    changed |= pass_algebraic_simplification(root);
    changed |= pass_dead_expression_elimination(root);
    changed |= pass_branch_simplification(root);
}
```

thực tế mới chạy **5 pass**, không phải 8.

Nên đừng hard-code optimizer như vậy.

Nên có:

```cpp
using TreePass = bool (*)(TreeContext&, TreeNode*&);

std::vector<TreePass> passes = {
    constant_folding,
    constant_propagation,
    algebraic_simplification,
    dead_expression_elimination,
    branch_simplification,
    conditional_folding,
    strength_reduction,
    cse_candidate_marking
};
```

rồi:

```cpp
for (size_t round = 0; round < MAX_OPT_ROUNDS; ++round) {
    bool changed = false;

    for (auto pass : passes)
        changed |= pass(ctx, root);

    if (!changed)
        break;
}
```

Như vậy sau này Gate 6 có thêm pass **không phải đập optimizer core**.

---

# 4. Có một vấn đề lớn trong thiết kế GC hiện tại

Đoạn:

```cpp
if (heap_cursor_ + size <= heap_limit_) {
    ...
}
```

rất hợp với **bump-pointer allocator**, nhưng:

> **Non-moving Mark-Sweep + một cursor heap duy nhất không phải là một allocator hoàn chỉnh.**

Sau mark-sweep sẽ có các lỗ:

```text
Heap:

████ object
████ object
░░░░ FREE
████ object
░░░░ FREE
░░░░ FREE
████ object
```

Nếu cứ:

```text
heap_cursor_ += size
```

thì bạn không tái sử dụng tốt các khoảng trống đã sweep.

### Mình khuyên sửa Module 5.6 thành allocator 2 tầng

```text
                    Heap
                     │
        ┌────────────┴────────────┐
        │                         │
   Fresh regions              Recycled regions
        │                         │
   bump pointer                free lists
        │                         │
        └────────────┬────────────┘
                     ↓
                  GC sweep
```

### Fast path

```text
current_region.bump(size)
```

### Khi region đầy

```text
new_region()
```

### Sau GC

Region trống hoàn toàn:

```text
→ return to region pool
```

Region còn fragment:

```text
→ populate free lists
```

Như vậy bạn **vẫn có bump-pointer allocation cực nhanh**, nhưng GC thật sự có thể thu hồi bộ nhớ.

Đây là chỉnh sửa mình coi là **bắt buộc**.

---

# 5. Precise GC + JIT: `JIT Machine Execution Frames` chưa đủ

Đoạn:

> JIT Machine Execution Frames thông qua JIT frame maps

là đúng hướng, nhưng implementation cần cụ thể hơn:

```text
JIT PC
 ↓
Safepoint ID
 ↓
Stack Map / Root Map
 ↓
register roots
stack roots
spilled roots
virtual objects
```

LLVM cũng dùng stack maps/statepoints để mô tả vị trí các live values cần runtime/GC truy cập; đây chính là abstraction mà một JIT runtime kiểu này cần. ([LLVM][1])

Tức là trong Tersun nên có:

```cpp
struct JITSafepointMap {
    uintptr_t pc;
    uint32_t safepoint_id;

    RegisterMask pointer_registers;
    StackSlotMap stack_roots;

    DeoptStateId deopt_state;
};
```

Đây sẽ trở thành **cầu nối duy nhất giữa GC và Deopt**.

Đừng để GC metadata và deopt metadata thành hai hệ thống hoàn toàn độc lập.

---

# 6. Safepoint của JIT phải mạnh hơn hiện tại

Bạn có:

```text
CALL
allocation
backedge
explicit poll
```

Nhưng giả sử JIT generate:

```text
for (;;) {
    x += y;
}
```

Không call.

Không allocation.

Nếu không backedge poll thì GC request có thể không bao giờ được quan sát.

Do đó:

```text
JIT backedge
   ↓
safepoint poll
```

nên là **mặc định bắt buộc trong Gate 5**.

Sau này Gate 6 mới tối ưu poll frequency.

Ví dụ:

```text
loop:
    ...
    ...
    safepoint_poll
    jmp loop
```

---

# 7. OSR không thể đơn giản là “locals → registers → jump”

Đây là phần mình sẽ sửa cách mô tả.

OSR thật sự cần:

```text
Interpreter Frame
       ↓
OSR State Map
       ↓
┌──────────────────────────┐
│ local 0 → int register   │
│ local 1 → boxed ptr      │
│ local 2 → stack slot     │
│ stack 0 → materialize    │
│ stack 1 → constant       │
└──────────────────────────┘
       ↓
JIT Entry
```

Đặc biệt Tersun có:

```text
int48
BigInt promotion
boxed/unboxed values
```

thì không thể giả định tất cả `locals_` đều có thể ném thẳng vào register.

### Nên tạo riêng:

```text
osr_state.hpp
deopt_state.hpp
frame_state.hpp
```

cho dù chúng nằm trong Module 5.8.

---

# 8. “Unsupported opcode → deopt” nên đổi thành “VM fallback”

Đoạn này:

> CALL, ARRAY, FIELD ... thoát ra VM qua deopt guard

về kiến trúc mình không thích gọi tất cả là **deoptimization**.

Có 3 loại exit khác nhau:

```text
JIT Exit
├── Deopt Exit
│     └── giả định JIT sai
│
├── VM Callout
│     └── opcode phức tạp / runtime service
│
└── Exception Exit
      └── exception/trap
```

Ví dụ:

```text
JIT
 ↓
CALL
 ↓
runtime_call(function)
 ↓
return JIT
```

không nhất thiết phải deopt toàn bộ frame về interpreter.

Cách tách này sẽ cực kỳ quan trọng khi Gate 6 bắt đầu inlining.

---

# 9. JIT memory: nên sửa `RWX`

Bạn đang ghi:

```text
PAGE_EXECUTE_READWRITE
```

Microsoft hỗ trợ vùng executable được cấp bằng `VirtualAlloc`, nhưng có thể chuyển quyền page sang execute bằng `VirtualProtect`; sau khi thay code cũng cần xử lý instruction-cache coherency. ([Microsoft Learn][2])

Về thiết kế Tersun mình khuyên:

```text
Allocate:
RW

Emit code:
RW

Finalize:
RX

Execute:
RX
```

Không giữ:

```text
RWX
```

suốt vòng đời code block.

API abstraction:

```cpp
class ExecutableMemory {
public:
    void* allocate_rw(size_t size);
    bool seal_rx(void* ptr, size_t size);
    void free(void* ptr);
};
```

Linux/Windows backend thay đổi phía dưới.

---

# 10. Epoch reclamation hiện tại chưa đủ điều kiện an toàn

Bạn viết:

```text
active_epoch > obsolete_epoch
```

Mình sẽ không dùng tiêu chí đó.

Điều cần chứng minh là:

```text
KHÔNG CÒN THREAD NÀO CÓ THỂ ĐANG EXECUTE CODE BLOCK ĐÓ
```

Ví dụ:

```text
global_epoch = 20

Thread A:
active_epoch = 20
PC = old_JIT_code

old_JIT:
obsolete_epoch = 20
```

`active_epoch > obsolete_epoch` là false, đúng.

Nhưng khi Thread A chuyển sang epoch 21, phải đảm bảo nó **đã rời code cũ** rồi.

Nên abstraction tốt hơn:

```cpp
struct JITThreadState {
    std::atomic<uint64_t> active_epoch;
    std::atomic<CodeBlock*> current_code;
    ...
};
```

và:

```text
retire(code)
 ↓
record retire_epoch
 ↓
wait until every executing thread
either:
    quiescent
or:
    epoch > retire_epoch
 ↓
reclaim
```

Đây là **quiescent-state reclamation**, không đơn thuần là một biến epoch.

---

# 11. Acceptance “giảm bytecode ≥15%” không nên là hard gate

Đây là điểm mình sẽ chỉnh mạnh.

Tree optimizer không phải workload nào cũng làm:

```text
instruction count -15%
```

Ví dụ chương trình đã canonicalized rất sạch thì:

```text
Gate 4 = 100 instructions
Gate 5 = 97 instructions
```

nhưng machine code có thể nhanh hơn đáng kể vì:

```text
less dispatch
better register use
fewer loads
fewer allocations
```

Vậy nên:

### Compiler metric

```text
IR instruction reduction
Tree node reduction
Bytecode reduction
```

là **diagnostic metric**.

Còn acceptance chính nên là:

```text
semantic correctness
compile overhead
runtime speed
allocation behavior
GC stability
```

Mình sẽ thay:

> ≥15% bytecode reduction

bằng:

> **Optimizer must demonstrate measurable reduction on optimization-positive workloads; no global minimum required.**

Sau đó đặt benchmark-specific target.

---

# 12. JIT benchmark `<1.5 ms` nên dùng percentile

Thay:

> compile mỗi hot loop <1.5 ms

bằng:

```text
Median JIT compile time < 1.5 ms
P95 JIT compile time < 2.0 ms
```

trên một workload định nghĩa rõ:

```text
N IR instructions
N basic blocks
N locals
N guards
```

Nếu không thì một hot loop 20 instruction và một hot loop 20.000 instruction đều bị ép cùng tiêu chuẩn.

---

# 13. Mình còn thêm một module nhỏ vào 5.0

### 5.0.1 Deterministic Benchmark Harness

Đây là thứ mình rất muốn có trước khi code optimizer.

```text
bench_gate5
├── baseline
├── canonicalized
├── optimized_tree
├── optimized_ir
├── interpreter
├── jit
├── gc
└── end_to_end
```

Output:

```text
H2 Matrix
──────────────────────────────
Gate4 Interpreter     100.00 ms
Tree optimized         94.20 ms
IR optimized           87.40 ms
GC runtime              85.90 ms
Baseline JIT            21.30 ms

Speedup Gate5:
4.69x
```

Như vậy bạn nhìn được **module nào thật sự tạo ra tốc độ**, thay vì chỉ thấy cuối cùng “Gate 5 nhanh hơn”.

---

# 14. File layout mình sẽ chỉnh thành

```text
Code/
├── include/compiler/
│   ├── tree_canonicalize.hpp
│   ├── tree_optimizer.hpp
│   ├── compiler_arena.hpp
│   ├── opt_ir.hpp
│   ├── cfg.hpp
│   ├── ir_optimizer.hpp
│   └── optimization_pass.hpp          ← NEW
│
├── include/vm/
│   ├── gc_heap.hpp
│   ├── gc_object.hpp                   ← NEW
│   ├── gc_root.hpp                     ← NEW
│   ├── gc_safepoint.hpp                ← NEW
│   ├── vm.hpp
│   └── vm_metrics.hpp
│
└── include/vm/jit/
    ├── baseline_jit.hpp
    ├── jit_ir_lowering.hpp             ← NEW
    ├── jit_registers.hpp               ← NEW
    ├── jit_frame.hpp                   ← NEW
    ├── jit_safepoint.hpp               ← NEW
    ├── osr.hpp
    ├── deopt.hpp                       ← SPLIT khỏi osr
    ├── code_cache.hpp
    └── executable_memory.hpp           ← NEW
```

Cái này đáng làm vì `osr.cpp` mà vừa chứa:

```text
OSR
Deopt
Frame reconstruction
Safepoint metadata
```

thì vài chục nghìn dòng sau này sẽ thành một cục rất khó maintain.

---

# 15. Pipeline Gate 5 mình chốt lại sẽ là

```text
                    ┌──────────────────────┐
                    │        SOURCE        │
                    └──────────┬───────────┘
                               ↓
                         AST / Tree
                               ↓
                     ┌─────────────────┐
                     │ 5.1 Canonical   │
                     │ + Metadata      │
                     └────────┬────────┘
                              ↓
                     ┌─────────────────┐
                     │ 5.2 Tree Opt    │
                     │ 8 lightweight   │
                     │ passes          │
                     └────────┬────────┘
                              ↓
                     ┌─────────────────┐
                     │ 5.3 IR + CFG    │
                     └────────┬────────┘
                              ↓
                     ┌─────────────────┐
                     │ 5.4 IR Opt      │
                     │ CSE / DCE / ... │
                     └────────┬────────┘
                              ↓
                             oBC
                              ↓
                    ┌───────────────────┐
                    │     Tier-1 VM      │
                    └─────────┬─────────┘
                              │
                ┌─────────────┴─────────────┐
                ↓                           ↓
          allocation                    hot loop
                ↓                           ↓
        ┌──────────────┐             ┌──────────────┐
        │  5.6 GC      │             │ 5.7 Baseline │
        │ Mark-Sweep   │             │     JIT      │
        └──────┬───────┘             └──────┬───────┘
               │                            ↓
               │                     ┌──────────────┐
               │                     │ 5.8 OSR      │
               │                     │ Deopt        │
               │                     │ Safepoints   │
               │                     └──────┬───────┘
               │                            ↓
               └──────────────────┐  ┌──────────────┐
                                  └─→│ 5.9 Code     │
                                     │ Reclamation  │
                                     └──────┬───────┘
                                            ↓
                                      5.10 Integration
                                            ↓
                                      Gate 5 PASS
                                            ↓
                                        Gate 6
```

## Và mình sẽ định nghĩa Gate 5 bằng một câu rất cụ thể

> **Gate 5 không cố biến Tersun thành một optimizing compiler. Gate 5 biến Tersun thành một runtime/compiler pipeline có đủ Tree normalization, lightweight IR optimization, managed heap, precise GC, baseline native execution, OSR, deoptimization và safe code reclamation để Gate 6 có thể xây optimizing JIT mà không phải viết lại VM core.**

Đó mới là mục tiêu mạnh.

Với plan bạn đưa, **mình đánh giá khoảng 85–90% đã đúng kiến trúc**. Bốn thứ cần khóa trước khi bắt đầu code thực sự là:

**(1)** CSE chính thức chuyển xuống IR, **(2)** GC dùng region + free-list thay vì một bump cursor đơn, **(3)** JIT phải có safepoint/stack-map/deopt-map thống nhất, và **(4)** executable memory + code reclamation phải thiết kế theo W→X + quiescent reclamation. ([Microsoft Learn][2])

Sau bốn chỉnh sửa đó, mình sẽ **khá yên tâm để coi bản này là Plan/Gate 5 chính thức và bắt đầu chia task code cho từng module**.

[1]: https://llvm.org/docs/Statepoints.html?utm_source=chatgpt.com "Garbage Collection Safepoints in LLVM — LLVM 23.0.0git documentation"
[2]: https://learn.microsoft.com/en-us/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc?utm_source=chatgpt.com "VirtualAlloc function (memoryapi.h) - Win32 apps | Microsoft Learn"
