Comparação entre Assembly e linguagem C

***********************************************************

Compilando o programa em C:

$ make main

execute o programa:

$ ./main

veja o resultado: 

$ echo $?

**************************************************************

Compilando para 64 bits:

$ nasm -f elf64 main.asm

Criando executável 64 bits:

$ ld -s -o main64 main.o

**************************************************************

Compilando para 32 bits:

$ nasm -f elf32 main.asm

Criando executável 32 bits:

$ ld -m elf_i386 -o main32 main.o

**************************************************************

mostrar especificações de cada arquivo:

$ file main*

Saida:

main:     ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=f861ac206f21519d4b0fc3906d6d4877409cb5b3, not stripped

main32:   ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, not stripped
main64:   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
main.asm: UTF-8 Unicode text

main.c:   C source, ASCII text
main.o:   ELF 32-bit LSB relocatable, Intel 80386, version 1 (SYSV), not stripped

Os arquivos de execução programados em assmebly são executáveis.

Os arquivo de execução programado em C é um objeto compartilhado, e só pode ser executado por intermédio das bibliotecas pré programadas.

Como visualizar as bibliotecas que o programa depende para ser executado:

$ ldd main

******************************************************************

Visualizar o códigos fonte dos executáveis:

$ objdump -dM intel main64

$ objdump -dM intel main32

$ objdump -dM intel main

******************************************************************

codigo fonte do executável assembly 64 bit:

main64:     file format elf64-x86-64


Disassembly of section .text:

0000000000400080 <.text>:
  400080:	b8 01 00 00 00       	mov    eax,0x1
  400085:	bb 02 00 00 00       	mov    ebx,0x2
  40008a:	cd 80                	int    0x80


codigo fonte do executável assembly 32 bit:

main32:     file format elf32-i386


Disassembly of section .text:

08048060 <_start>:
 8048060:	b8 01 00 00 00       	mov    eax,0x1
 8048065:	bb 02 00 00 00       	mov    ebx,0x2
 804806a:	cd 80                	int    0x80

codigo fonte do executável programado em C:

main:     file format elf64-x86-64


Disassembly of section .init:

00000000000004f8 <_init>:
 4f8:	48 83 ec 08          	sub    rsp,0x8
 4fc:	48 8b 05 dd 0a 20 00 	mov    rax,QWORD PTR [rip+0x200add]        # 200fe0 <__gmon_start__>
 503:	48 85 c0             	test   rax,rax
 506:	74 02                	je     50a <_init+0x12>
 508:	ff d0                	call   rax
 50a:	48 83 c4 08          	add    rsp,0x8
 50e:	c3                   	ret    

Disassembly of section .plt:

0000000000000510 <.plt>:
 510:	ff 35 f2 0a 20 00    	push   QWORD PTR [rip+0x200af2]        # 201008 <_GLOBAL_OFFSET_TABLE_+0x8>
 516:	ff 25 f4 0a 20 00    	jmp    QWORD PTR [rip+0x200af4]        # 201010 <_GLOBAL_OFFSET_TABLE_+0x10>
 51c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

Disassembly of section .plt.got:

0000000000000520 <.plt.got>:
 520:	ff 25 d2 0a 20 00    	jmp    QWORD PTR [rip+0x200ad2]        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 526:	66 90                	xchg   ax,ax

Disassembly of section .text:

