#as:
#objdump: -dr

.*:     file format pe-aarch64-little


Disassembly of section .text:

0000000000000000 <.text>:
	...

0000000000000008 <foo>:
   8:	12345678 	and	w24, w19, #0xfffff003
   c:	12345678 	and	w24, w19, #0xfffff003
  10:	00000008 	udf	#8
			10: IMAGE_REL_ARM64_ADDR32	.text
  14:	00000008 	udf	#8
			14: IMAGE_REL_ARM64_ADDR32	.text
	...
			18: IMAGE_REL_ARM64_ADDR32	bar
			1c: IMAGE_REL_ARM64_ADDR32	bar
  20:	00000009 	udf	#9
			20: IMAGE_REL_ARM64_ADDR32	.text
  24:	00000009 	udf	#9
			24: IMAGE_REL_ARM64_ADDR32	.text
  28:	00000001 	udf	#1
			28: IMAGE_REL_ARM64_ADDR32	bar
  2c:	00000001 	udf	#1
			2c: IMAGE_REL_ARM64_ADDR32	bar
  30:	00000007 	udf	#7
			30: IMAGE_REL_ARM64_ADDR32	.text
  34:	00000007 	udf	#7
			34: IMAGE_REL_ARM64_ADDR32	.text
  38:	ffffffff 	.inst	0xffffffff ; undefined
			38: IMAGE_REL_ARM64_ADDR32	bar
  3c:	ffffffff 	.inst	0xffffffff ; undefined
			3c: IMAGE_REL_ARM64_ADDR32	bar
  40:	9abcdef0 	.inst	0x9abcdef0 ; undefined
  44:	12345678 	and	w24, w19, #0xfffff003
  48:	9abcdef0 	.inst	0x9abcdef0 ; undefined
  4c:	12345678 	and	w24, w19, #0xfffff003
  50:	00000008 	udf	#8
			50: IMAGE_REL_ARM64_ADDR64	.text
  54:	00000000 	udf	#0
  58:	00000008 	udf	#8
			58: IMAGE_REL_ARM64_ADDR64	.text
	...
			60: IMAGE_REL_ARM64_ADDR64	bar
			68: IMAGE_REL_ARM64_ADDR64	bar
  70:	00000009 	udf	#9
			70: IMAGE_REL_ARM64_ADDR64	.text
  74:	00000000 	udf	#0
  78:	00000009 	udf	#9
			78: IMAGE_REL_ARM64_ADDR64	.text
  7c:	00000000 	udf	#0
  80:	00000001 	udf	#1
			80: IMAGE_REL_ARM64_ADDR64	bar
  84:	00000000 	udf	#0
  88:	00000001 	udf	#1
			88: IMAGE_REL_ARM64_ADDR64	bar
  8c:	00000000 	udf	#0
  90:	00000007 	udf	#7
			90: IMAGE_REL_ARM64_ADDR64	.text
  94:	00000000 	udf	#0
  98:	00000007 	udf	#7
			98: IMAGE_REL_ARM64_ADDR64	.text
  9c:	00000000 	udf	#0
  a0:	ffffffff 	.inst	0xffffffff ; undefined
			a0: IMAGE_REL_ARM64_ADDR64	bar
  a4:	ffffffff 	.inst	0xffffffff ; undefined
  a8:	ffffffff 	.inst	0xffffffff ; undefined
			a8: IMAGE_REL_ARM64_ADDR64	bar
  ac:	ffffffff 	.inst	0xffffffff ; undefined
  b0:	00000008 	udf	#8
			b0: IMAGE_REL_ARM64_ADDR32NB	.text
  b4:	00000000 	udf	#0
			b4: IMAGE_REL_ARM64_ADDR32NB	bar
  b8:	00000009 	udf	#9
			b8: IMAGE_REL_ARM64_ADDR32NB	.text
  bc:	00000001 	udf	#1
			bc: IMAGE_REL_ARM64_ADDR32NB	bar
  c0:	00000007 	udf	#7
			c0: IMAGE_REL_ARM64_ADDR32NB	.text
  c4:	ffffffff 	.inst	0xffffffff ; undefined
			c4: IMAGE_REL_ARM64_ADDR32NB	bar
  c8:	17ffffd0 	b	8 <foo>
  cc:	17ffffd0 	b	c <foo\+0x4>
  d0:	17ffffcd 	b	4 <.text\+0x4>
  d4:	14000000 	b	0 <bar>
			d4: IMAGE_REL_ARM64_BRANCH26	bar
  d8:	14000001 	b	4 <bar\+0x4>
			d8: IMAGE_REL_ARM64_BRANCH26	bar
  dc:	17ffffff 	b	fffffffffffffffc <bar\+0xfffffffffffffffc>
			dc: IMAGE_REL_ARM64_BRANCH26	bar
  e0:	97ffffca 	bl	8 <foo>
  e4:	97ffffca 	bl	c <foo\+0x4>
  e8:	97ffffc7 	bl	4 <.text\+0x4>
  ec:	94000000 	bl	0 <bar>
			ec: IMAGE_REL_ARM64_BRANCH26	bar
  f0:	94000001 	bl	4 <bar\+0x4>
			f0: IMAGE_REL_ARM64_BRANCH26	bar
  f4:	97ffffff 	bl	fffffffffffffffc <bar\+0xfffffffffffffffc>
			f4: IMAGE_REL_ARM64_BRANCH26	bar
  f8:	97ffffc1 	bl	fffffffffffffffc <foo\+0xfffffffffffffff4>
  fc:	b4fff860 	cbz	x0, 8 <foo>
 100:	b4fff860 	cbz	x0, c <foo\+0x4>
 104:	b4fff800 	cbz	x0, 4 <.text\+0x4>
 108:	b4000000 	cbz	x0, 0 <bar>
			108: IMAGE_REL_ARM64_BRANCH19	bar
 10c:	b4000020 	cbz	x0, 4 <bar\+0x4>
			10c: IMAGE_REL_ARM64_BRANCH19	bar
 110:	b4ffffe0 	cbz	x0, fffffffffffffffc <bar\+0xfffffffffffffffc>
			110: IMAGE_REL_ARM64_BRANCH19	bar
 114:	b4fff740 	cbz	x0, fffffffffffffffc <foo\+0xfffffffffffffff4>
 118:	3607f780 	tbz	w0, #0, 8 <foo>
 11c:	3607f780 	tbz	w0, #0, c <foo\+0x4>
 120:	3607f720 	tbz	w0, #0, 4 <.text\+0x4>
 124:	36000000 	tbz	w0, #0, 0 <bar>
			124: IMAGE_REL_ARM64_BRANCH14	bar
 128:	36000020 	tbz	w0, #0, 4 <bar\+0x4>
			128: IMAGE_REL_ARM64_BRANCH14	bar
 12c:	3607ffe0 	tbz	w0, #0, fffffffffffffffc <bar\+0xfffffffffffffffc>
			12c: IMAGE_REL_ARM64_BRANCH14	bar
 130:	3607f660 	tbz	w0, #0, fffffffffffffffc <foo\+0xfffffffffffffff4>
 134:	90000040 	adrp	x0, 8000 <foo\+0x7ff8>
			134: IMAGE_REL_ARM64_PAGEBASE_REL21	.text
 138:	b0000040 	adrp	x0, 9000 <foo\+0x8ff8>
			138: IMAGE_REL_ARM64_PAGEBASE_REL21	.text
 13c:	f0000020 	adrp	x0, 7000 <foo\+0x6ff8>
			13c: IMAGE_REL_ARM64_PAGEBASE_REL21	.text
 140:	90000000 	adrp	x0, 0 <bar>
			140: IMAGE_REL_ARM64_PAGEBASE_REL21	bar
 144:	b0000000 	adrp	x0, 1000 <bar\+0x1000>
			144: IMAGE_REL_ARM64_PAGEBASE_REL21	bar
 148:	f0ffffe0 	adrp	x0, fffffffffffff000 <bar\+0xfffffffffffff000>
			148: IMAGE_REL_ARM64_PAGEBASE_REL21	bar
 14c:	90ffffe0 	adrp	x0, ffffffffffffc000 <foo\+0xffffffffffffbff8>
			14c: IMAGE_REL_ARM64_PAGEBASE_REL21	.text
 150:	10fff5c0 	adr	x0, 8 <foo>
 154:	30fff5a0 	adr	x0, 9 <foo\+0x1>
 158:	70fff560 	adr	x0, 7 <.text\+0x7>
 15c:	10000000 	adr	x0, 0 <bar>
			15c: IMAGE_REL_ARM64_REL21	bar
 160:	30000000 	adr	x0, 1 <bar\+0x1>
			160: IMAGE_REL_ARM64_REL21	bar
 164:	70ffffe0 	adr	x0, ffffffffffffffff <bar\+0xffffffffffffffff>
			164: IMAGE_REL_ARM64_REL21	bar
 168:	70fff4a0 	adr	x0, ffffffffffffffff <foo\+0xfffffffffffffff7>
 16c:	39002000 	strb	w0, \[x0, #8\]
			16c: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 170:	39003000 	strb	w0, \[x0, #12\]
			170: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 174:	39001000 	strb	w0, \[x0, #4\]
			174: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 178:	39000000 	strb	w0, \[x0\]
			178: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 17c:	39001000 	strb	w0, \[x0, #4\]
			17c: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 180:	393ff000 	strb	w0, \[x0, #4092\]
			180: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 184:	393ff000 	strb	w0, \[x0, #4092\]
			184: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 188:	79001000 	strh	w0, \[x0, #8\]
			188: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 18c:	79001800 	strh	w0, \[x0, #12\]
			18c: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 190:	79000800 	strh	w0, \[x0, #4\]
			190: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 194:	79000000 	strh	w0, \[x0\]
			194: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 198:	79000800 	strh	w0, \[x0, #4\]
			198: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 19c:	791ff800 	strh	w0, \[x0, #4092\]
			19c: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1a0:	791ff800 	strh	w0, \[x0, #4092\]
			1a0: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1a4:	b9000800 	str	w0, \[x0, #8\]
			1a4: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1a8:	b9000c00 	str	w0, \[x0, #12\]
			1a8: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1ac:	b9000400 	str	w0, \[x0, #4\]
			1ac: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1b0:	b9000000 	str	w0, \[x0\]
			1b0: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1b4:	b9000400 	str	w0, \[x0, #4\]
			1b4: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1b8:	b90ffc00 	str	w0, \[x0, #4092\]
			1b8: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1bc:	b90ffc00 	str	w0, \[x0, #4092\]
			1bc: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1c0:	f9000400 	str	x0, \[x0, #8\]
			1c0: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1c4:	f9000800 	str	x0, \[x0, #16\]
			1c4: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1c8:	f9000000 	str	x0, \[x0\]
			1c8: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1cc:	f9000000 	str	x0, \[x0\]
			1cc: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1d0:	f9000400 	str	x0, \[x0, #8\]
			1d0: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1d4:	f907fc00 	str	x0, \[x0, #4088\]
			1d4: IMAGE_REL_ARM64_PAGEOFFSET_12L	bar
 1d8:	f907fc00 	str	x0, \[x0, #4088\]
			1d8: IMAGE_REL_ARM64_PAGEOFFSET_12L	.text
 1dc:	91002000 	add	x0, x0, #0x8
			1dc: IMAGE_REL_ARM64_PAGEOFFSET_12A	.text
 1e0:	91002400 	add	x0, x0, #0x9
			1e0: IMAGE_REL_ARM64_PAGEOFFSET_12A	.text
 1e4:	91001c00 	add	x0, x0, #0x7
			1e4: IMAGE_REL_ARM64_PAGEOFFSET_12A	.text
 1e8:	91000000 	add	x0, x0, #0x0
			1e8: IMAGE_REL_ARM64_PAGEOFFSET_12A	bar
 1ec:	91000400 	add	x0, x0, #0x1
			1ec: IMAGE_REL_ARM64_PAGEOFFSET_12A	bar
 1f0:	913ffc00 	add	x0, x0, #0xfff
			1f0: IMAGE_REL_ARM64_PAGEOFFSET_12A	bar
 1f4:	913ffc00 	add	x0, x0, #0xfff
			1f4: IMAGE_REL_ARM64_PAGEOFFSET_12A	.text
