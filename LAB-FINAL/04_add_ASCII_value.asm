org 100h         ; Program start offset for .COM files (real mode, PSP = 256 bytes)

MOV AH, 1        ; DOS function 01h ? read a character from keyboard
INT 21H          ; Wait for user input, character stored in AL

MOV BL, AL       ; Save the first character into BL

MOV AH, 1        ; DOS function 01h again ? read another character
INT 21H          ; Wait for second input, character stored in AL

MOV CL, AL       ; Save the second character into CL

ADD BL, AL       ; Add the ASCII value of 2nd char to the 1st char (BL = BL + AL)

MOV AH, 2        ; DOS function 02h ? display character
MOV DL, BL       ; Put result (sum of ASCII values) into DL
INT 21H          ; Display the resulting character on screen

ret              ; Return from program (end)
