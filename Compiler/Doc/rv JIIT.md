Mình đã đọc kỹ toàn bộ **Gate 5.9.1 / Runtime Auto-Tiering Coordinator** trong file. Lần này mình sẽ tập trung đúng vào thứ bạn hỏi: **nhận xét, đánh giá và đặc biệt là giải pháp tối ưu hiệu năng**, không chỉ correctness.

Bản này về ý tưởng đã tiến rất xa. Nó đang biến Tersun từ:

```text
Interpreter
    ↓
JIT
```

thành:

```text
Tier-0 Interpreter
      ↓
Tier-1 Baseline JIT
      ↓
Tier-2 Optimizing JIT
```

và có cơ chế tự động điều phối tier-up/deopt/poisoning ngay trong `VM::run_switch`. Đây là bước cần thiết để runtime thực sự “tự vận hành”, thay vì benchmark phải gọi JIT bằng tay. 

# 1. Đánh giá tổng thể

Mình chấm bản này:

| Hạng mục                          |       Điểm |
| --------------------------------- | ---------: |
| Ý tưởng runtime                   | **9.5/10** |
| Kiến trúc tiering                 | **9.2/10** |
| Khả năng tự động hóa              | **9.5/10** |
| Correctness direction             | **9.0/10** |
| Hiệu năng tiềm năng               | **9.4/10** |
| Chi phí runtime overhead hiện tại | **7.2/10** |
| Chính sách threshold              | **6.8/10** |
| Khả năng tránh tier-thrashing     | **7.8/10** |
| Production readiness              | **7.4/10** |

**Điểm mạnh:** đúng hướng.

**Điểm yếu:** Coordinator có nguy cơ trở thành một lớp kiểm tra cực nóng nằm ngay trong interpreter dispatch.

Nói cách khác:

> Bạn đã giải bài toán “khi nào JIT”, nhưng chưa tối ưu hoàn toàn bài toán “làm sao biết khi nào JIT mà không phải trả chi phí kiểm tra JIT ở mọi instruction”.

Đây mới là phần mình sẽ tối ưu mạnh.

---

# 2. Kiến trúc hiện tại có một bottleneck tiềm ẩn

Bạn muốn:

```text
VM::run_switch
  ↓
OP_CALL
  ↓
record_invocation()
  ↓
evaluate_and_tier_up()
```

và:

```text
OP_JUMP
  ↓
record_backedge()
  ↓
evaluate_and_tier_up()
```

Ý tưởng này đúng. Nhưng nếu `evaluate_and_tier_up()` được gọi quá thường xuyên và chứa:

```text
function lookup
code object lookup
tier state lookup
counter read
threshold compare
profile state
poison check
```

thì **Interpreter dispatch sẽ bắt đầu trả “thuế JIT” cho cả code lạnh**.

Đặc biệt:

```text
OP_JUMP
```

là một hot opcode.

Một vòng:

```text
10,000,000 jumps
```

mà mỗi lần lại làm nhiều bookkeeping thì JIT chưa kịp cứu runtime, overhead profiler đã ăn một phần lợi ích.

---

# 3. Giải pháp số 1: Fast-path counter, không gọi Coordinator đầy đủ

Đừng:

```cpp
evaluate_and_tier_up(...)
```

ở mọi backedge.

Hãy dùng:

```cpp
++loop_counter;

if (UNLIKELY(loop_counter >= threshold)) {
    evaluate_and_tier_up(...);
}
```

Tức hot path chỉ còn:

```text
increment
+
compare
+
conditional branch
```

Còn logic nặng:

```text
lookup
profile snapshot
compile
state transition
```

chỉ chạy khi vượt ngưỡng.

### Mô hình

```text
Cold path:

OP_JUMP
 ↓
counter++
 ↓
counter < threshold
 ↓
continue
```

Hot path:

```text
counter >= threshold
 ↓
Coordinator
 ↓
JIT
```

Đây là thay đổi mình xem là **P0 về hiệu năng**.

---

# 4. Tối ưu hơn nữa: dùng countdown thay vì count-up

Thay vì:

