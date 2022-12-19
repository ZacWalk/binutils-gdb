
tmpdir/aarch64.x:     file format pei-aarch64-little


Disassembly of section .text:

0000000000002000 <__rt_psrelocs_end>:
	...

0000000000002008 <foo>:
    2008:	12345678 	and	w24, w19, #0xfffff003
    200c:	12345678 	and	w24, w19, #0xfffff003
    2010:	00002000 	udf	#8192
    2014:	00002000 	udf	#8192
    2018:	000021f8 	udf	#8696
    201c:	000021f8 	udf	#8696
    2020:	00002001 	udf	#8193
    2024:	00002001 	udf	#8193
    2028:	000021f9 	udf	#8697
    202c:	000021f9 	udf	#8697
    2030:	00001fff 	udf	#8191
    2034:	00001fff 	udf	#8191
    2038:	000021f7 	udf	#8695
    203c:	000021f7 	udf	#8695
    2040:	9abcdef0 	.inst	0x9abcdef0 ; undefined
    2044:	12345678 	and	w24, w19, #0xfffff003
    2048:	9abcdef0 	.inst	0x9abcdef0 ; undefined
    204c:	12345678 	and	w24, w19, #0xfffff003
    2050:	00002000 	udf	#8192
    2054:	00000000 	udf	#0
    2058:	00002000 	udf	#8192
    205c:	00000000 	udf	#0
    2060:	000021f8 	udf	#8696
    2064:	00000000 	udf	#0
    2068:	000021f8 	udf	#8696
    206c:	00000000 	udf	#0
    2070:	00002001 	udf	#8193
    2074:	00000000 	udf	#0
    2078:	00002001 	udf	#8193
    207c:	00000000 	udf	#0
    2080:	000021f9 	udf	#8697
    2084:	00000000 	udf	#0
    2088:	000021f9 	udf	#8697
    208c:	00000000 	udf	#0
    2090:	00001fff 	udf	#8191
    2094:	00000000 	udf	#0
    2098:	00001fff 	udf	#8191
    209c:	00000000 	udf	#0
    20a0:	000021f7 	udf	#8695
    20a4:	00000000 	udf	#0
    20a8:	000021f7 	udf	#8695
    20ac:	00000000 	udf	#0
    20b0:	00001008 	udf	#4104
    20b4:	000011f8 	udf	#4600
    20b8:	00001009 	udf	#4105
    20bc:	000011f9 	udf	#4601
    20c0:	00001007 	udf	#4103
    20c4:	000011f7 	udf	#4599
    20c8:	17ffffd0 	b	2008 <foo>
    20cc:	17ffffd0 	b	200c <foo\+0x4>
    20d0:	17ffffcd 	b	2004 <__rt_psrelocs_end\+0x4>
    20d4:	14000049 	b	21f8 <bar>
    20d8:	14000049 	b	21fc <bar\+0x4>
    20dc:	14000046 	b	21f4 <foo\+0x1ec>
    20e0:	97ffffca 	bl	2008 <foo>
    20e4:	97ffffca 	bl	200c <foo\+0x4>
    20e8:	97ffffc7 	bl	2004 <__rt_psrelocs_end\+0x4>
    20ec:	94000043 	bl	21f8 <bar>
    20f0:	94000043 	bl	21fc <bar\+0x4>
    20f4:	94000040 	bl	21f4 <foo\+0x1ec>
    20f8:	97ffffc1 	bl	1ffc <__ImageBase\+0xffc>
    20fc:	b4fff860 	cbz	x0, 2008 <foo>
    2100:	b4fff860 	cbz	x0, 200c <foo\+0x4>
    2104:	b4fff800 	cbz	x0, 2004 <__rt_psrelocs_end\+0x4>
    2108:	b4000780 	cbz	x0, 21f8 <bar>
    210c:	b4000780 	cbz	x0, 21fc <bar\+0x4>
    2110:	b4000720 	cbz	x0, 21f4 <foo\+0x1ec>
    2114:	b4fff740 	cbz	x0, 1ffc <__ImageBase\+0xffc>
    2118:	3607f780 	tbz	w0, #0, 2008 <foo>
    211c:	3607f780 	tbz	w0, #0, 200c <foo\+0x4>
    2120:	3607f720 	tbz	w0, #0, 2004 <__rt_psrelocs_end\+0x4>
    2124:	360006a0 	tbz	w0, #0, 21f8 <bar>
    2128:	360006a0 	tbz	w0, #0, 21fc <bar\+0x4>
    212c:	36000640 	tbz	w0, #0, 21f4 <foo\+0x1ec>
    2130:	3607f660 	tbz	w0, #0, 1ffc <__ImageBase\+0xffc>
    2134:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    2138:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    213c:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    2140:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    2144:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    2148:	90000000 	adrp	x0, 2000 <__rt_psrelocs_end>
    214c:	f0ffffe0 	adrp	x0, 1000 <__ImageBase>
    2150:	10fff5c0 	adr	x0, 2008 <foo>
    2154:	30fff5a0 	adr	x0, 2009 <foo\+0x1>
    2158:	70fff560 	adr	x0, 2007 <__rt_psrelocs_end\+0x7>
    215c:	100004e0 	adr	x0, 21f8 <bar>
    2160:	300004c0 	adr	x0, 21f9 <bar\+0x1>
    2164:	70000480 	adr	x0, 21f7 <foo\+0x1ef>
    2168:	70fff4a0 	adr	x0, 1fff <__ImageBase\+0xfff>
    216c:	39002000 	strb	w0, \[x0, #8\]
    2170:	39003000 	strb	w0, \[x0, #12\]
    2174:	39001000 	strb	w0, \[x0, #4\]
    2178:	3907e000 	strb	w0, \[x0, #504\]
    217c:	3907f000 	strb	w0, \[x0, #508\]
    2180:	3907d000 	strb	w0, \[x0, #500\]
    2184:	393ff000 	strb	w0, \[x0, #4092\]
    2188:	79001000 	strh	w0, \[x0, #8\]
    218c:	79001800 	strh	w0, \[x0, #12\]
    2190:	79000800 	strh	w0, \[x0, #4\]
    2194:	7903f000 	strh	w0, \[x0, #504\]
    2198:	7903f800 	strh	w0, \[x0, #508\]
    219c:	7903e800 	strh	w0, \[x0, #500\]
    21a0:	791ff800 	strh	w0, \[x0, #4092\]
    21a4:	b9000800 	str	w0, \[x0, #8\]
    21a8:	b9000c00 	str	w0, \[x0, #12\]
    21ac:	b9000400 	str	w0, \[x0, #4\]
    21b0:	b901f800 	str	w0, \[x0, #504\]
    21b4:	b901fc00 	str	w0, \[x0, #508\]
    21b8:	b901f400 	str	w0, \[x0, #500\]
    21bc:	b90ffc00 	str	w0, \[x0, #4092\]
    21c0:	f9000400 	str	x0, \[x0, #8\]
    21c4:	f9000800 	str	x0, \[x0, #16\]
    21c8:	f9000000 	str	x0, \[x0\]
    21cc:	f900fc00 	str	x0, \[x0, #504\]
    21d0:	f9010000 	str	x0, \[x0, #512\]
    21d4:	f900f800 	str	x0, \[x0, #496\]
    21d8:	f907fc00 	str	x0, \[x0, #4088\]
    21dc:	91002000 	add	x0, x0, #0x8
    21e0:	91002400 	add	x0, x0, #0x9
    21e4:	91001c00 	add	x0, x0, #0x7
    21e8:	9107e000 	add	x0, x0, #0x1f8
    21ec:	9107e400 	add	x0, x0, #0x1f9
    21f0:	9107dc00 	add	x0, x0, #0x1f7
    21f4:	913ffc00 	add	x0, x0, #0xfff

00000000000021f8 <bar>:
    21f8:	9abcdef0 	.inst	0x9abcdef0 ; undefined
    21fc:	12345678 	and	w24, w19, #0xfffff003

0000000000002200 <__CTOR_LIST__>:
    2200:	ffffffff 	.inst	0xffffffff ; undefined
    2204:	ffffffff 	.inst	0xffffffff ; undefined
	...

0000000000002210 <__DTOR_LIST__>:
    2210:	ffffffff 	.inst	0xffffffff ; undefined
    2214:	ffffffff 	.inst	0xffffffff ; undefined
	...
