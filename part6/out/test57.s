
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 13 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $52, %esp
	# SP, FP, calleesaves, argregs have values
L6_blocks:                                        # x86gen:131
	movl %ebp, -12(%ebp)                      # x86gen:263 x86frame:558
	movl -12(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $-4, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:573
	movl -12(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -20(%ebp)                      # x86gen:127 x86frame:581
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $10, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L1_f                                 # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:558
	movl -20(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -24(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl %ebp, -28(%ebp)                      # x86gen:263 x86frame:558
	movl -28(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $-8, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:573
	movl -28(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -36(%ebp)                      # x86gen:127 x86frame:581
	movl -32(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:456 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L1_f                                 # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -40(%ebp)                      # x86gen:70 x86frame:558
	movl -36(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -40(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -44(%ebp)                      # x86gen:239 x86frame:348
	movl -44(%ebp), %eax                      # x86gen:283 x86frame:510
	movl -52(%ebp), %ebx                      # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -48(%ebp)                      # x86gen:239 x86frame:348
	movl -48(%ebp), %ebx                      # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -52(%ebp)                      # x86gen:288 x86frame:384
	movl -52(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:131
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
	# FRAME L1_f(2 formals, 4 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
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
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl %ebx, -8(%ebp)                       # x86gen:127 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:581
L4_if_join:                                       # x86gen:131
	movl -12(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L7_block_done                         # x86gen:191
L2_if_then:                                       # x86gen:131
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:573
	movl -16(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:581
	jmp L4_if_join                            # x86gen:191
L7_block_done:                                    # x86gen:131
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
