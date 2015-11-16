
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
L3_blocks:                                        # x86gen:131
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:95 x86frame:278
	movl %ebx, -4(%ebp)                       # x86gen:95 x86frame:283
	pushl %ebp                                # x86gen:228
	call L1_f                                 # x86gen:199
	addl $4, %esp                             # x86gen:55
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -12(%ebp)                      # x86gen:239 x86frame:348
	movl -12(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L2_block_done                         # x86gen:191
L2_block_done:                                    # x86gen:131
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
L5_blocks:                                        # x86gen:131
	movl %ebp, -12(%ebp)                      # x86gen:246 x86frame:558
	movl %ebp, -4(%ebp)                       # x86gen:246 x86frame:558
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:379
	movl -4(%ebx), %ecx                       # x86gen:239 x86frame:389
	movl %ecx, -8(%ebp)                       # x86gen:239 x86frame:384
	movl %ebx, -8(%ebp)                       # x86gen:263 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:263 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:263 x86frame:581
	movl -16(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $1, %ebx                             # x86gen:267 x86frame:372
	movl -12(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -16(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, -4(%ebx)                       # x86gen:95 x86frame:311
	jmp L4_block_done                         # x86gen:191
L4_block_done:                                    # x86gen:131
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
