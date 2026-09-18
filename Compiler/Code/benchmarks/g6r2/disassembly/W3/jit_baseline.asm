; ==============================================================================
; Tersun JIT Machine Code Disassembly: W3 (Matrix Multiplication 100x100)
; Subsystem: Tier-1 Baseline JIT Compiler (setun::BaselineJITCompiler)
; Architecture: x86-64 (Windows x64 ABI)
; Target Workload: benchmarks/forensics/inputs/w3_matmul.stn (Inner Loop J)
; ==============================================================================

0000000000000000 <w3_matmul_jit_baseline_entry>:
   ; --- Windows x64 ABI Function Prologue ---
   0:   55                      push   rbp
   1:   53                      push   rbx
   2:   57                      push   rdi
   3:   56                      push   rsi
   4:   41 54                   push   r12
   6:   41 55                   push   r13
   8:   41 56                   push   r14
   a:   41 57                   push   r15
   c:   48 89 e5                mov    rbp,rsp
   f:   48 81 ec 08 02 00 00    sub    rsp,0x208         ; 520 bytes shadow stack / locals
  16:   49 89 cf                mov    r15,rcx           ; R15 = VM*
  19:   49 89 d6                mov    r14,rdx           ; R14 = JITFrame*
  1c:   e9 27 00 00 00          jmp    0x48              ; Jump over OSR trampolines to body entry

0000000000000021 <w3_matmul_osr_entry_loop_j>:
   ; --- OSR Entry Trampoline for Matmul Inner Loop (lh = 1591) ---
  21:   55                      push   rbp
  22:   53                      push   rbx
  23:   57                      push   rdi
  24:   56                      push   rsi
  25:   41 54                   push   r12
  27:   41 55                   push   r13
  29:   41 56                   push   r14
  2b:   41 57                   push   r15
  2d:   48 89 e5                mov    rbp,rsp
  30:   48 81 ec 08 02 00 00    sub    rsp,0x208
  37:   49 89 cf                mov    r15,rcx           ; R15 = VM*
  3a:   49 89 d6                mov    r14,rdx           ; R14 = JITFrame*
  3d:   e9 0e 00 00 00          jmp    0x50              ; Jump directly to loop header

0000000000000042 <body_entry>:
  42:   90                      nop
  43:   90                      nop
  44:   90                      nop
  45:   90                      nop
  46:   90                      nop
  47:   90                      nop

0000000000000048 <loop_j_header>:
   ; --- Inner Loop Header (j = 0 .. n-1) ---
   ; Compute indices: c_idx = i * n + j, b_idx = k * n + j
   ; Load A[i * n + k] -> a_val (slot 26)
  48:   49 8b 56 10             mov    rdx,QWORD PTR [r14+0x10]  ; rdx = JITFrame->locals
  4c:   48 8b 42 10             mov    rax,QWORD PTR [rdx+0x10]  ; load j (slot 2)
  50:   50                      push   rax
  51:   48 b8 64 00 00 00 00 00 movabs rax,0x1000000000000064    ; tagged int 100 (n)
  5b:   00 00 
  5d:   58                      pop    rax
  5e:   48 c1 e0 10             shl    rax,0x10
  62:   48 c1 f8 10             sar    rax,0x10
  66:   48 83 f8 64             cmp    rax,0x64                  ; j < 100
  6a:   0f 8d e8 00 00 00       jge    0x158                     ; exit inner loop if j >= n

