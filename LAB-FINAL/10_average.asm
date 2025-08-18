org 100h

numbers db 5,10,15
count   db 3

mov cx, 0           ; sum
mov si, 0           ; index
mov bl, [count]     ; number of elements

sum_loop:
    mov al, [numbers+si] ; load byte into AL
    mov ah, 0             ; zero-extend to AX
    add cx, ax            ; add to sum
    inc si
    dec bl
    jnz sum_loop

; Calculate average
mov ax, cx
mov bl, [count]
cwd                  ; prepare DX:AX for division (optional here)
div bl               ; AX / BL ? AL = average

; Print average
add al, 30h
mov dl, al
mov ah, 2
int 21h

ret
