
	.text
# PROCEDURE tigermain
	.globl	tigermain
	.func	tigermain
	.type	tigermain, @function
tigermain:
	# FRAME tigermain(1 formals, 162 locals)
	pushl %ebp
	movl %esp, %ebp
	subl $648, %esp
	# SP, FP, calleesaves, argregs have values
L49_blocks:                                       # x86gen:131
	movl %ebp, -24(%ebp)                      # x86gen:263 x86frame:558
	movl -24(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $-4, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -24(%ebp)                      # x86gen:127 x86frame:573
	movl -24(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -36(%ebp)                      # x86gen:127 x86frame:581
	movl -28(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -28(%ebp)                      # x86gen:456 x86frame:333
	movl -28(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -32(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $10, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -32(%ebp)                      # x86gen:456 x86frame:333
	movl -32(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call initArray                            # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -40(%ebp)                      # x86gen:70 x86frame:558
	movl -36(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -40(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl %ebp, -44(%ebp)                      # x86gen:263 x86frame:558
	movl -44(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $-8, %ebx                            # x86gen:267 x86frame:372
	movl %ebx, -44(%ebp)                      # x86gen:127 x86frame:573
	movl -44(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -76(%ebp)                      # x86gen:127 x86frame:581
	movl -48(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -48(%ebp)                      # x86gen:456 x86frame:333
	movl -48(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -68(%ebp)                      # x86gen:70 x86frame:558
	movl -52(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L1_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -52(%ebp)                      # x86gen:448 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -52(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 0(%ebx)                        # x86gen:95 x86frame:311
	movl -56(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L2_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -56(%ebp)                      # x86gen:448 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -56(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 4(%ebx)                        # x86gen:95 x86frame:311
	movl -60(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -60(%ebp)                      # x86gen:456 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -60(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 8(%ebx)                        # x86gen:95 x86frame:311
	movl -64(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -64(%ebp)                      # x86gen:456 x86frame:333
	movl -68(%ebp), %ebx                      # x86gen:95 x86frame:301
	movl -64(%ebp), %ecx                      # x86gen:95 x86frame:306
	movl %ecx, 12(%ebx)                       # x86gen:95 x86frame:311
	movl -68(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -72(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $5, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -72(%ebp)                      # x86gen:456 x86frame:333
	movl -72(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call initArray                            # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -80(%ebp)                      # x86gen:70 x86frame:558
	movl -76(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -80(%ebp), %ecx                      # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl %ebp, -84(%ebp)                      # x86gen:263 x86frame:558
	movl -84(%ebp), %ebx                      # x86gen:267 x86frame:367
	addl $-12, %ebx                           # x86gen:267 x86frame:372
	movl %ebx, -84(%ebp)                      # x86gen:127 x86frame:573
	movl -84(%ebp), %ebx                      # x86gen:127 x86frame:577
	movl %ebx, -96(%ebp)                      # x86gen:127 x86frame:581
	movl -88(%ebp), %ebx                      # x86gen:448 x86frame:323
	movl $L3_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -88(%ebp)                      # x86gen:448 x86frame:333
	movl -88(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -92(%ebp), %ebx                      # x86gen:456 x86frame:323
	movl $100, %ebx                           # x86gen:456 x86frame:328
	movl %ebx, -92(%ebp)                      # x86gen:456 x86frame:333
	movl -92(%ebp), %ebx                      # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call initArray                            # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -100(%ebp)                     # x86gen:70 x86frame:558
	movl -96(%ebp), %ebx                      # x86gen:124 x86frame:301
	movl -100(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl %ebp, -104(%ebp)                     # x86gen:263 x86frame:558
	movl -104(%ebp), %ebx                     # x86gen:267 x86frame:367
	addl $-16, %ebx                           # x86gen:267 x86frame:372
	movl %ebx, -104(%ebp)                     # x86gen:127 x86frame:573
	movl -104(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -128(%ebp)                     # x86gen:127 x86frame:581
	movl -108(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -108(%ebp)                     # x86gen:456 x86frame:333
	movl -108(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -132(%ebp)                     # x86gen:70 x86frame:558
	movl -112(%ebp), %ebx                     # x86gen:448 x86frame:323
	movl $L4_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -112(%ebp)                     # x86gen:448 x86frame:333
	movl -132(%ebp), %ebx                     # x86gen:95 x86frame:301
	movl -112(%ebp), %ecx                     # x86gen:95 x86frame:306
	movl %ecx, 0(%ebx)                        # x86gen:95 x86frame:311
	movl -116(%ebp), %ebx                     # x86gen:448 x86frame:323
	movl $L5_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -116(%ebp)                     # x86gen:448 x86frame:333
	movl -132(%ebp), %ebx                     # x86gen:95 x86frame:301
	movl -116(%ebp), %ecx                     # x86gen:95 x86frame:306
	movl %ecx, 4(%ebx)                        # x86gen:95 x86frame:311
	movl -120(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $2432, %ebx                          # x86gen:456 x86frame:328
	movl %ebx, -120(%ebp)                     # x86gen:456 x86frame:333
	movl -132(%ebp), %ebx                     # x86gen:95 x86frame:301
	movl -120(%ebp), %ecx                     # x86gen:95 x86frame:306
	movl %ecx, 8(%ebx)                        # x86gen:95 x86frame:311
	movl -124(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $44, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -124(%ebp)                     # x86gen:456 x86frame:333
	movl -132(%ebp), %ebx                     # x86gen:95 x86frame:301
	movl -124(%ebp), %ecx                     # x86gen:95 x86frame:306
	movl %ecx, 12(%ebx)                       # x86gen:95 x86frame:311
	movl -128(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -132(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl %ebp, -136(%ebp)                     # x86gen:263 x86frame:558
	movl -136(%ebp), %ebx                     # x86gen:267 x86frame:367
	addl $-20, %ebx                           # x86gen:267 x86frame:372
	movl %ebx, -136(%ebp)                     # x86gen:127 x86frame:573
	movl -136(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -168(%ebp)                     # x86gen:127 x86frame:581
	movl -140(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -140(%ebp)                     # x86gen:456 x86frame:333
	movl -140(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call allocRecord                          # x86gen:68
	addl $4, %esp                             # x86gen:55
	movl %eax, -172(%ebp)                     # x86gen:70 x86frame:558
	movl -144(%ebp), %ebx                     # x86gen:448 x86frame:323
	movl $L6_string, %ebx                     # x86gen:448 x86frame:328
	movl %ebx, -144(%ebp)                     # x86gen:448 x86frame:333
	movl -172(%ebp), %ebx                     # x86gen:95 x86frame:301
	movl -144(%ebp), %ecx                     # x86gen:95 x86frame:306
	movl %ecx, 0(%ebx)                        # x86gen:95 x86frame:311
	movl %ebx, -172(%ebp)                     # x86gen:263 x86frame:573
	movl -172(%ebp), %ebx                     # x86gen:263 x86frame:577
	movl %ebx, -148(%ebp)                     # x86gen:263 x86frame:581
	movl -148(%ebp), %ebx                     # x86gen:267 x86frame:367
	addl $4, %ebx                             # x86gen:267 x86frame:372
	movl %ebx, -148(%ebp)                     # x86gen:127 x86frame:573
	movl -148(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -160(%ebp)                     # x86gen:127 x86frame:581
	movl -152(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1900, %ebx                          # x86gen:456 x86frame:328
	movl %ebx, -152(%ebp)                     # x86gen:456 x86frame:333
	movl -152(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	movl -156(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -156(%ebp)                     # x86gen:456 x86frame:333
	movl -156(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call initArray                            # x86gen:68
	addl $8, %esp                             # x86gen:55
	movl %eax, -164(%ebp)                     # x86gen:70 x86frame:558
	movl -160(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -164(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -168(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -172(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -176(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -176(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -176(%ebp)                     # x86gen:127 x86frame:573
	movl -176(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -200(%ebp)                     # x86gen:127 x86frame:581
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -180(%ebp)                     # x86gen:239 x86frame:348
	movl %ebx, -180(%ebp)                     # x86gen:127 x86frame:573
	movl -180(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -184(%ebp)                     # x86gen:127 x86frame:581
	movl -184(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -188(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -188(%ebp)                     # x86gen:127 x86frame:573
	movl -188(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -196(%ebp)                     # x86gen:127 x86frame:581
	movl -200(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L8_subs_nneg                          # x86gen:162
L53_fallthrough:                                  # x86gen:171
	jmp L7_subs_neg                           # x86gen:179
L7_subs_neg:                                      # x86gen:131
	movl -192(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -192(%ebp)                     # x86gen:456 x86frame:333
	movl -192(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L8_subs_nneg:                                     # x86gen:131
	movl %ebx, -196(%ebp)                     # x86gen:293 x86frame:573
	movl -196(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -204(%ebp)                     # x86gen:293 x86frame:581
	movl -204(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -200(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -204(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L10_subs_novf                          # x86gen:179
L54_fallthrough:                                  # x86gen:171
	jmp L9_subs_ovf                           # x86gen:184
L9_subs_ovf:                                      # x86gen:131
	movl -208(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -208(%ebp)                     # x86gen:456 x86frame:333
	movl -208(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L10_subs_novf:                                    # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -212(%ebp)                     # x86gen:239 x86frame:348
	movl -212(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -228(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -216(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -216(%ebp)                     # x86gen:456 x86frame:333
	movl -216(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -220(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -220(%ebp)                     # x86gen:456 x86frame:333
	movl -220(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -224(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -224(%ebp)                     # x86gen:361 x86frame:558
	movl -224(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -228(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -228(%ebp)                     # x86gen:127 x86frame:573
	movl -228(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -232(%ebp)                     # x86gen:127 x86frame:581
	movl -236(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -236(%ebp)                     # x86gen:456 x86frame:333
	movl -232(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -236(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -240(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $9, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -240(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -240(%ebp)                     # x86gen:127 x86frame:573
	movl -240(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -264(%ebp)                     # x86gen:127 x86frame:581
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -244(%ebp)                     # x86gen:239 x86frame:348
	movl %ebx, -244(%ebp)                     # x86gen:127 x86frame:573
	movl -244(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -248(%ebp)                     # x86gen:127 x86frame:581
	movl -248(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -252(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -252(%ebp)                     # x86gen:127 x86frame:573
	movl -252(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -260(%ebp)                     # x86gen:127 x86frame:581
	movl -264(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L12_subs_nneg                         # x86gen:162
L55_fallthrough:                                  # x86gen:171
	jmp L11_subs_neg                          # x86gen:179
L11_subs_neg:                                     # x86gen:131
	movl -256(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $9, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -256(%ebp)                     # x86gen:456 x86frame:333
	movl -256(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L12_subs_nneg:                                    # x86gen:131
	movl %ebx, -260(%ebp)                     # x86gen:293 x86frame:573
	movl -260(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -268(%ebp)                     # x86gen:293 x86frame:581
	movl -268(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -264(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -268(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L14_subs_novf                          # x86gen:179
L56_fallthrough:                                  # x86gen:171
	jmp L13_subs_ovf                          # x86gen:184
L13_subs_ovf:                                     # x86gen:131
	movl -272(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $9, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -272(%ebp)                     # x86gen:456 x86frame:333
	movl -272(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L14_subs_novf:                                    # x86gen:131
	movl -4(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -276(%ebp)                     # x86gen:239 x86frame:348
	movl -276(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -292(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -280(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $9, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -280(%ebp)                     # x86gen:456 x86frame:333
	movl -280(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -284(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -284(%ebp)                     # x86gen:456 x86frame:333
	movl -284(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -288(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -288(%ebp)                     # x86gen:361 x86frame:558
	movl -288(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -292(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -292(%ebp)                     # x86gen:127 x86frame:573
	movl -292(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -296(%ebp)                     # x86gen:127 x86frame:581
	movl -300(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -300(%ebp)                     # x86gen:456 x86frame:333
	movl -296(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -300(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -304(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -304(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -304(%ebp)                     # x86gen:127 x86frame:573
	movl -304(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -376(%ebp)                     # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -308(%ebp)                     # x86gen:239 x86frame:348
	movl %ebx, -308(%ebp)                     # x86gen:127 x86frame:573
	movl -308(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -364(%ebp)                     # x86gen:127 x86frame:581
	movl -364(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -312(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -312(%ebp)                     # x86gen:127 x86frame:573
	movl -312(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -368(%ebp)                     # x86gen:127 x86frame:581
	movl -376(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L16_subs_nneg                         # x86gen:162
L57_fallthrough:                                  # x86gen:171
	jmp L15_subs_neg                          # x86gen:179
L15_subs_neg:                                     # x86gen:131
	movl -316(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -316(%ebp)                     # x86gen:456 x86frame:333
	movl -316(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L16_subs_nneg:                                    # x86gen:131
	movl %ebx, -368(%ebp)                     # x86gen:293 x86frame:573
	movl -368(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -320(%ebp)                     # x86gen:293 x86frame:581
	movl -320(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -376(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -320(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L18_subs_novf                          # x86gen:179
L58_fallthrough:                                  # x86gen:171
	jmp L17_subs_ovf                          # x86gen:184
L17_subs_ovf:                                     # x86gen:131
	movl -324(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -324(%ebp)                     # x86gen:456 x86frame:333
	movl -324(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L18_subs_novf:                                    # x86gen:131
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -328(%ebp)                     # x86gen:239 x86frame:348
	movl -328(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -344(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -332(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -332(%ebp)                     # x86gen:456 x86frame:333
	movl -332(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -336(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -336(%ebp)                     # x86gen:456 x86frame:333
	movl -336(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -340(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -340(%ebp)                     # x86gen:361 x86frame:558
	movl -340(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -344(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -344(%ebp)                     # x86gen:127 x86frame:573
	movl -344(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -348(%ebp)                     # x86gen:127 x86frame:581
	movl %ebx, -348(%ebp)                     # x86gen:259 x86frame:573
	movl -348(%ebp), %ebx                     # x86gen:259 x86frame:577
	movl %ebx, -352(%ebp)                     # x86gen:259 x86frame:581
	movl -352(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L19_field_nil                          # x86gen:162
L59_fallthrough:                                  # x86gen:171
	jmp L20_field_nonNil                      # x86gen:179
L20_field_nonNil:                                 # x86gen:131
	movl -356(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $3, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -356(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -356(%ebp)                     # x86gen:127 x86frame:573
	movl -356(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -376(%ebp)                     # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -360(%ebp)                     # x86gen:239 x86frame:348
	movl %ebx, -360(%ebp)                     # x86gen:127 x86frame:573
	movl -360(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -364(%ebp)                     # x86gen:127 x86frame:581
	movl -364(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -372(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -372(%ebp)                     # x86gen:127 x86frame:573
	movl -372(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -368(%ebp)                     # x86gen:127 x86frame:581
	movl -376(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L16_subs_nneg                         # x86gen:162
L60_fallthrough:                                  # x86gen:171
	jmp L50_CJUMP_NONE                        # x86gen:179
L50_CJUMP_NONE:                                   # x86gen:131
	jmp L15_subs_neg                          # x86gen:191
L19_field_nil:                                    # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
	jmp L20_field_nonNil                      # x86gen:191
L22_subs_neg:                                     # x86gen:131
	movl -380(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -380(%ebp)                     # x86gen:456 x86frame:333
	movl -380(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L23_subs_nneg:                                    # x86gen:131
	movl %ebx, -432(%ebp)                     # x86gen:293 x86frame:573
	movl -432(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -384(%ebp)                     # x86gen:293 x86frame:581
	movl -384(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -440(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -384(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L25_subs_novf                          # x86gen:179
L61_fallthrough:                                  # x86gen:171
	jmp L24_subs_ovf                          # x86gen:184
L24_subs_ovf:                                     # x86gen:131
	movl -388(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -388(%ebp)                     # x86gen:456 x86frame:333
	movl -388(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L25_subs_novf:                                    # x86gen:131
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -392(%ebp)                     # x86gen:239 x86frame:348
	movl -392(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -408(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -396(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -396(%ebp)                     # x86gen:456 x86frame:333
	movl -396(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -400(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -400(%ebp)                     # x86gen:456 x86frame:333
	movl -400(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -404(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -404(%ebp)                     # x86gen:361 x86frame:558
	movl -404(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -408(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -408(%ebp)                     # x86gen:127 x86frame:573
	movl -408(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -412(%ebp)                     # x86gen:127 x86frame:581
	movl %ebx, -412(%ebp)                     # x86gen:259 x86frame:573
	movl -412(%ebp), %ebx                     # x86gen:259 x86frame:577
	movl %ebx, -416(%ebp)                     # x86gen:259 x86frame:581
	movl -416(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L26_field_nil                          # x86gen:162
L62_fallthrough:                                  # x86gen:171
	jmp L27_field_nonNil                      # x86gen:179
L27_field_nonNil:                                 # x86gen:131
	movl -420(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -420(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -420(%ebp)                     # x86gen:127 x86frame:573
	movl -420(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -440(%ebp)                     # x86gen:127 x86frame:581
	movl -8(%ebp), %ebx                       # x86gen:239 x86frame:343
	movl %ebx, -424(%ebp)                     # x86gen:239 x86frame:348
	movl %ebx, -424(%ebp)                     # x86gen:127 x86frame:573
	movl -424(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -428(%ebp)                     # x86gen:127 x86frame:581
	movl -428(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -436(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -436(%ebp)                     # x86gen:127 x86frame:573
	movl -436(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -432(%ebp)                     # x86gen:127 x86frame:581
	movl -440(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L23_subs_nneg                         # x86gen:162
L63_fallthrough:                                  # x86gen:171
	jmp L51_CJUMP_NONE                        # x86gen:179
L51_CJUMP_NONE:                                   # x86gen:131
	jmp L22_subs_neg                          # x86gen:191
L26_field_nil:                                    # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
	jmp L27_field_nonNil                      # x86gen:191
L28_subs_neg:                                     # x86gen:131
	movl -444(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $34, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -444(%ebp)                     # x86gen:456 x86frame:333
	movl -444(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L29_subs_nneg:                                    # x86gen:131
	movl %ebx, -448(%ebp)                     # x86gen:293 x86frame:573
	movl -448(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -456(%ebp)                     # x86gen:293 x86frame:581
	movl -456(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -452(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -456(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L31_subs_novf                          # x86gen:179
L64_fallthrough:                                  # x86gen:171
	jmp L30_subs_ovf                          # x86gen:184
L30_subs_ovf:                                     # x86gen:131
	movl -460(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $34, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -460(%ebp)                     # x86gen:456 x86frame:333
	movl -460(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L31_subs_novf:                                    # x86gen:131
	movl -12(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -464(%ebp)                     # x86gen:239 x86frame:348
	movl -464(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -480(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -468(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $34, %ebx                            # x86gen:456 x86frame:328
	movl %ebx, -468(%ebp)                     # x86gen:456 x86frame:333
	movl -468(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -472(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -472(%ebp)                     # x86gen:456 x86frame:333
	movl -472(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -476(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -476(%ebp)                     # x86gen:361 x86frame:558
	movl -476(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -480(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -480(%ebp)                     # x86gen:127 x86frame:573
	movl -480(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -484(%ebp)                     # x86gen:127 x86frame:581
	movl -488(%ebp), %ebx                     # x86gen:448 x86frame:323
	movl $L32_string, %ebx                    # x86gen:448 x86frame:328
	movl %ebx, -488(%ebp)                     # x86gen:448 x86frame:333
	movl -484(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -488(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -16(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -492(%ebp)                     # x86gen:239 x86frame:348
	movl -492(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L33_field_nil                          # x86gen:162
L65_fallthrough:                                  # x86gen:171
	jmp L34_field_nonNil                      # x86gen:179
L34_field_nonNil:                                 # x86gen:131
	movl -16(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -496(%ebp)                     # x86gen:239 x86frame:348
	movl -496(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -512(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -500(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -500(%ebp)                     # x86gen:456 x86frame:333
	movl -500(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -504(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -504(%ebp)                     # x86gen:456 x86frame:333
	movl -504(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -508(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -508(%ebp)                     # x86gen:361 x86frame:558
	movl -508(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -512(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -512(%ebp)                     # x86gen:127 x86frame:573
	movl -512(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -516(%ebp)                     # x86gen:127 x86frame:581
	movl -520(%ebp), %ebx                     # x86gen:448 x86frame:323
	movl $L35_string, %ebx                    # x86gen:448 x86frame:328
	movl %ebx, -520(%ebp)                     # x86gen:448 x86frame:333
	movl -516(%ebp), %ebx                     # x86gen:124 x86frame:301
	movl -520(%ebp), %ecx                     # x86gen:124 x86frame:306
	movl %ecx, (%ebx)                         # x86gen:124 x86frame:311
	movl -524(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -524(%ebp)                     # x86gen:456 x86frame:333
	movl %ebx, -524(%ebp)                     # x86gen:127 x86frame:573
	movl -524(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -576(%ebp)                     # x86gen:127 x86frame:581
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -528(%ebp)                     # x86gen:239 x86frame:348
	movl -528(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L36_field_nil                          # x86gen:162
L66_fallthrough:                                  # x86gen:171
	jmp L37_field_nonNil                      # x86gen:179
L37_field_nonNil:                                 # x86gen:131
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -532(%ebp)                     # x86gen:239 x86frame:348
	movl -532(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -548(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -536(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -536(%ebp)                     # x86gen:456 x86frame:333
	movl -536(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -540(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -540(%ebp)                     # x86gen:456 x86frame:333
	movl -540(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -544(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -544(%ebp)                     # x86gen:361 x86frame:558
	movl -544(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -548(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -548(%ebp)                     # x86gen:127 x86frame:573
	movl -548(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -552(%ebp)                     # x86gen:127 x86frame:581
	movl %ebx, -552(%ebp)                     # x86gen:259 x86frame:573
	movl -552(%ebp), %ebx                     # x86gen:259 x86frame:577
	movl %ebx, -556(%ebp)                     # x86gen:259 x86frame:581
	movl %ebx, -556(%ebp)                     # x86gen:127 x86frame:573
	movl -556(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -560(%ebp)                     # x86gen:127 x86frame:581
	movl -560(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -564(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -564(%ebp)                     # x86gen:127 x86frame:573
	movl -564(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -572(%ebp)                     # x86gen:127 x86frame:581
	movl -576(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L39_subs_nneg                         # x86gen:162
L67_fallthrough:                                  # x86gen:171
	jmp L38_subs_neg                          # x86gen:179
L38_subs_neg:                                     # x86gen:131
	movl -568(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -568(%ebp)                     # x86gen:456 x86frame:333
	movl -568(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L39_subs_nneg:                                    # x86gen:131
	movl %ebx, -572(%ebp)                     # x86gen:293 x86frame:573
	movl -572(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -580(%ebp)                     # x86gen:293 x86frame:581
	movl -580(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -576(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -580(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L41_subs_novf                          # x86gen:179
L68_fallthrough:                                  # x86gen:171
	jmp L40_subs_ovf                          # x86gen:184
L40_subs_ovf:                                     # x86gen:131
	movl -584(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $0, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -584(%ebp)                     # x86gen:456 x86frame:333
	movl -584(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L41_subs_novf:                                    # x86gen:131
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -588(%ebp)                     # x86gen:239 x86frame:348
	movl -588(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jne L37_field_nonNil                      # x86gen:162
L69_fallthrough:                                  # x86gen:171
	jmp L36_field_nil                         # x86gen:179
L36_field_nil:                                    # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
	jmp L37_field_nonNil                      # x86gen:191
L33_field_nil:                                    # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
	jmp L34_field_nonNil                      # x86gen:191
L42_field_nil:                                    # x86gen:131
	call recFieldError                        # x86gen:199
	addl $0, %esp                             # x86gen:55
L43_field_nonNil:                                 # x86gen:131
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -592(%ebp)                     # x86gen:239 x86frame:348
	movl -592(%ebp), %eax                     # x86gen:283 x86frame:510
	movl -608(%ebp), %ebx                     # x86gen:283 x86frame:515
	movl %eax, %ebx                           # x86gen:283 x86frame:520
	movl -596(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $1, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -596(%ebp)                     # x86gen:456 x86frame:333
	movl -596(%ebp), %eax                     # x86gen:355 x86frame:560
	movl -600(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $4, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -600(%ebp)                     # x86gen:456 x86frame:333
	movl -600(%ebp), %eax                     # x86gen:338 x86frame:510
	movl -604(%ebp), %ebx                     # x86gen:338 x86frame:515
	imull %ebx                                # x86gen:338 x86frame:520
	movl %eax, -604(%ebp)                     # x86gen:361 x86frame:558
	movl -604(%ebp), %ebx                     # x86gen:288 x86frame:379
	addl %ebx, %ecx                           # x86gen:288 x86frame:389
	movl %ecx, -608(%ebp)                     # x86gen:288 x86frame:384
	movl %ebx, -608(%ebp)                     # x86gen:127 x86frame:573
	movl -608(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -612(%ebp)                     # x86gen:127 x86frame:581
	movl %ebx, -612(%ebp)                     # x86gen:259 x86frame:573
	movl -612(%ebp), %ebx                     # x86gen:259 x86frame:577
	movl %ebx, -616(%ebp)                     # x86gen:259 x86frame:581
	movl %ebx, -616(%ebp)                     # x86gen:127 x86frame:573
	movl -616(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -620(%ebp)                     # x86gen:127 x86frame:581
	movl -620(%ebp), %ebx                     # x86gen:239 x86frame:379
	movl 4(%ebx), %ecx                        # x86gen:239 x86frame:389
	movl %ecx, -624(%ebp)                     # x86gen:239 x86frame:384
	movl %ebx, -624(%ebp)                     # x86gen:127 x86frame:573
	movl -624(%ebp), %ebx                     # x86gen:127 x86frame:577
	movl %ebx, -632(%ebp)                     # x86gen:127 x86frame:581
	movl -636(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	jge L45_subs_nneg                         # x86gen:162
L70_fallthrough:                                  # x86gen:171
	jmp L44_subs_neg                          # x86gen:179
L44_subs_neg:                                     # x86gen:131
	movl -628(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -628(%ebp)                     # x86gen:456 x86frame:333
	movl -628(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L45_subs_nneg:                                    # x86gen:131
	movl %ebx, -632(%ebp)                     # x86gen:293 x86frame:573
	movl -632(%ebp), %ebx                     # x86gen:293 x86frame:577
	movl %ebx, -640(%ebp)                     # x86gen:293 x86frame:581
	movl -640(%ebp), %ebx                     # x86gen:398 x86frame:367
	subl $1, %ebx                             # x86gen:398 x86frame:372
	movl -636(%ebp), %ebx                     # x86gen:174 x86frame:301
	movl -640(%ebp), %ecx                     # x86gen:174 x86frame:306
	cmpl %ebx, %ecx                           # x86gen:174 x86frame:311
	jl L47_subs_novf                          # x86gen:179
L71_fallthrough:                                  # x86gen:171
	jmp L46_subs_ovf                          # x86gen:184
L46_subs_ovf:                                     # x86gen:131
	movl -644(%ebp), %ebx                     # x86gen:456 x86frame:323
	movl $2, %ebx                             # x86gen:456 x86frame:328
	movl %ebx, -644(%ebp)                     # x86gen:456 x86frame:333
	movl -644(%ebp), %ebx                     # x86gen:228 x86frame:264
	pushl %ebx                                # x86gen:228 x86frame:269
	call arrInxError                          # x86gen:199
	addl $4, %esp                             # x86gen:55
L47_subs_novf:                                    # x86gen:131
	movl -20(%ebp), %ebx                      # x86gen:239 x86frame:343
	movl %ebx, -648(%ebp)                     # x86gen:239 x86frame:348
	movl -648(%ebp), %ebx                     # x86gen:157 x86frame:264
	cmpl $0, %ebx                             # x86gen:157 x86frame:269
	je L42_field_nil                          # x86gen:162
L72_fallthrough:                                  # x86gen:171
	jmp L52_CJUMP_NONE                        # x86gen:179
L52_CJUMP_NONE:                                   # x86gen:131
	jmp L43_field_nonNil                      # x86gen:191
L48_block_done:                                   # x86gen:131
	# FP, SP, RV, calleesaves still live
	leave
	ret
	.size	tigermain, .-tigermain
	.endfunc
# END tigermain


	.data
L35_string:
	.long 3
	.asciz "sdf"
	.data
L32_string:
	.long 3
	.asciz "sfd"
	.data
L21_string:
	.long 4
	.asciz "kati"
	.data
L6_string:
	.long 5
	.asciz "Allos"
	.data
L5_string:
	.long 5
	.asciz "Kapou"
	.data
L4_string:
	.long 7
	.asciz "Kapoios"
	.data
L3_string:
	.long 0
	.asciz ""
	.data
L2_string:
	.long 9
	.asciz "somewhere"
	.data
L1_string:
	.long 5
	.asciz "aname"
	.data
L0_string:
	.long 13
	.asciz "DefaultString"
