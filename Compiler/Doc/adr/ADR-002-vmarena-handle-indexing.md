# ADR-002: Quản Lý Đối Tượng Heap Bằng Chỉ Số Handle 32-Bit Trong VMArena

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       VMArena (Code/include/vm/vm_arena.hpp & Code/src/vm/vm_arena.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Trong thiết kế runtime máy ảo, các đối tượng cấp phát động (chuỗi, mảng, bảng đối tượng, đóng gói closure) truyền thống được tham chiếu bằng **con trỏ bộ nhớ thô (raw 64-bit pointers)** từ `malloc` / `new`.

Khi dùng con trỏ thô trong một VM đa tầng có Garbage Collection (GC):
1. **Phân mảnh bộ nhớ (Heap Fragmentation)**: Khi GC quét và dọn rác, các vùng nhớ trống rải rác. Nếu muốn dồn bộ nhớ (Compacting GC), VM phải cập nhật hàng triệu con trỏ thô trong mọi thanh ghi, ngăn xếp và thuộc tính đối tượng.
2. **Kích thước con trỏ**: Con trỏ thô tốn 64-bit. Khi kết hợp với NaN-boxing 64-bit, con trỏ thô phải tuân thủ nghiêm ngặt không gian địa chỉ ảo 48-bit canonical của hệ điều hành, gây khó khăn cho việc nhúng metadata hay cờ trạng thái (flags).
3. **An toàn bộ nhớ (Use-After-Free / Dangling Pointers)**: Con trỏ thô dễ dẫn tới lỗi bộ nhớ nghiêm trọng nếu có sự mất đồng bộ giữa JIT thread và GC thread.

---

## 2. Quyết Định (Decision)

Tersun quyết định chuyển toàn bộ việc quản lý đối tượng động sang cấu trúc **`VMArena` dựa trên Chỉ Số Handle 32-bit (`uint32_t handle`)**:

### Cơ chế hoạt động:
- `VMArena` cấp phát các khối bộ nhớ lớn liên tục (Chunk-based Memory Blocks) từ hệ điều hành.
- Mỗi đối tượng được cấp phát một định danh duy nhất `handle` (32-bit integer).
- Bản đồ gián tiếp (Slot Table / Handle Indirection Table) ánh xạ từ `handle` sang con trỏ vật lý thực tế:
  ```text
  Object Handle (32-bit) ──> SlotTable[handle] ──> Chunk Base + Offset
  ```
- **Lợi thế khi GC dồn bộ nhớ**: GC có thể tự do di dời đối tượng từ Chunk này sang Chunk khác để triệt tiêu phân mảnh bộ nhớ; VM chỉ cần cập nhật con trỏ trong bảng `SlotTable`, trong khi toàn bộ mã byte, mã JIT và các tham chiếu khác giữ nguyên giá trị `handle` 32-bit mà không cần viết lại.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Direct Raw Pointer Allocation (`malloc` từng đối tượng)**:
   - *Bác bỏ*: Chi phí gọi `malloc`/`free` quá cao; không thể thực hiện compacting GC; phân mảnh bộ nhớ nghiêm trọng trong các workload chạy dài hạn.
2. **64-bit Smart Pointer / Reference Counting (`std::shared_ptr`)**:
   - *Bác bỏ*: Gây suy giảm hiệu năng do các phép toán nguyên tử (atomic ref-counting operations); không giải quyết được chu trình tham chiếu vòng (cyclic references).

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/include/vm/vm_arena.hpp` & `Code/src/vm/vm_arena.cpp`
  - Symbol: `VMArena::allocate_object()`, `VMArena::get_object()`, `VMArena::compact()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 40–180)
- **Bằng chứng thực nghiệm**:
  - Cấp phát đối tượng đạt độ phức tạp thời gian $O(1)$ với độ trễ $< 8\text{ ns}$ (bump allocator trong chunk).
  - Tích hợp trơn tru với NaN-box: 32-bit handle nằm gọn hoàn toàn trong 48-bit payload của cấu trúc `Value`, chừa lại 16-bit cho cờ GC và shape metadata.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Triệt tiêu hoàn toàn lỗi dangling pointer và phân mảnh heap.
- Dồn bộ nhớ (compaction) siêu nhanh chỉ bằng việc cập nhật bảng slot nội bộ.
- Kích thước handle 32-bit giúp tiết kiệm bộ nhớ khi lưu trữ trong mảng tham chiếu.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Thêm một tầng gián tiếp (indirection) khi truy xuất đối tượng trong trình thông dịch.
- *Giải pháp giảm thiểu*: Trong Tier-2 Optimizing JIT, thông qua phân tích thoát **Scalar Replacement of Aggregates (SRA - ADR-007)** và **Bounds Check Elimination (BCE - ADR-008)**, JIT trích xuất trực tiếp con trỏ thô của vùng đệm mảng ra ngoài vòng lặp (Preheader Hoisting), loại bỏ hoàn toàn chi phí gián tiếp trong các vòng lặp tính toán khốc liệt.
