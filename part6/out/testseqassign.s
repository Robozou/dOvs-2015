
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 11 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $44, %esp
	# SP, FP, calleesaves, argregs have values
L9_blocks:                                        # x86gen:128
	movl $5, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:477 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl %ebp, -16(%ebp)                      # x86gen:289 x86frame:577
	movl -16(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-8, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -16(%ebp)                      # x86gen:294 x86frame:387
	movl -16(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:123 x86frame:595
	movl %ebp, -20(%ebp)                      # x86gen:289 x86frame:577
	movl -20(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -20(%ebp)                      # x86gen:294 x86frame:387
	movl -20(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call L2_rs                                # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
	movl -24(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -28(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	pushl %ebp                                # x86gen:251
	call L1_rss                               # x86gen:80
	addl $4, %esp                             # x86gen:55
	movl -32(%ebp), %ebx                      # x86gen:87 x86frame:279
	movl %eax, (%ebx)                         # x86gen:87 x86frame:284
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -36(%ebp)                      # x86gen:262 x86frame:353
	movl -36(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $7, %ebx                             # x86gen:169 x86frame:269
	je L5_if_then                             # x86gen:174
L10_fallthrough:                                  # x86gen:177
	jmp L6_if_else                            # x86gen:182
L6_if_else:                                       # x86gen:128
	movl $L4_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:469 x86frame:333
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
L7_if_join:                                       # x86gen:128
	jmp L8_block_done                         # x86gen:214
L5_if_then:                                       # x86gen:128
	movl $L3_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -44(%ebp)                      # x86gen:469 x86frame:333
	movl -44(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L7_if_join                            # x86gen:214
L8_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L4_string:
	.long 5
	.asciz "FALSE"
	.data
L3_string:
	.long 4
	.asciz "TRUE"

	.text
# PROCEDURE L2_rs
	.globl	L2_rs
	.func	L2_rs
	.type	L2_rs, @function
L2_rs:
	# FRAME L2_rs(1 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L12_blocks:                                       # x86gen:128
	movl $6, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:477 x86frame:333
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:584
	jmp L11_block_done                        # x86gen:214
L11_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_rs, .-L2_rs
	.endfunc
# END L2_rs



	.text
# PROCEDURE L1_rss
	.globl	L1_rss
	.func	L1_rss
	.type	L1_rss, @function
L1_rss:
	# FRAME L1_rss(1 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L14_blocks:                                       # x86gen:128
	movl $7, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:477 x86frame:333
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:584
	jmp L13_block_done                        # x86gen:214
L13_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_rss, .-L1_rss
	.endfunc
# END L1_rss


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
