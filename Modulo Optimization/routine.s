	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	routine
	.type	routine, %function
routine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r6, .L8
	mov	r8, r1
	ldr	sl, .L8+4
	mov	r1, #0	@ movhi
	strh	r1, [r6, #0]	@ movhi
	mov	r4, r0
	mov	r7, r2
	mov	r5, r3
	mov	r1, #0
.L4:
	ldrh	r3, [r5, #0]
	mov	r1, r1, asr #15
	ldrh	r2, [r8, r1]
	add	r3, r3, #1
	mov	r2, r2, asl r3
	strh	r2, [r4, r1]	@ movhi
	ldrsh	r3, [r6, #0]
	mov	r3, r3, asl #1
	ldrh	r2, [r4, r3]
	and	r2, r2, #7
	cmp	r2, #7
	ldreqh	r3, [r5, #0]
	moveq	r2, r3, lsr #8
	streqh	r2, [r5, #0]	@ movhi
	ldrsh	r0, [r6, #0]
	mov	r0, r0, asl #1
	ldrneh	r2, [r5, #0]
	ldrh	r1, [r4, r0]
	ldrh	ip, [r7, r0]
	mla	r3, r1, ip, r2
	smull	r1, r2, sl, r3
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r1, r1, r2, asr #7
	strh	r1, [r7, r0]	@ movhi
	ldrh	r3, [r6, #0]
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r1, r3, asl #16
	cmp	r1, #4128768
	strh	r3, [r6, #0]	@ movhi
	ble	.L4
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L9:
	.align	2
.L8:
	.word	i
	.word	-2139062143
	.size	routine, .-routine
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.size	main, .-main
	.comm	i,2,2
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits