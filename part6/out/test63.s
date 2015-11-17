
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 1 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	# SP, FP, calleesaves, argregs have values
L11_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:448 x86frame:323
	movl $L9_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:448 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L1_isdigit                           # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L10_block_done                        # x86gen:191
L10_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L9_string:
	.long 1
	.asciz "1"

	.text
# PROCEDURE L1_isdigit
	.globl	L1_isdigit
	.func	L1_isdigit
	.type	L1_isdigit, @function
L1_isdigit:
	# FRAME L1_isdigit(2 formals, 15 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $60, %esp
	# SP, FP, calleesaves, argregs have values
L13_blocks:                                       # x86gen:128
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -8(%ebp)                       # x86gen:70 x86frame:602
	movl -8(%ebp), %ebx                       # x86gen:123 x86frame:616
	movl %ebx, -16(%ebp)                      # x86gen:123 x86frame:620
	movl -12(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L2_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:448 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -20(%ebp)                      # x86gen:70 x86frame:602
	movl -16(%ebp), %ebx                      # x86gen:174 x86frame:304
	movl -20(%ebp), %ecx                      # x86gen:174 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:174 x86frame:314
	jge L4_if_then                            # x86gen:179
L14_fallthrough:                                  # x86gen:171
	jmp L5_if_else                            # x86gen:184
L5_if_else:                                       # x86gen:128
	movl -24(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:456 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:620
L6_if_join:                                       # x86gen:128
	movl -56(%ebp), %eax                      # x86gen:123 x86frame:609
	jmp L12_block_done                        # x86gen:191
L4_if_then:                                       # x86gen:128
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -60(%ebp)                      # x86gen:123 x86frame:620
	movl -32(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:348
	movl %ebx, -32(%ebp)                      # x86gen:239 x86frame:353
	movl -32(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -36(%ebp)                      # x86gen:70 x86frame:602
	movl -36(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -44(%ebp)                      # x86gen:123 x86frame:620
	movl -40(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L3_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -40(%ebp)                      # x86gen:448 x86frame:333
	movl -40(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call ord                                  # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -48(%ebp)                      # x86gen:70 x86frame:602
	movl -44(%ebp), %ebx                      # x86gen:174 x86frame:304
	movl -48(%ebp), %ecx                      # x86gen:174 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:174 x86frame:314
	jle L7_unEx_t                             # x86gen:179
L15_fallthrough:                                  # x86gen:171
	jmp L8_unEx_f                             # x86gen:184
L8_unEx_f:                                        # x86gen:128
	movl -52(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -52(%ebp)                      # x86gen:456 x86frame:333
	movl -52(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -60(%ebp)                      # x86gen:123 x86frame:620
L7_unEx_t:                                        # x86gen:128
	movl -60(%ebp), %ebx                      # x86gen:123 x86frame:616
	movl %ebx, -56(%ebp)                      # x86gen:123 x86frame:620
	jmp L6_if_join                            # x86gen:191
L12_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_isdigit, .-L1_isdigit
	.endfunc
# END L1_isdigit


	.data
L3_string:
	.long 1
	.asciz "9"
	.data
L2_string:
	.long 1
	.asciz "0"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
