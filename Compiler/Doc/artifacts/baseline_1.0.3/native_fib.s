	.file	"native_fib.cpp"
	.text
	.p2align 4
	.globl	_Z3fibx
	.def	_Z3fibx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3fibx
_Z3fibx:
.LFB6465:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cmpq	$1, %rcx
	movq	%rcx, %rdx
	setle	%al
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm1, %xmm0
	ucomisd	%xmm1, %xmm0
	jp	.L2
	je	.L6
.L2:
	movq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	-2(%rcx), %rcx
	movq	%rdx, 48(%rsp)
	call	_Z3fibx
	movq	48(%rsp), %rdx
	movq	%rax, %rbx
	leaq	-1(%rdx), %rcx
	call	_Z3fibx
	leaq	(%rbx,%rax), %rdx
	movq	%rdx, %rax
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4
	.globl	_Z8stn_mainv
	.def	_Z8stn_mainv;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8stn_mainv
_Z8stn_mainv:
.LFB6466:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	$200, %r8d
	xorl	%r9d, %r9d
	.p2align 4
	.p2align 3
.L8:
	movl	$22, %ecx
	call	_Z3fibx
	movl	$23, %ecx
	movq	%rax, %r10
	call	_Z3fibx
	addq	%r10, %rax
	addq	%rax, %r9
	subq	$1, %r8
	jne	.L8
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	.refptr._ZSt4cout(%rip), %rcx
	cvtsi2sdq	%r9, %xmm1
	addsd	%xmm0, %xmm1
	call	_ZNSo9_M_insertIdEERSoT_
	movb	$10, 47(%rsp)
	movq	(%rax), %rdx
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	je	.L9
	leaq	47(%rsp), %rdx
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	nop
	addq	$56, %rsp
	ret
.L9:
	movl	$10, %edx
	movq	%rax, %rcx
	call	_ZNSo3putEc
	nop
	addq	$56, %rsp
	ret
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB6467:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	call	_Z8stn_mainv
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 15.2.0"
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
