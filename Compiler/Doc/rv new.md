Tôi đánh giá **kế hoạch này tốt về engineering, nhưng chưa tối ưu về khoa học**. tôi sẽ sửa vài điểm quan trọng trước khi cho AI bắt đầu code.

### Đánh giá tổng thể

| Mặt                         |           Đánh giá |
| --------------------------- | -----------------: |
| Tính khả thi triển khai     |           **9/10** |
| Kiến trúc                   |         **8.5/10** |
| Khả năng kiểm chứng         |           **8/10** |
| Giá trị NCKH hiện tại       |           **7/10** |
| Sau khi bổ sung methodology |           **9/10** |
| Rủi ro implementation       | **Trung bình–cao** |

Điểm tôi thích nhất là ông đã không viết kiểu “sửa VM cho nhanh hơn”, mà đã có **Phase → file → thay đổi → test → benchmark → tiêu chí thành công**. Đây là tư duy rất tốt.


---

# 1. Phase 1 là phần mạnh nhất, nhưng mục tiêu “3–5×” đang hơi tùy ý

Ông đang đặt:

> Direct Threaded Dispatch + Register Caching → tăng 3–5×.

Con số này nên đổi thành **hypothesis cần kiểm chứng**, không nên biến thành mục tiêu định sẵn.

Ví dụ:

> **H1:** Direct-threaded dispatch làm giảm thời gian thực thi của các workload thiên về dispatch so với switch/function-pointer dispatch.

Sau đó mới đo:

```text
Baseline:
function-pointer dispatch

Variant A:
switch dispatch

Variant B:
direct-threaded dispatch

Variant C:
direct-threaded + cached ip/sp
```

Rồi đo riêng:

```text
NOP
ADD
LOAD_LOCAL
STORE_LOCAL
BRANCH
CALL
RECURSION
```

Như vậy ông sẽ biết:

> Direct threading đem lại +X%
> register caching thêm +Y%
> inline opcode thêm +Z%

**Đây mới là ablation study.**

Và nếu cuối cùng chỉ tăng 1.8× thay vì 5× thì nghiên cứu vẫn thành công. Vì hypothesis được kiểm chứng chứ không phải “đạt KPI”.

---

# 2. Có một điểm tôi muốn sửa rất mạnh: `try-catch` quanh opcode

Kế hoạch nói:

> chuyển `try-catch` ra ngoài vòng lặp để loại bỏ chi phí unwind frame từng opcode.

Câu này **không nên viết như kết luận đã biết**.

Trong C++, chi phí của `try/catch` khi **không xảy ra exception** không đơn giản là “mỗi opcode đều tạo unwind frame”. Cái cần đo là codegen thực tế của compiler.

Quan trọng hơn: nếu VM có semantic exception, chuyển catch ra ngoài loop có thể làm thay đổi cách VM xử lý lỗi.

Tôi sẽ đổi thành:

```text
Baseline:
per-dispatch exception boundary

Experiment:
chunk-level exception boundary

Measure:
- normal execution overhead
- exception execution cost
- semantics
- generated assembly/code size
```

Và phải có test:

```text
normal opcode
exception at opcode N
exception propagation
nested call
recursive call
```

**Đây là một trong những chỗ rủi ro nhất Phase 1.**

---

# 3. “Register caching” cũng cần đổi cách diễn đạt

Đừng nói:

> cache `ip`, `sp` trong thanh ghi

như thể C++ sẽ đảm bảo điều đó.

Ông chỉ tạo:

```cpp
const uint8_t* ip;
VMValue* sp;
```

rồi **cho compiler cơ hội** giữ chúng trong register.

Compiler mới là bên quyết định allocation.

Cho nên trong NCKH nên viết:

> **Register-resident hot VM state / local caching of IP and SP**

và kiểm chứng bằng assembly/profile.

Nếu LLVM/GCC đã tự làm được việc đó thì contribution không phải “tao cache register”, mà là:

> giảm aliasing/indirection đủ để optimizer có thể giữ hot state ở register.

Cái này khoa học hơn.

---

# 4. Có một lỗi kỹ thuật quan trọng trong Phase 2

Ông viết:

> `MOD → srem`

nhưng đồng thời:

> `x % 0 → VMException`

LLVM `srem` với divisor bằng zero có **undefined behavior**, nên không thể đơn giản phát `srem` rồi trông chờ runtime xử lý. LLVM cũng phân biệt rõ `srem` với modulo theo nghĩa toán học. ([LLVM][1])

