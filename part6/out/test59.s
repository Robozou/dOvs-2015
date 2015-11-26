
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
L3_blocks:                                        # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	pushl %ebp                                # x86gen:251
	call L1_f                                 # x86gen:222
	addl $4, %esp                             # x86gen:55
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L2_block_done                         # x86gen:214
L2_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L1_f
	.globl	L1_f
	.func	L1_f
	.type	L1_f, @function
L1_f:
	# FRAME L1_f(1 formals, 4 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	# SP, FP, calleesaves, argregs have values
L5_blocks:                                        # x86gen:128
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:270 x86frame:353
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:270 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -8(%ebp)                       # x86gen:262 x86frame:404
	movl -8(%ebp), %ebx                       # x86gen:289 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:289 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $1, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -16(%ebp)                      # x86gen:294 x86frame:387
	movl -12(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -16(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, -4(%ebx)                       # x86gen:91 x86frame:314
	jmp L4_block_done                         # x86gen:214
L4_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_f, .-L1_f
	.endfunc
# END L1_f


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
