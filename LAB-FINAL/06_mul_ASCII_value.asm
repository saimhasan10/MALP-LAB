org 100h          ; .COM program start

; ---- Input first digit ----
MOV AH, 1         
INT 21H           
SUB AL, 30h       ; Convert ASCII ? integer
MOV BL, AL        ; Save first number

; ---- Input second digit ----
MOV AH, 1
INT 21H
SUB AL, 30h       ; Convert ASCII ? integer
MOV CL, AL        ; Save second number

; ---- Perform multiplication ----
MUL CL            ; AL * CL ? result in AX (AL = low byte, AH = high byte)
                  ; Since numbers are small, result fits in AL

; ---- Convert result to ASCII ----
ADD AL, 30h       ; Integer ? ASCII (works if result < 10)
MOV DL, AL
MOV AH, 2
INT 21H           ; Display result

ret
