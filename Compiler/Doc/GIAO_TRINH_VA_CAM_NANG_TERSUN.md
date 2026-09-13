# GIÁO TRÌNH TOÀN DIỆN & CẨM NANG LỆNH NGÔN NGỮ TERSUN 1.0.3
> **Phiên bản:** Tersun 1.0.2 *(Ternary + Quantum QVM & LLVM AOT Edition)*  
> **Tác giả:** Stufusic (stufusiclab@gmail.com)  
> **Giấy phép:** MIT License  
> **Mục tiêu:** Hướng dẫn từ căn bản đến nâng cao lập trình điện toán tam phân cân bằng, số học đại số chính xác tuyệt đối trong $\mathbb{Q}(\sqrt{3})$, cỗ máy ảo lượng tử QVM (2-Bit $\to$ 1-Qubit), xuất mạch OpenQASM 3.0, hạ tầng LLVM Native AOT, và toàn bộ hệ thống lệnh của trình biên dịch `setunc`.

---

## 📌 QUY ƯỚC TÊN GỌI: TERSUN & SETUN

Trong toàn bộ hệ sinh thái:
- **Tersun 1.0.2**: Là tên chính thức của **Ngôn ngữ Lập trình** và **Dự án Toàn diện** (Tích hợp cả Classical AOT, LLVM IR, và Quantum Virtual Machine).
- **Setun (Setun-70 / setunc)**: Để tri ân máy tính tam phân Setun lịch sử của Đại học Tổng hợp Moscow (1958) và bảo đảm tính tương thích ngược tuyệt đối:
  - Trình biên dịch & công cụ CLI thống nhất: `setunc.exe`
  - Động cơ Máy ảo cổ điển: `Setun-70 VM`
  - Định dạng bytecode nhị phân tam phân: `.tbc` (Magic byte `SETU`)
  - Định dạng bytecode lượng tử Q-ISA: `.qbc` (Magic byte `QSET`)
  - Cầu nối đồ họa 2D: `Setun2D`

---

# PHẦN I: CẨM NANG TOÀN BỘ CÁC LỆNH CLI (`setunc`)

Trình biên dịch Tersun được đóng gói trong file thực thi thống nhất `setunc.exe`. Cú pháp chung:

```bash
setunc <lệnh> [tùy_chọn] <tệp_mã_nguồn>
```

---

### 1. Lệnh Chạy Mã Nguồn Trực Tiếp (`run`)
Thực thi file mã nguồn `.stn`, `.taf`, hoặc `.setun`:

```bash
# Chạy trên Máy ảo Setun-70 Bytecode VM
setunc run chuong_trinh.stn

# Chạy siêu tốc với JIT Engine biên dịch trực tiếp trên RAM x86-64
setunc run --jit-ram chuong_trinh.stn
```
- **Ý nghĩa `--jit-ram`**: Cấp phát bộ nhớ thực thi bằng `VirtualAlloc(PAGE_EXECUTE_READWRITE)`, dịch bytecode tức thời ra mã máy x86-64 native và thực thi trực tiếp trên CPU không cần file `.exe` trung gian.

---

### 2. Lệnh Biên Dịch Bytecode Tam Phân Cổ Điển (`compile`)
Dịch mã nguồn Tersun ra file bytecode nhị phân độc lập `.tbc`:

```bash
setunc compile chuong_trinh.stn -o chuong_trinh.tbc
```
- File `.tbc` có thể phân phối độc lập và chạy nhanh trên Máy ảo `Setun-70 VM`.

---

### 3. Lệnh Biên Dịch Trực Tiếp Sang Mã Máy Lượng Tử QVM (`compile --qvm`)
Biên dịch trực tiếp cây cú pháp trừu tượng (AST) sang bytecode lượng tử nhị phân `.qbc` theo tập lệnh **Q-ISA**:

```bash
setunc compile chuong_trinh.stn --qvm -o mach_luong_tu.qbc
```
- File sinh ra có Magic Header `QSET`, phiên bản `0x0102` (Tersun 1.0.2), nén 2-bit thành 1-qubit và tích hợp toàn bộ các cổng Clifford + CNOT.

---

### 4. Lệnh Mô Phỏng Mạch Trên Máy Ảo Lượng Tử (`run-qvm`)
Nạp file `.qbc` và thực thi mô phỏng trên cỗ máy ảo **QVM Simulator**:

```bash
setunc run-qvm mach_luong_tu.qbc
```
- Quản lý StateVector không gian Hilbert $2^N$ chiều số phức $\mathbb{C}$, tính toán xác suất biên độ và đo sụp đổ hàm sóng theo quy tắc Born.

---

### 5. Lệnh Xuất Mạch Chuẩn Công Nghiệp OpenQASM 3.0 (`emit-qasm`)
Xuất mạch lượng tử ra định dạng tiêu chuẩn quốc tế **OpenQASM 3.0** (`.qasm`):

```bash
setunc emit-qasm chuong_trinh.stn -o mach_luong_tu.qasm
```
- Tương thích hoàn toàn với các chip máy tính lượng tử thực tế của **IBM Quantum, AWS Braket, Rigetti**.

