; directivas: comandos

; Directiva de sección o segmento
section .data
; etiqueta para guardar el mensaje
; se especifica cuantos bits ocupara cada dato en memoria
; es por eso que aqui no existe eso de "tipos de datos", aqui se maneja directamente la memoria

; directiva de deficion de datos:
;       db -> DefineByte
;       dw -> Definir 2 bytes: 16 bits para un solo dato en memoria
;       dd ->  Definir 4 bytes: 32 bits para un solo dato en memoria
;       dq -> Definir 8 byes: 64 bits para un solo dato en memoria
;       ddq -> Definir 16 bytes: 128 bits para un solo dato en memoria
;       dt -> Definir 10 bytes: 80 bits para un solo dato en memoria

; Para almacenar caracteres, se usa 1 byte porque esta asociado a un numero. Esto en esta en la tabla ASCII
; Se almacenaran caracteres que van de 0 a 255, solo se ocupara un byte

; aqui no existen los caracteres de escape. El famoso \n es representado por: 10, 13
; 10: hace el salto de linea
; 13: hace el retorno de carro, el cursor se mueve a la posicion 0 de la linea o fila

; se coloca 0x para indicar que se representa un valor en hexadecimal
; entonces, para el ascii 10, en hexadecimal es 0xa y el 13 es 0xd

; tambien se puede escribir hexadecimal como: ah = 0xa

; $ es el caracter centinela, es un delimitador.

; es lo mismo que hacer: msg db 'H', 'o', 'l', 'a', 97, 'm', 'u', 'n', 'd', 'o', '!'
msg db "Hola mundo!",0xa,0xd, ; msg solo hace referencia a 'H', como un arreglo en C

len equ $-msg ; calculando el tama;o del mensaje: centinela direccion - mensaje direccion

section .text

; Directiva de inicio, de arranque del programa
global _start ; esta etiqueta sirve para arrancar el programa
_start: 
    ; antes de hacer la interrupcion, se pasan valores especificos a registros concretos
    ; Para escribir en pantalla el Hola Mundo, se deben usar estos registros y esos datos exactos.

    mov eax, 4 ; Indica que quiero escribir datos.
    mov ebx, 1 ; indica que quiero escribir en pantalla
    mov ecx, msg ; Indica que es lo que quiero escribir. msg se reescribe como su direccion en memoria
    mov edx, len ; Indica donde va a terminar de escribir, cuantos bytes va a escribir .
    
     ; Si no se coloca el centinela, el programa va a seguir hasta que se acabe la memoria.
     ; El centinela se coloca automaticamente en NASM.

    ; aqui se hace una interrupcion para imprimir en pantalla
    int 0x80
    
    ; Para que el proceso haya terminado exitosamente. Es como el return 0 de C en main
    mov eax, 1
    mov ebx, 0
    int 0x80