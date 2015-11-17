
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 21 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $84, %esp
	# SP, FP, calleesaves, argregs have values
L6_blocks:                                        # x86gen:128
	movl %ebp, -8(%ebp)                       # x86gen:263 x86frame:602
	movl -8(%ebp), %ebx                       # x86gen:267 x86frame:377
	addl $-4, %ebx                            # x86gen:267 x86frame:382
	movl %ebx, -8(%ebp)                       # x86gen:267 x86frame:387
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:616
	movl %ebx, -20(%ebp)                      # x86gen:123 x86frame:620
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $10, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call initArray                            # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:602
	movl -20(%ebp), %ebx                      # x86gen:120 x86frame:304
	movl -24(%ebp), %ecx                      # x86gen:120 x86frame:309
	movl %ecx, (%ebx)                         # x86gen:120 x86frame:314
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -48(%ebp)                      # x86gen:123 x86frame:620
	movl -32(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:239 x86frame:353
	movl -32(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -36(%ebp)                      # x86gen:123 x86frame:620
	movl -36(%ebp), %ebx                      # x86gen:239 x86frame:394
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:399
	movl %ecx, -40(%ebp)                      # x86gen:239 x86frame:404
	movl -40(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -52(%ebp)                      # x86gen:123 x86frame:620
	movl -48(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L2_subs_nneg                          # x86gen:162
L7_fallthrough:                                   # x86gen:171
	jmp L1_subs_neg                           # x86gen:179
L1_subs_neg:                                      # x86gen:128
	movl -44(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -44(%ebp)                      # x86gen:456 x86frame:333
	movl -44(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L2_subs_nneg:                                     # x86gen:128
	movl -48(%ebp), %ebx                      # x86gen:174 x86frame:304
	movl -52(%ebp), %ecx                      # x86gen:174 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:174 x86frame:314
	jl L4_subs_novf                           # x86gen:179
L8_fallthrough:                                   # x86gen:171
	jmp L3_subs_ovf                           # x86gen:184
L3_subs_ovf:                                      # x86gen:128
	movl -56(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -56(%ebp)                      # x86gen:456 x86frame:333
	movl -56(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L4_subs_novf:                                     # x86gen:128
	movl -60(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -60(%ebp)                      # x86gen:239 x86frame:353
	movl -60(%ebp), %ebx                      # x86gen:304 x86frame:616
	movl %ebx, -76(%ebp)                      # x86gen:304 x86frame:620
	movl -64(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:456 x86frame:333
	movl -64(%ebp), %ebx                      # x86gen:355 x86frame:616
	movl %ebx, -72(%ebp)                      # x86gen:355 x86frame:620
	movl -68(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:456 x86frame:333
	movl -68(%ebp), %ecx                      # x86gen:360 x86frame:529
	movl -72(%ebp), %ebx                      # x86gen:360 x86frame:534
	imull %ecx, %ebx                          # x86gen:360 x86frame:539
	movl %ebx, -72(%ebp)                      # x86gen:360 x86frame:544
	movl -72(%ebp), %ecx                      # x86gen:309 x86frame:529
	movl -76(%ebp), %ebx                      # x86gen:309 x86frame:534
	addl %ecx, %ebx                           # x86gen:309 x86frame:539
	movl %ebx, -76(%ebp)                      # x86gen:309 x86frame:544
	movl -76(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -80(%ebp)                      # x86gen:123 x86frame:620
	movl -80(%ebp), %ebx                      # x86gen:259 x86frame:616
	movl %ebx, -84(%ebp)                      # x86gen:259 x86frame:620
	movl -84(%ebp), %eax                      # x86gen:123 x86frame:609
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:128
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
