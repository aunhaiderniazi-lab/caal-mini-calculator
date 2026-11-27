; Author: Aun Haider Niazi
.model small
.stack 100h
.data
menu db 13,10,'--- MINI CALCULATOR ---',13,10
     db 'By Aun Haider Niazi',13,10
     db '1. Add',13,10
     db '2. Subtract',13,10
     db '3. Multiply',13,10
     db '4. Divide',13,10
     db '5. Digit to Binary',13,10
     db '6. Exit',13,10
     db 'Choice: $'
msg1 db 13,10,'Enter digit 1: $'
msg2 db 13,10,'Enter digit 2: $'
msgd db 13,10,'Enter digit: $'
msgr db 13,10,'Result: $'
msgq db 13,10,'Remainder: $'
msge db 13,10,'Error: divide by zero$'
msgb db 13,10,'Binary: $'
choice db ?
a db ?
b db ?

.code
main proc
    mov ax, @data
    mov ds, ax
start:
    lea dx, menu
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    mov choice, al
    cmp al, '6'
    je exit
    cmp al, '5'
    je bin
    cmp al, '1'
    jl start
    cmp al, '4'
    jg start
    call calc
    jmp start
bin:
    call to_binary
    jmp start
exit:
    mov ah, 4Ch
    int 21h
main endp

get_digit proc
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    ret
get_digit endp

calc proc
    lea dx, msg1
    call get_digit
    mov a, al
    lea dx, msg2
    call get_digit
    mov b, al
    lea dx, msgr
    mov ah, 9
    int 21h
    mov al, a
    mov bl, b
    cmp choice, '1'
    je do_add
    cmp choice, '2'
    je do_sub
    cmp choice, '3'
    je do_mul
    cmp bl, 0
    je div_zero
    mov ah, 0
    div bl
    mov bh, ah
    mov ah, 0
    call print_num
    lea dx, msgq
    mov ah, 9
    int 21h
    mov al, bh
    mov ah, 0
    call print_num
    ret
do_add:
    add al, bl
    mov ah, 0
    call print_num
    ret
do_sub:
    cmp al, bl
    jae sub_ok
    push ax
    mov dl, '-'
    mov ah, 2
    int 21h
    pop ax
    xchg al, bl
sub_ok:
    sub al, bl
    mov ah, 0
    call print_num
    ret
do_mul:
    mul bl
    call print_num
    ret
div_zero:
    lea dx, msge
    mov ah, 9
    int 21h
    ret
calc endp

print_num proc
    mov bl, 10
    div bl
    mov cx, ax
    cmp al, 0
    je ones
    mov dl, al
    add dl, '0'
    mov ah, 2
    int 21h
ones:
    mov dl, ch
    add dl, '0'
    mov ah, 2
    int 21h
    ret
print_num endp

to_binary proc
    lea dx, msgd
    call get_digit
    mov bl, al
    lea dx, msgb
    mov ah, 9
    int 21h
    mov cx, 8
bits:
    shl bl, 1
    jc one
    mov dl, '0'
    jmp show
one:
    mov dl, '1'
show:
    mov ah, 2
    int 21h
    loop bits
    ret
to_binary endp

end main
