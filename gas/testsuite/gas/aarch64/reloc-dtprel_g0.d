#objdump: -dr
#notarget: *-*-pe* *-*-mingw*

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
   0:	d2800009 	mov	x9, #0x0.*
			0: R_AARCH64_(P32_|)TLSLD_MOVW_DTPREL_G0	x
