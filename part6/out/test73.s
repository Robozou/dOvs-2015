
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 6 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
	# SP, FP, calleesaves, argregs have values
L9_blocks:                                        # x86gen:128
	movl $L6_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:469 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:477 x86frame:333
	movl -8(%ebp), %ebx                       # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:477 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L1_chk                               # x86gen:222
	addl $16, %esp                            # x86gen:55
	movl $L7_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:469 x86frame:333
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl $1, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -20(%ebp)                      # x86gen:477 x86frame:333
	movl -20(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	movl $0, %ebx                             # x86gen:477 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:477 x86frame:333
	movl -24(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call L1_chk                               # x86gen:222
	addl $16, %esp                            # x86gen:55
	jmp L8_block_done                         # x86gen:214
L8_block_done:                                    # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L7_string:
	.long 6
	.asciz "Not OK"
	.data
L6_string:
	.long 2
	.asciz "OK"

	.text
# PROCEDURE L1_chk
	.globl	L1_chk
	.func	L1_chk
	.type	L1_chk, @function
L1_chk:
	# FRAME L1_chk(4 formals, 4 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $16, %esp
	# SP, FP, calleesaves, argregs have values
L11_blocks:                                       # x86gen:128
	movl 12(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -4(%ebp)                       # x86gen:262 x86frame:353
	movl 16(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -8(%ebp)                       # x86gen:262 x86frame:353
	movl -4(%ebp), %ebx                       # x86gen:193 x86frame:304
	movl -8(%ebp), %ecx                       # x86gen:193 x86frame:309
	cmpl %ecx, %ebx                           # x86gen:193 x86frame:314
	je L3_if_then                             # x86gen:198
L12_fallthrough:                                  # x86gen:201
	jmp L4_if_else                            # x86gen:206
L4_if_else:                                       # x86gen:128
	movl $L2_string, %ebx                     # x86gen:469 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:469 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
L5_if_join:                                       # x86gen:128
	jmp L10_block_done                        # x86gen:214
L3_if_then:                                       # x86gen:128
	movl 20(%ebp), %ebx                       # x86gen:262 x86frame:348
	movl %ebx, -16(%ebp)                      # x86gen:262 x86frame:353
	movl -16(%ebp), %ebx                      # x86gen:251 x86frame:264
	pushl %ebx                                # x86gen:251 x86frame:269
	pushl %ebp                                # x86gen:251
	call print                                # x86gen:222
	addl $8, %esp                             # x86gen:55
	jmp L5_if_join                            # x86gen:214
L10_block_done:                                   # x86gen:128
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_chk, .-L1_chk
	.endfunc
# END L1_chk


	.data
L2_string:
	.long 1
	.asciz "."
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
