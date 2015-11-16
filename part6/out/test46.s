
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 7 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $28, %esp
	# SP, FP, calleesaves, argregs have values
L5_blocks:                                        # x86gen:131
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:95 x86frame:278
	movl %ebx, -4(%ebp)                       # x86gen:95 x86frame:283
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -12(%ebp)                      # x86gen:239 x86frame:348
	movl -12(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L1_true                                # x86gen:162
L6_fallthrough:                                   # x86gen:171
	jmp L1_true                               # x86gen:179
L1_true:                                          # x86gen:131
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:573
	movl -16(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:581
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -20(%ebp)                      # x86gen:239 x86frame:348
	movl -20(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jne L2_unEx_t                             # x86gen:162
L7_fallthrough:                                   # x86gen:171
	jmp L3_unEx_f                             # x86gen:179
L3_unEx_f:                                        # x86gen:131
	movl -24(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:573
	movl -24(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:581
L2_unEx_t:                                        # x86gen:131
	movl -28(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L4_block_done                         # x86gen:191
L4_block_done:                                    # x86gen:131
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