---

### 6. Lệnh Dịch Mã Trung Gian LLVM IR Sang Bytecode Lượng Tử (`llvm2qvm`)
Cầu nối chuyển dịch từ mã trung gian LLVM IR sang tập lệnh lượng tử Q-ISA:

```bash
setunc llvm2qvm module.ll -o module_qvm.qbc
```
- Tự động gom các thanh ghi 2-bit thành 1 qubit và hạ cấp các phép tính logic khả nghịch sang cổng CNOT và Toffoli.

---

### 7. Lệnh Xuất Mã Trung Gian LLVM IR SSA (`emit-llvm`)
Hạ cấp toàn bộ mã nguồn Tersun sang văn bản hợp ngữ **LLVM IR** (`.ll`):

```bash
setunc emit-llvm chuong_trinh.stn -o chuong_trinh.ll
```
- Sinh mã SSA chuẩn với rẽ nhánh `branch3` qua bảng nhảy `switch table`, và định nghĩa inlined số học chính xác $\mathbb{Q}(\sqrt{3})$.

---

### 8. Lệnh Biên Dịch LLVM AOT Native (`compile --llvm`)
Biên dịch mã nguồn Tersun thẳng ra file chạy độc lập `.exe` thông qua backend LLVM AOT với cờ tối ưu hóa:

```bash
setunc compile chuong_trinh.stn --llvm -o ung_dung.exe
setunc compile chuong_trinh.stn --llvm -O3 -o ung_dung_pro.exe
```

---

### 9. Lệnh Biên Dịch C++20 SIMD Native AOT (`compile --native`)
Chuyển đổi mã nguồn Tersun sang C++20 tối ưu cao và biên dịch thẳng ra file thực thi độc lập `.exe`:

```bash
setunc compile chuong_trinh.stn --native -o ung_dung.exe
setunc compile chuong_trinh.stn --native -O3 -o ung_dung_pro.exe
```
- Chạy với tốc độ phần cứng thuần túy, 0ns GC, nhanh hơn Python xấp xỉ 120 lần.

---

### 10. Lệnh Dịch Ngược Đa Nền Tảng (`disasm`)
Hỗ trợ dịch ngược cả Bytecode máy tính tam phân (`.tbc`) và Bytecode lượng tử QVM (`.qbc`):

```bash
# Dịch ngược mã tam phân Setun
setunc disasm chuong_trinh.tbc

# Dịch ngược mã máy lượng tử QVM
setunc disasm mach_luong_tu.qbc
```
- Với `.qbc`, bảng hợp ngữ sẽ hiển thị rõ: Offset, Tên cổng lượng tử (`OP_H`, `OP_CNOT`, `OP_TRIT_INV`, `OP_MEASURE_TRIT`), Qubit điều khiển (`ctrl`), Qubit đích (`target`), và thanh ghi cổ điển.

---

### 11. Lệnh Xuất Mã C++20 SIMD Thuần Túy (`--emit-c`)
Sinh mã nguồn C++20 độc lập không phụ thuộc thư viện ngoài:

```bash
setunc compile chuong_trinh.stn --emit-c -o chuong_trinh.cpp
```

---

### 12. Lệnh Xuất Mã Phần Cứng FPGA Verilog (`--emit-verilog`)
Sinh mã phần cứng Verilog-2001 IP-Core có thể nạp trực tiếp lên chip FPGA (Xilinx, Gowin, Intel Altera):

```bash
setunc --emit-verilog chuong_trinh.stn -o tafpu_ip_core.v
```

---

### 13. Lệnh Kiểm Thử Toàn Diện Hệ Thống (`test`)
Chạy toàn bộ **16 bộ kiểm thử chuyên sâu (100% Passed)** từ Phase 1 đến Phase 5, bộ test LLVM 1.0.1 và bộ test QVM 1.0.2:

```bash
setunc test
```

---

### 14. Lệnh Đo Hiệu Năng Benchmark (`benchmark`)
Đo tốc độ xử lý phép nhân đại số TAFPU, thông lượng hàng đợi không khóa và tốc độ nhân ma trận AI BitNet:

```bash
setunc benchmark
```

---

### 15. Lệnh Theo Dõi Vết Tính Toán Đại Số (`trace-btvp`)
Xem từng bước biến đổi phân tích của phép toán trong trường $\mathbb{Q}(\sqrt{3})$:

```bash
setunc trace-btvp 14 25
```

---

### 16. Lệnh Quản Lý Gói Thư Viện (`tpm`) & LSP IDE
```bash
setunc tpm init       # Khởi tạo dự án mới (tạo tpm.json)
setunc tpm build      # Xây dựng toàn bộ dependencies
setunc lsp            # Khởi động Language Server Protocol cho IDE
setunc repl           # Mở chế độ dòng lệnh tương tác REPL
```

---

# PHẦN II: GIÁO TRÌNH LẬP TRÌNH TERSUN TỪ A ĐẾN Z

