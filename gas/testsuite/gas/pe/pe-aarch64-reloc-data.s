func:	
	ret
	
.L1:		
	.balign 2
	.hword	local-.L1
	.hword	0xffff
	.balign 4
	.word	local-.L1
	.word	0xffffffff
	.balign 8
	.xword	local-.L1
	.xword	0xffffffffffffffff
	.xword	local+0x12345600 // IMAGE_REL_ARM64_ADDR64
	.xword	0xffffffffffffffff
	
	.balign 2
	.hword	0xffff
	.balign 4
	.word	global-.L1 // IMAGE_REL_ARM64_REL32
	.word	0xffffffff
	.balign 8
	.xword	global-.L1 // IMAGE_REL_ARM64_REL32
	.xword	0xffffffffffffffff
	.xword	global+0x12345678 // IMAGE_REL_ARM64_ADDR64
	.xword	0xffffffffffffffff
	
local:
