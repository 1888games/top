
 ;----------------
                org $FFFA
                
InterruptVectors

    .word Reset           ; NMI
    .word Reset           ; RESET
    .word Reset           ; IRQ

