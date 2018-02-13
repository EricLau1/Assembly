****
Assembly on Linux

*****************************************************************************************************************************************************
Instalando o NASM:

$ sudo apt install nasm

*****************************************************************************************************************************************************

Compilando scripts em assembly no Shell:

Para sistemas 64 bits:

$ nasm -f elf64 arquivo.asm

Para sistemas 32 bits:

$ nasm -f elf32 arquivo.asm

**************************************************************************************************************************************************

Criando um executável a partir do "arquivo.o"

$ ld arquivo.o -o arquivo_executavel

**************************************************************************************************************************************************

Outra forma de gerar o executável:

executável para sistemas 64 bits:

$ ld -s -o nome_do_executavel arquivo.o

executável para sistemas 32 bits:

$ ld -m elf_i386 -o arquivo_executavel arquivo.o 

Para executar os programas:

$ ./nome_do_executavel

******************************************

Mostrar especificações dos arquivos:

$ file arquivo*

*****************************************

Mostrar o codigo fonte do executável:

$ objdump -dM intel arquivo_executavel