0000000000000070 <loop_j_body_arithmetic>:
   ; --- Inner Arithmetic Computation: C[c_idx] += a_val * B[b_idx] ---
   ; 1. Load a_val from slot 26
  70:   49 8b 56 10             mov    rdx,QWORD PTR [r14+0x10]
  74:   48 8b 42 d0             mov    rax,QWORD PTR [rdx+0xd0]  ; load local slot 26 (a_val)
  78:   50                      push   rax

   ; 2. Load B[b_idx] (via JIT generic element load)
  79:   49 8b 56 10             mov    rdx,QWORD PTR [r14+0x10]
  7d:   48 8b 4a e8             mov    rcx,QWORD PTR [rdx+0xe8]  ; load b_idx (slot 29)
  81:   48 8b 5a 08             mov    rbx,QWORD PTR [rdx+0x08]  ; load B array pointer (slot 1)
  85:   48 c1 e9 10             shl    rcx,0x10
  89:   48 c1 f9 10             sar    rcx,0x10                  ; unbox index b_idx
  8d:   48 8b 53 10             mov    rdx,QWORD PTR [rbx+0x10]  ; rdx = B->i64_data buffer
  91:   48 8b 04 ca             mov    rax,QWORD PTR [rdx+rcx*8] ; rax = raw B[b_idx]
  95:   48 b9 ff ff ff ff ff ff movabs rcx,0x0000ffffffffffff    ; PAYLOAD_MASK
  9f:   00 00 
  a1:   48 21 c8                and    rax,rcx
  a4:   48 b9 00 00 00 00 00 00 movabs rcx,0x0001000000000000    ; TAG_INT
  ae:   01 00 
  b0:   48 09 c8                or     rax,rcx
  b3:   50                      push   rax                       ; push B[b_idx] operand

   ; 3. Scalar Integer Multiply (LIROpcode::MUL): a_val * B[b_idx]
  b4:   59                      pop    rcx                       ; rcx = B[b_idx]
  b5:   58                      pop    rax                       ; rax = a_val
  b6:   48 c1 e0 10             shl    rax,0x10
  ba:   48 c1 f8 10             sar    rax,0x10                  ; unbox a_val
  be:   48 c1 e1 10             shl    rcx,0x10
  c2:   48 c1 f9 10             sar    rcx,0x10                  ; unbox B[b_idx]
  c6:   48 0f af c1             imul   rax,rcx                   ; SCALAR 64-bit integer multiply
  ca:   48 b9 ff ff ff ff ff ff movabs rcx,0x0000ffffffffffff    ; PAYLOAD_MASK
  d4:   00 00 
  d6:   48 21 c8                and    rax,rcx
  d9:   48 b9 00 00 00 00 00 00 movabs rcx,0x0001000000000000    ; TAG_INT
  e3:   01 00 
  e5:   48 09 c8                or     rax,rcx
  e8:   50                      push   rax                       ; push product (a_val * B[b_idx])

   ; 4. Scalar Integer Addition (LIROpcode::ADD): C[c_idx] + product
  e9:   49 8b 56 10             mov    rdx,QWORD PTR [r14+0x10]
  ed:   48 8b 4a e0             mov    rcx,QWORD PTR [rdx+0xe0]  ; load c_idx (slot 28)
  f1:   48 8b 5a 10             mov    rbx,QWORD PTR [rdx+0x10]  ; load C array pointer (slot 2)
  f5:   48 c1 e9 10             shl    rcx,0x10
  f9:   48 c1 f9 10             sar    rcx,0x10
  fd:   48 8b 53 10             mov    rdx,QWORD PTR [rbx+0x10]  ; rdx = C->i64_data buffer
 101:   48 8b 1c ca             mov    rbx,QWORD PTR [rdx+rcx*8] ; rbx = current C[c_idx]
 105:   58                      pop    rax                       ; rax = product
 106:   48 c1 e3 10             shl    rbx,0x10
 10a:   48 c1 fb 10             sar    rbx,0x10
 10e:   48 c1 e0 10             shl    rax,0x10
 112:   48 c1 f8 10             sar    rax,0x10
 116:   48 01 d8                add    rax,rbx                   ; SCALAR 64-bit integer addition
 119:   48 89 04 ca             mov    QWORD PTR [rdx+rcx*8],rax ; store back C[c_idx] = sum

   ; 5. Induction Variable Increment: j += 1
 11d:   49 8b 56 10             mov    rdx,QWORD PTR [r14+0x10]
 121:   48 8b 42 10             mov    rax,QWORD PTR [rdx+0x10]
 125:   48 c1 e0 10             shl    rax,0x10
 129:   48 c1 f8 10             sar    rax,0x10
 12d:   48 83 c0 01             add    rax,0x1
 131:   48 b9 ff ff ff ff ff ff movabs rcx,0x0000ffffffffffff
 13b:   00 00 
 13d:   48 21 c8                and    rax,rcx
 140:   48 b9 00 00 00 00 00 00 movabs rcx,0x0001000000000000
 14a:   01 00 
 14c:   48 09 c8                or     rax,rcx
 14f:   48 89 42 10             mov    QWORD PTR [rdx+0x10],rax  ; store j

   ; 6. Loop Backedge & GC Safepoint Poll
 153:   e9 f0 fe ff ff          jmp    0x48                      ; jmp back to loop_j_header

0000000000000158 <loop_j_exit>:
   ; --- Loop Exit & Epilogue ---
 158:   48 81 c4 08 02 00 00    add    rsp,0x208
 15f:   41 5f                   pop    r15
 161:   41 5e                   pop    r14
 163:   41 5d                   pop    r13
 165:   41 5c                   pop    r12
 167:   5e                      pop    rsi
 168:   5f                      pop    rdi
 169:   5b                      pop    rbx
 16a:   5d                      pop    rbp
 16b:   c3                      ret