```text
counter++
if counter >= 200
```

có thể:

```text
counter--
if counter == 0
    trigger
```

Ví dụ:

```cpp
if (--loop_budget == 0) {
    trigger_osr();
}
```

Sau đó chỉ reset/disable counter khi state thay đổi.

Ưu điểm:

```text
counter
 ↓
zero test
```

thường rất gọn.

Nhưng khác biệt thực tế không lớn bằng việc **không gọi Coordinator trên every-edge**.

---

# 5. Giải pháp số 2: Inline Tier State vào Function/Loop metadata

Đừng để:

```text
OP_CALL
 ↓
JITManager
 ↓
unordered_map
 ↓
JITCodeObject
```

để biết tier hiện tại.

Mỗi function/loop nên có metadata nóng ngay trong `Chunk` hoặc executable metadata:

```cpp
struct HotMeta {
    std::atomic<uint32_t> invocation_count;
    std::atomic<uint32_t> backedge_count;

    uint8_t tier;
    uint8_t flags;
};
```

Nếu single-thread:

```cpp
uint32_t invocation_count;
uint32_t backedge_count;
Tier tier;
```

là đủ.

Interpreter hot path lúc đó gần như:

```text
load counter
increment
compare
```

không hash lookup.

---

# 6. Đây là optimization cực quan trọng: tách Hot Data khỏi Cold Data

Hiện `JITCodeObject` của bạn có xu hướng chứa:

```text
deopt_count
poisoned
last_deopt_reason
last_deopt_ip
```

Những thứ này không cần mỗi instruction.

Hãy tách:

```text
Hot metadata
────────────
counter
tier
code ptr
flags

Cold metadata
─────────────
deopt reason
deopt IP
statistics
debug info
compiler diagnostics
profile snapshot
```

Layout:

```text
FunctionRuntimeData
├── HotData
└── ColdData*
```

CPU cache sẽ hưởng lợi đáng kể.

---

# 7. `is_poisoned` nên trở thành bit flag

Thay vì:

```cpp
bool is_poisoned;
```

trong object lớn, dùng:

```cpp
uint8_t flags;
```

ví dụ:

```text
BIT_JIT_READY
BIT_TIER2_READY
BIT_POISONED
BIT_COMPILING
BIT_OSR_AVAILABLE
```

Khi đó:

```cpp
if (!(flags & POISONED))
```

rất rẻ.

---

# 8. Threshold cố định 50 / 200 / 1000 / 3000 / 5 không tối ưu cho mọi workload

Đây là điểm mình muốn thay đổi khá mạnh.

Các threshold:

```text
Tier1 function = 50
Tier1 loop = 200
Tier2 function = 1000
Tier2 loop = 3000
poison = 5
```

là **rất ổn cho milestone/test**, nhưng chưa phải policy tốt cho runtime tổng quát.

Tài liệu đang định nghĩa rõ các ngưỡng này. 

Ví dụ:

### Function nhỏ

```text
10 instructions
10,000 calls
```

Tier-1 rất đáng JIT.

### Function lớn

```text
5,000 instructions
60 calls
```

JIT ngay ở 50 có thể tốn compile time rất lớn.

### Loop khổng lồ

```text
1M iterations
```

OSR ở 200 là tốt.

Nhưng loop:

```text
20 iterations
```

chạy vài trăm lần chưa chắc đáng compile.

---

# 9. Nên dùng Cost-Based Tiering

Thay:

```text
threshold = constant
```

bằng:

```text
hotness_score
```

Ví dụ:

```text
score =
    invocation_count * call_weight
  + backedge_count * loop_weight
  + bytecode_size * size_weight
  + profile_stability * profile_weight
```

Sau đó:

```text
score >= tier1_budget
```

hoặc:

```text
score >= tier2_budget
```

Điều này linh hoạt hơn rất nhiều.

---

# 10. Nhưng đừng over-engineer ngay

Mình không khuyên viết một hệ machine-learning tiering.

Giai đoạn này chỉ cần:

```cpp
uint64_t hotness_score =
    invocations * 4 +
    backedges * 16;
```

và có penalty:

```text
large_function_penalty
compile_cost_penalty
```

là đã đủ tốt.

---

# 11. Tier-2 nên có “compile budget”

Đây là thứ bản kế hoạch đang thiếu.

Giả sử:

```text
function = 100k MIR instructions
```

mà hotness vừa đủ:

```text
1000 calls
```

thì compile Tier-2 có thể cực kỳ đắt.

Nên:

```cpp
struct Tier2Policy {
    uint32_t hotness_threshold;
    uint32_t max_mir_instructions;
    uint32_t max_compile_time_us;
};
```

Nếu vượt:

```text
skip Tier-2
stay Tier-1
```

### Đây là một optimization cực quan trọng

**Không phải function nóng nào cũng nên Tier-2.**

Có những function:

```text
hot + tiny
→ tier2

hot + huge + short-lived
→ tier1
```

---

# 12. `tier2-only` không nên ép compile tất cả ngay từ đầu

Tài liệu mô tả:

> `--tier2-only`: ép buộc biên dịch Tier-2 ngay từ đầu. 

Đây hợp lý cho benchmark/debug.

Nhưng về semantics, nên có:

```text
--tier2-only
= policy override
```

không phải:

```text
compile every function eagerly
```

Nên có:

```text
--tier2-only
→ all executed functions eligible for Tier2
```

hoặc:

```text
--tier2-eager
```

tách riêng nếu thật sự muốn AOT-like behavior.

---

# 13. Deopt poisoning hiện tại hơi quá “vĩnh viễn”

Bạn đặt:

```text
deopt_count >= 5
→ Poisoned forever
→ fallback Tier-1/Tier-0
```



Cái này rất tốt để chống thrashing.

Nhưng:

```text
5 deopts
```

không có nghĩa function **vĩnh viễn không thể tối ưu**.

Ví dụ:

```text
Type profile:
INT 80%
FLOAT 20%
```

Tier-2 fail 5 lần.

Sau đó workload thay đổi:

```text
INT 99.9%
```

vẫn poisoned forever là lãng phí.

---

# 14. Thay `Poisoned` bằng “cooldown”

Mình khuyên:

```text
Tier2Active
    ↓
deopt x5
    ↓
Cooldown
    ↓
stay Tier1
    ↓
continue collecting profile
    ↓
profile stabilizes
    ↓
allow recompile
```

Ví dụ:

```cpp
uint32_t cooldown_remaining;
uint32_t deopt_epoch;
```

Hoặc policy:

```text
5 deopts trong 1000 executions
→ cooldown

5 deopts cách nhau 1 triệu executions
→ không poison
```

Đây là **adaptive poisoning**.

---

# 15. Cực kỳ quan trọng: poison theo reason

Không nên chỉ:

```text
deopt_count++
```

Nên có:

```text
TypeMismatch
ShapeMismatch
Overflow
Bounds
UnsupportedOp
RuntimeException
GC
```

Ví dụ:

```text
TypeMismatch x 5
```

=> có thể disable type specialization.

Nhưng:

```text
Overflow x 5
```

=> không nhất thiết vô hiệu hóa toàn bộ Tier-2.

Tốt hơn:

```text
optimization-level poisoning
```

Ví dụ:

```text
Type guard unstable
→ disable integer specialization

Shape unstable
→ disable MIC

EA failure
→ disable scalar replacement
```

chứ không phải:

```text
tắt toàn bộ Tier2.
```

Đây là một nâng cấp kiến trúc **rất đáng giá**.

---

# 16. “Deopt poisoning” tốt nhất nên là Optimization Feedback

Ví dụ:

```text
Tier2
├── TypeSpec = disabled
├── ShapeIC = enabled
├── LICM = enabled
└── SRA = disabled
```

Sau đó compile Tier-2 lần nữa.

Như vậy runtime có khả năng:

> **tự thích nghi với workload.**

Đây mới là Auto-Tiering thực sự mạnh.

---

# 17. Tối ưu OP_CALL: dùng direct-entry cache

Hiện bạn định:

```text
OP_CALL
 ↓
try_native_call()
```

