# G6R.1 — POST-GATE-6 FORENSICS & WORKLOAD ROOT-CAUSE INVESTIGATION

## 0. Mục tiêu

G6R.1 không được phép là một đợt “benchmark thêm vài lần”.

Nó là một **quy trình điều tra hiệu năng có khả năng tái lập**, nhằm xác định nguyên nhân khiến VM/JIT của Tersun còn cách xa AOT trên bốn workload chuẩn:

```text
W1 Fibonacci
W2 Sieve
W3 Matmul
W4 Object
```

Mục tiêu đầu ra:

```text
Gate 6.0
   │
   ├── Frozen baseline
   │
   ▼
G6R.1 Forensics
   │
   ├── Execution profile
   ├── Tier profile
   ├── Memory/GC profile
   ├── Specialization profile
   ├── Dispatch profile
   └── Workload root cause
   │
   ▼
Root-Cause Map
   │
   ├── confirmed
   ├── probable
   ├── inconclusive
   └── rejected
   │
   ▼
G6R implementation priorities
```

### Nguyên tắc bắt buộc

1. **Không sửa code runtime trong giai đoạn thu thập baseline.**
2. **Không thay đổi benchmark giữa các mode.**
3. **Không kết luận nguyên nhân chỉ từ wall-clock.**
4. **Mọi kết luận phải có counter/telemetry hỗ trợ.**
5. **Mỗi workload phải được điều tra độc lập trước khi rút ra kết luận chung.**
6. **Không tối ưu JIT trước khi biết startup/JIT/dispatch/GC đang chiếm bao nhiêu thời gian.**
7. **Không dùng một run đơn lẻ để kết luận regression.**

---

# 1. Cấu trúc thư mục Forensics

Tạo cấu trúc riêng, không trộn với Gate 6 historical artifacts:

```text
Docs/
└── g6r/
    ├── forensics_plan.md
    ├── methodology.md
    ├── telemetry_schema.md
    ├── workload_profiles.md
    ├── root_cause_matrix.md
    ├── findings.md
    └── decision_log.md

tools/
└── forensics/
    ├── run_baseline.*
    ├── run_matrix.*
    ├── collect_telemetry.*
    ├── normalize_results.*
    ├── compare_modes.*
    ├── classify_root_causes.*
    └── generate_report.*

benchmarks/
└── forensics/
    ├── manifests/
    │   └── g6r1_manifest.json
    ├── inputs/
    │   ├── w1_fibonacci.*
    │   ├── w2_sieve.*
    │   ├── w3_matmul.*
    │   └── w4_object.*
    ├── raw/
    ├── normalized/
    ├── reports/
    └── artifacts/

build/
└── g6r1/
    ├── gate6_frozen/
    └── working/
```

`*.sh`, `*.ps1`, `*.py` hay extension cụ thể phụ thuộc toolchain hiện tại của repo.

---

# 2. G6R.1-A — FREEZE GATE 6

## 2.1. Mục đích

Gate 6 phải trở thành:

```text
Historical Reference
```

Không được để benchmark sau này vô tình sử dụng binary mới nhưng gọi đó là baseline Gate 6.

## 2.2. Ghi metadata

Tạo:

```text
benchmarks/forensics/manifests/g6r1_manifest.json
```

Chứa tối thiểu:

```json
{
  "gate": "6.0",
  "forensics": "G6R.1",
  "commit": "...",
  "build_id": "...",
  "compiler": "...",
  "platform": "Windows",
  "cpu": "...",
  "ram_gb": 0,
  "gpu": "...",
  "os": "...",
  "workloads": [
    "W1",
    "W2",
    "W3",
    "W4"
  ]
}
```

Bổ sung:

```text
binary SHA256
runtime version
JIT version
AOT version
optimization flags
environment variables
benchmark input checksum
```

## 2.3. Artifact phải bất biến

Lưu riêng:

```text
Gate6 VM binary
Gate6 JIT binary
Gate6 AOT binary
benchmark runner
benchmark manifest
```

Tính:

```text
SHA256
```

cho tất cả binary thực thi.

## 2.4. Gate

Không được sang bước tiếp theo nếu chưa có:

```text
[PASS] source commit recorded
[PASS] binary hash recorded
[PASS] machine recorded
[PASS] benchmark input checksum recorded
[PASS] runner version recorded
[PASS] historical numbers reproducible within tolerance
```

---

# 3. G6R.1-B — XÂY TELEMETRY CORE

Đây là phần quan trọng nhất.

Runtime phải có một chế độ:

```text
--forensics
```

hoặc tương đương.

Forensics mode không được làm thay đổi semantics.

---

# 4. Telemetry phải chia thành 8 nhóm

## 4.1. Wall-clock

Thu:

```text
total_time_ns
startup_time_ns
program_time_ns
shutdown_time_ns
```

Tách được:

```text
startup
execution
teardown
```

Không được chỉ ghi:

