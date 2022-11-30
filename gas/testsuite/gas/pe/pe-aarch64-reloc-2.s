.text

// Test file for AArch64 GAS -- instructions with relocation operators.
.set u8, 248
.set s9, -256
.set s12, -2048	
.set u12, 4095
.set u16, 65535
.set u32, 0x12345678
.set u48, 0xaabbccddeeff
.set u64, 0xfedcba9876543210
.set bit1,0xf000000000000000
.set bit2,~0xf

.align 8

func:
	
	// BFD_RELOC_AARCH64_LD_LO19_PCREL
	ldr	x0,llit

	// IMAGE_REL_ARM64_REL21
	adr	x0,llit
	adr	x1,ldata
	adr	x2,ldata+4088
	adr	x3,xlit
	adr	x4,xdata+16
	adr	x5,xdata+4088
	
	// IMAGE_REL_ARM64_PAGEBASE_REL21
	adrp	x0,llit
	adrp	x1,ldata
	adrp	x2,ldata+4088
	adrp	x3,xlit
	adrp	x4,xdata+16
	adrp	x5,xdata+4088

	// IMAGE_REL_ARM64_PAGEOFFSET_12A
	add	x0,x0,#:lo12:llit
	add	x1,x1,#:lo12:ldata
	add	x2,x2,#:lo12:ldata+4088
	add	x3,x3,#:lo12:xlit
	add	x4,x4,#:lo12:xdata+16
	add	x5,x5,#:lo12:xdata+4088
	add	x6,x6,u12
	
	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldrb	w0, [x0, #:lo12:llit]
	ldrb	w1, [x1, #:lo12:ldata]
	ldrb	w2, [x2, #:lo12:ldata+4088]
	ldrb	w3, [x3, #:lo12:xlit]
	ldrb	w4, [x4, #:lo12:xdata+16]
	ldrb	w5, [x5, #:lo12:xdata+4088]
	ldrb	w6, [x6, u12]

	// IMAGE_REL_ARM64_BRANCH14
	tbz	x0,#0,lab
	tbz	x1,#63,xlab
	tbnz	x2,#8,lab
	tbnz	x2,#47,xlab
	
	// IMAGE_REL_ARM64_BRANCH19
	b.eq	lab
	b.eq	xlab

	// IMAGE_REL_ARM64_BRANCH19
	cbz	x0,lab
	cbnz	x30,xlab

	// IMAGE_REL_ARM64_BRANCH26
	b	lab
	b	xlab

	// IMAGE_REL_ARM64_BRANCH26
	bl	lab
	bl	xlab

	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldrh	w0, [x0, #:lo12:llit]
	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldr	w1, [x1, #:lo12:ldata]
	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldr	x2, [x2, #:lo12:ldata+4088]
	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldr	q3, [x3, #:lo12:xlit]

	ret

llit:	.word	0xdeadf00d
	
lab:	
		
	.data
	.align 8
	
dummy:	.xword  0
	
ldata:	.xword	0x1122334455667788
	.space	8184
	
	.space	8184
