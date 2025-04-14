section .bss ; seccion de valores no inicializados
    ; Haciendo una reserva de memoria
    resultado2 resb 1 ; reservando un espacio de 1 byte

section .data
    msg_suma db "El resultado de la suma es: "
    len_suma equ $-msg_suma

    salto db 0xa, 0xd
    
    msg_resta db "El resultado de la resta es: "
    len_resta equ $-msg_resta

    resultado db '0' ; inicializando

section .text
    global _start

_start:
; directiva de adicion: add
; directiva de sustraccion: sub

;;;;;;; SUMA

MOV EAX, 2
MOV EBX, 3

ADD EAX, EBX ; es como EAX += EBX

; Numero 0 en ascii: 48

; Se tiene que sumar EAX + 48 para mostrar el caracter 5

; ADD EAX, '0' ; El 0 lo obtiene en binario
ADD EAX, 48
mov [resultado], EAX ; modifica solo el valor en resultado a 53: el caracter 5

; Imprimiendo el texto de suma
MOV EAX, 4
MOV EBX, 1
MOV ECX, msg_suma
MOV EDX, len_suma
INT 0x80

; Indicando que quiero imprimir en pantalla
MOV EAX, 4 ; Escribir datos
MOV EBX, 1 ; Escribir en pantalla
MOV ECX, resultado ; Etiqueta en memoria
MOV EDX, 1 ; Cuantos bytes va a imprimir

INT 0x80

; Imprimiendo salto de linea
MOV EAX, 4
MOV EBX, 1
MOV ECX, salto
MOV EDX, 2
INT 0x80

;;;;;;; RESTA

; Imprimiendo el texto de resta
MOV EAX, 4
MOV EBX, 1
MOV ECX, msg_resta
MOV EDX, len_resta
INT 0x80

; Calculando la resta
MOV EAX, 8
MOV EBX, 1

SUB EAX, EBX
ADD EAX, 48 ; Convirtiendo el dato a numero en ascii

MOV [resultado2], EAX

; Imprimiendo en pantalla la resta
MOV EAX, 4
MOV EBX, 1
MOV ECX, resultado2
MOV EDX, 1

INT 0x80

; Imprimiendo el salto de linea
MOV EAX, 4
MOV EBX, 1
MOV ECX, salto
MOV EDX, 2
INT 0x80

; Proceso terminado con exito
MOV EAX, 1
MOV EBX, 0
INT 0x80