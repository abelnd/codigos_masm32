.386
.model flat,STDCALL

option casemap:none

include kernel32.inc
include masm32.inc

includelib kernel32.lib
includelib masm32.lib

.data
Msg db "Enter the number  ",0
endl db 00dh,00ah,0; <<==

.data?
num1 dw 10 dup(?)

.code
start:


invoke StdOut,addr Msg
invoke StdIn,addr num1,10
;-----------------------------------------------------------------------
mov [num1 + eax - 2],0; corta las dos ultimas letras que agrega la libreria stdin que no nos sirve
invoke atodw,addr num1; convertirmos de texto a numero
mov eax,ecx; <<== store number in stack
;-----------------------------------------------------------------------
invoke StdOut,addr Msg
invoke StdIn,addr num1,10
;-----------------------------------------------------------------------
mov [num1 + eax - 2],0; cut off eol
invoke atodw,addr num1; <<== convert text to number in eax
;pop ecx               ; restore first number from stack into ecx
add eax,ecx
invoke dwtoa,eax,addr num1; convert number into text into num1 buffer
;-----------------------------------------------------------------------
invoke StdOut,addr endl
invoke StdOut,addr num1
invoke StdIn,addr num1,10
invoke ExitProcess,0
end start