; Programa para entrada de dados

; definindo variaveis 

SYS_EXIT  equ 1
RET_EXIT  equ 5  ; código de retorno
SYS_READ  equ 3  
SYS_WRITE equ 4  
STD_IN    equ 0  ; código de entrada de dados
STD_OUT   equ 1  ; código de saída de dados
MAX_IN    equ 10 

segment .data

  msg db "Informe seu nome: ", 0xA, 0xD
  len equ $ - msg

  ; proxima seção .bss => Block Started by Symbol
  ; é usado para inicialização de informações que ainda vão ser usadas
  ; as variaveis são definidas porém nao são incializadas

segment .bss 

  ; RESB => reserva 1 byte
  
  nome resb 2 ; aqui foram reservados 2 bytes

segment .text

global _start


_start:
 
  ; ax => acumulador para operações aritméticas
  ; bx => acumulador de registro base, usado para indexar endereços de memória
  ; cx => registro de conta, realizado com operações string
  ; dx => registro de dados, usado para armazenar dados de forma geral. Seja para cálculos ou operações de [I/O].
  ; esses operadores normalmente são acompanhados pela letra "e" ou em sistemas 64 bits com a letra "r"

  
  mov eax, SYS_WRITE 
  mov ebx, STD_OUT

  ; sempre que for mostrar uma mensagem mova (EAX) para SYS_WRITE ou o valor 4
  ; e, (EBX) para STD_OUT ou o valor 1

  mov ecx, msg
  mov edx, len
  int 0x80

  ; Entrada de Dados
  
  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  mov edx, MAX_IN ; variavel definida no inicio do codigo so suporta 10 caracteres de entrada
  int 0x80

exit:
  
  mov eax, SYS_EXIT
  mov ebx, RET_EXIT ; xor ebx, ebx	
  int 0x80
  