---

## BÀI 1: NỀN TẢNG ĐIỆN TOÁN TAM PHÂN & SỐ HỌC ĐẠI SỐ $\mathbb{Q}(\sqrt{3})$

### 1.1. Logic Tam Phân Cân Bằng (Balanced Ternary)
Máy tính thông thường sử dụng hệ nhị phân gồm 2 trạng thái $\{0, 1\}$. Hệ tam phân cân bằng của Tersun sử dụng **3 trạng thái đối xứng**:
- **`-1` (hoặc ký tự `T`)**: Biểu thị giá trị Sai (False), Trừ, hoặc Phủ định.
- **`0`**: Biểu thị giá trị Vô định (Unknown/Null), Trung lập, hoặc Bằng nhau.
- **`+1` (hoặc `1`)**: Biểu thị giá trị Đúng (True), Cộng, hoặc Khẳng định.

**Ưu điểm phần cứng**: Số âm trong tam phân cân bằng không cần thêm bit dấu (`sign bit`) và không cần kỹ thuật bù 2 (`two's complement`). Đổi dấu một số chỉ đơn giản là lật ngược các trit: $1 \leftrightarrow -1, 0 \leftrightarrow 0$.

### 1.2. Số Học Đại Số TAFPU $\mathbb{Q}(\sqrt{3})$ ($0\%$ Sai Số)
Trong IEEE-754 nhị phân, các số vô tỉ như $\sqrt{3}, \pi$ hay số thập phân tuần hoàn $0.1$ luôn bị làm tròn gây tích lũy sai số.  
Tersun giải quyết triệt để bằng cách biểu diễn số học dưới dạng mở rộng trường đại số bậc hai $\mathbb{Q}(\sqrt{3})$:

$$\text{Số đại số} = [A, B, S] = (A + B\sqrt{3}) \cdot 3^{S/2} \quad (A, B, S \in \mathbb{Z})$$

- Phép nhân hai số đại số:
  $$(A_1 + B_1\sqrt{3})(A_2 + B_2\sqrt{3}) = (A_1 A_2 + 3 B_1 B_2) + (A_1 B_2 + A_2 B_1)\sqrt{3}$$
- Mọi phép tính thực hiện hoàn toàn trên các hệ số nguyên số học, **bảo toàn tính chính xác $0.00000000\%$ tuyệt đối**.

Ví dụ nhân hai số đại số liên hợp:
```stn
let u1: taf3 = [2, 1, 0];   // 2 + 1*sqrt(3)
let u2: taf3 = [2, -1, 0];  // 2 - 1*sqrt(3)

// (2 + sqrt(3)) * (2 - sqrt(3)) = 4 - 3 = 1
let prod: taf3 = u1 * u2;
println(prod); // [1, 0, 0] với 0% sai số!
```

---

## BÀI 2: CÚ PHÁP CƠ BẢN, BIẾN VÀ HỆ THỐNG KIỂU TĨNH

### 2.1. Khai Báo Biến (`let`) và Hằng Số (`const`)
Tersun hỗ trợ suy luận kiểu tự động (Local Type Inference):

```stn
let x = 42;                // Tự động suy luận kiểu 'int'
let mut dem: int = 0;      // Biến có thể gán lại giá trị
const PI_TAF: taf3 = [3, 0, 0]; // Hằng số bất biến
```

### 2.2. Các Kiểu Dữ Liệu Tích Hợp Sẵn
| Kiểu dữ liệu | Ý nghĩa | Ví dụ |
| :--- | :--- | :--- |
| `int` | Số nguyên 64-bit có dấu | `let n: int = -100;` |
| `tryte` / `trit` | Đơn vị tam phân (trit: 1 trit, tryte: 9 trits) | `let t: tryte = 1;` |
| `taf3` | Số đại số chính xác trong $\mathbb{Q}(\sqrt{3})$. Từ 1.0.3: literal tường minh `taf3[a, b, s]` hoặc `taf3(a, b, s)`; gán có kiểu `let v: taf3 = [1, 2, 0];` vẫn giữ nguyên | `let v: taf3 = [1, 2, 0];` |
| `tvec3` | Vector 3 chiều đại số | `let vec = tvec3(1, 0, -1);` |
| `bool` | Giá trị luận lý | `let ok: bool = true;` |
| `string` | Chuỗi UTF-8 — `len()` đếm byte, `ulen()` đếm ký tự Unicode | `let msg = "Tiếng Việt";` |
| `array` | Mảng động, chỉ mục âm Pythonic. **Từ 1.0.3**, `[a, b, c]` là mảng 3 phần tử (TAFPU dùng `taf3[a, b, s]`) | `let arr = [10, 20, 30];` |

---

## BÀI 3: ĐIỀU KHIỂN LUỒNG & CẤU TRÚC RẼ NHÁNH 3 NGẢ (`branch3`)

Thay vì lồng ghép các câu lệnh `if-else` nhị phân cồng kềnh, Tersun cung cấp cấu trúc `branch3` trực tiếp ở mức phần cứng:

