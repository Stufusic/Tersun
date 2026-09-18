# KẾ HOẠCH TÁI THIẾT TOÀN DIỆN GATE 6

## Tersun VM Performance Architecture Rebuild

### Baseline Forensics → Execution Core → Specialization → Tier Economics → Cross-Tier Verification

---

# 0. Mục tiêu của Gate 6 Rebuild

Gate 6 cũ đã triển khai 7 phase:

```text
Phase 0  Baseline
Phase 1  Profiling
Phase 2  TOS Cache
Phase 3  FixedFrameArena
Phase 4  Superinstruction Fusion
Phase 5  Flat Array Storage
Phase 6  Auto-Tiering
Phase 7  Cross-Tier Verification
```

và đã có các seal từ `G6_BASELINE` tới `G6_FINAL_SEAL`. Báo cáo nghiệm thu cũng ghi nhận 20 repetitions trên 9 workloads và 20 bài cross-tier verification.
Tuy nhiên, performance outcome chưa tương xứng với mục tiêu:

```text
Legacy:
fib_24      6.062 → 5.473 ms
branch_2m 154.184 → 110.669 ms
sum_5m    416.120 → 259.800 ms
memory     41.490 → 53.727 ms
dispatch  143.660 → 138.975 ms

Canonical:
W1        120.614 → 142.730 ms
W2         33.769 → 39.309 ms
W3        217.809 → 247.270 ms
W4        136.508 → 130.544 ms
```

Tức là có cải thiện rõ ở `sum_5m` và `branch_2m`, nhưng `memory_200k`, W1, W2, W3 bị regression.

Vì vậy Gate 6 Rebuild không đặt mục tiêu “thêm optimization”, mà đặt mục tiêu:

```text
1. Xác định nguyên nhân bằng dữ liệu.
2. Tái lập được benchmark.
3. Thiết kế lại execution core quanh canonical state.
4. Tách rõ interpreter optimization và JIT optimization.
5. Chỉ tier khi có lợi ích kinh tế thực sự.
6. Không chấp nhận regression không giải thích được.
7. Bảo toàn semantic equivalence giữa mọi execution tier.
```

---

# 1. NGUYÊN TẮC KIẾN TRÚC

## 1.1. Không sửa Semantic Core

Các phần sau phải coi là frozen:

```text
Language semantics
TAFPU semantics
IR semantics
Bytecode semantics
GC object model
Exception semantics
Object identity semantics
```

Không được để optimization làm thay đổi semantics.

---

## 1.2. Mọi optimization phải có Attribution

Không chấp nhận câu:

```text
"Fusion giúp nhanh hơn"
```

mà phải chứng minh:

```text
Baseline
→ + TOS
→ + CallStack
→ + Fusion
→ + FlatArray
→ + AutoTier
```

và từng bước phải có:

```text
time
speedup
opcode count
dispatch count
cache behavior
allocation
GC
compile cost
deopt count
```

---

# 2. P0 — BENCHMARK PROVENANCE REBUILD

## Vấn đề

Các artifact hiện tại đang cho các baseline rất khác nhau.

Artifact trước ghi:

```text
fib_24       median 25.405 ms
branch_2m    median 726.463 ms
memory_200k  median 126.926 ms
sum_5m       median 1940.242 ms
```

trong khi Gate 6 Freeze ghi:

```text
fib_24        6.062
branch_2m   154.184
memory_200k  41.490
sum_5m      416.120
```

Độ lệch này quá lớn để coi là một phiên benchmark liên tục.

## Giải pháp

Tạo:

```text
Compiler/Code/bench/benchmark_manifest.json
```

Mọi benchmark bắt buộc ghi:

```json
{
  "benchmark_id": "...",
  "code_commit": "...",
  "tersun_version": "...",
  "compiler": "...",
  "compiler_flags": "...",
  "os": "...",
  "cpu": "...",
  "ram": "...",
  "workload_version": "...",
  "input_size": 0,
  "seed": 0,
  "repetitions": 30,
  "warmup": 5,
  "mode": "interpreter|jit|aot"
}
```

### Quy tắc

Không có manifest:

```text
→ kết quả không được đưa vào performance seal.
```

Không cùng:

```text
workload version
+
build
+
hardware class
+
runtime mode
```

thì:

