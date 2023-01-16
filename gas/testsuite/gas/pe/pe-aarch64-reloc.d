#as:
#objdump: -dr

.*:     file format pe-aarch64-little


Disassembly of section \.text:

0000000000000000 <\.text>:
   0:	006f6f66 	\.inst	0x006f6f66 ; undefined
   4:	00000000 	udf	#0
			4: IMAGE_REL_ARM64_ADDR32	foo

0000000000000008 <struc>:
	\.\.\.
			8: IMAGE_REL_ARM64_ADDR64	arr

0000000000000010 <func>:
  10:	14000000 	b	0 <target>
			10: IMAGE_REL_ARM64_BRANCH26	target
  14:	90000000 	adrp	x0, 0 <foo>
			14: IMAGE_REL_ARM64_PAGEBASE_REL21	foo
  18:	91000000 	add	x0, x0, #0x0
			18: IMAGE_REL_ARM64_PAGEOFFSET_12A	foo
  1c:	f9400000 	ldr	x0, \[x0\]
			1c: IMAGE_REL_ARM64_PAGEOFFSET_12L	foo

0000000000000020 <bar>:
  20:	90000100 	adrp	x0, 20000 <baz\+0x1ffd2>
			20: IMAGE_REL_ARM64_PAGEBASE_REL21	\.text
  24:	b0091a20 	adrp	x0, 12345000 <foo\+0x12345000>
			24: IMAGE_REL_ARM64_PAGEBASE_REL21	foo
  28:	0000002c 	udf	#44
			28: IMAGE_REL_ARM64_SECREL	\.text
	\.\.\.
			2c: IMAGE_REL_ARM64_SECTION	\.text

000000000000002e <baz>:
  2e:	91000000 	add	x0, x0, #0x0
			2e: IMAGE_REL_ARM64_PAGEOFFSET_12A	foo
  32:	910d1400 	add	x0, x0, #0x345
			32: IMAGE_REL_ARM64_PAGEOFFSET_12A	foo
  36:	394d1400 	ldrb	w0, \[x0, #837\]
			36: IMAGE_REL_ARM64_PAGEOFFSET_12L	foo
  3a:	f941a400 	ldr	x0, \[x0, #840\]
			3a: IMAGE_REL_ARM64_PAGEOFFSET_12L	foo
  3e:	f9400000 	ldr	x0, \[x0\]
			3e: IMAGE_REL_ARM64_PAGEOFFSET_12L	foo
  42:	30091a20 	adr	x0, 12345 <foo\+0x12345>
			42: IMAGE_REL_ARM64_REL21	foo
  46:	54000001 	b\.ne	0 <target>  // b\.any
			46: IMAGE_REL_ARM64_BRANCH19	target
  4a:	36000000 	tbz	w0, #0, 0 <target>
			4a: IMAGE_REL_ARM64_BRANCH14	target
	\.\.\.
