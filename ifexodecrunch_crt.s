; -------------------------------------------------------------------
; this file is intended to be assembled and linked with the cc65 toolchain.
; It has not been tested with any other assemblers or linkers.
; -------------------------------------------------------------------

; This is a modified version that puts "get_crunched_byte" into the ZP at $50

.import decrunch
.export get_crunched_byte : absolute = $50
.export exodecrunch

; start exomizer decruncher
; X=lo Y=hi of end_of_data (directly after)
exodecrunch:
    stx $59
    sty $5a
    ldx #$60
    stx $5b
    ldx #get_crunched_byte_code_end-get_crunched_byte_code-1
loop:
    ldy get_crunched_byte_code,x
    sty $50,x
    dex
    bpl loop
    jmp decrunch

; -------------------------------------------------------------------
get_crunched_byte_code: ; (assembled at $50)
    ;     $50   1   2   3   4   5   6   7   8   9   A   B
    .byte $a5,$59,$d0,$02,$c6,$5a,$c6,$59,$ad;,$00,$00,$60
get_crunched_byte_code_end:

;   lda _byte_lo
;   bne _byte_skip_hi
;   dec _byte_hi
; _byte_skip_hi:
;   dec _byte_lo
; _byte_lo = * + 1
; _byte_hi = * + 2
;   lda $0000 ; exodecrunch inits this
;   rts

; -------------------------------------------------------------------