```text
không được gọi là regression hoặc improvement.
```

Baseline cũ vẫn giữ lại làm:

```text
LEGACY_BASELINE_V0
```

nhưng tạo một:

```text
G6R_BASELINE_V1
```

làm baseline chính thức mới.

---

# 3. Pha G6R-1 — PERFORMANCE FORENSICS

## Mục tiêu

Không optimization mới.

Chỉ đo.

---

## 3.1. Opcode telemetry

Tạo:

```text
include/vm/vm_telemetry.hpp
src/vm/vm_telemetry.cpp
```

Thu:

```text
opcode_count
branch_count
call_count
ret_count
load_count
store_count
array_get_count
array_set_count
field_get_count
field_set_count
allocation_count
gc_count
safepoint_count
```

---

## 3.2. TOS telemetry

Bắt buộc:

```text
tos0_hit
tos1_hit
tos_miss
flush_count
materialize_count
stack_spill_count
```

Tính:

```text
TOS hit rate
TOS flush rate
```

Nếu TOS hit rate thấp:

```text
→ không tiếp tục tối ưu TOS.
```

---

## 3.3. Fusion telemetry

Ghi:

```text
candidate_pattern
candidate_count
fused_count
rejected_count
semantic_barrier_count
jump_target_rejection
executed_fused_opcode_count
```

Phải trả lời được:

```text
Compiler nhận diện 1 triệu pattern
→ thực sự fuse 900 nghìn?
→ runtime thực sự execute bao nhiêu?
```

---

## 3.4. Array telemetry

Ghi:

```text
Generic access
I64 access
U8 access
F64 access
TAFPU access

promotion
degradation
representation conversion
```

W2 sẽ dùng dữ liệu này để xác minh:

```text
W2 thật sự chạy FlatBuffer hay vẫn chạy Generic Array?
```

---

## 3.5. JIT economics telemetry

Mỗi function ghi:

```text
invocation_count
backedge_count
bytecode_size
compile_time_tier1
compile_time_tier2
native_time
interpreter_time
osr_count
deopt_count
time_saved
```

Từ đây mới quyết định JIT.

---

# 4. Pha G6R-2 — CANONICAL VM EXECUTION STATE

Đây là refactor quan trọng nhất.

Tạo:

```text
include/vm/vm_execution_state.hpp
src/vm/vm_execution_state.cpp
```

Định nghĩa rõ:

```text
Operand Stack
TOS Cache
Call Stack
Locals
IP
Frame
Exception State
GC-visible State
JIT Handoff State
```

Canonical representation:

```text
             VMExecutionState
                    │
       ┌────────────┼────────────┐
       ▼            ▼            ▼
 Operand Stack   CallStack     Locals
       │
   TOS Cache
```

Mọi tier phải có protocol:

```text
materialize()
handoff()
restore()
deopt()
```

Không để `vm.cpp`, JIT và GC tự hiểu state theo các cách khác nhau.

---

# 5. Pha G6R-3 — TOS CACHE REBUILD

Gate 6 cũ đã làm 2-slot TOS:

```text
r_tos0
r_tos1
r_depth
```

và có các invariant I-TOS-01 → I-TOS-05.

Phần này được giữ lại, nhưng implementation phải được audit lại quanh canonical execution state.

## Thiết kế

```cpp
struct TOSCache {
    VMValue tos0;
    VMValue tos1;
    uint8_t depth;
};
```

## Không dùng claim:

```text
0 memory traffic
1 cycle
```

Thay bằng:

```text
TOS hit rate
loads/op
stores/op
flush/op
cycles/op
```

## Required tests

```text
G6R-TOS-01 unary
G6R-TOS-02 binary
G6R-TOS-03 ternary arithmetic
G6R-TOS-04 CALL flush
G6R-TOS-05 RET restore
G6R-TOS-06 exception
G6R-TOS-07 GC safepoint
G6R-TOS-08 JIT handoff
G6R-TOS-09 deopt
```

---

# 6. Pha G6R-4 — CALL STACK REBUILD

Gate 6 cũ đã thay vector bằng:

```text
CallFrame frames_[2048]
```

và có cold overflow safety.

Giữ kiến trúc này nhưng chuẩn hóa:

```text
FixedFrameArena
+
overflow slow path
+
guard
```

