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
msg01 db "Hola PeruCrackers",0
saida db "%d",0
saida2 db "x = %x",0

.data?

salvar dd ?


.code
start:


push offset msg01
call crt_printf

push offset salvar ;push salvar
push offset saida
call crt_scanf

mov eax,offset salvar
push eax
push offset saida2
call crt_printf

invoke wait_key
invoke ExitProcess,0
ret

end start