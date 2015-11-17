
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
L3_blocks:                                        # x86gen:128
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl -16(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L1_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:448 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -8(%ebp)                       # x86gen:91 x86frame:284
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:239 x86frame:353
	movl -20(%ebp), %eax                      # x86gen:123 x86frame:609
	jmp L2_block_done                         # x86gen:191
L2_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L1_string:
	.long 1
	.asciz " "
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