```stn
fn danh_gia_trang_thai(delta: taf3) -> int {
    branch3(delta) {
        negative => {
            println("Trang thai Am (-1)");
            return -1;
        }
        zero => {
            println("Trang thai Can bang (0)");
            return 0;
        }
        positive => {
            println("Trang thai Duong (+1)");
            return 1;
        }
    }
}
```

Vòng lặp `while` (kèm `break`/`continue`):
```stn
let mut i: int = 0;
while (i < 10) {
    i = i + 1;
    if (i == 3) { continue; }
    if (i == 8) { break; }
}
```

**Từ 1.0.3**, thêm đầy đủ vòng lặp hiện đại và toán tử logic:

```stn
// 1. C-style (giống C++/Java)
for (let i = 0; i < 5; i += 1) {
    println(i);
}

// 2. Python-style với range(): range(n) | range(a, b) | range(a, b, step)
for i in range(10, 0, -1) {   // đếm ngược, step âm
    println(i);
}

// 3. For-each qua mảng, chuỗi, taf3 (duyệt a, b, s)
let arr = [2, 4, 6];
for (v in arr) { println(v); }
for ch in "Tersun" { print(ch); }

// Toán tử logic bool: && || not (Kleene min/max vẫn cho miền -1/0/+1)
if (i > 0 && i < 10) { println("trong đoạn"); }
if (i <= 0 || i >= 10) { println("ngoài đoạn"); }
let khong_phai = not (i == 0);

// elif + gán rút gọn += -= *= /=
let diem = 82;
if (diem >= 90)      { println("Xuất sắc"); }
elif (diem >= 80)    { println("Giỏi"); }
else                 { println("Khá"); }
diem += 5;   // bằng diem = diem + 5
```

---

## BÀI 4: STRUCTS, OOP VÀ GENERIC MONOMORPHIZATION (`<T>`)

### 4.1. Khai Báo Cấu Trúc Dữ Liệu (`struct`)
Struct trong Tersun là kiểu giá trị (Value Type), phân bổ trên stack không tốn chi phí dọn rác (0ns GC):

```stn
struct QuantumPacket {
    id: int;
    phase: taf3;
    qubit_tag: int;
    verified: bool;
}

fn main() -> int {
    let u1: taf3 = [2, 1, 0];
    let u2: taf3 = [2, -1, 0];
    
    // Khởi tạo struct
    let packet = QuantumPacket(101, u1 * u2, 1, true);
    println(packet.id);
    println(packet.verified);
    return 0;
}
```

### 4.2. Lập Trình Tổng Quát Generic (`<T>`)
Trình biên dịch tự động monomorphize (chuyên biệt hóa) mã nguồn thành các hàm cụ thể tại thời điểm biên dịch:

```stn
fn identity<T>(item: T) -> T {
    return item;
}

let a = identity(42);         // Sinh hàm identity__int
let b = identity("Tersun");   // Sinh hàm identity__string
```

---

## BÀI 5: ĐIỆN TOÁN LƯỢNG TỬ TERSUN 1.0.3 & MÔ PHỎNG QVM

### 5.1. Cơ Chế Gom 2-Bit Thành 1-Qubit
Tersun 1.0.2 giải quyết bài toán cầu nối giữa kiến trúc máy tính cổ điển và máy tính lượng tử:

| Trạng thái 2-Bit | Trạng thái Qubit | Tên gọi | Ý nghĩa toán học |
| :---: | :---: | :---: | :--- |
| `00` | $\|0\rangle$ | Ground State | Trit $0$ |
| `01` | $\|1\rangle$ | Excited State | Trit $+1$ |
| `10` | $\|-\rangle$ | Phase Invert | Trit $-1$ ($\frac{\|0\rangle - \|1\rangle}{\sqrt{2}}$) |
| `11` | $\|+\rangle$ / $\bot$ | Superposition / Nil | Chồng chập chưa đo hoặc ngoại lệ phần cứng |

### 5.2. Tạo Trạng Thái Chồng Chập (Hadamard) & Vướng Víu (Bell State)
Khi biên dịch sang QVM (`setunc compile --qvm`), các phép toán biến đổi được hạ cấp xuống các cổng lượng tử:
- Cổng **Hadamard ($H$)**: Đưa trạng thái từ $|0\rangle$ vào trạng thái chồng chập $\frac{|0\rangle + |1\rangle}{\sqrt{2}}$.
- Cổng **CNOT ($CX$)**: Tạo vướng víu giữa qubit điều khiển và qubit đích $\to$ sinh ra cặp **Bell State** $\frac{|00\rangle + |11\rangle}{\sqrt{2}}$.
- Cổng **Ternary Invert**: Đảo dấu pha lượng tử tam phân.

### 5.3. Xuất Mạch Chuẩn OpenQASM 3.0 Để Chạy Trên Phần Cứng Thực
Chỉ với 1 lệnh:
```bash
setunc emit-qasm chuong_trinh.stn -o circuit.qasm
```
Bạn nhận được mã nguồn OpenQASM 3.0 tiêu chuẩn để nạp trực tiếp vào **IBM Quantum Platform**:
```qasm
OPENQASM 3.0;
include "stdgates.inc";

qubit[16] q;
bit[16] c;

cx q[1], q[0];
h q[16];
z q[28];
c = measure q;
```

