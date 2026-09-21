# Kiến Trúc Bộ Phát Mã Phần Cứng Verilog RTL (Tersun Hardware Synthesis Reference)

```text
Tài Liệu:            Tersun Hardware Synthesis & Synthesizable Verilog-2001 RTL Specification
Phiên Bản:           1.1.0 (Gate 7.5 Edition)
Trạng Thái:          Cryptographically Sealed & Verified
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793 (Gate 6.0) / Gate 7.5 Silicon Bridge
Kiểm Chứng:          100% Passing Verilog RTL Syntax & FPGA Synthesis Conformance Tests
Phân Hệ:             Bộ Phát Mã RTL IP-Core, Mạch Số Đại Số TAFPU & Bộ Cộng Tam Phân Cân Bằng BTVP
Quy Mô Tệp:          2 Files (verilog_emitter.cpp, verilog_emitter.hpp) | 125 LOC
Nhóm Phụ Trách:      Hardware Synthesis, FPGA IP-Core Design & Silicon Integration Team
```

---

## I. VAI TRÒ & TRÁCH NHIỆM (MODULE NÀY LÀM GÌ)

Phân hệ **`hardware` (Verilog Emitter)** đóng vai trò là cầu nối trực tiếp giữa tầng phần mềm của trình biên dịch Tersun và phần cứng vi mạch số thực thể:

1. **Tự Động Phát Sinh Mã Phần Cứng Số Chuẩn Verilog-2001 (Synthesizable RTL)**:
   - Thay vì chỉ biên dịch mã nguồn thành bytecode máy ảo hoặc mã máy x86_64, Tersun có khả năng xuất trực tiếp mã phần cứng Verilog có thể tổng hợp được (Synthesizable RTL).
   - Mã nguồn sinh ra tương thích hoàn toàn với các công cụ tổng hợp vi mạch tiêu chuẩn công nghiệp như AMD/Xilinx Vivado, Intel Quartus Prime, Synopsys Design Compiler, hoặc công cụ nguồn mở Yosys.

2. **Cung Cấp Các Khối IP-Core Số Học Đại Số & Tam Phân Tiền Chế**:
   - **Khối TAFPU ALU Core (`tafpu_alu_core`)**: Thực hiện các phép cộng, trừ, nhân số đại số trên trường $\mathbb{Q}(\sqrt{3})$ hoàn toàn bằng phần cứng số nguyên đồng bộ.
   - **Khối BTVP Full Adder (`btvp_trit_adder`)**: Bộ cộng tam phân cân bằng 1-trit với logic truyền nhớ hai chiều tự nhiên.

3. **Hiện Thực Hóa Tăng Tốc Phần Cứng Cho AI & Mạng Nơ-ron**:
   - Cung cấp mô hình tham chiếu phần cứng để đúc thành chip ASIC hoặc nạp vào FPGA tăng tốc cho động cơ suy luận BitNet 1.58b.

---

## II. NGUYÊN LÝ & CƠ CHẾ HOẠT ĐỘNG (NHƯ THẾ NÀO)

### 1. Kiến Trúc Khối IP-Core TAFPU ALU (`tafpu_alu_core`)

Khối TAFPU ALU tính toán các phần tử số đại số dạng:
$$X = (A + B\sqrt{3}) \cdot 3^{S/2}$$

```mermaid
graph TD
    subgraph INPUTS["Tín Hiệu Đầu Vào"]
        CLK["Xung Nhịp clk"]
        RST["Tín Hiệu Reset rst_n"]
        OP["Chọn Phép Toán op_sel (2'b00: ADD, 2'b01: SUB, 2'b10: MUL)"]
        IN_A["Số Đại Số A (A1, B1, S1)"]
        IN_B["Số Đại Số B (A2, B2, S2)"]
    end

    subgraph ALU_LOGIC["Mạch Tổ Hợp & Thanh Ghi Đồng Bộ"]
        OP --> DECODER{"Giải Mã Lệnh"}
        DECODER -->|ADD / SUB| ADD_SUB_UNIT["Bộ Cộng/Trừ 64-bit Có Dấu"]
        DECODER -->|MUL| MUL_UNIT["Mạch Nhân Đại Số Song Song: A1*A2 + 3*B1*B2"]
    end

    subgraph OUTPUTS["Tín Hiệu Đầu Ra"]
        ADD_SUB_UNIT --> MUX["Bộ Chọn Kết Quả Đồng Bộ"]
        MUL_UNIT --> MUX
        MUX --> REG_OUT["Thanh Ghi Đầu Ra (out_a, out_b, out_s)"]
        REG_OUT --> VALID["Cờ Sẵn Sàng valid = 1'b1"]
    end
```

