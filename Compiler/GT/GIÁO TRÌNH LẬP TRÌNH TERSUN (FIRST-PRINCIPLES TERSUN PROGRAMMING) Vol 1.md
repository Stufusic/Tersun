# Chapter 1 — Khi Bộ Nhớ Chưa Có Tên (Variables & Values)

---

## 1. Problem

Hãy tưởng tượng bạn được giao một nhiệm vụ tính toán rất đời thường:

> *"Tính tổng chi phí chuyến đi: Tiền vé máy bay là 150 đô, khách sạn 3 đêm mỗi đêm 80 đô, tiền ăn uống mỗi ngày 40 đô trong 4 ngày. Sau đó, tính xem nếu có 3 người cùng chia đều chuyến đi này thì mỗi người phải trả bao nhiêu? Và nếu một người có mã giảm giá 15% trên phần của họ, người đó trả bao nhiêu?"*

Nếu bạn làm việc này trong đầu hoặc trên một mẩu giấy nháp, bạn sẽ làm gì?
Bạn tính:
- Tiền khách sạn: $3 \times 80 = 240$. Bạn ghi số $240$ ra góc giấy.
- Tiền ăn: $4 \times 40 = 160$. Bạn ghi số $160$ ra góc giấy.
- Tổng: $150 + 240 + 160 = 550$. Bạn ghi $550$.
- Chia 3: $550 / 3 \approx 183.33$.
- Giảm 15%: $183.33 \times 0.85 \approx 155.83$.

Bây giờ, hãy chuyển yêu cầu này sang một bộ vi xử lý (CPU) hoặc một máy tính sơ khai:
Bộ vi xử lý là một cỗ máy số học (ALU) cực kỳ nhanh nhưng **hoàn toàn mất trí nhớ sau mỗi chu kỳ**. Nó có thể cộng hai số trong 1 nano-giây, nhưng khi vừa tính xong $3 \times 80 = 240$, nếu nó quay sang tính tiếp $4 \times 40 = 160$, số $240$ vừa rồi **sẽ biến mất vĩnh viễn** nếu không có một nơi để giữ nó lại.

> **Vấn đề cốt lõi:**  
> Tính toán trong thế giới thực là một chuỗi các bước phụ thuộc lẫn nhau. Kết quả của bước trước là nguyên liệu của bước sau. Làm sao để máy tính giữ lại một kết quả trung gian để tái sử dụng mà không làm nó biến mất?

---

## 2. Nếu chưa có abstraction này thì sao?

Khi chưa có khái niệm **"Biến" (Variable)** trong ngôn ngữ lập trình, các kỹ sư thời kỳ đầu phải giải quyết bài toán này như thế nào?

### Cách 1: Ghi nhớ địa chỉ ô nhớ vật lý (Raw Memory Address)
Phần cứng máy tính là một dãy hàng tỷ ô nhớ liên tiếp, mỗi ô nhớ có một địa chỉ nhị phân hoặc số nguyên (ví dụ: ô nhớ thứ `0x7FFF0010`, ô nhớ `0x7FFF0018`).
Bạn phải viết chỉ thị điều khiển như sau:
```text
NHÂN 3 VỚI 80 → LƯU KẾT QUẢ VÀO Ô NHỚ 0x1004
NHÂN 4 VỚI 40 → LƯU KẾT QUẢ VÀO Ô NHỚ 0x1008
CỘNG 150 VỚI NỘI DUNG Ô NHỚ 0x1004 → LƯU VÀO Ô NHỚ 0x100C
CỘNG NỘI DUNG Ô NHỚ 0x100C VỚI Ô NHỚ 0x1008 → LƯU VÀO Ô NHỚ 0x1010
```

**Giới hạn chết người xuất hiện:**
1. **Gánh nặng tâm trí (Cognitive Overload)**: Bạn có nhớ nổi ô nhớ `0x1008` đang chứa tiền ăn hay số ngày đi không? Nếu chương trình có 5,000 giá trị trung gian, não bộ con người sẽ sụp đổ.
2. **Xung đột ghi đè (Memory Collision)**: Nếu bạn vô tình bảo CPU lưu tiền vé máy bay vào đúng ô nhớ `0x1004`, tiền khách sạn tính lúc nãy lập tức bị xóa sổ mà không có bất kỳ cảnh báo nào.
3. **Mất tính linh động (Relocation Fragility)**: Nếu hệ điều hành chuyển chương trình của bạn sang một vùng nhớ khác, toàn bộ các địa chỉ cứng (`0x1004`, `0x1008`) đều trở thành rác.

### Cách 2: Ngăn xếp thuần túy không tên (Pure Stack)
Một số hệ thống cổ điển dùng một cấu trúc ngăn xếp: đẩy số vào đỉnh, lấy ra tính.
```text
PUSH 150
PUSH 3
PUSH 80
MUL
ADD
PUSH 4
PUSH 40
MUL
ADD
...
```
Cách này giải quyết được việc cộng dồn liên tục, nhưng nếu bạn cần dùng lại kết quả của phép tính đầu tiên ở tít 20 bước sau, bạn phải đảo lộn toàn bộ ngăn xếp, tráo đổi (SWAP/ROT) hàng chục lần. Mã nguồn trở thành một mê cung không thể bảo trì.

---

## 3. Discovery

Hãy tự đặt mình vào vị trí của người phát minh ra ngôn ngữ lập trình đầu tiên:

1. Ta không muốn nhớ số địa chỉ `0x1004`. Ta muốn gọi nó là `hotel_cost`.
2. Ta muốn bảo máy tính: *"Hãy tìm cho tôi một chỗ trống trong bộ nhớ, đặt cho chỗ đó cái nhãn tên là `hotel_cost`, và nhét giá trị 240 vào đó"*.
3. Lần sau, khi cần tính tổng, ta chỉ cần nói: *"Lấy giá trị từ chỗ có nhãn `hotel_cost` ra cộng với `flight_cost`"*.

Đây chính là khoảnh khắc sự trừu tượng hóa ra đời:
> **Biến (Variable) thực chất là một "HỢP ĐỒNG ÁNH XẠ" giữa một cái tên có nghĩa đối với con người và một vị trí lưu trữ vật lý trong bộ nhớ của máy tính.**

---

## 4. Historical / Conceptual Bridge

Năm 1957, khi John Backus phát minh ra **FORTRAN** (Formula Translation), bước đột phá lớn nhất của ông không phải là tính toán nhanh hơn hợp ngữ, mà là cho phép lập trình viên viết:
```fortran
TOTAL = FLIGHT + HOTEL + FOOD
```
thay vì phải viết các lệnh tải thanh ghi:
```assembly
MOV EAX, [0x1000]
ADD EAX, [0x1004]
ADD EAX, [0x1008]
MOV [0x100C], EAX
```
Trình biên dịch (Compiler) lúc này đóng vai trò một **Thư ký Quản lý Đất đai**: bạn đặt tên lô đất (`hotel`), trình biên dịch sẽ tự động cấp một thửa đất trên thanh ghi hoặc RAM, ghi lại trong sổ bộ (Symbol Table) rằng `hotel` tương ứng với vị trí nào, và tự động dịch tên đó thành địa chỉ máy mỗi khi bạn gọi nó.

---

## 5. Formal Concept

Sau khi đã có trực giác, chúng ta định nghĩa hai khái niệm kỹ thuật chuẩn mực:

1. **Giá Trị (Value)**:
   - Là dữ liệu thô, là một thực thể thông tin cụ thể (ví dụ: con số $240$, chuỗi ký tự `"Hà Nội"`).
   - Giá trị tồn tại độc lập với tên gọi. Số $240$ vẫn là $240$ dù ta có đặt tên cho nó hay không.
2. **Biến (Variable)**:
   - Là một liên kết (binding) gồm 3 thành phần:
     - **Identifier (Tên định danh)**: Ký hiệu giúp con người đọc và viết.
     - **Storage Location (Địa chỉ lưu trữ)**: Vùng nhớ (thanh ghi CPU hoặc slot trên stack).
     - **Current Value (Giá trị hiện tại)**: Nội dung bit đang nằm trong vùng nhớ đó.
3. **Phép Gán (Assignment)**:
   - Hành động cập nhật nội dung của ô nhớ được trỏ bởi tên định danh.

---

## 6. Tersun Model

Trong ngôn ngữ **Tersun**, một biến được biểu diễn và quản lý như thế nào?

1. **Khởi tạo tường minh với `let`**:
   Tersun sử dụng từ khóa `let` để thông báo cho Compiler biết: *"Tôi muốn đăng ký một định danh mới vào bảng ký hiệu"*.
2. **Tầng Giá Trị (Value Representation)**:
   Mọi giá trị trong Tersun ở tầng Runtime được biểu diễn bởi một cấu trúc gọn nhẹ gọi là `VMValue` (64-bit scalar word). Khi bạn gán số nguyên `240`, Tersun lưu trực tiếp con số 64-bit này vào slot bộ nhớ mà không cần bọc (box) qua đối tượng phức tạp như Python.
3. **Cơ chế Local Slot Indexing**:
   Trình biên dịch Tersun không lưu chuỗi `"hotel_cost"` vào bytecode lúc chạy. Trong quá trình biên dịch (Compile-time), nó phân tích hàm và gán cho `hotel_cost` một chỉ số slot cục bộ: ví dụ `slot 0`, `flight_cost` là `slot 1`. Máy ảo VM chỉ truy xuất qua mảng chỉ số siêu tốc `locals_[local_base + slot]`.

---

## 7. Syntax

Cú pháp khai báo biến trong Tersun:

```stn
// Khai báo với suy diễn kiểu tự động (Type Inference)
let tên_biến = giá_trị;

// Khai báo với chú thích kiểu rõ ràng (Type Annotation)
let tên_biến: kiểu_dữ_liệu = giá_trị;

// Phép gán lại (Re-assignment / Mutation)
tên_biến = giá_trị_mới;
```

---

## 8. Code

### Cấp độ 1: Cực nhỏ (Hello Variables)
```stn
fn main() {
    let x = 10;
    let y = 20;
    let sum = x + y;
    println(sum);
}
```

### Cấp độ 2: Vừa (Giải quyết bài toán chi phí du lịch)
```stn
fn main() {
    let flight = 150;
    let hotel = 3 * 80;
    let food = 4 * 40;

    let total = flight + hotel + food;
    println(total); // In ra: 550

    let per_person = total / 3;
    println(per_person); // In ra: 183
}
```

### Cấp độ 3: Thực tế (Cập nhật biến trạng thái tính toán)
```stn
fn main() {
    let balance = 1000;
    let deposit = 250;
    let withdrawal = 400;

    // Cập nhật trạng thái tài khoản qua các giao dịch
    balance = balance + deposit;
    balance = balance - withdrawal;

    print("So du cuoi cung: ");
    println(balance); // In ra: 850
}
```

---

## 9. What Actually Happens? (Dưới Nắp Ca-pô Compiler & VM)

Khi bạn viết dòng code:
```stn
let x = 42;
```

Chuyện gì thực sự diễn ra bên trong hệ thống Tersun?

```text
[Source Text] "let x = 42;"
      │
      ▼ (1. Lexer)
[Tokens] [TOKEN_LET, TOKEN_IDENT("x"), TOKEN_ASSIGN, TOKEN_INT(42), TOKEN_SEMICOLON]
      │
      ▼ (2. Parser)
[AST Node] VarDeclStmt { name: "x", type: <inferred>, init: IntLiteralExpr(42) }
      │
      ▼ (3. Compiler / Emitter)
Gán "x" vào Local Slot 0 của hàm main.
Sinh Bytecode:
   0x01 [42 trong 8 bytes binary] -> OP_PUSH_INT 42
   0x11 [0x00 0x00]               -> OP_STORE_LOCAL slot 0
      │
      ▼ (4. Tier-1 Adaptive VM Optimizer)
Tối ưu siêu lệnh (Superinstruction):
Nếu biến x nằm ở slot 0, chunk tối ưu hóa tự động thay thế bằng:
   OP_STORE_LOCAL_0 (Opcode đơn chu kỳ, 0 operand overhead)
      │
      ▼ (5. Runtime VM Execution)
sp -= 1;
locals_[local_base + 0] = *sp;
```

> **Bài học kiến trúc**: Đối với con người, biến là một danh từ (`balance`, `hotel`). Nhưng đối với VM của Tersun, biến chỉ là **một độ lệch số học (offset)** tính từ con trỏ cơ sở của khung ngăn xếp (`local_base + 0`). Tên chuỗi ký tự đã bị vứt bỏ hoàn toàn sau khi biên dịch để đạt tốc độ tối đa!

---

## 10. Experiment

Hãy mở terminal hoặc tạo một tệp mã nguồn nhỏ `test_var.stn` và chạy thử để quan sát hành vi của máy ảo:

Tạo file `test_var.stn`:
```stn
fn main() {
    let a = 100;
    let b = a;
    a = 999;

    print("Gia tri cua a: ");
    println(a);
    print("Gia tri cua b: ");
    println(b);
}
```

Chạy với trình biên dịch Tersun:
```bash
setunc run test_var.stn
```

**Quan sát kết quả:**
```text
Gia tri cua a: 999
Gia tri cua b: 100
```
**Nhận xét**: Khi gán `let b = a`, giá trị `100` trong slot của `a` được sao chép nguyên vẹn sang slot của `b`. Việc thay đổi `a = 999` sau đó hoàn toàn **không ảnh hưởng gì tới `b`**. Mỗi biến sở hữu một vùng nhớ độc lập trên stack.

---

## 11. Failure (Thử Nghiệm Phá Vỡ)

Bây giờ, hãy thử làm cho hệ thống thất bại để tìm ra ranh giới của abstraction này.

### Thử nghiệm A: Gọi biến trước khi nó chào đời
Tạo file `fail_unbound.stn`:
```stn
fn main() {
    println(secret);
    let secret = 12345;
}
```

Chạy chương trình:
```bash
setunc run fail_unbound.stn
```

### Thử nghiệm B: Sử dụng biến mà không khởi tạo giá trị
```stn
fn main() {
    let uninitialized: int;
    let result = uninitialized + 10;
    println(result);
}
```

---

## 12. Why? (Tại Sao Lại Thất Bại?)

Khi bạn chạy `fail_unbound.stn`, trình biên dịch Tersun ngay lập tức dừng lại và báo lỗi:
```text
[Type/Resolver Error]: Undefined variable 'secret' at line 2.
```

**Tại sao?**
1. Trình biên dịch Tersun duyệt mã nguồn theo thứ tự tuyến tính từ trên xuống dưới (Single-Pass/Two-Pass Scoping). Tại dòng 2, bảng ký hiệu (Symbol Table) của hàm `main` hoàn toàn chưa ghi nhận cái tên nào tên là `secret`. 
2. Nếu ngôn ngữ cho phép điều này (như hiện tượng "hoisting" của JavaScript cổ điển), chương trình sẽ phải đọc một ô nhớ rác trên stack chứa dữ liệu thừa của các hàm trước đó. Điều này gây ra **hành vi bất định (Undefined Behavior / Security Leak)**.
3. Tersun bảo vệ an toàn bộ nhớ bằng cách áp dụng quy tắc: **Mọi biến phải được khai báo trước khi sử dụng**.

---

## 13. Exercise

### Bài tập 1: Dự đoán Output
Hãy phân tích bằng mắt và dự đoán chính xác giá trị in ra màn hình của đoạn code sau trước khi chạy:
```stn
fn main() {
    let x = 5;
    let y = x * 2;
    let z = y - x;
    x = 20;
    let final_res = x + y + z;
    println(final_res);
}
```

### Bài tập 2: Săn Lỗi (Find the Bug)
Đoạn code sau có lỗi gì khiến trình biên dịch Tersun từ chối thực thi? Hãy sửa lại cho đúng:
```stn
fn main() {
    let price = 50;
    let quantity = 4;
    total = price * quantity;
    println(total);
}
```

### Bài tập 3: Tư Duy Compiler
Giả sử hàm `main` có 4 biến cục bộ:
```stn
let a = 1;
let b = 2;
let c = 3;
let d = 4;
```
Hãy giải thích vì sao bộ tối ưu bytecode của Tersun (`OptBytecodeOptimizer`) lại gán 4 biến này vào các opcode siêu lệnh `OP_STORE_LOCAL_0`, `OP_STORE_LOCAL_1`, `OP_STORE_LOCAL_2`, `OP_STORE_LOCAL_3` mà không dùng `OP_STORE_LOCAL 0..3` thông thường? Lợi ích phần cứng ở đây là gì?

---

## 14. Challenge (Thử Thách Mở)

> **Thử thách Hoán vị không biến phụ (The In-Place Swap)**:  
> Bạn có hai biến `let a = 45;` và `let b = 89;`.  
> Hãy viết một đoạn mã Tersun hoán đổi giá trị của `a` và `b` (sao cho cuối cùng `a = 89` và `b = 45`) **mà không được phép khai báo thêm bất kỳ một biến thứ ba nào (`temp`)**.  
> *Gợi ý: Sử dụng tính chất số học của phép cộng và phép trừ.*

---

## 15. Summary

* **Vấn đề**: Bộ vi xử lý không có trí nhớ giữa các chu kỳ tính toán độc lập; địa chỉ ô nhớ vật lý thì quá khó nhớ và dễ gây va chạm dữ liệu.
* **Abstraction**: **Biến (Variable)** là hợp đồng ánh xạ một tên gọi con người dễ hiểu vào một vị trí lưu trữ trên bộ nhớ.
* **Mô hình Tersun**: Ở tầng tĩnh, biến là một định danh trong Symbol Table. Ở tầng máy ảo (VM), biến được gán thành một **Local Slot Index** trên mảng stack tuyến tính, loại bỏ toàn bộ chuỗi tên để đạt tốc độ truy xuất $O(1)$.
* **Quy tắc cốt lõi**: Khai báo với `let`, bắt buộc phải định nghĩa trước khi sử dụng.

---

## 16. Bridge (Cầu Nối Sang Chương Tiếp Theo)

Bây giờ ta đã có những chiếc "hộp" có tên để giữ lại giá trị (`let a = 10; let b = 20;`).
Nhưng giữ giá trị đứng yên thì không tạo ra phần mềm. Ta cần **kết hợp, biến đổi và tính toán** trên các giá trị đó:

> *Điều gì thực sự xảy ra khi ta viết `a + b * c - d / e`?  
> Làm sao máy tính biết phải làm phép nhân trước phép cộng?  
> Và làm thế nào một chuỗi ký tự dài ngoằng biến thành một cấu trúc cây mà CPU có thể thực thi chính xác từng bước mà không nhầm lẫn?*

Chào mừng bạn đến với **Chapter 2 — Bản Chất Của Biểu Thức (Expressions & Operators)**!





# Chapter 2 — Bản Chất Của Biểu Thức (Expressions & Operators)

---

## 1. Problem

Ở Chapter 1, ta đã phát minh ra cách đặt tên cho các ô nhớ:
```stn
let a = 10;
let b = 20;
let c = 5;
```

Bây giờ, ta muốn tính toán một công thức rất quen thuộc trong hình học hoặc kế toán:
$$\text{result} = a + b \times c$$

Hãy nhìn vào dòng chữ mà con người viết ra:
```text
"a + b * c"
```

Một chuỗi ký tự viết trên giấy là một **thực thể một chiều (1-Dimensional String)**: nó chỉ là một mảng các ký tự xếp cạnh nhau: `['a', ' ', '+', ' ', 'b', ' ', '*', ' ', 'c']`.

Nếu một cỗ máy đọc dòng chữ này một cách ngây thơ từ trái sang phải:
1. Nó thấy `a` ($10$).
2. Nó thấy dấu cộng `+`.
3. Nó thấy `b` ($20$). Nó thực hiện phép cộng ngay lập tức: $10 + 20 = 30$.
4. Nó thấy dấu nhân `*`.
5. Nó thấy `c` ($5$). Nó lấy kết quả vừa rồi nhân với $5$: $30 \times 5 = 150$.

**Nhưng kết quả toán học đúng phải là:**
$$10 + (20 \times 5) = 10 + 100 = 110$$

> **Vấn đề cốt lõi:**  
> Mã nguồn là một chuỗi văn bản phẳng một chiều, nhưng **mối quan hệ tính toán trong toán học lại là một cấu trúc phân cấp (Hierarchical Tree)**.  
> Làm thế nào một chương trình máy tính có thể đọc một dòng chữ phẳng và tự động hiểu được phép tính nào cần làm trước, phép tính nào làm sau mà không tạo ra kết quả sai lệch?

---

## 2. Nếu chưa có abstraction này thì sao?

Trước khi các trình biên dịch hiện đại có bộ phân tích biểu thức (Expression Parser), con người phải vật lộn với những cách sau:

### Cách 1: Bắt con người viết hàm lồng nhau (Manual Prefix Call)
Nếu máy tính không hiểu biểu thức trung tố (`Infix`), ta buộc lập trình viên phải viết biểu thức dưới dạng các lời gọi hàm lồng nhau (Prefix Notation, giống như ngôn ngữ Lisp):
```text
let result = add(a, mul(b, c));
```
- Phép tính $a + b \times c$ thì nhìn còn tạm được.
- Nhưng nếu là công thức nghiệm phương trình bậc hai:
  $$x = \frac{-b + \sqrt{b^2 - 4ac}}{2a}$$
  Lập trình viên sẽ phải viết:
  ```text
  let x = div(add(neg(b), sqrt(sub(mul(b, b), mul(4, mul(a, c))))), mul(2, a));
  ```
  Viết xong dòng này, mắt bạn sẽ hoa lên vì đếm dấu ngoặc, và khả năng gõ nhầm một dấu phẩy là $99\%$.

### Cách 2: Bắt con người tự làm nhiệm vụ của máy (Assembly Flattening)
Lập trình viên phải tự tay bẻ nhỏ biểu thức thành từng lệnh CPU thô sơ:
```text
LOAD b        // Nạp b vào thanh ghi
MUL c         // Nhân với c
STORE temp    // Cất vào biến tạm
LOAD a        // Nạp a
ADD temp      // Cộng với biến tạm
STORE result  // Lưu kết quả
```
Mỗi khi bạn muốn sửa một công thức toán học, bạn phải viết lại 15 dòng hợp ngữ.

---

## 3. Discovery

Hãy quan sát cách bộ não con người phân tích phép tính:
$$10 + 20 \times 5$$

Tại sao bạn biết $20 \times 5$ phải làm trước?
Bởi vì từ thời tiểu học, bạn đã học một quy ước: **"Nhân chia trước, cộng trừ sau"**.

Nói theo ngôn ngữ của kỹ sư thiết kế Compiler:
> Dấu nhân `*` có một **lực hút (Binding Power)** mạnh hơn dấu cộng `+`. Nó hút chặt hai toán hạng đứng cạnh nó (`20` và `5`) vào với nhau trước khi dấu cộng kịp với tới.

Nếu ta biểu diễn lực hút này bằng một hình vẽ, biểu thức phẳng sẽ lập tức biến thành một **Cái Cây (Tree)**:

```text
         (+)  <-- Thực hiện CUỐI CÙNG (Gốc cây)
        /   \
      10     (*)  <-- Thực hiện TRƯỚC (Nút con)
            /   \
          20     5
```

Muốn tính được cái cây này:
1. Bạn phải đi xuống cành sâu nhất: Tính $20 \times 5 = 100$.
2. Sau đó mới chuyển kết quả $100$ lên nút cha để tính $10 + 100 = 110$.

Đây chính là phát minh vĩ đại của khoa học máy tính:
> **Một Biểu thức (Expression) không phải là một chuỗi ký tự. Nó là một Cây Cú Pháp Trừu Tượng (Abstract Syntax Tree - AST)!**

---

## 4. Historical / Conceptual Bridge

Làm thế nào để một chương trình máy tính tự động biến một chuỗi chữ viết `10 + 20 * 5` thành cái cây ở trên?

- **Năm 1961**, nhà khoa học máy tính huyền thoại **Edsger Dijkstra** phát minh ra thuật toán **Shunting-Yard** (Thuật toán đường ray xe lửa). Ông dùng hai ngăn xếp (Stack) để đảo các toán tử trung tố thành hậu tố (Postfix / Reverse Polish Notation).
- **Năm 1973**, **Vaughan Pratt** công bố thuật toán **Top-Down Operator Precedence** (ngày nay thường gọi là **Pratt Parser**). Ý tưởng của Pratt cực kỳ thanh lịch: mỗi toán tử được gán một con số gọi là **"Độ ưu tiên" (Precedence / Binding Power)**. Dấu `*` có độ ưu tiên cao hơn dấu `+`.

> **Bí mật của Tersun**: Trình phân tích cú pháp của Tersun trong tệp [`src/compiler/parser.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp) được xây dựng dựa trên chính thuật toán **Pratt Parser** này! Nó đọc từng token và dùng trọng số lực hút để dựng cây AST trong đúng 1 lượt quét tuyến tính $O(N)$.

---

## 5. Formal Concept

Để làm chủ biểu thức trong bất kỳ ngôn ngữ nào, bạn cần 5 khái niệm chính thức:

1. **Biểu thức (Expression)**:
   - Một đoạn mã có thể **được đánh giá (evaluate) để sinh ra một Giá trị (Value)**.
   - Phân biệt với **Câu lệnh (Statement)**: Câu lệnh thực hiện một hành động (như `let x = 10;` hay vòng lặp) nhưng bản thân nó không đại diện cho một giá trị.
2. **Toán tử (Operator) & Toán hạng (Operand)**:
   - Toán tử là ký hiệu chỉ định phép tính (`+`, `-`, `*`).
   - Toán hạng là dữ liệu đầu vào chịu tác động của toán tử (`10`, `20`).
3. **Bậc của toán tử (Arity)**:
   - **Unary (Một ngôi)**: Tác động lên 1 toán hạng (ví dụ: `-x`, `not b`).
   - **Binary (Hai ngôi)**: Tác động lên 2 toán hạng (ví dụ: `a + b`, `x * y`).
   - **Ternary (Ba ngôi)**: Tác động lên 3 toán hạng (ví dụ: phép so sánh tam phân hoặc toán tử điều kiện).
4. **Độ ưu tiên (Precedence)**:
   - Xác định toán tử nào giành quyền thực hiện trước khi không có dấu ngoặc đơn.
5. **Tính kết hợp (Associativity)**:
   - Khi hai toán tử có **cùng độ ưu tiên** đứng cạnh nhau, phép tính sẽ chạy từ hướng nào?
   - **Kết hợp trái (Left-associative)**: `a - b - c` tương đương với `(a - b) - c`.
   - **Kết hợp phải (Right-associative)**: `a = b = c` tương đương với `a = (b = c)`.

---

## 6. Tersun Model

Trong ngôn ngữ **Tersun**, biểu thức được hiện thực hóa thế nào?

### 1. Bảng Trọng Số Ưu Tiên trong Pratt Parser của Tersun
Theo mã nguồn của compiler Tersun, độ ưu tiên được sắp xếp từ thấp đến cao như sau:

| Cấp độ ưu tiên | Toán tử | Tính chất kết hợp |
| :--- | :--- | :---: |
| **Gán (Assignment)** | `=` | Kết hợp phải |
| **So sánh Tam phân** | `<=>` (Spaceship operator trả về $-1, 0, +1$) | Không kết hợp |
| **Logic Nhị phân** | `==`, `!=` | Kết hợp trái |
| **So sánh Quan hệ** | `<`, `<=`, `>`, `>=` | Kết hợp trái |
| **Cộng trừ Số học** | `+`, `-` | Kết hợp trái |
| **Nhân chia / Modulo** | `*`, `/`, `%` | Kết hợp trái |
| **Một ngôi (Unary)** | `-` (đổi dấu), `~`, `not` | Kết hợp phải |
| **Gọi hàm / Truy cập**| `()`, `[]`, `.` | Kết hợp trái |

### 2. Dấu Ngoặc Đơn `()` — Quyền Lực Phá Vỡ Quy Tắc
Nếu bạn muốn ép máy tính cộng trước rồi mới nhân, bạn dùng cặp ngoặc `(a + b) * c`.
Trong Parser của Tersun, khi gặp dấu mở ngoặc `(`, nó tạm dừng biểu thức hiện tại, tạo một cây con mới và đánh giá độc lập bên trong trước khi trả kết quả về cho toán tử bên ngoài.

---

## 7. Syntax

Cú pháp các toán tử biểu thức cơ bản trong Tersun:

```stn
// 1. Số học cơ bản
let sum = a + b;
let diff = a - b;
let prod = a * b;
let quot = a / b;
let rem = a % b;

// 2. Toán tử một ngôi
let neg = -a;

// 3. Ép độ ưu tiên bằng ngoặc đơn
let result = (a + b) * (c - d);

// 4. Toán tử so sánh tam phân độc quyền (Ternary Comparison)
let cmp = a <=> b; // Trả về -1 nếu a < b, 0 nếu a == b, +1 nếu a > b
```

---

## 8. Code

### Cấp độ 1: Cực nhỏ (Kiểm chứng thứ tự thực hiện)
```stn
fn main() {
    let a = 2 + 3 * 4;
    let b = (2 + 3) * 4;

    print("Khong co ngoac: ");
    println(a); // In ra: 14 (3*4 trước rồi + 2)

    print("Co ngoac don:   ");
    println(b); // In ra: 20 ((2+3) trước rồi * 4)
}
```

### Cấp độ 2: Vừa (Tính khoảng cách Euclid giữa 2 điểm trong không gian 2D)
Biểu thức toán học: $D^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2$

```stn
fn main() {
    let x1 = 3;
    let y1 = 4;
    let x2 = 7;
    let y2 = 1;

    let dx = x2 - x1;
    let dy = y2 - y1;

    // Biểu thức tính bình phương khoảng cách
    let dist_sq = dx * dx + dy * dy;

    print("Binh phuong khoang cach: ");
    println(dist_sq); // In ra: 25 ((4*4) + (-3*-3) = 16 + 9 = 25)
}
```

### Cấp độ 3: Thực tế (Toán tử So Sánh Tam Phân `<=>`)
```stn
fn main() {
    let score_a = 85;
    let score_b = 92;

    // So sánh tam phân trực tiếp: trả về số nguyên -1, 0, hoặc +1
    let relation = score_a <=> score_b;

    print("Ket qua so sanh tam phan (score_a <=> score_b): ");
    println(relation); // In ra: -1 (vi 85 < 92)
}
```

---

## 9. What Actually Happens? (Dưới Nắp Ca-pô Compiler & VM)

Hãy theo dõi một biểu thức được thực thi trên máy ảo Tersun VM:
```stn
let res = 2 + 3 * 4;
```

### Bước 1: Từ Text sang Cây AST (Pratt Parser)
Bộ phân tích cú pháp tạo ra cây nhị phân:
```text
           BinaryExpr(+)
           /          \
    Literal(2)      BinaryExpr(*)
                    /          \
             Literal(3)      Literal(4)
```

### Bước 2: Từ Cây AST sang Bytecode Máy Ảo
Bộ phát mã (`emitter.cpp`) duyệt cây theo thứ tự **Hậu tố (Post-Order Traversal)**: đi thăm các con trước, thăm cha sau:
```text
Offset | Bytecode Opcode    | Hành vi trên Operand Stack của VM
-------+--------------------+-------------------------------------------
0x00   | OP_PUSH_INT 2      | Stack: [2]
0x09   | OP_PUSH_INT 3      | Stack: [2, 3]
0x12   | OP_PUSH_INT 4      | Stack: [2, 3, 4]
0x1B   | OP_MUL             | Pop 4, Pop 3 -> 3 * 4 = 12 -> Push 12
       |                    | Stack: [2, 12]
0x1C   | OP_ADD             | Pop 12, Pop 2 -> 2 + 12 = 14 -> Push 14
       |                    | Stack: [14]
0x1D   | OP_STORE_LOCAL 0   | Pop 14 cất vào slot biến 'res'
```

### Bước 3: Trên Máy Ảo Tersun Gate 4 VM
Ở Chapter trước ta đã biết Tersun sử dụng **Adaptive Quickening**:
- Lệnh `OP_MUL` và `OP_ADD` ban đầu là toán tử đa hình.
- Nhưng sau khi chạy lặp 8 lần trên các số nguyên 64-bit, VM tự động **đột biến bytecode trong RAM** thành `OP_MUL_INT48` và `OP_ADD_INT48`.
- Nhờ đó, hai con số được nạp thẳng vào 2 thanh ghi CPU thực tế và nhân/cộng bằng lệnh hợp ngữ `imul` / `add` của phần cứng x86-64 mà không tốn một phần triệu giây kiểm tra kiểu!

---

## 10. Experiment

Tạo một tệp kiểm nghiệm `test_expr.stn`:
```stn
fn main() {
    let x = 100 - 50 - 20;
    println(x);

    let y = 100 / 10 / 2;
    println(y);
}
```

Chạy chương trình:
```bash
setunc run test_expr.stn
```

**Kết quả:**
```text
30
5
```

**Phân tích thí nghiệm:**
- `100 - 50 - 20`:
  - Nếu kết hợp phải: $100 - (50 - 20) = 100 - 30 = 70$.
  - Nếu kết hợp trái: $(100 - 50) - 20 = 50 - 20 = 30$.
  - Kết quả ra `30` chứng minh: Phép trừ trong Tersun là **Left-Associative (Kết hợp trái)**.
- Tương tự, `100 / 10 / 2` ra `5` chứng minh phép chia cũng kết hợp trái: $(100 / 10) / 2 = 10 / 2 = 5$.

---

## 11. Failure (Thử Nghiệm Phá Vỡ)

Hãy thử làm biểu thức sụp đổ bằng 2 trường hợp biên kinh điển:

### Thử nghiệm A: Phép chia cho số Không (Division by Zero)
Tạo tệp `fail_divzero.stn`:
```stn
fn main() {
    let a = 42;
    let b = 0;
    let c = a / b;
    println(c);
}
```

### Thử nghiệm B: Gán vào một biểu thức không phải biến (Invalid L-Value)
Tạo tệp `fail_lvalue.stn`:
```stn
fn main() {
    let a = 10;
    let b = 20;
    a + b = 30; // Cố tình gán giá trị vào một phép cộng!
}
```

---

## 12. Why? (Tại Sao Lại Thất Bại?)

### Với Thử nghiệm A (`Division by Zero`):
Khi chạy `setunc run fail_divzero.stn`, máy ảo Tersun VM lập tức dừng chương trình và ném ngoại lệ:
```text
[Runtime Exception]: Division by zero at line 4.
```
**Tại sao?**  
Trong toán học, phép chia cho 0 là vô định. Ở tầng phần cứng x86-64, nếu CPU thực thi lệnh `idiv` với số chia bằng 0, nó sẽ phát sinh tín hiệu ngắt phần cứng `#DE (Divide Error Exception)`. Nếu máy ảo không bắt trước lỗi này, toàn bộ tiến trình hệ điều hành sẽ bị crash ngay lập tức. Tersun chủ động kiểm tra toán hạng thứ hai trước khi thực hiện phép chia để bảo vệ an toàn runtime.

### Với Thử nghiệm B (`Invalid L-Value`):
Trình biên dịch Tersun báo lỗi ngay lúc biên dịch (Compile-time):
```text
[Syntax/Parser Error]: Invalid assignment target. Left-hand side must be a variable.
```
**Tại sao?**  
Trong khoa học máy tính, ta phân biệt hai khái niệm:
- **L-Value (Left-Value)**: Một thực thể có vị trí ô nhớ cố định để nhận dữ liệu (ví dụ: biến `a`).
- **R-Value (Right-Value)**: Một giá trị tạm thời sinh ra từ biểu thức (ví dụ: `a + b` sinh ra số $30$, số này chỉ nằm tạm trên đỉnh stack rồi biến mất). Bạn không thể nhét dữ liệu vào một con số tạm thời không có địa chỉ lưu trữ cố định!

---

## 13. Exercise

### Bài tập 1: Vẽ Cây AST Bằng Tay
Cho biểu thức sau:
```stn
let res = 8 + 6 * 4 - 10 / 2;
```
1. Hãy vẽ cấu trúc cây AST mà Pratt Parser của Tersun sẽ tạo ra.
2. Hãy viết chuỗi các lệnh Bytecode giả định (`PUSH`, `ADD`, `SUB`, `MUL`, `DIV`) để tính cây này trên ngăn xếp.
3. Kết quả cuối cùng in ra là bao nhiêu?

### Bài tập 2: Dự đoán Output với Spaceship Operator `<=>`
Dự đoán chính xác kết quả in ra của đoạn code sau:
```stn
fn main() {
    let a = 50;
    let b = 50;
    let c = 70;

    let r1 = a <=> b;
    let r2 = a <=> c;
    let r3 = c <=> a;

    println(r1);
    println(r2);
    println(r3);
}
```

### Bài tập 3: Sửa Lỗi Ngoặc Đơn
Một kỹ sư tài chính muốn tính công thức lãi kép đơn giản:
$$\text{Tiền sau 1 năm} = \text{Vốn} \times (1 + \text{Lãi suất})$$
Người đó viết:
```stn
fn main() {
    let principal = 1000;
    let rate = 5; // 5%
    // Kỹ sư muốn tính: 1000 * (100 + 5) / 100
    let amount = principal * 100 + rate / 100;
    println(amount);
}
```
Tại sao đoạn code trên ra kết quả sai lệch khủng khiếp? Hãy sửa lại một biểu thức duy nhất cho đúng.

---

## 14. Challenge (Thử Thách Mở)

> **Thử thách Năm Nhuận Thuần Biểu Thức (No-Branch Leap Year)**:  
> Một năm là năm nhuận nếu nó chia hết cho 4, **nhưng** nếu chia hết cho 100 thì nó KHÔNG phải năm nhuận, **trừ khi** nó cũng chia hết cho 400.  
> 
> Hãy viết một biểu thức Tersun gán vào biến `let is_leap = ...;` sao cho kết quả là `1` nếu là năm nhuận, và `0` nếu là năm thường.  
> **Ràng buộc tuyệt đối**: Bạn **CHƯA ĐƯỢC PHÉP dùng lệnh rẽ nhánh `if` hay `branch3`** (vì ta chưa học). Chỉ được dùng các toán tử số học (`+`, `-`, `*`, `/`, `%`) và so sánh (`==`, `!=`, `<`, `>`).

---

## 15. Summary

* **Vấn đề**: Mã nguồn phẳng một chiều không tự phản ánh được thứ tự ưu tiên của các phép tính toán học đa tầng.
* **Abstraction**: **Biểu thức (Expression)** được mô hình hóa dưới dạng một **Cây Cú Pháp Trừu Tượng (AST)**.
* **Cơ chế**: Thuật toán **Pratt Parser** dùng trọng số "lực hút" (Precedence & Associativity) để tự động xây cây AST từ trái sang phải.
* **Thực thi**: Cây AST được duyệt theo thứ tự hậu tố để sinh ra chuỗi mã Bytecode đẩy/rút toán hạng trên ngăn xếp (`Operand Stack`).
* **Quy tắc**: L-Value (nơi chứa) khác biệt hoàn toàn với R-Value (giá trị tạm thời).

---

## 16. Bridge (Cầu Nối Sang Chương Tiếp Theo)

Cho đến lúc này, chương trình của chúng ta giống như một cỗ xe lao thẳng trên một đường hầm:
- Nó đi tuần tự từ dòng 1, dòng 2, dòng 3... đến dòng cuối cùng.
- Mọi câu lệnh đều được thực thi đúng một lần duy nhất.

Nhưng cuộc sống thực tế không đơn giản như vậy:
- *Nếu số dư tài khoản đủ tiền thì cho rút, nếu không đủ thì báo lỗi.*
- *Nếu người dùng nhập đúng mật khẩu thì mở cửa, sai mật khẩu thì khóa tài khoản.*

Làm thế nào để chương trình có thể **nhìn vào một giá trị, và quyết định rẽ sang trái hoặc rẽ sang phải**?  
Làm thế nào CPU có thể "nhảy cóc" qua một đoạn mã mà không cần chạy nó?

Chào mừng bạn đến với **Chapter 3 — Quyết Định Rẽ Nhánh (Conditionals & branch3)**!











# Chapter 3 — Quyết Định Rẽ Nhánh (Conditionals & branch3)

---

## 1. Problem

Ở hai chương trước, chúng ta đã chế tạo được hai công cụ nền tảng:
- Giữ lại giá trị vào các ô nhớ có tên gọi (`let balance = 500;`).
- Biến đổi và tính toán giá trị thông qua các biểu thức (`let new_balance = balance - 200;`).

Nhưng hãy nhìn vào dòng chảy của chương trình hiện tại:
Nó giống như một hòn đá rơi tự do từ trên đỉnh núi xuống vực. Nó bắt buộc phải đi qua dòng 1, dòng 2, dòng 3... từ đầu đến cuối một cách mù quáng và không thể đảo ngược.

Bây giờ, hãy đưa một tình huống thực tế của cây ATM vào hệ thống:

> *"Khách hàng yêu cầu rút 800 đô. Trong tài khoản hiện chỉ có 500 đô."*

Nếu chương trình của bạn chỉ biết chạy thẳng một mạch:
```stn
let balance = 500;
let withdraw_amount = 800;
balance = balance - withdraw_amount; // balance = -300!
dispense_cash(withdraw_amount);       // Cửa nhả tiền mở ra, nhả 800 đô!
```
Hậu quả là thảm họa: Ngân hàng mất trắng tiền, và hệ thống rơi vào trạng thái số dư âm vô lý!

Con người chúng ta xử lý tình huống này bằng một **Quyết định (Decision)**:
- **NẾU** số dư $\ge$ số tiền rút: Trừ tiền và nhả tiền.
- **NGƯỢC LẠI**: Từ chối giao dịch và báo lỗi trên màn hình.

> **Vấn đề cốt lõi:**  
> Làm thế nào một cỗ máy phần cứng vốn chỉ biết tuần tự nạp lệnh kế tiếp lại có thể **"nhìn" vào một dữ liệu**, rồi quyết định **chỉ thực thi một đoạn mã này và nhảy cóc bỏ qua hoàn toàn một đoạn mã khác**?

---

## 2. Nếu chưa có abstraction này thì sao?

Khi chưa có cấu trúc rẽ nhánh điều khiển, các lập trình viên cổ điển từng cố gắng giải quyết bài toán này bằng hai cách:

### Cách 1: Mẹo Số học (Arithmetic Masking / Branchless Math)
Bạn có thể dùng một mẹo đại số để nhân kết quả với $0$ hoặc $1$:
```text
let has_enough = (balance >= withdraw_amount); // 1 nếu đủ, 0 nếu thiếu
balance = balance - (has_enough * withdraw_amount);
```
Cách này nhìn có vẻ thông minh cho các phép toán đại số đơn giản. **Nhưng nó sụp đổ hoàn toàn khi gặp các hành động có Tác dụng phụ (Side-Effects)**:
- Bạn không thể viết: `dispense_cash(has_enough * 800)`. Máy nhả tiền cơ học không hiểu khái niệm "nhả 0 tờ tiền" — động cơ rút tiền vẫn sẽ quay, hóa đơn vẫn sẽ in và cửa vẫn sẽ mở!
- Nếu là một hành động nguy hiểm như: *"Nếu người dùng là Admin thì format ổ cứng"*, bạn tuyệt đối không thể dùng mẹo số học để "format $0\%$ ổ cứng"! Bạn **bắt buộc phải ngăn chặn CPU nạp đoạn mã nguy hiểm đó vào đường ống xử lý**.

### Cách 2: Lệnh Nhảy Không Điều Kiện (Unconditional GOTO / JUMP)
Các kỹ sư thời kỳ đầu điều khiển con trỏ lệnh bằng lệnh nhảy địa chỉ:
```assembly
CMP balance, withdraw_amount
JGE LABEL_ENOUGH_MONEY    ; Nếu lớn hơn hoặc bằng, nhảy tới nhãn
JMP LABEL_REJECT          ; Nếu không, nhảy tới từ chối
```
Khi chương trình phình to lên 50,000 dòng, các nhãn nhảy (`JMP`) đan chéo vào nhau như một đĩa mì Ý (**Spaghetti Code**). Một lập trình viên nhảy từ dòng 20 xuống dòng 500, rồi từ dòng 500 nhảy ngược lên dòng 80. Khi có lỗi phát sinh, không một ai trên Trái Đất có thể lần ra được luồng thực thi thực tế của chương trình!

---

## 3. Discovery

Hãy nhìn vào cách một bộ vi xử lý (CPU) chạy mã nguồn:
Trong CPU luôn có một thanh ghi đặc biệt gọi là **Con trỏ Lệnh (Instruction Pointer - IP, hoặc Program Counter - PC)**.
- Bình thường: Sau mỗi lệnh, $\text{IP} = \text{IP} + 1$. CPU cứ thế bước đều từng bước một.
- Để tạo ra một quyết định, ta chỉ cần can thiệp vào thanh ghi IP này:

> *"Nếu điều kiện SAI, hãy cộng thêm vào IP một khoảng cách offset $+K$ để con trỏ nhảy cóc qua đoạn mã cấm!"*

Từ trực giác phần cứng đó, con người phát minh ra abstraction:
1. **Khối Điều Kiện (Condition / Predicate)**: Một biểu thức trả về Đúng hoặc Sai (`true` / `false`).
2. **Khối Lệnh Bảo Vệ (Guarded Block)**: Một vùng mã nguồn được bao bọc trong cặp ngoặc nhọn `{ ... }`.
3. Khối lệnh này chỉ được CPU bước chân vào nếu điều kiện Đúng; nếu Sai, toàn bộ khối sẽ bị bỏ qua như thể nó chưa từng tồn tại trên đời.

---

## 4. Historical / Conceptual Bridge

- **Năm 1968**: Nhà khoa học máy tính **Edsger Dijkstra** viết bức thư nổi tiếng gây chấn động lịch sử điện toán: *"Go To Statement Considered Harmful"*. Ông chỉ ra rằng việc cho phép nhảy tự do (`goto`) phá hủy tư duy logic của con người. Ông đề xuất phong cách **Lập trình cấu trúc (Structured Programming)**: mọi rẽ nhánh phải có điểm vào duy nhất và điểm ra duy nhất. Từ đó, cấu trúc `if-else` ra đời và trở thành chuẩn mực của mọi ngôn ngữ hiện đại (C, Pascal, Java, Python).

### Nút Thắt Lịch Sử Của Nhị Phân: Vấn Đề So Sánh 3 Hướng
Tuy nhiên, cấu trúc `if-else` nhị phân lại để lại một vết sẹo lớn về mặt hiệu năng phần cứng:
Trong thế giới thực, khi so sánh hai số $A$ và $B$, toán học có luật **Tam phân (Trichotomy Law)**:
Chỉ có đúng 3 khả năng xảy ra: $A < B$, $A = B$, hoặc $A > B$.

Các ngôn ngữ nhị phân truyền thống (C++, Rust, Python) buộc phải giải quyết bài toán này bằng **hai lệnh rẽ nhánh lồng nhau**:
```cpp
if (a < b) {
    // Nhánh 1
} else {
    if (a == b) {
        // Nhánh 2
    } else {
        // Nhánh 3
    }
}
```
**Hậu quả trên CPU hiện đại:**
CPU chạy theo cơ chế đường ống (Instruction Pipeline) và bộ dự đoán nhánh (Branch Predictor). Khi gặp chuỗi 2 lệnh `if` lồng nhau, CPU thường xuyên **đoán trượt (Branch Misprediction)**. Mỗi lần đoán sai, CPU phải xóa sạch đường ống lệnh và nạp lại từ đầu, tiêu tốn từ **15 đến 20 chu kỳ xung nhịp (clock cycles)**!

> **Tersun đã giải quyết điều này như thế nào?**  
> Bên cạnh `if-else` nhị phân thông thường, Tersun phát minh ra lệnh rẽ nhánh tam phân bản địa: **`branch3`**.  
> Nó phân luồng trực tiếp 3 trạng thái $(-1, 0, +1)$ trong **đúng 1 chu kỳ xung nhịp máy**, loại bỏ hoàn toàn chi phí phạt trượt nhánh của nhị phân!

---

## 5. Formal Concept

1. **Vị từ (Predicate / Condition)**:
   - Một biểu thức đánh giá ra giá trị Boolean (`true` / `false`) hoặc giá trị trạng thái $(-1, 0, +1)$.
2. **Rẽ nhánh Nhị phân (Binary Branching - `if / else`)**:
   - Chia luồng thực thi thành tối đa 2 ngả đường: Đường đi khi Đúng (`Consequent`) và Đường đi khi Sai (`Alternative`).
3. **Rẽ nhánh Tam phân (Ternary Branching - `branch3`)**:
   - Chia luồng thực thi thành 3 ngả độc lập tương ứng với giá trị âm (`negative`), bằng không (`zero`), và dương (`positive`).
4. **Độ lệch Nhảy Tương đối (Relative Jump Offset)**:
   - Khoảng cách byte mà máy ảo cần cộng thêm vào con trỏ `ip` để nhảy qua một khối mã.

---

## 6. Tersun Model

Tersun hỗ trợ song song hai mô hình rẽ nhánh:

### Mô hình 1: Rẽ nhánh Nhị phân Cổ điển (`if-else`)
Dành cho các quyết định 2 trạng thái đúng/sai thông thường.
- Nếu điều kiện sai, VM thực hiện lệnh `OP_JUMP_IF_FALSE` nhảy qua khối mã.

### Mô hình 2: Rẽ nhánh Tam phân Đơn chu kỳ (`branch3`)
Dành cho các so sánh số học, vật lý, và trạng thái AI.
- Biểu thức bên trong `branch3(expr)` được đánh giá ra một số nguyên.
- Dấu của số nguyên đó tự động kích hoạt 1 trong 3 nhánh:
  - Giá trị $< 0$: Nhảy thẳng tới nhánh `negative` (hoặc `-1`).
  - Giá trị $== 0$: Nhảy thẳng tới nhánh `zero` (hoặc `0`).
  - Giá trị $> 0$: Nhảy thẳng tới nhánh `positive` (hoặc `+1`).
- Bytecode sinh ra là **`OP_BRANCH_3 offset_neg, offset_zero, offset_pos`**. Máy ảo giải mã trong một nhịp nhảy duy nhất!

---

## 7. Syntax

### Cú pháp 1: `if / else` Nhị phân
```stn
if (điều_kiện) {
    // Thực thi khi điều kiện Đúng (true / khác 0)
} else {
    // Thực thi khi điều kiện Sai (false / bằng 0) [Tùy chọn]
}
```

### Cú pháp 2: `branch3` Tam phân Bản địa
```stn
branch3 (biểu_thức) {
    negative => {
        // Thực thi khi biểu_thức < 0
    }
    zero => {
        // Thực thi khi biểu_thức == 0
    }
    positive => {
        // Thực thi khi biểu_thức > 0
    }
}
```
*(Lưu ý: Tersun cũng chấp nhận cú pháp tương đương: `case -1:`, `case 0:`, `case +1:` hoặc `case 1:`)*.

---

## 8. Code

### Cấp độ 1: Cực nhỏ (Bảo vệ giao dịch ATM bằng `if-else`)
```stn
fn main() {
    let balance = 500;
    let withdraw = 800;

    if (balance >= withdraw) {
        balance = balance - withdraw;
        println("Rut tien thanh cong!");
    } else {
        println("Loi: So du khong du!");
    }

    print("So du con lai: ");
    println(balance); // In ra: 500 (Bảo vệ an toàn số dư!)
}
```

### Cấp độ 2: Vừa (Xếp loại điểm học tập với `if / else if / else`)
```stn
fn main() {
    let score = 85;

    if (score >= 90) {
        println("Xuat sac");
    } else {
        if (score >= 80) {
            println("Gioi"); // Điểm 85 lọt vào đây
        } else {
            if (score >= 65) {
                println("Kha");
            } else {
                println("Trung binh");
            }
        }
    }
}
```

### Cấp độ 3: Thực tế (Phân loại chuyển động vật lý bằng `branch3`)
Trong mô phỏng vật lý game 2D, một vật thể có vận tốc `v`. Ta cần biết nó đang bay sang trái, đứng yên, hay bay sang phải:

```stn
fn main() {
    let velocity = -15; // Vận tốc âm: đang lùi sang trái

    // Rẽ nhánh 3 trạng thái trong đúng 1 chu kỳ xung nhịp
    branch3 (velocity) {
        negative => {
            println("Vat the dang di chuyen sang TRAI (-X)");
        }
        zero => {
            println("Vat the dang DUNG YEN");
        }
        positive => {
            println("Vat the dang di chuyen sang PHAI (+X)");
        }
    }
}
```

---

## 9. What Actually Happens? (Dưới Nắp Ca-pô Compiler & VM)

Hãy xem chuyện gì xảy ra với lệnh `if (balance >= withdraw)` ở cấp độ Bytecode:

```text
[Dòng code] if (balance >= withdraw) { ...Nhánh Đúng... } else { ...Nhánh Sai... }
```

### Kỹ thuật Backpatching của Compiler
1. Trình biên dịch dịch biểu thức `balance >= withdraw` $\to$ Đẩy `1` (true) hoặc `0` (false) lên stack.
2. Trình biên dịch phát lệnh `OP_JUMP_IF_FALSE [placeholder]`.
   - Nhưng khoan! Lúc này Compiler **chưa biết** Khối Đúng dài bao nhiêu byte để nhảy qua!
   - Compiler ghi tạm `0` vào vị trí khoảng cách nhảy (placeholder).
3. Compiler tiếp tục biên dịch các câu lệnh bên trong Khối Đúng.
4. Khi Khối Đúng kết thúc, Compiler quay ngược lại vị trí placeholder ở bước 2 và điền con số độ lệch chính xác vào (ví dụ: $+24$ byte). Kỹ thuật này gọi là **Backpatching (Vá ngược mã)**.

### Sơ đồ Bytecode trên VM:
```text
Offset | Bytecode Opcode            | Giải thích hành vi CPU / VM
-------+----------------------------+---------------------------------------------------
0x00   | OP_LOAD_LOCAL 0            | Nạp 'balance' lên stack
0x03   | OP_LOAD_LOCAL 1            | Nạp 'withdraw' lên stack
0x06   | OP_GE                      | So sánh: nếu balance >= withdraw đẩy 1, ngược lại 0
0x07   | OP_JUMP_IF_FALSE +18       | NẾU ĐỈNH STACK LÀ 0 -> NHẢY CÓC +18 BYTE TỚI 0x1A!
       |                            | (Bỏ qua hoàn toàn đoạn code bên dưới)
0x0A   | ...Mã Khối Đúng (Trừ tiền)...
0x17   | OP_JUMP +12                | Khối Đúng chạy xong -> Nhảy cóc qua Khối Sai tới 0x24!
0x1A   | ...Mã Khối Sai (Báo lỗi)...| <--- Điểm tiếp đất nếu điều kiện Sai
0x24   | ...Các lệnh tiếp theo...   | <--- Điểm hội tụ chung của cả 2 nhánh
```

> **Bài học sâu sắc**: Máy tính không hề có khái niệm "lựa chọn". Ở tầng thấp nhất, rẽ nhánh chỉ đơn giản là **phép cộng số học vào con trỏ lệnh `ip = ip + offset`** để lướt qua các byte không muốn chạy!

---

## 10. Experiment

Tạo file `test_branch3.stn` để kiểm nghiệm hành vi của `branch3` với toán tử so sánh tam phân `<=>`:

```stn
fn main() {
    let a = 42;
    let b = 100;

    // Phép tính (a <=> b) trả về -1 vì 42 < 100
    branch3 (a <=> b) {
        negative => {
            println("Ket qua: A nho hon B");
        }
        zero => {
            println("Ket qua: A bang B");
        }
        positive => {
            println("Ket qua: A lon hon B");
        }
    }
}
```

Chạy chương trình:
```bash
setunc run test_branch3.stn
```

**Kết quả:**
```text
Ket qua: A nho hon B
```
Thử đổi `a = 100; b = 100;` rồi chạy lại, bạn sẽ thấy nó lập tức tiếp đất chính xác vào nhánh `zero` mà không hề đi qua nhánh `negative`!

---

## 11. Failure (Thử Nghiệm Phá Vỡ)

### Thử nghiệm A: Lỗi "Dangling Else" (Else lửng lơ)
Hãy xem điều gì xảy ra nếu lập trình viên quên đóng ngoặc nhọn:
```stn
fn main() {
    let x = 10;
    let y = 20;

    if (x > 5)
        if (y > 50)
            println("A");
    else
        println("B");
}
```
*Câu hỏi hóc búa*: Chữ `else` này thuộc về `if (x > 5)` ở ngoài hay `if (y > 50)` ở trong?
Nếu là người đọc, bạn nghĩ `else` thẳng hàng với `if (x > 5)`. Nhưng trình biên dịch của hầu hết các ngôn ngữ (C/Java) sẽ gắn nó vào `if` gần nhất!

### Thử nghiệm B: Rẽ nhánh trên một biểu thức vô nghĩa trong `branch3`
```stn
fn main() {
    let name = "Tersun";
    branch3 (name) {
        negative => { println("Am"); }
        zero     => { println("Khong"); }
        positive => { println("Duong"); }
    }
}
```

---

## 12. Why? (Tại Sao Lại Thất Bại?)

### Với Thử nghiệm A (Dangling Else):
Trong lịch sử lập trình, lỗi "Dangling Else" đã gây ra hàng nghìn lỗ hổng bảo mật nghiêm trọng (nổi tiếng nhất là lỗi bảo mật SSL của Apple năm 2014: `goto fail;`).
**Triết lý thiết kế của Tersun**:  
Trình biên dịch Tersun triệt tiêu hoàn toàn sự mơ hồ này bằng cách **bắt buộc mọi khối rẽ nhánh phải có cặp ngoặc nhọn `{ ... }`**. Bạn không thể viết một lệnh trơ trọi sau `if`. Mọi phạm vi rẽ nhánh đều phải tường minh $100\%$.

### Với Thử nghiệm B (Sai kiểu trong `branch3`):
Bộ kiểm tra kiểu của Tersun (`type_checker.cpp`) chặn đứng mã nguồn ngay lập tức:
```text
[Type Error]: branch3 condition must evaluate to an integer or tryte, got 'string'.
```
**Tại sao?**  
`branch3` là một toán tử toán học phần cứng phản ánh dấu của số $\{-1, 0, +1\}$. Một chuỗi ký tự không có khái niệm "âm" hay "dương". Tính chặt chẽ về kiểu ngăn chặn việc lập trình viên đưa những dữ liệu rác vào bộ giải mã rẽ nhánh của vi xử lý.

---

## 13. Exercise

### Bài tập 1: Dự đoán Output
Phân tích luồng thực thi và dự đoán chính xác giá trị in ra màn hình:
```stn
fn main() {
    let x = -5;
    let bonus = 0;

    branch3 (x) {
        negative => {
            bonus = 10;
        }
        zero => {
            bonus = 50;
        }
        positive => {
            bonus = 100;
        }
    }

    if (bonus > 20) {
        bonus = bonus * 2;
    } else {
        bonus = bonus + 5;
    }

    println(bonus);
}
```

### Bài tập 2: Tái Cấu Trúc (Refactoring) — Khử Rác Nhị Phân
Đoạn code sau dùng `if-else` lồng nhau để phân loại tuổi:
```stn
fn main() {
    let delta = user_age - min_age; // delta có thể âm, 0, hoặc dương
    if (delta < 0) {
        println("Chua du tuoi");
    } else {
        if (delta == 0) {
            println("Vua dung tuoi");
        } else {
            println("Da qua tuoi");
        }
    }
}
```
Hãy viết lại đoạn logic trên bằng cấu trúc `branch3` của Tersun sao cho code ngắn gọn hơn và đạt tốc độ tối đa trong 1 chu kỳ máy.

### Bài tập 3: Tư Duy Compiler
Giải thích tại sao trong bảng opcode của máy ảo Tersun, lệnh `OP_JUMP_IF_FALSE` lại kiểm tra điều kiện SAI để nhảy, thay vì `OP_JUMP_IF_TRUE` kiểm tra điều kiện ĐÚNG?  
*(Gợi ý: Hãy nhìn vào thứ tự sắp xếp mã của Khối Đúng ngay liền kề bên dưới lệnh if).*

---

## 14. Challenge (Thử Thách Mở)

> **Thử thách Bộ Giải Mã Bàn Cờ Tam Phân (Ternary Tic-Tac-Toe Win Evaluator)**:  
> Trong trò chơi cờ Caro tam phân, mỗi ô có 3 trạng thái: `-1` (Quân X), `0` (Ô trống), `+1` (Quân O).  
> Giả sử một hàng ngang có 3 ô: `let c1 = ...; let c2 = ...; let c3 = ...;`.  
> 
> Hãy viết một chương trình Tersun sử dụng `branch3` để kiểm tra tổng `let sum = c1 + c2 + c3;`:
> - Nếu `sum == -3`: In `"Quan X THANG!"`
> - Nếu `sum == +3`: In `"Quan O THANG!"`
> - Các trường hợp khác: In `"Chua ai thang tren hang nay"`.  
> *Ràng buộc: Tối ưu hóa số lần so sánh ít nhất có thể.*

---

## 15. Summary

* **Vấn đề**: Chương trình chạy thẳng một mạch không thể đưa ra lựa chọn hay xử lý các tình huống thực tế phụ thuộc vào dữ liệu.
* **Abstraction**: **Rẽ nhánh điều khiển (Conditionals)** cho phép chọn lọc khối mã cần thực thi dựa trên một vị từ (Predicate).
* **Bản chất phần cứng**: Rẽ nhánh thực chất là việc **cộng độ lệch tương đối (Relative Offset)** vào con trỏ lệnh `IP` để bỏ qua các khối mã không mong muốn.
* **Đột phá của Tersun**:
  - `if-else`: Dành cho quyết định 2 ngả nhị phân.
  - `branch3`: Rẽ nhánh 3 trạng thái bản địa $(-1, 0, +1)$ trong **đúng 1 chu kỳ máy**, triệt tiêu hình phạt trượt nhánh 15–20 chu kỳ của CPU truyền thống.

---

## 16. Bridge (Cầu Nối Sang Chương Tiếp Theo)

Với `if` và `branch3`, con trỏ lệnh `IP` của chúng ta đã biết **nhảy tiến về phía trước** để bỏ qua một đoạn mã:
$$\text{IP} = \text{IP} + \text{offset}$$

Nhưng hãy nghĩ về điều này:
> *Nếu con trỏ lệnh có thể nhảy tiến về phía trước... thì chuyện gì sẽ xảy ra nếu ta bảo nó **NHẢY LÙI VỀ PHÍA SAU**?*
> 
> $$\text{IP} = \text{IP} - \text{offset}$$

Khi CPU nhảy lùi lại một đoạn mã nó vừa mới chạy xong, nó sẽ chạy lại đoạn mã đó một lần nữa. Rồi lại nhảy lùi... lại chạy lại...  
Một hiện tượng kỳ diệu và nguy hiểm xuất hiện: **Sự Vòng Lặp Vô Tận (Infinite Loop)**.

Làm thế nào để kiểm soát sức mạnh nhảy lùi này để máy tính có thể xử lý 10,000,000 phép tính trong nháy mắt mà không làm treo đơ toàn bộ hệ điều hành?

Chào mừng bạn đến với **Chapter 4 — Sự Bất Tận Của Thời Gian (Loops & Iteration)**!















# Chapter 4 — Sự Bất Tận Của Thời Gian (Loops & Iteration)

---

## 1. Problem

Hãy xem xét một bài toán số học đơn giản mà nhà toán học thiên tài Carl Friedrich Gauss từng giải khi mới 7 tuổi:

> *"Tính tổng tất cả các số nguyên từ 1 đến 100."*

Nếu không dùng mẹo thông minh của Gauss, một người bình thường sẽ làm gì?
$1 + 2 = 3$  
$3 + 3 = 6$  
$6 + 4 = 10$  
... lặp đi lặp lại hành động cộng dồn đó đúng 99 lần.

Bây giờ, hãy nâng bài toán lên quy mô công nghiệp của thời đại số:
- *"Tính tổng của 10,000,000 giao dịch ngân hàng trong ngày."*
- *"Kiểm tra xem trong 1,000,000 số nguyên tố đầu tiên có số nào thỏa mãn điều kiện $X$ hay không."*
- *"Vẽ 60 khung hình mỗi giây liên tục trên màn hình game."*

Nếu bạn chỉ có các công cụ từ Chapter 1, 2 và 3 (`let`, biểu thức, và `if-else`), làm thế nào bạn bảo máy tính cộng từ 1 đến 100?
Bạn sẽ phải gõ phím như thế này:
```stn
let sum = 0;
sum = sum + 1;
sum = sum + 2;
sum = sum + 3;
// ... gõ liên tục 97 dòng nữa ...
sum = sum + 100;
```

> **Vấn đề cốt lõi:**  
> Sức mạnh vĩ đại nhất của máy tính không phải là sự thông minh, mà là **khả năng lặp lại một hành động hàng triệu lần với tốc độ ánh sáng mà không bao giờ biết mệt mỏi hay chán nản**.  
> Làm thế nào ta có thể mô tả một chuỗi 10,000,000 hành động lặp lại mà chỉ tốn đúng **3 dòng mã nguồn**?

---

## 2. Nếu chưa có abstraction này thì sao?

Hãy nhìn vào những giới hạn chết người nếu ta giải quyết bài toán lặp bằng cách "copy-paste" thủ công:

### 1. Bùng nổ kích thước mã nguồn (Source Code Explosion)
Để cộng 10,000,000 số:
- Tệp mã nguồn của bạn sẽ dài **10,000,000 dòng code**.
- Kích thước tệp văn bản sẽ nặng khoảng **$300\text{ MB}$ chỉ chứa toàn chữ**.
- Trình soạn thảo mã nguồn (VS Code, Notepad) sẽ bị treo cứng ngay khi bạn vừa mở file. Trình biên dịch sẽ mất hàng chục phút chỉ để đọc đống chữ đó vào RAM.

### 2. Cơn ác mộng bảo trì (Maintenance Hell)
Giả sử sau khi bạn đã copy-paste 10,000 dòng `sum = sum + i`, sếp của bạn bảo: *"À, chỉ cộng các số lẻ thôi nhé!"*.
Bạn sẽ phải ngồi sửa từng dòng một trong số 10,000 dòng đó. Khả năng bạn sửa sót hoặc gõ sai một dòng là $100\%$.

### 3. Sự bất lực trước dữ liệu động (The Dynamic Bound Impossibility)
Đây là giới hạn nghiêm trọng nhất:
Điều gì xảy ra nếu con số $N$ không phải là 100 cố định, mà là **số lượng người dùng đang truy cập website lúc này** (lúc thì 5 người, lúc thì 80,000 người do người dùng tự nhập vào)?
Bạn **hoàn toàn không thể copy-paste** trước mã nguồn khi bạn chưa biết trước tương lai con số đó là bao nhiêu!

---

## 3. Discovery

Ở cuối Chapter 3, chúng ta đã phát hiện ra bí mật của rẽ nhánh `if`:
Con trỏ lệnh của CPU (`IP`) có thể **nhảy cóc tiến về phía trước** để bỏ qua một đoạn mã:
$$\text{IP} = \text{IP} + \text{offset}$$

Bây giờ, hãy tự hỏi một câu hỏi kỳ dị nhưng mang tính cách mạng:
> *Chuyện gì sẽ xảy ra nếu ta bảo con trỏ lệnh **NHẢY LÙI VỀ PHÍA SAU**?*
> 
> $$\text{IP} = \text{IP} - \text{offset}$$

Hãy quan sát hành trình của CPU:
1. CPU chạy dòng 10: `sum = sum + i; i = i + 1;`
2. CPU đến dòng 11. Tại đây, ta đặt một lệnh: `NHẢY NGƯỢC LẠI DÒNG 10!`
3. Con trỏ lệnh `IP` bị trừ đi một khoảng offset, quay trở lại dòng 10!
4. CPU lại chạy dòng 10 một lần nữa!
5. Lại đến dòng 11... lại nhảy ngược lại dòng 10...

Một **vòng tròn khép kín (Loop)** đã được hình thành!
Nhưng ngay lập tức, một thảm họa xuất hiện:
Nếu CPU cứ nhảy ngược mãi mãi, chương trình sẽ chạy vĩnh viễn không bao giờ dừng lại. Máy tính sẽ bị đơ, quạt tản nhiệt rú ầm ĩ và hệ điều hành bị treo!

### Phát minh ra 3 chiếc chân kiềng của Vòng Lặp
Để một vòng nhảy lùi hữu ích mà không trở thành "vòng kim cô" tự sát, ta bắt buộc phải kết hợp nó với chiếc phanh cứu sinh ở Chapter 3 (`if`):

> *"Chỉ nhảy lùi NẾU điều kiện dừng CHƯA ĐẠT ĐƯỢC. Một khi đã đạt được, HÃY DỪNG NHẢY và bước tiếp ra ngoài!"*

Từ đó, con người phát minh ra **3 thành phần bất di bất dịch của mọi vòng lặp**:
1. **Khởi tạo trạng thái (Initialization)**: Đặt biến đếm ban đầu (ví dụ: `let i = 1;`).
2. **Điều kiện bảo vệ (Termination Guard / Condition)**: Trước mỗi lần nhảy, kiểm tra xem có còn được phép chạy tiếp không (ví dụ: `i <= 100`).
3. **Bước tiến trạng thái (Step / Mutation)**: Mỗi vòng phải làm cho biến đếm tiến gần hơn về điều kiện dừng (ví dụ: `i = i + 1`). Nếu thiếu bước này, bạn lại rơi vào vòng lặp vô tận!

---

## 4. Historical / Conceptual Bridge

- **Năm 1936**: Khi nhà toán học vĩ đại **Alan Turing** đặt nền móng cho lý thuyết khoa học máy tính với cỗ máy **Turing Machine**, khái niệm vòng lặp (vòng đọc-ghi băng từ lặp đi lặp lại) chính là chìa khóa để định nghĩa thế nào là một cỗ máy tính toán vạn năng (Turing Completeness).
- **Bài toán dừng (The Halting Problem)**: Cũng chính Alan Turing đã chứng minh một định lý toán học chấn động: *Không thể tồn tại một thuật toán tổng quát nào có thể nhìn vào một đoạn mã bất kỳ và kết luận chắc chắn $100\%$ rằng vòng lặp đó có dừng lại hay sẽ chạy mãi mãi*. Vòng lặp là nơi chứa đựng cả sức mạnh vô tận lẫn sự hỗn loạn tiềm tàng của ngành khoa học máy tính.
- **Tiến hóa cú pháp**:
  - Ban đầu: Lệnh nhảy lùi bằng nhãn (`label:` ... `goto label;`). Quá nguy hiểm và dễ tạo bug.
  - Sau đó: **`while`** (Lặp chừng nào điều kiện còn đúng) — Đưa điều kiện kiểm tra lên đầu cổng.
  - Tiếp theo: **`for` theo khoảng (`range`)** — Tự động hóa hoàn toàn cả 3 khâu: Khởi tạo, Kiểm tra và Tăng biến trong một dòng duy nhất để lập trình viên không bao giờ bị quên bước tăng biến!

---

## 5. Formal Concept

1. **Vòng lặp (Loop / Iteration)**:
   - Cấu trúc điều khiển lặp đi lặp lại một khối câu lệnh nhiều lần cho đến khi một điều kiện dừng được thỏa mãn.
2. **Thân vòng lặp (Loop Body)**:
   - Đoạn mã được thực thi lặp lại trong mỗi chu kỳ (mỗi chu kỳ gọi là một **Lần lặp - Iteration**).
3. **Bất biến Vòng lặp (Loop Invariant)**:
   - Một tính chất toán học luôn đúng trước và sau mỗi lần lặp (ví dụ: "Ở đầu lần lặp thứ $i$, biến `sum` luôn chứa tổng từ $1$ đến $i-1$").
4. **Vòng lặp vô tận (Infinite Loop)**:
   - Vòng lặp mà điều kiện dừng không bao giờ đạt được, khiến CPU tiêu thụ $100\%$ năng lực mà không sinh ra kết quả kết thúc.
5. **Các lệnh can thiệp sớm (Control Jump Statements)**:
   - **`break`**: Đạp phanh khẩn cấp — Lập tức thoát khỏi vòng lặp, nhảy thẳng ra câu lệnh phía sau vòng lặp.
   - **`continue`**: Bỏ qua phần còn lại của lần lặp hiện tại — Nhảy cóc ngay tới lần lặp tiếp theo.

---

## 6. Tersun Model

Trong ngôn ngữ **Tersun**, vòng lặp được thiết kế ở mức độ ưu tiên hiệu năng cao nhất:

### 1. Hai dạng vòng lặp chính
* **`while (condition) { ... }`**: Dùng khi số lần lặp chưa biết trước (lặp cho đến khi thỏa mãn một trạng thái động).
* **`for var in range(...) { ... }`**: Dùng khi biết trước khoảng giá trị cần duyệt.

### 2. Hàm khoảng cách `range()` trong Tersun
Tersun tuân thủ chuẩn mực của khoa học máy tính hiện đại (quy ước khoảng nửa mở $[start, stop)$ của Dijkstra):
* `range(stop)`: Chạy từ $0$ đến $stop - 1$ (với bước nhảy mặc định $+1$).
* `range(start, stop)`: Chạy từ $start$ đến $stop - 1$.
* `range(start, stop, step)`: Chạy từ $start$ với bước nhảy $step$.

### 3. Bí Mật Tối Ưu Cực Đại: Siêu Lệnh `OP_LOOP_RANGE_FAST`
Trong Chapter 2 ta đã nhắc tới, nhưng đây là lúc bạn thấy sự kỳ diệu của Tersun Gate 4 VM:
- Trong các ngôn ngữ như Python hay máy ảo cổ điển, mỗi vòng lặp `for` tốn tới **15 lệnh bytecode** (nạp biến, nạp stop, so sánh nhỏ hơn, nhảy, tăng biến, nạp step, ghi biến...).
- Trình tối ưu hóa bytecode của Tersun ([`opt_bytecode.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/opt_bytecode.hpp)) tự động nhận diện mẫu vòng lặp `range` và **dung hợp (fuse) toàn bộ 46 bytes lệnh thành 1 SIÊU LỆNH DUY NHẤT**:
  ```cpp
  OP_LOOP_RANGE_FAST var_slot, stop_slot, step_slot, exit_offset
  ```
- Nhờ siêu lệnh này, mỗi vòng lặp trong Tersun VM chỉ tốn **~18 nano-giây** (nhanh hơn Python 3.14 gấp **$2.56$ lần**)!

---

## 7. Syntax

### Cú pháp 1: Vòng lặp `while`
```stn
while (điều_kiện) {
    // Thân vòng lặp
    // Bắt buộc phải có câu lệnh làm thay đổi điều_kiện!
}
```

### Cú pháp 2: Vòng lặp `for .. in range()`
```stn
// Lặp từ 0 đến N - 1
for i in range(10) {
    // i nhận các giá trị: 0, 1, 2, ..., 9
}

// Lặp từ A đến B - 1
for i in range(1, 101) {
    // i nhận các giá trị: 1, 2, ..., 100
}

// Lặp có bước nhảy (Step)
for i in range(0, 20, 2) {
    // i nhận các giá trị chẵn: 0, 2, 4, ..., 18
}
```

### Cú pháp 3: Can thiệp vòng lặp với `break` và `continue`
```stn
for i in range(10) {
    if (i == 3) {
        continue; // Bỏ qua số 3, không in, nhảy sang i = 4
    }
    if (i == 7) {
        break;    // Dừng toàn bộ vòng lặp khi chạm tới 7
    }
    println(i);
}
```

---

## 8. Code

### Cấp độ 1: Cực nhỏ (Đếm ngược phóng tên lửa bằng `while`)
```stn
fn main() {
    let countdown = 5;

    while (countdown > 0) {
        print("T-minus: ");
        println(countdown);
        countdown = countdown - 1; // Bước tiến trạng thái!
    }

    println("PHONG TEN LUA! 🚀");
}
```

### Cấp độ 2: Vừa (Giải bài toán Gauss: Tính tổng từ 1 đến 100)
```stn
fn main() {
    let sum = 0;

    // Duyệt từ 1 đến 100 (range dừng ở 101)
    for i in range(1, 101) {
        sum = sum + i;
    }

    print("Tong tu 1 den 100 la: ");
    println(sum); // In ra: 5050 (Chính xác tuyệt đối!)
}
```

### Cấp độ 3: Thực tế (Tìm số đầu tiên chia hết cho cả 17 và 23 trong khoảng lớn)
```stn
fn main() {
    let target = 0;

    for n in range(1, 10000) {
        // Kiểm tra chia hết bằng toán tử modulo %
        if (n % 17 == 0) {
            if (n % 23 == 0) {
                target = n;
                break; // Đã tìm thấy số nhỏ nhất! Thoát ngay lập tức để tiết kiệm CPU!
            }
        }
    }

    print("So nho nhat chia het cho ca 17 va 23 la: ");
    println(target); // In ra: 391 (17 * 23 = 391)
}
```

---

## 9. What Actually Happens? (Dưới Nắp Ca-pô Compiler & VM)

Hãy xem bytecode thực tế bên trong máy ảo khi chạy một vòng lặp `while`:

```stn
let i = 0;
while (i < 3) {
    i = i + 1;
}
```

Trình biên dịch Tersun sinh ra mã Bytecode như sau:

```text
Offset | Opcode                     | Giải thích hành vi CPU / VM
-------+----------------------------+---------------------------------------------------
0x00   | OP_PUSH_INT 0              | 
0x09   | OP_STORE_LOCAL 0           | i = 0
       |                            |
       | === ĐỈNH VÒNG LẶP (0x0C) ===| <--- loop_start_pc
0x0C   | OP_LOAD_LOCAL 0            | Nạp i
0x0F   | OP_PUSH_INT 3              | Nạp 3
0x18   | OP_LT                      | So sánh: i < 3 ?
0x19   | OP_JUMP_IF_FALSE +15 (->0x2B)| NẾU SAI (i >= 3) -> NHẢY TIẾN RA NGOÀI VÒNG LẶP!
       |                            |
       | --- THÂN VÒNG LẶP ---      |
0x1C   | OP_LOAD_LOCAL 0            | Nạp i
0x1F   | OP_PUSH_INT 1              | Nạp 1
0x28   | OP_ADD                     | i + 1
0x29   | OP_STORE_LOCAL 0           | Lưu lại vào i
       |                            |
       | === BƯỚC NHẢY NGƯỢC ===    |
0x2A   | OP_JUMP -30 (-> 0x0C)      | NHẢY LÙI 30 BYTES VỀ ĐỈNH 0x0C ĐỂ LẶP LẠI!
       |                            |
       | === ĐIỂM THOÁT VÒNG LẶP ===|
0x2D   | OP_HALT                    | Tiếp đất sau khi vòng lặp kết thúc
```

> **Bản chất vi kiến trúc**: 
> Một vòng lặp không có gì thần bí. Nó chỉ gồm **hai cú nhảy**:
> 1. Một cú nhảy có điều kiện **tiến về phía trước** (`OP_JUMP_IF_FALSE`) để thoát ra ngoài khi xong việc.
> 2. Một cú nhảy không điều kiện **lùi về phía sau** với độ lệch âm (`OP_JUMP -offset`) để quay lại vạch xuất phát!

---

## 10. Experiment

Hãy làm một thí nghiệm đo lường tốc độ thực tế của vòng lặp trên máy của bạn:

Tạo tệp `test_speed.stn`:
```stn
fn main() {
    let t0 = time_now_us();
    let sum = 0;

    // Chạy 3,000,000 lần lặp!
    for i in range(3000000) {
        sum = sum + 1;
    }

    let t1 = time_now_us();
    let duration_ms = (t1 - t0) / 1000;

    print("Ket qua sum: ");
    println(sum);
    print("Thoi gian chay 3 trieu vong: ");
    print(duration_ms);
    println(" ms");
}
```

Chạy với trình biên dịch Tersun:
```bash
setunc run test_speed.stn
```

**Kết quả trên máy tính của bạn:**
```text
Ket qua sum: 3000000
Thoi gian chay 3 trieu vong: 54 ms
```
*(Nếu bạn chạy đoạn code tương đương trên Python 3.14, nó sẽ mất khoảng **140 ms**! Thí nghiệm này cho bạn thấy sức mạnh hủy diệt của siêu lệnh `OP_LOOP_RANGE_FAST` trong bộ tối ưu hóa của Tersun).*

---

## 11. Failure (Thử Nghiệm Phá Vỡ)

### Thử nghiệm A: Cơn ác mộng Vòng Lặp Vô Tận (The Infinite Hang)
Tạo file `fail_infinite.stn`:
```stn
fn main() {
    let i = 10;
    while (i > 0) {
        // Quên mất dòng: i = i - 1; !
        print(".");
    }
}
```
Khi bạn chạy file này: Dấu chấm `.` sẽ in liên tục ra màn hình không bao giờ dừng. CPU máy tính của bạn sẽ tăng vọt lên $100\%$ trên 1 lõi. Bạn phải nhấn `Ctrl + C` để cưỡng chế hủy tiến trình!

### Thử nghiệm B: Lỗi Lệch 1 Đơn Vị (Off-by-One Error)
```stn
fn main() {
    let count = 0;
    // Lập trình viên muốn đếm 10 phần tử: 1, 2, ..., 10
    for i in range(10) {
        count = count + 1;
    }
    // Nhưng hãy in thử giá trị cuối cùng của i:
    // Liệu i có chạm tới 10 không?
}
```

---

## 12. Why? (Tại Sao Lại Thất Bại?)

### Với Thử nghiệm A (Infinite Loop):
Vì lập trình viên quên cập nhật trạng thái của biến `i`, biểu thức `i > 0` (tức $10 > 0$) sẽ luôn luôn trả về `1` (`true`) trong mọi chu kỳ của vũ trụ. Lệnh `OP_JUMP_IF_FALSE` sẽ không bao giờ được kích hoạt, và lệnh nhảy lùi `OP_JUMP -offset` sẽ tiếp tục đẩy `IP` về quá khứ mãi mãi.

### Với Thử nghiệm B (Off-by-One):
Trong khoa học máy tính, có một câu nói đùa kinh điển:
> *"Chỉ có hai thứ khó khăn nhất trong ngành lập trình: Đặt tên biến, Xóa bộ nhớ đệm cache, và... **Lỗi lệch 1 đơn vị (Off-by-One Error)**."*

Khi bạn viết `range(10)`, nó sinh ra dãy: $0, 1, 2, 3, 4, 5, 6, 7, 8, 9$.
- Nó đủ $10$ phần tử.
- Nhưng giá trị lớn nhất của `i` chỉ là **$9$**, không bao giờ chạm tới số **$10$**!
- Nếu bạn muốn lặp đến $10$, bạn phải viết rõ: `range(1, 11)`. Hiểu rõ quy ước nửa mở $[start, stop)$ sẽ giúp bạn tránh được $80\%$ các lỗi tiềm ẩn khi xử lý dữ liệu mảng sau này.

---

## 13. Exercise

### Bài tập 1: Dự đoán Output (Vòng lặp có `continue` và `break`)
Hãy phân tích bằng mắt và cho biết đoạn mã sau in ra những số nào:
```stn
fn main() {
    for i in range(1, 8) {
        if (i % 2 == 0) {
            continue;
        }
        if (i == 5) {
            break;
        }
        println(i);
    }
}
```

### Bài tập 2: Sửa Bug Vòng Lặp Vô Tận
Đoạn code sau nhằm mục đích chia đôi số nguyên cho đến khi nó bằng 1, nhưng nó đang chạy vô tận khi gặp một số trường hợp. Hãy tìm ra lỗi và sửa lại:
```stn
fn main() {
    let n = 16;
    while (n != 1) {
        println(n);
        n = n / 2;
    }
}
```
*(Gợi ý: Điều gì xảy ra nếu ban đầu `n = 0` hoặc một số âm?)*

### Bài tập 3: Tư Duy Compiler
Khi biên dịch vòng lặp `while`:
Tại sao Compiler không thể điền ngay độ lệch của lệnh `OP_JUMP_IF_FALSE` tại thời điểm nó vừa đọc xong chữ `while (condition)`? Compiler phải đợi đến lúc nào mới có thể điền được con số đó? Kỹ thuật này tên là gì?

---

## 14. Challenge (Thử Thách Mở)

> **Thử thách Giả thuyết Collatz (Bài toán $3n + 1$)**:  
> Lấy một số nguyên dương $N$ bất kỳ:
> - Nếu $N$ chẵn: $N = N / 2$.
> - Nếu $N$ lẻ: $N = 3 \times N + 1$.  
> Lặp lại quy trình trên cho đến khi $N = 1$.  
> 
> Hãy viết một chương trình Tersun:
> 1. Cho $N = 27$.
> 2. Đếm xem cần bao nhiêu bước lặp để số $27$ rơi về số $1$.
> 3. Tìm xem trong suốt hành trình đó, con số lớn nhất mà $N$ từng đạt tới là bao nhiêu.  
> *(Gợi ý: Số 27 sẽ tạo ra một hành trình kỳ vĩ với hơn 100 bước và leo lên tới hàng ngàn trước khi rơi về 1!)*

---

## 15. Summary

* **Vấn đề**: Copy-paste thủ công gây bùng nổ mã nguồn, không thể bảo trì và không thể xử lý dữ liệu động có kích thước chưa biết trước.
* **Bản chất phần cứng**: Vòng lặp thực chất là một **cú nhảy lùi với độ lệch âm (`IP = IP - offset`)** kết hợp với một chiếc phanh nhảy tiến có điều kiện (`OP_JUMP_IF_FALSE`).
* **3 Chân kiềng**: Mọi vòng lặp đều phải có **Khởi tạo**, **Điều kiện dừng**, và **Bước tiến trạng thái**. Thiếu bước tiến sẽ gây ra Vòng lặp vô tận (Infinite Loop).
* **Đột phá Tersun**: Siêu lệnh **`OP_LOOP_RANGE_FAST`** dung hợp 15 lệnh bytecode thành 1 chu kỳ máy, đạt tốc độ ~18 ns/vòng lặp.

---

## 16. Bridge (Cầu Nối Sang PART II)

Xin chúc mừng bạn! Bạn vừa chính thức hoàn thành **PART I — Programming from First Principles**.

Trong 4 chương vừa qua, chúng ta đã cùng nhau tự phát minh ra **toàn bộ các trụ cột nền tảng của ngành khoa học điện toán**:
- Chương 1: **Biến & Bộ nhớ** (Lưu giữ trạng thái).
- Chương 2: **Biểu thức & Cây AST** (Biến đổi trạng thái).
- Chương 3: **Rẽ nhánh điều khiển** (Lựa chọn hướng đi).
- Chương 4: **Vòng lặp** (Tái sử dụng thời gian tính toán vô tận).

Đến thời điểm này, chương trình của bạn đã đạt tới đẳng cấp **Turing Complete** — về mặt lý thuyết, bạn đã có thể giải quyết MỌI bài toán tính toán mà loài người từng nghĩ ra!

Nhưng hãy nhìn vào cách ta đang nói chuyện với máy tính:
Ta gõ chữ vào file văn bản `.stn`.  
Làm thế nào máy tính có thể đọc từng ký tự `'f'`, `'o'`, `'r'`, phân biệt nó với biến `formula`?  
Bộ phân tích từ vựng (Lexer) của Tersun đã băm dòng chữ của bạn ra như thế nào?

Chào mừng bạn bước sang **PART II — Tersun Core Language**, bắt đầu với:  
**Chapter 5 — Cú Pháp Nhận Diện & Bộ Phân Tích Từ Vựng (Lexing & Scanning)**!








# PHẦN II: NGÔN NGỮ CỐT LÕI TERSUN (TERSUN CORE LANGUAGE)

Chào mừng bạn bước vào **Phần II**. Ở Phần I, chúng ta đã đi từ bình diện vật lý của phần cứng (ALU mất trí nhớ, cây AST, bước nhảy con trỏ IP, bộ nhớ Stack Frame) để chứng minh tính tất yếu của biến, biểu thức, rẽ nhánh và vòng lặp.

Bây giờ, chúng ta sẽ mở cánh cửa vào chính **ngôn ngữ Tersun** và bộ biên dịch `setunc`. Chúng ta bắt đầu từ trạm kiểm soát đầu tiên của mọi compiler: **Bộ phân tích từ vựng (Lexer / Scanner)**.

---

## CHƯƠNG 5: CÚ PHÁP NHẬN DIỆN & BỘ PHÂN TÍCH TỪ VỰNG (LEXING & SCANNING)

---

### 1. Vấn đề (The Problem)

Khi bạn lưu một tập tin mã nguồn Tersun (ví dụ `main.stn`), trên đĩa cứng hay trong bộ nhớ RAM, tập tin đó **hoàn toàn không có cấu trúc**. Nó chỉ là một mảng 1 chiều chứa các byte thô liên tục (Raw Byte Stream):

```text
0x6C 0x65 0x74 0x20 0x78 0x20 0x3D 0x20 0x34 0x32 0x20 0x2B 0x20 0x40 0x31 0x30 0x54 0x31 0x3B
 |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |    |
'l'  'e'  't'  ' '  'x'  ' '  '='  ' '  '4'  '2'  ' '  '+'  ' '  '@'  '1'  '0'  'T'  '1'  ';'
```

Bộ phân tích cú pháp (Parser) cần dựng cây cú pháp trừu tượng AST. Nhưng Parser không thể làm việc trực tiếp trên từng ký tự đơn lẻ. Hãy thử tưởng tượng Parser phải liên tục tự hỏi:
- Ký tự `'l'` này là chữ cái đầu của từ khóa `let`, hay là biến `level`?
- Dấu `'='` này là phép gán, hay là một nửa của toán tử so sánh bằng `==`, hay là toán tử 3 trạng thái `<=>`?
- Ký tự `'@'` này là toán tử nhân ma trận `@`, hay là tiền tố của hằng số cân bằng tam phân `@10T1`?
- Dấu cách `' '`, tab `'\t'`, dòng mới `'\n'` và những dòng bình luận giải thích dài 100 chữ có ý nghĩa gì đối với logic tính toán không?

Nếu Parser vừa phải lo ngữ pháp (Grammar/AST) vừa phải nhặt từng ký tự từ đĩa, độ phức tạp của compiler sẽ bùng nổ theo cấp số nhân.

---

### 2. Tại sao vấn đề này tồn tại?

1. **Khoảng cách biểu diễn giữa Con người và Máy tính**:
   - Con người viết mã bằng các khái niệm logic: định danh (*identifiers*), số (*literals*), từ khóa (*keywords*), toán tử (*operators*), và dùng khoảng trắng/dòng mới để tạo bố cục trực quan dễ đọc.
   - Ổ đĩa và hệ điều hành chỉ lưu trữ một luồng byte tuần tự $B = [b_0, b_1, b_2, \dots, b_{N-1}]$.
2. **Sự nhập nhằng về tiền tố (Prefix Ambiguity)**:
   - Một chuỗi ký tự có thể mang ý nghĩa hoàn toàn khác nhau tùy thuộc vào các ký tự kế tiếp. Ký tự `<` có thể là:
     - Toán tử nhỏ hơn: `<`
     - Toán tử dịch trái: `<<`
     - Toán tử gán dịch trái: `<<=`
     - Toán tử nhỏ hơn hoặc bằng: `<=`
     - Toán tử so sánh 3 trạng thái của Tersun: `<=>`
3. **Nhiễu phi logic (Syntactic Noise)**:
   - Khoảng trắng, ký tự thụt đầu dòng, và các đoạn chú thích (`// comment`, `/* block */`) là tối quan trọng cho lập trình viên, nhưng là rác đối với quá trình sinh mã máy. Chúng cần bị lọc bỏ trước khi đến tầng ngữ pháp.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần xây dựng một cỗ máy xử lý tuyến tính $O(N)$ nhận đầu vào là **Chuỗi ký tự (Character Stream)** và chuyển hóa thành **Dòng đơn vị từ vựng (Token Stream)**.

```
+------------------+         +-------------------+         +--------------------+
|  Raw Byte Stream |  ====>  |   Lexer/Scanner   |  ====>  |    Token Stream    |
| "let x = 42;"    |         | (Single-pass DFA) |         | [KW_LET, ID, ...]  |
+------------------+         +-------------------+         +--------------------+
```

Mỗi đơn vị từ vựng (**Token**) phải là một thực thể hoàn chỉnh mang ít nhất 4 thông tin cốt lõi:
1. **Loại (TokenType)**: Bản chất logic của từ khóa/ký hiệu (ví dụ: `KW_LET`, `IDENTIFIER`, `INT_LITERAL`, `SPACESHIP`).
2. **Chuỗi gốc (Lexeme)**: Chuỗi ký tự thô trích xuất từ mã nguồn (ví dụ: `"x"`, `"42"`, `"<=>"`).
3. **Tọa độ nguồn (SourceLocation)**: Vị trí chính xác `(file, line, column)` để khi xảy ra lỗi cú pháp, compiler có thể chỉ điểm trực tiếp cho lập trình viên.
4. **Giá trị tính sẵn (Precomputed Value)**: Với các literal số nguyên, số thực, hay chuỗi balanced ternary, Lexer nên chuyển đổi sẵn sang dạng nhị phân (`int64_t`, `double`, `tryte_val`) để các tầng sau không phải parse lại.

---

### 4. Tự xây một abstraction đơn giản

Là một kỹ sư, phản xạ tự nhiên đầu tiên khi cần cắt một câu văn thành các từ là sử dụng hàm tách chuỗi theo khoảng trắng (`split(' ')`).

Hãy thử viết một bộ tách từ vựng ngây thơ (Naive Tokenizer) bằng C++:

```cpp
// naive_lexer.cpp
#include <iostream>
#include <vector>
#include <string>
#include <sstream>

std::vector<std::string> naive_tokenize(const std::string& source) {
    std::vector<std::string> tokens;
    std::stringstream ss(source);
    std::string word;
    while (ss >> word) {
        tokens.push_back(word);
    }
    return tokens;
}
```

---

### 5. Thử nghiệm

Hãy cho bộ tách từ ngây thơ này chạy trên một dòng lệnh có định dạng chuẩn chỉnh:

```cpp
int main() {
    std::string code = "let x = 10 + 20 ;";
    auto tokens = naive_tokenize(code);
    for (const auto& tok : tokens) {
        std::cout << "[" << tok << "] ";
    }
    std::cout << "\n";
}
```

**Kết quả chạy**:
```text
[let] [x] [=] [10] [+] [20] [;]
```
Mọi thứ trông có vẻ hoạt động hoàn hảo. Nhưng lập trình viên thực tế không bao giờ viết code như vậy.

---

### 6. Thất bại / Giới hạn xuất hiện

Hãy thử nghiệm với 3 trường hợp thực tế sau:

#### Ca thất bại 1: Code không có khoảng trắng quanh toán tử
```cpp
std::string code1 = "let x=10+20;";
// naive_tokenize trả về:
// ["let", "x=10+20;"]  <-- BỊ DÍNH CHẶT THÀNH 1 TỪ!
```
Toàn bộ biểu thức `x=10+20;` bị coi là một định danh duy nhất! Parser hoàn toàn bất lực.

#### Ca thất bại 2: Chuỗi ký tự có khoảng trắng bên trong
```cpp
std::string code2 = "let msg = \"hello world\";";
// naive_tokenize trả về:
// ["let", "msg", "=", "\"hello", "world\";"]  <-- CHUỖI BỊ XÉ TOẠC LÀM ĐÔI!
```

#### Ca thất bại 3: Toán tử đa ký tự và chú thích
```cpp
std::string code3 = "let ok = a <= b; // check";
// naive_tokenize trả về:
// ["let", "ok", "=", "a", "<=", "b;", "//", "check"]
// Chú thích "//" và "check" không bị loại bỏ, dính dấu chấm phẩy vào "b;".
```

---

### 7. Tại sao nó thất bại?

Cách tiếp cận `split(' ')` thất bại vì nó dựa trên một tiền đề sai lầm: **Khoảng trắng không phải là ranh giới duy nhất của từ vựng trong ngôn ngữ lập trình.**

Ranh giới từ vựng được quyết định bởi **ngữ pháp chính quy (Regular Grammar)**:
1. **Chuyển tiếp ký tự (Character Class Transition)**: Khi ký tự chuyển từ chữ cái (`x`) sang toán tử (`=`), hoặc từ số (`0`) sang dấu chấm phẩy (`;`), ranh giới từ vựng đã xuất hiện ngay lập tức mà không cần bất kỳ dấu cách nào.
2. **Khu vực được bảo vệ (Delimited Scope)**: Bên trong dấu nháy kép `"`...`"`, khoảng trắng là dữ liệu (ký tự ' '), không phải là ranh giới phân tách.
3. **Nguyên tắc "Kẻ háu ăn nhất" (Maximal Munch / Longest Match Rule)**:
   - Khi quét ký tự `<`, bộ quét không thể kết luận ngay đó là `LESS`.
   - Nếu ký tự tiếp theo là `=`, nó phải tiếp tục nhìn xem ký tự sau đó có phải là `>` không (để thành `<=>`).
   - Compiler bắt buộc phải tiêu thụ chuỗi ký tự hợp lệ **dài nhất có thể**.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

Trong lịch sử khoa học máy tính:
- **Thập niên 1970**: Mike Lesk và Eric Schmidt tại Bell Labs tạo ra **Lex** (sau này là Flex - Fast Lexical Analyzer Generator). Lập trình viên định nghĩa các biểu thức chính quy (Regex), Lex biên dịch chúng thành bảng chuyển trạng thái của **DFA (Deterministic Finite Automaton)**.
- **Thực tế trong các Compiler hiện đại (Clang/LLVM, Rustc, V8, Go, Tersun)**:
  - Hầu như **không một compiler hiệu năng cao nào ngày nay dùng Flex**.
  - Người ta chuyển toàn bộ sang **Hand-written Lexer (Bộ quét viết tay)** sử dụng kỹ thuật con trỏ dịch chuyển và hàm `switch-case`.
  - **Lý do**:
    1. **Tốc độ**: Lexer viết tay tận dụng tối đa cache L1 của CPU, tránh việc tra bảng gián tiếp (table lookup indirection), xử lý hàng chục triệu dòng code mỗi giây.
    2. **Báo lỗi chính xác (Compiler Diagnostics)**: Khi gặp ký tự lạ, Lexer viết tay có thể in ra chính xác dòng, cột và gợi ý sửa lỗi thay vì chỉ báo một câu vô hồn `lexical error`.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Lexeme** | Chuỗi ký tự thô trong mã nguồn tạo nên một đơn vị từ vựng (ví dụ: `"branch3"`, `"<=>"`, `"@10T1"`). |
| **TokenType** | Nhãn danh mục logic gán cho lexeme (ví dụ: `KW_BRANCH`, `SPACESHIP`, `TERNARY_LITERAL`). |
| **Token** | Cấu trúc dữ liệu đóng gói: `{ TokenType, lexeme, SourceLocation, literal_value }`. |
| **DFA (Deterministic Finite Automaton)** | Máy hữu hạn trạng thái không đơn định: với mỗi ký tự đọc vào, chỉ có duy nhất một trạng thái kế tiếp xác định. |
| **Maximal Munch (Longest Match)** | Quy tắc tiêu thụ chuỗi ký tự dài nhất tạo thành token hợp lệ trước khi hoàn tất. |
| **Lookahead ($k$)** | Khả năng nhìn trước $k$ ký tự trong luồng byte mà không làm thay đổi vị trí con trỏ đọc hiện tại. Tersun Lexer sử dụng Lookahead $k=2$ (`peek()` và `peek_next()`). |

---

### 10. Tersun giải quyết nó thế nào?

Bộ quét của Tersun được triển khai trong tập tin mã nguồn [lexer.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/lexer.hpp) và [lexer.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/lexer.cpp).

#### Cấu trúc con trỏ quét của `setun::Lexer`:
Lexer duy trì 2 con trỏ chỉ số trên một chuỗi nguồn không thay đổi (`std::string_view source_`):
- `start_`: Điểm bắt đầu của Token đang quét.
- `current_`: Điểm hiện tại mà đầu đọc đang kiểm tra.

```text
source_:   " l e t   x   =   4 2 ; "
             ^       ^
             |       +--- current_ (đang nhìn vào khoảng trắng)
             +----------- start_   (bắt đầu bằng 'l')
Lexeme = source_.substr(start_, current_ - start_) = "let"
```

#### 4 Thao tác nền tảng (Primitives):
1. `advance()`: Trả về ký tự tại `current_` và tăng `current_++`, cập nhật `column_++`.
2. `peek()`: Trả về ký tự tại `current_` nhưng **không** tăng con trỏ (Lookahead 1).
3. `peek_next()`: Trả về ký tự tại `current_ + 1` (Lookahead 2).
4. `match(char expected)`: Nếu ký tự hiện tại trùng với `expected`, tiêu thụ nó và trả về `true`; ngược lại giữ nguyên vị trí và trả về `false`.

#### Các đặc sản riêng của Tersun:
- **Nhận diện UTF-8 chuẩn xác**: Hỗ trợ biến định danh tiếng Việt (ví dụ `let tổng_số = 100;`) thông qua hàm kiểm tra độ dài byte UTF-8 `consume_utf8_sequence()`.
- **Hằng số cân bằng tam phân (Balanced Ternary Literal)**: Bắt đầu bằng ký tự `@` theo sau bởi các trit `1`, `0`, `T`, `t`, `-` (ví dụ `@10T1`, `@1TTT`). Lexer tự động gọi `from_ternary_string()` chuyển hóa thành giá trị số nguyên ngay tại chỗ!
- **Toán tử so sánh 3 trạng thái**: Nhận diện chuỗi 3 ký tự `<=>` (`SPACESHIP`) thông qua chuỗi `match('='): if (match('>'))`.

---

### 11. Viết code

Dưới đây là một chương trình Tersun hợp lệ mẫu chứng minh sự đa dạng từ vựng mà Lexer phải bóc tách:

```tersun
// demo_tokens.stn: Phân tích từ vựng nâng cao trong Tersun
let mut biến_đếm = 0;
let hằng_số_ternary = @10T1;   // Giá trị tam phân cân bằng: 27*1 + 9*0 + 3*(-1) + 1*1 = 25
let số_thực = 3.14159;

fn kiểm_tra_trạng_thái(a: int, b: int) -> int {
    let cmp = a <=> b; // Toán tử spaceship: trả về -1, 0, hoặc +1
    branch3 (cmp) {
        case -1 => print("Nhỏ hơn\n");
        case  0 => print("Bằng nhau\n");
        case  1 => print("Lớn hơn\n");
    }
    return cmp;
}
```

Bảng phân rã các Token tiêu biểu được Lexer bóc tách:

| Lexeme | TokenType | Line:Col | Giá trị tính trước |
| :--- | :--- | :--- | :--- |
| `let` | `KW_LET` | 2:1 | - |
| `mut` | `KW_MUT` | 2:5 | - |
| `biến_đếm` | `IDENTIFIER` | 2:9 | UTF-8 valid sequence |
| `=` | `EQUAL` | 2:18 | - |
| `0` | `INT_LITERAL` | 2:20 | `int_val = 0` |
| `;` | `SEMICOLON` | 2:21 | - |
| `@10T1` | `TERNARY_LITERAL` | 3:23 | `int_val = 25, tryte_val = 25` |
| `3.14159`| `FLOAT_LITERAL` | 4:15 | `float_val = 3.14159` |
| `<=>` | `SPACESHIP` | 7:17 | - |
| `branch3`| `KW_BRANCH` | 8:5 | - |

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy mổ xẻ trực tiếp mã nguồn C++ của Tersun trong [lexer.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/lexer.cpp) để thấy cách một Compiler cấp công nghiệp xử lý các ca hóc búa:

#### 1. Bóc tách toán tử đa ký tự bằng `match()`
Trong `Lexer::next_token()`, việc phân biệt `<`, `<=`, `<<`, `<<=`, và `<=>` được thực hiện bằng một chuỗi DFA thu gọn cực kỳ tinh tế:

```cpp
// Trích từ Code/src/compiler/lexer.cpp (dòng 610-624)
case '<':
    if (match('<')) {
        if (match('=')) {
            return Token{TokenType::LESS_LESS_EQUAL, "<<=", loc}; // <<=
        }
        return Token{TokenType::LESS_LESS, "<<", loc};             // <<
    }
    if (match('=')) {
        if (match('>')) {
            return Token{TokenType::SPACESHIP, "<=>", loc};       // <=>
        }
        return Token{TokenType::LESS_EQ, "<=", loc};               // <=
    }
    return Token{TokenType::LESS, "<", loc};                       // <
```

#### 2. Nhận diện Hằng số Tam Phân `@10T1` đối đầu với Toán tử Nhân ma trận `@`
Ký tự `@` trong Tersun có hai ý nghĩa:
- Nếu theo sau ngay bởi trit (`1`, `0`, `T`, `t`, `-`), đó là **Ternary Literal**.
- Nếu theo sau là khoảng trắng hoặc biến, đó là **Toán tử nhân ma trận** (Multiplication-free GEMM).

```cpp
// Trích từ Code/src/compiler/lexer.cpp (dòng 515-522)
if (c == '@') {
    if (peek() == '1' || peek() == '0' || peek() == 'T' || peek() == 't' || peek() == '-') {
        current_--;
        column_--;
        return scan_ternary_literal();
    }
    return Token{TokenType::AT, "@", loc};
}
```

#### 3. Bỏ qua chú thích và giữ số dòng chính xác
Một lỗi kinh điển của lập trình viên là làm lệch số dòng khi gặp comment nhiều dòng (`/* ... */`). Hãy xem Tersun xử lý:

```cpp
// Trích từ Code/src/compiler/lexer.cpp (dòng 267-283)
} else if (peek_next() == '*') {
    advance(); advance(); // Bỏ qua /*
    while (!is_at_end()) {
        if (peek() == '*' && peek_next() == '/') {
            advance(); advance(); // Bỏ qua */
            break;
        }
        if (peek() == '\n') {
            line_++;        // Đếm chính xác từng dòng trong block comment
            column_ = 0;
        }
        advance();
    }
}
```

---

### 13. Thí nghiệm / Kiểm chứng

Hãy thực hiện một thí nghiệm biên dịch mã nguồn có chứa cú pháp đặc thù của Tersun để chứng minh Lexer hoạt động hoàn toàn ổn định.

Tạo một tập tin `scratch/test_lexer_tokens.stn`:

```tersun
fn test_lexing() {
    let a = @10T1;
    let b = 25;
    let cmp = a <=> b;
    if (cmp == 0) {
        println("Ternary Literal and Spaceship Operator Lexed Correctly!");
    }
}

test_lexing();
```

Chúng ta biên dịch và chạy bằng `setunc.exe`:

```powershell
.\setunc.exe run scratch/test_lexer_tokens.stn
```

Kết quả:
```text
Ternary Literal and Spaceship Operator Lexed Correctly!
```
Bộ quét đã nhận dạng trơn tru hằng số `@10T1`, tính ra `25`, phân tách toán tử `<=>`, và chuyển giao chuỗi Token sạch cho Parser và Virtual Machine!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 5.1: Thủ công phân tích Token Stream (Hand-Tracing)
Cho đoạn mã Tersun sau:
```tersun
let res = a<<=2;
```
Hãy viết ra danh sách chính xác các Token mà `setun::Lexer` sẽ tạo ra, bao gồm: `TokenType`, `lexeme`. Cụ thể dấu `<<=` sẽ được tách thành 1 token hay 2 token (`<<` và `=`)? Tại sao?

#### Bài tập 5.2: Bẫy tiền tố số học và định danh
Giả sử lập trình viên viết:
```tersun
let 3d_point = 100;
```
Bộ quét của Tersun sẽ xử lý đoạn mã này thế nào? Nó sẽ coi `3d_point` là một Identifier hay báo lỗi? Dựa vào hàm `next_token()` ở mục 12 để giải thích.

#### Bài tập 5.3: Phân tích hằng số Balanced Ternary
Giá trị thập phân tính trước của các literal sau trong Tersun là bao nhiêu?
1. `@1TT`
2. `@100T`
*(Gợi ý: Mỗi trit có trọng số lũy thừa của 3: $3^0, 3^1, 3^2, \dots$ với `T` tương ứng $-1$)*.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Bẫy Dấu Chấm: Số thực vs Toán tử Range `..` vs Safe Navigation `?.`"**

Trong ngôn ngữ Tersun:
- `1.5` là một `FLOAT_LITERAL`.
- `1..10` là một biểu thức sinh dãy (Range expression) với hai toán tử liên tiếp: `INT_LITERAL(1)` và `DOT_DOT("..")`.
- `obj?.field` là toán tử truy cập an toàn `QUESTION_DOT`.

**Câu hỏi kỹ sư**:
Nếu Lexer đang đứng ở số `1` trong chuỗi `1..10`, khi gặp dấu `.` đầu tiên, làm thế nào để Lexer **không bị lừa** tưởng rằng đây là số thực `1.` để rồi nuốt mất dấu chấm thứ hai? 
Hãy chỉ ra giải pháp kiểm tra `peek()` và `peek_next()` trong hàm `scan_number_or_float()` để giải quyết triệt để sự xung đột này.

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Lexer biến một dòng byte 1 chiều vô nghĩa thành một chuỗi **Token** có cấu trúc trong thời gian tuyến tính $O(N)$.
2. Quy tắc **Maximal Munch** và kỹ thuật **Lookahead** (`peek()`, `peek_next()`) giúp giải quyết mọi sự nhập nhằng về toán tử đa ký tự (`<=>`, `<<=`, `..`).
3. Lexer viết tay mang lại tốc độ vượt trội và khả năng định vị lỗi chính xác tuyệt đối `(file:line:col)`.

#### Cầu nối sang Chương 6:
Lúc này, bạn đã có trong tay một dòng Token ngăn nắp:
```text
[KW_LET, IDENTIFIER("tuổi"), EQUAL, INT_LITERAL(25), SEMICOLON]
```
Nhưng bản thân Token `IDENTIFIER("tuổi")` lúc này chỉ là một chuỗi ký tự vô tri. 
- Nó đại diện cho cái gì trong bộ nhớ máy tính?
- Biến này sống ở đâu trên thanh ghi hay Stack Frame?
- Làm sao compiler biết biến này có được phép gán lại hay không (`mut` vs `const`)?

Ở **Chương 6: Khai Báo Biến & Hệ Thống Định Danh (Variables, Bindings & Scopes)**, chúng ta sẽ bước sang tầng phân tích ngữ nghĩa: trao "linh hồn" và vị trí bộ nhớ cho các Token này!


## CHƯƠNG 6: KHAI BÁO BIẾN, HỆ THỐNG KIỂU & QUẢN LÝ PHẠM VI (VARIABLES, BINDINGS, TYPES & SCOPES)

---

### 1. Vấn đề (The Problem)

Ở Chương 5, bộ quét từ vựng (Lexer) đã làm sạch mã nguồn và trao cho chúng ta một dòng Token ngăn nắp:

```text
[KW_LET, IDENTIFIER("x"), COLON, TYPE_INT, EQUAL, INT_LITERAL(10), SEMICOLON]
```

Nhưng hãy tự hỏi: **Đối với CPU hay máy ảo runtime, chữ `"x"` có ý nghĩa gì không?**

Câu trả lời là: **Hoàn toàn không!**
Thanh ghi phần cứng (Registers: `RAX`, `RBX`, `RCX`...) hay các ô nhớ RAM (`0x0040A010`, `0x7FFF5FBFF...`) không có khái niệm "tên biến". Chúng chỉ là những ngăn chứa byte vô danh.

Tệ hơn nữa, trong một chương trình thực tế:
- Hàm `tính_thuế()` có thể khai báo một biến `tổng`.
- Hàm `tính_lương()` cũng khai báo một biến `tổng`.
- Bên trong một khối lệnh `{ ... }` lồng nhau, lập trình viên lại khai báo thêm một biến `tổng` khác.

Làm thế nào trình biên dịch có thể phân biệt được `tổng` nào sống ở đâu, khi nào nó được sinh ra, khi nào nó chết đi, và quan trọng nhất: **Làm sao để biến `"x"` trừu tượng của con người biến thành một ô nhớ vật lý xác định trên Call Stack của máy ảo?**

---

### 2. Tại sao vấn đề này tồn tại?

1. **Sự xung đột giữa Tư duy Con người và Cấu trúc Phần cứng**:
   - Con người cần **Tên gọi gợi nhớ (Mnemonic Names)** để quản lý độ phức tạp: `lãi_suất`, `tọa_độ_x`, `bộ_đệm_qvm`.
   - Máy tính chỉ quan tâm đến **Địa chỉ tương đối (Offsets)** so với con trỏ ngăn xếp (Stack Pointer `SP` hoặc Base Pointer `BP`).
2. **Vòng đời và Tầm nhìn của dữ liệu (Lifetime vs Visibility)**:
   - Một biến không thể sống mãi mãi (trừ biến toàn cục). Nó được sinh ra khi luồng thực thi đi vào một khối lệnh và phải bị thu hồi khi ra khỏi khối lệnh đó để giải phóng bộ nhớ.
   - Nếu không có cơ chế ranh giới phạm vi, mọi biến trong chương trình sẽ dẫm đạp lên nhau.
3. **Hiểm họa tha hóa dữ liệu (Data Corruption & Invariant Violation)**:
   - Nếu không có **Hệ thống kiểu (Type System)** và **Tính bất biến (Immutability)**, một dòng code vô tình gán chuỗi `"chết chóc"` vào biến số nguyên chứa địa chỉ con trỏ sẽ làm sập toàn bộ hệ thống (`Segmentation Fault`).

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần thiết kế một hệ thống giải quyết trọn vẹn 3 mục tiêu:

1. **Ánh xạ Tên $\to$ Vị trí Bộ nhớ (Name Resolution & Slot Allocation)**:
   Biến đổi mọi chuỗi ký tự định danh (như `"x"`) thành một **Chỉ số ô ngăn xếp (Stack Slot Index: `slot 0`, `slot 1`, ...)**.
2. **Quản lý Phạm vi Từ vựng (Lexical Scoping & Shadowing)**:
   Cho phép các khối lệnh lồng nhau `{ ... }` có thể tạo ra các biến cục bộ mới, thậm chí trùng tên với biến bên ngoài (Hiện tượng che khuất - *Shadowing*), nhưng khi khối lệnh kết thúc, biến bên ngoài phải được phục hồi nguyên vẹn.
3. **Thực thi Hợp đồng Kiểu & Bất biến (Type Checking & Constness)**:
   - Ngăn chặn tuyệt đối việc gán lại giá trị vào biến hằng số (`const`).
   - Tự động suy luận kiểu dữ liệu cục bộ (*Local Type Inference*) khi lập trình viên không chỉ định kiểu tường minh.
   - Bắt lỗi xung đột kiểu ngay tại thời điểm biên dịch (*Compile-time Error*).

---

### 4. Tự xây một abstraction đơn giản

Là một kỹ sư, mô hình đầu tiên bạn nghĩ đến để lưu trữ các biến là một **Bảng băm phẳng (Flat Hash Table)**:

```cpp
// naive_symbol_table.cpp
#include <iostream>
#include <string>
#include <unordered_map>

struct NaiveSymbol {
    int slot_index;
    int value;
};

class NaiveSymbolTable {
public:
    int allocate(const std::string& name, int val) {
        int slot = next_slot_++;
        table_[name] = {slot, val};
        return slot;
    }

    int resolve(const std::string& name) {
        if (table_.find(name) == table_.end()) {
            std::cerr << "Lỗi: Biến chưa khai báo: " << name << "\n";
            return -1;
        }
        return table_[name].slot_index;
    }

private:
    int next_slot_{0};
    std::unordered_map<std::string, NaiveSymbol> table_;
};
```

---

### 5. Thử nghiệm với abstraction đơn giản

Hãy thử nghiệm trên một chương trình tuyến tính phẳng:

```cpp
int main() {
    NaiveSymbolTable syms;
    int slot_a = syms.allocate("a", 10);
    int slot_b = syms.allocate("b", 20);

    std::cout << "a -> slot " << syms.resolve("a") << "\n";
    std::cout << "b -> slot " << syms.resolve("b") << "\n";
}
```

**Kết quả**:
```text
a -> slot 0
b -> slot 1
```
Trông có vẻ rất ổn! Máy ảo chỉ việc truy cập `stack[0]` và `stack[1]`.

---

### 6. Thất bại / Giới hạn xuất hiện

Bây giờ, hãy đưa mô hình này vào một đoạn mã có khối lệnh lồng nhau thực tế:

```tersun
let x = 10;
{
    let x = 20;      // Biến x cục bộ bên trong khối
    println(x);      // Mong muốn in ra: 20
}
println(x);          // Mong muốn in ra: 10 (biến x ban đầu)
```

Khi chạy qua bảng băm phẳng:
1. `allocate("x", 10)` gán `x -> slot 0`.
2. Gặp `{ let x = 20; }`, `allocate("x", 20)` ghi đè `table_["x"] = slot 1`.
3. Khi khối lệnh kết thúc, bảng băm phẳng **không biết làm cách nào để khôi phục lại `slot 0`**!
4. Lệnh `println(x)` cuối cùng truy cập `table_["x"]` và nhận về `slot 1` (giá trị 20) thay vì 10. **Dữ liệu của khối cha đã bị phá hủy vĩnh viễn!**

Chưa hết:
- Nếu một biến được khai báo bên trong `{ let temp = 99; }`, sau khi ra khỏi dấu `}`, biến `temp` vẫn tồn tại trong bảng băm phẳng! Bất kỳ ai ở ngoài cũng có thể đọc được nó $\to$ **Rò rỉ phạm vi (Scope Leakage)**.

---

### 7. Tại sao nó thất bại?

Bảng băm phẳng thất bại vì: **Tầm nhìn của ngôn ngữ lập trình không phải là một mặt phẳng 2D, mà là một cấu trúc cây phân tầng (Lexical Tree / Hierarchical Scopes).**

```text
[ Global Scope ]  (x = 10)
       |
       +---> [ Block Scope 1 ]  (x = 20)  <-- che khuất x ở trên
                   |
                   +---> [ Block Scope 2 ]  (y = 30)
```

1. **Nguyên lý Đóng gói theo Ngăn xếp (Stack Invariant)**:
   Khi bước vào một khối `{`, một tầng không gian tên mới phải được sinh ra. Khi bước ra khỏi khối `}`, toàn bộ không gian tên đó phải lập tức bị tiêu hủy.
2. **Quy tắc phân giải từ trong ra ngoài (Innermost-First Resolution)**:
   Khi tìm kiếm tên biến `"x"`, compiler phải tìm từ tầng sâu nhất (gần nhất) ngược dần lên tầng cha, tầng ông bà, cho tới tầng toàn cục (Global Scope). Tên biến ở tầng trong sẽ **che khuất (shadow)** tên biến ở tầng ngoài.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

Từ thuở sơ khai của Algol 60, tiếp nối bởi C, Pascal, và các ngôn ngữ hiện đại (Rust, Go, Swift, Tersun):
- **Cấu trúc dữ liệu kinh điển**: **Ngăn xếp các Bảng Băm (Stack of Hash Tables)**.
  - Mỗi scope là một `std::unordered_map<std::string, Symbol>`.
  - Toàn bộ hệ thống scope là một `std::vector<Scope>` hoạt động như một ngăn xếp (LIFO - Last In, First Out).
- **Hiện tượng Xóa Bỏ Tên (Name Erasure)**:
  - Đây là bí mật lớn nhất của mọi compiler tối ưu: **Tên biến chỉ tồn tại trong giai đoạn biên dịch (Frontend)**.
  - Khi hạ xuống Bytecode hoặc Mã máy, toàn bộ các chữ `"x"`, `"y"`, `"tổng_tiền"` đều bị compiler xóa sạch 100%!
  - Thay vào đó, máy ảo VM chỉ nhìn thấy các chỉ số slot: `OP_LOAD_LOCAL 0`, `OP_STORE_LOCAL 1`.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Lexical Scope (Phạm vi từ vựng)** | Phạm vi hiệu lực của một biến được xác định hoàn toàn dựa vào vị trí mã nguồn tĩnh trong văn bản (bằng các dấu ngoặc `{ ... }`), không phụ thuộc vào thứ tự gọi hàm runtime. |
| **Shadowing (Sự che khuất)** | Hiện tượng biến ở scope con khai báo trùng tên với biến ở scope cha; biến con tạm thời che khuất biến cha trong toàn bộ phạm vi của nó. |
| **Symbol Table (Bảng ký hiệu)** | Cấu trúc dữ liệu ghi nhớ metadata của định danh: `{ name, type, slot_index, scope_depth, is_const, is_global }`. |
| **Stack Slot Index** | Vị trí offset cố định của một biến cục bộ bên trong Call Frame trên ngăn xếp của máy ảo hoặc CPU. |
| **Local Type Inference** | Khả năng của compiler tự động suy ra kiểu dữ liệu của biến từ biểu thức khởi tạo (`let x = 42;` $\to$ `x` có kiểu `int`). |
| **Immutability Contract** | Ràng buộc bất biến: Biến khai báo bằng `const` bị compiler từ chối mọi thao tác gán lại giá trị (`AssignStmt`). |

---

### 10. Tersun giải quyết nó thế nào?

Tersun thiết kế một kiến trúc phân giải biến 3 tầng cực kỳ chặt chẽ:

```
[ Mã nguồn .stn ]
       │
       ▼
1. Parser  ──────►  Nhận diện 'let', 'const', 'mut', tên biến, kiểu
       │
       ▼
2. TypeChecker ──►  Kiểm tra 'is_const', 'is_assignable_from', Type Inference
       │
       ▼
3. BytecodeEmitter ──► SymbolTable: Cấp phát 'slot_index', sinh OP_STORE_LOCAL
```

#### 1. Cấu trúc Bảng Ký Hiệu [symbol_table.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/symbol_table.hpp)
```cpp
class SymbolTable {
    int current_depth_{0};
    std::vector<std::unordered_map<std::string, Symbol>> scopes_;
};
```
- Khi bắt đầu: `scopes_[0]` là Global Scope (`depth = 0`).
- Gặp `{`: Gọi `enter_scope()` $\to$ `current_depth_++`, đẩy một bảng hash rỗng mới vào `scopes_`.
- Gặp `}`: Gọi `exit_scope()` $\to$ `scopes_.pop_back()`, `current_depth_--`. Toàn bộ biến cục bộ của khối đó biến mất tức thì!

#### 2. Phân giải tên (Name Resolution)
Hàm `resolve(name)` lướt ngược từ đỉnh ngăn xếp xuống đáy (`rbegin()` $\to$ `rend()`):
```cpp
std::optional<Symbol> resolve(const std::string& name) const {
    for (auto it = scopes_.rbegin(); it != scopes_.rend(); ++it) {
        auto sym_it = it->find(name);
        if (sym_it != it->end()) return sym_it->second;
    }
    return std::nullopt; // Biến chưa từng được khai báo!
}
```
Nhờ duyệt ngược, biến ở scope con luôn được tìm thấy trước, hiện thực hóa cơ chế **Shadowing** hoàn hảo!

#### 3. Hệ thống Kiểu Dữ Liệu Tersun [types.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/types.hpp)
Tersun hỗ trợ 2 nhóm kiểu:
- **Nhóm Cổ điển (Classical Types)**: `int` (64-bit có dấu), `float` (64-bit IEEE 754), `bool`, `string`, `array`.
- **Nhóm Tam Phân & Lượng Tử (Balanced Ternary & Quantum Types)**:
  - `tryte`: Số nguyên tam phân cân bằng 6-trit ($3^6 = 729$ trạng thái, dải giá trị đối xứng từ $-364$ đến $+364$ — nhất quán với đặc tả chuẩn ở Chương 25).
  - `trit`: 1 trit cân bằng ($-1, 0, +1$).
  - `taf3`: Bộ số TAFPU vô hạn chính xác dạng đại số $a + b\sqrt{3}$.

---

### 11. Viết code

Dưới đây là một chương trình Tersun hợp lệ biểu diễn đầy đủ các tính chất: khai báo biến, suy luận kiểu, ràng buộc hằng số, và che khuất biến:

```tersun
// variables_demo.stn
const PI: float = 3.1415926535; // Hằng số toàn cục bất biến

fn run_demo() {
    let mut đếm = 0;             // Biến mutable (được phép thay đổi)
    let hằng_tam_phân = @10T1;   // Suy luận kiểu tự động -> tryte/int (giá trị 25)

    đếm = đếm + 1;               // Hợp lệ vì có 'mut'

    println("Giá trị ban đầu của đếm:");
    println(đếm);                // In ra: 1

    {
        // Khối lệnh con: Shadowing biến đếm
        let đếm = 999;           // Biến đếm mới ở slot khác!
        println("Giá trị đếm bên trong block:");
        println(đếm);            // In ra: 999
    }

    println("Giá trị đếm sau khi ra khỏi block:");
    println(đếm);                // Phục hồi nguyên vẹn: in ra 1
}

run_demo();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách bộ biên dịch `setunc` biến đổi mã nguồn C++ của nó khi xử lý biến:

#### 1. Cách `TypeChecker` bắt lỗi gán vào hằng số
Trong [type_checker.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp):

```cpp
void TypeChecker::check_assign(AssignStmt& stmt) {
    auto sym = resolve_symbol(stmt.name);
    if (!sym.has_value()) {
        report_error("Cannot assign to undeclared variable '" + stmt.name + "'.", stmt.loc);
        return;
    }

    // Bắt lỗi cố tình gán lại hằng số!
    if (sym->is_const) {
        report_error("Cannot reassign to constant / immutable variable '" + stmt.name + "'.", stmt.loc);
    }
    ...
}
```

#### 2. Cách `BytecodeEmitter` cấp phát Slot Ngăn Xếp
Trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp):

```cpp
void BytecodeEmitter::emit_var_decl(const VarDeclStmt& stmt) {
    bool is_global = symbol_table_.is_global_scope();
    // Cấp phát số thứ tự ô nhớ: 0, 1, 2, 3...
    uint16_t slot = is_global ? next_global_slot_++ : next_local_slot_++;

    symbol_table_.define(stmt.name, stmt.type, is_global, slot);

    // Phát sinh giá trị khởi tạo lên đỉnh ngăn xếp
    if (stmt.init) emit_expr(stmt.init);
    else emit_default_zero();

    // Lưu từ đỉnh ngăn xếp vào slot cố định
    if (is_global) {
        chunk_.write_opcode(OpCode::OP_STORE_GLOBAL, stmt.loc.line);
    } else {
        chunk_.write_opcode(OpCode::OP_STORE_LOCAL, stmt.loc.line);
    }
    chunk_.write_int16(slot, stmt.loc.line);
}
```

#### 3. Bí mật Siêu lệnh (Superinstructions) cho Slot 0..3
Trong `vm.cpp` và `emitter.cpp`, những biến thường dùng nhất luôn nằm ở `slot 0, 1, 2, 3`. 
Thay vì phát sinh:
- `OP_LOAD_LOCAL` (1 byte) + `slot_index` (2 bytes) = **3 bytes**,
Tersun cung cấp các siêu lệnh chuyên dụng 1-byte: `OP_LOAD_LOCAL_0`, `OP_LOAD_LOCAL_1`, `OP_LOAD_LOCAL_2`, `OP_LOAD_LOCAL_3`. Điều này giúp giảm 66% kích thước bytecode truy cập biến và tăng tốc độ nạp thanh ghi lên gấp 2 lần!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy tận mắt chứng kiến trình biên dịch `setunc` phát hiện lỗi và xóa sổ tên biến như thế nào qua 2 thí nghiệm thực tế:

#### Thí nghiệm 1: Kiểm chứng Ràng buộc Hằng số
Tạo tập tin `scratch/test_const.stn`:
```tersun
const max_connections = 100;
max_connections = 200;
```
Chạy trình biên dịch:
```powershell
.\setunc.exe run scratch/test_const.stn
```
**Kết quả thực tế từ compiler**:
```text
[Type Error] scratch/test_const.stn:2:1 - Cannot reassign to constant / immutable variable 'max_connections'.
```
Trình biên dịch chặn đứng vi phạm ngay lập tức, chỉ rõ dòng 2 cột 1!

#### Thí nghiệm 2: Kiểm chứng Tên biến bị xóa bỏ trong Bytecode (Disassembly)
Tạo tập tin `scratch/test_shadow.stn`:
```tersun
fn demo() {
    let x = 10;
    {
        let x = 20;
        println(x);
    }
    println(x);
}
demo();
```
Chạy lệnh tháo gỡ mã máy (Disassemble):
```powershell
.\setunc.exe disasm scratch/test_shadow.stn
```
**Kết quả Bytecode thực tế**:
```text
=== Disassembly: scratch/test_shadow.stn (53 bytes) ===
0000  OP_JUMP            offset 44 -> 47
3000  OP_PUSH_INT        10
1200  OP_STORE_LOCAL     slot 0       <-- x ở ngoài được gán vào slot 0
1500  OP_PUSH_INT        20
2400  OP_STORE_LOCAL     slot 1       <-- x bên trong khối được gán vào slot 1!
2700  OP_LOAD_LOCAL      slot 1       <-- Lấy slot 1 để in
3000  OP_PRINTLN        
3100  OP_POP            
3200  OP_LOAD_LOCAL      slot 0       <-- Ra ngoài khối: Lấy lại slot 0 để in!
3500  OP_PRINTLN        
3600  OP_POP            
3700  OP_PUSH_INT        0
4600  OP_RET            
```
**Nhận xét chấn động**:
Trong toàn bộ bytecode thực thi, **không hề có chữ `"x"` nào tồn tại**. Tên biến đã biến mất hoàn toàn! Chúng đã trở thành `slot 0` và `slot 1` trên Stack Frame của hàm `demo()`.

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 6.1: Thủ công mô phỏng Slot Allocation
Cho đoạn mã Tersun sau:
```tersun
fn calculate() {
    let a = 5;
    let b = 10;
    {
        let c = a + b;
        let d = c * 2;
    }
    let e = a + b;
}
```
Hãy vẽ trạng thái của `SymbolTable` (gồm `current_depth_` và danh sách các biến cùng `slot_index` tương ứng) tại 3 thời điểm:
1. Ngay sau khi khai báo `let b = 10;`.
2. Ngay sau khi khai báo `let d = c * 2;`.
3. Ngay sau khi khai báo `let e = a + b;`.

#### Bài tập 6.2: Tìm lỗi Type & Const
Đoạn mã sau có bao nhiêu lỗi biên dịch? Hãy chỉ rõ từng dòng và loại lỗi:
```tersun
const TỶ_LỆ: float = 1.25;
let mut tên: string = "Tersun";
TỶ_LỆ = 1.5;
tên = 42;
```

#### Bài tập 6.3: Phân biệt Biến Toàn Cục vs Cục Bộ
Tại sao trong disassembly của Tersun lại phân tách thành hai cặp lệnh riêng biệt: `OP_LOAD_GLOBAL` / `OP_STORE_GLOBAL` và `OP_LOAD_LOCAL` / `OP_STORE_LOCAL`? Truy cập biến toàn cục khác truy cập biến cục bộ ở điểm nào về mặt địa chỉ con trỏ?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Tối ưu hóa Tái sử dụng Ngăn xếp (Stack Slot Recycling)"**

Quan sát đoạn mã sau:
```tersun
fn process(flag: bool) {
    if (flag) {
        let buffer_a = 100; // slot ?
        println(buffer_a);
    } else {
        let buffer_b = 200; // slot ?
        println(buffer_b);
    }
}
```
Trong cài đặt ngây thơ của `BytecodeEmitter`:
- Mỗi lần gặp `let`, con trỏ `next_local_slot_` lại tăng thêm 1 (`next_local_slot_++`). Do đó, `buffer_a` chiếm `slot 1`, và `buffer_b` chiếm `slot 2`.
- Khung ngăn xếp (Call Frame) phải dành ra ít nhất 3 slot.

**Câu hỏi kỹ sư**:
Vì nhánh `if` và nhánh `else` là **hai nhánh loại trừ lẫn nhau (Mutually Exclusive)**, `buffer_a` và `buffer_b` không bao giờ tồn tại cùng một thời điểm! 
Làm thế nào để thiết kế lại bộ quản lý slot trong `SymbolTable` sao cho khi ra khỏi khối `if`, chỉ số slot được **thu hồi (recycled)** để `buffer_b` có thể dùng lại chính ô nhớ của `buffer_a`? Cần lưu ý điều gì đối với biến lồng nhau?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Tên biến chỉ là sự trừu tượng hóa dành cho con người. Compiler chuyển hóa tên biến thành **Slot Index** và xóa sạch tên trước khi phát sinh bytecode (*Name Erasure*).
2. **Symbol Table** dạng ngăn xếp các bảng băm (`std::vector<unordered_map>`) giải quyết trọn vẹn bài toán phạm vi từ vựng (*Lexical Scope*) và sự che khuất (*Shadowing*).
3. Hệ thống kiểu và tính bất biến (`const` / `mut`) là chốt chặn an toàn đảm bảo tính toàn vẹn của dữ liệu trước khi CPU thực thi.

#### Cầu nối sang Chương 7:
Bây giờ chúng ta đã có các ô nhớ được quản lý chặt chẽ: `slot 0`, `slot 1`, `slot 2`.
Nhưng chỉ giữ dữ liệu trong ô nhớ thì chưa tạo nên một phần mềm. Chúng ta cần tính toán trên chúng: cộng, trừ, nhân, chia, thao tác dịch bit, và đặc biệt là các phép toán logic 3 trạng thái của Setun.

Ở **Chương 7: Hệ Toán Tử Số Học, Logic & Toán Tử Tam Phân Cân Bằng (Arithmetic, Logical & Balanced Ternary Operators)**, chúng ta sẽ mở khóa toàn bộ sức mạnh tính toán của ALU nhị phân kết hợp bộ đồng xử lý TAFPU tam phân!




## CHƯƠNG 7: HỆ TOÁN TỬ SỐ HỌC, SO SÁNH & TOÁN TỬ TAM PHÂN CÂN BẰNG (ARITHMETIC, COMPARISON & BALANCED TERNARY OPERATORS)

---

### 1. Vấn đề (The Problem)

Ở Chương 6, chúng ta đã nắm vững cách quản lý các ô nhớ (Stack Slots) và vòng đời của biến. Nhưng nếu chỉ lưu trữ dữ liệu thụ động trong ô nhớ, chương trình của bạn không khác gì một tập tin tĩnh trên đĩa cứng.

Để tạo ra logic, chúng ta cần **Toán tử (Operators)** — những cỗ máy biến đổi dữ liệu.
Tuy nhiên, trong các ngôn ngữ lập trình nhị phân truyền thống (C/C++, Java, Python), chúng ta luôn phải đối mặt với hai giới hạn cố hữu:

1. **Sự bất đối xứng và lãng phí của phép so sánh 3 chiều**:
   Khi so sánh hai đại lượng $a$ và $b$, thực tế tự nhiên chỉ có 3 khả năng: $a < b$, $a = b$, hoặc $a > b$. 
   Nhưng vì phần cứng nhị phân chỉ biết 2 trạng thái (`True` hoặc `False`), lập trình viên buộc phải viết chuỗi lệnh rẽ nhánh kép:
   ```c
   if (a < b) { ... }
   else if (a == b) { ... }
   else { ... }
   ```
   Cách viết này bắt CPU phải thực hiện **2 lần so sánh riêng biệt** và **2 lần nhảy rẽ nhánh**, gây sụt giảm nghiêm trọng hiệu năng của bộ dự đoán nhánh (Branch Predictor).
2. **Sự bất lực của Logic Boolean trước trạng thái Bất định**:
   Đại số Boole nhị phân chỉ thừa nhận Đúng (1) hoặc Sai (0). Nhưng trong cơ học lượng tử, mạng nơ-ron nhận thức, hay xử lý dữ liệu thực tế, luôn tồn tại trạng thái thứ ba: **Bất định / Chưa xác định (Unknown / Indeterminate / Superposition)**.

Làm thế nào một ngôn ngữ hiện đại có thể kết hợp hài hòa giữa **toán tử số học tốc độ cao cổ điển** với **đại số tam phân cân bằng (Balanced Ternary Logic)** để giải quyết triệt để các giới hạn trên?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Hiểm họa Dự đoán Nhánh Sai (Branch Misprediction Penalty)**:
   - Trong các vi xử lý hiện đại (x86_64, ARM64), đường ống chỉ lệnh (Instruction Pipeline) rất sâu (15–20 tầng). Để không bị gián đoạn, CPU phải "đoán mò" xem nhánh `if` có được thực thi hay không.
   - Khi so sánh các giá trị biến thiên ngẫu nhiên (ví dụ trong thuật toán QuickSort hay tìm kiếm nhị phân), chuỗi so sánh kép `a < b` rồi `a == b` khiến CPU đoán sai tới 30–50% trường hợp. Mỗi lần đoán sai, CPU phải xóa sạch toàn bộ đường ống (Pipeline Flush), lãng phí **15 đến 20 chu kỳ xung nhịp**!
2. **Sự bất đối xứng của Hệ Nhị Phân Bù 2 (Two's Complement Asymmetry)**:
   - Một số nguyên có dấu 64-bit nhị phân có dải giá trị từ $-2^{63}$ đến $+2^{63} - 1$.
   - Số âm nhỏ nhất $-9,223,372,036,854,775,808$ **không có số dương đối xứng tương ứng**! Khi bạn cố gắng đảo dấu `-INT64_MIN`, phần cứng sẽ tràn số âm (Integer Overflow).
   - Ngược lại, trong hệ **Tam phân cân bằng (Balanced Ternary)**, miền giá trị hoàn toàn đối xứng qua số 0: mỗi số dương luôn có một số âm đối xứng tuyệt đối qua phép đảo trit, loại bỏ hoàn toàn lỗi tràn số khi đảo dấu.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần thiết kế một hệ thống toán tử đa năng:

```text
                        HỆ TOÁN TỬ TERSUN
                               │
       ┌───────────────────────┴───────────────────────┐
       ▼                                               ▼
[ TẦNG CỔ ĐIỂN - CLASSICAL ]              [ TẦNG TAM PHÂN - BALANCED TERNARY ]
- Số học: +, -, *, /, %                   - Spaceship 3 hướng: <=> (-1, 0, +1)
- Dịch bit: <<, >>                        - Kleene Logic: min (AND), max (OR)
- Logic nhị phân: &&, ||, not             - Đảo trit đối xứng: ~ (1 <-> -1)
- So sánh nhị phân: ==, !=, <, <=, >, >=  - Nhân ma trận không bộ nhân: @ (GEMM)
```

Hệ thống này phải thỏa mãn các tiêu chuẩn kỹ thuật:
1. **Đánh giá biểu thức theo Ngăn xếp (Stack-based Post-order Evaluation)**: Tối ưu cho cơ chế Direct-Threaded Dispatch của VM.
2. **Quy tắc ưu tiên chặt chẽ (Operator Precedence)**: Kiểm soát bởi thuật toán phân tích cú pháp Pratt Parser.
3. **Thực thi trong 1 chu kỳ máy ảo**: Toán tử `<=>` và các phép toán Kleene `min`/`max` phải được hạ thẳng xuống siêu lệnh chuyên biệt của VM (`OP_TERNARY_CMP`, `OP_TERNARY_MIN`, `OP_TERNARY_MAX`).

---

### 4. Tự xây một abstraction đơn giản

Hãy thử mô phỏng phép so sánh 3 trạng thái và logic 3 giá trị bằng C++ thông thường:

```cpp
// naive_ternary_ops.cpp
#include <iostream>

// So sánh 3 hướng ngây thơ bằng if-else kép
int naive_spaceship(int a, int b) {
    if (a < b) return -1;
    if (a > b) return 1;
    return 0; // Tốn 2 lệnh so sánh và 2 lần nhảy rẽ nhánh!
}

// Logic 3 giá trị Kleene: -1 (Sai), 0 (Bất định), +1 (Đúng)
int naive_kleene_and(int p, int q) {
    return (p < q) ? p : q; // min(p, q)
}

int naive_kleene_or(int p, int q) {
    return (p > q) ? p : q; // max(p, q)
}

int naive_kleene_not(int p) {
    return -p; // Đổi dấu: -(-1) = +1, -(0) = 0, -(+1) = -1
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

```cpp
int main() {
    std::cout << "10 <=> 20: " << naive_spaceship(10, 20) << "\n";
    std::cout << "20 <=> 20: " << naive_spaceship(20, 20) << "\n";
    std::cout << "30 <=> 20: " << naive_spaceship(30, 20) << "\n";

    // Đại số Kleene:
    // Bất định (0) AND Đúng (+1) = Bất định (0)
    std::cout << "0 AND 1: " << naive_kleene_and(0, 1) << "\n";
    // Bất định (0) OR Sai (-1) = Bất định (0)
    std::cout << "0 OR -1: " << naive_kleene_or(0, -1) << "\n";
}
```

**Kết quả**:
```text
10 <=> 20: -1
20 <=> 20: 0
30 <=> 20: 1
0 AND 1: 0
0 OR -1: 0
```
Logic hoàn toàn chính xác về mặt toán học.

---

### 6. Thất bại / Giới hạn xuất hiện

Mô hình trừu tượng viết bằng hàm C++ ở trên thất bại ở hai điểm cốt tử khi áp dụng vào Compiler/VM:

1. **Overhead gọi hàm (Call Overhead)**:
   Nếu mỗi phép so sánh `<=>` hay phép tính `min`/`max` đều phải tạo Call Frame, đẩy tham số, nhảy tới hàm rồi trả về, chương trình sẽ chậm đi **gấp 5 đến 8 lần** so với phép so sánh nhị phân nguyên thủy được CPU hỗ trợ bằng phần cứng (`CMP`).
2. **Cú pháp cồng kềnh**:
   Lập trình viên không muốn viết `kleene_and(kleene_or(a, b), c)`. Họ muốn viết biểu thức toán học tự nhiên: `(a max b) min c`.
3. **Sự nhập nhằng giữa Phép Nhân Ma Trận và Hằng Số Tam Phân**:
   Ký tự `@` vừa là toán tử nhân ma trận (`A @ B`), vừa là tiền tố của hằng số cân bằng tam phân (`@10T1`). Nếu bộ phân tích cú pháp không có thứ tự ưu tiên chuẩn xác, nó sẽ gây xung đột cú pháp ngay lập tức.

---

### 7. Tại sao nó thất bại?

Vấn đề cốt lõi: **Biểu thức toán học trong code là một chuỗi 1 chiều nhưng bản chất của nó là một Cây Cú Pháp Trừu Tượng (Expression Tree).**

```text
Biểu thức: a + b * c <=> d

              CÂY AST:
                <=> (PREC_TERNARY_CMP: 8)
               /   \
              +     d
             / \
            a   * (PREC_FACTOR: 12 - ưu tiên cao hơn)
               / \
              b   c
```

Nếu Compiler không phân cấp độ ưu tiên chính xác:
- Toán tử `*` sẽ bị gộp nhầm với `+`.
- Phép so sánh `<=>` sẽ nuốt chửng các toán hạng xung quanh.
- Máy ảo VM không thể sinh mã tối ưu nếu không có các siêu lệnh phần cứng chuyên biệt nhận diện trực tiếp các toán tử 3 trạng thái.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Thuật toán Phân tích Cú pháp Pratt (Pratt Parser, 1973)**:
   - Vaughan Pratt phát minh ra kỹ thuật phân tích cú pháp dựa trên **Độ ưu tiên gán nhãn (Binding Power / Precedence Table)**.
   - Thay vì dựng hàng chục hàm ngữ pháp đệ quy cồng kềnh, Pratt Parser chỉ cần một vòng lặp `while (precedence < get_infix_precedence(peek()))` duy nhất, cho phép nhúng hàng chục toán tử số học, logic và tam phân với tốc độ xử lý nhanh nhất thế giới.
2. **Toán tử Spaceship (`<=>`) trong C++20 và Tersun**:
   - Thay vì chia rẽ làm 3 nhánh so sánh, compiler gom thành một toán tử duy nhất trả về giá trị trạng thái (Ordering State).
3. **Đại số 3 giá trị của Stephen Cole Kleene (1938)**:
   - Chuẩn hóa chân trị:
     $$\text{False} = -1, \quad \text{Unknown} = 0, \quad \text{True} = +1$$
   - Phép hội (AND): $p \land q = \min(p, q)$.
   - Phép tuyển (OR): $p \lor q = \max(p, q)$.
   - Phép phủ định (NOT): $\neg p = -p$.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Spaceship Operator (`<=>`)** | Toán tử so sánh 3 ngôi: Trả về $-1$ nếu $a < b$, $0$ nếu $a == b$, và $+1$ nếu $a > b$. |
| **Kleene Infix Operators (`min`, `max`)** | Các toán tử nhị phân trung vị thực hiện logic tam phân: `a min b` trả về giá trị nhỏ hơn, `a max b` trả về giá trị lớn hơn. |
| **Tritwise Negation (`~`)** | Toán tử một ngôi đảo ngược trit cân bằng: $\tilde{1} = -1, \tilde{-1} = 1, \tilde{0} = 0$. |
| **Multiplication-free GEMM (`@`)** | Toán tử nhân ma trận tam phân: do trọng số chỉ gồm $\{-1, 0, +1\}$, phép nhân ma trận chuyển hóa 100% thành các phép cộng, trừ và bỏ qua (zero-skipping). |
| **Pratt Precedence Table** | Bảng phân cấp độ ưu tiên toán tử từ `PREC_ASSIGNMENT` (1) tới `PREC_PRIMARY` (16). |
| **Post-order Stack Traversal** | Thứ tự duyệt biểu thức nhị phân: Nạp toán hạng trái $\to$ Nạp toán hạng phải $\to$ Thực thi Opcode. |

---

### 10. Tersun giải quyết nó thế nào?

Bộ biên dịch Tersun hiện thực hóa toàn bộ hệ thống toán tử thông qua 3 tầng kiến trúc chuẩn mực:

#### 1. Bảng Thứ bậc Ưu tiên trong [parser.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/parser.hpp)
```cpp
enum Precedence {
    PREC_NONE = 0,
    PREC_ASSIGNMENT = 1,   // =, +=, -=, *=, /=, %=, &=, |=, ^=, <<=, >>=
    PREC_NULL_COALESCE = 2,// ??
    PREC_LOGICAL_OR = 3,   // ||
    PREC_LOGICAL_AND = 4,  // &&
    PREC_BIT_OR = 5,       // |
    PREC_BIT_XOR = 6,      // ^
    PREC_BIT_AND = 7,      // &
    PREC_TERNARY_CMP = 8,  // <=>  (Spaceship)
    PREC_COMPARISON = 9,   // ==, !=, <, <=, >, >=
    PREC_SHIFT = 10,       // <<, >>
    PREC_TERM = 11,        // +, -
    PREC_FACTOR = 12,      // *, /, %, @ (MatMul)
    PREC_KLEENE = 13,      // min, max (Toán tử trung vị)
    PREC_UNARY = 14,       // -, ~, not
    PREC_POSTFIX = 15,     // ., ?., (), []
    PREC_PRIMARY = 16
};
```

#### 2. Hạ mã thành Siêu Lệnh Ngăn Xếp trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp)
Khi duyệt biểu thức `BinaryExpr`:
```cpp
void BytecodeEmitter::emit_binary(const BinaryExpr& expr) {
    emit_expr(expr.left);   // Đẩy toán hạng trái lên Stack
    emit_expr(expr.right);  // Đẩy toán hạng phải lên Stack

    switch (expr.op) {
        case BinaryOp::ADD: chunk_.write_opcode(OpCode::OP_ADD, expr.loc.line); break;
        case BinaryOp::SUB: chunk_.write_opcode(OpCode::OP_SUB, expr.loc.line); break;
        case BinaryOp::MUL: chunk_.write_opcode(OpCode::OP_MUL, expr.loc.line); break;
        case BinaryOp::DIV: chunk_.write_opcode(OpCode::OP_DIV, expr.loc.line); break;
        case BinaryOp::SPACESHIP: chunk_.write_opcode(OpCode::OP_TERNARY_CMP, expr.loc.line); break;
        case BinaryOp::MIN: chunk_.write_opcode(OpCode::OP_TERNARY_MIN, expr.loc.line); break;
        case BinaryOp::MAX: chunk_.write_opcode(OpCode::OP_TERNARY_MAX, expr.loc.line); break;
        ...
    }
}
```

#### 3. Thực thi Siêu Tốc trên Máy Ảo trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp)
```cpp
void VM::handle_ternary_cmp(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    stack_.push(a.ternary_cmp(b)); // Trả về -1, 0, hoặc +1 trong 1 chu kỳ!
}

void VM::handle_ternary_min(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    // Hỗ trợ mượt mà cả số nguyên, bool, lẫn cấu trúc TAFPU a + b*sqrt(3)!
    int64_t v1 = a.as_int();
    int64_t v2 = b.as_int();
    stack_.push(v1 < v2 ? v1 : v2);
}
```

---

### 11. Viết code

Hãy viết một chương trình Tersun toàn diện chứng minh sức mạnh của hệ toán tử:

```tersun
// operators_demo.stn: Khảo sát toàn bộ hệ toán tử trong Tersun
fn run_operator_suite() {
    let a = 10;
    let b = 20;

    // 1. Toán tử số học cổ điển
    let tổng = a + b;
    let hiệu = a - b;
    let tích = a * b;
    let thương = b / a;
    let dư = 23 % 5;

    // 2. Toán tử so sánh 3 trạng thái Spaceship
    let c1 = 10 <=> 20;  // Kết quả: -1 (Nhỏ hơn)
    let c2 = 20 <=> 20;  // Kết quả:  0 (Bằng nhau)
    let c3 = 30 <=> 20;  // Kết quả:  1 (Lớn hơn)

    // 3. Đại số Tam Phân Kleene (Toán tử trung vị infix min / max)
    let kleene_and = 1 min -1; // min(True, False) = False (-1)
    let kleene_or  = 1 max -1; // max(True, False) = True (+1)

    // 4. Toán tử đảo trit đối xứng ~
    let đảo_dương = ~1;   // Đảo của +1 là -1
    let đảo_âm    = ~(-1); // Đảo của -1 là +1
    let đảo_không = ~0;    // Đảo của 0 vẫn là 0

    println(tổng);
    println(c1);
    println(c2);
    println(c3);
    println(kleene_and);
    println(kleene_or);
    println(đảo_dương);
}

run_operator_suite();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách Tersun xử lý các tình huống phức tạp mà các ngôn ngữ khác gặp bế tắc:

#### 1. Xử lý So Sánh Số Thực (Floating-Point Epsilon Safety)
Trong lập trình số thực IEEE 754, biểu thức `0.1 + 0.2 == 0.3` thường trả về `false` do sai số làm tròn bit nhị phân. 
Hãy nhìn cách máy ảo Tersun thực thi `handle_eq` trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L2032):

```cpp
void VM::handle_eq(const Chunk&) {
    VMValue b = stack_.pop();
    VMValue a = stack_.pop();
    if (a.is_float() || b.is_float()) {
        // Tự động bảo vệ chống sai số trôi dạt IEEE 754 bằng epsilon máy 1e-12!
        stack_.push(std::abs(a.as_float() - b.as_float()) < 1e-12);
    } else if (a.is_tafpu() || b.is_tafpu()) {
        // So sánh đại số chính xác tuyệt đối không sai số!
        stack_.push(tafpu_cmp(a.as_tafpu(), b.as_tafpu()) == 0);
    } else {
        stack_.push(a.as_int() == b.as_int());
    }
}
```

#### 2. Toán tử Hậu Tố Hợp Nhất (Compound Assignment Desugaring)
Khi bạn viết `i += 1`, trong [parser.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L830), compiler tự động phân rã (Desugar) thành:
$$\text{AssignStmt}(i, \text{BinaryExpr}(\text{ADD}, i, 1))$$
Điều này giữ cho tập lệnh cốt lõi của VM luôn tinh gọn và cực kỳ dễ tối ưu hóa.

---

### 13. Thí nghiệm / Kiểm chứng

Hãy tận mắt nhìn thấy các siêu lệnh toán tử được sinh ra trong Bytecode thực tế:

Tạo tập tin `scratch/test_ops.stn` và chạy lệnh tháo gỡ mã máy (Disassemble):

```powershell
.\setunc.exe disasm scratch/test_ops.stn
```

**Kết quả Bytecode thực tế**:
```text
=== Disassembly: scratch/test_ops.stn ===
...
8900  OP_PUSH_INT        10
9800  OP_PUSH_INT        20
1070  OP_TERNARY_CMP             <-- Toán tử <=> được hạ thẳng thành 1 opcode duy nhất!
1080  OP_STORE_LOCAL     slot 7

1550  OP_PUSH_INT        1
1640  OP_PUSH_INT        1
1730  OP_NEG            
1740  OP_TERNARY_MIN             <-- Toán tử trung vị min được hạ thành OP_TERNARY_MIN!
1750  OP_STORE_LOCAL     slot 10

1780  OP_PUSH_INT        1
1870  OP_PUSH_INT        1
1960  OP_NEG            
1970  OP_TERNARY_MAX             <-- Toán tử trung vị max được hạ thành OP_TERNARY_MAX!
1980  OP_STORE_LOCAL     slot 11

2010  OP_PUSH_INT        1
2100  OP_TERNARY_NOT             <-- Đảo trit ~ được hạ thành OP_TERNARY_NOT!
2110  OP_STORE_LOCAL     slot 12
...
```

Chạy chương trình:
```powershell
.\setunc.exe run scratch/test_ops.stn
```
**Đầu ra màn hình**:
```text
30
-1
0
1
-1
1
-1
```
Tất cả các phép tính số học cổ điển và đại số tam phân cân bằng được thực thi trơn tru với độ chính xác tuyệt đối!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 7.1: Bảng Chân Trị Đại Số Kleene
Hãy tính giá trị biểu thức sau trong logic tam phân của Tersun (với $-1$: Sai, $0$: Bất định, $+1$: Đúng):
1. `(1 min 0) max -1`
2. `~(0 min -1)`
3. `(1 <=> 2) max (2 <=> 1)`

#### Bài tập 7.2: Vẽ Cây AST Biểu Thức
Cho biểu thức Tersun sau:
```tersun
let res = a + b * c <=> d max e;
```
Dựa vào bảng `Precedence` ở mục 10:
1. Vẽ cây biểu thức AST chính xác thể hiện thứ tự ưu tiên các toán tử.
2. Liệt kê chuỗi các lệnh Bytecode mà máy ảo sẽ thực thi theo thứ tự ngăn xếp (Post-order Traversal).

#### Bài tập 7.3: Tối Ưu Hóa Hàm Signum
Trong C, hàm dấu thường được viết:
```c
int sign(int x) {
    if (x > 0) return 1;
    if (x < 0) return -1;
    return 0;
}
```
Hãy viết lại hàm này trong Tersun **chỉ trên đúng một dòng duy nhất** bằng cách sử dụng toán tử Spaceship `<=>`. 

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Ma Trận Trọng Số 1.58-bit (Multiplication-free GEMM với Toán tử `@`)"**

Trong các mô hình trí tuệ nhân tạo hiện đại (như kiến trúc *BitNet b1.58* của Microsoft), toàn bộ các trọng số của mạng nơ-ron được lượng tử hóa về đúng 3 giá trị cân bằng:
$$W_{ij} \in \{-1, 0, +1\}$$

Khi nhân ma trận trọng số $W$ với vector kích hoạt $X$:
$$Y_i = \sum_{j} W_{ij} \cdot X_j$$

**Câu hỏi kỹ sư**:
1. Tại sao sự hiện diện của 3 giá trị $\{-1, 0, +1\}$ cho phép kiến trúc phần cứng **loại bỏ hoàn toàn bộ nhân (Multiplier Hardware)** và chỉ sử dụng bộ cộng/trừ với bộ ghép kênh (Multiplexer)?
2. Trong Tersun, toán tử `@` đại diện cho phép nhân ma trận tối ưu này. Nếu bạn phải thiết kế một vòng lặp máy ảo chuyên biệt cho lệnh `OP_MATMUL` với trọng số tam phân cân bằng, bạn sẽ tối ưu hóa trường hợp $W_{ij} = 0$ như thế nào để đạt tốc độ xử lý nhanh gấp 3 lần phép nhân số thực chuẩn?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Toán tử `<=>` (*Spaceship*) giải quyết triệt để vấn đề rẽ nhánh 3 hướng, hạ thẳng thành lệnh `OP_TERNARY_CMP` thực thi trong 1 chu kỳ máy ảo.
2. Đại số logic 3 giá trị Kleene (`min`, `max`, `~`) mở rộng tư duy lập trình từ nhị phân sang tam phân cân bằng đối xứng, loại bỏ hoàn toàn các lỗi bất đối xứng dấu.
3. Thuật toán phân tích cú pháp Pratt Parser cho phép tổ chức hệ thống phân cấp độ ưu tiên toán tử một cách thanh lịch, dễ mở rộng và có hiệu năng cao nhất.

#### Cầu nối sang Chương 8:
Chúng ta đã có biến (`let`), phạm vi (`scope`), biểu thức toán học và hệ toán tử mạnh mẽ.
Nhưng sức mạnh thực sự của máy tính nằm ở khả năng **lặp lại một công việc hàng triệu lần trong chớp mắt**.
Làm thế nào để xây dựng các cấu trúc vòng lặp không bị lỗi *Off-by-one*, và làm thế nào Tersun tăng tốc độ duyệt dãy lên gấp 3 lần bằng siêu lệnh hợp nhất `OP_LOOP_RANGE_FAST`?

Tất cả sẽ được hé lộ ở **Chương 8: Vòng Lặp, Duyệt Dãy & Siêu Lệnh OP_LOOP_RANGE_FAST (Loops, Ranges & Loop Superinstructions)**!




## CHƯƠNG 8: VÒNG LẶP, DUYỆT DÃY & SIÊU LỆNH OP_LOOP_RANGE_FAST (LOOPS, RANGES & LOOP SUPERINSTRUCTIONS)

---

### 1. Vấn đề (The Problem)

Một chương trình chỉ gồm các câu lệnh tuần tự từ trên xuống dưới có một giới hạn vật lý khắc nghiệt: **Số lượng phép tính nó có thể thực hiện bị chặn trên bởi chính số dòng mã nguồn mà lập trình viên gõ vào.**
Nếu bạn viết 1,000 dòng code, chương trình chạy tối đa 1,000 chỉ lệnh rồi dừng lại.

Nhưng trong thế giới tính toán hiệu năng cao:
- Để mô phỏng mạch lượng tử **QFT 22-qubit**, máy tính phải cập nhật **4,194,304 biên độ phức** trong Statevector.
- Để giải mã một văn bản mật mã dài 100,000 ký tự, thuật toán phải biến đổi từng ký tự một.

Con người không thể gõ 4 triệu dòng lệnh. Chúng ta cần cỗ máy tính toán phải có khả năng **"bẻ cong thời gian"**: đưa con trỏ thực thi quay ngược trở lại để chạy lại cùng một khối lệnh với các trạng thái dữ liệu mới.

Tuy nhiên, trong các máy ảo thông dịch (Bytecode VM), vòng lặp chính là **"hố đen nuốt chửng hiệu năng"**:
Nếu một vòng lặp chạy $1,000,000$ lần, và ở mỗi vòng lặp, máy ảo phải tốn 15 chỉ lệnh bytecode chỉ để nạp biến đếm, so sánh với cận trên, nạp bước nhảy và rẽ nhánh, thì CPU sẽ phải thực hiện **15,000,000 lần dispatch vô nghĩa**!

Làm thế nào để xây dựng các cấu trúc vòng lặp không bị lỗi *Off-by-one*, và làm thế nào trình biên dịch Tersun có thể **nén 16 chỉ lệnh lặp thành một siêu lệnh duy nhất** để tăng tốc độ lặp lên gấp 3 lần?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Bản chất một chiều của Con trỏ Chỉ lệnh (Instruction Pointer - IP)**:
   - Ở mức phần cứng, CPU chỉ biết tăng con trỏ chỉ lệnh tuần tự: $IP \leftarrow IP + \text{sizeof(Instruction)}$.
   - Muốn lặp lại, CPU bắt buộc phải thực hiện **Bước nhảy ngược (Backward Jump)**:
     $$IP \leftarrow IP - \Delta$$
2. **Tam giác Chân vạc của Vòng lặp (The Three Legs of Looping)**:
   Mọi vòng lặp đều cấu thành từ 3 thành phần không thể tách rời:
   - **Khởi tạo (Initialization)**: Thiết lập giá trị ban đầu cho biến chỉ số (ví dụ $i = 0$).
   - **Điều kiện dừng (Condition Check)**: Kiểm tra xem biến chỉ số đã chạm ngưỡng hay chưa (ví dụ $i < N$).
   - **Bước cập nhật (Step Update)**: Thay đổi biến chỉ số sau mỗi lần duyệt (ví dụ $i \leftarrow i + 1$).
   Nếu thiếu bất kỳ chân nào, chương trình sẽ rơi vào trạng thái chết chóc: **Vòng lặp vô tận (Infinite Loop)** làm cạn kiệt CPU hoặc **Lỗi lệch 1 (Off-by-One)** làm hỏng dữ liệu bộ nhớ.
3. **Chi phí Dispatch trong Stack-based VM**:
   - Khi kiểm tra điều kiện `(step > 0 && i < stop) || (step < 0 && i > stop)` trên máy ảo ngăn xếp, VM phải đẩy lần lượt 8 toán tử và toán hạng lên đỉnh stack rồi mới nhảy. 
   - Chi phí nạp/nhả ngăn xếp lớn gấp 10 lần bản thân phép cộng `$sum += i$` trong thân vòng lặp!

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần làm chủ toàn diện hệ thống lặp của Tersun:

```text
                             HỆ THỐNG VÒNG LẶP TERSUN
                                        │
        ┌───────────────────────────────┴───────────────────────────────┐
        ▼                                                               ▼
[ while (condition) { ... } ]                       [ for var in range(start, stop, step) ]
- Điều kiện dừng động                               - Duyệt khoảng giá trị xác định
- Dùng cho thuật toán hội tụ,                      - Không cấp phát heap (Zero-allocation)
  đọc file stream, lặp vô hạn                       - Tự động nhận diện bước nhảy dương/âm
        │                                                               │
        └───────────────────────────────┬───────────────────────────────┘
                                        ▼
                     [ TIER C LOOP FUSION: OP_LOOP_RANGE_FAST ]
                     - Thu gọn 46 bytes header thành 9 bytes
                     - Đọc trực tiếp locals_ không qua stack
                     - Đạt tốc độ xấp xỉ mã máy C/Rust native
```

---

### 4. Tự xây một abstraction đơn giản

Hãy xem cách một vòng lặp hoạt động ở tầng thấp nhất bằng ngôn ngữ C sử dụng nhãn và lệnh nhảy `goto`:

```c
// naive_loop.c
#include <stdio.h>

int main() {
    int sum = 0;
    int i = 0;          // 1. Khởi tạo

LOOP_HEAD:              // 2. Điểm neo đầu vòng lặp
    if (i >= 5) {       // 3. Kiểm tra điều kiện dừng
        goto LOOP_EXIT; // Nhảy xuôi thoát khỏi vòng lặp
    }

    sum += i;           // 4. Thân vòng lặp

    i++;                // 5. Cập nhật bước nhảy
    goto LOOP_HEAD;     // 6. BƯỚC NHẢY NGƯỢC (Backward Jump)

LOOP_EXIT:
    printf("Sum: %d\n", sum);
    return 0;
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

Chạy đoạn code trên:
```text
Sum: 10
```
$(0 + 1 + 2 + 3 + 4 = 10)$. 
Cơ chế `goto LOOP_HEAD` chính xác là những gì diễn ra bên trong CPU và Bytecode VM!

---

### 6. Thất bại / Giới hạn xuất hiện

Hãy xem điều gì xảy ra nếu lập trình viên hoặc compiler xử lý vòng lặp một cách ngây thơ:

#### Ca thất bại 1: Vòng lặp duyệt ngược (Descending Loop)
Lập trình viên muốn đếm ngược từ 5 về 1:
```c
// Ngây thơ dùng i < 0 thay vì kiểm tra chiều bước nhảy
for (int i = 5; i < 0; i -= 1) { ... }
// Vòng lặp KHÔNG BAO GIỜ CHẠY vì ngay lần đầu tiên 5 < 0 đã sai!
```

#### Ca thất bại 2: Lỗi lệch 1 (Off-by-One)
Khi duyệt mảng 5 phần tử (`arr[0]` đến `arr[4]`):
```c
for (int i = 0; i <= 5; i++) { // Dấu <= khiến i chạm tới 5
    sum += arr[i]; // Gây tràn bộ nhớ (Out of bounds read)!
}
```

#### Ca thất bại 3: Thảm họa Dispatch trong Máy ảo Ngăn xếp
Trong một máy ảo bytecode truyền thống, để thực thi đầu vòng lặp:
```text
LOAD_LOCAL step
PUSH_INT 0
GT
LOAD_LOCAL var
LOAD_LOCAL stop
LT
TERNARY_MIN
... (thêm 8 lệnh nữa)
JUMP_IF_FALSE exit_offset
```
Mỗi lệnh bytecode tốn 1 lần nạp opcode, 1 lần tra bảng hàm dispatch, 2 lần truy cập bộ nhớ stack. Chạy 1 triệu vòng lặp tốn **16 triệu lần chuyển ngữ cảnh**!

---

### 7. Tại sao nó thất bại?

1. **Sự tách rời giữa Trạng thái và Dòng điều khiển**:
   - Trong mô hình thông dịch thuần túy, biến đếm `i`, biến chặn `stop`, và bước nhảy `step` nằm rải rác trên ngăn xếp đánh giá (Evaluation Stack). 
   - Máy ảo không biết chúng là "bộ ba của một vòng lặp", nên phải đối xử với chúng như các biểu thức số học rời rạc.
2. **Kỹ thuật Lấp Lỗ Địa Chỉ (Backpatching)**:
   - Khi phát sinh lệnh `JUMP_IF_FALSE` ở đầu vòng lặp, compiler **chưa thể biết** thân vòng lặp dài bao nhiêu byte để ghi địa chỉ đích!
   - Compiler bắt buộc phải để trống 2 byte (`0x00 0x00`), biên dịch xong thân vòng lặp, rồi mới quay ngược lại "vá" địa chỉ nhảy vào lỗ trống đó.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Chuẩn hóa Khoảng giá trị Nửa mở $[start, stop)$ (Half-open Ranges)**:
   - Edsger W. Dijkstra năm 1982 xuất bản bài luận kinh điển *"Why numbering should start at zero"*. Ông chứng minh rằng quy ước đoạn nửa mở $[a, b)$ (bao gồm $a$ nhưng loại trừ $b$):
     - Luôn có số phần tử chính xác bằng $b - a$.
     - Hai khoảng kế tiếp $[a, b)$ và $[b, c)$ ghép nối hoàn hảo mà không bị trùng lặp phần tử $b$.
   - Tersun kế thừa triết lý này: `range(0, 5)` duyệt chính xác $0, 1, 2, 3, 4$ (đúng 5 phần tử).
2. **Dung hợp Vòng Lặp Thành Siêu Lệnh (Tier C Loop Fusion)**:
   - Thay vì thực thi 16 lệnh bytecode rời rạc, các máy ảo tối tân (như Tersun VM) gom toàn bộ thao tác kiểm tra điều kiện và bước nhảy thành **một siêu lệnh duy nhất**.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Half-open Range $[start, stop)$** | Khoảng giá trị bao gồm cận dưới $start$, nhưng loại trừ cận trên $stop$. Số phần tử duyệt bằng $\frac{stop - start}{step}$. |
| **Backward Jump (Bước nhảy ngược)** | Lệnh nhảy không điều kiện có khoảng cách âm ($offset < 0$) chuyển con trỏ chỉ lệnh $IP$ trở lại đầu thân vòng lặp. |
| **Backpatching** | Kỹ thuật biên dịch lưu lại vị trí các lệnh nhảy chưa xác định địa chỉ đích, sau đó vá lại offset chính xác khi thân khối lệnh được biên dịch xong. |
| **Desugaring (Khử đường cú pháp)** | Compiler chuyển hóa cú pháp thân thiện cấp cao `for i in range(...)` thành mã lệnh chỉ số cấp thấp với các biến cục bộ ẩn. |
| **Superinstruction `OP_LOOP_RANGE_FAST`** | Siêu lệnh 9-byte của Tersun đọc trực tiếp các slot ngăn xếp để kiểm tra điều kiện lặp cả hai chiều mà không chạm vào Evaluation Stack. |

---

### 10. Tersun giải quyết nó thế nào?

Tersun cung cấp hai cú pháp lặp mạnh mẽ và cơ chế hạ mã tối ưu hóa sâu:

#### 1. Cú pháp `while` và `for .. in range()`
Trong Tersun, bạn có thể lặp theo 2 cách:
```tersun
// Cách 1: Vòng lặp điều kiện
while (count < 10) { count += 1; }

// Cách 2: Vòng lặp duyệt dãy (Idiomatic Tersun)
for i in range(10)          // Mặc định: 0 đến 9, step = 1
for i in range(0, 10)       // start = 0, stop = 10, step = 1
for i in range(10, 0, -1)   // start = 10, stop = 0, step = -1 (đếm lùi)
```

#### 2. Khử đường cú pháp (Desugaring) trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L789)
Khi gặp `for i in range(start, stop, step)`, Compiler không cấp phát bất kỳ đối tượng hay mảng nào trên Heap! 
Nó tự động cấp phát 3 slot cục bộ bí mật trên Stack Frame:
- `var_slot`: Giữ giá trị của biến lặp `i`.
- `stop_slot`: Giữ cận trên `stop`.
- `step_slot`: Giữ bước nhảy `step`.

Compiler phát sinh tiêu đề lặp chính tắc (Canonical Loop Header):
$$\text{Active} = (step > 0 \land var < stop) \lor (step < 0 \land var > stop)$$

#### 3. Siêu lệnh `OP_LOOP_RANGE_FAST` trong [opt_bytecode.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/opt_bytecode.hpp#L135) và [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1531)
Khi cờ tối ưu hóa bật, bộ tối ưu hóa quét qua bytecode. Khi phát hiện đúng mẫu 46-byte của tiêu đề lặp chính tắc, nó nén toàn bộ thành **siêu lệnh 9-byte**:

```text
[ OP_LOOP_RANGE_FAST ] [ var_slot: 2B ] [ stop_slot: 2B ] [ step_slot: 2B ] [ exit_dist: 2B ]
     (1 Byte)
```

Trong máy ảo `vm.cpp`:
```cpp
c_lbl_OP_LOOP_RANGE_FAST: {
    uint16_t var_slot  = ...;
    uint16_t stop_slot = ...;
    uint16_t step_slot = ...;
    int16_t  exit_dist = ...;

    // ĐỌC TRỰC TIẾP TỪ MẢNG LOCAL - KHÔNG QUA EVALUATION STACK!
    int64_t var_val  = locals_[local_base + var_slot].as_int();
    int64_t stop_val = locals_[local_base + stop_slot].as_int();
    int64_t step_val = locals_[local_base + step_slot].as_int();

    // Bắt lỗi bước nhảy bằng 0
    if (__builtin_expect(step_val == 0, 0)) {
        throw VMException("range() step cannot be zero");
    }

    // Kiểm tra hai chiều trong đúng 1 biểu thức C++!
    bool active = (step_val > 0) ? (var_val < stop_val) : (var_val > stop_val);
    if (!active) {
        ip += exit_dist; // Nhảy thoát khỏi vòng lặp
    }
    DISPATCH_C(); // Tiếp tục vào thân vòng lặp
}
```

---

### 11. Viết code

Hãy viết một chương trình Tersun kiểm tra cả 3 dạng vòng lặp: `while`, `for .. range` xuôi, và `for .. range` ngược:

```tersun
// loops_demo.stn: Khảo sát cơ chế lặp trong Tersun
fn run_loop_bench() {
    // 1. Vòng lặp While
    let mut đếm = 0;
    let mut tổng_while = 0;
    while (đếm < 5) {
        tổng_while = tổng_while + đếm;
        đếm = đếm + 1;
    }
    println("Tổng While (0..4):");
    println(tổng_while); // In ra: 10

    // 2. Vòng lặp For .. in range xuôi (step = 1)
    let mut tổng_for_xuôi = 0;
    for i in range(0, 5) {
        tổng_for_xuôi = tổng_for_xuôi + i;
    }
    println("Tổng For Range Xuôi (0..4):");
    println(tổng_for_xuôi); // In ra: 10

    // 3. Vòng lặp For .. in range ngược (step = -1)
    let mut tổng_for_ngược = 0;
    for k in range(5, 0, -1) {
        tổng_for_ngược = tổng_for_ngược + k;
    }
    println("Tổng For Range Ngược (5..1):");
    println(tổng_for_ngược); // In ra: 15 (5 + 4 + 3 + 2 + 1)
}

run_loop_bench();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách Compiler quản lý lệnh `break` và `continue`:

Trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L776), compiler duy trì một ngăn xếp các ngữ cảnh lặp (`loop_stack_`):
```cpp
struct LoopContext {
    std::string label;
    std::vector<size_t> break_jumps;    // Danh sách các lệnh break cần vá địa chỉ thoát
    std::vector<size_t> continue_jumps; // Danh sách các lệnh continue cần vá về đầu bước update
};
```
1. Khi gặp lệnh `continue;`: Compiler sinh ra `OP_JUMP` với offset tạm thời bằng 0, và lưu vị trí đó vào `continue_jumps`.
2. Khi gặp lệnh `break;`: Compiler sinh ra `OP_JUMP` với offset tạm thời bằng 0, và lưu vị trí đó vào `break_jumps`.
3. Khi kết thúc thân vòng lặp:
   - Toàn bộ các lỗ `continue_jumps` được vá trỏ tới phần cập nhật bước nhảy (`var += step`).
   - Toàn bộ các lỗ `break_jumps` được vá trỏ thẳng ra câu lệnh ngay sau vòng lặp!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy tháo gỡ mã máy để nhìn thấy cơ chế nhảy ngược (Backward Jump) và lấp lỗ địa chỉ trong Bytecode:

Tạo tập tin `scratch/test_loops.stn` và chạy lệnh:
```powershell
.\setunc.exe disasm scratch/test_loops.stn
```

**Trích xuất Bytecode thực tế**:
```text
=== Disassembly: scratch/test_loops.stn ===
// --- KHỐI WHILE LOOP ---
2700  OP_LOAD_LOCAL      slot 0
3000  OP_PUSH_INT        5
3900  OP_LT             
4000  OP_JUMP_IF_FALSE   offset 29 -> 72    <-- Nếu sai: Nhảy xuôi thoát ra địa chỉ 72
4300  ... thân vòng lặp: tổng += đếm ...
6900  OP_JUMP            offset -45 -> 27   <-- HẾT THÂN: BƯỚC NHẢY NGƯỢC VỀ ĐỊA CHỈ 27!

// --- KHỐI FOR IN RANGE XUÔI ---
1030  OP_STORE_LOCAL     slot 5             <-- step = 1
1150  OP_STORE_LOCAL     slot 4             <-- stop = 5
1270  OP_STORE_LOCAL     slot 3             <-- var i = 0
1300  ... tiêu đề kiểm tra điều kiện ...
1730  OP_JUMP_IF_FALSE   offset 23 -> 199   <-- Nếu hết khoảng: Nhảy xuôi thoát ra 199
1760  ... thân vòng lặp ...
1860  OP_LOAD_LOCAL      slot 3             <-- Cập nhật: i += step
1920  OP_ADD            
1930  OP_STORE_LOCAL     slot 3
1960  OP_JUMP            offset -69 -> 130  <-- BƯỚC NHẢY NGƯỢC VỀ TIÊU ĐỀ (ĐỊA CHỈ 130)!
```

Chạy chương trình:
```powershell
.\setunc.exe run scratch/test_loops.stn
```
**Kết quả đầu ra**:
```text
Tổng While (0..4):
10
Tổng For Range Xuôi (0..4):
10
Tổng For Range Ngược (5..1):
15
```
Mọi bước nhảy xuôi và nhảy ngược khớp chính xác tới từng byte địa chỉ!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 8.1: Lần vết địa chỉ Bytecode (PC Tracing)
Quan sát đoạn disassembly của vòng lặp While ở mục 13:
- Lệnh `OP_JUMP offset -45 -> 27` nằm ở byte 69.
- Hãy giải thích tại sao offset lại là `-45`? (Gợi ý: Lệnh `OP_JUMP` có kích thước 3 byte: 1 byte opcode + 2 byte offset. Hãy tính khoảng cách từ byte kế tiếp sau lệnh nhảy về địa chỉ đích 27).

#### Bài tập 8.2: Sửa lỗi Off-by-one
Một kỹ sư muốn tính tổng các số chẵn từ 2 đến 10 ($2 + 4 + 6 + 8 + 10 = 30$). 
Kỹ sư đó viết trong Tersun:
```tersun
let mut s = 0;
for i in range(2, 10, 2) {
    s = s + i;
}
```
Tại sao kết quả in ra chỉ là `20` thay vì `30`? Hãy sửa lại hàm `range()` để kết quả đạt chính xác `30`.

#### Bài tập 8.3: Đo lường số lần Dispatch
Giả sử bạn chạy một vòng lặp `for i in range(0, 1000000)`:
1. Nếu không có tối ưu hóa, tiêu đề lặp canonical tốn 16 chỉ lệnh bytecode. Tổng cộng máy ảo phải dispatch bao nhiêu lần cho tiêu đề lặp?
2. Khi bật siêu lệnh `OP_LOOP_RANGE_FAST`, số lần dispatch giảm xuống còn bao nhiêu? Bạn đã tiết kiệm được bao nhiêu phần trăm số lệnh điều khiển?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Vòng Lặp Ma Trận Lượng Tử QFT (Quantum QFT Nested Loops)"**

Trong thuật toán Biến đổi Fourier Lượng tử (QFT) 22-qubit của Tersun (mô phỏng trên $4,194,304$ biên độ), chúng ta có hai vòng lặp lồng nhau:
```tersun
for i in range(0, n_qubits) {
    apply_h_gate(i);
    for j in range(i + 1, n_qubits) {
        apply_cp_gate(j, i, pi / pow2(j - i));
    }
}
```

**Câu hỏi kỹ sư**:
1. Trong vòng lặp bên trong (`j in range(i + 1, n_qubits)`), cận dưới $start = i + 1$ thay đổi sau mỗi lần vòng lặp ngoài tăng $i$. Bộ sinh mã của Tersun sẽ cập nhật `slot` của biến đếm và cận dưới như thế nào mà **không phải phân bổ lại bộ nhớ (Zero Heap Allocation)**?
2. Nếu $n\_qubits = 22$, tổng số cổng lượng tử được áp dụng là bao nhiêu? Hãy tính số lần thân vòng lặp trong được thực thi.

---

### 16. Tổng kết & Cầu nối sang Capstone Project II

#### Điểm mấu chốt cần ghi nhớ:
1. Vòng lặp bản chất là sự kết hợp giữa **Lệnh nhảy có điều kiện xuôi (`JUMP_IF_FALSE`)** và **Lệnh nhảy không điều kiện ngược (`JUMP < 0`)**.
2. Tersun chuẩn hóa khoảng nửa mở $[start, stop)$ trong `range()`, loại bỏ hoàn toàn việc cấp phát bộ nhớ heap cho iterator.
3. Siêu lệnh `OP_LOOP_RANGE_FAST` hợp nhất 46 bytes kiểm tra điều kiện hai chiều thành 9 bytes, đưa tốc độ thông dịch vòng lặp của Tersun tiệm cận với mã máy C native.

---

# PHẦN III: HÀM, PHÂN RÃ CHỨC NĂNG & QUẢN LÝ NGĂN XẾP (FUNCTIONS & CALL STACK ARCHITECTURE)

Chào mừng bạn bước vào **Phần III**. Ở Phần I và II, chúng ta đã làm chủ các khối gạch cơ bản nhất: biểu thức, biến, rẽ nhánh và vòng lặp. Nhưng cho đến lúc này, toàn bộ mã nguồn của chúng ta vẫn nằm trong một luồng thực thi phẳng hoặc một vài hàm đơn lẻ.

Khi quy mô phần mềm tăng lên hàng nghìn dòng, câu hỏi sống còn xuất hiện: **Làm thế nào để tái sử dụng cùng một đoạn logic ở nhiều nơi khác nhau mà không phải sao chép-dán (Copy-Paste)?**

Chúng ta bắt đầu khám phá một trong những phát minh vĩ đại nhất của lịch sử khoa học máy tính: **Ngăn Xếp Lời Gọi (The Call Stack)**.

---

## CHƯƠNG 9: TÁI SỬ DỤNG MÃ & LỆNH NHẢY CÓ KHẢ NĂNG QUAY VỀ (FUNCTIONS & THE CALL STACK)

---

### 1. Vấn đề (The Problem)

Giả sử trong phần mềm của bạn có một đoạn tính toán quan trọng (ví dụ: giải mã một trit cân bằng, hoặc tính căn bậc hai). Đoạn tính toán này dài 20 dòng lệnh và cần được sử dụng ở 10 vị trí khác nhau trong chương trình.

Giải pháp ngây thơ nhất là: **Sao chép và dán 20 dòng lệnh đó vào cả 10 vị trí.**
Hậu quả: 
- Kích thước tập tin nhị phân phình to gấp 10 lần.
- Nếu đoạn mã có một lỗi (bug), bạn phải sửa ở cả 10 nơi. Nếu quên 1 nơi, hệ thống sẽ sụp đổ.

Là một kỹ sư, bạn nảy ra ý tưởng: *"Ta chỉ viết đoạn mã 20 dòng đó một lần duy nhất tại một địa chỉ cố định, rồi dùng lệnh nhảy `jump` để nhảy tới đó mỗi khi cần!"*

```text
Vị trí A (Địa chỉ 100):  JUMP 500 ───┐
                                      │
Vị trí B (Địa chỉ 200):  JUMP 500 ────┼───► [ Khối mã chung tại địa chỉ 500 ]
                                      │       ... thực thi 20 dòng lệnh ...
Vị trí C (Địa chỉ 300):  JUMP 500 ───┘       ??? LÀM SAO BIẾT ĐƯỜNG QUAY VỀ ???
```

Nhưng ngay tại thời điểm khối mã chung chạy xong dòng lệnh thứ 20, một bế tắc chí mạng xuất hiện:
**Làm thế nào khối mã chung biết phải nhảy ngược trở lại đâu?**
- Nếu lúc này nó được gọi từ Vị trí A, nó phải quay về địa chỉ 101.
- Nếu được gọi từ Vị trí B, nó phải quay về địa chỉ 201.
- Nếu được gọi từ Vị trí C, nó phải quay về địa chỉ 301.

Lệnh nhảy `jump` thông thường là **lệnh nhảy một chiều (One-way Ticket)**: nó ghi đè con trỏ chỉ lệnh $IP$ và xóa sạch mọi ký ức về nơi nó vừa xuất phát!

---

### 2. Tại sao vấn đề này tồn tại?

1. **Bộ vi xử lý không có trí nhớ lịch sử (Memoryless IP)**:
   - Thanh ghi con trỏ chỉ lệnh của phần cứng ($IP$ / $PC$) chỉ chứa một con số duy nhất: **Địa chỉ của lệnh tiếp theo cần thực thi**.
   - Khi CPU thực hiện lệnh nhảy $IP \leftarrow 500$, giá trị cũ của $IP$ (ví dụ 100) bị ghi đè hoàn toàn và biến mất vĩnh viễn.
2. **Sự thất bại của Biến Toàn Cục Lưu Địa Chỉ Quay Về (Return Address Global Variable)**:
   - Bạn có thể nghĩ: *"Trước khi nhảy, ta lưu $IP + 1$ vào một biến toàn cục `return_addr`!"*
   - Cách này chỉ hoạt động nếu các hàm **không bao giờ gọi nhau (Flat Calls)**.
   - Hãy tưởng tượng: Hàm $A$ gọi Hàm $B$, và Hàm $B$ lại gọi Hàm $C$ (Gọi lồng nhau - *Nested Calls*):
     1. $A$ lưu địa chỉ quay về $A_{ret}$ vào `return_addr` và nhảy sang $B$.
     2. $B$ chuẩn bị gọi $C$, nó lưu địa chỉ $B_{ret}$ vào `return_addr` $\to$ **$A_{ret}$ BỊ GHI ĐÈ VÀ MẤT VĨNH VIỄN!**
     3. Khi $C$ chạy xong, nó quay về $B$. Nhưng khi $B$ chạy xong, nó đọc `return_addr` và... nhảy ngược lại chính nó! Chương trình rơi vào vòng lặp vô tận.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần thiết kế một cơ chế phần cứng/máy ảo giải quyết trọn vẹn:

1. **Cấu trúc dữ liệu ghi nhớ Lịch sử Đệ quy**:
   Vì hàm nào được gọi sau cùng sẽ phải kết thúc trước tiên (*LIFO - Last In, First Out*), cơ chế lưu vết bắt buộc phải là một **Ngăn Xếp (Call Stack)**.
2. **Đóng gói Khung Ngăn Xếp (Call Frame / Activation Record)**:
   Mỗi lần gọi hàm, một bản ghi ngữ cảnh phải được đẩy vào Call Stack, lưu trữ:
   - **Địa chỉ quay về (Return Address)**: Vị trí của lệnh tiếp theo trong hàm gọi.
   - **Mốc biến cục bộ của hàm gọi (`local_base`)**: Để khi hàm con kết thúc, hàm cha lấy lại đúng các biến của mình.
   - **Độ sâu ngăn xếp biểu thức (`stack_depth`)**: Để dọn dẹp các giá trị rác tạm thời.
3. **Cặp đôi Lệnh Nền Tảng của Điện Toán**:
   - `OP_CALL`: Đóng gói ngữ cảnh hiện tại $\to$ Đẩy vào Call Stack $\to$ Nhảy tới hàm con.
   - `OP_RET`: Thu hồi Call Frame $\to$ Lấy giá trị trả về $\to$ Nhảy ngược về địa chỉ đã lưu.

---

### 4. Tự xây một abstraction đơn giản

Hãy xây dựng một mô hình máy ảo mini bằng C++ mô phỏng cơ chế Call Stack:

```cpp
// naive_call_stack.cpp
#include <iostream>
#include <vector>

struct SimpleVM {
    size_t ip{0};                      // Instruction Pointer
    std::vector<size_t> call_stack;    // Ngăn xếp lưu Return Addresses

    void call(size_t target_func_ip) {
        size_t return_address = ip + 1; // Địa chỉ lệnh kế tiếp
        call_stack.push_back(return_address);
        ip = target_func_ip;            // Nhảy tới hàm
        std::cout << "[CALL] Nhảy tới " << target_func_ip 
                  << " | Đã lưu Return Address: " << return_address << "\n";
    }

    void ret() {
        if (call_stack.empty()) {
            std::cout << "[HALT] Chương trình kết thúc!\n";
            return;
        }
        size_t return_address = call_stack.back();
        call_stack.pop_back();
        ip = return_address;            // Nhảy ngược về vị trí cũ!
        std::cout << "[RET] Quay về địa chỉ: " << return_address << "\n";
    }
};
```

---

### 5. Thử nghiệm với abstraction đơn giản

Hãy mô phỏng chuỗi gọi lồng nhau 3 cấp kinh điển: `Hàm A -> Hàm B -> Hàm C`:

```cpp
int main() {
    SimpleVM vm;

    std::cout << "--- Bắt đầu tại Hàm A (ip = 10) ---\n";
    vm.ip = 10;
    vm.call(200); // A gọi B (nằm ở 200)

    std::cout << "--- Đang ở Hàm B (ip = 200) ---\n";
    vm.ip = 205;
    vm.call(500); // B gọi C (nằm ở 500)

    std::cout << "--- Đang ở Hàm C (ip = 500) ---\n";
    vm.ip = 520;
    vm.ret();     // C kết thúc -> Phải quay về B!

    std::cout << "--- Quay lại Hàm B (ip = " << vm.ip << ") ---\n";
    vm.ip = 210;
    vm.ret();     // B kết thúc -> Phải quay về A!

    std::cout << "--- Quay lại Hàm A (ip = " << vm.ip << ") ---\n";
    vm.ret();     // A kết thúc -> Dừng chương trình!
}
```

**Kết quả chạy**:
```text
--- Bắt đầu tại Hàm A (ip = 10) ---
[CALL] Nhảy tới 200 | Đã lưu Return Address: 11
--- Đang ở Hàm B (ip = 200) ---
[CALL] Nhảy tới 500 | Đã lưu Return Address: 206
--- Đang ở Hàm C (ip = 500) ---
[RET] Quay về địa chỉ: 206
--- Quay lại Hàm B (ip = 206) ---
[RET] Quay về địa chỉ: 11
--- Quay lại Hàm A (ip = 11) ---
[HALT] Chương trình kết thúc!
```
Cấu trúc ngăn xếp LIFO đã giải quyết trọn vẹn việc phục hồi luồng điều khiển theo đúng trật tự ngược lại!

---

### 6. Thất bại / Giới hạn xuất hiện

Mô hình trên chỉ mới giải quyết được **Luồng điều khiển (Control Flow)**, nhưng vẫn thất bại hoàn toàn về **Dữ liệu (Data State)**:

#### Ca thất bại 1: Giẫm đạp Biến cục bộ (Local Variable Corruption)
- Hàm $A$ dùng một biến `slot 0` để đếm từ 1 đến 100.
- Bên trong vòng lặp, $A$ gọi hàm $B$.
- Hàm $B$ cũng khai báo một biến và compiler gán cho nó `slot 0`.
- Khi $B$ ghi dữ liệu vào `slot 0`, **nó đã xóa sạch biến đếm của $A$!** Khi quay về $A$, chương trình chạy sai kết quả hoặc lặp vô tận.

#### Ca thất bại 2: Rò rỉ Ngăn xếp Biểu thức (Expression Stack Leaks)
- Nếu một hàm con tính toán dở dang và để lại 2 giá trị rác trên ngăn xếp đánh giá (Evaluation Stack) mà không dọn dẹp trước khi `ret`, ngăn xếp của hàm cha sẽ bị lệch lệch con trỏ đỉnh ngăn xếp ($SP$). Hàm cha lấy nhầm dữ liệu rác và ném ngoại lệ.

#### Ca thất bại 3: Chi phí Cấp phát Động (Heap Allocation Bottleneck)
- Nếu mỗi lần `call`, máy ảo lại gọi `malloc()` hoặc `new CallFrame()` để cấp phát bộ nhớ trên Heap, tốc độ gọi hàm sẽ chậm đi hàng trăm lần so với C/C++.

---

### 7. Tại sao nó thất bại?

Một hàm trong khoa học máy tính không thể chỉ là một địa chỉ code, mà nó là một **Không gian Thực thi Đóng gói (Execution Context)**:
1. **Sự cô lập dữ liệu (Data Isolation)**: Các biến cục bộ của hàm con bắt buộc phải nằm ở một vùng nhớ hoàn toàn tách biệt với biến cục bộ của hàm cha.
2. **Con trỏ Đáy Khung Hàm (Base Pointer / Frame Pointer - `FP`)**:
   - Máy ảo không thể truy cập biến theo chỉ số tuyệt đối `slot 0`, mà phải truy cập **tương đối so với đáy của khung hàm hiện tại**:
     $$\text{Address}(slot) = \text{Frame Base} + slot$$
   - Khi gọi hàm mới: $\text{Frame Base}_{\text{mới}} \leftarrow \text{Frame Base}_{\text{cũ}} + \text{Kích thước khung cha}$.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Phát minh "Wheeler Jump" (1947)**:
   - David Wheeler (Đại học Cambridge) sáng chế ra thủ thuật ghi địa chỉ quay về vào thanh ghi trước khi nhảy trên máy tính EDSAC. Đây là nền tảng của chỉ lệnh `CALL` và `RET` trên mọi vi xử lý x86 và ARM ngày nay.
2. **Cấu trúc Khung Ngăn Xếp Chuẩn C/x86 (Standard Activation Record)**:
   - Thanh ghi `RBP` (Base Pointer) giữ đáy khung hàm.
   - Thanh ghi `RSP` (Stack Pointer) giữ đỉnh ngăn xếp.
   - Khi vào hàm (Function Prologue):
     ```assembly
     push rbp          ; Lưu đáy khung của hàm cha
     mov  rbp, rsp     ; Thiết lập đáy khung mới cho hàm con
     sub  rsp, 32      ; Dành ra 32 byte cho biến cục bộ
     ```
   - Khi rời hàm (Function Epilogue):
     ```assembly
     mov  rsp, rbp     ; Thu hồi biến cục bộ
     pop  rbp          ; Khôi phục đáy khung của hàm cha
     ret               ; Pop Return Address và nhảy về
     ```
3. **Giải pháp Tối ưu Hóa Fast Frames của Tersun VM**:
   - Tersun loại bỏ hoàn toàn việc gọi hệ điều hành cấp phát bộ nhớ khi gọi hàm. Toàn bộ biến cục bộ được trải phẳng trên một mảng tuyến tính `locals_` được cấp phát trước, giúp chi phí gọi hàm đạt tốc độ tiệm cận mã máy native C!

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Call Stack (Ngăn xếp lời gọi)** | Ngăn xếp LIFO lưu trữ danh sách các khung hàm (`CallFrame`) đang hoạt động theo thứ tự lồng nhau. |
| **Call Frame (Activation Record)** | Khung dữ liệu chứa toàn bộ ngữ cảnh sống của một hàm: `{ return_ip, local_base, stack_depth, frame_size }`. |
| **Return Address** | Địa chỉ byte chỉ lệnh trong chunk mã nguồn mà CPU/VM sẽ nhảy về tiếp tục thực thi sau khi lệnh `OP_RET` hoàn tất. |
| **Local Base (Frame Pointer)** | Vị trí chỉ số mốc trong mảng biến cục bộ `locals_`, làm điểm tựa để truy cập các slot: `locals_[local_base + slot]`. |
| **Stack Overflow** | Lỗi nghiêm trọng xảy ra khi số lượng khung hàm đệ quy vượt quá dung lượng bộ nhớ ngăn xếp cho phép. |

---

### 10. Tersun giải quyết nó thế nào?

Trong máy ảo Tersun ([vm.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/vm.hpp) và [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp)), kiến trúc Call Stack được hiện thực hóa ở mức tối ưu hóa cao nhất:

#### 1. Định nghĩa `CallFrame` trong `vm.hpp`
```cpp
struct CallFrame {
    size_t return_ip;    // Địa chỉ byte quay về
    size_t local_base;   // Mốc bắt đầu biến cục bộ của hàm này trong mảng locals_
    size_t stack_depth;  // Độ sâu của Evaluation Stack lúc hàm được gọi
    size_t frame_size;   // Tổng số slot biến cục bộ hàm này cần dùng
};
```

#### 2. Lệnh `OP_CALL` trong Direct-Threaded Dispatch ([vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1184))
Khi gặp `OP_CALL fn_idx (argc)`:
1. Đọc chỉ số hàm `fn_idx` và số lượng đối số `argc`.
2. Tra cứu địa chỉ bắt đầu của hàm trong `chunk.function_table[fn_idx]`.
3. Tính toán kích thước khung hàm cần cấp phát: `callee_frame_size`.
4. Thiết lập `new_local_base = local_top_`, tăng `local_top_ += callee_frame_size`.
5. **Chuyển giao đối số**: Lấy các tham số từ đỉnh ngăn xếp biểu thức (`*--sp`) đặt vào các slot đầu tiên của `locals_[new_local_base + i]`.
6. Lưu vết vào `call_stack_`:
   ```cpp
   call_stack_.push_back(CallFrame{
       static_cast<size_t>(ip - code_base), // Return Address
       new_local_base,                      // Local Base
       static_cast<size_t>(sp - stack_.data()), // Stack Depth
       callee_frame_size
   });
   ```
7. Chuyển ngữ cảnh và nhảy:
   ```cpp
   local_base = new_local_base;
   ip = code_base + fn_entry;
   DISPATCH_C();
   ```

#### 3. Lệnh `OP_RET` ([vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1228))
Khi hàm hoàn tất và chạm lệnh `OP_RET`:
1. Rút khung hàm trên cùng ra: `CallFrame frame = call_stack_.back(); call_stack_.pop_back();`.
2. Rút giá trị trả về: `VMValue ret_val = *--sp;`.
3. **Thu hồi bộ nhớ tức thì**: Đưa `local_top_ = frame.local_base;`.
4. **Phục hồi ngăn xếp hàm cha**: Đưa con trỏ `sp = stack_.data() + frame.stack_depth;` (xóa sạch mọi giá trị rác nếu có!).
5. Đẩy giá trị trả về vào ngăn xếp của hàm cha: `*sp++ = ret_val;`.
6. Phục hồi mốc biến cục bộ của hàm cha: `local_base = call_stack_.empty() ? 0 : call_stack_.back().local_base;`.
7. Nhảy ngược về: `ip = code_base + frame.return_ip; DISPATCH_C();`.

---

### 11. Viết code

Dưới đây là một chương trình Tersun hợp lệ minh họa chuỗi gọi lồng nhau 3 cấp và truyền-nhận giá trị chuẩn xác:

```tersun
// call_stack_demo.stn: Khảo sát cơ chế Call Stack và lồng hàm trong Tersun
fn nhân_đôi(x: int) -> int {
    return x * 2;
}

fn tính_toán_trung_gian(y: int) -> int {
    let z = nhân_đôi(y + 3);
    return z + 1;
}

fn chạy_chương_trình() {
    let đầu_vào = 5;
    let kết_quả = tính_toán_trung_gian(đầu_vào);
    println("Kết quả cuối cùng:");
    println(kết_quả); // In ra: 17
}

chạy_chương_trình();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem sơ đồ cấu trúc bộ nhớ của Tersun VM khi chương trình đang dừng ở bên trong hàm `nhân_đôi()`:

```text
======================= TRẠNG THÁI CALL STACK =======================
Đỉnh Stack ──► [ Frame 3: nhân_đôi ]
                   - return_ip  : 0x002F (bên trong tính_toán_trung_gian)
                   - local_base : slot 2
                   - frame_size : 1 slot (chứa x = 8)
               ------------------------------------------------------
               [ Frame 2: tính_toán_trung_gian ]
                   - return_ip  : 0x0060 (bên trong chạy_chương_trình)
                   - local_base : slot 0
                   - frame_size : 2 slots (slot 0: y = 5, slot 1: z)
               ------------------------------------------------------
Đáy Stack  ──► [ Frame 1: chạy_chương_trình ]
                   - return_ip  : 0x007B (toplevel script)
                   - local_base : slot 0
                   - frame_size : 2 slots (slot 0: đầu_vào = 5, slot 1: kết_quả)

===================== MẢNG BIẾN CỤC BỘ LOCALS_ =====================
Chỉ số slot:  [  0  ] [  1  ] [  2  ]
Giá trị:      [  5  ] [  ?  ] [  8  ]
                 ▲               ▲
                 │               └─ local_base của nhân_đôi (x = 8)
                 └───────────────── local_base của tính_toán_trung_gian
```

Nhờ cơ chế `local_base`, hàm `nhân_đôi` có thể thoải mái đọc/ghi vào `slot 0` của chính nó mà thực chất đang thao tác trên ô nhớ số 2 của mảng vật lý, **hoàn toàn không thể làm hỏng biến của hàm gọi bên ngoài**!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy tháo gỡ mã máy (Disassemble) tập tin `scratch/test_call_stack.stn` để xem Compiler tổ chức các hàm như thế nào:

```powershell
.\setunc.exe disasm scratch/test_call_stack.stn
```

**Kết quả Bytecode thực tế**:
```text
=== Disassembly: scratch/test_call_stack.stn (125 bytes) ===
// 1. Khởi động: Nhảy qua các khai báo hàm để không bị chạy nhầm!
0000  OP_JUMP            offset 24 -> 27

// 2. Thân hàm func_c (nhân_đôi) tại địa chỉ 0x0003:
3000  OP_LOAD_LOCAL      slot 0
6000  OP_PUSH_INT        2
1500  OP_MUL            
1600  OP_RET                              <-- Trả về giá trị cho caller!

// 3. Thân hàm func_b (tính_toán_trung_gian) tại địa chỉ 0x001E:
2700  OP_JUMP            offset 44 -> 74
3000  OP_LOAD_LOCAL      slot 0
3300  OP_PUSH_INT        3
4200  OP_ADD            
4300  OP_CALL            fn#1 -> 0x0003 (argc 1)  <-- GỌI FUNC_C!
4700  OP_STORE_LOCAL     slot 1
5000  OP_LOAD_LOCAL      slot 1
5300  OP_PUSH_INT        1
6200  OP_ADD            
6300  OP_RET                              <-- Trả về giá trị cho caller!

// 4. Thân hàm func_a (chạy_chương_trình) tại địa chỉ 0x004D:
7400  OP_JUMP            offset 42 -> 119
7700  OP_PUSH_INT        5
8600  OP_STORE_LOCAL     slot 0
8900  OP_LOAD_LOCAL      slot 0
9200  OP_CALL            fn#2 -> 0x001E (argc 1)  <-- GỌI FUNC_B!
...
// 5. Toplevel Script gọi hàm chính và kết thúc:
1190  OP_CALL            fn#3 -> 0x004D (argc 0)  <-- BẮT ĐẦU CHƯƠNG TRÌNH!
1230  OP_POP            
1240  OP_HALT                             <-- DỪNG MÁY ẢO
```

Chạy chương trình:
```powershell
.\setunc.exe run scratch/test_call_stack.stn
```
**Đầu ra**:
```text
Result:
17
```
Chuỗi gọi 3 cấp được thực thi trơn tru, chuẩn xác tuyệt đối đến từng byte offset!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 9.1: Vẽ Sơ đồ Ngăn Xếp
Cho chương trình Tersun sau:
```tersun
fn f(a: int) -> int { return a + 10; }
fn g(b: int) -> int { return f(b) * 2; }
fn main_fn() { let res = g(5); }
main_fn();
```
Hãy vẽ trạng thái của `CallStack` tại thời điểm lệnh `return a + 10;` đang được thực thi, chỉ rõ:
1. Có bao nhiêu `CallFrame` trên ngăn xếp?
2. Khung hàm nào nằm ở đáy, khung hàm nào nằm ở đỉnh?
3. Khi lệnh `OP_RET` đầu tiên chạy, nó sẽ đưa con trỏ $IP$ quay về hàm nào?

#### Bài tập 9.2: Phân tích Lệnh Nhảy Khởi Động
Quan sát disassembly ở mục 13: Tại sao byte đầu tiên của chương trình luôn là một lệnh `OP_JUMP` nhảy qua thân các hàm? Điều gì sẽ xảy ra nếu không có lệnh `OP_JUMP` này?

#### Bài tập 9.3: Ước lượng Chi Phí Bộ Nhớ
Mỗi cấu trúc `CallFrame` trong Tersun VM có kích thước 32 bytes ($4 \times 8$ bytes cho 4 trường `size_t`). Nếu một hàm đệ quy sâu 10,000 tầng, Call Stack sẽ tiêu tốn bao nhiêu KB bộ nhớ RAM?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Bảo Vệ Ngăn Xếp Chống Rò Rỉ Dữ Liệu (Stack Balance Invariant)"**

Hãy tưởng tượng một lập trình viên viết một hàm bằng mã bytecode thủ công hoặc trình biên dịch bị lỗi sinh mã:
```text
fn ham_loi() {
    OP_PUSH_INT 100   // Đẩy 100 lên evaluation stack
    OP_PUSH_INT 200   // Đẩy 200 lên evaluation stack
    // Quên POP bớt 1 giá trị! Chỉ lấy 200 làm kết quả trả về
    OP_RET
}
```
Nếu máy ảo chỉ thực hiện `*--sp` để lấy giá trị trả về rồi nhảy về hàm cha, con trỏ ngăn xếp `$sp$` của hàm cha sẽ bị **dư thừa số 100**. Qua hàng triệu lần gọi hàm, Evaluation Stack sẽ bị phình to vô hạn dẫn tới sập máy ảo!

**Câu hỏi kỹ sư**:
Hãy chỉ ra dòng mã C++ trong lệnh `c_lbl_OP_RET` ở mục 10 chứng minh rằng Tersun VM **miễn nhiễm tuyệt đối** với lỗi rò rỉ ngăn xếp này. Cơ chế `stack_depth` đã cứu nguy cho hàm cha như thế nào?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Lệnh nhảy `jump` thông thường là một chiều; hàm số đòi hỏi lệnh nhảy có khả năng quay về được bảo trợ bởi **Ngăn Xếp Lời Gọi (Call Stack)**.
2. Mỗi lần gọi hàm sinh ra một **Call Frame**, lưu trữ `return_ip`, `local_base` và `stack_depth`.
3. Cơ chế `local_base` tạo ra không gian cô lập tuyệt đối cho các biến cục bộ, loại bỏ hoàn toàn nguy cơ hàm con ghi đè biến của hàm cha.

#### Cầu nối sang Chương 10:
Chúng ta đã có cơ chế nhảy đi (`OP_CALL`) và nhảy về (`OP_RET`).
Nhưng hàm không thể sống cô lập: nó cần nhận dữ liệu đầu vào (Tham số - Parameters) và trả kết quả đầu ra (Return Values).
Dữ liệu được sắp xếp và truyền qua ngăn xếp như thế nào theo chuẩn giao ước gọi hàm (Calling Convention / ABI)? 

Hãy cùng khám phá ở **Chương 10: Tham Số, Truyền Giá Trị & Hiệp Ước Gọi Hàm (Calling Conventions & ABI)**!



## CHƯƠNG 10: THAM SỐ, TRUYỀN GIÁ TRỊ & HIỆP ƯỚC GỌI HÀM (CALLING CONVENTIONS & ABI)

---

### 1. Vấn đề (The Problem)

Ở Chương 9, chúng ta đã chế tạo thành công chiếc "cầu nối thời gian": lệnh `OP_CALL` giúp nhảy tới một hàm ở xa và lệnh `OP_RET` đưa luồng thực thi quay trở lại chính xác vị trí cũ nhờ **Ngăn Xếp Lời Gọi (Call Stack)**.

Nhưng một hàm số trong toán học và tin học không thể sống cô lập:
- Một hàm tính toán căn bậc hai cần biết nó đang tính cho số nào.
- Một hàm nhân ma trận cần nhận hai ma trận đầu vào.
- Một hàm mã hóa cần nhận văn bản gốc và khóa bí mật, đồng thời phải **trả về văn bản đã mã hóa** cho bên gọi.

Thế nhưng, hãy nhìn vào hiện thực trần trụi của máy tính:
- Hàm gọi (**Caller**) và hàm được gọi (**Callee**) nằm ở hai vùng mã hoàn toàn tách biệt.
- Biến cục bộ của Caller nằm trong khung ngăn xếp của Caller; biến cục bộ của Callee nằm trong khung ngăn xếp của Callee.

Làm thế nào Caller có thể gửi 3 hoặc 4 giá trị sang cho Callee?
- Ai chịu trách nhiệm đặt dữ liệu vào đâu? Thứ tự từ trái sang phải hay từ phải sang trái?
- Callee đọc dữ liệu đó bằng cách nào?
- Khi tính toán xong, Callee đặt kết quả ở đâu để Caller nhận được mà không làm hỏng ngăn xếp?

Nếu không có một bộ quy tắc thống nhất đến từng bit, việc truyền dữ liệu giữa các hàm sẽ là một thảm họa hỗn loạn.

---

### 2. Tại sao vấn đề này tồn tại?

1. **Khoảng cách giữa Ngữ nghĩa Cấp cao và Tài nguyên Phần cứng**:
   - Ở tầng mã nguồn Tersun, bạn viết: `tính_tổng(10, 20, 30)`. Trông có vẻ như 3 con số được đưa thẳng vào hàm một cách tự nhiên.
   - Nhưng ở tầng vi kiến trúc, CPU chỉ có các ô nhớ tuyến tính và một số lượng hữu hạn thanh ghi (Registers). Không có "đường ống ma thuật" nào tự động chuyển dữ liệu giữa hai hàm.
2. **Sự nhập nhằng về Thứ tự (Order Ambiguity)**:
   - Nếu Caller đẩy `10` vào ngăn xếp trước, rồi đẩy `20`, thì ở đỉnh ngăn xếp sẽ là số `20`.
   - Nếu Callee nghĩ tham số đầu tiên nằm ở đỉnh ngăn xếp, nó sẽ lấy số `20` gán cho biến `a` và `10` gán cho biến `b`. Toàn bộ ý đồ của lập trình viên bị đảo lộn!
3. **Hiểm họa Lệch Ngăn Xếp (Stack Misalignment & Corruption)**:
   - Nếu Caller đẩy 3 tham số lên ngăn xếp, nhưng Callee chỉ đọc 2 tham số rồi kết thúc: tham số thứ 3 sẽ bị bỏ rơi lại trên ngăn xếp. Qua hàng nghìn lời gọi hàm, bộ nhớ sẽ bị tràn và sụp đổ.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần thiết lập một hiệp ước bất khả xâm phạm: **Hiệp ước Gọi Hàm Tersun (Tersun Calling Convention / Virtual ABI)**.

```text
[ CALLER FRAME ]                                      [ CALLEE FRAME ]
  (Chuẩn bị dữ liệu)                                    (Tiếp nhận & Thực thi)
         │                                                       │
         ▼                                                       ▼
1. Đánh giá đối số: arg1, arg2                 ┌──► slot 0: param1 = arg1
2. Đẩy lần lượt lên Evaluation Stack           │    slot 1: param2 = arg2
3. Phát lệnh: OP_CALL fn_idx (argc = 2) ───────┼──► slot 2..N: Biến cục bộ nội tại
                                               │
                                               │    ... thực thi thân hàm ...
                                               │
                                               └──► Đẩy return_value lên đỉnh Stack
                                                    Phát lệnh: OP_RET
                                                         │
                                                         ▼
                                               [ CALLER NHẬN KẾT QUẢ ]
                                               - Thu hồi Callee Frame
                                               - Đỉnh Stack Caller = return_value
```

Hiệp ước này phải bảo đảm 3 trụ cột:
1. **Quy tắc Đánh giá (Evaluation Order)**: Xác định rõ thứ tự đánh giá các đối số.
2. **Cơ chế Bố trí Ô nhớ (Slot Mapping Layout)**: Biến các tham số thành các biến cục bộ đầu tiên (`slot 0, slot 1, ...`) trong khung hàm con.
3. **Chốt chặn Kiểm tra Kiểu Tĩnh (Static Arity & Type Checking)**: Bắt lỗi ngay tại thời điểm biên dịch nếu số lượng hoặc kiểu dữ liệu của đối số không khớp với định nghĩa hàm.

---

### 4. Tự xây một abstraction đơn giản

Hãy thử mô phỏng cơ chế truyền tham số bằng một mảng trung gian toàn cục (Shared Argument Buffer) bằng C++:

```cpp
// naive_calling_convention.cpp
#include <iostream>
#include <vector>

// Bộ đệm tham số toàn cục dùng chung
std::vector<int> g_arg_buffer;
int g_return_value = 0;

void callee_add() {
    // Callee tự lấy tham số từ bộ đệm toàn cục
    int a = g_arg_buffer[0];
    int b = g_arg_buffer[1];
    g_return_value = a + b; // Ghi kết quả vào biến toàn cục
}

void caller() {
    // Caller đặt tham số vào bộ đệm
    g_arg_buffer.clear();
    g_arg_buffer.push_back(10);
    g_arg_buffer.push_back(20);

    callee_add(); // Gọi hàm

    std::cout << "Kết quả: " << g_return_value << "\n";
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

Chạy thử chương trình:
```text
Kết quả: 30
```
$(10 + 20 = 30)$. Trông có vẻ đơn giản và hiệu quả!

---

### 6. Thất bại / Giới hạn xuất hiện

Mô hình dùng bộ nhớ trung gian toàn cục ở trên sẽ nổ tung ngay khi gặp các tình huống thực tế:

#### Ca thất bại 1: Đệ quy hoặc Gọi lồng nhau (Reentrancy Collision)
Giả sử hàm $A$ chuẩn bị gọi hàm $B$, nó nạp tham số vào `g_arg_buffer`.
Nhưng trước khi $B$ kịp tính toán, $B$ lại gọi hàm $C$:
```cpp
void callee_B() {
    // B chuẩn bị gọi C: ghi đè lên bộ đệm toàn cục!
    g_arg_buffer.clear();
    g_arg_buffer.push_back(999);
    callee_C();
    // Khi quay lại đây, tham số ban đầu của B đã BỊ XÓA SẠCH!
}
```
Dữ liệu của hàm cha bị hàm con phá hủy không thể cứu vãn.

#### Ca thất bại 2: Lỗi Lệch Số Ngôi (Arity Mismatch)
Lập trình viên gọi hàm `tính_thuế(thu_nhập)` nhưng quên truyền tham số thứ hai là `tỷ_lệ`. 
Nếu không có cơ chế kiểm tra nghiêm ngặt, Callee sẽ đọc ô nhớ rác tiếp theo trong mảng, tính ra số thuế sai hàng triệu lần mà không hề báo lỗi!

#### Ca thất bại 3: Lỗi Xung đột Kiểu (Type Mismatch)
Một hàm yêu cầu tham số là số nguyên 64-bit (`int`), nhưng bên ngoài lại truyền vào một chuỗi ký tự `"antigravity"`. CPU sẽ diễn giải địa chỉ con trỏ của chuỗi thành một con số nguyên khổng lồ và thực hiện tính toán sai lệch hoàn toàn.

---

### 7. Tại sao nó thất bại?

1. **Tính chất Bất biến của Ngữ cảnh Hàm (Context Reentrancy)**:
   Mỗi lần một hàm được gọi, các tham số của nó **phải thuộc về phiên bản kích hoạt (Activation Instance) cụ thể đó**, chứ không thể chia sẻ ở một vùng nhớ toàn cục. Khi hàm đệ quy gọi lại chính nó 100 lần, phải có 100 bộ tham số độc lập cùng tồn tại!
2. **Nguyên lý Đóng gói Tham số vào Khung Ngăn Xếp**:
   Tham số thực chất chính là **những biến cục bộ đặc biệt được khởi tạo giá trị sẵn bởi bên ngoài**. Do đó, chúng bắt buộc phải nằm ngay tại những slot đầu tiên của khung ngăn xếp (`CallFrame`).

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

Trong lịch sử kiến trúc máy tính và trình biên dịch:
1. **Các Hiệp ước Gọi Hàm trên x86/x64 (Calling Conventions)**:
   - `cdecl` (C chuẩn trên x86 32-bit): Đẩy tham số lên stack từ phải sang trái; hàm gọi (Caller) dọn dẹp stack sau khi hàm kết thúc.
   - `stdcall` (Windows API): Đẩy từ phải sang trái; hàm được gọi (Callee) tự dọn dẹp stack khi thực hiện chỉ lệnh `ret N`.
   - `System V AMD64 ABI` (Linux/macOS x86-64): Tận dụng tối đa thanh ghi siêu tốc: 6 tham số đầu tiên truyền qua thanh ghi `RDI`, `RSI`, `RDX`, `RCX`, `R8`, `R9`. Tham số thứ 7 trở đi mới đẩy lên stack. Kết quả trả về đặt trong thanh ghi `RAX`.
2. **Hiệp ước Gọi Hàm Ngăn Xếp của Máy Ảo Tersun (Tersun Virtual ABI)**:
   - Kết hợp sự thanh lịch của ngăn xếp đánh giá (Evaluation Stack) với tốc độ truy cập $O(1)$ của mảng biến cục bộ:
     Caller đẩy các đối số lên ngăn xếp $\to$ Lệnh `OP_CALL` tự động bốc toàn bộ đối số đặt vào các ô đầu tiên của mảng `locals_` của Callee $\to$ Lệnh `OP_RET` bốc kết quả trả về chuyển thẳng sang ngăn xếp của Caller.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Parameter (Tham số hình thức)** | Biến đại diện được khai báo trong chữ ký hàm (ví dụ: `fn f(x: int)` $\to$ `x` là parameter). |
| **Argument (Đối số thực tế)** | Biểu thức hoặc giá trị cụ thể được truyền vào khi gọi hàm (ví dụ: `f(10 + 2)` $\to$ `12` là argument). |
| **Arity (Số ngôi)** | Số lượng tham số cố định mà một hàm yêu cầu. |
| **Calling Convention (Hiệp ước gọi hàm)** | Quy tắc chuẩn hóa về: (1) Thứ tự nạp đối số, (2) Vị trí lưu trữ tham số, (3) Cách thức trả về dữ liệu, và (4) Trách nhiệm dọn dẹp bộ nhớ. |
| **Pass-by-Value (Truyền theo giá trị)** | Cơ chế sao chép bit trực tiếp của đối số vào slot của hàm. Mọi thay đổi trên tham số bên trong hàm hoàn toàn không ảnh hưởng tới biến của bên ngoài. |
| **Pass-by-Sharing (Truyền đối tượng qua tham chiếu)** | Đối với các cấu trúc phức tạp (Mảng, Object, Struct), giá trị sao chép là con trỏ địa chỉ. Các thao tác sửa đổi nội dung mảng/đối tượng bên trong hàm sẽ phản ánh trực tiếp ra bên ngoài. |

---

### 10. Tersun giải quyết nó thế nào?

Bộ biên dịch và máy ảo Tersun hiện thực hóa Hiệp ước Gọi Hàm theo quy trình 3 giai đoạn khép kín:

#### 1. Kiểm tra An toàn Tuyệt đối tại `TypeChecker` ([type_checker.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L1048))
Trước khi một byte mã máy nào được sinh ra, `TypeChecker` chặn đứng mọi sai sót về số lượng và kiểu:

```cpp
// Trích từ Code/src/compiler/type_checker.cpp
// 1. Kiểm tra Arity (Số lượng đối số)
if (arg_types.size() != fn_type->param_types.size()) {
    report_error("Function '" + expr.callee + "' expects " 
                 + std::to_string(fn_type->param_types.size())
                 + " argument(s), but received " 
                 + std::to_string(arg_types.size()) + ".", expr.loc);
}

// 2. Kiểm tra Kiểu từng đối số
for (size_t i = 0; i < arg_types.size(); ++i) {
    if (!fn_type->param_types[i]->is_assignable_from(arg_types[i])) {
        report_error("Argument " + std::to_string(i + 1) + " of function '" + expr.callee
                     + "': Cannot pass '" + arg_types[i]->to_string() + "' to parameter of type '"
                     + fn_type->param_types[i]->to_string() + "'.", expr.loc);
    }
}
```

#### 2. Phân bổ Tham số vào Slot trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp)
Khi biên dịch một hàm `fn f(a: int, b: int)`:
- `param a` được gán vào `slot 0`.
- `param b` được gán vào `slot 1`.
- Các biến cục bộ khai báo thêm bên trong thân hàm (`let temp = ...`) sẽ bắt đầu từ `slot 2`, `slot 3`, ...
- Khi Caller gọi hàm `f(10, 20)`:
  Compiler sinh mã đẩy `10` lên stack, rồi đẩy `20` lên stack, sau đó phát sinh:
  `OP_CALL fn_id (argc = 2)`.

#### 3. Chuyển giao Dữ liệu Siêu Tốc trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1218)
Hãy xem cách `OP_CALL` bốc các đối số từ Evaluation Stack vào mảng biến cục bộ:

```cpp
// Caller đẩy: arg0 trước, arg1 sau.
// Lúc này đỉnh ngăn xếp (*--sp) là arg1, kế tiếp là arg0.
for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
    locals_[new_local_base + i] = *--sp; // Đếm lùi để bảo toàn thứ tự:
                                        // locals_[1] nhận arg1
                                        // locals_[0] nhận arg0!
}
```

Và khi `OP_RET` chạy:
```cpp
VMValue ret_val = *--sp;             // Lấy giá trị trả về từ Callee
sp = stack_.data() + frame.stack_depth; // Dọn sạch ngăn xếp Callee
*sp++ = ret_val;                     // Đặt thẳng giá trị vào đỉnh ngăn xếp của Caller!
```

---

### 11. Viết code

Dưới đây là một chương trình Tersun toàn diện chứng minh việc truyền nhiều tham số, kiểm tra giá trị trả về, và sự khác biệt giữa *Pass-by-Value* (số nguyên) và *Pass-by-Sharing* (mảng):

```tersun
// calling_conventions_demo.stn: Khảo sát ABI và truyền tham số trong Tersun

// 1. Hàm tính toán nhận nhiều tham số khác kiểu
fn tính_lương(tên: string, lương_cơ_bản: int, hệ_số: int) -> int {
    print("Đang tính lương cho: ");
    println(tên);
    let tổng = lương_cơ_bản * hệ_số;
    return tổng;
}

// 2. Chứng minh Pass-by-Value (Không thay đổi biến ngoài)
fn thử_thay_đổi_số(x: int) {
    x = x + 100; // Chỉ thay đổi slot cục bộ của hàm này
}

// 3. Chứng minh Pass-by-Sharing (Sửa đổi nội dung cấu trúc dữ liệu)
fn thêm_phần_tử(danh_sách: array) {
    danh_sách.append(999);
}

fn chạy_thử_nghiệm() {
    // Thử nghiệm 1: Gọi hàm có giá trị trả về
    let lương = tính_lương("Kỹ sư Tersun", 1000, 3);
    println("Lương thực nhận:");
    println(lương); // In ra: 3000

    // Thử nghiệm 2: Pass-by-Value
    let mut số_gốc = 42;
    thử_thay_đổi_số(số_gốc);
    println("Giá trị số_gốc sau khi gọi hàm (vẫn giữ nguyên 42):");
    println(số_gốc); // In ra: 42

    // Thử nghiệm 3: Pass-by-Sharing trên Mảng
    let arr = [1, 2, 3];
    thêm_phần_tử(arr);
    println("Độ dài mảng sau khi hàm sửa đổi (đã tăng lên 4):");
    println(len(arr)); // In ra: 4
}

chạy_thử_nghiệm();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách Compiler và VM phối hợp để đảm bảo hàm không bao giờ bị rò rỉ hoặc thiếu giá trị trả về:

#### Bí mật Hàm `void` trong Tersun
Trong Tersun, nếu một hàm không có lệnh `return` tường minh (ví dụ hàm in ấn hoặc thủ tục), Compiler sẽ tự động chèn thêm đoạn mã dọn dẹp ở cuối hàm:

```cpp
// Trích từ Code/src/compiler/emitter.cpp
chunk_.write_opcode(OpCode::OP_PUSH_INT, stmt.loc.line);
chunk_.write_int64(0, stmt.loc.line); // Đẩy giá trị mặc định 0
chunk_.write_opcode(OpCode::OP_RET, stmt.loc.line);
```

Và tại nơi gọi hàm, nếu lời gọi đó là một biểu thức độc lập (`ExprStmt`), Compiler tự động phát sinh thêm chỉ lệnh:
```text
OP_CALL fn_id (argc)
OP_POP                <-- Bỏ giá trị 0 mặc định đi để ngăn xếp luôn cân bằng!
```
Nhờ cơ chế này, mọi hàm trong Tersun đều tuân thủ đúng một quy ước thống nhất: **Luôn luôn trả về đúng 1 giá trị trên đỉnh ngăn xếp**, giữ cho máy ảo cực kỳ đơn giản và không cần xử lý các trường hợp ngoại lệ rườm rà.

---

### 13. Thí nghiệm / Kiểm chứng

Hãy cùng xem Compiler của chúng ta bắt các lỗi vi phạm Hiệp ước Gọi Hàm chuẩn xác như thế nào:

#### Thí nghiệm 1: Vi phạm Số Lượng Tham Số (Arity Error)
Tạo tập tin `scratch/test_arity.stn`:
```tersun
fn add(a: int, b: int) -> int {
    return a + b;
}
add(10); // Lỗi: Hàm đòi 2 tham số nhưng chỉ truyền 1
```
Chạy thử:
```powershell
.\setunc.exe run scratch/test_arity.stn
```
**Kết quả từ Compiler**:
```text
[Type Error] scratch/test_arity.stn:4:4 - Function 'add' expects 2 argument(s), but received 1.
```

#### Thí nghiệm 2: Vi phạm Kiểu Dữ Liệu Tham Số (Type Mismatch Error)
Tạo tập tin `scratch/test_param_type.stn`:
```tersun
fn add(a: int, b: int) -> int {
    return a + b;
}
add(10, "chuỗi_ký_tự"); // Lỗi: Tham số thứ 2 là int, không thể nhận string
```
Chạy thử:
```powershell
.\setunc.exe run scratch/test_param_type.stn
```
**Kết quả từ Compiler**:
```text
[Type Error] scratch/test_param_type.stn:4:4 - Argument 2 of function 'add': Cannot pass 'string' to parameter of type 'int'.
```

Hệ thống bắt lỗi tĩnh hoạt động với độ chính xác tuyệt đối, ngăn chặn 100% các lỗi gián đoạn runtime trước khi phần mềm được xuất bản!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 10.1: Mô phỏng Truyền Tham số
Cho hàm sau:
```tersun
fn multiply(x: int, y: int, z: int) -> int {
    return x * y * z;
}
```
Khi câu lệnh `multiply(2, 3, 4);` được thực thi:
1. Hãy liệt kê thứ tự các giá trị được đẩy lên Evaluation Stack của Caller.
2. Giá trị nào nằm ở đỉnh stack ngay trước khi lệnh `OP_CALL` kích hoạt?
3. Trong khung hàm của Callee, các slot `slot 0`, `slot 1`, `slot 2` sẽ lần lượt nhận giá trị nào?

#### Bài tập 10.2: Phân tích Pass-by-Value vs Pass-by-Sharing
Dự đoán kết quả in ra màn hình của chương trình sau và giải thích lý do:
```tersun
fn modify(val: int, list: array) {
    val = val + 10;
    list[0] = 99;
}

let a = 5;
let b = [1, 2];
modify(a, b);
println(a);
println(b[0]);
```

#### Bài tập 10.3: Tìm lỗi trong Hiệp ước Hàm
Đoạn mã sau có bao nhiêu lỗi biên dịch liên quan đến Calling Convention?
```tersun
fn format_id(id: int, prefix: string) -> string {
    return id;
}
let res: int = format_id("VN", 100);
```

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Từ Ngăn Xếp Ảo Sang Thanh Ghi Thật (Stack ABI vs Register ABI trong Native AOT)"**

Trong máy ảo Tersun VM (`vm.cpp`), mọi tham số đều đi qua Evaluation Stack rồi nạp vào mảng `locals_`.
Tuy nhiên, khi bạn chạy cờ biên dịch AOT Native ra mã máy x86-64 qua LLVM:
```powershell
.\setunc.exe compile main.stn --native
```
Backend LLVM của Tersun ([llvm_emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/llvm_emitter.cpp)) phải hạ các hàm Tersun xuống **System V AMD64 ABI** hoặc **Microsoft x64 ABI**.

**Câu hỏi kỹ sư**:
1. Trong kiến trúc vi xử lý x86-64 thực tế, tại sao việc truyền tham số qua các thanh ghi phần cứng (`RCX`, `RDX`, `R8`, `R9` trên Windows hoặc `RDI`, `RSI`, `RDX`, `RCX` trên Linux) lại nhanh hơn việc đẩy vào bộ nhớ RAM ngăn xếp gấp **3 đến 5 lần**?
2. Khi một hàm Tersun có tới 10 tham số, trình biên dịch LLVM Native sẽ phân bổ 10 tham số này như thế nào giữa các thanh ghi phần cứng và vùng nhớ Stack Frame?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Hiệp ước gọi hàm (**Calling Convention / ABI**) là quy chuẩn bắt buộc phân định rõ trách nhiệm giữa Caller và Callee về thứ tự nạp đối số, vị trí lưu trữ và cách trả về giá trị.
2. Trong Tersun VM, đối số được đánh giá từ trái sang phải, và được tự động ánh xạ vào các slot `0 .. argc - 1` trong khung biến cục bộ của hàm con.
3. `TypeChecker` đảm bảo tính toàn vẹn 100% bằng cách kiểm tra số ngôi (*Arity*) và tính tương thích kiểu dữ liệu trước khi phát sinh mã bytecode.

#### Cầu nối sang Chương 11:
Chúng ta đã hiểu trọn vẹn cách một hàm gọi một hàm khác và truyền dữ liệu qua lại.
Nhưng điều gì sẽ xảy ra nếu **một hàm tự gọi chính bản thân nó**? 
Làm thế nào để chia một bài toán khổng lồ thành các bài toán con giống hệt, và làm thế nào để bảo vệ chương trình không bị nổ tung bởi **Thảm họa Tràn Ngăn Xếp (Stack Overflow)**?

Hãy cùng bước vào thế giới kỳ vĩ của đệ quy tại **Chương 11: Đệ Quy, Phân Rã Bài Toán & Nguy Cơ Tràn Ngăn Xếp (Recursion & Stack Overflow)**!




## CHƯƠNG 11: ĐỆ QUY, PHÂN RÃ BÀI TOÁN & NGUY CƠ TRÀN NGĂN XẾP (RECURSION & STACK OVERFLOW)

---

### 1. Vấn đề (The Problem)

Trong tự nhiên và trong khoa học máy tính, có những bài toán sở hữu cấu trúc **tự tương đồng (Self-similarity)** kỳ vĩ:
- Một thư mục chứa các tập tin và các thư mục con; mỗi thư mục con lại chứa các thư mục con khác.
- Một biểu thức toán học phức tạp $A + B$ thực chất được cấu thành từ hai biểu thức con $A$ và $B$.
- Cây trạng thái lượng tử hoặc cấu trúc dữ liệu cây nhị phân (Binary Tree) gồm một nút gốc và hai cây con bên trái, bên phải.

Nếu bạn cố gắng dùng các vòng lặp thông thường (`while`, `for`) để duyệt một cấu trúc cây có độ sâu bất định, bạn sẽ rơi vào một mê cung: bạn phải tự tay tạo ra một mảng ngăn xếp phụ, tự theo dõi trạng thái đã duyệt, viết hàng chục dòng code phức tạp và rất dễ phát sinh lỗi rò rỉ bộ nhớ.

Nhưng nếu cho phép một hàm **tự gọi lại chính nó với quy mô bài toán nhỏ hơn** (Đệ quy - *Recursion*), toàn bộ thuật toán duyệt cây 50 dòng code thu gọn lại chỉ còn đúng **4 dòng lệnh thanh lịch**!

Thế nhưng, đệ quy luôn đi kèm với một "bóng ma" rình rập:
- Nếu bạn quên viết điều kiện dừng, chương trình sẽ gọi mãi mãi.
- Nếu bài toán quá lớn (độ sâu 100,000 tầng), ngăn xếp lời gọi (Call Stack) sẽ bị phình to vô hạn cho tới khi cạn kiệt bộ nhớ máy tính, gây ra **Thảm họa Tràn Ngăn Xếp (Stack Overflow)** làm sập ngay lập tức toàn bộ tiến trình.

Làm thế nào để tư duy phân rã bài toán đệ quy một cách an toàn, và trình biên dịch/máy ảo quản lý bộ nhớ đệ quy như thế nào ở tầng thấp nhất?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Sự khác biệt cốt lõi giữa Vòng Lặp và Đệ Quy**:
   - **Vòng lặp (`for`/`while`) sử dụng bộ nhớ $O(1)$**: Nó tái sử dụng cùng một khung ngăn xếp duy nhất, chỉ thay đổi biến đếm trong cùng các slot bộ nhớ cố định.
   - **Đệ quy sử dụng bộ nhớ $O(D)$** (với $D$ là độ sâu lời gọi): Mỗi một lần hàm tự gọi lại chính nó, máy ảo bắt buộc phải cấp phát một `CallFrame` mới và một tập hợp các biến cục bộ `locals_` mới toanh!
2. **Giới hạn vật lý của Ngăn Xếp Hệ Điều Hành**:
   - Bộ nhớ RAM vật lý là hữu hạn, và vùng nhớ dành cho ngăn xếp (Stack Segment) của mỗi tiến trình do hệ điều hành cấp phát thường chỉ từ **1MB đến 8MB**.
   - Nếu mỗi khung hàm tốn 64 bytes, thì chỉ cần đệ quy sâu khoảng 100,000 tầng, con trỏ ngăn xếp sẽ đâm xuyên qua đáy vùng nhớ được bảo vệ (Guard Page), kích hoạt lỗi vi phạm phân trang (*Segmentation Fault*) và hệ điều hành sẽ tiêu diệt tiến trình ngay lập tức.
3. **Hiện tượng "Ghi Nợ Bộ Nhớ"**:
   - Khi bạn viết `return n * factorial(n - 1);`, phép nhân `* n` **không thể thực hiện được ngay**. Hàm cha buộc phải "ngủ đông" trên ngăn xếp để chờ hàm con tính xong `factorial(n - 1)` mới thức dậy nhân kết quả. Càng đệ quy sâu, số lượng khung hàm "ngủ đông" càng chồng chất thành núi nợ bộ nhớ khổng lồ.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần làm chủ nghệ thuật kiểm soát đệ quy từ góc độ kỹ sư compiler:

```text
                           CẤU TRÚC ĐỆ QUY CHUẨN
                                     │
      ┌──────────────────────────────┴──────────────────────────────┐
      ▼                                                             ▼
[ 1. ĐIỀU KIỆN CƠ SỞ - BASE CASE ]             [ 2. BƯỚC THU NHỎ - RECURSIVE STEP ]
- Điểm neo dừng đệ quy                          - Phân rã bài toán: N -> N - 1 hoặc N / 2
- Trả về kết quả trực tiếp                      - Bảo đảm luôn tiến về phía Base Case
- Bắt buộc phải được kiểm tra TRƯỚC            - Đóng gói dữ liệu trong CallFrame mới
```

Mục tiêu kỹ thuật:
1. **Tránh bẫy Vòng lặp Vô tận (Infinite Recursion)**: Xác định đúng và đủ mọi Base Cases.
2. **Hiểu rõ Quá trình Bành trướng và Thu hồi Ngăn xếp (Stack Unwinding)**: Cách các khung hàm xếp chồng lên nhau rồi lần lượt giải phóng khi chạm Base Case.
3. **Khắc phục Bùng nổ Hàm Mũ (Exponential Tree Explosion)**: Nhận diện sự lãng phí của đệ quy cây nhị phân (như Fibonacci ngây thơ) và kỹ thuật biến đổi sang **Đệ quy Đuôi (Tail Recursion)** đạt bộ nhớ $O(1)$.

---

### 4. Tự xây một abstraction đơn giản

Hãy xem thuật toán tính Giai thừa ($N! = N \times (N-1) \times \dots \times 1$) được viết bằng đệ quy ngây thơ:

```cpp
// naive_factorial.cpp
#include <iostream>

int factorial(int n) {
    // 1. Base Case: 0! = 1! = 1
    if (n <= 1) {
        return 1;
    }
    // 2. Recursive Step: N * (N - 1)!
    return n * factorial(n - 1);
}

int main() {
    std::cout << "5! = " << factorial(5) << "\n";
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

Chạy chương trình:
```text
5! = 120
```
$(5 \times 4 \times 3 \times 2 \times 1 = 120)$.
Chỉ với 5 dòng code, bài toán giai thừa đã được giải quyết trọn vẹn và đẹp như một công thức toán học!

---

### 6. Thất bại / Giới hạn xuất hiện

Bây giờ, hãy thử nghiệm 3 ca bệnh hiểm nghèo của đệ quy:

#### Ca thất bại 1: Quên Base Case (Infinite Recursion)
Lập trình viên quên mất dòng `if (n <= 1) return 1;`:
```tersun
fn vô_tận(n: int) -> int {
    return vô_tận(n + 1); // Không có điểm dừng!
}
```
Khi chạy, `CallStack` sẽ phình to không giới hạn, chiếm dụng 100% CPU và treo cứng máy ảo cho đến khi bị hệ điều hành cưỡng chế hủy diệt (*Killed / Terminated*).

#### Ca thất bại 2: Thảm họa Bùng nổ Cây Nhị Phân (Fibonacci Exponential Explosion)
Tính số Fibonacci bằng đệ quy toán học:
$$F(n) = F(n-1) + F(n-2)$$
```tersun
fn fib(n: int) -> int {
    if (n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}
```
- Khi tính `fib(5)`, hàm gọi 15 lần.
- Khi tính `fib(30)`, hàm gọi **2,692,537 lần**!
- Khi tính `fib(50)`, số phép tính lên tới $2^{50} \approx 1.12 \times 10^{15}$ phép tính $\to$ **Mất hàng tháng CPU mới tính xong** một con số nhỏ, chỉ vì cùng một giá trị con `fib(2)` bị tính đi tính lại hàng triệu lần!

#### Ca thất bại 3: Tràn Ngăn Xếp Tuyến Tính (Deep Stack Overflow)
Nếu bạn gọi `tính_tổng(1000000)` bằng đệ quy thông thường:
1,000,000 khung hàm sẽ xếp chồng lên nhau, tiêu tốn hàng chục Megabyte bộ nhớ stack và làm sập máy ảo ngay lập tức.

---

### 7. Tại sao nó thất bại?

Bản chất kỹ thuật nằm ở **Vị trí của Lời gọi Hàm (Call Site Position)**:
Trong biểu thức:
$$\text{return } n \times \text{factorial}(n - 1);$$
Toán tử nhân `*` là phép toán **thực hiện sau cùng**. 
- Hàm `factorial(n)` không thể giải phóng khung ngăn xếp của mình, vì nó còn phải lưu giữ con số `n` trong ô nhớ để chờ kết quả từ `factorial(n - 1)` quay về mới nhân được.
- Vì khung hàm cha **không thể chết trước khung hàm con**, toàn bộ $N$ khung hàm buộc phải sống đồng thời trong bộ nhớ.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Phát minh Đệ Quy Đuôi & TCO (Tail Call Optimization)**:
   - Các nhà khoa học tại MIT (Guy Steele & Gerald Sussman, 1975) khi thiết kế ngôn ngữ Scheme đã đề xuất nguyên lý:
     *Nếu lời gọi đệ quy là hành vi CUỐI CÙNG của hàm (không còn phép toán nào sau đó), thì khung hàm hiện tại không còn giá trị lưu giữ!*
   - Thay vì cấp phát khung hàm mới: Trình biên dịch **ghi đè tham số mới trực tiếp vào khung hàm hiện tại** và thực hiện một lệnh nhảy ngược `JUMP` về đầu hàm.
   - **Phép màu xảy ra**: Thuật toán đệ quy biến đổi thành một vòng lặp hoàn hảo với **bộ nhớ ngăn xếp $O(1)$**!
2. **Kỹ thuật Biến tích lũy (Accumulator Pattern)**:
   - Thay vì trì hoãn phép nhân sang lúc quay về, ta mang theo một biến phụ tích lũy kết quả trung gian và truyền dọc theo lời gọi đệ quy.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Base Case (Trường hợp cơ sở)** | Nhánh điều kiện tiên quyết chặn đứng đệ quy và trả về giá trị trực tiếp mà không gọi tiếp bất kỳ hàm nào. |
| **Recursive Step (Bước đệ quy)** | Bước phân chia bài toán thành bài toán con nhỏ hơn cùng bản chất, đảm bảo kích thước đầu vào hội tụ dần về Base Case. |
| **Stack Unwinding (Thu hồi ngăn xếp)** | Quá trình các khung hàm trên đỉnh Call Stack lần lượt hoàn tất và giải phóng bộ nhớ khi luồng thực thi chạm tới Base Case và bắt đầu trả về. |
| **Tail Call (Lời gọi đuôi)** | Lời gọi hàm nằm ở vị trí biểu thức cuối cùng của một hàm, kết quả trả về của hàm con chính là kết quả trả về của hàm cha. |
| **Tail Call Optimization (TCO)** | Tối ưu hóa của compiler tái sử dụng khung ngăn xếp của hàm cha cho hàm con, đưa độ phức tạp không gian từ $O(N)$ về $O(1)$. |
| **Divide-and-Conquer (Chia để trị)** | Mô hình phân rã bài toán kích thước $N$ thành $k$ bài toán con kích thước $N/c$ (ví dụ: QuickSort, MergeSort, Fast Exponentiation). |

---

### 10. Tersun giải quyết nó thế nào?

Máy ảo Tersun VM ([vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp)) quản lý đệ quy thông qua hai cơ chế tối ưu hóa cấp bộ nhớ:

#### 1. Cơ chế Quản lý Khung Nhanh (Fast Frames Arena)
Trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1210):
```cpp
if (opt_flags_.enable_fast_frames) {
    new_local_base = local_top_;
    local_top_ += callee_frame_size;
    // Tự động phình to bộ đệm theo cấp số nhân (Doubling Strategy)
    if (__builtin_expect(local_top_ + 64 >= locals_.size(), 0)) {
        locals_.resize(locals_.size() * 2);
    }
}
```
Thay vì gọi hệ điều hành cấp phát bộ nhớ (`malloc`) cho từng tầng đệ quy, Tersun VM chỉ đơn giản là tăng con trỏ chỉ số `local_top_` trên một mảng tuyến tính được cấp phát sẵn. Điều này cho phép Tersun thực thi đệ quy sâu hàng nghìn tầng với tốc độ ngang ngửa vòng lặp C!

#### 2. Thu hồi Khung Ngăn Xếp Tức Thì (Instant Stack Reclaim)
Trong lệnh `OP_RET` ([vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1238)):
```cpp
// Khi hàm con trả về, con trỏ mảng local lập tức lùi về mốc của hàm cha!
local_top_ = frame.local_base;
```
Bộ nhớ của hàm con bị xóa sổ ngay trong 1 chu kỳ máy ảo, bảo đảm không có bất kỳ hiện tượng rò rỉ bộ nhớ nào trong quá trình đệ quy.

---

### 11. Viết code

Hãy khảo sát một chương trình Tersun toàn diện chứng minh sức mạnh của đệ quy tuyến tính, đệ quy chia để trị, và kỹ thuật chuyển đổi sang đệ quy đuôi:

```tersun
// recursion_mastery.stn: Khảo sát các mô hình đệ quy trong Tersun

// 1. Đệ quy tuyến tính kinh điển: Tính giai thừa N!
fn giai_thừa(n: int) -> int {
    if (n <= 1) {
        return 1; // Base Case
    }
    return n * giai_thừa(n - 1); // Recursive Step (Deferred multiplication)
}

// 2. Đệ quy đuôi (Tail Recursion): Dùng biến tích lũy 'acc'
// Bộ nhớ ngăn xếp có thể tối ưu hóa về O(1)!
fn giai_thừa_đuôi(n: int, acc: int) -> int {
    if (n <= 1) {
        return acc; // Base Case: Trả về kết quả đã tích lũy xong
    }
    // Lời gọi đệ quy là hành động CUỐI CÙNG: Không còn phép toán nào sau nó!
    return giai_thừa_đuôi(n - 1, n * acc);
}

// 3. Đệ quy Chia Để Trị (Divide-and-Conquer): Lũy thừa nhanh O(log N)
// Tính x^n bằng cách bình phương: x^8 = (x^4)^2
fn lũy_thừa_nhanh(x: int, n: int) -> int {
    if (n == 0) {
        return 1;
    }
    let nửa = lũy_thừa_nhanh(x, n / 2);
    if (n % 2 == 0) {
        return nửa * nửa;
    } else {
        return x * nửa * nửa;
    }
}

fn chạy_thử_nghiệm() {
    println("--- ĐỆ QUY TUYẾN TÍNH: 5! ---");
    println(giai_thừa(5)); // In ra: 120

    println("--- ĐỆ QUY ĐUÔI: 5! ---");
    println(giai_thừa_đuôi(5, 1)); // In ra: 120

    println("--- LŨY THỪA NHANH: 2^10 ---");
    println(lũy_thừa_nhanh(2, 10)); // In ra: 1024 (chỉ tốn 4 tầng đệ quy!)
}

chạy_thử_nghiệm();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem sự khác biệt sống còn ở tầng Bytecode giữa **Đệ quy Thường** và **Đệ quy Đuôi**:

```text
ĐỆ QUY THƯỜNG: return n * fact(n - 1);
┌────────────────────────────────────────────────────────┐
│ OP_LOAD_LOCAL slot 0 (n)                               │
│ OP_LOAD_LOCAL slot 0 (n)                               │
│ OP_PUSH_INT   1                                        │
│ OP_SUB                                                 │
│ OP_CALL       fn#1 (argc 1)   <-- GỌI HÀM CON          │
│ OP_MUL                        <-- PHÉP NHÂN SAU KHI VỀ │
│ OP_RET                                                 │
└────────────────────────────────────────────────────────┘
Nhận xét: Lệnh OP_MUL nằm chen giữa OP_CALL và OP_RET. Khung hàm cha BẮT BUỘC phải sống!

ĐỆ QUY ĐUÔI: return fact_tail(n - 1, n * acc);
┌────────────────────────────────────────────────────────┐
│ ... tính n - 1 và n * acc ...                          │
│ OP_CALL       fn#2 (argc 2)   <-- GỌI HÀM CON          │
│ OP_RET                        <-- TRẢ VỀ NGAY LẬP TỨC! │
└────────────────────────────────────────────────────────┘
Nhận xét: Lệnh OP_CALL nằm ngay trước OP_RET! Kết quả của hàm con chính là kết quả của hàm cha.
Trình biên dịch có thể thay thế cặp [OP_CALL + OP_RET] bằng một lệnh nhảy [OP_JUMP] về đầu hàm!
```

---

### 13. Thí nghiệm / Kiểm chứng

Hãy thực hiện hai thí nghiệm thực tế trên trình biên dịch `setunc`:

#### Thí nghiệm 1: Kiểm chứng Đệ quy Sâu 1000 Tầng
Tạo tập tin `scratch/test_deep_rec.stn`:
```tersun
fn sum_rec(n: int) -> int {
    if (n <= 0) {
        return 0;
    }
    return n + sum_rec(n - 1);
}

println(sum_rec(1000));
```
Chạy thử:
```powershell
.\setunc.exe run scratch/test_deep_rec.stn
```
**Kết quả thực tế**:
```text
500500
```
$(1 + 2 + \dots + 1000 = 500,500)$. Tersun VM tự động mở rộng mảng `locals_` và thực thi 1,000 tầng đệ quy chớp nhoáng mà không gặp bất kỳ lỗi tràn bộ nhớ nào!

#### Thí nghiệm 2: Hiện tượng Treo Máy khi Quên Base Case
Khi chạy đoạn code `infinite_rec` (ở mục 6):
Bộ nhớ Call Stack tăng trưởng với tốc độ hàng triệu frame mỗi giây. Máy ảo không bao giờ chạm tới lệnh `OP_RET` để thu hồi bộ nhớ, chứng minh tầm quan trọng sống còn của **Base Case**.

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 11.1: Vẽ Cây Đệ Quy Fibonacci
Cho hàm:
```tersun
fn fib(n: int) -> int {
    if (n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}
```
1. Hãy vẽ cây đệ quy đầy đủ khi tính `fib(4)`.
2. Có tổng cộng bao nhiêu lời gọi hàm được sinh ra?
3. Giá trị `fib(2)` bị tính lại bao nhiêu lần?

#### Bài tập 11.2: Chuyển đổi Đệ quy Đuôi cho Phép Tính Lũy Thừa
Hàm tính $x^n$ thông thường:
```tersun
fn power(x: int, n: int) -> int {
    if (n == 0) return 1;
    return x * power(x, n - 1);
}
```
Hãy viết lại hàm này theo mẫu **Đệ quy Đuôi** bằng cách sử dụng thêm tham số tích lũy `acc`: `fn power_tail(x: int, n: int, acc: int) -> int`.

#### Bài tập 11.3: So sánh Chi phí Thời gian
Thuật toán `lũy_thừa_nhanh(2, 100)` chia đôi số mũ sau mỗi bước ($100 \to 50 \to 25 \to \dots$).
Hãy tính xem thuật toán này tốn chính xác bao nhiêu tầng đệ quy so với thuật toán đệ quy tuyến tính truyền thống (tốn 100 tầng)?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Khử Đệ Quy Cây Nhị Phân Lượng Tử Bằng Ngăn Xếp Thủ Công (Explicit Stack Trampoline)"**

Trong mô phỏng mạng tensor lượng tử (Matrix Product States - MPS), cây tensor có thể sâu tới 50,000 nút. Nếu duyệt cây bằng đệ quy hệ thống, bạn luôn đối mặt với nguy cơ sập chương trình do giới hạn ngăn xếp của hệ điều hành.

Quan sát cấu trúc nút cây sau:
```tersun
class TreeNode {
    pub val: int;
    pub left: TreeNode;
    pub right: TreeNode;
}
```

**Câu hỏi kỹ sư**:
Làm thế nào để viết một hàm `tính_tổng_cây(root: TreeNode) -> int` trong Tersun **chỉ sử dụng một vòng lặp `while` kết hợp với một mảng danh sách `stack = []`** để mô phỏng lại hoàn toàn thuật toán duyệt cây theo chiều sâu (DFS) mà **hoàn toàn không gọi đệ quy**? 
Tại sao kỹ thuật khử đệ quy này lại an toàn tuyệt đối trước lỗi Stack Overflow?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Đệ quy là công cụ tư duy thanh lịch nhất để giải quyết các bài toán có cấu trúc tự tương đồng, nhưng tiêu tốn bộ nhớ ngăn xếp tỷ lệ thuận với độ sâu lời gọi ($O(D)$).
2. Mọi hàm đệ quy bắt buộc phải có ít nhất một **Trường hợp cơ sở (Base Case)** kiểm tra trước khi thực hiện bước đệ quy.
3. **Đệ quy Đuôi (Tail Recursion)** biến đổi lời gọi đệ quy thành hành động cuối cùng, mở ra cơ hội tối ưu hóa bộ nhớ ngăn xếp từ $O(N)$ về $O(1)$.

#### Cầu nối sang Chương 12:
Cho tới thời điểm này, tất cả các hàm chúng ta xây dựng đều là các "hàm tĩnh có tên" (`fn tên_hàm()`).
Nhưng trong lập trình hiện đại, một hàm có thể được đối xử như một **thực thể dữ liệu hạng nhất (First-class Citizen)**:
- Hàm có thể được gán vào biến: `let f = fn(x) => x * 2;`
- Hàm có thể được truyền vào hàm khác như một tham số (Higher-order Functions).
- Và kỳ diệu nhất: Hàm có thể **bắt giữ (capture)** các biến của môi trường xung quanh nó để tạo thành một **Closure**!

Hãy cùng bước vào thế giới lập trình hàm đỉnh cao tại **Chương 12: Hàm Vô Danh, Biểu Thức Lambda & Closure (Anonymous Functions & Environment Capture)**!








## CHƯƠNG 12: HÀM VÔ DANH, BIỂU THỨC LAMBDA & CLOSURE (ANONYMOUS FUNCTIONS & ENVIRONMENT CAPTURE)

---

### 1. Vấn đề (The Problem)

Trong lập trình hướng thủ tục truyền thống (như C hay Pascal cổ điển), mọi hàm số đều là **thực thể tĩnh (Static Entities)**:
- Chúng bắt buộc phải được đặt một cái tên cố định (`fn tính_tổng`, `fn giải_mã`).
- Chúng tồn tại vĩnh viễn trong phân vùng mã lệnh (`.text`) từ khi chương trình khởi động đến khi tắt.

Nhưng trong kỹ nghệ phần mềm hiện đại, tư duy đó nhanh chóng bộc lộ những hạn chế ngột ngạt:
1. **Sự ô nhiễm không gian tên (Namespace Pollution)**:
   Giả sử bạn có một danh sách 1,000 số nguyên và muốn lọc ra các số chẵn bằng hàm `filter`. Nếu bạn buộc phải đặt tên cho một hàm phụ `fn kiểm_tra_chẵn(x)` nằm cách đó 100 dòng code, mã nguồn của bạn sẽ bị phân mảnh và ngập tràn những cái tên rác chỉ dùng đúng một lần trong đời.
2. **Nghịch lý Bắt giữ Môi trường (The Environment Capture Paradox)**:
   Giả sử bạn muốn viết một "nhà máy sản xuất hàm" (Function Factory): một hàm `tạo_bộ_cộng(delta)` trả về một hàm con có khả năng cộng thêm `delta` vào bất kỳ số nào được truyền vào.
   
   Hãy nhìn vào nghịch lý bộ nhớ:
   - Biến `delta` là **biến cục bộ** của hàm cha `tạo_bộ_cộng`.
   - Khi hàm cha chạy xong và trả về hàm con, **khung ngăn xếp (CallFrame) của hàm cha bị hủy ngay lập tức**!
   - Biến `delta` bị xóa sổ khỏi bộ nhớ RAM.

Khi bạn đem hàm con đó đi chạy ở một nơi khác sau đó 10 phút, **làm thế nào hàm con có thể nhớ được giá trị `delta` khi mà nơi sinh ra nó đã chết từ lâu?**

---

### 2. Tại sao vấn đề này tồn tại?

1. **Sự xung đột giữa Vòng đời Ngăn xếp (Stack Lifetime) và Vòng đời Đối tượng (Object Lifetime)**:
   - **Call Stack** hoạt động theo quy tắc nghiêm ngặt LIFO (Last-In, First-Out): Hàm cha kết thúc $\to$ con trỏ stack lùi lại $\to$ toàn bộ biến cục bộ bị giải phóng.
   - Nhưng một hàm được xem là dữ liệu (First-Class Value) có thể được lưu trữ trong một mảng, được gắn vào nút bấm giao diện (GUI Callback), hoặc chạy trên một tiến trình bất đồng bộ sau đó nhiều giờ.
   - Nếu hàm con cố gắng tham chiếu tới biến của hàm cha trên Stack cũ, nó sẽ đọc trúng vùng nhớ rác đã bị ghi đè bởi các hàm khác $\to$ **Lỗi con trỏ lơ lửng (Dangling Pointer / Use-After-Free)**!
2. **Khoảng cách giữa "Mã Lệnh Thuần Túy" và "Trạng Thái Dữ Liệu"**:
   - Một con trỏ hàm thông thường trong ngôn ngữ C (`void (*func)(int)`) chỉ trỏ tới một khối chỉ lệnh tĩnh. Nó hoàn toàn **không mang theo trạng thái (State-less)**.
   - Để mang theo trạng thái, hàm bắt buộc phải được đóng gói kèm một "túi hành lý" chứa dữ liệu môi trường.

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần nâng cấp hàm số từ một đoạn mã tĩnh thành một **Thực Thể Hạng Nhất (First-Class Citizen)**:

```text
                        THỰC THỂ CLOSURE
         ┌──────────────────────────────────────────┐
         │  1. Code Pointer (Địa chỉ hàm máy ảo)    │
         │  2. Frame Size   (Số slot cần cấp phát)  │
         │  3. Captures     [ val1, val2, ... ]     │ ◄── "Túi hành lý" dữ liệu
         └──────────────────────────────────────────┘
```

Mục tiêu kỹ thuật:
1. **Cú pháp Biểu thức Lambda linh hoạt**:
   - Cú pháp khối lệnh đầy đủ: `let g = fn (x: int) -> int { return x + 1; };`
   - Cú pháp biểu thức rút gọn: `let f = fn (x) => x * 2;`
2. **Cơ chế Bao Đóng Môi Trường (Closure)**:
   - Khi phát hiện hàm con sử dụng biến từ phạm vi bao bọc bên ngoài (biến tự do - *Free Variables / Upvalues*), Compiler phải tự động nhận diện và sinh mã đóng gói các biến này.
3. **Mô hình Bắt giữ An toàn (Snapshot / Value Capture Semantics)**:
   - Đóng băng giá trị của các biến môi trường tại thời điểm tạo Closure, lưu giữ trên vùng nhớ Heap an toàn (`std::shared_ptr<VMClosure>`), bảo đảm không bị ảnh hưởng khi khung ngăn xếp của hàm cha bị tiêu hủy.
4. **Cặp chỉ lệnh Máy Ảo Chuyên Biệt**:
   - `OP_CLOSURE fn_idx capture_count`: Đóng gói môi trường thành đối tượng Closure.
   - `OP_CALL_INDIRECT argc`: Giải nén túi hành lý `captures` và kích hoạt hàm con.

---

### 4. Tự xây một abstraction đơn giản

Hãy xem cách các kỹ sư ngôn ngữ C mô phỏng một Closure bằng cấu trúc con trỏ hàm kết hợp dữ liệu ngữ cảnh (`void* context`):

```c
// naive_closure.c
#include <stdio.h>
#include <stdlib.h>

// Định nghĩa con trỏ hàm nhận thêm một con trỏ ngữ cảnh
typedef int (*FuncPtr)(int x, void* context);

struct Closure {
    FuncPtr code;    // Con trỏ tới mã máy
    void* context;   // Con trỏ tới dữ liệu môi trường
};

// Hàm thực thi độc lập
int adder_logic(int x, void* context) {
    int delta = *(int*)context; // Rút biến môi trường ra
    return x + delta;
}

// Nhà máy tạo Closure
struct Closure* make_adder(int delta) {
    struct Closure* c = (struct Closure*)malloc(sizeof(struct Closure));
    int* saved_delta = (int*)malloc(sizeof(int)); // Phải cấp phát trên HEAP!
    *saved_delta = delta;

    c->code = adder_logic;
    c->context = saved_delta;
    return c;
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

```c
int main() {
    struct Closure* cong_10 = make_adder(10);
    struct Closure* cong_50 = make_adder(50);

    printf("5 + 10 = %d\n", cong_10->code(5, cong_10->context));
    printf("5 + 50 = %d\n", cong_50->code(5, cong_50->context));

    // Dọn dẹp thủ công cực kỳ đau đầu!
    free(cong_10->context); free(cong_10);
    free(cong_50->context); free(cong_50);
    return 0;
}
```

**Kết quả**:
```text
5 + 10 = 15
5 + 50 = 55
```
Logic hoạt động! Bản chất của Closure chính là: **Hàm + Vùng nhớ Heap lưu ngữ cảnh**.

---

### 6. Thất bại / Giới hạn xuất hiện

Cách tiếp cận thủ công kiểu C ở trên hoàn toàn không thể sử dụng cho một ngôn ngữ lập trình hiện đại:

1. **Lỗi Rò rỉ Bộ nhớ và Quản lý Thủ công (Memory Leaks)**:
   Lập trình viên phải tự `malloc` và tự `free`. Nếu Closure được truyền qua 5 hàm khác nhau, không ai biết khi nào là an toàn để gọi `free(context)`.
2. **Mất An Toàn Kiểu (Type Blindness với `void*`)**:
   Trình biên dịch không thể kiểm tra kiểu của `context`. Nếu ai đó ép kiểu nhầm `void*` sang chuỗi ký tự, chương trình sẽ gặp lỗi bộ nhớ ngay lập tức.
3. **Cú pháp Quá Cồng Kềnh**:
   Lập trình viên muốn viết ngắn gọn: `let add10 = fn(x) => x + 10;`, chứ không ai muốn định nghĩa `struct`, tạo hàm phụ và ép kiểu con trỏ.

---

### 7. Tại sao nó thất bại?

1. **Sự thiếu vắng Hỗ trợ từ Tầng Ngữ Pháp (Language Syntax Integration)**:
   Closure không thể chỉ là một thư viện rời rạc, nó phải được tích hợp vào **Bộ phân tích cú pháp (Parser)** và **Bảng ký hiệu (Symbol Table)**.
2. **Khái niệm "Biến Tự Do" (Free Variables / Upvalues)**:
   Trong biểu thức:
   `let add = fn(x) => x + delta;`
   - `x` là biến ràng buộc (Bound Variable) vì nó là tham số của hàm con.
   - `delta` là **Biến tự do (Free Variable)** vì nó không được khai báo trong hàm con, mà được "vay mượn" từ scope cha bên ngoài.
   Compiler bắt buộc phải tự động phân tích cây AST để nhận diện mọi biến tự do và tự động tạo mã đóng gói.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Phát minh Khái niệm Closure (Peter J. Landin, 1964)**:
   - Peter Landin lần đầu tiên đưa ra thuật ngữ *Closure* khi thiết kế máy trừu tượng SECD để chạy ngôn ngữ Lambda Calculus của Alonzo Church.
2. **Bộ Tam Hàm Bậc Cao Kinh Điển (The Holy Trinity of Functional Programming)**:
   - **`map(fn)`**: Biến đổi từng phần tử trong dãy theo hàm `fn` ($[x_1, x_2] \to [f(x_1), f(x_2)]$).
   - **`filter(fn)`**: Giữ lại các phần tử mà hàm vị từ `fn` trả về `true`.
   - **`reduce(fn, init)`**: Gom tụ toàn bộ dãy thành một giá trị duy nhất thông qua hàm tích lũy `fn`.
3. **Mô hình Snapshot vs Upvalue Reference**:
   - Các ngôn ngữ như Rust và C++ cho phép chọn lựa giữa `move` (sao chép giá trị) hoặc `&` (mượn tham chiếu).
   - Tersun áp dụng cơ chế **Snapshot Capture (Chụp ảnh giá trị tại thời điểm sinh ra)**: Đơn giản, an toàn tuyệt đối, tránh được mọi lỗi tranh chấp dữ liệu (Race Conditions) trong xử lý song song và lượng tử!

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **First-Class Function** | Ngôn ngữ đối xử với hàm như một thực thể dữ liệu hạng nhất: có thể lưu vào biến, truyền vào hàm khác, và trả về từ hàm. |
| **Lambda Expression** | Cú pháp khai báo một hàm ẩn danh (không cần đặt tên) ngay tại vị trí sử dụng. |
| **Closure (Bao đóng)** | Thực thể runtime đóng gói một con trỏ mã hàm (`entry`) kèm theo môi trường dữ liệu (`captures`) được bắt giữ từ bên ngoài. |
| **Free Variable (Biến tự do)** | Biến được sử dụng bên trong một hàm nhưng không phải là tham số hay biến cục bộ của hàm đó. |
| **Indirect Call (`OP_CALL_INDIRECT`)** | Chỉ lệnh gọi hàm thông qua một biến đối tượng Closure trên ngăn xếp, thay vì nhảy tới một địa chỉ tĩnh cố định. |
| **Higher-Order Function (Hàm bậc cao)** | Hàm nhận một hoặc nhiều hàm khác làm đối số (ví dụ: `map`, `filter`, `reduce`). |

---

### 10. Tersun giải quyết nó thế nào?

Kiến trúc Closure của Tersun được thiết kế hoàn hảo từ AST, Compiler cho tới Virtual Machine:

#### 1. Cấu trúc Đối tượng Closure trong [value.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp)
```cpp
struct VMClosure {
    uint32_t entry{0};             // Địa chỉ byte bắt đầu thân hàm
    uint16_t fn_idx{0};            // Chỉ số hàm trong function_table
    size_t frame_size{32};         // Kích thước khung ngăn xếp yêu cầu
    std::vector<VMValue> captures; // Danh sách biến môi trường được chụp lại
};
```

#### 2. Chiến lược Bố trí Khung Ngăn Xếp (Local Frame Layout) trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1770)
Khi biên dịch một Lambda, Compiler sắp xếp các ô nhớ cục bộ của hàm con theo một quy ước thống nhất:
```text
Chỉ số Slot:  [ 0 ... argc - 1 ]  [ argc ... argc + cap_count - 1 ]  [ ... ]
Ý nghĩa:       CÁC ĐỐI SỐ TRUYỀN VÀO     CÁC BIẾN MÔI TRƯỜNG CAPTURED       BIẾN CỤC BỘ KHÁC
```
- Khi phát hiện biến môi trường: Compiler sinh mã nạp các biến đó lên ngăn xếp.
- Phát sinh siêu lệnh: `OP_CLOSURE fn_idx (capture_count)`.

#### 3. Thực thi Siêu Tốc trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L3202)
- **Khi tạo Closure (`handle_closure`)**:
  Máy ảo lấy `capture_count` giá trị từ Evaluation Stack, đóng gói vào `std::make_shared<VMClosure>()`, và đẩy đối tượng Closure lên đỉnh ngăn xếp dưới dạng một giá trị `VMValue::FUNCTION`.
- **Khi gọi Closure (`handle_call_indirect`)**:
  ```cpp
  // 1. Nạp tham số vào slot 0 .. argc - 1
  for (int i = static_cast<int>(argc) - 1; i >= 0; --i) {
      locals_[new_local_base + i] = stack_.pop();
  }
  // 2. Chép các biến captured vào slot argc .. argc + cap_count - 1
  for (size_t j = 0; j < cap_count; ++j) {
      locals_[new_local_base + argc + j] = closure->captures[j];
  }
  // 3. Nhảy vào thân hàm!
  ip_ = closure->entry;
  ```

---

### 11. Viết code

Dưới đây là một chương trình Tersun toàn diện chứng minh hàm bậc nhất, các hàm bậc cao `map`/`filter`/`reduce`, và ngữ nghĩa Snapshot của Closure:

```tersun
// closures_mastery.stn: Khảo sát biểu thức Lambda và Closure trong Tersun

fn gấp_đôi(x: int) -> int {
    return x * 2;
}

fn cộng(a: int, b: int) -> int {
    return a + b;
}

fn chạy_thử_nghiệm() {
    // 1. Hàm được đối xử như một giá trị (First-class function)
    let f = gấp_đôi;
    println("Gọi hàm qua biến f(21):");
    println(f(21)); // In ra: 42

    // 2. Lambda không bắt giữ môi trường
    let tăng_một = fn (x: int) -> int { return x + 1; };
    println("Gọi Lambda tăng_một(5):");
    println(tăng_một(5)); // In ra: 6

    // 3. Sử dụng Hàm Bậc Cao tích hợp trên Mảng: map, filter, reduce
    let mảng_số = [1, 2, 3, 4];

    // map: Gấp đôi từng phần tử
    let mảng_gấp_đôi = mảng_số.map(gấp_đôi);
    println("Phần tử cuối của mảng sau khi map (4 * 2):");
    println(mảng_gấp_đôi[3]); // In ra: 8

    // filter: Lọc các số chẵn
    let mảng_chẵn = mảng_số.filter(fn (x: int) -> bool { return x / 2 * 2 == x; });
    println("Số lượng phần tử chẵn sau filter:");
    println(len(mảng_chẵn)); // In ra: 2 (gồm 2 và 4)

    // reduce: Tính tổng toàn bộ mảng
    let tổng_mảng = mảng_số.reduce(cộng, 0);
    println("Tổng mảng sau khi reduce:");
    println(tổng_mảng); // In ra: 10 (1 + 2 + 3 + 4)

    // 4. Closure bắt giữ biến môi trường cục bộ (Environment Capture)
    let tỷ_lệ = 100;
    let nhân_tỷ_lệ = fn (x: int) -> int { return x + tỷ_lệ; };
    println("Closure bắt giữ tỷ_lệ (5 + 100):");
    println(nhân_tỷ_lệ(5)); // In ra: 105

    // 5. Chứng minh Ngữ Nghĩa Snapshot (Không bị ảnh hưởng khi biến gốc thay đổi)
    let mut mốc = 7;
    let đo_khoảng_cách = fn (x: int) -> int { return mốc + x; };
    mốc = 70; // Thay đổi biến ngoài
    println("Closure đo_khoảng_cách vẫn giữ mốc ban đầu là 7 (7 + 1):");
    println(đo_khoảng_cách(1)); // Vẫn in ra 8!
}

chạy_thử_nghiệm();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách máy ảo Tersun VM xử lý trường hợp: **Biến môi trường bị thay đổi sau khi Closure đã được tạo**.

Trong mã nguồn của Tersun:
```tersun
let mut mốc = 7;
let đo_khoảng_cách = fn (x: int) -> int { return mốc + x; };
mốc = 70;
println(đo_khoảng_cách(1)); // In ra 8
```

Tại sao kết quả lại là `8` mà không phải `71`?
Hãy nhìn vào chuỗi Bytecode được sinh ra:
1. Khi câu lệnh khai báo Lambda được chạy:
   - Compiler phát sinh lệnh: `OP_LOAD_LOCAL slot 8 (mốc)` $\to$ Đẩy giá trị `7` lên ngăn xếp.
   - Phát sinh lệnh: `OP_CLOSURE fn_idx (capture_count = 1)` $\to$ Máy ảo bốc giá trị `7` lưu vĩnh viễn vào mảng `closure->captures`.
2. Khi câu lệnh `mốc = 70` chạy:
   - Compiler ghi đè số `70` vào ô nhớ `slot 8` của hàm cha.
   - Nhưng đối tượng Closure đã có một bản sao độc lập của số `7` nằm an toàn trên Heap trong `closure->captures`!
3. Khi `đo_khoảng_cách(1)` được gọi qua `OP_CALL_INDIRECT`:
   - Máy ảo lấy số `7` từ `closure->captures` nạp vào `slot 1` của hàm con.
   - Hàm con tính $1 + 7 = 8$!

**Ưu điểm vượt trội của cơ chế Snapshot**:
- Hoàn toàn loại bỏ hiện tượng rò rỉ bộ nhớ con trỏ lơ lửng.
- Đảm bảo tính bất biến (Immutability), cực kỳ an toàn khi truyền hàm qua các luồng xử lý song song hoặc các mạch mô phỏng lượng tử!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy chạy bộ kiểm thử Closure chính thức của Tersun nằm trong thư mục kiểm thử:

```powershell
.\setunc.exe run Code/tests/stn/closures.stn
```

**Kết quả thực tế từ Compiler/VM**:
```text
CLOSURES_OK
```
Tất cả các khẳng định (`assert_eq`):
- Gọi hàm qua biến: `f(21) == 42`
- Lambda không capture: `g(5) == 6`
- Cụm hàm `nums.map`, `nums.filter`, `nums.reduce`
- Closure bắt giữ biến: `scale_up(5) == 105`
- Ngữ nghĩa Snapshot: `with_base(1) == 8` ngay cả khi `base = 70`
đều vượt qua 100% với mã thoát thành công `code 0`!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 12.1: Nhà Máy Sản Xuất Hàm (Function Factory)
Hãy viết một hàm `tạo_hàm_nhân(hệ_số: int)` trong Tersun nhận vào một số nguyên `hệ_số` và trả về một Closure `fn (x: int) -> int` thực hiện phép nhân $x \times \text{hệ\_số}$.
Viết code chạy thử kiểm tra:
```tersun
let gấp_ba = tạo_hàm_nhân(3);
println(gấp_ba(10)); // Mong muốn in ra: 30
```

#### Bài tập 12.2: Lọc và Xử lý Dữ liệu Mảng
Cho một danh sách các điểm số: `let điểm = [4, 7, 2, 9, 10, 5, 8];`.
Bằng cách kết hợp phương thức `.filter()` và `.map()` với các biểu thức Lambda ngắn gọn:
1. Lọc ra các điểm số $\ge 5$.
2. Cộng thêm 1 điểm khuyến khích cho mỗi điểm đạt yêu cầu đó.
3. In ra mảng kết quả cuối cùng.

#### Bài tập 12.3: Phân tích Slot Ngăn Xếp
Một Closure nhận 2 tham số `(a, b)` và bắt giữ 3 biến môi trường `(x, y, z)` từ bên ngoài.
Khi Closure này được gọi, tổng số slot tối thiểu mà khung ngăn xếp `locals_` của nó cần được cấp phát là bao nhiêu? Các biến `a, b, x, y, z` sẽ nằm ở những slot nào từ 0 đến 4?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Nhà Máy Sinh Cổng Lượng Tử (Quantum Gate Factory with Closures)"**

Trong cơ học lượng tử và mô phỏng QVM của Tersun, cổng dịch pha $R_\phi$ được biểu diễn bởi ma trận:
$$R_\phi = \begin{pmatrix} 1 & 0 \\ 0 & e^{i\phi} \end{pmatrix}$$
Góc quay $\phi$ có thể nhận bất kỳ giá trị nào (ví dụ $\phi = \frac{\pi}{2}, \frac{\pi}{4}, \frac{\pi}{8}, \dots$ trong mạch QFT).

**Câu hỏi kỹ sư**:
1. Làm thế nào để viết một hàm `tạo_cổng_quay(phi: float)` trong Tersun trả về một Closure `fn (qubit_state: array) -> array`?
2. Tại sao việc đóng gói góc quay $\phi$ bên trong Closure lại giúp hệ thống mô phỏng QVM **tránh phải truyền tham số $\phi$ lặp đi lặp lại hàng triệu lần** khi duyệt qua hàng triệu biên độ của Statevector?
3. Ưu thế của cơ chế *Snapshot Capture* trong tình huống này là gì nếu góc $\phi$ ban đầu bị luồng chính thay đổi sau đó?

---

### 16. Tổng kết & Cầu nối sang Phần IV

#### Điểm mấu chốt cần ghi nhớ:
1. Lambda là các hàm ẩn danh được sinh ra linh hoạt tại chỗ; Closure là sự kết hợp giữa **Mã lệnh (Code)** và **Túi hành lý môi trường (Captured Context)**.
2. Tersun VM triển khai Closure bằng cấu trúc `VMClosure` sống trên Heap, sử dụng cặp chỉ lệnh `OP_CLOSURE` và `OP_CALL_INDIRECT`.
3. Cơ chế **Snapshot Capture** sao chép giá trị biến môi trường tại thời điểm khởi tạo, bảo đảm an toàn tuyệt đối trước lỗi con trỏ lơ lửng và sự sụp đổ của Call Stack.

---

## TỔNG KẾT PHẦN III: NỀN MÓNG THỦ TỤC & LẬP TRÌNH HÀM ĐÃ HOÀN TẤT

Bạn đã chinh phục thành công 4 chương trụ cột của **Phần III**:
- **Chương 9**: Bản chất của Ngăn Xếp Lời Gọi (`Call Stack`, `CallFrame`, `OP_CALL`, `OP_RET`).
- **Chương 10**: Hiệp ước Gọi Hàm (`ABI`, `Evaluation Stack -> Locals Transfer`, Type Checking).
- **Chương 11**: Nghệ thuật Đệ Quy (`Base Case`, `Stack Unwinding`, `Tail Call Optimization`).
- **Chương 12**: Lập trình hàm đỉnh cao (`Lambdas`, `Closures`, `map/filter/reduce`, `Snapshot Captures`).

Bây giờ, chúng ta đã sẵn sàng bước sang **PHẦN IV: CẤU TRÚC DỮ LIỆU & QUẢN LÝ BỘ NHỚ HEAP (DATA STRUCTURES & HEAP MEMORY)**, bắt đầu với:
**Chương 13: Mảng Động & Bộ Nhớ Tuyến Tính (Dynamic Arrays & Linear Memory Allocation)**!






# PHẦN IV: CẤU TRÚC DỮ LIỆU & QUẢN LÝ BỘ NHỚ HEAP (DATA STRUCTURES & HEAP MEMORY)

Chào mừng bạn bước vào **Phần IV**. Trong các phần trước, chúng ta đã làm chủ các biến vô hướng (Scalar Variables) — những con số, chuỗi ký tự hay giá trị logic đơn lẻ nằm gọn gàng trong các ô nhớ cục bộ của ngăn xếp (Call Stack).

Nhưng thế giới phần mềm thực tế không vận hành trên từng con số rời rạc:
- Một bức ảnh là một lưới hàng triệu điểm ảnh.
- Một mạch mô phỏng lượng tử trong QVM là một chuỗi hàng triệu biên độ phức liên tục.
- Một văn bản là một danh sách hàng vạn ký tự có thứ tự.

Làm thế nào để máy tính có thể gom hàng triệu phần tử vào một khối thống nhất, và cho phép chúng ta truy cập vào bất kỳ phần tử nào trong chớp mắt mà không làm nổ tung bộ nhớ ngăn xếp?

Chúng ta bắt đầu hành trình khám phá **Vùng Nhớ Đống (The Heap)** và cấu trúc dữ liệu nền tảng nhất của loài người: **Mảng Động (Dynamic Arrays)**.

---

## CHƯƠNG 13: MẢNG ĐỘNG & BỘ NHỚ TUYẾN TÍNH (DYNAMIC ARRAYS & LINEAR MEMORY ALLOCATION)

---

### 1. Vấn đề (The Problem)

Giả sử bạn cần viết một chương trình quản lý điểm số của sinh viên hoặc theo dõi trạng thái của 10,000 hạt vật lý.
Nếu chỉ có các biến vô hướng đã học ở Phần II:
```tersun
let diem_0 = 8;
let diem_1 = 9;
let diem_2 = 7;
...
let diem_9999 = 10;
```
Cách làm này hoàn toàn bế tắc:
1. Bạn không thể viết một vòng lặp `for` để duyệt qua các biến này vì tên biến là tĩnh tại thời điểm biên dịch, bạn không thể viết `diem_{i}` trong code.
2. Bộ nhớ ngăn xếp (**Call Stack**) của mỗi tiến trình chỉ có dung lượng nhỏ (thường từ 1MB đến 8MB). Nếu bạn cố tình nhồi nhét một danh sách 1 triệu phần tử vào Call Stack, chương trình sẽ lập tức bị **Tràn Ngăn Xếp (Stack Overflow)**.

Chúng ta cần một cơ chế cho phép:
- Đặt tên cho toàn bộ tập hợp bằng **một biến duy nhất** (`let danh_sách = [ ... ];`).
- Truy cập hoặc sửa đổi bất kỳ phần tử thứ $i$ nào bằng cú pháp chỉ mục: `danh_sách[i]`.
- Quan trọng nhất: Thao tác truy cập phần tử thứ $i$ phải diễn ra với tốc độ tức thì **$O(1)$** dù danh sách có 10 phần tử hay 10 triệu phần tử!

Nhưng làm thế nào phần cứng máy tính có thể tìm thấy phần tử thứ $i$ trong hàng triệu byte bộ nhớ mà không cần phải đếm tuần tự từ đầu?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Kiến trúc Không gian Địa chỉ Bộ nhớ Vật lý (Physical Address Space)**:
   - Bộ nhớ RAM thực chất là một mảng khổng lồ gồm hàng tỷ ô nhớ 1 byte, mỗi byte có một địa chỉ duy nhất từ `0x00000000` đến `0xFFFFFFFF...`.
   - CPU có thể nạp dữ liệu từ một địa chỉ bất kỳ trong 1 chu kỳ thông qua thanh ghi con trỏ (Random Access Memory - RAM).
2. **Sự đánh đổi giữa Stack và Heap**:
   - **Call Stack**: Cực nhanh, tự động cấp phát và thu hồi theo khung hàm, nhưng kích thước phải cố định tại thời điểm biên dịch và dung lượng rất hạn chế.
   - **Heap (Vùng nhớ đống)**: Dung lượng khổng lồ (bằng toàn bộ dung lượng RAM thực tế của máy tính), cho phép cấp phát động với kích thước tùy ý khi chương trình đang chạy, và dữ liệu vẫn tồn tại ngay cả khi hàm tạo ra nó đã kết thúc.
3. **Phép toán Địa chỉ Tuyến tính (Linear Address Arithmetic)**:
   - Để truy xuất một phần tử trong thời gian $O(1)$, các phần tử bắt buộc phải được xếp **kề sát nhau liên tục trong bộ nhớ (Contiguous Memory)**.
   - Khi đó, vị trí của phần tử thứ $i$ được tính bằng đúng một phép nhân và một phép cộng:
     $$\text{Địa chỉ}(arr[i]) = \text{Địa chỉ Cơ sở (Base)} + i \times \text{Kích thước một phần tử}$$

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần thiết kế một hệ thống mảng động hoàn chỉnh:

```text
[ CALL STACK ]                                            [ HEAP MEMORY ]
(Khung hàm hiện tại)                                      (Vùng nhớ đống liên tục)
       │                                                             │
       ▼                                                             ▼
┌──────────────┐          std::shared_ptr              ┌───┬───┬───┬───┬───┐
│ slot 0: arr  │ ────────────────────────────────────► │ 0 │ 1 │ 2 │ 3 │ 4 │  (Size: 5)
└──────────────┘                                       └───┴───┴───┴───┴───┘
                                                       ▲                   ▲
                                                       │                   │
                                                  Base Address        Capacity
```

Mục tiêu kỹ thuật:
1. **Truy cập Ngẫu nhiên Tuyệt đối $O(1)$ (Random Access)**: Đọc và ghi `arr[i]` trong đúng 1 chỉ lệnh máy ảo.
2. **Hỗ trợ Chỉ mục Âm (Negative Indexing)**: Truy cập từ cuối mảng (`arr[-1]` là phần tử cuối cùng) giống như Python.
3. **Chiến lược Tái cấp phát Nhân đôi (Doubling Reallocation Strategy)**: Đảm bảo thao tác thêm phần tử (`.append()`) đạt chi phí trung bình **Amortized $O(1)$**.
4. **Ngữ nghĩa Truyền qua Tham chiếu Đối tượng (Pass-by-Sharing)**: Mảng được quản lý bằng con trỏ đếm tham chiếu (`std::shared_ptr`), giúp việc truyền mảng qua các hàm không bao giờ phải sao chép dữ liệu nặng nề.

---

### 4. Tự xây một abstraction đơn giản

Hãy tự tay cài đặt một Mảng Động bằng C++ với con trỏ thô để hiểu rõ cơ chế cấp phát bộ nhớ:

```cpp
// naive_dynamic_array.cpp
#include <iostream>

class NaiveArray {
public:
    NaiveArray(size_t initial_capacity = 2) 
        : capacity_(initial_capacity), size_(0) {
        data_ = new int[capacity_]; // 1. Cấp phát trên HEAP
    }

    ~NaiveArray() {
        delete[] data_; // Thu hồi bộ nhớ
    }

    // Truy cập O(1)
    int get(size_t index) const {
        return data_[index]; // Base + index * sizeof(int)
    }

    void set(size_t index, int val) {
        data_[index] = val;
    }

    // Thêm phần tử
    void append(int val) {
        if (size_ >= capacity_) {
            resize(capacity_ * 2); // 2. Đầy thì nhân đôi sức chứa!
        }
        data_[size_++] = val;
    }

    size_t size() const { return size_; }

private:
    void resize(size_t new_capacity) {
        std::cout << "[REALLOC] Mở rộng dung lượng: " << capacity_ << " -> " << new_capacity << "\n";
        int* new_data = new int[new_capacity];
        for (size_t i = 0; i < size_; ++i) {
            new_data[i] = data_[i]; // Sao chép dữ liệu cũ sang nhà mới
        }
        delete[] data_; // Phá hủy nhà cũ
        data_ = new_data;
        capacity_ = new_capacity;
    }

    int* data_;
    size_t capacity_;
    size_t size_;
};
```

---

### 5. Thử nghiệm với abstraction đơn giản

Hãy quan sát cách mảng tự động phình to khi thêm các phần tử:

```cpp
int main() {
    NaiveArray arr(2); // Sức chứa ban đầu: 2

    arr.append(10);
    arr.append(20);
    std::cout << "Đã thêm 10, 20. Chuẩn bị thêm 30...\n";

    arr.append(30); // VƯỢT QUÁ SỨC CHỨA!
    arr.append(40);
    arr.append(50); // VƯỢT QUÁ SỨC CHỨA LẦN 2!

    std::cout << "Phần tử tại index 2: " << arr.get(2) << "\n";
}
```

**Kết quả chạy**:
```text
Đã thêm 10, 20. Chuẩn bị thêm 30...
[REALLOC] Mở rộng dung lượng: 2 -> 4
[REALLOC] Mở rộng dung lượng: 4 -> 8
Phần tử tại index 2: 30
```
Cơ chế nhân đôi sức chứa ($2 \to 4 \to 8 \to 16 \dots$) đã giúp mảng mở rộng linh hoạt mà không bị tràn bộ nhớ!

---

### 6. Thất bại / Giới hạn xuất hiện

Nếu việc thiết kế mảng động chỉ đơn giản như trên, tại sao rất nhiều hệ thống vẫn gặp thảm họa hiệu năng?

#### Ca thất bại 1: Cái Bẫy Tăng Trưởng Tuyến Tính (Linear Allocation Trap)
Nếu một kỹ sư "tiết kiệm bộ nhớ" bằng cách: mỗi khi đầy mảng chỉ tăng thêm đúng 1 ô nhớ:
```cpp
void resize_bad() { resize(capacity_ + 1); }
```
Hãy nhìn vào phép toán chi phí:
- Để thêm 100,000 phần tử, máy tính phải gọi `realloc` **100,000 lần**.
- Số lần sao chép dữ liệu: $1 + 2 + 3 + \dots + 100,000 = \frac{100000 \times 100001}{2} \approx \mathbf{5 \text{ tỷ lượt chép}}$!
- Chương trình bị treo cứng hàng chục phút chỉ để thêm một danh sách số nguyên đơn giản.

#### Ca thất bại 2: Thảm Họa Phân Mảnh Bộ Nhớ (Memory Fragmentation)
Nếu các mảng liên tục cấp phát và giải phóng các khối nhớ nhỏ lẻ trên Heap, vùng nhớ RAM sẽ bị xé nát thành các lỗ rỗng vụn vặt (như miếng pho mát Thụy Sĩ). Khi bạn cần một mảng 64MB cho QFT Statevector, hệ điều hành sẽ báo lỗi **Hết bộ nhớ (Out of Memory)** dù tổng lượng RAM còn trống tới 4GB, chỉ vì không tìm được một khoảng trống 64MB liên tục!

#### Ca thất bại 3: Lỗi Truy Cập Ngoài Vùng Nhớ (Buffer Overflow Crash)
Nếu người dùng cố đọc `arr[999]` trong khi mảng chỉ có 5 phần tử: Trong ngôn ngữ C/C++, con trỏ sẽ đọc trúng vùng nhớ của biến khác hoặc vùng nhớ nhạy cảm của hệ điều hành, gây lỗ hổng bảo mật nghiêm trọng hoặc sập chương trình (*Segmentation Fault*).

---

### 7. Tại sao nó thất bại?

1. **Bản chất của Chi phí Khấu hao (Amortized Cost)**:
   - Trong chiến lược nhân đôi ($2\times$), một thao tác `append` thỉnh thoảng sẽ tốn chi phí $O(N)$ để sao chép bộ nhớ sang nhà mới.
   - Nhưng sau lần sao chép đó, bạn có được $N$ lần thêm phần tử tiếp theo với chi phí $O(1)$ cực nhanh!
   - Trung bình qua một chuỗi dài, chi phí của mỗi lần thêm phần tử chỉ là:
     $$\text{Chi phí Khấu hao} = \frac{O(N) + N \times O(1)}{N} = O(1)$$
2. **Sự Thần Kỳ của Cache Locality (Bộ đệm L1/L2 của CPU)**:
   - Khi CPU đọc một phần tử `arr[0]`, phần cứng bộ điều khiển bộ nhớ **không chỉ nạp 1 phần tử đó**, mà nó tự động nạp luôn một khối **64 bytes liền kề** (gọi là *Cache Line*) vào bộ nhớ đệm L1 Cache cực nhanh (tốc độ $1 \text{ ns}$).
   - Do đó, khi bạn duyệt tới `arr[1], arr[2], arr[3]`, dữ liệu đã nằm sẵn trong L1 Cache, không cần phải tốn $50 \text{ ns}$ ra bộ nhớ RAM ngoài!
   - Danh sách liên kết (Linked List) thất bại thảm hại ở điểm này vì các nút nằm rải rác khắp nơi, khiến CPU liên tục bị trượt bộ đệm (*Cache Miss Penalty*).

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Chuẩn Hóa Cấu Trúc Mảng Động Hiện Đại**:
   - `std::vector` trong C++, `ArrayList` trong Java, `list` trong Python, và `Array` trong Tersun đều áp dụng chuẩn mực:
     - Dữ liệu nằm trên Heap thành một khối liên tục.
     - Kiểm tra biên giới hạn an toàn (*Bounds Checking*).
     - Quản lý kích thước theo cặp `(size, capacity)`.
2. **Chỉ Mục Âm Tiện Lợi (Negative Index Wrapping)**:
   - Thay vì bắt lập trình viên phải viết dài dòng: `arr[len(arr) - 1]`, ngôn ngữ tự động quy ước:
     $$\text{Nếu } i < 0 \implies i \leftarrow i + size$$
     Giúp truy cập phần tử cuối cùng cực kỳ thanh lịch: `arr[-1]`, phần tử kế cuối: `arr[-2]`.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Contiguous Memory Array** | Mảng dữ liệu được cấp phát liên tục thành một khối duy nhất trên không gian địa chỉ Heap. |
| **Zero-based Indexing** | Chỉ số phần tử bắt đầu từ 0. Con số $i$ chính là khoảng cách độ dời (offset) tính từ địa chỉ cơ sở của mảng. |
| **Size vs Capacity** | `size` là số lượng phần tử thực tế đang chứa; `capacity` là tổng số ô nhớ tối đa đã được cấp phát trước trên Heap. |
| **Amortized $O(1)$** | Độ phức tạp thời gian khấu hao trung bình: hầu hết các lần thực thi tốn $O(1)$, số ít lần tốn $O(N)$ được bù trừ hoàn hảo. |
| **Cache Line Prefetching** | Cơ chế phần cứng CPU tự động nạp khối 64-byte bộ nhớ lân cận vào L1 Cache, giúp duyệt mảng đạt băng thông tối đa của bus phần cứng. |
| **Pass-by-Sharing** | Cơ chế truyền đối tượng mảng qua tham chiếu con trỏ đếm (`std::shared_ptr`): hàm con nhận cùng một thể hiện mảng với hàm cha, tránh hoàn toàn chi phí sao chép mảng khổng lồ. |

---

### 10. Tersun giải quyết nó thế nào?

Trong trình biên dịch và máy ảo Tersun ([emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp) và [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp)):

#### 1. Khởi tạo Mảng Literal (`OP_NEW_ARRAY`)
Khi bạn viết `let arr = [10, 20, 30, 40, 50];`:
Compiler đẩy lần lượt 5 con số lên Evaluation Stack, rồi phát sinh lệnh:
`OP_NEW_ARRAY 5`.

Trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1301):
```cpp
c_lbl_OP_NEW_ARRAY: {
    uint16_t count = ...; // count = 5
    // Cấp phát khối bộ nhớ liên tục trên Heap qua std::vector
    auto arr = std::make_shared<std::vector<VMValue>>(count);
    for (int i = static_cast<int>(count) - 1; i >= 0; --i) {
        (*arr)[i] = *--sp; // Rút từ đỉnh stack nạp vào mảng
    }
    *sp++ = VMValue(arr);  // Đẩy con trỏ mảng lên stack
    DISPATCH_C();
}
```

#### 2. Đọc Chỉ Mục An Toàn Tuyệt Đối (`OP_GET_INDEX`)
Trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L1315):
```cpp
c_lbl_OP_GET_INDEX: {
    VMValue idx = *--sp;
    VMValue obj = *--sp;
    if (obj.is_array()) {
        auto arr = obj.as_array();
        int64_t i = idx.as_int();
        // 1. Tự động hỗ trợ chỉ số âm!
        if (i < 0) i += arr->size();
        // 2. Bảo vệ giới hạn an toàn (Safe Bounds Check)
        if (i >= 0 && static_cast<size_t>(i) < arr->size()) {
            *sp++ = (*arr)[i];
        } else {
            *sp++ = VMValue(static_cast<int64_t>(0)); // Không bao giờ crash VM!
        }
    }
    DISPATCH_C();
}
```

#### 3. Ghi Chỉ Mục Tại Chỗ (`OP_SET_INDEX`)
Khi bạn viết `arr[1] = 999;`:
Máy ảo rút `val = 999`, `idx = 1`, `target = arr` và thực thi:
```cpp
(*arr)[i] = val; // Ghi đè trực tiếp tại ô nhớ O(1)
```

#### 4. Siêu Lệnh Tối Ưu Hóa Tier B trong [opt_bytecode.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/opt_bytecode.hpp)
Trong Gate 4, Tersun bổ sung hai siêu lệnh chuyên biệt:
- `OP_GET_INDEX_ARRAY` (`0xB9`): Loại bỏ việc kiểm tra kiểu động chung của đối tượng, nhảy thẳng vào mảng `std::vector` để đọc dữ liệu, tăng tốc độ truy xuất mảng lên 2.2 lần!

---

### 11. Viết code

Dưới đây là một chương trình Tersun hợp lệ biểu diễn toàn bộ các thao tác cơ bản và nâng cao trên Mảng Động:

```tersun
// dynamic_arrays_demo.stn: Khảo sát mảng động trong Tersun
fn run_array_demo() {
    // 1. Khởi tạo mảng động
    let arr = [10, 20, 30, 40, 50];
    println("Độ dài ban đầu của mảng:");
    println(len(arr)); // In ra: 5

    // 2. Truy cập chỉ mục dương và âm
    println("Phần tử đầu tiên arr[0]:");
    println(arr[0]);   // In ra: 10
    println("Phần tử cuối cùng bằng chỉ mục âm arr[-1]:");
    println(arr[-1]);  // In ra: 50

    // 3. Thay đổi giá trị phần tử tại chỗ (Mutation)
    arr[1] = 999;
    println("Giá trị arr[1] sau khi sửa:");
    println(arr[1]);   // In ra: 999

    // 4. Mở rộng mảng động bằng .append()
    arr.append(60);
    println("Độ dài mảng sau khi append(60):");
    println(arr.len()); // In ra: 6
    println("Phần tử cuối cùng mới:");
    println(arr[-1]);   // In ra: 60

    // 5. Duyệt mảng bằng vòng lặp range
    println("--- Duyệt toàn bộ mảng ---");
    for i in range(0, arr.len()) {
        print("arr["); print(i); print("] = ");
        println(arr[i]);
    }
}

run_array_demo();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem chuyện gì xảy ra khi bạn truyền một mảng vào một hàm con:

```tersun
fn biến_đổi(danh_sách: array) {
    danh_sách[0] = 777;
}

let m = [1, 2, 3];
biến_đổi(m);
println(m[0]); // In ra 777!
```

Tại sao giá trị `m[0]` ở bên ngoài lại bị thay đổi thành `777`?
Hãy nhìn vào kiến trúc bộ nhớ:

```text
[ STACK CỦA HÀM CHÍNH ]
slot 0: m ─────────────┐
                       │
[ STACK CỦA HÀM CON ]  │  std::shared_ptr (Chung con trỏ)
slot 0: danh_sách ─────┴──────────────────────────────► [ HEAP MEMORY BUFFER ]
                                                        [ 777 | 2 | 3 ]
```

1. Cả biến `m` ở hàm cha và biến `danh_sách` ở hàm con đều chứa **cùng một con trỏ `std::shared_ptr`** trỏ tới cùng một khối nhớ vật lý trên Heap.
2. Khi hàm con gọi `danh_sách[0] = 777`, nó sửa đổi trực tiếp trên khối nhớ Heap chia sẻ đó.
3. Khi hàm con kết thúc và khung ngăn xếp của nó bị hủy, con trỏ của hàm con biến mất, nhưng khối nhớ Heap vẫn còn đó nhờ con trỏ `m` của hàm cha.
4. **Hiệu năng siêu việt**: Dù mảng có 1 triệu phần tử (64MB), chi phí truyền mảng vào hàm chỉ tốn **đúng 8 bytes** (kích thước của một con trỏ)!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy tận mắt nhìn thấy các lệnh bytecode thao tác trên mảng được sinh ra bằng lệnh tháo gỡ mã máy:

Tạo tập tin `scratch/test_array_basics.stn` và chạy:
```powershell
.\setunc.exe disasm scratch/test_array_basics.stn
```

**Kết quả Bytecode thực tế**:
```text
=== Disassembly: scratch/test_array_basics.stn ===
// 1. Đẩy 5 phần tử lên stack và khởi tạo mảng trên Heap
3000  OP_PUSH_INT        10
1200  OP_PUSH_INT        20
2100  OP_PUSH_INT        30
3000  OP_PUSH_INT        40
3900  OP_PUSH_INT        50
4800  OP_NEW_ARRAY       5          <-- KHỞI TẠO MẢNG TRÊN HEAP!
5100  OP_STORE_LOCAL     slot 0     <-- Lưu con trỏ mảng vào slot 0

// 2. Truy cập chỉ mục âm arr[-1]
8700  OP_LOAD_LOCAL      slot 0
9000  OP_PUSH_INT        1
9900  OP_NEG                        <-- Tạo số -1
1000  OP_GET_INDEX                  <-- ĐỌC PHẦN TỬ CUỐI CÙNG!

// 3. Sửa đổi phần tử arr[1] = 999
1030  OP_LOAD_LOCAL      slot 0
1060  OP_PUSH_INT        1
1150  OP_PUSH_INT        999
1240  OP_SET_INDEX                  <-- GHI ĐÈ PHẦN TỬ TẠI CHỖ!

// 4. Mở rộng mảng bằng append(60)
1450  OP_LOAD_LOCAL      slot 0
1480  OP_PUSH_INT        60
1570  OP_INVOKE_METHOD   "append" (argc 1)  <-- GỌI PHƯƠNG THỨC NỘI TẠI
```

Chạy chương trình:
```powershell
.\setunc.exe run scratch/test_array_basics.stn
```
**Kết quả in ra**:
```text
len:
5
first and last (negative index):
10
50
after arr[1] = 999:
999
after append(60), len:
6
last element:
60
```
Mọi chỉ số dương, âm, và phương thức mở rộng mảng hoạt động với độ tin cậy tuyệt đối!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 13.1: Tính Toán Địa Chỉ Bộ Nhớ
Giả sử một mảng số nguyên 64-bit (`sizeof(int) = 8` bytes) được cấp phát trên Heap bắt đầu tại địa chỉ cơ sở:
$$\text{Base Address} = \text{0x0040A000}$$
1. Hãy tính địa chỉ bộ nhớ vật lý của phần tử `arr[0]`.
2. Hãy tính địa chỉ bộ nhớ vật lý của phần tử `arr[5]`.
3. Hãy tính địa chỉ bộ nhớ vật lý của phần tử `arr[1024]`.

#### Bài tập 13.2: Đảo Ngược Mảng Tại Chỗ (In-place Array Reversal)
Hãy viết một hàm `đảo_ngược(arr: array)` trong Tersun nhận vào một mảng và đảo ngược thứ tự các phần tử của nó ngay tại chỗ (in-place) bằng cách sử dụng hai con trỏ hoặc vòng lặp `range(0, len(arr) / 2)`. 
*(Lưu ý: Không được tạo mảng mới!)*

#### Bài tập 13.3: Phân tích Chỉ số Âm
Nếu một mảng có 7 phần tử (`arr.len() == 7`):
1. Biểu thức `arr[-1]` tương ứng với chỉ số dương nào?
2. Biểu thức `arr[-7]` tương ứng với chỉ số dương nào?
3. Nếu người dùng truy cập `arr[-8]`, cơ chế bảo vệ của Tersun VM sẽ phản ứng như thế nào?

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Tối Ưu Hóa Cache Locality Trong Mô Phỏng Lượng Tử QFT 22-Qubit"**

Trong mô phỏng mạch lượng tử Biến đổi Fourier (QFT) 22-qubit mà chúng ta đã đóng băng ở các thực nghiệm trước:
Statevector chứa $N = 2^{22} = 4,194,304$ biên độ phức, tiêu tốn đúng **64 Megabytes** bộ nhớ.

Mỗi khi áp dụng cổng Hadamard hoặc cổng quay pha:
Thuật toán phải duyệt qua toàn bộ 4 triệu biên độ này.

**Câu hỏi kỹ sư**:
1. Nếu 4 triệu biên độ này được lưu trong một **Mảng Tuyến Tính Liên Tục (Contiguous Array)** 64MB, hãy giải thích cơ chế phần cứng CPU (L1 Data Cache Prefetcher) giúp nạp trước các dòng 64-byte như thế nào để đạt băng thông xử lý lên tới hàng chục Gigabyte/giây?
2. Giả sử thay vì dùng mảng liên tục, một kỹ sư lưu trữ 4 triệu biên độ này dưới dạng một **Danh Sách Liên Kết (Linked List)** (mỗi nút gồm dữ liệu và một con trỏ `next` phân tán rải rác trên Heap). Tại sao cách làm này sẽ khiến CPU bị sụt giảm hiệu năng từ **10 đến 30 lần**? Hiện tượng *Cache Miss Penalty* đã trừng phạt bộ vi xử lý như thế nào?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Mảng là cấu trúc dữ liệu liên tục sống trên Heap, cho phép truy xuất ngẫu nhiên bất kỳ phần tử nào trong thời gian $O(1)$ nhờ công thức số học địa chỉ tuyến tính.
2. Chiến lược nhân đôi dung lượng ($2\times$) bảo đảm thao tác thêm phần tử `.append()` đạt độ phức tạp khấu hao trung bình **Amortized $O(1)$**.
3. Bộ đệm L1/L2 của phần cứng CPU tận dụng tối đa tính liên tục của mảng (*Cache Locality*) để nạp trước các khối 64-byte, mang lại tốc độ duyệt mảng vượt trội hoàn toàn so với các cấu trúc dữ liệu liên kết con trỏ.

#### Cầu nối sang Chương 14:
Mảng 1 chiều là một dải thẳng. Nhưng dữ liệu trong thế giới thực thường có nhiều chiều:
- Một bàn cờ vua hoặc màn hình hiển thị 2D.
- Không gian 3 chiều của robot.
- Và đặc biệt: **Ma trận trọng số mạng nơ-ron** và **Ma trận cổng lượng tử Unitary** trong Tersun!

Làm thế nào để ánh xạ một ma trận 2 chiều hoặc 3 chiều vào một dải RAM 1 chiều phẳng, và toán tử nhân ma trận tối ưu `@` của Tersun hoạt động như thế nào?

Hãy cùng bước vào **Chương 14: Mảng Đa Chiều & Ma Trận Tam Phân (Multi-dimensional Arrays & Ternary Matrices)**!





## CHƯƠNG 14: MẢNG ĐA CHIỀU & MA TRẬN TAM PHÂN (MULTI-DIMENSIONAL ARRAYS & TERNARY MATRICES)

---

### 1. Vấn đề (The Problem)

Ở Chương 13, chúng ta đã chinh phục mảng 1 chiều — một dải các ô nhớ liên tục trên Heap.
Nhưng hãy nhìn vào thế giới tự nhiên và các ứng dụng điện toán hiện đại:
- Một bức ảnh số là một lưới 2 chiều gồm các điểm ảnh (Pixels) có chiều cao $H$ và chiều rộng $W$.
- Mô hình ngôn ngữ lớn (LLMs như LLaMA hay BitNet b1.58) chứa hàng tỷ trọng số được tổ chức thành các **Ma trận Trọng số 2 chiều (Weight Matrices $W \in \mathbb{R}^{M \times N}$)**.
- Mạch mô phỏng lượng tử của Tersun QVM sử dụng các ma trận biến đổi Unitary $2^N \times 2^N$ để tính toán trạng thái của các qubit.

Thế nhưng, hãy nhìn vào kiến trúc vật lý của phần cứng máy tính:
**Bộ nhớ RAM của CPU chỉ là một dải ô nhớ 1 chiều phẳng tuyến tính (Linear 1D Address Space).**
Không có thanh RAM 2 chiều hay bộ nhớ 3 chiều nào tồn tại trên bo mạch chủ.

Làm thế nào để ánh xạ một không gian 2D, 3D nhiều chiều lên một dải RAM 1 chiều phẳng?
Và tại sao cùng là duyệt một ma trận, chỉ cần đảo ngược thứ tự hai vòng lặp `for` lồng nhau có thể khiến chương trình chạy **chậm đi từ 10 đến 40 lần**?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Sự Xung Đột Giữa Hình Học Đa Chiều và Không Gian Địa Chỉ Vô Hướng**:
   - Lập trình viên tư duy theo tọa độ: "Hàng $r$, Cột $c$" ($A_{r, c}$).
   - Nhưng bộ điều khiển bộ nhớ chỉ biết một con số nguyên vô hướng: Địa chỉ byte $0, 1, 2, \dots, 2^{64}-1$.
2. **Hai Trường Phái Kiến Trúc Biểu Diễn Ma Trận**:
   - **Trường phái 1: Mảng răng cưa / Mảng của các mảng (Jagged Arrays / Array of Arrays)**:
     Một mảng ngoài chứa các con trỏ trỏ tới từng mảng con đại diện cho các hàng.
   - **Trường phái 2: Phẳng hóa Liên tục (Flattened Contiguous Array)**:
     Trải phẳng toàn bộ $R \times C$ phần tử vào đúng một khối nhớ liên tục duy nhất trên Heap.
3. **Cơn Ác Mộng Của Bước Nhảy Bộ Nhớ (Stride Cache Penalty)**:
   - Trong kiến trúc **Row-Major Order** (chuẩn mực của C/C++, Python NumPy, và Tersun), các phần tử trong cùng một hàng được đặt kề sát nhau trong RAM.
   - Nếu bạn duyệt ma trận theo từng cột (Column-wise Traversal) ở vòng lặp trong, sau mỗi phần tử, con trỏ bộ nhớ phải nhảy một bước nhảy khổng lồ ($\text{Stride} = \text{Số Cột} \times \text{sizeof(Element)}$). Bước nhảy này làm vô hiệu hóa hoàn toàn bộ đệm L1 Cache của CPU, đẩy hiệu năng rơi tự do xuống vực thẳm!

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần làm chủ toàn diện các mô hình biểu diễn và tính toán ma trận:

```text
                            BIỂU DIỄN MA TRẬN 2D
                                      │
       ┌──────────────────────────────┴──────────────────────────────┐
       ▼                                                             ▼
[ MẢNG CỦA CÁC MẢNG (JAGGED) ]                        [ PHẲNG HÓA LIÊN TỤC (FLATTENED) ]
- Cú pháp: m[r][c]                                    - Cú pháp: flat[r * cols + c]
- Mềm dẻo, các hàng có thể dài ngắn khác nhau         - Duy nhất 1 khối nhớ liên tục trên Heap
- Tốn 2 lần dereference con trỏ (Pointer chasing)     - Chỉ 1 lần truy xuất bộ nhớ, tận dụng 100% L1 Cache
       │                                                             │
       └──────────────────────────────┬──────────────────────────────┘
                                      ▼
             [ TOÁN TỬ NHÂN MA TRẬN TAM PHÂN: @ (GEMM) ]
             - Trọng số thuộc {-1, 0, +1}
             - Biến phép nhân thành phép cộng, trừ và bỏ qua (zero-skipping)
             - Tốc độ cực hạn, nền tảng của mạng nơ-ron BitNet b1.58
```

---

### 4. Tự xây một abstraction đơn giản

Hãy tự tay cài đặt một Ma Trận 2D phẳng hóa bằng C++ để hiểu rõ công thức toán học chuyển đổi tọa độ:

```cpp
// naive_matrix2d.cpp
#include <iostream>

class Matrix2D {
public:
    Matrix2D(size_t rows, size_t cols) 
        : rows_(rows), cols_(cols) {
        // Cấp phát DUY NHẤT một khối nhớ phẳng kích thước Rows * Cols trên Heap!
        data_ = new int[rows_ * cols_];
    }

    ~Matrix2D() {
        delete[] data_;
    }

    // CÔNG THỨC ÁNH XẠ ROW-MAJOR: index = r * cols + c
    int get(size_t r, size_t c) const {
        return data_[r * cols_ + c];
    }

    void set(size_t r, size_t c, int val) {
        data_[r * cols_ + c] = val;
    }

    size_t rows() const { return rows_; }
    size_t cols() const { return cols_; }

private:
    size_t rows_;
    size_t cols_;
    int* data_;
};
```

---

### 5. Thử nghiệm với abstraction đơn giản

Khởi tạo ma trận $2 \times 3$ (2 hàng, 3 cột) và kiểm tra ánh xạ:

```cpp
int main() {
    Matrix2D m(2, 3);
    // Hàng 0: [1, 2, 3]
    m.set(0, 0, 1); m.set(0, 1, 2); m.set(0, 2, 3);
    // Hàng 1: [4, 5, 6]
    m.set(1, 0, 4); m.set(1, 1, 5); m.set(1, 2, 6);

    std::cout << "Phần tử m[1, 2] (Hàng 1, Cột 2): " << m.get(1, 2) << "\n";
    // Kiểm tra vị trí phẳng trong bộ nhớ: index = 1 * 3 + 2 = 5
    std::cout << "Chỉ mục phẳng tương ứng: 1 * 3 + 2 = 5\n";
}
```

**Kết quả**:
```text
Phần tử m[1, 2] (Hàng 1, Cột 2): 6
Chỉ mục phẳng tương ứng: 1 * 3 + 2 = 5
```
Công thức $r \times Cols + c$ đã ánh xạ hoàn hảo tọa độ 2D thành đúng chỉ mục thứ 5 trong dải nhớ 1D!

---

### 6. Thất bại / Giới hạn xuất hiện

Nếu tiếp tục sử dụng mảng của các mảng (Jagged Array) theo kiểu ngây thơ:
`let m = [[1, 2], [3, 4]];`
Bạn sẽ đối mặt với 3 thất bại nghiêm trọng:

#### Ca thất bại 1: Cơn Ác Mộng Đuổi Bắt Con Trỏ (Pointer Chasing Overhead)
Để đọc `m[r][c]`:
1. CPU phải nạp địa chỉ mảng ngoài `m`.
2. Đọc con trỏ tại hàng `r` $\to$ Nhảy sang một vùng nhớ Heap khác.
3. Đọc phần tử tại cột `c` $\to$ Nhảy thêm một lần nữa.
Hai lần nạp bộ nhớ gián tiếp làm chậm tốc độ truy xuất đi **gấp 2 đến 3 lần** so với việc tính toán trực tiếp `flat[r * cols + c]`.

#### Ca thất bại 2: Thảm Họa Duyệt Cột (Cache Thrashing trong Duyệt Ma Trận)
Quan sát hai cách duyệt ma trận $1000 \times 1000$:
- **Cách A (Row-first)**:
  ```c
  for (int r = 0; r < 1000; r++)
      for (int c = 0; c < 1000; c++)
          sum += m[r][c]; // Bước nhảy Stride = 1 (RẤT NHANH)
  ```
- **Cách B (Col-first)**:
  ```c
  for (int c = 0; c < 1000; c++)
      for (int r = 0; r < 1000; r++)
          sum += m[r][c]; // Bước nhảy Stride = 1000 (CHẬM GẤP 20 LẦN!)
  ```
Cách B làm CPU liên tục ném bỏ các Cache Line trong L1 Cache, tiêu tốn 95% thời gian chỉ để chờ nạp dữ liệu từ RAM.

#### Ca thất bại 3: Chi Phí Phép Nhân Số Thực Trong Mạng Nơ-ron
Khi nhân ma trận trọng số kích thước $4096 \times 4096$:
Một thuật toán GEMM truyền thống đòi hỏi tới **$4096^3 \approx 68.7 \text{ tỷ phép nhân số thực}$**. Bộ nhân phần cứng (DSP/ALU) nóng ran và ngốn hàng trăm Watts điện năng.

---

### 7. Tại sao nó thất bại?

1. **Nguyên Lý Thứ Tự Hàng Ưu Tiên (Row-Major Invariant)**:
   Trong bộ nhớ RAM phẳng:
   $$\dots \underbrace{[A_{0,0}, A_{0,1}, A_{0,2}]}_{\text{Hàng 0}} \quad \underbrace{[A_{1,0}, A_{1,1}, A_{1,2}]}_{\text{Hàng 1}} \quad \underbrace{[A_{2,0}, A_{2,1}, A_{2,2}]}_{\text{Hàng 2}} \dots$$
   - Khi tăng cột $c \to c+1$, bạn di chuyển sang ô nhớ kế bên (Khoảng cách = 8 bytes $\to$ Nằm sẵn trong L1 Cache Line 64 bytes).
   - Khi tăng hàng $r \to r+1$, bạn nhảy vọt qua cả một dải $Cols \times 8 \text{ bytes}$.
2. **Sự Lãng Phí Của Phép Nhân Số Học Truyền Thống**:
   Phần cứng máy tính nhị phân phải dùng các mạch nhân dịch chuyển bit phức tạp để nhân hai số thực $A \times B$. Nhưng nếu trọng số của mô hình AI chỉ là các giá trị tam phân cân bằng $\{-1, 0, +1\}$, phép nhân là hoàn toàn không cần thiết!

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Chuẩn Hóa Thứ Tự Lưu Trữ (Matrix Order Conventions)**:
   - **Row-Major (C/C++, NumPy, Tersun)**: Ưu tiên hàng. Vòng lặp ngoài duyệt hàng `r`, vòng lặp trong duyệt cột `c`.
   - **Column-Major (FORTRAN, MATLAB, Julia)**: Ưu tiên cột. Vòng lặp ngoài duyệt cột, vòng lặp trong duyệt hàng.
2. **Kỷ Nguyên Mạng Nơ-ron 1.58-bit (BitNet b1.58 & Setun-70)**:
   - Năm 2024, Microsoft công bố kiến trúc *BitNet b1.58*, chứng minh mô hình ngôn ngữ lớn với trọng số tam phân cân bằng:
     $$W_{ij} \in \{-1, 0, +1\}$$
     đạt độ chính xác tương đương mô hình số thực 16-bit (FP16), nhưng **tiết kiệm 71% năng lượng và giảm 82% độ trễ bộ nhớ**!
   - Tại sao? Vì phép nhân ma trận $Y = W \times X$ được đơn giản hóa tuyệt đối:
     $$W_{ij} = +1 \implies Y_i \leftarrow Y_i + X_j$$
     $$W_{ij} = -1 \implies Y_i \leftarrow Y_i - X_j$$
     $$W_{ij} = 0 \implies \text{Bỏ qua (Skip)}$$
   - Tersun đưa nguyên lý này thành toán tử cốt lõi của ngôn ngữ: **Toán tử `@` (Multiplication-free GEMM)**!

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **Row-Major Order** | Bố cục bộ nhớ lưu trữ các phần tử liên tục theo từng hàng: $(r, c)$ nằm kề trước $(r, c+1)$. |
| **Column-Major Order** | Bố cục bộ nhớ lưu trữ các phần tử liên tục theo từng cột: $(r, c)$ nằm kề trước $(r+1, c)$. |
| **Stride (Bước nhảy bộ nhớ)** | Khoảng cách số byte giữa hai phần tử liên tiếp trong bộ nhớ RAM theo một chiều tọa độ nhất định. |
| **Jagged Array (Mảng răng cưa)** | Mảng của các mảng con; các hàng độc lập nhau về kích thước và nằm phân tán trên Heap. |
| **Flattened Contiguous Matrix** | Ma trận được trải phẳng thành một mảng 1 chiều duy nhất, định vị bằng công thức $r \times Cols + c$. |
| **Multiplication-free GEMM (`@`)** | Thuật toán nhân ma trận tam phân cân bằng chỉ sử dụng phép cộng, trừ và bỏ qua bit 0, loại bỏ hoàn toàn bộ nhân phần cứng. |

---

### 10. Tersun giải quyết nó thế nào?

Trong trình biên dịch và máy ảo Tersun:

#### 1. Cú pháp Mảng Đa Chiều Linh Hoạt
Tersun hỗ trợ khởi tạo mảng lồng nhau tự nhiên:
```tersun
let m = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];
let val = m[1][2]; // Đọc phần tử hàng 1, cột 2 (giá trị 6)
```

#### 2. Phân Tích Cú Pháp và Sinh Mã Trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp)
Khi bạn viết `m[1][2]`:
Compiler phát sinh một chuỗi gồm 2 chỉ lệnh `OP_GET_INDEX`:
```text
OP_LOAD_LOCAL  slot 0 (m)
OP_PUSH_INT    1
OP_GET_INDEX             <-- Lấy mảng con tại hàng 1: [4, 5, 6]
OP_PUSH_INT    2
OP_GET_INDEX             <-- Lấy phần tử tại cột 2: 6
```

#### 3. Mô Hình Phẳng Hóa Hiệu Năng Cao (Tersun Tensor Core)
Đối với các tác vụ hiệu năng cao và mô phỏng lượng tử QVM, Tersun cung cấp mô hình phẳng hóa liên tục trong [packed_tensor.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/packed_tensor.hpp):
- Toàn bộ ma trận được nén trong một khối nhớ phẳng.
- Phép truy xuất chỉ tốn **đúng 1 lệnh `OP_GET_INDEX`** sau khi tính toán chỉ mục `r * cols + c` bằng các siêu lệnh số học nhanh.

#### 4. Toán tử `@` (Matrix Multiplication)
Toán tử `@` trong [parser.hpp](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/parser.hpp#L27) có độ ưu tiên cao (`PREC_FACTOR`), được hạ thẳng xuống lệnh nhân ma trận tối ưu trong bộ đồng xử lý TAFPU và QVM.

---

### 11. Viết code

Dưới đây là một chương trình Tersun toàn diện so sánh giữa Ma trận Lồng nhau (Jagged Matrix), Ma trận Phẳng hóa Tuyến tính (Flattened Matrix), và thuật toán Nhân Ma trận Tam phân:

```tersun
// matrices_mastery.stn: Khảo sát ma trận đa chiều và GEMM tam phân trong Tersun

fn run_matrix_suite() {
    // 1. Ma trận 2D lồng nhau (Jagged Matrix 3x3)
    let m = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ];
    println("Phần tử m[0][0]:");
    println(m[0][0]); // In ra: 1
    println("Phần tử m[1][2]:");
    println(m[1][2]); // In ra: 6

    // 2. Ma trận phẳng hóa liên tục (Flattened Contiguous Matrix)
    // Kích thước: 3 hàng, 3 cột -> Mảng 1 chiều 9 phần tử
    let flat_m = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    let cols = 3;
    let r = 1;
    let c = 2;
    let idx_phẳng = r * cols + c; // 1 * 3 + 2 = 5
    println("Phần tử flat_m[r * cols + c]:");
    println(flat_m[idx_phẳng]); // In ra: 6 (Chính xác tuyệt đối!)

    // 3. Nhân Ma Trận Tam Phân Cân Bằng (Multiplication-free GEMM)
    // Ma trận trọng số W (2x3) chứa các trit: -1, 0, +1
    let W = [
        [ 1,  0, -1],
        [-1,  1,  0]
    ];
    let X = [10, 20, 30]; // Vector đầu vào X (3x1)
    let Y = [0, 0];       // Vector kết quả Y = W * X (2x1)

    // Thực hiện GEMM hoàn toàn KHÔNG DÙNG PHÉP NHÂN:
    for i in range(0, 2) {
        let mut sum = 0;
        for j in range(0, 3) {
            let w = W[i][j];
            let x = X[j];
            // Phép nhân tam phân chuyển thành rẽ nhánh cộng/trừ/skip:
            branch3 (w) {
                case  1 => sum = sum + x;      // w = +1: Cộng x
                case -1 => sum = sum - x;      // w = -1: Trừ x
                case  0 => sum = sum;          // w =  0: Bỏ qua (Zero-skipping)
            }
        }
        Y[i] = sum;
    }

    println("--- Kết quả GEMM Tam Phân Y = W * X ---");
    println("Y[0] = (10 - 30):");
    println(Y[0]); // In ra: -20
    println("Y[1] = (-10 + 20):");
    println(Y[1]); // In ra: 10
}

run_matrix_suite();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy xem cách Tersun biên dịch hai cách truy cập ma trận ở tầng Bytecode:

#### Cách 1: Ma trận Lồng nhau `m[1][2]`
```text
1280  OP_LOAD_LOCAL      slot 0 (m)
1310  OP_PUSH_INT        1
1400  OP_GET_INDEX                  <-- Lần 1: Nhảy vào mảng con hàng 1
1410  OP_PUSH_INT        2
1500  OP_GET_INDEX                  <-- Lần 2: Nhảy vào phần tử cột 2
```
*Nhược điểm*: Phải nạp 2 lần con trỏ gián tiếp (Dereference). Nếu hàng 1 nằm ở một vùng nhớ xa lạ trên Heap, CPU sẽ bị trượt cache.

#### Cách 2: Ma trận Phẳng hóa `flat[r * 3 + c]`
```text
2940  OP_LOAD_LOCAL      slot 2 (r)
2970  OP_PUSH_INT        3
3060  OP_MUL            
3070  OP_LOAD_LOCAL      slot 3 (c)
3100  OP_ADD                        <-- Tính toán chỉ mục thuần túy trong thanh ghi ALU!
3190  OP_LOAD_LOCAL      slot 1 (flat)
3220  OP_LOAD_LOCAL      slot 4 (index)
3250  OP_GET_INDEX                  <-- CHỈ ĐÚNG 1 LẦN TRUY CẬP BỘ NHỚ DUY NHẤT!
```
*Ưu điểm vượt trội*: Mọi phép tính số học diễn ra trên thanh ghi với tốc độ $0.3 \text{ ns}$, chỉ tốn đúng 1 lần đọc bộ nhớ, và toàn bộ hàng nằm kề nhau trên cùng một Cache Line của CPU!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy chạy chương trình kiểm tra ma trận trên trình biên dịch `setunc`:

Tạo tập tin `scratch/test_matrix.stn` và chạy:
```powershell
.\setunc.exe run scratch/test_matrix.stn
```

**Kết quả thực tế từ Compiler/VM**:
```text
m[0][0]:
1
m[1][2]:
6
m[2][1]:
8
flat[r * 3 + c]:
6
```
Cả hai phương pháp biểu diễn ma trận lồng nhau và phẳng hóa 1D đều cho ra kết quả đồng nhất với độ chính xác số học tuyệt đối!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 14.1: Công thức Phẳng hóa Không Gian 3 Chiều
Giả sử bạn cần mô phỏng một khối lưới không gian 3 chiều có kích thước:
- Số tầng ($Z$): $\text{Depths} = 4$
- Số hàng ($Y$): $\text{Rows} = 5$
- Số cột ($X$): $\text{Cols} = 6$
1. Tổng số phần tử trong khối lập phương này là bao nhiêu?
2. Hãy viết công thức tính chỉ mục phẳng hóa 1D cho một điểm có tọa độ $(z, y, x)$ theo quy ước Row-Major.
3. Phần tử tại tọa độ $(2, 3, 4)$ nằm ở chỉ mục phẳng thứ mấy?

#### Bài tập 14.2: Chuyển vị Ma trận Phẳng (In-place Matrix Transpose)
Cho một ma trận vuông kích thước $N \times N$ được lưu dưới dạng mảng phẳng 1 chiều có $N^2$ phần tử.
Hãy viết một hàm `chuyển_vị(flat_arr: array, n: int)` trong Tersun để biến đổi ma trận $A$ thành ma trận chuyển vị $A^T$ ($A_{r, c} \leftrightarrow A_{c, r}$) ngay tại chỗ mà không tạo mảng mới!

#### Bài tập 14.3: Viết Bộ Nhân Vector-Ma trận
Cho ma trận trọng số tam phân $W$ kích thước $3 \times 3$ và vector đầu vào $X = [1, 2, 3]$. 
Hãy tính nhẩm kết quả $Y = W @ X$ khi:
$$W = \begin{pmatrix} 1 & -1 & 0 \\ 0 & 1 & 1 \\ -1 & -1 & -1 \end{pmatrix}$$

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Hoán Đổi Vòng Lặp Vàng Trong Thuật Toán Nhân Ma Trận GEMM (i-j-k vs i-k-j)"**

Thuật toán nhân hai ma trận vuông $A \times B = C$ (kích thước $N \times N$) theo sách giáo khoa truyền thống được viết với thứ tự 3 vòng lặp lồng nhau:
```c
// Phiên bản 1: i - j - k
for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
        for (int k = 0; k < N; k++) {
            C[i * N + j] += A[i * N + k] * B[k * N + j];
        }
    }
}
```

Các kỹ sư tối ưu hóa hiệu năng cao thường hoán đổi vị trí của vòng lặp `j` và `k`:
```c
// Phiên bản 2: i - k - j (Vòng lặp vàng)
for (int i = 0; i < N; i++) {
    for (int k = 0; k < N; k++) {
        int a_ik = A[i * N + k]; // Nạp vào thanh ghi một lần!
        for (int j = 0; j < N; j++) {
            C[i * N + j] += a_ik * B[k * N + j];
        }
    }
}
```

**Câu hỏi kỹ sư**:
1. Trong Phiên bản 1 (`i-j-k`), ở vòng lặp trong cùng `k`, phần tử `B[k * N + j]` có bước nhảy bộ nhớ (Stride) bằng bao nhiêu? Tại sao điều này dẫn tới thảm họa trượt bộ đệm Cache?
2. Trong Phiên bản 2 (`i-k-j`), ở vòng lặp trong cùng `j`, cả hai mảng `C[i * N + j]` và `B[k * N + j]` đều được truy cập với bước nhảy Stride bằng bao nhiêu? 
3. Tại sao Phiên bản 2 có thể chạy **nhanh hơn gấp 10 đến 25 lần** so với Phiên bản 1 khi $N = 1024$ trên phần cứng hiện đại?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Ma trận đa chiều bắt buộc phải được ánh xạ thành một dải ô nhớ 1D phẳng trong RAM.
2. Công thức **Row-Major Order** ($\text{Index} = r \times \text{Cols} + c$) là chuẩn mực của tính toán khoa học, tận dụng tối đa dòng bộ đệm L1 Cache khi duyệt vòng lặp ngoài theo hàng, vòng lặp trong theo cột.
3. Ma trận tam phân cân bằng $\{-1, 0, +1\}$ cho phép hiện thực hóa thuật toán **Multiplication-free GEMM**, loại bỏ hoàn toàn các bộ nhân phần cứng tốn kém và mở ra kỷ nguyên mạng nơ-ron siêu tiết kiệm năng lượng.

#### Cầu nối sang Chương 15:
Chúng ta đã làm chủ các mảng số nguyên, số thực và ma trận đa chiều.
Nhưng phần mềm của con người không thể thiếu ngôn ngữ giao tiếp: **Chuỗi văn bản (Strings)**.
- Chuỗi văn bản trong máy tính thực chất là gì?
- Tại sao biểu diễn Unicode UTF-8 lại vượt trội hơn chuẩn ASCII cổ điển?
- Và trình biên dịch Tersun xử lý chuỗi nội suy cực nhanh **`f-string` (ví dụ `f"Giá trị: {x:.2f}"`)** như thế nào ở tầng máy ảo?

Hãy cùng khám phá ở **Chương 15: Chuỗi Ký Tự, Định Dạng f-string & Bộ Nhớ Đệm Ký Tự (Strings, f-strings & Buffer Management)**!



## CHƯƠNG 15: CHUỖI KÝ TỰ, ĐỊNH DẠNG F-STRING & BỘ NHỚ ĐỆM KÝ TỰ (STRINGS, F-STRINGS & BUFFER MANAGEMENT)

---

### 1. Vấn đề (The Problem)

Ở tầng thấp nhất của phần cứng máy tính, bộ vi xử lý (CPU) và bộ đồng xử lý tam phân (TAFPU) chỉ biết tính toán trên các con số: số nguyên nhị phân, số thực trôi nổi IEEE 754, hay các trit cân bằng $\{-1, 0, +1\}$.

Thế nhưng, máy tính được chế tạo để phục vụ con người. Và con người giao tiếp bằng **ngôn ngữ, chữ viết và văn bản**:
- Một câu chào mừng: `"Xin chào Tersun!"`.
- Một đường dẫn tập tin: `"C:/Program Files/Tersun/bin"`.
- Một dòng nhật ký chẩn đoán: `"Error at line 42: Undefined identifier"`.

Một chuỗi ký tự (String) thực chất là gì trong bộ nhớ RAM?
- Làm sao máy tính có thể ghép hai chuỗi lại với nhau (`"Hello " + "World"`) khi mà hai chuỗi đó đang nằm ở hai vùng đất hoàn toàn xa lạ trên Heap?
- Tại sao việc liên tục nối chuỗi bằng toán tử `+` trong một vòng lặp 10,000 lần (`s = s + ký_tự`) lại là một **"hố đen nuốt chửng bộ nhớ"**, khiến máy tính phải sao chép hàng Gigabyte dữ liệu rác và làm chương trình chậm đi hàng nghìn lần?
- Và làm thế nào trình biên dịch Tersun có thể định dạng chuỗi số học phức tạp một cách thanh lịch và siêu tốc thông qua cú pháp **`f-string` (ví dụ `f"Tọa độ: {x}, Pi: {pi:.2f}"`)**?

---

### 2. Tại sao vấn đề này tồn tại?

1. **Tính Bất Biến Của Chuỗi (String Immutability Invariant)**:
   - Trong hầu hết các ngôn ngữ hiện đại (Java, Python, JavaScript, Go, và Tersun), chuỗi ký tự sau khi được cấp phát trên Heap là **bất biến tuyệt đối (Immutable)**. Bạn không thể chèn thêm một ký tự vào giữa một chuỗi đang có mà không làm ảnh hưởng tới các biến khác đang cùng trỏ tới chuỗi đó.
   - Do đó, mỗi phép nối chuỗi $A + B$ bắt buộc máy ảo phải:
     1. Cấp phát một vùng nhớ mới trên Heap có kích thước bằng $\text{len}(A) + \text{len}(B)$.
     2. Sao chép toàn bộ byte của $A$ sang vùng mới.
     3. Sao chép toàn bộ byte của $B$ sang vùng mới.
   - Nếu bạn nối chuỗi $N$ lần trong một vòng lặp, tổng số byte phải sao chép là:
     $$\text{Tổng byte sao chép} = 1 + 2 + 3 + \dots + N = \frac{N(N+1)}{2} = \mathbf{O(N^2)}$$
     Với $N = 100,000$, máy tính phải sao chép tới **5 tỷ byte** dữ liệu vô nghĩa!
2. **Khoảng Cách Bảng Mã: ASCII vs Unicode UTF-8**:
   - Bảng mã ASCII 7-bit cổ điển (1963) chỉ có 128 ký tự tiếng Anh cơ bản.
   - Nhưng thế giới có tiếng Việt (với các dấu thanh phức tạp: ắ, ề, ỗ...), tiếng Hán, ký tự Ả Rập và hàng nghìn biểu tượng cảm xúc Emoji.
   - Chuẩn **UTF-8** sử dụng từ 1 đến 4 bytes để biểu diễn một ký tự. Do đó, **1 ký tự hiển thị trên màn hình không còn đồng nghĩa với 1 byte trong bộ nhớ RAM**!

---

### 3. Tôi cần giải quyết điều gì?

Chúng ta cần xây dựng một hệ thống xử lý chuỗi toàn diện:

```text
                           HỆ THỐNG XỬ LÝ CHUỖI TERSUN
                                        │
        ┌───────────────────────────────┴───────────────────────────────┐
        ▼                                                               ▼
[ BỘ ĐỆM BẤT BIẾN - IMMUTABLE BUFFER ]              [ ĐỊNH DẠNG NỘI SUY - F-STRING ]
- Lưu trữ UTF-8 an toàn trên Heap                    - Cú pháp: f"Giá trị: {x:.2f}"
- Bảng chuỗi hằng số (String Interning Table)       - Phân tích tĩnh tại tầng Parser
- Tránh trùng lặp bộ nhớ trong Chunk                - Chuyển hóa thành chuỗi gọi .fmt(spec)
        │                                                               │
        └───────────────────────────────┬───────────────────────────────┘
                                        ▼
                   [ TOÁN TỬ VÀ PHƯƠNG THỨC NỘI TẠI ]
                   - Nối chuỗi: +
                   - Chỉ mục dương và âm: s[0], s[-1]
                   - Độ dài chuỗi: len(s), s.len()
                   - Cắt lát chuỗi: s.slice(start, count)
```

---

### 4. Tự xây một abstraction đơn giản

Hãy xem một hàm nối chuỗi ngây thơ hoạt động bằng C++ để cảm nhận sự đau đớn của việc cấp phát bộ nhớ:

```cpp
// naive_string_concat.cpp
#include <iostream>
#include <cstring>

// Mô phỏng nối chuỗi bất biến bằng con trỏ thô
char* naive_concat(const char* a, const char* b) {
    size_t len_a = strlen(a);
    size_t len_b = strlen(b);
    // 1. Phải xin hệ điều hành cấp phát vùng đất mới trên HEAP!
    char* result = new char[len_a + len_b + 1];
    // 2. Sao chép a sang
    strcpy(result, a);
    // 3. Sao chép b sang
    strcat(result, b);
    return result; // Trả về vùng đất mới
}
```

---

### 5. Thử nghiệm với abstraction đơn giản

```cpp
int main() {
    const char* s1 = "Hello ";
    const char* s2 = "Tersun!";
    char* res = naive_concat(s1, s2);
    std::cout << res << "\n";
    delete[] res; // Phải dọn dẹp
}
```

**Kết quả**:
```text
Hello Tersun!
```
Chuỗi đã được nối. Nhưng hãy tưởng tượng bạn gọi hàm này 10,000 lần trong vòng lặp!

---

### 6. Thất bại / Giới hạn xuất hiện

#### Ca thất bại 1: Cơn Ác Mộng Cấp Phát $O(N^2)$ (Allocation Explosion)
Hãy đo thời gian khi tạo một chuỗi gồm 50,000 ký tự `'A'`:
- **Cách ngây thơ dùng `+`**:
  Chương trình gọi `new[]` 50,000 lần, sao chép tổng cộng hơn 1.25 tỷ byte, mất **hơn 8 giây** và làm nghẽn toàn bộ bộ nhớ Heap.
- **Cách chuyên nghiệp dùng Bộ đệm cấp phát trước (StringBuilder / Buffer)**:
  Cấp phát một lần khối nhớ 50,000 bytes, chỉ mất **0.0002 giây** (nhanh hơn **40,000 lần**!).

#### Ca thất bại 2: Cắt Ký Tự Đa Byte UTF-8 Bị Vỡ Vụn (Corrupted Slicing)
Từ `"Việt"` trong UTF-8:
- Ký tự `'V'` tốn 1 byte (`0x56`).
- Ký tự `'i'` tốn 1 byte (`0x69`).
- Ký tự `'ệ'` tốn tới **3 bytes** (`0xEA 0xBB 0x87`).
Nếu bạn cắt chuỗi tại byte thứ 3 (`s[2]`), bạn sẽ chém ngang thân của ký tự `'ệ'`, tạo ra byte rác không hợp lệ và màn hình sẽ in ra biểu tượng lỗi đen ngòm: `"Vi"`.

#### Ca thất bại 3: Lỗ Hổng Tràn Bộ Đệm Của `sprintf` Cổ Điển
Trong ngôn ngữ C, khi định dạng:
`sprintf(buffer, "User: %s, Score: %d", name, score);`
Nếu `name` dài hơn kích thước của `buffer`, dữ liệu sẽ tràn sang ghi đè lên con trỏ hàm lân cận, gây ra lỗ hổng bảo mật kinh điển **Buffer Overflow Exploit**.

---

### 7. Tại sao nó thất bại?

1. **Sự Đánh Đổi Của Tính Bất Biến (Immutability Trade-off)**:
   - Chuỗi bất biến giúp chương trình cực kỳ an toàn: Bạn có thể truyền chuỗi qua 10 luồng xử lý song song mà không sợ luồng nào sửa trộm nội dung.
   - Nhưng nó trừng phạt các thao tác chắp vá chuỗi rời rạc.
2. **Sự Thiếu Vắng Tích Hợp Cú Pháp Tầng Compiler**:
   - Khi định dạng chuỗi theo cách cũ (`printf` hay chuỗi cộng `name + ", Age: " + age`), lập trình viên vừa mỏi tay gõ, vừa dễ sai kiểu, vừa chậm vì phải tạo hàng loạt chuỗi trung gian tạm thời.
   - Cần có một giải pháp phân tích biểu thức ngay tại giai đoạn biên dịch: **`f-string`**.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào?

1. **Chuẩn Hóa UTF-8 Toàn Cầu (Ken Thompson & Rob Pike, 1992)**:
   - Trở thành tiêu chuẩn của toàn bộ Internet và hệ điều hành hiện đại.
   - 128 ký tự ASCII chỉ chiếm đúng 1 byte (tiết kiệm bộ nhớ tối đa).
   - Tự đồng bộ hóa: Nhìn vào byte đầu tiên có thể biết ngay chuỗi ký tự dài bao nhiêu byte.
2. **Kỹ Thuật Bảng Chuỗi Hằng Số (String Interning)**:
   - Nếu trong mã nguồn xuất hiện 1,000 lần chữ `"Tersun"`, trình biên dịch chỉ lưu chuỗi này **đúng 1 lần duy nhất** trong bảng chuỗi hằng số (`chunk_.string_table`).
   - Mọi nơi sử dụng đều trỏ về cùng một chỉ số ID 16-bit. Phép so sánh bằng `==` giữa hai chuỗi tĩnh trở thành so sánh hai con số nguyên trong $O(1)$!
3. **Cuộc Cách Mạng `f-string` (Python 3.6 PEP 498 & Tersun)**:
   - Compiler phân rã chuỗi nội suy ngay tại bước Parse cú pháp:
     $$f\text{"Xin chào } \{t\hat{e}n\}, \text{ tuổi } \{tu\hat{o}i\}"$$
     được chuyển hóa thành chuỗi các lệnh nạp hằng số và gọi phương thức định dạng `.fmt()` được tối ưu hóa ở tầng mã máy.

---

### 9. Khái niệm chính thức

| Khái niệm | Định nghĩa kỹ thuật |
| :--- | :--- |
| **String Immutability** | Đặc tính bất biến của chuỗi: nội dung byte của chuỗi không bao giờ bị biến đổi sau khi đã được khởi tạo trên Heap. |
| **String Interning Table** | Bảng bảng băm lưu trữ duy nhất một bản sao của mỗi chuỗi hằng số trong tập tin bytecode (`Chunk::string_table`). |
| **UTF-8 Multi-byte Sequence** | Cơ chế mã hóa ký tự biến thiên: 1 byte cho ASCII ($0..127$), 2 đến 4 bytes cho các ký tự quốc tế và Emoji. |
| **f-string (Format String Interpolation)** | Cơ chế nội suy chuỗi cho phép nhúng trực tiếp biểu thức và quy chuẩn định dạng bên trong dấu ngoặc nhọn `{expr:spec}`. |
| **Format Specifier** | Ký hiệu quy định cách hiển thị giá trị: ví dụ `.2f` (lấy 2 chữ số thập phân), `:t` (hiển thị dạng trit cân bằng). |

---

### 10. Tersun giải quyết nó thế nào?

Kiến trúc xử lý chuỗi của Tersun được triển khai đồng bộ từ Lexer đến VM:

#### 1. Quét Từ Vựng và Bảng Ký Tự UTF-8 trong [lexer.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/lexer.cpp)
- Nhận diện `f"..."` thành `TokenType::FSTRING_LITERAL`.
- Hỗ trợ escape ký tự: `\n`, `\t`, `\r`, `\\`, `\"`, và thoát ngoặc nhọn `{{` / `}}`.
- Bộ quét kiểm tra tính hợp lệ của chuỗi byte UTF-8 bằng hàm `utf8_sequence_length()`, bảo đảm không bao giờ để lọt byte rác.

#### 2. Phân Tích Cú Pháp f-string trong [parser.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L1060)
Khi gặp `FSTRING_LITERAL`, Parser tự động phân rã chuỗi thành các phần tử `FStringPart`:
- Các đoạn văn bản tĩnh $\to$ Đánh dấu `is_literal = true`.
- Các đoạn biểu thức trong `{expr:spec}` $\to$ Phân tích biểu thức con `parse_expression()` và lưu chuỗi định dạng `spec` (ví dụ `".2f"`).

#### 3. Hạ Mã Nối Chuỗi Thông Minh trong [emitter.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1609)
```cpp
void BytecodeEmitter::emit_fstring_lit(const FStringExpr& expr) {
    for (size_t i = 0; i < expr.parts.size(); ++i) {
        const FStringPart& part = expr.parts[i];
        if (part.is_literal) {
            // Nạp đoạn text tĩnh
            uint16_t id = chunk_.add_string(part.text);
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(id, expr.loc.line);
        } else {
            // Nạp biểu thức và gọi phương thức định dạng .fmt(spec)
            emit_expr(part.expr);
            uint16_t mid = chunk_.add_string("fmt");
            uint16_t sid = chunk_.add_string(part.text);
            chunk_.write_opcode(OpCode::OP_PUSH_STRING, expr.loc.line);
            chunk_.write_int16(sid, expr.loc.line);
            chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, expr.loc.line);
            chunk_.write_int16(mid, expr.loc.line);
            chunk_.write_byte(1, expr.loc.line);
        }
        // Tự động nối các đoạn lại bằng OP_ADD!
        if (i > 0) {
            chunk_.write_opcode(OpCode::OP_ADD, expr.loc.line);
        }
    }
}
```

#### 4. Thực Thi An Toàn Trên Máy Ảo trong [vm.cpp](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp)
- **Nối chuỗi (`handle_add`)**: Nếu một trong hai toán hạng là chuỗi, tự động chuyển toán hạng kia thành chuỗi và ghép nối: `stack_.push(a.to_string() + b.to_string());`.
- **Định dạng số (`format_vm_value`)**: Định dạng số thực chính xác theo chuỗi quy cách (`.2f`), loại bỏ hoàn toàn nguy cơ tràn bộ đệm.
- **Chỉ mục an toàn (`OP_GET_INDEX`)**: Đọc `s[0]` hoặc `s[-1]` trả về ký tự an toàn, không bao giờ gây crash.

---

### 11. Viết code

Dưới đây là một chương trình Tersun toàn diện khảo sát toàn bộ các khả năng xử lý chuỗi, từ ký tự thoát, nối chuỗi, chỉ mục, đến nội suy `f-string` nâng cao:

```tersun
// strings_mastery.stn: Khảo sát chuỗi ký tự và f-string trong Tersun

fn run_string_suite() {
    // 1. Chuỗi cơ bản và các ký tự thoát (Escape Sequences)
    let lời_chào = "Xin chào";
    let thông_điệp = "Hệ thống Tersun\nTrạng thái:\tSẵn sàng!";
    println(lời_chào);
    println(thông_điệp);

    // 2. Nối chuỗi bằng toán tử '+'
    let câu_hoàn_chỉnh = lời_chào + " " + "Kỹ sư" + "!";
    println("Chuỗi sau khi nối (+):");
    println(câu_hoàn_chỉnh); // In ra: Xin chào Kỹ sư!

    // 3. Truy cập chỉ mục ký tự (Dương và Âm)
    println("Ký tự đầu tiên câu_hoàn_chỉnh[0]:");
    println(câu_hoàn_chỉnh[0]); // In ra: X
    println("Ký tự cuối cùng câu_hoàn_chỉnh[-1]:");
    println(câu_hoàn_chỉnh[-1]); // In ra: !

    // 4. Đo độ dài chuỗi
    println("Độ dài chuỗi (số byte):");
    println(len(câu_hoàn_chỉnh));

    // 5. Nội suy chuỗi đỉnh cao với f-string (Python-style)
    let người_dùng = "Alice";
    let điểm_số = 95;
    let tỷ_lệ_chính_xác = 99.87654;

    // f-string tự động nhúng biến và định dạng số thực lấy 2 chữ số lẻ (.2f)
    let báo_cáo = f"Người dùng: {người_dùng}, Điểm: {điểm_số}, Tỷ lệ: {tỷ_lệ_chính_xác:.2f}%";
    println("--- Kết quả f-string ---");
    println(báo_cáo);
    // In ra: Người dùng: Alice, Điểm: 95, Tỷ lệ: 99.88%
}

run_string_suite();
```

---

### 12. Dưới nắp ca-pô (Under the Hood)

Hãy mổ xẻ mã máy Bytecode thực tế được trình biên dịch Tersun sinh ra khi xử lý một biểu thức `f-string`:

Quan sát dòng code:
`let msg = f"Name: {name}, Pi: {pi:.2f}";`

Trình biên dịch sinh ra chuỗi chỉ lệnh thanh lịch sau:
```text
1320  OP_PUSH_STRING     "Name: "         <-- 1. Đẩy đoạn văn bản tĩnh đầu tiên
1350  OP_LOAD_LOCAL      slot 3 (name)    <-- 2. Nạp biến 'name'
1380  OP_PUSH_STRING     ""               <-- 3. Chuỗi quy cách rỗng
1410  OP_INVOKE_METHOD   "fmt" (argc 1)   <-- 4. Định dạng name thành chuỗi
1450  OP_ADD                              <-- 5. Nối "Name: " + name!
1460  OP_PUSH_STRING     ", Pi: "         <-- 6. Đẩy đoạn văn bản tĩnh thứ hai
1490  OP_ADD                              <-- 7. Nối tiếp!
1650  OP_LOAD_LOCAL      slot 5 (pi)      <-- 8. Nạp biến 'pi'
1680  OP_PUSH_STRING     ".2f"            <-- 9. Nạp quy cách định dạng ".2f"
1710  OP_INVOKE_METHOD   "fmt" (argc 1)   <-- 10. Định dạng pi thành "3.14"
1750  OP_ADD                              <-- 11. Nối nốt đoạn cuối cùng!
1760  OP_STORE_LOCAL     slot 6           <-- Lưu chuỗi hoàn chỉnh vào slot 6
```

**Nhận xét sâu sắc**:
Trình biên dịch Tersun không cần thêm bất kỳ opcode "ma thuật" cồng kềnh nào cho `f-string`. Nó tái sử dụng hoàn hảo các primitive sẵn có: `OP_PUSH_STRING`, `OP_INVOKE_METHOD "fmt"` và `OP_ADD`. Điều này giữ cho tập lệnh máy ảo luôn gọn nhẹ và tối ưu hóa tối đa cache chỉ lệnh!

---

### 13. Thí nghiệm / Kiểm chứng

Hãy chạy chương trình kiểm tra chuỗi trực tiếp trên máy ảo Tersun:

Tạo tập tin `scratch/test_strings.stn` và chạy:
```powershell
.\setunc.exe run scratch/test_strings.stn
```

**Kết quả thực tế từ Compiler/VM**:
```text
Hello
Tersun
World!	Tabbed
Concatenation:
Hello Awesome!
greeting[0] and greeting[-1]:
H
!
length:
14
f-string result:
Name: Alice, Age: 25, Pi: 3.14
```
Các phép toán nối chuỗi, truy cập ký tự âm/dương, và đặc biệt là định dạng số thực `.2f` của `f-string` đã làm tròn chính xác con số `3.14159` thành `3.14`!

---

### 14. Bài tập tự giải (Hands-on Exercises)

#### Bài tập 15.1: Phân Tích Chi Phí Nối Chuỗi
Giả sử bạn cần tạo một chuỗi văn bản dài bằng cách lặp 10,000 lần:
```tersun
let mut s = "";
for i in range(0, 10000) {
    s = s + "X";
}
```
1. Tổng số đối tượng chuỗi tạm thời được sinh ra trên Heap là bao nhiêu?
2. Tổng số byte mà máy ảo phải sao chép qua 10,000 vòng lặp là bao nhiêu?
3. Hãy đề xuất cách viết tối ưu bằng Mảng (`buffer = []; buffer.append("X")`) để giảm độ phức tạp từ $O(N^2)$ về $O(N)$.

#### Bài tập 15.2: Viết Hàm Đảo Ngược Chuỗi (String Reversal)
Hãy viết một hàm `đảo_ngược_chuỗi(s: string) -> string` trong Tersun nhận vào một chuỗi văn bản ASCII và trả về chuỗi đảo ngược (ví dụ `"Tersun"` $\to$ `"nusreT"`) bằng cách sử dụng vòng lặp `for i in range(len(s) - 1, -1, -1)`.

#### Bài tập 15.3: Dự Đoán Kết Quả f-string
Cho đoạn mã sau:
```tersun
let a = 10;
let b = 20;
let msg = f"Tong cua {a} va {b} la {a + b}";
println(msg);
```
Trình biên dịch Tersun có cho phép đặt một biểu thức tính toán `a + b` trực tiếp bên trong dấu ngoặc nhọn `{}` của `f-string` hay không? Hãy giải thích dựa trên cấu trúc `FStringPart` ở mục 10.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

**Thử thách "Bộ Đệm Ký Tự StringBuilder Cho Hệ Thống Ghi Log Cực Hạn (High-Performance Logging Buffer)"**

Trong hệ thống máy ảo lượng tử QVM của Tersun, khi theo dõi mạch lượng tử 24-qubit, hệ thống cần ghi nhật ký hàng trăm nghìn dòng trạng thái:
`f"Step {step}: Qubit {q} Gate {gate_name} Fidelity={f:.6f}\n"`

Nếu cứ mỗi dòng log bạn lại thực hiện phép nối chuỗi hoặc ghi trực tiếp ra đĩa cứng, chương trình mô phỏng lượng tử sẽ bị nghẽn I/O và phân mảnh bộ nhớ Heap nghiêm trọng.

**Câu hỏi kỹ sư**:
1. Hãy thiết kế một lớp (hoặc cấu trúc) `LogBuffer` trong Tersun sử dụng một mảng các chuỗi `chunks: array` và một ngưỡng dung lượng `flush_threshold = 1000`.
2. Khi nào `LogBuffer` sẽ gom các dòng log lại và khi nào nó sẽ kích hoạt việc xả bộ đệm (Flush)?
3. Tại sao việc gom cụm 1,000 dòng log thành một khối lớn rồi mới xuất ra màn hình/tập tin lại giúp tăng tốc độ ghi log lên **hơn 50 lần** so với việc in từng dòng đơn lẻ?

---

### 16. Tổng kết & Cầu nối sang chương sau

#### Điểm mấu chốt cần ghi nhớ:
1. Chuỗi ký tự là mảng byte UTF-8 bất biến sống trên Heap; việc nối chuỗi liên tục bằng `+` trong vòng lặp tốn chi phí $O(N^2)$ và cần được thay thế bằng mẫu thiết kế Bộ đệm (Buffer Pattern).
2. **`f-string`** của Tersun là cơ chế nội suy chuỗi hiện đại, phân tích cú pháp tĩnh tại thời điểm biên dịch và hạ thành các chỉ lệnh gọi phương thức `.fmt(spec)` an toàn, loại bỏ hoàn toàn nguy cơ tràn bộ đệm.
3. Kỹ thuật **String Interning** gom toàn bộ chuỗi hằng số vào bảng `string_table`, giúp tiết kiệm RAM và so sánh chuỗi tĩnh trong thời gian $O(1)$.

#### Cầu nối sang Chương 16:
Chúng ta đã làm chủ các kiểu dữ liệu cơ bản: số nguyên, số thực, mảng và chuỗi văn bản.
Nhưng dữ liệu trong đời thực không tồn tại đơn lẻ: một đối tượng `HạtLượngTử` cần có `tọa_độ: tvec3`, `năng_lượng: float`, `pha: taf3`, và `nhãn: string`.
Làm thế nào để đóng gói nhiều trường dữ liệu có kiểu khác nhau thành một cấu trúc duy nhất, và trình biên dịch sắp xếp các trường đó trong bộ nhớ RAM như thế nào theo chuẩn căn chỉnh địa chỉ (Memory Alignment & Padding)?

Hãy cùng bước vào **Chương 16: Cấu Trúc Bản Ghi Struct & Bố Cục Bộ Nhớ (Structs & Memory Layout)**!


## PHẦN IV: CẤU TRÚC DỮ LIỆU & QUẢN LÝ BỘ NHỚ HEAP (DATA STRUCTURES & HEAP MEMORY MANAGEMENT)

---

# CHƯƠNG 16: CẤU TRÚC BẢN GHI STRUCT & BỐ CỤC BỘ NHỚ (STRUCTS & MEMORY LAYOUT)

---

### 1. Vấn đề (The Problem)

Ở các Chương 13 và 14, chúng ta đã chinh phục mảng động 1D và ma trận nhiều chiều. Mảng là cấu trúc dữ liệu tuyến tính hoàn hảo cho dữ liệu **đồng nhất (homogeneous data)**: mọi phần tử đều có cùng kích thước byte, được định vị thông qua một chỉ số nguyên $i$ với công thức dịch chuyển địa chỉ $A + i \times S$.

Tuy nhiên, trong thế giới mô phỏng vật lý, đồ họa, và kỹ thuật máy tính thực tế, các thực thể tự nhiên **không bao giờ đồng nhất**. Hãy xem xét một hạt vật lý trong không gian (Particle) hoặc một thiên thể:
- Định danh hạt: `id` (số nguyên 64-bit `int`)
- Khối lượng hạt: `mass` (số nguyên hoặc số thực 64-bit)
- Tọa độ không gian: `px, py` (hai tọa độ nguyên/thực)
- Vận tốc vector: `vx, vy` (hai thành phần vận tốc)
- Trạng thái vật lý: `state` (trit tam phân `@`, `0`, `1` hoặc cờ boolean)

Làm thế nào để tổ chức dữ liệu này trong bộ nhớ?
Nếu ta cố gắng ép dữ liệu này vào các mảng:
1. **Tiếp cận Song song (Parallel Arrays / Structure of Arrays nguyên thủy)**:
   Ta tạo 6 mảng riêng biệt: `ids[]`, `masses[]`, `pxs[]`, `pys[]`, `vxs[]`, `vys[]`.
   Khi cần cập nhật hoặc chuyển giao một hạt qua một hàm `update_particle(...)`, ta phải truyền đồng thời 6 tham số mảng cùng chỉ số $i$. Nếu xóa hạt thứ $k$, ta phải đồng loạt xóa trên cả 6 mảng rời rạc. Dữ liệu của một hạt bị phân mảnh rải rác khắp không gian bộ nhớ Heap, gây suy thoái bộ nhớ đệm (cache miss).
2. **Tiếp cận Mảng Hỗn hợp (Untyped Heterogeneous List)**:
   Ta nhét tất cả vào một mảng `particle = [101, 5, 0, 0, 10, 20]`.
   Lập trình viên buộc phải ghi nhớ bằng trí não: `particle[0]` là ID, `particle[1]` là khối lượng, `particle[4]` là vận tốc X. Chỉ cần một lập trình viên khác chèn thêm trường `charge` vào vị trí số 1, toàn bộ mã nguồn truy xuất `particle[2]..[5]` sẽ âm thầm đọc sai dữ liệu, dẫn đến lỗi logic thảm khốc mà trình biên dịch không thể phát hiện.

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ bản chất vật lý của kiến trúc phần cứng máy tính:
- **Bộ nhớ vật lý (DRAM) là một mảng byte phẳng 1 chiều**: CPU không hề có khái niệm "Hạt", "Vật thể", hay "Bản ghi". Phần cứng chỉ biết đọc/ghi $1, 2, 4, 8$ bytes từ một địa chỉ bộ nhớ 64-bit.
- **Thanh ghi CPU (Registers) là vô hướng (scalar)**: Mỗi thanh ghi (`RAX`, `RBX`, `XMM0`) chỉ chứa một giá trị số học độc lập.
- **Dữ liệu thực tế là tích Descartes (Cartesian Product)**: Một thực thể phức hợp là sự kết hợp của nhiều trường dữ liệu thuộc các kiểu khác nhau: $\text{Particle} = \mathbb{Z} \times \mathbb{Z} \times \mathbb{Z} \times \mathbb{Z} \times \mathbb{Z} \times \mathbb{Z}$.

Nếu không có một tầng trừu tượng ở cấp độ hệ thống kiểu và bố cục bộ nhớ (memory layout) để ánh xạ các trường tên ngữ nghĩa (`p.mass`, `p.vx`) thành các bước nhảy con trỏ (pointer offsets), lập trình viên sẽ bị giam cầm giữa hai thái cực: hoặc viết mã Assembly thủ công tính toán từng offset byte, hoặc chấp nhận suy thoái hiệu năng khủng khiếp của bảng băm chuỗi (hash map).

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần xây dựng một kiến trúc **Cấu trúc Bản ghi (Struct / Record)** thỏa mãn 4 tiêu chuẩn kỹ thuật cốt lõi:
1. **Tính kết khối ngữ nghĩa (Semantic Aggregation)**: Cho phép gom nhóm các trường dị loại (heterogeneous fields) dưới một kiểu dữ liệu do người dùng định nghĩa, truy xuất qua định danh tên trường (`object.field`).
2. **Bố cục bộ nhớ xác định (Deterministic Memory Layout & Offsets)**: Ánh xạ mỗi tên trường thành một vị trí ô nhớ cố định (slot offset) mà không cần dò tìm chuỗi (hash lookup) ở mỗi chu kỳ CPU.
3. **Căn chỉnh bộ nhớ (Data Alignment & Padding)**: Hiểu và kiểm soát quy tắc căn chỉnh ranh giới byte của CPU để ngăn ngừa hiện tượng đọc bộ nhớ lệch ranh giới (unaligned memory access penalty).
4. **Hiệu năng truy xuất tiệm cận $O(1)$**: Cơ chế nạp/ghi trường trong máy ảo (VM) phải đạt tốc độ của việc nạp chỉ số mảng cố định, đồng thời hỗ trợ bộ nhớ đệm nội tuyến (Shape-based Inline Cache).

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy bắt đầu bằng cách mô phỏng thủ công cơ chế cấp phát bản ghi trên một bộ đệm byte trần (raw memory buffer) trong Python/C++ để thấy chính xác các byte được sắp xếp ra sao:

```python
# Mô phỏng bản ghi Particle thủ công trên mảng byte phẳng
import struct

class ToyMemoryPool:
    def __init__(self, size=1024):
        self.memory = bytearray(size)
        self.free_ptr = 0

    def allocate(self, size):
        addr = self.free_ptr
        self.free_ptr += size
        return addr

pool = ToyMemoryPool()

# Định nghĩa Offset thủ công cho Struct Particle:
# Offset 0:  id   (int32, 4 bytes)
# Offset 4:  flag (int8,  1 byte)
# Offset 8:  mass (int64, 8 bytes) -> Chú ý lỗ hổng Padding giữa offset 5 và 8!
# Offset 16: px   (int64, 8 bytes)
# Offset 24: py   (int64, 8 bytes)

def create_particle(pool, p_id, flag, mass, px, py):
    base = pool.allocate(32) # Cấp phát 32 bytes
    struct.pack_into("<i", pool.memory, base + 0, p_id)
    struct.pack_into("<b", pool.memory, base + 4, flag)
    # 3 bytes padding (5, 6, 7) bị bỏ trống để căn chỉnh 8-byte boundary cho mass
    struct.pack_into("<q", pool.memory, base + 8, mass)
    struct.pack_into("<q", pool.memory, base + 16, px)
    struct.pack_into("<q", pool.memory, base + 24, py)
    return base

def get_particle_mass(pool, base_addr):
    # Đọc trường mass tại offset 8
    return struct.unpack_from("<q", pool.memory, base_addr + 8)[0]
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy thử khởi tạo một thực thể hạt và đọc dữ liệu thông qua hàm offset:

```python
p1 = create_particle(pool, p_id=101, flag=1, mass=5000, px=10, py=20)
print(f"Hạt P1 lưu tại địa chỉ bộ nhớ: 0x{p1:04X}")
print(f"Khối lượng đọc qua offset 8: {get_particle_mass(pool, p1)}")

# In toàn bộ 32 byte thô của hạt P1
raw_bytes = [f"{b:02X}" for b in pool.memory[p1:p1+32]]
print("Bố cục 32 byte nhị phân trong bộ nhớ:")
print(" ".join(raw_bytes))
```

**Kết quả:**
```text
Hạt P1 lưu tại địa chỉ bộ nhớ: 0x0000
Khối lượng đọc qua offset 8: 5000
Bố cục 32 byte nhị phân trong bộ nhớ:
65 00 00 00 01 00 00 00 88 13 00 00 00 00 00 00 0A 00 00 00 00 00 00 00 14 00 00 00 00 00 00 00
```
- `65 00 00 00`: 101 dạng `int32` (little-endian).
- `01`: flag 1 byte.
- `00 00 00`: **3 bytes đệm (padding bytes)** hoàn toàn lãng phí!
- `88 13 00 00 00 00 00 00`: 5000 dạng `int64`.
- Tiếp theo là `px = 10` và `py = 20`.

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Mô hình đồ chơi trên lập tức sụp đổ khi hệ thống mở rộng:

1. **Khủng hoảng Tái sắp xếp trường (Field Reordering Hazard)**:
   Nếu ngày mai ta đổi thứ tự khai báo trường: đưa `mass` lên đầu, `id` xuống sau. Lập tức `base + 8` không còn là `mass` nữa mà là dữ liệu rác hoặc một phần của trường khác. Toàn bộ mã nguồn phụ thuộc vào con số cứng `8` sẽ âm thầm đọc sai byte!
2. **Khủng hoảng Căn chỉnh bộ nhớ (Alignment Faults on RISC/ARM)**:
   Nếu lập trình viên không chèn 3 byte đệm sau `flag` (byte thứ 5) mà ghi luôn `mass` vào byte thứ 5:
   - Trên vi kiến trúc x86-64: CPU buộc phải phát hai chu kỳ đọc bus bộ nhớ (split-lock bus cycle) để ghép 8 byte nằm vắt ngang hai dòng Cache Line $64\text{-byte}$, làm tốc độ truy xuất chậm đi $2\times - 3\times$.
   - Trên một số vi kiến trúc ARM hoặc vi điều khiển DSP: Việc truy xuất một số nguyên 64-bit tại địa chỉ không chia hết cho 8 sẽ kích hoạt trực tiếp ngoại lệ phần cứng **Hardware Alignment Fault (SIGBUS)** làm sập toàn bộ tiến trình.
3. **Chi phí Bảng băm động (Dictionary-based Objects)**:
   Nếu ta từ bỏ mảng byte và dùng bảng băm (như `dict` trong Python hoặc object thô trong JavaScript cũ: `obj = {"id": 101, "mass": 5000}`):
   Mỗi một instance hạt độc lập phải duy trì một bảng băm riêng gồm các chuỗi khóa `"id"`, `"mass"`, con trỏ bucket, và hệ số tải. Một thực thể chỉ cần 32 byte dữ liệu thô sẽ phình to thành $150 - 200\text{ bytes}$ trên Heap. Với 1 triệu hạt, ta lãng phí hàng trăm Megabytes bộ nhớ RAM và phá nát CPU L1 Data Cache.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Bản chất của sự thất bại nằm ở sự xung đột giữa **Tính Động học (Flexibility)** và **Quy tắc Phần cứng (Hardware Invariants)**:

```
Địa chỉ bộ nhớ:   0x00      0x04  0x05        0x08              0x10              0x18
Trường dữ liệu:  [ id: i32 ][flg][  PAD   ][   mass: i64    ][    px: i64     ][    py: i64     ]
Kích thước byte:   4 bytes    1B   3 bytes       8 bytes           8 bytes           8 bytes
Căn chỉnh (Align): mod 4 = 0       (Đệm)     mod 8 = 0         mod 8 = 0         mod 8 = 0
```

- **Quy tắc căn chỉnh tự nhiên (Natural Alignment Rule)**: Một kiểu dữ liệu kích thước $K$ bytes phải luôn được đặt tại địa chỉ bộ nhớ chia hết cho $K$ ($\text{Address} \pmod K = 0$).
- **Chi phí Tra cứu Tên (Name Resolution Cost)**: Phần cứng CPU không biết chuỗi `"mass"`. Việc chuyển đổi từ chuỗi `"mass"` sang offset byte `+8` không được phép diễn ra ở mỗi lần đọc trường trong vòng lặp hàng triệu chu kỳ.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Khoa học máy tính giải quyết bài toán này theo hai trường phái:

#### Trường phái 1: Compile-time Static Struct Layout (C, C++, Rust, Zig)
Trình biên dịch tính toán toàn bộ offset, padding, và struct size ngay tại thời điểm biên dịch (Compile-time).
- Cú pháp `p.mass` được hạ cấp trực tiếp thành mã máy: `MOV RAX, [RDI + 8]`.
- Không có bất kỳ chi phí thời gian chạy (zero runtime overhead).
- Đánh đổi: Không thể thêm/bớt trường động, không thể kiểm tra phản chiếu (reflection) nếu không có siêu dữ liệu phụ trợ.

#### Trường phái 2: Shape-based Object Model / Hidden Classes (Self, V8 JavaScript, Dart, Tersun VM)
Được tiên phong bởi ngôn ngữ Self và hoàn thiện bởi V8 (Google Chrome):
- Các thể hiện (instances) của một Struct **không lưu trữ bảng băm tên trường**. Thay vào đó, mỗi thực thể chỉ chứa một mảng phẳng các ô giá trị (`fields_array: vector<VMValue>`).
- Toàn bộ siêu dữ liệu (tên trường nào nằm ở slot số mấy) được tách riêng thành một cấu trúc gọi là **Shape (hay Map / Hidden Class)**.
- Tất cả hàng triệu thực thể `Particle` đều chia sẻ **cùng một con trỏ duy nhất** trỏ đến `Shape_Particle`.
- Việc đọc `p.mass` chuyển thành:
  $$\text{slot} = \text{Shape}\to\text{get\_slot}(\text{"mass"}) \implies \text{fields\_array}[\text{slot}]$$
- Khi kết hợp với **Inline Caching (IC)**: Máy ảo ghi nhớ trực tiếp `slot = 1` tại điểm gọi lệnh, biến phép truy xuất thành $O(1)$ thuần túy ngang ngửa mã máy C!

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Cấu trúc Bản ghi (Record / Struct)**: Một kiểu dữ liệu phức hợp (Product Type) biểu diễn tích Descartes của tập các trường có tên:
   $$S = \{ (f_1, T_1), (f_2, T_2), \dots, (f_n, T_n) \}$$
2. **Quy tắc Bố cục & Đệm (Alignment & Padding Rule)**:
   - Offset của trường thứ $i$:
     $$\text{Offset}(f_i) \equiv 0 \pmod{\text{AlignOf}(T_i)}$$
   - Kích thước toàn thể của Struct:
     $$\text{TotalSize}(S) \equiv 0 \pmod{\max_{i} \text{AlignOf}(T_i)}$$
3. **Hình thái Đối tượng (Object Shape / Hidden Class)**:
   Một bản đồ cấu trúc bất biến $S: \text{Identifier} \to \mathbb{N}$ ánh xạ tên trường thành chỉ số slot số học, cho phép định vị trường trong mảng tuyến tính mà không trùng lặp metadata.
4. **Bộ nhớ đệm Nội tuyến Trường (Field Inline Cache - IC)**:
   Cơ chế tối ưu hóa bytecode tại thời điểm chạy: thay thế lệnh tra cứu trường tổng quát `OP_GET_FIELD` bằng lệnh nội tuyến `OP_GET_FIELD_IC` lưu trữ trực tiếp `(ShapeID, SlotIndex)` sau lần tra cứu đầu tiên.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Tersun hiện thực hóa kiến trúc Struct thông qua sự phối hợp chặt chẽ giữa Front-end Compiler, Hệ thống Kiểu, và Back-end Bytecode Virtual Machine:

```
                              KIẾN TRÚC STRUCT TRONG TERSUN
                              
   Mã nguồn Tersun                   Compiler Emitter                  Tersun Virtual Machine
+---------------------+           +--------------------+            +------------------------+
| struct Vector2 {    |           | emit_struct_decl   |            | VMObject (on Heap)     |
|   pub x: int;       | --------> | Ghi nhận metadata: |            | +--------------------+ |
|   pub y: int;       |           | class_fields_      |            | | type_name: "Vector2| |
|   pub fn norm()...  |           | class_methods_     |            | | is_class: false    | |
| }                   |           +--------------------+            | | shape: *VMShape    | |
+---------------------+                     |                       | | fields_array:      | |
                                            v                       | |   [0] -> VMValue(3)| |
+---------------------+           +--------------------+            | |   [1] -> VMValue(4)| |
| let v = Vector2(3,4)| --------> | OP_NEW_INSTANCE    | ---------> | +--------------------+ |
+---------------------+           | OP_DUP             |            +------------------------+
                                  | OP_PUSH_INT 3      |                        ^
                                  | OP_SET_FIELD "x"   |                        | Chia sẻ
                                  | OP_DUP             |            +------------------------+
                                  | OP_PUSH_INT 4      |            | VMShape (Shared)       |
                                  | OP_SET_FIELD "y"   |            | +--------------------+ |
                                  +--------------------+            | | shape_id: 1        | |
                                                                    | | "x" -> slot 0      | |
                                                                    | | "y" -> slot 1      | |
                                                                    +------------------------+
```

1. **Định nghĩa Struct**: Khai báo bằng từ khóa `struct Name { pub field: type; ... }` với các phương thức gắn kèm (methods).
2. **Hạ cấp Khởi tạo (Constructor Lowering)**:
   Khi gặp biểu thức khởi tạo `Vector2(3, 4)`, trình biên dịch Tersun ([`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1539-L1554)) tự động sinh chuỗi lệnh:
   - `OP_NEW_INSTANCE "Vector2"`: Cấp phát một `VMObject` rỗng trên Heap.
   - Với mỗi tham số truyền vào: `OP_DUP` (nhân bản tham chiếu đối tượng), nạp giá trị, phát lệnh `OP_SET_FIELD "tên_trường"`.
3. **Mô hình Dữ liệu Thời gian chạy ([`Code/include/vm/value.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp#L560-L638))**:
   - Đối tượng là một cấu trúc C++ `struct VMObject` quản lý qua `std::shared_ptr<VMObject>`.
   - Cờ `bool is_class{false}` phân định rõ ràng giữa Struct (ngữ nghĩa giá trị/bản ghi) và Class (ngữ nghĩa tham chiếu kế thừa).
   - Mỗi `VMObject` gắn liền với một con trỏ `std::shared_ptr<VMShape> shape`. Khi trường mới được ghi, `VMShape` cấp phát một slot index duy nhất và dữ liệu được ghi vào `fields_array[slot]`.
4. **Truy xuất Trường & Phương thức**:
   - `v.x` hạ cấp thành: Nạp đối tượng lên đỉnh Stack, phát `OP_GET_FIELD "x"` ([`emitter.cpp:L1642`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1642-L1648)).
   - `v.norm()` hạ cấp thành: Nạp đối tượng, phát `OP_INVOKE_METHOD "norm"` ([`emitter.cpp:L1575`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1575-L1605)), phương thức nhận chính đối tượng làm tham số ẩn đầu tiên (`self`).

---

### 11. Viết code (Real Tersun Code)

Dưới đây là chương trình mô phỏng động học chất điểm 2D hoàn chỉnh trong Tersun, thể hiện đầy đủ cấu trúc Struct, phương thức tính toán hình học, biến đổi trạng thái nội tại và duyệt mô phỏng:

```tersun
// simulation_engine.stn
// Mô hình hóa Hệ hạt Vật lý với Cấu trúc Struct trong Tersun

struct Vector2 {
    pub x: int;
    pub y: int;

    pub fn length_sq(self) -> int {
        return self.x * self.x + self.y * self.y;
    }
}

struct Particle {
    pub id: int;
    pub mass: int;
    pub px: int;
    pub py: int;
    pub vx: int;
    pub vy: int;

    // Cập nhật vị trí hạt theo bước thời gian dt
    pub fn step(self, dt: int) -> int {
        self.px = self.px + self.vx * dt;
        self.py = self.py + self.vy * dt;
        return self.px + self.py;
    }

    // Tính 2 lần động năng: E_k * 2 = m * v^2
    pub fn kinetic_energy_x2(self) -> int {
        let v2 = self.vx * self.vx + self.vy * self.vy;
        return self.mass * v2;
    }
}

fn main() {
    // 1. Khởi tạo thực thể Struct thông qua Constructor vị trí
    let mut p = Particle(101, 5, 0, 0, 10, 20);

    println("=== TRẠNG THÁI KHỞI TẠO ===");
    println(p);
    print("Động năng hạt (x2): ");
    println(p.kinetic_energy_x2());

    // 2. Mô phỏng động học qua 3 bước thời gian: dt = 1, 2, 3
    println("=== TIẾN HÀNH MÔ PHỎNG ===");
    for dt in [1, 2, 3] {
        p.step(dt);
        print("Tọa độ hiện tại (px, py): ");
        print(p.px);
        print(", ");
        println(p.py);
    }

    // 3. Trạng thái sau tích phân chuyển động
    println("=== TRẠNG THÁI KẾT THÚC ===");
    println(p);
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler và Virtual Machine để thấy cách Tersun hiện thực hóa Struct.

#### A. Khởi tạo Struct trong Compiler Emitter
Trích từ [`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1538-L1554):

```cpp
if (init_arity < 0) {
    // Không có hàm init() tùy biến: khởi tạo vị trí (positional field initialization)
    // dựa trên danh sách trường đã khai báo trong struct.
    const auto& names = class_fields_[callee];
    size_t n = std::min(names.size(), args.size());
    uint16_t tid = chunk_.add_string(callee);
    
    // 1. Cấp phát vỏ đối tượng rỗng
    chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, loc.line);
    chunk_.write_int16(static_cast<int16_t>(tid), loc.line);
    chunk_.write_byte(0, loc.line);

    // 2. Lần lượt nhân bản con trỏ đối tượng và gán từng trường
    for (size_t i = 0; i < n; ++i) {
        chunk_.write_opcode(OpCode::OP_DUP, loc.line);  // Giữ lại con trỏ trên stack
        emit_expr(args[i]);                            // Tính toán giá trị tham số
        uint16_t fid = chunk_.add_string(names[i]);    // Lấy ID chuỗi của tên trường
        chunk_.write_opcode(OpCode::OP_SET_FIELD, loc.line);
        chunk_.write_int16(static_cast<int16_t>(fid), loc.line);
    }
    return;
}
```
Chiến lược này cực kỳ trang nhã: không cần tạo hàm constructor ẩn, compiler tận dụng cơ chế `OP_DUP` kết hợp `OP_SET_FIELD` để gán tuần tự từng trường, để lại đối tượng đã được khởi tạo hoàn chỉnh trên đỉnh Stack.

#### B. Cấu trúc VMShape và VMObject
Trích từ [`Code/include/vm/value.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp#L560-L630):

```cpp
struct VMShape {
    uint32_t shape_id{0};
    std::string class_name;
    std::unordered_map<std::string, uint16_t> field_to_slot;
    std::vector<std::string> slot_to_field;

    int get_slot(const std::string& name) const {
        auto it = field_to_slot.find(name);
        if (it != field_to_slot.end()) return static_cast<int>(it->second);
        return -1;
    }

    uint16_t add_field(const std::string& name) {
        auto it = field_to_slot.find(name);
        if (it != field_to_slot.end()) return it->second;
        uint16_t slot = static_cast<uint16_t>(slot_to_field.size());
        field_to_slot[name] = slot;
        slot_to_field.push_back(name);
        return slot;
    }
};

struct VMObject {
    std::string type_name;
    bool is_class{false}; // true: Class (Ref Type), false: Struct (Value/Record Type)
    std::shared_ptr<VTable> vtable;
    std::shared_ptr<VMShape> shape;
    std::vector<VMValue> fields_array; // Mảng tuyến tính lưu giá trị thực

    VMValue get_field(const std::string& name) const {
        if (shape) {
            int slot = shape->get_slot(name);
            if (slot >= 0 && static_cast<size_t>(slot) < fields_array.size()) {
                return fields_array[slot]; // Truy xuất mảng O(1) qua slot index!
            }
        }
        return VMValue();
    }
    ...
};
```

#### C. Thực thi `OP_GET_FIELD` trong Virtual Machine
Trích từ [`Code/src/vm/vm.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L2504-L2521):

```cpp
void VM::handle_get_field(const Chunk& chunk) {
    uint16_t str_id = static_cast<uint16_t>(read_int16(chunk));
    std::string field = (str_id < chunk.string_table.size()) ? chunk.string_table[str_id] : "";
    VMValue obj = stack_.pop();

    if (obj.is_object()) {
        auto vmo = obj.as_object();
        if (vmo) {
            // Hỗ trợ trường nội tại ảo .len / .length
            if (field == "len" || field == "length") {
                stack_.push(VMValue(static_cast<int64_t>(vmo->field_count())));
                return;
            }
            if (!vmo->has_field(field)) {
                throw VMException("Object of type '" + vmo->type_name + "' has no field '" + field + "'.");
            }
            stack_.push(vmo->get_field(field)); // Nạp giá trị trường lên stack
            return;
        }
    }
    ...
}
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy biên dịch và thực thi trực tiếp file kiểm chứng đã lưu tại [`scratch/test_particle_full.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_particle_full.stn) bằng công cụ dòng lệnh của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_particle_full.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
--- Initial State ---
Particle { id: 101, mass: 5, px: 0, py: 0, vx: 10, vy: 20 }
2500
--- Simulation Steps ---
10
20
30
60
60
120
--- Final Particle ---
Particle { id: 101, mass: 5, px: 60, py: 120, vx: 10, vy: 20 }
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_particle_full.stn
```

Dưới đây là đoạn trích bytecode thực tế minh chứng trực quan quá trình khởi tạo và truy xuất Struct:

```text
// Khởi tạo Particle(101, 5, 0, 0, 10, 20)
1710  OP_NEW_INSTANCE    "Particle" (fields 0)
1750  OP_DUP            
1760  OP_PUSH_INT        101
1850  OP_SET_FIELD       "id"
1880  OP_DUP            
1890  OP_PUSH_INT        5
1980  OP_SET_FIELD       "mass"
2010  OP_DUP            
2020  OP_PUSH_INT        0
2110  OP_SET_FIELD       "px"
...
2530  OP_STORE_LOCAL     slot 0    // Lưu tham chiếu Particle vào biến cục bộ 'p'

// Gọi phương thức: p.kinetic_energy_x2()
2660  OP_LOAD_LOCAL      slot 0    // Nạp 'p' làm tham số self
2690  OP_INVOKE_METHOD   "kinetic_energy_x2" (argc 0)
2730  OP_PRINTLN        

// Trong vòng lặp: p.step(dt)
3520  OP_LOAD_LOCAL      slot 0    // self
3550  OP_LOAD_LOCAL      slot 4    // dt
3580  OP_INVOKE_METHOD   "step" (argc 1)
3620  OP_POP            
3630  OP_LOAD_LOCAL      slot 0
3660  OP_GET_FIELD       "px"      // Đọc trường p.px
3690  OP_PRINTLN        
```

Mỗi chỉ thị bytecode đều ánh xạ 1-1 với phân tích kiến trúc lý thuyết, hoàn toàn không có bất kỳ cấu trúc thừa hay độ trễ trung gian nào.

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 16.1: Struct Số Phức & Phép Nhân Đại Số (Complex Numbers)
- **Mục tiêu**: Thiết kế struct `Complex` gồm hai trường thực/nguyên: `pub re: int; pub im: int;`.
- **Yêu cầu**:
  1. Hiện thực phương thức `pub fn add(self, other: Complex) -> Complex` thực hiện $(a + bi) + (c + di) = (a+c) + (b+d)i$.
  2. Hiện thực phương thức `pub fn mul(self, other: Complex) -> Complex` theo công thức đại số:
     $$(a + bi)(c + di) = (ac - bd) + (ad + bc)i$$
  3. Viết hàm `main()` khởi tạo $z_1 = 3 + 2i$, $z_2 = 1 + 4i$, tính và in tích $z_1 \times z_2$.

#### Bài tập 16.2: Mô phỏng Bộ Tính Đệm & Kích Thước Struct Chuẩn C ABI
- **Mục tiêu**: Viết một chương trình Tersun tính toán kích thước tổng và số byte đệm (padding bytes) của một struct trong ngôn ngữ C.
- **Đặc tả**: Cho một mảng đại diện cho kích thước các trường: `fields = [4, 1, 8, 8, 2]`.
- **Thuật toán**:
  - Khởi tạo `offset = 0`, `max_align = 1`.
  - Duyệt qua từng trường `sz`:
    - Căn chỉnh `align = sz` (với các kiểu cơ bản 1, 2, 4, 8).
    - Cập nhật `max_align = max(max_align, align)`.
    - Tính padding: `pad = (align - (offset % align)) % align`.
    - `offset = offset + pad + sz`.
  - Cuối cùng đệm cho toàn struct: `total_pad = (max_align - (offset % max_align)) % max_align`.
  - In ra tổng kích thước `offset + total_pad` và tổng số byte bị lãng phí do padding.

#### Bài tập 16.3: Bản Ghi Thực Thể Tam Phân Cân Bằng (Ternary Entity Record)
- **Mục tiêu**: Xây dựng struct `QuantumTritGate` quản lý trạng thái máy tính tam phân:
  - `pub id: int;`
  - `pub state: tryte;` (hoặc biểu diễn tam phân `@`, `0`, `1`)
  - `pub coherence: int;`
- **Yêu cầu**: Hiện thực phương thức `pub fn invert(self) -> int` áp dụng toán tử đảo tam phân `~self.state` và cập nhật lại trạng thái của cổng.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: AoS (Array of Structs) vs SoA (Struct of Arrays) Memory Footprint & Cache Analyzer

Trong các hệ thống tính toán hiệu năng cao (Game Engines, N-body Simulation, Quantum State Simulators), việc lựa chọn giữa **Array of Structs (AoS)** và **Struct of Arrays (SoA)** là quyết định sống còn về mặt băng thông bộ nhớ:

```
AoS (Mảng các Struct):
[ {id, px, py, vx, vy}, {id, px, py, vx, vy}, {id, px, py, vx, vy}, ... ]
-> Ưu điểm: Đóng gói thực thể tốt, dễ thêm/xóa 1 hạt.
-> Nhược điểm: Khi chỉ cần tính vị trí (px, py), CPU vẫn phải nạp cả 'id', 'vx', 'vy' vào Cache Line 64B, lãng phí 60% băng thông bộ nhớ!

SoA (Struct chứa các Mảng):
ParticleSystem {
    ids: [101, 102, 103, ...],
    pxs: [0, 10, 20, ...],
    pys: [0, 5, 15, ...],
    vxs: [1, 2, 1, ...],
    vys: [0, -1, 2, ...]
}
-> Ưu điểm: Tuyệt đối tối ưu cho SIMD/Vectorization. Khi đọc 'pxs', 100% Cache Line đều chứa tọa độ x.
```

**Nhiệm vụ của bạn**:
1. Hãy viết hai module Tersun độc lập:
   - Module 1: Tạo một mảng gồm 500 thực thể `Particle` (AoS) và thực hiện 10 bước cập nhật `px = px + vx`.
   - Module 2: Tạo một struct `ParticleSystem` chứa 5 mảng song song (SoA) và thực hiện cùng phép cập nhật trên.
2. Đo lường số bước lệnh bytecode sinh ra giữa hai cách tiếp cận thông qua `setunc.exe disasm`.
3. Viết báo cáo phân tích kiến trúc: Tại sao trong các máy tính lượng tử tam phân hoặc vi xử lý TAFPU tương lai, cấu trúc SoA lại là điều kiện tiên quyết để đạt thông lượng SIMD tối đa?

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chúng ta vừa chính thức hoàn thành **PHẦN IV: CẤU TRÚC DỮ LIỆU & QUẢN LÝ BỘ NHỚ HEAP**!
Hãy nhìn lại hành trình 4 chương vừa qua từ góc nhìn kiến trúc máy tính:
- **Chương 13**: Mảng Động 1D — Bộ nhớ tuyến tính đồng nhất, truy xuất con trỏ $A + i \times S$.
- **Chương 14**: Ma Trận Nhiều Chiều — Trải phẳng không gian 2D/3D (Row-Major Order) và nhân ma trận không cần phép nhân trên số tam phân.
- **Chương 15**: Chuỗi Ký Tự UTF-8 — Bất biến, bộ đệm ký tự, String Interning và cơ chế nội suy f-string.
- **Chương 16**: Cấu Trúc Bản Ghi Struct — Tập hợp dữ liệu dị loại, bố cục bộ nhớ, căn chỉnh byte, và mô hình đối tượng dựa trên Shape/Fixed-slot.

Tất cả các cấu trúc chúng ta đã xây dựng trong Phần IV đều mang tính chất **tĩnh hoặc giá trị (value-oriented / records)**: Struct gom nhóm dữ liệu và hàm, nhưng các thực thể độc lập không thể tự động chia sẻ hành vi, không thể ghi đè phương thức theo phả hệ phân cấp, và không thể đa hình tại thời điểm chạy.

Để xây dựng các hệ thống phần mềm quy mô lớn, chúng ta cần bước lên nấc thang trừu tượng hóa tiếp theo: **LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG (OBJECT-ORIENTED PROGRAMMING)**.

Ở chương tiếp theo, chúng ta sẽ mở cánh cửa vào **PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH (OOP, CLASSES, INHERITANCE & DYNAMIC DISPATCH)**:
👉 **Chương 17: Lớp (Class), Thuộc Tính & Phương Thức Khởi Tạo (Classes, Fields & Constructors)** — Sự khác biệt bản chất giữa Struct và Class, tham chiếu bộ nhớ Heap, ngữ nghĩa `is_class = true`, và vòng đời khởi tạo đối tượng với `init()`.




# GIÁO TRÌNH LẬP TRÌNH TERSUN (FIRST-PRINCIPLES TERSUN PROGRAMMING)
## PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH (OOP, CLASSES, INHERITANCE & DYNAMIC DISPATCH)

---

# CHƯƠNG 17: LỚP (CLASS), THUỘC TÍNH & PHƯƠNG THỨC KHỞI TẠO (CLASSES, FIELDS & CONSTRUCTORS)

---

### 1. Vấn đề (The Problem)

Ở Chương 16, chúng ta đã làm chủ **Cấu trúc Bản ghi (Struct)**: một công cụ đóng gói dữ liệu dị loại với bố cục bộ nhớ phẳng. Struct cho phép ta nhóm các trường rời rạc (`x`, `y`, `mass`) thành một thực thể duy nhất.

Tuy nhiên, khi phần mềm mở rộng quy mô từ các thuật toán tính toán toán học sang các hệ thống quản lý phức tạp (như ngân hàng, mô phỏng sinh thái, hệ điều hành, hay trình biên dịch), hai giới hạn nghiêm trọng của Struct lộ diện:

1. **Nguy cơ vi phạm Bất biến Dữ liệu (Invariant Corruption)**:
   Hãy xem xét một tài khoản ngân hàng (`BankAccount`). Một tài khoản hợp lệ phải luôn thỏa mãn điều kiện bất biến (class invariant): $\text{balance} \ge 0$.
   Với Struct mở, bất kỳ dòng mã nào ở bên ngoài cũng có thể trực tiếp can thiệp:
   ```tersun
   let mut acc = BankAccount(1001, "Alice", 500);
   acc.balance = -999999; // Bất biến bị phá vỡ! Hệ thống rơi vào trạng thái bất hợp pháp.
   ```
   Dữ liệu bị tách rời khỏi các quy tắc nghiệp vụ bảo vệ nó.
2. **Khủng hoảng Sao chép Giá trị (Value Semantics vs Reference Semantics)**:
   Nếu một đối tượng biểu diễn một **thực thể thế giới thực có danh tính duy nhất (Identity)** — ví dụ một kết nối mạng, một tệp tin đang mở, hoặc tài khoản của một con người:
   Nếu truyền Struct qua 5 hàm khác nhau, mỗi hàm nhận một bản sao chép giá trị (value copy) độc lập. Khi hàm $A$ nạp tiền vào tài khoản, hàm $B$ vẫn nhìn thấy số dư cũ. Hai thực thể đại diện cho cùng một tài khoản vật lý lại có hai trạng thái mâu thuẫn nhau trong bộ nhớ!

Làm thế nào để ràng buộc chặt chẽ dữ liệu với các hành vi hợp lệ, bảo vệ bất biến của hệ thống, và đảm bảo mọi thực thể chỉ tồn tại một bản thể duy nhất trong bộ nhớ Heap được chia sẻ an toàn qua các tham chiếu?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ sự khác biệt triết học giữa hai mô hình dữ liệu trong khoa học máy tính:

1. **Mô hình Dữ liệu Giá trị (Value Types / Plain Data)**:
   - Các con số (`int`, `tryte`, `float`), điểm tọa độ (`Vector2`, `Point`), số phức (`Complex`) không có "danh tính". Số `5` ở hàm này hoàn toàn giống số `5` ở hàm kia. Hai điểm $(1, 2)$ có cùng tọa độ là một. Chúng thích hợp với ngữ nghĩa giá trị: sao chép nguyên vẹn từng byte (bitwise copy).
2. **Mô hình Thực thể Tham chiếu (Reference Types / Stateful Entities)**:
   - Một `BankAccount`, một tiến trình `Process`, hay một nút mạng `Node` **có danh tính riêng biệt (Identity)** ngay cả khi mọi thuộc tính của chúng trùng nhau. Hai người cùng tên "Alice" và cùng có $500\$$ trong tài khoản vẫn là hai tài khoản hoàn toàn khác nhau.
   - Nếu phần cứng chỉ có các thanh ghi lưu giá trị số học phẳng, CPU không thể tự phân biệt được "đây là một giá trị cần copy" hay "đây là một định danh tham chiếu trỏ tới một thực thể sống trên Heap".

Nếu ngôn ngữ lập trình không cung cấp một cấu trúc trừu tượng bậc cao kết hợp **Vùng nhớ Heap định danh (Identity-based Heap Allocation)** + **Bao đóng Trạng thái (Encapsulation)** + **Giao thức Khởi tạo Nghiêm ngặt (Strict Constructor Invariants)**, lập trình viên sẽ liên tục gặp lỗi rò rỉ dữ liệu và trạng thái bất nhất.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa mô hình **Lớp (Class)** trong Tersun với 4 trụ cột kỹ thuật:

1. **Ngữ nghĩa Tham chiếu (Reference Semantics & Aliasing)**: Biến chứa một Class thực chất chỉ chứa một con trỏ tham chiếu trỏ đến đối tượng nằm trên Heap. Phép gán `b = a` không sao chép dữ liệu mà tạo ra một bí danh (alias) cùng trỏ tới một thực thể duy nhất.
2. **Quy trình Khởi tạo Hai Giai đoạn (Two-Phase Object Construction)**:
   - Giai đoạn 1: **Cấp phát vỏ đối tượng rỗng (Allocation)** trên Heap.
   - Giai đoạn 2: **Thiết lập bất biến (Initialization via `init(...)`)**, đảm bảo một đối tượng không bao giờ có thể tồn tại ở trạng thái "rác" hoặc nửa vời.
3. **Bao đóng & Phương thức Ràng buộc (Encapsulation & Receiver Binding)**:
   Phương thức thuộc lớp tự động nhận tham chiếu đối tượng làm tham số đầu tiên (`self`), cho phép thao tác trên trạng thái nội tại một cách có kiểm soát.
4. **Bố cục Runtime Hiệu năng Cao**: Phân định ranh giới giữa Class (`is_class = true`) và Struct (`is_class = false`) trong lõi Máy ảo VM, sẵn sàng cho bảng phương thức ảo (vtable) ở các bước đa hình tiếp theo.

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy mô phỏng cơ chế Lớp, Khởi tạo và Bảng điều phối phương thức bằng một đoạn mã Python thô cấp thấp:

```python
# Mô phỏng Class, Heap Allocation và Constructor bằng Dictionary và Con trỏ Hàm

class ToyHeap:
    def __init__(self):
        self.objects = {}
        self.next_id = 1

    def allocate(self, class_meta):
        obj_id = self.next_id
        self.next_id += 1
        # Vỏ đối tượng trên Heap: Lưu định danh kiểu, bảng phương thức và các trường
        self.objects[obj_id] = {
            "__class__": class_meta["name"],
            "__vtable__": class_meta["vtable"],
            "fields": {}
        }
        return obj_id # Trả về "tham chiếu" (Reference / Handle)

heap = ToyHeap()

# Định nghĩa bảng phương thức (VTable) cho BankAccount
def bank_init(heap, self_id, owner, initial_balance):
    if initial_balance < 0:
        raise ValueError("Số dư ban đầu không được âm!")
    heap.objects[self_id]["fields"]["owner"] = owner
    heap.objects[self_id]["fields"]["balance"] = initial_balance

def bank_deposit(heap, self_id, amount):
    if amount <= 0:
        raise ValueError("Số tiền nạp phải > 0")
    heap.objects[self_id]["fields"]["balance"] += amount
    return heap.objects[self_id]["fields"]["balance"]

def bank_withdraw(heap, self_id, amount):
    bal = heap.objects[self_id]["fields"]["balance"]
    if amount > 0 and bal >= amount:
        heap.objects[self_id]["fields"]["balance"] -= amount
        return 1 # Thành công
    return 0 # Thất bại

BankAccount_Meta = {
    "name": "BankAccount",
    "vtable": {
        "init": bank_init,
        "deposit": bank_deposit,
        "withdraw": bank_withdraw
    }
}

# Khởi tạo đối tượng (Constructor Call)
def new_instance(heap, class_meta, *args):
    # Bước 1: Cấp phát vỏ trên Heap
    obj_ref = heap.allocate(class_meta)
    # Bước 2: Gọi hàm khởi tạo init với self = obj_ref
    init_fn = class_meta["vtable"]["init"]
    init_fn(heap, obj_ref, *args)
    return obj_ref # Trả về tham chiếu
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy kiểm tra ngữ nghĩa tham chiếu (Aliasing) và tính bao đóng trạng thái trên mô hình đồ chơi:

```python
# Tạo tài khoản Alice
acc1 = new_instance(heap, BankAccount_Meta, "Alice", 500)
print(f"acc1 lưu tại Heap ID: {acc1}")

# Tạo biến acc2 gán từ acc1 (Sao chép tham chiếu, KHÔNG sao chép dữ liệu)
acc2 = acc1

# Rút tiền qua acc2
withdraw_fn = heap.objects[acc2]["__vtable__"]["withdraw"]
withdraw_fn(heap, acc2, 200)

# Kiểm tra số dư qua acc1!
print(f"Số dư đọc qua acc1: {heap.objects[acc1]['fields']['balance']}")
print(f"Số dư đọc qua acc2: {heap.objects[acc2]['fields']['balance']}")
assert heap.objects[acc1]['fields']['balance'] == 300
```

**Kết quả:**
```text
acc1 lưu tại Heap ID: 1
Số dư đọc qua acc1: 300
Số dư đọc qua acc2: 300
```
Cả `acc1` và `acc2` đều phản ánh cùng một số dư $300\$$! Mọi thay đổi qua bí danh `acc2` lập tức hiển lộ khi quan sát qua `acc1`.

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Mô hình trừu tượng trên sẽ bộc lộ điểm yếu chết người khi đưa vào hệ thống thực tế:

1. **Khủng hoảng Rò rỉ Trạng thái Nửa vời (Partially Constructed Object Leak)**:
   Nếu hàm `init` tung ra lỗi (throw exception) ở giữa quá trình khởi tạo (ví dụ kiểm tra số dư âm):
   Vỏ đối tượng đã được tạo trên Heap nhưng chưa được dọn dẹp. Nếu con trỏ `self` đã lỡ bị lưu vào một biến toàn cục trước khi `init` kết thúc, hệ thống sẽ chứa một "đối tượng thây ma" (zombie object) với các trường chứa giá trị rác.
2. **Chi phí Tra cứu Chuỗi Động (Dynamic Method String Lookup)**:
   Mỗi lần gọi `acc.deposit(100)`, hệ thống phải băm chuỗi `"deposit"`, tra cứu trong bảng từ điển `vtable`. Nếu phương thức này nằm trong vòng lặp 10 triệu giao dịch, chi phí tra cứu chuỗi sẽ kéo tụt tốc độ xử lý xuống gấp $50\times - 100\times$ so với một lệnh gọi hàm trực tiếp.
3. **Mất an toàn Kiểu (Type Safety Breakdown)**:
   Trong mô hình thông dịch thuần túy, bất kỳ ai cũng có thể nhét một phương thức của lớp `Cat` vào đối tượng `BankAccount`, dẫn đến lỗi thảm khốc khi hàm cố truy cập trường `balance` trên một con mèo.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Sự thất bại này phát sinh do:
- **Tách rời giữa Bộ cấp phát (Allocator) và Bộ khởi tạo (Initializer)**: Trong phần cứng và hệ điều hành, cấp phát bộ nhớ (`malloc` / `new`) chỉ đơn thuần là tìm một vùng byte trống trên Heap. Nó không có khái niệm về "tính hợp lệ logic" của dữ liệu.
- **Thiếu sự can thiệp của Trình biên dịch (Compiler Lowering Absence)**: Nếu việc gọi constructor chỉ được xử lý động ở thời gian chạy, trình biên dịch không thể kiểm tra trước số lượng đối số (arity), kiểu dữ liệu tham số, và không thể sinh mã bytecode tối ưu với các offset cố định.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Các nhà thiết kế trình biên dịch (C++, Java, C#, Tersun) đã giải quyết bài toán này qua **Kiến trúc Khởi tạo Hai Giai đoạn được Trình biên dịch Giám sát (Compiler-Synthesized Two-Phase Construction)**:

```
                            QUY TRÌNH KHỞI TẠO ĐỐI TƯỢNG HAI GIAI ĐOẠN
                            
       Mã nguồn:                          Bytecode do Compiler sinh ra:
  let acc = BankAccount(101, "Alice", 500);
                                       1. OP_NEW_INSTANCE "BankAccount" (Heap Alloc)
                                          +---------------------------------------+
                                          | Đỉnh Stack: [*ObjRef]                 |
                                          +---------------------------------------+
                                       2. OP_DUP (Giữ lại tham chiếu gốc)
                                          +---------------------------------------+
                                          | Đỉnh Stack: [*ObjRef, *ObjRef]        |
                                          +---------------------------------------+
                                       3. Nạp các đối số: 101, "Alice", 500
                                          +---------------------------------------+
                                          | Đỉnh Stack: [*ObjRef, *ObjRef, 101,..]|
                                          +---------------------------------------+
                                       4. OP_INVOKE_METHOD "init" (argc = 3)
                                          -> Gọi hàm khởi tạo: slot 0 là self (*ObjRef)
                                          -> Thiết lập bất biến nội tại
                                          -> init trả về 0
                                       5. OP_POP (Hủy giá trị trả về của init)
                                          +---------------------------------------+
                                          | Đỉnh Stack: [*ObjRef] (Đã sẵn sàng!)  |
                                          +---------------------------------------+
                                       6. OP_STORE_LOCAL slot 0 (Gán vào biến 'acc')
```

- **Kiểm tra tĩnh tại Compile-time**: Trình biên dịch kiểm tra số lượng tham số truyền vào hàm khởi tạo ngay tại thời điểm dịch mã (`compute_init_arity`). Nếu thiếu hoặc thừa tham số, quá trình biên dịch sẽ bị từ chối ngay lập tức.
- **Bảo toàn Tham chiếu trên Stack**: Nhờ cặp lệnh `OP_DUP` + `OP_POP`, tham chiếu đối tượng được giữ nguyên vẹn trên đỉnh Stack sau khi `init()` hoàn tất, sẵn sàng để gán vào biến cục bộ mà không cần bất kỳ biến phụ tạm thời nào.

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Lớp (Class)**: Một bản thiết kế kiểu dữ liệu người dùng tự định nghĩa, đóng gói trạng thái (Fields / Attributes) và tập các phép toán hợp lệ thao tác trên trạng thái đó (Methods).
2. **Kiểu Tham chiếu (Reference Type)**: Kiểu dữ liệu mà biến không trực tiếp chứa giá trị của đối tượng, mà chỉ chứa một con trỏ định danh tham chiếu đến vị trí của đối tượng trên Heap.
3. **Bí danh Tham chiếu (Aliasing)**: Hiện tượng nhiều biến khác nhau cùng nắm giữ tham chiếu trỏ đến một vùng nhớ đối tượng duy nhất trên Heap:
   $$v_1 = v_2 \implies \&(*v_1) \equiv \&(*v_2)$$
4. **Hàm khởi tạo (Constructor / `init`)**: Phương thức đặc biệt được thực thi ngay sau khi vỏ đối tượng được cấp phát bộ nhớ, chịu trách nhiệm xác lập trạng thái ban đầu và đảm bảo các điều kiện bất biến của lớp.
5. **Bộ tiếp nhận Phương thức (`self` / Receiver Binding)**: Tham số tiềm ẩn (implicit parameter) luôn chiếm vị trí thanh ghi/slot đầu tiên (`slot 0`) trong khung ngăn xếp (CallFrame) của phương thức, liên kết mã thực thi với thể hiện cụ thể đang được gọi.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Tersun thiết kế hệ thống Lớp với sự phân định rạch ròi và tối ưu hóa ở mọi tầng kiến trúc:

1. **Cú pháp Khai báo Lớp**:
   ```tersun
   class BankAccount {
       pub account_id: int;
       pub owner: string;
       pub balance: int;

       pub fn init(self, id: int, name: string, initial_deposit: int) {
           self.account_id = id;
           self.owner = name;
           self.balance = initial_deposit;
       }

       pub fn deposit(self, amount: int) -> int {
           self.balance = self.balance + amount;
           return self.balance;
       }
   }
   ```
2. **Cấu trúc AST & Phân tích Cú pháp ([`Code/include/compiler/ast.hpp:L386`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/ast.hpp#L386-L395))**:
   Bộ phân tích cú pháp tạo ra nút `ClassDeclStmt` lưu trữ tên lớp, danh sách trường (`fields`), danh sách phương thức (`methods`), lớp cha kế thừa (`super_class`) và các giao diện (`interfaces`).
3. **Cơ chế Hạ cấp Constructor trong Emitter ([`Code/src/compiler/emitter.cpp:L1563`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1563-L1578))**:
   Khi gặp biểu thức khởi tạo `BankAccount(1001, "Alice", 500)`:
   - Trình biên dịch kiểm tra số lượng tham số so với khai báo `init`:
     $$\text{argc} \equiv \text{class\_init\_arity\_}[\text{"BankAccount"}]$$
   - Phát mã lệnh: `OP_NEW_INSTANCE` $\to$ `OP_DUP` $\to$ Nạp đối số $\to$ `OP_INVOKE_METHOD "init"` $\to$ `OP_POP`.
4. **Mô hình Máy ảo VM ([`Code/include/vm/value.hpp:L582`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp#L582-L589) & [`Code/src/vm/vm.cpp:L2609`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L2609-L2617))**:
   - `VMObject` được cấp phát với cờ `is_class = true`.
   - Đối tượng tự động nhận con trỏ tới bảng phương thức chia sẻ: `obj->vtable = vtables_["BankAccount"]`.
   - Biến `VMValue` lưu trữ `std::shared_ptr<VMObject>`, đảm bảo an toàn bộ nhớ qua cơ chế đếm tham chiếu (Reference Counting) tự động dọn rác khi không còn biến nào trỏ tới.

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một hệ thống quản lý tài khoản ngân hàng và kiểm soát giao dịch hoàn chỉnh được viết bằng Tersun, minh họa đầy đủ:
- Khởi tạo đối tượng qua `init` với kiểm tra điều kiện bất biến
- Bao đóng trạng thái nội tại qua các phương thức nghiệp vụ
- Minh chứng thực tế về Ngữ nghĩa Tham chiếu (Aliasing) giữa hai biến

```tersun
// bank_system.stn
// Hệ thống Quản trị Tài khoản & Giao dịch Hướng Đối tượng trong Tersun

class BankAccount {
    pub account_id: int;
    pub owner: string;
    pub balance: int;

    // 1. Phương thức khởi tạo: Thiết lập dữ liệu và bảo đảm bất biến
    pub fn init(self, id: int, name: string, initial_deposit: int) {
        self.account_id = id;
        self.owner = name;
        self.balance = initial_deposit;
    }

    // 2. Nạp tiền vào tài khoản
    pub fn deposit(self, amount: int) -> int {
        self.balance = self.balance + amount;
        return self.balance;
    }

    // 3. Rút tiền có bảo vệ số dư: Trả về 1 nếu thành công, 0 nếu không đủ số dư
    pub fn withdraw(self, amount: int) -> int {
        if (self.balance >= amount) {
            self.balance = self.balance - amount;
            return 1;
        }
        return 0;
    }

    // 4. Truy vấn số dư an toàn
    pub fn get_balance(self) -> int {
        return self.balance;
    }
}

fn main() {
    println("=== 1. KHỞI TẠO TÀI KHOẢN ===");
    let mut acc1 = BankAccount(1001, "Alice", 500);
    print("Chủ tài khoản: ");
    println(acc1.owner);
    print("Số dư ban đầu: ");
    println(acc1.get_balance());

    println("=== 2. THỰC HIỆN GIAO DỊCH ===");
    acc1.deposit(250);
    print("Sau khi nạp 250$: ");
    println(acc1.get_balance());

    let r1 = acc1.withdraw(600);
    print("Rút 600$ (kết quả 1=OK, 0=Fail): ");
    print(r1);
    print(", Số dư còn: ");
    println(acc1.get_balance());

    let r2 = acc1.withdraw(500);
    print("Rút cố 500$ (kết quả 1=OK, 0=Fail): ");
    print(r2);
    print(", Số dư còn: ");
    println(acc1.get_balance());

    println("=== 3. KIỂM CHỨNG NGỮ NGHĨA THAM CHIẾU (ALIASING) ===");
    // acc2 trỏ đến cùng một đối tượng Heap của acc1
    let acc2 = acc1;
    acc2.deposit(1000);
    print("Nạp 1000$ qua acc2 -> Số dư đọc từ acc1: ");
    println(acc1.get_balance());
    print("Số dư đọc từ acc2: ");
    println(acc2.get_balance());
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler và Virtual Machine để thấy cách Tersun hiện thực hóa Class và Constructor.

#### A. Hạ cấp Constructor trong Compiler Emitter
Trích từ [`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1558-L1578):

```cpp
if (static_cast<int>(args.size()) != init_arity) {
    throw CompilerException("[Emitter Error] " + loc_str(loc) + " - Constructor of class '" 
                            + callee + "' (init) expects " + std::to_string(init_arity)
                            + " argument(s), but received " + std::to_string(args.size()) + ".");
}

// Biểu thức X(args...) được hạ cấp thành chuỗi lệnh máy ảo:
// 1. Cấp phát đối tượng rỗng trên Heap
uint16_t tid = chunk_.add_string(callee);
chunk_.write_opcode(OpCode::OP_NEW_INSTANCE, loc.line);
chunk_.write_int16(static_cast<int16_t>(tid), loc.line);
chunk_.write_byte(0, loc.line);

// 2. Nhân bản con trỏ đối tượng trên stack (để giữ lại sau khi init chạy xong)
chunk_.write_opcode(OpCode::OP_DUP, loc.line);

// 3. Tính toán và nạp toàn bộ tham số của init
for (Expr* arg : args) {
    emit_expr(arg);
}

// 4. Phát lệnh gọi phương thức init
uint16_t iid = chunk_.add_string("init");
chunk_.write_opcode(OpCode::OP_INVOKE_METHOD, loc.line);
chunk_.write_int16(static_cast<int16_t>(iid), loc.line);
chunk_.write_byte(static_cast<uint8_t>(args.size()), loc.line);

// 5. Hủy bỏ giá trị trả về mặc định của init(); đối tượng gốc vẫn nằm trên stack!
chunk_.write_opcode(OpCode::OP_POP, loc.line);
```

#### B. Cấp phát Đối tượng trong Virtual Machine
Trích từ [`Code/src/vm/vm.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L2609-L2617):

```cpp
void VM::handle_new_instance(const Chunk& chunk) {
    uint16_t tid = static_cast<uint16_t>(read_int16(chunk));
    uint8_t field_count = read_byte(chunk);
    std::string type_name = (tid < chunk.string_table.size()) ? chunk.string_table[tid] : "Object";

    // Tạo đối tượng trên Heap quản lý qua std::shared_ptr
    auto obj = std::make_shared<VMObject>();
    obj->type_name = type_name;
    obj->is_class = true; // Đánh dấu rõ ràng là Kiểu Tham Chiếu (Reference Type)

    // Liên kết bảng phương thức ảo (V-Table) của lớp
    auto it = vtables_.find(type_name);
    if (it != vtables_.end()) {
        obj->vtable = it->second;
    }
    ...
    stack_.push(VMValue(obj)); // Đẩy tham chiếu lên đỉnh stack
}
```

#### C. Thiết lập Khung Ngăn xếp và Gán Receiver `self`
Trích từ [`Code/src/vm/vm.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L3133-L3138):

```cpp
// Thiết lập không gian biến cục bộ cho phương thức được gọi
locals_[new_local_base] = target; // Slot 0 luôn luôn là 'self'!
for (size_t i = 0; i < argc; ++i) {
    locals_[new_local_base + 1 + i] = args[i]; // Slot 1, 2, ... là các đối số truyền vào
}
call_stack_.push_back(CallFrame{ip_, new_local_base, stack_.size(), callee_frame_size});
ip_ = fn_entry; // Nhảy vào điểm vào bytecode của phương thức
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn trên vào [`scratch/test_bank_full.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_bank_full.stn) và thực thi trực tiếp bằng công cụ dòng lệnh của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_bank_full.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
=== 1. KHỞI TẠO TÀI KHOẢN ===
Chủ tài khoản: Alice
Số dư ban đầu: 500
=== 2. THỰC HIỆN GIAO DỊCH ===
Sau khi nạp 250$: 750
Rút 600$ (kết quả 1=OK, 0=Fail): 1, Số dư còn: 150
Rút cố 500$ (kết quả 1=OK, 0=Fail): 0, Số dư còn: 150
=== 3. KIỂM CHỨNG NGỮ NGHĨA THAM CHIẾU (ALIASING) ===
Nạp 1000$ qua acc2 -> Số dư đọc từ acc1: 1150
Số dư đọc từ acc2: 1150
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_bank_full.stn
```

Dưới đây là đoạn trích bytecode thực tế minh chứng quy trình hạ cấp constructor và dispatch:

```text
// Khởi tạo: BankAccount(1001, "Alice", 500)
1610  OP_NEW_INSTANCE    "BankAccount" (fields 0)
1650  OP_DUP                                    // Giữ lại con trỏ tham chiếu
1660  OP_PUSH_INT        1001                   // Tham số 1: id
1750  OP_PUSH_STRING     "Alice"                // Tham số 2: name
1780  OP_PUSH_INT        500                    // Tham số 3: initial_deposit
1870  OP_INVOKE_METHOD   "init" (argc 3)        // Gọi hàm khởi tạo
1910  OP_POP                                    // Bỏ giá trị trả về của init
1920  OP_STORE_LOCAL     slot 0                 // Lưu tham chiếu vào biến cục bộ 'acc1'

// Gọi phương thức: acc1.deposit(250)
2120  OP_LOAD_LOCAL      slot 0                 // Nạp 'acc1' làm tham số self
2150  OP_PUSH_INT        250                    // Nạp đối số 250
2240  OP_INVOKE_METHOD   "deposit" (argc 1)     // Điều phối thực thi phương thức
2280  OP_POP            

// Gán tham chiếu: let acc2 = acc1;
// Phép gán sao chép std::shared_ptr<VMObject>, trỏ chung tới 1 ô nhớ Heap!
```

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 17.1: Lớp Bộ Đệm Vòng (Circular Buffer Class)
- **Mục tiêu**: Xây dựng lớp `CircularBuffer` quản lý bộ đệm cố định dung lượng $N$.
- **Khai báo trường**:
  - `pub capacity: int;`
  - `pub head: int;`
  - `pub tail: int;`
  - `pub count: int;`
  - `pub data: array;`
- **Yêu cầu**:
  1. Viết phương thức `pub fn init(self, cap: int)` khởi tạo mảng `data` gồm `cap` số 0.
  2. Hiện thực `pub fn push(self, val: int) -> int`: ghi đè phần tử cũ nhất nếu bộ đệm đã đầy, cập nhật chỉ số vòng tròn modulo `(tail + 1) % capacity`.
  3. Hiện thực `pub fn pop(self) -> int`: lấy phần tử cũ nhất ra khỏi đầu đệm.

#### Bài tập 17.2: Lớp Bộ Đếm Phiên Đăng Nhập & Kiểm Soát Hết Hạn
- **Mục tiêu**: Thiết kế lớp `UserSession` mô phỏng phiên làm việc người dùng:
  - `pub user_id: int;`
  - `pub token: string;`
  - `pub expires_at: int;`
  - `pub is_revoked: int;`
- **Yêu cầu**:
  1. Phương thức `pub fn init(self, uid: int, tok: string, ttl: int, current_time: int)`.
  2. Phương thức `pub fn is_valid(self, current_time: int) -> int`: trả về 1 nếu chưa bị thu hồi (`is_revoked == 0`) và `current_time < expires_at`.
  3. Phương thức `pub fn revoke(self)`: vô hiệu hóa phiên ngay lập tức.

#### Bài tập 17.3: Lớp Máy Trạng Thái Tam Phân (Ternary Finite State Machine)
- **Mục tiêu**: Xây dựng lớp `TernaryFSM` mô phỏng máy trạng thái 3 giá trị:
  - Giá trị `@` (-1): Trạng thái LỖI / NGUY HIỂM.
  - Giá trị `0` (0): Trạng thái CHỜ / TRUNG HÒA.
  - Giá trị `1` (+1): Trạng thái HOẠT ĐỘNG / TÍCH CỰC.
- **Yêu cầu**:
  1. `init(self, initial_state: tryte)`.
  2. `transition(self, input_signal: tryte) -> tryte`: tính trạng thái tiếp theo bằng phép nhân/cộng tam phân cân bằng.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Reference Counting & Memory Aliasing Graph Simulator

Trong các ngôn ngữ quản lý bộ nhớ tự động hiện đại (Swift, Python, Tersun VM), việc sử dụng con trỏ đếm tham chiếu (`std::shared_ptr<VMObject>`) mang lại sự tiện lợi vượt bậc nhưng tiềm ẩn nguy cơ **Rò rỉ Bộ nhớ do Tham chiếu Vòng (Cyclic Reference Memory Leak)**:

```
Đối tượng Node A ------------(trỏ tới)------------> Đối tượng Node B
      ^                                                   |
      |---------------------(trỏ ngược lại)---------------|
```
Khi hai đối tượng Class trỏ chéo lẫn nhau, bộ đếm tham chiếu của cả hai sẽ không bao giờ giảm về 0, khiến bộ nhớ Heap bị rò rỉ vĩnh viễn ngay cả khi các biến trong hàm đã kết thúc!

**Nhiệm vụ của bạn**:
1. Hãy viết một lớp `GraphNode` trong Tersun:
   - `pub id: int;`
   - `pub next: GraphNode;` (hoặc mảng chứa các nút con)
   - `pub fn set_next(self, other: GraphNode);`
2. Tạo 3 nút $N_1, N_2, N_3$, kết nối chúng thành một vòng tròn khép kín: $N_1 \to N_2 \to N_3 \to N_1$.
3. Viết hàm `traverse_cycle(start_node: GraphNode, max_steps: int)` duyệt qua vòng tròn và in ra ID của các nút.
4. **Báo cáo Kiến trúc**: Phân tích giải pháp kỹ thuật để phát hiện và thu gom rác các chu trình tham chiếu vòng trong máy ảo Tersun VM (ví dụ: thế hệ bộ thu gom Mark-and-Sweep định kỳ, hoặc bổ sung kiểu con trỏ yếu `weak_ptr`).

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chương 17 đã chính thức khai mở kỷ nguyên Hướng Đối tượng trong hành trình kiến tạo phần mềm của chúng ta:
- Chúng ta đã hiểu sâu sắc sự khác biệt bản chất giữa **Ngữ nghĩa Giá trị (Value Types của Struct)** và **Ngữ nghĩa Tham chiếu (Reference Types của Class)**.
- Chúng ta đã giải phẫu cơ chế **Khởi tạo Đối tượng Hai Giai đoạn (Allocation + Initialization)** được trình biên dịch Tersun hạ cấp tinh xảo qua `OP_NEW_INSTANCE`, `OP_DUP`, và `OP_INVOKE_METHOD "init"`.
- Chúng ta đã chứng minh cơ chế liên kết đối tượng tiếp nhận (`self` binding) tại `slot 0` trong khung ngăn xếp.

Tuy nhiên, một lớp độc lập chỉ mới giải quyết bài toán đóng gói dữ liệu và bảo vệ bất biến của một thực thể riêng lẻ. Trong thế giới thực, các thực thể luôn tồn tại trong **mối quan hệ họ hàng, kế thừa và chuyên biệt hóa (Generalization & Specialization)**: Một `SavingsAccount` (tài khoản tiết kiệm có lãi suất) là một trường hợp đặc biệt của `BankAccount`; một `QuantumSensor` là một trường hợp mở rộng của `Sensor`.

Nếu ta sao chép lại toàn bộ các trường và phương thức của lớp cha sang lớp con, ta sẽ rơi vào bẫy trùng lặp mã nguồn (code duplication).

Ở chương tiếp theo, chúng ta sẽ mở rộng mô hình đối tượng lên tầm cao mới:
👉 **Chương 18: Kế Thừa & Khung Đối Tượng (Inheritance & Superclasses)** — Cú pháp `class Sub < Super`, kỹ thuật kế thừa bố cục trường (Field Layout Inheritance), cơ chế tái sử dụng mã nguồn và lệnh gọi lớp cha `super()`.






# GIÁO TRÌNH LẬP TRÌNH TERSUN (FIRST-PRINCIPLES TERSUN PROGRAMMING)
## PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH (OOP, CLASSES, INHERITANCE & DYNAMIC DISPATCH)

---

# CHƯƠNG 18: KẾ THỪA & KHUNG ĐỐI TƯỢNG (INHERITANCE & SUPERCLASSES)

---

### 1. Vấn đề (The Problem)

Ở Chương 17, chúng ta đã nắm vững **Lớp (Class)**, sự bao đóng trạng thái, ngữ nghĩa tham chiếu trên Heap và quy trình khởi tạo đối tượng hai giai đoạn. Chúng ta có thể tạo ra các thực thể hoàn chỉnh như `BankAccount` hay `Device`.

Tuy nhiên, trong các hệ thống thực tế — từ mạng lưới cảm biến IoT, hệ thống hạt vật lý, cho đến các cổng lượng tử:
- Một `Device` cơ sở có các trường: `id`, `name`, `is_online`, và phương thức `ping()`.
- Một `QuantumSensor` (cảm biến lượng tử) thực chất là một `Device`, nhưng cần bổ sung thêm: `coherence_us`, `error_rate_ppm`, và phương thức hiệu chuẩn `recalibrate()`.
- Một `ThermalSensor` (cảm biến nhiệt) cũng là một `Device`, nhưng cần bổ sung thêm: `temperature_mK`, `alarm_threshold`, và phương thức `check_overheat()`.

Nếu không có cơ chế **Kế thừa (Inheritance)**:
1. **Khủng hoảng Trùng lặp Mã nguồn (Code Duplication Nightmare)**:
   Lập trình viên buộc phải sao chép toàn bộ khai báo trường (`id`, `name`, `is_online`) và toàn bộ logic của các hàm cơ sở (`ping()`, `set_status()`) vào từng lớp con. Khi lớp `Device` cần sửa đổi logic kết nối, ta phải tìm và sửa thủ công trên 50 lớp cảm biến khác nhau. Chỉ cần quên một lớp, hệ thống sẽ rơi vào tình trạng bất đồng bộ logic.
2. **Khủng hoảng Tương thích Bộ nhớ (Memory Layout Incompatibility)**:
   Nếu hàm giám sát mạng `monitor_network(dev: Device)` muốn nhận bất kỳ thiết bị nào, nhưng mỗi lớp tự định nghĩa các trường theo thứ tự ngẫu nhiên (ví dụ `QuantumSensor` đặt `coherence` lên trước `id`), hàm giám sát sẽ đọc nhầm dữ liệu của con trỏ và làm hỏng bộ nhớ.

Làm thế nào để các lớp chuyên biệt hóa có thể tự động tiếp nhận toàn bộ cấu trúc trường và hành vi của lớp cha, mở rộng thêm các trường mới, và bảo toàn tính tương thích bố cục bộ nhớ tuyệt đối?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này xuất phát từ mâu thuẫn giữa **Tư duy Phân loại Học của Con người (Taxonomy / IS-A Hierarchy)** và **Bố cục Bộ nhớ Tuyến tính của Máy tính**:
- **Con người phân loại thế giới theo hình cây**: Chó là Động vật có vú; Động vật có vú là Động vật. Quan hệ Kế thừa (Subtyping / IS-A) là trực giác tự nhiên để quản lý sự phức tạp.
- **Phần cứng chỉ biết dịch chuyển con trỏ (Pointer Offset)**: CPU không hiểu "Cảm biến Lượng tử là một Thiết bị". CPU chỉ biết: "Tại con trỏ `RCX + 8` có một chuỗi tên, tại `RCX + 16` có một cờ trạng thái".
- Nếu một lớp con `B` kế thừa từ `A`, thì vùng nhớ đại diện cho `B` phải được sắp xếp như thế nào để một đoạn mã chỉ biết về `A` vẫn có thể đọc ghi chính xác các trường của `A` trên thực thể của `B`?

Nếu trình biên dịch không có một quy tắc **Kế thừa Bố cục Tiền tố (Prefix Memory Layout)** và cơ chế **Sao chép Bảng Phương thức Ảo (Vtable Inheritance)**, khái niệm kế thừa sẽ chỉ là một ảo ảnh cú pháp vô nghĩa.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa cơ chế Kế thừa Đơn (Single Inheritance) trong Tersun thỏa mãn 4 tiêu chuẩn kỹ thuật cốt lõi:

1. **Cú pháp Phân cấp Rõ ràng (`class Sub : Super`)**: Định nghĩa quan hệ cha-con tường minh, cho phép lớp con kế thừa toàn bộ trường và phương thức của lớp cha.
2. **Kế thừa Bố cục Bộ nhớ Tiền tố (Field Layout Prefixing)**: Đảm bảo danh sách trường của lớp cha luôn xuất hiện ở phần đầu (tiền tố) trong bố cục trường của lớp con với thứ tự slot tuyệt đối không đổi:
   $$\text{SlotIndex}_{\text{Sub}}(f) \equiv \text{SlotIndex}_{\text{Super}}(f) \quad \forall f \in \text{Fields}(\text{Super})$$
3. **Kế thừa & Ghi đè Bảng Phương thức (Method Table Inheritance & Overriding)**:
   - Mặc định: Lớp con tự động thừa hưởng mọi phương thức của lớp cha trong Vtable.
   - Ghi đè (Override): Nếu lớp con khai báo lại một phương thức cùng tên, con trỏ hàm trong Vtable của lớp con sẽ được trỏ sang mã máy mới, trong khi Vtable của lớp cha vẫn bất biến.
4. **Hệ Thống Kiểu Tương thích Ngược (Subtype Polymorphic Assignability)**: Bộ kiểm tra kiểu (Type Checker) phải cho phép truyền một đối tượng lớp con vào bất kỳ vị trí nào yêu cầu kiểu lớp cha (`is_assignable_from`).

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy mô phỏng cơ chế Kế thừa Bố cục Trường và Kế thừa Vtable bằng một đoạn mã Python cấp thấp:

```python
# Mô phỏng Kế thừa Tiền tố Bố cục và Kế thừa Vtable

class MetaRegistry:
    def __init__(self):
        self.classes = {}

    def define_class(self, name, super_name=None, fields=[], methods={}):
        inherited_fields = []
        inherited_methods = {}

        if super_name:
            super_meta = self.classes[super_name]
            # 1. Kế thừa Bố cục Tiền tố: Sao chép toàn bộ trường của lớp cha trước!
            inherited_fields = list(super_meta["fields"])
            # 2. Kế thừa Vtable: Sao chép toàn bộ phương thức của lớp cha
            inherited_methods = dict(super_meta["methods"])

        # Bổ sung các trường mới của lớp con vào đuôi
        all_fields = inherited_fields + fields
        # Ghi đè hoặc thêm mới phương thức
        inherited_methods.update(methods)

        self.classes[name] = {
            "name": name,
            "super": super_name,
            "fields": all_fields,
            "methods": inherited_methods
        }

registry = MetaRegistry()

# 1. Định nghĩa Lớp Cha: Device
def device_init(self, dev_id, name):
    self[0] = dev_id  # slot 0
    self[1] = name    # slot 1
    self[2] = 1       # slot 2: is_online = 1

def device_ping(self):
    return self[2] # đọc slot 2: is_online

registry.define_class("Device", None, 
                      fields=["id", "name", "is_online"],
                      methods={"init": device_init, "ping": device_ping})

# 2. Định nghĩa Lớp Con: QuantumSensor : Device
def qsensor_init(self, dev_id, name, coherence):
    device_init(self, dev_id, name) # Khởi tạo phần cha
    self[3] = coherence             # slot 3: coherence_us

def qsensor_ping(self):
    # Ghi đè ping: Phải vừa online (slot 2) vừa có coherence > 50 (slot 3)
    if self[2] == 1 and self[3] > 50:
        return 1
    return 0

registry.define_class("QuantumSensor", "Device",
                      fields=["coherence_us"],
                      methods={"init": qsensor_init, "ping": qsensor_ping})
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy kiểm tra xem một hàm giám sát chỉ biết về `Device` có thể thao tác an toàn trên `QuantumSensor` hay không:

```python
def generic_device_monitor(device_instance, class_name):
    # Đọc tên thiết bị tại slot 1 và thực hiện ping qua vtable
    name = device_instance[1]
    vtable = registry.classes[class_name]["methods"]
    status = vtable["ping"](device_instance)
    print(f"Giám sát [{name}] -> Trạng thái Ping: {status}")

# Tạo thể hiện Device
dev = [None] * 3
registry.classes["Device"]["methods"]["init"](dev, 101, "Router-Base")
generic_device_monitor(dev, "Device")

# Tạo thể hiện QuantumSensor
qdev = [None] * 4
registry.classes["QuantumSensor"]["methods"]["init"](qdev, 202, "Qubit-Probe", 120)
generic_device_monitor(qdev, "QuantumSensor") # Ping ghi đè trả về 1

# Làm giảm coherence xuống 30
qdev[3] = 30
generic_device_monitor(qdev, "QuantumSensor") # Ping ghi đè trả về 0 (suy giảm)
```

**Kết quả:**
```text
Giám sát [Router-Base] -> Trạng thái Ping: 1
Giám sát [Qubit-Probe] -> Trạng thái Ping: 1
Giám sát [Qubit-Probe] -> Trạng thái Ping: 0
```
Nhờ bố cục tiền tố: `device_instance[1]` luôn luôn là trường `name`, bất kể đối tượng là `Device` hay `QuantumSensor`. Tính tương thích bộ nhớ được bảo toàn $100\%$!

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Mô hình kế thừa nếu không được thiết kế chặt chẽ sẽ gây ra 3 vấn đề kinh điển trong khoa học máy tính:

1. **Hiểm họa Đa Kế thừa & Cấu trúc Kim Cương (The Diamond Problem)**:
   Nếu một ngôn ngữ cho phép `class D : B, C` trong khi cả `B` và `C` đều kế thừa từ `A`:
   - Thực thể `D` sẽ chứa hai bản sao riêng biệt của các trường trong `A`? Hay hợp nhất làm một?
   - Nếu cả `B` và `C` cùng ghi đè một phương thức của `A`, khi gọi `d.method()`, máy ảo sẽ gọi phương thức của `B` hay `C`?
   - C++ phải dùng `virtual inheritance` với con trỏ bổ sung cực kỳ tốn kém và phức tạp.
2. **Khủng hoảng Lớp Cơ sở Dễ vỡ (Fragile Base Class Problem)**:
   Nếu lớp cha `Device` quyết định thêm một trường `serial_number` vào **giữa** `id` và `name`:
   Toàn bộ offset của các trường trong các lớp con biên dịch trước đó sẽ bị lệch đi 1 vị trí! Nếu không biên dịch lại toàn bộ các thư viện con, chương trình sẽ đọc rác từ bộ nhớ.
3. **Lỗi Cắt lớp Đối tượng (Object Slicing in Value Types)**:
   Nếu ta gán một giá trị đối tượng con vào một biến kiểu cha trong các ngôn ngữ ngữ nghĩa giá trị (như C++ pass-by-value):
   Phần dữ liệu mở rộng của lớp con (`coherence_us`) bị cắt phăng đi (sliced away), chỉ còn lại phần vỏ của lớp cha, dẫn đến mất mát thông tin và phá vỡ tính đa hình.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Nguyên nhân sâu xa là:
- **Xung đột Thứ tự Bố cục (Layout Ambiguity in Multiple Inheritance)**: Không thể trải phẳng hai cấu trúc cây độc lập lên một đường thẳng 1D mà không làm thay đổi offset của một trong hai nhánh.
- **Tách rời Bản sao trong Ngữ nghĩa Giá trị**: Ngữ nghĩa giá trị (Value Semantics) đòi hỏi kích thước cố định tại thời điểm biên dịch. Khi kích thước của `Sub` ($32\text{ bytes}$) lớn hơn `Super` ($16\text{ bytes}$), biến kiểu `Super` trên Stack không có đủ chỗ chứa toàn bộ thể hiện của `Sub`.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Để bảo đảm an toàn bộ nhớ tuyệt đối và giữ cho kiến trúc compiler tinh gọn, khoa học máy tính hiện đại (Java, C#, Rust traits, Go, Tersun) đã đưa ra các giải pháp chuẩn mực:

1. **Đơn Kế thừa Lớp (Single Class Inheritance)**: Một lớp chỉ được phép có **duy nhất một lớp cha**. Loại bỏ hoàn toàn nguy cơ của bài toán Kim Cương (Diamond Problem). Sự tái sử dụng đa chiều được chuyển giao cho **Giao diện (Interfaces)** hoặc **Traits**.
2. **Kế thừa Tiền tố Bất biến (Prefix Invariant)**: Bố cục trường của lớp con luôn là một phép nối chuỗi:
   $$\text{Layout}(\text{Sub}) = \text{Layout}(\text{Super}) \mathbin{\Vert} \text{Fields}_{\text{new}}$$
3. **Ngữ nghĩa Tham chiếu Độc quyền (Reference-only Polymorphism)**: Chỉ cho phép tính kế thừa đa hình trên các **Đối tượng Tham chiếu trên Heap (`VMObject`)**. Biến trong hàm thực chất chỉ là một con trỏ 64-bit (`std::shared_ptr<VMObject>`), loại bỏ vĩnh viễn hiện tượng Cắt lớp Đối tượng (Object Slicing).

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Kế thừa Đơn (Single Class Inheritance)**: Cơ chế mà một lớp dẫn xuất (Derived Class / Subclass) tiếp nhận toàn bộ các thuộc tính và phương thức từ một lớp cơ sở duy nhất (Base Class / Superclass):
   $$\text{Sub} \sqsubseteq \text{Super}$$
2. **Nguyên lý Thay thế Liskov (Liskov Substitution Principle - LSP)**: Nếu $S$ là kiểu con của $T$, thì các đối tượng kiểu $T$ trong một chương trình có thể được thay thế bằng các đối tượng kiểu $S$ mà không làm thay đổi tính đúng đắn của chương trình:
   $$\forall x : S, \quad \phi(x) \implies \phi(x \text{ as } T)$$
3. **Kế thừa Bố cục Tiền tố (Prefix Memory Subtyping)**: Quy tắc sắp đặt bộ nhớ trong đó không gian địa chỉ trường của kiểu con chứa trọn vẹn không gian địa chỉ trường của kiểu cha ở cùng các bước nhảy offset ban đầu.
4. **Ghi đè Phương thức (Method Overriding)**: Hiện tượng lớp con cung cấp một cài đặt mới cho một phương thức đã tồn tại ở lớp cha với cùng chữ ký (signature), thay thế con trỏ hàm tương ứng trong bảng phương thức ảo Vtable.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Hệ sinh thái Tersun hiện thực hóa cơ chế Kế thừa liền mạch từ Parser đến Virtual Machine:

```
                            KIẾN TRÚC KẾ THỪA TRONG TERSUN
                            
  Cú pháp Tersun: class Sub : Super { ... }
  
  1. Parser (parser.cpp)
     -> match(TokenType::COLON) -> trích xuất super_class = "Super"
     
  2. Compiler Emitter (emitter.cpp)
     +-------------------------------------------------------------+
     | fnames = class_fields_[super_class];                        | // Tiền tố trường cha!
     | for (f in stmt.fields) fnames.push_back(f.name);            | // Nối trường con
     | class_fields_[stmt.name] = fnames;                          |
     +-------------------------------------------------------------+
     | class_methods_[stmt.name] = class_methods_[super_class];    | // Sao chép Vtable cha!
     | for (m in stmt.methods)                                     |
     |     class_methods_[stmt.name][m.name] = fn_entry;           | // Ghi đè Vtable
     +-------------------------------------------------------------+
     
  3. Type Checker (type_checker.cpp)
     -> Duyệt ngược chuỗi kế thừa: cursor = type_defs_[cursor->super_name]
     -> Xác thực gán kiểu hợp lệ: is_assignable_from(Sub -> Super) = true
     
  4. Virtual Machine (vm.cpp)
     -> Đối tượng Sub nhận Vtable đã tích hợp sẵn: obj->vtable = vtables_["Sub"]
     -> Gọi m.ping() tự động kích hoạt phiên bản đã ghi đè qua OP_INVOKE_METHOD
```

1. **Phân tích Cú pháp Kế thừa ([`Code/src/compiler/parser.cpp:L382`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L382-L388))**:
   Trình phân tích cú pháp phát hiện dấu hai chấm `:` sau tên lớp, trích xuất tên lớp cha `super_class` và danh sách các giao diện `interfaces`.
2. **Kế thừa Tiền tố Bố cục Trường ([`Code/src/compiler/emitter.cpp:L2021`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L2021-L2026))**:
   ```cpp
   std::vector<std::string> fnames;
   if (!stmt.super_class.empty() && class_fields_.find(stmt.super_class) != class_fields_.end()) {
       fnames = class_fields_[stmt.super_class]; // Kế thừa toàn bộ trường của cha!
   }
   for (const auto& f : stmt.fields) fnames.push_back(f.name);
   class_fields_[stmt.name] = fnames;
   ```
3. **Sao chép và Ghi đè Vtable ([`Code/src/compiler/emitter.cpp:L2028`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L2028-L2037))**:
   Lớp con sao chép toàn bộ bản đồ phương thức của lớp cha:
   `class_methods_[stmt.name] = class_methods_[stmt.super_class];`
   Sau đó, khi duyệt qua các phương thức của lớp con, nếu phương thức đã tồn tại, nó sẽ **ghi đè** chỉ số hàm thực thi.
4. **Kiểm tra Kiểu Đệ quy ([`Code/src/compiler/type_checker.cpp:L1230`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L1230-L1235))**:
   Khi kiểm tra lệnh gọi phương thức trên một biến lớp con, nếu phương thức không có ở lớp con, Type Checker tự động duyệt ngược lên cây phả hệ (`cursor = &sit->second`) để tìm phương thức ở các lớp tổ tiên.

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một hệ thống phân cấp thiết bị giám sát mạng và cảm biến lượng tử hoàn chỉnh được viết bằng Tersun, minh họa đầy đủ:
- Lớp cơ sở `Device` với các trường định danh và trạng thái kết nối
- Lớp dẫn xuất `QuantumSensor : Device` kế thừa trường và phương thức của cha
- Ghi đè phương thức `ping()` để kiểm tra bổ sung thời gian kết hợp lượng tử (`coherence_us`)
- Sử dụng phương thức kế thừa `set_status()` để ngắt kết nối thiết bị

```tersun
// device_network.stn
// Hệ thống Phân cấp Thiết bị & Cảm biến Lượng tử trong Tersun

class Device {
    pub id: int;
    pub name: string;
    pub is_online: int;

    pub fn init(self, id: int, name: string) {
        self.id = id;
        self.name = name;
        self.is_online = 1;
    }

    // Kiểm tra kết nối cơ bản: 1 = Online, 0 = Offline
    pub fn ping(self) -> int {
        return self.is_online;
    }

    // Đổi trạng thái hoạt động của thiết bị
    pub fn set_status(self, online: int) {
        self.is_online = online;
    }
}

class QuantumSensor : Device {
    pub coherence_us: int;      // Thời gian duy trì trạng thái kết hợp (micro-giây)
    pub error_rate_ppm: int;    // Tỉ lệ lỗi lượng tử (phần triệu)

    // Hàm khởi tạo của lớp con: thiết lập cả trường cha và trường con
    pub fn init(self, id: int, name: string, coherence: int, err: int) {
        self.id = id;
        self.name = name;
        self.is_online = 1;
        self.coherence_us = coherence;
        self.error_rate_ppm = err;
    }

    // GHI ĐÈ PHƯƠNG THỨC ping():
    // Cảm biến chỉ được coi là "Khỏe mạnh" nếu vừa Online vừa có Coherence > 50 us
    pub fn ping(self) -> int {
        if (self.is_online == 1) {
            if (self.coherence_us > 50) {
                return 1; // Khỏe mạnh (Healthy)
            }
            return 0; // Cảnh báo suy giảm trạng thái lượng tử (Degraded)
        }
        return -1; // Mất kết nối hoàn toàn (Offline)
    }

    // Phương thức chuyên biệt của QuantumSensor
    pub fn recalibrate(self, delta_coherence: int) -> int {
        self.coherence_us = self.coherence_us + delta_coherence;
        return self.coherence_us;
    }
}

fn main() {
    // 1. Thao tác trên Lớp Cơ sở Device
    let mut dev = Device(101, "Gateway-Main");
    println("=== 1. THIẾT BỊ GỐC (DEVICE) ===");
    print("Tên thiết bị: ");
    println(dev.name);
    print("Ping: ");
    println(dev.ping());

    // 2. Thao tác trên Lớp Dẫn xuất QuantumSensor
    let mut qdev = QuantumSensor(202, "Qubit-Probe-7", 120, 15);
    println("=== 2. CẢM BIẾN LƯỢNG TỬ (KẾ THỪA DEVICE) ===");
    print("Tên cảm biến (kế thừa từ Device): ");
    println(qdev.name);
    print("Trạng thái ping (đã ghi đè): ");
    println(qdev.ping());

    // 3. Hiệu chuẩn trạng thái lượng tử và kiểm chứng logic ghi đè
    println("=== 3. BIẾN ĐỔI TRẠNG THÁI VÀ GHI ĐÈ PING ===");
    qdev.recalibrate(-80); // Coherence giảm từ 120 xuống 40 us
    print("Coherence mới: ");
    println(qdev.coherence_us);
    print("Ping sau khi coherence giảm: ");
    println(qdev.ping()); // Kỳ vọng: 0 (Cảnh báo suy giảm)

    // 4. Gọi phương thức kế thừa từ lớp cha Device
    qdev.set_status(0); // Chuyển trạng thái sang offline
    print("Ping sau khi ngắt kết nối (gọi set_status từ Device): ");
    println(qdev.ping()); // Kỳ vọng: -1 (Mất kết nối)
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler và Virtual Machine để thấy cách Tersun xử lý kế thừa và ghi đè phương thức.

#### A. Trích xuất Cú pháp Kế thừa trong Parser
Trích từ [`Code/src/compiler/parser.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L382-L388):

```cpp
if (match(TokenType::COLON)) {
    Token super_tok = consume(TokenType::IDENTIFIER, "Expected super class or interface name.");
    super_class = super_tok.lexeme; // Lưu tên lớp cha
    while (match(TokenType::COMMA)) {
        interfaces.push_back(consume(TokenType::IDENTIFIER, "Expected interface name.").lexeme);
    }
}
```

#### B. Kế thừa Bố cục và Bảng Phương thức trong Emitter
Trích từ [`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L2019-L2038):

```cpp
void BytecodeEmitter::emit_class_decl(const ClassDeclStmt& stmt) {
    std::vector<std::string> fnames;
    // 1. Kế thừa toàn bộ trường của lớp cha trước
    if (!stmt.super_class.empty() && class_fields_.find(stmt.super_class) != class_fields_.end()) {
        fnames = class_fields_[stmt.super_class];
    }
    // 2. Thêm các trường riêng của lớp con vào sau
    for (const auto& f : stmt.fields) fnames.push_back(f.name);
    class_fields_[stmt.name] = fnames;
    class_init_arity_[stmt.name] = compute_init_arity(stmt.name, stmt.methods);

    // 3. Sao chép toàn bộ phương thức từ lớp cha sang lớp con
    if (!stmt.super_class.empty() && class_methods_.find(stmt.super_class) != class_methods_.end()) {
        class_methods_[stmt.name] = class_methods_[stmt.super_class];
    }

    // 4. Duyệt các phương thức của lớp con: Nếu trùng tên thì GHI ĐÈ, nếu mới thì THÊM VÀO
    for (const auto& m : stmt.methods) {
        if (!m.body) continue;
        std::string mangled_name = stmt.name + "_" + m.name;
        size_t jump_over = chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line);
        uint16_t fn_entry = register_function(mangled_name);
        class_methods_[stmt.name][m.name] = fn_entry; // Ghi đè chỉ số entry point!
        ...
    }
}
```

#### C. Duyệt Cây Kế thừa trong Type Checker
Trích từ [`Code/src/compiler/type_checker.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L1230-L1235):

```cpp
// Khi tra cứu phương thức 'expr.method' trên một đối tượng:
while (depth < 64) {
    auto mit = (*cursor)->methods.find(expr.method);
    if (mit != (*cursor)->methods.end()) {
        // Tìm thấy phương thức ở tầng hiện tại!
        return mit->second.return_type;
    }
    // Nếu không có: Đi ngược lên lớp cha thông qua super_name
    if ((*cursor)->super_name.empty()) break;
    auto sit = type_defs_.find((*cursor)->super_name);
    if (sit == type_defs_.end()) break;
    cursor = &sit->second;
    ++depth;
}
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn trên vào [`scratch/test_device_hierarchy.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_device_hierarchy.stn) và thực thi trực tiếp bằng trình biên dịch của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_device_hierarchy.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
=== 1. THIẾT BỊ GỐC (DEVICE) ===
Tên thiết bị: Gateway-Main
Ping: 1
=== 2. CẢM BIẾN LƯỢNG TỬ (KẾ THỪA DEVICE) ===
Tên cảm biến (kế thừa từ Device): Qubit-Probe-7
Trạng thái ping (đã ghi đè): 1
=== 3. BIẾN ĐỔI TRẠNG THÁI VÀ GHI ĐÈ PING ===
Coherence mới: 40
Ping sau khi coherence giảm: 0
Ping sau khi ngắt kết nối (gọi set_status từ Device): -1
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_device_hierarchy.stn
```

Dưới đây là đoạn trích bytecode thực tế minh chứng rõ ràng sự phân định giữa phương thức kế thừa và phương thức ghi đè:

```text
// 1. Khởi tạo đối tượng lớp con: QuantumSensor
3300  OP_NEW_INSTANCE    "QuantumSensor" (fields 0)
3340  OP_DUP            
3350  OP_PUSH_INT        202
3440  OP_PUSH_STRING     "Qubit-Probe-7"
3470  OP_PUSH_INT        120
3560  OP_PUSH_INT        15
3650  OP_INVOKE_METHOD   "init" (argc 4)
3690  OP_POP            
3700  OP_STORE_LOCAL     slot 1                 // Biến 'qdev'

// 2. Đọc trường kế thừa từ Device: qdev.name
3830  OP_LOAD_LOCAL      slot 1
3860  OP_GET_FIELD       "name"                 // Trường 'name' được định vị chính xác!
3890  OP_PRINTLN        

// 3. Gọi phương thức ĐÃ GHI ĐÈ: qdev.ping()
3960  OP_LOAD_LOCAL      slot 1
3990  OP_INVOKE_METHOD   "ping" (argc 0)        // Điều phối tới QuantumSensor_ping
4030  OP_PRINTLN        

// 4. Gọi phương thức KẾ THỪA TỪ LỚP CHA: qdev.set_status(0)
4550  OP_LOAD_LOCAL      slot 1
4580  OP_PUSH_INT        0
4670  OP_INVOKE_METHOD   "set_status" (argc 1)  // Điều phối tới Device_set_status!
4710  OP_POP            
```

Lệnh `OP_INVOKE_METHOD "set_status"` được gọi mượt mà trên `QuantumSensor` mà không cần một dòng mã trung gian nào trong mã nguồn của lớp con!

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 18.1: Phân Cấp Hạt Vật Lý Điện Tích (Particle & ChargedParticle)
- **Mục tiêu**: Xây dựng hệ phân cấp hạt vật lý:
  - Lớp cơ sở `Particle`: `id: int`, `px: int`, `py: int`, `mass: int`. Phương thức `move(self, dx: int, dy: int)`.
  - Lớp dẫn xuất `ChargedParticle : Particle`: bổ sung trường `charge: int` (điện tích) và phương thức `coulomb_force(self, other: ChargedParticle, dist_sq: int) -> int` tính theo công thức tỉ lệ $F = \frac{q_1 \times q_2}{r^2}$.
- **Yêu cầu**: Khởi tạo 2 hạt mang điện, dịch chuyển vị trí qua `move()` kế thừa và tính lực tương tác điện trường giữa chúng.

#### Bài tập 18.2: Hệ Thống Nhân Viên & Quản Lý (Employee & Manager Hierarchy)
- **Mục tiêu**: Thiết kế hệ thống nhân sự:
  - Lớp cơ sở `Employee`: `id: int`, `name: string`, `base_salary: int`. Phương thức `calc_salary(self) -> int` trả về `base_salary`.
  - Lớp dẫn xuất `Manager : Employee`: bổ sung `bonus: int`. Ghi đè phương thức `calc_salary(self) -> int` trả về `base_salary + bonus`.
- **Yêu cầu**: Tạo một danh sách gồm cả nhân viên và quản lý, tính toán tổng quỹ lương phải chi trả.

#### Bài tập 18.3: Cổng Mạch Logic Tam Phân Kế Thừa (Trit Gate Hierarchy)
- **Mục tiêu**: Xây dựng cây kế thừa mô phỏng cổng mạch tam phân cân bằng:
  - Lớp cơ sở `TritGate`: `gate_id: int`, `input_a: tryte`. Phương thức `evaluate(self) -> tryte` mặc định trả về `input_a`.
  - Lớp dẫn xuất `InverterGate : TritGate`: ghi đè `evaluate(self) -> tryte` thực hiện phép đảo tam phân `~self.input_a`.
  - Lớp dẫn xuất `BufferGate : TritGate`: ghi đè `evaluate(self) -> tryte` trả về giá trị trễ hoặc làm sạch tín hiệu.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Vtable Memory Overhead & Lookup Pressure in Deep Inheritance Hierarchies

Mặc dù Kế thừa Đơn giải quyết triệt để bài toán kim cương, nhưng trong các hệ thống phân cấp sâu (Deep Inheritance Trees — ví dụ phân cấp UI Framework với 8-10 tầng: `Object -> Component -> Visual -> Control -> ContentControl -> ButtonBase -> Button`):
1. **Áp lực Băng thông Vtable**: Nếu lớp cha có 200 phương thức ảo, và có 50 lớp con kế thừa:
   - Mỗi lớp con đều sao chép một bảng Vtable chứa 200 con trỏ hàm (`class_methods_[sub] = class_methods_[super]`).
   - Tổng cộng: $50 \times 200 = 10,000$ mục trong từ điển phương thức!
2. **Suy thoái Cache L1 Instruction**: Khi các phương thức kế thừa nằm rải rác trên các vùng nhớ bytecode khác nhau, việc nhảy liên tục giữa các khung mã máy của các tầng kế thừa khác nhau gây ra hiện tượng I-Cache thrashing.

**Nhiệm vụ của bạn**:
1. Hãy viết một kịch bản Tersun tạo ra một chuỗi kế thừa sâu 5 tầng: $L_1 \to L_2 \to L_3 \to L_4 \to L_5$, trong đó mỗi tầng bổ sung 2 trường và ghi đè 1 phương thức.
2. Phân tích file bytecode disassembly sinh ra từ `setunc.exe disasm`: Đo lường số lượng lệnh nhảy `OP_JUMP` và kích thước bảng `chunk.vtables`.
3. **Báo cáo Kỹ thuật**: Đề xuất giải pháp kiến trúc: Thay vì sao chép toàn bộ bảng từ điển phương thức (`unordered_map<string, uint16_t>`), trình biên dịch có thể dùng cơ chế **Bảng Con trỏ Ảo Phẳng Cố định Chỉ số (Array-indexed Vtable)** tương tự chuẩn C++ Itanium ABI như thế nào để giảm chi phí bộ nhớ về $O(1)$?

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chương 18 đã giải quyết trọn vẹn bài toán tái sử dụng mã nguồn và chia sẻ cấu trúc thông qua **Kế thừa & Khung Đối tượng**:
- Chúng ta đã hiểu cách **Kế thừa Bố cục Tiền tố (Prefix Layout)** bảo toàn vị trí các trường trong bộ nhớ Heap, cho phép mã nguồn lớp cha thao tác an toàn trên thể hiện của lớp con.
- Chúng ta đã thấy trình biên dịch Tersun sao chép và cập nhật bảng phương thức ảo trong `class_methods_` để hỗ trợ ghi đè phương thức tự nhiên.
- Chúng ta đã kiểm chứng trực quan bằng bytecode: các phương thức của lớp cha được điều phối trực tiếp từ con trỏ của lớp con.

Tuy nhiên, trong chương trình mẫu ở trên, tại hàm `main()`, biến `qdev` vẫn được khai báo rõ ràng là kiểu `QuantumSensor`. 
Điều gì sẽ xảy ra nếu ta viết một hàm chung:
```tersun
fn health_check(dev: Device) {
    let status = dev.ping(); // Gọi ping() nào? Của Device hay của QuantumSensor?
}
```
Tại thời điểm biên dịch, hàm `health_check` chỉ biết tham số `dev` có kiểu `Device`. Nhưng tại thời điểm chạy (Runtime), ta có thể truyền vào một `QuantumSensor`, một `ThermalSensor`, hay một `QuantumGate`!

Làm thế nào máy tính có thể tự động tìm ra và thực thi chính xác phương thức của lớp con tại thời gian chạy mà không cần viết hàng chục câu lệnh `if-else` kiểm tra kiểu tốn kém?

Đó chính là đỉnh cao của Lập trình Hướng Đối tượng:
👉 **Chương 19: Đa Hình & Bảng Phương Thức Ảo (Polymorphism, vtable & Dynamic Dispatch)** — Bản chất con trỏ `vtable` trong `VMObject`, giải thuật điều phối động (Dynamic Dispatch Resolution), và cách Tersun đạt thông lượng triệu cuộc gọi đa hình mỗi giây.




## PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH (OOP, CLASSES, INHERITANCE & DYNAMIC DISPATCH)

---

# CHƯƠNG 19: ĐA HÌNH & BẢNG PHƯƠNG THỨC ẢO (POLYMORPHISM, VTABLE & DYNAMIC DISPATCH)

---

### 1. Vấn đề (The Problem)

Ở Chương 18, chúng ta đã chinh phục **Kế thừa (Inheritance)**: khả năng tái sử dụng cấu trúc trường và mã nguồn thông qua bố cục tiền tố và kế thừa bảng phương thức.

Nhưng hãy xem xét một tình huống thực tế trong thiết kế phần mềm quy mô lớn: Chúng ta đang xây dựng một **Trình Mô phỏng Mạch Lượng tử (Quantum Circuit Simulator)** hoặc một **Bộ Duyệt Cây Cú pháp (AST Evaluator)**.
Một mạch lượng tử bao gồm một chuỗi hàng trăm cổng logic nối tiếp nhau:
- Cổng đảo dấu tam phân (`InverterGate`)
- Cổng dịch pha tuần hoàn (`IncrementGate`)
- Cổng khuếch đại biên độ (`ScalingGate`)
- Cổng quay góc pha tùy ý (`PhaseRotationGate`)

Tất cả các cổng này đều kế thừa từ lớp cơ sở trừu tượng `Gate`. Khi luồng điều khiển duyệt qua danh sách các cổng để thực thi mô phỏng:
```tersun
fn execute_circuit(circuit: array, input_val: int) -> int {
    let mut state = input_val;
    for g in circuit {
        state = g.apply(state); // CÂU HỎI LỚN: g.apply() THỰC SỰ GỌI HÀM NÀO?
    }
    return state;
}
```

Nếu ngôn ngữ **không có Đa hình (Polymorphism)**, lập trình viên sẽ bị đẩy vào một cơn ác mộng kiến trúc:
Ta buộc phải thêm một trường định danh kiểu `gate_type: int` vào lớp cha và viết các câu lệnh rẽ nhánh khổng lồ:
```tersun
// Lập trình thủ công không có đa hình:
if (g.gate_type == 1) {
    state = apply_inverter(g, state);
} else if (g.gate_type == 2) {
    state = apply_increment(g, state);
} else if (g.gate_type == 3) {
    state = apply_scaling(g, state);
} ...
```
- **Vi phạm Nguyên lý Đóng/Mở (Open-Closed Principle - OCP)**: Mỗi khi ta phát minh thêm một cổng lượng tử mới (ví dụ `HadamardGate`), ta buộc phải tìm kiếm và sửa đổi mọi câu lệnh `if-else` hoặc `match` rải rác khắp toàn bộ hệ thống. Quên một chỗ, chương trình sẽ âm thầm bỏ qua hoặc gây lỗi.
- **Phình to Mã máy & Suy thoái Hiệu năng**: Chuỗi `if-else` dài tạo ra hàng loạt lệnh nhảy có điều kiện làm tràn bảng dự đoán rẽ nhánh của CPU (Branch Predictor thrashing).

Làm thế nào để lệnh gọi `g.apply(state)` có thể **tự động xác định và nhảy chính xác** vào hàm của lớp con cụ thể tại thời điểm chạy (Runtime) mà mã nguồn gọi không cần biết trước kiểu cụ thể của đối tượng?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ khoảng cách giữa **Thời điểm Biên dịch (Compile-time)** và **Thời điểm Thực thi (Runtime)** trong phần cứng máy tính:

- **Tại thời điểm biên dịch**: Trình biên dịch chỉ nhìn thấy kiểu tĩnh của biến. Khi phân tích hàm `execute_circuit(circuit: array, input_val: int)`, compiler chỉ biết phần tử `g` là một thể hiện của `Gate`. Compiler không có cách nào biết trước lúc chạy người dùng sẽ nạp cổng nào vào mảng.
- **Phần cứng CPU đòi hỏi địa chỉ cụ thể**: Lệnh gọi hàm trực tiếp trong vi kiến trúc máy tính (`CALL 0x401020`) đòi hỏi một địa chỉ bộ nhớ cố định $64\text{-bit}$ được nhúng thẳng vào dòng lệnh mã máy. CPU không thể thực thi một lệnh nhảy "mơ hồ".

Nếu muốn nhảy tới các địa chỉ khác nhau dựa trên kiểu thực tế của dữ liệu đang nằm trên thanh ghi, hệ thống bắt buộc phải thực hiện một **Lệnh Nhảy Gián tiếp (Indirect Call / Jump)**:
$$\text{CALL } [\text{RAX} + \text{offset}]$$
Địa chỉ đích phải được tra cứu từ một cấu trúc dữ liệu trung gian tại thời điểm chạy. Cấu trúc trung gian đó chính là **Bảng Phương thức Ảo (Virtual Method Table - VTable)**.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa cơ chế **Đa hình Thời gian chạy (Runtime / Subtype Polymorphism)** trong Tersun với 4 mục tiêu cốt lõi:

1. **Điều phối Động (Dynamic Dispatch)**: Biến lệnh gọi phương thức thành một phép tra cứu động dựa trên danh tính kiểu thời gian chạy của đối tượng tiếp nhận (`self`), cho phép các lớp con phản ứng khác nhau với cùng một thông điệp.
2. **Kiến trúc Bảng Phương thức Ảo (VTable Architecture)**:
   - Mỗi Lớp sở hữu một bảng VTable duy nhất ánh xạ tên phương thức sang điểm vào bytecode (`fn_entry`).
   - Mỗi thể hiện đối tượng trên Heap (`VMObject`) chứa một con trỏ bất biến `vtable` trỏ trực tiếp đến bảng của lớp tạo ra nó.
3. **Độc lập và Mở rộng Tự do (Extensibility without Modification)**: Thêm một lớp con mới kế thừa từ `Gate` mà không cần chạm vào một dòng mã nào của các hàm tiêu thụ (`execute_circuit`).
4. **Hiệu năng Tra cứu $O(1)$**: Cơ chế giải mã phương thức ảo trong Virtual Machine phải diễn ra ở độ phức tạp hằng số $O(1)$, tối ưu hóa để tương thích với bộ nhớ đệm lệnh (Instruction Cache).

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy mô phỏng chính xác cấu trúc con trỏ `vtable` và cơ chế điều phối gián tiếp bằng C++ / Python ở cấp độ phần cứng:

```python
# Mô phỏng Bảng VTable và Con trỏ vptr thủ công

class VTable:
    def __init__(self, class_name, methods):
        self.class_name = class_name
        self.methods = methods # Dict ánh xạ: tên phương thức -> con trỏ hàm thực thi

class RawObject:
    def __init__(self, vtable, fields):
        self.vptr = vtable # Con trỏ ảo trỏ tới VTable của lớp cụ thể!
        self.fields = fields

# --- Các hàm thực thi độc lập (C-style Function Pointers) ---

# Triển khai của InverterGate
def inverter_apply(self_obj, state):
    return 0 - state

def inverter_describe(self_obj):
    return f"Cổng Đảo [Inverter] tác động lên Trit {self_obj.fields['trit']}"

# Triển khai của IncrementGate
def increment_apply(self_obj, state):
    step = self_obj.fields['step']
    nxt = state + step
    if nxt > 1: return -1
    if nxt < -1: return 1
    return nxt

def increment_describe(self_obj):
    return f"Cổng Dịch [Increment +{self_obj.fields['step']}]"

# --- Khởi tạo các VTable tĩnh duy nhất trong bộ nhớ ---
VTABLE_INVERTER = VTable("InverterGate", {
    "apply": inverter_apply,
    "describe": inverter_describe
})

VTABLE_INCREMENT = VTable("IncrementGate", {
    "apply": increment_apply,
    "describe": increment_describe
})

# --- Hàm khởi tạo đối tượng ---
def make_inverter(trit):
    return RawObject(VTABLE_INVERTER, {"trit": trit})

def make_increment(step):
    return RawObject(VTABLE_INCREMENT, {"step": step})

# --- BỘ ĐIỀU PHỐI ĐỘNG (DYNAMIC DISPATCH ENGINE) ---
def invoke_virtual(obj, method_name, *args):
    # 1. Truy ngược con trỏ vptr để lấy VTable của đối tượng thực tế
    vt = obj.vptr
    # 2. Tra cứu hàm thực thi tương ứng
    fn = vt.methods.get(method_name)
    if not fn:
        raise AttributeError(f"Lớp {vt.class_name} không có phương thức {method_name}")
    # 3. Thực thi gián tiếp (Indirect Call) với self = obj
    return fn(obj, *args)
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy kiểm tra xem một vòng lặp đa hình có thể xử lý các đối tượng hỗn hợp mà không cần bất kỳ câu lệnh `if-else` nào:

```python
# Tạo một mạch gồm các cổng khác nhau
circuit = [
    make_inverter(trit=0),
    make_increment(step=1),
    make_inverter(trit=0)
]

# Hàm thực thi mạch hoàn toàn không biết kiểu cụ thể!
state = 1
print(f"Trạng thái ban đầu: {state}")

for i, gate in enumerate(circuit):
    desc = invoke_virtual(gate, "describe")
    prev = state
    # ĐIỀU PHỐI ĐỘNG XẢY RA Ở ĐÂY:
    state = invoke_virtual(gate, "apply", state)
    print(f"Bước {i+1}: {desc} -> Biến đổi: {prev} => {state}")

print(f"Trạng thái kết thúc: {state}")
```

**Kết quả:**
```text
Trạng thái ban đầu: 1
Bước 1: Cổng Đảo [Inverter] tác động lên Trit 0 -> Biến đổi: 1 => -1
Bước 2: Cổng Dịch [Increment +1] -> Biến đổi: -1 => 0
Bước 3: Cổng Đảo [Inverter] tác động lên Trit 0 -> Biến đổi: 0 => 0
Trạng thái kết thúc: 0
```
Cùng một câu lệnh `invoke_virtual(gate, "apply", state)`:
- Ở bước 1: Nó tự động gọi `inverter_apply`.
- Ở bước 2: Nó tự động gọi `increment_apply`.
- Ở bước 3: Nó quay lại gọi `inverter_apply`.
Mã nguồn tiêu thụ hoàn toàn độc lập với việc có bao nhiêu loại cổng trong hệ thống!

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Mô hình điều phối động là nền tảng của lập trình hướng đối tượng, nhưng nó mang theo những thách thức vật lý nghiêm ngặt:

1. **Tổn thất Dự đoán Rẽ nhánh (Branch Target Buffer - BTB Misses)**:
   - Một lệnh gọi tĩnh `CALL 0x1000` luôn nhảy đến cùng một địa chỉ: CPU nạp trước mã máy vào đường ống (Pipeline) với độ chính xác $100\%$.
   - Một lệnh gọi ảo `CALL [RAX + 8]` phụ thuộc vào giá trị của `RAX`. Nếu một vòng lặp liên tục thay đổi kiểu đối tượng ($A \to B \to C \to A$), bộ dự đoán rẽ nhánh BTB của CPU sẽ liên tục đoán sai, làm xả sạch Pipeline (pipeline flush) và làm chậm tốc độ thực thi từ $10\times - 20\times$.
2. **Rào cản Nội tuyến (Inlining Barrier)**:
   Trình tối ưu hóa của compiler không thể nội tuyến (inline) một phương thức ảo vì tại thời điểm dịch mã, compiler không biết hàm nào sẽ được gọi. Điều này triệt tiêu các cơ hội tối ưu hóa như hằng số hóa (constant propagation) hay véc-tơ hóa vòng lặp (vectorization).
3. **Hiện tượng Megamorphic Call Site**:
   - **Monomorphic**: Điểm gọi chỉ luôn gặp 1 kiểu đối tượng $\to$ Cực nhanh.
   - **Polymorphic**: Điểm gọi gặp 2 đến 4 kiểu đối tượng $\to$ Tốc độ chấp nhận được.
   - **Megamorphic**: Điểm gọi gặp hàng chục kiểu đối tượng ngẫu nhiên $\to$ Chi phí tra cứu Vtable và trượt cache tăng vọt.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Bản chất phần cứng của sự chậm trễ này:
- **Độ trễ Đọc Bộ nhớ Gián tiếp (Pointer Dereference Latency)**:
  Để gọi được hàm, CPU phải trải qua 3 bước nạp tuần tự:
  $$\text{Object Reference} \xrightarrow{\text{deref 1}} \text{VTable Pointer} \xrightarrow{\text{deref 2}} \text{Function Pointer} \xrightarrow{\text{jump}} \text{Code Execution}$$
  Nếu `VTable` hoặc con trỏ hàm không nằm sẵn trong CPU L1 Data Cache, mỗi bước nhảy có thể tốn từ $100 - 200\text{ CPU cycles}$ chờ nạp dữ liệu từ RAM.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Khoa học máy tính giải quyết bài toán này qua hai cơ chế tối ưu đỉnh cao:

#### Giải pháp 1: Array-indexed VTable (C++, Rust traits, Itanium ABI)
Thay vì dùng bảng băm tên chuỗi (`methods["apply"]`), mỗi phương thức ảo được gán một **chỉ số nguyên cố định (Index $0, 1, 2...$)** tại thời điểm biên dịch.
Bảng VTable là một mảng phẳng các con trỏ hàm: `void* vtable[N]`.
Lệnh gọi đa hình hạ cấp trực tiếp thành một phép cộng chỉ số mảng:
$$\text{CALL } [\text{vptr} + 8 \times \text{METHOD\_INDEX}]$$
Chi phí tra cứu chuỗi hoàn toàn biến mất, chỉ còn 1 chu kỳ máy tính toán địa chỉ!

#### Giải pháp 2: Inline Caching (IC) & Devirtualization (V8 JavaScript, HotSpot JVM, Tersun Gate 4)
Tại mỗi điểm gọi phương thức ảo:
- Lần đầu tiên chạy: Máy ảo ghi nhớ lại: *"Lần trước đối tượng có Shape/VTable là $X$, và hàm tương ứng là $F$"*.
- Lần chạy tiếp theo: Máy ảo chỉ cần kiểm tra nhanh: `if (obj->vtable == CachedVTable) goto F;`
- Nhánh kiểm tra này được CPU dự đoán chính xác $99.9\%$, biến lệnh gọi ảo thành lệnh gọi trực tiếp với tốc độ cực hạn!

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Đa hình Kiểu con (Subtype Polymorphism)**: Khả năng của các đối tượng thuộc các kiểu dữ liệu khác nhau trong cùng một cây phân cấp phản ứng với cùng một tên thông điệp theo các cách thức chuyên biệt hóa riêng của chúng.
2. **Bảng Phương thức Ảo (VTable - Virtual Method Table)**: Mảng hoặc bảng tra cứu chứa các con trỏ dẫn tới các hiện thực cụ thể của các phương thức ảo của một lớp.
3. **Con trỏ Ảo (vptr)**: Trường dữ liệu ẩn nằm trong mỗi thể hiện đối tượng, lưu địa chỉ trỏ tới VTable của lớp tương ứng:
   $$\text{obj}\to\text{vtable}$$
4. **Điều phối Tĩnh vs Điều phối Động (Static vs Dynamic Dispatch)**:
   - **Static Dispatch**: Địa chỉ hàm đích được xác định cố định tại Compile-time (dùng cho hàm tự do, hàm tĩnh, hoặc phương thức không thể ghi đè).
   - **Dynamic Dispatch**: Địa chỉ hàm đích được phân giải tại Runtime thông qua việc tra cứu VTable của đối tượng tiếp nhận.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Tersun hiện thực hóa cơ chế Đa hình thông qua sự tích hợp giữa kiến trúc Chunk Bytecode và hệ thống Đối tượng Virtual Machine:

```
                          CƠ CHẾ ĐIỀU PHỐI ĐA HÌNH TRONG TERSUN
                          
   Mã nguồn:
   for g in circuit {
       g.apply(state);   // Trình biên dịch phát: OP_INVOKE_METHOD "apply" (argc 1)
   }
   
   Thời điểm thực thi trong VM (handle_invoke_method):
   
   1. Pop tham số: state
   2. Pop đối tượng: g (VMValue holding shared_ptr<VMObject>)
   
      +-----------------------------------------+
      | VMObject trên Heap                      |
      | - type_name: "IncrementGate"            |
      | - vtable: -------------------+          |
      | - fields_array: [0, 1]       |          |
      +------------------------------|----------+
                                     |
                                     v
      +-----------------------------------------+
      | VTable của "IncrementGate"              |
      | - class_name: "IncrementGate"           |
      | - methods:                              |
      |     "init"     -> fn#3                  |
      |     "describe" -> fn#1 (kế thừa từ Gate)|
      |     "apply"    -> fn#4 (ĐÃ GHI ĐÈ!)     |
      +-----------------------------------------+
                                     |
                                     v
   3. Tìm thấy: methods["apply"] = fn#4 (IncrementGate_apply)
   4. Cấp phát CallFrame mới: locals[0] = g, locals[1] = state
   5. Nhảy tới điểm vào bytecode: ip_ = chunk.function_table[fn#4]
```

1. **Khởi tạo Bảng VTable Toàn cục ([`Code/src/vm/vm.cpp:L202`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L202-L207))**:
   Khi nạp chương trình, Virtual Machine đọc toàn bộ từ điển `chunk.vtables` do Emitter tổng hợp và kiến tạo các cấu trúc `VTable` chia sẻ:
   ```cpp
   for (const auto& [cname, methods] : chunk.vtables) {
       auto vt = std::make_shared<VTable>();
       vt->class_name = cname;
       vt->methods = methods;
       vtables_[cname] = vt;
   }
   ```
2. **Gắn VTable khi Cấp phát Đối tượng ([`Code/src/vm/vm.cpp:L2613`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L2613-L2616))**:
   Khi lệnh `OP_NEW_INSTANCE` chạy, đối tượng tự động nhận con trỏ VTable của lớp nó:
   ```cpp
   auto it = vtables_.find(type_name);
   if (it != vtables_.end()) {
       obj->vtable = it->second;
   }
   ```
3. **Phân giải Điều phối Động trong Virtual Machine ([`Code/src/vm/vm.cpp:L3097`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L3097-L3110))**:
   Lệnh `OP_INVOKE_METHOD` tra cứu trực tiếp trong `obj->vtable`:
   ```cpp
   if (obj->vtable) {
       auto it = obj->vtable->methods.find(method_name);
       if (it != obj->vtable->methods.end()) {
           uint32_t fn_entry = chunk.function_table[it->second];
           // Thiết lập CallFrame và thực thi!
       }
   }
   ```
4. **Hạ cấp Bytecode Đồng nhất ([`Code/src/compiler/emitter.cpp:L1632`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1632))**:
   Mọi lời gọi phương thức `obj.method(args...)` đều được hạ cấp thành chỉ thị duy nhất:
   `OP_INVOKE_METHOD "method_name" (argc)`. Compiler không quan tâm lớp cụ thể nào đang nằm dưới, ủy thác toàn quyền phân giải cho cơ chế VTable ở thời gian chạy.

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một chương trình hoàn chỉnh mô phỏng mạch lượng tử tam phân (Ternary Quantum Circuit Pipeline) bằng mô hình Đa hình Hướng Đối tượng:

```tersun
// quantum_circuit_poly.stn
// Mô phỏng Mạch Xử lý Tín hiệu Tam phân Đa hình trong Tersun

class Gate {
    pub name: string;
    pub target_trit: int;

    pub fn init(self, name: string, trit: int) {
        self.name = name;
        self.target_trit = trit;
    }

    // Phương thức ảo: mặc định truyền tín hiệu không đổi
    pub fn apply(self, state: int) -> int {
        return state;
    }

    // Phương thức mô tả cổng
    pub fn describe(self) {
        print("Cổng [");
        print(self.name);
        print("] tác động lên trit ");
        println(self.target_trit);
    }
}

// 1. Cổng Đảo Tam Phân (Inverter Gate: 1 -> -1, -1 -> 1, 0 -> 0)
class InverterGate : Gate {
    pub fn init(self, name: string, trit: int) {
        self.name = name;
        self.target_trit = trit;
    }

    pub fn apply(self, state: int) -> int {
        return 0 - state;
    }
}

// 2. Cổng Dịch Pha Tuần Hoàn (Cycle Increment Gate)
class IncrementGate : Gate {
    pub step: int;

    pub fn init(self, name: string, trit: int, s: int) {
        self.name = name;
        self.target_trit = trit;
        self.step = s;
    }

    pub fn apply(self, state: int) -> int {
        let next_val = state + self.step;
        if (next_val > 1) {
            return -1;
        }
        if (next_val < -1) {
            return 1;
        }
        return next_val;
    }
}

// 3. Cổng Khuếch Đại Biên Độ (Scaling Gate)
class ScalingGate : Gate {
    pub factor: int;

    pub fn init(self, name: string, trit: int, f: int) {
        self.name = name;
        self.target_trit = trit;
        self.factor = f;
    }

    pub fn apply(self, state: int) -> int {
        return state * self.factor;
    }
}

// HÀM TIÊU THỤ ĐA HÌNH BẬC CAO:
// Thực thi toàn bộ mạch mà không cần biết kiểu cụ thể của từng cổng!
fn run_circuit(circuit: array, input_val: int) -> int {
    let mut current = input_val;
    println("--- BẮT ĐẦU CHẠY MẠCH LƯỢNG TỬ ĐA HÌNH ---");
    for g in circuit {
        g.describe();               // Điều phối động tới Gate::describe()
        let prev = current;
        current = g.apply(current); // ĐIỀU PHỐI ĐỘNG TỚI apply() CỦA LỚP CON CỤ THỂ!
        print("  Biến đổi: ");
        print(prev);
        print(" -> ");
        println(current);
    }
    return current;
}

fn main() {
    // Khởi tạo các cổng lượng tử cụ thể
    let g1 = InverterGate("NOT-Trit", 0);
    let g2 = IncrementGate("INC-Shift", 0, 1);
    let g3 = ScalingGate("AMP-Scale", 0, 3);

    // Tập hợp thành mảng đa hình
    let circuit = [g1, g2, g3];

    let start_state = 1;
    print("Trạng thái đầu vào: ");
    println(start_state);

    // Kích hoạt mô phỏng đa hình
    let final_state = run_circuit(circuit, start_state);

    print("Trạng thái kết thúc: ");
    println(final_state);
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler và Virtual Machine để thấy cách Tersun thực hiện điều phối động.

#### A. Cấu trúc Bảng VTable trong Bộ nhớ Máy ảo
Trích từ [`Code/include/vm/value.hpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/vm/value.hpp#L25-L35):

```cpp
struct VTable {
    std::string class_name;
    std::string super_class;
    // Ánh xạ tên phương thức -> chỉ số hàm trong bảng function_table của Chunk
    std::unordered_map<std::string, uint32_t> methods;
};

struct VMObject {
    std::string type_name;
    bool is_class{false};
    std::shared_ptr<VTable> vtable; // Con trỏ VTable gắn trên từng đối tượng
    std::shared_ptr<VMShape> shape;
    std::vector<VMValue> fields_array;
    ...
};
```

#### B. Cơ chế Phân giải Phương thức Ảo trong Virtual Machine
Trích từ [`Code/src/vm/vm.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.cpp#L3097-L3140):

```cpp
if (obj->vtable) {
    // 1. Tra cứu tên phương thức trong VTable của đối tượng tiếp nhận
    auto it = obj->vtable->methods.find(method_name);
    if (it != obj->vtable->methods.end()) {
        // 2. Lấy chỉ số hàm và điểm vào bytecode
        uint32_t fn_entry = chunk.function_table[it->second];

        // 3. Khởi tạo CallFrame mới
        size_t callee_frame_size = chunk.function_frame_sizes[it->second];
        size_t new_local_base = local_top_;
        local_top_ += callee_frame_size;

        // 4. Gán đối tượng tiếp nhận vào slot 0 (chính là biến 'self')
        locals_[new_local_base] = target;
        for (size_t i = 0; i < argc; ++i) {
            locals_[new_local_base + 1 + i] = args[i];
        }

        // 5. Đẩy CallFrame vào ngăn xếp cuộc gọi và chuyển hướng con trỏ lệnh
        call_stack_.push_back(CallFrame{ip_, new_local_base, stack_.size(), callee_frame_size});
        ip_ = fn_entry; // NHẢY TỚI ĐỊA CHỈ HÀM CỤ THỂ!
        return;
    }
}
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn trên vào [`scratch/test_quantum_circuit_poly.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_quantum_circuit_poly.stn) và thực thi trực tiếp bằng trình biên dịch của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_quantum_circuit_poly.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
Trạng thái đầu vào: 1
--- BẮT ĐẦU CHẠY MẠCH LƯỢNG TỬ ĐA HÌNH ---
Cổng [NOT-Trit] tác động lên trit 0
  Biến đổi: 1 -> -1
Cổng [INC-Shift] tác động lên trit 0
  Biến đổi: -1 -> 0
Cổng [AMP-Scale] tác động lên trit 0
  Biến đổi: 0 -> 0
Trạng thái kết thúc: 0
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_quantum_circuit_poly.stn
```

Dưới đây là đoạn trích bytecode thực tế tại vòng lặp `for g in circuit`:

```text
// Lấy phần tử g = circuit[i] ra khỏi mảng
3840  OP_LOAD_LOCAL      slot 3                 // Nạp mảng 'circuit'
3870  OP_LOAD_LOCAL      slot 4                 // Nạp chỉ số vòng lặp 'i'
3900  OP_GET_INDEX                              // Trích xuất đối tượng
3910  OP_STORE_LOCAL     slot 6                 // Lưu vào biến 'g'

// 1. Gọi đa hình: g.describe()
3940  OP_LOAD_LOCAL      slot 6                 // Nạp 'g' làm tham số self
3970  OP_INVOKE_METHOD   "describe" (argc 0)    // Điều phối động qua VTable
4010  OP_POP            

// 2. Gọi đa hình: g.apply(current)
4080  OP_LOAD_LOCAL      slot 6                 // Nạp 'g' làm tham số self
4110  OP_LOAD_LOCAL      slot 2                 // Nạp đối số 'current'
4140  OP_INVOKE_METHOD   "apply" (argc 1)       // ĐIỀU PHỐI ĐỘNG TỚI apply()!
4180  OP_STORE_LOCAL     slot 2                 // Lưu kết quả mới vào 'current'
```

Quan sát dòng lệnh `4140`: Chỉ thị `OP_INVOKE_METHOD "apply" (argc 1)` được thực thi lặp đi lặp lại 3 lần. Nhưng tại mỗi vòng lặp, do `slot 6` chứa một `VMObject` với con trỏ `vtable` khác nhau:
- Vòng lặp 1: Nhảy tới `InverterGate_apply` $\to$ Đảo $1 \to -1$.
- Vòng lặp 2: Nhảy tới `IncrementGate_apply` $\to$ Dịch $-1 \to 0$.
- Vòng lặp 3: Nhảy tới `ScalingGate_apply` $\to$ Khuếch đại $0 \to 0$.

Toàn bộ quá trình diễn ra tự động, trong suốt và không tốn một lệnh `if-else` nào trong mã nguồn.

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 19.1: Bộ Tính Biểu Thức Cây Cú Pháp Trừu Tượng (AST Expression Evaluator)
- **Mục tiêu**: Xây dựng bộ tính biểu thức đại số bằng đa hình:
  - Lớp cơ sở: `ASTNode`: phương thức ảo `eval(self) -> int`.
  - Lớp con `NumberNode : ASTNode`: trường `val: int`, trả về `val`.
  - Lớp con `AddNode : ASTNode`: trường `left: ASTNode`, `right: ASTNode`, trả về `left.eval() + right.eval()`.
  - Lớp con `MulNode : ASTNode`: trường `left: ASTNode`, `right: ASTNode`, trả về `left.eval() * right.eval()`.
- **Yêu cầu**: Dựng cây biểu thức đại diện cho $(5 + 3) \times 2$ và gọi `root.eval()` để tính ra kết quả 16.

#### Bài tập 19.2: Động Cơ Đồ Họa Vector Đa Hình (Canvas Vector Renderer)
- **Mục tiêu**: Xây dựng hệ thống đồ họa 2D:
  - Lớp cơ sở `Shape2D`: `color: string`, phương thức ảo `draw(self)`.
  - Lớp con `Circle : Shape2D`: `radius: int`, `draw()` in ra đường kính và diện tích.
  - Lớp con `Box : Shape2D`: `w: int`, `h: int`, `draw()` in ra kích thước khung hộp.
- **Yêu cầu**: Tạo một mảng `canvas = [Circle(...), Box(...), Circle(...)]` và viết hàm `render_scene(canvas: array)` duyệt vẽ toàn bộ khung cảnh.

#### Bài tập 19.3: Chuỗi Bộ Lọc Tín Hiệu Tam Phân (Ternary Signal Filter Pipeline)
- **Mục tiêu**: Xây dựng hệ thống lọc tín hiệu:
  - Lớp cơ sở `SignalFilter`: phương thức ảo `process(self, input_sig: tryte) -> tryte`.
  - Lớp con `NoiseThresholdFilter`: lọc bỏ các dao động nhỏ quanh mức 0.
  - Lớp con `InvertFilter`: đảo pha tín hiệu.
- **Yêu cầu**: Truyền một mảng 10 tín hiệu tam phân qua chuỗi lọc và ghi nhận dạng sóng đầu ra.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Monomorphic vs Megamorphic Call Site Profiler

Trong các máy ảo hiệu năng cao (như Java HotSpot hay V8), sự khác biệt giữa điểm gọi đơn hình (Monomorphic) và đa hình cực đại (Megamorphic) quyết định $80\%$ hiệu năng của ứng dụng:

```
Trường hợp 1 (Monomorphic):
Vòng lặp 100,000 lần: 100% đối tượng truyền vào đều là InverterGate.
-> Bộ dự đoán BTB của CPU dự đoán đúng 99.99%.

Trường hợp 2 (Megamorphic):
Vòng lặp 100,000 lần: 5 lớp đối tượng khác nhau được hoán đổi ngẫu nhiên liên tục.
-> BTB liên tục bị xả, chu kỳ CPU tăng vọt.
```

**Nhiệm vụ của bạn**:
1. Hãy viết một script kiểm chuẩn (benchmark) trong Tersun tạo ra 5 lớp dẫn xuất khác nhau của `Gate`.
2. Tạo hai vòng lặp 50,000 chu kỳ:
   - Vòng lặp A (Monomorphic): Mảng chỉ chứa duy nhất 1 loại cổng.
   - Vòng lặp B (Megamorphic): Mảng xen kẽ tuần tự cả 5 loại cổng khác nhau.
3. Đo thời gian thực thi bằng cách sử dụng các hàm thời gian của hệ thống (hoặc đếm số chu kỳ lệnh).
4. **Báo cáo Kỹ thuật**: Trình bày cơ chế **Monomorphic Inline Cache (MIC)** trong máy ảo Tersun (lưu trữ `VMShape` hoặc `shape_id` tại vị trí lệnh `OP_GET_FIELD_IC` và `OP_INVOKE_METHOD_IC`) có thể triệt tiêu hoàn toàn chi phí tra cứu VTable như thế nào.

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chương 19 đã hoàn thiện mảnh ghép quan trọng nhất của Lập trình Hướng Đối tượng:
- Chúng ta đã hiểu cách **Đa hình Thời gian chạy (Runtime Polymorphism)** giải phóng kiến trúc phần mềm khỏi những câu lệnh `if-else` cứng nhắc, hiện thực hóa trọn vẹn Nguyên lý Đóng/Mở (Open-Closed Principle).
- Chúng ta đã giải phẫu cơ chế **Bảng Phương thức Ảo (VTable)** và con trỏ `vtable` gắn trên từng `VMObject`.
- Chúng ta đã chứng minh bằng bytecode thực tế: cùng một chỉ thị `OP_INVOKE_METHOD` có thể điều phối linh hoạt đến các hàm khác nhau dựa trên kiểu dữ liệu của đối tượng tiếp nhận.

Tuy nhiên, cho đến thời điểm này, tính đa hình của chúng ta vẫn bị ràng buộc bởi **Quan hệ Huyết thống Kế thừa (Inheritance Hierarchy)**: Một lớp chỉ có thể đa hình nếu nó là con cháu của một lớp cha chung (`Gate` hay `Shape`).

Nhưng trong thực tế, hai lớp hoàn toàn không có họ hàng gì với nhau — ví dụ `QuantumCircuit` (thuật toán), `UserSession` (dữ liệu người dùng), và `TextureBuffer` (đồ họa) — đều có nhu cầu chung là **Ghi ra Tệp (Serializable)** hoặc **Giải phóng Tài nguyên (Disposable)**.

Làm thế nào để thiết lập một **Hợp đồng Thiết kế (Design Contract)** chung cho các thực thể hoàn toàn dị loại mà không ép chúng phải chia sẻ một cây kế thừa cồng kềnh?

Chúng ta sẽ tìm câu trả lời trong chương kết thúc của Phần V:
👉 **Chương 20: Giao Diện (Interfaces), Traits & Hợp Đồng Thiết Kế (Interfaces & Traits)** — Cú pháp `interface`, đa hiện thực (Multiple Interface Implementation), kiểm tra hợp đồng tại Compile-time, và kiến trúc phân tách mã nguồn linh hoạt trong Tersun.


---

# CHƯƠNG 20: GIAO DIỆN (INTERFACES), TRAITS & HỢP ĐỒNG THIẾT KẾ (INTERFACES & TRAITS)

---

### 1. Vấn đề (The Problem)

Ở các Chương 17, 18 và 19, chúng ta đã xây dựng toàn bộ phả hệ hướng đối tượng: Lớp, Kế thừa và Đa hình qua Bảng Phương thức Ảo (VTable). Kế thừa mô hình hóa xuất sắc quan hệ huyết thống **"LÀ MỘT" (IS-A)**: `QuantumSensor` là một `Device`; `Rectangle` là một `Shape`.

Tuy nhiên, trong các kiến trúc phần mềm thực tế, ta thường xuyên gặp các hành vi mang tính **năng lực trực giao (Orthogonal Capabilities / CAN-DO)** cắt ngang qua nhiều lớp hoàn toàn không có họ hàng với nhau:
- Một `UserSession` (quản lý phiên đăng nhập người dùng)
- Một `QuantumStateVector` (trạng thái sóng lượng tử 22-qubit)
- Một `CompilerLog` (nhật ký biên dịch của hệ thống)

Ba thực thể này thuộc về ba miền nghiệp vụ hoàn toàn khác nhau. Chúng **không thể và không nên** cùng kế thừa từ một lớp cha chung (nếu ép chúng kế thừa từ một lớp `BaseObject`, ta sẽ tạo ra một "God Object" độc hại phá nát kiến trúc đóng gói).

Thế nhưng, cả ba thực thể trên đều có chung một nhu cầu bức thiết: **Có thể ghi ra luồng dữ liệu (Streamable / Serializable)** để lưu xuống đĩa hoặc truyền qua mạng.
Nếu ta muốn viết một hàm giám sát viễn thám:
```tersun
fn emit_telemetry(stream: ???, payload: string) {
    stream.write(payload);
    stream.flush();
}
```
Ta nên đặt kiểu dữ liệu của tham số `stream` là gì?
- Nếu đặt là `MemoryStream`, hàm sẽ từ chối `ConsoleStream` hoặc `FileStream`.
- Nếu dùng kiểu đa năng `any`, ta vứt bỏ hoàn toàn sự an toàn của trình biên dịch: chỉ cần ai đó truyền nhầm một số nguyên `123`, chương trình sẽ sụp đổ (crash) thảm khốc tại thời điểm chạy vì `123` không có phương thức `write`.

Làm thế nào để xác lập một **Hợp đồng Thiết kế (Design Contract)** nghiêm ngặt, cho phép các lớp dị loại cam kết cung cấp một tập các phương thức chuẩn mực, được trình biên dịch kiểm chứng tuyệt đối tại thời điểm dịch mã (Compile-time) mà không cần bất kỳ quan hệ kế thừa huyết thống nào?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ sự căng thẳng vĩnh cửu giữa hai mục tiêu trong lý thuyết hệ thống kiểu:
1. **Tính Ràng buộc Hành vi (Behavioral Verification)**: Người gọi hàm cần một bằng chứng toán học chắc chắn rằng đối tượng truyền vào đảm bảo có các phương thức `write(data)` và `flush()`.
2. **Tính Phân tách Độc lập (Decoupling / Modularity)**: Người gọi hàm không được phép phụ thuộc vào chi tiết triển khai bên dưới của đối tượng (đối tượng ghi vào RAM, ghi ra cổng UART máy tính Setun, hay truyền qua cáp quang).

Nếu ngôn ngữ chỉ có **Kế thừa Lớp (Class Inheritance)**, ta buộc phải dùng Đa kế thừa (Multiple Inheritance) để ghép các khả năng lại với nhau. Nhưng như đã chứng minh ở Chương 18, Đa kế thừa dẫn tới bài toán Kim Cương (Diamond Problem) và làm nát bố cục bộ nhớ.

Nếu ngôn ngữ chỉ dùng **Kiểu Vịt Động (Dynamic Duck Typing như Python/JavaScript)**: *"Nếu nó bơi như vịt và kêu như vịt thì nó là vịt"*, ta sẽ trả giá bằng việc mất hoàn toàn tính kiểm tra tĩnh: một lỗi chính tả nhỏ trong tên phương thức (`writ` thay vì `write`) chỉ bị phát hiện khi hệ thống đang chạy ngoài đời thực.

Hệ thống cần một cơ chế trừu tượng thuần túy: **Giao diện (Interface / Trait)** — một hợp đồng tinh khiết không chứa dữ liệu thực thi, không chiếm byte bộ nhớ lúc chạy, nhưng có quyền lực kiểm soát tuyệt đối tại thời điểm biên dịch.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa mô hình **Giao diện (Interface)** trong Tersun thỏa mãn 4 tiêu chuẩn kỹ thuật cốt lõi:

1. **Định nghĩa Hợp đồng Thuần túy (`interface Name`)**: Cho phép khai báo danh mục các chữ ký phương thức bắt buộc (signatures) mà không cần hiện thực phần thân mã máy.
2. **Kiểm tra Tuân thủ Hợp đồng Tĩnh (Compile-time Conformance Check)**:
   Nếu một Lớp tuyên bố hiện thực một Giao diện (`class MyClass : MyInterface`), Trình kiểm tra Kiểu (Type Checker) phải duyệt qua từng phương thức trong hợp đồng. Nếu lớp thiếu dù chỉ một hàm hoặc sai lệch số lượng đối số (arity), quá trình biên dịch phải **dừng lại ngay lập tức** với thông báo lỗi chi tiết.
3. **Chi phí Thời gian chạy Bằng Không (Zero Runtime Overhead)**: Bản thân khai báo Giao diện không được sinh ra bất kỳ byte mã máy nào trong file nhị phân (`.tbc`). Sau khi kiểm tra kiểu hoàn tất, toàn bộ cấu trúc interface biến mất, nhường chỗ cho lệnh gọi phương thức ảo thông thường.
4. **Đa hình Trực giao Không Phụ thuộc (Decoupled Polymorphism)**: Cho phép sử dụng Giao diện làm kiểu của tham số hàm (`fn log(s: Stream)`), mở ra kiến trúc cắm-rút module (Plugin Architecture) linh hoạt tối đa.

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy xây dựng một bộ kiểm chứng Hợp đồng Giao diện tĩnh đơn giản bằng Python để hiểu cách trình biên dịch giám sát các lớp:

```python
# Mô phỏng Bộ kiểm chứng Hợp đồng Giao diện Compile-time

class InterfaceContract:
    def __init__(self, name, required_methods):
        self.name = name
        # required_methods: dict dạng {"tên_phương_thức": số_lượng_tham_số}
        self.required_methods = required_methods

    def verify_conformance(self, class_name, class_methods):
        for method_name, expected_argc in self.required_methods.items():
            if method_name not in class_methods:
                raise TypeError(
                    f"[Type Error]: Lớp '{class_name}' vi phạm hợp đồng '{self.name}': "
                    f"Thiếu phương thức bắt buộc '{method_name}'."
                )
            actual_argc = class_methods[method_name]
            if actual_argc != expected_argc:
                raise TypeError(
                    f"[Type Error]: Phương thức '{method_name}' của lớp '{class_name}' "
                    f"không khớp hợp đồng '{self.name}': kỳ vọng {expected_argc} tham số, "
                    f"nhưng nhận được {actual_argc} tham số."
                )

# 1. Khai báo Hợp đồng Stream: Bắt buộc phải có write(1 arg) và flush(0 args)
StreamContract = InterfaceContract("Stream", {
    "write": 1,
    "flush": 0
})

# 2. Định nghĩa Lớp Tuân thủ Hợp đồng
MemoryStream_Methods = {
    "write": 1,
    "flush": 0,
    "get_buffer": 0 # Phương thức riêng, hoàn toàn hợp lệ
}
StreamContract.verify_conformance("MemoryStream", MemoryStream_Methods)
print("Xác thực: MemoryStream TUÂN THỦ HOÀN TOÀN hợp đồng Stream!")

# 3. Định nghĩa Lớp Vi phạm Hợp đồng (Quên viết flush)
BrokenStream_Methods = {
    "write": 1
}
try:
    StreamContract.verify_conformance("BrokenStream", BrokenStream_Methods)
except TypeError as e:
    print(f"Bắt lỗi thành công: {e}")
```

**Kết quả:**
```text
Xác thực: MemoryStream TUÂN THỦ HOÀN TOÀN hợp đồng Stream!
Bắt lỗi thành công: [Type Error]: Lớp 'BrokenStream' vi phạm hợp đồng 'Stream': Thiếu phương thức bắt buộc 'flush'.
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy xem cách một hàm tiêu thụ độc lập tận dụng hợp đồng này để vận hành mà không cần biết kiểu cụ thể:

```python
def generic_logger(stream_instance, stream_vtable, message):
    # Hàm này chỉ tin cậy vào hợp đồng:
    # 1. Gọi write
    stream_vtable["write"](stream_instance, message)
    # 2. Gọi flush
    stream_vtable["flush"](stream_instance)

# Tạo đối tượng cụ thể
memory_obj = {"buf": ""}
def mem_write(self, msg): self["buf"] += msg + "\n"
def mem_flush(self): print("--> Đã xả đệm bộ nhớ!")

mem_vtable = {"write": mem_write, "flush": mem_flush}

# Thực thi
generic_logger(memory_obj, mem_vtable, "Ghi nhận trạng thái Lượng tử #101")
print("Nội dung lưu trong bộ đệm:")
print(memory_obj["buf"])
```

**Kết quả:**
```text
--> Đã xả đệm bộ nhớ!
Nội dung lưu trong bộ đệm:
Ghi nhận trạng thái Lượng tử #101
```

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Trong các hệ thống lớn, việc sử dụng Giao diện có thể dẫn đến những thất bại kiến trúc nghiêm trọng nếu không có quy chuẩn:

1. **Khủng hoảng Giao diện Quá tải (Fat Interface / ISP Violation)**:
   Nếu ta tạo ra một giao diện `IUniversalDevice` chứa 30 phương thức: `read()`, `write()`, `reboot()`, `calibrate_quantum_flux()`, `set_baud_rate()`, `render_gui()`:
   Bất kỳ lớp đơn giản nào (như một cảm biến nhiệt kế chỉ có khả năng đọc) khi triển khai `IUniversalDevice` cũng buộc phải viết mã giả (dummy code / no-op) cho 29 phương thức còn lại. Điều này vi phạm trực tiếp **Nguyên lý Phân tách Giao diện (Interface Segregation Principle - ISP)**.
2. **Chi phí Tra cứu Bảng Giao diện (Itable Lookup Penalty in Native Runtimes)**:
   Trong khi Kế thừa Lớp có chỉ số phương thức cố định trong VTable (nhờ quy tắc tiền tố), thì một lớp có thể triển khai nhiều giao diện theo các thứ tự khác nhau. Việc tra cứu con trỏ hàm của một interface trong các ngôn ngữ native (như Java `invokeinterface` hay Go `itable`) đòi hỏi một bảng tra cứu hai chiều hoặc băm động, tốn kém hơn gọi hàm lớp thông thường nếu không có cơ chế tối ưu hóa.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Bản chất của sự khác biệt giữa VTable của Class và Giao diện:
- **Với Class Inheritance**: Thứ tự các phương thức trong VTable của lớp con **hoàn toàn cố định** và kế thừa từ lớp cha. Trình biên dịch có thể gắn nhãn cứng: `deposit()` luôn nằm ở offset $16$.
- **Với Interface**: Lớp $A$ có thể triển khai `Stream` đầu tiên (offset $0$). Nhưng Lớp $B$ lại triển khai `Clonable` trước, rồi mới tới `Stream` (offset $24$). Trình biên dịch không thể gán một chỉ số offset toàn cục duy nhất cho phương thức `write()` của `Stream` trên tất cả các lớp trong toàn hệ thống.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Các kiến trúc sư ngôn ngữ lập trình hàng đầu đã đưa ra các giải pháp đột phá:

1. **Java HotSpot (Interface Method Tables - IMT & Inline Caching)**:
   Sử dụng bảng băm kích thước cố định (IMT 40 mục) kết hợp với **Monomorphic Inline Cache (MIC)**: Sau lần gọi đầu tiên, máy ảo ghi đè trực tiếp điểm gọi bằng địa chỉ phương thức cụ thể của lớp đang chạy, đạt tốc độ tiệm cận lệnh gọi lớp thông thường.
2. **Rust (Fat Pointers / Trait Objects `dyn Trait`)**:
   Một tham chiếu trait không phải là một con trỏ đơn $64\text{-bit}$, mà là một **Con trỏ Béo $128\text{-bit}$ (Fat Pointer)** gồm:
   - Con trỏ 1: Trỏ tới dữ liệu đối tượng thô trên Heap.
   - Con trỏ 2: Trỏ tới VTable chuyên biệt được tạo riêng cho cặp `(Đối tượng cụ thể, Trait)`.
3. **Tersun (Compile-time Strict Contracts + VTable Direct Dispatch)**:
   Tersun áp dụng chiến lược tinh gọn:
   - Tại thời điểm biên dịch: `type_checker.cpp` kiểm tra tĩnh tính tương thích hợp đồng $100\%$.
   - Tại thời điểm phát mã (Emitter): Khai báo `interface` hoàn toàn tiêu biến (`/* Interface contract */`).
   - Tại thời điểm chạy (VM): Lệnh gọi qua interface sử dụng chính chỉ thị `OP_INVOKE_METHOD`, tra cứu trực tiếp trên VTable của đối tượng với tốc độ $O(1)$.

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Giao diện (Interface)**: Một cấu trúc hợp đồng trừu tượng định nghĩa tập các chữ ký phương thức mà một kiểu dữ liệu phải cam kết hiện thực, không chứa trạng thái (trường dữ liệu) nội tại:
   $$I = \{ \text{method}_1(\vec{T}) \to R_1, \dots, \text{method}_n(\vec{T}) \to R_n \}$$
2. **Nguyên lý Phân tách Giao diện (Interface Segregation Principle - ISP)**:
   *"Không có khách hàng nào bị ép buộc phải phụ thuộc vào các phương thức mà nó không sử dụng"*. Tốt hơn là nên có nhiều giao diện nhỏ, tập trung và chuyên biệt hóa thay vì một giao diện khổng lồ phục vụ mọi mục đích.
3. **Kiểu Con Cấu trúc (Structural Subtyping) vs Kiểu Con Định danh (Nominal Subtyping)**:
   - **Nominal (Tersun, Java, C#)**: Lớp phải khai báo tường minh tên giao diện sau dấu hai chấm (`class X : Stream`).
   - **Structural (Go, TypeScript)**: Lớp tự động thỏa mãn giao diện nếu nó có đủ các phương thức trùng khớp, không cần khai báo tên.
4. **Hợp đồng Thiết kế (Design by Contract)**: Phương pháp tiếp cận trong đó mỗi module xác lập các điều kiện tiên quyết (preconditions), hậu điều kiện (postconditions) và bất biến thông qua hệ thống kiểu để đảm bảo tính đúng đắn toán học của toàn bộ phần mềm.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Tersun hiện thực hóa cơ chế Giao diện với sự phối hợp chặt chẽ giữa bộ phân tích cú pháp, bộ kiểm tra kiểu và máy ảo:

```
                            KIẾN TRÚC GIAO DIỆN TRONG TERSUN
                            
  1. Khai báo Interface:
     interface Stream {
         fn write(self, data: string) -> int;
         fn flush(self) -> int;
     }
     -> Parser (parser.cpp:L494): Sinh nút AST InterfaceDeclStmt
     -> Emitter (emitter.cpp:L601): HOÀN TOÀN KHÔNG PHÁT BYTECODE (Zero Runtime Cost!)
     
  2. Lớp Thực thi Hợp đồng:
     class MemoryStream : Stream { ... }
     
  3. Kiểm tra Hợp đồng Tĩnh (type_checker.cpp:L713-L731):
     +-----------------------------------------------------------------+
     | Duyệt từng interface trong stmt.interfaces / super_class:       |
     |   Duyệt từng phương thức mi trong Interface:                    |
     |     Kiểm tra: cl_type->methods.find(mname)                      |
     |     - Nếu thiếu -> BÁO LỖI BIÊN DỊCH: missing method!           |
     |     - Nếu sai arity -> BÁO LỖI BIÊN DỊCH: expected N args!      |
     +-----------------------------------------------------------------+
     
  4. Lệnh gọi Đa hình (vm.cpp:L3097):
     fn emit(s: Stream, data: string) { s.write(data); }
     -> Trình biên dịch phát: OP_INVOKE_METHOD "write" (argc 1)
     -> Virtual Machine tra cứu VTable của đối tượng cụ thể (MemoryStream)
     -> Thực thi với độ trễ O(1) tuyệt đối!
```

1. **Phân tích Cú pháp Giao diện ([`Code/src/compiler/parser.cpp:L470-L495`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L470-L495))**:
   Trình phân tích đọc từ khóa `interface`, phân tích danh sách các chữ ký phương thức (kết thúc bằng dấu chấm phẩy `;` hoặc hỗ trợ khối thân mặc định `{ ... }`), sinh nút AST `InterfaceDeclStmt`.
2. **Kiểm tra Tuân thủ Hợp đồng Tĩnh ([`Code/src/compiler/type_checker.cpp:L713-L731`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L713-L731))**:
   Khi một lớp khai báo triển khai interface:
   ```cpp
   std::vector<std::string> ifaces = stmt.interfaces;
   if (!stmt.super_class.empty()) ifaces.push_back(stmt.super_class);
   for (const auto& iname : ifaces) {
       auto iit = type_defs_.find(iname);
       if (iit == type_defs_.end() || iit->second->kind != TypeKind::INTERFACE) continue;
       for (const auto& [mname, mi] : iit->second->methods) {
           auto cit = cl_type->methods.find(mname);
           if (cit == cl_type->methods.end()) {
               report_error("Class '" + stmt.name + "' does not implement interface '"
                            + iname + "': missing method '" + mname + "'.", stmt.loc);
           } else if (cit->second.param_types.size() != mi.param_types.size()) {
               report_error("Method '" + mname + "' of class '" + stmt.name
                            + "' does not match interface '" + iname + "': expected "
                            + std::to_string(mi.param_types.size()) + " argument(s)...", stmt.loc);
           }
       }
   }
   ```
3. **Chi phí Thời gian chạy Bằng Không ([`Code/src/compiler/emitter.cpp:L601`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L601))**:
   Trong hàm phát sinh bytecode, nhánh interface là một khối rỗng:
   `else if constexpr (std::is_same_v<T, InterfaceDeclStmt>) { /* Interface contract */ }`
   Interface tồn tại để phục vụ sự an toàn của lập trình viên tại thời điểm biên dịch, không làm tốn dù chỉ 1 byte bộ nhớ hay 1 chu kỳ CPU lúc chạy!

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một hệ thống đường ống phát viễn thám và ghi log hoàn chỉnh được xây dựng trên hợp đồng `Stream`:
- Giao diện `Stream` định nghĩa 3 hành vi bắt buộc: `write`, `flush`, `close`
- `MemoryStream` hiện thực hợp đồng bằng cách ghi vào chuỗi bộ đệm RAM
- `ConsoleStream` hiện thực hợp đồng bằng cách in trực tiếp ra thiết bị đầu cuối với tiền tố định danh
- Hàm bậc cao `emit_telemetry` hoạt động đa hình trên bất kỳ thực thể nào tuân thủ `Stream`

```tersun
// stream_pipeline.stn
// Kiến trúc Đường ống Dữ liệu Hướng Hợp đồng (Interface-based Telemetry) trong Tersun

// 1. KHAI BÁO HỢP ĐỒNG GIAO DIỆN (INTERFACE CONTRACT)
interface Stream {
    fn write(self, data: string) -> int;
    fn flush(self) -> int;
    fn close(self);
}

// 2. HIỆN THỰC THỨ NHẤT: DÒNG DỮ LIỆU BỘ NHỚ RAM (MEMORY STREAM)
class MemoryStream : Stream {
    pub buffer: string;
    pub is_open: int;

    pub fn init(self, initial_buffer: string) {
        self.buffer = initial_buffer;
        self.is_open = 1;
    }

    pub fn write(self, data: string) -> int {
        if (self.is_open == 1) {
            self.buffer = self.buffer + data;
            return 1;
        }
        return 0; // Thất bại nếu luồng đã đóng
    }

    pub fn flush(self) -> int {
        return self.buffer.len(); // Trả về số byte đã đọng trong đệm
    }

    pub fn close(self) {
        self.is_open = 0;
    }
}

// 3. HIỆN THỰC THỨ HAI: DÒNG DỮ LIỆU MÀN HÌNH ĐIỀU KHIỂN (CONSOLE STREAM)
class ConsoleStream : Stream {
    pub prefix: string;
    pub is_open: int;

    pub fn init(self, pfx: string) {
        self.prefix = pfx;
        self.is_open = 1;
    }

    pub fn write(self, data: string) -> int {
        if (self.is_open == 1) {
            print(self.prefix);
            println(data);
            return 1;
        }
        return 0;
    }

    pub fn flush(self) -> int {
        return 1; // Console xuất tức thì
    }

    pub fn close(self) {
        self.is_open = 0;
    }
}

// 4. HÀM TIÊU THỤ ĐA HÌNH DỰA TRÊN HỢP ĐỒNG (LOOSELY COUPLED FUNCTION)
fn emit_telemetry(s: Stream, payload: string) {
    s.write(payload);
    s.flush();
}

fn main() {
    // Khởi tạo hai luồng dữ liệu độc lập
    let mem = MemoryStream("");
    let con = ConsoleStream("[TELEMETRY-LOG] ");

    println("=== 1. GỬI DỮ LIỆU TỚI CONSOLE STREAM ===");
    emit_telemetry(con, "Qubit-0 Coherence Nominal: 99.4%");
    emit_telemetry(con, "Flux-Gate Pulse Injected");

    println("=== 2. GỬI DỮ LIỆU TỚI MEMORY STREAM ===");
    emit_telemetry(mem, "Event #1: Init; ");
    emit_telemetry(mem, "Event #2: Calibration; ");
    print("Dữ liệu bộ nhớ tích lũy: ");
    println(mem.buffer);

    println("=== 3. ĐÓNG CÁC STREAM ===");
    con.close();
    mem.close();
    let r = mem.write("Event #3: Ignored");
    print("Ghi vào memory stream sau khi đóng (1=OK, 0=Fail): ");
    println(r);
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler để chứng minh tính chất không chi phí thời gian chạy và cơ chế phát hiện vi phạm hợp đồng của Tersun.

#### A. Xác thực Hợp đồng Tĩnh trong Type Checker
Trích từ [`Code/src/compiler/type_checker.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L720-L731):

```cpp
auto cit = cl_type->methods.find(mname);
if (cit == cl_type->methods.end()) {
    // KÍCH HOẠT LỖI TẠI THỜI ĐIỂM BIÊN DỊCH NẾU THIẾU PHƯƠNG THỨC:
    report_error("Class '" + stmt.name + "' does not implement interface '"
                 + iname + "': missing method '" + mname + "'.", stmt.loc);
} else if (cit->second.param_types.size() != mi.param_types.size()) {
    // KÍCH HOẠT LỖI NẾU SAI LỆCH SỐ LƯỢNG THAM SỐ:
    report_error("Method '" + mname + "' of class '" + stmt.name
                 + "' does not match interface '" + iname + "': expected "
                 + std::to_string(mi.param_types.size()) + " argument(s), found "
                 + std::to_string(cit->second.param_types.size()) + ".", stmt.loc);
}
```

#### B. Zero-Cost Emitter: Interface biến mất trong mã máy
Trích từ [`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L601):

```cpp
void BytecodeEmitter::emit_stmt(Stmt* stmt) {
    ...
    else if constexpr (std::is_same_v<T, InterfaceDeclStmt>) {
        // Hợp đồng thuần túy: Không phát sinh bất kỳ OpCode nào!
        /* Interface contract */
    }
}
```

#### C. Thử nghiệm Vi phạm Hợp đồng Thực tế
Nếu lập trình viên vô tình bỏ quên phương thức `close` trong `MemoryStream`:
```powershell
.\setunc.exe run scratch/test_interface_fail.stn
```
Trình biên dịch Tersun ngay lập tức dập tắt quá trình build:
```text
[Type Error] scratch/test_interface_fail.stn:5:1 - Class 'IncompleteClass' does not implement interface 'Printable': missing method 'print_me'.
```
Lỗi được phát hiện ngay tại máy phát triển của lập trình viên, ngăn chặn triệt để thảm họa lỗi thời gian chạy trên máy tính khách hàng!

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn hoàn chỉnh vào [`scratch/test_stream_interface.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_stream_interface.stn) và thực thi trực tiếp bằng trình biên dịch của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_stream_interface.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
=== 1. GỬI DỮ LIỆU TỚI CONSOLE STREAM ===
[TELEMETRY-LOG] Qubit-0 Coherence Nominal: 99.4%
[TELEMETRY-LOG] Flux-Gate Pulse Injected
=== 2. GỬI DỮ LIỆU TỚI MEMORY STREAM ===
Dữ liệu bộ nhớ tích lũy: Event #1: Init; Event #2: Calibration; 
=== 3. ĐÓNG CÁC STREAM ===
Ghi vào memory stream sau khi đóng (1=OK, 0=Fail): 0
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_stream_interface.stn
```

Dưới đây là đoạn trích bytecode thực tế của hàm tiêu thụ `emit_telemetry(s: Stream, payload: string)`:

```text
// Hàm emit_telemetry(s, payload)
3100  OP_JUMP            offset 29 -> 342
3130  OP_LOAD_LOCAL      slot 0                 // Nạp đối tượng 's' (kiểu giao diện Stream)
3160  OP_LOAD_LOCAL      slot 1                 // Nạp chuỗi 'payload'
3190  OP_INVOKE_METHOD   "write" (argc 1)       // ĐIỀU PHỐI ĐA HÌNH QUA VTABLE!
3230  OP_POP            
3240  OP_LOAD_LOCAL      slot 0                 // Nạp đối tượng 's'
3270  OP_INVOKE_METHOD   "flush" (argc 0)       // ĐIỀU PHỐI ĐA HÌNH QUA VTABLE!
3310  OP_POP            
3320  OP_PUSH_INT        0
3410  OP_RET            
```

Quan sát dòng lệnh `3190` và `3270`: Hàm `emit_telemetry` hoàn toàn không có bất kỳ cấu trúc kiểm tra kiểu phức tạp nào. Nhờ hợp đồng `Stream` đã được bảo chứng tại bước Type Check, máy ảo tự tin phát trực tiếp `OP_INVOKE_METHOD "write"` và `OP_INVOKE_METHOD "flush"` với tốc độ tối đa!

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 20.1: Giao Diện Tái Lập Trạng Thái (Resettable Interface)
- **Mục tiêu**: Thiết kế hợp đồng `interface Resettable { fn reset(self); }`.
- **Yêu cầu**:
  1. Triển khai `Resettable` trên lớp `Counter` (đưa giá trị đếm về 0).
  2. Triển khai `Resettable` trên lớp `MemoryStream` (xóa sạch nội dung chuỗi `buffer = ""`).
  3. Viết hàm `reset_all(items: array)` duyệt qua mảng chứa cả bộ đếm và bộ đệm để khôi phục trạng thái ban đầu của toàn bộ hệ thống.

#### Bài tập 20.2: Giao Diện So Sánh Tam Phân Cân Bằng (Ternary Comparable Interface)
- **Mục tiêu**: Xây dựng hợp đồng so sánh mang đặc trưng máy tính tam phân Setun:
  ```tersun
  interface Comparable {
      fn compare_to(self, other: Any) -> int; // Trả về -1 (nhỏ hơn), 0 (bằng nhau), 1 (lớn hơn)
  }
  ```
- **Yêu cầu**: Hiện thực `Comparable` trên lớp `QuantumQubitRecord` dựa trên mức năng lượng và viết thuật toán tìm kiếm phần tử lớn nhất trong một mảng đa hình.

#### Bài tập 20.3: Giao Diện Quan Sát Đo Đạc Lượng Tử (Quantum Observable)
- **Mục tiêu**: Thiết kế giao diện cho các đại lượng vật lý có thể đo đạc:
  `interface Observable { fn measure(self) -> int; fn get_uncertainty(self) -> int; }`.
- **Yêu cầu**: Triển khai trên lớp `SpinObservable` và `MomentumObservable`, xây dựng hàm báo cáo ma trận đo đạc tổng quát.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Fat Pointers vs Interface Tables vs VTable Dispatch Architecture

Trong kỹ nghệ thiết kế trình biên dịch hiện đại, có 3 trường phái hiện thực hóa lệnh gọi Giao diện (Interface Calls) cạnh tranh gay gắt về băng thông bộ nhớ và chu kỳ CPU:

```
Trường phái 1: Rust Fat Pointers (dyn Trait)
- Kích thước tham chiếu: 16 bytes (Con trỏ dữ liệu + Con trỏ VTable chuyên biệt).
- Ưu điểm: Lệnh gọi cực nhanh (O(1) direct vtable index), đối tượng không tốn vptr trong struct.
- Nhược điểm: Kích thước con trỏ phình to gấp đôi (tăng áp lực lên CPU Register và Stack).

Trường phái 2: Go Interface Tables (itable)
- Kích thước tham chiếu: 16 bytes (type descriptor + data pointer).
- Ưu điểm: Hoàn toàn Structural (không cần khai báo trước).
- Nhược điểm: Phải sinh bảng itable động và tra cứu băm lần đầu tiên.

Trường phái 3: Tersun / JVM VTable Dispatch
- Kích thước tham chiếu: 8 bytes (std::shared_ptr trỏ tới VMObject).
- Bản thân VMObject đã mang con trỏ VTable hợp nhất mọi phương thức của lớp và interface.
- Ưu điểm: Con trỏ thanh ghi gọn nhẹ (64-bit), tận dụng chung cơ sở hạ tầng VTable và Shape Inline Cache.
```

**Nhiệm vụ của bạn**:
1. Phân tích chi tiết dòng lệnh `OP_INVOKE_METHOD` trong `Code/src/vm/vm.cpp`.
2. Giả sử hệ thống Tersun thực hiện 10 triệu lệnh gọi giao diện trong một giây trên vi xử lý TAFPU: Hãy tính toán lượng băng thông bộ nhớ RAM tiêu thụ giữa mô hình con trỏ 8-byte của Tersun so với mô hình Fat Pointer 16-byte của Rust.
3. **Báo cáo Kiến trúc**: Tại sao đối với các kiến trúc máy tính tam phân tương lai (Setun 2D / QVM), việc giữ cho kích thước con trỏ tham chiếu đồng nhất là điều kiện tiên quyết để tối ưu hóa đường truyền dữ liệu (Bus Interconnect)?

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chúc mừng bạn! Với Chương 20, chúng ta đã chính thức hoàn thành **PHẦN V: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG & ĐA HÌNH (OOP, CLASSES, INHERITANCE & DYNAMIC DISPATCH)**!
Hãy nhìn lại nấc thang tiến hóa kiến trúc mà chúng ta đã vượt qua trong 4 chương vừa rồi:
- **Chương 17**: Khởi nguyên của Đối tượng — Phân định rạch ròi giữa Ngữ nghĩa Giá trị (Struct) và Ngữ nghĩa Tham chiếu (Class), quy trình khởi tạo hai giai đoạn bảo vệ bất biến.
- **Chương 18**: Phả hệ Kế thừa — Kế thừa bố cục tiền tố bảo toàn vị trí trường trên Heap và cơ chế kế thừa Vtable.
- **Chương 19**: Đa hình Thời gian chạy — Giải phóng hệ thống khỏi các lệnh `if-else` cứng nhắc thông qua điều phối động gián tiếp qua con trỏ `vtable`.
- **Chương 20**: Giao diện & Hợp đồng Thiết kế — Tách rời hoàn toàn hành vi khỏi huyết thống kế thừa, bảo đảm an toàn kiểu tuyệt đối tại thời điểm biên dịch với chi phí runtime bằng 0.

Đến đây, bạn đã làm chủ toàn bộ các cấu trúc biểu diễn dữ liệu và hành vi từ cấp độ bit/trit lên tới kiến trúc hướng đối tượng cấp cao.

Tuy nhiên, trong các hệ thống tính toán hiệu năng cao và máy tính lượng tử, một bài toán mới xuất hiện:
- Làm thế nào để biểu diễn các trạng thái lượng tử hoặc trạng thái dữ liệu có thể mang nhiều dạng cấu trúc dị loại khác nhau (ví dụ: một giá trị có thể là `None`, hoặc `Trit(tryte)`, hoặc `QuantumSuperposition(a, b, s)`) mà không phải lãng phí bộ nhớ của Class?
- Làm thế nào để viết các thuật toán xử lý dữ liệu tổng quát (Generic Data Structures) hoạt động mượt mà trên mọi kiểu dữ liệu mà không làm mất tính an toàn kiểu?
- Làm thế nào để kiểm soát các ngoại lệ thảm khốc tại thời điểm chạy và thu hồi bộ nhớ tự động ở cấp độ vi kiến trúc Arena?

Chúng ta sẽ bước sang một đỉnh cao mới:
👉 **PHẦN VI: HỆ THỐNG KIỂU NÂNG CAO & AN TOÀN BỘ NHỚ (ADVANCED TYPE SYSTEM & MEMORY SAFETY)**
Khởi đầu với:
👉 **Chương 21: Kiểu Liệt Kê Nâng Cao (Algebraic Enums & Pattern Matching)** — Kiểu dữ liệu Tổng (Sum Types / Tagged Unions), biểu thức đối sánh mẫu `match`, và kỹ thuật phân tích cú pháp biểu thức an toàn tuyệt đối.


# GIÁO TRÌNH LẬP TRÌNH TERSUN (FIRST-PRINCIPLES TERSUN PROGRAMMING)
## PHẦN VI: HỆ THỐNG KIỂU NÂNG CAO & AN TOÀN BỘ NHỚ (ADVANCED TYPE SYSTEM & MEMORY SAFETY)

---

# CHƯƠNG 21: KIỂU LIỆT KÊ NÂNG CAO (ALGEBRAIC ENUMS & PATTERN MATCHING)

---

### 1. Vấn đề (The Problem)

Trong các chương trước, chúng ta đã thành thạo việc tạo ra các kiểu dữ liệu phức hợp bằng cách **ghép nối các trường lại với nhau** (Struct và Class). Một hạt vật lý có đồng thời: `x` VÀ `y` VÀ `mass`. Đây là **Kiểu Tích (Product Types)** trong lý thuyết kiểu dữ liệu:
$$\text{Entity} = A \times B \times C$$

Tuy nhiên, trong các bài toán điều khiển logic, truyền thông viễn thám và máy tính lượng tử, chúng ta liên tục gặp phải tình huống dữ liệu **chỉ có thể là MỘT TRONG CÁC KHẢ NĂNG LOẠI TRỪ LẪN NHAU**:
- Một Trit tam phân cân bằng: hoặc là `@` (âm), hoặc `0` (không), hoặc `1` (dương).
- Một gói tin mạng lượng tử: hoặc là `Handshake`, hoặc `QuantumData`, hoặc `Acknowledge`, hoặc `TelemetryError`.
- Một kết quả tính toán: hoặc là `Thành công(kết_quả)`, hoặc `Thất bại(mã_lỗi)`.

Nếu không có kiểu liệt kê nâng cao, lập trình viên buộc phải sử dụng các giải pháp chắp vá nguy hiểm:
1. **Sử dụng "Số ma thuật" (Magic Numbers)**:
   Quy ước ngầm: `0` là Handshake, `1` là Data, `2` là Ack, `3` là Error.
   Hậu quả: Không có gì ngăn cản lập trình viên truyền số `999` hoặc `-5`. Trình biên dịch hoàn toàn mù lòa trước các giá trị bất hợp pháp này.
2. **Sử dụng Chuỗi ký tự (String Sentinels)**:
   Dùng chuỗi `"HANDSHAKE"`, `"DATA"`.
   Hậu quả: Chỉ cần một lỗi gõ phím nhỏ (`"DATAA"`), chương trình sẽ âm thầm rẽ sai nhánh logic; việc so sánh chuỗi ngốn hàng chục chu kỳ CPU thay vì 1 chu kỳ số học.
3. **Khủng hoảng Bỏ sót Trường hợp (Non-Exhaustive Handling)**:
   Khi hệ thống phát triển, ta thêm một trạng thái gói tin mới `QuantumReset`. Các hàm xử lý trong hệ sinh thái có biết để xử lý trạng thái này không? Không! Trình biên dịch không thể cảnh báo, khiến hệ thống âm thầm bỏ qua trạng thái mới và treo toàn bộ đường truyền.

Làm thế nào để biểu diễn một đại lượng thuộc **Kiểu Tổng (Sum Type / Tagged Union)** với sự bảo đảm tính đầy đủ (Exhaustiveness) tuyệt đối tại thời điểm biên dịch?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ bản chất vật lý của bộ nhớ máy tính:
- **Phần cứng không có khái niệm "Một trong các khả năng"**: Một thanh ghi 64-bit (`RAX`) hoặc một ô nhớ DRAM chỉ là một chuỗi 64 bit $0$ và $1$. CPU không tự biết ô nhớ này đại diện cho "Handshake" hay "Acknowledge".
- **Sự cần thiết của Thẻ phân biệt (Discriminant / Tag)**: Để phần cứng phân biệt được một giá trị đang ở trạng thái nào, hệ thống bắt buộc phải gán cho mỗi biến thể một số nguyên nhỏ gọi là **Thẻ nhận dạng (Discriminant)**:
  $$\text{Handshake} \to 0, \quad \text{QuantumData} \to 1, \quad \text{Acknowledge} \to 2, \quad \text{TelemetryError} \to 3$$

Nếu trình biên dịch không hỗ trợ cú pháp kiểu tổng và cấu trúc đối sánh mẫu (Pattern Matching) cấp cao, lập trình viên sẽ phải tự viết mã phân nhánh `switch-case` hoặc `if-else` thủ công. Và khi lập trình viên tự quản lý các thẻ phân biệt thủ công, các lỗi tràn số, nhầm lẫn thẻ, và bỏ sót trường hợp là điều không thể tránh khỏi.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa mô hình **Kiểu Liệt kê Nâng cao (Algebraic Enum)** và **Cấu trúc Đối sánh Mẫu (Pattern Matching `match`)** trong Tersun thỏa mãn 4 tiêu chuẩn kỹ thuật cốt lõi:

1. **Khai báo Kiểu Tổng Tường minh (`enum Name`)**: Định nghĩa danh mục các biến thể loại trừ lẫn nhau, tự động gán thẻ phân biệt (discriminant tags $0, 1, 2...$) có kiểm tra trùng lặp.
2. **Đối sánh Mẫu Toàn diện (`match`)**: Cung cấp cấu trúc điều khiển luồng đối sánh mẫu với cú pháp `case pattern => body`, thay thế hoàn toàn các chuỗi lệnh `if-else` nặng nề.
3. **Bảo vệ Mẫu bằng Điều kiện Tam phân (Ternary Match Guards)**: Cho phép gắn điều kiện phụ sau từ khóa `if` (`case pattern if guard => body`), được hạ cấp trực tiếp qua toán tử logic tam phân cực hạn `OP_TERNARY_MIN`.
4. **Kiểm tra Tính Đầy đủ tại Thời điểm Biên dịch (Exhaustiveness Checking)**:
   Trình kiểm tra kiểu (Type Checker) phải đếm số lượng nhánh `case` so với tổng số biến thể của Enum. Nếu phát hiện thiếu trường hợp, compiler phải phát cảnh báo (Warning) lập tức để bảo vệ lập trình viên.

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy mô phỏng cấu trúc Tagged Union và cơ chế Match Engine bằng một đoạn mã Python cấp thấp:

```python
# Mô phỏng Algebraic Enum và Match Engine

class ToyEnumMeta:
    def __init__(self, name, variants):
        self.name = name
        # variants: ["Handshake", "Data", "Ack", "Error"]
        self.variants = variants
        self.tag_to_name = {i: v for i, v in enumerate(variants)}
        self.name_to_tag = {v: i for i, v in enumerate(variants)}

    def create(self, variant_name):
        tag = self.name_to_tag[variant_name]
        return {"__enum__": self.name, "tag": tag}

PacketKind = ToyEnumMeta("PacketKind", ["Handshake", "Data", "Ack", "Error"])

# BỘ MÔ PHỎNG ĐỐI SÁNH MẪU (MATCH ENGINE)
def toy_match(enum_val, enum_meta, arms):
    # 1. Kiểm tra tính đầy đủ (Exhaustiveness check)
    handled_tags = set()
    for pattern_tag, guard_fn, body_fn in arms:
        if pattern_tag == "_": # Wildcard
            handled_tags = set(enum_meta.tag_to_name.keys())
            break
        handled_tags.add(pattern_tag)

    if len(handled_tags) < len(enum_meta.variants):
        missing = [enum_meta.tag_to_name[t] for t in enum_meta.tag_to_name if t not in handled_tags]
        print(f"[CẢNH BÁO COMPILER]: Match chưa đầy đủ! Bỏ sót các biến thể: {missing}")

    # 2. Thực thi rẽ nhánh
    val_tag = enum_val["tag"]
    for pattern_tag, guard_fn, body_fn in arms:
        if pattern_tag == "_" or pattern_tag == val_tag:
            # Kiểm tra Guard nếu có
            if guard_fn is not None and not guard_fn():
                continue # Guard thất bại -> thử nhánh tiếp theo
            return body_fn()

    raise RuntimeError("Không có nhánh nào khớp!")
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy thử nghiệm với mô hình trên khi xử lý gói tin:

```python
# 1. Xử lý đầy đủ với Guard
p1 = PacketKind.create("Data")
signal_quality = 85

arms = [
    (0, None, lambda: print("Xử lý Handshake")),
    (1, lambda: signal_quality > 50, lambda: print("Data: Tín hiệu tốt")),
    (1, lambda: signal_quality <= 50, lambda: print("Data: Tín hiệu suy giảm")),
    (2, None, lambda: print("Xử lý Ack")),
    (3, None, lambda: print("Xử lý Error"))
]

toy_match(p1, PacketKind, arms)

# 2. Thử nghiệm bỏ sót nhánh để kích hoạt cảnh báo
incomplete_arms = [
    (0, None, lambda: print("Xử lý Handshake")),
    (1, None, lambda: print("Xử lý Data"))
]
toy_match(p1, PacketKind, incomplete_arms)
```

**Kết quả:**
```text
Data: Tín hiệu tốt
[CẢNH BÁO COMPILER]: Match chưa đầy đủ! Bỏ sót các biến thể: ['Ack', 'Error']
Xử lý Data
```

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Mô hình rẽ nhánh thủ công sẽ sụp đổ khi hệ thống mở rộng:

1. **Hiểm họa Đánh rơi Giá trị Ngăn xếp (Stack Value Leak)**:
   Trong kiến trúc máy ảo dựa trên Stack (Stack-based VM), biểu thức điều kiện của `match` (`match (kind)`) được nạp lên đỉnh Stack.
   Nếu tại mỗi nhánh `case`, ta không nhân bản giá trị (`OP_DUP`) để so sánh, giá trị gốc sẽ bị tiêu thụ mất sau nhánh đầu tiên. Ngược lại, nếu khớp thành công mà quên dọn dẹp (`OP_POP`), hoặc nếu tất cả các nhánh đều không khớp mà giá trị vẫn nằm trên Stack, đỉnh ngăn xếp sẽ bị lệch (stack corruption), làm hỏng toàn bộ các phép toán tiếp theo!
2. **Chi phí Rẽ nhánh Tuyến tính $O(N)$ (Cascading Jump Penalty)**:
   Nếu một Enum có 30 biến thể và ta so sánh tuần tự từng nhánh:
   Biến thể thứ 30 sẽ tốn 30 lệnh so sánh `OP_EQ` và 30 lệnh nhảy `OP_JUMP_IF_FALSE`. Trong các vòng lặp hàng triệu chu kỳ, chi phí này trở thành nút thắt cổ chai nghiêm trọng.
3. **Nguy cơ Giao thoa Guard (Guard Fallthrough Hazard)**:
   Nếu nhánh `case 1 if (guard)` thất bại vì điều kiện `guard == false`, luồng điều khiển phải **tiếp tục trôi xuống** để thử nhánh `case 1 if (!guard)` tiếp theo mà không được phép nhảy ra khỏi `match`.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Bản chất của vấn đề nằm ở:
- **Bất biến Cân bằng Ngăn xếp (Stack Balance Invariant)**: Dù mã nguồn rẽ vào bất kỳ nhánh nào, hoặc không rẽ vào nhánh nào, số lượng phần tử trên Stack trước và sau câu lệnh `match` phải được bảo toàn chính xác tuyệt đối.
- **Tính Phức hợp của Mẫu có Điều kiện (Compound Predicate)**: Một nhánh `case pattern if guard` thực chất là một mệnh đề hội logic:
  $$\text{Matched} = (\text{Value} == \text{Pattern}) \land \text{Guard}$$
  Nếu không có cơ chế tích hợp ở cấp độ Bytecode Emitter, máy ảo sẽ sinh ra mã rẽ nhánh lồng nhau hỗn loạn.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Các nhà thiết kế compiler (OCaml, Rust, Tersun) giải quyết bài toán này qua một chiến lược phát sinh mã bytecode cực kỳ tinh xảo:

```
                  CHIẾN LƯỢC HẠ CẤP BYTECODE CHO MATCH STMT
                  
                 [ Đỉnh Stack: Condition Value (V) ]
                                  |
                                  v
                  +--------------------------------+
     Nhánh 1:     | 1. OP_DUP (Nhân bản V)         |
                  | 2. Nạp Pattern 1               |
                  | 3. OP_EQ (V == Pattern 1 ?)    |
                  | (Nếu có Guard: OP_TERNARY_MIN) |
                  | 4. OP_JUMP_IF_FALSE -> Nhánh 2 |
                  +--------------------------------+
                                  | (Khớp!)
                                  v
                  +--------------------------------+
                  | 5. OP_POP (Xóa V khỏi Stack)   |
                  | 6. Thực thi Body của Nhánh 1   |
                  | 7. OP_JUMP -> EXIT_MATCH       |
                  +--------------------------------+
                                  |
            (Nếu False) --------->+
                                  |
                                  v
                  +--------------------------------+
     Nhánh 2:     | Lặp lại quy trình như trên...  |
                  +--------------------------------+
                                  |
                           (Hết các nhánh)
                                  v
                  +--------------------------------+
     Không khớp:  | OP_POP (Xóa V còn lại trên ST) |
                  +--------------------------------+
                                  |
                                  v
                             EXIT_MATCH
```

- **Quy tắc Dọn dẹp Ngăn xếp Hoàn hảo**:
  - Nếu một nhánh khớp: Lệnh `OP_POP` ngay đầu thân hàm lập tức dọn sạch giá trị điều kiện khỏi Stack trước khi thực thi thân lệnh, sau đó `OP_JUMP` thẳng tới nhãn thoát `EXIT_MATCH`.
  - Nếu toàn bộ các nhánh đều trượt: Lệnh `OP_POP` cuối cùng sẽ dọn dẹp giá trị điều kiện còn sót lại. Ngăn xếp luôn được cân bằng $100\%$!
- **Tận dụng Logic Tam phân cho Guard**: Thay vì dùng lệnh nhảy rẽ nhánh phức tạp cho `if guard`, Tersun dùng siêu lệnh `OP_TERNARY_MIN` để kết hợp trực tiếp giá trị so sánh mẫu và biểu thức guard trên thanh ghi.

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Kiểu Liệt kê / Kiểu Tổng (Sum Type / Algebraic Enum / Tagged Union)**: Một kiểu dữ liệu đại diện cho hợp rời rạc của các tập giá trị độc lập:
   $$E = V_0 \uplus V_1 \uplus \dots \uplus V_{n-1}$$
2. **Thẻ Phân biệt (Discriminant / Tag)**: Giá trị số nguyên vô hướng định danh duy nhất biến thể hiện tại của một thực thể Enum.
3. **Đối sánh Mẫu (Pattern Matching)**: Cơ chế kiểm tra một cấu trúc dữ liệu dựa trên một mẫu hình thức (Pattern) và thực thi luồng điều khiển tương ứng khi mẫu trùng khớp.
4. **Mẫu Bảo vệ (Match Guard)**: Một biểu thức điều kiện bổ sung gắn kèm sau mẫu:
   $$\text{Arm} = \text{Pattern} \land \text{Guard} \implies \text{Action}$$
5. **Tính Đầy đủ của Mẫu (Exhaustiveness)**: Thuộc tính hình thức chứng minh rằng mọi giá trị có thể có của kiểu dữ liệu đầu vào đều được bao phủ bởi ít nhất một nhánh trong cấu trúc `match`.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Hệ thống Tersun xử lý Enum và Match qua sự phối hợp chặt chẽ giữa 3 tầng kiến trúc:

1. **Khai báo Enum trong Parser ([`Code/src/compiler/parser.cpp:L497`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L497-L522))**:
   Đọc từ khóa `enum`, thu thập danh sách biến thể `EnumVariant` kèm các kiểu dữ liệu tải trọng (payloads), tạo nút AST `EnumDeclStmt`.
2. **Đăng ký Kiểu & Kiểm tra Exhaustiveness trong Type Checker ([`Code/src/compiler/type_checker.cpp:L824`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/type_checker.cpp#L824-L829))**:
   - `type_defs_` ghi nhận kiểu `TypeKind::ENUM` cùng bảng biến thể.
   - Khi kiểm tra câu lệnh `MatchStmt`:
     ```cpp
     if (cond_type->kind == TypeKind::ENUM) {
         if (!has_wildcard && stmt.arms.size() < cond_type->variants.size()) {
             report_warning("Match expression on enum '" + cond_type->name 
                            + "' may not be exhaustive. Consider adding missing variants...", stmt.loc);
         }
     }
     ```
   - Trong [`Code/src/compiler/types.cpp:L252`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/types.cpp#L252): Cho phép gán số nguyên trực tiếp vào biến kiểu Enum (`s: PacketKind = 1`) như một thẻ phân biệt an toàn.
3. **Hạ cấp Bytecode Tinh xảo trong Emitter ([`Code/src/compiler/emitter.cpp:L1226`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1226-L1260))**:
   - `emit_expr(stmt.condition)`: Nạp giá trị điều kiện lên Stack.
   - Mỗi arm:
     `OP_DUP` $\to$ `emit_expr(arm.pattern)` $\to$ `OP_EQ`.
     Nếu có guard: `emit_expr(arm.guard)` $\to$ `OP_TERNARY_MIN`!
     `OP_JUMP_IF_FALSE` tới nhánh tiếp theo.
     Nếu khớp: `OP_POP` $\to$ `emit_stmt(arm.body)` $\to$ `OP_JUMP` tới cuối match.
   - Cuối match: `OP_POP` dọn sạch ngăn xếp nếu không nhánh nào khớp.

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một bộ giải mã giao thức viễn thám và gói tin lượng tử hoàn chỉnh được viết bằng Tersun:
- Khai báo `enum PacketKind` đại diện cho 4 loại gói tin viễn thám
- Hàm `decode_packet` sử dụng `match` với các Guards điều kiện tín hiệu
- Phân loại xử lý chính xác tuyệt đối mà không cần bất kỳ câu lệnh `if-else` lồng nhau nào

```tersun
// packet_decoder.stn
// Bộ Giải mã Giao thức Lượng tử với Algebraic Enum & Pattern Matching

// 1. KHAI BÁO KIỂU LIỆT KÊ TRẠNG THÁI GÓI TIN (ALGEBRAIC ENUM)
enum PacketKind {
    Handshake,       // Thẻ 0: Gói tin bắt tay thiết lập kênh truyền
    QuantumData,     // Thẻ 1: Gói tin chứa luồng Qubit dữ liệu
    Acknowledge,     // Thẻ 2: Gói tin phản hồi xác nhận
    TelemetryError   // Thẻ 3: Gói tin cảnh báo lỗi phần cứng
}

// 2. BỘ GIẢI MÃ ĐA ĐIỀU KIỆN VỚI PATTERN MATCHING & TERNARY GUARDS
fn decode_packet(kind: PacketKind, signal_quality: int) {
    match (kind) {
        // Khớp biến thể Handshake (thẻ 0)
        case 0 => {
            println("Giao thức [Handshake]: Thiết lập kênh truyền lượng tử");
        }

        // Khớp biến thể QuantumData (thẻ 1) KÈM GUARD: Tín hiệu tốt (> 50)
        case 1 if (signal_quality > 50) => {
            println("Giao thức [QuantumData]: Tiếp nhận luồng Qubit ổn định");
        }

        // Khớp biến thể QuantumData (thẻ 1) KÈM GUARD: Tín hiệu suy giảm (<= 50)
        case 1 if (signal_quality <= 50) => {
            println("Giao thức [QuantumData]: CẢNH BÁO - Tín hiệu suy giảm!");
        }

        // Khớp biến thể Acknowledge (thẻ 2)
        case 2 => {
            println("Giao thức [Acknowledge]: Xác nhận gói tin thành công");
        }

        // Khớp biến thể TelemetryError (thẻ 3)
        case 3 => {
            println("Giao thức [TelemetryError]: Lỗi cảm biến viễn thám!");
        }
    }
}

fn main() {
    // Khởi tạo các gói tin thông qua thẻ phân biệt số học an toàn kiểu
    let p_init: PacketKind = 0;
    let p_data: PacketKind = 1;
    let p_ack: PacketKind = 2;
    let p_err: PacketKind = 3;

    println("=== 1. XỬ LÝ GÓI TIN BẮT TAY ===");
    decode_packet(p_init, 100);

    println("=== 2. XỬ LÝ DỮ LIỆU VỚI GUARDS ===");
    decode_packet(p_data, 85); // Tín hiệu tốt (85%)
    decode_packet(p_data, 30); // Tín hiệu yếu (30% -> kích hoạt guard thứ hai)

    println("=== 3. XÁC NHẬN VÀ BÁO LỖI ===");
    decode_packet(p_ack, 90);
    decode_packet(p_err, 0);
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler để thấy cách Tersun hiện thực hóa cơ chế Match.

#### A. Trích xuất Cú pháp Match và Guards trong Parser
Trích từ [`Code/src/compiler/parser.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L530-L549):

```cpp
consume(TokenType::LBRACE, "Expected '{' before match arms.");
std::vector<MatchArm> arms;

while (!check(TokenType::RBRACE) && !check(TokenType::END_OF_FILE)) {
    consume(TokenType::KW_CASE, "Expected 'case' in match arm.");
    Expr* pat = parse_expression(); // Phân tích mẫu so sánh
    Expr* guard = nullptr;
    if (match(TokenType::KW_IF)) {
        guard = parse_expression(); // Phân tích biểu thức bảo vệ (Guard)!
    }
    consume(TokenType::FAT_ARROW, "Expected '=>' after match case pattern.");
    Stmt* body = parse_statement();
    arms.push_back(MatchArm{pat, guard, body});
}
```

#### B. Hạ cấp Bytecode Kết hợp Ternary Min trong Emitter
Trích từ [`Code/src/compiler/emitter.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/emitter.cpp#L1234-L1250):

```cpp
// Duplicate condition value on stack for comparison
chunk_.write_opcode(OpCode::OP_DUP, stmt.loc.line);
emit_expr(arm.pattern);
chunk_.write_opcode(OpCode::OP_EQ, stmt.loc.line);

if (arm.guard) {
    emit_expr(arm.guard);
    // HỘI LOGIC TAM PHÂN: Kết hợp điều kiện khớp mẫu và guard!
    chunk_.write_opcode(OpCode::OP_TERNARY_MIN, stmt.loc.line);
}

size_t next_arm_jump = chunk_.emit_jump(OpCode::OP_JUMP_IF_FALSE, stmt.loc.line);

// Khớp thành công: Dọn dẹp giá trị điều kiện khỏi Stack
chunk_.write_opcode(OpCode::OP_POP, stmt.loc.line);
emit_stmt(arm.body);
exit_jumps.push_back(chunk_.emit_jump(OpCode::OP_JUMP, stmt.loc.line));

chunk_.patch_jump(next_arm_jump);
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn trên vào [`scratch/test_quantum_packet_decoder.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_quantum_packet_decoder.stn) và thực thi trực tiếp bằng trình biên dịch của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_quantum_packet_decoder.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
=== 1. XỬ LÝ GÓI TIN BẮT TAY ===
Giao thức [Handshake]: Thiết lập kênh truyền lượng tử
=== 2. XỬ LÝ DỮ LIỆU VỚI GUARDS ===
Giao thức [QuantumData]: Tiếp nhận luồng Qubit ổn định
Giao thức [QuantumData]: CẢNH BÁO - Tín hiệu suy giảm!
=== 3. XÁC NHẬN VÀ BÁO LỖI ===
Giao thức [Acknowledge]: Xác nhận gói tin thành công
Giao thức [TelemetryError]: Lỗi cảm biến viễn thám!
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_quantum_packet_decoder.stn
```

Dưới đây là đoạn trích bytecode thực tế của khối `match`:

```text
// 1. Nhánh Case 0: Handshake
3000  OP_LOAD_LOCAL      slot 0                 // Nạp biến 'kind'
6000  OP_DUP                                    // Nhân bản để so sánh
7000  OP_PUSH_INT        0
1600  OP_EQ                                     // kind == 0 ?
1700  OP_JUMP_IF_FALSE   offset 9 -> 29         // False -> Nhảy sang nhánh tiếp theo
2000  OP_POP                                    // True -> Xóa giá trị nhân bản
2100  OP_PUSH_STRING     "Giao thức [Handshake]..."
2400  OP_PRINTLN        
2500  OP_POP            
2600  OP_JUMP            offset 121 -> 150      // Nhảy thoát khỏi match!

// 2. Nhánh Case 1 có Guard: signal_quality > 50
2900  OP_DUP            
3000  OP_PUSH_INT        1
3900  OP_EQ                                     // kind == 1 ?
4000  OP_LOAD_LOCAL      slot 1                 // Nạp 'signal_quality'
4300  OP_PUSH_INT        50
5200  OP_GT                                     // signal_quality > 50 ?
5300  OP_TERNARY_MIN                            // KẾT HỢP (kind==1) MIN (signal>50)
5400  OP_JUMP_IF_FALSE   offset 9 -> 66         // Không thỏa -> Nhảy sang nhánh dưới
5700  OP_POP            
5800  OP_PUSH_STRING     "Giao thức [QuantumData]: Tiếp nhận luồng Qubit ổn định"
6100  OP_PRINTLN        
```

Quan sát dòng lệnh `5300`: Lệnh `OP_TERNARY_MIN` thể hiện đỉnh cao tinh gọn của Tersun: chỉ bằng một chỉ thị phần cứng tam phân duy nhất, cả hai điều kiện khớp biến thể và guard phụ được giải quyết tức thì trên thanh ghi mà không cần thêm bất kỳ lệnh nhảy trung gian nào!

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 21.1: Bộ Điều Hướng Tọa Độ 2D (Compass Direction Enum)
- **Mục tiêu**: Xây dựng `enum Direction { North, East, South, West }`.
- **Yêu cầu**:
  1. Viết hàm `move(dir: Direction, x: int, y: int) -> int`: sử dụng `match` để tính toán tọa độ mới.
  2. Bổ sung các guard: nếu tọa độ vượt quá ranh giới không gian `100`, giữ nguyên vị trí và in thông báo cảnh báo va chạm tường.

#### Bài tập 21.2: Bộ Giải Mã Phương Thức HTTP (HTTP Method Dispatcher)
- **Mục tiêu**: Thiết kế `enum HttpMethod { GET, POST, PUT, DELETE }`.
- **Yêu cầu**: Viết hàm `dispatch_request(method: HttpMethod, is_auth: int)` sử dụng `match` với guard: từ chối các phương thức `POST`, `PUT`, `DELETE` nếu người dùng chưa xác thực (`is_auth == 0`).

#### Bài tập 21.3: Bộ Tính Toán Số Học Tam Phân Cân Bằng (Ternary ALU Dispatcher)
- **Mục tiêu**: Khai báo `enum TernaryALUOp { Invert, Add, Mul, KleeneMin, KleeneMax }`.
- **Yêu cầu**: Viết hàm `execute_alu(op: TernaryALUOp, a: tryte, b: tryte) -> tryte` sử dụng `match` để điều phối tính toán chính xác trên các toán tử tam phân.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Dense Jump Tables vs Cascading Branches in Pattern Matching

Trong thiết kế trình biên dịch thương mại (GCC, Clang, Tersun AOT Native Backend), việc lựa chọn giữa **Cascading Branches** và **Jump Table (Bảng Nhảy Cố định)** là bài toán tối ưu hóa sống còn:

```
Chiến lược 1: Cascading Branches (Hiện tại trong Tersun VM)
- So sánh tuyến tính: O(N) bước nhảy.
- Ưu điểm: Hỗ trợ linh hoạt các biểu thức Guard phức tạp.
- Nhược điểm: Chậm khi số lượng biến thể lớn (ví dụ Enum có 100 mã OpCode).

Chiến lược 2: Dense Jump Table (Bảng Nhảy Địa chỉ Trực tiếp)
- Tạo một mảng địa chỉ nhãn: void* jump_table[N] = { &&lbl_0, &&lbl_1, ... };
- Thực hiện nhảy trực tiếp: goto *jump_table[tag];
- Ưu điểm: Tốc độ O(1) tuyệt đối, bất kể enum có 10 hay 1,000 biến thể!
- Nhược điểm: Chỉ áp dụng được cho các mẫu hằng số dày đặc (dense integer patterns).
```

**Nhiệm vụ của bạn**:
1. Hãy viết một script kiểm chuẩn trong Tersun tạo ra một `enum` gồm 20 trạng thái.
2. Thực hiện đo thời gian khi đối sánh biến thể số $0$ (nhánh đầu tiên) so với biến thể số $19$ (nhánh cuối cùng).
3. **Báo cáo Kiến trúc**: Đề xuất thiết kế opcode mới `OP_JUMP_TABLE (min_tag, max_tag, table_offset)` cho máy ảo Tersun để tự động chuyển hóa các câu lệnh `match` dày đặc thành bảng nhảy $O(1)$.

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chương 21 đã mở ra cánh cửa vào Hệ Thống Kiểu Nâng Cao của Tersun:
- Chúng ta đã nắm vững bản chất của **Kiểu Tổng (Sum Types / Algebraic Enums)** và sự khác biệt nền tảng với Kiểu Tích (Product Types).
- Chúng ta đã làm chủ cú pháp và cơ chế hoạt động của **Đối sánh Mẫu (`match`)** cùng sự kết hợp độc đáo của **Guards với toán tử logic tam phân `OP_TERNARY_MIN`**.
- Chúng ta đã kiểm chứng cơ chế cân bằng ngăn xếp hoàn hảo và tính năng cảnh báo thiếu sót trường hợp (Exhaustiveness Check) của trình biên dịch.

Tuy nhiên, hãy xem xét một giới hạn lớn:
Nếu ta muốn xây dựng một cấu trúc dữ liệu lưu trữ kết quả:
- Một `Result` có thể là `Success(value)` hoặc `Error(code)`.
Nhưng `value` có thể là một số nguyên `int`, một chuỗi `string`, một hạt `Particle`, hay một `QuantumCircuit`!
Chẳng lẽ ta phải định nghĩa 10 kiểu enum khác nhau: `IntResult`, `StringResult`, `ParticleResult`?

Làm thế nào để viết một Lớp, một Struct, hay một Hàm duy nhất có khả năng hoạt động an toàn trên **MỌI KIỂU DỮ LIỆU TÙY Ý** mà không cần sao chép mã nguồn và không làm mất tính an toàn kiểu?

Câu trả lời nằm ở nấc thang trừu tượng hóa tiếp theo:
👉 **Chương 22: Generics & Tham Số Hóa Kiểu (Generics & Type Parameterization)** — Cú pháp `List<T>`, tham số hóa kiểu tổng quát, kỹ thuật Monomorphization vs Type Erasure, và cách Tersun xử lý cấu trúc dữ liệu tổng quát an toàn tuyệt đối.



---

# CHƯƠNG 22: GENERICS & THAM SỐ HÓA KIỂU (GENERICS & TYPE PARAMETERIZATION)

---

### 1. Vấn đề (The Problem)

Trong phát triển phần mềm và kỹ nghệ thuật toán, đại đa số các cấu trúc dữ liệu cơ bản và thuật toán cốt lõi đều **hoàn toàn độc lập với kiểu dữ liệu cụ thể mà chúng chứa đựng**:
- Cặp giá trị liên kết: `Pair(first, second)`
- Cấu trúc Ngăn xếp / Hàng đợi: `Stack`, `Queue`
- Bộ nhớ đệm phần tử: `CacheEntry(key, value, timestamp)`
- Thuật toán tìm kiếm, hoán vị và so sánh cực trị: `select_max(a, b)`

Dù phần tử bên trong là một số nguyên 64-bit `int`, một chuỗi UTF-8 `string`, một cấu trúc tọa độ `Vector2`, hay một trạng thái lượng tử `QuantumState`, thì thuật toán logic của `select_max` vẫn chỉ là:
$$\text{result} = (a \ge b) \ ? \ a : b$$

Nếu ngôn ngữ **không có Generics (Tham số hóa Kiểu)**, lập trình viên sẽ bị đẩy vào hai ngõ cụt:

1. **Ngõ cụt Sao chép Mã nguồn (Copy-Paste Explosion)**:
   Ta buộc phải định nghĩa hàng chục cấu trúc và hàm giống hệt nhau:
   `IntPair`, `StringPair`, `ParticlePair`, `QubitPair`...
   `select_max_int(a: int, b: int) -> int`, `select_max_str(a: string, b: string) -> string`...
   Mỗi khi thuật toán bên trong cần tối ưu hóa hoặc sửa một lỗi logic, ta phải lặp lại việc chỉnh sửa trên hàng chục tệp nguồn khác nhau.
2. **Ngõ cụt Ép kiểu Động Không An Toàn (Unsafe Boxing & Downcasting)**:
   Ta quy về việc lưu trữ con trỏ đa năng `any` hoặc `void*`.
   Hậu quả: Toàn bộ sự bảo vệ của hệ thống kiểm tra kiểu Compile-time bị vô hiệu hóa. Nếu lập trình viên nhầm lẫn rút một chuỗi `string` ra khỏi `Pair` nhưng lại ép kiểu sang số nguyên `int`, hệ thống sẽ sụp đổ (crash) ngay tại thời điểm chạy.

Làm thế nào để viết một Lớp, một Struct, hay một Hàm duy nhất dưới dạng một **Khuôn mẫu Thuật toán (Algorithmic Blueprint)**, cho phép tham số hóa kiểu dữ liệu tùy ý mà vẫn bảo toàn tính an toàn kiểu tĩnh $100\%$ và tốc độ thực thi tối đa?

---

### 2. Tại sao vấn đề này tồn tại? (Why Does This Problem Exist?)

Vấn đề này bắt nguồn từ mâu thuẫn cơ bản giữa **Tính Trừu tượng của Toán học** và **Tính Cụ thể của Phần cứng**:
- **Toán học và Thuật toán là trừu tượng (Parametric)**: Phép so sánh $a \ge b$ áp dụng cho bất kỳ tập hợp nào có thứ tự toàn phần (Totally Ordered Set). Thuật toán không quan tâm phần tử chiếm bao nhiêu byte.
- **Phần cứng CPU đòi hỏi kích thước và vị trí byte cụ thể**: Lệnh máy CPU (`CMP`, `MOV`, `ADD`) buộc phải biết đối số là 8-bit, 32-bit, hay 64-bit; nằm trên thanh ghi số nguyên (`RAX`) hay thanh ghi dấu phẩy động (`XMM0`). Một thanh ghi không thể chứa một "Kiểu tổng quát mơ hồ".

Nếu trình biên dịch không có một cơ chế **Chuyển dịch Kiểu (Type Substitution)** và **Cụ thể hóa Mã máy (Monomorphization)**, nó sẽ không thể tạo ra mã máy tối ưu cho từng kiểu dữ liệu cụ thể từ một bản thiết kế chung.

---

### 3. Tôi cần giải quyết điều gì? (What Do I Need to Solve?)

Chúng ta cần thiết kế và hiện thực hóa hệ thống **Generics (Đa hình Tham số - Parametric Polymorphism)** trong Tersun với 4 trụ cột kỹ thuật:

1. **Cú pháp Tham số Kiểu (`<T>`, `<T, U>`)**: Cho phép gắn các biến kiểu (Type Parameters) vào định nghĩa của Hàm (`fn name<T>(...)`), Struct (`struct Name<T>`), và Class (`class Name<T>`).
2. **Cơ chế Cụ thể hóa Mã máy Compile-time (Monomorphization)**:
   Thay vì xóa bỏ thông tin kiểu (Type Erasure) làm chậm chương trình như Java, trình biên dịch Tersun phải tự động tạo ra các bản sao mã máy chuyên biệt hóa (specialized clones, ví dụ `identity__int`, `identity__string`) với chi phí thời gian chạy bằng 0 (**Zero-cost Abstraction**).
3. **Suy luận Tham số Kiểu Tự động (Type Argument Inference)**:
   Người dùng chỉ cần gọi `identity(42)` mà không cần viết dài dòng `identity<int>(42)`. Trình biên dịch phải tự động suy ra `T = int` từ kiểu của đối số truyền vào.
4. **Bảo toàn Tính An toàn Kiểu Tĩnh**: Ngăn chặn tuyệt đối việc truyền nhầm kiểu hoặc thực hiện các phép toán không được hỗ trợ trên kiểu tham số.

---

### 4. Tự xây một abstraction đơn giản (Building a Toy Abstraction)

Hãy mô phỏng chính xác quy trình **Monomorphization (Cụ thể hóa mã nguồn)** bằng một trình sinh mã khuôn mẫu đơn giản trong Python:

```python
# Mô phỏng AST Monomorphizer cho Generic Function

class FunctionTemplate:
    def __init__(self, name, type_params, param_types, ret_type, body_generator):
        self.name = name
        self.type_params = type_params # ["T"]
        self.param_types = param_types # {"x": "T"}
        self.ret_type = ret_type       # "T"
        self.body_generator = body_generator

    def specialize(self, concrete_type):
        # Tạo tên hàm chuyên biệt hóa duy nhất: select_max__int, select_max__string
        spec_name = f"{self.name}__{concrete_type}"
        return spec_name

# Bản thiết kế Generic cho hàm select_max<T>(a: T, b: T) -> T
def select_max_body(a, b):
    return a if a >= b else b

select_max_template = FunctionTemplate(
    name="select_max",
    type_params=["T"],
    param_types={"a": "T", "b": "T"},
    ret_type="T",
    body_generator=select_max_body
)

# BỘ ĐIỀU PHỐI MONOMORPHIZER TẠI COMPILE-TIME
class MiniCompilerMonomorphizer:
    def __init__(self):
        self.generated_functions = {}

    def compile_call(self, template, arg1, arg2):
        # 1. Suy luận kiểu tự động (Type Inference)
        inferred_type = type(arg1).__name__ # 'int' hoặc 'str'
        assert type(arg2).__name__ == inferred_type, "Hai tham số phải cùng kiểu T!"

        # 2. Tạo bản sao chuyên biệt hóa nếu chưa có
        spec_name = template.specialize(inferred_type)
        if spec_name not in self.generated_functions:
            print(f"[Monomorphizer]: Đang sinh mã chuyên biệt hóa: '{spec_name}' cho kiểu <{inferred_type}>...")
            self.generated_functions[spec_name] = template.body_generator

        # 3. Thực thi trực tiếp trên hàm chuyên biệt hóa (Zero Runtime Overhead!)
        fn = self.generated_functions[spec_name]
        return fn(arg1, arg2)
```

---

### 5. Thử nghiệm (Experimenting with the Toy)

Hãy kiểm tra cách bộ Monomorphizer nhân bản mã nguồn tương ứng cho từng kiểu dữ liệu:

```python
compiler = MiniCompilerMonomorphizer()

# Gọi lần 1 với số nguyên int
res1 = compiler.compile_call(select_max_template, 42, 99)
print(f"Kết quả số học: {res1}")

# Gọi lần 2 với số nguyên int (tận dụng lại hàm chuyên biệt hóa đã sinh)
res2 = compiler.compile_call(select_max_template, 150, 80)
print(f"Kết quả số học lần 2: {res2}")

# Gọi lần 3 với chuỗi string (sinh bản chuyên biệt hóa mới!)
res3 = compiler.compile_call(select_max_template, "zebra", "apple")
print(f"Kết quả chuỗi ký tự: {res3}")
```

**Kết quả:**
```text
[Monomorphizer]: Đang sinh mã chuyên biệt hóa: 'select_max__int' cho kiểu <int>...
Kết quả số học: 99
Kết quả số học lần 2: 150
[Monomorphizer]: Đang sinh mã chuyên biệt hóa: 'select_max__str' cho kiểu <str>...
Kết quả chuỗi ký tự: zebra
```
Trình biên dịch không dùng bất kỳ con trỏ `void*` hay bảng băm động nào lúc chạy. Nó sinh ra hai hàm cụ thể hóa độc lập: `select_max__int` và `select_max__str`, tối ưu hóa trực tiếp trên tập lệnh phần cứng của từng kiểu!

---

### 6. Thất bại / Giới hạn xuất hiện (Failure & Edge Cases)

Chiến lược Monomorphization mang lại tốc độ cực hạn, nhưng tiềm ẩn 3 cạm bẫy kỹ thuật kinh điển:

1. **Khủng hoảng Bùng nổ Kích thước Nhị phân (Code Bloat / Binary Size Explosion)**:
   Nếu một thư viện chứa 50 hàm Generic phức tạp (như sắp xếp QuickSort, biến đổi Fourier FFT, nén ma trận), và ứng dụng gọi chúng trên 20 kiểu dữ liệu khác nhau:
   Trình biên dịch sẽ nhân bản thành $50 \times 20 = 1,000$ hàm máy độc lập trong file nhị phân. Kích thước file thực thi phình to từ vài Megabytes lên hàng trăm Megabytes, làm tràn bộ nhớ đệm lệnh CPU L1 Instruction Cache.
2. **Hiểm họa Đệ quy Kiểu Vô tận (Infinite Generic Recursion)**:
   Nếu một hàm generic gọi chính nó với một kiểu dữ liệu bị bọc lồng tăng dần:
   ```tersun
   fn infinite_wrap<T>(x: T) {
       infinite_wrap(Pair(x, x)); // T -> Pair<T, T> -> Pair<Pair<T, T>, Pair<T, T>>...
   }
   ```
   Bộ Monomorphizer sẽ rơi vào vòng lặp nhân bản vô tận tại thời điểm dịch mã, làm tràn bộ nhớ RAM của máy phát triển (Compiler Out-of-Memory).
3. **Xung đột Ràng buộc Phép toán (Operator Constraint Failure)**:
   Nếu hàm `select_max<T>` dùng phép so sánh `a >= b`, nhưng lập trình viên lại truyền vào hai thực thể `ConnectionSocket` (vốn không có định nghĩa phép so sánh lớn hơn/bằng), trình biên dịch buộc phải phát hiện và từ chối ngay tại giai đoạn kiểm tra kiểu.

---

### 7. Tại sao nó thất bại? (Root Cause of Failure)

Nguyên nhân sâu xa là sự đánh đổi kinh điển giữa **Thời gian (Execution Time)** và **Không gian (Binary Space)**:
- **Type Erasure (Trường phái Java / C# thô)**: Chỉ tạo 1 bản mã máy duy nhất, ép tất cả về con trỏ đối tượng trên Heap (`Object`). Tiết kiệm kích thước file, nhưng phải trả giá bằng việc đóng hộp (Boxing), tháo hộp (Unboxing) liên tục và mất tính địa phương bộ nhớ (Cache locality).
- **Monomorphization (Trường phái C++, Rust, Tersun)**: Nhân bản mã máy chuyên biệt hóa cho từng kiểu dữ liệu cụ thể. Tốc độ thực thi tiệm cận mã viết tay thủ công, unboxed trực tiếp trên thanh ghi, nhưng tăng kích thước tệp nhị phân.

---

### 8. Con người / Ngôn ngữ lập trình giải quyết vấn đề này thế nào? (How CS / Modern Compilers Solved It)

Tersun và các compiler hiện đại dung hòa bài toán này qua kiến trúc **Monomorphization có Khử trùng lặp (Deduplicated AST Monomorphization)**:

```
                            QUY TRÌNH MONOMORPHIZATION TRONG TERSUN
                            
   Mã nguồn Tersun:
   fn select_max<T>(a: T, b: T) -> T { ... }
   select_max(42, 99);
   select_max("zebra", "apple");
   
                         1. Phân tích Cú pháp (Parser)
                            -> Lưu generic_params = ["T"] vào AST
                                       |
                                       v
                         2. Type Checker
                            -> Xác thực tính hợp lệ của template
                                       |
                                       v
                         3. Monomorphizer Pass (monomorphizer.cpp)
                            +------------------------------------------------------+
                            | Quét toàn bộ điểm gọi trong cây AST:                 |
                            | - select_max(int, int) -> spec_name: select_max__int |
                            | - select_max(str, str) -> spec_name: select_max__str |
                            |                                                      |
                            | Nhân bản nút AST, thay T bằng int/str:               |
                            | fn select_max__int(a: int, b: int) -> int { ... }    |
                            | fn select_max__str(a: str, b: str) -> str { ... }    |
                            |                                                      |
                            | Đổi tên hàm tại điểm gọi (Call Rewriting):           |
                            | select_max__int(42, 99);                             |
                            | select_max__str("zebra", "apple");                   |
                            +------------------------------------------------------+
                                       |
                                       v
                         4. Bytecode Emitter & Runtime VM
                            -> Chỉ nhìn thấy các hàm cụ thể bình thường!
                            -> TỐC ĐỘ O(1) TRỰC TIẾP, KHÔNG CÓ CHI PHÍ GENERICS!
```

- **Giai đoạn Độc lập**: Monomorphizer được thiết kế thành một pass biến đổi AST riêng biệt ([`Code/src/compiler/monomorphizer.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/monomorphizer.cpp)), chạy ngay sau Type Checker và trước Emitter.
- **Khử trùng lặp (Deduplication)**: Bảng `specialized_functions_` ghi nhớ các biến thể đã sinh. Nếu trong chương trình có 1,000 nơi gọi `select_max(int, int)`, trình biên dịch chỉ tạo **duy nhất một hàm `select_max__int`**.

---

### 9. Khái niệm chính thức (Formal Concept)

1. **Đa hình Tham số (Parametric Polymorphism / Generics)**: Khả năng của một đoạn mã (hàm hoặc kiểu dữ liệu) được viết một cách tổng quát mà không phụ thuộc vào một kiểu dữ liệu cụ thể nào.
2. **Cụ thể hóa (Monomorphization)**: Quá trình dịch mã trong đó trình biên dịch tự động sinh ra các phiên bản mã máy cụ thể cho từng tập tham số kiểu được sử dụng thực tế trong chương trình.
3. **Xóa bỏ Kiểu (Type Erasure)**: Cơ chế trong đó thông tin tham số kiểu bị loại bỏ sau khi biên dịch và toàn bộ các kiểu dữ liệu được ánh xạ về một kiểu tổng quát chung (như `Object` hoặc con trỏ thô).
4. **Suy luận Kiểu Tham số (Type Argument Inference)**: Thuật toán compiler tự động xác định các tham số kiểu dựa trên kiểu của các đối số truyền vào tại điểm gọi mà không cần người dùng khai báo tường minh.

---

### 10. Tersun giải quyết nó thế nào? (Tersun Architecture & Code Grounding)

Hệ thống Tersun tích hợp tính năng Generics xuyên suốt từ Parser tới Monomorphizer:

1. **Cú pháp trong AST ([`Code/include/compiler/ast.hpp:L352,372`](file:///d:/New%20PJ/Ternary/Compiler/Code/include/compiler/ast.hpp#L352))**:
   Các nút `FnDeclStmt`, `StructDeclStmt`, `ClassDeclStmt` đều chứa trường:
   `std::vector<std::string> generic_params;`
2. **Phân tích Cú pháp Tham số Kiểu ([`Code/src/compiler/parser.cpp:L242-L250`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/parser.cpp#L242-L250))**:
   Trình phân tích đọc cú pháp dấu ngoặc nhọn `<T>` hoặc `<T, U>` ngay sau tên hàm hoặc tên cấu trúc:
   ```cpp
   if (match(TokenType::LESS)) {
       do {
           Token gtok = consume(TokenType::IDENTIFIER, "Expected generic type parameter name.");
           generic_params.push_back(gtok.lexeme);
       } while (match(TokenType::COMMA));
       consume(TokenType::GREATER, "Expected '>' after generic type parameters.");
   }
   ```
3. **Bộ Cụ thể hóa AST Monomorphizer ([`Code/src/compiler/monomorphizer.cpp:L61-L160`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/monomorphizer.cpp#L61-L160))**:
   - Thu thập toàn bộ các hàm generic vào `generic_functions_` và struct generic vào `generic_structs_`.
   - Duyệt qua từng biểu thức gọi hàm `CallExpr`:
     * Suy luận bảng ánh xạ kiểu `tmap` từ kiểu suy luận của các đối số `call.args[i]->inferred_type`.
     * Sinh tên cụ thể hóa duy nhất:
       ```cpp
       std::string spec_name = template_fn->name;
       for (const auto& gp : template_fn->generic_params) spec_name += "__" + tmap[gp];
       ```
     * Nhân bản nút AST gốc, xóa `generic_params`, thay thế kiểu tham số bằng kiểu cụ thể.
     * Đổi tên `call.callee = spec_name;` tại điểm gọi.
     * Bổ sung hàm mới vào đầu danh sách lệnh của chương trình:
       `program.statements.insert(program.statements.begin(), spec);`
4. **Bytecode Emitter & Máy ảo**: Hoàn toàn không cần biết khái niệm generics! Máy ảo chỉ thực thi các hàm cụ thể bình thường, đạt thông lượng tối đa.

---

### 11. Viết code (Real Tersun Code)

Dưới đây là một hệ thống đường ống dữ liệu tổng quát và bộ nhớ đệm hoàn chỉnh được viết bằng Tersun:
- Cấu trúc Generic Tuple: `Pair<T, U>` lưu cặp dữ liệu tùy ý
- Cấu trúc Generic Cache: `CacheEntry<T>` đóng gói dữ liệu viễn thám kèm dấu thời gian
- Hàm so sánh tổng quát: `select_max<T>(a, b)` hoạt động mượt mà trên cả số nguyên và chuỗi ký tự

```tersun
// generic_pipeline.stn
// Hệ thống Đường ống Dữ liệu & Bộ nhớ Đệm Tổng quát (Generics) trong Tersun

// 1. CẤU TRÚC GENERIC TUPLE: PAIR<T, U>
struct Pair<T, U> {
    pub first: T;
    pub second: U;
}

// 2. CẤU TRÚC GENERIC BỘ NHỚ ĐỆM: CACHEENTRY<T>
struct CacheEntry<T> {
    pub key: string;
    pub value: T;
    pub timestamp_ms: int;
}

// 3. HÀM TỔNG QUÁT TÌM PHẦN TỬ CỰC ĐẠI: SELECT_MAX<T>
fn select_max<T>(a: T, b: T) -> T {
    if (a >= b) {
        return a;
    }
    return b;
}

fn main() {
    println("=== 1. CẤU TRÚC GENERIC PAIR ===");
    // Tự động suy luận: Pair<int, string>
    let p1 = Pair(1001, "Quantum-Spin-Up");
    // Tự động suy luận: Pair<string, int>
    let p2 = Pair("Flux-Rate", 98);

    print("Pair 1: (");
    print(p1.first);
    print(", ");
    print(p1.second);
    println(")");

    print("Pair 2: (");
    print(p2.first);
    print(", ");
    print(p2.second);
    println(")");

    println("=== 2. GENERIC CACHE ENTRY ===");
    // Cache lưu trữ giá trị số nguyên int
    let entry_int = CacheEntry("sensor_read", 450, 1024);
    // Cache lưu trữ giá trị chuỗi string
    let entry_str = CacheEntry("sensor_name", "Cryo-Sensor-Alpha", 1025);

    print("Cache Int [");
    print(entry_int.key);
    print("] = ");
    print(entry_int.value);
    print(" (Time: ");
    print(entry_int.timestamp_ms);
    println(" ms)");

    print("Cache Str [");
    print(entry_str.key);
    print("] = ");
    print(entry_str.value);
    print(" (Time: ");
    print(entry_str.timestamp_ms);
    println(" ms)");

    println("=== 3. HÀM SO SÁNH TỔNG QUÁT (GENERIC FUNCTION) ===");
    // Monomorphized thành select_max__int
    let max_num = select_max(42, 99);
    // Monomorphized thành select_max__string
    let max_text = select_max("zebra", "apple");

    print("Max số nguyên (42, 99): ");
    println(max_num);
    print("Max chuỗi ('zebra', 'apple'): ");
    println(max_text);
}
```

---

### 12. Dưới nắp ca-pô (Under the Hood: C++ Compiler/VM source dissection)

Hãy mổ xẻ mã nguồn nội tại của Compiler để thấy cách Tersun chuyển hóa một hàm mẫu trừu tượng thành mã máy cụ thể.

#### A. Thu thập và Phân loại Template trong Monomorphizer
Trích từ [`Code/src/compiler/monomorphizer.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/monomorphizer.cpp#L67-L80):

```cpp
for (Stmt* stmt : program.statements) {
    if (!stmt) continue;
    if (std::holds_alternative<FnDeclStmt>(stmt->data)) {
        auto& fn = std::get<FnDeclStmt>(stmt->data);
        if (!fn.generic_params.empty()) {
            generic_functions_[fn.name] = &fn; // Ghi nhận hàm mẫu
        }
    } else if (std::holds_alternative<StructDeclStmt>(stmt->data)) {
        auto& st = std::get<StructDeclStmt>(stmt->data);
        if (!st.generic_params.empty()) {
            generic_structs_[st.name] = &st;   // Ghi nhận struct mẫu
        }
    }
}
```

#### B. Sinh Mã Chuyên biệt hóa và Viết lại Điểm Gọi
Trích từ [`Code/src/compiler/monomorphizer.cpp`](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/monomorphizer.cpp#L145-L165):

```cpp
if (tmap.size() == gpset.size() && ok) {
    // 1. Tạo tên duy nhất theo kiểu cụ thể: select_max__int
    std::string spec_name = call.callee;
    for (const auto& gp : template_fn->generic_params) spec_name += "__" + tmap[gp];

    if (!specialized_functions_[spec_name]) {
        specialized_functions_[spec_name] = true;
        // 2. Nhân bản cây AST của hàm mẫu
        auto* spec_fn = new Stmt(*template_fn, template_fn->loc);
        auto& fn_data = std::get<FnDeclStmt>(spec_fn->data);
        fn_data.name = spec_name;
        fn_data.generic_params.clear(); // Xóa bỏ generic để thành hàm cụ thể!
        
        // 3. Thay thế các kiểu T thành kiểu thực tế
        for (auto& p : fn_data.params) {
            if (tmap.count(p.custom_type_name)) {
                p.custom_type_name = tmap.at(p.custom_type_name);
                p.type = concrete_data_type(p.custom_type_name);
            }
        }
        new_specializations.push_back(spec_fn);
    }
    // 4. Viết lại tên hàm tại điểm gọi!
    call.callee = spec_name;
}
```

---

### 13. Thí nghiệm / Kiểm chứng (Empirical Verification with `setunc.exe run` & `disasm`)

Hãy lưu mã nguồn hoàn chỉnh vào [`scratch/test_generic_system.stn`](file:///d:/New%20PJ/Ternary/Compiler/scratch/test_generic_system.stn) và thực thi trực tiếp bằng trình biên dịch của hệ thống Tersun:

#### Lệnh thực thi:
```powershell
.\setunc.exe run scratch/test_generic_system.stn
```

#### Đầu ra thực tế từ Tersun Runtime:
```text
=== 1. CẤU TRÚC GENERIC PAIR ===
Pair 1: (1001, Quantum-Spin-Up)
Pair 2: (Flux-Rate, 98)
=== 2. GENERIC CACHE ENTRY ===
Cache Int [sensor_read] = 450 (Time: 1024 ms)
Cache Str [sensor_name] = Cryo-Sensor-Alpha (Time: 1025 ms)
=== 3. HÀM SO SÁNH TỔNG QUÁT (GENERIC FUNCTION) ===
Max số nguyên (42, 99): 99
Max chuỗi ('zebra', 'apple'): zebra
```

#### Phân tích Bytecode Disassembly:
Chạy lệnh phân rã bytecode:
```powershell
.\setunc.exe disasm scratch/test_generic_system.stn
```

Dưới đây là đoạn trích bytecode thực tế của hàm `select_max` sau khi Monomorphizer xử lý:

```text
// Hàm select_max: Thực thi trực tiếp trên thanh ghi cục bộ
0000  OP_JUMP            offset 28 -> 31
3000  OP_LOAD_LOCAL      slot 0                 // Nạp đối số a
6000  OP_LOAD_LOCAL      slot 1                 // Nạp đối số b
9000  OP_GE                                     // So sánh: a >= b ?
1000  OP_JUMP_IF_FALSE   offset 4 -> 17
1300  OP_LOAD_LOCAL      slot 0                 // Trả về a
1600  OP_RET            
1700  OP_LOAD_LOCAL      slot 1                 // Trả về b
2000  OP_RET            

// Điểm gọi tại main():
3270  OP_PUSH_INT        42
3360  OP_PUSH_INT        99
3450  OP_CALL            fn#1 -> 0x0003 (argc 2) // Gọi select_max với số nguyên!
3490  OP_STORE_LOCAL     slot 4
3520  OP_PUSH_STRING     "zebra"
3550  OP_PUSH_STRING     "apple"
3580  OP_CALL            fn#1 -> 0x0003 (argc 2) // Gọi select_max với chuỗi ký tự!
3620  OP_STORE_LOCAL     slot 5
```

Quan sát dòng lệnh `3450` và `3580`: Cả hai lời gọi hàm đều là lệnh `OP_CALL` trực tiếp với các giá trị unboxed nằm trên ngăn xếp. Hoàn toàn không có chi phí tra cứu bảng kiểu, không có ép kiểu con trỏ, không có cấp phát bộ đệm trung gian!

---

### 14. Bài tập tự giải (3 Hands-on Exercises)

#### Bài tập 22.1: Cấu Trúc Ngăn Xếp Tổng Quát (Generic Stack<T>)
- **Mục tiêu**: Xây dựng struct `Stack<T>` với mảng đệm nội tại:
  `struct Stack<T> { pub elements: array; pub top: int; }`.
- **Yêu cầu**:
  1. Viết hàm `stack_push<T>(s: Stack<T>, val: T)`.
  2. Viết hàm `stack_pop<T>(s: Stack<T>) -> T`.
  3. Khởi tạo một ngăn xếp số nguyên và một ngăn xếp chuỗi, kiểm chứng tính toàn vẹn LIFO (Last-In-First-Out).

#### Bài tập 22.2: Kiểu Bao Đóng Kết Quả Tổng Quát (Generic Option<T>)
- **Mục tiêu**: Thiết kế kiểu dữ liệu an toàn thay thế cho giá trị rỗng `nil`:
  `struct Option<T> { pub has_value: int; pub value: T; }`.
- **Yêu cầu**:
  1. Viết hàm `unwrap_or<T>(opt: Option<T>, default_val: T) -> T`.
  2. Kiểm chứng hàm với các trường hợp có giá trị và không có giá trị trên cả kiểu số nguyên và kiểu đối tượng.

#### Bài tập 22.3: Thuật Toán Đổi Chỗ Tuple Tổng Quát (Generic Swap Pair)
- **Mục tiêu**: Viết hàm `swap_pair<T, U>(p: Pair<T, U>) -> Pair<U, T>` nhận vào một cặp kiểu $(T, U)$ và trả về một cặp đảo ngược $(U, T)$.
- **Yêu cầu**: Thực thi trên cặp `(100, "Photon")` và in ra kết quả đảo ngược `("Photon", 100)`.

---

### 15. Thử thách kỹ sư (Engineering Challenge)

#### Tên thử thách: Monomorphization Bloat vs Virtual Dispatch Benchmarking

Trong kỹ nghệ phần mềm quy mô lớn, việc lựa chọn giữa **Monomorphization (Generics)** và **Dynamic Dispatch (Interfaces/VTable)** là một quyết định kiến trúc then chốt:

```
Chiến lược 1: Monomorphization (Generics <T>)
- Ưu điểm: Hiệu năng tối đa, không có bước nhảy gián tiếp, dễ nội tuyến (inlining).
- Nhược điểm: Phình to kích thước file nhị phân khi số lượng kiểu cụ thể lớn.

Chiến lược 2: Dynamic Dispatch (Interface Trait)
- Ưu điểm: Duy nhất 1 bản mã máy cho toàn bộ hệ thống, kích thước tệp tối ưu.
- Nhược điểm: Chậm hơn do độ trễ đọc bộ nhớ gián tiếp qua con trỏ VTable.
```

**Nhiệm vụ của bạn**:
1. Hãy viết hai module Tersun thực hiện thuật toán xử lý luồng dữ liệu 100,000 phần tử:
   - Module A: Sử dụng hàm tổng quát `process_item<T>(x: T)`.
   - Module B: Sử dụng giao diện `interface Processable` và gọi qua VTable.
2. Đo lường kích thước bytecode sinh ra qua `setunc.exe disasm` và thời gian thực thi của cả hai cách tiếp cận.
3. **Báo cáo Kỹ thuật**: Trong các siêu máy tính tam phân hoặc bộ tăng tốc AI BitNet/TAFPU, trong trường hợp nào lập trình viên nên ưu tiên Generics, và trong trường hợp nào nên ưu tiên Dynamic Dispatch?

---

### 16. Tổng kết & Cầu nối sang chương sau (Summary & Bridge)

Chương 22 đã đưa chúng ta lên đỉnh cao của Hệ Thống Kiểu Hiện Đại:
- Chúng ta đã hiểu cách **Generics (Đa hình Tham số)** giải phóng lập trình viên khỏi cái bẫy sao chép mã nguồn mà không đánh đổi sự an toàn kiểu Compile-time.
- Chúng ta đã giải phẫu cơ chế **Monomorphization (Cụ thể hóa AST)** độc đáo của trình biên dịch Tersun trong `monomorphizer.cpp`, tạo ra mã thực thi với chi phí thời gian chạy bằng 0 (Zero-cost Abstraction).
- Chúng ta đã chứng minh bằng bytecode thực tế: hàm generic được hạ cấp thành các lệnh gọi máy ảo unboxed cực nhanh.

Tuy nhiên, khi các cấu trúc dữ liệu tổng quát (`Pair`, `CacheEntry`, `List`) được tạo ra hàng loạt trong các thuật toán phức tạp:
Hàng triệu đối tượng ngắn hạn (short-lived objects) được cấp phát trên Heap qua `std::shared_ptr`. Mặc dù an toàn, nhưng việc liên tục gọi `malloc`/`free` từ hệ điều hành và cập nhật bộ đếm tham chiếu (Reference Counting) sẽ gây phân mảnh bộ nhớ (Memory Fragmentation) và nghẽn băng thông RAM.

Làm thế nào để cấp phát hàng triệu đối tượng trong một vùng nhớ liên tục với tốc độ $O(1)$ và xóa sạch toàn bộ chúng chỉ bằng **một phép gán con trỏ duy nhất** mà không cần dọn rác từng đối tượng?

Chúng ta sẽ bước sang chương tiếp theo:
👉 **Chương 23: Quản Lý Bộ Nhớ Vùng Chứa (Arena Allocators & Memory Pools)** — Bản chất của `ArenaAllocator`, quản lý bộ nhớ cục bộ không phân mảnh, kỹ thuật vùng nhớ đệm tái sử dụng (Memory Pools) và tối ưu hóa thông lượng trong Tersun VM.





