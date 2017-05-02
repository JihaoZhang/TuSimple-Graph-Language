	.text
	.file	"test.ll"
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushl	%esi
.Ltmp0:
	.cfi_def_cfa_offset 8
	subl	$24, %esp
.Ltmp1:
	.cfi_def_cfa_offset 32
.Ltmp2:
	.cfi_offset %esi, -8
	movl	$1, 16(%esp)
	movb	$1, 14(%esp)
	movl	16(%esp), %eax
	addl	%eax, %eax
	movl	%eax, 20(%esp)
	movb	14(%esp), %al
	andb	%al, %al
	andb	$1, %al
	movb	%al, 15(%esp)
	movl	$0, (%esp)
	calll	create_list
	movl	%eax, %esi
	movl	%esi, (%esp)
	movl	$1, 4(%esp)
	calll	plus_list
	movl	%esi, (%esp)
	movl	$2, 4(%esp)
	calll	plus_list
	movl	%esi, (%esp)
	movl	$3, 4(%esp)
	calll	plus_list
	movl	%esi, 8(%esp)
	xorl	%eax, %eax
	addl	$24, %esp
	popl	%esi
	retl
.Ltmp3:
	.size	main, .Ltmp3-main
	.cfi_endproc

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4


	.section	".note.GNU-stack","",@progbits
