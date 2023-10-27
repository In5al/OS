_start:
    mov ax, 07C0h
    add ax, 288
    mov ss, ax              ; ss = stack space
    mov sp, 4096            ; sp = stack pointer

    mov ax, 07C0h
    mov ds, ax              ; ds = data segment

    call print_pixel

    jmp $                   ; infinite loop

; ----------------------------------------------------------------------

print_pixel:

    ; changing video mode to graphical

    mov ah, 00h             ; set video mode

    mov al, 13h             ; 13h - graphical mode.
                            ; 40x25. 256 colors.;320x200 pixels. 1 page.

    int 10h                 ; call

    ; drawing random pixels

    mov ah, 0Ch             ; change color for a single pixel

    mov al, 0000b           ; color
    mov bh, 0               ; page number
    mov cx, 30              ; x
    mov dx, 100             ; y

    int 10h                 ; paint 1st pixel

.repeat:

    inc al                  ; change color
    inc cx                  ; go one pixel right
    inc dx                  ; go one pixel down

    int 10h                 ; paint

    cmp al, 1111b
    je .done                ; last color was painted

    jmp .repeat

.done:
    ret

times 510 - ($ - $$) db 0   ; padding with 0 at the end
dw 0xAA55                   ; PC boot signature
