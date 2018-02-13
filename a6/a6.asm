; Introdução a funções
; Convertendo valores de até 10 digitos

section .data

  n1      dw  '100', 0xa   ; valor cinco em formata caractere
  endl    db  10,  0     ; pular a linha
  lenline equ $ - endl

section .bss

  buffer: resb 10 

section .text

  global _start

_start:

  call converter_valor
  call mostrar_valor
 
  call jmp_line
  
final:

  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:
   
   lea esi, [n1]
   mov ecx, 3
   call string_to_int
   add eax, 1     ; adiciona 1 ao valor da varial => 5 + 1
   ret		  ; retorna a função para o ponto onde ela foi chamada
   
mostrar_valor:
  lea esi, [buffer]
  call int_to_string
  mov eax, 4
  mov ebx, 1
  mov edx, 1      
  mov ecx, buffer
  mov edx, 10
  int 0x80
  ret

; método para pular a linha:

jmp_line:

  mov eax, 4
  mov ebx, 1 
  mov edx, lenline
  mov ecx, endl
  int 0x80
  ret


; Converter String para Inteiro

string_to_int:

  xor ebx, ebx

.prox_digito:
   
  movzx eax, byte[esi] ; movzx adiciona zeros na parte que falta 

  ; ESI é o poteiro da String que precisa ser convertida
 
  ; "ecx" guarda a quantidade de digitos que uma String tem
  
  inc  esi  	; incrementa ESI  
  sub  al, '0'  ; converte para inteiro
  imul ebx, 10	; multiplica ebx em 10
  add  ebx, eax ; ebx = ebx*10 + eax
  
  loop .prox_digito ; while(--ecx)
  
  mov eax, ebx  ; coloca o valor em eax
  ret

; Converter Inteito para String
; Entrada: EAX ESI
; Saida: EAX

int_to_string:

  add esi, 9
  mov byte [esi], 0
  mov ebx, 10
 
.prox_digito:
 
  xor edx, edx
  div ebx	; div => divisão
  add dl,  '0'
  dec esi	; dec => decrementa
  mov [esi], dl
  test eax, eax
  jnz .prox_digito ; repete até eax for igual a 0
  mov eax, esi
  ret 
  
  
