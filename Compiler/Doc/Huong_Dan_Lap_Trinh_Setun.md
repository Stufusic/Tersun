# Cẩm Nang Lập Trình Toàn Diện: Ngôn Ngữ Tam Phân Setun-70 & TAFPU Q(sqrt(3))

Tài liệu này hướng dẫn chi tiết từ cú pháp cơ bản, hệ thống kiểu dữ liệu, các cấu trúc dữ liệu chuyên biệt, các thuật toán toán học/AI, đến các đoạn mã nguồn mẫu hoàn chỉnh có thể chạy trực tiếp trên máy ảo Setun-70.

---

## 1. Hệ Thống Kiểu Dữ Liệu (Data Types)

| Kiểu dữ liệu | Kích thước | Miền giá trị / Cú pháp | Ý nghĩa & Ứng dụng |
| :--- | :--- | :--- | :--- |
| **`trit`** | 2 bit | `T` (hoặc `-1`), `0`, `1` (hoặc `+1`) | Đơn vị logic tam phân cơ bản: Sai ($-1$), Không xác định ($0$), Đúng ($+1$). |
| **`tryte`** | 16 bit | Dải $[-364, 364]$, literal `@10T1`, `@1TTT` | Từ máy tam phân 6-trit (tương đương byte trong máy tính nhị phân). |
| **`taf3`** | 24 bytes | `[A, B, S]` (ví dụ: `[14, 25, 0]`, `[1, 1, 0]`) | **Số thực đại số $\mathbb{Q}(\sqrt{3})$**: $X = (A + B\sqrt{3}) \cdot 3^{S/2}$. Sai số đại số $0\%$ tuyệt đối. |
| **`int`** | 64 bit | `10`, `-42`, `1000` | Số nguyên 64-bit có dấu. |
| **`float`** | 64 bit | `3.14159`, `-0.05` | Số thực dấu phẩy động chuẩn IEEE 754. |
| **`bool`** | 1 byte | `true`, `false` | Kiểu logic nhị phân truyền thống. |
| **`string`** | Con trỏ | `"Xin chao Setun-70"` | Chuỗi ký tự văn bản. |

---

## 2. Cú Pháp Cơ Bản (Language Syntax)

### 2.1. Khai báo & Gán Biến (`let`, `=`)
```text
// Khai báo có định kiểu hoặc suy luận kiểu tự động
let a: int = 10;
let b = 20;
let name: string = "Setun-70";

// Khai báo số thực đại số TAFPU Q(sqrt(3))
let x: taf3 = [1, 1, 0];       // Biểu diễn (1 + 1*sqrt(3)) * 3^(0/2) ≈ 2.7320508
let y: taf3 = [1, -1, 0];      // Biểu diễn (1 - 1*sqrt(3)) * 3^(0/2) ≈ -0.7320508

// Gán lại giá trị
a = a + 5;
```

---

### 2.2. Toán Tử Số Học & So Sánh 3 Ngôi
* **Số học**: `+`, `-`, `*`, `/` (tính toán chính xác $0\%$ sai số trên kiểu `taf3`).
* **So sánh 2 ngôi**: `==`, `!=`, `<`, `<=`, `>`, `>=`.
* **Toán tử so sánh 3 ngôi (`<=>`)**:
  - Trả về `-1` (nếu vế trái $<$ vế phải).
  - Trả về `0` (nếu vế trái $==$ vế phải).
  - Trả về `+1` (nếu vế trái $>$ vế phải).
* **Toán tử Logic Kleene Tam Phân**:
  - `min(a, b)`: Phép AND tam phân (lấy giá trị nhỏ nhất).
  - `max(a, b)`: Phép OR tam phân (lấy giá trị lớn nhất).
  - `~a` (hoặc `not a`): Phủ định tam phân ($-1 \rightarrow +1, 0 \rightarrow 0, +1 \rightarrow -1$).

---

### 2.3. Cấu Trúc Rẽ Nhánh 3 Hướng (`branch`)
Thay vì dùng nhiều `if-else` lồng nhau, Setun-70 cung cấp cấu trúc rẽ nhánh **1 chu kỳ máy**:
```text
let status = x <=> y; // So sánh x và y

branch (status) {
    -1 -> {
        println("Nhanh Am: x nho hon y");
    }
     0 -> {
        println("Nhanh Khong: x bang y");
    }
    +1 -> {
        println("Nhanh Duong: x lon hon y");
    }
}
```
*(Hỗ trợ cả cú pháp `case -1:`, `case 0:`, `case +1:` hoặc `-1 ->`, `0 ->`, `+1 ->`)*

