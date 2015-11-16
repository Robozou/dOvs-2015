
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
L6_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $10, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L1_nfactor                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:131
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
L8_blocks:                                        # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:348
	movl -4(%ebp), %ebx                       # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L2_if_then                             # x86gen:162
L9_fallthrough:                                   # x86gen:171
	jmp L3_if_else                            # x86gen:179
L3_if_else:                                       # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -8(%ebp)                       # x86gen:239 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:127 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:581
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -12(%ebp)                      # x86gen:239 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:293 x86frame:573
	movl -12(%ebp), %ebx                      # x86gen:293 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:293 x86frame:581
	movl -16(%ebp), %ebx                      # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -16(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl %ebp, -20(%ebp)                      # x86gen:246 x86frame:558
	movl -20(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call L1_nfactor                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:558
	movl -24(%ebp), %eax                      # x86gen:355 x86frame:560
	movl -28(%ebp), %eax                      # x86gen:338 x86frame:510
	movl -32(%ebp), %ebx                      # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -32(%ebp)                      # x86gen:361 x86frame:558
	movl %ebx, -32(%ebp)                      # x86gen:127 x86frame:573
	movl -32(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -36(%ebp)                      # x86gen:127 x86frame:581
L4_if_join:                                       # x86gen:131
	movl -36(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L7_block_done                         # x86gen:191
L2_if_then:                                       # x86gen:131
	movl -40(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -40(%ebp)                      # x86gen:127 x86frame:573
	movl -40(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -36(%ebp)                      # x86gen:127 x86frame:581
	jmp L4_if_join                            # x86gen:191
L7_block_done:                                    # x86gen:131
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
