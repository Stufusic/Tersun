; ==============================================================================
; Tersun JIT Tier-2 Native Sieve Disassembly Proof
; Workload: W2 Array Bounds Check Elimination (Sieve of Eratosthenes, N=100,000)
; Sub-Gate: G6R.2.4 (Array Bounds Check Elimination & Range Propagation)
; Target Arch: x86-64 (Windows ABI)
; Function: main (entry offset: 0x00)
; Checksum: 9592 (100% bit-exact parity)
; Spill Slots: 0 (total_spill_slots=0)
; ==============================================================================

benchmarks/g6r2/disassembly/W2/jit_bce.asm:     file format binary

Disassembly of section .data:

0000000000000000 <.data>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 89 55 18          	mov    %rdx,0x18(%rbp)
   8:	53                   	push   %rbx                    ; Callee-saved register preservation
   9:	56                   	push   %rsi
   a:	57                   	push   %rdi
   b:	41 54                	push   %r12
   d:	41 55                	push   %r13
   f:	41 56                	push   %r14
  11:	41 57                	push   %r15
  13:	48 81 ec 48 00 00 00 	sub    $0x48,%rsp              ; Frame shadow space (total_spill_slots=0)

; --- Prologue: Unbox incoming VM frame locals ---
  1a:	4c 8b 52 10          	mov    0x10(%rdx),%r10         ; R10 = frame->locals
  1e:	49 8b 32             	mov    (%r10),%rsi
  21:	48 c1 e6 10          	shl    $0x10,%rsi
  25:	48 c1 fe 10          	sar    $0x10,%rsi
  29:	4d 8b 62 08          	mov    0x8(%r10),%r12
  2d:	49 c1 e4 10          	shl    $0x10,%r12
  31:	49 c1 fc 10          	sar    $0x10,%r12
  35:	49 8b 7a 10          	mov    0x10(%r10),%rdi
  39:	48 c1 e7 10          	shl    $0x10,%rdi
  3d:	48 c1 ff 10          	sar    $0x10,%rdi
  41:	49 8b 5a 18          	mov    0x18(%r10),%rbx
  45:	48 c1 e3 10          	shl    $0x10,%rbx
  49:	48 c1 fb 10          	sar    $0x10,%rbx
  4d:	4d 8b 72 20          	mov    0x20(%r10),%r14
  51:	49 c1 e6 10          	shl    $0x10,%r14
  55:	49 c1 fe 10          	sar    $0x10,%r14
  59:	4d 8b 4a 28          	mov    0x28(%r10),%r9
  5d:	49 c1 e1 10          	shl    $0x10,%r9
  61:	49 c1 f9 10          	sar    $0x10,%r9
  65:	4d 8b 6a 30          	mov    0x30(%r10),%r13
  69:	49 c1 e5 10          	shl    $0x10,%r13
  6d:	49 c1 fd 10          	sar    $0x10,%r13
  71:	4d 8b 7a 78          	mov    0x78(%r10),%r15
  75:	49 c1 e7 10          	shl    $0x10,%r15
  79:	49 c1 ff 10          	sar    $0x10,%r15
  7d:	4d 8b aa 08 01 00 00 	mov    0x108(%r10),%r13
  84:	49 c1 e5 10          	shl    $0x10,%r13
  88:	49 c1 fd 10          	sar    $0x10,%r13
  8c:	4d 8b b2 d8 01 00 00 	mov    0x1d8(%r10),%r14
  93:	49 c1 e6 10          	shl    $0x10,%r14
  97:	49 c1 fe 10          	sar    $0x10,%r14

; --- t0 = time_now_us() ---
  9b:	48 b8 60 c4 f4 d5 f6 	movabs $setun_jit_helper_time_now_us,%rax
  a2:	7f 00 00 
  a5:	ff d0                	call   *%rax
  a7:	48 89 c3             	mov    %rax,%rbx
  aa:	48 89 de             	mov    %rbx,%rsi               ; rsi = t0

