INCLUDE "EMU8086.INC"  ; Include EMU8086 library (gives PRINT, PRINTN, etc.)

.MODEL SMALL           ; Use small memory model (separate code & data segments)
.STACK 100H            ; Reserve 256 bytes for the stack
.DATA                  ; Data segment (empty in this program)
.CODE                  ; Code segment starts here

MAIN PROC              ; Start of the main procedure

 MOV AH, 1             ; Select DOS service 01h (keyboard input)
 INT 21H               ; Wait for user to press a key ? result stored in AL

 MOV BL, AL            ; Save the input character in BL (so we don’t lose it)

 PRINTN ""             ; Print a new line (same as CR+LF, moves cursor down)

 MOV AH, 2             ; Select DOS service 02h (display character)
 MOV DL, BL            ; Put the saved character into DL (for printing)
 INT 21H               ; Print the character on the screen

 MOV AH, 4CH           ; Select DOS service 4Ch (terminate program)
 INT 21H               ; Exit program and return to DOS

 MAIN ENDP             ; End of main procedure
END MAIN               ; Mark the end of program (execution starts at MAIN)
