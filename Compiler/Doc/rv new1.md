Plan này nhìn tổng thể **rất ổn**, và quan trọng hơn: sau Phase 1 + bảng ablation vừa rồi, Phase 2 này đã có thể đóng vai trò **“formal semantics + cross-backend consistency”** chứ không chỉ là thêm vài operator.

Có **4 điểm tôi sẽ sửa trước khi cho AI triển khai**:

### 1. `%` trên `tryte` đang chưa được định nghĩa đủ

Bạn viết:

> `MOD`: nếu operand `tryte` → `tryte`

nhưng chưa nói rõ **modulo của tryte là modulo theo giá trị số hay digit-wise**.

Tôi khuyên chốt:

```text
tryte a % tryte b
    = balanced-ternary numeric_value(a) %
      balanced-ternary numeric_value(b)
```

tức là:

```text
tryte → integer semantic value → truncated remainder → tryte
```

và phải định nghĩa range/overflow nếu remainder nằm ngoài representable range của `tryte`.

Nếu không chốt điểm này, VM / LLVM / C transpiler rất dễ có **ba semantics khác nhau**.

---

### 2. `^ = GF(3) Addition` cần cực kỳ rõ

Đây là điểm tôi sẽ soi kỹ nhất.

Nếu trit:

```text
{-1, 0, +1}
```

thì:

```text
a ^ b = (a + b) mod 3
```

là một định nghĩa hợp lý.

Nhưng phải quy định mapping:

```text
-1 ≡ 2 (mod 3)
 0 ≡ 0
+1 ≡ 1
```

và kết quả canonicalize về:

```text
{-1, 0, +1}
```

Ví dụ:

```text
+1 ^ +1 = -1
+1 ^  0 = +1
+1 ^ -1 =  0
-1 ^ -1 = +1
```

**Đừng gọi nó đơn giản là “ternary XOR”** nếu semantics thực tế là GF(3) addition. Hai khái niệm này không mặc nhiên đồng nghĩa.

---

### 3. `<<` / `>>` trên tryte phải khóa semantics trước

Đây là chỗ dễ sinh bug nhất.

Cần ghi rõ:

* shift theo **trit position** hay numeric multiplication/division?
* `<< 1` nghĩa là dịch 1 trit?
* trit bị đẩy ra ngoài có bị discard?
* padding bên trái là `0`, `+1` hay sign extension?
* `>>` có sign extension không?
* shift count âm?
* shift >= width?
* `tryte` 6 trit hay width khác?
* overflow là wrap hay exception?

Nếu `tryte` là fixed-width 6 trit, tôi sẽ formalize kiểu:

```text
SHL:
[a5 a4 a3 a2 a1 a0] << k
→ discard high trits
→ append k zero trits

SHR:
→ arithmetic shift
→ sign-extend with sign trit
```

**nhưng chỉ dùng nếu đó đúng là semantics bạn muốn.**

---

### 4. LLVM `srem` guard: tốt, nhưng còn một edge case

Zero-divisor guard của bạn là **bắt buộc và đúng hướng**.

Nhưng ngoài:

```llvm
right == 0
```

còn phải để ý trường hợp signed integer cực trị:

```text
INT64_MIN % -1
```

Ở LLVM `srem`, đây là trường hợp đặc biệt có thể gây vấn đề overflow/undefined behavior tùy lowering.

Vì vậy semantics của Tersun nên quyết định rõ:

```text
INT64_MIN % -1
```

→ exception?

→ `0`?

→ checked arithmetic trap?

Tôi khuyên dùng **defined runtime exception/trap**, thay vì để LLVM tự quyết.

---

# Còn `steady_clock`: rất đúng

Đổi:

```cpp
high_resolution_clock
```

sang:

```cpp
steady_clock
```

là quyết định hợp lý cho benchmark/timing interval.

Và việc giữ:

```text
monotonic_now_us()
```