```text
total = 120 ms
```

mà không biết 70 ms đến từ đâu.

---

# 5. Tier/JIT telemetry

Phải có:

```text
jit_compile_count
jit_compile_time_ns
jit_compile_time_total_ns

baseline_compile_count
baseline_compile_time_ns

optimizing_compile_count
optimizing_compile_time_ns

osr_count
osr_compile_count
osr_compile_time_ns

deopt_count
deopt_time_ns

tier0_execution_ns
tier1_execution_ns
tier2_execution_ns
```

Nếu kiến trúc tier khác tên thì map về semantic tương đương.

## Quan trọng

Phải phân biệt:

```text
compile requested
compile completed
compiled code entered
compiled code executed
```

Ví dụ:

```text
compile = 4.8 ms
generated code executed = 0.4 ms
```

thì JIT economics có vấn đề hoàn toàn khác:

```text
compile = 1.2 ms
generated code executed = 100 ms
```

---

# 6. Dispatch telemetry

Thu:

```text
total_opcode_dispatch
opcode_counts[opcode]
dispatch_loop_iterations
indirect_dispatch_count
direct_dispatch_count
superinstruction_count
```

Nếu có:

```text
computed goto
switch
threaded dispatch
direct-threaded
```

thì ghi riêng.

Mục đích:

```text
Có bao nhiêu instruction?
Một instruction tốn bao nhiêu thời gian?
```

---

# 7. Stack / ExecutionState telemetry

Thu:

```text
push_count
pop_count
dup_count
swap_count

tos_hit
tos_miss

stack_spill_count
stack_reload_count

execution_state_loads
execution_state_stores
```

Nếu VM có canonical execution state mới, ghi thêm:

```text
state_transition_count
state_sync_count
state_sync_bytes
```

Đây là nhóm counter dùng để kiểm tra giả thuyết:

> VM chậm không phải vì opcode logic, mà vì overhead quản lý execution state.

---

# 8. Call/Frame telemetry

Đặc biệt quan trọng cho W1.

Thu:

```text
call_count
return_count

function_frame_create
function_frame_destroy

recursive_call_count

native_call_count
managed_call_count

frame_alloc_count
frame_reuse_count
```

Nếu có inline cache hoặc call specialization:

```text
monomorphic_call
polymorphic_call
megamorphic_call
```

---

# 9. Array telemetry

Cho W2:

```text
generic_array_load
generic_array_store

typed_i32_load
typed_i32_store
typed_i64_load
typed_i64_store
typed_f64_load
typed_f64_store

bounds_check_count
bounds_check_elided

boxing_count
unboxing_count

array_representation_transition
```

Đặc biệt:

```text
generic_access_ratio
typed_access_ratio
```

---

# 10. Fusion telemetry

Cho W3:

```text
fusion_candidate_count
fusion_success_count
fusion_rejected_count

fused_opcode_execution_count

normal_load_count
normal_store_count
normal_add_count
normal_mul_count
normal_branch_count
```

Phải biết:

```text
IR có cơ hội fusion
→ bytecode có fusion
→ runtime thực sự execute fused opcode
```

Ba giai đoạn này phải đo riêng.

---

# 11. Object / Shape / Field IC telemetry

Cho W4:

```text
object_alloc_count

field_load_count
field_store_count

field_ic_hit
field_ic_miss

shape_transition_count

monomorphic_ic
polymorphic_ic
megamorphic_ic

generic_property_lookup
specialized_property_lookup

property_guard_fail
shape_guard_fail
```

Tính:

```text
IC hit rate
```

và:

```text
generic property lookup ratio
```

---

# 12. GC telemetry

Thu:

```text
alloc_count
allocated_bytes

minor_gc_count
minor_gc_time_ns

major_gc_count
major_gc_time_ns

gc_pause_total_ns

promoted_bytes
survived_bytes

heap_peak_bytes
heap_end_bytes
```

Tính:

```text
gc_fraction =
gc_time / total_execution_time
```

---

# 13. G6R.1-C — CHUẨN HÓA BENCHMARK

Không được chạy kiểu:

```text
run W1
run W2
run W3
run W4
```

rồi lấy số bất kỳ.

## 13.1. Mỗi workload có 3 pha

```text
Phase A — cold
Phase B — warmup
Phase C — measured
```

### Cold

Đo:

```text
process startup
VM initialization
module loading
JIT initialization
runtime initialization
```

### Warmup

Mục đích:

```text
đưa runtime vào trạng thái ổn định
```

Không dùng số warmup cho kết quả cuối.

### Measured

Chạy nhiều lần độc lập.

Khuyến nghị:

```text
3–5 warmup runs
20 measured runs
```

Các workload cực nhẹ có thể tăng lên 30 runs.

---

# 14. G6R.1-D — MA TRẬN CHẠY BẮT BUỘC

Mỗi W1–W4 chạy toàn bộ:

