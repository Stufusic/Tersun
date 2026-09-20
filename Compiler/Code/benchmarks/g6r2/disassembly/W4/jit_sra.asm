
benchmarks/g6r2/disassembly/W4/jit_sra.asm_func_320.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	55                   	push   rbp
   1:	48 89 e5             	mov    rbp,rsp
   4:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   8:	53                   	push   rbx
   9:	56                   	push   rsi
   a:	57                   	push   rdi
   b:	41 54                	push   r12
   d:	41 55                	push   r13
   f:	41 56                	push   r14
  11:	41 57                	push   r15
  13:	48 81 ec 48 00 00 00 	sub    rsp,0x48
  1a:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
  1e:	49 8b 32             	mov    rsi,QWORD PTR [r10]
  21:	48 c1 e6 10          	shl    rsi,0x10
  25:	48 c1 fe 10          	sar    rsi,0x10
  29:	49 8b 5a 10          	mov    rbx,QWORD PTR [r10+0x10]
  2d:	48 c1 e3 10          	shl    rbx,0x10
  31:	48 c1 fb 10          	sar    rbx,0x10
  35:	4d 8b 6a 20          	mov    r13,QWORD PTR [r10+0x20]
  39:	49 c1 e5 10          	shl    r13,0x10
  3d:	49 c1 fd 10          	sar    r13,0x10
  41:	49 8b 7a 78          	mov    rdi,QWORD PTR [r10+0x78]
  45:	48 c1 e7 10          	shl    rdi,0x10
  49:	48 c1 ff 10          	sar    rdi,0x10
  4d:	48 b8 a0 bc 3a 82 f6 	movabs rax,0x7ff6823abca0
  54:	7f 00 00 
  57:	ff d0                	call   rax
  59:	48 89 c3             	mov    rbx,rax
  5c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  60:	48 89 de             	mov    rsi,rbx
  63:	48 bf 0a 00 00 00 00 	movabs rdi,0xa
  6a:	00 00 00 
  6d:	49 bc 14 00 00 00 00 	movabs r12,0x14
  74:	00 00 00 
  77:	49 bd 02 00 00 00 00 	movabs r13,0x2
  7e:	00 00 00 
  81:	49 be 03 00 00 00 00 	movabs r14,0x3
  88:	00 00 00 
  8b:	49 89 ff             	mov    r15,rdi
  8e:	4d 89 e0             	mov    r8,r12
  91:	4d 89 e9             	mov    r9,r13
  94:	4c 89 f1             	mov    rcx,r14
  97:	48 ba 00 00 00 00 00 	movabs rdx,0x0
  9e:	00 00 00 
  a1:	48 89 d3             	mov    rbx,rdx
  a4:	48 b8 40 0d 03 00 00 	movabs rax,0x30d40
  ab:	00 00 00 
  ae:	48 89 c7             	mov    rdi,rax
  b1:	49 bc 00 00 00 00 00 	movabs r12,0x0
  b8:	00 00 00 
  bb:	4d 89 e5             	mov    r13,r12
  be:	e9 00 00 00 00       	jmp    0xc3
  c3:	49 39 fd             	cmp    r13,rdi
  c6:	49 be 00 00 00 00 00 	movabs r14,0x0
  cd:	00 00 00 
  d0:	0f 8d 0a 00 00 00    	jge    0xe0
  d6:	49 be 01 00 00 00 00 	movabs r14,0x1
  dd:	00 00 00 
  e0:	4d 85 f6             	test   r14,r14
  e3:	0f 84 b6 00 00 00    	je     0x19f
  e9:	e9 00 00 00 00       	jmp    0xee
  ee:	4c 89 fa             	mov    rdx,r15
  f1:	4c 01 ca             	add    rdx,r9
  f4:	49 89 d7             	mov    r15,rdx
  f7:	4c 89 c0             	mov    rax,r8
  fa:	48 01 c8             	add    rax,rcx
  fd:	49 89 c0             	mov    r8,rax
 100:	49 89 d4             	mov    r12,rdx
 103:	4c 0f af e2          	imul   r12,rdx
 107:	49 89 c6             	mov    r14,rax
 10a:	4c 0f af f0          	imul   r14,rax
 10e:	4c 89 e2             	mov    rdx,r12
 111:	4c 01 f2             	add    rdx,r14
 114:	48 b8 07 ca 9a 3b 00 	movabs rax,0x3b9aca07
 11b:	00 00 00 
 11e:	49 89 c3             	mov    r11,rax
 121:	48 89 d0             	mov    rax,rdx
 124:	48 99                	cqo
 126:	49 f7 fb             	idiv   r11
 129:	49 89 d4             	mov    r12,rdx
 12c:	49 89 de             	mov    r14,rbx
 12f:	4d 01 e6             	add    r14,r12
 132:	4c 89 f3             	mov    rbx,r14
 135:	48 ba 00 ca 9a 3b 00 	movabs rdx,0x3b9aca00
 13c:	00 00 00 
 13f:	49 39 d6             	cmp    r14,rdx
 142:	48 b8 00 00 00 00 00 	movabs rax,0x0
 149:	00 00 00 
 14c:	0f 8e 0a 00 00 00    	jle    0x15c
 152:	48 b8 01 00 00 00 00 	movabs rax,0x1
 159:	00 00 00 
 15c:	48 85 c0             	test   rax,rax
 15f:	0f 84 22 00 00 00    	je     0x187
 165:	e9 00 00 00 00       	jmp    0x16a
 16a:	49 bc 00 ca 9a 3b 00 	movabs r12,0x3b9aca00
 171:	00 00 00 
 174:	48 89 d8             	mov    rax,rbx
 177:	48 99                	cqo
 179:	49 f7 fc             	idiv   r12
 17c:	49 89 d6             	mov    r14,rdx
 17f:	4c 89 f3             	mov    rbx,r14
 182:	e9 00 00 00 00       	jmp    0x187
 187:	48 ba 01 00 00 00 00 	movabs rdx,0x1
 18e:	00 00 00 
 191:	4c 89 e8             	mov    rax,r13
 194:	48 01 d0             	add    rax,rdx
 197:	49 89 c5             	mov    r13,rax
 19a:	e9 24 ff ff ff       	jmp    0xc3
 19f:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
 1a3:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
 1a7:	49 89 f3             	mov    r11,rsi
 1aa:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 1b1:	ff 00 00 
 1b4:	49 21 c3             	and    r11,rax
 1b7:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 1be:	00 f8 ff 
 1c1:	49 09 c3             	or     r11,rax
 1c4:	4d 89 1a             	mov    QWORD PTR [r10],r11
 1c7:	49 89 db             	mov    r11,rbx
 1ca:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 1d1:	ff 00 00 
 1d4:	49 21 c3             	and    r11,rax
 1d7:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 1de:	00 f8 ff 
 1e1:	49 09 c3             	or     r11,rax
 1e4:	4d 89 5a 10          	mov    QWORD PTR [r10+0x10],r11
 1e8:	4d 89 eb             	mov    r11,r13
 1eb:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 1f2:	ff 00 00 
 1f5:	49 21 c3             	and    r11,rax
 1f8:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 1ff:	00 f8 ff 
 202:	49 09 c3             	or     r11,rax
 205:	4d 89 5a 20          	mov    QWORD PTR [r10+0x20],r11
 209:	49 89 fb             	mov    r11,rdi
 20c:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 213:	ff 00 00 
 216:	49 21 c3             	and    r11,rax
 219:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 220:	00 f8 ff 
 223:	49 09 c3             	or     r11,rax
 226:	4d 89 5a 78          	mov    QWORD PTR [r10+0x78],r11
 22a:	48 c7 42 48 a4 02 00 	mov    QWORD PTR [rdx+0x48],0x2a4
 231:	00 
 232:	48 c7 42 4c 00 00 00 	mov    QWORD PTR [rdx+0x4c],0x0
 239:	00 
 23a:	48 c7 42 50 05 00 00 	mov    QWORD PTR [rdx+0x50],0x5
 241:	00 
 242:	48 31 c0             	xor    rax,rax
 245:	48 81 c4 48 00 00 00 	add    rsp,0x48
 24c:	41 5f                	pop    r15
 24e:	41 5e                	pop    r14
 250:	41 5d                	pop    r13
 252:	41 5c                	pop    r12
 254:	5f                   	pop    rdi
 255:	5e                   	pop    rsi
 256:	5b                   	pop    rbx
 257:	5d                   	pop    rbp
 258:	c3                   	ret
 259:	49 be 08 00 00 00 00 	movabs r14,0x8
 260:	00 00 00 
 263:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
 267:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
 26b:	49 89 f3             	mov    r11,rsi
 26e:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 275:	ff 00 00 
 278:	49 21 c3             	and    r11,rax
 27b:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 282:	00 f8 ff 
 285:	49 09 c3             	or     r11,rax
 288:	4d 89 1a             	mov    QWORD PTR [r10],r11
 28b:	49 89 db             	mov    r11,rbx
 28e:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 295:	ff 00 00 
 298:	49 21 c3             	and    r11,rax
 29b:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 2a2:	00 f8 ff 
 2a5:	49 09 c3             	or     r11,rax
 2a8:	4d 89 5a 10          	mov    QWORD PTR [r10+0x10],r11
 2ac:	4d 89 eb             	mov    r11,r13
 2af:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 2b6:	ff 00 00 
 2b9:	49 21 c3             	and    r11,rax
 2bc:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 2c3:	00 f8 ff 
 2c6:	49 09 c3             	or     r11,rax
 2c9:	4d 89 5a 20          	mov    QWORD PTR [r10+0x20],r11
 2cd:	49 89 fb             	mov    r11,rdi
 2d0:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 2d7:	ff 00 00 
 2da:	49 21 c3             	and    r11,rax
 2dd:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 2e4:	00 f8 ff 
 2e7:	49 09 c3             	or     r11,rax
 2ea:	4d 89 5a 78          	mov    QWORD PTR [r10+0x78],r11
 2ee:	48 c7 42 48 ba 02 00 	mov    QWORD PTR [rdx+0x48],0x2ba
 2f5:	00 
 2f6:	48 c7 42 4c 00 00 00 	mov    QWORD PTR [rdx+0x4c],0x0
 2fd:	00 
 2fe:	48 c7 42 50 05 00 00 	mov    QWORD PTR [rdx+0x50],0x5
 305:	00 
 306:	48 31 c0             	xor    rax,rax
 309:	48 81 c4 48 00 00 00 	add    rsp,0x48
 310:	41 5f                	pop    r15
 312:	41 5e                	pop    r14
 314:	41 5d                	pop    r13
 316:	41 5c                	pop    r12
 318:	5f                   	pop    rdi
 319:	5e                   	pop    rsi
 31a:	5b                   	pop    rbx
 31b:	5d                   	pop    rbp
 31c:	c3                   	ret
 31d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
 321:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
 325:	49 89 f3             	mov    r11,rsi
 328:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 32f:	ff 00 00 
 332:	49 21 c3             	and    r11,rax
 335:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 33c:	00 f8 ff 
 33f:	49 09 c3             	or     r11,rax
 342:	4d 89 1a             	mov    QWORD PTR [r10],r11
 345:	49 89 db             	mov    r11,rbx
 348:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 34f:	ff 00 00 
 352:	49 21 c3             	and    r11,rax
 355:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 35c:	00 f8 ff 
 35f:	49 09 c3             	or     r11,rax
 362:	4d 89 5a 10          	mov    QWORD PTR [r10+0x10],r11
 366:	4d 89 eb             	mov    r11,r13
 369:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 370:	ff 00 00 
 373:	49 21 c3             	and    r11,rax
 376:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 37d:	00 f8 ff 
 380:	49 09 c3             	or     r11,rax
 383:	4d 89 5a 20          	mov    QWORD PTR [r10+0x20],r11
 387:	49 89 fb             	mov    r11,rdi
 38a:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 391:	ff 00 00 
 394:	49 21 c3             	and    r11,rax
 397:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 39e:	00 f8 ff 
 3a1:	49 09 c3             	or     r11,rax
 3a4:	4d 89 5a 78          	mov    QWORD PTR [r10+0x78],r11
 3a8:	48 c7 42 48 d2 02 00 	mov    QWORD PTR [rdx+0x48],0x2d2
 3af:	00 
 3b0:	48 c7 42 4c 00 00 00 	mov    QWORD PTR [rdx+0x4c],0x0
 3b7:	00 
 3b8:	48 c7 42 50 05 00 00 	mov    QWORD PTR [rdx+0x50],0x5
 3bf:	00 
 3c0:	48 31 c0             	xor    rax,rax
 3c3:	48 81 c4 48 00 00 00 	add    rsp,0x48
 3ca:	41 5f                	pop    r15
 3cc:	41 5e                	pop    r14
 3ce:	41 5d                	pop    r13
 3d0:	41 5c                	pop    r12
 3d2:	5f                   	pop    rdi
 3d3:	5e                   	pop    rsi
 3d4:	5b                   	pop    rbx
 3d5:	5d                   	pop    rbp
 3d6:	c3                   	ret
 3d7:	48 ba 09 00 00 00 00 	movabs rdx,0x9
 3de:	00 00 00 
 3e1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
 3e5:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
 3e9:	49 89 f3             	mov    r11,rsi
 3ec:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 3f3:	ff 00 00 
 3f6:	49 21 c3             	and    r11,rax
 3f9:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 400:	00 f8 ff 
 403:	49 09 c3             	or     r11,rax
 406:	4d 89 1a             	mov    QWORD PTR [r10],r11
 409:	49 89 db             	mov    r11,rbx
 40c:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 413:	ff 00 00 
 416:	49 21 c3             	and    r11,rax
 419:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 420:	00 f8 ff 
 423:	49 09 c3             	or     r11,rax
 426:	4d 89 5a 10          	mov    QWORD PTR [r10+0x10],r11
 42a:	4d 89 eb             	mov    r11,r13
 42d:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 434:	ff 00 00 
 437:	49 21 c3             	and    r11,rax
 43a:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 441:	00 f8 ff 
 444:	49 09 c3             	or     r11,rax
 447:	4d 89 5a 20          	mov    QWORD PTR [r10+0x20],r11
 44b:	49 89 fb             	mov    r11,rdi
 44e:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 455:	ff 00 00 
 458:	49 21 c3             	and    r11,rax
 45b:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 462:	00 f8 ff 
 465:	49 09 c3             	or     r11,rax
 468:	4d 89 5a 78          	mov    QWORD PTR [r10+0x78],r11
 46c:	48 c7 42 48 ea 02 00 	mov    QWORD PTR [rdx+0x48],0x2ea
 473:	00 
 474:	48 c7 42 4c 00 00 00 	mov    QWORD PTR [rdx+0x4c],0x0
 47b:	00 
 47c:	48 c7 42 50 05 00 00 	mov    QWORD PTR [rdx+0x50],0x5
 483:	00 
 484:	48 31 c0             	xor    rax,rax
 487:	48 81 c4 48 00 00 00 	add    rsp,0x48
 48e:	41 5f                	pop    r15
 490:	41 5e                	pop    r14
 492:	41 5d                	pop    r13
 494:	41 5c                	pop    r12
 496:	5f                   	pop    rdi
 497:	5e                   	pop    rsi
 498:	5b                   	pop    rbx
 499:	5d                   	pop    rbp
 49a:	c3                   	ret
 49b:	4c 89 e0             	mov    rax,r12
 49e:	48 29 f0             	sub    rax,rsi
 4a1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
 4a5:	4c 8b 52 10          	mov    r10,QWORD PTR [rdx+0x10]
 4a9:	49 89 f3             	mov    r11,rsi
 4ac:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 4b3:	ff 00 00 
 4b6:	49 21 c3             	and    r11,rax
 4b9:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 4c0:	00 f8 ff 
 4c3:	49 09 c3             	or     r11,rax
 4c6:	4d 89 1a             	mov    QWORD PTR [r10],r11
 4c9:	49 89 db             	mov    r11,rbx
 4cc:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 4d3:	ff 00 00 
 4d6:	49 21 c3             	and    r11,rax
 4d9:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 4e0:	00 f8 ff 
 4e3:	49 09 c3             	or     r11,rax
 4e6:	4d 89 5a 10          	mov    QWORD PTR [r10+0x10],r11
 4ea:	4d 89 eb             	mov    r11,r13
 4ed:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 4f4:	ff 00 00 
 4f7:	49 21 c3             	and    r11,rax
 4fa:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 501:	00 f8 ff 
 504:	49 09 c3             	or     r11,rax
 507:	4d 89 5a 20          	mov    QWORD PTR [r10+0x20],r11
 50b:	49 89 fb             	mov    r11,rdi
 50e:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
 515:	ff 00 00 
 518:	49 21 c3             	and    r11,rax
 51b:	48 b8 00 00 00 00 00 	movabs rax,0xfff8000000000000
 522:	00 f8 ff 
 525:	49 09 c3             	or     r11,rax
 528:	4d 89 5a 78          	mov    QWORD PTR [r10+0x78],r11
 52c:	48 c7 42 48 14 03 00 	mov    QWORD PTR [rdx+0x48],0x314
 533:	00 
 534:	48 c7 42 4c 00 00 00 	mov    QWORD PTR [rdx+0x4c],0x0
 53b:	00 
 53c:	48 c7 42 50 05 00 00 	mov    QWORD PTR [rdx+0x50],0x5
 543:	00 
 544:	48 31 c0             	xor    rax,rax
 547:	48 81 c4 48 00 00 00 	add    rsp,0x48
 54e:	41 5f                	pop    r15
 550:	41 5e                	pop    r14
 552:	41 5d                	pop    r13
 554:	41 5c                	pop    r12
 556:	5f                   	pop    rdi
 557:	5e                   	pop    rsi
 558:	5b                   	pop    rbx
 559:	5d                   	pop    rbp
 55a:	c3                   	ret
 55b:	49 bf 00 00 00 00 00 	movabs r15,0x0
 562:	00 00 00 
 565:	4c 89 f8             	mov    rax,r15
 568:	49 ba ff ff ff ff ff 	movabs r10,0xffffffffffff
 56f:	ff 00 00 
 572:	4c 21 d0             	and    rax,r10
 575:	49 bb 00 00 00 00 00 	movabs r11,0xfff8000000000000
 57c:	00 f8 ff 
 57f:	4c 09 d8             	or     rax,r11
 582:	48 81 c4 48 00 00 00 	add    rsp,0x48
 589:	41 5f                	pop    r15
 58b:	41 5e                	pop    r14
 58d:	41 5d                	pop    r13
 58f:	41 5c                	pop    r12
 591:	5f                   	pop    rdi
 592:	5e                   	pop    rsi
 593:	5b                   	pop    rbx
 594:	5d                   	pop    rbp
 595:	c3                   	ret
