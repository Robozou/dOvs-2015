
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
L7_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl %ebx, -4(%ebp)                       # x86gen:127 x86frame:573
	movl -4(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $20, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:139 x86frame:264
	cmpl $10, %ebx                            # x86gen:139 x86frame:269
	jg L1_unEx_t                              # x86gen:144
L8_fallthrough:                                   # x86gen:147
	jmp L2_unEx_f                             # x86gen:149
L2_unEx_f:                                        # x86gen:131
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:573
	movl -12(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:581
L1_unEx_t:                                        # x86gen:131
	movl -16(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L4_if_else                             # x86gen:162
L9_fallthrough:                                   # x86gen:171
	jmp L3_if_then                            # x86gen:179
L3_if_then:                                       # x86gen:131
	movl -20(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $30, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -20(%ebp)                      # x86gen:127 x86frame:573
	movl -20(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:581
L5_if_join:                                       # x86gen:131
	movl -24(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L6_block_done                         # x86gen:191
L4_if_else:                                       # x86gen:131
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $40, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:573
	movl -28(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:581
	jmp L5_if_join                            # x86gen:191
L6_block_done:                                    # x86gen:131
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