```text
M0 = interpreter
M1 = optimized interpreter
M2 = baseline JIT
M3 = auto-tier/JIT
M4 = AOT
```

Nếu runtime hiện tại có mode khác, map lại đúng semantic.

---

# 15. Không trộn cold và warm

Mỗi workload phải sinh ít nhất:

```text
W3-M0-cold
W3-M0-warm
W3-M1-cold
W3-M1-warm
W3-M2-cold
W3-M2-warm
W3-M3-cold
W3-M3-warm
W3-M4
```

Tương tự W1/W2/W4.

---

# 16. G6R.1-E — THU 2 LOẠI KẾT QUẢ

## Dataset 1 — Summary

Ví dụ:

```text
workload
mode
run_id
startup_ms
compile_ms
execution_ms
gc_ms
total_ms
```

## Dataset 2 — Forensic counters

Ví dụ:

```text
opcode_dispatch
calls
returns
tos_hit
tos_miss
array_generic_load
array_typed_load
fusion_candidate
fusion_execute
ic_hit
ic_miss
gc_count
gc_time
...
```

Không gộp tất cả thành một bảng khổng lồ khó phân tích.

---

# 17. G6R.1-F — THỰC HIỆN BASELINE MATRIX

Thứ tự chạy:

```text
W1
 ├── M0
 ├── M1
 ├── M2
 ├── M3
 └── M4

W2
 ├── M0
 ├── M1
 ├── M2
 ├── M3
 └── M4

W3
 ├── M0
 ├── M1
 ├── M2
 ├── M3
 └── M4

W4
 ├── M0
 ├── M1
 ├── M2
 ├── M3
 └── M4
```

Tổng tối thiểu:

```text
4 workloads × 5 modes × 20 measured runs
= 400 measured runs
```

Chưa tính warmup.

---

# 18. G6R.1-G — KIỂM TRA ĐỘ ỔN ĐỊNH

Với mỗi dataset tính:

```text
median
min
max
mean
standard deviation
coefficient of variation
p95
```

Đặc biệt dùng:

```text
median
p95
```

làm hai mốc chính.

## Cảnh báo

Nếu cùng mode có:

```text
run1 = 25 ms
run2 = 31 ms
run3 = 29 ms
run4 = 80 ms
```

không được vội kết luận runtime regression.

Kiểm tra:

```text
background process
GC
JIT compilation
OS scheduling
thermal throttling
CPU frequency
```

trước.

---

# 19. G6R.1-H — PHÂN RÃ THỜI GIAN

Mỗi run phải cố gắng biểu diễn:

```text
Total
│
├── Startup
├── JIT compile
├── Program execution
│   ├── VM dispatch
│   ├── GC
│   ├── calls
│   ├── memory access
│   └── other runtime
└── shutdown
```

Mục tiêu là tạo bảng:

| Workload | Mode | Total | Startup | JIT |  GC | Exec |
| -------- | ---: | ----: | ------: | --: | --: | ---: |
| W1       |   M0 |   ... |     ... |   0 | ... |  ... |
| W1       |   M2 |   ... |     ... | ... | ... |  ... |
| W3       |   M3 |   ... |     ... | ... | ... |  ... |

Đây là bảng điều tra đầu tiên phải có.

---

# 20. G6R.1-I — ROOT-CAUSE CLASSIFICATION

Mỗi workload được phân loại theo các nhóm:

```text
R1 = Dispatch bound
R2 = Stack/ExecutionState bound
R3 = Call/Frame bound
R4 = Memory/Array representation bound
R5 = Fusion failure
R6 = Object/IC bound
R7 = GC/allocation bound
R8 = JIT compilation economics
R9 = Tiering/OSR failure
R10 = Benchmark/startup dominated
```

Một workload có thể có nhiều root cause.

Nhưng phải có:

```text
Primary cause
Secondary cause
```

---

# 21. Heuristic chẩn đoán

Các ngưỡng sau chỉ là **heuristic để điều tra**, không phải tiêu chuẩn tuyệt đối.

## 21.1. Startup dominated

Nếu:

```text
startup / total > 20–30%
```

và warm execution thấp hơn đáng kể:

```text
cold >> warm
```

thì kiểm:

```text
runtime initialization
JIT initialization
module loading
```

---

## 21.2. JIT economics failure

Nếu:

```text
jit_compile_time / total_time
```

chiếm phần đáng kể nhưng tốc độ sau khi compile không bù được chi phí:

```text
warm VM ≈ interpreter
```

thì nghi ngờ:

```text
JIT trigger quá sớm
JIT compile quá nặng
hot function không đủ hot
OSR quá muộn/quá sớm
```

---

## 21.3. Dispatch bound

Nghi ngờ dispatch nếu:

```text
opcode count rất cao
```

nhưng mỗi opcode làm rất ít công việc.

Kiểm tra:

```text
opcode count
dispatch mechanism
superinstruction usage
TOS
ExecutionState
```