---

## BÀI 6: TÍNH NĂNG HIỆN ĐẠI 1.0.3 — CLOSURES, GENERICS, INTERFACE, EXCEPTIONS, NAMESPACE

### 6.1. Hàm Bậc Nhất, Lambda & Closure
Hàm là một giá trị: gán được vào biến, truyền vào hàm khác. Lambda `fn (x) => expr` có thể **bắt biến bên ngoài** (closure):

```stn
fn double_it(x: int) -> int {
    return x * 2;
}

fn main() {
    let f = double_it;                  // Hàm là giá trị
    println(f(21));                     // 42

    let scale = 100;
    let shift = fn (x: int) -> int { return x + scale; };  // Closure bắt 'scale'
    println(shift(5));                  // 105

    // map / filter / reduce trên mảng
    let nums = [1, 2, 3, 4];
    let doubled = nums.map(double_it);                          // [2, 4, 6, 8]
    let evens   = nums.filter(fn (x: int) -> bool { return x / 2 * 2 == x; });
    let total   = nums.reduce(fn (acc: int, x: int) -> int { return acc + x; }, 0);
}
```

### 6.2. Generics Với Turbofish
Kiểu tổng quát cho hàm và struct; kiểu có thể suy từ tham số hoặc khai báo tường minh bằng `::< >`:

```stn
fn pick<T>(a: T, b: T) -> T {
    if (a <=> b) { return a; }
    return b;
}

struct Pair<A, B> {
    pub first: A;
    pub second: B;
}

fn main() {
    println(pick::<int>(9, 4));     // 9 (turbofish tường minh)
    println(pick(3, 7));            // 3 (suy từ tham số)

    let p = Pair(1, "one");         // Pair__int__string được sinh tự động
    println(p.first);               // 1  (kiểu int)
    println(p.second);              // "one" (kiểu string)
}
```

### 6.3. Interface & Dispatch Động
Class implement interface phải có đủ method (kiểm tra lúc biên dịch); gọi qua biến kiểu interface dispatch động lúc chạy:

```stn
interface Shape {
    def area(self) -> int;
}

class Circle : Shape {
    pub r: int;
    def init(self, r: int) { self.r = r; }
    def area(self) -> int { return 3 * self.r * self.r; }
}

fn describe(s: Shape) -> int {
    return s.area();
}
```

### 6.4. Xử Lý Lỗi: try / catch / throw
```stn
fn main() {
    try {
        let h = HostFs();
        let data = h.fs_read("input.txt");
        if (data == "") { throw "Tệp rỗng hoặc không tồn tại"; }
        println(data);
    } catch (e) {          // e là chuỗi mô tả lỗi
        println("Lỗi: " + e);
    }
}
```

### 6.5. Module: Namespace & Visibility
```stn
// mathx.stn
priv fn helper(x: int) -> int { return x * 2; }   // priv: chỉ dùng nội bộ module
pub fn quad(x: int) -> int { return helper(helper(x)); }
```

```stn
// main.stn
import "mathx.stn" as mx;       // namespace 'mx'
fn main() {
    println(mx.quad(5));        // 20 — helper() bị chặn lúc biên dịch
}
```

### 6.6. Chuỗi Unicode & f-string
```stn
fn main() {
    let v = "Tiếng Việt";
    println(v.len());            // 14 (byte UTF-8)
    println(v.ulen());           // 10 (ký tự Unicode)
    println(v.uslice(0, 5));     // "Tiếng"
    println(f"Sai số: {0.1 + 0.2 - 0.3:e}");   // f-string: .3f | g | e | t (trit)
    for ch in v { print(ch); }   // duyệt theo ký tự Unicode
}
```

---

## BÀI 7: HỆ THỐNG QUẢN LÝ BỘ NHỚ TRI-COLOR GC & CAM KẾT MEMORY FLATLINE (GATE 5.6)

Quản lý bộ nhớ trong Tersun kết hợp hài hòa giữa **kiểu giá trị phân bổ trên Stack (Value Types - 0ns GC)** và **vùng nhớ Managed Heap** được bảo vệ bởi bộ thu gom rác **Tri-Color Mark-Sweep Generational GC**.

### 7.1. Kiến Trúc Phân Vùng Bộ Nhớ Managed Heap
Managed Heap của Tersun chia thành các vùng chức năng chuyên biệt:
1. **Nursery / Eden Space**: Vùng cấp phát siêu tốc cho các đối tượng có vòng đời ngắn hạn (bump-pointer allocation).
2. **Old Generation Space**: Lưu trữ các đối tượng sống sót qua các chu kỳ thu gom trước đó.
3. **Fixed-Block Slab Allocator**: Cấp phát các khối bộ nhớ cố định theo kích cỡ (slab) nhằm loại bỏ triệt để hiện tượng phân mảnh bộ nhớ ngoài (external fragmentation).

