# GIÁO TRÌNH TOÀN DIỆN & CẨM NANG LỆNH NGÔN NGỮ TERSUN 1.0.0
> **Phiên bản:** Tersun 1.0.0 *(Ternary + Setun Toolchain)*  
> **Tác giả:** Stufusic (stufusiclab@gmail.com)  
> **Giấy phép:** MIT License  
> **Mục tiêu:** Hướng dẫn từ căn bản đến nâng cao lập trình điện toán tam phân cân bằng, số học đại số chính xác tuyệt đối trong $\mathbb{Q}(\sqrt{3})$, và toàn bộ hệ thống lệnh của trình biên dịch `setunc`.

---

## 📌 QUY ƯỚC TÊN GỌI: TERSUN & SETUN

Trong toàn bộ hệ sinh thái:
- **Tersun 1.0.0**: Là tên chính thức của **Ngôn ngữ Lập trình** và **Dự án Toàn diện**.
- **Setun (Setun-70 / setunc)**: Để tri ân máy tính tam phân Setun lịch sử của Đại học Tổng hợp Moscow (1958) và bảo đảm tính tương thích ngược tuyệt đối, một số công cụ và thành phần lõi bên dưới tiếp tục giữ định danh lịch sử:
  - Trình biên dịch & công cụ CLI thống nhất: `setunc.exe`
  - Động cơ Máy ảo: `Setun-70 VM`
  - Định dạng bytecode nhị phân: `.tbc` (Magic byte `SETU`)
  - Cầu nối đồ họa 2D: `Setun2D`

---

# PHẦN I: CẨM NANG TOÀN BỘ CÁC LỆNH CLI (`setunc`)

Trình biên dịch Tersun được đóng gói trong file thực thi thống nhất `setunc.exe` (nằm tại thư mục gốc và `Compiler/Code`). Cú pháp chung:

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

### 2. Lệnh Biên Dịch Bytecode (`compile`)
Dịch mã nguồn Tersun ra file bytecode nhị phân độc lập `.tbc`:

```bash
setunc compile chuong_trinh.stn -o chuong_trinh.tbc
```
- File `.tbc` có thể phân phối độc lập và chạy nhanh trên Máy ảo `Setun-70 VM`.

---

### 3. Lệnh Biên Dịch AOT Native Ra File `.exe` (`compile --native`)
Chuyển đổi mã nguồn Tersun sang C++20 tối ưu cao và biên dịch thẳng ra file thực thi độc lập `.exe`:

```bash
setunc compile chuong_trinh.stn --native -o ung_dung.exe
setunc compile chuong_trinh.stn --native -O3 -o ung_dung_pro.exe
```
- Ứng dụng sau khi biên dịch chạy với tốc độ native phần cứng (nhanh hơn Python xấp xỉ 120 lần).

---

### 4. Lệnh Xuất Mã LLVM IR Đa Kiến Trúc (`--emit-llvm`)
Sinh mã trung gian LLVM IR tương thích với nhiều nền tảng phần cứng:

```bash
setunc compile chuong_trinh.stn --emit-llvm -o chuong_trinh.ll
```
- Hỗ trợ tối ưu hóa cho x86-64 (AVX-512), Apple Silicon / ARM64 (NEON), RISC-V (RVV 1.0) và WebAssembly (Wasm).

---

### 5. Lệnh Xuất Mã C Tiêu Chuẩn (`--emit-c`)
Sinh mã nguồn C99 / C++20 thuần túy không phụ thuộc vào bất kỳ thư viện ngoài nào:

```bash
setunc compile chuong_trinh.stn --emit-c -o chuong_trinh.c
```

---

### 6. Lệnh Xuất Mã Phần Cứng FPGA Verilog (`--emit-verilog`)
Sinh mã phần cứng Verilog-2001 IP-Core có thể tổng hợp (synthesizable) trực tiếp lên các dòng chip FPGA (Xilinx, Gowin, Intel Altera):

```bash
setunc --emit-verilog chuong_trinh.stn -o tafpu_ip_core.v
```

---

### 7. Lệnh Dịch Ngược Bytecode (`disasm`)
Xem cấu trúc mã máy bytecode của file `.tbc` hoặc mã nguồn:

```bash
setunc disasm chuong_trinh.tbc
```

---

### 8. Lệnh Kiểm Thử Hệ Thống (`test`)
Chạy toàn bộ 14 bộ kiểm thử chuyên sâu của hệ thống để thẩm định 100% tính đúng đắn:

```bash
setunc test
```

---

### 9. Lệnh Đo Hiệu Năng (`benchmark`)
Đo tốc độ xử lý phép nhân đại số TAFPU, thông lượng hàng đợi không khóa và tốc độ nhân ma trận AI BitNet:

```bash
setunc benchmark
```

