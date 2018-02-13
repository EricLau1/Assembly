;Programa: Menu - Calculadora

section .data
  
  ; o valor 10 quebra a linha da String (\n)
  
  tit db 10, '+-------------+', 10,'| Calculadora |', 10,'+-------------+',0
  
  ; o valor 0 finaliza a String 

  ltit equ $ - tit ; recebe o tamanho de tit, quantidade de caracteres

  msgValor1  db 10, 'Valor 1: ', 0
  lmVal1    equ $ - msgValor1		; length msgValor1
  
  msgValor2  db 10, 'Valor 2: ', 0 
  lmVal2    equ $ - msgValor2 		; length msgValor2

  ; Opções

  opc1	db 10, '1. Soma', 0
  lopc1 equ $ - opc1			; length opc1

  opc2  db 10, '2. Subtracao', 0
  lopc2 equ $ - opc2			; length opc2

  opc3  db 10, '3. Multiplicacao', 0
  lopc3 equ $ - opc3			; length opc3

  opc4  db 10, '4. Divisao', 0
  lopc4 equ $ - opc4			; length opc4

  esc 	db 10, 'Escolha: ', 0
  lesc  equ $ - esc			; length esc

  err	db 10, 'Erro, opcao invalida!'
  lerr  equ $ - err			; length err 

  endl	db 10, 0			; pula linha (\n)
  lendl equ $ - endl			; length endl

; Variaveis de entrada
; Variaveis que podem ser modificadas

section .bss
 
  opcao   resb 2
  n1	  resb 2
  n2	  resb 2
  result  resb 2

section .text

  global _start:

_start:

 ; Mostrando o Titulo
 
  mov ecx, tit		; mov tit para ecx
  mov edx, ltit		; mov ltit para edx
  call print

 ; Mostrando a primeira mensagem de entrada

  mov ecx, msgValor1
  mov edx, lmVal1
  call print		; função print definida abaixo
 
 ; Lendo o primeiro valor...

  mov ecx, n1
  mov edx, 10	; move edx para o tamanho 10
  mov eax, 3	; código de entrada
  mov ebx, 0
  int 80h


 ; Mostrando a segunda mensagem de entrada

  mov ecx, msgValor2
  mov edx, lmVal2
  call print

 ; Lendo o segundo valor...

  mov ecx, n2
  mov edx, 10
  mov eax, 3
  mov ebx, 0
  int 80h

 ; Imprimindo as opções do Menu - Calculadora
 
 ; Opção 1 - Soma 
  mov ecx, opc1
  mov edx, lopc1
  call print

 ; Opção 2 - Subtração
  mov ecx, opc2
  mov edx, lopc2
  call print

 ; Opção 3 - Multiplicação
  mov ecx, opc3
  mov edx, lopc3
  call print

 ; Opção 4 - Divisão
  mov ecx, opc4
  mov edx, lopc4
  call print

 ; Imprimindo a mensagem de escolha
  mov ecx, esc
  mov edx, lesc
  call print
 
 ; Lendo o valor escolhido
  mov ecx, opcao,
  mov edx, 2		; tamanho 2 definido na section .bss
  mov eax, 3 		; código de entrada de dados
  mov ebx, 0
  int 80h

 ; Continuando...

  mov ah, [opcao]	; move o ponteiro de "option" para ah
  sub ah, '0'		; remove o 0 da String, converte para decimal

 ; Verificando as opçoes escolhidas

  cmp ah, 1
  je somar		; if (ah == 1) chama o método somar

  cmp ah, 2
  je subtrair		; if (ah == 2) chama o método subtrair

  cmp ah, 3
  je multiplicar	; if (ah == 3) chama o método multiplicar

  cmp ah, 4
  je dividir		; if (ah == 4) chama o método dividir

 ; Caso nenhum opção seja verdadeira...

 ; Imprimindo Mensagem de Erro
  mov ecx, err
  mov edx, lerr
  call print
  jmp exit		; pula para o método sem verificação

;--------------------------------------------------------------------

; Métodos

;--------------------------------------------------------------------

; Método Somar

somar:

  ; add eax, ebx
  jmp exit

;--------------------------------------------------------------------

; Método Subtrair

subtrair:

  ; sub eax, ebx
  jmp exit

;--------------------------------------------------------------------

; Método Multiplicar

multiplicar:
  
  ; AX e BX  recebem os ponteiros das variaveis
  ; mul bx  - multiplica bx
  jmp exit

;--------------------------------------------------------------------

; Método Dividir

dividir:

  ; AX e BX
  ; div bx
  jmp exit

;--------------------------------------------------------------------

 ; Método para imprimir na tela

print:
  mov eax, 4
  mov ebx, 0
  int 80h
  ret			; retorna para o ponto onde foi chamada
 
;--------------------------------------------------------------------

; Método para sair do programa

exit:
  mov ecx, endl
  mov edx, lendl
  call print
  mov eax, 1
  mov ebx, 0
  int 80h
 