0000000000000530 <_start>:
 530:	31 ed                	xor    ebp,ebp
 532:	49 89 d1             	mov    r9,rdx
 535:	5e                   	pop    rsi
 536:	48 89 e2             	mov    rdx,rsp
 539:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
 53d:	50                   	push   rax
 53e:	54                   	push   rsp
 53f:	4c 8d 05 9a 01 00 00 	lea    r8,[rip+0x19a]        # 6e0 <__libc_csu_fini>
 546:	48 8d 0d 23 01 00 00 	lea    rcx,[rip+0x123]        # 670 <__libc_csu_init>
 54d:	48 8d 3d 0c 01 00 00 	lea    rdi,[rip+0x10c]        # 660 <main>
 554:	ff 15 7e 0a 20 00    	call   QWORD PTR [rip+0x200a7e]        # 200fd8 <__libc_start_main@GLIBC_2.2.5>
 55a:	f4                   	hlt    
 55b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000000560 <deregister_tm_clones>:
 560:	48 8d 3d c1 0a 20 00 	lea    rdi,[rip+0x200ac1]        # 201028 <__TMC_END__>
 567:	48 8d 05 c1 0a 20 00 	lea    rax,[rip+0x200ac1]        # 20102f <__TMC_END__+0x7>
 56e:	55                   	push   rbp
 56f:	48 29 f8             	sub    rax,rdi
 572:	48 89 e5             	mov    rbp,rsp
 575:	48 83 f8 0e          	cmp    rax,0xe
 579:	76 15                	jbe    590 <deregister_tm_clones+0x30>
 57b:	48 8b 05 4e 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a4e]        # 200fd0 <_ITM_deregisterTMCloneTable>
 582:	48 85 c0             	test   rax,rax
 585:	74 09                	je     590 <deregister_tm_clones+0x30>
 587:	5d                   	pop    rbp
 588:	ff e0                	jmp    rax
 58a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
 590:	5d                   	pop    rbp
 591:	c3                   	ret    
 592:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 596:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 59d:	00 00 00 

00000000000005a0 <register_tm_clones>:
 5a0:	48 8d 3d 81 0a 20 00 	lea    rdi,[rip+0x200a81]        # 201028 <__TMC_END__>
 5a7:	48 8d 35 7a 0a 20 00 	lea    rsi,[rip+0x200a7a]        # 201028 <__TMC_END__>
 5ae:	55                   	push   rbp
 5af:	48 29 fe             	sub    rsi,rdi
 5b2:	48 89 e5             	mov    rbp,rsp
 5b5:	48 c1 fe 03          	sar    rsi,0x3
 5b9:	48 89 f0             	mov    rax,rsi
 5bc:	48 c1 e8 3f          	shr    rax,0x3f
 5c0:	48 01 c6             	add    rsi,rax
 5c3:	48 d1 fe             	sar    rsi,1
 5c6:	74 18                	je     5e0 <register_tm_clones+0x40>
 5c8:	48 8b 05 21 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a21]        # 200ff0 <_ITM_registerTMCloneTable>
 5cf:	48 85 c0             	test   rax,rax
 5d2:	74 0c                	je     5e0 <register_tm_clones+0x40>
 5d4:	5d                   	pop    rbp
 5d5:	ff e0                	jmp    rax
 5d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
 5de:	00 00 
 5e0:	5d                   	pop    rbp
 5e1:	c3                   	ret    
 5e2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 5e6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 5ed:	00 00 00 

00000000000005f0 <__do_global_dtors_aux>:
 5f0:	80 3d 31 0a 20 00 00 	cmp    BYTE PTR [rip+0x200a31],0x0        # 201028 <__TMC_END__>
 5f7:	75 27                	jne    620 <__do_global_dtors_aux+0x30>
 5f9:	48 83 3d f7 09 20 00 	cmp    QWORD PTR [rip+0x2009f7],0x0        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 600:	00 
 601:	55                   	push   rbp
 602:	48 89 e5             	mov    rbp,rsp
 605:	74 0c                	je     613 <__do_global_dtors_aux+0x23>
 607:	48 8b 3d 12 0a 20 00 	mov    rdi,QWORD PTR [rip+0x200a12]        # 201020 <__dso_handle>
 60e:	e8 0d ff ff ff       	call   520 <.plt.got>
 613:	e8 48 ff ff ff       	call   560 <deregister_tm_clones>
 618:	5d                   	pop    rbp
 619:	c6 05 08 0a 20 00 01 	mov    BYTE PTR [rip+0x200a08],0x1        # 201028 <__TMC_END__>
 620:	f3 c3                	repz ret 
 622:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
 626:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 62d:	00 00 00 