---

## 21.4. Stack bound

Nghi ngờ stack nếu:

```text
push/pop rất cao
TOS miss cao
spill/reload cao
```

đặc biệt khi opcode logic đơn giản.

---

## 21.5. Fusion failure

Nghi ngờ fusion pipeline nếu:

```text
fusion_candidate >> fusion_success
```

hoặc:

```text
fusion_success cao
nhưng fused_opcode_execution thấp
```

Điều này giúp phân biệt:

```text
compiler không sinh fusion
```

với:

```text
compiler sinh nhưng runtime không sử dụng
```

---

## 21.6. Array specialization failure

Nghi ngờ W2 nếu:

```text
generic_array_access_ratio cao
```

trong khi workload đáng lẽ chủ yếu thao tác integer array.

Kiểm:

```text
typed array adoption
bounds checks
boxing
representation transitions
```

---

## 21.7. Field IC failure

Nghi ngờ W4 nếu:

```text
IC miss cao
generic property lookup cao
shape transition cao
```

Đặc biệt:

```text
IC hit rate cao
```

nhưng vẫn rất chậm thì nguyên nhân có thể nằm sau IC:

```text
object layout
load/store implementation
GC
allocation
guard overhead
```

---

## 21.8. GC bound

Nghi ngờ GC nếu:

```text
GC time / execution time
```

chiếm phần đáng kể.

Nhưng phải phân biệt:

```text
GC chậm
```

với:

```text
workload tạo quá nhiều allocation
```

Hai lỗi này không giống nhau.

---

# 22. W1 — FIBONACCI FORENSICS

## Mục tiêu

W1 chủ yếu dùng để điều tra:

```text
CALL/RET
frame
recursion
dispatch
tiering
JIT economics
```

## Bước W1.1 — Chạy interpreter

Thu:

```text
call_count
recursive_call_count
frame_create
frame_destroy
return_count
opcode_count
```

Tính:

```text
calls / total_opcodes
calls / execution_ms
```

## Bước W1.2 — So sánh optimized interpreter

Kiểm:

```text
dispatch giảm?
push/pop giảm?
frame cost giảm?
```

Nếu:

```text
M1 ≈ M0
```

thì optimized interpreter không đánh đúng bottleneck.

## Bước W1.3 — Baseline JIT

Ghi:

```text
compile count
compile ms
compiled execution ms
```

Tính:

```text
JIT ROI =
(interpreter_exec - jit_exec) / compile_time
```

Không dùng ROI như score; chỉ dùng để quyết định JIT có bù nổi compile tax hay không.

## Bước W1.4 — Auto-tier

Kiểm:

```text
hotness threshold
tier promotion
OSR
deopt
```

Câu hỏi:

```text
Có compile đúng function hot không?
Có compile quá sớm không?
Có OSR không?
Có bị deopt liên tục không?
```

## Bước W1.5 — Root cause

W1 phải kết thúc bằng một câu như:

```text
PRIMARY:
Call/frame overhead

EVIDENCE:
recursive_call_count = ...
frame_create = ...
frame_cost dominates ...

SECONDARY:
JIT compilation tax

REJECTED:
GC
Array specialization
Object IC
```

Không được ghi:

```text
"W1 vẫn chậm vì VM."
```

Câu đó vô dụng về mặt engineering.

---

# 23. W2 — SIEVE FORENSICS

## Mục tiêu

Điều tra:

```text
array
integer arithmetic
bounds checking
typed representation
branch/loop overhead
```

## Bước W2.1 — Interpreter profile

Thu:

```text
load/store counts
typed load/store
generic load/store
bounds checks
branch count
integer arithmetic count
```

## Bước W2.2 — Tính array specialization ratio

```text
typed_access_ratio =
typed_access /
(total_array_access)
```

Nếu rất thấp:

```text
FlatArray chưa đi vào hot path
```

## Bước W2.3 — Kiểm boxing

Thu:

```text
box_count
unbox_count
```

Nếu sieve integer nhưng boxing cao:

```text
representation leak
```

là suspect rất mạnh.

## Bước W2.4 — Bounds check

Đo:

```text
bounds_check_count
bounds_check_elided
```

Tính:

```text
elimination_ratio
```

## Bước W2.5 — JIT comparison

So sánh:

```text
generic array access
      ↓
typed access
      ↓
bounds check elimination
      ↓
JIT runtime
```

## Root-cause candidates

```text
R4 Array representation
R1 Dispatch
R9 Tiering
```

Ưu tiên loại bỏ/khẳng định R4 trước.

---

# 24. W3 — MATMUL FORENSICS

## Đây là workload ưu tiên số 1

Khoảng cách VM ↔ AOT ở W3 lớn nhất.

Mục tiêu là phân biệt chính xác:

```text
loop overhead
dispatch
load/store
typed arithmetic
fusion
JIT
```

---

# 25. W3.1 — Opcode census

