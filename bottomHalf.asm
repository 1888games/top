
   
     
IsBottomLine:		 				;24
		
               	lda #%00000010
                sta ENAM0
                
                lda #0
                sta RESMP0
                
              
              
                ;sta WSYNC				;32
                jmp BottomObstacle			;3
                

NothingBottom:	
		lda #0					;18
                sta GRP0				;21
                sta WSYNC				;24
                jmp BottomObstacle			;3
            
BottomHalf:	
               
                
                cpy bottomYPosition
                beq ActivateBottom
                bcs IsBottomLine
                
                lda #2
                sta RESMP0
                
                jmp SkipActivateBottom
               
ActivateBottom:             
		lda #SPRITE_HEIGHT -1	
		sta bottomSpriteLine	
                           	
                
SkipActivateBottom:

				
		lda bottomSpriteLine
		bmi NothingBottom
                
                
								
		ldx animFrameLineCtr2		
		lda Frame4,x	
		sta GRP0			
				
		dec bottomSpriteLine		
		dec animFrameLineCtr2
                
                sta WSYNC
                
BottomObstacle:

		lda bottomObstacleY
                beq NoBottomObstacle
                
                cpy bottomObstacleY
                bcc NoBottomObstacle
               
 
                
		lda bottomObstacleX
                cmp #156
                bcs NoBottomObstacle
               	beq NoBottomObstacle
                
               
                
                lda #%01111110
                sta GRP1

    
                jmp EndDrawing
NoBottomObstacle:
                
                lda #0
                sta GRP1
                                
               
                
                jmp EndDrawing
                
                                
EndDrawing:
                
		dey
                beq Finished
                
               
                
                jsr CheckCollision
                
                lda #0
                sta HMP0
                sta WSYNC
                ;sta HMOVE
                
               
                
                jmp GameKernal