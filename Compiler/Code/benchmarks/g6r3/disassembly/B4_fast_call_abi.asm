00000001401222d0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   1401222d0:	41 57                	push   %r15
   1401222d2:	41 56                	push   %r14
   1401222d4:	41 55                	push   %r13
   1401222d6:	41 54                	push   %r12
   1401222d8:	55                   	push   %rbp
   1401222d9:	57                   	push   %rdi
   1401222da:	56                   	push   %rsi
   1401222db:	53                   	push   %rbx
   1401222dc:	48 81 ec 68 09 00 00 	sub    $0x968,%rsp
   1401222e3:	c5 f8 29 b4 24 c0 08 	vmovaps %xmm6,0x8c0(%rsp)
   1401222ea:	00 00 
   1401222ec:	c5 f8 29 bc 24 d0 08 	vmovaps %xmm7,0x8d0(%rsp)
   1401222f3:	00 00 
   1401222f5:	c5 78 29 84 24 e0 08 	vmovaps %xmm8,0x8e0(%rsp)
   1401222fc:	00 00 
   1401222fe:	c5 78 29 8c 24 f0 08 	vmovaps %xmm9,0x8f0(%rsp)
   140122305:	00 00 
   140122307:	c5 78 29 94 24 00 09 	vmovaps %xmm10,0x900(%rsp)
   14012230e:	00 00 
   140122310:	c5 78 29 9c 24 10 09 	vmovaps %xmm11,0x910(%rsp)
   140122317:	00 00 
   140122319:	c5 78 29 a4 24 20 09 	vmovaps %xmm12,0x920(%rsp)
   140122320:	00 00 
   140122322:	c5 78 29 ac 24 30 09 	vmovaps %xmm13,0x930(%rsp)
   140122329:	00 00 
   14012232b:	c5 78 29 b4 24 40 09 	vmovaps %xmm14,0x940(%rsp)
   140122332:	00 00 
   140122334:	c5 78 29 bc 24 50 09 	vmovaps %xmm15,0x950(%rsp)
   14012233b:	00 00 
   14012233d:	48 8b 42 08          	mov    0x8(%rdx),%rax
   140122341:	48 2b 02             	sub    (%rdx),%rax
   140122344:	48 89 cb             	mov    %rcx,%rbx
   140122347:	49 89 d6             	mov    %rdx,%r14
   14012234a:	48 39 81 38 10 00 00 	cmp    %rax,0x1038(%rcx)
   140122351:	72 0b                	jb     14012235e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   140122353:	48 c7 81 38 10 00 00 	movq   $0x0,0x1038(%rcx)
   14012235a:	00 00 00 00 
   14012235e:	48 8b b3 c8 52 01 00 	mov    0x152c8(%rbx),%rsi
   140122365:	c6 83 40 10 00 00 01 	movb   $0x1,0x1040(%rbx)
   14012236c:	48 85 f6             	test   %rsi,%rsi
   14012236f:	74 0d                	je     14012237e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140122371:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140122378:	0f 85 0a 0a 00 00    	jne    140122d88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab8>
   14012237e:	49 8b 6e 58          	mov    0x58(%r14),%rbp
   140122382:	48 85 ed             	test   %rbp,%rbp
   140122385:	0f 84 f9 00 00 00    	je     140122484 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b4>
   14012238b:	48 8b 3d 4e 77 23 00 	mov    0x23774e(%rip),%rdi        # 140359ae0 <CSWTCH.2960+0x220>
   140122392:	4c 8d bb 00 10 00 00 	lea    0x1000(%rbx),%r15
   140122399:	b9 88 00 00 00       	mov    $0x88,%ecx
   14012239e:	4c 8d 65 08          	lea    0x8(%rbp),%r12
   1401223a2:	e8 19 39 21 00       	call   140335cc0 <operator new(unsigned long long)>
   1401223a7:	c5 e1 ef db          	vpxor  %xmm3,%xmm3,%xmm3
   1401223ab:	4c 89 e2             	mov    %r12,%rdx
   1401223ae:	48 89 c6             	mov    %rax,%rsi
   1401223b1:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1401223b5:	48 8d 05 64 68 25 00 	lea    0x256864(%rip),%rax        # 140378c20 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   1401223bc:	48 89 06             	mov    %rax,(%rsi)
   1401223bf:	48 8d 46 20          	lea    0x20(%rsi),%rax
   1401223c3:	4c 8d 6e 10          	lea    0x10(%rsi),%r13
   1401223c7:	c5 fe 7f 5e 10       	vmovdqu %ymm3,0x10(%rsi)
   1401223cc:	4c 89 e9             	mov    %r13,%rcx
   1401223cf:	48 89 46 10          	mov    %rax,0x10(%rsi)
   1401223d3:	48 8d 46 40          	lea    0x40(%rsi),%rax
   1401223d7:	c5 fe 7f 5e 30       	vmovdqu %ymm3,0x30(%rsi)
   1401223dc:	48 89 46 30          	mov    %rax,0x30(%rsi)
   1401223e0:	48 8d 86 80 00 00 00 	lea    0x80(%rsi),%rax
   1401223e7:	c5 fe 7f 5e 68       	vmovdqu %ymm3,0x68(%rsi)
   1401223ec:	48 89 46 50          	mov    %rax,0x50(%rsi)
   1401223f0:	48 c7 46 58 01 00 00 	movq   $0x1,0x58(%rsi)
   1401223f7:	00 
   1401223f8:	48 c7 46 60 00 00 00 	movq   $0x0,0x60(%rsi)
   1401223ff:	00 
   140122400:	48 c7 46 70 00 00 80 	movq   $0x3f800000,0x70(%rsi)
   140122407:	3f 
   140122408:	c5 f8 77             	vzeroupper
   14012240b:	e8 d0 ae 1c 00       	call   1402ed2e0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140122410:	48 8d 55 28          	lea    0x28(%rbp),%rdx
   140122414:	48 8d 4e 50          	lea    0x50(%rsi),%rcx
   140122418:	48 39 d1             	cmp    %rdx,%rcx
   14012241b:	74 05                	je     140122422 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   14012241d:	e8 ce 9f 17 00       	call   14029c3f0 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140122422:	4c 89 e2             	mov    %r12,%rdx
   140122425:	4c 89 f9             	mov    %r15,%rcx
   140122428:	e8 b3 b9 1f 00       	call   14031dde0 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14012242d:	4c 89 28             	mov    %r13,(%rax)
   140122430:	48 39 70 08          	cmp    %rsi,0x8(%rax)
   140122434:	74 39                	je     14012246f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f>
   140122436:	f0 83 46 08 01       	lock addl $0x1,0x8(%rsi)
   14012243b:	4c 8b 60 08          	mov    0x8(%rax),%r12
   14012243f:	4d 85 e4             	test   %r12,%r12
   140122442:	74 27                	je     14012246b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   140122444:	4d 8b 44 24 08       	mov    0x8(%r12),%r8
   140122449:	49 8d 54 24 08       	lea    0x8(%r12),%rdx
   14012244e:	48 b9 01 00 00 00 01 	movabs $0x100000001,%rcx
   140122455:	00 00 00 
   140122458:	49 39 c8             	cmp    %rcx,%r8
   14012245b:	0f 84 ef 66 00 00    	je     140128b50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6880>
   140122461:	f0 83 2a 01          	lock subl $0x1,(%rdx)
   140122465:	0f 84 6a 69 00 00    	je     140128dd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b05>
   14012246b:	48 89 70 08          	mov    %rsi,0x8(%rax)
   14012246f:	48 89 f1             	mov    %rsi,%rcx
   140122472:	e8 49 30 1b 00       	call   1402d54c0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140122477:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
   14012247b:	48 85 ed             	test   %rbp,%rbp
   14012247e:	0f 85 15 ff ff ff    	jne    140122399 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   140122484:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012248b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122492:	4d 8b 3e             	mov    (%r14),%r15
   140122495:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012249c:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401224a0:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401224a7:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401224ae:	4c 01 f9             	add    %r15,%rcx
   1401224b1:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401224b6:	4d 85 ed             	test   %r13,%r13
   1401224b9:	75 65                	jne    140122520 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x250>
   1401224bb:	49 8b 86 b0 00 00 00 	mov    0xb0(%r14),%rax
   1401224c2:	ba 20 00 00 00       	mov    $0x20,%edx
   1401224c7:	48 39 d0             	cmp    %rdx,%rax
   1401224ca:	48 0f 42 c2          	cmovb  %rdx,%rax
   1401224ce:	80 3d ab ab 29 00 00 	cmpb   $0x0,0x29abab(%rip)        # 1403bd080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   1401224d5:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   1401224dc:	74 6d                	je     14012254b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b>
   1401224de:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401224e5:	00 fb ff 
   1401224e8:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401224ef:	00 
   1401224f0:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   1401224f7:	00 
   1401224f8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401224ff:	0f 84 8a 66 00 00    	je     140128b8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68bf>
   140122505:	0f b6 01             	movzbl (%rcx),%eax
   140122508:	48 8d 3d 91 ab 29 00 	lea    0x29ab91(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012250f:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140122513:	45 31 e4             	xor    %r12d,%r12d
   140122516:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012251a:	ff e0                	jmp    *%rax
   14012251c:	0f 1f 40 00          	nopl   0x0(%rax)
   140122520:	4b 8d 44 ad 00       	lea    0x0(%r13,%r13,4),%rax
   140122525:	4c 8b ac c3 a0 10 00 	mov    0x10a0(%rbx,%rax,8),%r13
   14012252c:	00 
   14012252d:	48 8b bc c3 b0 10 00 	mov    0x10b0(%rbx,%rax,8),%rdi
   140122534:	00 
   140122535:	4c 01 ef             	add    %r13,%rdi
   140122538:	80 3d 41 ab 29 00 00 	cmpb   $0x0,0x29ab41(%rip)        # 1403bd080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14012253f:	48 89 f8             	mov    %rdi,%rax
   140122542:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140122549:	75 93                	jne    1401224de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   14012254b:	48 8d 3d 0d 65 00 00 	lea    0x650d(%rip),%rdi        # 140128a5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x678f>
   140122552:	48 8d 05 07 40 00 00 	lea    0x4007(%rip),%rax        # 140126560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140122559:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012255e:	48 8d 3d 0f 64 00 00 	lea    0x640f(%rip),%rdi        # 140128974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66a4>
   140122565:	48 8d 15 3a 2c 00 00 	lea    0x2c3a(%rip),%rdx        # 1401251a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ed6>
   14012256c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122572:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140122577:	48 8d 05 6b 64 00 00 	lea    0x646b(%rip),%rax        # 1401289e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6719>
   14012257e:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140122584:	48 8d 3d d2 40 00 00 	lea    0x40d2(%rip),%rdi        # 14012665d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x438d>
   14012258b:	48 8d 05 0f 41 00 00 	lea    0x410f(%rip),%rax        # 1401266a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43d1>
   140122592:	c4 63 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm10
   140122598:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012259d:	48 8d 3d 32 40 00 00 	lea    0x4032(%rip),%rdi        # 1401265d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4306>
   1401225a4:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401225aa:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   1401225af:	48 8d 05 63 40 00 00 	lea    0x4063(%rip),%rax        # 140126619 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4349>
   1401225b6:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401225bc:	48 8d 3d d4 42 00 00 	lea    0x42d4(%rip),%rdi        # 140126897 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45c7>
   1401225c3:	48 8d 05 5c 43 00 00 	lea    0x435c(%rip),%rax        # 140126926 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4656>
   1401225ca:	c4 63 75 38 c0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm8
   1401225d0:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401225d5:	48 8d 3d 09 41 00 00 	lea    0x4109(%rip),%rdi        # 1401266e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4415>
   1401225dc:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401225e2:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   1401225e7:	48 8d 05 9b 41 00 00 	lea    0x419b(%rip),%rax        # 140126789 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44b9>
   1401225ee:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401225f4:	48 8d 3d 62 45 00 00 	lea    0x4562(%rip),%rdi        # 140126b5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x488d>
   1401225fb:	48 8d 05 16 46 00 00 	lea    0x4616(%rip),%rax        # 140126c18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4948>
   140122602:	c4 63 75 38 c8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm9
   140122608:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012260d:	48 8d 3d d3 43 00 00 	lea    0x43d3(%rip),%rdi        # 1401269e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4717>
   140122614:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012261a:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14012261f:	48 8d 05 7c 44 00 00 	lea    0x447c(%rip),%rax        # 140126aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47d2>
   140122626:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14012262c:	48 8d 3d a0 3b 00 00 	lea    0x3ba0(%rip),%rdi        # 1401261d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f03>
   140122633:	48 8d 05 53 3c 00 00 	lea    0x3c53(%rip),%rax        # 14012628d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3fbd>
   14012263a:	c4 e3 75 38 f8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm7
   140122640:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122645:	48 8d 3d 2c 47 00 00 	lea    0x472c(%rip),%rdi        # 140126d78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4aa8>
   14012264c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122652:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140122657:	48 8d 05 7a 48 00 00 	lea    0x487a(%rip),%rax        # 140126ed8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c08>
   14012265e:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140122664:	48 8d 3d 2c 3e 00 00 	lea    0x3e2c(%rip),%rdi        # 140126497 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41c7>
   14012266b:	48 8d 05 68 3e 00 00 	lea    0x3e68(%rip),%rax        # 1401264da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x420a>
   140122672:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140122678:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012267d:	48 8d 3d 1c 37 00 00 	lea    0x371c(%rip),%rdi        # 140125da0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ad0>
   140122684:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012268a:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14012268f:	48 8d 05 bf 3d 00 00 	lea    0x3dbf(%rip),%rax        # 140126455 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4185>
   140122696:	c5 fe 7f 94 24 40 01 	vmovdqu %ymm2,0x140(%rsp)
   14012269d:	00 00 
   14012269f:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401226a5:	48 8d 3d d3 37 00 00 	lea    0x37d3(%rip),%rdi        # 140125e7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3baf>
   1401226ac:	48 8d 05 8b 38 00 00 	lea    0x388b(%rip),%rax        # 140125f3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c6e>
   1401226b3:	c4 e3 75 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm3
   1401226b9:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401226be:	48 8d 3d 58 3e 00 00 	lea    0x3e58(%rip),%rdi        # 14012651d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x424d>
   1401226c5:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401226cb:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   1401226d0:	48 8d 05 3e 37 00 00 	lea    0x373e(%rip),%rax        # 140125e15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b45>
   1401226d7:	c5 fe 7f 9c 24 20 01 	vmovdqu %ymm3,0x120(%rsp)
   1401226de:	00 00 
   1401226e0:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401226e6:	48 8d 3d 4d 49 00 00 	lea    0x494d(%rip),%rdi        # 14012703a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d6a>
   1401226ed:	48 8d 05 7f 39 00 00 	lea    0x397f(%rip),%rax        # 140126073 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3da3>
   1401226f4:	c4 e3 75 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm4
   1401226fa:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401226ff:	48 8d 3d 0b 32 00 00 	lea    0x320b(%rip),%rdi        # 140125911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3641>
   140122706:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012270c:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140122711:	48 8d 05 00 34 00 00 	lea    0x3400(%rip),%rax        # 140125b18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3848>
   140122718:	c5 fe 7f a4 24 80 01 	vmovdqu %ymm4,0x180(%rsp)
   14012271f:	00 00 
   140122721:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140122727:	48 8d 3d 1c 61 00 00 	lea    0x611c(%rip),%rdi        # 14012884a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x657a>
   14012272e:	48 8d 05 0e 5a 00 00 	lea    0x5a0e(%rip),%rax        # 140128143 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e73>
   140122735:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14012273b:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122740:	48 8d 3d 56 58 00 00 	lea    0x5856(%rip),%rdi        # 140127f9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ccd>
   140122747:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012274d:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140122752:	48 8d 05 17 59 00 00 	lea    0x5917(%rip),%rax        # 140128070 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5da0>
   140122759:	c5 fe 7f 94 24 60 01 	vmovdqu %ymm2,0x160(%rsp)
   140122760:	00 00 
   140122762:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140122768:	48 8d 3d 48 5f 00 00 	lea    0x5f48(%rip),%rdi        # 1401286b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63e7>
   14012276f:	48 8d 05 73 5b 00 00 	lea    0x5b73(%rip),%rax        # 1401282e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6019>
   140122776:	c4 e3 75 38 c8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   14012277c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122781:	48 8d 3d 8e 5a 00 00 	lea    0x5a8e(%rip),%rdi        # 140128216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f46>
   140122788:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012278e:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   140122793:	48 8d 05 4e 61 00 00 	lea    0x614e(%rip),%rax        # 1401288e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6618>
   14012279a:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   1401227a0:	48 8d 3d 6a 5d 00 00 	lea    0x5d6a(%rip),%rdi        # 140128511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6241>
   1401227a7:	48 8d 05 36 5e 00 00 	lea    0x5e36(%rip),%rax        # 1401285e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6314>
   1401227ae:	c4 e3 6d 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm3
   1401227b4:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401227b9:	48 8d 3d fc 5b 00 00 	lea    0x5bfc(%rip),%rdi        # 1401283bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60ec>
   1401227c0:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401227c6:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   1401227cb:	48 8d 05 72 5c 00 00 	lea    0x5c72(%rip),%rax        # 140128444 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6174>
   1401227d2:	c5 fe 7f 9c 24 00 01 	vmovdqu %ymm3,0x100(%rsp)
   1401227d9:	00 00 
   1401227db:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   1401227e1:	48 8d 3d 56 30 00 00 	lea    0x3056(%rip),%rdi        # 14012583e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x356e>
   1401227e8:	48 8d 05 70 4f 00 00 	lea    0x4f70(%rip),%rax        # 14012775f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x548f>
   1401227ef:	c4 e3 6d 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm4
   1401227f5:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401227fa:	48 8d 3d 97 2e 00 00 	lea    0x2e97(%rip),%rdi        # 140125698 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33c8>
   140122801:	c5 fe 7f a4 24 e0 00 	vmovdqu %ymm4,0xe0(%rsp)
   140122808:	00 00 
   14012280a:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122810:	c4 e1 f9 6e e7       	vmovq  %rdi,%xmm4
   140122815:	48 8d 05 4f 2f 00 00 	lea    0x2f4f(%rip),%rax        # 14012576b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x349b>
   14012281c:	c4 e3 d9 22 e0 01    	vpinsrq $0x1,%rax,%xmm4,%xmm4
   140122822:	48 8d 3d af 51 00 00 	lea    0x51af(%rip),%rdi        # 1401279d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5708>
   140122829:	48 8d 05 7b 52 00 00 	lea    0x527b(%rip),%rax        # 140127aab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57db>
   140122830:	c4 e3 5d 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   140122836:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012283b:	48 8d 3d f0 4f 00 00 	lea    0x4ff0(%rip),%rdi        # 140127832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5562>
   140122842:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122848:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   14012284d:	48 8d 05 b1 50 00 00 	lea    0x50b1(%rip),%rax        # 140127905 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5635>
   140122854:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14012285a:	48 8d 3d c3 54 00 00 	lea    0x54c3(%rip),%rdi        # 140127d24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a54>
   140122861:	48 8d 05 8f 55 00 00 	lea    0x558f(%rip),%rax        # 140127df7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b27>
   140122868:	c4 e3 65 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   14012286e:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122873:	48 8d 3d 04 53 00 00 	lea    0x5304(%rip),%rdi        # 140127b7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58ae>
   14012287a:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122880:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   140122885:	48 8d 05 c5 53 00 00 	lea    0x53c5(%rip),%rax        # 140127c51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5981>
   14012288c:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140122892:	48 8d 3d a7 4a 00 00 	lea    0x4aa7(%rip),%rdi        # 140127340 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5070>
   140122899:	48 8d 05 73 4b 00 00 	lea    0x4b73(%rip),%rax        # 140127413 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5143>
   1401228a0:	c4 e3 6d 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   1401228a6:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401228ab:	48 8d 3d e8 48 00 00 	lea    0x48e8(%rip),%rdi        # 14012719a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4eca>
   1401228b2:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401228b8:	c4 e1 f9 6e ef       	vmovq  %rdi,%xmm5
   1401228bd:	48 8d 05 a9 49 00 00 	lea    0x49a9(%rip),%rax        # 14012726d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f9d>
   1401228c4:	c4 e3 d1 22 e8 01    	vpinsrq $0x1,%rax,%xmm5,%xmm5
   1401228ca:	48 8d 3d 4e 2b 00 00 	lea    0x2b4e(%rip),%rdi        # 14012541f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x314f>
   1401228d1:	48 8d 05 1a 2c 00 00 	lea    0x2c1a(%rip),%rax        # 1401254f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3222>
   1401228d8:	c4 e3 55 38 e8 01    	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   1401228de:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401228e3:	48 8d 3d 8f 29 00 00 	lea    0x298f(%rip),%rdi        # 140125279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fa9>
   1401228ea:	c5 fe 7f ac 24 c0 00 	vmovdqu %ymm5,0xc0(%rsp)
   1401228f1:	00 00 
   1401228f3:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401228f9:	c4 e1 f9 6e ef       	vmovq  %rdi,%xmm5
   1401228fe:	48 8d 05 47 2a 00 00 	lea    0x2a47(%rip),%rax        # 14012534c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x307c>
   140122905:	c4 e3 d1 22 e8 01    	vpinsrq $0x1,%rax,%xmm5,%xmm5
   14012290b:	48 8d 3d a7 4c 00 00 	lea    0x4ca7(%rip),%rdi        # 1401275b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52e9>
   140122912:	48 8d 05 73 4d 00 00 	lea    0x4d73(%rip),%rax        # 14012768c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53bc>
   140122919:	c4 e3 55 38 e8 01    	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   14012291f:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122924:	48 8d 3d 08 21 00 00 	lea    0x2108(%rip),%rdi        # 140124a33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2763>
   14012292b:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122931:	48 8d 05 ae 4b 00 00 	lea    0x4bae(%rip),%rax        # 1401274e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5216>
   140122938:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14012293d:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122943:	48 8d 15 44 1d 00 00 	lea    0x1d44(%rip),%rdx        # 14012468e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23be>
   14012294a:	48 8d 05 cf 21 00 00 	lea    0x21cf(%rip),%rax        # 140124b20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2850>
   140122951:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140122957:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012295c:	48 8d 3d d2 16 00 00 	lea    0x16d2(%rip),%rdi        # 140124035 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d65>
   140122963:	c5 fe 7f b4 24 a0 00 	vmovdqu %ymm6,0xa0(%rsp)
   14012296a:	00 00 
   14012296c:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122972:	48 8d 05 f3 1f 00 00 	lea    0x1ff3(%rip),%rax        # 14012496c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x269c>
   140122979:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14012297e:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122984:	48 8d 15 4a 14 00 00 	lea    0x144a(%rip),%rdx        # 140123dd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b05>
   14012298b:	48 8d 05 d2 17 00 00 	lea    0x17d2(%rip),%rax        # 140124164 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e94>
   140122992:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140122998:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012299d:	48 8d 3d 1c 0d 00 00 	lea    0xd1c(%rip),%rdi        # 1401236c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0>
   1401229a4:	c5 fe 7f b4 24 80 00 	vmovdqu %ymm6,0x80(%rsp)
   1401229ab:	00 00 
   1401229ad:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401229b3:	48 8d 05 4c 15 00 00 	lea    0x154c(%rip),%rax        # 140123f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c36>
   1401229ba:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   1401229bf:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401229c5:	48 8d 15 86 0b 00 00 	lea    0xb86(%rip),%rdx        # 140123552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1282>
   1401229cc:	48 8d 05 a4 0d 00 00 	lea    0xda4(%rip),%rax        # 140123777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a7>
   1401229d3:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   1401229d9:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401229de:	48 8d 3d 75 24 00 00 	lea    0x2475(%rip),%rdi        # 140124e5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b8a>
   1401229e5:	c5 fe 7f 74 24 60    	vmovdqu %ymm6,0x60(%rsp)
   1401229eb:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401229f1:	48 8d 05 11 0c 00 00 	lea    0xc11(%rip),%rax        # 140123609 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1339>
   1401229f8:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   1401229fd:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122a03:	48 8d 15 41 11 00 00 	lea    0x1141(%rip),%rdx        # 140123b4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x187b>
   140122a0a:	48 8d 05 82 11 00 00 	lea    0x1182(%rip),%rax        # 140123b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18c3>
   140122a11:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140122a17:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122a1c:	48 8d 3d 6c 0e 00 00 	lea    0xe6c(%rip),%rdi        # 14012388f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15bf>
   140122a23:	c5 fe 7f 74 24 40    	vmovdqu %ymm6,0x40(%rsp)
   140122a29:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122a2f:	48 8d 05 51 23 00 00 	lea    0x2351(%rip),%rax        # 140124d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab7>
   140122a36:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122a3b:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122a41:	48 8d 15 6c 12 00 00 	lea    0x126c(%rip),%rdx        # 140123cb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19e4>
   140122a48:	48 8d 05 cc 0e 00 00 	lea    0xecc(%rip),%rax        # 14012391b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b>
   140122a4f:	c4 63 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   140122a55:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122a5a:	48 8d 3d f3 09 00 00 	lea    0x9f3(%rip),%rdi        # 140123454 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1184>
   140122a61:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122a67:	48 8d 05 95 0d 00 00 	lea    0xd95(%rip),%rax        # 140123803 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1533>
   140122a6e:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122a73:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122a79:	48 8d 15 c3 08 00 00 	lea    0x8c3(%rip),%rdx        # 140123343 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1073>
   140122a80:	48 8d 05 65 0a 00 00 	lea    0xa65(%rip),%rax        # 1401234ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121c>
   140122a87:	c4 63 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm14
   140122a8d:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122a92:	48 8d 3d 42 06 00 00 	lea    0x642(%rip),%rdi        # 1401230db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0b>
   140122a99:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122a9f:	48 8d 05 38 09 00 00 	lea    0x938(%rip),%rax        # 1401233de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110e>
   140122aa6:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122aab:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122ab1:	48 8d 15 68 05 00 00 	lea    0x568(%rip),%rdx        # 140123020 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd50>
   140122ab8:	48 8d 05 6a 06 00 00 	lea    0x66a(%rip),%rax        # 140123129 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe59>
   140122abf:	c4 63 7d 38 ee 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   140122ac5:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122aca:	48 8d 3d 2e 07 00 00 	lea    0x72e(%rip),%rdi        # 1401231ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2f>
   140122ad1:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122ad7:	48 8d 05 64 05 00 00 	lea    0x564(%rip),%rax        # 140123042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd72>
   140122ade:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122ae3:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122ae9:	48 8d 15 67 07 00 00 	lea    0x767(%rip),%rdx        # 140123257 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf87>
   140122af0:	48 8d 05 bb 07 00 00 	lea    0x7bb(%rip),%rax        # 1401232b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe2>
   140122af7:	c4 63 7d 38 e6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   140122afd:	c4 e1 f9 6e f2       	vmovq  %rdx,%xmm6
   140122b02:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122b07:	c4 e3 c9 22 f0 01    	vpinsrq $0x1,%rax,%xmm6,%xmm6
   140122b0d:	48 8d 05 a0 21 00 00 	lea    0x21a0(%rip),%rax        # 140124cb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29e4>
   140122b14:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122b1a:	48 8d 05 67 04 00 00 	lea    0x467(%rip),%rax        # 140122f88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb8>
   140122b21:	c4 63 7d 38 de 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   140122b27:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   140122b2c:	48 8d 05 6d a5 29 00 	lea    0x29a56d(%rip),%rax        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122b33:	c4 e2 7d 59 c0       	vpbroadcastq %xmm0,%ymm0
   140122b38:	48 8d 90 00 08 00 00 	lea    0x800(%rax),%rdx
   140122b3f:	90                   	nop
   140122b40:	c5 fd 7f 00          	vmovdqa %ymm0,(%rax)
   140122b44:	48 83 c0 40          	add    $0x40,%rax
   140122b48:	c5 fd 7f 40 e0       	vmovdqa %ymm0,-0x20(%rax)
   140122b4d:	48 39 c2             	cmp    %rax,%rdx
   140122b50:	75 ee                	jne    140122b40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x870>
   140122b52:	48 8d 05 88 07 00 00 	lea    0x788(%rip),%rax        # 1401232e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1011>
   140122b59:	48 8d 3d 47 0e 00 00 	lea    0xe47(%rip),%rdi        # 1401239a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16d7>
   140122b60:	c5 fe 6f 74 24 40    	vmovdqu 0x40(%rsp),%ymm6
   140122b66:	c5 fd 7f 2d 52 a9 29 	vmovdqa %ymm5,0x29a952(%rip)        # 1403bd4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   140122b6d:	00 
   140122b6e:	48 89 05 6b a5 29 00 	mov    %rax,0x29a56b(%rip)        # 1403bd0e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140122b75:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122b7a:	48 8d 05 b2 0e 00 00 	lea    0xeb2(%rip),%rax        # 140123a33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1763>
   140122b81:	48 8d 3d 0b 17 00 00 	lea    0x170b(%rip),%rdi        # 140124293 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc3>
   140122b88:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122b8e:	48 8d 05 2a 0f 00 00 	lea    0xf2a(%rip),%rax        # 140123abf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17ef>
   140122b95:	c5 fd 7f 35 03 a6 29 	vmovdqa %ymm6,0x29a603(%rip)        # 1403bd1a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   140122b9c:	00 
   140122b9d:	c5 fe 6f 74 24 60    	vmovdqu 0x60(%rsp),%ymm6
   140122ba3:	48 89 05 66 a6 29 00 	mov    %rax,0x29a666(%rip)        # 1403bd210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   140122baa:	48 8d 05 11 18 00 00 	lea    0x1811(%rip),%rax        # 1401243c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20f2>
   140122bb1:	c5 f9 7f 05 47 a6 29 	vmovdqa %xmm0,0x29a647(%rip)        # 1403bd200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   140122bb8:	00 
   140122bb9:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122bbe:	48 8d 3d 68 23 00 00 	lea    0x2368(%rip),%rdi        # 140124f2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c5d>
   140122bc5:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122bcb:	48 8d 05 2e 24 00 00 	lea    0x242e(%rip),%rax        # 140125000 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d30>
   140122bd2:	c5 fd 7f 35 46 a6 29 	vmovdqa %ymm6,0x29a646(%rip)        # 1403bd220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   140122bd9:	00 
   140122bda:	c5 fe 6f b4 24 80 00 	vmovdqu 0x80(%rsp),%ymm6
   140122be1:	00 00 
   140122be3:	c5 f9 7f 05 55 a6 29 	vmovdqa %xmm0,0x29a655(%rip)        # 1403bd240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   140122bea:	00 
   140122beb:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122bf0:	48 8d 3d fa 18 00 00 	lea    0x18fa(%rip),%rdi        # 1401244f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2221>
   140122bf7:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122bfd:	48 8d 05 cf 24 00 00 	lea    0x24cf(%rip),%rax        # 1401250d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e03>
   140122c04:	c5 fd 7f 35 94 a7 29 	vmovdqa %ymm6,0x29a794(%rip)        # 1403bd3a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   140122c0b:	00 
   140122c0c:	c5 fe 6f b4 24 a0 00 	vmovdqu 0xa0(%rsp),%ymm6
   140122c13:	00 00 
   140122c15:	48 89 05 94 a6 29 00 	mov    %rax,0x29a694(%rip)        # 1403bd2b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   140122c1c:	48 8d 05 04 19 00 00 	lea    0x1904(%rip),%rax        # 140124527 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2257>
   140122c23:	c5 f9 7f 05 75 a6 29 	vmovdqa %xmm0,0x29a675(%rip)        # 1403bd2a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   140122c2a:	00 
   140122c2b:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122c30:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122c36:	48 8d 05 65 19 00 00 	lea    0x1965(%rip),%rax        # 1401245a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22d2>
   140122c3d:	c5 fd 7f 35 db a7 29 	vmovdqa %ymm6,0x29a7db(%rip)        # 1403bd420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   140122c44:	00 
   140122c45:	c5 fe 6f b4 24 c0 00 	vmovdqu 0xc0(%rsp),%ymm6
   140122c4c:	00 00 
   140122c4e:	48 89 05 db a6 29 00 	mov    %rax,0x29a6db(%rip)        # 1403bd330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   140122c55:	48 8d 05 ca 1f 00 00 	lea    0x1fca(%rip),%rax        # 140124c26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2956>
   140122c5c:	48 89 05 5d a7 29 00 	mov    %rax,0x29a75d(%rip)        # 1403bd3c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x320>
   140122c63:	48 8d 05 27 02 00 00 	lea    0x227(%rip),%rax        # 140122e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc1>
   140122c6a:	48 89 05 27 ac 29 00 	mov    %rax,0x29ac27(%rip)        # 1403bd898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140122c71:	48 8d 05 4d 29 00 00 	lea    0x294d(%rip),%rax        # 1401255c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32f5>
   140122c78:	48 89 05 61 a8 29 00 	mov    %rax,0x29a861(%rip)        # 1403bd4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140122c7f:	48 8d 05 44 52 00 00 	lea    0x5244(%rip),%rax        # 140127eca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bfa>
   140122c86:	48 89 05 f3 a8 29 00 	mov    %rax,0x29a8f3(%rip)        # 1403bd580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   140122c8d:	48 8d 05 78 36 00 00 	lea    0x3678(%rip),%rax        # 14012630c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x403c>
   140122c94:	c5 fd 7f 25 84 a8 29 	vmovdqa %ymm4,0x29a884(%rip)        # 1403bd520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   140122c9b:	00 
   140122c9c:	c5 fd 7f 1d 9c a8 29 	vmovdqa %ymm3,0x29a89c(%rip)        # 1403bd540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   140122ca3:	00 
   140122ca4:	c5 7d 7f 25 f4 a3 29 	vmovdqa %ymm12,0x29a3f4(%rip)        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122cab:	00 
   140122cac:	c5 7d 7f 1d 0c a4 29 	vmovdqa %ymm11,0x29a40c(%rip)        # 1403bd0c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   140122cb3:	00 
   140122cb4:	c5 7d 7f 2d 64 a4 29 	vmovdqa %ymm13,0x29a464(%rip)        # 1403bd120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   140122cbb:	00 
   140122cbc:	c5 7d 7f 3d fc a4 29 	vmovdqa %ymm15,0x29a4fc(%rip)        # 1403bd1c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   140122cc3:	00 
   140122cc4:	c5 7d 7f 35 14 a5 29 	vmovdqa %ymm14,0x29a514(%rip)        # 1403bd1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   140122ccb:	00 
   140122ccc:	c5 f9 7f 05 4c a6 29 	vmovdqa %xmm0,0x29a64c(%rip)        # 1403bd320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   140122cd3:	00 
   140122cd4:	c5 fd 7f 35 c4 a7 29 	vmovdqa %ymm6,0x29a7c4(%rip)        # 1403bd4a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   140122cdb:	00 
   140122cdc:	c5 fd 7f 15 7c a8 29 	vmovdqa %ymm2,0x29a87c(%rip)        # 1403bd560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   140122ce3:	00 
   140122ce4:	c5 fd 7f 0d b4 a8 29 	vmovdqa %ymm1,0x29a8b4(%rip)        # 1403bd5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   140122ceb:	00 
   140122cec:	c5 fe 6f 94 24 00 01 	vmovdqu 0x100(%rsp),%ymm2
   140122cf3:	00 00 
   140122cf5:	c5 fe 6f 9c 24 e0 00 	vmovdqu 0xe0(%rsp),%ymm3
   140122cfc:	00 00 
   140122cfe:	c5 fe 6f ac 24 40 01 	vmovdqu 0x140(%rsp),%ymm5
   140122d05:	00 00 
   140122d07:	48 89 05 12 aa 29 00 	mov    %rax,0x29aa12(%rip)        # 1403bd720 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x680>
   140122d0e:	c5 fe 6f a4 24 60 01 	vmovdqu 0x160(%rsp),%ymm4
   140122d15:	00 00 
   140122d17:	c5 fd 7f 15 a1 a8 29 	vmovdqa %ymm2,0x29a8a1(%rip)        # 1403bd5c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   140122d1e:	00 
   140122d1f:	c5 fe 6f 94 24 20 01 	vmovdqu 0x120(%rsp),%ymm2
   140122d26:	00 00 
   140122d28:	c5 fd 7f 1d b0 a8 29 	vmovdqa %ymm3,0x29a8b0(%rip)        # 1403bd5e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   140122d2f:	00 
   140122d30:	c5 fe 6f 9c 24 80 01 	vmovdqu 0x180(%rsp),%ymm3
   140122d37:	00 00 
   140122d39:	c6 05 40 a3 29 00 01 	movb   $0x1,0x29a340(%rip)        # 1403bd080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140122d40:	c5 7d 7f 15 d8 a8 29 	vmovdqa %ymm10,0x29a8d8(%rip)        # 1403bd620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   140122d47:	00 
   140122d48:	c5 7d 7f 05 f0 a8 29 	vmovdqa %ymm8,0x29a8f0(%rip)        # 1403bd640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   140122d4f:	00 
   140122d50:	c5 7d 7f 0d 08 a9 29 	vmovdqa %ymm9,0x29a908(%rip)        # 1403bd660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140122d57:	00 
   140122d58:	c5 fd 7f 3d 20 a9 29 	vmovdqa %ymm7,0x29a920(%rip)        # 1403bd680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140122d5f:	00 
   140122d60:	c5 fd 7f 2d 38 a9 29 	vmovdqa %ymm5,0x29a938(%rip)        # 1403bd6a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   140122d67:	00 
   140122d68:	c5 fd 7f 15 50 a9 29 	vmovdqa %ymm2,0x29a950(%rip)        # 1403bd6c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140122d6f:	00 
   140122d70:	c5 fd 7f 1d 68 a9 29 	vmovdqa %ymm3,0x29a968(%rip)        # 1403bd6e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   140122d77:	00 
   140122d78:	c5 fd 7f 25 80 a9 29 	vmovdqa %ymm4,0x29a980(%rip)        # 1403bd700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140122d7f:	00 
   140122d80:	e9 59 f7 ff ff       	jmp    1401224de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   140122d85:	0f 1f 00             	nopl   (%rax)
   140122d88:	48 8b 86 e0 00 00 00 	mov    0xe0(%rsi),%rax
   140122d8f:	48 39 86 d8 00 00 00 	cmp    %rax,0xd8(%rsi)
   140122d96:	0f 85 dc 00 00 00    	jne    140122e78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba8>
   140122d9c:	49 8b 86 88 00 00 00 	mov    0x88(%r14),%rax
   140122da3:	49 2b 86 80 00 00 00 	sub    0x80(%r14),%rax
   140122daa:	ba 80 00 00 00       	mov    $0x80,%edx
   140122daf:	48 8d 8e d8 00 00 00 	lea    0xd8(%rsi),%rcx
   140122db6:	48 c1 f8 02          	sar    $0x2,%rax
   140122dba:	48 83 c0 10          	add    $0x10,%rax
   140122dbe:	48 3d 80 00 00 00    	cmp    $0x80,%rax
   140122dc4:	76 12                	jbe    140122dd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb08>
   140122dc6:	66 90                	xchg   %ax,%ax
   140122dc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   140122dcf:	00 
   140122dd0:	48 01 d2             	add    %rdx,%rdx
   140122dd3:	48 39 c2             	cmp    %rax,%rdx
   140122dd6:	72 f8                	jb     140122dd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb00>
   140122dd8:	8b 86 8c 00 00 00    	mov    0x8c(%rsi),%eax
   140122dde:	44 8b 8e 88 00 00 00 	mov    0x88(%rsi),%r9d
   140122de5:	41 b8 80 00 00 00    	mov    $0x80,%r8d
   140122deb:	89 44 24 28          	mov    %eax,0x28(%rsp)
   140122def:	8b 86 90 00 00 00    	mov    0x90(%rsi),%eax
   140122df5:	89 44 24 20          	mov    %eax,0x20(%rsp)
   140122df9:	e8 c2 97 07 00       	call   14019c5c0 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   140122dfe:	c5 fa 6f 8e d8 00 00 	vmovdqu 0xd8(%rsi),%xmm1
   140122e05:	00 
   140122e06:	c5 fa 6f 86 e8 00 00 	vmovdqu 0xe8(%rsi),%xmm0
   140122e0d:	00 
   140122e0e:	c4 e3 79 0e d1 0f    	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140122e14:	c4 e1 f9 7e c8       	vmovq  %xmm1,%rax
   140122e19:	c4 e3 f9 16 c1 01    	vpextrq $0x1,%xmm0,%rcx
   140122e1f:	c5 fa 7f 93 d8 52 01 	vmovdqu %xmm2,0x152d8(%rbx)
   140122e26:	00 
   140122e27:	48 8b 96 e0 00 00 00 	mov    0xe0(%rsi),%rdx
   140122e2e:	48 29 c2             	sub    %rax,%rdx
   140122e31:	48 8b 86 f8 00 00 00 	mov    0xf8(%rsi),%rax
   140122e38:	48 c1 fa 05          	sar    $0x5,%rdx
   140122e3c:	48 29 c8             	sub    %rcx,%rax
   140122e3f:	48 89 93 e8 52 01 00 	mov    %rdx,0x152e8(%rbx)
   140122e46:	48 c1 f8 05          	sar    $0x5,%rax
   140122e4a:	48 83 fa 01          	cmp    $0x1,%rdx
   140122e4e:	48 83 d2 ff          	adc    $0xffffffffffffffff,%rdx
   140122e52:	48 83 f8 01          	cmp    $0x1,%rax
   140122e56:	48 89 83 f0 52 01 00 	mov    %rax,0x152f0(%rbx)
   140122e5d:	48 83 d0 ff          	adc    $0xffffffffffffffff,%rax
   140122e61:	48 89 93 f8 52 01 00 	mov    %rdx,0x152f8(%rbx)
   140122e68:	48 89 83 00 53 01 00 	mov    %rax,0x15300(%rbx)
   140122e6f:	e9 0a f5 ff ff       	jmp    14012237e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140122e74:	0f 1f 40 00          	nopl   0x0(%rax)
   140122e78:	48 8b 86 f0 00 00 00 	mov    0xf0(%rsi),%rax
   140122e7f:	48 39 86 f8 00 00 00 	cmp    %rax,0xf8(%rsi)
   140122e86:	0f 85 72 ff ff ff    	jne    140122dfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2e>
   140122e8c:	e9 0b ff ff ff       	jmp    140122d9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacc>
   140122e91:	c6 83 40 10 00 00 00 	movb   $0x0,0x1040(%rbx)
   140122e98:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122e9f:	c5 f8 77             	vzeroupper
   140122ea2:	41 80 fc 02          	cmp    $0x2,%r12b
   140122ea6:	0f 85 74 5c 00 00    	jne    140128b20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6850>
   140122eac:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122eb3:	4c 8d 46 10          	lea    0x10(%rsi),%r8
   140122eb7:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140122ebc:	0f 83 c7 88 00 00    	jae    14012b789 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94b9>
   140122ec2:	48 8b 8c 24 d0 01 00 	mov    0x1d0(%rsp),%rcx
   140122ec9:	00 
   140122eca:	48 89 0e             	mov    %rcx,(%rsi)
   140122ecd:	48 8b 8c 24 c8 01 00 	mov    0x1c8(%rsp),%rcx
   140122ed4:	00 
   140122ed5:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
   140122ed9:	4c 89 c6             	mov    %r8,%rsi
   140122edc:	4c 29 fd             	sub    %r15,%rbp
   140122edf:	48 29 d6             	sub    %rdx,%rsi
   140122ee2:	48 29 d0             	sub    %rdx,%rax
   140122ee5:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122eec:	48 89 f5             	mov    %rsi,%rbp
   140122eef:	48 c1 fd 03          	sar    $0x3,%rbp
   140122ef3:	48 39 f0             	cmp    %rsi,%rax
   140122ef6:	0f 82 3c 5c 00 00    	jb     140128b38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6868>
   140122efc:	c5 f9 6f 05 7c 6b 23 	vmovdqa 0x236b7c(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140122f03:	00 
   140122f04:	48 89 ab 60 10 00 00 	mov    %rbp,0x1060(%rbx)
   140122f0b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122f12:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122f19:	00 
   140122f1a:	c5 f8 28 b4 24 c0 08 	vmovaps 0x8c0(%rsp),%xmm6
   140122f21:	00 00 
   140122f23:	c5 f8 28 bc 24 d0 08 	vmovaps 0x8d0(%rsp),%xmm7
   140122f2a:	00 00 
   140122f2c:	c5 78 28 84 24 e0 08 	vmovaps 0x8e0(%rsp),%xmm8
   140122f33:	00 00 
   140122f35:	c5 78 28 8c 24 f0 08 	vmovaps 0x8f0(%rsp),%xmm9
   140122f3c:	00 00 
   140122f3e:	c5 78 28 94 24 00 09 	vmovaps 0x900(%rsp),%xmm10
   140122f45:	00 00 
   140122f47:	c5 78 28 9c 24 10 09 	vmovaps 0x910(%rsp),%xmm11
   140122f4e:	00 00 
   140122f50:	c5 78 28 a4 24 20 09 	vmovaps 0x920(%rsp),%xmm12
   140122f57:	00 00 
   140122f59:	c5 78 28 ac 24 30 09 	vmovaps 0x930(%rsp),%xmm13
   140122f60:	00 00 
   140122f62:	c5 78 28 b4 24 40 09 	vmovaps 0x940(%rsp),%xmm14
   140122f69:	00 00 
   140122f6b:	c5 78 28 bc 24 50 09 	vmovaps 0x950(%rsp),%xmm15
   140122f72:	00 00 
   140122f74:	48 81 c4 68 09 00 00 	add    $0x968,%rsp
   140122f7b:	5b                   	pop    %rbx
   140122f7c:	5e                   	pop    %rsi
   140122f7d:	5f                   	pop    %rdi
   140122f7e:	5d                   	pop    %rbp
   140122f7f:	41 5c                	pop    %r12
   140122f81:	41 5d                	pop    %r13
   140122f83:	41 5e                	pop    %r14
   140122f85:	41 5f                	pop    %r15
   140122f87:	c3                   	ret
   140122f88:	41 80 fc 02          	cmp    $0x2,%r12b
   140122f8c:	0f 84 6e 68 00 00    	je     140129800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7530>
   140122f92:	41 80 fc 01          	cmp    $0x1,%r12b
   140122f96:	0f 85 72 37 01 00    	jne    14013670e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1443e>
   140122f9c:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122fa3:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140122fa7:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140122fac:	0f 83 a2 d0 00 00    	jae    140130054 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd84>
   140122fb2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122fb9:	c5 f8 77             	vzeroupper
   140122fbc:	48 8b 8c 24 c8 01 00 	mov    0x1c8(%rsp),%rcx
   140122fc3:	00 
   140122fc4:	48 89 0e             	mov    %rcx,(%rsi)
   140122fc7:	49 29 d0             	sub    %rdx,%r8
   140122fca:	4c 29 fd             	sub    %r15,%rbp
   140122fcd:	48 29 d0             	sub    %rdx,%rax
   140122fd0:	4c 89 c6             	mov    %r8,%rsi
   140122fd3:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122fda:	48 c1 fe 03          	sar    $0x3,%rsi
   140122fde:	4c 39 c0             	cmp    %r8,%rax
   140122fe1:	73 10                	jae    140122ff3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd23>
   140122fe3:	48 8d 14 36          	lea    (%rsi,%rsi,1),%rdx
   140122fe7:	48 8d 8b 48 10 00 00 	lea    0x1048(%rbx),%rcx
   140122fee:	e8 6d 37 1c 00       	call   1402e6760 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140122ff3:	c5 f9 6f 05 85 6a 23 	vmovdqa 0x236a85(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140122ffa:	00 
   140122ffb:	48 89 b3 60 10 00 00 	mov    %rsi,0x1060(%rbx)
   140123002:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123009:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140123010:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123017:	00 
   140123018:	e8 f1 8f 21 00       	call   14033c00e <setun::cold_throw_unknown_opcode(unsigned long long)>
   14012301d:	0f 1f 00             	nopl   (%rax)
   140123020:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123027:	0f 84 53 5b 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   14012302d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123031:	48 8d 3d 68 a0 29 00 	lea    0x29a068(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123038:	48 83 c5 01          	add    $0x1,%rbp
   14012303c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123040:	ff e0                	jmp    *%rax
   140123042:	48 8d 45 08          	lea    0x8(%rbp),%rax
   140123046:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
   14012304a:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012304f:	45 84 e4             	test   %r12b,%r12b
   140123052:	0f 84 bc 75 00 00    	je     14012a614 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8344>
   140123058:	41 80 fc 01          	cmp    $0x1,%r12b
   14012305c:	0f 84 9d 9f 00 00    	je     14012cfff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad2f>
   140123062:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123066:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   14012306b:	0f 83 85 d2 00 00    	jae    1401302f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe026>
   140123071:	c5 f8 77             	vzeroupper
   140123074:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   14012307b:	00 
   14012307c:	48 8d 8c 24 80 06 00 	lea    0x680(%rsp),%rcx
   140123083:	00 
   140123084:	48 89 fa             	mov    %rdi,%rdx
   140123087:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
   14012308c:	48 89 06             	mov    %rax,(%rsi)
   14012308f:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123096:	00 
   140123097:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   14012309e:	00 
   14012309f:	e8 5c a1 0e 00       	call   14020d200 <setun::VMValue::VMValue(long long)>
   1401230a4:	48 8b 84 24 80 06 00 	mov    0x680(%rsp),%rax
   1401230ab:	00 
   1401230ac:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   1401230b1:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401230b8:	00 
   1401230b9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401230c0:	0f 84 26 82 00 00    	je     14012b2ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x901c>
   1401230c6:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   1401230ca:	48 8d 3d cf 9f 29 00 	lea    0x299fcf(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401230d1:	48 83 c5 09          	add    $0x9,%rbp
   1401230d5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401230d9:	ff e0                	jmp    *%rax
   1401230db:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401230df:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   1401230e3:	45 84 e4             	test   %r12b,%r12b
   1401230e6:	0f 85 f4 5b 00 00    	jne    140128ce0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a10>
   1401230ec:	48 ba 00 00 00 00 00 	movabs $0xfff9000000000000,%rdx
   1401230f3:	00 f9 ff 
   1401230f6:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401230fc:	48 09 d0             	or     %rdx,%rax
   1401230ff:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123106:	00 
   140123107:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012310e:	0f 84 b8 86 00 00    	je     14012b7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fc>
   140123114:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140123118:	48 8d 3d 81 9f 29 00 	lea    0x299f81(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012311f:	48 83 c5 03          	add    $0x3,%rbp
   140123123:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123127:	ff e0                	jmp    *%rax
   140123129:	48 8d 45 14          	lea    0x14(%rbp),%rax
   14012312d:	c5 fa 6f 45 00       	vmovdqu 0x0(%rbp),%xmm0
   140123132:	8b 7d 10             	mov    0x10(%rbp),%edi
   140123135:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012313a:	45 84 e4             	test   %r12b,%r12b
   14012313d:	0f 84 ff 74 00 00    	je     14012a642 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8372>
   140123143:	41 80 fc 01          	cmp    $0x1,%r12b
   140123147:	0f 84 3b 9e 00 00    	je     14012cf88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacb8>
   14012314d:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123151:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123156:	0f 83 26 d1 00 00    	jae    140130282 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfb2>
   14012315c:	c5 f8 77             	vzeroupper
   14012315f:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123166:	00 
   140123167:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
   14012316e:	00 
   14012316f:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
   140123174:	48 8d 8c 24 40 05 00 	lea    0x540(%rsp),%rcx
   14012317b:	00 
   14012317c:	48 89 06             	mov    %rax,(%rsi)
   14012317f:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123186:	00 
   140123187:	89 bc 24 90 06 00 00 	mov    %edi,0x690(%rsp)
   14012318e:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140123195:	00 
   140123196:	c7 84 24 94 06 00 00 	movl   $0x0,0x694(%rsp)
   14012319d:	00 00 00 00 
   1401231a1:	48 8b 84 24 90 06 00 	mov    0x690(%rsp),%rax
   1401231a8:	00 
   1401231a9:	c5 f9 7f 84 24 80 06 	vmovdqa %xmm0,0x680(%rsp)
   1401231b0:	00 00 
   1401231b2:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   1401231b9:	00 
   1401231ba:	c5 f9 7f 84 24 a0 01 	vmovdqa %xmm0,0x1a0(%rsp)
   1401231c1:	00 00 
   1401231c3:	e8 f8 84 0e 00       	call   14020b6c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401231c8:	48 8b 84 24 40 05 00 	mov    0x540(%rsp),%rax
   1401231cf:	00 
   1401231d0:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   1401231d5:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401231dc:	00 
   1401231dd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401231e4:	0f 84 02 81 00 00    	je     14012b2ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x901c>
   1401231ea:	0f b6 45 14          	movzbl 0x14(%rbp),%eax
   1401231ee:	48 8d 3d ab 9e 29 00 	lea    0x299eab(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401231f5:	48 83 c5 15          	add    $0x15,%rbp
   1401231f9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401231fd:	ff e0                	jmp    *%rax
   1401231ff:	48 8b 45 00          	mov    0x0(%rbp),%rax
   140123203:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140123207:	45 84 e4             	test   %r12b,%r12b
   14012320a:	0f 85 7d 5a 00 00    	jne    140128c8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bd>
   140123210:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   140123215:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012321b:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140123222:	00 fc ff 
   140123225:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140123229:	48 0f 4a c2          	cmovp  %rdx,%rax
   14012322d:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123234:	00 
   140123235:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012323c:	0f 84 8a 85 00 00    	je     14012b7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fc>
   140123242:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140123246:	48 8d 3d 53 9e 29 00 	lea    0x299e53(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012324d:	48 83 c5 09          	add    $0x9,%rbp
   140123251:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123255:	ff e0                	jmp    *%rax
   140123257:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012325b:	48 8d 7d 01          	lea    0x1(%rbp),%rdi
   14012325f:	45 84 e4             	test   %r12b,%r12b
   140123262:	0f 85 f9 5a 00 00    	jne    140128d61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a91>
   140123268:	84 c0                	test   %al,%al
   14012326a:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123270:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123277:	00 fa ff 
   14012327a:	48 b8 01 00 00 00 00 	movabs $0xfffa000000000001,%rax
   140123281:	00 fa ff 
   140123284:	48 0f 45 d0          	cmovne %rax,%rdx
   140123288:	48 89 94 24 c8 01 00 	mov    %rdx,0x1c8(%rsp)
   14012328f:	00 
   140123290:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123297:	0f 84 2f 85 00 00    	je     14012b7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fc>
   14012329d:	0f b6 45 01          	movzbl 0x1(%rbp),%eax
   1401232a1:	48 8d 3d f8 9d 29 00 	lea    0x299df8(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401232a8:	48 83 c5 02          	add    $0x2,%rbp
   1401232ac:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401232b0:	ff e0                	jmp    *%rax
   1401232b2:	41 80 fc 01          	cmp    $0x1,%r12b
   1401232b6:	0f 85 49 a8 00 00    	jne    14012db05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb835>
   1401232bc:	45 31 e4             	xor    %r12d,%r12d
   1401232bf:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401232c6:	0f 84 b4 58 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   1401232cc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401232d0:	48 8d 3d c9 9d 29 00 	lea    0x299dc9(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401232d7:	48 83 c5 01          	add    $0x1,%rbp
   1401232db:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401232df:	ff e0                	jmp    *%rax
   1401232e1:	45 84 e4             	test   %r12b,%r12b
   1401232e4:	0f 84 60 5a 00 00    	je     140128d4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a7a>
   1401232ea:	41 80 fc 01          	cmp    $0x1,%r12b
   1401232ee:	0f 84 05 9b 00 00    	je     14012cdf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab29>
   1401232f4:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401232f8:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401232fd:	0f 83 f6 e0 00 00    	jae    1401313f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf129>
   140123303:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   14012330a:	00 
   14012330b:	48 89 06             	mov    %rax,(%rsi)
   14012330e:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123315:	00 
   140123316:	4c 89 c6             	mov    %r8,%rsi
   140123319:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140123320:	00 
   140123321:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123328:	0f 84 52 58 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   14012332e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123332:	48 8d 3d 67 9d 29 00 	lea    0x299d67(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123339:	48 83 c5 01          	add    $0x1,%rbp
   14012333d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123341:	ff e0                	jmp    *%rax
   140123343:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140123347:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   14012334e:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   140123352:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140123359:	4c 01 e8             	add    %r13,%rax
   14012335c:	48 c1 fa 03          	sar    $0x3,%rdx
   140123360:	48 39 d0             	cmp    %rdx,%rax
   140123363:	0f 83 af a7 00 00    	jae    14012db18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb848>
   140123369:	45 84 e4             	test   %r12b,%r12b
   14012336c:	0f 84 45 5a 00 00    	je     140128db7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ae7>
   140123372:	41 80 fc 01          	cmp    $0x1,%r12b
   140123376:	0f 84 67 9b 00 00    	je     14012cee3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac13>
   14012337c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123380:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123385:	0f 83 40 dc 00 00    	jae    140130fcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecfb>
   14012338b:	48 8b 94 24 d0 01 00 	mov    0x1d0(%rsp),%rdx
   140123392:	00 
   140123393:	48 89 16             	mov    %rdx,(%rsi)
   140123396:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   14012339d:	00 
   14012339e:	4c 89 c6             	mov    %r8,%rsi
   1401233a1:	48 89 94 24 d0 01 00 	mov    %rdx,0x1d0(%rsp)
   1401233a8:	00 
   1401233a9:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401233b0:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   1401233b4:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401233bb:	00 
   1401233bc:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401233c3:	0f 84 03 84 00 00    	je     14012b7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fc>
   1401233c9:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401233cd:	48 8d 3d cc 9c 29 00 	lea    0x299ccc(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401233d4:	48 83 c5 03          	add    $0x3,%rbp
   1401233d8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401233dc:	ff e0                	jmp    *%rax
   1401233de:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401233e2:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   1401233e6:	4c 01 ef             	add    %r13,%rdi
   1401233e9:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   1401233f0:	0f 83 7f ac 00 00    	jae    14012e075 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbda5>
   1401233f6:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   1401233fd:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140123404:	48 c1 f8 03          	sar    $0x3,%rax
   140123408:	48 39 c7             	cmp    %rax,%rdi
   14012340b:	0f 83 d4 b0 00 00    	jae    14012e4e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc215>
   140123411:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140123415:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   14012341c:	00 
   14012341d:	45 84 e4             	test   %r12b,%r12b
   140123420:	48 0f 44 c2          	cmove  %rdx,%rax
   140123424:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   14012342b:	48 8b 00             	mov    (%rax),%rax
   14012342e:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140123432:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123439:	0f 84 3d 57 00 00    	je     140128b7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68ac>
   14012343f:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140123443:	48 8d 3d 56 9c 29 00 	lea    0x299c56(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012344a:	48 83 c5 03          	add    $0x3,%rbp
   14012344e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123452:	ff e0                	jmp    *%rax
   140123454:	48 8b 93 88 10 00 00 	mov    0x1088(%rbx),%rdx
   14012345b:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   14012345f:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   140123463:	48 2b 93 80 10 00 00 	sub    0x1080(%rbx),%rdx
   14012346a:	48 c1 fa 03          	sar    $0x3,%rdx
   14012346e:	48 39 d0             	cmp    %rdx,%rax
   140123471:	0f 83 b7 aa 00 00    	jae    14012df2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc5e>
   140123477:	45 84 e4             	test   %r12b,%r12b
   14012347a:	0f 84 94 57 00 00    	je     140128c14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6944>
   140123480:	41 80 fc 01          	cmp    $0x1,%r12b
   140123484:	0f 84 41 99 00 00    	je     14012cdcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaafb>
   14012348a:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012348e:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123493:	0f 83 f6 e6 00 00    	jae    140131b8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8bf>
   140123499:	48 8b 94 24 d0 01 00 	mov    0x1d0(%rsp),%rdx
   1401234a0:	00 
   1401234a1:	48 89 16             	mov    %rdx,(%rsi)
   1401234a4:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   1401234ab:	00 
   1401234ac:	4c 89 c6             	mov    %r8,%rsi
   1401234af:	48 89 94 24 d0 01 00 	mov    %rdx,0x1d0(%rsp)
   1401234b6:	00 
   1401234b7:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   1401234be:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   1401234c2:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401234c9:	00 
   1401234ca:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401234d1:	0f 84 f5 82 00 00    	je     14012b7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fc>
   1401234d7:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401234db:	48 8d 3d be 9b 29 00 	lea    0x299bbe(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401234e2:	48 83 c5 03          	add    $0x3,%rbp
   1401234e6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401234ea:	ff e0                	jmp    *%rax
   1401234ec:	48 8b 83 88 10 00 00 	mov    0x1088(%rbx),%rax
   1401234f3:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401234f7:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   1401234fb:	48 2b 83 80 10 00 00 	sub    0x1080(%rbx),%rax
   140123502:	48 c1 f8 03          	sar    $0x3,%rax
   140123506:	48 39 c7             	cmp    %rax,%rdi
   140123509:	0f 83 cd a9 00 00    	jae    14012dedc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc0c>
   14012350f:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140123513:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   14012351a:	00 
   14012351b:	45 84 e4             	test   %r12b,%r12b
   14012351e:	48 0f 44 c2          	cmove  %rdx,%rax
   140123522:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   140123529:	48 8b 00             	mov    (%rax),%rax
   14012352c:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140123530:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123537:	0f 84 3f 56 00 00    	je     140128b7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68ac>
   14012353d:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140123541:	48 8d 3d 58 9b 29 00 	lea    0x299b58(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123548:	48 83 c5 03          	add    $0x3,%rbp
   14012354c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123550:	ff e0                	jmp    *%rax
   140123552:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123559:	00 fb ff 
   14012355c:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   140123563:	00 
   140123564:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   14012356b:	00 
   14012356c:	41 80 fc 02          	cmp    $0x2,%r12b
   140123570:	0f 85 ff a5 00 00    	jne    14012db75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8a5>
   140123576:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   14012357d:	00 
   14012357e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123584:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   14012358b:	00 
   14012358c:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123593:	00 
   140123594:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   14012359b:	00 
   14012359c:	48 8b 94 24 d8 01 00 	mov    0x1d8(%rsp),%rdx
   1401235a3:	00 
   1401235a4:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401235ab:	00 ff ff 
   1401235ae:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401235b5:	00 f8 ff 
   1401235b8:	49 89 d0             	mov    %rdx,%r8
   1401235bb:	49 21 c0             	and    %rax,%r8
   1401235be:	49 39 c8             	cmp    %rcx,%r8
   1401235c1:	0f 84 b1 65 00 00    	je     140129b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78a8>
   1401235c7:	48 8d 94 24 e0 01 00 	lea    0x1e0(%rsp),%rdx
   1401235ce:	00 
   1401235cf:	48 8d 8c 24 d8 01 00 	lea    0x1d8(%rsp),%rcx
   1401235d6:	00 
   1401235d7:	c5 f8 77             	vzeroupper
   1401235da:	e8 e1 2c 0f 00       	call   1402162c0 <setun::VMValue::add(setun::VMValue const&) const>
   1401235df:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401235e6:	00 
   1401235e7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401235ee:	0f 84 e4 54 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401235f4:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401235f8:	48 8d 3d a1 9a 29 00 	lea    0x299aa1(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401235ff:	48 83 c5 01          	add    $0x1,%rbp
   140123603:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123607:	ff e0                	jmp    *%rax
   140123609:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123610:	00 fb ff 
   140123613:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   14012361a:	00 
   14012361b:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140123622:	00 
   140123623:	41 80 fc 02          	cmp    $0x2,%r12b
   140123627:	0f 85 1d b2 00 00    	jne    14012e84a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc57a>
   14012362d:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123634:	00 
   140123635:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012363b:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140123642:	00 
   140123643:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   14012364a:	00 
   14012364b:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   140123652:	00 
   140123653:	48 8b 84 24 e8 01 00 	mov    0x1e8(%rsp),%rax
   14012365a:	00 
   14012365b:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123662:	00 ff ff 
   140123665:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012366c:	00 f8 ff 
   14012366f:	48 89 c1             	mov    %rax,%rcx
   140123672:	48 21 d1             	and    %rdx,%rcx
   140123675:	4c 39 c1             	cmp    %r8,%rcx
   140123678:	0f 84 be 61 00 00    	je     14012983c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x756c>
   14012367e:	48 8d 94 24 f0 01 00 	lea    0x1f0(%rsp),%rdx
   140123685:	00 
   140123686:	48 8d 8c 24 e8 01 00 	lea    0x1e8(%rsp),%rcx
   14012368d:	00 
   14012368e:	c5 f8 77             	vzeroupper
   140123691:	e8 1a 44 0f 00       	call   140217ab0 <setun::VMValue::sub(setun::VMValue const&) const>
   140123696:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   14012369d:	00 
   14012369e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401236a5:	0f 84 2d 54 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401236ab:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401236af:	48 8d 3d ea 99 29 00 	lea    0x2999ea(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401236b6:	48 83 c5 01          	add    $0x1,%rbp
   1401236ba:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401236be:	ff e0                	jmp    *%rax
   1401236c0:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401236c7:	00 fb ff 
   1401236ca:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   1401236d1:	00 
   1401236d2:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   1401236d9:	00 
   1401236da:	41 80 fc 02          	cmp    $0x2,%r12b
   1401236de:	0f 85 43 b0 00 00    	jne    14012e727 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc457>
   1401236e4:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401236eb:	00 
   1401236ec:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401236f2:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   1401236f9:	00 
   1401236fa:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123701:	00 
   140123702:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   140123709:	00 
   14012370a:	48 8b 84 24 f8 01 00 	mov    0x1f8(%rsp),%rax
   140123711:	00 
   140123712:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123719:	00 ff ff 
   14012371c:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123723:	00 f8 ff 
   140123726:	48 89 c1             	mov    %rax,%rcx
   140123729:	48 21 d1             	and    %rdx,%rcx
   14012372c:	4c 39 c1             	cmp    %r8,%rcx
   14012372f:	0f 84 98 5f 00 00    	je     1401296cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73fd>
   140123735:	48 8d 94 24 00 02 00 	lea    0x200(%rsp),%rdx
   14012373c:	00 
   14012373d:	48 8d 8c 24 f8 01 00 	lea    0x1f8(%rsp),%rcx
   140123744:	00 
   140123745:	c5 f8 77             	vzeroupper
   140123748:	e8 e3 3a 0f 00       	call   140217230 <setun::VMValue::mul(setun::VMValue const&) const>
   14012374d:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123754:	00 
   140123755:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012375c:	0f 84 76 53 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123762:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123766:	48 8d 3d 33 99 29 00 	lea    0x299933(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012376d:	48 83 c5 01          	add    $0x1,%rbp
   140123771:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123775:	ff e0                	jmp    *%rax
   140123777:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012377e:	00 fb ff 
   140123781:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140123788:	00 
   140123789:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140123790:	00 
   140123791:	41 80 fc 02          	cmp    $0x2,%r12b
   140123795:	0f 85 5c af 00 00    	jne    14012e6f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc427>
   14012379b:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401237a2:	00 
   1401237a3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401237a9:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   1401237b0:	00 
   1401237b1:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401237b8:	00 
   1401237b9:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   1401237c0:	00 
   1401237c1:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
   1401237c8:	00 
   1401237c9:	48 8d 8c 24 08 02 00 	lea    0x208(%rsp),%rcx
   1401237d0:	00 
   1401237d1:	c5 f8 77             	vzeroupper
   1401237d4:	e8 b7 35 0f 00       	call   140216d90 <setun::VMValue::div(setun::VMValue const&) const>
   1401237d9:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401237e0:	00 
   1401237e1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401237e8:	0f 84 ea 52 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401237ee:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401237f2:	48 8d 3d a7 98 29 00 	lea    0x2998a7(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401237f9:	48 83 c5 01          	add    $0x1,%rbp
   1401237fd:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123801:	ff e0                	jmp    *%rax
   140123803:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012380a:	00 fb ff 
   14012380d:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   140123814:	00 
   140123815:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   14012381c:	00 
   14012381d:	41 80 fc 02          	cmp    $0x2,%r12b
   140123821:	0f 85 32 b2 00 00    	jne    14012ea59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc789>
   140123827:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   14012382e:	00 
   14012382f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123835:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   14012383c:	00 
   14012383d:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123844:	00 
   140123845:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   14012384c:	00 
   14012384d:	48 8d 94 24 20 02 00 	lea    0x220(%rsp),%rdx
   140123854:	00 
   140123855:	48 8d 8c 24 18 02 00 	lea    0x218(%rsp),%rcx
   14012385c:	00 
   14012385d:	c5 f8 77             	vzeroupper
   140123860:	e8 2b 38 0f 00       	call   140217090 <setun::VMValue::mod(setun::VMValue const&) const>
   140123865:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   14012386c:	00 
   14012386d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123874:	0f 84 5e 52 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   14012387a:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012387e:	48 8d 3d 1b 98 29 00 	lea    0x29981b(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123885:	48 83 c5 01          	add    $0x1,%rbp
   140123889:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012388d:	ff e0                	jmp    *%rax
   14012388f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123896:	00 fb ff 
   140123899:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   1401238a0:	00 
   1401238a1:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   1401238a8:	00 
   1401238a9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401238ad:	0f 85 67 af 00 00    	jne    14012e81a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc54a>
   1401238b3:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401238ba:	00 
   1401238bb:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401238c1:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   1401238c8:	00 
   1401238c9:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401238d0:	00 
   1401238d1:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   1401238d8:	00 
   1401238d9:	48 8d 94 24 30 02 00 	lea    0x230(%rsp),%rdx
   1401238e0:	00 
   1401238e1:	48 8d 8c 24 28 02 00 	lea    0x228(%rsp),%rcx
   1401238e8:	00 
   1401238e9:	c5 f8 77             	vzeroupper
   1401238ec:	e8 6f 4e 0f 00       	call   140218760 <setun::VMValue::bit_and(setun::VMValue const&) const>
   1401238f1:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401238f8:	00 
   1401238f9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123900:	0f 84 d2 51 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123906:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012390a:	48 8d 3d 8f 97 29 00 	lea    0x29978f(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123911:	48 83 c5 01          	add    $0x1,%rbp
   140123915:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123919:	ff e0                	jmp    *%rax
   14012391b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123922:	00 fb ff 
   140123925:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   14012392c:	00 
   14012392d:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140123934:	00 
   140123935:	41 80 fc 02          	cmp    $0x2,%r12b
   140123939:	0f 85 41 a6 00 00    	jne    14012df80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcb0>
   14012393f:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123946:	00 
   140123947:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012394d:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140123954:	00 
   140123955:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   14012395c:	00 
   14012395d:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140123964:	00 
   140123965:	48 8d 94 24 40 02 00 	lea    0x240(%rsp),%rdx
   14012396c:	00 
   14012396d:	48 8d 8c 24 38 02 00 	lea    0x238(%rsp),%rcx
   140123974:	00 
   140123975:	c5 f8 77             	vzeroupper
   140123978:	e8 b3 45 0f 00       	call   140217f30 <setun::VMValue::bit_or(setun::VMValue const&) const>
   14012397d:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123984:	00 
   140123985:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012398c:	0f 84 46 51 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123992:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123996:	48 8d 3d 03 97 29 00 	lea    0x299703(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012399d:	48 83 c5 01          	add    $0x1,%rbp
   1401239a1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401239a5:	ff e0                	jmp    *%rax
   1401239a7:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401239ae:	00 fb ff 
   1401239b1:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   1401239b8:	00 
   1401239b9:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   1401239c0:	00 
   1401239c1:	41 80 fc 02          	cmp    $0x2,%r12b
   1401239c5:	0f 85 85 a5 00 00    	jne    14012df50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc80>
   1401239cb:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401239d2:	00 
   1401239d3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401239d9:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   1401239e0:	00 
   1401239e1:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401239e8:	00 
   1401239e9:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   1401239f0:	00 
   1401239f1:	48 8d 94 24 50 02 00 	lea    0x250(%rsp),%rdx
   1401239f8:	00 
   1401239f9:	48 8d 8c 24 48 02 00 	lea    0x248(%rsp),%rcx
   140123a00:	00 
   140123a01:	c5 f8 77             	vzeroupper
   140123a04:	e8 57 52 0f 00       	call   140218c60 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   140123a09:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123a10:	00 
   140123a11:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123a18:	0f 84 ba 50 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123a1e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123a22:	48 8d 3d 77 96 29 00 	lea    0x299677(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123a29:	48 83 c5 01          	add    $0x1,%rbp
   140123a2d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123a31:	ff e0                	jmp    *%rax
   140123a33:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123a3a:	00 fb ff 
   140123a3d:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140123a44:	00 
   140123a45:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140123a4c:	00 
   140123a4d:	41 80 fc 02          	cmp    $0x2,%r12b
   140123a51:	0f 85 1a af 00 00    	jne    14012e971 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6a1>
   140123a57:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123a5e:	00 
   140123a5f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123a65:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140123a6c:	00 
   140123a6d:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123a74:	00 
   140123a75:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140123a7c:	00 
   140123a7d:	48 8d 94 24 60 02 00 	lea    0x260(%rsp),%rdx
   140123a84:	00 
   140123a85:	48 8d 8c 24 58 02 00 	lea    0x258(%rsp),%rcx
   140123a8c:	00 
   140123a8d:	c5 f8 77             	vzeroupper
   140123a90:	e8 cb 3b 0f 00       	call   140217660 <setun::VMValue::shl(setun::VMValue const&) const>
   140123a95:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123a9c:	00 
   140123a9d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123aa4:	0f 84 2e 50 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123aaa:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123aae:	48 8d 3d eb 95 29 00 	lea    0x2995eb(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123ab5:	48 83 c5 01          	add    $0x1,%rbp
   140123ab9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123abd:	ff e0                	jmp    *%rax
   140123abf:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123ac6:	00 fb ff 
   140123ac9:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   140123ad0:	00 
   140123ad1:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   140123ad8:	00 
   140123ad9:	41 80 fc 02          	cmp    $0x2,%r12b
   140123add:	0f 85 74 ac 00 00    	jne    14012e757 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc487>
   140123ae3:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123aea:	00 
   140123aeb:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123af1:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   140123af8:	00 
   140123af9:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123b00:	00 
   140123b01:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   140123b08:	00 
   140123b09:	48 8d 94 24 70 02 00 	lea    0x270(%rsp),%rdx
   140123b10:	00 
   140123b11:	48 8d 8c 24 68 02 00 	lea    0x268(%rsp),%rcx
   140123b18:	00 
   140123b19:	c5 f8 77             	vzeroupper
   140123b1c:	e8 5f 3d 0f 00       	call   140217880 <setun::VMValue::shr(setun::VMValue const&) const>
   140123b21:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123b28:	00 
   140123b29:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123b30:	0f 84 a2 4f 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123b36:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123b3a:	48 8d 3d 5f 95 29 00 	lea    0x29955f(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123b41:	48 83 c5 01          	add    $0x1,%rbp
   140123b45:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123b49:	ff e0                	jmp    *%rax
   140123b4b:	45 84 e4             	test   %r12b,%r12b
   140123b4e:	0f 85 1c 51 00 00    	jne    140128c70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140123b54:	48 83 ee 08          	sub    $0x8,%rsi
   140123b58:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123b5e:	48 89 f1             	mov    %rsi,%rcx
   140123b61:	c5 f8 77             	vzeroupper
   140123b64:	e8 b7 39 0f 00       	call   140217520 <setun::VMValue::neg() const>
   140123b69:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123b70:	00 
   140123b71:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123b78:	0f 84 ea 7e 00 00    	je     14012ba68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9798>
   140123b7e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123b82:	48 8d 3d 17 95 29 00 	lea    0x299517(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123b89:	48 83 c5 01          	add    $0x1,%rbp
   140123b8d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123b91:	ff e0                	jmp    *%rax
   140123b93:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123b9a:	00 fb ff 
   140123b9d:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   140123ba4:	00 
   140123ba5:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   140123bac:	00 
   140123bad:	41 80 fc 02          	cmp    $0x2,%r12b
   140123bb1:	0f 85 86 a5 00 00    	jne    14012e13d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe6d>
   140123bb7:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123bbe:	00 
   140123bbf:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123bc5:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   140123bcc:	00 
   140123bcd:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123bd4:	00 
   140123bd5:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   140123bdc:	00 
   140123bdd:	48 8b 8c 24 78 02 00 	mov    0x278(%rsp),%rcx
   140123be4:	00 
   140123be5:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140123bec:	ff ff ff 
   140123bef:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140123bf6:	00 fd ff 
   140123bf9:	48 21 c1             	and    %rax,%rcx
   140123bfc:	48 39 d1             	cmp    %rdx,%rcx
   140123bff:	0f 84 02 76 00 00    	je     14012b207 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f37>
   140123c05:	48 23 84 24 80 02 00 	and    0x280(%rsp),%rax
   140123c0c:	00 
   140123c0d:	48 39 d0             	cmp    %rdx,%rax
   140123c10:	0f 84 f1 75 00 00    	je     14012b207 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f37>
   140123c16:	48 8d 8c 24 78 02 00 	lea    0x278(%rsp),%rcx
   140123c1d:	00 
   140123c1e:	c5 f8 77             	vzeroupper
   140123c21:	e8 6a 41 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123c26:	48 8d 8c 24 80 02 00 	lea    0x280(%rsp),%rcx
   140123c2d:	00 
   140123c2e:	48 89 c7             	mov    %rax,%rdi
   140123c31:	e8 5a 41 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123c36:	48 8b 8c 24 78 02 00 	mov    0x278(%rsp),%rcx
   140123c3d:	00 
   140123c3e:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123c45:	00 ff ff 
   140123c48:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   140123c4f:	00 fa ff 
   140123c52:	48 21 d1             	and    %rdx,%rcx
   140123c55:	4c 39 c1             	cmp    %r8,%rcx
   140123c58:	75 11                	jne    140123c6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x199b>
   140123c5a:	48 23 94 24 80 02 00 	and    0x280(%rsp),%rdx
   140123c61:	00 
   140123c62:	48 39 ca             	cmp    %rcx,%rdx
   140123c65:	0f 84 fe 93 00 00    	je     14012d069 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad99>
   140123c6b:	48 39 c7             	cmp    %rax,%rdi
   140123c6e:	48 8d 8c 24 80 06 00 	lea    0x680(%rsp),%rcx
   140123c75:	00 
   140123c76:	48 0f 4e c7          	cmovle %rdi,%rax
   140123c7a:	48 89 c2             	mov    %rax,%rdx
   140123c7d:	e8 7e 95 0e 00       	call   14020d200 <setun::VMValue::VMValue(long long)>
   140123c82:	48 8b 84 24 80 06 00 	mov    0x680(%rsp),%rax
   140123c89:	00 
   140123c8a:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123c91:	00 
   140123c92:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123c99:	0f 84 39 4e 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123c9f:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123ca3:	48 8d 3d f6 93 29 00 	lea    0x2993f6(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123caa:	48 83 c5 01          	add    $0x1,%rbp
   140123cae:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123cb2:	ff e0                	jmp    *%rax
   140123cb4:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123cbb:	00 fb ff 
   140123cbe:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   140123cc5:	00 
   140123cc6:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   140123ccd:	00 
   140123cce:	41 80 fc 02          	cmp    $0x2,%r12b
   140123cd2:	0f 85 f5 a5 00 00    	jne    14012e2cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbffd>
   140123cd8:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123cdf:	00 
   140123ce0:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123ce6:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   140123ced:	00 
   140123cee:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123cf5:	00 
   140123cf6:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   140123cfd:	00 
   140123cfe:	48 8b 8c 24 88 02 00 	mov    0x288(%rsp),%rcx
   140123d05:	00 
   140123d06:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140123d0d:	ff ff ff 
   140123d10:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140123d17:	00 fd ff 
   140123d1a:	48 21 c1             	and    %rax,%rcx
   140123d1d:	48 39 d1             	cmp    %rdx,%rcx
   140123d20:	0f 84 7d 74 00 00    	je     14012b1a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ed3>
   140123d26:	48 23 84 24 90 02 00 	and    0x290(%rsp),%rax
   140123d2d:	00 
   140123d2e:	48 39 d0             	cmp    %rdx,%rax
   140123d31:	0f 84 6c 74 00 00    	je     14012b1a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ed3>
   140123d37:	48 8d 8c 24 88 02 00 	lea    0x288(%rsp),%rcx
   140123d3e:	00 
   140123d3f:	c5 f8 77             	vzeroupper
   140123d42:	e8 49 40 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123d47:	48 8d 8c 24 90 02 00 	lea    0x290(%rsp),%rcx
   140123d4e:	00 
   140123d4f:	48 89 c7             	mov    %rax,%rdi
   140123d52:	e8 39 40 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123d57:	48 8b 8c 24 88 02 00 	mov    0x288(%rsp),%rcx
   140123d5e:	00 
   140123d5f:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123d66:	00 ff ff 
   140123d69:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   140123d70:	00 fa ff 
   140123d73:	48 21 d1             	and    %rdx,%rcx
   140123d76:	4c 39 c1             	cmp    %r8,%rcx
   140123d79:	75 11                	jne    140123d8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1abc>
   140123d7b:	48 23 94 24 90 02 00 	and    0x290(%rsp),%rdx
   140123d82:	00 
   140123d83:	48 39 ca             	cmp    %rcx,%rdx
   140123d86:	0f 84 b1 92 00 00    	je     14012d03d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad6d>
   140123d8c:	48 39 c7             	cmp    %rax,%rdi
   140123d8f:	48 8d 8c 24 80 06 00 	lea    0x680(%rsp),%rcx
   140123d96:	00 
   140123d97:	48 0f 4d c7          	cmovge %rdi,%rax
   140123d9b:	48 89 c2             	mov    %rax,%rdx
   140123d9e:	e8 5d 94 0e 00       	call   14020d200 <setun::VMValue::VMValue(long long)>
   140123da3:	48 8b 84 24 80 06 00 	mov    0x680(%rsp),%rax
   140123daa:	00 
   140123dab:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123db2:	00 
   140123db3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123dba:	0f 84 18 4d 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123dc0:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123dc4:	48 8d 3d d5 92 29 00 	lea    0x2992d5(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123dcb:	48 83 c5 01          	add    $0x1,%rbp
   140123dcf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123dd3:	ff e0                	jmp    *%rax
   140123dd5:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123ddc:	00 fb ff 
   140123ddf:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   140123de6:	00 
   140123de7:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   140123dee:	00 
   140123def:	41 80 fc 02          	cmp    $0x2,%r12b
   140123df3:	0f 85 d7 ad 00 00    	jne    14012ebd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc900>
   140123df9:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123e00:	00 
   140123e01:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123e07:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   140123e0e:	00 
   140123e0f:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123e16:	00 
   140123e17:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   140123e1e:	00 
   140123e1f:	48 89 c1             	mov    %rax,%rcx
   140123e22:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140123e29:	00 ff ff 
   140123e2c:	49 89 c8             	mov    %rcx,%r8
   140123e2f:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   140123e36:	00 f8 ff 
   140123e39:	48 8b 94 24 a0 02 00 	mov    0x2a0(%rsp),%rdx
   140123e40:	00 
   140123e41:	49 21 c0             	and    %rax,%r8
   140123e44:	4d 39 c8             	cmp    %r9,%r8
   140123e47:	0f 84 f6 61 00 00    	je     14012a043 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d73>
   140123e4d:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140123e54:	00 fd ff 
   140123e57:	4d 39 d0             	cmp    %r10,%r8
   140123e5a:	0f 84 10 8c 00 00    	je     14012ca70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7a0>
   140123e60:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   140123e67:	00 fc ff 
   140123e6a:	4c 39 c1             	cmp    %r8,%rcx
   140123e6d:	0f 84 a8 7b 00 00    	je     14012ba1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x974b>
   140123e73:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140123e7a:	ff f7 ff 
   140123e7d:	49 39 c9             	cmp    %rcx,%r9
   140123e80:	0f 83 95 7b 00 00    	jae    14012ba1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x974b>
   140123e86:	49 39 d1             	cmp    %rdx,%r9
   140123e89:	0f 83 8c 7b 00 00    	jae    14012ba1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x974b>
   140123e8f:	4c 39 c2             	cmp    %r8,%rdx
   140123e92:	0f 84 83 7b 00 00    	je     14012ba1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x974b>
   140123e98:	48 21 d0             	and    %rdx,%rax
   140123e9b:	4c 39 d0             	cmp    %r10,%rax
   140123e9e:	0f 84 24 b0 00 00    	je     14012eec8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbf8>
   140123ea4:	48 8d 8c 24 98 02 00 	lea    0x298(%rsp),%rcx
   140123eab:	00 
   140123eac:	c5 f8 77             	vzeroupper
   140123eaf:	e8 dc 3e 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123eb4:	48 8d 8c 24 a0 02 00 	lea    0x2a0(%rsp),%rcx
   140123ebb:	00 
   140123ebc:	48 89 c7             	mov    %rax,%rdi
   140123ebf:	e8 cc 3e 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123ec4:	48 39 c7             	cmp    %rax,%rdi
   140123ec7:	40 0f 94 c7          	sete   %dil
   140123ecb:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123ed2:	00 fa ff 
   140123ed5:	40 0f b6 c7          	movzbl %dil,%eax
   140123ed9:	48 01 d0             	add    %rdx,%rax
   140123edc:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140123ee3:	00 
   140123ee4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123eeb:	0f 84 e7 4b 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140123ef1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123ef5:	48 8d 3d a4 91 29 00 	lea    0x2991a4(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123efc:	48 83 c5 01          	add    $0x1,%rbp
   140123f00:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123f04:	ff e0                	jmp    *%rax
   140123f06:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123f0d:	00 fb ff 
   140123f10:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   140123f17:	00 
   140123f18:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   140123f1f:	00 
   140123f20:	41 80 fc 02          	cmp    $0x2,%r12b
   140123f24:	0f 85 8d a8 00 00    	jne    14012e7b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4e7>
   140123f2a:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140123f31:	00 
   140123f32:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123f38:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   140123f3f:	00 
   140123f40:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140123f47:	00 
   140123f48:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   140123f4f:	00 
   140123f50:	48 89 c2             	mov    %rax,%rdx
   140123f53:	48 b9 00 00 00 00 00 	movabs $0xffff000000000000,%rcx
   140123f5a:	00 ff ff 
   140123f5d:	48 89 d0             	mov    %rdx,%rax
   140123f60:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123f67:	00 f8 ff 
   140123f6a:	48 21 c8             	and    %rcx,%rax
   140123f6d:	4c 39 c0             	cmp    %r8,%rax
   140123f70:	0f 84 9f 4e 00 00    	je     140128e15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b45>
   140123f76:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140123f7d:	00 fd ff 
   140123f80:	4c 39 c0             	cmp    %r8,%rax
   140123f83:	0f 84 7f 4e 00 00    	je     140128e08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b38>
   140123f89:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123f90:	00 fc ff 
   140123f93:	4c 39 ca             	cmp    %r9,%rdx
   140123f96:	0f 84 b0 77 00 00    	je     14012b74c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x947c>
   140123f9c:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140123fa3:	ff f7 ff 
   140123fa6:	49 39 d2             	cmp    %rdx,%r10
   140123fa9:	0f 83 9d 77 00 00    	jae    14012b74c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x947c>
   140123faf:	48 8b 84 24 b0 02 00 	mov    0x2b0(%rsp),%rax
   140123fb6:	00 
   140123fb7:	4c 39 c8             	cmp    %r9,%rax
   140123fba:	0f 84 8c 77 00 00    	je     14012b74c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x947c>
   140123fc0:	49 39 c2             	cmp    %rax,%r10
   140123fc3:	0f 83 83 77 00 00    	jae    14012b74c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x947c>
   140123fc9:	48 21 c1             	and    %rax,%rcx
   140123fcc:	4c 39 c1             	cmp    %r8,%rcx
   140123fcf:	0f 84 4d b1 00 00    	je     14012f122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce52>
   140123fd5:	48 8d 8c 24 a8 02 00 	lea    0x2a8(%rsp),%rcx
   140123fdc:	00 
   140123fdd:	c5 f8 77             	vzeroupper
   140123fe0:	e8 ab 3d 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123fe5:	48 8d 8c 24 b0 02 00 	lea    0x2b0(%rsp),%rcx
   140123fec:	00 
   140123fed:	48 89 c7             	mov    %rax,%rdi
   140123ff0:	e8 9b 3d 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140123ff5:	48 39 c7             	cmp    %rax,%rdi
   140123ff8:	0f 95 c0             	setne  %al
   140123ffb:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140124002:	00 fa ff 
   140124005:	0f b6 c0             	movzbl %al,%eax
   140124008:	48 01 d0             	add    %rdx,%rax
   14012400b:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140124012:	00 
   140124013:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012401a:	0f 84 b8 4a 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140124020:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124024:	48 8d 3d 75 90 29 00 	lea    0x299075(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012402b:	48 83 c5 01          	add    $0x1,%rbp
   14012402f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124033:	ff e0                	jmp    *%rax
   140124035:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012403c:	00 fb ff 
   14012403f:	48 89 84 24 b8 02 00 	mov    %rax,0x2b8(%rsp)
   140124046:	00 
   140124047:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   14012404e:	00 
   14012404f:	41 80 fc 02          	cmp    $0x2,%r12b
   140124053:	0f 85 b4 9b 00 00    	jne    14012dc0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb93d>
   140124059:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140124060:	00 
   140124061:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124067:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   14012406e:	00 
   14012406f:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140124076:	00 
   140124077:	48 89 84 24 b8 02 00 	mov    %rax,0x2b8(%rsp)
   14012407e:	00 
   14012407f:	48 89 c1             	mov    %rax,%rcx
   140124082:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124089:	00 ff ff 
   14012408c:	49 89 c8             	mov    %rcx,%r8
   14012408f:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   140124096:	00 f8 ff 
   140124099:	48 8b 84 24 c0 02 00 	mov    0x2c0(%rsp),%rax
   1401240a0:	00 
   1401240a1:	49 21 d0             	and    %rdx,%r8
   1401240a4:	4d 39 c8             	cmp    %r9,%r8
   1401240a7:	0f 84 7b 4f 00 00    	je     140129028 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d58>
   1401240ad:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   1401240b4:	00 fd ff 
   1401240b7:	4d 39 d0             	cmp    %r10,%r8
   1401240ba:	0f 84 30 8a 00 00    	je     14012caf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa820>
   1401240c0:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   1401240c7:	00 fc ff 
   1401240ca:	4c 39 c1             	cmp    %r8,%rcx
   1401240cd:	0f 84 ee 78 00 00    	je     14012b9c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96f1>
   1401240d3:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   1401240da:	ff f7 ff 
   1401240dd:	49 39 c9             	cmp    %rcx,%r9
   1401240e0:	0f 83 db 78 00 00    	jae    14012b9c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96f1>
   1401240e6:	4c 39 c0             	cmp    %r8,%rax
   1401240e9:	0f 84 d2 78 00 00    	je     14012b9c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96f1>
   1401240ef:	49 39 c1             	cmp    %rax,%r9
   1401240f2:	0f 83 c9 78 00 00    	jae    14012b9c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96f1>
   1401240f8:	48 21 c2             	and    %rax,%rdx
   1401240fb:	4c 39 d2             	cmp    %r10,%rdx
   1401240fe:	0f 84 4b b2 00 00    	je     14012f34f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd07f>
   140124104:	48 8d 8c 24 b8 02 00 	lea    0x2b8(%rsp),%rcx
   14012410b:	00 
   14012410c:	c5 f8 77             	vzeroupper
   14012410f:	e8 7c 3c 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124114:	48 8d 8c 24 c0 02 00 	lea    0x2c0(%rsp),%rcx
   14012411b:	00 
   14012411c:	48 89 c7             	mov    %rax,%rdi
   14012411f:	e8 6c 3c 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124124:	48 39 c7             	cmp    %rax,%rdi
   140124127:	0f 9c c0             	setl   %al
   14012412a:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140124131:	00 fa ff 
   140124134:	0f b6 c0             	movzbl %al,%eax
   140124137:	48 01 d0             	add    %rdx,%rax
   14012413a:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140124141:	00 
   140124142:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124149:	0f 84 89 49 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   14012414f:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124153:	48 8d 3d 46 8f 29 00 	lea    0x298f46(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012415a:	48 83 c5 01          	add    $0x1,%rbp
   14012415e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124162:	ff e0                	jmp    *%rax
   140124164:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012416b:	00 fb ff 
   14012416e:	48 89 84 24 c8 02 00 	mov    %rax,0x2c8(%rsp)
   140124175:	00 
   140124176:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   14012417d:	00 
   14012417e:	41 80 fc 02          	cmp    $0x2,%r12b
   140124182:	0f 85 49 a8 00 00    	jne    14012e9d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc701>
   140124188:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   14012418f:	00 
   140124190:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124196:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   14012419d:	00 
   14012419e:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401241a5:	00 
   1401241a6:	48 89 84 24 c8 02 00 	mov    %rax,0x2c8(%rsp)
   1401241ad:	00 
   1401241ae:	48 89 c1             	mov    %rax,%rcx
   1401241b1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401241b8:	00 ff ff 
   1401241bb:	49 89 c8             	mov    %rcx,%r8
   1401241be:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   1401241c5:	00 f8 ff 
   1401241c8:	48 8b 84 24 d0 02 00 	mov    0x2d0(%rsp),%rax
   1401241cf:	00 
   1401241d0:	49 21 d0             	and    %rdx,%r8
   1401241d3:	4d 39 c8             	cmp    %r9,%r8
   1401241d6:	0f 84 df 61 00 00    	je     14012a3bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80eb>
   1401241dc:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   1401241e3:	00 fd ff 
   1401241e6:	4d 39 d0             	cmp    %r10,%r8
   1401241e9:	0f 84 79 8a 00 00    	je     14012cc68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa998>
   1401241ef:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   1401241f6:	00 fc ff 
   1401241f9:	4c 39 c1             	cmp    %r8,%rcx
   1401241fc:	0f 84 65 77 00 00    	je     14012b967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9697>
   140124202:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140124209:	ff f7 ff 
   14012420c:	49 39 c9             	cmp    %rcx,%r9
   14012420f:	0f 83 52 77 00 00    	jae    14012b967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9697>
   140124215:	4c 39 c0             	cmp    %r8,%rax
   140124218:	0f 84 49 77 00 00    	je     14012b967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9697>
   14012421e:	49 39 c1             	cmp    %rax,%r9
   140124221:	0f 83 40 77 00 00    	jae    14012b967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9697>
   140124227:	48 21 c2             	and    %rax,%rdx
   14012422a:	4c 39 d2             	cmp    %r10,%rdx
   14012422d:	0f 84 ee ad 00 00    	je     14012f021 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd51>
   140124233:	48 8d 8c 24 c8 02 00 	lea    0x2c8(%rsp),%rcx
   14012423a:	00 
   14012423b:	c5 f8 77             	vzeroupper
   14012423e:	e8 4d 3b 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124243:	48 8d 8c 24 d0 02 00 	lea    0x2d0(%rsp),%rcx
   14012424a:	00 
   14012424b:	48 89 c7             	mov    %rax,%rdi
   14012424e:	e8 3d 3b 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124253:	48 39 c7             	cmp    %rax,%rdi
   140124256:	0f 9e c0             	setle  %al
   140124259:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140124260:	00 fa ff 
   140124263:	0f b6 c0             	movzbl %al,%eax
   140124266:	48 01 d0             	add    %rdx,%rax
   140124269:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140124270:	00 
   140124271:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124278:	0f 84 5a 48 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   14012427e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124282:	48 8d 3d 17 8e 29 00 	lea    0x298e17(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124289:	48 83 c5 01          	add    $0x1,%rbp
   14012428d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124291:	ff e0                	jmp    *%rax
   140124293:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012429a:	00 fb ff 
   14012429d:	48 89 84 24 d8 02 00 	mov    %rax,0x2d8(%rsp)
   1401242a4:	00 
   1401242a5:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   1401242ac:	00 
   1401242ad:	41 80 fc 02          	cmp    $0x2,%r12b
   1401242b1:	0f 85 53 9e 00 00    	jne    14012e10a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe3a>
   1401242b7:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401242be:	00 
   1401242bf:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401242c5:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   1401242cc:	00 
   1401242cd:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401242d4:	00 
   1401242d5:	48 89 84 24 d8 02 00 	mov    %rax,0x2d8(%rsp)
   1401242dc:	00 
   1401242dd:	48 89 c1             	mov    %rax,%rcx
   1401242e0:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401242e7:	00 ff ff 
   1401242ea:	49 89 c8             	mov    %rcx,%r8
   1401242ed:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   1401242f4:	00 f8 ff 
   1401242f7:	48 8b 84 24 e0 02 00 	mov    0x2e0(%rsp),%rax
   1401242fe:	00 
   1401242ff:	49 21 d0             	and    %rdx,%r8
   140124302:	4d 39 c8             	cmp    %r9,%r8
   140124305:	0f 84 fa 4d 00 00    	je     140129105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e35>
   14012430b:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140124312:	00 fd ff 
   140124315:	4d 39 d0             	cmp    %r10,%r8
   140124318:	0f 84 ca 86 00 00    	je     14012c9e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa718>
   14012431e:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   140124325:	00 fc ff 
   140124328:	4c 39 c1             	cmp    %r8,%rcx
   14012432b:	0f 84 bd 76 00 00    	je     14012b9ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x971e>
   140124331:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140124338:	ff f7 ff 
   14012433b:	49 39 c9             	cmp    %rcx,%r9
   14012433e:	0f 83 aa 76 00 00    	jae    14012b9ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x971e>
   140124344:	49 39 c1             	cmp    %rax,%r9
   140124347:	0f 83 a1 76 00 00    	jae    14012b9ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x971e>
   14012434d:	4c 39 c0             	cmp    %r8,%rax
   140124350:	0f 84 98 76 00 00    	je     14012b9ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x971e>
   140124356:	48 21 c2             	and    %rax,%rdx
   140124359:	4c 39 d2             	cmp    %r10,%rdx
   14012435c:	0f 84 22 b6 00 00    	je     14012f984 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6b4>
   140124362:	48 8d 8c 24 d8 02 00 	lea    0x2d8(%rsp),%rcx
   140124369:	00 
   14012436a:	c5 f8 77             	vzeroupper
   14012436d:	e8 1e 3a 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124372:	48 8d 8c 24 e0 02 00 	lea    0x2e0(%rsp),%rcx
   140124379:	00 
   14012437a:	48 89 c7             	mov    %rax,%rdi
   14012437d:	e8 0e 3a 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140124382:	48 39 c7             	cmp    %rax,%rdi
   140124385:	0f 9f c0             	setg   %al
   140124388:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012438f:	00 fa ff 
   140124392:	0f b6 c0             	movzbl %al,%eax
   140124395:	48 01 d0             	add    %rdx,%rax
   140124398:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   14012439f:	00 
   1401243a0:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401243a7:	0f 84 2b 47 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401243ad:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401243b1:	48 8d 3d e8 8c 29 00 	lea    0x298ce8(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401243b8:	48 83 c5 01          	add    $0x1,%rbp
   1401243bc:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401243c0:	ff e0                	jmp    *%rax
   1401243c2:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401243c9:	00 fb ff 
   1401243cc:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   1401243d3:	00 
   1401243d4:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   1401243db:	00 
   1401243dc:	41 80 fc 02          	cmp    $0x2,%r12b
   1401243e0:	0f 85 4a 9e 00 00    	jne    14012e230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf60>
   1401243e6:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401243ed:	00 
   1401243ee:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401243f4:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   1401243fb:	00 
   1401243fc:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140124403:	00 
   140124404:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   14012440b:	00 
   14012440c:	48 89 c1             	mov    %rax,%rcx
   14012440f:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124416:	00 ff ff 
   140124419:	49 89 c8             	mov    %rcx,%r8
   14012441c:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   140124423:	00 f8 ff 
   140124426:	48 8b 84 24 f0 02 00 	mov    0x2f0(%rsp),%rax
   14012442d:	00 
   14012442e:	49 21 d0             	and    %rdx,%r8
   140124431:	4d 39 c8             	cmp    %r9,%r8
   140124434:	0f 84 e5 5d 00 00    	je     14012a21f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f4f>
   14012443a:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140124441:	00 fd ff 
   140124444:	4d 39 d0             	cmp    %r10,%r8
   140124447:	0f 84 96 87 00 00    	je     14012cbe3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa913>
   14012444d:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   140124454:	00 fc ff 
   140124457:	4c 39 c1             	cmp    %r8,%rcx
   14012445a:	0f 84 da 74 00 00    	je     14012b93a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966a>
   140124460:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140124467:	ff f7 ff 
   14012446a:	49 39 c9             	cmp    %rcx,%r9
   14012446d:	0f 83 c7 74 00 00    	jae    14012b93a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966a>
   140124473:	49 39 c1             	cmp    %rax,%r9
   140124476:	0f 83 be 74 00 00    	jae    14012b93a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966a>
   14012447c:	4c 39 c0             	cmp    %r8,%rax
   14012447f:	0f 84 b5 74 00 00    	je     14012b93a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966a>
   140124485:	48 21 c2             	and    %rax,%rdx
   140124488:	4c 39 d2             	cmp    %r10,%rdx
   14012448b:	0f 84 cd b3 00 00    	je     14012f85e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd58e>
   140124491:	48 8d 8c 24 e8 02 00 	lea    0x2e8(%rsp),%rcx
   140124498:	00 
   140124499:	c5 f8 77             	vzeroupper
   14012449c:	e8 ef 38 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   1401244a1:	48 8d 8c 24 f0 02 00 	lea    0x2f0(%rsp),%rcx
   1401244a8:	00 
   1401244a9:	48 89 c7             	mov    %rax,%rdi
   1401244ac:	e8 df 38 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   1401244b1:	48 39 c7             	cmp    %rax,%rdi
   1401244b4:	0f 9d c0             	setge  %al
   1401244b7:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401244be:	00 fa ff 
   1401244c1:	0f b6 c0             	movzbl %al,%eax
   1401244c4:	48 01 d0             	add    %rdx,%rax
   1401244c7:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401244ce:	00 
   1401244cf:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401244d6:	0f 84 fc 45 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401244dc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401244e0:	48 8d 3d b9 8b 29 00 	lea    0x298bb9(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401244e7:	48 83 c5 01          	add    $0x1,%rbp
   1401244eb:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401244ef:	ff e0                	jmp    *%rax
   1401244f1:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401244f5:	66 85 ff             	test   %di,%di
   1401244f8:	0f 88 21 a7 00 00    	js     14012ec1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc94f>
   1401244fe:	0f bf c7             	movswl %di,%eax
   140124501:	83 c0 02             	add    $0x2,%eax
   140124504:	48 98                	cltq
   140124506:	48 01 e8             	add    %rbp,%rax
   140124509:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124510:	0f 84 10 a0 00 00    	je     14012e526 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc256>
   140124516:	48 8d 68 01          	lea    0x1(%rax),%rbp
   14012451a:	0f b6 00             	movzbl (%rax),%eax
   14012451d:	48 8d 3d 7c 8b 29 00 	lea    0x298b7c(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124524:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140124527:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   14012452b:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   14012452f:	66 89 44 24 40       	mov    %ax,0x40(%rsp)
   140124534:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012453b:	00 fb ff 
   14012453e:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   140124545:	00 
   140124546:	41 80 fc 01          	cmp    $0x1,%r12b
   14012454a:	0f 85 b7 9f 00 00    	jne    14012e507 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc237>
   140124550:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140124557:	00 
   140124558:	45 31 e4             	xor    %r12d,%r12d
   14012455b:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   140124562:	00 
   140124563:	48 8d 8c 24 f8 02 00 	lea    0x2f8(%rsp),%rcx
   14012456a:	00 
   14012456b:	c5 f8 77             	vzeroupper
   14012456e:	e8 ad 3e 0f 00       	call   140218420 <setun::VMValue::as_bool() const>
   140124573:	89 c1                	mov    %eax,%ecx
   140124575:	48 0f bf 44 24 40    	movswq 0x40(%rsp),%rax
   14012457b:	48 01 f8             	add    %rdi,%rax
   14012457e:	84 c9                	test   %cl,%cl
   140124580:	48 0f 44 f8          	cmove  %rax,%rdi
   140124584:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012458b:	0f 84 df 85 00 00    	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8a0>
   140124591:	0f b6 07             	movzbl (%rdi),%eax
   140124594:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
   140124598:	48 8d 3d 01 8b 29 00 	lea    0x298b01(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012459f:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   1401245a2:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   1401245a6:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401245aa:	48 83 c5 06          	add    $0x6,%rbp
   1401245ae:	66 89 44 24 40       	mov    %ax,0x40(%rsp)
   1401245b3:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   1401245b7:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   1401245bc:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401245c3:	00 fb ff 
   1401245c6:	48 89 84 24 00 03 00 	mov    %rax,0x300(%rsp)
   1401245cd:	00 
   1401245ce:	41 80 fc 01          	cmp    $0x1,%r12b
   1401245d2:	0f 85 b1 a4 00 00    	jne    14012ea89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7b9>
   1401245d8:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401245df:	00 
   1401245e0:	45 31 e4             	xor    %r12d,%r12d
   1401245e3:	48 89 84 24 00 03 00 	mov    %rax,0x300(%rsp)
   1401245ea:	00 
   1401245eb:	48 8b 94 24 00 03 00 	mov    0x300(%rsp),%rdx
   1401245f2:	00 
   1401245f3:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401245fa:	00 ff ff 
   1401245fd:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140124604:	00 fd ff 
   140124607:	48 21 d0             	and    %rdx,%rax
   14012460a:	48 39 c8             	cmp    %rcx,%rax
   14012460d:	0f 84 39 58 00 00    	je     140129e4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b7c>
   140124613:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   14012461a:	00 fc ff 
   14012461d:	48 39 c2             	cmp    %rax,%rdx
   140124620:	74 13                	je     140124635 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2365>
   140124622:	48 b8 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rax
   140124629:	ff f7 ff 
   14012462c:	48 39 d0             	cmp    %rdx,%rax
   14012462f:	0f 82 25 58 00 00    	jb     140129e5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b8a>
   140124635:	48 8d 8c 24 00 03 00 	lea    0x300(%rsp),%rcx
   14012463c:	00 
   14012463d:	c5 f8 77             	vzeroupper
   140124640:	e8 9b 4e 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140124645:	c5 fb 10 0d 73 54 23 	vmovsd 0x235473(%rip),%xmm1        # 140359ac0 <CSWTCH.2960+0x200>
   14012464c:	00 
   14012464d:	c5 f9 2f c8          	vcomisd %xmm0,%xmm1
   140124651:	0f 87 3e 6b 00 00    	ja     14012b195 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ec5>
   140124657:	c5 f9 2f 05 69 54 23 	vcomisd 0x235469(%rip),%xmm0        # 140359ac8 <CSWTCH.2960+0x208>
   14012465e:	00 
   14012465f:	0f 87 14 58 00 00    	ja     140129e79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ba9>
   140124665:	48 0f bf 44 24 40    	movswq 0x40(%rsp),%rax
   14012466b:	48 8d 44 05 fe       	lea    -0x2(%rbp,%rax,1),%rax
   140124670:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124677:	0f 84 04 9b 00 00    	je     14012e181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbeb1>
   14012467d:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140124681:	0f b6 00             	movzbl (%rax),%eax
   140124684:	48 8d 3d 15 8a 29 00 	lea    0x298a15(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012468b:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012468e:	49 8b 96 88 00 00 00 	mov    0x88(%r14),%rdx
   140124695:	49 8b 8e 80 00 00 00 	mov    0x80(%r14),%rcx
   14012469c:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   1401246a0:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401246a4:	48 39 d1             	cmp    %rdx,%rcx
   1401246a7:	0f 84 49 69 00 00    	je     14012aff6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d26>
   1401246ad:	48 29 ca             	sub    %rcx,%rdx
   1401246b0:	48 c1 fa 02          	sar    $0x2,%rdx
   1401246b4:	48 39 d0             	cmp    %rdx,%rax
   1401246b7:	0f 83 c3 b9 00 00    	jae    140130080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xddb0>
   1401246bd:	8b 3c 81             	mov    (%rcx,%rax,4),%edi
   1401246c0:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%rsp)
   1401246c7:	0f b6 4d 02          	movzbl 0x2(%rbp),%ecx
   1401246cb:	48 8d 7d 03          	lea    0x3(%rbp),%rdi
   1401246cf:	49 8b 96 a0 00 00 00 	mov    0xa0(%r14),%rdx
   1401246d6:	41 b8 20 00 00 00    	mov    $0x20,%r8d
   1401246dc:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
   1401246e1:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   1401246e6:	48 89 cf             	mov    %rcx,%rdi
   1401246e9:	49 8b 8e 98 00 00 00 	mov    0x98(%r14),%rcx
   1401246f0:	48 29 ca             	sub    %rcx,%rdx
   1401246f3:	48 d1 fa             	sar    $1,%rdx
   1401246f6:	48 39 d0             	cmp    %rdx,%rax
   1401246f9:	73 0b                	jae    140124706 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2436>
   1401246fb:	0f b7 0c 41          	movzwl (%rcx,%rax,2),%ecx
   1401246ff:	66 85 c9             	test   %cx,%cx
   140124702:	4c 0f 45 c1          	cmovne %rcx,%r8
   140124706:	40 0f b6 cf          	movzbl %dil,%ecx
   14012470a:	48 8d 51 08          	lea    0x8(%rcx),%rdx
   14012470e:	4c 89 c1             	mov    %r8,%rcx
   140124711:	4c 39 c2             	cmp    %r8,%rdx
   140124714:	48 0f 43 ca          	cmovae %rdx,%rcx
   140124718:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   14012471d:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140124724:	0f 84 39 6e 00 00    	je     14012b563 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9293>
   14012472a:	48 8b 93 d8 52 01 00 	mov    0x152d8(%rbx),%rdx
   140124731:	48 85 d2             	test   %rdx,%rdx
   140124734:	0f 84 29 6e 00 00    	je     14012b563 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9293>
   14012473a:	48 23 83 f8 52 01 00 	and    0x152f8(%rbx),%rax
   140124741:	48 c1 e0 05          	shl    $0x5,%rax
   140124745:	48 01 d0             	add    %rdx,%rax
   140124748:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   14012474f:	00 
   140124750:	48 83 38 00          	cmpq   $0x0,(%rax)
   140124754:	0f 84 1e 6d 00 00    	je     14012b478 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a8>
   14012475a:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140124761:	0f 84 27 8f 00 00    	je     14012d68e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3be>
   140124767:	48 8b 83 68 52 01 00 	mov    0x15268(%rbx),%rax
   14012476e:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140124775:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   14012477c:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   140124783:	00 
   140124784:	48 01 c8             	add    %rcx,%rax
   140124787:	48 c1 fa 03          	sar    $0x3,%rdx
   14012478b:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140124792:	48 83 c0 40          	add    $0x40,%rax
   140124796:	48 39 d0             	cmp    %rdx,%rax
   140124799:	0f 83 d4 d5 00 00    	jae    140131d73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfaa3>
   14012479f:	c5 f8 77             	vzeroupper
   1401247a2:	40 84 ff             	test   %dil,%dil
   1401247a5:	0f 84 93 b1 00 00    	je     14012f93e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd66e>
   1401247ab:	4c 8b 9c 24 a0 00 00 	mov    0xa0(%rsp),%r11
   1401247b2:	00 
   1401247b3:	40 0f b6 d7          	movzbl %dil,%edx
   1401247b7:	44 0f b6 c7          	movzbl %dil,%r8d
   1401247bb:	41 83 e8 01          	sub    $0x1,%r8d
   1401247bf:	4a 8d 4c 1a ff       	lea    -0x1(%rdx,%r11,1),%rcx
   1401247c4:	48 83 ea 02          	sub    $0x2,%rdx
   1401247c8:	4c 29 c2             	sub    %r8,%rdx
   1401247cb:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   1401247d2:	00 
   1401247d3:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   1401247da:	4c 01 da             	add    %r11,%rdx
   1401247dd:	48 c1 e2 03          	shl    $0x3,%rdx
   1401247e1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401247e5:	74 2f                	je     140124816 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2546>
   1401247e7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401247eb:	75 3e                	jne    14012482b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x255b>
   1401247ed:	4c 8b 8c 24 c8 01 00 	mov    0x1c8(%rsp),%r9
   1401247f4:	00 
   1401247f5:	48 83 e8 08          	sub    $0x8,%rax
   1401247f9:	4d 89 0c c8          	mov    %r9,(%r8,%rcx,8)
   1401247fd:	48 8b 8c 24 d0 01 00 	mov    0x1d0(%rsp),%rcx
   140124804:	00 
   140124805:	48 89 8c 24 c8 01 00 	mov    %rcx,0x1c8(%rsp)
   14012480c:	00 
   14012480d:	48 39 c2             	cmp    %rax,%rdx
   140124810:	0f 84 3c ba 00 00    	je     140130252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf82>
   140124816:	48 8b 8c 24 c8 01 00 	mov    0x1c8(%rsp),%rcx
   14012481d:	00 
   14012481e:	49 89 0c 00          	mov    %rcx,(%r8,%rax,1)
   140124822:	48 83 e8 08          	sub    $0x8,%rax
   140124826:	48 39 c2             	cmp    %rax,%rdx
   140124829:	74 18                	je     140124843 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2573>
   14012482b:	48 89 f1             	mov    %rsi,%rcx
   14012482e:	48 83 ee 08          	sub    $0x8,%rsi
   140124832:	48 8b 49 f8          	mov    -0x8(%rcx),%rcx
   140124836:	49 89 0c 00          	mov    %rcx,(%r8,%rax,1)
   14012483a:	48 83 e8 08          	sub    $0x8,%rax
   14012483e:	48 39 c2             	cmp    %rax,%rdx
   140124841:	75 e8                	jne    14012482b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x255b>
   140124843:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012484a:	4c 8d a4 24 a0 07 00 	lea    0x7a0(%rsp),%r12
   140124851:	00 
   140124852:	31 c0                	xor    %eax,%eax
   140124854:	b9 23 00 00 00       	mov    $0x23,%ecx
   140124859:	4c 89 e7             	mov    %r12,%rdi
   14012485c:	f3 48 ab             	rep stos %rax,(%rdi)
   14012485f:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
   140124866:	00 
   140124867:	48 89 94 24 c0 07 00 	mov    %rdx,0x7c0(%rsp)
   14012486e:	00 
   14012486f:	c6 84 24 a8 08 00 00 	movb   $0x1,0x8a8(%rsp)
   140124876:	01 
   140124877:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   14012487b:	48 89 9c 24 a0 07 00 	mov    %rbx,0x7a0(%rsp)
   140124882:	00 
   140124883:	48 89 84 24 b0 07 00 	mov    %rax,0x7b0(%rsp)
   14012488a:	00 
   14012488b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124890:	48 89 84 24 b8 07 00 	mov    %rax,0x7b8(%rsp)
   140124897:	00 
   140124898:	48 89 f0             	mov    %rsi,%rax
   14012489b:	48 29 d0             	sub    %rdx,%rax
   14012489e:	48 8b 93 c0 50 01 00 	mov    0x150c0(%rbx),%rdx
   1401248a5:	48 c1 f8 03          	sar    $0x3,%rax
   1401248a9:	48 89 84 24 c8 07 00 	mov    %rax,0x7c8(%rsp)
   1401248b0:	00 
   1401248b1:	31 c0                	xor    %eax,%eax
   1401248b3:	48 85 d2             	test   %rdx,%rdx
   1401248b6:	74 0c                	je     1401248c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25f4>
   1401248b8:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
   1401248bc:	48 8d 84 c3 98 10 00 	lea    0x1098(%rbx,%rax,8),%rax
   1401248c3:	00 
   1401248c4:	c4 e1 f9 6e f8       	vmovq  %rax,%xmm7
   1401248c9:	c4 e3 c1 22 83 b8 52 	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401248d0:	01 00 01 
   1401248d3:	4c 89 a3 b8 52 01 00 	mov    %r12,0x152b8(%rbx)
   1401248da:	c5 f9 7f 84 24 d0 07 	vmovdqa %xmm0,0x7d0(%rsp)
   1401248e1:	00 00 
   1401248e3:	e8 38 b9 0e 00       	call   140210220 <tersun::VMTelemetryManager::instance()>
   1401248e8:	80 38 00             	cmpb   $0x0,(%rax)
   1401248eb:	74 05                	je     1401248f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2622>
   1401248ed:	48 83 40 28 01       	addq   $0x1,0x28(%rax)
   1401248f2:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   1401248f9:	00 
   1401248fa:	4c 89 e2             	mov    %r12,%rdx
   1401248fd:	48 89 d9             	mov    %rbx,%rcx
   140124900:	ff 10                	call   *(%rax)
   140124902:	48 8b 94 24 d8 07 00 	mov    0x7d8(%rsp),%rdx
   140124909:	00 
   14012490a:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   140124911:	48 83 bc 24 e8 07 00 	cmpq   $0x0,0x7e8(%rsp)
   140124918:	00 00 
   14012491a:	0f 8f ff df 00 00    	jg     14013291f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1064f>
   140124920:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140124927:	00 
   140124928:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   14012492f:	0f 84 c8 b6 00 00    	je     14012fffd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd2d>
   140124935:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
   14012493c:	00 
   14012493d:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140124944:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012494b:	0f 84 b7 41 00 00    	je     140128b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6838>
   140124951:	0f b6 45 03          	movzbl 0x3(%rbp),%eax
   140124955:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012495b:	48 83 c5 04          	add    $0x4,%rbp
   14012495f:	48 8d 3d 3a 87 29 00 	lea    0x29873a(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124966:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012496a:	ff e0                	jmp    *%rax
   14012496c:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   140124973:	48 85 c0             	test   %rax,%rax
   140124976:	0f 84 15 e5 ff ff    	je     140122e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc1>
   14012497c:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
   140124980:	48 83 e8 01          	sub    $0x1,%rax
   140124984:	48 8b ac 24 c8 01 00 	mov    0x1c8(%rsp),%rbp
   14012498b:	00 
   14012498c:	48 8d 14 d3          	lea    (%rbx,%rdx,8),%rdx
   140124990:	48 8b ba 98 10 00 00 	mov    0x1098(%rdx),%rdi
   140124997:	48 8b 8a a0 10 00 00 	mov    0x10a0(%rdx),%rcx
   14012499e:	4c 8b aa a8 10 00 00 	mov    0x10a8(%rdx),%r13
   1401249a5:	48 89 83 c0 50 01 00 	mov    %rax,0x150c0(%rbx)
   1401249ac:	45 84 e4             	test   %r12b,%r12b
   1401249af:	75 17                	jne    1401249c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26f8>
   1401249b1:	48 bd 00 00 00 00 00 	movabs $0xfffb000000000000,%rbp
   1401249b8:	00 fb ff 
   1401249bb:	48 39 b3 48 10 00 00 	cmp    %rsi,0x1048(%rbx)
   1401249c2:	73 04                	jae    1401249c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26f8>
   1401249c4:	48 8b 6e f8          	mov    -0x8(%rsi),%rbp
   1401249c8:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   1401249cf:	0f 84 0a 66 00 00    	je     14012afdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d0f>
   1401249d5:	48 89 8b 68 52 01 00 	mov    %rcx,0x15268(%rbx)
   1401249dc:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401249e3:	48 89 ac 24 c8 01 00 	mov    %rbp,0x1c8(%rsp)
   1401249ea:	00 
   1401249eb:	4a 8d 34 ea          	lea    (%rdx,%r13,8),%rsi
   1401249ef:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401249f6:	4d 85 ed             	test   %r13,%r13
   1401249f9:	74 0d                	je     140124a08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2738>
   1401249fb:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124a00:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124a07:	00 
   140124a08:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   140124a0c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124a13:	0f 84 46 6a 00 00    	je     14012b45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x918f>
   140124a19:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140124a1d:	0f b6 00             	movzbl (%rax),%eax
   140124a20:	48 8d 3d 79 86 29 00 	lea    0x298679(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124a27:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124a2d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124a31:	ff e0                	jmp    *%rax
   140124a33:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140124a37:	44 0f b6 4d 02       	movzbl 0x2(%rbp),%r9d
   140124a3c:	48 83 c5 03          	add    $0x3,%rbp
   140124a40:	41 80 fc 02          	cmp    $0x2,%r12b
   140124a44:	0f 84 94 55 00 00    	je     140129fde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d0e>
   140124a4a:	41 80 fc 01          	cmp    $0x1,%r12b
   140124a4e:	0f 84 92 76 00 00    	je     14012c0e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e16>
   140124a54:	4c 8b ab 68 52 01 00 	mov    0x15268(%rbx),%r13
   140124a5b:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140124a62:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140124a69:	4b 8d 0c 29          	lea    (%r9,%r13,1),%rcx
   140124a6d:	48 c1 fa 03          	sar    $0x3,%rdx
   140124a71:	48 89 8b 68 52 01 00 	mov    %rcx,0x15268(%rbx)
   140124a78:	48 83 c1 40          	add    $0x40,%rcx
   140124a7c:	48 39 d1             	cmp    %rdx,%rcx
   140124a7f:	0f 83 90 9b 00 00    	jae    14012e615 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc345>
   140124a85:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124a8c:	49 89 f3             	mov    %rsi,%r11
   140124a8f:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   140124a96:	4c 29 fd             	sub    %r15,%rbp
   140124a99:	49 29 d3             	sub    %rdx,%r11
   140124a9c:	4d 89 da             	mov    %r11,%r10
   140124a9f:	49 c1 fa 03          	sar    $0x3,%r10
   140124aa3:	48 3d ff 07 00 00    	cmp    $0x7ff,%rax
   140124aa9:	0f 87 bb 1f 01 00    	ja     140136a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1479a>
   140124aaf:	48 8d 48 01          	lea    0x1(%rax),%rcx
   140124ab3:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   140124ab7:	48 89 8b c0 50 01 00 	mov    %rcx,0x150c0(%rbx)
   140124abe:	48 8b 8b 70 52 01 00 	mov    0x15270(%rbx),%rcx
   140124ac5:	4c 89 8c c3 d8 10 00 	mov    %r9,0x10d8(%rbx,%rax,8)
   140124acc:	00 
   140124acd:	4c 8b 8b a0 52 01 00 	mov    0x152a0(%rbx),%r9
   140124ad4:	48 89 ac c3 c0 10 00 	mov    %rbp,0x10c0(%rbx,%rax,8)
   140124adb:	00 
   140124adc:	4c 89 ac c3 c8 10 00 	mov    %r13,0x10c8(%rbx,%rax,8)
   140124ae3:	00 
   140124ae4:	4c 89 94 c3 d0 10 00 	mov    %r10,0x10d0(%rbx,%rax,8)
   140124aeb:	00 
   140124aec:	48 89 bc c3 e0 10 00 	mov    %rdi,0x10e0(%rbx,%rax,8)
   140124af3:	00 
   140124af4:	4c 39 49 68          	cmp    %r9,0x68(%rcx)
   140124af8:	0f 83 dc 9a 00 00    	jae    14012e5da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc30a>
   140124afe:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   140124b02:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124b09:	0f 84 ce 7e 00 00    	je     14012c9dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa70d>
   140124b0f:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140124b13:	0f b6 00             	movzbl (%rax),%eax
   140124b16:	48 8d 3d 83 85 29 00 	lea    0x298583(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124b1d:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140124b20:	4c 8b ab 68 52 01 00 	mov    0x15268(%rbx),%r13
   140124b27:	44 0f b6 4d 02       	movzbl 0x2(%rbp),%r9d
   140124b2c:	48 8d 45 03          	lea    0x3(%rbp),%rax
   140124b30:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140124b37:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140124b3e:	4b 8d 0c 29          	lea    (%r9,%r13,1),%rcx
   140124b42:	44 0f b7 5d 00       	movzwl 0x0(%rbp),%r11d
   140124b47:	48 c1 fa 03          	sar    $0x3,%rdx
   140124b4b:	48 89 8b 68 52 01 00 	mov    %rcx,0x15268(%rbx)
   140124b52:	48 83 c1 40          	add    $0x40,%rcx
   140124b56:	48 39 d1             	cmp    %rdx,%rcx
   140124b59:	0f 83 db 8f 00 00    	jae    14012db3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb86a>
   140124b5f:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140124b66:	41 80 fc 01          	cmp    $0x1,%r12b
   140124b6a:	0f 84 95 53 00 00    	je     140129f05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c35>
   140124b70:	41 80 fc 02          	cmp    $0x2,%r12b
   140124b74:	0f 84 74 7a 00 00    	je     14012c5ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa31e>
   140124b7a:	48 8b 4e f8          	mov    -0x8(%rsi),%rcx
   140124b7e:	48 83 ee 08          	sub    $0x8,%rsi
   140124b82:	4a 89 0c ea          	mov    %rcx,(%rdx,%r13,8)
   140124b86:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124b8d:	49 89 f2             	mov    %rsi,%r10
   140124b90:	48 8b 8b c0 50 01 00 	mov    0x150c0(%rbx),%rcx
   140124b97:	4c 29 f8             	sub    %r15,%rax
   140124b9a:	41 0f b7 eb          	movzwl %r11w,%ebp
   140124b9e:	49 29 d2             	sub    %rdx,%r10
   140124ba1:	4c 89 d7             	mov    %r10,%rdi
   140124ba4:	48 c1 ff 03          	sar    $0x3,%rdi
   140124ba8:	48 81 f9 ff 07 00 00 	cmp    $0x7ff,%rcx
   140124baf:	0f 87 b5 1e 01 00    	ja     140136a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1479a>
   140124bb5:	4c 8d 59 01          	lea    0x1(%rcx),%r11
   140124bb9:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
   140124bbd:	4c 89 9b c0 50 01 00 	mov    %r11,0x150c0(%rbx)
   140124bc4:	4c 89 8c cb d8 10 00 	mov    %r9,0x10d8(%rbx,%rcx,8)
   140124bcb:	00 
   140124bcc:	4c 8b 8b a0 52 01 00 	mov    0x152a0(%rbx),%r9
   140124bd3:	48 89 84 cb c0 10 00 	mov    %rax,0x10c0(%rbx,%rcx,8)
   140124bda:	00 
   140124bdb:	4c 89 ac cb c8 10 00 	mov    %r13,0x10c8(%rbx,%rcx,8)
   140124be2:	00 
   140124be3:	48 89 bc cb d0 10 00 	mov    %rdi,0x10d0(%rbx,%rcx,8)
   140124bea:	00 
   140124beb:	48 89 ac cb e0 10 00 	mov    %rbp,0x10e0(%rbx,%rcx,8)
   140124bf2:	00 
   140124bf3:	48 8b 8b 70 52 01 00 	mov    0x15270(%rbx),%rcx
   140124bfa:	4c 39 49 68          	cmp    %r9,0x68(%rcx)
   140124bfe:	0f 83 77 a2 00 00    	jae    14012ee7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbab>
   140124c04:	49 8d 04 2f          	lea    (%r15,%rbp,1),%rax
   140124c08:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124c0f:	0f 84 c8 7d 00 00    	je     14012c9dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa70d>
   140124c15:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140124c19:	0f b6 00             	movzbl (%rax),%eax
   140124c1c:	48 8d 3d 7d 84 29 00 	lea    0x29847d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c23:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140124c26:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   140124c2d:	48 85 c0             	test   %rax,%rax
   140124c30:	0f 84 5b e2 ff ff    	je     140122e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc1>
   140124c36:	4c 8d 68 ff          	lea    -0x1(%rax),%r13
   140124c3a:	45 84 e4             	test   %r12b,%r12b
   140124c3d:	75 0c                	jne    140124c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x297b>
   140124c3f:	48 8b 56 f8          	mov    -0x8(%rsi),%rdx
   140124c43:	48 89 94 24 c8 01 00 	mov    %rdx,0x1c8(%rsp)
   140124c4a:	00 
   140124c4b:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
   140124c4f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124c56:	48 8d 0c c3          	lea    (%rbx,%rax,8),%rcx
   140124c5a:	48 8b 81 a0 10 00 00 	mov    0x10a0(%rcx),%rax
   140124c61:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140124c68:	48 8b 81 a8 10 00 00 	mov    0x10a8(%rcx),%rax
   140124c6f:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124c73:	48 8b 81 98 10 00 00 	mov    0x1098(%rcx),%rax
   140124c7a:	4c 89 ab c0 50 01 00 	mov    %r13,0x150c0(%rbx)
   140124c81:	4d 85 ed             	test   %r13,%r13
   140124c84:	0f 85 62 41 00 00    	jne    140128dec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b1c>
   140124c8a:	4c 01 f8             	add    %r15,%rax
   140124c8d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124c94:	0f 84 c5 67 00 00    	je     14012b45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x918f>
   140124c9a:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140124c9e:	0f b6 00             	movzbl (%rax),%eax
   140124ca1:	48 8d 3d f8 83 29 00 	lea    0x2983f8(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124ca8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124cae:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124cb2:	ff e0                	jmp    *%rax
   140124cb4:	41 80 fc 02          	cmp    $0x2,%r12b
   140124cb8:	0f 84 13 50 00 00    	je     140129cd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a01>
   140124cbe:	41 80 fc 01          	cmp    $0x1,%r12b
   140124cc2:	0f 84 45 7b 00 00    	je     14012c80d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa53d>
   140124cc8:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124ccf:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124cd6:	c5 f8 77             	vzeroupper
   140124cd9:	48 29 d6             	sub    %rdx,%rsi
   140124cdc:	4c 29 fd             	sub    %r15,%rbp
   140124cdf:	48 29 d0             	sub    %rdx,%rax
   140124ce2:	48 89 f7             	mov    %rsi,%rdi
   140124ce5:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124cec:	48 c1 ff 03          	sar    $0x3,%rdi
   140124cf0:	48 39 f0             	cmp    %rsi,%rax
   140124cf3:	0f 82 6c 71 00 00    	jb     14012be65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b95>
   140124cf9:	c5 f9 6f 05 7f 4d 23 	vmovdqa 0x234d7f(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140124d00:	00 
   140124d01:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124d08:	4c 89 f2             	mov    %r14,%rdx
   140124d0b:	48 89 d9             	mov    %rbx,%rcx
   140124d0e:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124d15:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124d1c:	00 
   140124d1d:	e8 3e 24 fe ff       	call   140107160 <setun::VM::handle_push_string(setun::Chunk const&)>
   140124d22:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124d29:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124d30:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124d37:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124d3e:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124d42:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124d49:	4c 01 f9             	add    %r15,%rcx
   140124d4c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124d51:	4d 85 ed             	test   %r13,%r13
   140124d54:	74 0d                	je     140124d63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a93>
   140124d56:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124d5b:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124d62:	00 
   140124d63:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124d6a:	0f 84 00 67 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140124d70:	0f b6 01             	movzbl (%rcx),%eax
   140124d73:	48 8d 3d 26 83 29 00 	lea    0x298326(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d7a:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124d7e:	45 31 e4             	xor    %r12d,%r12d
   140124d81:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124d85:	ff e0                	jmp    *%rax
   140124d87:	41 80 fc 02          	cmp    $0x2,%r12b
   140124d8b:	0f 84 fd 48 00 00    	je     14012968e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73be>
   140124d91:	41 80 fc 01          	cmp    $0x1,%r12b
   140124d95:	0f 84 24 7b 00 00    	je     14012c8bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ef>
   140124d9b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124da2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124da9:	c5 f8 77             	vzeroupper
   140124dac:	48 29 d6             	sub    %rdx,%rsi
   140124daf:	4c 29 fd             	sub    %r15,%rbp
   140124db2:	48 29 d0             	sub    %rdx,%rax
   140124db5:	48 89 f7             	mov    %rsi,%rdi
   140124db8:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124dbf:	48 c1 ff 03          	sar    $0x3,%rdi
   140124dc3:	48 39 f0             	cmp    %rsi,%rax
   140124dc6:	0f 82 ae 70 00 00    	jb     14012be7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9baa>
   140124dcc:	c5 f9 6f 05 ac 4c 23 	vmovdqa 0x234cac(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140124dd3:	00 
   140124dd4:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124ddb:	4c 89 f2             	mov    %r14,%rdx
   140124dde:	48 89 d9             	mov    %rbx,%rcx
   140124de1:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124de8:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124def:	00 
   140124df0:	e8 db 29 fe ff       	call   1401077d0 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140124df5:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124dfc:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124e03:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124e0a:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124e11:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124e15:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124e1c:	4c 01 f9             	add    %r15,%rcx
   140124e1f:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124e24:	4d 85 ed             	test   %r13,%r13
   140124e27:	74 0d                	je     140124e36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b66>
   140124e29:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124e2e:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124e35:	00 
   140124e36:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e3d:	0f 84 2d 66 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140124e43:	0f b6 01             	movzbl (%rcx),%eax
   140124e46:	48 8d 3d 53 82 29 00 	lea    0x298253(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e4d:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124e51:	45 31 e4             	xor    %r12d,%r12d
   140124e54:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124e58:	ff e0                	jmp    *%rax
   140124e5a:	41 80 fc 02          	cmp    $0x2,%r12b
   140124e5e:	0f 84 c5 4d 00 00    	je     140129c29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7959>
   140124e64:	41 80 fc 01          	cmp    $0x1,%r12b
   140124e68:	0f 84 84 7a 00 00    	je     14012c8f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa622>
   140124e6e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124e75:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124e7c:	c5 f8 77             	vzeroupper
   140124e7f:	48 29 d6             	sub    %rdx,%rsi
   140124e82:	4c 29 fd             	sub    %r15,%rbp
   140124e85:	48 29 d0             	sub    %rdx,%rax
   140124e88:	48 89 f7             	mov    %rsi,%rdi
   140124e8b:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124e92:	48 c1 ff 03          	sar    $0x3,%rdi
   140124e96:	48 39 f0             	cmp    %rsi,%rax
   140124e99:	0f 82 f0 6f 00 00    	jb     14012be8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bbf>
   140124e9f:	c5 f9 6f 05 d9 4b 23 	vmovdqa 0x234bd9(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140124ea6:	00 
   140124ea7:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124eae:	4c 89 f2             	mov    %r14,%rdx
   140124eb1:	48 89 d9             	mov    %rbx,%rcx
   140124eb4:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124ebb:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124ec2:	00 
   140124ec3:	e8 08 73 fe ff       	call   14010c1d0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140124ec8:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124ecf:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124ed6:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124edd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124ee4:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124ee8:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124eef:	4c 01 f9             	add    %r15,%rcx
   140124ef2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124ef7:	4d 85 ed             	test   %r13,%r13
   140124efa:	74 0d                	je     140124f09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c39>
   140124efc:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124f01:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124f08:	00 
   140124f09:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124f10:	0f 84 5a 65 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140124f16:	0f b6 01             	movzbl (%rcx),%eax
   140124f19:	48 8d 3d 80 81 29 00 	lea    0x298180(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f20:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124f24:	45 31 e4             	xor    %r12d,%r12d
   140124f27:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124f2b:	ff e0                	jmp    *%rax
   140124f2d:	41 80 fc 02          	cmp    $0x2,%r12b
   140124f31:	0f 84 31 4d 00 00    	je     140129c68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7998>
   140124f37:	41 80 fc 01          	cmp    $0x1,%r12b
   140124f3b:	0f 84 7b 75 00 00    	je     14012c4bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1ec>
   140124f41:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124f48:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124f4f:	c5 f8 77             	vzeroupper
   140124f52:	48 29 d6             	sub    %rdx,%rsi
   140124f55:	4c 29 fd             	sub    %r15,%rbp
   140124f58:	48 29 d0             	sub    %rdx,%rax
   140124f5b:	48 89 f7             	mov    %rsi,%rdi
   140124f5e:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124f65:	48 c1 ff 03          	sar    $0x3,%rdi
   140124f69:	48 39 f0             	cmp    %rsi,%rax
   140124f6c:	0f 82 32 6f 00 00    	jb     14012bea4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd4>
   140124f72:	c5 f9 6f 05 06 4b 23 	vmovdqa 0x234b06(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140124f79:	00 
   140124f7a:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124f81:	4c 89 f2             	mov    %r14,%rdx
   140124f84:	48 89 d9             	mov    %rbx,%rcx
   140124f87:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124f8e:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124f95:	00 
   140124f96:	e8 25 eb fd ff       	call   140103ac0 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140124f9b:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124fa2:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124fa9:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124fb0:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124fb7:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124fbb:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124fc2:	4c 01 f9             	add    %r15,%rcx
   140124fc5:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124fca:	4d 85 ed             	test   %r13,%r13
   140124fcd:	74 0d                	je     140124fdc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d0c>
   140124fcf:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124fd4:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124fdb:	00 
   140124fdc:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124fe3:	0f 84 87 64 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140124fe9:	0f b6 01             	movzbl (%rcx),%eax
   140124fec:	48 8d 3d ad 80 29 00 	lea    0x2980ad(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124ff3:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124ff7:	45 31 e4             	xor    %r12d,%r12d
   140124ffa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124ffe:	ff e0                	jmp    *%rax
   140125000:	41 80 fc 02          	cmp    $0x2,%r12b
   140125004:	0f 84 33 53 00 00    	je     14012a33d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x806d>
   14012500a:	41 80 fc 01          	cmp    $0x1,%r12b
   14012500e:	0f 84 db 74 00 00    	je     14012c4ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa21f>
   140125014:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012501b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125022:	c5 f8 77             	vzeroupper
   140125025:	48 29 d6             	sub    %rdx,%rsi
   140125028:	4c 29 fd             	sub    %r15,%rbp
   14012502b:	48 29 d0             	sub    %rdx,%rax
   14012502e:	48 89 f7             	mov    %rsi,%rdi
   140125031:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125038:	48 c1 ff 03          	sar    $0x3,%rdi
   14012503c:	48 39 f0             	cmp    %rsi,%rax
   14012503f:	0f 82 74 6e 00 00    	jb     14012beb9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9be9>
   140125045:	c5 f9 6f 05 33 4a 23 	vmovdqa 0x234a33(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012504c:	00 
   14012504d:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125054:	4c 89 f2             	mov    %r14,%rdx
   140125057:	48 89 d9             	mov    %rbx,%rcx
   14012505a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125061:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125068:	00 
   140125069:	e8 f2 cf fd ff       	call   140102060 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   14012506e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125075:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012507c:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125083:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012508a:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012508e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125095:	4c 01 f9             	add    %r15,%rcx
   140125098:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012509d:	4d 85 ed             	test   %r13,%r13
   1401250a0:	74 0d                	je     1401250af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ddf>
   1401250a2:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401250a7:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401250ae:	00 
   1401250af:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401250b6:	0f 84 b4 63 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401250bc:	0f b6 01             	movzbl (%rcx),%eax
   1401250bf:	48 8d 3d da 7f 29 00 	lea    0x297fda(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401250c6:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401250ca:	45 31 e4             	xor    %r12d,%r12d
   1401250cd:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401250d1:	ff e0                	jmp    *%rax
   1401250d3:	41 80 fc 02          	cmp    $0x2,%r12b
   1401250d7:	0f 84 7a 54 00 00    	je     14012a557 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8287>
   1401250dd:	41 80 fc 01          	cmp    $0x1,%r12b
   1401250e1:	0f 84 cd 6e 00 00    	je     14012bfb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ce4>
   1401250e7:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401250ee:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401250f5:	c5 f8 77             	vzeroupper
   1401250f8:	48 29 d6             	sub    %rdx,%rsi
   1401250fb:	4c 29 fd             	sub    %r15,%rbp
   1401250fe:	48 29 d0             	sub    %rdx,%rax
   140125101:	48 89 f7             	mov    %rsi,%rdi
   140125104:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012510b:	48 c1 ff 03          	sar    $0x3,%rdi
   14012510f:	48 39 f0             	cmp    %rsi,%rax
   140125112:	0f 82 b6 6d 00 00    	jb     14012bece <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bfe>
   140125118:	c5 f9 6f 05 60 49 23 	vmovdqa 0x234960(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012511f:	00 
   140125120:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125127:	4c 89 f2             	mov    %r14,%rdx
   14012512a:	48 89 d9             	mov    %rbx,%rcx
   14012512d:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125134:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012513b:	00 
   14012513c:	e8 3f e0 fd ff       	call   140103180 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   140125141:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125148:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012514f:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125156:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012515d:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125161:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125168:	4c 01 f9             	add    %r15,%rcx
   14012516b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125170:	4d 85 ed             	test   %r13,%r13
   140125173:	74 0d                	je     140125182 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eb2>
   140125175:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012517a:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125181:	00 
   140125182:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125189:	0f 84 e1 62 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   14012518f:	0f b6 01             	movzbl (%rcx),%eax
   140125192:	48 8d 3d 07 7f 29 00 	lea    0x297f07(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125199:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012519d:	45 31 e4             	xor    %r12d,%r12d
   1401251a0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401251a4:	ff e0                	jmp    *%rax
   1401251a6:	41 80 fc 02          	cmp    $0x2,%r12b
   1401251aa:	0f 84 f1 4f 00 00    	je     14012a1a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ed1>
   1401251b0:	41 80 fc 01          	cmp    $0x1,%r12b
   1401251b4:	0f 84 8e 71 00 00    	je     14012c348 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa078>
   1401251ba:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401251c1:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401251c8:	c5 f8 77             	vzeroupper
   1401251cb:	48 29 d6             	sub    %rdx,%rsi
   1401251ce:	4c 29 fd             	sub    %r15,%rbp
   1401251d1:	48 29 d0             	sub    %rdx,%rax
   1401251d4:	48 89 f7             	mov    %rsi,%rdi
   1401251d7:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401251de:	48 c1 ff 03          	sar    $0x3,%rdi
   1401251e2:	48 39 f0             	cmp    %rsi,%rax
   1401251e5:	0f 82 bd 6b 00 00    	jb     14012bda8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ad8>
   1401251eb:	c5 f9 6f 05 8d 48 23 	vmovdqa 0x23488d(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401251f2:	00 
   1401251f3:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401251fa:	4c 89 f2             	mov    %r14,%rdx
   1401251fd:	48 89 d9             	mov    %rbx,%rcx
   140125200:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125207:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012520e:	00 
   14012520f:	e8 6c 5f fe ff       	call   14010b180 <setun::VM::handle_print(setun::Chunk const&)>
   140125214:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012521b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125222:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125229:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125230:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125234:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012523b:	4c 01 f9             	add    %r15,%rcx
   14012523e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125243:	4d 85 ed             	test   %r13,%r13
   140125246:	74 0d                	je     140125255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f85>
   140125248:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012524d:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125254:	00 
   140125255:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012525c:	0f 84 0e 62 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125262:	0f b6 01             	movzbl (%rcx),%eax
   140125265:	48 8d 3d 34 7e 29 00 	lea    0x297e34(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012526c:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125270:	45 31 e4             	xor    %r12d,%r12d
   140125273:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125277:	ff e0                	jmp    *%rax
   140125279:	41 80 fc 02          	cmp    $0x2,%r12b
   14012527d:	0f 84 13 53 00 00    	je     14012a596 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82c6>
   140125283:	41 80 fc 01          	cmp    $0x1,%r12b
   140125287:	0f 84 55 70 00 00    	je     14012c2e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa012>
   14012528d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125294:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012529b:	c5 f8 77             	vzeroupper
   14012529e:	48 29 d6             	sub    %rdx,%rsi
   1401252a1:	4c 29 fd             	sub    %r15,%rbp
   1401252a4:	48 29 d0             	sub    %rdx,%rax
   1401252a7:	48 89 f7             	mov    %rsi,%rdi
   1401252aa:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401252b1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401252b5:	48 39 f0             	cmp    %rsi,%rax
   1401252b8:	0f 82 ff 6a 00 00    	jb     14012bdbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aed>
   1401252be:	c5 f9 6f 05 ba 47 23 	vmovdqa 0x2347ba(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401252c5:	00 
   1401252c6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401252cd:	4c 89 f2             	mov    %r14,%rdx
   1401252d0:	48 89 d9             	mov    %rbx,%rcx
   1401252d3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401252da:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401252e1:	00 
   1401252e2:	e8 89 f3 fd ff       	call   140104670 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   1401252e7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401252ee:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401252f5:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401252fc:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125303:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125307:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012530e:	4c 01 f9             	add    %r15,%rcx
   140125311:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125316:	4d 85 ed             	test   %r13,%r13
   140125319:	74 0d                	je     140125328 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3058>
   14012531b:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140125320:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125327:	00 
   140125328:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012532f:	0f 84 3b 61 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125335:	0f b6 01             	movzbl (%rcx),%eax
   140125338:	48 8d 3d 61 7d 29 00 	lea    0x297d61(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012533f:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125343:	45 31 e4             	xor    %r12d,%r12d
   140125346:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012534a:	ff e0                	jmp    *%rax
   14012534c:	41 80 fc 02          	cmp    $0x2,%r12b
   140125350:	0f 84 83 51 00 00    	je     14012a4d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8209>
   140125356:	41 80 fc 01          	cmp    $0x1,%r12b
   14012535a:	0f 84 4e 70 00 00    	je     14012c3ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0de>
   140125360:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125367:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012536e:	c5 f8 77             	vzeroupper
   140125371:	48 29 d6             	sub    %rdx,%rsi
   140125374:	4c 29 fd             	sub    %r15,%rbp
   140125377:	48 29 d0             	sub    %rdx,%rax
   14012537a:	48 89 f7             	mov    %rsi,%rdi
   14012537d:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125384:	48 c1 ff 03          	sar    $0x3,%rdi
   140125388:	48 39 f0             	cmp    %rsi,%rax
   14012538b:	0f 82 41 6a 00 00    	jb     14012bdd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b02>
   140125391:	c5 f9 6f 05 e7 46 23 	vmovdqa 0x2346e7(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140125398:	00 
   140125399:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401253a0:	4c 89 f2             	mov    %r14,%rdx
   1401253a3:	48 89 d9             	mov    %rbx,%rcx
   1401253a6:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401253ad:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401253b4:	00 
   1401253b5:	e8 56 6a fe ff       	call   14010be10 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   1401253ba:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401253c1:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401253c8:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401253cf:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401253d6:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401253da:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401253e1:	4c 01 f9             	add    %r15,%rcx
   1401253e4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401253e9:	4d 85 ed             	test   %r13,%r13
   1401253ec:	74 0d                	je     1401253fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x312b>
   1401253ee:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401253f3:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401253fa:	00 
   1401253fb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125402:	0f 84 68 60 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125408:	0f b6 01             	movzbl (%rcx),%eax
   14012540b:	48 8d 3d 8e 7c 29 00 	lea    0x297c8e(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125412:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125416:	45 31 e4             	xor    %r12d,%r12d
   140125419:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012541d:	ff e0                	jmp    *%rax
   14012541f:	41 80 fc 02          	cmp    $0x2,%r12b
   140125423:	0f 84 ac 51 00 00    	je     14012a5d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8305>
   140125429:	41 80 fc 01          	cmp    $0x1,%r12b
   14012542d:	0f 84 ef 70 00 00    	je     14012c522 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa252>
   140125433:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012543a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125441:	c5 f8 77             	vzeroupper
   140125444:	48 29 d6             	sub    %rdx,%rsi
   140125447:	4c 29 fd             	sub    %r15,%rbp
   14012544a:	48 29 d0             	sub    %rdx,%rax
   14012544d:	48 89 f7             	mov    %rsi,%rdi
   140125450:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125457:	48 c1 ff 03          	sar    $0x3,%rdi
   14012545b:	48 39 f0             	cmp    %rsi,%rax
   14012545e:	0f 82 ad 69 00 00    	jb     14012be11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b41>
   140125464:	c5 f9 6f 05 14 46 23 	vmovdqa 0x234614(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012546b:	00 
   14012546c:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125473:	4c 89 f2             	mov    %r14,%rdx
   140125476:	48 89 d9             	mov    %rbx,%rcx
   140125479:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125480:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125487:	00 
   140125488:	e8 d3 af fd ff       	call   140100460 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   14012548d:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125494:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012549b:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401254a2:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401254a9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401254ad:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401254b4:	4c 01 f9             	add    %r15,%rcx
   1401254b7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401254bc:	4d 85 ed             	test   %r13,%r13
   1401254bf:	74 0d                	je     1401254ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31fe>
   1401254c1:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401254c6:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401254cd:	00 
   1401254ce:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401254d5:	0f 84 95 5f 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401254db:	0f b6 01             	movzbl (%rcx),%eax
   1401254de:	48 8d 3d bb 7b 29 00 	lea    0x297bbb(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401254e5:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401254e9:	45 31 e4             	xor    %r12d,%r12d
   1401254ec:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401254f0:	ff e0                	jmp    *%rax
   1401254f2:	41 80 fc 02          	cmp    $0x2,%r12b
   1401254f6:	0f 84 86 42 00 00    	je     140129782 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74b2>
   1401254fc:	41 80 fc 01          	cmp    $0x1,%r12b
   140125500:	0f 84 86 73 00 00    	je     14012c88c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5bc>
   140125506:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012550d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125514:	c5 f8 77             	vzeroupper
   140125517:	48 29 d6             	sub    %rdx,%rsi
   14012551a:	4c 29 fd             	sub    %r15,%rbp
   14012551d:	48 29 d0             	sub    %rdx,%rax
   140125520:	48 89 f7             	mov    %rsi,%rdi
   140125523:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012552a:	48 c1 ff 03          	sar    $0x3,%rdi
   14012552e:	48 39 f0             	cmp    %rsi,%rax
   140125531:	0f 82 ef 68 00 00    	jb     14012be26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b56>
   140125537:	c5 f9 6f 05 41 45 23 	vmovdqa 0x234541(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012553e:	00 
   14012553f:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125546:	4c 89 f2             	mov    %r14,%rdx
   140125549:	48 89 d9             	mov    %rbx,%rcx
   14012554c:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125553:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012555a:	00 
   14012555b:	e8 a0 af fd ff       	call   140100500 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140125560:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125567:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012556e:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125575:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012557c:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125580:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125587:	4c 01 f9             	add    %r15,%rcx
   14012558a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012558f:	4d 85 ed             	test   %r13,%r13
   140125592:	74 0d                	je     1401255a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32d1>
   140125594:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140125599:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401255a0:	00 
   1401255a1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401255a8:	0f 84 c2 5e 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401255ae:	0f b6 01             	movzbl (%rcx),%eax
   1401255b1:	48 8d 3d e8 7a 29 00 	lea    0x297ae8(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401255b8:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401255bc:	45 31 e4             	xor    %r12d,%r12d
   1401255bf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401255c3:	ff e0                	jmp    *%rax
   1401255c5:	41 80 fc 02          	cmp    $0x2,%r12b
   1401255c9:	0f 84 f2 41 00 00    	je     1401297c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74f1>
   1401255cf:	41 80 fc 01          	cmp    $0x1,%r12b
   1401255d3:	0f 84 68 71 00 00    	je     14012c741 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa471>
   1401255d9:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401255e0:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401255e7:	c5 f8 77             	vzeroupper
   1401255ea:	48 29 d6             	sub    %rdx,%rsi
   1401255ed:	4c 29 fd             	sub    %r15,%rbp
   1401255f0:	48 29 d0             	sub    %rdx,%rax
   1401255f3:	48 89 f7             	mov    %rsi,%rdi
   1401255f6:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401255fd:	48 c1 ff 03          	sar    $0x3,%rdi
   140125601:	48 39 f0             	cmp    %rsi,%rax
   140125604:	0f 82 dd 67 00 00    	jb     14012bde7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b17>
   14012560a:	c5 f9 6f 05 6e 44 23 	vmovdqa 0x23446e(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140125611:	00 
   140125612:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125619:	4c 89 f2             	mov    %r14,%rdx
   14012561c:	48 89 d9             	mov    %rbx,%rcx
   14012561f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125626:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012562d:	00 
   14012562e:	e8 ad 90 fd ff       	call   1400fe6e0 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140125633:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012563a:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125641:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125648:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012564f:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125653:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012565a:	4c 01 f9             	add    %r15,%rcx
   14012565d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125662:	4d 85 ed             	test   %r13,%r13
   140125665:	74 0d                	je     140125674 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33a4>
   140125667:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012566c:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125673:	00 
   140125674:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012567b:	0f 84 ef 5d 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125681:	0f b6 01             	movzbl (%rcx),%eax
   140125684:	48 8d 3d 15 7a 29 00 	lea    0x297a15(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012568b:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012568f:	45 31 e4             	xor    %r12d,%r12d
   140125692:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125696:	ff e0                	jmp    *%rax
   140125698:	41 80 fc 02          	cmp    $0x2,%r12b
   14012569c:	0f 84 fc 3b 00 00    	je     14012929e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fce>
   1401256a2:	41 80 fc 01          	cmp    $0x1,%r12b
   1401256a6:	0f 84 ad 71 00 00    	je     14012c859 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa589>
   1401256ac:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401256b3:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401256ba:	c5 f8 77             	vzeroupper
   1401256bd:	48 29 d6             	sub    %rdx,%rsi
   1401256c0:	4c 29 fd             	sub    %r15,%rbp
   1401256c3:	48 29 d0             	sub    %rdx,%rax
   1401256c6:	48 89 f7             	mov    %rsi,%rdi
   1401256c9:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401256d0:	48 c1 ff 03          	sar    $0x3,%rdi
   1401256d4:	48 39 f0             	cmp    %rsi,%rax
   1401256d7:	0f 82 1f 67 00 00    	jb     14012bdfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b2c>
   1401256dd:	c5 f9 6f 05 9b 43 23 	vmovdqa 0x23439b(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401256e4:	00 
   1401256e5:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401256ec:	4c 89 f2             	mov    %r14,%rdx
   1401256ef:	48 89 d9             	mov    %rbx,%rcx
   1401256f2:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401256f9:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125700:	00 
   140125701:	e8 aa ea fd ff       	call   1401041b0 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140125706:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012570d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125714:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012571b:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125722:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125726:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012572d:	4c 01 f9             	add    %r15,%rcx
   140125730:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125735:	4d 85 ed             	test   %r13,%r13
   140125738:	74 0d                	je     140125747 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3477>
   14012573a:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012573f:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125746:	00 
   140125747:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012574e:	0f 84 1c 5d 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125754:	0f b6 01             	movzbl (%rcx),%eax
   140125757:	48 8d 3d 42 79 29 00 	lea    0x297942(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012575e:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125762:	45 31 e4             	xor    %r12d,%r12d
   140125765:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125769:	ff e0                	jmp    *%rax
   14012576b:	41 80 fc 02          	cmp    $0x2,%r12b
   14012576f:	0f 84 59 46 00 00    	je     140129dce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afe>
   140125775:	41 80 fc 01          	cmp    $0x1,%r12b
   140125779:	0f 84 09 6e 00 00    	je     14012c588 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2b8>
   14012577f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125786:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012578d:	c5 f8 77             	vzeroupper
   140125790:	48 29 d6             	sub    %rdx,%rsi
   140125793:	4c 29 fd             	sub    %r15,%rbp
   140125796:	48 29 d0             	sub    %rdx,%rax
   140125799:	48 89 f7             	mov    %rsi,%rdi
   14012579c:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401257a3:	48 c1 ff 03          	sar    $0x3,%rdi
   1401257a7:	48 39 f0             	cmp    %rsi,%rax
   1401257aa:	0f 82 8b 66 00 00    	jb     14012be3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b6b>
   1401257b0:	c5 f9 6f 05 c8 42 23 	vmovdqa 0x2342c8(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401257b7:	00 
   1401257b8:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401257bf:	4c 89 f2             	mov    %r14,%rdx
   1401257c2:	48 89 d9             	mov    %rbx,%rcx
   1401257c5:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401257cc:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401257d3:	00 
   1401257d4:	e8 07 ec fd ff       	call   1401043e0 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   1401257d9:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401257e0:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401257e7:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401257ee:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401257f5:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401257f9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125800:	4c 01 f9             	add    %r15,%rcx
   140125803:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125808:	4d 85 ed             	test   %r13,%r13
   14012580b:	74 0d                	je     14012581a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x354a>
   14012580d:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140125812:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125819:	00 
   14012581a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125821:	0f 84 49 5c 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140125827:	0f b6 01             	movzbl (%rcx),%eax
   14012582a:	48 8d 3d 6f 78 29 00 	lea    0x29786f(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125831:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125835:	45 31 e4             	xor    %r12d,%r12d
   140125838:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012583c:	ff e0                	jmp    *%rax
   14012583e:	41 80 fc 02          	cmp    $0x2,%r12b
   140125842:	0f 84 47 45 00 00    	je     140129d8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7abf>
   140125848:	41 80 fc 01          	cmp    $0x1,%r12b
   14012584c:	0f 84 bc 6e 00 00    	je     14012c70e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa43e>
   140125852:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125859:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125860:	c5 f8 77             	vzeroupper
   140125863:	48 29 d6             	sub    %rdx,%rsi
   140125866:	4c 29 fd             	sub    %r15,%rbp
   140125869:	48 29 d0             	sub    %rdx,%rax
   14012586c:	48 89 f7             	mov    %rsi,%rdi
   14012586f:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125876:	48 c1 ff 03          	sar    $0x3,%rdi
   14012587a:	48 39 f0             	cmp    %rsi,%rax
   14012587d:	0f 82 b9 62 00 00    	jb     14012bb3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986c>
   140125883:	c5 f9 6f 05 f5 41 23 	vmovdqa 0x2341f5(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012588a:	00 
   14012588b:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125892:	4c 89 f2             	mov    %r14,%rdx
   140125895:	48 89 d9             	mov    %rbx,%rcx
   140125898:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012589f:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401258a6:	00 
   1401258a7:	e8 f4 df fd ff       	call   1401038a0 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   1401258ac:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401258b3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401258ba:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401258c1:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401258c8:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401258cc:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401258d3:	4c 01 f9             	add    %r15,%rcx
   1401258d6:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401258db:	4d 85 ed             	test   %r13,%r13
   1401258de:	74 0d                	je     1401258ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x361d>
   1401258e0:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401258e5:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401258ec:	00 
   1401258ed:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401258f4:	0f 84 76 5b 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401258fa:	0f b6 01             	movzbl (%rcx),%eax
   1401258fd:	48 8d 3d 9c 77 29 00 	lea    0x29779c(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125904:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125908:	45 31 e4             	xor    %r12d,%r12d
   14012590b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012590f:	ff e0                	jmp    *%rax
   140125911:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   140125915:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140125919:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   14012591e:	48 89 bc 24 a0 00 00 	mov    %rdi,0xa0(%rsp)
   140125925:	00 
   140125926:	44 0f b7 45 02       	movzwl 0x2(%rbp),%r8d
   14012592b:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   14012592f:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140125933:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   14012593a:	0f 83 55 8b 00 00    	jae    14012e495 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1c5>
   140125940:	c5 f8 77             	vzeroupper
   140125943:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   14012594a:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140125951:	48 c1 f9 03          	sar    $0x3,%rcx
   140125955:	48 39 cf             	cmp    %rcx,%rdi
   140125958:	0f 83 1c 8f 00 00    	jae    14012e87a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5aa>
   14012595e:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125965:	41 0f b7 c9          	movzwl %r9w,%ecx
   140125969:	0f b7 c0             	movzwl %ax,%eax
   14012596c:	4c 01 e9             	add    %r13,%rcx
   14012596f:	4c 01 e8             	add    %r13,%rax
   140125972:	4c 8d 14 ca          	lea    (%rdx,%rcx,8),%r10
   140125976:	41 0f b7 c8          	movzwl %r8w,%ecx
   14012597a:	4c 8d 1c c2          	lea    (%rdx,%rax,8),%r11
   14012597e:	4c 01 e9             	add    %r13,%rcx
   140125981:	49 8b 02             	mov    (%r10),%rax
   140125984:	4c 8d 0c ca          	lea    (%rdx,%rcx,8),%r9
   140125988:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   14012598f:	ff f7 ff 
   140125992:	48 39 c2             	cmp    %rax,%rdx
   140125995:	0f 83 d9 00 00 00    	jae    140125a74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37a4>
   14012599b:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   1401259a2:	00 fc ff 
   1401259a5:	48 39 d0             	cmp    %rdx,%rax
   1401259a8:	0f 84 c6 00 00 00    	je     140125a74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37a4>
   1401259ae:	48 ba 00 00 00 00 ff 	movabs $0xffffffff00000000,%rdx
   1401259b5:	ff ff ff 
   1401259b8:	48 21 d0             	and    %rdx,%rax
   1401259bb:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   1401259c2:	00 fd ff 
   1401259c5:	48 39 d0             	cmp    %rdx,%rax
   1401259c8:	0f 84 5f 9a 00 00    	je     14012f42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd15d>
   1401259ce:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401259d5:	ff ff ff 
   1401259d8:	49 8b 11             	mov    (%r9),%rdx
   1401259db:	48 b9 00 00 00 00 01 	movabs $0xfffd000100000000,%rcx
   1401259e2:	00 fd ff 
   1401259e5:	48 21 c2             	and    %rax,%rdx
   1401259e8:	48 39 ca             	cmp    %rcx,%rdx
   1401259eb:	0f 84 3c 9a 00 00    	je     14012f42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd15d>
   1401259f1:	49 23 03             	and    (%r11),%rax
   1401259f4:	48 39 c8             	cmp    %rcx,%rax
   1401259f7:	0f 84 30 9a 00 00    	je     14012f42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd15d>
   1401259fd:	4c 89 d9             	mov    %r11,%rcx
   140125a00:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   140125a05:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
   140125a0a:	e8 d1 3a 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125a0f:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140125a14:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
   140125a18:	e8 c3 3a 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125a1d:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140125a22:	c5 f9 28 f8          	vmovapd %xmm0,%xmm7
   140125a26:	e8 b5 3a 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125a2b:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140125a32:	00 fc ff 
   140125a35:	c4 e2 c9 99 c7       	vfmadd132sd %xmm7,%xmm6,%xmm0
   140125a3a:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140125a3e:	c4 e1 f9 7e c2       	vmovq  %xmm0,%rdx
   140125a43:	48 0f 4b c2          	cmovnp %rdx,%rax
   140125a47:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125a4e:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140125a52:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125a59:	0f 84 01 60 00 00    	je     14012ba60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9790>
   140125a5f:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140125a63:	48 8d 3d 36 76 29 00 	lea    0x297636(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a6a:	48 83 c5 09          	add    $0x9,%rbp
   140125a6e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125a72:	ff e0                	jmp    *%rax
   140125a74:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140125a7b:	ff f7 ff 
   140125a7e:	49 8b 01             	mov    (%r9),%rax
   140125a81:	48 39 c2             	cmp    %rax,%rdx
   140125a84:	73 13                	jae    140125a99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37c9>
   140125a86:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140125a8d:	00 fc ff 
   140125a90:	48 39 d0             	cmp    %rdx,%rax
   140125a93:	0f 85 35 ff ff ff    	jne    1401259ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36fe>
   140125a99:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140125aa0:	ff f7 ff 
   140125aa3:	49 8b 03             	mov    (%r11),%rax
   140125aa6:	48 39 c2             	cmp    %rax,%rdx
   140125aa9:	73 13                	jae    140125abe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37ee>
   140125aab:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140125ab2:	00 fc ff 
   140125ab5:	48 39 d0             	cmp    %rdx,%rax
   140125ab8:	0f 85 10 ff ff ff    	jne    1401259ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36fe>
   140125abe:	4c 89 d9             	mov    %r11,%rcx
   140125ac1:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   140125ac6:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
   140125acb:	e8 10 3a 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125ad0:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140125ad5:	c5 f9 28 f8          	vmovapd %xmm0,%xmm7
   140125ad9:	e8 02 3a 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125ade:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140125ae3:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
   140125ae7:	e8 f4 39 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125aec:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125af3:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140125afa:	00 fc ff 
   140125afd:	c4 e2 c1 99 c6       	vfmadd132sd %xmm6,%xmm7,%xmm0
   140125b02:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140125b06:	c4 e1 f9 7e c1       	vmovq  %xmm0,%rcx
   140125b0b:	48 0f 4b c1          	cmovnp %rcx,%rax
   140125b0f:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140125b13:	e9 3a ff ff ff       	jmp    140125a52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3782>
   140125b18:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   140125b1c:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140125b20:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   140125b25:	48 89 bc 24 a0 00 00 	mov    %rdi,0xa0(%rsp)
   140125b2c:	00 
   140125b2d:	44 0f b7 45 02       	movzwl 0x2(%rbp),%r8d
   140125b32:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140125b36:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140125b3a:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140125b41:	0f 83 f5 8d 00 00    	jae    14012e93c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc66c>
   140125b47:	c5 f8 77             	vzeroupper
   140125b4a:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140125b51:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140125b58:	48 c1 f9 03          	sar    $0x3,%rcx
   140125b5c:	48 39 cf             	cmp    %rcx,%rdi
   140125b5f:	0f 83 01 8b 00 00    	jae    14012e666 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc396>
   140125b65:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125b6c:	41 0f b7 c9          	movzwl %r9w,%ecx
   140125b70:	45 0f b7 c0          	movzwl %r8w,%r8d
   140125b74:	0f b7 c0             	movzwl %ax,%eax
   140125b77:	4c 01 e9             	add    %r13,%rcx
   140125b7a:	4d 01 e8             	add    %r13,%r8
   140125b7d:	4c 01 e8             	add    %r13,%rax
   140125b80:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   140125b84:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   140125b88:	4e 8d 0c c2          	lea    (%rdx,%r8,8),%r9
   140125b8c:	48 8b 11             	mov    (%rcx),%rdx
   140125b8f:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140125b94:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140125b9b:	00 ff ff 
   140125b9e:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140125ba5:	00 fd ff 
   140125ba8:	48 21 d0             	and    %rdx,%rax
   140125bab:	4c 39 c0             	cmp    %r8,%rax
   140125bae:	0f 84 f3 40 00 00    	je     140129ca7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79d7>
   140125bb4:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140125bbb:	00 f8 ff 
   140125bbe:	48 39 d0             	cmp    %rdx,%rax
   140125bc1:	0f 84 f8 40 00 00    	je     140129cbf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ef>
   140125bc7:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   140125bce:	00 
   140125bcf:	e8 0c 39 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125bd4:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140125bd9:	48 89 84 24 20 04 00 	mov    %rax,0x420(%rsp)
   140125be0:	00 
   140125be1:	48 8d 84 24 20 04 00 	lea    0x420(%rsp),%rax
   140125be8:	00 
   140125be9:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   140125bf0:	00 
   140125bf1:	48 c7 84 24 28 04 00 	movq   $0x0,0x428(%rsp)
   140125bf8:	00 00 00 00 00 
   140125bfd:	48 c7 84 24 30 04 00 	movq   $0x0,0x430(%rsp)
   140125c04:	00 00 00 00 00 
   140125c09:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140125c0e:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140125c15:	00 ff ff 
   140125c18:	49 8b 11             	mov    (%r9),%rdx
   140125c1b:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140125c22:	00 fd ff 
   140125c25:	48 21 d0             	and    %rdx,%rax
   140125c28:	48 39 c8             	cmp    %rcx,%rax
   140125c2b:	0f 84 8f 5e 00 00    	je     14012bac0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97f0>
   140125c31:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140125c38:	00 f8 ff 
   140125c3b:	48 39 d0             	cmp    %rdx,%rax
   140125c3e:	0f 84 94 5e 00 00    	je     14012bad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9808>
   140125c44:	4c 89 c9             	mov    %r9,%rcx
   140125c47:	e8 94 38 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125c4c:	4c 8d 84 24 40 04 00 	lea    0x440(%rsp),%r8
   140125c53:	00 
   140125c54:	48 c7 84 24 48 04 00 	movq   $0x0,0x448(%rsp)
   140125c5b:	00 00 00 00 00 
   140125c60:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140125c65:	48 c7 84 24 50 04 00 	movq   $0x0,0x450(%rsp)
   140125c6c:	00 00 00 00 00 
   140125c71:	48 89 84 24 40 04 00 	mov    %rax,0x440(%rsp)
   140125c78:	00 
   140125c79:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140125c80:	00 fd ff 
   140125c83:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140125c88:	48 8b 10             	mov    (%rax),%rdx
   140125c8b:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140125c92:	00 ff ff 
   140125c95:	48 21 d0             	and    %rdx,%rax
   140125c98:	48 39 c8             	cmp    %rcx,%rax
   140125c9b:	0f 84 d3 5d 00 00    	je     14012ba74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97a4>
   140125ca1:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140125ca8:	00 f8 ff 
   140125cab:	48 39 d0             	cmp    %rdx,%rax
   140125cae:	0f 84 d8 5d 00 00    	je     14012ba8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bc>
   140125cb4:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140125cb9:	4c 89 84 24 c0 00 00 	mov    %r8,0xc0(%rsp)
   140125cc0:	00 
   140125cc1:	e8 1a 38 0f 00       	call   1402194e0 <setun::VMValue::as_float() const>
   140125cc6:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140125ccb:	48 89 84 24 60 04 00 	mov    %rax,0x460(%rsp)
   140125cd2:	00 
   140125cd3:	48 8d 84 24 60 04 00 	lea    0x460(%rsp),%rax
   140125cda:	00 
   140125cdb:	4c 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%r8
   140125ce2:	00 
   140125ce3:	48 c7 84 24 68 04 00 	movq   $0x0,0x468(%rsp)
   140125cea:	00 00 00 00 00 
   140125cef:	48 c7 84 24 70 04 00 	movq   $0x0,0x470(%rsp)
   140125cf6:	00 00 00 00 00 
   140125cfb:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   140125d02:	00 
   140125d03:	48 8d 84 24 80 06 00 	lea    0x680(%rsp),%rax
   140125d0a:	00 
   140125d0b:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   140125d10:	48 89 c1             	mov    %rax,%rcx
   140125d13:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140125d18:	e8 13 ab ee ff       	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140125d1d:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   140125d22:	48 8b 94 24 80 00 00 	mov    0x80(%rsp),%rdx
   140125d29:	00 
   140125d2a:	48 8d 8c 24 e0 04 00 	lea    0x4e0(%rsp),%rcx
   140125d31:	00 
   140125d32:	e8 89 a5 ee ff       	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140125d37:	48 8b 84 24 f0 04 00 	mov    0x4f0(%rsp),%rax
   140125d3e:	00 
   140125d3f:	c5 f9 6f ac 24 e0 04 	vmovdqa 0x4e0(%rsp),%xmm5
   140125d46:	00 00 
   140125d48:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
   140125d4f:	00 
   140125d50:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140125d55:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140125d5c:	00 
   140125d5d:	c5 f9 7f ac 24 a0 01 	vmovdqa %xmm5,0x1a0(%rsp)
   140125d64:	00 00 
   140125d66:	e8 55 59 0e 00       	call   14020b6c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140125d6b:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125d72:	48 8b 94 24 80 06 00 	mov    0x680(%rsp),%rdx
   140125d79:	00 
   140125d7a:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140125d7e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125d85:	0f 84 d5 5c 00 00    	je     14012ba60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9790>
   140125d8b:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140125d8f:	48 8d 3d 0a 73 29 00 	lea    0x29730a(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125d96:	48 83 c5 09          	add    $0x9,%rbp
   140125d9a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125d9e:	ff e0                	jmp    *%rax
   140125da0:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140125da4:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   140125da8:	4c 01 ef             	add    %r13,%rdi
   140125dab:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140125db2:	0f 83 1b 8b 00 00    	jae    14012e8d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc603>
   140125db8:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140125dbf:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140125dc6:	48 c1 f8 03          	sar    $0x3,%rax
   140125dca:	48 39 c7             	cmp    %rax,%rdi
   140125dcd:	0f 83 de 8a 00 00    	jae    14012e8b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5e1>
   140125dd3:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125dda:	41 80 fc 01          	cmp    $0x1,%r12b
   140125dde:	0f 85 3d 8b 00 00    	jne    14012e921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc651>
   140125de4:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   140125deb:	00 
   140125dec:	45 31 e4             	xor    %r12d,%r12d
   140125def:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140125df3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125dfa:	0f 84 7c 2d 00 00    	je     140128b7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68ac>
   140125e00:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140125e04:	48 8d 3d 95 72 29 00 	lea    0x297295(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e0b:	48 83 c5 03          	add    $0x3,%rbp
   140125e0f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125e13:	ff e0                	jmp    *%rax
   140125e15:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   140125e1a:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   140125e1e:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
   140125e22:	4c 8b 93 68 10 00 00 	mov    0x1068(%rbx),%r10
   140125e29:	45 84 e4             	test   %r12b,%r12b
   140125e2c:	0f 85 66 85 00 00    	jne    14012e398 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0c8>
   140125e32:	41 0f b7 d1          	movzwl %r9w,%edx
   140125e36:	0f b7 c0             	movzwl %ax,%eax
   140125e39:	4c 01 ea             	add    %r13,%rdx
   140125e3c:	4c 01 e8             	add    %r13,%rax
   140125e3f:	49 8b 14 d2          	mov    (%r10,%rdx,8),%rdx
   140125e43:	49 8b 04 c2          	mov    (%r10,%rax,8),%rax
   140125e47:	48 89 94 24 d0 01 00 	mov    %rdx,0x1d0(%rsp)
   140125e4e:	00 
   140125e4f:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140125e56:	00 
   140125e57:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125e5e:	0f 84 32 87 00 00    	je     14012e596 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c6>
   140125e64:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   140125e68:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140125e6e:	48 83 c5 05          	add    $0x5,%rbp
   140125e72:	48 8d 3d 27 72 29 00 	lea    0x297227(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e79:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125e7d:	ff e0                	jmp    *%rax
   140125e7f:	44 0f b7 45 04       	movzwl 0x4(%rbp),%r8d
   140125e84:	48 8d 45 06          	lea    0x6(%rbp),%rax
   140125e88:	44 0f b7 55 00       	movzwl 0x0(%rbp),%r10d
   140125e8d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140125e92:	44 0f b7 4d 02       	movzwl 0x2(%rbp),%r9d
   140125e97:	4b 8d 3c 28          	lea    (%r8,%r13,1),%rdi
   140125e9b:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140125ea2:	0f 83 90 86 00 00    	jae    14012e538 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc268>
   140125ea8:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140125eaf:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140125eb6:	48 c1 f8 03          	sar    $0x3,%rax
   140125eba:	48 39 c7             	cmp    %rax,%rdi
   140125ebd:	0f 83 e5 86 00 00    	jae    14012e5a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2d8>
   140125ec3:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125eca:	41 0f b7 d2          	movzwl %r10w,%edx
   140125ece:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140125ed5:	00 f8 ff 
   140125ed8:	4c 01 ea             	add    %r13,%rdx
   140125edb:	48 8d 0c d0          	lea    (%rax,%rdx,8),%rcx
   140125edf:	41 0f b7 d1          	movzwl %r9w,%edx
   140125ee3:	49 b9 00 00 00 00 00 	movabs $0xffff000000000000,%r9
   140125eea:	00 ff ff 
   140125eed:	4c 8b 01             	mov    (%rcx),%r8
   140125ef0:	4c 01 ea             	add    %r13,%rdx
   140125ef3:	4c 8d 1c d0          	lea    (%rax,%rdx,8),%r11
   140125ef7:	4c 89 c2             	mov    %r8,%rdx
   140125efa:	4c 21 ca             	and    %r9,%rdx
   140125efd:	4c 39 d2             	cmp    %r10,%rdx
   140125f00:	0f 84 0a 3e 00 00    	je     140129d10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a40>
   140125f06:	4c 89 da             	mov    %r11,%rdx
   140125f09:	c5 f8 77             	vzeroupper
   140125f0c:	e8 af 03 0f 00       	call   1402162c0 <setun::VMValue::add(setun::VMValue const&) const>
   140125f11:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125f18:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140125f1c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125f23:	0f 84 c3 53 00 00    	je     14012b2ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x901c>
   140125f29:	0f b6 45 06          	movzbl 0x6(%rbp),%eax
   140125f2d:	48 8d 3d 6c 71 29 00 	lea    0x29716c(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125f34:	48 83 c5 07          	add    $0x7,%rbp
   140125f38:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125f3c:	ff e0                	jmp    *%rax
   140125f3e:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   140125f42:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140125f46:	44 0f b7 55 00       	movzwl 0x0(%rbp),%r10d
   140125f4b:	48 89 bc 24 a0 00 00 	mov    %rdi,0xa0(%rsp)
   140125f52:	00 
   140125f53:	44 0f b7 4d 02       	movzwl 0x2(%rbp),%r9d
   140125f58:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140125f5c:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140125f60:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140125f67:	0f 83 5d 82 00 00    	jae    14012e1ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbefa>
   140125f6d:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140125f74:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140125f7b:	48 c1 f9 03          	sar    $0x3,%rcx
   140125f7f:	48 39 cf             	cmp    %rcx,%rdi
   140125f82:	0f 83 08 82 00 00    	jae    14012e190 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbec0>
   140125f88:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   140125f8f:	41 0f b7 d2          	movzwl %r10w,%edx
   140125f93:	0f b7 c0             	movzwl %ax,%eax
   140125f96:	4c 01 ea             	add    %r13,%rdx
   140125f99:	4c 01 e8             	add    %r13,%rax
   140125f9c:	4d 8d 1c d0          	lea    (%r8,%rdx,8),%r11
   140125fa0:	41 0f b7 d1          	movzwl %r9w,%edx
   140125fa4:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   140125fa8:	4d 8b 0b             	mov    (%r11),%r9
   140125fab:	4c 01 ea             	add    %r13,%rdx
   140125fae:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140125fb3:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140125fba:	00 f8 ff 
   140125fbd:	49 8d 0c d0          	lea    (%r8,%rdx,8),%rcx
   140125fc1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140125fc8:	00 ff ff 
   140125fcb:	4d 89 ca             	mov    %r9,%r10
   140125fce:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   140125fd3:	49 21 d2             	and    %rdx,%r10
   140125fd6:	49 39 c2             	cmp    %rax,%r10
   140125fd9:	0f 85 1e 53 00 00    	jne    14012b2fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x902d>
   140125fdf:	48 8b 09             	mov    (%rcx),%rcx
   140125fe2:	48 89 c8             	mov    %rcx,%rax
   140125fe5:	48 21 d0             	and    %rdx,%rax
   140125fe8:	4c 39 d0             	cmp    %r10,%rax
   140125feb:	0f 85 2c 53 00 00    	jne    14012b31d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904d>
   140125ff1:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   140125ff6:	4d 8b 12             	mov    (%r10),%r10
   140125ff9:	4c 21 d2             	and    %r10,%rdx
   140125ffc:	48 39 c2             	cmp    %rax,%rdx
   140125fff:	0f 85 18 53 00 00    	jne    14012b31d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904d>
   140126005:	48 c1 e1 10          	shl    $0x10,%rcx
   140126009:	4c 89 c8             	mov    %r9,%rax
   14012600c:	49 c1 e2 10          	shl    $0x10,%r10
   140126010:	48 c1 e0 10          	shl    $0x10,%rax
   140126014:	48 c1 f9 10          	sar    $0x10,%rcx
   140126018:	48 c1 f8 10          	sar    $0x10,%rax
   14012601c:	49 c1 fa 10          	sar    $0x10,%r10
   140126020:	48 0f af c1          	imul   %rcx,%rax
   140126024:	48 b9 00 00 00 00 00 	movabs $0x800000000000,%rcx
   14012602b:	80 00 00 
   14012602e:	4c 01 d0             	add    %r10,%rax
   140126031:	49 ba ff ff ff ff ff 	movabs $0xffffffffffff,%r10
   140126038:	ff 00 00 
   14012603b:	48 01 c1             	add    %rax,%rcx
   14012603e:	49 39 ca             	cmp    %rcx,%r10
   140126041:	0f 82 d6 52 00 00    	jb     14012b31d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904d>
   140126047:	4c 21 d0             	and    %r10,%rax
   14012604a:	48 09 d0             	or     %rdx,%rax
   14012604d:	49 89 04 f8          	mov    %rax,(%r8,%rdi,8)
   140126051:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126058:	0f 84 ff 59 00 00    	je     14012ba5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x978d>
   14012605e:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140126062:	48 8d 3d 37 70 29 00 	lea    0x297037(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126069:	48 83 c5 09          	add    $0x9,%rbp
   14012606d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126071:	ff e0                	jmp    *%rax
   140126073:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012607a:	00 fb ff 
   14012607d:	48 89 84 24 c8 03 00 	mov    %rax,0x3c8(%rsp)
   140126084:	00 
   140126085:	48 89 84 24 d0 03 00 	mov    %rax,0x3d0(%rsp)
   14012608c:	00 
   14012608d:	41 80 fc 02          	cmp    $0x2,%r12b
   140126091:	0f 85 06 86 00 00    	jne    14012e69d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3cd>
   140126097:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   14012609e:	00 
   14012609f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401260a5:	48 89 84 24 d0 03 00 	mov    %rax,0x3d0(%rsp)
   1401260ac:	00 
   1401260ad:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401260b4:	00 
   1401260b5:	48 89 84 24 c8 03 00 	mov    %rax,0x3c8(%rsp)
   1401260bc:	00 
   1401260bd:	48 8b 8c 24 c8 03 00 	mov    0x3c8(%rsp),%rcx
   1401260c4:	00 
   1401260c5:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401260cc:	00 ff ff 
   1401260cf:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401260d6:	00 f8 ff 
   1401260d9:	48 21 c1             	and    %rax,%rcx
   1401260dc:	4c 39 c1             	cmp    %r8,%rcx
   1401260df:	0f 84 c2 34 00 00    	je     1401295a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72d7>
   1401260e5:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401260ec:	00 ff ff 
   1401260ef:	c6 45 ff 35          	movb   $0x35,-0x1(%rbp)
   1401260f3:	48 8b 84 24 c8 03 00 	mov    0x3c8(%rsp),%rax
   1401260fa:	00 
   1401260fb:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126102:	00 f8 ff 
   140126105:	48 89 c1             	mov    %rax,%rcx
   140126108:	48 21 d1             	and    %rdx,%rcx
   14012610b:	4c 39 c1             	cmp    %r8,%rcx
   14012610e:	0f 84 9e 4c 00 00    	je     14012adb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ae2>
   140126114:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   14012611b:	00 fd ff 
   14012611e:	4c 39 c1             	cmp    %r8,%rcx
   140126121:	0f 84 7e 4c 00 00    	je     14012ada5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ad5>
   140126127:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   14012612e:	ff f7 ff 
   140126131:	48 39 c1             	cmp    %rax,%rcx
   140126134:	0f 83 64 57 00 00    	jae    14012b89e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ce>
   14012613a:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140126141:	00 fc ff 
   140126144:	4c 39 c8             	cmp    %r9,%rax
   140126147:	0f 84 51 57 00 00    	je     14012b89e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ce>
   14012614d:	48 8b 84 24 d0 03 00 	mov    0x3d0(%rsp),%rax
   140126154:	00 
   140126155:	4c 39 c8             	cmp    %r9,%rax
   140126158:	0f 84 40 57 00 00    	je     14012b89e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ce>
   14012615e:	48 39 c1             	cmp    %rax,%rcx
   140126161:	0f 83 37 57 00 00    	jae    14012b89e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ce>
   140126167:	48 21 c2             	and    %rax,%rdx
   14012616a:	4c 39 c2             	cmp    %r8,%rdx
   14012616d:	0f 84 62 90 00 00    	je     14012f1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf05>
   140126173:	48 8d 8c 24 c8 03 00 	lea    0x3c8(%rsp),%rcx
   14012617a:	00 
   14012617b:	c5 f8 77             	vzeroupper
   14012617e:	e8 0d 1c 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126183:	48 8d 8c 24 d0 03 00 	lea    0x3d0(%rsp),%rcx
   14012618a:	00 
   14012618b:	48 89 c7             	mov    %rax,%rdi
   14012618e:	e8 fd 1b 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126193:	48 39 c7             	cmp    %rax,%rdi
   140126196:	0f 9d c0             	setge  %al
   140126199:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401261a0:	00 fa ff 
   1401261a3:	0f b6 c0             	movzbl %al,%eax
   1401261a6:	48 01 d0             	add    %rdx,%rax
   1401261a9:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401261b0:	00 
   1401261b1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401261b8:	0f 84 1a 29 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   1401261be:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401261c2:	48 8d 3d d7 6e 29 00 	lea    0x296ed7(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401261c9:	48 83 c5 01          	add    $0x1,%rbp
   1401261cd:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401261d1:	ff e0                	jmp    *%rax
   1401261d3:	48 8d 45 02          	lea    0x2(%rbp),%rax
   1401261d7:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
   1401261db:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1401261e0:	49 8b 86 b8 00 00 00 	mov    0xb8(%r14),%rax
   1401261e7:	4c 8d 0c d0          	lea    (%rax,%rdx,8),%r9
   1401261eb:	45 84 e4             	test   %r12b,%r12b
   1401261ee:	0f 84 6f 80 00 00    	je     14012e263 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf93>
   1401261f4:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401261fb:	ff ff ff 
   1401261fe:	48 ba 00 00 00 00 02 	movabs $0xfffd000200000000,%rdx
   140126205:	00 fd ff 
   140126208:	48 23 84 24 c8 01 00 	and    0x1c8(%rsp),%rax
   14012620f:	00 
   140126210:	48 39 d0             	cmp    %rdx,%rax
   140126213:	0f 84 52 50 00 00    	je     14012b26b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f9b>
   140126219:	41 80 fc 01          	cmp    $0x1,%r12b
   14012621d:	0f 85 1a ae 00 00    	jne    14013103d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6d>
   140126223:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   14012622a:	00 
   14012622b:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126232:	00 ff ff 
   140126235:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   14012623c:	00 fd ff 
   14012623f:	48 21 c2             	and    %rax,%rdx
   140126242:	48 89 84 24 e0 03 00 	mov    %rax,0x3e0(%rsp)
   140126249:	00 
   14012624a:	48 39 ca             	cmp    %rcx,%rdx
   14012624d:	0f 84 b2 4d 00 00    	je     14012b005 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d35>
   140126253:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126259:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140126260:	00 f8 ff 
   140126263:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   14012626a:	00 
   14012626b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126272:	0f 84 f5 7e 00 00    	je     14012e16d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe9d>
   140126278:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   14012627c:	48 8d 3d 1d 6e 29 00 	lea    0x296e1d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126283:	48 83 c5 03          	add    $0x3,%rbp
   140126287:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012628b:	ff e0                	jmp    *%rax
   14012628d:	48 8d 45 02          	lea    0x2(%rbp),%rax
   140126291:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
   140126295:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012629a:	49 8b 86 b8 00 00 00 	mov    0xb8(%r14),%rax
   1401262a1:	4c 8d 0c d0          	lea    (%rax,%rdx,8),%r9
   1401262a5:	41 80 fc 02          	cmp    $0x2,%r12b
   1401262a9:	0f 85 4e 80 00 00    	jne    14012e2fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc02d>
   1401262af:	48 8b bc 24 d0 01 00 	mov    0x1d0(%rsp),%rdi
   1401262b6:	00 
   1401262b7:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401262be:	00 ff ff 
   1401262c1:	48 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%rdx
   1401262c8:	00 fd ff 
   1401262cb:	48 21 f8             	and    %rdi,%rax
   1401262ce:	48 39 d0             	cmp    %rdx,%rax
   1401262d1:	0f 84 15 45 00 00    	je     14012a7ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x851c>
   1401262d7:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401262de:	00 
   1401262df:	45 31 e4             	xor    %r12d,%r12d
   1401262e2:	48 89 84 24 f0 03 00 	mov    %rax,0x3f0(%rsp)
   1401262e9:	00 
   1401262ea:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401262f1:	0f 84 f2 4f 00 00    	je     14012b2e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9019>
   1401262f7:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401262fb:	48 8d 3d 9e 6d 29 00 	lea    0x296d9e(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126302:	48 83 c5 03          	add    $0x3,%rbp
   140126306:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012630a:	ff e0                	jmp    *%rax
   14012630c:	48 8d 45 03          	lea    0x3(%rbp),%rax
   140126310:	0f b6 7d 02          	movzbl 0x2(%rbp),%edi
   140126314:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140126319:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   14012631d:	48 c1 e0 04          	shl    $0x4,%rax
   140126321:	49 03 86 d0 00 00 00 	add    0xd0(%r14),%rax
   140126328:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012632d:	40 84 ff             	test   %dil,%dil
   140126330:	0f 85 72 28 00 00    	jne    140128ba8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68d8>
   140126336:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012633a:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   140126341:	00 
   140126342:	45 84 e4             	test   %r12b,%r12b
   140126345:	48 0f 44 c2          	cmove  %rdx,%rax
   140126349:	48 8b 10             	mov    (%rax),%rdx
   14012634c:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140126353:	ff ff ff 
   140126356:	48 b9 00 00 00 00 02 	movabs $0xfffd000200000000,%rcx
   14012635d:	00 fd ff 
   140126360:	48 21 d0             	and    %rdx,%rax
   140126363:	48 39 c8             	cmp    %rcx,%rax
   140126366:	0f 84 b5 6f 00 00    	je     14012d321 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb051>
   14012636c:	c5 f8 77             	vzeroupper
   14012636f:	41 80 fc 02          	cmp    $0x2,%r12b
   140126373:	0f 84 91 58 00 00    	je     14012bc0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x993a>
   140126379:	41 80 fc 01          	cmp    $0x1,%r12b
   14012637d:	0f 84 d6 65 00 00    	je     14012c959 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa689>
   140126383:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012638a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126391:	49 89 f0             	mov    %rsi,%r8
   140126394:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140126399:	49 29 d0             	sub    %rdx,%r8
   14012639c:	48 29 d0             	sub    %rdx,%rax
   14012639f:	4c 89 c6             	mov    %r8,%rsi
   1401263a2:	4c 29 f9             	sub    %r15,%rcx
   1401263a5:	48 c1 fe 03          	sar    $0x3,%rsi
   1401263a9:	48 89 8b 38 10 00 00 	mov    %rcx,0x1038(%rbx)
   1401263b0:	4c 39 c0             	cmp    %r8,%rax
   1401263b3:	0f 82 2a 5b 00 00    	jb     14012bee3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c13>
   1401263b9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401263be:	44 0f b6 cf          	movzbl %dil,%r9d
   1401263c2:	4c 89 f2             	mov    %r14,%rdx
   1401263c5:	48 89 d9             	mov    %rbx,%rcx
   1401263c8:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401263cf:	c5 f9 6f 05 a9 36 23 	vmovdqa 0x2336a9(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401263d6:	00 
   1401263d7:	48 89 b3 60 10 00 00 	mov    %rsi,0x1060(%rbx)
   1401263de:	44 0f b7 40 0a       	movzwl 0xa(%rax),%r8d
   1401263e3:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401263ea:	00 
   1401263eb:	e8 50 d0 fe ff       	call   140113440 <setun::VM::handle_invoke_method_direct(setun::Chunk const&, unsigned short, unsigned char)>
   1401263f0:	48 8b 83 38 10 00 00 	mov    0x1038(%rbx),%rax
   1401263f7:	48 8b 8b 60 10 00 00 	mov    0x1060(%rbx),%rcx
   1401263fe:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140126405:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012640c:	4c 01 f8             	add    %r15,%rax
   14012640f:	48 8d 34 ca          	lea    (%rdx,%rcx,8),%rsi
   140126413:	4d 85 ed             	test   %r13,%r13
   140126416:	74 0d                	je     140126425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4155>
   140126418:	4b 8d 4c ad fb       	lea    -0x5(%r13,%r13,4),%rcx
   14012641d:	4c 8b ac cb c8 10 00 	mov    0x10c8(%rbx,%rcx,8),%r13
   140126424:	00 
   140126425:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012642c:	0f 84 25 8a 00 00    	je     14012ee57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb87>
   140126432:	48 8b bb 50 10 00 00 	mov    0x1050(%rbx),%rdi
   140126439:	48 8d 68 01          	lea    0x1(%rax),%rbp
   14012643d:	0f b6 00             	movzbl (%rax),%eax
   140126440:	45 31 e4             	xor    %r12d,%r12d
   140126443:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   140126448:	48 8d 3d 51 6c 29 00 	lea    0x296c51(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012644f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126453:	ff e0                	jmp    *%rax
   140126455:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012645c:	41 80 fc 01          	cmp    $0x1,%r12b
   140126460:	0f 85 64 80 00 00    	jne    14012e4ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1fa>
   140126466:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   14012646d:	00 
   14012646e:	45 31 e4             	xor    %r12d,%r12d
   140126471:	4a 89 14 e8          	mov    %rdx,(%rax,%r13,8)
   140126475:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012647c:	0f 84 fe 26 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   140126482:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126486:	48 8d 3d 13 6c 29 00 	lea    0x296c13(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012648d:	48 83 c5 01          	add    $0x1,%rbp
   140126491:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126495:	ff e0                	jmp    *%rax
   140126497:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012649e:	41 80 fc 01          	cmp    $0x1,%r12b
   1401264a2:	0f 85 b7 89 00 00    	jne    14012ee5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb8f>
   1401264a8:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   1401264af:	00 
   1401264b0:	45 31 e4             	xor    %r12d,%r12d
   1401264b3:	4a 89 54 e8 08       	mov    %rdx,0x8(%rax,%r13,8)
   1401264b8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401264bf:	0f 84 bb 26 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   1401264c5:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401264c9:	48 8d 3d d0 6b 29 00 	lea    0x296bd0(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401264d0:	48 83 c5 01          	add    $0x1,%rbp
   1401264d4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401264d8:	ff e0                	jmp    *%rax
   1401264da:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401264e1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401264e5:	0f 85 18 87 00 00    	jne    14012ec03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc933>
   1401264eb:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   1401264f2:	00 
   1401264f3:	45 31 e4             	xor    %r12d,%r12d
   1401264f6:	4a 89 54 e8 10       	mov    %rdx,0x10(%rax,%r13,8)
   1401264fb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126502:	0f 84 78 26 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   140126508:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012650c:	48 8d 3d 8d 6b 29 00 	lea    0x296b8d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126513:	48 83 c5 01          	add    $0x1,%rbp
   140126517:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012651b:	ff e0                	jmp    *%rax
   14012651d:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140126524:	41 80 fc 01          	cmp    $0x1,%r12b
   140126528:	0f 85 92 79 00 00    	jne    14012dec0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbf0>
   14012652e:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
   140126535:	00 
   140126536:	45 31 e4             	xor    %r12d,%r12d
   140126539:	4a 89 54 e8 18       	mov    %rdx,0x18(%rax,%r13,8)
   14012653e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126545:	0f 84 35 26 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   14012654b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012654f:	48 8d 3d 4a 6b 29 00 	lea    0x296b4a(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126556:	48 83 c5 01          	add    $0x1,%rbp
   14012655a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012655e:	ff e0                	jmp    *%rax
   140126560:	45 84 e4             	test   %r12b,%r12b
   140126563:	0f 84 8c 26 00 00    	je     140128bf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6925>
   140126569:	41 80 fc 01          	cmp    $0x1,%r12b
   14012656d:	0f 84 fa 67 00 00    	je     14012cd6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa9d>
   140126573:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140126577:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   14012657c:	0f 83 db a0 00 00    	jae    14013065d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe38d>
   140126582:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126589:	00 
   14012658a:	48 89 06             	mov    %rax,(%rsi)
   14012658d:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126594:	00 
   140126595:	4c 89 c6             	mov    %r8,%rsi
   140126598:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   14012659f:	00 
   1401265a0:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401265a7:	4a 8b 44 e8 18       	mov    0x18(%rax,%r13,8),%rax
   1401265ac:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401265b3:	00 
   1401265b4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401265bb:	0f 84 bf 25 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   1401265c1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401265c5:	48 8d 3d d4 6a 29 00 	lea    0x296ad4(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401265cc:	48 83 c5 01          	add    $0x1,%rbp
   1401265d0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401265d4:	ff e0                	jmp    *%rax
   1401265d6:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401265da:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   1401265e1:	00 
   1401265e2:	45 84 e4             	test   %r12b,%r12b
   1401265e5:	48 0f 44 c2          	cmove  %rdx,%rax
   1401265e9:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401265f0:	48 8b 00             	mov    (%rax),%rax
   1401265f3:	4a 89 04 ea          	mov    %rax,(%rdx,%r13,8)
   1401265f7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401265fe:	0f 84 7c 25 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   140126604:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126608:	48 8d 3d 91 6a 29 00 	lea    0x296a91(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012660f:	48 83 c5 01          	add    $0x1,%rbp
   140126613:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126617:	ff e0                	jmp    *%rax
   140126619:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012661d:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   140126624:	00 
   140126625:	45 84 e4             	test   %r12b,%r12b
   140126628:	48 0f 44 c2          	cmove  %rdx,%rax
   14012662c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126633:	48 8b 00             	mov    (%rax),%rax
   140126636:	4a 89 44 ea 08       	mov    %rax,0x8(%rdx,%r13,8)
   14012663b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126642:	0f 84 38 25 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   140126648:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012664c:	48 8d 3d 4d 6a 29 00 	lea    0x296a4d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126653:	48 83 c5 01          	add    $0x1,%rbp
   140126657:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012665b:	ff e0                	jmp    *%rax
   14012665d:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140126661:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   140126668:	00 
   140126669:	45 84 e4             	test   %r12b,%r12b
   14012666c:	48 0f 44 c2          	cmove  %rdx,%rax
   140126670:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126677:	48 8b 00             	mov    (%rax),%rax
   14012667a:	4a 89 44 ea 10       	mov    %rax,0x10(%rdx,%r13,8)
   14012667f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126686:	0f 84 f4 24 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   14012668c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126690:	48 8d 3d 09 6a 29 00 	lea    0x296a09(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126697:	48 83 c5 01          	add    $0x1,%rbp
   14012669b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012669f:	ff e0                	jmp    *%rax
   1401266a1:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401266a5:	48 8d 84 24 c8 01 00 	lea    0x1c8(%rsp),%rax
   1401266ac:	00 
   1401266ad:	45 84 e4             	test   %r12b,%r12b
   1401266b0:	48 0f 44 c2          	cmove  %rdx,%rax
   1401266b4:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401266bb:	48 8b 00             	mov    (%rax),%rax
   1401266be:	4a 89 44 ea 18       	mov    %rax,0x18(%rdx,%r13,8)
   1401266c3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401266ca:	0f 84 b0 24 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   1401266d0:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401266d4:	48 8d 3d c5 69 29 00 	lea    0x2969c5(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401266db:	48 83 c5 01          	add    $0x1,%rbp
   1401266df:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401266e3:	ff e0                	jmp    *%rax
   1401266e5:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401266e9:	0f b7 7d 02          	movzwl 0x2(%rbp),%edi
   1401266ed:	4c 8d 4d 04          	lea    0x4(%rbp),%r9
   1401266f1:	4c 01 e8             	add    %r13,%rax
   1401266f4:	48 3b 83 68 52 01 00 	cmp    0x15268(%rbx),%rax
   1401266fb:	0f 83 03 83 00 00    	jae    14012ea04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc734>
   140126701:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126708:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   14012670f:	00 f8 ff 
   140126712:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
   140126716:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012671d:	00 ff ff 
   140126720:	49 8b 00             	mov    (%r8),%rax
   140126723:	48 21 c2             	and    %rax,%rdx
   140126726:	48 39 ca             	cmp    %rcx,%rdx
   140126729:	0f 85 ce 4c 00 00    	jne    14012b3fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x912d>
   14012672f:	48 c1 e0 10          	shl    $0x10,%rax
   140126733:	48 0f bf cf          	movswq %di,%rcx
   140126737:	49 ba 00 00 00 00 00 	movabs $0x800000000000,%r10
   14012673e:	80 00 00 
   140126741:	49 bb ff ff ff ff ff 	movabs $0xffffffffffff,%r11
   140126748:	ff 00 00 
   14012674b:	48 c1 f8 10          	sar    $0x10,%rax
   14012674f:	48 01 c8             	add    %rcx,%rax
   140126752:	49 01 c2             	add    %rax,%r10
   140126755:	4d 39 d3             	cmp    %r10,%r11
   140126758:	0f 82 a3 4c 00 00    	jb     14012b401 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9131>
   14012675e:	4c 21 d8             	and    %r11,%rax
   140126761:	48 09 d0             	or     %rdx,%rax
   140126764:	49 89 00             	mov    %rax,(%r8)
   140126767:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012676e:	0f 84 42 87 00 00    	je     14012eeb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbe6>
   140126774:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   140126778:	48 8d 3d 21 69 29 00 	lea    0x296921(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012677f:	48 83 c5 05          	add    $0x5,%rbp
   140126783:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126787:	ff e0                	jmp    *%rax
   140126789:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126790:	00 fb ff 
   140126793:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   14012679a:	00 
   14012679b:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   1401267a2:	00 
   1401267a3:	41 80 fc 02          	cmp    $0x2,%r12b
   1401267a7:	0f 85 20 7f 00 00    	jne    14012e6cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3fd>
   1401267ad:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401267b4:	00 
   1401267b5:	45 31 e4             	xor    %r12d,%r12d
   1401267b8:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   1401267bf:	00 
   1401267c0:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   1401267c7:	00 
   1401267c8:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   1401267cf:	00 
   1401267d0:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401267d7:	ff ff ff 
   1401267da:	48 ba 00 00 00 00 03 	movabs $0xfffd000300000000,%rdx
   1401267e1:	00 fd ff 
   1401267e4:	48 23 84 24 30 03 00 	and    0x330(%rsp),%rax
   1401267eb:	00 
   1401267ec:	48 39 d0             	cmp    %rdx,%rax
   1401267ef:	0f 84 9d 71 00 00    	je     14012d992 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6c2>
   1401267f5:	48 8b 94 24 30 03 00 	mov    0x330(%rsp),%rdx
   1401267fc:	00 
   1401267fd:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126804:	00 ff ff 
   140126807:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   14012680e:	00 fd ff 
   140126811:	48 21 d0             	and    %rdx,%rax
   140126814:	48 39 c8             	cmp    %rcx,%rax
   140126817:	0f 84 8c 3e 00 00    	je     14012a6a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83d9>
   14012681d:	45 84 e4             	test   %r12b,%r12b
   140126820:	0f 84 7d 52 00 00    	je     14012baa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97d3>
   140126826:	41 80 fc 01          	cmp    $0x1,%r12b
   14012682a:	0f 84 a2 6a 00 00    	je     14012d2d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb002>
   140126830:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140126834:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140126839:	0f 83 c2 d2 00 00    	jae    140133b01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11831>
   14012683f:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126846:	00 
   140126847:	48 89 06             	mov    %rax,(%rsi)
   14012684a:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126851:	00 
   140126852:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140126859:	00 
   14012685a:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140126861:	00 f8 ff 
   140126864:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   14012686b:	00 
   14012686c:	4c 89 c6             	mov    %r8,%rsi
   14012686f:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140126875:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012687c:	0f 84 fe 22 00 00    	je     140128b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68b0>
   140126882:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126886:	48 8d 3d 13 68 29 00 	lea    0x296813(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012688d:	48 83 c5 01          	add    $0x1,%rbp
   140126891:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126895:	ff e0                	jmp    *%rax
   140126897:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012689e:	00 fb ff 
   1401268a1:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   1401268a8:	00 
   1401268a9:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   1401268b0:	00 
   1401268b1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401268b5:	0f 85 08 78 00 00    	jne    14012e0c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdf3>
   1401268bb:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   1401268c2:	00 
   1401268c3:	45 31 e4             	xor    %r12d,%r12d
   1401268c6:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   1401268cd:	00 
   1401268ce:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   1401268d2:	48 83 ee 10          	sub    $0x10,%rsi
   1401268d6:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   1401268dd:	00 
   1401268de:	48 8b 3e             	mov    (%rsi),%rdi
   1401268e1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401268e8:	00 ff ff 
   1401268eb:	48 89 f9             	mov    %rdi,%rcx
   1401268ee:	48 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%rax
   1401268f5:	00 fd ff 
   1401268f8:	48 21 d1             	and    %rdx,%rcx
   1401268fb:	48 39 c1             	cmp    %rax,%rcx
   1401268fe:	0f 84 d3 31 00 00    	je     140129ad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7807>
   140126904:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012690b:	0f 84 b9 62 00 00    	je     14012cbca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8fa>
   140126911:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126915:	48 8d 3d 84 67 29 00 	lea    0x296784(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012691c:	48 83 c5 01          	add    $0x1,%rbp
   140126920:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126924:	ff e0                	jmp    *%rax
   140126926:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   14012692a:	0f b7 7d 04          	movzwl 0x4(%rbp),%edi
   14012692e:	0f b7 4d 06          	movzwl 0x6(%rbp),%ecx
   140126932:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126939:	66 89 44 24 40       	mov    %ax,0x40(%rsp)
   14012693e:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140126942:	66 89 7c 24 60       	mov    %di,0x60(%rsp)
   140126947:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   14012694b:	66 89 8c 24 80 00 00 	mov    %cx,0x80(%rsp)
   140126952:	00 
   140126953:	4c 01 e8             	add    %r13,%rax
   140126956:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   14012695a:	c5 f8 77             	vzeroupper
   14012695d:	e8 2e 14 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126962:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126969:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   140126970:	00 
   140126971:	0f b7 44 24 40       	movzwl 0x40(%rsp),%eax
   140126976:	4c 01 e8             	add    %r13,%rax
   140126979:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   14012697d:	e8 0e 14 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126982:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126989:	48 89 c5             	mov    %rax,%rbp
   14012698c:	0f b7 44 24 60       	movzwl 0x60(%rsp),%eax
   140126991:	4c 01 e8             	add    %r13,%rax
   140126994:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140126998:	e8 f3 13 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   14012699d:	48 85 c0             	test   %rax,%rax
   1401269a0:	0f 84 87 74 00 00    	je     14012de2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb5d>
   1401269a6:	0f 8e 4c 24 00 00    	jle    140128df8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b28>
   1401269ac:	48 39 ac 24 a0 00 00 	cmp    %rbp,0xa0(%rsp)
   1401269b3:	00 
   1401269b4:	0f 9c c2             	setl   %dl
   1401269b7:	48 0f bf 84 24 80 00 	movswq 0x80(%rsp),%rax
   1401269be:	00 00 
   1401269c0:	48 01 f8             	add    %rdi,%rax
   1401269c3:	84 d2                	test   %dl,%dl
   1401269c5:	48 0f 44 f8          	cmove  %rax,%rdi
   1401269c9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401269d0:	0f 84 9a 61 00 00    	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8a0>
   1401269d6:	0f b6 07             	movzbl (%rdi),%eax
   1401269d9:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
   1401269dd:	48 8d 3d bc 66 29 00 	lea    0x2966bc(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401269e4:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   1401269e7:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401269ee:	00 fb ff 
   1401269f1:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   1401269f8:	00 
   1401269f9:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140126a00:	00 
   140126a01:	41 80 fc 02          	cmp    $0x2,%r12b
   140126a05:	0f 85 f3 74 00 00    	jne    14012defe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc2e>
   140126a0b:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126a12:	00 
   140126a13:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126a19:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140126a20:	00 
   140126a21:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126a28:	00 
   140126a29:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140126a30:	00 
   140126a31:	48 8b 94 24 58 03 00 	mov    0x358(%rsp),%rdx
   140126a38:	00 
   140126a39:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126a40:	00 ff ff 
   140126a43:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140126a4a:	00 f8 ff 
   140126a4d:	49 89 d0             	mov    %rdx,%r8
   140126a50:	49 21 c0             	and    %rax,%r8
   140126a53:	49 39 c8             	cmp    %rcx,%r8
   140126a56:	0f 84 12 2f 00 00    	je     14012996e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x769e>
   140126a5c:	c6 45 ff 20          	movb   $0x20,-0x1(%rbp)
   140126a60:	48 8d 94 24 60 03 00 	lea    0x360(%rsp),%rdx
   140126a67:	00 
   140126a68:	48 8d 8c 24 58 03 00 	lea    0x358(%rsp),%rcx
   140126a6f:	00 
   140126a70:	c5 f8 77             	vzeroupper
   140126a73:	e8 48 f8 0e 00       	call   1402162c0 <setun::VMValue::add(setun::VMValue const&) const>
   140126a78:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140126a7f:	00 
   140126a80:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126a87:	0f 84 4b 20 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140126a8d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126a91:	48 8d 3d 08 66 29 00 	lea    0x296608(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126a98:	48 83 c5 01          	add    $0x1,%rbp
   140126a9c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126aa0:	ff e0                	jmp    *%rax
   140126aa2:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126aa9:	00 fb ff 
   140126aac:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140126ab3:	00 
   140126ab4:	48 89 84 24 70 03 00 	mov    %rax,0x370(%rsp)
   140126abb:	00 
   140126abc:	41 80 fc 02          	cmp    $0x2,%r12b
   140126ac0:	0f 85 24 7d 00 00    	jne    14012e7ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc51a>
   140126ac6:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126acd:	00 
   140126ace:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126ad4:	48 89 84 24 70 03 00 	mov    %rax,0x370(%rsp)
   140126adb:	00 
   140126adc:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126ae3:	00 
   140126ae4:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140126aeb:	00 
   140126aec:	48 8b 84 24 68 03 00 	mov    0x368(%rsp),%rax
   140126af3:	00 
   140126af4:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126afb:	00 ff ff 
   140126afe:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126b05:	00 f8 ff 
   140126b08:	48 89 c1             	mov    %rax,%rcx
   140126b0b:	48 21 d1             	and    %rdx,%rcx
   140126b0e:	4c 39 c1             	cmp    %r8,%rcx
   140126b11:	0f 84 46 2f 00 00    	je     140129a5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x778d>
   140126b17:	c6 45 ff 21          	movb   $0x21,-0x1(%rbp)
   140126b1b:	48 8d 94 24 70 03 00 	lea    0x370(%rsp),%rdx
   140126b22:	00 
   140126b23:	48 8d 8c 24 68 03 00 	lea    0x368(%rsp),%rcx
   140126b2a:	00 
   140126b2b:	c5 f8 77             	vzeroupper
   140126b2e:	e8 7d 0f 0f 00       	call   140217ab0 <setun::VMValue::sub(setun::VMValue const&) const>
   140126b33:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140126b3a:	00 
   140126b3b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126b42:	0f 84 90 1f 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140126b48:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126b4c:	48 8d 3d 4d 65 29 00 	lea    0x29654d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126b53:	48 83 c5 01          	add    $0x1,%rbp
   140126b57:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126b5b:	ff e0                	jmp    *%rax
   140126b5d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126b64:	00 fb ff 
   140126b67:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   140126b6e:	00 
   140126b6f:	48 89 84 24 80 03 00 	mov    %rax,0x380(%rsp)
   140126b76:	00 
   140126b77:	41 80 fc 02          	cmp    $0x2,%r12b
   140126b7b:	0f 85 b5 7a 00 00    	jne    14012e636 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc366>
   140126b81:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126b88:	00 
   140126b89:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126b8f:	48 89 84 24 80 03 00 	mov    %rax,0x380(%rsp)
   140126b96:	00 
   140126b97:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126b9e:	00 
   140126b9f:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   140126ba6:	00 
   140126ba7:	48 8b 94 24 78 03 00 	mov    0x378(%rsp),%rdx
   140126bae:	00 
   140126baf:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126bb6:	00 ff ff 
   140126bb9:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140126bc0:	00 f8 ff 
   140126bc3:	49 89 d0             	mov    %rdx,%r8
   140126bc6:	49 21 c0             	and    %rax,%r8
   140126bc9:	49 39 c8             	cmp    %rcx,%r8
   140126bcc:	0f 84 13 2e 00 00    	je     1401299e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7715>
   140126bd2:	c6 45 ff 22          	movb   $0x22,-0x1(%rbp)
   140126bd6:	48 8d 94 24 80 03 00 	lea    0x380(%rsp),%rdx
   140126bdd:	00 
   140126bde:	48 8d 8c 24 78 03 00 	lea    0x378(%rsp),%rcx
   140126be5:	00 
   140126be6:	c5 f8 77             	vzeroupper
   140126be9:	e8 42 06 0f 00       	call   140217230 <setun::VMValue::mul(setun::VMValue const&) const>
   140126bee:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140126bf5:	00 
   140126bf6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126bfd:	0f 84 d5 1e 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140126c03:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126c07:	48 8d 3d 92 64 29 00 	lea    0x296492(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126c0e:	48 83 c5 01          	add    $0x1,%rbp
   140126c12:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126c16:	ff e0                	jmp    *%rax
   140126c18:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126c1f:	00 fb ff 
   140126c22:	48 89 84 24 88 03 00 	mov    %rax,0x388(%rsp)
   140126c29:	00 
   140126c2a:	48 89 84 24 90 03 00 	mov    %rax,0x390(%rsp)
   140126c31:	00 
   140126c32:	41 80 fc 02          	cmp    $0x2,%r12b
   140126c36:	0f 85 4b 7b 00 00    	jne    14012e787 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4b7>
   140126c3c:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126c43:	00 
   140126c44:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126c4a:	48 89 84 24 90 03 00 	mov    %rax,0x390(%rsp)
   140126c51:	00 
   140126c52:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126c59:	00 
   140126c5a:	48 89 84 24 88 03 00 	mov    %rax,0x388(%rsp)
   140126c61:	00 
   140126c62:	48 8b 8c 24 88 03 00 	mov    0x388(%rsp),%rcx
   140126c69:	00 
   140126c6a:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126c71:	00 ff ff 
   140126c74:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126c7b:	00 f8 ff 
   140126c7e:	48 21 c1             	and    %rax,%rcx
   140126c81:	4c 39 c1             	cmp    %r8,%rcx
   140126c84:	0f 84 d1 26 00 00    	je     14012935b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x708b>
   140126c8a:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126c91:	00 ff ff 
   140126c94:	c6 45 ff 32          	movb   $0x32,-0x1(%rbp)
   140126c98:	48 8b 84 24 88 03 00 	mov    0x388(%rsp),%rax
   140126c9f:	00 
   140126ca0:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126ca7:	00 f8 ff 
   140126caa:	48 89 c1             	mov    %rax,%rcx
   140126cad:	48 21 d1             	and    %rdx,%rcx
   140126cb0:	4c 39 c1             	cmp    %r8,%rcx
   140126cb3:	0f 84 c0 3e 00 00    	je     14012ab79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88a9>
   140126cb9:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140126cc0:	00 fd ff 
   140126cc3:	4c 39 c1             	cmp    %r8,%rcx
   140126cc6:	0f 84 a0 3e 00 00    	je     14012ab6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x889c>
   140126ccc:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140126cd3:	ff f7 ff 
   140126cd6:	48 39 c1             	cmp    %rax,%rcx
   140126cd9:	0f 83 b5 4c 00 00    	jae    14012b994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c4>
   140126cdf:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140126ce6:	00 fc ff 
   140126ce9:	4c 39 c8             	cmp    %r9,%rax
   140126cec:	0f 84 a2 4c 00 00    	je     14012b994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c4>
   140126cf2:	48 8b 84 24 90 03 00 	mov    0x390(%rsp),%rax
   140126cf9:	00 
   140126cfa:	48 39 c1             	cmp    %rax,%rcx
   140126cfd:	0f 83 91 4c 00 00    	jae    14012b994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c4>
   140126d03:	4c 39 c8             	cmp    %r9,%rax
   140126d06:	0f 84 88 4c 00 00    	je     14012b994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c4>
   140126d0c:	48 21 c2             	and    %rax,%rdx
   140126d0f:	4c 39 c2             	cmp    %r8,%rdx
   140126d12:	0f 84 da 8d 00 00    	je     14012faf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd822>
   140126d18:	48 8d 8c 24 88 03 00 	lea    0x388(%rsp),%rcx
   140126d1f:	00 
   140126d20:	c5 f8 77             	vzeroupper
   140126d23:	e8 68 10 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126d28:	48 8d 8c 24 90 03 00 	lea    0x390(%rsp),%rcx
   140126d2f:	00 
   140126d30:	48 89 c7             	mov    %rax,%rdi
   140126d33:	e8 58 10 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126d38:	48 39 c7             	cmp    %rax,%rdi
   140126d3b:	0f 9c c0             	setl   %al
   140126d3e:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140126d45:	00 fa ff 
   140126d48:	0f b6 c0             	movzbl %al,%eax
   140126d4b:	48 01 d0             	add    %rdx,%rax
   140126d4e:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140126d55:	00 
   140126d56:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126d5d:	0f 84 75 1d 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140126d63:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126d67:	48 8d 3d 32 63 29 00 	lea    0x296332(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d6e:	48 83 c5 01          	add    $0x1,%rbp
   140126d72:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126d76:	ff e0                	jmp    *%rax
   140126d78:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126d7f:	00 fb ff 
   140126d82:	48 89 84 24 98 03 00 	mov    %rax,0x398(%rsp)
   140126d89:	00 
   140126d8a:	48 89 84 24 a0 03 00 	mov    %rax,0x3a0(%rsp)
   140126d91:	00 
   140126d92:	41 80 fc 02          	cmp    $0x2,%r12b
   140126d96:	0f 85 05 7c 00 00    	jne    14012e9a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6d1>
   140126d9c:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126da3:	00 
   140126da4:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126daa:	48 89 84 24 a0 03 00 	mov    %rax,0x3a0(%rsp)
   140126db1:	00 
   140126db2:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126db9:	00 
   140126dba:	48 89 84 24 98 03 00 	mov    %rax,0x398(%rsp)
   140126dc1:	00 
   140126dc2:	48 8b 8c 24 98 03 00 	mov    0x398(%rsp),%rcx
   140126dc9:	00 
   140126dca:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126dd1:	00 ff ff 
   140126dd4:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126ddb:	00 f8 ff 
   140126dde:	48 21 c1             	and    %rax,%rcx
   140126de1:	4c 39 c1             	cmp    %r8,%rcx
   140126de4:	0f 84 d6 26 00 00    	je     1401294c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71f0>
   140126dea:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126df1:	00 ff ff 
   140126df4:	c6 45 ff 33          	movb   $0x33,-0x1(%rbp)
   140126df8:	48 8b 84 24 98 03 00 	mov    0x398(%rsp),%rax
   140126dff:	00 
   140126e00:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126e07:	00 f8 ff 
   140126e0a:	48 89 c1             	mov    %rax,%rcx
   140126e0d:	48 21 d1             	and    %rdx,%rcx
   140126e10:	4c 39 c1             	cmp    %r8,%rcx
   140126e13:	0f 84 43 3c 00 00    	je     14012aa5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878c>
   140126e19:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140126e20:	00 fd ff 
   140126e23:	4c 39 c1             	cmp    %r8,%rcx
   140126e26:	0f 84 23 3c 00 00    	je     14012aa4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x877f>
   140126e2c:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140126e33:	ff f7 ff 
   140126e36:	48 39 c1             	cmp    %rax,%rcx
   140126e39:	0f 83 ce 4a 00 00    	jae    14012b90d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x963d>
   140126e3f:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140126e46:	00 fc ff 
   140126e49:	4c 39 c8             	cmp    %r9,%rax
   140126e4c:	0f 84 bb 4a 00 00    	je     14012b90d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x963d>
   140126e52:	48 8b 84 24 a0 03 00 	mov    0x3a0(%rsp),%rax
   140126e59:	00 
   140126e5a:	48 39 c1             	cmp    %rax,%rcx
   140126e5d:	0f 83 aa 4a 00 00    	jae    14012b90d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x963d>
   140126e63:	4c 39 c8             	cmp    %r9,%rax
   140126e66:	0f 84 a1 4a 00 00    	je     14012b90d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x963d>
   140126e6c:	48 21 c2             	and    %rax,%rdx
   140126e6f:	4c 39 c2             	cmp    %r8,%rdx
   140126e72:	0f 84 1b 84 00 00    	je     14012f293 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfc3>
   140126e78:	48 8d 8c 24 98 03 00 	lea    0x398(%rsp),%rcx
   140126e7f:	00 
   140126e80:	c5 f8 77             	vzeroupper
   140126e83:	e8 08 0f 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126e88:	48 8d 8c 24 a0 03 00 	lea    0x3a0(%rsp),%rcx
   140126e8f:	00 
   140126e90:	48 89 c7             	mov    %rax,%rdi
   140126e93:	e8 f8 0e 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126e98:	48 39 c7             	cmp    %rax,%rdi
   140126e9b:	0f 9e c0             	setle  %al
   140126e9e:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140126ea5:	00 fa ff 
   140126ea8:	0f b6 c0             	movzbl %al,%eax
   140126eab:	48 01 d0             	add    %rdx,%rax
   140126eae:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140126eb5:	00 
   140126eb6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126ebd:	0f 84 15 1c 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140126ec3:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126ec7:	48 8d 3d d2 61 29 00 	lea    0x2961d2(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ece:	48 83 c5 01          	add    $0x1,%rbp
   140126ed2:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126ed6:	ff e0                	jmp    *%rax
   140126ed8:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126edf:	00 fb ff 
   140126ee2:	48 89 84 24 a8 03 00 	mov    %rax,0x3a8(%rsp)
   140126ee9:	00 
   140126eea:	48 89 84 24 b0 03 00 	mov    %rax,0x3b0(%rsp)
   140126ef1:	00 
   140126ef2:	41 80 fc 02          	cmp    $0x2,%r12b
   140126ef6:	0f 85 69 75 00 00    	jne    14012e465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc195>
   140126efc:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140126f03:	00 
   140126f04:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126f0a:	48 89 84 24 b0 03 00 	mov    %rax,0x3b0(%rsp)
   140126f11:	00 
   140126f12:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   140126f19:	00 
   140126f1a:	48 89 84 24 a8 03 00 	mov    %rax,0x3a8(%rsp)
   140126f21:	00 
   140126f22:	48 8b 94 24 a8 03 00 	mov    0x3a8(%rsp),%rdx
   140126f29:	00 
   140126f2a:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126f31:	00 ff ff 
   140126f34:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126f3b:	00 f8 ff 
   140126f3e:	48 21 c2             	and    %rax,%rdx
   140126f41:	4c 39 c2             	cmp    %r8,%rdx
   140126f44:	0f 84 80 20 00 00    	je     140128fca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cfa>
   140126f4a:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126f51:	00 ff ff 
   140126f54:	c6 45 ff 30          	movb   $0x30,-0x1(%rbp)
   140126f58:	48 8b 84 24 a8 03 00 	mov    0x3a8(%rsp),%rax
   140126f5f:	00 
   140126f60:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140126f67:	00 f8 ff 
   140126f6a:	48 89 c1             	mov    %rax,%rcx
   140126f6d:	48 21 d1             	and    %rdx,%rcx
   140126f70:	4c 39 c1             	cmp    %r8,%rcx
   140126f73:	0f 84 1b 3d 00 00    	je     14012ac94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89c4>
   140126f79:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140126f80:	00 fd ff 
   140126f83:	4c 39 c1             	cmp    %r8,%rcx
   140126f86:	0f 84 fb 3c 00 00    	je     14012ac87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89b7>
   140126f8c:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140126f93:	ff f7 ff 
   140126f96:	48 39 c1             	cmp    %rax,%rcx
   140126f99:	0f 83 2c 49 00 00    	jae    14012b8cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fb>
   140126f9f:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140126fa6:	00 fc ff 
   140126fa9:	4c 39 c8             	cmp    %r9,%rax
   140126fac:	0f 84 19 49 00 00    	je     14012b8cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fb>
   140126fb2:	48 8b 84 24 b0 03 00 	mov    0x3b0(%rsp),%rax
   140126fb9:	00 
   140126fba:	4c 39 c8             	cmp    %r9,%rax
   140126fbd:	0f 84 08 49 00 00    	je     14012b8cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fb>
   140126fc3:	48 39 c1             	cmp    %rax,%rcx
   140126fc6:	0f 83 ff 48 00 00    	jae    14012b8cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fb>
   140126fcc:	48 21 c2             	and    %rax,%rdx
   140126fcf:	4c 39 c2             	cmp    %r8,%rdx
   140126fd2:	0f 84 67 8a 00 00    	je     14012fa3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd76f>
   140126fd8:	48 8d 8c 24 a8 03 00 	lea    0x3a8(%rsp),%rcx
   140126fdf:	00 
   140126fe0:	c5 f8 77             	vzeroupper
   140126fe3:	e8 a8 0d 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126fe8:	48 8d 8c 24 b0 03 00 	lea    0x3b0(%rsp),%rcx
   140126fef:	00 
   140126ff0:	48 89 c7             	mov    %rax,%rdi
   140126ff3:	e8 98 0d 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   140126ff8:	48 39 c7             	cmp    %rax,%rdi
   140126ffb:	40 0f 94 c7          	sete   %dil
   140126fff:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140127006:	00 fa ff 
   140127009:	40 0f b6 c7          	movzbl %dil,%eax
   14012700d:	48 01 d0             	add    %rdx,%rax
   140127010:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140127017:	00 
   140127018:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012701f:	0f 84 b3 1a 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140127025:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140127029:	48 8d 3d 70 60 29 00 	lea    0x296070(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127030:	48 83 c5 01          	add    $0x1,%rbp
   140127034:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127038:	ff e0                	jmp    *%rax
   14012703a:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140127041:	00 fb ff 
   140127044:	48 89 84 24 b8 03 00 	mov    %rax,0x3b8(%rsp)
   14012704b:	00 
   14012704c:	48 89 84 24 c0 03 00 	mov    %rax,0x3c0(%rsp)
   140127053:	00 
   140127054:	41 80 fc 02          	cmp    $0x2,%r12b
   140127058:	0f 85 7f 6b 00 00    	jne    14012dbdd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb90d>
   14012705e:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
   140127065:	00 
   140127066:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012706c:	48 89 84 24 c0 03 00 	mov    %rax,0x3c0(%rsp)
   140127073:	00 
   140127074:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
   14012707b:	00 
   14012707c:	48 89 84 24 b8 03 00 	mov    %rax,0x3b8(%rsp)
   140127083:	00 
   140127084:	48 8b 8c 24 b8 03 00 	mov    0x3b8(%rsp),%rcx
   14012708b:	00 
   14012708c:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140127093:	00 ff ff 
   140127096:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012709d:	00 f8 ff 
   1401270a0:	48 21 c1             	and    %rax,%rcx
   1401270a3:	4c 39 c1             	cmp    %r8,%rcx
   1401270a6:	0f 84 79 1e 00 00    	je     140128f25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c55>
   1401270ac:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401270b3:	00 ff ff 
   1401270b6:	c6 45 ff 34          	movb   $0x34,-0x1(%rbp)
   1401270ba:	48 8b 84 24 b8 03 00 	mov    0x3b8(%rsp),%rax
   1401270c1:	00 
   1401270c2:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401270c9:	00 f8 ff 
   1401270cc:	48 89 c1             	mov    %rax,%rcx
   1401270cf:	48 21 d1             	and    %rdx,%rcx
   1401270d2:	4c 39 c1             	cmp    %r8,%rcx
   1401270d5:	0f 84 f4 3d 00 00    	je     14012aecf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bff>
   1401270db:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   1401270e2:	00 fd ff 
   1401270e5:	4c 39 c1             	cmp    %r8,%rcx
   1401270e8:	0f 84 d4 3d 00 00    	je     14012aec2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bf2>
   1401270ee:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   1401270f5:	ff f7 ff 
   1401270f8:	48 39 c1             	cmp    %rax,%rcx
   1401270fb:	0f 83 70 47 00 00    	jae    14012b871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a1>
   140127101:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140127108:	00 fc ff 
   14012710b:	4c 39 c8             	cmp    %r9,%rax
   14012710e:	0f 84 5d 47 00 00    	je     14012b871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a1>
   140127114:	48 8b 84 24 c0 03 00 	mov    0x3c0(%rsp),%rax
   14012711b:	00 
   14012711c:	48 39 c1             	cmp    %rax,%rcx
   14012711f:	0f 83 4c 47 00 00    	jae    14012b871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a1>
   140127125:	4c 39 c8             	cmp    %r9,%rax
   140127128:	0f 84 43 47 00 00    	je     14012b871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a1>
   14012712e:	48 21 c2             	and    %rax,%rdx
   140127131:	4c 39 c2             	cmp    %r8,%rdx
   140127134:	0f 84 74 8a 00 00    	je     14012fbae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8de>
   14012713a:	48 8d 8c 24 b8 03 00 	lea    0x3b8(%rsp),%rcx
   140127141:	00 
   140127142:	c5 f8 77             	vzeroupper
   140127145:	e8 46 0c 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   14012714a:	48 8d 8c 24 c0 03 00 	lea    0x3c0(%rsp),%rcx
   140127151:	00 
   140127152:	48 89 c7             	mov    %rax,%rdi
   140127155:	e8 36 0c 0f 00       	call   140217d90 <setun::VMValue::as_int() const>
   14012715a:	48 39 c7             	cmp    %rax,%rdi
   14012715d:	0f 9f c0             	setg   %al
   140127160:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140127167:	00 fa ff 
   14012716a:	0f b6 c0             	movzbl %al,%eax
   14012716d:	48 01 d0             	add    %rdx,%rax
   140127170:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140127177:	00 
   140127178:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012717f:	0f 84 53 19 00 00    	je     140128ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6808>
   140127185:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140127189:	48 8d 3d 10 5f 29 00 	lea    0x295f10(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127190:	48 83 c5 01          	add    $0x1,%rbp
   140127194:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127198:	ff e0                	jmp    *%rax
   14012719a:	41 80 fc 02          	cmp    $0x2,%r12b
   14012719e:	0f 84 5a 31 00 00    	je     14012a2fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x802e>
   1401271a4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401271a8:	0f 84 5c 50 00 00    	je     14012c20a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f3a>
   1401271ae:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401271b5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401271bc:	c5 f8 77             	vzeroupper
   1401271bf:	48 29 d6             	sub    %rdx,%rsi
   1401271c2:	4c 29 fd             	sub    %r15,%rbp
   1401271c5:	48 29 d0             	sub    %rdx,%rax
   1401271c8:	48 89 f7             	mov    %rsi,%rdi
   1401271cb:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401271d2:	48 c1 ff 03          	sar    $0x3,%rdi
   1401271d6:	48 39 f0             	cmp    %rsi,%rax
   1401271d9:	0f 82 16 4a 00 00    	jb     14012bbf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9925>
   1401271df:	c5 f9 6f 05 99 28 23 	vmovdqa 0x232899(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401271e6:	00 
   1401271e7:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401271ee:	4c 89 f2             	mov    %r14,%rdx
   1401271f1:	48 89 d9             	mov    %rbx,%rcx
   1401271f4:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401271fb:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127202:	00 
   140127203:	e8 f8 54 fe ff       	call   14010c700 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140127208:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012720f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127216:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012721d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127224:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127228:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012722f:	4c 01 f9             	add    %r15,%rcx
   140127232:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127237:	4d 85 ed             	test   %r13,%r13
   14012723a:	74 0d                	je     140127249 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f79>
   14012723c:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127241:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127248:	00 
   140127249:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127250:	0f 84 1a 42 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127256:	0f b6 01             	movzbl (%rcx),%eax
   140127259:	48 8d 3d 40 5e 29 00 	lea    0x295e40(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127260:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127264:	45 31 e4             	xor    %r12d,%r12d
   140127267:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012726b:	ff e0                	jmp    *%rax
   14012726d:	41 80 fc 02          	cmp    $0x2,%r12b
   140127271:	0f 84 10 2c 00 00    	je     140129e87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bb7>
   140127277:	41 80 fc 01          	cmp    $0x1,%r12b
   14012727b:	0f 84 59 55 00 00    	je     14012c7da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa50a>
   140127281:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127288:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012728f:	c5 f8 77             	vzeroupper
   140127292:	48 29 d6             	sub    %rdx,%rsi
   140127295:	4c 29 fd             	sub    %r15,%rbp
   140127298:	48 29 d0             	sub    %rdx,%rax
   14012729b:	48 89 f7             	mov    %rsi,%rdi
   14012729e:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401272a5:	48 c1 ff 03          	sar    $0x3,%rdi
   1401272a9:	48 39 f0             	cmp    %rsi,%rax
   1401272ac:	0f 82 da 48 00 00    	jb     14012bb8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98bc>
   1401272b2:	c5 f9 6f 05 c6 27 23 	vmovdqa 0x2327c6(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401272b9:	00 
   1401272ba:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401272c1:	4c 89 f2             	mov    %r14,%rdx
   1401272c4:	48 89 d9             	mov    %rbx,%rcx
   1401272c7:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401272ce:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401272d5:	00 
   1401272d6:	e8 05 a1 fd ff       	call   1401013e0 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   1401272db:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401272e2:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401272e9:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401272f0:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401272f7:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401272fb:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127302:	4c 01 f9             	add    %r15,%rcx
   140127305:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012730a:	4d 85 ed             	test   %r13,%r13
   14012730d:	74 0d                	je     14012731c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x504c>
   14012730f:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127314:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012731b:	00 
   14012731c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127323:	0f 84 47 41 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127329:	0f b6 01             	movzbl (%rcx),%eax
   14012732c:	48 8d 3d 6d 5d 29 00 	lea    0x295d6d(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127333:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127337:	45 31 e4             	xor    %r12d,%r12d
   14012733a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012733e:	ff e0                	jmp    *%rax
   140127340:	41 80 fc 02          	cmp    $0x2,%r12b
   140127344:	0f 84 7c 2b 00 00    	je     140129ec6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bf6>
   14012734a:	41 80 fc 01          	cmp    $0x1,%r12b
   14012734e:	0f 84 b7 4d 00 00    	je     14012c10b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e3b>
   140127354:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012735b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127362:	c5 f8 77             	vzeroupper
   140127365:	48 29 d6             	sub    %rdx,%rsi
   140127368:	4c 29 fd             	sub    %r15,%rbp
   14012736b:	48 29 d0             	sub    %rdx,%rax
   14012736e:	48 89 f7             	mov    %rsi,%rdi
   140127371:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127378:	48 c1 ff 03          	sar    $0x3,%rdi
   14012737c:	48 39 f0             	cmp    %rsi,%rax
   14012737f:	0f 82 0e 4a 00 00    	jb     14012bd93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ac3>
   140127385:	c5 f9 6f 05 f3 26 23 	vmovdqa 0x2326f3(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012738c:	00 
   14012738d:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127394:	4c 89 f2             	mov    %r14,%rdx
   140127397:	48 89 d9             	mov    %rbx,%rcx
   14012739a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401273a1:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401273a8:	00 
   1401273a9:	e8 d2 9c fd ff       	call   140101080 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   1401273ae:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401273b5:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401273bc:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401273c3:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401273ca:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401273ce:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401273d5:	4c 01 f9             	add    %r15,%rcx
   1401273d8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401273dd:	4d 85 ed             	test   %r13,%r13
   1401273e0:	74 0d                	je     1401273ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x511f>
   1401273e2:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401273e7:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401273ee:	00 
   1401273ef:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401273f6:	0f 84 74 40 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401273fc:	0f b6 01             	movzbl (%rcx),%eax
   1401273ff:	48 8d 3d 9a 5c 29 00 	lea    0x295c9a(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127406:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012740a:	45 31 e4             	xor    %r12d,%r12d
   14012740d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127411:	ff e0                	jmp    *%rax
   140127413:	41 80 fc 02          	cmp    $0x2,%r12b
   140127417:	0f 84 7d 30 00 00    	je     14012a49a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81ca>
   14012741d:	41 80 fc 01          	cmp    $0x1,%r12b
   140127421:	0f 84 81 52 00 00    	je     14012c6a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3d8>
   140127427:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012742e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127435:	c5 f8 77             	vzeroupper
   140127438:	48 29 d6             	sub    %rdx,%rsi
   14012743b:	4c 29 fd             	sub    %r15,%rbp
   14012743e:	48 29 d0             	sub    %rdx,%rax
   140127441:	48 89 f7             	mov    %rsi,%rdi
   140127444:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012744b:	48 c1 ff 03          	sar    $0x3,%rdi
   14012744f:	48 39 f0             	cmp    %rsi,%rax
   140127452:	0f 82 d2 48 00 00    	jb     14012bd2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a5a>
   140127458:	c5 f9 6f 05 20 26 23 	vmovdqa 0x232620(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012745f:	00 
   140127460:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127467:	4c 89 f2             	mov    %r14,%rdx
   14012746a:	48 89 d9             	mov    %rbx,%rcx
   14012746d:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127474:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012747b:	00 
   14012747c:	e8 8f e2 fd ff       	call   140105710 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   140127481:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127488:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012748f:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127496:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012749d:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401274a1:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401274a8:	4c 01 f9             	add    %r15,%rcx
   1401274ab:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401274b0:	4d 85 ed             	test   %r13,%r13
   1401274b3:	74 0d                	je     1401274c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51f2>
   1401274b5:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401274ba:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401274c1:	00 
   1401274c2:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401274c9:	0f 84 a1 3f 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401274cf:	0f b6 01             	movzbl (%rcx),%eax
   1401274d2:	48 8d 3d c7 5b 29 00 	lea    0x295bc7(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274d9:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401274dd:	45 31 e4             	xor    %r12d,%r12d
   1401274e0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401274e4:	ff e0                	jmp    *%rax
   1401274e6:	41 80 fc 02          	cmp    $0x2,%r12b
   1401274ea:	0f 84 8c 2e 00 00    	je     14012a37c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80ac>
   1401274f0:	41 80 fc 01          	cmp    $0x1,%r12b
   1401274f4:	0f 84 c1 50 00 00    	je     14012c5bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2eb>
   1401274fa:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127501:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127508:	c5 f8 77             	vzeroupper
   14012750b:	48 29 d6             	sub    %rdx,%rsi
   14012750e:	4c 29 fd             	sub    %r15,%rbp
   140127511:	48 29 d0             	sub    %rdx,%rax
   140127514:	48 89 f7             	mov    %rsi,%rdi
   140127517:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012751e:	48 c1 ff 03          	sar    $0x3,%rdi
   140127522:	48 39 f0             	cmp    %rsi,%rax
   140127525:	0f 82 53 48 00 00    	jb     14012bd7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aae>
   14012752b:	c5 f9 6f 05 4d 25 23 	vmovdqa 0x23254d(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127532:	00 
   140127533:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012753a:	4c 89 f2             	mov    %r14,%rdx
   14012753d:	48 89 d9             	mov    %rbx,%rcx
   140127540:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127547:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012754e:	00 
   14012754f:	e8 8c 40 fe ff       	call   14010b5e0 <setun::VM::handle_println(setun::Chunk const&)>
   140127554:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012755b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127562:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127569:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127570:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127574:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012757b:	4c 01 f9             	add    %r15,%rcx
   14012757e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127583:	4d 85 ed             	test   %r13,%r13
   140127586:	74 0d                	je     140127595 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52c5>
   140127588:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012758d:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127594:	00 
   140127595:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012759c:	0f 84 ce 3e 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401275a2:	0f b6 01             	movzbl (%rcx),%eax
   1401275a5:	48 8d 3d f4 5a 29 00 	lea    0x295af4(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401275ac:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401275b0:	45 31 e4             	xor    %r12d,%r12d
   1401275b3:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401275b7:	ff e0                	jmp    *%rax
   1401275b9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401275bd:	0f 84 9c 1c 00 00    	je     14012925f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f8f>
   1401275c3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401275c7:	0f 84 b3 4a 00 00    	je     14012c080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9db0>
   1401275cd:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401275d4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401275db:	c5 f8 77             	vzeroupper
   1401275de:	48 29 d6             	sub    %rdx,%rsi
   1401275e1:	4c 29 fd             	sub    %r15,%rbp
   1401275e4:	48 29 d0             	sub    %rdx,%rax
   1401275e7:	48 89 f7             	mov    %rsi,%rdi
   1401275ea:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401275f1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401275f5:	48 39 f0             	cmp    %rsi,%rax
   1401275f8:	0f 82 84 46 00 00    	jb     14012bc82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99b2>
   1401275fe:	c5 f9 6f 05 7a 24 23 	vmovdqa 0x23247a(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127605:	00 
   140127606:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012760d:	4c 89 f2             	mov    %r14,%rdx
   140127610:	48 89 d9             	mov    %rbx,%rcx
   140127613:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012761a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127621:	00 
   140127622:	e8 69 47 fe ff       	call   14010bd90 <setun::VM::handle_trace(setun::Chunk const&)>
   140127627:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012762e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127635:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012763c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127643:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127647:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012764e:	4c 01 f9             	add    %r15,%rcx
   140127651:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127656:	4d 85 ed             	test   %r13,%r13
   140127659:	74 0d                	je     140127668 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5398>
   14012765b:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127660:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127667:	00 
   140127668:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012766f:	0f 84 fb 3d 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127675:	0f b6 01             	movzbl (%rcx),%eax
   140127678:	48 8d 3d 21 5a 29 00 	lea    0x295a21(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012767f:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127683:	45 31 e4             	xor    %r12d,%r12d
   140127686:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012768a:	ff e0                	jmp    *%rax
   14012768c:	41 80 fc 02          	cmp    $0x2,%r12b
   140127690:	0f 84 ac 1d 00 00    	je     140129442 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7172>
   140127696:	41 80 fc 01          	cmp    $0x1,%r12b
   14012769a:	0f 84 ad 49 00 00    	je     14012c04d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d7d>
   1401276a0:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401276a7:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401276ae:	c5 f8 77             	vzeroupper
   1401276b1:	48 29 d6             	sub    %rdx,%rsi
   1401276b4:	4c 29 fd             	sub    %r15,%rbp
   1401276b7:	48 29 d0             	sub    %rdx,%rax
   1401276ba:	48 89 f7             	mov    %rsi,%rdi
   1401276bd:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401276c4:	48 c1 ff 03          	sar    $0x3,%rdi
   1401276c8:	48 39 f0             	cmp    %rsi,%rax
   1401276cb:	0f 82 d0 44 00 00    	jb     14012bba1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98d1>
   1401276d1:	c5 f9 6f 05 a7 23 23 	vmovdqa 0x2323a7(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401276d8:	00 
   1401276d9:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401276e0:	4c 89 f2             	mov    %r14,%rdx
   1401276e3:	48 89 d9             	mov    %rbx,%rcx
   1401276e6:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401276ed:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401276f4:	00 
   1401276f5:	e8 16 85 fe ff       	call   14010fc10 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   1401276fa:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127701:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127708:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012770f:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127716:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012771a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127721:	4c 01 f9             	add    %r15,%rcx
   140127724:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127729:	4d 85 ed             	test   %r13,%r13
   14012772c:	74 0d                	je     14012773b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x546b>
   14012772e:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127733:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012773a:	00 
   14012773b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127742:	0f 84 28 3d 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127748:	0f b6 01             	movzbl (%rcx),%eax
   14012774b:	48 8d 3d 4e 59 29 00 	lea    0x29594e(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127752:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127756:	45 31 e4             	xor    %r12d,%r12d
   140127759:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012775d:	ff e0                	jmp    *%rax
   14012775f:	41 80 fc 02          	cmp    $0x2,%r12b
   140127763:	0f 84 af 2d 00 00    	je     14012a518 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8248>
   140127769:	41 80 fc 01          	cmp    $0x1,%r12b
   14012776d:	0f 84 01 50 00 00    	je     14012c774 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4a4>
   140127773:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012777a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127781:	c5 f8 77             	vzeroupper
   140127784:	48 29 d6             	sub    %rdx,%rsi
   140127787:	4c 29 fd             	sub    %r15,%rbp
   14012778a:	48 29 d0             	sub    %rdx,%rax
   14012778d:	48 89 f7             	mov    %rsi,%rdi
   140127790:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127797:	48 c1 ff 03          	sar    $0x3,%rdi
   14012779b:	48 39 f0             	cmp    %rsi,%rax
   14012779e:	0f 82 12 44 00 00    	jb     14012bbb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98e6>
   1401277a4:	c5 f9 6f 05 d4 22 23 	vmovdqa 0x2322d4(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   1401277ab:	00 
   1401277ac:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401277b3:	4c 89 f2             	mov    %r14,%rdx
   1401277b6:	48 89 d9             	mov    %rbx,%rcx
   1401277b9:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401277c0:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401277c7:	00 
   1401277c8:	e8 c3 b0 fd ff       	call   140102890 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   1401277cd:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401277d4:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401277db:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401277e2:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401277e9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401277ed:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401277f4:	4c 01 f9             	add    %r15,%rcx
   1401277f7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401277fc:	4d 85 ed             	test   %r13,%r13
   1401277ff:	74 0d                	je     14012780e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x553e>
   140127801:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127806:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012780d:	00 
   14012780e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127815:	0f 84 55 3c 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   14012781b:	0f b6 01             	movzbl (%rcx),%eax
   14012781e:	48 8d 3d 7b 58 29 00 	lea    0x29587b(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127825:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127829:	45 31 e4             	xor    %r12d,%r12d
   14012782c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127830:	ff e0                	jmp    *%rax
   140127832:	41 80 fc 02          	cmp    $0x2,%r12b
   140127836:	0f 84 c7 1b 00 00    	je     140129403 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7133>
   14012783c:	41 80 fc 01          	cmp    $0x1,%r12b
   140127840:	0f 84 2b 49 00 00    	je     14012c171 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ea1>
   140127846:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012784d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127854:	c5 f8 77             	vzeroupper
   140127857:	48 29 d6             	sub    %rdx,%rsi
   14012785a:	4c 29 fd             	sub    %r15,%rbp
   14012785d:	48 29 d0             	sub    %rdx,%rax
   140127860:	48 89 f7             	mov    %rsi,%rdi
   140127863:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012786a:	48 c1 ff 03          	sar    $0x3,%rdi
   14012786e:	48 39 f0             	cmp    %rsi,%rax
   140127871:	0f 82 20 44 00 00    	jb     14012bc97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99c7>
   140127877:	c5 f9 6f 05 01 22 23 	vmovdqa 0x232201(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   14012787e:	00 
   14012787f:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127886:	4c 89 f2             	mov    %r14,%rdx
   140127889:	48 89 d9             	mov    %rbx,%rcx
   14012788c:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127893:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012789a:	00 
   14012789b:	e8 d0 9b fd ff       	call   140101470 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   1401278a0:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401278a7:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401278ae:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401278b5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401278bc:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401278c0:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401278c7:	4c 01 f9             	add    %r15,%rcx
   1401278ca:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401278cf:	4d 85 ed             	test   %r13,%r13
   1401278d2:	74 0d                	je     1401278e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5611>
   1401278d4:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401278d9:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401278e0:	00 
   1401278e1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401278e8:	0f 84 82 3b 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401278ee:	0f b6 01             	movzbl (%rcx),%eax
   1401278f1:	48 8d 3d a8 57 29 00 	lea    0x2957a8(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401278f8:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401278fc:	45 31 e4             	xor    %r12d,%r12d
   1401278ff:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127903:	ff e0                	jmp    *%rax
   140127905:	41 80 fc 02          	cmp    $0x2,%r12b
   140127909:	0f 84 ce 19 00 00    	je     1401292dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x700d>
   14012790f:	41 80 fc 01          	cmp    $0x1,%r12b
   140127913:	0f 84 24 49 00 00    	je     14012c23d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6d>
   140127919:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127920:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127927:	c5 f8 77             	vzeroupper
   14012792a:	48 29 d6             	sub    %rdx,%rsi
   14012792d:	4c 29 fd             	sub    %r15,%rbp
   140127930:	48 29 d0             	sub    %rdx,%rax
   140127933:	48 89 f7             	mov    %rsi,%rdi
   140127936:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012793d:	48 c1 ff 03          	sar    $0x3,%rdi
   140127941:	48 39 f0             	cmp    %rsi,%rax
   140127944:	0f 82 a1 43 00 00    	jb     14012bceb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a1b>
   14012794a:	c5 f9 6f 05 2e 21 23 	vmovdqa 0x23212e(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127951:	00 
   140127952:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127959:	4c 89 f2             	mov    %r14,%rdx
   14012795c:	48 89 d9             	mov    %rbx,%rcx
   14012795f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127966:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012796d:	00 
   14012796e:	e8 bd 75 fd ff       	call   1400fef30 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   140127973:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012797a:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127981:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127988:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012798f:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127993:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012799a:	4c 01 f9             	add    %r15,%rcx
   14012799d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401279a2:	4d 85 ed             	test   %r13,%r13
   1401279a5:	74 0d                	je     1401279b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x56e4>
   1401279a7:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401279ac:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401279b3:	00 
   1401279b4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401279bb:	0f 84 af 3a 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   1401279c1:	0f b6 01             	movzbl (%rcx),%eax
   1401279c4:	48 8d 3d d5 56 29 00 	lea    0x2956d5(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401279cb:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401279cf:	45 31 e4             	xor    %r12d,%r12d
   1401279d2:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401279d6:	ff e0                	jmp    *%rax
   1401279d8:	41 80 fc 02          	cmp    $0x2,%r12b
   1401279dc:	0f 84 2e 1c 00 00    	je     140129610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7340>
   1401279e2:	41 80 fc 01          	cmp    $0x1,%r12b
   1401279e6:	0f 84 ef 4c 00 00    	je     14012c6db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa40b>
   1401279ec:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401279f3:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401279fa:	c5 f8 77             	vzeroupper
   1401279fd:	48 29 d6             	sub    %rdx,%rsi
   140127a00:	4c 29 fd             	sub    %r15,%rbp
   140127a03:	48 29 d0             	sub    %rdx,%rax
   140127a06:	48 89 f7             	mov    %rsi,%rdi
   140127a09:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127a10:	48 c1 ff 03          	sar    $0x3,%rdi
   140127a14:	48 39 f0             	cmp    %rsi,%rax
   140127a17:	0f 82 8f 42 00 00    	jb     14012bcac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99dc>
   140127a1d:	c5 f9 6f 05 5b 20 23 	vmovdqa 0x23205b(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127a24:	00 
   140127a25:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127a2c:	4c 89 f2             	mov    %r14,%rdx
   140127a2f:	48 89 d9             	mov    %rbx,%rcx
   140127a32:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127a39:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127a40:	00 
   140127a41:	e8 aa b1 fd ff       	call   140102bf0 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   140127a46:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127a4d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127a54:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127a5b:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127a62:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127a66:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127a6d:	4c 01 f9             	add    %r15,%rcx
   140127a70:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127a75:	4d 85 ed             	test   %r13,%r13
   140127a78:	74 0d                	je     140127a87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57b7>
   140127a7a:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127a7f:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127a86:	00 
   140127a87:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127a8e:	0f 84 dc 39 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127a94:	0f b6 01             	movzbl (%rcx),%eax
   140127a97:	48 8d 3d 02 56 29 00 	lea    0x295602(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a9e:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127aa2:	45 31 e4             	xor    %r12d,%r12d
   140127aa5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127aa9:	ff e0                	jmp    *%rax
   140127aab:	41 80 fc 02          	cmp    $0x2,%r12b
   140127aaf:	0f 84 b3 1a 00 00    	je     140129568 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7298>
   140127ab5:	41 80 fc 01          	cmp    $0x1,%r12b
   140127ab9:	0f 84 e5 46 00 00    	je     14012c1a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed4>
   140127abf:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127ac6:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127acd:	c5 f8 77             	vzeroupper
   140127ad0:	48 29 d6             	sub    %rdx,%rsi
   140127ad3:	4c 29 fd             	sub    %r15,%rbp
   140127ad6:	48 29 d0             	sub    %rdx,%rax
   140127ad9:	48 89 f7             	mov    %rsi,%rdi
   140127adc:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127ae3:	48 c1 ff 03          	sar    $0x3,%rdi
   140127ae7:	48 39 f0             	cmp    %rsi,%rax
   140127aea:	0f 82 d1 41 00 00    	jb     14012bcc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99f1>
   140127af0:	c5 f9 6f 05 88 1f 23 	vmovdqa 0x231f88(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127af7:	00 
   140127af8:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127aff:	4c 89 f2             	mov    %r14,%rdx
   140127b02:	48 89 d9             	mov    %rbx,%rcx
   140127b05:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127b0c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127b13:	00 
   140127b14:	e8 17 77 fd ff       	call   1400ff230 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140127b19:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127b20:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127b27:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127b2e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127b35:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127b39:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127b40:	4c 01 f9             	add    %r15,%rcx
   140127b43:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127b48:	4d 85 ed             	test   %r13,%r13
   140127b4b:	74 0d                	je     140127b5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x588a>
   140127b4d:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127b52:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127b59:	00 
   140127b5a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127b61:	0f 84 09 39 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127b67:	0f b6 01             	movzbl (%rcx),%eax
   140127b6a:	48 8d 3d 2f 55 29 00 	lea    0x29552f(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127b71:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127b75:	45 31 e4             	xor    %r12d,%r12d
   140127b78:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127b7c:	ff e0                	jmp    *%rax
   140127b7e:	41 80 fc 02          	cmp    $0x2,%r12b
   140127b82:	0f 84 f9 18 00 00    	je     140129481 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71b1>
   140127b88:	41 80 fc 01          	cmp    $0x1,%r12b
   140127b8c:	0f 84 83 47 00 00    	je     14012c315 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa045>
   140127b92:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127b99:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127ba0:	c5 f8 77             	vzeroupper
   140127ba3:	48 29 d6             	sub    %rdx,%rsi
   140127ba6:	4c 29 fd             	sub    %r15,%rbp
   140127ba9:	48 29 d0             	sub    %rdx,%rax
   140127bac:	48 89 f7             	mov    %rsi,%rdi
   140127baf:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127bb6:	48 c1 ff 03          	sar    $0x3,%rdi
   140127bba:	48 39 f0             	cmp    %rsi,%rax
   140127bbd:	0f 82 08 40 00 00    	jb     14012bbcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98fb>
   140127bc3:	c5 f9 6f 05 b5 1e 23 	vmovdqa 0x231eb5(%rip),%xmm0        # 140359a80 <CSWTCH.2960+0x1c0>
   140127bca:	00 
   140127bcb:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127bd2:	4c 89 f2             	mov    %r14,%rdx
   140127bd5:	48 89 d9             	mov    %rbx,%rcx
   140127bd8:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127bdf:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127be6:	00 
   140127be7:	e8 84 a9 fd ff       	call   140102570 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   140127bec:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127bf3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127bfa:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140127c01:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127c08:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140127c0c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127c13:	4c 01 f9             	add    %r15,%rcx
   140127c16:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140127c1b:	4d 85 ed             	test   %r13,%r13
   140127c1e:	74 0d                	je     140127c2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x595d>
   140127c20:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140127c25:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140127c2c:	00 
   140127c2d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127c34:	0f 84 36 38 00 00    	je     14012b470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140127c3a:	0f b6 01             	movzbl (%rcx),%eax
   140127c3d:	48 8d 3d 5c 54 29 00 	lea    0x29545c(%rip),%rdi        # 1403bd0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127c44:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140127c48:	45 31 e4             	xor    %r12d,%r12d
   140127c4b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127c4f:	ff e0                	jmp    *%rax
   140127c51:	41 80 fc 02          	cmp    $0x2,%r12b
   140127c55:	0f 84 95 1c 00 00    	je     1401298f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7620>
   140127c5b:	41 80 fc 01          	cmp    $0x1,%r12b
   140127c5f:	0f 84 10 4a 00 00    	je     14012c675 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a5>
   140127c65:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140127c6c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127c73:	c5 f8 77             	vzeroupper
   140127c76:	48 29 d6             	sub    %rdx,%rsi
   140127c79:	4c 29 fd             	sub    %r15,%rbp
   140127c7c:	48 29 d0             	sub    %rdx,%rax
   140127c7f:	48 89 f7             	mov    %rsi,%rdi
   140127c82:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140127c89:	48 c1 ff 03          	sar    $0x3,%rdi
   140127c8d:	48 39 f0             	cmp    %rsi,%rax
