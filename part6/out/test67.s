
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
L4_blocks:                                        # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:123 x86frame:616
	movl %ebx, -20(%ebp)                      # x86gen:123 x86frame:620
	movl -12(%ebp), %ebx                      # x86gen:143 x86frame:323
	movl $1, %ebx                             # x86gen:143 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:143 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:148 x86frame:304
	movl -12(%ebp), %ecx                      # x86gen:148 x86frame:309
	cmpl %ebx, %ecx                           # x86gen:148 x86frame:314
	jl L1_unEx_t                              # x86gen:153
L5_fallthrough:                                   # x86gen:156
	jmp L2_unEx_f                             # x86gen:161
L2_unEx_f:                                        # x86gen:128
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -20(%ebp)                      # x86gen:123 x86frame:620
L1_unEx_t:                                        # x86gen:128
	movl -20(%ebp), %eax                      # x86gen:123 x86frame:609
	jmp L3_block_done                         # x86gen:191
L3_block_done:                                    # x86gen:128
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