Phải là:

```text
if b == 0:
    language-defined trap/exception
else:
    srem(a,b)
```

hoặc lowering thành runtime helper có check.

Ngoài ra ông cần chốt **semantic của số âm**.

Ví dụ:

```text
-7 % 3
7 % -3
-7 % -3
```

Tersun trả cái gì?

Nếu chọn semantics giống C/C++ thì phải ghi chính thức là **remainder**, kết quả cùng dấu dividend. LLVM `srem` cũng có semantics đó. ([LLVM][1])

Đừng gọi nó là “modulo toán học” nếu chưa định nghĩa.

---

# 5. Phần ternary operator cần formalize trước khi code

Đây theo tôi là **điểm sâu NCKH nhất của Phase 2**, và hiện tại plan còn hơi mơ hồ.

Ông viết:

> `tryte &` = Kleene Min/AND
> `tryte |` = Kleene Max/OR
> `^` = XOR tam phân.

Vấn đề là:

**XOR tam phân chưa tự nhiên có một semantics duy nhất.**

Và còn phải phân biệt:

```text
trit:
{-1, 0, +1}

tryte:
{trit_0, trit_1, ..., trit_n}
```

`&` là:

```text
digit-wise?
```

hay:

```text
numeric operation trên cả tryte?
```

`<<` nghĩa là:

```text
dịch 1 trit?
dịch k trit?
```

`>>` với số âm thì sao?

Overflow thì sao?

Ví dụ một tryte 6 trit:

```text
(+1,0,-1,+1,0,-1)
```

thực hiện:

```text
x << 1
```

là shift representation hay shift giá trị?

**Cái này nên có một tài liệu semantics riêng trước khi implementation.**

Đặc biệt:

> **Balanced ternary ≠ tự động có một bộ bitwise operator chuẩn.**

Đây là chỗ có thể biến Tersun thành một đề tài nghiên cứu thú vị thay vì chỉ “thêm toán tử giống C”.

---

# 6. Phase 3 hiện tại hơi quá to

Tôi sẽ **không làm toàn bộ stdlib trước**.

Đặc biệt:

```text
sort
filter
map
reduce
closures
string
time
```

có thể kéo theo một loạt vấn đề về:

* array ownership;
* allocation;
* closure capture;
* function pointer;
* generic;
* mutation;
* ABI.

Trong khi nó **không trực tiếp chứng minh thesis**.

Tôi sẽ rút Phase 3 thành:

```text
std/math.stn
std/time.stn
std/algorithm.stn
```

với khoảng 5–8 hàm có test tốt.

`string` và higher-order `map/filter/reduce` để sau.

NCKH không thưởng điểm vì stdlib dài.

---

# 7. `time_now_us` nên dùng clock monotonic

Plan hiện ghi:

> `std::chrono::high_resolution_clock`

Tôi sẽ đổi thành:

```cpp
std::chrono::steady_clock
```

cho benchmark interval.

`steady_clock` được định nghĩa là monotonic và phù hợp để đo khoảng thời gian; `high_resolution_clock` có thể là alias của `system_clock` hoặc `steady_clock` tùy implementation. ([C++ Reference][2])

Và tốt hơn nữa, API nên có:

```text
monotonic_now_ns()
monotonic_now_us()
```

chứ không nên gọi một clock đo interval là “wall time”.

---

# 8. Tôi sẽ thêm hẳn một Phase 0: Scientific Baseline

**Trước Phase 1.**

Đây là phần đang thiếu nhất.

```text
Phase 0
│
├── Freeze Tersun 1.0.3
├── Freeze compiler flags
├── Freeze machine/environment
├── Run N repetitions
├── Record median / variance
├── Verify correctness
├── Capture generated LLVM IR
├── Capture generated assembly for key tests
└── Save benchmark artifact
```

Sau đó:

```text
1.0.3 baseline
       ↓
Phase 1 optimization
       ↓
same benchmark
       ↓
A/B comparison
```

Như vậy ông có thể nói:

> “The change caused X% reduction.”

chứ không chỉ:

> “Version mới nhanh hơn.”

---

# 9. Benchmark cũng nên nâng cấp từ “3 bài” thành workload matrix

Hiện tại:

```text
fib
branch
sum
```

rất tốt để smoke test nhưng chưa đủ để kết luận VM.

Tôi sẽ chia:

### Dispatch-heavy

```text
NOP
ADD
LOAD/STORE
branch
```

