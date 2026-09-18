# G6R.1 Telemetry Schema & Counter Definitions

Tài liệu này đặc tả chi tiết 8 nhóm counter vi mô được xuất ra thông qua cờ `--forensics-dump=<path.json>`.

---

## 1. Wall-Clock Telemetry (`wall_clock`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `total_time_ns` | uint64 | Toàn bộ thời gian sống của tiến trình từ khi bắt đầu đến khi kết thúc (ns). |
| `startup_time_ns` | uint64 | Thời gian đọc file, phân tích cú pháp, nạp bytecode và khởi tạo cấu trúc VM/JIT. |
| `program_time_ns` | uint64 | Thời gian thực thi phần thân chương trình bytecode hoặc mã máy (ns). |
| `shutdown_time_ns` | uint64 | Thời gian giải phóng heap, dọn dẹp bộ nhớ và đồng bộ telemetry (ns). |

---

## 2. Tier & JIT Telemetry (`tier_jit`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `invocation_count` | uint64 | Tổng số lần gọi hàm bytecode được JIT manager quan sát. |
| `backedge_count` | uint64 | Tổng số lần lặp nhánh ngược trong vòng lặp (vòng lặp hotness check). |
| `jit_compile_count` | uint64 | Số lần kích hoạt biên dịch JIT thành công. |
| `jit_compile_time_ns` | uint64 | Tổng thời gian tiêu tốn cho việc sinh mã máy JIT x86-64 (ns). |
| `baseline_compile_count` | uint64 | Số lần biên dịch Tier-1 Baseline JIT. |
| `optimizing_compile_count`| uint64 | Số lần biên dịch Tier-2 Optimizing JIT (với Type Feedback). |
| `osr_count` | uint64 | Số lần chuyển đổi trạng thái On-Stack Replacement tại loop header. |
| `deopt_count` | uint64 | Số lần giải tối ưu hóa (Deoptimization) từ mã JIT về lại Interpreter. |

---

## 3. Dispatch Telemetry (`dispatch`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `total_opcode_dispatch` | uint64 | Tổng số opcode được dispatch qua vòng lặp VM. |
| `dispatch_loop_iterations`| uint64 | Số chu kỳ lặp của bộ điều phối bytecode. |
| `superinstruction_count` | uint64 | Số opcode kết hợp / superinstruction được thực thi thành công. |
| `opcode_counts[op]` | map/array | Histogram chi tiết tần suất xuất hiện của từng opcode (0x00 .. 0xFF). |

---

## 4. Stack & ExecutionState Telemetry (`stack_execution_state`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `push_count` / `pop_count` | uint64 | Tần suất đẩy và rút giá trị trên ngăn xếp toán hạng. |
| `tos0_hits` / `tos1_hits` | uint64 | Số lần truy cập trúng bộ nhớ đệm đỉnh ngăn xếp (TOS Cache). |
| `tos_miss` | uint64 | Số lần trượt cache TOS, phải đọc bộ nhớ mảng operand stack. |
| `tos_hit_rate` | double | Tỷ lệ trúng đệm đỉnh ngăn xếp: $\frac{\text{tos0} + \text{tos1}}{\text{total}}$. |
| `stack_spill_count` | uint64 | Số lần phải xả đệm TOS xuống bộ nhớ vật lý. |

---

## 5. Call & Frame Telemetry (`call_frame`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `call_count` / `return_count` | uint64 | Số lần gọi và trả về của hàm. |
| `function_frame_create` | uint64 | Số lượng frame ngăn xếp được cấp phát cho lời gọi hàm. |
| `function_frame_destroy` | uint64 | Số lượng frame ngăn xếp được hủy khi trả về. |
| `recursive_call_count` | uint64 | Số lời gọi đệ quy (hàm tự gọi chính nó). |

---

## 6. Array Telemetry (`array`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `generic_array_load/store` | uint64 | Số lần đọc/ghi mảng đa hình chậm (Generic Boxed VMValue). |
| `typed_i64_load/store` | uint64 | Số lần đọc/ghi mảng nguyên thuần phẳng (FlatArray I64 trực tiếp). |
| `typed_access_ratio` | double | Tỷ lệ mảng phẳng hóa: $\frac{\text{typed}}{\text{typed} + \text{generic}}$. |
| `bounds_check_count` | uint64 | Số lần kiểm tra biên an toàn mảng. |
| `bounds_check_elided` | uint64 | Số lần triệt tiêu kiểm tra biên thành công qua phân tích tĩnh. |

---

## 7. Fusion Telemetry (`fusion`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `candidate_patterns` | uint64 | Số cặp/chuỗi bytecode có tiềm năng kết hợp thành siêu lệnh. |
| `fused_count` | uint64 | Số siêu lệnh thực tế được phát sinh vào bytecode binary. |
| `fused_opcode_execution_count`| uint64 | Số siêu lệnh thực tế được runtime gọi trong quá trình chạy. |
| `rejected_count` | uint64 | Số mẫu bị từ chối do semantic barrier hoặc nhãn jump target. |

---

## 8. Object / Field IC & GC Telemetry (`object_ic_gc`)

| Counter / Metric | Kiểu Dữ liệu | Ý nghĩa Kỹ thuật |
| :--- | :--- | :--- |
| `object_alloc_count` | uint64 | Số đối tượng và cấu trúc được cấp phát trên heap. |
| `field_load/store_count` | uint64 | Tổng số thao tác truy cập trường thuộc tính đối tượng. |
| `field_ic_hit` / `field_ic_miss`| uint64 | Số lần trúng / trượt Inline Cache khi truy cập trường. |
| `ic_hit_rate` | double | Tỷ lệ trúng Inline Cache: $\frac{\text{ic\_hit}}{\text{ic\_hit} + \text{ic\_miss}}$. |
| `shape_transition_count` | uint64 | Số lần biến đổi khuôn hình đối tượng (Shape Transition). |
| `gc_pause_total_ns` | uint64 | Tổng thời gian dừng của bộ thu gom rác Garbage Collector. |
| `gc_fraction` | double | Tỷ trọng thời gian GC chiếm trên tổng thời gian chạy. |