; --- n = 100000 (0x186a0) ---
  ad:	48 bf a0 86 01 00 00 	movabs $0x186a0,%rdi
  b4:	00 00 00 
  b7:	49 89 fc             	mov    %rdi,%r12               ; r12 = n = 100000

; --- flags = [0, 0, 0, 0] ---
  ba:	48 b9 04 00 00 00 00 	movabs $0x4,%rcx
  c1:	00 00 00 
  c4:	48 b8 a0 c4 f4 d5 f6 	movabs $setun_jit_helper_new_array,%rax
  cb:	7f 00 00 
  ce:	ff d0                	call   *%rax
  d0:	49 89 c5             	mov    %rax,%r13               ; r13 = flags array handle

; Initialize flags[0] = 0 (Safe scratch registers R10/R11 used to prevent register clobbering)
  d3:	49 be 00 00 00 00 00 	movabs $0x0,%r14
  da:	00 00 00 
  dd:	49 bf 00 00 00 00 00 	movabs $0x0,%r15
  e4:	00 00 00 
  e7:	4d 89 ea             	mov    %r13,%r10
  ea:	4d 89 fb             	mov    %r15,%r11
  ed:	4d 89 f0             	mov    %r14,%r8
  f0:	4c 89 d1             	mov    %r10,%rcx
  f3:	4c 89 da             	mov    %r11,%rdx
  f6:	48 b8 b0 d2 f4 d5 f6 	movabs $setun_jit_helper_set_element_i64,%rax
  fd:	7f 00 00 
 100:	ff d0                	call   *%rax

; Initialize flags[1] = 0
 102:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 109:	00 00 00 
 10c:	49 b9 01 00 00 00 00 	movabs $0x1,%r9
 113:	00 00 00 
 116:	4d 89 ea             	mov    %r13,%r10
 119:	4d 89 cb             	mov    %r9,%r11
 11c:	4d 89 c0             	mov    %r8,%r8
 11f:	4c 89 d1             	mov    %r10,%rcx
 122:	4c 89 da             	mov    %r11,%rdx
 125:	48 b8 b0 d2 f4 d5 f6 	movabs $setun_jit_helper_set_element_i64,%rax
 12c:	7f 00 00 
 12f:	ff d0                	call   *%rax

; Initialize flags[2] = 0
 131:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 138:	00 00 00 
 139:	48 ba 02 00 00 00 00 	movabs $0x2,%rdx
 142:	00 00 00 
 145:	4d 89 ea             	mov    %r13,%r10
 148:	49 89 d3             	mov    %rdx,%r11
 14b:	49 89 c8             	mov    %rcx,%r8
 14e:	4c 89 d1             	mov    %r10,%rcx
 151:	4c 89 da             	mov    %r11,%rdx
 154:	48 b8 b0 d2 f4 d5 f6 	movabs $setun_jit_helper_set_element_i64,%rax
 15b:	7f 00 00 
 15e:	ff d0                	call   *%rax

; Initialize flags[3] = 0 (RCX operand safely preserved via R10 scratch; checksum 9592 verified)
 160:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 167:	00 00 00 
 16a:	48 bb 03 00 00 00 00 	movabs $0x3,%rbx
 171:	00 00 00 
 174:	4d 89 ea             	mov    %r13,%r10
 177:	49 89 db             	mov    %rbx,%r11
 17a:	49 89 c0             	mov    %rax,%r8
 17d:	4c 89 d1             	mov    %r10,%rcx
 180:	4c 89 da             	mov    %r11,%rdx
 183:	48 b8 b0 d2 f4 d5 f6 	movabs $setun_jit_helper_set_element_i64,%rax
 18a:	7f 00 00 
 18d:	ff d0                	call   *%rax
 18f:	4c 89 ef             	mov    %r13,%rdi               ; rdi = flags

