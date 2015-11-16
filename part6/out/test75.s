
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 3 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $12, %esp
	# SP, FP, calleesaves, argregs have values
L24_blocks:                                       # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -4(%ebp)                       # x86gen:456 x86frame:333
	movl -4(%ebp), %ebx                       # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -8(%ebp), %ebx                       # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -8(%ebp)                       # x86gen:456 x86frame:333
	movl %ebx, -8(%ebp)                       # x86gen:293 x86frame:573
	movl -8(%ebp), %ebx                       # x86gen:293 x86frame:577
	movl %ebx, -12(%ebp)                      # x86gen:293 x86frame:581
	movl -12(%ebp), %ebx                      # x86gen:398 x86frame:367
	subl $5, %ebx                             # x86gen:398 x86frame:372
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L1_mod                               # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, %eax                           # x86gen:70
	jmp L23_block_done                        # x86gen:191
L23_block_done:                                   # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain



	.text
# PROCEDURE L1_mod
	.globl	L1_mod
	.func	L1_mod
	.type	L1_mod, @function
L1_mod:
	# FRAME L1_mod(3 formals, 28 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $112, %esp
	# SP, FP, calleesaves, argregs have values
L26_blocks:                                       # x86gen:131
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:348
	movl -4(%ebp), %ebx                       # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jg L20_if_then                            # x86gen:162
L27_fallthrough:                                  # x86gen:171
	jmp L21_if_else                           # x86gen:179
L21_if_else:                                      # x86gen:131
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -8(%ebp)                       # x86gen:239 x86frame:348
	movl -8(%ebp), %ebx                       # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jl L17_if_then                            # x86gen:162
L28_fallthrough:                                  # x86gen:171
	jmp L18_if_else                           # x86gen:179
