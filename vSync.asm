
		
;------------------------------------------------
; Start Frame
;------------------------------------------------

StartOfFrame:
		
;------------------------------------------------
; Vertical Sync (3 scanlines)
;------------------------------------------------
		
                lda #0
                sta COLUBK
                
		lda #2
		sta VSYNC		; turn on VSYNC (VSYNC=2 (%00000010))


VSync3:

		sta WSYNC 
                sta WSYNC
               	sta WSYNC
                
		lda #0
		sta VSYNC
                sta GRP0
                sta collisionY
             