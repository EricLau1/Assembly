; Introdução a funções

section .data

  n1      dw  '5', 0xa   ; valor cinco em formata caractere
  endl    db  10,  0     ; pular a linha
  lenline equ $ - endl 

section .text

  global _start

_start:

  call converter_valor
  mov ecx, n1
  call mostrar_valor
 
  call jmp_line
  
final:

  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:
 
   mov eax, [n1]  ; move a variavel para um endereço de memoria
   sub eax, '0'   ; converte caractere para inteiro
   add eax, 1     ; adiciona 1 ao valor da varial => 5 + 1
   add eax, '0'   ; converte inteiro para caractere
   mov [n1], eax  ; mov "eax" para o ponteiro de n1
   ret		  ; retorna a função para o ponto onde ela foi chamada
   
mostrar_valor:
  mov eax, 4
  mov ebx, 1
  mov edx, 1      ; move edx para o tamanho do caractere (1 caractere neste caso)
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