Mình khuyên bytecode `CALL` có cache entry:

```text
CallSite {
    FunctionID target;
    NativeEntry* entry;
    Tier tier;
}
```

Khi target đã JIT:

```text
OP_CALL
 ↓
native_entry != nullptr
 ↓
direct call
```

Không cần lookup JIT manager.

Đây có thể trở thành:

```text
Interpreter → native
```

rất nhanh.

---

# 18. Đây chính là nơi inline caching cho call đáng áp dụng

Bạn đã có Property MIC/PIC ở Tier-2.

Có thể thêm:

```text
CallSite IC
```

Ví dụ:

```text
CALL foo
```

sau khi resolve:

```text
expected_function = foo
native_entry = ...
```

fast path:

```text
direct native call
```

Nếu function target dynamic:

```text
slow path resolver
```

Đây sẽ giảm overhead `OP_CALL` đáng kể.

---

# 19. OSR cũng nên cache entry pointer

Không nên mỗi backedge:

```text
lookup(function)
lookup(loop)
lookup(OSR entry)
```

Hãy có:

```text
LoopRuntimeData
├── backedge_counter
├── tier
├── osr_entry
└── flags
```

Hot loop:

```text
counter
+
compare
+
OSR entry pointer
```

---

# 20. Tier-1 → Tier-2 không nên block interpreter quá lâu

Hiện:

```text
threshold reached
 ↓
compile tier2
 ↓
continue
```

Nhưng Tier-2 compilation có thể tốn khá nhiều.

Đối với runtime performance:

```text
hot loop
 ↓
request tier2
 ↓
continue tier1
 ↓
compile background
 ↓
publish tier2
 ↓
next backedge OSR
```

Đây là mục tiêu dài hạn rất đáng làm.

Bạn chưa cần multithread compiler ngay, nhưng API nên thiết kế:

```cpp
CompilationRequest
CompilationResult
CompilationState
```

ngay từ bây giờ.

---

# 21. Một optimization rất thực tế: Tier-2 chỉ cho loop hot

Không phải lúc nào function-level Tier-2 cũng đáng.

Ví dụ:

```text
function foo() {
    call bar();
}
```

gọi 10,000 lần.

Nếu `foo` chỉ là wrapper thì Tier-2 gần như vô nghĩa.

Trong khi:

```text
for 10 million iterations
```

thì Tier-2 cực kỳ đáng.

Mình khuyên ranking:

```text
Loop-hot Tier2
>
Call-hot large function Tier2
>
Wrapper function Tier2
```

---

# 22. Tiering policy nên nhìn vào “executed bytecodes”, không chỉ calls

Một metric mạnh hơn:

```text
executed_bytecodes
```

Ví dụ:

```text
calls = 100
bytecodes_per_call = 10
```

vs:

```text
calls = 100
bytecodes_per_call = 10,000
```

Hai function có cùng invocation count nhưng workload hoàn toàn khác.

Nên có:

```cpp
uint64_t executed_bytecodes;
```

và:

```text
hotness ≈ executed work
```

Đây sẽ làm Tiering chính xác hơn nhiều.

---

# 23. Tier-2 promotion nên dựa trên ROI

Đây là công thức đơn giản mình rất khuyên dùng:

```text
ExpectedBenefit =
    estimated_remaining_execution
    × expected_speedup

ExpectedCost =
    compile_time
    + code_cache_cost
    + metadata_cost
```

Chỉ Tier-2 nếu:

```text
ExpectedBenefit > ExpectedCost
```

Không cần mô hình phức tạp.

Ví dụ:

```text
function predicts 20M executions
speedup 3x
compile 50us
```

→ đáng.

Còn:

```text
function predicts 1k executions
compile 5ms
```

→ không đáng.

---

# 24. Bảng policy mình đề xuất

Thay policy hiện tại bằng:

