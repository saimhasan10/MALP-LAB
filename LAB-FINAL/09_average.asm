org 100h            ; COM program start

mov al, 5           ; Number to calculate factorial (5!)
call FACTORIAL      ; Call factorial subroutine
                     ; Result returned in AL

; --- Convert result to ASCII and print ---
add al, 30h         ; Convert number to ASCII
mov dl, al
mov ah, 2           ; DOS function: print character
int 21h

ret                 ; End program

; -----------------------------
; Factorial subroutine
; Input: AL = number
; Output: AL = factorial
; -----------------------------
FACTORIAL:
    mov cl, al      ; CL = counter (number)
    mov al, 1       ; AL = result (factorial)
FACTORIAL_LOOP:
    mul cl          ; AL = AL * CL
    dec cl
    jnz FACTORIAL_LOOP
    ret
