; post1.asm - REP MOVSB: copia de cadena
; Compilar: nasm -f bin post1.asm -o post1.com
ORG 100h
section .data
origen db "HOLA, MUNDO!",0
destino db 13 dup(0)
msgCop db "Copiado: $"
crlf
 db 0Dh,0Ah,"$"
section .text
start:
; Preparar ES = DS
mov ax, ds
mov es, ax
; Copiar 13 bytes de origen a destino
mov si, origen
mov di, destino
mov cx, 13
cld
 ; DF=0: de baja a alta direccion
rep movsb
; Mostrar el resultado
mov ah, 09h
mov dx, msgCop
int 21h
mov dx, destino
int 21h
mov dx, crlf
int 21h
mov ah, 4Ch
xor al, al
int 21h