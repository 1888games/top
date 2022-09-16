

;------------------------------------------------
; Variables
;------------------------------------------------

spriteYPosition:	ds 1	; 192 is at the top of the screen, the constant VALUE_OF_Y_AT_SCREEN_BOTTOM gives us the bottom.
currentSpriteLine:	ds 1	; (0 &lt;= currentSpriteLine &lt; SPRITE_HEIGHT) for each frame
animFrameLineCtr:	ds 1
faceDelay:		ds 1
hPositionIndex:		ds 1
faceDuration:		ds 1
bottomYPosition:	ds 1
bottomSpriteLine: 	ds 1
animFrameLineCtr2:	ds 1
isJumping:		ds 1
ground0:		ds 1
ground1:		ds 1
ground2:		ds 1
frameCounter		ds 1
topObstacleX		ds 1
topObstacleY		ds 1
bottomObstacleX		ds 1
bottomObstacleY		ds 1
topVelocityLSB		ds 1
topVelocityMSB		ds 1
bottomVelocityLSB	ds 1
bottomVelocityMSB	ds 1
spriteYPosLSB		ds 1
jumpPeak		ds 1
isBumped		ds 1
bottomYPosLSB		ds 1
didSlam			ds 1
topObstacleRepeat	ds 1
bottomObstacleRepeat	ds 1
topObstacleCount	ds 1
bottomObstacleCount  	ds 1
temp1			ds 1
temp2			ds 1
Temp			ds 1
LoopCount		ds 1
Digit0			word 1
Digit1			word 1
Digit2			word 1
Digit3			word 1
Digit4 			word 1
Digit5			word 1
isMoving		ds 1
restarting		ds 1
collisionY		ds 1
Rand8			ds 1
topObstacleSpawned 	ds 1
bottomObstacleSpawned	ds 1
topObstacleRepeatType	ds 1
bottomObstacleRepeatType ds 1
waitingToStart		ds 1
scoreWhenCleared	ds 1
scoreToAdd		ds 1
tt_timer                ds 1    ; current music timer value
tt_cur_pat_index_c0     ds 1    ; current pattern index into tt_SequenceTable
tt_cur_pat_index_c1     ds 1
tt_cur_note_index_c0    ds 1    ; note index into current pattern
tt_cur_note_index_c1    ds 1
tt_envelope_index_c0    ds 1    ; index into ADSR envelope
tt_envelope_index_c1    ds 1
tt_cur_ins_c0           ds 1    ; current instrument
tt_cur_ins_c1           ds 1
player_time_max         ds 1
tt_ptr                  ds 2
obstacleColourTop	ds 1
obstacleColourBottom 	ds 1

BCDScore		hex 000000
BCDHigh			hex 101300

