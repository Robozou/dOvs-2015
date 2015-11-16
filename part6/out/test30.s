
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 22 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $88, %esp
	# SP, FP, calleesaves, argregs have values
L6_blocks:                                        # x86gen:131
	movl %ebp, -8(%ebp)                       # x86gen:263 x86frame:558
	movl -8(%ebp), %ebx                       # x86gen:267 x86frame:367
	addl $-4, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -8(%ebp)                       # x86gen:127 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -20(%ebp)                      # x86gen:127 x86frame:581
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
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:558
	movl -20(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -24(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:573
	movl -28(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -52(%ebp)                      # x86gen:127 x86frame:581
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -32(%ebp)                      # x86gen:239 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:127 x86frame:573
	movl -32(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -36(%ebp)                      # x86gen:127 x86frame:581
	movl -36(%ebp), %ebx                      # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -40(%ebp)                      # x86gen:239 x86frame:384
	movl %ebx, -40(%ebp)                      # x86gen:127 x86frame:573
	movl -40(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -48(%ebp)                      # x86gen:127 x86frame:581
	movl -52(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L2_subs_nneg                          # x86gen:162
L7_fallthrough:                                   # x86gen:171
	jmp L1_subs_neg                           # x86gen:179
L1_subs_neg:                                      # x86gen:131
	movl -44(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -44(%ebp)                      # x86gen:456 x86frame:333
	movl -44(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L2_subs_nneg:                                     # x86gen:131
	movl %ebx, -48(%ebp)                      # x86gen:293 x86frame:573
	movl -48(%ebp), %ebx                      # x86gen:293 x86frame:577
	movl %ebx, -56(%ebp)                      # x86gen:293 x86frame:581
	movl -56(%ebp), %ebx                      # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -52(%ebp), %ebx                      # x86gen:174 x86frame:301
	movl -56(%ebp), %ecx                      # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L4_subs_novf                           # x86gen:179
L8_fallthrough:                                   # x86gen:171
	jmp L3_subs_ovf                           # x86gen:184
L3_subs_ovf:                                      # x86gen:131
	movl -60(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:456 x86frame:333
	movl -60(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L4_subs_novf:                                     # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -64(%ebp)                      # x86gen:239 x86frame:348
	movl -64(%ebp), %eax                      # x86gen:283 x86frame:510
	movl -80(%ebp), %ebx                      # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -68(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -68(%ebp)                      # x86gen:456 x86frame:333
	movl -68(%ebp), %eax                      # x86gen:355 x86frame:560
	movl -72(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -72(%ebp)                      # x86gen:456 x86frame:333
	movl -72(%ebp), %eax                      # x86gen:338 x86frame:510
	movl -76(%ebp), %ebx                      # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -76(%ebp)                      # x86gen:361 x86frame:558
	movl -76(%ebp), %ebx                      # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -80(%ebp)                      # x86gen:288 x86frame:384
	movl %ebx, -80(%ebp)                      # x86gen:127 x86frame:573
	movl -80(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -84(%ebp)                      # x86gen:127 x86frame:581
	movl %ebx, -84(%ebp)                      # x86gen:259 x86frame:573
	movl -84(%ebp), %ebx                      # x86gen:259 x86frame:577
	movl %ebx, -88(%ebp)                      # x86gen:259 x86frame:581
	movl -88(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:131
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
