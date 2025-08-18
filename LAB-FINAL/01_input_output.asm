.MODEL SMALL        ; Use small memory model (code & data in single segment each)
.STACK 100H         ; Reserve 256 bytes of stack memory
.DATA               ; Data segment (empty in this program)
.CODE               ; Start of code segment

MAIN PROC           ; Start of main procedure

 MOV AH, 1          ; Select DOS function 1 (keyboard input)
 INT 21H            ; Call DOS interrupt to read a character into AL

 MOV BL, AL         ; Store the input character from AL into BL

 MOV AH, 2          ; Select DOS function 2 (display character)
 MOV DL, BL         ; Load character from BL into DL for output
 INT 21H            ; Call DOS interrupt to display character in DL

 MOV AH, 4CH        ; Select DOS function 4Ch (terminate program)
 INT 21H            ; Call DOS interrupt to end the program

 MAIN ENDP          ; End of main procedure
END MAIN            ; End of program, execution starts at MAIN
