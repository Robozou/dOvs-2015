
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 8 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $32, %esp
	# SP, FP, calleesaves, argregs have values
L2_blocks:                                        # x86gen:128
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
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -16(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 0(%ebx)                        # x86gen:91 x86frame:314
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:91 x86frame:304
	movl -20(%ebp), %ecx                      # x86gen:91 x86frame:309
	movl %ecx, 4(%ebx)                        # x86gen:91 x86frame:314
	movl -24(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -28(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -4(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:262 x86frame:353
	movl -32(%ebp), %eax                      # x86gen:123 x86frame:584
	jmp L1_block_done                         # x86gen:214
L1_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
