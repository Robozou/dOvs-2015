
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 3 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
	# SP, FP, calleesaves, argregs have values
L2_blocks:                                        # x86gen:128
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:477 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:289 x86frame:591
	movl %ebx, -8(%ebp)                       # x86gen:289 x86frame:595
	movl -8(%ebp), %ebx                       # x86gen:294 x86frame:377
	addl $3, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -8(%ebp)                       # x86gen:294 x86frame:387
	movl -8(%ebp), %ebx                       # x86gen:289 x86frame:591
	movl %ebx, -12(%ebp)                      # x86gen:289 x86frame:595
	movl -12(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $4, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -12(%ebp)                      # x86gen:294 x86frame:387
	movl -12(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L1_block_done                         # x86gen:214
L1_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
