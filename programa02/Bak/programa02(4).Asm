.386
.model flat, stdcall
option casemap:none


include msvcrt.inc
includelib msvcrt.lib

include kernel32.inc
includelib kernel32.lib

include masm32.inc
includelib masm32.lib

.data
msg01 db "Ingrese un numero:",0
espacio db 0dh,0ah,0
ingresar_nombre db "%s",0
imprimir_nombre db "Su nombre es : %s",0

.data?

salvar dd ?


.code
start:


push offset msg01
call crt_printf

push offset espacio
call crt_printf 

push offset salvar ;push salvar
push offset ingresar_nombre
call crt_scanf

mov eax,offset ingresar_nombre
push eax
push offset imprimir_nombre
call crt_printf

invoke wait_key
invoke ExitProcess,0
ret

end start