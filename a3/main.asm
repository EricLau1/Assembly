section .text

global _start

_start:
  mov eax, 1
  mov ebx, 2 ; saída retorna 2
  int 0x80
  
