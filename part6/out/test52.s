
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 7 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $28, %esp
	# SP, FP, calleesaves, argregs have values
L2_blocks:                                        # x86gen:131
	movl %ebp, -8(%ebp)                       # x86gen:263 x86frame:558
	movl -8(%ebp), %ebx                       # x86gen:267 x86frame:367
	addl $-4, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -8(%ebp)                       # x86gen:127 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -20(%ebp)                      # x86gen:127 x86frame:581
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
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
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -28(%ebp)                      # x86gen:239 x86frame:348
	movl -28(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L1_block_done                         # x86gen:191
L1_block_done:                                    # x86gen:131
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
