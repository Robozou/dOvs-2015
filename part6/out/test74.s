
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 5 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
	# SP, FP, calleesaves, argregs have values
L2_blocks:                                        # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl -4(%ebp), %eax                       # x86gen:355 x86frame:560
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %eax                       # x86gen:355 x86frame:560
	movl -12(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:456 x86frame:333
	movl -12(%ebp), %eax                      # x86gen:338 x86frame:510
	movl -16(%ebp), %ebx                      # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -16(%ebp)                      # x86gen:361 x86frame:558
	movl -16(%ebp), %eax                      # x86gen:338 x86frame:510
	movl -20(%ebp), %ebx                      # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -20(%ebp)                      # x86gen:361 x86frame:558
	movl -20(%ebp), %eax                      # x86gen:127 x86frame:560
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
