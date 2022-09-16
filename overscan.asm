
Finished:	
		;sta WSYNC
		;lda #3
                ;sta COLUBK
          
          	;sta WSYNC
               
                TIMER_WAIT
                
            
		lda #%00000010				;2
		sta VBLANK           		;3 end of screen - enter blanking
                
                
;------------------------------------------------
; Overscan (30 scanlines)
;----------------------------- -------------------
		TIMER_SETUP 25
                
          
		;lda #36			;2
		;sta TIM64T			;3 36*64 intervals == 2304 cycles == 30.3 scanlines
		
		; Manage the frame delay between face animations.
		;
StartFaceStuff
		dec faceDelay			;	faceDelay -= 1
		lda faceDelay			;
		beq ResetFaceDelay		;	if (faceDelay == 0) then goto ResetFaceDelay
		lda animFrameLineCtr	;	&lt;-else force another frame of the current face
		clc						;	by bringing the animFrameLineCtr where
		adc #SPRITE_HEIGHT		;	it was at the start of this frame.
		sta animFrameLineCtr	;	(i.e. add SPRITE_HEIGHT to it)
                sta animFrameLineCtr2
		jmp EndFaceStuff
ResetFaceDelay
		lda faceDuration
		sta faceDelay			;	faceDelay = faceDuration
EndFaceStuff

			
		lda #FACE_DURATION
		sta faceDuration
                
              