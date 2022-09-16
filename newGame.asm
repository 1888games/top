           CLEAN_START
             
             lda #1
             sta waitingToStart
             
              lda INTIM       ; unknown value
           	sta Rand8       ; use as seed
            	bne SeedOk

            	inc Rand8
                
             
Initialise:
		
           
SeedOk:		
        lda #0
        sta tt_cur_pat_index_c0
        lda #43
        sta tt_cur_pat_index_c1

        
            lda #PLAYER_X
            sta hPositionIndex	; initial x pos

            lda #GROUND_TOP
            sta spriteYPosition	; initial y pos

            lda #GROUND_BOTTOM
            sta bottomYPosition

            lda #TOP_COLOUR
            sta COLUP0


            lda #0 
            sta topObstacleX	; initial y pos
            sta bottomObstacleX
            
           ; jsr GetRandomObstacle 
		
            inc isMoving
            

            lda #0
            sta isJumping
            sta topVelocityMSB
            sta topVelocityLSB
            sta bottomVelocityLSB
            sta bottomVelocityMSB
            sta isBumped
            sta restarting
            sta topObstacleSpawned
            sta bottomObstacleSpawned
            sta BCDScore
            sta BCDScore + 1
            sta BCDScore + 2
            sta bottomObstacleCount
            sta topObstacleCount
            sta scoreWhenCleared
            sta scoreToAdd
           
 

            lda #%01110111
            sta ground0

            lda #%11101110
            sta ground1
            sta ground2

            lda #FACE_DURATION
            sta faceDuration
            sta faceDelay
            