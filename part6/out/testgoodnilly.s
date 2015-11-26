
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 31 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $124, %esp
	# SP, FP, calleesaves, argregs have values
L20_blocks:                                       # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:477 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl -20(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -8(%ebp)                       # x86gen:91 x86frame:284
	movl -24(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -12(%ebp)                      # x86gen:91 x86frame:284
	movl -28(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	movl -32(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:262 x86frame:353
	movl -32(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jne L2_if_then                            # x86gen:174
L21_fallthrough:                                  # x86gen:177
	jmp L3_if_else                            # x86gen:182
L3_if_else:                                       # x86gen:128
	movl -36(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -36(%ebp)                      # x86gen:477 x86frame:333
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -88(%ebp)                      # x86gen:123 x86frame:595
L4_if_join:                                       # x86gen:128
	movl -44(%ebp), %ebx                      # x86gen:140 x86frame:323
	movl $0, %ebx                             # x86gen:140 x86frame:328
	movl %ebx, -44(%ebp)                      # x86gen:140 x86frame:333
	movl -40(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:262 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:145 x86frame:304
	movl -44(%ebp), %ecx                      # x86gen:145 x86frame:309
	cmpl %ebx, %ecx                           # x86gen:145 x86frame:314
	jne L5_if_then                            # x86gen:150
L22_fallthrough:                                  # x86gen:153
	jmp L6_if_else                            # x86gen:158
L6_if_else:                                       # x86gen:128
	movl -48(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:477 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -96(%ebp)                      # x86gen:123 x86frame:595
L7_if_join:                                       # x86gen:128
	movl -52(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:262 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L8_if_then                             # x86gen:174
L23_fallthrough:                                  # x86gen:177
	jmp L9_if_else                            # x86gen:182
L9_if_else:                                       # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -56(%ebp)                      # x86gen:477 x86frame:333
	movl -56(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -104(%ebp)                     # x86gen:123 x86frame:595
L10_if_join:                                      # x86gen:128
	movl -60(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:477 x86frame:333
	movl -60(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L1_f                                 # x86gen:222
	addl $8, %esp                             # x86gen:55
L11_if_then:                                      # x86gen:128
	movl -64(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -64(%ebp)                      # x86gen:262 x86frame:353
	movl -64(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
L13_if_join:                                      # x86gen:128
	movl -68(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -68(%ebp)                      # x86gen:262 x86frame:353
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
L14_if_then:                                      # x86gen:128
	movl -72(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -72(%ebp)                      # x86gen:477 x86frame:333
	movl -72(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -120(%ebp)                     # x86gen:123 x86frame:595
L16_if_join:                                      # x86gen:128
	movl -76(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -120(%ebp), %ecx                     # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	je L17_true                               # x86gen:198
L24_fallthrough:                                  # x86gen:201
	jmp L17_true                              # x86gen:206
L17_true:                                         # x86gen:128
	movl -80(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -80(%ebp)                      # x86gen:262 x86frame:353
	movl -80(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L18_true                               # x86gen:174
L25_fallthrough:                                  # x86gen:177
	jmp L18_true                              # x86gen:182
L18_true:                                         # x86gen:128
	movl -84(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -84(%ebp)                      # x86gen:262 x86frame:353
	movl -84(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L19_block_done                        # x86gen:214
L2_if_then:                                       # x86gen:128
	movl -92(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -92(%ebp)                      # x86gen:477 x86frame:333
	movl -92(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -88(%ebp)                      # x86gen:123 x86frame:595
	jmp L4_if_join                            # x86gen:214
L5_if_then:                                       # x86gen:128
	movl -100(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -100(%ebp)                     # x86gen:477 x86frame:333
	movl -100(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -96(%ebp)                      # x86gen:123 x86frame:595
	jmp L7_if_join                            # x86gen:214
L8_if_then:                                       # x86gen:128
	movl -108(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -108(%ebp)                     # x86gen:477 x86frame:333
	movl -108(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -104(%ebp)                     # x86gen:123 x86frame:595
	jmp L10_if_join                           # x86gen:214
L12_if_else:                                      # x86gen:128
	movl -116(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -116(%ebp)                     # x86gen:477 x86frame:333
	movl -116(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
	jmp L13_if_join                           # x86gen:214
L15_if_else:                                      # x86gen:128
	movl -124(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -124(%ebp)                     # x86gen:477 x86frame:333
	movl -124(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -120(%ebp)                     # x86gen:123 x86frame:595
	jmp L16_if_join                           # x86gen:214
L19_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L1_f
	.globl	L1_f
	.func	L1_f
	.type	L1_f, @function
L1_f:
	# FRAME L1_f(2 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L27_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %eax                       # x86gen:123 x86frame:584
	jmp L26_block_done                        # x86gen:214
L26_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_f, .-L1_f
	.endfunc
# END L1_f


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
