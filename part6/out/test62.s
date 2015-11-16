
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
L5_blocks:                                        # x86gen:131
	movl -8(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L1_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:448 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:95 x86frame:278
	movl %ebx, -4(%ebp)                       # x86gen:95 x86frame:283
	pushl %ebp                                # x86gen:228
	call L2_compare                           # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L4_block_done                         # x86gen:191
L4_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L2_compare
	.globl	L2_compare
	.func	L2_compare
	.type	L2_compare, @function
L2_compare:
	# FRAME L2_compare(1 formals, 3 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
	# SP, FP, calleesaves, argregs have values
L7_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L3_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:448 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl %ebp, -8(%ebp)                       # x86gen:246 x86frame:558
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:379
	movl -4(%ebx), %ecx                       # x86gen:239 x86frame:389
	movl %ecx, -12(%ebp)                      # x86gen:239 x86frame:384
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call stringGreater                        # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L6_block_done                         # x86gen:191
L6_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_compare, .-L2_compare
	.endfunc
# END L2_compare


	.data
L3_string:
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
