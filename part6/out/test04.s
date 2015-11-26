
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L6_blocks:                                        # x86gen:128
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:477 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L1_nfactor                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L5_block_done                         # x86gen:214
L5_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L1_nfactor
	.globl	L1_nfactor
	.func	L1_nfactor
	.type	L1_nfactor, @function
L1_nfactor:
	# FRAME L1_nfactor(2 formals, 10 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $40, %esp
	# SP, FP, calleesaves, argregs have values
L8_blocks:                                        # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L2_if_then                             # x86gen:174
L9_fallthrough:                                   # x86gen:177
	jmp L3_if_else                            # x86gen:182
L3_if_else:                                       # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:262 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:317 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:317 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:322 x86frame:377
	subl $1, %ebx                             # x86gen:322 x86frame:382
	movl %ebx, -16(%ebp)                      # x86gen:322 x86frame:387
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:270 x86frame:353
	movl -20(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L1_nfactor                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
	movl -24(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:357 x86frame:595
	movl -28(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -32(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -32(%ebp)                      # x86gen:362 x86frame:544
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:123 x86frame:595
L4_if_join:                                       # x86gen:128
	movl -36(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L7_block_done                         # x86gen:214
L2_if_then:                                       # x86gen:128
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:477 x86frame:333
	movl -40(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:123 x86frame:595
	jmp L4_if_join                            # x86gen:214
L7_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_nfactor, .-L1_nfactor
	.endfunc
# END L1_nfactor


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
