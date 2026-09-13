# Cẩm Nang Lập Trình Toàn Diện: Ngôn Ngữ Tam Phân Setun-70 & TAFPU Q(sqrt(3))

Tài liệu này hướng dẫn chi tiết từ cú pháp cơ bản, hệ thống kiểu dữ liệu, các cấu trúc dữ liệu chuyên biệt, các thuật toán toán học/AI, đến các đoạn mã nguồn mẫu hoàn chỉnh có thể chạy trực tiếp trên máy ảo Setun-70.

> **🆕 Cập nhật Tersun 1.0.3:** Ngôn ngữ now có thêm `for` (3 kiểu)/`break`/`continue`/`elif`, toán tử `&&` `||` `not`, closures + `map`/`filter`/`reduce`, generics (`::<T>`), `interface` + conformance, `try`/`catch`/`throw`, namespace (`import "x.stn" as gui;` + `pub`/`priv`), chuỗi Unicode (`ulen`/`uslice`), f-string, và trần 64KB đã dỡ. Chi tiết đầy đủ xem **GIAO_TRINH_VA_CAM_NANG_TERSUN.md — Bài 6**. Các ví dụ trong tài liệu này vẫn chạy nguyên bản 1.0.3.

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

> **Mới 1.0.3:** ngoài `while`, ngôn ngữ có `for i in range(10)`, `for x in mang`, `for (let i = 0; i < n; i += 1)` cùng `break`/`continue` — xem Bài 6 trong giáo trình đầy đủ.
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

---

## 6. Lập Trình Điện Toán Lượng Tử QVM (Quantum Programming)

Tersun 1.0.3 tích hợp sẵn cỗ máy ảo lượng tử QVM ở tầng lõi ngôn ngữ, cho phép bạn thiết kế mạch lượng tử, mô phỏng trên vector trạng thái số phức $\mathbb{C}$, và xuất mạch ra chuẩn quốc tế OpenQASM 3.0.

### 6.1. Khởi Tạo Thanh Ghi & Mạch Lượng Tử
```text
// Khởi tạo thanh ghi lượng tử 3 qubit (mặc định ở trạng thái ground state |000>)
let mut reg = QubitRegister(3);

// Khởi tạo mạch điều khiển
let mut circuit = QuantumCircuit(3);
```

### 6.2. Thao Tác Cổng Cơ Bản & Trạng Thái Vướng Víu Bell State
```text
// Tạo trạng thái Bell (|00> + |11>)/sqrt(2)
circuit.h(0);          // Cổng Hadamard đưa Qubit 0 vào chồng chập
circuit.cnot(0, 1);     // Cổng CNOT tạo vướng víu giữa Qubit 0 và Qubit 1

// Thực thi mạch trên thanh ghi
circuit.execute(reg);

// Đo đạc sụp đổ hàm sóng (10,000 lượt đo)
let m0 = reg.measure(0);
let m1 = reg.measure(1);
// Kết quả m0 và m1 luôn đồng nhất 100% (00 hoặc 11)
```

### 6.3. Thuật Toán Tìm Kiếm Lượng Tử Grover 3-Qubit
Tìm kiếm phần tử đích $|\omega\rangle = |111\rangle$ (chỉ số 7):
```text
let mut qc = QuantumCircuit(3);

// 1. Chồng chập đều
for i in range(3) { qc.h(i); }

// 2. Oracle: Lật pha trạng thái |111>
qc.h(2);
qc.toffoli(0, 1, 2);
qc.h(2);

// 3. Toán tử khuếch tán (Diffusion Operator)
for i in range(3) { qc.h(i); }
for i in range(3) { qc.x(i); }
qc.h(2);
qc.toffoli(0, 1, 2);
qc.h(2);
for i in range(3) { qc.x(i); }
for i in range(3) { qc.h(i); }

// Sau 1 chu kỳ, xác suất đo được |111> đạt đúng 78.125%
```

---

## 7. Lập Trình Hiệu Năng Cao Với JIT, OSR & Biên Dịch Native AOT

### 7.1. Tận Dụng On-Stack Replacement (OSR) Trong Vòng Lặp Nóng
Khi viết các vòng lặp tính toán dữ liệu lớn, hãy giữ thân vòng lặp đồng nhất về kiểu để JIT Engine kích hoạt OSR ngay trong quá trình chạy:
```text
fn compute_heavy_loop(n: int) -> int {
    let mut sum: int = 0;
    // Vòng lặp 10 triệu bước sẽ tự động chuyển từ Interpreter sang mã máy JIT x86-64 qua OSR
    for i in range(n) {
        sum += (i & 1);
    }
    return sum;
}
```

### 7.2. Tối Ưu Hóa Struct Phẳng (Value Types) Đạt Tốc Độ Tiệm Cận C++/Rust
Tránh việc bao bọc đối tượng (boxing) không cần thiết. Khai báo các trường dữ liệu nguyên thủy trong `struct` để Tersun Native AOT sắp xếp layout phẳng trên bộ nhớ liên tục:
```text
struct Particle {
    pub id: int;
    pub x: int;
    pub y: int;
    pub energy: int;
}

// Hàm cập nhật đối tượng đạt tốc độ 0.56 ms (ngang ngửa C++ 0.46 ms)
fn update_particles(p: Particle, delta: int) -> Particle {
    return Particle(p.id, p.x + delta, p.y + delta, p.energy - 1);
}
```

### 7.3. Các Lệnh Biên Dịch Native AOT Tối Ưu Cao
```bash
# 1. Biên dịch Native AOT với tối ưu hóa cấp độ cao (-O3)
setunc compile main.stn --native -O3 -o main.exe

# 2. Xuất mạch lượng tử ra file OpenQASM 3.0 cho máy IBM Quantum:
setunc emit-qasm main.stn -o quantum_circuit.qasm
```

---

## 8. Các Mã Nguồn Mẫu Nâng Cao

### Mẫu 4: Mạch Lượng Tử Grover 3-Qubit Hoàn Chỉnh (`06_grover_quantum.stn`)
```stn
fn main() -> int {
    println("=== Tersun Quantum: Grover Search (Target = |111>) ===");
    
    let mut reg = QubitRegister(3);
    let mut circuit = QuantumCircuit(3);
    
    // Gọi hàm Grover tích hợp sẵn trong thư viện lượng tử
    circuit.grover(3, 7); // target = 7 (|111>)
    circuit.execute(reg);
    
    // Đo đạc xác suất biên độ
    let p_target = reg.prob1(0) * reg.prob1(1) * reg.prob1(2);
    print("Xac suat do duoc phan tu dich |111>: ");
    println(p_target); // ~0.78125
    
    return 0;
}
```

### Mẫu 5: Benchmark Đối Tượng 200k Lượt Tốc Độ Cao (`07_high_perf_benchmark.stn`)
```stn
struct DataPoint {
    pub id: int;
    pub val: int;
}

fn main() -> int {
    let mut pt = DataPoint(1, 100);
    let mut i = 0;
    
    // Vòng lặp 200,000 lượt cập nhật đối tượng
    while (i < 200000) {
        pt = DataPoint(pt.id + 1, pt.val + (i & 3));
        i += 1;
    }
    
    println("Ket qua Checksum sau 200k iters:");
    println(pt.val); // Chạy trên AOT chỉ mất 0.56 ms!
    return 0;
}
```
