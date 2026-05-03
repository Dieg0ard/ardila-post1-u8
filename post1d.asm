; post1d.asm - REPE CMPSB: comparar cadenas
ORG 100h
section .data
cad1
 db "NASM x86",0
cad2
 db "NASM x86",0
cad3
 db "NASM ARM",0
msgIg
 db "Iguales.$"
msgDif db "Diferentes.$"
crlf
 db 0Dh,0Ah,"$"
section .text
start:
mov ax, ds
mov es, ax
; Caso 1: comparar cad1 vs cad2 (deben ser iguales)
mov si, cad1
mov di, cad2
mov cx, 8
cld
repe cmpsb
je .iguales1
mov ah, 09h
mov dx, msgDif
int 21h
jmp .caso2
.iguales1:
mov ah, 09h
mov dx, msgIg
int 21h
.caso2:
mov ah, 09h
mov dx, crlf
int 21h
; Caso 2: comparar cad1 vs cad3 (deben ser diferentes)
mov si, cad1
mov di, cad3
mov cx, 8
cld
repe cmpsb
je .iguales2
mov ah, 09h
mov dx, msgDif
int 21h
jmp .fin
.iguales2:
mov ah, 09h
mov dx, msgIg
int 21h
.fin:
mov ah, 09h
mov dx, crlf
int 21h
mov ah, 4Ch
xor al, al
int 21h