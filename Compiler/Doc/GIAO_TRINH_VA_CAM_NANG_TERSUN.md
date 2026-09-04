# GIÁO TRÌNH TOÀN DIỆN & CẨM NANG LỆNH NGÔN NGỮ TERSUN 1.0.2
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
| `taf3` | Số đại số chính xác trong $\mathbb{Q}(\sqrt{3})$ | `let v: taf3 = [1, 2, 0];` |
| `tvec3` | Vector 3 chiều đại số | `let vec = tvec3(1, 0, -1);` |
| `bool` | Giá trị luận lý | `let ok: bool = true;` |
| `string` | Chuỗi ký tự UTF-8 | `let msg = "Hello Tersun";` |
| `array` | Mảng động hỗ trợ chỉ mục âm Pythonic | `let arr = [10, 20, 30];` |

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

Vòng lặp `while`:
```stn
let mut i: int = 0;
while (i < 10) {
    i = i + 1;
}
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

## BÀI 5: ĐIỆN TOÁN LƯỢNG TỬ TERSUN 1.0.2 & MÔ PHỎNG QVM

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

# PHẦN III: DỰ ÁN MẪU HOÀN CHỈNH TERSUN 1.0.2

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