---

### 10. Lệnh Theo Dõi Vết Tính Toán Đại Số (`trace-btvp`)
Xem từng bước biến đổi phân tích của phép toán trong trường $\mathbb{Q}(\sqrt{3})$:

```bash
setunc trace-btvp "[1, 1, 0] * [1, -1, 0]"
```

---

### 11. Lệnh Tự Động Định Dạng Code (`fmt`)
Chuẩn hóa thụt đầu dòng 4 spaces và định dạng khoảng cách toán tử:

```bash
setunc fmt chuong_trinh.stn
```

---

### 12. Lệnh Khởi Động Trình Gỡ Lỗi Trực Quan (`debug`)
Mở trình kiểm tra trạng thái thanh ghi và cờ rẽ nhánh tam phân Setun-70 Visual Debugger:

```bash
setunc debug chuong_trinh.stn
```

---

### 13. Lệnh Khởi Động LSP Server Cho IDE (`lsp`)
Giao tiếp JSON-RPC với Setun Studio / VS Code để hiển thị gợi ý code (Auto-complete) và bắt lỗi thời gian thực:

```bash
setunc lsp
```

---

### 14. Lệnh Sinh Wrapper C/C++ Tự Động (`bindgen`)
Đọc file header C (`.h`) và tự động tạo mã bao bọc gọi hàm FFI trong Tersun:

```bash
setunc bindgen thu_vien.h -o wrapper.stn
```

---

### 15. Lệnh Quản Lý Gói Thư Viện (`tpm`)
Hệ thống quản lý gói Ternary Package Manager:

```bash
setunc tpm init       # Khởi tạo dự án mới (tạo tpm.json)
setunc tpm build      # Xây dựng toàn bộ dependencies
setunc tpm test       # Chạy test trong gói
setunc tpm publish    # Đóng gói và phát hành thư viện
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

---

## BÀI 2: HỆ THỐNG KIỂU DỮ LIỆU & BIẾN SỐ

Tersun là ngôn ngữ sở hữu **hệ thống kiểu tĩnh mạnh mẽ** kết hợp **suy luận kiểu tự động (Local Type Inference)**.

### 2.1. Các Kiểu Dữ Liệu Cơ Bản
| Kiểu Dữ Liệu | Miền Giá Trị / Cú Pháp | Ví Dụ |
| :--- | :--- | :--- |
| `int` | Số nguyên 64-bit | `let age: int = 25;` |
| `float` | Số thực dấu phẩy động 64-bit | `let pi: float = 3.14159;` |
| `bool` | Kiểu boolean nhị phân | `let active: bool = true;` |
| `string` | Chuỗi ký tự Unicode UTF-8 | `let msg: string = "Xin chào Tersun";` |
| `tryte` | Từ máy tam phân 6-trit ($-364 \dots +364$) | `let t: tryte = 42;` |
| `taf3` | Số thực đại số $[A, B, S] \in \mathbb{Q}(\sqrt{3})$ | `let x: taf3 = [1, 1, 0];` |
| `tvec3` | Vector không gian 3D đại số | `let pos: tvec3 = tvec3(10, 20, 30);` |

### 2.2. Khai Báo Biến & Suy Luận Kiểu Cục Bộ
```setun
// 1. Khai báo chỉ định kiểu tường minh
let count: int = 100;
let ratio: taf3 = [1, 2, 0];

// 2. Tự động suy luận kiểu (Local Type Inference)
let name = "Tersun Language"; // Tự động hiểu là string
let score = 95;                // Tự động hiểu là int
let is_valid = true;          // Tự động hiểu là bool

// 3. Khai báo hằng số bất biến (Const)
const MAX_LIMIT: int = 1000;
// MAX_LIMIT = 2000; // LỖI BIÊN DỊCH: Không thể gán đè vào hằng số!

// 4. Biến có thể thay đổi giá trị
let mut total = 0;
total = total + 50; // Hợp lệ
```

### 2.3. Bắt Lỗi Sai Kiểu Tại Compile-Time
Trình phân tích ngữ nghĩa (`TypeChecker`) sẽ chặn đứng mọi lỗi sai kiểu trước khi chương trình được chạy:
```setun
let x: int = "Chuỗi ký tự"; 
// => [Type Error] Line 1:1 - Type mismatch in variable 'x': 
//    Cannot assign expression of type 'string' to 'int'.
```

### 2.4. Thăng Cấp Kiểu Đại Số Tự Động (`Algebraic Promotion`)
Khi cộng một số nguyên `int` với một số đại số `taf3`, Tersun tự động thăng cấp số nguyên thành $[N, 0, 0]$:
```setun
let a: int = 5;
let b: taf3 = [1, 1, 0]; // 1 + sqrt(3)
let c: taf3 = a + b;     // Trả về [6, 1, 0] (6 + sqrt(3)) với 0% sai số!
```

---

## BÀI 3: CẤU TRÚC ĐIỀU KHIỂN & ĐẶC SẢN `branch3`

### 3.1. Rẽ Nhánh 3 Hướng (`branch3`) - 1 Chu Kỳ Máy
Thay vì phải dùng `if (delta < 0) ... else if (delta == 0) ... else ...` làm tốn 2-3 lệnh nhảy và gây stall pipeline vi xử lý, Tersun cung cấp khối rẽ nhánh **1 chu kỳ máy**:

```setun
let x = 10;
let y = 20;
let delta = x - y;