Thu toàn bộ histogram:

```text
LOAD
STORE
ADD
MUL
SUB
BRANCH
COMPARE
CALL
RETURN
INDEX
...
```

Top 20 opcode phải được xuất ra.

Ví dụ:

```text
Opcode       Count
LOAD         ...
STORE        ...
MUL          ...
ADD          ...
BRANCH       ...
```

---

# 26. W3.2 — Đo loop overhead

Ước tính:

```text
branch_count / arithmetic_count
```

Nếu branch/dispatch quá lớn:

```text
VM interpretation overhead
```

có khả năng lớn hơn arithmetic itself.

---

# 27. W3.3 — Fusion pipeline

Kiểm tra tuần tự:

```text
IR pattern
   ↓
fusion candidate
   ↓
fused bytecode generated
   ↓
fused opcode dispatched
   ↓
fused opcode executed
```

Mỗi tầng phải có counter.

Tạo bảng:

| Stage     | Count |
| --------- | ----: |
| Candidate |   ... |
| Accepted  |   ... |
| Emitted   |   ... |
| Executed  |   ... |

### Chẩn đoán

```text
Candidate thấp
→ pattern recognition problem

Candidate cao / emitted thấp
→ bytecode generation problem

Emitted cao / executed thấp
→ dispatch/runtime path problem

Executed cao nhưng vẫn chậm
→ fused opcode implementation problem
```

Đây là một trong những phép thử quan trọng nhất của toàn bộ G6R.1.

---

# 28. W3.4 — TOS/stack investigation

Kiểm:

```text
TOS hit rate
push/pop
stack spill
reload
```

Nếu arithmetic nhiều nhưng TOS miss cao:

```text
interpreter stack model
```

có thể là bottleneck.

---

# 29. W3.5 — Typed arithmetic

Kiểm:

```text
I32/I64/F32/F64 operations
generic numeric operations
boxing/unboxing
numeric promotion
```

Matmul phải cho thấy đường execution rất “thẳng”.

Nếu dữ liệu integer nhưng:

```text
generic numeric op
```

chiếm tỷ lệ cao:

```text
type specialization failure
```

là suspect chính.

---

# 30. W3.6 — Baseline JIT

So sánh:

```text
interpreter
optimized interpreter
baseline JIT
auto JIT
AOT
```

Tập trung vào:

```text
opcode dispatch elimination
typed arithmetic
loop execution
array access
```

Nếu JIT giảm dispatch mạnh nhưng tổng thời gian vẫn cao:

```text
memory access
runtime checks
or JIT code quality
```

là suspect tiếp theo.

---

# 31. W3.7 — Kết luận W3

W3 phải có một biểu đồ waterfall:

```text
AOT
 │
 ├── loop overhead
 ├── dispatch
 ├── array access
 ├── bounds checks
 ├── numeric generic path
 ├── JIT tax
 └── other
 │
 ▼
VM
```

Đích của W3 investigation:

```text
Không còn hơn 2–3 giả thuyết mơ hồ.
```

Phải thu hẹp thành:

```text
PRIMARY
SECONDARY
CONFIRMED/REJECTED
```

---

# 32. W4 — OBJECT FORENSICS

## Mục tiêu

Điều tra:

```text
allocation
shape
field access
IC
GC
```

---

# 33. W4.1 — Allocation census

Thu:

```text
objects_allocated
bytes_allocated
objects_survived
```

Tính:

```text
allocation_rate
```

---

# 34. W4.2 — Field access

Thu:

```text
field_load
field_store
```

và:

```text
IC hit
IC miss
generic lookup
```

Tính:

```text
IC hit rate
generic lookup ratio
```

---

# 35. W4.3 — Shape analysis

Thu:

```text
shape_create
shape_transition
shape_guard_fail
```

Nếu object đơn giản nhưng shape transition quá lớn:

```text
object representation instability
```

là suspect.

---

# 36. W4.4 — GC correlation

Đặt:

```text
allocation timeline
GC timeline
execution timeline
```

cạnh nhau.

Mục tiêu:

```text
allocation spike
       ↓
GC spike
       ↓
latency spike
```

Nếu correlation rõ:

```text
GC/allocation
```

là suspect thật.

---

# 37. W4.5 — Field IC isolation

So sánh:

```text
IC enabled
IC disabled
```

chỉ khi runtime có khả năng bật/tắt feature an toàn.

Đây là một **diagnostic experiment**, không phải benchmark release.

Nếu:

```text
IC ON << IC OFF
```

→ IC có hiệu quả.

Nếu:

```text
IC ON ≈ IC OFF
```

→ IC chưa đi vào hot path hoặc overhead guard quá lớn.

Nếu:

```text
IC ON > IC OFF
```

→ implementation có regression.

---

# 38. G6R.1-J — EXPERIMENT ISOLATION

Sau baseline, mới chạy các A/B diagnostic.

Không sửa nhiều thứ cùng lúc.

