
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
L3_blocks:                                        # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:477 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L1_g                                 # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L2_block_done                         # x86gen:214
L2_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L1_g
	.globl	L1_g
	.func	L1_g
	.type	L1_g, @function
L1_g:
	# FRAME L1_g(2 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L5_blocks:                                        # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:584
	jmp L4_block_done                         # x86gen:214
L4_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_g, .-L1_g
	.endfunc
# END L1_g


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
