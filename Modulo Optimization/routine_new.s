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
  .global	routine_new
  .type	routine_new, %function
routine_new:
  @ Function supports interworking.
  @ args = 0, pretend = 0, frame = 0
  @ frame_needed = 0, uses_anonymous_args = 0
  @ link register save eliminated.
  stmfd	sp!, {r4, r5, r6, r7, r8}
  ldr	r8, .L8
  mov	r6, r0
  mov	r7, r1
  mov	r5, r2
  mov	r4, r3
  mov	ip, #0
.L4:
  ldrh	r3, [r4, #0]
  ldrh	r2, [r7, ip]
  add	r3, r3, #1
  mov	r2, r2, asl r3
  mov	r2, r2, asl #16
  mov	r3, r2, lsr #19
  mov	r2, r2, lsr #16
  strh	r2, [r6, ip]	@ movhi
  sub	r3, r2, r3, asl #3
  cmp	r3, #7
  ldreqh	r3, [r4, #0]
  moveq	r0, r3, lsr #8
  streqh	r0, [r4, #0]	@ movhi
  ldrneh	r0, [r4, #0]
  ldreqh	r2, [r6, ip]
  ldrh	r1, [r5, ip]
  mla	r3, r1, r2, r0
  smull	r1, r2, r8, r3
  mov	r1, r3, asr #31
  add	r2, r2, r3
  rsb	r1, r1, r2, asr #7
  strh	r1, [r5, ip]	@ movhi
  add	ip, ip, #2
  cmp	ip, #128
  bne	.L4
  ldmfd	sp!, {r4, r5, r6, r7, r8}
  bx	lr
.L9:
  .align	2
.L8:
  .word	-2139062143
  .size	routine_new, .-routine_new
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
  .ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
  .section	.note.GNU-stack,"",%progbits