| Tình huống          | Hành động             |
| ------------------- | --------------------- |
| cold                | Interpreter           |
| call hot, nhỏ       | Tier-1                |
| loop hot            | Tier-1 OSR            |
| cực kỳ loop-hot     | Tier-2 OSR            |
| stable type profile | Tier-2                |
| unstable type       | Tier-1                |
| stable shape        | MIC                   |
| 2–4 shapes          | PIC                   |
| >4 shapes           | generic               |
| repeated deopt      | optimization cooldown |
| huge compile cost   | giữ Tier-1            |
| low remaining work  | giữ Tier-1            |

---

# 25. Telemetry nên nâng cấp

`--jit-trace` hiện tại rất hữu ích.

Nhưng nên có:

```text
--jit-stats
```

hiển thị:

```text
Functions:
  Tier0: 120
  Tier1: 23
  Tier2: 7

OSR:
  Tier1 OSR: 31
  Tier2 OSR: 9

Deopt:
  total: 17
  type: 8
  shape: 4
  overflow: 5

Optimizations:
  LICM: 32 loops
  RGE: 981 guards removed
  MIC: 47
  SRA: 13

Performance:
  interpreter time
  tier1 time
  tier2 time
  compile time
```

Cái này rất quan trọng để biết **Auto-Tiering có thực sự giúp hay chỉ tạo overhead**.

---

# 26. ST-10.1 hiện hơi sai ở cách kiểm tra

Tài liệu viết:

> 50 lần trong Interpreter → lần thứ 51 chạy Tier-1. 

Tùy implementation counter semantics, có thể là:

```text
call #50 triggers compilation
call #50 or #51 enters JIT
```

Không nên hard-code test thành:

> “exactly call 51”.

Nên test:

```text
before threshold:
  Tier0

after threshold:
  Tier1
```

---

# 27. ST-10.2 cũng nên tránh yêu cầu đúng “backedge 200”

Tương tự.

Test:

```text
before threshold
→ no OSR

at/after threshold
→ OSR eligible
```

chứ không nên phụ thuộc implementation detail chính xác là backedge thứ 200 nếu policy sau này adaptive.

---

# 28. Thêm hysteresis để tránh tier oscillation

Đây là một optimization khá hay.

Ví dụ:

```text
Tier2
 ↓ deopt
Tier1
 ↓
Tier2 threshold
 ↓
Tier2
 ↓
deopt
```

có thể lặp.

Dùng hai ngưỡng:

```text
promote threshold = 5000
demote threshold = 2 deopts / window
re-promote threshold = 20000
```

Sau deopt:

```text
Tier2 → Tier1
```

phải cần hotness cao hơn để lên lại.

Đây gọi là **promotion hysteresis**.

Rất thích hợp cho Auto-Tiering.

---

# 29. Memory locality của metadata cũng cực kỳ quan trọng

Mình khuyên:

```text
FunctionRuntimeData
```

được bố trí contiguous:

```text
[fn0]
[fn1]
[fn2]
...
```

và loops:

```text
[loop0][loop1][loop2]...
```

tránh:

```text
unordered_map<FunctionID, RuntimeState>
```

trong hot path.

Đây có thể tạo khác biệt lớn hơn những micro-optimization trong assembler.

---

# 30. Đừng dùng `std::atomic` nếu VM hiện tại single-thread

Nếu Tersun VM đang single-threaded:

```text
uint32_t
```

đủ.

Không nên thêm:

```cpp
std::atomic<uint32_t>
```

mọi counter nếu chưa cần concurrency.

Khi compiler thread / runtime multithreading xuất hiện thì mới chuyển.

---

# 31. Một kiến trúc Coordinator tối ưu mình đề xuất

```text
                         VM
                         │
                   run_switch()
                         │
              ┌──────────┴──────────┐
              │                     │
           OP_CALL               OP_JUMP
              │                     │
        hot counter++         backedge--
              │                     │
         fast threshold       zero check
              │                     │
              └──────────┬──────────┘
                         │
                  HOT PATH EXIT
                         │
                 threshold reached
                         ↓
                 TieringCoordinator
                         │
              ┌──────────┼──────────┐
              │          │          │
           Tier1       Tier2      Deopt
              │          │          │
           compile    profile      reason
              │          │          │
              └──────────┼──────────┘
                         │
                    State Update
                         │
                 direct code ptr
                         ↓
                     Native JIT
```

