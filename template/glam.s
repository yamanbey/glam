	.text
	.file	"<stdin>"
	.globl	glamtest
	.align	16, 0x90
	.type	glamtest,@function
glamtest:                               # @glamtest
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
.LBB0_1:                                # %Compute
                                        # =>This Inner Loop Header: Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	$256, -16(%rcx)         # imm = 0x100
	movl	(%rax), %ecx
	movq	%rsp, %rdx
	leaq	-16(%rdx), %rsp
	movl	$128, -16(%rdx)
	shll	$7, %ecx
	movslq	%ecx, %rcx
	movq	(%rdi,%rcx,8), %rdx
	leal	8(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	16(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	24(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	32(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	40(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	48(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	56(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	64(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	72(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	80(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	88(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	96(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	104(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	leal	112(%rcx), %edx
	movslq	%edx, %rdx
	movq	(%rdi,%rdx,8), %rdx
	orl	$120, %ecx
	movslq	%ecx, %rcx
	movq	(%rdi,%rcx,8), %rcx
	movl	(%rax), %ecx
	incl	%ecx
	movl	%ecx, (%rax)
	cmpl	$500000, %ecx           # imm = 0x7A120
	jb	.LBB0_1
# BB#2:                                 # %exit
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	glamtest, .Lfunc_end0-glamtest
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
