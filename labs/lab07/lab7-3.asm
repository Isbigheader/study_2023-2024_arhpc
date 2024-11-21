%include 'in_out.asm'

section .data
    msg1 db 'Введите x:', 0h
    msg2 db 'Введите a:', 0h
    msg3 db 'Результат:', 0h

section .bss
    a resb 10
    x resb 10
    rez resb 10

section .text
global _start
_start:
    ; ———- Вывод сообщения ‘Введите x:’
    mov eax, msg1
    call sprint

    ; ———- Ввод ‘x’
    mov ecx, x
    mov edx, 10
    call sread

    ; ———- Преобразование ‘x’ из символа в число
    mov eax, x
    call atoi               ; Преобразование символа в число
    mov [x], eax            ; Сохранение преобразованного числа в ‘x’

    ; ———- Вывод сообщения ‘Введите a:’
    mov eax, msg2
    call sprint

    ; ———- Ввод ‘a’
    mov ecx, a
    mov edx, 10
    call sread

    ; ———- Преобразование ‘a’ из символа в число
    mov eax, a
    call atoi               ; Преобразование символа в число
    mov [a], eax            ; Сохранение преобразованного числа в ‘a’

    ; ———- Сравнение ‘a’ и ‘x’
    mov ecx, [a]            ; ecx = a
    cmp ecx, [x]            ; Сравнение ‘a’ и ‘x’
    jg ysl1                 ; Если ‘a > x’, то переход на метку ‘ysl1’

ysl2:
    mov ecx, 8              ; Если ‘a <= x’, результат = 8
    mov [rez], ecx
    jmp ffn

ysl1:
    mov eax, [a]            ; eax = a
    mov ebx, 2              ; ebx = 2
    mul ebx                 ; eax = 2 * a
    sub eax, [x]            ; eax = 2 * a - x
    mov [rez], eax          ; Сохранение результата в ‘rez’

ffn:
    ; ———- Вывод результата
    mov eax, msg3
    call sprint             ; Вывод сообщения ‘Результат:’
    mov eax, [rez]
    call iprintLF           ; Вывод результата
    call quit               ; Завершение программы
