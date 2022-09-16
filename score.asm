SetupScore:
  
    
      lda #THREE_COPIES
      sta NUSIZ0
      sta NUSIZ1
      ; set horizontal position of player objects
      sta WSYNC
      SLEEP 26
      sta RESP0
      sta RESP1
      lda #$10
      sta HMP1
      sta WSYNC
      sta HMOVE
      SLEEP 24	; wait 24 cycles between write to HMOVE and HMxxx
      sta HMCLR

      lda #1
      sta VDELP0
      sta VDELP1


      jsr GetDigitPtrs
      rts

; Display the resulting 48x8 bitmap
; using the Digit0-5 pointers.
DrawDigits subroutine
	sta WSYNC
	SLEEP 40	; start near end of scanline
        lda #7
        sta LoopCount
BigLoop
	ldy LoopCount	; counts backwards
       	lda (Digit0),y	; load B0 (1st sprite byte
      ;  lda #0
        sta GRP0	; B0 -> [GRP0]
        ;lda #0
       	lda (Digit1),y	; load B1 -> A
        sta GRP1	; B1 -> [GRP1], B0 -> GRP0
        sta WSYNC	; sync to next scanline
        lda (Digit2),y	; load B2 -> A
        sta GRP0	; B2 -> [GRP0], B1 -> GRP1
        lda (Digit5),y	; load B5 -> A
        sta Temp	; B5 -> temp
        lda (Digit4),y	; load B4
        tax		; -> X
        lda (Digit3),y	; load B3 -> A
        ldy Temp	; load B5 -> Y
        sta GRP1	; B3 -> [GRP1]; B2 -> GRP0
        stx GRP0	; B4 -> [GRP0]; B3 -> GRP1
        sty GRP1	; B5 -> [GRP1]; B4 -> GRP0
        sta GRP0	; ?? -> [GRP0]; B5 -> GRP1
        
        
        dec LoopCount	; go to next line
	bpl BigLoop	; repeat until < 0
        
        lda #0		; clear the sprite registers
        sta GRP0
        sta GRP1
       ; sta GRP0
       ; sta GRP1
        rts
        
GetDigitPtrs: 

	lda isMoving
        sec
        sbc waitingToStart
        bne ShowScore
        
        lda frameCounter
        cmp #128
        bcs GetHighDigits
        
ShowScore:  

  	lda #$DD
        sta COLUP0
      	sta COLUP1
      
	ldx #0	; leftmost bitmap
        ldy #2	; start from most-sigificant BCD value
.Loop
        lda BCDScore,y	; get BCD value
        and #$f0	; isolate high nibble (* 16)
        lsr		; shift right 1 bit (* 8)
        sta Digit0,x	; store pointer lo byte
        lda #>FontTable
        sta Digit0+1,x	; store pointer hi byte
        inx
        inx		; next bitmap pointer
        lda BCDScore,y	; get BCD value (again)
        and #$f		; isolate low nibble
        asl
        asl
        asl		; * 8
        sta Digit0,x	; store pointer lo byte
        lda #>FontTable
        sta Digit0+1,x	; store pointer hi byte
        inx
        inx		; next bitmap pointer
        dey		; next BCD value
        bpl .Loop	; repeat until < 0
	rts

GetHighDigits:

	lda #$1E
      	sta COLUP0
      	sta COLUP1
        
	ldx #0	; leftmost bitmap
        ldy #2	; start from most-sigificant BCD value
.Loop2
        lda BCDHigh,y	; get BCD value
        and #$f0	; isolate high nibble (* 16)
        lsr		; shift right 1 bit (* 8)
        sta Digit0,x	; store pointer lo byte
        lda #>FontTable
        sta Digit0+1,x	; store pointer hi byte
        inx
        inx		; next bitmap pointer
        lda BCDHigh,y	; get BCD value (again)
        and #$f		; isolate low nibble
        asl
        asl
        asl		; * 8
        sta Digit0,x	; store pointer lo byte
        lda #>FontTable
        sta Digit0+1,x	; store pointer hi byte
        inx
        inx		; next bitmap pointer
        dey		; next BCD value
        bpl .Loop2	; repeat until < 0
	rts