---

## Experiment E1 — Dispatch

```text
default dispatch
vs
optimized dispatch
```

Chỉ đo:

```text
dispatch
```

---

## Experiment E2 — TOS

```text
TOS enabled
vs
TOS disabled
```

Mục tiêu:

```text
đo stack optimization contribution
```

---

## Experiment E3 — Fusion

```text
fusion ON
vs
fusion OFF
```

Ưu tiên W3.

---

## Experiment E4 — FlatArray

```text
typed/flat representation ON
vs
generic representation
```

Ưu tiên W2.

---

## Experiment E5 — Field IC

```text
IC ON
vs
IC OFF
```

Ưu tiên W4.

---

## Experiment E6 — JIT

```text
JIT OFF
baseline JIT
auto tier
```

Đặc biệt dùng W1/W3.

---

## Experiment E7 — GC

Chỉ khi runtime hỗ trợ:

```text
normal GC
vs
diagnostic GC mode
```

Mục đích không phải để lấy benchmark đẹp.

Mục đích là:

```text
xác định GC có thực sự là causal factor hay không.
```

---

# 39. Quy tắc A/B

Mỗi experiment chỉ được thay đổi:

```text
ONE major subsystem
```

Ví dụ không được làm:

```text
TOS + fusion + IC + JIT threshold
```

rồi tuyên bố:

```text
"performance tăng 40%"
```

Kết quả đó không cho biết cái gì gây tăng.

---

# 40. G6R.1-K — ROOT-CAUSE TABLE

Tạo:

```text
Docs/g6r/root_cause_matrix.md
```

Mẫu:

| Workload | Suspect        | Evidence                    | Status             | Priority |
| -------- | -------------- | --------------------------- | ------------------ | -------- |
| W1       | Frame overhead | frame/call counters         | Confirmed          | P0       |
| W1       | JIT tax        | compile/runtime ratio       | Probable           | P1       |
| W2       | Generic array  | generic ratio high          | Confirmed          | P0       |
| W2       | Bounds checks  | elimination low             | Probable           | P1       |
| W3       | Dispatch       | opcode volume high          | Confirmed          | P0       |
| W3       | Fusion         | candidate/executed mismatch | Confirmed          | P0       |
| W4       | IC miss        | miss rate high              | Confirmed          | P0       |
| W4       | GC             | GC fraction                 | Rejected/Confirmed | P1       |

Các giá trị chỉ được điền sau khi chạy thực tế.

---

# 41. Trạng thái của hypothesis

Chỉ được dùng 4 trạng thái:

```text
CONFIRMED
PROBABLE
INCONCLUSIVE
REJECTED
```

Không dùng:

```text
maybe
probably something
looks slow
seems like VM issue
```

---

# 42. G6R.1-L — WORKLOAD DOSSIER

Mỗi workload phải có một file:

```text
benchmarks/forensics/reports/W1.md
benchmarks/forensics/reports/W2.md
benchmarks/forensics/reports/W3.md
benchmarks/forensics/reports/W4.md
```

Mỗi file phải có đúng cấu trúc:

```text
1. Workload definition
2. Expected behavior
3. Benchmark baseline
4. Cold results
5. Warm results
6. Opcode profile
7. Tier profile
8. Memory/GC profile
9. Specialization profile
10. A/B experiments
11. Suspects
12. Confirmed root cause
13. Rejected hypotheses
14. Recommended fix
15. Expected metric movement
```

---

# 43. W1 REPORT MẪU

```text
W1 Fibonacci

Observed:
VM = ...
AOT = ...

Call:
...
Frame:
...
Dispatch:
...
JIT:
...

Primary root cause:
...

Evidence:
...

Secondary:
...

Rejected:
...

Recommended G6R fix:
...

Expected telemetry after fix:
call overhead ↓
frame transitions ↓
JIT compile tax ↓
```

---

# 44. W2 REPORT MẪU

```text
W2 Sieve

Observed:
VM = ...
AOT = ...

Array:
generic = ...
typed = ...
bounds checks = ...
boxing = ...

Primary:
...

Secondary:
...

Recommended fix:
...
```

---

# 45. W3 REPORT MẪU

```text
W3 Matmul

Observed:
VM = ...
AOT = ...

Opcode count:
...

Fusion:
candidate = ...
accepted = ...
emitted = ...
executed = ...

TOS:
...

Typed arithmetic:
...

Primary root cause:
...

Secondary:
...

Recommended fix:
...
```

---

# 46. W4 REPORT MẪU

```text
W4 Object

Observed:
VM = ...
AOT = ...

Allocation:
...

Field access:
...

IC hit:
...
IC miss:
...

Shape:
...

GC:
...

Primary root cause:
...

Secondary:
...

Recommended fix:
...
```

---

# 47. G6R.1-M — TRIAGE ORDER

Sau khi 4 workload được điều tra, tạo bảng:

```text
Root cause
    ↓
Affected workloads
    ↓
Observed time contribution
    ↓
Confidence
    ↓
Implementation difficulty
```

Ví dụ:

```text
Dispatch
├── W1
├── W2
└── W3

Array specialization
└── W2

Fusion
└── W3

Field IC
└── W4

Frame/call
└── W1
```

Không chọn priority dựa vào “cảm giác”.

---

# 48. Ưu tiên theo 4 tiêu chí

Mỗi suspect đánh giá:

```text
Impact
Confidence
Scope
Risk
```

Không chấm điểm kiểu ranking benchmark.

Chỉ phân loại:

```text
P0 = cần xử lý trước vì ảnh hưởng trực tiếp đến root cause
P1 = ảnh hưởng đáng kể
P2 = tối ưu phụ
```

---

# 49. G6R.1-N — PERFORMANCE BUDGET

Sau khi root cause được xác nhận, tạo budget:

```text
W3 total VM gap = X ms

Dispatch contribution   = A ms
Memory contribution     = B ms
Fusion loss             = C ms
JIT tax                 = D ms
Other                   = E ms
```

Tổng:

```text
A+B+C+D+E ≈ X
```

Không bắt buộc chính xác tuyệt đối, nhưng phải có reconciliation.

Nếu:

```text
X = 200 ms
```

mà telemetry chỉ giải thích:

```text
50 ms
```

thì forensic process **chưa hoàn thành**.

---

# 50. G6R.1-O — VERIFY CAUSALITY

Một suspect chỉ được gọi là:

```text
CONFIRMED
```

khi có ít nhất một trong:

```text
A/B experiment
instrumented timing
counter correlation
controlled regression
```

Ví dụ:

```text
IC miss cao
```

chưa đủ để nói:

```text
IC là bottleneck.
```

Phải có bằng chứng thêm như:

```text
IC OFF → runtime tăng rõ
```

hoặc:

```text
miss handling chiếm phần thời gian lớn
```

---

# 51. G6R.1-P — ITERATION LOOP

Sau root cause lần đầu:

```text
Hypothesis
    ↓
Measurement
    ↓
Experiment
    ↓
Conclusion
    ↓
New hypothesis
```

Không:

```text
Hypothesis
    ↓
Code 3 tuần
    ↓
Benchmark
```

---

# 52. G6R.1-Q — STOP CONDITIONS

Forensics được coi là hoàn thành khi:

```text
[PASS] Gate 6 frozen
[PASS] all 4 workloads profiled
[PASS] all 5 modes profiled
[PASS] cold/warm separated
[PASS] JIT cost separated
[PASS] GC separated
[PASS] dispatch profile available
[PASS] workload-specific counters available
[PASS] top suspects identified
[PASS] primary root cause assigned
[PASS] rejected hypotheses documented
[PASS] A/B evidence collected for critical suspects
[PASS] performance budget reconciled
```

---

# 53. KHÔNG ĐƯỢC LÀM TRONG G6R.1

Không:

```text
❌ redesign JIT
❌ rewrite interpreter
❌ đổi GC algorithm
❌ đổi bytecode format
❌ thêm optimization speculative
❌ benchmark bằng workload mới rồi bỏ W1–W4
❌ chỉnh benchmark để VM trông nhanh hơn
❌ sửa cùng lúc nhiều subsystem
```

G6R.1 là:

```text
OBSERVE
MEASURE
ISOLATE
CLASSIFY
```

chưa phải:

```text
OPTIMIZE EVERYTHING
```

---

# 54. THỨ TỰ TRIỂN KHAI THỰC TẾ

## Phase 1 — Instrumentation

Làm trước:

```text
P1.1 Telemetry infrastructure
P1.2 Runtime timer
P1.3 JIT counters
P1.4 Dispatch counters
P1.5 Stack counters
P1.6 Array counters
P1.7 Fusion counters
P1.8 Object/IC counters
P1.9 GC counters
```

Không tối ưu runtime trong phase này.

---

## Phase 2 — Runner

Tạo:

```text
run_forensics
```

Có khả năng:

```text
select workload
select mode
select cold/warm
select repetitions
output JSON
output CSV
```

Ví dụ interface mong muốn:

```text
forensics run --workload W3 --mode interp
forensics run --workload W3 --mode jit
forensics run --workload W3 --mode aot
```

---

## Phase 3 — Baseline

Chạy toàn bộ:

```text
W1 × M0..M4
W2 × M0..M4
W3 × M0..M4
W4 × M0..M4
```

Không chỉnh runtime.

---

## Phase 4 — Analysis

Tạo:

```text
summary.csv
opcode_histogram.csv
jit_profile.csv
gc_profile.csv
array_profile.csv
object_profile.csv
fusion_profile.csv
```

---

## Phase 5 — Workload investigation

Thứ tự:

```text
W3
↓
W4
↓
W1
↓
W2
```

### Vì sao?

