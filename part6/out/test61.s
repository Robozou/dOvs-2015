
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
L4_blocks:                                        # x86gen:128
	movl $L1_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:469 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl $L2_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:469 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -16(%ebp)                      # x86gen:262 x86frame:353
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call stringGreater                        # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L3_block_done                         # x86gen:214
L3_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L2_string:
	.long 4
	.asciz "else"
	.data
L1_string:
	.long 8
	.asciz "whatever"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
