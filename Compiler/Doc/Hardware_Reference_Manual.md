# Sổ Tay Kỹ Thuật Phần Cứng TAFPU & BTVP ALU (Hardware Reference Manual)

Tài liệu này cung cấp hướng dẫn thiết kế, sơ đồ khối mạch số (RTL), định thời và giao tiếp cho các kỹ sư thiết kế phần cứng khi ánh xạ Bộ xử lý Dấu phẩy động Đại số Tam phân (**TAFPU**) và Khối Cộng Đa Trit (**BTVP**) lên chip bán dẫn tùy chỉnh (FPGA / ASIC).

---

## 1. Sơ Đồ Khối Khối Nhân Đại Số TAFPU Mạch Số

Mỗi chu kỳ xung nhịp, khối nhân TAFPU nhận hai thanh ghi đại số $[A_1, B_1, S_1]$ và $[A_2, B_2, S_2]$ để tính toán đồng thời:

```
in_a1 ───┐   in_a2 ───┐
         ├──►[MUL 1]──┼───────────────────────┐
in_b1 ───┼───in_b2 ───┼──►[MUL 2]──►[ x 3 ]───┼──►[ ADD ]───► out_a = (A1*A2 + 3*B1*B2)
         │            │                       │
         ├──►[MUL 3]──┼───────────────────────┤
         │            │                       │
         └──►[MUL 4]──┴───────────────────────┴──►[ ADD ]───► out_b = (A1*B2 + A2*B1)

in_s1 ───────────────────────────────────────────►[ ADD ]───► out_s = S1 + S2
```

### Đặc tính kỹ thuật:
- **Độ trễ (Latency)**: 1 chu kỳ xung nhịp (Pipelined Single-Cycle).
- **Độ rộng Bus**: 64-bit cho hệ số nguyên $A, B$ và 32-bit cho số mũ $S$.
- **Sai số số học**: Tuyệt đối $0\%$ (Không sử dụng xấp xỉ dấu phẩy động nhị phân IEEE-754).

---

## 2. Mã RTL Verilog Tổng Hợp Được

Mã Verilog tổng hợp được sinh ra trực tiếp bằng lệnh:
```bash
./setunc --emit-verilog
```

---

## 3. Mạch Cộng Tam Phân Cân Bằng Đa Trit (BTVP Carry Chain)

Bảng chân lý mạch cộng 1 Trit với Carry Lan truyền (Tái hiện Bảng 1 từ nghiên cứu Khang, 2026):

| $A_i$ | $B_i$ | $C_{in}$ | Tổng Thô | $S_i$ (Sum) | $C_{out}$ (Carry) |
| :---: | :---: | :---: | :---: | :---: | :---: |
| $-1$ | $-1$ | $-1$ | $-3$ | $0$ | $-1$ |
| $-1$ | $-1$ | $0$ | $-2$ | $+1$ | $-1$ |
| $-1$ | $0$ | $0$ | $-1$ | $-1$ | $0$ |
| $0$ | $0$ | $0$ | $0$ | $0$ | $0$ |
| $+1$ | $0$ | $0$ | $+1$ | $+1$ | $0$ |
| $+1$ | $+1$ | $0$ | $+2$ | $-1$ | $+1$ |
| $+1$ | $+1$ | $+1$ | $+3$ | $0$ | $+1$ |
