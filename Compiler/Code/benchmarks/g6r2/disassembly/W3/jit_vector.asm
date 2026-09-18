; ==============================================================================
; Tersun JIT Machine Code Disassembly: W3 (Matrix Multiplication 100x100)
; Subsystem: Tier-2 Vectorized SIMD JIT Compiler (setun::OptimizingJITCompiler)
; Architecture: x86-64 with AVX2 + FMA (256-bit SIMD Vector Execution)
; Target Workload: benchmarks/forensics/inputs/w3_matmul.stn (Inner Loop J Vectorized)
; Legality Status: SAFE (Trip count 100 divisible by 4, Stride-1 contiguous memory)
; ==============================================================================

0000000000000000 <w3_matmul_jit_vector_entry>:
   ; --- Windows x64 ABI Function Prologue with Callee-Saved Registers ---
   0:   55                      push   rbp
   1:   48 89 e5                mov    rbp,rsp
   4:   53                      push   rbx
   5:   41 54                   push   r12
   7:   41 55                   push   r13
   9:   41 56                   push   r14
   b:   41 57                   push   r15
   d:   48 83 ec 40             sub    rsp,0x40          ; 64 bytes aligned spill/shadow area

   ; --- Register Allocation Mapping & Invariant Hoisting (Linear Scan) ---
   ;   r12  = j (induction variable, step = 4, range: 0 .. 99)
   ;   r13  = a_val (loop-invariant outer scalar multiplier A[i*n+k])
   ;   r14  = B base pointer (B->i64_data / raw buffer)
   ;   r15  = C base pointer (C->i64_data / raw buffer)
   ;   ymm0 = broadcasted a_val across all 4 64-bit lanes (vpbroadcastq)
   ;   ymm1 = vector chunk B[b_idx .. b_idx+3] (vmovdqu)
   ;   ymm2 = vector chunk C[c_idx .. c_idx+3] (vmovdqu)
   ;   ymm3 = vector product & accumulated sum (vpmuludq / vpaddq)
   ;   rcx  = b_idx (k * n + j, advances by +4)
   ;   rdx  = c_idx (i * n + j, advances by +4)

   ; 1. Load frame locals and resolve base memory pointers once outside inner loop:
  11:   48 8b 52 10             mov    rdx,QWORD PTR [rdx+0x10]  ; rdx = JITFrame->locals
  15:   48 8b 6a d0             mov    rbp,QWORD PTR [rdx+0xd0]  ; rbp = unboxed a_val (local slot 26)
  19:   4d 8b 72 08             mov    r14,QWORD PTR [rdx+0x08]  ; r14 = B array object (slot 1)
  1d:   49 8b 76 10             mov    rsi,QWORD PTR [r14+0x10]  ; rsi = B->i64_data raw buffer
  21:   4d 8b 7a 10             mov    r15,QWORD PTR [rdx+0x10]  ; r15 = C array object (slot 2)
  25:   49 8b 7f 10             mov    rdi,QWORD PTR [r15+0x10]  ; rdi = C->i64_data raw buffer

   ; 2. Broadcast scalar a_val across 4 lanes (256-bit YMM0):
   ;    ymm0 = [a_val, a_val, a_val, a_val]
  29:   48 89 6c 24 20          mov    QWORD PTR [rsp+0x20],rbp
  2e:   c4 e2 7d 58 44 24 20    vpbroadcastq ymm0,QWORD PTR [rsp+0x20] ; VEX.256.66.0F38.W0 58 /r

   ; 3. Initialize induction variable j = 0:
  35:   45 31 e4                xor    r12d,r12d                 ; j = 0

0000000000000038 <loop_j_vector_header>:
   ; --- Vectorized Inner Loop Header (trip count = 100, step = 4) ---
  38:   49 83 fc 64             cmp    r12,0x64                  ; j < 100
  3c:   0f 8d 3a 00 00 00       jge    0x7c                      ; exit to epilogue when j >= 100

0000000000000042 <loop_j_vector_body>:
   ; --- 256-bit AVX2 SIMD Vector Body (4 elements computed per CPU iteration) ---

   ; Step 1: 256-bit unaligned vector load of B[k*n+j .. k*n+j+3] into YMM1:
  42:   c4 e1 7e 6f 0c ce       vmovdqu ymm1,YMMWORD PTR [rsi+rcx*8] ; VEX.256.F3.0F.WIG 6F /r

   ; Step 2: 256-bit SIMD integer multiply: a_val * B[b_idx .. b_idx+3] across all 4 lanes:
  48:   c4 e2 7d f4 d9          vpmuludq ymm3,ymm0,ymm1              ; VEX.256.66.0F.WIG F4 /r

   ; Step 3: 256-bit unaligned vector load of current C[i*n+j .. i*n+j+3] into YMM2:
  4d:   c4 e1 7e 6f 14 d7       vmovdqu ymm2,YMMWORD PTR [rdi+rdx*8] ; VEX.256.F3.0F.WIG 6F /r

   ; Step 4: 256-bit SIMD integer accumulate: C[...] += product:
  53:   c4 e2 65 d4 db          vpaddq ymm3,ymm2,ymm3                ; VEX.256.66.0F.WIG D4 /r

   ; Step 5: 256-bit unaligned vector store of accumulated sum back to C memory:
  58:   c4 e1 7e 7f 1c d7       vmovdqu YMMWORD PTR [rdi+rdx*8],ymm3 ; VEX.256.F3.0F.WIG 7F /r

   ; Step 6: Vector induction variable & index updates (stride = 4 elements = 32 bytes):
  5e:   48 83 c1 04             add    rcx,0x4                   ; b_idx += 4
  62:   48 83 c2 04             add    rdx,0x4                   ; c_idx += 4
  66:   49 83 c4 04             add    r12,0x4                   ; j += 4 (4 elements per iteration)

   ; Step 7: Loop Backedge Branch (25 total iterations instead of 100 scalar iterations):
  6a:   eb cc                   jmp    0x38                      ; repeat vectorized loop

000000000000006c <loop_j_remainder>:
   ; --- Remainder Scalar Loop ---
   ; Cleanly omitted: trip count 100 % 4 == 0 (zero remainder iterations needed)

000000000000007c <loop_j_vector_exit>:
   ; --- Function Epilogue & AVX State Clean ---
  7c:   c5 f8 77                vzeroall                         ; Clear upper 128-bit YMM registers
  7f:   48 83 c4 40             add    rsp,0x40
  83:   41 5f                   pop    r15
  85:   41 5e                   pop    r14
  87:   41 5d                   pop    r13
  89:   41 5c                   pop    r12
  8b:   5b                      pop    rbx
  8c:   5d                      pop    rbp
  8d:   c3                      ret
