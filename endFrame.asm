		
 
Scroll:		
		 inc frameCounter
		lda isMoving
                bne DoScroll
                
                
                jmp EndScrolling 
DoScroll:

                
               
                lda frameCounter
                and #%00000011
                beq CanScroll
                
                jmp NotScroll
 
CanScroll:
                        
		lda topObstacleY
               	beq NoWrapTop
                
                lda topObstacleX
                sec
                sbc #4
     		sta topObstacleX
 
                bcs NoWrapTop
               
OffscreenTop:               
                dec topObstacleCount
                beq EndTop
                
                lda topObstacleRepeatType
                pha
                tax
                lda Gap,x
            
                sta temp1
                pla
                asl
                asl
                clc
                adc topObstacleCount
                 
                tax
                dex
               
                lda topObstacleX
                clc
                adc temp1
               	sta topObstacleX
                    
                lda CloseNusiz,x
                sta topObstacleRepeat
               
      
                jmp NoWrapTop
                
 
EndTop:
		lda #0
                sta topObstacleY
                jmp NoSpawnTop
NoWrapTop:
		lda topObstacleSpawned
                cmp topObstacleCount
                beq NoSpawnTop
               	bcs NoSpawnTop
                
               	ldx topObstacleRepeatType
               	bmi NoSpawnTop
                       
                lda topObstacleSpawned
                cmp #2
                bcs Dist2a 
                lda Distance,x
               	jmp CompareTop
                
Dist2a:
		lda Distance2,x
                
CompareTop:	
   		cmp topObstacleX
                bcc NoSpawnTop
                
                txa
                asl
                asl
               	clc
                adc topObstacleSpawned
                tax
                
                lda CloseNusiz,x
                sta topObstacleRepeat
                
                inc topObstacleSpawned
               

NoSpawnTop:

		lda bottomObstacleY
                beq NoWrapBottom
                
                lda bottomObstacleX
                sec
                sbc #4
                sta bottomObstacleX
                
                bcs NoWrapBottom
                
                dec bottomObstacleCount
                beq EndBottom
                
                lda bottomObstacleRepeatType
                pha
                tax
                lda Gap,x
                sta temp1
                pla
                asl
                asl
                clc
                adc bottomObstacleCount
                 
                tax
                dex
               
                lda bottomObstacleX
                clc
                adc temp1
               	sta bottomObstacleX
                
                
                lda CloseNusiz,x
                sta bottomObstacleRepeat

                jmp NoWrapBottom
                
EndBottom:

		lda #0
                sta bottomObstacleY
                
                jmp NoSpawnBottom

NoWrapBottom:
            	
                lda bottomObstacleSpawned
                cmp bottomObstacleCount
                beq NoSpawnBottom
                bcs NoSpawnBottom
                
                ldx bottomObstacleRepeatType
                bmi NoSpawnBottom
                
                lda bottomObstacleSpawned
                cmp #2
                bcs Dist2 
                lda Distance,x
               	jmp CompareBot
                
Dist2:
		lda Distance2,x
                
CompareBot:	
                cmp bottomObstacleX
                bcc NoSpawnBottom
                txa
                asl
                asl
                clc
                adc bottomObstacleSpawned
                tax
                
                lda CloseNusiz,x
                sta bottomObstacleRepeat
                
                inc bottomObstacleSpawned
NoSpawnBottom:            
                sta WSYNC
                
        	lda ground0
                lsr
                bcc NoAdd
                
                adc #127
               
NoAdd:          
               	
                sta ground0
                
                lda ground1
                asl
                adc #0
                sta ground1
                
                lda waitingToStart
                bne EndScrolling

                ldx scoreToAdd
                ldy #0 
                sty scoreToAdd
                lda #10
             	jsr AddScore
NotScroll:
		
              
                
EndScrolling:	
	
        	lda restarting
                beq NoRestart
                
                TIMER_WAIT
                jmp Initialise
 
 
NoRestart:
               ; jsr AddScore
                ; A = 1st BCD digit
; X = 2nd BCD digit
; Y = 3rd BCD digit
   
		jsr CheckHitBlock

		TIMER_WAIT

                ;lda INTIM			;2
                ;bne NoBumped	;2+
                ;sta WSYNC			;3

                jmp StartOfFrame
                