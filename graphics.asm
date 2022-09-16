
	org $FEA0
        

;################################################
; Sprite Graphic Data

SpriteGraphicTable


Frame0
        .byte #%01000001;$AA
        .byte #%10100010;$AA
        .byte #%00000001;$AA
        .byte #%10000000;$AA
        .byte #%10000001;$AA
        .byte #%11001001;$AA
        .byte #%11001101;$AA
        .byte #%01100010;$AA
        .byte #%00111100;$AA
Frame1
        .byte #%01000000;$AA
        .byte #%10000101;$AA
        .byte #%01000010;$AA
        .byte #%10000001;$AA
        .byte #%11001001;$AA
        .byte #%11001101;$AA
        .byte #%01100010;$AA
        .byte #%00111100;$AA
        .byte #%00000000;$AA
Frame2
        .byte #%00000010;$AA
        .byte #%10100001;$AA
        .byte #%01000010;$AA
        .byte #%11001001;$AA
        .byte #%11001101;$AA
        .byte #%01100010;$AA
        .byte #%00111100;$AA
        .byte #%00000000;$AA
        .byte #%00000000;$AA
Frame3
        .byte #%01000010;$AA
        .byte #%00100101;$AA
        .byte #%01000000;$AA
        .byte #%10000001;$AA
        .byte #%11001001;$AA
        .byte #%11001101;$AA
        .byte #%01100010;$AA
        .byte #%00111100;$AA
        .byte #%00000000;$AA
Frame4
        .byte #%00111100;$AA
        .byte #%01100010;$AA
        .byte #%11001101;$AA
        .byte #%11001001;$AA
        .byte #%10000001;$AA
        .byte #%10000000;$AA
        .byte #%00000001;$AA
        .byte #%10100010;$AA
        .byte #%01000001;$AA
Frame5
        .byte #%00000000;$AA
        .byte #%00111100;$AA
        .byte #%01100010;$AA
        .byte #%11001101;$AA
        .byte #%11001001;$AA
        .byte #%10000001;$AA
        .byte #%01000010;$AA
        .byte #%10000101;$AA
        .byte #%01000000;$AA
Frame6
        .byte #%00000000;$AA
        .byte #%00000000;$AA
        .byte #%00111100;$AA
        .byte #%01100010;$AA
        .byte #%11001101;$AA
        .byte #%11001001;$AA
        .byte #%01000010;$AA
        .byte #%10100001;$AA
        .byte #%00000010;$AA
Frame7
        .byte #%00000000;$AA
        .byte #%00111100;$AA
        .byte #%01100010;$AA
        .byte #%11001101;$AA
        .byte #%11001001;$AA
        .byte #%10000001;$AA
        .byte #%01000000;$AA
        .byte #%00100101;$AA
        .byte #%01000010;$AA
;---End Graphics Data---

; Font table for digits 0-9 (8x8 pixels)
        align $100 ; make sure data doesn't cross page boundary
;;{w:8,h:8,count:10,brev:1,flip:1};;
FontTable
	hex 003c6666766e663c007e181818381818
        hex 007e60300c06663c003c66061c06663c
        hex 0006067f661e0e06003c6606067c607e
        hex 003c66667c60663c00181818180c667e
        hex 003c66663c66663c003c66063e66663c
;;