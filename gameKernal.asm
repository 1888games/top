

;------------------------------------------------
; Picture (192 scanlines)
;------------------------------------------------		
        	
		

ResetForGame:	
				  
		
                lda #2
                sta RESMP0  
                
                lda obstacleColourTop              
                sta COLUP1         
                
                
           
       		; Start our scanline count (gets decremented)
		ldy #KERNEL_LINES
GameKernal:							;3
		
               
               ; sta HMOVE
             
           	;stY COLUBK
                
		cpy #VERTICAL_CENTER_OF_SCREEN / 2 - 1 	;5
                beq MiddleLine				;7 
  	
                bcs TopHalf				;9
                jmp BottomHalf				;12
                
              
