runme: a8.cpp a8.o
	g++ a8.o a8.cpp -o runme

a8.o: a8.asm
	nasm -f elf64 a8.asm -o a8.o