Không bao giờ bỏ safety check hoàn toàn.

## Benchmark

```text
recursive_100
recursive_500
recursive_1000
recursive_2000
recursive_overflow
exception_unwind
```

## Metrics

```text
ns/call
ns/ret
frames/sec
L1 cache locality
overflow frequency
```

---

# 7. Pha G6R-5 — SUPERINSTRUCTION REBUILD

Gate 6 đã có:

```text
STORE_LOCAL_POP
LOAD_LOAD_LOCAL
FUSED_ADD_LOCAL_LOCAL_STORE

FUSED_MUL_ADD_I64
FUSED_MUL_ADD_F64
FUSED_MUL_ADD_TAFPU
```

và semantic barriers/jump-target protection.

Giữ framework nhưng bổ sung cost model.

## Kiến trúc

```text
Bytecode
   ↓
Pattern Matcher
   ↓
Semantic Barrier Check
   ↓
Cost Model
   ↓
Fusion
```

Fusion chỉ được phép nếu:

```text
fusion_cost
<
dispatch_cost_saved
```

## Không fusion xuyên

```text
CALL
THROW
ALLOC
GC_SAFEPOINT
DEOPT
JUMP_TARGET
SIDE_EFFECT
```

---

# 8. Pha G6R-6 — FLAT ARRAY 2.0

Gate 6 đã có 5 representation:

```text
I64
U8
F64
TAFPU
Generic
```

cùng promotion/degradation.

Phần này nên giữ contract nhưng thay promotion policy.

## Kiến trúc

```text
ArrayObject
 ├── length
 ├── capacity
 ├── representation
 ├── flags
 └── payload
```

## Quy tắc

### Tạo array

```text
[int]
→ I64

[uint8]
→ U8

[float]
→ F64

[Tafpu]
→ TAFPU

mixed
→ Generic
```

### Mutation

Không convert mỗi access.

Chỉ chuyển representation khi:

```text
mutation violates current representation
```

### Quan trọng

Không dùng:

```text
Generic → Flat → Generic
```

liên tục.

Có hysteresis:

```text
promotion_threshold
degradation_threshold
```

---

# 9. Pha G6R-7 — AUTO-TIERING REBUILD

Đây là phần mình muốn sửa mạnh nhất.

Gate 6 hiện dùng:

$$
ROI = InvocationCount + BackedgeCount \times W_{loop}
$$

và có cooldown/hysteresis.

Công thức trên nên được coi là:

```text
Hotness Score
```

chứ chưa phải ROI kinh tế.

## ROI mới

Dùng:

$$
ROI =
T_{remaining}^{interp}
-
(
T_{compile}
+
T_{remaining}^{jit}
)
$$

Chỉ promote nếu:

$$
ROI > safety\_margin
$$

Ví dụ:

```text
compile = 2 ms
estimated savings = 0.4 ms
→ NO JIT

compile = 2 ms
estimated savings = 40 ms
→ JIT
```

---

# 10. Tier policy mới

```text
Tier 0
Interpreter

Tier 1
Baseline JIT

Tier 2
Optimizing JIT
```

## Tier 0 → Tier 1

Điều kiện:

```text
hotness > threshold
AND
expected_saved_time > compile_cost
```

## Tier 1 → Tier 2

Điều kiện:

```text
hot enough
AND
type stability high
AND
deopt risk acceptable
AND
compile budget available
AND
expected ROI positive
```

---

# 11. OSR policy

Loop:

```text
invocation_count = 1
backedge_count = 10,000,000
```

phải được coi là hot.

OSR trigger dựa trên:

```text
backedge count
+
estimated remaining work
+
loop body cost
```

Không chỉ dựa vào function invocation.

Điểm này tiếp tục tận dụng nền tảng OSR/deopt đã được Gate 5.8 thiết kế với backedge hook, DeoptTable và state reconstruction.

---

# 12. Pha G6R-8 — SPECIALIZED BYTECODE

Sau khi có telemetry thật, mới thêm specialization.

Ví dụ:

```text
ADD_I64_LOCAL
MUL_I64_LOCAL
LOAD_I64_ARRAY
STORE_I64_ARRAY
FIELD_SET_MONO
FIELD_GET_MONO
```

Thay vì:

```text
OP_ADD
```

luôn generic.

Pipeline:

