; Comparadores

section .data

 ; db  = Define Byte        -> aloca 1 byte
 ; dw  = Define Word        -> aloca 2 bytes
 ; dd  = Define Doubleword  -> aloca 4 bytes
 ; dq  = Define Quadword    -> aloca  8 bytes
 ; dt  = Define Ten         -> aloca 10 bytes

  x dd 20 ; 20 * 4 = 80 bytes 

  y dd 10
  
  msg1 db 'X maior que Y', 0xa
  len1 equ $ - msg1

  msg2 db 'Y maior que X', 0xa
  len2 equ $ - msg2

section .text

global _start

_start:

  mov eax, DWORD [x]
  mov ebx, DWORD [y]

  ; comparação de "eax" com "ebx"
  ; resultados prováveis:
  ; eax > ebx, eax < ebx, eax >= ebx, eax <= ebx, eax = ebx
  
  cmp eax, ebx 

  ; Jumps condicionais que verificam as comparações

  ; je   -> verifica se os valores são iguais 		  (=)
  ; jg   -> verifica so o valor é maior			  (>)
  ; jge  -> verifica se o valor é maior ou igual 	  (>=)
  ; jl   -> verifica se o valor é menor 		  (<)
  ; jle  -> verificar o valor é menor ou igual 		  (<=)
  ; jne  -> verifica se o valor é diferente ou não igual  (!=)

  jge maior ; se na comparação acima o valor o primeiro valor for maior ou igual, o programa irá salta para o metodo "maior" sera definido abaixo

  ; caso o jump acima nao aconteça, então Y é maior que X
  
  mov edx, len2
  mov ecx, msg2

  jmp final ; jmp é um salto incondicional que nao verifica comparações, neste caso ele irá pular para o metodo "final" que sera definido abaixo

maior:
 
  mov edx, len1
  mov ecx, msg1

final:
 
  mov ebx, 1
  mov eax, 4
  int 0x80
  mov eax, 1
  int 0x80

; end
  



