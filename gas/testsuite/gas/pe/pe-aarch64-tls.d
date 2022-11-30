#as:
#objdump: -dr

.*:     file format pe-aarch64-little

Disassembly of section .text:

0000000000000000 <.*>:
   0:	f9402e48 	ldr	x8, \[x18, #88\]
   4:	90000009 	adrp	x9, 0 <_tls_index>
			4: IMAGE_REL_ARM64_PAGEBASE_REL21	_tls_index
   8:	b9400129 	ldr	w9, \[x9\]
			8: IMAGE_REL_ARM64_PAGEOFFSET_12L	_tls_index
   c:	f8697908 	ldr	x8, \[x8, x9, lsl #3\]
  10:	91000108 	add	x8, x8, #0x0
			10: IMAGE_REL_ARM64_SECREL_HIGH12A	x
  14:	b9400100 	ldr	w0, \[x8\]
			14: IMAGE_REL_ARM64_SECREL_LOW12L	x
  18:	d65f03c0 	ret