
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
L6_blocks:                                        # x86gen:128
	movl %ebp, -8(%ebp)                       # x86gen:289 x86frame:577
	movl -8(%ebp), %ebx                       # x86gen:294 x86frame:377
	addl $-4, %ebx                            # x86gen:294 x86frame:382
	movl %ebx, -8(%ebp)                       # x86gen:294 x86frame:387
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:591
	movl %ebx, -24(%ebp)                      # x86gen:123 x86frame:595
	movl $2, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:477 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:577
	movl $1000, %ebx                          # x86gen:477 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -16(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 0(%ebx)                        # x86gen:91 x86frame:314
	movl $L1_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:469 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -20(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 4(%ebx)                        # x86gen:91 x86frame:314
	movl -24(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -28(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:262 x86frame:353
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -36(%ebp)                      # x86gen:123 x86frame:595
	movl -36(%ebp), %ebx                      # x86gen:169 x86frame:264
	cmpl $0, %ebx                             # x86gen:169 x86frame:269
	je L2_field_nil                           # x86gen:174
L7_fallthrough:                                   # x86gen:177
	jmp L3_field_nonNil                       # x86gen:182
L3_field_nonNil:                                  # x86gen:128
	movl -36(%ebp), %ebx                      # x86gen:307 x86frame:591
	movl %ebx, -52(%ebp)                      # x86gen:307 x86frame:595
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:477 x86frame:333
	movl -40(%ebp), %ebx                      # x86gen:357 x86frame:591
	movl %ebx, -48(%ebp)                      # x86gen:357 x86frame:595
	movl $4, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -44(%ebp)                      # x86gen:477 x86frame:333
	movl -44(%ebp), %ecx                      # x86gen:362 x86frame:529
	movl -48(%ebp), %ebx                      # x86gen:362 x86frame:534
	imull %ecx, %ebx                          # x86gen:362 x86frame:539
	movl %ebx, -48(%ebp)                      # x86gen:362 x86frame:544
	movl -48(%ebp), %ecx                      # x86gen:312 x86frame:529
	movl -52(%ebp), %ebx                      # x86gen:312 x86frame:534
	addl %ecx, %ebx                           # x86gen:312 x86frame:539
	movl %ebx, -52(%ebp)                      # x86gen:312 x86frame:544
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:591
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:595
	movl $L4_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:469 x86frame:333
	movl -56(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -60(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -64(%ebp)                      # x86gen:262 x86frame:353
	movl -64(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L5_block_done                         # x86gen:214
L2_field_nil:                                     # x86gen:128
	call recFieldError                        # x86gen:222
	addl $0, %esp                             # x86gen:55
	jmp L3_field_nonNil                       # x86gen:214
L5_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L4_string:
	.long 8
	.asciz "Somebody"
	.data
L1_string:
	.long 6
	.asciz "Nobody"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
