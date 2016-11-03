	.text
	.file	"<stdin>"
	.globl	add_test
	.align	16, 0x90
	.type	add_test,@function
add_test:                               # @add_test
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rax
	movq	%rax, %rsp
	movl	$0, -16(%rcx)
	.align	16, 0x90
.LBB0_1:                                # %Memory
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rax), %ecx
	movq	%rsp, %rdx
	leaq	-16(%rdx), %rsp
	movl	$256, -16(%rdx)         # imm = 0x100
	shll	$8, %ecx
	movslq	%ecx, %rcx
	movq	(%rdi,%rcx,8), %rdx
	leal	64(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	128(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	orl	$192, %ecx
	movslq	%ecx, %rcx
	movq	(%rdi,%rcx,8), %rcx
	movl	(%rax), %ecx
	incl	%ecx
	movl	%ecx, (%rax)
	cmpl	$5000000, %ecx          # imm = 0x4C4B40
	jb	.LBB0_1
# BB#2:                                 # %exit
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	add_test, .Lfunc_end0-add_test
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
