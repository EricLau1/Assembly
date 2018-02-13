;----------------------------------------------;
;	Comentários em Assembly	               ;
;					       ;
;	são definidos por ponto e virgula      ;
;					       ;
;	Primeiro programa: Hello world	       ;
;					       ;
;----------------------------------------------;

; section data: é onde será definida as variáveis
section .data:

  msg db 'Hello world', 0xa ; definindo uma variavel "msg" do tipo binaria "db" que recebe o valor 'Hello world' na posição "0xa" 
  len equ $ - msg 	    ; obtendo o tamanho da variavel msg


; section .text: é onde o programa será escrito
section .text:

global _start ; este será o primeiro método a ser chamado nesta seção do programa

_start:

  mov edx, len
  mov ecx, msg	; escrevendo a mensagem
  mov ebx, 1	; arquivo de saída/irá mostrar a mensagem na tela
  mov eax, 4 	; esse comando manda a informação para o sistema
  int 0x80  	; endereço do kernel / envia a informação para o kernel para ser executado

; saída

  mov eax, 1	; mover eax para seu valor original -> 1
  mov ebx, 0
  int 0x80	
  
