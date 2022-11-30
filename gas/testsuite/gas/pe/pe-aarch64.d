#objdump: -dr

.*:     file format pe-aarch64-little


Disassembly of section \.text:

0000000000000000 <.*>:
   0:	d100c3ff 	sub	sp, sp, #0x30
   4:	f90013fe 	str	x30, \[sp, #32\]
   8:	90000008 	adrp	x8, 0 <mainCRTStartup>
			8: IMAGE_REL_ARM64_PAGEBASE_REL21	hello_world_text
   c:	91000108 	add	x8, x8, #0x0
			c: IMAGE_REL_ARM64_PAGEOFFSET_12A	hello_world_text
  10:	f9000fe8 	str	x8, \[sp, #24\]
  14:	f9400fe8 	ldr	x8, \[sp, #24\]
  18:	f90007e8 	str	x8, \[sp, #8\]
  1c:	90000008 	adrp	x8, 0 <__imp_GetStdHandle>
			1c: IMAGE_REL_ARM64_PAGEBASE_REL21	__imp_GetStdHandle
  20:	f9400108 	ldr	x8, \[x8\]
			20: IMAGE_REL_ARM64_PAGEOFFSET_12L	__imp_GetStdHandle
  24:	12800140 	mov	w0, #0xfffffff5            	// #-11
  28:	d63f0100 	blr	x8
  2c:	f94007e1 	ldr	x1, \[sp, #8\]
  30:	90000008 	adrp	x8, 0 <__imp_WriteConsoleW>
			30: IMAGE_REL_ARM64_PAGEBASE_REL21	__imp_WriteConsoleW
  34:	f9400108 	ldr	x8, \[x8\]
			34: IMAGE_REL_ARM64_PAGEOFFSET_12L	__imp_WriteConsoleW
  38:	52800162 	mov	w2, #0xb                   	// #11
  3c:	910053e3 	add	x3, sp, #0x14
  40:	aa1f03e4 	mov	x4, xzr
  44:	d63f0100 	blr	x8
  48:	2a1f03e0 	mov	w0, wzr
  4c:	f94013fe 	ldr	x30, \[sp, #32\]
  50:	9100c3ff 	add	sp, sp, #0x30
  54:	d65f03c0 	ret
