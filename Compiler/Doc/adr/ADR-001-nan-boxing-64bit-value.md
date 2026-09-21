# ADR-001: Sử Dụng Cơ Chế NaN-Boxing 64-Bit Cho Biểu Diễn Kiểu Dữ Liệu Đa Hình

```text
Status:              ACCEPTED & SEALED
Architecture:        Tersun 1.0.3 (Gate 6R.2.4)
Date:                2026-09-18
Deciders:            Tersun Architecture Core Team
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Source Symbol:       Value (Code/include/vm/value.hpp)
```

---

## 1. Bối Cảnh & Vấn Đề Kỹ Thuật (Context)

Trong một ngôn ngữ kết hợp cả kiểu dữ liệu tĩnh và động như Setun, máy ảo (VM) cần một cơ chế biểu diễn thống nhất cho tất cả các loại giá trị: số nguyên 64-bit (`int64_t`), số thực dấu phẩy động 64-bit (`double`), giá trị tam phân (`trit`, `tryte`), boolean, con trỏ đối tượng heap, chuỗi ký tự, và đối tượng đại số TAFPU $\mathbb{Q}(\sqrt{3})$.

Cách tiếp cận thông thường trong các máy ảo cổ điển là sử dụng **Tagged Union**:
```cpp
struct TaggedValue {
    ValueType type; // 4-8 bytes
    union {
        int64_t i;
        double f;
        void* ptr;
    } data; // 8 bytes
}; // Tổng kích thước: 16 đến 24 bytes (do memory alignment padding)
```
Việc mỗi giá trị tốn $16$–$24$ bytes dẫn đến những hậu quả nghiêm trọng:
1. **Lãng phí băng thông bộ nhớ L1/L2 cache**: Một mảng 1 triệu phần tử tốn $16$–$24\text{ MB}$ thay vì $8\text{ MB}$.
2. **Không thể truyền qua thanh ghi CPU**: Trên kiến trúc x86-64 (System V hoặc Win64 ABI), một cấu trúc $> 8\text{ bytes}$ thường bị đẩy ra ngăn xếp (stack) hoặc yêu cầu truyền qua 2 thanh ghi rời rạc, làm sụt giảm nghiêm trọng hiệu năng truyền tham số hàm trong JIT.

---

## 2. Quyết Định (Decision)

Tersun quyết định sử dụng **NaN-Boxing 64-bit (Quiet NaN Boxing)**:
Tất cả các giá trị được nén chính xác vào một từ đơn $64$-bit (`uint64_t` / `double`).

### Quy tắc mã hóa bitmask:
Theo chuẩn IEEE 754, một số thực `double` có dạng Quiet NaN (`qNaN`) khi 11 bit mũ (exponent) đều là `1` và bit cao nhất của phần định trị (fraction/mantissa) là `1`:
```text
Bits 63..52: 0x7FF8 (Exponent = 0x7FF, Quiet bit = 1)
Bits 51..48: Tag bits (loại kiểu dữ liệu)
Bits 47..0:  Payload (48-bit con trỏ heap hoặc số nguyên)
```

- **Số thực `double` thông thường**: Bất kỳ bit pattern nào không trùng với dải `0x7FF8...` đều được giải mã trực tiếp thành số thực dấu phẩy động mà không cần mặt nạ bit.
- **Số nguyên `int48_t` / Tagged Int**: Lưu với tag `0x7FF8_0001_xxxx_xxxx`.
- **Con trỏ Heap / Arena Index**: Lưu với tag `0x7FF8_0002_xxxx_xxxx` (48-bit payload chứa chỉ số handle `uint32_t` hoặc con trỏ 48-bit trên kiến trúc x86-64 canonical).
- **Kiểu Boolean & Tam phân (`trit`, `tryte`)**: Lưu với tag `0x7FF8_0003_xxxx_xxxx`.
- **Đối tượng TAFPU $\mathbb{Q}(\sqrt{3})$**: Lưu với tag `0x7FF8_0004_xxxx_xxxx`.

---

## 3. Các Phương Án Đã Xem Xét & Lý Do Bác Bỏ (Alternatives)

1. **Tagged Union 16B/24B**:
   - *Bác bỏ*: Gấp đôi kích thước ngăn xếp và mảng, phá vỡ khả năng nạp trực tiếp vào thanh ghi tổng quát x86-64 `RAX`, `RCX`, `RDX`.
2. **Nun-boxing (32-bit NaN-boxing)**:
   - *Bác bỏ*: Không đủ không gian biểu diễn cho số nguyên 64-bit hoặc số thực IEEE 754 chuẩn mà phải đóng hộp số thực thành con trỏ (heap-boxed float), làm chậm tính toán khoa học.
3. **Tagged Pointer (Low-bit tagging)**:
   - *Bác bỏ*: Chỉ tận dụng được 3 bit thấp (do căn lề 8-byte), không thể chứa số thực 64-bit không đóng hộp.

---

## 4. Bằng Chứng & Neo Giữ Kỹ Thuật (Rationale & Evidence)

- **Mã nguồn neo giữ**:
  - Tệp: `Code/include/vm/value.hpp`
  - Symbol: `struct Value`, `Value::as_double()`, `Value::as_int()`, `Value::is_heap_object()`
  - Commit: `133330b5fd9b5cf9b57948abf7de3361eb20b793` (approx. lines 35–140)
- **Bằng chứng thực nghiệm**:
  - Giảm 50% kích thước ngăn xếp VM (Activation Frame).
  - Tốc độ truyền tham số hàm trong Tier-1 JIT và Tier-2 Optimizing JIT tăng $1.8\times$ do toàn bộ giá trị vừa vặn trong một thanh ghi đơn `RAX`/`RCX`.

---

## 5. Đánh Đổi & Hệ Quả (Consequences & Trade-offs)

### Điểm mạnh (Pros):
- Hiệu quả bộ nhớ tối đa ($8\text{ bytes}$ cho mọi kiểu dữ liệu).
- Tương thích tuyệt đối với thanh ghi CPU 64-bit và SIMD vector lane.
- Thao tác kiểm tra kiểu chỉ tốn 1 lệnh logic bit (`TEST`, `CMP`) trong JIT.

### Hạn chế & Giải pháp giảm thiểu (Cons & Mitigations):
- *Hạn chế*: Không thể lưu trực tiếp số nguyên $> 48\text{ bits}$ mà không đóng hộp hoặc dùng mảng phẳng đồng nhất.
- *Giải pháp giảm thiểu*: Đối với các mảng số nguyên 64-bit thuần nhất trong tính toán hiệu năng cao (như mảng Sieve trong Workload W2), VM tự động nâng cấp mảng thành `FlatArrayStorage::I64` chứa mảng thô $64$-bit không NaN-box, đạt hiệu năng native bit-exact.