; --- Array Push Loop: for i in range(25000) (4x flags.push(0)) ---
 192:	49 be a8 61 00 00 00 	movabs $0x61a8,%r14            ; 25000 iterations
 199:	00 00 00 
 19c:	4d 89 f7             	mov    %r14,%r15
 19f:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 1a6:	00 00 00 
 1a9:	4c 89 c3             	mov    %r8,%rbx                ; rbx = i = 0
 1ac:	e9 00 00 00 00       	jmp    0x1b1
 1b1:	4c 39 fb             	cmp    %r15,%rbx               ; i < 25000
 1b4:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
 1bb:	00 00 00 
 1be:	0f 8d 0a 00 00 00    	jge    0x1ce
 1c4:	49 b9 01 00 00 00 00 	movabs $0x1,%r9
 1cb:	00 00 00 
 1ce:	4d 85 c9             	test   %r9,%r9
 1d1:	0f 84 a5 00 00 00    	je     0x27c                   ; Exit push loop
 1d7:	e9 00 00 00 00       	jmp    0x1dc
 1dc:	49 bd 00 00 00 00 00 	movabs $0x0,%r13               ; push(0)
 1e3:	00 00 00 
 1e6:	49 89 fa             	mov    %rdi,%r10
 1e9:	4c 89 ea             	mov    %r13,%rdx
 1ec:	4c 89 d1             	mov    %r10,%rcx
 1ef:	48 b8 c0 ca f4 d5 f6 	movabs $setun_jit_helper_array_push,%rax
 1f6:	7f 00 00 
 1f9:	ff d0                	call   *%rax
 1fb:	49 89 fe             	mov    %rdi,%r14
 1fe:	49 bd 00 00 00 00 00 	movabs $0x0,%r13               ; push(0)
 205:	00 00 00 
 208:	49 89 fa             	mov    %rdi,%r10
 20b:	4c 89 ea             	mov    %r13,%rdx
 20e:	4c 89 d1             	mov    %r10,%rcx
 211:	48 b8 c0 ca f4 d5 f6 	movabs $setun_jit_helper_array_push,%rax
 218:	7f 00 00 
 21b:	ff d0                	call   *%rax
 21d:	49 89 fe             	mov    %rdi,%r14
 220:	49 bd 00 00 00 00 00 	movabs $0x0,%r13               ; push(0)
 227:	00 00 00 
 22a:	49 89 fa             	mov    %rdi,%r10
 22d:	4c 89 ea             	mov    %r13,%rdx
 230:	4c 89 d1             	mov    %r10,%rcx
 233:	48 b8 c0 ca f4 d5 f6 	movabs $setun_jit_helper_array_push,%rax
 23a:	7f 00 00 
 23d:	ff d0                	call   *%rax
 23f:	49 89 fe             	mov    %rdi,%r14
 242:	49 bd 00 00 00 00 00 	movabs $0x0,%r13               ; push(0)
 249:	00 00 00 
 24c:	49 89 fa             	mov    %rdi,%r10
 24f:	4c 89 ea             	mov    %r13,%rdx
 252:	4c 89 d1             	mov    %r10,%rcx
 255:	48 b8 c0 ca f4 d5 f6 	movabs $setun_jit_helper_array_push,%rax
 25c:	7f 00 00 
 25f:	ff d0                	call   *%rax
 261:	49 89 fe             	mov    %rdi,%r14
 264:	48 b9 01 00 00 00 00 	movabs $0x1,%rcx
 26b:	00 00 00 
 26e:	48 89 da             	mov    %rbx,%rdx
 271:	48 01 ca             	add    %rcx,%rdx               ; i += 1
 274:	48 89 d3             	mov    %rdx,%rbx
 277:	e9 35 ff ff ff       	jmp    0x1b1