0000000000000630 <frame_dummy>:
 630:	48 8d 3d e1 07 20 00 	lea    rdi,[rip+0x2007e1]        # 200e18 <__JCR_END__>
 637:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
 63b:	75 0b                	jne    648 <frame_dummy+0x18>
 63d:	e9 5e ff ff ff       	jmp    5a0 <register_tm_clones>
 642:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
 648:	48 8b 05 99 09 20 00 	mov    rax,QWORD PTR [rip+0x200999]        # 200fe8 <_Jv_RegisterClasses>
 64f:	48 85 c0             	test   rax,rax
 652:	74 e9                	je     63d <frame_dummy+0xd>
 654:	55                   	push   rbp
 655:	48 89 e5             	mov    rbp,rsp
 658:	ff d0                	call   rax
 65a:	5d                   	pop    rbp
 65b:	e9 40 ff ff ff       	jmp    5a0 <register_tm_clones>

0000000000000660 <main>:
 660:	55                   	push   rbp
 661:	48 89 e5             	mov    rbp,rsp
 664:	b8 02 00 00 00       	mov    eax,0x2
 669:	5d                   	pop    rbp
 66a:	c3                   	ret    
 66b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000000670 <__libc_csu_init>:
 670:	41 57                	push   r15
 672:	41 56                	push   r14
 674:	41 89 ff             	mov    r15d,edi
 677:	41 55                	push   r13
 679:	41 54                	push   r12
 67b:	4c 8d 25 86 07 20 00 	lea    r12,[rip+0x200786]        # 200e08 <__frame_dummy_init_array_entry>
 682:	55                   	push   rbp
 683:	48 8d 2d 86 07 20 00 	lea    rbp,[rip+0x200786]        # 200e10 <__init_array_end>
 68a:	53                   	push   rbx
 68b:	49 89 f6             	mov    r14,rsi
 68e:	49 89 d5             	mov    r13,rdx
 691:	4c 29 e5             	sub    rbp,r12
 694:	48 83 ec 08          	sub    rsp,0x8
 698:	48 c1 fd 03          	sar    rbp,0x3
 69c:	e8 57 fe ff ff       	call   4f8 <_init>
 6a1:	48 85 ed             	test   rbp,rbp
 6a4:	74 20                	je     6c6 <__libc_csu_init+0x56>
 6a6:	31 db                	xor    ebx,ebx
 6a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
 6af:	00 
 6b0:	4c 89 ea             	mov    rdx,r13
 6b3:	4c 89 f6             	mov    rsi,r14
 6b6:	44 89 ff             	mov    edi,r15d
 6b9:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
 6bd:	48 83 c3 01          	add    rbx,0x1
 6c1:	48 39 dd             	cmp    rbp,rbx
 6c4:	75 ea                	jne    6b0 <__libc_csu_init+0x40>
 6c6:	48 83 c4 08          	add    rsp,0x8
 6ca:	5b                   	pop    rbx
 6cb:	5d                   	pop    rbp
 6cc:	41 5c                	pop    r12
 6ce:	41 5d                	pop    r13
 6d0:	41 5e                	pop    r14
 6d2:	41 5f                	pop    r15
 6d4:	c3                   	ret    
 6d5:	90                   	nop
 6d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
 6dd:	00 00 00 

00000000000006e0 <__libc_csu_fini>:
 6e0:	f3 c3                	repz ret 

Disassembly of section .fini:

00000000000006e4 <_fini>:
 6e4:	48 83 ec 08          	sub    rsp,0x8
 6e8:	48 83 c4 08          	add    rsp,0x8
 6ec:	c3                   	ret 


