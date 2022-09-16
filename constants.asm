

;------------------------------------------------
; Constants
;------------------------------------------------

; Modify values to suit style
; 
FACE_DURATION = 5		; Number of frames each face lasts on screen. Decrease to speed up, increase to slow down.
SPRITE_HEIGHT = 9			; Native number of pixels tall the sprite is (before being stretched by a 2LK or whatever).
NUM_ANIMATION_FACES = 4	; Number of faces of animation. (!)Corresponds with number of color tables(!)					; If true, sprite mirrors when moved left.
X_LK = 1					;  set to 1 for 1LK, 2 for 2LK, etc.			; set to 1, 2, or 4, anything else is right out
BG_COLOR = $1			; background color
VALUE_OF_Y_AT_SCREEN_BOTTOM = 192-192/X_LK
VERTICAL_CENTER_OF_SCREEN = 192-(192-VALUE_OF_Y_AT_SCREEN_BOTTOM)/2 + 2
MIN_Y_TOP = VERTICAL_CENTER_OF_SCREEN / 2 + 8
GROUND_TOP = VERTICAL_CENTER_OF_SCREEN / 2 + 8 
GRAVITY = 46
GROUND_BOTTOM  = VERTICAL_CENTER_OF_SCREEN / 2 - 2
PLAYER_X = 32
TOP_COLOUR = $AA
ROAD_COLOUR = $0a
KERNEL_LINES = 88
PLAYER_SPRITE = 0
OBSTACLE_SPRITE = 1
logo_height = 80
logo_color = $40
THREE_COPIES = %011


; 1: Global song speed, 0: Each pattern has individual speed
TT_GLOBAL_SPEED         = 1
; duration (number of TV frames) of a note
TT_SPEED                = 3
; duration of odd frames (needs TT_USE_FUNKTEMPO)
TT_ODD_SPEED            = 3

; 1: Overlay percussion, +40 bytes
TT_USE_OVERLAY          = 0
; 1: Melodic instrument slide, +9 bytes
TT_USE_SLIDE            = 0
; 1: Goto pattern, +8 bytes
TT_USE_GOTO             = 1
; 1: Odd/even rows have different SPEED values, +7 bytes
TT_USE_FUNKTEMPO        = 0
; If the very first notes played on each channel are not PAUSE, HOLD or
; SLIDE, i.e. if they start with an instrument or percussion, then set
; this flag to 0 to save 2 bytes.
; 0: +2 bytes
TT_STARTS_WITH_NOTES    = 0