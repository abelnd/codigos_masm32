.386
.model flat,STDCALL

option casemap:none

include kernel32.inc
include masm32.inc

includelib kernel32.lib
includelib masm32.lib

.data
Msg db "Ingresa numero:  ",0
endl db 00dh,00ah,0; salto de linea

.data?
num1 dw 10 dup(?);buffer
.code
start:


invoke StdOut,addr Msg
invoke StdIn,addr num1,10
;-----------------------------------------------------------------------
mov [num1 + eax - 2],0; corta las dos ultimas letras que agrega la libreria stdin que no nos sirve
invoke atodw,addr num1; convertirmos de texto a numero
mov ecx,eax; pasamos el primer numero a ecx
;-----------------------------------------------------------------------
invoke StdOut,addr Msg
invoke StdIn,addr num1,10
;-----------------------------------------------------------------------
mov [num1 + eax - 2],0; corta las dos ultimas letras que agrega la libreria stdin que no nos sirve
invoke atodw,addr num1; convertirmos de texto a numero

add eax,ecx ;suma ambos numeros

invoke dwtoa,eax,addr num1; convertir el número en texto en el buffer num1
;-----------------------------------------------------------------------
invoke StdOut,addr endl 
invoke StdOut,addr num1
invoke StdIn,addr num1,10
invoke ExitProcess,0
end start
