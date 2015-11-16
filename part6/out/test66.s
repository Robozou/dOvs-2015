
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 4 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	# SP, FP, calleesaves, argregs have values
L4_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl %ebx, -4(%ebp)                       # x86gen:127 x86frame:573
	movl -4(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:139 x86frame:264
	cmpl $1, %ebx                             # x86gen:139 x86frame:269
	jge L1_unEx_t                             # x86gen:144
L5_fallthrough:                                   # x86gen:147
	jmp L2_unEx_f                             # x86gen:149
L2_unEx_f:                                        # x86gen:131
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:573
	movl -12(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -16(%ebp)                      # x86gen:127 x86frame:581
L1_unEx_t:                                        # x86gen:131
	movl -16(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L3_block_done                         # x86gen:191
L3_block_done:                                    # x86gen:131
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
