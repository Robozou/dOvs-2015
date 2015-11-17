
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
L6_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L4_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:448 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L2_do_nothing1                       # x86gen:199
	addl $12, %esp                            # x86gen:55
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L4_string:
	.long 4
	.asciz "str2"

	.text
# PROCEDURE L2_do_nothing1
	.globl	L2_do_nothing1
	.func	L2_do_nothing1
	.type	L2_do_nothing1, @function
L2_do_nothing1:
	# FRAME L2_do_nothing1(3 formals, 3 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
	# SP, FP, calleesaves, argregs have values
L8_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:263 x86frame:616
	movl %ebx, -8(%ebp)                       # x86gen:263 x86frame:620
	movl -8(%ebp), %ebx                       # x86gen:267 x86frame:377
	addl $1, %ebx                             # x86gen:267 x86frame:382
	movl %ebx, -8(%ebp)                       # x86gen:267 x86frame:387
	movl -8(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl %ebp, -12(%ebp)                      # x86gen:246 x86frame:602
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call L1_do_nothing2                       # x86gen:199
	addl $8, %esp                             # x86gen:55
	jmp L7_block_done                         # x86gen:191
L7_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_do_nothing1, .-L2_do_nothing1
	.endfunc
# END L2_do_nothing1



	.text
# PROCEDURE L1_do_nothing2
	.globl	L1_do_nothing2
	.func	L1_do_nothing2
	.type	L1_do_nothing2, @function
L1_do_nothing2:
	# FRAME L1_do_nothing2(2 formals, 3 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
	# SP, FP, calleesaves, argregs have values
L10_blocks:                                       # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L3_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:448 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:239 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl %ebp, -12(%ebp)                      # x86gen:246 x86frame:602
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call L2_do_nothing1                       # x86gen:199
	addl $12, %esp                            # x86gen:55
	jmp L9_block_done                         # x86gen:191
L9_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_do_nothing2, .-L1_do_nothing2
	.endfunc
# END L1_do_nothing2


	.data
L3_string:
	.long 3
	.asciz "str"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