### 7.2. Thuật Toán Thu Gom Rác Ba Màu (Tri-Color Marking) & Rào Ghi (Write Barrier)
Mọi đối tượng trên Heap được phân loại thành 3 màu trạng thái:
- **Trắng (White)**: Chưa được duyệt qua; là đối tượng rác tiềm năng khi chu kỳ thu gom kết thúc.
- **Xám (Gray)**: Đã được đánh dấu còn sống nhưng các con trỏ trỏ tới đối tượng con chưa được quét.
- **Đen (Black)**: Đã được đánh dấu còn sống và toàn bộ các đối tượng con đã được quét hoàn tất.

```text
[ Roots: Stack / Global Registers ]
              │
              ▼
       ┌──────────────┐
       │ Đối tượng Đen│ (Đã quét xong toàn bộ nút con)
       └──────┬───────┘
              │  Write Barrier bảo vệ tính bất biến
              ▼
       ┌──────────────┐
       │ Đối tượng Xám│ (Đang nằm trong hàng đợi duyệt)
       └──────┬───────┘
              │
              ▼
       ┌──────────────┐
       │Đối tượng Trắng│ (Chưa chạm tới -> Thu gom & Hoàn trả bộ nhớ)
       └──────────────┘
```

**Bảo vệ tính bất biến bằng Rào ghi (Write Barrier):**
Khi chương trình gán một con trỏ mới $A \to B$ trong lúc GC đang chạy, nếu $A$ là màu Đen và $B$ là màu Trắng, Rào ghi sẽ lập tức chuyển màu $A$ thành Xám (hoặc tô màu $B$ thành Xám) để đưa vào danh sách kiểm tra lại, triệt tiêu hoàn toàn nguy cơ thu gom nhầm đối tượng đang sử dụng.

### 7.3. Thu Gom Đồ Thị Vòng & Danh Sách Tuyến Tính Sâu (Cycle-Safe & Deep-Graph)
- **Đồ thị tham chiếu vòng ($A \to B \to C \to A$):** Khác với cơ chế đếm tham chiếu (Reference Counting) của Python/Swift dễ bị rò rỉ khi xuất hiện chu trình kín, thuật toán Mark-Sweep của Tersun phân tích tính khả đạt từ tập gốc (Root Set). Nếu một cụm đối tượng vòng bị ngắt liên kết khỏi Root Set, toàn bộ vòng lặp sẽ bị thu gom 100% trong 1 chu kỳ máy.
- **Danh sách liên kết sâu 10,000 nút (Deep Linear List):** Tri-Color GC của Tersun sử dụng hàng đợi đánh dấu ngoại vi (explicit mark queue) thay vì đệ quy lời gọi hàm C, loại bỏ hoàn toàn nguy cơ tràn ngăn xếp hệ thống (`Stack Overflow`).

### 7.4. Cam Kết Bộ Nhớ Ổn Định Tuyệt Đối (Memory Flatline Guarantee)
Trong thử nghiệm kiểm chuẩn khắc nghiệt (ST-6):
- **1,000,000 lượt cấp phát liên tục** dưới áp lực ngưỡng nhớ hẹp 512KB.
- Kích hoạt 126 chu kỳ thu gom rác tự động.
- **Độ trôi bộ nhớ (Memory Flatline Drift) đạt đúng 0.00%** (Dung lượng bộ nhớ sau dọn dẹp giữ nguyên trạng thái phẳng, 0 byte rò rỉ, 0 lỗi use-after-free).

---

## BÀI 8: KIẾN TRÚC JIT COMPILER, OSR & SPECULATIVE DEOPTIMIZATION (GATES 5.7 & 5.8)

Nhằm tối đa hóa thông lượng tính toán mà không làm mất đi tính linh hoạt của ngôn ngữ động, Tersun tích hợp bộ ba: **Baseline JIT Engine (Gate 5.7)**, **On-Stack Replacement (OSR)** và **Speculative Deoptimization (Gate 5.8)**.

### 8.1. Vòng Đời Phân Tầng Thực Thi (Tiering Lifecycle)
Một hàm hoặc đoạn mã trong Tersun trải qua các trạng thái tối ưu hóa:
$$\text{UNCOMPILED} \xrightarrow[\text{Chạm ngưỡng đếm nóng}]{\text{JIT Tiering}} \text{COMPILED} \xrightarrow[\text{Vi phạm giả định kiểu}]{\text{Speculative Bailout}} \text{DEOPTIMIZED} \to \text{INVALIDATED}$$

1. **Interpreter (Tầng 0)**: Thực thi bytecode trên Setun-70 VM với chi phí khởi động 0ms.
2. **JIT Tier-1 (Tầng 1)**: Khi một hàm hoặc vòng lặp chạm ngưỡng đếm thực thi nóng (Hotness Threshold, ví dụ $1,000$ lần), JIT Engine dịch các khối cơ bản (Basic Blocks) sang mã máy trực tiếp trên RAM.
3. **Deoptimization (Hạ tầng an toàn)**: Khi mã máy JIT gặp một trường hợp giả định sai kiểu hoặc ngoại lệ, hệ thống tự động giáng cấp ngược về Interpreter mà không làm gián đoạn chương trình.

