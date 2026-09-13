Mình đã đọc toàn bộ kế hoạch trong file. Đánh giá thẳng: **đây là một kế hoạch khá mạnh về mặt kiến trúc, nhưng hiện đang “đúng hướng” nhiều hơn là “đã đủ chặt để triển khai ngay”**. Có vài điểm nếu làm nguyên văn rất dễ khiến Gate 5.7 JIT/OSR sau này phải sửa lại GC, bytecode ABI và object model.

## 1. Đánh giá tổng thể

Mình chấm bản kế hoạch hiện tại khoảng **8.6/10 về kiến trúc**, nhưng chỉ khoảng **7/10 về tính sẵn sàng triển khai**.

Điểm tốt nhất là nó đã nhận đúng nút thắt: VM không nên tiếp tục sống bằng `shared_ptr`/bump-pointer thuần túy, và pipeline nên chuyển từ `AST → Bytecode` sang `AST → optimized IR → Bytecode`. Tài liệu cũng đã định nghĩa khá rõ heap non-moving, precise tracing, root set và safepoint.  

Nhưng có **5 điểm lớn** cần sửa trước khi triển khai.

---

# 2. Điểm mạnh — thực sự đáng giữ

### A. Tách Compiler Arena khỏi Managed Heap là đúng

Ba arena:

```text
ASTArena
OptArena
IRArena
```

và reset theo phase là hướng rất hợp lý. Compiler object và runtime object có lifecycle hoàn toàn khác nhau; không nên để chúng đi chung allocator. Việc `ASTArena`/`OptArena` reset sau khi IR đã hoàn chỉnh cũng hợp lý về mặt cache locality và giảm `malloc/free`. 

Đây là phần mình **giữ gần như nguyên bản**.

---

### B. AST → IR → Bytecode là nâng cấp rất quan trọng

Đây có lẽ còn quan trọng hơn GC.

Hiện kế hoạch đã xác định:

```text
AST
 ↓
Canonicalizer
 ↓
TreeOpt
 ↓
Linear IR
 ↓
IROpt
 ↓
IRToBytecode
 ↓
VM
```

và muốn bytecode hưởng lợi trực tiếp từ CSE, copy propagation, DCE, block merging.  

Đây là hướng đúng vì:

```text
AST Bytecode
```

thường mang rất nhiều cấu trúc thừa.

Còn:

```text
Optimized IR → Bytecode
```

cho VM một chương trình đã được “dọn” trước.

Mục tiêu giảm 25–40% bytecode **có thể làm KPI thử nghiệm**, nhưng không nên coi là invariant bắt buộc ngay từ đầu. 

---

### C. Non-moving GC là lựa chọn hợp lý cho JIT đầu tiên

Tài liệu cố tình chọn:

```text
Non-moving GC
```

để object address ổn định, phục vụ JIT/OSR. Đây là lựa chọn thực dụng. 

Với một runtime còn đang hình thành, mình cũng **không khuyên nhảy ngay vào copying/compacting GC**.

Non-moving trước:

```text
ổn định pointer
→ dễ FFI
→ dễ debug
→ dễ JIT
→ dễ implement
```

sau này mới tính tới moving GC khi thật sự cần.

---

### D. Root set được định nghĩa khá đúng

Tài liệu không chỉ quét operand stack mà còn:

```text
Operand Stack
Locals
Globals
Call Frames
Handles
```

đây là điều rất quan trọng. 

Đặc biệt **Handles** là điểm đáng giữ nếu sau này muốn native/JIT/FFI.

---

### E. Stress test có tư duy hệ thống

ST-5 kiểm tra cycle, graph lớn, false collection.

ST-6 kiểm tra 10 triệu allocation và survivor 1%. 

Đây là tốt hơn rất nhiều so với kiểu:

```text
new object
GC()
PASS
```

---

# 3. Nhưng vấn đề lớn nhất: kế hoạch đang trộn hai milestone

Hiện Gate 5.5 chứa:

```text
Compiler Memory Reclamation
+
IRToBytecodeEmitter
```

Gate 5.6 lại chứa:

```text
Managed Heap
+
GC
```

Tức là đang đồng thời thay đổi:

```text
compiler memory model
compiler backend
bytecode generation
VM allocation
object layout
root scanning
GC
safepoint
```

Trong cùng một chặng.

Đây là **rủi ro kỹ thuật lớn**.

Nếu sau đó test fail, bạn sẽ không biết:

```text
GC sai?
IR sai?
Bytecode emitter sai?
VM semantics sai?
Object layout sai?
```

### Cách tối ưu hơn

Tách thành:

```text
Gate 5.5A
Compiler Arena + lifetime
        ↓
Gate 5.5B
IR → Bytecode
        ↓
Gate 5.6A
Managed Heap
        ↓
Gate 5.6B
Precise Mark-Sweep
        ↓
Gate 5.6C
Safepoint + Root correctness
```

Như vậy mỗi mốc có **một invariant chính**.

---

# 4. Điểm nguy hiểm nhất trong GC: free-list hiện vẫn chưa đủ chặt

Tài liệu đề xuất:

```text
64 KB Region
+
Bump pointer
+
Segregated Free Lists
16B
32B
64B
128B
...
```

Đây là ý tưởng tốt. 

Nhưng hiện mô tả mới dừng ở mức allocator concept.

Bạn còn phải quyết định:

### Object size class tính theo gì?

Ví dụ:

```text
requested payload = 37 B
header = 8 B
alignment = 8
```

thì block thực tế có thể là:

```text
48 B
```

Chứ không phải 37 B.

Do đó nên định nghĩa chính thức:

```text
object_size
allocation_size
size_class
payload_size
```

Nếu không, free list rất dễ xuất hiện lỗi double-free / overwrite / fragmentation.

---

# 5. `GCHeader 8 bytes` cần kiểm chứng, không được chỉ tuyên bố

Tài liệu nói:

```cpp
struct alignas(8) GCHeader {
    uint8_t type_id;
    uint8_t mark_bit : 1;
    uint8_t flags : 7;
    uint16_t region_id;
    uint32_t size_bytes;
};
```

và kết luận 8 bytes. 

Về ý tưởng thì ổn.

Nhưng **không nên dùng “sizeof = 8” như một assumption kiến trúc**.

Phải có compile-time assertion:

```cpp
static_assert(sizeof(GCHeader) == 8);
static_assert(alignof(GCHeader) == 8);
```

và tốt hơn nữa là:

```cpp
static_assert(offsetof(GCHeader, region_id) == ...);
```

vì bit-field layout là thứ không nên phụ thuộc tùy tiện vào ABI/compiler.

Thậm chí mình còn nghiêng về một representation rõ ràng hơn:

```cpp
struct GCHeader {
    uint8_t  type;
    uint8_t  flags;
    uint16_t region_id;
    uint32_t size;
};
```

và:

```cpp
FLAG_MARK = 1 << 0;
FLAG_HAS_PTRS = 1 << 1;
FLAG_PINNED = 1 << 2;
```

Dễ serialize/debug/inspect hơn bit-field.

---

# 6. “Precise GC” hiện mới đúng một nửa

Tài liệu nói mỗi object tự cung cấp cách scan chính xác:

```text
Array → VMValue
Object → fields
Closure → captures
String/Tafpu → leaf
```



Nhưng **precise GC không chỉ là object có trace function**.

Bạn còn cần **type metadata table**.

Mình khuyên:

```text
GCTypeDescriptor
├── size / layout
├── has_pointers
├── trace_fn
├── finalize_fn
└── debug_name
```

Ví dụ:

```cpp
struct GCTypeDescriptor {
    uint8_t type_id;
    bool has_pointers;

    void (*trace)(GCObject*, Tracer&);
    void (*finalize)(GCObject*);
};
```

Rồi:

```text
Object
 ↓
header.type_id
 ↓
TypeRegistry[type_id]
 ↓
trace()
```

Kiến trúc này tốt hơn để sau này thêm:

```text
Map
WeakRef
Promise
NativeObject
Module
Tensor
AIObject
```

mà không phải sửa GC core.

---

# 7. Safepoint hiện tại hơi quá đơn giản

Tài liệu chọn:

```text
OP_CALL
backward JUMP
allocation
```



Đủ cho VM cơ bản.

Nhưng nếu mục tiêu thật sự là:

```text
JIT + OSR
```

thì sau này phải có:

```text
Safepoint ID
↓
Frame map
↓
Live references
↓
GC root locations
```

Nói cách khác, VM cần biết:

> “Tại safepoint này, chính xác VMValue nào là reference?”

chứ không chỉ biết:

> “đang ở OP_CALL”.

Đây là khác biệt cực lớn.

---

# 8. Điểm mình lo nhất về JIT: stable pointer ≠ đủ cho JIT

Tài liệu đang lập luận:

```text
non-moving heap
→ stable address
→ JIT safe
```



Đúng, nhưng chưa đủ.

JIT còn cần:

```text
Object lifetime guarantee
Write barriers
Root maps
Safepoint metadata
Frame maps
Deoptimization metadata
FFI pinning
Exception/unwind metadata
```

Đặc biệt **write barrier**.

Nếu sau này có generational GC, incremental GC hoặc concurrent GC thì barrier trở nên quan trọng.

Vì vậy ngay Gate 5.6 nên chừa abstraction:

```cpp
GC_WRITE_BARRIER(obj, field, value)
```

dù implementation hiện tại có thể là:

```cpp
inline void gc_write_barrier(...) {}
```

Đó là khoản “đầu tư 0 đồng, cứu refactor sau này”.

---

# 9. “Region 64 KB” không nên đóng cứng quá sớm

64 KB là con số hợp lý để prototype. 

Nhưng đừng để API phụ thuộc trực tiếp:

```cpp
Region<65536>
```

Nên:

```cpp
constexpr size_t REGION_SIZE = ...
```

và allocator abstraction:

```text
Heap
 ├─ RegionPool
 ├─ SizeClassAllocator
 └─ LargeObjectAllocator
```

Vì **object > region** chưa được kế hoạch xử lý rõ.

Ví dụ:

```text
String = 2 MB
Array = 10 MB
Tensor = 100 MB
```

Không thể nhét tất cả vào size classes hiện tại.

Phải có:

```text
Small Object Path
Large Object Path
```

---

# 10. ST-6 hiện có một KPI hơi nguy hiểm

Tài liệu yêu cầu:

> `>30,000,000 objects/sec` 

Mình **không khuyên lấy con số này làm pass/fail gate**.

Vì allocation rate phụ thuộc:

```text
CPU
compiler
build mode
object size
cache
OS
allocator state
GC frequency
```

Một máy 5 GHz và máy 3 GHz sẽ khác rất nhiều.

Nên chuyển thành:

```text
correctness = HARD GATE

performance = benchmark metric
```

Ví dụ:

```text
PASS:
- zero UAF
- zero double free
- zero false collection
- zero leak in controlled workload

REPORT:
- alloc/s
- bytes/s
- pause time
- peak RSS
- fragmentation
```

Như vậy khoa học hơn.

---

# 11. “Memory Flatline” cũng cần định nghĩa toán học

Hiện tài liệu yêu cầu RSS/Heap Peak “giữ ở mức trần ổn định”. 

Nhưng cần định nghĩa:

```text
Warm-up phase
Steady-state phase
Allowed variance
```

Ví dụ:

```text
Warm-up = 2M allocations

Measurement = next 8M

Peak RSS growth:
< 5%
```

Chứ không thể nói:

```text
flatline = exact same byte
```

vì OS memory accounting vốn không ổn định tuyệt đối.

---

# 12. `2,135,241 invariants` là chỗ mình sẽ cảnh giác nhất

Tài liệu đặt mục tiêu:

```text
2,135,241 / 2,135,241 invariants PASS
```

và hash seal:

```text
CP3_MANAGED_HEAP
```



Nghe rất “production”, nhưng về engineering mình không thích việc **đặt con số invariant trước khi định nghĩa invariant**.

Quan trọng là:

```text
Invariant ID
Input
Expected property
Observed value
Failure reproduction
```

Chứ 2 triệu test mà nhiều test chỉ kiểm tra cùng một property với input khác nhau thì chưa chắc mạnh hơn 2.000 test tốt.

Nên đổi tư duy:

```text
Invariant count
        ↓
Coverage matrix
```

---

# 13. Cryptographic seal chỉ nên là seal của verified artifact

Đừng để:

```text
hash = PASS
```

mang ý nghĩa:

> “phần mềm đúng”.

SHA-256 chỉ chứng minh:

> artifact này đúng là artifact đã được hash.

Nó không chứng minh correctness.

Nên registry:

```json
{
  "milestone": "CP3_MANAGED_HEAP",
  "commit": "...",
  "toolchain": "...",
  "compiler": "...",
  "platform": "...",
  "tests": "...",
  "benchmarks": "...",
  "artifact_sha256": "..."
}
```

sẽ mạnh hơn nhiều.

---

# 14. Kiến trúc mình khuyên dùng

Mình sẽ chỉnh cả Gate 5.5/5.6 thành:

```text
                    TERSUN
                       │
                 Optimized IR
                       │
                ┌──────┴──────┐
                │             │
          Bytecode Gen      JIT later
                │
                ▼
             Tier-1 VM
                │
        ┌───────┴────────┐
        │                │
      VMValue          Handles
        │                │
        └───────┬────────┘
                ▼
             GC Heap
                │
      ┌─────────┼─────────┐
      │         │         │
    Fresh    FreeList   LargeObj
    Region     bins       path
      │         │         │
      └─────────┴─────────┘
                │
         Precise Mark/Sweep
                │
        ┌───────┴────────┐
        │                │
      Roots         Type Metadata
        │                │
        └───────┬────────┘
                ▼
           Safepoint
                │
          Future JIT/OSR
```

---

# 15. Thứ tự triển khai tối ưu nhất

Mình **không** làm toàn bộ file theo thứ tự hiện tại.

Mình sẽ làm:

