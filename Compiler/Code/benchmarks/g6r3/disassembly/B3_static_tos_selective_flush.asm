000000014011f860 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   14011f860:	41 57                	push   %r15
   14011f862:	41 56                	push   %r14
   14011f864:	41 55                	push   %r13
   14011f866:	41 54                	push   %r12
   14011f868:	55                   	push   %rbp
   14011f869:	57                   	push   %rdi
   14011f86a:	56                   	push   %rsi
   14011f86b:	53                   	push   %rbx
   14011f86c:	48 81 ec e8 08 00 00 	sub    $0x8e8,%rsp
   14011f873:	c5 f8 29 b4 24 40 08 	vmovaps %xmm6,0x840(%rsp)
   14011f87a:	00 00 
   14011f87c:	c5 f8 29 bc 24 50 08 	vmovaps %xmm7,0x850(%rsp)
   14011f883:	00 00 
   14011f885:	c5 78 29 84 24 60 08 	vmovaps %xmm8,0x860(%rsp)
   14011f88c:	00 00 
   14011f88e:	c5 78 29 8c 24 70 08 	vmovaps %xmm9,0x870(%rsp)
   14011f895:	00 00 
   14011f897:	c5 78 29 94 24 80 08 	vmovaps %xmm10,0x880(%rsp)
   14011f89e:	00 00 
   14011f8a0:	c5 78 29 9c 24 90 08 	vmovaps %xmm11,0x890(%rsp)
   14011f8a7:	00 00 
   14011f8a9:	c5 78 29 a4 24 a0 08 	vmovaps %xmm12,0x8a0(%rsp)
   14011f8b0:	00 00 
   14011f8b2:	c5 78 29 ac 24 b0 08 	vmovaps %xmm13,0x8b0(%rsp)
   14011f8b9:	00 00 
   14011f8bb:	c5 78 29 b4 24 c0 08 	vmovaps %xmm14,0x8c0(%rsp)
   14011f8c2:	00 00 
   14011f8c4:	c5 78 29 bc 24 d0 08 	vmovaps %xmm15,0x8d0(%rsp)
   14011f8cb:	00 00 
   14011f8cd:	48 8b 42 08          	mov    0x8(%rdx),%rax
   14011f8d1:	48 2b 02             	sub    (%rdx),%rax
   14011f8d4:	48 89 cb             	mov    %rcx,%rbx
   14011f8d7:	49 89 d6             	mov    %rdx,%r14
   14011f8da:	48 39 81 38 10 00 00 	cmp    %rax,0x1038(%rcx)
   14011f8e1:	72 0b                	jb     14011f8ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   14011f8e3:	48 c7 81 38 10 00 00 	movq   $0x0,0x1038(%rcx)
   14011f8ea:	00 00 00 00 
   14011f8ee:	48 8b b3 c8 52 01 00 	mov    0x152c8(%rbx),%rsi
   14011f8f5:	c6 83 40 10 00 00 01 	movb   $0x1,0x1040(%rbx)
   14011f8fc:	48 85 f6             	test   %rsi,%rsi
   14011f8ff:	74 0d                	je     14011f90e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   14011f901:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   14011f908:	0f 85 82 09 00 00    	jne    140120290 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa30>
   14011f90e:	49 8b 6e 58          	mov    0x58(%r14),%rbp
   14011f912:	48 85 ed             	test   %rbp,%rbp
   14011f915:	0f 84 db 00 00 00    	je     14011f9f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x196>
   14011f91b:	48 8b 3d 3e 51 23 00 	mov    0x23513e(%rip),%rdi        # 140354a60 <CSWTCH.2806+0x220>
   14011f922:	4c 8d bb 00 10 00 00 	lea    0x1000(%rbx),%r15
   14011f929:	b9 88 00 00 00       	mov    $0x88,%ecx
   14011f92e:	4c 8d 65 08          	lea    0x8(%rbp),%r12
   14011f932:	e8 09 13 21 00       	call   140330c40 <operator new(unsigned long long)>
   14011f937:	c5 d9 ef e4          	vpxor  %xmm4,%xmm4,%xmm4
   14011f93b:	4c 89 e2             	mov    %r12,%rdx
   14011f93e:	48 89 c6             	mov    %rax,%rsi
   14011f941:	48 89 78 08          	mov    %rdi,0x8(%rax)
   14011f945:	48 8d 05 f4 41 25 00 	lea    0x2541f4(%rip),%rax        # 140373b40 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   14011f94c:	48 89 06             	mov    %rax,(%rsi)
   14011f94f:	48 8d 46 20          	lea    0x20(%rsi),%rax
   14011f953:	4c 8d 6e 10          	lea    0x10(%rsi),%r13
   14011f957:	c5 fe 7f 66 10       	vmovdqu %ymm4,0x10(%rsi)
   14011f95c:	4c 89 e9             	mov    %r13,%rcx
   14011f95f:	48 89 46 10          	mov    %rax,0x10(%rsi)
   14011f963:	48 8d 46 40          	lea    0x40(%rsi),%rax
   14011f967:	c5 fe 7f 66 30       	vmovdqu %ymm4,0x30(%rsi)
   14011f96c:	48 89 46 30          	mov    %rax,0x30(%rsi)
   14011f970:	48 8d 86 80 00 00 00 	lea    0x80(%rsi),%rax
   14011f977:	c5 fe 7f 66 68       	vmovdqu %ymm4,0x68(%rsi)
   14011f97c:	48 89 46 50          	mov    %rax,0x50(%rsi)
   14011f980:	48 c7 46 58 01 00 00 	movq   $0x1,0x58(%rsi)
   14011f987:	00 
   14011f988:	48 c7 46 60 00 00 00 	movq   $0x0,0x60(%rsi)
   14011f98f:	00 
   14011f990:	48 c7 46 70 00 00 80 	movq   $0x3f800000,0x70(%rsi)
   14011f997:	3f 
   14011f998:	c5 f8 77             	vzeroupper
   14011f99b:	e8 c0 88 1c 00       	call   1402e8260 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14011f9a0:	48 8d 55 28          	lea    0x28(%rbp),%rdx
   14011f9a4:	48 8d 4e 50          	lea    0x50(%rsi),%rcx
   14011f9a8:	48 39 d1             	cmp    %rdx,%rcx
   14011f9ab:	74 05                	je     14011f9b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   14011f9ad:	e8 be 79 17 00       	call   140297370 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   14011f9b2:	4c 89 e2             	mov    %r12,%rdx
   14011f9b5:	4c 89 f9             	mov    %r15,%rcx
   14011f9b8:	e8 a3 93 1f 00       	call   140318d60 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14011f9bd:	4c 89 28             	mov    %r13,(%rax)
   14011f9c0:	49 89 c4             	mov    %rax,%r12
   14011f9c3:	48 39 70 08          	cmp    %rsi,0x8(%rax)
   14011f9c7:	74 18                	je     14011f9e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x181>
   14011f9c9:	f0 83 46 08 01       	lock addl $0x1,0x8(%rsi)
   14011f9ce:	48 8b 48 08          	mov    0x8(%rax),%rcx
   14011f9d2:	48 85 c9             	test   %rcx,%rcx
   14011f9d5:	74 05                	je     14011f9dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17c>
   14011f9d7:	e8 64 0a 1b 00       	call   1402d0440 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14011f9dc:	49 89 74 24 08       	mov    %rsi,0x8(%r12)
   14011f9e1:	48 89 f1             	mov    %rsi,%rcx
   14011f9e4:	e8 57 0a 1b 00       	call   1402d0440 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14011f9e9:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
   14011f9ed:	48 85 ed             	test   %rbp,%rbp
   14011f9f0:	0f 85 33 ff ff ff    	jne    14011f929 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   14011f9f6:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14011f9fd:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14011fa04:	4d 8b 3e             	mov    (%r14),%r15
   14011fa07:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14011fa0e:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14011fa12:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14011fa19:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14011fa20:	4c 01 f9             	add    %r15,%rcx
   14011fa23:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14011fa28:	4d 85 ed             	test   %r13,%r13
   14011fa2b:	75 6b                	jne    14011fa98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x238>
   14011fa2d:	49 8b 86 b0 00 00 00 	mov    0xb0(%r14),%rax
   14011fa34:	ba 20 00 00 00       	mov    $0x20,%edx
   14011fa39:	48 39 d0             	cmp    %rdx,%rax
   14011fa3c:	48 0f 42 c2          	cmovb  %rdx,%rax
   14011fa40:	80 3d 39 86 29 00 00 	cmpb   $0x0,0x298639(%rip)        # 1403b8080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14011fa47:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   14011fa4e:	74 73                	je     14011fac3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x263>
   14011fa50:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14011fa57:	00 fb ff 
   14011fa5a:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14011fa61:	00 
   14011fa62:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14011fa69:	0f 84 c0 5e 00 00    	je     14012592f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60cf>
   14011fa6f:	0f b6 01             	movzbl (%rcx),%eax
   14011fa72:	48 8d 3d 27 86 29 00 	lea    0x298627(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14011fa79:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14011fa7d:	45 31 e4             	xor    %r12d,%r12d
   14011fa80:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14011fa84:	48 bf 00 00 00 00 00 	movabs $0xfffb000000000000,%rdi
   14011fa8b:	00 fb ff 
   14011fa8e:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
   14011fa93:	ff e0                	jmp    *%rax
   14011fa95:	0f 1f 00             	nopl   (%rax)
   14011fa98:	4b 8d 44 ad 00       	lea    0x0(%r13,%r13,4),%rax
   14011fa9d:	4c 8b ac c3 a0 10 00 	mov    0x10a0(%rbx,%rax,8),%r13
   14011faa4:	00 
   14011faa5:	48 8b bc c3 b0 10 00 	mov    0x10b0(%rbx,%rax,8),%rdi
   14011faac:	00 
   14011faad:	4c 01 ef             	add    %r13,%rdi
   14011fab0:	80 3d c9 85 29 00 00 	cmpb   $0x0,0x2985c9(%rip)        # 1403b8080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14011fab7:	48 89 f8             	mov    %rdi,%rax
   14011faba:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   14011fac1:	75 8d                	jne    14011fa50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f0>
   14011fac3:	48 8d 3d 1c 3b 00 00 	lea    0x3b1c(%rip),%rdi        # 1401235e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d86>
   14011faca:	48 8d 05 85 3b 00 00 	lea    0x3b85(%rip),%rax        # 140123656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3df6>
   14011fad1:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fad6:	48 8d 3d 55 3a 00 00 	lea    0x3a55(%rip),%rdi        # 140123532 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cd2>
   14011fadd:	48 8d 15 9f 4b 00 00 	lea    0x4b9f(%rip),%rdx        # 140124683 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e23>
   14011fae4:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011faea:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011faef:	48 8d 05 ab 3a 00 00 	lea    0x3aab(%rip),%rax        # 1401235a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d41>
   14011faf6:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fafc:	48 8d 3d 4a 3c 00 00 	lea    0x3c4a(%rip),%rdi        # 14012374d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3eed>
   14011fb03:	48 8d 05 87 3c 00 00 	lea    0x3c87(%rip),%rax        # 140123791 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f31>
   14011fb0a:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fb10:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb15:	48 8d 3d aa 3b 00 00 	lea    0x3baa(%rip),%rdi        # 1401236c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e66>
   14011fb1c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fb22:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fb27:	48 8d 05 db 3b 00 00 	lea    0x3bdb(%rip),%rax        # 140123709 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ea9>
   14011fb2e:	c5 fe 7f 94 24 20 01 	vmovdqu %ymm2,0x120(%rsp)
   14011fb35:	00 00 
   14011fb37:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fb3d:	48 8d 3d 3a 3e 00 00 	lea    0x3e3a(%rip),%rdi        # 14012397e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x411e>
   14011fb44:	48 8d 05 c2 3e 00 00 	lea    0x3ec2(%rip),%rax        # 140123a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41ad>
   14011fb4b:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fb51:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb56:	48 8d 3d 78 3c 00 00 	lea    0x3c78(%rip),%rdi        # 1401237d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f75>
   14011fb5d:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fb63:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fb68:	48 8d 05 0a 3d 00 00 	lea    0x3d0a(%rip),%rax        # 140123879 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4019>
   14011fb6f:	c5 fe 7f 94 24 00 01 	vmovdqu %ymm2,0x100(%rsp)
   14011fb76:	00 00 
   14011fb78:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fb7e:	48 8d 3d b2 40 00 00 	lea    0x40b2(%rip),%rdi        # 140123c37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43d7>
   14011fb85:	48 8d 05 5e 41 00 00 	lea    0x415e(%rip),%rax        # 140123cea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x448a>
   14011fb8c:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fb92:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fb97:	48 8d 3d 36 3f 00 00 	lea    0x3f36(%rip),%rdi        # 140123ad4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4274>
   14011fb9e:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fba4:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fba9:	48 8d 05 d7 3f 00 00 	lea    0x3fd7(%rip),%rax        # 140123b87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4327>
   14011fbb0:	c5 fe 7f 94 24 e0 00 	vmovdqu %ymm2,0xe0(%rsp)
   14011fbb7:	00 00 
   14011fbb9:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fbbf:	48 8d 3d 51 37 00 00 	lea    0x3751(%rip),%rdi        # 140123317 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ab7>
   14011fbc6:	48 8d 05 e7 37 00 00 	lea    0x37e7(%rip),%rax        # 1401233b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b54>
   14011fbcd:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fbd3:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fbd8:	48 8d 3d 83 34 00 00 	lea    0x3483(%rip),%rdi        # 140123062 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3802>
   14011fbdf:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fbe5:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fbea:	48 8d 05 cc 35 00 00 	lea    0x35cc(%rip),%rax        # 1401231bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x395d>
   14011fbf1:	c5 fe 7f 94 24 c0 00 	vmovdqu %ymm2,0xc0(%rsp)
   14011fbf8:	00 00 
   14011fbfa:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fc00:	48 8d 3d 62 38 00 00 	lea    0x3862(%rip),%rdi        # 140123469 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c09>
   14011fc07:	48 8d 05 9e 38 00 00 	lea    0x389e(%rip),%rax        # 1401234ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c4c>
   14011fc0e:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fc14:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc19:	48 8d 3d 71 31 00 00 	lea    0x3171(%rip),%rdi        # 140122d91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3531>
   14011fc20:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fc26:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fc2b:	48 8d 05 f5 37 00 00 	lea    0x37f5(%rip),%rax        # 140123427 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bc7>
   14011fc32:	c5 fe 7f 94 24 a0 00 	vmovdqu %ymm2,0xa0(%rsp)
   14011fc39:	00 00 
   14011fc3b:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fc41:	48 8d 3d 23 32 00 00 	lea    0x3223(%rip),%rdi        # 140122e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x360b>
   14011fc48:	48 8d 05 db 32 00 00 	lea    0x32db(%rip),%rax        # 140122f2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36ca>
   14011fc4f:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fc55:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc5a:	48 8d 3d 8e 38 00 00 	lea    0x388e(%rip),%rdi        # 1401234ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c8f>
   14011fc61:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fc67:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fc6c:	48 8d 05 93 31 00 00 	lea    0x3193(%rip),%rax        # 140122e06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35a6>
   14011fc73:	c5 fe 7f 94 24 80 00 	vmovdqu %ymm2,0x80(%rsp)
   14011fc7a:	00 00 
   14011fc7c:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fc82:	48 8d 3d e7 5a 00 00 	lea    0x5ae7(%rip),%rdi        # 140125770 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f10>
   14011fc89:	48 8d 05 d7 53 00 00 	lea    0x53d7(%rip),%rax        # 140125067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5807>
   14011fc90:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14011fc96:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fc9b:	48 8d 3d 1f 52 00 00 	lea    0x521f(%rip),%rdi        # 140124ec1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5661>
   14011fca2:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fca8:	c5 fe 7f 54 24 60    	vmovdqu %ymm2,0x60(%rsp)
   14011fcae:	48 8d 05 df 52 00 00 	lea    0x52df(%rip),%rax        # 140124f94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5734>
   14011fcb5:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   14011fcba:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   14011fcc0:	48 8d 3d 14 59 00 00 	lea    0x5914(%rip),%rdi        # 1401255db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d7b>
   14011fcc7:	48 8d 05 3f 55 00 00 	lea    0x553f(%rip),%rax        # 14012520d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59ad>
   14011fcce:	c4 e3 6d 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   14011fcd4:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fcd9:	48 8d 3d 5a 54 00 00 	lea    0x545a(%rip),%rdi        # 14012513a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58da>
   14011fce0:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fce6:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   14011fceb:	48 8d 05 1c 5b 00 00 	lea    0x5b1c(%rip),%rax        # 14012580e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fae>
   14011fcf2:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14011fcf8:	48 8d 3d 36 57 00 00 	lea    0x5736(%rip),%rdi        # 140125435 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bd5>
   14011fcff:	48 8d 05 02 58 00 00 	lea    0x5802(%rip),%rax        # 140125508 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ca8>
   14011fd06:	c4 e3 75 38 c8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   14011fd0c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fd11:	48 8d 3d c8 55 00 00 	lea    0x55c8(%rip),%rdi        # 1401252e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a80>
   14011fd18:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fd1e:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   14011fd23:	48 8d 05 3e 56 00 00 	lea    0x563e(%rip),%rax        # 140125368 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b08>
   14011fd2a:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14011fd30:	48 8d 3d b4 42 00 00 	lea    0x42b4(%rip),%rdi        # 140123feb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478b>
   14011fd37:	48 8d 05 80 43 00 00 	lea    0x4380(%rip),%rax        # 1401240be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x485e>
   14011fd3e:	c4 e3 65 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm4
   14011fd44:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fd49:	48 8d 3d f5 40 00 00 	lea    0x40f5(%rip),%rdi        # 140123e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e5>
   14011fd50:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fd56:	c4 e1 f9 6e ef       	vmovq  %rdi,%xmm5
   14011fd5b:	48 8d 05 b6 41 00 00 	lea    0x41b6(%rip),%rax        # 140123f18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46b8>
   14011fd62:	c5 fe 7f 64 24 40    	vmovdqu %ymm4,0x40(%rsp)
   14011fd68:	c4 e3 d1 22 e8 01    	vpinsrq $0x1,%rax,%xmm5,%xmm5
   14011fd6e:	48 8d 3d 87 4b 00 00 	lea    0x4b87(%rip),%rdi        # 1401248fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x509c>
   14011fd75:	48 8d 05 53 4c 00 00 	lea    0x4c53(%rip),%rax        # 1401249cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x516f>
   14011fd7c:	c4 e3 55 38 e8 01    	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   14011fd82:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fd87:	48 8d 3d 03 44 00 00 	lea    0x4403(%rip),%rdi        # 140124191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4931>
   14011fd8e:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fd94:	c4 e1 f9 6e e7       	vmovq  %rdi,%xmm4
   14011fd99:	48 8d 05 c4 44 00 00 	lea    0x44c4(%rip),%rax        # 140124264 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a04>
   14011fda0:	c4 e3 d9 22 e0 01    	vpinsrq $0x1,%rax,%xmm4,%xmm4
   14011fda6:	48 8d 3d 9b 4e 00 00 	lea    0x4e9b(%rip),%rdi        # 140124c48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53e8>
   14011fdad:	48 8d 05 67 4f 00 00 	lea    0x4f67(%rip),%rax        # 140124d1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54bb>
   14011fdb4:	c4 e3 5d 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   14011fdba:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fdbf:	48 8d 3d dc 4c 00 00 	lea    0x4cdc(%rip),%rdi        # 140124aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5242>
   14011fdc6:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fdcc:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   14011fdd1:	48 8d 05 9d 4d 00 00 	lea    0x4d9d(%rip),%rax        # 140124b75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5315>
   14011fdd8:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14011fdde:	48 8d 3d 71 49 00 00 	lea    0x4971(%rip),%rdi        # 140124756 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ef6>
   14011fde5:	48 8d 05 4b 45 00 00 	lea    0x454b(%rip),%rax        # 140124337 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ad7>
   14011fdec:	c4 e3 65 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   14011fdf2:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fdf7:	48 8d 3d b2 47 00 00 	lea    0x47b2(%rip),%rdi        # 1401245b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d50>
   14011fdfe:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fe04:	48 8d 05 1e 4a 00 00 	lea    0x4a1e(%rip),%rax        # 140124829 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fc9>
   14011fe0b:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   14011fe10:	48 8d 05 95 28 00 00 	lea    0x2895(%rip),%rax        # 1401226ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e4c>
   14011fe17:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   14011fe1d:	48 8d 15 b9 46 00 00 	lea    0x46b9(%rip),%rdx        # 1401244dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c7d>
   14011fe24:	c4 63 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   14011fe2a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe2f:	48 8d 3d d0 26 00 00 	lea    0x26d0(%rip),%rdi        # 140122506 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ca6>
   14011fe36:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fe3c:	48 8d 05 c7 45 00 00 	lea    0x45c7(%rip),%rax        # 14012440a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4baa>
   14011fe43:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   14011fe48:	48 8d 05 8a 27 00 00 	lea    0x278a(%rip),%rax        # 1401225d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d79>
   14011fe4f:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   14011fe55:	48 8d 15 04 25 00 00 	lea    0x2504(%rip),%rdx        # 140122360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b00>
   14011fe5c:	c4 63 7d 38 e6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   14011fe62:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe67:	48 8d 3d 13 16 00 00 	lea    0x1613(%rip),%rdi        # 140121481 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c21>
   14011fe6e:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fe74:	48 8d 05 b8 25 00 00 	lea    0x25b8(%rip),%rax        # 140122433 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bd3>
   14011fe7b:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fe80:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fe86:	48 8d 15 90 13 00 00 	lea    0x1390(%rip),%rdx        # 14012121d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19bd>
   14011fe8d:	48 8d 05 1e 17 00 00 	lea    0x171e(%rip),%rax        # 1401215b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d52>
   14011fe94:	c4 63 7d 38 ee 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   14011fe9a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fe9f:	48 8d 3d ca 09 00 00 	lea    0x9ca(%rip),%rdi        # 140120870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1010>
   14011fea6:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011feac:	48 8d 05 9d 14 00 00 	lea    0x149d(%rip),%rax        # 140121350 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1af0>
   14011feb3:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011feb8:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011febe:	48 8d 15 53 08 00 00 	lea    0x853(%rip),%rdx        # 140120718 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb8>
   14011fec5:	48 8d 05 53 0a 00 00 	lea    0xa53(%rip),%rax        # 14012091f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bf>
   14011fecc:	c4 63 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm14
   14011fed2:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fed7:	48 8d 3d 36 21 00 00 	lea    0x2136(%rip),%rdi        # 140122014 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b4>
   14011fede:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011fee4:	48 8d 05 d9 08 00 00 	lea    0x8d9(%rip),%rax        # 1401207c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf64>
   14011feeb:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011fef0:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011fef6:	48 8d 15 9c 10 00 00 	lea    0x109c(%rip),%rdx        # 140120f99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1739>
   14011fefd:	48 8d 05 dd 10 00 00 	lea    0x10dd(%rip),%rax        # 140120fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1781>
   14011ff04:	c4 63 7d 38 de 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   14011ff0a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011ff0f:	48 8d 3d d6 0d 00 00 	lea    0xdd6(%rip),%rdi        # 140120cec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148c>
   14011ff16:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011ff1c:	48 8d 05 1e 20 00 00 	lea    0x201e(%rip),%rax        # 140121f41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26e1>
   14011ff23:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011ff28:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011ff2e:	48 8d 15 ca 11 00 00 	lea    0x11ca(%rip),%rdx        # 1401210ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x189f>
   14011ff35:	48 8d 05 39 0e 00 00 	lea    0xe39(%rip),%rax        # 140120d75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515>
   14011ff3c:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   14011ff42:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011ff47:	48 8d 3d fd 06 00 00 	lea    0x6fd(%rip),%rdi        # 14012064b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdeb>
   14011ff4e:	c5 fe 7f b4 24 40 01 	vmovdqu %ymm6,0x140(%rsp)
   14011ff55:	00 00 
   14011ff57:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011ff5d:	48 8d 05 ff 0c 00 00 	lea    0xcff(%rip),%rax        # 140120c63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1403>
   14011ff64:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011ff69:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011ff6f:	48 8d 15 ca 05 00 00 	lea    0x5ca(%rip),%rdx        # 140120540 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce0>
   14011ff76:	48 8d 05 35 07 00 00 	lea    0x735(%rip),%rax        # 1401206b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe52>
   14011ff7d:	c4 63 7d 38 ce 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   14011ff83:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011ff88:	48 8d 3d 82 0b 00 00 	lea    0xb82(%rip),%rdi        # 140120b11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b1>
   14011ff8f:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011ff95:	48 8d 05 39 06 00 00 	lea    0x639(%rip),%rax        # 1401205d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd75>
   14011ff9c:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011ffa1:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011ffa7:	48 8d 15 d7 04 00 00 	lea    0x4d7(%rip),%rdx        # 140120485 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc25>
   14011ffae:	48 8d 05 d8 0b 00 00 	lea    0xbd8(%rip),%rax        # 140120b8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132d>
   14011ffb5:	c4 63 7d 38 c6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   14011ffbb:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011ffc0:	48 8d 3d e1 09 00 00 	lea    0x9e1(%rip),%rdi        # 1401209a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1148>
   14011ffc7:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14011ffcd:	48 8d 05 d3 04 00 00 	lea    0x4d3(%rip),%rax        # 1401204a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc47>
   14011ffd4:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14011ffd9:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14011ffdf:	48 8d 15 45 0a 00 00 	lea    0xa45(%rip),%rdx        # 140120a2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cb>
   14011ffe6:	48 8d 05 99 0a 00 00 	lea    0xa99(%rip),%rax        # 140120a86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1226>
   14011ffed:	c4 63 7d 38 d6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   14011fff3:	c4 e1 f9 6e f2       	vmovq  %rdx,%xmm6
   14011fff8:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14011fffd:	c4 e3 c9 22 f0 01    	vpinsrq $0x1,%rax,%xmm6,%xmm6
   140120003:	48 8d 05 64 1e 00 00 	lea    0x1e64(%rip),%rax        # 140121e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x260e>
   14012000a:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140120010:	48 8d 05 3b 28 00 00 	lea    0x283b(%rip),%rax        # 140122852 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ff2>
   140120017:	c4 e3 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   14012001d:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   140120022:	48 8d 05 77 80 29 00 	lea    0x298077(%rip),%rax        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120029:	c4 e2 7d 59 c0       	vpbroadcastq %xmm0,%ymm0
   14012002e:	48 8d 90 00 08 00 00 	lea    0x800(%rax),%rdx
   140120035:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   14012003c:	00 00 00 00 
   140120040:	c5 fd 7f 00          	vmovdqa %ymm0,(%rax)
   140120044:	48 83 c0 40          	add    $0x40,%rax
   140120048:	c5 fd 7f 40 e0       	vmovdqa %ymm0,-0x20(%rax)
   14012004d:	48 39 d0             	cmp    %rdx,%rax
   140120050:	75 ee                	jne    140120040 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e0>
   140120052:	48 8d 05 5c 0a 00 00 	lea    0xa5c(%rip),%rax        # 140120ab5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1255>
   140120059:	48 8d 3d 9e 0d 00 00 	lea    0xd9e(%rip),%rdi        # 140120dfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159e>
   140120060:	c5 fd 7f 15 38 85 29 	vmovdqa %ymm2,0x298538(%rip)        # 1403b85a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   140120067:	00 
   140120068:	c5 fe 6f 54 24 40    	vmovdqu 0x40(%rsp),%ymm2
   14012006e:	48 89 05 6b 80 29 00 	mov    %rax,0x29806b(%rip)        # 1403b80e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140120075:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012007a:	48 8d 05 06 0e 00 00 	lea    0xe06(%rip),%rax        # 140120e87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1627>
   140120081:	48 8d 3d 5b 16 00 00 	lea    0x165b(%rip),%rdi        # 1401216e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e83>
   140120088:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012008e:	48 8d 05 7b 0e 00 00 	lea    0xe7b(%rip),%rax        # 140120f10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16b0>
   140120095:	c5 fe 6f b4 24 40 01 	vmovdqu 0x140(%rsp),%ymm6
   14012009c:	00 00 
   14012009e:	c5 fd 7f 15 3a 85 29 	vmovdqa %ymm2,0x29853a(%rip)        # 1403b85e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   1401200a5:	00 
   1401200a6:	c5 fe 6f 94 24 20 01 	vmovdqu 0x120(%rsp),%ymm2
   1401200ad:	00 00 
   1401200af:	48 89 05 5a 81 29 00 	mov    %rax,0x29815a(%rip)        # 1403b8210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   1401200b6:	48 8d 05 57 17 00 00 	lea    0x1757(%rip),%rax        # 140121814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fb4>
   1401200bd:	c5 f9 7f 05 3b 81 29 	vmovdqa %xmm0,0x29813b(%rip)        # 1403b8200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   1401200c4:	00 
   1401200c5:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401200ca:	48 8d 3d 16 20 00 00 	lea    0x2016(%rip),%rdi        # 1401220e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2887>
   1401200d1:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401200d7:	48 8d 05 dc 20 00 00 	lea    0x20dc(%rip),%rax        # 1401221ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x295a>
   1401200de:	c5 fd 7f 25 5a 84 29 	vmovdqa %ymm4,0x29845a(%rip)        # 1403b8540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   1401200e5:	00 
   1401200e6:	c5 f9 7f 05 52 81 29 	vmovdqa %xmm0,0x298152(%rip)        # 1403b8240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   1401200ed:	00 
   1401200ee:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401200f3:	48 8d 3d 4b 18 00 00 	lea    0x184b(%rip),%rdi        # 140121945 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e5>
   1401200fa:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140120100:	48 8d 05 86 21 00 00 	lea    0x2186(%rip),%rax        # 14012228d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a2d>
   140120107:	c5 fd 7f 1d 51 84 29 	vmovdqa %ymm3,0x298451(%rip)        # 1403b8560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   14012010e:	00 
   14012010f:	48 89 05 9a 81 29 00 	mov    %rax,0x29819a(%rip)        # 1403b82b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   140120116:	48 8d 05 5e 18 00 00 	lea    0x185e(%rip),%rax        # 14012197b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x211b>
   14012011d:	c5 f9 7f 05 7b 81 29 	vmovdqa %xmm0,0x29817b(%rip)        # 1403b82a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   140120124:	00 
   140120125:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012012a:	48 8d 3d b7 19 00 00 	lea    0x19b7(%rip),%rdi        # 140121ae8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2288>
   140120131:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140120137:	48 8d 05 b8 18 00 00 	lea    0x18b8(%rip),%rax        # 1401219f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2196>
   14012013e:	c5 fd 7f 15 da 84 29 	vmovdqa %ymm2,0x2984da(%rip)        # 1403b8620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   140120145:	00 
   140120146:	48 89 05 e3 81 29 00 	mov    %rax,0x2981e3(%rip)        # 1403b8330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   14012014d:	48 8d 05 66 1c 00 00 	lea    0x1c66(%rip),%rax        # 140121dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x255a>
   140120154:	c5 f9 7f 05 c4 81 29 	vmovdqa %xmm0,0x2981c4(%rip)        # 1403b8320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   14012015b:	00 
   14012015c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140120161:	48 8d 3d 88 27 00 00 	lea    0x2788(%rip),%rdi        # 1401228f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3090>
   140120168:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012016e:	48 8d 05 1c 02 00 00 	lea    0x21c(%rip),%rax        # 140120391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb31>
   140120175:	c5 7d 7f 15 23 7f 29 	vmovdqa %ymm10,0x297f23(%rip)        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012017c:	00 
   14012017d:	48 89 05 14 87 29 00 	mov    %rax,0x298714(%rip)        # 1403b8898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140120184:	48 8d 05 f4 25 00 00 	lea    0x25f4(%rip),%rax        # 14012277f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f1f>
   14012018b:	48 89 05 4e 83 29 00 	mov    %rax,0x29834e(%rip)        # 1403b84e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140120192:	48 8d 05 55 4c 00 00 	lea    0x4c55(%rip),%rax        # 140124dee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x558e>
   140120199:	48 89 05 e0 83 29 00 	mov    %rax,0x2983e0(%rip)        # 1403b8580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   1401201a0:	48 8d 05 5c 29 00 00 	lea    0x295c(%rip),%rax        # 140122b03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32a3>
   1401201a7:	c5 f9 7f 05 f1 81 29 	vmovdqa %xmm0,0x2981f1(%rip)        # 1403b83a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   1401201ae:	00 
   1401201af:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401201b4:	c5 fd 7f 3d 04 7f 29 	vmovdqa %ymm7,0x297f04(%rip)        # 1403b80c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   1401201bb:	00 
   1401201bc:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401201c2:	c5 7d 7f 05 56 7f 29 	vmovdqa %ymm8,0x297f56(%rip)        # 1403b8120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   1401201c9:	00 
   1401201ca:	c5 7d 7f 1d ce 7f 29 	vmovdqa %ymm11,0x297fce(%rip)        # 1403b81a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   1401201d1:	00 
   1401201d2:	c5 fd 7f 35 e6 7f 29 	vmovdqa %ymm6,0x297fe6(%rip)        # 1403b81c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   1401201d9:	00 
   1401201da:	c5 7d 7f 0d fe 7f 29 	vmovdqa %ymm9,0x297ffe(%rip)        # 1403b81e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   1401201e1:	00 
   1401201e2:	c5 7d 7f 35 36 80 29 	vmovdqa %ymm14,0x298036(%rip)        # 1403b8220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   1401201e9:	00 
   1401201ea:	c5 7d 7f 2d 2e 82 29 	vmovdqa %ymm13,0x29822e(%rip)        # 1403b8420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   1401201f1:	00 
   1401201f2:	c5 7d 7f 3d a6 82 29 	vmovdqa %ymm15,0x2982a6(%rip)        # 1403b84a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   1401201f9:	00 
   1401201fa:	c5 7d 7f 25 be 82 29 	vmovdqa %ymm12,0x2982be(%rip)        # 1403b84c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   140120201:	00 
   140120202:	c5 fd 7f 2d 16 83 29 	vmovdqa %ymm5,0x298316(%rip)        # 1403b8520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   140120209:	00 
   14012020a:	c5 fd 7f 0d ae 83 29 	vmovdqa %ymm1,0x2983ae(%rip)        # 1403b85c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   140120211:	00 
   140120212:	c5 fe 6f ac 24 00 01 	vmovdqu 0x100(%rsp),%ymm5
   140120219:	00 00 
   14012021b:	c5 fe 6f 5c 24 60    	vmovdqu 0x60(%rsp),%ymm3
   140120221:	c5 fe 6f 94 24 e0 00 	vmovdqu 0xe0(%rsp),%ymm2
   140120228:	00 00 
   14012022a:	c6 05 4f 7e 29 00 01 	movb   $0x1,0x297e4f(%rip)        # 1403b8080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140120231:	c5 fe 6f a4 24 c0 00 	vmovdqu 0xc0(%rsp),%ymm4
   140120238:	00 00 
   14012023a:	c5 fd 7f 2d fe 83 29 	vmovdqa %ymm5,0x2983fe(%rip)        # 1403b8640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   140120241:	00 
   140120242:	c5 fe 6f ac 24 a0 00 	vmovdqu 0xa0(%rsp),%ymm5
   140120249:	00 00 
   14012024b:	c5 fd 7f 15 0d 84 29 	vmovdqa %ymm2,0x29840d(%rip)        # 1403b8660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140120252:	00 
   140120253:	c5 fe 6f 94 24 80 00 	vmovdqu 0x80(%rsp),%ymm2
   14012025a:	00 00 
   14012025c:	c5 fd 7f 25 1c 84 29 	vmovdqa %ymm4,0x29841c(%rip)        # 1403b8680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140120263:	00 
   140120264:	c5 fd 7f 2d 34 84 29 	vmovdqa %ymm5,0x298434(%rip)        # 1403b86a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   14012026b:	00 
   14012026c:	c5 fd 7f 15 4c 84 29 	vmovdqa %ymm2,0x29844c(%rip)        # 1403b86c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140120273:	00 
   140120274:	c5 fd 7f 1d 64 84 29 	vmovdqa %ymm3,0x298464(%rip)        # 1403b86e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   14012027b:	00 
   14012027c:	c5 f9 7f 05 7c 84 29 	vmovdqa %xmm0,0x29847c(%rip)        # 1403b8700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140120283:	00 
   140120284:	e9 c7 f7 ff ff       	jmp    14011fa50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f0>
   140120289:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140120290:	48 8b 86 e0 00 00 00 	mov    0xe0(%rsi),%rax
   140120297:	48 39 86 d8 00 00 00 	cmp    %rax,0xd8(%rsi)
   14012029e:	0f 85 d4 00 00 00    	jne    140120378 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb18>
   1401202a4:	49 8b 86 88 00 00 00 	mov    0x88(%r14),%rax
   1401202ab:	49 2b 86 80 00 00 00 	sub    0x80(%r14),%rax
   1401202b2:	ba 80 00 00 00       	mov    $0x80,%edx
   1401202b7:	48 8d 8e d8 00 00 00 	lea    0xd8(%rsi),%rcx
   1401202be:	48 c1 f8 02          	sar    $0x2,%rax
   1401202c2:	48 83 c0 10          	add    $0x10,%rax
   1401202c6:	48 3d 80 00 00 00    	cmp    $0x80,%rax
   1401202cc:	76 0a                	jbe    1401202d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78>
   1401202ce:	66 90                	xchg   %ax,%ax
   1401202d0:	48 01 d2             	add    %rdx,%rdx
   1401202d3:	48 39 c2             	cmp    %rax,%rdx
   1401202d6:	72 f8                	jb     1401202d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa70>
   1401202d8:	8b 86 8c 00 00 00    	mov    0x8c(%rsi),%eax
   1401202de:	44 8b 8e 88 00 00 00 	mov    0x88(%rsi),%r9d
   1401202e5:	41 b8 80 00 00 00    	mov    $0x80,%r8d
   1401202eb:	89 44 24 28          	mov    %eax,0x28(%rsp)
   1401202ef:	8b 86 90 00 00 00    	mov    0x90(%rsi),%eax
   1401202f5:	89 44 24 20          	mov    %eax,0x20(%rsp)
   1401202f9:	e8 82 72 07 00       	call   140197580 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   1401202fe:	c5 fa 6f 8e d8 00 00 	vmovdqu 0xd8(%rsi),%xmm1
   140120305:	00 
   140120306:	c5 fa 6f 86 e8 00 00 	vmovdqu 0xe8(%rsi),%xmm0
   14012030d:	00 
   14012030e:	c4 e3 79 0e d1 0f    	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140120314:	c4 e1 f9 7e c8       	vmovq  %xmm1,%rax
   140120319:	c4 e3 f9 16 c1 01    	vpextrq $0x1,%xmm0,%rcx
   14012031f:	c5 fa 7f 93 d8 52 01 	vmovdqu %xmm2,0x152d8(%rbx)
   140120326:	00 
   140120327:	48 8b 96 e0 00 00 00 	mov    0xe0(%rsi),%rdx
   14012032e:	48 29 c2             	sub    %rax,%rdx
   140120331:	48 8b 86 f8 00 00 00 	mov    0xf8(%rsi),%rax
   140120338:	48 c1 fa 05          	sar    $0x5,%rdx
   14012033c:	48 29 c8             	sub    %rcx,%rax
   14012033f:	48 89 93 e8 52 01 00 	mov    %rdx,0x152e8(%rbx)
   140120346:	48 c1 f8 05          	sar    $0x5,%rax
   14012034a:	48 83 fa 01          	cmp    $0x1,%rdx
   14012034e:	48 83 d2 ff          	adc    $0xffffffffffffffff,%rdx
   140120352:	48 83 f8 01          	cmp    $0x1,%rax
   140120356:	48 89 83 f0 52 01 00 	mov    %rax,0x152f0(%rbx)
   14012035d:	48 83 d0 ff          	adc    $0xffffffffffffffff,%rax
   140120361:	48 89 93 f8 52 01 00 	mov    %rdx,0x152f8(%rbx)
   140120368:	48 89 83 00 53 01 00 	mov    %rax,0x15300(%rbx)
   14012036f:	e9 9a f5 ff ff       	jmp    14011f90e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140120374:	0f 1f 40 00          	nopl   0x0(%rax)
   140120378:	48 8b 86 f0 00 00 00 	mov    0xf0(%rsi),%rax
   14012037f:	48 39 86 f8 00 00 00 	cmp    %rax,0xf8(%rsi)
   140120386:	0f 85 72 ff ff ff    	jne    1401202fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e>
   14012038c:	e9 13 ff ff ff       	jmp    1401202a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa44>
   140120391:	c6 83 40 10 00 00 00 	movb   $0x0,0x1040(%rbx)
   140120398:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012039f:	c5 f8 77             	vzeroupper
   1401203a2:	41 80 fc 02          	cmp    $0x2,%r12b
   1401203a6:	0f 85 04 55 00 00    	jne    1401258b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6050>
   1401203ac:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401203b3:	4c 8d 46 10          	lea    0x10(%rsi),%r8
   1401203b7:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401203bc:	0f 83 8d 7d 00 00    	jae    14012814f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88ef>
   1401203c2:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   1401203c7:	48 89 3e             	mov    %rdi,(%rsi)
   1401203ca:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
   1401203d1:	00 
   1401203d2:	48 89 4e 08          	mov    %rcx,0x8(%rsi)
   1401203d6:	4c 89 c6             	mov    %r8,%rsi
   1401203d9:	4c 29 fd             	sub    %r15,%rbp
   1401203dc:	48 29 d6             	sub    %rdx,%rsi
   1401203df:	48 29 d0             	sub    %rdx,%rax
   1401203e2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401203e9:	48 89 f5             	mov    %rsi,%rbp
   1401203ec:	48 c1 fd 03          	sar    $0x3,%rbp
   1401203f0:	48 39 f0             	cmp    %rsi,%rax
   1401203f3:	0f 82 cf 54 00 00    	jb     1401258c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6068>
   1401203f9:	c5 f9 6f 05 ff 45 23 	vmovdqa 0x2345ff(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140120400:	00 
   140120401:	48 89 ab 60 10 00 00 	mov    %rbp,0x1060(%rbx)
   140120408:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012040f:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140120416:	00 
   140120417:	c5 f8 28 b4 24 40 08 	vmovaps 0x840(%rsp),%xmm6
   14012041e:	00 00 
   140120420:	c5 f8 28 bc 24 50 08 	vmovaps 0x850(%rsp),%xmm7
   140120427:	00 00 
   140120429:	c5 78 28 84 24 60 08 	vmovaps 0x860(%rsp),%xmm8
   140120430:	00 00 
   140120432:	c5 78 28 8c 24 70 08 	vmovaps 0x870(%rsp),%xmm9
   140120439:	00 00 
   14012043b:	c5 78 28 94 24 80 08 	vmovaps 0x880(%rsp),%xmm10
   140120442:	00 00 
   140120444:	c5 78 28 9c 24 90 08 	vmovaps 0x890(%rsp),%xmm11
   14012044b:	00 00 
   14012044d:	c5 78 28 a4 24 a0 08 	vmovaps 0x8a0(%rsp),%xmm12
   140120454:	00 00 
   140120456:	c5 78 28 ac 24 b0 08 	vmovaps 0x8b0(%rsp),%xmm13
   14012045d:	00 00 
   14012045f:	c5 78 28 b4 24 c0 08 	vmovaps 0x8c0(%rsp),%xmm14
   140120466:	00 00 
   140120468:	c5 78 28 bc 24 d0 08 	vmovaps 0x8d0(%rsp),%xmm15
   14012046f:	00 00 
   140120471:	48 81 c4 e8 08 00 00 	add    $0x8e8,%rsp
   140120478:	5b                   	pop    %rbx
   140120479:	5e                   	pop    %rsi
   14012047a:	5f                   	pop    %rdi
   14012047b:	5d                   	pop    %rbp
   14012047c:	41 5c                	pop    %r12
   14012047e:	41 5d                	pop    %r13
   140120480:	41 5e                	pop    %r14
   140120482:	41 5f                	pop    %r15
   140120484:	c3                   	ret
   140120485:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012048c:	0f 84 8e 54 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140120492:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120496:	48 8d 3d 03 7c 29 00 	lea    0x297c03(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012049d:	48 83 c5 01          	add    $0x1,%rbp
   1401204a1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401204a5:	ff e0                	jmp    *%rax
   1401204a7:	48 8d 45 08          	lea    0x8(%rbp),%rax
   1401204ab:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
   1401204af:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1401204b4:	45 84 e4             	test   %r12b,%r12b
   1401204b7:	0f 84 5d 6d 00 00    	je     14012721a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ba>
   1401204bd:	41 80 fc 01          	cmp    $0x1,%r12b
   1401204c1:	0f 84 ef 91 00 00    	je     1401296b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e56>
   1401204c7:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401204cb:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401204d0:	0f 83 67 c0 00 00    	jae    14012c53d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccdd>
   1401204d6:	c5 f8 77             	vzeroupper
   1401204d9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401204de:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   1401204e5:	00 
   1401204e6:	48 89 fa             	mov    %rdi,%rdx
   1401204e9:	4c 89 84 24 80 00 00 	mov    %r8,0x80(%rsp)
   1401204f0:	00 
   1401204f1:	48 89 06             	mov    %rax,(%rsi)
   1401204f4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401204fb:	00 
   1401204fc:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120501:	e8 7a 7c 0e 00       	call   140208180 <setun::VMValue::VMValue(long long)>
   140120506:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   14012050d:	00 
   14012050e:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
   140120515:	00 
   140120516:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012051d:	00 
   14012051e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120525:	0f 84 21 81 00 00    	je     14012864c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dec>
   14012052b:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   14012052f:	48 8d 3d 6a 7b 29 00 	lea    0x297b6a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120536:	48 83 c5 09          	add    $0x9,%rbp
   14012053a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012053e:	ff e0                	jmp    *%rax
   140120540:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140120544:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   14012054b:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   14012054f:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140120556:	4c 01 e8             	add    %r13,%rax
   140120559:	48 c1 fa 03          	sar    $0x3,%rdx
   14012055d:	48 39 d0             	cmp    %rdx,%rax
   140120560:	0f 83 d9 a8 00 00    	jae    14012ae3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5df>
   140120566:	45 84 e4             	test   %r12b,%r12b
   140120569:	0f 84 62 54 00 00    	je     1401259d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6171>
   14012056f:	41 80 fc 01          	cmp    $0x1,%r12b
   140120573:	0f 84 61 8e 00 00    	je     1401293da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b7a>
   140120579:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012057d:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120582:	0f 83 bc c3 00 00    	jae    14012c944 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0e4>
   140120588:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   14012058d:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140120594:	48 89 0e             	mov    %rcx,(%rsi)
   140120597:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   14012059b:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
   1401205a2:	00 
   1401205a3:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401205aa:	00 
   1401205ab:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   1401205b0:	4c 89 c6             	mov    %r8,%rsi
   1401205b3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401205ba:	0f 84 5b 79 00 00    	je     140127f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86bb>
   1401205c0:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401205c4:	48 8d 3d d5 7a 29 00 	lea    0x297ad5(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401205cb:	48 83 c5 03          	add    $0x3,%rbp
   1401205cf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401205d3:	ff e0                	jmp    *%rax
   1401205d5:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401205d9:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   1401205dd:	4c 01 ef             	add    %r13,%rdi
   1401205e0:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   1401205e7:	0f 83 63 a5 00 00    	jae    14012ab50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2f0>
   1401205ed:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   1401205f4:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   1401205fb:	48 c1 f8 03          	sar    $0x3,%rax
   1401205ff:	48 39 c7             	cmp    %rax,%rdi
   140120602:	0f 83 48 aa 00 00    	jae    14012b050 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7f0>
   140120608:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012060c:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   140120613:	00 
   140120614:	45 84 e4             	test   %r12b,%r12b
   140120617:	48 0f 44 c2          	cmove  %rdx,%rax
   14012061b:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140120622:	48 8b 00             	mov    (%rax),%rax
   140120625:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140120629:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120630:	0f 84 da 52 00 00    	je     140125910 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60b0>
   140120636:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   14012063a:	48 8d 3d 5f 7a 29 00 	lea    0x297a5f(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120641:	48 83 c5 03          	add    $0x3,%rbp
   140120645:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120649:	ff e0                	jmp    *%rax
   14012064b:	48 8b 93 88 10 00 00 	mov    0x1088(%rbx),%rdx
   140120652:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140120656:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   14012065a:	48 2b 93 80 10 00 00 	sub    0x1080(%rbx),%rdx
   140120661:	48 c1 fa 03          	sar    $0x3,%rdx
   140120665:	48 39 d0             	cmp    %rdx,%rax
   140120668:	0f 83 c9 ac 00 00    	jae    14012b337 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbad7>
   14012066e:	45 84 e4             	test   %r12b,%r12b
   140120671:	0f 85 e1 53 00 00    	jne    140125a58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61f8>
   140120677:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   14012067e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120684:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   140120688:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012068f:	00 
   140120690:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120697:	0f 84 7e 78 00 00    	je     140127f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86bb>
   14012069d:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401206a1:	48 8d 3d f8 79 29 00 	lea    0x2979f8(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401206a8:	48 83 c5 03          	add    $0x3,%rbp
   1401206ac:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401206b0:	ff e0                	jmp    *%rax
   1401206b2:	48 8b 83 88 10 00 00 	mov    0x1088(%rbx),%rax
   1401206b9:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401206bd:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   1401206c1:	48 2b 83 80 10 00 00 	sub    0x1080(%rbx),%rax
   1401206c8:	48 c1 f8 03          	sar    $0x3,%rax
   1401206cc:	48 39 c7             	cmp    %rax,%rdi
   1401206cf:	0f 83 bb a2 00 00    	jae    14012a990 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb130>
   1401206d5:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401206d9:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   1401206e0:	00 
   1401206e1:	45 84 e4             	test   %r12b,%r12b
   1401206e4:	48 0f 44 c2          	cmove  %rdx,%rax
   1401206e8:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   1401206ef:	48 8b 00             	mov    (%rax),%rax
   1401206f2:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   1401206f6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401206fd:	0f 84 0d 52 00 00    	je     140125910 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60b0>
   140120703:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140120707:	48 8d 3d 92 79 29 00 	lea    0x297992(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012070e:	48 83 c5 03          	add    $0x3,%rbp
   140120712:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120716:	ff e0                	jmp    *%rax
   140120718:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012071f:	00 fb ff 
   140120722:	48 89 84 24 88 01 00 	mov    %rax,0x188(%rsp)
   140120729:	00 
   14012072a:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140120731:	00 
   140120732:	41 80 fc 02          	cmp    $0x2,%r12b
   140120736:	0f 85 14 a0 00 00    	jne    14012a750 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaef0>
   14012073c:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120743:	00 
   140120744:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012074a:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140120751:	00 
   140120752:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120757:	48 89 84 24 88 01 00 	mov    %rax,0x188(%rsp)
   14012075e:	00 
   14012075f:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140120766:	00 ff ff 
   140120769:	48 89 c1             	mov    %rax,%rcx
   14012076c:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140120773:	00 f8 ff 
   140120776:	48 21 d1             	and    %rdx,%rcx
   140120779:	4c 39 c1             	cmp    %r8,%rcx
   14012077c:	0f 84 a4 63 00 00    	je     140126b26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72c6>
   140120782:	48 8d 94 24 90 01 00 	lea    0x190(%rsp),%rdx
   140120789:	00 
   14012078a:	48 8d 8c 24 88 01 00 	lea    0x188(%rsp),%rcx
   140120791:	00 
   140120792:	c5 f8 77             	vzeroupper
   140120795:	e8 a6 0a 0f 00       	call   140211240 <setun::VMValue::add(setun::VMValue const&) const>
   14012079a:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401207a1:	00 
   1401207a2:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401207a9:	0f 84 31 51 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   1401207af:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401207b3:	48 8d 3d e6 78 29 00 	lea    0x2978e6(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401207ba:	48 83 c5 01          	add    $0x1,%rbp
   1401207be:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401207c2:	ff e0                	jmp    *%rax
   1401207c4:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401207cb:	00 fb ff 
   1401207ce:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   1401207d5:	00 
   1401207d6:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   1401207dd:	00 
   1401207de:	41 80 fc 02          	cmp    $0x2,%r12b
   1401207e2:	0f 85 c8 aa 00 00    	jne    14012b2b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba50>
   1401207e8:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401207ef:	00 
   1401207f0:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401207f6:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   1401207fd:	00 
   1401207fe:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120803:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   14012080a:	00 
   14012080b:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140120812:	00 ff ff 
   140120815:	48 89 c1             	mov    %rax,%rcx
   140120818:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   14012081f:	00 f8 ff 
   140120822:	48 21 d1             	and    %rdx,%rcx
   140120825:	4c 39 c1             	cmp    %r8,%rcx
   140120828:	0f 84 9c 64 00 00    	je     140126cca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x746a>
   14012082e:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
   140120835:	00 
   140120836:	48 8d 8c 24 98 01 00 	lea    0x198(%rsp),%rcx
   14012083d:	00 
   14012083e:	c5 f8 77             	vzeroupper
   140120841:	e8 ea 21 0f 00       	call   140212a30 <setun::VMValue::sub(setun::VMValue const&) const>
   140120846:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012084d:	00 
   14012084e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120855:	0f 84 85 50 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   14012085b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012085f:	48 8d 3d 3a 78 29 00 	lea    0x29783a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120866:	48 83 c5 01          	add    $0x1,%rbp
   14012086a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012086e:	ff e0                	jmp    *%rax
   140120870:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120877:	00 fb ff 
   14012087a:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   140120881:	00 
   140120882:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140120889:	00 
   14012088a:	41 80 fc 02          	cmp    $0x2,%r12b
   14012088e:	0f 85 84 a7 00 00    	jne    14012b018 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7b8>
   140120894:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012089b:	00 
   14012089c:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401208a2:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   1401208a9:	00 
   1401208aa:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401208af:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   1401208b6:	00 
   1401208b7:	48 89 c2             	mov    %rax,%rdx
   1401208ba:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401208c1:	00 ff ff 
   1401208c4:	49 89 d0             	mov    %rdx,%r8
   1401208c7:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401208ce:	00 f8 ff 
   1401208d1:	49 21 c0             	and    %rax,%r8
   1401208d4:	49 39 c8             	cmp    %rcx,%r8
   1401208d7:	0f 84 db 5d 00 00    	je     1401266b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e58>
   1401208dd:	48 8d 94 24 b0 01 00 	lea    0x1b0(%rsp),%rdx
   1401208e4:	00 
   1401208e5:	48 8d 8c 24 a8 01 00 	lea    0x1a8(%rsp),%rcx
   1401208ec:	00 
   1401208ed:	c5 f8 77             	vzeroupper
   1401208f0:	e8 bb 18 0f 00       	call   1402121b0 <setun::VMValue::mul(setun::VMValue const&) const>
   1401208f5:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401208fc:	00 
   1401208fd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120904:	0f 84 d6 4f 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   14012090a:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012090e:	48 8d 3d 8b 77 29 00 	lea    0x29778b(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120915:	48 83 c5 01          	add    $0x1,%rbp
   140120919:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012091d:	ff e0                	jmp    *%rax
   14012091f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120926:	00 fb ff 
   140120929:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   140120930:	00 
   140120931:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140120938:	00 
   140120939:	41 80 fc 02          	cmp    $0x2,%r12b
   14012093d:	0f 85 11 9c 00 00    	jne    14012a554 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacf4>
   140120943:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012094a:	00 
   14012094b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120951:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140120958:	00 
   140120959:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012095e:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   140120965:	00 
   140120966:	48 8d 94 24 c0 01 00 	lea    0x1c0(%rsp),%rdx
   14012096d:	00 
   14012096e:	48 8d 8c 24 b8 01 00 	lea    0x1b8(%rsp),%rcx
   140120975:	00 
   140120976:	c5 f8 77             	vzeroupper
   140120979:	e8 92 13 0f 00       	call   140211d10 <setun::VMValue::div(setun::VMValue const&) const>
   14012097e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120985:	00 
   140120986:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012098d:	0f 84 4d 4f 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120993:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120997:	48 8d 3d 02 77 29 00 	lea    0x297702(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012099e:	48 83 c5 01          	add    $0x1,%rbp
   1401209a2:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401209a6:	ff e0                	jmp    *%rax
   1401209a8:	48 8b 45 00          	mov    0x0(%rbp),%rax
   1401209ac:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   1401209b0:	45 84 e4             	test   %r12b,%r12b
   1401209b3:	0f 84 38 51 00 00    	je     140125af1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6291>
   1401209b9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401209bd:	0f 84 6e 8a 00 00    	je     140129431 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd1>
   1401209c3:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401209c7:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   1401209cc:	0f 83 ea bf 00 00    	jae    14012c9bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd15c>
   1401209d2:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   1401209d7:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1401209dc:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   1401209e3:	00 fc ff 
   1401209e6:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   1401209ea:	48 89 0e             	mov    %rcx,(%rsi)
   1401209ed:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
   1401209f4:	00 
   1401209f5:	48 0f 4a c2          	cmovp  %rdx,%rax
   1401209f9:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   1401209fe:	4c 89 c6             	mov    %r8,%rsi
   140120a01:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120a08:	00 
   140120a09:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120a10:	0f 84 05 75 00 00    	je     140127f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86bb>
   140120a16:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140120a1a:	48 8d 3d 7f 76 29 00 	lea    0x29767f(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120a21:	48 83 c5 09          	add    $0x9,%rbp
   140120a25:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120a29:	ff e0                	jmp    *%rax
   140120a2b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120a2f:	48 8d 7d 01          	lea    0x1(%rbp),%rdi
   140120a33:	45 84 e4             	test   %r12b,%r12b
   140120a36:	0f 85 65 50 00 00    	jne    140125aa1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6241>
   140120a3c:	84 c0                	test   %al,%al
   140120a3e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120a44:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140120a4b:	00 fa ff 
   140120a4e:	48 b8 01 00 00 00 00 	movabs $0xfffa000000000001,%rax
   140120a55:	00 fa ff 
   140120a58:	48 0f 45 d0          	cmovne %rax,%rdx
   140120a5c:	48 89 94 24 80 01 00 	mov    %rdx,0x180(%rsp)
   140120a63:	00 
   140120a64:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120a6b:	0f 84 aa 74 00 00    	je     140127f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86bb>
   140120a71:	0f b6 45 01          	movzbl 0x1(%rbp),%eax
   140120a75:	48 8d 3d 24 76 29 00 	lea    0x297624(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120a7c:	48 83 c5 02          	add    $0x2,%rbp
   140120a80:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120a84:	ff e0                	jmp    *%rax
   140120a86:	41 80 fc 01          	cmp    $0x1,%r12b
   140120a8a:	0f 85 c9 a8 00 00    	jne    14012b359 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf9>
   140120a90:	45 31 e4             	xor    %r12d,%r12d
   140120a93:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120a9a:	0f 84 80 4e 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140120aa0:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120aa4:	48 8d 3d f5 75 29 00 	lea    0x2975f5(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120aab:	48 83 c5 01          	add    $0x1,%rbp
   140120aaf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120ab3:	ff e0                	jmp    *%rax
   140120ab5:	45 84 e4             	test   %r12b,%r12b
   140120ab8:	0f 84 c6 4e 00 00    	je     140125984 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6124>
   140120abe:	41 80 fc 01          	cmp    $0x1,%r12b
   140120ac2:	0f 84 9d 8a 00 00    	je     140129565 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d05>
   140120ac8:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140120acc:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120ad1:	0f 83 f4 cb 00 00    	jae    14012d6cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde6b>
   140120ad7:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120adc:	48 89 06             	mov    %rax,(%rsi)
   140120adf:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120ae6:	00 
   140120ae7:	4c 89 c6             	mov    %r8,%rsi
   140120aea:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120aef:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120af6:	0f 84 24 4e 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140120afc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120b00:	48 8d 3d 99 75 29 00 	lea    0x297599(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120b07:	48 83 c5 01          	add    $0x1,%rbp
   140120b0b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120b0f:	ff e0                	jmp    *%rax
   140120b11:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140120b15:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   140120b19:	45 84 e4             	test   %r12b,%r12b
   140120b1c:	0f 84 97 4e 00 00    	je     1401259b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6159>
   140120b22:	41 80 fc 01          	cmp    $0x1,%r12b
   140120b26:	0f 84 89 88 00 00    	je     1401293b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b55>
   140120b2c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140120b30:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120b35:	0f 83 3f c2 00 00    	jae    14012cd7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd51a>
   140120b3b:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   140120b40:	0f b7 c0             	movzwl %ax,%eax
   140120b43:	48 ba 00 00 00 00 00 	movabs $0xfff9000000000000,%rdx
   140120b4a:	00 f9 ff 
   140120b4d:	48 09 d0             	or     %rdx,%rax
   140120b50:	48 89 0e             	mov    %rcx,(%rsi)
   140120b53:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
   140120b5a:	00 
   140120b5b:	48 89 74 24 40       	mov    %rsi,0x40(%rsp)
   140120b60:	4c 89 c6             	mov    %r8,%rsi
   140120b63:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120b6a:	00 
   140120b6b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120b72:	0f 84 a3 73 00 00    	je     140127f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86bb>
   140120b78:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140120b7c:	48 8d 3d 1d 75 29 00 	lea    0x29751d(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120b83:	48 83 c5 03          	add    $0x3,%rbp
   140120b87:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120b8b:	ff e0                	jmp    *%rax
   140120b8d:	48 8d 45 14          	lea    0x14(%rbp),%rax
   140120b91:	c5 fa 6f 45 00       	vmovdqu 0x0(%rbp),%xmm0
   140120b96:	8b 7d 10             	mov    0x10(%rbp),%edi
   140120b99:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140120b9e:	45 84 e4             	test   %r12b,%r12b
   140120ba1:	0f 84 0c 66 00 00    	je     1401271b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7953>
   140120ba7:	41 80 fc 01          	cmp    $0x1,%r12b
   140120bab:	0f 84 39 8a 00 00    	je     1401295ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d8a>
   140120bb1:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140120bb5:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140120bba:	0f 83 c6 b7 00 00    	jae    14012c386 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb26>
   140120bc0:	c5 f8 77             	vzeroupper
   140120bc3:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120bc8:	48 8d 94 24 60 01 00 	lea    0x160(%rsp),%rdx
   140120bcf:	00 
   140120bd0:	48 8d 8c 24 c0 04 00 	lea    0x4c0(%rsp),%rcx
   140120bd7:	00 
   140120bd8:	4c 89 84 24 80 00 00 	mov    %r8,0x80(%rsp)
   140120bdf:	00 
   140120be0:	48 89 06             	mov    %rax,(%rsi)
   140120be3:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120bea:	00 
   140120beb:	89 bc 24 10 06 00 00 	mov    %edi,0x610(%rsp)
   140120bf2:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140120bf7:	c7 84 24 14 06 00 00 	movl   $0x0,0x614(%rsp)
   140120bfe:	00 00 00 00 
   140120c02:	48 8b 84 24 10 06 00 	mov    0x610(%rsp),%rax
   140120c09:	00 
   140120c0a:	c5 f9 7f 84 24 00 06 	vmovdqa %xmm0,0x600(%rsp)
   140120c11:	00 00 
   140120c13:	48 89 84 24 70 01 00 	mov    %rax,0x170(%rsp)
   140120c1a:	00 
   140120c1b:	c5 f9 7f 84 24 60 01 	vmovdqa %xmm0,0x160(%rsp)
   140120c22:	00 00 
   140120c24:	e8 17 5a 0e 00       	call   140206640 <setun::VMValue::VMValue(setun::TafpuNum)>
   140120c29:	48 8b 84 24 c0 04 00 	mov    0x4c0(%rsp),%rax
   140120c30:	00 
   140120c31:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
   140120c38:	00 
   140120c39:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120c40:	00 
   140120c41:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120c48:	0f 84 fe 79 00 00    	je     14012864c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dec>
   140120c4e:	0f b6 45 14          	movzbl 0x14(%rbp),%eax
   140120c52:	48 8d 3d 47 74 29 00 	lea    0x297447(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120c59:	48 83 c5 15          	add    $0x15,%rbp
   140120c5d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120c61:	ff e0                	jmp    *%rax
   140120c63:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120c6a:	00 fb ff 
   140120c6d:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140120c74:	00 
   140120c75:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140120c7c:	00 
   140120c7d:	41 80 fc 02          	cmp    $0x2,%r12b
   140120c81:	0f 85 e9 a2 00 00    	jne    14012af70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb710>
   140120c87:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120c8e:	00 
   140120c8f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120c95:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   140120c9c:	00 
   140120c9d:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120ca2:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140120ca9:	00 
   140120caa:	48 8d 94 24 d0 01 00 	lea    0x1d0(%rsp),%rdx
   140120cb1:	00 
   140120cb2:	48 8d 8c 24 c8 01 00 	lea    0x1c8(%rsp),%rcx
   140120cb9:	00 
   140120cba:	c5 f8 77             	vzeroupper
   140120cbd:	e8 4e 13 0f 00       	call   140212010 <setun::VMValue::mod(setun::VMValue const&) const>
   140120cc2:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120cc9:	00 
   140120cca:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120cd1:	0f 84 09 4c 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120cd7:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120cdb:	48 8d 3d be 73 29 00 	lea    0x2973be(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120ce2:	48 83 c5 01          	add    $0x1,%rbp
   140120ce6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120cea:	ff e0                	jmp    *%rax
   140120cec:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120cf3:	00 fb ff 
   140120cf6:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   140120cfd:	00 
   140120cfe:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   140120d05:	00 
   140120d06:	41 80 fc 02          	cmp    $0x2,%r12b
   140120d0a:	0f 85 ee 9e 00 00    	jne    14012abfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb39e>
   140120d10:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120d17:	00 
   140120d18:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120d1e:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
   140120d25:	00 
   140120d26:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120d2b:	48 89 84 24 d8 01 00 	mov    %rax,0x1d8(%rsp)
   140120d32:	00 
   140120d33:	48 8d 94 24 e0 01 00 	lea    0x1e0(%rsp),%rdx
   140120d3a:	00 
   140120d3b:	48 8d 8c 24 d8 01 00 	lea    0x1d8(%rsp),%rcx
   140120d42:	00 
   140120d43:	c5 f8 77             	vzeroupper
   140120d46:	e8 95 29 0f 00       	call   1402136e0 <setun::VMValue::bit_and(setun::VMValue const&) const>
   140120d4b:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120d52:	00 
   140120d53:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120d5a:	0f 84 80 4b 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120d60:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120d64:	48 8d 3d 35 73 29 00 	lea    0x297335(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120d6b:	48 83 c5 01          	add    $0x1,%rbp
   140120d6f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120d73:	ff e0                	jmp    *%rax
   140120d75:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120d7c:	00 fb ff 
   140120d7f:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   140120d86:	00 
   140120d87:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140120d8e:	00 
   140120d8f:	41 80 fc 02          	cmp    $0x2,%r12b
   140120d93:	0f 85 35 9e 00 00    	jne    14012abce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb36e>
   140120d99:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120da0:	00 
   140120da1:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120da7:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   140120dae:	00 
   140120daf:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120db4:	48 89 84 24 e8 01 00 	mov    %rax,0x1e8(%rsp)
   140120dbb:	00 
   140120dbc:	48 8d 94 24 f0 01 00 	lea    0x1f0(%rsp),%rdx
   140120dc3:	00 
   140120dc4:	48 8d 8c 24 e8 01 00 	lea    0x1e8(%rsp),%rcx
   140120dcb:	00 
   140120dcc:	c5 f8 77             	vzeroupper
   140120dcf:	e8 dc 20 0f 00       	call   140212eb0 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140120dd4:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120ddb:	00 
   140120ddc:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120de3:	0f 84 f7 4a 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120de9:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120ded:	48 8d 3d ac 72 29 00 	lea    0x2972ac(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120df4:	48 83 c5 01          	add    $0x1,%rbp
   140120df8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120dfc:	ff e0                	jmp    *%rax
   140120dfe:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120e05:	00 fb ff 
   140120e08:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   140120e0f:	00 
   140120e10:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   140120e17:	00 
   140120e18:	41 80 fc 02          	cmp    $0x2,%r12b
   140120e1c:	0f 85 7c 9d 00 00    	jne    14012ab9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb33e>
   140120e22:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120e29:	00 
   140120e2a:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120e30:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
   140120e37:	00 
   140120e38:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120e3d:	48 89 84 24 f8 01 00 	mov    %rax,0x1f8(%rsp)
   140120e44:	00 
   140120e45:	48 8d 94 24 00 02 00 	lea    0x200(%rsp),%rdx
   140120e4c:	00 
   140120e4d:	48 8d 8c 24 f8 01 00 	lea    0x1f8(%rsp),%rcx
   140120e54:	00 
   140120e55:	c5 f8 77             	vzeroupper
   140120e58:	e8 83 2d 0f 00       	call   140213be0 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   140120e5d:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120e64:	00 
   140120e65:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120e6c:	0f 84 6e 4a 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120e72:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120e76:	48 8d 3d 23 72 29 00 	lea    0x297223(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120e7d:	48 83 c5 01          	add    $0x1,%rbp
   140120e81:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120e85:	ff e0                	jmp    *%rax
   140120e87:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120e8e:	00 fb ff 
   140120e91:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140120e98:	00 
   140120e99:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140120ea0:	00 
   140120ea1:	41 80 fc 02          	cmp    $0x2,%r12b
   140120ea5:	0f 85 3a a0 00 00    	jne    14012aee5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb685>
   140120eab:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120eb2:	00 
   140120eb3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120eb9:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140120ec0:	00 
   140120ec1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120ec6:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140120ecd:	00 
   140120ece:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
   140120ed5:	00 
   140120ed6:	48 8d 8c 24 08 02 00 	lea    0x208(%rsp),%rcx
   140120edd:	00 
   140120ede:	c5 f8 77             	vzeroupper
   140120ee1:	e8 fa 16 0f 00       	call   1402125e0 <setun::VMValue::shl(setun::VMValue const&) const>
   140120ee6:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120eed:	00 
   140120eee:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120ef5:	0f 84 e5 49 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120efb:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120eff:	48 8d 3d 9a 71 29 00 	lea    0x29719a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120f06:	48 83 c5 01          	add    $0x1,%rbp
   140120f0a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120f0e:	ff e0                	jmp    *%rax
   140120f10:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120f17:	00 fb ff 
   140120f1a:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   140120f21:	00 
   140120f22:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   140120f29:	00 
   140120f2a:	41 80 fc 02          	cmp    $0x2,%r12b
   140120f2e:	0f 85 81 9f 00 00    	jne    14012aeb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb655>
   140120f34:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140120f3b:	00 
   140120f3c:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120f42:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
   140120f49:	00 
   140120f4a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140120f4f:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
   140120f56:	00 
   140120f57:	48 8d 94 24 20 02 00 	lea    0x220(%rsp),%rdx
   140120f5e:	00 
   140120f5f:	48 8d 8c 24 18 02 00 	lea    0x218(%rsp),%rcx
   140120f66:	00 
   140120f67:	c5 f8 77             	vzeroupper
   140120f6a:	e8 91 18 0f 00       	call   140212800 <setun::VMValue::shr(setun::VMValue const&) const>
   140120f6f:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120f76:	00 
   140120f77:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120f7e:	0f 84 5c 49 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140120f84:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120f88:	48 8d 3d 11 71 29 00 	lea    0x297111(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120f8f:	48 83 c5 01          	add    $0x1,%rbp
   140120f93:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120f97:	ff e0                	jmp    *%rax
   140120f99:	45 84 e4             	test   %r12b,%r12b
   140120f9c:	0f 85 a6 49 00 00    	jne    140125948 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60e8>
   140120fa2:	48 83 ee 08          	sub    $0x8,%rsi
   140120fa6:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140120fac:	48 89 f1             	mov    %rsi,%rcx
   140120faf:	c5 f8 77             	vzeroupper
   140120fb2:	e8 e9 14 0f 00       	call   1402124a0 <setun::VMValue::neg() const>
   140120fb7:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140120fbe:	00 
   140120fbf:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140120fc6:	0f 84 d1 71 00 00    	je     14012819d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x893d>
   140120fcc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140120fd0:	48 8d 3d c9 70 29 00 	lea    0x2970c9(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140120fd7:	48 83 c5 01          	add    $0x1,%rbp
   140120fdb:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140120fdf:	ff e0                	jmp    *%rax
   140120fe1:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140120fe8:	00 fb ff 
   140120feb:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   140120ff2:	00 
   140120ff3:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   140120ffa:	00 
   140120ffb:	41 80 fc 02          	cmp    $0x2,%r12b
   140120fff:	0f 85 6b 9e 00 00    	jne    14012ae70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb610>
   140121005:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012100c:	00 
   14012100d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121013:	48 89 84 24 30 02 00 	mov    %rax,0x230(%rsp)
   14012101a:	00 
   14012101b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140121020:	48 89 84 24 28 02 00 	mov    %rax,0x228(%rsp)
   140121027:	00 
   140121028:	48 8b 8c 24 28 02 00 	mov    0x228(%rsp),%rcx
   14012102f:	00 
   140121030:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140121037:	ff ff ff 
   14012103a:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140121041:	00 fd ff 
   140121044:	48 21 c1             	and    %rax,%rcx
   140121047:	48 39 d1             	cmp    %rdx,%rcx
   14012104a:	0f 84 1d 6a 00 00    	je     140127a6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x820d>
   140121050:	48 23 84 24 30 02 00 	and    0x230(%rsp),%rax
   140121057:	00 
   140121058:	48 39 d0             	cmp    %rdx,%rax
   14012105b:	0f 84 0c 6a 00 00    	je     140127a6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x820d>
   140121061:	48 8d 8c 24 28 02 00 	lea    0x228(%rsp),%rcx
   140121068:	00 
   140121069:	c5 f8 77             	vzeroupper
   14012106c:	e8 9f 1c 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121071:	48 8d 8c 24 30 02 00 	lea    0x230(%rsp),%rcx
   140121078:	00 
   140121079:	48 89 c7             	mov    %rax,%rdi
   14012107c:	e8 8f 1c 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121081:	48 8b 8c 24 28 02 00 	mov    0x228(%rsp),%rcx
   140121088:	00 
   140121089:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121090:	00 ff ff 
   140121093:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   14012109a:	00 fa ff 
   14012109d:	48 21 d1             	and    %rdx,%rcx
   1401210a0:	4c 39 c1             	cmp    %r8,%rcx
   1401210a3:	75 11                	jne    1401210b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1856>
   1401210a5:	48 23 94 24 30 02 00 	and    0x230(%rsp),%rdx
   1401210ac:	00 
   1401210ad:	48 39 ca             	cmp    %rcx,%rdx
   1401210b0:	0f 84 a8 85 00 00    	je     14012965e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dfe>
   1401210b6:	48 39 c7             	cmp    %rax,%rdi
   1401210b9:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   1401210c0:	00 
   1401210c1:	48 0f 4e c7          	cmovle %rdi,%rax
   1401210c5:	48 89 c2             	mov    %rax,%rdx
   1401210c8:	e8 b3 70 0e 00       	call   140208180 <setun::VMValue::VMValue(long long)>
   1401210cd:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   1401210d4:	00 
   1401210d5:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401210dc:	00 
   1401210dd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401210e4:	0f 84 f6 47 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   1401210ea:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401210ee:	48 8d 3d ab 6f 29 00 	lea    0x296fab(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401210f5:	48 83 c5 01          	add    $0x1,%rbp
   1401210f9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401210fd:	ff e0                	jmp    *%rax
   1401210ff:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121106:	00 fb ff 
   140121109:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140121110:	00 
   140121111:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140121118:	00 
   140121119:	41 80 fc 02          	cmp    $0x2,%r12b
   14012111d:	0f 85 19 97 00 00    	jne    14012a83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafdc>
   140121123:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012112a:	00 
   14012112b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121131:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140121138:	00 
   140121139:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012113e:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140121145:	00 
   140121146:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   14012114d:	00 
   14012114e:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140121155:	ff ff ff 
   140121158:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   14012115f:	00 fd ff 
   140121162:	48 21 c1             	and    %rax,%rcx
   140121165:	48 39 d1             	cmp    %rdx,%rcx
   140121168:	0f 84 9b 68 00 00    	je     140127a09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81a9>
   14012116e:	48 23 84 24 40 02 00 	and    0x240(%rsp),%rax
   140121175:	00 
   140121176:	48 39 d0             	cmp    %rdx,%rax
   140121179:	0f 84 8a 68 00 00    	je     140127a09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81a9>
   14012117f:	48 8d 8c 24 38 02 00 	lea    0x238(%rsp),%rcx
   140121186:	00 
   140121187:	c5 f8 77             	vzeroupper
   14012118a:	e8 81 1b 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   14012118f:	48 8d 8c 24 40 02 00 	lea    0x240(%rsp),%rcx
   140121196:	00 
   140121197:	48 89 c7             	mov    %rax,%rdi
   14012119a:	e8 71 1b 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   14012119f:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   1401211a6:	00 
   1401211a7:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401211ae:	00 ff ff 
   1401211b1:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   1401211b8:	00 fa ff 
   1401211bb:	48 21 d1             	and    %rdx,%rcx
   1401211be:	4c 39 c1             	cmp    %r8,%rcx
   1401211c1:	75 11                	jne    1401211d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1974>
   1401211c3:	48 23 94 24 40 02 00 	and    0x240(%rsp),%rdx
   1401211ca:	00 
   1401211cb:	48 39 ca             	cmp    %rcx,%rdx
   1401211ce:	0f 84 b6 84 00 00    	je     14012968a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e2a>
   1401211d4:	48 39 c7             	cmp    %rax,%rdi
   1401211d7:	48 8d 8c 24 00 06 00 	lea    0x600(%rsp),%rcx
   1401211de:	00 
   1401211df:	48 0f 4d c7          	cmovge %rdi,%rax
   1401211e3:	48 89 c2             	mov    %rax,%rdx
   1401211e6:	e8 95 6f 0e 00       	call   140208180 <setun::VMValue::VMValue(long long)>
   1401211eb:	48 8b 84 24 00 06 00 	mov    0x600(%rsp),%rax
   1401211f2:	00 
   1401211f3:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401211fa:	00 
   1401211fb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121202:	0f 84 d8 46 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140121208:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012120c:	48 8d 3d 8d 6e 29 00 	lea    0x296e8d(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121213:	48 83 c5 01          	add    $0x1,%rbp
   140121217:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012121b:	ff e0                	jmp    *%rax
   14012121d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121224:	00 fb ff 
   140121227:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   14012122e:	00 
   14012122f:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   140121236:	00 
   140121237:	41 80 fc 02          	cmp    $0x2,%r12b
   14012123b:	0f 85 1f 97 00 00    	jne    14012a960 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb100>
   140121241:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121248:	00 
   140121249:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012124f:	48 89 84 24 50 02 00 	mov    %rax,0x250(%rsp)
   140121256:	00 
   140121257:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012125c:	48 89 84 24 48 02 00 	mov    %rax,0x248(%rsp)
   140121263:	00 
   140121264:	48 8b 8c 24 48 02 00 	mov    0x248(%rsp),%rcx
   14012126b:	00 
   14012126c:	48 8b 94 24 50 02 00 	mov    0x250(%rsp),%rdx
   140121273:	00 
   140121274:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   14012127b:	00 ff ff 
   14012127e:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   140121285:	00 f8 ff 
   140121288:	49 89 c8             	mov    %rcx,%r8
   14012128b:	49 21 c0             	and    %rax,%r8
   14012128e:	4d 39 c8             	cmp    %r9,%r8
   140121291:	0f 84 05 4a 00 00    	je     140125c9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x643c>
   140121297:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   14012129e:	00 fd ff 
   1401212a1:	4d 39 d0             	cmp    %r10,%r8
   1401212a4:	0f 84 ce 7d 00 00    	je     140129078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9818>
   1401212aa:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   1401212b1:	00 fc ff 
   1401212b4:	4c 39 c1             	cmp    %r8,%rcx
   1401212b7:	0f 84 9c 6d 00 00    	je     140128059 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87f9>
   1401212bd:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   1401212c4:	ff f7 ff 
   1401212c7:	49 39 c9             	cmp    %rcx,%r9
   1401212ca:	0f 83 89 6d 00 00    	jae    140128059 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87f9>
   1401212d0:	49 39 d1             	cmp    %rdx,%r9
   1401212d3:	0f 83 80 6d 00 00    	jae    140128059 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87f9>
   1401212d9:	4c 39 c2             	cmp    %r8,%rdx
   1401212dc:	0f 84 77 6d 00 00    	je     140128059 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87f9>
   1401212e2:	48 21 d0             	and    %rdx,%rax
   1401212e5:	4c 39 d0             	cmp    %r10,%rax
   1401212e8:	0f 84 82 a4 00 00    	je     14012b770 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf10>
   1401212ee:	48 8d 8c 24 48 02 00 	lea    0x248(%rsp),%rcx
   1401212f5:	00 
   1401212f6:	c5 f8 77             	vzeroupper
   1401212f9:	e8 12 1a 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401212fe:	48 8d 8c 24 50 02 00 	lea    0x250(%rsp),%rcx
   140121305:	00 
   140121306:	48 89 c7             	mov    %rax,%rdi
   140121309:	e8 02 1a 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   14012130e:	48 39 c7             	cmp    %rax,%rdi
   140121311:	40 0f 94 c7          	sete   %dil
   140121315:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012131c:	00 fa ff 
   14012131f:	40 0f b6 c7          	movzbl %dil,%eax
   140121323:	48 01 d0             	add    %rdx,%rax
   140121326:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012132d:	00 
   14012132e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121335:	0f 84 a5 45 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   14012133b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012133f:	48 8d 3d 5a 6d 29 00 	lea    0x296d5a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121346:	48 83 c5 01          	add    $0x1,%rbp
   14012134a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012134e:	ff e0                	jmp    *%rax
   140121350:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121357:	00 fb ff 
   14012135a:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140121361:	00 
   140121362:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140121369:	00 
   14012136a:	41 80 fc 02          	cmp    $0x2,%r12b
   14012136e:	0f 85 82 93 00 00    	jne    14012a6f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae96>
   140121374:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012137b:	00 
   14012137c:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121382:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140121389:	00 
   14012138a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012138f:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140121396:	00 
   140121397:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
   14012139e:	00 
   14012139f:	48 b9 00 00 00 00 00 	movabs $0xffff000000000000,%rcx
   1401213a6:	00 ff ff 
   1401213a9:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401213b0:	00 f8 ff 
   1401213b3:	48 89 c2             	mov    %rax,%rdx
   1401213b6:	48 21 ca             	and    %rcx,%rdx
   1401213b9:	4c 39 c2             	cmp    %r8,%rdx
   1401213bc:	0f 84 8e 47 00 00    	je     140125b50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62f0>
   1401213c2:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   1401213c9:	00 fd ff 
   1401213cc:	4c 39 c2             	cmp    %r8,%rdx
   1401213cf:	0f 84 6e 47 00 00    	je     140125b43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62e3>
   1401213d5:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   1401213dc:	00 fc ff 
   1401213df:	48 39 d0             	cmp    %rdx,%rax
   1401213e2:	0f 84 f6 6a 00 00    	je     140127ede <setun::VM::run_optimized(setun::OptimizedChunk&)+0x867e>
   1401213e8:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   1401213ef:	ff f7 ff 
   1401213f2:	49 39 c1             	cmp    %rax,%r9
   1401213f5:	0f 83 e3 6a 00 00    	jae    140127ede <setun::VM::run_optimized(setun::OptimizedChunk&)+0x867e>
   1401213fb:	48 8b 84 24 60 02 00 	mov    0x260(%rsp),%rax
   140121402:	00 
   140121403:	49 39 c1             	cmp    %rax,%r9
   140121406:	0f 83 d2 6a 00 00    	jae    140127ede <setun::VM::run_optimized(setun::OptimizedChunk&)+0x867e>
   14012140c:	48 39 d0             	cmp    %rdx,%rax
   14012140f:	0f 84 c9 6a 00 00    	je     140127ede <setun::VM::run_optimized(setun::OptimizedChunk&)+0x867e>
   140121415:	48 21 c1             	and    %rax,%rcx
   140121418:	4c 39 c1             	cmp    %r8,%rcx
   14012141b:	0f 84 ab 9f 00 00    	je     14012b3cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb6c>
   140121421:	48 8d 8c 24 58 02 00 	lea    0x258(%rsp),%rcx
   140121428:	00 
   140121429:	c5 f8 77             	vzeroupper
   14012142c:	e8 df 18 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121431:	48 8d 8c 24 60 02 00 	lea    0x260(%rsp),%rcx
   140121438:	00 
   140121439:	48 89 c7             	mov    %rax,%rdi
   14012143c:	e8 cf 18 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121441:	48 39 c7             	cmp    %rax,%rdi
   140121444:	0f 95 c0             	setne  %al
   140121447:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012144e:	00 fa ff 
   140121451:	0f b6 c0             	movzbl %al,%eax
   140121454:	48 01 d0             	add    %rdx,%rax
   140121457:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012145e:	00 
   14012145f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121466:	0f 84 74 44 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   14012146c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140121470:	48 8d 3d 29 6c 29 00 	lea    0x296c29(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121477:	48 83 c5 01          	add    $0x1,%rbp
   14012147b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012147f:	ff e0                	jmp    *%rax
   140121481:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121488:	00 fb ff 
   14012148b:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   140121492:	00 
   140121493:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   14012149a:	00 
   14012149b:	41 80 fc 02          	cmp    $0x2,%r12b
   14012149f:	0f 85 34 90 00 00    	jne    14012a4d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac79>
   1401214a5:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401214ac:	00 
   1401214ad:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401214b3:	48 89 84 24 70 02 00 	mov    %rax,0x270(%rsp)
   1401214ba:	00 
   1401214bb:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401214c0:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
   1401214c7:	00 
   1401214c8:	48 8b 8c 24 68 02 00 	mov    0x268(%rsp),%rcx
   1401214cf:	00 
   1401214d0:	48 8b 84 24 70 02 00 	mov    0x270(%rsp),%rax
   1401214d7:	00 
   1401214d8:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401214df:	00 ff ff 
   1401214e2:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   1401214e9:	00 f8 ff 
   1401214ec:	49 89 c8             	mov    %rcx,%r8
   1401214ef:	49 21 d0             	and    %rdx,%r8
   1401214f2:	4d 39 c8             	cmp    %r9,%r8
   1401214f5:	0f 84 bd 48 00 00    	je     140125db8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6558>
   1401214fb:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140121502:	00 fd ff 
   140121505:	4d 39 d0             	cmp    %r10,%r8
   140121508:	0f 84 52 7d 00 00    	je     140129260 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a00>
   14012150e:	49 b8 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r8
   140121515:	ff f7 ff 
   140121518:	49 39 c8             	cmp    %rcx,%r8
   14012151b:	0f 83 a7 6b 00 00    	jae    1401280c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8868>
   140121521:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140121528:	00 fc ff 
   14012152b:	4c 39 c9             	cmp    %r9,%rcx
   14012152e:	0f 84 94 6b 00 00    	je     1401280c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8868>
   140121534:	49 39 c0             	cmp    %rax,%r8
   140121537:	0f 83 8b 6b 00 00    	jae    1401280c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8868>
   14012153d:	4c 39 c8             	cmp    %r9,%rax
   140121540:	0f 84 82 6b 00 00    	je     1401280c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8868>
   140121546:	48 21 c2             	and    %rax,%rdx
   140121549:	4c 39 d2             	cmp    %r10,%rdx
   14012154c:	0f 84 71 a4 00 00    	je     14012b9c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc163>
   140121552:	48 8d 8c 24 68 02 00 	lea    0x268(%rsp),%rcx
   140121559:	00 
   14012155a:	c5 f8 77             	vzeroupper
   14012155d:	e8 ae 17 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121562:	48 8d 8c 24 70 02 00 	lea    0x270(%rsp),%rcx
   140121569:	00 
   14012156a:	48 89 c7             	mov    %rax,%rdi
   14012156d:	e8 9e 17 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121572:	48 39 c7             	cmp    %rax,%rdi
   140121575:	0f 9c c0             	setl   %al
   140121578:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012157f:	00 fa ff 
   140121582:	0f b6 c0             	movzbl %al,%eax
   140121585:	48 01 d0             	add    %rdx,%rax
   140121588:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012158f:	00 
   140121590:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121597:	0f 84 43 43 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   14012159d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401215a1:	48 8d 3d f8 6a 29 00 	lea    0x296af8(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401215a8:	48 83 c5 01          	add    $0x1,%rbp
   1401215ac:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401215b0:	ff e0                	jmp    *%rax
   1401215b2:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401215b9:	00 fb ff 
   1401215bc:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   1401215c3:	00 
   1401215c4:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   1401215cb:	00 
   1401215cc:	41 80 fc 02          	cmp    $0x2,%r12b
   1401215d0:	0f 85 12 9d 00 00    	jne    14012b2e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba88>
   1401215d6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401215dd:	00 
   1401215de:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401215e4:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   1401215eb:	00 
   1401215ec:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401215f1:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   1401215f8:	00 
   1401215f9:	48 8b 8c 24 78 02 00 	mov    0x278(%rsp),%rcx
   140121600:	00 
   140121601:	48 8b 84 24 80 02 00 	mov    0x280(%rsp),%rax
   140121608:	00 
   140121609:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121610:	00 ff ff 
   140121613:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   14012161a:	00 f8 ff 
   14012161d:	49 89 c8             	mov    %rcx,%r8
   140121620:	49 21 d0             	and    %rdx,%r8
   140121623:	4d 39 c8             	cmp    %r9,%r8
   140121626:	0f 84 35 4a 00 00    	je     140126061 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6801>
   14012162c:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140121633:	00 fd ff 
   140121636:	4d 39 d0             	cmp    %r10,%r8
   140121639:	0f 84 1b 7b 00 00    	je     14012915a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98fa>
   14012163f:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   140121646:	00 fc ff 
   140121649:	4c 39 c1             	cmp    %r8,%rcx
   14012164c:	0f 84 a3 6a 00 00    	je     1401280f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8895>
   140121652:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140121659:	ff f7 ff 
   14012165c:	49 39 c9             	cmp    %rcx,%r9
   14012165f:	0f 83 90 6a 00 00    	jae    1401280f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8895>
   140121665:	4c 39 c0             	cmp    %r8,%rax
   140121668:	0f 84 87 6a 00 00    	je     1401280f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8895>
   14012166e:	49 39 c1             	cmp    %rax,%r9
   140121671:	0f 83 7e 6a 00 00    	jae    1401280f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8895>
   140121677:	48 21 c2             	and    %rax,%rdx
   14012167a:	4c 39 d2             	cmp    %r10,%rdx
   14012167d:	0f 84 fe a7 00 00    	je     14012be81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc621>
   140121683:	48 8d 8c 24 78 02 00 	lea    0x278(%rsp),%rcx
   14012168a:	00 
   14012168b:	c5 f8 77             	vzeroupper
   14012168e:	e8 7d 16 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121693:	48 8d 8c 24 80 02 00 	lea    0x280(%rsp),%rcx
   14012169a:	00 
   14012169b:	48 89 c7             	mov    %rax,%rdi
   14012169e:	e8 6d 16 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401216a3:	48 39 c7             	cmp    %rax,%rdi
   1401216a6:	0f 9e c0             	setle  %al
   1401216a9:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401216b0:	00 fa ff 
   1401216b3:	0f b6 c0             	movzbl %al,%eax
   1401216b6:	48 01 d0             	add    %rdx,%rax
   1401216b9:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401216c0:	00 
   1401216c1:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401216c8:	0f 84 12 42 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   1401216ce:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401216d2:	48 8d 3d c7 69 29 00 	lea    0x2969c7(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401216d9:	48 83 c5 01          	add    $0x1,%rbp
   1401216dd:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401216e1:	ff e0                	jmp    *%rax
   1401216e3:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401216ea:	00 fb ff 
   1401216ed:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   1401216f4:	00 
   1401216f5:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   1401216fc:	00 
   1401216fd:	41 80 fc 02          	cmp    $0x2,%r12b
   140121701:	0f 85 ad 95 00 00    	jne    14012acb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb454>
   140121707:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012170e:	00 
   14012170f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121715:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   14012171c:	00 
   14012171d:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140121722:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   140121729:	00 
   14012172a:	48 8b 8c 24 88 02 00 	mov    0x288(%rsp),%rcx
   140121731:	00 
   140121732:	48 8b 84 24 90 02 00 	mov    0x290(%rsp),%rax
   140121739:	00 
   14012173a:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121741:	00 ff ff 
   140121744:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   14012174b:	00 f8 ff 
   14012174e:	49 89 c8             	mov    %rcx,%r8
   140121751:	49 21 d0             	and    %rdx,%r8
   140121754:	4d 39 c8             	cmp    %r9,%r8
   140121757:	0f 84 83 4b 00 00    	je     1401262e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a80>
   14012175d:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140121764:	00 fd ff 
   140121767:	4d 39 d0             	cmp    %r10,%r8
   14012176a:	0f 84 70 7a 00 00    	je     1401291e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9980>
   140121770:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   140121777:	00 fc ff 
   14012177a:	4c 39 c1             	cmp    %r8,%rcx
   14012177d:	0f 84 18 69 00 00    	je     14012809b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x883b>
   140121783:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   14012178a:	ff f7 ff 
   14012178d:	49 39 c9             	cmp    %rcx,%r9
   140121790:	0f 83 05 69 00 00    	jae    14012809b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x883b>
   140121796:	4c 39 c0             	cmp    %r8,%rax
   140121799:	0f 84 fc 68 00 00    	je     14012809b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x883b>
   14012179f:	49 39 c1             	cmp    %rax,%r9
   1401217a2:	0f 83 f3 68 00 00    	jae    14012809b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x883b>
   1401217a8:	48 21 c2             	and    %rax,%rdx
   1401217ab:	4c 39 d2             	cmp    %r10,%rdx
   1401217ae:	0f 84 ed a2 00 00    	je     14012baa1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc241>
   1401217b4:	48 8d 8c 24 88 02 00 	lea    0x288(%rsp),%rcx
   1401217bb:	00 
   1401217bc:	c5 f8 77             	vzeroupper
   1401217bf:	e8 4c 15 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401217c4:	48 8d 8c 24 90 02 00 	lea    0x290(%rsp),%rcx
   1401217cb:	00 
   1401217cc:	48 89 c7             	mov    %rax,%rdi
   1401217cf:	e8 3c 15 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401217d4:	48 39 c7             	cmp    %rax,%rdi
   1401217d7:	0f 9f c0             	setg   %al
   1401217da:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401217e1:	00 fa ff 
   1401217e4:	0f b6 c0             	movzbl %al,%eax
   1401217e7:	48 01 d0             	add    %rdx,%rax
   1401217ea:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401217f1:	00 
   1401217f2:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401217f9:	0f 84 e1 40 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   1401217ff:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140121803:	48 8d 3d 96 68 29 00 	lea    0x296896(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012180a:	48 83 c5 01          	add    $0x1,%rbp
   14012180e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121812:	ff e0                	jmp    *%rax
   140121814:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012181b:	00 fb ff 
   14012181e:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   140121825:	00 
   140121826:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   14012182d:	00 
   14012182e:	41 80 fc 02          	cmp    $0x2,%r12b
   140121832:	0f 85 8d 8f 00 00    	jne    14012a7c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf65>
   140121838:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012183f:	00 
   140121840:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121846:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   14012184d:	00 
   14012184e:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140121853:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   14012185a:	00 
   14012185b:	48 8b 8c 24 98 02 00 	mov    0x298(%rsp),%rcx
   140121862:	00 
   140121863:	48 8b 84 24 a0 02 00 	mov    0x2a0(%rsp),%rax
   14012186a:	00 
   14012186b:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121872:	00 ff ff 
   140121875:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   14012187c:	00 f8 ff 
   14012187f:	49 89 c8             	mov    %rcx,%r8
   140121882:	49 21 d0             	and    %rdx,%r8
   140121885:	4d 39 c8             	cmp    %r9,%r8
   140121888:	0f 84 b8 46 00 00    	je     140125f46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66e6>
   14012188e:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140121895:	00 fd ff 
   140121898:	4d 39 d0             	cmp    %r10,%r8
   14012189b:	0f 84 54 77 00 00    	je     140128ff5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9795>
   1401218a1:	49 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%r8
   1401218a8:	00 fc ff 
   1401218ab:	4c 39 c1             	cmp    %r8,%rcx
   1401218ae:	0f 84 78 67 00 00    	je     14012802c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87cc>
   1401218b4:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   1401218bb:	ff f7 ff 
   1401218be:	49 39 c9             	cmp    %rcx,%r9
   1401218c1:	0f 83 65 67 00 00    	jae    14012802c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87cc>
   1401218c7:	4c 39 c0             	cmp    %r8,%rax
   1401218ca:	0f 84 5c 67 00 00    	je     14012802c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87cc>
   1401218d0:	49 39 c1             	cmp    %rax,%r9
   1401218d3:	0f 83 53 67 00 00    	jae    14012802c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87cc>
   1401218d9:	48 21 c2             	and    %rax,%rdx
   1401218dc:	4c 39 d2             	cmp    %r10,%rdx
   1401218df:	0f 84 ce 9d 00 00    	je     14012b6b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe53>
   1401218e5:	48 8d 8c 24 98 02 00 	lea    0x298(%rsp),%rcx
   1401218ec:	00 
   1401218ed:	c5 f8 77             	vzeroupper
   1401218f0:	e8 1b 14 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401218f5:	48 8d 8c 24 a0 02 00 	lea    0x2a0(%rsp),%rcx
   1401218fc:	00 
   1401218fd:	48 89 c7             	mov    %rax,%rdi
   140121900:	e8 0b 14 0f 00       	call   140212d10 <setun::VMValue::as_int() const>
   140121905:	48 39 c7             	cmp    %rax,%rdi
   140121908:	0f 9d c0             	setge  %al
   14012190b:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140121912:	00 fa ff 
   140121915:	0f b6 c0             	movzbl %al,%eax
   140121918:	48 01 d0             	add    %rdx,%rax
   14012191b:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140121922:	00 
   140121923:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012192a:	0f 84 b0 3f 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140121930:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140121934:	48 8d 3d 65 67 29 00 	lea    0x296765(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012193b:	48 83 c5 01          	add    $0x1,%rbp
   14012193f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121943:	ff e0                	jmp    *%rax
   140121945:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140121949:	66 85 ff             	test   %di,%di
   14012194c:	0f 88 20 97 00 00    	js     14012b072 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb812>
   140121952:	0f bf c7             	movswl %di,%eax
   140121955:	83 c0 02             	add    $0x2,%eax
   140121958:	48 98                	cltq
   14012195a:	48 01 e8             	add    %rbp,%rax
   14012195d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121964:	0f 84 b2 93 00 00    	je     14012ad1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4bc>
   14012196a:	48 8d 68 01          	lea    0x1(%rax),%rbp
   14012196e:	0f b6 00             	movzbl (%rax),%eax
   140121971:	48 8d 3d 28 67 29 00 	lea    0x296728(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121978:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012197b:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   14012197f:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   140121983:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   140121988:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012198f:	00 fb ff 
   140121992:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   140121999:	00 
   14012199a:	41 80 fc 01          	cmp    $0x1,%r12b
   14012199e:	0f 85 74 99 00 00    	jne    14012b318 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbab8>
   1401219a4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401219ab:	00 
   1401219ac:	45 31 e4             	xor    %r12d,%r12d
   1401219af:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   1401219b6:	00 
   1401219b7:	48 8d 8c 24 a8 02 00 	lea    0x2a8(%rsp),%rcx
   1401219be:	00 
   1401219bf:	c5 f8 77             	vzeroupper
   1401219c2:	e8 d9 19 0f 00       	call   1402133a0 <setun::VMValue::as_bool() const>
   1401219c7:	89 c1                	mov    %eax,%ecx
   1401219c9:	48 0f bf 44 24 60    	movswq 0x60(%rsp),%rax
   1401219cf:	48 01 f8             	add    %rdi,%rax
   1401219d2:	84 c9                	test   %cl,%cl
   1401219d4:	48 0f 44 f8          	cmove  %rax,%rdi
   1401219d8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401219df:	0f 84 c1 79 00 00    	je     1401293a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b46>
   1401219e5:	0f b6 07             	movzbl (%rdi),%eax
   1401219e8:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
   1401219ec:	48 8d 3d ad 66 29 00 	lea    0x2966ad(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401219f3:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   1401219f6:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   1401219fa:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401219fe:	48 83 c5 06          	add    $0x6,%rbp
   140121a02:	66 89 84 24 80 00 00 	mov    %ax,0x80(%rsp)
   140121a09:	00 
   140121a0a:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   140121a0e:	66 89 44 24 60       	mov    %ax,0x60(%rsp)
   140121a13:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121a1a:	00 fb ff 
   140121a1d:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   140121a24:	00 
   140121a25:	41 80 fc 01          	cmp    $0x1,%r12b
   140121a29:	0f 85 2b 90 00 00    	jne    14012aa5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1fa>
   140121a2f:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140121a36:	00 
   140121a37:	45 31 e4             	xor    %r12d,%r12d
   140121a3a:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   140121a41:	00 
   140121a42:	48 8b 84 24 b0 02 00 	mov    0x2b0(%rsp),%rax
   140121a49:	00 
   140121a4a:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140121a51:	00 ff ff 
   140121a54:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140121a5b:	00 fd ff 
   140121a5e:	48 21 c2             	and    %rax,%rdx
   140121a61:	48 39 ca             	cmp    %rcx,%rdx
   140121a64:	0f 84 c6 47 00 00    	je     140126230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d0>
   140121a6a:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140121a71:	00 fc ff 
   140121a74:	48 39 d0             	cmp    %rdx,%rax
   140121a77:	74 13                	je     140121a8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x222c>
   140121a79:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140121a80:	ff f7 ff 
   140121a83:	48 39 c2             	cmp    %rax,%rdx
   140121a86:	0f 82 b2 47 00 00    	jb     14012623e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69de>
   140121a8c:	48 8d 8c 24 b0 02 00 	lea    0x2b0(%rsp),%rcx
   140121a93:	00 
   140121a94:	c5 f8 77             	vzeroupper
   140121a97:	e8 34 2a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140121a9c:	c5 fb 10 0d 9c 2f 23 	vmovsd 0x232f9c(%rip),%xmm1        # 140354a40 <CSWTCH.2806+0x200>
   140121aa3:	00 
   140121aa4:	c5 f9 2f c8          	vcomisd %xmm0,%xmm1
   140121aa8:	0f 87 4d 5f 00 00    	ja     1401279fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x819b>
   140121aae:	c5 f9 2f 05 92 2f 23 	vcomisd 0x232f92(%rip),%xmm0        # 140354a48 <CSWTCH.2806+0x208>
   140121ab5:	00 
   140121ab6:	0f 87 a1 47 00 00    	ja     14012625d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69fd>
   140121abc:	48 0f bf 84 24 80 00 	movswq 0x80(%rsp),%rax
   140121ac3:	00 00 
   140121ac5:	48 8d 44 05 fe       	lea    -0x2(%rbp,%rax,1),%rax
   140121aca:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121ad1:	0f 84 8a 93 00 00    	je     14012ae61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb601>
   140121ad7:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140121adb:	0f b6 00             	movzbl (%rax),%eax
   140121ade:	48 8d 3d bb 65 29 00 	lea    0x2965bb(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121ae5:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140121ae8:	49 8b 96 88 00 00 00 	mov    0x88(%r14),%rdx
   140121aef:	49 8b 8e 80 00 00 00 	mov    0x80(%r14),%rcx
   140121af6:	48 8d 7d 02          	lea    0x2(%rbp),%rdi
   140121afa:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140121afe:	48 39 d1             	cmp    %rdx,%rcx
   140121b01:	0f 84 53 5d 00 00    	je     14012785a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ffa>
   140121b07:	48 29 ca             	sub    %rcx,%rdx
   140121b0a:	48 c1 fa 02          	sar    $0x2,%rdx
   140121b0e:	48 39 d0             	cmp    %rdx,%rax
   140121b11:	0f 83 6b a4 00 00    	jae    14012bf82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc722>
   140121b17:	8b 3c 81             	mov    (%rcx,%rax,4),%edi
   140121b1a:	89 bc 24 a0 00 00 00 	mov    %edi,0xa0(%rsp)
   140121b21:	49 8b 8e 98 00 00 00 	mov    0x98(%r14),%rcx
   140121b28:	49 8b 96 a0 00 00 00 	mov    0xa0(%r14),%rdx
   140121b2f:	48 8d 7d 03          	lea    0x3(%rbp),%rdi
   140121b33:	41 b8 20 00 00 00    	mov    $0x20,%r8d
   140121b39:	44 0f b6 55 02       	movzbl 0x2(%rbp),%r10d
   140121b3e:	48 89 bc 24 80 00 00 	mov    %rdi,0x80(%rsp)
   140121b45:	00 
   140121b46:	48 29 ca             	sub    %rcx,%rdx
   140121b49:	48 d1 fa             	sar    $1,%rdx
   140121b4c:	4c 89 d7             	mov    %r10,%rdi
   140121b4f:	48 39 d0             	cmp    %rdx,%rax
   140121b52:	73 0b                	jae    140121b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22ff>
   140121b54:	0f b7 0c 41          	movzwl (%rcx,%rax,2),%ecx
   140121b58:	66 85 c9             	test   %cx,%cx
   140121b5b:	4c 0f 45 c1          	cmovne %rcx,%r8
   140121b5f:	49 8d 52 08          	lea    0x8(%r10),%rdx
   140121b63:	4c 89 c1             	mov    %r8,%rcx
   140121b66:	4c 39 c2             	cmp    %r8,%rdx
   140121b69:	48 0f 43 ca          	cmovae %rdx,%rcx
   140121b6d:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   140121b72:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140121b79:	0f 84 7a 61 00 00    	je     140127cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8499>
   140121b7f:	48 8b 93 d8 52 01 00 	mov    0x152d8(%rbx),%rdx
   140121b86:	48 85 d2             	test   %rdx,%rdx
   140121b89:	0f 84 6a 61 00 00    	je     140127cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8499>
   140121b8f:	48 23 83 f8 52 01 00 	and    0x152f8(%rbx),%rax
   140121b96:	48 c1 e0 05          	shl    $0x5,%rax
   140121b9a:	48 01 d0             	add    %rdx,%rax
   140121b9d:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   140121ba4:	00 
   140121ba5:	48 83 38 00          	cmpq   $0x0,(%rax)
   140121ba9:	0f 84 49 60 00 00    	je     140127bf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8398>
   140121baf:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140121bb6:	0f 84 01 7f 00 00    	je     140129abd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa25d>
   140121bbc:	48 8b 83 68 52 01 00 	mov    0x15268(%rbx),%rax
   140121bc3:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140121bca:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140121bd1:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   140121bd8:	00 
   140121bd9:	48 01 c8             	add    %rcx,%rax
   140121bdc:	48 c1 fa 03          	sar    $0x3,%rdx
   140121be0:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140121be7:	48 83 c0 40          	add    $0x40,%rax
   140121beb:	48 39 d0             	cmp    %rdx,%rax
   140121bee:	0f 83 5d dd 00 00    	jae    14012f951 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100f1>
   140121bf4:	c5 f8 77             	vzeroupper
   140121bf7:	40 84 ff             	test   %dil,%dil
   140121bfa:	0f 84 85 a1 00 00    	je     14012bd85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc525>
   140121c00:	44 0f b6 c7          	movzbl %dil,%r8d
   140121c04:	4c 8b 9c 24 c0 00 00 	mov    0xc0(%rsp),%r11
   140121c0b:	00 
   140121c0c:	49 8d 52 fe          	lea    -0x2(%r10),%rdx
   140121c10:	41 83 e8 01          	sub    $0x1,%r8d
   140121c14:	4c 29 c2             	sub    %r8,%rdx
   140121c17:	4b 8d 4c 1a ff       	lea    -0x1(%r10,%r11,1),%rcx
   140121c1c:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   140121c23:	4c 01 da             	add    %r11,%rdx
   140121c26:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   140121c2d:	00 
   140121c2e:	48 c1 e2 03          	shl    $0x3,%rdx
   140121c32:	41 80 fc 01          	cmp    $0x1,%r12b
   140121c36:	74 2c                	je     140121c64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2404>
   140121c38:	41 80 fc 02          	cmp    $0x2,%r12b
   140121c3c:	75 3b                	jne    140121c79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2419>
   140121c3e:	4c 8b 8c 24 80 01 00 	mov    0x180(%rsp),%r9
   140121c45:	00 
   140121c46:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
   140121c4b:	48 83 e8 08          	sub    $0x8,%rax
   140121c4f:	4d 89 0c c8          	mov    %r9,(%r8,%rcx,8)
   140121c53:	48 89 bc 24 80 01 00 	mov    %rdi,0x180(%rsp)
   140121c5a:	00 
   140121c5b:	48 39 d0             	cmp    %rdx,%rax
   140121c5e:	0f 84 41 a9 00 00    	je     14012c5a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd45>
   140121c64:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
   140121c6b:	00 
   140121c6c:	49 89 0c 00          	mov    %rcx,(%r8,%rax,1)
   140121c70:	48 83 e8 08          	sub    $0x8,%rax
   140121c74:	48 39 d0             	cmp    %rdx,%rax
   140121c77:	74 18                	je     140121c91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2431>
   140121c79:	48 89 f1             	mov    %rsi,%rcx
   140121c7c:	48 83 ee 08          	sub    $0x8,%rsi
   140121c80:	48 8b 49 f8          	mov    -0x8(%rcx),%rcx
   140121c84:	49 89 0c 00          	mov    %rcx,(%r8,%rax,1)
   140121c88:	48 83 e8 08          	sub    $0x8,%rax
   140121c8c:	48 39 d0             	cmp    %rdx,%rax
   140121c8f:	75 e8                	jne    140121c79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2419>
   140121c91:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121c98:	4c 8d a4 24 20 07 00 	lea    0x720(%rsp),%r12
   140121c9f:	00 
   140121ca0:	31 c0                	xor    %eax,%eax
   140121ca2:	b9 23 00 00 00       	mov    $0x23,%ecx
   140121ca7:	4c 89 e7             	mov    %r12,%rdi
   140121caa:	f3 48 ab             	rep stos %rax,(%rdi)
   140121cad:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   140121cb4:	00 
   140121cb5:	48 89 94 24 40 07 00 	mov    %rdx,0x740(%rsp)
   140121cbc:	00 
   140121cbd:	c6 84 24 28 08 00 00 	movb   $0x1,0x828(%rsp)
   140121cc4:	01 
   140121cc5:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   140121cc9:	48 89 9c 24 20 07 00 	mov    %rbx,0x720(%rsp)
   140121cd0:	00 
   140121cd1:	48 89 84 24 30 07 00 	mov    %rax,0x730(%rsp)
   140121cd8:	00 
   140121cd9:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   140121cde:	48 89 84 24 38 07 00 	mov    %rax,0x738(%rsp)
   140121ce5:	00 
   140121ce6:	48 89 f0             	mov    %rsi,%rax
   140121ce9:	48 29 d0             	sub    %rdx,%rax
   140121cec:	48 8b 93 c0 50 01 00 	mov    0x150c0(%rbx),%rdx
   140121cf3:	48 c1 f8 03          	sar    $0x3,%rax
   140121cf7:	48 89 84 24 48 07 00 	mov    %rax,0x748(%rsp)
   140121cfe:	00 
   140121cff:	31 c0                	xor    %eax,%eax
   140121d01:	48 85 d2             	test   %rdx,%rdx
   140121d04:	74 0c                	je     140121d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24b2>
   140121d06:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
   140121d0a:	48 8d 84 c3 98 10 00 	lea    0x1098(%rbx,%rax,8),%rax
   140121d11:	00 
   140121d12:	c4 e1 f9 6e f8       	vmovq  %rax,%xmm7
   140121d17:	c4 e3 c1 22 83 b8 52 	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140121d1e:	01 00 01 
   140121d21:	4c 89 a3 b8 52 01 00 	mov    %r12,0x152b8(%rbx)
   140121d28:	c5 f9 7f 84 24 50 07 	vmovdqa %xmm0,0x750(%rsp)
   140121d2f:	00 00 
   140121d31:	e8 6a 94 0e 00       	call   14020b1a0 <tersun::VMTelemetryManager::instance()>
   140121d36:	80 38 00             	cmpb   $0x0,(%rax)
   140121d39:	74 05                	je     140121d40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24e0>
   140121d3b:	48 83 40 28 01       	addq   $0x1,0x28(%rax)
   140121d40:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   140121d47:	00 
   140121d48:	4c 89 e2             	mov    %r12,%rdx
   140121d4b:	48 89 d9             	mov    %rbx,%rcx
   140121d4e:	ff 10                	call   *(%rax)
   140121d50:	48 8b 94 24 58 07 00 	mov    0x758(%rsp),%rdx
   140121d57:	00 
   140121d58:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   140121d5f:	48 83 bc 24 68 07 00 	cmpq   $0x0,0x768(%rsp)
   140121d66:	00 00 
   140121d68:	0f 8f 15 dd 00 00    	jg     14012fa83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10223>
   140121d6e:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140121d75:	00 
   140121d76:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140121d7d:	0f 84 7b a5 00 00    	je     14012c2fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca9e>
   140121d83:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
   140121d8a:	00 
   140121d8b:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140121d92:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121d99:	0f 84 fb 3a 00 00    	je     14012589a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x603a>
   140121d9f:	0f b6 45 03          	movzbl 0x3(%rbp),%eax
   140121da3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121da9:	48 83 c5 04          	add    $0x4,%rbp
   140121dad:	48 8d 3d ec 62 29 00 	lea    0x2962ec(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121db4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121db8:	ff e0                	jmp    *%rax
   140121dba:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   140121dc1:	48 85 c0             	test   %rax,%rax
   140121dc4:	0f 84 c7 e5 ff ff    	je     140120391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb31>
   140121dca:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
   140121dce:	48 83 e8 01          	sub    $0x1,%rax
   140121dd2:	48 8d 14 d3          	lea    (%rbx,%rdx,8),%rdx
   140121dd6:	48 8b ba 98 10 00 00 	mov    0x1098(%rdx),%rdi
   140121ddd:	48 8b 8a a0 10 00 00 	mov    0x10a0(%rdx),%rcx
   140121de4:	48 8b aa a8 10 00 00 	mov    0x10a8(%rdx),%rbp
   140121deb:	48 89 83 c0 50 01 00 	mov    %rax,0x150c0(%rbx)
   140121df2:	45 84 e4             	test   %r12b,%r12b
   140121df5:	0f 84 18 3d 00 00    	je     140125b13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62b3>
   140121dfb:	4c 8b a4 24 80 01 00 	mov    0x180(%rsp),%r12
   140121e02:	00 
   140121e03:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140121e0a:	0f 84 22 68 00 00    	je     140128632 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dd2>
   140121e10:	48 89 8b 68 52 01 00 	mov    %rcx,0x15268(%rbx)
   140121e17:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121e1e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121e25:	4c 89 a4 24 80 01 00 	mov    %r12,0x180(%rsp)
   140121e2c:	00 
   140121e2d:	48 8d 34 ea          	lea    (%rdx,%rbp,8),%rsi
   140121e31:	4d 85 ed             	test   %r13,%r13
   140121e34:	74 0d                	je     140121e43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25e3>
   140121e36:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140121e3b:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140121e42:	00 
   140121e43:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   140121e47:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121e4e:	0f 84 b5 86 00 00    	je     14012a509 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaca9>
   140121e54:	48 8d 68 01          	lea    0x1(%rax),%rbp
   140121e58:	0f b6 00             	movzbl (%rax),%eax
   140121e5b:	48 8d 3d 3e 62 29 00 	lea    0x29623e(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121e62:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140121e68:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121e6c:	ff e0                	jmp    *%rax
   140121e6e:	41 80 fc 02          	cmp    $0x2,%r12b
   140121e72:	0f 84 40 43 00 00    	je     1401261b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6958>
   140121e78:	41 80 fc 01          	cmp    $0x1,%r12b
   140121e7c:	0f 84 44 6d 00 00    	je     140128bc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9366>
   140121e82:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121e89:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121e90:	c5 f8 77             	vzeroupper
   140121e93:	48 29 d6             	sub    %rdx,%rsi
   140121e96:	4c 29 fd             	sub    %r15,%rbp
   140121e99:	48 29 d0             	sub    %rdx,%rax
   140121e9c:	48 89 f7             	mov    %rsi,%rdi
   140121e9f:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121ea6:	48 c1 ff 03          	sar    $0x3,%rdi
   140121eaa:	48 39 f0             	cmp    %rsi,%rax
   140121ead:	0f 82 a9 66 00 00    	jb     14012855c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cfc>
   140121eb3:	c5 f9 6f 05 45 2b 23 	vmovdqa 0x232b45(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140121eba:	00 
   140121ebb:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121ec2:	4c 89 f2             	mov    %r14,%rdx
   140121ec5:	48 89 d9             	mov    %rbx,%rcx
   140121ec8:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121ecf:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121ed6:	00 
   140121ed7:	e8 84 48 fe ff       	call   140106760 <setun::VM::handle_push_string(setun::Chunk const&)>
   140121edc:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121ee3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121eea:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140121ef1:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121ef8:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121efc:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121f03:	4c 01 f9             	add    %r15,%rcx
   140121f06:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121f0b:	4d 85 ed             	test   %r13,%r13
   140121f0e:	74 0d                	je     140121f1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26bd>
   140121f10:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140121f15:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140121f1c:	00 
   140121f1d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121f24:	0f 84 c6 5c 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140121f2a:	0f b6 01             	movzbl (%rcx),%eax
   140121f2d:	48 8d 3d 6c 61 29 00 	lea    0x29616c(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121f34:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140121f38:	45 31 e4             	xor    %r12d,%r12d
   140121f3b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121f3f:	ff e0                	jmp    *%rax
   140121f41:	41 80 fc 02          	cmp    $0x2,%r12b
   140121f45:	0f 84 15 3d 00 00    	je     140125c60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6400>
   140121f4b:	41 80 fc 01          	cmp    $0x1,%r12b
   140121f4f:	0f 84 07 70 00 00    	je     140128f5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fc>
   140121f55:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121f5c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121f63:	c5 f8 77             	vzeroupper
   140121f66:	48 29 d6             	sub    %rdx,%rsi
   140121f69:	4c 29 fd             	sub    %r15,%rbp
   140121f6c:	48 29 d0             	sub    %rdx,%rax
   140121f6f:	48 89 f7             	mov    %rsi,%rdi
   140121f72:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140121f79:	48 c1 ff 03          	sar    $0x3,%rdi
   140121f7d:	48 39 f0             	cmp    %rsi,%rax
   140121f80:	0f 82 04 65 00 00    	jb     14012848a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2a>
   140121f86:	c5 f9 6f 05 72 2a 23 	vmovdqa 0x232a72(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140121f8d:	00 
   140121f8e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140121f95:	4c 89 f2             	mov    %r14,%rdx
   140121f98:	48 89 d9             	mov    %rbx,%rcx
   140121f9b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140121fa2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140121fa9:	00 
   140121faa:	e8 21 4e fe ff       	call   140106dd0 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140121faf:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121fb6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140121fbd:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140121fc4:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121fcb:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140121fcf:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121fd6:	4c 01 f9             	add    %r15,%rcx
   140121fd9:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121fde:	4d 85 ed             	test   %r13,%r13
   140121fe1:	74 0d                	je     140121ff0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2790>
   140121fe3:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140121fe8:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140121fef:	00 
   140121ff0:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140121ff7:	0f 84 f3 5b 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140121ffd:	0f b6 01             	movzbl (%rcx),%eax
   140122000:	48 8d 3d 99 60 29 00 	lea    0x296099(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122007:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012200b:	45 31 e4             	xor    %r12d,%r12d
   14012200e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122012:	ff e0                	jmp    *%rax
   140122014:	41 80 fc 02          	cmp    $0x2,%r12b
   140122018:	0f 84 b3 3e 00 00    	je     140125ed1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6671>
   14012201e:	41 80 fc 01          	cmp    $0x1,%r12b
   140122022:	0f 84 a0 69 00 00    	je     1401289c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9168>
   140122028:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012202f:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122036:	c5 f8 77             	vzeroupper
   140122039:	48 29 d6             	sub    %rdx,%rsi
   14012203c:	4c 29 fd             	sub    %r15,%rbp
   14012203f:	48 29 d0             	sub    %rdx,%rax
   140122042:	48 89 f7             	mov    %rsi,%rdi
   140122045:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012204c:	48 c1 ff 03          	sar    $0x3,%rdi
   140122050:	48 39 f0             	cmp    %rsi,%rax
   140122053:	0f 82 c4 64 00 00    	jb     14012851d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cbd>
   140122059:	c5 f9 6f 05 9f 29 23 	vmovdqa 0x23299f(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140122060:	00 
   140122061:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122068:	4c 89 f2             	mov    %r14,%rdx
   14012206b:	48 89 d9             	mov    %rbx,%rcx
   14012206e:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122075:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012207c:	00 
   14012207d:	e8 6e 93 fe ff       	call   14010b3f0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140122082:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122089:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122090:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140122097:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012209e:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401220a2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401220a9:	4c 01 f9             	add    %r15,%rcx
   1401220ac:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401220b1:	4d 85 ed             	test   %r13,%r13
   1401220b4:	74 0d                	je     1401220c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2863>
   1401220b6:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401220bb:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401220c2:	00 
   1401220c3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401220ca:	0f 84 20 5b 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401220d0:	0f b6 01             	movzbl (%rcx),%eax
   1401220d3:	48 8d 3d c6 5f 29 00 	lea    0x295fc6(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401220da:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401220de:	45 31 e4             	xor    %r12d,%r12d
   1401220e1:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401220e5:	ff e0                	jmp    *%rax
   1401220e7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401220eb:	0f 84 a4 3d 00 00    	je     140125e95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6635>
   1401220f1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401220f5:	0f 84 98 6a 00 00    	je     140128b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9333>
   1401220fb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122102:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122109:	c5 f8 77             	vzeroupper
   14012210c:	48 29 d6             	sub    %rdx,%rsi
   14012210f:	4c 29 fd             	sub    %r15,%rbp
   140122112:	48 29 d0             	sub    %rdx,%rax
   140122115:	48 89 f7             	mov    %rsi,%rdi
   140122118:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012211f:	48 c1 ff 03          	sar    $0x3,%rdi
   140122123:	48 39 f0             	cmp    %rsi,%rax
   140122126:	0f 82 27 62 00 00    	jb     140128353 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8af3>
   14012212c:	c5 f9 6f 05 cc 28 23 	vmovdqa 0x2328cc(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140122133:	00 
   140122134:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012213b:	4c 89 f2             	mov    %r14,%rdx
   14012213e:	48 89 d9             	mov    %rbx,%rcx
   140122141:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122148:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012214f:	00 
   140122150:	e8 eb 17 fe ff       	call   140103940 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140122155:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012215c:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122163:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012216a:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122171:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122175:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012217c:	4c 01 f9             	add    %r15,%rcx
   14012217f:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122184:	4d 85 ed             	test   %r13,%r13
   140122187:	74 0d                	je     140122196 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2936>
   140122189:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012218e:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140122195:	00 
   140122196:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012219d:	0f 84 4d 5a 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401221a3:	0f b6 01             	movzbl (%rcx),%eax
   1401221a6:	48 8d 3d f3 5e 29 00 	lea    0x295ef3(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401221ad:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401221b1:	45 31 e4             	xor    %r12d,%r12d
   1401221b4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401221b8:	ff e0                	jmp    *%rax
   1401221ba:	41 80 fc 02          	cmp    $0x2,%r12b
   1401221be:	0f 84 72 48 00 00    	je     140126a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d6>
   1401221c4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401221c8:	0f 84 94 67 00 00    	je     140128962 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9102>
   1401221ce:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401221d5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401221dc:	c5 f8 77             	vzeroupper
   1401221df:	48 29 d6             	sub    %rdx,%rsi
   1401221e2:	4c 29 fd             	sub    %r15,%rbp
   1401221e5:	48 29 d0             	sub    %rdx,%rax
   1401221e8:	48 89 f7             	mov    %rsi,%rdi
   1401221eb:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401221f2:	48 c1 ff 03          	sar    $0x3,%rdi
   1401221f6:	48 39 f0             	cmp    %rsi,%rax
   1401221f9:	0f 82 3f 61 00 00    	jb     14012833e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ade>
   1401221ff:	c5 f9 6f 05 f9 27 23 	vmovdqa 0x2327f9(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140122206:	00 
   140122207:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012220e:	4c 89 f2             	mov    %r14,%rdx
   140122211:	48 89 d9             	mov    %rbx,%rcx
   140122214:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012221b:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122222:	00 
   140122223:	e8 b8 fc fd ff       	call   140101ee0 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   140122228:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012222f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122236:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012223d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122244:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122248:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012224f:	4c 01 f9             	add    %r15,%rcx
   140122252:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122257:	4d 85 ed             	test   %r13,%r13
   14012225a:	74 0d                	je     140122269 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a09>
   14012225c:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122261:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140122268:	00 
   140122269:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122270:	0f 84 7a 59 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140122276:	0f b6 01             	movzbl (%rcx),%eax
   140122279:	48 8d 3d 20 5e 29 00 	lea    0x295e20(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122280:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140122284:	45 31 e4             	xor    %r12d,%r12d
   140122287:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012228b:	ff e0                	jmp    *%rax
   14012228d:	41 80 fc 02          	cmp    $0x2,%r12b
   140122291:	0f 84 e7 4a 00 00    	je     140126d7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x751e>
   140122297:	41 80 fc 01          	cmp    $0x1,%r12b
   14012229b:	0f 84 f5 65 00 00    	je     140128896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9036>
   1401222a1:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401222a8:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401222af:	c5 f8 77             	vzeroupper
   1401222b2:	48 29 d6             	sub    %rdx,%rsi
   1401222b5:	4c 29 fd             	sub    %r15,%rbp
   1401222b8:	48 29 d0             	sub    %rdx,%rax
   1401222bb:	48 89 f7             	mov    %rsi,%rdi
   1401222be:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401222c5:	48 c1 ff 03          	sar    $0x3,%rdi
   1401222c9:	48 39 f0             	cmp    %rsi,%rax
   1401222cc:	0f 82 9f 62 00 00    	jb     140128571 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d11>
   1401222d2:	c5 f9 6f 05 26 27 23 	vmovdqa 0x232726(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401222d9:	00 
   1401222da:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401222e1:	4c 89 f2             	mov    %r14,%rdx
   1401222e4:	48 89 d9             	mov    %rbx,%rcx
   1401222e7:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401222ee:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401222f5:	00 
   1401222f6:	e8 05 0d fe ff       	call   140103000 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   1401222fb:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122302:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122309:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140122310:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122317:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012231b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122322:	4c 01 f9             	add    %r15,%rcx
   140122325:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012232a:	4d 85 ed             	test   %r13,%r13
   14012232d:	74 0d                	je     14012233c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2adc>
   14012232f:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122334:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012233b:	00 
   14012233c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122343:	0f 84 a7 58 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140122349:	0f b6 01             	movzbl (%rcx),%eax
   14012234c:	48 8d 3d 4d 5d 29 00 	lea    0x295d4d(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122353:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140122357:	45 31 e4             	xor    %r12d,%r12d
   14012235a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012235e:	ff e0                	jmp    *%rax
   140122360:	41 80 fc 02          	cmp    $0x2,%r12b
   140122364:	0f 84 8a 3e 00 00    	je     1401261f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6994>
   14012236a:	41 80 fc 01          	cmp    $0x1,%r12b
   14012236e:	0f 84 51 69 00 00    	je     140128cc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9465>
   140122374:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012237b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122382:	c5 f8 77             	vzeroupper
   140122385:	48 29 d6             	sub    %rdx,%rsi
   140122388:	4c 29 fd             	sub    %r15,%rbp
   14012238b:	48 29 d0             	sub    %rdx,%rax
   14012238e:	48 89 f7             	mov    %rsi,%rdi
   140122391:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122398:	48 c1 ff 03          	sar    $0x3,%rdi
   14012239c:	48 39 f0             	cmp    %rsi,%rax
   14012239f:	0f 82 c3 5f 00 00    	jb     140128368 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b08>
   1401223a5:	c5 f9 6f 05 53 26 23 	vmovdqa 0x232653(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401223ac:	00 
   1401223ad:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401223b4:	4c 89 f2             	mov    %r14,%rdx
   1401223b7:	48 89 d9             	mov    %rbx,%rcx
   1401223ba:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401223c1:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401223c8:	00 
   1401223c9:	e8 d2 7f fe ff       	call   14010a3a0 <setun::VM::handle_print(setun::Chunk const&)>
   1401223ce:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401223d5:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401223dc:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401223e3:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401223ea:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401223ee:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401223f5:	4c 01 f9             	add    %r15,%rcx
   1401223f8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401223fd:	4d 85 ed             	test   %r13,%r13
   140122400:	74 0d                	je     14012240f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2baf>
   140122402:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122407:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012240e:	00 
   14012240f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122416:	0f 84 d4 57 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012241c:	0f b6 01             	movzbl (%rcx),%eax
   14012241f:	48 8d 3d 7a 5c 29 00 	lea    0x295c7a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122426:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012242a:	45 31 e4             	xor    %r12d,%r12d
   14012242d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122431:	ff e0                	jmp    *%rax
   140122433:	41 80 fc 02          	cmp    $0x2,%r12b
   140122437:	0f 84 d9 47 00 00    	je     140126c16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73b6>
   14012243d:	41 80 fc 01          	cmp    $0x1,%r12b
   140122441:	0f 84 7c 6a 00 00    	je     140128ec3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9663>
   140122447:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012244e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122455:	c5 f8 77             	vzeroupper
   140122458:	48 29 d6             	sub    %rdx,%rsi
   14012245b:	4c 29 fd             	sub    %r15,%rbp
   14012245e:	48 29 d0             	sub    %rdx,%rax
   140122461:	48 89 f7             	mov    %rsi,%rdi
   140122464:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012246b:	48 c1 ff 03          	sar    $0x3,%rdi
   14012246f:	48 39 f0             	cmp    %rsi,%rax
   140122472:	0f 82 ba 60 00 00    	jb     140128532 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cd2>
   140122478:	c5 f9 6f 05 80 25 23 	vmovdqa 0x232580(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   14012247f:	00 
   140122480:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122487:	4c 89 f2             	mov    %r14,%rdx
   14012248a:	48 89 d9             	mov    %rbx,%rcx
   14012248d:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122494:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012249b:	00 
   14012249c:	e8 5f 83 fe ff       	call   14010a800 <setun::VM::handle_println(setun::Chunk const&)>
   1401224a1:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401224a8:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401224af:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401224b6:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401224bd:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401224c1:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401224c8:	4c 01 f9             	add    %r15,%rcx
   1401224cb:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401224d0:	4d 85 ed             	test   %r13,%r13
   1401224d3:	74 0d                	je     1401224e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c82>
   1401224d5:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401224da:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401224e1:	00 
   1401224e2:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401224e9:	0f 84 01 57 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401224ef:	0f b6 01             	movzbl (%rcx),%eax
   1401224f2:	48 8d 3d a7 5b 29 00 	lea    0x295ba7(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401224f9:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401224fd:	45 31 e4             	xor    %r12d,%r12d
   140122500:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122504:	ff e0                	jmp    *%rax
   140122506:	41 80 fc 02          	cmp    $0x2,%r12b
   14012250a:	0f 84 15 3b 00 00    	je     140126025 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67c5>
   140122510:	41 80 fc 01          	cmp    $0x1,%r12b
   140122514:	0f 84 e1 64 00 00    	je     1401289fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x919b>
   14012251a:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122521:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122528:	c5 f8 77             	vzeroupper
   14012252b:	48 29 d6             	sub    %rdx,%rsi
   14012252e:	4c 29 fd             	sub    %r15,%rbp
   140122531:	48 29 d0             	sub    %rdx,%rax
   140122534:	48 89 f7             	mov    %rsi,%rdi
   140122537:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012253e:	48 c1 ff 03          	sar    $0x3,%rdi
   140122542:	48 39 f0             	cmp    %rsi,%rax
   140122545:	0f 82 3b 60 00 00    	jb     140128586 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d26>
   14012254b:	c5 f9 6f 05 ad 24 23 	vmovdqa 0x2324ad(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140122552:	00 
   140122553:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012255a:	4c 89 f2             	mov    %r14,%rdx
   14012255d:	48 89 d9             	mov    %rbx,%rcx
   140122560:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122567:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012256e:	00 
   14012256f:	e8 3c 8a fe ff       	call   14010afb0 <setun::VM::handle_trace(setun::Chunk const&)>
   140122574:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012257b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122582:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140122589:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122590:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122594:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012259b:	4c 01 f9             	add    %r15,%rcx
   14012259e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401225a3:	4d 85 ed             	test   %r13,%r13
   1401225a6:	74 0d                	je     1401225b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d55>
   1401225a8:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401225ad:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401225b4:	00 
   1401225b5:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401225bc:	0f 84 2e 56 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401225c2:	0f b6 01             	movzbl (%rcx),%eax
   1401225c5:	48 8d 3d d4 5a 29 00 	lea    0x295ad4(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401225cc:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401225d0:	45 31 e4             	xor    %r12d,%r12d
   1401225d3:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401225d7:	ff e0                	jmp    *%rax
   1401225d9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401225dd:	0f 84 c1 3c 00 00    	je     1401262a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a44>
   1401225e3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401225e7:	0f 84 a4 67 00 00    	je     140128d91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9531>
   1401225ed:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401225f4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401225fb:	c5 f8 77             	vzeroupper
   1401225fe:	48 29 d6             	sub    %rdx,%rsi
   140122601:	4c 29 fd             	sub    %r15,%rbp
   140122604:	48 29 d0             	sub    %rdx,%rax
   140122607:	48 89 f7             	mov    %rsi,%rdi
   14012260a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140122611:	48 c1 ff 03          	sar    $0x3,%rdi
   140122615:	48 39 f0             	cmp    %rsi,%rax
   140122618:	0f 82 5f 5d 00 00    	jb     14012837d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b1d>
   14012261e:	c5 f9 6f 05 da 23 23 	vmovdqa 0x2323da(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140122625:	00 
   140122626:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012262d:	4c 89 f2             	mov    %r14,%rdx
   140122630:	48 89 d9             	mov    %rbx,%rcx
   140122633:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012263a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122641:	00 
   140122642:	e8 39 ba fe ff       	call   14010e080 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   140122647:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012264e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122655:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012265c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122663:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140122667:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012266e:	4c 01 f9             	add    %r15,%rcx
   140122671:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122676:	4d 85 ed             	test   %r13,%r13
   140122679:	74 0d                	je     140122688 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e28>
   14012267b:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122680:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140122687:	00 
   140122688:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012268f:	0f 84 5b 55 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140122695:	0f b6 01             	movzbl (%rcx),%eax
   140122698:	48 8d 3d 01 5a 29 00 	lea    0x295a01(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012269f:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401226a3:	45 31 e4             	xor    %r12d,%r12d
   1401226a6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401226aa:	ff e0                	jmp    *%rax
   1401226ac:	41 80 fc 02          	cmp    $0x2,%r12b
   1401226b0:	0f 84 04 47 00 00    	je     140126dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x755a>
   1401226b6:	41 80 fc 01          	cmp    $0x1,%r12b
   1401226ba:	0f 84 6b 66 00 00    	je     140128d2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94cb>
   1401226c0:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401226c7:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401226ce:	c5 f8 77             	vzeroupper
   1401226d1:	48 29 d6             	sub    %rdx,%rsi
   1401226d4:	4c 29 fd             	sub    %r15,%rbp
   1401226d7:	48 29 d0             	sub    %rdx,%rax
   1401226da:	48 89 f7             	mov    %rsi,%rdi
   1401226dd:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401226e4:	48 c1 ff 03          	sar    $0x3,%rdi
   1401226e8:	48 39 f0             	cmp    %rsi,%rax
   1401226eb:	0f 82 a1 5c 00 00    	jb     140128392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b32>
   1401226f1:	c5 f9 6f 05 07 23 23 	vmovdqa 0x232307(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401226f8:	00 
   1401226f9:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122700:	4c 89 f2             	mov    %r14,%rdx
   140122703:	48 89 d9             	mov    %rbx,%rcx
   140122706:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012270d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122714:	00 
   140122715:	e8 96 da fd ff       	call   1401001b0 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   14012271a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122721:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140122728:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012272f:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122736:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012273a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122741:	4c 01 f9             	add    %r15,%rcx
   140122744:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122749:	4d 85 ed             	test   %r13,%r13
   14012274c:	74 0d                	je     14012275b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2efb>
   14012274e:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122753:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012275a:	00 
   14012275b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122762:	0f 84 88 54 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140122768:	0f b6 01             	movzbl (%rcx),%eax
   14012276b:	48 8d 3d 2e 59 29 00 	lea    0x29592e(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122772:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140122776:	45 31 e4             	xor    %r12d,%r12d
   140122779:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012277d:	ff e0                	jmp    *%rax
   14012277f:	41 80 fc 02          	cmp    $0x2,%r12b
   140122783:	0f 84 51 44 00 00    	je     140126bda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x737a>
   140122789:	41 80 fc 01          	cmp    $0x1,%r12b
   14012278d:	0f 84 69 61 00 00    	je     1401288fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x909c>
   140122793:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012279a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401227a1:	c5 f8 77             	vzeroupper
   1401227a4:	48 29 d6             	sub    %rdx,%rsi
   1401227a7:	4c 29 fd             	sub    %r15,%rbp
   1401227aa:	48 29 d0             	sub    %rdx,%rax
   1401227ad:	48 89 f7             	mov    %rsi,%rdi
   1401227b0:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401227b7:	48 c1 ff 03          	sar    $0x3,%rdi
   1401227bb:	48 39 f0             	cmp    %rsi,%rax
   1401227be:	0f 82 01 5e 00 00    	jb     1401285c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d65>
   1401227c4:	c5 f9 6f 05 34 22 23 	vmovdqa 0x232234(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401227cb:	00 
   1401227cc:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401227d3:	4c 89 f2             	mov    %r14,%rdx
   1401227d6:	48 89 d9             	mov    %rbx,%rcx
   1401227d9:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401227e0:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401227e7:	00 
   1401227e8:	e8 73 bd fd ff       	call   1400fe560 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   1401227ed:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401227f4:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401227fb:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140122802:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122809:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012280d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122814:	4c 01 f9             	add    %r15,%rcx
   140122817:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012281c:	4d 85 ed             	test   %r13,%r13
   14012281f:	74 0d                	je     14012282e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fce>
   140122821:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140122826:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012282d:	00 
   14012282e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122835:	0f 84 b5 53 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012283b:	0f b6 01             	movzbl (%rcx),%eax
   14012283e:	48 8d 3d 5b 58 29 00 	lea    0x29585b(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122845:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140122849:	45 31 e4             	xor    %r12d,%r12d
   14012284c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122850:	ff e0                	jmp    *%rax
   140122852:	41 80 fc 02          	cmp    $0x2,%r12b
   140122856:	0f 84 b1 36 00 00    	je     140125f0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66ad>
   14012285c:	41 80 fc 01          	cmp    $0x1,%r12b
   140122860:	0f 85 a1 f9 00 00    	jne    140132207 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129a7>
   140122866:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012286d:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140122871:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140122876:	0f 83 c7 9a 00 00    	jae    14012c343 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcae3>
   14012287c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122883:	c5 f8 77             	vzeroupper
   140122886:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
   14012288d:	00 
   14012288e:	48 89 0e             	mov    %rcx,(%rsi)
   140122891:	49 29 d0             	sub    %rdx,%r8
   140122894:	4c 29 fd             	sub    %r15,%rbp
   140122897:	48 29 d0             	sub    %rdx,%rax
   14012289a:	4c 89 c6             	mov    %r8,%rsi
   14012289d:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401228a4:	48 c1 fe 03          	sar    $0x3,%rsi
   1401228a8:	4c 39 c0             	cmp    %r8,%rax
   1401228ab:	73 10                	jae    1401228bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x305d>
   1401228ad:	48 8d 14 36          	lea    (%rsi,%rsi,1),%rdx
   1401228b1:	48 8d 8b 48 10 00 00 	lea    0x1048(%rbx),%rcx
   1401228b8:	e8 23 ee 1b 00       	call   1402e16e0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401228bd:	c5 f9 6f 05 3b 21 23 	vmovdqa 0x23213b(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401228c4:	00 
   1401228c5:	48 89 b3 60 10 00 00 	mov    %rsi,0x1060(%rbx)
   1401228cc:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401228d3:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401228da:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401228e1:	00 
   1401228e2:	e8 17 46 21 00       	call   140336efe <setun::cold_throw_unknown_opcode(unsigned long long)>
   1401228e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   1401228ee:	00 00 
   1401228f0:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   1401228f4:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   1401228f8:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   1401228fd:	48 89 bc 24 c0 00 00 	mov    %rdi,0xc0(%rsp)
   140122904:	00 
   140122905:	44 0f b7 45 02       	movzwl 0x2(%rbp),%r8d
   14012290a:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   14012290e:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140122912:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122919:	0f 83 77 7f 00 00    	jae    14012a896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb036>
   14012291f:	c5 f8 77             	vzeroupper
   140122922:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140122929:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140122930:	48 c1 f9 03          	sar    $0x3,%rcx
   140122934:	48 39 cf             	cmp    %rcx,%rdi
   140122937:	0f 83 4b 7e 00 00    	jae    14012a788 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf28>
   14012293d:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122944:	41 0f b7 c9          	movzwl %r9w,%ecx
   140122948:	0f b7 c0             	movzwl %ax,%eax
   14012294b:	4c 01 e9             	add    %r13,%rcx
   14012294e:	4c 01 e8             	add    %r13,%rax
   140122951:	4c 8d 0c ca          	lea    (%rdx,%rcx,8),%r9
   140122955:	41 0f b7 c8          	movzwl %r8w,%ecx
   140122959:	4c 8d 1c c2          	lea    (%rdx,%rax,8),%r11
   14012295d:	4c 01 e9             	add    %r13,%rcx
   140122960:	49 8b 01             	mov    (%r9),%rax
   140122963:	4c 8d 14 ca          	lea    (%rdx,%rcx,8),%r10
   140122967:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   14012296e:	ff f7 ff 
   140122971:	48 39 c2             	cmp    %rax,%rdx
   140122974:	0f 83 df 00 00 00    	jae    140122a59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31f9>
   14012297a:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140122981:	00 fc ff 
   140122984:	48 39 d0             	cmp    %rdx,%rax
   140122987:	0f 84 cc 00 00 00    	je     140122a59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31f9>
   14012298d:	48 ba 00 00 00 00 ff 	movabs $0xffffffff00000000,%rdx
   140122994:	ff ff ff 
   140122997:	48 21 d0             	and    %rdx,%rax
   14012299a:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   1401229a1:	00 fd ff 
   1401229a4:	48 39 d0             	cmp    %rdx,%rax
   1401229a7:	0f 84 d2 91 00 00    	je     14012bb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31f>
   1401229ad:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401229b4:	ff ff ff 
   1401229b7:	49 8b 0a             	mov    (%r10),%rcx
   1401229ba:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   1401229c1:	00 fd ff 
   1401229c4:	48 21 c1             	and    %rax,%rcx
   1401229c7:	48 39 d1             	cmp    %rdx,%rcx
   1401229ca:	0f 84 af 91 00 00    	je     14012bb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31f>
   1401229d0:	49 23 03             	and    (%r11),%rax
   1401229d3:	48 39 d0             	cmp    %rdx,%rax
   1401229d6:	0f 84 a3 91 00 00    	je     14012bb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31f>
   1401229dc:	4c 89 d9             	mov    %r11,%rcx
   1401229df:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1401229e6:	00 
   1401229e7:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   1401229ec:	e8 df 1a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   1401229f1:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1401229f6:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
   1401229fa:	e8 d1 1a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   1401229ff:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140122a06:	00 
   140122a07:	c5 f9 28 f8          	vmovapd %xmm0,%xmm7
   140122a0b:	e8 c0 1a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122a10:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140122a17:	00 fc ff 
   140122a1a:	c4 e2 c9 99 c7       	vfmadd132sd %xmm7,%xmm6,%xmm0
   140122a1f:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140122a23:	c4 e1 f9 7e c2       	vmovq  %xmm0,%rdx
   140122a28:	48 0f 4b c2          	cmovnp %rdx,%rax
   140122a2c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122a33:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140122a37:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122a3e:	0f 84 51 57 00 00    	je     140128195 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8935>
   140122a44:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140122a48:	48 8d 3d 51 56 29 00 	lea    0x295651(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122a4f:	48 83 c5 09          	add    $0x9,%rbp
   140122a53:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122a57:	ff e0                	jmp    *%rax
   140122a59:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140122a60:	ff f7 ff 
   140122a63:	49 8b 02             	mov    (%r10),%rax
   140122a66:	48 39 c2             	cmp    %rax,%rdx
   140122a69:	73 13                	jae    140122a7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x321e>
   140122a6b:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140122a72:	00 fc ff 
   140122a75:	48 39 d0             	cmp    %rdx,%rax
   140122a78:	0f 85 2f ff ff ff    	jne    1401229ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x314d>
   140122a7e:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   140122a85:	ff f7 ff 
   140122a88:	49 8b 03             	mov    (%r11),%rax
   140122a8b:	48 39 c2             	cmp    %rax,%rdx
   140122a8e:	73 13                	jae    140122aa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3243>
   140122a90:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   140122a97:	00 fc ff 
   140122a9a:	48 39 d0             	cmp    %rdx,%rax
   140122a9d:	0f 85 0a ff ff ff    	jne    1401229ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x314d>
   140122aa3:	4c 89 d9             	mov    %r11,%rcx
   140122aa6:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   140122aad:	00 
   140122aae:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
   140122ab3:	e8 18 1a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122ab8:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140122abd:	c5 f9 28 f8          	vmovapd %xmm0,%xmm7
   140122ac1:	e8 0a 1a 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122ac6:	48 8b 8c 24 80 00 00 	mov    0x80(%rsp),%rcx
   140122acd:	00 
   140122ace:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
   140122ad2:	e8 f9 19 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122ad7:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122ade:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140122ae5:	00 fc ff 
   140122ae8:	c4 e2 c1 99 c6       	vfmadd132sd %xmm6,%xmm7,%xmm0
   140122aed:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140122af1:	c4 e1 f9 7e c1       	vmovq  %xmm0,%rcx
   140122af6:	48 0f 4b c1          	cmovnp %rcx,%rax
   140122afa:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140122afe:	e9 34 ff ff ff       	jmp    140122a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31d7>
   140122b03:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   140122b07:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140122b0b:	44 0f b7 4d 00       	movzwl 0x0(%rbp),%r9d
   140122b10:	48 89 bc 24 c0 00 00 	mov    %rdi,0xc0(%rsp)
   140122b17:	00 
   140122b18:	44 0f b7 45 02       	movzwl 0x2(%rbp),%r8d
   140122b1d:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140122b21:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140122b25:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122b2c:	0f 83 ed 79 00 00    	jae    14012a51f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacbf>
   140122b32:	c5 f8 77             	vzeroupper
   140122b35:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140122b3c:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140122b43:	48 c1 f9 03          	sar    $0x3,%rcx
   140122b47:	48 39 cf             	cmp    %rcx,%rdi
   140122b4a:	0f 83 fd 78 00 00    	jae    14012a44d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabed>
   140122b50:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122b57:	41 0f b7 c9          	movzwl %r9w,%ecx
   140122b5b:	45 0f b7 c0          	movzwl %r8w,%r8d
   140122b5f:	0f b7 c0             	movzwl %ax,%eax
   140122b62:	4c 01 e9             	add    %r13,%rcx
   140122b65:	4d 01 e8             	add    %r13,%r8
   140122b68:	4c 01 e8             	add    %r13,%rax
   140122b6b:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   140122b6f:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   140122b73:	4e 8d 0c c2          	lea    (%rdx,%r8,8),%r9
   140122b77:	48 8b 11             	mov    (%rcx),%rdx
   140122b7a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140122b7f:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140122b86:	00 ff ff 
   140122b89:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140122b90:	00 fd ff 
   140122b93:	48 21 d0             	and    %rdx,%rax
   140122b96:	4c 39 c0             	cmp    %r8,%rax
   140122b99:	0f 84 98 38 00 00    	je     140126437 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bd7>
   140122b9f:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140122ba6:	00 f8 ff 
   140122ba9:	48 39 d0             	cmp    %rdx,%rax
   140122bac:	0f 84 9d 38 00 00    	je     14012644f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bef>
   140122bb2:	4c 89 8c 24 a0 00 00 	mov    %r9,0xa0(%rsp)
   140122bb9:	00 
   140122bba:	e8 11 19 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122bbf:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140122bc4:	48 89 84 24 a0 03 00 	mov    %rax,0x3a0(%rsp)
   140122bcb:	00 
   140122bcc:	48 8d 84 24 a0 03 00 	lea    0x3a0(%rsp),%rax
   140122bd3:	00 
   140122bd4:	4c 8b 8c 24 a0 00 00 	mov    0xa0(%rsp),%r9
   140122bdb:	00 
   140122bdc:	48 c7 84 24 a8 03 00 	movq   $0x0,0x3a8(%rsp)
   140122be3:	00 00 00 00 00 
   140122be8:	48 c7 84 24 b0 03 00 	movq   $0x0,0x3b0(%rsp)
   140122bef:	00 00 00 00 00 
   140122bf4:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   140122bfb:	00 
   140122bfc:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140122c03:	00 ff ff 
   140122c06:	49 8b 11             	mov    (%r9),%rdx
   140122c09:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140122c10:	00 fd ff 
   140122c13:	48 21 d0             	and    %rdx,%rax
   140122c16:	48 39 c8             	cmp    %rcx,%rax
   140122c19:	0f 84 d6 55 00 00    	je     1401281f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8995>
   140122c1f:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140122c26:	00 f8 ff 
   140122c29:	48 39 d0             	cmp    %rdx,%rax
   140122c2c:	0f 84 db 55 00 00    	je     14012820d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89ad>
   140122c32:	4c 89 c9             	mov    %r9,%rcx
   140122c35:	e8 96 18 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122c3a:	4c 8d 84 24 c0 03 00 	lea    0x3c0(%rsp),%r8
   140122c41:	00 
   140122c42:	48 c7 84 24 c8 03 00 	movq   $0x0,0x3c8(%rsp)
   140122c49:	00 00 00 00 00 
   140122c4e:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140122c53:	48 c7 84 24 d0 03 00 	movq   $0x0,0x3d0(%rsp)
   140122c5a:	00 00 00 00 00 
   140122c5f:	48 89 84 24 c0 03 00 	mov    %rax,0x3c0(%rsp)
   140122c66:	00 
   140122c67:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140122c6e:	00 fd ff 
   140122c71:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   140122c76:	48 8b 10             	mov    (%rax),%rdx
   140122c79:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140122c80:	00 ff ff 
   140122c83:	48 21 d0             	and    %rdx,%rax
   140122c86:	48 39 c8             	cmp    %rcx,%rax
   140122c89:	0f 84 1a 55 00 00    	je     1401281a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8949>
   140122c8f:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140122c96:	00 f8 ff 
   140122c99:	48 39 d0             	cmp    %rdx,%rax
   140122c9c:	0f 84 1f 55 00 00    	je     1401281c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8961>
   140122ca2:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140122ca7:	4c 89 84 24 e0 00 00 	mov    %r8,0xe0(%rsp)
   140122cae:	00 
   140122caf:	e8 1c 18 0f 00       	call   1402144d0 <setun::VMValue::as_float() const>
   140122cb4:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140122cb9:	48 89 84 24 e0 03 00 	mov    %rax,0x3e0(%rsp)
   140122cc0:	00 
   140122cc1:	48 8d 84 24 e0 03 00 	lea    0x3e0(%rsp),%rax
   140122cc8:	00 
   140122cc9:	4c 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%r8
   140122cd0:	00 
   140122cd1:	48 c7 84 24 e8 03 00 	movq   $0x0,0x3e8(%rsp)
   140122cd8:	00 00 00 00 00 
   140122cdd:	48 c7 84 24 f0 03 00 	movq   $0x0,0x3f0(%rsp)
   140122ce4:	00 00 00 00 00 
   140122ce9:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   140122cf0:	00 
   140122cf1:	48 8d 84 24 00 06 00 	lea    0x600(%rsp),%rax
   140122cf8:	00 
   140122cf9:	48 8b 94 24 80 00 00 	mov    0x80(%rsp),%rdx
   140122d00:	00 
   140122d01:	48 89 c1             	mov    %rax,%rcx
   140122d04:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140122d09:	e8 22 db ee ff       	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140122d0e:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   140122d13:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
   140122d1a:	00 
   140122d1b:	48 8d 8c 24 60 04 00 	lea    0x460(%rsp),%rcx
   140122d22:	00 
   140122d23:	e8 98 d5 ee ff       	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140122d28:	48 8b 84 24 70 04 00 	mov    0x470(%rsp),%rax
   140122d2f:	00 
   140122d30:	c5 f9 6f a4 24 60 04 	vmovdqa 0x460(%rsp),%xmm4
   140122d37:	00 00 
   140122d39:	48 8d 94 24 60 01 00 	lea    0x160(%rsp),%rdx
   140122d40:	00 
   140122d41:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140122d46:	48 89 84 24 70 01 00 	mov    %rax,0x170(%rsp)
   140122d4d:	00 
   140122d4e:	c5 f9 7f a4 24 60 01 	vmovdqa %xmm4,0x160(%rsp)
   140122d55:	00 00 
   140122d57:	e8 e4 38 0e 00       	call   140206640 <setun::VMValue::VMValue(setun::TafpuNum)>
   140122d5c:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122d63:	48 8b 94 24 00 06 00 	mov    0x600(%rsp),%rdx
   140122d6a:	00 
   140122d6b:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140122d6f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122d76:	0f 84 19 54 00 00    	je     140128195 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8935>
   140122d7c:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140122d80:	48 8d 3d 19 53 29 00 	lea    0x295319(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122d87:	48 83 c5 09          	add    $0x9,%rbp
   140122d8b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122d8f:	ff e0                	jmp    *%rax
   140122d91:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   140122d95:	4c 8d 45 02          	lea    0x2(%rbp),%r8
   140122d99:	4c 01 ef             	add    %r13,%rdi
   140122d9c:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122da3:	0f 83 bd 7e 00 00    	jae    14012ac66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb406>
   140122da9:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140122db0:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140122db7:	48 c1 f8 03          	sar    $0x3,%rax
   140122dbb:	48 39 c7             	cmp    %rax,%rdi
   140122dbe:	0f 83 a8 85 00 00    	jae    14012b36c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb0c>
   140122dc4:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122dcb:	41 80 fc 01          	cmp    $0x1,%r12b
   140122dcf:	0f 85 4f 80 00 00    	jne    14012ae24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5c4>
   140122dd5:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140122ddc:	00 
   140122ddd:	45 31 e4             	xor    %r12d,%r12d
   140122de0:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140122de4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122deb:	0f 84 1f 2b 00 00    	je     140125910 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60b0>
   140122df1:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140122df5:	48 8d 3d a4 52 29 00 	lea    0x2952a4(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122dfc:	48 83 c5 03          	add    $0x3,%rbp
   140122e00:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122e04:	ff e0                	jmp    *%rax
   140122e06:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
   140122e0a:	4c 8b 8b 68 10 00 00 	mov    0x1068(%rbx),%r9
   140122e11:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
   140122e15:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   140122e19:	4c 01 ea             	add    %r13,%rdx
   140122e1c:	4d 8d 14 d1          	lea    (%r9,%rdx,8),%r10
   140122e20:	45 84 e4             	test   %r12b,%r12b
   140122e23:	0f 85 e7 75 00 00    	jne    14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabb0>
   140122e29:	49 8b 0a             	mov    (%r10),%rcx
   140122e2c:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   140122e31:	0f b7 c0             	movzwl %ax,%eax
   140122e34:	4c 01 e8             	add    %r13,%rax
   140122e37:	49 8b 04 c1          	mov    (%r9,%rax,8),%rax
   140122e3b:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140122e42:	00 
   140122e43:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122e4a:	0f 84 ae 75 00 00    	je     14012a3fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab9e>
   140122e50:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   140122e54:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   140122e5a:	48 83 c5 05          	add    $0x5,%rbp
   140122e5e:	48 8d 3d 3b 52 29 00 	lea    0x29523b(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122e65:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122e69:	ff e0                	jmp    *%rax
   140122e6b:	44 0f b7 45 04       	movzwl 0x4(%rbp),%r8d
   140122e70:	48 8d 45 06          	lea    0x6(%rbp),%rax
   140122e74:	44 0f b7 55 00       	movzwl 0x0(%rbp),%r10d
   140122e79:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140122e7e:	44 0f b7 4d 02       	movzwl 0x2(%rbp),%r9d
   140122e83:	4b 8d 3c 28          	lea    (%r8,%r13,1),%rdi
   140122e87:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122e8e:	0f 83 06 75 00 00    	jae    14012a39a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab3a>
   140122e94:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140122e9b:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140122ea2:	48 c1 f8 03          	sar    $0x3,%rax
   140122ea6:	48 39 c7             	cmp    %rax,%rdi
   140122ea9:	0f 83 b3 74 00 00    	jae    14012a362 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab02>
   140122eaf:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122eb6:	41 0f b7 d2          	movzwl %r10w,%edx
   140122eba:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140122ec1:	00 f8 ff 
   140122ec4:	4c 01 ea             	add    %r13,%rdx
   140122ec7:	48 8d 0c d0          	lea    (%rax,%rdx,8),%rcx
   140122ecb:	41 0f b7 d1          	movzwl %r9w,%edx
   140122ecf:	49 b9 00 00 00 00 00 	movabs $0xffff000000000000,%r9
   140122ed6:	00 ff ff 
   140122ed9:	4c 8b 19             	mov    (%rcx),%r11
   140122edc:	4c 01 ea             	add    %r13,%rdx
   140122edf:	4c 8d 04 d0          	lea    (%rax,%rdx,8),%r8
   140122ee3:	4c 89 da             	mov    %r11,%rdx
   140122ee6:	4c 21 ca             	and    %r9,%rdx
   140122ee9:	4c 39 d2             	cmp    %r10,%rdx
   140122eec:	0f 84 6b 36 00 00    	je     14012655d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cfd>
   140122ef2:	4c 89 c2             	mov    %r8,%rdx
   140122ef5:	c5 f8 77             	vzeroupper
   140122ef8:	e8 43 e3 0e 00       	call   140211240 <setun::VMValue::add(setun::VMValue const&) const>
   140122efd:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122f04:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140122f08:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140122f0f:	0f 84 37 57 00 00    	je     14012864c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dec>
   140122f15:	0f b6 45 06          	movzbl 0x6(%rbp),%eax
   140122f19:	48 8d 3d 80 51 29 00 	lea    0x295180(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122f20:	48 83 c5 07          	add    $0x7,%rbp
   140122f24:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122f28:	ff e0                	jmp    *%rax
   140122f2a:	0f b7 55 06          	movzwl 0x6(%rbp),%edx
   140122f2e:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140122f32:	44 0f b7 55 00       	movzwl 0x0(%rbp),%r10d
   140122f37:	48 89 bc 24 c0 00 00 	mov    %rdi,0xc0(%rsp)
   140122f3e:	00 
   140122f3f:	44 0f b7 4d 02       	movzwl 0x2(%rbp),%r9d
   140122f44:	0f b7 45 04          	movzwl 0x4(%rbp),%eax
   140122f48:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140122f4c:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122f53:	0f 83 15 7e 00 00    	jae    14012ad6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb50e>
   140122f59:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140122f60:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140122f67:	48 c1 f9 03          	sar    $0x3,%rcx
   140122f6b:	48 39 cf             	cmp    %rcx,%rdi
   140122f6e:	0f 83 ba 7d 00 00    	jae    14012ad2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4ce>
   140122f74:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   140122f7b:	41 0f b7 d2          	movzwl %r10w,%edx
   140122f7f:	0f b7 c0             	movzwl %ax,%eax
   140122f82:	4c 01 ea             	add    %r13,%rdx
   140122f85:	4c 01 e8             	add    %r13,%rax
   140122f88:	4d 8d 1c d0          	lea    (%r8,%rdx,8),%r11
   140122f8c:	41 0f b7 d1          	movzwl %r9w,%edx
   140122f90:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   140122f94:	4d 8b 0b             	mov    (%r11),%r9
   140122f97:	4c 01 ea             	add    %r13,%rdx
   140122f9a:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   140122f9f:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140122fa6:	00 f8 ff 
   140122fa9:	4d 8d 14 d0          	lea    (%r8,%rdx,8),%r10
   140122fad:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140122fb4:	00 ff ff 
   140122fb7:	4c 89 c9             	mov    %r9,%rcx
   140122fba:	4c 89 94 24 80 00 00 	mov    %r10,0x80(%rsp)
   140122fc1:	00 
   140122fc2:	48 21 d1             	and    %rdx,%rcx
   140122fc5:	48 39 c1             	cmp    %rax,%rcx
   140122fc8:	0f 85 03 4b 00 00    	jne    140127ad1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8271>
   140122fce:	4d 8b 12             	mov    (%r10),%r10
   140122fd1:	4c 89 d0             	mov    %r10,%rax
   140122fd4:	48 21 d0             	and    %rdx,%rax
   140122fd7:	48 39 c8             	cmp    %rcx,%rax
   140122fda:	0f 85 11 4b 00 00    	jne    140127af1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8291>
   140122fe0:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   140122fe5:	48 8b 09             	mov    (%rcx),%rcx
   140122fe8:	48 21 ca             	and    %rcx,%rdx
   140122feb:	48 39 c2             	cmp    %rax,%rdx
   140122fee:	0f 85 fd 4a 00 00    	jne    140127af1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8291>
   140122ff4:	49 c1 e2 10          	shl    $0x10,%r10
   140122ff8:	4c 89 c8             	mov    %r9,%rax
   140122ffb:	48 c1 e1 10          	shl    $0x10,%rcx
   140122fff:	48 c1 e0 10          	shl    $0x10,%rax
   140123003:	49 c1 fa 10          	sar    $0x10,%r10
   140123007:	48 c1 f8 10          	sar    $0x10,%rax
   14012300b:	48 c1 f9 10          	sar    $0x10,%rcx
   14012300f:	49 0f af c2          	imul   %r10,%rax
   140123013:	49 ba ff ff ff ff ff 	movabs $0xffffffffffff,%r10
   14012301a:	ff 00 00 
   14012301d:	48 01 c8             	add    %rcx,%rax
   140123020:	48 b9 00 00 00 00 00 	movabs $0x800000000000,%rcx
   140123027:	80 00 00 
   14012302a:	48 01 c1             	add    %rax,%rcx
   14012302d:	49 39 ca             	cmp    %rcx,%r10
   140123030:	0f 82 bb 4a 00 00    	jb     140127af1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8291>
   140123036:	4c 21 d0             	and    %r10,%rax
   140123039:	48 09 d0             	or     %rdx,%rax
   14012303c:	49 89 04 f8          	mov    %rax,(%r8,%rdi,8)
   140123040:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123047:	0f 84 45 51 00 00    	je     140128192 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8932>
   14012304d:	0f b6 45 08          	movzbl 0x8(%rbp),%eax
   140123051:	48 8d 3d 48 50 29 00 	lea    0x295048(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123058:	48 83 c5 09          	add    $0x9,%rbp
   14012305c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123060:	ff e0                	jmp    *%rax
   140123062:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123069:	00 fb ff 
   14012306c:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   140123073:	00 
   140123074:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   14012307b:	00 
   14012307c:	41 80 fc 02          	cmp    $0x2,%r12b
   140123080:	0f 85 04 74 00 00    	jne    14012a48a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac2a>
   140123086:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012308d:	00 
   14012308e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123094:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   14012309b:	00 
   14012309c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401230a1:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   1401230a8:	00 
   1401230a9:	48 89 c2             	mov    %rax,%rdx
   1401230ac:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401230b3:	00 ff ff 
   1401230b6:	48 89 d1             	mov    %rdx,%rcx
   1401230b9:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401230c0:	00 f8 ff 
   1401230c3:	48 21 c1             	and    %rax,%rcx
   1401230c6:	4c 39 c1             	cmp    %r8,%rcx
   1401230c9:	0f 84 65 38 00 00    	je     140126934 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d4>
   1401230cf:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401230d6:	00 ff ff 
   1401230d9:	c6 45 ff 33          	movb   $0x33,-0x1(%rbp)
   1401230dd:	48 8b 84 24 48 03 00 	mov    0x348(%rsp),%rax
   1401230e4:	00 
   1401230e5:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   1401230ec:	00 f8 ff 
   1401230ef:	48 89 c1             	mov    %rax,%rcx
   1401230f2:	48 21 d1             	and    %rdx,%rcx
   1401230f5:	4c 39 c1             	cmp    %r8,%rcx
   1401230f8:	0f 84 af 43 00 00    	je     1401274ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c4d>
   1401230fe:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140123105:	00 fd ff 
   140123108:	4c 39 c1             	cmp    %r8,%rcx
   14012310b:	0f 84 8f 43 00 00    	je     1401274a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c40>
   140123111:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140123118:	ff f7 ff 
   14012311b:	48 39 c1             	cmp    %rax,%rcx
   14012311e:	0f 83 fe 4f 00 00    	jae    140128122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c2>
   140123124:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   14012312b:	00 fc ff 
   14012312e:	4c 39 c8             	cmp    %r9,%rax
   140123131:	0f 84 eb 4f 00 00    	je     140128122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c2>
   140123137:	48 8b 84 24 50 03 00 	mov    0x350(%rsp),%rax
   14012313e:	00 
   14012313f:	48 39 c1             	cmp    %rax,%rcx
   140123142:	0f 83 da 4f 00 00    	jae    140128122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c2>
   140123148:	4c 39 c8             	cmp    %r9,%rax
   14012314b:	0f 84 d1 4f 00 00    	je     140128122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c2>
   140123151:	48 21 c2             	and    %rax,%rdx
   140123154:	4c 39 c2             	cmp    %r8,%rdx
   140123157:	0f 84 aa 87 00 00    	je     14012b907 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0a7>
   14012315d:	48 8d 8c 24 48 03 00 	lea    0x348(%rsp),%rcx
   140123164:	00 
   140123165:	c5 f8 77             	vzeroupper
   140123168:	e8 a3 fb 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   14012316d:	48 8d 8c 24 50 03 00 	lea    0x350(%rsp),%rcx
   140123174:	00 
   140123175:	48 89 c7             	mov    %rax,%rdi
   140123178:	e8 93 fb 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   14012317d:	48 39 c7             	cmp    %rax,%rdi
   140123180:	0f 9e c0             	setle  %al
   140123183:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012318a:	00 fa ff 
   14012318d:	0f b6 c0             	movzbl %al,%eax
   140123190:	48 01 d0             	add    %rdx,%rax
   140123193:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012319a:	00 
   14012319b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401231a2:	0f 84 38 27 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   1401231a8:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401231ac:	48 8d 3d ed 4e 29 00 	lea    0x294eed(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401231b3:	48 83 c5 01          	add    $0x1,%rbp
   1401231b7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401231bb:	ff e0                	jmp    *%rax
   1401231bd:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401231c4:	00 fb ff 
   1401231c7:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   1401231ce:	00 
   1401231cf:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   1401231d6:	00 
   1401231d7:	41 80 fc 02          	cmp    $0x2,%r12b
   1401231db:	0f 85 4d 7a 00 00    	jne    14012ac2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3ce>
   1401231e1:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401231e8:	00 
   1401231e9:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401231ef:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   1401231f6:	00 
   1401231f7:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401231fc:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140123203:	00 
   140123204:	48 89 c2             	mov    %rax,%rdx
   140123207:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   14012320e:	00 ff ff 
   140123211:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123218:	00 f8 ff 
   14012321b:	48 21 c2             	and    %rax,%rdx
   14012321e:	4c 39 c2             	cmp    %r8,%rdx
   140123221:	0f 84 bb 33 00 00    	je     1401265e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d82>
   140123227:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012322e:	00 ff ff 
   140123231:	c6 45 ff 30          	movb   $0x30,-0x1(%rbp)
   140123235:	48 8b 84 24 58 03 00 	mov    0x358(%rsp),%rax
   14012323c:	00 
   14012323d:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123244:	00 f8 ff 
   140123247:	48 89 c1             	mov    %rax,%rcx
   14012324a:	48 21 d1             	and    %rdx,%rcx
   14012324d:	4c 39 c1             	cmp    %r8,%rcx
   140123250:	0f 84 74 43 00 00    	je     1401275ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d6a>
   140123256:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   14012325d:	00 fd ff 
   140123260:	4c 39 c1             	cmp    %r8,%rcx
   140123263:	0f 84 54 43 00 00    	je     1401275bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d5d>
   140123269:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140123270:	ff f7 ff 
   140123273:	48 39 c1             	cmp    %rax,%rcx
   140123276:	0f 83 6e 4d 00 00    	jae    140127fea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   14012327c:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123283:	00 fc ff 
   140123286:	4c 39 c8             	cmp    %r9,%rax
   140123289:	0f 84 5b 4d 00 00    	je     140127fea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   14012328f:	48 8b 84 24 60 03 00 	mov    0x360(%rsp),%rax
   140123296:	00 
   140123297:	4c 39 c8             	cmp    %r9,%rax
   14012329a:	0f 84 4a 4d 00 00    	je     140127fea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   1401232a0:	48 39 c1             	cmp    %rax,%rcx
   1401232a3:	0f 83 41 4d 00 00    	jae    140127fea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   1401232a9:	48 21 c2             	and    %rax,%rdx
   1401232ac:	4c 39 c2             	cmp    %r8,%rdx
   1401232af:	0f 84 13 8b 00 00    	je     14012bdc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc568>
   1401232b5:	48 8d 8c 24 58 03 00 	lea    0x358(%rsp),%rcx
   1401232bc:	00 
   1401232bd:	c5 f8 77             	vzeroupper
   1401232c0:	e8 4b fa 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401232c5:	48 8d 8c 24 60 03 00 	lea    0x360(%rsp),%rcx
   1401232cc:	00 
   1401232cd:	48 89 c7             	mov    %rax,%rdi
   1401232d0:	e8 3b fa 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   1401232d5:	48 39 c7             	cmp    %rax,%rdi
   1401232d8:	40 0f 94 c7          	sete   %dil
   1401232dc:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401232e3:	00 fa ff 
   1401232e6:	40 0f b6 c7          	movzbl %dil,%eax
   1401232ea:	48 01 d0             	add    %rdx,%rax
   1401232ed:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401232f4:	00 
   1401232f5:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401232fc:	0f 84 de 25 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140123302:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123306:	48 8d 3d 93 4d 29 00 	lea    0x294d93(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012330d:	48 83 c5 01          	add    $0x1,%rbp
   140123311:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123315:	ff e0                	jmp    *%rax
   140123317:	48 8d 45 02          	lea    0x2(%rbp),%rax
   14012331b:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
   14012331f:	49 8b 8e b8 00 00 00 	mov    0xb8(%r14),%rcx
   140123326:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   14012332d:	00 
   14012332e:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123335:	00 fb ff 
   140123338:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   14012333f:	00 
   140123340:	41 80 fc 01          	cmp    $0x1,%r12b
   140123344:	0f 85 3a 72 00 00    	jne    14012a584 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad24>
   14012334a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123351:	00 
   140123352:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140123359:	00 ff ff 
   14012335c:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   140123363:	00 fd ff 
   140123366:	49 21 c0             	and    %rax,%r8
   140123369:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140123370:	00 
   140123371:	4d 39 c8             	cmp    %r9,%r8
   140123374:	0f 84 ef 44 00 00    	je     140127869 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8009>
   14012337a:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123380:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140123387:	00 f8 ff 
   14012338a:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123391:	00 
   140123392:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123399:	0f 84 23 71 00 00    	je     14012a4c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac62>
   14012339f:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   1401233a3:	48 8d 3d f6 4c 29 00 	lea    0x294cf6(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401233aa:	48 83 c5 03          	add    $0x3,%rbp
   1401233ae:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401233b2:	ff e0                	jmp    *%rax
   1401233b4:	0f b7 7d 00          	movzwl 0x0(%rbp),%edi
   1401233b8:	49 8b 96 b8 00 00 00 	mov    0xb8(%r14),%rdx
   1401233bf:	4c 8d 4d 02          	lea    0x2(%rbp),%r9
   1401233c3:	41 80 fc 02          	cmp    $0x2,%r12b
   1401233c7:	0f 85 c1 7f 00 00    	jne    14012b38e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb2e>
   1401233cd:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401233d4:	00 
   1401233d5:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1401233da:	45 31 e4             	xor    %r12d,%r12d
   1401233dd:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   1401233e4:	00 
   1401233e5:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401233ec:	ff ff ff 
   1401233ef:	49 b8 00 00 00 00 02 	movabs $0xfffd000200000000,%r8
   1401233f6:	00 fd ff 
   1401233f9:	48 21 c8             	and    %rcx,%rax
   1401233fc:	4c 39 c0             	cmp    %r8,%rax
   1401233ff:	0f 84 24 6e 00 00    	je     14012a229 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9c9>
   140123405:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012340c:	0f 84 c8 79 00 00    	je     14012adda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb57a>
   140123412:	0f b6 45 02          	movzbl 0x2(%rbp),%eax
   140123416:	48 8d 3d 83 4c 29 00 	lea    0x294c83(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012341d:	48 83 c5 03          	add    $0x3,%rbp
   140123421:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123425:	ff e0                	jmp    *%rax
   140123427:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012342e:	41 80 fc 01          	cmp    $0x1,%r12b
   140123432:	0f 85 79 7f 00 00    	jne    14012b3b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb51>
   140123438:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   14012343f:	00 
   140123440:	45 31 e4             	xor    %r12d,%r12d
   140123443:	4a 89 14 e8          	mov    %rdx,(%rax,%r13,8)
   140123447:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012344e:	0f 84 cc 24 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140123454:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123458:	48 8d 3d 41 4c 29 00 	lea    0x294c41(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012345f:	48 83 c5 01          	add    $0x1,%rbp
   140123463:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123467:	ff e0                	jmp    *%rax
   140123469:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140123470:	41 80 fc 01          	cmp    $0x1,%r12b
   140123474:	0f 85 8e 79 00 00    	jne    14012ae08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5a8>
   14012347a:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140123481:	00 
   140123482:	45 31 e4             	xor    %r12d,%r12d
   140123485:	4a 89 54 e8 08       	mov    %rdx,0x8(%rax,%r13,8)
   14012348a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123491:	0f 84 89 24 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140123497:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012349b:	48 8d 3d fe 4b 29 00 	lea    0x294bfe(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401234a2:	48 83 c5 01          	add    $0x1,%rbp
   1401234a6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401234aa:	ff e0                	jmp    *%rax
   1401234ac:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401234b3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401234b7:	0f 85 2f 79 00 00    	jne    14012adec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb58c>
   1401234bd:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   1401234c4:	00 
   1401234c5:	45 31 e4             	xor    %r12d,%r12d
   1401234c8:	4a 89 54 e8 10       	mov    %rdx,0x10(%rax,%r13,8)
   1401234cd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401234d4:	0f 84 46 24 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   1401234da:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401234de:	48 8d 3d bb 4b 29 00 	lea    0x294bbb(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401234e5:	48 83 c5 01          	add    $0x1,%rbp
   1401234e9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401234ed:	ff e0                	jmp    *%rax
   1401234ef:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401234f6:	41 80 fc 01          	cmp    $0x1,%r12b
   1401234fa:	0f 85 b5 7a 00 00    	jne    14012afb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb755>
   140123500:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
   140123507:	00 
   140123508:	45 31 e4             	xor    %r12d,%r12d
   14012350b:	4a 89 54 e8 18       	mov    %rdx,0x18(%rax,%r13,8)
   140123510:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123517:	0f 84 03 24 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   14012351d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123521:	48 8d 3d 78 4b 29 00 	lea    0x294b78(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123528:	48 83 c5 01          	add    $0x1,%rbp
   14012352c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123530:	ff e0                	jmp    *%rax
   140123532:	45 84 e4             	test   %r12b,%r12b
   140123535:	0f 84 60 24 00 00    	je     14012599b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x613b>
   14012353b:	41 80 fc 01          	cmp    $0x1,%r12b
   14012353f:	0f 84 38 60 00 00    	je     14012957d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d1d>
   140123545:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123549:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   14012354e:	0f 83 d2 a1 00 00    	jae    14012d726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdec6>
   140123554:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123559:	48 89 06             	mov    %rax,(%rsi)
   14012355c:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123563:	00 
   140123564:	4c 89 c6             	mov    %r8,%rsi
   140123567:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   14012356c:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140123573:	4a 8b 04 e8          	mov    (%rax,%r13,8),%rax
   140123577:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   14012357e:	00 
   14012357f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123586:	0f 84 94 23 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   14012358c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123590:	48 8d 3d 09 4b 29 00 	lea    0x294b09(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123597:	48 83 c5 01          	add    $0x1,%rbp
   14012359b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012359f:	ff e0                	jmp    *%rax
   1401235a1:	45 84 e4             	test   %r12b,%r12b
   1401235a4:	0f 85 64 24 00 00    	jne    140125a0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61ae>
   1401235aa:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401235b1:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401235b7:	4a 8b 44 e8 08       	mov    0x8(%rax,%r13,8),%rax
   1401235bc:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401235c3:	00 
   1401235c4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401235cb:	0f 84 4f 23 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   1401235d1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401235d5:	48 8d 3d c4 4a 29 00 	lea    0x294ac4(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401235dc:	48 83 c5 01          	add    $0x1,%rbp
   1401235e0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401235e4:	ff e0                	jmp    *%rax
   1401235e6:	45 84 e4             	test   %r12b,%r12b
   1401235e9:	0f 84 00 24 00 00    	je     1401259ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x618f>
   1401235ef:	41 80 fc 01          	cmp    $0x1,%r12b
   1401235f3:	0f 84 0c 5e 00 00    	je     140129405 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ba5>
   1401235f9:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   1401235fd:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123602:	0f 83 a4 94 00 00    	jae    14012caac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd24c>
   140123608:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012360d:	48 89 06             	mov    %rax,(%rsi)
   140123610:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123617:	00 
   140123618:	4c 89 c6             	mov    %r8,%rsi
   14012361b:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140123620:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140123627:	4a 8b 44 e8 10       	mov    0x10(%rax,%r13,8),%rax
   14012362c:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123633:	00 
   140123634:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012363b:	0f 84 df 22 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140123641:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123645:	48 8d 3d 54 4a 29 00 	lea    0x294a54(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012364c:	48 83 c5 01          	add    $0x1,%rbp
   140123650:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123654:	ff e0                	jmp    *%rax
   140123656:	45 84 e4             	test   %r12b,%r12b
   140123659:	0f 84 06 23 00 00    	je     140125965 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6105>
   14012365f:	41 80 fc 01          	cmp    $0x1,%r12b
   140123663:	0f 84 c4 5e 00 00    	je     14012952d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ccd>
   140123669:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   14012366d:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123672:	0f 83 64 a1 00 00    	jae    14012d7dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf7c>
   140123678:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   14012367d:	48 89 06             	mov    %rax,(%rsi)
   140123680:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123687:	00 
   140123688:	4c 89 c6             	mov    %r8,%rsi
   14012368b:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140123690:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140123697:	4a 8b 44 e8 18       	mov    0x18(%rax,%r13,8),%rax
   14012369c:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   1401236a3:	00 
   1401236a4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401236ab:	0f 84 6f 22 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   1401236b1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401236b5:	48 8d 3d e4 49 29 00 	lea    0x2949e4(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401236bc:	48 83 c5 01          	add    $0x1,%rbp
   1401236c0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401236c4:	ff e0                	jmp    *%rax
   1401236c6:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401236ca:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   1401236d1:	00 
   1401236d2:	45 84 e4             	test   %r12b,%r12b
   1401236d5:	48 0f 44 c2          	cmove  %rdx,%rax
   1401236d9:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401236e0:	48 8b 00             	mov    (%rax),%rax
   1401236e3:	4a 89 04 ea          	mov    %rax,(%rdx,%r13,8)
   1401236e7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401236ee:	0f 84 2c 22 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   1401236f4:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401236f8:	48 8d 3d a1 49 29 00 	lea    0x2949a1(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401236ff:	48 83 c5 01          	add    $0x1,%rbp
   140123703:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123707:	ff e0                	jmp    *%rax
   140123709:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012370d:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   140123714:	00 
   140123715:	45 84 e4             	test   %r12b,%r12b
   140123718:	48 0f 44 c2          	cmove  %rdx,%rax
   14012371c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140123723:	48 8b 00             	mov    (%rax),%rax
   140123726:	4a 89 44 ea 08       	mov    %rax,0x8(%rdx,%r13,8)
   14012372b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123732:	0f 84 e8 21 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140123738:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012373c:	48 8d 3d 5d 49 29 00 	lea    0x29495d(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123743:	48 83 c5 01          	add    $0x1,%rbp
   140123747:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012374b:	ff e0                	jmp    *%rax
   14012374d:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140123751:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   140123758:	00 
   140123759:	45 84 e4             	test   %r12b,%r12b
   14012375c:	48 0f 44 c2          	cmove  %rdx,%rax
   140123760:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140123767:	48 8b 00             	mov    (%rax),%rax
   14012376a:	4a 89 44 ea 10       	mov    %rax,0x10(%rdx,%r13,8)
   14012376f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123776:	0f 84 a4 21 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   14012377c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123780:	48 8d 3d 19 49 29 00 	lea    0x294919(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123787:	48 83 c5 01          	add    $0x1,%rbp
   14012378b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012378f:	ff e0                	jmp    *%rax
   140123791:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140123795:	48 8d 84 24 80 01 00 	lea    0x180(%rsp),%rax
   14012379c:	00 
   14012379d:	45 84 e4             	test   %r12b,%r12b
   1401237a0:	48 0f 44 c2          	cmove  %rdx,%rax
   1401237a4:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401237ab:	48 8b 00             	mov    (%rax),%rax
   1401237ae:	4a 89 44 ea 18       	mov    %rax,0x18(%rdx,%r13,8)
   1401237b3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401237ba:	0f 84 60 21 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   1401237c0:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401237c4:	48 8d 3d d5 48 29 00 	lea    0x2948d5(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401237cb:	48 83 c5 01          	add    $0x1,%rbp
   1401237cf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401237d3:	ff e0                	jmp    *%rax
   1401237d5:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   1401237d9:	0f b7 7d 02          	movzwl 0x2(%rbp),%edi
   1401237dd:	4c 8d 5d 04          	lea    0x4(%rbp),%r11
   1401237e1:	4c 01 e8             	add    %r13,%rax
   1401237e4:	48 3b 83 68 52 01 00 	cmp    0x15268(%rbx),%rax
   1401237eb:	0f 83 24 77 00 00    	jae    14012af15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6b5>
   1401237f1:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401237f8:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401237ff:	00 f8 ff 
   140123802:	4c 8d 04 c2          	lea    (%rdx,%rax,8),%r8
   140123806:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012380d:	00 ff ff 
   140123810:	49 8b 00             	mov    (%r8),%rax
   140123813:	48 21 c2             	and    %rax,%rdx
   140123816:	48 39 ca             	cmp    %rcx,%rdx
   140123819:	0f 85 c1 5a 00 00    	jne    1401292e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a80>
   14012381f:	48 c1 e0 10          	shl    $0x10,%rax
   140123823:	48 0f bf cf          	movswq %di,%rcx
   140123827:	49 b9 00 00 00 00 00 	movabs $0x800000000000,%r9
   14012382e:	80 00 00 
   140123831:	49 ba ff ff ff ff ff 	movabs $0xffffffffffff,%r10
   140123838:	ff 00 00 
   14012383b:	48 c1 f8 10          	sar    $0x10,%rax
   14012383f:	48 01 c8             	add    %rcx,%rax
   140123842:	49 01 c1             	add    %rax,%r9
   140123845:	4d 39 ca             	cmp    %r9,%r10
   140123848:	0f 82 96 5a 00 00    	jb     1401292e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a84>
   14012384e:	4c 21 d0             	and    %r10,%rax
   140123851:	48 09 d0             	or     %rdx,%rax
   140123854:	49 89 00             	mov    %rax,(%r8)
   140123857:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012385e:	0f 84 73 43 00 00    	je     140127bd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8377>
   140123864:	0f b6 45 04          	movzbl 0x4(%rbp),%eax
   140123868:	48 8d 3d 31 48 29 00 	lea    0x294831(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012386f:	48 83 c5 05          	add    $0x5,%rbp
   140123873:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123877:	ff e0                	jmp    *%rax
   140123879:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123880:	00 fb ff 
   140123883:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   14012388a:	00 
   14012388b:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   140123892:	00 
   140123893:	41 80 fc 02          	cmp    $0x2,%r12b
   140123897:	0f 85 89 6e 00 00    	jne    14012a726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaec6>
   14012389d:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401238a4:	00 
   1401238a5:	45 31 e4             	xor    %r12d,%r12d
   1401238a8:	48 89 84 24 e8 02 00 	mov    %rax,0x2e8(%rsp)
   1401238af:	00 
   1401238b0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1401238b5:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   1401238bc:	00 
   1401238bd:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401238c4:	ff ff ff 
   1401238c7:	48 ba 00 00 00 00 03 	movabs $0xfffd000300000000,%rdx
   1401238ce:	00 fd ff 
   1401238d1:	48 23 84 24 e0 02 00 	and    0x2e0(%rsp),%rax
   1401238d8:	00 
   1401238d9:	48 39 d0             	cmp    %rdx,%rax
   1401238dc:	0f 84 97 67 00 00    	je     14012a079 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa819>
   1401238e2:	48 8b 94 24 e0 02 00 	mov    0x2e0(%rsp),%rdx
   1401238e9:	00 
   1401238ea:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401238f1:	00 ff ff 
   1401238f4:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   1401238fb:	00 fd ff 
   1401238fe:	48 21 d0             	and    %rdx,%rax
   140123901:	48 39 c8             	cmp    %rcx,%rax
   140123904:	0f 84 3e 39 00 00    	je     140127248 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79e8>
   14012390a:	45 84 e4             	test   %r12b,%r12b
   14012390d:	0f 84 c5 48 00 00    	je     1401281d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8978>
   140123913:	41 80 fc 01          	cmp    $0x1,%r12b
   140123917:	0f 84 d4 5d 00 00    	je     1401296f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e91>
   14012391d:	4c 8d 46 08          	lea    0x8(%rsi),%r8
   140123921:	4c 3b 44 24 38       	cmp    0x38(%rsp),%r8
   140123926:	0f 83 ef b7 00 00    	jae    14012f11b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8bb>
   14012392c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123931:	48 89 06             	mov    %rax,(%rsi)
   140123934:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   14012393b:	00 
   14012393c:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   140123941:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140123948:	00 f8 ff 
   14012394b:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123952:	00 
   140123953:	4c 89 c6             	mov    %r8,%rsi
   140123956:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   14012395c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123963:	0f 84 b7 1f 00 00    	je     140125920 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c0>
   140123969:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012396d:	48 8d 3d 2c 47 29 00 	lea    0x29472c(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123974:	48 83 c5 01          	add    $0x1,%rbp
   140123978:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012397c:	ff e0                	jmp    *%rax
   14012397e:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123985:	00 fb ff 
   140123988:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   14012398f:	00 
   140123990:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   140123997:	00 
   140123998:	41 80 fc 01          	cmp    $0x1,%r12b
   14012399c:	0f 85 53 6e 00 00    	jne    14012a7f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf95>
   1401239a2:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   1401239a9:	00 
   1401239aa:	45 31 e4             	xor    %r12d,%r12d
   1401239ad:	48 89 84 24 f0 02 00 	mov    %rax,0x2f0(%rsp)
   1401239b4:	00 
   1401239b5:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   1401239b9:	48 83 ee 10          	sub    $0x10,%rsi
   1401239bd:	48 89 84 24 f8 02 00 	mov    %rax,0x2f8(%rsp)
   1401239c4:	00 
   1401239c5:	48 8b 16             	mov    (%rsi),%rdx
   1401239c8:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   1401239cf:	00 ff ff 
   1401239d2:	48 89 d1             	mov    %rdx,%rcx
   1401239d5:	48 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%rax
   1401239dc:	00 fd ff 
   1401239df:	4c 21 c1             	and    %r8,%rcx
   1401239e2:	48 39 c1             	cmp    %rax,%rcx
   1401239e5:	0f 84 aa 2f 00 00    	je     140126995 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7135>
   1401239eb:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401239f2:	0f 84 95 59 00 00    	je     14012938d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b2d>
   1401239f8:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401239fc:	48 8d 3d 9d 46 29 00 	lea    0x29469d(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123a03:	48 83 c5 01          	add    $0x1,%rbp
   140123a07:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123a0b:	ff e0                	jmp    *%rax
   140123a0d:	0f b7 45 02          	movzwl 0x2(%rbp),%eax
   140123a11:	0f b7 7d 04          	movzwl 0x4(%rbp),%edi
   140123a15:	0f b7 4d 06          	movzwl 0x6(%rbp),%ecx
   140123a19:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140123a20:	66 89 84 24 80 00 00 	mov    %ax,0x80(%rsp)
   140123a27:	00 
   140123a28:	0f b7 45 00          	movzwl 0x0(%rbp),%eax
   140123a2c:	66 89 7c 24 60       	mov    %di,0x60(%rsp)
   140123a31:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
   140123a35:	66 89 8c 24 a0 00 00 	mov    %cx,0xa0(%rsp)
   140123a3c:	00 
   140123a3d:	4c 01 e8             	add    %r13,%rax
   140123a40:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140123a44:	c5 f8 77             	vzeroupper
   140123a47:	e8 c4 f2 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   140123a4c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140123a53:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   140123a5a:	00 
   140123a5b:	0f b7 84 24 80 00 00 	movzwl 0x80(%rsp),%eax
   140123a62:	00 
   140123a63:	4c 01 e8             	add    %r13,%rax
   140123a66:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140123a6a:	e8 a1 f2 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   140123a6f:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140123a76:	48 89 c5             	mov    %rax,%rbp
   140123a79:	0f b7 44 24 60       	movzwl 0x60(%rsp),%eax
   140123a7e:	4c 01 e8             	add    %r13,%rax
   140123a81:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140123a85:	e8 86 f2 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   140123a8a:	48 85 c0             	test   %rax,%rax
   140123a8d:	0f 84 38 6e 00 00    	je     14012a8cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb06b>
   140123a93:	0f 8e 9a 20 00 00    	jle    140125b33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62d3>
   140123a99:	48 39 ac 24 c0 00 00 	cmp    %rbp,0xc0(%rsp)
   140123aa0:	00 
   140123aa1:	0f 9c c2             	setl   %dl
   140123aa4:	48 0f bf 84 24 a0 00 	movswq 0xa0(%rsp),%rax
   140123aab:	00 00 
   140123aad:	48 01 f8             	add    %rdi,%rax
   140123ab0:	84 d2                	test   %dl,%dl
   140123ab2:	48 0f 44 f8          	cmove  %rax,%rdi
   140123ab6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123abd:	0f 84 e3 58 00 00    	je     1401293a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b46>
   140123ac3:	0f b6 07             	movzbl (%rdi),%eax
   140123ac6:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
   140123aca:	48 8d 3d cf 45 29 00 	lea    0x2945cf(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123ad1:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   140123ad4:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123adb:	00 fb ff 
   140123ade:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   140123ae5:	00 
   140123ae6:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
   140123aed:	00 
   140123aee:	41 80 fc 02          	cmp    $0x2,%r12b
   140123af2:	0f 85 ec 71 00 00    	jne    14012ace4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb484>
   140123af8:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123aff:	00 
   140123b00:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123b06:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
   140123b0d:	00 
   140123b0e:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123b13:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   140123b1a:	00 
   140123b1b:	48 89 c2             	mov    %rax,%rdx
   140123b1e:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140123b25:	00 ff ff 
   140123b28:	49 89 d0             	mov    %rdx,%r8
   140123b2b:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140123b32:	00 f8 ff 
   140123b35:	49 21 c0             	and    %rax,%r8
   140123b38:	49 39 c8             	cmp    %rcx,%r8
   140123b3b:	0f 84 7c 2d 00 00    	je     1401268bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x705d>
   140123b41:	c6 45 ff 20          	movb   $0x20,-0x1(%rbp)
   140123b45:	48 8d 94 24 10 03 00 	lea    0x310(%rsp),%rdx
   140123b4c:	00 
   140123b4d:	48 8d 8c 24 08 03 00 	lea    0x308(%rsp),%rcx
   140123b54:	00 
   140123b55:	c5 f8 77             	vzeroupper
   140123b58:	e8 e3 d6 0e 00       	call   140211240 <setun::VMValue::add(setun::VMValue const&) const>
   140123b5d:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123b64:	00 
   140123b65:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123b6c:	0f 84 6e 1d 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140123b72:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123b76:	48 8d 3d 23 45 29 00 	lea    0x294523(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123b7d:	48 83 c5 01          	add    $0x1,%rbp
   140123b81:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123b85:	ff e0                	jmp    *%rax
   140123b87:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123b8e:	00 fb ff 
   140123b91:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140123b98:	00 
   140123b99:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140123ba0:	00 
   140123ba1:	41 80 fc 02          	cmp    $0x2,%r12b
   140123ba5:	0f 85 77 6e 00 00    	jne    14012aa22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1c2>
   140123bab:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123bb2:	00 
   140123bb3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123bb9:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140123bc0:	00 
   140123bc1:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123bc6:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140123bcd:	00 
   140123bce:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123bd5:	00 ff ff 
   140123bd8:	48 89 c1             	mov    %rax,%rcx
   140123bdb:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123be2:	00 f8 ff 
   140123be5:	48 21 d1             	and    %rdx,%rcx
   140123be8:	4c 39 c1             	cmp    %r8,%rcx
   140123beb:	0f 84 52 2c 00 00    	je     140126843 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fe3>
   140123bf1:	c6 45 ff 21          	movb   $0x21,-0x1(%rbp)
   140123bf5:	48 8d 94 24 20 03 00 	lea    0x320(%rsp),%rdx
   140123bfc:	00 
   140123bfd:	48 8d 8c 24 18 03 00 	lea    0x318(%rsp),%rcx
   140123c04:	00 
   140123c05:	c5 f8 77             	vzeroupper
   140123c08:	e8 23 ee 0e 00       	call   140212a30 <setun::VMValue::sub(setun::VMValue const&) const>
   140123c0d:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123c14:	00 
   140123c15:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123c1c:	0f 84 be 1c 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140123c22:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123c26:	48 8d 3d 73 44 29 00 	lea    0x294473(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123c2d:	48 83 c5 01          	add    $0x1,%rbp
   140123c31:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123c35:	ff e0                	jmp    *%rax
   140123c37:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123c3e:	00 fb ff 
   140123c41:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   140123c48:	00 
   140123c49:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   140123c50:	00 
   140123c51:	41 80 fc 02          	cmp    $0x2,%r12b
   140123c55:	0f 85 8f 6d 00 00    	jne    14012a9ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb18a>
   140123c5b:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123c62:	00 
   140123c63:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123c69:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   140123c70:	00 
   140123c71:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123c76:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   140123c7d:	00 
   140123c7e:	48 89 c2             	mov    %rax,%rdx
   140123c81:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140123c88:	00 ff ff 
   140123c8b:	49 89 d0             	mov    %rdx,%r8
   140123c8e:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140123c95:	00 f8 ff 
   140123c98:	49 21 c0             	and    %rax,%r8
   140123c9b:	49 39 c8             	cmp    %rcx,%r8
   140123c9e:	0f 84 27 2b 00 00    	je     1401267cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f6b>
   140123ca4:	c6 45 ff 22          	movb   $0x22,-0x1(%rbp)
   140123ca8:	48 8d 94 24 30 03 00 	lea    0x330(%rsp),%rdx
   140123caf:	00 
   140123cb0:	48 8d 8c 24 28 03 00 	lea    0x328(%rsp),%rcx
   140123cb7:	00 
   140123cb8:	c5 f8 77             	vzeroupper
   140123cbb:	e8 f0 e4 0e 00       	call   1402121b0 <setun::VMValue::mul(setun::VMValue const&) const>
   140123cc0:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123cc7:	00 
   140123cc8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123ccf:	0f 84 0b 1c 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140123cd5:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123cd9:	48 8d 3d c0 43 29 00 	lea    0x2943c0(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123ce0:	48 83 c5 01          	add    $0x1,%rbp
   140123ce4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123ce8:	ff e0                	jmp    *%rax
   140123cea:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123cf1:	00 fb ff 
   140123cf4:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   140123cfb:	00 
   140123cfc:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   140123d03:	00 
   140123d04:	41 80 fc 02          	cmp    $0x2,%r12b
   140123d08:	0f 85 a4 6c 00 00    	jne    14012a9b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb152>
   140123d0e:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
   140123d15:	00 
   140123d16:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123d1c:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   140123d23:	00 
   140123d24:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   140123d29:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   140123d30:	00 
   140123d31:	48 89 c2             	mov    %rax,%rdx
   140123d34:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140123d3b:	00 ff ff 
   140123d3e:	48 89 d1             	mov    %rdx,%rcx
   140123d41:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123d48:	00 f8 ff 
   140123d4b:	48 21 c1             	and    %rax,%rcx
   140123d4e:	4c 39 c1             	cmp    %r8,%rcx
   140123d51:	0f 84 13 2a 00 00    	je     14012676a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f0a>
   140123d57:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123d5e:	00 ff ff 
   140123d61:	c6 45 ff 32          	movb   $0x32,-0x1(%rbp)
   140123d65:	48 8b 84 24 38 03 00 	mov    0x338(%rsp),%rax
   140123d6c:	00 
   140123d6d:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123d74:	00 f8 ff 
   140123d77:	48 89 c1             	mov    %rax,%rcx
   140123d7a:	48 21 d1             	and    %rdx,%rcx
   140123d7d:	4c 39 c1             	cmp    %r8,%rcx
   140123d80:	0f 84 0c 36 00 00    	je     140127392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b32>
   140123d86:	49 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%r8
   140123d8d:	00 fd ff 
   140123d90:	4c 39 c1             	cmp    %r8,%rcx
   140123d93:	0f 84 ec 35 00 00    	je     140127385 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b25>
   140123d99:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140123da0:	ff f7 ff 
   140123da3:	48 39 c1             	cmp    %rax,%rcx
   140123da6:	0f 83 11 42 00 00    	jae    140127fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x875d>
   140123dac:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123db3:	00 fc ff 
   140123db6:	4c 39 c8             	cmp    %r9,%rax
   140123db9:	0f 84 fe 41 00 00    	je     140127fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x875d>
   140123dbf:	48 8b 84 24 40 03 00 	mov    0x340(%rsp),%rax
   140123dc6:	00 
   140123dc7:	48 39 c1             	cmp    %rax,%rcx
   140123dca:	0f 83 ed 41 00 00    	jae    140127fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x875d>
   140123dd0:	4c 39 c8             	cmp    %r9,%rax
   140123dd3:	0f 84 e4 41 00 00    	je     140127fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x875d>
   140123dd9:	48 21 c2             	and    %rax,%rdx
   140123ddc:	4c 39 c2             	cmp    %r8,%rdx
   140123ddf:	0f 84 66 7a 00 00    	je     14012b84b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfeb>
   140123de5:	48 8d 8c 24 38 03 00 	lea    0x338(%rsp),%rcx
   140123dec:	00 
   140123ded:	c5 f8 77             	vzeroupper
   140123df0:	e8 1b ef 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   140123df5:	48 8d 8c 24 40 03 00 	lea    0x340(%rsp),%rcx
   140123dfc:	00 
   140123dfd:	48 89 c7             	mov    %rax,%rdi
   140123e00:	e8 0b ef 0e 00       	call   140212d10 <setun::VMValue::as_int() const>
   140123e05:	48 39 c7             	cmp    %rax,%rdi
   140123e08:	0f 9c c0             	setl   %al
   140123e0b:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123e12:	00 fa ff 
   140123e15:	0f b6 c0             	movzbl %al,%eax
   140123e18:	48 01 d0             	add    %rdx,%rax
   140123e1b:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140123e22:	00 
   140123e23:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123e2a:	0f 84 b0 1a 00 00    	je     1401258e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6080>
   140123e30:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123e34:	48 8d 3d 65 42 29 00 	lea    0x294265(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123e3b:	48 83 c5 01          	add    $0x1,%rbp
   140123e3f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123e43:	ff e0                	jmp    *%rax
   140123e45:	41 80 fc 02          	cmp    $0x2,%r12b
   140123e49:	0f 84 f1 27 00 00    	je     140126640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6de0>
   140123e4f:	41 80 fc 01          	cmp    $0x1,%r12b
   140123e53:	0f 84 3c 4b 00 00    	je     140128995 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9135>
   140123e59:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123e60:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123e67:	c5 f8 77             	vzeroupper
   140123e6a:	48 29 d6             	sub    %rdx,%rsi
   140123e6d:	4c 29 fd             	sub    %r15,%rbp
   140123e70:	48 29 d0             	sub    %rdx,%rax
   140123e73:	48 89 f7             	mov    %rsi,%rdi
   140123e76:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123e7d:	48 c1 ff 03          	sar    $0x3,%rdi
   140123e81:	48 39 f0             	cmp    %rsi,%rax
   140123e84:	0f 82 36 44 00 00    	jb     1401282c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a60>
   140123e8a:	c5 f9 6f 05 6e 0b 23 	vmovdqa 0x230b6e(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140123e91:	00 
   140123e92:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123e99:	4c 89 f2             	mov    %r14,%rdx
   140123e9c:	48 89 d9             	mov    %rbx,%rcx
   140123e9f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123ea6:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123ead:	00 
   140123eae:	e8 7d 01 fe ff       	call   140104030 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140123eb3:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123eba:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123ec1:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140123ec8:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123ecf:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123ed3:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123eda:	4c 01 f9             	add    %r15,%rcx
   140123edd:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123ee2:	4d 85 ed             	test   %r13,%r13
   140123ee5:	74 0d                	je     140123ef4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4694>
   140123ee7:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140123eec:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140123ef3:	00 
   140123ef4:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123efb:	0f 84 ef 3c 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140123f01:	0f b6 01             	movzbl (%rcx),%eax
   140123f04:	48 8d 3d 95 41 29 00 	lea    0x294195(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123f0b:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140123f0f:	45 31 e4             	xor    %r12d,%r12d
   140123f12:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123f16:	ff e0                	jmp    *%rax
   140123f18:	41 80 fc 02          	cmp    $0x2,%r12b
   140123f1c:	0f 84 29 31 00 00    	je     14012704b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77eb>
   140123f22:	41 80 fc 01          	cmp    $0x1,%r12b
   140123f26:	0f 84 9b 4b 00 00    	je     140128ac7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9267>
   140123f2c:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123f33:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123f3a:	c5 f8 77             	vzeroupper
   140123f3d:	48 29 d6             	sub    %rdx,%rsi
   140123f40:	4c 29 fd             	sub    %r15,%rbp
   140123f43:	48 29 d0             	sub    %rdx,%rax
   140123f46:	48 89 f7             	mov    %rsi,%rdi
   140123f49:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140123f50:	48 c1 ff 03          	sar    $0x3,%rdi
   140123f54:	48 39 f0             	cmp    %rsi,%rax
   140123f57:	0f 82 b7 43 00 00    	jb     140128314 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ab4>
   140123f5d:	c5 f9 6f 05 9b 0a 23 	vmovdqa 0x230a9b(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140123f64:	00 
   140123f65:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123f6c:	4c 89 f2             	mov    %r14,%rdx
   140123f6f:	48 89 d9             	mov    %rbx,%rcx
   140123f72:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123f79:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123f80:	00 
   140123f81:	e8 da 02 fe ff       	call   140104260 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   140123f86:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123f8d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140123f94:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140123f9b:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123fa2:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140123fa6:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123fad:	4c 01 f9             	add    %r15,%rcx
   140123fb0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140123fb5:	4d 85 ed             	test   %r13,%r13
   140123fb8:	74 0d                	je     140123fc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4767>
   140123fba:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140123fbf:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140123fc6:	00 
   140123fc7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123fce:	0f 84 1c 3c 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140123fd4:	0f b6 01             	movzbl (%rcx),%eax
   140123fd7:	48 8d 3d c2 40 29 00 	lea    0x2940c2(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123fde:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140123fe2:	45 31 e4             	xor    %r12d,%r12d
   140123fe5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123fe9:	ff e0                	jmp    *%rax
   140123feb:	41 80 fc 02          	cmp    $0x2,%r12b
   140123fef:	0f 84 69 2f 00 00    	je     140126f5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76fe>
   140123ff5:	41 80 fc 01          	cmp    $0x1,%r12b
   140123ff9:	0f 84 95 4a 00 00    	je     140128a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9234>
   140123fff:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124006:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012400d:	c5 f8 77             	vzeroupper
   140124010:	48 29 d6             	sub    %rdx,%rsi
   140124013:	4c 29 fd             	sub    %r15,%rbp
   140124016:	48 29 d0             	sub    %rdx,%rax
   140124019:	48 89 f7             	mov    %rsi,%rdi
   14012401c:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124023:	48 c1 ff 03          	sar    $0x3,%rdi
   140124027:	48 39 f0             	cmp    %rsi,%rax
   14012402a:	0f 82 1b 44 00 00    	jb     14012844b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8beb>
   140124030:	c5 f9 6f 05 c8 09 23 	vmovdqa 0x2309c8(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124037:	00 
   140124038:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012403f:	4c 89 f2             	mov    %r14,%rdx
   140124042:	48 89 d9             	mov    %rbx,%rcx
   140124045:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012404c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124053:	00 
   140124054:	e8 c7 f6 fd ff       	call   140103720 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   140124059:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124060:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124067:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012406e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124075:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124079:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124080:	4c 01 f9             	add    %r15,%rcx
   140124083:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124088:	4d 85 ed             	test   %r13,%r13
   14012408b:	74 0d                	je     14012409a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x483a>
   14012408d:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124092:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124099:	00 
   14012409a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401240a1:	0f 84 49 3b 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401240a7:	0f b6 01             	movzbl (%rcx),%eax
   1401240aa:	48 8d 3d ef 3f 29 00 	lea    0x293fef(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401240b1:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401240b5:	45 31 e4             	xor    %r12d,%r12d
   1401240b8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401240bc:	ff e0                	jmp    *%rax
   1401240be:	41 80 fc 02          	cmp    $0x2,%r12b
   1401240c2:	0f 84 a6 2d 00 00    	je     140126e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x760e>
   1401240c8:	41 80 fc 01          	cmp    $0x1,%r12b
   1401240cc:	0f 84 8d 4b 00 00    	je     140128c5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93ff>
   1401240d2:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401240d9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401240e0:	c5 f8 77             	vzeroupper
   1401240e3:	48 29 d6             	sub    %rdx,%rsi
   1401240e6:	4c 29 fd             	sub    %r15,%rbp
   1401240e9:	48 29 d0             	sub    %rdx,%rax
   1401240ec:	48 89 f7             	mov    %rsi,%rdi
   1401240ef:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401240f6:	48 c1 ff 03          	sar    $0x3,%rdi
   1401240fa:	48 39 f0             	cmp    %rsi,%rax
   1401240fd:	0f 82 d2 41 00 00    	jb     1401282d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a75>
   140124103:	c5 f9 6f 05 f5 08 23 	vmovdqa 0x2308f5(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   14012410a:	00 
   14012410b:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124112:	4c 89 f2             	mov    %r14,%rdx
   140124115:	48 89 d9             	mov    %rbx,%rcx
   140124118:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012411f:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124126:	00 
   140124127:	e8 e4 e5 fd ff       	call   140102710 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   14012412c:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124133:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012413a:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124141:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124148:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012414c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124153:	4c 01 f9             	add    %r15,%rcx
   140124156:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012415b:	4d 85 ed             	test   %r13,%r13
   14012415e:	74 0d                	je     14012416d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x490d>
   140124160:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124165:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012416c:	00 
   14012416d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124174:	0f 84 76 3a 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012417a:	0f b6 01             	movzbl (%rcx),%eax
   14012417d:	48 8d 3d 1c 3f 29 00 	lea    0x293f1c(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124184:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124188:	45 31 e4             	xor    %r12d,%r12d
   14012418b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012418f:	ff e0                	jmp    *%rax
   140124191:	41 80 fc 02          	cmp    $0x2,%r12b
   140124195:	0f 84 b7 2a 00 00    	je     140126c52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73f2>
   14012419b:	41 80 fc 01          	cmp    $0x1,%r12b
   14012419f:	0f 84 88 49 00 00    	je     140128b2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92cd>
   1401241a5:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401241ac:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401241b3:	c5 f8 77             	vzeroupper
   1401241b6:	48 29 d6             	sub    %rdx,%rsi
   1401241b9:	4c 29 fd             	sub    %r15,%rbp
   1401241bc:	48 29 d0             	sub    %rdx,%rax
   1401241bf:	48 89 f7             	mov    %rsi,%rdi
   1401241c2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401241c9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401241cd:	48 39 f0             	cmp    %rsi,%rax
   1401241d0:	0f 82 c0 40 00 00    	jb     140128296 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a36>
   1401241d6:	c5 f9 6f 05 22 08 23 	vmovdqa 0x230822(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401241dd:	00 
   1401241de:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401241e5:	4c 89 f2             	mov    %r14,%rdx
   1401241e8:	48 89 d9             	mov    %rbx,%rcx
   1401241eb:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401241f2:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401241f9:	00 
   1401241fa:	e8 f1 d0 fd ff       	call   1401012f0 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   1401241ff:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124206:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012420d:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124214:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012421b:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012421f:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124226:	4c 01 f9             	add    %r15,%rcx
   140124229:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012422e:	4d 85 ed             	test   %r13,%r13
   140124231:	74 0d                	je     140124240 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49e0>
   140124233:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124238:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012423f:	00 
   140124240:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124247:	0f 84 a3 39 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012424d:	0f b6 01             	movzbl (%rcx),%eax
   140124250:	48 8d 3d 49 3e 29 00 	lea    0x293e49(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124257:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012425b:	45 31 e4             	xor    %r12d,%r12d
   14012425e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124262:	ff e0                	jmp    *%rax
   140124264:	41 80 fc 02          	cmp    $0x2,%r12b
   140124268:	0f 84 55 2e 00 00    	je     1401270c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7863>
   14012426e:	41 80 fc 01          	cmp    $0x1,%r12b
   140124272:	0f 84 b7 46 00 00    	je     14012892f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90cf>
   140124278:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012427f:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124286:	c5 f8 77             	vzeroupper
   140124289:	48 29 d6             	sub    %rdx,%rsi
   14012428c:	4c 29 fd             	sub    %r15,%rbp
   14012428f:	48 29 d0             	sub    %rdx,%rax
   140124292:	48 89 f7             	mov    %rsi,%rdi
   140124295:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012429c:	48 c1 ff 03          	sar    $0x3,%rdi
   1401242a0:	48 39 f0             	cmp    %rsi,%rax
   1401242a3:	0f 82 41 40 00 00    	jb     1401282ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a8a>
   1401242a9:	c5 f9 6f 05 4f 07 23 	vmovdqa 0x23074f(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401242b0:	00 
   1401242b1:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401242b8:	4c 89 f2             	mov    %r14,%rdx
   1401242bb:	48 89 d9             	mov    %rbx,%rcx
   1401242be:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401242c5:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401242cc:	00 
   1401242cd:	e8 0e a9 fd ff       	call   1400febe0 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   1401242d2:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401242d9:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401242e0:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401242e7:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401242ee:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401242f2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401242f9:	4c 01 f9             	add    %r15,%rcx
   1401242fc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124301:	4d 85 ed             	test   %r13,%r13
   140124304:	74 0d                	je     140124313 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ab3>
   140124306:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012430b:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124312:	00 
   140124313:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012431a:	0f 84 d0 38 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124320:	0f b6 01             	movzbl (%rcx),%eax
   140124323:	48 8d 3d 76 3d 29 00 	lea    0x293d76(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012432a:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012432e:	45 31 e4             	xor    %r12d,%r12d
   140124331:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124335:	ff e0                	jmp    *%rax
   140124337:	41 80 fc 02          	cmp    $0x2,%r12b
   14012433b:	0f 84 fa 2d 00 00    	je     14012713b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78db>
   140124341:	41 80 fc 01          	cmp    $0x1,%r12b
   140124345:	0f 84 ac 4a 00 00    	je     140128df7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9597>
   14012434b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124352:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124359:	c5 f8 77             	vzeroupper
   14012435c:	48 29 d6             	sub    %rdx,%rsi
   14012435f:	4c 29 fd             	sub    %r15,%rbp
   140124362:	48 29 d0             	sub    %rdx,%rax
   140124365:	48 89 f7             	mov    %rsi,%rdi
   140124368:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012436f:	48 c1 ff 03          	sar    $0x3,%rdi
   140124373:	48 39 f0             	cmp    %rsi,%rax
   140124376:	0f 82 83 3f 00 00    	jb     1401282ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a9f>
   14012437c:	c5 f9 6f 05 7c 06 23 	vmovdqa 0x23067c(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124383:	00 
   140124384:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012438b:	4c 89 f2             	mov    %r14,%rdx
   14012438e:	48 89 d9             	mov    %rbx,%rcx
   140124391:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124398:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012439f:	00 
   1401243a0:	e8 0b 0d fe ff       	call   1401050b0 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   1401243a5:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401243ac:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401243b3:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401243ba:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401243c1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401243c5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401243cc:	4c 01 f9             	add    %r15,%rcx
   1401243cf:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401243d4:	4d 85 ed             	test   %r13,%r13
   1401243d7:	74 0d                	je     1401243e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b86>
   1401243d9:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401243de:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401243e5:	00 
   1401243e6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401243ed:	0f 84 fd 37 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401243f3:	0f b6 01             	movzbl (%rcx),%eax
   1401243f6:	48 8d 3d a3 3c 29 00 	lea    0x293ca3(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401243fd:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124401:	45 31 e4             	xor    %r12d,%r12d
   140124404:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124408:	ff e0                	jmp    *%rax
   14012440a:	41 80 fc 02          	cmp    $0x2,%r12b
   14012440e:	0f 84 68 22 00 00    	je     14012667c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e1c>
   140124414:	41 80 fc 01          	cmp    $0x1,%r12b
   140124418:	0f 84 3f 4a 00 00    	je     140128e5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fd>
   14012441e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124425:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012442c:	c5 f8 77             	vzeroupper
   14012442f:	48 29 d6             	sub    %rdx,%rsi
   140124432:	4c 29 fd             	sub    %r15,%rbp
   140124435:	48 29 d0             	sub    %rdx,%rax
   140124438:	48 89 f7             	mov    %rsi,%rdi
   14012443b:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124442:	48 c1 ff 03          	sar    $0x3,%rdi
   140124446:	48 39 f0             	cmp    %rsi,%rax
   140124449:	0f 82 58 3f 00 00    	jb     1401283a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b47>
   14012444f:	c5 f9 6f 05 a9 05 23 	vmovdqa 0x2305a9(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124456:	00 
   140124457:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012445e:	4c 89 f2             	mov    %r14,%rdx
   140124461:	48 89 d9             	mov    %rbx,%rcx
   140124464:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012446b:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124472:	00 
   140124473:	e8 78 00 fe ff       	call   1401044f0 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140124478:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012447f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124486:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012448d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124494:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124498:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012449f:	4c 01 f9             	add    %r15,%rcx
   1401244a2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401244a7:	4d 85 ed             	test   %r13,%r13
   1401244aa:	74 0d                	je     1401244b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c59>
   1401244ac:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401244b1:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401244b8:	00 
   1401244b9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401244c0:	0f 84 2a 37 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401244c6:	0f b6 01             	movzbl (%rcx),%eax
   1401244c9:	48 8d 3d d0 3b 29 00 	lea    0x293bd0(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401244d0:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401244d4:	45 31 e4             	xor    %r12d,%r12d
   1401244d7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401244db:	ff e0                	jmp    *%rax
   1401244dd:	41 80 fc 02          	cmp    $0x2,%r12b
   1401244e1:	0f 84 c3 29 00 00    	je     140126eaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x764a>
   1401244e7:	41 80 fc 01          	cmp    $0x1,%r12b
   1401244eb:	0f 84 08 47 00 00    	je     140128bf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9399>
   1401244f1:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401244f8:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401244ff:	c5 f8 77             	vzeroupper
   140124502:	48 29 d6             	sub    %rdx,%rsi
   140124505:	4c 29 fd             	sub    %r15,%rbp
   140124508:	48 29 d0             	sub    %rdx,%rax
   14012450b:	48 89 f7             	mov    %rsi,%rdi
   14012450e:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124515:	48 c1 ff 03          	sar    $0x3,%rdi
   140124519:	48 39 f0             	cmp    %rsi,%rax
   14012451c:	0f 82 9a 3e 00 00    	jb     1401283bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b5c>
   140124522:	c5 f9 6f 05 d6 04 23 	vmovdqa 0x2304d6(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124529:	00 
   14012452a:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124531:	4c 89 f2             	mov    %r14,%rdx
   140124534:	48 89 d9             	mov    %rbx,%rcx
   140124537:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012453e:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124545:	00 
   140124546:	e8 e5 6a fe ff       	call   14010b030 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   14012454b:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124552:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124559:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124560:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124567:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012456b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124572:	4c 01 f9             	add    %r15,%rcx
   140124575:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012457a:	4d 85 ed             	test   %r13,%r13
   14012457d:	74 0d                	je     14012458c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d2c>
   14012457f:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124584:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012458b:	00 
   14012458c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124593:	0f 84 57 36 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124599:	0f b6 01             	movzbl (%rcx),%eax
   14012459c:	48 8d 3d fd 3a 29 00 	lea    0x293afd(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401245a3:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401245a7:	45 31 e4             	xor    %r12d,%r12d
   1401245aa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401245ae:	ff e0                	jmp    *%rax
   1401245b0:	41 80 fc 02          	cmp    $0x2,%r12b
   1401245b4:	0f 84 d4 26 00 00    	je     140126c8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x742e>
   1401245ba:	41 80 fc 01          	cmp    $0x1,%r12b
   1401245be:	0f 84 00 48 00 00    	je     140128dc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9564>
   1401245c4:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401245cb:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401245d2:	c5 f8 77             	vzeroupper
   1401245d5:	48 29 d6             	sub    %rdx,%rsi
   1401245d8:	4c 29 fd             	sub    %r15,%rbp
   1401245db:	48 29 d0             	sub    %rdx,%rax
   1401245de:	48 89 f7             	mov    %rsi,%rdi
   1401245e1:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401245e8:	48 c1 ff 03          	sar    $0x3,%rdi
   1401245ec:	48 39 f0             	cmp    %rsi,%rax
   1401245ef:	0f 82 dc 3d 00 00    	jb     1401283d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b71>
   1401245f5:	c5 f9 6f 05 03 04 23 	vmovdqa 0x230403(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401245fc:	00 
   1401245fd:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124604:	4c 89 f2             	mov    %r14,%rdx
   140124607:	48 89 d9             	mov    %rbx,%rcx
   14012460a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124611:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124618:	00 
   140124619:	e8 f2 ba fd ff       	call   140100110 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   14012461e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124625:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012462c:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124633:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012463a:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012463e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124645:	4c 01 f9             	add    %r15,%rcx
   140124648:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012464d:	4d 85 ed             	test   %r13,%r13
   140124650:	74 0d                	je     14012465f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4dff>
   140124652:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124657:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   14012465e:	00 
   14012465f:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124666:	0f 84 84 35 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012466c:	0f b6 01             	movzbl (%rcx),%eax
   14012466f:	48 8d 3d 2a 3a 29 00 	lea    0x293a2a(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124676:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012467a:	45 31 e4             	xor    %r12d,%r12d
   14012467d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124681:	ff e0                	jmp    *%rax
   140124683:	41 80 fc 02          	cmp    $0x2,%r12b
   140124687:	0f 84 0d 29 00 00    	je     140126f9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x773a>
   14012468d:	41 80 fc 01          	cmp    $0x1,%r12b
   140124691:	0f 84 ca 43 00 00    	je     140128a61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9201>
   140124697:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   14012469e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401246a5:	c5 f8 77             	vzeroupper
   1401246a8:	48 29 d6             	sub    %rdx,%rsi
   1401246ab:	4c 29 fd             	sub    %r15,%rbp
   1401246ae:	48 29 d0             	sub    %rdx,%rax
   1401246b1:	48 89 f7             	mov    %rsi,%rdi
   1401246b4:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401246bb:	48 c1 ff 03          	sar    $0x3,%rdi
   1401246bf:	48 39 f0             	cmp    %rsi,%rax
   1401246c2:	0f 82 1e 3d 00 00    	jb     1401283e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b86>
   1401246c8:	c5 f9 6f 05 30 03 23 	vmovdqa 0x230330(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401246cf:	00 
   1401246d0:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401246d7:	4c 89 f2             	mov    %r14,%rdx
   1401246da:	48 89 d9             	mov    %rbx,%rcx
   1401246dd:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401246e4:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401246eb:	00 
   1401246ec:	e8 6f cb fd ff       	call   140101260 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   1401246f1:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401246f8:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401246ff:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124706:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012470d:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124711:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124718:	4c 01 f9             	add    %r15,%rcx
   14012471b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124720:	4d 85 ed             	test   %r13,%r13
   140124723:	74 0d                	je     140124732 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ed2>
   140124725:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012472a:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124731:	00 
   140124732:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124739:	0f 84 b1 34 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   14012473f:	0f b6 01             	movzbl (%rcx),%eax
   140124742:	48 8d 3d 57 39 29 00 	lea    0x293957(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124749:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012474d:	45 31 e4             	xor    %r12d,%r12d
   140124750:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124754:	ff e0                	jmp    *%rax
   140124756:	41 80 fc 02          	cmp    $0x2,%r12b
   14012475a:	0f 84 8a 23 00 00    	je     140126aea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x728a>
   140124760:	41 80 fc 01          	cmp    $0x1,%r12b
   140124764:	0f 84 8c 47 00 00    	je     140128ef6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9696>
   14012476a:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124771:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124778:	c5 f8 77             	vzeroupper
   14012477b:	48 29 d6             	sub    %rdx,%rsi
   14012477e:	4c 29 fd             	sub    %r15,%rbp
   140124781:	48 29 d0             	sub    %rdx,%rax
   140124784:	48 89 f7             	mov    %rsi,%rdi
   140124787:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012478e:	48 c1 ff 03          	sar    $0x3,%rdi
   140124792:	48 39 f0             	cmp    %rsi,%rax
   140124795:	0f 82 60 3c 00 00    	jb     1401283fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b9b>
   14012479b:	c5 f9 6f 05 5d 02 23 	vmovdqa 0x23025d(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401247a2:	00 
   1401247a3:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401247aa:	4c 89 f2             	mov    %r14,%rdx
   1401247ad:	48 89 d9             	mov    %rbx,%rcx
   1401247b0:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401247b7:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401247be:	00 
   1401247bf:	e8 3c c7 fd ff       	call   140100f00 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   1401247c4:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401247cb:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401247d2:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401247d9:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401247e0:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401247e4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401247eb:	4c 01 f9             	add    %r15,%rcx
   1401247ee:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401247f3:	4d 85 ed             	test   %r13,%r13
   1401247f6:	74 0d                	je     140124805 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fa5>
   1401247f8:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401247fd:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124804:	00 
   140124805:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012480c:	0f 84 de 33 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124812:	0f b6 01             	movzbl (%rcx),%eax
   140124815:	48 8d 3d 84 38 29 00 	lea    0x293884(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012481c:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124820:	45 31 e4             	xor    %r12d,%r12d
   140124823:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124827:	ff e0                	jmp    *%rax
   140124829:	41 80 fc 02          	cmp    $0x2,%r12b
   14012482d:	0f 84 ef 26 00 00    	je     140126f22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76c2>
   140124833:	41 80 fc 01          	cmp    $0x1,%r12b
   140124837:	0f 84 23 43 00 00    	je     140128b60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9300>
   14012483d:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124844:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012484b:	c5 f8 77             	vzeroupper
   14012484e:	48 29 d6             	sub    %rdx,%rsi
   140124851:	4c 29 fd             	sub    %r15,%rbp
   140124854:	48 29 d0             	sub    %rdx,%rax
   140124857:	48 89 f7             	mov    %rsi,%rdi
   14012485a:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124861:	48 c1 ff 03          	sar    $0x3,%rdi
   140124865:	48 39 f0             	cmp    %rsi,%rax
   140124868:	0f 82 a2 3b 00 00    	jb     140128410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bb0>
   14012486e:	c5 f9 6f 05 8a 01 23 	vmovdqa 0x23018a(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124875:	00 
   140124876:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012487d:	4c 89 f2             	mov    %r14,%rdx
   140124880:	48 89 d9             	mov    %rbx,%rcx
   140124883:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012488a:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124891:	00 
   140124892:	e8 89 70 fe ff       	call   14010b920 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140124897:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012489e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401248a5:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401248ac:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401248b3:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401248b7:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401248be:	4c 01 f9             	add    %r15,%rcx
   1401248c1:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401248c6:	4d 85 ed             	test   %r13,%r13
   1401248c9:	74 0d                	je     1401248d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5078>
   1401248cb:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401248d0:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401248d7:	00 
   1401248d8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401248df:	0f 84 0b 33 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401248e5:	0f b6 01             	movzbl (%rcx),%eax
   1401248e8:	48 8d 3d b1 37 29 00 	lea    0x2937b1(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401248ef:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401248f3:	45 31 e4             	xor    %r12d,%r12d
   1401248f6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401248fa:	ff e0                	jmp    *%rax
   1401248fc:	41 80 fc 02          	cmp    $0x2,%r12b
   140124900:	0f 84 2c 25 00 00    	je     140126e32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75d2>
   140124906:	41 80 fc 01          	cmp    $0x1,%r12b
   14012490a:	0f 84 1c 43 00 00    	je     140128c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93cc>
   140124910:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124917:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012491e:	c5 f8 77             	vzeroupper
   140124921:	48 29 d6             	sub    %rdx,%rsi
   140124924:	4c 29 fd             	sub    %r15,%rbp
   140124927:	48 29 d0             	sub    %rdx,%rax
   14012492a:	48 89 f7             	mov    %rsi,%rdi
   14012492d:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124934:	48 c1 ff 03          	sar    $0x3,%rdi
   140124938:	48 39 f0             	cmp    %rsi,%rax
   14012493b:	0f 82 40 39 00 00    	jb     140128281 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a21>
   140124941:	c5 f9 6f 05 b7 00 23 	vmovdqa 0x2300b7(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124948:	00 
   140124949:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124950:	4c 89 f2             	mov    %r14,%rdx
   140124953:	48 89 d9             	mov    %rbx,%rcx
   140124956:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012495d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124964:	00 
   140124965:	e8 06 e1 fd ff       	call   140102a70 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   14012496a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124971:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124978:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   14012497f:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124986:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   14012498a:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124991:	4c 01 f9             	add    %r15,%rcx
   140124994:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124999:	4d 85 ed             	test   %r13,%r13
   14012499c:	74 0d                	je     1401249ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x514b>
   14012499e:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401249a3:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401249aa:	00 
   1401249ab:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401249b2:	0f 84 38 32 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401249b8:	0f b6 01             	movzbl (%rcx),%eax
   1401249bb:	48 8d 3d de 36 29 00 	lea    0x2936de(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401249c2:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   1401249c6:	45 31 e4             	xor    %r12d,%r12d
   1401249c9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401249cd:	ff e0                	jmp    *%rax
   1401249cf:	41 80 fc 02          	cmp    $0x2,%r12b
   1401249d3:	0f 84 36 26 00 00    	je     14012700f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77af>
   1401249d9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401249dd:	0f 84 4b 40 00 00    	je     140128a2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91ce>
   1401249e3:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401249ea:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401249f1:	c5 f8 77             	vzeroupper
   1401249f4:	48 29 d6             	sub    %rdx,%rsi
   1401249f7:	4c 29 fd             	sub    %r15,%rbp
   1401249fa:	48 29 d0             	sub    %rdx,%rax
   1401249fd:	48 89 f7             	mov    %rsi,%rdi
   140124a00:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124a07:	48 c1 ff 03          	sar    $0x3,%rdi
   140124a0b:	48 39 f0             	cmp    %rsi,%rax
   140124a0e:	0f 82 33 3b 00 00    	jb     140128547 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ce7>
   140124a14:	c5 f9 6f 05 e4 ff 22 	vmovdqa 0x22ffe4(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124a1b:	00 
   140124a1c:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124a23:	4c 89 f2             	mov    %r14,%rdx
   140124a26:	48 89 d9             	mov    %rbx,%rcx
   140124a29:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124a30:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124a37:	00 
   140124a38:	e8 a3 a4 fd ff       	call   1400feee0 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140124a3d:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124a44:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124a4b:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124a52:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124a59:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124a5d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124a64:	4c 01 f9             	add    %r15,%rcx
   140124a67:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124a6c:	4d 85 ed             	test   %r13,%r13
   140124a6f:	74 0d                	je     140124a7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x521e>
   140124a71:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124a76:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124a7d:	00 
   140124a7e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124a85:	0f 84 65 31 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124a8b:	0f b6 01             	movzbl (%rcx),%eax
   140124a8e:	48 8d 3d 0b 36 29 00 	lea    0x29360b(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124a95:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124a99:	45 31 e4             	xor    %r12d,%r12d
   140124a9c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124aa0:	ff e0                	jmp    *%rax
   140124aa2:	41 80 fc 02          	cmp    $0x2,%r12b
   140124aa6:	0f 84 94 16 00 00    	je     140126140 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68e0>
   140124aac:	41 80 fc 01          	cmp    $0x1,%r12b
   140124ab0:	0f 84 ad 3d 00 00    	je     140128863 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9003>
   140124ab6:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124abd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124ac4:	c5 f8 77             	vzeroupper
   140124ac7:	48 29 d6             	sub    %rdx,%rsi
   140124aca:	4c 29 fd             	sub    %r15,%rbp
   140124acd:	48 29 d0             	sub    %rdx,%rax
   140124ad0:	48 89 f7             	mov    %rsi,%rdi
   140124ad3:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124ada:	48 c1 ff 03          	sar    $0x3,%rdi
   140124ade:	48 39 f0             	cmp    %rsi,%rax
   140124ae1:	0f 82 b4 3a 00 00    	jb     14012859b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d3b>
   140124ae7:	c5 f9 6f 05 11 ff 22 	vmovdqa 0x22ff11(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124aee:	00 
   140124aef:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124af6:	4c 89 f2             	mov    %r14,%rdx
   140124af9:	48 89 d9             	mov    %rbx,%rcx
   140124afc:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124b03:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124b0a:	00 
   140124b0b:	e8 e0 d8 fd ff       	call   1401023f0 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   140124b10:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124b17:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124b1e:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124b25:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124b2c:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124b30:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124b37:	4c 01 f9             	add    %r15,%rcx
   140124b3a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124b3f:	4d 85 ed             	test   %r13,%r13
   140124b42:	74 0d                	je     140124b51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52f1>
   140124b44:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124b49:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124b50:	00 
   140124b51:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124b58:	0f 84 92 30 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124b5e:	0f b6 01             	movzbl (%rcx),%eax
   140124b61:	48 8d 3d 38 35 29 00 	lea    0x293538(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124b68:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124b6c:	45 31 e4             	xor    %r12d,%r12d
   140124b6f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124b73:	ff e0                	jmp    *%rax
   140124b75:	41 80 fc 02          	cmp    $0x2,%r12b
   140124b79:	0f 84 fd 15 00 00    	je     14012617c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x691c>
   140124b7f:	41 80 fc 01          	cmp    $0x1,%r12b
   140124b83:	0f 84 40 3d 00 00    	je     1401288c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9069>
   140124b89:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124b90:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124b97:	c5 f8 77             	vzeroupper
   140124b9a:	48 29 d6             	sub    %rdx,%rsi
   140124b9d:	4c 29 fd             	sub    %r15,%rbp
   140124ba0:	48 29 d0             	sub    %rdx,%rax
   140124ba3:	48 89 f7             	mov    %rsi,%rdi
   140124ba6:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124bad:	48 c1 ff 03          	sar    $0x3,%rdi
   140124bb1:	48 39 f0             	cmp    %rsi,%rax
   140124bb4:	0f 82 f6 39 00 00    	jb     1401285b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d50>
   140124bba:	c5 f9 6f 05 3e fe 22 	vmovdqa 0x22fe3e(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124bc1:	00 
   140124bc2:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124bc9:	4c 89 f2             	mov    %r14,%rdx
   140124bcc:	48 89 d9             	mov    %rbx,%rcx
   140124bcf:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124bd6:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124bdd:	00 
   140124bde:	e8 bd e7 fd ff       	call   1401033a0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   140124be3:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124bea:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124bf1:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124bf8:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124bff:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124c03:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124c0a:	4c 01 f9             	add    %r15,%rcx
   140124c0d:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124c12:	4d 85 ed             	test   %r13,%r13
   140124c15:	74 0d                	je     140124c24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53c4>
   140124c17:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124c1c:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124c23:	00 
   140124c24:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124c2b:	0f 84 bf 2f 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124c31:	0f b6 01             	movzbl (%rcx),%eax
   140124c34:	48 8d 3d 65 34 29 00 	lea    0x293465(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c3b:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124c3f:	45 31 e4             	xor    %r12d,%r12d
   140124c42:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124c46:	ff e0                	jmp    *%rax
   140124c48:	41 80 fc 02          	cmp    $0x2,%r12b
   140124c4c:	0f 84 20 1e 00 00    	je     140126a72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7212>
   140124c52:	41 80 fc 01          	cmp    $0x1,%r12b
   140124c56:	0f 84 cd 42 00 00    	je     140128f29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140124c5c:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124c63:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124c6a:	c5 f8 77             	vzeroupper
   140124c6d:	48 29 d6             	sub    %rdx,%rsi
   140124c70:	4c 29 fd             	sub    %r15,%rbp
   140124c73:	48 29 d0             	sub    %rdx,%rax
   140124c76:	48 89 f7             	mov    %rsi,%rdi
   140124c79:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124c80:	48 c1 ff 03          	sar    $0x3,%rdi
   140124c84:	48 39 f0             	cmp    %rsi,%rax
   140124c87:	0f 82 3c 38 00 00    	jb     1401284c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c69>
   140124c8d:	c5 f9 6f 05 6b fd 22 	vmovdqa 0x22fd6b(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124c94:	00 
   140124c95:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124c9c:	4c 89 f2             	mov    %r14,%rdx
   140124c9f:	48 89 d9             	mov    %rbx,%rcx
   140124ca2:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124ca9:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124cb0:	00 
   140124cb1:	e8 2a a5 fd ff       	call   1400ff1e0 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   140124cb6:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124cbd:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124cc4:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124ccb:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124cd2:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124cd6:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124cdd:	4c 01 f9             	add    %r15,%rcx
   140124ce0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124ce5:	4d 85 ed             	test   %r13,%r13
   140124ce8:	74 0d                	je     140124cf7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5497>
   140124cea:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124cef:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124cf6:	00 
   140124cf7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124cfe:	0f 84 ec 2e 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124d04:	0f b6 01             	movzbl (%rcx),%eax
   140124d07:	48 8d 3d 92 33 29 00 	lea    0x293392(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d0e:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124d12:	45 31 e4             	xor    %r12d,%r12d
   140124d15:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124d19:	ff e0                	jmp    *%rax
   140124d1b:	41 80 fc 02          	cmp    $0x2,%r12b
   140124d1f:	0f 84 89 1d 00 00    	je     140126aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x724e>
   140124d25:	41 80 fc 01          	cmp    $0x1,%r12b
   140124d29:	0f 84 d1 3a 00 00    	je     140128800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fa0>
   140124d2f:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124d36:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124d3d:	c5 f8 77             	vzeroupper
   140124d40:	48 29 d6             	sub    %rdx,%rsi
   140124d43:	4c 29 fd             	sub    %r15,%rbp
   140124d46:	48 29 d0             	sub    %rdx,%rax
   140124d49:	48 89 f7             	mov    %rsi,%rdi
   140124d4c:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124d53:	48 c1 ff 03          	sar    $0x3,%rdi
   140124d57:	48 39 f0             	cmp    %rsi,%rax
   140124d5a:	0f 82 7a 38 00 00    	jb     1401285da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d7a>
   140124d60:	c5 f9 6f 05 98 fc 22 	vmovdqa 0x22fc98(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124d67:	00 
   140124d68:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124d6f:	4c 89 f2             	mov    %r14,%rdx
   140124d72:	48 89 d9             	mov    %rbx,%rcx
   140124d75:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124d7c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124d83:	00 
   140124d84:	e8 57 a7 fd ff       	call   1400ff4e0 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   140124d89:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124d90:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124d97:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124d9e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124da5:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124da9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124db0:	4c 01 f9             	add    %r15,%rcx
   140124db3:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124db8:	4d 85 ed             	test   %r13,%r13
   140124dbb:	74 0d                	je     140124dca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x556a>
   140124dbd:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124dc2:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124dc9:	00 
   140124dca:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124dd1:	0f 84 19 2e 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124dd7:	0f b6 01             	movzbl (%rcx),%eax
   140124dda:	48 8d 3d bf 32 29 00 	lea    0x2932bf(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124de1:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124de5:	45 31 e4             	xor    %r12d,%r12d
   140124de8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124dec:	ff e0                	jmp    *%rax
   140124dee:	41 80 fc 02          	cmp    $0x2,%r12b
   140124df2:	0f 84 8f 22 00 00    	je     140127087 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7827>
   140124df8:	41 80 fc 01          	cmp    $0x1,%r12b
   140124dfc:	0f 84 90 3e 00 00    	je     140128c92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9432>
   140124e02:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124e09:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124e10:	c5 f8 77             	vzeroupper
   140124e13:	48 29 d6             	sub    %rdx,%rsi
   140124e16:	4c 29 fd             	sub    %r15,%rbp
   140124e19:	48 29 d0             	sub    %rdx,%rax
   140124e1c:	48 89 f7             	mov    %rsi,%rdi
   140124e1f:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124e26:	48 c1 ff 03          	sar    $0x3,%rdi
   140124e2a:	48 39 f0             	cmp    %rsi,%rax
   140124e2d:	0f 82 c0 36 00 00    	jb     1401284f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c93>
   140124e33:	c5 f9 6f 05 c5 fb 22 	vmovdqa 0x22fbc5(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124e3a:	00 
   140124e3b:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124e42:	4c 89 f2             	mov    %r14,%rdx
   140124e45:	48 89 d9             	mov    %rbx,%rcx
   140124e48:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124e4f:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124e56:	00 
   140124e57:	e8 84 97 fd ff       	call   1400fe5e0 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   140124e5c:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124e63:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124e6a:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124e71:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124e78:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124e7c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124e83:	4c 01 f9             	add    %r15,%rcx
   140124e86:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124e8b:	4d 85 ed             	test   %r13,%r13
   140124e8e:	74 0d                	je     140124e9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x563d>
   140124e90:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124e95:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124e9c:	00 
   140124e9d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124ea4:	0f 84 46 2d 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124eaa:	0f b6 01             	movzbl (%rcx),%eax
   140124ead:	48 8d 3d ec 31 29 00 	lea    0x2931ec(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124eb4:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124eb8:	45 31 e4             	xor    %r12d,%r12d
   140124ebb:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124ebf:	ff e0                	jmp    *%rax
   140124ec1:	41 80 fc 02          	cmp    $0x2,%r12b
   140124ec5:	0f 84 ac 22 00 00    	je     140127177 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7917>
   140124ecb:	41 80 fc 01          	cmp    $0x1,%r12b
   140124ecf:	0f 84 23 3e 00 00    	je     140128cf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9498>
   140124ed5:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124edc:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124ee3:	c5 f8 77             	vzeroupper
   140124ee6:	48 29 d6             	sub    %rdx,%rsi
   140124ee9:	4c 29 fd             	sub    %r15,%rbp
   140124eec:	48 29 d0             	sub    %rdx,%rax
   140124eef:	48 89 f7             	mov    %rsi,%rdi
   140124ef2:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124ef9:	48 c1 ff 03          	sar    $0x3,%rdi
   140124efd:	48 39 f0             	cmp    %rsi,%rax
   140124f00:	0f 82 5a 35 00 00    	jb     140128460 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c00>
   140124f06:	c5 f9 6f 05 f2 fa 22 	vmovdqa 0x22faf2(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124f0d:	00 
   140124f0e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124f15:	4c 89 f2             	mov    %r14,%rdx
   140124f18:	48 89 d9             	mov    %rbx,%rcx
   140124f1b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124f22:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124f29:	00 
   140124f2a:	e8 61 77 fe ff       	call   14010c690 <setun::VM::handle_get_field(setun::Chunk const&)>
   140124f2f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124f36:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124f3d:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140124f44:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124f4b:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140124f4f:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124f56:	4c 01 f9             	add    %r15,%rcx
   140124f59:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140124f5e:	4d 85 ed             	test   %r13,%r13
   140124f61:	74 0d                	je     140124f70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5710>
   140124f63:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   140124f68:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140124f6f:	00 
   140124f70:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124f77:	0f 84 73 2c 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140124f7d:	0f b6 01             	movzbl (%rcx),%eax
   140124f80:	48 8d 3d 19 31 29 00 	lea    0x293119(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f87:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140124f8b:	45 31 e4             	xor    %r12d,%r12d
   140124f8e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124f92:	ff e0                	jmp    *%rax
   140124f94:	41 80 fc 02          	cmp    $0x2,%r12b
   140124f98:	0f 84 48 1f 00 00    	je     140126ee6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7686>
   140124f9e:	41 80 fc 01          	cmp    $0x1,%r12b
   140124fa2:	0f 84 1a 40 00 00    	je     140128fc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9762>
   140124fa8:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140124faf:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124fb6:	c5 f8 77             	vzeroupper
   140124fb9:	48 29 d6             	sub    %rdx,%rsi
   140124fbc:	4c 29 fd             	sub    %r15,%rbp
   140124fbf:	48 29 d0             	sub    %rdx,%rax
   140124fc2:	48 89 f7             	mov    %rsi,%rdi
   140124fc5:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140124fcc:	48 c1 ff 03          	sar    $0x3,%rdi
   140124fd0:	48 39 f0             	cmp    %rsi,%rax
   140124fd3:	0f 82 05 35 00 00    	jb     1401284de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c7e>
   140124fd9:	c5 f9 6f 05 1f fa 22 	vmovdqa 0x22fa1f(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140124fe0:	00 
   140124fe1:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124fe8:	4c 89 f2             	mov    %r14,%rdx
   140124feb:	48 89 d9             	mov    %rbx,%rcx
   140124fee:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124ff5:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124ffc:	00 
   140124ffd:	e8 4e a1 fe ff       	call   14010f150 <setun::VM::handle_new_instance(setun::Chunk const&)>
   140125002:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125009:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125010:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   140125017:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012501e:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   140125022:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125029:	4c 01 f9             	add    %r15,%rcx
   14012502c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125031:	4d 85 ed             	test   %r13,%r13
   140125034:	74 0d                	je     140125043 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57e3>
   140125036:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012503b:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125042:	00 
   140125043:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012504a:	0f 84 a0 2b 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140125050:	0f b6 01             	movzbl (%rcx),%eax
   140125053:	48 8d 3d 46 30 29 00 	lea    0x293046(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012505a:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   14012505e:	45 31 e4             	xor    %r12d,%r12d
   140125061:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125065:	ff e0                	jmp    *%rax
   140125067:	41 80 fc 02          	cmp    $0x2,%r12b
   14012506b:	0f 84 8e 20 00 00    	je     1401270ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x789f>
   140125071:	41 80 fc 01          	cmp    $0x1,%r12b
   140125075:	0f 84 7f 3a 00 00    	je     140128afa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x929a>
   14012507b:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125082:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125089:	c5 f8 77             	vzeroupper
   14012508c:	48 29 d6             	sub    %rdx,%rsi
   14012508f:	4c 29 fd             	sub    %r15,%rbp
   140125092:	48 29 d0             	sub    %rdx,%rax
   140125095:	48 89 f7             	mov    %rsi,%rdi
   140125098:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   14012509f:	48 c1 ff 03          	sar    $0x3,%rdi
   1401250a3:	48 39 f0             	cmp    %rsi,%rax
   1401250a6:	0f 82 ff 31 00 00    	jb     1401282ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a4b>
   1401250ac:	c5 f9 6f 05 4c f9 22 	vmovdqa 0x22f94c(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   1401250b3:	00 
   1401250b4:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401250bb:	4c 89 f2             	mov    %r14,%rdx
   1401250be:	48 89 d9             	mov    %rbx,%rcx
   1401250c1:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401250c8:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401250cf:	00 
   1401250d0:	e8 db 99 fe ff       	call   14010eab0 <setun::VM::handle_set_field(setun::Chunk const&)>
   1401250d5:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401250dc:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401250e3:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401250ea:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401250f1:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401250f5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401250fc:	4c 01 f9             	add    %r15,%rcx
   1401250ff:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140125104:	4d 85 ed             	test   %r13,%r13
   140125107:	74 0d                	je     140125116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58b6>
   140125109:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   14012510e:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   140125115:	00 
   140125116:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012511d:	0f 84 cd 2a 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   140125123:	0f b6 01             	movzbl (%rcx),%eax
   140125126:	48 8d 3d 73 2f 29 00 	lea    0x292f73(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012512d:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125131:	45 31 e4             	xor    %r12d,%r12d
   140125134:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125138:	ff e0                	jmp    *%rax
   14012513a:	41 80 fc 02          	cmp    $0x2,%r12b
   14012513e:	0f 84 7b 12 00 00    	je     1401263bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b5f>
   140125144:	41 80 fc 01          	cmp    $0x1,%r12b
   140125148:	0f 84 10 3c 00 00    	je     140128d5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94fe>
   14012514e:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125155:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012515c:	c5 f8 77             	vzeroupper
   14012515f:	48 29 d6             	sub    %rdx,%rsi
   140125162:	4c 29 fd             	sub    %r15,%rbp
   140125165:	48 29 d0             	sub    %rdx,%rax
   140125168:	48 89 f7             	mov    %rsi,%rdi
   14012516b:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125172:	48 c1 ff 03          	sar    $0x3,%rdi
   140125176:	48 39 f0             	cmp    %rsi,%rax
   140125179:	0f 82 20 33 00 00    	jb     14012849f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c3f>
   14012517f:	c5 f9 6f 05 79 f8 22 	vmovdqa 0x22f879(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140125186:	00 
   140125187:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012518e:	4c 89 f2             	mov    %r14,%rdx
   140125191:	48 89 d9             	mov    %rbx,%rcx
   140125194:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012519b:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401251a2:	00 
   1401251a3:	e8 d8 c6 fe ff       	call   140111880 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   1401251a8:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401251af:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   1401251b6:	48 8b 8b 38 10 00 00 	mov    0x1038(%rbx),%rcx
   1401251bd:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401251c4:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   1401251c8:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401251cf:	4c 01 f9             	add    %r15,%rcx
   1401251d2:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401251d7:	4d 85 ed             	test   %r13,%r13
   1401251da:	74 0d                	je     1401251e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5989>
   1401251dc:	4f 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%r8
   1401251e1:	4e 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%r8,8),%r13
   1401251e8:	00 
   1401251e9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401251f0:	0f 84 fa 29 00 00    	je     140127bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8390>
   1401251f6:	0f b6 01             	movzbl (%rcx),%eax
   1401251f9:	48 8d 3d a0 2e 29 00 	lea    0x292ea0(%rip),%rdi        # 1403b80a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125200:	48 8d 69 01          	lea    0x1(%rcx),%rbp
   140125204:	45 31 e4             	xor    %r12d,%r12d
   140125207:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012520b:	ff e0                	jmp    *%rax
   14012520d:	41 80 fc 02          	cmp    $0x2,%r12b
   140125211:	0f 84 e4 11 00 00    	je     1401263fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b9b>
   140125217:	41 80 fc 01          	cmp    $0x1,%r12b
   14012521b:	0f 84 6e 3d 00 00    	je     140128f8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x972f>
   140125221:	48 8b 93 48 10 00 00 	mov    0x1048(%rbx),%rdx
   140125228:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012522f:	c5 f8 77             	vzeroupper
   140125232:	48 29 d6             	sub    %rdx,%rsi
   140125235:	4c 29 fd             	sub    %r15,%rbp
   140125238:	48 29 d0             	sub    %rdx,%rax
   14012523b:	48 89 f7             	mov    %rsi,%rdi
   14012523e:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   140125245:	48 c1 ff 03          	sar    $0x3,%rdi
   140125249:	48 39 f0             	cmp    %rsi,%rax
   14012524c:	0f 82 62 32 00 00    	jb     1401284b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c54>
   140125252:	c5 f9 6f 05 a6 f7 22 	vmovdqa 0x22f7a6(%rip),%xmm0        # 140354a00 <CSWTCH.2806+0x1c0>
   140125259:	00 
   14012525a:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125261:	4c 89 f2             	mov    %r14,%rdx
   140125264:	48 89 d9             	mov    %rbx,%rcx
   140125267:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