### Control-flow

```text
if
nested if
loop
branch-heavy
recursion
function calls
```

### Memory

```text
array read
array write
allocation
local/global access
```

### Arithmetic

```text
int
tryte
TAFPU
division
modulo
```

### Quantum

```text
QFT-8
QFT-12
QFT-16
QFT-32
...
```

Lúc đó ông có một **execution profile** của cả Tersun chứ không chỉ vài benchmark.

---

# 10. Và đừng bỏ Rust

Ảnh benchmark của ông đã có:

```text
C++
Rust
Tersun AOT
Python
Tersun VM
```

Tôi sẽ giữ Rust.

Không nhất thiết benchmark mọi thứ ngay, nhưng ít nhất:

```text
C++ -O3
Rust -O
Tersun AOT
CPython
Tersun VM
```

trên 3–5 workload chuẩn.

Bởi vì nếu Tersun AOT nằm:

```text
C++  ←→ Rust
       ↑
    Tersun AOT
```

thì câu chuyện về native backend mạnh hơn rất nhiều so với chỉ so với Python.

---

# 11. Một điều đặc biệt quan trọng: Direct Threading không phải novelty

Đừng lấy:

> “Tersun dùng Computed Goto”

làm contribution nghiên cứu.

Đó là **kỹ thuật implementation đã biết**.

Contribution có thể nằm ở:

> **áp dụng và đánh giá execution architecture này trong một VM có ternary/exact-arithmetic semantics**, hoặc rộng hơn là:

> **một unified language/runtime architecture có classical VM, native backend và quantum backend.**

Còn computed goto chỉ là **intervention** trong thí nghiệm.

Đây là khác biệt cực lớn khi viết paper.

---

# Nếu tôi sửa kế hoạch này để thành NCKH

Tôi sẽ biến cấu trúc thành:

```text
RESEARCH QUESTION
        │
        ▼
RQ1: Unified Tersun execution architecture có hiệu quả không?
RQ2: Native lowering đem lại bao nhiêu lợi thế?
RQ3: VM dispatch là bottleneck đến mức nào?
RQ4: Ternary/exact arithmetic ảnh hưởng performance ra sao?
RQ5: Quantum path có scaling thế nào?
        │
        ▼
HYPOTHESES
        │
        ▼
BASELINE 1.0.3
        │
        ▼
ABLATION
 ├── switch
 ├── function-pointer
 ├── threaded
 ├── threaded + hot state
 └── native
        │
        ▼
SEMANTIC VERIFICATION
        │
        ▼
BENCHMARK MATRIX
        │
        ▼
STATISTICAL ANALYSIS
        │
        ▼
CONCLUSION + LIMITATIONS
```

**Đây mới là cấu trúc tôi sẽ đem đi NCKH.**

---

# Và có một điểm rất đáng mừng

Kế hoạch này **không còn phải “làm thêm thật nhiều để đủ NCKH”**.

Ngược lại.

Ông đã có quá đủ phần implementation.

Từ Tersun 1.0.3, tôi nghĩ mục tiêu hợp lý nhất là:

> **không biến 1.0.4 thành một con quái vật lớn hơn; biến 1.0.4 thành một thí nghiệm được kiểm soát tốt hơn.**

### Tôi chấm thế này:

**As engineering roadmap:** **9/10**

**As undergraduate research proposal hiện tại:** **7.5/10**

**Sau khi thêm Phase 0 + hypotheses + ablation + formal ternary semantics + benchmark methodology:** **9–9.5/10**

Và nếu phải chọn **một thứ cần làm trước tất cả**, tôi chọn:

> **Formalize semantics của `tryte` operators + đóng băng baseline 1.0.3.**

Vì phần **computed-goto có thể là tối ưu VM**, nhưng phần **“một language với balanced ternary + exact \(Q(\sqrt3)\) arithmetic + classical/quantum multi-target execution”** mới là thứ có khả năng trở thành **contribution khoa học riêng của Tersun**.

Còn việc VM từ **5.5× chậm Python → gần Python** sẽ trở thành **một thực nghiệm rất đẹp nằm bên trong contribution đó**, chứ không phải toàn bộ đề tài.

[1]: https://www.llvm.org/docs/LangRef.html?utm_source=chatgpt.com "LLVM Language Reference Manual - LLVM"
[2]: https://en.cppreference.com/cpp/chrono/high_resolution_clock?utm_source=chatgpt.com "std::chrono::high_resolution_clock - cppreference.com"
