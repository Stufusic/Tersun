# Tersun Compiler: Tổng Quan Kiến Trúc Hệ Thống (Master Architecture Overview)

```text
Document Version:    1.0.3
Architecture State:  Tersun Gate 6R.2.4 (Sealed)
Git Anchor Commit:   133330b5fd9b5cf9b57948abf7de3361eb20b793
Verification Status: VERIFIED & CRYPTOGRAPHICALLY SEALED
Primary Scope:       Toàn bộ 9 Subsystems (164 Source/Header Files, 40,577 LOC)
```

---

## 1. Bản Đồ Thành Phố Tersun (The Master System Map)

Hệ thống **Tersun** là một nền tảng thực thi và biên dịch tam phân (Ternary / Balanced Ternary Computing Architecture) tích hợp hoàn chỉnh từ ngôn ngữ bậc cao (`Setun .stn`) đến vi kiến trúc phần cứng và mô phỏng lượng tử.

Biểu đồ dưới đây biểu diễn "bản đồ thành phố" toàn dự án, phân định rạch ròi 3 con đường thực thi: **Máy ảo Bytecode / JIT**, **Biên dịch Tĩnh Native AOT (LLVM)**, và **Tổng hợp Phần cứng (Verilog RTL)**.

```mermaid
graph TD
    subgraph S1["1. FRONTEND: Phân Tích & Kiểm Kiểu"]
        Src["Source Code (.stn)"] --> Lexer["Lexer (DFA / Tryte Literals)"]
        Lexer --> Parser["Pratt Parser (Ternary AST)"]
        Parser --> ModRes["Module DAG Resolver"]
        ModRes --> TypeCheck["Type Checker & Monomorphizer"]
    end

    subgraph S2["2. MIDDLE-END: Cây AST & Tuyến Tính Hóa"]
        TypeCheck --> TreeCan["Tree Canonicalizer"]
        TreeCan --> TreeOpt["Tree Optimizer (Fold / DeadCode)"]
        TreeOpt --> LinearIR["Linear IR Generator & CFG"]
        LinearIR --> CFGOpt["CFG / SSA Dominator Optimizer"]
    end

    subgraph S3["3. EMITTERS: Ba Con Đường Hạ Tầng"]
        CFGOpt -->|Lowering| BCEmit["Bytecode Emitter (.tbc)"]
        CFGOpt -->|AOT Backend| LLVMEmit["LLVM IR Emitter (-O3)"]
        CFGOpt -->|Hardware Backend| VerilogEmit["Verilog-2001 RTL Emitter"]
    end

    subgraph S4["4. VM RUNTIME: Máy Ảo Đa Tầng (Tiering VM)"]
        BCEmit --> VMDispatch["Tier-0: Direct Threaded VM (TOS Cache)"]
        VMDispatch -->|Profile Heat / Invocation| Tier1JIT["Tier-1: Baseline JIT"]
        Tier1JIT -->|Backedge Loops / Deep Heat| Tier2JIT["Tier-2: Optimizing JIT"]
    end

    subgraph S5["5. OPTIMIZING JIT: Động Cơ Tối Ưu Hóa Máy"]
        Tier2JIT --> MIR["Machine IR (MIR)"]
        MIR --> IVA["Induction Variable Analysis (IVA)"]
        IVA --> BCE["Bounds Check Elimination (BCE)"]
        BCE --> SRA["Escape Analysis & SRA"]
        SRA --> SIMD["AVX2 SIMD Vectorization"]
        SIMD --> RegAlloc["Linear Scan Register Allocator"]
        RegAlloc --> X64Emit["x86-64 Machine Code Buffer"]
    end

    subgraph S6["6. VỆ TINH KIẾN TRÚC (Satellite Subsystems)"]
        VMDispatch -.->|Object / Handles| GC["Tri-Color GC & VMArena"]
        VMDispatch -.->|Shapes / Monomorphic| IC["Field IC & CallSite IC"]
        VMDispatch -.->|Algebra Q(sqrt(3)) / GEMM| TAFPU["TAFPU Engine (BitNet)"]
        VMDispatch -.->|Hilbert Space / MPS| QVM["Quantum VM (QVM / QBC)"]
        VMDispatch -.->|Preemption / Queues| Kernel["Tri-Priority Microkernel"]
        VMDispatch -.->|C-ABI Marshaling| FFI["Setun FFI Bridge"]
        VMDispatch -.->|Raylib Render| Graphics["Setun2D Graphics"]
    end

    X64Emit --> FastExec["Thực Thi Native Tốc Độ Cao (3.75 ms Sieve / 0.94 ms SRA)"]
    LLVMEmit --> NativeAOT["Native Executable (AOT)"]
    VerilogEmit --> FPGA["FPGA Bitstream (Xilinx / Altera)"]
```

