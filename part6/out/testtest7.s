
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 18 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $72, %esp
	# SP, FP, calleesaves, argregs have values
L37_blocks:                                       # x86gen:128
	movl %ebp, -16(%ebp)                      # x86gen:289 x86frame:577
	movl -16(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -16(%ebp)                      # x86gen:294 x86frame:387
	movl -16(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -20(%ebp)                      # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call getChar                              # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:577
	movl -20(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -24(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl %ebp, -28(%ebp)                      # x86gen:289 x86frame:577
	movl -28(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-8, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -28(%ebp)                      # x86gen:294 x86frame:387
	movl -28(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call L1_readlist                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -36(%ebp)                      # x86gen:70 x86frame:577
	movl -32(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -36(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl %ebp, -40(%ebp)                      # x86gen:289 x86frame:577
	movl -40(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-12, %ebx                           # x86gen:294 x86frame:382
	movl %ebx, -40(%ebp)                      # x86gen:294 x86frame:387
	movl -40(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:595
	movl %ebp, -44(%ebp)                      # x86gen:289 x86frame:577
	movl -44(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -44(%ebp)                      # x86gen:294 x86frame:387
	movl -44(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call getChar                              # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:577
	movl -48(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -52(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	pushl %ebp                                # x86gen:251
	call L1_readlist                          # x86gen:80
	movl -56(%ebp), %ebx                      # x86gen:81 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:81 x86frame:595
	addl $4, %esp                             # x86gen:55
	movl %eax, -60(%ebp)                      # x86gen:83 x86frame:577
	movl -64(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:348
	movl %ebx, -64(%ebp)                      # x86gen:262 x86frame:353
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L33_if_then                            # x86gen:174
L38_fallthrough:                                  # x86gen:177
	jmp L34_if_else                           # x86gen:182
L34_if_else:                                      # x86gen:128
	movl -68(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L32_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:469 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
L35_if_join:                                      # x86gen:128
	jmp L36_block_done                        # x86gen:214
L33_if_then:                                      # x86gen:128
	movl -72(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L31_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -72(%ebp)                      # x86gen:469 x86frame:333
	movl -72(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L35_if_join                           # x86gen:214
L36_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L32_string:
	.long 6
	.asciz "notnil"
	.data
L31_string:
	.long 3
	.asciz "nil"

	.text
# PROCEDURE L2_readint
	.globl	L2_readint
	.func	L2_readint
	.type	L2_readint, @function
L2_readint:
	# FRAME L2_readint(2 formals, 35 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $140, %esp
	# SP, FP, calleesaves, argregs have values
L40_blocks:                                       # x86gen:128
	movl -8(%ebp), %ebx                       # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	pushl %ebp                                # x86gen:251
	call L8_skipto                            # x86gen:222
	addl $4, %esp                             # x86gen:55
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L25_field_nil                          # x86gen:174
L41_fallthrough:                                  # x86gen:177
	jmp L26_field_nonNil                      # x86gen:182
L26_field_nonNil:                                 # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:307 x86frame:595
	movl -20(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -28(%ebp)                      # x86gen:357 x86frame:595
	movl -24(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -28(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -28(%ebp)                      # x86gen:362 x86frame:544
	movl -28(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -32(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -32(%ebp)                      # x86gen:312 x86frame:544
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:123 x86frame:595
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:123 x86frame:595
	movl -40(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:270 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -44(%ebp)                      # x86gen:262 x86frame:404
	movl -44(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L9_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:577
	movl -48(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -52(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
L29_while_test:                                   # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -56(%ebp)                      # x86gen:270 x86frame:353
	movl -56(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -60(%ebp)                      # x86gen:262 x86frame:404
	movl -60(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L9_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -64(%ebp)                      # x86gen:70 x86frame:577
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L27_done_label                         # x86gen:174
L42_fallthrough:                                  # x86gen:177
	jmp L30_while_body                        # x86gen:182
L30_while_body:                                   # x86gen:128
	movl %ebp, -68(%ebp)                      # x86gen:289 x86frame:577
	movl -68(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -68(%ebp)                      # x86gen:294 x86frame:387
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -116(%ebp)                     # x86gen:123 x86frame:595
	movl -72(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -72(%ebp)                      # x86gen:262 x86frame:353
	movl -72(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -80(%ebp)                      # x86gen:357 x86frame:595
	movl -76(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -76(%ebp)                      # x86gen:477 x86frame:333
	movl -76(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -80(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -80(%ebp)                      # x86gen:362 x86frame:544
	movl -80(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -92(%ebp)                      # x86gen:123 x86frame:595
	movl -84(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -84(%ebp)                      # x86gen:270 x86frame:353
	movl -84(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -88(%ebp)                      # x86gen:262 x86frame:404
	movl -88(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -96(%ebp)                      # x86gen:70 x86frame:577
	movl -92(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -100(%ebp)                     # x86gen:307 x86frame:595
	movl -96(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -100(%ebp), %ebx                     # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -100(%ebp)                     # x86gen:312 x86frame:544
	movl -100(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -108(%ebp)                     # x86gen:123 x86frame:595
	movl -104(%ebp), %ebx                     # x86gen:469 x86frame:323
	movl $L28_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -104(%ebp)                     # x86gen:469 x86frame:333
	movl -104(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -112(%ebp)                     # x86gen:70 x86frame:577
	movl -108(%ebp), %ebx                     # x86gen:349 x86frame:591
	movl %ebx, -120(%ebp)                     # x86gen:349 x86frame:595
	movl -112(%ebp), %ecx                     # x86gen:353 x86frame:529
	movl -120(%ebp), %ebx                     # x86gen:353 x86frame:534
	subl %ecx, %ebx                           # x86gen:353 x86frame:539
	movl %ebx, -120(%ebp)                     # x86gen:353 x86frame:544
	movl -116(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -120(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -124(%ebp), %ebx                     # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -124(%ebp)                     # x86gen:270 x86frame:353
	movl -124(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -128(%ebp)                     # x86gen:289 x86frame:595
	movl -128(%ebp), %ebx                     # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -128(%ebp)                     # x86gen:294 x86frame:387
	movl -128(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -132(%ebp)                     # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call getChar                              # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -136(%ebp)                     # x86gen:70 x86frame:577
	movl -132(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -136(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	jmp L29_while_test                        # x86gen:214
L25_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L26_field_nonNil                      # x86gen:214
L27_done_label:                                   # x86gen:128
	movl -140(%ebp), %ebx                     # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -140(%ebp)                     # x86gen:262 x86frame:353
	movl -140(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L39_block_done                        # x86gen:214
L39_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_readint, .-L2_readint
	.endfunc
# END L2_readint


	.data
L28_string:
	.long 1
	.asciz "0"

	.text
# PROCEDURE L9_isdigit
	.globl	L9_isdigit
	.func	L9_isdigit
	.type	L9_isdigit, @function
L9_isdigit:
	# FRAME L9_isdigit(2 formals, 19 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $76, %esp
	# SP, FP, calleesaves, argregs have values
L44_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:270 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:270 x86frame:394
	movl 8(%ebx), %ecx                        # x86gen:270 x86frame:399
	movl %ecx, -8(%ebp)                       # x86gen:270 x86frame:404
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -12(%ebp)                      # x86gen:262 x86frame:404
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -16(%ebp)                      # x86gen:70 x86frame:577
	movl -16(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	movl -20(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L18_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:469 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
	movl -24(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -28(%ebp), %ecx                      # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	jge L20_if_then                           # x86gen:198
L45_fallthrough:                                  # x86gen:201
	jmp L21_if_else                           # x86gen:206
L21_if_else:                                      # x86gen:128
	movl -32(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:477 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
L22_if_join:                                      # x86gen:128
	movl -72(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L43_block_done                        # x86gen:214
L20_if_then:                                      # x86gen:128
	movl -36(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -36(%ebp)                      # x86gen:477 x86frame:333
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
	movl -40(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:270 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:270 x86frame:394
	movl 8(%ebx), %ecx                        # x86gen:270 x86frame:399
	movl %ecx, -44(%ebp)                      # x86gen:270 x86frame:404
	movl -44(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -48(%ebp)                      # x86gen:262 x86frame:404
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:577
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:123 x86frame:595
	movl -56(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L19_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -56(%ebp)                      # x86gen:469 x86frame:333
	movl -56(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -64(%ebp)                      # x86gen:70 x86frame:577
	movl -60(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -64(%ebp), %ecx                      # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	jle L23_unEx_t                            # x86gen:198
L46_fallthrough:                                  # x86gen:201
	jmp L24_unEx_f                            # x86gen:206
L24_unEx_f:                                       # x86gen:128
	movl -68(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:477 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
L23_unEx_t:                                       # x86gen:128
	movl -76(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
	jmp L22_if_join                           # x86gen:214
L43_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L9_isdigit, .-L9_isdigit
	.endfunc
# END L9_isdigit


	.data
L19_string:
	.long 1
	.asciz "9"
	.data
L18_string:
	.long 1
	.asciz "0"

	.text
# PROCEDURE L8_skipto
	.globl	L8_skipto
	.func	L8_skipto
	.type	L8_skipto, @function
L8_skipto:
	# FRAME L8_skipto(1 formals, 16 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $64, %esp
	# SP, FP, calleesaves, argregs have values
L16_while_test:                                   # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:469 x86frame:323
	movl $L10_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:469 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:270 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:270 x86frame:394
	movl 8(%ebx), %ecx                        # x86gen:270 x86frame:399
	movl %ecx, -12(%ebp)                      # x86gen:270 x86frame:404
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -16(%ebp)                      # x86gen:262 x86frame:404
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call stringEqual                          # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -20(%ebp)                      # x86gen:70 x86frame:577
	movl -20(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L13_if_else                            # x86gen:174
L48_fallthrough:                                  # x86gen:177
	jmp L12_if_then                           # x86gen:182
L12_if_then:                                      # x86gen:128
	movl -24(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:123 x86frame:595
L14_if_join:                                      # x86gen:128
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L15_done_label                         # x86gen:174
L49_fallthrough:                                  # x86gen:177
	jmp L17_while_body                        # x86gen:182
L17_while_body:                                   # x86gen:128
	movl -28(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -28(%ebp)                      # x86gen:270 x86frame:353
	movl -28(%ebp), %ebx                      # x86gen:270 x86frame:394
	movl 8(%ebx), %ecx                        # x86gen:270 x86frame:399
	movl %ecx, -32(%ebp)                      # x86gen:270 x86frame:404
	movl -32(%ebp), %ebx                      # x86gen:289 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:289 x86frame:595
	movl -36(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -36(%ebp)                      # x86gen:294 x86frame:387
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -40(%ebp)                      # x86gen:123 x86frame:595
	pushl %ebp                                # x86gen:251
	call getChar                              # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -44(%ebp)                      # x86gen:70 x86frame:577
	movl -40(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -44(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	jmp L16_while_test                        # x86gen:214
L13_if_else:                                      # x86gen:128
	movl -48(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L11_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:469 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -52(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:270 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:270 x86frame:394
	movl 8(%ebx), %ecx                        # x86gen:270 x86frame:399
	movl %ecx, -56(%ebp)                      # x86gen:270 x86frame:404
	movl -56(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -60(%ebp)                      # x86gen:262 x86frame:404
	movl -60(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call stringEqual                          # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -64(%ebp)                      # x86gen:70 x86frame:577
	jmp L14_if_join                           # x86gen:214
L15_done_label:                                   # x86gen:128
	jmp L47_block_done                        # x86gen:214
L47_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L8_skipto, .-L8_skipto
	.endfunc
# END L8_skipto


	.data
L11_string:
	.long 1
	.asciz "\12"
	.data
L10_string:
	.long 1
	.asciz " "

	.text
# PROCEDURE L1_readlist
	.globl	L1_readlist
	.func	L1_readlist
	.type	L1_readlist, @function
L1_readlist:
	# FRAME L1_readlist(1 formals, 29 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $116, %esp
	# SP, FP, calleesaves, argregs have values
L51_blocks:                                       # x86gen:128
	movl %ebp, -12(%ebp)                      # x86gen:289 x86frame:577
	movl -12(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -12(%ebp)                      # x86gen:294 x86frame:387
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:477 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
	movl -20(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -20(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 0(%ebx)                        # x86gen:91 x86frame:314
	movl -24(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -28(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl %ebp, -32(%ebp)                      # x86gen:289 x86frame:577
	movl -32(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-8, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -32(%ebp)                      # x86gen:294 x86frame:387
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -44(%ebp)                      # x86gen:123 x86frame:595
	movl -36(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -36(%ebp)                      # x86gen:262 x86frame:353
	movl -36(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -40(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:270 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L2_readint                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -48(%ebp)                      # x86gen:70 x86frame:577
	movl -44(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -48(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -52(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:262 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:595
	movl -56(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L3_field_nil                           # x86gen:174
L52_fallthrough:                                  # x86gen:177
	jmp L4_field_nonNil                       # x86gen:182
L4_field_nonNil:                                  # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:307 x86frame:595
	movl -60(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:477 x86frame:333
	movl -60(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -68(%ebp)                      # x86gen:357 x86frame:595
	movl -64(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:477 x86frame:333
	movl -64(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -68(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -68(%ebp)                      # x86gen:362 x86frame:544
	movl -68(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -72(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -72(%ebp)                      # x86gen:312 x86frame:544
	movl -72(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
	movl -76(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -80(%ebp)                      # x86gen:285 x86frame:404
	movl -80(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L6_if_else                             # x86gen:174
L53_fallthrough:                                  # x86gen:177
	jmp L5_if_then                            # x86gen:182
L5_if_then:                                       # x86gen:128
	movl -84(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -84(%ebp)                      # x86gen:477 x86frame:333
	movl -84(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -108(%ebp)                     # x86gen:70 x86frame:577
	movl -88(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -88(%ebp)                      # x86gen:262 x86frame:353
	movl -108(%ebp), %ebx                     # x86gen:91 x86frame:304
	movl -88(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 0(%ebx)                        # x86gen:91 x86frame:314
	movl -108(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -92(%ebp)                      # x86gen:289 x86frame:595
	movl -92(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $4, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -92(%ebp)                      # x86gen:294 x86frame:387
	movl -92(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -100(%ebp)                     # x86gen:123 x86frame:595
	movl -96(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -96(%ebp)                      # x86gen:270 x86frame:353
	movl -96(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L1_readlist                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -104(%ebp)                     # x86gen:70 x86frame:577
	movl -100(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -104(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -108(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
L7_if_join:                                       # x86gen:128
	movl -112(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L50_block_done                        # x86gen:214
L3_field_nil:                                     # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L4_field_nonNil                       # x86gen:214
L6_if_else:                                       # x86gen:128
	movl -116(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -116(%ebp)                     # x86gen:477 x86frame:333
	movl -116(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
	jmp L7_if_join                            # x86gen:214
L50_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_readlist, .-L1_readlist
	.endfunc
# END L1_readlist


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
