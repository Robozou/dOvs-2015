
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
L77_blocks:                                       # x86gen:128
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
	call L28_readlist                         # x86gen:68
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
	call L28_readlist                         # x86gen:80
	addl $4, %esp                             # x86gen:55
	movl -56(%ebp), %ebx                      # x86gen:87 x86frame:279
	movl %eax, (%ebx)                         # x86gen:87 x86frame:284
	movl %ebp, -72(%ebp)                      # x86gen:123 x86frame:577
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:348
	movl %ebx, -60(%ebp)                      # x86gen:262 x86frame:353
	movl -60(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -64(%ebp)                      # x86gen:262 x86frame:353
	movl -64(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L27_merge                            # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -68(%ebp)                      # x86gen:70 x86frame:577
	movl -68(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -72(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L25_printlist                        # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L76_block_done                        # x86gen:214
L76_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L28_readlist
	.globl	L28_readlist
	.func	L28_readlist
	.type	L28_readlist, @function
L28_readlist:
	# FRAME L28_readlist(1 formals, 29 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $116, %esp
	# SP, FP, calleesaves, argregs have values
L79_blocks:                                       # x86gen:128
	movl %ebp, -12(%ebp)                      # x86gen:289 x86frame:577
	movl -12(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -12(%ebp)                      # x86gen:294 x86frame:387
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:477 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
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
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -36(%ebp)                      # x86gen:262 x86frame:353
	movl -36(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:270 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L1_readint                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -48(%ebp)                      # x86gen:70 x86frame:577
	movl -44(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -48(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:262 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:595
	movl -56(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L71_field_nil                          # x86gen:174
L80_fallthrough:                                  # x86gen:177
	jmp L72_field_nonNil                      # x86gen:182
L72_field_nonNil:                                 # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:477 x86frame:333
	movl -60(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -68(%ebp)                      # x86gen:357 x86frame:595
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
	je L74_if_else                            # x86gen:174
L81_fallthrough:                                  # x86gen:177
	jmp L73_if_then                           # x86gen:182
L73_if_then:                                      # x86gen:128
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -84(%ebp)                      # x86gen:477 x86frame:333
	movl -84(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -108(%ebp)                     # x86gen:70 x86frame:577
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
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -96(%ebp)                      # x86gen:270 x86frame:353
	movl -96(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L28_readlist                         # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -104(%ebp)                     # x86gen:70 x86frame:577
	movl -100(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -104(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -108(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
L75_if_join:                                      # x86gen:128
	movl -112(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L78_block_done                        # x86gen:214
L71_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L72_field_nonNil                      # x86gen:214
L74_if_else:                                      # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -116(%ebp)                     # x86gen:477 x86frame:333
	movl -116(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
	jmp L75_if_join                           # x86gen:214
L78_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L28_readlist, .-L28_readlist
	.endfunc
# END L28_readlist



	.text
# PROCEDURE L27_merge
	.globl	L27_merge
	.func	L27_merge
	.type	L27_merge, @function
L27_merge:
	# FRAME L27_merge(3 formals, 77 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $308, %esp
	# SP, FP, calleesaves, argregs have values
L83_blocks:                                       # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L68_if_then                            # x86gen:174
L84_fallthrough:                                  # x86gen:177
	jmp L69_if_else                           # x86gen:182
L69_if_else:                                      # x86gen:128
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:262 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L65_if_then                            # x86gen:174
L85_fallthrough:                                  # x86gen:177
	jmp L66_if_else                           # x86gen:182
L66_if_else:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L50_field_nil                          # x86gen:174
L86_fallthrough:                                  # x86gen:177
	jmp L51_field_nonNil                      # x86gen:182
L51_field_nonNil:                                 # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -28(%ebp)                      # x86gen:357 x86frame:595
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
	movl -36(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -40(%ebp)                      # x86gen:285 x86frame:404
	movl -40(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -44(%ebp)                      # x86gen:262 x86frame:353
	movl -44(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:123 x86frame:595
	movl -48(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L52_field_nil                          # x86gen:174
L87_fallthrough:                                  # x86gen:177
	jmp L53_field_nonNil                      # x86gen:182
L53_field_nonNil:                                 # x86gen:128
	movl -48(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -52(%ebp)                      # x86gen:477 x86frame:333
	movl -52(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -56(%ebp)                      # x86gen:477 x86frame:333
	movl -56(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -60(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -60(%ebp)                      # x86gen:362 x86frame:544
	movl -60(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -64(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -64(%ebp)                      # x86gen:312 x86frame:544
	movl -64(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -68(%ebp)                      # x86gen:123 x86frame:595
	movl -68(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -76(%ebp)                      # x86gen:285 x86frame:404
	movl -72(%ebp), %ebx                      # x86gen:193 x86frame:304
	movl -76(%ebp), %ecx                      # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	jl L62_if_then                            # x86gen:198
L88_fallthrough:                                  # x86gen:201
	jmp L63_if_else                           # x86gen:206
L63_if_else:                                      # x86gen:128
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -80(%ebp)                      # x86gen:477 x86frame:333
	movl -80(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -184(%ebp)                     # x86gen:70 x86frame:577
	movl -184(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -84(%ebp)                      # x86gen:289 x86frame:595
	movl -84(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $0, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -84(%ebp)                      # x86gen:294 x86frame:387
	movl -84(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -116(%ebp)                     # x86gen:123 x86frame:595
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -88(%ebp)                      # x86gen:262 x86frame:353
	movl -88(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -92(%ebp)                      # x86gen:123 x86frame:595
	movl -92(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L58_field_nil                          # x86gen:174
L89_fallthrough:                                  # x86gen:177
	jmp L59_field_nonNil                      # x86gen:182
L59_field_nonNil:                                 # x86gen:128
	movl -92(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -108(%ebp)                     # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -96(%ebp)                      # x86gen:477 x86frame:333
	movl -96(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -104(%ebp)                     # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -100(%ebp)                     # x86gen:477 x86frame:333
	movl -100(%ebp), %ecx                     # x86gen:362 x86frame:529
	movl -104(%ebp), %ebx                     # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -104(%ebp)                     # x86gen:362 x86frame:544
	movl -104(%ebp), %ecx                     # x86gen:312 x86frame:529
	movl -108(%ebp), %ebx                     # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -108(%ebp)                     # x86gen:312 x86frame:544
	movl -108(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
	movl -112(%ebp), %ebx                     # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -120(%ebp)                     # x86gen:285 x86frame:404
	movl -116(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -120(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -184(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -124(%ebp)                     # x86gen:289 x86frame:595
	movl -124(%ebp), %ebx                     # x86gen:294 x86frame:377
	addl $4, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -124(%ebp)                     # x86gen:294 x86frame:387
	movl -124(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -176(%ebp)                     # x86gen:123 x86frame:595
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -128(%ebp)                     # x86gen:270 x86frame:353
	movl -128(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -172(%ebp)                     # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -132(%ebp)                     # x86gen:262 x86frame:353
	movl -132(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -168(%ebp)                     # x86gen:123 x86frame:595
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -136(%ebp)                     # x86gen:262 x86frame:353
	movl -136(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -140(%ebp)                     # x86gen:123 x86frame:595
	movl -140(%ebp), %ebx                     # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L60_field_nil                          # x86gen:174
L90_fallthrough:                                  # x86gen:177
	jmp L61_field_nonNil                      # x86gen:182
L61_field_nonNil:                                 # x86gen:128
	movl -140(%ebp), %ebx                     # x86gen:307 x86frame:591
	movl %ebx, -156(%ebp)                     # x86gen:307 x86frame:595
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -144(%ebp)                     # x86gen:477 x86frame:333
	movl -144(%ebp), %ebx                     # x86gen:357 x86frame:591
	movl %ebx, -152(%ebp)                     # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -148(%ebp)                     # x86gen:477 x86frame:333
	movl -148(%ebp), %ecx                     # x86gen:362 x86frame:529
	movl -152(%ebp), %ebx                     # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -152(%ebp)                     # x86gen:362 x86frame:544
	movl -152(%ebp), %ecx                     # x86gen:312 x86frame:529
	movl -156(%ebp), %ebx                     # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -156(%ebp)                     # x86gen:312 x86frame:544
	movl -156(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -160(%ebp)                     # x86gen:123 x86frame:595
	movl -160(%ebp), %ebx                     # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -164(%ebp)                     # x86gen:285 x86frame:404
	movl -164(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -168(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -172(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L27_merge                            # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -180(%ebp)                     # x86gen:70 x86frame:577
	movl -176(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -180(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -184(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -304(%ebp)                     # x86gen:123 x86frame:595
L64_if_join:                                      # x86gen:128
	movl -304(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -196(%ebp)                     # x86gen:123 x86frame:595
L67_if_join:                                      # x86gen:128
	movl -196(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -188(%ebp)                     # x86gen:123 x86frame:595
L70_if_join:                                      # x86gen:128
	movl -188(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L82_block_done                        # x86gen:214
L68_if_then:                                      # x86gen:128
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -192(%ebp)                     # x86gen:262 x86frame:353
	movl -192(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -188(%ebp)                     # x86gen:123 x86frame:595
	jmp L70_if_join                           # x86gen:214
L65_if_then:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -200(%ebp)                     # x86gen:262 x86frame:353
	movl -200(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -196(%ebp)                     # x86gen:123 x86frame:595
	jmp L67_if_join                           # x86gen:214
L50_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L51_field_nonNil                      # x86gen:214
L52_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L53_field_nonNil                      # x86gen:214
L62_if_then:                                      # x86gen:128
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -204(%ebp)                     # x86gen:477 x86frame:333
	movl -204(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -308(%ebp)                     # x86gen:70 x86frame:577
	movl -308(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -208(%ebp)                     # x86gen:289 x86frame:595
	movl -208(%ebp), %ebx                     # x86gen:294 x86frame:377
	addl $0, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -208(%ebp)                     # x86gen:294 x86frame:387
	movl -208(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -240(%ebp)                     # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -212(%ebp)                     # x86gen:262 x86frame:353
	movl -212(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -216(%ebp)                     # x86gen:123 x86frame:595
	movl -216(%ebp), %ebx                     # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L54_field_nil                          # x86gen:174
L91_fallthrough:                                  # x86gen:177
	jmp L55_field_nonNil                      # x86gen:182
L55_field_nonNil:                                 # x86gen:128
	movl -216(%ebp), %ebx                     # x86gen:307 x86frame:591
	movl %ebx, -232(%ebp)                     # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -220(%ebp)                     # x86gen:477 x86frame:333
	movl -220(%ebp), %ebx                     # x86gen:357 x86frame:591
	movl %ebx, -228(%ebp)                     # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -224(%ebp)                     # x86gen:477 x86frame:333
	movl -224(%ebp), %ecx                     # x86gen:362 x86frame:529
	movl -228(%ebp), %ebx                     # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -228(%ebp)                     # x86gen:362 x86frame:544
	movl -228(%ebp), %ecx                     # x86gen:312 x86frame:529
	movl -232(%ebp), %ebx                     # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -232(%ebp)                     # x86gen:312 x86frame:544
	movl -232(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -236(%ebp)                     # x86gen:123 x86frame:595
	movl -236(%ebp), %ebx                     # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -244(%ebp)                     # x86gen:285 x86frame:404
	movl -240(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -244(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -308(%ebp), %ebx                     # x86gen:289 x86frame:591
	movl %ebx, -248(%ebp)                     # x86gen:289 x86frame:595
	movl -248(%ebp), %ebx                     # x86gen:294 x86frame:377
	addl $4, %ebx                             # x86gen:294 x86frame:382
	movl %ebx, -248(%ebp)                     # x86gen:294 x86frame:387
	movl -248(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -296(%ebp)                     # x86gen:123 x86frame:595
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -252(%ebp)                     # x86gen:270 x86frame:353
	movl -252(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -292(%ebp)                     # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -256(%ebp)                     # x86gen:262 x86frame:353
	movl -256(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -260(%ebp)                     # x86gen:123 x86frame:595
	movl -260(%ebp), %ebx                     # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L56_field_nil                          # x86gen:174
L92_fallthrough:                                  # x86gen:177
	jmp L57_field_nonNil                      # x86gen:182
L57_field_nonNil:                                 # x86gen:128
	movl -260(%ebp), %ebx                     # x86gen:307 x86frame:591
	movl %ebx, -276(%ebp)                     # x86gen:307 x86frame:595
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -264(%ebp)                     # x86gen:477 x86frame:333
	movl -264(%ebp), %ebx                     # x86gen:357 x86frame:591
	movl %ebx, -272(%ebp)                     # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -268(%ebp)                     # x86gen:477 x86frame:333
	movl -268(%ebp), %ecx                     # x86gen:362 x86frame:529
	movl -272(%ebp), %ebx                     # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -272(%ebp)                     # x86gen:362 x86frame:544
	movl -272(%ebp), %ecx                     # x86gen:312 x86frame:529
	movl -276(%ebp), %ebx                     # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -276(%ebp)                     # x86gen:312 x86frame:544
	movl -276(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -284(%ebp)                     # x86gen:123 x86frame:595
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -280(%ebp)                     # x86gen:262 x86frame:353
	movl -280(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -284(%ebp), %ebx                     # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -288(%ebp)                     # x86gen:285 x86frame:404
	movl -288(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -292(%ebp), %ebx                     # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L27_merge                            # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -300(%ebp)                     # x86gen:70 x86frame:577
	movl -296(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -300(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -308(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -304(%ebp)                     # x86gen:123 x86frame:595
	jmp L64_if_join                           # x86gen:214
L54_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L55_field_nonNil                      # x86gen:214
L56_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L57_field_nonNil                      # x86gen:214
L58_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L59_field_nonNil                      # x86gen:214
L60_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L61_field_nonNil                      # x86gen:214
L82_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L27_merge, .-L27_merge
	.endfunc
# END L27_merge



	.text
# PROCEDURE L26_printint
	.globl	L26_printint
	.func	L26_printint
	.type	L26_printint, @function
L26_printint:
	# FRAME L26_printint(2 formals, 7 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $28, %esp
	# SP, FP, calleesaves, argregs have values
L94_blocks:                                       # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jl L47_if_then                            # x86gen:174
L95_fallthrough:                                  # x86gen:177
	jmp L48_if_else                           # x86gen:182
L48_if_else:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:262 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jg L44_if_then                            # x86gen:174
L96_fallthrough:                                  # x86gen:177
	jmp L45_if_else                           # x86gen:182
L45_if_else:                                      # x86gen:128
	movl $L43_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:469 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
L46_if_join:                                      # x86gen:128
L49_if_join:                                      # x86gen:128
	jmp L93_block_done                        # x86gen:214
L47_if_then:                                      # x86gen:128
	movl $L42_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:469 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl $0, %ebx                             # x86gen:329 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:329 x86frame:333
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:262 x86frame:353
	movl -20(%ebp), %ecx                      # x86gen:334 x86frame:529
	movl -24(%ebp), %ebx                      # x86gen:334 x86frame:534
	subl %ecx, %ebx                           # x86gen:334 x86frame:539
	movl %ebx, -24(%ebp)                      # x86gen:334 x86frame:544
	movl -24(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L38_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L49_if_join                           # x86gen:214
L44_if_then:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -28(%ebp)                      # x86gen:262 x86frame:353
	movl -28(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L38_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L46_if_join                           # x86gen:214
L93_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L26_printint, .-L26_printint
	.endfunc
# END L26_printint


	.data
L43_string:
	.long 1
	.asciz "0"
	.data
L42_string:
	.long 1
	.asciz "-"

	.text
# PROCEDURE L38_f
	.globl	L38_f
	.func	L38_f
	.type	L38_f, @function
L38_f:
	# FRAME L38_f(2 formals, 19 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $76, %esp
	# SP, FP, calleesaves, argregs have values
L98_blocks:                                       # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jg L40_if_then                            # x86gen:174
L99_fallthrough:                                  # x86gen:177
	jmp L41_if_end                            # x86gen:182
L41_if_end:                                       # x86gen:128
	jmp L97_block_done                        # x86gen:214
L40_if_then:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:385 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:385 x86frame:595
	movl -12(%ebp), %eax                      # x86gen:386 x86frame:584
	cltd                                      # x86gen:391
	movl -16(%ebp), %ebx                      # x86gen:396 x86frame:264
	idivl %ebx                                # x86gen:396 x86frame:269
	movl %eax, -16(%ebp)                      # x86gen:397 x86frame:577
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:270 x86frame:353
	movl -20(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L38_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl %ebp, -76(%ebp)                      # x86gen:123 x86frame:577
	movl %ebp, -68(%ebp)                      # x86gen:123 x86frame:577
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -24(%ebp)                      # x86gen:262 x86frame:353
	movl -24(%ebp), %ebx                      # x86gen:349 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:349 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:262 x86frame:353
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:385 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:385 x86frame:595
	movl -32(%ebp), %eax                      # x86gen:386 x86frame:584
	cltd                                      # x86gen:391
	movl -36(%ebp), %ebx                      # x86gen:396 x86frame:264
	idivl %ebx                                # x86gen:396 x86frame:269
	movl %eax, -36(%ebp)                      # x86gen:397 x86frame:577
	movl -36(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -44(%ebp)                      # x86gen:357 x86frame:595
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:477 x86frame:333
	movl -40(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -44(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -44(%ebp)                      # x86gen:362 x86frame:544
	movl -44(%ebp), %ecx                      # x86gen:353 x86frame:529
	movl -48(%ebp), %ebx                      # x86gen:353 x86frame:534
	subl %ecx, %ebx                           # x86gen:353 x86frame:539
	movl %ebx, -48(%ebp)                      # x86gen:353 x86frame:544
	movl -48(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:595
	movl $L39_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -52(%ebp)                      # x86gen:469 x86frame:333
	movl -52(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -60(%ebp)                      # x86gen:70 x86frame:577
	movl -56(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:307 x86frame:595
	movl -60(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -64(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -64(%ebp)                      # x86gen:312 x86frame:544
	movl -64(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -68(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call chr                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -72(%ebp)                      # x86gen:70 x86frame:577
	movl -72(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -76(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L41_if_end                            # x86gen:214
L97_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L38_f, .-L38_f
	.endfunc
# END L38_f


	.data
L39_string:
	.long 1
	.asciz "0"

	.text
# PROCEDURE L25_printlist
	.globl	L25_printlist
	.func	L25_printlist
	.type	L25_printlist, @function
L25_printlist:
	# FRAME L25_printlist(2 formals, 23 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $92, %esp
	# SP, FP, calleesaves, argregs have values
L101_blocks:                                      # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L35_if_then                            # x86gen:174
L102_fallthrough:                                 # x86gen:177
	jmp L36_if_else                           # x86gen:182
L36_if_else:                                      # x86gen:128
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:270 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:591
	movl %ebx, -44(%ebp)                      # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L30_field_nil                          # x86gen:174
L103_fallthrough:                                 # x86gen:177
	jmp L31_field_nonNil                      # x86gen:182
L31_field_nonNil:                                 # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -28(%ebp)                      # x86gen:357 x86frame:595
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
	movl -36(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -40(%ebp)                      # x86gen:285 x86frame:404
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -44(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L26_printint                         # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl $L32_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:469 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:270 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -88(%ebp)                      # x86gen:123 x86frame:595
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -56(%ebp)                      # x86gen:262 x86frame:353
	movl -56(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:123 x86frame:595
	movl -60(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L33_field_nil                          # x86gen:174
L104_fallthrough:                                 # x86gen:177
	jmp L34_field_nonNil                      # x86gen:182
L34_field_nonNil:                                 # x86gen:128
	movl -60(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:307 x86frame:595
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:477 x86frame:333
	movl -64(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:477 x86frame:333
	movl -68(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -72(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -72(%ebp)                      # x86gen:362 x86frame:544
	movl -72(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -76(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -76(%ebp)                      # x86gen:312 x86frame:544
	movl -76(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -80(%ebp)                      # x86gen:123 x86frame:595
	movl -80(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -84(%ebp)                      # x86gen:285 x86frame:404
	movl -84(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -88(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L25_printlist                        # x86gen:222
	addl $8, %esp                             # x86gen:55
L37_if_join:                                      # x86gen:128
	jmp L100_block_done                       # x86gen:214
L35_if_then:                                      # x86gen:128
	movl $L29_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -92(%ebp)                      # x86gen:469 x86frame:333
	movl -92(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L37_if_join                           # x86gen:214
L30_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L31_field_nonNil                      # x86gen:214
L33_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L34_field_nonNil                      # x86gen:214
L100_block_done:                                  # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L25_printlist, .-L25_printlist
	.endfunc
# END L25_printlist


	.data
L32_string:
	.long 1
	.asciz " "
	.data
L29_string:
	.long 1
	.asciz "\12"

	.text
# PROCEDURE L1_readint
	.globl	L1_readint
	.func	L1_readint
	.type	L1_readint, @function
L1_readint:
	# FRAME L1_readint(2 formals, 35 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $140, %esp
	# SP, FP, calleesaves, argregs have values
L106_blocks:                                      # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	pushl %ebp                                # x86gen:251
	call L2_skipto                            # x86gen:222
	addl $4, %esp                             # x86gen:55
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L19_field_nil                          # x86gen:174
L107_fallthrough:                                 # x86gen:177
	jmp L20_field_nonNil                      # x86gen:182
L20_field_nonNil:                                 # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -32(%ebp)                      # x86gen:307 x86frame:595
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -28(%ebp)                      # x86gen:357 x86frame:595
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
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -40(%ebp)                      # x86gen:270 x86frame:353
	movl -40(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -44(%ebp)                      # x86gen:262 x86frame:404
	movl -44(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L3_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:577
	movl -48(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -52(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
L23_while_test:                                   # x86gen:128
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -56(%ebp)                      # x86gen:270 x86frame:353
	movl -56(%ebp), %ebx                      # x86gen:262 x86frame:394
	movl -4(%ebx), %ecx                       # x86gen:262 x86frame:399
	movl %ecx, -60(%ebp)                      # x86gen:262 x86frame:404
	movl -60(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L3_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -64(%ebp)                      # x86gen:70 x86frame:577
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L21_done_label                         # x86gen:174
L108_fallthrough:                                 # x86gen:177
	jmp L24_while_body                        # x86gen:182
L24_while_body:                                   # x86gen:128
	movl %ebp, -68(%ebp)                      # x86gen:289 x86frame:577
	movl -68(%ebp), %ebx                      # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -68(%ebp)                      # x86gen:294 x86frame:387
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -116(%ebp)                     # x86gen:123 x86frame:595
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -72(%ebp)                      # x86gen:262 x86frame:353
	movl -72(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -80(%ebp)                      # x86gen:357 x86frame:595
	movl $10, %ebx                            # x86gen:477 x86frame:328
	movl %ebx, -76(%ebp)                      # x86gen:477 x86frame:333
	movl -76(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -80(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -80(%ebp)                      # x86gen:362 x86frame:544
	movl -80(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -92(%ebp)                      # x86gen:123 x86frame:595
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
	movl $L22_string, %ebx                    # x86gen:469 x86frame:328
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
	jmp L23_while_test                        # x86gen:214
L19_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L20_field_nonNil                      # x86gen:214
L21_done_label:                                   # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -140(%ebp)                     # x86gen:262 x86frame:353
	movl -140(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L105_block_done                       # x86gen:214
L105_block_done:                                  # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_readint, .-L1_readint
	.endfunc
# END L1_readint


	.data
L22_string:
	.long 1
	.asciz "0"

	.text
# PROCEDURE L3_isdigit
	.globl	L3_isdigit
	.func	L3_isdigit
	.type	L3_isdigit, @function
L3_isdigit:
	# FRAME L3_isdigit(2 formals, 19 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $76, %esp
	# SP, FP, calleesaves, argregs have values
L110_blocks:                                      # x86gen:128
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
	movl $L12_string, %ebx                    # x86gen:469 x86frame:328
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
	jge L14_if_then                           # x86gen:198
L111_fallthrough:                                 # x86gen:201
	jmp L15_if_else                           # x86gen:206
L15_if_else:                                      # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:477 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
L16_if_join:                                      # x86gen:128
	movl -72(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L109_block_done                       # x86gen:214
L14_if_then:                                      # x86gen:128
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -36(%ebp)                      # x86gen:477 x86frame:333
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
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
	movl $L13_string, %ebx                    # x86gen:469 x86frame:328
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
	jle L17_unEx_t                            # x86gen:198
L112_fallthrough:                                 # x86gen:201
	jmp L18_unEx_f                            # x86gen:206
L18_unEx_f:                                       # x86gen:128
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:477 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
L17_unEx_t:                                       # x86gen:128
	movl -76(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
	jmp L16_if_join                           # x86gen:214
L109_block_done:                                  # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L3_isdigit, .-L3_isdigit
	.endfunc
# END L3_isdigit


	.data
L13_string:
	.long 1
	.asciz "9"
	.data
L12_string:
	.long 1
	.asciz "0"

	.text
# PROCEDURE L2_skipto
	.globl	L2_skipto
	.func	L2_skipto
	.type	L2_skipto, @function
L2_skipto:
	# FRAME L2_skipto(1 formals, 16 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $64, %esp
	# SP, FP, calleesaves, argregs have values
L10_while_test:                                   # x86gen:128
	movl $L4_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:469 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
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
	je L7_if_else                             # x86gen:174
L114_fallthrough:                                 # x86gen:177
	jmp L6_if_then                            # x86gen:182
L6_if_then:                                       # x86gen:128
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:123 x86frame:595
L8_if_join:                                       # x86gen:128
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L9_done_label                          # x86gen:174
L115_fallthrough:                                 # x86gen:177
	jmp L11_while_body                        # x86gen:182
L11_while_body:                                   # x86gen:128
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
	jmp L10_while_test                        # x86gen:214
L7_if_else:                                       # x86gen:128
	movl $L5_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:469 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
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
	jmp L8_if_join                            # x86gen:214
L9_done_label:                                    # x86gen:128
	jmp L113_block_done                       # x86gen:214
L113_block_done:                                  # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_skipto, .-L2_skipto
	.endfunc
# END L2_skipto


	.data
L5_string:
	.long 1
	.asciz "\12"
	.data
L4_string:
	.long 1
	.asciz " "
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
