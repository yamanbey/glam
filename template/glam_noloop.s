	.text
	.file	"<stdin>"
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_0:
	.long	1132462080              # float 256
	.text
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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
# BB#1:                                 # %Compute
	movss	.LCPI0_0, %xmm0         # xmm0 = mem[0],zero,zero,zero
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	movq	%rax, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movl	$1132462080, -16(%rax)  # imm = 0x43800000
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	movss	%xmm0, (%rax)
# BB#2:                                 # %exit
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	add_test, .Lfunc_end0-add_test
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
