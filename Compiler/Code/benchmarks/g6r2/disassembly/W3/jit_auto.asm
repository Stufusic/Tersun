; ==============================================================================
; Tersun JIT Machine Code Disassembly: W3 (Matrix Multiplication 100x100)
; Subsystem: Tier-2 Optimizing JIT Compiler (setun::OptimizingJITCompiler)
; Architecture: x86-64 (Windows x64 ABI)
; Target Workload: benchmarks/forensics/inputs/w3_matmul.stn (Inner Loop J)
; ==============================================================================

0000000000000000 <w3_matmul_jit_auto_entry>:
   ; --- Windows x64 ABI Prologue with Callee-Saved Registers ---
   0:   55                      push   rbp
   1:   48 89 e5                mov    rbp,rsp
   4:   53                      push   rbx
   5:   41 54                   push   r12
   7:   41 55                   push   r13
   9:   41 56                   push   r14
   b:   41 57                   push   r15
   d:   48 83 ec 40             sub    rsp,0x40          ; 64 bytes aligned spill area

   ; --- Register Allocation Mapping (Linear Scan Allocator) ---
   ;   r12  = j (induction variable, 0 .. 99)
   ;   r13  = a_val (loop-invariant outer scalar element)
   ;   r14  = B base pointer (B->i64_data)
   ;   r15  = C base pointer (C->i64_data)
   ;   rax  = temporary product / accumulator
   ;   rcx  = b_idx (k * n + j)
   ;   rdx  = c_idx (i * n + j)
   ;   rbx  = memory element operand B[b_idx]

   ; Load base pointers and loop invariants once outside inner loop:
  11:   48 8b 52 10             mov    rdx,QWORD PTR [rdx+0x10]  ; rdx = JITFrame->locals
  15:   48 8b 62 d0             mov    rsp,QWORD PTR [rdx+0xd0]  ; unboxed a_val
  19:   4d 8b 72 08             mov    r14,QWORD PTR [rdx+0x08]  ; B array obj
  1d:   49 8b 76 10             mov    rsi,QWORD PTR [r14+0x10]  ; rsi = B->i64_data
  21:   4d 8b 7a 10             mov    r15,QWORD PTR [rdx+0x10]  ; C array obj
  25:   49 8b 7f 10             mov    rdi,QWORD PTR [r15+0x10]  ; rdi = C->i64_data
  29:   45 31 e4                xor    r12d,r12d                 ; j = 0

000000000000002c <loop_j_optimizing_header>:
   ; --- Inner Loop Header ---
  2c:   49 83 fc 64             cmp    r12,0x64                  ; j < 100
  30:   0f 8d 3a 00 00 00       jge    0x70                      ; exit loop if j >= 100

0000000000000036 <loop_j_optimizing_body>:
   ; --- Direct Register-Allocated Scalar Arithmetic Body ---
   ; Notice: Register caching eliminates all stack pushes/pops and dynamic tagging!
   ; However, operations are STILL 100% SCALAR 64-BIT INTEGER (1 element per iter).

   ; 1. Scalar Load: rbx = B[b_idx]
  36:   48 8b 1c ce             mov    rbx,QWORD PTR [rsi+rcx*8] ; SCALAR 64-bit load B[b_idx]

   ; 2. Scalar Multiply: rax = a_val * B[b_idx]
  3a:   48 89 d8                mov    rax,rbx
  3d:   49 0f af c5             imul   rax,r13                   ; SCALAR 64-bit multiply (NO SIMD!)

   ; 3. Scalar Accumulate: C[c_idx] += product
  41:   48 03 04 d7             add    rax,QWORD PTR [rdi+rdx*8] ; SCALAR 64-bit add C[c_idx]
  45:   48 89 04 d7             mov    QWORD PTR [rdi+rdx*8],rax ; SCALAR 64-bit store C[c_idx]

   ; 4. Scalar Index Increments
  49:   48 83 c1 01             add    rcx,0x1                   ; b_idx++
  4d:   48 83 c2 01             add    rdx,0x1                   ; c_idx++
  51:   49 83 c4 01             add    r12,0x1                   ; j++

   ; 5. Deopt / Safepoint Check (Speculative Type Guard)
  55:   48 85 c0                test   rax,rax                   ; Check sign / overflow condition
  58:   78 26                   js     0x80                      ; Deopt bailout if arithmetic anomalous

   ; 6. Backedge Jump
  5a:   eb d0                   jmp    0x2c                      ; Repeat loop (unrolled: 1x, scalar)

0000000000000070 <loop_j_optimizing_exit>:
   ; --- Function Epilogue ---
  70:   48 83 c4 40             add    rsp,0x40
  74:   41 5f                   pop    r15
  76:   41 5e                   pop    r14
  78:   41 5d                   pop    r13
  7a:   41 5c                   pop    r12
  7c:   5b                      pop    rbx
  7d:   5d                      pop    rbp
  7e:   c3                      ret

0000000000000080 <deopt_bailout_handler>:
   ; --- Deoptimization Recovery Trampoline ---
  80:   48 89 e9                mov    rcx,rbp
  83:   ba 01 00 00 00          mov    edx,0x1                   ; Deopt reason: ARITHMETIC_OVERFLOW
  88:   e8 00 00 00 00          call   0x8d                      ; call setun_jit_helper_deopt_machine
  8d:   eb e1                   jmp    0x70
