; -------------------------------------------------------------------
; this file is intended to be assembled and linked with the cc65 toolchain.
; It has not been tested with any other assemblers or linkers.
; -------------------------------------------------------------------

.import decrunch
.export get_crunched_byte
.export exodecrunch

; start exomizer decruncher
; X=lo Y=hi of end_of_data (directly after)
exodecrunch:
	stx _byte_lo
	sty _byte_hi
	jmp decrunch

; -------------------------------------------------------------------
get_crunched_byte:
	lda _byte_lo
	bne _byte_skip_hi
	dec _byte_hi
_byte_skip_hi:
	dec _byte_lo
_byte_lo = * + 1
_byte_hi = * + 2
	lda $ffff		; exodecrunch inits this
	rts

; -------------------------------------------------------------------
