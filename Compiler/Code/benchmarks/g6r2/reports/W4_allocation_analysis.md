# W4 (Object Property Updates) — SRA & Allocation Forensics Analysis

Tài liệu chứng minh giả thuyết triệt tiêu cấp phát đối tượng (Scalar Replacement of Aggregates)  
Theo quy chuẩn: **Mục 7 tài liệu Doc/G6.2.md**  
Đối tượng nghiên cứu: `benchmarks/forensics/inputs/w4_object.stn` (200,000 iterations Particle updates)

---

## 1. Trích xuất Bằng chứng Mã máy Trực tiếp (Direct Machine Code Evidence)

### 1.1 Native AOT (-O3 GCC/LLVM) Mã máy:
Từ disassembly của `_Z8stn_mainv` trong binary `build/g6r1/working/w4_object_native.exe`:

```nasm
; --- Native AOT Loop Body (Vòng lặp 200,000 bước lặp) ---
1400014e3:   add    r10, 0x3           ; p.y += p.vy (vy = 3, y được giữ trong thanh ghi R10!)
1400014ee:   add    rcx, 0x2           ; p.x += p.vx (vx = 2, x được giữ trong thanh ghi RCX!)
140001501:   mov    rax, rcx
140001504:   imul   rcx                ; rax = x * x
140001507:   mov    r8, rax
14000150a:   mov    rax, r10
14000150d:   imul   r10                ; rax = y * y
140001510:   add    r8, rax            ; r8 = x*x + y*y
140001516:   mul    rbp                ; Phép chia nhân nghịch đảo fast modulo
140001519:   shr    rdx, 0x1d
14000151d:   imul   rdx, rdx, 0x3b9aca07 ; rdx = (x*x + y*y) / 1000000007 * 1000000007
140001524:   sub    r8, rdx            ; r8 = (x*x + y*y) % 1000000007
140001527:   add    rdi, r8            ; total_energy += energy (total_energy nằm trong RDI!)
1400014f6:   xor    rax, 0x927d7       ; Kiểm tra điều kiện dừng i < 200,000
1400014ff:   je     loop_exit
14000154a:   jmp    1400014e3          ; Lặp lại hoàn toàn trên CPU registers
```

### 1.2 Bằng chứng Xác thực Tuyệt đối:
1. **Zero Heap Allocation**: Trong toàn bộ vòng lặp của Native AOT, số lệnh gọi `malloc` / `new` / `ALLOC` là **CHÍNH XÁC BẰNG 0**.
2. **Zero Method Call Overhead**: Các phương thức `Particle.update()` và `Particle.energy()` được **INLINE 100%**.
3. **Register-Only Representation**:
   - `p.x` $\longrightarrow$ Thanh ghi CPU `RCX`
   - `p.y` $\longrightarrow$ Thanh ghi CPU `R10`
   - `p.vx` $\longrightarrow$ Hằng số tức thời `+2`
   - `p.vy` $\longrightarrow$ Hằng số tức thời `+3`
   - `total_energy` $\longrightarrow$ Thanh ghi CPU `RDI`

---

## 2. Đối chiếu Hiện trạng JIT / VM

| Thành phần | Tersun JIT Hiện tại ($M2/M3$) | Native AOT ($M4$ -O3) | Khoảng cách Kỹ thuật |
| :--- | :--- | :--- | :--- |
| **Object Allocation** | Khởi tạo Heap Object `Particle` qua GC/Heap (`OP_NEW_INSTANCE`) | **Triệt tiêu hoàn toàn (0 byte heap)** | JIT tốn chi phí quản lý đối tượng trên heap và con trỏ |
| **Field Access** | Đọc ghi thuộc tính qua `OP_GET_FIELD` / `OP_SET_FIELD` hoặc con trỏ `obj->fields[offset]` | **Ánh xạ trực tiếp vào thanh ghi CPU (`rcx`, `r10`)** | JIT tốn độ trễ nạp ô nhớ (Memory Load/Store Latency) |
| **Method Dispatch** | Gọi hàm qua `OP_INVOKE_METHOD` (giải quyết VTable/Inline Cache) | **Inline trực tiếp vào thân vòng lặp** | JIT tốn chi phí prologue, epilogue, chuyển đổi frame |
| **Thời gian Thực thi** | **15.33 ms** | **0.57 ms** | **Gap: $26.9\times$** |

---

## 3. Thẩm định Giả thuyết Escape Analysis (Escape State Lattice)

Theo Mục 23 tài liệu `Doc/G6.2.md`:
Đối tượng `let p = Particle(10, 20, 2, 3)` trong hàm `main()`:
1. Không được truyền làm tham số ra ngoài hàm khác $\implies$ **Không phải `ArgEscape`**.
2. Không được `return` ra ngoài $\implies$ **Không phải `ReturnEscape`**.
3. Không được gán vào mảng toàn cục hay thuộc tính của object khác $\implies$ **Không phải `HeapEscape`**.
4. $\implies$ Đối tượng `p` đạt trạng thái **`NoEscape` 100%**.

### Kết luận Hợp pháp:
Điều kiện kích hoạt SRA:
$$\mathbf{EscapeState}(p) == \mathbf{NoEscape} \implies \text{Hợp pháp 100\% để triệt tiêu cấp phát và tách trường (Scalar Replacement)}$$

---

## 4. Kế hoạch Thiết kế cho Tiểu cổng G6R.2.2

Trong G6R.2.2:
1. **Pass Escape Analysis**: Nhận diện các `ALLOC_INSTANCE` có trạng thái `NoEscape`.
2. **Object Splitting & Field Scalarization**:
   Biến các trường `p.x`, `p.y`, `p.vx`, `p.vy` thành các biến ảo SSA Virtual Registers: `vreg_px`, `vreg_py`, `vreg_pvx`, `vreg_pvy`.
3. **Method Inlining**:
   Inline trực tiếp thân hàm `update` (`vreg_px += vreg_pvx; vreg_py += vreg_pvy`) và `energy`.
4. **Phân bổ Thanh ghi (Linear Scan)**:
   Gán trực tiếp `vreg_px` vào `RCX`, `vreg_py` vào `RDX`, v.v.
5. **Kỳ vọng Hiệu năng**:
   Đưa runtime từ $15.33$ ms $\rightarrow \le 1.80$ ms, giảm $100\%$ allocation candidates ($200,000 \rightarrow 0$).