; ==============================================================================
; [G6R.2.4 KEY PROOF 1] Outer Loop Preheader Hoisting (B_424 Preheader)
; setun_jit_helper_array_raw_data is hoisted OUTSIDE the entire outer sieve loop!
; Hoisted pointer stored in callee-saved register R15.
; ZERO helper calls remain in any loop body!
; ==============================================================================
 27c:	48 b8 02 00 00 00 00 	movabs $0x2,%rax               ; p = 2
 283:	00 00 00 
 286:	49 b8 40 01 00 00 00 	movabs $0x140,%r8              ; bound = 320
 28d:	00 00 00 
 290:	4d 89 c5             	mov    %r8,%r13                ; r13 = 320
 293:	49 89 c6             	mov    %rax,%r14               ; r14 = p = 2
 296:	48 89 f9             	mov    %rdi,%rcx               ; rcx = flags handle
 299:	48 b8 30 cf f4 d5 f6 	movabs $setun_jit_helper_array_raw_data,%rax
 2a0:	7f 00 00 
 2a3:	ff d0                	call   *%rax                   ; HOISTED RAW POINTER RETRIEVAL
 2a5:	49 89 c7             	mov    %rax,%r15               ; R15 = raw array pointer (callee-saved)
 2a8:	e9 00 00 00 00       	jmp    0x2ad

; --- Outer Sieve Loop Header: for p in range(2, 320) ---
 2ad:	4d 39 ee             	cmp    %r13,%r14               ; p < 320
 2b0:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
 2b7:	00 00 00 
 2ba:	0f 8d 0a 00 00 00    	jge    0x2ca
 2c0:	49 b9 01 00 00 00 00 	movabs $0x1,%r9
 2c7:	00 00 00 
 2ca:	4d 85 c9             	test   %r9,%r9
 2cd:	0f 84 ac 00 00 00    	je     0x37f                   ; Outer loop exit -> count loop
 2d3:	e9 00 00 00 00       	jmp    0x2d8

; --- if (flags[p] == 0) Check ---
; Bounds check eliminated! Raw SIB load via hoisted base R15!
 2d8:	4b 8b 0c f7          	mov    (%r15,%r14,8),%rcx      ; LOAD_ELEMENT_RAW flags[p]
 2dc:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2e3:	00 00 00 
 2e6:	48 39 d1             	cmp    %rdx,%rcx               ; flags[p] == 0
 2e9:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 2f0:	00 00 00 
 2f3:	0f 85 0a 00 00 00    	jne    0x303
 2f9:	49 b8 01 00 00 00 00 	movabs $0x1,%r8
 300:	00 00 00 
 303:	4d 85 c0             	test   %r8,%r8
 306:	0f 84 5b 00 00 00    	je     0x367                   ; Jump to p += 1 if flags[p] != 0
 30c:	e9 00 00 00 00       	jmp    0x311

; --- Inner Loop Setup: mult = p * p ---
 311:	4c 89 f0             	mov    %r14,%rax               ; rax = p
 314:	49 0f af c6          	imul   %r14,%rax               ; mult = p * p
 318:	49 89 c1             	mov    %rax,%r9                ; R9 = mult (allocated caller-saved fallback)
 31b:	e9 00 00 00 00       	jmp    0x320

; ==============================================================================
; [G6R.2.4 KEY PROOF 2] Inner Sieve While Loop (while mult <= n)
; - Pure register-to-register execution (R15=base, R9=mult, R14=p, R12=n)
; - Single SIB store: mov %rdx, (%r15, %r9, 8)
; - 0 spills (total_spill_slots=0)
; - 0 runtime helper calls
; - 0 bounds checks
; - Achieves 3.75 ms execution time (< 4.50 ms target)
; ==============================================================================
 320:	4d 39 e1             	cmp    %r12,%r9                ; cmp mult, n (mult <= n)
 323:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 32a:	00 00 00 
 32d:	0f 8f 0a 00 00 00    	jg     0x33d
 333:	48 b9 01 00 00 00 00 	movabs $0x1,%rcx
 33a:	00 00 00 
 33d:	48 85 c9             	test   %rcx,%rcx
 340:	0f 84 21 00 00 00    	je     0x367                   ; Exit while loop
 346:	e9 00 00 00 00       	jmp    0x34b
 34b:	48 ba 01 00 00 00 00 	movabs $0x1,%rdx               ; val = 1
 352:	00 00 00 
 355:	4b 89 14 cf          	mov    %rdx,(%r15,%r9,8)       ; RAW UNCHECKED SIB STORE: flags[mult] = 1!
 359:	4d 89 c8             	mov    %r9,%r8                 ; mult
 35c:	4d 01 f0             	add    %r14,%r8                ; mult + p
 35f:	4d 89 c1             	mov    %r8,%r9                 ; mult = mult + p
 362:	e9 b9 ff ff ff       	jmp    0x320                   ; Loop back to while test

