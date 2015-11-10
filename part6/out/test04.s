
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
L6_blocks:
                                                  # x86gen:127
	movl -4(%ebp), %ebx                       # x86gen:287 x86frame:319
	movl $10, %ebx                            # x86gen:287 x86frame:324
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	movl -8(%ebp), %ebx                       # x86gen:68 x86frame:420
	movl -12(%ebp), %ecx                      # x86gen:68 x86frame:425
	call L1_nfactor                           # x86gen:68 x86frame:420
	addl $8, %esp                             # x86gen:52
	movl %eax, %eax                           # x86gen:70
	jmp L5_block_done                         # x86gen:188
L5_block_done:
                                                  # x86gen:127
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
	# FRAME L1_nfactor(2 formals, 12 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $48, %esp
	# SP, FP, calleesaves, argregs have values
L8_blocks:
                                                  # x86gen:127
	movl -4(%ebp), %ebx                       # x86gen:244 x86frame:334
	movl 12(%ebp), %ebx                       # x86gen:244 x86frame:339
	movl -4(%ebp), %ebx                       # x86gen:146 x86frame:264
	cmpl $0, %ebx                             # x86gen:146 x86frame:269
	je L2_if_then                             # x86gen:158
	 jmp L3_if_else                           # x86gen:163
L3_if_else:
                                                  # x86gen:127
	movl -12(%ebp), %ebx                      # x86gen:244 x86frame:334
	movl 12(%ebp), %ebx                       # x86gen:244 x86frame:339
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:477
	movl -8(%ebp), %ecx                       # x86gen:123 x86frame:483
	movl %ebx, %ecx                           # x86gen:123 x86frame:488
	movl -16(%ebp), %ebx                      # x86gen:244 x86frame:334
	movl 12(%ebp), %ebx                       # x86gen:244 x86frame:339
	movl -16(%ebp), %ebx                      # x86gen:309 x86gen:379
	movl -20(%ebp), %ecx                      # x86gen:309 x86gen:384
	movl %ebx, %ecx                           # x86gen:309 x86frame:389
	movl -20(%ebp), %ebx                      # x86gen:314 x86gen:367
	subl $1, %ebx                             # x86gen:314 x86frame:372
	movl -20(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -24(%ebp), %ebx                      # x86gen:252 x86frame:334
	movl 8(%ebp), %ebx                        # x86gen:252 x86frame:339
	movl -24(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -28(%ebp), %ebx                      # x86gen:68 x86frame:420
	movl -32(%ebp), %ecx                      # x86gen:68 x86frame:425
	call L1_nfactor                           # x86gen:68 x86frame:420
	addl $8, %esp                             # x86gen:52
	movl -36(%ebp), %ebx                      # x86gen:70 x86frame:451
	movl %eax, %ebx                           # x86gen:70 x86frame:456
	movl -40(%ebp), %ebx                      # x86gen:354 x86frame:465
	imull %ebx                                # x86gen:354 x86frame:470
	movl -40(%ebp), %ebx                      # x86gen:123 x86frame:477
	movl -44(%ebp), %ecx                      # x86gen:123 x86frame:483
	movl %ebx, %ecx                           # x86gen:123 x86frame:488
L4_if_join:
                                                  # x86gen:127
	movl -44(%ebp), %ebx                      # x86gen:123 x86frame:464
	movl %ebx, %eax                           # x86gen:123 x86frame:469
	jmp L7_block_done                         # x86gen:188
L2_if_then:
                                                  # x86gen:127
	movl -48(%ebp), %ebx                      # x86gen:287 x86frame:319
	movl $1, %ebx                             # x86gen:287 x86frame:324
	movl -48(%ebp), %ebx                      # x86gen:123 x86frame:477
	movl -44(%ebp), %ecx                      # x86gen:123 x86frame:483
	movl %ebx, %ecx                           # x86gen:123 x86frame:488
	jmp L4_if_join                            # x86gen:188
L7_block_done:
                                                  # x86gen:127
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
