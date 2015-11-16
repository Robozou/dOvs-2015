
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
L6_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl %ebx, -4(%ebp)                       # x86gen:127 x86frame:573
	movl -4(%ebp), %ebx                       # x86gen:127 x86frame:577
	movl %ebx, -32(%ebp)                      # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L1_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:448 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -12(%ebp)                      # x86gen:70 x86frame:558
	movl %ebx, -12(%ebp)                      # x86gen:127 x86frame:573
	movl -12(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -20(%ebp)                      # x86gen:127 x86frame:581
	movl -16(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L2_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:448 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -24(%ebp)                      # x86gen:70 x86frame:558
	movl -20(%ebp), %ebx                      # x86gen:174 x86frame:301
	movl -24(%ebp), %ecx                      # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jge L3_unEx_t                             # x86gen:179
L7_fallthrough:                                   # x86gen:171
	jmp L4_unEx_f                             # x86gen:184
L4_unEx_f:                                        # x86gen:131
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -28(%ebp)                      # x86gen:127 x86frame:573
	movl -28(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -32(%ebp)                      # x86gen:127 x86frame:581
L3_unEx_t:                                        # x86gen:131
	movl -32(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L5_block_done                         # x86gen:191
L5_block_done:                                    # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L2_string:
	.long 1
	.asciz "0"
	.data
L1_string:
	.long 1
	.asciz "1"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
