
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 5 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
	# SP, FP, calleesaves, argregs have values
L2_blocks:                                        # x86gen:131
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:95 x86frame:278
	movl %ebx, -4(%ebp)                       # x86gen:95 x86frame:283
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:95 x86frame:278
	movl %ebx, -8(%ebp)                       # x86gen:95 x86frame:283
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -20(%ebp)                      # x86gen:239 x86frame:348
	movl -20(%ebp), %ebx                      # x86gen:95 x86frame:278
	movl %ebx, -4(%ebp)                       # x86gen:95 x86frame:283
	jmp L1_block_done                         # x86gen:191
L1_block_done:                                    # x86gen:131
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