W3:

```text
VM/AOT gap lớn
```

nên dễ cho thấy execution-engine overhead.

W4:

```text
object + IC + allocation
```

bao phủ runtime object subsystem.

W1:

```text
call/frame/tiering
```

đánh vào function execution.

W2:

```text
typed array
```

kiểm chứng data specialization.

---

# 55. Phase 6 — Causal experiments

Sau khi có suspect:

```text
W3 → fusion / dispatch / typed arithmetic
W4 → IC / shape / allocation
W1 → frame / call / tiering
W2 → array / bounds / boxing
```

Thực hiện A/B isolation.

---

# 56. Phase 7 — Root-cause seal

Tạo:

```text
Docs/g6r/findings.md
```

với format:

```text
ROOT CAUSE #1
Subsystem:
Workloads:
Evidence:
Confidence:
Measured impact:
A/B result:
Recommended action:

ROOT CAUSE #2
...
```

---

# 57. ĐẦU RA CUỐI CÙNG

G6R.1 phải tạo ra đúng 5 artifact chính:

```text
1. Frozen Gate 6 baseline
2. Raw telemetry dataset
3. Normalized benchmark dataset
4. W1–W4 forensic reports
5. Root-cause map
```

Và một artifact chiến lược:

```text
G6R.2 implementation priorities
```

Trong đó không viết:

```text
"hãy tối ưu VM"
```

mà phải viết kiểu:

```text
W3:
Confirmed dispatch overhead
+
fusion execution mismatch

Action:
investigate bytecode fusion emission/execution path

Expected measurable changes:
dispatch_count ↓
fused_opcode_execution ↑
execution_ms ↓
```

---

# 58. KẾT QUẢ MONG MUỐN

Trước G6R.1:

```text
W3 chậm.
Có thể do VM.
```

Sau G6R.1:

```text
W3

Primary:
dispatch overhead

Secondary:
fusion utilization failure

Evidence:
opcode dispatch = ...
fusion candidates = ...
fusion emitted = ...
fusion executed = ...
TOS miss = ...
GC = ...

Conclusion:
GC rejected.
Object IC irrelevant.
Main issue concentrated in dispatch/fusion path.
```

Đó mới là một forensic report có giá trị để bước sang engineering.

---

# 59. TÓM TẮT PIPELINE

```text
                GATE 6 FROZEN
                      │
                      ▼
              ┌───────────────┐
              │ Telemetry     │
              │ Instrument    │
              └───────┬───────┘
                      │
                      ▼
              ┌───────────────┐
              │ Baseline      │
              │ Matrix        │
              └───────┬───────┘
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
       W1            W2            W3/W4
        │             │             │
        └─────────────┼─────────────┘
                      ▼
              ┌───────────────┐
              │ Time Decompose│
              └───────┬───────┘
                      ▼
              ┌───────────────┐
              │ Suspect Map   │
              └───────┬───────┘
                      ▼
              ┌───────────────┐
              │ A/B Isolation │
              └───────┬───────┘
                      ▼
              ┌───────────────┐
              │ Causal Proof  │
              └───────┬───────┘
                      ▼
              ┌───────────────┐
              │ Root-Cause    │
              │ Seal          │
              └───────┬───────┘
                      ▼
                  G6R.2
          Implementation Priorities
```

# 60. THỨ TỰ THỰC THI NGAY

```text
DAY 1-equivalent:
Freeze Gate 6
→ manifest
→ SHA256
→ machine metadata

PHASE A:
Build --forensics
→ telemetry core
→ JSON output

PHASE B:
Implement runner
→ cold/warm
→ repetitions
→ all 5 modes

PHASE C:
Collect:
W1 → W2 → W3 → W4

PHASE D:
Generate:
summary
opcode
JIT
GC
array
fusion
object/IC

PHASE E:
Investigate:
W3 → W4 → W1 → W2

PHASE F:
Run A/B:
fusion
dispatch
TOS
FlatArray
IC
JIT

PHASE G:
Write root-cause reports

PHASE H:
Seal G6R.1

PHASE I:
Only now design G6R.2
```

## Definition of Done

G6R.1 chỉ hoàn thành khi Tersun có thể trả lời bằng số liệu cho cả bốn câu:

```text
W1: vì sao recursion/call VM chậm?
W2: vì sao array/integer path còn overhead?
W3: vì sao VM cách AOT rất xa?
W4: vì sao object/field execution còn chậm?
```

và quan trọng nhất:

```text
Mỗi câu trả lời
    ↓
có counter
    ↓
có experiment
    ↓
có causal evidence
    ↓
có implementation target cụ thể
```

Đây sẽ là **“bản đồ giải phẫu” của Gate 6**, chứ chưa phải bản tối ưu hóa. Khi bản đồ này hoàn chỉnh, Gate 6R có thể được triển khai theo đúng root cause thay vì tiếp tục tối ưu theo cảm giác.