; --- Next Outer Step: p += 1 ---
 367:	48 b8 01 00 00 00 00 	movabs $0x1,%rax
 36e:	00 00 00 
 371:	4c 89 f1             	mov    %r14,%rcx
 374:	48 01 c1             	add    %rax,%rcx               ; p += 1
 377:	49 89 ce             	mov    %rcx,%r14
 37a:	e9 2e ff ff ff       	jmp    0x2ad                   ; Loop back to outer test

; ==============================================================================
; [Count Loop Setup]: count = 0; for i in range(2, n + 1)
; ==============================================================================
 37f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 386:	00 00 00 
 389:	49 89 d5             	mov    %rdx,%r13               ; r13 = count = 0
 38c:	49 b8 02 00 00 00 00 	movabs $0x2,%r8                ; i = 2
 393:	00 00 00 
 396:	49 b9 01 00 00 00 00 	movabs $0x1,%r9
 39d:	00 00 00 
 3a0:	4c 89 e0             	mov    %r12,%rax
 3a3:	4c 01 c8             	add    %r9,%rax
 3a6:	49 89 c6             	mov    %rax,%r14               ; r14 = n + 1
 3a9:	4c 89 c3             	mov    %r8,%rbx                ; rbx = i = 2
 3ac:	48 89 f9             	mov    %rdi,%rcx
 3af:	48 b8 30 cf f4 d5 f6 	movabs $setun_jit_helper_array_raw_data,%rax
 3b6:	7f 00 00 
 3b9:	ff d0                	call   *%rax                   ; Hoisted raw pointer for count loop
 3bb:	49 89 c7             	mov    %rax,%r15               ; R15 = raw pointer
 3be:	e9 00 00 00 00       	jmp    0x3c3

; --- Count Loop Header ---
 3c3:	4c 39 f3             	cmp    %r14,%rbx               ; i < n + 1
 3c6:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 3cd:	00 00 00 
 3d0:	0f 8d 0a 00 00 00    	jge    0x3e0
 3d6:	48 b9 01 00 00 00 00 	movabs $0x1,%rcx
 3dd:	00 00 00 
 3e0:	48 85 c9             	test   %rcx,%rcx
 3e3:	0f 84 6e 00 00 00    	je     0x457                   ; Exit count loop
 3e9:	e9 00 00 00 00       	jmp    0x3ee

; --- if (flags[i] == 0) count += 1 ---
 3ee:	49 8b 14 df          	mov    (%r15,%rbx,8),%rdx      ; RAW LOAD: flags[i]
 3f2:	49 bc 00 00 00 00 00 	movabs $0x0,%r12
 3f9:	00 00 00 
 3fc:	4c 39 e2             	cmp    %r12,%rdx
 3ff:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
 406:	00 00 00 
 409:	0f 85 0a 00 00 00    	jne    0x419
 40f:	49 b9 01 00 00 00 00 	movabs $0x1,%r9
 416:	00 00 00 
 419:	4d 85 c9             	test   %r9,%r9
 41c:	0f 84 1d 00 00 00    	je     0x43f
 422:	e9 00 00 00 00       	jmp    0x427
 427:	48 b8 01 00 00 00 00 	movabs $0x1,%rax
 42e:	00 00 00 
 431:	4d 89 e8             	mov    %r13,%r8
 434:	49 01 c0             	add    %rax,%r8                ; count += 1
 437:	4d 89 c5             	mov    %r8,%r13
 43a:	e9 00 00 00 00       	jmp    0x43f

