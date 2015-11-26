
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
L11_blocks:                                       # x86gen:128
	movl $L1_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:469 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	pushl %ebp                                # x86gen:251
	call L2_isdigit                           # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L10_block_done                        # x86gen:214
L10_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L2_isdigit
	.globl	L2_isdigit
	.func	L2_isdigit
	.type	L2_isdigit, @function
L2_isdigit:
	# FRAME L2_isdigit(1 formals, 17 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $68, %esp
	# SP, FP, calleesaves, argregs have values
L13_blocks:                                       # x86gen:128
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:270 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -8(%ebp)                       # x86gen:262 x86frame:404
	movl -8(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -12(%ebp)                      # x86gen:70 x86frame:577
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -20(%ebp)                      # x86gen:123 x86frame:595
	movl $L3_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:469 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:577
	movl -20(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -24(%ebp), %ecx                      # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	jge L5_if_then                            # x86gen:198
L14_fallthrough:                                  # x86gen:201
	jmp L6_if_else                            # x86gen:206
L6_if_else:                                       # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:123 x86frame:595
L7_if_join:                                       # x86gen:128
	movl -64(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L12_block_done                        # x86gen:214
L5_if_then:                                       # x86gen:128
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:477 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -68(%ebp)                      # x86gen:123 x86frame:595
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -36(%ebp)                      # x86gen:270 x86frame:353
	movl -36(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -40(%ebp)                      # x86gen:262 x86frame:404
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -44(%ebp)                      # x86gen:70 x86frame:577
	movl -44(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -52(%ebp)                      # x86gen:123 x86frame:595
	movl $L4_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:469 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -56(%ebp)                      # x86gen:70 x86frame:577
	movl -52(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -56(%ebp), %ecx                      # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	jle L8_unEx_t                             # x86gen:198
L15_fallthrough:                                  # x86gen:201
	jmp L9_unEx_f                             # x86gen:206
L9_unEx_f:                                        # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:477 x86frame:333
	movl -60(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -68(%ebp)                      # x86gen:123 x86frame:595
L8_unEx_t:                                        # x86gen:128
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:123 x86frame:595
	jmp L7_if_join                            # x86gen:214
L12_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_isdigit, .-L2_isdigit
	.endfunc
# END L2_isdigit


	.data
L4_string:
	.long 1
	.asciz "9"
	.data
L3_string:
	.long 1
	.asciz "0"
	.data
L1_string:
	.long 1
	.asciz "5"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
