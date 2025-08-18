org 100h          ; Program start offset for .COM files (real mode, PSP = 256 bytes)

MOV AH, 1         ; DOS function 01h ? read first character
INT 21H           ; Wait for user input, char stored in AL

MOV BL, AL        ; Save the first character into BL

MOV AH, 1         ; DOS function 01h again ? read second character
INT 21H           ; Wait for second input, char stored in AL

MOV CL, AL        ; Save the second character into CL

SUB BL, AL        ; Subtract ASCII value of 2nd char from 1st char (BL = BL - AL)
                  ; Example: '3'(51) - '1'(49) = 2 ? non-printable ASCII

MOV AH, 2         ; DOS function 02h ? display character
MOV DL, BL        ; Put the subtraction result into DL
INT 21H           ; Display result as ASCII character

ret               ; End program
