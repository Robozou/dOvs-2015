
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
L4_blocks:                                        # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:609
	jmp L3_block_done                         # x86gen:191
L3_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L2_g
	.globl	L2_g
	.func	L2_g
	.type	L2_g, @function
L2_g:
	# FRAME L2_g(2 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L6_blocks:                                        # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:353
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:609
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_g, .-L2_g
	.endfunc
# END L2_g



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
L8_blocks:                                        # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:353
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:609
	jmp L7_block_done                         # x86gen:191
L7_block_done:                                    # x86gen:128
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
