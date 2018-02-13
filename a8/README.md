Unindo Assembly com C++

*************************************************************************

Compilando Assembly com C++

$ nasm -f elf64 arquivo.asm -o arquivo.o

$ g++ arquivo.o arquivo.cpp -o runme

$ ./runme

*************************************************************************

Melhorando a compilação do programa

-> Crie um arquivo chamando "makefile", este nome é obrigatório.

$ vim makefile

Conteudo do arquivo:

runme: arquivo.cpp arquivo.o
	g++ arquivo.o arquivo.cpp -o runme

arquivo.o: arquivo.asm
	nasm -f elf64 arquivo.asm -o arquivo.o


Obervação:

Os espaços dentro do arquivo deve sem feitos com 1 [TAB]

Se houver algum arquivo.o ou o arquivo runme, apague-os

A palavra "arquivo" está aqui apenas para exemplo

Execute o comando:

$ make

Execute o programa:

$ ./runme

*************************************************************************
	
	



