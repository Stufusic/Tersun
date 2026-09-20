; ==============================================================================
; Tersun JIT Tier-2 Native Recursive Disassembly Proof
; Workload: W1 Fibonacci (fib(30))
; Sub-Gate: G6R.2.3 (Frame Allocation Recycling & Direct Native Calling)
; Target Arch: x86-64 (Windows ABI)
; Function: fib(n: int) -> int (entry offset: 0x4e, trampoline offset: 0x00)
; ==============================================================================

.section .text

; ------------------------------------------------------------------------------
; [1] VM Entry Trampoline: int64_t (*)(VM* vm, JITFrame* frame)
; Win64 ABI: RCX = VM*, RDX = JITFrame*
; Unboxes incoming tagged arguments from frame->locals, enters native direct recursion,
; and re-tags result for VM caller.
; ------------------------------------------------------------------------------
0000000000000000 <jit_vm_trampoline>:
   0: 55                            push   %rbp
   1: 48 89 e5                      mov    %rsp,%rbp
   4: 48 81 ec 28 00 00 00          sub    $0x28,%rsp              ; 32 shadow + 8 align
   b: 4c 8b 52 10                   mov    0x10(%rdx),%r10         ; R10 = frame->locals
   f: 49 8b 0a                      mov    (%r10),%rcx             ; RCX = frame->locals[0] (arg n)
  12: 48 c1 e1 10                   shl    $0x10,%rcx              ; Unbox 48-bit tagged int
  16: 48 c1 f9 10                   sar    $0x10,%rcx
  1a: 49 8b 52 08                   mov    0x8(%r10),%rdx          ; Optional arg1
  1e: 48 c1 e2 10                   shl    $0x10,%rdx
  22: 48 c1 fa 10                   sar    $0x10,%rdx
  26: e8 23 00 00 00                call   0x4e                    ; Direct native entry
  2b: 49 ba ff ff ff ff ff ff 00 00 movabs $0xffffffffffff,%r10    ; PAYLOAD_MASK
  35: 4c 21 d0                      and    %r10,%rax
  38: 49 bb 00 00 00 00 00 00 f8 ff movabs $0xfff8000000000000,%r11; TAG_INT
  42: 4c 09 d8                      or     %r11,%rax
  45: 48 81 c4 28 00 00 00          add    $0x28,%rsp
  4c: 5d                            pop    %rbp
  4d: c3                            ret

; ------------------------------------------------------------------------------
; [2] Native Direct Recursive Entry: int64_t (*)(int64_t n)
; Direct native register passing: RCX = n, Return value in RAX.
; Callee-saved register allocation (RBX, RSI, RDI, R12-R15) eliminates spills
; and guarantees full caller-state preservation across 2,692,537 recursive calls.
; ------------------------------------------------------------------------------
000000000000004e <jit_fib_direct_entry>:
  4e: 55                            push   %rbp
  4f: 48 89 e5                      mov    %rsp,%rbp
  52: 53                            push   %rbx                    ; Preserve callee-saved registers
  53: 56                            push   %rsi
  54: 57                            push   %rdi
  55: 41 54                         push   %r12
  57: 41 55                         push   %r13
  59: 41 56                         push   %r14
  5b: 41 57                         push   %r15
  5d: 48 81 ec 48 00 00 00          sub    $0x48,%rsp              ; Frame spill & shadow space
  64: 48 89 cb                      mov    %rcx,%rbx               ; rbx = n (preserved)

; Basic Block B_6: Guard n < 2
  67: 48 be 02 00 00 00 00 00 00 00 movabs $0x2,%rsi
  71: 48 39 f3                      cmp    %rsi,%rbx               ; cmp rbx, 2
  74: 48 bf 00 00 00 00 00 00 00 00 movabs $0x0,%rdi
  7e: 0f 8d 0a 00 00 00             jge    0x8e
  84: 48 bf 01 00 00 00 00 00 00 00 movabs $0x1,%rdi
  8e: 48 85 ff                      test   %rdi,%rdi
  91: 0f 84 1c 00 00 00             je     0xb3
  97: e9 00 00 00 00                jmp    0x9c

; Basic Block B_43: Return n (Base case)
  9c: 48 89 d8                      mov    %rbx,%rax               ; return n
  9f: 48 81 c4 48 00 00 00          add    $0x48,%rsp
  a6: 41 5f                         pop    %r15
  a8: 41 5e                         pop    %r14
  aa: 41 5d                         pop    %r13
  ac: 41 5c                         pop    %r12
  ae: 5f                            pop    %rdi
  af: 5e                            pop    %rsi
  b0: 5b                            pop    %rbx
  b1: 5d                            pop    %rbp
  b2: c3                            ret

; Basic Block B_54: Recursive calls: fib(n - 1) + fib(n - 2)
  b3: 49 bc 01 00 00 00 00 00 00 00 movabs $0x1,%r12
  bd: 49 89 dd                      mov    %rbx,%r13
  c0: 4d 29 e5                      sub    %r12,%r13               ; r13 = n - 1
  c3: 4c 89 e9                      mov    %r13,%rcx               ; arg0 = n - 1
  c6: 48 81 ec 20 00 00 00          sub    $0x20,%rsp              ; Win64 shadow space
  cd: e8 7c ff ff ff                call   0x4e                    ; Direct Native Call 1: fib(n - 1)
  d2: 48 81 c4 20 00 00 00          add    $0x20,%rsp
  d9: 49 89 c6                      mov    %rax,%r14               ; r14 = res1 (callee-saved)

  dc: 49 bf 02 00 00 00 00 00 00 00 movabs $0x2,%r15
  e6: 49 89 d8                      mov    %rbx,%r8
  e9: 4d 29 f8                      sub    %r15,%r8                ; r8 = n - 2
  ec: 4c 89 c1                      mov    %r8,%rcx               ; arg0 = n - 2
  ef: 48 81 ec 20 00 00 00          sub    $0x20,%rsp              ; Win64 shadow space
  f6: e8 53 ff ff ff                call   0x4e                    ; Direct Native Call 2: fib(n - 2)
  fb: 48 81 c4 20 00 00 00          add    $0x20,%rsp
 102: 49 89 c1                      mov    %rax,%r9                ; r9 = res2

 105: 4c 89 f1                      mov    %r14,%rcx
 108: 4c 01 c9                      add    %r9,%rcx                ; rcx = res1 + res2
 10b: 48 89 c8                      mov    %rcx,%rax               ; rax = return value
 10e: 48 81 c4 48 00 00 00          add    $0x48,%rsp
 115: 41 5f                         pop    %r15
 117: 41 5e                         pop    %r14
 119: 41 5d                         pop    %r13
 11b: 41 5c                         pop    %r12
 11d: 5f                            pop    %rdi
 11e: 5e                            pop    %rsi
 11f: 5b                            pop    %rbx
 120: 5d                            pop    %rbp
 121: c3                            ret
