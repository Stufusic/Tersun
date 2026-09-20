000000014011f5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   14011f5a0:	41 57                	push   %r15
   14011f5a2:	41 56                	push   %r14
   14011f5a4:	41 55                	push   %r13
   14011f5a6:	41 54                	push   %r12
   14011f5a8:	55                   	push   %rbp
   14011f5a9:	57                   	push   %rdi
   14011f5aa:	56                   	push   %rsi
   14011f5ab:	53                   	push   %rbx
   14011f5ac:	48 81 ec e8 08 00 00 	sub    $0x8e8,%rsp
   14011f5b3:	c5 f8 29 b4 24 40 08 	vmovaps %xmm6,0x840(%rsp)
   14011f5ba:	00 00 
   14011f5bc:	c5 f8 29 bc 24 50 08 	vmovaps %xmm7,0x850(%rsp)
   14011f5c3:	00 00 
   14011f5c5:	c5 78 29 84 24 60 08 	vmovaps %xmm8,0x860(%rsp)
   14011f5cc:	00 00 
   14011f5ce:	c5 78 29 8c 24 70 08 	vmovaps %xmm9,0x870(%rsp)
   14011f5d5:	00 00 
   14011f5d7:	c5 78 29 94 24 80 08 	vmovaps %xmm10,0x880(%rsp)
   14011f5de:	00 00 
   14011f5e0:	c5 78 29 9c 24 90 08 	vmovaps %xmm11,0x890(%rsp)
   14011f5e7:	00 00 
   14011f5e9:	c5 78 29 a4 24 a0 08 	vmovaps %xmm12,0x8a0(%rsp)
   14011f5f0:	00 00 
   14011f5f2:	c5 78 29 ac 24 b0 08 	vmovaps %xmm13,0x8b0(%rsp)
   14011f5f9:	00 00 
   14011f5fb:	c5 78 29 b4 24 c0 08 	vmovaps %xmm14,0x8c0(%rsp)
   14011f602:	00 00 
   14011f604:	c5 78 29 bc 24 d0 08 	vmovaps %xmm15,0x8d0(%rsp)
   14011f60b:	00 00 
   14011f60d:	48 8b 42 08          	mov    0x8(%rdx),%rax
   14011f611:	48 2b 02             	sub    (%rdx),%rax
   14011f614:	48 89 cb             	mov    %rcx,%rbx
   14011f617:	49 89 d7             	mov    %rdx,%r15
   14011f61a:	48 39 81 38 10 00 00 	cmp    %rax,0x1038(%rcx)
   14011f621:	72 0b                	jb     14011f62e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   14011f623:	48 c7 81 38 10 00 00 	movq   $0x0,0x1038(%rcx)
   14011f62a:	00 00 00 00 
   14011f62e:	48 8b b3 c8 52 01 00 	mov    0x152c8(%rbx),%rsi
   14011f635:	c6 83 40 10 00 00 01 	movb   $0x1,0x1040(%rbx)
   14011f63c:	48 85 f6             	test   %rsi,%rsi
   14011f63f:	74 0d                	je     14011f64e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   14011f641:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   14011f648:	0f 85 82 09 00 00    	jne    14011ffd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa30>
   14011f64e:	49 8b 6f 58          	mov    0x58(%r15),%rbp
   14011f652:	48 85 ed             	test   %rbp,%rbp
   14011f655:	0f 84 db 00 00 00    	je     14011f736 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x196>
   14011f65b:	48 8b 3d fe 43 23 00 	mov    0x2343fe(%rip),%rdi        # 140353a60 <CSWTCH.2799+0x220>
   14011f662:	4c 8d b3 00 10 00 00 	lea    0x1000(%rbx),%r14
   14011f669:	b9 88 00 00 00       	mov    $0x88,%ecx
   14011f66e:	4c 8d 65 08          	lea    0x8(%rbp),%r12
   14011f672:	e8 49 09 21 00       	call   14032ffc0 <operator new(unsigned long long)>
   14011f677:	c5 d9 ef e4          	vpxor  %xmm4,%xmm4,%xmm4
   14011f67b:	4c 89 e2             	mov    %r12,%rdx
   14011f67e:	48 89 c6             	mov    %rax,%rsi
   14011f681:	48 89 78 08          	mov    %rdi,0x8(%rax)
   14011f685:	48 8d 05 d4 34 25 00 	lea    0x2534d4(%rip),%rax        # 140372b60 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   14011f68c:	48 89 06             	mov    %rax,(%rsi)
   14011f68f:	48 8d 46 20          	lea    0x20(%rsi),%rax
   14011f693:	4c 8d 6e 10          	lea    0x10(%rsi),%r13
   14011f697:	c5 fe 7f 66 10       	vmovdqu %ymm4,0x10(%rsi)
   14011f69c:	4c 89 e9             	mov    %r13,%rcx
   14011f69f:	48 89 46 10          	mov    %rax,0x10(%rsi)
   14011f6a3:	48 8d 46 40          	lea    0x40(%rsi),%rax
   14011f6a7:	c5 fe 7f 66 30       	vmovdqu %ymm4,0x30(%rsi)
   14011f6ac:	48 89 46 30          	mov    %rax,0x30(%rsi)
   14011f6b0:	48 8d 86 80 00 00 00 	lea    0x80(%rsi),%rax
   14011f6b7:	c5 fe 7f 66 68       	vmovdqu %ymm4,0x68(%rsi)
   14011f6bc:	48 89 46 50          	mov    %rax,0x50(%rsi)
   14011f6c0:	48 c7 46 58 01 00 00 	movq   $0x1,0x58(%rsi)
   14011f6c7:	00 
   14011f6c8:	48 c7 46 60 00 00 00 	movq   $0x0,0x60(%rsi)
   14011f6cf:	00 
   14011f6d0:	48 c7 46 70 00 00 80 	movq   $0x3f800000,0x70(%rsi)
   14011f6d7:	3f 
   14011f6d8:	c5 f8 77             	vzeroupper
   14011f6db:	e8 00 7f 1c 00       	call   1402e75e0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14011f6e0:	48 8d 55 28          	lea    0x28(%rbp),%rdx
   14011f6e4:	48 8d 4e 50          	lea    0x50(%rsi),%rcx
   14011f6e8:	48 39 d1             	cmp    %rdx,%rcx
   14011f6eb:	74 05                	je     14011f6f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   14011f6ed:	e8 fe 6f 17 00       	call   1402966f0 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   14011f6f2:	4c 89 e2             	mov    %r12,%rdx
   14011f6f5:	4c 89 f1             	mov    %r14,%rcx
   14011f6f8:	e8 e3 89 1f 00       	call   1403180e0 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14011f6fd:	4c 89 28             	mov    %r13,(%rax)
   14011f700:	49 89 c4             	mov    %rax,%r12
   14011f703:	48 39 70 08          	cmp    %rsi,0x8(%rax)
   14011f707:	74 18                	je     14011f721 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x181>
   14011f709:	f0 83 46 08 01       	lock addl $0x1,0x8(%rsi)
   14011f70e:	48 8b 48 08          	mov    0x8(%rax),%rcx
   14011f712:	48 85 c9             	test   %rcx,%rcx
   14011f715:	74 05                	je     14011f71c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17c>
   14011f717:	e8 a4 00 1b 00       	call   1402cf7c0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14011f71c:	49 89 74 24 08       	mov    %rsi,0x8(%r12)
   14011f721:	48 89 f1             	mov    %rsi,%rcx
   14011f724:	e8 97 00 1b 00       	call   1402cf7c0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14011f729:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
   14011f72d:	48 85 ed             	test   %rbp,%rbp
   14011f730:	0f 85 33 ff ff ff    	jne    14011f669 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   14011f736:	49 8b 07             	mov    (%r15),%rax
   14011f739:	4c 8b b3 38 10 00 00 	mov    0x1038(%rbx),%r14
   14011f740:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14011f747:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14011f74e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   14011f753:	49 01 c6             	add    %rax,%r14
   14011f756:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14011f75d:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14011f761:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14011f768:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14011f76d:	4d 85 ed             	test   %r13,%r13
   14011f770:	75 6e                	jne    14011f7e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x240>
   14011f772:	49 8b 87 b0 00 00 00 	mov    0xb0(%r15),%rax
   14011f779:	ba 20 00 00 00       	mov    $0x20,%edx
   14011f77e:	48 39 d0             	cmp    %rdx,%rax
   14011f781:	48 0f 42 c2          	cmovb  %rdx,%rax
   14011f785:	80 3d f4 78 29 00 00 	cmpb   $0x0,0x2978f4(%rip)        # 1403b7080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14011f78c:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   14011f793:	74 76                	je     14011f80b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26b>
   14011f795:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14011f79c:	00 fb ff 
   14011f79f:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14011f7a6:	00 
   14011f7a7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14011f7ae:	0f 84 1c 5f 00 00    	je     1401256d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6130>
   14011f7b4:	41 0f b6 06          	movzbl (%r14),%eax
   14011f7b8:	48 8d 3d e1 78 29 00 	lea    0x2978e1(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14011f7bf:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14011f7c3:	45 31 e4             	xor    %r12d,%r12d
   14011f7c6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14011f7ca:	48 bf 00 00 00 00 00 	movabs $0xfffb000000000000,%rdi
   14011f7d1:	00 fb ff 
   14011f7d4:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
   14011f7d9:	ff e0                	jmp    *%rax
   14011f7db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   14011f7e0:	4b 8d 44 ad 00       	lea    0x0(%r13,%r13,4),%rax
   14011f7e5:	4c 8b ac c3 a0 10 00 	mov    0x10a0(%rbx,%rax,8),%r13
   14011f7ec:	00 
   14011f7ed:	48 8b bc c3 b0 10 00 	mov    0x10b0(%rbx,%rax,8),%rdi
   14011f7f4:	00 
   14011f7f5:	4c 01 ef             	add    %r13,%rdi
   14011f7f8:	80 3d 81 78 29 00 00 	cmpb   $0x0,0x297881(%rip)        # 1403b7080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14011f7ff:	48 89 f8             	mov    %rdi,%rax
   14011f802:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   14011f809:	75 8a                	jne    14011f795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f5>
   14011f80b:	48 8d 3d 87 49 00 00 	lea    0x4987(%rip),%rdi        # 140124199 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bf9>
   14011f812:	48 8d 05 f0 49 00 00 	lea    0x49f0(%rip),%rax        # 140124209 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c69>
   14011f819:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f81e:	48 8d 3d 95 48 00 00 	lea    0x4895(%rip),%rdi        # 1401240ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b1a>
   14011f825:	48 8d 15 e3 2c 00 00 	lea    0x2ce3(%rip),%rdx        # 14012250f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f6f>
   14011f82c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f832:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f837:	48 8d 05 eb 48 00 00 	lea    0x48eb(%rip),%rax        # 140124129 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b89>
   14011f83e:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f844:	48 8d 3d b5 4a 00 00 	lea    0x4ab5(%rip),%rdi        # 140124300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d60>
   14011f84b:	48 8d 05 f2 4a 00 00 	lea    0x4af2(%rip),%rax        # 140124344 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da4>
   14011f852:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f858:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f85d:	48 8d 3d 15 4a 00 00 	lea    0x4a15(%rip),%rdi        # 140124279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cd9>
   14011f864:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f86a:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f86f:	48 8d 05 46 4a 00 00 	lea    0x4a46(%rip),%rax        # 1401242bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d1c>
   14011f876:	c5 fe 7f 94 24 20 01 	vmovdqu %ymm2,0x120(%rsp)
   14011f87d:	00 00 
   14011f87f:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f885:	48 8d 3d a6 4c 00 00 	lea    0x4ca6(%rip),%rdi        # 140124532 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f92>
   14011f88c:	48 8d 05 2e 4d 00 00 	lea    0x4d2e(%rip),%rax        # 1401245c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5021>
   14011f893:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f899:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f89e:	48 8d 3d e3 4a 00 00 	lea    0x4ae3(%rip),%rdi        # 140124388 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4de8>
   14011f8a5:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f8ab:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f8b0:	48 8d 05 76 4b 00 00 	lea    0x4b76(%rip),%rax        # 14012442d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e8d>
   14011f8b7:	c5 fe 7f 94 24 00 01 	vmovdqu %ymm2,0x100(%rsp)
   14011f8be:	00 00 
   14011f8c0:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f8c6:	48 8d 3d 12 4f 00 00 	lea    0x4f12(%rip),%rdi        # 1401247df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x523f>
   14011f8cd:	48 8d 05 be 4f 00 00 	lea    0x4fbe(%rip),%rax        # 140124892 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52f2>
   14011f8d4:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f8da:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f8df:	48 8d 3d 96 4d 00 00 	lea    0x4d96(%rip),%rdi        # 14012467c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50dc>
   14011f8e6:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f8ec:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f8f1:	48 8d 05 37 4e 00 00 	lea    0x4e37(%rip),%rax        # 14012472f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x518f>
   14011f8f8:	c5 fe 7f 94 24 e0 00 	vmovdqu %ymm2,0xe0(%rsp)
   14011f8ff:	00 00 
   14011f901:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f907:	48 8d 3d 94 53 00 00 	lea    0x5394(%rip),%rdi        # 140124ca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5702>
   14011f90e:	48 8d 05 23 54 00 00 	lea    0x5423(%rip),%rax        # 140124d38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5798>
   14011f915:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f91b:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f920:	48 8d 3d c6 50 00 00 	lea    0x50c6(%rip),%rdi        # 1401249ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x544d>
   14011f927:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f92d:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f932:	48 8d 05 0f 52 00 00 	lea    0x520f(%rip),%rax        # 140124b48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55a8>
   14011f939:	c5 fe 7f 94 24 c0 00 	vmovdqu %ymm2,0xc0(%rsp)
   14011f940:	00 00 
   14011f942:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f948:	48 8d 3d 9e 54 00 00 	lea    0x549e(%rip),%rdi        # 140124ded <setun::VM::run_optimized(setun::OptimizedChunk&)+0x584d>
   14011f94f:	48 8d 05 da 54 00 00 	lea    0x54da(%rip),%rax        # 140124e30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5890>
   14011f956:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f95c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f961:	48 8d 3d 4e 55 00 00 	lea    0x554e(%rip),%rdi        # 140124eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5916>
   14011f968:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f96e:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f973:	48 8d 05 31 54 00 00 	lea    0x5431(%rip),%rax        # 140124dab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x580b>
   14011f97a:	c5 fe 7f 94 24 a0 00 	vmovdqu %ymm2,0xa0(%rsp)
   14011f981:	00 00 
   14011f983:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f989:	48 8d 3d 00 56 00 00 	lea    0x5600(%rip),%rdi        # 140124f90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59f0>
   14011f990:	48 8d 05 b3 56 00 00 	lea    0x56b3(%rip),%rax        # 14012504a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aaa>
   14011f997:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f99d:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f9a2:	48 8d 3d ca 54 00 00 	lea    0x54ca(%rip),%rdi        # 140124e73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58d3>
   14011f9a9:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f9af:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011f9b4:	48 8d 05 70 55 00 00 	lea    0x5570(%rip),%rax        # 140124f2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x598b>
   14011f9bb:	c5 fe 7f 94 24 80 00 	vmovdqu %ymm2,0x80(%rsp)
   14011f9c2:	00 00 
   14011f9c4:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011f9ca:	48 8d 3d bf 45 00 00 	lea    0x45bf(%rip),%rdi        # 140123f90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49f0>
   14011f9d1:	48 8d 05 9f 3e 00 00 	lea    0x3e9f(%rip),%rax        # 140123877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42d7>
   14011f9d8:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011f9de:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011f9e3:	48 8d 3d dd 3c 00 00 	lea    0x3cdd(%rip),%rdi        # 1401236c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4127>
   14011f9ea:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011f9f0:	c5 fe 7f 54 24 60    	vmovdqu %ymm2,0x60(%rsp)
   14011f9f6:	48 8d 05 a2 3d 00 00 	lea    0x3da2(%rip),%rax        # 14012379f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41ff>
   14011f9fd:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   14011fa02:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   14011fa08:	48 8d 3d fc 43 00 00 	lea    0x43fc(%rip),%rdi        # 140123e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x486b>
   14011fa0f:	48 8d 05 11 40 00 00 	lea    0x4011(%rip),%rax        # 140123a27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4487>
   14011fa16:	c4 e3 6d 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   14011fa1c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fa21:	48 8d 3d 27 3f 00 00 	lea    0x3f27(%rip),%rdi        # 14012394f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43af>
   14011fa28:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fa2e:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fa33:	48 8d 05 f4 45 00 00 	lea    0x45f4(%rip),%rax        # 14012402e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a8e>
   14011fa3a:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fa40:	48 8d 3d 14 42 00 00 	lea    0x4214(%rip),%rdi        # 140123c5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46bb>
   14011fa47:	48 8d 05 e5 42 00 00 	lea    0x42e5(%rip),%rax        # 140123d33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4793>
   14011fa4e:	c4 e3 75 38 c8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   14011fa54:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fa59:	48 8d 3d 9f 40 00 00 	lea    0x409f(%rip),%rdi        # 140123aff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x455f>
   14011fa60:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fa66:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   14011fa6b:	48 8d 05 17 41 00 00 	lea    0x4117(%rip),%rax        # 140123b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e9>
   14011fa72:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14011fa78:	48 8d 3d 00 33 00 00 	lea    0x3300(%rip),%rdi        # 140122d7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37df>
   14011fa7f:	48 8d 05 d1 33 00 00 	lea    0x33d1(%rip),%rax        # 140122e57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38b7>
   14011fa86:	c4 e3 65 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm4
   14011fa8c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fa91:	48 8d 3d 37 31 00 00 	lea    0x3137(%rip),%rdi        # 140122bcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x362f>
   14011fa98:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fa9e:	c4 e1 f9 6e ef       	vmovq  %rdi,%xmm5
   14011faa3:	48 8d 05 fd 31 00 00 	lea    0x31fd(%rip),%rax        # 140122ca7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3707>
   14011faaa:	c5 fe 7f 64 24 40    	vmovdqu %ymm4,0x40(%rsp)
   14011fab0:	c4 e3 d1 22 e8 01    	vpinsrq $0x1,%rax,%xmm5,%xmm5
   14011fab6:	48 8d 3d 22 36 00 00 	lea    0x3622(%rip),%rdi        # 1401230df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b3f>
   14011fabd:	48 8d 05 f3 36 00 00 	lea    0x36f3(%rip),%rax        # 1401231b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c17>
   14011fac4:	c4 e3 55 38 e8 01    	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   14011faca:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011facf:	48 8d 3d 59 34 00 00 	lea    0x3459(%rip),%rdi        # 140122f2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x398f>
   14011fad6:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fadc:	c4 e1 f9 6e e7       	vmovq  %rdi,%xmm4
   14011fae1:	48 8d 05 1f 35 00 00 	lea    0x351f(%rip),%rax        # 140123007 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a67>
   14011fae8:	c4 e3 d9 22 e0 01    	vpinsrq $0x1,%rax,%xmm4,%xmm4
   14011faee:	48 8d 3d 4a 39 00 00 	lea    0x394a(%rip),%rdi        # 14012343f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e9f>
   14011faf5:	48 8d 05 1b 3a 00 00 	lea    0x3a1b(%rip),%rax        # 140123517 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f77>
   14011fafc:	c4 e3 5d 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   14011fb02:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb07:	48 8d 3d 81 37 00 00 	lea    0x3781(%rip),%rdi        # 14012328f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cef>
   14011fb0e:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fb14:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   14011fb19:	48 8d 05 47 38 00 00 	lea    0x3847(%rip),%rax        # 140123367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dc7>
   14011fb20:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14011fb26:	48 8d 3d ba 2a 00 00 	lea    0x2aba(%rip),%rdi        # 1401225e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3047>
   14011fb2d:	48 8d 05 8b 2b 00 00 	lea    0x2b8b(%rip),%rax        # 1401226bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x311f>
   14011fb34:	c4 e3 65 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   14011fb3a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb3f:	48 8d 3d 01 2e 00 00 	lea    0x2e01(%rip),%rdi        # 140122947 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33a7>
   14011fb46:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fb4c:	48 8d 05 1c 22 00 00 	lea    0x221c(%rip),%rax        # 140121d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27cf>
   14011fb53:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   14011fb58:	48 8d 05 c0 2e 00 00 	lea    0x2ec0(%rip),%rax        # 140122a1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x347f>
   14011fb5f:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   14011fb65:	48 8d 15 03 2d 00 00 	lea    0x2d03(%rip),%rdx        # 14012286f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32cf>
   14011fb6c:	c4 63 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   14011fb72:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb77:	48 8d 3d 49 1f 00 00 	lea    0x1f49(%rip),%rdi        # 140121ac7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2527>
   14011fb7e:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fb84:	48 8d 05 0c 2c 00 00 	lea    0x2c0c(%rip),%rax        # 140122797 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31f7>
   14011fb8b:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   14011fb90:	48 8d 05 08 20 00 00 	lea    0x2008(%rip),%rax        # 140121b9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25ff>
   14011fb97:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   14011fb9d:	48 8d 15 73 1d 00 00 	lea    0x1d73(%rip),%rdx        # 140121917 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2377>
   14011fba4:	c4 63 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm14
   14011fbaa:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fbaf:	48 8d 3d 55 15 00 00 	lea    0x1555(%rip),%rdi        # 14012110b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b6b>
   14011fbb6:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fbbc:	48 8d 05 2c 1e 00 00 	lea    0x1e2c(%rip),%rax        # 1401219ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x244f>
   14011fbc3:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fbc8:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fbce:	48 8d 15 d2 12 00 00 	lea    0x12d2(%rip),%rdx        # 140120ea7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1907>
   14011fbd5:	48 8d 05 60 16 00 00 	lea    0x1660(%rip),%rax        # 14012123c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c9c>
   14011fbdc:	c4 63 7d 38 ee 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   14011fbe2:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fbe7:	48 8d 3d 61 0b 00 00 	lea    0xb61(%rip),%rdi        # 14012074f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11af>
   14011fbee:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fbf4:	48 8d 05 df 13 00 00 	lea    0x13df(%rip),%rax        # 140120fda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a3a>
   14011fbfb:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fc00:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fc06:	48 8d 15 ea 09 00 00 	lea    0x9ea(%rip),%rdx        # 1401205f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1057>
   14011fc0d:	48 8d 05 ea 0b 00 00 	lea    0xbea(%rip),%rax        # 1401207fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125e>
   14011fc14:	c4 63 7d 38 d6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   14011fc1a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc1f:	48 8d 3d d1 23 00 00 	lea    0x23d1(%rip),%rdi        # 140121ff7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a57>
   14011fc26:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fc2c:	48 8d 05 70 0a 00 00 	lea    0xa70(%rip),%rax        # 1401206a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1103>
   14011fc33:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fc38:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fc3e:	48 8d 15 de 0f 00 00 	lea    0xfde(%rip),%rdx        # 140120c23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1683>
   14011fc45:	48 8d 05 1f 10 00 00 	lea    0x101f(%rip),%rax        # 140120c6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16cb>
   14011fc4c:	c4 63 7d 38 ce 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   14011fc52:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc57:	48 8d 3d 18 0d 00 00 	lea    0xd18(%rip),%rdi        # 140120976 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d6>
   14011fc5e:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fc64:	48 8d 05 b4 22 00 00 	lea    0x22b4(%rip),%rax        # 140121f1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x297f>
   14011fc6b:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fc70:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fc76:	48 8d 15 0c 11 00 00 	lea    0x110c(%rip),%rdx        # 140120d89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17e9>
   14011fc7d:	48 8d 05 7b 0d 00 00 	lea    0xd7b(%rip),%rax        # 1401209ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145f>
   14011fc84:	c4 63 7d 38 c6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   14011fc8a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc8f:	48 8d 3d f6 05 00 00 	lea    0x5f6(%rip),%rdi        # 14012028c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcec>
   14011fc96:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fc9c:	48 8d 05 4a 0c 00 00 	lea    0xc4a(%rip),%rax        # 1401208ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134d>
   14011fca3:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fca8:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fcae:	48 8d 15 cc 04 00 00 	lea    0x4cc(%rip),%rdx        # 140120181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   14011fcb5:	48 8d 05 cb 0b 00 00 	lea    0xbcb(%rip),%rax        # 140120887 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e7>
   14011fcbc:	c4 63 7d 38 e6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   14011fcc2:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fcc7:	48 8d 3d e5 07 00 00 	lea    0x7e5(%rip),%rdi        # 1401204b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf13>
   14011fcce:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fcd4:	48 8d 05 3b 05 00 00 	lea    0x53b(%rip),%rax        # 140120216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc76>
   14011fcdb:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fce0:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fce6:	48 8d 15 e4 03 00 00 	lea    0x3e4(%rip),%rdx        # 1401200d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb31>
   14011fced:	48 8d 05 38 08 00 00 	lea    0x838(%rip),%rax        # 14012052c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8c>
   14011fcf4:	c4 63 7d 38 de 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   14011fcfa:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fcff:	48 8d 3d 18 06 00 00 	lea    0x618(%rip),%rdi        # 14012031e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7e>
   14011fd06:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fd0c:	48 8d 05 e0 03 00 00 	lea    0x3e0(%rip),%rax        # 1401200f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb53>
   14011fd13:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fd18:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fd1e:	48 8d 15 7c 06 00 00 	lea    0x67c(%rip),%rdx        # 1401203a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe01>
   14011fd25:	48 8d 05 fc 06 00 00 	lea    0x6fc(%rip),%rax        # 140120428 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe88>
   14011fd2c:	c4 e3 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   14011fd32:	c4 e1 f9 6e f2       	vmovq  %rdx,%xmm6
   14011fd37:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fd3c:	c4 e3 c9 22 f0 01    	vpinsrq $0x1,%rax,%xmm6,%xmm6
   14011fd42:	48 8d 05 fe 20 00 00 	lea    0x20fe(%rip),%rax        # 140121e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28a7>
   14011fd49:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fd4f:	48 8d 05 93 58 00 00 	lea    0x5893(%rip),%rax        # 1401255e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6049>
   14011fd56:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   14011fd5c:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   14011fd61:	48 8d 05 38 73 29 00 	lea    0x297338(%rip),%rax        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14011fd68:	c5 fe 7f b4 24 40 01 	vmovdqu %ymm6,0x140(%rsp)
   14011fd6f:	00 00 
   14011fd71:	c4 e2 7d 59 c0       	vpbroadcastq %xmm0,%ymm0
   14011fd76:	48 8d 90 00 08 00 00 	lea    0x800(%rax),%rdx
   14011fd7d:	0f 1f 00             	nopl   (%rax)
   14011fd80:	c5 fd 7f 00          	vmovdqa %ymm0,(%rax)
   14011fd84:	48 83 c0 40          	add    $0x40,%rax
   14011fd88:	c5 fd 7f 40 e0       	vmovdqa %ymm0,-0x20(%rax)
   14011fd8d:	48 39 d0             	cmp    %rdx,%rax
   14011fd90:	75 ee                	jne    14011fd80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e0>
   14011fd92:	48 8d 05 be 06 00 00 	lea    0x6be(%rip),%rax        # 140120457 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb7>
   14011fd99:	48 8d 3d e8 0c 00 00 	lea    0xce8(%rip),%rdi        # 140120a88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e8>
   14011fda0:	c5 fd 7f 15 f8 77 29 	vmovdqa %ymm2,0x2977f8(%rip)        # 1403b75a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   14011fda7:	00 
   14011fda8:	c5 fe 6f 54 24 40    	vmovdqu 0x40(%rsp),%ymm2
   14011fdae:	48 89 05 2b 73 29 00 	mov    %rax,0x29732b(%rip)        # 1403b70e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   14011fdb5:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fdba:	48 8d 05 50 0d 00 00 	lea    0xd50(%rip),%rax        # 140120b11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1571>
   14011fdc1:	48 8d 3d a5 15 00 00 	lea    0x15a5(%rip),%rdi        # 14012136d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dcd>
   14011fdc8:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fdce:	48 8d 05 c5 0d 00 00 	lea    0xdc5(%rip),%rax        # 140120b9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15fa>
   14011fdd5:	c5 fe 6f b4 24 40 01 	vmovdqu 0x140(%rsp),%ymm6
   14011fddc:	00 00 
   14011fdde:	c5 fd 7f 15 fa 77 29 	vmovdqa %ymm2,0x2977fa(%rip)        # 1403b75e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   14011fde5:	00 
   14011fde6:	c5 fe 6f 94 24 20 01 	vmovdqu 0x120(%rsp),%ymm2
   14011fded:	00 00 
   14011fdef:	48 89 05 1a 74 29 00 	mov    %rax,0x29741a(%rip)        # 1403b7210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   14011fdf6:	48 8d 05 a1 16 00 00 	lea    0x16a1(%rip),%rax        # 14012149e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1efe>
   14011fdfd:	c5 f9 7f 05 fb 73 29 	vmovdqa %xmm0,0x2973fb(%rip)        # 1403b7200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   14011fe04:	00 
   14011fe05:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe0a:	48 8d 3d be 22 00 00 	lea    0x22be(%rip),%rdi        # 1401220cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b2f>
   14011fe11:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fe17:	48 8d 05 49 19 00 00 	lea    0x1949(%rip),%rax        # 140121767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21c7>
   14011fe1e:	c5 fd 7f 25 1a 77 29 	vmovdqa %ymm4,0x29771a(%rip)        # 1403b7540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   14011fe25:	00 
   14011fe26:	c5 f9 7f 05 12 74 29 	vmovdqa %xmm0,0x297412(%rip)        # 1403b7240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   14011fe2d:	00 
   14011fe2e:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe33:	48 8d 3d 95 17 00 00 	lea    0x1795(%rip),%rdi        # 1401215cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x202f>
   14011fe3a:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fe40:	48 8d 05 f8 19 00 00 	lea    0x19f8(%rip),%rax        # 14012183f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x229f>
   14011fe47:	c5 fd 7f 1d 11 77 29 	vmovdqa %ymm3,0x297711(%rip)        # 1403b7560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   14011fe4e:	00 
   14011fe4f:	48 89 05 5a 74 29 00 	mov    %rax,0x29745a(%rip)        # 1403b72b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   14011fe56:	48 8d 05 ae 17 00 00 	lea    0x17ae(%rip),%rax        # 14012160b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x206b>
   14011fe5d:	c5 f9 7f 05 3b 74 29 	vmovdqa %xmm0,0x29743b(%rip)        # 1403b72a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   14011fe64:	00 
   14011fe65:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe6a:	48 8d 3d 36 23 00 00 	lea    0x2336(%rip),%rdi        # 1401221a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c07>
   14011fe71:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fe77:	48 8d 05 02 18 00 00 	lea    0x1802(%rip),%rax        # 140121680 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e0>
   14011fe7e:	c5 fd 7f 15 9a 77 29 	vmovdqa %ymm2,0x29779a(%rip)        # 1403b7620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   14011fe85:	00 
   14011fe86:	48 89 05 a3 74 29 00 	mov    %rax,0x2974a3(%rip)        # 1403b7330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   14011fe8d:	48 8d 05 c4 25 00 00 	lea    0x25c4(%rip),%rax        # 140122458 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eb8>
   14011fe94:	c5 f9 7f 05 84 74 29 	vmovdqa %xmm0,0x297484(%rip)        # 1403b7320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   14011fe9b:	00 
   14011fe9c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fea1:	48 8d 3d d2 52 00 00 	lea    0x52d2(%rip),%rdi        # 14012517a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bda>
   14011fea8:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011feae:	48 8d 05 be 1d 00 00 	lea    0x1dbe(%rip),%rax        # 140121c73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26d3>
   14011feb5:	c5 fd 7f 3d e3 71 29 	vmovdqa %ymm7,0x2971e3(%rip)        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14011febc:	00 
   14011febd:	48 89 05 d4 79 29 00 	mov    %rax,0x2979d4(%rip)        # 1403b7898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   14011fec4:	48 8d 05 2c 2c 00 00 	lea    0x2c2c(%rip),%rax        # 140122af7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3557>
   14011fecb:	48 89 05 0e 76 29 00 	mov    %rax,0x29760e(%rip)        # 1403b74e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   14011fed2:	48 8d 05 16 37 00 00 	lea    0x3716(%rip),%rax        # 1401235ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x404f>
   14011fed9:	48 89 05 a0 76 29 00 	mov    %rax,0x2976a0(%rip)        # 1403b7580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   14011fee0:	48 8d 05 7c 54 00 00 	lea    0x547c(%rip),%rax        # 140125363 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dc3>
   14011fee7:	c5 f9 7f 05 b1 74 29 	vmovdqa %xmm0,0x2974b1(%rip)        # 1403b73a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   14011feee:	00 
   14011feef:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fef4:	c5 fd 7f 35 c4 71 29 	vmovdqa %ymm6,0x2971c4(%rip)        # 1403b70c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   14011fefb:	00 
   14011fefc:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011ff02:	c5 7d 7f 1d 16 72 29 	vmovdqa %ymm11,0x297216(%rip)        # 1403b7120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   14011ff09:	00 
   14011ff0a:	c5 7d 7f 0d 8e 72 29 	vmovdqa %ymm9,0x29728e(%rip)        # 1403b71a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   14011ff11:	00 
   14011ff12:	c5 7d 7f 05 a6 72 29 	vmovdqa %ymm8,0x2972a6(%rip)        # 1403b71c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   14011ff19:	00 
   14011ff1a:	c5 7d 7f 25 be 72 29 	vmovdqa %ymm12,0x2972be(%rip)        # 1403b71e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   14011ff21:	00 
   14011ff22:	c5 7d 7f 15 f6 72 29 	vmovdqa %ymm10,0x2972f6(%rip)        # 1403b7220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   14011ff29:	00 
   14011ff2a:	c5 7d 7f 2d ee 74 29 	vmovdqa %ymm13,0x2974ee(%rip)        # 1403b7420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   14011ff31:	00 
   14011ff32:	c5 7d 7f 3d 66 75 29 	vmovdqa %ymm15,0x297566(%rip)        # 1403b74a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   14011ff39:	00 
   14011ff3a:	c5 7d 7f 35 7e 75 29 	vmovdqa %ymm14,0x29757e(%rip)        # 1403b74c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   14011ff41:	00 
   14011ff42:	c5 fd 7f 2d d6 75 29 	vmovdqa %ymm5,0x2975d6(%rip)        # 1403b7520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   14011ff49:	00 
   14011ff4a:	c5 fd 7f 0d 6e 76 29 	vmovdqa %ymm1,0x29766e(%rip)        # 1403b75c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   14011ff51:	00 
   14011ff52:	c5 fe 6f ac 24 00 01 	vmovdqu 0x100(%rsp),%ymm5
   14011ff59:	00 00 
   14011ff5b:	c5 fe 6f 5c 24 60    	vmovdqu 0x60(%rsp),%ymm3
   14011ff61:	c5 fe 6f 94 24 e0 00 	vmovdqu 0xe0(%rsp),%ymm2
   14011ff68:	00 00 
   14011ff6a:	c6 05 0f 71 29 00 01 	movb   $0x1,0x29710f(%rip)        # 1403b7080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14011ff71:	c5 fe 6f a4 24 c0 00 	vmovdqu 0xc0(%rsp),%ymm4
   14011ff78:	00 00 
   14011ff7a:	c5 fd 7f 2d be 76 29 	vmovdqa %ymm5,0x2976be(%rip)        # 1403b7640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   14011ff81:	00 
   14011ff82:	c5 fe 6f ac 24 a0 00 	vmovdqu 0xa0(%rsp),%ymm5
   14011ff89:	00 00 
   14011ff8b:	c5 fd 7f 15 cd 76 29 	vmovdqa %ymm2,0x2976cd(%rip)        # 1403b7660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   14011ff92:	00 
   14011ff93:	c5 fe 6f 94 24 80 00 	vmovdqu 0x80(%rsp),%ymm2
   14011ff9a:	00 00 
   14011ff9c:	c5 fd 7f 25 dc 76 29 	vmovdqa %ymm4,0x2976dc(%rip)        # 1403b7680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   14011ffa3:	00 
   14011ffa4:	c5 fd 7f 2d f4 76 29 	vmovdqa %ymm5,0x2976f4(%rip)        # 1403b76a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   14011ffab:	00 
   14011ffac:	c5 fd 7f 15 0c 77 29 	vmovdqa %ymm2,0x29770c(%rip)        # 1403b76c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   14011ffb3:	00 
   14011ffb4:	c5 fd 7f 1d 24 77 29 	vmovdqa %ymm3,0x297724(%rip)        # 1403b76e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   14011ffbb:	00 
   14011ffbc:	c5 f9 7f 05 3c 77 29 	vmovdqa %xmm0,0x29773c(%rip)        # 1403b7700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   14011ffc3:	00 
   14011ffc4:	e9 cc f7 ff ff       	jmp    14011f795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f5>
   14011ffc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   14011ffd0:	48 8b 86 e0 00 00 00 	mov    0xe0(%rsi),%rax
   14011ffd7:	48 39 86 d8 00 00 00 	cmp    %rax,0xd8(%rsi)
   14011ffde:	0f 85 d4 00 00 00    	jne    1401200b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb18>
   14011ffe4:	49 8b 87 88 00 00 00 	mov    0x88(%r15),%rax
   14011ffeb:	49 2b 87 80 00 00 00 	sub    0x80(%r15),%rax
   14011fff2:	ba 80 00 00 00       	mov    $0x80,%edx
   14011fff7:	48 8d 8e d8 00 00 00 	lea    0xd8(%rsi),%rcx
   14011fffe:	48 c1 f8 02          	sar    $0x2,%rax
   140120002:	48 83 c0 10          	add    $0x10,%rax
   140120006:	48 3d 80 00 00 00    	cmp    $0x80,%rax
   14012000c:	76 0a                	jbe    140120018 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78>
   14012000e:	66 90                	xchg   %ax,%ax
   140120010:	48 01 d2             	add    %rdx,%rdx
   140120013:	48 39 c2             	cmp    %rax,%rdx
   140120016:	72 f8                	jb     140120010 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa70>
   140120018:	8b 86 8c 00 00 00    	mov    0x8c(%rsi),%eax
   14012001e:	44 8b 8e 88 00 00 00 	mov    0x88(%rsi),%r9d
   140120025:	41 b8 80 00 00 00    	mov    $0x80,%r8d
   14012002b:	89 44 24 28          	mov    %eax,0x28(%rsp)
   14012002f:	8b 86 90 00 00 00    	mov    0x90(%rsi),%eax
   140120035:	89 44 24 20          	mov    %eax,0x20(%rsp)
   140120039:	e8 42 6d 07 00       	call   140196d80 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   14012003e:	c5 fa 6f 8e d8 00 00 	vmovdqu 0xd8(%rsi),%xmm1
   140120045:	00 
   140120046:	c5 fa 6f 86 e8 00 00 	vmovdqu 0xe8(%rsi),%xmm0
   14012004d:	00 
   14012004e:	c4 e3 79 0e d1 0f    	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140120054:	c4 e1 f9 7e c8       	vmovq  %xmm1,%rax
   140120059:	c4 e3 f9 16 c1 01    	vpextrq $0x1,%xmm0,%rcx
   14012005f:	c5 fa 7f 93 d8 52 01 	vmovdqu %xmm2,0x152d8(%rbx)
   140120066:	00 
   140120067:	48 8b 96 e0 00 00 00 	mov    0xe0(%rsi),%rdx
   14012006e:	48 29 c2             	sub    %rax,%rdx
   140120071:	48 8b 86 f8 00 00 00 	mov    0xf8(%rsi),%rax
   140120078:	48 c1 fa 05          	sar    $0x5,%rdx
   14012007c:	48 29 c8             	sub    %rcx,%rax
   14012007f:	48 89 93 e8 52 01 00 	mov    %rdx,0x152e8(%rbx)
   140120086:	48 c1 f8 05          	sar    $0x5,%rax
   14012008a:	48 83 fa 01          	cmp    $0x1,%rdx
   14012008e:	48 83 d2 ff          	adc    $0xffffffffffffffff,%rdx
   140120092:	48 83 f8 01          	cmp    $0x1,%rax
   140120096:	48 89 83 f0 52 01 00 	mov    %rax,0x152f0(%rbx)
   14012009d:	48 83 d0 ff          	adc    $0xffffffffffffffff,%rax
   1401200a1:	48 89 93 f8 52 01 00 	mov    %rdx,0x152f8(%rbx)
   1401200a8:	48 89 83 00 53 01 00 	mov    %rax,0x15300(%rbx)
   1401200af:	e9 9a f5 ff ff       	jmp    14011f64e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   1401200b4:	0f 1f 40 00          	nopl   0x0(%rax)
   1401200b8:	48 8b 86 f0 00 00 00 	mov    0xf0(%rsi),%rax
   1401200bf:	48 39 86 f8 00 00 00 	cmp    %rax,0xf8(%rsi)
   1401200c6:	0f 85 72 ff ff ff    	jne    14012003e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e>
   1401200cc:	e9 13 ff ff ff       	jmp    14011ffe4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa44>
   1401200d1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401200d8:	0f 84 1a 56 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   1401200de:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401200e2:	48 8d 3d b7 6f 29 00 	lea    0x296fb7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401200e9:	48 83 c5 01          	add    $0x1,%rbp
   1401200ed:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401200f1:	ff e0                	jmp    *%rax
   1401200f3:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
   1401200f7:	4c 8d 75 08          	lea    0x8(%rbp),%r14
   1401200fb:	45 84 e4             	test   %r12b,%r12b
   1401200fe:	0f 84 91 6e 00 00    	je     140126f95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79f5>
   140120104:	41 80 fc 01          	cmp    $0x1,%r12b
   140120108:	0f 84 5f 91 00 00    	je     14012926d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ccd>
   14012010e:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140120112:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120117:	0f 83 f4 be 00 00    	jae    14012c011 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca71>
   14012011d:	c5 f8 77             	vzeroupper
   140120120:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120125:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   14012012c:	00 
   14012012d:	48 89 fa             	mov    %rdi,%rdx
   140120130:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
   140120135:	48 89 06             	mov    %rax,(%rsi)
   140120138:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012013f:	00 
   140120140:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120145:	e8 b6 73 0e 00       	call   140207500 <setun::VMValue::VMValue(long long)>
   14012014a:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   140120151:	00 
   140120152:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   140120157:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012015e:	00 
   14012015f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120166:	0f 84 a4 55 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   14012016c:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140120170:	48 8d 3d 29 6f 29 00 	lea    0x296f29(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120177:	48 83 c5 09          	add    $0x9,%rbp
   14012017b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012017f:	ff e0                	jmp    *%rax
   140120181:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140120185:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   14012018c:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140120190:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140120197:	4c 01 ef             	add    %r13,%rdi
   14012019a:	48 c1 f8 03          	sar    $0x3,%rax
   14012019e:	48 39 c7             	cmp    %rax,%rdi
   1401201a1:	0f 83 74 a0 00 00    	jae    14012a21b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac7b>
   1401201a7:	45 84 e4             	test   %r12b,%r12b
   1401201aa:	0f 84 87 56 00 00    	je     140125837 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6297>
   1401201b0:	41 80 fc 01          	cmp    $0x1,%r12b
   1401201b4:	0f 84 0b 8f 00 00    	je     1401290c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b25>
   1401201ba:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401201be:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401201c3:	0f 83 2e ca 00 00    	jae    14012cbf7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd657>
   1401201c9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401201ce:	48 89 06             	mov    %rax,(%rsi)
   1401201d1:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401201d8:	00 
   1401201d9:	4c 89 c6             	mov    %r8,%rsi
   1401201dc:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401201e1:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401201e8:	48 8b 04 f8          	mov    (%rax,%rdi,8),%rax
   1401201ec:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401201f3:	00 
   1401201f4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401201fb:	0f 84 30 55 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140120201:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140120205:	48 8d 3d 94 6e 29 00 	lea    0x296e94(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012020c:	48 83 c5 03          	add    $0x3,%rbp
   140120210:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120214:	ff e0                	jmp    *%rax
   140120216:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   14012021a:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   14012021e:	4c 01 ef             	add    %r13,%rdi
   140120221:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140120228:	0f 83 ec 9e 00 00    	jae    14012a11a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab7a>
   14012022e:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140120235:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   14012023c:	48 c1 f8 03          	sar    $0x3,%rax
   140120240:	48 39 c7             	cmp    %rax,%rdi
   140120243:	0f 83 ba 9f 00 00    	jae    14012a203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac63>
   140120249:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012024d:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   140120254:	00 
   140120255:	45 84 e4             	test   %r12b,%r12b
   140120258:	48 0f 44 c2          	cmove  %rdx,%rax
   14012025c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140120263:	48 8b 00             	mov    (%rax),%rax
   140120266:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   14012026a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120271:	0f 84 ba 54 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140120277:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   14012027b:	48 8d 3d 1e 6e 29 00 	lea    0x296e1e(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120282:	48 83 c5 03          	add    $0x3,%rbp
   140120286:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012028a:	ff e0                	jmp    *%rax
   14012028c:	48 8b 83 88 10 00 00 	mov    0x1088(%rbx),%rax
   140120293:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140120297:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   14012029b:	48 2b 83 80 10 00 00 	sub    0x1080(%rbx),%rax
   1401202a2:	48 c1 f8 03          	sar    $0x3,%rax
   1401202a6:	48 39 c7             	cmp    %rax,%rdi
   1401202a9:	0f 83 88 9c 00 00    	jae    140129f37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa997>
   1401202af:	45 84 e4             	test   %r12b,%r12b
   1401202b2:	0f 84 23 55 00 00    	je     1401257db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x623b>
   1401202b8:	41 80 fc 01          	cmp    $0x1,%r12b
   1401202bc:	0f 84 5d 8e 00 00    	je     14012911f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b7f>
   1401202c2:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401202c6:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401202cb:	0f 83 09 d4 00 00    	jae    14012d6da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe13a>
   1401202d1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401202d6:	48 89 06             	mov    %rax,(%rsi)
   1401202d9:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401202e0:	00 
   1401202e1:	4c 89 c6             	mov    %r8,%rsi
   1401202e4:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401202e9:	48 8b 83 80 10 00 00 	mov    0x1080(%rbx),%rax
   1401202f0:	48 8b 04 f8          	mov    (%rax,%rdi,8),%rax
   1401202f4:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401202fb:	00 
   1401202fc:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120303:	0f 84 28 54 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140120309:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   14012030d:	48 8d 3d 8c 6d 29 00 	lea    0x296d8c(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120314:	48 83 c5 03          	add    $0x3,%rbp
   140120318:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012031c:	ff e0                	jmp    *%rax
   14012031e:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
   140120322:	4c 8d 75 08          	lea    0x8(%rbp),%r14
   140120326:	45 84 e4             	test   %r12b,%r12b
   140120329:	0f 84 3d 55 00 00    	je     14012586c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62cc>
   14012032f:	41 80 fc 01          	cmp    $0x1,%r12b
   140120333:	0f 84 b7 8d 00 00    	je     1401290f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b50>
   140120339:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012033d:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120342:	0f 83 27 c9 00 00    	jae    14012cc6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6cf>
   140120348:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012034d:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140120352:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140120356:	48 89 06             	mov    %rax,(%rsi)
   140120359:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120360:	00 
   140120361:	4c 89 c6             	mov    %r8,%rsi
   140120364:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120369:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140120370:	00 fc ff 
   140120373:	48 0f 4a f8          	cmovp  %rax,%rdi
   140120377:	48 89 bc 24 80 01 00 	mov    %rdi,0x180(%rsp)
   14012037e:	00 
   14012037f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120386:	0f 84 a5 53 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   14012038c:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140120390:	48 8d 3d 09 6d 29 00 	lea    0x296d09(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120397:	48 83 c5 09          	add    $0x9,%rbp
   14012039b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012039f:	ff e0                	jmp    *%rax
   1401203a1:	0f b6 7d 00          	movzbl 0x0(%rbp),%edi
   1401203a5:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401203a9:	45 84 e4             	test   %r12b,%r12b
   1401203ac:	0f 84 5f 54 00 00    	je     140125811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6271>
   1401203b2:	41 80 fc 01          	cmp    $0x1,%r12b
   1401203b6:	0f 84 b1 8c 00 00    	je     14012906d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9acd>
   1401203bc:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401203c0:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401203c5:	0f 83 5b cd 00 00    	jae    14012d126 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb86>
   1401203cb:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401203d0:	40 84 ff             	test   %dil,%dil
   1401203d3:	48 ba 01 00 00 00 00 	movabs $0xfffa000000000001,%rdx
   1401203da:	00 fa ff 
   1401203dd:	48 89 06             	mov    %rax,(%rsi)
   1401203e0:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401203e7:	00 
   1401203e8:	4c 89 c6             	mov    %r8,%rsi
   1401203eb:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401203f0:	48 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%rax
   1401203f7:	00 fa ff 
   1401203fa:	48 0f 45 c2          	cmovne %rdx,%rax
   1401203fe:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120405:	00 
   140120406:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012040d:	0f 84 1e 53 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140120413:	0f b6 45 01          	movzbl 0x1(%rbp),%eax
   140120417:	48 8d 3d 82 6c 29 00 	lea    0x296c82(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012041e:	48 83 c5 02          	add    $0x2,%rbp
   140120422:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120426:	ff e0                	jmp    *%rax
   140120428:	41 80 fc 01          	cmp    $0x1,%r12b
   14012042c:	0f 85 c4 a3 00 00    	jne    14012a7f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb256>
   140120432:	45 31 e4             	xor    %r12d,%r12d
   140120435:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012043c:	0f 84 b6 52 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140120442:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120446:	48 8d 3d 53 6c 29 00 	lea    0x296c53(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012044d:	48 83 c5 01          	add    $0x1,%rbp
   140120451:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120455:	ff e0                	jmp    *%rax
   140120457:	45 84 e4             	test   %r12b,%r12b
   14012045a:	0f 84 f5 53 00 00    	je     140125855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62b5>
   140120460:	41 80 fc 01          	cmp    $0x1,%r12b
   140120464:	0f 84 df 8b 00 00    	je     140129049 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aa9>
   14012046a:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012046e:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120473:	0f 83 08 c6 00 00    	jae    14012ca81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4e1>
   140120479:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012047e:	48 89 06             	mov    %rax,(%rsi)
   140120481:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120488:	00 
   140120489:	4c 89 c6             	mov    %r8,%rsi
   14012048c:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120491:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120498:	0f 84 5a 52 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   14012049e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401204a2:	48 8d 3d f7 6b 29 00 	lea    0x296bf7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401204a9:	48 83 c5 01          	add    $0x1,%rbp
   1401204ad:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401204b1:	ff e0                	jmp    *%rax
   1401204b3:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401204b7:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   1401204bb:	45 84 e4             	test   %r12b,%r12b
   1401204be:	0f 84 35 53 00 00    	je     1401257f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6259>
   1401204c4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401204c8:	0f 84 d2 8b 00 00    	je     1401290a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b00>
   1401204ce:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401204d2:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401204d7:	0f 83 ab cc 00 00    	jae    14012d188 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbe8>
   1401204dd:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401204e2:	48 89 06             	mov    %rax,(%rsi)
   1401204e5:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401204ec:	00 
   1401204ed:	4c 89 c6             	mov    %r8,%rsi
   1401204f0:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401204f5:	48 b8 00 00 00 00 00 	movabs $0xfff9000000000000,%rax
   1401204fc:	00 f9 ff 
   1401204ff:	48 09 c7             	or     %rax,%rdi
   140120502:	48 89 bc 24 80 01 00 	mov    %rdi,0x180(%rsp)
   140120509:	00 
   14012050a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120511:	0f 84 1a 52 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140120517:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   14012051b:	48 8d 3d 7e 6b 29 00 	lea    0x296b7e(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120522:	48 83 c5 03          	add    $0x3,%rbp
   140120526:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012052a:	ff e0                	jmp    *%rax
   14012052c:	c5 fa 6f 45 00       	vmovdqu 0x0(%rbp),%xmm0
   140120531:	8b 7d 10             	mov    0x10(%rbp),%edi
   140120534:	4c 8d 75 14          	lea    0x14(%rbp),%r14
   140120538:	45 84 e4             	test   %r12b,%r12b
   14012053b:	0f 84 ed 69 00 00    	je     140126f2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x798e>
   140120541:	41 80 fc 01          	cmp    $0x1,%r12b
   140120545:	0f 84 ae 8c 00 00    	je     1401291f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c59>
   14012054b:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012054f:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120554:	0f 83 43 ba 00 00    	jae    14012bf9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9fd>
   14012055a:	c5 f8 77             	vzeroupper
   14012055d:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120562:	48 8d 94 24 60 01 00 	lea    0x160(%rsp),%rdx
   140120569:	00 
   14012056a:	4c 89 44 24 60       	mov    %r8,0x60(%rsp)
   14012056f:	48 8d 8c 24 c0 04 00 	lea    0x4c0(%rsp),%rcx
   140120576:	00 
   140120577:	48 89 06             	mov    %rax,(%rsi)
   14012057a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120581:	00 
   140120582:	89 bc 24 10 06 00 00 	mov    %edi,0x610(%rsp)
   140120589:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012058e:	c7 84 24 14 06 00 00 	movl   $0x0,0x614(%rsp)
   140120595:	00 00 00 00 
   140120599:	48 8b 84 24 10 06 00 	mov    0x610(%rsp),%rax
   1401205a0:	00 
   1401205a1:	c5 f9 7f 84 24 00 06 	vmovdqa %xmm0,0x600(%rsp)
   1401205a8:	00 00 
   1401205aa:	48 89 84 24 70 01 00 	mov    %rax,0x170(%rsp)
   1401205b1:	00 
   1401205b2:	c5 f9 7f 84 24 60 01 	vmovdqa %xmm0,0x160(%rsp)
   1401205b9:	00 00 
   1401205bb:	e8 00 54 0e 00       	call   1402059c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401205c0:	48 8b 84 24 c0 04 00 	mov    0x4c0(%rsp),%rax
   1401205c7:	00 
   1401205c8:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   1401205cd:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401205d4:	00 
   1401205d5:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401205dc:	0f 84 2e 51 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   1401205e2:	0f b6 45 14          	movzbl 0x14(%rbp),%eax
   1401205e6:	48 8d 3d b3 6a 29 00 	lea    0x296ab3(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401205ed:	48 83 c5 15          	add    $0x15,%rbp
   1401205f1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401205f5:	ff e0                	jmp    *%rax
   1401205f7:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401205fe:	00 fb ff 
   140120601:	48 89 84 24 88 01 00 	mov    %rax,0x188(%rsp)
   140120608:	00 
   140120609:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140120610:	00 
   140120611:	41 80 fc 02          	cmp    $0x2,%r12b
   140120615:	0f 85 c7 9a 00 00    	jne    14012a0e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab42>
   14012061b:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120622:	00 
   140120623:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120629:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140120630:	00 
   140120631:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120636:	48 89 84 24 88 01 00 	mov    %rax,0x188(%rsp)
   14012063d:	00 
   14012063e:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140120645:	00 ff ff 
   140120648:	48 89 c1             	mov    %rax,%rcx
   14012064b:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140120652:	00 f8 ff 
   140120655:	48 21 d1             	and    %rdx,%rcx
   140120658:	4c 39 c1             	cmp    %r8,%rcx
   14012065b:	0f 84 13 5c 00 00    	je     140126274 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cd4>
   140120661:	48 8d 94 24 90 01 00 	lea    0x190(%rsp),%rdx
   140120668:	00 
   140120669:	48 8d 8c 24 88 01 00 	lea    0x188(%rsp),%rcx
   140120670:	00 
   140120671:	c5 f8 77             	vzeroupper
   140120674:	e8 47 ff 0e 00       	call   1402105c0 <setun::VMValue::add(setun::VMValue const&) const>
   140120679:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120680:	00 
   140120681:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120688:	0f 84 5b 50 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   14012068e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120692:	48 8d 3d 07 6a 29 00 	lea    0x296a07(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120699:	48 83 c5 01          	add    $0x1,%rbp
   14012069d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401206a1:	ff e0                	jmp    *%rax
   1401206a3:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401206aa:	00 fb ff 
   1401206ad:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   1401206b4:	00 
   1401206b5:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   1401206bc:	00 
   1401206bd:	41 80 fc 02          	cmp    $0x2,%r12b
   1401206c1:	0f 85 c8 a1 00 00    	jne    14012a88f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ef>
   1401206c7:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401206ce:	00 
   1401206cf:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401206d5:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   1401206dc:	00 
   1401206dd:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401206e2:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   1401206e9:	00 
   1401206ea:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401206f1:	00 ff ff 
   1401206f4:	48 89 c1             	mov    %rax,%rcx
   1401206f7:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401206fe:	00 f8 ff 
   140120701:	48 21 d1             	and    %rdx,%rcx
   140120704:	4c 39 c1             	cmp    %r8,%rcx
   140120707:	0f 84 b1 5a 00 00    	je     1401261be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c1e>
   14012070d:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
   140120714:	00 
   140120715:	48 8d 8c 24 98 01 00 	lea    0x198(%rsp),%rcx
   14012071c:	00 
   14012071d:	c5 f8 77             	vzeroupper
   140120720:	e8 8b 16 0f 00       	call   140211db0 <setun::VMValue::sub(setun::VMValue const&) const>
   140120725:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012072c:	00 
   14012072d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120734:	0f 84 af 4f 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   14012073a:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012073e:	48 8d 3d 5b 69 29 00 	lea    0x29695b(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120745:	48 83 c5 01          	add    $0x1,%rbp
   140120749:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012074d:	ff e0                	jmp    *%rax
   14012074f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120756:	00 fb ff 
   140120759:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   140120760:	00 
   140120761:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140120768:	00 
   140120769:	41 80 fc 02          	cmp    $0x2,%r12b
   14012076d:	0f 85 03 a3 00 00    	jne    14012aa76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4d6>
   140120773:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012077a:	00 
   14012077b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120781:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140120788:	00 
   140120789:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012078e:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   140120795:	00 
   140120796:	48 89 c2             	mov    %rax,%rdx
   140120799:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401207a0:	00 ff ff 
   1401207a3:	49 89 d0             	mov    %rdx,%r8
   1401207a6:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401207ad:	00 f8 ff 
   1401207b0:	49 21 c0             	and    %rax,%r8
   1401207b3:	49 39 c8             	cmp    %rcx,%r8
   1401207b6:	0f 84 aa 60 00 00    	je     140126866 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72c6>
   1401207bc:	48 8d 94 24 b0 01 00 	lea    0x1b0(%rsp),%rdx
   1401207c3:	00 
   1401207c4:	48 8d 8c 24 a8 01 00 	lea    0x1a8(%rsp),%rcx
   1401207cb:	00 
   1401207cc:	c5 f8 77             	vzeroupper
   1401207cf:	e8 5c 0d 0f 00       	call   140211530 <setun::VMValue::mul(setun::VMValue const&) const>
   1401207d4:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401207db:	00 
   1401207dc:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401207e3:	0f 84 00 4f 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   1401207e9:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401207ed:	48 8d 3d ac 68 29 00 	lea    0x2968ac(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401207f4:	48 83 c5 01          	add    $0x1,%rbp
   1401207f8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401207fc:	ff e0                	jmp    *%rax
   1401207fe:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120805:	00 fb ff 
   140120808:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   14012080f:	00 
   140120810:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140120817:	00 
   140120818:	41 80 fc 02          	cmp    $0x2,%r12b
   14012081c:	0f 85 87 a6 00 00    	jne    14012aea9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb909>
   140120822:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120829:	00 
   14012082a:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120830:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140120837:	00 
   140120838:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012083d:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   140120844:	00 
   140120845:	48 8d 94 24 c0 01 00 	lea    0x1c0(%rsp),%rdx
   14012084c:	00 
   14012084d:	48 8d 8c 24 b8 01 00 	lea    0x1b8(%rsp),%rcx
   140120854:	00 
   140120855:	c5 f8 77             	vzeroupper
   140120858:	e8 33 08 0f 00       	call   140211090 <setun::VMValue::div(setun::VMValue const&) const>
   14012085d:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120864:	00 
   140120865:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012086c:	0f 84 ad 4e 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120872:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120876:	48 8d 3d 23 68 29 00 	lea    0x296823(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012087d:	48 83 c5 01          	add    $0x1,%rbp
   140120881:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120885:	ff e0                	jmp    *%rax
   140120887:	48 8b 83 88 10 00 00 	mov    0x1088(%rbx),%rax
   14012088e:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140120892:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140120896:	48 2b 83 80 10 00 00 	sub    0x1080(%rbx),%rax
   14012089d:	48 c1 f8 03          	sar    $0x3,%rax
   1401208a1:	48 39 c7             	cmp    %rax,%rdi
   1401208a4:	0f 83 e7 a5 00 00    	jae    14012ae91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8f1>
   1401208aa:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401208ae:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   1401208b5:	00 
   1401208b6:	45 84 e4             	test   %r12b,%r12b
   1401208b9:	48 0f 44 c2          	cmove  %rdx,%rax
   1401208bd:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   1401208c4:	48 8b 00             	mov    (%rax),%rax
   1401208c7:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   1401208cb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401208d2:	0f 84 59 4e 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   1401208d8:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401208dc:	48 8d 3d bd 67 29 00 	lea    0x2967bd(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401208e3:	48 83 c5 03          	add    $0x3,%rbp
   1401208e7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401208eb:	ff e0                	jmp    *%rax
   1401208ed:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401208f4:	00 fb ff 
   1401208f7:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401208fe:	00 
   1401208ff:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140120906:	00 
   140120907:	41 80 fc 02          	cmp    $0x2,%r12b
   14012090b:	0f 85 50 a5 00 00    	jne    14012ae61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8c1>
   140120911:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120918:	00 
   140120919:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012091f:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140120926:	00 
   140120927:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012092c:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140120933:	00 
   140120934:	48 8d 94 24 d0 01 00 	lea    0x1d0(%rsp),%rdx
   14012093b:	00 
   14012093c:	48 8d 8c 24 c8 01 00 	lea    0x1c8(%rsp),%rcx
   140120943:	00 
   140120944:	c5 f8 77             	vzeroupper
   140120947:	e8 44 0a 0f 00       	call   140211390 <setun::VMValue::mod(setun::VMValue const&) const>
   14012094c:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120953:	00 
   140120954:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012095b:	0f 84 be 4d 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120961:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120965:	48 8d 3d 34 67 29 00 	lea    0x296734(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012096c:	48 83 c5 01          	add    $0x1,%rbp
   140120970:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120974:	ff e0                	jmp    *%rax
   140120976:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012097d:	00 fb ff 
   140120980:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   140120987:	00 
   140120988:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   14012098f:	00 
   140120990:	41 80 fc 02          	cmp    $0x2,%r12b
   140120994:	0f 85 9f a5 00 00    	jne    14012af39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb999>
   14012099a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401209a1:	00 
   1401209a2:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401209a8:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   1401209af:	00 
   1401209b0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401209b5:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   1401209bc:	00 
   1401209bd:	48 8d 94 24 e0 01 00 	lea    0x1e0(%rsp),%rdx
   1401209c4:	00 
   1401209c5:	48 8d 8c 24 d8 01 00 	lea    0x1d8(%rsp),%rcx
   1401209cc:	00 
   1401209cd:	c5 f8 77             	vzeroupper
   1401209d0:	e8 8b 20 0f 00       	call   140212a60 <setun::VMValue::bit_and(setun::VMValue const&) const>
   1401209d5:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401209dc:	00 
   1401209dd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401209e4:	0f 84 35 4d 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   1401209ea:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401209ee:	48 8d 3d ab 66 29 00 	lea    0x2966ab(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401209f5:	48 83 c5 01          	add    $0x1,%rbp
   1401209f9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401209fd:	ff e0                	jmp    *%rax
   1401209ff:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120a06:	00 fb ff 
   140120a09:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   140120a10:	00 
   140120a11:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140120a18:	00 
   140120a19:	41 80 fc 02          	cmp    $0x2,%r12b
   140120a1d:	0f 85 b6 a4 00 00    	jne    14012aed9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb939>
   140120a23:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120a2a:	00 
   140120a2b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120a31:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140120a38:	00 
   140120a39:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120a3e:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   140120a45:	00 
   140120a46:	48 8d 94 24 f0 01 00 	lea    0x1f0(%rsp),%rdx
   140120a4d:	00 
   140120a4e:	48 8d 8c 24 e8 01 00 	lea    0x1e8(%rsp),%rcx
   140120a55:	00 
   140120a56:	c5 f8 77             	vzeroupper
   140120a59:	e8 d2 17 0f 00       	call   140212230 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140120a5e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120a65:	00 
   140120a66:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120a6d:	0f 84 ac 4c 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120a73:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120a77:	48 8d 3d 22 66 29 00 	lea    0x296622(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120a7e:	48 83 c5 01          	add    $0x1,%rbp
   140120a82:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120a86:	ff e0                	jmp    *%rax
   140120a88:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120a8f:	00 fb ff 
   140120a92:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   140120a99:	00 
   140120a9a:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   140120aa1:	00 
   140120aa2:	41 80 fc 02          	cmp    $0x2,%r12b
   140120aa6:	0f 85 5d a4 00 00    	jne    14012af09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb969>
   140120aac:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120ab3:	00 
   140120ab4:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120aba:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   140120ac1:	00 
   140120ac2:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120ac7:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   140120ace:	00 
   140120acf:	48 8d 94 24 00 02 00 	lea    0x200(%rsp),%rdx
   140120ad6:	00 
   140120ad7:	48 8d 8c 24 f8 01 00 	lea    0x1f8(%rsp),%rcx
   140120ade:	00 
   140120adf:	c5 f8 77             	vzeroupper
   140120ae2:	e8 79 24 0f 00       	call   140212f60 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   140120ae7:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120aee:	00 
   140120aef:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120af6:	0f 84 23 4c 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120afc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120b00:	48 8d 3d 99 65 29 00 	lea    0x296599(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120b07:	48 83 c5 01          	add    $0x1,%rbp
   140120b0b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120b0f:	ff e0                	jmp    *%rax
   140120b11:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120b18:	00 fb ff 
   140120b1b:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140120b22:	00 
   140120b23:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140120b2a:	00 
   140120b2b:	41 80 fc 02          	cmp    $0x2,%r12b
   140120b2f:	0f 85 11 9f 00 00    	jne    14012aa46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4a6>
   140120b35:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120b3c:	00 
   140120b3d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120b43:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140120b4a:	00 
   140120b4b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120b50:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140120b57:	00 
   140120b58:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
   140120b5f:	00 
   140120b60:	48 8d 8c 24 08 02 00 	lea    0x208(%rsp),%rcx
   140120b67:	00 
   140120b68:	c5 f8 77             	vzeroupper
   140120b6b:	e8 f0 0d 0f 00       	call   140211960 <setun::VMValue::shl(setun::VMValue const&) const>
   140120b70:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120b77:	00 
   140120b78:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120b7f:	0f 84 9a 4b 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120b85:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120b89:	48 8d 3d 10 65 29 00 	lea    0x296510(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120b90:	48 83 c5 01          	add    $0x1,%rbp
   140120b94:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120b98:	ff e0                	jmp    *%rax
   140120b9a:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120ba1:	00 fb ff 
   140120ba4:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   140120bab:	00 
   140120bac:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   140120bb3:	00 
   140120bb4:	41 80 fc 02          	cmp    $0x2,%r12b
   140120bb8:	0f 85 33 94 00 00    	jne    140129ff1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa51>
   140120bbe:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120bc5:	00 
   140120bc6:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120bcc:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   140120bd3:	00 
   140120bd4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120bd9:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   140120be0:	00 
   140120be1:	48 8d 94 24 20 02 00 	lea    0x220(%rsp),%rdx
   140120be8:	00 
   140120be9:	48 8d 8c 24 18 02 00 	lea    0x218(%rsp),%rcx
   140120bf0:	00 
   140120bf1:	c5 f8 77             	vzeroupper
   140120bf4:	e8 87 0f 0f 00       	call   140211b80 <setun::VMValue::shr(setun::VMValue const&) const>
   140120bf9:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120c00:	00 
   140120c01:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120c08:	0f 84 11 4b 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120c0e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120c12:	48 8d 3d 87 64 29 00 	lea    0x296487(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120c19:	48 83 c5 01          	add    $0x1,%rbp
   140120c1d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120c21:	ff e0                	jmp    *%rax
   140120c23:	45 84 e4             	test   %r12b,%r12b
   140120c26:	0f 85 92 4b 00 00    	jne    1401257be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x621e>
   140120c2c:	48 83 ee 08          	sub    $0x8,%rsi
   140120c30:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120c36:	48 89 f1             	mov    %rsi,%rcx
   140120c39:	c5 f8 77             	vzeroupper
   140120c3c:	e8 df 0b 0f 00       	call   140211820 <setun::VMValue::neg() const>
   140120c41:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120c48:	00 
   140120c49:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120c50:	0f 84 f7 81 00 00    	je     140128e4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98ad>
   140120c56:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120c5a:	48 8d 3d 3f 64 29 00 	lea    0x29643f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120c61:	48 83 c5 01          	add    $0x1,%rbp
   140120c65:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120c69:	ff e0                	jmp    *%rax
   140120c6b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120c72:	00 fb ff 
   140120c75:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   140120c7c:	00 
   140120c7d:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   140120c84:	00 
   140120c85:	41 80 fc 02          	cmp    $0x2,%r12b
   140120c89:	0f 85 07 95 00 00    	jne    14012a196 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf6>
   140120c8f:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120c96:	00 
   140120c97:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120c9d:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   140120ca4:	00 
   140120ca5:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120caa:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   140120cb1:	00 
   140120cb2:	48 8b 8c 24 28 02 00 	mov    0x228(%rsp),%rcx
   140120cb9:	00 
   140120cba:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140120cc1:	ff ff ff 
   140120cc4:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140120ccb:	00 fd ff 
   140120cce:	48 21 c1             	and    %rax,%rcx
   140120cd1:	48 39 d1             	cmp    %rdx,%rcx
   140120cd4:	0f 84 ac 6a 00 00    	je     140127786 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81e6>
   140120cda:	48 23 84 24 30 02 00 	and    0x230(%rsp),%rax
   140120ce1:	00 
   140120ce2:	48 39 d0             	cmp    %rdx,%rax
   140120ce5:	0f 84 9b 6a 00 00    	je     140127786 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81e6>
   140120ceb:	48 8d 8c 24 28 02 00 	lea    0x228(%rsp),%rcx
   140120cf2:	00 
   140120cf3:	c5 f8 77             	vzeroupper
   140120cf6:	e8 95 13 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120cfb:	48 8d 8c 24 30 02 00 	lea    0x230(%rsp),%rcx
   140120d02:	00 
   140120d03:	48 89 c7             	mov    %rax,%rdi
   140120d06:	e8 85 13 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120d0b:	48 8b 8c 24 28 02 00 	mov    0x228(%rsp),%rcx
   140120d12:	00 
   140120d13:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140120d1a:	00 ff ff 
   140120d1d:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   140120d24:	00 fa ff 
   140120d27:	48 21 d1             	and    %rdx,%rcx
   140120d2a:	4c 39 c1             	cmp    %r8,%rcx
   140120d2d:	75 11                	jne    140120d40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17a0>
   140120d2f:	48 23 94 24 30 02 00 	and    0x230(%rsp),%rdx
   140120d36:	00 
   140120d37:	48 39 ca             	cmp    %rcx,%rdx
   140120d3a:	0f 84 94 85 00 00    	je     1401292d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d34>
   140120d40:	48 39 c7             	cmp    %rax,%rdi
   140120d43:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   140120d4a:	00 
   140120d4b:	48 0f 4e c7          	cmovle %rdi,%rax
   140120d4f:	48 89 c2             	mov    %rax,%rdx
   140120d52:	e8 a9 67 0e 00       	call   140207500 <setun::VMValue::VMValue(long long)>
   140120d57:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   140120d5e:	00 
   140120d5f:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120d66:	00 
   140120d67:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120d6e:	0f 84 ab 49 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120d74:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120d78:	48 8d 3d 21 63 29 00 	lea    0x296321(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120d7f:	48 83 c5 01          	add    $0x1,%rbp
   140120d83:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120d87:	ff e0                	jmp    *%rax
   140120d89:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120d90:	00 fb ff 
   140120d93:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140120d9a:	00 
   140120d9b:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140120da2:	00 
   140120da3:	41 80 fc 02          	cmp    $0x2,%r12b
   140120da7:	0f 85 39 9c 00 00    	jne    14012a9e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb446>
   140120dad:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120db4:	00 
   140120db5:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120dbb:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140120dc2:	00 
   140120dc3:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120dc8:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140120dcf:	00 
   140120dd0:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   140120dd7:	00 
   140120dd8:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140120ddf:	ff ff ff 
   140120de2:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140120de9:	00 fd ff 
   140120dec:	48 21 c1             	and    %rax,%rcx
   140120def:	48 39 d1             	cmp    %rdx,%rcx
   140120df2:	0f 84 f2 69 00 00    	je     1401277ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x824a>
   140120df8:	48 23 84 24 40 02 00 	and    0x240(%rsp),%rax
   140120dff:	00 
   140120e00:	48 39 d0             	cmp    %rdx,%rax
   140120e03:	0f 84 e1 69 00 00    	je     1401277ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x824a>
   140120e09:	48 8d 8c 24 38 02 00 	lea    0x238(%rsp),%rcx
   140120e10:	00 
   140120e11:	c5 f8 77             	vzeroupper
   140120e14:	e8 77 12 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120e19:	48 8d 8c 24 40 02 00 	lea    0x240(%rsp),%rcx
   140120e20:	00 
   140120e21:	48 89 c7             	mov    %rax,%rdi
   140120e24:	e8 67 12 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120e29:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   140120e30:	00 
   140120e31:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140120e38:	00 ff ff 
   140120e3b:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   140120e42:	00 fa ff 
   140120e45:	48 21 d1             	and    %rdx,%rcx
   140120e48:	4c 39 c1             	cmp    %r8,%rcx
   140120e4b:	75 11                	jne    140120e5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18be>
   140120e4d:	48 23 94 24 40 02 00 	and    0x240(%rsp),%rdx
   140120e54:	00 
   140120e55:	48 39 ca             	cmp    %rcx,%rdx
   140120e58:	0f 84 4a 84 00 00    	je     1401292a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d08>
   140120e5e:	48 39 c7             	cmp    %rax,%rdi
   140120e61:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   140120e68:	00 
   140120e69:	48 0f 4d c7          	cmovge %rdi,%rax
   140120e6d:	48 89 c2             	mov    %rax,%rdx
   140120e70:	e8 8b 66 0e 00       	call   140207500 <setun::VMValue::VMValue(long long)>
   140120e75:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   140120e7c:	00 
   140120e7d:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120e84:	00 
   140120e85:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120e8c:	0f 84 8d 48 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   140120e92:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120e96:	48 8d 3d 03 62 29 00 	lea    0x296203(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120e9d:	48 83 c5 01          	add    $0x1,%rbp
   140120ea1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120ea5:	ff e0                	jmp    *%rax
   140120ea7:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120eae:	00 fb ff 
   140120eb1:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   140120eb8:	00 
   140120eb9:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   140120ec0:	00 
   140120ec1:	41 80 fc 02          	cmp    $0x2,%r12b
   140120ec5:	0f 85 4b 9b 00 00    	jne    14012aa16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb476>
   140120ecb:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120ed2:	00 
   140120ed3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120ed9:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   140120ee0:	00 
   140120ee1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120ee6:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   140120eed:	00 
   140120eee:	4c 8b 84 24 48 02 00 	mov    0x248(%rsp),%r8
   140120ef5:	00 
   140120ef6:	48 8b 8c 24 50 02 00 	mov    0x250(%rsp),%rcx
   140120efd:	00 
   140120efe:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140120f05:	00 ff ff 
   140120f08:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140120f0f:	00 f8 ff 
   140120f12:	4c 89 c2             	mov    %r8,%rdx
   140120f15:	48 21 c2             	and    %rax,%rdx
   140120f18:	4c 39 d2             	cmp    %r10,%rdx
   140120f1b:	0f 84 b5 4b 00 00    	je     140125ad6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6536>
   140120f21:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   140120f28:	00 fd ff 
   140120f2b:	4c 39 ca             	cmp    %r9,%rdx
   140120f2e:	0f 84 ac 7f 00 00    	je     140128ee0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9940>
   140120f34:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140120f3b:	00 fc ff 
   140120f3e:	49 39 d0             	cmp    %rdx,%r8
   140120f41:	0f 84 a0 6e 00 00    	je     140127de7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8847>
   140120f47:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140120f4e:	ff f7 ff 
   140120f51:	4d 39 c2             	cmp    %r8,%r10
   140120f54:	0f 83 8d 6e 00 00    	jae    140127de7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8847>
   140120f5a:	48 39 d1             	cmp    %rdx,%rcx
   140120f5d:	0f 84 84 6e 00 00    	je     140127de7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8847>
   140120f63:	49 39 ca             	cmp    %rcx,%r10
   140120f66:	0f 83 7b 6e 00 00    	jae    140127de7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8847>
   140120f6c:	48 21 c8             	and    %rcx,%rax
   140120f6f:	4c 39 c8             	cmp    %r9,%rax
   140120f72:	0f 84 57 aa 00 00    	je     14012b9cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc42f>
   140120f78:	48 8d 8c 24 48 02 00 	lea    0x248(%rsp),%rcx
   140120f7f:	00 
   140120f80:	c5 f8 77             	vzeroupper
   140120f83:	e8 08 11 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120f88:	48 8d 8c 24 50 02 00 	lea    0x250(%rsp),%rcx
   140120f8f:	00 
   140120f90:	48 89 c7             	mov    %rax,%rdi
   140120f93:	e8 f8 10 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   140120f98:	48 39 c7             	cmp    %rax,%rdi
   140120f9b:	40 0f 94 c7          	sete   %dil
   140120f9f:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140120fa6:	00 fa ff 
   140120fa9:	40 0f b6 c7          	movzbl %dil,%eax
   140120fad:	48 01 d0             	add    %rdx,%rax
   140120fb0:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120fb7:	00 
   140120fb8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120fbf:	0f 84 24 47 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140120fc5:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120fc9:	48 8d 3d d0 60 29 00 	lea    0x2960d0(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120fd0:	48 83 c5 01          	add    $0x1,%rbp
   140120fd4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120fd8:	ff e0                	jmp    *%rax
   140120fda:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120fe1:	00 fb ff 
   140120fe4:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140120feb:	00 
   140120fec:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140120ff3:	00 
   140120ff4:	41 80 fc 02          	cmp    $0x2,%r12b
   140120ff8:	0f 85 80 99 00 00    	jne    14012a97e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3de>
   140120ffe:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121005:	00 
   140121006:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012100c:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140121013:	00 
   140121014:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140121019:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140121020:	00 
   140121021:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
   140121028:	00 
   140121029:	48 b9 00 00 00 00 00 	movabs $0xffff000000000000,%rcx
   140121030:	00 ff ff 
   140121033:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012103a:	00 f8 ff 
   14012103d:	48 89 c2             	mov    %rax,%rdx
   140121040:	48 21 ca             	and    %rcx,%rdx
   140121043:	4c 39 c2             	cmp    %r8,%rdx
   140121046:	0f 84 5f 48 00 00    	je     1401258ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x630b>
   14012104c:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140121053:	00 fd ff 
   140121056:	4c 39 c2             	cmp    %r8,%rdx
   140121059:	0f 84 3f 48 00 00    	je     14012589e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62fe>
   14012105f:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140121066:	00 fc ff 
   140121069:	48 39 d0             	cmp    %rdx,%rax
   14012106c:	0f 84 58 6b 00 00    	je     140127bca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x862a>
   140121072:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140121079:	ff f7 ff 
   14012107c:	49 39 c1             	cmp    %rax,%r9
   14012107f:	0f 83 45 6b 00 00    	jae    140127bca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x862a>
   140121085:	48 8b 84 24 60 02 00 	mov    0x260(%rsp),%rax
   14012108c:	00 
   14012108d:	49 39 c1             	cmp    %rax,%r9
   140121090:	0f 83 34 6b 00 00    	jae    140127bca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x862a>
   140121096:	48 39 d0             	cmp    %rdx,%rax
   140121099:	0f 84 2b 6b 00 00    	je     140127bca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x862a>
   14012109f:	48 21 c1             	and    %rax,%rcx
   1401210a2:	4c 39 c1             	cmp    %r8,%rcx
   1401210a5:	0f 84 9c a2 00 00    	je     14012b347 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbda7>
   1401210ab:	48 8d 8c 24 58 02 00 	lea    0x258(%rsp),%rcx
   1401210b2:	00 
   1401210b3:	c5 f8 77             	vzeroupper
   1401210b6:	e8 d5 0f 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   1401210bb:	48 8d 8c 24 60 02 00 	lea    0x260(%rsp),%rcx
   1401210c2:	00 
   1401210c3:	48 89 c7             	mov    %rax,%rdi
   1401210c6:	e8 c5 0f 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   1401210cb:	48 39 c7             	cmp    %rax,%rdi
   1401210ce:	0f 95 c0             	setne  %al
   1401210d1:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401210d8:	00 fa ff 
   1401210db:	0f b6 c0             	movzbl %al,%eax
   1401210de:	48 01 d0             	add    %rdx,%rax
   1401210e1:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401210e8:	00 
   1401210e9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401210f0:	0f 84 29 46 00 00    	je     14012571f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617f>
   1401210f6:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401210fa:	48 8d 3d 9f 5f 29 00 	lea    0x295f9f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121101:	48 83 c5 01          	add    $0x1,%rbp
   140121105:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121109:	ff e0                	jmp    *%rax
   14012110b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121112:	00 fb ff 
   140121115:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   14012111c:	00 
   14012111d:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   140121124:	00 
   140121125:	41 80 fc 02          	cmp    $0x2,%r12b
   140121129:	0f 85 41 9a 00 00    	jne    14012ab70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5d0>
   14012112f:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121136:	00 
   140121137:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012113d:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   140121144:	00 
   140121145:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012114a:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   140121151:	00 
   140121152:	4c 8b 84 24 68 02 00 	mov    0x268(%rsp),%r8
   140121159:	00 
   14012115a:	48 8b 84 24 70 02 00 	mov    0x270(%rsp),%rax
   140121161:	00 
   140121162:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121169:	00 ff ff 
   14012116c:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140121173:	00 f8 ff 
   140121176:	4c 89 c1             	mov    %r8,%rcx
   140121179:	48 21 d1             	and    %rdx,%rcx
   14012117c:	4c 39 d1             	cmp    %r10,%rcx
   14012117f:	0f 84 ad 54 00 00    	je     140126632 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7092>
   140121185:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   14012118c:	00 fd ff 
   14012118f:	4c 39 c9             	cmp    %r9,%rcx
   140121192:	0f 84 d8 7b 00 00    	je     140128d70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97d0>
   140121198:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   14012119f:	ff f7 ff 
   1401211a2:	4c 39 c1             	cmp    %r8,%rcx
   1401211a5:	0f 83 88 6b 00 00    	jae    140127d33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8793>
   1401211ab:	49 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%r10
   1401211b2:	00 fc ff 
   1401211b5:	4d 39 d0             	cmp    %r10,%r8
   1401211b8:	0f 84 75 6b 00 00    	je     140127d33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8793>
   1401211be:	48 39 c1             	cmp    %rax,%rcx
   1401211c1:	0f 83 6c 6b 00 00    	jae    140127d33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8793>
   1401211c7:	4c 39 d0             	cmp    %r10,%rax
   1401211ca:	0f 84 63 6b 00 00    	je     140127d33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8793>
   1401211d0:	48 21 c2             	and    %rax,%rdx
   1401211d3:	4c 39 ca             	cmp    %r9,%rdx
   1401211d6:	0f 84 3a 9e 00 00    	je     14012b016 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba76>
   1401211dc:	48 8d 8c 24 68 02 00 	lea    0x268(%rsp),%rcx
   1401211e3:	00 
   1401211e4:	c5 f8 77             	vzeroupper
   1401211e7:	e8 a4 0e 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   1401211ec:	48 8d 8c 24 70 02 00 	lea    0x270(%rsp),%rcx
   1401211f3:	00 
   1401211f4:	48 89 c7             	mov    %rax,%rdi
   1401211f7:	e8 94 0e 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   1401211fc:	48 39 c7             	cmp    %rax,%rdi
   1401211ff:	0f 9c c0             	setl   %al
   140121202:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140121209:	00 fa ff 
   14012120c:	0f b6 c0             	movzbl %al,%eax
   14012120f:	48 01 d0             	add    %rdx,%rax
   140121212:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140121219:	00 
   14012121a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121221:	0f 84 c2 44 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140121227:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012122b:	48 8d 3d 6e 5e 29 00 	lea    0x295e6e(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121232:	48 83 c5 01          	add    $0x1,%rbp
   140121236:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012123a:	ff e0                	jmp    *%rax
   14012123c:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121243:	00 fb ff 
   140121246:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   14012124d:	00 
   14012124e:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   140121255:	00 
   140121256:	41 80 fc 02          	cmp    $0x2,%r12b
   14012125a:	0f 85 67 96 00 00    	jne    14012a8c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb327>
   140121260:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121267:	00 
   140121268:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012126e:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   140121275:	00 
   140121276:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012127b:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   140121282:	00 
   140121283:	4c 8b 84 24 78 02 00 	mov    0x278(%rsp),%r8
   14012128a:	00 
   14012128b:	48 8b 84 24 80 02 00 	mov    0x280(%rsp),%rax
   140121292:	00 
   140121293:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012129a:	00 ff ff 
   14012129d:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   1401212a4:	00 f8 ff 
   1401212a7:	4c 89 c1             	mov    %r8,%rcx
   1401212aa:	48 21 d1             	and    %rdx,%rcx
   1401212ad:	4c 39 d1             	cmp    %r10,%rcx
   1401212b0:	0f 84 59 54 00 00    	je     14012670f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x716f>
   1401212b6:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   1401212bd:	00 fd ff 
   1401212c0:	4c 39 c9             	cmp    %r9,%rcx
   1401212c3:	0f 84 27 7a 00 00    	je     140128cf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9750>
   1401212c9:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   1401212d0:	00 fc ff 
   1401212d3:	49 39 c8             	cmp    %rcx,%r8
   1401212d6:	0f 84 b1 6a 00 00    	je     140127d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87ed>
   1401212dc:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   1401212e3:	ff f7 ff 
   1401212e6:	4d 39 c2             	cmp    %r8,%r10
   1401212e9:	0f 83 9e 6a 00 00    	jae    140127d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87ed>
   1401212ef:	49 39 c2             	cmp    %rax,%r10
   1401212f2:	0f 83 95 6a 00 00    	jae    140127d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87ed>
   1401212f8:	48 39 c8             	cmp    %rcx,%rax
   1401212fb:	0f 84 8c 6a 00 00    	je     140127d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87ed>
   140121301:	48 21 c2             	and    %rax,%rdx
   140121304:	4c 39 ca             	cmp    %r9,%rdx
   140121307:	0f 84 ee a2 00 00    	je     14012b5fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc05b>
   14012130d:	48 8d 8c 24 78 02 00 	lea    0x278(%rsp),%rcx
   140121314:	00 
   140121315:	c5 f8 77             	vzeroupper
   140121318:	e8 73 0d 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012131d:	48 8d 8c 24 80 02 00 	lea    0x280(%rsp),%rcx
   140121324:	00 
   140121325:	48 89 c7             	mov    %rax,%rdi
   140121328:	e8 63 0d 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012132d:	48 39 c7             	cmp    %rax,%rdi
   140121330:	0f 9e c0             	setle  %al
   140121333:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012133a:	00 fa ff 
   14012133d:	0f b6 c0             	movzbl %al,%eax
   140121340:	48 01 d0             	add    %rdx,%rax
   140121343:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012134a:	00 
   14012134b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121352:	0f 84 91 43 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140121358:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012135c:	48 8d 3d 3d 5d 29 00 	lea    0x295d3d(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121363:	48 83 c5 01          	add    $0x1,%rbp
   140121367:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012136b:	ff e0                	jmp    *%rax
   14012136d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121374:	00 fb ff 
   140121377:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   14012137e:	00 
   14012137f:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   140121386:	00 
   140121387:	41 80 fc 02          	cmp    $0x2,%r12b
   14012138b:	0f 85 47 98 00 00    	jne    14012abd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb638>
   140121391:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121398:	00 
   140121399:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012139f:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   1401213a6:	00 
   1401213a7:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401213ac:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   1401213b3:	00 
   1401213b4:	4c 8b 84 24 88 02 00 	mov    0x288(%rsp),%r8
   1401213bb:	00 
   1401213bc:	48 8b 84 24 90 02 00 	mov    0x290(%rsp),%rax
   1401213c3:	00 
   1401213c4:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401213cb:	00 ff ff 
   1401213ce:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   1401213d5:	00 f8 ff 
   1401213d8:	4c 89 c1             	mov    %r8,%rcx
   1401213db:	48 21 d1             	and    %rdx,%rcx
   1401213de:	4c 39 d1             	cmp    %r10,%rcx
   1401213e1:	0f 84 10 46 00 00    	je     1401259f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6457>
   1401213e7:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   1401213ee:	00 fd ff 
   1401213f1:	4c 39 c9             	cmp    %r9,%rcx
   1401213f4:	0f 84 65 7a 00 00    	je     140128e5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98bf>
   1401213fa:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   140121401:	00 fc ff 
   140121404:	49 39 c8             	cmp    %rcx,%r8
   140121407:	0f 84 8a 68 00 00    	je     140127c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f7>
   14012140d:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140121414:	ff f7 ff 
   140121417:	4d 39 c2             	cmp    %r8,%r10
   14012141a:	0f 83 77 68 00 00    	jae    140127c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f7>
   140121420:	48 39 c8             	cmp    %rcx,%rax
   140121423:	0f 84 6e 68 00 00    	je     140127c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f7>
   140121429:	49 39 c2             	cmp    %rax,%r10
   14012142c:	0f 83 65 68 00 00    	jae    140127c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f7>
   140121432:	48 21 c2             	and    %rax,%rdx
   140121435:	4c 39 ca             	cmp    %r9,%rdx
   140121438:	0f 84 ba a2 00 00    	je     14012b6f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc158>
   14012143e:	48 8d 8c 24 88 02 00 	lea    0x288(%rsp),%rcx
   140121445:	00 
   140121446:	c5 f8 77             	vzeroupper
   140121449:	e8 42 0c 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012144e:	48 8d 8c 24 90 02 00 	lea    0x290(%rsp),%rcx
   140121455:	00 
   140121456:	48 89 c7             	mov    %rax,%rdi
   140121459:	e8 32 0c 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012145e:	48 39 c7             	cmp    %rax,%rdi
   140121461:	0f 9f c0             	setg   %al
   140121464:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012146b:	00 fa ff 
   14012146e:	0f b6 c0             	movzbl %al,%eax
   140121471:	48 01 d0             	add    %rdx,%rax
   140121474:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012147b:	00 
   14012147c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121483:	0f 84 60 42 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140121489:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012148d:	48 8d 3d 0c 5c 29 00 	lea    0x295c0c(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121494:	48 83 c5 01          	add    $0x1,%rbp
   140121498:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012149c:	ff e0                	jmp    *%rax
   14012149e:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401214a5:	00 fb ff 
   1401214a8:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   1401214af:	00 
   1401214b0:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   1401214b7:	00 
   1401214b8:	41 80 fc 02          	cmp    $0x2,%r12b
   1401214bc:	0f 85 8c 94 00 00    	jne    14012a94e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3ae>
   1401214c2:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401214c9:	00 
   1401214ca:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401214d0:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   1401214d7:	00 
   1401214d8:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401214dd:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   1401214e4:	00 
   1401214e5:	4c 8b 84 24 98 02 00 	mov    0x298(%rsp),%r8
   1401214ec:	00 
   1401214ed:	48 8b 84 24 a0 02 00 	mov    0x2a0(%rsp),%rax
   1401214f4:	00 
   1401214f5:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401214fc:	00 ff ff 
   1401214ff:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140121506:	00 f8 ff 
   140121509:	4c 89 c1             	mov    %r8,%rcx
   14012150c:	48 21 d1             	and    %rdx,%rcx
   14012150f:	4c 39 d1             	cmp    %r10,%rcx
   140121512:	0f 84 c7 4b 00 00    	je     1401260df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b3f>
   140121518:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   14012151f:	00 fd ff 
   140121522:	4c 39 c9             	cmp    %r9,%rcx
   140121525:	0f 84 46 77 00 00    	je     140128c71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96d1>
   14012152b:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   140121532:	00 fc ff 
   140121535:	49 39 c8             	cmp    %rcx,%r8
   140121538:	0f 84 22 68 00 00    	je     140127d60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87c0>
   14012153e:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140121545:	ff f7 ff 
   140121548:	4d 39 c2             	cmp    %r8,%r10
   14012154b:	0f 83 0f 68 00 00    	jae    140127d60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87c0>
   140121551:	49 39 c2             	cmp    %rax,%r10
   140121554:	0f 83 06 68 00 00    	jae    140127d60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87c0>
   14012155a:	48 39 c8             	cmp    %rcx,%rax
   14012155d:	0f 84 fd 67 00 00    	je     140127d60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87c0>
   140121563:	48 21 c2             	and    %rax,%rdx
   140121566:	4c 39 ca             	cmp    %r9,%rdx
   140121569:	0f 84 84 a3 00 00    	je     14012b8f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc353>
   14012156f:	48 8d 8c 24 98 02 00 	lea    0x298(%rsp),%rcx
   140121576:	00 
   140121577:	c5 f8 77             	vzeroupper
   14012157a:	e8 11 0b 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012157f:	48 8d 8c 24 a0 02 00 	lea    0x2a0(%rsp),%rcx
   140121586:	00 
   140121587:	48 89 c7             	mov    %rax,%rdi
   14012158a:	e8 01 0b 0f 00       	call   140212090 <setun::VMValue::as_int() const>
   14012158f:	48 39 c7             	cmp    %rax,%rdi
   140121592:	0f 9d c0             	setge  %al
   140121595:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012159c:	00 fa ff 
   14012159f:	0f b6 c0             	movzbl %al,%eax
   1401215a2:	48 01 d0             	add    %rdx,%rax
   1401215a5:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401215ac:	00 
   1401215ad:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401215b4:	0f 84 2f 41 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   1401215ba:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401215be:	48 8d 3d db 5a 29 00 	lea    0x295adb(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401215c5:	48 83 c5 01          	add    $0x1,%rbp
   1401215c9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401215cd:	ff e0                	jmp    *%rax
   1401215cf:	44 0f b7 75 00       	movzwl 0x0(%rbp),%r14d
   1401215d4:	66 45 85 f6          	test   %r14w,%r14w
   1401215d8:	0f 88 2a 96 00 00    	js     14012ac08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb668>
   1401215de:	41 0f bf c6          	movswl %r14w,%eax
   1401215e2:	83 c0 02             	add    $0x2,%eax
   1401215e5:	48 98                	cltq
   1401215e7:	4c 8d 74 05 00       	lea    0x0(%rbp,%rax,1),%r14
   1401215ec:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401215f3:	0f 84 38 41 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   1401215f9:	41 0f b6 06          	movzbl (%r14),%eax
   1401215fd:	48 8d 3d 9c 5a 29 00 	lea    0x295a9c(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121604:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121608:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012160b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121612:	00 fb ff 
   140121615:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140121619:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   14012161d:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   140121624:	00 
   140121625:	41 80 fc 01          	cmp    $0x1,%r12b
   140121629:	0f 85 7f 94 00 00    	jne    14012aaae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb50e>
   14012162f:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121636:	00 
   140121637:	45 31 e4             	xor    %r12d,%r12d
   14012163a:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   140121641:	00 
   140121642:	48 8d 8c 24 a8 02 00 	lea    0x2a8(%rsp),%rcx
   140121649:	00 
   14012164a:	c5 f8 77             	vzeroupper
   14012164d:	e8 ce 10 0f 00       	call   140212720 <setun::VMValue::as_bool() const>
   140121652:	89 c2                	mov    %eax,%edx
   140121654:	48 0f bf c7          	movswq %di,%rax
   140121658:	4c 01 f0             	add    %r14,%rax
   14012165b:	84 d2                	test   %dl,%dl
   14012165d:	4c 0f 44 f0          	cmove  %rax,%r14
   140121661:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121668:	0f 84 a2 40 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   14012166e:	41 0f b6 06          	movzbl (%r14),%eax
   140121672:	48 8d 3d 27 5a 29 00 	lea    0x295a27(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121679:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012167d:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140121680:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140121684:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140121688:	48 83 c5 06          	add    $0x6,%rbp
   14012168c:	44 0f b7 75 fc       	movzwl -0x4(%rbp),%r14d
   140121691:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   140121696:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012169d:	00 fb ff 
   1401216a0:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   1401216a7:	00 
   1401216a8:	41 80 fc 01          	cmp    $0x1,%r12b
   1401216ac:	0f 85 7d 92 00 00    	jne    14012a92f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb38f>
   1401216b2:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401216b9:	00 
   1401216ba:	45 31 e4             	xor    %r12d,%r12d
   1401216bd:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   1401216c4:	00 
   1401216c5:	48 8b 84 24 b0 02 00 	mov    0x2b0(%rsp),%rax
   1401216cc:	00 
   1401216cd:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401216d4:	00 ff ff 
   1401216d7:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   1401216de:	00 fd ff 
   1401216e1:	48 21 c2             	and    %rax,%rdx
   1401216e4:	48 39 ca             	cmp    %rcx,%rdx
   1401216e7:	0f 84 d9 56 00 00    	je     140126dc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7826>
   1401216ed:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   1401216f4:	00 fc ff 
   1401216f7:	48 39 d0             	cmp    %rdx,%rax
   1401216fa:	74 13                	je     14012170f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x216f>
   1401216fc:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140121703:	ff f7 ff 
   140121706:	48 39 c2             	cmp    %rax,%rdx
   140121709:	0f 82 c5 56 00 00    	jb     140126dd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7834>
   14012170f:	48 8d 8c 24 b0 02 00 	lea    0x2b0(%rsp),%rcx
   140121716:	00 
   140121717:	c5 f8 77             	vzeroupper
   14012171a:	e8 31 21 0f 00       	call   140213850 <setun::VMValue::as_float() const>
   14012171f:	c5 fb 10 0d 19 23 23 	vmovsd 0x232319(%rip),%xmm1        # 140353a40 <CSWTCH.2799+0x200>
   140121726:	00 
   140121727:	c5 f9 2f c8          	vcomisd %xmm0,%xmm1
   14012172b:	0f 87 47 60 00 00    	ja     140127778 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81d8>
   140121731:	c5 f9 2f 05 0f 23 23 	vcomisd 0x23230f(%rip),%xmm0        # 140353a48 <CSWTCH.2799+0x208>
   140121738:	00 
   140121739:	0f 87 b4 56 00 00    	ja     140126df3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7853>
   14012173f:	49 0f bf c6          	movswq %r14w,%rax
   140121743:	4c 8d 74 05 fe       	lea    -0x2(%rbp,%rax,1),%r14
   140121748:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012174f:	0f 84 bb 3f 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   140121755:	41 0f b6 06          	movzbl (%r14),%eax
   140121759:	48 8d 3d 40 59 29 00 	lea    0x295940(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121760:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121764:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140121767:	41 80 fc 02          	cmp    $0x2,%r12b
   14012176b:	0f 84 19 56 00 00    	je     140126d8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77ea>
   140121771:	41 80 fc 01          	cmp    $0x1,%r12b
   140121775:	0f 84 0f 6d 00 00    	je     14012848a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8eea>
   14012177b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121782:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121789:	c5 f8 77             	vzeroupper
   14012178c:	48 29 d6             	sub    %rdx,%rsi
   14012178f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121794:	48 29 d0             	sub    %rdx,%rax
   140121797:	48 89 f7             	mov    %rsi,%rdi
   14012179a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401217a1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401217a5:	48 39 f0             	cmp    %rsi,%rax
   1401217a8:	0f 82 6c 6a 00 00    	jb     14012821a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c7a>
   1401217ae:	c5 f9 6f 05 4a 22 23 	vmovdqa 0x23224a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401217b5:	00 
   1401217b6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401217bd:	4c 89 fa             	mov    %r15,%rdx
   1401217c0:	48 89 d9             	mov    %rbx,%rcx
   1401217c3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401217ca:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401217d1:	00 
   1401217d2:	e8 49 04 fe ff       	call   140101c20 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   1401217d7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401217de:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401217e5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401217ec:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401217f1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401217f5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401217fc:	4d 85 ed             	test   %r13,%r13
   1401217ff:	74 0d                	je     14012180e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x226e>
   140121801:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121806:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012180d:	00 
   14012180e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121815:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012181c:	0f 84 9c 04 00 00    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121822:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121827:	41 0f b6 06          	movzbl (%r14),%eax
   14012182b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012182f:	45 31 e4             	xor    %r12d,%r12d
   140121832:	48 8d 3d 67 58 29 00 	lea    0x295867(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121839:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012183d:	ff e0                	jmp    *%rax
   14012183f:	41 80 fc 02          	cmp    $0x2,%r12b
   140121843:	0f 84 1f 52 00 00    	je     140126a68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74c8>
   140121849:	41 80 fc 01          	cmp    $0x1,%r12b
   14012184d:	0f 84 6a 6c 00 00    	je     1401284bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f1d>
   140121853:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012185a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121861:	c5 f8 77             	vzeroupper
   140121864:	48 29 d6             	sub    %rdx,%rsi
   140121867:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012186c:	48 29 d0             	sub    %rdx,%rax
   14012186f:	48 89 f7             	mov    %rsi,%rdi
   140121872:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121879:	48 c1 ff 03          	sar    $0x3,%rdi
   14012187d:	48 39 f0             	cmp    %rsi,%rax
   140121880:	0f 82 a9 69 00 00    	jb     14012822f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c8f>
   140121886:	c5 f9 6f 05 72 21 23 	vmovdqa 0x232172(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012188d:	00 
   14012188e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121895:	4c 89 fa             	mov    %r15,%rdx
   140121898:	48 89 d9             	mov    %rbx,%rcx
   14012189b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401218a2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401218a9:	00 
   1401218aa:	e8 91 14 fe ff       	call   140102d40 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   1401218af:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401218b6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401218bd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401218c4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401218c9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401218cd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401218d4:	4d 85 ed             	test   %r13,%r13
   1401218d7:	74 0d                	je     1401218e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2346>
   1401218d9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401218de:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401218e5:	00 
   1401218e6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401218ed:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401218f4:	0f 84 c4 03 00 00    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401218fa:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401218ff:	41 0f b6 06          	movzbl (%r14),%eax
   140121903:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121907:	45 31 e4             	xor    %r12d,%r12d
   14012190a:	48 8d 3d 8f 57 29 00 	lea    0x29578f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121911:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121915:	ff e0                	jmp    *%rax
   140121917:	41 80 fc 02          	cmp    $0x2,%r12b
   14012191b:	0f 84 83 51 00 00    	je     140126aa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7504>
   140121921:	41 80 fc 01          	cmp    $0x1,%r12b
   140121925:	0f 84 c5 6b 00 00    	je     1401284f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f50>
   14012192b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121932:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121939:	c5 f8 77             	vzeroupper
   14012193c:	48 29 d6             	sub    %rdx,%rsi
   14012193f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121944:	48 29 d0             	sub    %rdx,%rax
   140121947:	48 89 f7             	mov    %rsi,%rdi
   14012194a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121951:	48 c1 ff 03          	sar    $0x3,%rdi
   140121955:	48 39 f0             	cmp    %rsi,%rax
   140121958:	0f 82 e6 68 00 00    	jb     140128244 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ca4>
   14012195e:	c5 f9 6f 05 9a 20 23 	vmovdqa 0x23209a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121965:	00 
   140121966:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012196d:	4c 89 fa             	mov    %r15,%rdx
   140121970:	48 89 d9             	mov    %rbx,%rcx
   140121973:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012197a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121981:	00 
   140121982:	e8 59 87 fe ff       	call   14010a0e0 <setun::VM::handle_print(setun::Chunk const&)>
   140121987:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012198e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121995:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012199c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401219a1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401219a5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401219ac:	4d 85 ed             	test   %r13,%r13
   1401219af:	74 0d                	je     1401219be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x241e>
   1401219b1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401219b6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401219bd:	00 
   1401219be:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401219c5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401219cc:	0f 84 ec 02 00 00    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401219d2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401219d7:	41 0f b6 06          	movzbl (%r14),%eax
   1401219db:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401219df:	45 31 e4             	xor    %r12d,%r12d
   1401219e2:	48 8d 3d b7 56 29 00 	lea    0x2956b7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401219e9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401219ed:	ff e0                	jmp    *%rax
   1401219ef:	41 80 fc 02          	cmp    $0x2,%r12b
   1401219f3:	0f 84 bd 54 00 00    	je     140126eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7916>
   1401219f9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401219fd:	0f 84 86 6b 00 00    	je     140128589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fe9>
   140121a03:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121a0a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121a11:	c5 f8 77             	vzeroupper
   140121a14:	48 29 d6             	sub    %rdx,%rsi
   140121a17:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121a1c:	48 29 d0             	sub    %rdx,%rax
   140121a1f:	48 89 f7             	mov    %rsi,%rdi
   140121a22:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121a29:	48 c1 ff 03          	sar    $0x3,%rdi
   140121a2d:	48 39 f0             	cmp    %rsi,%rax
   140121a30:	0f 82 23 68 00 00    	jb     140128259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cb9>
   140121a36:	c5 f9 6f 05 c2 1f 23 	vmovdqa 0x231fc2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121a3d:	00 
   140121a3e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121a45:	4c 89 fa             	mov    %r15,%rdx
   140121a48:	48 89 d9             	mov    %rbx,%rcx
   140121a4b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121a52:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121a59:	00 
   140121a5a:	e8 e1 8a fe ff       	call   14010a540 <setun::VM::handle_println(setun::Chunk const&)>
   140121a5f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121a66:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121a6d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121a74:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121a79:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121a7d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121a84:	4d 85 ed             	test   %r13,%r13
   140121a87:	74 0d                	je     140121a96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24f6>
   140121a89:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121a8e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121a95:	00 
   140121a96:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121a9d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121aa4:	0f 84 14 02 00 00    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121aaa:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121aaf:	41 0f b6 06          	movzbl (%r14),%eax
   140121ab3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121ab7:	45 31 e4             	xor    %r12d,%r12d
   140121aba:	48 8d 3d df 55 29 00 	lea    0x2955df(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121ac1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121ac5:	ff e0                	jmp    *%rax
   140121ac7:	41 80 fc 02          	cmp    $0x2,%r12b
   140121acb:	0f 84 21 54 00 00    	je     140126ef2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7952>
   140121ad1:	41 80 fc 01          	cmp    $0x1,%r12b
   140121ad5:	0f 84 47 6b 00 00    	je     140128622 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9082>
   140121adb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121ae2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121ae9:	c5 f8 77             	vzeroupper
   140121aec:	48 29 d6             	sub    %rdx,%rsi
   140121aef:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121af4:	48 29 d0             	sub    %rdx,%rax
   140121af7:	48 89 f7             	mov    %rsi,%rdi
   140121afa:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121b01:	48 c1 ff 03          	sar    $0x3,%rdi
   140121b05:	48 39 f0             	cmp    %rsi,%rax
   140121b08:	0f 82 31 64 00 00    	jb     140127f3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x899f>
   140121b0e:	c5 f9 6f 05 ea 1e 23 	vmovdqa 0x231eea(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121b15:	00 
   140121b16:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121b1d:	4c 89 fa             	mov    %r15,%rdx
   140121b20:	48 89 d9             	mov    %rbx,%rcx
   140121b23:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121b2a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121b31:	00 
   140121b32:	e8 b9 91 fe ff       	call   14010acf0 <setun::VM::handle_trace(setun::Chunk const&)>
   140121b37:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121b3e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121b45:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121b4c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121b51:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121b55:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121b5c:	4d 85 ed             	test   %r13,%r13
   140121b5f:	74 0d                	je     140121b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25ce>
   140121b61:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121b66:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121b6d:	00 
   140121b6e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121b75:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121b7c:	0f 84 3c 01 00 00    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121b82:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121b87:	41 0f b6 06          	movzbl (%r14),%eax
   140121b8b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121b8f:	45 31 e4             	xor    %r12d,%r12d
   140121b92:	48 8d 3d 07 55 29 00 	lea    0x295507(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121b99:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121b9d:	ff e0                	jmp    *%rax
   140121b9f:	41 80 fc 02          	cmp    $0x2,%r12b
   140121ba3:	0f 84 5a 48 00 00    	je     140126403 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e63>
   140121ba9:	41 80 fc 01          	cmp    $0x1,%r12b
   140121bad:	0f 84 a2 6a 00 00    	je     140128655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90b5>
   140121bb3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121bba:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121bc1:	c5 f8 77             	vzeroupper
   140121bc4:	48 29 d6             	sub    %rdx,%rsi
   140121bc7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121bcc:	48 29 d0             	sub    %rdx,%rax
   140121bcf:	48 89 f7             	mov    %rsi,%rdi
   140121bd2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121bd9:	48 c1 ff 03          	sar    $0x3,%rdi
   140121bdd:	48 39 f0             	cmp    %rsi,%rax
   140121be0:	0f 82 b2 66 00 00    	jb     140128298 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cf8>
   140121be6:	c5 f9 6f 05 12 1e 23 	vmovdqa 0x231e12(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121bed:	00 
   140121bee:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121bf5:	4c 89 fa             	mov    %r15,%rdx
   140121bf8:	48 89 d9             	mov    %rbx,%rcx
   140121bfb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121c02:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121c09:	00 
   140121c0a:	e8 71 c1 fe ff       	call   14010dd80 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   140121c0f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121c16:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121c1d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121c24:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121c29:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121c2d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121c34:	4d 85 ed             	test   %r13,%r13
   140121c37:	74 0d                	je     140121c46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a6>
   140121c39:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121c3e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121c45:	00 
   140121c46:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121c4d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121c54:	74 68                	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121c56:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121c5b:	41 0f b6 06          	movzbl (%r14),%eax
   140121c5f:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121c63:	45 31 e4             	xor    %r12d,%r12d
   140121c66:	48 8d 3d 33 54 29 00 	lea    0x295433(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121c6d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121c71:	ff e0                	jmp    *%rax
   140121c73:	c6 83 40 10 00 00 00 	movb   $0x0,0x1040(%rbx)
   140121c7a:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121c81:	48 89 f1             	mov    %rsi,%rcx
   140121c84:	49 89 ee             	mov    %rbp,%r14
   140121c87:	c5 f8 77             	vzeroupper
   140121c8a:	41 80 fc 02          	cmp    $0x2,%r12b
   140121c8e:	0f 85 0c 3a 00 00    	jne    1401256a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6100>
   140121c94:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121c9b:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   140121c9f:	48 3b 74 24 38       	cmp    0x38(%rsp),%rsi
   140121ca4:	0f 83 7f 61 00 00    	jae    140127e29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8889>
   140121caa:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   140121caf:	48 89 39             	mov    %rdi,(%rcx)
   140121cb2:	4c 8b 84 24 80 01 00 	mov    0x180(%rsp),%r8
   140121cb9:	00 
   140121cba:	4c 89 41 08          	mov    %r8,0x8(%rcx)
   140121cbe:	48 29 d6             	sub    %rdx,%rsi
   140121cc1:	4c 89 f1             	mov    %r14,%rcx
   140121cc4:	48 29 d0             	sub    %rdx,%rax
   140121cc7:	48 2b 4c 24 30       	sub    0x30(%rsp),%rcx
   140121ccc:	48 89 f5             	mov    %rsi,%rbp
   140121ccf:	48 89 8b 38 10 00 00 	mov    %rcx,0x1038(%rbx)
   140121cd6:	48 c1 fd 03          	sar    $0x3,%rbp
   140121cda:	48 39 f0             	cmp    %rsi,%rax
   140121cdd:	0f 82 9d 39 00 00    	jb     140125680 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60e0>
   140121ce3:	c5 f9 6f 05 15 1d 23 	vmovdqa 0x231d15(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121cea:	00 
   140121ceb:	48 89 ab 60 10 00 00 	mov    %rbp,0x1060(%rbx)
   140121cf2:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121cf9:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121d00:	00 
   140121d01:	c5 f8 28 b4 24 40 08 	vmovaps 0x840(%rsp),%xmm6
   140121d08:	00 00 
   140121d0a:	c5 f8 28 bc 24 50 08 	vmovaps 0x850(%rsp),%xmm7
   140121d11:	00 00 
   140121d13:	c5 78 28 84 24 60 08 	vmovaps 0x860(%rsp),%xmm8
   140121d1a:	00 00 
   140121d1c:	c5 78 28 8c 24 70 08 	vmovaps 0x870(%rsp),%xmm9
   140121d23:	00 00 
   140121d25:	c5 78 28 94 24 80 08 	vmovaps 0x880(%rsp),%xmm10
   140121d2c:	00 00 
   140121d2e:	c5 78 28 9c 24 90 08 	vmovaps 0x890(%rsp),%xmm11
   140121d35:	00 00 
   140121d37:	c5 78 28 a4 24 a0 08 	vmovaps 0x8a0(%rsp),%xmm12
   140121d3e:	00 00 
   140121d40:	c5 78 28 ac 24 b0 08 	vmovaps 0x8b0(%rsp),%xmm13
   140121d47:	00 00 
   140121d49:	c5 78 28 b4 24 c0 08 	vmovaps 0x8c0(%rsp),%xmm14
   140121d50:	00 00 
   140121d52:	c5 78 28 bc 24 d0 08 	vmovaps 0x8d0(%rsp),%xmm15
   140121d59:	00 00 
   140121d5b:	48 81 c4 e8 08 00 00 	add    $0x8e8,%rsp
   140121d62:	5b                   	pop    %rbx
   140121d63:	5e                   	pop    %rsi
   140121d64:	5f                   	pop    %rdi
   140121d65:	5d                   	pop    %rbp
   140121d66:	41 5c                	pop    %r12
   140121d68:	41 5d                	pop    %r13
   140121d6a:	41 5e                	pop    %r14
   140121d6c:	41 5f                	pop    %r15
   140121d6e:	c3                   	ret
   140121d6f:	41 80 fc 02          	cmp    $0x2,%r12b
   140121d73:	0f 84 c6 46 00 00    	je     14012643f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e9f>
   140121d79:	41 80 fc 01          	cmp    $0x1,%r12b
   140121d7d:	0f 84 39 68 00 00    	je     1401285bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x901c>
   140121d83:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121d8a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121d91:	c5 f8 77             	vzeroupper
   140121d94:	48 29 d6             	sub    %rdx,%rsi
   140121d97:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121d9c:	48 29 d0             	sub    %rdx,%rax
   140121d9f:	48 89 f7             	mov    %rsi,%rdi
   140121da2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121da9:	48 c1 ff 03          	sar    $0x3,%rdi
   140121dad:	48 39 f0             	cmp    %rsi,%rax
   140121db0:	0f 82 b8 64 00 00    	jb     14012826e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cce>
   140121db6:	c5 f9 6f 05 42 1c 23 	vmovdqa 0x231c42(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121dbd:	00 
   140121dbe:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121dc5:	4c 89 fa             	mov    %r15,%rdx
   140121dc8:	48 89 d9             	mov    %rbx,%rcx
   140121dcb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121dd2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121dd9:	00 
   140121dda:	e8 81 98 fe ff       	call   14010b660 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140121ddf:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121de6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121ded:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121df4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121df9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121dfd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121e04:	4d 85 ed             	test   %r13,%r13
   140121e07:	74 0d                	je     140121e16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2876>
   140121e09:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121e0e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121e15:	00 
   140121e16:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121e1d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121e24:	0f 84 94 fe ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121e2a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121e2f:	41 0f b6 06          	movzbl (%r14),%eax
   140121e33:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121e37:	45 31 e4             	xor    %r12d,%r12d
   140121e3a:	48 8d 3d 5f 52 29 00 	lea    0x29525f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121e41:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121e45:	ff e0                	jmp    *%rax
   140121e47:	41 80 fc 02          	cmp    $0x2,%r12b
   140121e4b:	0f 84 57 4d 00 00    	je     140126ba8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7608>
   140121e51:	41 80 fc 01          	cmp    $0x1,%r12b
   140121e55:	0f 84 fb 66 00 00    	je     140128556 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fb6>
   140121e5b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121e62:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121e69:	c5 f8 77             	vzeroupper
   140121e6c:	48 29 d6             	sub    %rdx,%rsi
   140121e6f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121e74:	48 29 d0             	sub    %rdx,%rax
   140121e77:	48 89 f7             	mov    %rsi,%rdi
   140121e7a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121e81:	48 c1 ff 03          	sar    $0x3,%rdi
   140121e85:	48 39 f0             	cmp    %rsi,%rax
   140121e88:	0f 82 f5 63 00 00    	jb     140128283 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ce3>
   140121e8e:	c5 f9 6f 05 6a 1b 23 	vmovdqa 0x231b6a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121e95:	00 
   140121e96:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121e9d:	4c 89 fa             	mov    %r15,%rdx
   140121ea0:	48 89 d9             	mov    %rbx,%rcx
   140121ea3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121eaa:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121eb1:	00 
   140121eb2:	e8 e9 45 fe ff       	call   1401064a0 <setun::VM::handle_push_string(setun::Chunk const&)>
   140121eb7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121ebe:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121ec5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121ecc:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121ed1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121ed5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121edc:	4d 85 ed             	test   %r13,%r13
   140121edf:	74 0d                	je     140121eee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x294e>
   140121ee1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121ee6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121eed:	00 
   140121eee:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121ef5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121efc:	0f 84 bc fd ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121f02:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121f07:	41 0f b6 06          	movzbl (%r14),%eax
   140121f0b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121f0f:	45 31 e4             	xor    %r12d,%r12d
   140121f12:	48 8d 3d 87 51 29 00 	lea    0x295187(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121f19:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121f1d:	ff e0                	jmp    *%rax
   140121f1f:	41 80 fc 02          	cmp    $0x2,%r12b
   140121f23:	0f 84 71 4d 00 00    	je     140126c9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76fa>
   140121f29:	41 80 fc 01          	cmp    $0x1,%r12b
   140121f2d:	0f 84 46 68 00 00    	je     140128779 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91d9>
   140121f33:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121f3a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121f41:	c5 f8 77             	vzeroupper
   140121f44:	48 29 d6             	sub    %rdx,%rsi
   140121f47:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140121f4c:	48 29 d0             	sub    %rdx,%rax
   140121f4f:	48 89 f7             	mov    %rsi,%rdi
   140121f52:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121f59:	48 c1 ff 03          	sar    $0x3,%rdi
   140121f5d:	48 39 f0             	cmp    %rsi,%rax
   140121f60:	0f 82 75 62 00 00    	jb     1401281db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c3b>
   140121f66:	c5 f9 6f 05 92 1a 23 	vmovdqa 0x231a92(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140121f6d:	00 
   140121f6e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121f75:	4c 89 fa             	mov    %r15,%rdx
   140121f78:	48 89 d9             	mov    %rbx,%rcx
   140121f7b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121f82:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121f89:	00 
   140121f8a:	e8 81 4b fe ff       	call   140106b10 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140121f8f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121f96:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121f9d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121fa4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140121fa9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121fad:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140121fb4:	4d 85 ed             	test   %r13,%r13
   140121fb7:	74 0d                	je     140121fc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a26>
   140121fb9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121fbe:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121fc5:	00 
   140121fc6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121fcd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121fd4:	0f 84 e4 fc ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140121fda:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121fdf:	41 0f b6 06          	movzbl (%r14),%eax
   140121fe3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140121fe7:	45 31 e4             	xor    %r12d,%r12d
   140121fea:	48 8d 3d af 50 29 00 	lea    0x2950af(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121ff1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121ff5:	ff e0                	jmp    *%rax
   140121ff7:	41 80 fc 02          	cmp    $0x2,%r12b
   140121ffb:	0f 84 29 48 00 00    	je     14012682a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x728a>
   140122001:	41 80 fc 01          	cmp    $0x1,%r12b
   140122005:	0f 84 04 6b 00 00    	je     140128b0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x956f>
   14012200b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122012:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122019:	c5 f8 77             	vzeroupper
   14012201c:	48 29 d6             	sub    %rdx,%rsi
   14012201f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122024:	48 29 d0             	sub    %rdx,%rax
   140122027:	48 89 f7             	mov    %rsi,%rdi
   14012202a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122031:	48 c1 ff 03          	sar    $0x3,%rdi
   140122035:	48 39 f0             	cmp    %rsi,%rax
   140122038:	0f 82 d3 5f 00 00    	jb     140128011 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a71>
   14012203e:	c5 f9 6f 05 ba 19 23 	vmovdqa 0x2319ba(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122045:	00 
   140122046:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012204d:	4c 89 fa             	mov    %r15,%rdx
   140122050:	48 89 d9             	mov    %rbx,%rcx
   140122053:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012205a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122061:	00 
   140122062:	e8 c9 90 fe ff       	call   14010b130 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140122067:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012206e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122075:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012207c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122081:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122085:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012208c:	4d 85 ed             	test   %r13,%r13
   14012208f:	74 0d                	je     14012209e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2afe>
   140122091:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122096:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012209d:	00 
   14012209e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401220a5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401220ac:	0f 84 0c fc ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401220b2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401220b7:	41 0f b6 06          	movzbl (%r14),%eax
   1401220bb:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401220bf:	45 31 e4             	xor    %r12d,%r12d
   1401220c2:	48 8d 3d d7 4f 29 00 	lea    0x294fd7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401220c9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401220cd:	ff e0                	jmp    *%rax
   1401220cf:	41 80 fc 02          	cmp    $0x2,%r12b
   1401220d3:	0f 84 fd 4b 00 00    	je     140126cd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7736>
   1401220d9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401220dd:	0f 84 fc 66 00 00    	je     1401287df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x923f>
   1401220e3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401220ea:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401220f1:	c5 f8 77             	vzeroupper
   1401220f4:	48 29 d6             	sub    %rdx,%rsi
   1401220f7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401220fc:	48 29 d0             	sub    %rdx,%rax
   1401220ff:	48 89 f7             	mov    %rsi,%rdi
   140122102:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122109:	48 c1 ff 03          	sar    $0x3,%rdi
   14012210d:	48 39 f0             	cmp    %rsi,%rax
   140122110:	0f 82 10 5f 00 00    	jb     140128026 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a86>
   140122116:	c5 f9 6f 05 e2 18 23 	vmovdqa 0x2318e2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012211d:	00 
   14012211e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122125:	4c 89 fa             	mov    %r15,%rdx
   140122128:	48 89 d9             	mov    %rbx,%rcx
   14012212b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122132:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122139:	00 
   14012213a:	e8 41 15 fe ff       	call   140103680 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   14012213f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122146:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012214d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122154:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122159:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012215d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122164:	4d 85 ed             	test   %r13,%r13
   140122167:	74 0d                	je     140122176 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bd6>
   140122169:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012216e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122175:	00 
   140122176:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012217d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122184:	0f 84 34 fb ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012218a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012218f:	41 0f b6 06          	movzbl (%r14),%eax
   140122193:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122197:	45 31 e4             	xor    %r12d,%r12d
   14012219a:	48 8d 3d ff 4e 29 00 	lea    0x294eff(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401221a1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401221a5:	ff e0                	jmp    *%rax
   1401221a7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401221ab:	0f 84 6b 49 00 00    	je     140126b1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x757c>
   1401221b1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401221b5:	0f 84 66 65 00 00    	je     140128721 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9181>
   1401221bb:	49 8b 97 88 00 00 00 	mov    0x88(%r15),%rdx
   1401221c2:	49 8b 8f 80 00 00 00 	mov    0x80(%r15),%rcx
   1401221c9:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   1401221cd:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401221d1:	48 39 d1             	cmp    %rdx,%rcx
   1401221d4:	0f 84 1a 61 00 00    	je     1401282f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d54>
   1401221da:	48 29 ca             	sub    %rcx,%rdx
   1401221dd:	48 c1 fa 02          	sar    $0x2,%rdx
   1401221e1:	48 39 d0             	cmp    %rdx,%rax
   1401221e4:	0f 83 53 99 00 00    	jae    14012bb3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc59d>
   1401221ea:	8b 3c 81             	mov    (%rcx,%rax,4),%edi
   1401221ed:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%rsp)
   1401221f4:	49 8b 8f 98 00 00 00 	mov    0x98(%r15),%rcx
   1401221fb:	49 8b 97 a0 00 00 00 	mov    0xa0(%r15),%rdx
   140122202:	4c 8d 75 03          	lea    0x3(%rbp),%r14
   140122206:	41 b8 20 00 00 00    	mov    $0x20,%r8d
   14012220c:	0f b6 7d 02          	movzbl 0x2(%rbp),%edi
   140122210:	48 29 ca             	sub    %rcx,%rdx
   140122213:	48 d1 fa             	sar    $1,%rdx
   140122216:	40 88 bc 24 a0 00 00 	mov    %dil,0xa0(%rsp)
   14012221d:	00 
   14012221e:	48 39 d0             	cmp    %rdx,%rax
   140122221:	73 0b                	jae    14012222e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c8e>
   140122223:	0f b7 0c 41          	movzwl (%rcx,%rax,2),%ecx
   140122227:	66 85 c9             	test   %cx,%cx
   14012222a:	4c 0f 45 c1          	cmovne %rcx,%r8
   14012222e:	48 8d 57 08          	lea    0x8(%rdi),%rdx
   140122232:	4c 89 c1             	mov    %r8,%rcx
   140122235:	4c 39 c2             	cmp    %r8,%rdx
   140122238:	48 0f 43 ca          	cmovae %rdx,%rcx
   14012223c:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   140122241:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140122248:	0f 84 ee 57 00 00    	je     140127a3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x849c>
   14012224e:	48 8b 93 d8 52 01 00 	mov    0x152d8(%rbx),%rdx
   140122255:	48 85 d2             	test   %rdx,%rdx
   140122258:	0f 84 de 57 00 00    	je     140127a3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x849c>
   14012225e:	48 23 83 f8 52 01 00 	and    0x152f8(%rbx),%rax
   140122265:	48 c1 e0 05          	shl    $0x5,%rax
   140122269:	48 01 d0             	add    %rdx,%rax
   14012226c:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   140122273:	00 
   140122274:	48 83 38 00          	cmpq   $0x0,(%rax)
   140122278:	0f 84 d6 56 00 00    	je     140127954 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83b4>
   14012227e:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140122285:	0f 84 f4 74 00 00    	je     14012977f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1df>
   14012228b:	48 8b 83 68 52 01 00 	mov    0x15268(%rbx),%rax
   140122292:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140122299:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   1401222a0:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   1401222a7:	00 
   1401222a8:	48 01 c8             	add    %rcx,%rax
   1401222ab:	48 c1 fa 03          	sar    $0x3,%rdx
   1401222af:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   1401222b6:	48 83 c0 40          	add    $0x40,%rax
   1401222ba:	48 39 d0             	cmp    %rdx,%rax
   1401222bd:	0f 83 71 d4 00 00    	jae    14012f734 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10194>
   1401222c3:	c5 f8 77             	vzeroupper
   1401222c6:	80 bc 24 a0 00 00 00 	cmpb   $0x0,0xa0(%rsp)
   1401222cd:	00 
   1401222ce:	0f 84 23 a6 00 00    	je     14012c8f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd357>
   1401222d4:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   1401222db:	00 
   1401222dc:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   1401222e3:	48 89 f9             	mov    %rdi,%rcx
   1401222e6:	48 f7 d9             	neg    %rcx
   1401222e9:	48 01 f8             	add    %rdi,%rax
   1401222ec:	48 c1 e1 03          	shl    $0x3,%rcx
   1401222f0:	4d 8d 0c c0          	lea    (%r8,%rax,8),%r9
   1401222f4:	31 c0                	xor    %eax,%eax
   1401222f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   1401222fd:	00 00 00 
   140122300:	48 8b 54 06 f8       	mov    -0x8(%rsi,%rax,1),%rdx
   140122305:	49 89 54 01 f8       	mov    %rdx,-0x8(%r9,%rax,1)
   14012230a:	48 83 e8 08          	sub    $0x8,%rax
   14012230e:	48 39 c8             	cmp    %rcx,%rax
   140122311:	75 ed                	jne    140122300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d60>
   140122313:	48 01 c6             	add    %rax,%rsi
   140122316:	48 8d 94 24 20 07 00 	lea    0x720(%rsp),%rdx
   14012231d:	00 
   14012231e:	31 c0                	xor    %eax,%eax
   140122320:	b9 23 00 00 00       	mov    $0x23,%ecx
   140122325:	48 89 d7             	mov    %rdx,%rdi
   140122328:	f3 48 ab             	rep stos %rax,(%rdi)
   14012232b:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   140122332:	00 
   140122333:	48 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%rcx
   14012233a:	c6 84 24 28 08 00 00 	movb   $0x1,0x828(%rsp)
   140122341:	01 
   140122342:	48 89 9c 24 20 07 00 	mov    %rbx,0x720(%rsp)
   140122349:	00 
   14012234a:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   14012234e:	48 89 8c 24 40 07 00 	mov    %rcx,0x740(%rsp)
   140122355:	00 
   140122356:	48 89 84 24 30 07 00 	mov    %rax,0x730(%rsp)
   14012235d:	00 
   14012235e:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   140122363:	48 89 84 24 38 07 00 	mov    %rax,0x738(%rsp)
   14012236a:	00 
   14012236b:	48 89 f0             	mov    %rsi,%rax
   14012236e:	48 29 c8             	sub    %rcx,%rax
   140122371:	48 8b 8b c0 50 01 00 	mov    0x150c0(%rbx),%rcx
   140122378:	48 c1 f8 03          	sar    $0x3,%rax
   14012237c:	48 89 84 24 48 07 00 	mov    %rax,0x748(%rsp)
   140122383:	00 
   140122384:	31 c0                	xor    %eax,%eax
   140122386:	48 85 c9             	test   %rcx,%rcx
   140122389:	74 0c                	je     140122397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2df7>
   14012238b:	48 8d 04 89          	lea    (%rcx,%rcx,4),%rax
   14012238f:	48 8d 84 c3 98 10 00 	lea    0x1098(%rbx,%rax,8),%rax
   140122396:	00 
   140122397:	c4 e1 f9 6e f8       	vmovq  %rax,%xmm7
   14012239c:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
   1401223a3:	00 
   1401223a4:	c4 e3 c1 22 83 b8 52 	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401223ab:	01 00 01 
   1401223ae:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   1401223b5:	c5 f9 7f 84 24 50 07 	vmovdqa %xmm0,0x750(%rsp)
   1401223bc:	00 00 
   1401223be:	e8 5d 81 0e 00       	call   14020a520 <tersun::VMTelemetryManager::instance()>
   1401223c3:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
   1401223ca:	00 
   1401223cb:	80 38 00             	cmpb   $0x0,(%rax)
   1401223ce:	74 05                	je     1401223d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e35>
   1401223d0:	48 83 40 28 01       	addq   $0x1,0x28(%rax)
   1401223d5:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   1401223dc:	00 
   1401223dd:	48 89 d9             	mov    %rbx,%rcx
   1401223e0:	ff 10                	call   *(%rax)
   1401223e2:	48 8b 94 24 58 07 00 	mov    0x758(%rsp),%rdx
   1401223e9:	00 
   1401223ea:	48 89 c7             	mov    %rax,%rdi
   1401223ed:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   1401223f4:	48 83 bc 24 68 07 00 	cmpq   $0x0,0x768(%rsp)
   1401223fb:	00 00 
   1401223fd:	0f 8f 57 c9 00 00    	jg     14012ed5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7ba>
   140122403:	45 84 e4             	test   %r12b,%r12b
   140122406:	0f 85 a6 6f 00 00    	jne    1401293b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e12>
   14012240c:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140122412:	48 89 bc 24 80 01 00 	mov    %rdi,0x180(%rsp)
   140122419:	00 
   14012241a:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140122421:	0f 84 78 96 00 00    	je     14012ba9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4ff>
   140122427:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   14012242e:	00 
   14012242f:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140122436:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012243d:	0f 84 cd 32 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   140122443:	0f b6 45 03          	movzbl 0x3(%rbp),%eax
   140122447:	48 8d 3d 52 4c 29 00 	lea    0x294c52(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012244e:	48 83 c5 04          	add    $0x4,%rbp
   140122452:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122456:	ff e0                	jmp    *%rax
   140122458:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   14012245f:	48 85 c0             	test   %rax,%rax
   140122462:	0f 84 d4 7e 00 00    	je     14012a33c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad9c>
   140122468:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
   14012246c:	48 83 e8 01          	sub    $0x1,%rax
   140122470:	48 8d 14 d3          	lea    (%rbx,%rdx,8),%rdx
   140122474:	4c 8b b2 98 10 00 00 	mov    0x1098(%rdx),%r14
   14012247b:	48 8b 8a a0 10 00 00 	mov    0x10a0(%rdx),%rcx
   140122482:	48 8b aa a8 10 00 00 	mov    0x10a8(%rdx),%rbp
   140122489:	48 89 83 c0 50 01 00 	mov    %rax,0x150c0(%rbx)
   140122490:	41 80 fc 01          	cmp    $0x1,%r12b
   140122494:	0f 85 8f 7e 00 00    	jne    14012a329 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad89>
   14012249a:	4c 8b a4 24 80 01 00 	mov    0x180(%rsp),%r12
   1401224a1:	00 
   1401224a2:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   1401224a9:	0f 84 59 52 00 00    	je     140127708 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8168>
   1401224af:	48 89 8b 68 52 01 00 	mov    %rcx,0x15268(%rbx)
   1401224b6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401224bd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401224c4:	4c 89 a4 24 80 01 00 	mov    %r12,0x180(%rsp)
   1401224cb:	00 
   1401224cc:	48 8d 34 ea          	lea    (%rdx,%rbp,8),%rsi
   1401224d0:	4d 85 ed             	test   %r13,%r13
   1401224d3:	74 0d                	je     1401224e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f42>
   1401224d5:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401224da:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401224e1:	00 
   1401224e2:	4c 03 74 24 30       	add    0x30(%rsp),%r14
   1401224e7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401224ee:	0f 84 2a 7e 00 00    	je     14012a31e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad7e>
   1401224f4:	41 0f b6 06          	movzbl (%r14),%eax
   1401224f8:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401224fc:	48 8d 3d 9d 4b 29 00 	lea    0x294b9d(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122503:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140122509:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012250d:	ff e0                	jmp    *%rax
   14012250f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122513:	0f 84 61 49 00 00    	je     140126e7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78da>
   140122519:	41 80 fc 01          	cmp    $0x1,%r12b
   14012251d:	0f 84 cb 61 00 00    	je     1401286ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x914e>
   140122523:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012252a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122531:	c5 f8 77             	vzeroupper
   140122534:	48 29 d6             	sub    %rdx,%rsi
   140122537:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012253c:	48 29 d0             	sub    %rdx,%rax
   14012253f:	48 89 f7             	mov    %rsi,%rdi
   140122542:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122549:	48 c1 ff 03          	sar    $0x3,%rdi
   14012254d:	48 39 f0             	cmp    %rsi,%rax
   140122550:	0f 82 91 5a 00 00    	jb     140127fe7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a47>
   140122556:	c5 f9 6f 05 a2 14 23 	vmovdqa 0x2314a2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012255d:	00 
   14012255e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122565:	4c 89 fa             	mov    %r15,%rdx
   140122568:	48 89 d9             	mov    %rbx,%rcx
   14012256b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122572:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122579:	00 
   14012257a:	e8 21 ea fd ff       	call   140100fa0 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   14012257f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122586:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012258d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122594:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122599:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012259d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401225a4:	4d 85 ed             	test   %r13,%r13
   1401225a7:	74 0d                	je     1401225b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3016>
   1401225a9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401225ae:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401225b5:	00 
   1401225b6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401225bd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401225c4:	0f 84 f4 f6 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401225ca:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401225cf:	41 0f b6 06          	movzbl (%r14),%eax
   1401225d3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401225d7:	45 31 e4             	xor    %r12d,%r12d
   1401225da:	48 8d 3d bf 4a 29 00 	lea    0x294abf(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401225e1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401225e5:	ff e0                	jmp    *%rax
   1401225e7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401225eb:	0f 84 f3 45 00 00    	je     140126be4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7644>
   1401225f1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401225f5:	0f 84 4a 62 00 00    	je     140128845 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a5>
   1401225fb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122602:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122609:	c5 f8 77             	vzeroupper
   14012260c:	48 29 d6             	sub    %rdx,%rsi
   14012260f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122614:	48 29 d0             	sub    %rdx,%rax
   140122617:	48 89 f7             	mov    %rsi,%rdi
   14012261a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122621:	48 c1 ff 03          	sar    $0x3,%rdi
   140122625:	48 39 f0             	cmp    %rsi,%rax
   140122628:	0f 82 7a 59 00 00    	jb     140127fa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a08>
   14012262e:	c5 f9 6f 05 ca 13 23 	vmovdqa 0x2313ca(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122635:	00 
   140122636:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012263d:	4c 89 fa             	mov    %r15,%rdx
   140122640:	48 89 d9             	mov    %rbx,%rcx
   140122643:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012264a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122651:	00 
   140122652:	e8 e9 e5 fd ff       	call   140100c40 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   140122657:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012265e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122665:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012266c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122671:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122675:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012267c:	4d 85 ed             	test   %r13,%r13
   14012267f:	74 0d                	je     14012268e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30ee>
   140122681:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122686:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012268d:	00 
   14012268e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122695:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012269c:	0f 84 1c f6 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401226a2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401226a7:	41 0f b6 06          	movzbl (%r14),%eax
   1401226ab:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401226af:	45 31 e4             	xor    %r12d,%r12d
   1401226b2:	48 8d 3d e7 49 29 00 	lea    0x2949e7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401226b9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401226bd:	ff e0                	jmp    *%rax
   1401226bf:	41 80 fc 02          	cmp    $0x2,%r12b
   1401226c3:	0f 84 51 42 00 00    	je     14012691a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x737a>
   1401226c9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401226cd:	0f 84 9f 64 00 00    	je     140128b72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95d2>
   1401226d3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401226da:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401226e1:	c5 f8 77             	vzeroupper
   1401226e4:	48 29 d6             	sub    %rdx,%rsi
   1401226e7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401226ec:	48 29 d0             	sub    %rdx,%rax
   1401226ef:	48 89 f7             	mov    %rsi,%rdi
   1401226f2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401226f9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401226fd:	48 39 f0             	cmp    %rsi,%rax
   140122700:	0f 82 f6 58 00 00    	jb     140127ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a5c>
   140122706:	c5 f9 6f 05 f2 12 23 	vmovdqa 0x2312f2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012270d:	00 
   14012270e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122715:	4c 89 fa             	mov    %r15,%rdx
   140122718:	48 89 d9             	mov    %rbx,%rcx
   14012271b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122722:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122729:	00 
   14012272a:	e8 c1 26 fe ff       	call   140104df0 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   14012272f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122736:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012273d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122744:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122749:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012274d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122754:	4d 85 ed             	test   %r13,%r13
   140122757:	74 0d                	je     140122766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31c6>
   140122759:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012275e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122765:	00 
   140122766:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012276d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122774:	0f 84 44 f5 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012277a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012277f:	41 0f b6 06          	movzbl (%r14),%eax
   140122783:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122787:	45 31 e4             	xor    %r12d,%r12d
   14012278a:	48 8d 3d 0f 49 29 00 	lea    0x29490f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122791:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122795:	ff e0                	jmp    *%rax
   140122797:	41 80 fc 02          	cmp    $0x2,%r12b
   14012279b:	0f 84 4d 40 00 00    	je     1401267ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x724e>
   1401227a1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401227a5:	0f 84 00 61 00 00    	je     1401288ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x930b>
   1401227ab:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401227b2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401227b9:	c5 f8 77             	vzeroupper
   1401227bc:	48 29 d6             	sub    %rdx,%rsi
   1401227bf:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401227c4:	48 29 d0             	sub    %rdx,%rax
   1401227c7:	48 89 f7             	mov    %rsi,%rdi
   1401227ca:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401227d1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401227d5:	48 39 f0             	cmp    %rsi,%rax
   1401227d8:	0f 82 b5 57 00 00    	jb     140127f93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89f3>
   1401227de:	c5 f9 6f 05 1a 12 23 	vmovdqa 0x23121a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401227e5:	00 
   1401227e6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401227ed:	4c 89 fa             	mov    %r15,%rdx
   1401227f0:	48 89 d9             	mov    %rbx,%rcx
   1401227f3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401227fa:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122801:	00 
   140122802:	e8 29 1a fe ff       	call   140104230 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140122807:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012280e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122815:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012281c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122821:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122825:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012282c:	4d 85 ed             	test   %r13,%r13
   14012282f:	74 0d                	je     14012283e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x329e>
   140122831:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122836:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012283d:	00 
   14012283e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122845:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012284c:	0f 84 6c f4 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122852:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122857:	41 0f b6 06          	movzbl (%r14),%eax
   14012285b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012285f:	45 31 e4             	xor    %r12d,%r12d
   140122862:	48 8d 3d 37 48 29 00 	lea    0x294837(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122869:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012286d:	ff e0                	jmp    *%rax
   14012286f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122873:	0f 84 67 42 00 00    	je     140126ae0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7540>
   140122879:	41 80 fc 01          	cmp    $0x1,%r12b
   14012287d:	0f 84 6c 5d 00 00    	je     1401285ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904f>
   140122883:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012288a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122891:	c5 f8 77             	vzeroupper
   140122894:	48 29 d6             	sub    %rdx,%rsi
   140122897:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012289c:	48 29 d0             	sub    %rdx,%rax
   14012289f:	48 89 f7             	mov    %rsi,%rdi
   1401228a2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401228a9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401228ad:	48 39 f0             	cmp    %rsi,%rax
   1401228b0:	0f 82 07 57 00 00    	jb     140127fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a1d>
   1401228b6:	c5 f9 6f 05 42 11 23 	vmovdqa 0x231142(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401228bd:	00 
   1401228be:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401228c5:	4c 89 fa             	mov    %r15,%rdx
   1401228c8:	48 89 d9             	mov    %rbx,%rcx
   1401228cb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401228d2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401228d9:	00 
   1401228da:	e8 91 84 fe ff       	call   14010ad70 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   1401228df:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401228e6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401228ed:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401228f4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401228f9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401228fd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122904:	4d 85 ed             	test   %r13,%r13
   140122907:	74 0d                	je     140122916 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3376>
   140122909:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012290e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122915:	00 
   140122916:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012291d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122924:	0f 84 94 f3 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012292a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012292f:	41 0f b6 06          	movzbl (%r14),%eax
   140122933:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122937:	45 31 e4             	xor    %r12d,%r12d
   14012293a:	48 8d 3d 5f 47 29 00 	lea    0x29475f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122941:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122945:	ff e0                	jmp    *%rax
   140122947:	41 80 fc 02          	cmp    $0x2,%r12b
   14012294b:	0f 84 05 40 00 00    	je     140126956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73b6>
   140122951:	41 80 fc 01          	cmp    $0x1,%r12b
   140122955:	0f 84 e8 60 00 00    	je     140128a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94a3>
   14012295b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122962:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122969:	c5 f8 77             	vzeroupper
   14012296c:	48 29 d6             	sub    %rdx,%rsi
   14012296f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122974:	48 29 d0             	sub    %rdx,%rax
   140122977:	48 89 f7             	mov    %rsi,%rdi
   14012297a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122981:	48 c1 ff 03          	sar    $0x3,%rdi
   140122985:	48 39 f0             	cmp    %rsi,%rax
   140122988:	0f 82 44 56 00 00    	jb     140127fd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a32>
   14012298e:	c5 f9 6f 05 6a 10 23 	vmovdqa 0x23106a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122995:	00 
   140122996:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012299d:	4c 89 fa             	mov    %r15,%rdx
   1401229a0:	48 89 d9             	mov    %rbx,%rcx
   1401229a3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401229aa:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401229b1:	00 
   1401229b2:	e8 99 d4 fd ff       	call   1400ffe50 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   1401229b7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401229be:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401229c5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401229cc:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401229d1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401229d5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401229dc:	4d 85 ed             	test   %r13,%r13
   1401229df:	74 0d                	je     1401229ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x344e>
   1401229e1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401229e6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401229ed:	00 
   1401229ee:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401229f5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401229fc:	0f 84 bc f2 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122a02:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122a07:	41 0f b6 06          	movzbl (%r14),%eax
   140122a0b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122a0f:	45 31 e4             	xor    %r12d,%r12d
   140122a12:	48 8d 3d 87 46 29 00 	lea    0x294687(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122a19:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122a1d:	ff e0                	jmp    *%rax
   140122a1f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122a23:	0f 84 b9 32 00 00    	je     140125ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6742>
   140122a29:	41 80 fc 01          	cmp    $0x1,%r12b
   140122a2d:	0f 84 0b 62 00 00    	je     140128c3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969e>
   140122a33:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122a3a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122a41:	c5 f8 77             	vzeroupper
   140122a44:	48 29 d6             	sub    %rdx,%rsi
   140122a47:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122a4c:	48 29 d0             	sub    %rdx,%rax
   140122a4f:	48 89 f7             	mov    %rsi,%rdi
   140122a52:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122a59:	48 c1 ff 03          	sar    $0x3,%rdi
   140122a5d:	48 39 f0             	cmp    %rsi,%rax
   140122a60:	0f 82 64 56 00 00    	jb     1401280ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b2a>
   140122a66:	c5 f9 6f 05 92 0f 23 	vmovdqa 0x230f92(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122a6d:	00 
   140122a6e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122a75:	4c 89 fa             	mov    %r15,%rdx
   140122a78:	48 89 d9             	mov    %rbx,%rcx
   140122a7b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122a82:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122a89:	00 
   140122a8a:	e8 61 d4 fd ff       	call   1400ffef0 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140122a8f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122a96:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122a9d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122aa4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122aa9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122aad:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122ab4:	4d 85 ed             	test   %r13,%r13
   140122ab7:	74 0d                	je     140122ac6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3526>
   140122ab9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122abe:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122ac5:	00 
   140122ac6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122acd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122ad4:	0f 84 e4 f1 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122ada:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122adf:	41 0f b6 06          	movzbl (%r14),%eax
   140122ae3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122ae7:	45 31 e4             	xor    %r12d,%r12d
   140122aea:	48 8d 3d af 45 29 00 	lea    0x2945af(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122af1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122af5:	ff e0                	jmp    *%rax
   140122af7:	41 80 fc 02          	cmp    $0x2,%r12b
   140122afb:	0f 84 69 31 00 00    	je     140125c6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66ca>
   140122b01:	41 80 fc 01          	cmp    $0x1,%r12b
   140122b05:	0f 84 6b 5f 00 00    	je     140128a76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94d6>
   140122b0b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122b12:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122b19:	c5 f8 77             	vzeroupper
   140122b1c:	48 29 d6             	sub    %rdx,%rsi
   140122b1f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122b24:	48 29 d0             	sub    %rdx,%rax
   140122b27:	48 89 f7             	mov    %rsi,%rdi
   140122b2a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122b31:	48 c1 ff 03          	sar    $0x3,%rdi
   140122b35:	48 39 f0             	cmp    %rsi,%rax
   140122b38:	0f 82 a1 55 00 00    	jb     1401280df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b3f>
   140122b3e:	c5 f9 6f 05 ba 0e 23 	vmovdqa 0x230eba(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122b45:	00 
   140122b46:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122b4d:	4c 89 fa             	mov    %r15,%rdx
   140122b50:	48 89 d9             	mov    %rbx,%rcx
   140122b53:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122b5a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122b61:	00 
   140122b62:	e8 39 b7 fd ff       	call   1400fe2a0 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140122b67:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122b6e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122b75:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122b7c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122b81:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122b85:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122b8c:	4d 85 ed             	test   %r13,%r13
   140122b8f:	74 0d                	je     140122b9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35fe>
   140122b91:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122b96:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122b9d:	00 
   140122b9e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122ba5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122bac:	0f 84 0c f1 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122bb2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122bb7:	41 0f b6 06          	movzbl (%r14),%eax
   140122bbb:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122bbf:	45 31 e4             	xor    %r12d,%r12d
   140122bc2:	48 8d 3d d7 44 29 00 	lea    0x2944d7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122bc9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122bcd:	ff e0                	jmp    *%rax
   140122bcf:	41 80 fc 02          	cmp    $0x2,%r12b
   140122bd3:	0f 84 55 30 00 00    	je     140125c2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x668e>
   140122bd9:	41 80 fc 01          	cmp    $0x1,%r12b
   140122bdd:	0f 84 61 5d 00 00    	je     140128944 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93a4>
   140122be3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122bea:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122bf1:	c5 f8 77             	vzeroupper
   140122bf4:	48 29 d6             	sub    %rdx,%rsi
   140122bf7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122bfc:	48 29 d0             	sub    %rdx,%rax
   140122bff:	48 89 f7             	mov    %rsi,%rdi
   140122c02:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122c09:	48 c1 ff 03          	sar    $0x3,%rdi
   140122c0d:	48 39 f0             	cmp    %rsi,%rax
   140122c10:	0f 82 1d 55 00 00    	jb     140128133 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b93>
   140122c16:	c5 f9 6f 05 e2 0d 23 	vmovdqa 0x230de2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122c1d:	00 
   140122c1e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122c25:	4c 89 fa             	mov    %r15,%rdx
   140122c28:	48 89 d9             	mov    %rbx,%rcx
   140122c2b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122c32:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122c39:	00 
   140122c3a:	e8 31 11 fe ff       	call   140103d70 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140122c3f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122c46:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122c4d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122c54:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122c59:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122c5d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122c64:	4d 85 ed             	test   %r13,%r13
   140122c67:	74 0d                	je     140122c76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36d6>
   140122c69:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122c6e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122c75:	00 
   140122c76:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122c7d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122c84:	0f 84 34 f0 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122c8a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122c8f:	41 0f b6 06          	movzbl (%r14),%eax
   140122c93:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122c97:	45 31 e4             	xor    %r12d,%r12d
   140122c9a:	48 8d 3d ff 43 29 00 	lea    0x2943ff(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122ca1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122ca5:	ff e0                	jmp    *%rax
   140122ca7:	41 80 fc 02          	cmp    $0x2,%r12b
   140122cab:	0f 84 5a 31 00 00    	je     140125e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x686b>
   140122cb1:	41 80 fc 01          	cmp    $0x1,%r12b
   140122cb5:	0f 84 ea 5e 00 00    	je     140128ba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9605>
   140122cbb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122cc2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122cc9:	c5 f8 77             	vzeroupper
   140122ccc:	48 29 d6             	sub    %rdx,%rsi
   140122ccf:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122cd4:	48 29 d0             	sub    %rdx,%rax
   140122cd7:	48 89 f7             	mov    %rsi,%rdi
   140122cda:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122ce1:	48 c1 ff 03          	sar    $0x3,%rdi
   140122ce5:	48 39 f0             	cmp    %rsi,%rax
   140122ce8:	0f 82 5a 54 00 00    	jb     140128148 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ba8>
   140122cee:	c5 f9 6f 05 0a 0d 23 	vmovdqa 0x230d0a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122cf5:	00 
   140122cf6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122cfd:	4c 89 fa             	mov    %r15,%rdx
   140122d00:	48 89 d9             	mov    %rbx,%rcx
   140122d03:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122d0a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122d11:	00 
   140122d12:	e8 89 12 fe ff       	call   140103fa0 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   140122d17:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122d1e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122d25:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122d2c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122d31:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122d35:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122d3c:	4d 85 ed             	test   %r13,%r13
   140122d3f:	74 0d                	je     140122d4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37ae>
   140122d41:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122d46:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122d4d:	00 
   140122d4e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122d55:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122d5c:	0f 84 5c ef ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122d62:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122d67:	41 0f b6 06          	movzbl (%r14),%eax
   140122d6b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122d6f:	45 31 e4             	xor    %r12d,%r12d
   140122d72:	48 8d 3d 27 43 29 00 	lea    0x294327(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122d79:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122d7d:	ff e0                	jmp    *%rax
   140122d7f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122d83:	0f 84 be 30 00 00    	je     140125e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68a7>
   140122d89:	41 80 fc 01          	cmp    $0x1,%r12b
   140122d8d:	0f 84 4b 5b 00 00    	je     1401288de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x933e>
   140122d93:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122d9a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122da1:	c5 f8 77             	vzeroupper
   140122da4:	48 29 d6             	sub    %rdx,%rsi
   140122da7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122dac:	48 29 d0             	sub    %rdx,%rax
   140122daf:	48 89 f7             	mov    %rsi,%rdi
   140122db2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122db9:	48 c1 ff 03          	sar    $0x3,%rdi
   140122dbd:	48 39 f0             	cmp    %rsi,%rax
   140122dc0:	0f 82 2e 53 00 00    	jb     1401280f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b54>
   140122dc6:	c5 f9 6f 05 32 0c 23 	vmovdqa 0x230c32(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122dcd:	00 
   140122dce:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122dd5:	4c 89 fa             	mov    %r15,%rdx
   140122dd8:	48 89 d9             	mov    %rbx,%rcx
   140122ddb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122de2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122de9:	00 
   140122dea:	e8 71 06 fe ff       	call   140103460 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   140122def:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122df6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122dfd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122e04:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122e09:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122e0d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122e14:	4d 85 ed             	test   %r13,%r13
   140122e17:	74 0d                	je     140122e26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3886>
   140122e19:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122e1e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122e25:	00 
   140122e26:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122e2d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122e34:	0f 84 84 ee ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122e3a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122e3f:	41 0f b6 06          	movzbl (%r14),%eax
   140122e43:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122e47:	45 31 e4             	xor    %r12d,%r12d
   140122e4a:	48 8d 3d 4f 42 29 00 	lea    0x29424f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122e51:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122e55:	ff e0                	jmp    *%rax
   140122e57:	41 80 fc 02          	cmp    $0x2,%r12b
   140122e5b:	0f 84 bd 2e 00 00    	je     140125d1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x677e>
   140122e61:	41 80 fc 01          	cmp    $0x1,%r12b
   140122e65:	0f 84 71 5c 00 00    	je     140128adc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x953c>
   140122e6b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122e72:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122e79:	c5 f8 77             	vzeroupper
   140122e7c:	48 29 d6             	sub    %rdx,%rsi
   140122e7f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122e84:	48 29 d0             	sub    %rdx,%rax
   140122e87:	48 89 f7             	mov    %rsi,%rdi
   140122e8a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122e91:	48 c1 ff 03          	sar    $0x3,%rdi
   140122e95:	48 39 f0             	cmp    %rsi,%rax
   140122e98:	0f 82 bf 52 00 00    	jb     14012815d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bbd>
   140122e9e:	c5 f9 6f 05 5a 0b 23 	vmovdqa 0x230b5a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122ea5:	00 
   140122ea6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122ead:	4c 89 fa             	mov    %r15,%rdx
   140122eb0:	48 89 d9             	mov    %rbx,%rcx
   140122eb3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122eba:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122ec1:	00 
   140122ec2:	e8 89 f5 fd ff       	call   140102450 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140122ec7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122ece:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122ed5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122edc:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122ee1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122ee5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122eec:	4d 85 ed             	test   %r13,%r13
   140122eef:	74 0d                	je     140122efe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x395e>
   140122ef1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122ef6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122efd:	00 
   140122efe:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122f05:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122f0c:	0f 84 ac ed ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122f12:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122f17:	41 0f b6 06          	movzbl (%r14),%eax
   140122f1b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122f1f:	45 31 e4             	xor    %r12d,%r12d
   140122f22:	48 8d 3d 77 41 29 00 	lea    0x294177(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122f29:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122f2d:	ff e0                	jmp    *%rax
   140122f2f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122f33:	0f 84 21 2e 00 00    	je     140125d5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67ba>
   140122f39:	41 80 fc 01          	cmp    $0x1,%r12b
   140122f3d:	0f 84 95 5c 00 00    	je     140128bd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9638>
   140122f43:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122f4a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122f51:	c5 f8 77             	vzeroupper
   140122f54:	48 29 d6             	sub    %rdx,%rsi
   140122f57:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140122f5c:	48 29 d0             	sub    %rdx,%rax
   140122f5f:	48 89 f7             	mov    %rsi,%rdi
   140122f62:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122f69:	48 c1 ff 03          	sar    $0x3,%rdi
   140122f6d:	48 39 f0             	cmp    %rsi,%rax
   140122f70:	0f 82 93 51 00 00    	jb     140128109 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b69>
   140122f76:	c5 f9 6f 05 82 0a 23 	vmovdqa 0x230a82(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140122f7d:	00 
   140122f7e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122f85:	4c 89 fa             	mov    %r15,%rdx
   140122f88:	48 89 d9             	mov    %rbx,%rcx
   140122f8b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122f92:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122f99:	00 
   140122f9a:	e8 91 e0 fd ff       	call   140101030 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140122f9f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122fa6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122fad:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122fb4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140122fb9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122fbd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140122fc4:	4d 85 ed             	test   %r13,%r13
   140122fc7:	74 0d                	je     140122fd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a36>
   140122fc9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122fce:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122fd5:	00 
   140122fd6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122fdd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122fe4:	0f 84 d4 ec ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140122fea:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122fef:	41 0f b6 06          	movzbl (%r14),%eax
   140122ff3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140122ff7:	45 31 e4             	xor    %r12d,%r12d
   140122ffa:	48 8d 3d 9f 40 29 00 	lea    0x29409f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123001:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123005:	ff e0                	jmp    *%rax
   140123007:	41 80 fc 02          	cmp    $0x2,%r12b
   14012300b:	0f 84 23 2f 00 00    	je     140125f34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6994>
   140123011:	41 80 fc 01          	cmp    $0x1,%r12b
   140123015:	0f 84 2b 57 00 00    	je     140128746 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a6>
   14012301b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123022:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123029:	c5 f8 77             	vzeroupper
   14012302c:	48 29 d6             	sub    %rdx,%rsi
   14012302f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123034:	48 29 d0             	sub    %rdx,%rax
   140123037:	48 89 f7             	mov    %rsi,%rdi
   14012303a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123041:	48 c1 ff 03          	sar    $0x3,%rdi
   140123045:	48 39 f0             	cmp    %rsi,%rax
   140123048:	0f 82 d0 50 00 00    	jb     14012811e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b7e>
   14012304e:	c5 f9 6f 05 aa 09 23 	vmovdqa 0x2309aa(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123055:	00 
   140123056:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012305d:	4c 89 fa             	mov    %r15,%rdx
   140123060:	48 89 d9             	mov    %rbx,%rcx
   140123063:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012306a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123071:	00 
   140123072:	e8 a9 b8 fd ff       	call   1400fe920 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   140123077:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012307e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123085:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012308c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123091:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123095:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012309c:	4d 85 ed             	test   %r13,%r13
   14012309f:	74 0d                	je     1401230ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b0e>
   1401230a1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401230a6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401230ad:	00 
   1401230ae:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401230b5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401230bc:	0f 84 fc eb ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401230c2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401230c7:	41 0f b6 06          	movzbl (%r14),%eax
   1401230cb:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401230cf:	45 31 e4             	xor    %r12d,%r12d
   1401230d2:	48 8d 3d c7 3f 29 00 	lea    0x293fc7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401230d9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401230dd:	ff e0                	jmp    *%rax
   1401230df:	41 80 fc 02          	cmp    $0x2,%r12b
   1401230e3:	0f 84 0f 2e 00 00    	je     140125ef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6958>
   1401230e9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401230ed:	0f 84 b9 56 00 00    	je     1401287ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x920c>
   1401230f3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401230fa:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123101:	c5 f8 77             	vzeroupper
   140123104:	48 29 d6             	sub    %rdx,%rsi
   140123107:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012310c:	48 29 d0             	sub    %rdx,%rax
   14012310f:	48 89 f7             	mov    %rsi,%rdi
   140123112:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123119:	48 c1 ff 03          	sar    $0x3,%rdi
   14012311d:	48 39 f0             	cmp    %rsi,%rax
   140123120:	0f 82 4c 50 00 00    	jb     140128172 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bd2>
   140123126:	c5 f9 6f 05 d2 08 23 	vmovdqa 0x2308d2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012312d:	00 
   14012312e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123135:	4c 89 fa             	mov    %r15,%rdx
   140123138:	48 89 d9             	mov    %rbx,%rcx
   14012313b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123142:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123149:	00 
   14012314a:	e8 61 f6 fd ff       	call   1401027b0 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   14012314f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123156:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012315d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123164:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123169:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012316d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123174:	4d 85 ed             	test   %r13,%r13
   140123177:	74 0d                	je     140123186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3be6>
   140123179:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012317e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123185:	00 
   140123186:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012318d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123194:	0f 84 24 eb ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012319a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012319f:	41 0f b6 06          	movzbl (%r14),%eax
   1401231a3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401231a7:	45 31 e4             	xor    %r12d,%r12d
   1401231aa:	48 8d 3d ef 3e 29 00 	lea    0x293eef(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401231b1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401231b5:	ff e0                	jmp    *%rax
   1401231b7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401231bb:	0f 84 e5 2a 00 00    	je     140125ca6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6706>
   1401231c1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401231c5:	0f 84 45 58 00 00    	je     140128a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9470>
   1401231cb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401231d2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401231d9:	c5 f8 77             	vzeroupper
   1401231dc:	48 29 d6             	sub    %rdx,%rsi
   1401231df:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401231e4:	48 29 d0             	sub    %rdx,%rax
   1401231e7:	48 89 f7             	mov    %rsi,%rdi
   1401231ea:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401231f1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401231f5:	48 39 f0             	cmp    %rsi,%rax
   1401231f8:	0f 82 89 4f 00 00    	jb     140128187 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8be7>
   1401231fe:	c5 f9 6f 05 fa 07 23 	vmovdqa 0x2307fa(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123205:	00 
   140123206:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012320d:	4c 89 fa             	mov    %r15,%rdx
   140123210:	48 89 d9             	mov    %rbx,%rcx
   140123213:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012321a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123221:	00 
   140123222:	e8 f9 b9 fd ff       	call   1400fec20 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140123227:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012322e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123235:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012323c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123241:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123245:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012324c:	4d 85 ed             	test   %r13,%r13
   14012324f:	74 0d                	je     14012325e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cbe>
   140123251:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123256:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012325d:	00 
   14012325e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123265:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012326c:	0f 84 4c ea ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123272:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123277:	41 0f b6 06          	movzbl (%r14),%eax
   14012327b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012327f:	45 31 e4             	xor    %r12d,%r12d
   140123282:	48 8d 3d 17 3e 29 00 	lea    0x293e17(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123289:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012328d:	ff e0                	jmp    *%rax
   14012328f:	41 80 fc 02          	cmp    $0x2,%r12b
   140123293:	0f 84 91 30 00 00    	je     14012632a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d8a>
   140123299:	41 80 fc 01          	cmp    $0x1,%r12b
   14012329d:	0f 84 3a 57 00 00    	je     1401289dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x943d>
   1401232a3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401232aa:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401232b1:	c5 f8 77             	vzeroupper
   1401232b4:	48 29 d6             	sub    %rdx,%rsi
   1401232b7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401232bc:	48 29 d0             	sub    %rdx,%rax
   1401232bf:	48 89 f7             	mov    %rsi,%rdi
   1401232c2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401232c9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401232cd:	48 39 f0             	cmp    %rsi,%rax
   1401232d0:	0f 82 7e 4c 00 00    	jb     140127f54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89b4>
   1401232d6:	c5 f9 6f 05 22 07 23 	vmovdqa 0x230722(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401232dd:	00 
   1401232de:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401232e5:	4c 89 fa             	mov    %r15,%rdx
   1401232e8:	48 89 d9             	mov    %rbx,%rcx
   1401232eb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401232f2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401232f9:	00 
   1401232fa:	e8 31 ee fd ff       	call   140102130 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   1401232ff:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123306:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012330d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123314:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123319:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012331d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123324:	4d 85 ed             	test   %r13,%r13
   140123327:	74 0d                	je     140123336 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d96>
   140123329:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012332e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123335:	00 
   140123336:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012333d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123344:	0f 84 74 e9 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012334a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012334f:	41 0f b6 06          	movzbl (%r14),%eax
   140123353:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123357:	45 31 e4             	xor    %r12d,%r12d
   14012335a:	48 8d 3d 3f 3d 29 00 	lea    0x293d3f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123361:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123365:	ff e0                	jmp    *%rax
   140123367:	41 80 fc 02          	cmp    $0x2,%r12b
   14012336b:	0f 84 f5 2f 00 00    	je     140126366 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dc6>
   140123371:	41 80 fc 01          	cmp    $0x1,%r12b
   140123375:	0f 84 96 55 00 00    	je     140128911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9371>
   14012337b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123382:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123389:	c5 f8 77             	vzeroupper
   14012338c:	48 29 d6             	sub    %rdx,%rsi
   14012338f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123394:	48 29 d0             	sub    %rdx,%rax
   140123397:	48 89 f7             	mov    %rsi,%rdi
   14012339a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401233a1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401233a5:	48 39 f0             	cmp    %rsi,%rax
   1401233a8:	0f 82 bb 4b 00 00    	jb     140127f69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89c9>
   1401233ae:	c5 f9 6f 05 4a 06 23 	vmovdqa 0x23064a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401233b5:	00 
   1401233b6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401233bd:	4c 89 fa             	mov    %r15,%rdx
   1401233c0:	48 89 d9             	mov    %rbx,%rcx
   1401233c3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401233ca:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401233d1:	00 
   1401233d2:	e8 09 fd fd ff       	call   1401030e0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   1401233d7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401233de:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401233e5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401233ec:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401233f1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401233f5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401233fc:	4d 85 ed             	test   %r13,%r13
   1401233ff:	74 0d                	je     14012340e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e6e>
   140123401:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123406:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012340d:	00 
   14012340e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123415:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012341c:	0f 84 9c e8 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123422:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123427:	41 0f b6 06          	movzbl (%r14),%eax
   14012342b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012342f:	45 31 e4             	xor    %r12d,%r12d
   140123432:	48 8d 3d 67 3c 29 00 	lea    0x293c67(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123439:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012343d:	ff e0                	jmp    *%rax
   14012343f:	41 80 fc 02          	cmp    $0x2,%r12b
   140123443:	0f 84 3a 2a 00 00    	je     140125e83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68e3>
   140123449:	41 80 fc 01          	cmp    $0x1,%r12b
   14012344d:	0f 84 25 54 00 00    	je     140128878 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92d8>
   140123453:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012345a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123461:	c5 f8 77             	vzeroupper
   140123464:	48 29 d6             	sub    %rdx,%rsi
   140123467:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012346c:	48 29 d0             	sub    %rdx,%rax
   14012346f:	48 89 f7             	mov    %rsi,%rdi
   140123472:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123479:	48 c1 ff 03          	sar    $0x3,%rdi
   14012347d:	48 39 f0             	cmp    %rsi,%rax
   140123480:	0f 82 16 4d 00 00    	jb     14012819c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bfc>
   140123486:	c5 f9 6f 05 72 05 23 	vmovdqa 0x230572(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012348d:	00 
   14012348e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123495:	4c 89 fa             	mov    %r15,%rdx
   140123498:	48 89 d9             	mov    %rbx,%rcx
   14012349b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401234a2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401234a9:	00 
   1401234aa:	e8 71 ba fd ff       	call   1400fef20 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   1401234af:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401234b6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401234bd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401234c4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401234c9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401234cd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401234d4:	4d 85 ed             	test   %r13,%r13
   1401234d7:	74 0d                	je     1401234e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f46>
   1401234d9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401234de:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401234e5:	00 
   1401234e6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401234ed:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401234f4:	0f 84 c4 e7 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401234fa:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401234ff:	41 0f b6 06          	movzbl (%r14),%eax
   140123503:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123507:	45 31 e4             	xor    %r12d,%r12d
   14012350a:	48 8d 3d 8f 3b 29 00 	lea    0x293b8f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123511:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123515:	ff e0                	jmp    *%rax
   140123517:	41 80 fc 02          	cmp    $0x2,%r12b
   14012351b:	0f 84 aa 34 00 00    	je     1401269cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x742b>
   140123521:	41 80 fc 01          	cmp    $0x1,%r12b
   140123525:	0f 84 90 51 00 00    	je     1401286bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x911b>
   14012352b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123532:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123539:	c5 f8 77             	vzeroupper
   14012353c:	48 29 d6             	sub    %rdx,%rsi
   14012353f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123544:	48 29 d0             	sub    %rdx,%rax
   140123547:	48 89 f7             	mov    %rsi,%rdi
   14012354a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123551:	48 c1 ff 03          	sar    $0x3,%rdi
   140123555:	48 39 f0             	cmp    %rsi,%rax
   140123558:	0f 82 20 4a 00 00    	jb     140127f7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89de>
   14012355e:	c5 f9 6f 05 9a 04 23 	vmovdqa 0x23049a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123565:	00 
   140123566:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012356d:	4c 89 fa             	mov    %r15,%rdx
   140123570:	48 89 d9             	mov    %rbx,%rcx
   140123573:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012357a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123581:	00 
   140123582:	e8 99 bc fd ff       	call   1400ff220 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   140123587:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012358e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123595:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012359c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401235a1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401235a5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401235ac:	4d 85 ed             	test   %r13,%r13
   1401235af:	74 0d                	je     1401235be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x401e>
   1401235b1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401235b6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401235bd:	00 
   1401235be:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401235c5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401235cc:	0f 84 ec e6 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401235d2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401235d7:	41 0f b6 06          	movzbl (%r14),%eax
   1401235db:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401235df:	45 31 e4             	xor    %r12d,%r12d
   1401235e2:	48 8d 3d b7 3a 29 00 	lea    0x293ab7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401235e9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401235ed:	ff e0                	jmp    *%rax
   1401235ef:	41 80 fc 02          	cmp    $0x2,%r12b
   1401235f3:	0f 84 9d 27 00 00    	je     140125d96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f6>
   1401235f9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401235fd:	0f 84 08 56 00 00    	je     140128c0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966b>
   140123603:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012360a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123611:	c5 f8 77             	vzeroupper
   140123614:	48 29 d6             	sub    %rdx,%rsi
   140123617:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012361c:	48 29 d0             	sub    %rdx,%rax
   14012361f:	48 89 f7             	mov    %rsi,%rdi
   140123622:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123629:	48 c1 ff 03          	sar    $0x3,%rdi
   14012362d:	48 39 f0             	cmp    %rsi,%rax
   140123630:	0f 82 7b 4b 00 00    	jb     1401281b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c11>
   140123636:	c5 f9 6f 05 c2 03 23 	vmovdqa 0x2303c2(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012363d:	00 
   14012363e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123645:	4c 89 fa             	mov    %r15,%rdx
   140123648:	48 89 d9             	mov    %rbx,%rcx
   14012364b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123652:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123659:	00 
   14012365a:	e8 c1 ac fd ff       	call   1400fe320 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   14012365f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123666:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012366d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123674:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123679:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012367d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123684:	4d 85 ed             	test   %r13,%r13
   140123687:	74 0d                	je     140123696 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40f6>
   140123689:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012368e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123695:	00 
   140123696:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012369d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401236a4:	0f 84 14 e6 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   1401236aa:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401236af:	41 0f b6 06          	movzbl (%r14),%eax
   1401236b3:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1401236b7:	45 31 e4             	xor    %r12d,%r12d
   1401236ba:	48 8d 3d df 39 29 00 	lea    0x2939df(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401236c1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401236c5:	ff e0                	jmp    *%rax
   1401236c7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401236cb:	0f 84 9f 28 00 00    	je     140125f70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d0>
   1401236d1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401236d5:	0f 84 ad 4f 00 00    	je     140128688 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90e8>
   1401236db:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401236e2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401236e9:	c5 f8 77             	vzeroupper
   1401236ec:	48 29 d6             	sub    %rdx,%rsi
   1401236ef:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401236f4:	48 29 d0             	sub    %rdx,%rax
   1401236f7:	48 89 f7             	mov    %rsi,%rdi
   1401236fa:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123701:	48 c1 ff 03          	sar    $0x3,%rdi
   140123705:	48 39 f0             	cmp    %rsi,%rax
   140123708:	0f 82 b8 4a 00 00    	jb     1401281c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c26>
   14012370e:	c5 f9 6f 05 ea 02 23 	vmovdqa 0x2302ea(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123715:	00 
   140123716:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012371d:	4c 89 fa             	mov    %r15,%rdx
   140123720:	48 89 d9             	mov    %rbx,%rcx
   140123723:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012372a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123731:	00 
   140123732:	e8 69 8c fe ff       	call   14010c3a0 <setun::VM::handle_get_field(setun::Chunk const&)>
   140123737:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012373e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123745:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012374c:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123751:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123755:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012375c:	4d 85 ed             	test   %r13,%r13
   14012375f:	74 0d                	je     14012376e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41ce>
   140123761:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123766:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012376d:	00 
   14012376e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123775:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012377c:	0f 84 3c e5 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123782:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123787:	41 0f b6 06          	movzbl (%r14),%eax
   14012378b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012378f:	45 31 e4             	xor    %r12d,%r12d
   140123792:	48 8d 3d 07 39 29 00 	lea    0x293907(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123799:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012379d:	ff e0                	jmp    *%rax
   14012379f:	41 80 fc 02          	cmp    $0x2,%r12b
   1401237a3:	0f 84 12 22 00 00    	je     1401259bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x641b>
   1401237a9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401237ad:	0f 84 70 4d 00 00    	je     140128523 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f83>
   1401237b3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401237ba:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401237c1:	c5 f8 77             	vzeroupper
   1401237c4:	48 29 d6             	sub    %rdx,%rsi
   1401237c7:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401237cc:	48 29 d0             	sub    %rdx,%rax
   1401237cf:	48 89 f7             	mov    %rsi,%rdi
   1401237d2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401237d9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401237dd:	48 39 f0             	cmp    %rsi,%rax
   1401237e0:	0f 82 0a 4a 00 00    	jb     1401281f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c50>
   1401237e6:	c5 f9 6f 05 12 02 23 	vmovdqa 0x230212(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401237ed:	00 
   1401237ee:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401237f5:	4c 89 fa             	mov    %r15,%rdx
   1401237f8:	48 89 d9             	mov    %rbx,%rcx
   1401237fb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123802:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123809:	00 
   14012380a:	e8 41 b6 fe ff       	call   14010ee50 <setun::VM::handle_new_instance(setun::Chunk const&)>
   14012380f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123816:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012381d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123824:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123829:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012382d:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123834:	4d 85 ed             	test   %r13,%r13
   140123837:	74 0d                	je     140123846 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42a6>
   140123839:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012383e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123845:	00 
   140123846:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012384d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123854:	0f 84 64 e4 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   14012385a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012385f:	41 0f b6 06          	movzbl (%r14),%eax
   140123863:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123867:	45 31 e4             	xor    %r12d,%r12d
   14012386a:	48 8d 3d 2f 38 29 00 	lea    0x29382f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123871:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123875:	ff e0                	jmp    *%rax
   140123877:	41 80 fc 02          	cmp    $0x2,%r12b
   14012387b:	0f 84 ba 2c 00 00    	je     14012653b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f9b>
   140123881:	41 80 fc 01          	cmp    $0x1,%r12b
   140123885:	0f 84 cc 4b 00 00    	je     140128457 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8eb7>
   14012388b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123892:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123899:	c5 f8 77             	vzeroupper
   14012389c:	48 29 d6             	sub    %rdx,%rsi
   14012389f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   1401238a4:	48 29 d0             	sub    %rdx,%rax
   1401238a7:	48 89 f7             	mov    %rsi,%rdi
   1401238aa:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401238b1:	48 c1 ff 03          	sar    $0x3,%rdi
   1401238b5:	48 39 f0             	cmp    %rsi,%rax
   1401238b8:	0f 82 47 49 00 00    	jb     140128205 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c65>
   1401238be:	c5 f9 6f 05 3a 01 23 	vmovdqa 0x23013a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   1401238c5:	00 
   1401238c6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401238cd:	4c 89 fa             	mov    %r15,%rdx
   1401238d0:	48 89 d9             	mov    %rbx,%rcx
   1401238d3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401238da:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401238e1:	00 
   1401238e2:	e8 c9 ae fe ff       	call   14010e7b0 <setun::VM::handle_set_field(setun::Chunk const&)>
   1401238e7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401238ee:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401238f5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401238fc:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123901:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123905:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   14012390c:	4d 85 ed             	test   %r13,%r13
   14012390f:	74 0d                	je     14012391e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x437e>
   140123911:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123916:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012391d:	00 
   14012391e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123925:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012392c:	0f 84 8c e3 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123932:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123937:	41 0f b6 06          	movzbl (%r14),%eax
   14012393b:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   14012393f:	45 31 e4             	xor    %r12d,%r12d
   140123942:	48 8d 3d 57 37 29 00 	lea    0x293757(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123949:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012394d:	ff e0                	jmp    *%rax
   14012394f:	41 80 fc 02          	cmp    $0x2,%r12b
   140123953:	0f 84 5d 22 00 00    	je     140125bb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6616>
   140123959:	41 80 fc 01          	cmp    $0x1,%r12b
   14012395d:	0f 84 47 50 00 00    	je     1401289aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x940a>
   140123963:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012396a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123971:	c5 f8 77             	vzeroupper
   140123974:	48 29 d6             	sub    %rdx,%rsi
   140123977:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   14012397c:	48 29 d0             	sub    %rdx,%rax
   14012397f:	48 89 f7             	mov    %rsi,%rdi
   140123982:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123989:	48 c1 ff 03          	sar    $0x3,%rdi
   14012398d:	48 39 f0             	cmp    %rsi,%rax
   140123990:	0f 82 0a 47 00 00    	jb     1401280a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b00>
   140123996:	c5 f9 6f 05 62 00 23 	vmovdqa 0x230062(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   14012399d:	00 
   14012399e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401239a5:	4c 89 fa             	mov    %r15,%rdx
   1401239a8:	48 89 d9             	mov    %rbx,%rcx
   1401239ab:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401239b2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401239b9:	00 
   1401239ba:	e8 c1 db fe ff       	call   140111580 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   1401239bf:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401239c6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401239cd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401239d4:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1401239d9:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401239dd:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   1401239e4:	4d 85 ed             	test   %r13,%r13
   1401239e7:	74 0d                	je     1401239f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4456>
   1401239e9:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   1401239ee:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   1401239f5:	00 
   1401239f6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401239fd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123a04:	0f 84 b4 e2 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123a0a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123a0f:	41 0f b6 06          	movzbl (%r14),%eax
   140123a13:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123a17:	45 31 e4             	xor    %r12d,%r12d
   140123a1a:	48 8d 3d 7f 36 29 00 	lea    0x29367f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123a21:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123a25:	ff e0                	jmp    *%rax
   140123a27:	41 80 fc 02          	cmp    $0x2,%r12b
   140123a2b:	0f 84 c1 21 00 00    	je     140125bf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6652>
   140123a31:	41 80 fc 01          	cmp    $0x1,%r12b
   140123a35:	0f 84 d7 4d 00 00    	je     140128812 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9272>
   140123a3b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123a42:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123a49:	c5 f8 77             	vzeroupper
   140123a4c:	48 29 d6             	sub    %rdx,%rsi
   140123a4f:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123a54:	48 29 d0             	sub    %rdx,%rax
   140123a57:	48 89 f7             	mov    %rsi,%rdi
   140123a5a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123a61:	48 c1 ff 03          	sar    $0x3,%rdi
   140123a65:	48 39 f0             	cmp    %rsi,%rax
   140123a68:	0f 82 47 46 00 00    	jb     1401280b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b15>
   140123a6e:	c5 f9 6f 05 8a ff 22 	vmovdqa 0x22ff8a(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123a75:	00 
   140123a76:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123a7d:	4c 89 fa             	mov    %r15,%rdx
   140123a80:	48 89 d9             	mov    %rbx,%rcx
   140123a83:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123a8a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123a91:	00 
   140123a92:	e8 09 78 fd ff       	call   1400fb2a0 <setun::VM::handle_try(setun::Chunk const&)>
   140123a97:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123a9e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123aa5:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123aac:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123ab1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123ab5:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123abc:	4d 85 ed             	test   %r13,%r13
   140123abf:	74 0d                	je     140123ace <setun::VM::run_optimized(setun::OptimizedChunk&)+0x452e>
   140123ac1:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123ac6:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123acd:	00 
   140123ace:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123ad5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123adc:	0f 84 dc e1 ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123ae2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123ae7:	41 0f b6 06          	movzbl (%r14),%eax
   140123aeb:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123aef:	45 31 e4             	xor    %r12d,%r12d
   140123af2:	48 8d 3d a7 35 29 00 	lea    0x2935a7(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123af9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123afd:	ff e0                	jmp    *%rax
   140123aff:	41 80 fc 02          	cmp    $0x2,%r12b
   140123b03:	0f 84 b6 23 00 00    	je     140125ebf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x691f>
   140123b09:	41 80 fc 01          	cmp    $0x1,%r12b
   140123b0d:	0f 85 e9 ca 00 00    	jne    1401305fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1105c>
   140123b13:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123b1a:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123b1e:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123b23:	0f 83 dd 7f 00 00    	jae    14012bb06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc566>
   140123b29:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123b30:	c5 f8 77             	vzeroupper
   140123b33:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
   140123b3a:	00 
   140123b3b:	48 89 0e             	mov    %rcx,(%rsi)
   140123b3e:	49 29 d0             	sub    %rdx,%r8
   140123b41:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123b46:	48 29 d0             	sub    %rdx,%rax
   140123b49:	4c 89 c6             	mov    %r8,%rsi
   140123b4c:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123b53:	48 c1 fe 03          	sar    $0x3,%rsi
   140123b57:	4c 39 c0             	cmp    %r8,%rax
   140123b5a:	0f 82 05 45 00 00    	jb     140128065 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ac5>
   140123b60:	c5 f9 6f 05 98 fe 22 	vmovdqa 0x22fe98(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123b67:	00 
   140123b68:	48 89 b3 60 10 00 00 	mov    %rsi,0x1060(%rbx)
   140123b6f:	4c 89 fa             	mov    %r15,%rdx
   140123b72:	48 89 d9             	mov    %rbx,%rcx
   140123b75:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123b7c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123b83:	00 
   140123b84:	e8 e7 74 fe ff       	call   14010b070 <setun::VM::handle_throw(setun::Chunk const&)>
   140123b89:	41 80 fc 02          	cmp    $0x2,%r12b
   140123b8d:	0f 84 3f 22 00 00    	je     140125dd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6832>
   140123b93:	41 80 fc 01          	cmp    $0x1,%r12b
   140123b97:	0f 84 a5 4f 00 00    	je     140128b42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a2>
   140123b9d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123ba4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123bab:	48 29 d6             	sub    %rdx,%rsi
   140123bae:	48 89 c1             	mov    %rax,%rcx
   140123bb1:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123bb6:	48 89 f7             	mov    %rsi,%rdi
   140123bb9:	48 29 d1             	sub    %rdx,%rcx
   140123bbc:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123bc3:	48 c1 ff 03          	sar    $0x3,%rdi
   140123bc7:	48 39 f1             	cmp    %rsi,%rcx
   140123bca:	0f 82 aa 44 00 00    	jb     14012807a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ada>
   140123bd0:	c5 f9 6f 05 28 fe 22 	vmovdqa 0x22fe28(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123bd7:	00 
   140123bd8:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123bdf:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123be6:	48 8b 8b 08 51 01 00 	mov    0x15108(%rbx),%rcx
   140123bed:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123bf4:	00 
   140123bf5:	48 3b 8b 00 51 01 00 	cmp    0x15100(%rbx),%rcx
   140123bfc:	74 0b                	je     140123c09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4669>
   140123bfe:	48 83 e9 20          	sub    $0x20,%rcx
   140123c02:	48 89 8b 08 51 01 00 	mov    %rcx,0x15108(%rbx)
   140123c09:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123c10:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123c15:	48 01 d6             	add    %rdx,%rsi
   140123c18:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123c1f:	4d 85 ed             	test   %r13,%r13
   140123c22:	74 0d                	je     140123c31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4691>
   140123c24:	4b 8d 4c ad fb       	lea    -0x5(%r13,%r13,4),%rcx
   140123c29:	4c 8b ac cb c8 10 00 	mov    0x10c8(%rbx,%rcx,8),%r13
   140123c30:	00 
   140123c31:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123c38:	0f 84 30 6b 00 00    	je     14012a76e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1ce>
   140123c3e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123c43:	41 0f b6 06          	movzbl (%r14),%eax
   140123c47:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123c4b:	45 31 e4             	xor    %r12d,%r12d
   140123c4e:	48 8d 3d 4b 34 29 00 	lea    0x29344b(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123c55:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123c59:	ff e0                	jmp    *%rax
   140123c5b:	41 80 fc 02          	cmp    $0x2,%r12b
   140123c5f:	0f 84 a2 23 00 00    	je     140126007 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a67>
   140123c65:	41 80 fc 01          	cmp    $0x1,%r12b
   140123c69:	0f 84 08 4d 00 00    	je     140128977 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93d7>
   140123c6f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123c76:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123c7d:	c5 f8 77             	vzeroupper
   140123c80:	48 29 d6             	sub    %rdx,%rsi
   140123c83:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123c88:	48 29 d0             	sub    %rdx,%rax
   140123c8b:	48 89 f7             	mov    %rsi,%rdi
   140123c8e:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123c95:	48 c1 ff 03          	sar    $0x3,%rdi
   140123c99:	48 39 f0             	cmp    %rsi,%rax
   140123c9c:	0f 82 99 43 00 00    	jb     14012803b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a9b>
   140123ca2:	c5 f9 6f 05 56 fd 22 	vmovdqa 0x22fd56(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123ca9:	00 
   140123caa:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123cb1:	4c 89 fa             	mov    %r15,%rdx
   140123cb4:	48 89 d9             	mov    %rbx,%rcx
   140123cb7:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123cbe:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123cc5:	00 
   140123cc6:	e8 55 90 fe ff       	call   14010cd20 <setun::VM::handle_closure(setun::Chunk const&)>
   140123ccb:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123cd2:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123cd9:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123ce0:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123ce5:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123ce9:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123cf0:	4d 85 ed             	test   %r13,%r13
   140123cf3:	74 0d                	je     140123d02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   140123cf5:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123cfa:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123d01:	00 
   140123d02:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123d09:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123d10:	0f 84 a8 df ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123d16:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123d1b:	41 0f b6 06          	movzbl (%r14),%eax
   140123d1f:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123d23:	45 31 e4             	xor    %r12d,%r12d
   140123d26:	48 8d 3d 73 33 29 00 	lea    0x293373(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123d2d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123d31:	ff e0                	jmp    *%rax
   140123d33:	41 80 fc 02          	cmp    $0x2,%r12b
   140123d37:	0f 84 3a 28 00 00    	je     140126577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fd7>
   140123d3d:	41 80 fc 01          	cmp    $0x1,%r12b
   140123d41:	0f 84 62 4d 00 00    	je     140128aa9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9509>
   140123d47:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123d4e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123d55:	c5 f8 77             	vzeroupper
   140123d58:	48 29 d6             	sub    %rdx,%rsi
   140123d5b:	48 2b 6c 24 30       	sub    0x30(%rsp),%rbp
   140123d60:	48 29 d0             	sub    %rdx,%rax
   140123d63:	48 89 f7             	mov    %rsi,%rdi
   140123d66:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123d6d:	48 c1 ff 03          	sar    $0x3,%rdi
   140123d71:	48 39 f0             	cmp    %rsi,%rax
   140123d74:	0f 82 d6 42 00 00    	jb     140128050 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ab0>
   140123d7a:	c5 f9 6f 05 7e fc 22 	vmovdqa 0x22fc7e(%rip),%xmm0        # 140353a00 <CSWTCH.2799+0x1c0>
   140123d81:	00 
   140123d82:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123d89:	4c 89 fa             	mov    %r15,%rdx
   140123d8c:	48 89 d9             	mov    %rbx,%rcx
   140123d8f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123d96:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123d9d:	00 
   140123d9e:	e8 8d 9a fe ff       	call   14010d830 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   140123da3:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123daa:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123db1:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123db8:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   140123dbd:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123dc1:	4c 03 b3 38 10 00 00 	add    0x1038(%rbx),%r14
   140123dc8:	4d 85 ed             	test   %r13,%r13
   140123dcb:	74 0d                	je     140123dda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x483a>
   140123dcd:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123dd2:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123dd9:	00 
   140123dda:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123de1:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123de8:	0f 84 d0 de ff ff    	je     140121cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x271e>
   140123dee:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123df3:	41 0f b6 06          	movzbl (%r14),%eax
   140123df7:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140123dfb:	45 31 e4             	xor    %r12d,%r12d
   140123dfe:	48 8d 3d 9b 32 29 00 	lea    0x29329b(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123e05:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123e09:	ff e0                	jmp    *%rax
   140123e0b:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140123e0f:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140123e13:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   140123e18:	41 80 fc 02          	cmp    $0x2,%r12b
   140123e1c:	0f 84 b4 21 00 00    	je     140125fd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a36>
   140123e22:	41 80 fc 01          	cmp    $0x1,%r12b
   140123e26:	0f 85 d7 44 00 00    	jne    140128303 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d63>
   140123e2c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123e30:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123e35:	0f 83 fd 8f 00 00    	jae    14012ce38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd898>
   140123e3b:	c5 f8 77             	vzeroupper
   140123e3e:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123e45:	00 
   140123e46:	45 31 e4             	xor    %r12d,%r12d
   140123e49:	48 89 06             	mov    %rax,(%rsi)
   140123e4c:	4c 89 c6             	mov    %r8,%rsi
   140123e4f:	b9 90 00 00 00       	mov    $0x90,%ecx
   140123e54:	e8 67 c1 20 00       	call   14032ffc0 <operator new(unsigned long long)>
   140123e59:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
   140123e5d:	48 89 c7             	mov    %rax,%rdi
   140123e60:	48 8b 05 f9 fb 22 00 	mov    0x22fbf9(%rip),%rax        # 140353a60 <CSWTCH.2799+0x220>
   140123e67:	c5 fe 7f 47 10       	vmovdqu %ymm0,0x10(%rdi)
   140123e6c:	48 8d 4f 18          	lea    0x18(%rdi),%rcx
   140123e70:	48 89 47 08          	mov    %rax,0x8(%rdi)
   140123e74:	48 8d 05 a5 eb 24 00 	lea    0x24eba5(%rip),%rax        # 140372a20 <vtable for std::_Sp_counted_ptr_inplace<setun::ArrayObject, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140123e7b:	48 89 07             	mov    %rax,(%rdi)
   140123e7e:	48 8d 47 10          	lea    0x10(%rdi),%rax
   140123e82:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   140123e89:	00 
   140123e8a:	0f b7 44 24 60       	movzwl 0x60(%rsp),%eax
   140123e8f:	c5 fe 7f 47 30       	vmovdqu %ymm0,0x30(%rdi)
   140123e94:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   140123e9b:	00 
   140123e9c:	48 89 c2             	mov    %rax,%rdx
   140123e9f:	c5 fe 7f 47 50       	vmovdqu %ymm0,0x50(%rdi)
   140123ea4:	c5 fe 7f 47 70       	vmovdqu %ymm0,0x70(%rdi)
   140123ea9:	c5 f8 77             	vzeroupper
   140123eac:	e8 af cb 1b 00       	call   1402e0a60 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140123eb1:	66 83 7c 24 60 00    	cmpw   $0x0,0x60(%rsp)
   140123eb7:	74 3d                	je     140123ef6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4956>
   140123eb9:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
   140123ec0:	00 
   140123ec1:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   140123ec5:	48 89 c1             	mov    %rax,%rcx
   140123ec8:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
   140123ecc:	31 c0                	xor    %eax,%eax
   140123ece:	48 f7 d9             	neg    %rcx
   140123ed1:	48 c1 e1 03          	shl    $0x3,%rcx
   140123ed5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   140123edc:	00 00 00 00 
   140123ee0:	48 8b 54 06 f8       	mov    -0x8(%rsi,%rax,1),%rdx
   140123ee5:	49 89 54 00 f8       	mov    %rdx,-0x8(%r8,%rax,1)
   140123eea:	48 83 e8 08          	sub    $0x8,%rax
   140123eee:	48 39 c8             	cmp    %rcx,%rax
   140123ef1:	75 ed                	jne    140123ee0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4940>
   140123ef3:	48 01 c6             	add    %rax,%rsi
   140123ef6:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140123efd:	00 
   140123efe:	e8 5d f9 01 00       	call   140143860 <setun::ArrayObject::try_promote()>
   140123f03:	45 84 e4             	test   %r12b,%r12b
   140123f06:	0f 85 fb 3c 00 00    	jne    140127c07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8667>
   140123f0c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   140123f13:	00 
   140123f14:	48 89 84 24 00 06 00 	mov    %rax,0x600(%rsp)
   140123f1b:	00 
   140123f1c:	f0 83 47 08 01       	lock addl $0x1,0x8(%rdi)
   140123f21:	48 8d 94 24 00 06 00 	lea    0x600(%rsp),%rdx
   140123f28:	00 
   140123f29:	48 8d 8c 24 c0 04 00 	lea    0x4c0(%rsp),%rcx
   140123f30:	00 
   140123f31:	48 89 bc 24 08 06 00 	mov    %rdi,0x608(%rsp)
   140123f38:	00 
   140123f39:	e8 02 2b 0e 00       	call   140206a40 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   140123f3e:	48 8b 84 24 c0 04 00 	mov    0x4c0(%rsp),%rax
   140123f45:	00 
   140123f46:	48 8b 8c 24 08 06 00 	mov    0x608(%rsp),%rcx
   140123f4d:	00 
   140123f4e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123f55:	00 
   140123f56:	48 85 c9             	test   %rcx,%rcx
   140123f59:	74 05                	je     140123f60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49c0>
   140123f5b:	e8 60 b8 1a 00       	call   1402cf7c0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140123f60:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123f66:	48 89 f9             	mov    %rdi,%rcx
   140123f69:	e8 52 b8 1a 00       	call   1402cf7c0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140123f6e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123f75:	0f 84 95 17 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   140123f7b:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140123f7f:	48 8d 3d 1a 31 29 00 	lea    0x29311a(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123f86:	48 83 c5 03          	add    $0x3,%rbp
   140123f8a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123f8e:	ff e0                	jmp    *%rax
   140123f90:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123f97:	00 fb ff 
   140123f9a:	48 89 84 24 b8 02 00 	mov    %rax,0x2b8(%rsp)
   140123fa1:	00 
   140123fa2:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   140123fa9:	00 
   140123faa:	41 80 fc 02          	cmp    $0x2,%r12b
   140123fae:	0f 85 4a 65 00 00    	jne    14012a4fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf5e>
   140123fb4:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   140123fb9:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123fc0:	00 
   140123fc1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123fc8:	00 ff ff 
   140123fcb:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140123fd2:	00 fd ff 
   140123fd5:	48 21 fa             	and    %rdi,%rdx
   140123fd8:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   140123fdf:	00 
   140123fe0:	48 89 f8             	mov    %rdi,%rax
   140123fe3:	48 89 bc 24 b8 02 00 	mov    %rdi,0x2b8(%rsp)
   140123fea:	00 
   140123feb:	48 39 ca             	cmp    %rcx,%rdx
   140123fee:	0f 84 9c 34 00 00    	je     140127490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef0>
   140123ff4:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140123ffb:	00 f8 ff 
   140123ffe:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124004:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012400b:	00 
   14012400c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124013:	0f 84 40 67 00 00    	je     14012a759 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1b9>
   140124019:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012401d:	48 8d 3d 7c 30 29 00 	lea    0x29307c(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124024:	48 83 c5 01          	add    $0x1,%rbp
   140124028:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012402c:	ff e0                	jmp    *%rax
   14012402e:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124035:	00 fb ff 
   140124038:	48 89 84 24 c8 02 00 	mov    %rax,0x2c8(%rsp)
   14012403f:	00 
   140124040:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   140124047:	00 
   140124048:	41 80 fc 01          	cmp    $0x1,%r12b
   14012404c:	0f 85 fd 5e 00 00    	jne    140129f4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9af>
   140124052:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124059:	00 
   14012405a:	45 31 e4             	xor    %r12d,%r12d
   14012405d:	48 89 84 24 c8 02 00 	mov    %rax,0x2c8(%rsp)
   140124064:	00 
   140124065:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   140124069:	48 83 ee 10          	sub    $0x10,%rsi
   14012406d:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   140124074:	00 
   140124075:	48 8b 16             	mov    (%rsi),%rdx
   140124078:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   14012407f:	00 ff ff 
   140124082:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140124089:	00 fd ff 
   14012408c:	48 21 d0             	and    %rdx,%rax
   14012408f:	48 39 c8             	cmp    %rcx,%rax
   140124092:	0f 84 e3 23 00 00    	je     14012647b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6edb>
   140124098:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012409f:	0f 84 29 5f 00 00    	je     140129fce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa2e>
   1401240a5:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401240a9:	48 8d 3d f0 2f 29 00 	lea    0x292ff0(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401240b0:	48 83 c5 01          	add    $0x1,%rbp
   1401240b4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401240b8:	ff e0                	jmp    *%rax
   1401240ba:	45 84 e4             	test   %r12b,%r12b
   1401240bd:	0f 84 dd 16 00 00    	je     1401257a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6200>
   1401240c3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401240c7:	0f 84 01 51 00 00    	je     1401291ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c2e>
   1401240cd:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401240d1:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401240d6:	0f 83 49 8e 00 00    	jae    14012cf25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd985>
   1401240dc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401240e1:	48 89 06             	mov    %rax,(%rsi)
   1401240e4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401240eb:	00 
   1401240ec:	4c 89 c6             	mov    %r8,%rsi
   1401240ef:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401240f4:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401240fb:	4a 8b 04 e8          	mov    (%rax,%r13,8),%rax
   1401240ff:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124106:	00 
   140124107:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012410e:	0f 84 e4 15 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124114:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124118:	48 8d 3d 81 2f 29 00 	lea    0x292f81(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012411f:	48 83 c5 01          	add    $0x1,%rbp
   140124123:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124127:	ff e0                	jmp    *%rax
   140124129:	45 84 e4             	test   %r12b,%r12b
   14012412c:	0f 84 4f 16 00 00    	je     140125781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61e1>
   140124132:	41 80 fc 01          	cmp    $0x1,%r12b
   140124136:	0f 84 3a 50 00 00    	je     140129176 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd6>
   14012413c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140124140:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140124145:	0f 83 99 83 00 00    	jae    14012c4e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf44>
   14012414b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124150:	48 89 06             	mov    %rax,(%rsi)
   140124153:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012415a:	00 
   14012415b:	4c 89 c6             	mov    %r8,%rsi
   14012415e:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140124163:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012416a:	4a 8b 44 e8 08       	mov    0x8(%rax,%r13,8),%rax
   14012416f:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124176:	00 
   140124177:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012417e:	0f 84 74 15 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124184:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124188:	48 8d 3d 11 2f 29 00 	lea    0x292f11(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012418f:	48 83 c5 01          	add    $0x1,%rbp
   140124193:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124197:	ff e0                	jmp    *%rax
   140124199:	45 84 e4             	test   %r12b,%r12b
   14012419c:	0f 84 c0 15 00 00    	je     140125762 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61c2>
   1401241a2:	41 80 fc 01          	cmp    $0x1,%r12b
   1401241a6:	0f 84 f6 4f 00 00    	je     1401291a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c02>
   1401241ac:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401241b0:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401241b5:	0f 83 f5 84 00 00    	jae    14012c6b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd110>
   1401241bb:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401241c0:	48 89 06             	mov    %rax,(%rsi)
   1401241c3:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401241ca:	00 
   1401241cb:	4c 89 c6             	mov    %r8,%rsi
   1401241ce:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401241d3:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401241da:	4a 8b 44 e8 10       	mov    0x10(%rax,%r13,8),%rax
   1401241df:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401241e6:	00 
   1401241e7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401241ee:	0f 84 04 15 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   1401241f4:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401241f8:	48 8d 3d a1 2e 29 00 	lea    0x292ea1(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401241ff:	48 83 c5 01          	add    $0x1,%rbp
   140124203:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124207:	ff e0                	jmp    *%rax
   140124209:	45 84 e4             	test   %r12b,%r12b
   14012420c:	0f 84 31 15 00 00    	je     140125743 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61a3>
   140124212:	41 80 fc 01          	cmp    $0x1,%r12b
   140124216:	0f 84 2e 4f 00 00    	je     14012914a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9baa>
   14012421c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140124220:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140124225:	0f 83 42 96 00 00    	jae    14012d86d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2cd>
   14012422b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124230:	48 89 06             	mov    %rax,(%rsi)
   140124233:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012423a:	00 
   14012423b:	4c 89 c6             	mov    %r8,%rsi
   14012423e:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140124243:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012424a:	4a 8b 44 e8 18       	mov    0x18(%rax,%r13,8),%rax
   14012424f:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124256:	00 
   140124257:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012425e:	0f 84 94 14 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124264:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124268:	48 8d 3d 31 2e 29 00 	lea    0x292e31(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012426f:	48 83 c5 01          	add    $0x1,%rbp
   140124273:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124277:	ff e0                	jmp    *%rax
   140124279:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012427d:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   140124284:	00 
   140124285:	45 84 e4             	test   %r12b,%r12b
   140124288:	48 0f 44 c2          	cmove  %rdx,%rax
   14012428c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140124293:	48 8b 00             	mov    (%rax),%rax
   140124296:	4a 89 04 ea          	mov    %rax,(%rdx,%r13,8)
   14012429a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401242a1:	0f 84 51 14 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   1401242a7:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401242ab:	48 8d 3d ee 2d 29 00 	lea    0x292dee(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242b2:	48 83 c5 01          	add    $0x1,%rbp
   1401242b6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401242ba:	ff e0                	jmp    *%rax
   1401242bc:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401242c0:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   1401242c7:	00 
   1401242c8:	45 84 e4             	test   %r12b,%r12b
   1401242cb:	48 0f 44 c2          	cmove  %rdx,%rax
   1401242cf:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401242d6:	48 8b 00             	mov    (%rax),%rax
   1401242d9:	4a 89 44 ea 08       	mov    %rax,0x8(%rdx,%r13,8)
   1401242de:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401242e5:	0f 84 0d 14 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   1401242eb:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401242ef:	48 8d 3d aa 2d 29 00 	lea    0x292daa(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242f6:	48 83 c5 01          	add    $0x1,%rbp
   1401242fa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401242fe:	ff e0                	jmp    *%rax
   140124300:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140124304:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   14012430b:	00 
   14012430c:	45 84 e4             	test   %r12b,%r12b
   14012430f:	48 0f 44 c2          	cmove  %rdx,%rax
   140124313:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   14012431a:	48 8b 00             	mov    (%rax),%rax
   14012431d:	4a 89 44 ea 10       	mov    %rax,0x10(%rdx,%r13,8)
   140124322:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124329:	0f 84 c9 13 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   14012432f:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124333:	48 8d 3d 66 2d 29 00 	lea    0x292d66(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012433a:	48 83 c5 01          	add    $0x1,%rbp
   14012433e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124342:	ff e0                	jmp    *%rax
   140124344:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140124348:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   14012434f:	00 
   140124350:	45 84 e4             	test   %r12b,%r12b
   140124353:	48 0f 44 c2          	cmove  %rdx,%rax
   140124357:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   14012435e:	48 8b 00             	mov    (%rax),%rax
   140124361:	4a 89 44 ea 18       	mov    %rax,0x18(%rdx,%r13,8)
   140124366:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012436d:	0f 84 85 13 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124373:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124377:	48 8d 3d 22 2d 29 00 	lea    0x292d22(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012437e:	48 83 c5 01          	add    $0x1,%rbp
   140124382:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124386:	ff e0                	jmp    *%rax
   140124388:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   14012438c:	44 0f b7 45 02       	movzwl 0x2(%rbp),%r8d
   140124391:	4c 8d 75 04          	lea    0x4(%rbp),%r14
   140124395:	4c 01 ef             	add    %r13,%rdi
   140124398:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   14012439f:	0f 83 d1 63 00 00    	jae    14012a776 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1d6>
   1401243a5:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401243ac:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401243b3:	00 ff ff 
   1401243b6:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401243bd:	00 f8 ff 
   1401243c0:	48 8d 3c f8          	lea    (%rax,%rdi,8),%rdi
   1401243c4:	48 8b 07             	mov    (%rdi),%rax
   1401243c7:	48 21 c2             	and    %rax,%rdx
   1401243ca:	48 39 ca             	cmp    %rcx,%rdx
   1401243cd:	0f 85 9c 4b 00 00    	jne    140128f6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99cf>
   1401243d3:	48 c1 e0 10          	shl    $0x10,%rax
   1401243d7:	4d 0f bf c0          	movswq %r8w,%r8
   1401243db:	48 b9 00 00 00 00 00 	movabs $0x800000000000,%rcx
   1401243e2:	80 00 00 
   1401243e5:	49 b9 ff ff ff ff ff 	movabs $0xffffffffffff,%r9
   1401243ec:	ff 00 00 
   1401243ef:	48 c1 f8 10          	sar    $0x10,%rax
   1401243f3:	4c 01 c0             	add    %r8,%rax
   1401243f6:	48 01 c1             	add    %rax,%rcx
   1401243f9:	49 39 c9             	cmp    %rcx,%r9
   1401243fc:	0f 82 71 4b 00 00    	jb     140128f73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99d3>
   140124402:	4c 21 c8             	and    %r9,%rax
   140124405:	48 09 d0             	or     %rdx,%rax
   140124408:	48 89 07             	mov    %rax,(%rdi)
   14012440b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124412:	0f 84 f5 12 00 00    	je     14012570d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x616d>
   140124418:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   14012441c:	48 8d 3d 7d 2c 29 00 	lea    0x292c7d(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124423:	48 83 c5 05          	add    $0x5,%rbp
   140124427:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012442b:	ff e0                	jmp    *%rax
   14012442d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124434:	00 fb ff 
   140124437:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   14012443e:	00 
   14012443f:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   140124446:	00 
   140124447:	41 80 fc 02          	cmp    $0x2,%r12b
   14012444b:	0f 85 67 5c 00 00    	jne    14012a0b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab18>
   140124451:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124458:	00 
   140124459:	45 31 e4             	xor    %r12d,%r12d
   14012445c:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   140124463:	00 
   140124464:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124469:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   140124470:	00 
   140124471:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140124478:	ff ff ff 
   14012447b:	48 ba 00 00 00 00 03 	movabs $0xfffd000300000000,%rdx
   140124482:	00 fd ff 
   140124485:	48 23 84 24 e0 02 00 	and    0x2e0(%rsp),%rax
   14012448c:	00 
   14012448d:	48 39 d0             	cmp    %rdx,%rax
   140124490:	0f 84 ba 54 00 00    	je     140129950 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3b0>
   140124496:	48 8b 94 24 e0 02 00 	mov    0x2e0(%rsp),%rdx
   14012449d:	00 
   14012449e:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401244a5:	00 ff ff 
   1401244a8:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   1401244af:	00 fd ff 
   1401244b2:	48 21 d0             	and    %rdx,%rax
   1401244b5:	48 39 c8             	cmp    %rcx,%rax
   1401244b8:	0f 84 05 2b 00 00    	je     140126fc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a23>
   1401244be:	45 84 e4             	test   %r12b,%r12b
   1401244c1:	0f 84 a9 39 00 00    	je     140127e70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88d0>
   1401244c7:	41 80 fc 01          	cmp    $0x1,%r12b
   1401244cb:	0f 84 b7 4e 00 00    	je     140129388 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9de8>
   1401244d1:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401244d5:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401244da:	0f 83 3e a8 00 00    	jae    14012ed1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf77e>
   1401244e0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401244e5:	48 89 06             	mov    %rax,(%rsi)
   1401244e8:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401244ef:	00 
   1401244f0:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1401244f5:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   1401244fc:	00 f8 ff 
   1401244ff:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124506:	00 
   140124507:	4c 89 c6             	mov    %r8,%rsi
   14012450a:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140124510:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124517:	0f 84 2d 49 00 00    	je     140128e4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98aa>
   14012451d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124521:	48 8d 3d 78 2b 29 00 	lea    0x292b78(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124528:	48 83 c5 01          	add    $0x1,%rbp
   14012452c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124530:	ff e0                	jmp    *%rax
   140124532:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124539:	00 fb ff 
   14012453c:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   140124543:	00 
   140124544:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   14012454b:	00 
   14012454c:	41 80 fc 01          	cmp    $0x1,%r12b
   140124550:	0f 85 f2 62 00 00    	jne    14012a848 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2a8>
   140124556:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012455d:	00 
   14012455e:	45 31 e4             	xor    %r12d,%r12d
   140124561:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   140124568:	00 
   140124569:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   14012456d:	48 83 ee 10          	sub    $0x10,%rsi
   140124571:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   140124578:	00 
   140124579:	48 8b 3e             	mov    (%rsi),%rdi
   14012457c:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140124583:	00 ff ff 
   140124586:	48 89 f9             	mov    %rdi,%rcx
   140124589:	48 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%rax
   140124590:	00 fd ff 
   140124593:	4c 21 c1             	and    %r8,%rcx
   140124596:	48 39 c1             	cmp    %rax,%rcx
   140124599:	0f 84 a4 1a 00 00    	je     140126043 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6aa3>
   14012459f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401245a6:	0f 84 87 5c 00 00    	je     14012a233 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   1401245ac:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401245b0:	48 8d 3d e9 2a 29 00 	lea    0x292ae9(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401245b7:	48 83 c5 01          	add    $0x1,%rbp
   1401245bb:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401245bf:	ff e0                	jmp    *%rax
   1401245c1:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   1401245c5:	0f b7 4d 06          	movzwl 0x6(%rbp),%ecx
   1401245c9:	4c 8d 75 08          	lea    0x8(%rbp),%r14
   1401245cd:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401245d4:	0f b7 7d 04          	movzwl 0x4(%rbp),%edi
   1401245d8:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   1401245dd:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401245e1:	66 89 8c 24 80 00 00 	mov    %cx,0x80(%rsp)
   1401245e8:	00 
   1401245e9:	4c 01 e8             	add    %r13,%rax
   1401245ec:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   1401245f0:	c5 f8 77             	vzeroupper
   1401245f3:	e8 98 da 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   1401245f8:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401245ff:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   140124606:	00 
   140124607:	0f b7 44 24 60       	movzwl 0x60(%rsp),%eax
   14012460c:	4c 01 e8             	add    %r13,%rax
   14012460f:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140124613:	e8 78 da 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124618:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   14012461f:	48 89 c5             	mov    %rax,%rbp
   140124622:	0f b7 c7             	movzwl %di,%eax
   140124625:	4c 01 e8             	add    %r13,%rax
   140124628:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   14012462c:	e8 5f da 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124631:	48 85 c0             	test   %rax,%rax
   140124634:	0f 84 e7 59 00 00    	je     14012a021 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa81>
   14012463a:	0f 8e 4e 12 00 00    	jle    14012588e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62ee>
   140124640:	48 39 ac 24 a0 00 00 	cmp    %rbp,0xa0(%rsp)
   140124647:	00 
   140124648:	0f 9c c2             	setl   %dl
   14012464b:	48 0f bf 84 24 80 00 	movswq 0x80(%rsp),%rax
   140124652:	00 00 
   140124654:	4c 01 f0             	add    %r14,%rax
   140124657:	84 d2                	test   %dl,%dl
   140124659:	4c 0f 44 f0          	cmove  %rax,%r14
   14012465d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124664:	0f 84 a6 10 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   14012466a:	41 0f b6 06          	movzbl (%r14),%eax
   14012466e:	48 8d 3d 2b 2a 29 00 	lea    0x292a2b(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124675:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   140124679:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012467c:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124683:	00 fb ff 
   140124686:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   14012468d:	00 
   14012468e:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
   140124695:	00 
   140124696:	41 80 fc 02          	cmp    $0x2,%r12b
   14012469a:	0f 85 57 62 00 00    	jne    14012a8f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb357>
   1401246a0:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401246a7:	00 
   1401246a8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401246ae:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
   1401246b5:	00 
   1401246b6:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401246bb:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   1401246c2:	00 
   1401246c3:	48 89 c2             	mov    %rax,%rdx
   1401246c6:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401246cd:	00 ff ff 
   1401246d0:	49 89 d0             	mov    %rdx,%r8
   1401246d3:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401246da:	00 f8 ff 
   1401246dd:	49 21 c0             	and    %rax,%r8
   1401246e0:	49 39 c8             	cmp    %rcx,%r8
   1401246e3:	0f 84 1a 27 00 00    	je     140126e03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7863>
   1401246e9:	c6 45 ff 20          	movb   $0x20,-0x1(%rbp)
   1401246ed:	48 8d 94 24 10 03 00 	lea    0x310(%rsp),%rdx
   1401246f4:	00 
   1401246f5:	48 8d 8c 24 08 03 00 	lea    0x308(%rsp),%rcx
   1401246fc:	00 
   1401246fd:	c5 f8 77             	vzeroupper
   140124700:	e8 bb be 0e 00       	call   1402105c0 <setun::VMValue::add(setun::VMValue const&) const>
   140124705:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012470c:	00 
   14012470d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124714:	0f 84 cf 0f 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   14012471a:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012471e:	48 8d 3d 7b 29 29 00 	lea    0x29297b(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124725:	48 83 c5 01          	add    $0x1,%rbp
   140124729:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012472d:	ff e0                	jmp    *%rax
   14012472f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124736:	00 fb ff 
   140124739:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140124740:	00 
   140124741:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140124748:	00 
   140124749:	41 80 fc 02          	cmp    $0x2,%r12b
   14012474d:	0f 85 43 58 00 00    	jne    140129f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9f6>
   140124753:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012475a:	00 
   14012475b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124761:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140124768:	00 
   140124769:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012476e:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140124775:	00 
   140124776:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012477d:	00 ff ff 
   140124780:	48 89 c1             	mov    %rax,%rcx
   140124783:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012478a:	00 f8 ff 
   14012478d:	48 21 d1             	and    %rdx,%rcx
   140124790:	4c 39 c1             	cmp    %r8,%rcx
   140124793:	0f 84 87 24 00 00    	je     140126c20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7680>
   140124799:	c6 45 ff 21          	movb   $0x21,-0x1(%rbp)
   14012479d:	48 8d 94 24 20 03 00 	lea    0x320(%rsp),%rdx
   1401247a4:	00 
   1401247a5:	48 8d 8c 24 18 03 00 	lea    0x318(%rsp),%rcx
   1401247ac:	00 
   1401247ad:	c5 f8 77             	vzeroupper
   1401247b0:	e8 fb d5 0e 00       	call   140211db0 <setun::VMValue::sub(setun::VMValue const&) const>
   1401247b5:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401247bc:	00 
   1401247bd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401247c4:	0f 84 1f 0f 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   1401247ca:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401247ce:	48 8d 3d cb 28 29 00 	lea    0x2928cb(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401247d5:	48 83 c5 01          	add    $0x1,%rbp
   1401247d9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401247dd:	ff e0                	jmp    *%rax
   1401247df:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401247e6:	00 fb ff 
   1401247e9:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   1401247f0:	00 
   1401247f1:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   1401247f8:	00 
   1401247f9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401247fd:	0f 85 5b 59 00 00    	jne    14012a15e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabbe>
   140124803:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012480a:	00 
   14012480b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124811:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   140124818:	00 
   140124819:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012481e:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   140124825:	00 
   140124826:	48 89 c2             	mov    %rax,%rdx
   140124829:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140124830:	00 ff ff 
   140124833:	49 89 d0             	mov    %rdx,%r8
   140124836:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   14012483d:	00 f8 ff 
   140124840:	49 21 c0             	and    %rax,%r8
   140124843:	49 39 c8             	cmp    %rcx,%r8
   140124846:	0f 84 c6 24 00 00    	je     140126d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7772>
   14012484c:	c6 45 ff 22          	movb   $0x22,-0x1(%rbp)
   140124850:	48 8d 94 24 30 03 00 	lea    0x330(%rsp),%rdx
   140124857:	00 
   140124858:	48 8d 8c 24 28 03 00 	lea    0x328(%rsp),%rcx
   14012485f:	00 
   140124860:	c5 f8 77             	vzeroupper
   140124863:	e8 c8 cc 0e 00       	call   140211530 <setun::VMValue::mul(setun::VMValue const&) const>
   140124868:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012486f:	00 
   140124870:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124877:	0f 84 6c 0e 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   14012487d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124881:	48 8d 3d 18 28 29 00 	lea    0x292818(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124888:	48 83 c5 01          	add    $0x1,%rbp
   14012488c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124890:	ff e0                	jmp    *%rax
   140124892:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124899:	00 fb ff 
   14012489c:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   1401248a3:	00 
   1401248a4:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   1401248ab:	00 
   1401248ac:	41 80 fc 02          	cmp    $0x2,%r12b
   1401248b0:	0f 85 ea 62 00 00    	jne    14012aba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb600>
   1401248b6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401248bd:	00 
   1401248be:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401248c4:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   1401248cb:	00 
   1401248cc:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401248d1:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   1401248d8:	00 
   1401248d9:	48 89 c2             	mov    %rax,%rdx
   1401248dc:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401248e3:	00 ff ff 
   1401248e6:	48 89 d1             	mov    %rdx,%rcx
   1401248e9:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401248f0:	00 f8 ff 
   1401248f3:	48 21 c1             	and    %rax,%rcx
   1401248f6:	4c 39 c1             	cmp    %r8,%rcx
   1401248f9:	0f 84 a3 1a 00 00    	je     1401263a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e02>
   1401248ff:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124906:	00 ff ff 
   140124909:	c6 45 ff 32          	movb   $0x32,-0x1(%rbp)
   14012490d:	48 8b 84 24 38 03 00 	mov    0x338(%rsp),%rax
   140124914:	00 
   140124915:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012491c:	00 f8 ff 
   14012491f:	48 89 c1             	mov    %rax,%rcx
   140124922:	48 21 d1             	and    %rdx,%rcx
   140124925:	4c 39 c1             	cmp    %r8,%rcx
   140124928:	0f 84 15 2a 00 00    	je     140127343 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7da3>
   14012492e:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140124935:	00 fd ff 
   140124938:	4c 39 c1             	cmp    %r8,%rcx
   14012493b:	0f 84 f5 29 00 00    	je     140127336 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d96>
   140124941:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140124948:	ff f7 ff 
   14012494b:	48 39 c1             	cmp    %rax,%rcx
   14012494e:	0f 83 66 34 00 00    	jae    140127dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140124954:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   14012495b:	00 fc ff 
   14012495e:	4c 39 c8             	cmp    %r9,%rax
   140124961:	0f 84 53 34 00 00    	je     140127dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140124967:	48 8b 84 24 40 03 00 	mov    0x340(%rsp),%rax
   14012496e:	00 
   14012496f:	48 39 c1             	cmp    %rax,%rcx
   140124972:	0f 83 42 34 00 00    	jae    140127dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140124978:	4c 39 c8             	cmp    %r9,%rax
   14012497b:	0f 84 39 34 00 00    	je     140127dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140124981:	48 21 c2             	and    %rax,%rdx
   140124984:	4c 39 c2             	cmp    %r8,%rdx
   140124987:	0f 84 a0 6e 00 00    	je     14012b82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc28d>
   14012498d:	48 8d 8c 24 38 03 00 	lea    0x338(%rsp),%rcx
   140124994:	00 
   140124995:	c5 f8 77             	vzeroupper
   140124998:	e8 f3 d6 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   14012499d:	48 8d 8c 24 40 03 00 	lea    0x340(%rsp),%rcx
   1401249a4:	00 
   1401249a5:	48 89 c7             	mov    %rax,%rdi
   1401249a8:	e8 e3 d6 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   1401249ad:	48 39 c7             	cmp    %rax,%rdi
   1401249b0:	0f 9c c0             	setl   %al
   1401249b3:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401249ba:	00 fa ff 
   1401249bd:	0f b6 c0             	movzbl %al,%eax
   1401249c0:	48 01 d0             	add    %rdx,%rax
   1401249c3:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401249ca:	00 
   1401249cb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401249d2:	0f 84 11 0d 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   1401249d8:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401249dc:	48 8d 3d bd 26 29 00 	lea    0x2926bd(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401249e3:	48 83 c5 01          	add    $0x1,%rbp
   1401249e7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401249eb:	ff e0                	jmp    *%rax
   1401249ed:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401249f4:	00 fb ff 
   1401249f7:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   1401249fe:	00 
   1401249ff:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   140124a06:	00 
   140124a07:	41 80 fc 02          	cmp    $0x2,%r12b
   140124a0b:	0f 85 9d 5f 00 00    	jne    14012a9ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb40e>
   140124a11:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124a18:	00 
   140124a19:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124a1f:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   140124a26:	00 
   140124a27:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124a2c:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   140124a33:	00 
   140124a34:	48 89 c2             	mov    %rax,%rdx
   140124a37:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140124a3e:	00 ff ff 
   140124a41:	48 89 d1             	mov    %rdx,%rcx
   140124a44:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140124a4b:	00 f8 ff 
   140124a4e:	48 21 c1             	and    %rax,%rcx
   140124a51:	4c 39 c1             	cmp    %r8,%rcx
   140124a54:	0f 84 ad 1f 00 00    	je     140126a07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7467>
   140124a5a:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124a61:	00 ff ff 
   140124a64:	c6 45 ff 33          	movb   $0x33,-0x1(%rbp)
   140124a68:	48 8b 84 24 48 03 00 	mov    0x348(%rsp),%rax
   140124a6f:	00 
   140124a70:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140124a77:	00 f8 ff 
   140124a7a:	48 89 c1             	mov    %rax,%rcx
   140124a7d:	48 21 d1             	and    %rdx,%rcx
   140124a80:	4c 39 c1             	cmp    %r8,%rcx
   140124a83:	0f 84 7f 26 00 00    	je     140127108 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b68>
   140124a89:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140124a90:	00 fd ff 
   140124a93:	4c 39 c1             	cmp    %r8,%rcx
   140124a96:	0f 84 5f 26 00 00    	je     1401270fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b5b>
   140124a9c:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140124aa3:	ff f7 ff 
   140124aa6:	48 39 c1             	cmp    %rax,%rcx
   140124aa9:	0f 83 57 32 00 00    	jae    140127d06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8766>
   140124aaf:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140124ab6:	00 fc ff 
   140124ab9:	4c 39 c8             	cmp    %r9,%rax
   140124abc:	0f 84 44 32 00 00    	je     140127d06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8766>
   140124ac2:	48 8b 84 24 50 03 00 	mov    0x350(%rsp),%rax
   140124ac9:	00 
   140124aca:	4c 39 c8             	cmp    %r9,%rax
   140124acd:	0f 84 33 32 00 00    	je     140127d06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8766>
   140124ad3:	48 39 c1             	cmp    %rax,%rcx
   140124ad6:	0f 83 2a 32 00 00    	jae    140127d06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8766>
   140124adc:	48 21 c2             	and    %rax,%rdx
   140124adf:	4c 39 c2             	cmp    %r8,%rdx
   140124ae2:	0f 84 a8 67 00 00    	je     14012b290 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcf0>
   140124ae8:	48 8d 8c 24 48 03 00 	lea    0x348(%rsp),%rcx
   140124aef:	00 
   140124af0:	c5 f8 77             	vzeroupper
   140124af3:	e8 98 d5 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124af8:	48 8d 8c 24 50 03 00 	lea    0x350(%rsp),%rcx
   140124aff:	00 
   140124b00:	48 89 c7             	mov    %rax,%rdi
   140124b03:	e8 88 d5 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124b08:	48 39 c7             	cmp    %rax,%rdi
   140124b0b:	0f 9e c0             	setle  %al
   140124b0e:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140124b15:	00 fa ff 
   140124b18:	0f b6 c0             	movzbl %al,%eax
   140124b1b:	48 01 d0             	add    %rdx,%rax
   140124b1e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124b25:	00 
   140124b26:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124b2d:	0f 84 b6 0b 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140124b33:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124b37:	48 8d 3d 62 25 29 00 	lea    0x292562(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124b3e:	48 83 c5 01          	add    $0x1,%rbp
   140124b42:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124b46:	ff e0                	jmp    *%rax
   140124b48:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124b4f:	00 fb ff 
   140124b52:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140124b59:	00 
   140124b5a:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140124b61:	00 
   140124b62:	41 80 fc 02          	cmp    $0x2,%r12b
   140124b66:	0f 85 b5 5b 00 00    	jne    14012a721 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb181>
   140124b6c:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124b73:	00 
   140124b74:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124b7a:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140124b81:	00 
   140124b82:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140124b87:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140124b8e:	00 
   140124b8f:	48 89 c2             	mov    %rax,%rdx
   140124b92:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140124b99:	00 ff ff 
   140124b9c:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140124ba3:	00 f8 ff 
   140124ba6:	48 21 c2             	and    %rax,%rdx
   140124ba9:	48 39 ca             	cmp    %rcx,%rdx
   140124bac:	0f 84 98 1f 00 00    	je     140126b4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75aa>
   140124bb2:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124bb9:	00 ff ff 
   140124bbc:	c6 45 ff 30          	movb   $0x30,-0x1(%rbp)
   140124bc0:	48 8b 84 24 58 03 00 	mov    0x358(%rsp),%rax
   140124bc7:	00 
   140124bc8:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140124bcf:	00 f8 ff 
   140124bd2:	48 89 c1             	mov    %rax,%rcx
   140124bd5:	48 21 d1             	and    %rdx,%rcx
   140124bd8:	4c 39 c1             	cmp    %r8,%rcx
   140124bdb:	0f 84 44 26 00 00    	je     140127225 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c85>
   140124be1:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140124be8:	00 fd ff 
   140124beb:	4c 39 c1             	cmp    %r8,%rcx
   140124bee:	0f 84 24 26 00 00    	je     140127218 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c78>
   140124bf4:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140124bfb:	ff f7 ff 
   140124bfe:	48 39 c1             	cmp    %rax,%rcx
   140124c01:	0f 83 bd 30 00 00    	jae    140127cc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8724>
   140124c07:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140124c0e:	00 fc ff 
   140124c11:	4c 39 c8             	cmp    %r9,%rax
   140124c14:	0f 84 aa 30 00 00    	je     140127cc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8724>
   140124c1a:	48 8b 84 24 60 03 00 	mov    0x360(%rsp),%rax
   140124c21:	00 
   140124c22:	48 39 c1             	cmp    %rax,%rcx
   140124c25:	0f 83 99 30 00 00    	jae    140127cc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8724>
   140124c2b:	4c 39 c8             	cmp    %r9,%rax
   140124c2e:	0f 84 90 30 00 00    	je     140127cc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8724>
   140124c34:	48 21 c2             	and    %rax,%rdx
   140124c37:	4c 39 c2             	cmp    %r8,%rdx
   140124c3a:	0f 84 29 63 00 00    	je     14012af69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9c9>
   140124c40:	48 8d 8c 24 58 03 00 	lea    0x358(%rsp),%rcx
   140124c47:	00 
   140124c48:	c5 f8 77             	vzeroupper
   140124c4b:	e8 40 d4 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124c50:	48 8d 8c 24 60 03 00 	lea    0x360(%rsp),%rcx
   140124c57:	00 
   140124c58:	48 89 c7             	mov    %rax,%rdi
   140124c5b:	e8 30 d4 0e 00       	call   140212090 <setun::VMValue::as_int() const>
   140124c60:	48 39 c7             	cmp    %rax,%rdi
   140124c63:	40 0f 94 c7          	sete   %dil
   140124c67:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140124c6e:	00 fa ff 
   140124c71:	40 0f b6 c7          	movzbl %dil,%eax
   140124c75:	48 01 d0             	add    %rdx,%rax
   140124c78:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124c7f:	00 
   140124c80:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124c87:	0f 84 5c 0a 00 00    	je     1401256e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6149>
   140124c8d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124c91:	48 8d 3d 08 24 29 00 	lea    0x292408(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c98:	48 83 c5 01          	add    $0x1,%rbp
   140124c9c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124ca0:	ff e0                	jmp    *%rax
   140124ca2:	44 0f b7 45 00       	movzwl 0x0(%rbp),%r8d
   140124ca7:	49 8b 8f b8 00 00 00 	mov    0xb8(%r15),%rcx
   140124cae:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140124cb2:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124cb9:	00 fb ff 
   140124cbc:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140124cc3:	00 
   140124cc4:	41 80 fc 01          	cmp    $0x1,%r12b
   140124cc8:	0f 85 57 5e 00 00    	jne    14012ab25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb585>
   140124cce:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124cd5:	00 
   140124cd6:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124cdd:	00 ff ff 
   140124ce0:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   140124ce7:	00 fd ff 
   140124cea:	48 21 c2             	and    %rax,%rdx
   140124ced:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140124cf4:	00 
   140124cf5:	4c 39 ca             	cmp    %r9,%rdx
   140124cf8:	0f 84 cd 28 00 00    	je     1401275cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x802b>
   140124cfe:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124d04:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140124d0b:	00 f8 ff 
   140124d0e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124d15:	00 
   140124d16:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124d1d:	0f 84 ea 09 00 00    	je     14012570d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x616d>
   140124d23:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140124d27:	48 8d 3d 72 23 29 00 	lea    0x292372(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d2e:	48 83 c5 03          	add    $0x3,%rbp
   140124d32:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124d36:	ff e0                	jmp    *%rax
   140124d38:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140124d3c:	49 8b 97 b8 00 00 00 	mov    0xb8(%r15),%rdx
   140124d43:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140124d47:	41 80 fc 02          	cmp    $0x2,%r12b
   140124d4b:	0f 85 d4 5a 00 00    	jne    14012a825 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb285>
   140124d51:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140124d58:	00 
   140124d59:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140124d5e:	45 31 e4             	xor    %r12d,%r12d
   140124d61:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   140124d68:	00 
   140124d69:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140124d70:	ff ff ff 
   140124d73:	49 b8 00 00 00 00 02 	movabs $0xfffd000200000000,%r8
   140124d7a:	00 fd ff 
   140124d7d:	48 21 c8             	and    %rcx,%rax
   140124d80:	4c 39 c0             	cmp    %r8,%rax
   140124d83:	0f 84 d0 4f 00 00    	je     140129d59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7b9>
   140124d89:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124d90:	0f 84 77 09 00 00    	je     14012570d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x616d>
   140124d96:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140124d9a:	48 8d 3d ff 22 29 00 	lea    0x2922ff(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124da1:	48 83 c5 03          	add    $0x3,%rbp
   140124da5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124da9:	ff e0                	jmp    *%rax
   140124dab:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124db2:	41 80 fc 01          	cmp    $0x1,%r12b
   140124db6:	0f 85 4e 5d 00 00    	jne    14012ab0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb56a>
   140124dbc:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140124dc3:	00 
   140124dc4:	45 31 e4             	xor    %r12d,%r12d
   140124dc7:	4a 89 14 e8          	mov    %rdx,(%rax,%r13,8)
   140124dcb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124dd2:	0f 84 20 09 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124dd8:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124ddc:	48 8d 3d bd 22 29 00 	lea    0x2922bd(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124de3:	48 83 c5 01          	add    $0x1,%rbp
   140124de7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124deb:	ff e0                	jmp    *%rax
   140124ded:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124df4:	41 80 fc 01          	cmp    $0x1,%r12b
   140124df8:	0f 85 0b 5a 00 00    	jne    14012a809 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb269>
   140124dfe:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140124e05:	00 
   140124e06:	45 31 e4             	xor    %r12d,%r12d
   140124e09:	4a 89 54 e8 08       	mov    %rdx,0x8(%rax,%r13,8)
   140124e0e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e15:	0f 84 dd 08 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124e1b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124e1f:	48 8d 3d 7a 22 29 00 	lea    0x29227a(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e26:	48 83 c5 01          	add    $0x1,%rbp
   140124e2a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124e2e:	ff e0                	jmp    *%rax
   140124e30:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124e37:	41 80 fc 01          	cmp    $0x1,%r12b
   140124e3b:	0f 85 80 58 00 00    	jne    14012a6c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb121>
   140124e41:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140124e48:	00 
   140124e49:	45 31 e4             	xor    %r12d,%r12d
   140124e4c:	4a 89 54 e8 10       	mov    %rdx,0x10(%rax,%r13,8)
   140124e51:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e58:	0f 84 9a 08 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124e5e:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124e62:	48 8d 3d 37 22 29 00 	lea    0x292237(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e69:	48 83 c5 01          	add    $0x1,%rbp
   140124e6d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124e71:	ff e0                	jmp    *%rax
   140124e73:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124e7a:	41 80 fc 01          	cmp    $0x1,%r12b
   140124e7e:	0f 85 21 58 00 00    	jne    14012a6a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb105>
   140124e84:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140124e8b:	00 
   140124e8c:	45 31 e4             	xor    %r12d,%r12d
   140124e8f:	4a 89 54 e8 18       	mov    %rdx,0x18(%rax,%r13,8)
   140124e94:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e9b:	0f 84 57 08 00 00    	je     1401256f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6158>
   140124ea1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124ea5:	48 8d 3d f4 21 29 00 	lea    0x2921f4(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124eac:	48 83 c5 01          	add    $0x1,%rbp
   140124eb0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124eb4:	ff e0                	jmp    *%rax
   140124eb6:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140124eba:	4c 8d 75 02          	lea    0x2(%rbp),%r14
   140124ebe:	4c 01 ef             	add    %r13,%rdi
   140124ec1:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140124ec8:	0f 83 0f 58 00 00    	jae    14012a6dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb13d>
   140124ece:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140124ed5:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140124edc:	48 c1 f8 03          	sar    $0x3,%rax
   140124ee0:	48 39 c7             	cmp    %rax,%rdi
   140124ee3:	0f 83 1d 54 00 00    	jae    14012a306 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad66>
   140124ee9:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124ef0:	41 80 fc 01          	cmp    $0x1,%r12b
   140124ef4:	0f 85 f1 53 00 00    	jne    14012a2eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad4b>
   140124efa:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140124f01:	00 
   140124f02:	45 31 e4             	xor    %r12d,%r12d
   140124f05:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140124f09:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124f10:	0f 84 1b 08 00 00    	je     140125731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6191>
   140124f16:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140124f1a:	48 8d 3d 7f 21 29 00 	lea    0x29217f(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f21:	48 83 c5 03          	add    $0x3,%rbp
   140124f25:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124f29:	ff e0                	jmp    *%rax
   140124f2b:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
   140124f2f:	48 8b bb 68 10 00 00 	mov    0x1068(%rbx),%rdi
   140124f36:	4c 8d 75 04          	lea    0x4(%rbp),%r14
   140124f3a:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   140124f3e:	4c 01 ea             	add    %r13,%rdx
   140124f41:	4c 8d 14 d7          	lea    (%rdi,%rdx,8),%r10
   140124f45:	45 84 e4             	test   %r12b,%r12b
   140124f48:	0f 85 60 53 00 00    	jne    14012a2ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad0e>
   140124f4e:	49 8b 0a             	mov    (%r10),%rcx
   140124f51:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   140124f56:	0f b7 c0             	movzwl %ax,%eax
   140124f59:	4c 01 e8             	add    %r13,%rax
   140124f5c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124f60:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140124f67:	00 
   140124f68:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124f6f:	0f 84 27 53 00 00    	je     14012a29c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacfc>
   140124f75:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   140124f79:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140124f7f:	48 83 c5 05          	add    $0x5,%rbp
   140124f83:	48 8d 3d 16 21 29 00 	lea    0x292116(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f8a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124f8e:	ff e0                	jmp    *%rax
   140124f90:	44 0f b7 45 04       	movzwl 0x4(%rbp),%r8d
   140124f95:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   140124f9a:	4c 8d 75 06          	lea    0x6(%rbp),%r14
   140124f9e:	44 0f b7 55 02       	movzwl 0x2(%rbp),%r10d
   140124fa3:	4b 8d 3c 28          	lea    (%r8,%r13,1),%rdi
   140124fa7:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140124fae:	0f 83 8a 52 00 00    	jae    14012a23e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac9e>
   140124fb4:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140124fbb:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140124fc2:	48 c1 f8 03          	sar    $0x3,%rax
   140124fc6:	48 39 c7             	cmp    %rax,%rdi
   140124fc9:	0f 83 35 54 00 00    	jae    14012a404 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae64>
   140124fcf:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124fd6:	41 0f b7 d1          	movzwl %r9w,%edx
   140124fda:	49 b9 00 00 00 00 00 	movabs $0xffff000000000000,%r9
   140124fe1:	00 ff ff 
   140124fe4:	4c 01 ea             	add    %r13,%rdx
   140124fe7:	48 8d 0c d0          	lea    (%rax,%rdx,8),%rcx
   140124feb:	41 0f b7 d2          	movzwl %r10w,%edx
   140124fef:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140124ff6:	00 f8 ff 
   140124ff9:	4c 8b 19             	mov    (%rcx),%r11
   140124ffc:	4c 01 ea             	add    %r13,%rdx
   140124fff:	4c 8d 04 d0          	lea    (%rax,%rdx,8),%r8
   140125003:	4c 89 da             	mov    %r11,%rdx
   140125006:	4c 21 ca             	and    %r9,%rdx
   140125009:	4c 39 d2             	cmp    %r10,%rdx
   14012500c:	0f 84 a1 15 00 00    	je     1401265b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7013>
   140125012:	4c 89 c2             	mov    %r8,%rdx
   140125015:	c5 f8 77             	vzeroupper
   140125018:	e8 a3 b5 0e 00       	call   1402105c0 <setun::VMValue::add(setun::VMValue const&) const>
   14012501d:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125024:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140125028:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012502f:	0f 84 db 06 00 00    	je     140125710 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6170>
   140125035:	0f b6 45 06          	movzbl 0x6(%rbp),%eax
   140125039:	48 8d 3d 60 20 29 00 	lea    0x292060(%rip),%rdi        # 1403b70a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125040:	48 83 c5 07          	add    $0x7,%rbp
   140125044:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125048:	ff e0                	jmp    *%rax
   14012504a:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   14012504e:	44 0f b7 55 00       	movzwl 0x0(%rbp),%r10d
   140125053:	4c 8d 75 08          	lea    0x8(%rbp),%r14
   140125057:	44 0f b7 4d 02       	movzwl 0x2(%rbp),%r9d
   14012505c:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140125060:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140125064:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   14012506b:	0f 83 27 53 00 00    	jae    14012a398 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadf8>
   140125071:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140125078:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   14012507f:	48 c1 f9 03          	sar    $0x3,%rcx
   140125083:	48 39 cf             	cmp    %rcx,%rdi
   140125086:	0f 83 cc 52 00 00    	jae    14012a358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb8>
   14012508c:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   140125093:	41 0f b7 d2          	movzwl %r10w,%edx
   140125097:	0f b7 c0             	movzwl %ax,%eax
   14012509a:	4c 01 ea             	add    %r13,%rdx
   14012509d:	4c 01 e8             	add    %r13,%rax
   1401250a0:	4d 8d 1c d0          	lea    (%r8,%rdx,8),%r11