Quan trọng:

> **95–99% thời gian execution không được đi vào `TieringCoordinator`.**

Đó mới là nguyên tắc thiết kế.

---

# 32. Tôi sẽ thay `evaluate_and_tier_up()` bằng 2 tầng API

Thay vì:

```cpp
evaluate_and_tier_up(...)
```

gọi trực tiếp, dùng:

```cpp
inline bool fast_should_tier(uint32_t counter,
                             Tier tier,
                             uint32_t threshold);
```

và:

```cpp
void slow_tiering_path(VM*, FunctionRuntimeData*);
```

Hot:

```cpp
if (--budget == 0)
    slow_tiering_path(...);
```

Cold:

```cpp
```

không làm gì thêm.

Đây là pattern rất mạnh cho interpreter.

---

# 33. Cải tiến lớn hơn nữa: self-modifying dispatch metadata

Khi function đã Tier-1:

```text
FunctionRuntimeData.native_entry != nullptr
```

`OP_CALL` có thể trực tiếp:

```text
if (native_entry)
    call native
else
    interpreter
```

Sau khi tier-up, chỉ cần publish:

```text
native_entry = compiled_entry
```

Không cần Coordinator kiểm tra tier lại mỗi lần.

---

# 34. Code cache cũng phải có eviction policy

Auto-tiering càng tốt thì:

```text
Tier2
Tier2
Tier2
Tier2
...
```

code memory càng tăng.

Cần:

```text
JITCodeCache
├── capacity
├── current_size
├── last_used
└── eviction
```

Ưu tiên giữ:

```text
hot code
```

và retire:

```text
cold code
```

Nếu chưa muốn eviction ở Gate này, ít nhất phải telemetry:

```text
code_cache_bytes
```

và hard cap.

---

# 35. Một lỗi logic mình muốn tránh: hạ toàn bộ function vì một loop deopt

Ví dụ:

```text
function F
 ├── loop A: INT stable
 └── loop B: polymorphic
```

Loop B deopt 5 lần.

Không nên:

```text
F = Poisoned
```

vì loop A vẫn cực kỳ phù hợp Tier-2.

Poison nên có grain:

```text
function
loop
call-site
optimization
```

Mình ưu tiên:

```text
Loop-level poison
```

→ an toàn hơn.

---

# 36. Bộ test tối ưu mình đề xuất

Giữ ST-10.1 → ST-10.7, nhưng thêm:

```text
ST-10.8  Cold code overhead
ST-10.9  Tiering hysteresis
ST-10.10 Re-promotion after cooldown
ST-10.11 Loop-level poisoning
ST-10.12 Code-cache pressure
ST-10.13 Direct-call cache
ST-10.14 Huge-function compile budget
ST-10.15 Repeated tier transitions
ST-10.16 Multi-workload policy test
```

Đặc biệt:

### ST-10.8

```text
100M interpreter bytecodes
```

so sánh:

```text
auto-tiering disabled
vs
auto-tiering enabled
```

với workload **không đủ nóng**.

Mục tiêu:

```text
overhead <= 1–2%
```

Đây mới là test chứng minh Coordinator được tối ưu.

---

# 37. Benchmark đúng cách

Không chỉ:

```text
Tersun auto
vs
Tersun interpreter
```

Mà phải:

```text
                  ┌── Tier0
Workload ─────────┼── Tier1
                  ├── Tier2
                  └── Auto
```

Đo:

```text
startup time
warmup time
steady-state
compile time
total execution time
peak memory
code cache
deopt count
GC pauses
```

Một runtime nhanh hơn 5× ở steady-state nhưng mất 2 giây warmup có thể tệ hơn runtime 3× nhưng warmup 10ms.

---

# 38. Về hiệu năng, thứ tự ưu tiên của mình là

### P0

```text
1. Fast-path counters
2. Inline runtime metadata
3. Direct native entry pointer
4. Loop OSR pointer cache
5. Avoid manager lookup
```

### P1

```text
6. Cost-based tiering
7. compile budget
8. hysteresis
9. reason-specific poisoning
10. code-cache cap
```