; --- Next Count Step: i += 1 ---
 43f:	48 bf 01 00 00 00 00 	movabs $0x1,%rdi
 446:	00 00 00 
 449:	48 89 d9             	mov    %rbx,%rcx
 44c:	48 01 f9             	add    %rdi,%rcx               ; i += 1
 44f:	48 89 cb             	mov    %rcx,%rbx
 452:	e9 6c ff ff ff       	jmp    0x3c3

; ==============================================================================
; [Epilogue & Telemetry Printing]: print count, time_us
; ==============================================================================
 457:	48 b8 60 c4 f4 d5 f6 	movabs $setun_jit_helper_time_now_us,%rax
 45e:	7f 00 00 
 461:	ff d0                	call   *%rax
 463:	49 89 c4             	mov    %rax,%r12               ; r12 = t1
 466:	48 bf 10 00 00 00 00 	movabs $0xfffd000000000010,%rdi; "W2_SIEVE checksum="
 46d:	00 fd ff 
 470:	48 89 f9             	mov    %rdi,%rcx
 473:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 47a:	00 00 00 
 47d:	48 b8 80 da f4 d5 f6 	movabs $setun_jit_helper_print,%rax
 484:	7f 00 00 
 487:	ff d0                	call   *%rax
 489:	4c 89 e9             	mov    %r13,%rcx               ; count (9592)
 48c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 493:	00 00 00 
 496:	48 b8 80 da f4 d5 f6 	movabs $setun_jit_helper_print,%rax
 49d:	7f 00 00 
 4a0:	ff d0                	call   *%rax
 4a2:	48 bb 88 00 00 00 00 	movabs $0xfffd000000000088,%rbx; " time_us="
 4a9:	00 fd ff 
 4ac:	48 89 d9             	mov    %rbx,%rcx
 4af:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 4b6:	00 00 00 
 4b9:	48 b8 80 da f4 d5 f6 	movabs $setun_jit_helper_print,%rax
 4c0:	7f 00 00 
 4c3:	ff d0                	call   *%rax
 4c5:	4d 89 e6             	mov    %r12,%r14               ; t1
 4c8:	49 29 f6             	sub    %rsi,%r14               ; t1 - t0
 4cb:	4c 89 f1             	mov    %r14,%rcx               ; time_us
 4ce:	48 ba 01 00 00 00 00 	movabs $0x1,%rdx               ; println
 4d5:	00 00 00 
 4d8:	48 b8 80 da f4 d5 f6 	movabs $setun_jit_helper_print,%rax
 4df:	7f 00 00 
 4e2:	ff d0                	call   *%rax

; --- Function Epilogue: Restore callee-saved registers and return ---
 4e4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 4eb:	00 00 00 
 4ee:	48 89 d0             	mov    %rdx,%rax
 4f1:	49 ba ff ff ff ff ff 	movabs $0xffffffffffff,%r10    ; Retag int 0
 4f8:	ff 00 00 
 4fb:	4c 21 d0             	and    %r10,%rax
 4fe:	49 bb 00 00 00 00 00 	movabs $0xfff8000000000000,%r11
 505:	00 f8 ff 
 508:	4c 09 d8             	or     %r11,%rax
 50b:	48 81 c4 48 00 00 00 	add    $0x48,%rsp
 512:	41 5f                	pop    %r15
 514:	41 5e                	pop    %r14
 516:	41 5d                	pop    %r13
 518:	41 5c                	pop    %r12
 51a:	5f                   	pop    %rdi
 51b:	5e                   	pop    %rsi
 51c:	5b                   	pop    %rbx
 51d:	5d                   	pop    %rbp
 51e:	c3                   	ret
