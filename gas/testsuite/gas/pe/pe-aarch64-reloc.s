
.text

// IMAGE_REL_ARM64_ADDR32
.Linfo_foo:
	.asciz "foo"
	.long foo

// IMAGE_REL_ARM64_ADDR64
.globl struc
struc:
	.quad arr

func:
	// IMAGE_REL_ARM64_BRANCH26
	b target

	// IMAGE_REL_ARM64_PAGEBASE_REL21
	adrp x0, foo

	// IMAGE_REL_ARM64_PAGEOFFSET_12A
	add x0, x0, :lo12:foo

	// IMAGE_REL_ARM64_PAGEOFFSET_12L
	ldr x0, [x0, :lo12:foo]

bar:
	// IMAGE_REL_ARM64_PAGEBASE_REL21, even if the symbol offset is known
	adrp x0, bar
	adrp x0, foo + 0x12345

	// IMAGE_REL_ARM64_SECREL
	.secrel32 .Linfo_bar
	.Linfo_bar:

	// IMAGE_REL_ARM64_SECTION
	.secidx func

baz:
	// IMAGE_REL_ARM64_PAGEOFFSET_12A
	add x0, x0, :lo12:foo
	add x0, x0, :lo12:foo + 0x12345

	// IMAGE_REL_ARM64_PAGEOFFSET_12A
	ldrb w0, [x0, :lo12:foo + 0x12345]
	ldr x0, [x0, :lo12:foo + 0x12348]
	ldr x0, [x0, :lo12:foo]

	// IMAGE_REL_ARM64_REL21
	adr x0, foo + 0x12345

	// IMAGE_REL_ARM64_BRANCH19
	bne target

	// IMAGE_REL_ARM64_BRANCH14
	tbz x0, #0, target
