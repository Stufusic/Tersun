# ADR-007: Phân Tích Thoát & Thay Thế Vô Hướng Các Cấu Trúc Tổng Hợp (Scalar Replacement of Aggregates - SRA)

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4 / Sealed G6R.2.2)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       EscapeAnalyzer & MIROptimizer (Code/src/vm/escape_analysis.cpp & Code/src/vm/mir_optimizer.cpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Trong lập trình hướng đối tượng và tính toán khoa học, các cấu trúc dữ liệu nhỏ như điểm ảnh, tọa độ 3D (`Point3D {x, y, z}`), số phức (`Complex {re, im}`), hoặc vector tạm thời thường xuyên được khởi tạo bên trong các vòng lặp hàng triệu lần.

- Mỗi đối tượng được tạo ra trên heap thông qua `VMArena` đều tiêu tốn chi phí:
  1. Header đối tượng, trường shape ID, căn lề bộ nhớ.
  2. Ghi nhận vào không gian heap của GC.
  3. Kích hoạt bộ gom rác thường xuyên, làm gián đoạn luồng tính toán.
- Trong **Workload W4 (Vector Operations)** trước tối ưu, thời gian chạy lên tới $15.33\text{ ms}$ chỉ vì phải cấp phát hàng trăm ngàn đối tượng vector tạm thời trên heap.

---

## 2. Quyết Định (Decision)

Tersun quyết định triển khai thuật toán **Phân Tích Thoát (Escape Analysis)** với **Lưới Thoát 4 Mức (4-Level Escape Lattice)** kết hợp **Thay Thế Vô Hướng (Scalar Replacement of Aggregates - SRA)**:

### 1. Lưới phân tích thoát (Escape Lattice):
Mỗi đối tượng được phân loại vào một trong 4 mức độ:
- `NO_ESCAPE`: Đối tượng chỉ được sử dụng nội bộ trong hàm/vòng lặp hiện tại, không được trả về, không được gán vào biến toàn cục hoặc trường của đối tượng khác.
- `ARG_ESCAPE`: Đối tượng được truyền làm tham số sang một hàm khác nhưng không thoát ra ngoài hàm đó.
- `GLOBAL_ESCAPE`: Đối tượng được gán vào biến toàn cục hoặc trả về ngoài hàm.
- `UNKNOWN`: Chưa đủ thông tin phân tích.

### 2. Biến đổi SRA (Scalar Replacement):
Đối với tất cả các đối tượng được chứng minh là `NO_ESCAPE`:
1. **Triệt tiêu lệnh cấp phát Heap**: Xóa bỏ hoàn toàn lệnh `ALLOC_OBJECT` trong Machine IR (MIR).
2. **Phân rã thuộc tính thành biến thanh ghi**: Các trường `obj.x`, `obj.y`, `obj.z` được biến đổi thành các biến vô hướng ảo `v_reg_x`, `v_reg_y`, `v_reg_z`.
3. **Phối hợp với Linear Scan Allocator**: Các biến này sau đó được ánh xạ trực tiếp vào các thanh ghi CPU x86-64 vật lý (`R8`, `R9`, `R10`), triệt tiêu $100\%$ áp lực bộ nhớ và GC.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Stack Allocation (Alloca cho struct)**:
   - *Bác bỏ*: Vẫn tốn chi phí nạp/ghi stack trong bộ nhớ, không thể tận dụng trực tiếp thanh ghi CPU như SRA.
2. **Explicit User Flattening (Bắt lập trình viên tự tách biến)**:
   - *Bác bỏ*: Phá vỡ tính đóng gói và làm mã nguồn Setun trở nên xấu xí, khó bảo trì.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/src/vm/escape_analysis.cpp` & `Code/src/vm/mir_optimizer.cpp`
  - Symbol: `EscapeAnalyzer::run_sra()`, `EscapeAnalyzer::analyze_escape_status()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 90–260)
- **Bằng chứng thực nghiệm & Niêm phong mật mã**:
  - **Workload W4**: Thời gian thực thi giảm từ $15.33\text{ ms}$ xuống còn **$0.94\text{ ms}$** (nhanh gấp **$16.3\times$**).
  - Cấp phát heap trong vòng lặp: **$0\text{ bytes}$**.
  - Chu kỳ dừng GC: **$0$ lần**.
  - Niêm phong mật mã tại: `test_registry/g6r2/g6r2_2_sra.json`.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Biến trừu tượng hóa hướng đối tượng thành mã máy phẳng không tốn chi phí (Zero-Cost Abstractions).
- Tăng tốc đột biến các thuật toán hình học, đồ họa và đại số ma trận.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Nếu đối tượng có quá nhiều trường (ví dụ struct $> 16$ fields), việc phân rã có thể gây áp lực thanh ghi.
- *Giải pháp giảm thiểu*: SRA áp dụng ngưỡng giới hạn (Threshold $< 8$ fields); các đối tượng quá lớn sẽ được duy trì dưới dạng bộ đệm liên tục thay vì phân rã vô hướng hoàn toàn.
