	.text
	.globl	test
	.p2align	2
test:
	ldr	x8, [x18, #88]
	adrp	x9, _tls_index
	ldr	w9, [x9, :lo12:_tls_index]
	ldr	x8, [x8, x9, lsl #3]
	add	x8, x8, :dtprel_hi12:x		// IMAGE_REL_ARM64_SECREL_HIGH12A
	ldr	w0, [x8, :dtprel_lo12:x]	// IMAGE_REL_ARM64_SECREL_LOW12L
	ret

//	.section	.tls$,"dw"
//	.globl	x
//	.p2align	2
//x:
//	.word	0
	