### P2

```text
11. background compilation
12. smarter ROI model
13. profile decay
14. dynamic threshold adaptation
```

Đây là thứ tự mình sẽ cho agent triển khai.

---

# 39. Phiên bản policy mình khuyên chốt

Mình sẽ thay các threshold cứng hiện tại bằng default policy:

```cpp
struct TieringPolicy {
    uint32_t tier1_call_threshold = 50;
    uint32_t tier1_backedge_threshold = 200;

    uint32_t tier2_call_threshold = 1000;
    uint32_t tier2_backedge_threshold = 3000;

    uint32_t tier2_min_hotness = 5000;

    uint32_t deopt_window = 1000;
    uint32_t deopt_limit = 5;

    uint32_t repromotion_threshold = 20000;

    uint32_t max_tier2_compile_us = 5000;
    uint32_t max_code_cache_bytes = ...;
};
```

Nhưng:

> **threshold chỉ là default; runtime dùng policy + cost model.**

---

# 40. Kiến trúc cuối cùng mình khuyên

```text
                        TERSUN VM
                            │
                     Runtime Metadata
                            │
            ┌───────────────┴────────────────┐
            │                                │
        Hot Counters                     Code Pointers
            │                                │
            ▼                                ▼
      Fast Tier Check                    Direct Dispatch
            │                                │
            └───────────────┬────────────────┘
                            │
                         HOT?
                            │
                     Tiering Coordinator
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
     Tier-1               Tier-2             Deopt
        │                   │                   │
     Baseline           Optimizing          Feedback
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                     Policy / ROI Model
                            │
                    Profile + Hotness
                            │
               ┌────────────┴────────────┐
               │                         │
          promote                    cooldown
               │                         │
             Native                  Tier-1
```

---

# Kết luận

Bản Auto-Tiering này **đúng hướng và đáng làm**. Nó là bước biến những Gate 5.7–5.9 từ các compiler component riêng lẻ thành **một runtime thực sự có hành vi tự thích nghi**.

Nhưng để đạt hiệu năng tốt nhất, mình sẽ không giữ nguyên chính sách hiện tại.

### Ba thay đổi quan trọng nhất:

**1. Hot path phải cực mỏng**

```text
counter
→ compare
→ branch
```

Không:

```text
counter
→ JITManager
→ lookup
→ policy
→ profile
→ ...
```

**2. Poison phải theo optimization/loop, không phải “giết Tier-2 cả function”**

```text
Type unstable
→ disable type specialization

Shape unstable
→ disable MIC

EA unstable
→ disable SRA
```

thay vì:

```text
5 deopts
→ Tier2 chết vĩnh viễn.
```

**3. Tiering phải có ROI/cost model**

Không phải:

```text
counter >= 1000 → Tier2
```

mà:

```text
estimated future work × expected speedup
>
compile cost + memory cost
```

---

### Nếu chốt theo hướng tối ưu nhất, pipeline sẽ là:

```text
                 Interpreter
                      │
               cheap hot counter
                      │
               ┌──────┴──────┐
               │             │
             cold          hot
               │             │
            continue      Coordinator
                             │
                  ┌──────────┼──────────┐
                  │          │          │
               Tier-1     Tier-2    Cooldown
                  │          │
                 OSR        OSR
                  │          │
                  └────┬─────┘
                       │
                  Native Code
                       │
                Safepoint/Deopt
                       │
                Profile Feedback
                       │
                  adaptive policy
```

**Nếu mục tiêu của Tersun là hiệu năng thực tế, mình đánh giá đây là điểm mà “compiler optimization” bắt đầu nhường sân cho “runtime engineering”.** Từ Gate này trở đi, cache locality, dispatch overhead, code-cache policy, warmup, compile budget và deopt frequency có thể ảnh hưởng hiệu năng **nhiều hơn việc thêm thêm vài optimizer pass**.

Nói cách khác: **Gate 5.9 làm Tersun nhanh; Gate Auto-Tiering này quyết định Tersun có nhanh một cách thông minh hay không.**