---

### 2.4. Vòng Lặp (`while`)
```text
let count = 0;
while (count < 5) {
    print("Lan lap: ");
    println(count);
    count = count + 1;
}
```

---

### 2.5. Định Nghĩa Hàm & Đệ Quy (`fn`, `return`)
```text
// Hàm tính lũy thừa đại số (1 + sqrt(3))^n đệ quy
fn power(base: taf3, exp: int) -> taf3 {
    if (exp <= 0) {
        return [1, 0, 0]; // (1 + 0*sqrt(3)) = 1
    }
    return base * power(base, exp - 1);
}

let x: taf3 = [1, 1, 0];
let x_cubed = power(x, 3); // Ket qua chinh xac tuyet doi: [10, 6, 0] = 10 + 6*sqrt(3)
```

---

## 3. Các Cấu Trúc Dữ Liệu Chuyên Biệt Trong Thư Viện

### 3.1. Vector 3D Đại Số (`tvec3`) — Không Gian Vật Lý Zero-Drift
Đóng gói vector 3 chiều $(x, y, z)$ với mỗi thành phần là một số đại số `taf3`:
* **Tích vô hướng (Dot Product)**: `v1.dot(v2)`.
* **Tích có hướng (Cross Product)**: `v1.cross(v2)`.
* **Khoảng cách bình phương Euclidean**: $d^2 = \Delta x^2 + \Delta y^2 + \Delta z^2$ (Bảo toàn $0\%$ sai số).
* **Kiểm tra định hướng 3 chiều (Orientation Test)**: Phân loại điểm (`+1`: Trong, `0`: Trên biên, `-1`: Ngoài).

---

### 3.2. Ma Trận Đại Số & BitNet AI GEMM (`tmat<Rows, Cols>`)
* **Chuyển vị (Transpose)**, **Định thức (Determinant)**, **Nghịch đảo chính xác (Exact Inverse)**.
* **Multiplication-free GEMM (BitNet 1.58-bit AI)**: Nhân ma trận trọng số $\{-1, 0, 1\}$ với vector kích hoạt TAFPU bằng cơ chế cộng/trừ và `zero-skip` không cần bộ nhân phần cứng.

---

### 3.3. Đại Số Quaternion Tam Phân (`tquat`)
* Biểu diễn phép xoay 3D qua $q = w + x\mathbf{i} + y\mathbf{j} + z\mathbf{k}$ trên $\mathbb{Q}(\sqrt{3})$.
* Quay vector 3D $v' = q \cdot v \cdot \bar{q}$ mà không bị suy hao chuẩn đơn vị qua hàng triệu chu kỳ lặp.

---

### 3.4. Cây Tìm Kiếm Tam Phân (`TernarySearchTree` - TST)
* Cây 3 nhánh tự nhiên dựa trên ký tự phân tách: nhánh trái (`<`), nhánh giữa (`==`), nhánh phải (`>`). Tra cứu chuỗi $O(\log_3 N)$.

---

### 3.5. Bộ Giải Tuyến Tính Gauss-Jordan Đại Số (`solve_gauss_jordan`)
* Giải hệ phương trình $A \cdot x = b$ trên trường số $\mathbb{Q}(\sqrt{3})$ với các bước khử ma trận bảo toàn tính nguyên, loại bỏ triệt để sai số làm tròn số thực.

---

## 4. Các Mã Nguồn Mẫu Hoàn Chỉnh

### Mẫu 1: Tính Toán Số Học Đại Số TAFPU & Kiểm Soát Sai Số (`01_tafpu_demo.taf`)
```text
println("=== 1. TAFPU Algebraic Exact Arithmetic ===");

// Khai báo hai số vô tỷ liên hợp: (1 + sqrt(3)) và (1 - sqrt(3))
let x1: taf3 = [1, 1, 0];
let x2: taf3 = [1, -1, 0];

// Nhân đại số: (1 + sqrt(3))*(1 - sqrt(3)) = 1 - 3 = -2
let prod = x1 * x2;
print("(1 + sqrt(3)) * (1 - sqrt(3)) = ");
println(prod); // In ra [-2, 0, 0] (chính xác tuyệt đối -2)

// Cộng đại số: (14 + 25*sqrt(3)) + (10 - 5*sqrt(3)) = 24 + 20*sqrt(3)
let y1: taf3 = [14, 25, 0];
let y2: taf3 = [10, -5, 0];
let sum = y1 + y2;
print("y1 + y2 = ");
println(sum); // In ra [24, 20, 0]
```

