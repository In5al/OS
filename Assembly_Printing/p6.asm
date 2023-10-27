org 7c00H

mov bh, 0
mov ax, 0H
mov es, ax
mov bp, msg

mov al, 1
mov cx, 4        ; Display only 4 characters
mov dh, 1
mov dl, 1
mov bl, 7       ; Text attribute for white text

mov ax, 1302H
int 10H

jmp $

msg db 'Y', 09H, 'O', 0aH, 'L', 0bH, 'O', 0cH