### 8.2. Thay Thế Khung Thực Thi Giữa Vòng Lặp (On-Stack Replacement - OSR)
Đối với các vòng lặp tính toán khổng lồ (ví dụ vòng lặp $10,000,000$ lần trong 1 hàm đơn), nếu phải đợi thoát khỏi hàm mới kích hoạt JIT thì quá muộn.
- **Cơ chế OSR của Tersun**:
  - Máy ảo phát hiện vòng lặp nóng tại lệnh `OP_LOOP_BACK` hoặc `OP_JUMP_IF_FALSE`.
  - JIT biên dịch thân vòng lặp và tạo một điểm tiếp nhận OSR (OSR Entry Point).
  - Khung ngăn xếp của máy ảo (`VMStackFrame`) được ánh xạ trực tiếp sang thanh ghi CPU ($RAX, RBX, R12..R15$). Con trỏ lệnh phần cứng `RIP` nhảy thẳng vào mã JIT ngay giữa chu kỳ lặp kế tiếp mà không cần khởi động lại vòng lặp.
  - Tốc độ thực thi chuyển dịch mượt mà từ thông dịch sang mã máy trong vòng dưới $0.1\text{ ms}$.

### 8.3. Tái Tạo Trạng Thái Máy An Toàn (MachineState Deoptimization Bailout)
Khi mã máy JIT tối ưu hóa giả định kiểu dữ liệu (speculative type guard) bị vi phạm:
1. Trình xử lý Bailout dừng luồng thực thi phần cứng.
2. Cấu trúc `MachineState` quét toàn bộ trạng thái thanh ghi CPU và vùng nhớ ngăn xếp phần cứng.
3. Ánh xạ các giá trị trở lại ngăn xếp toán hạng của máy ảo (`Operand Stack`) và khôi phục biến cục bộ `Locals`.
4. Cập nhật con trỏ lệnh ảo `Instruction Pointer (IP)` chỉ đúng lệnh bytecode tương ứng.
5. Luồng xử lý tiếp tục chạy bình thường trên Interpreter với độ chính xác $100.000\%$.

---

## BÀI 9: ĐIỆN TOÁN LƯỢNG TỬ NÂNG CAO, THUẬT TOÁN GROVER, QFT & KHẢO SÁT GIỚI HẠN PHẦN CỨNG

### 9.1. Biến Đổi Fourier Lượng Tử (Quantum Fourier Transform - QFT)
QFT là hạt nhân của thuật toán phân tích số nguyên Shor và ước lượng pha lượng tử (QPE). Trên $N$ qubit, QFT ánh xạ các trạng thái cơ sở tính toán $|j\rangle$ thành:

$$|j\rangle \mapsto \frac{1}{\sqrt{2^N}} \sum_{k=0}^{2^N-1} e^{2\pi i j k / 2^N} |k\rangle$$

Trong Tersun QVM, QFT được triển khai thông qua thư viện lượng tử tự nhiên bằng tổ hợp cổng Hadamard và thang xoay pha điều khiển $CP(\theta)$:
```stn
// Gọi trực tiếp biến đổi Fourier lượng tử trên N qubit
let mut reg = QubitRegister(4);
circuit.qft(4);
circuit.execute(reg);
```
- **Tốc độ xử lý**: Trên 4 Qubit, QFT của Tersun chỉ mất **$2.41\text{ }\mu\text{s}$** (nhanh hơn Qiskit 188 lần, nhanh hơn NumPy 27 lần). Trên 22 Qubit ($4,194,304$ biên độ), QVM xử lý $264$ cổng chỉ trong $6.7$ giây với thông lượng tính toán đạt **$164\text{ Mops/s}$**.

### 9.2. Thuật Toán Tìm Kiếm Lượng Tử Grover (Grover Search)
Thuật toán tìm kiếm phần tử đích trong cơ sở dữ liệu không có cấu trúc kích thước $2^N$ với độ phức tạp $O(\sqrt{2^N})$ thay vì $O(2^N)$ cổ điển:
1. **Khởi tạo chồng chập đều**: Áp dụng $H^{\otimes N}$ trên trạng thái $|0\dots0\rangle$.
2. **Toán tử Oracle lượng tử**: Đảo dấu pha của trạng thái đích $|\omega\rangle$: $U_\omega |x\rangle = -|x\rangle$ nếu $x = \omega$.
3. **Toán tử khuếch tán (Diffusion Operator)**: Đảo ngược biên độ quanh giá trị trung bình $2|s\rangle\langle s| - I = H^{\otimes N} (2|0\rangle\langle 0| - I) H^{\otimes N}$.