### Phase A — Compiler memory

```text
compiler_arena.hpp
ASTArena
OptArena
IRArena
```

Test:

```text
parse
→ optimize
→ IR
→ reset
→ no semantic change
```

### Phase B — IR → Bytecode

```text
IRToBytecodeEmitter
```

Test bằng differential:

```text
AST→Bytecode
vs
IR→Bytecode
```

Cùng input phải cho **cùng observable result**.

Đây là test cực kỳ quan trọng.

### Phase C — Heap

Trước GC:

```text
GCHeap
RegionPool
SizeClass
LargeObject
```

nhưng chưa sweep.

### Phase D — Object metadata

```text
GCHeader
GCTypeDescriptor
TypeRegistry
Tracer
```

### Phase E — Root system

```text
OperandStack
Locals
Globals
Frames
Handles
```

### Phase F — Mark only

Chưa sweep.

```text
roots
 ↓
mark
 ↓
verify reachability
```

Test trước.

### Phase G — Sweep

```text
mark
 ↓
sweep
 ↓
free-list
```

### Phase H — Safepoint

```text
allocation
call
loop-backedge
```

### Phase I — Stress

Cuối cùng mới:

```text
10M objects
cycles
large graph
survivors
fragmentation
```

---

# 16. Một thay đổi rất quan trọng: thêm Differential VM Test

Đây là thứ hiện kế hoạch chưa nhấn mạnh đủ.

Trong quá trình chuyển:

```text
AST → Bytecode
```

sang:

```text
AST → IR → Bytecode
```

hãy giữ compiler cũ làm oracle:

```text
               AST
              /   \
             /     \
       old emitter  new IR emitter
          ↓             ↓
       bytecode A    bytecode B
             \         /
              \       /
                VM
                 ↓
             same result
```

Test hàng loạt:

```text
arithmetic
branch
loop
closure
array
object
string
exception
recursion
```

Cách này sẽ bắt **compiler regression** cực nhanh.

---

# 17. Mình cũng muốn thêm một tầng “GC Debug Mode”

Trong Debug build:

```text
--gc-debug
```

Heap sẽ kiểm tra:

```text
allocation header
red zones
canary
double free
invalid pointer
dead-object access
root consistency
```

Sau mỗi GC:

```text
verify_heap()
```

Production build:

```text
OFF
```

Debug build:

```text
ON
```

Điều này cực kỳ đáng tiền trong giai đoạn hiện tại.

---

# 18. Cuối cùng: Gate 5.7 JIT nên được “chuẩn bị”, nhưng chưa được “thiết kế ngược”

Đây là nguyên tắc mình thấy quan trọng nhất.

Hiện tài liệu đã nghĩ tới JIT/OSR và đó là tốt. 

Nhưng đừng để:

```text
"JIT sẽ cần X"
```

kéo Gate 5.6 thành một GC quá phức tạp.

Gate 5.6 chỉ cần đảm bảo contract:

```text
object address stable
precise tracing
root enumeration
safepoints
handles
type metadata
```

Còn:

```text
generational
incremental
concurrent
write barrier optimization
moving GC
deoptimization
```

để sau.

---

# Kết luận

Bản kế hoạch này **đáng triển khai**, và quan trọng là **hướng kiến trúc không hề sai**. Ba quyết định mình đánh giá cao nhất là:

```text
Linear IR → Bytecode
        +
Non-moving Managed Heap
        +
Precise Root/Type tracing
```

  

Nhưng mình sẽ **không triển khai nguyên xi tài liệu hiện tại**.

Cấu trúc tối ưu hơn là:

```text
CP3
│
├── CP3-A Compiler Arena
├── CP3-B IR → Bytecode
├── CP3-C Managed Heap
├── CP3-D Precise Mark
├── CP3-E Sweep + Free List
├── CP3-F Root/Safepoint
└── CP3-G Stress + Differential Verification
```

Sau khi CP3-G đóng dấu:

```text
CP3_MANAGED_HEAP
```

thì mới bước sang:

```text
Gate 5.7 JIT
Gate 5.8 OSR
```

Và đặc biệt, **mình sẽ bỏ việc dùng `30M alloc/s` và `2,135,241 invariants` làm những “con số thiêng”**; thay bằng correctness gates + reproducible benchmark + coverage matrix. Các con số hiện tại nên trở thành **benchmark/report**, không phải định nghĩa correctness. 

Nếu triển khai theo cấu trúc trên, Tersun sẽ có nền VM sạch hơn rất nhiều: **compiler có lifecycle riêng, bytecode thực sự đi qua optimizer, heap có ownership rõ ràng, GC precise, object address ổn định, và ABI đủ sạch để JIT/OSR nối vào sau này mà không phải đập GC ra làm lại.**
