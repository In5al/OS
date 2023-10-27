org 7c00H

mov bh, 0
mov ax, 0H
mov es, ax
mov bp, msg

mov al, 1
mov cx, 4           ; Display only 4 characters
mov dh, 1
mov dl, 1

mov ax, 1303H
int 10H

mov al, 'Y'
mov bl, 1       ; Text attribute for 'Y' (e.g., White on Black)
int 10H

mov al, 'O'
mov bl, 2       ; Text attribute for 'O' (e.g., White on Green)
int 10H

mov al, 'L'
mov bl, 3       ; Text attribute for 'L' (e.g., White on Cyan)
int 10H

mov al, 'O'
mov bl, 4       ; Text attribute for 'O' (e.g., White on Red)
int 10H

jmp $

msg db 'Y', 09H, 'O', 0aH, 'L', 0bH, 'O', 0cH

