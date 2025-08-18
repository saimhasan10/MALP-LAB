org 100h              ; COM program starts

mov ax, 300           ; AX = Kelvin value (example: 300)
sub ax, 273           ; Celsius = Kelvin - 273
                      ; Now AX = 27

; --- Convert result in AX into decimal digits ---
mov bx, 10            ; We will divide by 10 to get digits
xor cx, cx            ; CX = 0, will count digits
xor dx, dx            ; Clear DX for division

divide_loop:
    xor dx, dx        ; Clear DX before DIV
    div bx            ; AX ÷ 10 ? Quotient in AX, Remainder in DX
    push dx           ; Save remainder (digit) on stack
    inc cx            ; Count digits
    cmp ax, 0
    jne divide_loop   ; Repeat until quotient = 0

; --- Print digits from stack (reverse order) ---
print_loop:
    pop dx            ; Get digit from stack
    add dl, 30h       ; Convert to ASCII ('0' = 30h)
    mov ah, 2         ; DOS print character function
    int 21h
    loop print_loop   ; Repeat CX times

ret                   ; End program