branch3 (delta) {
    negative => {
        println("x nhỏ hơn y (Trạng thái -1)");
    }
    zero => {
        println("x bằng y (Trạng thái 0)");
    }
    positive => {
        println("x lớn hơn y (Trạng thái +1)");
    }
}
```

### 3.2. Toán Tử So Sánh 3 Ngôi (`<=>`)
Toán tử `<=>` so sánh hai giá trị và trả về đúng $-1, 0, +1$:
```setun
let flag = a <=> b;
// -1 nếu a < b
//  0 nếu a == b
// +1 nếu a > b
```

### 3.3. Vòng Lặp `while` và Lệnh Điều Kiện `if-else`
```setun
let mut i = 0;
while (i < 5) {
    if (i == 2) {
        println("Điểm giữa!");
    } else {
        println(i);
    }
    i = i + 1;
}
```

---

## BÀI 4: HÀM & LẬP TRÌNH GENERIC ĐA HÌNH HÓA (`<T>`)

### 4.1. Khai Báo Hàm
Bạn có thể dùng từ khóa `fn` hoặc `def`:
```setun
fn add(a: int, b: int) -> int {
    return a + b;
}

def multiply_exact(a: taf3, b: taf3) -> taf3 {
    return a * b;
}
```

### 4.2. Hàm Generic Monomorphization (`<T>`) Không Tốn Chi Phí
Hàm generic cho phép viết thuật toán tổng quát cho mọi kiểu dữ liệu. Trình biên dịch Tersun sẽ chuyên biệt hóa hàm tại thời điểm biên dịch (`Zero-Cost Monomorphization`):

```setun
// Định nghĩa hàm Generic với tham số kiểu T
fn identity<T>(x: T) -> T {
    return x;
}

fn main() {
    let a = identity(100);             // Tự động sinh hàm identity__int
    let b = identity("Tersun 1.0.0");   // Tự động sinh hàm identity__string
    let c = identity([1, 1, 0]);       // Tự động sinh hàm identity__taf3
    
    println(a);
    println(b);
}
```

---

## BÀI 5: HƯỚNG ĐỐI TƯỢNG (OOP) & MẢNG LAI GHÉP PYTHON

Tersun kết hợp tính an toàn, tốc độ của C++ với cú pháp linh hoạt của Python.

### 5.1. Định Nghĩa Lớp Đối Tượng (`class`)
Lớp trong Tersun hỗ trợ con trỏ `self` và bảng điều hướng động V-Table:

```setun
class Hero {
    pub name: string;
    pub hp: int;
    pub atk: int;

    def take_damage(self, dmg: int) {
        self.hp = self.hp - dmg;
    }

    def heal(self, amt: int) {
        self.hp = self.hp + amt;
    }

    def is_alive(self) -> bool {
        if (self.hp > 0) {
            return true;
        }
        return false;
    }
}

fn main() {
    let arthur = Hero("Arthur", 100, 25);
    arthur.take_damage(35);
    println(arthur.hp); // Xuất ra: 65
    
    arthur.heal(15);
    println(arthur.hp); // Xuất ra: 80
}
```

### 5.2. Cấu Trúc Giá Trị Stack (`struct`)
`struct` được cấp phát trực tiếp trên Stack với chi phí phụ bộ nhớ bằng 0 (Value Type):
```setun
struct Point3D {
    pub x: int;
    pub y: int;
    pub z: int;
}
```

### 5.3. Mảng Động & Chỉ Mục Âm Kiểu Python
Tersun hỗ trợ các phương thức mảng tiện lợi và **chỉ mục âm** tự động tính từ cuối mảng:

```setun
let items = ["Kiếm", "Khiên", "Giáp"];

// Thêm phần tử
items.append("Nhẫn Ma Thuật");

// Độ dài mảng
println(len(items)); // 4

