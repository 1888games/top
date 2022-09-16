           
MiddleLine:	
		
               
		
                
		lda ground0				;10	
                sta PF2					;13
                sta PF0					;16   
                
                lda ground1				;19
                sta PF1	              
                
                lda #0
                sta GRP0
                sta GRP1
                sta NUSIZ0
                
                lda obstacleColourBottom  
                sta COLUP1
                
        
                lda #%00000010
                sta RESMP0    

                ldx #1
                lda bottomObstacleX
                jsr placeSprite         
               
                sta WSYNC
                sta HMOVE
              	
                lda #42					;42
               	sta COLUP0
                
                dey	
                
                lda bottomObstacleRepeat
                sta NUSIZ1
                               
                lda bottomObstacleX
                cmp #90
                bcs DontDouble
                     
                sta WSYNC
                
                
DontDouble:
               
                lda #0					;28	
                sta PF1					;31
                sta PF2					;34
                sta PF0					;37
                sta WSYNC
               		
                jmp GameKernal	
                
                	
                
                