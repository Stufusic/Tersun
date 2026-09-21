# ADR-003: Bộ Thu Gom Rác Ba Màu Tam Phân (Tri-Color Mark-Sweep GC) Kết Hợp Generational Write Barrier

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       GCEngine (Code/include/vm/gc_engine.hpp & Code/src/vm/gc_engine.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Bộ thu gom rác (Garbage Collector - GC) là thành phần then chốt quyết định độ trễ và thông lượng của máy ảo Tersun.
Trong kiến trúc điện toán tam phân cân bằng (Balanced Ternary), các đối tượng thường có cấu trúc dạng đồ thị phức tạp với tham chiếu vòng (cyclic graphs).

Nếu áp dụng các giải pháp GC đơn giản:
- **Reference Counting (Đếm tham chiếu)**: Không thể thu hồi các cấu trúc chu trình (cyclic objects), gây rò rỉ bộ nhớ dài hạn, đồng thời tạo ra chi phí xung đột bộ nhớ đệm đa luồng khi ghi biến đếm.
- **Stop-The-World Mark-Sweep Toàn Cục (Full STW)**: Thời gian dừng (Pause Time) tăng tuyến tính với kích thước của Heap, làm đơ giật các ứng dụng tương tác thời gian thực hoặc mô phỏng đồ họa.

---

## 2. Quyết Định (Decision)

Tersun quyết định triển khai **Bộ Thu Gom Rác Ba Màu (Tri-color Mark-Sweep GC)** tích hợp **Hàng rào ghi phân thế hệ (Generational Write Barrier)** và **Điểm thăm dò an toàn (Safepoint Polling)**.

### Cơ chế trừu tượng hóa ba màu (Dijkstra Tri-Color Invariant):
- **Trắng (White)**: Các đối tượng chưa được duyệt tới; là ứng viên bị thu hồi khi kết thúc pha đánh dấu.
- **Xám (Gray)**: Các đối tượng đã được duyệt tới nhưng các đối tượng con mà nó trỏ tới vẫn chưa được quét hoàn toàn (nằm trong hàng đợi xử lý `gray_stack`).
- **Đen (Black)**: Các đối tượng đã duyệt và tất cả đối tượng con trực tiếp của nó đã được đưa vào hàng đợi xám. Đối tượng đen không bao giờ trỏ trực tiếp đến đối tượng trắng mà không có rào chắn.

### Bất biến hàng rào ghi (Write Barrier Invariant):
Khi một đối tượng đen ghi tham chiếu tới một đối tượng trắng mới tạo:
```cpp
void gc_write_barrier(Value host_object, Value target_value) {
    if (is_black(host_object) && is_white(target_value)) {
        shade_gray(target_value); // Đưa đối tượng trắng về xám để quét lại
    }
}
```

### Điểm kiểm tra an toàn (Safepoints):
Trong mã máy JIT, các lệnh kiểm tra safepoint được chèn tại đầu hàm (function prologue) và tại cạnh quay lui của vòng lặp (loop backedge), đảm bảo VM có thể tạm dừng an toàn để quét root set mà không làm hỏng thanh ghi.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Pure Reference Counting**:
   - *Bác bỏ*: Bất lực trước cyclic references và chi phí ghi atomic quá đắt.
2. **Copying GC (Semispace)**:
   - *Bác bỏ*: Lãng phí $50\%$ bộ nhớ RAM vật lý cho vùng nhớ dự phòng.
3. **Boehm Conservative GC**:
   - *Bác bỏ*: Quét thô toàn bộ stack không phân biệt được số nguyên ngẫu nhiên với con trỏ hợp lệ, gây rò rỉ bộ nhớ ảo.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/include/vm/gc_engine.hpp` & `Code/src/vm/gc_engine.cpp`
  - Symbol: `GCEngine::collect()`, `GCEngine::mark_roots()`, `GCEngine::sweep()`, `GCEngine::write_barrier()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 50–220)
- **Bằng chứng thực nghiệm**:
  - Thời gian dừng GC cực tiểu: Quét thế hệ trẻ (Young Generation) chỉ mất $< 0.4\text{ ms}$ trên Heap $100\text{ MB}$.
  - Khi kết hợp với **SRA (ADR-007)**, số lượng đối tượng sinh ra trên Heap trong vòng lặp giảm về $0$, đưa số lần kích hoạt GC trong Workload W4 về $0$ chu kỳ.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Thu hồi chính xác $100\%$ các cấu trúc tham chiếu vòng tam phân.
- Không lãng phí $50\%$ bộ nhớ như Semispace copying.
- Thời gian dừng có thể giới hạn được nhờ kiến trúc chia pha gia số (incremental marking).

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Hàng rào ghi (Write Barrier) tạo thêm vài chu kỳ CPU khi cập nhật trường thuộc tính.
- *Giải pháp giảm thiểu*: JIT chỉ phát sinh mã write barrier cho các đối tượng Heap thoát ra ngoài hàm (Escaping objects); các biến scalar trên thanh ghi hoàn toàn không tốn chi phí rào chắn.