---

## 2. Phân Tầng Độ Sâu Hệ Thống (3 Architectural Tiers)

Để đảm bảo chất lượng tài liệu tương xứng với độ phức tạp kỹ thuật, hệ thống 9 module của Tersun được phân bổ theo 3 tầng độ sâu:

| Tier | Subsystem | Files | LOC | Trọng Tâm Kiến Trúc |
| :--- | :--- | :---: | :---: | :--- |
| **Tier A (Deep)** | [Code/src/vm/vm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/vm/vm.md) | 81 | 18,756 | 11 phần chuyên sâu: Máy trạng thái OSR, NaN-boxing 8B, VMArena, Tri-color GC, Field IC, Optimizing JIT (IVA, BCE, SRA, AVX2 SIMD, Linear Scan RA), Win64 direct calling. |
| **Tier A (Deep)** | [Code/src/compiler/compiler.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/compiler/compiler.md) | 41 | 15,679 | Hợp đồng bất biến **THE IR CONTRACT**, DFA tryte lexer, Pratt parser 3 ngôi, SSA dominator tree (Lengauer-Tarjan), GVN/SCCP/DCE, LLVM và Bytecode lowering. |
| **Tier A (Deep)** | [Code/src/tafpu/tafpu.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tafpu/tafpu.md) | 12 | 1,873 | Chứng minh hình thức trường đại số $\mathbb{Q}(\sqrt{3})$, triệt tiêu sai số dấu phẩy động tích lũy, quaternion $0\%$ sai số lượng giác, BitNet 1.58-bit GEMM không bộ nhân. |
| **Tier A (Deep)** | [Code/src/qvm/qvm.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/qvm/qvm.md) | 15 | 3,140 | Không gian Hilbert $2^N$ / $3^N$, ba cổng tối ưu OPT 1/2/3 (Native CP không rẽ nhánh, Diagonal Fusion, QFT Planner O(1) LUT, AVX2 SIMD & OpenMP), mở rộng quy mô đến $N=24$ Qubits (16.78M chiều) trong 2.89s, mạng tensor MPS SVD truncation. |
| **Tier B (Medium)** | [Code/src/kernel/kernel.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/kernel/kernel.md) | 2 | 172 | Bộ lập lịch ưu tiên 3 mức (Tri-Priority Preemptive Scheduler), hàng đợi lock-free Dmitry Vyukov MPMC và SPSC ring buffer. |
| **Tier B (Medium)** | [Code/src/hardware/hardware.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/hardware/hardware.md) | 2 | 125 | Bộ phát mã phần cứng Verilog-2001 RTL có thể tổng hợp (Synthesizable FSM), bất biến chu kỳ xung nhịp và ánh xạ thanh ghi cho FPGA. |
| **Tier B (Medium)** | [Code/src/tools/tools.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/tools/tools.md) | 11 | 868 | Máy chủ LSP JSON-RPC 2.0 (IntelliSense/Definition), trình quản lý gói TPM phân giải SemVer, trình gỡ lỗi bytecode debugger. |
| **Tier C (Lightweight)** | [Code/src/graphics/graphics.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/graphics/graphics.md) | 2 | 815 | Cầu nối C-ABI Raylib cho render 2D/3D 60 FPS và chế độ headless fallback cho máy chủ / CI không có GPU. |
| **Tier C (Lightweight)** | [Code/src/ffi/ffi.md](file:///d:/New%20PJ/Ternary/Compiler/Code/src/ffi/ffi.md) | 2 | 207 | Hợp đồng C-ABI Marshaling, quy tắc đóng mở hộp NaN-box $\leftrightarrow$ C primitives, quản lý vòng đời con trỏ an toàn qua `setun_export`. |

---

## 3. Ma Trận Dòng Dữ Liệu & Biến Đổi Trung Gian (Data Flow)

Toàn bộ quá trình chuyển đổi mã nguồn qua các cấp độ biểu diễn trung gian (IR Lattice):

```text
[Setun Source Code .stn]
         │
         ▼  (Lexer & Parser)
[Ternary AST (Abstract Syntax Tree)]
         │
         ▼  (Type Checker & Canonicalizer)
[Canonical Typed AST]
         │
         ▼  (Linear IR Generator)
[Tersun Linear IR (SSA-form CFG)]
         │
         ├──────────────────────────┬──────────────────────────┐
         ▼                          ▼                          ▼
[LLVM SSA IR]             [Tersun Bytecode .tbc]     [Verilog-2001 RTL]
         │                          │                          │
         ▼ (LLVM Opt -O3)           ▼ (VM Interpreter)         ▼ (FPGA Synthesis)
[Native PE/ELF Binary]    [TOS Threaded Dispatch]    [FPGA Bitstream]
                                    │
                                    ▼ (OSR Hotspot Promotion)
                          [Machine IR (MIR)]
                                    │
                                    ▼ (MIR Optimizer: BCE/SRA/SIMD)
                          [Optimized MIR]
                                    │
                                    ▼ (Linear Scan Register Allocator)
                          [Assigned Physical Registers]
                                    │
                                    ▼ (x64 Assembler Emission)
                          [Direct Native Machine Buffer]
```

---

## 4. Hệ Thống Tài Liệu Phụ Trợ & Bằng Chứng (Accompanying Knowledge Artifacts)

Hệ thống tài liệu Tersun không đứng độc lập mà liên kết chặt chẽ với 4 khối tri thức:

1. **Hệ thống Quyết định Kiến trúc (Architecture Decision Records - ADR)**: Lưu trữ tại `Doc/adr/`, ghi chép 9 quyết định kỹ thuật then chốt từ `ADR-001` (NaN-boxing) đến `ADR-009` (AVX2 SIMD).
2. **Chuỗi Bằng Chứng Nghiên Cứu (Research Traceability)**: Lưu trữ tại `Doc/research_traceability.md`, chứng minh tính nhân quả thực nghiệm qua chuỗi 8 mắt xích cho từng chặng W1 đến W4.
3. **Báo Cáo Pháp Y & Niêm Phong Mật Mã**: Lưu trữ tại `Doc/g6r/` và `test_registry/g6r2/`, cung cấp chữ ký SHA256, telemetry không xâm lấn, và disassembly đối chiếu.
4. **Tầng Giáo Dục Sư Phạm (GT Curriculum)**: Lưu trữ tại `GT/`, diễn giải bản chất giải thuật từ nguyên lý thứ nhất (first principles) cho người học mà không sao chép nguyên văn mã nguồn hệ thống.

---

## 5. Quy Chuẩn Neo Giữ Mã Nguồn (Code Anchor Standard)

Tất cả các tài liệu kiến trúc trong hệ thống Tersun bắt buộc phải tuân theo quy chuẩn neo kỹ thuật thống nhất:

```text
Target Commit Hash: 133330b5fd9b5cf9b57948abf7de3361eb20b793
Anchor Attributes:
  - Subsystem:         <Tên hệ thống con>
  - Source File:       <Đường dẫn tương đối từ gốc kho mã>
  - Interface Header:  <Đường dẫn header public tương ứng>
  - Primary Anchor:    <Class::Method() hoặc Struct::Field>
  - Auxiliary Locator: <Khoảng dòng xấp xỉ tại commit neo>
```

Cách neo giữ này đảm bảo tính vĩnh cửu của tài liệu: dù mã nguồn có thêm bớt dòng trong tương lai, biểu tượng (Symbol) và hàm băm commit (Commit SHA) vẫn định danh chính xác vị trí ngữ nghĩa của cấu trúc kiến trúc.
