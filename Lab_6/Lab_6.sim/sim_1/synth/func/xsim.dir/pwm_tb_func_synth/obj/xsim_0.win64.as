	.def	 _ieee_p_9a7ef1cb_sub_0;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_ieee_p_9a7ef1cb_sub_0
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_0:                 # @_ieee_p_9a7ef1cb_sub_0
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$40, %rsp
	movq	%r8, %rsi
	movq	%rcx, %r14
	movb	$4, 88(%rsi)
	leaq	72(%rsi), %rdx
	cmpl	$1, 80(%rsi)
	jne	.LBB0_1
# BB#5:
	movq	64(%rsi), %rax
	movl	72(%rsi), %ecx
	movl	76(%rsi), %edi
	cmpl	%edi, %ecx
	movl	84(%rsi), %esi
	jle	.LBB0_6
# BB#8:
	cmpl	$1, %esi
	cmovel	%ecx, %edi
	movl	%edi, %ecx
	jmp	.LBB0_7
.LBB0_1:
	leaq	96(%rsi), %rcx
	movl	$16, %r8d
	callq	*__imp__iki_std_memcpy(%rip)
	movl	96(%rsi), %eax
	movl	%eax, 92(%rsi)
	movl	100(%rsi), %ecx
	movb	108(%rsi), %dl
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_2 Depth=1
	movb	108(%rsi), %dl
	movsbl	%dl, %ebx
	addl	%ebx, %eax
	movl	%eax, 92(%rsi)
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movsbl	%dl, %edx
	imull	%edx, %eax
	imull	%edx, %ecx
	cmpl	%ecx, %eax
	jg	.LBB0_3
# BB#9:                                 #   in Loop: Header=BB0_2 Depth=1
	movzbl	88(%rsi), %eax
	leal	(%rax,%rax,8), %r15d
	movq	64(%rsi), %rdi
	movl	72(%rsi), %ecx
	movl	84(%rsi), %r8d
	movl	92(%rsi), %r9d
	movl	%r9d, %ebx
	subl	%ecx, %ebx
	imull	%r8d, %ebx
	movl	76(%rsi), %edx
	callq	*__imp__iki_vhdl_check_range_of_index_op(%rip)
	movzbl	(%rdi,%rbx), %eax
	addl	%r15d, %eax
	movb	4464(%r14,%rax), %al
	movb	%al, 88(%rsi)
	movl	92(%rsi), %eax
	movl	100(%rsi), %ecx
	cmpl	%ecx, %eax
	jne	.LBB0_10
.LBB0_3:
	movb	88(%rsi), %al
	jmp	.LBB0_4
.LBB0_6:
	cmpl	$-1, %esi
	cmovel	%edi, %ecx
.LBB0_7:
	subl	(%rdx), %ecx
	imull	12(%rdx), %ecx
	movb	(%rax,%rcx), %al
.LBB0_4:
	movzbl	%al, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	popq	%rbp
	ret

	.def	 _ieee_p_9a7ef1cb_sub_1;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_9a7ef1cb_sub_1
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_1:                 # @_ieee_p_9a7ef1cb_sub_1
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	64(%r8), %eax
	leal	(%rax,%rax,8), %eax
	movzbl	65(%r8), %edx
	addl	%eax, %edx
	movzbl	4545(%rcx,%rdx), %eax
	popq	%rbp
	ret

	.def	 _ieee_p_9a7ef1cb_sub_2;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_9a7ef1cb_sub_2
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_2:                 # @_ieee_p_9a7ef1cb_sub_2
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	64(%r8), %eax
	leal	(%rax,%rax,8), %eax
	movzbl	65(%r8), %edx
	addl	%eax, %edx
	movzbl	4626(%rcx,%rdx), %eax
	popq	%rbp
	ret

	.def	 _ieee_p_9a7ef1cb_sub_3;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_9a7ef1cb_sub_3
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_3:                 # @_ieee_p_9a7ef1cb_sub_3
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	64(%r8), %eax
	leal	(%rax,%rax,8), %eax
	movzbl	65(%r8), %edx
	addl	%eax, %edx
	movzbl	4707(%rcx,%rdx), %eax
	popq	%rbp
	ret

	.def	 _ieee_p_9a7ef1cb_sub_4;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_9a7ef1cb_sub_4
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_4:                 # @_ieee_p_9a7ef1cb_sub_4
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movzbl	64(%r8), %eax
	movzbl	4788(%rcx,%rax), %eax
	popq	%rbp
	ret

	.def	 _ieee_p_9a7ef1cb_sub_5;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_9a7ef1cb_sub_5
	.align	16, 0x90