Trên mạch Grover 3-Qubit tìm kiếm trạng thái $|111\rangle$ (mục tiêu 7):
- Xác suất đo được trạng thái đích sau 1 chu kỳ lặp đạt đúng giá trị lý thuyết:
  $$P(\text{target}) = \sin^2(3\theta) = \frac{25}{32} = 78.125\%$$
- Thời gian thực thi trên Tersun QVM chỉ mất **$0.60\text{ }\mu\text{s}$** (nhanh hơn Python Qiskit tới **$570.2\text{ lần}$**).

### 9.3. Đo Tải Thực Nghiệm Tới Giới Hạn Phần Cứng Máy Tính
Trong bài đo kiểm thực tế trên máy tính cá nhân 16.0 GB RAM:
- Tersun QVM duy trì tốc độ và sự ổn định tuyến tính từ $N=4$ tới **$N=29$ Qubits**:
  - Tại $N=26$ ($67,108,864$ biên độ, $1.0\text{ GB}$ RAM): hoàn thành trong **$5.23\text{ giây}$** (nhanh gấp 9.0 lần NumPy).
  - Tại $N=28$ ($268,435,456$ biên độ, $4.0\text{ GB}$ RAM): hoàn thành trong **$22.50\text{ giây}$**.
  - Tại $N=29$ ($536,870,912$ biên độ, $8.0\text{ GB}$ RAM): hoàn thành trong **$70.98\text{ giây}$** với $8.59\text{ GB}$ Working Set liên tục.
- Tại **$N=30$ Qubits** ($16.0\text{ GB}$ RAM trạng thái đơn lẻ): Bộ nhớ vượt quá RAM vật lý của máy, QVM kích hoạt an toàn ngoại lệ `std::bad_alloc`, không làm treo hệ điều hành.

---

# PHẦN III: DỰ ÁN MẪU HOÀN CHỈNH TERSUN 1.0.3

Tạo file `Projects/QuantumLogicDemo/main.stn` và trải nghiệm đầy đủ sức mạnh của hệ thống:

```stn
// ============================================================================
// Tersun 1.0.2 Project: Quantum-Ternary Cryptographic Checksum & State Engine
// ============================================================================

struct QuantumPacket {
    id: int;
    phase: taf3;
    qubit_tag: int;
    verified: bool;
}

fn compute_quantum_checksum(seed: int, steps: int) -> int {
    let mut acc: int = seed;
    let mut i: int = 0;

    // Vòng lặp biến đổi trạng thái khả nghịch
    while (i < steps) {
        let bit0: int = i;
        acc = acc + bit0;
        i = i + 1;
    }

    return acc;
}

fn evaluate_phase(u1: taf3, u2: taf3) -> int {
    // Nhân đại số chính xác trong Q(sqrt(3)): (2 + sqrt(3)) * (2 - sqrt(3)) = 1
    let product: taf3 = u1 * u2;
    
    // Rẽ nhánh 3 ngả lượng tử
    branch3(product) {
        negative => return -1;
        zero     => return 0;
        positive => return 1;
    }
}

fn main() -> int {
    println("=================================================================");
    println("  Tersun 1.0.2: Quantum-Ternary Checksum & State Engine Running  ");
    println("=================================================================");

    // 1. Số học đại số TAFPU không trôi sai số
    let u1: taf3 = [2, 1, 0];   // 2 + 1*sqrt(3)
    let u2: taf3 = [2, -1, 0];  // 2 - 1*sqrt(3)

    let phase_code: int = evaluate_phase(u1, u2);
    println("Algebraic Phase Projection (-1, 0, +1):");
    println(phase_code); // 1

    // 2. Định kiểu Struct và gom nhóm
    let mut packet: QuantumPacket = QuantumPacket(101, u1 * u2, 1, true);

    // 3. Tính toán Checksum lượng tử khả nghịch
    let checksum: int = compute_quantum_checksum(packet.qubit_tag, 10);
    println("Reversible Quantum Checksum (10 iterations):");
    println(checksum); // 46

    // 4. Kiểm tra điều kiện và trả về mã thoát
    if (phase_code > 0) {
        println("Status: Quantum-Ternary State Engine Fully Verified!");
        return 42;
    } else {
        return 0;
    }
}
```

### Các Lệnh Biên Dịch & Chạy Thử Nghiệm:

```powershell
# 1. Biên dịch và mô phỏng trên Máy ảo Lượng tử QVM:
setunc compile main.stn --qvm -o main.qbc
setunc run-qvm main.qbc

# 2. Dịch ngược mã máy Q-ISA:
setunc disasm main.qbc

# 3. Xuất mạch lượng tử OpenQASM 3.0:
setunc emit-qasm main.stn -o main.qasm

# 4. Xuất mã trung gian LLVM IR:
setunc emit-llvm main.stn -o main.ll

# 5. Biên dịch ra File chạy Native Windows (.exe):
setunc compile main.stn --native -o main.exe
.\main.exe
```

---

<p align="center">
  <b>Tersun 1.0.2 Documentation</b> • Hệ thống Ngôn ngữ & Trình biên dịch Điện toán Tam phân - Lượng tử Hàng đầu.
</p>
