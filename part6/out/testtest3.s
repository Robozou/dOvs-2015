
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
L3_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L1_string, %ebx                     # x86gen:448 x86frame:324
	movl %ebx, -4(%ebp)                       # x86gen:448 x86frame:319
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call print                                # x86gen:199
	addl $8, %esp                             # x86gen:55
	jmp L2_block_done                         # x86gen:191
L2_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L1_string:
	.long 56
	.asciz "Hallo\\n do u want to suk it??? \\n \\t cum her and suck it"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
