;NUSIZ0 = %xxxxx000 -- one copy of player 0 and missile 0; player 0 single-width
;NUSIZ0 = %xxxxx101 -- one copy of player 0 and missile 0; player 0 double-width
;NUSIZ0 = %xxxxx111 -- one copy of player 0 and missile 0; player 0 quadruple-width
 
;NUSIZ0 = %xxxxx001 -- two closely-spaced copies of player 0 and missile 0; player 0 single-width
;NUSIZ0 = %xxxxx010 -- two medium-spaced copies of player 0 and missile 0; player 0 single-width
;NUSIZ0 = %xxxxx100 -- two widely-spaced copies of player 0 and missile 0; player 0 single-width
 
;NUSIZ0 = %xxxxx011 -- three closely-spaced copies of player 0 and missile 0; player 0 single-width
;NUSIZ0 = %xxxxx110 -- three medium-spaced copies of player 0 and missile 0; player 0 single-width

ONE = %00000000
TWC = %00000001
TWM = %00000010
TWW = %00000100 
THC = %00000011
THM = %00000110
NON = 0
DOU = %00000101
TRI = %00000111

CLO = 0 
MED = 1
WID = 2 

CloseNusiz:	.byte 0, 1, 3, 0
MedNusiz:	.byte 0, 2, 6, 0
WideNusiz:	.byte 0, 4 
Distance:	.byte 160 - 20, 160 - 36   , 160 - 68
Distance2:	.byte 160 - 40 , 160 - 72 , 160 - 99 
Gap:		.byte 16, 30, 64

HT1 = 10
HT2 = 20 
HT3 = 27 
HT4 = 31

NOR = 255
			;     	      000  001. 002. 003  004  005. 006. 007. 008. 009  010. 011. 012. 013. 014  015  016  017  018  019. 020. 021  022  023  024, 025  026  027  028  029. 030. 031.                   
TopObstacleX:			.byte 170, 190, NON, 165, 169, NON, NON, 220, 205, 170, 170, NON, NON, 220, 170, 200, 200, 200, 165, 165, 180, NON, 165, 165, NON, 165, NON, 165, 165, 165, 175, 160
TopObstacleRepeat:		.byte NON, NON, NON, TRI, NON, NON, NON, NON, NON, NON, DOU, NON, NON, NON, NON, TRI, NON, DOU, TRI, TRI, NON, NON, TWM, TWC, NON, TWM, NON, TWW, TWW, THM, TWW, TRI
TopObstacleCount:		.byte 001, 001, NON, 001, 001, NON, NON, 001, 001, 001, 001, NON, NON, 001, 001, 001, 001, 001, 001, 001, 001, NON, 002, 002, NON, 002, NON, 002, 002, 003, 002, 001
TopObstacleRepeatType:		.byte NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, MED, CLO, CLO, MED, NOR, WID, WID, MED, WID, NOR
TopObstacleHeight:		.byte HT3, HT2, NON, HT2, HT1, NON, NON, HT3, HT2, HT3, HT3, NON, NON, HT3, HT1, HT2, HT3, HT1, HT1, HT2, HT2, NON, HT1, HT1, NON, HT1, NON, HT2, HT1, HT1, HT3, HT2
  
BottomObstacleX:		.byte NON, 240, 170, NON, NON, 175, 165, 175, 175, 210, NON, 170, 180, 175, 200, 165, 165, 165, 230, 220, NON, 230, 250, NON, 165, NON, 165, 200, 200, NON, NON, 215
BottomObstacleRepeat:		.byte NON, NON, NON, NON, NON, NON, NON, NON, NON, NON, NON, DOU, DOU, DOU, NON, DOU, NON, NON, NON, NON, NON, NON, NON, NON, TWC, NON, THM, TWW, NON, NON, NON, TWW
BottomObstacleCount:		.byte NON, 001, 001, NON, NON, 001, 001, 001, 001, 001, NON, 001, 001, 001, 001, 001, 001, 001, 001, 001, NON, 001, 001, NON, 002, NON, 003, 002, 001, NON, NON, 002
BottomObstacleRepeatType:	.byte NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, NOR, CLO, NOR, MED, WID, NON, NOR, NOR, WID
BottomObstacleHeight:		.byte NON, HT2, HT1, NON, NON, HT3, HT2, HT2, HT3, HT4, NON, HT1, HT3, HT1, HT1, HT1, HT2, HT2, HT3, HT4, NON, HT4, HT3, NON, HT1, NON, HT1, HT1, HT4, NON, NON, HT1
 
ScoreForClear:			.byte 004, 003, 001, 006, 001, 005, 002, 005, 006, 007, 006, 002, 007, 006, 003, 006, 005, 002, $07, $10, 002, 006, $09, 002, 003, $07, $25, $10, $12, $08, $10, $12

GetRandomObstacle:	

	lda #0
        sta topObstacleSpawned
        sta bottomObstacleSpawned
        
        jsr Random

        and #%00011111
        tax
	
        lda TopObstacleCount,x
        sta topObstacleCount
        
        lda ScoreForClear,x
        sta scoreWhenCleared        
        
        lda TopObstacleX,x
        sta topObstacleX
        beq NoTop
        
        inc topObstacleSpawned
        
        
        lda TopObstacleRepeatType,x
        sta topObstacleRepeatType
 	
        lda TopObstacleRepeat,x
        sta topObstacleRepeat
        beq NoRepeatTop
        cmp #DOU
        beq NoRepeatTop
        cmp #TRI
        beq NoRepeatTop

        lda #NON
        sta topObstacleRepeat
     
        
        
NoRepeatTop:

   	jsr Random
        ora #%10001000  
        sta obstacleColourTop
      
      	jsr Random
        ora #%10001000
        sta obstacleColourBottom
        sta COLUP1
        
        
      
        
        lda #VERTICAL_CENTER_OF_SCREEN / 2
        clc
        adc TopObstacleHeight,x
       	jmp NowBottom
        
NoTop:
	lda #0
        
NowBottom:

        sta topObstacleY
        
          
        lda BottomObstacleCount,x
        sta bottomObstacleCount
        
        lda BottomObstacleX,x
        sta bottomObstacleX     
        beq NoBottom
        
        inc bottomObstacleSpawned 
        
        
        lda BottomObstacleRepeatType,x
        sta bottomObstacleRepeatType
      
        lda BottomObstacleRepeat,x
        sta bottomObstacleRepeat
        beq NoRepeatBottom
        cmp #DOU
        beq NoRepeatBottom
        cmp #TRI
        beq NoRepeatBottom
        
               
        lda #NON
        sta bottomObstacleRepeat
                
     
NoRepeatBottom:
        
      
        
        lda #VERTICAL_CENTER_OF_SCREEN / 2 + 1
        sec
        sbc BottomObstacleHeight,x
       	jmp BottomDone
        
NoBottom:
	lda #0
        
BottomDone:

        sta bottomObstacleY
        
        rts
        
        
        
