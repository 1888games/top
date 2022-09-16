TopHalf:						;9
			
                ;sta HMOVE
                
		cpy spriteYPosition			;12
                beq ActivatePlayer			;14
		bcs NothingTop				;16
               
               	jmp SkipActivatePlayer			;19
                
ActivatePlayer:						;14
                
		lda #SPRITE_HEIGHT-1			;16
		sta currentSpriteLine			;19
SkipActivatePlayer					;19 
									
		lda currentSpriteLine			;22
		bmi IsTopLine				;24
								
		ldx animFrameLineCtr			;27
		lda SpriteGraphicTable,x		;31
		sta GRP0				;34
               
               ;
				
		dec currentSpriteLine			;39
		dec animFrameLineCtr			;44
            	
    
               	sta WSYNC				;47
             
                 
TopObstacle:
		
                cpy topObstacleY
                bcs NoObstacle
                
                lda topObstacleX
                cmp #152  
               	bcs NoObstacle             
         
            
                lda #%01111110
                sta GRP1
      
NoObstacle:
                
                
                jmp EndDrawing			;3
         
        
IsTopLine:						;24
	
        
               	lda #%00000010
               	sta ENAM0
                
                lda #0
                sta RESMP0  

                jmp Exit;26
              
NothingTop:	
		lda #0
Exit:
                sta GRP0				;21
                sta WSYNC				;24
                jmp TopObstacle
                ;3
                