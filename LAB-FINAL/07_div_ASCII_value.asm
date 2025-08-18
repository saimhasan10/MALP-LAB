org 100h

; Input first digit (dividend)
MOV AH, 1
INT 21H
SUB AL, 30h       ; Convert ASCII ? integer
MOV BL, AL        ; Save dividend

; Input second digit (divisor)
MOV AH, 1
INT 21H
SUB AL, 30h       ; Convert ASCII ? integer
MOV CL, AL        ; Save divisor

; Perform division
MOV AL, BL        ; Move dividend into AL
MOV AH, 0         ; Clear AH, since DIV uses AX = dividend
DIV CL            ; Divide AX by CL ? AL = quotient, AH = remainder

; Convert quotient to ASCII
ADD AL, 30h
MOV DL, AL
MOV AH, 2
INT 21H           ; Print quotient

ret
