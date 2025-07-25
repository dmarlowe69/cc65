;
; Ullrich von Bassewitz, 26.10.2000
;
; CC65 runtime: Push value in a onto the stack
;

        .export         pusha0sp, pushaysp, pusha
        .importzp       c_sp

; Beware: The optimizer knows about this function!

pusha0sp:
        ldy     #$00
pushaysp:
        lda     (c_sp),y
pusha:  ldy     c_sp            ; (3)
        beq     @L1             ; (6)
        dec     c_sp            ; (11)
        ldy     #0              ; (13)
        sta     (c_sp),y        ; (19)
        rts                     ; (25)

@L1:    dec     c_sp+1          ; (11)
        dec     c_sp            ; (16)
        sta     (c_sp),y        ; (22)
        rts                     ; (28)