#### Mạch Nhân Đại Số Tổ Hợp Đồng Bộ:
Phép nhân hai số đại số $(A_1 + B_1\sqrt{3})(A_2 + B_2\sqrt{3})$ được tổng hợp thành mạch nhân số nguyên $64$-bit song song và mạch logic cộng nhân $3$:
```verilog
wire signed [63:0] mul_res_a = mul_a1_a2[63:0] + (3 * mul_b1_b2[63:0]);
wire signed [63:0] mul_res_b = mul_a1_b2[63:0] + mul_a2_b1[63:0];
```
Nhờ cấu trúc này, không cần bộ tính toán dấu phẩy động phức tạp; toàn bộ phép tính đại số chính xác tuyệt đối được thực thi bằng logic số nguyên tiêu chuẩn.

---

### 2. Mạch Cộng Tam Phân Cân Bằng BTVP (`btvp_trit_adder`)

Logic tam phân cân bằng $\{-1, 0, +1\}$ được ánh xạ vào cặp bit nhị phân (2-bit encoding):
- `2'b11`: Trit $-1$
- `2'b00`: Trit $0$
- `2'b01`: Trit $+1$

Bộ cộng 1-trit BTVP xử lý nhớ hai chiều (Balanced Ternary Carry Propagation), trong đó nhớ có thể mang giá trị âm, triệt tiêu hiện tượng tràn bit đơn hướng của số nhị phân:
$$S = A + B + C_{in} \pmod 3, \quad C_{out} = \text{Carry}(A, B, C_{in})$$
Mạch logic tổ hợp này được tối ưu hóa chỉ tốn vài bảng tra cứu LUT trên vi mạch FPGA.

---

## III. CẤU TRÚC DỮ LIỆU & DANH MỤC TỆP NGUỒN (CẤU TRÚC RA SAO)

### 1. Danh Mục Tệp Nguồn (2 Files)

| Tệp Nguồn | Trách Nhiệm Kỹ Thuật | Điểm Neo Mã Nguồn (Symbol) |
| :--- | :--- | :--- |
| `include/hardware/verilog_emitter.hpp` | Khai báo lớp `VerilogEmitter` và các phương thức phát sinh mã Verilog RTL cho ALU và bộ cộng BTVP. | `class VerilogEmitter`<br>`VerilogEmitter::emit_tafpu_alu_core()`<br>`VerilogEmitter::emit_btvp_adder_module()` |
| `src/hardware/verilog_emitter.cpp` | Triển khai bộ phát mã nguồn Verilog-2001 chuẩn công nghiệp, định dạng tín hiệu clock, reset và state machine. | `VerilogEmitter::emit_tafpu_alu_core()`<br>`VerilogEmitter::emit_btvp_adder_module()` |

### 2. Cấu Trúc Giao Tiếp Phần Cứng Chuẩn (Hardware Interface Port Specification)

```verilog
module tafpu_alu_core (
    input  wire        clk,      // Xung nhịp hệ thống (Global Clock)
    input  wire        rst_n,    // Reset tích cực mức thấp (Active-Low Async Reset)
    input  wire [1:0]  op_sel,   // 2'b00: ADD, 2'b01: SUB, 2'b10: MUL
    input  wire signed [63:0] in_a1, in_b1,
    input  wire signed [31:0] in_s1,
    input  wire signed [63:0] in_a2, in_b2,
    input  wire signed [31:0] in_s2,
    output reg  signed [63:0] out_a, out_b,
    output reg  signed [31:0] out_s,
    output reg         valid     // Báo hiệu kết quả tính toán hợp lệ
);
```

### 3. Ma Trận Bằng Chứng Thuật Toán (Algorithm Evidence Matrix)

