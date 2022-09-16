
		;--See if the fire button was pressed--
		;		
		lda #%10000000			; read button input
		bit INPT4
		bne ButtonNotPressed	; skip if button not pressed
	
ButtonNotPressed

		
		bit INPT4	; read button
        	bmi NoFireButton ; bit 7 set?
                
                lda waitingToStart
                bne NoMovingCheck
                
                lda isMoving
                bne NoFireButton
                
NoMovingCheck:
                
                		
                inc restarting
                
                lda #0
                sta waitingToStart
               
                
NoFireButton:               
			
		;--Check Joystick for Vertical Motion--
		;
CheckV		lda #%00100000
		bit SWCHA
		beq Down
		lsr
		bit SWCHA
		beq Up
		jmp Overscan
		
Down		ldx spriteYPosition
		cpx #MIN_Y_TOP
		beq Overscan
                ; if we're at the bottom of the screen goto Overscan
		;DOWN_DIST_MACRO		; else move down
                ;DOWN_DIST_MACRO
                
                lda isJumping
                beq NoSlam
                
SlamDown:
                
                lda #1
                sta didSlam
                
                lda topVelocityMSB
                sec
                sbc #5
                sta topVelocityMSB
                
                
NoSlam:

		jmp Overscan

Up		lda isJumping 
		beq StartJump
                
                     
                lda spriteYPosition
                cmp #88
                bcs Overscan
               	
                lda topVelocityLSB
                clc
                adc #32
                sta topVelocityLSB
                
                lda topVelocityMSB
                adc #0
                sta topVelocityMSB	
                
                jmp Overscan
             
                                            
StartJump:
		
                lda #2
                sta topVelocityMSB
                
                lda #12
                sta topVelocityLSB
                sta isJumping
                
                lda spriteYPosition
                sta jumpPeak
                
                lda #0
                sta didSlam
                
                lda isBumped
                beq Overscan
                
                lda bottomVelocityMSB
                sec
                sbc #6
                sta bottomVelocityMSB
                
           
                