_ieee_p_9a7ef1cb_sub_5:                 # @_ieee_p_9a7ef1cb_sub_5
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$192, %rsp
	movq	%r8, %rbx
	movq	%rcx, %r14
	leaq	64(%rbx), %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$1, %r8d
	movq	%rdi, %rcx
	callq	*__imp__iki_vhdl_event_signal_parameter(%rip)
	cmpb	$1, %al
	jne	.LBB5_1
# BB#5:
	movq	%rbx, -112(%rbp)
	movq	80(%rbx), %rax
	movl	88(%rbx), %ecx
	movb	(%rax,%rcx), %al
	movb	%al, -48(%rbp)
	movzbl	-48(%rbp), %eax
	cmpb	$3, 4788(%r14,%rax)
	sete	%sil
.LBB5_1:
	testb	%sil, %sil
	je	.LBB5_2
# BB#4:
	movq	%rbx, -192(%rbp)
	xorl	%edx, %edx
	movq	%rdi, %rcx
	callq	*__imp__iki_vhdl_last_value_signal_parameter(%rip)
	movb	(%rax), %al
	movb	%al, -128(%rbp)
	movzbl	-128(%rbp), %eax
	cmpb	$2, 4788(%r14,%rax)
	sete	%al
	jmp	.LBB5_3
.LBB5_2:
	xorl	%eax, %eax
.LBB5_3:
	movzbl	%al, %eax
	addq	$192, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	ret

	.def	 _ieee_p_d09549db_sub_6;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_d09549db_sub_6
	.align	16, 0x90
_ieee_p_d09549db_sub_6:                 # @_ieee_p_d09549db_sub_6
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	64(%r8), %ecx
	movl	68(%r8), %eax
	cmpl	%eax, %ecx
	cmovgel	%ecx, %eax
	popq	%rbp
	ret

	.def	 _ieee_p_d09549db_sub_7;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_d09549db_sub_7
	.align	16, 0x90
_ieee_p_d09549db_sub_7:                 # @_ieee_p_d09549db_sub_7
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	64(%r8), %ecx
	movl	68(%r8), %eax
	cmpl	%eax, %ecx
	cmovlel	%ecx, %eax
	popq	%rbp
	ret

	.def	 _ieee_p_d09549db_sub_8;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_d09549db_sub_8
	.align	16, 0x90
_ieee_p_d09549db_sub_8:                 # @_ieee_p_d09549db_sub_8
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$88, %rsp
	movq	%r8, %rbx
	movq	%rcx, %r15
	leaq	88(%rbx), %r13
	movq	%r13, -104(%rbp)        # 8-byte Spill
	movl	96(%rbx), %edi
	movl	%edi, %ecx
	callq	*__imp__iki_align(%rip)
	movl	%eax, -108(%rbp)        # 4-byte Spill
	movl	%edi, %ecx
	callq	*__imp__iki_spushz(%rip)
	movq	%rax, %r12
	xorl	%edx, %edx
	movq	%r12, %rcx
	movl	%edi, %r8d
	callq	*__imp__iki_std_memset(%rip)
	movl	96(%rbx), %esi
	movl	%esi, -112(%rbp)        # 4-byte Spill
	movq	__imp__iki_std_memcpy(%rip), %r14
	leaq	-96(%rbp), %rdi
	movl	$16, %r8d
	movq	%rdi, %rcx
	movq	%r13, %rdx
	callq	*%r14
	leaq	-80(%rbp), %rcx
	movl	$16, %r8d
	movq	%rcx, %r13
	movq	%rdi, %rdx
	callq	*%r14
	movl	%esi, %ecx
	callq	*__imp__iki_spush(%rip)
	movq	%rax, 104(%rbx)
	movq	%rax, %rcx
	movq	%r12, %rdx
	movl	%esi, %r8d
	callq	*%r14
	leaq	112(%rbx), %r12
	movl	$16, %r8d
	movq	%r12, %rcx
	movq	%r13, %rdx
	callq	*%r14
	leaq	132(%rbx), %rcx
	movl	$16, %r8d
	movq	-104(%rbp), %rdx        # 8-byte Reload
	callq	*%r14
	movl	132(%rbx), %eax
	movl	%eax, 128(%rbx)
	movl	136(%rbx), %ecx
	movb	144(%rbx), %dl
	movq	__imp__iki_vhdl_check_range_of_index_op(%rip), %r14
	jmp	.LBB8_1
	.align	16, 0x90
