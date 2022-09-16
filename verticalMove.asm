
Overscan
		
ProcessVelocityTop:
		
                lda isJumping
                beq NoVelocity
           

		lda topVelocityLSB
                sec
                sbc #GRAVITY
                sta topVelocityLSB
                
                lda topVelocityMSB
                sbc #0
                sta topVelocityMSB
               
       		lda spriteYPosLSB
                clc
                adc topVelocityLSB
                sta spriteYPosLSB
                
                lda spriteYPosition
                adc topVelocityMSB
                sta spriteYPosition
                cmp jumpPeak
                bcc Falling
                
                sta jumpPeak
                
Falling:
                
                cmp #GROUND_TOP
                bcc HitGround
                
                jmp NoVelocity
                
HitGround:
                
                lda #GROUND_TOP
                sta spriteYPosition
                
                lda #0
                sta isJumping
                sta topVelocityMSB
                sta topVelocityLSB
                
                lda didSlam
                beq NoVelocity
     
                inc isBumped
                
                lda jumpPeak   
                sec
                sbc #$39
                lsr
                lsr
                lsr
                clc
                adc #1
                sta bottomVelocityMSB
               
                
DontBoost:
              
 		lda jumpPeak
                ;lsr
               	clc
                adc #10
            
               	sta bottomVelocityLSB
                
                lda bottomVelocityMSB
                cmp #4
                bcc NoVelocity
                
                lda #3
                sta bottomVelocityMSB
                
                lda #180
                sta bottomVelocityLSB
            


NoVelocity:
ProcessVelocityBottom:

		lda isBumped
                beq NoBumped
                
                lda bottomVelocityLSB
                sec
                sbc #GRAVITY
                sta bottomVelocityLSB
                
                lda bottomVelocityMSB
                sbc #0
                sta bottomVelocityMSB
               
       		lda bottomYPosLSB
                sec
                sbc bottomVelocityLSB
                sta bottomYPosLSB
                
                lda bottomYPosition
                sbc bottomVelocityMSB
                sta bottomYPosition
    
                
                cmp #GROUND_BOTTOM
                bcs HitGround2
                
                jmp NoBumped
                
HitGround2:
                
                lda #GROUND_BOTTOM
                sta bottomYPosition
                
                lda #0
                sta isBumped
                sta bottomVelocityMSB
                sta bottomVelocityLSB
                
                
                
                
NoBumped:	