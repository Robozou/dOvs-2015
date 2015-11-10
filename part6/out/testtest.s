
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 2 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	# SP, FP, calleesaves, argregs have values
L3_blocks:
                                                  # x86gen:127
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:199 x86frame:347
	call print                                # x86gen:199 x86frame:352
	addl $4, %esp                             # x86gen:52
	jmp L2_block_done                         # x86gen:188
L2_block_done:
                                                  # x86gen:127
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L1_string:
	.long 5
	.asciz "penis"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