.LBB8_6:                                #   in Loop: Header=BB8_1 Depth=1
	movb	144(%rbx), %dl
	movsbl	%dl, %edi
	addl	%edi, %eax
	movl	%eax, 128(%rbx)
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	movsbl	%dl, %edx
	imull	%edx, %eax
	imull	%edx, %ecx
	cmpl	%ecx, %eax
	jg	.LBB8_2
# BB#4:                                 #   in Loop: Header=BB8_1 Depth=1
	movq	80(%rbx), %rdi
	movl	88(%rbx), %ecx
	movl	100(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %esi
	subl	%ecx, %esi
	imull	%r8d, %esi
	movl	92(%rbx), %edx
	callq	*%r14
	movzbl	(%rdi,%rsi), %edi
	xorl	%ecx, %ecx
	movl	$8, %edx
	movl	$1, %r8d
	movl	%edi, %r9d
	callq	*%r14
	cmpb	$0, 4797(%r15,%rdi)
	jne	.LBB8_7
# BB#5:                                 #   in Loop: Header=BB8_1 Depth=1
	movq	80(%rbx), %rsi
	movl	88(%rbx), %ecx
	movl	100(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %edi
	subl	%ecx, %edi
	imull	%r8d, %edi
	movl	92(%rbx), %edx
	callq	*%r14
	movzbl	(%rsi,%rdi), %edi
	xorl	%ecx, %ecx
	movl	$8, %edx
	movl	$1, %r8d
	movl	%edi, %r9d
	callq	*%r14
	movb	4891(%r15,%rdi), %r13b
	movq	104(%rbx), %rdi
	movl	112(%rbx), %ecx
	movl	124(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %esi
	subl	%ecx, %esi
	imull	%r8d, %esi
	movl	116(%rbx), %edx
	callq	*%r14
	movb	%r13b, (%rdi,%rsi)
	movl	128(%rbx), %eax
	movl	136(%rbx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB8_6
.LBB8_2:
	movq	104(%rbx), %r14
	leaq	64(%rbx), %rcx
	movl	$16, %r8d
	movq	%r12, %rdx
	movq	__imp__iki_std_memcpy(%rip), %rax
	movq	%rax, %rdi
	callq	*%rdi
	movl	120(%rbx), %ebx
	movl	%ebx, %ecx
	callq	*__imp__iki_dpush(%rip)
	movq	%rax, %rsi
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movl	%ebx, %r8d
	callq	*%rdi
	movl	-108(%rbp), %r14d       # 4-byte Reload
	jmp	.LBB8_3
.LBB8_7:
	addq	$4806, %r15             # imm = 0x12C6
	movl	$85, %edx
	movl	$1, %r8d
	movq	%r15, %rcx
	callq	*__imp__iki_vhdl_report(%rip)
	movl	120(%rbx), %esi
	movl	%esi, %ecx
	callq	*__imp__iki_align(%rip)
	movl	-108(%rbp), %r14d       # 4-byte Reload
	addl	%eax, %r14d
	movl	%esi, %ecx
	callq	*__imp__iki_spushz(%rip)
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rdi, %rcx
	movl	%esi, %r8d
	callq	*__imp__iki_std_memset(%rip)
	movq	104(%rbx), %rcx
	movl	120(%rbx), %r8d
	movq	%rdi, %rdx
	movq	__imp__iki_std_memcpy(%rip), %rax
	movq	%rax, %rdi
	callq	*%rdi
	movq	104(%rbx), %r15
	leaq	64(%rbx), %rcx
	movl	$16, %r8d
	movq	%r12, %rdx
	callq	*%rdi
	movl	120(%rbx), %ebx
	movl	%ebx, %ecx
	callq	*__imp__iki_dpush(%rip)
	movq	%rax, %rsi
	movq	%rsi, %rcx
	movq	%r15, %rdx
	movl	%ebx, %r8d
	callq	*%rdi
.LBB8_3:
	movq	__imp__iki_spop(%rip), %rdi
	movl	%r14d, %ecx
	callq	*%rdi
	movl	-112(%rbp), %ecx        # 4-byte Reload
	callq	*%rdi
	movq	%rsi, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret

	.def	 _ieee_p_d09549db_sub_9;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_d09549db_sub_9
	.align	16, 0x90
_ieee_p_d09549db_sub_9:                 # @_ieee_p_d09549db_sub_9
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$88, %rsp
	movq	%r8, %rbx
	movq	%rcx, %r15
	leaq	88(%rbx), %r13
	movq	%r13, -104(%rbp)        # 8-byte Spill
	movl	96(%rbx), %edi
	movl	%edi, %ecx
	callq	*__imp__iki_align(%rip)
	movl	%eax, -108(%rbp)        # 4-byte Spill
	movl	%edi, %ecx
	callq	*__imp__iki_spushz(%rip)
	movq	%rax, %r12
	xorl	%edx, %edx
	movq	%r12, %rcx
	movl	%edi, %r8d
	callq	*__imp__iki_std_memset(%rip)
	movl	96(%rbx), %esi
	movl	%esi, -112(%rbp)        # 4-byte Spill
	movq	__imp__iki_std_memcpy(%rip), %r14
	leaq	-96(%rbp), %rdi
	movl	$16, %r8d
	movq	%rdi, %rcx
	movq	%r13, %rdx
	callq	*%r14
	leaq	-80(%rbp), %rcx
	movl	$16, %r8d
	movq	%rcx, %r13
	movq	%rdi, %rdx
	callq	*%r14
	movl	%esi, %ecx
	callq	*__imp__iki_spush(%rip)
	movq	%rax, 104(%rbx)
	movq	%rax, %rcx
	movq	%r12, %rdx
	movl	%esi, %r8d
	callq	*%r14
	leaq	112(%rbx), %r12
	movl	$16, %r8d
	movq	%r12, %rcx
	movq	%r13, %rdx
	callq	*%r14
	leaq	132(%rbx), %rcx
	movl	$16, %r8d
	movq	-104(%rbp), %rdx        # 8-byte Reload
	callq	*%r14
	movl	132(%rbx), %eax
	movl	%eax, 128(%rbx)
	movl	136(%rbx), %ecx
	movb	144(%rbx), %dl
	movq	__imp__iki_vhdl_check_range_of_index_op(%rip), %r14
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_6:                                #   in Loop: Header=BB9_1 Depth=1
	movb	144(%rbx), %dl
	movsbl	%dl, %edi
	addl	%edi, %eax
	movl	%eax, 128(%rbx)
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movsbl	%dl, %edx
	imull	%edx, %eax
	imull	%edx, %ecx
	cmpl	%ecx, %eax
	jg	.LBB9_2
# BB#4:                                 #   in Loop: Header=BB9_1 Depth=1
	movq	80(%rbx), %rdi
	movl	88(%rbx), %ecx
	movl	100(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %esi
	subl	%ecx, %esi
	imull	%r8d, %esi
	movl	92(%rbx), %edx
	callq	*%r14
	movzbl	(%rdi,%rsi), %edi
	xorl	%ecx, %ecx
	movl	$8, %edx
	movl	$1, %r8d
	movl	%edi, %r9d
	callq	*%r14
	cmpb	$0, 4900(%r15,%rdi)
	jne	.LBB9_7
# BB#5:                                 #   in Loop: Header=BB9_1 Depth=1
	movq	80(%rbx), %rsi
	movl	88(%rbx), %ecx
	movl	100(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %edi
	subl	%ecx, %edi
	imull	%r8d, %edi
	movl	92(%rbx), %edx
	callq	*%r14
	movzbl	(%rsi,%rdi), %edi
	xorl	%ecx, %ecx
	movl	$8, %edx
	movl	$1, %r8d
	movl	%edi, %r9d
	callq	*%r14
	movb	4994(%r15,%rdi), %r13b
	movq	104(%rbx), %rdi
	movl	112(%rbx), %ecx
	movl	124(%rbx), %r8d
	movl	128(%rbx), %r9d
	movl	%r9d, %esi
	subl	%ecx, %esi
	imull	%r8d, %esi
	movl	116(%rbx), %edx
	callq	*%r14
	movb	%r13b, (%rdi,%rsi)
	movl	128(%rbx), %eax
	movl	136(%rbx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB9_6
.LBB9_2:
	movq	104(%rbx), %r14
	leaq	64(%rbx), %rcx
	movl	$16, %r8d
	movq	%r12, %rdx
	movq	__imp__iki_std_memcpy(%rip), %rax
	movq	%rax, %rdi
	callq	*%rdi
	movl	120(%rbx), %ebx
	movl	%ebx, %ecx
	callq	*__imp__iki_dpush(%rip)
	movq	%rax, %rsi
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movl	%ebx, %r8d
	callq	*%rdi
	movl	-108(%rbp), %r14d       # 4-byte Reload
	jmp	.LBB9_3
.LBB9_7:
	addq	$4909, %r15             # imm = 0x132D
	movl	$85, %edx
	movl	$1, %r8d
	movq	%r15, %rcx
	callq	*__imp__iki_vhdl_report(%rip)
	movl	120(%rbx), %esi
	movl	%esi, %ecx
	callq	*__imp__iki_align(%rip)
	movl	-108(%rbp), %r14d       # 4-byte Reload
	addl	%eax, %r14d
	movl	%esi, %ecx
	callq	*__imp__iki_spushz(%rip)
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rdi, %rcx
	movl	%esi, %r8d
	callq	*__imp__iki_std_memset(%rip)
	movq	104(%rbx), %rcx
	movl	120(%rbx), %r8d
	movq	%rdi, %rdx
	movq	__imp__iki_std_memcpy(%rip), %rax
	movq	%rax, %rdi
	callq	*%rdi
	movq	104(%rbx), %r15
	leaq	64(%rbx), %rcx
	movl	$16, %r8d
	movq	%r12, %rdx
	callq	*%rdi
	movl	120(%rbx), %ebx
	movl	%ebx, %ecx
	callq	*__imp__iki_dpush(%rip)
	movq	%rax, %rsi
	movq	%rsi, %rcx
	movq	%r15, %rdx
	movl	%ebx, %r8d
	callq	*%rdi
.LBB9_3:
	movq	__imp__iki_spop(%rip), %rdi
	movl	%r14d, %ecx
	callq	*%rdi
	movl	-112(%rbp), %ecx        # 4-byte Reload
	callq	*%rdi
	movq	%rsi, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret

	.def	 _ieee_p_d7c7ad0f_sub_10;
	.scl	2;
	.type	32;
	.endef
	.globl	_ieee_p_d7c7ad0f_sub_10
	.align	16, 0x90
_ieee_p_d7c7ad0f_sub_10:                # @_ieee_p_d7c7ad0f_sub_10
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	64(%r8), %ecx
	movl	68(%r8), %eax
	cmpl	%eax, %ecx
	cmovgel	%ecx, %eax
	popq	%rbp
	ret

	.def	 _transaction_0;
	.scl	2;
	.type	32;
	.endef
	.globl	_transaction_0
	.align	16, 0x90
_transaction_0:                         # @_transaction_0
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$40, %rsp
	movl	%r9d, %r15d
	movq	%rdx, %rdi
	movq	%rcx, %rbx
	movl	48(%rbp), %r14d
	movl	%r15d, %r13d
	leaq	760(%r13,%rbx), %rsi
	movq	%rsi, %rcx
	movl	%r14d, %r8d
	callq	*__imp__iki_std_memcmp(%rip)
	testl	%eax, %eax
	je	.LBB11_2
# BB#1:
	leaq	3344(%rbx), %rcx
	movq	__imp__iki_schedule_process(%rip), %r12
	callq	*%r12
	leaq	3504(%rbx), %rcx
	callq	*%r12
	leaq	624(%rbx), %r12
	movq	%r12, %rcx
	movq	%rdi, %rdx
	movl	%r15d, %r8d
	movl	%r14d, %r9d
	callq	*__imp__iki_vhdl_event_callback(%rip)
	movq	%rax, %rdi
	leaq	784(%r13,%rbx), %rcx
	movq	__imp__iki_std_memcpy(%rip), %r13
	movq	%rsi, %rdx
	movl	%r14d, %r8d
	callq	*%r13
	movq	%r12, %rcx
	movq	%rdi, %rdx
	movl	%r15d, %r8d
	movl	%r14d, %r9d
	callq	*__imp__iki_dynamic_transaction_vhdl(%rip)
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movl	%r14d, %r8d
	callq	*%r13
.LBB11_2:
	addq	$624, %rbx              # imm = 0x270
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movl	%r15d, %r8d
	movl	%r14d, %r9d
	callq	*__imp__iki_vhdl_event_callback(%rip)
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret

	.def	 _execute_28;
	.scl	2;
	.type	32;
	.endef
	.globl	_execute_28
	.align	16, 0x90
_execute_28:                            # @_execute_28
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	subq	$192, %rsp
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	movl	$4194355, %ecx          # imm = 0x400033
	callq	*__imp__iki_stmt_online(%rip)
	leaq	40(%rsi), %rcx
	xorl	%edx, %edx
	callq	*__imp__iki_vhdl_rising_edge(%rip)
	testb	%al, %al
	je	.LBB12_2
# BB#1:
	movl	$4194356, %ecx          # imm = 0x400034
	callq	*__imp__iki_stmt_online(%rip)
	movl	$1, -56(%rbp)
	movl	208(%rsi), %eax
	addq	200(%rsi), %rax
	movq	%rax, -80(%rbp)
	movl	$7, -72(%rbp)
	movabsq	$34359738368, %rax      # imm = 0x800000000
	movq	%rax, -68(%rbp)
	movl	$-1, -60(%rbp)
	leaq	-160(%rbp), %r8
	leaq	2456(%rdi), %rdx
	movq	%rdi, %rcx
	callq	*__imp__iki_std_logic_arith_unsigned_integer_plus(%rip)
	movq	%rax, %rdi
	leaq	-96(%rbp), %rdx
	movl	$7, -176(%rbp)
	movl	$0, -172(%rbp)
	movl	$-1, -164(%rbp)
	movl	$8, -168(%rbp)
	leaq	-176(%rbp), %rcx
	movl	$1, %r8d
	callq	*__imp__iki_vhdl_array_compare_size(%rip)
	leaq	440(%rsi), %rcx
	movl	$8, %r8d
	movq	%rdi, %rdx
	callq	*__imp__iki_std_memcpy(%rip)
	leaq	192(%rsi), %rcx
	addq	$416, %rsi              # imm = 0x1A0
	movl	$8, %r8d
	movq	%rsi, %rdx
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0(%rip)
	movl	-88(%rbp), %ecx
	callq	*__imp__iki_dpop(%rip)
.LBB12_2:
	addq	$192, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	ret

	.def	 _execute_29;
	.scl	2;
	.type	32;
	.endef
	.globl	_execute_29
	.align	16, 0x90
_execute_29:                            # @_execute_29
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	subq	$160, %rsp
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	movl	$4194363, %ecx          # imm = 0x40003B
	callq	*__imp__iki_stmt_online(%rip)
	movl	112(%rsi), %eax
	addq	104(%rsi), %rax
	movq	%rax, -56(%rbp)
	movl	$7, -48(%rbp)
	movabsq	$34359738368, %rax      # imm = 0x800000000
	movq	%rax, -44(%rbp)
	movl	$-1, -36(%rbp)
	movl	208(%rsi), %ecx
	addq	200(%rsi), %rcx
	movq	%rcx, -80(%rbp)
	movl	$7, -72(%rbp)
	movq	%rax, -68(%rbp)
	movl	$-1, -60(%rbp)
	leaq	-144(%rbp), %r8
	leaq	2456(%rdi), %rdx
	movq	%rdi, %rcx
	callq	*__imp__iki_std_logic_arith_unsigned_unsigned_is_less(%rip)
	testb	%al, %al
	je	.LBB13_1
# BB#3:
	movl	$4194364, %ecx          # imm = 0x40003C
	callq	*__imp__iki_stmt_online(%rip)
	movb	$3, 600(%rsi)
	jmp	.LBB13_2
.LBB13_1:
	movl	$4194366, %ecx          # imm = 0x40003E
	callq	*__imp__iki_stmt_online(%rip)
	movb	$2, 600(%rsi)
.LBB13_2:
	leaq	232(%rsi), %rcx
	addq	$576, %rsi              # imm = 0x240
	movq	%rsi, %rdx
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0_size1(%rip)
	addq	$160, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	ret

	.def	 _execute_30;
	.scl	2;
	.type	32;
	.endef
	.globl	_execute_30
	.align	16, 0x90
_execute_30:                            # @_execute_30
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	subq	$40, %rsp
	movq	%rdx, %rsi
	movl	$4194370, %ecx          # imm = 0x400042
	callq	*__imp__iki_stmt_online(%rip)
	movq	240(%rsi), %rax
	movl	248(%rsi), %ecx
	movb	(%rax,%rcx), %al
	movb	%al, 760(%rsi)
	leaq	136(%rsi), %rcx
	addq	$736, %rsi              # imm = 0x2E0
	movq	%rsi, %rdx
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0_size1(%rip)
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	ret

	.def	 _execute_31;
	.scl	2;
	.type	32;
	.endef
	.globl	_execute_31
	.align	16, 0x90
_execute_31:                            # @_execute_31
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdx, %rsi
	leaq	200(%rsi), %rdi
	.align	16, 0x90
.LBB15_1:                               # =>This Inner Loop Header: Depth=1
	movq	240(%rsi), %rax
	testq	%rax, %rax
	je	.LBB15_3
# BB#2:                                 #   in Loop: Header=BB15_1 Depth=1
	jmpq	*%rax
.Ltmp41:                                # Block address taken
.LBB15_5:
	movq	__imp__iki_stmt_online(%rip), %rbx
	movl	$1048642, %ecx          # imm = 0x100042
	callq	*%rbx
	movb	$3, 352(%rsi)
	leaq	40(%rsi), %rcx
	leaq	328(%rsi), %rdx
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0_size1(%rip)
	movl	$1048643, %ecx          # imm = 0x100043
	callq	*%rbx
	movabsq	$100000000000, %rdx     # imm = 0x174876E800
	movq	%rdi, %rcx
	callq	*__imp__iki_vhdl_wait(%rip)
	leaq	.Ltmp42(%rip), %rax
	jmp	.LBB15_4
.Ltmp42:                                # Block address taken
.LBB15_3:
	movq	__imp__iki_stmt_online(%rip), %rbx
	movl	$1048640, %ecx          # imm = 0x100040
	callq	*%rbx
	movb	$2, 352(%rsi)
	leaq	40(%rsi), %rcx
	leaq	328(%rsi), %rdx
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0_size1(%rip)
	movl	$1048641, %ecx          # imm = 0x100041
	callq	*%rbx
	movabsq	$100000000000, %rdx     # imm = 0x174876E800
	movq	%rdi, %rcx
	callq	*__imp__iki_vhdl_wait(%rip)
	leaq	.Ltmp41(%rip), %rax
.LBB15_4:
	movq	%rax, 240(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	ret

	.def	 _execute_32;
	.scl	2;
	.type	32;
	.endef
	.globl	_execute_32
	.align	16, 0x90
_execute_32:                            # @_execute_32
# BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rdx, %rsi
	movq	%rcx, %rbx
	leaq	360(%rsi), %r14
	.align	16, 0x90
.LBB16_1:                               # =>This Inner Loop Header: Depth=1
	movq	400(%rsi), %rax
	testq	%rax, %rax
	je	.LBB16_3
# BB#2:                                 #   in Loop: Header=BB16_1 Depth=1
	jmpq	*%rax
.Ltmp46:                                # Block address taken
.LBB16_5:
	movq	__imp__iki_stmt_online(%rip), %rdi
	movl	$1048652, %ecx          # imm = 0x10004C
	callq	*%rdi
	addq	$5011, %rbx             # imm = 0x1393
	leaq	512(%rsi), %rcx
	movl	$8, %r8d
	movq	%rbx, %rdx
	callq	*__imp__iki_std_memcpy(%rip)
	leaq	96(%rsi), %rcx
	leaq	488(%rsi), %rdx
	movl	$8, %r8d
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0(%rip)
	movl	$1048653, %ecx          # imm = 0x10004D
	callq	*%rdi
	movabsq	$400000000000, %rdx     # imm = 0x5D21DBA000
	movq	%r14, %rcx
	callq	*__imp__iki_vhdl_wait(%rip)
	leaq	.Ltmp47(%rip), %rax
	jmp	.LBB16_4
.Ltmp48:                                # Block address taken
.LBB16_3:
	movq	__imp__iki_stmt_online(%rip), %rdi
	movl	$1048650, %ecx          # imm = 0x10004A
	callq	*%rdi
	addq	$5003, %rbx             # imm = 0x138B
	leaq	512(%rsi), %rcx
	movl	$8, %r8d
	movq	%rbx, %rdx
	callq	*__imp__iki_std_memcpy(%rip)
	leaq	96(%rsi), %rcx
	leaq	488(%rsi), %rdx
	movl	$8, %r8d
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0(%rip)
	movl	$1048651, %ecx          # imm = 0x10004B
	callq	*%rdi
	movabsq	$400000000000, %rdx     # imm = 0x5D21DBA000
	movq	%r14, %rcx
	callq	*__imp__iki_vhdl_wait(%rip)
	leaq	.Ltmp46(%rip), %rax
.LBB16_4:
	movq	%rax, 400(%rsi)
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	ret
.Ltmp47:                                # Block address taken
.LBB16_6:
	movq	__imp__iki_stmt_online(%rip), %rdi
	movl	$1048654, %ecx          # imm = 0x10004E
	callq	*%rdi
	addq	$5019, %rbx             # imm = 0x139B
	leaq	512(%rsi), %rcx
	movl	$8, %r8d
	movq	%rbx, %rdx
	callq	*__imp__iki_std_memcpy(%rip)
	leaq	96(%rsi), %rcx
	leaq	488(%rsi), %rdx
	movl	$8, %r8d
	callq	*__imp__iki_vhdl_schedule_transaction_signal_fast_setback0(%rip)
	movl	$1048655, %ecx          # imm = 0x10004F
	callq	*%rdi
	leaq	.Ltmp48(%rip), %rax
	jmp	.LBB16_4

	.data
	.align	8                       # @ng0
ng0:
	.quad	.L.str2

	.align	8                       # @ng1
ng1:
	.quad	.L.str1

	.align	8                       # @ng2
ng2:
	.quad	.L.str

	.section	.rdata,"r"
.L.str:                                 # @.str
	.asciz	"Function maximum ended without a return statement\n"

.L.str1:                                # @.str1
	.asciz	"Function min ended without a return statement\n"

.L.str2:                                # @.str2
	.asciz	"Function max ended without a return statement\n"


