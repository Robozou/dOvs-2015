
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 16 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $64, %esp
	# SP, FP, calleesaves, argregs have values
L55_blocks:                                       # x86gen:128
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
	call L27_readlist                         # x86gen:68
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
	call L27_readlist                         # x86gen:80
	movl -56(%ebp), %ebx                      # x86gen:81 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:81 x86frame:595
	addl $4, %esp                             # x86gen:55
	movl %eax, -60(%ebp)                      # x86gen:83 x86frame:577
	movl -64(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:348
	movl %ebx, -64(%ebp)                      # x86gen:262 x86frame:353
	movl -64(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L25_printlist                        # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L54_block_done                        # x86gen:214
L54_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L27_readlist
	.globl	L27_readlist
	.func	L27_readlist
	.type	L27_readlist, @function
L27_readlist:
	# FRAME L27_readlist(1 formals, 29 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $116, %esp
	# SP, FP, calleesaves, argregs have values
L57_blocks:                                       # x86gen:128
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
	call L1_readint                           # x86gen:68
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
	je L49_field_nil                          # x86gen:174
L58_fallthrough:                                  # x86gen:177
	jmp L50_field_nonNil                      # x86gen:182
L50_field_nonNil:                                 # x86gen:128
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
	je L52_if_else                            # x86gen:174
L59_fallthrough:                                  # x86gen:177
	jmp L51_if_then                           # x86gen:182
L51_if_then:                                      # x86gen:128
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
	call L27_readlist                         # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -104(%ebp)                     # x86gen:70 x86frame:577
	movl -100(%ebp), %ebx                     # x86gen:120 x86frame:304
	movl -104(%ebp), %ecx                     # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -108(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
L53_if_join:                                      # x86gen:128
	movl -112(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L56_block_done                        # x86gen:214
L49_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L50_field_nonNil                      # x86gen:214
L52_if_else:                                      # x86gen:128
	movl -116(%ebp), %ebx                     # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -116(%ebp)                     # x86gen:477 x86frame:333
	movl -116(%ebp), %ebx                     # x86gen:123 x86frame:591
	movl %ebx, -112(%ebp)                     # x86gen:123 x86frame:595
	jmp L53_if_join                           # x86gen:214
L56_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L27_readlist, .-L27_readlist
	.endfunc
# END L27_readlist



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
L61_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jl L46_if_then                            # x86gen:174
L62_fallthrough:                                  # x86gen:177
	jmp L47_if_else                           # x86gen:182
L47_if_else:                                      # x86gen:128
	movl -8(%ebp), %ebx                       # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:262 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jg L43_if_then                            # x86gen:174
L63_fallthrough:                                  # x86gen:177
	jmp L44_if_else                           # x86gen:182
L44_if_else:                                      # x86gen:128
	movl -12(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L42_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:469 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
L45_if_join:                                      # x86gen:128
L48_if_join:                                      # x86gen:128
	jmp L60_block_done                        # x86gen:214
L46_if_then:                                      # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L41_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:469 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl -24(%ebp), %ebx                      # x86gen:329 x86frame:323
	movl $0, %ebx                             # x86gen:329 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:329 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:262 x86frame:353
	movl -20(%ebp), %ecx                      # x86gen:334 x86frame:529
	movl -24(%ebp), %ebx                      # x86gen:334 x86frame:534
	subl %ecx, %ebx                           # x86gen:334 x86frame:539
	movl %ebx, -24(%ebp)                      # x86gen:334 x86frame:544
	movl -24(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L37_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L48_if_join                           # x86gen:214
L43_if_then:                                      # x86gen:128
	movl -28(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -28(%ebp)                      # x86gen:262 x86frame:353
	movl -28(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L37_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L45_if_join                           # x86gen:214
L60_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L26_printint, .-L26_printint
	.endfunc
# END L26_printint


	.data
L42_string:
	.long 1
	.asciz "0"
	.data
L41_string:
	.long 1
	.asciz "-"

	.text
# PROCEDURE L37_f
	.globl	L37_f
	.func	L37_f
	.type	L37_f, @function
L37_f:
	# FRAME L37_f(2 formals, 19 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $76, %esp
	# SP, FP, calleesaves, argregs have values
L65_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	jg L39_if_then                            # x86gen:174
L66_fallthrough:                                  # x86gen:177
	jmp L40_if_end                            # x86gen:182
L40_if_end:                                       # x86gen:128
	jmp L64_block_done                        # x86gen:214
L39_if_then:                                      # x86gen:128
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:477 x86frame:323
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
	movl -20(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -20(%ebp)                      # x86gen:270 x86frame:353
	movl -20(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L37_f                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl %ebp, -76(%ebp)                      # x86gen:123 x86frame:577
	movl %ebp, -68(%ebp)                      # x86gen:123 x86frame:577
	movl -24(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -24(%ebp)                      # x86gen:262 x86frame:353
	movl -24(%ebp), %ebx                      # x86gen:349 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:349 x86frame:595
	movl -32(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:262 x86frame:353
	movl -28(%ebp), %ebx                      # x86gen:477 x86frame:323
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
	movl -40(%ebp), %ebx                      # x86gen:477 x86frame:323
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
	movl -52(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L38_string, %ebx                    # x86gen:469 x86frame:328
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
	jmp L40_if_end                            # x86gen:214
L64_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L37_f, .-L37_f
	.endfunc
# END L37_f


	.data
L38_string:
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
L68_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L34_if_then                            # x86gen:174
L69_fallthrough:                                  # x86gen:177
	jmp L35_if_else                           # x86gen:182
L35_if_else:                                      # x86gen:128
	movl -8(%ebp), %ebx                       # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:270 x86frame:353
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:591
	movl %ebx, -44(%ebp)                      # x86gen:123 x86frame:595
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L29_field_nil                          # x86gen:174
L70_fallthrough:                                  # x86gen:177
	jmp L30_field_nonNil                      # x86gen:182
L30_field_nonNil:                                 # x86gen:128
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
	movl -36(%ebp), %ebx                      # x86gen:285 x86frame:394
	movl (%ebx), %ecx                         # x86gen:285 x86frame:399
	movl %ecx, -40(%ebp)                      # x86gen:285 x86frame:404
	movl -40(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl -44(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call L26_printint                         # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl -48(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L31_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:469 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	movl -52(%ebp), %ebx                      # x86gen:270 x86frame:343
	movl 8(%ebp), %ebx                        # x86gen:270 x86frame:348
	movl %ebx, -52(%ebp)                      # x86gen:270 x86frame:353
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -88(%ebp)                      # x86gen:123 x86frame:595
	movl -56(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -56(%ebp)                      # x86gen:262 x86frame:353
	movl -56(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -60(%ebp)                      # x86gen:123 x86frame:595
	movl -60(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L32_field_nil                          # x86gen:174
L71_fallthrough:                                  # x86gen:177
	jmp L33_field_nonNil                      # x86gen:182
L33_field_nonNil:                                 # x86gen:128
	movl -60(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:307 x86frame:595
	movl -64(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:477 x86frame:333
	movl -64(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:357 x86frame:595
	movl -68(%ebp), %ebx                      # x86gen:477 x86frame:323
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
L36_if_join:                                      # x86gen:128
	jmp L67_block_done                        # x86gen:214
L34_if_then:                                      # x86gen:128
	movl -92(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L28_string, %ebx                    # x86gen:469 x86frame:328
	movl %ebx, -92(%ebp)                      # x86gen:469 x86frame:333
	movl -92(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L36_if_join                           # x86gen:214
L29_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L30_field_nonNil                      # x86gen:214
L32_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L33_field_nonNil                      # x86gen:214
L67_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L25_printlist, .-L25_printlist
	.endfunc
# END L25_printlist


	.data
L31_string:
	.long 1
	.asciz " "
	.data
L28_string:
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
L73_blocks:                                       # x86gen:128
	movl -8(%ebp), %ebx                       # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:91 x86frame:279
	movl %ebx, -4(%ebp)                       # x86gen:91 x86frame:284
	pushl %ebp                                # x86gen:251
	call L2_skipto                            # x86gen:222
	addl $4, %esp                             # x86gen:55
	movl -12(%ebp), %ebx                      # x86gen:262 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -12(%ebp)                      # x86gen:262 x86frame:353
	movl -12(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:595
	movl -16(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L19_field_nil                          # x86gen:174
L74_fallthrough:                                  # x86gen:177
	jmp L20_field_nonNil                      # x86gen:182
L20_field_nonNil:                                 # x86gen:128
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
	call L3_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:577
	movl -48(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -52(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
L23_while_test:                                   # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:270 x86frame:343
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
L75_fallthrough:                                  # x86gen:177
	jmp L24_while_body                        # x86gen:182
L24_while_body:                                   # x86gen:128
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
	jmp L23_while_test                        # x86gen:214
L19_field_nil:                                    # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L20_field_nonNil                      # x86gen:214
L21_done_label:                                   # x86gen:128
	movl -140(%ebp), %ebx                     # x86gen:262 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -140(%ebp)                     # x86gen:262 x86frame:353
	movl -140(%ebp), %eax                     # x86gen:123 x86frame:584
	jmp L72_block_done                        # x86gen:214
L72_block_done:                                   # x86gen:128
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
L77_blocks:                                       # x86gen:128
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
L78_fallthrough:                                  # x86gen:201
	jmp L15_if_else                           # x86gen:206
L15_if_else:                                      # x86gen:128
	movl -32(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:477 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
L16_if_join:                                      # x86gen:128
	movl -72(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L76_block_done                        # x86gen:214
L14_if_then:                                      # x86gen:128
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
L79_fallthrough:                                  # x86gen:201
	jmp L18_unEx_f                            # x86gen:206
L18_unEx_f:                                       # x86gen:128
	movl -68(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:477 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -76(%ebp)                      # x86gen:123 x86frame:595
L17_unEx_t:                                       # x86gen:128
	movl -76(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -72(%ebp)                      # x86gen:123 x86frame:595
	jmp L16_if_join                           # x86gen:214
L76_block_done:                                   # x86gen:128
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
	movl -4(%ebp), %ebx                       # x86gen:469 x86frame:323
	movl $L4_string, %ebx                     # x86gen:469 x86frame:328
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
	je L7_if_else                             # x86gen:174
L81_fallthrough:                                  # x86gen:177
	jmp L6_if_then                            # x86gen:182
L6_if_then:                                       # x86gen:128
	movl -24(%ebp), %ebx                      # x86gen:477 x86frame:323
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -64(%ebp)                      # x86gen:123 x86frame:595
L8_if_join:                                       # x86gen:128
	movl -64(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L9_done_label                          # x86gen:174
L82_fallthrough:                                  # x86gen:177
	jmp L11_while_body                        # x86gen:182
L11_while_body:                                   # x86gen:128
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
	jmp L10_while_test                        # x86gen:214
L7_if_else:                                       # x86gen:128
	movl -48(%ebp), %ebx                      # x86gen:469 x86frame:323
	movl $L5_string, %ebx                     # x86gen:469 x86frame:328
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
	jmp L8_if_join                            # x86gen:214
L9_done_label:                                    # x86gen:128
	jmp L80_block_done                        # x86gen:214
L80_block_done:                                   # x86gen:128
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
