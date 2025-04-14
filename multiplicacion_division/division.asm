section .bss
    resultado resb 1

section .data

section .text
    global _start

_start:

mov bx, 2

mov dx, 0 ; residuo
mov ax, 8 ; aqui se guarda el resultado

div bx

; convertir a caracter por su codigo ascii
add ax, 48
mov [resultado], ax

; imprimiendo en pantalla
mov eax, 4
mov ebx, 1
mov ecx, resultado
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80