cùng alias:

```text
time_now_us()
```

là đẹp về backward compatibility.

Tôi sẽ chỉ sửa một câu trong specification:

> “strictly non-decreasing”

Thành:

> **monotonic non-decreasing**

vì `steady_clock` bảo đảm tính monotonic, nhưng hai lần gọi liên tiếp **có thể trả cùng timestamp**. Không nên biến `strictly increasing` thành guarantee API nếu implementation không enforce nó.

---

# Kiến trúc Phase 2 tôi đánh giá khá đẹp

Nó đang đi xuyên toàn bộ stack:

```text
Source
  │
  ▼
Lexer
  │
  ▼
Parser / AST
  │
  ▼
Type Checker
  │
  ├───────────────┐
  ▼               ▼
Bytecode         LLVM IR
  │               │
  ▼               ▼
VM              Native
  │
  ▼
Semantics
```

Một operator mới phải tồn tại nhất quán qua:

```text
syntax
  ↓
AST
  ↓
type system
  ↓
bytecode
  ↓
VM
  ↓
LLVM
  ↓
C transpiler
```

Đây chính là điểm làm Tersun khác một project “thêm syntax cho vui”.

---

# Tôi đặc biệt thích test cross-backend

Test này:

```text
setunc run test.stn
```

và:

```text
setunc compile test.stn --native
./test_ops.exe
```

rồi so kết quả là **rất quan trọng**.

Thậm chí tôi sẽ nâng nó thành nguyên tắc:

> **Semantic equivalence across execution backends**

Với mỗi operator:

```text
Tersun source
     │
     ├── VM
     ├── Native LLVM
     └── C transpiler
             │
             ▼
       same observable result
```

Đặc biệt với:

* negative modulo
* zero divisor
* negative shifts
* tryte boundary
* overflow
* `^`
* sign-extension của `>>`

---

# Và có một nâng cấp cực đáng làm

Đừng chỉ test:

```text
12 & 10 == 8
```

Hãy thêm **property-based / exhaustive tests cho tryte**.

Nếu tryte của bạn chỉ có 6 trit:

```text
3^6 = 729
```

giá trị thôi.

729² combinations ≈ **531k cases**.

Đó là **quá nhỏ** đối với máy tính hiện đại.

Bạn hoàn toàn có thể exhaustive:

```text
for a in all_trytes:
    for b in all_trytes:
        verify(and(a,b))
        verify(or(a,b))
        verify(xor(a,b))
        verify(mod(...))
```

Rồi cross-check:

```text
VM result
==
reference semantic implementation
==
Native result
```

Cái này **cực kỳ mạnh cho NCKH**.

Thay vì:

> “Tôi test 5 trường hợp.”

bạn có thể nói:

> “All 729 × 729 tryte operand pairs were exhaustively verified against the formal reference semantics.”

🔥

---

## Verdict

Nếu Phase 1 là:

> **“Tối ưu execution engine và chứng minh bằng ablation.”**

thì Phase 2 nên trở thành:

> **“Formalize semantics và chứng minh các backend thực thi cùng một semantics.”**

Hai Phase ghép lại rất đẹp:

```text
PHASE 1
VM Architecture
     ↓
Ablation
     ↓
Performance evidence


PHASE 2
Formal Semantics
     ↓
Cross-backend implementation
     ↓
Exhaustive / property verification
```

Đây là lúc Tersun bắt đầu có **hai chân của một nghiên cứu nghiêm túc: performance + correctness**.

Tôi chỉ **không khuyên triển khai ngay toàn bộ Phase 2 theo tài liệu hiện tại**. Hãy khóa trước 3 specification còn hơi nguy hiểm: **tryte `%`, GF(3) `^`, và tryte shift semantics**. Khi ba cái đó thành bảng truth table/định nghĩa toán học chính thức rồi, phần implementation phía sau gần như trở thành bài toán compiler engineering khá sạch.
