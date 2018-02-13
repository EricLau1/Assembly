global GetValorASM

segment .text

GetValorASM:
  mov eax, edi	; edi recebe o valor da variavel eviada do c++
  add eax, 1
  ret
