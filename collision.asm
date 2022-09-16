
CheckCollision:
		
                lda collisionY
                bne NoCollision
                
                lda #%10000000
                bit CXPPMM	; collision between player 0 and ball?
                beq NoCollision

PlayerCollision:
		
		sta CXCLR
		
		sty collisionY
                
NoCollision:	
                
                rts

CheckHitBlock:

                ldx collisionY
                beq NoCollision2
                cpx #VERTICAL_CENTER_OF_SCREEN / 2 - 1
                bcc CheckBottom
              	
   		
                ldy #VERTICAL_CENTER_OF_SCREEN / 2 - 1
              	lda spriteYPosition
               	sec
               	sbc topObstacleY
               	bmi IsCollision
                
               	cmp #4
               	bcs NoCollision2
                
                jmp IsCollision
                
               ; jmp NoCollision2
                

CheckBottom:

	       lda bottomObstacleY
               sec
               sbc bottomYPosition
               bmi IsCollision
                 
               cmp #3
              
               
               
               bcs NoCollision2
               
                
IsCollision:
                
               lda #0
               sta isMoving
               
               lda BCDScore + 2
               cmp BCDHigh + 2
               bcc NoHighScore
               beq CheckMid
               
               jmp IsHigh
               
               
               
CheckMid:              
		lda BCDScore + 1
                cmp BCDHigh + 1
                bcc NoHighScore
                beq CheckLow

		jmp IsHigh
                
                lda BCDScore
                cmp BCDHigh
                bcs IsHigh
                
                jmp NoHighScore

CheckLow:

IsHigh:		lda BCDScore
		sta BCDHigh
                lda BCDScore + 1
                sta BCDHigh + 1
                lda BCDScore + 2
                sta BCDScore + 2

NoHighScore:
               ; lda #30
                ;sta COLUBK
                
                ;jmp PlayerCollision
                
NoCollision2:	

                rts

