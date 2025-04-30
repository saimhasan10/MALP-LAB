.MODEL SMALL 
.STACK 100H 
.DATA
.CODE    

MAIN PROC
    MOV AH, 1       ; INPUT a character
    INT 21H         ; DOS interrupt
    MOV BL, AL      ; Store input in BL

    ; --- Newline before output ---
    MOV AH, 2
    MOV DL, 0Dh     ; Carriage Return
    INT 21H
    MOV DL, 0Ah     ; Line Feed
    INT 21H

    ; --- Output the stored character ---
    MOV AH, 2
    MOV DL, BL      ; Output the character
    INT 21H

    ; --- Terminate the program ---
    MOV AH, 4CH     
    INT 21H
MAIN ENDP

END MAIN
