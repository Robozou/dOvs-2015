
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
L6_blocks:                                        # x86gen:131
	movl %ebp, -8(%ebp)                       # x86gen:263 x86frame:558
	movl -8(%ebp), %ebx                       # x86gen:267 x86frame:367
	addl $-4, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -8(%ebp)                       # x86gen:127 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:581
	movl $2, %ebx                             # x86gen:456 x86frame:323
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:328
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -28(%ebp)                      # x86gen:70 x86frame:558
	movl $L1_string, %ebx                     # x86gen:448 x86frame:323
	movl %ebx, -16(%ebp)                      # x86gen:448 x86frame:328
	movl -28(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -16(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 0(%ebx)                        # x86gen:95 x86frame:311
	movl $1000, %ebx                          # x86gen:456 x86frame:323
	movl %ebx, -20(%ebp)                      # x86gen:456 x86frame:328
	movl -28(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -20(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 4(%ebx)                        # x86gen:95 x86frame:311
	movl -24(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -28(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -32(%ebp)                      # x86gen:239 x86frame:348
	movl -32(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L2_field_nil                           # x86gen:162
L7_fallthrough:                                   # x86gen:171
	jmp L3_field_nonNil                       # x86gen:179
L3_field_nonNil:                                  # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -36(%ebp)                      # x86gen:239 x86frame:348
	movl -36(%ebp), %ebx                      # x86gen:283 x86frame:510
	movl -52(%ebp), %ecx                      # x86gen:283 x86frame:515
	movl %ebx, %ecx                           # x86gen:283 x86frame:520
	movl $0, %ebx                             # x86gen:456 x86frame:323
	movl %ebx, -40(%ebp)                      # x86gen:456 x86frame:328
	movl -40(%ebp), %eax                      # x86gen:355 x86frame:560
	movl $4, %ebx                             # x86gen:456 x86frame:323
	movl %ebx, -44(%ebp)                      # x86gen:456 x86frame:328
	movl -44(%ebp), %ebx                      # x86gen:360 x86frame:264
	imull %ebx                                # x86gen:360 x86frame:269
	movl %eax, -48(%ebp)                      # x86gen:361 x86frame:558
	movl -48(%ebp), %ebx                      # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -52(%ebp)                      # x86gen:288 x86frame:384
	movl %ebx, -52(%ebp)                      # x86gen:127 x86frame:573
	movl -52(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -56(%ebp)                      # x86gen:127 x86frame:581
	movl $L4_string, %ebx                     # x86gen:448 x86frame:323
	movl %ebx, -60(%ebp)                      # x86gen:448 x86frame:328
	movl -56(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -60(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -64(%ebp)                      # x86gen:239 x86frame:348
	movl -64(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L5_block_done                         # x86gen:191
L2_field_nil:                                     # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
	jmp L3_field_nonNil                       # x86gen:191
L5_block_done:                                    # x86gen:131
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