| Cơ chế / Thuật toán | Trạng thái | Điểm Neo Mã Nguồn (Symbol) | Bộ Test Xác Minh | Cấp Độ Bằng Chứng | Mốc Niêm Phong |
| :--- | :---: | :--- | :--- | :---: | :--- |
| **TAFPU RTL Generation** | **SEALED** | `VerilogEmitter::emit_tafpu_alu_core` | `setunc_test.exe` (ST-H01) | Synthesizable RTL Syntax | Gate 6.0 |
| **BTVP Full Adder RTL** | **SEALED** | `VerilogEmitter::emit_btvp_adder_module` | `setunc_test.exe` (ST-H02) | Truth Table Exactness | Gate 6.0 |

---

## IV. SƠ ĐỒ LUỒNG & HỢP ĐỒNG GIAO TIẾP (PIPELINE RÕ RÀNG)

### 1. Sơ Đồ Luồng Phát Sinh & Tổng Hợp Phần Cứng (Hardware Synthesis Pipeline)

```mermaid
flowchart TD
    subgraph COMPILER["Trình Biên Dịch Tersun (Frontend & Middle-End)"]
        A1["Mã Nguồn Ngôn Ngữ Setun (.stn)"] --> A2["AST & Typed IR"]
        A2 --> A3{"Cờ Biên Dịch --emit-verilog?"}
    end

    subgraph EMITTER["Phân Hệ Hardware (VerilogEmitter)"]
        A3 -->|Kích hoạt| B1["VerilogEmitter::emit_tafpu_alu_core()"]
        A3 -->|Kích hoạt| B2["VerilogEmitter::emit_btvp_adder_module()"]
        B1 --> B3["Sinh Tệp Mã Nguồn Verilog (tafpu_core.v)"]
        B2 --> B3
    end

    subgraph EDA_TOOLCHAIN["Công Cụ EDA Bán Dẫn (Vivado / Quartus / Yosys)"]
        B3 --> C1["RTL Elaboration & Cú Pháp Verilog-2001"]
        C1 --> C2["Technology Mapping (LUT, DSP Slice, Flip-Flop)"]
        C2 --> C3["Place & Route (P&R) & Phân Tích Thời Gian Tĩnh (STA)"]
        C3 --> C4["Bitstream nạp vào FPGA / Mask ASIC GDSII"]
    end
```

### 2. Hợp Đồng Giao Tiếp & Bất Biến (System Invariants)

- **Bất biến Chuẩn Synthesizable Verilog-2001**:
  Mã nguồn sinh ra tuyệt đối không chứa các cấu trúc mô phỏng không thể tổng hợp được (như `#delay`, `initial` không có reset, hoặc toán tử chia động `/` không qua IP-core chia số nguyên).
- **Bất biến Reset Tích Cực Mức Thấp (Active-Low Async Reset)**:
  Mọi thanh ghi `always @(posedge clk or negedge rst_n)` đều bắt buộc phải có nhánh xử lý reset rõ ràng, đưa toàn bộ đầu ra về trạng thái $0$ an toàn khi `rst_n == 1'b0`.
- **Bất biến Đồng Nhất Bảng Chân Trị BTVP**:
  Bảng chuyển đổi tín hiệu trong `btvp_trit_adder` phải khớp $100\%$ với phép toán cộng tam phân Kleene/Łukasiewicz đã được kiểm chứng hình thức tại phân hệ `tafpu`.

### 3. Giới Hạn Kiến Trúc & Non-Goals

- **Giới hạn Tần Số Xung Nhịp (Fmax Boundary)**: Mạch nhân đại số sử dụng bộ nhân số nguyên 64-bit có đường trễ tổ hợp (critical path) dài hơn so với bộ cộng nhị phân thuần túy; trên FPGA Artix-7 tốc độ đạt khoảng 150–200 MHz nếu không chèn thêm tầng thanh ghi đường ống (pipelining stages).
- **Non-Goals**: Không tự động phát sinh toàn bộ bố trí mặt nạ vi mạch ASIC GDSII hoàn chỉnh mà tập trung vào các khối RTL IP-Core chuẩn để nhúng vào hệ thống SoC.