L18_if_else:                                      # x86gen:131
	movl -12(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L16_string, %ebx                    # x86gen:448 x86frame:328
	movl %ebx, -12(%ebp)                      # x86gen:448 x86frame:333
	movl -12(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call print                                # x86gen:199
	addl $8, %esp                             # x86gen:55
	movl -16(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -16(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -16(%ebp)                      # x86gen:293 x86frame:573
	movl -16(%ebp), %ebx                      # x86gen:293 x86frame:577
	movl %ebx, -20(%ebp)                      # x86gen:293 x86frame:581
	movl -20(%ebp), %ebx                      # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -20(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call chr                                  # x86gen:199
	addl $8, %esp                             # x86gen:55
	movl -24(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -24(%ebp)                      # x86gen:456 x86frame:333
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:573
	movl -24(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -84(%ebp)                      # x86gen:127 x86frame:581
L19_if_join:                                      # x86gen:131
	movl %ebx, -84(%ebp)                      # x86gen:127 x86frame:573
	movl -84(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -40(%ebp)                      # x86gen:127 x86frame:581
L22_if_join:                                      # x86gen:131
	movl -40(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L25_block_done                        # x86gen:191
L20_if_then:                                      # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -28(%ebp)                      # x86gen:239 x86frame:348
	movl -28(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L10_if_then                           # x86gen:162
L29_fallthrough:                                  # x86gen:171
	jmp L11_if_else                           # x86gen:179
L11_if_else:                                      # x86gen:131
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -32(%ebp)                      # x86gen:239 x86frame:348
	movl -32(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -36(%ebp)                      # x86gen:239 x86frame:348
	movl -36(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L2_mod_neg                           # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:558
L12_if_join:                                      # x86gen:131
	movl %ebx, -52(%ebp)                      # x86gen:127 x86frame:573
	movl -52(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -40(%ebp)                      # x86gen:127 x86frame:581
	jmp L22_if_join                           # x86gen:191
L10_if_then:                                      # x86gen:131
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -44(%ebp)                      # x86gen:239 x86frame:348
	movl -44(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -48(%ebp)                      # x86gen:239 x86frame:348
	movl -48(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L3_mod_pos                           # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -52(%ebp)                      # x86gen:70 x86frame:558
	jmp L12_if_join                           # x86gen:191
L17_if_then:                                      # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -56(%ebp)                      # x86gen:239 x86frame:348
	movl -56(%ebp), %ebx                      # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L13_if_then                           # x86gen:162
L30_fallthrough:                                  # x86gen:171
	jmp L14_if_else                           # x86gen:179
L14_if_else:                                      # x86gen:131
	movl -64(%ebp), %ebx                      # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:305 x86frame:333
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -60(%ebp)                      # x86gen:239 x86frame:348
	movl -60(%ebp), %eax                      # x86gen:310 x86frame:510
	movl -64(%ebp), %ebx                      # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl -64(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -72(%ebp), %ebx                      # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -72(%ebp)                      # x86gen:305 x86frame:333
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -68(%ebp)                      # x86gen:239 x86frame:348
	movl -68(%ebp), %eax                      # x86gen:310 x86frame:510
	movl -72(%ebp), %ebx                      # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl -72(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L3_mod_pos                           # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -76(%ebp)                      # x86gen:70 x86frame:558
	movl -80(%ebp), %ebx                      # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -80(%ebp)                      # x86gen:305 x86frame:333
	movl -76(%ebp), %eax                      # x86gen:310 x86frame:510
	movl -80(%ebp), %ebx                      # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl %ebx, -80(%ebp)                      # x86gen:127 x86frame:573
	movl -80(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -108(%ebp)                     # x86gen:127 x86frame:581
L15_if_join:                                      # x86gen:131
	movl %ebx, -108(%ebp)                     # x86gen:127 x86frame:573
	movl -108(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -84(%ebp)                      # x86gen:127 x86frame:581
	jmp L19_if_join                           # x86gen:191
L13_if_then:                                      # x86gen:131
	movl -92(%ebp), %ebx                      # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -92(%ebp)                      # x86gen:305 x86frame:333
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -88(%ebp)                      # x86gen:239 x86frame:348
	movl -88(%ebp), %eax                      # x86gen:310 x86frame:510
	movl -92(%ebp), %ebx                      # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl -92(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -100(%ebp), %ebx                     # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -100(%ebp)                     # x86gen:305 x86frame:333
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -96(%ebp)                      # x86gen:239 x86frame:348
	movl -96(%ebp), %eax                      # x86gen:310 x86frame:510
	movl -100(%ebp), %ebx                     # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl -100(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	pushl %ebp                                # x86gen:228
	call L2_mod_neg                           # x86gen:68
	addl $12, %esp                            # x86gen:55
	movl %eax, -104(%ebp)                     # x86gen:70 x86frame:558
	movl -112(%ebp), %ebx                     # x86gen:305 x86frame:323
	movl $0, %ebx                             # x86gen:305 x86frame:328
	movl %ebx, -112(%ebp)                     # x86gen:305 x86frame:333
	movl -104(%ebp), %eax                     # x86gen:310 x86frame:510
	movl -112(%ebp), %ebx                     # x86gen:310 x86frame:515
	subl %eax, %ebx                           # x86gen:310 x86frame:520
	movl %ebx, -112(%ebp)                     # x86gen:127 x86frame:573
	movl -112(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -108(%ebp)                     # x86gen:127 x86frame:581
	jmp L15_if_join                           # x86gen:191
L25_block_done:                                   # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L1_mod, .-L1_mod
	.endfunc
# END L1_mod


	.data
L16_string:
	.long 17
	.asciz "Error: mod (_,0) "

	.text
# PROCEDURE L3_mod_pos
	.globl	L3_mod_pos
	.func	L3_mod_pos
	.type	L3_mod_pos, @function
L3_mod_pos:
	# FRAME L3_mod_pos(3 formals, 5 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
	# SP, FP, calleesaves, argregs have values
L8_while_test:                                    # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:348
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -8(%ebp)                       # x86gen:239 x86frame:348
	movl -4(%ebp), %ebx                       # x86gen:174 x86frame:301
	movl -8(%ebp), %ecx                       # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jge L9_while_body                         # x86gen:179
L32_fallthrough:                                  # x86gen:171
	jmp L7_done_label                         # x86gen:184
L7_done_label:                                    # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -12(%ebp)                      # x86gen:239 x86frame:348
	movl -12(%ebp), %eax                      # x86gen:127 x86frame:560
	jmp L31_block_done                        # x86gen:191
L9_while_body:                                    # x86gen:131
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -16(%ebp)                      # x86gen:239 x86frame:348
	movl -16(%ebp), %eax                      # x86gen:329 x86frame:510
	movl -20(%ebp), %ebx                      # x86gen:329 x86frame:515
	subl %ebx, %eax                           # x86gen:329 x86frame:520
	movl -20(%ebp), %ebx                      # x86gen:95 x86frame:278
	movl %ebx, 12(%ebp)                       # x86gen:95 x86frame:283
	jmp L8_while_test                         # x86gen:191
L31_block_done:                                   # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L3_mod_pos, .-L3_mod_pos
	.endfunc
# END L3_mod_pos



	.text
# PROCEDURE L2_mod_neg
	.globl	L2_mod_neg
	.func	L2_mod_neg
	.type	L2_mod_neg, @function
L2_mod_neg:
	# FRAME L2_mod_neg(3 formals, 5 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $20, %esp
	# SP, FP, calleesaves, argregs have values
L5_while_test:                                    # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -4(%ebp)                       # x86gen:239 x86frame:348
	movl -4(%ebp), %ebx                       # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jl L6_while_body                          # x86gen:162
L34_fallthrough:                                  # x86gen:171
	jmp L4_done_label                         # x86gen:179
L4_done_label:                                    # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -8(%ebp)                       # x86gen:239 x86frame:348
	movl -8(%ebp), %eax                       # x86gen:127 x86frame:560
	jmp L33_block_done                        # x86gen:191
L6_while_body:                                    # x86gen:131
	movl 12(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -12(%ebp)                      # x86gen:239 x86frame:348
	movl -12(%ebp), %eax                      # x86gen:283 x86frame:510
	movl -20(%ebp), %ebx                      # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl 16(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -16(%ebp)                      # x86gen:239 x86frame:348
	movl -16(%ebp), %ebx                      # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -20(%ebp)                      # x86gen:288 x86frame:384
	movl -20(%ebp), %ebx                      # x86gen:95 x86frame:278
	movl %ebx, 12(%ebp)                       # x86gen:95 x86frame:283
	jmp L5_while_test                         # x86gen:191
L33_block_done:                                   # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	L2_mod_neg, .-L2_mod_neg
	.endfunc
# END L2_mod_neg


	.data
L0_string:
	.long 13
	.asciz "DefaultString"
