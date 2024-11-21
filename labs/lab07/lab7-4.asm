%include 'in_out.asm'
section .data
msg2 db 'Наименьшее число:',0
A dd 17
C dd 23
B dd 45
section .bss
min resd 1
section .text
global _start
_start:
    ; ———-Записываем ‘A’ в переменную ‘min’
    mov ecx, [A]        ; ‘ecx = A’
    mov [min], ecx      ; ‘min = A’
    
    ; ———- Сравниваем ‘A’ и ‘C’
    cmp ecx, [C]        ; Сравниваем ‘A’ и ‘C’
    jl check_B          ; если ‘A < C’, то переход на метку ‘check_B’
    mov ecx, [C]        ; иначе ‘ecx = C’
    mov [min], ecx      ; ‘min = C’

check_B:
    ; ———- Сравниваем ‘min(A,C)’ и ‘B’
    mov ecx, [min]
    cmp ecx, [B]        ; Сравниваем ‘min(A,C)’ и ‘B’
    jl ffn              ; если ‘min(A,C) < B’, то переход на ‘ffn’
    mov ecx, [B]        ; иначе ‘ecx = B’
    mov [min], ecx

ffn:
    ; ———- Вывод результата
    mov eax, msg2
    call sprint         ; Вывод сообщения ‘Наименьшее число:’
    mov eax, [min]
    call iprintLF       ; Вывод ‘min(A,B,C)’
    call quit           ; Выход
