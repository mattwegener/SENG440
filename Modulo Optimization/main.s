	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	routine
	.type	routine, @function
routine:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
	movq	%rcx, %r8
	movl	$2155905153, %r9d
	movw	%ax, i(%rip)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	movswq	%ax, %rax
	movzwl	(%r8), %ecx
	movzwl	(%rsi,%rax,2), %r10d
	addl	$1, %ecx
	sall	%cl, %r10d
	movw	%r10w, (%rdi,%rax,2)
	movswq	i(%rip), %rax
	leaq	(%rax,%rax), %rcx
	movzwl	(%rdi,%rax,2), %eax
	movl	%eax, %r10d
	andl	$7, %r10d
	cmpw	$7, %r10w
	movzwl	(%r8), %r10d
	jne	.L3
	shrw	$8, %r10w
	movw	%r10w, (%r8)
	movswq	i(%rip), %rax
	leaq	(%rax,%rax), %rcx
	movzwl	(%rdi,%rax,2), %eax
.L3:
	addq	%rdx, %rcx
	movzwl	%r10w, %r10d
	movzwl	(%rcx), %r11d
	imull	%r11d, %eax
	addl	%r10d, %eax
	imulq	%r9, %rax
	shrq	$39, %rax
	movw	%ax, (%rcx)
	movzwl	i(%rip), %eax
	addl	$1, %eax
	cmpw	$63, %ax
	movw	%ax, i(%rip)
	jle	.L4
	rep ret
	.cfi_endproc
.LFE0:
	.size	routine, .-routine
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.comm	i,2,2
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
