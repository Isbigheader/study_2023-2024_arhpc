%include 'in_out.asm'

SECTION .data
    filename db 'name.txt', 0
    msg db 'Как вас зовут?', 0
    msg1 db 'Меня зовут ', 0

SECTION .bss
    name resb 255

SECTION .text
    global _start

_start:
    mov eax, msg
    call sprint

    mov ecx, name
    mov edx, 255
    call sread

    mov eax, 5
    mov ebx, filename
    mov ecx, 0101o
    mov edx, 0777o
    int 80h
    mov esi, eax

    mov ecx, msg1
    call strlen
    mov edx, eax
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ecx, name
    call strlen
    mov edx, eax
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit

strlen:
    xor eax, eax
strlen_loop:
    cmp byte [ecx + eax], 0
    je strlen_done
    inc eax
    jmp strlen_loop
strlen_done:
    ret
