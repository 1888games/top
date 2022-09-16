
                processor 6502


                SEG.U vars	; the label "vars" will appear in our symbol table's segment list
                ORG $80		; start of RAM

                include "zeropage.asm"
                include "constants.asm"
                include "vcs.h"
                include "macro.h"

;------------------------------------------------
; Start of ROM binary
;------------------------------------------------

		SEG     	; end of uninitialised segment
		ORG $F000

Reset:

                include "newGame.asm"  
 
		include "vSync.asm"
		include "vBlank.asm"
		include "musicPlayer.asm"
             	include "displayScore.asm"
 
		include "gameKernal.asm"
                include "middleSplit.asm"
                include "topHalf.asm"
                include "bottomHalf.asm"
                
		include "overscan.asm"
		include "control.asm"
		include "verticalMove.asm"       	
		include "endFrame.asm"


                include "functions.asm"
                include "collision.asm"
                include "score.asm"
		include "obstacles.asm"

		include "musicData.asm"
		include "graphics.asm"    
                		
		include "vectors.asm"
		


	

