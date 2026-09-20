00000001401219a0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   1401219a0:	41 57                	push   %r15
   1401219a2:	41 56                	push   %r14
   1401219a4:	41 55                	push   %r13
   1401219a6:	41 54                	push   %r12
   1401219a8:	55                   	push   %rbp
   1401219a9:	57                   	push   %rdi
   1401219aa:	56                   	push   %rsi
   1401219ab:	53                   	push   %rbx
   1401219ac:	48 81 ec 58 09 00 00 	sub    $0x958,%rsp
   1401219b3:	c5 f8 29 b4 24 b0 08 	vmovaps %xmm6,0x8b0(%rsp)
   1401219ba:	00 00 
   1401219bc:	c5 f8 29 bc 24 c0 08 	vmovaps %xmm7,0x8c0(%rsp)
   1401219c3:	00 00 
   1401219c5:	c5 78 29 84 24 d0 08 	vmovaps %xmm8,0x8d0(%rsp)
   1401219cc:	00 00 
   1401219ce:	c5 78 29 8c 24 e0 08 	vmovaps %xmm9,0x8e0(%rsp)
   1401219d5:	00 00 
   1401219d7:	c5 78 29 94 24 f0 08 	vmovaps %xmm10,0x8f0(%rsp)
   1401219de:	00 00 
   1401219e0:	c5 78 29 9c 24 00 09 	vmovaps %xmm11,0x900(%rsp)
   1401219e7:	00 00 
   1401219e9:	c5 78 29 a4 24 10 09 	vmovaps %xmm12,0x910(%rsp)
   1401219f0:	00 00 
   1401219f2:	c5 78 29 ac 24 20 09 	vmovaps %xmm13,0x920(%rsp)
   1401219f9:	00 00 
   1401219fb:	c5 78 29 b4 24 30 09 	vmovaps %xmm14,0x930(%rsp)
   140121a02:	00 00 
   140121a04:	c5 78 29 bc 24 40 09 	vmovaps %xmm15,0x940(%rsp)
   140121a0b:	00 00 
   140121a0d:	48 8b 42 08          	mov    0x8(%rdx),%rax
   140121a11:	48 8b 3a             	mov    (%rdx),%rdi
   140121a14:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140121a19:	48 89 cb             	mov    %rcx,%rbx
   140121a1c:	49 89 d7             	mov    %rdx,%r15
   140121a1f:	48 29 f8             	sub    %rdi,%rax
   140121a22:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
   140121a27:	48 39 81 38 10 00 00 	cmp    %rax,0x1038(%rcx)
   140121a2e:	72 0b                	jb     140121a3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b>
   140121a30:	48 c7 81 38 10 00 00 	movq   $0x0,0x1038(%rcx)
   140121a37:	00 00 00 00 
   140121a3b:	48 8b b3 c8 52 01 00 	mov    0x152c8(%rbx),%rsi
   140121a42:	c6 83 40 10 00 00 01 	movb   $0x1,0x1040(%rbx)
   140121a49:	48 85 f6             	test   %rsi,%rsi
   140121a4c:	0f 84 ce 02 00 00    	je     140121d20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x380>
   140121a52:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140121a59:	0f 84 c1 02 00 00    	je     140121d20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x380>
   140121a5f:	48 8b 86 e0 00 00 00 	mov    0xe0(%rsi),%rax
   140121a66:	48 39 86 d8 00 00 00 	cmp    %rax,0xd8(%rsi)
   140121a6d:	0f 85 dd 0a 00 00    	jne    140122550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb0>
   140121a73:	49 8b 87 88 00 00 00 	mov    0x88(%r15),%rax
   140121a7a:	49 2b 87 80 00 00 00 	sub    0x80(%r15),%rax
   140121a81:	ba 80 00 00 00       	mov    $0x80,%edx
   140121a86:	48 8d 8e d8 00 00 00 	lea    0xd8(%rsi),%rcx
   140121a8d:	48 c1 f8 02          	sar    $0x2,%rax
   140121a91:	48 83 c0 10          	add    $0x10,%rax
   140121a95:	48 3d 80 00 00 00    	cmp    $0x80,%rax
   140121a9b:	76 0b                	jbe    140121aa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108>
   140121a9d:	0f 1f 00             	nopl   (%rax)
   140121aa0:	48 01 d2             	add    %rdx,%rdx
   140121aa3:	48 39 c2             	cmp    %rax,%rdx
   140121aa6:	72 f8                	jb     140121aa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100>
   140121aa8:	8b 86 8c 00 00 00    	mov    0x8c(%rsi),%eax
   140121aae:	44 8b 8e 88 00 00 00 	mov    0x88(%rsi),%r9d
   140121ab5:	41 b8 80 00 00 00    	mov    $0x80,%r8d
   140121abb:	89 44 24 28          	mov    %eax,0x28(%rsp)
   140121abf:	8b 86 90 00 00 00    	mov    0x90(%rsi),%eax
   140121ac5:	89 44 24 20          	mov    %eax,0x20(%rsp)
   140121ac9:	e8 32 c2 07 00       	call   14019dd00 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   140121ace:	c5 fa 6f 8e d8 00 00 	vmovdqu 0xd8(%rsi),%xmm1
   140121ad5:	00 
   140121ad6:	c5 fa 6f 86 e8 00 00 	vmovdqu 0xe8(%rsi),%xmm0
   140121add:	00 
   140121ade:	c4 e3 79 0e d1 0f    	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140121ae4:	c4 e1 f9 7e c8       	vmovq  %xmm1,%rax
   140121ae9:	c4 e3 f9 16 c1 01    	vpextrq $0x1,%xmm0,%rcx
   140121aef:	c5 fa 7f 93 d8 52 01 	vmovdqu %xmm2,0x152d8(%rbx)
   140121af6:	00 
   140121af7:	48 8b 96 e0 00 00 00 	mov    0xe0(%rsi),%rdx
   140121afe:	49 8b 6f 58          	mov    0x58(%r15),%rbp
   140121b02:	48 29 c2             	sub    %rax,%rdx
   140121b05:	48 8b 86 f8 00 00 00 	mov    0xf8(%rsi),%rax
   140121b0c:	48 c1 fa 05          	sar    $0x5,%rdx
   140121b10:	48 29 c8             	sub    %rcx,%rax
   140121b13:	48 89 93 e8 52 01 00 	mov    %rdx,0x152e8(%rbx)
   140121b1a:	48 c1 f8 05          	sar    $0x5,%rax
   140121b1e:	48 83 fa 01          	cmp    $0x1,%rdx
   140121b22:	48 83 d2 ff          	adc    $0xffffffffffffffff,%rdx
   140121b26:	48 83 f8 01          	cmp    $0x1,%rax
   140121b2a:	48 89 83 f0 52 01 00 	mov    %rax,0x152f0(%rbx)
   140121b31:	48 83 d0 ff          	adc    $0xffffffffffffffff,%rax
   140121b35:	48 89 93 f8 52 01 00 	mov    %rdx,0x152f8(%rbx)
   140121b3c:	48 89 83 00 53 01 00 	mov    %rax,0x15300(%rbx)
   140121b43:	48 85 ed             	test   %rbp,%rbp
   140121b46:	0f 84 f9 00 00 00    	je     140121c45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5>
   140121b4c:	48 8b 3d dd 9e 23 00 	mov    0x239edd(%rip),%rdi        # 14035ba30 <CSWTCH.3340+0x210>
   140121b53:	4c 8d b3 00 10 00 00 	lea    0x1000(%rbx),%r14
   140121b5a:	b9 88 00 00 00       	mov    $0x88,%ecx
   140121b5f:	4c 8d 65 08          	lea    0x8(%rbp),%r12
   140121b63:	e8 d8 59 21 00       	call   140337540 <operator new(unsigned long long)>
   140121b68:	c5 d9 ef e4          	vpxor  %xmm4,%xmm4,%xmm4
   140121b6c:	4c 89 e2             	mov    %r12,%rdx
   140121b6f:	48 89 c6             	mov    %rax,%rsi
   140121b72:	48 89 78 08          	mov    %rdi,0x8(%rax)
   140121b76:	48 8d 05 c3 8f 25 00 	lea    0x258fc3(%rip),%rax        # 14037ab40 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140121b7d:	48 89 06             	mov    %rax,(%rsi)
   140121b80:	48 8d 46 20          	lea    0x20(%rsi),%rax
   140121b84:	4c 8d 6e 10          	lea    0x10(%rsi),%r13
   140121b88:	c5 fe 7f 66 10       	vmovdqu %ymm4,0x10(%rsi)
   140121b8d:	4c 89 e9             	mov    %r13,%rcx
   140121b90:	48 89 46 10          	mov    %rax,0x10(%rsi)
   140121b94:	48 8d 46 40          	lea    0x40(%rsi),%rax
   140121b98:	c5 fe 7f 66 30       	vmovdqu %ymm4,0x30(%rsi)
   140121b9d:	48 89 46 30          	mov    %rax,0x30(%rsi)
   140121ba1:	48 8d 86 80 00 00 00 	lea    0x80(%rsi),%rax
   140121ba8:	c5 fe 7f 66 68       	vmovdqu %ymm4,0x68(%rsi)
   140121bad:	48 89 46 50          	mov    %rax,0x50(%rsi)
   140121bb1:	48 c7 46 58 01 00 00 	movq   $0x1,0x58(%rsi)
   140121bb8:	00 
   140121bb9:	48 c7 46 60 00 00 00 	movq   $0x0,0x60(%rsi)
   140121bc0:	00 
   140121bc1:	48 c7 46 70 00 00 80 	movq   $0x3f800000,0x70(%rsi)
   140121bc8:	3f 
   140121bc9:	c5 f8 77             	vzeroupper
   140121bcc:	e8 8f cf 1c 00       	call   1402eeb60 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140121bd1:	48 8d 55 28          	lea    0x28(%rbp),%rdx
   140121bd5:	48 8d 4e 50          	lea    0x50(%rsi),%rcx
   140121bd9:	48 39 ca             	cmp    %rcx,%rdx
   140121bdc:	74 05                	je     140121be3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x243>
   140121bde:	e8 8d c0 17 00       	call   14029dc70 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140121be3:	4c 89 e2             	mov    %r12,%rdx
   140121be6:	4c 89 f1             	mov    %r14,%rcx
   140121be9:	e8 72 da 1f 00       	call   14031f660 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140121bee:	4c 89 28             	mov    %r13,(%rax)
   140121bf1:	48 39 70 08          	cmp    %rsi,0x8(%rax)
   140121bf5:	74 39                	je     140121c30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x290>
   140121bf7:	f0 83 46 08 01       	lock addl $0x1,0x8(%rsi)
   140121bfc:	4c 8b 60 08          	mov    0x8(%rax),%r12
   140121c00:	4d 85 e4             	test   %r12,%r12
   140121c03:	74 27                	je     140121c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28c>
   140121c05:	4d 8b 44 24 08       	mov    0x8(%r12),%r8
   140121c0a:	49 8d 54 24 08       	lea    0x8(%r12),%rdx
   140121c0f:	48 b9 01 00 00 00 01 	movabs $0x100000001,%rcx
   140121c16:	00 00 00 
   140121c19:	49 39 c8             	cmp    %rcx,%r8
   140121c1c:	0f 84 3e 0a 00 00    	je     140122660 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc0>
   140121c22:	f0 83 2a 01          	lock subl $0x1,(%rdx)
   140121c26:	0f 84 77 0a 00 00    	je     1401226a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd03>
   140121c2c:	48 89 70 08          	mov    %rsi,0x8(%rax)
   140121c30:	48 89 f1             	mov    %rsi,%rcx
   140121c33:	e8 08 51 1b 00       	call   1402d6d40 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140121c38:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
   140121c3c:	48 85 ed             	test   %rbp,%rbp
   140121c3f:	0f 85 15 ff ff ff    	jne    140121b5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ba>
   140121c45:	49 8b 3f             	mov    (%r15),%rdi
   140121c48:	48 8b ab 38 10 00 00 	mov    0x1038(%rbx),%rbp
   140121c4f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121c56:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
   140121c5b:	48 01 fd             	add    %rdi,%rbp
   140121c5e:	49 8b 7f 08          	mov    0x8(%r15),%rdi
   140121c62:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   140121c67:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140121c6e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140121c75:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140121c79:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140121c80:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140121c85:	4d 85 ed             	test   %r13,%r13
   140121c88:	0f 85 ba 00 00 00    	jne    140121d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a8>
   140121c8e:	49 8b 87 b0 00 00 00 	mov    0xb0(%r15),%rax
   140121c95:	ba 20 00 00 00       	mov    $0x20,%edx
   140121c9a:	48 39 d0             	cmp    %rdx,%rax
   140121c9d:	48 0f 42 c2          	cmovb  %rdx,%rax
   140121ca1:	80 3d d8 d3 29 00 00 	cmpb   $0x0,0x29d3d8(%rip)        # 1403bf080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140121ca8:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140121caf:	0f 84 c2 00 00 00    	je     140121d77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d7>
   140121cb5:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140121cbc:	00 fb ff 
   140121cbf:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140121cc6:	00 
   140121cc7:	0f b6 83 40 10 00 00 	movzbl 0x1040(%rbx),%eax
   140121cce:	83 f0 01             	xor    $0x1,%eax
   140121cd1:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140121cd6:	0f 93 c2             	setae  %dl
   140121cd9:	08 d0                	or     %dl,%al
   140121cdb:	0f 85 8f 08 00 00    	jne    140122570 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd0>
   140121ce1:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140121ce8:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140121cef:	01 
   140121cf0:	48 85 c9             	test   %rcx,%rcx
   140121cf3:	0f 85 93 09 00 00    	jne    14012268c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcec>
   140121cf9:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140121cfd:	48 8d 3d 9c d3 29 00 	lea    0x29d39c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140121d04:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140121d08:	45 31 e4             	xor    %r12d,%r12d
   140121d0b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140121d0f:	48 bf 00 00 00 00 00 	movabs $0xfffb000000000000,%rdi
   140121d16:	00 fb ff 
   140121d19:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   140121d1e:	ff e0                	jmp    *%rax
   140121d20:	49 8b 6f 58          	mov    0x58(%r15),%rbp
   140121d24:	48 85 ed             	test   %rbp,%rbp
   140121d27:	0f 85 1f fe ff ff    	jne    140121b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ac>
   140121d2d:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140121d32:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140121d39:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140121d40:	e9 22 ff ff ff       	jmp    140121c67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c7>
   140121d45:	0f 1f 00             	nopl   (%rax)
   140121d48:	4b 8d 44 ad 00       	lea    0x0(%r13,%r13,4),%rax
   140121d4d:	4c 8b ac c3 a0 10 00 	mov    0x10a0(%rbx,%rax,8),%r13
   140121d54:	00 
   140121d55:	48 8b bc c3 b0 10 00 	mov    0x10b0(%rbx,%rax,8),%rdi
   140121d5c:	00 
   140121d5d:	4c 01 ef             	add    %r13,%rdi
   140121d60:	80 3d 19 d3 29 00 00 	cmpb   $0x0,0x29d319(%rip)        # 1403bf080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140121d67:	48 89 f8             	mov    %rdi,%rax
   140121d6a:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140121d71:	0f 85 3e ff ff ff    	jne    140121cb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x315>
   140121d77:	48 8d 3d d0 3c 00 00 	lea    0x3cd0(%rip),%rdi        # 140125a4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40ae>
   140121d7e:	48 8d 05 bd 56 00 00 	lea    0x56bd(%rip),%rax        # 140127442 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aa2>
   140121d85:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121d8a:	48 8d 3d aa 4b 00 00 	lea    0x4baa(%rip),%rdi        # 14012693b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f9b>
   140121d91:	48 8d 15 58 65 00 00 	lea    0x6558(%rip),%rdx        # 1401282f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6950>
   140121d98:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121d9e:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121da3:	48 8d 05 0c 3d 00 00 	lea    0x3d0c(%rip),%rax        # 140125ab6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4116>
   140121daa:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121db0:	48 8d 3d ee 2e 00 00 	lea    0x2eee(%rip),%rdi        # 140124ca5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3305>
   140121db7:	48 8d 05 c0 50 00 00 	lea    0x50c0(%rip),%rax        # 140126e7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54de>
   140121dbe:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121dc4:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121dc9:	48 8d 3d 05 4b 00 00 	lea    0x4b05(%rip),%rdi        # 1401268d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f35>
   140121dd0:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121dd6:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121ddb:	48 8d 05 f9 55 00 00 	lea    0x55f9(%rip),%rax        # 1401273db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a3b>
   140121de2:	c5 fe 7f 94 24 30 01 	vmovdqu %ymm2,0x130(%rsp)
   140121de9:	00 00 
   140121deb:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121df1:	48 8d 3d b1 35 00 00 	lea    0x35b1(%rip),%rdi        # 1401253a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a09>
   140121df8:	48 8d 05 9b 41 00 00 	lea    0x419b(%rip),%rax        # 140125f9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45fa>
   140121dff:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121e05:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121e0a:	48 8d 3d 9c 4f 00 00 	lea    0x4f9c(%rip),%rdi        # 140126dad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x540d>
   140121e11:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121e17:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121e1c:	48 8d 05 24 5a 00 00 	lea    0x5a24(%rip),%rax        # 140127847 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ea7>
   140121e23:	c5 fe 7f 94 24 10 01 	vmovdqu %ymm2,0x110(%rsp)
   140121e2a:	00 00 
   140121e2c:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121e32:	48 8d 3d 3a 15 00 00 	lea    0x153a(%rip),%rdi        # 140123373 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19d3>
   140121e39:	48 8d 05 0f 1f 00 00 	lea    0x1f0f(%rip),%rax        # 140123d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23af>
   140121e40:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121e46:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121e4b:	48 8d 3d 69 40 00 00 	lea    0x4069(%rip),%rdi        # 140125ebb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x451b>
   140121e52:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121e58:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121e5d:	48 8d 05 81 50 00 00 	lea    0x5081(%rip),%rax        # 140126ee5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5545>
   140121e64:	c5 fe 7f 94 24 f0 00 	vmovdqu %ymm2,0xf0(%rsp)
   140121e6b:	00 00 
   140121e6d:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121e73:	48 8d 3d 12 1b 00 00 	lea    0x1b12(%rip),%rdi        # 14012398c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fec>
   140121e7a:	48 8d 05 3e 37 00 00 	lea    0x373e(%rip),%rax        # 1401255bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c1f>
   140121e81:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121e87:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121e8c:	48 8d 3d 38 1d 00 00 	lea    0x1d38(%rip),%rdi        # 140123bcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x222b>
   140121e93:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121e99:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121e9e:	48 8d 05 a0 1b 00 00 	lea    0x1ba0(%rip),%rax        # 140123a45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20a5>
   140121ea5:	c5 fe 7f 94 24 d0 00 	vmovdqu %ymm2,0xd0(%rsp)
   140121eac:	00 00 
   140121eae:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121eb4:	48 8d 3d 63 1a 00 00 	lea    0x1a63(%rip),%rdi        # 14012391e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f7e>
   140121ebb:	48 8d 05 ee 19 00 00 	lea    0x19ee(%rip),%rax        # 1401238b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f10>
   140121ec2:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121ec8:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121ecd:	48 8d 3d cc 2a 00 00 	lea    0x2acc(%rip),%rdi        # 1401249a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3000>
   140121ed4:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121eda:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121edf:	48 8d 05 67 2f 00 00 	lea    0x2f67(%rip),%rax        # 140124e4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34ad>
   140121ee6:	c5 fe 7f 94 24 b0 00 	vmovdqu %ymm2,0xb0(%rsp)
   140121eed:	00 00 
   140121eef:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121ef5:	48 8d 3d c2 29 00 00 	lea    0x29c2(%rip),%rdi        # 1401248be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f1e>
   140121efc:	48 8d 05 21 0d 00 00 	lea    0xd21(%rip),%rax        # 140122c24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1284>
   140121f03:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121f09:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121f0e:	48 8d 3d 2c 2b 00 00 	lea    0x2b2c(%rip),%rdi        # 140124a41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30a1>
   140121f15:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121f1b:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121f20:	48 8d 05 f4 32 00 00 	lea    0x32f4(%rip),%rax        # 14012521b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x387b>
   140121f27:	c5 fe 7f 94 24 90 00 	vmovdqu %ymm2,0x90(%rsp)
   140121f2e:	00 00 
   140121f30:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121f36:	48 8d 3d 73 26 00 00 	lea    0x2673(%rip),%rdi        # 1401245b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c10>
   140121f3d:	48 8d 05 6c 31 00 00 	lea    0x316c(%rip),%rax        # 1401250b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3710>
   140121f44:	c4 e3 75 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140121f4a:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121f4f:	48 8d 3d 06 4c 00 00 	lea    0x4c06(%rip),%rdi        # 140126b5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51bc>
   140121f56:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121f5c:	c5 fe 7f 54 24 70    	vmovdqu %ymm2,0x70(%rsp)
   140121f62:	48 8d 05 4c 5d 00 00 	lea    0x5d4c(%rip),%rax        # 140127cb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6315>
   140121f69:	c4 e1 f9 6e d7       	vmovq  %rdi,%xmm2
   140121f6e:	c4 e3 e9 22 d0 01    	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140121f74:	48 8d 3d ff 5a 00 00 	lea    0x5aff(%rip),%rdi        # 140127a7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60da>
   140121f7b:	48 8d 05 4c 38 00 00 	lea    0x384c(%rip),%rax        # 1401257ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e2e>
   140121f82:	c4 e3 6d 38 d0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   140121f88:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121f8d:	48 8d 3d 35 39 00 00 	lea    0x3935(%rip),%rdi        # 1401258c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f29>
   140121f94:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121f9a:	c4 e1 f9 6e cf       	vmovq  %rdi,%xmm1
   140121f9f:	48 8d 05 fc 49 00 00 	lea    0x49fc(%rip),%rax        # 1401269a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5002>
   140121fa6:	c4 e3 f1 22 c8 01    	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140121fac:	48 8d 3d 2d 47 00 00 	lea    0x472d(%rip),%rdi        # 1401266e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d40>
   140121fb3:	48 8d 05 2b 46 00 00 	lea    0x462b(%rip),%rax        # 1401265e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c45>
   140121fba:	c4 e3 75 38 c8 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   140121fc0:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121fc5:	48 8d 3d f0 50 00 00 	lea    0x50f0(%rip),%rdi        # 1401270bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x571c>
   140121fcc:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140121fd2:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   140121fd7:	48 8d 05 fb 36 00 00 	lea    0x36fb(%rip),%rax        # 1401256d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d39>
   140121fde:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   140121fe4:	48 8d 3d 92 11 00 00 	lea    0x1192(%rip),%rdi        # 14012317d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17dd>
   140121feb:	48 8d 05 95 0f 00 00 	lea    0xf95(%rip),%rax        # 140122f87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e7>
   140121ff2:	c4 e3 65 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm4
   140121ff8:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140121ffd:	48 8d 3d 74 12 00 00 	lea    0x1274(%rip),%rdi        # 140123278 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18d8>
   140122004:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012200a:	c4 e1 f9 6e ef       	vmovq  %rdi,%xmm5
   14012200f:	48 8d 05 6c 10 00 00 	lea    0x106c(%rip),%rax        # 140123082 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16e2>
   140122016:	c5 fe 7f 64 24 50    	vmovdqu %ymm4,0x50(%rsp)
   14012201c:	c4 e3 d1 22 e8 01    	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140122022:	48 8d 3d 63 0e 00 00 	lea    0xe63(%rip),%rdi        # 140122e8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec>
   140122029:	48 8d 05 61 0d 00 00 	lea    0xd61(%rip),%rax        # 140122d91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f1>
   140122030:	c4 e3 55 38 e8 01    	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   140122036:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012203b:	48 8d 3d 1f 4a 00 00 	lea    0x4a1f(%rip),%rdi        # 140126a61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50c1>
   140122042:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122048:	c4 e1 f9 6e e7       	vmovq  %rdi,%xmm4
   14012204d:	48 8d 05 5a 32 00 00 	lea    0x325a(%rip),%rax        # 1401252ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x390e>
   140122054:	c4 e3 d9 22 e0 01    	vpinsrq $0x1,%rax,%xmm4,%xmm4
   14012205a:	48 8d 3d 4a 5e 00 00 	lea    0x5e4a(%rip),%rdi        # 140127eab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x650b>
   140122061:	48 8d 05 ac 3c 00 00 	lea    0x3cac(%rip),%rax        # 140125d14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4374>
   140122068:	c4 e3 5d 38 e0 01    	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   14012206e:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122073:	48 8d 3d 7b 61 00 00 	lea    0x617b(%rip),%rdi        # 1401281f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6855>
   14012207a:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122080:	c4 e1 f9 6e df       	vmovq  %rdi,%xmm3
   140122085:	48 8d 05 14 56 00 00 	lea    0x5614(%rip),%rax        # 1401276a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d00>
   14012208c:	c4 e3 e1 22 d8 01    	vpinsrq $0x1,%rax,%xmm3,%xmm3
   140122092:	48 8d 3d 17 5d 00 00 	lea    0x5d17(%rip),%rdi        # 140127db0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6410>
   140122099:	48 8d 05 79 3b 00 00 	lea    0x3b79(%rip),%rax        # 140125c19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4279>
   1401220a0:	c4 e3 65 38 d8 01    	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   1401220a6:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401220ab:	48 8d 3d f8 53 00 00 	lea    0x53f8(%rip),%rdi        # 1401274aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b0a>
   1401220b2:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401220b8:	48 8d 05 14 1e 00 00 	lea    0x1e14(%rip),%rax        # 140123ed3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2533>
   1401220bf:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   1401220c4:	48 8d 05 df 2a 00 00 	lea    0x2adf(%rip),%rax        # 140124baa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x320a>
   1401220cb:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   1401220d1:	48 8d 15 cd 54 00 00 	lea    0x54cd(%rip),%rdx        # 1401275a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c05>
   1401220d8:	c4 63 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   1401220de:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401220e3:	48 8d 3d da 20 00 00 	lea    0x20da(%rip),%rdi        # 1401241c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2824>
   1401220ea:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401220f0:	48 8d 05 27 3a 00 00 	lea    0x3a27(%rip),%rax        # 140125b1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x417e>
   1401220f7:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   1401220fc:	48 8d 05 cb 1e 00 00 	lea    0x1ecb(%rip),%rax        # 140123fce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x262e>
   140122103:	c4 e3 f9 22 c2 01    	vpinsrq $0x1,%rdx,%xmm0,%xmm0
   140122109:	48 8d 15 aa 22 00 00 	lea    0x22aa(%rip),%rdx        # 1401243ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a1a>
   140122110:	c4 63 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm14
   140122116:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012211b:	48 8d 3d 49 33 00 00 	lea    0x3349(%rip),%rdi        # 14012546b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3acb>
   140122122:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122128:	48 8d 05 9a 1f 00 00 	lea    0x1f9a(%rip),%rax        # 1401240c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2729>
   14012212f:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122134:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012213a:	48 8d 15 16 4b 00 00 	lea    0x4b16(%rip),%rdx        # 140126c57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52b7>
   140122141:	48 8d 05 14 16 00 00 	lea    0x1614(%rip),%rax        # 14012375c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dbc>
   140122148:	c4 63 7d 38 de 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   14012214e:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122153:	48 8d 3d ff 4f 00 00 	lea    0x4fff(%rip),%rdi        # 140127159 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57b9>
   14012215a:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122160:	48 8d 05 3f 5e 00 00 	lea    0x5e3f(%rip),%rax        # 140127fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6606>
   140122167:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14012216c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122172:	48 8d 15 73 26 00 00 	lea    0x2673(%rip),%rdx        # 1401247ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e4c>
   140122179:	48 8d 05 f1 24 00 00 	lea    0x24f1(%rip),%rax        # 140124671 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2cd1>
   140122180:	c4 63 7d 38 e6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   140122186:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012218b:	48 8d 3d 23 2e 00 00 	lea    0x2e23(%rip),%rdi        # 140124fb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3615>
   140122192:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122198:	48 8d 05 7e 25 00 00 	lea    0x257e(%rip),%rax        # 14012471d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d7d>
   14012219f:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   1401221a4:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401221aa:	48 8d 15 a0 63 00 00 	lea    0x63a0(%rip),%rdx        # 140128551 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bb1>
   1401221b1:	48 8d 05 54 2b 00 00 	lea    0x2b54(%rip),%rax        # 140124d0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x336c>
   1401221b8:	c4 63 7d 38 ee 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   1401221be:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401221c3:	48 8d 3d db 62 00 00 	lea    0x62db(%rip),%rdi        # 1401284a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b05>
   1401221ca:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401221d0:	48 8d 05 ea 4d 00 00 	lea    0x4dea(%rip),%rax        # 140126fc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5621>
   1401221d7:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   1401221dc:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401221e2:	48 8d 15 e1 64 00 00 	lea    0x64e1(%rip),%rdx        # 1401286ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d2a>
   1401221e9:	48 8d 05 8d 66 00 00 	lea    0x668d(%rip),%rax        # 14012887d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6edd>
   1401221f0:	c4 63 7d 38 d6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   1401221f6:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401221fb:	48 8d 3d c0 50 00 00 	lea    0x50c0(%rip),%rdi        # 1401272c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5922>
   140122202:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122208:	48 8d 05 95 67 00 00 	lea    0x6795(%rip),%rax        # 1401289a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7004>
   14012220f:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122214:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012221a:	48 8d 15 2c 51 00 00 	lea    0x512c(%rip),%rdx        # 14012734d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59ad>
   140122221:	48 8d 05 9c 37 00 00 	lea    0x379c(%rip),%rax        # 1401259c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4024>
   140122228:	c4 e3 7d 38 f6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   14012222e:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122233:	48 8d 3d d1 65 00 00 	lea    0x65d1(%rip),%rdi        # 14012880b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e6b>
   14012223a:	c5 fe 7f b4 24 50 01 	vmovdqu %ymm6,0x150(%rsp)
   140122241:	00 00 
   140122243:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122249:	48 8d 05 d8 4f 00 00 	lea    0x4fd8(%rip),%rax        # 140127228 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5888>
   140122250:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   140122255:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012225b:	48 8d 15 e6 67 00 00 	lea    0x67e6(%rip),%rdx        # 140128a48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70a8>
   140122262:	48 8d 05 72 45 00 00 	lea    0x4572(%rip),%rax        # 1401267db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e3b>
   140122269:	c4 63 7d 38 ce 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   14012226f:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122274:	48 8d 3d ae 66 00 00 	lea    0x66ae(%rip),%rdi        # 140128929 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f89>
   14012227b:	c4 e3 f9 22 f0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140122281:	48 8d 05 63 61 00 00 	lea    0x6163(%rip),%rax        # 1401283eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4b>
   140122288:	c4 e1 f9 6e c2       	vmovq  %rdx,%xmm0
   14012228d:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122293:	48 8d 15 9c 59 00 00 	lea    0x599c(%rip),%rdx        # 140127c36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6296>
   14012229a:	48 8d 05 d7 63 00 00 	lea    0x63d7(%rip),%rax        # 140128678 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cd8>
   1401222a1:	c4 63 7d 38 c6 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   1401222a7:	c4 e1 f9 6e f2       	vmovq  %rdx,%xmm6
   1401222ac:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401222b1:	c4 e3 c9 22 f0 01    	vpinsrq $0x1,%rax,%xmm6,%xmm6
   1401222b7:	48 8d 05 c1 56 00 00 	lea    0x56c1(%rip),%rax        # 14012797f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fdf>
   1401222be:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401222c4:	48 8d 05 ef 03 00 00 	lea    0x3ef(%rip),%rax        # 1401226ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1a>
   1401222cb:	c4 e3 7d 38 fe 01    	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   1401222d1:	c4 e1 f9 6e c0       	vmovq  %rax,%xmm0
   1401222d6:	48 8d 05 c3 cd 29 00 	lea    0x29cdc3(%rip),%rax        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401222dd:	c4 e2 7d 59 c0       	vpbroadcastq %xmm0,%ymm0
   1401222e2:	48 8d 90 00 08 00 00 	lea    0x800(%rax),%rdx
   1401222e9:	90                   	nop
   1401222ea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1401222f1:	00 00 00 00 
   1401222f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   1401222fc:	00 00 00 00 
   140122300:	c5 fd 7f 00          	vmovdqa %ymm0,(%rax)
   140122304:	48 83 c0 40          	add    $0x40,%rax
   140122308:	c5 fd 7f 40 e0       	vmovdqa %ymm0,-0x20(%rax)
   14012230d:	48 39 c2             	cmp    %rax,%rdx
   140122310:	75 ee                	jne    140122300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x960>
   140122312:	48 8d 05 92 2e 00 00 	lea    0x2e92(%rip),%rax        # 1401251ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x380b>
   140122319:	48 8d 3d ef 3a 00 00 	lea    0x3aef(%rip),%rdi        # 140125e0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x446f>
   140122320:	c5 fd 7f 15 78 d2 29 	vmovdqa %ymm2,0x29d278(%rip)        # 1403bf5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   140122327:	00 
   140122328:	c5 fe 6f 54 24 50    	vmovdqu 0x50(%rsp),%ymm2
   14012232e:	48 89 05 ab cd 29 00 	mov    %rax,0x29cdab(%rip)        # 1403bf0e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140122335:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012233a:	48 8d 05 8b 62 00 00 	lea    0x628b(%rip),%rax        # 1401285cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2c>
   140122341:	48 8d 3d c0 12 00 00 	lea    0x12c0(%rip),%rdi        # 140123608 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c68>
   140122348:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012234e:	48 8d 05 46 54 00 00 	lea    0x5446(%rip),%rax        # 14012779b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dfb>
   140122355:	c5 fe 6f b4 24 50 01 	vmovdqu 0x150(%rsp),%ymm6
   14012235c:	00 00 
   14012235e:	c5 fd 7f 15 7a d2 29 	vmovdqa %ymm2,0x29d27a(%rip)        # 1403bf5e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   140122365:	00 
   140122366:	c5 fe 6f 94 24 30 01 	vmovdqu 0x130(%rsp),%ymm2
   14012236d:	00 00 
   14012236f:	48 89 05 9a ce 29 00 	mov    %rax,0x29ce9a(%rip)        # 1403bf210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   140122376:	48 8d 05 37 11 00 00 	lea    0x1137(%rip),%rax        # 1401234b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b14>
   14012237d:	c5 f9 7f 05 7b ce 29 	vmovdqa %xmm0,0x29ce7b(%rip)        # 1403bf200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   140122384:	00 
   140122385:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   14012238a:	48 8d 3d 29 2b 00 00 	lea    0x2b29(%rip),%rdi        # 140124eba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x351a>
   140122391:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122397:	48 8d 05 17 21 00 00 	lea    0x2117(%rip),%rax        # 1401244b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b15>
   14012239e:	c5 fd 7f 25 9a d1 29 	vmovdqa %ymm4,0x29d19a(%rip)        # 1403bf540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   1401223a5:	00 
   1401223a6:	c5 f9 7f 05 92 ce 29 	vmovdqa %xmm0,0x29ce92(%rip)        # 1403bf240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   1401223ad:	00 
   1401223ae:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401223b3:	48 8d 3d 98 10 00 00 	lea    0x1098(%rip),%rdi        # 140123452 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ab2>
   1401223ba:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401223c0:	48 8d 05 f8 1e 00 00 	lea    0x1ef8(%rip),%rax        # 1401242bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x291f>
   1401223c7:	c5 fd 7f 1d 91 d1 29 	vmovdqa %ymm3,0x29d191(%rip)        # 1403bf560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   1401223ce:	00 
   1401223cf:	48 89 05 da ce 29 00 	mov    %rax,0x29ceda(%rip)        # 1403bf2b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   1401223d6:	48 8d 05 70 41 00 00 	lea    0x4170(%rip),%rax        # 14012654d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bad>
   1401223dd:	c5 f9 7f 05 bb ce 29 	vmovdqa %xmm0,0x29cebb(%rip)        # 1403bf2a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   1401223e4:	00 
   1401223e5:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   1401223ea:	48 8d 3d 6f 3d 00 00 	lea    0x3d6f(%rip),%rdi        # 140126160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47c0>
   1401223f1:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401223f7:	48 8d 05 42 40 00 00 	lea    0x4042(%rip),%rax        # 140126440 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4aa0>
   1401223fe:	c5 fd 7f 15 1a d2 29 	vmovdqa %ymm2,0x29d21a(%rip)        # 1403bf620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   140122405:	00 
   140122406:	48 89 05 23 cf 29 00 	mov    %rax,0x29cf23(%rip)        # 1403bf330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   14012240d:	48 8d 05 69 3c 00 00 	lea    0x3c69(%rip),%rax        # 14012607d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46dd>
   140122414:	c5 f9 7f 05 04 cf 29 	vmovdqa %xmm0,0x29cf04(%rip)        # 1403bf320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   14012241b:	00 
   14012241c:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122421:	48 8d 3d 64 06 00 00 	lea    0x664(%rip),%rdi        # 140122a8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ec>
   140122428:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012242e:	48 8d 05 21 32 00 00 	lea    0x3221(%rip),%rax        # 140125656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cb6>
   140122435:	c5 7d 7f 05 63 cc 29 	vmovdqa %ymm8,0x29cc63(%rip)        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012243c:	00 
   14012243d:	48 89 05 54 d4 29 00 	mov    %rax,0x29d454(%rip)        # 1403bf898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140122444:	48 8d 05 64 26 00 00 	lea    0x2664(%rip),%rax        # 140124aaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x310f>
   14012244b:	48 89 05 8e d0 29 00 	mov    %rax,0x29d08e(%rip)        # 1403bf4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140122452:	48 8d 05 a1 5c 00 00 	lea    0x5ca1(%rip),%rax        # 1401280fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x675a>
   140122459:	48 89 05 20 d1 29 00 	mov    %rax,0x29d120(%rip)        # 1403bf580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   140122460:	48 8d 05 71 03 00 00 	lea    0x371(%rip),%rax        # 1401227d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe38>
   140122467:	c5 f9 7f 05 31 cf 29 	vmovdqa %xmm0,0x29cf31(%rip)        # 1403bf3a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   14012246e:	00 
   14012246f:	c4 e1 f9 6e c7       	vmovq  %rdi,%xmm0
   140122474:	c5 fd 7f 3d 44 cc 29 	vmovdqa %ymm7,0x29cc44(%rip)        # 1403bf0c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   14012247b:	00 
   14012247c:	c4 e3 f9 22 c0 01    	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140122482:	c5 7d 7f 0d 96 cc 29 	vmovdqa %ymm9,0x29cc96(%rip)        # 1403bf120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   140122489:	00 
   14012248a:	c5 7d 7f 2d 0e cd 29 	vmovdqa %ymm13,0x29cd0e(%rip)        # 1403bf1a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   140122491:	00 
   140122492:	c5 7d 7f 15 26 cd 29 	vmovdqa %ymm10,0x29cd26(%rip)        # 1403bf1c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   140122499:	00 
   14012249a:	c5 fd 7f 35 3e cd 29 	vmovdqa %ymm6,0x29cd3e(%rip)        # 1403bf1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   1401224a1:	00 
   1401224a2:	c5 7d 7f 25 76 cd 29 	vmovdqa %ymm12,0x29cd76(%rip)        # 1403bf220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   1401224a9:	00 
   1401224aa:	c5 7d 7f 1d 6e cf 29 	vmovdqa %ymm11,0x29cf6e(%rip)        # 1403bf420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   1401224b1:	00 
   1401224b2:	c5 7d 7f 3d e6 cf 29 	vmovdqa %ymm15,0x29cfe6(%rip)        # 1403bf4a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   1401224b9:	00 
   1401224ba:	c5 7d 7f 35 fe cf 29 	vmovdqa %ymm14,0x29cffe(%rip)        # 1403bf4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   1401224c1:	00 
   1401224c2:	c5 fd 7f 2d 56 d0 29 	vmovdqa %ymm5,0x29d056(%rip)        # 1403bf520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   1401224c9:	00 
   1401224ca:	c5 fd 7f 0d ee d0 29 	vmovdqa %ymm1,0x29d0ee(%rip)        # 1403bf5c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   1401224d1:	00 
   1401224d2:	c5 fe 6f ac 24 10 01 	vmovdqu 0x110(%rsp),%ymm5
   1401224d9:	00 00 
   1401224db:	c5 fe 6f 5c 24 70    	vmovdqu 0x70(%rsp),%ymm3
   1401224e1:	c5 fe 6f 94 24 f0 00 	vmovdqu 0xf0(%rsp),%ymm2
   1401224e8:	00 00 
   1401224ea:	c6 05 8f cb 29 00 01 	movb   $0x1,0x29cb8f(%rip)        # 1403bf080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   1401224f1:	c5 fe 6f a4 24 d0 00 	vmovdqu 0xd0(%rsp),%ymm4
   1401224f8:	00 00 
   1401224fa:	c5 fd 7f 2d 3e d1 29 	vmovdqa %ymm5,0x29d13e(%rip)        # 1403bf640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   140122501:	00 
   140122502:	c5 fe 6f ac 24 b0 00 	vmovdqu 0xb0(%rsp),%ymm5
   140122509:	00 00 
   14012250b:	c5 fd 7f 15 4d d1 29 	vmovdqa %ymm2,0x29d14d(%rip)        # 1403bf660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140122512:	00 
   140122513:	c5 fe 6f 94 24 90 00 	vmovdqu 0x90(%rsp),%ymm2
   14012251a:	00 00 
   14012251c:	c5 fd 7f 25 5c d1 29 	vmovdqa %ymm4,0x29d15c(%rip)        # 1403bf680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140122523:	00 
   140122524:	c5 fd 7f 2d 74 d1 29 	vmovdqa %ymm5,0x29d174(%rip)        # 1403bf6a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   14012252b:	00 
   14012252c:	c5 fd 7f 15 8c d1 29 	vmovdqa %ymm2,0x29d18c(%rip)        # 1403bf6c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140122533:	00 
   140122534:	c5 fd 7f 1d a4 d1 29 	vmovdqa %ymm3,0x29d1a4(%rip)        # 1403bf6e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   14012253b:	00 
   14012253c:	c5 f9 7f 05 bc d1 29 	vmovdqa %xmm0,0x29d1bc(%rip)        # 1403bf700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140122543:	00 
   140122544:	e9 6c f7 ff ff       	jmp    140121cb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x315>
   140122549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140122550:	48 8b 86 f0 00 00 00 	mov    0xf0(%rsi),%rax
   140122557:	48 39 86 f8 00 00 00 	cmp    %rax,0xf8(%rsi)
   14012255e:	0f 85 6a f5 ff ff    	jne    140121ace <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e>
   140122564:	e9 0a f5 ff ff       	jmp    140121a73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3>
   140122569:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   140122570:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122577:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012257e:	c5 f8 77             	vzeroupper
   140122581:	0f 1f 40 00          	nopl   0x0(%rax)
   140122585:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   14012258c:	00 00 00 00 
   140122590:	48 2b 6c 24 40       	sub    0x40(%rsp),%rbp
   140122595:	4c 29 ce             	sub    %r9,%rsi
   140122598:	4c 29 c8             	sub    %r9,%rax
   14012259b:	48 89 ab 38 10 00 00 	mov    %rbp,0x1038(%rbx)
   1401225a2:	48 89 f5             	mov    %rsi,%rbp
   1401225a5:	48 c1 fd 03          	sar    $0x3,%rbp
   1401225a9:	48 39 f0             	cmp    %rsi,%rax
   1401225ac:	0f 82 8e 00 00 00    	jb     140122640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca0>
   1401225b2:	c5 f9 6f 05 06 94 23 	vmovdqa 0x239406(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401225b9:	00 
   1401225ba:	48 89 ab 60 10 00 00 	mov    %rbp,0x1060(%rbx)
   1401225c1:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401225c8:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401225cf:	00 
   1401225d0:	c5 f8 28 b4 24 b0 08 	vmovaps 0x8b0(%rsp),%xmm6
   1401225d7:	00 00 
   1401225d9:	c5 f8 28 bc 24 c0 08 	vmovaps 0x8c0(%rsp),%xmm7
   1401225e0:	00 00 
   1401225e2:	c5 78 28 84 24 d0 08 	vmovaps 0x8d0(%rsp),%xmm8
   1401225e9:	00 00 
   1401225eb:	c5 78 28 8c 24 e0 08 	vmovaps 0x8e0(%rsp),%xmm9
   1401225f2:	00 00 
   1401225f4:	c5 78 28 94 24 f0 08 	vmovaps 0x8f0(%rsp),%xmm10
   1401225fb:	00 00 
   1401225fd:	c5 78 28 9c 24 00 09 	vmovaps 0x900(%rsp),%xmm11
   140122604:	00 00 
   140122606:	c5 78 28 a4 24 10 09 	vmovaps 0x910(%rsp),%xmm12
   14012260d:	00 00 
   14012260f:	c5 78 28 ac 24 20 09 	vmovaps 0x920(%rsp),%xmm13
   140122616:	00 00 
   140122618:	c5 78 28 b4 24 30 09 	vmovaps 0x930(%rsp),%xmm14
   14012261f:	00 00 
   140122621:	c5 78 28 bc 24 40 09 	vmovaps 0x940(%rsp),%xmm15
   140122628:	00 00 
   14012262a:	48 81 c4 58 09 00 00 	add    $0x958,%rsp
   140122631:	5b                   	pop    %rbx
   140122632:	5e                   	pop    %rsi
   140122633:	5f                   	pop    %rdi
   140122634:	5d                   	pop    %rbp
   140122635:	41 5c                	pop    %r12
   140122637:	41 5d                	pop    %r13
   140122639:	41 5e                	pop    %r14
   14012263b:	41 5f                	pop    %r15
   14012263d:	c3                   	ret
   14012263e:	66 90                	xchg   %ax,%ax
   140122640:	48 8d 54 2d 00       	lea    0x0(%rbp,%rbp,1),%rdx
   140122645:	48 8d 8b 48 10 00 00 	lea    0x1048(%rbx),%rcx
   14012264c:	e8 8f 59 1c 00       	call   1402e7fe0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140122651:	e9 5c ff ff ff       	jmp    1401225b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   140122656:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   14012265d:	00 00 00 
   140122660:	49 8b 14 24          	mov    (%r12),%rdx
   140122664:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   140122669:	4c 89 e1             	mov    %r12,%rcx
   14012266c:	49 c7 44 24 08 00 00 	movq   $0x0,0x8(%r12)
   140122673:	00 00 
   140122675:	ff 52 10             	call   *0x10(%rdx)
   140122678:	49 8b 14 24          	mov    (%r12),%rdx
   14012267c:	4c 89 e1             	mov    %r12,%rcx
   14012267f:	ff 52 18             	call   *0x18(%rdx)
   140122682:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   140122687:	e9 a0 f5 ff ff       	jmp    140121c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28c>
   14012268c:	80 39 00             	cmpb   $0x0,(%rcx)
   14012268f:	0f 84 64 f6 ff ff    	je     140121cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x359>
   140122695:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
   140122699:	e8 f2 7e fd ff       	call   1400fa590 <setun::VMProfiler::record_opcode(unsigned char) [clone .part.0]>
   14012269e:	e9 56 f6 ff ff       	jmp    140121cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x359>
   1401226a3:	4c 89 e1             	mov    %r12,%rcx
   1401226a6:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1401226ab:	e8 00 47 1b 00       	call   1402d6db0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release_last_use_cold()>
   1401226b0:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1401226b5:	e9 72 f5 ff ff       	jmp    140121c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28c>
   1401226ba:	41 80 fc 02          	cmp    $0x2,%r12b
   1401226be:	0f 84 f1 85 00 00    	je     14012acb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9315>
   1401226c4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401226c8:	0f 84 8a 9b 00 00    	je     14012c258 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8b8>
   1401226ce:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401226d5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401226dc:	c5 f8 77             	vzeroupper
   1401226df:	4c 29 ce             	sub    %r9,%rsi
   1401226e2:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401226e7:	4c 29 c8             	sub    %r9,%rax
   1401226ea:	48 89 f7             	mov    %rsi,%rdi
   1401226ed:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401226f4:	48 c1 ff 03          	sar    $0x3,%rdi
   1401226f8:	48 39 f0             	cmp    %rsi,%rax
   1401226fb:	0f 82 6b 90 00 00    	jb     14012b76c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dcc>
   140122701:	c5 f9 6f 05 b7 92 23 	vmovdqa 0x2392b7(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140122708:	00 
   140122709:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122710:	48 8d ac 24 30 07 00 	lea    0x730(%rsp),%rbp
   140122717:	00 
   140122718:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012271f:	48 89 e9             	mov    %rbp,%rcx
   140122722:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122729:	00 
   14012272a:	e8 71 44 1e 00       	call   140306ba0 <std::__cxx11::basic_ostringstream<char, std::char_traits<char>, std::allocator<char> >::basic_ostringstream()>
   14012272f:	41 b8 27 00 00 00    	mov    $0x27,%r8d
   140122735:	48 8d 15 ac 8d 23 00 	lea    0x238dac(%rip),%rdx        # 14035b4e8 <.rdata+0xfc8>
   14012273c:	48 89 e9             	mov    %rbp,%rcx
   14012273f:	e8 3c 81 20 00       	call   14032a880 <std::basic_ostream<char, std::char_traits<char> >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*, long long)>
   140122744:	48 8b 93 38 10 00 00 	mov    0x1038(%rbx),%rdx
   14012274b:	48 89 e9             	mov    %rbp,%rcx
   14012274e:	48 83 ea 01          	sub    $0x1,%rdx
   140122752:	e8 59 5a 17 00       	call   1402981b0 <std::ostream& std::ostream::_M_insert<unsigned long long>(unsigned long long)>
   140122757:	b9 10 00 00 00       	mov    $0x10,%ecx
   14012275c:	e8 3f 4f 21 00       	call   1403376a0 <__cxa_allocate_exception>
   140122761:	48 8d 94 24 38 07 00 	lea    0x738(%rsp),%rdx
   140122768:	00 
   140122769:	48 89 c6             	mov    %rax,%rsi
   14012276c:	48 8d 84 24 d0 04 00 	lea    0x4d0(%rsp),%rax
   140122773:	00 
   140122774:	48 89 c1             	mov    %rax,%rcx
   140122777:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   14012277c:	e8 1f aa 0f 00       	call   14021d1a0 <std::__cxx11::basic_stringbuf<char, std::char_traits<char>, std::allocator<char> >::str() const &>
   140122781:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   140122786:	48 89 f1             	mov    %rsi,%rcx
   140122789:	e8 b2 cb 1a 00       	call   1402cf340 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14012278e:	48 8d 05 8b 4f 25 00 	lea    0x254f8b(%rip),%rax        # 140377720 <vtable for setun::VMException+0x10>
   140122795:	48 8b 8c 24 d0 04 00 	mov    0x4d0(%rsp),%rcx
   14012279c:	00 
   14012279d:	48 89 06             	mov    %rax,(%rsi)
   1401227a0:	48 8d 84 24 e0 04 00 	lea    0x4e0(%rsp),%rax
   1401227a7:	00 
   1401227a8:	48 39 c1             	cmp    %rax,%rcx
   1401227ab:	74 11                	je     1401227be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1e>
   1401227ad:	48 8b 84 24 e0 04 00 	mov    0x4e0(%rsp),%rax
   1401227b4:	00 
   1401227b5:	48 8d 50 01          	lea    0x1(%rax),%rdx
   1401227b9:	e8 32 4d 21 00       	call   1403374f0 <operator delete(void*, unsigned long long)>
   1401227be:	4c 8d 05 ab 23 0e 00 	lea    0xe23ab(%rip),%r8        # 140204b70 <setun::VMException::~VMException()>
   1401227c5:	48 8d 15 f4 ec 24 00 	lea    0x24ecf4(%rip),%rdx        # 1403714c0 <typeinfo for setun::VMException>
   1401227cc:	48 89 f1             	mov    %rsi,%rcx
   1401227cf:	e8 6c 55 21 00       	call   140337d40 <__cxa_throw>
   1401227d4:	0f 1f 40 00          	nopl   0x0(%rax)
   1401227d8:	41 0f b7 46 06       	movzwl 0x6(%r14),%eax
   1401227dd:	45 0f b7 0e          	movzwl (%r14),%r9d
   1401227e1:	49 8d 6e 08          	lea    0x8(%r14),%rbp
   1401227e5:	45 0f b7 46 02       	movzwl 0x2(%r14),%r8d
   1401227ea:	45 0f b7 56 04       	movzwl 0x4(%r14),%r10d
   1401227ef:	4a 8d 3c 28          	lea    (%rax,%r13,1),%rdi
   1401227f3:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   1401227fa:	0f 83 c4 c2 00 00    	jae    14012eac4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd124>
   140122800:	c5 f8 77             	vzeroupper
   140122803:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   14012280a:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140122811:	48 c1 f8 03          	sar    $0x3,%rax
   140122815:	48 39 c7             	cmp    %rax,%rdi
   140122818:	0f 83 67 c2 00 00    	jae    14012ea85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0e5>
   14012281e:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122825:	41 0f b7 d1          	movzwl %r9w,%edx
   140122829:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   140122830:	00 fd ff 
   140122833:	4c 01 ea             	add    %r13,%rdx
   140122836:	48 8d 0c d0          	lea    (%rax,%rdx,8),%rcx
   14012283a:	41 0f b7 d0          	movzwl %r8w,%edx
   14012283e:	4c 01 ea             	add    %r13,%rdx
   140122841:	4c 8d 04 d0          	lea    (%rax,%rdx,8),%r8
   140122845:	41 0f b7 d2          	movzwl %r10w,%edx
   140122849:	4c 01 ea             	add    %r13,%rdx
   14012284c:	48 8d 04 d0          	lea    (%rax,%rdx,8),%rax
   140122850:	48 8b 11             	mov    (%rcx),%rdx
   140122853:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   140122858:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   14012285f:	00 ff ff 
   140122862:	48 21 d0             	and    %rdx,%rax
   140122865:	4c 39 c8             	cmp    %r9,%rax
   140122868:	0f 84 14 87 00 00    	je     14012af82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95e2>
   14012286e:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140122875:	00 f8 ff 
   140122878:	48 39 d0             	cmp    %rdx,%rax
   14012287b:	0f 84 19 87 00 00    	je     14012af9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95fa>
   140122881:	4c 89 84 24 b0 00 00 	mov    %r8,0xb0(%rsp)
   140122888:	00 
   140122889:	e8 d2 84 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   14012288e:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140122893:	48 89 84 24 b0 03 00 	mov    %rax,0x3b0(%rsp)
   14012289a:	00 
   14012289b:	48 8d 84 24 b0 03 00 	lea    0x3b0(%rsp),%rax
   1401228a2:	00 
   1401228a3:	4c 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%r8
   1401228aa:	00 
   1401228ab:	48 c7 84 24 b8 03 00 	movq   $0x0,0x3b8(%rsp)
   1401228b2:	00 00 00 00 00 
   1401228b7:	48 c7 84 24 c0 03 00 	movq   $0x0,0x3c0(%rsp)
   1401228be:	00 00 00 00 00 
   1401228c3:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   1401228ca:	00 
   1401228cb:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   1401228d2:	00 ff ff 
   1401228d5:	49 8b 10             	mov    (%r8),%rdx
   1401228d8:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   1401228df:	00 fd ff 
   1401228e2:	48 21 d0             	and    %rdx,%rax
   1401228e5:	48 39 c8             	cmp    %rcx,%rax
   1401228e8:	0f 84 56 87 00 00    	je     14012b044 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a4>
   1401228ee:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   1401228f5:	00 f8 ff 
   1401228f8:	48 39 d0             	cmp    %rdx,%rax
   1401228fb:	0f 84 5b 87 00 00    	je     14012b05c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96bc>
   140122901:	4c 89 c1             	mov    %r8,%rcx
   140122904:	e8 57 84 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   140122909:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   14012290e:	48 89 84 24 d0 03 00 	mov    %rax,0x3d0(%rsp)
   140122915:	00 
   140122916:	48 8d 84 24 d0 03 00 	lea    0x3d0(%rsp),%rax
   14012291d:	00 
   14012291e:	48 c7 84 24 d8 03 00 	movq   $0x0,0x3d8(%rsp)
   140122925:	00 00 00 00 00 
   14012292a:	48 c7 84 24 e0 03 00 	movq   $0x0,0x3e0(%rsp)
   140122931:	00 00 00 00 00 
   140122936:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   14012293d:	00 
   14012293e:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140122945:	00 fd ff 
   140122948:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   14012294d:	48 8b 10             	mov    (%rax),%rdx
   140122950:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140122957:	00 ff ff 
   14012295a:	48 21 d0             	and    %rdx,%rax
   14012295d:	48 39 c8             	cmp    %rcx,%rax
   140122960:	0f 84 c6 80 00 00    	je     14012aa2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x908c>
   140122966:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   14012296d:	00 f8 ff 
   140122970:	48 39 d0             	cmp    %rdx,%rax
   140122973:	0f 84 cb 80 00 00    	je     14012aa44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90a4>
   140122979:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   14012297e:	e8 dd 83 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   140122983:	c4 e1 fb 2c c0       	vcvttsd2si %xmm0,%rax
   140122988:	48 89 84 24 f0 03 00 	mov    %rax,0x3f0(%rsp)
   14012298f:	00 
   140122990:	48 8d 84 24 f0 03 00 	lea    0x3f0(%rsp),%rax
   140122997:	00 
   140122998:	48 c7 84 24 f8 03 00 	movq   $0x0,0x3f8(%rsp)
   14012299f:	00 00 00 00 00 
   1401229a4:	48 c7 84 24 00 04 00 	movq   $0x0,0x400(%rsp)
   1401229ab:	00 00 00 00 00 
   1401229b0:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
   1401229b7:	00 
   1401229b8:	48 8d 84 24 30 07 00 	lea    0x730(%rsp),%rax
   1401229bf:	00 
   1401229c0:	4c 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%r8
   1401229c7:	00 
   1401229c8:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
   1401229cf:	00 
   1401229d0:	48 89 c1             	mov    %rax,%rcx
   1401229d3:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   1401229d8:	e8 53 de ee ff       	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   1401229dd:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
   1401229e2:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
   1401229e9:	00 
   1401229ea:	48 8d 8c 24 70 04 00 	lea    0x470(%rsp),%rcx
   1401229f1:	00 
   1401229f2:	e8 c9 d8 ee ff       	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   1401229f7:	48 8b 84 24 80 04 00 	mov    0x480(%rsp),%rax
   1401229fe:	00 
   1401229ff:	c5 f9 6f a4 24 70 04 	vmovdqa 0x470(%rsp),%xmm4
   140122a06:	00 00 
   140122a08:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
   140122a0f:	00 
   140122a10:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   140122a15:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140122a1c:	00 
   140122a1d:	c5 f9 7f a4 24 70 01 	vmovdqa %xmm4,0x170(%rsp)
   140122a24:	00 00 
   140122a26:	e8 d5 a1 0e 00       	call   14020cc00 <setun::VMValue::VMValue(setun::TafpuNum)>
   140122a2b:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122a32:	48 8b 94 24 30 07 00 	mov    0x730(%rsp),%rdx
   140122a39:	00 
   140122a3a:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   140122a3e:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140122a45:	01 
   140122a46:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140122a4d:	0f 85 1e 61 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140122a53:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140122a58:	0f 83 13 61 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140122a5e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140122a65:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140122a6c:	01 
   140122a6d:	48 85 c9             	test   %rcx,%rcx
   140122a70:	0f 85 9b c0 00 00    	jne    14012eb11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd171>
   140122a76:	41 0f b6 46 08       	movzbl 0x8(%r14),%eax
   140122a7b:	48 8d 3d 1e c6 29 00 	lea    0x29c61e(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122a82:	49 83 c6 09          	add    $0x9,%r14
   140122a86:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122a8a:	ff e0                	jmp    *%rax
   140122a8c:	41 0f b7 46 06       	movzwl 0x6(%r14),%eax
   140122a91:	45 0f b7 0e          	movzwl (%r14),%r9d
   140122a95:	49 8d 6e 08          	lea    0x8(%r14),%rbp
   140122a99:	45 0f b7 46 02       	movzwl 0x2(%r14),%r8d
   140122a9e:	45 0f b7 56 04       	movzwl 0x4(%r14),%r10d
   140122aa3:	4a 8d 3c 28          	lea    (%rax,%r13,1),%rdi
   140122aa7:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122aae:	0f 83 6e bc 00 00    	jae    14012e722 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd82>
   140122ab4:	c5 f8 77             	vzeroupper
   140122ab7:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140122abe:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   140122ac5:	48 c1 f8 03          	sar    $0x3,%rax
   140122ac9:	48 39 c7             	cmp    %rax,%rdi
   140122acc:	0f 83 03 d9 00 00    	jae    1401303d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea35>
   140122ad2:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140122ad9:	41 0f b7 c8          	movzwl %r8w,%ecx
   140122add:	41 0f b7 d1          	movzwl %r9w,%edx
   140122ae1:	4c 01 e9             	add    %r13,%rcx
   140122ae4:	4c 01 ea             	add    %r13,%rdx
   140122ae7:	4c 8d 0c c8          	lea    (%rax,%rcx,8),%r9
   140122aeb:	41 0f b7 ca          	movzwl %r10w,%ecx
   140122aef:	48 8d 14 d0          	lea    (%rax,%rdx,8),%rdx
   140122af3:	4c 01 e9             	add    %r13,%rcx
   140122af6:	48 8d 04 c8          	lea    (%rax,%rcx,8),%rax
   140122afa:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   140122b01:	ff f7 ff 
   140122b04:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   140122b09:	48 8b 02             	mov    (%rdx),%rax
   140122b0c:	48 39 c1             	cmp    %rax,%rcx
   140122b0f:	73 13                	jae    140122b24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1184>
   140122b11:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   140122b18:	00 fc ff 
   140122b1b:	48 39 c8             	cmp    %rcx,%rax
   140122b1e:	0f 85 33 bc 00 00    	jne    14012e757 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdb7>
   140122b24:	48 b8 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rax
   140122b2b:	ff f7 ff 
   140122b2e:	49 8b 09             	mov    (%r9),%rcx
   140122b31:	48 39 c8             	cmp    %rcx,%rax
   140122b34:	73 13                	jae    140122b49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a9>
   140122b36:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140122b3d:	00 fc ff 
   140122b40:	48 39 c1             	cmp    %rax,%rcx
   140122b43:	0f 85 e7 9d 00 00    	jne    14012c930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf90>
   140122b49:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   140122b4e:	48 8b 08             	mov    (%rax),%rcx
   140122b51:	48 b8 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rax
   140122b58:	ff f7 ff 
   140122b5b:	48 39 c8             	cmp    %rcx,%rax
   140122b5e:	73 13                	jae    140122b73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d3>
   140122b60:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140122b67:	00 fc ff 
   140122b6a:	48 39 c1             	cmp    %rax,%rcx
   140122b6d:	0f 85 bd 9d 00 00    	jne    14012c930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf90>
   140122b73:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   140122b78:	48 89 94 24 b0 00 00 	mov    %rdx,0xb0(%rsp)
   140122b7f:	00 
   140122b80:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   140122b87:	00 
   140122b88:	e8 d3 81 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   140122b8d:	48 8b 8c 24 90 00 00 	mov    0x90(%rsp),%rcx
   140122b94:	00 
   140122b95:	c5 f9 28 f8          	vmovapd %xmm0,%xmm7
   140122b99:	e8 c2 81 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   140122b9e:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   140122ba5:	00 
   140122ba6:	c5 f9 28 f0          	vmovapd %xmm0,%xmm6
   140122baa:	e8 b1 81 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   140122baf:	c4 e2 c1 99 c6       	vfmadd132sd %xmm6,%xmm7,%xmm0
   140122bb4:	c5 f9 2e c0          	vucomisd %xmm0,%xmm0
   140122bb8:	c4 e1 f9 7e c1       	vmovq  %xmm0,%rcx
   140122bbd:	48 b8 00 00 00 00 00 	movabs $0xfffc000000000000,%rax
   140122bc4:	00 fc ff 
   140122bc7:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122bce:	48 0f 4b c1          	cmovnp %rcx,%rax
   140122bd2:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140122bd6:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140122bdd:	01 
   140122bde:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140122be5:	0f 85 86 5f 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140122beb:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140122bf0:	0f 83 7b 5f 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140122bf6:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140122bfd:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140122c04:	01 
   140122c05:	48 85 c9             	test   %rcx,%rcx
   140122c08:	0f 85 eb be 00 00    	jne    14012eaf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd159>
   140122c0e:	41 0f b6 46 08       	movzbl 0x8(%r14),%eax
   140122c13:	48 8d 3d 86 c4 29 00 	lea    0x29c486(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122c1a:	49 83 c6 09          	add    $0x9,%r14
   140122c1e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122c22:	ff e0                	jmp    *%rax
   140122c24:	41 0f b7 56 06       	movzwl 0x6(%r14),%edx
   140122c29:	45 0f b7 06          	movzwl (%r14),%r8d
   140122c2d:	49 8d 6e 08          	lea    0x8(%r14),%rbp
   140122c31:	41 0f b7 46 02       	movzwl 0x2(%r14),%eax
   140122c36:	45 0f b7 5e 04       	movzwl 0x4(%r14),%r11d
   140122c3b:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
   140122c3f:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140122c46:	0f 83 2f ca 00 00    	jae    14012f67b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcdb>
   140122c4c:	48 8b 8b 70 10 00 00 	mov    0x1070(%rbx),%rcx
   140122c53:	48 2b 8b 68 10 00 00 	sub    0x1068(%rbx),%rcx
   140122c5a:	48 c1 f9 03          	sar    $0x3,%rcx
   140122c5e:	48 39 cf             	cmp    %rcx,%rdi
   140122c61:	0f 83 d4 c9 00 00    	jae    14012f63b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc9b>
   140122c67:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140122c6e:	41 0f b7 c8          	movzwl %r8w,%ecx
   140122c72:	0f b7 c0             	movzwl %ax,%eax
   140122c75:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140122c7c:	00 ff ff 
   140122c7f:	4c 01 e9             	add    %r13,%rcx
   140122c82:	4c 01 e8             	add    %r13,%rax
   140122c85:	4c 8d 14 ca          	lea    (%rdx,%rcx,8),%r10
   140122c89:	4c 8d 0c c2          	lea    (%rdx,%rax,8),%r9
   140122c8d:	41 0f b7 c3          	movzwl %r11w,%eax
   140122c91:	4d 8b 1a             	mov    (%r10),%r11
   140122c94:	4c 01 e8             	add    %r13,%rax
   140122c97:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
   140122c9e:	00 
   140122c9f:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   140122ca3:	4c 89 d9             	mov    %r11,%rcx
   140122ca6:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   140122cab:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140122cb2:	00 f8 ff 
   140122cb5:	4c 21 c1             	and    %r8,%rcx
   140122cb8:	48 39 c1             	cmp    %rax,%rcx
   140122cbb:	0f 85 25 8e 00 00    	jne    14012bae6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa146>
   140122cc1:	49 8b 01             	mov    (%r9),%rax
   140122cc4:	49 89 c1             	mov    %rax,%r9
   140122cc7:	4d 21 c1             	and    %r8,%r9
   140122cca:	49 39 c9             	cmp    %rcx,%r9
   140122ccd:	0f 85 33 8e 00 00    	jne    14012bb06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa166>
   140122cd3:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
   140122cd8:	48 8b 09             	mov    (%rcx),%rcx
   140122cdb:	49 21 c8             	and    %rcx,%r8
   140122cde:	4c 89 84 24 b0 00 00 	mov    %r8,0xb0(%rsp)
   140122ce5:	00 
   140122ce6:	4d 39 c8             	cmp    %r9,%r8
   140122ce9:	0f 85 17 8e 00 00    	jne    14012bb06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa166>
   140122cef:	48 c1 e0 10          	shl    $0x10,%rax
   140122cf3:	48 c1 e1 10          	shl    $0x10,%rcx
   140122cf7:	48 c1 f8 10          	sar    $0x10,%rax
   140122cfb:	48 c1 f9 10          	sar    $0x10,%rcx
   140122cff:	49 89 c0             	mov    %rax,%r8
   140122d02:	4c 89 d8             	mov    %r11,%rax
   140122d05:	48 c1 e0 10          	shl    $0x10,%rax
   140122d09:	48 c1 f8 10          	sar    $0x10,%rax
   140122d0d:	49 0f af c0          	imul   %r8,%rax
   140122d11:	49 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%r8
   140122d18:	ff 00 00 
   140122d1b:	48 01 c8             	add    %rcx,%rax
   140122d1e:	48 b9 00 00 00 00 00 	movabs $0x800000000000,%rcx
   140122d25:	80 00 00 
   140122d28:	48 01 c1             	add    %rax,%rcx
   140122d2b:	49 39 c8             	cmp    %rcx,%r8
   140122d2e:	0f 82 d2 8d 00 00    	jb     14012bb06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa166>
   140122d34:	4c 21 c0             	and    %r8,%rax
   140122d37:	48 0b 84 24 b0 00 00 	or     0xb0(%rsp),%rax
   140122d3e:	00 
   140122d3f:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140122d43:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140122d4a:	01 
   140122d4b:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140122d52:	0f 85 16 5e 00 00    	jne    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140122d58:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140122d5d:	0f 83 0b 5e 00 00    	jae    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140122d63:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140122d6a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140122d71:	01 
   140122d72:	48 85 c9             	test   %rcx,%rcx
   140122d75:	0f 85 ed e0 00 00    	jne    140130e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4c8>
   140122d7b:	41 0f b6 46 08       	movzbl 0x8(%r14),%eax
   140122d80:	48 8d 3d 19 c3 29 00 	lea    0x29c319(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122d87:	49 83 c6 09          	add    $0x9,%r14
   140122d8b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122d8f:	ff e0                	jmp    *%rax
   140122d91:	41 80 fc 02          	cmp    $0x2,%r12b
   140122d95:	0f 84 45 7c 00 00    	je     14012a9e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9040>
   140122d9b:	41 80 fc 01          	cmp    $0x1,%r12b
   140122d9f:	0f 84 05 9b 00 00    	je     14012c8aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf0a>
   140122da5:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122dac:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122db3:	c5 f8 77             	vzeroupper
   140122db6:	4c 29 ce             	sub    %r9,%rsi
   140122db9:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140122dbe:	4c 29 c8             	sub    %r9,%rax
   140122dc1:	48 89 f7             	mov    %rsi,%rdi
   140122dc4:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140122dcb:	48 c1 ff 03          	sar    $0x3,%rdi
   140122dcf:	48 39 f0             	cmp    %rsi,%rax
   140122dd2:	0f 82 a9 89 00 00    	jb     14012b781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9de1>
   140122dd8:	c5 f9 6f 05 e0 8b 23 	vmovdqa 0x238be0(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140122ddf:	00 
   140122de0:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122de7:	4c 89 fa             	mov    %r15,%rdx
   140122dea:	48 89 d9             	mov    %rbx,%rcx
   140122ded:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122df4:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122dfb:	00 
   140122dfc:	e8 df be fd ff       	call   1400fece0 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140122e01:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122e08:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122e0f:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122e16:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140122e1b:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140122e1f:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140122e26:	4d 85 ed             	test   %r13,%r13
   140122e29:	74 0d                	je     140122e38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1498>
   140122e2b:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122e30:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122e37:	00 
   140122e38:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140122e3f:	0f 85 ab 5c 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140122e45:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122e4c:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140122e51:	0f 83 39 f7 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140122e57:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140122e5e:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140122e65:	01 
   140122e66:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140122e6b:	48 85 c9             	test   %rcx,%rcx
   140122e6e:	0f 85 cc c1 00 00    	jne    14012f040 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6a0>
   140122e74:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140122e78:	48 8d 3d 21 c2 29 00 	lea    0x29c221(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122e7f:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140122e83:	45 31 e4             	xor    %r12d,%r12d
   140122e86:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122e8a:	ff e0                	jmp    *%rax
   140122e8c:	41 80 fc 02          	cmp    $0x2,%r12b
   140122e90:	0f 84 21 6f 00 00    	je     140129db7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8417>
   140122e96:	41 80 fc 01          	cmp    $0x1,%r12b
   140122e9a:	0f 84 56 96 00 00    	je     14012c4f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab56>
   140122ea0:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122ea7:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122eae:	c5 f8 77             	vzeroupper
   140122eb1:	4c 29 ce             	sub    %r9,%rsi
   140122eb4:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140122eb9:	4c 29 c8             	sub    %r9,%rax
   140122ebc:	48 89 f7             	mov    %rsi,%rdi
   140122ebf:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140122ec6:	48 c1 ff 03          	sar    $0x3,%rdi
   140122eca:	48 39 f0             	cmp    %rsi,%rax
   140122ecd:	0f 82 02 89 00 00    	jb     14012b7d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e35>
   140122ed3:	c5 f9 6f 05 e5 8a 23 	vmovdqa 0x238ae5(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140122eda:	00 
   140122edb:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122ee2:	4c 89 fa             	mov    %r15,%rdx
   140122ee5:	48 89 d9             	mov    %rbx,%rcx
   140122ee8:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122eef:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122ef6:	00 
   140122ef7:	e8 74 f9 fd ff       	call   140102870 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   140122efc:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122f03:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122f0a:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140122f11:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140122f16:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140122f1a:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140122f21:	4d 85 ed             	test   %r13,%r13
   140122f24:	74 0d                	je     140122f33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1593>
   140122f26:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140122f2b:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140122f32:	00 
   140122f33:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140122f3a:	0f 85 b0 5b 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140122f40:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122f47:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140122f4c:	0f 83 3e f6 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140122f52:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140122f59:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140122f60:	01 
   140122f61:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140122f66:	48 85 c9             	test   %rcx,%rcx
   140122f69:	0f 85 57 b7 00 00    	jne    14012e6c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd26>
   140122f6f:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140122f73:	48 8d 3d 26 c1 29 00 	lea    0x29c126(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140122f7a:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140122f7e:	45 31 e4             	xor    %r12d,%r12d
   140122f81:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140122f85:	ff e0                	jmp    *%rax
   140122f87:	41 80 fc 02          	cmp    $0x2,%r12b
   140122f8b:	0f 84 67 80 00 00    	je     14012aff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9658>
   140122f91:	41 80 fc 01          	cmp    $0x1,%r12b
   140122f95:	0f 84 89 98 00 00    	je     14012c824 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae84>
   140122f9b:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140122fa2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140122fa9:	c5 f8 77             	vzeroupper
   140122fac:	4c 29 ce             	sub    %r9,%rsi
   140122faf:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140122fb4:	4c 29 c8             	sub    %r9,%rax
   140122fb7:	48 89 f7             	mov    %rsi,%rdi
   140122fba:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140122fc1:	48 c1 ff 03          	sar    $0x3,%rdi
   140122fc5:	48 39 f0             	cmp    %rsi,%rax
   140122fc8:	0f 82 f2 87 00 00    	jb     14012b7c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e20>
   140122fce:	c5 f9 6f 05 ea 89 23 	vmovdqa 0x2389ea(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140122fd5:	00 
   140122fd6:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140122fdd:	4c 89 fa             	mov    %r15,%rdx
   140122fe0:	48 89 d9             	mov    %rbx,%rcx
   140122fe3:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140122fea:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140122ff1:	00 
   140122ff2:	e8 19 f5 fd ff       	call   140102510 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140122ff7:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140122ffe:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123005:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012300c:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140123011:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140123015:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012301c:	4d 85 ed             	test   %r13,%r13
   14012301f:	74 0d                	je     14012302e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x168e>
   140123021:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123026:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012302d:	00 
   14012302e:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123035:	0f 85 b5 5a 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012303b:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123042:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123047:	0f 83 43 f5 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012304d:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123054:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012305b:	01 
   14012305c:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140123061:	48 85 c9             	test   %rcx,%rcx
   140123064:	0f 85 8a b6 00 00    	jne    14012e6f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd54>
   14012306a:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012306e:	48 8d 3d 2b c0 29 00 	lea    0x29c02b(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123075:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140123079:	45 31 e4             	xor    %r12d,%r12d
   14012307c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123080:	ff e0                	jmp    *%rax
   140123082:	41 80 fc 02          	cmp    $0x2,%r12b
   140123086:	0f 84 08 79 00 00    	je     14012a994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ff4>
   14012308c:	41 80 fc 01          	cmp    $0x1,%r12b
   140123090:	0f 84 8b 92 00 00    	je     14012c321 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa981>
   140123096:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012309d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401230a4:	c5 f8 77             	vzeroupper
   1401230a7:	4c 29 ce             	sub    %r9,%rsi
   1401230aa:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401230af:	4c 29 c8             	sub    %r9,%rax
   1401230b2:	48 89 f7             	mov    %rsi,%rdi
   1401230b5:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401230bc:	48 c1 ff 03          	sar    $0x3,%rdi
   1401230c0:	48 39 f0             	cmp    %rsi,%rax
   1401230c3:	0f 82 cd 86 00 00    	jb     14012b796 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9df6>
   1401230c9:	c5 f9 6f 05 ef 88 23 	vmovdqa 0x2388ef(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401230d0:	00 
   1401230d1:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401230d8:	4c 89 fa             	mov    %r15,%rdx
   1401230db:	48 89 d9             	mov    %rbx,%rcx
   1401230de:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401230e5:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401230ec:	00 
   1401230ed:	e8 5e 14 fe ff       	call   140104550 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   1401230f2:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401230f9:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123100:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123107:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012310c:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140123110:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140123117:	4d 85 ed             	test   %r13,%r13
   14012311a:	74 0d                	je     140123129 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1789>
   14012311c:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123121:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123128:	00 
   140123129:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123130:	0f 85 ba 59 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140123136:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012313d:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123142:	0f 83 48 f4 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140123148:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012314f:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123156:	01 
   140123157:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012315c:	48 85 c9             	test   %rcx,%rcx
   14012315f:	0f 85 78 b5 00 00    	jne    14012e6dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd3d>
   140123165:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123169:	48 8d 3d 30 bf 29 00 	lea    0x29bf30(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123170:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140123174:	45 31 e4             	xor    %r12d,%r12d
   140123177:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012317b:	ff e0                	jmp    *%rax
   14012317d:	41 80 fc 02          	cmp    $0x2,%r12b
   140123181:	0f 84 25 7e 00 00    	je     14012afac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x960c>
   140123187:	41 80 fc 01          	cmp    $0x1,%r12b
   14012318b:	0f 84 54 98 00 00    	je     14012c9e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb045>
   140123191:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123198:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012319f:	c5 f8 77             	vzeroupper
   1401231a2:	4c 29 ce             	sub    %r9,%rsi
   1401231a5:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401231aa:	4c 29 c8             	sub    %r9,%rax
   1401231ad:	48 89 f7             	mov    %rsi,%rdi
   1401231b0:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401231b7:	48 c1 ff 03          	sar    $0x3,%rdi
   1401231bb:	48 39 f0             	cmp    %rsi,%rax
   1401231be:	0f 82 e7 85 00 00    	jb     14012b7ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e0b>
   1401231c4:	c5 f9 6f 05 f4 87 23 	vmovdqa 0x2387f4(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401231cb:	00 
   1401231cc:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401231d3:	4c 89 fa             	mov    %r15,%rdx
   1401231d6:	48 89 d9             	mov    %rbx,%rcx
   1401231d9:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401231e0:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401231e7:	00 
   1401231e8:	e8 33 03 fe ff       	call   140103520 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   1401231ed:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401231f4:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401231fb:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123202:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140123207:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012320b:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140123212:	4d 85 ed             	test   %r13,%r13
   140123215:	74 0d                	je     140123224 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1884>
   140123217:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012321c:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123223:	00 
   140123224:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012322b:	0f 85 bf 58 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140123231:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123238:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012323d:	0f 83 4d f3 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140123243:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012324a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123251:	01 
   140123252:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140123257:	48 85 c9             	test   %rcx,%rcx
   14012325a:	0f 85 ab b4 00 00    	jne    14012e70b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd6b>
   140123260:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123264:	48 8d 3d 35 be 29 00 	lea    0x29be35(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012326b:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012326f:	45 31 e4             	xor    %r12d,%r12d
   140123272:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123276:	ff e0                	jmp    *%rax
   140123278:	41 80 fc 02          	cmp    $0x2,%r12b
   14012327c:	0f 84 01 6f 00 00    	je     14012a183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87e3>
   140123282:	41 80 fc 01          	cmp    $0x1,%r12b
   140123286:	0f 84 16 97 00 00    	je     14012c9a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb002>
   14012328c:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123293:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012329a:	c5 f8 77             	vzeroupper
   14012329d:	4c 29 ce             	sub    %r9,%rsi
   1401232a0:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401232a5:	4c 29 c8             	sub    %r9,%rax
   1401232a8:	48 89 f7             	mov    %rsi,%rdi
   1401232ab:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401232b2:	48 c1 ff 03          	sar    $0x3,%rdi
   1401232b6:	48 39 f0             	cmp    %rsi,%rax
   1401232b9:	0f 82 6a 87 00 00    	jb     14012ba29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa089>
   1401232bf:	c5 f9 6f 05 f9 86 23 	vmovdqa 0x2386f9(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401232c6:	00 
   1401232c7:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401232ce:	4c 89 fa             	mov    %r15,%rdx
   1401232d1:	48 89 d9             	mov    %rbx,%rcx
   1401232d4:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401232db:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401232e2:	00 
   1401232e3:	e8 88 0e fe ff       	call   140104170 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   1401232e8:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   1401232ef:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401232f6:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401232fd:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140123302:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140123306:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012330d:	4d 85 ed             	test   %r13,%r13
   140123310:	74 0d                	je     14012331f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x197f>
   140123312:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123317:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012331e:	00 
   14012331f:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123326:	0f 85 c4 57 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012332c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123333:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123338:	0f 83 52 f2 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012333e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123345:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012334c:	01 
   14012334d:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140123352:	48 85 c9             	test   %rcx,%rcx
   140123355:	0f 85 fa c3 00 00    	jne    14012f755 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xddb5>
   14012335b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012335f:	48 8d 3d 3a bd 29 00 	lea    0x29bd3a(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123366:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012336a:	45 31 e4             	xor    %r12d,%r12d
   14012336d:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123371:	ff e0                	jmp    *%rax
   140123373:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012337a:	00 fb ff 
   14012337d:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   140123384:	00 
   140123385:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   14012338c:	00 
   14012338d:	41 80 fc 02          	cmp    $0x2,%r12b
   140123391:	0f 85 99 cb 00 00    	jne    14012ff30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe590>
   140123397:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   14012339e:	00 
   14012339f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401233a5:	48 89 84 24 40 03 00 	mov    %rax,0x340(%rsp)
   1401233ac:	00 
   1401233ad:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1401233b2:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
   1401233b9:	00 
   1401233ba:	48 89 c1             	mov    %rax,%rcx
   1401233bd:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401233c4:	00 ff ff 
   1401233c7:	49 89 c8             	mov    %rcx,%r8
   1401233ca:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   1401233d1:	00 f8 ff 
   1401233d4:	49 21 d0             	and    %rdx,%r8
   1401233d7:	49 39 c0             	cmp    %rax,%r8
   1401233da:	0f 84 1d 71 00 00    	je     14012a4fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b5d>
   1401233e0:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   1401233e7:	01 
   1401233e8:	48 8d 94 24 40 03 00 	lea    0x340(%rsp),%rdx
   1401233ef:	00 
   1401233f0:	48 8d 8c 24 38 03 00 	lea    0x338(%rsp),%rcx
   1401233f7:	00 
   1401233f8:	41 c6 46 ff 22       	movb   $0x22,-0x1(%r14)
   1401233fd:	c5 f8 77             	vzeroupper
   140123400:	e8 4b 56 0f 00       	call   140218a50 <setun::VMValue::mul(setun::VMValue const&) const>
   140123405:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   14012340c:	00 
   14012340d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123414:	0f 84 76 56 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   14012341a:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012341f:	0f 83 6b 56 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123425:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012342c:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123433:	01 
   140123434:	48 85 c9             	test   %rcx,%rcx
   140123437:	0f 85 80 db 00 00    	jne    140130fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf61d>
   14012343d:	41 0f b6 06          	movzbl (%r14),%eax
   140123441:	48 8d 3d 58 bc 29 00 	lea    0x29bc58(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123448:	49 83 c6 01          	add    $0x1,%r14
   14012344c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123450:	ff e0                	jmp    *%rax
   140123452:	41 0f b7 06          	movzwl (%r14),%eax
   140123456:	66 89 44 24 70       	mov    %ax,0x70(%rsp)
   14012345b:	66 85 c0             	test   %ax,%ax
   14012345e:	0f 88 ea d0 00 00    	js     14013054e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebae>
   140123464:	0f bf 6c 24 70       	movswl 0x70(%rsp),%ebp
   140123469:	83 c5 02             	add    $0x2,%ebp
   14012346c:	48 63 ed             	movslq %ebp,%rbp
   14012346f:	4c 01 f5             	add    %r14,%rbp
   140123472:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123479:	0f 85 fe 56 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   14012347f:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123484:	0f 83 f3 56 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   14012348a:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123491:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123498:	01 
   140123499:	48 85 c9             	test   %rcx,%rcx
   14012349c:	0f 85 d9 c0 00 00    	jne    14012f57b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbdb>
   1401234a2:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401234a6:	48 8d 3d f3 bb 29 00 	lea    0x29bbf3(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401234ad:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401234b1:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   1401234b4:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401234bb:	00 fb ff 
   1401234be:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   1401234c5:	00 
   1401234c6:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   1401234cd:	00 
   1401234ce:	41 80 fc 02          	cmp    $0x2,%r12b
   1401234d2:	0f 85 fd ca 00 00    	jne    14012ffd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe635>
   1401234d8:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401234df:	00 
   1401234e0:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401234e6:	48 89 84 24 b0 02 00 	mov    %rax,0x2b0(%rsp)
   1401234ed:	00 
   1401234ee:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1401234f3:	48 89 84 24 a8 02 00 	mov    %rax,0x2a8(%rsp)
   1401234fa:	00 
   1401234fb:	4c 8b 84 24 a8 02 00 	mov    0x2a8(%rsp),%r8
   140123502:	00 
   140123503:	48 8b 84 24 b0 02 00 	mov    0x2b0(%rsp),%rax
   14012350a:	00 
   14012350b:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123512:	00 ff ff 
   140123515:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   14012351c:	00 f8 ff 
   14012351f:	4c 89 c1             	mov    %r8,%rcx
   140123522:	48 21 d1             	and    %rdx,%rcx
   140123525:	4c 39 c9             	cmp    %r9,%rcx
   140123528:	0f 84 4f 62 00 00    	je     14012977d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ddd>
   14012352e:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140123535:	00 fd ff 
   140123538:	4c 39 d1             	cmp    %r10,%rcx
   14012353b:	0f 84 6d 95 00 00    	je     14012caae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb10e>
   140123541:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123548:	00 fc ff 
   14012354b:	4d 39 c8             	cmp    %r9,%r8
   14012354e:	0f 84 53 5e 00 00    	je     1401293a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   140123554:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   14012355b:	ff f7 ff 
   14012355e:	4c 39 c1             	cmp    %r8,%rcx
   140123561:	0f 83 40 5e 00 00    	jae    1401293a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   140123567:	4c 39 c8             	cmp    %r9,%rax
   14012356a:	0f 84 37 5e 00 00    	je     1401293a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   140123570:	48 39 c1             	cmp    %rax,%rcx
   140123573:	0f 83 2e 5e 00 00    	jae    1401293a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   140123579:	48 21 c2             	and    %rax,%rdx
   14012357c:	4c 39 d2             	cmp    %r10,%rdx
   14012357f:	0f 84 1a bc 00 00    	je     14012f19f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7ff>
   140123585:	48 8d 8c 24 a8 02 00 	lea    0x2a8(%rsp),%rcx
   14012358c:	00 
   14012358d:	c5 f8 77             	vzeroupper
   140123590:	e8 0b 60 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123595:	48 8d 8c 24 b0 02 00 	lea    0x2b0(%rsp),%rcx
   14012359c:	00 
   14012359d:	48 89 c7             	mov    %rax,%rdi
   1401235a0:	e8 fb 5f 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   1401235a5:	48 39 c7             	cmp    %rax,%rdi
   1401235a8:	0f 9d c0             	setge  %al
   1401235ab:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   1401235b2:	00 fa ff 
   1401235b5:	0f b6 c0             	movzbl %al,%eax
   1401235b8:	48 01 d0             	add    %rdx,%rax
   1401235bb:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401235c2:	00 
   1401235c3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401235ca:	0f 84 c0 54 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401235d0:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401235d5:	0f 83 b5 54 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401235db:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401235e2:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401235e9:	01 
   1401235ea:	48 85 c9             	test   %rcx,%rcx
   1401235ed:	0f 85 60 da 00 00    	jne    140131053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6b3>
   1401235f3:	41 0f b6 06          	movzbl (%r14),%eax
   1401235f7:	48 8d 3d a2 ba 29 00 	lea    0x29baa2(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401235fe:	49 83 c6 01          	add    $0x1,%r14
   140123602:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123606:	ff e0                	jmp    *%rax
   140123608:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012360f:	00 fb ff 
   140123612:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   140123619:	00 
   14012361a:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   140123621:	00 
   140123622:	41 80 fc 02          	cmp    $0x2,%r12b
   140123626:	0f 85 c4 c8 00 00    	jne    14012fef0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe550>
   14012362c:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140123633:	00 
   140123634:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012363a:	48 89 84 24 a0 02 00 	mov    %rax,0x2a0(%rsp)
   140123641:	00 
   140123642:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140123647:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
   14012364e:	00 
   14012364f:	4c 8b 84 24 98 02 00 	mov    0x298(%rsp),%r8
   140123656:	00 
   140123657:	48 8b 84 24 a0 02 00 	mov    0x2a0(%rsp),%rax
   14012365e:	00 
   14012365f:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123666:	00 ff ff 
   140123669:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   140123670:	00 f8 ff 
   140123673:	4c 89 c1             	mov    %r8,%rcx
   140123676:	48 21 d1             	and    %rdx,%rcx
   140123679:	4c 39 c9             	cmp    %r9,%rcx
   14012367c:	0f 84 13 62 00 00    	je     140129895 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef5>
   140123682:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   140123689:	00 fd ff 
   14012368c:	4c 39 d1             	cmp    %r10,%rcx
   14012368f:	0f 84 1b 95 00 00    	je     14012cbb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb210>
   140123695:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   14012369c:	00 fc ff 
   14012369f:	4d 39 c8             	cmp    %r9,%r8
   1401236a2:	0f 84 a5 5c 00 00    	je     14012934d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ad>
   1401236a8:	48 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rcx
   1401236af:	ff f7 ff 
   1401236b2:	4c 39 c1             	cmp    %r8,%rcx
   1401236b5:	0f 83 92 5c 00 00    	jae    14012934d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ad>
   1401236bb:	4c 39 c8             	cmp    %r9,%rax
   1401236be:	0f 84 89 5c 00 00    	je     14012934d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ad>
   1401236c4:	48 39 c1             	cmp    %rax,%rcx
   1401236c7:	0f 83 80 5c 00 00    	jae    14012934d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ad>
   1401236cd:	48 21 c2             	and    %rax,%rdx
   1401236d0:	4c 39 d2             	cmp    %r10,%rdx
   1401236d3:	0f 84 3a ab 00 00    	je     14012e213 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc873>
   1401236d9:	48 8d 8c 24 98 02 00 	lea    0x298(%rsp),%rcx
   1401236e0:	00 
   1401236e1:	c5 f8 77             	vzeroupper
   1401236e4:	e8 b7 5e 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   1401236e9:	48 8d 8c 24 a0 02 00 	lea    0x2a0(%rsp),%rcx
   1401236f0:	00 
   1401236f1:	48 89 c7             	mov    %rax,%rdi
   1401236f4:	e8 a7 5e 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   1401236f9:	48 39 c7             	cmp    %rax,%rdi
   1401236fc:	0f 9f c0             	setg   %al
   1401236ff:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123706:	00 fa ff 
   140123709:	0f b6 c0             	movzbl %al,%eax
   14012370c:	48 01 d0             	add    %rdx,%rax
   14012370f:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140123716:	00 
   140123717:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012371e:	0f 84 6c 53 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123724:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140123729:	0f 83 61 53 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   14012372f:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123736:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012373d:	01 
   14012373e:	48 85 c9             	test   %rcx,%rcx
   140123741:	0f 85 01 d6 00 00    	jne    140130d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3a8>
   140123747:	41 0f b6 06          	movzbl (%r14),%eax
   14012374b:	48 8d 3d 4e b9 29 00 	lea    0x29b94e(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123752:	49 83 c6 01          	add    $0x1,%r14
   140123756:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012375a:	ff e0                	jmp    *%rax
   14012375c:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123763:	00 fb ff 
   140123766:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   14012376d:	00 
   14012376e:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   140123775:	00 
   140123776:	41 80 fc 02          	cmp    $0x2,%r12b
   14012377a:	0f 85 c8 b5 00 00    	jne    14012ed48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3a8>
   140123780:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140123787:	00 
   140123788:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012378e:	48 89 84 24 90 02 00 	mov    %rax,0x290(%rsp)
   140123795:	00 
   140123796:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   14012379b:	48 89 84 24 88 02 00 	mov    %rax,0x288(%rsp)
   1401237a2:	00 
   1401237a3:	4c 8b 84 24 88 02 00 	mov    0x288(%rsp),%r8
   1401237aa:	00 
   1401237ab:	48 8b 84 24 90 02 00 	mov    0x290(%rsp),%rax
   1401237b2:	00 
   1401237b3:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401237ba:	00 ff ff 
   1401237bd:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   1401237c4:	00 f8 ff 
   1401237c7:	4c 89 c1             	mov    %r8,%rcx
   1401237ca:	48 21 d1             	and    %rdx,%rcx
   1401237cd:	4c 39 c9             	cmp    %r9,%rcx
   1401237d0:	0f 84 2d 66 00 00    	je     140129e03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8463>
   1401237d6:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   1401237dd:	00 fd ff 
   1401237e0:	4c 39 d1             	cmp    %r10,%rcx
   1401237e3:	0f 84 a2 94 00 00    	je     14012cc8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2eb>
   1401237e9:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   1401237f0:	00 fc ff 
   1401237f3:	49 39 c8             	cmp    %rcx,%r8
   1401237f6:	0f 84 05 5c 00 00    	je     140129401 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a61>
   1401237fc:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140123803:	ff f7 ff 
   140123806:	4d 39 c1             	cmp    %r8,%r9
   140123809:	0f 83 f2 5b 00 00    	jae    140129401 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a61>
   14012380f:	49 39 c1             	cmp    %rax,%r9
   140123812:	0f 83 e9 5b 00 00    	jae    140129401 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a61>
   140123818:	48 39 c8             	cmp    %rcx,%rax
   14012381b:	0f 84 e0 5b 00 00    	je     140129401 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a61>
   140123821:	48 21 c2             	and    %rax,%rdx
   140123824:	4c 39 d2             	cmp    %r10,%rdx
   140123827:	0f 84 a8 b5 00 00    	je     14012edd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd435>
   14012382d:	48 8d 8c 24 88 02 00 	lea    0x288(%rsp),%rcx
   140123834:	00 
   140123835:	c5 f8 77             	vzeroupper
   140123838:	e8 63 5d 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   14012383d:	48 8d 8c 24 90 02 00 	lea    0x290(%rsp),%rcx
   140123844:	00 
   140123845:	48 89 c7             	mov    %rax,%rdi
   140123848:	e8 53 5d 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   14012384d:	48 39 c7             	cmp    %rax,%rdi
   140123850:	0f 9e c0             	setle  %al
   140123853:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   14012385a:	00 fa ff 
   14012385d:	0f b6 c0             	movzbl %al,%eax
   140123860:	48 01 d0             	add    %rdx,%rax
   140123863:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   14012386a:	00 
   14012386b:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123872:	0f 84 18 52 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123878:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012387d:	0f 83 0d 52 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123883:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012388a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123891:	01 
   140123892:	48 85 c9             	test   %rcx,%rcx
   140123895:	0f 85 7b d2 00 00    	jne    140130b16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf176>
   14012389b:	41 0f b6 06          	movzbl (%r14),%eax
   14012389f:	48 8d 3d fa b7 29 00 	lea    0x29b7fa(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401238a6:	49 83 c6 01          	add    $0x1,%r14
   1401238aa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401238ae:	ff e0                	jmp    *%rax
   1401238b0:	41 80 fc 01          	cmp    $0x1,%r12b
   1401238b4:	0f 85 9d b7 00 00    	jne    14012f057 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6b7>
   1401238ba:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401238c1:	48 8b 94 24 90 01 00 	mov    0x190(%rsp),%rdx
   1401238c8:	00 
   1401238c9:	45 31 e4             	xor    %r12d,%r12d
   1401238cc:	4a 89 54 e8 10       	mov    %rdx,0x10(%rax,%r13,8)
   1401238d1:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   1401238d8:	01 
   1401238d9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401238e0:	0f 84 1a 52 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   1401238e6:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401238eb:	0f 83 0f 52 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   1401238f1:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401238f8:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401238ff:	01 
   140123900:	48 85 c9             	test   %rcx,%rcx
   140123903:	0f 85 89 bc 00 00    	jne    14012f592 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbf2>
   140123909:	41 0f b6 06          	movzbl (%r14),%eax
   14012390d:	48 8d 3d 8c b7 29 00 	lea    0x29b78c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123914:	49 83 c6 01          	add    $0x1,%r14
   140123918:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012391c:	ff e0                	jmp    *%rax
   14012391e:	41 80 fc 01          	cmp    $0x1,%r12b
   140123922:	0f 85 4b cb 00 00    	jne    140130473 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xead3>
   140123928:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012392f:	48 8b 94 24 90 01 00 	mov    0x190(%rsp),%rdx
   140123936:	00 
   140123937:	45 31 e4             	xor    %r12d,%r12d
   14012393a:	4a 89 54 e8 08       	mov    %rdx,0x8(%rax,%r13,8)
   14012393f:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140123946:	01 
   140123947:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012394e:	0f 84 ac 51 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140123954:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140123959:	0f 83 a1 51 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   14012395f:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123966:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012396d:	01 
   14012396e:	48 85 c9             	test   %rcx,%rcx
   140123971:	0f 85 e5 ca 00 00    	jne    14013045c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeabc>
   140123977:	41 0f b6 06          	movzbl (%r14),%eax
   14012397b:	48 8d 3d 1e b7 29 00 	lea    0x29b71e(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123982:	49 83 c6 01          	add    $0x1,%r14
   140123986:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012398a:	ff e0                	jmp    *%rax
   14012398c:	41 0f b7 16          	movzwl (%r14),%edx
   140123990:	4d 8b 87 b8 00 00 00 	mov    0xb8(%r15),%r8
   140123997:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   14012399b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401239a2:	00 fb ff 
   1401239a5:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   1401239ac:	00 
   1401239ad:	41 80 fc 01          	cmp    $0x1,%r12b
   1401239b1:	0f 85 d5 c4 00 00    	jne    14012fe8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4ec>
   1401239b7:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401239be:	00 
   1401239bf:	48 b9 00 00 00 00 00 	movabs $0xffff000000000000,%rcx
   1401239c6:	00 ff ff 
   1401239c9:	49 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%r9
   1401239d0:	00 fd ff 
   1401239d3:	48 21 c1             	and    %rax,%rcx
   1401239d6:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
   1401239dd:	00 
   1401239de:	4c 39 c9             	cmp    %r9,%rcx
   1401239e1:	0f 84 31 82 00 00    	je     14012bc18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa278>
   1401239e7:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401239ed:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   1401239f4:	00 f8 ff 
   1401239f7:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401239fe:	00 
   1401239ff:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123a06:	0f 85 62 51 00 00    	jne    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140123a0c:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123a11:	0f 83 57 51 00 00    	jae    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140123a17:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123a1e:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123a25:	01 
   140123a26:	48 85 c9             	test   %rcx,%rcx
   140123a29:	0f 85 ea d2 00 00    	jne    140130d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf379>
   140123a2f:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   140123a34:	48 8d 3d 65 b6 29 00 	lea    0x29b665(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123a3b:	49 83 c6 03          	add    $0x3,%r14
   140123a3f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123a43:	ff e0                	jmp    *%rax
   140123a45:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123a4c:	00 fb ff 
   140123a4f:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140123a56:	00 
   140123a57:	48 89 84 24 70 03 00 	mov    %rax,0x370(%rsp)
   140123a5e:	00 
   140123a5f:	41 80 fc 02          	cmp    $0x2,%r12b
   140123a63:	0f 85 ee b6 00 00    	jne    14012f157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7b7>
   140123a69:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140123a70:	00 
   140123a71:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123a77:	48 89 84 24 70 03 00 	mov    %rax,0x370(%rsp)
   140123a7e:	00 
   140123a7f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140123a84:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
   140123a8b:	00 
   140123a8c:	48 89 c2             	mov    %rax,%rdx
   140123a8f:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140123a96:	00 ff ff 
   140123a99:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140123aa0:	00 f8 ff 
   140123aa3:	48 21 c2             	and    %rax,%rdx
   140123aa6:	48 39 ca             	cmp    %rcx,%rdx
   140123aa9:	0f 84 c1 77 00 00    	je     14012b270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98d0>
   140123aaf:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   140123ab6:	01 
   140123ab7:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140123abe:	00 ff ff 
   140123ac1:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140123ac8:	00 f8 ff 
   140123acb:	41 c6 46 ff 30       	movb   $0x30,-0x1(%r14)
   140123ad0:	48 8b 8c 24 68 03 00 	mov    0x368(%rsp),%rcx
   140123ad7:	00 
   140123ad8:	48 89 c8             	mov    %rcx,%rax
   140123adb:	4c 21 c0             	and    %r8,%rax
   140123ade:	48 39 d0             	cmp    %rdx,%rax
   140123ae1:	0f 84 fe 72 00 00    	je     14012ade5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9445>
   140123ae7:	48 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%rdx
   140123aee:	00 fd ff 
   140123af1:	48 39 d0             	cmp    %rdx,%rax
   140123af4:	0f 84 de 72 00 00    	je     14012add8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9438>
   140123afa:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140123b01:	ff f7 ff 
   140123b04:	49 39 ca             	cmp    %rcx,%r10
   140123b07:	0f 83 21 59 00 00    	jae    14012942e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a8e>
   140123b0d:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123b14:	00 fc ff 
   140123b17:	4c 39 c9             	cmp    %r9,%rcx
   140123b1a:	0f 84 0e 59 00 00    	je     14012942e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a8e>
   140123b20:	48 8b 84 24 70 03 00 	mov    0x370(%rsp),%rax
   140123b27:	00 
   140123b28:	49 39 c2             	cmp    %rax,%r10
   140123b2b:	0f 83 fd 58 00 00    	jae    14012942e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a8e>
   140123b31:	4c 39 c8             	cmp    %r9,%rax
   140123b34:	0f 84 f4 58 00 00    	je     14012942e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a8e>
   140123b3a:	49 21 c0             	and    %rax,%r8
   140123b3d:	49 39 d0             	cmp    %rdx,%r8
   140123b40:	0f 84 9b c2 00 00    	je     14012fde1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe441>
   140123b46:	48 8d 8c 24 68 03 00 	lea    0x368(%rsp),%rcx
   140123b4d:	00 
   140123b4e:	c5 f8 77             	vzeroupper
   140123b51:	e8 4a 5a 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123b56:	48 8d 8c 24 70 03 00 	lea    0x370(%rsp),%rcx
   140123b5d:	00 
   140123b5e:	48 89 c7             	mov    %rax,%rdi
   140123b61:	e8 3a 5a 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123b66:	48 39 c7             	cmp    %rax,%rdi
   140123b69:	40 0f 94 c7          	sete   %dil
   140123b6d:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123b74:	00 fa ff 
   140123b77:	40 0f b6 c7          	movzbl %dil,%eax
   140123b7b:	48 01 d0             	add    %rdx,%rax
   140123b7e:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140123b85:	00 
   140123b86:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123b8d:	0f 84 fd 4e 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123b93:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140123b98:	0f 83 f2 4e 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123b9e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123ba5:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123bac:	01 
   140123bad:	48 85 c9             	test   %rcx,%rcx
   140123bb0:	0f 85 ea cf 00 00    	jne    140130ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf200>
   140123bb6:	41 0f b6 06          	movzbl (%r14),%eax
   140123bba:	48 8d 3d df b4 29 00 	lea    0x29b4df(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123bc1:	49 83 c6 01          	add    $0x1,%r14
   140123bc5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123bc9:	ff e0                	jmp    *%rax
   140123bcb:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123bd2:	00 fb ff 
   140123bd5:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140123bdc:	00 
   140123bdd:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140123be4:	00 
   140123be5:	41 80 fc 02          	cmp    $0x2,%r12b
   140123be9:	0f 85 11 b1 00 00    	jne    14012ed00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd360>
   140123bef:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140123bf6:	00 
   140123bf7:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123bfd:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
   140123c04:	00 
   140123c05:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140123c0a:	48 89 84 24 58 03 00 	mov    %rax,0x358(%rsp)
   140123c11:	00 
   140123c12:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123c19:	00 ff ff 
   140123c1c:	48 89 c1             	mov    %rax,%rcx
   140123c1f:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123c26:	00 f8 ff 
   140123c29:	48 21 d1             	and    %rdx,%rcx
   140123c2c:	4c 39 c1             	cmp    %r8,%rcx
   140123c2f:	0f 84 5c 5e 00 00    	je     140129a91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80f1>
   140123c35:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   140123c3c:	01 
   140123c3d:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140123c44:	00 ff ff 
   140123c47:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140123c4e:	00 f8 ff 
   140123c51:	41 c6 46 ff 33       	movb   $0x33,-0x1(%r14)
   140123c56:	48 8b 8c 24 58 03 00 	mov    0x358(%rsp),%rcx
   140123c5d:	00 
   140123c5e:	48 89 c8             	mov    %rcx,%rax
   140123c61:	4c 21 c0             	and    %r8,%rax
   140123c64:	48 39 d0             	cmp    %rdx,%rax
   140123c67:	0f 84 14 5d 00 00    	je     140129981 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fe1>
   140123c6d:	48 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%rdx
   140123c74:	00 fd ff 
   140123c77:	48 39 d0             	cmp    %rdx,%rax
   140123c7a:	0f 84 f4 5c 00 00    	je     140129974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fd4>
   140123c80:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140123c87:	ff f7 ff 
   140123c8a:	49 39 c9             	cmp    %rcx,%r9
   140123c8d:	0f 83 e7 56 00 00    	jae    14012937a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79da>
   140123c93:	49 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%r10
   140123c9a:	00 fc ff 
   140123c9d:	4c 39 d1             	cmp    %r10,%rcx
   140123ca0:	0f 84 d4 56 00 00    	je     14012937a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79da>
   140123ca6:	48 8b 84 24 60 03 00 	mov    0x360(%rsp),%rax
   140123cad:	00 
   140123cae:	4c 39 d0             	cmp    %r10,%rax
   140123cb1:	0f 84 c3 56 00 00    	je     14012937a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79da>
   140123cb7:	49 39 c1             	cmp    %rax,%r9
   140123cba:	0f 83 ba 56 00 00    	jae    14012937a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79da>
   140123cc0:	49 21 c0             	and    %rax,%r8
   140123cc3:	49 39 d0             	cmp    %rdx,%r8
   140123cc6:	0f 84 d5 be 00 00    	je     14012fba1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe201>
   140123ccc:	48 8d 8c 24 58 03 00 	lea    0x358(%rsp),%rcx
   140123cd3:	00 
   140123cd4:	c5 f8 77             	vzeroupper
   140123cd7:	e8 c4 58 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123cdc:	48 8d 8c 24 60 03 00 	lea    0x360(%rsp),%rcx
   140123ce3:	00 
   140123ce4:	48 89 c7             	mov    %rax,%rdi
   140123ce7:	e8 b4 58 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123cec:	48 39 c7             	cmp    %rax,%rdi
   140123cef:	0f 9e c0             	setle  %al
   140123cf2:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123cf9:	00 fa ff 
   140123cfc:	0f b6 c0             	movzbl %al,%eax
   140123cff:	48 01 d0             	add    %rdx,%rax
   140123d02:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140123d09:	00 
   140123d0a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123d11:	0f 84 79 4d 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123d17:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140123d1c:	0f 83 6e 4d 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123d22:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123d29:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123d30:	01 
   140123d31:	48 85 c9             	test   %rcx,%rcx
   140123d34:	0f 85 7d ce 00 00    	jne    140130bb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf217>
   140123d3a:	41 0f b6 06          	movzbl (%r14),%eax
   140123d3e:	48 8d 3d 5b b3 29 00 	lea    0x29b35b(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123d45:	49 83 c6 01          	add    $0x1,%r14
   140123d49:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123d4d:	ff e0                	jmp    *%rax
   140123d4f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140123d56:	00 fb ff 
   140123d59:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   140123d60:	00 
   140123d61:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   140123d68:	00 
   140123d69:	41 80 fc 02          	cmp    $0x2,%r12b
   140123d6d:	0f 85 a1 c6 00 00    	jne    140130414 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea74>
   140123d73:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140123d7a:	00 
   140123d7b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140123d81:	48 89 84 24 50 03 00 	mov    %rax,0x350(%rsp)
   140123d88:	00 
   140123d89:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140123d8e:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
   140123d95:	00 
   140123d96:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140123d9d:	00 ff ff 
   140123da0:	48 89 c1             	mov    %rax,%rcx
   140123da3:	49 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%r8
   140123daa:	00 f8 ff 
   140123dad:	48 21 d1             	and    %rdx,%rcx
   140123db0:	4c 39 c1             	cmp    %r8,%rcx
   140123db3:	0f 84 3d 71 00 00    	je     14012aef6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9556>
   140123db9:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   140123dc0:	01 
   140123dc1:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   140123dc8:	00 ff ff 
   140123dcb:	48 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%rdx
   140123dd2:	00 f8 ff 
   140123dd5:	41 c6 46 ff 32       	movb   $0x32,-0x1(%r14)
   140123dda:	48 8b 8c 24 48 03 00 	mov    0x348(%rsp),%rcx
   140123de1:	00 
   140123de2:	48 89 c8             	mov    %rcx,%rax
   140123de5:	4c 21 c0             	and    %r8,%rax
   140123de8:	48 39 d0             	cmp    %rdx,%rax
   140123deb:	0f 84 bc 67 00 00    	je     14012a5ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c0d>
   140123df1:	48 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%rdx
   140123df8:	00 fd ff 
   140123dfb:	48 39 d0             	cmp    %rdx,%rax
   140123dfe:	0f 84 9c 67 00 00    	je     14012a5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c00>
   140123e04:	49 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r10
   140123e0b:	ff f7 ff 
   140123e0e:	49 39 ca             	cmp    %rcx,%r10
   140123e11:	0f 83 bd 55 00 00    	jae    1401293d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a34>
   140123e17:	49 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%r9
   140123e1e:	00 fc ff 
   140123e21:	4c 39 c9             	cmp    %r9,%rcx
   140123e24:	0f 84 aa 55 00 00    	je     1401293d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a34>
   140123e2a:	48 8b 84 24 50 03 00 	mov    0x350(%rsp),%rax
   140123e31:	00 
   140123e32:	49 39 c2             	cmp    %rax,%r10
   140123e35:	0f 83 99 55 00 00    	jae    1401293d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a34>
   140123e3b:	4c 39 c8             	cmp    %r9,%rax
   140123e3e:	0f 84 90 55 00 00    	je     1401293d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a34>
   140123e44:	49 21 c0             	and    %rax,%r8
   140123e47:	49 39 d0             	cmp    %rdx,%r8
   140123e4a:	0f 84 f7 c2 00 00    	je     140130147 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7a7>
   140123e50:	48 8d 8c 24 48 03 00 	lea    0x348(%rsp),%rcx
   140123e57:	00 
   140123e58:	c5 f8 77             	vzeroupper
   140123e5b:	e8 40 57 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123e60:	48 8d 8c 24 50 03 00 	lea    0x350(%rsp),%rcx
   140123e67:	00 
   140123e68:	48 89 c7             	mov    %rax,%rdi
   140123e6b:	e8 30 57 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140123e70:	48 39 c7             	cmp    %rax,%rdi
   140123e73:	0f 9c c0             	setl   %al
   140123e76:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140123e7d:	00 fa ff 
   140123e80:	0f b6 c0             	movzbl %al,%eax
   140123e83:	48 01 d0             	add    %rdx,%rax
   140123e86:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140123e8d:	00 
   140123e8e:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140123e95:	0f 84 f5 4b 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123e9b:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140123ea0:	0f 83 ea 4b 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140123ea6:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123ead:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123eb4:	01 
   140123eb5:	48 85 c9             	test   %rcx,%rcx
   140123eb8:	0f 85 67 d1 00 00    	jne    140131025 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf685>
   140123ebe:	41 0f b6 06          	movzbl (%r14),%eax
   140123ec2:	48 8d 3d d7 b1 29 00 	lea    0x29b1d7(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123ec9:	49 83 c6 01          	add    $0x1,%r14
   140123ecd:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123ed1:	ff e0                	jmp    *%rax
   140123ed3:	41 80 fc 02          	cmp    $0x2,%r12b
   140123ed7:	0f 84 81 61 00 00    	je     14012a05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86be>
   140123edd:	41 80 fc 01          	cmp    $0x1,%r12b
   140123ee1:	0f 84 65 82 00 00    	je     14012c14c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7ac>
   140123ee7:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123eee:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123ef5:	c5 f8 77             	vzeroupper
   140123ef8:	4c 29 ce             	sub    %r9,%rsi
   140123efb:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140123f00:	4c 29 c8             	sub    %r9,%rax
   140123f03:	48 89 f7             	mov    %rsi,%rdi
   140123f06:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140123f0d:	48 c1 ff 03          	sar    $0x3,%rdi
   140123f11:	48 39 f0             	cmp    %rsi,%rax
   140123f14:	0f 82 80 79 00 00    	jb     14012b89a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9efa>
   140123f1a:	c5 f9 6f 05 9e 7a 23 	vmovdqa 0x237a9e(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140123f21:	00 
   140123f22:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140123f29:	4c 89 fa             	mov    %r15,%rdx
   140123f2c:	48 89 d9             	mov    %rbx,%rcx
   140123f2f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140123f36:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140123f3d:	00 
   140123f3e:	e8 fd 90 fe ff       	call   14010d040 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140123f43:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140123f4a:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123f51:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140123f58:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140123f5d:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140123f61:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140123f68:	4d 85 ed             	test   %r13,%r13
   140123f6b:	74 0d                	je     140123f7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25da>
   140123f6d:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140123f72:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140123f79:	00 
   140123f7a:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140123f81:	0f 85 69 4b 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140123f87:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123f8e:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140123f93:	0f 83 f7 e5 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140123f99:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140123fa0:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140123fa7:	01 
   140123fa8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140123fad:	48 85 c9             	test   %rcx,%rcx
   140123fb0:	0f 85 77 a3 00 00    	jne    14012e32d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc98d>
   140123fb6:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140123fba:	48 8d 3d df b0 29 00 	lea    0x29b0df(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123fc1:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140123fc5:	45 31 e4             	xor    %r12d,%r12d
   140123fc8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140123fcc:	ff e0                	jmp    *%rax
   140123fce:	41 80 fc 02          	cmp    $0x2,%r12b
   140123fd2:	0f 84 63 74 00 00    	je     14012b43b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a9b>
   140123fd8:	41 80 fc 01          	cmp    $0x1,%r12b
   140123fdc:	0f 84 8e 84 00 00    	je     14012c470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaad0>
   140123fe2:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140123fe9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140123ff0:	c5 f8 77             	vzeroupper
   140123ff3:	4c 29 ce             	sub    %r9,%rsi
   140123ff6:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140123ffb:	4c 29 c8             	sub    %r9,%rax
   140123ffe:	48 89 f7             	mov    %rsi,%rdi
   140124001:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124008:	48 c1 ff 03          	sar    $0x3,%rdi
   14012400c:	48 39 f0             	cmp    %rsi,%rax
   14012400f:	0f 82 d9 78 00 00    	jb     14012b8ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f4e>
   140124015:	c5 f9 6f 05 a3 79 23 	vmovdqa 0x2379a3(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   14012401c:	00 
   14012401d:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124024:	4c 89 fa             	mov    %r15,%rdx
   140124027:	48 89 d9             	mov    %rbx,%rcx
   14012402a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124031:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124038:	00 
   140124039:	e8 b2 be fe ff       	call   14010fef0 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   14012403e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124045:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012404c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124053:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124058:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012405c:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124063:	4d 85 ed             	test   %r13,%r13
   140124066:	74 0d                	je     140124075 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26d5>
   140124068:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012406d:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124074:	00 
   140124075:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012407c:	0f 85 6e 4a 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124082:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124089:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012408e:	0f 83 fc e4 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124094:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012409b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401240a2:	01 
   1401240a3:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401240a8:	48 85 c9             	test   %rcx,%rcx
   1401240ab:	0f 85 d8 a3 00 00    	jne    14012e489 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcae9>
   1401240b1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401240b5:	48 8d 3d e4 af 29 00 	lea    0x29afe4(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401240bc:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401240c0:	45 31 e4             	xor    %r12d,%r12d
   1401240c3:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401240c7:	ff e0                	jmp    *%rax
   1401240c9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401240cd:	0f 84 b9 70 00 00    	je     14012b18c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   1401240d3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401240d7:	0f 84 50 83 00 00    	je     14012c42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa8d>
   1401240dd:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401240e4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401240eb:	c5 f8 77             	vzeroupper
   1401240ee:	4c 29 ce             	sub    %r9,%rsi
   1401240f1:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401240f6:	4c 29 c8             	sub    %r9,%rax
   1401240f9:	48 89 f7             	mov    %rsi,%rdi
   1401240fc:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124103:	48 c1 ff 03          	sar    $0x3,%rdi
   140124107:	48 39 f0             	cmp    %rsi,%rax
   14012410a:	0f 82 c9 77 00 00    	jb     14012b8d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f39>
   140124110:	c5 f9 6f 05 a8 78 23 	vmovdqa 0x2378a8(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124117:	00 
   140124118:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012411f:	4c 89 fa             	mov    %r15,%rdx
   140124122:	48 89 d9             	mov    %rbx,%rcx
   140124125:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012412c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124133:	00 
   140124134:	e8 e7 7d fe ff       	call   14010bf20 <setun::VM::handle_println(setun::Chunk const&)>
   140124139:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124140:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124147:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012414e:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124153:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124157:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012415e:	4d 85 ed             	test   %r13,%r13
   140124161:	74 0d                	je     140124170 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27d0>
   140124163:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124168:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012416f:	00 
   140124170:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124177:	0f 85 73 49 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012417d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124184:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124189:	0f 83 01 e4 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012418f:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124196:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012419d:	01 
   14012419e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401241a3:	48 85 c9             	test   %rcx,%rcx
   1401241a6:	0f 85 98 a1 00 00    	jne    14012e344 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9a4>
   1401241ac:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401241b0:	48 8d 3d e9 ae 29 00 	lea    0x29aee9(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401241b7:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401241bb:	45 31 e4             	xor    %r12d,%r12d
   1401241be:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401241c2:	ff e0                	jmp    *%rax
   1401241c4:	41 80 fc 02          	cmp    $0x2,%r12b
   1401241c8:	0f 84 77 71 00 00    	je     14012b345 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99a5>
   1401241ce:	41 80 fc 01          	cmp    $0x1,%r12b
   1401241d2:	0f 84 e7 83 00 00    	je     14012c5bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac1f>
   1401241d8:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401241df:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401241e6:	c5 f8 77             	vzeroupper
   1401241e9:	4c 29 ce             	sub    %r9,%rsi
   1401241ec:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401241f1:	4c 29 c8             	sub    %r9,%rax
   1401241f4:	48 89 f7             	mov    %rsi,%rdi
   1401241f7:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401241fe:	48 c1 ff 03          	sar    $0x3,%rdi
   140124202:	48 39 f0             	cmp    %rsi,%rax
   140124205:	0f 82 b9 76 00 00    	jb     14012b8c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f24>
   14012420b:	c5 f9 6f 05 ad 77 23 	vmovdqa 0x2377ad(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124212:	00 
   140124213:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012421a:	4c 89 fa             	mov    %r15,%rdx
   14012421d:	48 89 d9             	mov    %rbx,%rcx
   140124220:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124227:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012422e:	00 
   14012422f:	e8 9c 84 fe ff       	call   14010c6d0 <setun::VM::handle_trace(setun::Chunk const&)>
   140124234:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012423b:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124242:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124249:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012424e:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124252:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124259:	4d 85 ed             	test   %r13,%r13
   14012425c:	74 0d                	je     14012426b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28cb>
   14012425e:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124263:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012426a:	00 
   14012426b:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124272:	0f 85 78 48 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124278:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012427f:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124284:	0f 83 06 e3 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012428a:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124291:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124298:	01 
   140124299:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012429e:	48 85 c9             	test   %rcx,%rcx
   1401242a1:	0f 85 10 a2 00 00    	jne    14012e4b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb17>
   1401242a7:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401242ab:	48 8d 3d ee ad 29 00 	lea    0x29adee(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242b2:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401242b6:	45 31 e4             	xor    %r12d,%r12d
   1401242b9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401242bd:	ff e0                	jmp    *%rax
   1401242bf:	41 80 fc 02          	cmp    $0x2,%r12b
   1401242c3:	0f 84 87 64 00 00    	je     14012a750 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8db0>
   1401242c9:	41 80 fc 01          	cmp    $0x1,%r12b
   1401242cd:	0f 84 a9 82 00 00    	je     14012c57c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabdc>
   1401242d3:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401242da:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401242e1:	c5 f8 77             	vzeroupper
   1401242e4:	4c 29 ce             	sub    %r9,%rsi
   1401242e7:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401242ec:	4c 29 c8             	sub    %r9,%rax
   1401242ef:	48 89 f7             	mov    %rsi,%rdi
   1401242f2:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401242f9:	48 c1 ff 03          	sar    $0x3,%rdi
   1401242fd:	48 39 f0             	cmp    %rsi,%rax
   140124300:	0f 82 a9 75 00 00    	jb     14012b8af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f0f>
   140124306:	c5 f9 6f 05 b2 76 23 	vmovdqa 0x2376b2(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   14012430d:	00 
   14012430e:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124315:	4c 89 fa             	mov    %r15,%rdx
   140124318:	48 89 d9             	mov    %rbx,%rcx
   14012431b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124322:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124329:	00 
   14012432a:	e8 d1 ea fd ff       	call   140102e00 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   14012432f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124336:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012433d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124344:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124349:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012434d:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124354:	4d 85 ed             	test   %r13,%r13
   140124357:	74 0d                	je     140124366 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29c6>
   140124359:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012435e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124365:	00 
   140124366:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012436d:	0f 85 7d 47 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124373:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012437a:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012437f:	0f 83 0b e2 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124385:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012438c:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124393:	01 
   140124394:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140124399:	48 85 c9             	test   %rcx,%rcx
   14012439c:	0f 85 fe a0 00 00    	jne    14012e4a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb00>
   1401243a2:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401243a6:	48 8d 3d f3 ac 29 00 	lea    0x29acf3(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401243ad:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401243b1:	45 31 e4             	xor    %r12d,%r12d
   1401243b4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401243b8:	ff e0                	jmp    *%rax
   1401243ba:	41 80 fc 02          	cmp    $0x2,%r12b
   1401243be:	0f 84 35 6f 00 00    	je     14012b2f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9959>
   1401243c4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401243c8:	0f 84 3b 7d 00 00    	je     14012c109 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa769>
   1401243ce:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401243d5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401243dc:	c5 f8 77             	vzeroupper
   1401243df:	4c 29 ce             	sub    %r9,%rsi
   1401243e2:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401243e7:	4c 29 c8             	sub    %r9,%rax
   1401243ea:	48 89 f7             	mov    %rsi,%rdi
   1401243ed:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401243f4:	48 c1 ff 03          	sar    $0x3,%rdi
   1401243f8:	48 39 f0             	cmp    %rsi,%rax
   1401243fb:	0f 82 84 74 00 00    	jb     14012b885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ee5>
   140124401:	c5 f9 6f 05 b7 75 23 	vmovdqa 0x2375b7(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124408:	00 
   140124409:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124410:	4c 89 fa             	mov    %r15,%rdx
   140124413:	48 89 d9             	mov    %rbx,%rcx
   140124416:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012441d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124424:	00 
   140124425:	e8 96 76 fe ff       	call   14010bac0 <setun::VM::handle_print(setun::Chunk const&)>
   14012442a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124431:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124438:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012443f:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124444:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124448:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012444f:	4d 85 ed             	test   %r13,%r13
   140124452:	74 0d                	je     140124461 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ac1>
   140124454:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124459:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124460:	00 
   140124461:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124468:	0f 85 82 46 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012446e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124475:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012447a:	0f 83 10 e1 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124480:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124487:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012448e:	01 
   14012448f:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140124494:	48 85 c9             	test   %rcx,%rcx
   140124497:	0f 85 31 a0 00 00    	jne    14012e4ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb2e>
   14012449d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401244a1:	48 8d 3d f8 ab 29 00 	lea    0x29abf8(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401244a8:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401244ac:	45 31 e4             	xor    %r12d,%r12d
   1401244af:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401244b3:	ff e0                	jmp    *%rax
   1401244b5:	41 80 fc 02          	cmp    $0x2,%r12b
   1401244b9:	0f 84 11 5f 00 00    	je     14012a3d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a30>
   1401244bf:	41 80 fc 01          	cmp    $0x1,%r12b
   1401244c3:	0f 84 09 7d 00 00    	je     14012c1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa832>
   1401244c9:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401244d0:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401244d7:	c5 f8 77             	vzeroupper
   1401244da:	4c 29 ce             	sub    %r9,%rsi
   1401244dd:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401244e2:	4c 29 c8             	sub    %r9,%rax
   1401244e5:	48 89 f7             	mov    %rsi,%rdi
   1401244e8:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401244ef:	48 c1 ff 03          	sar    $0x3,%rdi
   1401244f3:	48 39 f0             	cmp    %rsi,%rax
   1401244f6:	0f 82 74 73 00 00    	jb     14012b870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed0>
   1401244fc:	c5 f9 6f 05 bc 74 23 	vmovdqa 0x2374bc(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124503:	00 
   140124504:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012450b:	4c 89 fa             	mov    %r15,%rdx
   14012450e:	48 89 d9             	mov    %rbx,%rcx
   140124511:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124518:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012451f:	00 
   140124520:	e8 bb d7 fd ff       	call   140101ce0 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   140124525:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012452c:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124533:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012453a:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012453f:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124543:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012454a:	4d 85 ed             	test   %r13,%r13
   14012454d:	74 0d                	je     14012455c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bbc>
   14012454f:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124554:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012455b:	00 
   14012455c:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124563:	0f 85 87 45 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124569:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124570:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124575:	0f 83 15 e0 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012457b:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124582:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124589:	01 
   14012458a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012458f:	48 85 c9             	test   %rcx,%rcx
   140124592:	0f 85 eb b1 00 00    	jne    14012f783 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdde3>
   140124598:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012459c:	48 8d 3d fd aa 29 00 	lea    0x29aafd(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401245a3:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401245a7:	45 31 e4             	xor    %r12d,%r12d
   1401245aa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401245ae:	ff e0                	jmp    *%rax
   1401245b0:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401245b7:	00 fb ff 
   1401245ba:	48 89 84 24 c8 02 00 	mov    %rax,0x2c8(%rsp)
   1401245c1:	00 
   1401245c2:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   1401245c9:	00 
   1401245ca:	41 80 fc 02          	cmp    $0x2,%r12b
   1401245ce:	0f 85 bb a6 00 00    	jne    14012ec8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2ef>
   1401245d4:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1401245d9:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401245e0:	00 
   1401245e1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401245e8:	00 ff ff 
   1401245eb:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   1401245f2:	00 fd ff 
   1401245f5:	48 21 fa             	and    %rdi,%rdx
   1401245f8:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
   1401245ff:	00 
   140124600:	48 89 f8             	mov    %rdi,%rax
   140124603:	48 89 bc 24 c8 02 00 	mov    %rdi,0x2c8(%rsp)
   14012460a:	00 
   14012460b:	48 39 ca             	cmp    %rcx,%rdx
   14012460e:	0f 84 1b 6f 00 00    	je     14012b52f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b8f>
   140124614:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   14012461b:	00 f8 ff 
   14012461e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124624:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   14012462b:	00 
   14012462c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124633:	0f 84 c7 44 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124639:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012463e:	0f 83 bc 44 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124644:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012464b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124652:	01 
   140124653:	48 85 c9             	test   %rcx,%rcx
   140124656:	0f 85 ff 9d 00 00    	jne    14012e45b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcabb>
   14012465c:	41 0f b6 06          	movzbl (%r14),%eax
   140124660:	48 8d 3d 39 aa 29 00 	lea    0x29aa39(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124667:	49 83 c6 01          	add    $0x1,%r14
   14012466b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012466f:	ff e0                	jmp    *%rax
   140124671:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124678:	00 fb ff 
   14012467b:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   140124682:	00 
   140124683:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   14012468a:	00 
   14012468b:	41 80 fc 02          	cmp    $0x2,%r12b
   14012468f:	0f 85 05 ad 00 00    	jne    14012f39a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9fa>
   140124695:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   14012469c:	00 
   14012469d:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401246a3:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
   1401246aa:	00 
   1401246ab:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1401246b0:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
   1401246b7:	00 
   1401246b8:	48 8d 94 24 d0 01 00 	lea    0x1d0(%rsp),%rdx
   1401246bf:	00 
   1401246c0:	48 8d 8c 24 c8 01 00 	lea    0x1c8(%rsp),%rcx
   1401246c7:	00 
   1401246c8:	c5 f8 77             	vzeroupper
   1401246cb:	e8 00 3c 0f 00       	call   1402182d0 <setun::VMValue::div(setun::VMValue const&) const>
   1401246d0:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401246d7:	00 
   1401246d8:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401246df:	0f 84 ab 43 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401246e5:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401246ea:	0f 83 a0 43 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401246f0:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401246f7:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401246fe:	01 
   1401246ff:	48 85 c9             	test   %rcx,%rcx
   140124702:	0f 85 7b ac 00 00    	jne    14012f383 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9e3>
   140124708:	41 0f b6 06          	movzbl (%r14),%eax
   14012470c:	48 8d 3d 8d a9 29 00 	lea    0x29a98d(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124713:	49 83 c6 01          	add    $0x1,%r14
   140124717:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012471b:	ff e0                	jmp    *%rax
   14012471d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124724:	00 fb ff 
   140124727:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   14012472e:	00 
   14012472f:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140124736:	00 
   140124737:	41 80 fc 02          	cmp    $0x2,%r12b
   14012473b:	0f 85 31 b3 00 00    	jne    14012fa72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0d2>
   140124741:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140124748:	00 
   140124749:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012474f:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
   140124756:	00 
   140124757:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   14012475c:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
   140124763:	00 
   140124764:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012476b:	00 ff ff 
   14012476e:	49 89 c0             	mov    %rax,%r8
   140124771:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140124778:	00 f8 ff 
   14012477b:	49 21 d0             	and    %rdx,%r8
   14012477e:	49 39 c8             	cmp    %rcx,%r8
   140124781:	0f 84 e2 68 00 00    	je     14012b069 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140124787:	48 8d 94 24 b0 01 00 	lea    0x1b0(%rsp),%rdx
   14012478e:	00 
   14012478f:	48 8d 8c 24 a8 01 00 	lea    0x1a8(%rsp),%rcx
   140124796:	00 
   140124797:	c5 f8 77             	vzeroupper
   14012479a:	e8 21 4b 0f 00       	call   1402192c0 <setun::VMValue::sub(setun::VMValue const&) const>
   14012479f:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401247a6:	00 
   1401247a7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401247ae:	0f 84 dc 42 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401247b4:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401247b9:	0f 83 d1 42 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401247bf:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401247c6:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401247cd:	01 
   1401247ce:	48 85 c9             	test   %rcx,%rcx
   1401247d1:	0f 85 9b c3 00 00    	jne    140130b72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1d2>
   1401247d7:	41 0f b6 06          	movzbl (%r14),%eax
   1401247db:	48 8d 3d be a8 29 00 	lea    0x29a8be(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401247e2:	49 83 c6 01          	add    $0x1,%r14
   1401247e6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401247ea:	ff e0                	jmp    *%rax
   1401247ec:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401247f3:	00 fb ff 
   1401247f6:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   1401247fd:	00 
   1401247fe:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   140124805:	00 
   140124806:	41 80 fc 02          	cmp    $0x2,%r12b
   14012480a:	0f 85 a4 b4 00 00    	jne    14012fcb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe314>
   140124810:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140124817:	00 
   140124818:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012481e:	48 89 84 24 a0 01 00 	mov    %rax,0x1a0(%rsp)
   140124825:	00 
   140124826:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   14012482b:	48 89 84 24 98 01 00 	mov    %rax,0x198(%rsp)
   140124832:	00 
   140124833:	48 89 c1             	mov    %rax,%rcx
   140124836:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   14012483d:	00 ff ff 
   140124840:	49 89 c8             	mov    %rcx,%r8
   140124843:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   14012484a:	00 f8 ff 
   14012484d:	49 21 d0             	and    %rdx,%r8
   140124850:	49 39 c0             	cmp    %rax,%r8
   140124853:	0f 84 a8 64 00 00    	je     14012ad01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9361>
   140124859:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
   140124860:	00 
   140124861:	48 8d 8c 24 98 01 00 	lea    0x198(%rsp),%rcx
   140124868:	00 
   140124869:	c5 f8 77             	vzeroupper
   14012486c:	e8 8f 2f 0f 00       	call   140217800 <setun::VMValue::add(setun::VMValue const&) const>
   140124871:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140124878:	00 
   140124879:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124880:	0f 84 0a 42 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140124886:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012488b:	0f 83 ff 41 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140124891:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124898:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012489f:	01 
   1401248a0:	48 85 c9             	test   %rcx,%rcx
   1401248a3:	0f 85 b2 c2 00 00    	jne    140130b5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1bb>
   1401248a9:	41 0f b6 06          	movzbl (%r14),%eax
   1401248ad:	48 8d 3d ec a7 29 00 	lea    0x29a7ec(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401248b4:	49 83 c6 01          	add    $0x1,%r14
   1401248b8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401248bc:	ff e0                	jmp    *%rax
   1401248be:	41 0f b7 46 04       	movzwl 0x4(%r14),%eax
   1401248c3:	45 0f b7 06          	movzwl (%r14),%r8d
   1401248c7:	49 8d 6e 06          	lea    0x6(%r14),%rbp
   1401248cb:	45 0f b7 4e 02       	movzwl 0x2(%r14),%r9d
   1401248d0:	4a 8d 3c 28          	lea    (%rax,%r13,1),%rdi
   1401248d4:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   1401248db:	0f 83 33 b1 00 00    	jae    14012fa14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe074>
   1401248e1:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   1401248e8:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   1401248ef:	48 c1 f8 03          	sar    $0x3,%rax
   1401248f3:	48 39 c7             	cmp    %rax,%rdi
   1401248f6:	0f 83 e6 b0 00 00    	jae    14012f9e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe042>
   1401248fc:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124903:	41 0f b7 d0          	movzwl %r8w,%edx
   140124907:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   14012490e:	00 f8 ff 
   140124911:	4c 01 ea             	add    %r13,%rdx
   140124914:	48 8d 0c d0          	lea    (%rax,%rdx,8),%rcx
   140124918:	41 0f b7 d1          	movzwl %r9w,%edx
   14012491c:	49 b9 00 00 00 00 00 	movabs $0xffff000000000000,%r9
   140124923:	00 ff ff 
   140124926:	4c 8b 19             	mov    (%rcx),%r11
   140124929:	4c 01 ea             	add    %r13,%rdx
   14012492c:	48 8d 14 d0          	lea    (%rax,%rdx,8),%rdx
   140124930:	4d 89 d8             	mov    %r11,%r8
   140124933:	4d 21 c8             	and    %r9,%r8
   140124936:	4d 39 d0             	cmp    %r10,%r8
   140124939:	0f 84 52 6a 00 00    	je     14012b391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99f1>
   14012493f:	c5 f8 77             	vzeroupper
   140124942:	e8 b9 2e 0f 00       	call   140217800 <setun::VMValue::add(setun::VMValue const&) const>
   140124947:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   14012494e:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140124952:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140124959:	01 
   14012495a:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124961:	0f 85 0a 42 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140124967:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012496c:	0f 83 ff 41 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140124972:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124979:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124980:	01 
   140124981:	48 85 c9             	test   %rcx,%rcx
   140124984:	0f 85 55 c6 00 00    	jne    140130fdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf63f>
   14012498a:	41 0f b6 46 06       	movzbl 0x6(%r14),%eax
   14012498f:	48 8d 3d 0a a7 29 00 	lea    0x29a70a(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124996:	49 83 c6 07          	add    $0x7,%r14
   14012499a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012499e:	ff e0                	jmp    *%rax
   1401249a0:	41 0f b7 3e          	movzwl (%r14),%edi
   1401249a4:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   1401249a8:	4c 01 ef             	add    %r13,%rdi
   1401249ab:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   1401249b2:	0f 83 87 a9 00 00    	jae    14012f33f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd99f>
   1401249b8:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   1401249bf:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   1401249c6:	48 c1 f8 03          	sar    $0x3,%rax
   1401249ca:	48 39 c7             	cmp    %rax,%rdi
   1401249cd:	0f 83 54 a9 00 00    	jae    14012f327 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd987>
   1401249d3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401249d7:	0f 85 15 aa 00 00    	jne    14012f3f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda52>
   1401249dd:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   1401249e4:	48 8b 94 24 90 01 00 	mov    0x190(%rsp),%rdx
   1401249eb:	00 
   1401249ec:	45 31 e4             	xor    %r12d,%r12d
   1401249ef:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
   1401249f3:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   1401249fa:	01 
   1401249fb:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124a02:	0f 85 75 41 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140124a08:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124a0d:	0f 83 6a 41 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140124a13:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124a1a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124a21:	01 
   140124a22:	48 85 c9             	test   %rcx,%rcx
   140124a25:	0f 85 af a9 00 00    	jne    14012f3da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda3a>
   140124a2b:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   140124a30:	48 8d 3d 69 a6 29 00 	lea    0x29a669(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124a37:	49 83 c6 03          	add    $0x3,%r14
   140124a3b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124a3f:	ff e0                	jmp    *%rax
   140124a41:	41 80 fc 01          	cmp    $0x1,%r12b
   140124a45:	0f 85 31 9c 00 00    	jne    14012e67c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccdc>
   140124a4b:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124a52:	48 8b 94 24 90 01 00 	mov    0x190(%rsp),%rdx
   140124a59:	00 
   140124a5a:	45 31 e4             	xor    %r12d,%r12d
   140124a5d:	4a 89 54 e8 18       	mov    %rdx,0x18(%rax,%r13,8)
   140124a62:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140124a69:	01 
   140124a6a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124a71:	0f 84 89 40 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124a77:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140124a7c:	0f 83 7e 40 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124a82:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124a89:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124a90:	01 
   140124a91:	48 85 c9             	test   %rcx,%rcx
   140124a94:	0f 85 cb 9b 00 00    	jne    14012e665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccc5>
   140124a9a:	41 0f b6 06          	movzbl (%r14),%eax
   140124a9e:	48 8d 3d fb a5 29 00 	lea    0x29a5fb(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124aa5:	49 83 c6 01          	add    $0x1,%r14
   140124aa9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124aad:	ff e0                	jmp    *%rax
   140124aaf:	41 80 fc 02          	cmp    $0x2,%r12b
   140124ab3:	0f 84 e6 5f 00 00    	je     14012aa9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90ff>
   140124ab9:	41 80 fc 01          	cmp    $0x1,%r12b
   140124abd:	0f 84 cc 76 00 00    	je     14012c18f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7ef>
   140124ac3:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124aca:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124ad1:	c5 f8 77             	vzeroupper
   140124ad4:	4c 29 ce             	sub    %r9,%rsi
   140124ad7:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140124adc:	4c 29 c8             	sub    %r9,%rax
   140124adf:	48 89 f7             	mov    %rsi,%rdi
   140124ae2:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124ae9:	48 c1 ff 03          	sar    $0x3,%rdi
   140124aed:	48 39 f0             	cmp    %rsi,%rax
   140124af0:	0f 82 65 6d 00 00    	jb     14012b85b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ebb>
   140124af6:	c5 f9 6f 05 c2 6e 23 	vmovdqa 0x236ec2(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124afd:	00 
   140124afe:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124b05:	4c 89 fa             	mov    %r15,%rdx
   140124b08:	48 89 d9             	mov    %rbx,%rcx
   140124b0b:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124b12:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124b19:	00 
   140124b1a:	e8 41 98 fd ff       	call   1400fe360 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140124b1f:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124b26:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124b2d:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124b34:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124b39:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124b3d:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124b44:	4d 85 ed             	test   %r13,%r13
   140124b47:	74 0d                	je     140124b56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31b6>
   140124b49:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124b4e:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124b55:	00 
   140124b56:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124b5d:	0f 85 8d 3f 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124b63:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124b6a:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124b6f:	0f 83 1b da ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124b75:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124b7c:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124b83:	01 
   140124b84:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140124b89:	48 85 c9             	test   %rcx,%rcx
   140124b8c:	0f 85 2c b8 00 00    	jne    1401303be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea1e>
   140124b92:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124b96:	48 8d 3d 03 a5 29 00 	lea    0x29a503(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124b9d:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140124ba1:	45 31 e4             	xor    %r12d,%r12d
   140124ba4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124ba8:	ff e0                	jmp    *%rax
   140124baa:	41 80 fc 02          	cmp    $0x2,%r12b
   140124bae:	0f 84 70 66 00 00    	je     14012b224 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9884>
   140124bb4:	41 80 fc 01          	cmp    $0x1,%r12b
   140124bb8:	0f 84 ab 7b 00 00    	je     14012c769 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadc9>
   140124bbe:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124bc5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124bcc:	c5 f8 77             	vzeroupper
   140124bcf:	4c 29 ce             	sub    %r9,%rsi
   140124bd2:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140124bd7:	4c 29 c8             	sub    %r9,%rax
   140124bda:	48 89 f7             	mov    %rsi,%rdi
   140124bdd:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124be4:	48 c1 ff 03          	sar    $0x3,%rdi
   140124be8:	48 39 f0             	cmp    %rsi,%rax
   140124beb:	0f 82 55 6c 00 00    	jb     14012b846 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ea6>
   140124bf1:	c5 f9 6f 05 c7 6d 23 	vmovdqa 0x236dc7(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124bf8:	00 
   140124bf9:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124c00:	4c 89 fa             	mov    %r15,%rdx
   140124c03:	48 89 d9             	mov    %rbx,%rcx
   140124c06:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124c0d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124c14:	00 
   140124c15:	e8 96 b3 fd ff       	call   1400fffb0 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140124c1a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124c21:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124c28:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124c2f:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124c34:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124c38:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124c3f:	4d 85 ed             	test   %r13,%r13
   140124c42:	74 0d                	je     140124c51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32b1>
   140124c44:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124c49:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124c50:	00 
   140124c51:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124c58:	0f 85 92 3e 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124c5e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124c65:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124c6a:	0f 83 20 d9 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124c70:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124c77:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124c7e:	01 
   140124c7f:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140124c84:	48 85 c9             	test   %rcx,%rcx
   140124c87:	0f 85 6f b0 00 00    	jne    14012fcfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe35c>
   140124c8d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124c91:	48 8d 3d 08 a4 29 00 	lea    0x29a408(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c98:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140124c9c:	45 31 e4             	xor    %r12d,%r12d
   140124c9f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124ca3:	ff e0                	jmp    *%rax
   140124ca5:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140124ca9:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   140124cb0:	00 
   140124cb1:	45 84 e4             	test   %r12b,%r12b
   140124cb4:	48 0f 44 c2          	cmove  %rdx,%rax
   140124cb8:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140124cbf:	48 8b 00             	mov    (%rax),%rax
   140124cc2:	4a 89 44 ea 10       	mov    %rax,0x10(%rdx,%r13,8)
   140124cc7:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124cce:	0f 84 2c 3e 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124cd4:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140124cd9:	0f 83 21 3e 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124cdf:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124ce6:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124ced:	01 
   140124cee:	48 85 c9             	test   %rcx,%rcx
   140124cf1:	0f 85 56 a2 00 00    	jne    14012ef4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5ad>
   140124cf7:	41 0f b6 06          	movzbl (%r14),%eax
   140124cfb:	48 8d 3d 9e a3 29 00 	lea    0x29a39e(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d02:	49 83 c6 01          	add    $0x1,%r14
   140124d06:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124d0a:	ff e0                	jmp    *%rax
   140124d0c:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140124d13:	00 fb ff 
   140124d16:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140124d1d:	00 
   140124d1e:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140124d25:	00 
   140124d26:	41 80 fc 02          	cmp    $0x2,%r12b
   140124d2a:	0f 85 7f a1 00 00    	jne    14012eeaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd50f>
   140124d30:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140124d37:	00 
   140124d38:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140124d3e:	48 89 84 24 40 02 00 	mov    %rax,0x240(%rsp)
   140124d45:	00 
   140124d46:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140124d4b:	48 89 84 24 38 02 00 	mov    %rax,0x238(%rsp)
   140124d52:	00 
   140124d53:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   140124d5a:	00 
   140124d5b:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   140124d62:	ff ff ff 
   140124d65:	48 ba 00 00 00 00 01 	movabs $0xfffd000100000000,%rdx
   140124d6c:	00 fd ff 
   140124d6f:	48 21 c1             	and    %rax,%rcx
   140124d72:	48 39 d1             	cmp    %rdx,%rcx
   140124d75:	0f 84 95 7f 00 00    	je     14012cd10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb370>
   140124d7b:	48 23 84 24 40 02 00 	and    0x240(%rsp),%rax
   140124d82:	00 
   140124d83:	48 39 d0             	cmp    %rdx,%rax
   140124d86:	0f 84 84 7f 00 00    	je     14012cd10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb370>
   140124d8c:	48 8d 8c 24 38 02 00 	lea    0x238(%rsp),%rcx
   140124d93:	00 
   140124d94:	c5 f8 77             	vzeroupper
   140124d97:	e8 04 48 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140124d9c:	48 8d 8c 24 40 02 00 	lea    0x240(%rsp),%rcx
   140124da3:	00 
   140124da4:	48 89 c7             	mov    %rax,%rdi
   140124da7:	e8 f4 47 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140124dac:	48 8b 8c 24 38 02 00 	mov    0x238(%rsp),%rcx
   140124db3:	00 
   140124db4:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140124dbb:	00 ff ff 
   140124dbe:	49 b8 00 00 00 00 00 	movabs $0xfffa000000000000,%r8
   140124dc5:	00 fa ff 
   140124dc8:	48 21 d1             	and    %rdx,%rcx
   140124dcb:	4c 39 c1             	cmp    %r8,%rcx
   140124dce:	75 11                	jne    140124de1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3441>
   140124dd0:	48 23 94 24 40 02 00 	and    0x240(%rsp),%rdx
   140124dd7:	00 
   140124dd8:	48 39 ca             	cmp    %rcx,%rdx
   140124ddb:	0f 84 62 83 00 00    	je     14012d143 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7a3>
   140124de1:	48 39 c7             	cmp    %rax,%rdi
   140124de4:	48 8d 8c 24 30 07 00 	lea    0x730(%rsp),%rcx
   140124deb:	00 
   140124dec:	48 0f 4e c7          	cmovle %rdi,%rax
   140124df0:	48 89 c2             	mov    %rax,%rdx
   140124df3:	e8 48 99 0e 00       	call   14020e740 <setun::VMValue::VMValue(long long)>
   140124df8:	48 8b 84 24 30 07 00 	mov    0x730(%rsp),%rax
   140124dff:	00 
   140124e00:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140124e07:	00 
   140124e08:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e0f:	0f 84 7b 3c 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140124e15:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140124e1a:	0f 83 70 3c 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140124e20:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124e27:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124e2e:	01 
   140124e2f:	48 85 c9             	test   %rcx,%rcx
   140124e32:	0f 85 40 b1 00 00    	jne    14012ff78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5d8>
   140124e38:	41 0f b6 06          	movzbl (%r14),%eax
   140124e3c:	48 8d 3d 5d a2 29 00 	lea    0x29a25d(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e43:	49 83 c6 01          	add    $0x1,%r14
   140124e47:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124e4b:	ff e0                	jmp    *%rax
   140124e4d:	41 80 fc 01          	cmp    $0x1,%r12b
   140124e51:	0f 85 cf b4 00 00    	jne    140130326 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe986>
   140124e57:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140124e5e:	48 8b 94 24 90 01 00 	mov    0x190(%rsp),%rdx
   140124e65:	00 
   140124e66:	45 31 e4             	xor    %r12d,%r12d
   140124e69:	4a 89 14 e8          	mov    %rdx,(%rax,%r13,8)
   140124e6d:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140124e74:	01 
   140124e75:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140124e7c:	0f 84 7e 3c 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124e82:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140124e87:	0f 83 73 3c 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140124e8d:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124e94:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124e9b:	01 
   140124e9c:	48 85 c9             	test   %rcx,%rcx
   140124e9f:	0f 85 6a b4 00 00    	jne    14013030f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe96f>
   140124ea5:	41 0f b6 06          	movzbl (%r14),%eax
   140124ea9:	48 8d 3d f0 a1 29 00 	lea    0x29a1f0(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124eb0:	49 83 c6 01          	add    $0x1,%r14
   140124eb4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124eb8:	ff e0                	jmp    *%rax
   140124eba:	41 80 fc 02          	cmp    $0x2,%r12b
   140124ebe:	0f 84 8f 5b 00 00    	je     14012aa53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90b3>
   140124ec4:	41 80 fc 01          	cmp    $0x1,%r12b
   140124ec8:	0f 84 58 78 00 00    	je     14012c726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad86>
   140124ece:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124ed5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124edc:	c5 f8 77             	vzeroupper
   140124edf:	4c 29 ce             	sub    %r9,%rsi
   140124ee2:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140124ee7:	4c 29 c8             	sub    %r9,%rax
   140124eea:	48 89 f7             	mov    %rsi,%rdi
   140124eed:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124ef4:	48 c1 ff 03          	sar    $0x3,%rdi
   140124ef8:	48 39 f0             	cmp    %rsi,%rax
   140124efb:	0f 82 6b 6a 00 00    	jb     14012b96c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fcc>
   140124f01:	c5 f9 6f 05 b7 6a 23 	vmovdqa 0x236ab7(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140124f08:	00 
   140124f09:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140124f10:	4c 89 fa             	mov    %r15,%rdx
   140124f13:	48 89 d9             	mov    %rbx,%rcx
   140124f16:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140124f1d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140124f24:	00 
   140124f25:	e8 b6 e9 fd ff       	call   1401038e0 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140124f2a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140124f31:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124f38:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140124f3f:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140124f44:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140124f48:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140124f4f:	4d 85 ed             	test   %r13,%r13
   140124f52:	74 0d                	je     140124f61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35c1>
   140124f54:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140124f59:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140124f60:	00 
   140124f61:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140124f68:	0f 85 82 3b 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140124f6e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124f75:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140124f7a:	0f 83 10 d6 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140124f80:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140124f87:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140124f8e:	01 
   140124f8f:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140124f94:	48 85 c9             	test   %rcx,%rcx
   140124f97:	0f 85 61 b2 00 00    	jne    1401301fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe85e>
   140124f9d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140124fa1:	48 8d 3d f8 a0 29 00 	lea    0x29a0f8(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124fa8:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140124fac:	45 31 e4             	xor    %r12d,%r12d
   140124faf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140124fb3:	ff e0                	jmp    *%rax
   140124fb5:	41 80 fc 02          	cmp    $0x2,%r12b
   140124fb9:	0f 84 53 50 00 00    	je     14012a012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8672>
   140124fbf:	41 80 fc 01          	cmp    $0x1,%r12b
   140124fc3:	0f 84 34 70 00 00    	je     14012bffd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa65d>
   140124fc9:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140124fd0:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140124fd7:	c5 f8 77             	vzeroupper
   140124fda:	4c 29 ce             	sub    %r9,%rsi
   140124fdd:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140124fe2:	4c 29 c8             	sub    %r9,%rax
   140124fe5:	48 89 f7             	mov    %rsi,%rdi
   140124fe8:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140124fef:	48 c1 ff 03          	sar    $0x3,%rdi
   140124ff3:	48 39 f0             	cmp    %rsi,%rax
   140124ff6:	0f 82 85 69 00 00    	jb     14012b981 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fe1>
   140124ffc:	c5 f9 6f 05 bc 69 23 	vmovdqa 0x2369bc(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125003:	00 
   140125004:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012500b:	4c 89 fa             	mov    %r15,%rdx
   14012500e:	48 89 d9             	mov    %rbx,%rcx
   140125011:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125018:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012501f:	00 
   140125020:	e8 eb 7a fe ff       	call   14010cb10 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140125025:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012502c:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125033:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012503a:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012503f:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140125043:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012504a:	4d 85 ed             	test   %r13,%r13
   14012504d:	74 0d                	je     14012505c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36bc>
   14012504f:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140125054:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012505b:	00 
   14012505c:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125063:	0f 85 87 3a 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125069:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125070:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125075:	0f 83 15 d5 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012507b:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125082:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125089:	01 
   14012508a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012508f:	48 85 c9             	test   %rcx,%rcx
   140125092:	0f 85 59 a5 00 00    	jne    14012f5f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc51>
   140125098:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012509c:	48 8d 3d fd 9f 29 00 	lea    0x299ffd(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401250a3:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401250a7:	45 31 e4             	xor    %r12d,%r12d
   1401250aa:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401250ae:	ff e0                	jmp    *%rax
   1401250b0:	41 80 fc 02          	cmp    $0x2,%r12b
   1401250b4:	0f 84 4a 56 00 00    	je     14012a704 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d64>
   1401250ba:	41 80 fc 01          	cmp    $0x1,%r12b
   1401250be:	0f 84 a3 77 00 00    	je     14012c867 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaec7>
   1401250c4:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401250cb:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401250d2:	c5 f8 77             	vzeroupper
   1401250d5:	4c 29 ce             	sub    %r9,%rsi
   1401250d8:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401250dd:	4c 29 c8             	sub    %r9,%rax
   1401250e0:	48 89 f7             	mov    %rsi,%rdi
   1401250e3:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401250ea:	48 c1 ff 03          	sar    $0x3,%rdi
   1401250ee:	48 39 f0             	cmp    %rsi,%rax
   1401250f1:	0f 82 9f 68 00 00    	jb     14012b996 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ff6>
   1401250f7:	c5 f9 6f 05 c1 68 23 	vmovdqa 0x2368c1(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401250fe:	00 
   1401250ff:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125106:	4c 89 fa             	mov    %r15,%rdx
   140125109:	48 89 d9             	mov    %rbx,%rcx
   14012510c:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125113:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012511a:	00 
   14012511b:	e8 00 b8 fe ff       	call   140110920 <setun::VM::handle_set_field(setun::Chunk const&)>
   140125120:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125127:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012512e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125135:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012513a:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012513e:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125145:	4d 85 ed             	test   %r13,%r13
   140125148:	74 0d                	je     140125157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37b7>
   14012514a:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012514f:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125156:	00 
   140125157:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012515e:	0f 85 8c 39 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125164:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012516b:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125170:	0f 83 1a d4 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125176:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012517d:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125184:	01 
   140125185:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012518a:	48 85 c9             	test   %rcx,%rcx
   14012518d:	0f 85 3f 9e 00 00    	jne    14012efd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd632>
   140125193:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140125197:	48 8d 3d 02 9f 29 00 	lea    0x299f02(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012519e:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401251a2:	45 31 e4             	xor    %r12d,%r12d
   1401251a5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401251a9:	ff e0                	jmp    *%rax
   1401251ab:	45 84 e4             	test   %r12b,%r12b
   1401251ae:	0f 85 ed 3f 00 00    	jne    1401291a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7801>
   1401251b4:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401251bb:	48 85 c9             	test   %rcx,%rcx
   1401251be:	0f 85 3b b9 00 00    	jne    140130aff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf15f>
   1401251c4:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   1401251c8:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401251ce:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401251d5:	00 
   1401251d6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401251dd:	0f 84 1d 39 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   1401251e3:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401251e8:	0f 83 12 39 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   1401251ee:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401251f5:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401251fc:	01 
   1401251fd:	48 85 c9             	test   %rcx,%rcx
   140125200:	0f 85 a9 94 00 00    	jne    14012e6af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd0f>
   140125206:	41 0f b6 06          	movzbl (%r14),%eax
   14012520a:	48 8d 3d 8f 9e 29 00 	lea    0x299e8f(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125211:	49 83 c6 01          	add    $0x1,%r14
   140125215:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125219:	ff e0                	jmp    *%rax
   14012521b:	41 0f b7 16          	movzwl (%r14),%edx
   14012521f:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125226:	49 8d 6e 04          	lea    0x4(%r14),%rbp
   14012522a:	45 0f b7 5e 02       	movzwl 0x2(%r14),%r11d
   14012522f:	4c 01 ea             	add    %r13,%rdx
   140125232:	4c 8d 14 d0          	lea    (%rax,%rdx,8),%r10
   140125236:	45 84 e4             	test   %r12b,%r12b
   140125239:	0f 85 49 9b 00 00    	jne    14012ed88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3e8>
   14012523f:	49 8b 3a             	mov    (%r10),%rdi
   140125242:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125249:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   14012524e:	41 0f b7 d3          	movzwl %r11w,%edx
   140125252:	4c 01 ea             	add    %r13,%rdx
   140125255:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   140125259:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140125260:	01 
   140125261:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125268:	00 
   140125269:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125270:	0f 85 55 7e 00 00    	jne    14012d0cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb72b>
   140125276:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012527b:	0f 83 4a 7e 00 00    	jae    14012d0cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb72b>
   140125281:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125288:	01 
   140125289:	48 85 c9             	test   %rcx,%rcx
   14012528c:	0f 85 53 92 00 00    	jne    14012e4e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb45>
   140125292:	41 0f b6 46 04       	movzbl 0x4(%r14),%eax
   140125297:	41 bc 02 00 00 00    	mov    $0x2,%r12d
   14012529d:	49 83 c6 05          	add    $0x5,%r14
   1401252a1:	48 8d 3d f8 9d 29 00 	lea    0x299df8(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401252a8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401252ac:	ff e0                	jmp    *%rax
   1401252ae:	41 80 fc 02          	cmp    $0x2,%r12b
   1401252b2:	0f 84 cc 50 00 00    	je     14012a384 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89e4>
   1401252b8:	41 80 fc 01          	cmp    $0x1,%r12b
   1401252bc:	0f 84 21 74 00 00    	je     14012c6e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad43>
   1401252c2:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401252c9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401252d0:	c5 f8 77             	vzeroupper
   1401252d3:	4c 29 ce             	sub    %r9,%rsi
   1401252d6:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401252db:	4c 29 c8             	sub    %r9,%rax
   1401252de:	48 89 f7             	mov    %rsi,%rdi
   1401252e1:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401252e8:	48 c1 ff 03          	sar    $0x3,%rdi
   1401252ec:	48 39 f0             	cmp    %rsi,%rax
   1401252ef:	0f 82 62 66 00 00    	jb     14012b957 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fb7>
   1401252f5:	c5 f9 6f 05 c3 66 23 	vmovdqa 0x2366c3(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401252fc:	00 
   1401252fd:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125304:	4c 89 fa             	mov    %r15,%rdx
   140125307:	48 89 d9             	mov    %rbx,%rcx
   14012530a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125311:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125318:	00 
   140125319:	e8 c2 96 fd ff       	call   1400fe9e0 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   14012531e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125325:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012532c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125333:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125338:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012533c:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125343:	4d 85 ed             	test   %r13,%r13
   140125346:	74 0d                	je     140125355 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39b5>
   140125348:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012534d:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125354:	00 
   140125355:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012535c:	0f 85 8e 37 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125362:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125369:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012536e:	0f 83 1c d2 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125374:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012537b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125382:	01 
   140125383:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140125388:	48 85 c9             	test   %rcx,%rcx
   14012538b:	0f 85 9a a9 00 00    	jne    14012fd2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe38b>
   140125391:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140125395:	48 8d 3d 04 9d 29 00 	lea    0x299d04(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012539c:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401253a0:	45 31 e4             	xor    %r12d,%r12d
   1401253a3:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401253a7:	ff e0                	jmp    *%rax
   1401253a9:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401253b0:	00 fb ff 
   1401253b3:	48 89 84 24 00 03 00 	mov    %rax,0x300(%rsp)
   1401253ba:	00 
   1401253bb:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   1401253c2:	00 
   1401253c3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401253c7:	0f 85 c7 91 00 00    	jne    14012e594 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbf4>
   1401253cd:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401253d4:	00 
   1401253d5:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401253dc:	45 31 e4             	xor    %r12d,%r12d
   1401253df:	48 89 84 24 00 03 00 	mov    %rax,0x300(%rsp)
   1401253e6:	00 
   1401253e7:	48 85 c9             	test   %rcx,%rcx
   1401253ea:	0f 85 54 b7 00 00    	jne    140130b44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1a4>
   1401253f0:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   1401253f4:	48 83 ee 10          	sub    $0x10,%rsi
   1401253f8:	48 89 84 24 08 03 00 	mov    %rax,0x308(%rsp)
   1401253ff:	00 
   140125400:	48 8b 16             	mov    (%rsi),%rdx
   140125403:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   14012540a:	00 ff ff 
   14012540d:	48 89 d1             	mov    %rdx,%rcx
   140125410:	48 b8 00 00 00 00 00 	movabs $0xfffd000000000000,%rax
   140125417:	00 fd ff 
   14012541a:	4c 21 c1             	and    %r8,%rcx
   14012541d:	48 39 c1             	cmp    %rax,%rcx
   140125420:	0f 84 11 57 00 00    	je     14012ab37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9197>
   140125426:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012542d:	0f 84 90 7a 00 00    	je     14012cec3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb523>
   140125433:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140125438:	0f 83 85 7a 00 00    	jae    14012cec3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb523>
   14012543e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125445:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012544c:	01 
   14012544d:	48 85 c9             	test   %rcx,%rcx
   140125450:	0f 85 d6 90 00 00    	jne    14012e52c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb8c>
   140125456:	41 0f b6 06          	movzbl (%r14),%eax
   14012545a:	48 8d 3d 3f 9c 29 00 	lea    0x299c3f(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125461:	49 83 c6 01          	add    $0x1,%r14
   140125465:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125469:	ff e0                	jmp    *%rax
   14012546b:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140125472:	00 fb ff 
   140125475:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   14012547c:	00 
   14012547d:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   140125484:	00 
   140125485:	41 80 fc 02          	cmp    $0x2,%r12b
   140125489:	0f 85 b1 96 00 00    	jne    14012eb40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1a0>
   14012548f:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140125496:	00 
   140125497:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012549d:	48 89 84 24 80 02 00 	mov    %rax,0x280(%rsp)
   1401254a4:	00 
   1401254a5:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1401254aa:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
   1401254b1:	00 
   1401254b2:	4c 8b 84 24 78 02 00 	mov    0x278(%rsp),%r8
   1401254b9:	00 
   1401254ba:	48 8b 84 24 80 02 00 	mov    0x280(%rsp),%rax
   1401254c1:	00 
   1401254c2:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401254c9:	00 ff ff 
   1401254cc:	49 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%r9
   1401254d3:	00 f8 ff 
   1401254d6:	4c 89 c1             	mov    %r8,%rcx
   1401254d9:	48 21 d1             	and    %rdx,%rcx
   1401254dc:	4c 39 c9             	cmp    %r9,%rcx
   1401254df:	0f 84 c2 4d 00 00    	je     14012a2a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8907>
   1401254e5:	49 ba 00 00 00 00 00 	movabs $0xfffd000000000000,%r10
   1401254ec:	00 fd ff 
   1401254ef:	4c 39 d1             	cmp    %r10,%rcx
   1401254f2:	0f 84 7c 78 00 00    	je     14012cd74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3d4>
   1401254f8:	48 b9 00 00 00 00 00 	movabs $0xfffc000000000000,%rcx
   1401254ff:	00 fc ff 
   140125502:	49 39 c8             	cmp    %rcx,%r8
   140125505:	0f 84 65 3f 00 00    	je     140129470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ad0>
   14012550b:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140125512:	ff f7 ff 
   140125515:	4d 39 c1             	cmp    %r8,%r9
   140125518:	0f 83 52 3f 00 00    	jae    140129470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ad0>
   14012551e:	49 39 c1             	cmp    %rax,%r9
   140125521:	0f 83 49 3f 00 00    	jae    140129470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ad0>
   140125527:	48 39 c8             	cmp    %rcx,%rax
   14012552a:	0f 84 40 3f 00 00    	je     140129470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ad0>
   140125530:	48 21 c2             	and    %rax,%rdx
   140125533:	4c 39 d2             	cmp    %r10,%rdx
   140125536:	0f 84 92 94 00 00    	je     14012e9ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd02e>
   14012553c:	48 8d 8c 24 78 02 00 	lea    0x278(%rsp),%rcx
   140125543:	00 
   140125544:	c5 f8 77             	vzeroupper
   140125547:	e8 54 40 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   14012554c:	48 8d 8c 24 80 02 00 	lea    0x280(%rsp),%rcx
   140125553:	00 
   140125554:	48 89 c7             	mov    %rax,%rdi
   140125557:	e8 44 40 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   14012555c:	48 39 c7             	cmp    %rax,%rdi
   14012555f:	0f 9c c0             	setl   %al
   140125562:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140125569:	00 fa ff 
   14012556c:	0f b6 c0             	movzbl %al,%eax
   14012556f:	48 01 d0             	add    %rdx,%rax
   140125572:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125579:	00 
   14012557a:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125581:	0f 84 09 35 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125587:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012558c:	0f 83 fe 34 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125592:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125599:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401255a0:	01 
   1401255a1:	48 85 c9             	test   %rcx,%rcx
   1401255a4:	0f 85 83 b5 00 00    	jne    140130b2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf18d>
   1401255aa:	41 0f b6 06          	movzbl (%r14),%eax
   1401255ae:	48 8d 3d eb 9a 29 00 	lea    0x299aeb(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401255b5:	49 83 c6 01          	add    $0x1,%r14
   1401255b9:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401255bd:	ff e0                	jmp    *%rax
   1401255bf:	41 0f b7 3e          	movzwl (%r14),%edi
   1401255c3:	49 8b 97 b8 00 00 00 	mov    0xb8(%r15),%rdx
   1401255ca:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   1401255ce:	41 80 fc 02          	cmp    $0x2,%r12b
   1401255d2:	0f 85 43 af 00 00    	jne    14013051b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb7b>
   1401255d8:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401255df:	00 
   1401255e0:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1401255e5:	45 31 e4             	xor    %r12d,%r12d
   1401255e8:	48 89 84 24 88 03 00 	mov    %rax,0x388(%rsp)
   1401255ef:	00 
   1401255f0:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
   1401255f7:	ff ff ff 
   1401255fa:	49 b8 00 00 00 00 02 	movabs $0xfffd000200000000,%r8
   140125601:	00 fd ff 
   140125604:	48 21 c8             	and    %rcx,%rax
   140125607:	4c 39 c0             	cmp    %r8,%rax
   14012560a:	0f 84 78 88 00 00    	je     14012de88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4e8>
   140125610:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125617:	0f 85 51 35 00 00    	jne    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   14012561d:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125622:	0f 83 46 35 00 00    	jae    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140125628:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012562f:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125636:	01 
   140125637:	48 85 c9             	test   %rcx,%rcx
   14012563a:	0f 85 c3 ae 00 00    	jne    140130503 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb63>
   140125640:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   140125645:	48 8d 3d 54 9a 29 00 	lea    0x299a54(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012564c:	49 83 c6 03          	add    $0x3,%r14
   140125650:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125654:	ff e0                	jmp    *%rax
   140125656:	41 80 fc 02          	cmp    $0x2,%r12b
   14012565a:	0f 84 66 49 00 00    	je     140129fc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8626>
   140125660:	41 80 fc 01          	cmp    $0x1,%r12b
   140125664:	0f 84 1d 5e 00 00    	je     14012b487 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ae7>
   14012566a:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125671:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125678:	c5 f8 77             	vzeroupper
   14012567b:	4c 29 ce             	sub    %r9,%rsi
   14012567e:	48 89 c2             	mov    %rax,%rdx
   140125681:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140125686:	48 89 f7             	mov    %rsi,%rdi
   140125689:	4c 29 ca             	sub    %r9,%rdx
   14012568c:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125693:	48 c1 ff 03          	sar    $0x3,%rdi
   140125697:	48 39 f2             	cmp    %rsi,%rdx
   14012569a:	0f 82 1b 60 00 00    	jb     14012b6bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d1b>
   1401256a0:	c5 f9 6f 05 18 63 23 	vmovdqa 0x236318(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401256a7:	00 
   1401256a8:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   1401256ad:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   1401256b4:	4c 01 ce             	add    %r9,%rsi
   1401256b7:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   1401256be:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   1401256c5:	c6 83 40 10 00 00 00 	movb   $0x0,0x1040(%rbx)
   1401256cc:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   1401256d3:	00 
   1401256d4:	e9 b7 ce ff ff       	jmp    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   1401256d9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401256dd:	0f 84 d8 4f 00 00    	je     14012a6bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d1b>
   1401256e3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401256e7:	0f 84 12 68 00 00    	je     14012beff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa55f>
   1401256ed:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401256f4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401256fb:	4c 29 ce             	sub    %r9,%rsi
   1401256fe:	48 89 c2             	mov    %rax,%rdx
   140125701:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140125706:	48 89 f7             	mov    %rsi,%rdi
   140125709:	4c 29 ca             	sub    %r9,%rdx
   14012570c:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125713:	48 c1 ff 03          	sar    $0x3,%rdi
   140125717:	48 39 f2             	cmp    %rsi,%rdx
   14012571a:	0f 82 26 60 00 00    	jb     14012b746 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9da6>
   140125720:	c5 f9 6f 05 98 62 23 	vmovdqa 0x236298(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125727:	00 
   140125728:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012572f:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125736:	48 8b 93 08 51 01 00 	mov    0x15108(%rbx),%rdx
   14012573d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125744:	00 
   140125745:	48 3b 93 00 51 01 00 	cmp    0x15100(%rbx),%rdx
   14012574c:	74 0b                	je     140125759 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3db9>
   14012574e:	48 83 ea 20          	sub    $0x20,%rdx
   140125752:	48 89 93 08 51 01 00 	mov    %rdx,0x15108(%rbx)
   140125759:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125760:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125765:	4c 01 ce             	add    %r9,%rsi
   140125768:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012576f:	4d 85 ed             	test   %r13,%r13
   140125772:	74 0d                	je     140125781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3de1>
   140125774:	4b 8d 54 ad fb       	lea    -0x5(%r13,%r13,4),%rdx
   140125779:	4c 8b ac d3 c8 10 00 	mov    0x10c8(%rbx,%rdx,8),%r13
   140125780:	00 
   140125781:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125788:	0f 85 65 77 00 00    	jne    14012cef3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb553>
   14012578e:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125793:	0f 83 5a 77 00 00    	jae    14012cef3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb553>
   140125799:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401257a0:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401257a7:	01 
   1401257a8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401257ad:	48 85 c9             	test   %rcx,%rcx
   1401257b0:	0f 85 60 8b 00 00    	jne    14012e316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc976>
   1401257b6:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401257ba:	48 8d 3d df 98 29 00 	lea    0x2998df(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401257c1:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401257c5:	45 31 e4             	xor    %r12d,%r12d
   1401257c8:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401257cc:	ff e0                	jmp    *%rax
   1401257ce:	41 80 fc 02          	cmp    $0x2,%r12b
   1401257d2:	0f 84 d9 4c 00 00    	je     14012a4b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b11>
   1401257d8:	41 80 fc 01          	cmp    $0x1,%r12b
   1401257dc:	0f 84 d1 6c 00 00    	je     14012c4b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab13>
   1401257e2:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401257e9:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401257f0:	c5 f8 77             	vzeroupper
   1401257f3:	4c 29 ce             	sub    %r9,%rsi
   1401257f6:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401257fb:	4c 29 c8             	sub    %r9,%rax
   1401257fe:	48 89 f7             	mov    %rsi,%rdi
   140125801:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125808:	48 c1 ff 03          	sar    $0x3,%rdi
   14012580c:	48 39 f0             	cmp    %rsi,%rax
   14012580f:	0f 82 03 61 00 00    	jb     14012b918 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f78>
   140125815:	c5 f9 6f 05 a3 61 23 	vmovdqa 0x2361a3(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   14012581c:	00 
   14012581d:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125824:	4c 89 fa             	mov    %r15,%rdx
   140125827:	48 89 d9             	mov    %rbx,%rcx
   14012582a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125831:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125838:	00 
   140125839:	e8 a2 5a fd ff       	call   1400fb2e0 <setun::VM::handle_try(setun::Chunk const&)>
   14012583e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125845:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012584c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125853:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125858:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012585c:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125863:	4d 85 ed             	test   %r13,%r13
   140125866:	74 0d                	je     140125875 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ed5>
   140125868:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012586d:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125874:	00 
   140125875:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012587c:	0f 85 6e 32 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125882:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125889:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012588e:	0f 83 fc cc ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125894:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012589b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401258a2:	01 
   1401258a3:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401258a8:	48 85 c9             	test   %rcx,%rcx
   1401258ab:	0f 85 78 92 00 00    	jne    14012eb29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd189>
   1401258b1:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401258b5:	48 8d 3d e4 97 29 00 	lea    0x2997e4(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401258bc:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401258c0:	45 31 e4             	xor    %r12d,%r12d
   1401258c3:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401258c7:	ff e0                	jmp    *%rax
   1401258c9:	41 80 fc 02          	cmp    $0x2,%r12b
   1401258cd:	0f 84 5b 46 00 00    	je     140129f2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x858e>
   1401258d3:	41 80 fc 01          	cmp    $0x1,%r12b
   1401258d7:	0f 84 a6 67 00 00    	je     14012c083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6e3>
   1401258dd:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401258e4:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401258eb:	c5 f8 77             	vzeroupper
   1401258ee:	4c 29 ce             	sub    %r9,%rsi
   1401258f1:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401258f6:	4c 29 c8             	sub    %r9,%rax
   1401258f9:	48 89 f7             	mov    %rsi,%rdi
   1401258fc:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125903:	48 c1 ff 03          	sar    $0x3,%rdi
   140125907:	48 39 f0             	cmp    %rsi,%rax
   14012590a:	0f 82 f3 5f 00 00    	jb     14012b903 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f63>
   140125910:	c5 f9 6f 05 a8 60 23 	vmovdqa 0x2360a8(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125917:	00 
   140125918:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012591f:	4c 89 fa             	mov    %r15,%rdx
   140125922:	48 89 d9             	mov    %rbx,%rcx
   140125925:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012592c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125933:	00 
   140125934:	e8 87 e0 fe ff       	call   1401139c0 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   140125939:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125940:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125947:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012594e:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125953:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140125957:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012595e:	4d 85 ed             	test   %r13,%r13
   140125961:	74 0d                	je     140125970 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3fd0>
   140125963:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140125968:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012596f:	00 
   140125970:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125977:	0f 85 73 31 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012597d:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125984:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125989:	0f 83 01 cc ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   14012598f:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125996:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012599d:	01 
   14012599e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401259a3:	48 85 c9             	test   %rcx,%rcx
   1401259a6:	0f 85 f5 89 00 00    	jne    14012e3a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca01>
   1401259ac:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401259b0:	48 8d 3d e9 96 29 00 	lea    0x2996e9(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401259b7:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401259bb:	45 31 e4             	xor    %r12d,%r12d
   1401259be:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401259c2:	ff e0                	jmp    *%rax
   1401259c4:	48 8b 83 88 10 00 00 	mov    0x1088(%rbx),%rax
   1401259cb:	41 0f b7 3e          	movzwl (%r14),%edi
   1401259cf:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   1401259d3:	48 2b 83 80 10 00 00 	sub    0x1080(%rbx),%rax
   1401259da:	48 c1 f8 03          	sar    $0x3,%rax
   1401259de:	48 39 c7             	cmp    %rax,%rdi
   1401259e1:	0f 83 4f 8c 00 00    	jae    14012e636 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc96>
   1401259e7:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401259eb:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   1401259f2:	00 
   1401259f3:	45 84 e4             	test   %r12b,%r12b
   1401259f6:	48 0f 44 c2          	cmove  %rdx,%rax
   1401259fa:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   140125a01:	48 8b 00             	mov    (%rax),%rax
   140125a04:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   140125a08:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125a0f:	0f 85 68 31 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140125a15:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125a1a:	0f 83 5d 31 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140125a20:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125a27:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125a2e:	01 
   140125a2f:	48 85 c9             	test   %rcx,%rcx
   140125a32:	0f 85 e6 8b 00 00    	jne    14012e61e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc7e>
   140125a38:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   140125a3d:	48 8d 3d 5c 96 29 00 	lea    0x29965c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a44:	49 83 c6 03          	add    $0x3,%r14
   140125a48:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125a4c:	ff e0                	jmp    *%rax
   140125a4e:	45 84 e4             	test   %r12b,%r12b
   140125a51:	0f 85 dd 35 00 00    	jne    140129034 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7694>
   140125a57:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125a5e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140125a64:	4a 8b 44 e8 10       	mov    0x10(%rax,%r13,8),%rax
   140125a69:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125a70:	00 
   140125a71:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125a78:	0f 84 82 30 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140125a7e:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140125a83:	0f 83 77 30 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140125a89:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125a90:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125a97:	01 
   140125a98:	48 85 c9             	test   %rcx,%rcx
   140125a9b:	0f 85 66 8b 00 00    	jne    14012e607 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc67>
   140125aa1:	41 0f b6 06          	movzbl (%r14),%eax
   140125aa5:	48 8d 3d f4 95 29 00 	lea    0x2995f4(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125aac:	49 83 c6 01          	add    $0x1,%r14
   140125ab0:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125ab4:	ff e0                	jmp    *%rax
   140125ab6:	45 84 e4             	test   %r12b,%r12b
   140125ab9:	0f 85 34 38 00 00    	jne    1401292f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7953>
   140125abf:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140125ac6:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140125acc:	4a 8b 44 e8 08       	mov    0x8(%rax,%r13,8),%rax
   140125ad1:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125ad8:	00 
   140125ad9:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125ae0:	0f 84 1a 30 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140125ae6:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140125aeb:	0f 83 0f 30 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140125af1:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125af8:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125aff:	01 
   140125b00:	48 85 c9             	test   %rcx,%rcx
   140125b03:	0f 85 81 a0 00 00    	jne    14012fb8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1ea>
   140125b09:	41 0f b6 06          	movzbl (%r14),%eax
   140125b0d:	48 8d 3d 8c 95 29 00 	lea    0x29958c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125b14:	49 83 c6 01          	add    $0x1,%r14
   140125b18:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125b1c:	ff e0                	jmp    *%rax
   140125b1e:	41 80 fc 02          	cmp    $0x2,%r12b
   140125b22:	0f 84 0f 46 00 00    	je     14012a137 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8797>
   140125b28:	41 80 fc 01          	cmp    $0x1,%r12b
   140125b2c:	0f 84 ac 67 00 00    	je     14012c2de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa93e>
   140125b32:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125b39:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125b40:	c5 f8 77             	vzeroupper
   140125b43:	4c 29 ce             	sub    %r9,%rsi
   140125b46:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140125b4b:	4c 29 c8             	sub    %r9,%rax
   140125b4e:	48 89 f7             	mov    %rsi,%rdi
   140125b51:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125b58:	48 c1 ff 03          	sar    $0x3,%rdi
   140125b5c:	48 39 f0             	cmp    %rsi,%rax
   140125b5f:	0f 82 dd 5d 00 00    	jb     14012b942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fa2>
   140125b65:	c5 f9 6f 05 53 5e 23 	vmovdqa 0x235e53(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125b6c:	00 
   140125b6d:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125b74:	4c 89 fa             	mov    %r15,%rdx
   140125b77:	48 89 d9             	mov    %rbx,%rcx
   140125b7a:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125b81:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125b88:	00 
   140125b89:	e8 52 ec fd ff       	call   1401047e0 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140125b8e:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125b95:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125b9c:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125ba3:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125ba8:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140125bac:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125bb3:	4d 85 ed             	test   %r13,%r13
   140125bb6:	74 0d                	je     140125bc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4225>
   140125bb8:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140125bbd:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125bc4:	00 
   140125bc5:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125bcc:	0f 85 1e 2f 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125bd2:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125bd9:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125bde:	0f 83 ac c9 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125be4:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125beb:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125bf2:	01 
   140125bf3:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140125bf8:	48 85 c9             	test   %rcx,%rcx
   140125bfb:	0f 85 89 a1 00 00    	jne    14012fd8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3ea>
   140125c01:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140125c05:	48 8d 3d 94 94 29 00 	lea    0x299494(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125c0c:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140125c10:	45 31 e4             	xor    %r12d,%r12d
   140125c13:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125c17:	ff e0                	jmp    *%rax
   140125c19:	41 80 fc 02          	cmp    $0x2,%r12b
   140125c1d:	0f 84 ae 4f 00 00    	je     14012abd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9231>
   140125c23:	41 80 fc 01          	cmp    $0x1,%r12b
   140125c27:	0f 84 6e 66 00 00    	je     14012c29b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8fb>
   140125c2d:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125c34:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125c3b:	c5 f8 77             	vzeroupper
   140125c3e:	4c 29 ce             	sub    %r9,%rsi
   140125c41:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140125c46:	4c 29 c8             	sub    %r9,%rax
   140125c49:	48 89 f7             	mov    %rsi,%rdi
   140125c4c:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125c53:	48 c1 ff 03          	sar    $0x3,%rdi
   140125c57:	48 39 f0             	cmp    %rsi,%rax
   140125c5a:	0f 82 cd 5c 00 00    	jb     14012b92d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f8d>
   140125c60:	c5 f9 6f 05 58 5d 23 	vmovdqa 0x235d58(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125c67:	00 
   140125c68:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125c6f:	4c 89 fa             	mov    %r15,%rdx
   140125c72:	48 89 d9             	mov    %rbx,%rcx
   140125c75:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125c7c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125c83:	00 
   140125c84:	e8 a7 f7 fd ff       	call   140105430 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   140125c89:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125c90:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125c97:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125c9e:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125ca3:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140125ca7:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125cae:	4d 85 ed             	test   %r13,%r13
   140125cb1:	74 0d                	je     140125cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4320>
   140125cb3:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140125cb8:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125cbf:	00 
   140125cc0:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125cc7:	0f 85 23 2e 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125ccd:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125cd4:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125cd9:	0f 83 b1 c8 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125cdf:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125ce6:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125ced:	01 
   140125cee:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140125cf3:	48 85 c9             	test   %rcx,%rcx
   140125cf6:	0f 85 5c 9f 00 00    	jne    14012fc58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2b8>
   140125cfc:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140125d00:	48 8d 3d 99 93 29 00 	lea    0x299399(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125d07:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140125d0b:	45 31 e4             	xor    %r12d,%r12d
   140125d0e:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125d12:	ff e0                	jmp    *%rax
   140125d14:	41 80 fc 02          	cmp    $0x2,%r12b
   140125d18:	0f 84 88 4b 00 00    	je     14012a8a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f06>
   140125d1e:	41 80 fc 01          	cmp    $0x1,%r12b
   140125d22:	0f 84 3c 66 00 00    	je     14012c364 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9c4>
   140125d28:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125d2f:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125d36:	c5 f8 77             	vzeroupper
   140125d39:	4c 29 ce             	sub    %r9,%rsi
   140125d3c:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140125d41:	4c 29 c8             	sub    %r9,%rax
   140125d44:	48 89 f7             	mov    %rsi,%rdi
   140125d47:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140125d4e:	48 c1 ff 03          	sar    $0x3,%rdi
   140125d52:	48 39 f0             	cmp    %rsi,%rax
   140125d55:	0f 82 37 5d 00 00    	jb     14012ba92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0f2>
   140125d5b:	c5 f9 6f 05 5d 5c 23 	vmovdqa 0x235c5d(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140125d62:	00 
   140125d63:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140125d6a:	4c 89 fa             	mov    %r15,%rdx
   140125d6d:	48 89 d9             	mov    %rbx,%rcx
   140125d70:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140125d77:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140125d7e:	00 
   140125d7f:	e8 5c 95 fd ff       	call   1400ff2e0 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   140125d84:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140125d8b:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140125d92:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140125d99:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140125d9e:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140125da2:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140125da9:	4d 85 ed             	test   %r13,%r13
   140125dac:	74 0d                	je     140125dbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x441b>
   140125dae:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140125db3:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140125dba:	00 
   140125dbb:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140125dc2:	0f 85 28 2d 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140125dc8:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140125dcf:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140125dd4:	0f 83 b6 c7 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140125dda:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125de1:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125de8:	01 
   140125de9:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140125dee:	48 85 c9             	test   %rcx,%rcx
   140125df1:	0f 85 f8 90 00 00    	jne    14012eeef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd54f>
   140125df7:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140125dfb:	48 8d 3d 9e 92 29 00 	lea    0x29929e(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e02:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140125e06:	45 31 e4             	xor    %r12d,%r12d
   140125e09:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125e0d:	ff e0                	jmp    *%rax
   140125e0f:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140125e16:	00 fb ff 
   140125e19:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140125e20:	00 
   140125e21:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140125e28:	00 
   140125e29:	41 80 fc 02          	cmp    $0x2,%r12b
   140125e2d:	0f 85 e2 98 00 00    	jne    14012f715 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd75>
   140125e33:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140125e3a:	00 
   140125e3b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140125e41:	48 89 84 24 10 02 00 	mov    %rax,0x210(%rsp)
   140125e48:	00 
   140125e49:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140125e4e:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
   140125e55:	00 
   140125e56:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
   140125e5d:	00 
   140125e5e:	48 8d 8c 24 08 02 00 	lea    0x208(%rsp),%rcx
   140125e65:	00 
   140125e66:	c5 f8 77             	vzeroupper
   140125e69:	e8 02 46 0f 00       	call   14021a470 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   140125e6e:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125e75:	00 
   140125e76:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125e7d:	0f 84 0d 2c 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125e83:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140125e88:	0f 83 02 2c 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125e8e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125e95:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125e9c:	01 
   140125e9d:	48 85 c9             	test   %rcx,%rcx
   140125ea0:	0f 85 58 98 00 00    	jne    14012f6fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd5e>
   140125ea6:	41 0f b6 06          	movzbl (%r14),%eax
   140125eaa:	48 8d 3d ef 91 29 00 	lea    0x2991ef(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125eb1:	49 83 c6 01          	add    $0x1,%r14
   140125eb5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125eb9:	ff e0                	jmp    *%rax
   140125ebb:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140125ec2:	00 fb ff 
   140125ec5:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140125ecc:	00 
   140125ecd:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140125ed4:	00 
   140125ed5:	41 80 fc 02          	cmp    $0x2,%r12b
   140125ed9:	0f 85 63 9e 00 00    	jne    14012fd42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3a2>
   140125edf:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140125ee6:	00 
   140125ee7:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140125eed:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
   140125ef4:	00 
   140125ef5:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140125efa:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
   140125f01:	00 
   140125f02:	48 89 c1             	mov    %rax,%rcx
   140125f05:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140125f0c:	00 ff ff 
   140125f0f:	49 89 c8             	mov    %rcx,%r8
   140125f12:	48 b8 00 00 00 00 00 	movabs $0xfff8000000000000,%rax
   140125f19:	00 f8 ff 
   140125f1c:	49 21 d0             	and    %rdx,%r8
   140125f1f:	49 39 c0             	cmp    %rax,%r8
   140125f22:	0f 84 ca 49 00 00    	je     14012a8f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f52>
   140125f28:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   140125f2f:	01 
   140125f30:	48 8d 94 24 20 03 00 	lea    0x320(%rsp),%rdx
   140125f37:	00 
   140125f38:	48 8d 8c 24 18 03 00 	lea    0x318(%rsp),%rcx
   140125f3f:	00 
   140125f40:	41 c6 46 ff 20       	movb   $0x20,-0x1(%r14)
   140125f45:	c5 f8 77             	vzeroupper
   140125f48:	e8 b3 18 0f 00       	call   140217800 <setun::VMValue::add(setun::VMValue const&) const>
   140125f4d:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140125f54:	00 
   140125f55:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140125f5c:	0f 84 2e 2b 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125f62:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140125f67:	0f 83 23 2b 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140125f6d:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140125f74:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140125f7b:	01 
   140125f7c:	48 85 c9             	test   %rcx,%rcx
   140125f7f:	0f 85 fb ae 00 00    	jne    140130e80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4e0>
   140125f85:	41 0f b6 06          	movzbl (%r14),%eax
   140125f89:	48 8d 3d 10 91 29 00 	lea    0x299110(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125f90:	49 83 c6 01          	add    $0x1,%r14
   140125f94:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140125f98:	ff e0                	jmp    *%rax
   140125f9a:	41 0f b7 46 02       	movzwl 0x2(%r14),%eax
   140125f9f:	41 0f b7 4e 06       	movzwl 0x6(%r14),%ecx
   140125fa4:	49 8d 6e 08          	lea    0x8(%r14),%rbp
   140125fa8:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125faf:	41 0f b7 7e 04       	movzwl 0x4(%r14),%edi
   140125fb4:	66 89 44 24 70       	mov    %ax,0x70(%rsp)
   140125fb9:	41 0f b7 06          	movzwl (%r14),%eax
   140125fbd:	66 89 8c 24 b0 00 00 	mov    %cx,0xb0(%rsp)
   140125fc4:	00 
   140125fc5:	4c 01 e8             	add    %r13,%rax
   140125fc8:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140125fcc:	c5 f8 77             	vzeroupper
   140125fcf:	e8 cc 35 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140125fd4:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125fdb:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   140125fe2:	00 
   140125fe3:	0f b7 44 24 70       	movzwl 0x70(%rsp),%eax
   140125fe8:	4c 01 e8             	add    %r13,%rax
   140125feb:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140125fef:	e8 ac 35 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140125ff4:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140125ffb:	49 89 c6             	mov    %rax,%r14
   140125ffe:	0f b7 c7             	movzwl %di,%eax
   140126001:	4c 01 e8             	add    %r13,%rax
   140126004:	48 8d 0c c2          	lea    (%rdx,%rax,8),%rcx
   140126008:	e8 93 35 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   14012600d:	48 85 c0             	test   %rax,%rax
   140126010:	0f 84 16 a0 00 00    	je     14013002c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe68c>
   140126016:	0f 8e 92 36 00 00    	jle    1401296ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d0e>
   14012601c:	4c 39 b4 24 90 00 00 	cmp    %r14,0x90(%rsp)
   140126023:	00 
   140126024:	0f 9c c0             	setl   %al
   140126027:	84 c0                	test   %al,%al
   140126029:	0f 85 40 35 00 00    	jne    14012956f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bcf>
   14012602f:	48 0f bf 84 24 b0 00 	movswq 0xb0(%rsp),%rax
   140126036:	00 00 
   140126038:	48 01 c5             	add    %rax,%rbp
   14012603b:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126042:	0f 85 29 2b 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126048:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012604d:	0f 83 1e 2b 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126053:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012605a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126061:	01 
   140126062:	48 85 c9             	test   %rcx,%rcx
   140126065:	0f 85 1e ab 00 00    	jne    140130b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1e9>
   14012606b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012606f:	48 8d 3d 2a 90 29 00 	lea    0x29902a(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126076:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012607a:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012607d:	48 8b 83 c0 50 01 00 	mov    0x150c0(%rbx),%rax
   140126084:	48 85 c0             	test   %rax,%rax
   140126087:	0f 84 92 95 00 00    	je     14012f61f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc7f>
   14012608d:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
   140126091:	48 83 e8 01          	sub    $0x1,%rax
   140126095:	48 8d 0c d3          	lea    (%rbx,%rdx,8),%rcx
   140126099:	48 8b a9 98 10 00 00 	mov    0x1098(%rcx),%rbp
   1401260a0:	48 8b 91 a0 10 00 00 	mov    0x10a0(%rcx),%rdx
   1401260a7:	48 8b b9 a8 10 00 00 	mov    0x10a8(%rcx),%rdi
   1401260ae:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401260b5:	48 89 83 c0 50 01 00 	mov    %rax,0x150c0(%rbx)
   1401260bc:	48 85 c9             	test   %rcx,%rcx
   1401260bf:	0f 85 d8 8f 00 00    	jne    14012f09d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6fd>
   1401260c5:	41 80 fc 01          	cmp    $0x1,%r12b
   1401260c9:	0f 85 bb 8f 00 00    	jne    14012f08a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6ea>
   1401260cf:	4c 8b a4 24 90 01 00 	mov    0x190(%rsp),%r12
   1401260d6:	00 
   1401260d7:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   1401260de:	0f 84 e7 59 00 00    	je     14012bacb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa12b>
   1401260e4:	48 89 93 68 52 01 00 	mov    %rdx,0x15268(%rbx)
   1401260eb:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401260f2:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   1401260f9:	4c 89 a4 24 90 01 00 	mov    %r12,0x190(%rsp)
   140126100:	00 
   140126101:	49 8d 34 f9          	lea    (%r9,%rdi,8),%rsi
   140126105:	4d 85 ed             	test   %r13,%r13
   140126108:	74 0d                	je     140126117 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4777>
   14012610a:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012610f:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140126116:	00 
   140126117:	48 03 6c 24 40       	add    0x40(%rsp),%rbp
   14012611c:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126123:	0f 85 fd 6d 00 00    	jne    14012cf26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb586>
   140126129:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012612e:	0f 83 f2 6d 00 00    	jae    14012cf26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb586>
   140126134:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012613b:	01 
   14012613c:	48 85 c9             	test   %rcx,%rcx
   14012613f:	0f 85 f7 ae 00 00    	jne    14013103c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf69c>
   140126145:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126149:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012614d:	48 8d 3d 4c 8f 29 00 	lea    0x298f4c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126154:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012615a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012615e:	ff e0                	jmp    *%rax
   140126160:	41 80 fc 02          	cmp    $0x2,%r12b
   140126164:	0f 84 df 3a 00 00    	je     140129c49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82a9>
   14012616a:	41 80 fc 01          	cmp    $0x1,%r12b
   14012616e:	0f 84 38 66 00 00    	je     14012c7ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae0c>
   140126174:	49 8b 87 88 00 00 00 	mov    0x88(%r15),%rax
   14012617b:	49 8b 8f 80 00 00 00 	mov    0x80(%r15),%rcx
   140126182:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   140126186:	41 0f b7 16          	movzwl (%r14),%edx
   14012618a:	48 39 c1             	cmp    %rax,%rcx
   14012618d:	0f 84 29 59 00 00    	je     14012babc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa11c>
   140126193:	48 29 c8             	sub    %rcx,%rax
   140126196:	48 c1 f8 02          	sar    $0x2,%rax
   14012619a:	48 39 c2             	cmp    %rax,%rdx
   14012619d:	0f 83 bc ab 00 00    	jae    140130d5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3bf>
   1401261a3:	8b 04 91             	mov    (%rcx,%rdx,4),%eax
   1401261a6:	89 84 24 d0 00 00 00 	mov    %eax,0xd0(%rsp)
   1401261ad:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   1401261b2:	49 8d 6e 03          	lea    0x3(%r14),%rbp
   1401261b6:	49 8b 8f 98 00 00 00 	mov    0x98(%r15),%rcx
   1401261bd:	41 b8 20 00 00 00    	mov    $0x20,%r8d
   1401261c3:	88 84 24 f0 00 00 00 	mov    %al,0xf0(%rsp)
   1401261ca:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   1401261d1:	00 
   1401261d2:	49 8b 87 a0 00 00 00 	mov    0xa0(%r15),%rax
   1401261d9:	48 29 c8             	sub    %rcx,%rax
   1401261dc:	48 d1 f8             	sar    $1,%rax
   1401261df:	48 39 c2             	cmp    %rax,%rdx
   1401261e2:	73 0b                	jae    1401261ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x484f>
   1401261e4:	0f b7 0c 51          	movzwl (%rcx,%rdx,2),%ecx
   1401261e8:	66 85 c9             	test   %cx,%cx
   1401261eb:	4c 0f 45 c1          	cmovne %rcx,%r8
   1401261ef:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1401261f6:	00 
   1401261f7:	4c 89 c7             	mov    %r8,%rdi
   1401261fa:	48 83 c0 08          	add    $0x8,%rax
   1401261fe:	4c 39 c0             	cmp    %r8,%rax
   140126201:	48 0f 43 f8          	cmovae %rax,%rdi
   140126205:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   14012620a:	80 bb c1 52 01 00 00 	cmpb   $0x0,0x152c1(%rbx)
   140126211:	0f 84 b4 2a 00 00    	je     140128ccb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x732b>
   140126217:	48 8b 8b d8 52 01 00 	mov    0x152d8(%rbx),%rcx
   14012621e:	48 85 c9             	test   %rcx,%rcx
   140126221:	0f 84 a4 2a 00 00    	je     140128ccb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x732b>
   140126227:	48 8b 83 f8 52 01 00 	mov    0x152f8(%rbx),%rax
   14012622e:	48 21 d0             	and    %rdx,%rax
   140126231:	48 c1 e0 05          	shl    $0x5,%rax
   140126235:	48 01 c8             	add    %rcx,%rax
   140126238:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
   14012623f:	00 
   140126240:	48 83 38 00          	cmpq   $0x0,(%rax)
   140126244:	0f 84 9c 29 00 00    	je     140128be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7246>
   14012624a:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   140126251:	0f 84 bf 79 00 00    	je     14012dc16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc276>
   140126257:	48 8b 83 68 52 01 00 	mov    0x15268(%rbx),%rax
   14012625e:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140126265:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   14012626c:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   140126273:	00 
   140126274:	48 01 f8             	add    %rdi,%rax
   140126277:	48 c1 fa 03          	sar    $0x3,%rdx
   14012627b:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   140126282:	48 83 c0 40          	add    $0x40,%rax
   140126286:	48 39 d0             	cmp    %rdx,%rax
   140126289:	0f 83 3b eb 00 00    	jae    140134dca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1342a>
   14012628f:	c5 f8 77             	vzeroupper
   140126292:	80 bc 24 f0 00 00 00 	cmpb   $0x0,0xf0(%rsp)
   140126299:	00 
   14012629a:	0f 84 e1 be 00 00    	je     140132181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107e1>
   1401262a0:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1401262a7:	00 
   1401262a8:	4c 8b 83 68 10 00 00 	mov    0x1068(%rbx),%r8
   1401262af:	48 89 c1             	mov    %rax,%rcx
   1401262b2:	48 03 84 24 b0 00 00 	add    0xb0(%rsp),%rax
   1401262b9:	00 
   1401262ba:	48 f7 d9             	neg    %rcx
   1401262bd:	4d 8d 0c c0          	lea    (%r8,%rax,8),%r9
   1401262c1:	31 c0                	xor    %eax,%eax
   1401262c3:	48 c1 e1 03          	shl    $0x3,%rcx
   1401262c7:	48 8b 54 06 f8       	mov    -0x8(%rsi,%rax,1),%rdx
   1401262cc:	49 89 54 01 f8       	mov    %rdx,-0x8(%r9,%rax,1)
   1401262d1:	48 83 e8 08          	sub    $0x8,%rax
   1401262d5:	48 39 c8             	cmp    %rcx,%rax
   1401262d8:	75 ed                	jne    1401262c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4927>
   1401262da:	48 01 c6             	add    %rax,%rsi
   1401262dd:	48 8d 94 24 10 06 00 	lea    0x610(%rsp),%rdx
   1401262e4:	00 
   1401262e5:	31 c0                	xor    %eax,%eax
   1401262e7:	b9 23 00 00 00       	mov    $0x23,%ecx
   1401262ec:	48 89 d7             	mov    %rdx,%rdi
   1401262ef:	f3 48 ab             	rep stos %rax,(%rdi)
   1401262f2:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
   1401262f9:	00 
   1401262fa:	48 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%rcx
   140126301:	c6 84 24 18 07 00 00 	movb   $0x1,0x718(%rsp)
   140126308:	01 
   140126309:	48 89 9c 24 10 06 00 	mov    %rbx,0x610(%rsp)
   140126310:	00 
   140126311:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   140126315:	48 89 8c 24 30 06 00 	mov    %rcx,0x630(%rsp)
   14012631c:	00 
   14012631d:	48 89 84 24 20 06 00 	mov    %rax,0x620(%rsp)
   140126324:	00 
   140126325:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   14012632a:	48 89 84 24 28 06 00 	mov    %rax,0x628(%rsp)
   140126331:	00 
   140126332:	48 89 f0             	mov    %rsi,%rax
   140126335:	48 29 c8             	sub    %rcx,%rax
   140126338:	48 8b 8b c0 50 01 00 	mov    0x150c0(%rbx),%rcx
   14012633f:	48 c1 f8 03          	sar    $0x3,%rax
   140126343:	48 89 84 24 38 06 00 	mov    %rax,0x638(%rsp)
   14012634a:	00 
   14012634b:	31 c0                	xor    %eax,%eax
   14012634d:	48 85 c9             	test   %rcx,%rcx
   140126350:	74 0c                	je     14012635e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49be>
   140126352:	48 8d 04 89          	lea    (%rcx,%rcx,4),%rax
   140126356:	48 8d 84 c3 98 10 00 	lea    0x1098(%rbx,%rax,8),%rax
   14012635d:	00 
   14012635e:	c4 e1 f9 6e f8       	vmovq  %rax,%xmm7
   140126363:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
   14012636a:	00 
   14012636b:	c4 e3 c1 22 83 b8 52 	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140126372:	01 00 01 
   140126375:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   14012637c:	c5 f9 7f 84 24 40 06 	vmovdqa %xmm0,0x640(%rsp)
   140126383:	00 00 
   140126385:	e8 d6 b3 0e 00       	call   140211760 <tersun::VMTelemetryManager::instance()>
   14012638a:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
   140126391:	00 
   140126392:	80 38 00             	cmpb   $0x0,(%rax)
   140126395:	74 05                	je     14012639c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49fc>
   140126397:	48 83 40 28 01       	addq   $0x1,0x28(%rax)
   14012639c:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
   1401263a3:	00 
   1401263a4:	48 89 d9             	mov    %rbx,%rcx
   1401263a7:	ff 10                	call   *(%rax)
   1401263a9:	48 8b 94 24 48 06 00 	mov    0x648(%rsp),%rdx
   1401263b0:	00 
   1401263b1:	48 89 93 b8 52 01 00 	mov    %rdx,0x152b8(%rbx)
   1401263b8:	48 83 bc 24 58 06 00 	cmpq   $0x0,0x658(%rsp)
   1401263bf:	00 00 
   1401263c1:	0f 8f 78 d7 00 00    	jg     140133b3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1219f>
   1401263c7:	45 84 e4             	test   %r12b,%r12b
   1401263ca:	0f 85 fa 7e 00 00    	jne    14012e2ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc92a>
   1401263d0:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401263d6:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401263dd:	00 
   1401263de:	80 bb 11 52 01 00 00 	cmpb   $0x0,0x15211(%rbx)
   1401263e5:	0f 84 5a a6 00 00    	je     140130a45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0a5>
   1401263eb:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
   1401263f2:	00 
   1401263f3:	48 89 83 68 52 01 00 	mov    %rax,0x15268(%rbx)
   1401263fa:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126401:	0f 85 6a 27 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126407:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012640c:	0f 83 5f 27 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126412:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126419:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126420:	01 
   140126421:	48 85 c9             	test   %rcx,%rcx
   140126424:	0f 85 31 d8 00 00    	jne    140133c5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122bb>
   14012642a:	41 0f b6 46 03       	movzbl 0x3(%r14),%eax
   14012642f:	48 8d 3d 6a 8c 29 00 	lea    0x298c6a(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126436:	49 83 c6 04          	add    $0x4,%r14
   14012643a:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012643e:	ff e0                	jmp    *%rax
   140126440:	41 0f b7 46 02       	movzwl 0x2(%r14),%eax
   140126445:	49 0f bf 2e          	movswq (%r14),%rbp
   140126449:	49 83 c6 06          	add    $0x6,%r14
   14012644d:	41 0f b7 7e fe       	movzwl -0x2(%r14),%edi
   140126452:	66 89 44 24 70       	mov    %ax,0x70(%rsp)
   140126457:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   14012645e:	00 fb ff 
   140126461:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   140126468:	00 
   140126469:	41 80 fc 01          	cmp    $0x1,%r12b
   14012646d:	0f 85 4a a0 00 00    	jne    1401304bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1d>
   140126473:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   14012647a:	00 
   14012647b:	45 31 e4             	xor    %r12d,%r12d
   14012647e:	48 89 84 24 c0 02 00 	mov    %rax,0x2c0(%rsp)
   140126485:	00 
   140126486:	48 8b 84 24 c0 02 00 	mov    0x2c0(%rsp),%rax
   14012648d:	00 
   14012648e:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126495:	00 ff ff 
   140126498:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   14012649f:	00 fd ff 
   1401264a2:	48 21 c2             	and    %rax,%rdx
   1401264a5:	48 39 ca             	cmp    %rcx,%rdx
   1401264a8:	0f 84 58 30 00 00    	je     140129506 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b66>
   1401264ae:	48 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%rdx
   1401264b5:	00 fc ff 
   1401264b8:	48 39 d0             	cmp    %rdx,%rax
   1401264bb:	74 13                	je     1401264d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b30>
   1401264bd:	48 ba ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%rdx
   1401264c4:	ff f7 ff 
   1401264c7:	48 39 c2             	cmp    %rax,%rdx
   1401264ca:	0f 82 0f 30 00 00    	jb     1401294df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b3f>
   1401264d0:	48 8d 8c 24 c0 02 00 	lea    0x2c0(%rsp),%rcx
   1401264d7:	00 
   1401264d8:	c5 f8 77             	vzeroupper
   1401264db:	e8 80 48 0f 00       	call   14021ad60 <setun::VMValue::as_float() const>
   1401264e0:	c5 fb 10 0d 38 55 23 	vmovsd 0x235538(%rip),%xmm1        # 14035ba20 <CSWTCH.3340+0x200>
   1401264e7:	00 
   1401264e8:	c5 f9 2f c8          	vcomisd %xmm0,%xmm1
   1401264ec:	0f 87 73 30 00 00    	ja     140129565 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bc5>
   1401264f2:	c5 f9 2f 05 2e 55 23 	vcomisd 0x23552e(%rip),%xmm0        # 14035ba28 <CSWTCH.3340+0x208>
   1401264f9:	00 
   1401264fa:	0f 87 fa 2f 00 00    	ja     1401294fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b5a>
   140126500:	48 0f bf 44 24 70    	movswq 0x70(%rsp),%rax
   140126506:	49 8d 6c 06 fe       	lea    -0x2(%r14,%rax,1),%rbp
   14012650b:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126512:	0f 85 59 26 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126518:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012651d:	0f 83 4e 26 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   140126523:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012652a:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126531:	01 
   140126532:	48 85 c9             	test   %rcx,%rcx
   140126535:	0f 85 bd 9d 00 00    	jne    1401302f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe958>
   14012653b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   14012653f:	48 8d 3d 5a 8b 29 00 	lea    0x298b5a(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126546:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012654a:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   14012654d:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126554:	00 fb ff 
   140126557:	41 0f b7 3e          	movzwl (%r14),%edi
   14012655b:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   14012655f:	48 89 84 24 b8 02 00 	mov    %rax,0x2b8(%rsp)
   140126566:	00 
   140126567:	41 80 fc 01          	cmp    $0x1,%r12b
   14012656b:	0f 85 93 86 00 00    	jne    14012ec04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd264>
   140126571:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140126578:	00 
   140126579:	45 31 e4             	xor    %r12d,%r12d
   14012657c:	48 89 84 24 b8 02 00 	mov    %rax,0x2b8(%rsp)
   140126583:	00 
   140126584:	48 8d 8c 24 b8 02 00 	lea    0x2b8(%rsp),%rcx
   14012658b:	00 
   14012658c:	c5 f8 77             	vzeroupper
   14012658f:	e8 9c 36 0f 00       	call   140219c30 <setun::VMValue::as_bool() const>
   140126594:	89 c2                	mov    %eax,%edx
   140126596:	48 0f bf c7          	movswq %di,%rax
   14012659a:	48 01 e8             	add    %rbp,%rax
   14012659d:	84 d2                	test   %dl,%dl
   14012659f:	48 0f 44 e8          	cmove  %rax,%rbp
   1401265a3:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   1401265aa:	0f 85 c1 25 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   1401265b0:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   1401265b5:	0f 83 b6 25 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   1401265bb:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401265c2:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401265c9:	01 
   1401265ca:	48 85 c9             	test   %rcx,%rcx
   1401265cd:	0f 85 1a 86 00 00    	jne    14012ebed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd24d>
   1401265d3:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401265d7:	48 8d 3d c2 8a 29 00 	lea    0x298ac2(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401265de:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401265e2:	ff 24 c7             	jmp    *(%rdi,%rax,8)
   1401265e5:	41 80 fc 02          	cmp    $0x2,%r12b
   1401265e9:	0f 84 7c 37 00 00    	je     140129d6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83cb>
   1401265ef:	41 80 fc 01          	cmp    $0x1,%r12b
   1401265f3:	0f 84 cd 5a 00 00    	je     14012c0c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa726>
   1401265f9:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126600:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126607:	c5 f8 77             	vzeroupper
   14012660a:	4c 29 ce             	sub    %r9,%rsi
   14012660d:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140126612:	4c 29 c8             	sub    %r9,%rax
   140126615:	48 89 f7             	mov    %rsi,%rdi
   140126618:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   14012661f:	48 c1 ff 03          	sar    $0x3,%rdi
   140126623:	48 39 f0             	cmp    %rsi,%rax
   140126626:	0f 82 9e 4e 00 00    	jb     14012b4ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b2a>
   14012662c:	c5 f9 6f 05 8c 53 23 	vmovdqa 0x23538c(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140126633:	00 
   140126634:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   14012663b:	4c 89 fa             	mov    %r15,%rdx
   14012663e:	48 89 d9             	mov    %rbx,%rcx
   140126641:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140126648:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012664f:	00 
   140126650:	e8 9b 90 fe ff       	call   14010f6f0 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   140126655:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   14012665c:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126663:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012666a:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012666f:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140126673:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012667a:	4d 85 ed             	test   %r13,%r13
   14012667d:	74 0d                	je     14012668c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cec>
   14012667f:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140126684:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   14012668b:	00 
   14012668c:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126693:	0f 85 57 24 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140126699:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401266a0:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   1401266a5:	0f 83 e5 be ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   1401266ab:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401266b2:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401266b9:	01 
   1401266ba:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401266bf:	48 85 c9             	test   %rcx,%rcx
   1401266c2:	0f 85 24 9e 00 00    	jne    1401304ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb4c>
   1401266c8:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401266cc:	48 8d 3d cd 89 29 00 	lea    0x2989cd(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401266d3:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401266d7:	45 31 e4             	xor    %r12d,%r12d
   1401266da:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401266de:	ff e0                	jmp    *%rax
   1401266e0:	41 80 fc 02          	cmp    $0x2,%r12b
   1401266e4:	0f 84 e9 35 00 00    	je     140129cd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8333>
   1401266ea:	41 80 fc 01          	cmp    $0x1,%r12b
   1401266ee:	0f 84 69 5f 00 00    	je     14012c65d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacbd>
   1401266f4:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401266fb:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126702:	c5 f8 77             	vzeroupper
   140126705:	4c 29 ce             	sub    %r9,%rsi
   140126708:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   14012670d:	4c 29 c8             	sub    %r9,%rax
   140126710:	48 89 f7             	mov    %rsi,%rdi
   140126713:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   14012671a:	48 c1 ff 03          	sar    $0x3,%rdi
   14012671e:	48 39 f0             	cmp    %rsi,%rax
   140126721:	0f 82 80 53 00 00    	jb     14012baa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa107>
   140126727:	c5 f9 6f 05 91 52 23 	vmovdqa 0x235291(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   14012672e:	00 
   14012672f:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140126736:	4c 89 fa             	mov    %r15,%rdx
   140126739:	48 89 d9             	mov    %rbx,%rcx
   14012673c:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140126743:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012674a:	00 
   14012674b:	e8 f0 83 fe ff       	call   14010eb40 <setun::VM::handle_closure(setun::Chunk const&)>
   140126750:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140126757:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012675e:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140126765:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012676a:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012676e:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140126775:	4d 85 ed             	test   %r13,%r13
   140126778:	74 0d                	je     140126787 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4de7>
   14012677a:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   14012677f:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140126786:	00 
   140126787:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012678e:	0f 85 5c 23 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140126794:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012679b:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   1401267a0:	0f 83 ea bd ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   1401267a6:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401267ad:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401267b4:	01 
   1401267b5:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1401267ba:	48 85 c9             	test   %rcx,%rcx
   1401267bd:	0f 85 42 93 00 00    	jne    14012fb05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe165>
   1401267c3:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401267c7:	48 8d 3d d2 88 29 00 	lea    0x2988d2(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401267ce:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401267d2:	45 31 e4             	xor    %r12d,%r12d
   1401267d5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401267d9:	ff e0                	jmp    *%rax
   1401267db:	c4 c1 7a 6f 06       	vmovdqu (%r14),%xmm0
   1401267e0:	45 8b 46 10          	mov    0x10(%r14),%r8d
   1401267e4:	49 8d 6e 14          	lea    0x14(%r14),%rbp
   1401267e8:	45 84 e4             	test   %r12b,%r12b
   1401267eb:	0f 84 ed 4e 00 00    	je     14012b6de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d3e>
   1401267f1:	41 80 fc 01          	cmp    $0x1,%r12b
   1401267f5:	0f 84 a0 69 00 00    	je     14012d19b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7fb>
   1401267fb:	48 8b 83 80 53 01 00 	mov    0x15380(%rbx),%rax
   140126802:	48 85 c0             	test   %rax,%rax
   140126805:	0f 85 fb a8 00 00    	jne    140131106 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf766>
   14012680b:	48 8d 7e 08          	lea    0x8(%rsi),%rdi
   14012680f:	48 3b 7c 24 48       	cmp    0x48(%rsp),%rdi
   140126814:	0f 83 7b a4 00 00    	jae    140130c95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2f5>
   14012681a:	c5 f8 77             	vzeroupper
   14012681d:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140126822:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
   140126829:	00 
   14012682a:	48 8d 8c 24 d0 04 00 	lea    0x4d0(%rsp),%rcx
   140126831:	00 
   140126832:	48 89 06             	mov    %rax,(%rsi)
   140126835:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   14012683c:	00 
   14012683d:	48 89 fe             	mov    %rdi,%rsi
   140126840:	44 89 84 24 40 07 00 	mov    %r8d,0x740(%rsp)
   140126847:	00 
   140126848:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   14012684d:	c7 84 24 44 07 00 00 	movl   $0x0,0x744(%rsp)
   140126854:	00 00 00 00 
   140126858:	48 8b 84 24 40 07 00 	mov    0x740(%rsp),%rax
   14012685f:	00 
   140126860:	c5 f9 7f 84 24 30 07 	vmovdqa %xmm0,0x730(%rsp)
   140126867:	00 00 
   140126869:	48 89 84 24 80 01 00 	mov    %rax,0x180(%rsp)
   140126870:	00 
   140126871:	c5 f9 7f 84 24 70 01 	vmovdqa %xmm0,0x170(%rsp)
   140126878:	00 00 
   14012687a:	e8 81 63 0e 00       	call   14020cc00 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012687f:	48 8b 84 24 d0 04 00 	mov    0x4d0(%rsp),%rax
   140126886:	00 
   140126887:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   14012688e:	00 
   14012688f:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126896:	0f 85 d5 22 00 00    	jne    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   14012689c:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   1401268a1:	0f 83 ca 22 00 00    	jae    140128b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d1>
   1401268a7:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401268ae:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401268b5:	01 
   1401268b6:	48 85 c9             	test   %rcx,%rcx
   1401268b9:	0f 85 6d 7b 00 00    	jne    14012e42c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca8c>
   1401268bf:	41 0f b6 46 14       	movzbl 0x14(%r14),%eax
   1401268c4:	48 8d 3d d5 87 29 00 	lea    0x2987d5(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401268cb:	49 83 c6 15          	add    $0x15,%r14
   1401268cf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401268d3:	ff e0                	jmp    *%rax
   1401268d5:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401268d9:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   1401268e0:	00 
   1401268e1:	45 84 e4             	test   %r12b,%r12b
   1401268e4:	48 0f 44 c2          	cmove  %rdx,%rax
   1401268e8:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401268ef:	48 8b 00             	mov    (%rax),%rax
   1401268f2:	4a 89 04 ea          	mov    %rax,(%rdx,%r13,8)
   1401268f6:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401268fd:	0f 84 fd 21 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140126903:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140126908:	0f 83 f2 21 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   14012690e:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126915:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012691c:	01 
   14012691d:	48 85 c9             	test   %rcx,%rcx
   140126920:	0f 85 e2 8c 00 00    	jne    14012f608 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc68>
   140126926:	41 0f b6 06          	movzbl (%r14),%eax
   14012692a:	48 8d 3d 6f 87 29 00 	lea    0x29876f(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126931:	49 83 c6 01          	add    $0x1,%r14
   140126935:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126939:	ff e0                	jmp    *%rax
   14012693b:	45 84 e4             	test   %r12b,%r12b
   14012693e:	0f 85 4a 27 00 00    	jne    14012908e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76ee>
   140126944:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   14012694b:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126951:	4a 8b 04 e8          	mov    (%rax,%r13,8),%rax
   140126955:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   14012695c:	00 
   14012695d:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126964:	0f 84 96 21 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   14012696a:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012696f:	0f 83 8b 21 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140126975:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012697c:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126983:	01 
   140126984:	48 85 c9             	test   %rcx,%rcx
   140126987:	0f 85 5a 8d 00 00    	jne    14012f6e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd47>
   14012698d:	41 0f b6 06          	movzbl (%r14),%eax
   140126991:	48 8d 3d 08 87 29 00 	lea    0x298708(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126998:	49 83 c6 01          	add    $0x1,%r14
   14012699c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401269a0:	ff e0                	jmp    *%rax
   1401269a2:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   1401269a9:	00 fb ff 
   1401269ac:	48 89 84 24 d8 02 00 	mov    %rax,0x2d8(%rsp)
   1401269b3:	00 
   1401269b4:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   1401269bb:	00 
   1401269bc:	41 80 fc 01          	cmp    $0x1,%r12b
   1401269c0:	0f 85 03 8e 00 00    	jne    14012f7c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde29>
   1401269c6:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   1401269cd:	00 
   1401269ce:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401269d5:	45 31 e4             	xor    %r12d,%r12d
   1401269d8:	48 89 84 24 d8 02 00 	mov    %rax,0x2d8(%rsp)
   1401269df:	00 
   1401269e0:	48 85 c9             	test   %rcx,%rcx
   1401269e3:	0f 85 c5 a4 00 00    	jne    140130eae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf50e>
   1401269e9:	48 8b 46 f8          	mov    -0x8(%rsi),%rax
   1401269ed:	48 83 ee 10          	sub    $0x10,%rsi
   1401269f1:	48 89 84 24 e0 02 00 	mov    %rax,0x2e0(%rsp)
   1401269f8:	00 
   1401269f9:	48 8b 16             	mov    (%rsi),%rdx
   1401269fc:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   140126a03:	00 ff ff 
   140126a06:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140126a0d:	00 fd ff 
   140126a10:	48 21 d0             	and    %rdx,%rax
   140126a13:	48 39 c8             	cmp    %rcx,%rax
   140126a16:	0f 84 cc 3d 00 00    	je     14012a7e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e48>
   140126a1c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126a23:	0f 84 aa 20 00 00    	je     140128ad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7133>
   140126a29:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140126a2e:	0f 83 9f 20 00 00    	jae    140128ad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7133>
   140126a34:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126a3b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126a42:	01 
   140126a43:	48 85 c9             	test   %rcx,%rcx
   140126a46:	0f 85 b1 7a 00 00    	jne    14012e4fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb5d>
   140126a4c:	41 0f b6 06          	movzbl (%r14),%eax
   140126a50:	48 8d 3d 49 86 29 00 	lea    0x298649(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126a57:	49 83 c6 01          	add    $0x1,%r14
   140126a5b:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126a5f:	ff e0                	jmp    *%rax
   140126a61:	41 80 fc 02          	cmp    $0x2,%r12b
   140126a65:	0f 84 b4 32 00 00    	je     140129d1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x837f>
   140126a6b:	41 80 fc 01          	cmp    $0x1,%r12b
   140126a6f:	0f 84 ca 54 00 00    	je     14012bf3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59f>
   140126a75:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126a7c:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126a83:	c5 f8 77             	vzeroupper
   140126a86:	4c 29 ce             	sub    %r9,%rsi
   140126a89:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140126a8e:	4c 29 c8             	sub    %r9,%rax
   140126a91:	48 89 f7             	mov    %rsi,%rdi
   140126a94:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140126a9b:	48 c1 ff 03          	sar    $0x3,%rdi
   140126a9f:	48 39 f0             	cmp    %rsi,%rax
   140126aa2:	0f 82 d5 4f 00 00    	jb     14012ba7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0dd>
   140126aa8:	c5 f9 6f 05 10 4f 23 	vmovdqa 0x234f10(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140126aaf:	00 
   140126ab0:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140126ab7:	4c 89 fa             	mov    %r15,%rdx
   140126aba:	48 89 d9             	mov    %rbx,%rcx
   140126abd:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140126ac4:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140126acb:	00 
   140126acc:	e8 1f a6 fd ff       	call   1401010f0 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140126ad1:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140126ad8:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126adf:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140126ae6:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140126aeb:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140126aef:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140126af6:	4d 85 ed             	test   %r13,%r13
   140126af9:	74 0d                	je     140126b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5168>
   140126afb:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140126b00:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140126b07:	00 
   140126b08:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126b0f:	0f 85 db 1f 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140126b15:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126b1c:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140126b21:	0f 83 69 ba ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140126b27:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126b2e:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126b35:	01 
   140126b36:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140126b3b:	48 85 c9             	test   %rcx,%rcx
   140126b3e:	0f 85 4e 98 00 00    	jne    140130392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9f2>
   140126b44:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126b48:	48 8d 3d 51 85 29 00 	lea    0x298551(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126b4f:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140126b53:	45 31 e4             	xor    %r12d,%r12d
   140126b56:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126b5a:	ff e0                	jmp    *%rax
   140126b5c:	41 80 fc 02          	cmp    $0x2,%r12b
   140126b60:	0f 84 21 31 00 00    	je     140129c87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82e7>
   140126b66:	41 80 fc 01          	cmp    $0x1,%r12b
   140126b6a:	0f 84 71 5c 00 00    	je     14012c7e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae41>
   140126b70:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126b77:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126b7e:	c5 f8 77             	vzeroupper
   140126b81:	4c 29 ce             	sub    %r9,%rsi
   140126b84:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140126b89:	4c 29 c8             	sub    %r9,%rax
   140126b8c:	48 89 f7             	mov    %rsi,%rdi
   140126b8f:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140126b96:	48 c1 ff 03          	sar    $0x3,%rdi
   140126b9a:	48 39 f0             	cmp    %rsi,%rax
   140126b9d:	0f 82 c5 4e 00 00    	jb     14012ba68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0c8>
   140126ba3:	c5 f9 6f 05 15 4e 23 	vmovdqa 0x234e15(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140126baa:	00 
   140126bab:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140126bb2:	4c 89 fa             	mov    %r15,%rdx
   140126bb5:	48 89 d9             	mov    %rbx,%rcx
   140126bb8:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140126bbf:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140126bc6:	00 
   140126bc7:	e8 e4 71 fe ff       	call   14010ddb0 <setun::VM::handle_get_field(setun::Chunk const&)>
   140126bcc:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140126bd3:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126bda:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140126be1:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140126be6:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140126bea:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140126bf1:	4d 85 ed             	test   %r13,%r13
   140126bf4:	74 0d                	je     140126c03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5263>
   140126bf6:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140126bfb:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140126c02:	00 
   140126c03:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126c0a:	0f 85 e0 1e 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140126c10:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126c17:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140126c1c:	0f 83 6e b9 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140126c22:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126c29:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126c30:	01 
   140126c31:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140126c36:	48 85 c9             	test   %rcx,%rcx
   140126c39:	0f 85 aa 83 00 00    	jne    14012efe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd649>
   140126c3f:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140126c43:	48 8d 3d 56 84 29 00 	lea    0x298456(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126c4a:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   140126c4e:	45 31 e4             	xor    %r12d,%r12d
   140126c51:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126c55:	ff e0                	jmp    *%rax
   140126c57:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126c5e:	00 fb ff 
   140126c61:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140126c68:	00 
   140126c69:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140126c70:	00 
   140126c71:	41 80 fc 02          	cmp    $0x2,%r12b
   140126c75:	0f 85 26 91 00 00    	jne    14012fda1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe401>
   140126c7b:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140126c82:	00 
   140126c83:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126c89:	48 89 84 24 60 02 00 	mov    %rax,0x260(%rsp)
   140126c90:	00 
   140126c91:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140126c96:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
   140126c9d:	00 
   140126c9e:	4c 8b 84 24 58 02 00 	mov    0x258(%rsp),%r8
   140126ca5:	00 
   140126ca6:	48 8b 84 24 60 02 00 	mov    0x260(%rsp),%rax
   140126cad:	00 
   140126cae:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126cb5:	00 ff ff 
   140126cb8:	49 ba 00 00 00 00 00 	movabs $0xfff8000000000000,%r10
   140126cbf:	00 f8 ff 
   140126cc2:	4d 89 c1             	mov    %r8,%r9
   140126cc5:	49 21 d1             	and    %rdx,%r9
   140126cc8:	4d 39 d1             	cmp    %r10,%r9
   140126ccb:	0f 84 4c 2e 00 00    	je     140129b1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x817d>
   140126cd1:	48 b9 00 00 00 00 00 	movabs $0xfffd000000000000,%rcx
   140126cd8:	00 fd ff 
   140126cdb:	49 39 c9             	cmp    %rcx,%r9
   140126cde:	0f 84 4c 5e 00 00    	je     14012cb30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb190>
   140126ce4:	49 ba 00 00 00 00 00 	movabs $0xfffc000000000000,%r10
   140126ceb:	00 fc ff 
   140126cee:	4d 39 d0             	cmp    %r10,%r8
   140126cf1:	0f 84 a6 27 00 00    	je     14012949d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afd>
   140126cf7:	49 b9 ff ff ff ff ff 	movabs $0xfff7ffffffffffff,%r9
   140126cfe:	ff f7 ff 
   140126d01:	4d 39 c1             	cmp    %r8,%r9
   140126d04:	0f 83 93 27 00 00    	jae    14012949d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afd>
   140126d0a:	4c 39 d0             	cmp    %r10,%rax
   140126d0d:	0f 84 8a 27 00 00    	je     14012949d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afd>
   140126d13:	49 39 c1             	cmp    %rax,%r9
   140126d16:	0f 83 81 27 00 00    	jae    14012949d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afd>
   140126d1c:	48 21 c2             	and    %rax,%rdx
   140126d1f:	48 39 ca             	cmp    %rcx,%rdx
   140126d22:	0f 84 5a 72 00 00    	je     14012df82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5e2>
   140126d28:	48 8d 8c 24 58 02 00 	lea    0x258(%rsp),%rcx
   140126d2f:	00 
   140126d30:	c5 f8 77             	vzeroupper
   140126d33:	e8 68 28 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140126d38:	48 8d 8c 24 60 02 00 	lea    0x260(%rsp),%rcx
   140126d3f:	00 
   140126d40:	48 89 c7             	mov    %rax,%rdi
   140126d43:	e8 58 28 0f 00       	call   1402195a0 <setun::VMValue::as_int() const>
   140126d48:	48 39 c7             	cmp    %rax,%rdi
   140126d4b:	40 0f 94 c7          	sete   %dil
   140126d4f:	48 ba 00 00 00 00 00 	movabs $0xfffa000000000000,%rdx
   140126d56:	00 fa ff 
   140126d59:	40 0f b6 c7          	movzbl %dil,%eax
   140126d5d:	48 01 d0             	add    %rdx,%rax
   140126d60:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140126d67:	00 
   140126d68:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126d6f:	0f 84 1b 1d 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140126d75:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140126d7a:	0f 83 10 1d 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140126d80:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126d87:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126d8e:	01 
   140126d8f:	48 85 c9             	test   %rcx,%rcx
   140126d92:	0f 85 4d 9e 00 00    	jne    140130be5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf245>
   140126d98:	41 0f b6 06          	movzbl (%r14),%eax
   140126d9c:	48 8d 3d fd 82 29 00 	lea    0x2982fd(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126da3:	49 83 c6 01          	add    $0x1,%r14
   140126da7:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126dab:	ff e0                	jmp    *%rax
   140126dad:	41 0f b7 3e          	movzwl (%r14),%edi
   140126db1:	45 0f b7 46 02       	movzwl 0x2(%r14),%r8d
   140126db6:	49 8d 6e 04          	lea    0x4(%r14),%rbp
   140126dba:	4c 01 ef             	add    %r13,%rdi
   140126dbd:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   140126dc4:	0f 83 f0 8c 00 00    	jae    14012faba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe11a>
   140126dca:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140126dd1:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126dd8:	00 ff ff 
   140126ddb:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140126de2:	00 f8 ff 
   140126de5:	48 8d 3c f8          	lea    (%rax,%rdi,8),%rdi
   140126de9:	48 8b 07             	mov    (%rdi),%rax
   140126dec:	48 21 c2             	and    %rax,%rdx
   140126def:	48 39 ca             	cmp    %rcx,%rdx
   140126df2:	0f 85 39 61 00 00    	jne    14012cf31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb591>
   140126df8:	48 c1 e0 10          	shl    $0x10,%rax
   140126dfc:	4d 0f bf c0          	movswq %r8w,%r8
   140126e00:	48 b9 00 00 00 00 00 	movabs $0x800000000000,%rcx
   140126e07:	80 00 00 
   140126e0a:	49 b9 ff ff ff ff ff 	movabs $0xffffffffffff,%r9
   140126e11:	ff 00 00 
   140126e14:	48 c1 f8 10          	sar    $0x10,%rax
   140126e18:	4c 01 c0             	add    %r8,%rax
   140126e1b:	48 01 c1             	add    %rax,%rcx
   140126e1e:	49 39 c9             	cmp    %rcx,%r9
   140126e21:	0f 82 0e 61 00 00    	jb     14012cf35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb595>
   140126e27:	4c 21 c8             	and    %r9,%rax
   140126e2a:	48 09 d0             	or     %rdx,%rax
   140126e2d:	48 89 07             	mov    %rax,(%rdi)
   140126e30:	48 83 83 28 52 01 00 	addq   $0x1,0x15228(%rbx)
   140126e37:	01 
   140126e38:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140126e3f:	0f 85 29 1d 00 00    	jne    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140126e45:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140126e4a:	0f 83 1e 1d 00 00    	jae    140128b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ce>
   140126e50:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126e57:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126e5e:	01 
   140126e5f:	48 85 c9             	test   %rcx,%rcx
   140126e62:	0f 85 7f 9c 00 00    	jne    140130ae7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf147>
   140126e68:	41 0f b6 46 04       	movzbl 0x4(%r14),%eax
   140126e6d:	48 8d 3d 2c 82 29 00 	lea    0x29822c(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126e74:	49 83 c6 05          	add    $0x5,%r14
   140126e78:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126e7c:	ff e0                	jmp    *%rax
   140126e7e:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   140126e82:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   140126e89:	00 
   140126e8a:	45 84 e4             	test   %r12b,%r12b
   140126e8d:	48 0f 44 c2          	cmove  %rdx,%rax
   140126e91:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140126e98:	48 8b 00             	mov    (%rax),%rax
   140126e9b:	4a 89 44 ea 18       	mov    %rax,0x18(%rdx,%r13,8)
   140126ea0:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126ea7:	0f 84 53 1c 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140126ead:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140126eb2:	0f 83 48 1c 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140126eb8:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126ebf:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126ec6:	01 
   140126ec7:	48 85 c9             	test   %rcx,%rcx
   140126eca:	0f 85 9c 88 00 00    	jne    14012f76c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xddcc>
   140126ed0:	41 0f b6 06          	movzbl (%r14),%eax
   140126ed4:	48 8d 3d c5 81 29 00 	lea    0x2981c5(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126edb:	49 83 c6 01          	add    $0x1,%r14
   140126edf:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126ee3:	ff e0                	jmp    *%rax
   140126ee5:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140126eec:	00 fb ff 
   140126eef:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   140126ef6:	00 
   140126ef7:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   140126efe:	00 
   140126eff:	41 80 fc 02          	cmp    $0x2,%r12b
   140126f03:	0f 85 4a 89 00 00    	jne    14012f853 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdeb3>
   140126f09:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140126f10:	00 
   140126f11:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140126f17:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
   140126f1e:	00 
   140126f1f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140126f24:	48 89 84 24 28 03 00 	mov    %rax,0x328(%rsp)
   140126f2b:	00 
   140126f2c:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   140126f33:	00 ff ff 
   140126f36:	49 89 c0             	mov    %rax,%r8
   140126f39:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   140126f40:	00 f8 ff 
   140126f43:	49 21 d0             	and    %rdx,%r8
   140126f46:	49 39 c8             	cmp    %rcx,%r8
   140126f49:	0f 84 6f 27 00 00    	je     1401296be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d1e>
   140126f4f:	48 83 83 48 52 01 00 	addq   $0x1,0x15248(%rbx)
   140126f56:	01 
   140126f57:	48 8d 94 24 30 03 00 	lea    0x330(%rsp),%rdx
   140126f5e:	00 
   140126f5f:	48 8d 8c 24 28 03 00 	lea    0x328(%rsp),%rcx
   140126f66:	00 
   140126f67:	41 c6 46 ff 21       	movb   $0x21,-0x1(%r14)
   140126f6c:	c5 f8 77             	vzeroupper
   140126f6f:	e8 4c 23 0f 00       	call   1402192c0 <setun::VMValue::sub(setun::VMValue const&) const>
   140126f74:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140126f7b:	00 
   140126f7c:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140126f83:	0f 84 07 1b 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140126f89:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140126f8e:	0f 83 fc 1a 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   140126f94:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140126f9b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140126fa2:	01 
   140126fa3:	48 85 c9             	test   %rcx,%rcx
   140126fa6:	0f 85 62 a0 00 00    	jne    14013100e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf66e>
   140126fac:	41 0f b6 06          	movzbl (%r14),%eax
   140126fb0:	48 8d 3d e9 80 29 00 	lea    0x2980e9(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126fb7:	49 83 c6 01          	add    $0x1,%r14
   140126fbb:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140126fbf:	ff e0                	jmp    *%rax
   140126fc1:	41 80 fc 02          	cmp    $0x2,%r12b
   140126fc5:	0f 84 32 2c 00 00    	je     140129bfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x825d>
   140126fcb:	41 80 fc 01          	cmp    $0x1,%r12b
   140126fcf:	0f 84 40 52 00 00    	je     14012c215 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa875>
   140126fd5:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140126fdc:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140126fe3:	c5 f8 77             	vzeroupper
   140126fe6:	4c 29 ce             	sub    %r9,%rsi
   140126fe9:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140126fee:	4c 29 c8             	sub    %r9,%rax
   140126ff1:	48 89 f7             	mov    %rsi,%rdi
   140126ff4:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140126ffb:	48 c1 ff 03          	sar    $0x3,%rdi
   140126fff:	48 39 f0             	cmp    %rsi,%rax
   140127002:	0f 82 36 4a 00 00    	jb     14012ba3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa09e>
   140127008:	c5 f9 6f 05 b0 49 23 	vmovdqa 0x2349b0(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   14012700f:	00 
   140127010:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127017:	4c 89 fa             	mov    %r15,%rdx
   14012701a:	48 89 d9             	mov    %rbx,%rcx
   14012701d:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   140127024:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   14012702b:	00 
   14012702c:	e8 5f 0d fe ff       	call   140107d90 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140127031:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127038:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   14012703f:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   140127046:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   14012704b:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   14012704f:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   140127056:	4d 85 ed             	test   %r13,%r13
   140127059:	74 0d                	je     140127068 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x56c8>
   14012705b:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140127060:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140127067:	00 
   140127068:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012706f:	0f 85 7b 1a 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   140127075:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   14012707c:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140127081:	0f 83 09 b5 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140127087:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012708e:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140127095:	01 
   140127096:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   14012709b:	48 85 c9             	test   %rcx,%rcx
   14012709e:	0f 85 d7 92 00 00    	jne    14013037b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9db>
   1401270a4:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   1401270a8:	48 8d 3d f1 7f 29 00 	lea    0x297ff1(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401270af:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   1401270b3:	45 31 e4             	xor    %r12d,%r12d
   1401270b6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401270ba:	ff e0                	jmp    *%rax
   1401270bc:	41 80 fc 02          	cmp    $0x2,%r12b
   1401270c0:	0f 84 a2 33 00 00    	je     14012a468 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ac8>
   1401270c6:	41 80 fc 01          	cmp    $0x1,%r12b
   1401270ca:	0f 85 ba ef 00 00    	jne    14013608a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146ea>
   1401270d0:	48 8b 83 80 53 01 00 	mov    0x15380(%rbx),%rax
   1401270d7:	48 85 c0             	test   %rax,%rax
   1401270da:	0f 85 51 9c 00 00    	jne    140130d31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf391>
   1401270e0:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401270e7:	48 8d 7e 08          	lea    0x8(%rsi),%rdi
   1401270eb:	48 3b 7c 24 48       	cmp    0x48(%rsp),%rdi
   1401270f0:	0f 83 73 9b 00 00    	jae    140130c69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2c9>
   1401270f6:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401270fd:	c5 f8 77             	vzeroupper
   140127100:	48 8b 8c 24 90 01 00 	mov    0x190(%rsp),%rcx
   140127107:	00 
   140127108:	48 89 fa             	mov    %rdi,%rdx
   14012710b:	48 89 0e             	mov    %rcx,(%rsi)
   14012710e:	4c 29 ca             	sub    %r9,%rdx
   140127111:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   140127116:	4c 29 c8             	sub    %r9,%rax
   140127119:	48 89 d6             	mov    %rdx,%rsi
   14012711c:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   140127123:	48 c1 fe 03          	sar    $0x3,%rsi
   140127127:	48 39 d0             	cmp    %rdx,%rax
   14012712a:	0f 82 48 45 00 00    	jb     14012b678 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cd8>
   140127130:	c5 f9 6f 05 88 48 23 	vmovdqa 0x234888(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   140127137:	00 
   140127138:	48 89 b3 60 10 00 00 	mov    %rsi,0x1060(%rbx)
   14012713f:	4c 89 fa             	mov    %r15,%rdx
   140127142:	48 89 d9             	mov    %rbx,%rcx
   140127145:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012714c:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127153:	00 
   140127154:	e8 f7 58 fe ff       	call   14010ca50 <setun::VM::handle_throw(setun::Chunk const&)>
   140127159:	48 b8 00 00 00 00 00 	movabs $0xfffb000000000000,%rax
   140127160:	00 fb ff 
   140127163:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   14012716a:	00 
   14012716b:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140127172:	00 
   140127173:	41 80 fc 02          	cmp    $0x2,%r12b
   140127177:	0f 85 2c 84 00 00    	jne    14012f5a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc09>
   14012717d:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
   140127184:	00 
   140127185:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   14012718b:	48 89 84 24 c0 01 00 	mov    %rax,0x1c0(%rsp)
   140127192:	00 
   140127193:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   140127198:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
   14012719f:	00 
   1401271a0:	48 ba 00 00 00 00 00 	movabs $0xffff000000000000,%rdx
   1401271a7:	00 ff ff 
   1401271aa:	49 89 c0             	mov    %rax,%r8
   1401271ad:	48 b9 00 00 00 00 00 	movabs $0xfff8000000000000,%rcx
   1401271b4:	00 f8 ff 
   1401271b7:	49 21 d0             	and    %rdx,%r8
   1401271ba:	49 39 c8             	cmp    %rcx,%r8
   1401271bd:	0f 84 0c 30 00 00    	je     14012a1cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x882f>
   1401271c3:	48 8d 94 24 c0 01 00 	lea    0x1c0(%rsp),%rdx
   1401271ca:	00 
   1401271cb:	48 8d 8c 24 b8 01 00 	lea    0x1b8(%rsp),%rcx
   1401271d2:	00 
   1401271d3:	c5 f8 77             	vzeroupper
   1401271d6:	e8 75 18 0f 00       	call   140218a50 <setun::VMValue::mul(setun::VMValue const&) const>
   1401271db:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   1401271e2:	00 
   1401271e3:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   1401271ea:	0f 84 a0 18 00 00    	je     140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401271f0:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   1401271f5:	0f 83 95 18 00 00    	jae    140128a90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f0>
   1401271fb:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140127202:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140127209:	01 
   14012720a:	48 85 c9             	test   %rcx,%rcx
   14012720d:	0f 85 bb 99 00 00    	jne    140130bce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf22e>
   140127213:	41 0f b6 06          	movzbl (%r14),%eax
   140127217:	48 8d 3d 82 7e 29 00 	lea    0x297e82(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012721e:	49 83 c6 01          	add    $0x1,%r14
   140127222:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127226:	ff e0                	jmp    *%rax
   140127228:	41 0f b7 3e          	movzwl (%r14),%edi
   14012722c:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   140127230:	4c 01 ef             	add    %r13,%rdi
   140127233:	48 3b bb 68 52 01 00 	cmp    0x15268(%rbx),%rdi
   14012723a:	0f 83 a8 71 00 00    	jae    14012e3e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca48>
   140127240:	48 8b 83 70 10 00 00 	mov    0x1070(%rbx),%rax
   140127247:	48 2b 83 68 10 00 00 	sub    0x1068(%rbx),%rax
   14012724e:	48 c1 f8 03          	sar    $0x3,%rax
   140127252:	48 39 c7             	cmp    %rax,%rdi
   140127255:	0f 83 75 71 00 00    	jae    14012e3d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca30>
   14012725b:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   14012725f:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   140127266:	00 
   140127267:	45 84 e4             	test   %r12b,%r12b
   14012726a:	48 0f 44 c2          	cmove  %rdx,%rax
   14012726e:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140127275:	48 8b 00             	mov    (%rax),%rax
   140127278:	48 89 04 fa          	mov    %rax,(%rdx,%rdi,8)
   14012727c:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140127283:	0f 85 f4 18 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140127289:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012728e:	0f 83 e9 18 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140127294:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012729b:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401272a2:	01 
   1401272a3:	48 85 c9             	test   %rcx,%rcx
   1401272a6:	0f 85 0c 71 00 00    	jne    14012e3b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca18>
   1401272ac:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   1401272b1:	48 8d 3d e8 7d 29 00 	lea    0x297de8(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401272b8:	49 83 c6 03          	add    $0x3,%r14
   1401272bc:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401272c0:	ff e0                	jmp    *%rax
   1401272c2:	48 8b 93 88 10 00 00 	mov    0x1088(%rbx),%rdx
   1401272c9:	41 0f b7 06          	movzwl (%r14),%eax
   1401272cd:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   1401272d1:	48 2b 93 80 10 00 00 	sub    0x1080(%rbx),%rdx
   1401272d8:	48 c1 fa 03          	sar    $0x3,%rdx
   1401272dc:	48 39 d0             	cmp    %rdx,%rax
   1401272df:	0f 83 88 79 00 00    	jae    14012ec6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2cd>
   1401272e5:	45 84 e4             	test   %r12b,%r12b
   1401272e8:	0f 85 48 1c 00 00    	jne    140128f36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7596>
   1401272ee:	48 8b 93 80 10 00 00 	mov    0x1080(%rbx),%rdx
   1401272f5:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1401272fb:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   1401272ff:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140127306:	00 
   140127307:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012730e:	0f 85 69 18 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   140127314:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   140127319:	0f 83 5e 18 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   14012731f:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140127326:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012732d:	01 
   14012732e:	48 85 c9             	test   %rcx,%rcx
   140127331:	0f 85 7a 84 00 00    	jne    14012f7b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde11>
   140127337:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   14012733c:	48 8d 3d 5d 7d 29 00 	lea    0x297d5d(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127343:	49 83 c6 03          	add    $0x3,%r14
   140127347:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   14012734b:	ff e0                	jmp    *%rax
   14012734d:	41 0f b7 06          	movzwl (%r14),%eax
   140127351:	48 8b 93 70 10 00 00 	mov    0x1070(%rbx),%rdx
   140127358:	49 8d 6e 02          	lea    0x2(%r14),%rbp
   14012735c:	48 2b 93 68 10 00 00 	sub    0x1068(%rbx),%rdx
   140127363:	4c 01 e8             	add    %r13,%rax
   140127366:	48 c1 fa 03          	sar    $0x3,%rdx
   14012736a:	48 39 d0             	cmp    %rdx,%rax
   14012736d:	0f 83 e6 81 00 00    	jae    14012f559 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbb9>
   140127373:	45 84 e4             	test   %r12b,%r12b
   140127376:	0f 85 1e 1f 00 00    	jne    14012929a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78fa>
   14012737c:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   140127383:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140127389:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
   14012738d:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140127394:	00 
   140127395:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   14012739c:	0f 85 db 17 00 00    	jne    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   1401273a2:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   1401273a7:	0f 83 d0 17 00 00    	jae    140128b7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71dd>
   1401273ad:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   1401273b4:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   1401273bb:	01 
   1401273bc:	48 85 c9             	test   %rcx,%rcx
   1401273bf:	0f 85 4e 89 00 00    	jne    14012fd13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe373>
   1401273c5:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
   1401273ca:	48 8d 3d cf 7c 29 00 	lea    0x297ccf(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401273d1:	49 83 c6 03          	add    $0x3,%r14
   1401273d5:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401273d9:	ff e0                	jmp    *%rax
   1401273db:	48 8d 56 f8          	lea    -0x8(%rsi),%rdx
   1401273df:	48 8d 84 24 90 01 00 	lea    0x190(%rsp),%rax
   1401273e6:	00 
   1401273e7:	45 84 e4             	test   %r12b,%r12b
   1401273ea:	48 0f 44 c2          	cmove  %rdx,%rax
   1401273ee:	48 8b 93 68 10 00 00 	mov    0x1068(%rbx),%rdx
   1401273f5:	48 8b 00             	mov    (%rax),%rax
   1401273f8:	4a 89 44 ea 08       	mov    %rax,0x8(%rdx,%r13,8)
   1401273fd:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   140127404:	0f 84 f6 16 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   14012740a:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   14012740f:	0f 83 eb 16 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140127415:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   14012741c:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   140127423:	01 
   140127424:	48 85 c9             	test   %rcx,%rcx
   140127427:	0f 85 17 70 00 00    	jne    14012e444 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcaa4>
   14012742d:	41 0f b6 06          	movzbl (%r14),%eax
   140127431:	48 8d 3d 68 7c 29 00 	lea    0x297c68(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127438:	49 83 c6 01          	add    $0x1,%r14
   14012743c:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   140127440:	ff e0                	jmp    *%rax
   140127442:	45 84 e4             	test   %r12b,%r12b
   140127445:	0f 85 fc 1c 00 00    	jne    140129147 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77a7>
   14012744b:	48 8b 83 68 10 00 00 	mov    0x1068(%rbx),%rax
   140127452:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   140127458:	4a 8b 44 e8 18       	mov    0x18(%rax,%r13,8),%rax
   14012745d:	48 89 84 24 90 01 00 	mov    %rax,0x190(%rsp)
   140127464:	00 
   140127465:	80 bb 40 10 00 00 00 	cmpb   $0x0,0x1040(%rbx)
   14012746c:	0f 84 8e 16 00 00    	je     140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   140127472:	4c 3b 74 24 38       	cmp    0x38(%rsp),%r14
   140127477:	0f 83 83 16 00 00    	jae    140128b00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7160>
   14012747d:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140127484:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012748b:	01 
   14012748c:	48 85 c9             	test   %rcx,%rcx
   14012748f:	0f 85 a7 83 00 00    	jne    14012f83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde9c>
   140127495:	41 0f b6 06          	movzbl (%r14),%eax
   140127499:	48 8d 3d 00 7c 29 00 	lea    0x297c00(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274a0:	49 83 c6 01          	add    $0x1,%r14
   1401274a4:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401274a8:	ff e0                	jmp    *%rax
   1401274aa:	41 80 fc 02          	cmp    $0x2,%r12b
   1401274ae:	0f 84 b5 37 00 00    	je     14012ac69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92c9>
   1401274b4:	41 80 fc 01          	cmp    $0x1,%r12b
   1401274b8:	0f 84 ad 55 00 00    	je     14012ca6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0cb>
   1401274be:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401274c5:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401274cc:	c5 f8 77             	vzeroupper
   1401274cf:	4c 29 ce             	sub    %r9,%rsi
   1401274d2:	4c 2b 74 24 40       	sub    0x40(%rsp),%r14
   1401274d7:	4c 29 c8             	sub    %r9,%rax
   1401274da:	48 89 f7             	mov    %rsi,%rdi
   1401274dd:	4c 89 b3 38 10 00 00 	mov    %r14,0x1038(%rbx)
   1401274e4:	48 c1 ff 03          	sar    $0x3,%rdi
   1401274e8:	48 39 f0             	cmp    %rsi,%rax
   1401274eb:	0f 82 23 45 00 00    	jb     14012ba14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa074>
   1401274f1:	c5 f9 6f 05 c7 44 23 	vmovdqa 0x2344c7(%rip),%xmm0        # 14035b9c0 <CSWTCH.3340+0x1a0>
   1401274f8:	00 
   1401274f9:	48 89 bb 60 10 00 00 	mov    %rdi,0x1060(%rbx)
   140127500:	4c 89 fa             	mov    %r15,%rdx
   140127503:	48 89 d9             	mov    %rbx,%rcx
   140127506:	c6 83 a0 53 01 00 00 	movb   $0x0,0x153a0(%rbx)
   14012750d:	c5 f9 7f 83 90 53 01 	vmovdqa %xmm0,0x15390(%rbx)
   140127514:	00 
   140127515:	e8 f6 89 fd ff       	call   1400fff10 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   14012751a:	48 8b 83 60 10 00 00 	mov    0x1060(%rbx),%rax
   140127521:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   140127528:	4c 8b ab c0 50 01 00 	mov    0x150c0(%rbx),%r13
   14012752f:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
   140127534:	49 8d 34 c1          	lea    (%r9,%rax,8),%rsi
   140127538:	48 03 ab 38 10 00 00 	add    0x1038(%rbx),%rbp
   14012753f:	4d 85 ed             	test   %r13,%r13
   140127542:	74 0d                	je     140127551 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bb1>
   140127544:	4b 8d 44 ad fb       	lea    -0x5(%r13,%r13,4),%rax
   140127549:	4c 8b ac c3 c8 10 00 	mov    0x10c8(%rbx,%rax,8),%r13
   140127550:	00 
   140127551:	80 bb 40 10 00 00 01 	cmpb   $0x1,0x1040(%rbx)
   140127558:	0f 85 92 15 00 00    	jne    140128af0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7150>
   14012755e:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   140127565:	48 3b 6c 24 38       	cmp    0x38(%rsp),%rbp
   14012756a:	0f 83 20 b0 ff ff    	jae    140122590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf0>
   140127570:	48 8b 8b 80 53 01 00 	mov    0x15380(%rbx),%rcx
   140127577:	48 83 83 18 52 01 00 	addq   $0x1,0x15218(%rbx)
   14012757e:	01 
   14012757f:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   140127584:	48 85 c9             	test   %rcx,%rcx
   140127587:	0f 85 e5 6e 00 00    	jne    14012e472 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcad2>
   14012758d:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
   140127591:	48 8d 3d 08 7b 29 00 	lea    0x297b08(%rip),%rdi        # 1403bf0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127598:	4c 8d 75 01          	lea    0x1(%rbp),%r14
   14012759c:	45 31 e4             	xor    %r12d,%r12d
   14012759f:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
   1401275a3:	ff e0                	jmp    *%rax
   1401275a5:	41 80 fc 02          	cmp    $0x2,%r12b
   1401275a9:	0f 84 3c 35 00 00    	je     14012aaeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x914b>
   1401275af:	41 80 fc 01          	cmp    $0x1,%r12b
   1401275b3:	0f 84 34 53 00 00    	je     14012c8ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf4d>
   1401275b9:	4c 8b 8b 48 10 00 00 	mov    0x1048(%rbx),%r9
   1401275c0:	48 8b 83 50 10 00 00 	mov    0x1050(%rbx),%rax
   1401275c7:	c5 f8 77             	vzeroupper
   1401275ca:	4c 29 ce             	sub    %r9,%rsi
