	.file	"compare.c"
	.section	.rodata
.LC0:
	.string	"thunder"
.LC1:
	.string	"Power"
.LC2:
	.string	"||||||||DONE|||||||||"
.LC3:
	.string	"||||||||||UNDONE|||||||||||"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	movl	$.LC0, -16(%ebp)
	movl	$.LC1, -12(%ebp)
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	call	strcmp
	addl	$16, %esp
	testl	%eax, %eax
	je	.L2
	subl	$12, %esp
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	jmp	.L4
.L2:
	subl	$12, %esp
	pushl	$.LC3
	call	printf
	addl	$16, %esp
.L4:
	nop
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