```text
Generic opcode
       ↓
Profile says stable I64
       ↓
Specialized opcode
```

Đây sẽ là bước quan trọng để kéo VM gần native.

---

# 13. Pha G6R-9 — FIELD FAST PATH

W4 hiện đã cải thiện nhẹ:

```text
136.508 → 130.544 ms
```

khoảng 1.05x.

Do Gate 5.9.2 đã có Method IC, bước tiếp theo nên là:

```text
Field IC
```

Thiết kế:

```text
VMShape*
    ↓
cached field offset
    ↓
direct field access
```

Không tra string mỗi lần:

```text
"health"
"position"
"velocity"
```

---

# 14. Pha G6R-10 — PERF-CORRECTNESS MATRIX

Mỗi workload phải chạy tối thiểu:

```text
--interp
--optimized-interpreter
--jit-baseline
--jit-auto
--aot
```

và sinh:

```text
metrics.json
trace.json
opcode_profile.json
jit_profile.json
array_profile.json
```

---

# 15. Benchmark Set chính thức

## Legacy Set

```text
fib_24
branch_2m
sum_5m
memory_200k
dispatch_3m
```

## Canonical Set

```text
W1 Fibonacci
W2 Prime Sieve
W3 Matrix Multiplication
W4 Object Updates
```

## Microbench Set

```text
call_ret
tos_binary
tos_unary
branch
array_i64
array_u8
array_f64
array_tafpu
field_get
field_set
loop_backedge
jit_compile
osr_transition
deopt
gc_allocation
```

---

# 16. Benchmark protocol

Development:

```text
warmup = 5
reps = 10
```

Acceptance:

```text
warmup = 10
reps = 30
```

Final seal:

```text
reps = 50
```

Mỗi test báo:

```text
median
mean
stddev
P95
min
max
CV
```

Không chỉ median.

---

# 17. Performance acceptance criteria

## Stage A — Không regression

Tất cả workload:

```text
Current <= Baseline × 1.05
```

Nếu:

```text
> +5%
```

thì Gate không được seal.

Trừ khi có:

```text
explicitly documented reason
```

---

# 18. Stage B — Interpreter target

Mục tiêu không phải lập tức chạm native.

Đầu tiên:

```text
W1  ≥ 1.5x
W2  ≥ 1.5x
W3  ≥ 2x
W4  ≥ 1.3x
```

chỉ tính trên:

```text
optimized interpreter
```

không tính JIT.

---

# 19. Stage C — Auto-Tiering target

Sau khi interpreter đã ổn:

```text
AutoTier <= optimized interpreter
```

trên workload ngắn.

Và:

```text
long-running loops
→ AutoTier phải thắng rõ rệt.
```

Đây là điểm cực quan trọng:

> Auto-tiering không được làm workload ngắn chậm hơn chỉ vì JIT được bật mặc định.

---

# 20. Stage D — Target dài hạn

Sau G6R mới đặt:

```text
W1 ≤ 50–80 ms
W2 ≤ 20–25 ms
W3 ≤ 80–120 ms
W4 ≤ 80–100 ms
```

Sau đó mới hướng tới:

```text
VM → Native gap < 10x
```

và cuối cùng:

```text
hot numeric loops
→ VM/JIT → near-native
```

Không đặt “vượt Java mọi phương diện” làm acceptance criterion.

---

# 21. Differential Verification

Giữ toàn bộ 20 test hiện có.

Đặc biệt:

```text
Interpreter vs JIT
VM vs JIT vs AOT
TAFPU
arrays
VMShape
exceptions
OSR
deopt
GC
mixed numeric
```

Gate 6 report hiện đã có ST-12.1 → ST-12.20 cho đúng những nhóm này.

Bổ sung:

```text
G6R-D21
Randomized optimization toggles

G6R-D22
Tier transition fuzzing

G6R-D23
Repeated OSR/deopt cycles

G6R-D24
GC during deopt

G6R-D25
GC during fused instruction

G6R-D26
FlatArray mutation under JIT

G6R-D27
Field IC invalidation

G6R-D28
Huge recursion + exception + JIT
```

---

# 22. Optimization Toggle Matrix

Đây là thứ Gate 6 cũ cần có nhưng chưa thể hiện đủ trong báo cáo nghiệm thu.

Cho phép:

```text
--opt-tos=on/off
--opt-callstack=on/off
--opt-fusion=on/off
--opt-flatarray=on/off
--opt-fieldic=on/off
--opt-tiering=on/off
--opt-osr=on/off
```

Sau đó chạy factorial experiments.

Ví dụ W3:

```text
baseline
TOS
TOS+Fusion
TOS+Fusion+Flat
TOS+Fusion+Flat+JIT
```

Từ đó xác định optimization interaction.

---

# 23. Root-Cause Matrix cần bắt buộc

## W1 regression

Kiểm tra:

```text
JIT compile overhead
recursive call overhead
frame transition
deopt/OSR
```

Nếu:

```text
--interp tốt
--auto-tier xấu
```

→ tiering policy là thủ phạm.

---

## W2 regression

Kiểm tra:

```text
flat promotion
generic access ratio
bounds check
representation conversion
array object indirection
```

Nếu:

```text
flat access < 90%
```

→ FlatBuffer chưa thực sự chiếm hot path.

---

## W3 regression

Kiểm tra:

```text
fused opcode execution rate
typed arithmetic
loop dispatch
JIT compile time
TAFPU path
```

Nếu:

```text
candidate fusion cao
actual fusion thấp
```

→ compiler pattern matching chưa đủ.

Nếu:

```text
fusion cao
nhưng runtime vẫn chậm
```

→ fused opcode itself đang có overhead.

---

## memory_200k regression

Kiểm tra:

```text
allocation rate
GC count
GC pause
object header
write barrier
TOS flush
JIT transitions
```

Nếu allocation cùng mà GC time tăng:

```text
→ GC integration regression.
```

Nếu GC không tăng mà execution tăng:

```text
→ VM dispatch/layout issue.
```

---

# 24. File structure đề xuất

```text
Compiler/
├── Doc/
│   ├── Gate6_Rebuild.md
│   ├── Gate6_Performance_Model.md
│   ├── Gate6_Benchmark_Protocol.md
│   ├── Gate6_VM_State_Contract.md
│   ├── Gate6_Array_Storage_Contract.md
│   └── Gate6_Tier_Economics.md
│
├── Code/
│   ├── include/vm/
│   │   ├── vm_execution_state.hpp
│   │   ├── tos_cache.hpp
│   │   ├── fixed_frame_arena.hpp
│   │   ├── superinstruction.hpp
│   │   ├── array_storage.hpp
│   │   ├── vm_profiler.hpp
│   │   ├── vm_telemetry.hpp
│   │   ├── tier_policy.hpp
│   │   ├── field_ic.hpp
│   │   └── jit_economics.hpp
│   │
│   ├── src/vm/
│   │   ├── vm.cpp
│   │   ├── vm_execution_state.cpp
│   │   ├── tos_cache.cpp
│   │   ├── fixed_frame_arena.cpp
│   │   ├── superinstruction.cpp
│   │   ├── array_storage.cpp
│   │   ├── vm_profiler.cpp
│   │   ├── vm_telemetry.cpp
│   │   ├── tier_policy.cpp
│   │   ├── field_ic.cpp
│   │   └── jit_economics.cpp
│   │
│   ├── tests/
│   │   ├── test_vm_execution_state.cpp
│   │   ├── test_tos_cache.cpp
│   │   ├── test_fixed_frame_arena.cpp
│   │   ├── test_superinstruction.cpp
│   │   ├── test_array_storage.cpp
│   │   ├── test_tier_policy.cpp
│   │   ├── test_field_ic.cpp
│   │   ├── test_cross_tier_differential.cpp
│   │   └── test_gate6_rebuild.cpp
│   │
│   └── bench/
│       ├── baseline/
│       ├── microbench/
│       ├── canonical/
│       ├── profiling/
│       ├── tiering/
│       ├── attribution/
│       └── manifests/
│
└── test_registry/
    ├── g6r_baseline_v1.json
    ├── g6r_phase1_profile.json
    ├── g6r_tos.json
    ├── g6r_callstack.json
    ├── g6r_fusion.json
    ├── g6r_flatarray.json
    ├── g6r_tiering.json
    ├── g6r_differential.json
    └── g6r_final_seal.json
```

---

# 25. Gate structure chính thức

## G6R.0 — Baseline Provenance

