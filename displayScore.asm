	            
VerticalBlank	
		TIMER_WAIT

VisibleScreen:
                TIMER_SETUP 17
                
                lda #3
                sta COLUBK
                
                jsr DrawDigits
                
                sta WSYNC
               
                lda #12
                sta COLUBK
                sta WSYNC

                lda #0
                sta COLUBK
               
                lda #0
        	sta VDELP0
        	sta VDELP1
                sta GRP0
                sta GRP1         
                sta NUSIZ0
     
            	lda #ROAD_COLOUR
            	sta COLUPF
  	       
                lda #TOP_COLOUR
                sta COLUP0
   
                lda #%00000010
               	sta RESMP0
                sta ENAM0
                
               
             
		ldx #OBSTACLE_SPRITE
                lda topObstacleX
                jsr placeSprite   

                ldx #PLAYER_SPRITE
                lda hPositionIndex
                jsr placeSprite
                	
               	sta WSYNC
                sta HMOVE
                       
SetupObstacleCount:

                lda topObstacleRepeat
                sta NUSIZ1
                
                TIMER_WAIT
                
                TIMER_SETUP 180
		