---

### Mẫu 2: Rẽ Nhánh 3 Hướng & Cổng Logic Kleene (`02_branch3_demo.taf`)
```text
println("=== 2. Setun-70 3-Way Branching & Kleene Logic ===");

let a = 14;
let b = 25;
let cmp_res = a <=> b; // a < b => tra ve -1

branch (cmp_res) {
    -1 -> { println("Ket qua: a NHO HON b (-1)"); }
     0 -> { println("Ket qua: a BANG b (0)"); }
    +1 -> { println("Ket qua: a LON HON b (+1)"); }
}

// Logic Kleene Tam phan
let t1 = 1;   // Dung
let t2 = -1;  // Sai
let k_and = min(t1, t2); // min(1, -1) = -1
let k_or  = max(t1, t2); // max(1, -1) = 1
let k_not = ~t1;         // ~1 = -1

print("Kleene AND: "); println(k_and);
print("Kleene OR:  "); println(k_or);
print("Kleene NOT: "); println(k_not);
```

---

### Mẫu 3: Mô Phỏng Mạng Nơ-ron AI BitNet 1.58-bit & Vật Lý 3D (`05_bitnet_ai_and_physics.taf`)
```text
println("=== 3. BitNet 1.58-bit AI & Exact 3D Geometry ===");

// 1. Ham kich hoat tam phan (Quantized Ternary Activation)
fn ternary_activate(val: taf3) -> taf3 {
    branch (val) {
        -1 -> { return [-1, 0, 0]; }
         0 -> { return [0, 0, 0]; }
        +1 -> { return [1, 0, 0]; }
    }
}

// 2. Tinh khoang cach 3D khong troi toa do
fn dist3d_sq(x1: taf3, y1: taf3, z1: taf3, x2: taf3, y2: taf3, z2: taf3) -> taf3 {
    let dx = x1 - x2;
    let dy = y1 - y2;
    let dz = z1 - z2;
    return (dx * dx) + (dy * dy) + (dz * dz);
}

// Vector dau vao
let x: taf3 = [1, 1, 0];   // 1 + sqrt(3) > 0 => activate = 1
let y: taf3 = [-1, 0, 0];  // -1 < 0          => activate = -1
let z: taf3 = [0, 0, 0];   // 0               => activate = 0

let act_x = ternary_activate(x);
let act_y = ternary_activate(y);
let act_z = ternary_activate(z);

print("Activated Activations: [");
print(act_x); print(", "); print(act_y); print(", "); print(act_z); println("]");

// Tinh khoang cach giua 2 diem: P1(10, 20, 30) va P2(13, 24, 30)
let d2 = dist3d_sq([10,0,0], [20,0,0], [30,0,0], [13,0,0], [24,0,0], [30,0,0]);
print("Khoang cach binh phuong d^2 = (3^2 + 4^2) = ");
println(d2); // In ra [25, 0, 0] = 25
```

---

## 5. Hướng Dẫn Biên Dịch & Chạy Bằng Công Cụ `setunc`

### 5.1. Chạy trực tiếp mã nguồn văn bản (`.taf` / `.setun`)
```bash
setunc run my_program.taf
```

### 5.2. Biên dịch ra tệp nhị phân độc quyền (`.tbc` - Ternary Bytecode)
```bash
setunc compile my_program.taf -o my_program.tbc
```

### 5.3. Chạy trực tiếp tệp nhị phân `.tbc`
```bash
setunc run my_program.tbc
```

### 5.4. Xuất mã Assembly trung gian (Disassembly)
```bash
setunc --dump-asm my_program.tbc
```

### 5.5. Sinh mã phần cứng FPGA Verilog RTL
```bash
setunc --emit-verilog > tafpu_alu.v
```

### 5.6. Quản lý dự án với TPM (Ternary Package Manager)
```bash
setunc tpm init my_game       # Tao du an moi voi file setun.toml
setunc tpm build              # Tu dong bien dich toan bo du an
setunc tpm test               # Chay test suite
```

### 5.7. Mở trình thông dịch dòng lệnh tương tác (REPL)
```bash
setunc repl
```
*(Gõ biểu thức toán học hoặc lệnh Setun và nhấn Enter để xem kết quả tức thì)*
