%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Введите значение x:',0
rem: DB 'Результат:',0
SECTION .bss
x: RESB 80 ;
SECTION .text
GLOBAL _start
_start:
; —- Вычисление выражения
mov eax,div ;
call sprint ;
mov ecx, x ;
mov edx, 80 ;
call sread ;
mov eax, x ;
call atoi ;
mov ebx, 12 ;
mul ebx ; eax = x12
add eax, 3 ; eax = x12 + 3
mov ebx, 5 ;
div ebx ; eax = (x*12+3)/5
mov edi,eax ;
; —- Вывод результата на экран
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения ‘Результат:’
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из ‘edx’ (остаток) в виде символов
call quit ; вызов подпрограммы завершения