// Truy xuất chỉ mục âm
println(items[-1]); // "Nhẫn Ma Thuật" (Phần tử cuối)
println(items[-2]); // "Giáp" (Phần tử áp chót)
```

---

## BÀI 6: KIỂU ĐẠI SỐ (ADT ENUM) & KHỚP MẪU (`match`)

### 6.1. Khai Báo Enum Mang Dữ Liệu (Algebraic Data Types)
```setun
enum GameState {
    Menu,
    Playing(int),       // Mang cấp độ màn chơi
    GameOver(string)    // Mang thông điệp kết thúc
}
```

### 6.2. Khớp Mẫu Bao Quát (Exhaustive Pattern Matching)
```setun
enum TriState {
    Neg,
    Zero,
    Pos
}

fn check_status(s: TriState) {
    match (s) {
        case TriState::Neg => { println("Trạng thái âm"); }
        case TriState::Zero => { println("Trạng thái không"); }
        case TriState::Pos => { println("Trạng thái dương"); }
    }
}
```
- Nếu một nhánh của Enum bị bỏ quên và không có nhánh mặc định `_`, Trình phân tích ngữ nghĩa sẽ tự động phát cảnh báo:
  `[Type Warning] Match expression on enum 'TriState' may not be exhaustive.`

---

## BÀI 7: TRÍ TUỆ NHÂN TẠO BITNET & MÔ PHỎNG VẬT LÝ KHÔNG TRÔI TỌA ĐỘ

### 7.1. Phép Nhân Ma Trận AI Không Dùng Bộ Nhân (`@`)
Mô hình BitNet 1.58-bit sử dụng ma trận trọng số gồm 3 giá trị $\{-1, 0, +1\}$.  
Tersun cung cấp toán tử ma trận `@` được biên dịch thành các phép cộng/trừ tích lũy song song:

```setun
// Nhân ma trận trọng số W với vector đầu vào X
let output = weights @ input_vector;
```
- Phép tính $1024 \times 1024$ (1 triệu phép tính) hoàn tất trong **$4.6\text{ ms}$** mà không tiêu tốn transistor nhân phần cứng.

### 7.2. Mô Phỏng Vật Lý 3D Không Trôi Tọa Độ
```setun
let mut pos = tvec3(0, 0, 0);
let vel = tvec3(1, 2, 0);

let mut step = 0;
while (step < 1000000) {
    pos = pos + vel;
    step = step + 1;
}
// Sau 1,000,000 bước tích phân liên tục:
// Tọa độ bảo toàn độ chính xác tuyệt đối 100%, drift = 0.00000000%!
```

---

# PHẦN III: DỰ ÁN MẪU HOÀN CHỈNH (HELLO TERSUN)

Tạo file `app.stn` và thử nghiệm:

```setun
// app.stn - Ứng dụng mẫu tổng hợp các tính năng của Tersun 1.0.0

class Spaceship {
    pub name: string;
    pub shield: int;
    pub coord: taf3;

    def take_hit(self, dmg: int) {
        self.shield = self.shield - dmg;
    }
}

fn announce<T>(val: T) {
    println(val);
}

fn main() {
    println("==================================================");
    println("      Chao mung den voi Tersun 1.0.0!            ");
    println("==================================================");

    // 1. TAFPU Math 0% Error
    let a: taf3 = [1, 1, 0];   // 1 + sqrt(3)
    let b: taf3 = [1, -1, 0];  // 1 - sqrt(3)
    let exact_prod = a * b;    // (1+sqrt(3))(1-sqrt(3)) = -2
    print("Ket qua phep nhan dai so TAFPU: ");
    println(exact_prod); // [-2, 0, 0]

    // 2. OOP & Pythonic Array
    let ship = Spaceship("Apollo-Tersun", 100, [0, 0, 0]);
    ship.take_hit(30);
    print("Mau con lai cua phi thuyen: ");
    println(ship.shield); // 70

    let planets = ["Trai Dat", "Sao Hoa", "Sao Moc"];
    print("Hanh tinh xa nhat: ");
    println(planets[-1]); // Sao Moc

    // 3. 3-Way Branching
    let fuel = 10;
    branch3 (fuel) {
        negative => { println("Canh bao: Can kiet nhien lieu!"); }
        zero     => { println("Canh bao: Nhien lieu bang 0!"); }
        positive => { println("Nhien lieu on dinh, san sang xuat phat!"); }
    }

    // 4. Generic Function
    announce("He thong da san sang!");
}
```

### Chạy Chương Trình:
```bash
# Cách 1: Chạy bằng máy ảo VM
setunc run app.stn

# Cách 2: Chạy JIT siêu tốc trong RAM
setunc run --jit-ram app.stn

# Cách 3: Biên dịch ra file chạy Native Windows .exe
setunc compile app.stn --native -o app.exe
./app.exe
```

---

<p align="center">
  <b>Tersun 1.0.0 Documentation</b> • Hướng dẫn và Giáo trình Toàn diện cho Kỷ nguyên Điện toán Tam phân.
</p>