```text
benchmark identity
hardware
compiler
workload
manifest
reproducibility
```

Seal:

```text
G6R_BASELINE
```

---

## G6R.1 — Performance Forensics

```text
opcode
TOS
array
fusion
GC
JIT
```

Seal:

```text
G6R_PROFILE
```

---

## G6R.2 — Execution State

```text
VMExecutionState
TOS
CallFrame
exception
GC
handoff
```

Seal:

```text
G6R_EXECSTATE
```

---

## G6R.3 — Interpreter Core

```text
TOS
FixedFrame
Dispatch
Superinstruction
```

Seal:

```text
G6R_INTERP
```

---

## G6R.4 — Data Layout

```text
FlatArray
Typed locals
Field IC
```

Seal:

```text
G6R_DATA
```

---

## G6R.5 — Tier Economics

```text
Baseline JIT
OSR
Tier 2
ROI
Cooldown
Deopt
```

Seal:

```text
G6R_TIER
```

---

## G6R.6 — Cross-Tier Verification

```text
Interpreter
Baseline JIT
Optimizing JIT
AOT
```

Seal:

```text
G6R_DIFF
```

---

## G6R.7 — Performance Convergence

Tất cả workload:

```text
no unexplained regression
```

và đạt performance target.

Seal:

```text
G6R_FINAL
```

---

# 26. Acceptance Gate cuối

Không được chỉ kiểm:

```text
100% PASS
```

mà phải đạt đủ 5 trục:

```text
Correctness
Performance
Memory
Stability
Reproducibility
```

Final report:

```text
┌───────────────────────────────────────┐
│          G6R FINAL ACCEPTANCE         │
├───────────────────────────────────────┤
│ Semantic correctness      PASS        │
│ Differential equivalence  PASS        │
│ GC safety                 PASS        │
│ No regression > 5%        PASS        │
│ Canonical performance     PASS        │
│ Tier ROI                 PASS        │
│ Reproducibility          PASS        │
│ Cryptographic seal       PASS        │
└───────────────────────────────────────┘
```

---

# 27. Thứ tự code thực tế

Không triển khai tất cả cùng lúc.

Thứ tự phải là:

```text
G6R.0
   ↓
G6R.1 Profiling
   ↓
G6R.2 Execution State
   ↓
G6R.3 TOS + CallStack
   ↓
G6R.3 Fusion
   ↓
G6R.4 FlatArray
   ↓
G6R.4 FieldIC
   ↓
G6R.5 Tier Economics
   ↓
G6R.5 AutoTier
   ↓
G6R.6 Differential
   ↓
G6R.7 Performance Convergence
```

Không được làm:

```text
FlatArray
+
JIT
+
Fusion
+
FieldIC
```

trong một commit lớn rồi benchmark một lần.

---

# 28. Kết quả kỳ vọng của Rebuild

Mục tiêu đầu tiên không phải:

```text
"VM nhanh ngang C++"
```

Mà là:

```text
Tersun biết chính xác nó chậm ở đâu.
```

Sau đó:

```text
Interpreter
→ giảm dispatch overhead

Typed arrays
→ giảm boxing

Field IC
→ giảm lookup

Fusion
→ giảm instruction count

TOS
→ giảm stack traffic

Tier Economics
→ giảm JIT waste

OSR
→ tăng tốc long-running loops

Optimizing JIT
→ giảm khoảng cách native
```

Đây là đường đi bền vững.

---

# 29. ĐỊNH HƯỚNG SAU GATE 6 REBUILD

Nếu G6R thành công, kiến trúc nên tiến tới:

```text
                    Tersun IR
                        │
                 Profile Guided
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
      Tier 0         Tier 1         Tier 2
   Interpreter    Baseline JIT   Optimizing JIT
          │             │             │
          └─────────────┼─────────────┘
                        │
                 Managed Runtime
                 ├── GC
                 ├── Deopt
                 ├── OSR
                 ├── IC
                 └── ABI
                        │
                      AOT
```

Khi đó Tersun sẽ không còn chỉ có:

```text
"một VM được tối ưu"
```

mà có:

> **một execution engine có khả năng tự quan sát, tự quyết định tier, chuyên biệt hóa data layout và điều chỉnh compilation theo economics thực tế.**

Đó mới là mục tiêu thực sự của Gate 6.
