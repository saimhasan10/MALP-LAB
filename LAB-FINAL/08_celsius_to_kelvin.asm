org 100h              ; COM program starts at 0100h



MOV AX, 25            ; AX = Celsius value (example: 25°C)
ADD AX, 273           ; Kelvin = Celsius + 273 ? AX = 298

MOV BX, 10            ; BX = divisor (10) for decimal conversion
MOV CX, 0             ; CX = counter ? number of digits
LEA SI, DIGITS        ; SI points to DIGITS buffer in memory


NEXT_DIV:
    XOR DX, DX        ; Clear DX (needed before DIV)
    DIV BX            ; Divide AX by 10 ? Quotient in AX, Remainder in DX
    ADD DL, 30h       ; Convert remainder (0–9) to ASCII ('0'–'9')
    MOV [SI], DL      ; Store digit in memory buffer
    INC SI            ; Move buffer pointer forward
    INC CX            ; Increase digit count
    CMP AX, 0         ; If quotient is not zero
    JNE NEXT_DIV      ; Repeat division until number = 0


PRINT_LOOP:
    DEC SI            ; Move pointer back to last stored digit
    MOV DL, [SI]      ; Load digit from buffer
    MOV AH, 2         ; DOS service ? print character
    INT 21h
    LOOP PRINT_LOOP   ; Repeat for all digits (CX times)

ret                   ; End program


DIGITS DB 6 DUP(?)    ; Reserve 6 bytes for storing digits
