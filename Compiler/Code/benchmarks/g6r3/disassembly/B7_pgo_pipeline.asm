00000001401235e0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   1401235e0:	push   %r15
   1401235e2:	push   %r14
   1401235e4:	push   %r13
   1401235e6:	push   %r12
   1401235e8:	push   %rbp
   1401235e9:	push   %rdi
   1401235ea:	push   %rsi
   1401235eb:	push   %rbx
   1401235ec:	sub    $0x968,%rsp
   1401235f3:	vmovaps %xmm6,0x8c0(%rsp)
   1401235fc:	vmovaps %xmm7,0x8d0(%rsp)
   140123605:	vmovaps %xmm8,0x8e0(%rsp)
   14012360e:	vmovaps %xmm9,0x8f0(%rsp)
   140123617:	vmovaps %xmm10,0x900(%rsp)
   140123620:	vmovaps %xmm11,0x910(%rsp)
   140123629:	vmovaps %xmm12,0x920(%rsp)
   140123632:	vmovaps %xmm13,0x930(%rsp)
   14012363b:	vmovaps %xmm14,0x940(%rsp)
   140123644:	vmovaps %xmm15,0x950(%rsp)
   14012364d:	mov    0x8(%rdx),%rax
   140123651:	sub    (%rdx),%rax
   140123654:	mov    %rcx,%rbx
   140123657:	mov    %rdx,%r15
   14012365a:	cmp    %rax,0x1038(%rcx)
   140123661:	jb     140123938 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x358>
   140123667:	mov    0x152c8(%rcx),%rsi
   14012366e:	movb   $0x1,0x1040(%rcx)
   140123675:	movq   $0x0,0x1038(%rcx)
   140123680:	test   %rsi,%rsi
   140123683:	je     14012394f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36f>
   140123689:	cmpb   $0x0,0x152c1(%rbx)
   140123690:	je     14012394f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36f>
   140123696:	mov    0xe0(%rsi),%rax
   14012369d:	cmp    %rax,0xd8(%rsi)
   1401236a4:	jne    140124228 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc48>
   1401236aa:	mov    0x88(%r15),%rax
   1401236b1:	sub    0x80(%r15),%rax
   1401236b8:	mov    $0x80,%edx
   1401236bd:	lea    0xd8(%rsi),%rcx
   1401236c4:	sar    $0x2,%rax
   1401236c8:	add    $0x10,%rax
   1401236cc:	cmp    $0x80,%rax
   1401236d2:	jbe    1401236e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108>
   1401236d4:	nopl   0x0(%rax)
   1401236d8:	nopl   0x0(%rax,%rax,1)
   1401236e0:	add    %rdx,%rdx
   1401236e3:	cmp    %rax,%rdx
   1401236e6:	jb     1401236e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100>
   1401236e8:	mov    0x8c(%rsi),%eax
   1401236ee:	mov    0x88(%rsi),%r9d
   1401236f5:	mov    $0x80,%r8d
   1401236fb:	mov    %eax,0x28(%rsp)
   1401236ff:	mov    0x90(%rsi),%eax
   140123705:	mov    %eax,0x20(%rsp)
   140123709:	call   1401abd80 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   14012370e:	vmovdqu 0xd8(%rsi),%xmm0
   140123716:	vmovdqu 0xe8(%rsi),%xmm1
   14012371e:	vpextrq $0x1,%xmm1,%rcx
   140123724:	vpblendw $0xf,%xmm0,%xmm1,%xmm1
   14012372a:	vmovq  %xmm0,%rax
   14012372f:	vmovdqu %xmm1,0x152d8(%rbx)
   140123737:	mov    0xe0(%rsi),%rdx
   14012373e:	mov    0x58(%r15),%rbp
   140123742:	sub    %rax,%rdx
   140123745:	mov    0xf8(%rsi),%rax
   14012374c:	sar    $0x5,%rdx
   140123750:	sub    %rcx,%rax
   140123753:	mov    %rdx,0x152e8(%rbx)
   14012375a:	sar    $0x5,%rax
   14012375e:	cmp    $0x1,%rdx
   140123762:	adc    $0xffffffffffffffff,%rdx
   140123766:	cmp    $0x1,%rax
   14012376a:	mov    %rax,0x152f0(%rbx)
   140123771:	adc    $0xffffffffffffffff,%rax
   140123775:	mov    %rdx,0x152f8(%rbx)
   14012377c:	mov    %rax,0x15300(%rbx)
   140123783:	test   %rbp,%rbp
   140123786:	je     14012388b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab>
   14012378c:	mov    0x24b44d(%rip),%rdi        # 14036ebe0 <CSWTCH.3092+0x220>
   140123793:	lea    0x1000(%rbx),%r14
   14012379a:	mov    $0x88,%ecx
   14012379f:	lea    0x8(%rbp),%r12
   1401237a3:	call   14034a1b0 <operator new(unsigned long long)>
   1401237a8:	vpxor  %xmm3,%xmm3,%xmm3
   1401237ac:	mov    %r12,%rdx
   1401237af:	mov    %rax,%rsi
   1401237b2:	mov    %rdi,0x8(%rax)
   1401237b6:	lea    0x26a9a3(%rip),%rax        # 14038e160 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   1401237bd:	mov    %rax,(%rsi)
   1401237c0:	lea    0x20(%rsi),%rax
   1401237c4:	lea    0x10(%rsi),%r13
   1401237c8:	vmovdqu %ymm3,0x10(%rsi)
   1401237cd:	mov    %r13,%rcx
   1401237d0:	mov    %rax,0x10(%rsi)
   1401237d4:	lea    0x40(%rsi),%rax
   1401237d8:	vmovdqu %ymm3,0x30(%rsi)
   1401237dd:	mov    %rax,0x30(%rsi)
   1401237e1:	lea    0x80(%rsi),%rax
   1401237e8:	vmovdqu %ymm3,0x68(%rsi)
   1401237ed:	mov    %rax,0x50(%rsi)
   1401237f1:	movq   $0x1,0x58(%rsi)
   1401237f9:	movq   $0x0,0x60(%rsi)
   140123801:	movq   $0x3f800000,0x70(%rsi)
   140123809:	vzeroupper
   14012380c:	call   140300880 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123811:	lea    0x28(%rbp),%rdx
   140123815:	lea    0x50(%rsi),%rcx
   140123819:	cmp    %rdx,%rcx
   14012381c:	je     140124210 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc30>
   140123822:	call   1402aeb30 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140123827:	mov    %r12,%rdx
   14012382a:	mov    %r14,%rcx
   14012382d:	call   140331dc0 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123832:	mov    %r13,(%rax)
   140123835:	mov    %rax,%r12
   140123838:	cmp    %rsi,0x8(%rax)
   14012383c:	je     140123876 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x296>
   14012383e:	lock addl $0x1,0x8(%rsi)
   140123843:	mov    0x8(%rax),%r13
   140123847:	test   %r13,%r13
   14012384a:	je     140123871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x291>
   14012384c:	mov    0x8(%r13),%rcx
   140123850:	lea    0x8(%r13),%rax
   140123854:	movabs $0x100000001,%rdx
   14012385e:	cmp    %rdx,%rcx
   140123861:	je     14012a2c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ce0>
   140123867:	lock subl $0x1,(%rax)
   14012386b:	je     14012a54a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f6a>
   140123871:	mov    %rsi,0x8(%r12)
   140123876:	mov    %rsi,%rcx
   140123879:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012387e:	mov    0x0(%rbp),%rbp
   140123882:	test   %rbp,%rbp
   140123885:	jne    14012379a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ba>
   14012388b:	mov    (%r15),%rax
   14012388e:	mov    0x1038(%rbx),%r14
   140123895:	mov    0x1048(%rbx),%rdx
   14012389c:	mov    0x150c0(%rbx),%r13
   1401238a3:	mov    %rax,0x38(%rsp)
   1401238a8:	add    %rax,%r14
   1401238ab:	mov    0x1060(%rbx),%rax
   1401238b2:	lea    (%rdx,%rax,8),%rsi
   1401238b6:	mov    0x1050(%rbx),%rax
   1401238bd:	mov    %rax,0x30(%rsp)
   1401238c2:	test   %r13,%r13
   1401238c5:	jne    140123968 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x388>
   1401238cb:	mov    0xb0(%r15),%rax
   1401238d2:	mov    $0x20,%edx
   1401238d7:	cmp    %rdx,%rax
   1401238da:	cmovb  %rdx,%rax
   1401238de:	cmpb   $0x0,0x2af79b(%rip)        # 1403d3080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   1401238e5:	mov    %rax,0x15268(%rbx)
   1401238ec:	je     140123994 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b4>
   1401238f2:	movabs $0xfffb000000000000,%rax
   1401238fc:	mov    %rax,0x1c8(%rsp)
   140123904:	mov    %rax,0x1d0(%rsp)
   14012390c:	cmpb   $0x0,0x1040(%rbx)
   140123913:	je     14012a300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d20>
   140123919:	movzbl (%r14),%eax
   14012391d:	lea    0x2af77c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123924:	lea    0x1(%r14),%rbp
   140123928:	xor    %r12d,%r12d
   14012392b:	mov    (%rdi,%rax,8),%rax
   14012392f:	jmp    *%rax
   140123931:	nopl   0x0(%rax)
   140123938:	mov    0x152c8(%rcx),%rsi
   14012393f:	movb   $0x1,0x1040(%rcx)
   140123946:	test   %rsi,%rsi
   140123949:	jne    140123689 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9>
   14012394f:	mov    0x58(%r15),%rbp
   140123953:	test   %rbp,%rbp
   140123956:	jne    14012378c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ac>
   14012395c:	jmp    14012388b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab>
   140123961:	nopl   0x0(%rax)
   140123968:	lea    0x0(%r13,%r13,4),%rax
   14012396d:	mov    0x10a0(%rbx,%rax,8),%r13
   140123975:	mov    0x10b0(%rbx,%rax,8),%rdi
   14012397d:	add    %r13,%rdi
   140123980:	cmpb   $0x0,0x2af6f9(%rip)        # 1403d3080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140123987:	mov    %rdi,0x15268(%rbx)
   14012398e:	jne    1401238f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x312>
   140123994:	lea    0x6721(%rip),%rdi        # 14012a0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6adc>
   14012399b:	lea    0x6786(%rip),%rax        # 14012a128 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b48>
   1401239a2:	vmovq  %rdi,%xmm0
   1401239a7:	lea    0x662a(%rip),%rdi        # 140129fd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f8>
   1401239ae:	lea    0x17f6(%rip),%rdx        # 1401251ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1bcb>
   1401239b5:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401239bb:	vmovq  %rdi,%xmm1
   1401239c0:	lea    0x6683(%rip),%rax        # 14012a04a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a6a>
   1401239c7:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401239cd:	lea    0x41db(%rip),%rdi        # 140127baf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45cf>
   1401239d4:	lea    0x4213(%rip),%rax        # 140127bee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x460e>
   1401239db:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   1401239e1:	vmovq  %rdi,%xmm0
   1401239e6:	lea    0x67b1(%rip),%rdi        # 14012a19e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bbe>
   1401239ed:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401239f3:	vmovq  %rdi,%xmm1
   1401239f8:	lea    0x4171(%rip),%rax        # 140127b70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4590>
   1401239ff:	vmovdqu %ymm2,0x140(%rsp)
   140123a08:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123a0e:	lea    0x437c(%rip),%rdi        # 140127d91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47b1>
   140123a15:	lea    0x4408(%rip),%rax        # 140127e24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4844>
   140123a1c:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123a22:	vmovq  %rdi,%xmm0
   140123a27:	lea    0x41ff(%rip),%rdi        # 140127c2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x464d>
   140123a2e:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123a34:	vmovq  %rdi,%xmm1
   140123a39:	lea    0x4293(%rip),%rax        # 140127cd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46f3>
   140123a40:	vmovdqu %ymm2,0x120(%rsp)
   140123a49:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123a4f:	lea    0x45d6(%rip),%rdi        # 14012802c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a4c>
   140123a56:	lea    0x467f(%rip),%rax        # 1401280dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4afc>
   140123a5d:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123a63:	vmovq  %rdi,%xmm0
   140123a68:	lea    0x445d(%rip),%rdi        # 140127ecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48ec>
   140123a6f:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123a75:	vmovq  %rdi,%xmm1
   140123a7a:	lea    0x44fb(%rip),%rax        # 140127f7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x499c>
   140123a81:	vmovdqu %ymm2,0x100(%rsp)
   140123a8a:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123a90:	lea    0x4d0e(%rip),%rdi        # 1401287a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51c5>
   140123a97:	lea    0x3cc1(%rip),%rax        # 14012775f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x417f>
   140123a9e:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123aa4:	vmovq  %rdi,%xmm0
   140123aa9:	lea    0x4787(%rip),%rdi        # 140128237 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c57>
   140123ab0:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ab6:	vmovq  %rdi,%xmm1
   140123abb:	lea    0x48d0(%rip),%rax        # 140128392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4db2>
   140123ac2:	vmovdqu %ymm2,0xe0(%rsp)
   140123acb:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123ad1:	lea    0x3fcf(%rip),%rdi        # 140127aa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44c7>
   140123ad8:	lea    0x400b(%rip),%rax        # 140127aea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x450a>
   140123adf:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123ae5:	vmovq  %rdi,%xmm0
   140123aea:	lea    0x399a(%rip),%rdi        # 14012748b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3eab>
   140123af1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123af7:	vmovq  %rdi,%xmm1
   140123afc:	lea    0x3f62(%rip),%rax        # 140127a65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4485>
   140123b03:	vmovdqu %ymm2,0xc0(%rsp)
   140123b0c:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123b12:	lea    0x3a4e(%rip),%rdi        # 140127567 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f87>
   140123b19:	lea    0x3afc(%rip),%rax        # 14012761c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x403c>
   140123b20:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123b26:	vmovq  %rdi,%xmm0
   140123b2b:	lea    0x3ffb(%rip),%rdi        # 140127b2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x454d>
   140123b32:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123b38:	vmovq  %rdi,%xmm1
   140123b3d:	lea    0x39bc(%rip),%rax        # 140127500 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f20>
   140123b44:	vmovdqu %ymm2,0xa0(%rsp)
   140123b4d:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123b53:	lea    0x4995(%rip),%rdi        # 1401284ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f0f>
   140123b5a:	lea    0x4ae9(%rip),%rax        # 14012864a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x506a>
   140123b61:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123b67:	vmovq  %rdi,%xmm0
   140123b6c:	lea    0x762(%rip),%rdi        # 1401242d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf5>
   140123b73:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123b79:	vmovq  %rdi,%xmm1
   140123b7e:	lea    0x4ebc(%rip),%rax        # 140128a41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5461>
   140123b85:	vmovdqu %ymm2,0x80(%rsp)
   140123b8e:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123b94:	lea    0x630f(%rip),%rdi        # 140129eaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68ca>
   140123b9b:	lea    0x5bde(%rip),%rax        # 140129780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61a0>
   140123ba2:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123ba8:	vmovq  %rdi,%xmm0
   140123bad:	lea    0x5a1c(%rip),%rdi        # 1401295d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ff0>
   140123bb4:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123bba:	vmovq  %rdi,%xmm1
   140123bbf:	lea    0x5ae2(%rip),%rax        # 1401296a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60c8>
   140123bc6:	vmovdqu %ymm2,0x60(%rsp)
   140123bcc:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123bd2:	lea    0x613b(%rip),%rdi        # 140129d14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6734>
   140123bd9:	lea    0x5d50(%rip),%rax        # 140129930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6350>
   140123be0:	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   140123be6:	vmovq  %rdi,%xmm0
   140123beb:	lea    0x5c66(%rip),%rdi        # 140129858 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6278>
   140123bf2:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123bf8:	vmovq  %rdi,%xmm2
   140123bfd:	lea    0x6344(%rip),%rax        # 140129f48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6968>
   140123c04:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123c0a:	lea    0x5f53(%rip),%rdi        # 140129b64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6584>
   140123c11:	lea    0x6024(%rip),%rax        # 140129c3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x665c>
   140123c18:	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   140123c1e:	vmovq  %rdi,%xmm0
   140123c23:	lea    0x5dde(%rip),%rdi        # 140129a08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6428>
   140123c2a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123c30:	vmovdqu %ymm2,0x40(%rsp)
   140123c36:	lea    0x5e55(%rip),%rax        # 140129a92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64b2>
   140123c3d:	vmovq  %rdi,%xmm2
   140123c42:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123c48:	lea    0x2300(%rip),%rdi        # 140125f4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x296f>
   140123c4f:	lea    0x510a(%rip),%rax        # 140128d60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5780>
   140123c56:	vinserti128 $0x1,%xmm0,%ymm2,%ymm14
   140123c5c:	vmovq  %rdi,%xmm0
   140123c61:	lea    0x2137(%rip),%rdi        # 140125d9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27bf>
   140123c68:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123c6e:	vmovq  %rdi,%xmm4
   140123c73:	lea    0x21fd(%rip),%rax        # 140125e77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2897>
   140123c7a:	vpinsrq $0x1,%rax,%xmm4,%xmm4
   140123c80:	lea    0x5361(%rip),%rdi        # 140128fe8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a08>
   140123c87:	lea    0x5432(%rip),%rax        # 1401290c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ae0>
   140123c8e:	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   140123c94:	vmovq  %rdi,%xmm0
   140123c99:	lea    0x5198(%rip),%rdi        # 140128e38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5858>
   140123ca0:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ca6:	vmovq  %rdi,%xmm3
   140123cab:	lea    0x525e(%rip),%rax        # 140128f10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5930>
   140123cb2:	vpinsrq $0x1,%rax,%xmm3,%xmm3
   140123cb8:	lea    0x5689(%rip),%rdi        # 140129348 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d68>
   140123cbf:	lea    0x575a(%rip),%rax        # 140129420 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e40>
   140123cc6:	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   140123ccc:	vmovq  %rdi,%xmm0
   140123cd1:	lea    0x54c0(%rip),%rdi        # 140129198 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bb8>
   140123cd8:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123cde:	vmovq  %rdi,%xmm2
   140123ce3:	lea    0x5586(%rip),%rax        # 140129270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c90>
   140123cea:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123cf0:	lea    0x1ac0(%rip),%rdi        # 1401257b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21d7>
   140123cf7:	lea    0x1b91(%rip),%rax        # 14012588f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22af>
   140123cfe:	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   140123d04:	vmovq  %rdi,%xmm0
   140123d09:	lea    0x18f7(%rip),%rdi        # 140125607 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2027>
   140123d10:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d16:	vmovq  %rdi,%xmm5
   140123d1b:	lea    0x19bd(%rip),%rax        # 1401256df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ff>
   140123d22:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140123d28:	lea    0x1de8(%rip),%rdi        # 140125b17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2537>
   140123d2f:	lea    0x1eb9(%rip),%rax        # 140125bef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x260f>
   140123d36:	vinserti128 $0x1,%xmm0,%ymm5,%ymm15
   140123d3c:	vmovq  %rdi,%xmm0
   140123d41:	lea    0x1c1f(%rip),%rdi        # 140125967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2387>
   140123d48:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d4e:	vmovq  %rdi,%xmm5
   140123d53:	lea    0x1ce5(%rip),%rax        # 140125a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x245f>
   140123d5a:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140123d60:	lea    0x15f4(%rip),%rdi        # 14012535b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d7b>
   140123d67:	lea    0x16c5(%rip),%rax        # 140125433 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e53>
   140123d6e:	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   140123d74:	vmovq  %rdi,%xmm0
   140123d79:	lea    0xc7f(%rip),%rdi        # 1401249ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141f>
   140123d80:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123d86:	lea    0x14f6(%rip),%rax        # 140125283 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ca3>
   140123d8d:	vmovq  %rdx,%xmm0
   140123d92:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d98:	lea    0x8b9(%rip),%rdx        # 140124658 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1078>
   140123d9f:	lea    0xd50(%rip),%rax        # 140124af6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1516>
   140123da6:	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   140123dac:	vmovq  %rdi,%xmm0
   140123db1:	lea    0x2c85(%rip),%rdi        # 140126a3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x345d>
   140123db8:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123dbe:	lea    0xb71(%rip),%rax        # 140124936 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1356>
   140123dc5:	vmovq  %rdx,%xmm0
   140123dca:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123dd0:	lea    0x2972(%rip),%rdx        # 140126749 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3169>
   140123dd7:	lea    0x2dd4(%rip),%rax        # 140126bb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35d2>
   140123dde:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140123de4:	vmovq  %rdi,%xmm0
   140123de9:	lea    0x2237(%rip),%rdi        # 140126027 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a47>
   140123df0:	vmovdqu %ymm6,0x180(%rsp)
   140123df9:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123dff:	lea    0x2aba(%rip),%rax        # 1401268c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32e0>
   140123e06:	vmovq  %rdx,%xmm0
   140123e0b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e11:	lea    0x3324(%rip),%rdx        # 14012713c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b5c>
   140123e18:	lea    0x22b4(%rip),%rax        # 1401260d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2af3>
   140123e1f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   140123e25:	vmovq  %rdi,%xmm0
   140123e2a:	lea    0x101a(%rip),%rdi        # 140124e4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x186b>
   140123e31:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123e37:	lea    0x33aa(%rip),%rax        # 1401271e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c08>
   140123e3e:	vmovq  %rdx,%xmm0
   140123e43:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e49:	lea    0x24b3(%rip),%rdx        # 140126303 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d23>
   140123e50:	lea    0x2698(%rip),%rax        # 1401264ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f0f>
   140123e57:	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   140123e5d:	vmovq  %rdi,%xmm0
   140123e62:	lea    0x24e2(%rip),%rdi        # 14012634b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d6b>
   140123e69:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123e6f:	lea    0xefd(%rip),%rax        # 140124d73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1793>
   140123e76:	vmovq  %rdx,%xmm0
   140123e7b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e81:	lea    0x2794(%rip),%rdx        # 14012661c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x303c>
   140123e88:	lea    0x2548(%rip),%rax        # 1401263d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2df7>
   140123e8f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   140123e95:	vmovq  %rdi,%xmm0
   140123e9a:	lea    0x319d(%rip),%rdi        # 14012703e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a5e>
   140123ea1:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123ea7:	lea    0x25b5(%rip),%rax        # 140126463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e83>
   140123eae:	vmovq  %rdx,%xmm0
   140123eb3:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123eb9:	lea    0x306d(%rip),%rdx        # 140126f2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x394d>
   140123ec0:	lea    0x320f(%rip),%rax        # 1401270d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3af6>
   140123ec7:	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   140123ecd:	vmovq  %rdi,%xmm0
   140123ed2:	lea    0x33bb(%rip),%rdi        # 140127294 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cb4>
   140123ed9:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123edf:	lea    0x30e2(%rip),%rax        # 140126fc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39e8>
   140123ee6:	vmovq  %rdx,%xmm0
   140123eeb:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ef1:	lea    0x5ba(%rip),%rdx        # 1401244b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed2>
   140123ef8:	lea    0x495b(%rip),%rax        # 14012885a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x527a>
   140123eff:	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   140123f05:	vmovq  %rdi,%xmm0
   140123f0a:	lea    0x4a1a(%rip),%rdi        # 14012892b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x534b>
   140123f11:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123f17:	lea    0x323(%rip),%rax        # 140124241 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc61>
   140123f1e:	vmovq  %rdx,%xmm0
   140123f23:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f29:	lea    0x4a84(%rip),%rdx        # 1401289b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53d4>
   140123f30:	lea    0x2f65(%rip),%rax        # 140126e9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38bc>
   140123f37:	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   140123f3d:	vmovq  %rdx,%xmm6
   140123f42:	vmovq  %rdi,%xmm0
   140123f47:	vpinsrq $0x1,%rax,%xmm6,%xmm6
   140123f4d:	lea    0xd47(%rip),%rax        # 140124c9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16bb>
   140123f54:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f5a:	lea    0x4d60(%rip),%rax        # 140128cc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x56e1>
   140123f61:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140123f67:	vmovq  %rax,%xmm0
   140123f6c:	lea    0x2af12d(%rip),%rax        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123f73:	vmovdqu %ymm6,0x160(%rsp)
   140123f7c:	vpbroadcastq %xmm0,%ymm0
   140123f81:	lea    0x800(%rax),%rdx
   140123f88:	xchg   %ax,%ax
   140123f8a:	data16 cs nopw 0x0(%rax,%rax,1)
   140123f95:	data16 cs nopw 0x0(%rax,%rax,1)
   140123fa0:	vmovdqa %ymm0,(%rax)
   140123fa4:	add    $0x40,%rax
   140123fa8:	vmovdqa %ymm0,-0x20(%rax)
   140123fad:	cmp    %rdx,%rax
   140123fb0:	jne    140123fa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c0>
   140123fb2:	lea    0x2f12(%rip),%rax        # 140126ecb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38eb>
   140123fb9:	lea    0x219f(%rip),%rdi        # 14012615f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b7f>
   140123fc0:	vmovdqu 0x160(%rsp),%ymm6
   140123fc9:	vmovdqa %ymm4,0x2af54f(%rip)        # 1403d3520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   140123fd1:	mov    %rax,0x2af108(%rip)        # 1403d30e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140123fd8:	vmovq  %rdi,%xmm0
   140123fdd:	lea    0x2207(%rip),%rax        # 1401261eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c0b>
   140123fe4:	lea    0x2d3c(%rip),%rdi        # 140126d27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3747>
   140123feb:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ff1:	lea    0x227f(%rip),%rax        # 140126277 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c97>
   140123ff8:	vmovdqu 0x40(%rsp),%ymm4
   140123ffe:	vmovdqa %ymm6,0x2af0ba(%rip)        # 1403d30c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   140124006:	vmovdqu 0x180(%rsp),%ymm6
   14012400f:	mov    %rax,0x2af1fa(%rip)        # 1403d3210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   140124016:	lea    0x32f9(%rip),%rax        # 140127316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d36>
   14012401d:	vmovdqa %xmm0,0x2af1db(%rip)        # 1403d3200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   140124025:	vmovq  %rdi,%xmm0
   14012402a:	lea    0xef2(%rip),%rdi        # 140124f23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1943>
   140124031:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124037:	lea    0xfbd(%rip),%rax        # 140124ffb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a1b>
   14012403e:	vmovdqa %ymm3,0x2af4fa(%rip)        # 1403d3540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   140124046:	vmovdqa %xmm0,0x2af1f2(%rip)        # 1403d3240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   14012404e:	vmovq  %rdi,%xmm0
   140124053:	lea    0x47a(%rip),%rdi        # 1401244d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef4>
   14012405a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124060:	lea    0x106c(%rip),%rax        # 1401250d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1af3>
   140124067:	vmovdqa %ymm2,0x2af4f1(%rip)        # 1403d3560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   14012406f:	mov    %rax,0x2af23a(%rip)        # 1403d32b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   140124076:	lea    0x48e(%rip),%rax        # 14012450b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2b>
   14012407d:	vmovdqa %xmm0,0x2af21b(%rip)        # 1403d32a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   140124085:	vmovq  %rdi,%xmm0
   14012408a:	lea    0x3748(%rip),%rdi        # 1401277d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41f9>
   140124091:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124097:	lea    0x4db(%rip),%rax        # 140124579 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf99>
   14012409e:	vmovdqa %ymm4,0x2af51a(%rip)        # 1403d35c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   1401240a6:	mov    %rax,0x2af283(%rip)        # 1403d3330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   1401240ad:	lea    0xb52(%rip),%rax        # 140124c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1626>
   1401240b4:	mov    %rax,0x2af305(%rip)        # 1403d33c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x320>
   1401240bb:	lea    0x1449(%rip),%rax        # 14012550b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f2b>
   1401240c2:	mov    %rax,0x2af7cf(%rip)        # 1403d3898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   1401240c9:	lea    0x1bf7(%rip),%rax        # 140125cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26e7>
   1401240d0:	mov    %rax,0x2af409(%rip)        # 1403d34e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   1401240d7:	lea    0x541a(%rip),%rax        # 1401294f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f18>
   1401240de:	mov    %rax,0x2af49b(%rip)        # 1403d3580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   1401240e5:	lea    0x3830(%rip),%rax        # 14012791c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x433c>
   1401240ec:	vmovdqa %xmm0,0x2af22c(%rip)        # 1403d3320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   1401240f4:	vmovq  %rdi,%xmm0
   1401240f9:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401240ff:	vmovdqa %ymm7,0x2aef99(%rip)        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124107:	lea    0x38e4(%rip),%rax        # 1401279f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4412>
   14012410e:	vmovdqa %ymm11,0x2af00a(%rip)        # 1403d3120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   140124116:	vmovdqa %ymm9,0x2af082(%rip)        # 1403d31a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   14012411e:	vmovdqa %ymm8,0x2af09a(%rip)        # 1403d31c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   140124126:	vmovdqa %ymm12,0x2af0b2(%rip)        # 1403d31e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   14012412e:	vmovdqa %ymm10,0x2af0ea(%rip)        # 1403d3220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   140124136:	vmovdqa %ymm6,0x2af262(%rip)        # 1403d33a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   14012413e:	vmovdqa %ymm13,0x2af2da(%rip)        # 1403d3420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   140124146:	vmovdqa %ymm15,0x2af352(%rip)        # 1403d34a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   14012414e:	vmovdqa %ymm5,0x2af36a(%rip)        # 1403d34c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   140124156:	vmovdqa %ymm1,0x2af442(%rip)        # 1403d35a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   14012415e:	vmovdqa %ymm14,0x2af47a(%rip)        # 1403d35e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   140124166:	vmovdqa %xmm0,0x2af5b2(%rip)        # 1403d3720 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x680>
   14012416e:	vmovdqu 0x140(%rsp),%ymm3
   140124177:	vmovdqu 0x120(%rsp),%ymm4
   140124180:	vmovdqu 0x100(%rsp),%ymm2
   140124189:	mov    %rax,0x2af5a0(%rip)        # 1403d3730 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x690>
   140124190:	vmovdqa %ymm3,0x2af488(%rip)        # 1403d3620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   140124198:	vmovdqu 0xe0(%rsp),%ymm3
   1401241a1:	vmovdqa %ymm4,0x2af497(%rip)        # 1403d3640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   1401241a9:	vmovdqu 0xc0(%rsp),%ymm4
   1401241b2:	vmovdqa %ymm2,0x2af4a6(%rip)        # 1403d3660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   1401241ba:	vmovdqu 0xa0(%rsp),%ymm2
   1401241c3:	vmovdqa %ymm3,0x2af4b5(%rip)        # 1403d3680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   1401241cb:	vmovdqu 0x80(%rsp),%ymm3
   1401241d4:	vmovdqa %ymm4,0x2af4c4(%rip)        # 1403d36a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   1401241dc:	vmovdqu 0x60(%rsp),%ymm4
   1401241e2:	movb   $0x1,0x2aee97(%rip)        # 1403d3080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   1401241e9:	vmovdqa %ymm2,0x2af4cf(%rip)        # 1403d36c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   1401241f1:	vmovdqa %ymm3,0x2af4e7(%rip)        # 1403d36e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   1401241f9:	vmovdqa %ymm4,0x2af4ff(%rip)        # 1403d3700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140124201:	jmp    1401238f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x312>
   140124206:	cs nopw 0x0(%rax,%rax,1)
   140124210:	lea    0x1000(%rbx),%rcx
   140124217:	mov    %r12,%rdx
   14012421a:	call   140331dc0 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14012421f:	jmp    140123832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x252>
   140124224:	nopl   0x0(%rax)
   140124228:	mov    0xf0(%rsi),%rax
   14012422f:	cmp    %rax,0xf8(%rsi)
   140124236:	jne    14012370e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e>
   14012423c:	jmp    1401236aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca>
   140124241:	mov    0x0(%rbp),%rdi
   140124245:	lea    0x8(%rbp),%r14
   140124249:	test   %r12b,%r12b
   14012424c:	je     14012aa36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7456>
   140124252:	cmp    $0x1,%r12b
   140124256:	je     14012f8c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2e0>
   14012425c:	lea    0x8(%rsi),%r8
   140124260:	cmp    0x30(%rsp),%r8
   140124265:	jae    140132865 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf285>
   14012426b:	vzeroupper
   14012426e:	mov    0x1d0(%rsp),%rax
   140124276:	lea    0x680(%rsp),%rcx
   14012427e:	mov    %rdi,%rdx
   140124281:	mov    %r8,0x40(%rsp)
   140124286:	mov    %rax,(%rsi)
   140124289:	mov    0x1c8(%rsp),%rax
   140124291:	mov    %rax,0x1d0(%rsp)
   140124299:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012429e:	mov    0x680(%rsp),%rax
   1401242a6:	mov    0x40(%rsp),%rsi
   1401242ab:	mov    %rax,0x1c8(%rsp)
   1401242b3:	cmpb   $0x0,0x1040(%rbx)
   1401242ba:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   1401242c0:	movzbl 0x8(%rbp),%eax
   1401242c4:	lea    0x2aedd5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242cb:	add    $0x9,%rbp
   1401242cf:	mov    (%rdi,%rax,8),%rax
   1401242d3:	jmp    *%rax
   1401242d5:	movzwl 0x6(%rbp),%edx
   1401242d9:	movzwl 0x0(%rbp),%r9d
   1401242de:	lea    0x8(%rbp),%r14
   1401242e2:	movzwl 0x2(%rbp),%r8d
   1401242e7:	movzwl 0x4(%rbp),%eax
   1401242eb:	lea    (%rdx,%r13,1),%rdi
   1401242ef:	cmp    0x15268(%rbx),%rdi
   1401242f6:	jae    140131165 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb85>
   1401242fc:	mov    0x1070(%rbx),%rdx
   140124303:	sub    0x1068(%rbx),%rdx
   14012430a:	sar    $0x3,%rdx
   14012430e:	vzeroupper
   140124311:	cmp    %rdx,%rdi
   140124314:	jae    140130c68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd688>
   14012431a:	mov    0x1068(%rbx),%rcx
   140124321:	movzwl %r9w,%edx
   140124325:	movzwl %r8w,%r8d
   140124329:	movzwl %ax,%eax
   14012432c:	add    %r13,%rdx
   14012432f:	add    %r13,%r8
   140124332:	lea    (%rcx,%rdx,8),%rdx
   140124336:	lea    (%rcx,%r8,8),%r9
   14012433a:	add    %r13,%rax
   14012433d:	lea    (%rcx,%rax,8),%r10
   140124341:	mov    (%rdx),%rax
   140124344:	movabs $0xfff7ffffffffffff,%rcx
   14012434e:	cmp    %rax,%rcx
   140124351:	jae    140124430 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe50>
   140124357:	movabs $0xfffc000000000000,%rcx
   140124361:	cmp    %rcx,%rax
   140124364:	je     140124430 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe50>
   14012436a:	movabs $0xffffffff00000000,%rcx
   140124374:	and    %rcx,%rax
   140124377:	movabs $0xfffd000100000000,%rcx
   140124381:	cmp    %rcx,%rax
   140124384:	je     1401317a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1c4>
   14012438a:	movabs $0xffffffff00000000,%rax
   140124394:	mov    (%r9),%rcx
   140124397:	movabs $0xfffd000100000000,%r8
   1401243a1:	and    %rax,%rcx
   1401243a4:	cmp    %r8,%rcx
   1401243a7:	je     1401317a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1c4>
   1401243ad:	and    (%r10),%rax
   1401243b0:	cmp    %r8,%rax
   1401243b3:	je     1401317a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1c4>
   1401243b9:	mov    %r10,%rcx
   1401243bc:	mov    %r9,0x60(%rsp)
   1401243c1:	mov    %rdx,0x40(%rsp)
   1401243c6:	call   14022b550 <setun::VMValue::as_float() const>
   1401243cb:	mov    0x60(%rsp),%rcx
   1401243d0:	vmovapd %xmm0,%xmm6
   1401243d4:	call   14022b550 <setun::VMValue::as_float() const>
   1401243d9:	mov    0x40(%rsp),%rcx
   1401243de:	vmovapd %xmm0,%xmm7
   1401243e2:	call   14022b550 <setun::VMValue::as_float() const>
   1401243e7:	vfmadd132sd %xmm7,%xmm6,%xmm0
   1401243ec:	vucomisd %xmm0,%xmm0
   1401243f0:	vmovq  %xmm0,%rcx
   1401243f5:	movabs $0xfffc000000000000,%rax
   1401243ff:	mov    0x1068(%rbx),%rdx
   140124406:	cmovnp %rcx,%rax
   14012440a:	mov    %rax,(%rdx,%rdi,8)
   14012440e:	cmpb   $0x0,0x1040(%rbx)
   140124415:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012441b:	movzbl 0x8(%rbp),%eax
   14012441f:	lea    0x2aec7a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124426:	add    $0x9,%rbp
   14012442a:	mov    (%rdi,%rax,8),%rax
   14012442e:	jmp    *%rax
   140124430:	movabs $0xfff7ffffffffffff,%rax
   14012443a:	mov    (%r9),%rcx
   14012443d:	cmp    %rcx,%rax
   140124440:	jae    140124455 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe75>
   140124442:	movabs $0xfffc000000000000,%rax
   14012444c:	cmp    %rax,%rcx
   14012444f:	jne    14012438a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaa>
   140124455:	movabs $0xfff7ffffffffffff,%rax
   14012445f:	mov    (%r10),%rcx
   140124462:	cmp    %rcx,%rax
   140124465:	jae    14012447a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9a>
   140124467:	movabs $0xfffc000000000000,%rax
   140124471:	cmp    %rax,%rcx
   140124474:	jne    14012438a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaa>
   14012447a:	mov    %r10,%rcx
   14012447d:	mov    %r9,0x60(%rsp)
   140124482:	mov    %rdx,0x40(%rsp)
   140124487:	call   14022b550 <setun::VMValue::as_float() const>
   14012448c:	mov    0x60(%rsp),%rcx
   140124491:	vmovapd %xmm0,%xmm7
   140124495:	call   14022b550 <setun::VMValue::as_float() const>
   14012449a:	mov    0x40(%rsp),%rcx
   14012449f:	vmovapd %xmm0,%xmm6
   1401244a3:	call   14022b550 <setun::VMValue::as_float() const>
   1401244a8:	vfmadd132sd %xmm6,%xmm7,%xmm0
   1401244ad:	jmp    1401243ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0c>
   1401244b2:	cmpb   $0x0,0x1040(%rbx)
   1401244b9:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   1401244bf:	movzbl 0x0(%rbp),%eax
   1401244c3:	lea    0x2aebd6(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401244ca:	add    $0x1,%rbp
   1401244ce:	mov    (%rdi,%rax,8),%rax
   1401244d2:	jmp    *%rax
   1401244d4:	movzwl 0x0(%rbp),%r14d
   1401244d9:	test   %r14w,%r14w
   1401244dd:	js     1401312d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcf0>
   1401244e3:	movzwl %r14w,%eax
   1401244e7:	lea    0x2(%rbp,%rax,1),%r14
   1401244ec:	cmpb   $0x0,0x1040(%rbx)
   1401244f3:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   1401244f9:	movzbl (%r14),%eax
   1401244fd:	lea    0x2aeb9c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124504:	lea    0x1(%r14),%rbp
   140124508:	jmp    *(%rdi,%rax,8)
   14012450b:	movabs $0xfffb000000000000,%rax
   140124515:	movzwl 0x0(%rbp),%edi
   140124519:	lea    0x2(%rbp),%r14
   14012451d:	mov    %rax,0x2f8(%rsp)
   140124525:	cmp    $0x1,%r12b
   140124529:	jne    14012a82a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x724a>
   14012452f:	mov    0x1c8(%rsp),%rax
   140124537:	lea    0x2f8(%rsp),%rcx
   14012453f:	mov    %rax,0x2f8(%rsp)
   140124547:	vzeroupper
   14012454a:	call   14022a280 <setun::VMValue::as_bool() const>
   14012454f:	xor    %r12d,%r12d
   140124552:	test   %al,%al
   140124554:	je     14012a85c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x727c>
   14012455a:	cmpb   $0x0,0x1040(%rbx)
   140124561:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140124567:	movzbl (%r14),%eax
   14012456b:	lea    0x2aeb2e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124572:	lea    0x1(%r14),%rbp
   140124576:	jmp    *(%rdi,%rax,8)
   140124579:	movzwl 0x4(%rbp),%eax
   14012457d:	movzwl 0x0(%rbp),%edi
   140124581:	add    $0x6,%rbp
   140124585:	movzwl -0x4(%rbp),%r14d
   14012458a:	mov    %ax,0x40(%rsp)
   14012458f:	movabs $0xfffb000000000000,%rax
   140124599:	mov    %rax,0x300(%rsp)
   1401245a1:	cmp    $0x1,%r12b
   1401245a5:	jne    14012c2be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cde>
   1401245ab:	mov    0x1c8(%rsp),%rdx
   1401245b3:	xor    %r12d,%r12d
   1401245b6:	movabs $0xffff000000000000,%rax
   1401245c0:	movabs $0xfffd000000000000,%rcx
   1401245ca:	and    %rdx,%rax
   1401245cd:	mov    %rdx,0x300(%rsp)
   1401245d5:	cmp    %rcx,%rax
   1401245d8:	je     14012c300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d20>
   1401245de:	movabs $0xfff7ffffffffffff,%rax
   1401245e8:	cmp    %rdx,%rax
   1401245eb:	jae    140124600 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1020>
   1401245ed:	movabs $0xfffc000000000000,%rax
   1401245f7:	cmp    %rax,%rdx
   1401245fa:	jne    14012c30e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d2e>
   140124600:	lea    0x300(%rsp),%rcx
   140124608:	vzeroupper
   14012460b:	call   14022b550 <setun::VMValue::as_float() const>
   140124610:	vmovsd 0x24a5a8(%rip),%xmm1        # 14036ebc0 <CSWTCH.3092+0x200>
   140124618:	vcomisd %xmm0,%xmm1
   14012461c:	ja     14012d6e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa103>
   140124622:	vcomisd 0x24a59e(%rip),%xmm0        # 14036ebc8 <CSWTCH.3092+0x208>
   14012462a:	ja     14012c32d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d4d>
   140124630:	movswq %r14w,%rax
   140124634:	lea    -0x2(%rbp,%rax,1),%r14
   140124639:	cmpb   $0x0,0x1040(%rbx)
   140124640:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140124646:	movzbl (%r14),%eax
   14012464a:	lea    0x2aea4f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124651:	lea    0x1(%r14),%rbp
   140124655:	jmp    *(%rdi,%rax,8)
   140124658:	movzwl 0x0(%rbp),%eax
   14012465c:	mov    0x88(%r15),%rdx
   140124663:	lea    0x2(%rbp),%r14
   140124667:	mov    0x80(%r15),%rcx
   14012466e:	movzwl %ax,%edi
   140124671:	cmp    %rdx,%rcx
   140124674:	je     140124689 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a9>
   140124676:	sub    %rcx,%rdx
   140124679:	sar    $0x2,%rdx
   14012467d:	cmp    %rdx,%rax
   140124680:	jae    140132237 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec57>
   140124686:	mov    (%rcx,%rax,4),%edi
   140124689:	mov    0x98(%r15),%rcx
   140124690:	mov    0xa0(%r15),%rdx
   140124697:	mov    %edi,0x60(%rsp)
   14012469b:	lea    0x3(%rbp),%r14
   14012469f:	movzbl 0x2(%rbp),%edi
   1401246a3:	mov    $0x20,%r8d
   1401246a9:	sub    %rcx,%rdx
   1401246ac:	sar    $1,%rdx
   1401246af:	mov    %dil,0x80(%rsp)
   1401246b7:	cmp    %rdx,%rax
   1401246ba:	jae    1401246c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e7>
   1401246bc:	movzwl (%rcx,%rax,2),%ecx
   1401246c0:	test   %cx,%cx
   1401246c3:	cmovne %rcx,%r8
   1401246c7:	lea    0x8(%rdi),%rdx
   1401246cb:	mov    %r8,%rcx
   1401246ce:	cmp    %r8,%rdx
   1401246d1:	cmovae %rdx,%rcx
   1401246d5:	mov    %rcx,0x40(%rsp)
   1401246da:	cmpb   $0x0,0x152c1(%rbx)
   1401246e1:	je     14012a63c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x705c>
   1401246e7:	mov    0x152d8(%rbx),%rdx
   1401246ee:	test   %rdx,%rdx
   1401246f1:	je     14012a63c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x705c>
   1401246f7:	and    0x152f8(%rbx),%rax
   1401246fe:	shl    $0x5,%rax
   140124702:	add    %rdx,%rax
   140124705:	mov    %rax,0xc0(%rsp)
   14012470d:	cmpq   $0x0,(%rax)
   140124711:	je     14012a557 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f77>
   140124717:	cmpb   $0x0,0x15211(%rbx)
   14012471e:	je     14012faab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4cb>
   140124724:	mov    0x15268(%rbx),%rax
   14012472b:	mov    0x1070(%rbx),%rdx
   140124732:	sub    0x1068(%rbx),%rdx
   140124739:	mov    %rax,0xa0(%rsp)
   140124741:	add    %rcx,%rax
   140124744:	sar    $0x3,%rdx
   140124748:	mov    %rax,0x15268(%rbx)
   14012474f:	add    $0x40,%rax
   140124753:	cmp    %rdx,%rax
   140124756:	jae    1401366b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130d6>
   14012475c:	vzeroupper
   14012475f:	movzbl 0x80(%rsp),%r11d
   140124768:	test   %r11b,%r11b
   14012476b:	je     140132035 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea55>
   140124771:	movzbl %r11b,%r8d
   140124775:	mov    0xa0(%rsp),%r10
   14012477d:	lea    -0x2(%rdi),%rcx
   140124781:	sub    $0x1,%r8d
   140124785:	sub    %r8,%rcx
   140124788:	lea    -0x1(%rdi,%r10,1),%rax
   14012478d:	add    %r10,%rcx
   140124790:	lea    0x0(,%rax,8),%rdx
   140124798:	shl    $0x3,%rcx
   14012479c:	cmp    $0x1,%r12b
   1401247a0:	je     14013394f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1036f>
   1401247a6:	cmp    $0x2,%r12b
   1401247aa:	jne    140132745 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf165>
   1401247b0:	mov    0x1c8(%rsp),%r9
   1401247b8:	mov    0x1068(%rbx),%r8
   1401247bf:	sub    $0x8,%rdx
   1401247c3:	mov    %r9,(%r8,%rax,8)
   1401247c7:	mov    0x1d0(%rsp),%rax
   1401247cf:	mov    %rax,0x1c8(%rsp)
   1401247d7:	cmp    %rcx,%rdx
   1401247da:	je     14013268a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0aa>
   1401247e0:	mov    0x1c8(%rsp),%rax
   1401247e8:	mov    %rax,(%r8,%rdx,1)
   1401247ec:	sub    $0x8,%rdx
   1401247f0:	cmp    %rcx,%rdx
   1401247f3:	je     14012480d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122d>
   1401247f5:	mov    %rsi,%rax
   1401247f8:	mov    -0x8(%rax),%rax
   1401247fc:	sub    $0x8,%rsi
   140124800:	mov    %rax,(%r8,%rdx,1)
   140124804:	sub    $0x8,%rdx
   140124808:	cmp    %rcx,%rdx
   14012480b:	jne    1401247f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1215>
   14012480d:	mov    0x1048(%rbx),%rdx
   140124814:	lea    0x7a0(%rsp),%r12
   14012481c:	xor    %eax,%eax
   14012481e:	mov    $0x23,%ecx
   140124823:	mov    %r12,%rdi
   140124826:	rep stos %rax,(%rdi)
   140124829:	mov    0xa0(%rsp),%rax
   140124831:	mov    %rdx,0x7c0(%rsp)
   140124839:	movb   $0x1,0x8a8(%rsp)
   140124841:	lea    (%r8,%rax,8),%rax
   140124845:	mov    %rbx,0x7a0(%rsp)
   14012484d:	mov    %rax,0x7b0(%rsp)
   140124855:	mov    0x40(%rsp),%rax
   14012485a:	mov    %rax,0x7b8(%rsp)
   140124862:	mov    %rsi,%rax
   140124865:	sub    %rdx,%rax
   140124868:	mov    0x150c0(%rbx),%rdx
   14012486f:	sar    $0x3,%rax
   140124873:	mov    %rax,0x7c8(%rsp)
   14012487b:	xor    %eax,%eax
   14012487d:	test   %rdx,%rdx
   140124880:	je     14012488e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ae>
   140124882:	lea    (%rdx,%rdx,4),%rax
   140124886:	lea    0x1098(%rbx,%rax,8),%rax
   14012488e:	vmovq  %rax,%xmm7
   140124893:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   14012489d:	mov    %r12,0x152b8(%rbx)
   1401248a4:	vmovdqa %xmm0,0x7d0(%rsp)
   1401248ad:	call   140221db0 <tersun::VMTelemetryManager::instance()>
   1401248b2:	cmpb   $0x0,(%rax)
   1401248b5:	je     1401248bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dc>
   1401248b7:	addq   $0x1,0x28(%rax)
   1401248bc:	mov    0xc0(%rsp),%rax
   1401248c4:	mov    %r12,%rdx
   1401248c7:	mov    %rbx,%rcx
   1401248ca:	call   *(%rax)
   1401248cc:	mov    0x7d8(%rsp),%rdx
   1401248d4:	mov    %rdx,0x152b8(%rbx)
   1401248db:	cmpq   $0x0,0x7e8(%rsp)
   1401248e4:	jg     140134802 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11222>
   1401248ea:	mov    %rax,0x1c8(%rsp)
   1401248f2:	cmpb   $0x0,0x15211(%rbx)
   1401248f9:	je     1401320c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeae8>
   1401248ff:	mov    0xa0(%rsp),%rax
   140124907:	mov    %rax,0x15268(%rbx)
   14012490e:	cmpb   $0x0,0x1040(%rbx)
   140124915:	je     14012a1e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c03>
   14012491b:	movzbl 0x3(%rbp),%eax
   14012491f:	mov    $0x1,%r12d
   140124925:	add    $0x4,%rbp
   140124929:	lea    0x2ae770(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124930:	mov    (%rdi,%rax,8),%rax
   140124934:	jmp    *%rax
   140124936:	mov    0x150c0(%rbx),%rax
   14012493d:	test   %rax,%rax
   140124940:	je     14012a255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c75>
   140124946:	lea    (%rax,%rax,4),%rdx
   14012494a:	sub    $0x1,%rax
   14012494e:	mov    0x1c8(%rsp),%rbp
   140124956:	lea    (%rbx,%rdx,8),%rdx
   14012495a:	mov    0x1098(%rdx),%r14
   140124961:	mov    0x10a0(%rdx),%rcx
   140124968:	mov    0x10a8(%rdx),%r13
   14012496f:	mov    %rax,0x150c0(%rbx)
   140124976:	test   %r12b,%r12b
   140124979:	jne    140124992 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b2>
   14012497b:	movabs $0xfffb000000000000,%rbp
   140124985:	cmp    %rsi,0x1048(%rbx)
   14012498c:	jae    140124992 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b2>
   14012498e:	mov    -0x8(%rsi),%rbp
   140124992:	cmpb   $0x0,0x15211(%rbx)
   140124999:	je     14012d5a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fc6>
   14012499f:	mov    %rcx,0x15268(%rbx)
   1401249a6:	mov    0x1048(%rbx),%rdx
   1401249ad:	mov    %rbp,0x1c8(%rsp)
   1401249b5:	lea    (%rdx,%r13,8),%rsi
   1401249b9:	mov    0x150c0(%rbx),%r13
   1401249c0:	test   %r13,%r13
   1401249c3:	je     1401249d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f2>
   1401249c5:	lea    -0x5(%r13,%r13,4),%rax
   1401249ca:	mov    0x10c8(%rbx,%rax,8),%r13
   1401249d2:	add    0x38(%rsp),%r14
   1401249d7:	cmpb   $0x0,0x1040(%rbx)
   1401249de:	je     14012db51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa571>
   1401249e4:	movzbl (%r14),%eax
   1401249e8:	lea    0x1(%r14),%rbp
   1401249ec:	lea    0x2ae6ad(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401249f3:	mov    $0x1,%r12d
   1401249f9:	mov    (%rdi,%rax,8),%rax
   1401249fd:	jmp    *%rax
   1401249ff:	movzwl 0x0(%rbp),%r14d
   140124a04:	movzbl 0x2(%rbp),%edi
   140124a08:	lea    0x3(%rbp),%r9
   140124a0c:	cmp    $0x2,%r12b
   140124a10:	je     14012b577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f97>
   140124a16:	cmp    $0x1,%r12b
   140124a1a:	je     14012e8be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2de>
   140124a20:	mov    0x15268(%rbx),%r13
   140124a27:	movzbl %dil,%ebp
   140124a2b:	mov    0x1070(%rbx),%rdx
   140124a32:	sub    0x1068(%rbx),%rdx
   140124a39:	lea    0x0(%rbp,%r13,1),%rax
   140124a3e:	sar    $0x3,%rdx
   140124a42:	mov    %rax,0x15268(%rbx)
   140124a49:	add    $0x40,%rax
   140124a4d:	cmp    %rdx,%rax
   140124a50:	jae    14012b5d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ff9>
   140124a56:	mov    0x1048(%rbx),%rdx
   140124a5d:	mov    %rsi,%r10
   140124a60:	mov    0x38(%rsp),%r11
   140124a65:	mov    0x150c0(%rbx),%rax
   140124a6c:	sub    %rdx,%r10
   140124a6f:	sub    %r11,%r9
   140124a72:	mov    %r10,%rdi
   140124a75:	sar    $0x3,%rdi
   140124a79:	cmp    $0x7ff,%rax
   140124a7f:	ja     140139a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b4>
   140124a85:	lea    0x1(%rax),%rcx
   140124a89:	lea    (%rax,%rax,4),%rax
   140124a8d:	mov    %rcx,0x150c0(%rbx)
   140124a94:	mov    0x15270(%rbx),%rcx
   140124a9b:	mov    %r9,0x10c0(%rbx,%rax,8)
   140124aa3:	mov    0x152a0(%rbx),%r9
   140124aaa:	mov    %r13,0x10c8(%rbx,%rax,8)
   140124ab2:	mov    %rdi,0x10d0(%rbx,%rax,8)
   140124aba:	mov    %rbp,0x10d8(%rbx,%rax,8)
   140124ac2:	mov    %r14,0x10e0(%rbx,%rax,8)
   140124aca:	cmp    %r9,0x68(%rcx)
   140124ace:	jae    14012f460 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe80>
   140124ad4:	add    %r11,%r14
   140124ad7:	cmpb   $0x0,0x1040(%rbx)
   140124ade:	je     14012f4a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbec8>
   140124ae4:	movzbl (%r14),%eax
   140124ae8:	lea    0x2ae5b1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124aef:	lea    0x1(%r14),%rbp
   140124af3:	jmp    *(%rdi,%rax,8)
   140124af6:	mov    0x15268(%rbx),%r13
   140124afd:	movzbl 0x2(%rbp),%eax
   140124b01:	lea    0x3(%rbp),%r14
   140124b05:	mov    0x1070(%rbx),%rdx
   140124b0c:	sub    0x1068(%rbx),%rdx
   140124b13:	lea    (%rax,%r13,1),%rcx
   140124b17:	movzwl 0x0(%rbp),%r10d
   140124b1c:	sar    $0x3,%rdx
   140124b20:	mov    %rcx,0x15268(%rbx)
   140124b27:	add    $0x40,%rcx
   140124b2b:	cmp    %rdx,%rcx
   140124b2e:	jae    14012c780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91a0>
   140124b34:	cmp    $0x1,%r12b
   140124b38:	je     14012c7b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91d0>
   140124b3e:	cmp    $0x2,%r12b
   140124b42:	je     14012eafb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb51b>
   140124b48:	mov    0x1068(%rbx),%rdx
   140124b4f:	mov    -0x8(%rsi),%r8
   140124b53:	lea    -0x8(%rsi),%rcx
   140124b57:	movzwl %r10w,%ebp
   140124b5b:	mov    %rcx,%r9
   140124b5e:	mov    0x150c0(%rbx),%r10
   140124b65:	sub    0x38(%rsp),%r14
   140124b6a:	mov    %r8,(%rdx,%r13,8)
   140124b6e:	mov    0x1048(%rbx),%rdx
   140124b75:	sub    %rdx,%r9
   140124b78:	mov    %r9,%rdi
   140124b7b:	sar    $0x3,%rdi
   140124b7f:	cmp    $0x7ff,%r10
   140124b86:	ja     140139a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b4>
   140124b8c:	mov    %rcx,%rsi
   140124b8f:	lea    0x1(%r10),%rcx
   140124b93:	mov    %rcx,0x150c0(%rbx)
   140124b9a:	lea    (%r10,%r10,4),%rcx
   140124b9e:	mov    %rax,0x10d8(%rbx,%rcx,8)
   140124ba6:	mov    0x152a0(%rbx),%rax
   140124bad:	mov    %r14,0x10c0(%rbx,%rcx,8)
   140124bb5:	mov    %r13,0x10c8(%rbx,%rcx,8)
   140124bbd:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   140124bc5:	mov    %rbp,0x10e0(%rbx,%rcx,8)
   140124bcd:	mov    0x15270(%rbx),%rcx
   140124bd4:	cmp    %rax,0x68(%rcx)
   140124bd8:	jae    140130d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd720>
   140124bde:	mov    0x38(%rsp),%rax
   140124be3:	lea    (%rax,%rbp,1),%r14
   140124be7:	cmpb   $0x0,0x1040(%rbx)
   140124bee:	je     14012f4a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbec8>
   140124bf4:	movzbl (%r14),%eax
   140124bf8:	lea    0x2ae4a1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124bff:	lea    0x1(%r14),%rbp
   140124c03:	jmp    *(%rdi,%rax,8)
   140124c06:	mov    0x150c0(%rbx),%rax
   140124c0d:	test   %rax,%rax
   140124c10:	je     14012a255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c75>
   140124c16:	lea    -0x1(%rax),%r13
   140124c1a:	test   %r12b,%r12b
   140124c1d:	jne    140124c2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b>
   140124c1f:	mov    -0x8(%rsi),%rdx
   140124c23:	mov    %rdx,0x1c8(%rsp)
   140124c2b:	lea    (%rax,%rax,4),%rax
   140124c2f:	lea    (%rbx,%rax,8),%rax
   140124c33:	mov    0x10a0(%rax),%rdx
   140124c3a:	mov    %rdx,0x15268(%rbx)
   140124c41:	mov    0x1048(%rbx),%rdx
   140124c48:	mov    0x10a8(%rax),%rcx
   140124c4f:	lea    (%rdx,%rcx,8),%rsi
   140124c53:	mov    0x1098(%rax),%rcx
   140124c5a:	mov    %r13,0x150c0(%rbx)
   140124c61:	test   %r13,%r13
   140124c64:	jne    14012a868 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7288>
   140124c6a:	mov    0x38(%rsp),%rax
   140124c6f:	lea    (%rax,%rcx,1),%r14
   140124c73:	cmpb   $0x0,0x1040(%rbx)
   140124c7a:	je     14012db51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa571>
   140124c80:	movzbl (%r14),%eax
   140124c84:	lea    0x1(%r14),%rbp
   140124c88:	lea    0x2ae411(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c8f:	mov    $0x1,%r12d
   140124c95:	mov    (%rdi,%rax,8),%rax
   140124c99:	jmp    *%rax
   140124c9b:	cmp    $0x2,%r12b
   140124c9f:	je     14012a960 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7380>
   140124ca5:	cmp    $0x1,%r12b
   140124ca9:	je     14012eca0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6c0>
   140124caf:	mov    0x1048(%rbx),%rdx
   140124cb6:	mov    0x1050(%rbx),%rax
   140124cbd:	sub    0x38(%rsp),%rbp
   140124cc2:	sub    %rdx,%rsi
   140124cc5:	sub    %rdx,%rax
   140124cc8:	mov    %rbp,0x1038(%rbx)
   140124ccf:	mov    %rsi,%rdi
   140124cd2:	sar    $0x3,%rdi
   140124cd6:	cmp    %rsi,%rax
   140124cd9:	jb     14012f7f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc215>
   140124cdf:	vzeroupper
   140124ce2:	vmovdqa 0x249e96(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140124cea:	mov    %rdi,0x1060(%rbx)
   140124cf1:	mov    %r15,%rdx
   140124cf4:	mov    %rbx,%rcx
   140124cf7:	movb   $0x0,0x153a0(%rbx)
   140124cfe:	vmovdqa %xmm0,0x15390(%rbx)
   140124d06:	call   1401116b0 <setun::VM::handle_push_string(setun::Chunk const&)>
   140124d0b:	mov    0x1060(%rbx),%rax
   140124d12:	mov    0x1048(%rbx),%rdx
   140124d19:	mov    0x150c0(%rbx),%r13
   140124d20:	mov    0x38(%rsp),%r14
   140124d25:	lea    (%rdx,%rax,8),%rsi
   140124d29:	mov    0x1050(%rbx),%rax
   140124d30:	add    0x1038(%rbx),%r14
   140124d37:	mov    %rax,0x30(%rsp)
   140124d3c:	test   %r13,%r13
   140124d3f:	je     140124d4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x176e>
   140124d41:	lea    -0x5(%r13,%r13,4),%rcx
   140124d46:	mov    0x10c8(%rbx,%rcx,8),%r13
   140124d4e:	cmpb   $0x0,0x1040(%rbx)
   140124d55:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140124d5b:	movzbl (%r14),%eax
   140124d5f:	lea    0x2ae33a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d66:	lea    0x1(%r14),%rbp
   140124d6a:	xor    %r12d,%r12d
   140124d6d:	mov    (%rdi,%rax,8),%rax
   140124d71:	jmp    *%rax
   140124d73:	cmp    $0x2,%r12b
   140124d77:	je     14012abe2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7602>
   140124d7d:	cmp    $0x1,%r12b
   140124d81:	je     14012ee50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb870>
   140124d87:	mov    0x1048(%rbx),%rdx
   140124d8e:	mov    0x1050(%rbx),%rax
   140124d95:	sub    0x38(%rsp),%rbp
   140124d9a:	sub    %rdx,%rsi
   140124d9d:	sub    %rdx,%rax
   140124da0:	mov    %rbp,0x1038(%rbx)
   140124da7:	mov    %rsi,%rdi
   140124daa:	sar    $0x3,%rdi
   140124dae:	cmp    %rsi,%rax
   140124db1:	jb     14012f80d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc22d>
   140124db7:	vzeroupper
   140124dba:	vmovdqa 0x249dbe(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140124dc2:	mov    %rdi,0x1060(%rbx)
   140124dc9:	mov    %r15,%rdx
   140124dcc:	mov    %rbx,%rcx
   140124dcf:	movb   $0x0,0x153a0(%rbx)
   140124dd6:	vmovdqa %xmm0,0x15390(%rbx)
   140124dde:	call   140111d70 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140124de3:	mov    0x1060(%rbx),%rax
   140124dea:	mov    0x1048(%rbx),%rdx
   140124df1:	mov    0x150c0(%rbx),%r13
   140124df8:	mov    0x38(%rsp),%r14
   140124dfd:	lea    (%rdx,%rax,8),%rsi
   140124e01:	mov    0x1050(%rbx),%rax
   140124e08:	add    0x1038(%rbx),%r14
   140124e0f:	mov    %rax,0x30(%rsp)
   140124e14:	test   %r13,%r13
   140124e17:	je     140124e26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1846>
   140124e19:	lea    -0x5(%r13,%r13,4),%rcx
   140124e1e:	mov    0x10c8(%rbx,%rcx,8),%r13
   140124e26:	cmpb   $0x0,0x1040(%rbx)
   140124e2d:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140124e33:	movzbl (%r14),%eax
   140124e37:	lea    0x2ae262(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e3e:	lea    0x1(%r14),%rbp
   140124e42:	xor    %r12d,%r12d
   140124e45:	mov    (%rdi,%rax,8),%rax
   140124e49:	jmp    *%rax
   140124e4b:	cmp    $0x2,%r12b
   140124e4f:	je     14012af3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x795a>
   140124e55:	cmp    $0x1,%r12b
   140124e59:	je     14012ef10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb930>
   140124e5f:	mov    0x1048(%rbx),%rdx
   140124e66:	mov    0x1050(%rbx),%rax
   140124e6d:	sub    0x38(%rsp),%rbp
   140124e72:	sub    %rdx,%rsi
   140124e75:	sub    %rdx,%rax
   140124e78:	mov    %rbp,0x1038(%rbx)
   140124e7f:	mov    %rsi,%rdi
   140124e82:	sar    $0x3,%rdi
   140124e86:	cmp    %rsi,%rax
   140124e89:	jb     14012f815 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc235>
   140124e8f:	vzeroupper
   140124e92:	vmovdqa 0x249ce6(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140124e9a:	mov    %rdi,0x1060(%rbx)
   140124ea1:	mov    %r15,%rdx
   140124ea4:	mov    %rbx,%rcx
   140124ea7:	movb   $0x0,0x153a0(%rbx)
   140124eae:	vmovdqa %xmm0,0x15390(%rbx)
   140124eb6:	call   1401187d0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140124ebb:	mov    0x1060(%rbx),%rax
   140124ec2:	mov    0x1048(%rbx),%rdx
   140124ec9:	mov    0x150c0(%rbx),%r13
   140124ed0:	mov    0x38(%rsp),%r14
   140124ed5:	lea    (%rdx,%rax,8),%rsi
   140124ed9:	mov    0x1050(%rbx),%rax
   140124ee0:	add    0x1038(%rbx),%r14
   140124ee7:	mov    %rax,0x30(%rsp)
   140124eec:	test   %r13,%r13
   140124eef:	je     140124efe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x191e>
   140124ef1:	lea    -0x5(%r13,%r13,4),%rcx
   140124ef6:	mov    0x10c8(%rbx,%rcx,8),%r13
   140124efe:	cmpb   $0x0,0x1040(%rbx)
   140124f05:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140124f0b:	movzbl (%r14),%eax
   140124f0f:	lea    0x2ae18a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f16:	lea    0x1(%r14),%rbp
   140124f1a:	xor    %r12d,%r12d
   140124f1d:	mov    (%rdi,%rax,8),%rax
   140124f21:	jmp    *%rax
   140124f23:	cmp    $0x2,%r12b
   140124f27:	je     14012ad8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77ae>
   140124f2d:	cmp    $0x1,%r12b
   140124f31:	je     14012ea77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb497>
   140124f37:	mov    0x1048(%rbx),%rdx
   140124f3e:	mov    0x1050(%rbx),%rax
   140124f45:	sub    0x38(%rsp),%rbp
   140124f4a:	sub    %rdx,%rsi
   140124f4d:	sub    %rdx,%rax
   140124f50:	mov    %rbp,0x1038(%rbx)
   140124f57:	mov    %rsi,%rdi
   140124f5a:	sar    $0x3,%rdi
   140124f5e:	cmp    %rsi,%rax
   140124f61:	jb     14012e272 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac92>
   140124f67:	vzeroupper
   140124f6a:	mov    %rdi,0x1060(%rbx)
   140124f71:	vmovdqa 0x249c07(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140124f79:	movb   $0x0,0x153a0(%rbx)
   140124f80:	mov    %r15,%rdx
   140124f83:	mov    %rbx,%rcx
   140124f86:	vmovdqa %xmm0,0x15390(%rbx)
   140124f8e:	call   14010dbe0 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140124f93:	mov    0x1060(%rbx),%rax
   140124f9a:	mov    0x1048(%rbx),%rdx
   140124fa1:	mov    0x150c0(%rbx),%r13
   140124fa8:	mov    0x38(%rsp),%r14
   140124fad:	lea    (%rdx,%rax,8),%rsi
   140124fb1:	mov    0x1050(%rbx),%rax
   140124fb8:	add    0x1038(%rbx),%r14
   140124fbf:	mov    %rax,0x30(%rsp)
   140124fc4:	test   %r13,%r13
   140124fc7:	je     140124fd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f6>
   140124fc9:	lea    -0x5(%r13,%r13,4),%rcx
   140124fce:	mov    0x10c8(%rbx,%rcx,8),%r13
   140124fd6:	cmpb   $0x0,0x1040(%rbx)
   140124fdd:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140124fe3:	movzbl (%r14),%eax
   140124fe7:	lea    0x2ae0b2(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124fee:	lea    0x1(%r14),%rbp
   140124ff2:	xor    %r12d,%r12d
   140124ff5:	mov    (%rdi,%rax,8),%rax
   140124ff9:	jmp    *%rax
   140124ffb:	cmp    $0x2,%r12b
   140124fff:	je     14012b0f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b12>
   140125005:	cmp    $0x1,%r12b
   140125009:	je     14012ed60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb780>
   14012500f:	mov    0x1048(%rbx),%rdx
   140125016:	mov    0x1050(%rbx),%rax
   14012501d:	sub    0x38(%rsp),%rbp
   140125022:	sub    %rdx,%rsi
   140125025:	sub    %rdx,%rax
   140125028:	mov    %rbp,0x1038(%rbx)
   14012502f:	mov    %rsi,%rdi
   140125032:	sar    $0x3,%rdi
   140125036:	cmp    %rsi,%rax
   140125039:	jb     14012f7ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc20d>
   14012503f:	vzeroupper
   140125042:	vmovdqa 0x249b36(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012504a:	mov    %rdi,0x1060(%rbx)
   140125051:	mov    %r15,%rdx
   140125054:	mov    %rbx,%rcx
   140125057:	movb   $0x0,0x153a0(%rbx)
   14012505e:	vmovdqa %xmm0,0x15390(%rbx)
   140125066:	call   14010ba20 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   14012506b:	mov    0x1060(%rbx),%rax
   140125072:	mov    0x1048(%rbx),%rdx
   140125079:	mov    0x150c0(%rbx),%r13
   140125080:	mov    0x38(%rsp),%r14
   140125085:	lea    (%rdx,%rax,8),%rsi
   140125089:	mov    0x1050(%rbx),%rax
   140125090:	add    0x1038(%rbx),%r14
   140125097:	mov    %rax,0x30(%rsp)
   14012509c:	test   %r13,%r13
   14012509f:	je     1401250ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ace>
   1401250a1:	lea    -0x5(%r13,%r13,4),%rcx
   1401250a6:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401250ae:	cmpb   $0x0,0x1040(%rbx)
   1401250b5:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401250bb:	movzbl (%r14),%eax
   1401250bf:	lea    0x2adfda(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401250c6:	lea    0x1(%r14),%rbp
   1401250ca:	xor    %r12d,%r12d
   1401250cd:	mov    (%rdi,%rax,8),%rax
   1401250d1:	jmp    *%rax
   1401250d3:	cmp    $0x2,%r12b
   1401250d7:	je     14012ab40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7560>
   1401250dd:	cmp    $0x1,%r12b
   1401250e1:	je     14012edf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb810>
   1401250e7:	mov    0x1048(%rbx),%rdx
   1401250ee:	mov    0x1050(%rbx),%rax
   1401250f5:	sub    0x38(%rsp),%rbp
   1401250fa:	sub    %rdx,%rsi
   1401250fd:	sub    %rdx,%rax
   140125100:	mov    %rbp,0x1038(%rbx)
   140125107:	mov    %rsi,%rdi
   14012510a:	sar    $0x3,%rdi
   14012510e:	cmp    %rsi,%rax
   140125111:	jb     14012f7e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc205>
   140125117:	vzeroupper
   14012511a:	vmovdqa 0x249a5e(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125122:	mov    %rdi,0x1060(%rbx)
   140125129:	mov    %r15,%rdx
   14012512c:	mov    %rbx,%rcx
   14012512f:	movb   $0x0,0x153a0(%rbx)
   140125136:	vmovdqa %xmm0,0x15390(%rbx)
   14012513e:	call   14010d6a0 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   140125143:	mov    0x1060(%rbx),%rax
   14012514a:	mov    0x1048(%rbx),%rdx
   140125151:	mov    0x150c0(%rbx),%r13
   140125158:	mov    0x38(%rsp),%r14
   14012515d:	lea    (%rdx,%rax,8),%rsi
   140125161:	mov    0x1050(%rbx),%rax
   140125168:	add    0x1038(%rbx),%r14
   14012516f:	mov    %rax,0x30(%rsp)
   140125174:	test   %r13,%r13
   140125177:	je     140125186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ba6>
   140125179:	lea    -0x5(%r13,%r13,4),%rcx
   14012517e:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125186:	cmpb   $0x0,0x1040(%rbx)
   14012518d:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125193:	movzbl (%r14),%eax
   140125197:	lea    0x2adf02(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012519e:	lea    0x1(%r14),%rbp
   1401251a2:	xor    %r12d,%r12d
   1401251a5:	mov    (%rdi,%rax,8),%rax
   1401251a9:	jmp    *%rax
   1401251ab:	cmp    $0x2,%r12b
   1401251af:	je     14012b160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b80>
   1401251b5:	cmp    $0x1,%r12b
   1401251b9:	je     14012ec40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb660>
   1401251bf:	mov    0x1048(%rbx),%rdx
   1401251c6:	mov    0x1050(%rbx),%rax
   1401251cd:	sub    0x38(%rsp),%rbp
   1401251d2:	sub    %rdx,%rsi
   1401251d5:	sub    %rdx,%rax
   1401251d8:	mov    %rbp,0x1038(%rbx)
   1401251df:	mov    %rsi,%rdi
   1401251e2:	sar    $0x3,%rdi
   1401251e6:	cmp    %rsi,%rax
   1401251e9:	jb     14012e2a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacc2>
   1401251ef:	vzeroupper
   1401251f2:	mov    %rdi,0x1060(%rbx)
   1401251f9:	vmovdqa 0x24997f(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125201:	movb   $0x0,0x153a0(%rbx)
   140125208:	mov    %r15,%rdx
   14012520b:	mov    %rbx,%rcx
   14012520e:	vmovdqa %xmm0,0x15390(%rbx)
   140125216:	call   140115de0 <setun::VM::handle_print(setun::Chunk const&)>
   14012521b:	mov    0x1060(%rbx),%rax
   140125222:	mov    0x1048(%rbx),%rdx
   140125229:	mov    0x150c0(%rbx),%r13
   140125230:	mov    0x38(%rsp),%r14
   140125235:	lea    (%rdx,%rax,8),%rsi
   140125239:	mov    0x1050(%rbx),%rax
   140125240:	add    0x1038(%rbx),%r14
   140125247:	mov    %rax,0x30(%rsp)
   14012524c:	test   %r13,%r13
   14012524f:	je     14012525e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c7e>
   140125251:	lea    -0x5(%r13,%r13,4),%rcx
   140125256:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012525e:	cmpb   $0x0,0x1040(%rbx)
   140125265:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012526b:	movzbl (%r14),%eax
   14012526f:	lea    0x2ade2a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125276:	lea    0x1(%r14),%rbp
   14012527a:	xor    %r12d,%r12d
   14012527d:	mov    (%rdi,%rax,8),%rax
   140125281:	jmp    *%rax
   140125283:	cmp    $0x2,%r12b
   140125287:	je     14012ae64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7884>
   14012528d:	cmp    $0x1,%r12b
   140125291:	je     14012ee80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8a0>
   140125297:	mov    0x1048(%rbx),%rdx
   14012529e:	mov    0x1050(%rbx),%rax
   1401252a5:	sub    0x38(%rsp),%rbp
   1401252aa:	sub    %rdx,%rsi
   1401252ad:	sub    %rdx,%rax
   1401252b0:	mov    %rbp,0x1038(%rbx)
   1401252b7:	mov    %rsi,%rdi
   1401252ba:	sar    $0x3,%rdi
   1401252be:	cmp    %rsi,%rax
   1401252c1:	jb     14012e25a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac7a>
   1401252c7:	vzeroupper
   1401252ca:	mov    %rdi,0x1060(%rbx)
   1401252d1:	vmovdqa 0x2498a7(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401252d9:	movb   $0x0,0x153a0(%rbx)
   1401252e0:	mov    %r15,%rdx
   1401252e3:	mov    %rbx,%rcx
   1401252e6:	vmovdqa %xmm0,0x15390(%rbx)
   1401252ee:	call   140115710 <setun::VM::handle_println(setun::Chunk const&)>
   1401252f3:	mov    0x1060(%rbx),%rax
   1401252fa:	mov    0x1048(%rbx),%rdx
   140125301:	mov    0x150c0(%rbx),%r13
   140125308:	mov    0x38(%rsp),%r14
   14012530d:	lea    (%rdx,%rax,8),%rsi
   140125311:	mov    0x1050(%rbx),%rax
   140125318:	add    0x1038(%rbx),%r14
   14012531f:	mov    %rax,0x30(%rsp)
   140125324:	test   %r13,%r13
   140125327:	je     140125336 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d56>
   140125329:	lea    -0x5(%r13,%r13,4),%rcx
   14012532e:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125336:	cmpb   $0x0,0x1040(%rbx)
   14012533d:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125343:	movzbl (%r14),%eax
   140125347:	lea    0x2add52(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012534e:	lea    0x1(%r14),%rbp
   140125352:	xor    %r12d,%r12d
   140125355:	mov    (%rdi,%rax,8),%rax
   140125359:	jmp    *%rax
   14012535b:	cmp    $0x2,%r12b
   14012535f:	je     14012b230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c50>
   140125365:	cmp    $0x1,%r12b
   140125369:	je     14012edc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7e0>
   14012536f:	mov    0x1048(%rbx),%rdx
   140125376:	mov    0x1050(%rbx),%rax
   14012537d:	sub    0x38(%rsp),%rbp
   140125382:	sub    %rdx,%rsi
   140125385:	sub    %rdx,%rax
   140125388:	mov    %rbp,0x1038(%rbx)
   14012538f:	mov    %rsi,%rdi
   140125392:	sar    $0x3,%rdi
   140125396:	cmp    %rsi,%rax
   140125399:	jb     14012e2ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacda>
   14012539f:	vzeroupper
   1401253a2:	mov    %rdi,0x1060(%rbx)
   1401253a9:	vmovdqa 0x2497cf(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401253b1:	movb   $0x0,0x153a0(%rbx)
   1401253b8:	mov    %r15,%rdx
   1401253bb:	mov    %rbx,%rcx
   1401253be:	vmovdqa %xmm0,0x15390(%rbx)
   1401253c6:	call   140115670 <setun::VM::handle_trace(setun::Chunk const&)>
   1401253cb:	mov    0x1060(%rbx),%rax
   1401253d2:	mov    0x1048(%rbx),%rdx
   1401253d9:	mov    0x150c0(%rbx),%r13
   1401253e0:	mov    0x38(%rsp),%r14
   1401253e5:	lea    (%rdx,%rax,8),%rsi
   1401253e9:	mov    0x1050(%rbx),%rax
   1401253f0:	add    0x1038(%rbx),%r14
   1401253f7:	mov    %rax,0x30(%rsp)
   1401253fc:	test   %r13,%r13
   1401253ff:	je     14012540e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e2e>
   140125401:	lea    -0x5(%r13,%r13,4),%rcx
   140125406:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012540e:	cmpb   $0x0,0x1040(%rbx)
   140125415:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012541b:	movzbl (%r14),%eax
   14012541f:	lea    0x2adc7a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125426:	lea    0x1(%r14),%rbp
   14012542a:	xor    %r12d,%r12d
   14012542d:	mov    (%rdi,%rax,8),%rax
   140125431:	jmp    *%rax
   140125433:	cmp    $0x2,%r12b
   140125437:	je     14012acbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76de>
   14012543d:	cmp    $0x1,%r12b
   140125441:	je     14012eee0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb900>
   140125447:	mov    0x1048(%rbx),%rdx
   14012544e:	mov    0x1050(%rbx),%rax
   140125455:	sub    0x38(%rsp),%rbp
   14012545a:	sub    %rdx,%rsi
   14012545d:	sub    %rdx,%rax
   140125460:	mov    %rbp,0x1038(%rbx)
   140125467:	mov    %rsi,%rdi
   14012546a:	sar    $0x3,%rdi
   14012546e:	cmp    %rsi,%rax
   140125471:	jb     14012e242 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac62>
   140125477:	vzeroupper
   14012547a:	mov    %rdi,0x1060(%rbx)
   140125481:	vmovdqa 0x2496f7(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125489:	movb   $0x0,0x153a0(%rbx)
   140125490:	mov    %r15,%rdx
   140125493:	mov    %rbx,%rcx
   140125496:	vmovdqa %xmm0,0x15390(%rbx)
   14012549e:	call   14011a850 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   1401254a3:	mov    0x1060(%rbx),%rax
   1401254aa:	mov    0x1048(%rbx),%rdx
   1401254b1:	mov    0x150c0(%rbx),%r13
   1401254b8:	mov    0x38(%rsp),%r14
   1401254bd:	lea    (%rdx,%rax,8),%rsi
   1401254c1:	mov    0x1050(%rbx),%rax
   1401254c8:	add    0x1038(%rbx),%r14
   1401254cf:	mov    %rax,0x30(%rsp)
   1401254d4:	test   %r13,%r13
   1401254d7:	je     1401254e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f06>
   1401254d9:	lea    -0x5(%r13,%r13,4),%rcx
   1401254de:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401254e6:	cmpb   $0x0,0x1040(%rbx)
   1401254ed:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401254f3:	movzbl (%r14),%eax
   1401254f7:	lea    0x2adba2(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401254fe:	lea    0x1(%r14),%rbp
   140125502:	xor    %r12d,%r12d
   140125505:	mov    (%rdi,%rax,8),%rax
   140125509:	jmp    *%rax
   14012550b:	movb   $0x0,0x1040(%rbx)
   140125512:	mov    0x1048(%rbx),%rdx
   140125519:	mov    %rbp,%r14
   14012551c:	vzeroupper
   14012551f:	cmp    $0x2,%r12b
   140125523:	jne    14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c90>
   140125529:	mov    0x1050(%rbx),%rax
   140125530:	lea    0x10(%rsi),%rcx
   140125534:	cmp    0x30(%rsp),%rcx
   140125539:	jae    14012df25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa945>
   14012553f:	mov    0x1d0(%rsp),%r8
   140125547:	sub    %rdx,%rcx
   14012554a:	sub    0x38(%rsp),%r14
   14012554f:	sub    %rdx,%rax
   140125552:	mov    %r8,(%rsi)
   140125555:	mov    0x1c8(%rsp),%r8
   14012555d:	mov    %r8,0x8(%rsi)
   140125561:	mov    %rcx,%r8
   140125564:	sar    $0x3,%r8
   140125568:	mov    %r14,0x1038(%rbx)
   14012556f:	mov    %r8,%rdi
   140125572:	cmp    %rcx,%rax
   140125575:	jb     14012a288 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ca8>
   14012557b:	vmovdqa 0x2495fd(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125583:	mov    %r8,0x1060(%rbx)
   14012558a:	movb   $0x0,0x153a0(%rbx)
   140125591:	vmovdqa %xmm0,0x15390(%rbx)
   140125599:	vmovaps 0x8c0(%rsp),%xmm6
   1401255a2:	vmovaps 0x8d0(%rsp),%xmm7
   1401255ab:	vmovaps 0x8e0(%rsp),%xmm8
   1401255b4:	vmovaps 0x8f0(%rsp),%xmm9
   1401255bd:	vmovaps 0x900(%rsp),%xmm10
   1401255c6:	vmovaps 0x910(%rsp),%xmm11
   1401255cf:	vmovaps 0x920(%rsp),%xmm12
   1401255d8:	vmovaps 0x930(%rsp),%xmm13
   1401255e1:	vmovaps 0x940(%rsp),%xmm14
   1401255ea:	vmovaps 0x950(%rsp),%xmm15
   1401255f3:	add    $0x968,%rsp
   1401255fa:	pop    %rbx
   1401255fb:	pop    %rsi
   1401255fc:	pop    %rdi
   1401255fd:	pop    %rbp
   1401255fe:	pop    %r12
   140125600:	pop    %r13
   140125602:	pop    %r14
   140125604:	pop    %r15
   140125606:	ret
   140125607:	cmp    $0x2,%r12b
   14012560b:	je     14012b1c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7be8>
   140125611:	cmp    $0x1,%r12b
   140125615:	je     14012ed00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb720>
   14012561b:	mov    0x1048(%rbx),%rdx
   140125622:	mov    0x1050(%rbx),%rax
   140125629:	sub    0x38(%rsp),%rbp
   14012562e:	sub    %rdx,%rsi
   140125631:	sub    %rdx,%rax
   140125634:	mov    %rbp,0x1038(%rbx)
   14012563b:	mov    %rsi,%rdi
   14012563e:	sar    $0x3,%rdi
   140125642:	cmp    %rsi,%rax
   140125645:	jb     14012e28a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacaa>
   14012564b:	vzeroupper
   14012564e:	mov    %rdi,0x1060(%rbx)
   140125655:	vmovdqa 0x249523(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012565d:	movb   $0x0,0x153a0(%rbx)
   140125664:	mov    %r15,%rdx
   140125667:	mov    %rbx,%rcx
   14012566a:	vmovdqa %xmm0,0x15390(%rbx)
   140125672:	call   140115230 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140125677:	mov    0x1060(%rbx),%rax
   14012567e:	mov    0x1048(%rbx),%rdx
   140125685:	mov    0x150c0(%rbx),%r13
   14012568c:	mov    0x38(%rsp),%r14
   140125691:	lea    (%rdx,%rax,8),%rsi
   140125695:	mov    0x1050(%rbx),%rax
   14012569c:	add    0x1038(%rbx),%r14
   1401256a3:	mov    %rax,0x30(%rsp)
   1401256a8:	test   %r13,%r13
   1401256ab:	je     1401256ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20da>
   1401256ad:	lea    -0x5(%r13,%r13,4),%rcx
   1401256b2:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401256ba:	cmpb   $0x0,0x1040(%rbx)
   1401256c1:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401256c7:	movzbl (%r14),%eax
   1401256cb:	lea    0x2ad9ce(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401256d2:	lea    0x1(%r14),%rbp
   1401256d6:	xor    %r12d,%r12d
   1401256d9:	mov    (%rdi,%rax,8),%rax
   1401256dd:	jmp    *%rax
   1401256df:	cmp    $0x2,%r12b
   1401256e3:	je     14012b016 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a36>
   1401256e9:	cmp    $0x1,%r12b
   1401256ed:	je     14012eeb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8d0>
   1401256f3:	mov    0x1048(%rbx),%rdx
   1401256fa:	mov    0x1050(%rbx),%rax
   140125701:	sub    0x38(%rsp),%rbp
   140125706:	sub    %rdx,%rsi
   140125709:	sub    %rdx,%rax
   14012570c:	mov    %rbp,0x1038(%rbx)
   140125713:	mov    %rsi,%rdi
   140125716:	sar    $0x3,%rdi
   14012571a:	cmp    %rsi,%rax
   14012571d:	jb     14012f805 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc225>
   140125723:	vzeroupper
   140125726:	vmovdqa 0x249452(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012572e:	mov    %rdi,0x1060(%rbx)
   140125735:	mov    %r15,%rdx
   140125738:	mov    %rbx,%rcx
   14012573b:	movb   $0x0,0x153a0(%rbx)
   140125742:	vmovdqa %xmm0,0x15390(%rbx)
   14012574a:	call   14010b980 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   14012574f:	mov    0x1060(%rbx),%rax
   140125756:	mov    0x1048(%rbx),%rdx
   14012575d:	mov    0x150c0(%rbx),%r13
   140125764:	mov    0x38(%rsp),%r14
   140125769:	lea    (%rdx,%rax,8),%rsi
   14012576d:	mov    0x1050(%rbx),%rax
   140125774:	add    0x1038(%rbx),%r14
   14012577b:	mov    %rax,0x30(%rsp)
   140125780:	test   %r13,%r13
   140125783:	je     140125792 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21b2>
   140125785:	lea    -0x5(%r13,%r13,4),%rcx
   14012578a:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125792:	cmpb   $0x0,0x1040(%rbx)
   140125799:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012579f:	movzbl (%r14),%eax
   1401257a3:	lea    0x2ad8f6(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401257aa:	lea    0x1(%r14),%rbp
   1401257ae:	xor    %r12d,%r12d
   1401257b1:	mov    (%rdi,%rax,8),%rax
   1401257b5:	jmp    *%rax
   1401257b7:	cmp    $0x2,%r12b
   1401257bb:	je     14012b298 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cb8>
   1401257c1:	cmp    $0x1,%r12b
   1401257c5:	je     14012ec70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb690>
   1401257cb:	mov    0x1048(%rbx),%rdx
   1401257d2:	mov    0x1050(%rbx),%rax
   1401257d9:	sub    0x38(%rsp),%rbp
   1401257de:	sub    %rdx,%rsi
   1401257e1:	sub    %rdx,%rax
   1401257e4:	mov    %rbp,0x1038(%rbx)
   1401257eb:	mov    %rsi,%rdi
   1401257ee:	sar    $0x3,%rdi
   1401257f2:	cmp    %rsi,%rax
   1401257f5:	jb     14012f7c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1e5>
   1401257fb:	vzeroupper
   1401257fe:	vmovdqa 0x24937a(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125806:	mov    %rdi,0x1060(%rbx)
   14012580d:	mov    %r15,%rdx
   140125810:	mov    %rbx,%rcx
   140125813:	movb   $0x0,0x153a0(%rbx)
   14012581a:	vmovdqa %xmm0,0x15390(%rbx)
   140125822:	call   14010b630 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   140125827:	mov    0x1060(%rbx),%rax
   14012582e:	mov    0x1048(%rbx),%rdx
   140125835:	mov    0x150c0(%rbx),%r13
   14012583c:	mov    0x38(%rsp),%r14
   140125841:	lea    (%rdx,%rax,8),%rsi
   140125845:	mov    0x1050(%rbx),%rax
   14012584c:	add    0x1038(%rbx),%r14
   140125853:	mov    %rax,0x30(%rsp)
   140125858:	test   %r13,%r13
   14012585b:	je     14012586a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x228a>
   14012585d:	lea    -0x5(%r13,%r13,4),%rcx
   140125862:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012586a:	cmpb   $0x0,0x1040(%rbx)
   140125871:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125877:	movzbl (%r14),%eax
   14012587b:	lea    0x2ad81e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125882:	lea    0x1(%r14),%rbp
   140125886:	xor    %r12d,%r12d
   140125889:	mov    (%rdi,%rax,8),%rax
   14012588d:	jmp    *%rax
   14012588f:	cmp    $0x2,%r12b
   140125893:	je     14012b76c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x818c>
   140125899:	cmp    $0x1,%r12b
   14012589d:	je     14012ed30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb750>
   1401258a3:	mov    0x1048(%rbx),%rdx
   1401258aa:	mov    0x1050(%rbx),%rax
   1401258b1:	sub    0x38(%rsp),%rbp
   1401258b6:	sub    %rdx,%rsi
   1401258b9:	sub    %rdx,%rax
   1401258bc:	mov    %rbp,0x1038(%rbx)
   1401258c3:	mov    %rsi,%rdi
   1401258c6:	sar    $0x3,%rdi
   1401258ca:	cmp    %rsi,%rax
   1401258cd:	jb     14012f7cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1ed>
   1401258d3:	vzeroupper
   1401258d6:	vmovdqa 0x2492a2(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401258de:	mov    %rdi,0x1060(%rbx)
   1401258e5:	mov    %r15,%rdx
   1401258e8:	mov    %rbx,%rcx
   1401258eb:	movb   $0x0,0x153a0(%rbx)
   1401258f2:	vmovdqa %xmm0,0x15390(%rbx)
   1401258fa:	call   14010f8b0 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   1401258ff:	mov    0x1060(%rbx),%rax
   140125906:	mov    0x1048(%rbx),%rdx
   14012590d:	mov    0x150c0(%rbx),%r13
   140125914:	mov    0x38(%rsp),%r14
   140125919:	lea    (%rdx,%rax,8),%rsi
   14012591d:	mov    0x1050(%rbx),%rax
   140125924:	add    0x1038(%rbx),%r14
   14012592b:	mov    %rax,0x30(%rsp)
   140125930:	test   %r13,%r13
   140125933:	je     140125942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2362>
   140125935:	lea    -0x5(%r13,%r13,4),%rcx
   14012593a:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125942:	cmpb   $0x0,0x1040(%rbx)
   140125949:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012594f:	movzbl (%r14),%eax
   140125953:	lea    0x2ad746(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012595a:	lea    0x1(%r14),%rbp
   14012595e:	xor    %r12d,%r12d
   140125961:	mov    (%rdi,%rax,8),%rax
   140125965:	jmp    *%rax
   140125967:	cmp    $0x2,%r12b
   14012596b:	je     14012b9b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83d6>
   140125971:	cmp    $0x1,%r12b
   140125975:	je     14012ec10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb630>
   14012597b:	mov    0x1048(%rbx),%rdx
   140125982:	mov    0x1050(%rbx),%rax
   140125989:	sub    0x38(%rsp),%rbp
   14012598e:	sub    %rdx,%rsi
   140125991:	sub    %rdx,%rax
   140125994:	mov    %rbp,0x1038(%rbx)
   14012599b:	mov    %rsi,%rdi
   14012599e:	sar    $0x3,%rdi
   1401259a2:	cmp    %rsi,%rax
   1401259a5:	jb     14012e33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad5b>
   1401259ab:	vzeroupper
   1401259ae:	mov    %rdi,0x1060(%rbx)
   1401259b5:	vmovdqa 0x2491c3(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401259bd:	movb   $0x0,0x153a0(%rbx)
   1401259c4:	mov    %r15,%rdx
   1401259c7:	mov    %rbx,%rcx
   1401259ca:	vmovdqa %xmm0,0x15390(%rbx)
   1401259d2:	call   14010e770 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   1401259d7:	mov    0x1060(%rbx),%rax
   1401259de:	mov    0x1048(%rbx),%rdx
   1401259e5:	mov    0x150c0(%rbx),%r13
   1401259ec:	mov    0x38(%rsp),%r14
   1401259f1:	lea    (%rdx,%rax,8),%rsi
   1401259f5:	mov    0x1050(%rbx),%rax
   1401259fc:	add    0x1038(%rbx),%r14
   140125a03:	mov    %rax,0x30(%rsp)
   140125a08:	test   %r13,%r13
   140125a0b:	je     140125a1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x243a>
   140125a0d:	lea    -0x5(%r13,%r13,4),%rcx
   140125a12:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125a1a:	cmpb   $0x0,0x1040(%rbx)
   140125a21:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125a27:	movzbl (%r14),%eax
   140125a2b:	lea    0x2ad66e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a32:	lea    0x1(%r14),%rbp
   140125a36:	xor    %r12d,%r12d
   140125a39:	mov    (%rdi,%rax,8),%rax
   140125a3d:	jmp    *%rax
   140125a3f:	cmp    $0x2,%r12b
   140125a43:	je     14012b8da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82fa>
   140125a49:	cmp    $0x1,%r12b
   140125a4d:	je     14012ed90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7b0>
   140125a53:	mov    0x1048(%rbx),%rdx
   140125a5a:	mov    0x1050(%rbx),%rax
   140125a61:	sub    0x38(%rsp),%rbp
   140125a66:	sub    %rdx,%rsi
   140125a69:	sub    %rdx,%rax
   140125a6c:	mov    %rbp,0x1038(%rbx)
   140125a73:	mov    %rsi,%rdi
   140125a76:	sar    $0x3,%rdi
   140125a7a:	cmp    %rsi,%rax
   140125a7d:	jb     14012f7d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1f5>
   140125a83:	vzeroupper
   140125a86:	vmovdqa 0x2490f2(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125a8e:	mov    %rdi,0x1060(%rbx)
   140125a95:	mov    %r15,%rdx
   140125a98:	mov    %rbx,%rcx
   140125a9b:	movb   $0x0,0x153a0(%rbx)
   140125aa2:	vmovdqa %xmm0,0x15390(%rbx)
   140125aaa:	call   140114f30 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   140125aaf:	mov    0x1060(%rbx),%rax
   140125ab6:	mov    0x1048(%rbx),%rdx
   140125abd:	mov    0x150c0(%rbx),%r13
   140125ac4:	mov    0x38(%rsp),%r14
   140125ac9:	lea    (%rdx,%rax,8),%rsi
   140125acd:	mov    0x1050(%rbx),%rax
   140125ad4:	add    0x1038(%rbx),%r14
   140125adb:	mov    %rax,0x30(%rsp)
   140125ae0:	test   %r13,%r13
   140125ae3:	je     140125af2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2512>
   140125ae5:	lea    -0x5(%r13,%r13,4),%rcx
   140125aea:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125af2:	cmpb   $0x0,0x1040(%rbx)
   140125af9:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125aff:	movzbl (%r14),%eax
   140125b03:	lea    0x2ad596(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125b0a:	lea    0x1(%r14),%rbp
   140125b0e:	xor    %r12d,%r12d
   140125b11:	mov    (%rdi,%rax,8),%rax
   140125b15:	jmp    *%rax
   140125b17:	cmp    $0x2,%r12b
   140125b1b:	je     14012bac8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84e8>
   140125b21:	cmp    $0x1,%r12b
   140125b25:	je     14012eb23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb543>
   140125b2b:	mov    0x1048(%rbx),%rdx
   140125b32:	mov    0x1050(%rbx),%rax
   140125b39:	sub    0x38(%rsp),%rbp
   140125b3e:	sub    %rdx,%rsi
   140125b41:	sub    %rdx,%rax
   140125b44:	mov    %rbp,0x1038(%rbx)
   140125b4b:	mov    %rsi,%rdi
   140125b4e:	sar    $0x3,%rdi
   140125b52:	cmp    %rsi,%rax
   140125b55:	jb     14012f82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc24d>
   140125b5b:	vzeroupper
   140125b5e:	vmovdqa 0x24901a(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125b66:	mov    %rdi,0x1060(%rbx)
   140125b6d:	mov    %r15,%rdx
   140125b70:	mov    %rbx,%rcx
   140125b73:	movb   $0x0,0x153a0(%rbx)
   140125b7a:	vmovdqa %xmm0,0x15390(%rbx)
   140125b82:	call   140109a40 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   140125b87:	mov    0x1060(%rbx),%rax
   140125b8e:	mov    0x1048(%rbx),%rdx
   140125b95:	mov    0x150c0(%rbx),%r13
   140125b9c:	mov    0x38(%rsp),%r14
   140125ba1:	lea    (%rdx,%rax,8),%rsi
   140125ba5:	mov    0x1050(%rbx),%rax
   140125bac:	add    0x1038(%rbx),%r14
   140125bb3:	mov    %rax,0x30(%rsp)
   140125bb8:	test   %r13,%r13
   140125bbb:	je     140125bca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25ea>
   140125bbd:	lea    -0x5(%r13,%r13,4),%rcx
   140125bc2:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125bca:	cmpb   $0x0,0x1040(%rbx)
   140125bd1:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125bd7:	movzbl (%r14),%eax
   140125bdb:	lea    0x2ad4be(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125be2:	lea    0x1(%r14),%rbp
   140125be6:	xor    %r12d,%r12d
   140125be9:	mov    (%rdi,%rax,8),%rax
   140125bed:	jmp    *%rax
   140125bef:	cmp    $0x2,%r12b
   140125bf3:	je     14012b804 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8224>
   140125bf9:	cmp    $0x1,%r12b
   140125bfd:	je     14012eb53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb573>
   140125c03:	mov    0x1048(%rbx),%rdx
   140125c0a:	mov    0x1050(%rbx),%rax
   140125c11:	sub    0x38(%rsp),%rbp
   140125c16:	sub    %rdx,%rsi
   140125c19:	sub    %rdx,%rax
   140125c1c:	mov    %rbp,0x1038(%rbx)
   140125c23:	mov    %rsi,%rdi
   140125c26:	sar    $0x3,%rdi
   140125c2a:	cmp    %rsi,%rax
   140125c2d:	jb     14012f7bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1dd>
   140125c33:	vzeroupper
   140125c36:	vmovdqa 0x248f42(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125c3e:	mov    %rdi,0x1060(%rbx)
   140125c45:	mov    %r15,%rdx
   140125c48:	mov    %rbx,%rcx
   140125c4b:	movb   $0x0,0x153a0(%rbx)
   140125c52:	vmovdqa %xmm0,0x15390(%rbx)
   140125c5a:	call   140109990 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140125c5f:	mov    0x1060(%rbx),%rax
   140125c66:	mov    0x1048(%rbx),%rdx
   140125c6d:	mov    0x150c0(%rbx),%r13
   140125c74:	mov    0x38(%rsp),%r14
   140125c79:	lea    (%rdx,%rax,8),%rsi
   140125c7d:	mov    0x1050(%rbx),%rax
   140125c84:	add    0x1038(%rbx),%r14
   140125c8b:	mov    %rax,0x30(%rsp)
   140125c90:	test   %r13,%r13
   140125c93:	je     140125ca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26c2>
   140125c95:	lea    -0x5(%r13,%r13,4),%rcx
   140125c9a:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125ca2:	cmpb   $0x0,0x1040(%rbx)
   140125ca9:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125caf:	movzbl (%r14),%eax
   140125cb3:	lea    0x2ad3e6(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125cba:	lea    0x1(%r14),%rbp
   140125cbe:	xor    %r12d,%r12d
   140125cc1:	mov    (%rdi,%rax,8),%rax
   140125cc5:	jmp    *%rax
   140125cc7:	cmp    $0x2,%r12b
   140125ccb:	je     14012b872 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8292>
   140125cd1:	cmp    $0x1,%r12b
   140125cd5:	je     14012ebe0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb600>
   140125cdb:	mov    0x1048(%rbx),%rdx
   140125ce2:	mov    0x1050(%rbx),%rax
   140125ce9:	sub    0x38(%rsp),%rbp
   140125cee:	sub    %rdx,%rsi
   140125cf1:	sub    %rdx,%rax
   140125cf4:	mov    %rbp,0x1038(%rbx)
   140125cfb:	mov    %rsi,%rdi
   140125cfe:	sar    $0x3,%rdi
   140125d02:	cmp    %rsi,%rax
   140125d05:	jb     14012e36b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad8b>
   140125d0b:	vzeroupper
   140125d0e:	mov    %rdi,0x1060(%rbx)
   140125d15:	vmovdqa 0x248e63(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125d1d:	movb   $0x0,0x153a0(%rbx)
   140125d24:	mov    %r15,%rdx
   140125d27:	mov    %rbx,%rcx
   140125d2a:	vmovdqa %xmm0,0x15390(%rbx)
   140125d32:	call   140108970 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140125d37:	mov    0x1060(%rbx),%rax
   140125d3e:	mov    0x1048(%rbx),%rdx
   140125d45:	mov    0x150c0(%rbx),%r13
   140125d4c:	mov    0x38(%rsp),%r14
   140125d51:	lea    (%rdx,%rax,8),%rsi
   140125d55:	mov    0x1050(%rbx),%rax
   140125d5c:	add    0x1038(%rbx),%r14
   140125d63:	mov    %rax,0x30(%rsp)
   140125d68:	test   %r13,%r13
   140125d6b:	je     140125d7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x279a>
   140125d6d:	lea    -0x5(%r13,%r13,4),%rcx
   140125d72:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125d7a:	cmpb   $0x0,0x1040(%rbx)
   140125d81:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125d87:	movzbl (%r14),%eax
   140125d8b:	lea    0x2ad30e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125d92:	lea    0x1(%r14),%rbp
   140125d96:	xor    %r12d,%r12d
   140125d99:	mov    (%rdi,%rax,8),%rax
   140125d9d:	jmp    *%rax
   140125d9f:	cmp    $0x2,%r12b
   140125da3:	je     14012b509 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f29>
   140125da9:	cmp    $0x1,%r12b
   140125dad:	je     14012ee20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb840>
   140125db3:	mov    0x1048(%rbx),%rdx
   140125dba:	mov    0x1050(%rbx),%rax
   140125dc1:	sub    0x38(%rsp),%rbp
   140125dc6:	sub    %rdx,%rsi
   140125dc9:	sub    %rdx,%rax
   140125dcc:	mov    %rbp,0x1038(%rbx)
   140125dd3:	mov    %rsi,%rdi
   140125dd6:	sar    $0x3,%rdi
   140125dda:	cmp    %rsi,%rax
   140125ddd:	jb     14012f7fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc21d>
   140125de3:	vzeroupper
   140125de6:	vmovdqa 0x248d92(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125dee:	mov    %rdi,0x1060(%rbx)
   140125df5:	mov    %r15,%rdx
   140125df8:	mov    %rbx,%rcx
   140125dfb:	movb   $0x0,0x153a0(%rbx)
   140125e02:	vmovdqa %xmm0,0x15390(%rbx)
   140125e0a:	call   14010de40 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140125e0f:	mov    0x1060(%rbx),%rax
   140125e16:	mov    0x1048(%rbx),%rdx
   140125e1d:	mov    0x150c0(%rbx),%r13
   140125e24:	mov    0x38(%rsp),%r14
   140125e29:	lea    (%rdx,%rax,8),%rsi
   140125e2d:	mov    0x1050(%rbx),%rax
   140125e34:	add    0x1038(%rbx),%r14
   140125e3b:	mov    %rax,0x30(%rsp)
   140125e40:	test   %r13,%r13
   140125e43:	je     140125e52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2872>
   140125e45:	lea    -0x5(%r13,%r13,4),%rcx
   140125e4a:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125e52:	cmpb   $0x0,0x1040(%rbx)
   140125e59:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125e5f:	movzbl (%r14),%eax
   140125e63:	lea    0x2ad236(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e6a:	lea    0x1(%r14),%rbp
   140125e6e:	xor    %r12d,%r12d
   140125e71:	mov    (%rdi,%rax,8),%rax
   140125e75:	jmp    *%rax
   140125e77:	cmp    $0x2,%r12b
   140125e7b:	je     14012ba5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x847a>
   140125e81:	cmp    $0x1,%r12b
   140125e85:	je     14012ecd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6f0>
   140125e8b:	mov    0x1048(%rbx),%rdx
   140125e92:	mov    0x1050(%rbx),%rax
   140125e99:	sub    0x38(%rsp),%rbp
   140125e9e:	sub    %rdx,%rsi
   140125ea1:	sub    %rdx,%rax
   140125ea4:	mov    %rbp,0x1038(%rbx)
   140125eab:	mov    %rsi,%rdi
   140125eae:	sar    $0x3,%rdi
   140125eb2:	cmp    %rsi,%rax
   140125eb5:	jb     14012f7dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1fd>
   140125ebb:	vzeroupper
   140125ebe:	vmovdqa 0x248cba(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125ec6:	mov    %rdi,0x1060(%rbx)
   140125ecd:	mov    %r15,%rdx
   140125ed0:	mov    %rbx,%rcx
   140125ed3:	movb   $0x0,0x153a0(%rbx)
   140125eda:	vmovdqa %xmm0,0x15390(%rbx)
   140125ee2:	call   14010e090 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   140125ee7:	mov    0x1060(%rbx),%rax
   140125eee:	mov    0x1048(%rbx),%rdx
   140125ef5:	mov    0x150c0(%rbx),%r13
   140125efc:	mov    0x38(%rsp),%r14
   140125f01:	lea    (%rdx,%rax,8),%rsi
   140125f05:	mov    0x1050(%rbx),%rax
   140125f0c:	add    0x1038(%rbx),%r14
   140125f13:	mov    %rax,0x30(%rsp)
   140125f18:	test   %r13,%r13
   140125f1b:	je     140125f2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x294a>
   140125f1d:	lea    -0x5(%r13,%r13,4),%rcx
   140125f22:	mov    0x10c8(%rbx,%rcx,8),%r13
   140125f2a:	cmpb   $0x0,0x1040(%rbx)
   140125f31:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140125f37:	movzbl (%r14),%eax
   140125f3b:	lea    0x2ad15e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125f42:	lea    0x1(%r14),%rbp
   140125f46:	xor    %r12d,%r12d
   140125f49:	mov    (%rdi,%rax,8),%rax
   140125f4d:	jmp    *%rax
   140125f4f:	cmp    $0x2,%r12b
   140125f53:	je     14012b696 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80b6>
   140125f59:	cmp    $0x1,%r12b
   140125f5d:	je     14012eb83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5a3>
   140125f63:	mov    0x1048(%rbx),%rdx
   140125f6a:	mov    0x1050(%rbx),%rax
   140125f71:	sub    0x38(%rsp),%rbp
   140125f76:	sub    %rdx,%rsi
   140125f79:	sub    %rdx,%rax
   140125f7c:	mov    %rbp,0x1038(%rbx)
   140125f83:	mov    %rsi,%rdi
   140125f86:	sar    $0x3,%rdi
   140125f8a:	cmp    %rsi,%rax
   140125f8d:	jb     14012f81d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc23d>
   140125f93:	vzeroupper
   140125f96:	vmovdqa 0x248be2(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140125f9e:	mov    %rdi,0x1060(%rbx)
   140125fa5:	mov    %r15,%rdx
   140125fa8:	mov    %rbx,%rcx
   140125fab:	movb   $0x0,0x153a0(%rbx)
   140125fb2:	vmovdqa %xmm0,0x15390(%rbx)
   140125fba:	call   14010d9a0 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   140125fbf:	mov    0x1060(%rbx),%rax
   140125fc6:	mov    0x1048(%rbx),%rdx
   140125fcd:	mov    0x150c0(%rbx),%r13
   140125fd4:	mov    0x38(%rsp),%r14
   140125fd9:	lea    (%rdx,%rax,8),%rsi
   140125fdd:	mov    0x1050(%rbx),%rax
   140125fe4:	add    0x1038(%rbx),%r14
   140125feb:	mov    %rax,0x30(%rsp)
   140125ff0:	test   %r13,%r13
   140125ff3:	je     140126002 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a22>
   140125ff5:	lea    -0x5(%r13,%r13,4),%rcx
   140125ffa:	mov    0x10c8(%rbx,%rcx,8),%r13
   140126002:	cmpb   $0x0,0x1040(%rbx)
   140126009:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012600f:	movzbl (%r14),%eax
   140126013:	lea    0x2ad086(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012601a:	lea    0x1(%r14),%rbp
   14012601e:	xor    %r12d,%r12d
   140126021:	mov    (%rdi,%rax,8),%rax
   140126025:	jmp    *%rax
   140126027:	movabs $0xfffb000000000000,%rax
   140126031:	mov    %rax,0x1f8(%rsp)
   140126039:	mov    %rax,0x200(%rsp)
   140126041:	cmp    $0x2,%r12b
   140126045:	jne    14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a5a>
   14012604b:	mov    0x1c8(%rsp),%rax
   140126053:	mov    $0x1,%r12d
   140126059:	movabs $0xffff000000000000,%rdx
   140126063:	movabs $0xfff8000000000000,%rcx
   14012606d:	mov    %rax,0x200(%rsp)
   140126075:	mov    0x1d0(%rsp),%rax
   14012607d:	and    %rax,%rdx
   140126080:	mov    %rax,0x1f8(%rsp)
   140126088:	cmp    %rcx,%rdx
   14012608b:	je     14012d08d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aad>
   140126091:	lea    0x200(%rsp),%rdx
   140126099:	lea    0x1f8(%rsp),%rcx
   1401260a1:	vzeroupper
   1401260a4:	call   140228f80 <setun::VMValue::mul(setun::VMValue const&) const>
   1401260a9:	mov    %rax,0x1c8(%rsp)
   1401260b1:	cmpb   $0x0,0x1040(%rbx)
   1401260b8:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401260be:	movzbl 0x0(%rbp),%eax
   1401260c2:	lea    0x2acfd7(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401260c9:	add    $0x1,%rbp
   1401260cd:	mov    (%rdi,%rax,8),%rax
   1401260d1:	jmp    *%rax
   1401260d3:	movabs $0xfffb000000000000,%rax
   1401260dd:	mov    %rax,0x208(%rsp)
   1401260e5:	mov    %rax,0x210(%rsp)
   1401260ed:	cmp    $0x2,%r12b
   1401260f1:	jne    140130e65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd885>
   1401260f7:	mov    0x1c8(%rsp),%rax
   1401260ff:	lea    0x210(%rsp),%rdx
   140126107:	lea    0x208(%rsp),%rcx
   14012610f:	mov    $0x1,%r12d
   140126115:	mov    %rax,0x210(%rsp)
   14012611d:	mov    0x1d0(%rsp),%rax
   140126125:	mov    %rax,0x208(%rsp)
   14012612d:	vzeroupper
   140126130:	call   140228ae0 <setun::VMValue::div(setun::VMValue const&) const>
   140126135:	mov    %rax,0x1c8(%rsp)
   14012613d:	cmpb   $0x0,0x1040(%rbx)
   140126144:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012614a:	movzbl 0x0(%rbp),%eax
   14012614e:	lea    0x2acf4b(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126155:	add    $0x1,%rbp
   140126159:	mov    (%rdi,%rax,8),%rax
   14012615d:	jmp    *%rax
   14012615f:	movabs $0xfffb000000000000,%rax
   140126169:	mov    %rax,0x248(%rsp)
   140126171:	mov    %rax,0x250(%rsp)
   140126179:	cmp    $0x2,%r12b
   14012617d:	jne    14013071b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd13b>
   140126183:	mov    0x1c8(%rsp),%rax
   14012618b:	lea    0x250(%rsp),%rdx
   140126193:	lea    0x248(%rsp),%rcx
   14012619b:	mov    $0x1,%r12d
   1401261a1:	mov    %rax,0x250(%rsp)
   1401261a9:	mov    0x1d0(%rsp),%rax
   1401261b1:	mov    %rax,0x248(%rsp)
   1401261b9:	vzeroupper
   1401261bc:	call   14022ab50 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   1401261c1:	mov    %rax,0x1c8(%rsp)
   1401261c9:	cmpb   $0x0,0x1040(%rbx)
   1401261d0:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401261d6:	movzbl 0x0(%rbp),%eax
   1401261da:	lea    0x2acebf(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401261e1:	add    $0x1,%rbp
   1401261e5:	mov    (%rdi,%rax,8),%rax
   1401261e9:	jmp    *%rax
   1401261eb:	movabs $0xfffb000000000000,%rax
   1401261f5:	mov    %rax,0x258(%rsp)
   1401261fd:	mov    %rax,0x260(%rsp)
   140126205:	cmp    $0x2,%r12b
   140126209:	jne    1401308a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2c8>
   14012620f:	mov    0x1c8(%rsp),%rax
   140126217:	lea    0x260(%rsp),%rdx
   14012621f:	lea    0x258(%rsp),%rcx
   140126227:	mov    $0x1,%r12d
   14012622d:	mov    %rax,0x260(%rsp)
   140126235:	mov    0x1d0(%rsp),%rax
   14012623d:	mov    %rax,0x258(%rsp)
   140126245:	vzeroupper
   140126248:	call   140229380 <setun::VMValue::shl(setun::VMValue const&) const>
   14012624d:	mov    %rax,0x1c8(%rsp)
   140126255:	cmpb   $0x0,0x1040(%rbx)
   14012625c:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126262:	movzbl 0x0(%rbp),%eax
   140126266:	lea    0x2ace33(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012626d:	add    $0x1,%rbp
   140126271:	mov    (%rdi,%rax,8),%rax
   140126275:	jmp    *%rax
   140126277:	movabs $0xfffb000000000000,%rax
   140126281:	mov    %rax,0x268(%rsp)
   140126289:	mov    %rax,0x270(%rsp)
   140126291:	cmp    $0x2,%r12b
   140126295:	jne    140130847 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd267>
   14012629b:	mov    0x1c8(%rsp),%rax
   1401262a3:	lea    0x270(%rsp),%rdx
   1401262ab:	lea    0x268(%rsp),%rcx
   1401262b3:	mov    $0x1,%r12d
   1401262b9:	mov    %rax,0x270(%rsp)
   1401262c1:	mov    0x1d0(%rsp),%rax
   1401262c9:	mov    %rax,0x268(%rsp)
   1401262d1:	vzeroupper
   1401262d4:	call   1402295a0 <setun::VMValue::shr(setun::VMValue const&) const>
   1401262d9:	mov    %rax,0x1c8(%rsp)
   1401262e1:	cmpb   $0x0,0x1040(%rbx)
   1401262e8:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401262ee:	movzbl 0x0(%rbp),%eax
   1401262f2:	lea    0x2acda7(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401262f9:	add    $0x1,%rbp
   1401262fd:	mov    (%rdi,%rax,8),%rax
   140126301:	jmp    *%rax
   140126303:	test   %r12b,%r12b
   140126306:	jne    14012a316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d36>
   14012630c:	sub    $0x8,%rsi
   140126310:	mov    %rsi,%rcx
   140126313:	vzeroupper
   140126316:	call   140229240 <setun::VMValue::neg() const>
   14012631b:	mov    %rax,0x1c8(%rsp)
   140126323:	cmpb   $0x0,0x1040(%rbx)
   14012632a:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126330:	mov    $0x1,%r12d
   140126336:	movzbl 0x0(%rbp),%eax
   14012633a:	lea    0x2acd5f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126341:	add    $0x1,%rbp
   140126345:	mov    (%rdi,%rax,8),%rax
   140126349:	jmp    *%rax
   14012634b:	movabs $0xfffb000000000000,%rax
   140126355:	mov    %rax,0x228(%rsp)
   14012635d:	mov    %rax,0x230(%rsp)
   140126365:	cmp    $0x2,%r12b
   140126369:	jne    140131610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe030>
   14012636f:	mov    0x1c8(%rsp),%rax
   140126377:	lea    0x230(%rsp),%rdx
   14012637f:	lea    0x228(%rsp),%rcx
   140126387:	mov    $0x1,%r12d
   14012638d:	mov    %rax,0x230(%rsp)
   140126395:	mov    0x1d0(%rsp),%rax
   14012639d:	mov    %rax,0x228(%rsp)
   1401263a5:	vzeroupper
   1401263a8:	call   14022a510 <setun::VMValue::bit_and(setun::VMValue const&) const>
   1401263ad:	mov    %rax,0x1c8(%rsp)
   1401263b5:	cmpb   $0x0,0x1040(%rbx)
   1401263bc:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401263c2:	movzbl 0x0(%rbp),%eax
   1401263c6:	lea    0x2accd3(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401263cd:	add    $0x1,%rbp
   1401263d1:	mov    (%rdi,%rax,8),%rax
   1401263d5:	jmp    *%rax
   1401263d7:	movabs $0xfffb000000000000,%rax
   1401263e1:	mov    %rax,0x238(%rsp)
   1401263e9:	mov    %rax,0x240(%rsp)
   1401263f1:	cmp    $0x2,%r12b
   1401263f5:	jne    140131100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb20>
   1401263fb:	mov    0x1c8(%rsp),%rax
   140126403:	lea    0x240(%rsp),%rdx
   14012640b:	lea    0x238(%rsp),%rcx
   140126413:	mov    $0x1,%r12d
   140126419:	mov    %rax,0x240(%rsp)
   140126421:	mov    0x1d0(%rsp),%rax
   140126429:	mov    %rax,0x238(%rsp)
   140126431:	vzeroupper
   140126434:	call   140229c40 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140126439:	mov    %rax,0x1c8(%rsp)
   140126441:	cmpb   $0x0,0x1040(%rbx)
   140126448:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012644e:	movzbl 0x0(%rbp),%eax
   140126452:	lea    0x2acc47(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126459:	add    $0x1,%rbp
   14012645d:	mov    (%rdi,%rax,8),%rax
   140126461:	jmp    *%rax
   140126463:	movabs $0xfffb000000000000,%rax
   14012646d:	mov    %rax,0x218(%rsp)
   140126475:	mov    %rax,0x220(%rsp)
   14012647d:	cmp    $0x2,%r12b
   140126481:	jne    1401315b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfd0>
   140126487:	mov    0x1c8(%rsp),%rax
   14012648f:	lea    0x220(%rsp),%rdx
   140126497:	lea    0x218(%rsp),%rcx
   14012649f:	mov    $0x1,%r12d
   1401264a5:	mov    %rax,0x220(%rsp)
   1401264ad:	mov    0x1d0(%rsp),%rax
   1401264b5:	mov    %rax,0x218(%rsp)
   1401264bd:	vzeroupper
   1401264c0:	call   140228de0 <setun::VMValue::mod(setun::VMValue const&) const>
   1401264c5:	mov    %rax,0x1c8(%rsp)
   1401264cd:	cmpb   $0x0,0x1040(%rbx)
   1401264d4:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401264da:	movzbl 0x0(%rbp),%eax
   1401264de:	lea    0x2acbbb(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401264e5:	add    $0x1,%rbp
   1401264e9:	mov    (%rdi,%rax,8),%rax
   1401264ed:	jmp    *%rax
   1401264ef:	movabs $0xfffb000000000000,%rax
   1401264f9:	mov    %rax,0x278(%rsp)
   140126501:	mov    %rax,0x280(%rsp)
   140126509:	cmp    $0x2,%r12b
   14012650d:	jne    14012d7bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1df>
   140126513:	mov    0x1c8(%rsp),%rax
   14012651b:	mov    0x1d0(%rsp),%rdx
   140126523:	mov    $0x1,%r12d
   140126529:	mov    %rax,0x280(%rsp)
   140126531:	movabs $0xffffffff00000000,%rax
   14012653b:	mov    %rdx,0x278(%rsp)
   140126543:	and    %rdx,%rax
   140126546:	movabs $0xfffd000100000000,%rdx
   140126550:	cmp    %rdx,%rax
   140126553:	je     14012d80f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa22f>
   140126559:	movabs $0xffffffff00000000,%rax
   140126563:	movabs $0xfffd000100000000,%rdx
   14012656d:	and    0x280(%rsp),%rax
   140126575:	cmp    %rdx,%rax
   140126578:	je     14012d80f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa22f>
   14012657e:	lea    0x278(%rsp),%rcx
   140126586:	vzeroupper
   140126589:	call   140229aa0 <setun::VMValue::as_int() const>
   14012658e:	lea    0x280(%rsp),%rcx
   140126596:	mov    %rax,%rdi
   140126599:	call   140229aa0 <setun::VMValue::as_int() const>
   14012659e:	mov    0x278(%rsp),%rcx
   1401265a6:	movabs $0xffff000000000000,%rdx
   1401265b0:	movabs $0xfffa000000000000,%r8
   1401265ba:	and    %rdx,%rcx
   1401265bd:	cmp    %r8,%rcx
   1401265c0:	jne    1401265d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ff3>
   1401265c2:	and    0x280(%rsp),%rdx
   1401265ca:	cmp    %rcx,%rdx
   1401265cd:	je     14012f868 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc288>
   1401265d3:	cmp    %rax,%rdi
   1401265d6:	lea    0x680(%rsp),%rcx
   1401265de:	cmovle %rdi,%rax
   1401265e2:	mov    %rax,%rdx
   1401265e5:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401265ea:	mov    0x680(%rsp),%rax
   1401265f2:	mov    %rax,0x1c8(%rsp)
   1401265fa:	cmpb   $0x0,0x1040(%rbx)
   140126601:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126607:	movzbl 0x0(%rbp),%eax
   14012660b:	lea    0x2aca8e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126612:	add    $0x1,%rbp
   140126616:	mov    (%rdi,%rax,8),%rax
   14012661a:	jmp    *%rax
   14012661c:	movabs $0xfffb000000000000,%rax
   140126626:	mov    %rax,0x288(%rsp)
   14012662e:	mov    %rax,0x290(%rsp)
   140126636:	cmp    $0x2,%r12b
   14012663a:	jne    14012d6fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa11e>
   140126640:	mov    0x1c8(%rsp),%rax
   140126648:	mov    0x1d0(%rsp),%rdx
   140126650:	mov    $0x1,%r12d
   140126656:	mov    %rax,0x290(%rsp)
   14012665e:	movabs $0xffffffff00000000,%rax
   140126668:	mov    %rdx,0x288(%rsp)
   140126670:	and    %rdx,%rax
   140126673:	movabs $0xfffd000100000000,%rdx
   14012667d:	cmp    %rdx,%rax
   140126680:	je     14012d74e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa16e>
   140126686:	movabs $0xffffffff00000000,%rax
   140126690:	movabs $0xfffd000100000000,%rdx
   14012669a:	and    0x290(%rsp),%rax
   1401266a2:	cmp    %rdx,%rax
   1401266a5:	je     14012d74e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa16e>
   1401266ab:	lea    0x288(%rsp),%rcx
   1401266b3:	vzeroupper
   1401266b6:	call   140229aa0 <setun::VMValue::as_int() const>
   1401266bb:	lea    0x290(%rsp),%rcx
   1401266c3:	mov    %rax,%rdi
   1401266c6:	call   140229aa0 <setun::VMValue::as_int() const>
   1401266cb:	mov    0x288(%rsp),%rcx
   1401266d3:	movabs $0xffff000000000000,%rdx
   1401266dd:	movabs $0xfffa000000000000,%r8
   1401266e7:	and    %rdx,%rcx
   1401266ea:	cmp    %r8,%rcx
   1401266ed:	jne    140126700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3120>
   1401266ef:	and    0x290(%rsp),%rdx
   1401266f7:	cmp    %rcx,%rdx
   1401266fa:	je     14012f894 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2b4>
   140126700:	cmp    %rax,%rdi
   140126703:	lea    0x680(%rsp),%rcx
   14012670b:	cmovge %rdi,%rax
   14012670f:	mov    %rax,%rdx
   140126712:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140126717:	mov    0x680(%rsp),%rax
   14012671f:	mov    %rax,0x1c8(%rsp)
   140126727:	cmpb   $0x0,0x1040(%rbx)
   14012672e:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126734:	movzbl 0x0(%rbp),%eax
   140126738:	lea    0x2ac961(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012673f:	add    $0x1,%rbp
   140126743:	mov    (%rdi,%rax,8),%rax
   140126747:	jmp    *%rax
   140126749:	movabs $0xfffb000000000000,%rax
   140126753:	mov    %rax,0x298(%rsp)
   14012675b:	mov    %rax,0x2a0(%rsp)
   140126763:	cmp    $0x2,%r12b
   140126767:	jne    14012c33d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d5d>
   14012676d:	mov    0x1d0(%rsp),%rdx
   140126775:	mov    0x1c8(%rsp),%rax
   14012677d:	movabs $0xffff000000000000,%rcx
   140126787:	mov    $0x1,%r12d
   14012678d:	and    %rdx,%rcx
   140126790:	mov    %rax,0x2a0(%rsp)
   140126798:	mov    %rcx,%r8
   14012679b:	mov    %rdx,0x298(%rsp)
   1401267a3:	movabs $0xfff8000000000000,%rcx
   1401267ad:	cmp    %rcx,%r8
   1401267b0:	je     14012c396 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8db6>
   1401267b6:	movabs $0xfffd000000000000,%rcx
   1401267c0:	cmp    %rcx,%r8
   1401267c3:	je     14012ef40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb960>
   1401267c9:	movabs $0xfffc000000000000,%rcx
   1401267d3:	cmp    %rcx,%rdx
   1401267d6:	je     14012e01c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa3c>
   1401267dc:	movabs $0xfff7ffffffffffff,%rcx
   1401267e6:	cmp    %rdx,%rcx
   1401267e9:	jae    14012e01c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa3c>
   1401267ef:	movabs $0xfffc000000000000,%rcx
   1401267f9:	cmp    %rcx,%rax
   1401267fc:	je     14012e01c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa3c>
   140126802:	movabs $0xfff7ffffffffffff,%rcx
   14012680c:	cmp    %rax,%rcx
   14012680f:	jae    14012e01c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa3c>
   140126815:	movabs $0xffffffff00000000,%rcx
   14012681f:	movabs $0xfffd000000000000,%r8
   140126829:	and    %rcx,%rdx
   14012682c:	cmp    %r8,%rdx
   14012682f:	je     14012efa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9c0>
   140126835:	movabs $0xffff000000000000,%rcx
   14012683f:	and    %rax,%rcx
   140126842:	cmp    %r8,%rcx
   140126845:	je     14012c3e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e07>
   14012684b:	movabs $0xfffd000100000000,%rax
   140126855:	cmp    %rax,%rdx
   140126858:	je     14012c40d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e2d>
   14012685e:	lea    0x298(%rsp),%rcx
   140126866:	vzeroupper
   140126869:	call   140229aa0 <setun::VMValue::as_int() const>
   14012686e:	lea    0x2a0(%rsp),%rcx
   140126876:	mov    %rax,%rdi
   140126879:	call   140229aa0 <setun::VMValue::as_int() const>
   14012687e:	cmp    %rax,%rdi
   140126881:	sete   %dil
   140126885:	movabs $0xfffa000000000000,%rdx
   14012688f:	movzbl %dil,%eax
   140126893:	add    %rdx,%rax
   140126896:	mov    %rax,0x1c8(%rsp)
   14012689e:	cmpb   $0x0,0x1040(%rbx)
   1401268a5:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401268ab:	movzbl 0x0(%rbp),%eax
   1401268af:	lea    0x2ac7ea(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401268b6:	add    $0x1,%rbp
   1401268ba:	mov    (%rdi,%rax,8),%rax
   1401268be:	jmp    *%rax
   1401268c0:	movabs $0xfffb000000000000,%rax
   1401268ca:	mov    %rax,0x2a8(%rsp)
   1401268d2:	mov    %rax,0x2b0(%rsp)
   1401268da:	cmp    $0x2,%r12b
   1401268de:	jne    140130d42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd762>
   1401268e4:	mov    0x1c8(%rsp),%rax
   1401268ec:	mov    $0x1,%r12d
   1401268f2:	movabs $0xfff8000000000000,%rcx
   1401268fc:	mov    %rax,0x2b0(%rsp)
   140126904:	mov    0x1d0(%rsp),%rax
   14012690c:	mov    %rax,%rdx
   14012690f:	mov    %rax,0x2a8(%rsp)
   140126917:	movabs $0xffff000000000000,%rax
   140126921:	and    %rdx,%rax
   140126924:	cmp    %rcx,%rax
   140126927:	je     14012bce1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8701>
   14012692d:	movabs $0xfffd000000000000,%rcx
   140126937:	cmp    %rcx,%rax
   14012693a:	je     14012bcd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f0>
   140126940:	movabs $0xfffc000000000000,%rax
   14012694a:	cmp    %rax,%rdx
   14012694d:	je     14012de35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa855>
   140126953:	movabs $0xfff7ffffffffffff,%rax
   14012695d:	cmp    %rdx,%rax
   140126960:	jae    14012de35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa855>
   140126966:	mov    0x2b0(%rsp),%rax
   14012696e:	movabs $0xfffc000000000000,%rcx
   140126978:	cmp    %rcx,%rax
   14012697b:	je     14012de35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa855>
   140126981:	movabs $0xfff7ffffffffffff,%rcx
   14012698b:	cmp    %rax,%rcx
   14012698e:	jae    14012de35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa855>
   140126994:	movabs $0xffffffff00000000,%rcx
   14012699e:	movabs $0xfffd000000000000,%r8
   1401269a8:	and    %rcx,%rdx
   1401269ab:	cmp    %r8,%rdx
   1401269ae:	je     140131705 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe125>
   1401269b4:	movabs $0xffff000000000000,%rcx
   1401269be:	and    %rax,%rcx
   1401269c1:	cmp    %r8,%rcx
   1401269c4:	je     14013166d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe08d>
   1401269ca:	movabs $0xfffd000100000000,%rax
   1401269d4:	cmp    %rax,%rdx
   1401269d7:	je     140131693 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0b3>
   1401269dd:	lea    0x2a8(%rsp),%rcx
   1401269e5:	vzeroupper
   1401269e8:	call   140229aa0 <setun::VMValue::as_int() const>
   1401269ed:	lea    0x2b0(%rsp),%rcx
   1401269f5:	mov    %rax,%rdi
   1401269f8:	call   140229aa0 <setun::VMValue::as_int() const>
   1401269fd:	cmp    %rax,%rdi
   140126a00:	setne  %al
   140126a03:	movabs $0xfffa000000000000,%rdx
   140126a0d:	movzbl %al,%eax
   140126a10:	add    %rdx,%rax
   140126a13:	mov    %rax,0x1c8(%rsp)
   140126a1b:	cmpb   $0x0,0x1040(%rbx)
   140126a22:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126a28:	movzbl 0x0(%rbp),%eax
   140126a2c:	lea    0x2ac66d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126a33:	add    $0x1,%rbp
   140126a37:	mov    (%rdi,%rax,8),%rax
   140126a3b:	jmp    *%rax
   140126a3d:	movabs $0xfffb000000000000,%rax
   140126a47:	mov    %rax,0x2b8(%rsp)
   140126a4f:	mov    %rax,0x2c0(%rsp)
   140126a57:	cmp    $0x2,%r12b
   140126a5b:	jne    14012c91d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x933d>
   140126a61:	mov    0x1d0(%rsp),%rdx
   140126a69:	mov    0x1c8(%rsp),%rax
   140126a71:	movabs $0xffff000000000000,%rcx
   140126a7b:	mov    $0x1,%r12d
   140126a81:	and    %rdx,%rcx
   140126a84:	mov    %rax,0x2c0(%rsp)
   140126a8c:	mov    %rcx,%r8
   140126a8f:	mov    %rdx,0x2b8(%rsp)
   140126a97:	movabs $0xfff8000000000000,%rcx
   140126aa1:	cmp    %rcx,%r8
   140126aa4:	je     14012c976 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9396>
   140126aaa:	movabs $0xfffd000000000000,%rcx
   140126ab4:	cmp    %rcx,%r8
   140126ab7:	je     14012f24e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc6e>
   140126abd:	movabs $0xfffc000000000000,%rcx
   140126ac7:	cmp    %rcx,%rdx
   140126aca:	je     14012df68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa988>
   140126ad0:	movabs $0xfff7ffffffffffff,%rcx
   140126ada:	cmp    %rdx,%rcx
   140126add:	jae    14012df68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa988>
   140126ae3:	movabs $0xfffc000000000000,%rcx
   140126aed:	cmp    %rcx,%rax
   140126af0:	je     14012df68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa988>
   140126af6:	movabs $0xfff7ffffffffffff,%rcx
   140126b00:	cmp    %rax,%rcx
   140126b03:	jae    14012df68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa988>
   140126b09:	movabs $0xffffffff00000000,%rcx
   140126b13:	movabs $0xfffd000000000000,%r8
   140126b1d:	and    %rcx,%rdx
   140126b20:	cmp    %r8,%rdx
   140126b23:	je     14012f2ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcce>
   140126b29:	movabs $0xffff000000000000,%rcx
   140126b33:	and    %rax,%rcx
   140126b36:	cmp    %r8,%rcx
   140126b39:	je     14012c9c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93e7>
   140126b3f:	movabs $0xfffd000100000000,%rax
   140126b49:	cmp    %rax,%rdx
   140126b4c:	je     14012c9ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x940d>
   140126b52:	lea    0x2b8(%rsp),%rcx
   140126b5a:	vzeroupper
   140126b5d:	call   140229aa0 <setun::VMValue::as_int() const>
   140126b62:	lea    0x2c0(%rsp),%rcx
   140126b6a:	mov    %rax,%rdi
   140126b6d:	call   140229aa0 <setun::VMValue::as_int() const>
   140126b72:	cmp    %rax,%rdi
   140126b75:	setl   %al
   140126b78:	movabs $0xfffa000000000000,%rdx
   140126b82:	movzbl %al,%eax
   140126b85:	add    %rdx,%rax
   140126b88:	mov    %rax,0x1c8(%rsp)
   140126b90:	cmpb   $0x0,0x1040(%rbx)
   140126b97:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126b9d:	movzbl 0x0(%rbp),%eax
   140126ba1:	lea    0x2ac4f8(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ba8:	add    $0x1,%rbp
   140126bac:	mov    (%rdi,%rax,8),%rax
   140126bb0:	jmp    *%rax
   140126bb2:	movabs $0xfffb000000000000,%rax
   140126bbc:	mov    %rax,0x2c8(%rsp)
   140126bc4:	mov    %rax,0x2d0(%rsp)
   140126bcc:	cmp    $0x2,%r12b
   140126bd0:	jne    14012c7fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x921c>
   140126bd6:	mov    0x1d0(%rsp),%rdx
   140126bde:	mov    0x1c8(%rsp),%rax
   140126be6:	movabs $0xffff000000000000,%rcx
   140126bf0:	mov    $0x1,%r12d
   140126bf6:	and    %rdx,%rcx
   140126bf9:	mov    %rax,0x2d0(%rsp)
   140126c01:	mov    %rcx,%r8
   140126c04:	mov    %rdx,0x2c8(%rsp)
   140126c0c:	movabs $0xfff8000000000000,%rcx
   140126c16:	cmp    %rcx,%r8
   140126c19:	je     14012c855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9275>
   140126c1f:	movabs $0xfffd000000000000,%rcx
   140126c29:	cmp    %rcx,%r8
   140126c2c:	je     14012f146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb66>
   140126c32:	movabs $0xfff7ffffffffffff,%rcx
   140126c3c:	cmp    %rdx,%rcx
   140126c3f:	jae    14012dfc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e2>
   140126c45:	movabs $0xfffc000000000000,%rcx
   140126c4f:	cmp    %rcx,%rdx
   140126c52:	je     14012dfc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e2>
   140126c58:	movabs $0xfffc000000000000,%rcx
   140126c62:	cmp    %rcx,%rax
   140126c65:	je     14012dfc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e2>
   140126c6b:	movabs $0xfff7ffffffffffff,%rcx
   140126c75:	cmp    %rax,%rcx
   140126c78:	jae    14012dfc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e2>
   140126c7e:	movabs $0xffffffff00000000,%rcx
   140126c88:	movabs $0xfffd000000000000,%r8
   140126c92:	and    %rcx,%rdx
   140126c95:	cmp    %r8,%rdx
   140126c98:	je     14012f1a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbc6>
   140126c9e:	movabs $0xffff000000000000,%rcx
   140126ca8:	and    %rax,%rcx
   140126cab:	cmp    %r8,%rcx
   140126cae:	je     14012c8a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92c6>
   140126cb4:	movabs $0xfffd000100000000,%rax
   140126cbe:	cmp    %rax,%rdx
   140126cc1:	je     14012c8cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92ec>
   140126cc7:	lea    0x2c8(%rsp),%rcx
   140126ccf:	vzeroupper
   140126cd2:	call   140229aa0 <setun::VMValue::as_int() const>
   140126cd7:	lea    0x2d0(%rsp),%rcx
   140126cdf:	mov    %rax,%rdi
   140126ce2:	call   140229aa0 <setun::VMValue::as_int() const>
   140126ce7:	cmp    %rax,%rdi
   140126cea:	setle  %al
   140126ced:	movabs $0xfffa000000000000,%rdx
   140126cf7:	movzbl %al,%eax
   140126cfa:	add    %rdx,%rax
   140126cfd:	mov    %rax,0x1c8(%rsp)
   140126d05:	cmpb   $0x0,0x1040(%rbx)
   140126d0c:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126d12:	movzbl 0x0(%rbp),%eax
   140126d16:	lea    0x2ac383(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d1d:	add    $0x1,%rbp
   140126d21:	mov    (%rdi,%rax,8),%rax
   140126d25:	jmp    *%rax
   140126d27:	movabs $0xfffb000000000000,%rax
   140126d31:	mov    %rax,0x2d8(%rsp)
   140126d39:	mov    %rax,0x2e0(%rsp)
   140126d41:	cmp    $0x2,%r12b
   140126d45:	jne    14012d155 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b75>
   140126d4b:	mov    0x1d0(%rsp),%rdx
   140126d53:	mov    0x1c8(%rsp),%rax
   140126d5b:	movabs $0xffff000000000000,%rcx
   140126d65:	mov    $0x1,%r12d
   140126d6b:	and    %rdx,%rcx
   140126d6e:	mov    %rax,0x2e0(%rsp)
   140126d76:	mov    %rcx,%r8
   140126d79:	mov    %rdx,0x2d8(%rsp)
   140126d81:	movabs $0xfff8000000000000,%rcx
   140126d8b:	cmp    %rcx,%r8
   140126d8e:	je     14012d1ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bce>
   140126d94:	movabs $0xfffd000000000000,%rcx
   140126d9e:	cmp    %rcx,%r8
   140126da1:	je     14012f03e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba5e>
   140126da7:	movabs $0xfffc000000000000,%rcx
   140126db1:	cmp    %rcx,%rdx
   140126db4:	je     14012e0fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab1a>
   140126dba:	movabs $0xfff7ffffffffffff,%rcx
   140126dc4:	cmp    %rdx,%rcx
   140126dc7:	jae    14012e0fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab1a>
   140126dcd:	movabs $0xfffc000000000000,%rcx
   140126dd7:	cmp    %rcx,%rax
   140126dda:	je     14012e0fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab1a>
   140126de0:	movabs $0xfff7ffffffffffff,%rcx
   140126dea:	cmp    %rax,%rcx
   140126ded:	jae    14012e0fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab1a>
   140126df3:	movabs $0xffffffff00000000,%rcx
   140126dfd:	movabs $0xfffd000000000000,%r8
   140126e07:	and    %rcx,%rdx
   140126e0a:	cmp    %r8,%rdx
   140126e0d:	je     14012f09e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbabe>
   140126e13:	movabs $0xffff000000000000,%rcx
   140126e1d:	and    %rax,%rcx
   140126e20:	cmp    %r8,%rcx
   140126e23:	je     14012d1ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c1f>
   140126e29:	movabs $0xfffd000100000000,%rax
   140126e33:	cmp    %rax,%rdx
   140126e36:	je     14012d225 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c45>
   140126e3c:	lea    0x2d8(%rsp),%rcx
   140126e44:	vzeroupper
   140126e47:	call   140229aa0 <setun::VMValue::as_int() const>
   140126e4c:	lea    0x2e0(%rsp),%rcx
   140126e54:	mov    %rax,%rdi
   140126e57:	call   140229aa0 <setun::VMValue::as_int() const>
   140126e5c:	cmp    %rax,%rdi
   140126e5f:	setg   %al
   140126e62:	movabs $0xfffa000000000000,%rdx
   140126e6c:	movzbl %al,%eax
   140126e6f:	add    %rdx,%rax
   140126e72:	mov    %rax,0x1c8(%rsp)
   140126e7a:	cmpb   $0x0,0x1040(%rbx)
   140126e81:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140126e87:	movzbl 0x0(%rbp),%eax
   140126e8b:	lea    0x2ac20e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126e92:	add    $0x1,%rbp
   140126e96:	mov    (%rdi,%rax,8),%rax
   140126e9a:	jmp    *%rax
   140126e9c:	cmp    $0x1,%r12b
   140126ea0:	jne    14013063b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd05b>
   140126ea6:	xor    %r12d,%r12d
   140126ea9:	cmpb   $0x0,0x1040(%rbx)
   140126eb0:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140126eb6:	movzbl 0x0(%rbp),%eax
   140126eba:	lea    0x2ac1df(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ec1:	add    $0x1,%rbp
   140126ec5:	mov    (%rdi,%rax,8),%rax
   140126ec9:	jmp    *%rax
   140126ecb:	test   %r12b,%r12b
   140126ece:	je     14012a3db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dfb>
   140126ed4:	cmp    $0x1,%r12b
   140126ed8:	je     14012f5d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbff7>
   140126ede:	lea    0x8(%rsi),%r8
   140126ee2:	cmp    0x30(%rsp),%r8
   140126ee7:	jae    140133b53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10573>
   140126eed:	mov    0x1d0(%rsp),%rax
   140126ef5:	mov    %rax,(%rsi)
   140126ef8:	mov    0x1c8(%rsp),%rax
   140126f00:	mov    %r8,%rsi
   140126f03:	mov    %rax,0x1d0(%rsp)
   140126f0b:	cmpb   $0x0,0x1040(%rbx)
   140126f12:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140126f18:	movzbl 0x0(%rbp),%eax
   140126f1c:	lea    0x2ac17d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126f23:	add    $0x1,%rbp
   140126f27:	mov    (%rdi,%rax,8),%rax
   140126f2b:	jmp    *%rax
   140126f2d:	movzwl 0x0(%rbp),%edi
   140126f31:	mov    0x1070(%rbx),%rax
   140126f38:	lea    0x2(%rbp),%r14
   140126f3c:	sub    0x1068(%rbx),%rax
   140126f43:	add    %r13,%rdi
   140126f46:	sar    $0x3,%rax
   140126f4a:	cmp    %rax,%rdi
   140126f4d:	jae    140130488 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcea8>
   140126f53:	test   %r12b,%r12b
   140126f56:	je     14012a52c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f4c>
   140126f5c:	cmp    $0x1,%r12b
   140126f60:	je     14012f55b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf7b>
   140126f66:	lea    0x8(%rsi),%r8
   140126f6a:	cmp    0x30(%rsp),%r8
   140126f6f:	jae    14013412b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b4b>
   140126f75:	mov    0x1d0(%rsp),%rax
   140126f7d:	mov    %rax,(%rsi)
   140126f80:	mov    0x1c8(%rsp),%rax
   140126f88:	mov    %r8,%rsi
   140126f8b:	mov    %rax,0x1d0(%rsp)
   140126f93:	mov    0x1068(%rbx),%rax
   140126f9a:	mov    (%rax,%rdi,8),%rax
   140126f9e:	mov    %rax,0x1c8(%rsp)
   140126fa6:	cmpb   $0x0,0x1040(%rbx)
   140126fad:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140126fb3:	movzbl 0x2(%rbp),%eax
   140126fb7:	lea    0x2ac0e2(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126fbe:	add    $0x3,%rbp
   140126fc2:	mov    (%rdi,%rax,8),%rax
   140126fc6:	jmp    *%rax
   140126fc8:	movzwl 0x0(%rbp),%edi
   140126fcc:	lea    0x2(%rbp),%r14
   140126fd0:	add    %r13,%rdi
   140126fd3:	cmp    0x15268(%rbx),%rdi
   140126fda:	jae    140130cb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6d6>
   140126fe0:	mov    0x1070(%rbx),%rdx
   140126fe7:	sub    0x1068(%rbx),%rdx
   140126fee:	sar    $0x3,%rdx
   140126ff2:	cmp    %rdx,%rdi
   140126ff5:	jae    140130aa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4c0>
   140126ffb:	lea    -0x8(%rsi),%rdx
   140126fff:	lea    0x1c8(%rsp),%rax
   140127007:	test   %r12b,%r12b
   14012700a:	cmove  %rdx,%rax
   14012700e:	mov    0x1068(%rbx),%rdx
   140127015:	mov    (%rax),%rax
   140127018:	mov    %rax,(%rdx,%rdi,8)
   14012701c:	cmpb   $0x0,0x1040(%rbx)
   140127023:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140127029:	movzbl 0x2(%rbp),%eax
   14012702d:	lea    0x2ac06c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127034:	add    $0x3,%rbp
   140127038:	mov    (%rdi,%rax,8),%rax
   14012703c:	jmp    *%rax
   14012703e:	mov    0x1088(%rbx),%rax
   140127045:	movzwl 0x0(%rbp),%edi
   140127049:	lea    0x2(%rbp),%r14
   14012704d:	sub    0x1080(%rbx),%rax
   140127054:	sar    $0x3,%rax
   140127058:	cmp    %rax,%rdi
   14012705b:	jae    140130c30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd650>
   140127061:	test   %r12b,%r12b
   140127064:	je     14012a50e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f2e>
   14012706a:	cmp    $0x1,%r12b
   14012706e:	je     14012f52d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf4d>
   140127074:	lea    0x8(%rsi),%r8
   140127078:	cmp    0x30(%rsp),%r8
   14012707d:	jae    1401332b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcd4>
   140127083:	mov    0x1d0(%rsp),%rax
   14012708b:	mov    %rax,(%rsi)
   14012708e:	mov    0x1c8(%rsp),%rax
   140127096:	mov    %r8,%rsi
   140127099:	mov    %rax,0x1d0(%rsp)
   1401270a1:	mov    0x1080(%rbx),%rax
   1401270a8:	mov    (%rax,%rdi,8),%rax
   1401270ac:	mov    %rax,0x1c8(%rsp)
   1401270b4:	cmpb   $0x0,0x1040(%rbx)
   1401270bb:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   1401270c1:	movzbl 0x2(%rbp),%eax
   1401270c5:	lea    0x2abfd4(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401270cc:	add    $0x3,%rbp
   1401270d0:	mov    (%rdi,%rax,8),%rax
   1401270d4:	jmp    *%rax
   1401270d6:	mov    0x1088(%rbx),%rax
   1401270dd:	movzwl 0x0(%rbp),%edi
   1401270e1:	lea    0x2(%rbp),%r14
   1401270e5:	sub    0x1080(%rbx),%rax
   1401270ec:	sar    $0x3,%rax
   1401270f0:	cmp    %rax,%rdi
   1401270f3:	jae    140130b22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd542>
   1401270f9:	lea    -0x8(%rsi),%rdx
   1401270fd:	lea    0x1c8(%rsp),%rax
   140127105:	test   %r12b,%r12b
   140127108:	cmove  %rdx,%rax
   14012710c:	mov    0x1080(%rbx),%rdx
   140127113:	mov    (%rax),%rax
   140127116:	mov    %rax,(%rdx,%rdi,8)
   14012711a:	cmpb   $0x0,0x1040(%rbx)
   140127121:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140127127:	movzbl 0x2(%rbp),%eax
   14012712b:	lea    0x2abf6e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127132:	add    $0x3,%rbp
   140127136:	mov    (%rdi,%rax,8),%rax
   14012713a:	jmp    *%rax
   14012713c:	movabs $0xfffb000000000000,%rax
   140127146:	mov    %rax,0x1d8(%rsp)
   14012714e:	mov    %rax,0x1e0(%rsp)
   140127156:	cmp    $0x2,%r12b
   14012715a:	jne    14012cb5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957d>
   140127160:	mov    0x1c8(%rsp),%rax
   140127168:	mov    $0x1,%r12d
   14012716e:	movabs $0xffff000000000000,%rdx
   140127178:	movabs $0xfff8000000000000,%rcx
   140127182:	mov    %rax,0x1e0(%rsp)
   14012718a:	mov    0x1d0(%rsp),%rax
   140127192:	and    %rax,%rdx
   140127195:	mov    %rax,0x1d8(%rsp)
   14012719d:	cmp    %rcx,%rdx
   1401271a0:	je     14012cbb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95d0>
   1401271a6:	lea    0x1e0(%rsp),%rdx
   1401271ae:	lea    0x1d8(%rsp),%rcx
   1401271b6:	vzeroupper
   1401271b9:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   1401271be:	mov    %rax,0x1c8(%rsp)
   1401271c6:	cmpb   $0x0,0x1040(%rbx)
   1401271cd:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401271d3:	movzbl 0x0(%rbp),%eax
   1401271d7:	lea    0x2abec2(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401271de:	add    $0x1,%rbp
   1401271e2:	mov    (%rdi,%rax,8),%rax
   1401271e6:	jmp    *%rax
   1401271e8:	movabs $0xfffb000000000000,%rax
   1401271f2:	mov    %rax,0x1e8(%rsp)
   1401271fa:	mov    %rax,0x1f0(%rsp)
   140127202:	cmp    $0x2,%r12b
   140127206:	jne    14012cc77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9697>
   14012720c:	mov    0x1c8(%rsp),%rax
   140127214:	mov    $0x1,%r12d
   14012721a:	movabs $0xffff000000000000,%rdx
   140127224:	movabs $0xfff8000000000000,%rcx
   14012722e:	mov    %rax,0x1f0(%rsp)
   140127236:	mov    0x1d0(%rsp),%rax
   14012723e:	and    %rax,%rdx
   140127241:	mov    %rax,0x1e8(%rsp)
   140127249:	cmp    %rcx,%rdx
   14012724c:	je     14012ccca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ea>
   140127252:	lea    0x1f0(%rsp),%rdx
   14012725a:	lea    0x1e8(%rsp),%rcx
   140127262:	vzeroupper
   140127265:	call   1402297d0 <setun::VMValue::sub(setun::VMValue const&) const>
   14012726a:	mov    %rax,0x1c8(%rsp)
   140127272:	cmpb   $0x0,0x1040(%rbx)
   140127279:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012727f:	movzbl 0x0(%rbp),%eax
   140127283:	lea    0x2abe16(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012728a:	add    $0x1,%rbp
   14012728e:	mov    (%rdi,%rax,8),%rax
   140127292:	jmp    *%rax
   140127294:	movzwl 0x0(%rbp),%edi
   140127298:	lea    0x2(%rbp),%r14
   14012729c:	test   %r12b,%r12b
   14012729f:	je     14012a4f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f13>
   1401272a5:	cmp    $0x1,%r12b
   1401272a9:	je     14012f6fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc11b>
   1401272af:	lea    0x8(%rsi),%r8
   1401272b3:	cmp    0x30(%rsp),%r8
   1401272b8:	jae    140133a5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1047c>
   1401272be:	mov    0x1d0(%rsp),%rdx
   1401272c6:	movzwl %di,%eax
   1401272c9:	mov    %rdx,(%rsi)
   1401272cc:	mov    0x1c8(%rsp),%rdx
   1401272d4:	mov    %r8,%rsi
   1401272d7:	mov    %rdx,0x1d0(%rsp)
   1401272df:	movabs $0xfff9000000000000,%rdx
   1401272e9:	or     %rdx,%rax
   1401272ec:	mov    %rax,0x1c8(%rsp)
   1401272f4:	cmpb   $0x0,0x1040(%rbx)
   1401272fb:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140127301:	movzbl 0x2(%rbp),%eax
   140127305:	lea    0x2abd94(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012730c:	add    $0x3,%rbp
   140127310:	mov    (%rdi,%rax,8),%rax
   140127314:	jmp    *%rax
   140127316:	movabs $0xfffb000000000000,%rax
   140127320:	mov    %rax,0x2e8(%rsp)
   140127328:	mov    %rax,0x2f0(%rsp)
   140127330:	cmp    $0x2,%r12b
   140127334:	jne    14012ca3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x945c>
   14012733a:	mov    0x1d0(%rsp),%rdx
   140127342:	mov    0x1c8(%rsp),%rax
   14012734a:	movabs $0xffff000000000000,%rcx
   140127354:	mov    $0x1,%r12d
   14012735a:	and    %rdx,%rcx
   14012735d:	mov    %rax,0x2f0(%rsp)
   140127365:	mov    %rcx,%r8
   140127368:	mov    %rdx,0x2e8(%rsp)
   140127370:	movabs $0xfff8000000000000,%rcx
   14012737a:	cmp    %rcx,%r8
   14012737d:	je     14012ca95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94b5>
   140127383:	movabs $0xfffd000000000000,%rcx
   14012738d:	cmp    %rcx,%r8
   140127390:	je     14012f356 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd76>
   140127396:	movabs $0xfffc000000000000,%rcx
   1401273a0:	cmp    %rcx,%rdx
   1401273a3:	je     14012df95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b5>
   1401273a9:	movabs $0xfff7ffffffffffff,%rcx
   1401273b3:	cmp    %rdx,%rcx
   1401273b6:	jae    14012df95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b5>
   1401273bc:	movabs $0xfff7ffffffffffff,%rcx
   1401273c6:	cmp    %rax,%rcx
   1401273c9:	jae    14012df95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b5>
   1401273cf:	movabs $0xfffc000000000000,%rcx
   1401273d9:	cmp    %rcx,%rax
   1401273dc:	je     14012df95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b5>
   1401273e2:	movabs $0xffffffff00000000,%rcx
   1401273ec:	movabs $0xfffd000000000000,%r8
   1401273f6:	and    %rcx,%rdx
   1401273f9:	cmp    %r8,%rdx
   1401273fc:	je     14012f3b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdd6>
   140127402:	movabs $0xffff000000000000,%rcx
   14012740c:	and    %rax,%rcx
   14012740f:	cmp    %r8,%rcx
   140127412:	je     14012cae6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9506>
   140127418:	movabs $0xfffd000100000000,%rax
   140127422:	cmp    %rax,%rdx
   140127425:	je     14012cb0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x952c>
   14012742b:	lea    0x2e8(%rsp),%rcx
   140127433:	vzeroupper
   140127436:	call   140229aa0 <setun::VMValue::as_int() const>
   14012743b:	lea    0x2f0(%rsp),%rcx
   140127443:	mov    %rax,%rdi
   140127446:	call   140229aa0 <setun::VMValue::as_int() const>
   14012744b:	cmp    %rax,%rdi
   14012744e:	setge  %al
   140127451:	movabs $0xfffa000000000000,%rdx
   14012745b:	movzbl %al,%eax
   14012745e:	add    %rdx,%rax
   140127461:	mov    %rax,0x1c8(%rsp)
   140127469:	cmpb   $0x0,0x1040(%rbx)
   140127470:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140127476:	movzbl 0x0(%rbp),%eax
   14012747a:	lea    0x2abc1f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127481:	add    $0x1,%rbp
   140127485:	mov    (%rdi,%rax,8),%rax
   140127489:	jmp    *%rax
   14012748b:	movzwl 0x0(%rbp),%edi
   14012748f:	lea    0x2(%rbp),%r14
   140127493:	add    %r13,%rdi
   140127496:	cmp    0x15268(%rbx),%rdi
   14012749d:	jae    1401305e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd008>
   1401274a3:	mov    0x1070(%rbx),%rdx
   1401274aa:	sub    0x1068(%rbx),%rdx
   1401274b1:	sar    $0x3,%rdx
   1401274b5:	cmp    %rdx,%rdi
   1401274b8:	jae    140130470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce90>
   1401274be:	mov    0x1068(%rbx),%rax
   1401274c5:	cmp    $0x1,%r12b
   1401274c9:	jne    140130455 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce75>
   1401274cf:	mov    0x1c8(%rsp),%rdx
   1401274d7:	xor    %r12d,%r12d
   1401274da:	mov    %rdx,(%rax,%rdi,8)
   1401274de:	cmpb   $0x0,0x1040(%rbx)
   1401274e5:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   1401274eb:	movzbl 0x2(%rbp),%eax
   1401274ef:	lea    0x2abbaa(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274f6:	add    $0x3,%rbp
   1401274fa:	mov    (%rdi,%rax,8),%rax
   1401274fe:	jmp    *%rax
   140127500:	movzwl 0x0(%rbp),%r9d
   140127505:	movzwl 0x2(%rbp),%eax
   140127509:	lea    0x4(%rbp),%r14
   14012750d:	mov    0x1068(%rbx),%rdi
   140127514:	test   %r12b,%r12b
   140127517:	jne    140130407 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce27>
   14012751d:	movzwl %r9w,%edx
   140127521:	add    %r13,%rdx
   140127524:	mov    (%rdi,%rdx,8),%rdx
   140127528:	mov    %rdx,0x1d0(%rsp)
   140127530:	add    %r13,%rax
   140127533:	mov    (%rdi,%rax,8),%rax
   140127537:	mov    %rax,0x1c8(%rsp)
   14012753f:	cmpb   $0x0,0x1040(%rbx)
   140127546:	je     1401303f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce18>
   14012754c:	movzbl 0x4(%rbp),%eax
   140127550:	mov    $0x2,%r12d
   140127556:	add    $0x5,%rbp
   14012755a:	lea    0x2abb3f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127561:	mov    (%rdi,%rax,8),%rax
   140127565:	jmp    *%rax
   140127567:	movzwl 0x4(%rbp),%r8d
   14012756c:	movzwl 0x0(%rbp),%eax
   140127570:	lea    0x6(%rbp),%r14
   140127574:	movzwl 0x2(%rbp),%r9d
   140127579:	lea    (%r8,%r13,1),%rdi
   14012757d:	cmp    0x15268(%rbx),%rdi
   140127584:	jae    140130580 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfa0>
   14012758a:	mov    0x1070(%rbx),%rdx
   140127591:	sub    0x1068(%rbx),%rdx
   140127598:	sar    $0x3,%rdx
   14012759c:	cmp    %rdx,%rdi
   14012759f:	jae    14012ce75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9895>
   1401275a5:	mov    0x1068(%rbx),%rdx
   1401275ac:	movzwl %ax,%eax
   1401275af:	movabs $0xfff8000000000000,%r10
   1401275b9:	add    %r13,%rax
   1401275bc:	lea    (%rdx,%rax,8),%rcx
   1401275c0:	movzwl %r9w,%eax
   1401275c4:	add    %r13,%rax
   1401275c7:	mov    (%rcx),%r9
   1401275ca:	lea    (%rdx,%rax,8),%r11
   1401275ce:	movabs $0xffff000000000000,%rax
   1401275d8:	and    %r9,%rax
   1401275db:	cmp    %r10,%rax
   1401275de:	je     14012ced3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98f3>
   1401275e4:	vzeroupper
   1401275e7:	mov    %r11,%rdx
   1401275ea:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   1401275ef:	mov    0x1068(%rbx),%rdx
   1401275f6:	mov    %rax,(%rdx,%rdi,8)
   1401275fa:	cmpb   $0x0,0x1040(%rbx)
   140127601:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140127607:	movzbl 0x6(%rbp),%eax
   14012760b:	lea    0x2aba8e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127612:	add    $0x7,%rbp
   140127616:	mov    (%rdi,%rax,8),%rax
   14012761a:	jmp    *%rax
   14012761c:	movzwl 0x6(%rbp),%edx
   140127620:	movzwl 0x0(%rbp),%r9d
   140127625:	lea    0x8(%rbp),%r14
   140127629:	movzwl 0x2(%rbp),%r8d
   14012762e:	movzwl 0x4(%rbp),%eax
   140127632:	lea    (%rdx,%r13,1),%rdi
   140127636:	cmp    0x15268(%rbx),%rdi
   14012763d:	jae    140130380 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcda0>
   140127643:	mov    0x1070(%rbx),%rdx
   14012764a:	sub    0x1068(%rbx),%rdx
   140127651:	sar    $0x3,%rdx
   140127655:	cmp    %rdx,%rdi
   140127658:	jae    1401302f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd12>
   14012765e:	mov    0x1068(%rbx),%rcx
   140127665:	movzwl %r9w,%edx
   140127669:	movzwl %ax,%eax
   14012766c:	add    %r13,%rdx
   14012766f:	add    %r13,%rax
   140127672:	lea    (%rcx,%rdx,8),%r11
   140127676:	movzwl %r8w,%edx
   14012767a:	lea    (%rcx,%rax,8),%rax
   14012767e:	mov    (%r11),%r9
   140127681:	add    %r13,%rdx
   140127684:	mov    %rax,0x60(%rsp)
   140127689:	movabs $0xffff000000000000,%rax
   140127693:	lea    (%rcx,%rdx,8),%rdx
   140127697:	mov    %rdx,0x40(%rsp)
   14012769c:	and    %r9,%rax
   14012769f:	movabs $0xfff8000000000000,%rdx
   1401276a9:	cmp    %rdx,%rax
   1401276ac:	jne    14012db59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa579>
   1401276b2:	movabs $0xffff000000000000,%r8
   1401276bc:	mov    0x40(%rsp),%rax
   1401276c1:	movabs $0xfff8000000000000,%r10
   1401276cb:	mov    (%rax),%rdx
   1401276ce:	mov    %rdx,%rax
   1401276d1:	and    %r8,%rax
   1401276d4:	cmp    %r10,%rax
   1401276d7:	jne    14012da20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa440>
   1401276dd:	mov    0x60(%rsp),%r10
   1401276e2:	mov    (%r10),%r10
   1401276e5:	and    %r10,%r8
   1401276e8:	cmp    %rax,%r8
   1401276eb:	jne    14012da20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa440>
   1401276f1:	shl    $0x10,%rdx
   1401276f5:	mov    %r9,%rax
   1401276f8:	shl    $0x10,%r10
   1401276fc:	shl    $0x10,%rax
   140127700:	sar    $0x10,%rdx
   140127704:	sar    $0x10,%rax
   140127708:	sar    $0x10,%r10
   14012770c:	imul   %rdx,%rax
   140127710:	movabs $0x800000000000,%rdx
   14012771a:	add    %r10,%rax
   14012771d:	movabs $0xffffffffffff,%r10
   140127727:	add    %rax,%rdx
   14012772a:	cmp    %rdx,%r10
   14012772d:	jb     14012da20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa440>
   140127733:	and    %r10,%rax
   140127736:	or     %r8,%rax
   140127739:	mov    %rax,(%rcx,%rdi,8)
   14012773d:	cmpb   $0x0,0x1040(%rbx)
   140127744:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   14012774a:	movzbl 0x8(%rbp),%eax
   14012774e:	lea    0x2ab94b(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127755:	add    $0x9,%rbp
   140127759:	mov    (%rdi,%rax,8),%rax
   14012775d:	jmp    *%rax
   14012775f:	movzwl 0x0(%rbp),%edx
   140127763:	mov    0xb8(%r15),%rax
   14012776a:	lea    0x2(%rbp),%r14
   14012776e:	lea    (%rax,%rdx,8),%rdi
   140127772:	cmp    $0x2,%r12b
   140127776:	jne    140131080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaa0>
   14012777c:	mov    0x1d0(%rsp),%rdx
   140127784:	movabs $0xffff000000000000,%rax
   14012778e:	movabs $0xfffd000000000000,%rcx
   140127798:	and    %rdx,%rax
   14012779b:	cmp    %rcx,%rax
   14012779e:	je     14012d5bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fdd>
   1401277a4:	mov    0x1c8(%rsp),%rax
   1401277ac:	xor    %r12d,%r12d
   1401277af:	mov    %rax,0x3f0(%rsp)
   1401277b7:	cmpb   $0x0,0x1040(%rbx)
   1401277be:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   1401277c4:	movzbl 0x2(%rbp),%eax
   1401277c8:	lea    0x2ab8d1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401277cf:	add    $0x3,%rbp
   1401277d3:	mov    (%rdi,%rax,8),%rax
   1401277d7:	jmp    *%rax
   1401277d9:	lea    0x3(%rbp),%rax
   1401277dd:	movzbl 0x2(%rbp),%r14d
   1401277e2:	mov    %rax,0x40(%rsp)
   1401277e7:	movzwl 0x0(%rbp),%eax
   1401277eb:	shl    $0x4,%rax
   1401277ef:	add    0xd0(%r15),%rax
   1401277f6:	mov    %rax,%rdi
   1401277f9:	test   %r14b,%r14b
   1401277fc:	je     14012a476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e96>
   140127802:	cmp    $0x1,%r14b
   140127806:	je     14012f507 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf27>
   14012780c:	test   %r12b,%r12b
   14012780f:	jne    14012f5b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfd8>
   140127815:	movzbl %r14b,%eax
   140127819:	mov    %rsi,%rdx
   14012781c:	shl    $0x3,%rax
   140127820:	sub    %rax,%rdx
   140127823:	movabs $0xffffffff00000000,%rax
   14012782d:	mov    -0x8(%rdx),%rcx
   140127831:	movabs $0xfffd000200000000,%rdx
   14012783b:	and    %rcx,%rax
   14012783e:	cmp    %rdx,%rax
   140127841:	je     14012fde7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc807>
   140127847:	vzeroupper
   14012784a:	mov    0x1048(%rbx),%rdx
   140127851:	mov    0x1050(%rbx),%rax
   140127858:	mov    %rsi,%rcx
   14012785b:	sub    %rdx,%rcx
   14012785e:	mov    0x40(%rsp),%r8
   140127863:	sub    %rdx,%rax
   140127866:	sub    0x38(%rsp),%r8
   14012786b:	mov    %rcx,%rsi
   14012786e:	mov    %r8,0x1038(%rbx)
   140127875:	sar    $0x3,%rsi
   140127879:	cmp    %rcx,%rax
   14012787c:	jb     14012e383 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xada3>
   140127882:	movb   $0x0,0x153a0(%rbx)
   140127889:	movzwl 0xa(%rdi),%r8d
   14012788e:	movzbl %r14b,%r9d
   140127892:	mov    %r15,%rdx
   140127895:	vmovdqa 0x2472e3(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012789d:	mov    %rsi,0x1060(%rbx)
   1401278a4:	mov    %rbx,%rcx
   1401278a7:	vmovdqa %xmm0,0x15390(%rbx)
   1401278af:	call   14011e490 <setun::VM::handle_invoke_method_direct(setun::Chunk const&, unsigned short, unsigned char)>
   1401278b4:	mov    0x1060(%rbx),%rax
   1401278bb:	mov    0x1048(%rbx),%rdx
   1401278c2:	mov    0x150c0(%rbx),%r13
   1401278c9:	mov    0x38(%rsp),%r14
   1401278ce:	lea    (%rdx,%rax,8),%rsi
   1401278d2:	add    0x1038(%rbx),%r14
   1401278d9:	test   %r13,%r13
   1401278dc:	je     1401278eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x430b>
   1401278de:	lea    -0x5(%r13,%r13,4),%rax
   1401278e3:	mov    0x10c8(%rbx,%rax,8),%r13
   1401278eb:	cmpb   $0x0,0x1040(%rbx)
   1401278f2:	mov    0x1050(%rbx),%rax
   1401278f9:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401278ff:	mov    %rax,0x30(%rsp)
   140127904:	movzbl (%r14),%eax
   140127908:	lea    0x1(%r14),%rbp
   14012790c:	xor    %r12d,%r12d
   14012790f:	lea    0x2ab78a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127916:	mov    (%rdi,%rax,8),%rax
   14012791a:	jmp    *%rax
   14012791c:	movzwl 0x4(%rbp),%r8d
   140127921:	movzwl 0x0(%rbp),%edi
   140127925:	lea    0x6(%rbp),%r14
   140127929:	movzwl 0x2(%rbp),%r9d
   14012792e:	add    %r13,%r8
   140127931:	cmp    0x15268(%rbx),%r8
   140127938:	jae    140130510 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf30>
   14012793e:	mov    0x1070(%rbx),%rdx
   140127945:	sub    0x1068(%rbx),%rdx
   14012794c:	sar    $0x3,%rdx
   140127950:	cmp    %rdx,%r8
   140127953:	jae    1401304a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcec0>
   140127959:	mov    0x1068(%rbx),%rdx
   140127960:	movzwl %di,%eax
   140127963:	movabs $0xffff000000000000,%rcx
   14012796d:	movabs $0xfff8000000000000,%r10
   140127977:	add    %r13,%rax
   14012797a:	lea    (%rdx,%rax,8),%r11
   14012797e:	mov    (%r11),%rax
   140127981:	and    %rax,%rcx
   140127984:	cmp    %r10,%rcx
   140127987:	jne    14012dd66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa786>
   14012798d:	shl    $0x10,%rax
   140127991:	movswq %r9w,%r9
   140127995:	movabs $0x800000000000,%rcx
   14012799f:	movabs $0xffffffffffff,%r10
   1401279a9:	sar    $0x10,%rax
   1401279ad:	add    %r9,%rax
   1401279b0:	add    %rax,%rcx
   1401279b3:	cmp    %rcx,%r10
   1401279b6:	jb     14012ddcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7eb>
   1401279bc:	movabs $0xfff8000000000000,%rcx
   1401279c6:	and    %r10,%rax
   1401279c9:	or     %rcx,%rax
   1401279cc:	mov    %rax,(%rdx,%r8,8)
   1401279d0:	cmpb   $0x0,0x1040(%rbx)
   1401279d7:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   1401279dd:	movzbl 0x6(%rbp),%eax
   1401279e1:	lea    0x2ab6b8(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401279e8:	add    $0x7,%rbp
   1401279ec:	mov    (%rdi,%rax,8),%rax
   1401279f0:	jmp    *%rax
   1401279f2:	movzwl 0x8(%rbp),%eax
   1401279f6:	movzwl 0x0(%rbp),%edx
   1401279fa:	lea    0xa(%rbp),%r14
   1401279fe:	movabs $0xfffd000300000000,%r8
   140127a08:	movzwl 0x2(%rbp),%r9d
   140127a0d:	movzwl 0x4(%rbp),%r11d
   140127a12:	mov    %ax,0x40(%rsp)
   140127a17:	mov    0x1068(%rbx),%rax
   140127a1e:	add    %r13,%rdx
   140127a21:	movzwl 0x6(%rbp),%r10d
   140127a26:	lea    (%rax,%rdx,8),%rdi
   140127a2a:	movabs $0xffffffff00000000,%rdx
   140127a34:	mov    (%rdi),%rcx
   140127a37:	and    %rdx,%rcx
   140127a3a:	cmp    %r8,%rcx
   140127a3d:	je     14012ff4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc96f>
   140127a43:	cmpb   $0x0,0x1040(%rbx)
   140127a4a:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140127a50:	movzbl 0xa(%rbp),%eax
   140127a54:	lea    0x2ab645(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a5b:	add    $0xb,%rbp
   140127a5f:	mov    (%rdi,%rax,8),%rax
   140127a63:	jmp    *%rax
   140127a65:	mov    0x1068(%rbx),%rax
   140127a6c:	cmp    $0x1,%r12b
   140127a70:	jne    140131050 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda70>
   140127a76:	mov    0x1c8(%rsp),%rdx
   140127a7e:	xor    %r12d,%r12d
   140127a81:	mov    %rdx,(%rax,%r13,8)
   140127a85:	cmpb   $0x0,0x1040(%rbx)
   140127a8c:	je     14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140127a92:	movzbl 0x0(%rbp),%eax
   140127a96:	lea    0x2ab603(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a9d:	add    $0x1,%rbp
   140127aa1:	mov    (%rdi,%rax,8),%rax
   140127aa5:	jmp    *%rax
   140127aa7:	mov    0x1068(%rbx),%rax
   140127aae:	cmp    $0x1,%r12b
   140127ab2:	jne    1401310d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaf0>
   140127ab8:	mov    0x1c8(%rsp),%rdx
   140127ac0:	xor    %r12d,%r12d
   140127ac3:	mov    %rdx,0x8(%rax,%r13,8)
   140127ac8:	cmpb   $0x0,0x1040(%rbx)
   140127acf:	je     14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140127ad5:	movzbl 0x0(%rbp),%eax
   140127ad9:	lea    0x2ab5c0(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127ae0:	add    $0x1,%rbp
   140127ae4:	mov    (%rdi,%rax,8),%rax
   140127ae8:	jmp    *%rax
   140127aea:	mov    0x1068(%rbx),%rax
   140127af1:	cmp    $0x1,%r12b
   140127af5:	jne    140130bf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd619>
   140127afb:	mov    0x1c8(%rsp),%rdx
   140127b03:	xor    %r12d,%r12d
   140127b06:	mov    %rdx,0x10(%rax,%r13,8)
   140127b0b:	cmpb   $0x0,0x1040(%rbx)
   140127b12:	je     14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140127b18:	movzbl 0x0(%rbp),%eax
   140127b1c:	lea    0x2ab57d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127b23:	add    $0x1,%rbp
   140127b27:	mov    (%rdi,%rax,8),%rax
   140127b2b:	jmp    *%rax
   140127b2d:	mov    0x1068(%rbx),%rax
   140127b34:	cmp    $0x1,%r12b
   140127b38:	jne    140131530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf50>
   140127b3e:	mov    0x1c8(%rsp),%rdx
   140127b46:	xor    %r12d,%r12d
   140127b49:	mov    %rdx,0x18(%rax,%r13,8)
   140127b4e:	cmpb   $0x0,0x1040(%rbx)
   140127b55:	je     14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140127b5b:	movzbl 0x0(%rbp),%eax
   140127b5f:	lea    0x2ab53a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127b66:	add    $0x1,%rbp
   140127b6a:	mov    (%rdi,%rax,8),%rax
   140127b6e:	jmp    *%rax
   140127b70:	mov    0x1068(%rbx),%rax
   140127b77:	test   %r12b,%r12b
   140127b7a:	je     140130ec8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8e8>
   140127b80:	mov    0x1c8(%rsp),%rdx
   140127b88:	mov    %rdx,0x8(%rax,%r13,8)
   140127b8d:	cmpb   $0x0,0x1040(%rbx)
   140127b94:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140127b9a:	movzbl 0x0(%rbp),%eax
   140127b9e:	lea    0x2ab4fb(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127ba5:	add    $0x1,%rbp
   140127ba9:	mov    (%rdi,%rax,8),%rax
   140127bad:	jmp    *%rax
   140127baf:	mov    0x1068(%rbx),%rax
   140127bb6:	test   %r12b,%r12b
   140127bb9:	je     14013150c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf2c>
   140127bbf:	mov    0x1c8(%rsp),%rdx
   140127bc7:	mov    %rdx,0x10(%rax,%r13,8)
   140127bcc:	cmpb   $0x0,0x1040(%rbx)
   140127bd3:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140127bd9:	movzbl 0x0(%rbp),%eax
   140127bdd:	lea    0x2ab4bc(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127be4:	add    $0x1,%rbp
   140127be8:	mov    (%rdi,%rax,8),%rax
   140127bec:	jmp    *%rax
   140127bee:	mov    0x1068(%rbx),%rax
   140127bf5:	test   %r12b,%r12b
   140127bf8:	je     14012a2e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d06>
   140127bfe:	mov    0x1c8(%rsp),%rdx
   140127c06:	mov    %rdx,0x18(%rax,%r13,8)
   140127c0b:	cmpb   $0x0,0x1040(%rbx)
   140127c12:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140127c18:	movzbl 0x0(%rbp),%eax
   140127c1c:	lea    0x2ab47d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127c23:	add    $0x1,%rbp
   140127c27:	mov    (%rdi,%rax,8),%rax
   140127c2b:	jmp    *%rax
   140127c2d:	movzwl 0x0(%rbp),%eax
   140127c31:	movzwl 0x2(%rbp),%r8d
   140127c36:	lea    0x4(%rbp),%r14
   140127c3a:	lea    (%rax,%r13,1),%rdi
   140127c3e:	cmp    0x15268(%rbx),%rdi
   140127c45:	jae    140131560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf80>
   140127c4b:	mov    0x1068(%rbx),%rax
   140127c52:	movabs $0xffff000000000000,%rdx
   140127c5c:	movabs $0xfff8000000000000,%rcx
   140127c66:	lea    (%rax,%rdi,8),%rdi
   140127c6a:	mov    (%rdi),%rax
   140127c6d:	and    %rax,%rdx
   140127c70:	cmp    %rcx,%rdx
   140127c73:	jne    14012db00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa520>
   140127c79:	shl    $0x10,%rax
   140127c7d:	movswq %r8w,%r8
   140127c81:	movabs $0x800000000000,%rcx
   140127c8b:	movabs $0xffffffffffff,%r9
   140127c95:	sar    $0x10,%rax
   140127c99:	add    %r8,%rax
   140127c9c:	add    %rax,%rcx
   140127c9f:	cmp    %rcx,%r9
   140127ca2:	jb     14012db04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa524>
   140127ca8:	and    %r9,%rax
   140127cab:	or     %rdx,%rax
   140127cae:	mov    %rax,(%rdi)
   140127cb1:	cmpb   $0x0,0x1040(%rbx)
   140127cb8:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140127cbe:	movzbl 0x4(%rbp),%eax
   140127cc2:	lea    0x2ab3d7(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127cc9:	add    $0x5,%rbp
   140127ccd:	mov    (%rdi,%rax,8),%rax
   140127cd1:	jmp    *%rax
   140127cd3:	movabs $0xfffb000000000000,%rax
   140127cdd:	mov    %rax,0x330(%rsp)
   140127ce5:	mov    %rax,0x338(%rsp)
   140127ced:	cmp    $0x2,%r12b
   140127cf1:	jne    140130d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7b5>
   140127cf7:	mov    0x1c8(%rsp),%rax
   140127cff:	movabs $0xffffffff00000000,%rdx
   140127d09:	movabs $0xfffd000300000000,%rcx
   140127d13:	mov    %rax,0x338(%rsp)
   140127d1b:	mov    0x1d0(%rsp),%rax
   140127d23:	and    %rax,%rdx
   140127d26:	mov    %rax,0x330(%rsp)
   140127d2e:	cmp    %rcx,%rdx
   140127d31:	je     14012d880 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2a0>
   140127d37:	movabs $0xffff000000000000,%rdx
   140127d41:	movabs $0xfffd000000000000,%rcx
   140127d4b:	and    %rax,%rdx
   140127d4e:	cmp    %rcx,%rdx
   140127d51:	je     14012e8e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb300>
   140127d57:	movabs $0xfff8000000000000,%rax
   140127d61:	mov    %rax,0x1c8(%rsp)
   140127d69:	mov    $0x1,%r12d
   140127d6f:	cmpb   $0x0,0x1040(%rbx)
   140127d76:	je     14013115d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb7d>
   140127d7c:	movzbl 0x0(%rbp),%eax
   140127d80:	lea    0x2ab319(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d87:	add    $0x1,%rbp
   140127d8b:	mov    (%rdi,%rax,8),%rax
   140127d8f:	jmp    *%rax
   140127d91:	movabs $0xfffb000000000000,%rax
   140127d9b:	mov    %rax,0x340(%rsp)
   140127da3:	mov    %rax,0x348(%rsp)
   140127dab:	cmp    $0x1,%r12b
   140127daf:	jne    14013069c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0bc>
   140127db5:	mov    0x1c8(%rsp),%rax
   140127dbd:	xor    %r12d,%r12d
   140127dc0:	mov    %rax,0x340(%rsp)
   140127dc8:	mov    -0x8(%rsi),%rdx
   140127dcc:	mov    %rsi,%rax
   140127dcf:	sub    $0x10,%rsi
   140127dd3:	mov    %rdx,0x348(%rsp)
   140127ddb:	mov    -0x10(%rax),%rdx
   140127ddf:	movabs $0xffff000000000000,%r8
   140127de9:	mov    %rdx,%rcx
   140127dec:	movabs $0xfffd000000000000,%rax
   140127df6:	and    %r8,%rcx
   140127df9:	cmp    %rax,%rcx
   140127dfc:	je     14012b5fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x801a>
   140127e02:	cmpb   $0x0,0x1040(%rbx)
   140127e09:	je     1401302d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf6>
   140127e0f:	movzbl 0x0(%rbp),%eax
   140127e13:	lea    0x2ab286(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127e1a:	add    $0x1,%rbp
   140127e1e:	mov    (%rdi,%rax,8),%rax
   140127e22:	jmp    *%rax
   140127e24:	movzwl 0x2(%rbp),%eax
   140127e28:	movzwl 0x6(%rbp),%ecx
   140127e2c:	lea    0x8(%rbp),%r14
   140127e30:	mov    0x1068(%rbx),%rdx
   140127e37:	movzwl 0x4(%rbp),%edi
   140127e3b:	mov    %ax,0x40(%rsp)
   140127e40:	movzwl 0x0(%rbp),%eax
   140127e44:	mov    %cx,0x60(%rsp)
   140127e49:	add    %r13,%rax
   140127e4c:	lea    (%rdx,%rax,8),%rcx
   140127e50:	vzeroupper
   140127e53:	call   140229aa0 <setun::VMValue::as_int() const>
   140127e58:	mov    0x1068(%rbx),%rdx
   140127e5f:	mov    %rax,%rbp
   140127e62:	movzwl 0x40(%rsp),%eax
   140127e67:	add    %r13,%rax
   140127e6a:	lea    (%rdx,%rax,8),%rcx
   140127e6e:	call   140229aa0 <setun::VMValue::as_int() const>
   140127e73:	mov    0x1068(%rbx),%rdx
   140127e7a:	mov    %rax,0x40(%rsp)
   140127e7f:	movzwl %di,%eax
   140127e82:	add    %r13,%rax
   140127e85:	lea    (%rdx,%rax,8),%rcx
   140127e89:	call   140229aa0 <setun::VMValue::as_int() const>
   140127e8e:	test   %rax,%rax
   140127e91:	je     140130fbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9dd>
   140127e97:	jle    14012a874 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7294>
   140127e9d:	cmp    0x40(%rsp),%rbp
   140127ea2:	jl     140127ead <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48cd>
   140127ea4:	movswq 0x60(%rsp),%rax
   140127eaa:	add    %rax,%r14
   140127ead:	cmpb   $0x0,0x1040(%rbx)
   140127eb4:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140127eba:	movzbl (%r14),%eax
   140127ebe:	lea    0x2ab1db(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127ec5:	lea    0x1(%r14),%rbp
   140127ec9:	jmp    *(%rdi,%rax,8)
   140127ecc:	movabs $0xfffb000000000000,%rax
   140127ed6:	mov    %rax,0x358(%rsp)
   140127ede:	mov    %rax,0x360(%rsp)
   140127ee6:	cmp    $0x2,%r12b
   140127eea:	jne    14012cd91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97b1>
   140127ef0:	mov    0x1c8(%rsp),%rax
   140127ef8:	mov    0x1d0(%rsp),%rdx
   140127f00:	movabs $0xfff8000000000000,%rcx
   140127f0a:	mov    $0x1,%r12d
   140127f10:	mov    %rax,0x360(%rsp)
   140127f18:	movabs $0xffff000000000000,%rax
   140127f22:	and    %rdx,%rax
   140127f25:	mov    %rdx,0x358(%rsp)
   140127f2d:	cmp    %rcx,%rax
   140127f30:	je     14012cde4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9804>
   140127f36:	movb   $0x20,-0x1(%rbp)
   140127f3a:	lea    0x360(%rsp),%rdx
   140127f42:	lea    0x358(%rsp),%rcx
   140127f4a:	vzeroupper
   140127f4d:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   140127f52:	mov    %rax,0x1c8(%rsp)
   140127f5a:	cmpb   $0x0,0x1040(%rbx)
   140127f61:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140127f67:	movzbl 0x0(%rbp),%eax
   140127f6b:	lea    0x2ab12e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127f72:	add    $0x1,%rbp
   140127f76:	mov    (%rdi,%rax,8),%rax
   140127f7a:	jmp    *%rax
   140127f7c:	movabs $0xfffb000000000000,%rax
   140127f86:	mov    %rax,0x368(%rsp)
   140127f8e:	mov    %rax,0x370(%rsp)
   140127f96:	cmp    $0x2,%r12b
   140127f9a:	jne    14012cf5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x997c>
   140127fa0:	mov    0x1c8(%rsp),%rax
   140127fa8:	mov    $0x1,%r12d
   140127fae:	movabs $0xffff000000000000,%rdx
   140127fb8:	movabs $0xfff8000000000000,%rcx
   140127fc2:	mov    %rax,0x370(%rsp)
   140127fca:	mov    0x1d0(%rsp),%rax
   140127fd2:	and    %rax,%rdx
   140127fd5:	mov    %rax,0x368(%rsp)
   140127fdd:	cmp    %rcx,%rdx
   140127fe0:	je     14012cfaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99cf>
   140127fe6:	movb   $0x21,-0x1(%rbp)
   140127fea:	lea    0x370(%rsp),%rdx
   140127ff2:	lea    0x368(%rsp),%rcx
   140127ffa:	vzeroupper
   140127ffd:	call   1402297d0 <setun::VMValue::sub(setun::VMValue const&) const>
   140128002:	mov    %rax,0x1c8(%rsp)
   14012800a:	cmpb   $0x0,0x1040(%rbx)
   140128011:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140128017:	movzbl 0x0(%rbp),%eax
   14012801b:	lea    0x2ab07e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128022:	add    $0x1,%rbp
   140128026:	mov    (%rdi,%rax,8),%rax
   14012802a:	jmp    *%rax
   14012802c:	movabs $0xfffb000000000000,%rax
   140128036:	mov    %rax,0x378(%rsp)
   14012803e:	mov    %rax,0x380(%rsp)
   140128046:	cmp    $0x2,%r12b
   14012804a:	jne    14012d341 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d61>
   140128050:	mov    0x1c8(%rsp),%rax
   140128058:	mov    0x1d0(%rsp),%rdx
   140128060:	movabs $0xfff8000000000000,%rcx
   14012806a:	mov    $0x1,%r12d
   140128070:	mov    %rax,0x380(%rsp)
   140128078:	movabs $0xffff000000000000,%rax
   140128082:	and    %rdx,%rax
   140128085:	mov    %rdx,0x378(%rsp)
   14012808d:	cmp    %rcx,%rax
   140128090:	je     14012d394 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9db4>
   140128096:	movb   $0x22,-0x1(%rbp)
   14012809a:	lea    0x380(%rsp),%rdx
   1401280a2:	lea    0x378(%rsp),%rcx
   1401280aa:	vzeroupper
   1401280ad:	call   140228f80 <setun::VMValue::mul(setun::VMValue const&) const>
   1401280b2:	mov    %rax,0x1c8(%rsp)
   1401280ba:	cmpb   $0x0,0x1040(%rbx)
   1401280c1:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401280c7:	movzbl 0x0(%rbp),%eax
   1401280cb:	lea    0x2aafce(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401280d2:	add    $0x1,%rbp
   1401280d6:	mov    (%rdi,%rax,8),%rax
   1401280da:	jmp    *%rax
   1401280dc:	movabs $0xfffb000000000000,%rax
   1401280e6:	mov    %rax,0x388(%rsp)
   1401280ee:	mov    %rax,0x390(%rsp)
   1401280f6:	cmp    $0x2,%r12b
   1401280fa:	jne    14012d276 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c96>
   140128100:	mov    0x1c8(%rsp),%rax
   140128108:	mov    $0x1,%r12d
   14012810e:	movabs $0xfff8000000000000,%rcx
   140128118:	mov    %rax,0x390(%rsp)
   140128120:	mov    0x1d0(%rsp),%rax
   140128128:	mov    %rax,%rdx
   14012812b:	mov    %rax,0x388(%rsp)
   140128133:	movabs $0xffff000000000000,%rax
   14012813d:	and    %rdx,%rax
   140128140:	cmp    %rcx,%rax
   140128143:	je     14012d2c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ce9>
   140128149:	movabs $0xffff000000000000,%rax
   140128153:	movb   $0x32,-0x1(%rbp)
   140128157:	mov    0x388(%rsp),%r8
   14012815f:	movabs $0xfff8000000000000,%rcx
   140128169:	mov    %r8,%rdx
   14012816c:	and    %rax,%rdx
   14012816f:	cmp    %rcx,%rdx
   140128172:	je     14012bf75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8995>
   140128178:	movabs $0xfffd000000000000,%r9
   140128182:	cmp    %r9,%rdx
   140128185:	je     14012bf68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8988>
   14012818b:	movabs $0xfff7ffffffffffff,%rcx
   140128195:	cmp    %r8,%rcx
   140128198:	jae    14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   14012819e:	movabs $0xfffc000000000000,%r10
   1401281a8:	cmp    %r10,%r8
   1401281ab:	je     14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   1401281b1:	mov    0x390(%rsp),%rdx
   1401281b9:	cmp    %r10,%rdx
   1401281bc:	je     14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   1401281c2:	cmp    %rdx,%rcx
   1401281c5:	jae    14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   1401281cb:	and    %rdx,%rax
   1401281ce:	cmp    %r9,%rax
   1401281d1:	je     140131e0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe82d>
   1401281d7:	lea    0x388(%rsp),%rcx
   1401281df:	vzeroupper
   1401281e2:	call   140229aa0 <setun::VMValue::as_int() const>
   1401281e7:	lea    0x390(%rsp),%rcx
   1401281ef:	mov    %rax,%rdi
   1401281f2:	call   140229aa0 <setun::VMValue::as_int() const>
   1401281f7:	cmp    %rax,%rdi
   1401281fa:	setl   %al
   1401281fd:	movabs $0xfffa000000000000,%rdx
   140128207:	movzbl %al,%eax
   14012820a:	add    %rdx,%rax
   14012820d:	mov    %rax,0x1c8(%rsp)
   140128215:	cmpb   $0x0,0x1040(%rbx)
   14012821c:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140128222:	movzbl 0x0(%rbp),%eax
   140128226:	lea    0x2aae73(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012822d:	add    $0x1,%rbp
   140128231:	mov    (%rdi,%rax,8),%rax
   140128235:	jmp    *%rax
   140128237:	movabs $0xfffb000000000000,%rax
   140128241:	mov    %rax,0x398(%rsp)
   140128249:	mov    %rax,0x3a0(%rsp)
   140128251:	cmp    $0x2,%r12b
   140128255:	jne    14012c5f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9015>
   14012825b:	mov    0x1c8(%rsp),%rax
   140128263:	mov    $0x1,%r12d
   140128269:	movabs $0xfff8000000000000,%rcx
   140128273:	mov    %rax,0x3a0(%rsp)
   14012827b:	mov    0x1d0(%rsp),%rax
   140128283:	mov    %rax,%rdx
   140128286:	mov    %rax,0x398(%rsp)
   14012828e:	movabs $0xffff000000000000,%rax
   140128298:	and    %rdx,%rax
   14012829b:	cmp    %rcx,%rax
   14012829e:	je     14012c648 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9068>
   1401282a4:	movabs $0xffff000000000000,%rax
   1401282ae:	movb   $0x33,-0x1(%rbp)
   1401282b2:	mov    0x398(%rsp),%r8
   1401282ba:	movabs $0xfff8000000000000,%rcx
   1401282c4:	mov    %r8,%rdx
   1401282c7:	and    %rax,%rdx
   1401282ca:	cmp    %rcx,%rdx
   1401282cd:	je     14012c1ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bce>
   1401282d3:	movabs $0xfffd000000000000,%r9
   1401282dd:	cmp    %r9,%rdx
   1401282e0:	je     14012c1a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bc1>
   1401282e6:	movabs $0xfff7ffffffffffff,%rcx
   1401282f0:	cmp    %r8,%rcx
   1401282f3:	jae    14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   1401282f9:	movabs $0xfffc000000000000,%r10
   140128303:	cmp    %r10,%r8
   140128306:	je     14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   14012830c:	mov    0x3a0(%rsp),%rdx
   140128314:	cmp    %rdx,%rcx
   140128317:	jae    14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   14012831d:	cmp    %r10,%rdx
   140128320:	je     14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   140128326:	and    %rdx,%rax
   140128329:	cmp    %r9,%rax
   14012832c:	je     140131f7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe99d>
   140128332:	lea    0x398(%rsp),%rcx
   14012833a:	vzeroupper
   14012833d:	call   140229aa0 <setun::VMValue::as_int() const>
   140128342:	lea    0x3a0(%rsp),%rcx
   14012834a:	mov    %rax,%rdi
   14012834d:	call   140229aa0 <setun::VMValue::as_int() const>
   140128352:	cmp    %rax,%rdi
   140128355:	setle  %al
   140128358:	movabs $0xfffa000000000000,%rdx
   140128362:	movzbl %al,%eax
   140128365:	add    %rdx,%rax
   140128368:	mov    %rax,0x1c8(%rsp)
   140128370:	cmpb   $0x0,0x1040(%rbx)
   140128377:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012837d:	movzbl 0x0(%rbp),%eax
   140128381:	lea    0x2aad18(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128388:	add    $0x1,%rbp
   14012838c:	mov    (%rdi,%rax,8),%rax
   140128390:	jmp    *%rax
   140128392:	movabs $0xfffb000000000000,%rax
   14012839c:	mov    %rax,0x3a8(%rsp)
   1401283a4:	mov    %rax,0x3b0(%rsp)
   1401283ac:	cmp    $0x2,%r12b
   1401283b0:	jne    14012c6c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90e0>
   1401283b6:	mov    0x1c8(%rsp),%rax
   1401283be:	mov    $0x1,%r12d
   1401283c4:	movabs $0xfff8000000000000,%rdx
   1401283ce:	mov    %rax,0x3b0(%rsp)
   1401283d6:	mov    0x1d0(%rsp),%rax
   1401283de:	mov    %rax,%rcx
   1401283e1:	mov    %rax,0x3a8(%rsp)
   1401283e9:	movabs $0xffff000000000000,%rax
   1401283f3:	and    %rcx,%rax
   1401283f6:	cmp    %rdx,%rax
   1401283f9:	je     14012c713 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9133>
   1401283ff:	movabs $0xffff000000000000,%rax
   140128409:	movb   $0x30,-0x1(%rbp)
   14012840d:	mov    0x3a8(%rsp),%r8
   140128415:	movabs $0xfff8000000000000,%rcx
   14012841f:	mov    %r8,%rdx
   140128422:	and    %rax,%rdx
   140128425:	cmp    %rcx,%rdx
   140128428:	je     14012c090 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ab0>
   14012842e:	movabs $0xfffd000000000000,%r9
   140128438:	cmp    %r9,%rdx
   14012843b:	je     14012c083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8aa3>
   140128441:	movabs $0xfff7ffffffffffff,%rcx
   14012844b:	cmp    %r8,%rcx
   14012844e:	jae    14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   140128454:	movabs $0xfffc000000000000,%r10
   14012845e:	cmp    %r10,%r8
   140128461:	je     14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   140128467:	mov    0x3b0(%rsp),%rdx
   14012846f:	cmp    %rdx,%rcx
   140128472:	jae    14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   140128478:	cmp    %r10,%rdx
   14012847b:	je     14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   140128481:	and    %rdx,%rax
   140128484:	cmp    %r9,%rax
   140128487:	je     140131d5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe77f>
   14012848d:	lea    0x3a8(%rsp),%rcx
   140128495:	vzeroupper
   140128498:	call   140229aa0 <setun::VMValue::as_int() const>
   14012849d:	lea    0x3b0(%rsp),%rcx
   1401284a5:	mov    %rax,%rdi
   1401284a8:	call   140229aa0 <setun::VMValue::as_int() const>
   1401284ad:	cmp    %rax,%rdi
   1401284b0:	sete   %dil
   1401284b4:	movabs $0xfffa000000000000,%rdx
   1401284be:	movzbl %dil,%eax
   1401284c2:	add    %rdx,%rax
   1401284c5:	mov    %rax,0x1c8(%rsp)
   1401284cd:	cmpb   $0x0,0x1040(%rbx)
   1401284d4:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401284da:	movzbl 0x0(%rbp),%eax
   1401284de:	lea    0x2aabbb(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401284e5:	add    $0x1,%rbp
   1401284e9:	mov    (%rdi,%rax,8),%rax
   1401284ed:	jmp    *%rax
   1401284ef:	movabs $0xfffb000000000000,%rax
   1401284f9:	mov    %rax,0x3b8(%rsp)
   140128501:	mov    %rax,0x3c0(%rsp)
   140128509:	cmp    $0x2,%r12b
   14012850d:	jne    14012c52a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f4a>
   140128513:	mov    0x1c8(%rsp),%rax
   14012851b:	mov    $0x1,%r12d
   140128521:	movabs $0xfff8000000000000,%rcx
   14012852b:	mov    %rax,0x3c0(%rsp)
   140128533:	mov    0x1d0(%rsp),%rax
   14012853b:	mov    %rax,%rdx
   14012853e:	mov    %rax,0x3b8(%rsp)
   140128546:	movabs $0xffff000000000000,%rax
   140128550:	and    %rdx,%rax
   140128553:	cmp    %rcx,%rax
   140128556:	je     14012c57d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f9d>
   14012855c:	movabs $0xffff000000000000,%rax
   140128566:	movb   $0x34,-0x1(%rbp)
   14012856a:	mov    0x3b8(%rsp),%r8
   140128572:	movabs $0xfff8000000000000,%rcx
   14012857c:	mov    %r8,%rdx
   14012857f:	and    %rax,%rdx
   140128582:	cmp    %rcx,%rdx
   140128585:	je     14012be58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8878>
   14012858b:	movabs $0xfffd000000000000,%r9
   140128595:	cmp    %r9,%rdx
   140128598:	je     14012be4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x886b>
   14012859e:	movabs $0xfff7ffffffffffff,%rcx
   1401285a8:	cmp    %r8,%rcx
   1401285ab:	jae    14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   1401285b1:	movabs $0xfffc000000000000,%r10
   1401285bb:	cmp    %r10,%r8
   1401285be:	je     14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   1401285c4:	mov    0x3c0(%rsp),%rdx
   1401285cc:	cmp    %r10,%rdx
   1401285cf:	je     14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   1401285d5:	cmp    %rdx,%rcx
   1401285d8:	jae    14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   1401285de:	and    %rdx,%rax
   1401285e1:	cmp    %r9,%rax
   1401285e4:	je     140131ec5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8e5>
   1401285ea:	lea    0x3b8(%rsp),%rcx
   1401285f2:	vzeroupper
   1401285f5:	call   140229aa0 <setun::VMValue::as_int() const>
   1401285fa:	lea    0x3c0(%rsp),%rcx
   140128602:	mov    %rax,%rdi
   140128605:	call   140229aa0 <setun::VMValue::as_int() const>
   14012860a:	cmp    %rax,%rdi
   14012860d:	setg   %al
   140128610:	movabs $0xfffa000000000000,%rdx
   14012861a:	movzbl %al,%eax
   14012861d:	add    %rdx,%rax
   140128620:	mov    %rax,0x1c8(%rsp)
   140128628:	cmpb   $0x0,0x1040(%rbx)
   14012862f:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140128635:	movzbl 0x0(%rbp),%eax
   140128639:	lea    0x2aaa60(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128640:	add    $0x1,%rbp
   140128644:	mov    (%rdi,%rax,8),%rax
   140128648:	jmp    *%rax
   14012864a:	movabs $0xfffb000000000000,%rax
   140128654:	mov    %rax,0x3c8(%rsp)
   14012865c:	mov    %rax,0x3d0(%rsp)
   140128664:	cmp    $0x2,%r12b
   140128668:	jne    14012c45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e7f>
   14012866e:	mov    0x1c8(%rsp),%rax
   140128676:	mov    $0x1,%r12d
   14012867c:	movabs $0xfff8000000000000,%rcx
   140128686:	mov    %rax,0x3d0(%rsp)
   14012868e:	mov    0x1d0(%rsp),%rax
   140128696:	mov    %rax,%rdx
   140128699:	mov    %rax,0x3c8(%rsp)
   1401286a1:	movabs $0xffff000000000000,%rax
   1401286ab:	and    %rdx,%rax
   1401286ae:	cmp    %rcx,%rax
   1401286b1:	je     14012c4b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ed2>
   1401286b7:	movabs $0xffff000000000000,%rax
   1401286c1:	movb   $0x35,-0x1(%rbp)
   1401286c5:	mov    0x3c8(%rsp),%r8
   1401286cd:	movabs $0xfff8000000000000,%rcx
   1401286d7:	mov    %r8,%rdx
   1401286da:	and    %rax,%rdx
   1401286dd:	cmp    %rcx,%rdx
   1401286e0:	je     14012bd3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x875b>
   1401286e6:	movabs $0xfffd000000000000,%r9
   1401286f0:	cmp    %r9,%rdx
   1401286f3:	je     14012bd2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x874e>
   1401286f9:	movabs $0xfff7ffffffffffff,%rcx
   140128703:	cmp    %r8,%rcx
   140128706:	jae    14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   14012870c:	movabs $0xfffc000000000000,%r10
   140128716:	cmp    %r10,%r8
   140128719:	je     14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   14012871f:	mov    0x3d0(%rsp),%rdx
   140128727:	cmp    %rdx,%rcx
   14012872a:	jae    14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   140128730:	cmp    %r10,%rdx
   140128733:	je     14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   140128739:	and    %rdx,%rax
   14012873c:	cmp    %r9,%rax
   14012873f:	je     140131c21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe641>
   140128745:	lea    0x3c8(%rsp),%rcx
   14012874d:	vzeroupper
   140128750:	call   140229aa0 <setun::VMValue::as_int() const>
   140128755:	lea    0x3d0(%rsp),%rcx
   14012875d:	mov    %rax,%rdi
   140128760:	call   140229aa0 <setun::VMValue::as_int() const>
   140128765:	cmp    %rax,%rdi
   140128768:	setge  %al
   14012876b:	movabs $0xfffa000000000000,%rdx
   140128775:	movzbl %al,%eax
   140128778:	add    %rdx,%rax
   14012877b:	mov    %rax,0x1c8(%rsp)
   140128783:	cmpb   $0x0,0x1040(%rbx)
   14012878a:	je     14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140128790:	movzbl 0x0(%rbp),%eax
   140128794:	lea    0x2aa905(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012879b:	add    $0x1,%rbp
   14012879f:	mov    (%rdi,%rax,8),%rax
   1401287a3:	jmp    *%rax
   1401287a5:	movzwl 0x0(%rbp),%edx
   1401287a9:	mov    0xb8(%r15),%rax
   1401287b0:	lea    0x2(%rbp),%r14
   1401287b4:	lea    (%rax,%rdx,8),%r9
   1401287b8:	test   %r12b,%r12b
   1401287bb:	je     140130ab8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4d8>
   1401287c1:	movabs $0xffffffff00000000,%rax
   1401287cb:	movabs $0xfffd000200000000,%rdx
   1401287d5:	and    0x1c8(%rsp),%rax
   1401287dd:	cmp    %rdx,%rax
   1401287e0:	je     14012d9a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3c2>
   1401287e6:	cmp    $0x1,%r12b
   1401287ea:	jne    14012ddd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7f0>
   1401287f0:	mov    0x1c8(%rsp),%rax
   1401287f8:	movabs $0xffff000000000000,%rdx
   140128802:	movabs $0xfffd000000000000,%rcx
   14012880c:	and    %rax,%rdx
   14012880f:	mov    %rax,0x3e0(%rsp)
   140128817:	cmp    %rcx,%rdx
   14012881a:	je     14012e3d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadf9>
   140128820:	mov    $0x1,%r12d
   140128826:	movabs $0xfff8000000000000,%rax
   140128830:	mov    %rax,0x1c8(%rsp)
   140128838:	cmpb   $0x0,0x1040(%rbx)
   14012883f:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140128845:	movzbl 0x2(%rbp),%eax
   140128849:	lea    0x2aa850(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128850:	add    $0x3,%rbp
   140128854:	mov    (%rdi,%rax,8),%rax
   140128858:	jmp    *%rax
   14012885a:	vmovdqu 0x0(%rbp),%xmm0
   14012885f:	mov    0x10(%rbp),%edi
   140128862:	lea    0x14(%rbp),%r14
   140128866:	test   %r12b,%r12b
   140128869:	je     14012b306 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d26>
   14012886f:	cmp    $0x1,%r12b
   140128873:	je     14012f8fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31e>
   140128879:	lea    0x8(%rsi),%r8
   14012887d:	cmp    0x30(%rsp),%r8
   140128882:	jae    14013299f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3bf>
   140128888:	vzeroupper
   14012888b:	mov    0x1d0(%rsp),%rax
   140128893:	lea    0x1a0(%rsp),%rdx
   14012889b:	mov    %r8,0x40(%rsp)
   1401288a0:	lea    0x540(%rsp),%rcx
   1401288a8:	mov    %rax,(%rsi)
   1401288ab:	mov    0x1c8(%rsp),%rax
   1401288b3:	mov    %edi,0x690(%rsp)
   1401288ba:	mov    %rax,0x1d0(%rsp)
   1401288c2:	movl   $0x0,0x694(%rsp)
   1401288cd:	mov    0x690(%rsp),%rax
   1401288d5:	vmovdqa %xmm0,0x680(%rsp)
   1401288de:	mov    %rax,0x1b0(%rsp)
   1401288e6:	vmovdqa %xmm0,0x1a0(%rsp)
   1401288ef:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401288f4:	mov    0x540(%rsp),%rax
   1401288fc:	mov    0x40(%rsp),%rsi
   140128901:	mov    %rax,0x1c8(%rsp)
   140128909:	cmpb   $0x0,0x1040(%rbx)
   140128910:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140128916:	movzbl 0x14(%rbp),%eax
   14012891a:	lea    0x2aa77f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128921:	add    $0x15,%rbp
   140128925:	mov    (%rdi,%rax,8),%rax
   140128929:	jmp    *%rax
   14012892b:	mov    0x0(%rbp),%rdi
   14012892f:	lea    0x8(%rbp),%r14
   140128933:	test   %r12b,%r12b
   140128936:	je     14012a42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e4b>
   14012893c:	cmp    $0x1,%r12b
   140128940:	je     14012f69a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0ba>
   140128946:	lea    0x8(%rsi),%r8
   14012894a:	cmp    0x30(%rsp),%r8
   14012894f:	jae    140132cbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6dd>
   140128955:	mov    0x1d0(%rsp),%rax
   14012895d:	vmovq  %rdi,%xmm0
   140128962:	vucomisd %xmm0,%xmm0
   140128966:	mov    %rax,(%rsi)
   140128969:	mov    0x1c8(%rsp),%rax
   140128971:	mov    %r8,%rsi
   140128974:	mov    %rax,0x1d0(%rsp)
   14012897c:	movabs $0xfffc000000000000,%rax
   140128986:	cmovnp %rdi,%rax
   14012898a:	mov    %rax,0x1c8(%rsp)
   140128992:	cmpb   $0x0,0x1040(%rbx)
   140128999:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   14012899f:	movzbl 0x8(%rbp),%eax
   1401289a3:	lea    0x2aa6f6(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401289aa:	add    $0x9,%rbp
   1401289ae:	mov    (%rdi,%rax,8),%rax
   1401289b2:	jmp    *%rax
   1401289b4:	movzbl 0x0(%rbp),%edi
   1401289b8:	lea    0x1(%rbp),%r14
   1401289bc:	test   %r12b,%r12b
   1401289bf:	je     14012a34a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d6a>
   1401289c5:	cmp    $0x1,%r12b
   1401289c9:	je     14012f620 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc040>
   1401289cf:	lea    0x8(%rsi),%r8
   1401289d3:	cmp    0x30(%rsp),%r8
   1401289d8:	jae    140134475 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e95>
   1401289de:	mov    0x1d0(%rsp),%rax
   1401289e6:	test   %dil,%dil
   1401289e9:	movabs $0xfffa000000000001,%rdx
   1401289f3:	mov    %rax,(%rsi)
   1401289f6:	mov    0x1c8(%rsp),%rax
   1401289fe:	mov    %r8,%rsi
   140128a01:	mov    %rax,0x1d0(%rsp)
   140128a09:	movabs $0xfffa000000000000,%rax
   140128a13:	cmovne %rdx,%rax
   140128a17:	mov    %rax,0x1c8(%rsp)
   140128a1f:	cmpb   $0x0,0x1040(%rbx)
   140128a26:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140128a2c:	movzbl 0x1(%rbp),%eax
   140128a30:	lea    0x2aa669(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128a37:	add    $0x2,%rbp
   140128a3b:	mov    (%rdi,%rax,8),%rax
   140128a3f:	jmp    *%rax
   140128a41:	movzwl 0x6(%rbp),%edx
   140128a45:	movzwl 0x0(%rbp),%r9d
   140128a4a:	lea    0x8(%rbp),%r14
   140128a4e:	movzwl 0x2(%rbp),%r8d
   140128a53:	movzwl 0x4(%rbp),%eax
   140128a57:	lea    (%rdx,%r13,1),%rdi
   140128a5b:	cmp    0x15268(%rbx),%rdi
   140128a62:	jae    140130815 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd235>
   140128a68:	mov    0x1070(%rbx),%rdx
   140128a6f:	sub    0x1068(%rbx),%rdx
   140128a76:	sar    $0x3,%rdx
   140128a7a:	vzeroupper
   140128a7d:	cmp    %rdx,%rdi
   140128a80:	jae    14013064e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd06e>
   140128a86:	mov    0x1068(%rbx),%rdx
   140128a8d:	movzwl %r9w,%ecx
   140128a91:	movzwl %r8w,%r8d
   140128a95:	movzwl %ax,%eax
   140128a98:	add    %r13,%rcx
   140128a9b:	add    %r13,%r8
   140128a9e:	lea    (%rdx,%rcx,8),%rcx
   140128aa2:	lea    (%rdx,%r8,8),%r9
   140128aa6:	movabs $0xfffd000000000000,%r8
   140128ab0:	add    %r13,%rax
   140128ab3:	lea    (%rdx,%rax,8),%rax
   140128ab7:	mov    (%rcx),%rdx
   140128aba:	mov    %rax,0x40(%rsp)
   140128abf:	movabs $0xffff000000000000,%rax
   140128ac9:	and    %rdx,%rax
   140128acc:	cmp    %r8,%rax
   140128acf:	je     14012b7da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81fa>
   140128ad5:	movabs $0xfff8000000000000,%rdx
   140128adf:	cmp    %rdx,%rax
   140128ae2:	je     14012b7f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8212>
   140128ae8:	mov    %r9,0x80(%rsp)
   140128af0:	call   14022b550 <setun::VMValue::as_float() const>
   140128af5:	vcvttsd2si %xmm0,%rax
   140128afa:	mov    %rax,0x420(%rsp)
   140128b02:	lea    0x420(%rsp),%rax
   140128b0a:	mov    0x80(%rsp),%r9
   140128b12:	movq   $0x0,0x428(%rsp)
   140128b1e:	movq   $0x0,0x430(%rsp)
   140128b2a:	mov    %rax,0x60(%rsp)
   140128b2f:	movabs $0xffff000000000000,%rax
   140128b39:	mov    (%r9),%rdx
   140128b3c:	movabs $0xfffd000000000000,%rcx
   140128b46:	and    %rdx,%rax
   140128b49:	cmp    %rcx,%rax
   140128b4c:	je     14012e183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaba3>
   140128b52:	movabs $0xfff8000000000000,%rdx
   140128b5c:	cmp    %rdx,%rax
   140128b5f:	je     14012e19b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabbb>
   140128b65:	mov    %r9,%rcx
   140128b68:	call   14022b550 <setun::VMValue::as_float() const>
   140128b6d:	lea    0x440(%rsp),%r8
   140128b75:	movq   $0x0,0x448(%rsp)
   140128b81:	vcvttsd2si %xmm0,%rax
   140128b86:	movq   $0x0,0x450(%rsp)
   140128b92:	mov    %rax,0x440(%rsp)
   140128b9a:	movabs $0xfffd000000000000,%rcx
   140128ba4:	mov    0x40(%rsp),%rax
   140128ba9:	mov    (%rax),%rdx
   140128bac:	movabs $0xffff000000000000,%rax
   140128bb6:	and    %rdx,%rax
   140128bb9:	cmp    %rcx,%rax
   140128bbc:	je     14012e154 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab74>
   140128bc2:	movabs $0xfff8000000000000,%rdx
   140128bcc:	cmp    %rdx,%rax
   140128bcf:	je     14012e16c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab8c>
   140128bd5:	mov    0x40(%rsp),%rcx
   140128bda:	mov    %r8,0xa0(%rsp)
   140128be2:	call   14022b550 <setun::VMValue::as_float() const>
   140128be7:	vcvttsd2si %xmm0,%rax
   140128bec:	mov    %rax,0x460(%rsp)
   140128bf4:	lea    0x460(%rsp),%rax
   140128bfc:	mov    0xa0(%rsp),%r8
   140128c04:	movq   $0x0,0x468(%rsp)
   140128c10:	movq   $0x0,0x470(%rsp)
   140128c1c:	mov    %rax,0x80(%rsp)
   140128c24:	lea    0x680(%rsp),%rax
   140128c2c:	mov    0x60(%rsp),%rdx
   140128c31:	mov    %rax,%rcx
   140128c34:	mov    %rax,0x40(%rsp)
   140128c39:	call   140011910 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140128c3e:	mov    0x40(%rsp),%r8
   140128c43:	mov    0x80(%rsp),%rdx
   140128c4b:	lea    0x4e0(%rsp),%rcx
   140128c53:	call   1400113a0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140128c58:	mov    0x4f0(%rsp),%rax
   140128c60:	vmovdqa 0x4e0(%rsp),%xmm5
   140128c69:	lea    0x1a0(%rsp),%rdx
   140128c71:	mov    0x40(%rsp),%rcx
   140128c76:	mov    %rax,0x1b0(%rsp)
   140128c7e:	vmovdqa %xmm5,0x1a0(%rsp)
   140128c87:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140128c8c:	mov    0x1068(%rbx),%rax
   140128c93:	mov    0x680(%rsp),%rdx
   140128c9b:	mov    %rdx,(%rax,%rdi,8)
   140128c9f:	cmpb   $0x0,0x1040(%rbx)
   140128ca6:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140128cac:	movzbl 0x8(%rbp),%eax
   140128cb0:	lea    0x2aa3e9(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128cb7:	add    $0x9,%rbp
   140128cbb:	mov    (%rdi,%rax,8),%rax
   140128cbf:	jmp    *%rax
   140128cc1:	cmp    $0x2,%r12b
   140128cc5:	je     14012ba1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x843e>
   140128ccb:	cmp    $0x1,%r12b
   140128ccf:	jne    140139214 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15c34>
   140128cd5:	lea    0x8(%rsi),%rcx
   140128cd9:	cmp    0x30(%rsp),%rcx
   140128cde:	jae    14013207b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea9b>
   140128ce4:	mov    0x1c8(%rsp),%rax
   140128cec:	mov    0x1048(%rbx),%rdx
   140128cf3:	mov    %rax,(%rsi)
   140128cf6:	mov    0x1050(%rbx),%rax
   140128cfd:	vzeroupper
   140128d00:	sub    %rdx,%rcx
   140128d03:	sub    0x38(%rsp),%rbp
   140128d08:	sub    %rdx,%rax
   140128d0b:	mov    %rcx,%rsi
   140128d0e:	mov    %rbp,0x1038(%rbx)
   140128d15:	sar    $0x3,%rsi
   140128d19:	cmp    %rcx,%rax
   140128d1c:	jae    140128d2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x574e>
   140128d1e:	lea    (%rsi,%rsi,1),%rdx
   140128d22:	lea    0x1048(%rbx),%rcx
   140128d29:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140128d2e:	vmovdqa 0x245e4a(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140128d36:	mov    %rsi,0x1060(%rbx)
   140128d3d:	movb   $0x0,0x153a0(%rbx)
   140128d44:	mov    0x1038(%rbx),%rcx
   140128d4b:	vmovdqa %xmm0,0x15390(%rbx)
   140128d53:	call   14035053e <setun::cold_throw_unknown_opcode(unsigned long long)>
   140128d58:	nopl   0x0(%rax,%rax,1)
   140128d60:	cmp    $0x2,%r12b
   140128d64:	je     14012a884 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72a4>
   140128d6a:	cmp    $0x1,%r12b
   140128d6e:	je     14012e6ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0ce>
   140128d74:	mov    0x1048(%rbx),%rdx
   140128d7b:	mov    0x1050(%rbx),%rax
   140128d82:	sub    0x38(%rsp),%rbp
   140128d87:	sub    %rdx,%rsi
   140128d8a:	sub    %rdx,%rax
   140128d8d:	mov    %rbp,0x1038(%rbx)
   140128d94:	mov    %rsi,%rdi
   140128d97:	sar    $0x3,%rdi
   140128d9b:	cmp    %rsi,%rax
   140128d9e:	jb     14012f755 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc175>
   140128da4:	vzeroupper
   140128da7:	vmovdqa 0x245dd1(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140128daf:	mov    %rdi,0x1060(%rbx)
   140128db6:	mov    %r15,%rdx
   140128db9:	mov    %rbx,%rcx
   140128dbc:	movb   $0x0,0x153a0(%rbx)
   140128dc3:	vmovdqa %xmm0,0x15390(%rbx)
   140128dcb:	call   14010ca70 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140128dd0:	mov    0x1060(%rbx),%rax
   140128dd7:	mov    0x1048(%rbx),%rdx
   140128dde:	mov    0x150c0(%rbx),%r13
   140128de5:	mov    0x38(%rsp),%r14
   140128dea:	lea    (%rdx,%rax,8),%rsi
   140128dee:	mov    0x1050(%rbx),%rax
   140128df5:	add    0x1038(%rbx),%r14
   140128dfc:	mov    %rax,0x30(%rsp)
   140128e01:	test   %r13,%r13
   140128e04:	je     140128e13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5833>
   140128e06:	lea    -0x5(%r13,%r13,4),%rcx
   140128e0b:	mov    0x10c8(%rbx,%rcx,8),%r13
   140128e13:	cmpb   $0x0,0x1040(%rbx)
   140128e1a:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140128e20:	movzbl (%r14),%eax
   140128e24:	lea    0x2aa275(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128e2b:	lea    0x1(%r14),%rbp
   140128e2f:	xor    %r12d,%r12d
   140128e32:	mov    (%rdi,%rax,8),%rax
   140128e36:	jmp    *%rax
   140128e38:	cmp    $0x2,%r12b
   140128e3c:	je     14012a8f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7312>
   140128e42:	cmp    $0x1,%r12b
   140128e46:	je     14012e64e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb06e>
   140128e4c:	mov    0x1048(%rbx),%rdx
   140128e53:	mov    0x1050(%rbx),%rax
   140128e5a:	sub    0x38(%rsp),%rbp
   140128e5f:	sub    %rdx,%rsi
   140128e62:	sub    %rdx,%rax
   140128e65:	mov    %rbp,0x1038(%rbx)
   140128e6c:	mov    %rsi,%rdi
   140128e6f:	sar    $0x3,%rdi
   140128e73:	cmp    %rsi,%rax
   140128e76:	jb     14012f785 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1a5>
   140128e7c:	vzeroupper
   140128e7f:	vmovdqa 0x245cf9(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140128e87:	mov    %rdi,0x1060(%rbx)
   140128e8e:	mov    %r15,%rdx
   140128e91:	mov    %rbx,%rcx
   140128e94:	movb   $0x0,0x153a0(%rbx)
   140128e9b:	vmovdqa %xmm0,0x15390(%rbx)
   140128ea3:	call   14010afa0 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140128ea8:	mov    0x1060(%rbx),%rax
   140128eaf:	mov    0x1048(%rbx),%rdx
   140128eb6:	mov    0x150c0(%rbx),%r13
   140128ebd:	mov    0x38(%rsp),%r14
   140128ec2:	lea    (%rdx,%rax,8),%rsi
   140128ec6:	mov    0x1050(%rbx),%rax
   140128ecd:	add    0x1038(%rbx),%r14
   140128ed4:	mov    %rax,0x30(%rsp)
   140128ed9:	test   %r13,%r13
   140128edc:	je     140128eeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x590b>
   140128ede:	lea    -0x5(%r13,%r13,4),%rcx
   140128ee3:	mov    0x10c8(%rbx,%rcx,8),%r13
   140128eeb:	cmpb   $0x0,0x1040(%rbx)
   140128ef2:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140128ef8:	movzbl (%r14),%eax
   140128efc:	lea    0x2aa19d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128f03:	lea    0x1(%r14),%rbp
   140128f07:	xor    %r12d,%r12d
   140128f0a:	mov    (%rdi,%rax,8),%rax
   140128f0e:	jmp    *%rax
   140128f10:	cmp    $0x2,%r12b
   140128f14:	je     14012aa64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7484>
   140128f1a:	cmp    $0x1,%r12b
   140128f1e:	je     14012e67e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb09e>
   140128f24:	mov    0x1048(%rbx),%rdx
   140128f2b:	mov    0x1050(%rbx),%rax
   140128f32:	sub    0x38(%rsp),%rbp
   140128f37:	sub    %rdx,%rsi
   140128f3a:	sub    %rdx,%rax
   140128f3d:	mov    %rbp,0x1038(%rbx)
   140128f44:	mov    %rsi,%rdi
   140128f47:	sar    $0x3,%rdi
   140128f4b:	cmp    %rsi,%rax
   140128f4e:	jb     14012f78d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1ad>
   140128f54:	vzeroupper
   140128f57:	vmovdqa 0x245c21(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140128f5f:	mov    %rdi,0x1060(%rbx)
   140128f66:	mov    %r15,%rdx
   140128f69:	mov    %rbx,%rcx
   140128f6c:	movb   $0x0,0x153a0(%rbx)
   140128f73:	vmovdqa %xmm0,0x15390(%rbx)
   140128f7b:	call   140109690 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   140128f80:	mov    0x1060(%rbx),%rax
   140128f87:	mov    0x1048(%rbx),%rdx
   140128f8e:	mov    0x150c0(%rbx),%r13
   140128f95:	mov    0x38(%rsp),%r14
   140128f9a:	lea    (%rdx,%rax,8),%rsi
   140128f9e:	mov    0x1050(%rbx),%rax
   140128fa5:	add    0x1038(%rbx),%r14
   140128fac:	mov    %rax,0x30(%rsp)
   140128fb1:	test   %r13,%r13
   140128fb4:	je     140128fc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59e3>
   140128fb6:	lea    -0x5(%r13,%r13,4),%rcx
   140128fbb:	mov    0x10c8(%rbx,%rcx,8),%r13
   140128fc3:	cmpb   $0x0,0x1040(%rbx)
   140128fca:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140128fd0:	movzbl (%r14),%eax
   140128fd4:	lea    0x2aa0c5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128fdb:	lea    0x1(%r14),%rbp
   140128fdf:	xor    %r12d,%r12d
   140128fe2:	mov    (%rdi,%rax,8),%rax
   140128fe6:	jmp    *%rax
   140128fe8:	cmp    $0x2,%r12b
   140128fec:	je     14012aad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74f2>
   140128ff2:	cmp    $0x1,%r12b
   140128ff6:	je     14012e76e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb18e>
   140128ffc:	mov    0x1048(%rbx),%rdx
   140129003:	mov    0x1050(%rbx),%rax
   14012900a:	sub    0x38(%rsp),%rbp
   14012900f:	sub    %rdx,%rsi
   140129012:	sub    %rdx,%rax
   140129015:	mov    %rbp,0x1038(%rbx)
   14012901c:	mov    %rsi,%rdi
   14012901f:	sar    $0x3,%rdi
   140129023:	cmp    %rsi,%rax
   140129026:	jb     14012f795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1b5>
   14012902c:	vzeroupper
   14012902f:	vmovdqa 0x245b49(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129037:	mov    %rdi,0x1060(%rbx)
   14012903e:	mov    %r15,%rdx
   140129041:	mov    %rbx,%rcx
   140129044:	movb   $0x0,0x153a0(%rbx)
   14012904b:	vmovdqa %xmm0,0x15390(%rbx)
   140129053:	call   14010cdf0 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   140129058:	mov    0x1060(%rbx),%rax
   14012905f:	mov    0x1048(%rbx),%rdx
   140129066:	mov    0x150c0(%rbx),%r13
   14012906d:	mov    0x38(%rsp),%r14
   140129072:	lea    (%rdx,%rax,8),%rsi
   140129076:	mov    0x1050(%rbx),%rax
   14012907d:	add    0x1038(%rbx),%r14
   140129084:	mov    %rax,0x30(%rsp)
   140129089:	test   %r13,%r13
   14012908c:	je     14012909b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5abb>
   14012908e:	lea    -0x5(%r13,%r13,4),%rcx
   140129093:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012909b:	cmpb   $0x0,0x1040(%rbx)
   1401290a2:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401290a8:	movzbl (%r14),%eax
   1401290ac:	lea    0x2a9fed(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401290b3:	lea    0x1(%r14),%rbp
   1401290b7:	xor    %r12d,%r12d
   1401290ba:	mov    (%rdi,%rax,8),%rax
   1401290be:	jmp    *%rax
   1401290c0:	cmp    $0x2,%r12b
   1401290c4:	je     14012ad26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7746>
   1401290ca:	cmp    $0x1,%r12b
   1401290ce:	je     14012e82e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb24e>
   1401290d4:	mov    0x1048(%rbx),%rdx
   1401290db:	mov    0x1050(%rbx),%rax
   1401290e2:	sub    0x38(%rsp),%rbp
   1401290e7:	sub    %rdx,%rsi
   1401290ea:	sub    %rdx,%rax
   1401290ed:	mov    %rbp,0x1038(%rbx)
   1401290f4:	mov    %rsi,%rdi
   1401290f7:	sar    $0x3,%rdi
   1401290fb:	cmp    %rsi,%rax
   1401290fe:	jb     14012e2d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacf2>
   140129104:	vzeroupper
   140129107:	mov    %rdi,0x1060(%rbx)
   14012910e:	vmovdqa 0x245a6a(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129116:	movb   $0x0,0x153a0(%rbx)
   14012911d:	mov    %r15,%rdx
   140129120:	mov    %rbx,%rcx
   140129123:	vmovdqa %xmm0,0x15390(%rbx)
   14012912b:	call   140109390 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140129130:	mov    0x1060(%rbx),%rax
   140129137:	mov    0x1048(%rbx),%rdx
   14012913e:	mov    0x150c0(%rbx),%r13
   140129145:	mov    0x38(%rsp),%r14
   14012914a:	lea    (%rdx,%rax,8),%rsi
   14012914e:	mov    0x1050(%rbx),%rax
   140129155:	add    0x1038(%rbx),%r14
   14012915c:	mov    %rax,0x30(%rsp)
   140129161:	test   %r13,%r13
   140129164:	je     140129173 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b93>
   140129166:	lea    -0x5(%r13,%r13,4),%rcx
   14012916b:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129173:	cmpb   $0x0,0x1040(%rbx)
   14012917a:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129180:	movzbl (%r14),%eax
   140129184:	lea    0x2a9f15(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012918b:	lea    0x1(%r14),%rbp
   14012918f:	xor    %r12d,%r12d
   140129192:	mov    (%rdi,%rax,8),%rax
   140129196:	jmp    *%rax
   140129198:	cmp    $0x2,%r12b
   14012919c:	je     14012aecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78ec>
   1401291a2:	cmp    $0x1,%r12b
   1401291a6:	je     14012e70e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb12e>
   1401291ac:	mov    0x1048(%rbx),%rdx
   1401291b3:	mov    0x1050(%rbx),%rax
   1401291ba:	sub    0x38(%rsp),%rbp
   1401291bf:	sub    %rdx,%rsi
   1401291c2:	sub    %rdx,%rax
   1401291c5:	mov    %rbp,0x1038(%rbx)
   1401291cc:	mov    %rsi,%rdi
   1401291cf:	sar    $0x3,%rdi
   1401291d3:	cmp    %rsi,%rax
   1401291d6:	jb     14012f79d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1bd>
   1401291dc:	vzeroupper
   1401291df:	vmovdqa 0x245999(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401291e7:	mov    %rdi,0x1060(%rbx)
   1401291ee:	mov    %r15,%rdx
   1401291f1:	mov    %rbx,%rcx
   1401291f4:	movb   $0x0,0x153a0(%rbx)
   1401291fb:	vmovdqa %xmm0,0x15390(%rbx)
   140129203:	call   14010c4e0 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   140129208:	mov    0x1060(%rbx),%rax
   14012920f:	mov    0x1048(%rbx),%rdx
   140129216:	mov    0x150c0(%rbx),%r13
   14012921d:	mov    0x38(%rsp),%r14
   140129222:	lea    (%rdx,%rax,8),%rsi
   140129226:	mov    0x1050(%rbx),%rax
   14012922d:	add    0x1038(%rbx),%r14
   140129234:	mov    %rax,0x30(%rsp)
   140129239:	test   %r13,%r13
   14012923c:	je     14012924b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c6b>
   14012923e:	lea    -0x5(%r13,%r13,4),%rcx
   140129243:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012924b:	cmpb   $0x0,0x1040(%rbx)
   140129252:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129258:	movzbl (%r14),%eax
   14012925c:	lea    0x2a9e3d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129263:	lea    0x1(%r14),%rbp
   140129267:	xor    %r12d,%r12d
   14012926a:	mov    (%rdi,%rax,8),%rax
   14012926e:	jmp    *%rax
   140129270:	cmp    $0x2,%r12b
   140129274:	je     14012ac50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7670>
   14012927a:	cmp    $0x1,%r12b
   14012927e:	je     14012e85e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb27e>
   140129284:	mov    0x1048(%rbx),%rdx
   14012928b:	mov    0x1050(%rbx),%rax
   140129292:	sub    0x38(%rsp),%rbp
   140129297:	sub    %rdx,%rsi
   14012929a:	sub    %rdx,%rax
   14012929d:	mov    %rbp,0x1038(%rbx)
   1401292a4:	mov    %rsi,%rdi
   1401292a7:	sar    $0x3,%rdi
   1401292ab:	cmp    %rsi,%rax
   1401292ae:	jb     14012f7a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1c5>
   1401292b4:	vzeroupper
   1401292b7:	vmovdqa 0x2458c1(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401292bf:	mov    %rdi,0x1060(%rbx)
   1401292c6:	mov    %r15,%rdx
   1401292c9:	mov    %rbx,%rcx
   1401292cc:	movb   $0x0,0x153a0(%rbx)
   1401292d3:	vmovdqa %xmm0,0x15390(%rbx)
   1401292db:	call   14010d4c0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   1401292e0:	mov    0x1060(%rbx),%rax
   1401292e7:	mov    0x1048(%rbx),%rdx
   1401292ee:	mov    0x150c0(%rbx),%r13
   1401292f5:	mov    0x38(%rsp),%r14
   1401292fa:	lea    (%rdx,%rax,8),%rsi
   1401292fe:	mov    0x1050(%rbx),%rax
   140129305:	add    0x1038(%rbx),%r14
   14012930c:	mov    %rax,0x30(%rsp)
   140129311:	test   %r13,%r13
   140129314:	je     140129323 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d43>
   140129316:	lea    -0x5(%r13,%r13,4),%rcx
   14012931b:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129323:	cmpb   $0x0,0x1040(%rbx)
   14012932a:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129330:	movzbl (%r14),%eax
   140129334:	lea    0x2a9d65(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012933b:	lea    0x1(%r14),%rbp
   14012933f:	xor    %r12d,%r12d
   140129342:	mov    (%rdi,%rax,8),%rax
   140129346:	jmp    *%rax
   140129348:	cmp    $0x2,%r12b
   14012934c:	je     14012afa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79c8>
   140129352:	cmp    $0x1,%r12b
   140129356:	je     14012e7ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1ee>
   14012935c:	mov    0x1048(%rbx),%rdx
   140129363:	mov    0x1050(%rbx),%rax
   14012936a:	sub    0x38(%rsp),%rbp
   14012936f:	sub    %rdx,%rsi
   140129372:	sub    %rdx,%rax
   140129375:	mov    %rbp,0x1038(%rbx)
   14012937c:	mov    %rsi,%rdi
   14012937f:	sar    $0x3,%rdi
   140129383:	cmp    %rsi,%rax
   140129386:	jb     14012f7ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1cd>
   14012938c:	vzeroupper
   14012938f:	vmovdqa 0x2457e9(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129397:	mov    %rdi,0x1060(%rbx)
   14012939e:	mov    %r15,%rdx
   1401293a1:	mov    %rbx,%rcx
   1401293a4:	movb   $0x0,0x153a0(%rbx)
   1401293ab:	vmovdqa %xmm0,0x15390(%rbx)
   1401293b3:	call   140109090 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   1401293b8:	mov    0x1060(%rbx),%rax
   1401293bf:	mov    0x1048(%rbx),%rdx
   1401293c6:	mov    0x150c0(%rbx),%r13
   1401293cd:	mov    0x38(%rsp),%r14
   1401293d2:	lea    (%rdx,%rax,8),%rsi
   1401293d6:	mov    0x1050(%rbx),%rax
   1401293dd:	add    0x1038(%rbx),%r14
   1401293e4:	mov    %rax,0x30(%rsp)
   1401293e9:	test   %r13,%r13
   1401293ec:	je     1401293fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e1b>
   1401293ee:	lea    -0x5(%r13,%r13,4),%rcx
   1401293f3:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401293fb:	cmpb   $0x0,0x1040(%rbx)
   140129402:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129408:	movzbl (%r14),%eax
   14012940c:	lea    0x2a9c8d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129413:	lea    0x1(%r14),%rbp
   140129417:	xor    %r12d,%r12d
   14012941a:	mov    (%rdi,%rax,8),%rax
   14012941e:	jmp    *%rax
   140129420:	cmp    $0x2,%r12b
   140129424:	je     14012adf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7816>
   14012942a:	cmp    $0x1,%r12b
   14012942e:	je     14012e88e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ae>
   140129434:	mov    0x1048(%rbx),%rdx
   14012943b:	mov    0x1050(%rbx),%rax
   140129442:	sub    0x38(%rsp),%rbp
   140129447:	sub    %rdx,%rsi
   14012944a:	sub    %rdx,%rax
   14012944d:	mov    %rbp,0x1038(%rbx)
   140129454:	mov    %rsi,%rdi
   140129457:	sar    $0x3,%rdi
   14012945b:	cmp    %rsi,%rax
   14012945e:	jb     14012f7b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1d5>
   140129464:	vzeroupper
   140129467:	vmovdqa 0x245711(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012946f:	mov    %rdi,0x1060(%rbx)
   140129476:	mov    %r15,%rdx
   140129479:	mov    %rbx,%rcx
   14012947c:	movb   $0x0,0x153a0(%rbx)
   140129483:	vmovdqa %xmm0,0x15390(%rbx)
   14012948b:	call   140108d90 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   140129490:	mov    0x1060(%rbx),%rax
   140129497:	mov    0x1048(%rbx),%rdx
   14012949e:	mov    0x150c0(%rbx),%r13
   1401294a5:	mov    0x38(%rsp),%r14
   1401294aa:	lea    (%rdx,%rax,8),%rsi
   1401294ae:	mov    0x1050(%rbx),%rax
   1401294b5:	add    0x1038(%rbx),%r14
   1401294bc:	mov    %rax,0x30(%rsp)
   1401294c1:	test   %r13,%r13
   1401294c4:	je     1401294d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ef3>
   1401294c6:	lea    -0x5(%r13,%r13,4),%rcx
   1401294cb:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401294d3:	cmpb   $0x0,0x1040(%rbx)
   1401294da:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401294e0:	movzbl (%r14),%eax
   1401294e4:	lea    0x2a9bb5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401294eb:	lea    0x1(%r14),%rbp
   1401294ef:	xor    %r12d,%r12d
   1401294f2:	mov    (%rdi,%rax,8),%rax
   1401294f6:	jmp    *%rax
   1401294f8:	cmp    $0x2,%r12b
   1401294fc:	je     14012b084 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7aa4>
   140129502:	cmp    $0x1,%r12b
   140129506:	je     14012e6de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0fe>
   14012950c:	mov    0x1048(%rbx),%rdx
   140129513:	mov    0x1050(%rbx),%rax
   14012951a:	sub    0x38(%rsp),%rbp
   14012951f:	sub    %rdx,%rsi
   140129522:	sub    %rdx,%rax
   140129525:	mov    %rbp,0x1038(%rbx)
   14012952c:	mov    %rsi,%rdi
   14012952f:	sar    $0x3,%rdi
   140129533:	cmp    %rsi,%rax
   140129536:	jb     14012f75d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc17d>
   14012953c:	vzeroupper
   14012953f:	vmovdqa 0x245639(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129547:	mov    %rdi,0x1060(%rbx)
   14012954e:	mov    %r15,%rdx
   140129551:	mov    %rbx,%rcx
   140129554:	movb   $0x0,0x153a0(%rbx)
   14012955b:	vmovdqa %xmm0,0x15390(%rbx)
   140129563:	call   1401083b0 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   140129568:	mov    0x1060(%rbx),%rax
   14012956f:	mov    0x1048(%rbx),%rdx
   140129576:	mov    0x150c0(%rbx),%r13
   14012957d:	mov    0x38(%rsp),%r14
   140129582:	lea    (%rdx,%rax,8),%rsi
   140129586:	mov    0x1050(%rbx),%rax
   14012958d:	add    0x1038(%rbx),%r14
   140129594:	mov    %rax,0x30(%rsp)
   140129599:	test   %r13,%r13
   14012959c:	je     1401295ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fcb>
   14012959e:	lea    -0x5(%r13,%r13,4),%rcx
   1401295a3:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401295ab:	cmpb   $0x0,0x1040(%rbx)
   1401295b2:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401295b8:	movzbl (%r14),%eax
   1401295bc:	lea    0x2a9add(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401295c3:	lea    0x1(%r14),%rbp
   1401295c7:	xor    %r12d,%r12d
   1401295ca:	mov    (%rdi,%rax,8),%rax
   1401295ce:	jmp    *%rax
   1401295d0:	cmp    $0x2,%r12b
   1401295d4:	je     14012b42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e4d>
   1401295da:	cmp    $0x1,%r12b
   1401295de:	je     14012e79e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1be>
   1401295e4:	mov    0x1048(%rbx),%rdx
   1401295eb:	mov    0x1050(%rbx),%rax
   1401295f2:	sub    0x38(%rsp),%rbp
   1401295f7:	sub    %rdx,%rsi
   1401295fa:	sub    %rdx,%rax
   1401295fd:	mov    %rbp,0x1038(%rbx)
   140129604:	mov    %rsi,%rdi
   140129607:	sar    $0x3,%rdi
   14012960b:	cmp    %rsi,%rax
   14012960e:	jb     14012f765 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc185>
   140129614:	vzeroupper
   140129617:	vmovdqa 0x245561(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012961f:	mov    %rdi,0x1060(%rbx)
   140129626:	mov    %r15,%rdx
   140129629:	mov    %rbx,%rcx
   14012962c:	movb   $0x0,0x153a0(%rbx)
   140129633:	vmovdqa %xmm0,0x15390(%rbx)
   14012963b:	call   140114590 <setun::VM::handle_get_field(setun::Chunk const&)>
   140129640:	mov    0x1060(%rbx),%rax
   140129647:	mov    0x1048(%rbx),%rdx
   14012964e:	mov    0x150c0(%rbx),%r13
   140129655:	mov    0x38(%rsp),%r14
   14012965a:	lea    (%rdx,%rax,8),%rsi
   14012965e:	mov    0x1050(%rbx),%rax
   140129665:	add    0x1038(%rbx),%r14
   14012966c:	mov    %rax,0x30(%rsp)
   140129671:	test   %r13,%r13
   140129674:	je     140129683 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60a3>
   140129676:	lea    -0x5(%r13,%r13,4),%rcx
   14012967b:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129683:	cmpb   $0x0,0x1040(%rbx)
   14012968a:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129690:	movzbl (%r14),%eax
   140129694:	lea    0x2a9a05(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012969b:	lea    0x1(%r14),%rbp
   14012969f:	xor    %r12d,%r12d
   1401296a2:	mov    (%rdi,%rax,8),%rax
   1401296a6:	jmp    *%rax
   1401296a8:	cmp    $0x2,%r12b
   1401296ac:	je     14012b49b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ebb>
   1401296b2:	cmp    $0x1,%r12b
   1401296b6:	je     14012e5ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb00e>
   1401296bc:	mov    0x1048(%rbx),%rdx
   1401296c3:	mov    0x1050(%rbx),%rax
   1401296ca:	sub    0x38(%rsp),%rbp
   1401296cf:	sub    %rdx,%rsi
   1401296d2:	sub    %rdx,%rax
   1401296d5:	mov    %rbp,0x1038(%rbx)
   1401296dc:	mov    %rsi,%rdi
   1401296df:	sar    $0x3,%rdi
   1401296e3:	cmp    %rsi,%rax
   1401296e6:	jb     14012f77d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc19d>
   1401296ec:	vzeroupper
   1401296ef:	vmovdqa 0x245489(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401296f7:	mov    %rdi,0x1060(%rbx)
   1401296fe:	mov    %r15,%rdx
   140129701:	mov    %rbx,%rcx
   140129704:	movb   $0x0,0x153a0(%rbx)
   14012970b:	vmovdqa %xmm0,0x15390(%rbx)
   140129713:	call   14011ba20 <setun::VM::handle_new_instance(setun::Chunk const&)>
   140129718:	mov    0x1060(%rbx),%rax
   14012971f:	mov    0x1048(%rbx),%rdx
   140129726:	mov    0x150c0(%rbx),%r13
   14012972d:	mov    0x38(%rsp),%r14
   140129732:	lea    (%rdx,%rax,8),%rsi
   140129736:	mov    0x1050(%rbx),%rax
   14012973d:	add    0x1038(%rbx),%r14
   140129744:	mov    %rax,0x30(%rsp)
   140129749:	test   %r13,%r13
   14012974c:	je     14012975b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617b>
   14012974e:	lea    -0x5(%r13,%r13,4),%rcx
   140129753:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012975b:	cmpb   $0x0,0x1040(%rbx)
   140129762:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129768:	movzbl (%r14),%eax
   14012976c:	lea    0x2a992d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129773:	lea    0x1(%r14),%rbp
   140129777:	xor    %r12d,%r12d
   14012977a:	mov    (%rdi,%rax,8),%rax
   14012977e:	jmp    *%rax
   140129780:	cmp    $0x2,%r12b
   140129784:	je     14012b704 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8124>
   14012978a:	cmp    $0x1,%r12b
   14012978e:	je     14012e61e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb03e>
   140129794:	mov    0x1048(%rbx),%rdx
   14012979b:	mov    0x1050(%rbx),%rax
   1401297a2:	sub    0x38(%rsp),%rbp
   1401297a7:	sub    %rdx,%rsi
   1401297aa:	sub    %rdx,%rax
   1401297ad:	mov    %rbp,0x1038(%rbx)
   1401297b4:	mov    %rsi,%rdi
   1401297b7:	sar    $0x3,%rdi
   1401297bb:	cmp    %rsi,%rax
   1401297be:	jb     14012e353 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad73>
   1401297c4:	vzeroupper
   1401297c7:	mov    %rdi,0x1060(%rbx)
   1401297ce:	vmovdqa 0x2453aa(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401297d6:	movb   $0x0,0x153a0(%rbx)
   1401297dd:	mov    %r15,%rdx
   1401297e0:	mov    %rbx,%rcx
   1401297e3:	vmovdqa %xmm0,0x15390(%rbx)
   1401297eb:	call   14011b6e0 <setun::VM::handle_set_field(setun::Chunk const&)>
   1401297f0:	mov    0x1060(%rbx),%rax
   1401297f7:	mov    0x1048(%rbx),%rdx
   1401297fe:	mov    0x150c0(%rbx),%r13
   140129805:	mov    0x38(%rsp),%r14
   14012980a:	lea    (%rdx,%rax,8),%rsi
   14012980e:	mov    0x1050(%rbx),%rax
   140129815:	add    0x1038(%rbx),%r14
   14012981c:	mov    %rax,0x30(%rsp)
   140129821:	test   %r13,%r13
   140129824:	je     140129833 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6253>
   140129826:	lea    -0x5(%r13,%r13,4),%rcx
   14012982b:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129833:	cmpb   $0x0,0x1040(%rbx)
   14012983a:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129840:	movzbl (%r14),%eax
   140129844:	lea    0x2a9855(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012984b:	lea    0x1(%r14),%rbp
   14012984f:	xor    %r12d,%r12d
   140129852:	mov    (%rdi,%rax,8),%rax
   140129856:	jmp    *%rax
   140129858:	cmp    $0x2,%r12b
   14012985c:	je     14012bb36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8556>
   140129862:	cmp    $0x1,%r12b
   140129866:	je     14012e73e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb15e>
   14012986c:	mov    0x1048(%rbx),%rdx
   140129873:	mov    0x1050(%rbx),%rax
   14012987a:	sub    0x38(%rsp),%rbp
   14012987f:	sub    %rdx,%rsi
   140129882:	sub    %rdx,%rax
   140129885:	mov    %rbp,0x1038(%rbx)
   14012988c:	mov    %rsi,%rdi
   14012988f:	sar    $0x3,%rdi
   140129893:	cmp    %rsi,%rax
   140129896:	jb     14012f76d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc18d>
   14012989c:	vzeroupper
   14012989f:	vmovdqa 0x2452d9(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401298a7:	mov    %rdi,0x1060(%rbx)
   1401298ae:	mov    %r15,%rdx
   1401298b1:	mov    %rbx,%rcx
   1401298b4:	movb   $0x0,0x153a0(%rbx)
   1401298bb:	vmovdqa %xmm0,0x15390(%rbx)
   1401298c3:	call   140123450 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   1401298c8:	mov    0x1060(%rbx),%rax
   1401298cf:	mov    0x1048(%rbx),%rdx
   1401298d6:	mov    0x150c0(%rbx),%r13
   1401298dd:	mov    0x38(%rsp),%r14
   1401298e2:	lea    (%rdx,%rax,8),%rsi
   1401298e6:	mov    0x1050(%rbx),%rax
   1401298ed:	add    0x1038(%rbx),%r14
   1401298f4:	mov    %rax,0x30(%rsp)
   1401298f9:	test   %r13,%r13
   1401298fc:	je     14012990b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x632b>
   1401298fe:	lea    -0x5(%r13,%r13,4),%rcx
   140129903:	mov    0x10c8(%rbx,%rcx,8),%r13
   14012990b:	cmpb   $0x0,0x1040(%rbx)
   140129912:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129918:	movzbl (%r14),%eax
   14012991c:	lea    0x2a977d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129923:	lea    0x1(%r14),%rbp
   140129927:	xor    %r12d,%r12d
   14012992a:	mov    (%rdi,%rax,8),%rax
   14012992e:	jmp    *%rax
   140129930:	cmp    $0x2,%r12b
   140129934:	je     14012b948 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8368>
   14012993a:	cmp    $0x1,%r12b
   14012993e:	je     14012e7fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb21e>
   140129944:	mov    0x1048(%rbx),%rdx
   14012994b:	mov    0x1050(%rbx),%rax
   140129952:	sub    0x38(%rsp),%rbp
   140129957:	sub    %rdx,%rsi
   14012995a:	sub    %rdx,%rax
   14012995d:	mov    %rbp,0x1038(%rbx)
   140129964:	mov    %rsi,%rdi
   140129967:	sar    $0x3,%rdi
   14012996b:	cmp    %rsi,%rax
   14012996e:	jb     14012f775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc195>
   140129974:	vzeroupper
   140129977:	vmovdqa 0x245201(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012997f:	mov    %rdi,0x1060(%rbx)
   140129986:	mov    %r15,%rdx
   140129989:	mov    %rbx,%rcx
   14012998c:	movb   $0x0,0x153a0(%rbx)
   140129993:	vmovdqa %xmm0,0x15390(%rbx)
   14012999b:	call   1401052b0 <setun::VM::handle_try(setun::Chunk const&)>
   1401299a0:	mov    0x1060(%rbx),%rax
   1401299a7:	mov    0x1048(%rbx),%rdx
   1401299ae:	mov    0x150c0(%rbx),%r13
   1401299b5:	mov    0x38(%rsp),%r14
   1401299ba:	lea    (%rdx,%rax,8),%rsi
   1401299be:	mov    0x1050(%rbx),%rax
   1401299c5:	add    0x1038(%rbx),%r14
   1401299cc:	mov    %rax,0x30(%rsp)
   1401299d1:	test   %r13,%r13
   1401299d4:	je     1401299e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6403>
   1401299d6:	lea    -0x5(%r13,%r13,4),%rcx
   1401299db:	mov    0x10c8(%rbx,%rcx,8),%r13
   1401299e3:	cmpb   $0x0,0x1040(%rbx)
   1401299ea:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   1401299f0:	movzbl (%r14),%eax
   1401299f4:	lea    0x2a96a5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401299fb:	lea    0x1(%r14),%rbp
   1401299ff:	xor    %r12d,%r12d
   140129a02:	mov    (%rdi,%rax,8),%rax
   140129a06:	jmp    *%rax
   140129a08:	cmp    $0x2,%r12b
   140129a0c:	je     14012bc12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8632>
   140129a12:	cmp    $0x1,%r12b
   140129a16:	jne    140138e7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1589a>
   140129a1c:	lea    0x8(%rsi),%rcx
   140129a20:	cmp    0x30(%rsp),%rcx
   140129a25:	jae    1401321f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec15>
   140129a2b:	mov    0x1c8(%rsp),%rax
   140129a33:	mov    0x1048(%rbx),%rdx
   140129a3a:	mov    %rax,(%rsi)
   140129a3d:	mov    0x1050(%rbx),%rax
   140129a44:	vzeroupper
   140129a47:	sub    %rdx,%rcx
   140129a4a:	sub    0x38(%rsp),%rbp
   140129a4f:	sub    %rdx,%rax
   140129a52:	mov    %rcx,%rsi
   140129a55:	mov    %rbp,0x1038(%rbx)
   140129a5c:	sar    $0x3,%rsi
   140129a60:	cmp    %rcx,%rax
   140129a63:	jb     14012e302 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad22>
   140129a69:	vmovdqa 0x24510f(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129a71:	mov    %rsi,0x1060(%rbx)
   140129a78:	mov    %r15,%rdx
   140129a7b:	mov    %rbx,%rcx
   140129a7e:	movb   $0x0,0x153a0(%rbx)
   140129a85:	vmovdqa %xmm0,0x15390(%rbx)
   140129a8d:	call   140113df0 <setun::VM::handle_throw(setun::Chunk const&)>
   140129a92:	cmp    $0x2,%r12b
   140129a96:	je     14012bc4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x866e>
   140129a9c:	cmp    $0x1,%r12b
   140129aa0:	je     14012ebb3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5d3>
   140129aa6:	mov    0x1048(%rbx),%rdx
   140129aad:	mov    0x1050(%rbx),%rax
   140129ab4:	sub    0x38(%rsp),%rbp
   140129ab9:	sub    %rdx,%rsi
   140129abc:	mov    %rax,%rcx
   140129abf:	mov    %rbp,0x1038(%rbx)
   140129ac6:	mov    %rsi,%rdi
   140129ac9:	sub    %rdx,%rcx
   140129acc:	sar    $0x3,%rdi
   140129ad0:	cmp    %rsi,%rcx
   140129ad3:	jb     14012bcaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86ca>
   140129ad9:	vmovdqa 0x24509f(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129ae1:	mov    %rdi,0x1060(%rbx)
   140129ae8:	movb   $0x0,0x153a0(%rbx)
   140129aef:	mov    0x15108(%rbx),%rcx
   140129af6:	vmovdqa %xmm0,0x15390(%rbx)
   140129afe:	cmp    0x15100(%rbx),%rcx
   140129b05:	je     140129b12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6532>
   140129b07:	sub    $0x20,%rcx
   140129b0b:	mov    %rcx,0x15108(%rbx)
   140129b12:	mov    0x150c0(%rbx),%r13
   140129b19:	mov    0x38(%rsp),%r14
   140129b1e:	mov    %rax,0x30(%rsp)
   140129b23:	add    %rdx,%rsi
   140129b26:	add    0x1038(%rbx),%r14
   140129b2d:	test   %r13,%r13
   140129b30:	je     140129b3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x655f>
   140129b32:	lea    -0x5(%r13,%r13,4),%rcx
   140129b37:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129b3f:	cmpb   $0x0,0x1040(%rbx)
   140129b46:	je     140130c28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd648>
   140129b4c:	movzbl (%r14),%eax
   140129b50:	lea    0x2a9549(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129b57:	lea    0x1(%r14),%rbp
   140129b5b:	xor    %r12d,%r12d
   140129b5e:	mov    (%rdi,%rax,8),%rax
   140129b62:	jmp    *%rax
   140129b64:	cmp    $0x2,%r12b
   140129b68:	je     14012bba4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85c4>
   140129b6e:	cmp    $0x1,%r12b
   140129b72:	je     14012ea17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb437>
   140129b78:	mov    0x1048(%rbx),%rdx
   140129b7f:	mov    0x1050(%rbx),%rax
   140129b86:	sub    0x38(%rsp),%rbp
   140129b8b:	sub    %rdx,%rsi
   140129b8e:	sub    %rdx,%rax
   140129b91:	mov    %rbp,0x1038(%rbx)
   140129b98:	mov    %rsi,%rdi
   140129b9b:	sar    $0x3,%rdi
   140129b9f:	cmp    %rsi,%rax
   140129ba2:	jb     14012f825 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc245>
   140129ba8:	vzeroupper
   140129bab:	vmovdqa 0x244fcd(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129bb3:	mov    %rdi,0x1060(%rbx)
   140129bba:	mov    %r15,%rdx
   140129bbd:	mov    %rbx,%rcx
   140129bc0:	movb   $0x0,0x153a0(%rbx)
   140129bc7:	vmovdqa %xmm0,0x15390(%rbx)
   140129bcf:	call   140113140 <setun::VM::handle_closure(setun::Chunk const&)>
   140129bd4:	mov    0x1060(%rbx),%rax
   140129bdb:	mov    0x1048(%rbx),%rdx
   140129be2:	mov    0x150c0(%rbx),%r13
   140129be9:	mov    0x38(%rsp),%r14
   140129bee:	lea    (%rdx,%rax,8),%rsi
   140129bf2:	mov    0x1050(%rbx),%rax
   140129bf9:	add    0x1038(%rbx),%r14
   140129c00:	mov    %rax,0x30(%rsp)
   140129c05:	test   %r13,%r13
   140129c08:	je     140129c17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6637>
   140129c0a:	lea    -0x5(%r13,%r13,4),%rcx
   140129c0f:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129c17:	cmpb   $0x0,0x1040(%rbx)
   140129c1e:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129c24:	movzbl (%r14),%eax
   140129c28:	lea    0x2a9471(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129c2f:	lea    0x1(%r14),%rbp
   140129c33:	xor    %r12d,%r12d
   140129c36:	mov    (%rdi,%rax,8),%rax
   140129c3a:	jmp    *%rax
   140129c3c:	cmp    $0x2,%r12b
   140129c40:	je     14012a9ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73ee>
   140129c46:	cmp    $0x1,%r12b
   140129c4a:	je     14012ea47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb467>
   140129c50:	mov    0x1048(%rbx),%rdx
   140129c57:	mov    0x1050(%rbx),%rax
   140129c5e:	sub    0x38(%rsp),%rbp
   140129c63:	sub    %rdx,%rsi
   140129c66:	sub    %rdx,%rax
   140129c69:	mov    %rbp,0x1038(%rbx)
   140129c70:	mov    %rsi,%rdi
   140129c73:	sar    $0x3,%rdi
   140129c77:	cmp    %rsi,%rax
   140129c7a:	jb     14012e2ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad0a>
   140129c80:	vzeroupper
   140129c83:	mov    %rdi,0x1060(%rbx)
   140129c8a:	vmovdqa 0x244eee(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140129c92:	movb   $0x0,0x153a0(%rbx)
   140129c99:	mov    %r15,%rdx
   140129c9c:	mov    %rbx,%rcx
   140129c9f:	vmovdqa %xmm0,0x15390(%rbx)
   140129ca7:	call   14011a2f0 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   140129cac:	mov    0x1060(%rbx),%rax
   140129cb3:	mov    0x1048(%rbx),%rdx
   140129cba:	mov    0x150c0(%rbx),%r13
   140129cc1:	mov    0x38(%rsp),%r14
   140129cc6:	lea    (%rdx,%rax,8),%rsi
   140129cca:	mov    0x1050(%rbx),%rax
   140129cd1:	add    0x1038(%rbx),%r14
   140129cd8:	mov    %rax,0x30(%rsp)
   140129cdd:	test   %r13,%r13
   140129ce0:	je     140129cef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x670f>
   140129ce2:	lea    -0x5(%r13,%r13,4),%rcx
   140129ce7:	mov    0x10c8(%rbx,%rcx,8),%r13
   140129cef:	cmpb   $0x0,0x1040(%rbx)
   140129cf6:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140129cfc:	movzbl (%r14),%eax
   140129d00:	lea    0x2a9399(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129d07:	lea    0x1(%r14),%rbp
   140129d0b:	xor    %r12d,%r12d
   140129d0e:	mov    (%rdi,%rax,8),%rax
   140129d12:	jmp    *%rax
   140129d14:	movzwl 0x0(%rbp),%eax
   140129d18:	lea    0x2(%rbp),%r14
   140129d1c:	mov    %ax,0x40(%rsp)
   140129d21:	cmp    $0x2,%r12b
   140129d25:	je     14012abae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75ce>
   140129d2b:	cmp    $0x1,%r12b
   140129d2f:	jne    14012e3d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadf1>
   140129d35:	lea    0x8(%rsi),%rax
   140129d39:	cmp    0x30(%rsp),%rax
   140129d3e:	jae    140133f48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10968>
   140129d44:	mov    %rsi,%rdx
   140129d47:	mov    %rax,%rsi
   140129d4a:	mov    0x1c8(%rsp),%rax
   140129d52:	xor    %r12d,%r12d
   140129d55:	mov    %rax,(%rdx)
   140129d58:	vzeroupper
   140129d5b:	mov    $0x90,%ecx
   140129d60:	call   14034a1b0 <operator new(unsigned long long)>
   140129d65:	vpxor  %xmm0,%xmm0,%xmm0
   140129d69:	mov    %rax,%rdi
   140129d6c:	mov    0x244e6d(%rip),%rax        # 14036ebe0 <CSWTCH.3092+0x220>
   140129d73:	vmovdqu %ymm0,0x10(%rdi)
   140129d78:	lea    0x18(%rdi),%rcx
   140129d7c:	mov    %rax,0x8(%rdi)
   140129d80:	lea    0x264299(%rip),%rax        # 14038e020 <vtable for std::_Sp_counted_ptr_inplace<setun::ArrayObject, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140129d87:	mov    %rax,(%rdi)
   140129d8a:	lea    0x10(%rdi),%rax
   140129d8e:	mov    %rax,0x60(%rsp)
   140129d93:	movzwl 0x40(%rsp),%eax
   140129d98:	vmovdqu %ymm0,0x30(%rdi)
   140129d9d:	mov    %rax,0x80(%rsp)
   140129da5:	mov    %rax,%rdx
   140129da8:	vmovdqu %ymm0,0x50(%rdi)
   140129dad:	vmovdqu %ymm0,0x70(%rdi)
   140129db2:	vzeroupper
   140129db5:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140129dba:	cmpw   $0x0,0x40(%rsp)
   140129dc0:	je     14012ff40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc960>
   140129dc6:	mov    0x80(%rsp),%rax
   140129dce:	mov    0x18(%rdi),%rdx
   140129dd2:	mov    %rax,%rcx
   140129dd5:	lea    (%rdx,%rax,8),%r8
   140129dd9:	xor    %eax,%eax
   140129ddb:	neg    %rcx
   140129dde:	shl    $0x3,%rcx
   140129de2:	nopl   0x0(%rax,%rax,1)
   140129dea:	data16 cs nopw 0x0(%rax,%rax,1)
   140129df5:	data16 cs nopw 0x0(%rax,%rax,1)
   140129e00:	mov    -0x8(%rsi,%rax,1),%rdx
   140129e05:	mov    %rdx,-0x8(%r8,%rax,1)
   140129e0a:	sub    $0x8,%rax
   140129e0e:	cmp    %rcx,%rax
   140129e11:	jne    140129e00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6820>
   140129e13:	mov    0x60(%rsp),%rcx
   140129e18:	add    %rax,%rsi
   140129e1b:	call   140156cf0 <setun::ArrayObject::try_promote()>
   140129e20:	test   %r12b,%r12b
   140129e23:	jne    14012de92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8b2>
   140129e29:	mov    0x60(%rsp),%rax
   140129e2e:	mov    %rax,0x680(%rsp)
   140129e36:	lock addl $0x1,0x8(%rdi)
   140129e3b:	lea    0x680(%rsp),%rdx
   140129e43:	lea    0x540(%rsp),%rcx
   140129e4b:	mov    %rdi,0x688(%rsp)
   140129e53:	call   14021df40 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   140129e58:	mov    0x540(%rsp),%rax
   140129e60:	mov    0x688(%rsp),%rcx
   140129e68:	mov    $0x1,%r12d
   140129e6e:	mov    %rax,0x1c8(%rsp)
   140129e76:	test   %rcx,%rcx
   140129e79:	je     140129e80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68a0>
   140129e7b:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140129e80:	mov    %rdi,%rcx
   140129e83:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140129e88:	cmpb   $0x0,0x1040(%rbx)
   140129e8f:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140129e95:	movzbl 0x2(%rbp),%eax
   140129e99:	lea    0x2a9200(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129ea0:	add    $0x3,%rbp
   140129ea4:	mov    (%rdi,%rax,8),%rax
   140129ea8:	jmp    *%rax
   140129eaa:	movabs $0xfffb000000000000,%rax
   140129eb4:	mov    %rax,0x308(%rsp)
   140129ebc:	mov    %rax,0x310(%rsp)
   140129ec4:	cmp    $0x2,%r12b
   140129ec8:	jne    140131197 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbb7>
   140129ece:	mov    0x1c8(%rsp),%rax
   140129ed6:	movabs $0xffff000000000000,%rdx
   140129ee0:	movabs $0xfffd000000000000,%rcx
   140129eea:	mov    %rax,0x310(%rsp)
   140129ef2:	mov    0x1d0(%rsp),%rax
   140129efa:	and    %rax,%rdx
   140129efd:	mov    %rax,0x308(%rsp)
   140129f05:	cmp    %rcx,%rdx
   140129f08:	je     14012d465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e85>
   140129f0e:	movabs $0xfff8000000000000,%rax
   140129f18:	mov    $0x1,%r12d
   140129f1e:	mov    %rax,0x1c8(%rsp)
   140129f26:	cmpb   $0x0,0x1040(%rbx)
   140129f2d:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140129f33:	movzbl 0x0(%rbp),%eax
   140129f37:	lea    0x2a9162(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129f3e:	add    $0x1,%rbp
   140129f42:	mov    (%rdi,%rax,8),%rax
   140129f46:	jmp    *%rax
   140129f48:	movabs $0xfffb000000000000,%rax
   140129f52:	mov    %rax,0x318(%rsp)
   140129f5a:	mov    %rax,0x320(%rsp)
   140129f62:	cmp    $0x1,%r12b
   140129f66:	jne    140130908 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd328>
   140129f6c:	mov    0x1c8(%rsp),%rax
   140129f74:	xor    %r12d,%r12d
   140129f77:	mov    %rax,0x318(%rsp)
   140129f7f:	mov    -0x8(%rsi),%rdx
   140129f83:	mov    %rsi,%rax
   140129f86:	sub    $0x10,%rsi
   140129f8a:	mov    %rdx,0x320(%rsp)
   140129f92:	mov    -0x10(%rax),%rdx
   140129f96:	movabs $0xffff000000000000,%rax
   140129fa0:	movabs $0xfffd000000000000,%rcx
   140129faa:	and    %rdx,%rax
   140129fad:	cmp    %rcx,%rax
   140129fb0:	je     14012b36d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d8d>
   140129fb6:	cmpb   $0x0,0x1040(%rbx)
   140129fbd:	je     140130630 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd050>
   140129fc3:	movzbl 0x0(%rbp),%eax
   140129fc7:	lea    0x2a90d2(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129fce:	add    $0x1,%rbp
   140129fd2:	mov    (%rdi,%rax,8),%rax
   140129fd6:	jmp    *%rax
   140129fd8:	test   %r12b,%r12b
   140129fdb:	je     14012a3a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dc4>
   140129fe1:	cmp    $0x1,%r12b
   140129fe5:	je     14012f5f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc012>
   140129feb:	lea    0x8(%rsi),%r8
   140129fef:	cmp    0x30(%rsp),%r8
   140129ff4:	jae    1401345df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fff>
   140129ffa:	mov    0x1d0(%rsp),%rax
   14012a002:	mov    %rax,(%rsi)
   14012a005:	mov    0x1c8(%rsp),%rax
   14012a00d:	mov    %r8,%rsi
   14012a010:	mov    %rax,0x1d0(%rsp)
   14012a018:	mov    0x1068(%rbx),%rax
   14012a01f:	mov    (%rax,%r13,8),%rax
   14012a023:	mov    %rax,0x1c8(%rsp)
   14012a02b:	cmpb   $0x0,0x1040(%rbx)
   14012a032:	jne    14012a3c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6de6>
   14012a038:	mov    0x1048(%rbx),%rdx
   14012a03f:	mov    %rbp,%r14
   14012a042:	vzeroupper
   14012a045:	jmp    14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   14012a04a:	test   %r12b,%r12b
   14012a04d:	je     14012a3f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e12>
   14012a053:	cmp    $0x1,%r12b
   14012a057:	je     14012f726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc146>
   14012a05d:	lea    0x8(%rsi),%r8
   14012a061:	cmp    0x30(%rsp),%r8
   14012a066:	jae    1401331b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbd0>
   14012a06c:	mov    0x1d0(%rsp),%rax
   14012a074:	mov    %rax,(%rsi)
   14012a077:	mov    0x1c8(%rsp),%rax
   14012a07f:	mov    %r8,%rsi
   14012a082:	mov    %rax,0x1d0(%rsp)
   14012a08a:	mov    0x1068(%rbx),%rax
   14012a091:	mov    0x8(%rax,%r13,8),%rax
   14012a096:	mov    %rax,0x1c8(%rsp)
   14012a09e:	cmpb   $0x0,0x1040(%rbx)
   14012a0a5:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   14012a0a7:	movzbl 0x0(%rbp),%eax
   14012a0ab:	lea    0x2a8fee(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a0b2:	add    $0x1,%rbp
   14012a0b6:	mov    (%rdi,%rax,8),%rax
   14012a0ba:	jmp    *%rax
   14012a0bc:	test   %r12b,%r12b
   14012a0bf:	je     14012a368 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d88>
   14012a0c5:	cmp    $0x1,%r12b
   14012a0c9:	je     14012f6cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0ec>
   14012a0cf:	lea    0x8(%rsi),%r8
   14012a0d3:	cmp    0x30(%rsp),%r8
   14012a0d8:	jae    140133a01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10421>
   14012a0de:	mov    0x1d0(%rsp),%rax
   14012a0e6:	mov    %rax,(%rsi)
   14012a0e9:	mov    0x1c8(%rsp),%rax
   14012a0f1:	mov    %r8,%rsi
   14012a0f4:	mov    %rax,0x1d0(%rsp)
   14012a0fc:	mov    0x1068(%rbx),%rax
   14012a103:	mov    0x10(%rax,%r13,8),%rax
   14012a108:	mov    %rax,0x1c8(%rsp)
   14012a110:	cmpb   $0x0,0x1040(%rbx)
   14012a117:	jne    14012a38f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6daf>
   14012a11d:	jmp    14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   14012a122:	nopw   0x0(%rax,%rax,1)
   14012a128:	test   %r12b,%r12b
   14012a12b:	je     14012a44d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e6d>
   14012a131:	cmp    $0x1,%r12b
   14012a135:	je     14012f589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfa9>
   14012a13b:	lea    0x8(%rsi),%r8
   14012a13f:	cmp    0x30(%rsp),%r8
   14012a144:	jae    14013441a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e3a>
   14012a14a:	mov    0x1d0(%rsp),%rax
   14012a152:	mov    %rax,(%rsi)
   14012a155:	mov    0x1c8(%rsp),%rax
   14012a15d:	mov    %r8,%rsi
   14012a160:	mov    %rax,0x1d0(%rsp)
   14012a168:	mov    0x1068(%rbx),%rax
   14012a16f:	mov    0x18(%rax,%r13,8),%rax
   14012a174:	mov    %rax,0x1c8(%rsp)
   14012a17c:	cmpb   $0x0,0x1040(%rbx)
   14012a183:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   14012a189:	movzbl 0x0(%rbp),%eax
   14012a18d:	lea    0x2a8f0c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a194:	add    $0x1,%rbp
   14012a198:	mov    (%rdi,%rax,8),%rax
   14012a19c:	jmp    *%rax
   14012a19e:	mov    0x1068(%rbx),%rax
   14012a1a5:	test   %r12b,%r12b
   14012a1a8:	je     140130c48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd668>
   14012a1ae:	mov    0x1c8(%rsp),%rdx
   14012a1b6:	mov    %rdx,(%rax,%r13,8)
   14012a1ba:	cmpb   $0x0,0x1040(%rbx)
   14012a1c1:	je     14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   14012a1c7:	movzbl 0x0(%rbp),%eax
   14012a1cb:	lea    0x2a8ece(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a1d2:	add    $0x1,%rbp
   14012a1d6:	mov    (%rdi,%rax,8),%rax
   14012a1da:	jmp    *%rax
   14012a1dc:	vzeroupper
   14012a1df:	nop
   14012a1e0:	mov    %rbp,%r14
   14012a1e3:	mov    0x1048(%rbx),%rdx
   14012a1ea:	mov    0x1050(%rbx),%rax
   14012a1f1:	lea    0x8(%rsi),%r8
   14012a1f5:	cmp    0x30(%rsp),%r8
   14012a1fa:	jae    14012e1ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac1f>
   14012a200:	mov    0x1c8(%rsp),%rcx
   14012a208:	mov    %rcx,(%rsi)
   14012a20b:	mov    %r8,%rsi
   14012a20e:	mov    %r14,%rcx
   14012a211:	sub    %rdx,%rsi
   14012a214:	sub    0x38(%rsp),%rcx
   14012a219:	sub    %rdx,%rax
   14012a21c:	mov    %rcx,0x1038(%rbx)
   14012a223:	mov    %rsi,%rcx
   14012a226:	sar    $0x3,%rcx
   14012a22a:	mov    %rcx,%rdi
   14012a22d:	cmp    %rsi,%rax
   14012a230:	jb     14012a288 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ca8>
   14012a232:	vmovdqa 0x244946(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012a23a:	mov    %rcx,0x1060(%rbx)
   14012a241:	movb   $0x0,0x153a0(%rbx)
   14012a248:	vmovdqa %xmm0,0x15390(%rbx)
   14012a250:	jmp    140125599 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fb9>
   14012a255:	movb   $0x0,0x1040(%rbx)
   14012a25c:	mov    %rbp,%r14
   14012a25f:	mov    0x1048(%rbx),%rdx
   14012a266:	vzeroupper
   14012a269:	jmp    14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   14012a26e:	xchg   %ax,%ax
   14012a270:	cmp    $0x1,%r12b
   14012a274:	je     14012a1ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c0a>
   14012a27a:	mov    0x1050(%rbx),%rax
   14012a281:	jmp    14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012a283:	nopl   0x0(%rax,%rax,1)
   14012a288:	lea    (%rdi,%rdi,1),%rdx
   14012a28c:	lea    0x1048(%rbx),%rcx
   14012a293:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a298:	vmovdqa 0x2448e0(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012a2a0:	mov    %rdi,0x1060(%rbx)
   14012a2a7:	movb   $0x0,0x153a0(%rbx)
   14012a2ae:	vmovdqa %xmm0,0x15390(%rbx)
   14012a2b6:	jmp    140125599 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fb9>
   14012a2bb:	nopl   0x0(%rax,%rax,1)
   14012a2c0:	mov    0x0(%r13),%rax
   14012a2c4:	mov    %r13,%rcx
   14012a2c7:	movq   $0x0,0x8(%r13)
   14012a2cf:	call   *0x10(%rax)
   14012a2d2:	mov    0x0(%r13),%rax
   14012a2d6:	mov    %r13,%rcx
   14012a2d9:	call   *0x18(%rax)
   14012a2dc:	mov    %rsi,0x8(%r12)
   14012a2e1:	jmp    140123876 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x296>
   14012a2e6:	mov    -0x8(%rsi),%rdx
   14012a2ea:	mov    %rdx,0x18(%rax,%r13,8)
   14012a2ef:	cmpb   $0x0,0x1040(%rbx)
   14012a2f6:	jne    140127c18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4638>
   14012a2fc:	mov    %rbp,%r14
   14012a2ff:	nop
   14012a300:	mov    0x1048(%rbx),%rdx
   14012a307:	mov    0x1050(%rbx),%rax
   14012a30e:	vzeroupper
   14012a311:	jmp    14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14012a316:	lea    0x1c8(%rsp),%rcx
   14012a31e:	vzeroupper
   14012a321:	call   140229240 <setun::VMValue::neg() const>
   14012a326:	mov    %rax,0x1c8(%rsp)
   14012a32e:	cmpb   $0x0,0x1040(%rbx)
   14012a335:	jne    140126336 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d56>
   14012a33b:	mov    %rbp,%r14
   14012a33e:	mov    0x1048(%rbx),%rdx
   14012a345:	jmp    14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   14012a34a:	test   %dil,%dil
   14012a34d:	jne    14012e5c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafe0>
   14012a353:	movabs $0xfffa000000000000,%rax
   14012a35d:	mov    $0x1,%r12d
   14012a363:	jmp    140128a17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5437>
   14012a368:	mov    0x1068(%rbx),%rax
   14012a36f:	mov    $0x1,%r12d
   14012a375:	mov    0x10(%rax,%r13,8),%rax
   14012a37a:	mov    %rax,0x1c8(%rsp)
   14012a382:	cmpb   $0x0,0x1040(%rbx)
   14012a389:	je     14012a419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e39>
   14012a38f:	movzbl 0x0(%rbp),%eax
   14012a393:	lea    0x2a8d06(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a39a:	add    $0x1,%rbp
   14012a39e:	mov    (%rdi,%rax,8),%rax
   14012a3a2:	jmp    *%rax
   14012a3a4:	mov    0x1068(%rbx),%rax
   14012a3ab:	mov    $0x1,%r12d
   14012a3b1:	mov    (%rax,%r13,8),%rax
   14012a3b5:	mov    %rax,0x1c8(%rsp)
   14012a3bd:	cmpb   $0x0,0x1040(%rbx)
   14012a3c4:	je     14012a419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e39>
   14012a3c6:	movzbl 0x0(%rbp),%eax
   14012a3ca:	lea    0x2a8ccf(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a3d1:	add    $0x1,%rbp
   14012a3d5:	mov    (%rdi,%rax,8),%rax
   14012a3d9:	jmp    *%rax
   14012a3db:	mov    -0x8(%rsi),%rax
   14012a3df:	mov    $0x1,%r12d
   14012a3e5:	mov    %rax,0x1c8(%rsp)
   14012a3ed:	jmp    140126f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x392b>
   14012a3f2:	mov    0x1068(%rbx),%rax
   14012a3f9:	mov    $0x1,%r12d
   14012a3ff:	mov    0x8(%rax,%r13,8),%rax
   14012a404:	mov    %rax,0x1c8(%rsp)
   14012a40c:	cmpb   $0x0,0x1040(%rbx)
   14012a413:	jne    14012a0a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ac7>
   14012a419:	mov    0x1048(%rbx),%rdx
   14012a420:	mov    %rbp,%r14
   14012a423:	vzeroupper
   14012a426:	jmp    14012a1ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c0a>
   14012a42b:	vmovq  %rdi,%xmm0
   14012a430:	mov    $0x1,%r12d
   14012a436:	movabs $0xfffc000000000000,%rax
   14012a440:	vucomisd %xmm0,%xmm0
   14012a444:	cmovnp %rdi,%rax
   14012a448:	jmp    14012898a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53aa>
   14012a44d:	mov    0x1068(%rbx),%rax
   14012a454:	mov    $0x1,%r12d
   14012a45a:	mov    0x18(%rax,%r13,8),%rax
   14012a45f:	mov    %rax,0x1c8(%rsp)
   14012a467:	cmpb   $0x0,0x1040(%rbx)
   14012a46e:	jne    14012a189 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ba9>
   14012a474:	jmp    14012a419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e39>
   14012a476:	lea    -0x8(%rsi),%rdx
   14012a47a:	lea    0x1c8(%rsp),%rax
   14012a482:	test   %r12b,%r12b
   14012a485:	cmove  %rdx,%rax
   14012a489:	mov    (%rax),%rcx
   14012a48c:	movabs $0xffffffff00000000,%rax
   14012a496:	movabs $0xfffd000200000000,%rdx
   14012a4a0:	and    %rcx,%rax
   14012a4a3:	cmp    %rdx,%rax
   14012a4a6:	je     14012fde7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc807>
   14012a4ac:	vzeroupper
   14012a4af:	cmp    $0x2,%r12b
   14012a4b3:	je     14012e398 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb8>
   14012a4b9:	cmp    $0x1,%r12b
   14012a4bd:	jne    14012784a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x426a>
   14012a4c3:	mov    0x1048(%rbx),%rdx
   14012a4ca:	lea    0x8(%rsi),%r8
   14012a4ce:	cmp    0x30(%rsp),%r8
   14012a4d3:	jae    140134a31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11451>
   14012a4d9:	mov    0x1050(%rbx),%rax
   14012a4e0:	mov    %r8,%rcx
   14012a4e3:	mov    0x1c8(%rsp),%r8
   14012a4eb:	mov    %r8,(%rsi)
   14012a4ee:	jmp    14012785b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x427b>
   14012a4f3:	movzwl %di,%eax
   14012a4f6:	mov    $0x1,%r12d
   14012a4fc:	movabs $0xfff9000000000000,%rdx
   14012a506:	or     %rdx,%rax
   14012a509:	jmp    1401272ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d0c>
   14012a50e:	mov    0x1080(%rbx),%rax
   14012a515:	mov    $0x1,%r12d
   14012a51b:	mov    (%rax,%rdi,8),%rax
   14012a51f:	mov    %rax,0x1c8(%rsp)
   14012a527:	jmp    1401270b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ad4>
   14012a52c:	mov    0x1068(%rbx),%rax
   14012a533:	mov    $0x1,%r12d
   14012a539:	mov    (%rax,%rdi,8),%rax
   14012a53d:	mov    %rax,0x1c8(%rsp)
   14012a545:	jmp    140126fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39c6>
   14012a54a:	mov    %r13,%rcx
   14012a54d:	call   1402e8110 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release_last_use_cold()>
   14012a552:	jmp    140123871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x291>
   14012a557:	mov    %rax,%rcx
   14012a55a:	mov    0x8(%rax),%eax
   14012a55d:	mov    %eax,0xa0(%rsp)
   14012a564:	add    $0x1,%eax
   14012a567:	mov    %eax,0x8(%rcx)
   14012a56a:	cmp    0xc(%rcx),%eax
   14012a56d:	jb     14012a63c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x705c>
   14012a573:	cmp    $0x2,%r12b
   14012a577:	je     140138f66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15986>
   14012a57d:	sub    $0x1,%r12b
   14012a581:	je     140138f33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15953>
   14012a587:	mov    0x1048(%rbx),%rdx
   14012a58e:	mov    0x1050(%rbx),%rax
   14012a595:	vzeroupper
   14012a598:	sub    %rdx,%rsi
   14012a59b:	mov    %r14,%rcx
   14012a59e:	sub    %rdx,%rax
   14012a5a1:	sub    0x38(%rsp),%rcx
   14012a5a6:	mov    %rsi,%rbp
   14012a5a9:	mov    %rcx,0x1038(%rbx)
   14012a5b0:	sar    $0x3,%rbp
   14012a5b4:	cmp    %rsi,%rax
   14012a5b7:	jb     140136e3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1385e>
   14012a5bd:	mov    %rbp,0x1060(%rbx)
   14012a5c4:	mov    0x60(%rsp),%r9d
   14012a5c9:	mov    %rbx,%rdx
   14012a5cc:	mov    %r15,%r8
   14012a5cf:	vmovdqa 0x2445a9(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012a5d7:	mov    0xc0(%rsp),%rax
   14012a5df:	movb   $0x0,0x153a0(%rbx)
   14012a5e6:	mov    0x152c8(%rbx),%rcx
   14012a5ed:	vmovdqa %xmm0,0x15390(%rbx)
   14012a5f5:	mov    %rax,0x20(%rsp)
   14012a5fa:	call   14017fe00 <setun::JITManager::slow_tiering_coordinator_call(setun::VM*, setun::Chunk const&, unsigned long long, setun::FunctionHotData&)>
   14012a5ff:	mov    0x1060(%rbx),%rcx
   14012a606:	mov    0x38(%rsp),%r14
   14012a60b:	mov    0x1048(%rbx),%rdx
   14012a612:	add    0x1038(%rbx),%r14
   14012a619:	lea    (%rdx,%rcx,8),%rsi
   14012a61d:	mov    0x1050(%rbx),%rcx
   14012a624:	mov    %rcx,0x30(%rsp)
   14012a629:	test   %al,%al
   14012a62b:	jne    14012a639 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7059>
   14012a62d:	mov    0xc0(%rsp),%rax
   14012a635:	addl   $0x64,0xc(%rax)
   14012a639:	xor    %r12d,%r12d
   14012a63c:	cmpb   $0x0,0x15211(%rbx)
   14012a643:	je     14012e1d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf0>
   14012a649:	mov    0x150c0(%rbx),%rax
   14012a650:	mov    0x15268(%rbx),%r13
   14012a657:	test   %rax,%rax
   14012a65a:	je     14012f4fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf1b>
   14012a660:	lea    (%rax,%rax,4),%rax
   14012a664:	lea    (%rbx,%rax,8),%rdx
   14012a668:	mov    0x10a0(%rdx),%rax
   14012a66f:	mov    0x10b0(%rdx),%rdx
   14012a676:	add    %rdx,%rax
   14012a679:	cmp    %rax,%r13
   14012a67c:	jb     140136e81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138a1>
   14012a682:	mov    0x40(%rsp),%rax
   14012a687:	lea    (%rax,%r13,1),%rdx
   14012a68b:	mov    0x1070(%rbx),%rax
   14012a692:	sub    0x1068(%rbx),%rax
   14012a699:	mov    %rdx,0x15268(%rbx)
   14012a6a0:	sar    $0x3,%rax
   14012a6a4:	add    $0x40,%rdx
   14012a6a8:	cmp    %rax,%rdx
   14012a6ab:	jae    140133831 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10251>
   14012a6b1:	movzbl 0x80(%rsp),%r11d
   14012a6ba:	test   %r11b,%r11b
   14012a6bd:	je     14012e510 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf30>
   14012a6c3:	movzbl %r11b,%r8d
   14012a6c7:	lea    -0x2(%rdi),%rdx
   14012a6cb:	lea    -0x1(%rdi,%r13,1),%rcx
   14012a6d0:	sub    $0x1,%r8d
   14012a6d4:	lea    0x0(,%rcx,8),%rax
   14012a6dc:	sub    %r8,%rdx
   14012a6df:	mov    0x1068(%rbx),%r8
   14012a6e6:	add    %r13,%rdx
   14012a6e9:	shl    $0x3,%rdx
   14012a6ed:	cmp    $0x1,%r12b
   14012a6f1:	je     14012a722 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7142>
   14012a6f3:	cmp    $0x2,%r12b
   14012a6f7:	jne    14012a737 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7157>
   14012a6f9:	mov    0x1c8(%rsp),%r9
   14012a701:	sub    $0x8,%rax
   14012a705:	mov    %r9,(%r8,%rcx,8)
   14012a709:	mov    0x1d0(%rsp),%rcx
   14012a711:	mov    %rcx,0x1c8(%rsp)
   14012a719:	cmp    %rdx,%rax
   14012a71c:	je     14012f83f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc25f>
   14012a722:	mov    0x1c8(%rsp),%rcx
   14012a72a:	mov    %rcx,(%r8,%rax,1)
   14012a72e:	sub    $0x8,%rax
   14012a732:	cmp    %rdx,%rax
   14012a735:	je     14012a74f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x716f>
   14012a737:	mov    %rsi,%rcx
   14012a73a:	sub    $0x8,%rsi
   14012a73e:	mov    -0x8(%rcx),%rcx
   14012a742:	mov    %rcx,(%r8,%rax,1)
   14012a746:	sub    $0x8,%rax
   14012a74a:	cmp    %rdx,%rax
   14012a74d:	jne    14012a737 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7157>
   14012a74f:	mov    0x1048(%rbx),%rdx
   14012a756:	sub    %rdx,%rsi
   14012a759:	mov    0x150c0(%rbx),%rax
   14012a760:	mov    %r14,%rcx
   14012a763:	mov    0x60(%rsp),%r14d
   14012a768:	mov    %rsi,%rbp
   14012a76b:	sub    0x38(%rsp),%rcx
   14012a770:	sar    $0x3,%rbp
   14012a774:	cmp    $0x7ff,%rax
   14012a77a:	ja     140139a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b4>
   14012a780:	mov    0x40(%rsp),%rdi
   14012a785:	lea    0x1(%rax),%r8
   14012a789:	lea    (%rax,%rax,4),%rax
   14012a78d:	mov    %r8,0x150c0(%rbx)
   14012a794:	mov    %rcx,0x10c0(%rbx,%rax,8)
   14012a79c:	mov    %r13,0x10c8(%rbx,%rax,8)
   14012a7a4:	mov    %rbp,0x10d0(%rbx,%rax,8)
   14012a7ac:	mov    %rdi,0x10d8(%rbx,%rax,8)
   14012a7b4:	mov    %r14,0x10e0(%rbx,%rax,8)
   14012a7bc:	mov    0x1050(%rbx),%rax
   14012a7c3:	sub    %rdx,%rax
   14012a7c6:	cmp    %rsi,%rax
   14012a7c9:	jb     14012e5d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaff5>
   14012a7cf:	mov    0x15270(%rbx),%rax
   14012a7d6:	mov    %rbp,0x1060(%rbx)
   14012a7dd:	mov    0x152a0(%rbx),%rdi
   14012a7e4:	cmp    %rdi,0x68(%rax)
   14012a7e8:	jae    140132109 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb29>
   14012a7ee:	mov    0x1060(%rbx),%rax
   14012a7f5:	mov    0x1048(%rbx),%rdx
   14012a7fc:	add    0x38(%rsp),%r14
   14012a801:	lea    (%rdx,%rax,8),%rsi
   14012a805:	cmpb   $0x0,0x1040(%rbx)
   14012a80c:	je     14012a307 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d27>
   14012a812:	movzbl (%r14),%eax
   14012a816:	lea    0x2a8883(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a81d:	lea    0x1(%r14),%rbp
   14012a821:	xor    %r12d,%r12d
   14012a824:	mov    (%rdi,%rax,8),%rax
   14012a828:	jmp    *%rax
   14012a82a:	cmp    $0x2,%r12b
   14012a82e:	je     140132d46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf766>
   14012a834:	mov    -0x8(%rsi),%rax
   14012a838:	sub    $0x8,%rsi
   14012a83c:	mov    %rax,0x2f8(%rsp)
   14012a844:	lea    0x2f8(%rsp),%rcx
   14012a84c:	vzeroupper
   14012a84f:	call   14022a280 <setun::VMValue::as_bool() const>
   14012a854:	test   %al,%al
   14012a856:	jne    14012455a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7a>
   14012a85c:	movswq %di,%rax
   14012a860:	add    %rax,%r14
   14012a863:	jmp    14012455a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7a>
   14012a868:	mov    0x1078(%rax),%r13
   14012a86f:	jmp    140124c6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x168a>
   14012a874:	cmp    0x40(%rsp),%rbp
   14012a879:	jle    140127ea4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48c4>
   14012a87f:	jmp    140127ead <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48cd>
   14012a884:	lea    0x10(%rsi),%r8
   14012a888:	cmp    0x30(%rsp),%r8
   14012a88d:	jae    140133364 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd84>
   14012a893:	mov    0x1d0(%rsp),%rax
   14012a89b:	mov    0x1048(%rbx),%rdx
   14012a8a2:	mov    %rax,(%rsi)
   14012a8a5:	mov    0x1c8(%rsp),%rax
   14012a8ad:	mov    %rax,0x8(%rsi)
   14012a8b1:	mov    0x1050(%rbx),%rax
   14012a8b8:	vzeroupper
   14012a8bb:	sub    %rdx,%r8
   14012a8be:	sub    0x38(%rsp),%rbp
   14012a8c3:	sub    %rdx,%rax
   14012a8c6:	mov    %r8,%rdi
   14012a8c9:	mov    %rbp,0x1038(%rbx)
   14012a8d0:	sar    $0x3,%rdi
   14012a8d4:	cmp    %r8,%rax
   14012a8d7:	jae    140128da7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57c7>
   14012a8dd:	lea    (%rdi,%rdi,1),%rdx
   14012a8e1:	lea    0x1048(%rbx),%rcx
   14012a8e8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a8ed:	jmp    140128da7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57c7>
   14012a8f2:	lea    0x10(%rsi),%r8
   14012a8f6:	cmp    0x30(%rsp),%r8
   14012a8fb:	jae    140134015 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a35>
   14012a901:	mov    0x1d0(%rsp),%rax
   14012a909:	mov    0x1048(%rbx),%rdx
   14012a910:	mov    %rax,(%rsi)
   14012a913:	mov    0x1c8(%rsp),%rax
   14012a91b:	mov    %rax,0x8(%rsi)
   14012a91f:	mov    0x1050(%rbx),%rax
   14012a926:	vzeroupper
   14012a929:	sub    %rdx,%r8
   14012a92c:	sub    0x38(%rsp),%rbp
   14012a931:	sub    %rdx,%rax
   14012a934:	mov    %r8,%rdi
   14012a937:	mov    %rbp,0x1038(%rbx)
   14012a93e:	sar    $0x3,%rdi
   14012a942:	cmp    %r8,%rax
   14012a945:	jae    140128e7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x589f>
   14012a94b:	lea    (%rdi,%rdi,1),%rdx
   14012a94f:	lea    0x1048(%rbx),%rcx
   14012a956:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a95b:	jmp    140128e7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x589f>
   14012a960:	lea    0x10(%rsi),%r8
   14012a964:	cmp    0x30(%rsp),%r8
   14012a969:	jae    14013408f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10aaf>
   14012a96f:	mov    0x1d0(%rsp),%rax
   14012a977:	mov    0x1048(%rbx),%rdx
   14012a97e:	mov    %rax,(%rsi)
   14012a981:	mov    0x1c8(%rsp),%rax
   14012a989:	mov    %rax,0x8(%rsi)
   14012a98d:	mov    0x1050(%rbx),%rax
   14012a994:	vzeroupper
   14012a997:	sub    %rdx,%r8
   14012a99a:	sub    0x38(%rsp),%rbp
   14012a99f:	sub    %rdx,%rax
   14012a9a2:	mov    %r8,%rdi
   14012a9a5:	mov    %rbp,0x1038(%rbx)
   14012a9ac:	sar    $0x3,%rdi
   14012a9b0:	cmp    %r8,%rax
   14012a9b3:	jae    140124ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1702>
   14012a9b9:	lea    (%rdi,%rdi,1),%rdx
   14012a9bd:	lea    0x1048(%rbx),%rcx
   14012a9c4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a9c9:	jmp    140124ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1702>
   14012a9ce:	lea    0x10(%rsi),%r8
   14012a9d2:	cmp    0x30(%rsp),%r8
   14012a9d7:	jae    1401337e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10203>
   14012a9dd:	mov    0x1d0(%rsp),%rax
   14012a9e5:	mov    0x1048(%rbx),%rdx
   14012a9ec:	mov    %rax,(%rsi)
   14012a9ef:	mov    0x1c8(%rsp),%rax
   14012a9f7:	mov    %rax,0x8(%rsi)
   14012a9fb:	mov    0x1050(%rbx),%rax
   14012aa02:	vzeroupper
   14012aa05:	sub    %rdx,%r8
   14012aa08:	sub    0x38(%rsp),%rbp
   14012aa0d:	sub    %rdx,%rax
   14012aa10:	mov    %r8,%rcx
   14012aa13:	mov    %rbp,0x1038(%rbx)
   14012aa1a:	sar    $0x3,%rcx
   14012aa1e:	mov    %rcx,%rdi
   14012aa21:	cmp    %r8,%rax
   14012aa24:	jb     14012e2ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad0d>
   14012aa2a:	mov    %rcx,0x1060(%rbx)
   14012aa31:	jmp    140129c8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66aa>
   14012aa36:	lea    0x680(%rsp),%rcx
   14012aa3e:	mov    %rdi,%rdx
   14012aa41:	vzeroupper
   14012aa44:	mov    $0x1,%r12d
   14012aa4a:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012aa4f:	mov    0x680(%rsp),%rax
   14012aa57:	mov    %rax,0x1c8(%rsp)
   14012aa5f:	jmp    1401242b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd3>
   14012aa64:	lea    0x10(%rsi),%r8
   14012aa68:	cmp    0x30(%rsp),%r8
   14012aa6d:	jae    1401340dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10afd>
   14012aa73:	mov    0x1d0(%rsp),%rax
   14012aa7b:	mov    0x1048(%rbx),%rdx
   14012aa82:	mov    %rax,(%rsi)
   14012aa85:	mov    0x1c8(%rsp),%rax
   14012aa8d:	mov    %rax,0x8(%rsi)
   14012aa91:	mov    0x1050(%rbx),%rax
   14012aa98:	vzeroupper
   14012aa9b:	sub    %rdx,%r8
   14012aa9e:	sub    0x38(%rsp),%rbp
   14012aaa3:	sub    %rdx,%rax
   14012aaa6:	mov    %r8,%rdi
   14012aaa9:	mov    %rbp,0x1038(%rbx)
   14012aab0:	sar    $0x3,%rdi
   14012aab4:	cmp    %r8,%rax
   14012aab7:	jae    140128f57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5977>
   14012aabd:	lea    (%rdi,%rdi,1),%rdx
   14012aac1:	lea    0x1048(%rbx),%rcx
   14012aac8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012aacd:	jmp    140128f57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5977>
   14012aad2:	lea    0x10(%rsi),%r8
   14012aad6:	cmp    0x30(%rsp),%r8
   14012aadb:	jae    140133162 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb82>
   14012aae1:	mov    0x1d0(%rsp),%rax
   14012aae9:	mov    0x1048(%rbx),%rdx
   14012aaf0:	mov    %rax,(%rsi)
   14012aaf3:	mov    0x1c8(%rsp),%rax
   14012aafb:	mov    %rax,0x8(%rsi)
   14012aaff:	mov    0x1050(%rbx),%rax
   14012ab06:	vzeroupper
   14012ab09:	sub    %rdx,%r8
   14012ab0c:	sub    0x38(%rsp),%rbp
   14012ab11:	sub    %rdx,%rax
   14012ab14:	mov    %r8,%rdi
   14012ab17:	mov    %rbp,0x1038(%rbx)
   14012ab1e:	sar    $0x3,%rdi
   14012ab22:	cmp    %r8,%rax
   14012ab25:	jae    14012902f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a4f>
   14012ab2b:	lea    (%rdi,%rdi,1),%rdx
   14012ab2f:	lea    0x1048(%rbx),%rcx
   14012ab36:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ab3b:	jmp    14012902f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a4f>
   14012ab40:	lea    0x10(%rsi),%r8
   14012ab44:	cmp    0x30(%rsp),%r8
   14012ab49:	jae    14013418d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bad>
   14012ab4f:	mov    0x1d0(%rsp),%rax
   14012ab57:	mov    0x1048(%rbx),%rdx
   14012ab5e:	mov    %rax,(%rsi)
   14012ab61:	mov    0x1c8(%rsp),%rax
   14012ab69:	mov    %rax,0x8(%rsi)
   14012ab6d:	mov    0x1050(%rbx),%rax
   14012ab74:	vzeroupper
   14012ab77:	sub    %rdx,%r8
   14012ab7a:	sub    0x38(%rsp),%rbp
   14012ab7f:	sub    %rdx,%rax
   14012ab82:	mov    %r8,%rdi
   14012ab85:	mov    %rbp,0x1038(%rbx)
   14012ab8c:	sar    $0x3,%rdi
   14012ab90:	cmp    %r8,%rax
   14012ab93:	jae    14012511a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b3a>
   14012ab99:	lea    (%rdi,%rdi,1),%rdx
   14012ab9d:	lea    0x1048(%rbx),%rcx
   14012aba4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012aba9:	jmp    14012511a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b3a>
   14012abae:	lea    0x10(%rsi),%rcx
   14012abb2:	cmp    0x30(%rsp),%rcx
   14012abb7:	jae    14013320b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc2b>
   14012abbd:	vzeroupper
   14012abc0:	mov    0x1d0(%rsp),%rax
   14012abc8:	xor    %r12d,%r12d
   14012abcb:	mov    %rax,(%rsi)
   14012abce:	mov    0x1c8(%rsp),%rax
   14012abd6:	mov    %rax,0x8(%rsi)
   14012abda:	mov    %rcx,%rsi
   14012abdd:	jmp    140129d5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x677b>
   14012abe2:	lea    0x10(%rsi),%r8
   14012abe6:	cmp    0x30(%rsp),%r8
   14012abeb:	jae    1401335c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffe2>
   14012abf1:	mov    0x1d0(%rsp),%rax
   14012abf9:	mov    0x1048(%rbx),%rdx
   14012ac00:	mov    %rax,(%rsi)
   14012ac03:	mov    0x1c8(%rsp),%rax
   14012ac0b:	mov    %rax,0x8(%rsi)
   14012ac0f:	mov    0x1050(%rbx),%rax
   14012ac16:	vzeroupper
   14012ac19:	sub    %rdx,%r8
   14012ac1c:	sub    0x38(%rsp),%rbp
   14012ac21:	sub    %rdx,%rax
   14012ac24:	mov    %r8,%rdi
   14012ac27:	mov    %rbp,0x1038(%rbx)
   14012ac2e:	sar    $0x3,%rdi
   14012ac32:	cmp    %r8,%rax
   14012ac35:	jae    140124dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012ac3b:	lea    (%rdi,%rdi,1),%rdx
   14012ac3f:	lea    0x1048(%rbx),%rcx
   14012ac46:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ac4b:	jmp    140124dba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012ac50:	lea    0x10(%rsi),%r8
   14012ac54:	cmp    0x30(%rsp),%r8
   14012ac59:	jae    140132fb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9d5>
   14012ac5f:	mov    0x1d0(%rsp),%rax
   14012ac67:	mov    0x1048(%rbx),%rdx
   14012ac6e:	mov    %rax,(%rsi)
   14012ac71:	mov    0x1c8(%rsp),%rax
   14012ac79:	mov    %rax,0x8(%rsi)
   14012ac7d:	mov    0x1050(%rbx),%rax
   14012ac84:	vzeroupper
   14012ac87:	sub    %rdx,%r8
   14012ac8a:	sub    0x38(%rsp),%rbp
   14012ac8f:	sub    %rdx,%rax
   14012ac92:	mov    %r8,%rdi
   14012ac95:	mov    %rbp,0x1038(%rbx)
   14012ac9c:	sar    $0x3,%rdi
   14012aca0:	cmp    %r8,%rax
   14012aca3:	jae    1401292b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5cd7>
   14012aca9:	lea    (%rdi,%rdi,1),%rdx
   14012acad:	lea    0x1048(%rbx),%rcx
   14012acb4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012acb9:	jmp    1401292b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5cd7>
   14012acbe:	lea    0x10(%rsi),%r8
   14012acc2:	cmp    0x30(%rsp),%r8
   14012acc7:	jae    140133078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa98>
   14012accd:	mov    0x1d0(%rsp),%rax
   14012acd5:	mov    0x1048(%rbx),%rdx
   14012acdc:	mov    %rax,(%rsi)
   14012acdf:	mov    0x1c8(%rsp),%rax
   14012ace7:	mov    %rax,0x8(%rsi)
   14012aceb:	mov    0x1050(%rbx),%rax
   14012acf2:	vzeroupper
   14012acf5:	sub    %rdx,%r8
   14012acf8:	sub    0x38(%rsp),%rbp
   14012acfd:	sub    %rdx,%rax
   14012ad00:	mov    %r8,%rcx
   14012ad03:	mov    %rbp,0x1038(%rbx)
   14012ad0a:	sar    $0x3,%rcx
   14012ad0e:	mov    %rcx,%rdi
   14012ad11:	cmp    %r8,%rax
   14012ad14:	jb     14012e245 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012ad1a:	mov    %rcx,0x1060(%rbx)
   14012ad21:	jmp    140125481 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea1>
   14012ad26:	lea    0x10(%rsi),%r8
   14012ad2a:	cmp    0x30(%rsp),%r8
   14012ad2f:	jae    140133795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101b5>
   14012ad35:	mov    0x1d0(%rsp),%rax
   14012ad3d:	mov    0x1048(%rbx),%rdx
   14012ad44:	mov    %rax,(%rsi)
   14012ad47:	mov    0x1c8(%rsp),%rax
   14012ad4f:	mov    %rax,0x8(%rsi)
   14012ad53:	mov    0x1050(%rbx),%rax
   14012ad5a:	vzeroupper
   14012ad5d:	sub    %rdx,%r8
   14012ad60:	sub    0x38(%rsp),%rbp
   14012ad65:	sub    %rdx,%rax
   14012ad68:	mov    %r8,%rcx
   14012ad6b:	mov    %rbp,0x1038(%rbx)
   14012ad72:	sar    $0x3,%rcx
   14012ad76:	mov    %rcx,%rdi
   14012ad79:	cmp    %r8,%rax
   14012ad7c:	jb     14012e2d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacf5>
   14012ad82:	mov    %rcx,0x1060(%rbx)
   14012ad89:	jmp    14012910e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b2e>
   14012ad8e:	lea    0x10(%rsi),%r8
   14012ad92:	cmp    0x30(%rsp),%r8
   14012ad97:	jae    140133003 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa23>
   14012ad9d:	mov    0x1d0(%rsp),%rax
   14012ada5:	mov    0x1048(%rbx),%rdx
   14012adac:	mov    %rax,(%rsi)
   14012adaf:	mov    0x1c8(%rsp),%rax
   14012adb7:	mov    %rax,0x8(%rsi)
   14012adbb:	mov    0x1050(%rbx),%rax
   14012adc2:	vzeroupper
   14012adc5:	sub    %rdx,%r8
   14012adc8:	sub    0x38(%rsp),%rbp
   14012adcd:	sub    %rdx,%rax
   14012add0:	mov    %r8,%rcx
   14012add3:	mov    %rbp,0x1038(%rbx)
   14012adda:	sar    $0x3,%rcx
   14012adde:	mov    %rcx,%rdi
   14012ade1:	cmp    %r8,%rax
   14012ade4:	jb     14012e275 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac95>
   14012adea:	mov    %rcx,0x1060(%rbx)
   14012adf1:	jmp    140124f71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1991>
   14012adf6:	lea    0x10(%rsi),%r8
   14012adfa:	cmp    0x30(%rsp),%r8
   14012adff:	jae    1401333b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdd2>
   14012ae05:	mov    0x1d0(%rsp),%rax
   14012ae0d:	mov    0x1048(%rbx),%rdx
   14012ae14:	mov    %rax,(%rsi)
   14012ae17:	mov    0x1c8(%rsp),%rax
   14012ae1f:	mov    %rax,0x8(%rsi)
   14012ae23:	mov    0x1050(%rbx),%rax
   14012ae2a:	vzeroupper
   14012ae2d:	sub    %rdx,%r8
   14012ae30:	sub    0x38(%rsp),%rbp
   14012ae35:	sub    %rdx,%rax
   14012ae38:	mov    %r8,%rdi
   14012ae3b:	mov    %rbp,0x1038(%rbx)
   14012ae42:	sar    $0x3,%rdi
   14012ae46:	cmp    %r8,%rax
   14012ae49:	jae    140129467 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e87>
   14012ae4f:	lea    (%rdi,%rdi,1),%rdx
   14012ae53:	lea    0x1048(%rbx),%rcx
   14012ae5a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ae5f:	jmp    140129467 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e87>
   14012ae64:	lea    0x10(%rsi),%r8
   14012ae68:	cmp    0x30(%rsp),%r8
   14012ae6d:	jae    1401330c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfae6>
   14012ae73:	mov    0x1d0(%rsp),%rax
   14012ae7b:	mov    0x1048(%rbx),%rdx
   14012ae82:	mov    %rax,(%rsi)
   14012ae85:	mov    0x1c8(%rsp),%rax
   14012ae8d:	mov    %rax,0x8(%rsi)
   14012ae91:	mov    0x1050(%rbx),%rax
   14012ae98:	vzeroupper
   14012ae9b:	sub    %rdx,%r8
   14012ae9e:	sub    0x38(%rsp),%rbp
   14012aea3:	sub    %rdx,%rax
   14012aea6:	mov    %r8,%rcx
   14012aea9:	mov    %rbp,0x1038(%rbx)
   14012aeb0:	sar    $0x3,%rcx
   14012aeb4:	mov    %rcx,%rdi
   14012aeb7:	cmp    %r8,%rax
   14012aeba:	jb     14012e25d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac7d>
   14012aec0:	mov    %rcx,0x1060(%rbx)
   14012aec7:	jmp    1401252d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1cf1>
   14012aecc:	lea    0x10(%rsi),%r8
   14012aed0:	cmp    0x30(%rsp),%r8
   14012aed5:	jae    140133266 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc86>
   14012aedb:	mov    0x1d0(%rsp),%rax
   14012aee3:	mov    0x1048(%rbx),%rdx
   14012aeea:	mov    %rax,(%rsi)
   14012aeed:	mov    0x1c8(%rsp),%rax
   14012aef5:	mov    %rax,0x8(%rsi)
   14012aef9:	mov    0x1050(%rbx),%rax
   14012af00:	vzeroupper
   14012af03:	sub    %rdx,%r8
   14012af06:	sub    0x38(%rsp),%rbp
   14012af0b:	sub    %rdx,%rax
   14012af0e:	mov    %r8,%rdi
   14012af11:	mov    %rbp,0x1038(%rbx)
   14012af18:	sar    $0x3,%rdi
   14012af1c:	cmp    %r8,%rax
   14012af1f:	jae    1401291df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bff>
   14012af25:	lea    (%rdi,%rdi,1),%rdx
   14012af29:	lea    0x1048(%rbx),%rcx
   14012af30:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012af35:	jmp    1401291df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bff>
   14012af3a:	lea    0x10(%rsi),%r8
   14012af3e:	cmp    0x30(%rsp),%r8
   14012af43:	jae    140134203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c23>
   14012af49:	mov    0x1d0(%rsp),%rax
   14012af51:	mov    0x1048(%rbx),%rdx
   14012af58:	mov    %rax,(%rsi)
   14012af5b:	mov    0x1c8(%rsp),%rax
   14012af63:	mov    %rax,0x8(%rsi)
   14012af67:	mov    0x1050(%rbx),%rax
   14012af6e:	vzeroupper
   14012af71:	sub    %rdx,%r8
   14012af74:	sub    0x38(%rsp),%rbp
   14012af79:	sub    %rdx,%rax
   14012af7c:	mov    %r8,%rdi
   14012af7f:	mov    %rbp,0x1038(%rbx)
   14012af86:	sar    $0x3,%rdi
   14012af8a:	cmp    %r8,%rax
   14012af8d:	jae    140124e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18b2>
   14012af93:	lea    (%rdi,%rdi,1),%rdx
   14012af97:	lea    0x1048(%rbx),%rcx
   14012af9e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012afa3:	jmp    140124e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18b2>
   14012afa8:	lea    0x10(%rsi),%r8
   14012afac:	cmp    0x30(%rsp),%r8
   14012afb1:	jae    140132f19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf939>
   14012afb7:	mov    0x1d0(%rsp),%rax
   14012afbf:	mov    0x1048(%rbx),%rdx
   14012afc6:	mov    %rax,(%rsi)
   14012afc9:	mov    0x1c8(%rsp),%rax
   14012afd1:	mov    %rax,0x8(%rsi)
   14012afd5:	mov    0x1050(%rbx),%rax
   14012afdc:	vzeroupper
   14012afdf:	sub    %rdx,%r8
   14012afe2:	sub    0x38(%rsp),%rbp
   14012afe7:	sub    %rdx,%rax
   14012afea:	mov    %r8,%rdi
   14012afed:	mov    %rbp,0x1038(%rbx)
   14012aff4:	sar    $0x3,%rdi
   14012aff8:	cmp    %r8,%rax
   14012affb:	jae    14012938f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5daf>
   14012b001:	lea    (%rdi,%rdi,1),%rdx
   14012b005:	lea    0x1048(%rbx),%rcx
   14012b00c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b011:	jmp    14012938f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5daf>
   14012b016:	lea    0x10(%rsi),%r8
   14012b01a:	cmp    0x30(%rsp),%r8
   14012b01f:	jae    140132f67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf987>
   14012b025:	mov    0x1d0(%rsp),%rax
   14012b02d:	mov    0x1048(%rbx),%rdx
   14012b034:	mov    %rax,(%rsi)
   14012b037:	mov    0x1c8(%rsp),%rax
   14012b03f:	mov    %rax,0x8(%rsi)
   14012b043:	mov    0x1050(%rbx),%rax
   14012b04a:	vzeroupper
   14012b04d:	sub    %rdx,%r8
   14012b050:	sub    0x38(%rsp),%rbp
   14012b055:	sub    %rdx,%rax
   14012b058:	mov    %r8,%rdi
   14012b05b:	mov    %rbp,0x1038(%rbx)
   14012b062:	sar    $0x3,%rdi
   14012b066:	cmp    %r8,%rax
   14012b069:	jae    140125726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2146>
   14012b06f:	lea    (%rdi,%rdi,1),%rdx
   14012b073:	lea    0x1048(%rbx),%rcx
   14012b07a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b07f:	jmp    140125726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2146>
   14012b084:	lea    0x10(%rsi),%r8
   14012b088:	cmp    0x30(%rsp),%r8
   14012b08d:	jae    140132a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf42d>
   14012b093:	mov    0x1d0(%rsp),%rax
   14012b09b:	mov    0x1048(%rbx),%rdx
   14012b0a2:	mov    %rax,(%rsi)
   14012b0a5:	mov    0x1c8(%rsp),%rax
   14012b0ad:	mov    %rax,0x8(%rsi)
   14012b0b1:	mov    0x1050(%rbx),%rax
   14012b0b8:	vzeroupper
   14012b0bb:	sub    %rdx,%r8
   14012b0be:	sub    0x38(%rsp),%rbp
   14012b0c3:	sub    %rdx,%rax
   14012b0c6:	mov    %r8,%rdi
   14012b0c9:	mov    %rbp,0x1038(%rbx)
   14012b0d0:	sar    $0x3,%rdi
   14012b0d4:	cmp    %r8,%rax
   14012b0d7:	jae    14012953f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f5f>
   14012b0dd:	lea    (%rdi,%rdi,1),%rdx
   14012b0e1:	lea    0x1048(%rbx),%rcx
   14012b0e8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b0ed:	jmp    14012953f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f5f>
   14012b0f2:	lea    0x10(%rsi),%r8
   14012b0f6:	cmp    0x30(%rsp),%r8
   14012b0fb:	jae    140133488 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfea8>
   14012b101:	mov    0x1d0(%rsp),%rax
   14012b109:	mov    0x1048(%rbx),%rdx
   14012b110:	mov    %rax,(%rsi)
   14012b113:	mov    0x1c8(%rsp),%rax
   14012b11b:	mov    %rax,0x8(%rsi)
   14012b11f:	mov    0x1050(%rbx),%rax
   14012b126:	vzeroupper
   14012b129:	sub    %rdx,%r8
   14012b12c:	sub    0x38(%rsp),%rbp
   14012b131:	sub    %rdx,%rax
   14012b134:	mov    %r8,%rdi
   14012b137:	mov    %rbp,0x1038(%rbx)
   14012b13e:	sar    $0x3,%rdi
   14012b142:	cmp    %r8,%rax
   14012b145:	jae    140125042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a62>
   14012b14b:	lea    (%rdi,%rdi,1),%rdx
   14012b14f:	lea    0x1048(%rbx),%rcx
   14012b156:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b15b:	jmp    140125042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a62>
   14012b160:	lea    0x10(%rsi),%r8
   14012b164:	cmp    0x30(%rsp),%r8
   14012b169:	jae    140132e7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf89d>
   14012b16f:	mov    0x1d0(%rsp),%rax
   14012b177:	mov    0x1048(%rbx),%rdx
   14012b17e:	mov    %rax,(%rsi)
   14012b181:	mov    0x1c8(%rsp),%rax
   14012b189:	mov    %rax,0x8(%rsi)
   14012b18d:	mov    0x1050(%rbx),%rax
   14012b194:	vzeroupper
   14012b197:	sub    %rdx,%r8
   14012b19a:	sub    0x38(%rsp),%rbp
   14012b19f:	sub    %rdx,%rax
   14012b1a2:	mov    %r8,%rcx
   14012b1a5:	mov    %rbp,0x1038(%rbx)
   14012b1ac:	sar    $0x3,%rcx
   14012b1b0:	mov    %rcx,%rdi
   14012b1b3:	cmp    %r8,%rax
   14012b1b6:	jb     14012e2a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacc5>
   14012b1bc:	mov    %rcx,0x1060(%rbx)
   14012b1c3:	jmp    1401251f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c19>
   14012b1c8:	lea    0x10(%rsi),%r8
   14012b1cc:	cmp    0x30(%rsp),%r8
   14012b1d1:	jae    1401334d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfef6>
   14012b1d7:	mov    0x1d0(%rsp),%rax
   14012b1df:	mov    0x1048(%rbx),%rdx
   14012b1e6:	mov    %rax,(%rsi)
   14012b1e9:	mov    0x1c8(%rsp),%rax
   14012b1f1:	mov    %rax,0x8(%rsi)
   14012b1f5:	mov    0x1050(%rbx),%rax
   14012b1fc:	vzeroupper
   14012b1ff:	sub    %rdx,%r8
   14012b202:	sub    0x38(%rsp),%rbp
   14012b207:	sub    %rdx,%rax
   14012b20a:	mov    %r8,%rcx
   14012b20d:	mov    %rbp,0x1038(%rbx)
   14012b214:	sar    $0x3,%rcx
   14012b218:	mov    %rcx,%rdi
   14012b21b:	cmp    %r8,%rax
   14012b21e:	jb     14012e28d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacad>
   14012b224:	mov    %rcx,0x1060(%rbx)
   14012b22b:	jmp    140125655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2075>
   14012b230:	lea    0x10(%rsi),%r8
   14012b234:	cmp    0x30(%rsp),%r8
   14012b239:	jae    140132ecb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8eb>
   14012b23f:	mov    0x1d0(%rsp),%rax
   14012b247:	mov    0x1048(%rbx),%rdx
   14012b24e:	mov    %rax,(%rsi)
   14012b251:	mov    0x1c8(%rsp),%rax
   14012b259:	mov    %rax,0x8(%rsi)
   14012b25d:	mov    0x1050(%rbx),%rax
   14012b264:	vzeroupper
   14012b267:	sub    %rdx,%r8
   14012b26a:	sub    0x38(%rsp),%rbp
   14012b26f:	sub    %rdx,%rax
   14012b272:	mov    %r8,%rcx
   14012b275:	mov    %rbp,0x1038(%rbx)
   14012b27c:	sar    $0x3,%rcx
   14012b280:	mov    %rcx,%rdi
   14012b283:	cmp    %r8,%rax
   14012b286:	jb     14012e2bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacdd>
   14012b28c:	mov    %rcx,0x1060(%rbx)
   14012b293:	jmp    1401253a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dc9>
   14012b298:	lea    0x10(%rsi),%r8
   14012b29c:	cmp    0x30(%rsp),%r8
   14012b2a1:	jae    140132e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf82b>
   14012b2a7:	mov    0x1d0(%rsp),%rax
   14012b2af:	mov    0x1048(%rbx),%rdx
   14012b2b6:	mov    %rax,(%rsi)
   14012b2b9:	mov    0x1c8(%rsp),%rax
   14012b2c1:	mov    %rax,0x8(%rsi)
   14012b2c5:	mov    0x1050(%rbx),%rax
   14012b2cc:	vzeroupper
   14012b2cf:	sub    %rdx,%r8
   14012b2d2:	sub    0x38(%rsp),%rbp
   14012b2d7:	sub    %rdx,%rax
   14012b2da:	mov    %r8,%rdi
   14012b2dd:	mov    %rbp,0x1038(%rbx)
   14012b2e4:	sar    $0x3,%rdi
   14012b2e8:	cmp    %r8,%rax
   14012b2eb:	jae    1401257fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x221e>
   14012b2f1:	lea    (%rdi,%rdi,1),%rdx
   14012b2f5:	lea    0x1048(%rbx),%rcx
   14012b2fc:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b301:	jmp    1401257fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x221e>
   14012b306:	mov    %edi,0x690(%rsp)
   14012b30d:	mov    $0x1,%r12d
   14012b313:	lea    0x1a0(%rsp),%rdx
   14012b31b:	lea    0x540(%rsp),%rcx
   14012b323:	movl   $0x0,0x694(%rsp)
   14012b32e:	mov    0x690(%rsp),%rax
   14012b336:	vmovdqa %xmm0,0x680(%rsp)
   14012b33f:	mov    %rax,0x1b0(%rsp)
   14012b347:	vmovdqa %xmm0,0x1a0(%rsp)
   14012b350:	vzeroupper
   14012b353:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012b358:	mov    0x540(%rsp),%rax
   14012b360:	mov    %rax,0x1c8(%rsp)
   14012b368:	jmp    140128909 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5329>
   14012b36d:	mov    %rdx,%rax
   14012b370:	shr    $0x20,%rax
   14012b374:	cmp    $0x3,%ax
   14012b378:	je     140130120 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb40>
   14012b37e:	cmp    $0x2,%ax
   14012b382:	jne    140129fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14012b388:	mov    %rdx,0x328(%rsp)
   14012b390:	lea    0x540(%rsp),%rcx
   14012b398:	lea    0x328(%rsp),%rdx
   14012b3a0:	vzeroupper
   14012b3a3:	call   14022b9d0 <setun::VMValue::as_object() const>
   14012b3a8:	mov    0x540(%rsp),%rax
   14012b3b0:	mov    0x548(%rsp),%rdi
   14012b3b8:	test   %rax,%rax
   14012b3bb:	je     14012b417 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e37>
   14012b3bd:	lea    0x320(%rsp),%rdx
   14012b3c5:	lea    0x680(%rsp),%rcx
   14012b3cd:	mov    %rax,0x40(%rsp)
   14012b3d2:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b3d7:	mov    0x40(%rsp),%rcx
   14012b3dc:	lea    0x318(%rsp),%r8
   14012b3e4:	lea    0x680(%rsp),%rdx
   14012b3ec:	call   140220700 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b3f1:	mov    0x680(%rsp),%rcx
   14012b3f9:	lea    0x690(%rsp),%rax
   14012b401:	cmp    %rax,%rcx
   14012b404:	je     14012b417 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e37>
   14012b406:	mov    0x690(%rsp),%rax
   14012b40e:	lea    0x1(%rax),%rdx
   14012b412:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012b417:	test   %rdi,%rdi
   14012b41a:	je     140129fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14012b420:	mov    %rdi,%rcx
   14012b423:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012b428:	jmp    140129fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14012b42d:	lea    0x10(%rsi),%r8
   14012b431:	cmp    0x30(%rsp),%r8
   14012b436:	jae    140132a5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf47b>
   14012b43c:	mov    0x1d0(%rsp),%rax
   14012b444:	mov    0x1048(%rbx),%rdx
   14012b44b:	mov    %rax,(%rsi)
   14012b44e:	mov    0x1c8(%rsp),%rax
   14012b456:	mov    %rax,0x8(%rsi)
   14012b45a:	mov    0x1050(%rbx),%rax
   14012b461:	vzeroupper
   14012b464:	sub    %rdx,%r8
   14012b467:	sub    0x38(%rsp),%rbp
   14012b46c:	sub    %rdx,%rax
   14012b46f:	mov    %r8,%rdi
   14012b472:	mov    %rbp,0x1038(%rbx)
   14012b479:	sar    $0x3,%rdi
   14012b47d:	cmp    %r8,%rax
   14012b480:	jae    140129617 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6037>
   14012b486:	lea    (%rdi,%rdi,1),%rdx
   14012b48a:	lea    0x1048(%rbx),%rcx
   14012b491:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b496:	jmp    140129617 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6037>
   14012b49b:	lea    0x10(%rsi),%r8
   14012b49f:	cmp    0x30(%rsp),%r8
   14012b4a4:	jae    1401344fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f1e>
   14012b4aa:	mov    0x1d0(%rsp),%rax
   14012b4b2:	mov    0x1048(%rbx),%rdx
   14012b4b9:	mov    %rax,(%rsi)
   14012b4bc:	mov    0x1c8(%rsp),%rax
   14012b4c4:	mov    %rax,0x8(%rsi)
   14012b4c8:	mov    0x1050(%rbx),%rax
   14012b4cf:	vzeroupper
   14012b4d2:	sub    %rdx,%r8
   14012b4d5:	sub    0x38(%rsp),%rbp
   14012b4da:	sub    %rdx,%rax
   14012b4dd:	mov    %r8,%rdi
   14012b4e0:	mov    %rbp,0x1038(%rbx)
   14012b4e7:	sar    $0x3,%rdi
   14012b4eb:	cmp    %r8,%rax
   14012b4ee:	jae    1401296ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x610f>
   14012b4f4:	lea    (%rdi,%rdi,1),%rdx
   14012b4f8:	lea    0x1048(%rbx),%rcx
   14012b4ff:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b504:	jmp    1401296ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x610f>
   14012b509:	lea    0x10(%rsi),%r8
   14012b50d:	cmp    0x30(%rsp),%r8
   14012b512:	jae    140133849 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10269>
   14012b518:	mov    0x1d0(%rsp),%rax
   14012b520:	mov    0x1048(%rbx),%rdx
   14012b527:	mov    %rax,(%rsi)
   14012b52a:	mov    0x1c8(%rsp),%rax
   14012b532:	mov    %rax,0x8(%rsi)
   14012b536:	mov    0x1050(%rbx),%rax
   14012b53d:	vzeroupper
   14012b540:	sub    %rdx,%r8
   14012b543:	sub    0x38(%rsp),%rbp
   14012b548:	sub    %rdx,%rax
   14012b54b:	mov    %r8,%rdi
   14012b54e:	mov    %rbp,0x1038(%rbx)
   14012b555:	sar    $0x3,%rdi
   14012b559:	cmp    %r8,%rax
   14012b55c:	jae    140125de6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2806>
   14012b562:	lea    (%rdi,%rdi,1),%rdx
   14012b566:	lea    0x1048(%rbx),%rcx
   14012b56d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b572:	jmp    140125de6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2806>
   14012b577:	lea    0x10(%rsi),%rdx
   14012b57b:	cmp    0x30(%rsp),%rdx
   14012b580:	jae    140133ac7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104e7>
   14012b586:	mov    0x1d0(%rsp),%rcx
   14012b58e:	mov    %rcx,(%rsi)
   14012b591:	mov    0x1c8(%rsp),%rcx
   14012b599:	mov    %rcx,0x8(%rsi)
   14012b59d:	mov    %rdx,%rsi
   14012b5a0:	mov    0x15268(%rbx),%r13
   14012b5a7:	movzbl %dil,%ebp
   14012b5ab:	mov    0x1070(%rbx),%rdx
   14012b5b2:	xor    %r12d,%r12d
   14012b5b5:	sub    0x1068(%rbx),%rdx
   14012b5bc:	lea    0x0(%rbp,%r13,1),%rax
   14012b5c1:	sar    $0x3,%rdx
   14012b5c5:	mov    %rax,0x15268(%rbx)
   14012b5cc:	add    $0x40,%rax
   14012b5d0:	cmp    %rdx,%rax
   14012b5d3:	jb     140124a56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1476>
   14012b5d9:	mov    %r9,0x40(%rsp)
   14012b5de:	add    %rdx,%rdx
   14012b5e1:	lea    0x1068(%rbx),%rcx
   14012b5e8:	vzeroupper
   14012b5eb:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b5f0:	mov    0x40(%rsp),%r9
   14012b5f5:	jmp    140124a56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1476>
   14012b5fa:	mov    %rdx,%rax
   14012b5fd:	shr    $0x20,%rax
   14012b601:	cmp    $0x3,%ax
   14012b605:	je     14012fb66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc586>
   14012b60b:	cmp    $0x2,%ax
   14012b60f:	jne    140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012b615:	mov    %rdx,0x350(%rsp)
   14012b61d:	lea    0x350(%rsp),%rcx
   14012b625:	vzeroupper
   14012b628:	call   14022b1c0 <setun::VMValue::payload() const>
   14012b62d:	mov    0x48(%rax),%rdi
   14012b631:	test   %rdi,%rdi
   14012b634:	je     140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012b63a:	lea    0x348(%rsp),%rdx
   14012b642:	lea    0x680(%rsp),%rcx
   14012b64a:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b64f:	lea    0x340(%rsp),%r8
   14012b657:	lea    0x680(%rsp),%rdx
   14012b65f:	mov    %rdi,%rcx
   14012b662:	call   140220700 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b667:	mov    0x680(%rsp),%rcx
   14012b66f:	lea    0x690(%rsp),%rax
   14012b677:	cmp    %rax,%rcx
   14012b67a:	je     140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012b680:	mov    0x690(%rsp),%rax
   14012b688:	lea    0x1(%rax),%rdx
   14012b68c:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012b691:	jmp    140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012b696:	lea    0x10(%rsi),%r8
   14012b69a:	cmp    0x30(%rsp),%r8
   14012b69f:	jae    1401342e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d05>
   14012b6a5:	mov    0x1d0(%rsp),%rax
   14012b6ad:	mov    0x1048(%rbx),%rdx
   14012b6b4:	mov    %rax,(%rsi)
   14012b6b7:	mov    0x1c8(%rsp),%rax
   14012b6bf:	mov    %rax,0x8(%rsi)
   14012b6c3:	mov    0x1050(%rbx),%rax
   14012b6ca:	vzeroupper
   14012b6cd:	sub    %rdx,%r8
   14012b6d0:	sub    0x38(%rsp),%rbp
   14012b6d5:	sub    %rdx,%rax
   14012b6d8:	mov    %r8,%rdi
   14012b6db:	mov    %rbp,0x1038(%rbx)
   14012b6e2:	sar    $0x3,%rdi
   14012b6e6:	cmp    %r8,%rax
   14012b6e9:	jae    140125f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b6>
   14012b6ef:	lea    (%rdi,%rdi,1),%rdx
   14012b6f3:	lea    0x1048(%rbx),%rcx
   14012b6fa:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b6ff:	jmp    140125f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b6>
   14012b704:	lea    0x10(%rsi),%r8
   14012b708:	cmp    0x30(%rsp),%r8
   14012b70d:	jae    1401338b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102d6>
   14012b713:	mov    0x1d0(%rsp),%rax
   14012b71b:	mov    0x1048(%rbx),%rdx
   14012b722:	mov    %rax,(%rsi)
   14012b725:	mov    0x1c8(%rsp),%rax
   14012b72d:	mov    %rax,0x8(%rsi)
   14012b731:	mov    0x1050(%rbx),%rax
   14012b738:	vzeroupper
   14012b73b:	sub    %rdx,%r8
   14012b73e:	sub    0x38(%rsp),%rbp
   14012b743:	sub    %rdx,%rax
   14012b746:	mov    %r8,%rcx
   14012b749:	mov    %rbp,0x1038(%rbx)
   14012b750:	sar    $0x3,%rcx
   14012b754:	mov    %rcx,%rdi
   14012b757:	cmp    %r8,%rax
   14012b75a:	jb     14012e356 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad76>
   14012b760:	mov    %rcx,0x1060(%rbx)
   14012b767:	jmp    1401297ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61ee>
   14012b76c:	lea    0x10(%rsi),%r8
   14012b770:	cmp    0x30(%rsp),%r8
   14012b775:	jae    140133ce0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10700>
   14012b77b:	mov    0x1d0(%rsp),%rax
   14012b783:	mov    0x1048(%rbx),%rdx
   14012b78a:	mov    %rax,(%rsi)
   14012b78d:	mov    0x1c8(%rsp),%rax
   14012b795:	mov    %rax,0x8(%rsi)
   14012b799:	mov    0x1050(%rbx),%rax
   14012b7a0:	vzeroupper
   14012b7a3:	sub    %rdx,%r8
   14012b7a6:	sub    0x38(%rsp),%rbp
   14012b7ab:	sub    %rdx,%rax
   14012b7ae:	mov    %r8,%rdi
   14012b7b1:	mov    %rbp,0x1038(%rbx)
   14012b7b8:	sar    $0x3,%rdi
   14012b7bc:	cmp    %r8,%rax
   14012b7bf:	jae    1401258d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22f6>
   14012b7c5:	lea    (%rdi,%rdi,1),%rdx
   14012b7c9:	lea    0x1048(%rbx),%rcx
   14012b7d0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b7d5:	jmp    1401258d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22f6>
   14012b7da:	shr    $0x20,%rdx
   14012b7de:	cmp    $0x1,%dx
   14012b7e2:	je     14012fd88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7a8>
   14012b7e8:	cmp    $0x5,%dx
   14012b7ec:	jne    140128ae8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5508>
   14012b7f2:	mov    %r9,0x80(%rsp)
   14012b7fa:	call   140229aa0 <setun::VMValue::as_int() const>
   14012b7ff:	jmp    140128afa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x551a>
   14012b804:	lea    0x10(%rsi),%r8
   14012b808:	cmp    0x30(%rsp),%r8
   14012b80d:	jae    140133720 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10140>
   14012b813:	mov    0x1d0(%rsp),%rax
   14012b81b:	mov    0x1048(%rbx),%rdx
   14012b822:	mov    %rax,(%rsi)
   14012b825:	mov    0x1c8(%rsp),%rax
   14012b82d:	mov    %rax,0x8(%rsi)
   14012b831:	mov    0x1050(%rbx),%rax
   14012b838:	vzeroupper
   14012b83b:	sub    %rdx,%r8
   14012b83e:	sub    0x38(%rsp),%rbp
   14012b843:	sub    %rdx,%rax
   14012b846:	mov    %r8,%rdi
   14012b849:	mov    %rbp,0x1038(%rbx)
   14012b850:	sar    $0x3,%rdi
   14012b854:	cmp    %r8,%rax
   14012b857:	jae    140125c36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2656>
   14012b85d:	lea    (%rdi,%rdi,1),%rdx
   14012b861:	lea    0x1048(%rbx),%rcx
   14012b868:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b86d:	jmp    140125c36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2656>
   14012b872:	lea    0x10(%rsi),%r8
   14012b876:	cmp    0x30(%rsp),%r8
   14012b87b:	jae    140133316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd36>
   14012b881:	mov    0x1d0(%rsp),%rax
   14012b889:	mov    0x1048(%rbx),%rdx
   14012b890:	mov    %rax,(%rsi)
   14012b893:	mov    0x1c8(%rsp),%rax
   14012b89b:	mov    %rax,0x8(%rsi)
   14012b89f:	mov    0x1050(%rbx),%rax
   14012b8a6:	vzeroupper
   14012b8a9:	sub    %rdx,%r8
   14012b8ac:	sub    0x38(%rsp),%rbp
   14012b8b1:	sub    %rdx,%rax
   14012b8b4:	mov    %r8,%rcx
   14012b8b7:	mov    %rbp,0x1038(%rbx)
   14012b8be:	sar    $0x3,%rcx
   14012b8c2:	mov    %rcx,%rdi
   14012b8c5:	cmp    %r8,%rax
   14012b8c8:	jb     14012e36e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad8e>
   14012b8ce:	mov    %rcx,0x1060(%rbx)
   14012b8d5:	jmp    140125d15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2735>
   14012b8da:	lea    0x10(%rsi),%r8
   14012b8de:	cmp    0x30(%rsp),%r8
   14012b8e3:	jae    140132aa9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4c9>
   14012b8e9:	mov    0x1d0(%rsp),%rax
   14012b8f1:	mov    0x1048(%rbx),%rdx
   14012b8f8:	mov    %rax,(%rsi)
   14012b8fb:	mov    0x1c8(%rsp),%rax
   14012b903:	mov    %rax,0x8(%rsi)
   14012b907:	mov    0x1050(%rbx),%rax
   14012b90e:	vzeroupper
   14012b911:	sub    %rdx,%r8
   14012b914:	sub    0x38(%rsp),%rbp
   14012b919:	sub    %rdx,%rax
   14012b91c:	mov    %r8,%rdi
   14012b91f:	mov    %rbp,0x1038(%rbx)
   14012b926:	sar    $0x3,%rdi
   14012b92a:	cmp    %r8,%rax
   14012b92d:	jae    140125a86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24a6>
   14012b933:	lea    (%rdi,%rdi,1),%rdx
   14012b937:	lea    0x1048(%rbx),%rcx
   14012b93e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b943:	jmp    140125a86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24a6>
   14012b948:	lea    0x10(%rsi),%r8
   14012b94c:	cmp    0x30(%rsp),%r8
   14012b951:	jae    140132c0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf62b>
   14012b957:	mov    0x1d0(%rsp),%rax
   14012b95f:	mov    0x1048(%rbx),%rdx
   14012b966:	mov    %rax,(%rsi)
   14012b969:	mov    0x1c8(%rsp),%rax
   14012b971:	mov    %rax,0x8(%rsi)
   14012b975:	mov    0x1050(%rbx),%rax
   14012b97c:	vzeroupper
   14012b97f:	sub    %rdx,%r8
   14012b982:	sub    0x38(%rsp),%rbp
   14012b987:	sub    %rdx,%rax
   14012b98a:	mov    %r8,%rdi
   14012b98d:	mov    %rbp,0x1038(%rbx)
   14012b994:	sar    $0x3,%rdi
   14012b998:	cmp    %r8,%rax
   14012b99b:	jae    140129977 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6397>
   14012b9a1:	lea    (%rdi,%rdi,1),%rdx
   14012b9a5:	lea    0x1048(%rbx),%rcx
   14012b9ac:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b9b1:	jmp    140129977 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6397>
   14012b9b6:	lea    0x10(%rsi),%r8
   14012b9ba:	cmp    0x30(%rsp),%r8
   14012b9bf:	jae    140133c92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106b2>
   14012b9c5:	mov    0x1d0(%rsp),%rax
   14012b9cd:	mov    0x1048(%rbx),%rdx
   14012b9d4:	mov    %rax,(%rsi)
   14012b9d7:	mov    0x1c8(%rsp),%rax
   14012b9df:	mov    %rax,0x8(%rsi)
   14012b9e3:	mov    0x1050(%rbx),%rax
   14012b9ea:	vzeroupper
   14012b9ed:	sub    %rdx,%r8
   14012b9f0:	sub    0x38(%rsp),%rbp
   14012b9f5:	sub    %rdx,%rax
   14012b9f8:	mov    %r8,%rcx
   14012b9fb:	mov    %rbp,0x1038(%rbx)
   14012ba02:	sar    $0x3,%rcx
   14012ba06:	mov    %rcx,%rdi
   14012ba09:	cmp    %r8,%rax
   14012ba0c:	jb     14012e33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad5e>
   14012ba12:	mov    %rcx,0x1060(%rbx)
   14012ba19:	jmp    1401259b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23d5>
   14012ba1e:	mov    0x1048(%rbx),%rdx
   14012ba25:	lea    0x10(%rsi),%rcx
   14012ba29:	cmp    0x30(%rsp),%rcx
   14012ba2e:	jae    140134063 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a83>
   14012ba34:	mov    0x1050(%rbx),%rax
   14012ba3b:	vzeroupper
   14012ba3e:	mov    0x1d0(%rsp),%r8
   14012ba46:	mov    %r8,(%rsi)
   14012ba49:	mov    0x1c8(%rsp),%r8
   14012ba51:	mov    %r8,0x8(%rsi)
   14012ba55:	jmp    140128d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5720>
   14012ba5a:	lea    0x10(%rsi),%r8
   14012ba5e:	cmp    0x30(%rsp),%r8
   14012ba63:	jae    140133114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb34>
   14012ba69:	mov    0x1d0(%rsp),%rax
   14012ba71:	mov    0x1048(%rbx),%rdx
   14012ba78:	mov    %rax,(%rsi)
   14012ba7b:	mov    0x1c8(%rsp),%rax
   14012ba83:	mov    %rax,0x8(%rsi)
   14012ba87:	mov    0x1050(%rbx),%rax
   14012ba8e:	vzeroupper
   14012ba91:	sub    %rdx,%r8
   14012ba94:	sub    0x38(%rsp),%rbp
   14012ba99:	sub    %rdx,%rax
   14012ba9c:	mov    %r8,%rdi
   14012ba9f:	mov    %rbp,0x1038(%rbx)
   14012baa6:	sar    $0x3,%rdi
   14012baaa:	cmp    %r8,%rax
   14012baad:	jae    140125ebe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28de>
   14012bab3:	lea    (%rdi,%rdi,1),%rdx
   14012bab7:	lea    0x1048(%rbx),%rcx
   14012babe:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012bac3:	jmp    140125ebe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28de>
   14012bac8:	lea    0x10(%rsi),%r8
   14012bacc:	cmp    0x30(%rsp),%r8
   14012bad1:	jae    140134333 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d53>
   14012bad7:	mov    0x1d0(%rsp),%rax
   14012badf:	mov    0x1048(%rbx),%rdx
   14012bae6:	mov    %rax,(%rsi)
   14012bae9:	mov    0x1c8(%rsp),%rax
   14012baf1:	mov    %rax,0x8(%rsi)
   14012baf5:	mov    0x1050(%rbx),%rax
   14012bafc:	vzeroupper
   14012baff:	sub    %rdx,%r8
   14012bb02:	sub    0x38(%rsp),%rbp
   14012bb07:	sub    %rdx,%rax
   14012bb0a:	mov    %r8,%rdi
   14012bb0d:	mov    %rbp,0x1038(%rbx)
   14012bb14:	sar    $0x3,%rdi
   14012bb18:	cmp    %r8,%rax
   14012bb1b:	jae    140125b5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x257e>
   14012bb21:	lea    (%rdi,%rdi,1),%rdx
   14012bb25:	lea    0x1048(%rbx),%rcx
   14012bb2c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012bb31:	jmp    140125b5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x257e>
   14012bb36:	lea    0x10(%rsi),%r8
   14012bb3a:	cmp    0x30(%rsp),%r8
   14012bb3f:	jae    140132af7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf517>
   14012bb45:	mov    0x1d0(%rsp),%rax
   14012bb4d:	mov    0x1048(%rbx),%rdx
   14012bb54:	mov    %rax,(%rsi)
   14012bb57:	mov    0x1c8(%rsp),%rax
   14012bb5f:	mov    %rax,0x8(%rsi)
   14012bb63:	mov    0x1050(%rbx),%rax
   14012bb6a:	vzeroupper
   14012bb6d:	sub    %rdx,%r8
   14012bb70:	sub    0x38(%rsp),%rbp
   14012bb75:	sub    %rdx,%rax
   14012bb78:	mov    %r8,%rdi
   14012bb7b:	mov    %rbp,0x1038(%rbx)
   14012bb82:	sar    $0x3,%rdi
   14012bb86:	cmp    %r8,%rax
   14012bb89:	jae    14012989f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62bf>
   14012bb8f:	lea    (%rdi,%rdi,1),%rdx
   14012bb93:	lea    0x1048(%rbx),%rcx
   14012bb9a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012bb9f:	jmp    14012989f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62bf>
   14012bba4:	lea    0x10(%rsi),%r8
   14012bba8:	cmp    0x30(%rsp),%r8
   14012bbad:	jae    140132b45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf565>
   14012bbb3:	mov    0x1d0(%rsp),%rax
   14012bbbb:	mov    0x1048(%rbx),%rdx
   14012bbc2:	mov    %rax,(%rsi)
   14012bbc5:	mov    0x1c8(%rsp),%rax
   14012bbcd:	mov    %rax,0x8(%rsi)
   14012bbd1:	mov    0x1050(%rbx),%rax
   14012bbd8:	vzeroupper
   14012bbdb:	sub    %rdx,%r8
   14012bbde:	sub    0x38(%rsp),%rbp
   14012bbe3:	sub    %rdx,%rax
   14012bbe6:	mov    %r8,%rdi
   14012bbe9:	mov    %rbp,0x1038(%rbx)
   14012bbf0:	sar    $0x3,%rdi
   14012bbf4:	cmp    %r8,%rax
   14012bbf7:	jae    140129bab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65cb>
   14012bbfd:	lea    (%rdi,%rdi,1),%rdx
   14012bc01:	lea    0x1048(%rbx),%rcx
   14012bc08:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012bc0d:	jmp    140129bab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65cb>
   14012bc12:	mov    0x1048(%rbx),%rdx
   14012bc19:	lea    0x10(%rsi),%rcx
   14012bc1d:	cmp    0x30(%rsp),%rcx
   14012bc22:	jae    140132b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5b3>
   14012bc28:	mov    0x1050(%rbx),%rax
   14012bc2f:	vzeroupper
   14012bc32:	mov    0x1d0(%rsp),%r8
   14012bc3a:	mov    %r8,(%rsi)
   14012bc3d:	mov    0x1c8(%rsp),%r8
   14012bc45:	mov    %r8,0x8(%rsi)
   14012bc49:	jmp    140129a47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6467>
   14012bc4e:	lea    0x10(%rsi),%r8
   14012bc52:	cmp    0x30(%rsp),%r8
   14012bc57:	jae    140133577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff97>
   14012bc5d:	mov    0x1d0(%rsp),%rax
   14012bc65:	mov    0x1048(%rbx),%rdx
   14012bc6c:	mov    %rax,(%rsi)
   14012bc6f:	mov    0x1c8(%rsp),%rax
   14012bc77:	mov    %rax,0x8(%rsi)
   14012bc7b:	mov    0x1050(%rbx),%rax
   14012bc82:	mov    %r8,%rsi
   14012bc85:	mov    %rax,%rcx
   14012bc88:	sub    0x38(%rsp),%rbp
   14012bc8d:	sub    %rdx,%rsi
   14012bc90:	sub    %rdx,%rcx
   14012bc93:	mov    %rbp,0x1038(%rbx)
   14012bc9a:	mov    %rsi,%rdi
   14012bc9d:	sar    $0x3,%rdi
   14012bca1:	cmp    %rsi,%rcx
   14012bca4:	jae    140129ad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64f9>
   14012bcaa:	lea    (%rdi,%rdi,1),%rdx
   14012bcae:	lea    0x1048(%rbx),%rcx
   14012bcb5:	vzeroupper
   14012bcb8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012bcbd:	mov    0x1048(%rbx),%rdx
   14012bcc4:	mov    0x1050(%rbx),%rax
   14012bccb:	jmp    140129ad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64f9>
   14012bcd0:	mov    %rdx,%rax
   14012bcd3:	shr    $0x20,%rax
   14012bcd7:	cmp    $0x5,%ax
   14012bcdb:	jne    140126966 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3386>
   14012bce1:	mov    0x2b0(%rsp),%rcx
   14012bce9:	movabs $0xffff000000000000,%rax
   14012bcf3:	movabs $0xfff8000000000000,%r8
   14012bcfd:	and    %rcx,%rax
   14012bd00:	cmp    %r8,%rax
   14012bd03:	je     1401269dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fd>
   14012bd09:	movabs $0xffffffff00000000,%rax
   14012bd13:	and    %rax,%rcx
   14012bd16:	movabs $0xfffd000500000000,%rax
   14012bd20:	cmp    %rax,%rcx
   14012bd23:	jne    140126966 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3386>
   14012bd29:	jmp    1401269dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fd>
   14012bd2e:	mov    %r8,%rax
   14012bd31:	shr    $0x20,%rax
   14012bd35:	cmp    $0x5,%ax
   14012bd39:	jne    14012bd83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87a3>
   14012bd3b:	mov    0x3d0(%rsp),%rdx
   14012bd43:	movabs $0xffff000000000000,%rax
   14012bd4d:	movabs $0xfff8000000000000,%rcx
   14012bd57:	and    %rdx,%rax
   14012bd5a:	cmp    %rcx,%rax
   14012bd5d:	je     140128745 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5165>
   14012bd63:	movabs $0xffffffff00000000,%rax
   14012bd6d:	and    %rax,%rdx
   14012bd70:	movabs $0xfffd000500000000,%rax
   14012bd7a:	cmp    %rax,%rdx
   14012bd7d:	je     140128745 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5165>
   14012bd83:	mov    0x3d0(%rsp),%rax
   14012bd8b:	movabs $0xfff7ffffffffffff,%rdx
   14012bd95:	cmp    %rax,%rdx
   14012bd98:	jae    14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   14012bd9e:	movabs $0xfffc000000000000,%rdx
   14012bda8:	cmp    %rdx,%rax
   14012bdab:	je     14012e127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab47>
   14012bdb1:	movabs $0xffffffff00000000,%rcx
   14012bdbb:	and    %r8,%rcx
   14012bdbe:	movabs $0xfffd000000000000,%r8
   14012bdc8:	cmp    %r8,%rcx
   14012bdcb:	je     140131c31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe651>
   14012bdd1:	movabs $0xffff000000000000,%rdx
   14012bddb:	and    %rax,%rdx
   14012bdde:	cmp    %r8,%rdx
   14012bde1:	je     140132832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf252>
   14012bde7:	movabs $0xfffd000100000000,%rax
   14012bdf1:	cmp    %rax,%rcx
   14012bdf4:	jne    140128745 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5165>
   14012bdfa:	lea    0x3d0(%rsp),%rdx
   14012be02:	lea    0x680(%rsp),%rcx
   14012be0a:	vzeroupper
   14012be0d:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012be12:	lea    0x540(%rsp),%rax
   14012be1a:	lea    0x3c8(%rsp),%rdx
   14012be22:	mov    %rax,%rcx
   14012be25:	mov    %rax,0x40(%rsp)
   14012be2a:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012be2f:	mov    0x40(%rsp),%rcx
   14012be34:	lea    0x680(%rsp),%rdx
   14012be3c:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012be41:	not    %eax
   14012be43:	shr    $0x1f,%eax
   14012be46:	jmp    14012876b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x518b>
   14012be4b:	mov    %r8,%rax
   14012be4e:	shr    $0x20,%rax
   14012be52:	cmp    $0x5,%ax
   14012be56:	jne    14012bea0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c0>
   14012be58:	mov    0x3c0(%rsp),%rdx
   14012be60:	movabs $0xffff000000000000,%rax
   14012be6a:	movabs $0xfff8000000000000,%rcx
   14012be74:	and    %rdx,%rax
   14012be77:	cmp    %rcx,%rax
   14012be7a:	je     1401285ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x500a>
   14012be80:	movabs $0xffffffff00000000,%rax
   14012be8a:	and    %rax,%rdx
   14012be8d:	movabs $0xfffd000500000000,%rax
   14012be97:	cmp    %rax,%rdx
   14012be9a:	je     1401285ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x500a>
   14012bea0:	mov    0x3c0(%rsp),%rax
   14012bea8:	movabs $0xfff7ffffffffffff,%rdx
   14012beb2:	cmp    %rax,%rdx
   14012beb5:	jae    14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   14012bebb:	movabs $0xfffc000000000000,%rdx
   14012bec5:	cmp    %rdx,%rax
   14012bec8:	je     14012e0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac0>
   14012bece:	movabs $0xffffffff00000000,%rcx
   14012bed8:	and    %r8,%rcx
   14012bedb:	movabs $0xfffd000000000000,%r8
   14012bee5:	cmp    %r8,%rcx
   14012bee8:	je     140131ed5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8f5>
   14012beee:	movabs $0xffff000000000000,%rdx
   14012bef8:	and    %rax,%rdx
   14012befb:	cmp    %r8,%rdx
   14012befe:	je     140132786 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1a6>
   14012bf04:	movabs $0xfffd000100000000,%rax
   14012bf0e:	cmp    %rax,%rcx
   14012bf11:	jne    1401285ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x500a>
   14012bf17:	lea    0x3c0(%rsp),%rdx
   14012bf1f:	lea    0x680(%rsp),%rcx
   14012bf27:	vzeroupper
   14012bf2a:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012bf2f:	lea    0x540(%rsp),%rax
   14012bf37:	lea    0x3b8(%rsp),%rdx
   14012bf3f:	mov    %rax,%rcx
   14012bf42:	mov    %rax,0x40(%rsp)
   14012bf47:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012bf4c:	mov    0x40(%rsp),%rcx
   14012bf51:	lea    0x680(%rsp),%rdx
   14012bf59:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bf5e:	test   %eax,%eax
   14012bf60:	setg   %al
   14012bf63:	jmp    140128610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5030>
   14012bf68:	mov    %r8,%rax
   14012bf6b:	shr    $0x20,%rax
   14012bf6f:	cmp    $0x5,%ax
   14012bf73:	jne    14012bfbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89dd>
   14012bf75:	mov    0x390(%rsp),%rdx
   14012bf7d:	movabs $0xffff000000000000,%rax
   14012bf87:	movabs $0xfff8000000000000,%rcx
   14012bf91:	and    %rdx,%rax
   14012bf94:	cmp    %rcx,%rax
   14012bf97:	je     1401281d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bf7>
   14012bf9d:	movabs $0xffffffff00000000,%rax
   14012bfa7:	and    %rax,%rdx
   14012bfaa:	movabs $0xfffd000500000000,%rax
   14012bfb4:	cmp    %rax,%rdx
   14012bfb7:	je     1401281d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bf7>
   14012bfbd:	mov    0x390(%rsp),%rax
   14012bfc5:	movabs $0xfff7ffffffffffff,%rdx
   14012bfcf:	cmp    %rax,%rdx
   14012bfd2:	jae    14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   14012bfd8:	movabs $0xfffc000000000000,%rdx
   14012bfe2:	cmp    %rdx,%rax
   14012bfe5:	je     14012e0cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaed>
   14012bfeb:	movabs $0xffffffff00000000,%rcx
   14012bff5:	and    %r8,%rcx
   14012bff8:	movabs $0xfffd000000000000,%r8
   14012c002:	cmp    %r8,%rcx
   14012c005:	je     140131e1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe83d>
   14012c00b:	movabs $0xffff000000000000,%rdx
   14012c015:	and    %rax,%rdx
   14012c018:	cmp    %r8,%rdx
   14012c01b:	je     1401327b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1d9>
   14012c021:	movabs $0xfffd000100000000,%rax
   14012c02b:	cmp    %rax,%rcx
   14012c02e:	jne    1401281d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bf7>
   14012c034:	lea    0x390(%rsp),%rdx
   14012c03c:	lea    0x680(%rsp),%rcx
   14012c044:	vzeroupper
   14012c047:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c04c:	lea    0x540(%rsp),%rax
   14012c054:	lea    0x388(%rsp),%rdx
   14012c05c:	mov    %rax,%rcx
   14012c05f:	mov    %rax,0x40(%rsp)
   14012c064:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c069:	mov    0x40(%rsp),%rcx
   14012c06e:	lea    0x680(%rsp),%rdx
   14012c076:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c07b:	shr    $0x1f,%eax
   14012c07e:	jmp    1401281fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1d>
   14012c083:	mov    %r8,%rax
   14012c086:	shr    $0x20,%rax
   14012c08a:	cmp    $0x5,%ax
   14012c08e:	jne    14012c0d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8af8>
   14012c090:	mov    0x3b0(%rsp),%rdx
   14012c098:	movabs $0xffff000000000000,%rax
   14012c0a2:	movabs $0xfff8000000000000,%rcx
   14012c0ac:	and    %rdx,%rax
   14012c0af:	cmp    %rcx,%rax
   14012c0b2:	je     14012848d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ead>
   14012c0b8:	movabs $0xffffffff00000000,%rax
   14012c0c2:	and    %rax,%rdx
   14012c0c5:	movabs $0xfffd000500000000,%rax
   14012c0cf:	cmp    %rax,%rdx
   14012c0d2:	je     14012848d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ead>
   14012c0d8:	mov    0x3b0(%rsp),%rax
   14012c0e0:	movabs $0xfff7ffffffffffff,%rdx
   14012c0ea:	cmp    %rax,%rdx
   14012c0ed:	jae    14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   14012c0f3:	movabs $0xfffc000000000000,%rdx
   14012c0fd:	cmp    %rdx,%rax
   14012c100:	je     14012e05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa7e>
   14012c106:	movabs $0xffffffff00000000,%rcx
   14012c110:	and    %r8,%rcx
   14012c113:	movabs $0xfffd000000000000,%r8
   14012c11d:	cmp    %r8,%rcx
   14012c120:	je     140131d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe78f>
   14012c126:	movabs $0xffff000000000000,%rdx
   14012c130:	and    %rax,%rdx
   14012c133:	cmp    %r8,%rdx
   14012c136:	je     140132933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf353>
   14012c13c:	movabs $0xfffd000100000000,%rax
   14012c146:	cmp    %rax,%rcx
   14012c149:	jne    14012848d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ead>
   14012c14f:	lea    0x3b0(%rsp),%rdx
   14012c157:	lea    0x680(%rsp),%rcx
   14012c15f:	vzeroupper
   14012c162:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c167:	lea    0x540(%rsp),%rax
   14012c16f:	lea    0x3a8(%rsp),%rdx
   14012c177:	mov    %rax,%rcx
   14012c17a:	mov    %rax,0x40(%rsp)
   14012c17f:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c184:	mov    0x40(%rsp),%rcx
   14012c189:	lea    0x680(%rsp),%rdx
   14012c191:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c196:	test   %eax,%eax
   14012c198:	sete   %dil
   14012c19c:	jmp    1401284b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ed4>
   14012c1a1:	mov    %r8,%rax
   14012c1a4:	shr    $0x20,%rax
   14012c1a8:	cmp    $0x5,%ax
   14012c1ac:	jne    14012c1f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c16>
   14012c1ae:	mov    0x3a0(%rsp),%rdx
   14012c1b6:	movabs $0xffff000000000000,%rax
   14012c1c0:	movabs $0xfff8000000000000,%rcx
   14012c1ca:	and    %rdx,%rax
   14012c1cd:	cmp    %rcx,%rax
   14012c1d0:	je     140128332 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d52>
   14012c1d6:	movabs $0xffffffff00000000,%rax
   14012c1e0:	and    %rax,%rdx
   14012c1e3:	movabs $0xfffd000500000000,%rax
   14012c1ed:	cmp    %rax,%rdx
   14012c1f0:	je     140128332 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d52>
   14012c1f6:	mov    0x3a0(%rsp),%rax
   14012c1fe:	movabs $0xfff7ffffffffffff,%rdx
   14012c208:	cmp    %rax,%rdx
   14012c20b:	jae    14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   14012c211:	movabs $0xfffc000000000000,%rdx
   14012c21b:	cmp    %rdx,%rax
   14012c21e:	je     14012dfef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa0f>
   14012c224:	movabs $0xffffffff00000000,%rcx
   14012c22e:	and    %r8,%rcx
   14012c231:	movabs $0xfffd000000000000,%r8
   14012c23b:	cmp    %r8,%rcx
   14012c23e:	je     140131f8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9ad>
   14012c244:	movabs $0xffff000000000000,%rdx
   14012c24e:	and    %rax,%rdx
   14012c251:	cmp    %r8,%rdx
   14012c254:	je     140132657 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf077>
   14012c25a:	movabs $0xfffd000100000000,%rax
   14012c264:	cmp    %rax,%rcx
   14012c267:	jne    140128332 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d52>
   14012c26d:	lea    0x3a0(%rsp),%rdx
   14012c275:	lea    0x680(%rsp),%rcx
   14012c27d:	vzeroupper
   14012c280:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c285:	lea    0x540(%rsp),%rax
   14012c28d:	lea    0x398(%rsp),%rdx
   14012c295:	mov    %rax,%rcx
   14012c298:	mov    %rax,0x40(%rsp)
   14012c29d:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c2a2:	mov    0x40(%rsp),%rcx
   14012c2a7:	lea    0x680(%rsp),%rdx
   14012c2af:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c2b4:	test   %eax,%eax
   14012c2b6:	setle  %al
   14012c2b9:	jmp    140128358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d78>
   14012c2be:	cmp    $0x2,%r12b
   14012c2c2:	je     140132c59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf679>
   14012c2c8:	mov    -0x8(%rsi),%rax
   14012c2cc:	sub    $0x8,%rsi
   14012c2d0:	mov    %rax,0x300(%rsp)
   14012c2d8:	mov    0x300(%rsp),%rdx
   14012c2e0:	movabs $0xffff000000000000,%rax
   14012c2ea:	movabs $0xfffd000000000000,%rcx
   14012c2f4:	and    %rdx,%rax
   14012c2f7:	cmp    %rcx,%rax
   14012c2fa:	jne    1401245de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffe>
   14012c300:	shr    $0x20,%rdx
   14012c304:	cmp    $0x1,%dx
   14012c308:	je     14012d690 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0b0>
   14012c30e:	lea    0x300(%rsp),%rcx
   14012c316:	vzeroupper
   14012c319:	call   140229aa0 <setun::VMValue::as_int() const>
   14012c31e:	test   %rax,%rax
   14012c321:	js     14012d6e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa103>
   14012c327:	je     140124630 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1050>
   14012c32d:	movswq 0x40(%rsp),%rax
   14012c333:	lea    0x0(%rbp,%rax,1),%r14
   14012c338:	jmp    140124639 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1059>
   14012c33d:	cmp    $0x1,%r12b
   14012c341:	je     140133d49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10769>
   14012c347:	mov    -0x8(%rsi),%rax
   14012c34b:	mov    $0x1,%r12d
   14012c351:	sub    $0x10,%rsi
   14012c355:	mov    %rax,0x2a0(%rsp)
   14012c35d:	mov    (%rsi),%rax
   14012c360:	mov    %rax,0x298(%rsp)
   14012c368:	mov    %rax,%rdx
   14012c36b:	movabs $0xffff000000000000,%rcx
   14012c375:	mov    0x2a0(%rsp),%rax
   14012c37d:	and    %rdx,%rcx
   14012c380:	mov    %rcx,%r8
   14012c383:	movabs $0xfff8000000000000,%rcx
   14012c38d:	cmp    %rcx,%r8
   14012c390:	jne    1401267b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31d6>
   14012c396:	movabs $0xffff000000000000,%rcx
   14012c3a0:	movabs $0xfff8000000000000,%r8
   14012c3aa:	and    %rax,%rcx
   14012c3ad:	cmp    %r8,%rcx
   14012c3b0:	je     14012fa2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc44a>
   14012c3b6:	movabs $0xfffd000000000000,%r8
   14012c3c0:	cmp    %r8,%rcx
   14012c3c3:	jne    1401267ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x320f>
   14012c3c9:	mov    %rax,%rcx
   14012c3cc:	shr    $0x20,%rcx
   14012c3d0:	cmp    $0x5,%cx
   14012c3d4:	je     14012685e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x327e>
   14012c3da:	movabs $0xffffffff00000000,%rcx
   14012c3e4:	and    %rcx,%rdx
   14012c3e7:	shr    $0x20,%rax
   14012c3eb:	test   %ax,%ax
   14012c3ee:	je     14012efa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9c0>
   14012c3f4:	movabs $0xfffd000100000000,%rcx
   14012c3fe:	cmp    %rcx,%rdx
   14012c401:	je     14012c40d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e2d>
   14012c403:	cmp    $0x1,%ax
   14012c407:	jne    14012685e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x327e>
   14012c40d:	lea    0x2a0(%rsp),%rdx
   14012c415:	lea    0x680(%rsp),%rcx
   14012c41d:	vzeroupper
   14012c420:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c425:	lea    0x540(%rsp),%rax
   14012c42d:	lea    0x298(%rsp),%rdx
   14012c435:	mov    %rax,%rcx
   14012c438:	mov    %rax,0x40(%rsp)
   14012c43d:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c442:	mov    0x40(%rsp),%rcx
   14012c447:	lea    0x680(%rsp),%rdx
   14012c44f:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c454:	test   %eax,%eax
   14012c456:	sete   %dil
   14012c45a:	jmp    140126885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32a5>
   14012c45f:	cmp    $0x1,%r12b
   14012c463:	je     140133e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10867>
   14012c469:	mov    -0x8(%rsi),%rax
   14012c46d:	mov    $0x1,%r12d
   14012c473:	sub    $0x10,%rsi
   14012c477:	mov    %rax,0x3d0(%rsp)
   14012c47f:	mov    (%rsi),%rax
   14012c482:	mov    %rax,0x3c8(%rsp)
   14012c48a:	mov    0x3c8(%rsp),%rdx
   14012c492:	movabs $0xffff000000000000,%rax
   14012c49c:	movabs $0xfff8000000000000,%rcx
   14012c4a6:	and    %rdx,%rax
   14012c4a9:	cmp    %rcx,%rax
   14012c4ac:	jne    1401286b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50d7>
   14012c4b2:	mov    0x3d0(%rsp),%rcx
   14012c4ba:	movabs $0xffff000000000000,%rax
   14012c4c4:	movabs $0xfff8000000000000,%r8
   14012c4ce:	and    %rcx,%rax
   14012c4d1:	cmp    %r8,%rax
   14012c4d4:	jne    1401286b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50d7>
   14012c4da:	mov    %rdx,%rax
   14012c4dd:	shl    $0x10,%rcx
   14012c4e1:	movabs $0xfffa000000000000,%rdx
   14012c4eb:	shl    $0x10,%rax
   14012c4ef:	cmp    %rcx,%rax
   14012c4f2:	movabs $0xfffa000000000001,%rax
   14012c4fc:	cmovge %rax,%rdx
   14012c500:	mov    %rdx,0x1c8(%rsp)
   14012c508:	cmpb   $0x0,0x1040(%rbx)
   14012c50f:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012c515:	movzbl 0x0(%rbp),%eax
   14012c519:	lea    0x2a6b80(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c520:	add    $0x1,%rbp
   14012c524:	mov    (%rdi,%rax,8),%rax
   14012c528:	jmp    *%rax
   14012c52a:	cmp    $0x1,%r12b
   14012c52e:	je     140132be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf607>
   14012c534:	mov    -0x8(%rsi),%rax
   14012c538:	mov    $0x1,%r12d
   14012c53e:	sub    $0x10,%rsi
   14012c542:	mov    %rax,0x3c0(%rsp)
   14012c54a:	mov    (%rsi),%rax
   14012c54d:	mov    %rax,0x3b8(%rsp)
   14012c555:	mov    0x3b8(%rsp),%rdx
   14012c55d:	movabs $0xffff000000000000,%rax
   14012c567:	movabs $0xfff8000000000000,%rcx
   14012c571:	and    %rdx,%rax
   14012c574:	cmp    %rcx,%rax
   14012c577:	jne    14012855c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f7c>
   14012c57d:	mov    0x3c0(%rsp),%rcx
   14012c585:	movabs $0xffff000000000000,%rax
   14012c58f:	movabs $0xfff8000000000000,%r8
   14012c599:	and    %rcx,%rax
   14012c59c:	cmp    %r8,%rax
   14012c59f:	jne    14012855c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f7c>
   14012c5a5:	mov    %rdx,%rax
   14012c5a8:	shl    $0x10,%rcx
   14012c5ac:	movabs $0xfffa000000000000,%rdx
   14012c5b6:	shl    $0x10,%rax
   14012c5ba:	cmp    %rcx,%rax
   14012c5bd:	movabs $0xfffa000000000001,%rax
   14012c5c7:	cmovg  %rax,%rdx
   14012c5cb:	mov    %rdx,0x1c8(%rsp)
   14012c5d3:	cmpb   $0x0,0x1040(%rbx)
   14012c5da:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012c5e0:	movzbl 0x0(%rbp),%eax
   14012c5e4:	lea    0x2a6ab5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c5eb:	add    $0x1,%rbp
   14012c5ef:	mov    (%rdi,%rax,8),%rax
   14012c5f3:	jmp    *%rax
   14012c5f5:	cmp    $0x1,%r12b
   14012c5f9:	je     140133d70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10790>
   14012c5ff:	mov    -0x8(%rsi),%rax
   14012c603:	mov    $0x1,%r12d
   14012c609:	sub    $0x10,%rsi
   14012c60d:	mov    %rax,0x3a0(%rsp)
   14012c615:	mov    (%rsi),%rax
   14012c618:	mov    %rax,0x398(%rsp)
   14012c620:	mov    0x398(%rsp),%rdx
   14012c628:	movabs $0xffff000000000000,%rax
   14012c632:	movabs $0xfff8000000000000,%rcx
   14012c63c:	and    %rdx,%rax
   14012c63f:	cmp    %rcx,%rax
   14012c642:	jne    1401282a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc4>
   14012c648:	mov    0x3a0(%rsp),%rcx
   14012c650:	movabs $0xffff000000000000,%rax
   14012c65a:	movabs $0xfff8000000000000,%r8
   14012c664:	and    %rcx,%rax
   14012c667:	cmp    %r8,%rax
   14012c66a:	jne    1401282a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc4>
   14012c670:	mov    %rdx,%rax
   14012c673:	shl    $0x10,%rcx
   14012c677:	movabs $0xfffa000000000000,%rdx
   14012c681:	shl    $0x10,%rax
   14012c685:	cmp    %rcx,%rax
   14012c688:	movabs $0xfffa000000000001,%rax
   14012c692:	cmovle %rax,%rdx
   14012c696:	mov    %rdx,0x1c8(%rsp)
   14012c69e:	cmpb   $0x0,0x1040(%rbx)
   14012c6a5:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012c6ab:	movzbl 0x0(%rbp),%eax
   14012c6af:	lea    0x2a69ea(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c6b6:	add    $0x1,%rbp
   14012c6ba:	mov    (%rdi,%rax,8),%rax
   14012c6be:	jmp    *%rax
   14012c6c0:	cmp    $0x1,%r12b
   14012c6c4:	je     1401339dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103fd>
   14012c6ca:	mov    -0x8(%rsi),%rax
   14012c6ce:	mov    $0x1,%r12d
   14012c6d4:	sub    $0x10,%rsi
   14012c6d8:	mov    %rax,0x3b0(%rsp)
   14012c6e0:	mov    (%rsi),%rax
   14012c6e3:	mov    %rax,0x3a8(%rsp)
   14012c6eb:	mov    0x3a8(%rsp),%rcx
   14012c6f3:	movabs $0xffff000000000000,%rax
   14012c6fd:	movabs $0xfff8000000000000,%rdx
   14012c707:	and    %rcx,%rax
   14012c70a:	cmp    %rdx,%rax
   14012c70d:	jne    1401283ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e1f>
   14012c713:	mov    0x3b0(%rsp),%rax
   14012c71b:	movabs $0xffff000000000000,%rdx
   14012c725:	movabs $0xfff8000000000000,%r8
   14012c72f:	and    %rax,%rdx
   14012c732:	cmp    %r8,%rdx
   14012c735:	jne    1401283ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e1f>
   14012c73b:	movabs $0xfffa000000000000,%rdx
   14012c745:	cmp    %rcx,%rax
   14012c748:	movabs $0xfffa000000000001,%rax
   14012c752:	cmove  %rax,%rdx
   14012c756:	mov    %rdx,0x1c8(%rsp)
   14012c75e:	cmpb   $0x0,0x1040(%rbx)
   14012c765:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012c76b:	movzbl 0x0(%rbp),%eax
   14012c76f:	lea    0x2a692a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c776:	add    $0x1,%rbp
   14012c77a:	mov    (%rdi,%rax,8),%rax
   14012c77e:	jmp    *%rax
   14012c780:	mov    %r10d,0x60(%rsp)
   14012c785:	add    %rdx,%rdx
   14012c788:	lea    0x1068(%rbx),%rcx
   14012c78f:	mov    %rax,0x40(%rsp)
   14012c794:	vzeroupper
   14012c797:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012c79c:	cmp    $0x1,%r12b
   14012c7a0:	mov    0x40(%rsp),%rax
   14012c7a5:	mov    0x60(%rsp),%r10d
   14012c7aa:	jne    140124b3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155e>
   14012c7b0:	mov    0x1068(%rbx),%rdx
   14012c7b7:	mov    0x1c8(%rsp),%rcx
   14012c7bf:	mov    %rcx,(%rdx,%r13,8)
   14012c7c3:	mov    0x1048(%rbx),%rdx
   14012c7ca:	mov    %rsi,%r9
   14012c7cd:	movzwl %r10w,%ebp
   14012c7d1:	mov    0x150c0(%rbx),%r10
   14012c7d8:	sub    0x38(%rsp),%r14
   14012c7dd:	sub    %rdx,%r9
   14012c7e0:	mov    %r9,%rdi
   14012c7e3:	sar    $0x3,%rdi
   14012c7e7:	cmp    $0x7ff,%r10
   14012c7ee:	ja     140139a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b4>
   14012c7f4:	xor    %r12d,%r12d
   14012c7f7:	jmp    140124b8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15af>
   14012c7fc:	cmp    $0x1,%r12b
   14012c800:	je     14013376e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1018e>
   14012c806:	mov    -0x8(%rsi),%rax
   14012c80a:	mov    $0x1,%r12d
   14012c810:	sub    $0x10,%rsi
   14012c814:	mov    %rax,0x2d0(%rsp)
   14012c81c:	mov    (%rsi),%rax
   14012c81f:	mov    %rax,0x2c8(%rsp)
   14012c827:	mov    %rax,%rdx
   14012c82a:	movabs $0xffff000000000000,%rcx
   14012c834:	mov    0x2d0(%rsp),%rax
   14012c83c:	and    %rdx,%rcx
   14012c83f:	mov    %rcx,%r8
   14012c842:	movabs $0xfff8000000000000,%rcx
   14012c84c:	cmp    %rcx,%r8
   14012c84f:	jne    140126c1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x363f>
   14012c855:	movabs $0xffff000000000000,%rcx
   14012c85f:	movabs $0xfff8000000000000,%r8
   14012c869:	and    %rax,%rcx
   14012c86c:	cmp    %r8,%rcx
   14012c86f:	je     14013019c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbbc>
   14012c875:	movabs $0xfffd000000000000,%r8
   14012c87f:	cmp    %r8,%rcx
   14012c882:	jne    140126c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3678>
   14012c888:	mov    %rax,%rcx
   14012c88b:	shr    $0x20,%rcx
   14012c88f:	cmp    $0x5,%cx
   14012c893:	je     140126cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e7>
   14012c899:	movabs $0xffffffff00000000,%rcx
   14012c8a3:	and    %rcx,%rdx
   14012c8a6:	shr    $0x20,%rax
   14012c8aa:	test   %ax,%ax
   14012c8ad:	je     14012f1a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbc6>
   14012c8b3:	movabs $0xfffd000100000000,%rcx
   14012c8bd:	cmp    %rcx,%rdx
   14012c8c0:	je     14012c8cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92ec>
   14012c8c2:	cmp    $0x1,%ax
   14012c8c6:	jne    140126cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e7>
   14012c8cc:	lea    0x2d0(%rsp),%rdx
   14012c8d4:	lea    0x680(%rsp),%rcx
   14012c8dc:	vzeroupper
   14012c8df:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c8e4:	lea    0x540(%rsp),%rax
   14012c8ec:	lea    0x2c8(%rsp),%rdx
   14012c8f4:	mov    %rax,%rcx
   14012c8f7:	mov    %rax,0x40(%rsp)
   14012c8fc:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012c901:	mov    0x40(%rsp),%rcx
   14012c906:	lea    0x680(%rsp),%rdx
   14012c90e:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c913:	test   %eax,%eax
   14012c915:	setle  %al
   14012c918:	jmp    140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x370d>
   14012c91d:	cmp    $0x1,%r12b
   14012c921:	je     1401345b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fd8>
   14012c927:	mov    -0x8(%rsi),%rax
   14012c92b:	mov    $0x1,%r12d
   14012c931:	sub    $0x10,%rsi
   14012c935:	mov    %rax,0x2c0(%rsp)
   14012c93d:	mov    (%rsi),%rax
   14012c940:	mov    %rax,0x2b8(%rsp)
   14012c948:	mov    %rax,%rdx
   14012c94b:	movabs $0xffff000000000000,%rcx
   14012c955:	mov    0x2c0(%rsp),%rax
   14012c95d:	and    %rdx,%rcx
   14012c960:	mov    %rcx,%r8
   14012c963:	movabs $0xfff8000000000000,%rcx
   14012c96d:	cmp    %rcx,%r8
   14012c970:	jne    140126aaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34ca>
   14012c976:	movabs $0xffff000000000000,%rcx
   14012c980:	movabs $0xfff8000000000000,%r8
   14012c98a:	and    %rax,%rcx
   14012c98d:	cmp    %r8,%rcx
   14012c990:	je     14012fadd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4fd>
   14012c996:	movabs $0xfffd000000000000,%r8
   14012c9a0:	cmp    %r8,%rcx
   14012c9a3:	jne    140126ae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3503>
   14012c9a9:	mov    %rax,%rcx
   14012c9ac:	shr    $0x20,%rcx
   14012c9b0:	cmp    $0x5,%cx
   14012c9b4:	je     140126b52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3572>
   14012c9ba:	movabs $0xffffffff00000000,%rcx
   14012c9c4:	and    %rcx,%rdx
   14012c9c7:	shr    $0x20,%rax
   14012c9cb:	test   %ax,%ax
   14012c9ce:	je     14012f2ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcce>
   14012c9d4:	movabs $0xfffd000100000000,%rcx
   14012c9de:	cmp    %rcx,%rdx
   14012c9e1:	je     14012c9ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x940d>
   14012c9e3:	cmp    $0x1,%ax
   14012c9e7:	jne    140126b52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3572>
   14012c9ed:	lea    0x2c0(%rsp),%rdx
   14012c9f5:	lea    0x680(%rsp),%rcx
   14012c9fd:	vzeroupper
   14012ca00:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012ca05:	lea    0x540(%rsp),%rax
   14012ca0d:	lea    0x2b8(%rsp),%rdx
   14012ca15:	mov    %rax,%rcx
   14012ca18:	mov    %rax,0x40(%rsp)
   14012ca1d:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012ca22:	mov    0x40(%rsp),%rcx
   14012ca27:	lea    0x680(%rsp),%rdx
   14012ca2f:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012ca34:	shr    $0x1f,%eax
   14012ca37:	jmp    140126b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3598>
   14012ca3c:	cmp    $0x1,%r12b
   14012ca40:	je     140132d1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf73f>
   14012ca46:	mov    -0x8(%rsi),%rax
   14012ca4a:	mov    $0x1,%r12d
   14012ca50:	sub    $0x10,%rsi
   14012ca54:	mov    %rax,0x2f0(%rsp)
   14012ca5c:	mov    (%rsi),%rax
   14012ca5f:	mov    %rax,0x2e8(%rsp)
   14012ca67:	mov    %rax,%rdx
   14012ca6a:	movabs $0xffff000000000000,%rcx
   14012ca74:	mov    0x2f0(%rsp),%rax
   14012ca7c:	and    %rdx,%rcx
   14012ca7f:	mov    %rcx,%r8
   14012ca82:	movabs $0xfff8000000000000,%rcx
   14012ca8c:	cmp    %rcx,%r8
   14012ca8f:	jne    140127383 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3da3>
   14012ca95:	movabs $0xffff000000000000,%rcx
   14012ca9f:	movabs $0xfff8000000000000,%r8
   14012caa9:	and    %rax,%rcx
   14012caac:	cmp    %r8,%rcx
   14012caaf:	je     14012fc95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6b5>
   14012cab5:	movabs $0xfffd000000000000,%r8
   14012cabf:	cmp    %r8,%rcx
   14012cac2:	jne    1401273bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ddc>
   14012cac8:	mov    %rax,%rcx
   14012cacb:	shr    $0x20,%rcx
   14012cacf:	cmp    $0x5,%cx
   14012cad3:	je     14012742b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e4b>
   14012cad9:	movabs $0xffffffff00000000,%rcx
   14012cae3:	and    %rcx,%rdx
   14012cae6:	shr    $0x20,%rax
   14012caea:	test   %ax,%ax
   14012caed:	je     14012f3b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdd6>
   14012caf3:	movabs $0xfffd000100000000,%rcx
   14012cafd:	cmp    %rcx,%rdx
   14012cb00:	je     14012cb0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x952c>
   14012cb02:	cmp    $0x1,%ax
   14012cb06:	jne    14012742b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e4b>
   14012cb0c:	lea    0x2f0(%rsp),%rdx
   14012cb14:	lea    0x680(%rsp),%rcx
   14012cb1c:	vzeroupper
   14012cb1f:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012cb24:	lea    0x540(%rsp),%rax
   14012cb2c:	lea    0x2e8(%rsp),%rdx
   14012cb34:	mov    %rax,%rcx
   14012cb37:	mov    %rax,0x40(%rsp)
   14012cb3c:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012cb41:	mov    0x40(%rsp),%rcx
   14012cb46:	lea    0x680(%rsp),%rdx
   14012cb4e:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012cb53:	not    %eax
   14012cb55:	shr    $0x1f,%eax
   14012cb58:	jmp    140127451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e71>
   14012cb5d:	cmp    $0x1,%r12b
   14012cb61:	je     140133553 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff73>
   14012cb67:	mov    -0x8(%rsi),%rax
   14012cb6b:	mov    $0x1,%r12d
   14012cb71:	sub    $0x10,%rsi
   14012cb75:	mov    %rax,0x1e0(%rsp)
   14012cb7d:	mov    (%rsi),%rax
   14012cb80:	mov    %rax,0x1d8(%rsp)
   14012cb88:	mov    0x1d8(%rsp),%rax
   14012cb90:	movabs $0xffff000000000000,%rdx
   14012cb9a:	movabs $0xfff8000000000000,%rcx
   14012cba4:	and    %rax,%rdx
   14012cba7:	cmp    %rcx,%rdx
   14012cbaa:	jne    1401271a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bc6>
   14012cbb0:	mov    0x1e0(%rsp),%rcx
   14012cbb8:	movabs $0xffff000000000000,%rdx
   14012cbc2:	movabs $0xfff8000000000000,%r8
   14012cbcc:	and    %rcx,%rdx
   14012cbcf:	cmp    %r8,%rdx
   14012cbd2:	jne    1401271a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bc6>
   14012cbd8:	shl    $0x10,%rax
   14012cbdc:	shl    $0x10,%rcx
   14012cbe0:	movabs $0xffffffffffff,%r8
   14012cbea:	sar    $0x10,%rcx
   14012cbee:	sar    $0x10,%rax
   14012cbf2:	add    %rcx,%rax
   14012cbf5:	movabs $0x800000000000,%rcx
   14012cbff:	add    %rax,%rcx
   14012cc02:	cmp    %rcx,%r8
   14012cc05:	jb     1401271a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bc6>
   14012cc0b:	and    %r8,%rax
   14012cc0e:	or     %rdx,%rax
   14012cc11:	lea    -0x1(%rbp),%rdx
   14012cc15:	mov    %rax,0x1c8(%rsp)
   14012cc1d:	cmpb   $0x0,0x1520f(%rbx)
   14012cc24:	je     14012cc55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9675>
   14012cc26:	mov    0xe8(%r15),%rax
   14012cc2d:	mov    0xf0(%r15),%rcx
   14012cc34:	sub    0x38(%rsp),%rdx
   14012cc39:	sub    %rax,%rcx
   14012cc3c:	cmp    %rcx,%rdx
   14012cc3f:	jae    14012cc55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9675>
   14012cc41:	add    %rdx,%rax
   14012cc44:	movzbl (%rax),%edi
   14012cc47:	lea    0x1(%rdi),%edx
   14012cc4a:	mov    %dl,(%rax)
   14012cc4c:	cmp    $0x7,%dl
   14012cc4f:	jbe    14012cc55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9675>
   14012cc51:	movb   $0xbc,-0x1(%rbp)
   14012cc55:	cmpb   $0x0,0x1040(%rbx)
   14012cc5c:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012cc62:	movzbl 0x0(%rbp),%eax
   14012cc66:	lea    0x2a6433(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cc6d:	add    $0x1,%rbp
   14012cc71:	mov    (%rdi,%rax,8),%rax
   14012cc75:	jmp    *%rax
   14012cc77:	cmp    $0x1,%r12b
   14012cc7b:	je     140133bae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105ce>
   14012cc81:	mov    -0x8(%rsi),%rax
   14012cc85:	mov    $0x1,%r12d
   14012cc8b:	sub    $0x10,%rsi
   14012cc8f:	mov    %rax,0x1f0(%rsp)
   14012cc97:	mov    (%rsi),%rax
   14012cc9a:	mov    %rax,0x1e8(%rsp)
   14012cca2:	mov    0x1e8(%rsp),%rax
   14012ccaa:	movabs $0xffff000000000000,%rdx
   14012ccb4:	movabs $0xfff8000000000000,%rcx
   14012ccbe:	and    %rax,%rdx
   14012ccc1:	cmp    %rcx,%rdx
   14012ccc4:	jne    140127252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c72>
   14012ccca:	mov    0x1f0(%rsp),%rcx
   14012ccd2:	movabs $0xffff000000000000,%rdx
   14012ccdc:	movabs $0xfff8000000000000,%r8
   14012cce6:	and    %rcx,%rdx
   14012cce9:	cmp    %r8,%rdx
   14012ccec:	jne    140127252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c72>
   14012ccf2:	shl    $0x10,%rax
   14012ccf6:	shl    $0x10,%rcx
   14012ccfa:	movabs $0xffffffffffff,%r8
   14012cd04:	sar    $0x10,%rcx
   14012cd08:	sar    $0x10,%rax
   14012cd0c:	sub    %rcx,%rax
   14012cd0f:	movabs $0x800000000000,%rcx
   14012cd19:	add    %rax,%rcx
   14012cd1c:	cmp    %rcx,%r8
   14012cd1f:	jb     140127252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c72>
   14012cd25:	and    %r8,%rax
   14012cd28:	or     %rdx,%rax
   14012cd2b:	lea    -0x1(%rbp),%rdx
   14012cd2f:	mov    %rax,0x1c8(%rsp)
   14012cd37:	cmpb   $0x0,0x1520f(%rbx)
   14012cd3e:	je     14012cd6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x978f>
   14012cd40:	mov    0xe8(%r15),%rax
   14012cd47:	mov    0xf0(%r15),%rcx
   14012cd4e:	sub    0x38(%rsp),%rdx
   14012cd53:	sub    %rax,%rcx
   14012cd56:	cmp    %rcx,%rdx
   14012cd59:	jae    14012cd6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x978f>
   14012cd5b:	add    %rdx,%rax
   14012cd5e:	movzbl (%rax),%edi
   14012cd61:	lea    0x1(%rdi),%edx
   14012cd64:	mov    %dl,(%rax)
   14012cd66:	cmp    $0x7,%dl
   14012cd69:	jbe    14012cd6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x978f>
   14012cd6b:	movb   $0xbd,-0x1(%rbp)
   14012cd6f:	cmpb   $0x0,0x1040(%rbx)
   14012cd76:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012cd7c:	movzbl 0x0(%rbp),%eax
   14012cd80:	lea    0x2a6319(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cd87:	add    $0x1,%rbp
   14012cd8b:	mov    (%rdi,%rax,8),%rax
   14012cd8f:	jmp    *%rax
   14012cd91:	cmp    $0x1,%r12b
   14012cd95:	je     140132e59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf879>
   14012cd9b:	mov    -0x8(%rsi),%rax
   14012cd9f:	mov    $0x1,%r12d
   14012cda5:	sub    $0x10,%rsi
   14012cda9:	mov    %rax,0x360(%rsp)
   14012cdb1:	mov    (%rsi),%rax
   14012cdb4:	mov    %rax,0x358(%rsp)
   14012cdbc:	mov    0x358(%rsp),%rdx
   14012cdc4:	movabs $0xffff000000000000,%rax
   14012cdce:	movabs $0xfff8000000000000,%rcx
   14012cdd8:	and    %rdx,%rax
   14012cddb:	cmp    %rcx,%rax
   14012cdde:	jne    140127f36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4956>
   14012cde4:	mov    0x360(%rsp),%rax
   14012cdec:	movabs $0xffff000000000000,%rcx
   14012cdf6:	movabs $0xfff8000000000000,%r8
   14012ce00:	and    %rax,%rcx
   14012ce03:	cmp    %r8,%rcx
   14012ce06:	jne    140127f36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4956>
   14012ce0c:	shl    $0x10,%rax
   14012ce10:	sar    $0x10,%rax
   14012ce14:	mov    %rax,%r8
   14012ce17:	mov    %rdx,%rax
   14012ce1a:	movabs $0x800000000000,%rdx
   14012ce24:	shl    $0x10,%rax
   14012ce28:	sar    $0x10,%rax
   14012ce2c:	add    %r8,%rax
   14012ce2f:	movabs $0xffffffffffff,%r8
   14012ce39:	add    %rax,%rdx
   14012ce3c:	cmp    %rdx,%r8
   14012ce3f:	jb     140127f36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4956>
   14012ce45:	and    %r8,%rax
   14012ce48:	or     %rcx,%rax
   14012ce4b:	mov    %rax,0x1c8(%rsp)
   14012ce53:	cmpb   $0x0,0x1040(%rbx)
   14012ce5a:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012ce60:	movzbl 0x0(%rbp),%eax
   14012ce64:	lea    0x2a6235(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ce6b:	add    $0x1,%rbp
   14012ce6f:	mov    (%rdi,%rax,8),%rax
   14012ce73:	jmp    *%rax
   14012ce75:	mov    %eax,0x60(%rsp)
   14012ce79:	lea    0x20(%rdi),%rdx
   14012ce7d:	lea    0x1068(%rbx),%rcx
   14012ce84:	mov    %r9d,0x40(%rsp)
   14012ce89:	vzeroupper
   14012ce8c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ce91:	movzwl 0x60(%rsp),%eax
   14012ce96:	mov    0x1068(%rbx),%rdx
   14012ce9d:	movabs $0xfff8000000000000,%r10
   14012cea7:	add    %r13,%rax
   14012ceaa:	lea    (%rdx,%rax,8),%rcx
   14012ceae:	movzwl 0x40(%rsp),%eax
   14012ceb3:	mov    (%rcx),%r9
   14012ceb6:	add    %r13,%rax
   14012ceb9:	lea    (%rdx,%rax,8),%r11
   14012cebd:	movabs $0xffff000000000000,%rax
   14012cec7:	and    %r9,%rax
   14012ceca:	cmp    %r10,%rax
   14012cecd:	jne    1401275e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4007>
   14012ced3:	movabs $0xffff000000000000,%r10
   14012cedd:	mov    (%r11),%rax
   14012cee0:	and    %rax,%r10
   14012cee3:	mov    %r10,%r8
   14012cee6:	movabs $0xfff8000000000000,%r10
   14012cef0:	cmp    %r10,%r8
   14012cef3:	jne    1401275e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4004>
   14012cef9:	shl    $0x10,%rax
   14012cefd:	shl    $0x10,%r9
   14012cf01:	sar    $0x10,%rax
   14012cf05:	sar    $0x10,%r9
   14012cf09:	lea    (%rax,%r9,1),%r10
   14012cf0d:	movabs $0x800000000000,%rax
   14012cf17:	movabs $0xffffffffffff,%r9
   14012cf21:	add    %r10,%rax
   14012cf24:	cmp    %rax,%r9
   14012cf27:	jb     1401275e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4004>
   14012cf2d:	mov    %r10,%rax
   14012cf30:	and    %r9,%rax
   14012cf33:	or     %r8,%rax
   14012cf36:	mov    %rax,(%rdx,%rdi,8)
   14012cf3a:	cmpb   $0x0,0x1040(%rbx)
   14012cf41:	je     14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   14012cf47:	movzbl 0x6(%rbp),%eax
   14012cf4b:	lea    0x2a614e(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cf52:	add    $0x7,%rbp
   14012cf56:	mov    (%rdi,%rax,8),%rax
   14012cf5a:	jmp    *%rax
   14012cf5c:	cmp    $0x1,%r12b
   14012cf60:	je     140134594 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fb4>
   14012cf66:	mov    -0x8(%rsi),%rax
   14012cf6a:	mov    $0x1,%r12d
   14012cf70:	sub    $0x10,%rsi
   14012cf74:	mov    %rax,0x370(%rsp)
   14012cf7c:	mov    (%rsi),%rax
   14012cf7f:	mov    %rax,0x368(%rsp)
   14012cf87:	mov    0x368(%rsp),%rax
   14012cf8f:	movabs $0xffff000000000000,%rdx
   14012cf99:	movabs $0xfff8000000000000,%rcx
   14012cfa3:	and    %rax,%rdx
   14012cfa6:	cmp    %rcx,%rdx
   14012cfa9:	jne    140127fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   14012cfaf:	mov    0x370(%rsp),%rcx
   14012cfb7:	movabs $0xffff000000000000,%rdx
   14012cfc1:	movabs $0xfff8000000000000,%r8
   14012cfcb:	and    %rcx,%rdx
   14012cfce:	cmp    %r8,%rdx
   14012cfd1:	jne    140127fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   14012cfd7:	shl    $0x10,%rax
   14012cfdb:	shl    $0x10,%rcx
   14012cfdf:	movabs $0xffffffffffff,%r8
   14012cfe9:	sar    $0x10,%rcx
   14012cfed:	sar    $0x10,%rax
   14012cff1:	sub    %rcx,%rax
   14012cff4:	movabs $0x800000000000,%rcx
   14012cffe:	add    %rax,%rcx
   14012d001:	cmp    %rcx,%r8
   14012d004:	jb     140127fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   14012d00a:	and    %r8,%rax
   14012d00d:	or     %rdx,%rax
   14012d010:	mov    %rax,0x1c8(%rsp)
   14012d018:	cmpb   $0x0,0x1040(%rbx)
   14012d01f:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012d025:	movzbl 0x0(%rbp),%eax
   14012d029:	lea    0x2a6070(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d030:	add    $0x1,%rbp
   14012d034:	mov    (%rdi,%rax,8),%rax
   14012d038:	jmp    *%rax
   14012d03a:	cmp    $0x1,%r12b
   14012d03e:	je     140133e23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10843>
   14012d044:	mov    -0x8(%rsi),%rax
   14012d048:	mov    $0x1,%r12d
   14012d04e:	sub    $0x10,%rsi
   14012d052:	mov    %rax,0x200(%rsp)
   14012d05a:	mov    (%rsi),%rax
   14012d05d:	mov    %rax,0x1f8(%rsp)
   14012d065:	mov    0x1f8(%rsp),%rax
   14012d06d:	movabs $0xffff000000000000,%rdx
   14012d077:	movabs $0xfff8000000000000,%rcx
   14012d081:	and    %rax,%rdx
   14012d084:	cmp    %rcx,%rdx
   14012d087:	jne    140126091 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab1>
   14012d08d:	mov    0x200(%rsp),%rdx
   14012d095:	movabs $0xffff000000000000,%rcx
   14012d09f:	movabs $0xfff8000000000000,%r8
   14012d0a9:	and    %rdx,%rcx
   14012d0ac:	cmp    %r8,%rcx
   14012d0af:	jne    140126091 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab1>
   14012d0b5:	shl    $0x10,%rdx
   14012d0b9:	shl    $0x10,%rax
   14012d0bd:	movabs $0xffffffffffff,%r8
   14012d0c7:	sar    $0x10,%rdx
   14012d0cb:	sar    $0x10,%rax
   14012d0cf:	imul   %rdx,%rax
   14012d0d3:	movabs $0x800000000000,%rdx
   14012d0dd:	add    %rax,%rdx
   14012d0e0:	cmp    %rdx,%r8
   14012d0e3:	jb     140126091 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ab1>
   14012d0e9:	and    %r8,%rax
   14012d0ec:	lea    -0x1(%rbp),%rdx
   14012d0f0:	or     %rcx,%rax
   14012d0f3:	mov    %rax,0x1c8(%rsp)
   14012d0fb:	cmpb   $0x0,0x1520f(%rbx)
   14012d102:	je     14012d133 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b53>
   14012d104:	mov    0xe8(%r15),%rax
   14012d10b:	mov    0xf0(%r15),%rcx
   14012d112:	sub    0x38(%rsp),%rdx
   14012d117:	sub    %rax,%rcx
   14012d11a:	cmp    %rcx,%rdx
   14012d11d:	jae    14012d133 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b53>
   14012d11f:	add    %rdx,%rax
   14012d122:	movzbl (%rax),%edi
   14012d125:	lea    0x1(%rdi),%edx
   14012d128:	mov    %dl,(%rax)
   14012d12a:	cmp    $0x7,%dl
   14012d12d:	jbe    14012d133 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b53>
   14012d12f:	movb   $0xbe,-0x1(%rbp)
   14012d133:	cmpb   $0x0,0x1040(%rbx)
   14012d13a:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012d140:	movzbl 0x0(%rbp),%eax
   14012d144:	lea    0x2a5f55(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d14b:	add    $0x1,%rbp
   14012d14f:	mov    (%rdi,%rax,8),%rax
   14012d153:	jmp    *%rax
   14012d155:	cmp    $0x1,%r12b
   14012d159:	je     140134381 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10da1>
   14012d15f:	mov    -0x8(%rsi),%rax
   14012d163:	mov    $0x1,%r12d
   14012d169:	sub    $0x10,%rsi
   14012d16d:	mov    %rax,0x2e0(%rsp)
   14012d175:	mov    (%rsi),%rax
   14012d178:	mov    %rax,0x2d8(%rsp)
   14012d180:	mov    %rax,%rdx
   14012d183:	movabs $0xffff000000000000,%rcx
   14012d18d:	mov    0x2e0(%rsp),%rax
   14012d195:	and    %rdx,%rcx
   14012d198:	mov    %rcx,%r8
   14012d19b:	movabs $0xfff8000000000000,%rcx
   14012d1a5:	cmp    %rcx,%r8
   14012d1a8:	jne    140126d94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37b4>
   14012d1ae:	movabs $0xffff000000000000,%rcx
   14012d1b8:	movabs $0xfff8000000000000,%r8
   14012d1c2:	and    %rax,%rcx
   14012d1c5:	cmp    %r8,%rcx
   14012d1c8:	je     140130225 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc45>
   14012d1ce:	movabs $0xfffd000000000000,%r8
   14012d1d8:	cmp    %r8,%rcx
   14012d1db:	jne    140126dcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37ed>
   14012d1e1:	mov    %rax,%rcx
   14012d1e4:	shr    $0x20,%rcx
   14012d1e8:	cmp    $0x5,%cx
   14012d1ec:	je     140126e3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x385c>
   14012d1f2:	movabs $0xffffffff00000000,%rcx
   14012d1fc:	and    %rcx,%rdx
   14012d1ff:	shr    $0x20,%rax
   14012d203:	test   %ax,%ax
   14012d206:	je     14012f09e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbabe>
   14012d20c:	movabs $0xfffd000100000000,%rcx
   14012d216:	cmp    %rcx,%rdx
   14012d219:	je     14012d225 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c45>
   14012d21b:	cmp    $0x1,%ax
   14012d21f:	jne    140126e3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x385c>
   14012d225:	lea    0x2e0(%rsp),%rdx
   14012d22d:	lea    0x680(%rsp),%rcx
   14012d235:	vzeroupper
   14012d238:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d23d:	lea    0x540(%rsp),%rax
   14012d245:	lea    0x2d8(%rsp),%rdx
   14012d24d:	mov    %rax,%rcx
   14012d250:	mov    %rax,0x40(%rsp)
   14012d255:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d25a:	mov    0x40(%rsp),%rcx
   14012d25f:	lea    0x680(%rsp),%rdx
   14012d267:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d26c:	test   %eax,%eax
   14012d26e:	setg   %al
   14012d271:	jmp    140126e62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3882>
   14012d276:	cmp    $0x1,%r12b
   14012d27a:	je     140133bd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105f2>
   14012d280:	mov    -0x8(%rsi),%rax
   14012d284:	mov    $0x1,%r12d
   14012d28a:	sub    $0x10,%rsi
   14012d28e:	mov    %rax,0x390(%rsp)
   14012d296:	mov    (%rsi),%rax
   14012d299:	mov    %rax,0x388(%rsp)
   14012d2a1:	mov    0x388(%rsp),%rdx
   14012d2a9:	movabs $0xffff000000000000,%rax
   14012d2b3:	movabs $0xfff8000000000000,%rcx
   14012d2bd:	and    %rdx,%rax
   14012d2c0:	cmp    %rcx,%rax
   14012d2c3:	jne    140128149 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b69>
   14012d2c9:	mov    0x390(%rsp),%rcx
   14012d2d1:	movabs $0xffff000000000000,%rax
   14012d2db:	movabs $0xfff8000000000000,%r8
   14012d2e5:	and    %rcx,%rax
   14012d2e8:	cmp    %r8,%rax
   14012d2eb:	jne    140128149 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b69>
   14012d2f1:	mov    %rdx,%rax
   14012d2f4:	shl    $0x10,%rcx
   14012d2f8:	movabs $0xfffa000000000000,%rdx
   14012d302:	shl    $0x10,%rax
   14012d306:	cmp    %rcx,%rax
   14012d309:	movabs $0xfffa000000000001,%rax
   14012d313:	cmovl  %rax,%rdx
   14012d317:	mov    %rdx,0x1c8(%rsp)
   14012d31f:	cmpb   $0x0,0x1040(%rbx)
   14012d326:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012d32c:	movzbl 0x0(%rbp),%eax
   14012d330:	lea    0x2a5d69(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d337:	add    $0x1,%rbp
   14012d33b:	mov    (%rdi,%rax,8),%rax
   14012d33f:	jmp    *%rax
   14012d341:	cmp    $0x1,%r12b
   14012d345:	je     140133dff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1081f>
   14012d34b:	mov    -0x8(%rsi),%rax
   14012d34f:	mov    $0x1,%r12d
   14012d355:	sub    $0x10,%rsi
   14012d359:	mov    %rax,0x380(%rsp)
   14012d361:	mov    (%rsi),%rax
   14012d364:	mov    %rax,0x378(%rsp)
   14012d36c:	mov    0x378(%rsp),%rdx
   14012d374:	movabs $0xffff000000000000,%rax
   14012d37e:	movabs $0xfff8000000000000,%rcx
   14012d388:	and    %rdx,%rax
   14012d38b:	cmp    %rcx,%rax
   14012d38e:	jne    140128096 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ab6>
   14012d394:	mov    0x380(%rsp),%rax
   14012d39c:	movabs $0xffff000000000000,%rcx
   14012d3a6:	movabs $0xfff8000000000000,%r8
   14012d3b0:	and    %rax,%rcx
   14012d3b3:	cmp    %r8,%rcx
   14012d3b6:	jne    140128096 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ab6>
   14012d3bc:	shl    $0x10,%rax
   14012d3c0:	sar    $0x10,%rax
   14012d3c4:	mov    %rax,%r8
   14012d3c7:	mov    %rdx,%rax
   14012d3ca:	movabs $0x800000000000,%rdx
   14012d3d4:	shl    $0x10,%rax
   14012d3d8:	sar    $0x10,%rax
   14012d3dc:	imul   %r8,%rax
   14012d3e0:	movabs $0xffffffffffff,%r8
   14012d3ea:	add    %rax,%rdx
   14012d3ed:	cmp    %rdx,%r8
   14012d3f0:	jb     140128096 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ab6>
   14012d3f6:	and    %r8,%rax
   14012d3f9:	or     %rcx,%rax
   14012d3fc:	mov    %rax,0x1c8(%rsp)
   14012d404:	cmpb   $0x0,0x1040(%rbx)
   14012d40b:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012d411:	movzbl 0x0(%rbp),%eax
   14012d415:	lea    0x2a5c84(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d41c:	add    $0x1,%rbp
   14012d420:	mov    (%rdi,%rax,8),%rax
   14012d424:	jmp    *%rax
   14012d426:	mov    0x1c8(%rsp),%rax
   14012d42e:	sub    $0x8,%rsi
   14012d432:	movabs $0xffff000000000000,%rdx
   14012d43c:	movabs $0xfffd000000000000,%rcx
   14012d446:	mov    %rax,0x310(%rsp)
   14012d44e:	mov    (%rsi),%rax
   14012d451:	and    %rax,%rdx
   14012d454:	mov    %rax,0x308(%rsp)
   14012d45c:	cmp    %rcx,%rdx
   14012d45f:	jne    140129f0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x692e>
   14012d465:	xor    %r12d,%r12d
   14012d468:	shr    $0x20,%rax
   14012d46c:	cmp    $0x3,%ax
   14012d470:	je     14012f975 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc395>
   14012d476:	test   %ax,%ax
   14012d479:	jne    14012e54f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf6f>
   14012d47f:	lea    0x540(%rsp),%rcx
   14012d487:	lea    0x308(%rsp),%rdx
   14012d48f:	vzeroupper
   14012d492:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012d497:	lea    0x310(%rsp),%rcx
   14012d49f:	call   140229aa0 <setun::VMValue::as_int() const>
   14012d4a4:	mov    %rax,%rdi
   14012d4a7:	test   %rax,%rax
   14012d4aa:	js     140131a74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe494>
   14012d4b0:	cmp    0x548(%rsp),%rdi
   14012d4b8:	jae    140131a82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4a2>
   14012d4be:	test   %r12b,%r12b
   14012d4c1:	je     140134f20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11940>
   14012d4c7:	cmp    $0x1,%r12b
   14012d4cb:	je     140135c38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12658>
   14012d4d1:	lea    0x8(%rsi),%rax
   14012d4d5:	cmp    0x30(%rsp),%rax
   14012d4da:	jae    140136ecb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138eb>
   14012d4e0:	mov    0x1d0(%rsp),%rax
   14012d4e8:	lea    0x690(%rsp),%r12
   14012d4f0:	mov    $0x1,%edx
   14012d4f5:	lea    0x680(%rsp),%rcx
   14012d4fd:	mov    %rax,(%rsi)
   14012d500:	mov    0x1c8(%rsp),%rax
   14012d508:	mov    %rax,0x1d0(%rsp)
   14012d510:	mov    0x540(%rsp),%rax
   14012d518:	movsbl (%rax,%rdi,1),%r8d
   14012d51d:	mov    %r12,0x680(%rsp)
   14012d525:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012d52a:	lea    0x680(%rsp),%rdx
   14012d532:	lea    0x520(%rsp),%rcx
   14012d53a:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012d53f:	mov    0x520(%rsp),%rax
   14012d547:	mov    0x680(%rsp),%rcx
   14012d54f:	mov    %rax,0x1c8(%rsp)
   14012d557:	cmp    %r12,%rcx
   14012d55a:	je     14012d56d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f8d>
   14012d55c:	mov    0x690(%rsp),%rax
   14012d564:	lea    0x1(%rax),%rdx
   14012d568:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012d56d:	add    $0x8,%rsi
   14012d571:	mov    $0x2,%r12d
   14012d577:	mov    0x540(%rsp),%rcx
   14012d57f:	lea    0x550(%rsp),%rax
   14012d587:	cmp    %rax,%rcx
   14012d58a:	je     140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14012d590:	mov    0x550(%rsp),%rax
   14012d598:	lea    0x1(%rax),%rdx
   14012d59c:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012d5a1:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14012d5a6:	mov    %rcx,%rdx
   14012d5a9:	lea    0x1068(%rbx),%rcx
   14012d5b0:	vzeroupper
   14012d5b3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5b8:	jmp    1401249a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c6>
   14012d5bd:	mov    %rdx,%rax
   14012d5c0:	shr    $0x20,%rax
   14012d5c4:	cmp    $0x2,%ax
   14012d5c8:	je     140130780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1a0>
   14012d5ce:	mov    0x1c8(%rsp),%rax
   14012d5d6:	xor    %r12d,%r12d
   14012d5d9:	mov    %rax,0x3f0(%rsp)
   14012d5e1:	movabs $0xffffffff00000000,%rax
   14012d5eb:	movabs $0xfffd000200000000,%rcx
   14012d5f5:	and    %rdx,%rax
   14012d5f8:	cmp    %rcx,%rax
   14012d5fb:	jne    1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   14012d601:	mov    %rdx,0x3e8(%rsp)
   14012d609:	lea    0x3e8(%rsp),%rcx
   14012d611:	vzeroupper
   14012d614:	call   14022b1c0 <setun::VMValue::payload() const>
   14012d619:	mov    0x48(%rax),%rax
   14012d61d:	test   %rax,%rax
   14012d620:	je     1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   14012d626:	mov    0x38(%rax),%rcx
   14012d62a:	test   %rcx,%rcx
   14012d62d:	je     140133400 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe20>
   14012d633:	mov    (%rdi),%edx
   14012d635:	cmp    %edx,(%rcx)
   14012d637:	jne    140133400 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe20>
   14012d63d:	test   %edx,%edx
   14012d63f:	je     140133400 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe20>
   14012d645:	mov    0x48(%rax),%rcx
   14012d649:	mov    0x50(%rax),%rdx
   14012d64d:	movzwl 0x4(%rdi),%r8d
   14012d652:	sub    %rcx,%rdx
   14012d655:	sar    $0x3,%rdx
   14012d659:	cmp    %rdx,%r8
   14012d65c:	jae    140133400 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe20>
   14012d662:	mov    0x3f0(%rsp),%rax
   14012d66a:	mov    %rax,(%rcx,%r8,8)
   14012d66e:	cmpb   $0x0,0x1040(%rbx)
   14012d675:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012d67b:	movzbl 0x2(%rbp),%eax
   14012d67f:	lea    0x2a5a1a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d686:	add    $0x3,%rbp
   14012d68a:	mov    (%rdi,%rax,8),%rax
   14012d68e:	jmp    *%rax
   14012d690:	lea    0x540(%rsp),%rax
   14012d698:	vpxor  %xmm0,%xmm0,%xmm0
   14012d69c:	movq   $0x0,0x690(%rsp)
   14012d6a8:	lea    0x300(%rsp),%rdx
   14012d6b0:	mov    %rax,0x60(%rsp)
   14012d6b5:	mov    %rax,%rcx
   14012d6b8:	vmovdqa %xmm0,0x680(%rsp)
   14012d6c1:	vzeroupper
   14012d6c4:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d6c9:	mov    0x60(%rsp),%rcx
   14012d6ce:	lea    0x680(%rsp),%rdx
   14012d6d6:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d6db:	test   %eax,%eax
   14012d6dd:	jns    14012c327 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d47>
   14012d6e3:	movswq %di,%rax
   14012d6e7:	lea    -0x4(%rbp,%rax,1),%r14
   14012d6ec:	cmpb   $0x0,0x1040(%rbx)
   14012d6f3:	jne    140124646 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1066>
   14012d6f9:	jmp    14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012d6fe:	cmp    $0x1,%r12b
   14012d702:	je     140132d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7b5>
   14012d708:	mov    -0x8(%rsi),%rax
   14012d70c:	mov    $0x1,%r12d
   14012d712:	sub    $0x10,%rsi
   14012d716:	mov    %rax,0x290(%rsp)
   14012d71e:	mov    (%rsi),%rax
   14012d721:	mov    %rax,0x288(%rsp)
   14012d729:	movabs $0xffffffff00000000,%rax
   14012d733:	movabs $0xfffd000100000000,%rdx
   14012d73d:	and    0x288(%rsp),%rax
   14012d745:	cmp    %rdx,%rax
   14012d748:	jne    140126686 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30a6>
   14012d74e:	lea    0x290(%rsp),%rdx
   14012d756:	lea    0x680(%rsp),%rcx
   14012d75e:	vzeroupper
   14012d761:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d766:	lea    0x540(%rsp),%rax
   14012d76e:	lea    0x288(%rsp),%rdx
   14012d776:	mov    %rax,%rcx
   14012d779:	mov    %rax,0x40(%rsp)
   14012d77e:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d783:	mov    0x40(%rsp),%rcx
   14012d788:	lea    0x680(%rsp),%rdx
   14012d790:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d795:	test   %eax,%eax
   14012d797:	js     1401316f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe110>
   14012d79d:	mov    0x288(%rsp),%rax
   14012d7a5:	mov    %rax,0x1c8(%rsp)
   14012d7ad:	cmpb   $0x0,0x1040(%rbx)
   14012d7b4:	jne    140126734 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3154>
   14012d7ba:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012d7bf:	cmp    $0x1,%r12b
   14012d7c3:	je     1401343f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e16>
   14012d7c9:	mov    -0x8(%rsi),%rax
   14012d7cd:	mov    $0x1,%r12d
   14012d7d3:	sub    $0x10,%rsi
   14012d7d7:	mov    %rax,0x280(%rsp)
   14012d7df:	mov    (%rsi),%rax
   14012d7e2:	mov    %rax,0x278(%rsp)
   14012d7ea:	movabs $0xffffffff00000000,%rax
   14012d7f4:	movabs $0xfffd000100000000,%rdx
   14012d7fe:	and    0x278(%rsp),%rax
   14012d806:	cmp    %rdx,%rax
   14012d809:	jne    140126559 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f79>
   14012d80f:	lea    0x280(%rsp),%rdx
   14012d817:	lea    0x680(%rsp),%rcx
   14012d81f:	vzeroupper
   14012d822:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d827:	lea    0x540(%rsp),%rax
   14012d82f:	lea    0x278(%rsp),%rdx
   14012d837:	mov    %rax,%rcx
   14012d83a:	mov    %rax,0x40(%rsp)
   14012d83f:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012d844:	mov    0x40(%rsp),%rcx
   14012d849:	lea    0x680(%rsp),%rdx
   14012d851:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d856:	test   %eax,%eax
   14012d858:	jle    1401319a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3c1>
   14012d85e:	mov    0x280(%rsp),%rax
   14012d866:	mov    %rax,0x1c8(%rsp)
   14012d86e:	cmpb   $0x0,0x1040(%rbx)
   14012d875:	jne    140126607 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3027>
   14012d87b:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012d880:	movabs $0xffff000000000000,%rax
   14012d88a:	and    0x338(%rsp),%rax
   14012d892:	xor    %r12d,%r12d
   14012d895:	movabs $0xfff8000000000000,%rdx
   14012d89f:	cmp    %rdx,%rax
   14012d8a2:	jne    1401327ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf20c>
   14012d8a8:	lea    0x330(%rsp),%rcx
   14012d8b0:	vzeroupper
   14012d8b3:	call   14022b1c0 <setun::VMValue::payload() const>
   14012d8b8:	mov    0x58(%rax),%rdi
   14012d8bc:	test   %rdi,%rdi
   14012d8bf:	je     1401352ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d0c>
   14012d8c5:	mov    0x338(%rsp),%r14
   14012d8cd:	shl    $0x10,%r14
   14012d8d1:	sar    $0x10,%r14
   14012d8d5:	js     1401352ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d0c>
   14012d8db:	mov    %rdi,%rcx
   14012d8de:	call   140152c50 <setun::ArrayObject::size() const>
   14012d8e3:	cmp    %rax,%r14
   14012d8e6:	jae    1401352ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d0c>
   14012d8ec:	movzbl (%rdi),%eax
   14012d8ef:	cmp    $0x3,%al
   14012d8f1:	je     140135d08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12728>
   14012d8f7:	ja     14013522f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c4f>
   14012d8fd:	cmp    $0x1,%al
   14012d8ff:	je     14013519b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bbb>
   14012d905:	cmp    $0x2,%al
   14012d907:	jne    14013515a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b7a>
   14012d90d:	test   %r12b,%r12b
   14012d910:	je     140137f48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14968>
   14012d916:	sub    $0x1,%r12b
   14012d91a:	je     140137f07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14927>
   14012d920:	lea    0x8(%rsi),%r8
   14012d924:	cmp    0x30(%rsp),%r8
   14012d929:	jae    14013775a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1417a>
   14012d92f:	mov    0x1d0(%rsp),%rax
   14012d937:	lea    0x680(%rsp),%rcx
   14012d93f:	mov    %r8,0x40(%rsp)
   14012d944:	mov    $0x2,%r12d
   14012d94a:	mov    %rax,(%rsi)
   14012d94d:	mov    0x1c8(%rsp),%rax
   14012d955:	mov    %rax,0x1d0(%rsp)
   14012d95d:	mov    0x38(%rdi),%rax
   14012d961:	movzbl (%rax,%r14,1),%edx
   14012d966:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012d96b:	mov    0x680(%rsp),%rax
   14012d973:	mov    0x40(%rsp),%rsi
   14012d978:	mov    %rax,0x1c8(%rsp)
   14012d980:	cmpb   $0x0,0x1040(%rbx)
   14012d987:	je     14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   14012d98d:	movzbl 0x0(%rbp),%eax
   14012d991:	lea    0x2a5708(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d998:	add    $0x1,%rbp
   14012d99c:	mov    (%rdi,%rax,8),%rax
   14012d9a0:	jmp    *%rax
   14012d9a2:	mov    %r9,0x40(%rsp)
   14012d9a7:	lea    0x1c8(%rsp),%rcx
   14012d9af:	vzeroupper
   14012d9b2:	call   14022b1c0 <setun::VMValue::payload() const>
   14012d9b7:	mov    0x40(%rsp),%r9
   14012d9bc:	mov    0x48(%rax),%rax
   14012d9c0:	test   %rax,%rax
   14012d9c3:	je     1401287e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5206>
   14012d9c9:	mov    0x38(%rax),%rcx
   14012d9cd:	test   %rcx,%rcx
   14012d9d0:	je     1401287e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5206>
   14012d9d6:	mov    (%r9),%edx
   14012d9d9:	cmp    %edx,(%rcx)
   14012d9db:	jne    1401287e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5206>
   14012d9e1:	test   %edx,%edx
   14012d9e3:	je     1401287e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5206>
   14012d9e9:	movzwl 0x4(%r9),%edx
   14012d9ee:	mov    0x48(%rax),%rax
   14012d9f2:	mov    (%rax,%rdx,8),%rax
   14012d9f6:	mov    %rax,0x1c8(%rsp)
   14012d9fe:	cmpb   $0x0,0x1040(%rbx)
   14012da05:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012da0b:	movzbl 0x2(%rbp),%eax
   14012da0f:	lea    0x2a568a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012da16:	add    $0x3,%rbp
   14012da1a:	mov    (%rdi,%rax,8),%rax
   14012da1e:	jmp    *%rax
   14012da20:	vzeroupper
   14012da23:	movabs $0xfffd000100000000,%rdx
   14012da2d:	mov    0x40(%rsp),%rax
   14012da32:	mov    (%rax),%r8
   14012da35:	movabs $0xffffffff00000000,%rax
   14012da3f:	mov    %r8,%rcx
   14012da42:	and    %rax,%rcx
   14012da45:	cmp    %rdx,%rcx
   14012da48:	je     14012db7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59c>
   14012da4e:	mov    0x60(%rsp),%rcx
   14012da53:	mov    (%rcx),%rcx
   14012da56:	and    %rcx,%rax
   14012da59:	cmp    %rdx,%rax
   14012da5c:	je     14012db7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59c>
   14012da62:	movabs $0xfff7ffffffffffff,%rdx
   14012da6c:	cmp    %r9,%rdx
   14012da6f:	jae    14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012da75:	movabs $0xfffc000000000000,%rax
   14012da7f:	cmp    %rax,%r9
   14012da82:	je     14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012da88:	cmp    %r8,%rdx
   14012da8b:	jae    14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012da91:	cmp    %rax,%r8
   14012da94:	je     14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012da9a:	cmp    %rcx,%rdx
   14012da9d:	jae    14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012daa3:	cmp    %rax,%rcx
   14012daa6:	je     14012eaa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4c7>
   14012daac:	mov    0x40(%rsp),%rdx
   14012dab1:	mov    %r11,%rcx
   14012dab4:	call   140228f80 <setun::VMValue::mul(setun::VMValue const&) const>
   14012dab9:	mov    0x60(%rsp),%rdx
   14012dabe:	lea    0x680(%rsp),%rcx
   14012dac6:	mov    %rax,0x680(%rsp)
   14012dace:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   14012dad3:	mov    0x1068(%rbx),%rdx
   14012dada:	mov    %rax,(%rdx,%rdi,8)
   14012dade:	cmpb   $0x0,0x1040(%rbx)
   14012dae5:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012daeb:	movzbl 0x8(%rbp),%eax
   14012daef:	lea    0x2a55aa(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012daf6:	add    $0x9,%rbp
   14012dafa:	mov    (%rdi,%rax,8),%rax
   14012dafe:	jmp    *%rax
   14012db00:	movswq %r8w,%r8
   14012db04:	lea    0x680(%rsp),%rax
   14012db0c:	mov    %r8,%rdx
   14012db0f:	mov    %rax,0x40(%rsp)
   14012db14:	mov    %rax,%rcx
   14012db17:	vzeroupper
   14012db1a:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012db1f:	mov    0x40(%rsp),%rdx
   14012db24:	mov    %rdi,%rcx
   14012db27:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   14012db2c:	mov    %rax,(%rdi)
   14012db2f:	cmpb   $0x0,0x1040(%rbx)
   14012db36:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012db3c:	movzbl 0x4(%rbp),%eax
   14012db40:	lea    0x2a5559(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012db47:	add    $0x5,%rbp
   14012db4b:	mov    (%rdi,%rax,8),%rax
   14012db4f:	jmp    *%rax
   14012db51:	vzeroupper
   14012db54:	jmp    14012a1ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c0a>
   14012db59:	vzeroupper
   14012db5c:	movabs $0xffffffff00000000,%rax
   14012db66:	movabs $0xfffd000100000000,%rdx
   14012db70:	and    %r9,%rax
   14012db73:	cmp    %rdx,%rax
   14012db76:	jne    14012da23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa443>
   14012db7c:	movabs $0xffff000000000000,%rdx
   14012db86:	movb   $0xcd,-0x1(%rbp)
   14012db8a:	mov    (%r11),%rax
   14012db8d:	movabs $0xfffd000000000000,%rcx
   14012db97:	and    %rax,%rdx
   14012db9a:	cmp    %rcx,%rdx
   14012db9d:	je     140133c6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1068d>
   14012dba3:	movabs $0xfff8000000000000,%rax
   14012dbad:	cmp    %rax,%rdx
   14012dbb0:	je     140133c85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106a5>
   14012dbb6:	mov    %r11,%rcx
   14012dbb9:	call   14022b550 <setun::VMValue::as_float() const>
   14012dbbe:	vcvttsd2si %xmm0,%rax
   14012dbc3:	mov    %rax,0x500(%rsp)
   14012dbcb:	lea    0x500(%rsp),%rax
   14012dbd3:	movq   $0x0,0x508(%rsp)
   14012dbdf:	movq   $0x0,0x510(%rsp)
   14012dbeb:	mov    %rax,0x80(%rsp)
   14012dbf3:	movabs $0xffff000000000000,%rdx
   14012dbfd:	mov    0x40(%rsp),%rax
   14012dc02:	movabs $0xfffd000000000000,%rcx
   14012dc0c:	mov    (%rax),%rax
   14012dc0f:	and    %rax,%rdx
   14012dc12:	cmp    %rcx,%rdx
   14012dc15:	je     140133c1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1063e>
   14012dc1b:	movabs $0xfff8000000000000,%rax
   14012dc25:	cmp    %rax,%rdx
   14012dc28:	je     140133c36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10656>
   14012dc2e:	mov    0x40(%rsp),%rcx
   14012dc33:	call   14022b550 <setun::VMValue::as_float() const>
   14012dc38:	lea    0x520(%rsp),%r8
   14012dc40:	movq   $0x0,0x528(%rsp)
   14012dc4c:	vcvttsd2si %xmm0,%rax
   14012dc51:	movq   $0x0,0x530(%rsp)
   14012dc5d:	mov    %rax,0x520(%rsp)
   14012dc65:	movabs $0xffff000000000000,%rdx
   14012dc6f:	mov    0x60(%rsp),%rax
   14012dc74:	movabs $0xfffd000000000000,%rcx
   14012dc7e:	mov    (%rax),%rax
   14012dc81:	and    %rax,%rdx
   14012dc84:	cmp    %rcx,%rdx
   14012dc87:	je     140133610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10030>
   14012dc8d:	movabs $0xfff8000000000000,%rax
   14012dc97:	cmp    %rax,%rdx
   14012dc9a:	je     140133628 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10048>
   14012dca0:	mov    0x60(%rsp),%rcx
   14012dca5:	mov    %r8,0x40(%rsp)
   14012dcaa:	call   14022b550 <setun::VMValue::as_float() const>
   14012dcaf:	vcvttsd2si %xmm0,%rax
   14012dcb4:	mov    0x40(%rsp),%r8
   14012dcb9:	mov    %rax,0x540(%rsp)
   14012dcc1:	lea    0x540(%rsp),%rax
   14012dcc9:	movq   $0x0,0x548(%rsp)
   14012dcd5:	movq   $0x0,0x550(%rsp)
   14012dce1:	mov    %rax,0x60(%rsp)
   14012dce6:	mov    0x80(%rsp),%rdx
   14012dcee:	lea    0x680(%rsp),%rax
   14012dcf6:	mov    %rax,%rcx
   14012dcf9:	mov    %rax,0x40(%rsp)
   14012dcfe:	call   140011910 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012dd03:	mov    0x40(%rsp),%r8
   14012dd08:	mov    0x60(%rsp),%rdx
   14012dd0d:	lea    0x4a0(%rsp),%rcx
   14012dd15:	call   1400113a0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012dd1a:	mov    0x4b0(%rsp),%rax
   14012dd22:	vmovdqa 0x4a0(%rsp),%xmm7
   14012dd2b:	lea    0x1a0(%rsp),%rdx
   14012dd33:	mov    0x40(%rsp),%rcx
   14012dd38:	mov    %rax,0x1b0(%rsp)
   14012dd40:	vmovdqa %xmm7,0x1a0(%rsp)
   14012dd49:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012dd4e:	mov    0x1068(%rbx),%rax
   14012dd55:	mov    0x680(%rsp),%rdx
   14012dd5d:	mov    %rdx,(%rax,%rdi,8)
   14012dd61:	jmp    14012dade <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4fe>
   14012dd66:	movswq %r9w,%r9
   14012dd6a:	vzeroupper
   14012dd6d:	mov    %r9,%rdx
   14012dd70:	lea    0x680(%rsp),%rcx
   14012dd78:	mov    %r8,0x60(%rsp)
   14012dd7d:	mov    %r11,0x40(%rsp)
   14012dd82:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012dd87:	mov    0x40(%rsp),%rcx
   14012dd8c:	lea    0x680(%rsp),%rdx
   14012dd94:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   14012dd99:	mov    0x1068(%rbx),%rdx
   14012dda0:	mov    0x60(%rsp),%r8
   14012dda5:	mov    %rax,(%rdx,%r8,8)
   14012dda9:	cmpb   $0x0,0x1040(%rbx)
   14012ddb0:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012ddb6:	movzbl 0x6(%rbp),%eax
   14012ddba:	lea    0x2a52df(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ddc1:	add    $0x7,%rbp
   14012ddc5:	mov    (%rdi,%rax,8),%rax
   14012ddc9:	jmp    *%rax
   14012ddcb:	vzeroupper
   14012ddce:	jmp    14012dd6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78d>
   14012ddd0:	cmp    $0x2,%r12b
   14012ddd4:	jne    140139515 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f35>
   14012ddda:	mov    0x1d0(%rsp),%rdx
   14012dde2:	mov    0x1c8(%rsp),%rax
   14012ddea:	movabs $0xfffd000000000000,%rcx
   14012ddf4:	mov    %rdx,0x1c8(%rsp)
   14012ddfc:	movabs $0xffff000000000000,%rdx
   14012de06:	and    %rax,%rdx
   14012de09:	mov    %rax,0x3e0(%rsp)
   14012de11:	cmp    %rcx,%rdx
   14012de14:	je     140135371 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d91>
   14012de1a:	mov    0x1c8(%rsp),%rax
   14012de22:	mov    $0x2,%r12d
   14012de28:	mov    %rax,0x1d0(%rsp)
   14012de30:	jmp    140128826 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5246>
   14012de35:	lea    0x2a8(%rsp),%rcx
   14012de3d:	vzeroupper
   14012de40:	call   14022b550 <setun::VMValue::as_float() const>
   14012de45:	lea    0x2b0(%rsp),%rcx
   14012de4d:	vmovapd %xmm0,%xmm7
   14012de51:	call   14022b550 <setun::VMValue::as_float() const>
   14012de56:	movabs $0xfffa000000000000,%rax
   14012de60:	vsubsd %xmm0,%xmm7,%xmm0
   14012de64:	vandpd 0x240d84(%rip),%xmm0,%xmm0        # 14036ebf0 <CSWTCH.3092+0x230>
   14012de6c:	vcomisd 0x240d54(%rip),%xmm0        # 14036ebc8 <CSWTCH.3092+0x208>
   14012de74:	sbb    $0xffffffffffffffff,%rax
   14012de78:	mov    %rax,0x1c8(%rsp)
   14012de80:	cmpb   $0x0,0x1040(%rbx)
   14012de87:	jne    140126a28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3448>
   14012de8d:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14012de92:	cmp    $0x1,%r12b
   14012de96:	je     14012f656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc076>
   14012de9c:	lea    0x8(%rsi),%r8
   14012dea0:	cmp    0x30(%rsp),%r8
   14012dea5:	jae    140132db9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7d9>
   14012deab:	mov    0x1d0(%rsp),%rax
   14012deb3:	mov    %rax,(%rsi)
   14012deb6:	mov    0x1c8(%rsp),%rax
   14012debe:	mov    %r8,%rsi
   14012dec1:	mov    %rax,0x1d0(%rsp)
   14012dec9:	mov    0x60(%rsp),%rax
   14012dece:	mov    %rax,0x680(%rsp)
   14012ded6:	lock addl $0x1,0x8(%rdi)
   14012dedb:	lea    0x680(%rsp),%rdx
   14012dee3:	lea    0x540(%rsp),%rcx
   14012deeb:	mov    %rdi,0x688(%rsp)
   14012def3:	call   14021df40 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012def8:	mov    0x540(%rsp),%rax
   14012df00:	mov    0x688(%rsp),%rcx
   14012df08:	mov    %rax,0x1c8(%rsp)
   14012df10:	test   %rcx,%rcx
   14012df13:	je     14012df1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa93a>
   14012df15:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012df1a:	mov    $0x2,%r12d
   14012df20:	jmp    140129e80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68a0>
   14012df25:	mov    %rax,%r8
   14012df28:	sub    %rdx,%r8
   14012df2b:	sar    $0x3,%r8
   14012df2f:	lea    (%r8,%r8,1),%r9
   14012df33:	cmp    %r9,%r8
   14012df36:	jae    14012553f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f5f>
   14012df3c:	sub    %rdx,%rsi
   14012df3f:	lea    0x1048(%rbx),%rcx
   14012df46:	mov    %r9,%rdx
   14012df49:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012df4e:	mov    0x1048(%rbx),%rdx
   14012df55:	mov    0x1050(%rbx),%rax
   14012df5c:	add    %rdx,%rsi
   14012df5f:	lea    0x10(%rsi),%rcx
   14012df63:	jmp    14012553f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f5f>
   14012df68:	lea    0x2b8(%rsp),%rcx
   14012df70:	vzeroupper
   14012df73:	call   14022b550 <setun::VMValue::as_float() const>
   14012df78:	lea    0x2c0(%rsp),%rcx
   14012df80:	vmovapd %xmm0,%xmm7
   14012df84:	call   14022b550 <setun::VMValue::as_float() const>
   14012df89:	vcomisd %xmm7,%xmm0
   14012df8d:	seta   %al
   14012df90:	jmp    140126b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3598>
   14012df95:	lea    0x2e8(%rsp),%rcx
   14012df9d:	vzeroupper
   14012dfa0:	call   14022b550 <setun::VMValue::as_float() const>
   14012dfa5:	lea    0x2f0(%rsp),%rcx
   14012dfad:	vmovapd %xmm0,%xmm7
   14012dfb1:	call   14022b550 <setun::VMValue::as_float() const>
   14012dfb6:	vcomisd %xmm0,%xmm7
   14012dfba:	setae  %al
   14012dfbd:	jmp    140127451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e71>
   14012dfc2:	lea    0x2c8(%rsp),%rcx
   14012dfca:	vzeroupper
   14012dfcd:	call   14022b550 <setun::VMValue::as_float() const>
   14012dfd2:	lea    0x2d0(%rsp),%rcx
   14012dfda:	vmovapd %xmm0,%xmm7
   14012dfde:	call   14022b550 <setun::VMValue::as_float() const>
   14012dfe3:	vcomisd %xmm7,%xmm0
   14012dfe7:	setae  %al
   14012dfea:	jmp    140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x370d>
   14012dfef:	lea    0x398(%rsp),%rcx
   14012dff7:	vzeroupper
   14012dffa:	call   14022b550 <setun::VMValue::as_float() const>
   14012dfff:	lea    0x3a0(%rsp),%rcx
   14012e007:	vmovapd %xmm0,%xmm7
   14012e00b:	call   14022b550 <setun::VMValue::as_float() const>
   14012e010:	vcomisd %xmm7,%xmm0
   14012e014:	setae  %al
   14012e017:	jmp    140128358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d78>
   14012e01c:	lea    0x298(%rsp),%rcx
   14012e024:	vzeroupper
   14012e027:	call   14022b550 <setun::VMValue::as_float() const>
   14012e02c:	lea    0x2a0(%rsp),%rcx
   14012e034:	vmovapd %xmm0,%xmm7
   14012e038:	call   14022b550 <setun::VMValue::as_float() const>
   14012e03d:	vmovsd 0x240b83(%rip),%xmm1        # 14036ebc8 <CSWTCH.3092+0x208>
   14012e045:	vsubsd %xmm0,%xmm7,%xmm0
   14012e049:	vandpd 0x240b9f(%rip),%xmm0,%xmm0        # 14036ebf0 <CSWTCH.3092+0x230>
   14012e051:	vcomisd %xmm0,%xmm1
   14012e055:	seta   %dil
   14012e059:	jmp    140126885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32a5>
   14012e05e:	lea    0x3a8(%rsp),%rcx
   14012e066:	vzeroupper
   14012e069:	call   14022b550 <setun::VMValue::as_float() const>
   14012e06e:	lea    0x3b0(%rsp),%rcx
   14012e076:	vmovapd %xmm0,%xmm7
   14012e07a:	call   14022b550 <setun::VMValue::as_float() const>
   14012e07f:	vmovsd 0x240b41(%rip),%xmm1        # 14036ebc8 <CSWTCH.3092+0x208>
   14012e087:	vsubsd %xmm0,%xmm7,%xmm0
   14012e08b:	vandpd 0x240b5d(%rip),%xmm0,%xmm0        # 14036ebf0 <CSWTCH.3092+0x230>
   14012e093:	vcomisd %xmm0,%xmm1
   14012e097:	seta   %dil
   14012e09b:	jmp    1401284b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ed4>
   14012e0a0:	lea    0x3b8(%rsp),%rcx
   14012e0a8:	vzeroupper
   14012e0ab:	call   14022b550 <setun::VMValue::as_float() const>
   14012e0b0:	lea    0x3c0(%rsp),%rcx
   14012e0b8:	vmovapd %xmm0,%xmm7
   14012e0bc:	call   14022b550 <setun::VMValue::as_float() const>
   14012e0c1:	vcomisd %xmm0,%xmm7
   14012e0c5:	seta   %al
   14012e0c8:	jmp    140128610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5030>
   14012e0cd:	lea    0x388(%rsp),%rcx
   14012e0d5:	vzeroupper
   14012e0d8:	call   14022b550 <setun::VMValue::as_float() const>
   14012e0dd:	lea    0x390(%rsp),%rcx
   14012e0e5:	vmovapd %xmm0,%xmm7
   14012e0e9:	call   14022b550 <setun::VMValue::as_float() const>
   14012e0ee:	vcomisd %xmm7,%xmm0
   14012e0f2:	seta   %al
   14012e0f5:	jmp    1401281fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1d>
   14012e0fa:	lea    0x2d8(%rsp),%rcx
   14012e102:	vzeroupper
   14012e105:	call   14022b550 <setun::VMValue::as_float() const>
   14012e10a:	lea    0x2e0(%rsp),%rcx
   14012e112:	vmovapd %xmm0,%xmm7
   14012e116:	call   14022b550 <setun::VMValue::as_float() const>
   14012e11b:	vcomisd %xmm0,%xmm7
   14012e11f:	seta   %al
   14012e122:	jmp    140126e62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3882>
   14012e127:	lea    0x3c8(%rsp),%rcx
   14012e12f:	vzeroupper
   14012e132:	call   14022b550 <setun::VMValue::as_float() const>
   14012e137:	lea    0x3d0(%rsp),%rcx
   14012e13f:	vmovapd %xmm0,%xmm7
   14012e143:	call   14022b550 <setun::VMValue::as_float() const>
   14012e148:	vcomisd %xmm0,%xmm7
   14012e14c:	setae  %al
   14012e14f:	jmp    14012876b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x518b>
   14012e154:	shr    $0x20,%rdx
   14012e158:	cmp    $0x1,%dx
   14012e15c:	je     14012fdb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7d5>
   14012e162:	cmp    $0x5,%dx
   14012e166:	jne    140128bd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55f5>
   14012e16c:	mov    0x40(%rsp),%rcx
   14012e171:	mov    %r8,0xa0(%rsp)
   14012e179:	call   140229aa0 <setun::VMValue::as_int() const>
   14012e17e:	jmp    140128bec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x560c>
   14012e183:	shr    $0x20,%rdx
   14012e187:	cmp    $0x1,%dx
   14012e18b:	je     1401302ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccce>
   14012e191:	cmp    $0x5,%dx
   14012e195:	jne    140128b65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5585>
   14012e19b:	mov    %r9,%rcx
   14012e19e:	call   140229aa0 <setun::VMValue::as_int() const>
   14012e1a3:	lea    0x440(%rsp),%r8
   14012e1ab:	movq   $0x0,0x448(%rsp)
   14012e1b7:	mov    %rax,0x440(%rsp)
   14012e1bf:	movq   $0x0,0x450(%rsp)
   14012e1cb:	jmp    140128b9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55ba>
   14012e1d0:	mov    0x40(%rsp),%rax
   14012e1d5:	mov    0x1070(%rbx),%r13
   14012e1dc:	lea    0x1068(%rbx),%rcx
   14012e1e3:	sub    0x1068(%rbx),%r13
   14012e1ea:	sar    $0x3,%r13
   14012e1ee:	lea    (%rax,%r13,1),%rdx
   14012e1f2:	vzeroupper
   14012e1f5:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e1fa:	jmp    14012a6b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d1>
   14012e1ff:	mov    %rax,%rcx
   14012e202:	sub    %rdx,%rcx
   14012e205:	sar    $0x3,%rcx
   14012e209:	lea    (%rcx,%rcx,1),%r9
   14012e20d:	cmp    %r9,%rcx
   14012e210:	jae    14012a200 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c20>
   14012e216:	sub    %rdx,%rsi
   14012e219:	lea    0x1048(%rbx),%rcx
   14012e220:	mov    %r9,%rdx
   14012e223:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e228:	mov    0x1048(%rbx),%rdx
   14012e22f:	mov    0x1050(%rbx),%rax
   14012e236:	add    %rdx,%rsi
   14012e239:	lea    0x8(%rsi),%r8
   14012e23d:	jmp    14012a200 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c20>
   14012e242:	vzeroupper
   14012e245:	lea    (%rdi,%rdi,1),%rdx
   14012e249:	lea    0x1048(%rbx),%rcx
   14012e250:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e255:	jmp    14012547a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e9a>
   14012e25a:	vzeroupper
   14012e25d:	lea    (%rdi,%rdi,1),%rdx
   14012e261:	lea    0x1048(%rbx),%rcx
   14012e268:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e26d:	jmp    1401252ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1cea>
   14012e272:	vzeroupper
   14012e275:	lea    (%rdi,%rdi,1),%rdx
   14012e279:	lea    0x1048(%rbx),%rcx
   14012e280:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e285:	jmp    140124f6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x198a>
   14012e28a:	vzeroupper
   14012e28d:	lea    (%rdi,%rdi,1),%rdx
   14012e291:	lea    0x1048(%rbx),%rcx
   14012e298:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e29d:	jmp    14012564e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x206e>
   14012e2a2:	vzeroupper
   14012e2a5:	lea    (%rdi,%rdi,1),%rdx
   14012e2a9:	lea    0x1048(%rbx),%rcx
   14012e2b0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2b5:	jmp    1401251f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c12>
   14012e2ba:	vzeroupper
   14012e2bd:	lea    (%rdi,%rdi,1),%rdx
   14012e2c1:	lea    0x1048(%rbx),%rcx
   14012e2c8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2cd:	jmp    1401253a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dc2>
   14012e2d2:	vzeroupper
   14012e2d5:	lea    (%rdi,%rdi,1),%rdx
   14012e2d9:	lea    0x1048(%rbx),%rcx
   14012e2e0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2e5:	jmp    140129107 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b27>
   14012e2ea:	vzeroupper
   14012e2ed:	lea    (%rdi,%rdi,1),%rdx
   14012e2f1:	lea    0x1048(%rbx),%rcx
   14012e2f8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2fd:	jmp    140129c83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66a3>
   14012e302:	lea    (%rsi,%rsi,1),%rdx
   14012e306:	lea    0x1048(%rbx),%rcx
   14012e30d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e312:	vmovdqa 0x240866(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   14012e31a:	mov    %r15,%rdx
   14012e31d:	mov    %rbx,%rcx
   14012e320:	mov    %rsi,0x1060(%rbx)
   14012e327:	movb   $0x0,0x153a0(%rbx)
   14012e32e:	vmovdqa %xmm0,0x15390(%rbx)
   14012e336:	call   140113df0 <setun::VM::handle_throw(setun::Chunk const&)>
   14012e33b:	vzeroupper
   14012e33e:	lea    (%rdi,%rdi,1),%rdx
   14012e342:	lea    0x1048(%rbx),%rcx
   14012e349:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e34e:	jmp    1401259ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23ce>
   14012e353:	vzeroupper
   14012e356:	lea    (%rdi,%rdi,1),%rdx
   14012e35a:	lea    0x1048(%rbx),%rcx
   14012e361:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e366:	jmp    1401297c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61e7>
   14012e36b:	vzeroupper
   14012e36e:	lea    (%rdi,%rdi,1),%rdx
   14012e372:	lea    0x1048(%rbx),%rcx
   14012e379:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e37e:	jmp    140125d0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x272e>
   14012e383:	lea    (%rsi,%rsi,1),%rdx
   14012e387:	lea    0x1048(%rbx),%rcx
   14012e38e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e393:	jmp    140127882 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42a2>
   14012e398:	mov    0x1048(%rbx),%rdx
   14012e39f:	lea    0x10(%rsi),%rcx
   14012e3a3:	cmp    0x30(%rsp),%rcx
   14012e3a8:	jae    1401343a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dc8>
   14012e3ae:	mov    0x1050(%rbx),%rax
   14012e3b5:	mov    0x1d0(%rsp),%r8
   14012e3bd:	mov    %r8,(%rsi)
   14012e3c0:	mov    0x1c8(%rsp),%r8
   14012e3c8:	mov    %r8,0x8(%rsi)
   14012e3cc:	jmp    14012785b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x427b>
   14012e3d1:	vzeroupper
   14012e3d4:	jmp    140129d5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x677b>
   14012e3d9:	xor    %r12d,%r12d
   14012e3dc:	shr    $0x20,%rax
   14012e3e0:	cmp    $0x2,%ax
   14012e3e4:	je     140130983 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3a3>
   14012e3ea:	cmp    $0x3,%ax
   14012e3ee:	je     140130b3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd55a>
   14012e3f4:	cmp    $0x1,%ax
   14012e3f8:	je     140131af8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe518>
   14012e3fe:	test   %ax,%ax
   14012e401:	jne    14012f4b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   14012e407:	movzwl 0x6(%r9),%edi
   14012e40c:	lea    0x23f734(%rip),%rdx        # 14036db47 <.rdata+0x4c7>
   14012e413:	shl    $0x5,%rdi
   14012e417:	add    0x30(%r15),%rdi
   14012e41b:	mov    %rdi,%rcx
   14012e41e:	vzeroupper
   14012e421:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012e426:	test   %al,%al
   14012e428:	jne    14012e441 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae61>
   14012e42a:	lea    0x23f712(%rip),%rdx        # 14036db43 <.rdata+0x4c3>
   14012e431:	mov    %rdi,%rcx
   14012e434:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012e439:	test   %al,%al
   14012e43b:	je     14012f4b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   14012e441:	test   %r12b,%r12b
   14012e444:	je     140133d94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107b4>
   14012e44a:	cmp    $0x1,%r12b
   14012e44e:	je     140135f72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12992>
   14012e454:	lea    0x8(%rsi),%r8
   14012e458:	cmp    0x30(%rsp),%r8
   14012e45d:	jae    1401381b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bd7>
   14012e463:	mov    0x1d0(%rsp),%rax
   14012e46b:	mov    %r8,0x40(%rsp)
   14012e470:	lea    0x680(%rsp),%rcx
   14012e478:	lea    0x3e0(%rsp),%rdx
   14012e480:	mov    %rax,(%rsi)
   14012e483:	mov    0x1c8(%rsp),%rax
   14012e48b:	mov    %rax,0x1d0(%rsp)
   14012e493:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012e498:	mov    0x688(%rsp),%rdx
   14012e4a0:	mov    0x40(%rsp),%rsi
   14012e4a5:	lea    0x540(%rsp),%rcx
   14012e4ad:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012e4b2:	mov    0x540(%rsp),%rax
   14012e4ba:	mov    0x680(%rsp),%rcx
   14012e4c2:	mov    %rax,0x1c8(%rsp)
   14012e4ca:	lea    0x690(%rsp),%rax
   14012e4d2:	cmp    %rax,%rcx
   14012e4d5:	je     14012e4e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf08>
   14012e4d7:	mov    0x690(%rsp),%rax
   14012e4df:	lea    0x1(%rax),%rdx
   14012e4e3:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012e4e8:	mov    $0x2,%r12d
   14012e4ee:	cmpb   $0x0,0x1040(%rbx)
   14012e4f5:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14012e4fb:	movzbl 0x2(%rbp),%eax
   14012e4ff:	lea    0x2a4b9a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012e506:	add    $0x3,%rbp
   14012e50a:	mov    (%rdi,%rax,8),%rax
   14012e50e:	jmp    *%rax
   14012e510:	cmp    $0x2,%r12b
   14012e514:	jne    14012f835 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc255>
   14012e51a:	mov    0x1048(%rbx),%rdx
   14012e521:	lea    0x10(%rsi),%rcx
   14012e525:	cmp    0x30(%rsp),%rcx
   14012e52a:	jae    1401355f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12019>
   14012e530:	mov    0x1d0(%rsp),%rax
   14012e538:	mov    %rax,(%rsi)
   14012e53b:	mov    0x1c8(%rsp),%rax
   14012e543:	mov    %rax,0x8(%rsi)
   14012e547:	mov    %rcx,%rsi
   14012e54a:	jmp    14012a756 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7176>
   14012e54f:	cmp    $0x1,%ax
   14012e553:	je     1401319b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3d6>
   14012e559:	cmp    $0x2,%ax
   14012e55d:	je     140132120 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb40>
   14012e563:	test   %r12b,%r12b
   14012e566:	je     140129f0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x692e>
   14012e56c:	cmp    $0x1,%r12b
   14012e570:	je     1401310a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdac3>
   14012e576:	lea    0x8(%rsi),%r8
   14012e57a:	cmp    0x30(%rsp),%r8
   14012e57f:	jae    1401358bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122dc>
   14012e585:	mov    0x1d0(%rsp),%rax
   14012e58d:	mov    %rax,(%rsi)
   14012e590:	mov    0x1c8(%rsp),%rax
   14012e598:	mov    %r8,%rsi
   14012e59b:	mov    %rax,0x1d0(%rsp)
   14012e5a3:	movabs $0xfff8000000000000,%rax
   14012e5ad:	mov    %rax,0x1c8(%rsp)
   14012e5b5:	mov    $0x2,%r12d
   14012e5bb:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14012e5c0:	movabs $0xfffa000000000001,%rax
   14012e5ca:	mov    $0x1,%r12d
   14012e5d0:	jmp    140128a17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5437>
   14012e5d5:	lea    0x0(%rbp,%rbp,1),%rdx
   14012e5da:	lea    0x1048(%rbx),%rcx
   14012e5e1:	vzeroupper
   14012e5e4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e5e9:	jmp    14012a7cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71ef>
   14012e5ee:	mov    0x1048(%rbx),%rdx
   14012e5f5:	lea    0x8(%rsi),%r8
   14012e5f9:	cmp    0x30(%rsp),%r8
   14012e5fe:	jae    1401350d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11af9>
   14012e604:	mov    0x1050(%rbx),%rax
   14012e60b:	vzeroupper
   14012e60e:	mov    0x1c8(%rsp),%rcx
   14012e616:	mov    %rcx,(%rsi)
   14012e619:	jmp    14012b4d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef2>
   14012e61e:	mov    0x1048(%rbx),%rdx
   14012e625:	lea    0x8(%rsi),%r8
   14012e629:	cmp    0x30(%rsp),%r8
   14012e62e:	jae    140136816 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13236>
   14012e634:	mov    0x1050(%rbx),%rax
   14012e63b:	vzeroupper
   14012e63e:	mov    0x1c8(%rsp),%rcx
   14012e646:	mov    %rcx,(%rsi)
   14012e649:	jmp    14012b73b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x815b>
   14012e64e:	mov    0x1048(%rbx),%rdx
   14012e655:	lea    0x8(%rsi),%r8
   14012e659:	cmp    0x30(%rsp),%r8
   14012e65e:	jae    140136115 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b35>
   14012e664:	mov    0x1050(%rbx),%rax
   14012e66b:	vzeroupper
   14012e66e:	mov    0x1c8(%rsp),%rcx
   14012e676:	mov    %rcx,(%rsi)
   14012e679:	jmp    14012a929 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7349>
   14012e67e:	mov    0x1048(%rbx),%rdx
   14012e685:	lea    0x8(%rsi),%r8
   14012e689:	cmp    0x30(%rsp),%r8
   14012e68e:	jae    1401362ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d0a>
   14012e694:	mov    0x1050(%rbx),%rax
   14012e69b:	vzeroupper
   14012e69e:	mov    0x1c8(%rsp),%rcx
   14012e6a6:	mov    %rcx,(%rsi)
   14012e6a9:	jmp    14012aa9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74bb>
   14012e6ae:	mov    0x1048(%rbx),%rdx
   14012e6b5:	lea    0x8(%rsi),%r8
   14012e6b9:	cmp    0x30(%rsp),%r8
   14012e6be:	jae    140135105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b25>
   14012e6c4:	mov    0x1050(%rbx),%rax
   14012e6cb:	vzeroupper
   14012e6ce:	mov    0x1c8(%rsp),%rcx
   14012e6d6:	mov    %rcx,(%rsi)
   14012e6d9:	jmp    14012a8bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72db>
   14012e6de:	mov    0x1048(%rbx),%rdx
   14012e6e5:	lea    0x8(%rsi),%r8
   14012e6e9:	cmp    0x30(%rsp),%r8
   14012e6ee:	jae    140135f46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12966>
   14012e6f4:	mov    0x1050(%rbx),%rax
   14012e6fb:	vzeroupper
   14012e6fe:	mov    0x1c8(%rsp),%rcx
   14012e706:	mov    %rcx,(%rsi)
   14012e709:	jmp    14012b0bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7adb>
   14012e70e:	mov    0x1048(%rbx),%rdx
   14012e715:	lea    0x8(%rsi),%r8
   14012e719:	cmp    0x30(%rsp),%r8
   14012e71e:	jae    140135ab3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124d3>
   14012e724:	mov    0x1050(%rbx),%rax
   14012e72b:	vzeroupper
   14012e72e:	mov    0x1c8(%rsp),%rcx
   14012e736:	mov    %rcx,(%rsi)
   14012e739:	jmp    14012af03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7923>
   14012e73e:	mov    0x1048(%rbx),%rdx
   14012e745:	lea    0x8(%rsi),%r8
   14012e749:	cmp    0x30(%rsp),%r8
   14012e74e:	jae    140135e83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128a3>
   14012e754:	mov    0x1050(%rbx),%rax
   14012e75b:	vzeroupper
   14012e75e:	mov    0x1c8(%rsp),%rcx
   14012e766:	mov    %rcx,(%rsi)
   14012e769:	jmp    14012bb6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x858d>
   14012e76e:	mov    0x1048(%rbx),%rdx
   14012e775:	lea    0x8(%rsi),%r8
   14012e779:	cmp    0x30(%rsp),%r8
   14012e77e:	jae    140135a87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124a7>
   14012e784:	mov    0x1050(%rbx),%rax
   14012e78b:	vzeroupper
   14012e78e:	mov    0x1c8(%rsp),%rcx
   14012e796:	mov    %rcx,(%rsi)
   14012e799:	jmp    14012ab09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7529>
   14012e79e:	mov    0x1048(%rbx),%rdx
   14012e7a5:	lea    0x8(%rsi),%r8
   14012e7a9:	cmp    0x30(%rsp),%r8
   14012e7ae:	jae    140135d62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12782>
   14012e7b4:	mov    0x1050(%rbx),%rax
   14012e7bb:	vzeroupper
   14012e7be:	mov    0x1c8(%rsp),%rcx
   14012e7c6:	mov    %rcx,(%rsi)
   14012e7c9:	jmp    14012b464 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e84>
   14012e7ce:	mov    0x1048(%rbx),%rdx
   14012e7d5:	lea    0x8(%rsi),%r8
   14012e7d9:	cmp    0x30(%rsp),%r8
   14012e7de:	jae    140135fb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129d1>
   14012e7e4:	mov    0x1050(%rbx),%rax
   14012e7eb:	vzeroupper
   14012e7ee:	mov    0x1c8(%rsp),%rcx
   14012e7f6:	mov    %rcx,(%rsi)
   14012e7f9:	jmp    14012afdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ff>
   14012e7fe:	mov    0x1048(%rbx),%rdx
   14012e805:	lea    0x8(%rsi),%r8
   14012e809:	cmp    0x30(%rsp),%r8
   14012e80e:	jae    1401360e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b09>
   14012e814:	mov    0x1050(%rbx),%rax
   14012e81b:	vzeroupper
   14012e81e:	mov    0x1c8(%rsp),%rcx
   14012e826:	mov    %rcx,(%rsi)
   14012e829:	jmp    14012b97f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x839f>
   14012e82e:	mov    0x1048(%rbx),%rdx
   14012e835:	lea    0x8(%rsi),%r8
   14012e839:	cmp    0x30(%rsp),%r8
   14012e83e:	jae    14013602d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a4d>
   14012e844:	mov    0x1050(%rbx),%rax
   14012e84b:	vzeroupper
   14012e84e:	mov    0x1c8(%rsp),%rcx
   14012e856:	mov    %rcx,(%rsi)
   14012e859:	jmp    14012ad5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x777d>
   14012e85e:	mov    0x1048(%rbx),%rdx
   14012e865:	lea    0x8(%rsi),%r8
   14012e869:	cmp    0x30(%rsp),%r8
   14012e86e:	jae    140136001 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a21>
   14012e874:	mov    0x1050(%rbx),%rax
   14012e87b:	vzeroupper
   14012e87e:	mov    0x1c8(%rsp),%rcx
   14012e886:	mov    %rcx,(%rsi)
   14012e889:	jmp    14012ac87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76a7>
   14012e88e:	mov    0x1048(%rbx),%rdx
   14012e895:	lea    0x8(%rsi),%r8
   14012e899:	cmp    0x30(%rsp),%r8
   14012e89e:	jae    1401363f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e10>
   14012e8a4:	mov    0x1050(%rbx),%rax
   14012e8ab:	vzeroupper
   14012e8ae:	mov    0x1c8(%rsp),%rcx
   14012e8b6:	mov    %rcx,(%rsi)
   14012e8b9:	jmp    14012ae2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x784d>
   14012e8be:	lea    0x8(%rsi),%r8
   14012e8c2:	cmp    0x30(%rsp),%r8
   14012e8c7:	jae    140135eaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128cf>
   14012e8cd:	mov    0x1c8(%rsp),%rdx
   14012e8d5:	mov    %rdx,(%rsi)
   14012e8d8:	mov    %r8,%rsi
   14012e8db:	jmp    14012b5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fc0>
   14012e8e0:	shr    $0x20,%rax
   14012e8e4:	test   %ax,%ax
   14012e8e7:	jne    140130ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd908>
   14012e8ed:	xor    %r12d,%r12d
   14012e8f0:	lea    0x540(%rsp),%rcx
   14012e8f8:	lea    0x330(%rsp),%rdx
   14012e900:	vzeroupper
   14012e903:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012e908:	lea    0x338(%rsp),%rcx
   14012e910:	call   140229aa0 <setun::VMValue::as_int() const>
   14012e915:	mov    %rax,%rdi
   14012e918:	test   %rax,%rax
   14012e91b:	js     140131cdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6fb>
   14012e921:	cmp    0x548(%rsp),%rdi
   14012e929:	jae    140131ce9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe709>
   14012e92f:	test   %r12b,%r12b
   14012e932:	je     140135b0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1252b>
   14012e938:	cmp    $0x1,%r12b
   14012e93c:	je     140137d6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1478a>
   14012e942:	lea    0x8(%rsi),%rax
   14012e946:	cmp    0x30(%rsp),%rax
   14012e94b:	jae    140137d1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1473c>
   14012e951:	mov    0x1d0(%rsp),%rax
   14012e959:	lea    0x690(%rsp),%r12
   14012e961:	mov    $0x1,%edx
   14012e966:	lea    0x680(%rsp),%rcx
   14012e96e:	mov    %rax,(%rsi)
   14012e971:	mov    0x1c8(%rsp),%rax
   14012e979:	mov    %rax,0x1d0(%rsp)
   14012e981:	mov    0x540(%rsp),%rax
   14012e989:	movsbl (%rax,%rdi,1),%r8d
   14012e98e:	mov    %r12,0x680(%rsp)
   14012e996:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012e99b:	lea    0x680(%rsp),%rdx
   14012e9a3:	lea    0x520(%rsp),%rcx
   14012e9ab:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012e9b0:	mov    0x520(%rsp),%rax
   14012e9b8:	mov    0x680(%rsp),%rcx
   14012e9c0:	mov    %rax,0x1c8(%rsp)
   14012e9c8:	cmp    %r12,%rcx
   14012e9cb:	je     14012e9de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3fe>
   14012e9cd:	mov    0x690(%rsp),%rax
   14012e9d5:	lea    0x1(%rax),%rdx
   14012e9d9:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012e9de:	add    $0x8,%rsi
   14012e9e2:	mov    $0x2,%r12d
   14012e9e8:	mov    0x540(%rsp),%rcx
   14012e9f0:	lea    0x550(%rsp),%rax
   14012e9f8:	cmp    %rax,%rcx
   14012e9fb:	je     140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   14012ea01:	mov    0x550(%rsp),%rax
   14012ea09:	lea    0x1(%rax),%rdx
   14012ea0d:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012ea12:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   14012ea17:	mov    0x1048(%rbx),%rdx
   14012ea1e:	lea    0x8(%rsi),%r8
   14012ea22:	cmp    0x30(%rsp),%r8
   14012ea27:	jae    140136967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13387>
   14012ea2d:	mov    0x1050(%rbx),%rax
   14012ea34:	vzeroupper
   14012ea37:	mov    0x1c8(%rsp),%rcx
   14012ea3f:	mov    %rcx,(%rsi)
   14012ea42:	jmp    14012bbdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85fb>
   14012ea47:	mov    0x1048(%rbx),%rdx
   14012ea4e:	lea    0x8(%rsi),%r8
   14012ea52:	cmp    0x30(%rsp),%r8
   14012ea57:	jae    1401369df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133ff>
   14012ea5d:	mov    0x1050(%rbx),%rax
   14012ea64:	vzeroupper
   14012ea67:	mov    0x1c8(%rsp),%rcx
   14012ea6f:	mov    %rcx,(%rsi)
   14012ea72:	jmp    14012aa05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7425>
   14012ea77:	mov    0x1048(%rbx),%rdx
   14012ea7e:	lea    0x8(%rsi),%r8
   14012ea82:	cmp    0x30(%rsp),%r8
   14012ea87:	jae    140135698 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120b8>
   14012ea8d:	mov    0x1050(%rbx),%rax
   14012ea94:	vzeroupper
   14012ea97:	mov    0x1c8(%rsp),%rcx
   14012ea9f:	mov    %rcx,(%rsi)
   14012eaa2:	jmp    14012adc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77e5>
   14012eaa7:	movb   $0xcc,-0x1(%rbp)
   14012eaab:	mov    %r11,%rcx
   14012eaae:	call   14022b550 <setun::VMValue::as_float() const>
   14012eab3:	mov    0x40(%rsp),%rcx
   14012eab8:	vmovapd %xmm0,%xmm7
   14012eabc:	call   14022b550 <setun::VMValue::as_float() const>
   14012eac1:	mov    0x60(%rsp),%rcx
   14012eac6:	vmovapd %xmm0,%xmm6
   14012eaca:	call   14022b550 <setun::VMValue::as_float() const>
   14012eacf:	mov    0x1068(%rbx),%rdx
   14012ead6:	movabs $0xfffc000000000000,%rax
   14012eae0:	vfmadd132sd %xmm6,%xmm0,%xmm7
   14012eae5:	vucomisd %xmm7,%xmm7
   14012eae9:	vmovq  %xmm7,%rcx
   14012eaee:	cmovnp %rcx,%rax
   14012eaf2:	mov    %rax,(%rdx,%rdi,8)
   14012eaf6:	jmp    14012dade <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4fe>
   14012eafb:	mov    0x1068(%rbx),%rdx
   14012eb02:	mov    0x1c8(%rsp),%rcx
   14012eb0a:	add    $0x8,%rsi
   14012eb0e:	mov    %rcx,(%rdx,%r13,8)
   14012eb12:	mov    0x1d0(%rsp),%rdx
   14012eb1a:	mov    %rdx,-0x8(%rsi)
   14012eb1e:	jmp    14012c7c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91e3>
   14012eb23:	mov    0x1048(%rbx),%rdx
   14012eb2a:	lea    0x8(%rsi),%r8
   14012eb2e:	cmp    0x30(%rsp),%r8
   14012eb33:	jae    140135937 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12357>
   14012eb39:	mov    0x1050(%rbx),%rax
   14012eb40:	vzeroupper
   14012eb43:	mov    0x1c8(%rsp),%rcx
   14012eb4b:	mov    %rcx,(%rsi)
   14012eb4e:	jmp    14012baff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x851f>
   14012eb53:	mov    0x1048(%rbx),%rdx
   14012eb5a:	lea    0x8(%rsi),%r8
   14012eb5e:	cmp    0x30(%rsp),%r8
   14012eb63:	jae    140136291 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cb1>
   14012eb69:	mov    0x1050(%rbx),%rax
   14012eb70:	vzeroupper
   14012eb73:	mov    0x1c8(%rsp),%rcx
   14012eb7b:	mov    %rcx,(%rsi)
   14012eb7e:	jmp    14012b83b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x825b>
   14012eb83:	mov    0x1048(%rbx),%rdx
   14012eb8a:	lea    0x8(%rsi),%r8
   14012eb8e:	cmp    0x30(%rsp),%r8
   14012eb93:	jae    1401364ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f1f>
   14012eb99:	mov    0x1050(%rbx),%rax
   14012eba0:	vzeroupper
   14012eba3:	mov    0x1c8(%rsp),%rcx
   14012ebab:	mov    %rcx,(%rsi)
   14012ebae:	jmp    14012b6cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80ed>
   14012ebb3:	mov    0x1048(%rbx),%rdx
   14012ebba:	lea    0x8(%rsi),%r8
   14012ebbe:	cmp    0x30(%rsp),%r8
   14012ebc3:	jae    14013586b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1228b>
   14012ebc9:	mov    0x1050(%rbx),%rax
   14012ebd0:	mov    0x1c8(%rsp),%rcx
   14012ebd8:	mov    %rcx,(%rsi)
   14012ebdb:	jmp    14012bc82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86a2>
   14012ebe0:	mov    0x1048(%rbx),%rdx
   14012ebe7:	lea    0x8(%rsi),%r8
   14012ebeb:	cmp    0x30(%rsp),%r8
   14012ebf0:	jae    140135f1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1293a>
   14012ebf6:	mov    0x1050(%rbx),%rax
   14012ebfd:	vzeroupper
   14012ec00:	mov    0x1c8(%rsp),%rcx
   14012ec08:	mov    %rcx,(%rsi)
   14012ec0b:	jmp    14012b8a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82c9>
   14012ec10:	mov    0x1048(%rbx),%rdx
   14012ec17:	lea    0x8(%rsi),%r8
   14012ec1b:	cmp    0x30(%rsp),%r8
   14012ec20:	jae    140136cd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136f4>
   14012ec26:	mov    0x1050(%rbx),%rax
   14012ec2d:	vzeroupper
   14012ec30:	mov    0x1c8(%rsp),%rcx
   14012ec38:	mov    %rcx,(%rsi)
   14012ec3b:	jmp    14012b9ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x840d>
   14012ec40:	mov    0x1048(%rbx),%rdx
   14012ec47:	lea    0x8(%rsi),%r8
   14012ec4b:	cmp    0x30(%rsp),%r8
   14012ec50:	jae    140135963 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12383>
   14012ec56:	mov    0x1050(%rbx),%rax
   14012ec5d:	vzeroupper
   14012ec60:	mov    0x1c8(%rsp),%rcx
   14012ec68:	mov    %rcx,(%rsi)
   14012ec6b:	jmp    14012b197 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bb7>
   14012ec70:	mov    0x1048(%rbx),%rdx
   14012ec77:	lea    0x8(%rsi),%r8
   14012ec7b:	cmp    0x30(%rsp),%r8
   14012ec80:	jae    140136ca8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136c8>
   14012ec86:	mov    0x1050(%rbx),%rax
   14012ec8d:	vzeroupper
   14012ec90:	mov    0x1c8(%rsp),%rcx
   14012ec98:	mov    %rcx,(%rsi)
   14012ec9b:	jmp    14012b2cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cef>
   14012eca0:	mov    0x1048(%rbx),%rdx
   14012eca7:	lea    0x8(%rsi),%r8
   14012ecab:	cmp    0x30(%rsp),%r8
   14012ecb0:	jae    140135e2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1284b>
   14012ecb6:	mov    0x1050(%rbx),%rax
   14012ecbd:	vzeroupper
   14012ecc0:	mov    0x1c8(%rsp),%rcx
   14012ecc8:	mov    %rcx,(%rsi)
   14012eccb:	jmp    14012a997 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73b7>
   14012ecd0:	mov    0x1048(%rbx),%rdx
   14012ecd7:	lea    0x8(%rsi),%r8
   14012ecdb:	cmp    0x30(%rsp),%r8
   14012ece0:	jae    1401361a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bc1>
   14012ece6:	mov    0x1050(%rbx),%rax
   14012eced:	vzeroupper
   14012ecf0:	mov    0x1c8(%rsp),%rcx
   14012ecf8:	mov    %rcx,(%rsi)
   14012ecfb:	jmp    14012ba91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84b1>
   14012ed00:	mov    0x1048(%rbx),%rdx
   14012ed07:	lea    0x8(%rsi),%r8
   14012ed0b:	cmp    0x30(%rsp),%r8
   14012ed10:	jae    14013598f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123af>
   14012ed16:	mov    0x1050(%rbx),%rax
   14012ed1d:	vzeroupper
   14012ed20:	mov    0x1c8(%rsp),%rcx
   14012ed28:	mov    %rcx,(%rsi)
   14012ed2b:	jmp    14012b1ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c1f>
   14012ed30:	mov    0x1048(%rbx),%rdx
   14012ed37:	lea    0x8(%rsi),%r8
   14012ed3b:	cmp    0x30(%rsp),%r8
   14012ed40:	jae    140136c7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1369c>
   14012ed46:	mov    0x1050(%rbx),%rax
   14012ed4d:	vzeroupper
   14012ed50:	mov    0x1c8(%rsp),%rcx
   14012ed58:	mov    %rcx,(%rsi)
   14012ed5b:	jmp    14012b7a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81c3>
   14012ed60:	mov    0x1048(%rbx),%rdx
   14012ed67:	lea    0x8(%rsi),%r8
   14012ed6b:	cmp    0x30(%rsp),%r8
   14012ed70:	jae    140135dff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1281f>
   14012ed76:	mov    0x1050(%rbx),%rax
   14012ed7d:	vzeroupper
   14012ed80:	mov    0x1c8(%rsp),%rcx
   14012ed88:	mov    %rcx,(%rsi)
   14012ed8b:	jmp    14012b129 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b49>
   14012ed90:	mov    0x1048(%rbx),%rdx
   14012ed97:	lea    0x8(%rsi),%r8
   14012ed9b:	cmp    0x30(%rsp),%r8
   14012eda0:	jae    140136d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13720>
   14012eda6:	mov    0x1050(%rbx),%rax
   14012edad:	vzeroupper
   14012edb0:	mov    0x1c8(%rsp),%rcx
   14012edb8:	mov    %rcx,(%rsi)
   14012edbb:	jmp    14012b911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8331>
   14012edc0:	mov    0x1048(%rbx),%rdx
   14012edc7:	lea    0x8(%rsi),%r8
   14012edcb:	cmp    0x30(%rsp),%r8
   14012edd0:	jae    1401369b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133d3>
   14012edd6:	mov    0x1050(%rbx),%rax
   14012eddd:	vzeroupper
   14012ede0:	mov    0x1c8(%rsp),%rcx
   14012ede8:	mov    %rcx,(%rsi)
   14012edeb:	jmp    14012b267 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c87>
   14012edf0:	mov    0x1048(%rbx),%rdx
   14012edf7:	lea    0x8(%rsi),%r8
   14012edfb:	cmp    0x30(%rsp),%r8
   14012ee00:	jae    140135adf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124ff>
   14012ee06:	mov    0x1050(%rbx),%rax
   14012ee0d:	vzeroupper
   14012ee10:	mov    0x1c8(%rsp),%rcx
   14012ee18:	mov    %rcx,(%rsi)
   14012ee1b:	jmp    14012ab77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7597>
   14012ee20:	mov    0x1048(%rbx),%rdx
   14012ee27:	lea    0x8(%rsi),%r8
   14012ee2b:	cmp    0x30(%rsp),%r8
   14012ee30:	jae    140136897 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132b7>
   14012ee36:	mov    0x1050(%rbx),%rax
   14012ee3d:	vzeroupper
   14012ee40:	mov    0x1c8(%rsp),%rcx
   14012ee48:	mov    %rcx,(%rsi)
   14012ee4b:	jmp    14012b540 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f60>
   14012ee50:	mov    0x1048(%rbx),%rdx
   14012ee57:	lea    0x8(%rsi),%r8
   14012ee5b:	cmp    0x30(%rsp),%r8
   14012ee60:	jae    140136c50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13670>
   14012ee66:	mov    0x1050(%rbx),%rax
   14012ee6d:	vzeroupper
   14012ee70:	mov    0x1c8(%rsp),%rcx
   14012ee78:	mov    %rcx,(%rsi)
   14012ee7b:	jmp    14012ac19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7639>
   14012ee80:	mov    0x1048(%rbx),%rdx
   14012ee87:	lea    0x8(%rsi),%r8
   14012ee8b:	cmp    0x30(%rsp),%r8
   14012ee90:	jae    14013686b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1328b>
   14012ee96:	mov    0x1050(%rbx),%rax
   14012ee9d:	vzeroupper
   14012eea0:	mov    0x1c8(%rsp),%rcx
   14012eea8:	mov    %rcx,(%rsi)
   14012eeab:	jmp    14012ae9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78bb>
   14012eeb0:	mov    0x1048(%rbx),%rdx
   14012eeb7:	lea    0x8(%rsi),%r8
   14012eebb:	cmp    0x30(%rsp),%r8
   14012eec0:	jae    140136175 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b95>
   14012eec6:	mov    0x1050(%rbx),%rax
   14012eecd:	vzeroupper
   14012eed0:	mov    0x1c8(%rsp),%rcx
   14012eed8:	mov    %rcx,(%rsi)
   14012eedb:	jmp    14012b04d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a6d>
   14012eee0:	mov    0x1048(%rbx),%rdx
   14012eee7:	lea    0x8(%rsi),%r8
   14012eeeb:	cmp    0x30(%rsp),%r8
   14012eef0:	jae    14013583f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1225f>
   14012eef6:	mov    0x1050(%rbx),%rax
   14012eefd:	vzeroupper
   14012ef00:	mov    0x1c8(%rsp),%rcx
   14012ef08:	mov    %rcx,(%rsi)
   14012ef0b:	jmp    14012acf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7715>
   14012ef10:	mov    0x1048(%rbx),%rdx
   14012ef17:	lea    0x8(%rsi),%r8
   14012ef1b:	cmp    0x30(%rsp),%r8
   14012ef20:	jae    140135e57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12877>
   14012ef26:	mov    0x1050(%rbx),%rax
   14012ef2d:	vzeroupper
   14012ef30:	mov    0x1c8(%rsp),%rcx
   14012ef38:	mov    %rcx,(%rsi)
   14012ef3b:	jmp    14012af71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7991>
   14012ef40:	mov    %rdx,%rcx
   14012ef43:	shr    $0x20,%rcx
   14012ef47:	cmp    $0x5,%cx
   14012ef4b:	jne    1401267ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x320f>
   14012ef51:	movabs $0xffff000000000000,%rcx
   14012ef5b:	movabs $0xfff8000000000000,%r9
   14012ef65:	and    %rax,%rcx
   14012ef68:	cmp    %r9,%rcx
   14012ef6b:	je     14012685e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x327e>
   14012ef71:	cmp    %r8,%rcx
   14012ef74:	jne    1401267ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x320f>
   14012ef7a:	mov    %rax,%rcx
   14012ef7d:	shr    $0x20,%rcx
   14012ef81:	cmp    $0x5,%cx
   14012ef85:	je     14012685e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x327e>
   14012ef8b:	mov    $0xffffffff,%ecx
   14012ef90:	shl    $0x20,%rcx
   14012ef94:	and    %rcx,%rdx
   14012ef97:	cmp    %r8,%rdx
   14012ef9a:	jne    14012c3e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e07>
   14012efa0:	lea    0x2a0(%rsp),%rdx
   14012efa8:	lea    0x680(%rsp),%rcx
   14012efb0:	vzeroupper
   14012efb3:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012efb8:	lea    0x540(%rsp),%rax
   14012efc0:	lea    0x298(%rsp),%rdx
   14012efc8:	mov    %rax,%rcx
   14012efcb:	mov    %rax,0x40(%rsp)
   14012efd0:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012efd5:	mov    0x40(%rsp),%rcx
   14012efda:	lea    0x680(%rsp),%rdx
   14012efe2:	call   1403417e0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14012efe7:	mov    0x540(%rsp),%rcx
   14012efef:	mov    %eax,%edi
   14012eff1:	lea    0x550(%rsp),%rax
   14012eff9:	cmp    %rax,%rcx
   14012effc:	je     14012f00f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba2f>
   14012effe:	mov    0x550(%rsp),%rax
   14012f006:	lea    0x1(%rax),%rdx
   14012f00a:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f00f:	mov    0x680(%rsp),%rcx
   14012f017:	lea    0x690(%rsp),%rax
   14012f01f:	cmp    %rax,%rcx
   14012f022:	je     140126885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32a5>
   14012f028:	mov    0x690(%rsp),%rax
   14012f030:	lea    0x1(%rax),%rdx
   14012f034:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f039:	jmp    140126885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32a5>
   14012f03e:	mov    %rdx,%rcx
   14012f041:	shr    $0x20,%rcx
   14012f045:	cmp    $0x5,%cx
   14012f049:	jne    140126dcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37ed>
   14012f04f:	movabs $0xffff000000000000,%rcx
   14012f059:	movabs $0xfff8000000000000,%r9
   14012f063:	and    %rax,%rcx
   14012f066:	cmp    %r9,%rcx
   14012f069:	je     140126e3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x385c>
   14012f06f:	cmp    %r8,%rcx
   14012f072:	jne    140126dcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37ed>
   14012f078:	mov    %rax,%rcx
   14012f07b:	shr    $0x20,%rcx
   14012f07f:	cmp    $0x5,%cx
   14012f083:	je     140126e3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x385c>
   14012f089:	mov    $0xffffffff,%ecx
   14012f08e:	shl    $0x20,%rcx
   14012f092:	and    %rcx,%rdx
   14012f095:	cmp    %r8,%rdx
   14012f098:	jne    14012d1ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c1f>
   14012f09e:	lea    0x680(%rsp),%rcx
   14012f0a6:	lea    0x2e0(%rsp),%rdx
   14012f0ae:	vzeroupper
   14012f0b1:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f0b6:	lea    0x2d8(%rsp),%rdx
   14012f0be:	lea    0x540(%rsp),%rcx
   14012f0c6:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f0cb:	mov    0x540(%rsp),%r14
   14012f0d3:	mov    0x688(%rsp),%r9
   14012f0db:	mov    0x680(%rsp),%r8
   14012f0e3:	mov    0x548(%rsp),%rdx
   14012f0eb:	mov    %r14,%rcx
   14012f0ee:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14012f0f3:	mov    %eax,%edi
   14012f0f5:	lea    0x550(%rsp),%rax
   14012f0fd:	cmp    %rax,%r14
   14012f100:	je     14012f116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb36>
   14012f102:	mov    0x550(%rsp),%rax
   14012f10a:	mov    %r14,%rcx
   14012f10d:	lea    0x1(%rax),%rdx
   14012f111:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f116:	mov    0x680(%rsp),%rcx
   14012f11e:	lea    0x690(%rsp),%rax
   14012f126:	cmp    %rax,%rcx
   14012f129:	je     14012f13c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb5c>
   14012f12b:	mov    0x690(%rsp),%rax
   14012f133:	lea    0x1(%rax),%rdx
   14012f137:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f13c:	test   %edi,%edi
   14012f13e:	setg   %al
   14012f141:	jmp    140126e62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3882>
   14012f146:	mov    %rdx,%rcx
   14012f149:	shr    $0x20,%rcx
   14012f14d:	cmp    $0x5,%cx
   14012f151:	jne    140126c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3678>
   14012f157:	movabs $0xffff000000000000,%rcx
   14012f161:	movabs $0xfff8000000000000,%r9
   14012f16b:	and    %rax,%rcx
   14012f16e:	cmp    %r9,%rcx
   14012f171:	je     140126cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e7>
   14012f177:	cmp    %r8,%rcx
   14012f17a:	jne    140126c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3678>
   14012f180:	mov    %rax,%rcx
   14012f183:	shr    $0x20,%rcx
   14012f187:	cmp    $0x5,%cx
   14012f18b:	je     140126cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e7>
   14012f191:	mov    $0xffffffff,%ecx
   14012f196:	shl    $0x20,%rcx
   14012f19a:	and    %rcx,%rdx
   14012f19d:	cmp    %r8,%rdx
   14012f1a0:	jne    14012c8a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92c6>
   14012f1a6:	lea    0x680(%rsp),%rcx
   14012f1ae:	lea    0x2d0(%rsp),%rdx
   14012f1b6:	vzeroupper
   14012f1b9:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f1be:	lea    0x2c8(%rsp),%rdx
   14012f1c6:	lea    0x540(%rsp),%rcx
   14012f1ce:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f1d3:	mov    0x540(%rsp),%r14
   14012f1db:	mov    0x688(%rsp),%r9
   14012f1e3:	mov    0x680(%rsp),%r8
   14012f1eb:	mov    0x548(%rsp),%rdx
   14012f1f3:	mov    %r14,%rcx
   14012f1f6:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14012f1fb:	mov    %eax,%edi
   14012f1fd:	lea    0x550(%rsp),%rax
   14012f205:	cmp    %rax,%r14
   14012f208:	je     14012f21e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc3e>
   14012f20a:	mov    0x550(%rsp),%rax
   14012f212:	mov    %r14,%rcx
   14012f215:	lea    0x1(%rax),%rdx
   14012f219:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f21e:	mov    0x680(%rsp),%rcx
   14012f226:	lea    0x690(%rsp),%rax
   14012f22e:	cmp    %rax,%rcx
   14012f231:	je     14012f244 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc64>
   14012f233:	mov    0x690(%rsp),%rax
   14012f23b:	lea    0x1(%rax),%rdx
   14012f23f:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f244:	test   %edi,%edi
   14012f246:	setle  %al
   14012f249:	jmp    140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x370d>
   14012f24e:	mov    %rdx,%rcx
   14012f251:	shr    $0x20,%rcx
   14012f255:	cmp    $0x5,%cx
   14012f259:	jne    140126ae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3503>
   14012f25f:	movabs $0xffff000000000000,%rcx
   14012f269:	movabs $0xfff8000000000000,%r9
   14012f273:	and    %rax,%rcx
   14012f276:	cmp    %r9,%rcx
   14012f279:	je     140126b52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3572>
   14012f27f:	cmp    %r8,%rcx
   14012f282:	jne    140126ae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3503>
   14012f288:	mov    %rax,%rcx
   14012f28b:	shr    $0x20,%rcx
   14012f28f:	cmp    $0x5,%cx
   14012f293:	je     140126b52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3572>
   14012f299:	mov    $0xffffffff,%ecx
   14012f29e:	shl    $0x20,%rcx
   14012f2a2:	and    %rcx,%rdx
   14012f2a5:	cmp    %r8,%rdx
   14012f2a8:	jne    14012c9c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93e7>
   14012f2ae:	lea    0x680(%rsp),%rcx
   14012f2b6:	lea    0x2c0(%rsp),%rdx
   14012f2be:	vzeroupper
   14012f2c1:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f2c6:	lea    0x2b8(%rsp),%rdx
   14012f2ce:	lea    0x540(%rsp),%rcx
   14012f2d6:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f2db:	mov    0x540(%rsp),%r14
   14012f2e3:	mov    0x688(%rsp),%r9
   14012f2eb:	mov    0x680(%rsp),%r8
   14012f2f3:	mov    0x548(%rsp),%rdx
   14012f2fb:	mov    %r14,%rcx
   14012f2fe:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14012f303:	mov    %eax,%edi
   14012f305:	lea    0x550(%rsp),%rax
   14012f30d:	cmp    %rax,%r14
   14012f310:	je     14012f326 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd46>
   14012f312:	mov    0x550(%rsp),%rax
   14012f31a:	mov    %r14,%rcx
   14012f31d:	lea    0x1(%rax),%rdx
   14012f321:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f326:	mov    0x680(%rsp),%rcx
   14012f32e:	lea    0x690(%rsp),%rax
   14012f336:	cmp    %rax,%rcx
   14012f339:	je     14012f34c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd6c>
   14012f33b:	mov    0x690(%rsp),%rax
   14012f343:	lea    0x1(%rax),%rdx
   14012f347:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f34c:	shr    $0x1f,%edi
   14012f34f:	mov    %edi,%eax
   14012f351:	jmp    140126b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3598>
   14012f356:	mov    %rdx,%rcx
   14012f359:	shr    $0x20,%rcx
   14012f35d:	cmp    $0x5,%cx
   14012f361:	jne    1401273bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ddc>
   14012f367:	movabs $0xffff000000000000,%rcx
   14012f371:	movabs $0xfff8000000000000,%r9
   14012f37b:	and    %rax,%rcx
   14012f37e:	cmp    %r9,%rcx
   14012f381:	je     14012742b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e4b>
   14012f387:	cmp    %r8,%rcx
   14012f38a:	jne    1401273bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ddc>
   14012f390:	mov    %rax,%rcx
   14012f393:	shr    $0x20,%rcx
   14012f397:	cmp    $0x5,%cx
   14012f39b:	je     14012742b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e4b>
   14012f3a1:	mov    $0xffffffff,%ecx
   14012f3a6:	shl    $0x20,%rcx
   14012f3aa:	and    %rcx,%rdx
   14012f3ad:	cmp    %r8,%rdx
   14012f3b0:	jne    14012cae6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9506>
   14012f3b6:	lea    0x680(%rsp),%rcx
   14012f3be:	lea    0x2f0(%rsp),%rdx
   14012f3c6:	vzeroupper
   14012f3c9:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f3ce:	lea    0x2e8(%rsp),%rdx
   14012f3d6:	lea    0x540(%rsp),%rcx
   14012f3de:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012f3e3:	mov    0x540(%rsp),%r14
   14012f3eb:	mov    0x688(%rsp),%r9
   14012f3f3:	mov    0x680(%rsp),%r8
   14012f3fb:	mov    0x548(%rsp),%rdx
   14012f403:	mov    %r14,%rcx
   14012f406:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14012f40b:	mov    %eax,%edi
   14012f40d:	lea    0x550(%rsp),%rax
   14012f415:	cmp    %rax,%r14
   14012f418:	je     14012f42e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe4e>
   14012f41a:	mov    0x550(%rsp),%rax
   14012f422:	mov    %r14,%rcx
   14012f425:	lea    0x1(%rax),%rdx
   14012f429:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f42e:	mov    0x680(%rsp),%rcx
   14012f436:	lea    0x690(%rsp),%rax
   14012f43e:	cmp    %rax,%rcx
   14012f441:	je     14012f454 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe74>
   14012f443:	mov    0x690(%rsp),%rax
   14012f44b:	lea    0x1(%rax),%rdx
   14012f44f:	call   14034a160 <operator delete(void*, unsigned long long)>
   14012f454:	mov    %edi,%eax
   14012f456:	not    %eax
   14012f458:	shr    $0x1f,%eax
   14012f45b:	jmp    140127451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e71>
   14012f460:	mov    0x1050(%rbx),%rax
   14012f467:	sub    %rdx,%rax
   14012f46a:	cmp    %r10,%rax
   14012f46d:	jb     1401336c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100e0>
   14012f473:	mov    %rdi,0x1060(%rbx)
   14012f47a:	cmp    %r9,0x68(%rcx)
   14012f47e:	jae    140134eb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118d7>
   14012f484:	mov    0x1060(%rbx),%rax
   14012f48b:	mov    0x1048(%rbx),%rdx
   14012f492:	add    0x38(%rsp),%r14
   14012f497:	lea    (%rdx,%rax,8),%rsi
   14012f49b:	cmpb   $0x0,0x1040(%rbx)
   14012f4a2:	jne    140124ae4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1504>
   14012f4a8:	vzeroupper
   14012f4ab:	jmp    14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   14012f4b0:	test   %r12b,%r12b
   14012f4b3:	je     140128820 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5240>
   14012f4b9:	cmp    $0x1,%r12b
   14012f4bd:	je     14012de1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa83a>
   14012f4c3:	lea    0x8(%rsi),%r8
   14012f4c7:	cmp    0x30(%rsp),%r8
   14012f4cc:	jae    140136210 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c30>
   14012f4d2:	mov    0x1d0(%rsp),%rax
   14012f4da:	mov    $0x2,%r12d
   14012f4e0:	mov    %rax,(%rsi)
   14012f4e3:	mov    0x1c8(%rsp),%rax
   14012f4eb:	mov    %r8,%rsi
   14012f4ee:	mov    %rax,0x1d0(%rsp)
   14012f4f6:	jmp    140128826 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5246>
   14012f4fb:	mov    0xb0(%r15),%rdx
   14012f502:	jmp    14012a676 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7096>
   14012f507:	lea    0x1d0(%rsp),%rax
   14012f50f:	cmp    $0x2,%r12b
   14012f513:	je     14012f525 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf45>
   14012f515:	lea    -0x8(%rsi),%rdx
   14012f519:	lea    -0x10(%rsi),%rax
   14012f51d:	cmp    $0x1,%r12b
   14012f521:	cmove  %rdx,%rax
   14012f525:	mov    (%rax),%rcx
   14012f528:	jmp    14012a48c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6eac>
   14012f52d:	mov    0x1c8(%rsp),%rax
   14012f535:	mov    $0x2,%r12d
   14012f53b:	mov    %rax,0x1d0(%rsp)
   14012f543:	mov    0x1080(%rbx),%rax
   14012f54a:	mov    (%rax,%rdi,8),%rax
   14012f54e:	mov    %rax,0x1c8(%rsp)
   14012f556:	jmp    1401270b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ad4>
   14012f55b:	mov    0x1c8(%rsp),%rax
   14012f563:	mov    $0x2,%r12d
   14012f569:	mov    %rax,0x1d0(%rsp)
   14012f571:	mov    0x1068(%rbx),%rax
   14012f578:	mov    (%rax,%rdi,8),%rax
   14012f57c:	mov    %rax,0x1c8(%rsp)
   14012f584:	jmp    140126fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39c6>
   14012f589:	mov    0x1c8(%rsp),%rax
   14012f591:	mov    $0x2,%r12d
   14012f597:	mov    %rax,0x1d0(%rsp)
   14012f59f:	mov    0x1068(%rbx),%rax
   14012f5a6:	mov    0x18(%rax,%r13,8),%rax
   14012f5ab:	mov    %rax,0x1c8(%rsp)
   14012f5b3:	jmp    14012a17c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b9c>
   14012f5b8:	cmp    $0x1,%r12b
   14012f5bc:	je     140132966 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf386>
   14012f5c2:	movzbl %r14b,%edx
   14012f5c6:	mov    $0x1,%eax
   14012f5cb:	sub    %rdx,%rax
   14012f5ce:	mov    (%rsi,%rax,8),%rcx
   14012f5d2:	jmp    14012a48c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6eac>
   14012f5d7:	mov    0x1c8(%rsp),%rax
   14012f5df:	mov    $0x2,%r12d
   14012f5e5:	mov    %rax,0x1d0(%rsp)
   14012f5ed:	jmp    140126f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x392b>
   14012f5f2:	mov    0x1c8(%rsp),%rax
   14012f5fa:	mov    $0x2,%r12d
   14012f600:	mov    %rax,0x1d0(%rsp)
   14012f608:	mov    0x1068(%rbx),%rax
   14012f60f:	mov    (%rax,%r13,8),%rax
   14012f613:	mov    %rax,0x1c8(%rsp)
   14012f61b:	jmp    14012a02b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4b>
   14012f620:	mov    0x1c8(%rsp),%rax
   14012f628:	test   %dil,%dil
   14012f62b:	mov    $0x2,%r12d
   14012f631:	movabs $0xfffa000000000001,%rdx
   14012f63b:	mov    %rax,0x1d0(%rsp)
   14012f643:	movabs $0xfffa000000000000,%rax
   14012f64d:	cmovne %rdx,%rax
   14012f651:	jmp    140128a17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5437>
   14012f656:	mov    0x1c8(%rsp),%rax
   14012f65e:	mov    %rax,0x1d0(%rsp)
   14012f666:	mov    0x60(%rsp),%rax
   14012f66b:	mov    %rax,0x680(%rsp)
   14012f673:	lock addl $0x1,0x8(%rdi)
   14012f678:	lea    0x680(%rsp),%rdx
   14012f680:	lea    0x540(%rsp),%rcx
   14012f688:	mov    %rdi,0x688(%rsp)
   14012f690:	call   14021df40 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012f695:	jmp    14012def8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa918>
   14012f69a:	vmovq  %rdi,%xmm0
   14012f69f:	mov    0x1c8(%rsp),%rax
   14012f6a7:	mov    $0x2,%r12d
   14012f6ad:	vucomisd %xmm0,%xmm0
   14012f6b1:	mov    %rax,0x1d0(%rsp)
   14012f6b9:	movabs $0xfffc000000000000,%rax
   14012f6c3:	cmovnp %rdi,%rax
   14012f6c7:	jmp    14012898a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53aa>
   14012f6cc:	mov    0x1c8(%rsp),%rax
   14012f6d4:	mov    $0x2,%r12d
   14012f6da:	mov    %rax,0x1d0(%rsp)
   14012f6e2:	mov    0x1068(%rbx),%rax
   14012f6e9:	mov    0x10(%rax,%r13,8),%rax
   14012f6ee:	mov    %rax,0x1c8(%rsp)
   14012f6f6:	jmp    14012a110 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b30>
   14012f6fb:	mov    0x1c8(%rsp),%rdx
   14012f703:	movzwl %di,%eax
   14012f706:	mov    $0x2,%r12d
   14012f70c:	mov    %rdx,0x1d0(%rsp)
   14012f714:	movabs $0xfff9000000000000,%rdx
   14012f71e:	or     %rdx,%rax
   14012f721:	jmp    1401272ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d0c>
   14012f726:	mov    0x1c8(%rsp),%rax
   14012f72e:	mov    $0x2,%r12d
   14012f734:	mov    %rax,0x1d0(%rsp)
   14012f73c:	mov    0x1068(%rbx),%rax
   14012f743:	mov    0x8(%rax,%r13,8),%rax
   14012f748:	mov    %rax,0x1c8(%rsp)
   14012f750:	jmp    14012a09e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6abe>
   14012f755:	vzeroupper
   14012f758:	jmp    14012a8dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72fd>
   14012f75d:	vzeroupper
   14012f760:	jmp    14012b0dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afd>
   14012f765:	vzeroupper
   14012f768:	jmp    14012b486 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ea6>
   14012f76d:	vzeroupper
   14012f770:	jmp    14012bb8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85af>
   14012f775:	vzeroupper
   14012f778:	jmp    14012b9a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83c1>
   14012f77d:	vzeroupper
   14012f780:	jmp    14012b4f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f14>
   14012f785:	vzeroupper
   14012f788:	jmp    14012a94b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x736b>
   14012f78d:	vzeroupper
   14012f790:	jmp    14012aabd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74dd>
   14012f795:	vzeroupper
   14012f798:	jmp    14012ab2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x754b>
   14012f79d:	vzeroupper
   14012f7a0:	jmp    14012af25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7945>
   14012f7a5:	vzeroupper
   14012f7a8:	jmp    14012aca9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76c9>
   14012f7ad:	vzeroupper
   14012f7b0:	jmp    14012b001 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a21>
   14012f7b5:	vzeroupper
   14012f7b8:	jmp    14012ae4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x786f>
   14012f7bd:	vzeroupper
   14012f7c0:	jmp    14012b85d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x827d>
   14012f7c5:	vzeroupper
   14012f7c8:	jmp    14012b2f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d11>
   14012f7cd:	vzeroupper
   14012f7d0:	jmp    14012b7c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81e5>
   14012f7d5:	vzeroupper
   14012f7d8:	jmp    14012b933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8353>
   14012f7dd:	vzeroupper
   14012f7e0:	jmp    14012bab3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84d3>
   14012f7e5:	vzeroupper
   14012f7e8:	jmp    14012ab99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75b9>
   14012f7ed:	vzeroupper
   14012f7f0:	jmp    14012b14b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b6b>
   14012f7f5:	vzeroupper
   14012f7f8:	jmp    14012a9b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73d9>
   14012f7fd:	vzeroupper
   14012f800:	jmp    14012b562 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f82>
   14012f805:	vzeroupper
   14012f808:	jmp    14012b06f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a8f>
   14012f80d:	vzeroupper
   14012f810:	jmp    14012ac3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x765b>
   14012f815:	vzeroupper
   14012f818:	jmp    14012af93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79b3>
   14012f81d:	vzeroupper
   14012f820:	jmp    14012b6ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x810f>
   14012f825:	vzeroupper
   14012f828:	jmp    14012bbfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x861d>
   14012f82d:	vzeroupper
   14012f830:	jmp    14012bb21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8541>
   14012f835:	cmp    $0x1,%r12b
   14012f839:	jne    14012a74f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x716f>
   14012f83f:	mov    0x1048(%rbx),%rdx
   14012f846:	lea    0x8(%rsi),%r8
   14012f84a:	cmp    0x30(%rsp),%r8
   14012f84f:	jae    14013531d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d3d>
   14012f855:	mov    0x1c8(%rsp),%rax
   14012f85d:	mov    %rax,(%rsi)
   14012f860:	mov    %r8,%rsi
   14012f863:	jmp    14012a756 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7176>
   14012f868:	cmp    %rax,%rdi
   14012f86b:	jge    1401320bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeadd>
   14012f871:	test   %rdi,%rdi
   14012f874:	setne  %al
   14012f877:	movabs $0xfffa000000000000,%rdx
   14012f881:	movzbl %al,%eax
   14012f884:	add    %rdx,%rax
   14012f887:	mov    %rax,0x1c8(%rsp)
   14012f88f:	jmp    14012d86e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa28e>
   14012f894:	cmp    %rax,%rdi
   14012f897:	jle    1401320e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb01>
   14012f89d:	test   %rdi,%rdi
   14012f8a0:	setne  %al
   14012f8a3:	movabs $0xfffa000000000000,%rdx
   14012f8ad:	movzbl %al,%eax
   14012f8b0:	add    %rdx,%rax
   14012f8b3:	mov    %rax,0x1c8(%rsp)
   14012f8bb:	jmp    14012d7ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1cd>
   14012f8c0:	mov    0x1c8(%rsp),%rax
   14012f8c8:	mov    %rdi,%rdx
   14012f8cb:	lea    0x680(%rsp),%rcx
   14012f8d3:	mov    $0x2,%r12d
   14012f8d9:	mov    %rax,0x1d0(%rsp)
   14012f8e1:	vzeroupper
   14012f8e4:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14012f8e9:	mov    0x680(%rsp),%rax
   14012f8f1:	mov    %rax,0x1c8(%rsp)
   14012f8f9:	jmp    1401242b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd3>
   14012f8fe:	mov    0x1c8(%rsp),%rax
   14012f906:	mov    %edi,0x690(%rsp)
   14012f90d:	lea    0x1a0(%rsp),%rdx
   14012f915:	lea    0x540(%rsp),%rcx
   14012f91d:	vmovdqa %xmm0,0x680(%rsp)
   14012f926:	mov    $0x2,%r12d
   14012f92c:	mov    %rax,0x1d0(%rsp)
   14012f934:	movl   $0x0,0x694(%rsp)
   14012f93f:	mov    0x690(%rsp),%rax
   14012f947:	vmovdqa %xmm0,0x1a0(%rsp)
   14012f950:	mov    %rax,0x1b0(%rsp)
   14012f958:	vzeroupper
   14012f95b:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012f960:	mov    0x540(%rsp),%rax
   14012f968:	mov    %rax,0x1c8(%rsp)
   14012f970:	jmp    140128909 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5329>
   14012f975:	lea    0x680(%rsp),%rcx
   14012f97d:	lea    0x308(%rsp),%rdx
   14012f985:	vzeroupper
   14012f988:	call   14022b350 <setun::VMValue::as_array() const>
   14012f98d:	mov    0x688(%rsp),%rax
   14012f995:	mov    0x680(%rsp),%rdi
   14012f99d:	mov    %rax,0x40(%rsp)
   14012f9a2:	test   %rdi,%rdi
   14012f9a5:	je     14012f9b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3d7>
   14012f9a7:	mov    %rdi,%rcx
   14012f9aa:	call   140152d30 <setun::ArrayObject::empty() const>
   14012f9af:	test   %al,%al
   14012f9b1:	je     140134aac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114cc>
   14012f9b7:	test   %r12b,%r12b
   14012f9ba:	je     1401320ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb0c>
   14012f9c0:	cmp    $0x1,%r12b
   14012f9c4:	je     140134a7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1149f>
   14012f9ca:	lea    0x8(%rsi),%r8
   14012f9ce:	cmp    0x30(%rsp),%r8
   14012f9d3:	jae    1401394d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15ef7>
   14012f9d9:	mov    0x1d0(%rsp),%rax
   14012f9e1:	mov    %rax,(%rsi)
   14012f9e4:	mov    0x1c8(%rsp),%rax
   14012f9ec:	mov    %r8,%rsi
   14012f9ef:	mov    %rax,0x1d0(%rsp)
   14012f9f7:	movabs $0xfff8000000000000,%rax
   14012fa01:	mov    %rax,0x1c8(%rsp)
   14012fa09:	mov    $0x2,%r12d
   14012fa0f:	mov    0x40(%rsp),%rax
   14012fa14:	test   %rax,%rax
   14012fa17:	je     140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14012fa1d:	mov    %rax,%rcx
   14012fa20:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012fa25:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14012fa2a:	movabs $0xfffa000000000000,%rcx
   14012fa34:	cmp    %rdx,%rax
   14012fa37:	movabs $0xfffa000000000001,%rax
   14012fa41:	cmove  %rax,%rcx
   14012fa45:	lea    -0x1(%rbp),%rdx
   14012fa49:	mov    %rcx,0x1c8(%rsp)
   14012fa51:	cmpb   $0x0,0x1520f(%rbx)
   14012fa58:	je     14012fa89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4a9>
   14012fa5a:	mov    0xe8(%r15),%rax
   14012fa61:	mov    0xf0(%r15),%rcx
   14012fa68:	sub    0x38(%rsp),%rdx
   14012fa6d:	sub    %rax,%rcx
   14012fa70:	cmp    %rcx,%rdx
   14012fa73:	jae    14012fa89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4a9>
   14012fa75:	add    %rdx,%rax
   14012fa78:	movzbl (%rax),%edi
   14012fa7b:	lea    0x1(%rdi),%edx
   14012fa7e:	mov    %dl,(%rax)
   14012fa80:	cmp    $0x7,%dl
   14012fa83:	jbe    14012fa89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4a9>
   14012fa85:	movb   $0xc1,-0x1(%rbp)
   14012fa89:	cmpb   $0x0,0x1040(%rbx)
   14012fa90:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012fa96:	movzbl 0x0(%rbp),%eax
   14012fa9a:	lea    0x2a35ff(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012faa1:	add    $0x1,%rbp
   14012faa5:	mov    (%rdi,%rax,8),%rax
   14012faa9:	jmp    *%rax
   14012faab:	mov    0x1070(%rbx),%rax
   14012fab2:	sub    0x1068(%rbx),%rax
   14012fab9:	sar    $0x3,%rax
   14012fabd:	mov    %rax,0xa0(%rsp)
   14012fac5:	lea    (%rcx,%rax,1),%rdx
   14012fac9:	lea    0x1068(%rbx),%rcx
   14012fad0:	vzeroupper
   14012fad3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fad8:	jmp    14012475f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117f>
   14012fadd:	shl    $0x10,%rax
   14012fae1:	shl    $0x10,%rdx
   14012fae5:	movabs $0xfffa000000000000,%rcx
   14012faef:	cmp    %rax,%rdx
   14012faf2:	lea    -0x1(%rbp),%rdx
   14012faf6:	movabs $0xfffa000000000001,%rax
   14012fb00:	cmovl  %rax,%rcx
   14012fb04:	mov    %rcx,0x1c8(%rsp)
   14012fb0c:	cmpb   $0x0,0x1520f(%rbx)
   14012fb13:	je     14012fb44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc564>
   14012fb15:	mov    0xe8(%r15),%rax
   14012fb1c:	mov    0xf0(%r15),%rcx
   14012fb23:	sub    0x38(%rsp),%rdx
   14012fb28:	sub    %rax,%rcx
   14012fb2b:	cmp    %rcx,%rdx
   14012fb2e:	jae    14012fb44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc564>
   14012fb30:	add    %rdx,%rax
   14012fb33:	movzbl (%rax),%edi
   14012fb36:	lea    0x1(%rdi),%edx
   14012fb39:	mov    %dl,(%rax)
   14012fb3b:	cmp    $0x7,%dl
   14012fb3e:	jbe    14012fb44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc564>
   14012fb40:	movb   $0xbf,-0x1(%rbp)
   14012fb44:	cmpb   $0x0,0x1040(%rbx)
   14012fb4b:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012fb51:	movzbl 0x0(%rbp),%eax
   14012fb55:	lea    0x2a3544(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fb5c:	add    $0x1,%rbp
   14012fb60:	mov    (%rdi,%rax,8),%rax
   14012fb64:	jmp    *%rax
   14012fb66:	mov    0x348(%rsp),%rax
   14012fb6e:	and    %r8,%rax
   14012fb71:	mov    %rax,0x40(%rsp)
   14012fb76:	mov    %rax,%rdi
   14012fb79:	movabs $0xfff8000000000000,%rax
   14012fb83:	cmp    %rax,%rdi
   14012fb86:	jne    14012fd1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc73e>
   14012fb8c:	lea    0x350(%rsp),%r9
   14012fb94:	mov    %rdx,0x350(%rsp)
   14012fb9c:	mov    %rdx,0x80(%rsp)
   14012fba4:	mov    %r9,%rcx
   14012fba7:	mov    %r9,0x60(%rsp)
   14012fbac:	vzeroupper
   14012fbaf:	call   14022b1c0 <setun::VMValue::payload() const>
   14012fbb4:	mov    0x60(%rsp),%r9
   14012fbb9:	mov    0x80(%rsp),%rdx
   14012fbc1:	mov    0x58(%rax),%rdi
   14012fbc5:	test   %rdi,%rdi
   14012fbc8:	je     14012fd29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc749>
   14012fbce:	mov    0x348(%rsp),%r14
   14012fbd6:	shl    $0x10,%r14
   14012fbda:	sar    $0x10,%r14
   14012fbde:	js     14012fd29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc749>
   14012fbe4:	mov    %rdi,%rcx
   14012fbe7:	mov    %r9,0x80(%rsp)
   14012fbef:	mov    %rdx,0x60(%rsp)
   14012fbf4:	call   140152c50 <setun::ArrayObject::size() const>
   14012fbf9:	mov    0x60(%rsp),%rdx
   14012fbfe:	mov    0x80(%rsp),%r9
   14012fc06:	cmp    %rax,%r14
   14012fc09:	jae    14012fd29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc749>
   14012fc0f:	movzbl (%rdi),%eax
   14012fc12:	cmp    $0x3,%al
   14012fc14:	je     14013497d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1139d>
   14012fc1a:	ja     1401348fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1131a>
   14012fc20:	movabs $0xffff000000000000,%r8
   14012fc2a:	cmp    $0x1,%al
   14012fc2c:	je     1401347ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111da>
   14012fc32:	cmp    $0x2,%al
   14012fc34:	jne    140134788 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111a8>
   14012fc3a:	mov    0x340(%rsp),%rax
   14012fc42:	mov    $0xffff,%edx
   14012fc47:	mov    $0x1fff,%ecx
   14012fc4c:	shl    $0x30,%rdx
   14012fc50:	shl    $0x33,%rcx
   14012fc54:	and    %rax,%rdx
   14012fc57:	cmp    %rcx,%rdx
   14012fc5a:	je     140138a6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1548d>
   14012fc60:	lea    0x340(%rsp),%r8
   14012fc68:	mov    %r14,%rdx
   14012fc6b:	mov    %rdi,%rcx
   14012fc6e:	call   140156ab0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012fc73:	cmpb   $0x0,0x1040(%rbx)
   14012fc7a:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   14012fc80:	movzbl 0x0(%rbp),%eax
   14012fc84:	lea    0x2a3415(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fc8b:	add    $0x1,%rbp
   14012fc8f:	mov    (%rdi,%rax,8),%rax
   14012fc93:	jmp    *%rax
   14012fc95:	shl    $0x10,%rax
   14012fc99:	shl    $0x10,%rdx
   14012fc9d:	movabs $0xfffa000000000000,%rcx
   14012fca7:	cmp    %rax,%rdx
   14012fcaa:	lea    -0x1(%rbp),%rdx
   14012fcae:	movabs $0xfffa000000000001,%rax
   14012fcb8:	cmovge %rax,%rcx
   14012fcbc:	mov    %rcx,0x1c8(%rsp)
   14012fcc4:	cmpb   $0x0,0x1520f(%rbx)
   14012fccb:	je     14012fcfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc71c>
   14012fccd:	mov    0xe8(%r15),%rax
   14012fcd4:	mov    0xf0(%r15),%rcx
   14012fcdb:	sub    0x38(%rsp),%rdx
   14012fce0:	sub    %rax,%rcx
   14012fce3:	cmp    %rcx,%rdx
   14012fce6:	jae    14012fcfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc71c>
   14012fce8:	add    %rdx,%rax
   14012fceb:	movzbl (%rax),%edi
   14012fcee:	lea    0x1(%rdi),%edx
   14012fcf1:	mov    %dl,(%rax)
   14012fcf3:	cmp    $0x7,%dl
   14012fcf6:	jbe    14012fcfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc71c>
   14012fcf8:	movb   $0xcf,-0x1(%rbp)
   14012fcfc:	cmpb   $0x0,0x1040(%rbx)
   14012fd03:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   14012fd09:	movzbl 0x0(%rbp),%eax
   14012fd0d:	lea    0x2a338c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fd14:	add    $0x1,%rbp
   14012fd18:	mov    (%rdi,%rax,8),%rax
   14012fd1c:	jmp    *%rax
   14012fd1e:	lea    0x350(%rsp),%r9
   14012fd26:	vzeroupper
   14012fd29:	mov    %r9,%rcx
   14012fd2c:	mov    %rdx,0x350(%rsp)
   14012fd34:	call   14022b1c0 <setun::VMValue::payload() const>
   14012fd39:	mov    0x58(%rax),%rdi
   14012fd3d:	test   %rdi,%rdi
   14012fd40:	je     140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012fd46:	lea    0x348(%rsp),%rcx
   14012fd4e:	call   140229aa0 <setun::VMValue::as_int() const>
   14012fd53:	mov    %rax,%r14
   14012fd56:	test   %rax,%rax
   14012fd59:	js     140136445 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e65>
   14012fd5f:	mov    %rdi,%rcx
   14012fd62:	call   140152c50 <setun::ArrayObject::size() const>
   14012fd67:	cmp    %rax,%r14
   14012fd6a:	jae    140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012fd70:	lea    0x340(%rsp),%r8
   14012fd78:	mov    %r14,%rdx
   14012fd7b:	mov    %rdi,%rcx
   14012fd7e:	call   140156ab0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012fd83:	jmp    140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14012fd88:	lea    0x420(%rsp),%rax
   14012fd90:	mov    %rcx,%rdx
   14012fd93:	mov    %r9,0x80(%rsp)
   14012fd9b:	mov    %rax,%rcx
   14012fd9e:	mov    %rax,0x60(%rsp)
   14012fda3:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012fda8:	mov    0x80(%rsp),%r9
   14012fdb0:	jmp    140128b2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x554f>
   14012fdb5:	lea    0x460(%rsp),%rax
   14012fdbd:	mov    0x40(%rsp),%rdx
   14012fdc2:	mov    %r8,0xa0(%rsp)
   14012fdca:	mov    %rax,%rcx
   14012fdcd:	mov    %rax,0x80(%rsp)
   14012fdd5:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14012fdda:	mov    0xa0(%rsp),%r8
   14012fde2:	jmp    140128c24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5644>
   14012fde7:	mov    %rcx,0x3f8(%rsp)
   14012fdef:	lea    0x3f8(%rsp),%rcx
   14012fdf7:	vzeroupper
   14012fdfa:	call   14022b1c0 <setun::VMValue::payload() const>
   14012fdff:	mov    0x48(%rax),%rbp
   14012fe03:	test   %rbp,%rbp
   14012fe06:	je     14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   14012fe0c:	mov    0x38(%rbp),%rdx
   14012fe10:	test   %rdx,%rdx
   14012fe13:	je     14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   14012fe19:	mov    (%rdi),%eax
   14012fe1b:	cmp    %eax,(%rdx)
   14012fe1d:	jne    140136a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13457>
   14012fe23:	test   %eax,%eax
   14012fe25:	je     140136a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13457>
   14012fe2b:	mov    0x15268(%rbx),%r13
   14012fe32:	movzwl 0x8(%rdi),%eax
   14012fe36:	mov    0x1070(%rbx),%rdx
   14012fe3d:	sub    0x1068(%rbx),%rdx
   14012fe44:	add    %r13,%rax
   14012fe47:	sar    $0x3,%rdx
   14012fe4b:	mov    %rax,0x15268(%rbx)
   14012fe52:	add    $0x40,%rax
   14012fe56:	cmp    %rdx,%rax
   14012fe59:	jae    14013767d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1409d>
   14012fe5f:	test   %r14b,%r14b
   14012fe62:	jne    140136789 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131a9>
   14012fe68:	mov    0x1068(%rbx),%rax
   14012fe6f:	cmp    $0x1,%r12b
   14012fe73:	je     140138a52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15472>
   14012fe79:	cmp    $0x2,%r12b
   14012fe7d:	je     1401375c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fe8>
   14012fe83:	mov    -0x8(%rsi),%rdx
   14012fe87:	sub    $0x8,%rsi
   14012fe8b:	mov    %rdx,(%rax,%r13,8)
   14012fe8f:	mov    0x1048(%rbx),%rdx
   14012fe96:	mov    %rsi,%r8
   14012fe99:	mov    0x150c0(%rbx),%rax
   14012fea0:	mov    0x40(%rsp),%r11
   14012fea5:	sub    %rdx,%r8
   14012fea8:	movzwl 0x8(%rdi),%r10d
   14012fead:	mov    0x4(%rdi),%r9d
   14012feb1:	mov    %r8,%rbp
   14012feb4:	sub    0x38(%rsp),%r11
   14012feb9:	sar    $0x3,%rbp
   14012febd:	cmp    $0x7ff,%rax
   14012fec3:	ja     140139a97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b7>
   14012fec9:	lea    0x1(%rax),%rcx
   14012fecd:	lea    (%rax,%rax,4),%rax
   14012fed1:	mov    %rcx,0x150c0(%rbx)
   14012fed8:	mov    0x15270(%rbx),%rcx
   14012fedf:	mov    %r11,0x10c0(%rbx,%rax,8)
   14012fee7:	mov    %r13,0x10c8(%rbx,%rax,8)
   14012feef:	mov    %rbp,0x10d0(%rbx,%rax,8)
   14012fef7:	mov    %r10,0x10d8(%rbx,%rax,8)
   14012feff:	mov    %r9,0x10e0(%rbx,%rax,8)
   14012ff07:	mov    0x152a0(%rbx),%rax
   14012ff0e:	cmp    %rax,0x68(%rcx)
   14012ff12:	jae    140137582 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fa2>
   14012ff18:	mov    0x38(%rsp),%rax
   14012ff1d:	lea    (%rax,%r9,1),%r14
   14012ff21:	cmpb   $0x0,0x1040(%rbx)
   14012ff28:	je     14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   14012ff2e:	movzbl (%r14),%eax
   14012ff32:	lea    0x2a3167(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ff39:	lea    0x1(%r14),%rbp
   14012ff3d:	jmp    *(%rdi,%rax,8)
   14012ff40:	mov    0x60(%rsp),%rcx
   14012ff45:	call   140156cf0 <setun::ArrayObject::try_promote()>
   14012ff4a:	jmp    140129e20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6840>
   14012ff4f:	movzwl %r10w,%r8d
   14012ff53:	add    %r13,%r8
   14012ff56:	lea    (%rax,%r8,8),%r10
   14012ff5a:	and    (%r10),%rdx
   14012ff5d:	mov    %r10,0xc0(%rsp)
   14012ff65:	cmp    %rcx,%rdx
   14012ff68:	jne    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   14012ff6e:	movzwl %r9w,%edx
   14012ff72:	add    %r13,%rdx
   14012ff75:	lea    (%rax,%rdx,8),%rcx
   14012ff79:	movzwl %r11w,%edx
   14012ff7d:	add    %r13,%rdx
   14012ff80:	mov    %rcx,0xe0(%rsp)
   14012ff88:	lea    (%rax,%rdx,8),%r11
   14012ff8c:	movzwl 0x40(%rsp),%edx
   14012ff91:	mov    %r11,0x80(%rsp)
   14012ff99:	add    %r13,%rdx
   14012ff9c:	lea    (%rax,%rdx,8),%r10
   14012ffa0:	mov    (%rcx),%rdx
   14012ffa3:	mov    $0xffff,%eax
   14012ffa8:	shl    $0x30,%rax
   14012ffac:	mov    %r10,0x60(%rsp)
   14012ffb1:	and    %rax,%rdx
   14012ffb4:	mov    %rdx,%rcx
   14012ffb7:	mov    $0x1fff,%edx
   14012ffbc:	shl    $0x33,%rdx
   14012ffc0:	cmp    %rdx,%rcx
   14012ffc3:	jne    140139558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f78>
   14012ffc9:	mov    (%r10),%rdx
   14012ffcc:	and    %rax,%rdx
   14012ffcf:	cmp    %rcx,%rdx
   14012ffd2:	jne    140139558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f78>
   14012ffd8:	and    (%r11),%rax
   14012ffdb:	cmp    %rdx,%rax
   14012ffde:	jne    140139558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f78>
   14012ffe4:	mov    %rdi,%rcx
   14012ffe7:	vzeroupper
   14012ffea:	call   14022b1c0 <setun::VMValue::payload() const>
   14012ffef:	mov    0x58(%rax),%rcx
   14012fff3:	mov    %rcx,0x40(%rsp)
   14012fff8:	mov    0xc0(%rsp),%rcx
   140130000:	call   14022b1c0 <setun::VMValue::payload() const>
   140130005:	mov    0x40(%rsp),%rcx
   14013000a:	mov    0x58(%rax),%rdx
   14013000e:	test   %rcx,%rcx
   140130011:	je     14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140130017:	test   %rdx,%rdx
   14013001a:	je     14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140130020:	cmpb   $0x1,(%rcx)
   140130023:	jne    14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140130029:	cmpb   $0x1,(%rdx)
   14013002c:	jne    14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140130032:	mov    0xe0(%rsp),%rax
   14013003a:	mov    (%rax),%r9
   14013003d:	mov    %r9,%rax
   140130040:	mov    %r9,0x40(%rsp)
   140130045:	shl    $0x10,%rax
   140130049:	sar    $0x10,%rax
   14013004d:	mov    %rax,0x100(%rsp)
   140130055:	js     14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   14013005b:	mov    0x60(%rsp),%r10
   140130060:	mov    %rcx,0x40(%rsp)
   140130065:	mov    %rdx,0x120(%rsp)
   14013006d:	mov    (%r10),%r10
   140130070:	shl    $0x10,%r10
   140130074:	mov    %r10,%rax
   140130077:	sar    $0x10,%rax
   14013007b:	mov    %rax,0xa0(%rsp)
   140130083:	call   140152c50 <setun::ArrayObject::size() const>
   140130088:	cmp    %rax,0x100(%rsp)
   140130090:	jae    14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140130096:	cmpq   $0x0,0xa0(%rsp)
   14013009f:	js     14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   1401300a5:	mov    0x120(%rsp),%rcx
   1401300ad:	call   140152c50 <setun::ArrayObject::size() const>
   1401300b2:	mov    0xa0(%rsp),%r11
   1401300ba:	cmp    %rax,%r11
   1401300bd:	jae    14013537c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   1401300c3:	mov    0x80(%rsp),%rax
   1401300cb:	mov    0x120(%rsp),%rdx
   1401300d3:	mov    0x40(%rsp),%rcx
   1401300d8:	mov    (%rax),%rax
   1401300db:	mov    0x20(%rdx),%rdx
   1401300df:	mov    0x20(%rcx),%rcx
   1401300e3:	shl    $0x10,%rax
   1401300e7:	sar    $0x10,%rax
   1401300eb:	imul   (%rdx,%r11,8),%rax
   1401300f0:	mov    0x100(%rsp),%rdx
   1401300f8:	add    %rax,(%rcx,%rdx,8)
   1401300fc:	cmpb   $0x0,0x1040(%rbx)
   140130103:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140130109:	movzbl 0xa(%rbp),%eax
   14013010d:	lea    0x2a2f8c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130114:	add    $0xb,%rbp
   140130118:	mov    (%rdi,%rax,8),%rax
   14013011c:	jmp    *%rax
   14013011e:	xchg   %ax,%ax
   140130120:	mov    %rdx,0x328(%rsp)
   140130128:	lea    0x680(%rsp),%rcx
   140130130:	lea    0x328(%rsp),%rdx
   140130138:	vzeroupper
   14013013b:	call   14022b350 <setun::VMValue::as_array() const>
   140130140:	mov    0x680(%rsp),%rax
   140130148:	mov    0x688(%rsp),%r14
   140130150:	mov    %rax,0x40(%rsp)
   140130155:	test   %rax,%rax
   140130158:	je     140130186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcba6>
   14013015a:	lea    0x320(%rsp),%rcx
   140130162:	call   140229aa0 <setun::VMValue::as_int() const>
   140130167:	mov    %rax,%rdi
   14013016a:	test   %rax,%rax
   14013016d:	js     1401336e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10106>
   140130173:	mov    0x40(%rsp),%rcx
   140130178:	call   140152c50 <setun::ArrayObject::size() const>
   14013017d:	cmp    %rax,%rdi
   140130180:	jb     1401361f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c16>
   140130186:	test   %r14,%r14
   140130189:	je     140129fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14013018f:	mov    %r14,%rcx
   140130192:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140130197:	jmp    140129fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14013019c:	shl    $0x10,%rdx
   1401301a0:	shl    $0x10,%rax
   1401301a4:	movabs $0xfffa000000000000,%rcx
   1401301ae:	cmp    %rdx,%rax
   1401301b1:	lea    -0x1(%rbp),%rdx
   1401301b5:	movabs $0xfffa000000000001,%rax
   1401301bf:	cmovge %rax,%rcx
   1401301c3:	mov    %rcx,0x1c8(%rsp)
   1401301cb:	cmpb   $0x0,0x1520f(%rbx)
   1401301d2:	je     140130203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc23>
   1401301d4:	mov    0xe8(%r15),%rax
   1401301db:	mov    0xf0(%r15),%rcx
   1401301e2:	sub    0x38(%rsp),%rdx
   1401301e7:	sub    %rax,%rcx
   1401301ea:	cmp    %rcx,%rdx
   1401301ed:	jae    140130203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc23>
   1401301ef:	add    %rdx,%rax
   1401301f2:	movzbl (%rax),%edi
   1401301f5:	lea    0x1(%rdi),%edx
   1401301f8:	mov    %dl,(%rax)
   1401301fa:	cmp    $0x7,%dl
   1401301fd:	jbe    140130203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc23>
   1401301ff:	movb   $0xc0,-0x1(%rbp)
   140130203:	cmpb   $0x0,0x1040(%rbx)
   14013020a:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   140130210:	movzbl 0x0(%rbp),%eax
   140130214:	lea    0x2a2e85(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013021b:	add    $0x1,%rbp
   14013021f:	mov    (%rdi,%rax,8),%rax
   140130223:	jmp    *%rax
   140130225:	shl    $0x10,%rax
   140130229:	shl    $0x10,%rdx
   14013022d:	movabs $0xfffa000000000000,%rcx
   140130237:	cmp    %rax,%rdx
   14013023a:	lea    -0x1(%rbp),%rdx
   14013023e:	movabs $0xfffa000000000001,%rax
   140130248:	cmovg  %rax,%rcx
   14013024c:	mov    %rcx,0x1c8(%rsp)
   140130254:	cmpb   $0x0,0x1520f(%rbx)
   14013025b:	je     14013028c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccac>
   14013025d:	mov    0xe8(%r15),%rax
   140130264:	mov    0xf0(%r15),%rcx
   14013026b:	sub    0x38(%rsp),%rdx
   140130270:	sub    %rax,%rcx
   140130273:	cmp    %rcx,%rdx
   140130276:	jae    14013028c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccac>
   140130278:	add    %rdx,%rax
   14013027b:	movzbl (%rax),%edi
   14013027e:	lea    0x1(%rdi),%edx
   140130281:	mov    %dl,(%rax)
   140130283:	cmp    $0x7,%dl
   140130286:	jbe    14013028c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccac>
   140130288:	movb   $0xce,-0x1(%rbp)
   14013028c:	cmpb   $0x0,0x1040(%rbx)
   140130293:	je     14012a1dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bfc>
   140130299:	movzbl 0x0(%rbp),%eax
   14013029d:	lea    0x2a2dfc(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401302a4:	add    $0x1,%rbp
   1401302a8:	mov    (%rdi,%rax,8),%rax
   1401302ac:	jmp    *%rax
   1401302ae:	lea    0x440(%rsp),%r8
   1401302b6:	mov    %r9,%rdx
   1401302b9:	mov    %r8,%rcx
   1401302bc:	mov    %r8,0x80(%rsp)
   1401302c4:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401302c9:	mov    0x80(%rsp),%r8
   1401302d1:	jmp    140128b9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55ba>
   1401302d6:	vzeroupper
   1401302d9:	mov    %rbp,%r14
   1401302dc:	cmp    $0x2,%r12b
   1401302e0:	je     1401316e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe104>
   1401302e6:	mov    0x1048(%rbx),%rdx
   1401302ed:	jmp    14012a27a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c9a>
   1401302f2:	mov    %eax,0x60(%rsp)
   1401302f6:	lea    0x20(%rdi),%rdx
   1401302fa:	lea    0x1068(%rbx),%rcx
   140130301:	mov    %r9d,0x40(%rsp)
   140130306:	mov    %r8d,0x80(%rsp)
   14013030e:	vzeroupper
   140130311:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130316:	movzwl 0x40(%rsp),%edx
   14013031b:	mov    0x1068(%rbx),%rcx
   140130322:	add    %r13,%rdx
   140130325:	lea    (%rcx,%rdx,8),%r11
   140130329:	movzwl 0x80(%rsp),%edx
   140130331:	mov    (%r11),%r9
   140130334:	add    %r13,%rdx
   140130337:	lea    (%rcx,%rdx,8),%rax
   14013033b:	movabs $0xfff8000000000000,%rdx
   140130345:	mov    %rax,0x40(%rsp)
   14013034a:	movzwl 0x60(%rsp),%eax
   14013034f:	add    %r13,%rax
   140130352:	lea    (%rcx,%rax,8),%rax
   140130356:	mov    %rax,0x60(%rsp)
   14013035b:	movabs $0xffff000000000000,%rax
   140130365:	and    %r9,%rax
   140130368:	cmp    %rdx,%rax
   14013036b:	je     1401276b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40d2>
   140130371:	jmp    14012db5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa57c>
   140130376:	cs nopw 0x0(%rax,%rax,1)
   140130380:	lea    0x8(%rdi),%rdx
   140130384:	lea    0x48(%rdi),%rcx
   140130388:	mov    %rdx,0x15268(%rbx)
   14013038f:	mov    0x1070(%rbx),%rdx
   140130396:	sub    0x1068(%rbx),%rdx
   14013039d:	sar    $0x3,%rdx
   1401303a1:	cmp    %rdx,%rcx
   1401303a4:	jb     140127655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4075>
   1401303aa:	mov    %eax,0x60(%rsp)
   1401303ae:	add    %rdx,%rdx
   1401303b1:	lea    0x1068(%rbx),%rcx
   1401303b8:	mov    %r8d,0x80(%rsp)
   1401303c0:	mov    %r9d,0x40(%rsp)
   1401303c5:	vzeroupper
   1401303c8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401303cd:	mov    0x1070(%rbx),%rdx
   1401303d4:	sub    0x1068(%rbx),%rdx
   1401303db:	mov    0x80(%rsp),%r8d
   1401303e3:	mov    0x60(%rsp),%eax
   1401303e7:	sar    $0x3,%rdx
   1401303eb:	mov    0x40(%rsp),%r9d
   1401303f0:	jmp    140127655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4075>
   1401303f5:	nopl   (%rax)
   1401303f8:	mov    0x1048(%rbx),%rdx
   1401303ff:	vzeroupper
   140130402:	jmp    140125529 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f49>
   140130407:	cmp    $0x1,%r12b
   14013040b:	je     1401336fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1011e>
   140130411:	lea    0x10(%rsi),%rcx
   140130415:	cmp    0x30(%rsp),%rcx
   14013041a:	jae    140138ec0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x158e0>
   140130420:	mov    0x1d0(%rsp),%rdx
   140130428:	mov    %rdx,(%rsi)
   14013042b:	mov    0x1c8(%rsp),%rdx
   140130433:	mov    %rdx,0x8(%rsi)
   140130437:	mov    %rcx,%rsi
   14013043a:	movzwl %r9w,%edx
   14013043e:	movzwl %ax,%eax
   140130441:	add    %r13,%rdx
   140130444:	mov    (%rdi,%rdx,8),%rdx
   140130448:	mov    %rdx,0x1d0(%rsp)
   140130450:	jmp    140127530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f50>
   140130455:	cmp    $0x2,%r12b
   140130459:	je     140133051 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa71>
   14013045f:	mov    -0x8(%rsi),%rdx
   140130463:	sub    $0x8,%rsi
   140130467:	mov    %rdx,(%rax,%rdi,8)
   14013046b:	jmp    1401274de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3efe>
   140130470:	lea    0x20(%rdi),%rdx
   140130474:	lea    0x1068(%rbx),%rcx
   14013047b:	vzeroupper
   14013047e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130483:	jmp    1401274be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ede>
   140130488:	lea    0x20(%rdi),%rdx
   14013048c:	lea    0x1068(%rbx),%rcx
   140130493:	vzeroupper
   140130496:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013049b:	jmp    140126f53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3973>
   1401304a0:	mov    %r9d,0x60(%rsp)
   1401304a5:	lea    0x20(%r8),%rdx
   1401304a9:	lea    0x1068(%rbx),%rcx
   1401304b0:	mov    %r8,0x40(%rsp)
   1401304b5:	vzeroupper
   1401304b8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401304bd:	movzwl %di,%eax
   1401304c0:	mov    0x1068(%rbx),%rdx
   1401304c7:	add    %r13,%rax
   1401304ca:	mov    0x40(%rsp),%r8
   1401304cf:	mov    0x60(%rsp),%r9d
   1401304d4:	movabs $0xffff000000000000,%rcx
   1401304de:	lea    (%rdx,%rax,8),%r11
   1401304e2:	mov    (%r11),%rax
   1401304e5:	and    %rax,%rcx
   1401304e8:	mov    %rcx,%r10
   1401304eb:	movabs $0xfff8000000000000,%rcx
   1401304f5:	cmp    %rcx,%r10
   1401304f8:	je     14012798d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43ad>
   1401304fe:	movswq %r9w,%r9
   140130502:	jmp    14012dd6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78d>
   140130507:	nopw   0x0(%rax,%rax,1)
   140130510:	lea    0x8(%r8),%rax
   140130514:	mov    0x1070(%rbx),%rdx
   14013051b:	sub    0x1068(%rbx),%rdx
   140130522:	mov    %rax,0x15268(%rbx)
   140130529:	sar    $0x3,%rdx
   14013052d:	lea    0x48(%r8),%rax
   140130531:	cmp    %rdx,%rax
   140130534:	jb     140127950 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4370>
   14013053a:	mov    %r9d,0x60(%rsp)
   14013053f:	add    %rdx,%rdx
   140130542:	lea    0x1068(%rbx),%rcx
   140130549:	mov    %r8,0x40(%rsp)
   14013054e:	vzeroupper
   140130551:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130556:	mov    0x1070(%rbx),%rdx
   14013055d:	sub    0x1068(%rbx),%rdx
   140130564:	mov    0x60(%rsp),%r9d
   140130569:	mov    0x40(%rsp),%r8
   14013056e:	sar    $0x3,%rdx
   140130572:	jmp    140127950 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4370>
   140130577:	nopw   0x0(%rax,%rax,1)
   140130580:	lea    0x8(%rdi),%rdx
   140130584:	lea    0x48(%rdi),%rcx
   140130588:	mov    %rdx,0x15268(%rbx)
   14013058f:	mov    0x1070(%rbx),%rdx
   140130596:	sub    0x1068(%rbx),%rdx
   14013059d:	sar    $0x3,%rdx
   1401305a1:	cmp    %rdx,%rcx
   1401305a4:	jb     14012759c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3fbc>
   1401305aa:	mov    %eax,0x60(%rsp)
   1401305ae:	add    %rdx,%rdx
   1401305b1:	lea    0x1068(%rbx),%rcx
   1401305b8:	mov    %r9d,0x40(%rsp)
   1401305bd:	vzeroupper
   1401305c0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401305c5:	mov    0x1070(%rbx),%rdx
   1401305cc:	sub    0x1068(%rbx),%rdx
   1401305d3:	mov    0x60(%rsp),%eax
   1401305d7:	mov    0x40(%rsp),%r9d
   1401305dc:	sar    $0x3,%rdx
   1401305e0:	jmp    14012759c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3fbc>
   1401305e5:	nopl   (%rax)
   1401305e8:	lea    0x8(%rdi),%rax
   1401305ec:	mov    0x1070(%rbx),%rdx
   1401305f3:	sub    0x1068(%rbx),%rdx
   1401305fa:	mov    %rax,0x15268(%rbx)
   140130601:	sar    $0x3,%rdx
   140130605:	lea    0x48(%rdi),%rax
   140130609:	cmp    %rdx,%rax
   14013060c:	jb     1401274b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ed5>
   140130612:	add    %rdx,%rdx
   140130615:	lea    0x1068(%rbx),%rcx
   14013061c:	vzeroupper
   14013061f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130624:	jmp    1401274a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ec3>
   140130629:	nopl   0x0(%rax)
   140130630:	mov    %rbp,%r14
   140130633:	vzeroupper
   140130636:	jmp    1401302dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccfc>
   14013063b:	cmp    $0x2,%r12b
   14013063f:	je     140133d2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1074e>
   140130645:	sub    $0x8,%rsi
   140130649:	jmp    140126ea9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38c9>
   14013064e:	lea    0x20(%rdi),%rdx
   140130652:	lea    0x1068(%rbx),%rcx
   140130659:	mov    %r8d,0x60(%rsp)
   14013065e:	mov    %r9d,0x80(%rsp)
   140130666:	mov    %eax,0x40(%rsp)
   14013066a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013066f:	movzwl 0x60(%rsp),%r8d
   140130675:	movzwl 0x40(%rsp),%eax
   14013067a:	movzwl 0x80(%rsp),%ecx
   140130682:	mov    0x1068(%rbx),%rdx
   140130689:	add    %r13,%r8
   14013068c:	add    %r13,%rcx
   14013068f:	lea    (%rdx,%r8,8),%r9
   140130693:	lea    (%rdx,%rcx,8),%rcx
   140130697:	jmp    140128aa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54c6>
   14013069c:	cmp    $0x2,%r12b
   1401306a0:	je     1401306d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f8>
   1401306a2:	mov    -0x8(%rsi),%rdx
   1401306a6:	lea    -0x8(%rsi),%rax
   1401306aa:	mov    %rdx,0x340(%rsp)
   1401306b2:	cmp    $0x1,%r12b
   1401306b6:	je     1401306fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd11b>
   1401306b8:	mov    -0x8(%rax),%rdx
   1401306bc:	sub    $0x18,%rsi
   1401306c0:	mov    %rdx,0x348(%rsp)
   1401306c8:	mov    -0x10(%rax),%rdx
   1401306cc:	jmp    140127ddf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47ff>
   1401306d1:	nopl   0x0(%rax)
   1401306d8:	mov    0x1c8(%rsp),%rax
   1401306e0:	mov    %rax,0x340(%rsp)
   1401306e8:	mov    0x1d0(%rsp),%rax
   1401306f0:	mov    %rax,0x1c8(%rsp)
   1401306f8:	mov    %rsi,%rax
   1401306fb:	mov    0x1c8(%rsp),%rdx
   140130703:	lea    -0x8(%rax),%rsi
   140130707:	xor    %r12d,%r12d
   14013070a:	mov    %rdx,0x348(%rsp)
   140130712:	mov    -0x8(%rax),%rdx
   140130716:	jmp    140127ddf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47ff>
   14013071b:	cmp    $0x1,%r12b
   14013071f:	je     14013392b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1034b>
   140130725:	mov    -0x8(%rsi),%rax
   140130729:	mov    $0x1,%r12d
   14013072f:	sub    $0x10,%rsi
   140130733:	mov    %rax,0x250(%rsp)
   14013073b:	mov    (%rsi),%rax
   14013073e:	mov    %rax,0x248(%rsp)
   140130746:	lea    0x250(%rsp),%rdx
   14013074e:	lea    0x248(%rsp),%rcx
   140130756:	vzeroupper
   140130759:	call   14022ab50 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   14013075e:	mov    %rax,0x1c8(%rsp)
   140130766:	cmpb   $0x0,0x1040(%rbx)
   14013076d:	jne    1401261d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bf6>
   140130773:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140130778:	nopl   0x0(%rax,%rax,1)
   140130780:	mov    %rdx,0x40(%rsp)
   140130785:	lea    0x1d0(%rsp),%rcx
   14013078d:	vzeroupper
   140130790:	call   14022b1c0 <setun::VMValue::payload() const>
   140130795:	mov    0x40(%rsp),%rdx
   14013079a:	mov    0x48(%rax),%rax
   14013079e:	test   %rax,%rax
   1401307a1:	je     14012d5ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fee>
   1401307a7:	mov    0x38(%rax),%r8
   1401307ab:	test   %r8,%r8
   1401307ae:	je     14012d5ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fee>
   1401307b4:	mov    (%rdi),%ecx
   1401307b6:	cmp    %ecx,(%r8)
   1401307b9:	jne    14012d5ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fee>
   1401307bf:	test   %ecx,%ecx
   1401307c1:	je     14012d5ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fee>
   1401307c7:	mov    0x48(%rax),%rcx
   1401307cb:	mov    0x50(%rax),%rax
   1401307cf:	movzwl 0x4(%rdi),%r8d
   1401307d4:	sub    %rcx,%rax
   1401307d7:	sar    $0x3,%rax
   1401307db:	cmp    %rax,%r8
   1401307de:	jae    14012d5ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fee>
   1401307e4:	mov    0x1c8(%rsp),%rax
   1401307ec:	mov    %rax,(%rcx,%r8,8)
   1401307f0:	cmpb   $0x0,0x1040(%rbx)
   1401307f7:	je     1401302e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd06>
   1401307fd:	movzbl 0x2(%rbp),%eax
   140130801:	lea    0x2a2898(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130808:	add    $0x3,%rbp
   14013080c:	xor    %r12d,%r12d
   14013080f:	mov    (%rdi,%rax,8),%rax
   140130813:	jmp    *%rax
   140130815:	lea    0x8(%rdi),%rdx
   140130819:	lea    0x48(%rdi),%rcx
   14013081d:	mov    %rdx,0x15268(%rbx)
   140130824:	mov    0x1070(%rbx),%rdx
   14013082b:	sub    0x1068(%rbx),%rdx
   140130832:	sar    $0x3,%rdx
   140130836:	cmp    %rdx,%rcx
   140130839:	jae    140134d0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1172f>
   14013083f:	vzeroupper
   140130842:	jmp    140128a7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x549d>
   140130847:	cmp    $0x1,%r12b
   14013084b:	je     14013454c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f6c>
   140130851:	mov    -0x8(%rsi),%rax
   140130855:	mov    $0x1,%r12d
   14013085b:	sub    $0x10,%rsi
   14013085f:	mov    %rax,0x270(%rsp)
   140130867:	mov    (%rsi),%rax
   14013086a:	mov    %rax,0x268(%rsp)
   140130872:	lea    0x270(%rsp),%rdx
   14013087a:	lea    0x268(%rsp),%rcx
   140130882:	vzeroupper
   140130885:	call   1402295a0 <setun::VMValue::shr(setun::VMValue const&) const>
   14013088a:	mov    %rax,0x1c8(%rsp)
   140130892:	cmpb   $0x0,0x1040(%rbx)
   140130899:	jne    1401262ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d0e>
   14013089f:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   1401308a4:	nopl   0x0(%rax)
   1401308a8:	cmp    $0x1,%r12b
   1401308ac:	je     140134275 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c95>
   1401308b2:	mov    -0x8(%rsi),%rax
   1401308b6:	mov    $0x1,%r12d
   1401308bc:	sub    $0x10,%rsi
   1401308c0:	mov    %rax,0x260(%rsp)
   1401308c8:	mov    (%rsi),%rax
   1401308cb:	mov    %rax,0x258(%rsp)
   1401308d3:	lea    0x260(%rsp),%rdx
   1401308db:	lea    0x258(%rsp),%rcx
   1401308e3:	vzeroupper
   1401308e6:	call   140229380 <setun::VMValue::shl(setun::VMValue const&) const>
   1401308eb:	mov    %rax,0x1c8(%rsp)
   1401308f3:	cmpb   $0x0,0x1040(%rbx)
   1401308fa:	jne    140126262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c82>
   140130900:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140130905:	nopl   (%rax)
   140130908:	cmp    $0x2,%r12b
   14013090c:	je     140130940 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd360>
   14013090e:	mov    -0x8(%rsi),%rdx
   140130912:	lea    -0x8(%rsi),%rax
   140130916:	mov    %rdx,0x318(%rsp)
   14013091e:	cmp    $0x1,%r12b
   140130922:	je     140130963 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd383>
   140130924:	mov    -0x8(%rax),%rdx
   140130928:	sub    $0x18,%rsi
   14013092c:	mov    %rdx,0x320(%rsp)
   140130934:	mov    -0x10(%rax),%rdx
   140130938:	jmp    140129f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69b6>
   14013093d:	nopl   (%rax)
   140130940:	mov    0x1c8(%rsp),%rax
   140130948:	mov    %rax,0x318(%rsp)
   140130950:	mov    0x1d0(%rsp),%rax
   140130958:	mov    %rax,0x1c8(%rsp)
   140130960:	mov    %rsi,%rax
   140130963:	mov    0x1c8(%rsp),%rdx
   14013096b:	lea    -0x8(%rax),%rsi
   14013096f:	xor    %r12d,%r12d
   140130972:	mov    %rdx,0x320(%rsp)
   14013097a:	mov    -0x8(%rax),%rdx
   14013097e:	jmp    140129f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69b6>
   140130983:	mov    %r9,0x40(%rsp)
   140130988:	lea    0x3e0(%rsp),%rcx
   140130990:	vzeroupper
   140130993:	call   14022b1c0 <setun::VMValue::payload() const>
   140130998:	mov    0x48(%rax),%rdi
   14013099c:	test   %rdi,%rdi
   14013099f:	je     14012f4b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   1401309a5:	mov    0x40(%rsp),%r9
   1401309aa:	lea    0x23d192(%rip),%rdx        # 14036db43 <.rdata+0x4c3>
   1401309b1:	movzwl 0x6(%r9),%eax
   1401309b6:	mov    %r9,0x60(%rsp)
   1401309bb:	shl    $0x5,%rax
   1401309bf:	add    0x30(%r15),%rax
   1401309c3:	mov    %rax,%rcx
   1401309c6:	mov    %rax,0x40(%rsp)
   1401309cb:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401309d0:	test   %al,%al
   1401309d2:	jne    1401328c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2e7>
   1401309d8:	mov    0x40(%rsp),%rcx
   1401309dd:	lea    0x23d163(%rip),%rdx        # 14036db47 <.rdata+0x4c7>
   1401309e4:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401309e9:	test   %al,%al
   1401309eb:	jne    1401328c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2e7>
   1401309f1:	mov    0x38(%rdi),%rax
   1401309f5:	test   %rax,%rax
   1401309f8:	je     14013575c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1217c>
   1401309fe:	mov    0x40(%rsp),%r8
   140130a03:	lea    0x28(%rax),%rdx
   140130a07:	lea    0x680(%rsp),%rcx
   140130a0f:	call   1402316e0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140130a14:	mov    0x680(%rsp),%rax
   140130a1c:	test   %rax,%rax
   140130a1f:	je     14013575c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1217c>
   140130a25:	mov    (%rax),%rax
   140130a28:	test   %rax,%rax
   140130a2b:	je     14013575c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1217c>
   140130a31:	movzwl 0x28(%rax),%r11d
   140130a36:	mov    0x50(%rdi),%rdx
   140130a3a:	mov    0x48(%rdi),%rax
   140130a3e:	sub    %rax,%rdx
   140130a41:	sar    $0x3,%rdx
   140130a45:	cmp    %rdx,%r11
   140130a48:	jae    14013575c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1217c>
   140130a4e:	mov    0x38(%rdi),%rdx
   140130a52:	mov    0x60(%rsp),%r9
   140130a57:	mov    (%rdx),%edx
   140130a59:	mov    %r11w,0x4(%r9)
   140130a5e:	mov    %edx,(%r9)
   140130a61:	test   %r12b,%r12b
   140130a64:	jne    1401379f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14417>
   140130a6a:	mov    (%rax,%r11,8),%rax
   140130a6e:	mov    $0x1,%r12d
   140130a74:	mov    %rax,0x1c8(%rsp)
   140130a7c:	cmpb   $0x0,0x1040(%rbx)
   140130a83:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140130a89:	movzbl 0x2(%rbp),%eax
   140130a8d:	lea    0x2a260c(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130a94:	add    $0x3,%rbp
   140130a98:	mov    (%rdi,%rax,8),%rax
   140130a9c:	jmp    *%rax
   140130a9e:	xchg   %ax,%ax
   140130aa0:	lea    0x20(%rdi),%rdx
   140130aa4:	lea    0x1068(%rbx),%rcx
   140130aab:	vzeroupper
   140130aae:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130ab3:	jmp    140126ffb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a1b>
   140130ab8:	movabs $0xffffffff00000000,%rax
   140130ac2:	mov    -0x8(%rsi),%rdx
   140130ac6:	movabs $0xfffd000200000000,%rcx
   140130ad0:	and    %rdx,%rax
   140130ad3:	cmp    %rcx,%rax
   140130ad6:	je     140136059 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a79>
   140130adc:	movabs $0xfffb000000000000,%rax
   140130ae6:	sub    $0x8,%rsi
   140130aea:	movabs $0xffff000000000000,%rdx
   140130af4:	movabs $0xfffd000000000000,%rcx
   140130afe:	mov    %rax,0x3e0(%rsp)
   140130b06:	mov    (%rsi),%rax
   140130b09:	and    %rax,%rdx
   140130b0c:	mov    %rax,0x3e0(%rsp)
   140130b14:	cmp    %rcx,%rdx
   140130b17:	je     14012e3dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadfc>
   140130b1d:	jmp    140128820 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5240>
   140130b22:	lea    0x20(%rdi),%rdx
   140130b26:	lea    0x1080(%rbx),%rcx
   140130b2d:	vzeroupper
   140130b30:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130b35:	jmp    1401270f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b19>
   140130b3a:	mov    %r9,0x60(%rsp)
   140130b3f:	lea    0x3e0(%rsp),%rcx
   140130b47:	vzeroupper
   140130b4a:	call   14022b1c0 <setun::VMValue::payload() const>
   140130b4f:	mov    0x60(%rsp),%r9
   140130b54:	lea    0x23cfe8(%rip),%rdx        # 14036db43 <.rdata+0x4c3>
   140130b5b:	mov    %rax,0x40(%rsp)
   140130b60:	movzwl 0x6(%r9),%edi
   140130b65:	shl    $0x5,%rdi
   140130b69:	add    0x30(%r15),%rdi
   140130b6d:	mov    %rdi,%rcx
   140130b70:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130b75:	test   %al,%al
   140130b77:	jne    140130b90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5b0>
   140130b79:	lea    0x23cfc7(%rip),%rdx        # 14036db47 <.rdata+0x4c7>
   140130b80:	mov    %rdi,%rcx
   140130b83:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130b88:	test   %al,%al
   140130b8a:	je     14012f4b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   140130b90:	mov    0x40(%rsp),%rax
   140130b95:	mov    0x58(%rax),%rdi
   140130b99:	test   %r12b,%r12b
   140130b9c:	jne    14013395b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1037b>
   140130ba2:	xor    %edx,%edx
   140130ba4:	test   %rdi,%rdi
   140130ba7:	je     140130bb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d4>
   140130ba9:	mov    %rdi,%rcx
   140130bac:	call   140152c50 <setun::ArrayObject::size() const>
   140130bb1:	mov    %rax,%rdx
   140130bb4:	lea    0x680(%rsp),%rcx
   140130bbc:	mov    $0x1,%r12d
   140130bc2:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140130bc7:	mov    0x680(%rsp),%rax
   140130bcf:	mov    %rax,0x1c8(%rsp)
   140130bd7:	cmpb   $0x0,0x1040(%rbx)
   140130bde:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140130be4:	movzbl 0x2(%rbp),%eax
   140130be8:	lea    0x2a24b1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130bef:	add    $0x3,%rbp
   140130bf3:	mov    (%rdi,%rax,8),%rax
   140130bf7:	jmp    *%rax
   140130bf9:	cmp    $0x2,%r12b
   140130bfd:	je     140132bbf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5df>
   140130c03:	mov    -0x8(%rsi),%rdx
   140130c07:	sub    $0x8,%rsi
   140130c0b:	mov    %rdx,0x10(%rax,%r13,8)
   140130c10:	cmpb   $0x0,0x1040(%rbx)
   140130c17:	jne    140127b18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4538>
   140130c1d:	jmp    14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140130c22:	nopw   0x0(%rax,%rax,1)
   140130c28:	vzeroupper
   140130c2b:	jmp    14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   140130c30:	lea    0x20(%rdi),%rdx
   140130c34:	lea    0x1080(%rbx),%rcx
   140130c3b:	vzeroupper
   140130c3e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130c43:	jmp    140127061 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a81>
   140130c48:	mov    -0x8(%rsi),%rdx
   140130c4c:	mov    %rdx,(%rax,%r13,8)
   140130c50:	cmpb   $0x0,0x1040(%rbx)
   140130c57:	jne    14012a1c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6be7>
   140130c5d:	jmp    14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140130c62:	nopw   0x0(%rax,%rax,1)
   140130c68:	lea    0x20(%rdi),%rdx
   140130c6c:	lea    0x1068(%rbx),%rcx
   140130c73:	mov    %eax,0x60(%rsp)
   140130c77:	mov    %r8d,0x80(%rsp)
   140130c7f:	mov    %r9d,0x40(%rsp)
   140130c84:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130c89:	movzwl 0x40(%rsp),%edx
   140130c8e:	movzwl 0x60(%rsp),%eax
   140130c93:	movzwl 0x80(%rsp),%r8d
   140130c9c:	mov    0x1068(%rbx),%rcx
   140130ca3:	add    %r13,%rdx
   140130ca6:	add    %r13,%r8
   140130ca9:	lea    (%rcx,%rdx,8),%rdx
   140130cad:	lea    (%rcx,%r8,8),%r9
   140130cb1:	jmp    14012433a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5a>
   140130cb6:	lea    0x8(%rdi),%rax
   140130cba:	mov    0x1070(%rbx),%rdx
   140130cc1:	sub    0x1068(%rbx),%rdx
   140130cc8:	mov    %rax,0x15268(%rbx)
   140130ccf:	sar    $0x3,%rdx
   140130cd3:	lea    0x48(%rdi),%rax
   140130cd7:	cmp    %rdx,%rax
   140130cda:	jb     140126ff2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a12>
   140130ce0:	add    %rdx,%rdx
   140130ce3:	lea    0x1068(%rbx),%rcx
   140130cea:	vzeroupper
   140130ced:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130cf2:	jmp    140126fe0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a00>
   140130cf7:	nopw   0x0(%rax,%rax,1)
   140130d00:	mov    0x1050(%rbx),%rax
   140130d07:	sub    %rdx,%rax
   140130d0a:	cmp    %r9,%rax
   140130d0d:	jb     140133897 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102b7>
   140130d13:	mov    %rdi,0x1060(%rbx)
   140130d1a:	mov    0x152a0(%rbx),%rax
   140130d21:	cmp    %rax,0x68(%rcx)
   140130d25:	jae    1401356c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120e4>
   140130d2b:	mov    0x1060(%rbx),%rax
   140130d32:	mov    0x1048(%rbx),%rdx
   140130d39:	lea    (%rdx,%rax,8),%rsi
   140130d3d:	jmp    140124bde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15fe>
   140130d42:	cmp    $0x1,%r12b
   140130d46:	je     140133904 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10324>
   140130d4c:	mov    -0x8(%rsi),%rax
   140130d50:	mov    $0x1,%r12d
   140130d56:	sub    $0x10,%rsi
   140130d5a:	mov    %rax,0x2b0(%rsp)
   140130d62:	mov    (%rsi),%rax
   140130d65:	mov    %rax,0x2a8(%rsp)
   140130d6d:	mov    %rax,%rdx
   140130d70:	movabs $0xffff000000000000,%rax
   140130d7a:	movabs $0xfff8000000000000,%rcx
   140130d84:	and    %rdx,%rax
   140130d87:	cmp    %rcx,%rax
   140130d8a:	jne    14012692d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x334d>
   140130d90:	jmp    14012bce1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8701>
   140130d95:	cmp    $0x1,%r12b
   140130d99:	je     1401341db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bfb>
   140130d9f:	mov    -0x8(%rsi),%rax
   140130da3:	lea    -0x10(%rsi),%r14
   140130da7:	mov    %rax,0x338(%rsp)
   140130daf:	mov    -0x10(%rsi),%rax
   140130db3:	mov    %rax,0x330(%rsp)
   140130dbb:	movabs $0xffffffff00000000,%rax
   140130dc5:	movabs $0xfffd000300000000,%rdx
   140130dcf:	and    0x330(%rsp),%rax
   140130dd7:	cmp    %rdx,%rax
   140130dda:	je     140135553 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f73>
   140130de0:	mov    0x330(%rsp),%rax
   140130de8:	movabs $0xffff000000000000,%rdx
   140130df2:	movabs $0xfffd000000000000,%rcx
   140130dfc:	and    %rax,%rdx
   140130dff:	cmp    %rcx,%rdx
   140130e02:	je     140131220 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc40>
   140130e08:	test   %r12b,%r12b
   140130e0b:	je     14013554b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f6b>
   140130e11:	cmp    $0x1,%r12b
   140130e15:	je     1401311f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc10>
   140130e1b:	lea    0x8(%r14),%r12
   140130e1f:	cmp    0x30(%rsp),%r12
   140130e24:	jae    14013550f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f2f>
   140130e2a:	mov    0x1d0(%rsp),%rax
   140130e32:	mov    %r12,%rsi
   140130e35:	mov    %rax,(%r14)
   140130e38:	mov    0x1c8(%rsp),%rax
   140130e40:	mov    %rax,0x1d0(%rsp)
   140130e48:	movabs $0xfff8000000000000,%rax
   140130e52:	mov    %rax,0x1c8(%rsp)
   140130e5a:	mov    $0x2,%r12d
   140130e60:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140130e65:	cmp    $0x1,%r12b
   140130e69:	je     140134251 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c71>
   140130e6f:	mov    -0x8(%rsi),%rax
   140130e73:	mov    $0x1,%r12d
   140130e79:	sub    $0x10,%rsi
   140130e7d:	mov    %rax,0x210(%rsp)
   140130e85:	mov    (%rsi),%rax
   140130e88:	mov    %rax,0x208(%rsp)
   140130e90:	lea    0x210(%rsp),%rdx
   140130e98:	lea    0x208(%rsp),%rcx
   140130ea0:	vzeroupper
   140130ea3:	call   140228ae0 <setun::VMValue::div(setun::VMValue const&) const>
   140130ea8:	mov    %rax,0x1c8(%rsp)
   140130eb0:	cmpb   $0x0,0x1040(%rbx)
   140130eb7:	jne    14012614a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b6a>
   140130ebd:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   140130ec2:	nopw   0x0(%rax,%rax,1)
   140130ec8:	mov    -0x8(%rsi),%rdx
   140130ecc:	mov    %rdx,0x8(%rax,%r13,8)
   140130ed1:	cmpb   $0x0,0x1040(%rbx)
   140130ed8:	jne    140127b9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45ba>
   140130ede:	jmp    14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140130ee3:	nopl   0x0(%rax,%rax,1)
   140130ee8:	cmp    $0x1,%ax
   140130eec:	je     140132597 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefb7>
   140130ef2:	cmp    $0x2,%ax
   140130ef6:	jne    140127d57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4777>
   140130efc:	mov    %rsi,%r14
   140130eff:	xor    %r12d,%r12d
   140130f02:	lea    0x330(%rsp),%rcx
   140130f0a:	vzeroupper
   140130f0d:	call   14022b1c0 <setun::VMValue::payload() const>
   140130f12:	mov    0x48(%rax),%rsi
   140130f16:	test   %rsi,%rsi
   140130f19:	je     14013639a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dba>
   140130f1f:	test   %r12b,%r12b
   140130f22:	je     14013633f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d5f>
   140130f28:	cmp    $0x1,%r12b
   140130f2c:	je     14013842f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e4f>
   140130f32:	lea    0x8(%r14),%r12
   140130f36:	cmp    0x30(%rsp),%r12
   140130f3b:	jae    1401383dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dfd>
   140130f41:	mov    0x1d0(%rsp),%rax
   140130f49:	lea    0x338(%rsp),%rdx
   140130f51:	lea    0x680(%rsp),%rcx
   140130f59:	mov    %rax,(%r14)
   140130f5c:	mov    0x1c8(%rsp),%rax
   140130f64:	mov    %rax,0x1d0(%rsp)
   140130f6c:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140130f71:	mov    %rsi,%rcx
   140130f74:	lea    0x680(%rsp),%rdx
   140130f7c:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140130f81:	mov    0x680(%rsp),%rcx
   140130f89:	mov    %rax,0x1c8(%rsp)
   140130f91:	lea    0x690(%rsp),%rax
   140130f99:	cmp    %rax,%rcx
   140130f9c:	je     140130faf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9cf>
   140130f9e:	mov    0x690(%rsp),%rax
   140130fa6:	lea    0x1(%rax),%rdx
   140130faa:	call   14034a160 <operator delete(void*, unsigned long long)>
   140130faf:	mov    %r12,%rsi
   140130fb2:	mov    $0x2,%r12d
   140130fb8:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140130fbd:	cmp    $0x2,%r12b
   140130fc1:	je     140133b1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1053a>
   140130fc7:	cmp    $0x1,%r12b
   140130fcb:	jne    1401377af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141cf>
   140130fd1:	mov    0x1048(%rbx),%rdx
   140130fd8:	mov    0x1050(%rbx),%rax
   140130fdf:	lea    0x8(%rsi),%r8
   140130fe3:	cmp    0x30(%rsp),%r8
   140130fe8:	jae    14013887c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1529c>
   140130fee:	mov    %r8,%rcx
   140130ff1:	mov    0x1c8(%rsp),%r8
   140130ff9:	mov    %r8,(%rsi)
   140130ffc:	sub    %rdx,%rcx
   140130fff:	mov    %r14,%r8
   140131002:	sub    %rdx,%rax
   140131005:	sub    0x38(%rsp),%r8
   14013100a:	mov    %rcx,%rsi
   14013100d:	mov    %r8,0x1038(%rbx)
   140131014:	sar    $0x3,%rsi
   140131018:	cmp    %rcx,%rax
   14013101b:	jae    14013102d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda4d>
   14013101d:	lea    (%rsi,%rsi,1),%rdx
   140131021:	lea    0x1048(%rbx),%rcx
   140131028:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013102d:	vmovdqa 0x23db4b(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140131035:	mov    %rsi,0x1060(%rbx)
   14013103c:	movb   $0x0,0x153a0(%rbx)
   140131043:	vmovdqa %xmm0,0x15390(%rbx)
   14013104b:	call   1403502d0 <setun::cold_throw_range_step_zero()>
   140131050:	cmp    $0x2,%r12b
   140131054:	je     1401344d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ef7>
   14013105a:	mov    -0x8(%rsi),%rdx
   14013105e:	sub    $0x8,%rsi
   140131062:	mov    %rdx,(%rax,%r13,8)
   140131066:	cmpb   $0x0,0x1040(%rbx)
   14013106d:	jne    140127a92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44b2>
   140131073:	jmp    14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140131078:	nopl   0x0(%rax,%rax,1)
   140131080:	cmp    $0x1,%r12b
   140131084:	je     140133e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1088b>
   14013108a:	mov    -0x8(%rsi),%rax
   14013108e:	mov    -0x10(%rsi),%rdx
   140131092:	sub    $0x10,%rsi
   140131096:	mov    %rax,0x3f0(%rsp)
   14013109e:	jmp    14012d5e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa001>
   1401310a3:	mov    0x1c8(%rsp),%rax
   1401310ab:	mov    $0x2,%r12d
   1401310b1:	mov    %rax,0x1d0(%rsp)
   1401310b9:	movabs $0xfff8000000000000,%rax
   1401310c3:	mov    %rax,0x1c8(%rsp)
   1401310cb:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   1401310d0:	cmp    $0x2,%r12b
   1401310d4:	je     140134299 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cb9>
   1401310da:	mov    -0x8(%rsi),%rdx
   1401310de:	sub    $0x8,%rsi
   1401310e2:	mov    %rdx,0x8(%rax,%r13,8)
   1401310e7:	cmpb   $0x0,0x1040(%rbx)
   1401310ee:	jne    140127ad5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44f5>
   1401310f4:	jmp    14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   1401310f9:	nopl   0x0(%rax)
   140131100:	cmp    $0x1,%r12b
   140131104:	je     140134570 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f90>
   14013110a:	mov    -0x8(%rsi),%rax
   14013110e:	mov    $0x1,%r12d
   140131114:	sub    $0x10,%rsi
   140131118:	mov    %rax,0x240(%rsp)
   140131120:	mov    (%rsi),%rax
   140131123:	mov    %rax,0x238(%rsp)
   14013112b:	lea    0x240(%rsp),%rdx
   140131133:	lea    0x238(%rsp),%rcx
   14013113b:	vzeroupper
   14013113e:	call   140229c40 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140131143:	mov    %rax,0x1c8(%rsp)
   14013114b:	cmpb   $0x0,0x1040(%rbx)
   140131152:	jne    14012644e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e6e>
   140131158:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14013115d:	vzeroupper
   140131160:	jmp    14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   140131165:	lea    0x8(%rdi),%rdx
   140131169:	lea    0x48(%rdi),%rcx
   14013116d:	mov    %rdx,0x15268(%rbx)
   140131174:	mov    0x1070(%rbx),%rdx
   14013117b:	sub    0x1068(%rbx),%rdx
   140131182:	sar    $0x3,%rdx
   140131186:	cmp    %rdx,%rcx
   140131189:	jae    14013564d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1206d>
   14013118f:	vzeroupper
   140131192:	jmp    140124311 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd31>
   140131197:	cmp    $0x1,%r12b
   14013119b:	je     14012d426 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e46>
   1401311a1:	mov    -0x8(%rsi),%rax
   1401311a5:	lea    -0x10(%rsi),%rdx
   1401311a9:	movabs $0xffff000000000000,%rcx
   1401311b3:	movabs $0xfffd000000000000,%r8
   1401311bd:	mov    %rax,0x310(%rsp)
   1401311c5:	mov    -0x10(%rsi),%rax
   1401311c9:	mov    %rdx,%rsi
   1401311cc:	and    %rax,%rcx
   1401311cf:	mov    %rax,0x308(%rsp)
   1401311d7:	cmp    %r8,%rcx
   1401311da:	je     14012d468 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e88>
   1401311e0:	test   %r12b,%r12b
   1401311e3:	jne    14012e576 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf96>
   1401311e9:	jmp    140129f0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x692e>
   1401311ee:	xchg   %ax,%ax
   1401311f0:	mov    0x1c8(%rsp),%rax
   1401311f8:	mov    %r14,%rsi
   1401311fb:	mov    $0x2,%r12d
   140131201:	mov    %rax,0x1d0(%rsp)
   140131209:	movabs $0xfff8000000000000,%rax
   140131213:	mov    %rax,0x1c8(%rsp)
   14013121b:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140131220:	shr    $0x20,%rax
   140131224:	cmp    $0x3,%ax
   140131228:	jne    140132576 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef96>
   14013122e:	lea    0x330(%rsp),%rcx
   140131236:	vzeroupper
   140131239:	call   14022b1c0 <setun::VMValue::payload() const>
   14013123e:	mov    0x58(%rax),%rdi
   140131242:	test   %rdi,%rdi
   140131245:	je     140131257 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc77>
   140131247:	mov    %rdi,%rcx
   14013124a:	call   140152d30 <setun::ArrayObject::empty() const>
   14013124f:	test   %al,%al
   140131251:	je     140134d5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1177a>
   140131257:	test   %r12b,%r12b
   14013125a:	je     140132818 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf238>
   140131260:	cmp    $0x1,%r12b
   140131264:	je     1401311f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc10>
   140131266:	lea    0x8(%r14),%r12
   14013126a:	cmp    0x30(%rsp),%r12
   14013126f:	jb     140130e2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd84a>
   140131275:	mov    0x1050(%rbx),%rax
   14013127c:	mov    0x1048(%rbx),%rdx
   140131283:	mov    %rax,0x30(%rsp)
   140131288:	sub    %rdx,%rax
   14013128b:	sar    $0x3,%rax
   14013128f:	lea    (%rax,%rax,1),%rcx
   140131293:	cmp    %rcx,%rax
   140131296:	jae    140130e2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd84a>
   14013129c:	sub    %rdx,%r14
   14013129f:	mov    %rcx,%rdx
   1401312a2:	lea    0x1048(%rbx),%rcx
   1401312a9:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401312ae:	mov    0x1050(%rbx),%rax
   1401312b5:	add    0x1048(%rbx),%r14
   1401312bc:	lea    0x8(%r14),%r12
   1401312c0:	mov    %rax,0x30(%rsp)
   1401312c5:	jmp    140130e2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd84a>
   1401312ca:	nopw   0x0(%rax,%rax,1)
   1401312d0:	mov    0x15270(%rbx),%rax
   1401312d7:	mov    0x152a0(%rbx),%rdi
   1401312de:	cmp    %rdi,0x68(%rax)
   1401312e2:	jae    140134dec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1180c>
   1401312e8:	cmpb   $0x0,0x152c1(%rbx)
   1401312ef:	je     140132360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed80>
   1401312f5:	cmpq   $0x0,0x152e0(%rbx)
   1401312fd:	je     140132360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed80>
   140131303:	cmp    $0x2,%r12b
   140131307:	je     140134c89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116a9>
   14013130d:	cmp    $0x1,%r12b
   140131311:	je     140138955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15375>
   140131317:	mov    0x1048(%rbx),%rdx
   14013131e:	mov    0x1050(%rbx),%rax
   140131325:	mov    %rsi,%rcx
   140131328:	sub    %rdx,%rax
   14013132b:	sub    %rdx,%rcx
   14013132e:	mov    %rcx,%rdi
   140131331:	sar    $0x3,%rdi
   140131335:	cmp    %rcx,%rax
   140131338:	jb     140134c71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11691>
   14013133e:	movswq %r14w,%rax
   140131342:	mov    %rdi,0x1060(%rbx)
   140131349:	lea    0x2(%rbp,%rax,1),%rax
   14013134e:	sub    0x38(%rsp),%rax
   140131353:	mov    %rax,0x40(%rsp)
   140131358:	and    0x15300(%rbx),%rax
   14013135f:	mov    %rax,%r10
   140131362:	shl    $0x5,%r10
   140131366:	add    0x152e0(%rbx),%r10
   14013136d:	cmpq   $0x0,(%r10)
   140131371:	je     140134b64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11584>
   140131377:	mov    0x1068(%rbx),%rdx
   14013137e:	lea    0x560(%rsp),%r12
   140131386:	xor    %eax,%eax
   140131388:	mov    $0x23,%ecx
   14013138d:	mov    %r12,%rdi
   140131390:	rep stos %rax,(%rdi)
   140131393:	lea    (%rdx,%r13,8),%rax
   140131397:	movb   $0x1,0x668(%rsp)
   14013139f:	mov    %rax,0x570(%rsp)
   1401313a7:	mov    0x1070(%rbx),%rax
   1401313ae:	mov    %rbx,0x560(%rsp)
   1401313b6:	sub    %rdx,%rax
   1401313b9:	mov    0x1048(%rbx),%rdx
   1401313c0:	sar    $0x3,%rax
   1401313c4:	sub    %r13,%rax
   1401313c7:	mov    %rdx,0x580(%rsp)
   1401313cf:	mov    %rax,0x578(%rsp)
   1401313d7:	mov    %rsi,%rax
   1401313da:	sub    %rdx,%rax
   1401313dd:	mov    0x150c0(%rbx),%rdx
   1401313e4:	sar    $0x3,%rax
   1401313e8:	mov    %rax,0x588(%rsp)
   1401313f0:	xor    %eax,%eax
   1401313f2:	test   %rdx,%rdx
   1401313f5:	je     140131403 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde23>
   1401313f7:	imul   $0x28,%rdx,%rdx
   1401313fb:	lea    0x1098(%rbx,%rdx,1),%rax
   140131403:	mov    %r10,0x60(%rsp)
   140131408:	vmovq  %rax,%xmm7
   14013140d:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140131417:	mov    %r12,0x152b8(%rbx)
   14013141e:	vmovdqa %xmm0,0x590(%rsp)
   140131427:	vzeroupper
   14013142a:	call   140221db0 <tersun::VMTelemetryManager::instance()>
   14013142f:	mov    0x60(%rsp),%r10
   140131434:	cmpb   $0x0,(%rax)
   140131437:	je     14013143e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde5e>
   140131439:	addq   $0x1,0x78(%rax)
   14013143e:	mov    %r12,%rdx
   140131441:	mov    %rbx,%rcx
   140131444:	call   *(%r10)
   140131447:	mov    %rax,%r12
   14013144a:	mov    0x598(%rsp),%rax
   140131452:	mov    %rax,0x152b8(%rbx)
   140131459:	cmpq   $0x0,0x5a8(%rsp)
   140131462:	jg     1401380a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ac4>
   140131468:	mov    0x150c0(%rbx),%rax
   14013146f:	test   %rax,%rax
   140131472:	je     14013808e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aae>
   140131478:	lea    (%rax,%rax,4),%rdx
   14013147c:	sub    $0x1,%rax
   140131480:	lea    (%rbx,%rdx,8),%rdx
   140131484:	mov    0x1098(%rdx),%r14
   14013148b:	mov    0x10a0(%rdx),%rcx
   140131492:	mov    0x10a8(%rdx),%rsi
   140131499:	mov    %rax,0x150c0(%rbx)
   1401314a0:	cmpb   $0x0,0x15211(%rbx)
   1401314a7:	je     14013807a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a9a>
   1401314ad:	mov    %rcx,0x15268(%rbx)
   1401314b4:	mov    0x1048(%rbx),%rdx
   1401314bb:	mov    0x150c0(%rbx),%r13
   1401314c2:	lea    (%rdx,%rsi,8),%rax
   1401314c6:	mov    %r12,(%rax)
   1401314c9:	lea    0x8(%rax),%rsi
   1401314cd:	test   %r13,%r13
   1401314d0:	je     1401314e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf02>
   1401314d2:	lea    -0x1(%r13),%rax
   1401314d6:	imul   $0x28,%rax,%rax
   1401314da:	mov    0x10c8(%rbx,%rax,1),%r13
   1401314e2:	add    0x38(%rsp),%r14
   1401314e7:	cmpb   $0x0,0x1040(%rbx)
   1401314ee:	je     14012a27a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c9a>
   1401314f4:	movzbl (%r14),%eax
   1401314f8:	lea    0x2a1ba1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401314ff:	lea    0x1(%r14),%rbp
   140131503:	xor    %r12d,%r12d
   140131506:	mov    (%rdi,%rax,8),%rax
   14013150a:	jmp    *%rax
   14013150c:	mov    -0x8(%rsi),%rdx
   140131510:	mov    %rdx,0x10(%rax,%r13,8)
   140131515:	cmpb   $0x0,0x1040(%rbx)
   14013151c:	jne    140127bd9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45f9>
   140131522:	jmp    14012a2fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d1c>
   140131527:	nopw   0x0(%rax,%rax,1)
   140131530:	cmp    $0x2,%r12b
   140131534:	je     140133bf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10616>
   14013153a:	mov    -0x8(%rsi),%rdx
   14013153e:	sub    $0x8,%rsi
   140131542:	mov    %rdx,0x18(%rax,%r13,8)
   140131547:	cmpb   $0x0,0x1040(%rbx)
   14013154e:	jne    140127b5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x457b>
   140131554:	jmp    14012a038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a58>
   140131559:	nopl   0x0(%rax)
   140131560:	lea    0x8(%rdi),%rax
   140131564:	mov    0x1070(%rbx),%rdx
   14013156b:	sub    0x1068(%rbx),%rdx
   140131572:	mov    %rax,0x15268(%rbx)
   140131579:	sar    $0x3,%rdx
   14013157d:	lea    0x48(%rdi),%rax
   140131581:	cmp    %rdx,%rax
   140131584:	jb     140127c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x466b>
   14013158a:	mov    %r8d,0x40(%rsp)
   14013158f:	add    %rdx,%rdx
   140131592:	lea    0x1068(%rbx),%rcx
   140131599:	vzeroupper
   14013159c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401315a1:	mov    0x40(%rsp),%r8d
   1401315a6:	jmp    140127c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x466b>
   1401315ab:	nopl   0x0(%rax,%rax,1)
   1401315b0:	cmp    $0x1,%r12b
   1401315b4:	je     1401342c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ce1>
   1401315ba:	mov    -0x8(%rsi),%rax
   1401315be:	mov    $0x1,%r12d
   1401315c4:	sub    $0x10,%rsi
   1401315c8:	mov    %rax,0x220(%rsp)
   1401315d0:	mov    (%rsi),%rax
   1401315d3:	mov    %rax,0x218(%rsp)
   1401315db:	lea    0x220(%rsp),%rdx
   1401315e3:	lea    0x218(%rsp),%rcx
   1401315eb:	vzeroupper
   1401315ee:	call   140228de0 <setun::VMValue::mod(setun::VMValue const&) const>
   1401315f3:	mov    %rax,0x1c8(%rsp)
   1401315fb:	cmpb   $0x0,0x1040(%rbx)
   140131602:	jne    1401264da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2efa>
   140131608:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14013160d:	nopl   (%rax)
   140131610:	cmp    $0x1,%r12b
   140131614:	je     140132d71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf791>
   14013161a:	mov    -0x8(%rsi),%rax
   14013161e:	mov    $0x1,%r12d
   140131624:	sub    $0x10,%rsi
   140131628:	mov    %rax,0x230(%rsp)
   140131630:	mov    (%rsi),%rax
   140131633:	mov    %rax,0x228(%rsp)
   14013163b:	lea    0x230(%rsp),%rdx
   140131643:	lea    0x228(%rsp),%rcx
   14013164b:	vzeroupper
   14013164e:	call   14022a510 <setun::VMValue::bit_and(setun::VMValue const&) const>
   140131653:	mov    %rax,0x1c8(%rsp)
   14013165b:	cmpb   $0x0,0x1040(%rbx)
   140131662:	jne    1401263c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2de2>
   140131668:	jmp    14012a1e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c00>
   14013166d:	shr    $0x20,%rax
   140131671:	test   %ax,%ax
   140131674:	je     140131705 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe125>
   14013167a:	movabs $0xfffd000100000000,%rcx
   140131684:	cmp    %rcx,%rdx
   140131687:	je     140131693 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0b3>
   140131689:	cmp    $0x1,%ax
   14013168d:	jne    1401269dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fd>
   140131693:	lea    0x2b0(%rsp),%rdx
   14013169b:	lea    0x680(%rsp),%rcx
   1401316a3:	vzeroupper
   1401316a6:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401316ab:	lea    0x540(%rsp),%rax
   1401316b3:	lea    0x2a8(%rsp),%rdx
   1401316bb:	mov    %rax,%rcx
   1401316be:	mov    %rax,0x40(%rsp)
   1401316c3:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401316c8:	mov    0x40(%rsp),%rcx
   1401316cd:	lea    0x680(%rsp),%rdx
   1401316d5:	call   1400120c0 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   1401316da:	test   %eax,%eax
   1401316dc:	setne  %al
   1401316df:	jmp    140126a03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3423>
   1401316e4:	mov    0x1048(%rbx),%rdx
   1401316eb:	jmp    140125529 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f49>
   1401316f0:	mov    0x290(%rsp),%rax
   1401316f8:	mov    %rax,0x1c8(%rsp)
   140131700:	jmp    14012d7ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1cd>
   140131705:	lea    0x2b0(%rsp),%rdx
   14013170d:	lea    0x680(%rsp),%rcx
   140131715:	vzeroupper
   140131718:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013171d:	lea    0x540(%rsp),%rax
   140131725:	lea    0x2a8(%rsp),%rdx
   14013172d:	mov    %rax,%rcx
   140131730:	mov    %rax,0x40(%rsp)
   140131735:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013173a:	mov    0x40(%rsp),%rcx
   14013173f:	lea    0x680(%rsp),%rdx
   140131747:	call   1403417e0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14013174c:	mov    0x540(%rsp),%rcx
   140131754:	mov    %eax,%edi
   140131756:	lea    0x550(%rsp),%rax
   14013175e:	cmp    %rax,%rcx
   140131761:	je     140131774 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe194>
   140131763:	mov    0x550(%rsp),%rax
   14013176b:	lea    0x1(%rax),%rdx
   14013176f:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131774:	mov    0x680(%rsp),%rcx
   14013177c:	lea    0x690(%rsp),%rax
   140131784:	cmp    %rax,%rcx
   140131787:	je     14013179a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1ba>
   140131789:	mov    0x690(%rsp),%rax
   140131791:	lea    0x1(%rax),%rdx
   140131795:	call   14034a160 <operator delete(void*, unsigned long long)>
   14013179a:	mov    %edi,%eax
   14013179c:	xor    $0x1,%eax
   14013179f:	jmp    140126a03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3423>
   1401317a4:	movabs $0xffff000000000000,%rcx
   1401317ae:	movb   $0xcd,-0x1(%rbp)
   1401317b2:	mov    (%rdx),%rax
   1401317b5:	and    %rax,%rcx
   1401317b8:	mov    %rcx,%r8
   1401317bb:	movabs $0xfffd000000000000,%rcx
   1401317c5:	cmp    %rcx,%r8
   1401317c8:	je     140133edf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108ff>
   1401317ce:	movabs $0xfff8000000000000,%rax
   1401317d8:	cmp    %rax,%r8
   1401317db:	je     140133ef7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10917>
   1401317e1:	mov    %rdx,%rcx
   1401317e4:	mov    %r10,0x60(%rsp)
   1401317e9:	mov    %r9,0x40(%rsp)
   1401317ee:	call   14022b550 <setun::VMValue::as_float() const>
   1401317f3:	mov    0x60(%rsp),%r10
   1401317f8:	mov    0x40(%rsp),%r9
   1401317fd:	movq   $0x0,0x508(%rsp)
   140131809:	vcvttsd2si %xmm0,%rax
   14013180e:	movq   $0x0,0x510(%rsp)
   14013181a:	mov    %rax,0x500(%rsp)
   140131822:	lea    0x500(%rsp),%rax
   14013182a:	mov    %rax,0x80(%rsp)
   140131832:	movabs $0xffff000000000000,%rcx
   14013183c:	mov    (%r9),%rax
   14013183f:	movabs $0xfffd000000000000,%rdx
   140131849:	and    %rax,%rcx
   14013184c:	cmp    %rdx,%rcx
   14013184f:	je     140133eb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108d5>
   140131855:	movabs $0xfff8000000000000,%rax
   14013185f:	cmp    %rax,%rcx
   140131862:	je     140133ecd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108ed>
   140131868:	mov    %r9,%rcx
   14013186b:	mov    %r10,0x40(%rsp)
   140131870:	call   14022b550 <setun::VMValue::as_float() const>
   140131875:	vcvttsd2si %xmm0,%rax
   14013187a:	mov    %rax,0x520(%rsp)
   140131882:	mov    0x40(%rsp),%r10
   140131887:	lea    0x520(%rsp),%r8
   14013188f:	movq   $0x0,0x528(%rsp)
   14013189b:	movq   $0x0,0x530(%rsp)
   1401318a7:	movabs $0xffff000000000000,%rcx
   1401318b1:	mov    (%r10),%rax
   1401318b4:	movabs $0xfffd000000000000,%rdx
   1401318be:	and    %rax,%rcx
   1401318c1:	cmp    %rdx,%rcx
   1401318c4:	je     140133e8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108ab>
   1401318ca:	movabs $0xfff8000000000000,%rax
   1401318d4:	cmp    %rax,%rcx
   1401318d7:	je     140133ea3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108c3>
   1401318dd:	mov    %r10,%rcx
   1401318e0:	mov    %r8,0x40(%rsp)
   1401318e5:	call   14022b550 <setun::VMValue::as_float() const>
   1401318ea:	vcvttsd2si %xmm0,%rax
   1401318ef:	mov    0x40(%rsp),%r8
   1401318f4:	mov    %rax,0x540(%rsp)
   1401318fc:	lea    0x540(%rsp),%rax
   140131904:	movq   $0x0,0x548(%rsp)
   140131910:	movq   $0x0,0x550(%rsp)
   14013191c:	mov    %rax,0x60(%rsp)
   140131921:	mov    0x80(%rsp),%rdx
   140131929:	lea    0x680(%rsp),%rax
   140131931:	mov    %rax,%rcx
   140131934:	mov    %rax,0x40(%rsp)
   140131939:	call   140011910 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14013193e:	mov    0x40(%rsp),%r8
   140131943:	mov    0x60(%rsp),%rdx
   140131948:	lea    0x4c0(%rsp),%rcx
   140131950:	call   1400113a0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140131955:	mov    0x4d0(%rsp),%rax
   14013195d:	vmovdqa 0x4c0(%rsp),%xmm7
   140131966:	lea    0x1a0(%rsp),%rdx
   14013196e:	mov    0x40(%rsp),%rcx
   140131973:	mov    %rax,0x1b0(%rsp)
   14013197b:	vmovdqa %xmm7,0x1a0(%rsp)
   140131984:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140131989:	mov    0x1068(%rbx),%rax
   140131990:	mov    0x680(%rsp),%rdx
   140131998:	mov    %rdx,(%rax,%rdi,8)
   14013199c:	jmp    14012440e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2e>
   1401319a1:	mov    0x278(%rsp),%rax
   1401319a9:	mov    %rax,0x1c8(%rsp)
   1401319b1:	jmp    14012d86e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa28e>
   1401319b6:	lea    0x680(%rsp),%rcx
   1401319be:	lea    0x308(%rsp),%rdx
   1401319c6:	vzeroupper
   1401319c9:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401319ce:	mov    0x680(%rsp),%rax
   1401319d6:	lea    0x310(%rsp),%rcx
   1401319de:	mov    0x688(%rsp),%r14
   1401319e6:	mov    0x690(%rsp),%edi
   1401319ed:	mov    %rax,0x40(%rsp)
   1401319f2:	call   140229aa0 <setun::VMValue::as_int() const>
   1401319f7:	test   %rax,%rax
   1401319fa:	jne    1401326ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0da>
   140131a00:	test   %r12b,%r12b
   140131a03:	je     140134ff4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a14>
   140131a09:	cmp    $0x1,%r12b
   140131a0d:	je     140137ed0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148f0>
   140131a13:	lea    0x8(%rsi),%r8
   140131a17:	cmp    0x30(%rsp),%r8
   140131a1c:	jae    140137e7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1489e>
   140131a22:	mov    0x40(%rsp),%rdx
   140131a27:	mov    %r8,0x60(%rsp)
   140131a2c:	lea    0x540(%rsp),%rcx
   140131a34:	mov    $0x2,%r12d
   140131a3a:	mov    0x1d0(%rsp),%rax
   140131a42:	mov    %rax,(%rsi)
   140131a45:	mov    0x1c8(%rsp),%rax
   140131a4d:	mov    %rax,0x1d0(%rsp)
   140131a55:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140131a5a:	mov    0x540(%rsp),%rax
   140131a62:	mov    0x60(%rsp),%rsi
   140131a67:	mov    %rax,0x1c8(%rsp)
   140131a6f:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   140131a74:	add    0x548(%rsp),%rdi
   140131a7c:	jns    14012d4b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed0>
   140131a82:	test   %r12b,%r12b
   140131a85:	je     140133524 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff44>
   140131a8b:	cmp    $0x1,%r12b
   140131a8f:	je     1401365fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1301c>
   140131a95:	lea    0x8(%rsi),%r8
   140131a99:	cmp    0x30(%rsp),%r8
   140131a9e:	jae    140139195 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15bb5>
   140131aa4:	mov    0x1d0(%rsp),%rax
   140131aac:	lea    0x680(%rsp),%rcx
   140131ab4:	mov    %r8,0x40(%rsp)
   140131ab9:	lea    0x23c082(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   140131ac0:	mov    %rax,(%rsi)
   140131ac3:	mov    0x1c8(%rsp),%rax
   140131acb:	mov    %rax,0x1d0(%rsp)
   140131ad3:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140131ad8:	mov    0x680(%rsp),%rax
   140131ae0:	mov    0x40(%rsp),%rsi
   140131ae5:	mov    %rax,0x1c8(%rsp)
   140131aed:	mov    $0x2,%r12d
   140131af3:	jmp    14012d577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f97>
   140131af8:	mov    %r9,0x40(%rsp)
   140131afd:	lea    0x400(%rsp),%rcx
   140131b05:	lea    0x3e0(%rsp),%rdx
   140131b0d:	vzeroupper
   140131b10:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140131b15:	mov    0x40(%rsp),%r9
   140131b1a:	lea    0x23c022(%rip),%rdx        # 14036db43 <.rdata+0x4c3>
   140131b21:	movzwl 0x6(%r9),%edi
   140131b26:	shl    $0x5,%rdi
   140131b2a:	add    0x30(%r15),%rdi
   140131b2e:	mov    %rdi,%rcx
   140131b31:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131b36:	test   %al,%al
   140131b38:	jne    140132330 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed50>
   140131b3e:	lea    0x23c002(%rip),%rdx        # 14036db47 <.rdata+0x4c7>
   140131b45:	mov    %rdi,%rcx
   140131b48:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131b4d:	test   %al,%al
   140131b4f:	jne    140132330 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed50>
   140131b55:	lea    0x23c017(%rip),%rdx        # 14036db73 <.rdata+0x4f3>
   140131b5c:	mov    %rdi,%rcx
   140131b5f:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131b64:	test   %al,%al
   140131b66:	jne    140135a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1242d>
   140131b6c:	lea    0x23c002(%rip),%rdx        # 14036db75 <.rdata+0x4f5>
   140131b73:	mov    %rdi,%rcx
   140131b76:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131b7b:	test   %al,%al
   140131b7d:	jne    140135a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1242d>
   140131b83:	lea    0x23bfed(%rip),%rdx        # 14036db77 <.rdata+0x4f7>
   140131b8a:	mov    %rdi,%rcx
   140131b8d:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131b92:	test   %al,%al
   140131b94:	jne    140138d29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15749>
   140131b9a:	lea    0x23bfd8(%rip),%rdx        # 14036db79 <.rdata+0x4f9>
   140131ba1:	mov    %rdi,%rcx
   140131ba4:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131ba9:	test   %al,%al
   140131bab:	jne    140138d29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15749>
   140131bb1:	lea    0x23bfc3(%rip),%rdx        # 14036db7b <.rdata+0x4fb>
   140131bb8:	mov    %rdi,%rcx
   140131bbb:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131bc0:	test   %al,%al
   140131bc2:	jne    140138cd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x156f0>
   140131bc8:	lea    0x23bfae(%rip),%rdx        # 14036db7d <.rdata+0x4fd>
   140131bcf:	mov    %rdi,%rcx
   140131bd2:	call   140341780 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131bd7:	test   %al,%al
   140131bd9:	jne    140138cd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x156f0>
   140131bdf:	test   %r12b,%r12b
   140131be2:	jne    140138b1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1553a>
   140131be8:	mov    $0x1fff,%eax
   140131bed:	mov    $0x1,%r12d
   140131bf3:	shl    $0x33,%rax
   140131bf7:	mov    %rax,0x1c8(%rsp)
   140131bff:	cmpb   $0x0,0x1040(%rbx)
   140131c06:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   140131c0c:	movzbl 0x2(%rbp),%eax
   140131c10:	lea    0x2a1489(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131c17:	add    $0x3,%rbp
   140131c1b:	mov    (%rdi,%rax,8),%rax
   140131c1f:	jmp    *%rax
   140131c21:	shr    $0x20,%rdx
   140131c25:	mov    %edx,%r8d
   140131c28:	test   %dx,%dx
   140131c2b:	jne    140132855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf275>
   140131c31:	lea    0x680(%rsp),%rcx
   140131c39:	lea    0x3d0(%rsp),%rdx
   140131c41:	vzeroupper
   140131c44:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131c49:	lea    0x3c8(%rsp),%rdx
   140131c51:	lea    0x540(%rsp),%rcx
   140131c59:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131c5e:	mov    0x540(%rsp),%r14
   140131c66:	mov    0x688(%rsp),%r9
   140131c6e:	mov    0x680(%rsp),%r8
   140131c76:	mov    0x548(%rsp),%rdx
   140131c7e:	mov    %r14,%rcx
   140131c81:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131c86:	mov    %eax,%edi
   140131c88:	lea    0x550(%rsp),%rax
   140131c90:	cmp    %rax,%r14
   140131c93:	je     140131ca9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6c9>
   140131c95:	mov    0x550(%rsp),%rax
   140131c9d:	mov    %r14,%rcx
   140131ca0:	lea    0x1(%rax),%rdx
   140131ca4:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131ca9:	mov    0x680(%rsp),%rcx
   140131cb1:	lea    0x690(%rsp),%rax
   140131cb9:	cmp    %rax,%rcx
   140131cbc:	je     140131ccf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6ef>
   140131cbe:	mov    0x690(%rsp),%rax
   140131cc6:	lea    0x1(%rax),%rdx
   140131cca:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131ccf:	mov    %edi,%eax
   140131cd1:	not    %eax
   140131cd3:	shr    $0x1f,%eax
   140131cd6:	jmp    14012876b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x518b>
   140131cdb:	add    0x548(%rsp),%rdi
   140131ce3:	jns    14012e921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb341>
   140131ce9:	test   %r12b,%r12b
   140131cec:	je     140133fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a06>
   140131cf2:	cmp    $0x1,%r12b
   140131cf6:	je     1401358f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12318>
   140131cfc:	lea    0x8(%rsi),%r8
   140131d00:	cmp    0x30(%rsp),%r8
   140131d05:	jae    140138765 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15185>
   140131d0b:	mov    0x1d0(%rsp),%rax
   140131d13:	lea    0x680(%rsp),%rcx
   140131d1b:	mov    %r8,0x40(%rsp)
   140131d20:	lea    0x23be1b(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   140131d27:	mov    %rax,(%rsi)
   140131d2a:	mov    0x1c8(%rsp),%rax
   140131d32:	mov    %rax,0x1d0(%rsp)
   140131d3a:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140131d3f:	mov    0x680(%rsp),%rax
   140131d47:	mov    0x40(%rsp),%rsi
   140131d4c:	mov    %rax,0x1c8(%rsp)
   140131d54:	mov    $0x2,%r12d
   140131d5a:	jmp    14012e9e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb408>
   140131d5f:	shr    $0x20,%rdx
   140131d63:	mov    %edx,%r8d
   140131d66:	test   %dx,%dx
   140131d69:	jne    140132956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf376>
   140131d6f:	lea    0x3b0(%rsp),%rdx
   140131d77:	lea    0x680(%rsp),%rcx
   140131d7f:	vzeroupper
   140131d82:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131d87:	lea    0x540(%rsp),%rax
   140131d8f:	lea    0x3a8(%rsp),%rdx
   140131d97:	mov    %rax,%rcx
   140131d9a:	mov    %rax,0x40(%rsp)
   140131d9f:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131da4:	mov    0x40(%rsp),%rcx
   140131da9:	lea    0x680(%rsp),%rdx
   140131db1:	call   1403417e0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131db6:	mov    0x540(%rsp),%rcx
   140131dbe:	mov    %eax,%edi
   140131dc0:	lea    0x550(%rsp),%rax
   140131dc8:	cmp    %rax,%rcx
   140131dcb:	je     140131dde <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7fe>
   140131dcd:	mov    0x550(%rsp),%rax
   140131dd5:	lea    0x1(%rax),%rdx
   140131dd9:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131dde:	mov    0x680(%rsp),%rcx
   140131de6:	lea    0x690(%rsp),%rax
   140131dee:	cmp    %rax,%rcx
   140131df1:	je     1401284b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ed4>
   140131df7:	mov    0x690(%rsp),%rax
   140131dff:	lea    0x1(%rax),%rdx
   140131e03:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131e08:	jmp    1401284b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ed4>
   140131e0d:	shr    $0x20,%rdx
   140131e11:	mov    %edx,%r8d
   140131e14:	test   %dx,%dx
   140131e17:	jne    1401327dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1fc>
   140131e1d:	lea    0x680(%rsp),%rcx
   140131e25:	lea    0x390(%rsp),%rdx
   140131e2d:	vzeroupper
   140131e30:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131e35:	lea    0x388(%rsp),%rdx
   140131e3d:	lea    0x540(%rsp),%rcx
   140131e45:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131e4a:	mov    0x540(%rsp),%r14
   140131e52:	mov    0x688(%rsp),%r9
   140131e5a:	mov    0x680(%rsp),%r8
   140131e62:	mov    0x548(%rsp),%rdx
   140131e6a:	mov    %r14,%rcx
   140131e6d:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131e72:	mov    %eax,%edi
   140131e74:	lea    0x550(%rsp),%rax
   140131e7c:	cmp    %rax,%r14
   140131e7f:	je     140131e95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8b5>
   140131e81:	mov    0x550(%rsp),%rax
   140131e89:	mov    %r14,%rcx
   140131e8c:	lea    0x1(%rax),%rdx
   140131e90:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131e95:	mov    0x680(%rsp),%rcx
   140131e9d:	lea    0x690(%rsp),%rax
   140131ea5:	cmp    %rax,%rcx
   140131ea8:	je     140131ebb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8db>
   140131eaa:	mov    0x690(%rsp),%rax
   140131eb2:	lea    0x1(%rax),%rdx
   140131eb6:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131ebb:	shr    $0x1f,%edi
   140131ebe:	mov    %edi,%eax
   140131ec0:	jmp    1401281fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1d>
   140131ec5:	shr    $0x20,%rdx
   140131ec9:	mov    %edx,%r8d
   140131ecc:	test   %dx,%dx
   140131ecf:	jne    1401327a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1c9>
   140131ed5:	lea    0x680(%rsp),%rcx
   140131edd:	lea    0x3c0(%rsp),%rdx
   140131ee5:	vzeroupper
   140131ee8:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131eed:	lea    0x3b8(%rsp),%rdx
   140131ef5:	lea    0x540(%rsp),%rcx
   140131efd:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131f02:	mov    0x540(%rsp),%r14
   140131f0a:	mov    0x688(%rsp),%r9
   140131f12:	mov    0x680(%rsp),%r8
   140131f1a:	mov    0x548(%rsp),%rdx
   140131f22:	mov    %r14,%rcx
   140131f25:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131f2a:	mov    %eax,%edi
   140131f2c:	lea    0x550(%rsp),%rax
   140131f34:	cmp    %rax,%r14
   140131f37:	je     140131f4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe96d>
   140131f39:	mov    0x550(%rsp),%rax
   140131f41:	mov    %r14,%rcx
   140131f44:	lea    0x1(%rax),%rdx
   140131f48:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131f4d:	mov    0x680(%rsp),%rcx
   140131f55:	lea    0x690(%rsp),%rax
   140131f5d:	cmp    %rax,%rcx
   140131f60:	je     140131f73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe993>
   140131f62:	mov    0x690(%rsp),%rax
   140131f6a:	lea    0x1(%rax),%rdx
   140131f6e:	call   14034a160 <operator delete(void*, unsigned long long)>
   140131f73:	test   %edi,%edi
   140131f75:	setg   %al
   140131f78:	jmp    140128610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5030>
   140131f7d:	shr    $0x20,%rdx
   140131f81:	mov    %edx,%r8d
   140131f84:	test   %dx,%dx
   140131f87:	jne    14013267a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf09a>
   140131f8d:	lea    0x680(%rsp),%rcx
   140131f95:	lea    0x3a0(%rsp),%rdx
   140131f9d:	vzeroupper
   140131fa0:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131fa5:	lea    0x398(%rsp),%rdx
   140131fad:	lea    0x540(%rsp),%rcx
   140131fb5:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131fba:	mov    0x540(%rsp),%r14
   140131fc2:	mov    0x688(%rsp),%r9
   140131fca:	mov    0x680(%rsp),%r8
   140131fd2:	mov    0x548(%rsp),%rdx
   140131fda:	mov    %r14,%rcx
   140131fdd:	call   140104a40 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131fe2:	mov    %eax,%edi
   140131fe4:	lea    0x550(%rsp),%rax
   140131fec:	cmp    %rax,%r14
   140131fef:	je     140132005 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea25>
   140131ff1:	mov    0x550(%rsp),%rax
   140131ff9:	mov    %r14,%rcx
   140131ffc:	lea    0x1(%rax),%rdx
   140132000:	call   14034a160 <operator delete(void*, unsigned long long)>
   140132005:	mov    0x680(%rsp),%rcx
   14013200d:	lea    0x690(%rsp),%rax
   140132015:	cmp    %rax,%rcx
   140132018:	je     14013202b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea4b>
   14013201a:	mov    0x690(%rsp),%rax
   140132022:	lea    0x1(%rax),%rdx
   140132026:	call   14034a160 <operator delete(void*, unsigned long long)>
   14013202b:	test   %edi,%edi
   14013202d:	setle  %al
   140132030:	jmp    140128358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d78>
   140132035:	cmp    $0x2,%r12b
   140132039:	jne    1401393d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15df1>
   14013203f:	mov    0x1048(%rbx),%rdx
   140132046:	lea    0x10(%rsi),%rcx
   14013204a:	cmp    0x30(%rsp),%rcx
   14013204f:	jae    140139380 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15da0>
   140132055:	mov    0x1d0(%rsp),%rax
   14013205d:	mov    0x1068(%rbx),%r8
   140132064:	mov    %rax,(%rsi)
   140132067:	mov    0x1c8(%rsp),%rax
   14013206f:	mov    %rax,0x8(%rsi)
   140132073:	mov    %rcx,%rsi
   140132076:	jmp    140124814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1234>
   14013207b:	mov    0x1050(%rbx),%rax
   140132082:	mov    0x1048(%rbx),%rdx
   140132089:	mov    %rsi,%rdi
   14013208c:	mov    %rax,%rcx
   14013208f:	sub    %rdx,%rdi
   140132092:	sub    %rdx,%rcx
   140132095:	sar    $0x3,%rcx
   140132099:	lea    (%rcx,%rcx,1),%r8
   14013209d:	cmp    %r8,%rcx
   1401320a0:	jb     140134b3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1155b>
   1401320a6:	vzeroupper
   1401320a9:	mov    0x1c8(%rsp),%r8
   1401320b1:	lea    0x8(%rsi),%rcx
   1401320b5:	mov    %r8,(%rsi)
   1401320b8:	jmp    140128d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5720>
   1401320bd:	test   %rax,%rax
   1401320c0:	setne  %al
   1401320c3:	jmp    14012f877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc297>
   1401320c8:	mov    0xa0(%rsp),%rdx
   1401320d0:	lea    0x1068(%rbx),%rcx
   1401320d7:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401320dc:	jmp    14012490e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132e>
   1401320e1:	test   %rax,%rax
   1401320e4:	setne  %al
   1401320e7:	jmp    14012f8a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c3>
   1401320ec:	movabs $0xfff8000000000000,%rax
   1401320f6:	mov    %rax,0x1c8(%rsp)
   1401320fe:	mov    $0x1,%r12d
   140132104:	jmp    14012fa0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc42f>
   140132109:	lea    0x15270(%rbx),%rcx
   140132110:	mov    %rbx,%rdx
   140132113:	vzeroupper
   140132116:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   14013211b:	jmp    14012a7ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x720e>
   140132120:	lea    0x308(%rsp),%rdx
   140132128:	lea    0x540(%rsp),%rcx
   140132130:	vzeroupper
   140132133:	call   14022b9d0 <setun::VMValue::as_object() const>
   140132138:	mov    0x548(%rsp),%rax
   140132140:	mov    0x540(%rsp),%rdi
   140132148:	mov    %rax,0x40(%rsp)
   14013214d:	test   %rdi,%rdi
   140132150:	je     14013468c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110ac>
   140132156:	test   %r12b,%r12b
   140132159:	je     14013472c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1114c>
   14013215f:	cmp    $0x1,%r12b
   140132163:	je     140138aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x154ce>
   140132169:	lea    0x8(%rsi),%rax
   14013216d:	cmp    0x30(%rsp),%rax
   140132172:	jae    140138b67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15587>
   140132178:	mov    0x1d0(%rsp),%rax
   140132180:	lea    0x310(%rsp),%rdx
   140132188:	lea    0x680(%rsp),%rcx
   140132190:	mov    %rax,(%rsi)
   140132193:	mov    0x1c8(%rsp),%rax
   14013219b:	mov    %rax,0x1d0(%rsp)
   1401321a3:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401321a8:	mov    %rdi,%rcx
   1401321ab:	lea    0x680(%rsp),%rdx
   1401321b3:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401321b8:	mov    0x680(%rsp),%rcx
   1401321c0:	mov    %rax,0x1c8(%rsp)
   1401321c8:	lea    0x690(%rsp),%rax
   1401321d0:	cmp    %rax,%rcx
   1401321d3:	je     1401321e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec06>
   1401321d5:	mov    0x690(%rsp),%rax
   1401321dd:	lea    0x1(%rax),%rdx
   1401321e1:	call   14034a160 <operator delete(void*, unsigned long long)>
   1401321e6:	add    $0x8,%rsi
   1401321ea:	mov    $0x2,%r12d
   1401321f0:	jmp    14012fa0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc42f>
   1401321f5:	mov    0x1050(%rbx),%rax
   1401321fc:	mov    0x1048(%rbx),%rdx
   140132203:	mov    %rsi,%r12
   140132206:	mov    %rax,%rcx
   140132209:	sub    %rdx,%r12
   14013220c:	sub    %rdx,%rcx
   14013220f:	sar    $0x3,%rcx
   140132213:	lea    (%rcx,%rcx,1),%r8
   140132217:	cmp    %r8,%rcx
   14013221a:	jb     140135be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12606>
   140132220:	vzeroupper
   140132223:	mov    0x1c8(%rsp),%r8
   14013222b:	lea    0x8(%rsi),%rcx
   14013222f:	mov    %r8,(%rsi)
   140132232:	jmp    140129a47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6467>
   140132237:	cmp    $0x2,%r12b
   14013223b:	je     140135021 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a41>
   140132241:	cmp    $0x1,%r12b
   140132245:	jne    140137d03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14723>
   14013224b:	mov    0x1048(%rbx),%rdx
   140132252:	mov    0x1050(%rbx),%rax
   140132259:	lea    0x8(%rsi),%r8
   14013225d:	cmp    0x30(%rsp),%r8
   140132262:	jae    140138c8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x156aa>
   140132268:	vzeroupper
   14013226b:	mov    %r8,%rcx
   14013226e:	mov    0x1c8(%rsp),%r8
   140132276:	mov    %r8,(%rsi)
   140132279:	sub    %rdx,%rcx
   14013227c:	sub    0x38(%rsp),%r14
   140132281:	sub    %rdx,%rax
   140132284:	mov    %rcx,%rsi
   140132287:	mov    %r14,0x1038(%rbx)
   14013228e:	sar    $0x3,%rsi
   140132292:	cmp    %rcx,%rax
   140132295:	jae    1401322a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecc7>
   140132297:	lea    (%rsi,%rsi,1),%rdx
   14013229b:	lea    0x1048(%rbx),%rcx
   1401322a2:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401322a7:	mov    %rsi,0x1060(%rbx)
   1401322ae:	vmovdqa 0x23c8ca(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   1401322b6:	mov    $0x10,%ecx
   1401322bb:	movb   $0x0,0x153a0(%rbx)
   1401322c2:	vmovdqa %xmm0,0x15390(%rbx)
   1401322ca:	call   14034a310 <__cxa_allocate_exception>
   1401322cf:	lea    0x23bf92(%rip),%rdx        # 14036e268 <.rdata+0xbe8>
   1401322d6:	lea    0x680(%rsp),%rcx
   1401322de:	mov    %rax,%rsi
   1401322e1:	call   140104cd0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string<std::allocator<char> >(char const*, std::allocator<char> const&) [clone .isra.0]>
   1401322e6:	lea    0x680(%rsp),%rdx
   1401322ee:	mov    %rsi,%rcx
   1401322f1:	call   1402e06a0 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   1401322f6:	lea    0x258a43(%rip),%rax        # 14038ad40 <vtable for setun::VMException+0x10>
   1401322fd:	mov    0x680(%rsp),%rcx
   140132305:	mov    %rax,(%rsi)
   140132308:	lea    0x690(%rsp),%rax
   140132310:	cmp    %rax,%rcx
   140132313:	je     1401371a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bc0>
   140132319:	mov    0x690(%rsp),%rax
   140132321:	lea    0x1(%rax),%rdx
   140132325:	call   14034a160 <operator delete(void*, unsigned long long)>
   14013232a:	jmp    1401371a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bc0>
   14013232f:	nop
   140132330:	test   %r12b,%r12b
   140132333:	jne    140133f92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109b2>
   140132339:	movabs $0xfff8000000000003,%rax
   140132343:	mov    %rax,0x1c8(%rsp)
   14013234b:	mov    $0x1,%r12d
   140132351:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   140132356:	cs nopw 0x0(%rax,%rax,1)
   140132360:	cmpb   $0x0,0x152c0(%rbx)
   140132367:	je     140132766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf186>
   14013236d:	mov    0x152c8(%rbx),%rcx
   140132374:	test   %rcx,%rcx
   140132377:	je     140132766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf186>
   14013237d:	mov    0x150c0(%rbx),%rax
   140132384:	mov    %rax,0x40(%rsp)
   140132389:	test   %rax,%rax
   14013238c:	je     1401323a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedc3>
   14013238e:	sub    $0x1,%rax
   140132392:	imul   $0x28,%rax,%rax
   140132396:	mov    0x10e0(%rbx,%rax,1),%rax
   14013239e:	mov    %rax,0x40(%rsp)
   1401323a3:	mov    0x40(%rsp),%rdx
   1401323a8:	movswq %r14w,%rax
   1401323ac:	vzeroupper
   1401323af:	lea    0x2(%rbp,%rax,1),%rdi
   1401323b4:	call   14017e360 <setun::JITManager::record_backedge(unsigned long long)>
   1401323b9:	mov    0x152c8(%rbx),%rdx
   1401323c0:	mov    0x40(%rsp),%r8
   1401323c5:	lea    0x540(%rsp),%rcx
   1401323cd:	call   14017dd00 <setun::JITManager::get_or_create(unsigned long long)>
   1401323d2:	mov    0x540(%rsp),%rax
   1401323da:	cmpb   $0x0,0xa8(%rax)
   1401323e1:	jne    140132422 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee42>
   1401323e3:	mov    0x152c8(%rbx),%rcx
   1401323ea:	mov    0x88(%rcx),%edx
   1401323f0:	cmp    %edx,0xac(%rax)
   1401323f6:	jae    140132406 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee26>
   1401323f8:	mov    0x8c(%rcx),%edx
   1401323fe:	cmp    %edx,0xb0(%rax)
   140132404:	jb     140132422 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee42>
   140132406:	mov    0x40(%rsp),%r8
   14013240b:	mov    0x8(%r15),%r9
   14013240f:	mov    %r15,%rdx
   140132412:	sub    (%r15),%r9
   140132415:	call   14017e480 <setun::JITManager::compile_function(setun::Chunk const&, unsigned long long, unsigned long long)>
   14013241a:	mov    0x540(%rsp),%rax
   140132422:	sub    0x38(%rsp),%rdi
   140132427:	mov    %rax,%rcx
   14013242a:	mov    %edi,%edx
   14013242c:	mov    %rdi,0x60(%rsp)
   140132431:	call   140227ee0 <setun::JITCodeObject::has_osr_entry(unsigned int) const>
   140132436:	mov    %rdi,%r9
   140132439:	test   %al,%al
   14013243b:	je     140132754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf174>
   140132441:	lea    0x680(%rsp),%r14
   140132449:	xor    %eax,%eax
   14013244b:	mov    $0x23,%ecx
   140132450:	mov    0x40(%rsp),%r8
   140132455:	mov    %r14,%rdi
   140132458:	rep stos %rax,(%rdi)
   14013245b:	mov    0x1068(%rbx),%rcx
   140132462:	movb   $0x1,0x788(%rsp)
   14013246a:	mov    %rbx,0x680(%rsp)
   140132472:	lea    (%rcx,%r13,8),%rdx
   140132476:	mov    %rdx,0x690(%rsp)
   14013247e:	mov    0x1070(%rbx),%rdx
   140132485:	sub    %rcx,%rdx
   140132488:	mov    0x1048(%rbx),%rcx
   14013248f:	sar    $0x3,%rdx
   140132493:	sub    %r13,%rdx
   140132496:	mov    %rcx,0x6a0(%rsp)
   14013249e:	mov    %rdx,0x698(%rsp)
   1401324a6:	mov    %rsi,%rdx
   1401324a9:	sub    %rcx,%rdx
   1401324ac:	mov    0x150c0(%rbx),%rcx
   1401324b3:	sar    $0x3,%rdx
   1401324b7:	mov    %rdx,0x6a8(%rsp)
   1401324bf:	imul   $0x28,%rcx,%rdx
   1401324c3:	test   %rcx,%rcx
   1401324c6:	mov    0x152c8(%rbx),%rcx
   1401324cd:	lea    0x1098(%rbx,%rdx,1),%rdx
   1401324d5:	cmove  %rax,%rdx
   1401324d9:	vmovq  %rdx,%xmm7
   1401324de:	mov    %rbx,%rdx
   1401324e1:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401324eb:	mov    %r14,0x152b8(%rbx)
   1401324f2:	mov    %r14,0x20(%rsp)
   1401324f7:	vmovdqa %xmm0,0x6b0(%rsp)
   140132500:	call   14017c0d0 <setun::JITManager::execute_osr(setun::VM*, unsigned long long, unsigned int, setun::JITFrame*)>
   140132505:	mov    %rax,%r14
   140132508:	mov    0x6c8(%rsp),%rdi
   140132510:	mov    0x6b8(%rsp),%rax
   140132518:	mov    0x548(%rsp),%rcx
   140132520:	mov    %rax,0x152b8(%rbx)
   140132527:	test   %rdi,%rdi
   14013252a:	jle    140138bb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155d5>
   140132530:	test   %rcx,%rcx
   140132533:	je     14013253a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef5a>
   140132535:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14013253a:	mov    0x38(%rsp),%rax
   14013253f:	mov    %edi,%edi
   140132541:	mov    0x1048(%rbx),%rdx
   140132548:	lea    (%rax,%rdi,1),%r14
   14013254c:	mov    0x1060(%rbx),%rax
   140132553:	lea    (%rdx,%rax,8),%rsi
   140132557:	cmpb   $0x0,0x1040(%rbx)
   14013255e:	je     14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   140132564:	movzbl (%r14),%eax
   140132568:	lea    0x2a0b31(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013256f:	lea    0x1(%r14),%rbp
   140132573:	jmp    *(%rdi,%rax,8)
   140132576:	mov    %r14,%rsi
   140132579:	test   %ax,%ax
   14013257c:	je     14012e8f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb310>
   140132582:	cmp    $0x1,%ax
   140132586:	je     14013259d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefbd>
   140132588:	cmp    $0x2,%ax
   14013258c:	jne    140130e08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd828>
   140132592:	jmp    140130f02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd922>
   140132597:	mov    %rsi,%r14
   14013259a:	xor    %r12d,%r12d
   14013259d:	lea    0x680(%rsp),%rcx
   1401325a5:	lea    0x330(%rsp),%rdx
   1401325ad:	vzeroupper
   1401325b0:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401325b5:	mov    0x680(%rsp),%rax
   1401325bd:	lea    0x338(%rsp),%rcx
   1401325c5:	mov    0x688(%rsp),%rsi
   1401325cd:	mov    0x690(%rsp),%edi
   1401325d4:	mov    %rax,0x40(%rsp)
   1401325d9:	call   140229aa0 <setun::VMValue::as_int() const>
   1401325de:	test   %rax,%rax
   1401325e1:	jne    140132c84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6a4>
   1401325e7:	test   %r12b,%r12b
   1401325ea:	je     140134fc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119e7>
   1401325f0:	cmp    $0x1,%r12b
   1401325f4:	je     140137e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14867>
   1401325fa:	lea    0x8(%r14),%r12
   1401325fe:	cmp    0x30(%rsp),%r12
   140132603:	jae    140137df5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14815>
   140132609:	mov    0x1d0(%rsp),%rax
   140132611:	mov    0x40(%rsp),%rdx
   140132616:	mov    %rax,(%r14)
   140132619:	mov    0x1c8(%rsp),%rax
   140132621:	mov    %rax,0x1d0(%rsp)
   140132629:	lea    0x540(%rsp),%rcx
   140132631:	mov    %r12,%r14
   140132634:	mov    $0x2,%r12d
   14013263a:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14013263f:	mov    0x540(%rsp),%rax
   140132647:	mov    %rax,0x1c8(%rsp)
   14013264f:	mov    %r14,%rsi
   140132652:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140132657:	shr    $0x20,%rax
   14013265b:	mov    %eax,%r8d
   14013265e:	test   %ax,%ax
   140132661:	je     140131f8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9ad>
   140132667:	movabs $0xfffd000100000000,%rax
   140132671:	cmp    %rax,%rcx
   140132674:	je     14012c26d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c8d>
   14013267a:	cmp    $0x1,%r8w
   14013267f:	jne    140128332 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d52>
   140132685:	jmp    14012c26d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c8d>
   14013268a:	mov    0x1048(%rbx),%rdx
   140132691:	lea    0x8(%rsi),%r8
   140132695:	cmp    0x30(%rsp),%r8
   14013269a:	jae    140137cb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146d2>
   1401326a0:	mov    0x1c8(%rsp),%rax
   1401326a8:	mov    %rax,(%rsi)
   1401326ab:	mov    %r8,%rsi
   1401326ae:	mov    0x1068(%rbx),%r8
   1401326b5:	jmp    140124814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1234>
   1401326ba:	cmp    $0x1,%rax
   1401326be:	je     14013673f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1315f>
   1401326c4:	cmp    $0x2,%rax
   1401326c8:	je     1401366cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130ed>
   1401326ce:	test   %r12b,%r12b
   1401326d1:	je     140129f0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x692e>
   1401326d7:	sub    $0x1,%r12b
   1401326db:	je     1401310a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdac3>
   1401326e1:	lea    0x8(%rsi),%r8
   1401326e5:	cmp    0x30(%rsp),%r8
   1401326ea:	jb     14012e585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa5>
   1401326f0:	mov    0x1050(%rbx),%rax
   1401326f7:	mov    0x1048(%rbx),%rdx
   1401326fe:	mov    %rax,0x30(%rsp)
   140132703:	sub    %rdx,%rax
   140132706:	sar    $0x3,%rax
   14013270a:	lea    (%rax,%rax,1),%rcx
   14013270e:	cmp    %rcx,%rax
   140132711:	jae    14012e585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa5>
   140132717:	sub    %rdx,%rsi
   14013271a:	mov    %rcx,%rdx
   14013271d:	lea    0x1048(%rbx),%rcx
   140132724:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132729:	mov    0x1050(%rbx),%rax
   140132730:	add    0x1048(%rbx),%rsi
   140132737:	lea    0x8(%rsi),%r8
   14013273b:	mov    %rax,0x30(%rsp)
   140132740:	jmp    14012e585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa5>
   140132745:	mov    0x1068(%rbx),%r8
   14013274c:	mov    %rsi,%rax
   14013274f:	jmp    1401247f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1218>
   140132754:	mov    0x548(%rsp),%rcx
   14013275c:	test   %rcx,%rcx
   14013275f:	je     140132766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf186>
   140132761:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140132766:	movswl %r14w,%eax
   14013276a:	add    $0x2,%eax
   14013276d:	cltq
   14013276f:	lea    0x0(%rbp,%rax,1),%r14
   140132774:	cmpb   $0x0,0x1040(%rbx)
   14013277b:	jne    1401244f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf19>
   140132781:	jmp    14012a25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c7f>
   140132786:	shr    $0x20,%rax
   14013278a:	mov    %eax,%r8d
   14013278d:	test   %ax,%ax
   140132790:	je     140131ed5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8f5>
   140132796:	movabs $0xfffd000100000000,%rax
   1401327a0:	cmp    %rax,%rcx
   1401327a3:	je     14012bf17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8937>
   1401327a9:	cmp    $0x1,%r8w
   1401327ae:	jne    1401285ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x500a>
   1401327b4:	jmp    14012bf17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8937>
   1401327b9:	shr    $0x20,%rax
   1401327bd:	mov    %eax,%r8d
   1401327c0:	test   %ax,%ax
   1401327c3:	je     140131e1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe83d>
   1401327c9:	movabs $0xfffd000100000000,%rax
   1401327d3:	cmp    %rax,%rcx
   1401327d6:	je     14012c034 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a54>
   1401327dc:	cmp    $0x1,%r8w
   1401327e1:	jne    1401281d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bf7>
   1401327e7:	jmp    14012c034 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a54>
   1401327ec:	lea    0x330(%rsp),%rcx
   1401327f4:	vzeroupper
   1401327f7:	call   14022b1c0 <setun::VMValue::payload() const>
   1401327fc:	mov    0x58(%rax),%rdi
   140132800:	test   %rdi,%rdi
   140132803:	je     140132815 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf235>
   140132805:	mov    %rdi,%rcx
   140132808:	call   140152d30 <setun::ArrayObject::empty() const>
   14013280d:	test   %al,%al
   14013280f:	je     140134d5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1177d>
   140132815:	mov    %rsi,%r14
   140132818:	movabs $0xfff8000000000000,%rax
   140132822:	mov    %r14,%rsi
   140132825:	mov    %rax,0x1c8(%rsp)
   14013282d:	jmp    140127d69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4789>
   140132832:	shr    $0x20,%rax
   140132836:	mov    %eax,%r8d
   140132839:	test   %ax,%ax
   14013283c:	je     140131c31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe651>
   140132842:	movabs $0xfffd000100000000,%rax
   14013284c:	cmp    %rax,%rcx
   14013284f:	je     14012bdfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140132855:	cmp    $0x1,%r8w
   14013285a:	jne    140128745 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5165>
   140132860:	jmp    14012bdfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x881a>
   140132865:	mov    0x1048(%rbx),%rdx
   14013286c:	mov    %rsi,%rax
   14013286f:	sub    %rdx,%rax
   140132872:	mov    %rax,0x40(%rsp)
   140132877:	mov    0x1050(%rbx),%rax
   14013287e:	mov    %rax,0x30(%rsp)
   140132883:	sub    %rdx,%rax
   140132886:	sar    $0x3,%rax
   14013288a:	lea    (%rax,%rax,1),%rdx
   14013288e:	cmp    %rdx,%rax
   140132891:	jae    14012426b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8b>
   140132897:	lea    0x1048(%rbx),%rcx
   14013289e:	vzeroupper
   1401328a1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401328a6:	mov    0x1050(%rbx),%rax
   1401328ad:	mov    0x40(%rsp),%rsi
   1401328b2:	add    0x1048(%rbx),%rsi
   1401328b9:	mov    %rax,0x30(%rsp)
   1401328be:	lea    0x8(%rsi),%r8
   1401328c2:	jmp    14012426e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8e>
   1401328c7:	test   %r12b,%r12b
   1401328ca:	jne    14013363c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1005c>
   1401328d0:	mov    0x60(%rdi),%rcx
   1401328d4:	mov    0x50(%rdi),%rdx
   1401328d8:	xor    %eax,%eax
   1401328da:	sub    0x48(%rdi),%rdx
   1401328de:	sar    $0x3,%rdx
   1401328e2:	test   %rcx,%rcx
   1401328e5:	je     1401328eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf30b>
   1401328e7:	mov    0x18(%rcx),%rax
   1401328eb:	add    %rax,%rdx
   1401328ee:	lea    0x680(%rsp),%rcx
   1401328f6:	mov    $0x1,%r12d
   1401328fc:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140132901:	mov    0x680(%rsp),%rax
   140132909:	mov    %rax,0x1c8(%rsp)
   140132911:	cmpb   $0x0,0x1040(%rbx)
   140132918:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   14013291e:	movzbl 0x2(%rbp),%eax
   140132922:	lea    0x2a0777(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140132929:	add    $0x3,%rbp
   14013292d:	mov    (%rdi,%rax,8),%rax
   140132931:	jmp    *%rax
   140132933:	shr    $0x20,%rax
   140132937:	mov    %eax,%r8d
   14013293a:	test   %ax,%ax
   14013293d:	je     140131d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe78f>
   140132943:	movabs $0xfffd000100000000,%rax
   14013294d:	cmp    %rax,%rcx
   140132950:	je     14012c14f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b6f>
   140132956:	cmp    $0x1,%r8w
   14013295b:	jne    14012848d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ead>
   140132961:	jmp    14012c14f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b6f>
   140132966:	movzbl %r14b,%eax
   14013296a:	mov    %rsi,%rdx
   14013296d:	shl    $0x3,%rax
   140132971:	sub    %rax,%rdx
   140132974:	movabs $0xffffffff00000000,%rax
   14013297e:	mov    (%rdx),%rcx
   140132981:	movabs $0xfffd000200000000,%rdx
   14013298b:	and    %rcx,%rax
   14013298e:	cmp    %rdx,%rax
   140132991:	je     14012fde7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc807>
   140132997:	vzeroupper
   14013299a:	jmp    14012a4c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ee3>
   14013299f:	mov    0x1048(%rbx),%rdx
   1401329a6:	mov    %rsi,%rax
   1401329a9:	sub    %rdx,%rax
   1401329ac:	mov    %rax,0x40(%rsp)
   1401329b1:	mov    0x1050(%rbx),%rax
   1401329b8:	mov    %rax,0x30(%rsp)
   1401329bd:	sub    %rdx,%rax
   1401329c0:	sar    $0x3,%rax
   1401329c4:	lea    (%rax,%rax,1),%rdx
   1401329c8:	cmp    %rdx,%rax
   1401329cb:	jae    140128888 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52a8>
   1401329d1:	vmovdqa %xmm0,0x60(%rsp)
   1401329d7:	lea    0x1048(%rbx),%rcx
   1401329de:	vzeroupper
   1401329e1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401329e6:	mov    0x1050(%rbx),%rax
   1401329ed:	mov    0x40(%rsp),%rsi
   1401329f2:	add    0x1048(%rbx),%rsi
   1401329f9:	vmovdqa 0x60(%rsp),%xmm0
   1401329ff:	mov    %rax,0x30(%rsp)
   140132a04:	lea    0x8(%rsi),%r8
   140132a08:	jmp    14012888b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52ab>
   140132a0d:	mov    0x1050(%rbx),%rax
   140132a14:	mov    0x1048(%rbx),%rdx
   140132a1b:	mov    %rsi,%r12
   140132a1e:	mov    %rax,%rcx
   140132a21:	sub    %rdx,%r12
   140132a24:	sub    %rdx,%rcx
   140132a27:	sar    $0x3,%rcx
   140132a2b:	lea    (%rcx,%rcx,1),%r8
   140132a2f:	cmp    %r8,%rcx
   140132a32:	jb     1401354e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f06>
   140132a38:	vzeroupper
   140132a3b:	mov    0x1d0(%rsp),%rcx
   140132a43:	lea    0x10(%rsi),%r8
   140132a47:	mov    %rcx,(%rsi)
   140132a4a:	mov    0x1c8(%rsp),%rcx
   140132a52:	mov    %rcx,0x8(%rsi)
   140132a56:	jmp    14012b0bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7adb>
   140132a5b:	mov    0x1050(%rbx),%rax
   140132a62:	mov    0x1048(%rbx),%rdx
   140132a69:	mov    %rsi,%r12
   140132a6c:	mov    %rax,%rcx
   140132a6f:	sub    %rdx,%r12
   140132a72:	sub    %rdx,%rcx
   140132a75:	sar    $0x3,%rcx
   140132a79:	lea    (%rcx,%rcx,1),%r8
   140132a7d:	cmp    %r8,%rcx
   140132a80:	jb     1401359bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123db>
   140132a86:	vzeroupper
   140132a89:	mov    0x1d0(%rsp),%rcx
   140132a91:	lea    0x10(%rsi),%r8
   140132a95:	mov    %rcx,(%rsi)
   140132a98:	mov    0x1c8(%rsp),%rcx
   140132aa0:	mov    %rcx,0x8(%rsi)
   140132aa4:	jmp    14012b464 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e84>
   140132aa9:	mov    0x1050(%rbx),%rax
   140132ab0:	mov    0x1048(%rbx),%rdx
   140132ab7:	mov    %rsi,%r12
   140132aba:	mov    %rax,%rcx
   140132abd:	sub    %rdx,%r12
   140132ac0:	sub    %rdx,%rcx
   140132ac3:	sar    $0x3,%rcx
   140132ac7:	lea    (%rcx,%rcx,1),%r8
   140132acb:	cmp    %r8,%rcx
   140132ace:	jb     14013652b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f4b>
   140132ad4:	vzeroupper
   140132ad7:	mov    0x1d0(%rsp),%rcx
   140132adf:	lea    0x10(%rsi),%r8
   140132ae3:	mov    %rcx,(%rsi)
   140132ae6:	mov    0x1c8(%rsp),%rcx
   140132aee:	mov    %rcx,0x8(%rsi)
   140132af2:	jmp    14012b911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8331>
   140132af7:	mov    0x1050(%rbx),%rax
   140132afe:	mov    0x1048(%rbx),%rdx
   140132b05:	mov    %rsi,%r12
   140132b08:	mov    %rax,%rcx
   140132b0b:	sub    %rdx,%r12
   140132b0e:	sub    %rdx,%rcx
   140132b11:	sar    $0x3,%rcx
   140132b15:	lea    (%rcx,%rcx,1),%r8
   140132b19:	cmp    %r8,%rcx
   140132b1c:	jb     140136554 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f74>
   140132b22:	vzeroupper
   140132b25:	mov    0x1d0(%rsp),%rcx
   140132b2d:	lea    0x10(%rsi),%r8
   140132b31:	mov    %rcx,(%rsi)
   140132b34:	mov    0x1c8(%rsp),%rcx
   140132b3c:	mov    %rcx,0x8(%rsi)
   140132b40:	jmp    14012bb6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x858d>
   140132b45:	mov    0x1050(%rbx),%rax
   140132b4c:	mov    0x1048(%rbx),%rdx
   140132b53:	mov    %rsi,%r12
   140132b56:	mov    %rax,%rcx
   140132b59:	sub    %rdx,%r12
   140132b5c:	sub    %rdx,%rcx
   140132b5f:	sar    $0x3,%rcx
   140132b63:	lea    (%rcx,%rcx,1),%r8
   140132b67:	cmp    %r8,%rcx
   140132b6a:	jb     14013657d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f9d>
   140132b70:	vzeroupper
   140132b73:	mov    0x1d0(%rsp),%rcx
   140132b7b:	lea    0x10(%rsi),%r8
   140132b7f:	mov    %rcx,(%rsi)
   140132b82:	mov    0x1c8(%rsp),%rcx
   140132b8a:	mov    %rcx,0x8(%rsi)
   140132b8e:	jmp    14012bbdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85fb>
   140132b93:	mov    0x1050(%rbx),%rax
   140132b9a:	mov    %rsi,%r12
   140132b9d:	sub    %rdx,%r12
   140132ba0:	mov    %rax,%r8
   140132ba3:	sub    %rdx,%r8
   140132ba6:	sar    $0x3,%r8
   140132baa:	lea    (%r8,%r8,1),%r9
   140132bae:	cmp    %r9,%r8
   140132bb1:	jb     1401365a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12fc6>
   140132bb7:	vzeroupper
   140132bba:	jmp    14012bc32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8652>
   140132bbf:	mov    0x1c8(%rsp),%rdx
   140132bc7:	mov    $0x1,%r12d
   140132bcd:	mov    %rdx,0x10(%rax,%r13,8)
   140132bd2:	mov    0x1d0(%rsp),%rax
   140132bda:	mov    %rax,0x1c8(%rsp)
   140132be2:	jmp    140130c10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd630>
   140132be7:	mov    0x1c8(%rsp),%rax
   140132bef:	sub    $0x8,%rsi
   140132bf3:	mov    %rax,0x3c0(%rsp)
   140132bfb:	mov    (%rsi),%rax
   140132bfe:	mov    %rax,0x3b8(%rsp)
   140132c06:	jmp    14012c555 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f75>
   140132c0b:	mov    0x1050(%rbx),%rax
   140132c12:	mov    0x1048(%rbx),%rdx
   140132c19:	mov    %rsi,%r12
   140132c1c:	mov    %rax,%rcx
   140132c1f:	sub    %rdx,%r12
   140132c22:	sub    %rdx,%rcx
   140132c25:	sar    $0x3,%rcx
   140132c29:	lea    (%rcx,%rcx,1),%r8
   140132c2d:	cmp    %r8,%rcx
   140132c30:	jb     1401352f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d14>
   140132c36:	vzeroupper
   140132c39:	mov    0x1d0(%rsp),%rcx
   140132c41:	lea    0x10(%rsi),%r8
   140132c45:	mov    %rcx,(%rsi)
   140132c48:	mov    0x1c8(%rsp),%rcx
   140132c50:	mov    %rcx,0x8(%rsi)
   140132c54:	jmp    14012b97f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x839f>
   140132c59:	mov    0x1c8(%rsp),%rax
   140132c61:	mov    $0x1,%r12d
   140132c67:	mov    %rax,0x300(%rsp)
   140132c6f:	mov    0x1d0(%rsp),%rax
   140132c77:	mov    %rax,0x1c8(%rsp)
   140132c7f:	jmp    14012c2d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cf8>
   140132c84:	cmp    $0x1,%rax
   140132c88:	je     140135db7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127d7>
   140132c8e:	cmp    $0x2,%rax
   140132c92:	je     140135cc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126e3>
   140132c98:	test   %r12b,%r12b
   140132c9b:	jne    14013505d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a7d>
   140132ca1:	mov    $0x1fff,%eax
   140132ca6:	mov    $0x1,%r12d
   140132cac:	shl    $0x33,%rax
   140132cb0:	mov    %rax,0x1c8(%rsp)
   140132cb8:	jmp    14013264f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf06f>
   140132cbd:	mov    0x1048(%rbx),%rdx
   140132cc4:	mov    %rsi,%rax
   140132cc7:	sub    %rdx,%rax
   140132cca:	mov    %rax,0x40(%rsp)
   140132ccf:	mov    0x1050(%rbx),%rax
   140132cd6:	mov    %rax,0x30(%rsp)
   140132cdb:	sub    %rdx,%rax
   140132cde:	sar    $0x3,%rax
   140132ce2:	lea    (%rax,%rax,1),%rdx
   140132ce6:	cmp    %rdx,%rax
   140132ce9:	jae    140128955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5375>
   140132cef:	lea    0x1048(%rbx),%rcx
   140132cf6:	vzeroupper
   140132cf9:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132cfe:	mov    0x1050(%rbx),%rax
   140132d05:	mov    0x40(%rsp),%rsi
   140132d0a:	add    0x1048(%rbx),%rsi
   140132d11:	mov    %rax,0x30(%rsp)
   140132d16:	lea    0x8(%rsi),%r8
   140132d1a:	jmp    140128955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5375>
   140132d1f:	mov    0x1c8(%rsp),%rax
   140132d27:	sub    $0x8,%rsi
   140132d2b:	mov    %rax,0x2f0(%rsp)
   140132d33:	mov    (%rsi),%rax
   140132d36:	mov    %rax,0x2e8(%rsp)
   140132d3e:	mov    %rax,%rdx
   140132d41:	jmp    14012ca6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x948a>
   140132d46:	mov    0x1c8(%rsp),%rax
   140132d4e:	mov    $0x1,%r12d
   140132d54:	mov    %rax,0x2f8(%rsp)
   140132d5c:	mov    0x1d0(%rsp),%rax
   140132d64:	mov    %rax,0x1c8(%rsp)
   140132d6c:	jmp    14012a844 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7264>
   140132d71:	mov    0x1c8(%rsp),%rax
   140132d79:	sub    $0x8,%rsi
   140132d7d:	mov    %rax,0x230(%rsp)
   140132d85:	mov    (%rsi),%rax
   140132d88:	mov    %rax,0x228(%rsp)
   140132d90:	jmp    14013163b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe05b>
   140132d95:	mov    0x1c8(%rsp),%rax
   140132d9d:	sub    $0x8,%rsi
   140132da1:	mov    %rax,0x290(%rsp)
   140132da9:	mov    (%rsi),%rax
   140132dac:	mov    %rax,0x288(%rsp)
   140132db4:	jmp    14012d729 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa149>
   140132db9:	mov    0x1050(%rbx),%rcx
   140132dc0:	mov    0x1048(%rbx),%rax
   140132dc7:	mov    %rcx,0x30(%rsp)
   140132dcc:	sub    %rax,%rcx
   140132dcf:	sar    $0x3,%rcx
   140132dd3:	lea    (%rcx,%rcx,1),%rdx
   140132dd7:	cmp    %rdx,%rcx
   140132dda:	jae    14012deab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8cb>
   140132de0:	lea    0x1048(%rbx),%rcx
   140132de7:	sub    %rax,%rsi
   140132dea:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132def:	mov    0x1050(%rbx),%rax
   140132df6:	add    0x1048(%rbx),%rsi
   140132dfd:	lea    0x8(%rsi),%r8
   140132e01:	mov    %rax,0x30(%rsp)
   140132e06:	jmp    14012deab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8cb>
   140132e0b:	mov    0x1050(%rbx),%rax
   140132e12:	mov    0x1048(%rbx),%rdx
   140132e19:	mov    %rsi,%r12
   140132e1c:	mov    %rax,%rcx
   140132e1f:	sub    %rdx,%r12
   140132e22:	sub    %rdx,%rcx
   140132e25:	sar    $0x3,%rcx
   140132e29:	lea    (%rcx,%rcx,1),%r8
   140132e2d:	cmp    %r8,%rcx
   140132e30:	jb     140136842 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13262>
   140132e36:	vzeroupper
   140132e39:	mov    0x1d0(%rsp),%rcx
   140132e41:	lea    0x10(%rsi),%r8
   140132e45:	mov    %rcx,(%rsi)
   140132e48:	mov    0x1c8(%rsp),%rcx
   140132e50:	mov    %rcx,0x8(%rsi)
   140132e54:	jmp    14012b2cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cef>
   140132e59:	mov    0x1c8(%rsp),%rax
   140132e61:	sub    $0x8,%rsi
   140132e65:	mov    %rax,0x360(%rsp)
   140132e6d:	mov    (%rsi),%rax
   140132e70:	mov    %rax,0x358(%rsp)
   140132e78:	jmp    14012cdbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97dc>
   140132e7d:	mov    0x1050(%rbx),%rax
   140132e84:	mov    0x1048(%rbx),%rdx
   140132e8b:	mov    %rsi,%r12
   140132e8e:	mov    %rax,%rcx
   140132e91:	sub    %rdx,%r12
   140132e94:	sub    %rdx,%rcx
   140132e97:	sar    $0x3,%rcx
   140132e9b:	lea    (%rcx,%rcx,1),%r8
   140132e9f:	cmp    %r8,%rcx
   140132ea2:	jb     140136664 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13084>
   140132ea8:	vzeroupper
   140132eab:	mov    0x1d0(%rsp),%rcx
   140132eb3:	lea    0x10(%rsi),%r8
   140132eb7:	mov    %rcx,(%rsi)
   140132eba:	mov    0x1c8(%rsp),%rcx
   140132ec2:	mov    %rcx,0x8(%rsi)
   140132ec6:	jmp    14012b197 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bb7>
   140132ecb:	mov    0x1050(%rbx),%rax
   140132ed2:	mov    0x1048(%rbx),%rdx
   140132ed9:	mov    %rsi,%r12
   140132edc:	mov    %rax,%rcx
   140132edf:	sub    %rdx,%r12
   140132ee2:	sub    %rdx,%rcx
   140132ee5:	sar    $0x3,%rcx
   140132ee9:	lea    (%rcx,%rcx,1),%r8
   140132eed:	cmp    %r8,%rcx
   140132ef0:	jb     1401361cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bed>
   140132ef6:	vzeroupper
   140132ef9:	mov    0x1d0(%rsp),%rcx
   140132f01:	lea    0x10(%rsi),%r8
   140132f05:	mov    %rcx,(%rsi)
   140132f08:	mov    0x1c8(%rsp),%rcx
   140132f10:	mov    %rcx,0x8(%rsi)
   140132f14:	jmp    14012b267 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c87>
   140132f19:	mov    0x1050(%rbx),%rax
   140132f20:	mov    0x1048(%rbx),%rdx
   140132f27:	mov    %rsi,%r12
   140132f2a:	mov    %rax,%rcx
   140132f2d:	sub    %rdx,%r12
   140132f30:	sub    %rdx,%rcx
   140132f33:	sar    $0x3,%rcx
   140132f37:	lea    (%rcx,%rcx,1),%r8
   140132f3b:	cmp    %r8,%rcx
   140132f3e:	jb     140135b86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125a6>
   140132f44:	vzeroupper
   140132f47:	mov    0x1d0(%rsp),%rcx
   140132f4f:	lea    0x10(%rsi),%r8
   140132f53:	mov    %rcx,(%rsi)
   140132f56:	mov    0x1c8(%rsp),%rcx
   140132f5e:	mov    %rcx,0x8(%rsi)
   140132f62:	jmp    14012afdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ff>
   140132f67:	mov    0x1050(%rbx),%rax
   140132f6e:	mov    0x1048(%rbx),%rdx
   140132f75:	mov    %rsi,%r12
   140132f78:	mov    %rax,%rcx
   140132f7b:	sub    %rdx,%r12
   140132f7e:	sub    %rdx,%rcx
   140132f81:	sar    $0x3,%rcx
   140132f85:	lea    (%rcx,%rcx,1),%r8
   140132f89:	cmp    %r8,%rcx
   140132f8c:	jb     14013693e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1335e>
   140132f92:	vzeroupper
   140132f95:	mov    0x1d0(%rsp),%rcx
   140132f9d:	lea    0x10(%rsi),%r8
   140132fa1:	mov    %rcx,(%rsi)
   140132fa4:	mov    0x1c8(%rsp),%rcx
   140132fac:	mov    %rcx,0x8(%rsi)
   140132fb0:	jmp    14012b04d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a6d>
   140132fb5:	mov    0x1050(%rbx),%rax
   140132fbc:	mov    0x1048(%rbx),%rdx
   140132fc3:	mov    %rsi,%r12
   140132fc6:	mov    %rax,%rcx
   140132fc9:	sub    %rdx,%r12
   140132fcc:	sub    %rdx,%rcx
   140132fcf:	sar    $0x3,%rcx
   140132fd3:	lea    (%rcx,%rcx,1),%r8
   140132fd7:	cmp    %r8,%rcx
   140132fda:	jb     1401364ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ecd>
   140132fe0:	vzeroupper
   140132fe3:	mov    0x1d0(%rsp),%rcx
   140132feb:	lea    0x10(%rsi),%r8
   140132fef:	mov    %rcx,(%rsi)
   140132ff2:	mov    0x1c8(%rsp),%rcx
   140132ffa:	mov    %rcx,0x8(%rsi)
   140132ffe:	jmp    14012ac87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76a7>
   140133003:	mov    0x1050(%rbx),%rax
   14013300a:	mov    0x1048(%rbx),%rdx
   140133011:	mov    %rsi,%r12
   140133014:	mov    %rax,%rcx
   140133017:	sub    %rdx,%r12
   14013301a:	sub    %rdx,%rcx
   14013301d:	sar    $0x3,%rcx
   140133021:	lea    (%rcx,%rcx,1),%r8
   140133025:	cmp    %r8,%rcx
   140133028:	jb     1401368ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1330c>
   14013302e:	vzeroupper
   140133031:	mov    0x1d0(%rsp),%rcx
   140133039:	lea    0x10(%rsi),%r8
   14013303d:	mov    %rcx,(%rsi)
   140133040:	mov    0x1c8(%rsp),%rcx
   140133048:	mov    %rcx,0x8(%rsi)
   14013304c:	jmp    14012adc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77e5>
   140133051:	mov    0x1c8(%rsp),%rdx
   140133059:	mov    $0x1,%r12d
   14013305f:	mov    %rdx,(%rax,%rdi,8)
   140133063:	mov    0x1d0(%rsp),%rax
   14013306b:	mov    %rax,0x1c8(%rsp)
   140133073:	jmp    1401274de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3efe>
   140133078:	mov    0x1050(%rbx),%rax
   14013307f:	mov    0x1048(%rbx),%rdx
   140133086:	mov    %rsi,%r12
   140133089:	mov    %rax,%rcx
   14013308c:	sub    %rdx,%r12
   14013308f:	sub    %rdx,%rcx
   140133092:	sar    $0x3,%rcx
   140133096:	lea    (%rcx,%rcx,1),%r8
   14013309a:	cmp    %r8,%rcx
   14013309d:	jb     14013668d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130ad>
   1401330a3:	vzeroupper
   1401330a6:	mov    0x1d0(%rsp),%rcx
   1401330ae:	lea    0x10(%rsi),%r8
   1401330b2:	mov    %rcx,(%rsi)
   1401330b5:	mov    0x1c8(%rsp),%rcx
   1401330bd:	mov    %rcx,0x8(%rsi)
   1401330c1:	jmp    14012acf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7715>
   1401330c6:	mov    0x1050(%rbx),%rax
   1401330cd:	mov    0x1048(%rbx),%rdx
   1401330d4:	mov    %rsi,%r12
   1401330d7:	mov    %rax,%rcx
   1401330da:	sub    %rdx,%r12
   1401330dd:	sub    %rdx,%rcx
   1401330e0:	sar    $0x3,%rcx
   1401330e4:	lea    (%rcx,%rcx,1),%r8
   1401330e8:	cmp    %r8,%rcx
   1401330eb:	jb     1401350b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ad0>
   1401330f1:	vzeroupper
   1401330f4:	mov    0x1d0(%rsp),%rcx
   1401330fc:	lea    0x10(%rsi),%r8
   140133100:	mov    %rcx,(%rsi)
   140133103:	mov    0x1c8(%rsp),%rcx
   14013310b:	mov    %rcx,0x8(%rsi)
   14013310f:	jmp    14012ae9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78bb>
   140133114:	mov    0x1050(%rbx),%rax
   14013311b:	mov    0x1048(%rbx),%rdx
   140133122:	mov    %rsi,%r12
   140133125:	mov    %rax,%rcx
   140133128:	sub    %rdx,%r12
   14013312b:	sub    %rdx,%rcx
   14013312e:	sar    $0x3,%rcx
   140133132:	lea    (%rcx,%rcx,1),%r8
   140133136:	cmp    %r8,%rcx
   140133139:	jb     14013645b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e7b>
   14013313f:	vzeroupper
   140133142:	mov    0x1d0(%rsp),%rcx
   14013314a:	lea    0x10(%rsi),%r8
   14013314e:	mov    %rcx,(%rsi)
   140133151:	mov    0x1c8(%rsp),%rcx
   140133159:	mov    %rcx,0x8(%rsi)
   14013315d:	jmp    14012ba91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84b1>
   140133162:	mov    0x1050(%rbx),%rax
   140133169:	mov    0x1048(%rbx),%rdx
   140133170:	mov    %rsi,%r12
   140133173:	mov    %rax,%rcx
   140133176:	sub    %rdx,%r12
   140133179:	sub    %rdx,%rcx
   14013317c:	sar    $0x3,%rcx
   140133180:	lea    (%rcx,%rcx,1),%r8
   140133184:	cmp    %r8,%rcx
   140133187:	jb     140136316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d36>
   14013318d:	vzeroupper
   140133190:	mov    0x1d0(%rsp),%rcx
   140133198:	lea    0x10(%rsi),%r8
   14013319c:	mov    %rcx,(%rsi)
   14013319f:	mov    0x1c8(%rsp),%rcx
   1401331a7:	mov    %rcx,0x8(%rsi)
   1401331ab:	jmp    14012ab09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7529>
   1401331b0:	mov    0x1048(%rbx),%rdx
   1401331b7:	mov    0x1050(%rbx),%rax
   1401331be:	mov    %rsi,%r14
   1401331c1:	mov    %rax,0x30(%rsp)
   1401331c6:	sub    %rdx,%rax
   1401331c9:	sub    %rdx,%r14
   1401331cc:	sar    $0x3,%rax
   1401331d0:	lea    (%rax,%rax,1),%rdx
   1401331d4:	cmp    %rdx,%rax
   1401331d7:	jae    14012a06c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a8c>
   1401331dd:	lea    0x1048(%rbx),%rcx
   1401331e4:	vzeroupper
   1401331e7:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401331ec:	mov    0x1048(%rbx),%rsi
   1401331f3:	mov    0x1050(%rbx),%rax
   1401331fa:	add    %r14,%rsi
   1401331fd:	mov    %rax,0x30(%rsp)
   140133202:	lea    0x8(%rsi),%r8
   140133206:	jmp    14012a06c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a8c>
   14013320b:	mov    0x1048(%rbx),%rdx
   140133212:	mov    0x1050(%rbx),%rax
   140133219:	mov    %rsi,%r12
   14013321c:	mov    %rax,0x30(%rsp)
   140133221:	sub    %rdx,%rax
   140133224:	sub    %rdx,%r12
   140133227:	sar    $0x3,%rax
   14013322b:	lea    (%rax,%rax,1),%rdx
   14013322f:	cmp    %rdx,%rax
   140133232:	jae    14012abbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75dd>
   140133238:	lea    0x1048(%rbx),%rcx
   14013323f:	vzeroupper
   140133242:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133247:	mov    0x1048(%rbx),%rsi
   14013324e:	mov    0x1050(%rbx),%rax
   140133255:	add    %r12,%rsi
   140133258:	mov    %rax,0x30(%rsp)
   14013325d:	lea    0x10(%rsi),%rcx
   140133261:	jmp    14012abc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75e0>
   140133266:	mov    0x1050(%rbx),%rax
   14013326d:	mov    0x1048(%rbx),%rdx
   140133274:	mov    %rsi,%r12
   140133277:	mov    %rax,%rcx
   14013327a:	sub    %rdx,%r12
   14013327d:	sub    %rdx,%rcx
   140133280:	sar    $0x3,%rcx
   140133284:	lea    (%rcx,%rcx,1),%r8
   140133288:	cmp    %r8,%rcx
   14013328b:	jb     1401365d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ff3>
   140133291:	vzeroupper
   140133294:	mov    0x1d0(%rsp),%rcx
   14013329c:	lea    0x10(%rsi),%r8
   1401332a0:	mov    %rcx,(%rsi)
   1401332a3:	mov    0x1c8(%rsp),%rcx
   1401332ab:	mov    %rcx,0x8(%rsi)
   1401332af:	jmp    14012af03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7923>
   1401332b4:	mov    0x1048(%rbx),%rdx
   1401332bb:	mov    %rsi,%rax
   1401332be:	sub    %rdx,%rax
   1401332c1:	mov    %rax,0x40(%rsp)
   1401332c6:	mov    0x1050(%rbx),%rax
   1401332cd:	mov    %rax,0x30(%rsp)
   1401332d2:	sub    %rdx,%rax
   1401332d5:	sar    $0x3,%rax
   1401332d9:	lea    (%rax,%rax,1),%rdx
   1401332dd:	cmp    %rdx,%rax
   1401332e0:	jae    140127083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3aa3>
   1401332e6:	lea    0x1048(%rbx),%rcx
   1401332ed:	vzeroupper
   1401332f0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401332f5:	mov    0x1050(%rbx),%rax
   1401332fc:	mov    0x40(%rsp),%rsi
   140133301:	add    0x1048(%rbx),%rsi
   140133308:	mov    %rax,0x30(%rsp)
   14013330d:	lea    0x8(%rsi),%r8
   140133311:	jmp    140127083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3aa3>
   140133316:	mov    0x1050(%rbx),%rax
   14013331d:	mov    0x1048(%rbx),%rdx
   140133324:	mov    %rsi,%r12
   140133327:	mov    %rax,%rcx
   14013332a:	sub    %rdx,%r12
   14013332d:	sub    %rdx,%rcx
   140133330:	sar    $0x3,%rcx
   140133334:	lea    (%rcx,%rcx,1),%r8
   140133338:	cmp    %r8,%rcx
   14013333b:	jb     140136915 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13335>
   140133341:	vzeroupper
   140133344:	mov    0x1d0(%rsp),%rcx
   14013334c:	lea    0x10(%rsi),%r8
   140133350:	mov    %rcx,(%rsi)
   140133353:	mov    0x1c8(%rsp),%rcx
   14013335b:	mov    %rcx,0x8(%rsi)
   14013335f:	jmp    14012b8a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82c9>
   140133364:	mov    0x1050(%rbx),%rax
   14013336b:	mov    0x1048(%rbx),%rdx
   140133372:	mov    %rsi,%r12
   140133375:	mov    %rax,%rcx
   140133378:	sub    %rdx,%r12
   14013337b:	sub    %rdx,%rcx
   14013337e:	sar    $0x3,%rcx
   140133382:	lea    (%rcx,%rcx,1),%r8
   140133386:	cmp    %r8,%rcx
   140133389:	jb     140136484 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ea4>
   14013338f:	vzeroupper
   140133392:	mov    0x1d0(%rsp),%rcx
   14013339a:	lea    0x10(%rsi),%r8
   14013339e:	mov    %rcx,(%rsi)
   1401333a1:	mov    0x1c8(%rsp),%rcx
   1401333a9:	mov    %rcx,0x8(%rsi)
   1401333ad:	jmp    14012a8bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72db>
   1401333b2:	mov    0x1050(%rbx),%rax
   1401333b9:	mov    0x1048(%rbx),%rdx
   1401333c0:	mov    %rsi,%r12
   1401333c3:	mov    %rax,%rcx
   1401333c6:	sub    %rdx,%r12
   1401333c9:	sub    %rdx,%rcx
   1401333cc:	sar    $0x3,%rcx
   1401333d0:	lea    (%rcx,%rcx,1),%r8
   1401333d4:	cmp    %r8,%rcx
   1401333d7:	jb     1401368c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132e3>
   1401333dd:	vzeroupper
   1401333e0:	mov    0x1d0(%rsp),%rcx
   1401333e8:	lea    0x10(%rsi),%r8
   1401333ec:	mov    %rcx,(%rsi)
   1401333ef:	mov    0x1c8(%rsp),%rcx
   1401333f7:	mov    %rcx,0x8(%rsi)
   1401333fb:	jmp    14012ae2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x784d>
   140133400:	movzwl 0x6(%rdi),%edx
   140133404:	lea    0x3f0(%rsp),%r8
   14013340c:	mov    %rax,%rcx
   14013340f:	mov    %rax,0x40(%rsp)
   140133414:	shl    $0x5,%rdx
   140133418:	add    0x30(%r15),%rdx
   14013341c:	mov    %rdx,0x60(%rsp)
   140133421:	call   140220700 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   140133426:	mov    0x40(%rsp),%rax
   14013342b:	mov    0x38(%rax),%r8
   14013342f:	test   %r8,%r8
   140133432:	je     1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   140133438:	lea    0x28(%r8),%r9
   14013343c:	mov    0x60(%rsp),%r8
   140133441:	lea    0x680(%rsp),%rcx
   140133449:	mov    %r9,%rdx
   14013344c:	call   1402316e0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133451:	mov    0x680(%rsp),%rdx
   140133459:	test   %rdx,%rdx
   14013345c:	je     1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   140133462:	mov    (%rdx),%rdx
   140133465:	test   %rdx,%rdx
   140133468:	je     1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   14013346e:	mov    0x40(%rsp),%rax
   140133473:	movzwl 0x28(%rdx),%edx
   140133477:	mov    0x38(%rax),%rax
   14013347b:	mov    (%rax),%eax
   14013347d:	mov    %dx,0x4(%rdi)
   140133481:	mov    %eax,(%rdi)
   140133483:	jmp    1401277b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41d7>
   140133488:	mov    0x1050(%rbx),%rax
   14013348f:	mov    0x1048(%rbx),%rdx
   140133496:	mov    %rsi,%r12
   140133499:	mov    %rax,%rcx
   14013349c:	sub    %rdx,%r12
   14013349f:	sub    %rdx,%rcx
   1401334a2:	sar    $0x3,%rcx
   1401334a6:	lea    (%rcx,%rcx,1),%r8
   1401334aa:	cmp    %r8,%rcx
   1401334ad:	jb     1401364d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ef6>
   1401334b3:	vzeroupper
   1401334b6:	mov    0x1d0(%rsp),%rcx
   1401334be:	lea    0x10(%rsi),%r8
   1401334c2:	mov    %rcx,(%rsi)
   1401334c5:	mov    0x1c8(%rsp),%rcx
   1401334cd:	mov    %rcx,0x8(%rsi)
   1401334d1:	jmp    14012b129 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b49>
   1401334d6:	mov    0x1050(%rbx),%rax
   1401334dd:	mov    0x1048(%rbx),%rdx
   1401334e4:	mov    %rsi,%r12
   1401334e7:	mov    %rax,%rcx
   1401334ea:	sub    %rdx,%r12
   1401334ed:	sub    %rdx,%rcx
   1401334f0:	sar    $0x3,%rcx
   1401334f4:	lea    (%rcx,%rcx,1),%r8
   1401334f8:	cmp    %r8,%rcx
   1401334fb:	jb     14013663b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1305b>
   140133501:	vzeroupper
   140133504:	mov    0x1d0(%rsp),%rcx
   14013350c:	lea    0x10(%rsi),%r8
   140133510:	mov    %rcx,(%rsi)
   140133513:	mov    0x1c8(%rsp),%rcx
   14013351b:	mov    %rcx,0x8(%rsi)
   14013351f:	jmp    14012b1ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c1f>
   140133524:	lea    0x680(%rsp),%rcx
   14013352c:	lea    0x23a60f(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   140133533:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140133538:	mov    0x680(%rsp),%rax
   140133540:	mov    %rax,0x1c8(%rsp)
   140133548:	mov    $0x1,%r12d
   14013354e:	jmp    14012d577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f97>
   140133553:	mov    0x1c8(%rsp),%rax
   14013355b:	sub    $0x8,%rsi
   14013355f:	mov    %rax,0x1e0(%rsp)
   140133567:	mov    (%rsi),%rax
   14013356a:	mov    %rax,0x1d8(%rsp)
   140133572:	jmp    14012cb88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95a8>
   140133577:	mov    0x1050(%rbx),%rax
   14013357e:	mov    0x1048(%rbx),%rdx
   140133585:	mov    %rsi,%r12
   140133588:	mov    %rax,%rcx
   14013358b:	sub    %rdx,%r12
   14013358e:	sub    %rdx,%rcx
   140133591:	sar    $0x3,%rcx
   140133595:	lea    (%rcx,%rcx,1),%r8
   140133599:	cmp    %r8,%rcx
   14013359c:	jb     140135131 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b51>
   1401335a2:	mov    0x1d0(%rsp),%rcx
   1401335aa:	lea    0x10(%rsi),%r8
   1401335ae:	mov    %rcx,(%rsi)
   1401335b1:	mov    0x1c8(%rsp),%rcx
   1401335b9:	mov    %rcx,0x8(%rsi)
   1401335bd:	jmp    14012bc82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86a2>
   1401335c2:	mov    0x1050(%rbx),%rax
   1401335c9:	mov    0x1048(%rbx),%rdx
   1401335d0:	mov    %rsi,%r12
   1401335d3:	mov    %rax,%rcx
   1401335d6:	sub    %rdx,%r12
   1401335d9:	sub    %rdx,%rcx
   1401335dc:	sar    $0x3,%rcx
   1401335e0:	lea    (%rcx,%rcx,1),%r8
   1401335e4:	cmp    %r8,%rcx
   1401335e7:	jb     140135d8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127ae>
   1401335ed:	vzeroupper
   1401335f0:	mov    0x1d0(%rsp),%rcx
   1401335f8:	lea    0x10(%rsi),%r8
   1401335fc:	mov    %rcx,(%rsi)
   1401335ff:	mov    0x1c8(%rsp),%rcx
   140133607:	mov    %rcx,0x8(%rsi)
   14013360b:	jmp    14012ac19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7639>
   140133610:	shr    $0x20,%rax
   140133614:	cmp    $0x1,%ax
   140133618:	je     140136141 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b61>
   14013361e:	cmp    $0x5,%ax
   140133622:	jne    14012dca0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6c0>
   140133628:	mov    0x60(%rsp),%rcx
   14013362d:	mov    %r8,0x40(%rsp)
   140133632:	call   140229aa0 <setun::VMValue::as_int() const>
   140133637:	jmp    14012dcb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6d4>
   14013363c:	cmp    $0x1,%r12b
   140133640:	je     140135704 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12124>
   140133646:	lea    0x8(%rsi),%r8
   14013364a:	cmp    0x30(%rsp),%r8
   14013364f:	jae    140137a72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14492>
   140133655:	mov    0x1d0(%rsp),%rax
   14013365d:	mov    0x60(%rdi),%rcx
   140133661:	mov    0x50(%rdi),%rdx
   140133665:	sub    0x48(%rdi),%rdx
   140133669:	mov    %rax,(%rsi)
   14013366c:	mov    0x1c8(%rsp),%rax
   140133674:	sar    $0x3,%rdx
   140133678:	mov    %rax,0x1d0(%rsp)
   140133680:	xor    %eax,%eax
   140133682:	test   %rcx,%rcx
   140133685:	je     14013368b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100ab>
   140133687:	mov    0x18(%rcx),%rax
   14013368b:	add    %rax,%rdx
   14013368e:	lea    0x680(%rsp),%rcx
   140133696:	mov    %r8,0x40(%rsp)
   14013369b:	mov    $0x2,%r12d
   1401336a1:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401336a6:	mov    0x680(%rsp),%rax
   1401336ae:	mov    0x40(%rsp),%rsi
   1401336b3:	mov    %rax,0x1c8(%rsp)
   1401336bb:	jmp    140132911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf331>
   1401336c0:	lea    0x1048(%rbx),%rcx
   1401336c7:	lea    (%rdi,%rdi,1),%rdx
   1401336cb:	vzeroupper
   1401336ce:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401336d3:	mov    0x15270(%rbx),%rcx
   1401336da:	mov    0x152a0(%rbx),%r9
   1401336e1:	jmp    14012f473 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe93>
   1401336e6:	mov    0x40(%rsp),%rcx
   1401336eb:	call   140152c50 <setun::ArrayObject::size() const>
   1401336f0:	add    %rax,%rdi
   1401336f3:	jns    140130173 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb93>
   1401336f9:	jmp    140130186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcba6>
   1401336fe:	lea    0x8(%rsi),%r8
   140133702:	cmp    0x30(%rsp),%r8
   140133707:	jae    1401388bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   14013370d:	mov    0x1c8(%rsp),%rdx
   140133715:	mov    %rdx,(%rsi)
   140133718:	mov    %r8,%rsi
   14013371b:	jmp    14013043a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce5a>
   140133720:	mov    0x1050(%rbx),%rax
   140133727:	mov    0x1048(%rbx),%rdx
   14013372e:	mov    %rsi,%r12
   140133731:	mov    %rax,%rcx
   140133734:	sub    %rdx,%r12
   140133737:	sub    %rdx,%rcx
   14013373a:	sar    $0x3,%rcx
   14013373e:	lea    (%rcx,%rcx,1),%r8
   140133742:	cmp    %r8,%rcx
   140133745:	jb     1401355d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ff0>
   14013374b:	vzeroupper
   14013374e:	mov    0x1d0(%rsp),%rcx
   140133756:	lea    0x10(%rsi),%r8
   14013375a:	mov    %rcx,(%rsi)
   14013375d:	mov    0x1c8(%rsp),%rcx
   140133765:	mov    %rcx,0x8(%rsi)
   140133769:	jmp    14012b83b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x825b>
   14013376e:	mov    0x1c8(%rsp),%rax
   140133776:	sub    $0x8,%rsi
   14013377a:	mov    %rax,0x2d0(%rsp)
   140133782:	mov    (%rsi),%rax
   140133785:	mov    %rax,0x2c8(%rsp)
   14013378d:	mov    %rax,%rdx
   140133790:	jmp    14012c82a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x924a>
   140133795:	mov    0x1050(%rbx),%rax
   14013379c:	mov    0x1048(%rbx),%rdx
   1401337a3:	mov    %rsi,%r12
   1401337a6:	mov    %rax,%rcx
   1401337a9:	sub    %rdx,%r12
   1401337ac:	sub    %rdx,%rcx
   1401337af:	sar    $0x3,%rcx
   1401337b3:	lea    (%rcx,%rcx,1),%r8
   1401337b7:	cmp    %r8,%rcx
   1401337ba:	jb     1401359e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12404>
   1401337c0:	vzeroupper
   1401337c3:	mov    0x1d0(%rsp),%rcx
   1401337cb:	lea    0x10(%rsi),%r8
   1401337cf:	mov    %rcx,(%rsi)
   1401337d2:	mov    0x1c8(%rsp),%rcx
   1401337da:	mov    %rcx,0x8(%rsi)
   1401337de:	jmp    14012ad5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x777d>
   1401337e3:	mov    0x1050(%rbx),%rax
   1401337ea:	mov    0x1048(%rbx),%rdx
   1401337f1:	mov    %rsi,%r12
   1401337f4:	mov    %rax,%rcx
   1401337f7:	sub    %rdx,%r12
   1401337fa:	sub    %rdx,%rcx
   1401337fd:	sar    $0x3,%rcx
   140133801:	lea    (%rcx,%rcx,1),%r8
   140133805:	cmp    %r8,%rcx
   140133808:	jb     140136268 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c88>
   14013380e:	vzeroupper
   140133811:	mov    0x1d0(%rsp),%rcx
   140133819:	lea    0x10(%rsi),%r8
   14013381d:	mov    %rcx,(%rsi)
   140133820:	mov    0x1c8(%rsp),%rcx
   140133828:	mov    %rcx,0x8(%rsi)
   14013382c:	jmp    14012aa05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7425>
   140133831:	lea    (%rax,%rax,1),%rdx
   140133835:	lea    0x1068(%rbx),%rcx
   14013383c:	vzeroupper
   14013383f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133844:	jmp    14012a6b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d1>
   140133849:	mov    0x1050(%rbx),%rax
   140133850:	mov    0x1048(%rbx),%rdx
   140133857:	mov    %rsi,%r12
   14013385a:	mov    %rax,%rcx
   14013385d:	sub    %rdx,%r12
   140133860:	sub    %rdx,%rcx
   140133863:	sar    $0x3,%rcx
   140133867:	lea    (%rcx,%rcx,1),%r8
   14013386b:	cmp    %r8,%rcx
   14013386e:	jb     1401356db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120fb>
   140133874:	vzeroupper
   140133877:	mov    0x1d0(%rsp),%rcx
   14013387f:	lea    0x10(%rsi),%r8
   140133883:	mov    %rcx,(%rsi)
   140133886:	mov    0x1c8(%rsp),%rcx
   14013388e:	mov    %rcx,0x8(%rsi)
   140133892:	jmp    14012b540 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f60>
   140133897:	lea    0x1048(%rbx),%rcx
   14013389e:	lea    (%rdi,%rdi,1),%rdx
   1401338a2:	vzeroupper
   1401338a5:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401338aa:	mov    0x15270(%rbx),%rcx
   1401338b1:	jmp    140130d13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd733>
   1401338b6:	mov    0x1050(%rbx),%rax
   1401338bd:	mov    0x1048(%rbx),%rdx
   1401338c4:	mov    %rsi,%r12
   1401338c7:	mov    %rax,%rcx
   1401338ca:	sub    %rdx,%r12
   1401338cd:	sub    %rdx,%rcx
   1401338d0:	sar    $0x3,%rcx
   1401338d4:	lea    (%rcx,%rcx,1),%r8
   1401338d8:	cmp    %r8,%rcx
   1401338db:	jb     140134703 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11123>
   1401338e1:	vzeroupper
   1401338e4:	mov    0x1d0(%rsp),%rcx
   1401338ec:	lea    0x10(%rsi),%r8
   1401338f0:	mov    %rcx,(%rsi)
   1401338f3:	mov    0x1c8(%rsp),%rcx
   1401338fb:	mov    %rcx,0x8(%rsi)
   1401338ff:	jmp    14012b73b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x815b>
   140133904:	mov    0x1c8(%rsp),%rax
   14013390c:	sub    $0x8,%rsi
   140133910:	mov    %rax,0x2b0(%rsp)
   140133918:	mov    (%rsi),%rax
   14013391b:	mov    %rax,0x2a8(%rsp)
   140133923:	mov    %rax,%rdx
   140133926:	jmp    140130d70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd790>
   14013392b:	mov    0x1c8(%rsp),%rax
   140133933:	sub    $0x8,%rsi
   140133937:	mov    %rax,0x250(%rsp)
   14013393f:	mov    (%rsi),%rax
   140133942:	mov    %rax,0x248(%rsp)
   14013394a:	jmp    140130746 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd166>
   14013394f:	mov    0x1068(%rbx),%r8
   140133956:	jmp    1401247e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1200>
   14013395b:	cmp    $0x1,%r12b
   14013395f:	je     1401357f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12215>
   140133965:	lea    0x8(%rsi),%r8
   140133969:	cmp    0x30(%rsp),%r8
   14013396e:	jae    140137705 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14125>
   140133974:	mov    0x1d0(%rsp),%rax
   14013397c:	xor    %edx,%edx
   14013397e:	mov    %rax,(%rsi)
   140133981:	mov    0x1c8(%rsp),%rax
   140133989:	mov    %rax,0x1d0(%rsp)
   140133991:	test   %rdi,%rdi
   140133994:	je     1401339ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103cb>
   140133996:	mov    %rdi,%rcx
   140133999:	mov    %r8,0x40(%rsp)
   14013399e:	call   140152c50 <setun::ArrayObject::size() const>
   1401339a3:	mov    0x40(%rsp),%r8
   1401339a8:	mov    %rax,%rdx
   1401339ab:	lea    0x680(%rsp),%rcx
   1401339b3:	mov    %r8,0x40(%rsp)
   1401339b8:	mov    $0x2,%r12d
   1401339be:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401339c3:	mov    0x680(%rsp),%rax
   1401339cb:	mov    0x40(%rsp),%rsi
   1401339d0:	mov    %rax,0x1c8(%rsp)
   1401339d8:	jmp    140130bd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5f7>
   1401339dd:	mov    0x1c8(%rsp),%rax
   1401339e5:	sub    $0x8,%rsi
   1401339e9:	mov    %rax,0x3b0(%rsp)
   1401339f1:	mov    (%rsi),%rax
   1401339f4:	mov    %rax,0x3a8(%rsp)
   1401339fc:	jmp    14012c6eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x910b>
   140133a01:	mov    0x1048(%rbx),%rdx
   140133a08:	mov    0x1050(%rbx),%rax
   140133a0f:	mov    %rsi,%r14
   140133a12:	mov    %rax,0x30(%rsp)
   140133a17:	sub    %rdx,%rax
   140133a1a:	sub    %rdx,%r14
   140133a1d:	sar    $0x3,%rax
   140133a21:	lea    (%rax,%rax,1),%rdx
   140133a25:	cmp    %rdx,%rax
   140133a28:	jae    14012a0de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6afe>
   140133a2e:	lea    0x1048(%rbx),%rcx
   140133a35:	vzeroupper
   140133a38:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133a3d:	mov    0x1048(%rbx),%rsi
   140133a44:	mov    0x1050(%rbx),%rax
   140133a4b:	add    %r14,%rsi
   140133a4e:	mov    %rax,0x30(%rsp)
   140133a53:	lea    0x8(%rsi),%r8
   140133a57:	jmp    14012a0de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6afe>
   140133a5c:	mov    0x1048(%rbx),%rdx
   140133a63:	mov    %rsi,%rax
   140133a66:	sub    %rdx,%rax
   140133a69:	mov    %rax,0x40(%rsp)
   140133a6e:	mov    0x1050(%rbx),%rax
   140133a75:	mov    %rax,0x30(%rsp)
   140133a7a:	sub    %rdx,%rax
   140133a7d:	mov    %rax,%rcx
   140133a80:	sar    $0x3,%rcx
   140133a84:	mov    %rcx,%rdx
   140133a87:	lea    (%rcx,%rcx,1),%rcx
   140133a8b:	cmp    %rcx,%rdx
   140133a8e:	jae    1401272be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cde>
   140133a94:	mov    %rcx,%rdx
   140133a97:	lea    0x1048(%rbx),%rcx
   140133a9e:	vzeroupper
   140133aa1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133aa6:	mov    0x1050(%rbx),%rax
   140133aad:	mov    0x40(%rsp),%rsi
   140133ab2:	add    0x1048(%rbx),%rsi
   140133ab9:	mov    %rax,0x30(%rsp)
   140133abe:	lea    0x8(%rsi),%r8
   140133ac2:	jmp    1401272be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cde>
   140133ac7:	mov    0x1048(%rbx),%rdx
   140133ace:	mov    0x1050(%rbx),%rax
   140133ad5:	mov    %rsi,%rbp
   140133ad8:	mov    %rax,0x30(%rsp)
   140133add:	sub    %rdx,%rax
   140133ae0:	sub    %rdx,%rbp
   140133ae3:	mov    %rsi,%rdx
   140133ae6:	mov    %rax,%rcx
   140133ae9:	sar    $0x3,%rcx
   140133aed:	lea    (%rcx,%rcx,1),%r8
   140133af1:	cmp    %r8,%rcx
   140133af4:	jb     140135baf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125cf>
   140133afa:	mov    0x1d0(%rsp),%rcx
   140133b02:	lea    0x10(%rdx),%rsi
   140133b06:	mov    %rcx,(%rdx)
   140133b09:	mov    0x1c8(%rsp),%rcx
   140133b11:	mov    %rcx,0x8(%rdx)
   140133b15:	jmp    14012b5a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fc0>
   140133b1a:	mov    0x1048(%rbx),%rdx
   140133b21:	mov    0x1050(%rbx),%rax
   140133b28:	lea    0x10(%rsi),%rcx
   140133b2c:	cmp    0x30(%rsp),%rcx
   140133b31:	jae    1401387b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151d7>
   140133b37:	mov    0x1d0(%rsp),%r8
   140133b3f:	mov    %r8,(%rsi)
   140133b42:	mov    0x1c8(%rsp),%r8
   140133b4a:	mov    %r8,0x8(%rsi)
   140133b4e:	jmp    140130ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda1c>
   140133b53:	mov    0x1048(%rbx),%rdx
   140133b5a:	mov    0x1050(%rbx),%rax
   140133b61:	mov    %rsi,%r14
   140133b64:	mov    %rax,0x30(%rsp)
   140133b69:	sub    %rdx,%rax
   140133b6c:	sub    %rdx,%r14
   140133b6f:	sar    $0x3,%rax
   140133b73:	lea    (%rax,%rax,1),%rdx
   140133b77:	cmp    %rdx,%rax
   140133b7a:	jae    140126eed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x390d>
   140133b80:	lea    0x1048(%rbx),%rcx
   140133b87:	vzeroupper
   140133b8a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133b8f:	mov    0x1048(%rbx),%rsi
   140133b96:	mov    0x1050(%rbx),%rax
   140133b9d:	add    %r14,%rsi
   140133ba0:	mov    %rax,0x30(%rsp)
   140133ba5:	lea    0x8(%rsi),%r8
   140133ba9:	jmp    140126eed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x390d>
   140133bae:	mov    0x1c8(%rsp),%rax
   140133bb6:	sub    $0x8,%rsi
   140133bba:	mov    %rax,0x1f0(%rsp)
   140133bc2:	mov    (%rsi),%rax
   140133bc5:	mov    %rax,0x1e8(%rsp)
   140133bcd:	jmp    14012cca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c2>
   140133bd2:	mov    0x1c8(%rsp),%rax
   140133bda:	sub    $0x8,%rsi
   140133bde:	mov    %rax,0x390(%rsp)
   140133be6:	mov    (%rsi),%rax
   140133be9:	mov    %rax,0x388(%rsp)
   140133bf1:	jmp    14012d2a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cc1>
   140133bf6:	mov    0x1c8(%rsp),%rdx
   140133bfe:	mov    $0x1,%r12d
   140133c04:	mov    %rdx,0x18(%rax,%r13,8)
   140133c09:	mov    0x1d0(%rsp),%rax
   140133c11:	mov    %rax,0x1c8(%rsp)
   140133c19:	jmp    140131547 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf67>
   140133c1e:	shr    $0x20,%rax
   140133c22:	cmp    $0x1,%ax
   140133c26:	je     140135fdd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129fd>
   140133c2c:	cmp    $0x5,%ax
   140133c30:	jne    14012dc2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa64e>
   140133c36:	mov    0x40(%rsp),%rcx
   140133c3b:	call   140229aa0 <setun::VMValue::as_int() const>
   140133c40:	lea    0x520(%rsp),%r8
   140133c48:	movq   $0x0,0x528(%rsp)
   140133c54:	mov    %rax,0x520(%rsp)
   140133c5c:	movq   $0x0,0x530(%rsp)
   140133c68:	jmp    14012dc65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa685>
   140133c6d:	shr    $0x20,%rax
   140133c71:	cmp    $0x1,%ax
   140133c75:	je     140136993 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133b3>
   140133c7b:	cmp    $0x5,%ax
   140133c7f:	jne    14012dbb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5d6>
   140133c85:	mov    %r11,%rcx
   140133c88:	call   140229aa0 <setun::VMValue::as_int() const>
   140133c8d:	jmp    14012dbc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5e3>
   140133c92:	mov    0x1050(%rbx),%rax
   140133c99:	mov    0x1048(%rbx),%rdx
   140133ca0:	mov    %rsi,%r12
   140133ca3:	mov    %rax,%rcx
   140133ca6:	sub    %rdx,%r12
   140133ca9:	sub    %rdx,%rcx
   140133cac:	sar    $0x3,%rcx
   140133cb0:	lea    (%rcx,%rcx,1),%r8
   140133cb4:	cmp    %r8,%rcx
   140133cb7:	jb     1401349df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113ff>
   140133cbd:	vzeroupper
   140133cc0:	mov    0x1d0(%rsp),%rcx
   140133cc8:	lea    0x10(%rsi),%r8
   140133ccc:	mov    %rcx,(%rsi)
   140133ccf:	mov    0x1c8(%rsp),%rcx
   140133cd7:	mov    %rcx,0x8(%rsi)
   140133cdb:	jmp    14012b9ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x840d>
   140133ce0:	mov    0x1050(%rbx),%rax
   140133ce7:	mov    0x1048(%rbx),%rdx
   140133cee:	mov    %rsi,%r12
   140133cf1:	mov    %rax,%rcx
   140133cf4:	sub    %rdx,%r12
   140133cf7:	sub    %rdx,%rcx
   140133cfa:	sar    $0x3,%rcx
   140133cfe:	lea    (%rcx,%rcx,1),%r8
   140133d02:	cmp    %r8,%rcx
   140133d05:	jb     140134a08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11428>
   140133d0b:	vzeroupper
   140133d0e:	mov    0x1d0(%rsp),%rcx
   140133d16:	lea    0x10(%rsi),%r8
   140133d1a:	mov    %rcx,(%rsi)
   140133d1d:	mov    0x1c8(%rsp),%rcx
   140133d25:	mov    %rcx,0x8(%rsi)
   140133d29:	jmp    14012b7a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81c3>
   140133d2e:	mov    0x1d0(%rsp),%rax
   140133d36:	mov    $0x1,%r12d
   140133d3c:	mov    %rax,0x1c8(%rsp)
   140133d44:	jmp    140126ea9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38c9>
   140133d49:	mov    0x1c8(%rsp),%rax
   140133d51:	sub    $0x8,%rsi
   140133d55:	mov    %rax,0x2a0(%rsp)
   140133d5d:	mov    (%rsi),%rax
   140133d60:	mov    %rax,0x298(%rsp)
   140133d68:	mov    %rax,%rdx
   140133d6b:	jmp    14012c36b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d8b>
   140133d70:	mov    0x1c8(%rsp),%rax
   140133d78:	sub    $0x8,%rsi
   140133d7c:	mov    %rax,0x3a0(%rsp)
   140133d84:	mov    (%rsi),%rax
   140133d87:	mov    %rax,0x398(%rsp)
   140133d8f:	jmp    14012c620 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9040>
   140133d94:	lea    0x680(%rsp),%rcx
   140133d9c:	lea    0x3e0(%rsp),%rdx
   140133da4:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140133da9:	mov    0x688(%rsp),%rdx
   140133db1:	lea    0x540(%rsp),%rcx
   140133db9:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140133dbe:	mov    0x540(%rsp),%rax
   140133dc6:	mov    0x680(%rsp),%rcx
   140133dce:	mov    %rax,0x1c8(%rsp)
   140133dd6:	lea    0x690(%rsp),%rax
   140133dde:	cmp    %rax,%rcx
   140133de1:	je     140133df4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10814>
   140133de3:	mov    0x690(%rsp),%rax
   140133deb:	lea    0x1(%rax),%rdx
   140133def:	call   14034a160 <operator delete(void*, unsigned long long)>
   140133df4:	mov    $0x1,%r12d
   140133dfa:	jmp    14012e4ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf0e>
   140133dff:	mov    0x1c8(%rsp),%rax
   140133e07:	sub    $0x8,%rsi
   140133e0b:	mov    %rax,0x380(%rsp)
   140133e13:	mov    (%rsi),%rax
   140133e16:	mov    %rax,0x378(%rsp)
   140133e1e:	jmp    14012d36c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d8c>
   140133e23:	mov    0x1c8(%rsp),%rax
   140133e2b:	sub    $0x8,%rsi
   140133e2f:	mov    %rax,0x200(%rsp)
   140133e37:	mov    (%rsi),%rax
   140133e3a:	mov    %rax,0x1f8(%rsp)
   140133e42:	jmp    14012d065 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a85>
   140133e47:	mov    0x1c8(%rsp),%rax
   140133e4f:	sub    $0x8,%rsi
   140133e53:	mov    %rax,0x3d0(%rsp)
   140133e5b:	mov    (%rsi),%rax
   140133e5e:	mov    %rax,0x3c8(%rsp)
   140133e66:	jmp    14012c48a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8eaa>
   140133e6b:	mov    0x1c8(%rsp),%rax
   140133e73:	mov    -0x8(%rsi),%rdx
   140133e77:	xor    %r12d,%r12d
   140133e7a:	sub    $0x8,%rsi
   140133e7e:	mov    %rax,0x3f0(%rsp)
   140133e86:	jmp    14012d5e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa001>
   140133e8b:	shr    $0x20,%rax
   140133e8f:	cmp    $0x1,%ax
   140133e93:	je     140136a0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1342b>
   140133e99:	cmp    $0x5,%ax
   140133e9d:	jne    1401318dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2fd>
   140133ea3:	mov    %r10,%rcx
   140133ea6:	mov    %r8,0x40(%rsp)
   140133eab:	call   140229aa0 <setun::VMValue::as_int() const>
   140133eb0:	jmp    1401318ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe30f>
   140133eb5:	shr    $0x20,%rax
   140133eb9:	cmp    $0x1,%ax
   140133ebd:	je     140134f9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119bb>
   140133ec3:	cmp    $0x5,%ax
   140133ec7:	jne    140131868 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe288>
   140133ecd:	mov    %r9,%rcx
   140133ed0:	mov    %r10,0x40(%rsp)
   140133ed5:	call   140229aa0 <setun::VMValue::as_int() const>
   140133eda:	jmp    14013187a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe29a>
   140133edf:	shr    $0x20,%rax
   140133ee3:	cmp    $0x1,%ax
   140133ee7:	je     140136d2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1374c>
   140133eed:	cmp    $0x5,%ax
   140133ef1:	jne    1401317e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe201>
   140133ef7:	mov    %rdx,%rcx
   140133efa:	mov    %r10,0x60(%rsp)
   140133eff:	mov    %r9,0x40(%rsp)
   140133f04:	call   140229aa0 <setun::VMValue::as_int() const>
   140133f09:	mov    0x40(%rsp),%r9
   140133f0e:	mov    0x60(%rsp),%r10
   140133f13:	movq   $0x0,0x508(%rsp)
   140133f1f:	mov    %rax,0x500(%rsp)
   140133f27:	lea    0x500(%rsp),%rax
   140133f2f:	movq   $0x0,0x510(%rsp)
   140133f3b:	mov    %rax,0x80(%rsp)
   140133f43:	jmp    140131832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe252>
   140133f48:	mov    0x1048(%rbx),%rdx
   140133f4f:	mov    0x1050(%rbx),%rax
   140133f56:	mov    %rsi,%r12
   140133f59:	mov    %rax,0x30(%rsp)
   140133f5e:	sub    %rdx,%rax
   140133f61:	sub    %rdx,%r12
   140133f64:	mov    %rsi,%rdx
   140133f67:	sar    $0x3,%rax
   140133f6b:	lea    (%rax,%rax,1),%rcx
   140133f6f:	cmp    %rcx,%rax
   140133f72:	jb     140134e54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11874>
   140133f78:	vzeroupper
   140133f7b:	mov    0x1c8(%rsp),%rax
   140133f83:	lea    0x8(%rdx),%rsi
   140133f87:	xor    %r12d,%r12d
   140133f8a:	mov    %rax,(%rdx)
   140133f8d:	jmp    140129d5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x677b>
   140133f92:	cmp    $0x1,%r12b
   140133f96:	je     1401363c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12de2>
   140133f9c:	lea    0x8(%rsi),%r8
   140133fa0:	cmp    0x30(%rsp),%r8
   140133fa5:	jae    14013849a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eba>
   140133fab:	mov    0x1d0(%rsp),%rax
   140133fb3:	mov    $0x2,%r12d
   140133fb9:	mov    %rax,(%rsi)
   140133fbc:	mov    0x1c8(%rsp),%rax
   140133fc4:	mov    %r8,%rsi
   140133fc7:	mov    %rax,0x1d0(%rsp)
   140133fcf:	movabs $0xfff8000000000003,%rax
   140133fd9:	mov    %rax,0x1c8(%rsp)
   140133fe1:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   140133fe6:	lea    0x680(%rsp),%rcx
   140133fee:	lea    0x239b4d(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   140133ff5:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140133ffa:	mov    0x680(%rsp),%rax
   140134002:	mov    %rax,0x1c8(%rsp)
   14013400a:	mov    $0x1,%r12d
   140134010:	jmp    14012e9e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb408>
   140134015:	mov    0x1050(%rbx),%rax
   14013401c:	mov    0x1048(%rbx),%rdx
   140134023:	mov    %rsi,%r12
   140134026:	mov    %rax,%rcx
   140134029:	sub    %rdx,%r12
   14013402c:	sub    %rdx,%rcx
   14013402f:	sar    $0x3,%rcx
   140134033:	lea    (%rcx,%rcx,1),%r8
   140134037:	cmp    %r8,%rcx
   14013403a:	jb     140134ece <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118ee>
   140134040:	vzeroupper
   140134043:	mov    0x1d0(%rsp),%rcx
   14013404b:	lea    0x10(%rsi),%r8
   14013404f:	mov    %rcx,(%rsi)
   140134052:	mov    0x1c8(%rsp),%rcx
   14013405a:	mov    %rcx,0x8(%rsi)
   14013405e:	jmp    14012a929 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7349>
   140134063:	mov    0x1050(%rbx),%rax
   14013406a:	mov    %rsi,%rdi
   14013406d:	sub    %rdx,%rdi
   140134070:	mov    %rax,%r8
   140134073:	sub    %rdx,%r8
   140134076:	sar    $0x3,%r8
   14013407a:	lea    (%r8,%r8,1),%r9
   14013407e:	cmp    %r9,%r8
   140134081:	jb     1401362bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cdd>
   140134087:	vzeroupper
   14013408a:	jmp    14012ba3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x845e>
   14013408f:	mov    0x1050(%rbx),%rax
   140134096:	mov    0x1048(%rbx),%rdx
   14013409d:	mov    %rsi,%r12
   1401340a0:	mov    %rax,%rcx
   1401340a3:	sub    %rdx,%r12
   1401340a6:	sub    %rdx,%rcx
   1401340a9:	sar    $0x3,%rcx
   1401340ad:	lea    (%rcx,%rcx,1),%r8
   1401340b1:	cmp    %r8,%rcx
   1401340b4:	jb     140135c0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1262f>
   1401340ba:	vzeroupper
   1401340bd:	mov    0x1d0(%rsp),%rcx
   1401340c5:	lea    0x10(%rsi),%r8
   1401340c9:	mov    %rcx,(%rsi)
   1401340cc:	mov    0x1c8(%rsp),%rcx
   1401340d4:	mov    %rcx,0x8(%rsi)
   1401340d8:	jmp    14012a997 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73b7>
   1401340dd:	mov    0x1050(%rbx),%rax
   1401340e4:	mov    0x1048(%rbx),%rdx
   1401340eb:	mov    %rsi,%r12
   1401340ee:	mov    %rax,%rcx
   1401340f1:	sub    %rdx,%r12
   1401340f4:	sub    %rdx,%rcx
   1401340f7:	sar    $0x3,%rcx
   1401340fb:	lea    (%rcx,%rcx,1),%r8
   1401340ff:	cmp    %r8,%rcx
   140134102:	jb     1401355a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fc7>
   140134108:	vzeroupper
   14013410b:	mov    0x1d0(%rsp),%rcx
   140134113:	lea    0x10(%rsi),%r8
   140134117:	mov    %rcx,(%rsi)
   14013411a:	mov    0x1c8(%rsp),%rcx
   140134122:	mov    %rcx,0x8(%rsi)
   140134126:	jmp    14012aa9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74bb>
   14013412b:	mov    0x1048(%rbx),%rdx
   140134132:	mov    %rsi,%rax
   140134135:	sub    %rdx,%rax
   140134138:	mov    %rax,0x40(%rsp)
   14013413d:	mov    0x1050(%rbx),%rax
   140134144:	mov    %rax,0x30(%rsp)
   140134149:	sub    %rdx,%rax
   14013414c:	sar    $0x3,%rax
   140134150:	lea    (%rax,%rax,1),%rdx
   140134154:	cmp    %rdx,%rax
   140134157:	jae    140126f75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3995>
   14013415d:	lea    0x1048(%rbx),%rcx
   140134164:	vzeroupper
   140134167:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013416c:	mov    0x1050(%rbx),%rax
   140134173:	mov    0x40(%rsp),%rsi
   140134178:	add    0x1048(%rbx),%rsi
   14013417f:	mov    %rax,0x30(%rsp)
   140134184:	lea    0x8(%rsi),%r8
   140134188:	jmp    140126f75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3995>
   14013418d:	mov    0x1050(%rbx),%rax
   140134194:	mov    0x1048(%rbx),%rdx
   14013419b:	mov    %rsi,%r12
   14013419e:	mov    %rax,%rcx
   1401341a1:	sub    %rdx,%r12
   1401341a4:	sub    %rdx,%rcx
   1401341a7:	sar    $0x3,%rcx
   1401341ab:	lea    (%rcx,%rcx,1),%r8
   1401341af:	cmp    %r8,%rcx
   1401341b2:	jb     14013557e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f9e>
   1401341b8:	vzeroupper
   1401341bb:	mov    0x1d0(%rsp),%rcx
   1401341c3:	lea    0x10(%rsi),%r8
   1401341c7:	mov    %rcx,(%rsi)
   1401341ca:	mov    0x1c8(%rsp),%rcx
   1401341d2:	mov    %rcx,0x8(%rsi)
   1401341d6:	jmp    14012ab77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7597>
   1401341db:	mov    0x1c8(%rsp),%rax
   1401341e3:	lea    -0x8(%rsi),%r14
   1401341e7:	xor    %r12d,%r12d
   1401341ea:	mov    %rax,0x338(%rsp)
   1401341f2:	mov    -0x8(%rsi),%rax
   1401341f6:	mov    %rax,0x330(%rsp)
   1401341fe:	jmp    140130dbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7db>
   140134203:	mov    0x1050(%rbx),%rax
   14013420a:	mov    0x1048(%rbx),%rdx
   140134211:	mov    %rsi,%r12
   140134214:	mov    %rax,%rcx
   140134217:	sub    %rdx,%r12
   14013421a:	sub    %rdx,%rcx
   14013421d:	sar    $0x3,%rcx
   140134221:	lea    (%rcx,%rcx,1),%r8
   140134225:	cmp    %r8,%rcx
   140134228:	jb     14013641c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e3c>
   14013422e:	vzeroupper
   140134231:	mov    0x1d0(%rsp),%rcx
   140134239:	lea    0x10(%rsi),%r8
   14013423d:	mov    %rcx,(%rsi)
   140134240:	mov    0x1c8(%rsp),%rcx
   140134248:	mov    %rcx,0x8(%rsi)
   14013424c:	jmp    14012af71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7991>
   140134251:	mov    0x1c8(%rsp),%rax
   140134259:	sub    $0x8,%rsi
   14013425d:	mov    %rax,0x210(%rsp)
   140134265:	mov    (%rsi),%rax
   140134268:	mov    %rax,0x208(%rsp)
   140134270:	jmp    140130e90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8b0>
   140134275:	mov    0x1c8(%rsp),%rax
   14013427d:	sub    $0x8,%rsi
   140134281:	mov    %rax,0x260(%rsp)
   140134289:	mov    (%rsi),%rax
   14013428c:	mov    %rax,0x258(%rsp)
   140134294:	jmp    1401308d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2f3>
   140134299:	mov    0x1c8(%rsp),%rdx
   1401342a1:	mov    $0x1,%r12d
   1401342a7:	mov    %rdx,0x8(%rax,%r13,8)
   1401342ac:	mov    0x1d0(%rsp),%rax
   1401342b4:	mov    %rax,0x1c8(%rsp)
   1401342bc:	jmp    1401310e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb07>
   1401342c1:	mov    0x1c8(%rsp),%rax
   1401342c9:	sub    $0x8,%rsi
   1401342cd:	mov    %rax,0x220(%rsp)
   1401342d5:	mov    (%rsi),%rax
   1401342d8:	mov    %rax,0x218(%rsp)
   1401342e0:	jmp    1401315db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdffb>
   1401342e5:	mov    0x1050(%rbx),%rax
   1401342ec:	mov    0x1048(%rbx),%rdx
   1401342f3:	mov    %rsi,%r12
   1401342f6:	mov    %rax,%rcx
   1401342f9:	sub    %rdx,%r12
   1401342fc:	sub    %rdx,%rcx
   1401342ff:	sar    $0x3,%rcx
   140134303:	lea    (%rcx,%rcx,1),%r8
   140134307:	cmp    %r8,%rcx
   14013430a:	jb     140134ef7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11917>
   140134310:	vzeroupper
   140134313:	mov    0x1d0(%rsp),%rcx
   14013431b:	lea    0x10(%rsi),%r8
   14013431f:	mov    %rcx,(%rsi)
   140134322:	mov    0x1c8(%rsp),%rcx
   14013432a:	mov    %rcx,0x8(%rsi)
   14013432e:	jmp    14012b6cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80ed>
   140134333:	mov    0x1050(%rbx),%rax
   14013433a:	mov    0x1048(%rbx),%rdx
   140134341:	mov    %rsi,%r12
   140134344:	mov    %rax,%rcx
   140134347:	sub    %rdx,%r12
   14013434a:	sub    %rdx,%rcx
   14013434d:	sar    $0x3,%rcx
   140134351:	lea    (%rcx,%rcx,1),%r8
   140134355:	cmp    %r8,%rcx
   140134358:	jb     14013463a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1105a>
   14013435e:	vzeroupper
   140134361:	mov    0x1d0(%rsp),%rcx
   140134369:	lea    0x10(%rsi),%r8
   14013436d:	mov    %rcx,(%rsi)
   140134370:	mov    0x1c8(%rsp),%rcx
   140134378:	mov    %rcx,0x8(%rsi)
   14013437c:	jmp    14012baff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x851f>
   140134381:	mov    0x1c8(%rsp),%rax
   140134389:	sub    $0x8,%rsi
   14013438d:	mov    %rax,0x2e0(%rsp)
   140134395:	mov    (%rsi),%rax
   140134398:	mov    %rax,0x2d8(%rsp)
   1401343a0:	mov    %rax,%rdx
   1401343a3:	jmp    14012d183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ba3>
   1401343a8:	mov    0x1050(%rbx),%rax
   1401343af:	mov    %rsi,%rbp
   1401343b2:	sub    %rdx,%rbp
   1401343b5:	mov    %rax,%r8
   1401343b8:	sub    %rdx,%r8
   1401343bb:	sar    $0x3,%r8
   1401343bf:	lea    (%r8,%r8,1),%r9
   1401343c3:	cmp    %r9,%r8
   1401343c6:	jae    14012e3b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadd5>
   1401343cc:	lea    0x1048(%rbx),%rcx
   1401343d3:	mov    %r9,%rdx
   1401343d6:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401343db:	mov    0x1048(%rbx),%rdx
   1401343e2:	mov    0x1050(%rbx),%rax
   1401343e9:	lea    (%rdx,%rbp,1),%rsi
   1401343ed:	lea    0x10(%rsi),%rcx
   1401343f1:	jmp    14012e3b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadd5>
   1401343f6:	mov    0x1c8(%rsp),%rax
   1401343fe:	sub    $0x8,%rsi
   140134402:	mov    %rax,0x280(%rsp)
   14013440a:	mov    (%rsi),%rax
   14013440d:	mov    %rax,0x278(%rsp)
   140134415:	jmp    14012d7ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa20a>
   14013441a:	mov    0x1048(%rbx),%rdx
   140134421:	mov    0x1050(%rbx),%rax
   140134428:	mov    %rsi,%r14
   14013442b:	mov    %rax,0x30(%rsp)
   140134430:	sub    %rdx,%rax
   140134433:	sub    %rdx,%r14
   140134436:	sar    $0x3,%rax
   14013443a:	lea    (%rax,%rax,1),%rdx
   14013443e:	cmp    %rdx,%rax
   140134441:	jae    14012a14a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b6a>
   140134447:	lea    0x1048(%rbx),%rcx
   14013444e:	vzeroupper
   140134451:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134456:	mov    0x1048(%rbx),%rsi
   14013445d:	mov    0x1050(%rbx),%rax
   140134464:	add    %r14,%rsi
   140134467:	mov    %rax,0x30(%rsp)
   14013446c:	lea    0x8(%rsi),%r8
   140134470:	jmp    14012a14a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b6a>
   140134475:	mov    0x1048(%rbx),%rdx
   14013447c:	mov    %rsi,%rax
   14013447f:	sub    %rdx,%rax
   140134482:	mov    %rax,0x40(%rsp)
   140134487:	mov    0x1050(%rbx),%rax
   14013448e:	mov    %rax,0x30(%rsp)
   140134493:	sub    %rdx,%rax
   140134496:	sar    $0x3,%rax
   14013449a:	lea    (%rax,%rax,1),%rdx
   14013449e:	cmp    %rdx,%rax
   1401344a1:	jae    1401289de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53fe>
   1401344a7:	lea    0x1048(%rbx),%rcx
   1401344ae:	vzeroupper
   1401344b1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401344b6:	mov    0x1050(%rbx),%rax
   1401344bd:	mov    0x40(%rsp),%rsi
   1401344c2:	add    0x1048(%rbx),%rsi
   1401344c9:	mov    %rax,0x30(%rsp)
   1401344ce:	lea    0x8(%rsi),%r8
   1401344d2:	jmp    1401289de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53fe>
   1401344d7:	mov    0x1c8(%rsp),%rdx
   1401344df:	mov    $0x1,%r12d
   1401344e5:	mov    %rdx,(%rax,%r13,8)
   1401344e9:	mov    0x1d0(%rsp),%rax
   1401344f1:	mov    %rax,0x1c8(%rsp)
   1401344f9:	jmp    140131066 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda86>
   1401344fe:	mov    0x1050(%rbx),%rax
   140134505:	mov    0x1048(%rbx),%rdx
   14013450c:	mov    %rsi,%r12
   14013450f:	mov    %rax,%rcx
   140134512:	sub    %rdx,%r12
   140134515:	sub    %rdx,%rcx
   140134518:	sar    $0x3,%rcx
   14013451c:	lea    (%rcx,%rcx,1),%r8
   140134520:	cmp    %r8,%rcx
   140134523:	jb     140134663 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11083>
   140134529:	vzeroupper
   14013452c:	mov    0x1d0(%rsp),%rcx
   140134534:	lea    0x10(%rsi),%r8
   140134538:	mov    %rcx,(%rsi)
   14013453b:	mov    0x1c8(%rsp),%rcx
   140134543:	mov    %rcx,0x8(%rsi)
   140134547:	jmp    14012b4d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef2>
   14013454c:	mov    0x1c8(%rsp),%rax
   140134554:	sub    $0x8,%rsi
   140134558:	mov    %rax,0x270(%rsp)
   140134560:	mov    (%rsi),%rax
   140134563:	mov    %rax,0x268(%rsp)
   14013456b:	jmp    140130872 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd292>
   140134570:	mov    0x1c8(%rsp),%rax
   140134578:	sub    $0x8,%rsi
   14013457c:	mov    %rax,0x240(%rsp)
   140134584:	mov    (%rsi),%rax
   140134587:	mov    %rax,0x238(%rsp)
   14013458f:	jmp    14013112b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb4b>
   140134594:	mov    0x1c8(%rsp),%rax
   14013459c:	sub    $0x8,%rsi
   1401345a0:	mov    %rax,0x370(%rsp)
   1401345a8:	mov    (%rsi),%rax
   1401345ab:	mov    %rax,0x368(%rsp)
   1401345b3:	jmp    14012cf87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99a7>
   1401345b8:	mov    0x1c8(%rsp),%rax
   1401345c0:	sub    $0x8,%rsi
   1401345c4:	mov    %rax,0x2c0(%rsp)
   1401345cc:	mov    (%rsi),%rax
   1401345cf:	mov    %rax,0x2b8(%rsp)
   1401345d7:	mov    %rax,%rdx
   1401345da:	jmp    14012c94b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x936b>
   1401345df:	mov    0x1048(%rbx),%rdx
   1401345e6:	mov    0x1050(%rbx),%rax
   1401345ed:	mov    %rsi,%r14
   1401345f0:	mov    %rax,0x30(%rsp)
   1401345f5:	sub    %rdx,%rax
   1401345f8:	sub    %rdx,%r14
   1401345fb:	sar    $0x3,%rax
   1401345ff:	lea    (%rax,%rax,1),%rdx
   140134603:	cmp    %rdx,%rax
   140134606:	jae    140129ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a1a>
   14013460c:	lea    0x1048(%rbx),%rcx
   140134613:	vzeroupper
   140134616:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013461b:	mov    0x1048(%rbx),%rsi
   140134622:	mov    0x1050(%rbx),%rax
   140134629:	add    %r14,%rsi
   14013462c:	mov    %rax,0x30(%rsp)
   140134631:	lea    0x8(%rsi),%r8
   140134635:	jmp    140129ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a1a>
   14013463a:	mov    %r8,%rdx
   14013463d:	lea    0x1048(%rbx),%rcx
   140134644:	vzeroupper
   140134647:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013464c:	mov    0x1048(%rbx),%rdx
   140134653:	mov    0x1050(%rbx),%rax
   14013465a:	lea    (%rdx,%r12,1),%rsi
   14013465e:	jmp    140134361 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d81>
   140134663:	mov    %r8,%rdx
   140134666:	lea    0x1048(%rbx),%rcx
   14013466d:	vzeroupper
   140134670:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134675:	mov    0x1048(%rbx),%rdx
   14013467c:	mov    0x1050(%rbx),%rax
   140134683:	lea    (%rdx,%r12,1),%rsi
   140134687:	jmp    14013452c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f4c>
   14013468c:	test   %r12b,%r12b
   14013468f:	je     1401320ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb0c>
   140134695:	sub    $0x1,%r12b
   140134699:	je     140134a7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1149f>
   14013469f:	lea    0x8(%rsi),%r8
   1401346a3:	cmp    0x30(%rsp),%r8
   1401346a8:	jb     14012f9d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3f9>
   1401346ae:	mov    0x1050(%rbx),%rax
   1401346b5:	mov    0x1048(%rbx),%rdx
   1401346bc:	mov    %rax,0x30(%rsp)
   1401346c1:	sub    %rdx,%rax
   1401346c4:	sar    $0x3,%rax
   1401346c8:	lea    (%rax,%rax,1),%rcx
   1401346cc:	cmp    %rcx,%rax
   1401346cf:	jae    14012f9d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3f9>
   1401346d5:	sub    %rdx,%rsi
   1401346d8:	mov    %rcx,%rdx
   1401346db:	lea    0x1048(%rbx),%rcx
   1401346e2:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401346e7:	mov    0x1050(%rbx),%rax
   1401346ee:	add    0x1048(%rbx),%rsi
   1401346f5:	lea    0x8(%rsi),%r8
   1401346f9:	mov    %rax,0x30(%rsp)
   1401346fe:	jmp    14012f9d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3f9>
   140134703:	mov    %r8,%rdx
   140134706:	lea    0x1048(%rbx),%rcx
   14013470d:	vzeroupper
   140134710:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134715:	mov    0x1048(%rbx),%rdx
   14013471c:	mov    0x1050(%rbx),%rax
   140134723:	lea    (%rdx,%r12,1),%rsi
   140134727:	jmp    1401338e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10304>
   14013472c:	lea    0x310(%rsp),%rdx
   140134734:	lea    0x680(%rsp),%rcx
   14013473c:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140134741:	mov    %rdi,%rcx
   140134744:	lea    0x680(%rsp),%rdx
   14013474c:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134751:	mov    0x680(%rsp),%rcx
   140134759:	mov    %rax,0x1c8(%rsp)
   140134761:	lea    0x690(%rsp),%rax
   140134769:	cmp    %rax,%rcx
   14013476c:	je     1401320fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1e>
   140134772:	mov    0x690(%rsp),%rax
   14013477a:	lea    0x1(%rax),%rdx
   14013477e:	call   14034a160 <operator delete(void*, unsigned long long)>
   140134783:	jmp    1401320fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1e>
   140134788:	mov    0x8(%rdi),%rax
   14013478c:	mov    0x340(%rsp),%rdx
   140134794:	mov    %rdx,(%rax,%r14,8)
   140134798:	cmpb   $0x0,0x1040(%rbx)
   14013479f:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   1401347a5:	movzbl 0x0(%rbp),%eax
   1401347a9:	lea    0x29e8f0(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401347b0:	add    $0x1,%rbp
   1401347b4:	mov    (%rdi,%rax,8),%rax
   1401347b8:	jmp    *%rax
   1401347ba:	mov    0x340(%rsp),%rax
   1401347c2:	and    %rax,%r8
   1401347c5:	cmp    0x40(%rsp),%r8
   1401347ca:	jne    14012fc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc680>
   1401347d0:	mov    0x20(%rdi),%rdx
   1401347d4:	shl    $0x10,%rax
   1401347d8:	sar    $0x10,%rax
   1401347dc:	mov    %rax,(%rdx,%r14,8)
   1401347e0:	cmpb   $0x0,0x1040(%rbx)
   1401347e7:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   1401347ed:	movzbl 0x0(%rbp),%eax
   1401347f1:	lea    0x29e8a8(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401347f8:	add    $0x1,%rbp
   1401347fc:	mov    (%rdi,%rax,8),%rax
   140134800:	jmp    *%rax
   140134802:	call   140221db0 <tersun::VMTelemetryManager::instance()>
   140134807:	cmpb   $0x0,(%rax)
   14013480a:	je     140134814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11234>
   14013480c:	addq   $0x1,0x90(%rax)
   140134814:	mov    0x60(%rsp),%edi
   140134818:	mov    0x152c8(%rbx),%rcx
   14013481f:	xor    %r8d,%r8d
   140134822:	movzbl 0x7f0(%rsp),%r9d
   14013482b:	mov    %rdi,%rdx
   14013482e:	call   14017e060 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   140134833:	mov    0x1048(%rbx),%rdx
   14013483a:	mov    %rsi,%rcx
   14013483d:	mov    %r14,%r8
   140134840:	mov    0x150c0(%rbx),%rax
   140134847:	sub    0x38(%rsp),%r8
   14013484c:	sub    %rdx,%rcx
   14013484f:	mov    %rcx,%rbp
   140134852:	sar    $0x3,%rbp
   140134856:	cmp    $0x7ff,%rax
   14013485c:	ja     140139a97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b7>
   140134862:	mov    0xa0(%rsp),%r11
   14013486a:	lea    0x1(%rax),%r9
   14013486e:	lea    (%rax,%rax,4),%rax
   140134872:	mov    %r9,0x150c0(%rbx)
   140134879:	mov    %r11,0x10c8(%rbx,%rax,8)
   140134881:	mov    0x40(%rsp),%r11
   140134886:	mov    %r8,0x10c0(%rbx,%rax,8)
   14013488e:	mov    %rbp,0x10d0(%rbx,%rax,8)
   140134896:	mov    %r11,0x10d8(%rbx,%rax,8)
   14013489e:	mov    %rdi,0x10e0(%rbx,%rax,8)
   1401348a6:	mov    0x1050(%rbx),%rax
   1401348ad:	sub    %rdx,%rax
   1401348b0:	cmp    %rcx,%rax
   1401348b3:	jb     1401396ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x160ea>
   1401348b9:	mov    0x38(%rsp),%r14
   1401348be:	mov    %rbp,0x1060(%rbx)
   1401348c5:	add    0x7e8(%rsp),%r14
   1401348cd:	cmpb   $0x0,0x1040(%rbx)
   1401348d4:	je     1401302e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd06>
   1401348da:	movzbl (%r14),%eax
   1401348de:	lea    0x29e7bb(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401348e5:	lea    0x1(%r14),%rbp
   1401348e9:	xor    %r12d,%r12d
   1401348ec:	mov    0xa0(%rsp),%r13
   1401348f4:	mov    (%rdi,%rax,8),%rax
   1401348f8:	jmp    *%rax
   1401348fa:	cmp    $0x4,%al
   1401348fc:	jne    140134788 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111a8>
   140134902:	mov    $0xffffffff,%eax
   140134907:	mov    $0xfffd0001,%edx
   14013490c:	shl    $0x20,%rax
   140134910:	shl    $0x20,%rdx
   140134914:	and    0x340(%rsp),%rax
   14013491c:	cmp    %rdx,%rax
   14013491f:	jne    14012fc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc680>
   140134925:	lea    0x340(%rsp),%rdx
   14013492d:	lea    0x480(%rsp),%rcx
   140134935:	call   14022b670 <setun::VMValue::as_tafpu() const>
   14013493a:	mov    0x490(%rsp),%rdx
   140134942:	imul   $0x18,%r14,%rax
   140134946:	vmovdqa 0x480(%rsp),%xmm7
   14013494f:	add    0x68(%rdi),%rax
   140134953:	mov    %rdx,0x10(%rax)
   140134957:	vmovdqu %xmm7,(%rax)
   14013495b:	cmpb   $0x0,0x1040(%rbx)
   140134962:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   140134968:	movzbl 0x0(%rbp),%eax
   14013496c:	lea    0x29e72d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134973:	add    $0x1,%rbp
   140134977:	mov    (%rdi,%rax,8),%rax
   14013497b:	jmp    *%rax
   14013497d:	mov    0x340(%rsp),%rax
   140134985:	movabs $0xfff7ffffffffffff,%rdx
   14013498f:	cmp    %rax,%rdx
   140134992:	jae    1401349a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113c6>
   140134994:	mov    $0x3fff,%edx
   140134999:	shl    $0x32,%rdx
   14013499d:	cmp    %rdx,%rax
   1401349a0:	jne    14012fc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc680>
   1401349a6:	lea    0x340(%rsp),%rcx
   1401349ae:	call   14022b550 <setun::VMValue::as_float() const>
   1401349b3:	mov    0x50(%rdi),%rax
   1401349b7:	vmovsd %xmm0,(%rax,%r14,8)
   1401349bd:	cmpb   $0x0,0x1040(%rbx)
   1401349c4:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   1401349ca:	movzbl 0x0(%rbp),%eax
   1401349ce:	lea    0x29e6cb(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401349d5:	add    $0x1,%rbp
   1401349d9:	mov    (%rdi,%rax,8),%rax
   1401349dd:	jmp    *%rax
   1401349df:	mov    %r8,%rdx
   1401349e2:	lea    0x1048(%rbx),%rcx
   1401349e9:	vzeroupper
   1401349ec:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401349f1:	mov    0x1048(%rbx),%rdx
   1401349f8:	mov    0x1050(%rbx),%rax
   1401349ff:	lea    (%rdx,%r12,1),%rsi
   140134a03:	jmp    140133cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106e0>
   140134a08:	mov    %r8,%rdx
   140134a0b:	lea    0x1048(%rbx),%rcx
   140134a12:	vzeroupper
   140134a15:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134a1a:	mov    0x1048(%rbx),%rdx
   140134a21:	mov    0x1050(%rbx),%rax
   140134a28:	lea    (%rdx,%r12,1),%rsi
   140134a2c:	jmp    140133d0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1072e>
   140134a31:	mov    0x1050(%rbx),%rax
   140134a38:	mov    %rsi,%rbp
   140134a3b:	sub    %rdx,%rbp
   140134a3e:	mov    %rax,%rcx
   140134a41:	sub    %rdx,%rcx
   140134a44:	sar    $0x3,%rcx
   140134a48:	lea    (%rcx,%rcx,1),%r9
   140134a4c:	cmp    %r9,%rcx
   140134a4f:	jae    14012a4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f00>
   140134a55:	mov    %r9,%rdx
   140134a58:	lea    0x1048(%rbx),%rcx
   140134a5f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134a64:	mov    0x1048(%rbx),%rdx
   140134a6b:	mov    0x1050(%rbx),%rax
   140134a72:	lea    (%rdx,%rbp,1),%rsi
   140134a76:	lea    0x8(%rsi),%r8
   140134a7a:	jmp    14012a4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f00>
   140134a7f:	mov    0x1c8(%rsp),%rax
   140134a87:	mov    $0x2,%r12d
   140134a8d:	mov    %rax,0x1d0(%rsp)
   140134a95:	movabs $0xfff8000000000000,%rax
   140134a9f:	mov    %rax,0x1c8(%rsp)
   140134aa7:	jmp    14012fa0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc42f>
   140134aac:	lea    0x310(%rsp),%rcx
   140134ab4:	call   140229aa0 <setun::VMValue::as_int() const>
   140134ab9:	mov    %rax,%r14
   140134abc:	test   %rax,%rax
   140134abf:	js     140134cc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116e5>
   140134ac5:	mov    %rdi,%rcx
   140134ac8:	call   140152c50 <setun::ArrayObject::size() const>
   140134acd:	cmp    %rax,%r14
   140134ad0:	jae    140134cd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116f6>
   140134ad6:	test   %r12b,%r12b
   140134ad9:	je     140138985 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153a5>
   140134adf:	sub    $0x1,%r12b
   140134ae3:	je     140139732 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16152>
   140134ae9:	lea    0x8(%rsi),%r8
   140134aed:	cmp    0x30(%rsp),%r8
   140134af2:	jae    1401396e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16100>
   140134af8:	mov    0x1d0(%rsp),%rax
   140134b00:	mov    %r14,%rdx
   140134b03:	mov    %rdi,%rcx
   140134b06:	mov    %r8,0x60(%rsp)
   140134b0b:	mov    %rax,(%rsi)
   140134b0e:	mov    0x1c8(%rsp),%rax
   140134b16:	mov    %rax,0x1d0(%rsp)
   140134b1e:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   140134b23:	mov    %rax,0x1c8(%rsp)
   140134b2b:	mov    0x60(%rsp),%rsi
   140134b30:	mov    $0x2,%r12d
   140134b36:	jmp    14012fa0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc42f>
   140134b3b:	mov    %r8,%rdx
   140134b3e:	lea    0x1048(%rbx),%rcx
   140134b45:	vzeroupper
   140134b48:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b4d:	mov    0x1048(%rbx),%rdx
   140134b54:	mov    0x1050(%rbx),%rax
   140134b5b:	lea    (%rdx,%rdi,1),%rsi
   140134b5f:	jmp    1401320a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeac9>
   140134b64:	mov    0x8(%r10),%eax
   140134b68:	xor    %r12d,%r12d
   140134b6b:	add    $0x1,%eax
   140134b6e:	mov    %eax,0x8(%r10)
   140134b72:	cmp    0xc(%r10),%eax
   140134b76:	jb     140132766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf186>
   140134b7c:	mov    0x150c0(%rbx),%rdi
   140134b83:	test   %rdi,%rdi
   140134b86:	je     140134b98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b8>
   140134b88:	lea    -0x1(%rdi),%rax
   140134b8c:	imul   $0x28,%rax,%rax
   140134b90:	mov    0x10e0(%rbx,%rax,1),%rdi
   140134b98:	mov    0x1048(%rbx),%rdx
   140134b9f:	mov    0x1050(%rbx),%rax
   140134ba6:	sub    0x38(%rsp),%rbp
   140134bab:	sub    %rdx,%rsi
   140134bae:	mov    %rbp,0x1038(%rbx)
   140134bb5:	sub    %rdx,%rax
   140134bb8:	mov    %rsi,%rbp
   140134bbb:	sar    $0x3,%rbp
   140134bbf:	cmp    %rsi,%rax
   140134bc2:	jb     140138932 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15352>
   140134bc8:	vzeroupper
   140134bcb:	mov    %rbp,0x1060(%rbx)
   140134bd2:	mov    %rbx,%rdx
   140134bd5:	mov    %rdi,%r9
   140134bd8:	mov    %r15,%r8
   140134bdb:	mov    0x40(%rsp),%eax
   140134bdf:	vmovdqa 0x239f99(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140134be7:	movb   $0x0,0x153a0(%rbx)
   140134bee:	mov    0x152c8(%rbx),%rcx
   140134bf5:	mov    %r10,0x60(%rsp)
   140134bfa:	vmovdqa %xmm0,0x15390(%rbx)
   140134c02:	mov    %r10,0x28(%rsp)
   140134c07:	mov    %eax,0x20(%rsp)
   140134c0b:	call   14017e8a0 <setun::JITManager::slow_tiering_coordinator_osr(setun::VM*, setun::Chunk const&, unsigned long long, unsigned int, setun::LoopHotData&)>
   140134c10:	mov    0x38(%rsp),%rbp
   140134c15:	mov    0x60(%rsp),%r10
   140134c1a:	mov    0x1048(%rbx),%rdx
   140134c21:	mov    %eax,%ecx
   140134c23:	mov    0x1060(%rbx),%rax
   140134c2a:	mov    0x150c0(%rbx),%r13
   140134c31:	add    0x1038(%rbx),%rbp
   140134c38:	lea    (%rdx,%rax,8),%rsi
   140134c3c:	mov    0x1050(%rbx),%rax
   140134c43:	test   %r13,%r13
   140134c46:	mov    %rax,0x30(%rsp)
   140134c4b:	je     140134c5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1167d>
   140134c4d:	lea    -0x1(%r13),%rax
   140134c51:	imul   $0x28,%rax,%rax
   140134c55:	mov    0x10c8(%rbx,%rax,1),%r13
   140134c5d:	test   %cl,%cl
   140134c5f:	jne    140134c69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11689>
   140134c61:	addl   $0x3e8,0xc(%r10)
   140134c69:	xor    %r12d,%r12d
   140134c6c:	jmp    140132766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf186>
   140134c71:	lea    (%rdi,%rdi,1),%rdx
   140134c75:	lea    0x1048(%rbx),%rcx
   140134c7c:	vzeroupper
   140134c7f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134c84:	jmp    14013133e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd5e>
   140134c89:	mov    0x1048(%rbx),%rdx
   140134c90:	mov    0x1050(%rbx),%rax
   140134c97:	lea    0x10(%rsi),%rcx
   140134c9b:	cmp    0x30(%rsp),%rcx
   140134ca0:	jae    140139752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16172>
   140134ca6:	mov    0x1d0(%rsp),%r8
   140134cae:	mov    %r8,(%rsi)
   140134cb1:	mov    0x1c8(%rsp),%r8
   140134cb9:	mov    %r8,0x8(%rsi)
   140134cbd:	mov    %rcx,%rsi
   140134cc0:	jmp    140131325 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd45>
   140134cc5:	mov    %rdi,%rcx
   140134cc8:	call   140152c50 <setun::ArrayObject::size() const>
   140134ccd:	add    %rax,%r14
   140134cd0:	jns    140134ac5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114e5>
   140134cd6:	test   %r12b,%r12b
   140134cd9:	je     1401320ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb0c>
   140134cdf:	sub    $0x1,%r12b
   140134ce3:	jne    14012f9ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3ea>
   140134ce9:	mov    0x1c8(%rsp),%rax
   140134cf1:	mov    %rax,0x1d0(%rsp)
   140134cf9:	mov    $0x1fff,%eax
   140134cfe:	shl    $0x33,%rax
   140134d02:	mov    %rax,0x1c8(%rsp)
   140134d0a:	jmp    14012fa09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc429>
   140134d0f:	mov    %r8d,0x60(%rsp)
   140134d14:	add    %rdx,%rdx
   140134d17:	lea    0x1068(%rbx),%rcx
   140134d1e:	mov    %r9d,0x80(%rsp)
   140134d26:	mov    %eax,0x40(%rsp)
   140134d2a:	vzeroupper
   140134d2d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134d32:	mov    0x1070(%rbx),%rdx
   140134d39:	mov    0x40(%rsp),%eax
   140134d3d:	sub    0x1068(%rbx),%rdx
   140134d44:	mov    0x80(%rsp),%r9d
   140134d4c:	mov    0x60(%rsp),%r8d
   140134d51:	sar    $0x3,%rdx
   140134d55:	jmp    140128a7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x549d>
   140134d5a:	mov    %r14,%rsi
   140134d5d:	lea    0x338(%rsp),%rcx
   140134d65:	call   140229aa0 <setun::VMValue::as_int() const>
   140134d6a:	mov    %rax,%r14
   140134d6d:	test   %rax,%rax
   140134d70:	js     140134e81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118a1>
   140134d76:	mov    %rdi,%rcx
   140134d79:	call   140152c50 <setun::ArrayObject::size() const>
   140134d7e:	cmp    %rax,%r14
   140134d81:	jae    140134e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118b2>
   140134d87:	test   %r12b,%r12b
   140134d8a:	je     1401385b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fd5>
   140134d90:	sub    $0x1,%r12b
   140134d94:	je     14013858d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fad>
   140134d9a:	lea    0x8(%rsi),%r8
   140134d9e:	cmp    0x30(%rsp),%r8
   140134da3:	jae    1401385d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ff3>
   140134da9:	mov    0x1d0(%rsp),%rax
   140134db1:	mov    %r14,%rdx
   140134db4:	mov    %rdi,%rcx
   140134db7:	mov    %r8,0x40(%rsp)
   140134dbc:	mov    $0x2,%r12d
   140134dc2:	mov    %rax,(%rsi)
   140134dc5:	mov    0x1c8(%rsp),%rax
   140134dcd:	mov    %rax,0x1d0(%rsp)
   140134dd5:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   140134dda:	mov    0x40(%rsp),%rsi
   140134ddf:	mov    %rax,0x1c8(%rsp)
   140134de7:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140134dec:	cmp    $0x2,%r12b
   140134df0:	je     14013866f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1508f>
   140134df6:	cmp    $0x1,%r12b
   140134dfa:	je     14013863d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1505d>
   140134e00:	mov    0x1048(%rbx),%rdx
   140134e07:	mov    0x1050(%rbx),%rax
   140134e0e:	vzeroupper
   140134e11:	sub    %rdx,%rsi
   140134e14:	sub    %rdx,%rax
   140134e17:	mov    %rsi,%rdi
   140134e1a:	sar    $0x3,%rdi
   140134e1e:	cmp    %rsi,%rax
   140134e21:	jb     140138628 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15048>
   140134e27:	mov    %rdi,0x1060(%rbx)
   140134e2e:	mov    %rbx,%rdx
   140134e31:	lea    0x15270(%rbx),%rcx
   140134e38:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   140134e3d:	mov    0x1060(%rbx),%rax
   140134e44:	mov    0x1048(%rbx),%rdx
   140134e4b:	lea    (%rdx,%rax,8),%rsi
   140134e4f:	jmp    1401312e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd08>
   140134e54:	mov    %rcx,%rdx
   140134e57:	lea    0x1048(%rbx),%rcx
   140134e5e:	vzeroupper
   140134e61:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134e66:	mov    0x1048(%rbx),%rdx
   140134e6d:	mov    0x1050(%rbx),%rax
   140134e74:	add    %r12,%rdx
   140134e77:	mov    %rax,0x30(%rsp)
   140134e7c:	jmp    140133f7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1099b>
   140134e81:	mov    %rdi,%rcx
   140134e84:	call   140152c50 <setun::ArrayObject::size() const>
   140134e89:	add    %rax,%r14
   140134e8c:	jns    140134d76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11796>
   140134e92:	test   %r12b,%r12b
   140134e95:	jne    140137ac7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144e7>
   140134e9b:	mov    $0x1fff,%eax
   140134ea0:	mov    $0x1,%r12d
   140134ea6:	shl    $0x33,%rax
   140134eaa:	mov    %rax,0x1c8(%rsp)
   140134eb2:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140134eb7:	lea    0x15270(%rbx),%rcx
   140134ebe:	mov    %rbx,%rdx
   140134ec1:	vzeroupper
   140134ec4:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   140134ec9:	jmp    14012f484 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbea4>
   140134ece:	mov    %r8,%rdx
   140134ed1:	lea    0x1048(%rbx),%rcx
   140134ed8:	vzeroupper
   140134edb:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134ee0:	mov    0x1048(%rbx),%rdx
   140134ee7:	mov    0x1050(%rbx),%rax
   140134eee:	lea    (%rdx,%r12,1),%rsi
   140134ef2:	jmp    140134043 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a63>
   140134ef7:	mov    %r8,%rdx
   140134efa:	lea    0x1048(%rbx),%rcx
   140134f01:	vzeroupper
   140134f04:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134f09:	mov    0x1048(%rbx),%rdx
   140134f10:	mov    0x1050(%rbx),%rax
   140134f17:	lea    (%rdx,%r12,1),%rsi
   140134f1b:	jmp    140134313 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d33>
   140134f20:	mov    0x540(%rsp),%rax
   140134f28:	lea    0x690(%rsp),%r12
   140134f30:	mov    $0x1,%edx
   140134f35:	lea    0x680(%rsp),%rcx
   140134f3d:	movsbl (%rax,%rdi,1),%r8d
   140134f42:	mov    %r12,0x680(%rsp)
   140134f4a:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140134f4f:	lea    0x680(%rsp),%rdx
   140134f57:	lea    0x520(%rsp),%rcx
   140134f5f:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140134f64:	mov    0x520(%rsp),%rax
   140134f6c:	mov    0x680(%rsp),%rcx
   140134f74:	mov    %rax,0x1c8(%rsp)
   140134f7c:	cmp    %r12,%rcx
   140134f7f:	je     140133548 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff68>
   140134f85:	mov    0x690(%rsp),%rax
   140134f8d:	lea    0x1(%rax),%rdx
   140134f91:	call   14034a160 <operator delete(void*, unsigned long long)>
   140134f96:	jmp    140133548 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff68>
   140134f9b:	lea    0x520(%rsp),%r8
   140134fa3:	mov    %r9,%rdx
   140134fa6:	mov    %r10,0x60(%rsp)
   140134fab:	mov    %r8,%rcx
   140134fae:	mov    %r8,0x40(%rsp)
   140134fb3:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140134fb8:	mov    0x40(%rsp),%r8
   140134fbd:	mov    0x60(%rsp),%r10
   140134fc2:	jmp    1401318a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2c7>
   140134fc7:	mov    0x40(%rsp),%rdx
   140134fcc:	lea    0x540(%rsp),%rcx
   140134fd4:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140134fd9:	mov    0x540(%rsp),%rax
   140134fe1:	mov    %rax,0x1c8(%rsp)
   140134fe9:	mov    $0x1,%r12d
   140134fef:	jmp    14013264f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf06f>
   140134ff4:	mov    0x40(%rsp),%rdx
   140134ff9:	lea    0x540(%rsp),%rcx
   140135001:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140135006:	mov    0x540(%rsp),%rax
   14013500e:	mov    %rax,0x1c8(%rsp)
   140135016:	mov    $0x1,%r12d
   14013501c:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   140135021:	mov    0x1048(%rbx),%rdx
   140135028:	mov    0x1050(%rbx),%rax
   14013502f:	lea    0x10(%rsi),%rcx
   140135033:	cmp    0x30(%rsp),%rcx
   140135038:	jae    140137c6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1468c>
   14013503e:	vzeroupper
   140135041:	mov    0x1d0(%rsp),%r8
   140135049:	mov    %r8,(%rsi)
   14013504c:	mov    0x1c8(%rsp),%r8
   140135054:	mov    %r8,0x8(%rsi)
   140135058:	jmp    140132279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec99>
   14013505d:	sub    $0x1,%r12b
   140135061:	je     140139470 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e90>
   140135067:	lea    0x8(%r14),%r12
   14013506b:	cmp    0x30(%rsp),%r12
   140135070:	jae    14013941b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e3b>
   140135076:	mov    0x1d0(%rsp),%rax
   14013507e:	mov    %rax,(%r14)
   140135081:	mov    0x1c8(%rsp),%rax
   140135089:	mov    %r12,%r14
   14013508c:	mov    %rax,0x1d0(%rsp)
   140135094:	mov    $0x1fff,%eax
   140135099:	shl    $0x33,%rax
   14013509d:	mov    %rax,0x1c8(%rsp)
   1401350a5:	mov    $0x2,%r12d
   1401350ab:	jmp    14013264f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf06f>
   1401350b0:	mov    %r8,%rdx
   1401350b3:	lea    0x1048(%rbx),%rcx
   1401350ba:	vzeroupper
   1401350bd:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401350c2:	mov    0x1048(%rbx),%rdx
   1401350c9:	mov    0x1050(%rbx),%rax
   1401350d0:	lea    (%rdx,%r12,1),%rsi
   1401350d4:	jmp    1401330f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb14>
   1401350d9:	mov    0x1050(%rbx),%rax
   1401350e0:	mov    %rsi,%r12
   1401350e3:	sub    %rdx,%r12
   1401350e6:	mov    %rax,%rcx
   1401350e9:	sub    %rdx,%rcx
   1401350ec:	sar    $0x3,%rcx
   1401350f0:	lea    (%rcx,%rcx,1),%r9
   1401350f4:	cmp    %r9,%rcx
   1401350f7:	jb     140138e93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x158b3>
   1401350fd:	vzeroupper
   140135100:	jmp    14012e60e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb02e>
   140135105:	mov    0x1050(%rbx),%rax
   14013510c:	mov    %rsi,%r12
   14013510f:	sub    %rdx,%r12
   140135112:	mov    %rax,%rcx
   140135115:	sub    %rdx,%rcx
   140135118:	sar    $0x3,%rcx
   14013511c:	lea    (%rcx,%rcx,1),%r9
   140135120:	cmp    %r9,%rcx
   140135123:	jb     140136e54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13874>
   140135129:	vzeroupper
   14013512c:	jmp    14012e6ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0ee>
   140135131:	mov    %r8,%rdx
   140135134:	lea    0x1048(%rbx),%rcx
   14013513b:	vzeroupper
   14013513e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135143:	mov    0x1048(%rbx),%rdx
   14013514a:	mov    0x1050(%rbx),%rax
   140135151:	lea    (%rdx,%r12,1),%rsi
   140135155:	jmp    1401335a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffc2>
   14013515a:	test   %r12b,%r12b
   14013515d:	jne    1401392d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cf9>
   140135163:	mov    0x8(%rdi),%rax
   140135167:	mov    $0x1,%r12d
   14013516d:	mov    (%rax,%r14,8),%rax
   140135171:	mov    %rax,0x1c8(%rsp)
   140135179:	cmpb   $0x0,0x1040(%rbx)
   140135180:	je     14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   140135186:	movzbl 0x0(%rbp),%eax
   14013518a:	lea    0x29df0f(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135191:	add    $0x1,%rbp
   140135195:	mov    (%rdi,%rax,8),%rax
   140135199:	jmp    *%rax
   14013519b:	test   %r12b,%r12b
   14013519e:	je     140137c3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1465c>
   1401351a4:	sub    $0x1,%r12b
   1401351a8:	je     140137bfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1461c>
   1401351ae:	lea    0x8(%rsi),%r8
   1401351b2:	cmp    0x30(%rsp),%r8
   1401351b7:	jae    140137f79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14999>
   1401351bd:	mov    0x1d0(%rsp),%rax
   1401351c5:	lea    0x680(%rsp),%rcx
   1401351cd:	mov    %r8,0x40(%rsp)
   1401351d2:	mov    $0x2,%r12d
   1401351d8:	mov    %rax,(%rsi)
   1401351db:	mov    0x1c8(%rsp),%rax
   1401351e3:	mov    %rax,0x1d0(%rsp)
   1401351eb:	mov    0x20(%rdi),%rax
   1401351ef:	mov    (%rax,%r14,8),%rdx
   1401351f3:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401351f8:	mov    0x680(%rsp),%rax
   140135200:	mov    0x40(%rsp),%rsi
   140135205:	mov    %rax,0x1c8(%rsp)
   14013520d:	cmpb   $0x0,0x1040(%rbx)
   140135214:	je     14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   14013521a:	movzbl 0x0(%rbp),%eax
   14013521e:	lea    0x29de7b(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135225:	add    $0x1,%rbp
   140135229:	mov    (%rdi,%rax,8),%rax
   14013522d:	jmp    *%rax
   14013522f:	cmp    $0x4,%al
   140135231:	jne    14013515a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b7a>
   140135237:	test   %r12b,%r12b
   14013523a:	je     1401395f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16019>
   140135240:	sub    $0x1,%r12b
   140135244:	je     140139598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15fb8>
   14013524a:	lea    0x8(%rsi),%r8
   14013524e:	cmp    0x30(%rsp),%r8
   140135253:	jae    14013932b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15d4b>
   140135259:	mov    0x1d0(%rsp),%rax
   140135261:	mov    %r8,0x40(%rsp)
   140135266:	lea    0x1a0(%rsp),%rdx
   14013526e:	lea    0x680(%rsp),%rcx
   140135276:	mov    $0x2,%r12d
   14013527c:	mov    %rax,(%rsi)
   14013527f:	mov    0x1c8(%rsp),%rax
   140135287:	mov    %rax,0x1d0(%rsp)
   14013528f:	imul   $0x18,%r14,%rax
   140135293:	add    0x68(%rdi),%rax
   140135297:	vmovdqu (%rax),%xmm7
   14013529b:	vmovdqa %xmm7,0x1a0(%rsp)
   1401352a4:	mov    0x10(%rax),%rax
   1401352a8:	mov    %rax,0x1b0(%rsp)
   1401352b0:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401352b5:	mov    0x680(%rsp),%rax
   1401352bd:	mov    0x40(%rsp),%rsi
   1401352c2:	mov    %rax,0x1c8(%rsp)
   1401352ca:	cmpb   $0x0,0x1040(%rbx)
   1401352d1:	je     14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   1401352d7:	movzbl 0x0(%rbp),%eax
   1401352db:	lea    0x29ddbe(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401352e2:	add    $0x1,%rbp
   1401352e6:	mov    (%rdi,%rax,8),%rax
   1401352ea:	jmp    *%rax
   1401352ec:	mov    %rsi,%r14
   1401352ef:	jmp    140130de0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd800>
   1401352f4:	mov    %r8,%rdx
   1401352f7:	lea    0x1048(%rbx),%rcx
   1401352fe:	vzeroupper
   140135301:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135306:	mov    0x1048(%rbx),%rdx
   14013530d:	mov    0x1050(%rbx),%rax
   140135314:	lea    (%rdx,%r12,1),%rsi
   140135318:	jmp    140132c39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf659>
   14013531d:	mov    0x1050(%rbx),%rax
   140135324:	mov    %rax,0x30(%rsp)
   140135329:	sub    %rdx,%rax
   14013532c:	sar    $0x3,%rax
   140135330:	lea    (%rax,%rax,1),%rcx
   140135334:	cmp    %rcx,%rax
   140135337:	jae    14012f855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc275>
   14013533d:	sub    %rdx,%rsi
   140135340:	mov    %rcx,%rdx
   140135343:	lea    0x1048(%rbx),%rcx
   14013534a:	vzeroupper
   14013534d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135352:	mov    0x1048(%rbx),%rdx
   140135359:	mov    0x1050(%rbx),%rax
   140135360:	add    %rdx,%rsi
   140135363:	mov    %rax,0x30(%rsp)
   140135368:	lea    0x8(%rsi),%r8
   14013536c:	jmp    14012f855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc275>
   140135371:	mov    $0x1,%r12d
   140135377:	jmp    14012e3dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadfc>
   14013537c:	mov    (%rdi),%rdx
   14013537f:	mov    $0xffffffff,%eax
   140135384:	mov    $0xfffd0003,%ecx
   140135389:	shl    $0x20,%rax
   14013538d:	shl    $0x20,%rcx
   140135391:	and    %rax,%rdx
   140135394:	cmp    %rcx,%rdx
   140135397:	jne    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   14013539d:	mov    0xc0(%rsp),%rcx
   1401353a5:	and    (%rcx),%rax
   1401353a8:	cmp    %rdx,%rax
   1401353ab:	jne    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   1401353b1:	mov    %rdi,%rcx
   1401353b4:	call   14022b1c0 <setun::VMValue::payload() const>
   1401353b9:	mov    0xc0(%rsp),%rcx
   1401353c1:	mov    0x58(%rax),%rdi
   1401353c5:	mov    %rdi,0xa0(%rsp)
   1401353cd:	call   14022b1c0 <setun::VMValue::payload() const>
   1401353d2:	mov    0x58(%rax),%rax
   1401353d6:	mov    %rax,0xc0(%rsp)
   1401353de:	test   %rdi,%rdi
   1401353e1:	je     140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   1401353e7:	test   %rax,%rax
   1401353ea:	je     140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   1401353f0:	mov    0xe0(%rsp),%rcx
   1401353f8:	call   140229aa0 <setun::VMValue::as_int() const>
   1401353fd:	mov    0x60(%rsp),%rcx
   140135402:	mov    %rax,0x40(%rsp)
   140135407:	call   140229aa0 <setun::VMValue::as_int() const>
   14013540c:	mov    %rax,%rdi
   14013540f:	cmpq   $0x0,0x40(%rsp)
   140135415:	js     140139560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f80>
   14013541b:	test   %rax,%rax
   14013541e:	js     140139577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f97>
   140135424:	mov    0xa0(%rsp),%rcx
   14013542c:	call   140152c50 <setun::ArrayObject::size() const>
   140135431:	test   %rdi,%rdi
   140135434:	js     140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   14013543a:	cmp    %rax,0x40(%rsp)
   14013543f:	jae    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   140135445:	mov    0xc0(%rsp),%rcx
   14013544d:	call   140152c50 <setun::ArrayObject::size() const>
   140135452:	cmp    %rax,%rdi
   140135455:	jae    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   14013545b:	mov    0xc0(%rsp),%rcx
   140135463:	mov    %rdi,%rdx
   140135466:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   14013546b:	mov    0x80(%rsp),%rcx
   140135473:	lea    0x680(%rsp),%rdx
   14013547b:	mov    %rax,0x680(%rsp)
   140135483:	call   140228f80 <setun::VMValue::mul(setun::VMValue const&) const>
   140135488:	mov    0x40(%rsp),%rdx
   14013548d:	mov    0xa0(%rsp),%rcx
   140135495:	mov    %rax,0x520(%rsp)
   14013549d:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   1401354a2:	lea    0x520(%rsp),%rdx
   1401354aa:	lea    0x680(%rsp),%rcx
   1401354b2:	mov    %rax,0x680(%rsp)
   1401354ba:	call   140227fc0 <setun::VMValue::add(setun::VMValue const&) const>
   1401354bf:	mov    0x40(%rsp),%rdx
   1401354c4:	mov    0xa0(%rsp),%rcx
   1401354cc:	lea    0x540(%rsp),%r8
   1401354d4:	mov    %rax,0x540(%rsp)
   1401354dc:	call   140156ab0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   1401354e1:	jmp    140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   1401354e6:	mov    %r8,%rdx
   1401354e9:	lea    0x1048(%rbx),%rcx
   1401354f0:	vzeroupper
   1401354f3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401354f8:	mov    0x1048(%rbx),%rdx
   1401354ff:	mov    0x1050(%rbx),%rax
   140135506:	lea    (%rdx,%r12,1),%rsi
   14013550a:	jmp    140132a3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf45b>
   14013550f:	mov    0x1050(%rbx),%rax
   140135516:	mov    0x1048(%rbx),%rdx
   14013551d:	mov    %rax,0x30(%rsp)
   140135522:	sub    %rdx,%rax
   140135525:	sar    $0x3,%rax
   140135529:	lea    (%rax,%rax,1),%rcx
   14013552d:	cmp    %rcx,%rax
   140135530:	jae    140130e2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd84a>
   140135536:	sub    %rdx,%r14
   140135539:	mov    %rcx,%rdx
   14013553c:	lea    0x1048(%rbx),%rcx
   140135543:	vzeroupper
   140135546:	jmp    1401312a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcc9>
   14013554b:	mov    %r14,%rsi
   14013554e:	jmp    140127d57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4777>
   140135553:	mov    $0xffff,%eax
   140135558:	mov    $0x1fff,%edx
   14013555d:	shl    $0x30,%rax
   140135561:	shl    $0x33,%rdx
   140135565:	and    0x338(%rsp),%rax
   14013556d:	cmp    %rdx,%rax
   140135570:	jne    14013122e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc4e>
   140135576:	mov    %r14,%rsi
   140135579:	jmp    14012d8a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2c8>
   14013557e:	mov    %r8,%rdx
   140135581:	lea    0x1048(%rbx),%rcx
   140135588:	vzeroupper
   14013558b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135590:	mov    0x1048(%rbx),%rdx
   140135597:	mov    0x1050(%rbx),%rax
   14013559e:	lea    (%rdx,%r12,1),%rsi
   1401355a2:	jmp    1401341bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bdb>
   1401355a7:	mov    %r8,%rdx
   1401355aa:	lea    0x1048(%rbx),%rcx
   1401355b1:	vzeroupper
   1401355b4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401355b9:	mov    0x1048(%rbx),%rdx
   1401355c0:	mov    0x1050(%rbx),%rax
   1401355c7:	lea    (%rdx,%r12,1),%rsi
   1401355cb:	jmp    14013410b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b2b>
   1401355d0:	mov    %r8,%rdx
   1401355d3:	lea    0x1048(%rbx),%rcx
   1401355da:	vzeroupper
   1401355dd:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401355e2:	mov    0x1048(%rbx),%rdx
   1401355e9:	mov    0x1050(%rbx),%rax
   1401355f0:	lea    (%rdx,%r12,1),%rsi
   1401355f4:	jmp    14013374e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1016e>
   1401355f9:	mov    0x1050(%rbx),%rax
   140135600:	mov    %rax,0x30(%rsp)
   140135605:	sub    %rdx,%rax
   140135608:	sar    $0x3,%rax
   14013560c:	lea    (%rax,%rax,1),%r8
   140135610:	cmp    %r8,%rax
   140135613:	jae    14012e530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf50>
   140135619:	sub    %rdx,%rsi
   14013561c:	lea    0x1048(%rbx),%rcx
   140135623:	mov    %r8,%rdx
   140135626:	vzeroupper
   140135629:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013562e:	mov    0x1048(%rbx),%rdx
   140135635:	mov    0x1050(%rbx),%rax
   14013563c:	add    %rdx,%rsi
   14013563f:	mov    %rax,0x30(%rsp)
   140135644:	lea    0x10(%rsi),%rcx
   140135648:	jmp    14012e530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf50>
   14013564d:	mov    %eax,0x60(%rsp)
   140135651:	add    %rdx,%rdx
   140135654:	lea    0x1068(%rbx),%rcx
   14013565b:	mov    %r8d,0x80(%rsp)
   140135663:	mov    %r9d,0x40(%rsp)
   140135668:	vzeroupper
   14013566b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135670:	mov    0x1070(%rbx),%rdx
   140135677:	sub    0x1068(%rbx),%rdx
   14013567e:	mov    0x80(%rsp),%r8d
   140135686:	mov    0x60(%rsp),%eax
   14013568a:	sar    $0x3,%rdx
   14013568e:	mov    0x40(%rsp),%r9d
   140135693:	jmp    140124311 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd31>
   140135698:	mov    0x1050(%rbx),%rax
   14013569f:	mov    %rsi,%r12
   1401356a2:	sub    %rdx,%r12
   1401356a5:	mov    %rax,%rcx
   1401356a8:	sub    %rdx,%rcx
   1401356ab:	sar    $0x3,%rcx
   1401356af:	lea    (%rcx,%rcx,1),%r9
   1401356b3:	cmp    %r9,%rcx
   1401356b6:	jb     140137a45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14465>
   1401356bc:	vzeroupper
   1401356bf:	jmp    14012ea97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4b7>
   1401356c4:	lea    0x15270(%rbx),%rcx
   1401356cb:	mov    %rbx,%rdx
   1401356ce:	vzeroupper
   1401356d1:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401356d6:	jmp    140130d2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd74b>
   1401356db:	mov    %r8,%rdx
   1401356de:	lea    0x1048(%rbx),%rcx
   1401356e5:	vzeroupper
   1401356e8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401356ed:	mov    0x1048(%rbx),%rdx
   1401356f4:	mov    0x1050(%rbx),%rax
   1401356fb:	lea    (%rdx,%r12,1),%rsi
   1401356ff:	jmp    140133877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10297>
   140135704:	mov    0x1c8(%rsp),%rax
   14013570c:	mov    0x50(%rdi),%rdx
   140135710:	sub    0x48(%rdi),%rdx
   140135714:	mov    %rax,0x1d0(%rsp)
   14013571c:	mov    0x60(%rdi),%rax
   140135720:	sar    $0x3,%rdx
   140135724:	test   %rax,%rax
   140135727:	je     140138322 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d42>
   14013572d:	mov    0x18(%rax),%rax
   140135731:	add    %rax,%rdx
   140135734:	lea    0x680(%rsp),%rcx
   14013573c:	mov    $0x2,%r12d
   140135742:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140135747:	mov    0x680(%rsp),%rax
   14013574f:	mov    %rax,0x1c8(%rsp)
   140135757:	jmp    140132911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf331>
   14013575c:	mov    0x40(%rsp),%rdx
   140135761:	mov    %rdi,%rcx
   140135764:	call   14022cf00 <setun::VMObject::has_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140135769:	test   %al,%al
   14013576b:	je     140136fbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139db>
   140135771:	test   %r12b,%r12b
   140135774:	je     140136f9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139bb>
   14013577a:	sub    $0x1,%r12b
   14013577e:	je     140136f6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1398b>
   140135784:	lea    0x8(%rsi),%r8
   140135788:	cmp    0x30(%rsp),%r8
   14013578d:	jae    140136f19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13939>
   140135793:	mov    0x1d0(%rsp),%rax
   14013579b:	mov    0x40(%rsp),%rdx
   1401357a0:	mov    %rdi,%rcx
   1401357a3:	mov    %r8,0x60(%rsp)
   1401357a8:	mov    $0x2,%r12d
   1401357ae:	mov    %rax,(%rsi)
   1401357b1:	mov    0x1c8(%rsp),%rax
   1401357b9:	mov    %rax,0x1d0(%rsp)
   1401357c1:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401357c6:	mov    0x60(%rsp),%rsi
   1401357cb:	mov    %rax,0x1c8(%rsp)
   1401357d3:	cmpb   $0x0,0x1040(%rbx)
   1401357da:	je     14012a33e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5e>
   1401357e0:	movzbl 0x2(%rbp),%eax
   1401357e4:	lea    0x29d8b5(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401357eb:	add    $0x3,%rbp
   1401357ef:	mov    (%rdi,%rax,8),%rax
   1401357f3:	jmp    *%rax
   1401357f5:	mov    0x1c8(%rsp),%rax
   1401357fd:	xor    %edx,%edx
   1401357ff:	mov    %rax,0x1d0(%rsp)
   140135807:	test   %rdi,%rdi
   14013580a:	je     140135817 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12237>
   14013580c:	mov    %rdi,%rcx
   14013580f:	call   140152c50 <setun::ArrayObject::size() const>
   140135814:	mov    %rax,%rdx
   140135817:	lea    0x680(%rsp),%rcx
   14013581f:	mov    $0x2,%r12d
   140135825:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14013582a:	mov    0x680(%rsp),%rax
   140135832:	mov    %rax,0x1c8(%rsp)
   14013583a:	jmp    140130bd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5f7>
   14013583f:	mov    0x1050(%rbx),%rax
   140135846:	mov    %rsi,%r12
   140135849:	sub    %rdx,%r12
   14013584c:	mov    %rax,%rcx
   14013584f:	sub    %rdx,%rcx
   140135852:	sar    $0x3,%rcx
   140135856:	lea    (%rcx,%rcx,1),%r9
   14013585a:	cmp    %r9,%rcx
   14013585d:	jb     140138329 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d49>
   140135863:	vzeroupper
   140135866:	jmp    14012ef00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb920>
   14013586b:	mov    0x1050(%rbx),%rax
   140135872:	mov    %rsi,%r12
   140135875:	sub    %rdx,%r12
   140135878:	mov    %rax,%rcx
   14013587b:	sub    %rdx,%rcx
   14013587e:	sar    $0x3,%rcx
   140135882:	lea    (%rcx,%rcx,1),%r9
   140135886:	cmp    %r9,%rcx
   140135889:	jae    14012ebd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5f0>
   14013588f:	mov    %r9,%rdx
   140135892:	lea    0x1048(%rbx),%rcx
   140135899:	vzeroupper
   14013589c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401358a1:	mov    0x1048(%rbx),%rdx
   1401358a8:	mov    0x1050(%rbx),%rax
   1401358af:	lea    (%rdx,%r12,1),%rsi
   1401358b3:	lea    0x8(%rsi),%r8
   1401358b7:	jmp    14012ebd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5f0>
   1401358bc:	mov    0x1050(%rbx),%rax
   1401358c3:	mov    0x1048(%rbx),%rdx
   1401358ca:	mov    %rax,0x30(%rsp)
   1401358cf:	sub    %rdx,%rax
   1401358d2:	sar    $0x3,%rax
   1401358d6:	lea    (%rax,%rax,1),%rcx
   1401358da:	cmp    %rcx,%rax
   1401358dd:	jae    14012e585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa5>
   1401358e3:	sub    %rdx,%rsi
   1401358e6:	mov    %rcx,%rdx
   1401358e9:	lea    0x1048(%rbx),%rcx
   1401358f0:	vzeroupper
   1401358f3:	jmp    140132724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf144>
   1401358f8:	mov    0x1c8(%rsp),%rax
   140135900:	lea    0x680(%rsp),%rcx
   140135908:	lea    0x238233(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   14013590f:	mov    %rax,0x1d0(%rsp)
   140135917:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   14013591c:	mov    0x680(%rsp),%rax
   140135924:	mov    $0x2,%r12d
   14013592a:	mov    %rax,0x1c8(%rsp)
   140135932:	jmp    14012e9e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb408>
   140135937:	mov    0x1050(%rbx),%rax
   14013593e:	mov    %rsi,%r12
   140135941:	sub    %rdx,%r12
   140135944:	mov    %rax,%rcx
   140135947:	sub    %rdx,%rcx
   14013594a:	sar    $0x3,%rcx
   14013594e:	lea    (%rcx,%rcx,1),%r9
   140135952:	cmp    %r9,%rcx
   140135955:	jb     140138e4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1586d>
   14013595b:	vzeroupper
   14013595e:	jmp    14012eb43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb563>
   140135963:	mov    0x1050(%rbx),%rax
   14013596a:	mov    %rsi,%r12
   14013596d:	sub    %rdx,%r12
   140135970:	mov    %rax,%rcx
   140135973:	sub    %rdx,%rcx
   140135976:	sar    $0x3,%rcx
   14013597a:	lea    (%rcx,%rcx,1),%r9
   14013597e:	cmp    %r9,%rcx
   140135981:	jb     1401377c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141e5>
   140135987:	vzeroupper
   14013598a:	jmp    14012ec60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb680>
   14013598f:	mov    0x1050(%rbx),%rax
   140135996:	mov    %rsi,%r12
   140135999:	sub    %rdx,%r12
   14013599c:	mov    %rax,%rcx
   14013599f:	sub    %rdx,%rcx
   1401359a2:	sar    $0x3,%rcx
   1401359a6:	lea    (%rcx,%rcx,1),%r9
   1401359aa:	cmp    %r9,%rcx
   1401359ad:	jb     14013913b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15b5b>
   1401359b3:	vzeroupper
   1401359b6:	jmp    14012ed20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb740>
   1401359bb:	mov    %r8,%rdx
   1401359be:	lea    0x1048(%rbx),%rcx
   1401359c5:	vzeroupper
   1401359c8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401359cd:	mov    0x1048(%rbx),%rdx
   1401359d4:	mov    0x1050(%rbx),%rax
   1401359db:	lea    (%rdx,%r12,1),%rsi
   1401359df:	jmp    140132a89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4a9>
   1401359e4:	mov    %r8,%rdx
   1401359e7:	lea    0x1048(%rbx),%rcx
   1401359ee:	vzeroupper
   1401359f1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401359f6:	mov    0x1048(%rbx),%rdx
   1401359fd:	mov    0x1050(%rbx),%rax
   140135a04:	lea    (%rdx,%r12,1),%rsi
   140135a08:	jmp    1401337c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101e3>
   140135a0d:	mov    0x400(%rsp),%rdi
   140135a15:	test   %r12b,%r12b
   140135a18:	je     140139061 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15a81>
   140135a1e:	sub    $0x1,%r12b
   140135a22:	je     140138fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159c5>
   140135a28:	lea    0x8(%rsi),%r8
   140135a2c:	cmp    0x30(%rsp),%r8
   140135a31:	jae    14013900c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15a2c>
   140135a37:	mov    0x1d0(%rsp),%rax
   140135a3f:	mov    %r8,0x40(%rsp)
   140135a44:	lea    0x680(%rsp),%rcx
   140135a4c:	mov    %rdi,%rdx
   140135a4f:	mov    %rax,(%rsi)
   140135a52:	mov    0x1c8(%rsp),%rax
   140135a5a:	mov    %rax,0x1d0(%rsp)
   140135a62:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140135a67:	mov    $0x2,%r12d
   140135a6d:	mov    0x40(%rsp),%rsi
   140135a72:	mov    0x680(%rsp),%rax
   140135a7a:	mov    %rax,0x1c8(%rsp)
   140135a82:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   140135a87:	mov    0x1050(%rbx),%rax
   140135a8e:	mov    %rsi,%r12
   140135a91:	sub    %rdx,%r12
   140135a94:	mov    %rax,%rcx
   140135a97:	sub    %rdx,%rcx
   140135a9a:	sar    $0x3,%rcx
   140135a9e:	lea    (%rcx,%rcx,1),%r9
   140135aa2:	cmp    %r9,%rcx
   140135aa5:	jb     1401390b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15ad4>
   140135aab:	vzeroupper
   140135aae:	jmp    14012e78e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1ae>
   140135ab3:	mov    0x1050(%rbx),%rax
   140135aba:	mov    %rsi,%r12
   140135abd:	sub    %rdx,%r12
   140135ac0:	mov    %rax,%rcx
   140135ac3:	sub    %rdx,%rcx
   140135ac6:	sar    $0x3,%rcx
   140135aca:	lea    (%rcx,%rcx,1),%r9
   140135ace:	cmp    %r9,%rcx
   140135ad1:	jb     140137494 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13eb4>
   140135ad7:	vzeroupper
   140135ada:	jmp    14012e72e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb14e>
   140135adf:	mov    0x1050(%rbx),%rax
   140135ae6:	mov    %rsi,%r12
   140135ae9:	sub    %rdx,%r12
   140135aec:	mov    %rax,%rcx
   140135aef:	sub    %rdx,%rcx
   140135af2:	sar    $0x3,%rcx
   140135af6:	lea    (%rcx,%rcx,1),%r9
   140135afa:	cmp    %r9,%rcx
   140135afd:	jb     140138130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b50>
   140135b03:	vzeroupper
   140135b06:	jmp    14012ee10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb830>
   140135b0b:	mov    0x540(%rsp),%rax
   140135b13:	lea    0x690(%rsp),%r12
   140135b1b:	mov    $0x1,%edx
   140135b20:	lea    0x680(%rsp),%rcx
   140135b28:	movsbl (%rax,%rdi,1),%r8d
   140135b2d:	mov    %r12,0x680(%rsp)
   140135b35:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140135b3a:	lea    0x680(%rsp),%rdx
   140135b42:	lea    0x520(%rsp),%rcx
   140135b4a:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140135b4f:	mov    0x520(%rsp),%rax
   140135b57:	mov    0x680(%rsp),%rcx
   140135b5f:	mov    %rax,0x1c8(%rsp)
   140135b67:	cmp    %r12,%rcx
   140135b6a:	je     14013400a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a2a>
   140135b70:	mov    0x690(%rsp),%rax
   140135b78:	lea    0x1(%rax),%rdx
   140135b7c:	call   14034a160 <operator delete(void*, unsigned long long)>
   140135b81:	jmp    14013400a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a2a>
   140135b86:	mov    %r8,%rdx
   140135b89:	lea    0x1048(%rbx),%rcx
   140135b90:	vzeroupper
   140135b93:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135b98:	mov    0x1048(%rbx),%rdx
   140135b9f:	mov    0x1050(%rbx),%rax
   140135ba6:	lea    (%rdx,%r12,1),%rsi
   140135baa:	jmp    140132f47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf967>
   140135baf:	mov    %r9,0x40(%rsp)
   140135bb4:	mov    %r8,%rdx
   140135bb7:	lea    0x1048(%rbx),%rcx
   140135bbe:	vzeroupper
   140135bc1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135bc6:	mov    0x1048(%rbx),%rdx
   140135bcd:	mov    0x1050(%rbx),%rax
   140135bd4:	mov    0x40(%rsp),%r9
   140135bd9:	mov    %rax,0x30(%rsp)
   140135bde:	add    %rbp,%rdx
   140135be1:	jmp    140133afa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1051a>
   140135be6:	mov    %r8,%rdx
   140135be9:	lea    0x1048(%rbx),%rcx
   140135bf0:	vzeroupper
   140135bf3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135bf8:	mov    0x1048(%rbx),%rdx
   140135bff:	mov    0x1050(%rbx),%rax
   140135c06:	lea    (%rdx,%r12,1),%rsi
   140135c0a:	jmp    140132223 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec43>
   140135c0f:	mov    %r8,%rdx
   140135c12:	lea    0x1048(%rbx),%rcx
   140135c19:	vzeroupper
   140135c1c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135c21:	mov    0x1048(%rbx),%rdx
   140135c28:	mov    0x1050(%rbx),%rax
   140135c2f:	lea    (%rdx,%r12,1),%rsi
   140135c33:	jmp    1401340bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10add>
   140135c38:	mov    0x1c8(%rsp),%rax
   140135c40:	lea    0x690(%rsp),%r12
   140135c48:	mov    $0x1,%edx
   140135c4d:	lea    0x680(%rsp),%rcx
   140135c55:	mov    %rax,0x1d0(%rsp)
   140135c5d:	mov    0x540(%rsp),%rax
   140135c65:	movsbl (%rax,%rdi,1),%r8d
   140135c6a:	mov    %r12,0x680(%rsp)
   140135c72:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140135c77:	lea    0x680(%rsp),%rdx
   140135c7f:	lea    0x520(%rsp),%rcx
   140135c87:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140135c8c:	mov    0x520(%rsp),%rax
   140135c94:	mov    0x680(%rsp),%rcx
   140135c9c:	mov    %rax,0x1c8(%rsp)
   140135ca4:	cmp    %r12,%rcx
   140135ca7:	je     140131aed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe50d>
   140135cad:	mov    0x690(%rsp),%rax
   140135cb5:	lea    0x1(%rax),%rdx
   140135cb9:	call   14034a160 <operator delete(void*, unsigned long long)>
   140135cbe:	jmp    140131aed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe50d>
   140135cc3:	test   %r12b,%r12b
   140135cc6:	je     140138055 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a75>
   140135ccc:	sub    $0x1,%r12b
   140135cd0:	je     140138020 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a40>
   140135cd6:	lea    0x8(%r14),%r12
   140135cda:	cmp    0x30(%rsp),%r12
   140135cdf:	jae    140137fce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149ee>
   140135ce5:	mov    0x1d0(%rsp),%rax
   140135ced:	movslq %edi,%rdx
   140135cf0:	mov    %rax,(%r14)
   140135cf3:	mov    0x1c8(%rsp),%rax
   140135cfb:	mov    %rax,0x1d0(%rsp)
   140135d03:	jmp    140132629 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf049>
   140135d08:	test   %r12b,%r12b
   140135d0b:	jne    1401377f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14212>
   140135d11:	mov    0x50(%rdi),%rax
   140135d15:	mov    $0x1,%r12d
   140135d1b:	movabs $0xfffc000000000000,%rdx
   140135d25:	vmovsd (%rax,%r14,8),%xmm0
   140135d2b:	vucomisd %xmm0,%xmm0
   140135d2f:	vmovq  %xmm0,%rax
   140135d34:	cmovp  %rdx,%rax
   140135d38:	mov    %rax,0x1c8(%rsp)
   140135d40:	cmpb   $0x0,0x1040(%rbx)
   140135d47:	je     14012a33b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d5b>
   140135d4d:	movzbl 0x0(%rbp),%eax
   140135d51:	lea    0x29d348(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135d58:	add    $0x1,%rbp
   140135d5c:	mov    (%rdi,%rax,8),%rax
   140135d60:	jmp    *%rax
   140135d62:	mov    0x1050(%rbx),%rax
   140135d69:	mov    %rsi,%r12
   140135d6c:	sub    %rdx,%r12
   140135d6f:	mov    %rax,%rcx
   140135d72:	sub    %rdx,%rcx
   140135d75:	sar    $0x3,%rcx
   140135d79:	lea    (%rcx,%rcx,1),%r9
   140135d7d:	cmp    %r9,%rcx
   140135d80:	jb     14013818a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14baa>
   140135d86:	vzeroupper
   140135d89:	jmp    14012e7be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1de>
   140135d8e:	mov    %r8,%rdx
   140135d91:	lea    0x1048(%rbx),%rcx
   140135d98:	vzeroupper
   140135d9b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135da0:	mov    0x1048(%rbx),%rdx
   140135da7:	mov    0x1050(%rbx),%rax
   140135dae:	lea    (%rdx,%r12,1),%rsi
   140135db2:	jmp    1401335f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10010>
   140135db7:	mov    %rsi,%rdx
   140135dba:	test   %r12b,%r12b
   140135dbd:	je     140134fcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119ec>
   140135dc3:	sub    $0x1,%r12b
   140135dc7:	je     1401379bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143df>
   140135dcd:	lea    0x8(%r14),%r12
   140135dd1:	cmp    0x30(%rsp),%r12
   140135dd6:	jae    14013796d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1438d>
   140135ddc:	mov    0x1d0(%rsp),%rax
   140135de4:	mov    %rsi,%rdx
   140135de7:	mov    %rax,(%r14)
   140135dea:	mov    0x1c8(%rsp),%rax
   140135df2:	mov    %rax,0x1d0(%rsp)
   140135dfa:	jmp    140132629 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf049>
   140135dff:	mov    0x1050(%rbx),%rax
   140135e06:	mov    %rsi,%r12
   140135e09:	sub    %rdx,%r12
   140135e0c:	mov    %rax,%rcx
   140135e0f:	sub    %rdx,%rcx
   140135e12:	sar    $0x3,%rcx
   140135e16:	lea    (%rcx,%rcx,1),%r9
   140135e1a:	cmp    %r9,%rcx
   140135e1d:	jb     140137940 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14360>
   140135e23:	vzeroupper
   140135e26:	jmp    14012ed80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7a0>
   140135e2b:	mov    0x1050(%rbx),%rax
   140135e32:	mov    %rsi,%r12
   140135e35:	sub    %rdx,%r12
   140135e38:	mov    %rax,%rcx
   140135e3b:	sub    %rdx,%rcx
   140135e3e:	sar    $0x3,%rcx
   140135e42:	lea    (%rcx,%rcx,1),%r9
   140135e46:	cmp    %r9,%rcx
   140135e49:	jb     14013815d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7d>
   140135e4f:	vzeroupper
   140135e52:	jmp    14012ecc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6e0>
   140135e57:	mov    0x1050(%rbx),%rax
   140135e5e:	mov    %rsi,%r12
   140135e61:	sub    %rdx,%r12
   140135e64:	mov    %rax,%rcx
   140135e67:	sub    %rdx,%rcx
   140135e6a:	sar    $0x3,%rcx
   140135e6e:	lea    (%rcx,%rcx,1),%r9
   140135e72:	cmp    %r9,%rcx
   140135e75:	jb     140138560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f80>
   140135e7b:	vzeroupper
   140135e7e:	jmp    14012ef30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb950>
   140135e83:	mov    0x1050(%rbx),%rax
   140135e8a:	mov    %rsi,%r12
   140135e8d:	sub    %rdx,%r12
   140135e90:	mov    %rax,%rcx
   140135e93:	sub    %rdx,%rcx
   140135e96:	sar    $0x3,%rcx
   140135e9a:	lea    (%rcx,%rcx,1),%r9
   140135e9e:	cmp    %r9,%rcx
   140135ea1:	jb     140138236 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c56>
   140135ea7:	vzeroupper
   140135eaa:	jmp    14012e75e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb17e>
   140135eaf:	mov    0x1048(%rbx),%rcx
   140135eb6:	mov    0x1050(%rbx),%rax
   140135ebd:	mov    %rsi,%r12
   140135ec0:	mov    %rax,0x30(%rsp)
   140135ec5:	sub    %rcx,%rax
   140135ec8:	sub    %rcx,%r12
   140135ecb:	mov    %rax,%rdx
   140135ece:	sar    $0x3,%rdx
   140135ed2:	lea    (%rdx,%rdx,1),%rcx
   140135ed6:	cmp    %rcx,%rdx
   140135ed9:	jae    14012e8cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ed>
   140135edf:	mov    %r9,0x40(%rsp)
   140135ee4:	mov    %rcx,%rdx
   140135ee7:	lea    0x1048(%rbx),%rcx
   140135eee:	vzeroupper
   140135ef1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135ef6:	mov    0x1048(%rbx),%rsi
   140135efd:	mov    0x1050(%rbx),%rax
   140135f04:	mov    0x40(%rsp),%r9
   140135f09:	add    %r12,%rsi
   140135f0c:	mov    %rax,0x30(%rsp)
   140135f11:	lea    0x8(%rsi),%r8
   140135f15:	jmp    14012e8cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ed>
   140135f1a:	mov    0x1050(%rbx),%rax
   140135f21:	mov    %rsi,%r12
   140135f24:	sub    %rdx,%r12
   140135f27:	mov    %rax,%rcx
   140135f2a:	sub    %rdx,%rcx
   140135f2d:	sar    $0x3,%rcx
   140135f31:	lea    (%rcx,%rcx,1),%r9
   140135f35:	cmp    %r9,%rcx
   140135f38:	jb     140137855 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14275>
   140135f3e:	vzeroupper
   140135f41:	jmp    14012ec00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb620>
   140135f46:	mov    0x1050(%rbx),%rax
   140135f4d:	mov    %rsi,%r12
   140135f50:	sub    %rdx,%r12
   140135f53:	mov    %rax,%rcx
   140135f56:	sub    %rdx,%rcx
   140135f59:	sar    $0x3,%rcx
   140135f5d:	lea    (%rcx,%rcx,1),%r9
   140135f61:	cmp    %r9,%rcx
   140135f64:	jb     140138209 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c29>
   140135f6a:	vzeroupper
   140135f6d:	jmp    14012e6fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb11e>
   140135f72:	mov    0x1c8(%rsp),%rax
   140135f7a:	lea    0x680(%rsp),%rcx
   140135f82:	lea    0x3e0(%rsp),%rdx
   140135f8a:	mov    %rax,0x1d0(%rsp)
   140135f92:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140135f97:	mov    0x688(%rsp),%rdx
   140135f9f:	lea    0x540(%rsp),%rcx
   140135fa7:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140135fac:	jmp    14012e4b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaed2>
   140135fb1:	mov    0x1050(%rbx),%rax
   140135fb8:	mov    %rsi,%r12
   140135fbb:	sub    %rdx,%r12
   140135fbe:	mov    %rax,%rcx
   140135fc1:	sub    %rdx,%rcx
   140135fc4:	sar    $0x3,%rcx
   140135fc8:	lea    (%rcx,%rcx,1),%r9
   140135fcc:	cmp    %r9,%rcx
   140135fcf:	jb     140138290 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cb0>
   140135fd5:	vzeroupper
   140135fd8:	jmp    14012e7ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb20e>
   140135fdd:	lea    0x520(%rsp),%r8
   140135fe5:	mov    0x40(%rsp),%rdx
   140135fea:	mov    %r8,%rcx
   140135fed:	mov    %r8,0x40(%rsp)
   140135ff2:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140135ff7:	mov    0x40(%rsp),%r8
   140135ffc:	jmp    14012dc65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa685>
   140136001:	mov    0x1050(%rbx),%rax
   140136008:	mov    %rsi,%r12
   14013600b:	sub    %rdx,%r12
   14013600e:	mov    %rax,%rcx
   140136011:	sub    %rdx,%rcx
   140136014:	sar    $0x3,%rcx
   140136018:	lea    (%rcx,%rcx,1),%r9
   14013601c:	cmp    %r9,%rcx
   14013601f:	jb     140137882 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142a2>
   140136025:	vzeroupper
   140136028:	jmp    14012e87e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb29e>
   14013602d:	mov    0x1050(%rbx),%rax
   140136034:	mov    %rsi,%r12
   140136037:	sub    %rdx,%r12
   14013603a:	mov    %rax,%rcx
   14013603d:	sub    %rdx,%rcx
   140136040:	sar    $0x3,%rcx
   140136044:	lea    (%rcx,%rcx,1),%r9
   140136048:	cmp    %r9,%rcx
   14013604b:	jb     140138263 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c83>
   140136051:	vzeroupper
   140136054:	jmp    14012e84e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb26e>
   140136059:	mov    %r9,0x40(%rsp)
   14013605e:	lea    0x3d8(%rsp),%rcx
   140136066:	mov    %rdx,0x3d8(%rsp)
   14013606e:	vzeroupper
   140136071:	call   14022b1c0 <setun::VMValue::payload() const>
   140136076:	mov    0x40(%rsp),%r9
   14013607b:	mov    0x48(%rax),%rax
   14013607f:	test   %rax,%rax
   140136082:	je     140130adc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4fc>
   140136088:	mov    0x38(%rax),%rcx
   14013608c:	test   %rcx,%rcx
   14013608f:	je     140130adc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4fc>
   140136095:	mov    (%r9),%edx
   140136098:	cmp    %edx,(%rcx)
   14013609a:	jne    140130adc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4fc>
   1401360a0:	test   %edx,%edx
   1401360a2:	je     140130adc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4fc>
   1401360a8:	movzwl 0x4(%r9),%edx
   1401360ad:	mov    0x48(%rax),%rax
   1401360b1:	sub    $0x8,%rsi
   1401360b5:	mov    $0x1,%r12d
   1401360bb:	mov    (%rax,%rdx,8),%rax
   1401360bf:	mov    %rax,0x1c8(%rsp)
   1401360c7:	cmpb   $0x0,0x1040(%rbx)
   1401360ce:	je     14012a1e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c03>
   1401360d4:	movzbl 0x2(%rbp),%eax
   1401360d8:	lea    0x29cfc1(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401360df:	add    $0x3,%rbp
   1401360e3:	mov    (%rdi,%rax,8),%rax
   1401360e7:	jmp    *%rax
   1401360e9:	mov    0x1050(%rbx),%rax
   1401360f0:	mov    %rsi,%r12
   1401360f3:	sub    %rdx,%r12
   1401360f6:	mov    %rax,%rcx
   1401360f9:	sub    %rdx,%rcx
   1401360fc:	sar    $0x3,%rcx
   140136100:	lea    (%rcx,%rcx,1),%r9
   140136104:	cmp    %r9,%rcx
   140136107:	jb     1401383b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd0>
   14013610d:	vzeroupper
   140136110:	jmp    14012e81e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb23e>
   140136115:	mov    0x1050(%rbx),%rax
   14013611c:	mov    %rsi,%r12
   14013611f:	sub    %rdx,%r12
   140136122:	mov    %rax,%rcx
   140136125:	sub    %rdx,%rcx
   140136128:	sar    $0x3,%rcx
   14013612c:	lea    (%rcx,%rcx,1),%r9
   140136130:	cmp    %r9,%rcx
   140136133:	jb     1401382bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cdd>
   140136139:	vzeroupper
   14013613c:	jmp    14012e66e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb08e>
   140136141:	lea    0x540(%rsp),%rax
   140136149:	mov    0x60(%rsp),%rdx
   14013614e:	mov    %r8,0xa0(%rsp)
   140136156:	mov    %rax,%rcx
   140136159:	mov    %rax,0x40(%rsp)
   14013615e:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140136163:	mov    0x40(%rsp),%rax
   140136168:	mov    0xa0(%rsp),%r8
   140136170:	jmp    14012dce1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa701>
   140136175:	mov    0x1050(%rbx),%rax
   14013617c:	mov    %rsi,%r12
   14013617f:	sub    %rdx,%r12
   140136182:	mov    %rax,%rcx
   140136185:	sub    %rdx,%rcx
   140136188:	sar    $0x3,%rcx
   14013618c:	lea    (%rcx,%rcx,1),%r9
   140136190:	cmp    %r9,%rcx
   140136193:	jb     1401387fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1521a>
   140136199:	vzeroupper
   14013619c:	jmp    14012eed0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8f0>
   1401361a1:	mov    0x1050(%rbx),%rax
   1401361a8:	mov    %rsi,%r12
   1401361ab:	sub    %rdx,%r12
   1401361ae:	mov    %rax,%rcx
   1401361b1:	sub    %rdx,%rcx
   1401361b4:	sar    $0x3,%rcx
   1401361b8:	lea    (%rcx,%rcx,1),%r9
   1401361bc:	cmp    %r9,%rcx
   1401361bf:	jb     1401391e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15c07>
   1401361c5:	vzeroupper
   1401361c8:	jmp    14012ecf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb710>
   1401361cd:	mov    %r8,%rdx
   1401361d0:	lea    0x1048(%rbx),%rcx
   1401361d7:	vzeroupper
   1401361da:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401361df:	mov    0x1048(%rbx),%rdx
   1401361e6:	mov    0x1050(%rbx),%rax
   1401361ed:	lea    (%rdx,%r12,1),%rsi
   1401361f1:	jmp    140132ef9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf919>
   1401361f6:	mov    0x40(%rsp),%rcx
   1401361fb:	lea    0x318(%rsp),%r8
   140136203:	mov    %rdi,%rdx
   140136206:	call   140156ab0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14013620b:	jmp    140130186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcba6>
   140136210:	mov    0x1050(%rbx),%rax
   140136217:	mov    0x1048(%rbx),%rdx
   14013621e:	mov    %rax,0x30(%rsp)
   140136223:	sub    %rdx,%rax
   140136226:	sar    $0x3,%rax
   14013622a:	lea    (%rax,%rax,1),%rcx
   14013622e:	cmp    %rcx,%rax
   140136231:	jae    14012f4d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbef2>
   140136237:	sub    %rdx,%rsi
   14013623a:	mov    %rcx,%rdx
   14013623d:	lea    0x1048(%rbx),%rcx
   140136244:	vzeroupper
   140136247:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013624c:	mov    0x1050(%rbx),%rax
   140136253:	add    0x1048(%rbx),%rsi
   14013625a:	lea    0x8(%rsi),%r8
   14013625e:	mov    %rax,0x30(%rsp)
   140136263:	jmp    14012f4d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbef2>
   140136268:	mov    %r8,%rdx
   14013626b:	lea    0x1048(%rbx),%rcx
   140136272:	vzeroupper
   140136275:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013627a:	mov    0x1048(%rbx),%rdx
   140136281:	mov    0x1050(%rbx),%rax
   140136288:	lea    (%rdx,%r12,1),%rsi
   14013628c:	jmp    140133811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10231>
   140136291:	mov    0x1050(%rbx),%rax
   140136298:	mov    %rsi,%r12
   14013629b:	sub    %rdx,%r12
   14013629e:	mov    %rax,%rcx
   1401362a1:	sub    %rdx,%rcx
   1401362a4:	sar    $0x3,%rcx
   1401362a8:	lea    (%rcx,%rcx,1),%r9
   1401362ac:	cmp    %r9,%rcx
   1401362af:	jb     140136e9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138be>
   1401362b5:	vzeroupper
   1401362b8:	jmp    14012eb73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb593>
   1401362bd:	lea    0x1048(%rbx),%rcx
   1401362c4:	mov    %r9,%rdx
   1401362c7:	vzeroupper
   1401362ca:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401362cf:	mov    0x1048(%rbx),%rdx
   1401362d6:	mov    0x1050(%rbx),%rax
   1401362dd:	lea    (%rdx,%rdi,1),%rsi
   1401362e1:	lea    0x10(%rsi),%rcx
   1401362e5:	jmp    14012ba3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x845e>
   1401362ea:	mov    0x1050(%rbx),%rax
   1401362f1:	mov    %rsi,%r12
   1401362f4:	sub    %rdx,%r12
   1401362f7:	mov    %rax,%rcx
   1401362fa:	sub    %rdx,%rcx
   1401362fd:	sar    $0x3,%rcx
   140136301:	lea    (%rcx,%rcx,1),%r9
   140136305:	cmp    %r9,%rcx
   140136308:	jb     1401393ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e0e>
   14013630e:	vzeroupper
   140136311:	jmp    14012e69e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0be>
   140136316:	mov    %r8,%rdx
   140136319:	lea    0x1048(%rbx),%rcx
   140136320:	vzeroupper
   140136323:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136328:	mov    0x1048(%rbx),%rdx
   14013632f:	mov    0x1050(%rbx),%rax
   140136336:	lea    (%rdx,%r12,1),%rsi
   14013633a:	jmp    140133190 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbb0>
   14013633f:	lea    0x338(%rsp),%rdx
   140136347:	lea    0x680(%rsp),%rcx
   14013634f:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140136354:	mov    %rsi,%rcx
   140136357:	lea    0x680(%rsp),%rdx
   14013635f:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140136364:	mov    0x680(%rsp),%rcx
   14013636c:	mov    %rax,0x1c8(%rsp)
   140136374:	lea    0x690(%rsp),%rax
   14013637c:	cmp    %rax,%rcx
   14013637f:	je     140136392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12db2>
   140136381:	mov    0x690(%rsp),%rax
   140136389:	lea    0x1(%rax),%rdx
   14013638d:	call   14034a160 <operator delete(void*, unsigned long long)>
   140136392:	mov    %r14,%rsi
   140136395:	jmp    140127d69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4789>
   14013639a:	test   %r12b,%r12b
   14013639d:	jne    140131260 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc80>
   1401363a3:	mov    $0x1fff,%eax
   1401363a8:	mov    %r14,%rsi
   1401363ab:	mov    $0x1,%r12d
   1401363b1:	shl    $0x33,%rax
   1401363b5:	mov    %rax,0x1c8(%rsp)
   1401363bd:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   1401363c2:	mov    0x1c8(%rsp),%rax
   1401363ca:	mov    %rax,0x1d0(%rsp)
   1401363d2:	movabs $0xfff8000000000003,%rax
   1401363dc:	mov    %rax,0x1c8(%rsp)
   1401363e4:	mov    $0x2,%r12d
   1401363ea:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   1401363ef:	nop
   1401363f0:	mov    0x1050(%rbx),%rax
   1401363f7:	mov    %rsi,%r12
   1401363fa:	sub    %rdx,%r12
   1401363fd:	mov    %rax,%rcx
   140136400:	sub    %rdx,%rcx
   140136403:	sar    $0x3,%rcx
   140136407:	lea    (%rcx,%rcx,1),%r9
   14013640b:	cmp    %r9,%rcx
   14013640e:	jb     1401384ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f0f>
   140136414:	vzeroupper
   140136417:	jmp    14012e8ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ce>
   14013641c:	mov    %r8,%rdx
   14013641f:	lea    0x1048(%rbx),%rcx
   140136426:	vzeroupper
   140136429:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013642e:	mov    0x1048(%rbx),%rdx
   140136435:	mov    0x1050(%rbx),%rax
   14013643c:	lea    (%rdx,%r12,1),%rsi
   140136440:	jmp    140134231 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c51>
   140136445:	mov    %rdi,%rcx
   140136448:	call   140152c50 <setun::ArrayObject::size() const>
   14013644d:	add    %rax,%r14
   140136450:	jns    14012fd5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc77f>
   140136456:	jmp    140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4822>
   14013645b:	mov    %r8,%rdx
   14013645e:	lea    0x1048(%rbx),%rcx
   140136465:	vzeroupper
   140136468:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013646d:	mov    0x1048(%rbx),%rdx
   140136474:	mov    0x1050(%rbx),%rax
   14013647b:	lea    (%rdx,%r12,1),%rsi
   14013647f:	jmp    140133142 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb62>
   140136484:	mov    %r8,%rdx
   140136487:	lea    0x1048(%rbx),%rcx
   14013648e:	vzeroupper
   140136491:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136496:	mov    0x1048(%rbx),%rdx
   14013649d:	mov    0x1050(%rbx),%rax
   1401364a4:	lea    (%rdx,%r12,1),%rsi
   1401364a8:	jmp    140133392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdb2>
   1401364ad:	mov    %r8,%rdx
   1401364b0:	lea    0x1048(%rbx),%rcx
   1401364b7:	vzeroupper
   1401364ba:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401364bf:	mov    0x1048(%rbx),%rdx
   1401364c6:	mov    0x1050(%rbx),%rax
   1401364cd:	lea    (%rdx,%r12,1),%rsi
   1401364d1:	jmp    140132fe3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa03>
   1401364d6:	mov    %r8,%rdx
   1401364d9:	lea    0x1048(%rbx),%rcx
   1401364e0:	vzeroupper
   1401364e3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401364e8:	mov    0x1048(%rbx),%rdx
   1401364ef:	mov    0x1050(%rbx),%rax
   1401364f6:	lea    (%rdx,%r12,1),%rsi
   1401364fa:	jmp    1401334b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfed6>
   1401364ff:	mov    0x1050(%rbx),%rax
   140136506:	mov    %rsi,%r12
   140136509:	sub    %rdx,%r12
   14013650c:	mov    %rax,%rcx
   14013650f:	sub    %rdx,%rcx
   140136512:	sar    $0x3,%rcx
   140136516:	lea    (%rcx,%rcx,1),%r9
   14013651a:	cmp    %r9,%rcx
   14013651d:	jb     140139168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15b88>
   140136523:	vzeroupper
   140136526:	jmp    14012eba3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5c3>
   14013652b:	mov    %r8,%rdx
   14013652e:	lea    0x1048(%rbx),%rcx
   140136535:	vzeroupper
   140136538:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013653d:	mov    0x1048(%rbx),%rdx
   140136544:	mov    0x1050(%rbx),%rax
   14013654b:	lea    (%rdx,%r12,1),%rsi
   14013654f:	jmp    140132ad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4f7>
   140136554:	mov    %r8,%rdx
   140136557:	lea    0x1048(%rbx),%rcx
   14013655e:	vzeroupper
   140136561:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136566:	mov    0x1048(%rbx),%rdx
   14013656d:	mov    0x1050(%rbx),%rax
   140136574:	lea    (%rdx,%r12,1),%rsi
   140136578:	jmp    140132b25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf545>
   14013657d:	mov    %r8,%rdx
   140136580:	lea    0x1048(%rbx),%rcx
   140136587:	vzeroupper
   14013658a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013658f:	mov    0x1048(%rbx),%rdx
   140136596:	mov    0x1050(%rbx),%rax
   14013659d:	lea    (%rdx,%r12,1),%rsi
   1401365a1:	jmp    140132b73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf593>
   1401365a6:	lea    0x1048(%rbx),%rcx
   1401365ad:	mov    %r9,%rdx
   1401365b0:	vzeroupper
   1401365b3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401365b8:	mov    0x1048(%rbx),%rdx
   1401365bf:	mov    0x1050(%rbx),%rax
   1401365c6:	lea    (%rdx,%r12,1),%rsi
   1401365ca:	lea    0x10(%rsi),%rcx
   1401365ce:	jmp    14012bc32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8652>
   1401365d3:	mov    %r8,%rdx
   1401365d6:	lea    0x1048(%rbx),%rcx
   1401365dd:	vzeroupper
   1401365e0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401365e5:	mov    0x1048(%rbx),%rdx
   1401365ec:	mov    0x1050(%rbx),%rax
   1401365f3:	lea    (%rdx,%r12,1),%rsi
   1401365f7:	jmp    140133294 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcb4>
   1401365fc:	mov    0x1c8(%rsp),%rax
   140136604:	lea    0x680(%rsp),%rcx
   14013660c:	lea    0x23752f(%rip),%rdx        # 14036db42 <.rdata+0x4c2>
   140136613:	mov    %rax,0x1d0(%rsp)
   14013661b:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140136620:	mov    0x680(%rsp),%rax
   140136628:	mov    $0x2,%r12d
   14013662e:	mov    %rax,0x1c8(%rsp)
   140136636:	jmp    14012d577 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f97>
   14013663b:	mov    %r8,%rdx
   14013663e:	lea    0x1048(%rbx),%rcx
   140136645:	vzeroupper
   140136648:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013664d:	mov    0x1048(%rbx),%rdx
   140136654:	mov    0x1050(%rbx),%rax
   14013665b:	lea    (%rdx,%r12,1),%rsi
   14013665f:	jmp    140133504 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff24>
   140136664:	mov    %r8,%rdx
   140136667:	lea    0x1048(%rbx),%rcx
   14013666e:	vzeroupper
   140136671:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136676:	mov    0x1048(%rbx),%rdx
   14013667d:	mov    0x1050(%rbx),%rax
   140136684:	lea    (%rdx,%r12,1),%rsi
   140136688:	jmp    140132eab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8cb>
   14013668d:	mov    %r8,%rdx
   140136690:	lea    0x1048(%rbx),%rcx
   140136697:	vzeroupper
   14013669a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013669f:	mov    0x1048(%rbx),%rdx
   1401366a6:	mov    0x1050(%rbx),%rax
   1401366ad:	lea    (%rdx,%r12,1),%rsi
   1401366b1:	jmp    1401330a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfac6>
   1401366b6:	add    %rdx,%rdx
   1401366b9:	lea    0x1068(%rbx),%rcx
   1401366c0:	vzeroupper
   1401366c3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401366c8:	jmp    14012475f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117f>
   1401366cd:	test   %r12b,%r12b
   1401366d0:	je     1401392b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cd4>
   1401366d6:	sub    $0x1,%r12b
   1401366da:	je     14013927f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15c9f>
   1401366e0:	lea    0x8(%rsi),%r8
   1401366e4:	cmp    0x30(%rsp),%r8
   1401366e9:	jae    14013922d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15c4d>
   1401366ef:	mov    0x1d0(%rsp),%rax
   1401366f7:	mov    %r8,0x40(%rsp)
   1401366fc:	movslq %edi,%rdx
   1401366ff:	mov    %rax,(%rsi)
   140136702:	mov    0x1c8(%rsp),%rax
   14013670a:	mov    %rax,0x1d0(%rsp)
   140136712:	lea    0x540(%rsp),%rcx
   14013671a:	mov    $0x2,%r12d
   140136720:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140136725:	mov    0x540(%rsp),%rax
   14013672d:	mov    0x40(%rsp),%rsi
   140136732:	mov    %rax,0x1c8(%rsp)
   14013673a:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14013673f:	mov    %r14,%rdx
   140136742:	test   %r12b,%r12b
   140136745:	je     140134ff9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a19>
   14013674b:	sub    $0x1,%r12b
   14013674f:	je     140137645 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14065>
   140136755:	lea    0x8(%rsi),%r8
   140136759:	cmp    0x30(%rsp),%r8
   14013675e:	jae    1401375f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14013>
   140136764:	mov    0x1d0(%rsp),%rax
   14013676c:	mov    %r8,0x40(%rsp)
   140136771:	mov    %r14,%rdx
   140136774:	mov    %rax,(%rsi)
   140136777:	mov    0x1c8(%rsp),%rax
   14013677f:	mov    %rax,0x1d0(%rsp)
   140136787:	jmp    140136712 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13132>
   140136789:	cmp    $0x1,%r14b
   14013678d:	je     140138a17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15437>
   140136793:	cmp    $0x2,%r12b
   140136797:	je     140138528 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f48>
   14013679d:	cmp    $0x1,%r12b
   1401367a1:	jne    14013851c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f3c>
   1401367a7:	mov    0x1048(%rbx),%rdx
   1401367ae:	lea    0x8(%rsi),%r8
   1401367b2:	cmp    0x30(%rsp),%r8
   1401367b7:	jae    140138995 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153b5>
   1401367bd:	mov    0x1c8(%rsp),%rax
   1401367c5:	xor    %r12d,%r12d
   1401367c8:	mov    %rax,(%rsi)
   1401367cb:	mov    %r8,%rsi
   1401367ce:	mov    0x1068(%rbx),%rcx
   1401367d5:	movzbl %r14b,%eax
   1401367d9:	imul   $0xfffffffffffffff8,%r14,%r9
   1401367dd:	add    %r13,%r14
   1401367e0:	lea    -0x1(%rax),%r10d
   1401367e4:	xor    %eax,%eax
   1401367e6:	lea    (%rcx,%r14,8),%r8
   1401367ea:	mov    -0x8(%rsi,%rax,1),%r11
   1401367ef:	mov    %r11,(%r8,%rax,1)
   1401367f3:	sub    $0x8,%rax
   1401367f7:	cmp    %r9,%rax
   1401367fa:	jne    1401367ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1320a>
   1401367fc:	mov    %rsi,%r8
   1401367ff:	imul   $0xfffffffffffffff8,%r10,%r10
   140136803:	mov    -0x8(%r8,%rax,1),%rax
   140136808:	lea    -0x10(%rsi,%r10,1),%rsi
   14013680d:	mov    %rax,(%rcx,%r13,8)
   140136811:	jmp    14012fe96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8b6>
   140136816:	mov    0x1050(%rbx),%rax
   14013681d:	mov    %rsi,%r12
   140136820:	sub    %rdx,%r12
   140136823:	mov    %rax,%rcx
   140136826:	sub    %rdx,%rcx
   140136829:	sar    $0x3,%rcx
   14013682d:	lea    (%rcx,%rcx,1),%r9
   140136831:	cmp    %r9,%rcx
   140136834:	jb     1401389ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1540a>
   14013683a:	vzeroupper
   14013683d:	jmp    14012e63e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb05e>
   140136842:	mov    %r8,%rdx
   140136845:	lea    0x1048(%rbx),%rcx
   14013684c:	vzeroupper
   14013684f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136854:	mov    0x1048(%rbx),%rdx
   14013685b:	mov    0x1050(%rbx),%rax
   140136862:	lea    (%rdx,%r12,1),%rsi
   140136866:	jmp    140132e39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf859>
   14013686b:	mov    0x1050(%rbx),%rax
   140136872:	mov    %rsi,%r12
   140136875:	sub    %rdx,%r12
   140136878:	mov    %rax,%rcx
   14013687b:	sub    %rdx,%rcx
   14013687e:	sar    $0x3,%rcx
   140136882:	lea    (%rcx,%rcx,1),%r9
   140136886:	cmp    %r9,%rcx
   140136889:	jb     140136e11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13831>
   14013688f:	vzeroupper
   140136892:	jmp    14012eea0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8c0>
   140136897:	mov    0x1050(%rbx),%rax
   14013689e:	mov    %rsi,%r12
   1401368a1:	sub    %rdx,%r12
   1401368a4:	mov    %rax,%rcx
   1401368a7:	sub    %rdx,%rcx
   1401368aa:	sar    $0x3,%rcx
   1401368ae:	lea    (%rcx,%rcx,1),%r9
   1401368b2:	cmp    %r9,%rcx
   1401368b5:	jb     140138356 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d76>
   1401368bb:	vzeroupper
   1401368be:	jmp    14012ee40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb860>
   1401368c3:	mov    %r8,%rdx
   1401368c6:	lea    0x1048(%rbx),%rcx
   1401368cd:	vzeroupper
   1401368d0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401368d5:	mov    0x1048(%rbx),%rdx
   1401368dc:	mov    0x1050(%rbx),%rax
   1401368e3:	lea    (%rdx,%r12,1),%rsi
   1401368e7:	jmp    1401333e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe00>
   1401368ec:	mov    %r8,%rdx
   1401368ef:	lea    0x1048(%rbx),%rcx
   1401368f6:	vzeroupper
   1401368f9:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401368fe:	mov    0x1048(%rbx),%rdx
   140136905:	mov    0x1050(%rbx),%rax
   14013690c:	lea    (%rdx,%r12,1),%rsi
   140136910:	jmp    140133031 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa51>
   140136915:	mov    %r8,%rdx
   140136918:	lea    0x1048(%rbx),%rcx
   14013691f:	vzeroupper
   140136922:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136927:	mov    0x1048(%rbx),%rdx
   14013692e:	mov    0x1050(%rbx),%rax
   140136935:	lea    (%rdx,%r12,1),%rsi
   140136939:	jmp    140133344 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd64>
   14013693e:	mov    %r8,%rdx
   140136941:	lea    0x1048(%rbx),%rcx
   140136948:	vzeroupper
   14013694b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136950:	mov    0x1048(%rbx),%rdx
   140136957:	mov    0x1050(%rbx),%rax
   14013695e:	lea    (%rdx,%r12,1),%rsi
   140136962:	jmp    140132f95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9b5>
   140136967:	mov    0x1050(%rbx),%rax
   14013696e:	mov    %rsi,%r12
   140136971:	sub    %rdx,%r12
   140136974:	mov    %rax,%rcx
   140136977:	sub    %rdx,%rcx
   14013697a:	sar    $0x3,%rcx
   14013697e:	lea    (%rcx,%rcx,1),%r9
   140136982:	cmp    %r9,%rcx
   140136985:	jb     140136d5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1377d>
   14013698b:	vzeroupper
   14013698e:	jmp    14012ea37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb457>
   140136993:	lea    0x500(%rsp),%rax
   14013699b:	mov    %r11,%rdx
   14013699e:	mov    %rax,%rcx
   1401369a1:	mov    %rax,0x80(%rsp)
   1401369a9:	call   14022b670 <setun::VMValue::as_tafpu() const>
   1401369ae:	jmp    14012dbf3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa613>
   1401369b3:	mov    0x1050(%rbx),%rax
   1401369ba:	mov    %rsi,%r12
   1401369bd:	sub    %rdx,%r12
   1401369c0:	mov    %rax,%rcx
   1401369c3:	sub    %rdx,%rcx
   1401369c6:	sar    $0x3,%rcx
   1401369ca:	lea    (%rcx,%rcx,1),%r9
   1401369ce:	cmp    %r9,%rcx
   1401369d1:	jb     140136d8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137aa>
   1401369d7:	vzeroupper
   1401369da:	jmp    14012ede0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb800>
   1401369df:	mov    0x1050(%rbx),%rax
   1401369e6:	mov    %rsi,%r12
   1401369e9:	sub    %rdx,%r12
   1401369ec:	mov    %rax,%rcx
   1401369ef:	sub    %rdx,%rcx
   1401369f2:	sar    $0x3,%rcx
   1401369f6:	lea    (%rcx,%rcx,1),%r9
   1401369fa:	cmp    %r9,%rcx
   1401369fd:	jb     1401382f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d15>
   140136a03:	vzeroupper
   140136a06:	jmp    14012ea67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb487>
   140136a0b:	lea    0x540(%rsp),%rax
   140136a13:	mov    %r10,%rdx
   140136a16:	mov    %r8,0x60(%rsp)
   140136a1b:	mov    %rax,%rcx
   140136a1e:	mov    %rax,0x40(%rsp)
   140136a23:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140136a28:	mov    0x40(%rsp),%rax
   140136a2d:	mov    0x60(%rsp),%r8
   140136a32:	jmp    14013191c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe33c>
   140136a37:	mov    0x28(%rbp),%rdx
   140136a3b:	test   %rdx,%rdx
   140136a3e:	je     14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   140136a44:	mov    0x30(%r15),%r8
   140136a48:	mov    0x38(%r15),%rcx
   140136a4c:	movzwl 0xa(%rdi),%eax
   140136a50:	sub    %r8,%rcx
   140136a53:	sar    $0x5,%rcx
   140136a57:	cmp    %rcx,%rax
   140136a5a:	jae    14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   140136a60:	shl    $0x5,%rax
   140136a64:	lea    0x680(%rsp),%rcx
   140136a6c:	add    $0x40,%rdx
   140136a70:	add    %rax,%r8
   140136a73:	call   1402316e0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140136a78:	mov    0x680(%rsp),%rax
   140136a80:	test   %rax,%rax
   140136a83:	je     14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   140136a89:	mov    (%rax),%rcx
   140136a8c:	test   %rcx,%rcx
   140136a8f:	je     14012a4af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ecf>
   140136a95:	mov    0x88(%r15),%rax
   140136a9c:	mov    0x80(%r15),%rdx
   140136aa3:	cmp    %rdx,%rax
   140136aa6:	je     140137248 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c68>
   140136aac:	sub    %rdx,%rax
   140136aaf:	movzwl 0x28(%rcx),%r8d
   140136ab4:	xor    %r9d,%r9d
   140136ab7:	sar    $0x2,%rax
   140136abb:	mov    %r9d,0x60(%rsp)
   140136ac0:	cmp    %rax,%r8
   140136ac3:	jae    140136acd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134ed>
   140136ac5:	mov    (%rdx,%r8,4),%eax
   140136ac9:	mov    %eax,0x60(%rsp)
   140136acd:	mov    0xa0(%r15),%rax
   140136ad4:	mov    0x98(%r15),%rdx
   140136adb:	cmp    %rdx,%rax
   140136ade:	je     1401382ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d0a>
   140136ae4:	sub    %rdx,%rax
   140136ae7:	movzwl 0x28(%rcx),%ecx
   140136aeb:	mov    $0x20,%r8d
   140136af1:	sar    $1,%rax
   140136af4:	cmp    %rax,%rcx
   140136af7:	jae    140136afe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1351e>
   140136af9:	movzwl (%rdx,%rcx,2),%r8d
   140136afe:	movzbl %r14b,%eax
   140136b02:	mov    %r8,%rcx
   140136b05:	mov    0x15268(%rbx),%r13
   140136b0c:	mov    0x1070(%rbx),%rdx
   140136b13:	mov    %rax,0x80(%rsp)
   140136b1b:	add    $0x9,%rax
   140136b1f:	cmp    %r8,%rax
   140136b22:	cmovae %rax,%rcx
   140136b26:	mov    0x38(%rbp),%rax
   140136b2a:	sub    0x1068(%rbx),%rdx
   140136b31:	sar    $0x3,%rdx
   140136b35:	vmovd  (%rax),%xmm7
   140136b39:	vpinsrd $0x1,0x60(%rsp),%xmm7,%xmm0
   140136b41:	lea    (%rcx,%r13,1),%rax
   140136b45:	mov    %cx,0x8(%rdi)
   140136b49:	mov    %rcx,0xa0(%rsp)
   140136b51:	vmovq  %xmm0,(%rdi)
   140136b55:	mov    %rax,0x15268(%rbx)
   140136b5c:	add    $0x40,%rax
   140136b60:	cmp    %rdx,%rax
   140136b63:	jae    140137328 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d48>
   140136b69:	test   %r14b,%r14b
   140136b6c:	jne    14013729b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cbb>
   140136b72:	mov    0x1068(%rbx),%rax
   140136b79:	cmp    $0x1,%r12b
   140136b7d:	je     140137280 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ca0>
   140136b83:	cmp    $0x2,%r12b
   140136b87:	je     140137255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c75>
   140136b8d:	mov    -0x8(%rsi),%rdx
   140136b91:	sub    $0x8,%rsi
   140136b95:	mov    %rdx,(%rax,%r13,8)
   140136b99:	mov    0x1048(%rbx),%rdx
   140136ba0:	mov    %rsi,%r8
   140136ba3:	mov    0x150c0(%rbx),%rax
   140136baa:	mov    0x40(%rsp),%rcx
   140136baf:	sub    %rdx,%r8
   140136bb2:	mov    0x60(%rsp),%ebp
   140136bb6:	sub    0x38(%rsp),%rcx
   140136bbb:	mov    %r8,%r14
   140136bbe:	sar    $0x3,%r14
   140136bc2:	cmp    $0x7ff,%rax
   140136bc8:	ja     140139a97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b7>
   140136bce:	lea    0x1(%rax),%r9
   140136bd2:	mov    0xa0(%rsp),%rdi
   140136bda:	imul   $0x28,%rax,%rax
   140136bde:	mov    %r9,0x150c0(%rbx)
   140136be5:	mov    %rcx,0x10c0(%rbx,%rax,1)
   140136bed:	mov    0x15270(%rbx),%rcx
   140136bf4:	mov    %r13,0x10c8(%rbx,%rax,1)
   140136bfc:	mov    %r14,0x10d0(%rbx,%rax,1)
   140136c04:	mov    %rdi,0x10d8(%rbx,%rax,1)
   140136c0c:	mov    %rbp,0x10e0(%rbx,%rax,1)
   140136c14:	mov    0x152a0(%rbx),%rax
   140136c1b:	cmp    %rax,0x68(%rcx)
   140136c1f:	jae    1401374ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0e>
   140136c25:	mov    0x38(%rsp),%rax
   140136c2a:	lea    (%rax,%rbp,1),%r14
   140136c2e:	cmpb   $0x0,0x1040(%rbx)
   140136c35:	je     14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   140136c3b:	movzbl (%r14),%eax
   140136c3f:	lea    0x29c45a(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140136c46:	lea    0x1(%r14),%rbp
   140136c4a:	jmp    *(%rdi,%rax,8)
   140136c4d:	nopl   (%rax)
   140136c50:	mov    0x1050(%rbx),%rax
   140136c57:	mov    %rsi,%r12
   140136c5a:	sub    %rdx,%r12
   140136c5d:	mov    %rax,%rcx
   140136c60:	sub    %rdx,%rcx
   140136c63:	sar    $0x3,%rcx
   140136c67:	lea    (%rcx,%rcx,1),%r9
   140136c6b:	cmp    %r9,%rcx
   140136c6e:	jb     140136db7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137d7>
   140136c74:	vzeroupper
   140136c77:	jmp    14012ee70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb890>
   140136c7c:	mov    0x1050(%rbx),%rax
   140136c83:	mov    %rsi,%r12
   140136c86:	sub    %rdx,%r12
   140136c89:	mov    %rax,%rcx
   140136c8c:	sub    %rdx,%rcx
   140136c8f:	sar    $0x3,%rcx
   140136c93:	lea    (%rcx,%rcx,1),%r9
   140136c97:	cmp    %r9,%rcx
   140136c9a:	jb     140136de4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13804>
   140136ca0:	vzeroupper
   140136ca3:	jmp    14012ed50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb770>
   140136ca8:	mov    0x1050(%rbx),%rax
   140136caf:	mov    %rsi,%r12
   140136cb2:	sub    %rdx,%r12
   140136cb5:	mov    %rax,%rcx
   140136cb8:	sub    %rdx,%rcx
   140136cbb:	sar    $0x3,%rcx
   140136cbf:	lea    (%rcx,%rcx,1),%r9
   140136cc3:	cmp    %r9,%rcx
   140136cc6:	jb     1401374c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ee1>
   140136ccc:	vzeroupper
   140136ccf:	jmp    14012ec90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6b0>
   140136cd4:	mov    0x1050(%rbx),%rax
   140136cdb:	mov    %rsi,%r12
   140136cde:	sub    %rdx,%r12
   140136ce1:	mov    %rax,%rcx
   140136ce4:	sub    %rdx,%rcx
   140136ce7:	sar    $0x3,%rcx
   140136ceb:	lea    (%rcx,%rcx,1),%r9
   140136cef:	cmp    %r9,%rcx
   140136cf2:	jb     140137528 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f48>
   140136cf8:	vzeroupper
   140136cfb:	jmp    14012ec30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb650>
   140136d00:	mov    0x1050(%rbx),%rax
   140136d07:	mov    %rsi,%r12
   140136d0a:	sub    %rdx,%r12
   140136d0d:	mov    %rax,%rcx
   140136d10:	sub    %rdx,%rcx
   140136d13:	sar    $0x3,%rcx
   140136d17:	lea    (%rcx,%rcx,1),%r9
   140136d1b:	cmp    %r9,%rcx
   140136d1e:	jb     140138383 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14da3>
   140136d24:	vzeroupper
   140136d27:	jmp    14012edb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d0>
   140136d2c:	lea    0x500(%rsp),%rax
   140136d34:	mov    %r10,0x60(%rsp)
   140136d39:	mov    %rax,%rcx
   140136d3c:	mov    %r9,0x40(%rsp)
   140136d41:	mov    %rax,0x80(%rsp)
   140136d49:	call   14022b670 <setun::VMValue::as_tafpu() const>
   140136d4e:	mov    0x40(%rsp),%r9
   140136d53:	mov    0x60(%rsp),%r10
   140136d58:	jmp    140131832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe252>
   140136d5d:	mov    %r9,%rdx
   140136d60:	lea    0x1048(%rbx),%rcx
   140136d67:	vzeroupper
   140136d6a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136d6f:	mov    0x1048(%rbx),%rdx
   140136d76:	mov    0x1050(%rbx),%rax
   140136d7d:	lea    (%rdx,%r12,1),%rsi
   140136d81:	lea    0x8(%rsi),%r8
   140136d85:	jmp    14012ea37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb457>
   140136d8a:	mov    %r9,%rdx
   140136d8d:	lea    0x1048(%rbx),%rcx
   140136d94:	vzeroupper
   140136d97:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136d9c:	mov    0x1048(%rbx),%rdx
   140136da3:	mov    0x1050(%rbx),%rax
   140136daa:	lea    (%rdx,%r12,1),%rsi
   140136dae:	lea    0x8(%rsi),%r8
   140136db2:	jmp    14012ede0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb800>
   140136db7:	mov    %r9,%rdx
   140136dba:	lea    0x1048(%rbx),%rcx
   140136dc1:	vzeroupper
   140136dc4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136dc9:	mov    0x1048(%rbx),%rdx
   140136dd0:	mov    0x1050(%rbx),%rax
   140136dd7:	lea    (%rdx,%r12,1),%rsi
   140136ddb:	lea    0x8(%rsi),%r8
   140136ddf:	jmp    14012ee70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb890>
   140136de4:	mov    %r9,%rdx
   140136de7:	lea    0x1048(%rbx),%rcx
   140136dee:	vzeroupper
   140136df1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136df6:	mov    0x1048(%rbx),%rdx
   140136dfd:	mov    0x1050(%rbx),%rax
   140136e04:	lea    (%rdx,%r12,1),%rsi
   140136e08:	lea    0x8(%rsi),%r8
   140136e0c:	jmp    14012ed50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb770>
   140136e11:	mov    %r9,%rdx
   140136e14:	lea    0x1048(%rbx),%rcx
   140136e1b:	vzeroupper
   140136e1e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e23:	mov    0x1048(%rbx),%rdx
   140136e2a:	mov    0x1050(%rbx),%rax
   140136e31:	lea    (%rdx,%r12,1),%rsi
   140136e35:	lea    0x8(%rsi),%r8
   140136e39:	jmp    14012eea0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8c0>
   140136e3e:	lea    0x0(%rbp,%rbp,1),%rdx
   140136e43:	lea    0x1048(%rbx),%rcx
   140136e4a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e4f:	jmp    14012a5bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fdd>
   140136e54:	mov    %r9,%rdx
   140136e57:	lea    0x1048(%rbx),%rcx
   140136e5e:	vzeroupper
   140136e61:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e66:	mov    0x1048(%rbx),%rdx
   140136e6d:	mov    0x1050(%rbx),%rax
   140136e74:	lea    (%rdx,%r12,1),%rsi
   140136e78:	lea    0x8(%rsi),%r8
   140136e7c:	jmp    14012e6ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0ee>
   140136e81:	mov    $0x6ab,%r8d
   140136e87:	lea    0x236dc2(%rip),%rdx        # 14036dc50 <.rdata+0x5d0>
   140136e8e:	lea    0x2373fb(%rip),%rcx        # 14036e290 <.rdata+0xc10>
   140136e95:	vzeroupper
   140136e98:	call   *0x29fd02(%rip)        # 1403d6ba0 <__imp__assert>
   140136e9e:	mov    %r9,%rdx
   140136ea1:	lea    0x1048(%rbx),%rcx
   140136ea8:	vzeroupper
   140136eab:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136eb0:	mov    0x1048(%rbx),%rdx
   140136eb7:	mov    0x1050(%rbx),%rax
   140136ebe:	lea    (%rdx,%r12,1),%rsi
   140136ec2:	lea    0x8(%rsi),%r8
   140136ec6:	jmp    14012eb73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb593>
   140136ecb:	mov    0x1050(%rbx),%rax
   140136ed2:	mov    0x1048(%rbx),%rcx
   140136ed9:	mov    %rax,0x30(%rsp)
   140136ede:	sub    %rcx,%rax
   140136ee1:	sar    $0x3,%rax
   140136ee5:	lea    (%rax,%rax,1),%rdx
   140136ee9:	cmp    %rdx,%rax
   140136eec:	jae    14012d4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f00>
   140136ef2:	sub    %rcx,%rsi
   140136ef5:	lea    0x1048(%rbx),%rcx
   140136efc:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f01:	mov    0x1050(%rbx),%rax
   140136f08:	add    0x1048(%rbx),%rsi
   140136f0f:	mov    %rax,0x30(%rsp)
   140136f14:	jmp    14012d4e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f00>
   140136f19:	mov    0x1050(%rbx),%rcx
   140136f20:	mov    0x1048(%rbx),%rax
   140136f27:	mov    %rcx,0x30(%rsp)
   140136f2c:	sub    %rax,%rcx
   140136f2f:	sar    $0x3,%rcx
   140136f33:	lea    (%rcx,%rcx,1),%rdx
   140136f37:	cmp    %rdx,%rcx
   140136f3a:	jae    140135793 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121b3>
   140136f40:	lea    0x1048(%rbx),%rcx
   140136f47:	sub    %rax,%rsi
   140136f4a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f4f:	mov    0x1050(%rbx),%rax
   140136f56:	add    0x1048(%rbx),%rsi
   140136f5d:	lea    0x8(%rsi),%r8
   140136f61:	mov    %rax,0x30(%rsp)
   140136f66:	jmp    140135793 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121b3>
   140136f6b:	mov    0x1c8(%rsp),%rax
   140136f73:	mov    0x40(%rsp),%rdx
   140136f78:	mov    %rdi,%rcx
   140136f7b:	mov    $0x2,%r12d
   140136f81:	mov    %rax,0x1d0(%rsp)
   140136f89:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140136f8e:	mov    %rax,0x1c8(%rsp)
   140136f96:	jmp    1401357d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121f3>
   140136f9b:	mov    0x40(%rsp),%rdx
   140136fa0:	mov    %rdi,%rcx
   140136fa3:	mov    $0x1,%r12d
   140136fa9:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140136fae:	mov    %rax,0x1c8(%rsp)
   140136fb6:	jmp    1401357d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121f3>
   140136fbb:	cmp    $0x2,%r12b
   140136fbf:	je     14013720c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c2c>
   140136fc5:	sub    $0x1,%r12b
   140136fc9:	jne    1401371f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c19>
   140136fcf:	mov    0x1048(%rbx),%rdx
   140136fd6:	mov    0x1050(%rbx),%rax
   140136fdd:	lea    0x8(%rsi),%r8
   140136fe1:	cmp    0x30(%rsp),%r8
   140136fe6:	jae    1401371b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bd6>
   140136fec:	mov    0x1c8(%rsp),%rcx
   140136ff4:	mov    %rcx,(%rsi)
   140136ff7:	mov    %r8,%rsi
   140136ffa:	sub    %rdx,%rsi
   140136ffd:	mov    %r14,%rcx
   140137000:	sub    %rdx,%rax
   140137003:	sub    0x38(%rsp),%rcx
   140137008:	mov    %rsi,%rbp
   14013700b:	mov    %rcx,0x1038(%rbx)
   140137012:	sar    $0x3,%rbp
   140137016:	cmp    %rsi,%rax
   140137019:	jae    14013702c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a4c>
   14013701b:	lea    0x0(%rbp,%rbp,1),%rdx
   140137020:	lea    0x1048(%rbx),%rcx
   140137027:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013702c:	vmovdqa 0x237b4c(%rip),%xmm0        # 14036eb80 <CSWTCH.3092+0x1c0>
   140137034:	mov    %rbp,0x1060(%rbx)
   14013703b:	mov    $0x10,%ecx
   140137040:	movb   $0x0,0x153a0(%rbx)
   140137047:	vmovdqa %xmm0,0x15390(%rbx)
   14013704f:	call   14034a310 <__cxa_allocate_exception>
   140137054:	mov    0x8(%rdi),%r9
   140137058:	mov    (%rdi),%r8
   14013705b:	lea    0x236aec(%rip),%rdx        # 14036db4e <.rdata+0x4ce>
   140137062:	mov    %rax,%rsi
   140137065:	lea    0x500(%rsp),%rax
   14013706d:	mov    %rax,%rcx
   140137070:	mov    %rax,0x80(%rsp)
   140137078:	call   140104e60 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > std::operator+<char, std::char_traits<char>, std::allocator<char> >(char const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) [clone .isra.0]>
   14013707d:	mov    0x80(%rsp),%rcx
   140137085:	lea    0x236ad3(%rip),%rdx        # 14036db5f <.rdata+0x4df>
   14013708c:	call   1402fe8f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   140137091:	mov    %rax,%rdx
   140137094:	lea    0x520(%rsp),%rcx
   14013709c:	call   140300e90 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   1401370a1:	mov    0x40(%rsp),%rax
   1401370a6:	lea    0x520(%rsp),%rcx
   1401370ae:	mov    0x8(%rax),%r8
   1401370b2:	mov    (%rax),%rdx
   1401370b5:	call   1402fed10 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*, unsigned long long)>
   1401370ba:	mov    %rax,%rdx
   1401370bd:	lea    0x540(%rsp),%rcx
   1401370c5:	call   140300e90 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   1401370ca:	lea    0x236a9f(%rip),%rdx        # 14036db70 <.rdata+0x4f0>
   1401370d1:	lea    0x540(%rsp),%rcx
   1401370d9:	call   1402fe8f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   1401370de:	mov    %rax,%rdx
   1401370e1:	lea    0x680(%rsp),%rcx
   1401370e9:	call   140300e90 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   1401370ee:	lea    0x680(%rsp),%rdx
   1401370f6:	mov    %rsi,%rcx
   1401370f9:	call   1402e06a0 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   1401370fe:	lea    0x253c3b(%rip),%rax        # 14038ad40 <vtable for setun::VMException+0x10>
   140137105:	mov    0x680(%rsp),%rcx
   14013710d:	mov    %rax,(%rsi)
   140137110:	lea    0x690(%rsp),%rax
   140137118:	cmp    %rax,%rcx
   14013711b:	je     14013712e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b4e>
   14013711d:	mov    0x690(%rsp),%rax
   140137125:	lea    0x1(%rax),%rdx
   140137129:	call   14034a160 <operator delete(void*, unsigned long long)>
   14013712e:	mov    0x540(%rsp),%rcx
   140137136:	lea    0x550(%rsp),%rax
   14013713e:	cmp    %rax,%rcx
   140137141:	je     140137154 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b74>
   140137143:	mov    0x550(%rsp),%rax
   14013714b:	lea    0x1(%rax),%rdx
   14013714f:	call   14034a160 <operator delete(void*, unsigned long long)>
   140137154:	mov    0x520(%rsp),%rcx
   14013715c:	lea    0x530(%rsp),%rax
   140137164:	cmp    %rax,%rcx
   140137167:	je     14013717a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b9a>
   140137169:	mov    0x530(%rsp),%rax
   140137171:	lea    0x1(%rax),%rdx
   140137175:	call   14034a160 <operator delete(void*, unsigned long long)>
   14013717a:	mov    0x500(%rsp),%rcx
   140137182:	lea    0x510(%rsp),%rax
   14013718a:	cmp    %rax,%rcx
   14013718d:	je     1401371a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bc0>
   14013718f:	mov    0x510(%rsp),%rax
   140137197:	lea    0x1(%rax),%rdx
   14013719b:	call   14034a160 <operator delete(void*, unsigned long long)>
   1401371a0:	lea    0xdd1f9(%rip),%r8        # 1402143a0 <setun::VMException::~VMException()>
   1401371a7:	lea    0x24d932(%rip),%rdx        # 140384ae0 <typeinfo for setun::VMException>
   1401371ae:	mov    %rsi,%rcx
   1401371b1:	call   14034a9b0 <__cxa_throw>
   1401371b6:	mov    %rax,%rcx
   1401371b9:	sub    %rdx,%rcx
   1401371bc:	sar    $0x3,%rcx
   1401371c0:	lea    (%rcx,%rcx,1),%r9
   1401371c4:	cmp    %r9,%rcx
   1401371c7:	jae    140136fec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a0c>
   1401371cd:	sub    %rdx,%rsi
   1401371d0:	lea    0x1048(%rbx),%rcx
   1401371d7:	mov    %r9,%rdx
   1401371da:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401371df:	mov    0x1048(%rbx),%rdx
   1401371e6:	mov    0x1050(%rbx),%rax
   1401371ed:	add    %rdx,%rsi
   1401371f0:	lea    0x8(%rsi),%r8
   1401371f4:	jmp    140136fec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a0c>
   1401371f9:	mov    0x1048(%rbx),%rdx
   140137200:	mov    0x1050(%rbx),%rax
   140137207:	jmp    140136ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a1a>
   14013720c:	mov    0x1048(%rbx),%rdx
   140137213:	mov    0x1050(%rbx),%rax
   14013721a:	lea    0x10(%rsi),%rcx
   14013721e:	cmp    0x30(%rsp),%rcx
   140137223:	jae    140137691 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140b1>
   140137229:	mov    0x1d0(%rsp),%r8
   140137231:	mov    %r8,(%rsi)
   140137234:	mov    0x1c8(%rsp),%r8
   14013723c:	mov    %r8,0x8(%rsi)
   140137240:	mov    %rcx,%rsi
   140137243:	jmp    140136ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a1a>
   140137248:	movzwl 0x28(%rcx),%eax
   14013724c:	mov    %eax,0x60(%rsp)
   140137250:	jmp    140136acd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134ed>
   140137255:	mov    0x1c8(%rsp),%rdx
   14013725d:	xor    %r12d,%r12d
   140137260:	add    $0x8,%rsi
   140137264:	mov    %rdx,(%rax,%r13,8)
   140137268:	mov    0x1d0(%rsp),%rax
   140137270:	mov    0x1048(%rbx),%rdx
   140137277:	mov    %rax,-0x8(%rsi)
   14013727b:	jmp    140136ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135c0>
   140137280:	mov    0x1c8(%rsp),%rdx
   140137288:	mov    %rdx,(%rax,%r13,8)
   14013728c:	mov    0x1048(%rbx),%rdx
   140137293:	xor    %r12d,%r12d
   140137296:	jmp    140136ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135c0>
   14013729b:	cmp    $0x1,%r14b
   14013729f:	je     1401373d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13df1>
   1401372a5:	cmp    $0x2,%r12b
   1401372a9:	je     14013739d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dbd>
   1401372af:	cmp    $0x1,%r12b
   1401372b3:	jne    140137391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13db1>
   1401372b9:	mov    0x1048(%rbx),%rdx
   1401372c0:	lea    0x8(%rsi),%r8
   1401372c4:	cmp    0x30(%rsp),%r8
   1401372c9:	jae    14013733c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d5c>
   1401372cb:	mov    0x1c8(%rsp),%rax
   1401372d3:	xor    %r12d,%r12d
   1401372d6:	mov    %rax,(%rsi)
   1401372d9:	mov    %r8,%rsi
   1401372dc:	mov    0x80(%rsp),%rax
   1401372e4:	mov    0x1068(%rbx),%rcx
   1401372eb:	mov    %r14d,%r9d
   1401372ee:	add    %r13,%rax
   1401372f1:	lea    (%rcx,%rax,8),%r8
   1401372f5:	xor    %eax,%eax
   1401372f7:	mov    -0x8(%rsi,%rax,1),%r10
   1401372fc:	mov    %r10,(%r8,%rax,1)
   140137300:	sub    $0x8,%rax
   140137304:	sub    $0x1,%r9d
   140137308:	jne    1401372f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d17>
   14013730a:	lea    -0x1(%r14),%eax
   14013730e:	mov    %rsi,%r8
   140137311:	imul   $0xfffffffffffffff8,%rax,%rax
   140137315:	lea    -0x10(%rsi,%rax,1),%rsi
   14013731a:	mov    -0x10(%rax,%r8,1),%rax
   14013731f:	mov    %rax,(%rcx,%r13,8)
   140137323:	jmp    140136ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135c0>
   140137328:	add    %rdx,%rdx
   14013732b:	lea    0x1068(%rbx),%rcx
   140137332:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137337:	jmp    140136b69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13589>
   14013733c:	mov    0x1050(%rbx),%rax
   140137343:	mov    %rsi,%rbp
   140137346:	sub    %rdx,%rbp
   140137349:	mov    %rax,0x30(%rsp)
   14013734e:	sub    %rdx,%rax
   140137351:	sar    $0x3,%rax
   140137355:	lea    (%rax,%rax,1),%rcx
   140137359:	cmp    %rcx,%rax
   14013735c:	jae    1401372cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ceb>
   140137362:	mov    %rcx,%rdx
   140137365:	lea    0x1048(%rbx),%rcx
   14013736c:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137371:	mov    0x1048(%rbx),%rdx
   140137378:	mov    0x1050(%rbx),%rax
   14013737f:	lea    (%rdx,%rbp,1),%rsi
   140137383:	mov    %rax,0x30(%rsp)
   140137388:	lea    0x8(%rsi),%r8
   14013738c:	jmp    1401372cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ceb>
   140137391:	mov    0x1048(%rbx),%rdx
   140137398:	jmp    1401372dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cfc>
   14013739d:	mov    0x1048(%rbx),%rdx
   1401373a4:	lea    0x10(%rsi),%rcx
   1401373a8:	cmp    0x30(%rsp),%rcx
   1401373ad:	jae    140137408 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e28>
   1401373af:	mov    0x1d0(%rsp),%rax
   1401373b7:	xor    %r12d,%r12d
   1401373ba:	mov    %rax,(%rsi)
   1401373bd:	mov    0x1c8(%rsp),%rax
   1401373c5:	mov    %rax,0x8(%rsi)
   1401373c9:	mov    %rcx,%rsi
   1401373cc:	jmp    1401372dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cfc>
   1401373d1:	mov    0x1068(%rbx),%rax
   1401373d8:	cmp    $0x2,%r12b
   1401373dc:	je     140137476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e96>
   1401373e2:	cmp    $0x1,%r12b
   1401373e6:	je     140137459 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e79>
   1401373e8:	mov    -0x8(%rsi),%rdx
   1401373ec:	sub    $0x10,%rsi
   1401373f0:	mov    %rdx,0x8(%rax,%r13,8)
   1401373f5:	mov    (%rsi),%rdx
   1401373f8:	mov    %rdx,(%rax,%r13,8)
   1401373fc:	mov    0x1048(%rbx),%rdx
   140137403:	jmp    140136ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135c0>
   140137408:	mov    0x1050(%rbx),%rax
   14013740f:	mov    %rsi,%rbp
   140137412:	sub    %rdx,%rbp
   140137415:	mov    %rax,0x30(%rsp)
   14013741a:	sub    %rdx,%rax
   14013741d:	sar    $0x3,%rax
   140137421:	lea    (%rax,%rax,1),%r8
   140137425:	cmp    %r8,%rax
   140137428:	jae    1401373af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dcf>
   14013742a:	lea    0x1048(%rbx),%rcx
   140137431:	mov    %r8,%rdx
   140137434:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137439:	mov    0x1048(%rbx),%rdx
   140137440:	mov    0x1050(%rbx),%rax
   140137447:	lea    (%rdx,%rbp,1),%rsi
   14013744b:	mov    %rax,0x30(%rsp)
   140137450:	lea    0x10(%rsi),%rcx
   140137454:	jmp    1401373af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dcf>
   140137459:	mov    0x1c8(%rsp),%rdx
   140137461:	sub    $0x8,%rsi
   140137465:	mov    %rdx,0x8(%rax,%r13,8)
   14013746a:	mov    (%rsi),%rdx
   14013746d:	mov    %rdx,(%rax,%r13,8)
   140137471:	jmp    14013728c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cac>
   140137476:	mov    0x1d0(%rsp),%rdx
   14013747e:	mov    %rdx,(%rax,%r13,8)
   140137482:	mov    0x1c8(%rsp),%rdx
   14013748a:	mov    %rdx,0x8(%rax,%r13,8)
   14013748f:	jmp    14013728c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cac>
   140137494:	mov    %r9,%rdx
   140137497:	lea    0x1048(%rbx),%rcx
   14013749e:	vzeroupper
   1401374a1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401374a6:	mov    0x1048(%rbx),%rdx
   1401374ad:	mov    0x1050(%rbx),%rax
   1401374b4:	lea    (%rdx,%r12,1),%rsi
   1401374b8:	lea    0x8(%rsi),%r8
   1401374bc:	jmp    14012e72e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb14e>
   1401374c1:	mov    %r9,%rdx
   1401374c4:	lea    0x1048(%rbx),%rcx
   1401374cb:	vzeroupper
   1401374ce:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401374d3:	mov    0x1048(%rbx),%rdx
   1401374da:	mov    0x1050(%rbx),%rax
   1401374e1:	lea    (%rdx,%r12,1),%rsi
   1401374e5:	lea    0x8(%rsi),%r8
   1401374e9:	jmp    14012ec90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6b0>
   1401374ee:	mov    0x1050(%rbx),%rax
   1401374f5:	sub    %rdx,%rax
   1401374f8:	cmp    %r8,%rax
   1401374fb:	jb     140137566 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f86>
   1401374fd:	mov    %r14,0x1060(%rbx)
   140137504:	mov    0x152a0(%rbx),%rax
   14013750b:	cmp    %rax,0x68(%rcx)
   14013750f:	jae    140137555 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f75>
   140137511:	mov    0x1060(%rbx),%rax
   140137518:	mov    0x1048(%rbx),%rdx
   14013751f:	lea    (%rdx,%rax,8),%rsi
   140137523:	jmp    140136c25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13645>
   140137528:	mov    %r9,%rdx
   14013752b:	lea    0x1048(%rbx),%rcx
   140137532:	vzeroupper
   140137535:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013753a:	mov    0x1048(%rbx),%rdx
   140137541:	mov    0x1050(%rbx),%rax
   140137548:	lea    (%rdx,%r12,1),%rsi
   14013754c:	lea    0x8(%rsi),%r8
   140137550:	jmp    14012ec30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb650>
   140137555:	lea    0x15270(%rbx),%rcx
   14013755c:	mov    %rbx,%rdx
   14013755f:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   140137564:	jmp    140137511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f31>
   140137566:	lea    0x1048(%rbx),%rcx
   14013756d:	lea    (%r14,%r14,1),%rdx
   140137571:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137576:	mov    0x15270(%rbx),%rcx
   14013757d:	jmp    1401374fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f1d>
   140137582:	mov    0x1050(%rbx),%rax
   140137589:	sub    %rdx,%rax
   14013758c:	cmp    %r8,%rax
   14013758f:	jb     1401376e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14108>
   140137595:	mov    %rbp,0x1060(%rbx)
   14013759c:	mov    0x152a0(%rbx),%rax
   1401375a3:	cmp    %rax,0x68(%rcx)
   1401375a7:	jae    1401376d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140f4>
   1401375ad:	mov    0x1060(%rbx),%rax
   1401375b4:	mov    0x1048(%rbx),%rdx
   1401375bb:	mov    0x4(%rdi),%r9d
   1401375bf:	lea    (%rdx,%rax,8),%rsi
   1401375c3:	jmp    14012ff18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc938>
   1401375c8:	mov    0x1c8(%rsp),%rdx
   1401375d0:	xor    %r12d,%r12d
   1401375d3:	add    $0x8,%rsi
   1401375d7:	mov    %rdx,(%rax,%r13,8)
   1401375db:	mov    0x1d0(%rsp),%rax
   1401375e3:	mov    0x1048(%rbx),%rdx
   1401375ea:	mov    %rax,-0x8(%rsi)
   1401375ee:	jmp    14012fe96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8b6>
   1401375f3:	mov    0x1050(%rbx),%rax
   1401375fa:	mov    0x1048(%rbx),%rcx
   140137601:	mov    %rax,0x30(%rsp)
   140137606:	sub    %rcx,%rax
   140137609:	sar    $0x3,%rax
   14013760d:	lea    (%rax,%rax,1),%rdx
   140137611:	cmp    %rdx,%rax
   140137614:	jae    140136764 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13184>
   14013761a:	sub    %rcx,%rsi
   14013761d:	lea    0x1048(%rbx),%rcx
   140137624:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137629:	mov    0x1050(%rbx),%rax
   140137630:	add    0x1048(%rbx),%rsi
   140137637:	lea    0x8(%rsi),%r8
   14013763b:	mov    %rax,0x30(%rsp)
   140137640:	jmp    140136764 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13184>
   140137645:	mov    0x1c8(%rsp),%rax
   14013764d:	lea    0x540(%rsp),%rcx
   140137655:	mov    $0x2,%r12d
   14013765b:	mov    %rax,0x1d0(%rsp)
   140137663:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137668:	mov    0x540(%rsp),%rax
   140137670:	mov    %rax,0x1c8(%rsp)
   140137678:	jmp    140129f26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6946>
   14013767d:	add    %rdx,%rdx
   140137680:	lea    0x1068(%rbx),%rcx
   140137687:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013768c:	jmp    14012fe5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc87f>
   140137691:	mov    %rax,%r8
   140137694:	sub    %rdx,%r8
   140137697:	sar    $0x3,%r8
   14013769b:	lea    (%r8,%r8,1),%r9
   14013769f:	cmp    %r9,%r8
   1401376a2:	jae    140137229 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c49>
   1401376a8:	sub    %rdx,%rsi
   1401376ab:	lea    0x1048(%rbx),%rcx
   1401376b2:	mov    %r9,%rdx
   1401376b5:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376ba:	mov    0x1048(%rbx),%rdx
   1401376c1:	mov    0x1050(%rbx),%rax
   1401376c8:	add    %rdx,%rsi
   1401376cb:	lea    0x10(%rsi),%rcx
   1401376cf:	jmp    140137229 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c49>
   1401376d4:	lea    0x15270(%rbx),%rcx
   1401376db:	mov    %rbx,%rdx
   1401376de:	call   140163a00 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401376e3:	jmp    1401375ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fcd>
   1401376e8:	lea    0x1048(%rbx),%rcx
   1401376ef:	lea    0x0(%rbp,%rbp,1),%rdx
   1401376f4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376f9:	mov    0x15270(%rbx),%rcx
   140137700:	jmp    140137595 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fb5>
   140137705:	mov    0x1050(%rbx),%rax
   14013770c:	mov    0x1048(%rbx),%rdx
   140137713:	mov    %rax,0x30(%rsp)
   140137718:	sub    %rdx,%rax
   14013771b:	sar    $0x3,%rax
   14013771f:	lea    (%rax,%rax,1),%rcx
   140137723:	cmp    %rcx,%rax
   140137726:	jae    140133974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10394>
   14013772c:	sub    %rdx,%rsi
   14013772f:	mov    %rcx,%rdx
   140137732:	lea    0x1048(%rbx),%rcx
   140137739:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013773e:	mov    0x1050(%rbx),%rax
   140137745:	add    0x1048(%rbx),%rsi
   14013774c:	lea    0x8(%rsi),%r8
   140137750:	mov    %rax,0x30(%rsp)
   140137755:	jmp    140133974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10394>
   14013775a:	mov    0x1050(%rbx),%rax
   140137761:	mov    0x1048(%rbx),%rdx
   140137768:	mov    %rax,0x30(%rsp)
   14013776d:	sub    %rdx,%rax
   140137770:	sar    $0x3,%rax
   140137774:	lea    (%rax,%rax,1),%rcx
   140137778:	cmp    %rcx,%rax
   14013777b:	jae    14012d92f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa34f>
   140137781:	sub    %rdx,%rsi
   140137784:	mov    %rcx,%rdx
   140137787:	lea    0x1048(%rbx),%rcx
   14013778e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137793:	mov    0x1050(%rbx),%rax
   14013779a:	add    0x1048(%rbx),%rsi
   1401377a1:	lea    0x8(%rsi),%r8
   1401377a5:	mov    %rax,0x30(%rsp)
   1401377aa:	jmp    14012d92f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa34f>
   1401377af:	mov    0x1048(%rbx),%rdx
   1401377b6:	mov    0x1050(%rbx),%rax
   1401377bd:	mov    %rsi,%rcx
   1401377c0:	jmp    140130ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda1c>
   1401377c5:	mov    %r9,%rdx
   1401377c8:	lea    0x1048(%rbx),%rcx
   1401377cf:	vzeroupper
   1401377d2:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401377d7:	mov    0x1048(%rbx),%rdx
   1401377de:	mov    0x1050(%rbx),%rax
   1401377e5:	lea    (%rdx,%r12,1),%rsi
   1401377e9:	lea    0x8(%rsi),%r8
   1401377ed:	jmp    14012ec60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb680>
   1401377f2:	sub    $0x1,%r12b
   1401377f6:	je     140137904 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14324>
   1401377fc:	lea    0x8(%rsi),%r8
   140137800:	cmp    0x30(%rsp),%r8
   140137805:	jae    1401378af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142cf>
   14013780b:	mov    0x1d0(%rsp),%rax
   140137813:	mov    $0x2,%r12d
   140137819:	movabs $0xfffc000000000000,%rdx
   140137823:	mov    %rax,(%rsi)
   140137826:	mov    0x1c8(%rsp),%rax
   14013782e:	mov    %r8,%rsi
   140137831:	mov    %rax,0x1d0(%rsp)
   140137839:	mov    0x50(%rdi),%rax
   14013783d:	vmovsd (%rax,%r14,8),%xmm0
   140137843:	vucomisd %xmm0,%xmm0
   140137847:	vmovq  %xmm0,%rax
   14013784c:	cmovp  %rdx,%rax
   140137850:	jmp    140135d38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12758>
   140137855:	mov    %r9,%rdx
   140137858:	lea    0x1048(%rbx),%rcx
   14013785f:	vzeroupper
   140137862:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137867:	mov    0x1048(%rbx),%rdx
   14013786e:	mov    0x1050(%rbx),%rax
   140137875:	lea    (%rdx,%r12,1),%rsi
   140137879:	lea    0x8(%rsi),%r8
   14013787d:	jmp    14012ec00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb620>
   140137882:	mov    %r9,%rdx
   140137885:	lea    0x1048(%rbx),%rcx
   14013788c:	vzeroupper
   14013788f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137894:	mov    0x1048(%rbx),%rdx
   14013789b:	mov    0x1050(%rbx),%rax
   1401378a2:	lea    (%rdx,%r12,1),%rsi
   1401378a6:	lea    0x8(%rsi),%r8
   1401378aa:	jmp    14012e87e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb29e>
   1401378af:	mov    0x1050(%rbx),%rax
   1401378b6:	mov    0x1048(%rbx),%rdx
   1401378bd:	mov    %rax,0x30(%rsp)
   1401378c2:	sub    %rdx,%rax
   1401378c5:	sar    $0x3,%rax
   1401378c9:	lea    (%rax,%rax,1),%rcx
   1401378cd:	cmp    %rcx,%rax
   1401378d0:	jae    14013780b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1422b>
   1401378d6:	sub    %rdx,%rsi
   1401378d9:	mov    %rcx,%rdx
   1401378dc:	lea    0x1048(%rbx),%rcx
   1401378e3:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401378e8:	mov    0x1050(%rbx),%rax
   1401378ef:	add    0x1048(%rbx),%rsi
   1401378f6:	lea    0x8(%rsi),%r8
   1401378fa:	mov    %rax,0x30(%rsp)
   1401378ff:	jmp    14013780b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1422b>
   140137904:	mov    0x1c8(%rsp),%rax
   14013790c:	mov    $0x2,%r12d
   140137912:	movabs $0xfffc000000000000,%rdx
   14013791c:	mov    %rax,0x1d0(%rsp)
   140137924:	mov    0x50(%rdi),%rax
   140137928:	vmovsd (%rax,%r14,8),%xmm0
   14013792e:	vucomisd %xmm0,%xmm0
   140137932:	vmovq  %xmm0,%rax
   140137937:	cmovp  %rdx,%rax
   14013793b:	jmp    140135d38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12758>
   140137940:	mov    %r9,%rdx
   140137943:	lea    0x1048(%rbx),%rcx
   14013794a:	vzeroupper
   14013794d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137952:	mov    0x1048(%rbx),%rdx
   140137959:	mov    0x1050(%rbx),%rax
   140137960:	lea    (%rdx,%r12,1),%rsi
   140137964:	lea    0x8(%rsi),%r8
   140137968:	jmp    14012ed80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7a0>
   14013796d:	mov    0x1050(%rbx),%rax
   140137974:	mov    0x1048(%rbx),%rcx
   14013797b:	mov    %rax,0x30(%rsp)
   140137980:	sub    %rcx,%rax
   140137983:	sar    $0x3,%rax
   140137987:	lea    (%rax,%rax,1),%rdx
   14013798b:	cmp    %rdx,%rax
   14013798e:	jae    140135ddc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127fc>
   140137994:	sub    %rcx,%r14
   140137997:	lea    0x1048(%rbx),%rcx
   14013799e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401379a3:	mov    0x1050(%rbx),%rax
   1401379aa:	add    0x1048(%rbx),%r14
   1401379b1:	lea    0x8(%r14),%r12
   1401379b5:	mov    %rax,0x30(%rsp)
   1401379ba:	jmp    140135ddc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127fc>
   1401379bf:	mov    0x1c8(%rsp),%rax
   1401379c7:	lea    0x540(%rsp),%rcx
   1401379cf:	mov    $0x2,%r12d
   1401379d5:	mov    %rax,0x1d0(%rsp)
   1401379dd:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401379e2:	mov    0x540(%rsp),%rax
   1401379ea:	mov    %rax,0x1c8(%rsp)
   1401379f2:	jmp    14013264f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf06f>
   1401379f7:	sub    $0x1,%r12b
   1401379fb:	je     140137b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145a0>
   140137a01:	lea    0x8(%rsi),%r8
   140137a05:	cmp    0x30(%rsp),%r8
   140137a0a:	jae    140137b1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1453a>
   140137a10:	mov    0x1d0(%rsp),%rdx
   140137a18:	mov    $0x2,%r12d
   140137a1e:	mov    %rdx,(%rsi)
   140137a21:	mov    0x1c8(%rsp),%rdx
   140137a29:	mov    %r8,%rsi
   140137a2c:	mov    (%rax,%r11,8),%rax
   140137a30:	mov    %rdx,0x1d0(%rsp)
   140137a38:	mov    %rax,0x1c8(%rsp)
   140137a40:	jmp    140130a7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd49c>
   140137a45:	mov    %r9,%rdx
   140137a48:	lea    0x1048(%rbx),%rcx
   140137a4f:	vzeroupper
   140137a52:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a57:	mov    0x1048(%rbx),%rdx
   140137a5e:	mov    0x1050(%rbx),%rax
   140137a65:	lea    (%rdx,%r12,1),%rsi
   140137a69:	lea    0x8(%rsi),%r8
   140137a6d:	jmp    14012ea97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4b7>
   140137a72:	mov    0x1050(%rbx),%rax
   140137a79:	mov    0x1048(%rbx),%rdx
   140137a80:	mov    %rax,0x30(%rsp)
   140137a85:	sub    %rdx,%rax
   140137a88:	sar    $0x3,%rax
   140137a8c:	lea    (%rax,%rax,1),%rcx
   140137a90:	cmp    %rcx,%rax
   140137a93:	jae    140133655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10075>
   140137a99:	sub    %rdx,%rsi
   140137a9c:	mov    %rcx,%rdx
   140137a9f:	lea    0x1048(%rbx),%rcx
   140137aa6:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137aab:	mov    0x1050(%rbx),%rax
   140137ab2:	add    0x1048(%rbx),%rsi
   140137ab9:	lea    0x8(%rsi),%r8
   140137abd:	mov    %rax,0x30(%rsp)
   140137ac2:	jmp    140133655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10075>
   140137ac7:	sub    $0x1,%r12b
   140137acb:	je     140130e38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd858>
   140137ad1:	lea    0x8(%rsi),%r8
   140137ad5:	cmp    0x30(%rsp),%r8
   140137ada:	jae    140137ba7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145c7>
   140137ae0:	mov    0x1d0(%rsp),%rax
   140137ae8:	mov    $0x2,%r12d
   140137aee:	mov    %rax,(%rsi)
   140137af1:	mov    0x1c8(%rsp),%rax
   140137af9:	mov    %r8,%rsi
   140137afc:	mov    %rax,0x1d0(%rsp)
   140137b04:	mov    $0x1fff,%eax
   140137b09:	shl    $0x33,%rax
   140137b0d:	mov    %rax,0x1c8(%rsp)
   140137b15:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   140137b1a:	mov    0x1050(%rbx),%rcx
   140137b21:	mov    0x1048(%rbx),%rdx
   140137b28:	mov    %rcx,0x30(%rsp)
   140137b2d:	sub    %rdx,%rcx
   140137b30:	mov    %rcx,%r9
   140137b33:	sar    $0x3,%r9
   140137b37:	lea    (%r9,%r9,1),%rcx
   140137b3b:	cmp    %rcx,%r9
   140137b3e:	jae    140137a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14430>
   140137b44:	sub    %rdx,%rsi
   140137b47:	mov    %rcx,%rdx
   140137b4a:	lea    0x1048(%rbx),%rcx
   140137b51:	mov    %r11,0x40(%rsp)
   140137b56:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137b5b:	mov    0x1050(%rbx),%rax
   140137b62:	mov    0x40(%rsp),%r11
   140137b67:	add    0x1048(%rbx),%rsi
   140137b6e:	mov    %rax,0x30(%rsp)
   140137b73:	lea    0x8(%rsi),%r8
   140137b77:	mov    0x48(%rdi),%rax
   140137b7b:	jmp    140137a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14430>
   140137b80:	mov    0x1c8(%rsp),%rdx
   140137b88:	mov    (%rax,%r11,8),%rax
   140137b8c:	mov    $0x2,%r12d
   140137b92:	mov    %rdx,0x1d0(%rsp)
   140137b9a:	mov    %rax,0x1c8(%rsp)
   140137ba2:	jmp    140130a7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd49c>
   140137ba7:	mov    0x1050(%rbx),%rax
   140137bae:	mov    0x1048(%rbx),%rdx
   140137bb5:	mov    %rax,0x30(%rsp)
   140137bba:	sub    %rdx,%rax
   140137bbd:	sar    $0x3,%rax
   140137bc1:	lea    (%rax,%rax,1),%rcx
   140137bc5:	cmp    %rcx,%rax
   140137bc8:	jae    140137ae0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14500>
   140137bce:	sub    %rdx,%rsi
   140137bd1:	mov    %rcx,%rdx
   140137bd4:	lea    0x1048(%rbx),%rcx
   140137bdb:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137be0:	mov    0x1050(%rbx),%rax
   140137be7:	add    0x1048(%rbx),%rsi
   140137bee:	lea    0x8(%rsi),%r8
   140137bf2:	mov    %rax,0x30(%rsp)
   140137bf7:	jmp    140137ae0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14500>
   140137bfc:	mov    0x1c8(%rsp),%rax
   140137c04:	lea    0x680(%rsp),%rcx
   140137c0c:	mov    $0x2,%r12d
   140137c12:	mov    %rax,0x1d0(%rsp)
   140137c1a:	mov    0x20(%rdi),%rax
   140137c1e:	mov    (%rax,%r14,8),%rdx
   140137c22:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137c27:	mov    0x680(%rsp),%rax
   140137c2f:	mov    %rax,0x1c8(%rsp)
   140137c37:	jmp    14013520d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c2d>
   140137c3c:	mov    0x20(%rdi),%rax
   140137c40:	lea    0x680(%rsp),%rcx
   140137c48:	mov    $0x1,%r12d
   140137c4e:	mov    (%rax,%r14,8),%rdx
   140137c52:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137c57:	mov    0x680(%rsp),%rax
   140137c5f:	mov    %rax,0x1c8(%rsp)
   140137c67:	jmp    14013520d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c2d>
   140137c6c:	mov    %rax,%r8
   140137c6f:	sub    %rdx,%r8
   140137c72:	sar    $0x3,%r8
   140137c76:	lea    (%r8,%r8,1),%r9
   140137c7a:	cmp    %r9,%r8
   140137c7d:	jae    14013503e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a5e>
   140137c83:	sub    %rdx,%rsi
   140137c86:	lea    0x1048(%rbx),%rcx
   140137c8d:	mov    %r9,%rdx
   140137c90:	vzeroupper
   140137c93:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137c98:	mov    0x1048(%rbx),%rdx
   140137c9f:	mov    0x1050(%rbx),%rax
   140137ca6:	add    %rdx,%rsi
   140137ca9:	lea    0x10(%rsi),%rcx
   140137cad:	jmp    140135041 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a61>
   140137cb2:	mov    0x1050(%rbx),%rax
   140137cb9:	mov    %rax,0x30(%rsp)
   140137cbe:	sub    %rdx,%rax
   140137cc1:	sar    $0x3,%rax
   140137cc5:	lea    (%rax,%rax,1),%rcx
   140137cc9:	cmp    %rcx,%rax
   140137ccc:	jae    1401326a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0c0>
   140137cd2:	sub    %rdx,%rsi
   140137cd5:	mov    %rcx,%rdx
   140137cd8:	lea    0x1048(%rbx),%rcx
   140137cdf:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ce4:	mov    0x1048(%rbx),%rdx
   140137ceb:	mov    0x1050(%rbx),%rax
   140137cf2:	add    %rdx,%rsi
   140137cf5:	mov    %rax,0x30(%rsp)
   140137cfa:	lea    0x8(%rsi),%r8
   140137cfe:	jmp    1401326a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0c0>
   140137d03:	mov    0x1048(%rbx),%rdx
   140137d0a:	mov    0x1050(%rbx),%rax
   140137d11:	mov    %rsi,%rcx
   140137d14:	vzeroupper
   140137d17:	jmp    140132279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec99>
   140137d1c:	mov    0x1050(%rbx),%rax
   140137d23:	mov    0x1048(%rbx),%rcx
   140137d2a:	mov    %rax,0x30(%rsp)
   140137d2f:	sub    %rcx,%rax
   140137d32:	sar    $0x3,%rax
   140137d36:	lea    (%rax,%rax,1),%rdx
   140137d3a:	cmp    %rdx,%rax
   140137d3d:	jae    14012e951 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb371>
   140137d43:	sub    %rcx,%rsi
   140137d46:	lea    0x1048(%rbx),%rcx
   140137d4d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d52:	mov    0x1050(%rbx),%rax
   140137d59:	add    0x1048(%rbx),%rsi
   140137d60:	mov    %rax,0x30(%rsp)
   140137d65:	jmp    14012e951 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb371>
   140137d6a:	mov    0x1c8(%rsp),%rax
   140137d72:	lea    0x690(%rsp),%r12
   140137d7a:	mov    $0x1,%edx
   140137d7f:	lea    0x680(%rsp),%rcx
   140137d87:	mov    %rax,0x1d0(%rsp)
   140137d8f:	mov    0x540(%rsp),%rax
   140137d97:	movsbl (%rax,%rdi,1),%r8d
   140137d9c:	mov    %r12,0x680(%rsp)
   140137da4:	call   1402fd8a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140137da9:	lea    0x680(%rsp),%rdx
   140137db1:	lea    0x520(%rsp),%rcx
   140137db9:	call   14021d3a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140137dbe:	mov    0x520(%rsp),%rax
   140137dc6:	mov    0x680(%rsp),%rcx
   140137dce:	mov    %rax,0x1c8(%rsp)
   140137dd6:	cmp    %r12,%rcx
   140137dd9:	je     140131d54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe774>
   140137ddf:	mov    0x690(%rsp),%rax
   140137de7:	lea    0x1(%rax),%rdx
   140137deb:	call   14034a160 <operator delete(void*, unsigned long long)>
   140137df0:	jmp    140131d54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe774>
   140137df5:	mov    0x1050(%rbx),%rax
   140137dfc:	mov    0x1048(%rbx),%rcx
   140137e03:	mov    %rax,0x30(%rsp)
   140137e08:	sub    %rcx,%rax
   140137e0b:	sar    $0x3,%rax
   140137e0f:	lea    (%rax,%rax,1),%rdx
   140137e13:	cmp    %rdx,%rax
   140137e16:	jae    140132609 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf029>
   140137e1c:	sub    %rcx,%r14
   140137e1f:	lea    0x1048(%rbx),%rcx
   140137e26:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137e2b:	mov    0x1050(%rbx),%rax
   140137e32:	add    0x1048(%rbx),%r14
   140137e39:	lea    0x8(%r14),%r12
   140137e3d:	mov    %rax,0x30(%rsp)
   140137e42:	jmp    140132609 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf029>
   140137e47:	mov    0x1c8(%rsp),%rax
   140137e4f:	mov    0x40(%rsp),%rdx
   140137e54:	lea    0x540(%rsp),%rcx
   140137e5c:	mov    %rax,0x1d0(%rsp)
   140137e64:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137e69:	mov    0x540(%rsp),%rax
   140137e71:	mov    %rax,0x1c8(%rsp)
   140137e79:	jmp    1401350a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ac5>
   140137e7e:	mov    0x1050(%rbx),%rax
   140137e85:	mov    0x1048(%rbx),%rcx
   140137e8c:	mov    %rax,0x30(%rsp)
   140137e91:	sub    %rcx,%rax
   140137e94:	sar    $0x3,%rax
   140137e98:	lea    (%rax,%rax,1),%rdx
   140137e9c:	cmp    %rdx,%rax
   140137e9f:	jae    140131a22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe442>
   140137ea5:	sub    %rcx,%rsi
   140137ea8:	lea    0x1048(%rbx),%rcx
   140137eaf:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137eb4:	mov    0x1050(%rbx),%rax
   140137ebb:	add    0x1048(%rbx),%rsi
   140137ec2:	lea    0x8(%rsi),%r8
   140137ec6:	mov    %rax,0x30(%rsp)
   140137ecb:	jmp    140131a22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe442>
   140137ed0:	mov    0x1c8(%rsp),%rax
   140137ed8:	mov    0x40(%rsp),%rdx
   140137edd:	lea    0x540(%rsp),%rcx
   140137ee5:	mov    %rax,0x1d0(%rsp)
   140137eed:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137ef2:	mov    0x540(%rsp),%rax
   140137efa:	mov    %rax,0x1c8(%rsp)
   140137f02:	jmp    14012e5b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafd5>
   140137f07:	mov    0x1c8(%rsp),%rax
   140137f0f:	lea    0x680(%rsp),%rcx
   140137f17:	mov    $0x2,%r12d
   140137f1d:	mov    %rax,0x1d0(%rsp)
   140137f25:	mov    0x38(%rdi),%rax
   140137f29:	movzbl (%rax,%r14,1),%edx
   140137f2e:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137f33:	mov    0x680(%rsp),%rax
   140137f3b:	mov    %rax,0x1c8(%rsp)
   140137f43:	jmp    14012d980 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a0>
   140137f48:	mov    0x38(%rdi),%rax
   140137f4c:	lea    0x680(%rsp),%rcx
   140137f54:	mov    $0x1,%r12d
   140137f5a:	movzbl (%rax,%r14,1),%edx
   140137f5f:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140137f64:	mov    0x680(%rsp),%rax
   140137f6c:	mov    %rax,0x1c8(%rsp)
   140137f74:	jmp    14012d980 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a0>
   140137f79:	mov    0x1050(%rbx),%rax
   140137f80:	mov    0x1048(%rbx),%rdx
   140137f87:	mov    %rax,0x30(%rsp)
   140137f8c:	sub    %rdx,%rax
   140137f8f:	sar    $0x3,%rax
   140137f93:	lea    (%rax,%rax,1),%rcx
   140137f97:	cmp    %rcx,%rax
   140137f9a:	jae    1401351bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bdd>
   140137fa0:	sub    %rdx,%rsi
   140137fa3:	mov    %rcx,%rdx
   140137fa6:	lea    0x1048(%rbx),%rcx
   140137fad:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137fb2:	mov    0x1050(%rbx),%rax
   140137fb9:	add    0x1048(%rbx),%rsi
   140137fc0:	lea    0x8(%rsi),%r8
   140137fc4:	mov    %rax,0x30(%rsp)
   140137fc9:	jmp    1401351bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bdd>
   140137fce:	mov    0x1050(%rbx),%rax
   140137fd5:	mov    0x1048(%rbx),%rcx
   140137fdc:	mov    %rax,0x30(%rsp)
   140137fe1:	sub    %rcx,%rax
   140137fe4:	sar    $0x3,%rax
   140137fe8:	lea    (%rax,%rax,1),%rdx
   140137fec:	cmp    %rdx,%rax
   140137fef:	jae    140135ce5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12705>
   140137ff5:	sub    %rcx,%r14
   140137ff8:	lea    0x1048(%rbx),%rcx
   140137fff:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138004:	mov    0x1050(%rbx),%rax
   14013800b:	add    0x1048(%rbx),%r14
   140138012:	lea    0x8(%r14),%r12
   140138016:	mov    %rax,0x30(%rsp)
   14013801b:	jmp    140135ce5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12705>
   140138020:	mov    0x1c8(%rsp),%rax
   140138028:	movslq %edi,%rdx
   14013802b:	lea    0x540(%rsp),%rcx
   140138033:	mov    %rax,0x1d0(%rsp)
   14013803b:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138040:	mov    0x540(%rsp),%rax
   140138048:	mov    %rax,0x1c8(%rsp)
   140138050:	jmp    1401350a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ac5>
   140138055:	movslq %edi,%rdx
   140138058:	lea    0x540(%rsp),%rcx
   140138060:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138065:	mov    0x540(%rsp),%rax
   14013806d:	mov    %rax,0x1c8(%rsp)
   140138075:	jmp    140134fe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a09>
   14013807a:	mov    %rcx,%rdx
   14013807d:	lea    0x1068(%rbx),%rcx
   140138084:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138089:	jmp    1401314b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xded4>
   14013808e:	mov    %r12,(%rsi)
   140138091:	mov    %rbp,%r14
   140138094:	add    $0x8,%rsi
   140138098:	movb   $0x0,0x1040(%rbx)
   14013809f:	jmp    1401302e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd06>
   1401380a4:	call   140221db0 <tersun::VMTelemetryManager::instance()>
   1401380a9:	cmpb   $0x0,(%rax)
   1401380ac:	je     1401380b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ad6>
   1401380ae:	addq   $0x1,0x90(%rax)
   1401380b6:	mov    0x150c0(%rbx),%rdx
   1401380bd:	mov    0x152c8(%rbx),%rcx
   1401380c4:	movzbl 0x5b0(%rsp),%r9d
   1401380cd:	test   %rdx,%rdx
   1401380d0:	je     1401380e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b02>
   1401380d2:	lea    -0x1(%rdx),%rax
   1401380d6:	imul   $0x28,%rax,%rax
   1401380da:	mov    0x10e0(%rbx,%rax,1),%rdx
   1401380e2:	mov    0x40(%rsp),%r8d
   1401380e7:	call   14017e060 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   1401380ec:	mov    0x1060(%rbx),%rax
   1401380f3:	mov    0x38(%rsp),%r14
   1401380f8:	mov    0x1048(%rbx),%rdx
   1401380ff:	add    0x5a8(%rsp),%r14
   140138107:	lea    (%rdx,%rax,8),%rsi
   14013810b:	cmpb   $0x0,0x1040(%rbx)
   140138112:	je     14012a27a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c9a>
   140138118:	movzbl (%r14),%eax
   14013811c:	lea    0x29af7d(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140138123:	lea    0x1(%r14),%rbp
   140138127:	xor    %r12d,%r12d
   14013812a:	mov    (%rdi,%rax,8),%rax
   14013812e:	jmp    *%rax
   140138130:	mov    %r9,%rdx
   140138133:	lea    0x1048(%rbx),%rcx
   14013813a:	vzeroupper
   14013813d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138142:	mov    0x1048(%rbx),%rdx
   140138149:	mov    0x1050(%rbx),%rax
   140138150:	lea    (%rdx,%r12,1),%rsi
   140138154:	lea    0x8(%rsi),%r8
   140138158:	jmp    14012ee10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb830>
   14013815d:	mov    %r9,%rdx
   140138160:	lea    0x1048(%rbx),%rcx
   140138167:	vzeroupper
   14013816a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013816f:	mov    0x1048(%rbx),%rdx
   140138176:	mov    0x1050(%rbx),%rax
   14013817d:	lea    (%rdx,%r12,1),%rsi
   140138181:	lea    0x8(%rsi),%r8
   140138185:	jmp    14012ecc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6e0>
   14013818a:	mov    %r9,%rdx
   14013818d:	lea    0x1048(%rbx),%rcx
   140138194:	vzeroupper
   140138197:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013819c:	mov    0x1048(%rbx),%rdx
   1401381a3:	mov    0x1050(%rbx),%rax
   1401381aa:	lea    (%rdx,%r12,1),%rsi
   1401381ae:	lea    0x8(%rsi),%r8
   1401381b2:	jmp    14012e7be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1de>
   1401381b7:	mov    0x1050(%rbx),%rax
   1401381be:	mov    0x1048(%rbx),%rcx
   1401381c5:	mov    %rax,0x30(%rsp)
   1401381ca:	sub    %rcx,%rax
   1401381cd:	sar    $0x3,%rax
   1401381d1:	lea    (%rax,%rax,1),%rdx
   1401381d5:	cmp    %rdx,%rax
   1401381d8:	jae    14012e463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae83>
   1401381de:	sub    %rcx,%rsi
   1401381e1:	lea    0x1048(%rbx),%rcx
   1401381e8:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401381ed:	mov    0x1050(%rbx),%rax
   1401381f4:	add    0x1048(%rbx),%rsi
   1401381fb:	lea    0x8(%rsi),%r8
   1401381ff:	mov    %rax,0x30(%rsp)
   140138204:	jmp    14012e463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae83>
   140138209:	mov    %r9,%rdx
   14013820c:	lea    0x1048(%rbx),%rcx
   140138213:	vzeroupper
   140138216:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013821b:	mov    0x1048(%rbx),%rdx
   140138222:	mov    0x1050(%rbx),%rax
   140138229:	lea    (%rdx,%r12,1),%rsi
   14013822d:	lea    0x8(%rsi),%r8
   140138231:	jmp    14012e6fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb11e>
   140138236:	mov    %r9,%rdx
   140138239:	lea    0x1048(%rbx),%rcx
   140138240:	vzeroupper
   140138243:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138248:	mov    0x1048(%rbx),%rdx
   14013824f:	mov    0x1050(%rbx),%rax
   140138256:	lea    (%rdx,%r12,1),%rsi
   14013825a:	lea    0x8(%rsi),%r8
   14013825e:	jmp    14012e75e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb17e>
   140138263:	mov    %r9,%rdx
   140138266:	lea    0x1048(%rbx),%rcx
   14013826d:	vzeroupper
   140138270:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138275:	mov    0x1048(%rbx),%rdx
   14013827c:	mov    0x1050(%rbx),%rax
   140138283:	lea    (%rdx,%r12,1),%rsi
   140138287:	lea    0x8(%rsi),%r8
   14013828b:	jmp    14012e84e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb26e>
   140138290:	mov    %r9,%rdx
   140138293:	lea    0x1048(%rbx),%rcx
   14013829a:	vzeroupper
   14013829d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401382a2:	mov    0x1048(%rbx),%rdx
   1401382a9:	mov    0x1050(%rbx),%rax
   1401382b0:	lea    (%rdx,%r12,1),%rsi
   1401382b4:	lea    0x8(%rsi),%r8
   1401382b8:	jmp    14012e7ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb20e>
   1401382bd:	mov    %r9,%rdx
   1401382c0:	lea    0x1048(%rbx),%rcx
   1401382c7:	vzeroupper
   1401382ca:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401382cf:	mov    0x1048(%rbx),%rdx
   1401382d6:	mov    0x1050(%rbx),%rax
   1401382dd:	lea    (%rdx,%r12,1),%rsi
   1401382e1:	lea    0x8(%rsi),%r8
   1401382e5:	jmp    14012e66e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb08e>
   1401382ea:	mov    $0x20,%r8d
   1401382f0:	jmp    140136afe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1351e>
   1401382f5:	mov    %r9,%rdx
   1401382f8:	lea    0x1048(%rbx),%rcx
   1401382ff:	vzeroupper
   140138302:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138307:	mov    0x1048(%rbx),%rdx
   14013830e:	mov    0x1050(%rbx),%rax
   140138315:	lea    (%rdx,%r12,1),%rsi
   140138319:	lea    0x8(%rsi),%r8
   14013831d:	jmp    14012ea67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb487>
   140138322:	xor    %eax,%eax
   140138324:	jmp    140135731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12151>
   140138329:	mov    %r9,%rdx
   14013832c:	lea    0x1048(%rbx),%rcx
   140138333:	vzeroupper
   140138336:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013833b:	mov    0x1048(%rbx),%rdx
   140138342:	mov    0x1050(%rbx),%rax
   140138349:	lea    (%rdx,%r12,1),%rsi
   14013834d:	lea    0x8(%rsi),%r8
   140138351:	jmp    14012ef00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb920>
   140138356:	mov    %r9,%rdx
   140138359:	lea    0x1048(%rbx),%rcx
   140138360:	vzeroupper
   140138363:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138368:	mov    0x1048(%rbx),%rdx
   14013836f:	mov    0x1050(%rbx),%rax
   140138376:	lea    (%rdx,%r12,1),%rsi
   14013837a:	lea    0x8(%rsi),%r8
   14013837e:	jmp    14012ee40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb860>
   140138383:	mov    %r9,%rdx
   140138386:	lea    0x1048(%rbx),%rcx
   14013838d:	vzeroupper
   140138390:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138395:	mov    0x1048(%rbx),%rdx
   14013839c:	mov    0x1050(%rbx),%rax
   1401383a3:	lea    (%rdx,%r12,1),%rsi
   1401383a7:	lea    0x8(%rsi),%r8
   1401383ab:	jmp    14012edb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d0>
   1401383b0:	mov    %r9,%rdx
   1401383b3:	lea    0x1048(%rbx),%rcx
   1401383ba:	vzeroupper
   1401383bd:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401383c2:	mov    0x1048(%rbx),%rdx
   1401383c9:	mov    0x1050(%rbx),%rax
   1401383d0:	lea    (%rdx,%r12,1),%rsi
   1401383d4:	lea    0x8(%rsi),%r8
   1401383d8:	jmp    14012e81e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb23e>
   1401383dd:	mov    0x1050(%rbx),%rax
   1401383e4:	mov    0x1048(%rbx),%rcx
   1401383eb:	mov    %rax,0x30(%rsp)
   1401383f0:	sub    %rcx,%rax
   1401383f3:	sar    $0x3,%rax
   1401383f7:	lea    (%rax,%rax,1),%rdx
   1401383fb:	cmp    %rdx,%rax
   1401383fe:	jae    140130f41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd961>
   140138404:	sub    %rcx,%r14
   140138407:	lea    0x1048(%rbx),%rcx
   14013840e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138413:	mov    0x1050(%rbx),%rax
   14013841a:	add    0x1048(%rbx),%r14
   140138421:	lea    0x8(%r14),%r12
   140138425:	mov    %rax,0x30(%rsp)
   14013842a:	jmp    140130f41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd961>
   14013842f:	mov    0x1c8(%rsp),%rax
   140138437:	lea    0x338(%rsp),%rdx
   14013843f:	lea    0x680(%rsp),%rcx
   140138447:	mov    %rax,0x1d0(%rsp)
   14013844f:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140138454:	mov    %rsi,%rcx
   140138457:	lea    0x680(%rsp),%rdx
   14013845f:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140138464:	mov    0x680(%rsp),%rcx
   14013846c:	mov    %rax,0x1c8(%rsp)
   140138474:	lea    0x690(%rsp),%rax
   14013847c:	cmp    %rax,%rcx
   14013847f:	je     140138492 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eb2>
   140138481:	mov    0x690(%rsp),%rax
   140138489:	lea    0x1(%rax),%rdx
   14013848d:	call   14034a160 <operator delete(void*, unsigned long long)>
   140138492:	mov    %r14,%rsi
   140138495:	jmp    140130e5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd87a>
   14013849a:	mov    0x1050(%rbx),%rax
   1401384a1:	mov    0x1048(%rbx),%rdx
   1401384a8:	mov    %rax,0x30(%rsp)
   1401384ad:	sub    %rdx,%rax
   1401384b0:	sar    $0x3,%rax
   1401384b4:	lea    (%rax,%rax,1),%rcx
   1401384b8:	cmp    %rcx,%rax
   1401384bb:	jae    140133fab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109cb>
   1401384c1:	sub    %rdx,%rsi
   1401384c4:	mov    %rcx,%rdx
   1401384c7:	lea    0x1048(%rbx),%rcx
   1401384ce:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401384d3:	mov    0x1050(%rbx),%rax
   1401384da:	add    0x1048(%rbx),%rsi
   1401384e1:	lea    0x8(%rsi),%r8
   1401384e5:	mov    %rax,0x30(%rsp)
   1401384ea:	jmp    140133fab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109cb>
   1401384ef:	mov    %r9,%rdx
   1401384f2:	lea    0x1048(%rbx),%rcx
   1401384f9:	vzeroupper
   1401384fc:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138501:	mov    0x1048(%rbx),%rdx
   140138508:	mov    0x1050(%rbx),%rax
   14013850f:	lea    (%rdx,%r12,1),%rsi
   140138513:	lea    0x8(%rsi),%r8
   140138517:	jmp    14012e8ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ce>
   14013851c:	mov    0x1048(%rbx),%rdx
   140138523:	jmp    1401367ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131ee>
   140138528:	mov    0x1048(%rbx),%rdx
   14013852f:	lea    0x10(%rsi),%rcx
   140138533:	cmp    0x30(%rsp),%rcx
   140138538:	jae    140138827 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15247>
   14013853e:	mov    0x1d0(%rsp),%rax
   140138546:	xor    %r12d,%r12d
   140138549:	mov    %rax,(%rsi)
   14013854c:	mov    0x1c8(%rsp),%rax
   140138554:	mov    %rax,0x8(%rsi)
   140138558:	mov    %rcx,%rsi
   14013855b:	jmp    1401367ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131ee>
   140138560:	mov    %r9,%rdx
   140138563:	lea    0x1048(%rbx),%rcx
   14013856a:	vzeroupper
   14013856d:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138572:	mov    0x1048(%rbx),%rdx
   140138579:	mov    0x1050(%rbx),%rax
   140138580:	lea    (%rdx,%r12,1),%rsi
   140138584:	lea    0x8(%rsi),%r8
   140138588:	jmp    14012ef30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb950>
   14013858d:	mov    0x1c8(%rsp),%rax
   140138595:	mov    %r14,%rdx
   140138598:	mov    %rdi,%rcx
   14013859b:	mov    %rax,0x1d0(%rsp)
   1401385a3:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   1401385a8:	mov    %rax,0x1c8(%rsp)
   1401385b0:	jmp    140130e5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd87a>
   1401385b5:	mov    %r14,%rdx
   1401385b8:	mov    %rdi,%rcx
   1401385bb:	mov    $0x1,%r12d
   1401385c1:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   1401385c6:	mov    %rax,0x1c8(%rsp)
   1401385ce:	jmp    140127d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478f>
   1401385d3:	mov    0x1050(%rbx),%rax
   1401385da:	mov    0x1048(%rbx),%rdx
   1401385e1:	mov    %rax,0x30(%rsp)
   1401385e6:	sub    %rdx,%rax
   1401385e9:	sar    $0x3,%rax
   1401385ed:	lea    (%rax,%rax,1),%rcx
   1401385f1:	cmp    %rcx,%rax
   1401385f4:	jae    140134da9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117c9>
   1401385fa:	sub    %rdx,%rsi
   1401385fd:	mov    %rcx,%rdx
   140138600:	lea    0x1048(%rbx),%rcx
   140138607:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013860c:	mov    0x1050(%rbx),%rax
   140138613:	add    0x1048(%rbx),%rsi
   14013861a:	lea    0x8(%rsi),%r8
   14013861e:	mov    %rax,0x30(%rsp)
   140138623:	jmp    140134da9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117c9>
   140138628:	lea    (%rdi,%rdi,1),%rdx
   14013862c:	lea    0x1048(%rbx),%rcx
   140138633:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138638:	jmp    140134e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11847>
   14013863d:	mov    0x1048(%rbx),%rdx
   140138644:	lea    0x8(%rsi),%r8
   140138648:	cmp    0x30(%rsp),%r8
   14013864d:	jae    1401386ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150cd>
   14013864f:	mov    0x1050(%rbx),%rax
   140138656:	vzeroupper
   140138659:	mov    0x1c8(%rsp),%rcx
   140138661:	xor    %r12d,%r12d
   140138664:	mov    %rcx,(%rsi)
   140138667:	mov    %r8,%rsi
   14013866a:	jmp    140134e11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11831>
   14013866f:	mov    0x1048(%rbx),%rdx
   140138676:	lea    0x10(%rsi),%rcx
   14013867a:	cmp    0x30(%rsp),%rcx
   14013867f:	jae    1401386d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150f7>
   140138681:	mov    0x1050(%rbx),%rax
   140138688:	vzeroupper
   14013868b:	mov    0x1d0(%rsp),%r8
   140138693:	xor    %r12d,%r12d
   140138696:	mov    %r8,(%rsi)
   140138699:	mov    0x1c8(%rsp),%r8
   1401386a1:	mov    %r8,0x8(%rsi)
   1401386a5:	mov    %rcx,%rsi
   1401386a8:	jmp    140134e11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11831>
   1401386ad:	mov    0x1050(%rbx),%rax
   1401386b4:	mov    %rsi,%r12
   1401386b7:	sub    %rdx,%r12
   1401386ba:	mov    %rax,%rcx
   1401386bd:	mov    %rax,0x30(%rsp)
   1401386c2:	sub    %rdx,%rcx
   1401386c5:	sar    $0x3,%rcx
   1401386c9:	lea    (%rcx,%rcx,1),%r9
   1401386cd:	cmp    %r9,%rcx
   1401386d0:	jb     140138701 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15121>
   1401386d2:	vzeroupper
   1401386d5:	jmp    140138659 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15079>
   1401386d7:	mov    0x1050(%rbx),%rax
   1401386de:	mov    %rsi,%r12
   1401386e1:	sub    %rdx,%r12
   1401386e4:	mov    %rax,%r8
   1401386e7:	mov    %rax,0x30(%rsp)
   1401386ec:	sub    %rdx,%r8
   1401386ef:	sar    $0x3,%r8
   1401386f3:	lea    (%r8,%r8,1),%r9
   1401386f7:	cmp    %r9,%r8
   1401386fa:	jb     140138733 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15153>
   1401386fc:	vzeroupper
   1401386ff:	jmp    14013868b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150ab>
   140138701:	mov    %r9,%rdx
   140138704:	lea    0x1048(%rbx),%rcx
   14013870b:	vzeroupper
   14013870e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138713:	mov    0x1048(%rbx),%rdx
   14013871a:	mov    0x1050(%rbx),%rax
   140138721:	lea    (%rdx,%r12,1),%rsi
   140138725:	mov    %rax,0x30(%rsp)
   14013872a:	lea    0x8(%rsi),%r8
   14013872e:	jmp    140138659 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15079>
   140138733:	lea    0x1048(%rbx),%rcx
   14013873a:	mov    %r9,%rdx
   14013873d:	vzeroupper
   140138740:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138745:	mov    0x1048(%rbx),%rdx
   14013874c:	mov    0x1050(%rbx),%rax
   140138753:	lea    (%rdx,%r12,1),%rsi
   140138757:	mov    %rax,0x30(%rsp)
   14013875c:	lea    0x10(%rsi),%rcx
   140138760:	jmp    14013868b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150ab>
   140138765:	mov    0x1050(%rbx),%rax
   14013876c:	mov    0x1048(%rbx),%rcx
   140138773:	mov    %rax,0x30(%rsp)
   140138778:	sub    %rcx,%rax
   14013877b:	sar    $0x3,%rax
   14013877f:	lea    (%rax,%rax,1),%rdx
   140138783:	cmp    %rdx,%rax
   140138786:	jae    140131d0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe72b>
   14013878c:	sub    %rcx,%rsi
   14013878f:	lea    0x1048(%rbx),%rcx
   140138796:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013879b:	mov    0x1050(%rbx),%rax
   1401387a2:	add    0x1048(%rbx),%rsi
   1401387a9:	lea    0x8(%rsi),%r8
   1401387ad:	mov    %rax,0x30(%rsp)
   1401387b2:	jmp    140131d0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe72b>
   1401387b7:	mov    %rax,%r8
   1401387ba:	sub    %rdx,%r8
   1401387bd:	sar    $0x3,%r8
   1401387c1:	lea    (%r8,%r8,1),%r9
   1401387c5:	cmp    %r9,%r8
   1401387c8:	jae    140133b37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10557>
   1401387ce:	sub    %rdx,%rsi
   1401387d1:	lea    0x1048(%rbx),%rcx
   1401387d8:	mov    %r9,%rdx
   1401387db:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401387e0:	mov    0x1048(%rbx),%rdx
   1401387e7:	mov    0x1050(%rbx),%rax
   1401387ee:	add    %rdx,%rsi
   1401387f1:	lea    0x10(%rsi),%rcx
   1401387f5:	jmp    140133b37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10557>
   1401387fa:	mov    %r9,%rdx
   1401387fd:	lea    0x1048(%rbx),%rcx
   140138804:	vzeroupper
   140138807:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013880c:	mov    0x1048(%rbx),%rdx
   140138813:	mov    0x1050(%rbx),%rax
   14013881a:	lea    (%rdx,%r12,1),%rsi
   14013881e:	lea    0x8(%rsi),%r8
   140138822:	jmp    14012eed0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8f0>
   140138827:	mov    0x1050(%rbx),%rax
   14013882e:	mov    %rsi,%rbp
   140138831:	sub    %rdx,%rbp
   140138834:	mov    %rax,0x30(%rsp)
   140138839:	sub    %rdx,%rax
   14013883c:	sar    $0x3,%rax
   140138840:	lea    (%rax,%rax,1),%r8
   140138844:	cmp    %r8,%rax
   140138847:	jae    14013853e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f5e>
   14013884d:	lea    0x1048(%rbx),%rcx
   140138854:	mov    %r8,%rdx
   140138857:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013885c:	mov    0x1048(%rbx),%rdx
   140138863:	mov    0x1050(%rbx),%rax
   14013886a:	lea    (%rdx,%rbp,1),%rsi
   14013886e:	mov    %rax,0x30(%rsp)
   140138873:	lea    0x10(%rsi),%rcx
   140138877:	jmp    14013853e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f5e>
   14013887c:	mov    %rax,%rcx
   14013887f:	sub    %rdx,%rcx
   140138882:	sar    $0x3,%rcx
   140138886:	lea    (%rcx,%rcx,1),%r9
   14013888a:	cmp    %r9,%rcx
   14013888d:	jae    140130fee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda0e>
   140138893:	sub    %rdx,%rsi
   140138896:	lea    0x1048(%rbx),%rcx
   14013889d:	mov    %r9,%rdx
   1401388a0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401388a5:	mov    0x1048(%rbx),%rdx
   1401388ac:	mov    0x1050(%rbx),%rax
   1401388b3:	add    %rdx,%rsi
   1401388b6:	lea    0x8(%rsi),%r8
   1401388ba:	jmp    140130fee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda0e>
   1401388bf:	mov    0x1048(%rbx),%rdx
   1401388c6:	mov    0x1050(%rbx),%rcx
   1401388cd:	mov    %rsi,%r12
   1401388d0:	mov    %rcx,0x30(%rsp)
   1401388d5:	sub    %rdx,%rcx
   1401388d8:	sub    %rdx,%r12
   1401388db:	sar    $0x3,%rcx
   1401388df:	mov    %rcx,%rdx
   1401388e2:	lea    (%rcx,%rcx,1),%rcx
   1401388e6:	cmp    %rcx,%rdx
   1401388e9:	jae    14013370d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1012d>
   1401388ef:	mov    %eax,0x60(%rsp)
   1401388f3:	mov    %rcx,%rdx
   1401388f6:	lea    0x1048(%rbx),%rcx
   1401388fd:	mov    %r9d,0x40(%rsp)
   140138902:	vzeroupper
   140138905:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013890a:	mov    0x1048(%rbx),%rsi
   140138911:	mov    0x1050(%rbx),%rax
   140138918:	mov    0x40(%rsp),%r9d
   14013891d:	add    %r12,%rsi
   140138920:	mov    %rax,0x30(%rsp)
   140138925:	mov    0x60(%rsp),%eax
   140138929:	lea    0x8(%rsi),%r8
   14013892d:	jmp    14013370d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1012d>
   140138932:	mov    %r10,0x30(%rsp)
   140138937:	lea    0x0(%rbp,%rbp,1),%rdx
   14013893c:	lea    0x1048(%rbx),%rcx
   140138943:	vzeroupper
   140138946:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013894b:	mov    0x30(%rsp),%r10
   140138950:	jmp    140134bcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115eb>
   140138955:	mov    0x1048(%rbx),%rdx
   14013895c:	mov    0x1050(%rbx),%rax
   140138963:	lea    0x8(%rsi),%r8
   140138967:	cmp    0x30(%rsp),%r8
   14013896c:	jae    1401397a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x161c2>
   140138972:	mov    0x1c8(%rsp),%rcx
   14013897a:	mov    %rcx,(%rsi)
   14013897d:	mov    %r8,%rsi
   140138980:	jmp    140131325 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd45>
   140138985:	mov    %r14,%rdx
   140138988:	mov    %rdi,%rcx
   14013898b:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   140138990:	jmp    1401320f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb16>
   140138995:	mov    0x1050(%rbx),%rax
   14013899c:	mov    %rsi,%rbp
   14013899f:	sub    %rdx,%rbp
   1401389a2:	mov    %rax,0x30(%rsp)
   1401389a7:	sub    %rdx,%rax
   1401389aa:	sar    $0x3,%rax
   1401389ae:	lea    (%rax,%rax,1),%rcx
   1401389b2:	cmp    %rcx,%rax
   1401389b5:	jae    1401367bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131dd>
   1401389bb:	mov    %rcx,%rdx
   1401389be:	lea    0x1048(%rbx),%rcx
   1401389c5:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401389ca:	mov    0x1048(%rbx),%rdx
   1401389d1:	mov    0x1050(%rbx),%rax
   1401389d8:	lea    (%rdx,%rbp,1),%rsi
   1401389dc:	mov    %rax,0x30(%rsp)
   1401389e1:	lea    0x8(%rsi),%r8
   1401389e5:	jmp    1401367bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131dd>
   1401389ea:	mov    %r9,%rdx
   1401389ed:	lea    0x1048(%rbx),%rcx
   1401389f4:	vzeroupper
   1401389f7:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401389fc:	mov    0x1048(%rbx),%rdx
   140138a03:	mov    0x1050(%rbx),%rax
   140138a0a:	lea    (%rdx,%r12,1),%rsi
   140138a0e:	lea    0x8(%rsi),%r8
   140138a12:	jmp    14012e63e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb05e>
   140138a17:	mov    0x1068(%rbx),%rax
   140138a1e:	cmp    $0x2,%r12b
   140138a22:	je     1401394b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15ed9>
   140138a28:	cmp    $0x1,%r12b
   140138a2c:	je     14013949c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15ebc>
   140138a32:	mov    -0x8(%rsi),%rdx
   140138a36:	sub    $0x10,%rsi
   140138a3a:	mov    %rdx,0x8(%rax,%r13,8)
   140138a3f:	mov    (%rsi),%rdx
   140138a42:	mov    %rdx,(%rax,%r13,8)
   140138a46:	mov    0x1048(%rbx),%rdx
   140138a4d:	jmp    14012fe96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8b6>
   140138a52:	mov    0x1c8(%rsp),%rdx
   140138a5a:	mov    %rdx,(%rax,%r13,8)
   140138a5e:	mov    0x1048(%rbx),%rdx
   140138a65:	xor    %r12d,%r12d
   140138a68:	jmp    14012fe96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8b6>
   140138a6d:	shl    $0x10,%rax
   140138a71:	mov    %rax,%rdx
   140138a74:	sar    $0x10,%rdx
   140138a78:	cmp    $0xff0000,%rax
   140138a7e:	ja     14012fc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc680>
   140138a84:	mov    0x38(%rdi),%rax
   140138a88:	mov    %dl,(%rax,%r14,1)
   140138a8c:	cmpb   $0x0,0x1040(%rbx)
   140138a93:	je     1401302d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccf9>
   140138a99:	movzbl 0x0(%rbp),%eax
   140138a9d:	lea    0x29a5fc(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140138aa4:	add    $0x1,%rbp
   140138aa8:	mov    (%rdi,%rax,8),%rax
   140138aac:	jmp    *%rax
   140138aae:	mov    0x1c8(%rsp),%rax
   140138ab6:	lea    0x310(%rsp),%rdx
   140138abe:	lea    0x680(%rsp),%rcx
   140138ac6:	mov    %rax,0x1d0(%rsp)
   140138ace:	call   14022bbd0 <setun::VMValue::to_string[abi:cxx11]() const>
   140138ad3:	mov    %rdi,%rcx
   140138ad6:	lea    0x680(%rsp),%rdx
   140138ade:	call   14022cb40 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140138ae3:	mov    0x680(%rsp),%rcx
   140138aeb:	mov    %rax,0x1c8(%rsp)
   140138af3:	lea    0x690(%rsp),%rax
   140138afb:	cmp    %rax,%rcx
   140138afe:	je     14012fa09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc429>
   140138b04:	mov    0x690(%rsp),%rax
   140138b0c:	lea    0x1(%rax),%rdx
   140138b10:	call   14034a160 <operator delete(void*, unsigned long long)>
   140138b15:	jmp    14012fa09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc429>
   140138b1a:	sub    $0x1,%r12b
   140138b1e:	je     140139847 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16267>
   140138b24:	lea    0x8(%rsi),%r8
   140138b28:	cmp    0x30(%rsp),%r8
   140138b2d:	jae    1401397f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16212>
   140138b33:	mov    0x1d0(%rsp),%rax
   140138b3b:	mov    %rax,(%rsi)
   140138b3e:	mov    0x1c8(%rsp),%rax
   140138b46:	mov    %r8,%rsi
   140138b49:	mov    %rax,0x1d0(%rsp)
   140138b51:	mov    $0x1fff,%eax
   140138b56:	shl    $0x33,%rax
   140138b5a:	mov    %rax,0x1c8(%rsp)
   140138b62:	jmp    1401363e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e04>
   140138b67:	mov    0x1050(%rbx),%rax
   140138b6e:	mov    0x1048(%rbx),%rcx
   140138b75:	mov    %rax,0x30(%rsp)
   140138b7a:	sub    %rcx,%rax
   140138b7d:	sar    $0x3,%rax
   140138b81:	lea    (%rax,%rax,1),%rdx
   140138b85:	cmp    %rdx,%rax
   140138b88:	jae    140132178 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb98>
   140138b8e:	sub    %rcx,%rsi
   140138b91:	lea    0x1048(%rbx),%rcx
   140138b98:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138b9d:	mov    0x1050(%rbx),%rax
   140138ba4:	add    0x1048(%rbx),%rsi
   140138bab:	mov    %rax,0x30(%rsp)
   140138bb0:	jmp    140132178 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb98>
   140138bb5:	test   %rcx,%rcx
   140138bb8:	je     140138bbf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155df>
   140138bba:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138bbf:	mov    0x150c0(%rbx),%rax
   140138bc6:	test   %rax,%rax
   140138bc9:	je     140138c6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1568d>
   140138bcf:	imul   $0x28,%rax,%rdx
   140138bd3:	sub    $0x1,%rax
   140138bd7:	add    %rbx,%rdx
   140138bda:	mov    0x1098(%rdx),%rbp
   140138be1:	mov    0x10a0(%rdx),%rcx
   140138be8:	mov    0x10a8(%rdx),%rsi
   140138bef:	mov    %rax,0x150c0(%rbx)
   140138bf6:	cmpb   $0x0,0x15211(%rbx)
   140138bfd:	je     140138c5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1567c>
   140138bff:	mov    %rcx,0x15268(%rbx)
   140138c06:	mov    0x1048(%rbx),%rdx
   140138c0d:	mov    0x150c0(%rbx),%r13
   140138c14:	lea    (%rdx,%rsi,8),%rax
   140138c18:	mov    %r14,(%rax)
   140138c1b:	lea    0x8(%rax),%rsi
   140138c1f:	test   %r13,%r13
   140138c22:	je     140138c34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15654>
   140138c24:	lea    -0x1(%r13),%rax
   140138c28:	imul   $0x28,%rax,%rax
   140138c2c:	mov    0x10c8(%rbx,%rax,1),%r13
   140138c34:	mov    0x38(%rsp),%rax
   140138c39:	lea    (%rax,%rbp,1),%r14
   140138c3d:	cmpb   $0x0,0x1040(%rbx)
   140138c44:	je     14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   140138c4a:	movzbl (%r14),%eax
   140138c4e:	lea    0x29a44b(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140138c55:	lea    0x1(%r14),%rbp
   140138c59:	jmp    *(%rdi,%rax,8)
   140138c5c:	mov    %rcx,%rdx
   140138c5f:	lea    0x1068(%rbx),%rcx
   140138c66:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138c6b:	jmp    140138c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15626>
   140138c6d:	mov    %r14,(%rsi)
   140138c70:	mov    0x1048(%rbx),%rdx
   140138c77:	add    $0x8,%rsi
   140138c7b:	mov    %rbp,%r14
   140138c7e:	movb   $0x0,0x1040(%rbx)
   140138c85:	jmp    14012551f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f3f>
   140138c8a:	mov    %rax,%rcx
   140138c8d:	sub    %rdx,%rcx
   140138c90:	sar    $0x3,%rcx
   140138c94:	lea    (%rcx,%rcx,1),%r9
   140138c98:	cmp    %r9,%rcx
   140138c9b:	jae    140132268 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec88>
   140138ca1:	sub    %rdx,%rsi
   140138ca4:	lea    0x1048(%rbx),%rcx
   140138cab:	mov    %r9,%rdx
   140138cae:	vzeroupper
   140138cb1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138cb6:	mov    0x1048(%rbx),%rdx
   140138cbd:	mov    0x1050(%rbx),%rax
   140138cc4:	add    %rdx,%rsi
   140138cc7:	lea    0x8(%rsi),%r8
   140138ccb:	jmp    14013226b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec8b>
   140138cd0:	mov    0x410(%rsp),%edi
   140138cd7:	test   %r12b,%r12b
   140138cda:	je     140138e03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15823>
   140138ce0:	sub    $0x1,%r12b
   140138ce4:	je     140138dce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x157ee>
   140138cea:	lea    0x8(%rsi),%r8
   140138cee:	cmp    0x30(%rsp),%r8
   140138cf3:	jae    140138d79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15799>
   140138cf9:	mov    0x1d0(%rsp),%rax
   140138d01:	mov    %r8,0x40(%rsp)
   140138d06:	movslq %edi,%rdx
   140138d09:	lea    0x680(%rsp),%rcx
   140138d11:	mov    %rax,(%rsi)
   140138d14:	mov    0x1c8(%rsp),%rax
   140138d1c:	mov    %rax,0x1d0(%rsp)
   140138d24:	jmp    140135a62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12482>
   140138d29:	mov    0x408(%rsp),%rdi
   140138d31:	test   %r12b,%r12b
   140138d34:	je     140138e28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15848>
   140138d3a:	sub    $0x1,%r12b
   140138d3e:	jne    140135a28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12448>
   140138d44:	mov    0x1c8(%rsp),%rax
   140138d4c:	lea    0x680(%rsp),%rcx
   140138d54:	mov    %rdi,%rdx
   140138d57:	mov    %rax,0x1d0(%rsp)
   140138d5f:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138d64:	mov    0x680(%rsp),%rax
   140138d6c:	mov    %rax,0x1c8(%rsp)
   140138d74:	jmp    1401363e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e04>
   140138d79:	mov    0x1050(%rbx),%rax
   140138d80:	mov    0x1048(%rbx),%rdx
   140138d87:	mov    %rax,0x30(%rsp)
   140138d8c:	sub    %rdx,%rax
   140138d8f:	sar    $0x3,%rax
   140138d93:	lea    (%rax,%rax,1),%rcx
   140138d97:	cmp    %rcx,%rax
   140138d9a:	jae    140138cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15719>
   140138da0:	sub    %rdx,%rsi
   140138da3:	mov    %rcx,%rdx
   140138da6:	lea    0x1048(%rbx),%rcx
   140138dad:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138db2:	mov    0x1050(%rbx),%rax
   140138db9:	add    0x1048(%rbx),%rsi
   140138dc0:	lea    0x8(%rsi),%r8
   140138dc4:	mov    %rax,0x30(%rsp)
   140138dc9:	jmp    140138cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15719>
   140138dce:	mov    0x1c8(%rsp),%rax
   140138dd6:	movslq %edi,%rdx
   140138dd9:	lea    0x680(%rsp),%rcx
   140138de1:	mov    %rax,0x1d0(%rsp)
   140138de9:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138dee:	mov    0x680(%rsp),%rax
   140138df6:	mov    %rax,0x1c8(%rsp)
   140138dfe:	jmp    1401363e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e04>
   140138e03:	movslq %edi,%rdx
   140138e06:	lea    0x680(%rsp),%rcx
   140138e0e:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138e13:	mov    0x680(%rsp),%rax
   140138e1b:	mov    %rax,0x1c8(%rsp)
   140138e23:	jmp    14013234b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6b>
   140138e28:	lea    0x680(%rsp),%rcx
   140138e30:	mov    %rdi,%rdx
   140138e33:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138e38:	mov    0x680(%rsp),%rax
   140138e40:	mov    %rax,0x1c8(%rsp)
   140138e48:	jmp    14013234b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6b>
   140138e4d:	mov    %r9,%rdx
   140138e50:	lea    0x1048(%rbx),%rcx
   140138e57:	vzeroupper
   140138e5a:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138e5f:	mov    0x1048(%rbx),%rdx
   140138e66:	mov    0x1050(%rbx),%rax
   140138e6d:	lea    (%rdx,%r12,1),%rsi
   140138e71:	lea    0x8(%rsi),%r8
   140138e75:	jmp    14012eb43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb563>
   140138e7a:	mov    0x1048(%rbx),%rdx
   140138e81:	mov    0x1050(%rbx),%rax
   140138e88:	mov    %rsi,%rcx
   140138e8b:	vzeroupper
   140138e8e:	jmp    140129a47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6467>
   140138e93:	mov    %r9,%rdx
   140138e96:	lea    0x1048(%rbx),%rcx
   140138e9d:	vzeroupper
   140138ea0:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138ea5:	mov    0x1048(%rbx),%rdx
   140138eac:	mov    0x1050(%rbx),%rax
   140138eb3:	lea    (%rdx,%r12,1),%rsi
   140138eb7:	lea    0x8(%rsi),%r8
   140138ebb:	jmp    14012e60e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb02e>
   140138ec0:	mov    0x1048(%rbx),%rdx
   140138ec7:	mov    0x1050(%rbx),%r11
   140138ece:	mov    %rsi,%r12
   140138ed1:	mov    %r11,0x30(%rsp)
   140138ed6:	sub    %rdx,%r11
   140138ed9:	sub    %rdx,%r12
   140138edc:	mov    %r11,%rdx
   140138edf:	sar    $0x3,%rdx
   140138ee3:	lea    (%rdx,%rdx,1),%r8
   140138ee7:	cmp    %r8,%rdx
   140138eea:	jae    140130420 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce40>
   140138ef0:	mov    %eax,0x60(%rsp)
   140138ef4:	lea    0x1048(%rbx),%rcx
   140138efb:	mov    %r8,%rdx
   140138efe:	mov    %r9d,0x40(%rsp)
   140138f03:	vzeroupper
   140138f06:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138f0b:	mov    0x1048(%rbx),%rsi
   140138f12:	mov    0x1050(%rbx),%rax
   140138f19:	mov    0x40(%rsp),%r9d
   140138f1e:	add    %r12,%rsi
   140138f21:	mov    %rax,0x30(%rsp)
   140138f26:	mov    0x60(%rsp),%eax
   140138f2a:	lea    0x10(%rsi),%rcx
   140138f2e:	jmp    140130420 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce40>
   140138f33:	mov    0x1048(%rbx),%rdx
   140138f3a:	lea    0x8(%rsi),%r8
   140138f3e:	cmp    0x30(%rsp),%r8
   140138f43:	jae    140138fe0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15a00>
   140138f49:	mov    0x1050(%rbx),%rax
   140138f50:	vzeroupper
   140138f53:	mov    0x1c8(%rsp),%rcx
   140138f5b:	mov    %rcx,(%rsi)
   140138f5e:	mov    %r8,%rsi
   140138f61:	jmp    14012a598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fb8>
   140138f66:	mov    0x1048(%rbx),%rdx
   140138f6d:	lea    0x10(%rsi),%rcx
   140138f71:	cmp    0x30(%rsp),%rcx
   140138f76:	jae    14013908c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15aac>
   140138f7c:	mov    0x1050(%rbx),%rax
   140138f83:	vzeroupper
   140138f86:	mov    0x1d0(%rsp),%r8
   140138f8e:	mov    %r8,(%rsi)
   140138f91:	mov    0x1c8(%rsp),%r8
   140138f99:	mov    %r8,0x8(%rsi)
   140138f9d:	mov    %rcx,%rsi
   140138fa0:	jmp    14012a598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fb8>
   140138fa5:	mov    0x1c8(%rsp),%rax
   140138fad:	mov    %rdi,%rdx
   140138fb0:	lea    0x680(%rsp),%rcx
   140138fb8:	mov    $0x2,%r12d
   140138fbe:	mov    %rax,0x1d0(%rsp)
   140138fc6:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140138fcb:	mov    0x680(%rsp),%rax
   140138fd3:	mov    %rax,0x1c8(%rsp)
   140138fdb:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   140138fe0:	mov    0x1050(%rbx),%rax
   140138fe7:	mov    %rsi,%rbp
   140138fea:	sub    %rdx,%rbp
   140138fed:	mov    %rax,%rcx
   140138ff0:	sub    %rdx,%rcx
   140138ff3:	sar    $0x3,%rcx
   140138ff7:	lea    (%rcx,%rcx,1),%r9
   140138ffb:	cmp    %r9,%rcx
   140138ffe:	jb     1401390e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15b01>
   140139004:	vzeroupper
   140139007:	jmp    140138f53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15973>
   14013900c:	mov    0x1050(%rbx),%rax
   140139013:	mov    0x1048(%rbx),%rdx
   14013901a:	mov    %rax,0x30(%rsp)
   14013901f:	sub    %rdx,%rax
   140139022:	sar    $0x3,%rax
   140139026:	lea    (%rax,%rax,1),%rcx
   14013902a:	cmp    %rcx,%rax
   14013902d:	jae    140135a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12457>
   140139033:	sub    %rdx,%rsi
   140139036:	mov    %rcx,%rdx
   140139039:	lea    0x1048(%rbx),%rcx
   140139040:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139045:	mov    0x1050(%rbx),%rax
   14013904c:	add    0x1048(%rbx),%rsi
   140139053:	lea    0x8(%rsi),%r8
   140139057:	mov    %rax,0x30(%rsp)
   14013905c:	jmp    140135a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12457>
   140139061:	lea    0x680(%rsp),%rcx
   140139069:	mov    %rdi,%rdx
   14013906c:	mov    $0x1,%r12d
   140139072:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   140139077:	mov    0x680(%rsp),%rax
   14013907f:	mov    %rax,0x1c8(%rsp)
   140139087:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   14013908c:	mov    0x1050(%rbx),%rax
   140139093:	mov    %rsi,%rbp
   140139096:	sub    %rdx,%rbp
   140139099:	mov    %rax,%r8
   14013909c:	sub    %rdx,%r8
   14013909f:	sar    $0x3,%r8
   1401390a3:	lea    (%r8,%r8,1),%r9
   1401390a7:	cmp    %r9,%r8
   1401390aa:	jb     14013910e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15b2e>
   1401390ac:	vzeroupper
   1401390af:	jmp    140138f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159a6>
   1401390b4:	mov    %r9,%rdx
   1401390b7:	lea    0x1048(%rbx),%rcx
   1401390be:	vzeroupper
   1401390c1:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401390c6:	mov    0x1048(%rbx),%rdx
   1401390cd:	mov    0x1050(%rbx),%rax
   1401390d4:	lea    (%rdx,%r12,1),%rsi
   1401390d8:	lea    0x8(%rsi),%r8
   1401390dc:	jmp    14012e78e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1ae>
   1401390e1:	mov    %r9,%rdx
   1401390e4:	lea    0x1048(%rbx),%rcx
   1401390eb:	vzeroupper
   1401390ee:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401390f3:	mov    0x1048(%rbx),%rdx
   1401390fa:	mov    0x1050(%rbx),%rax
   140139101:	lea    (%rdx,%rbp,1),%rsi
   140139105:	lea    0x8(%rsi),%r8
   140139109:	jmp    140138f53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15973>
   14013910e:	lea    0x1048(%rbx),%rcx
   140139115:	mov    %r9,%rdx
   140139118:	vzeroupper
   14013911b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139120:	mov    0x1048(%rbx),%rdx
   140139127:	mov    0x1050(%rbx),%rax
   14013912e:	lea    (%rdx,%rbp,1),%rsi
   140139132:	lea    0x10(%rsi),%rcx
   140139136:	jmp    140138f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159a6>
   14013913b:	mov    %r9,%rdx
   14013913e:	lea    0x1048(%rbx),%rcx
   140139145:	vzeroupper
   140139148:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013914d:	mov    0x1048(%rbx),%rdx
   140139154:	mov    0x1050(%rbx),%rax
   14013915b:	lea    (%rdx,%r12,1),%rsi
   14013915f:	lea    0x8(%rsi),%r8
   140139163:	jmp    14012ed20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb740>
   140139168:	mov    %r9,%rdx
   14013916b:	lea    0x1048(%rbx),%rcx
   140139172:	vzeroupper
   140139175:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013917a:	mov    0x1048(%rbx),%rdx
   140139181:	mov    0x1050(%rbx),%rax
   140139188:	lea    (%rdx,%r12,1),%rsi
   14013918c:	lea    0x8(%rsi),%r8
   140139190:	jmp    14012eba3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5c3>
   140139195:	mov    0x1050(%rbx),%rax
   14013919c:	mov    0x1048(%rbx),%rcx
   1401391a3:	mov    %rax,0x30(%rsp)
   1401391a8:	sub    %rcx,%rax
   1401391ab:	sar    $0x3,%rax
   1401391af:	lea    (%rax,%rax,1),%rdx
   1401391b3:	cmp    %rdx,%rax
   1401391b6:	jae    140131aa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4c4>
   1401391bc:	sub    %rcx,%rsi
   1401391bf:	lea    0x1048(%rbx),%rcx
   1401391c6:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401391cb:	mov    0x1050(%rbx),%rax
   1401391d2:	add    0x1048(%rbx),%rsi
   1401391d9:	lea    0x8(%rsi),%r8
   1401391dd:	mov    %rax,0x30(%rsp)
   1401391e2:	jmp    140131aa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4c4>
   1401391e7:	mov    %r9,%rdx
   1401391ea:	lea    0x1048(%rbx),%rcx
   1401391f1:	vzeroupper
   1401391f4:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401391f9:	mov    0x1048(%rbx),%rdx
   140139200:	mov    0x1050(%rbx),%rax
   140139207:	lea    (%rdx,%r12,1),%rsi
   14013920b:	lea    0x8(%rsi),%r8
   14013920f:	jmp    14012ecf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb710>
   140139214:	mov    0x1048(%rbx),%rdx
   14013921b:	mov    0x1050(%rbx),%rax
   140139222:	mov    %rsi,%rcx
   140139225:	vzeroupper
   140139228:	jmp    140128d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5720>
   14013922d:	mov    0x1050(%rbx),%rax
   140139234:	mov    0x1048(%rbx),%rcx
   14013923b:	mov    %rax,0x30(%rsp)
   140139240:	sub    %rcx,%rax
   140139243:	sar    $0x3,%rax
   140139247:	lea    (%rax,%rax,1),%rdx
   14013924b:	cmp    %rdx,%rax
   14013924e:	jae    1401366ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1310f>
   140139254:	sub    %rcx,%rsi
   140139257:	lea    0x1048(%rbx),%rcx
   14013925e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139263:	mov    0x1050(%rbx),%rax
   14013926a:	add    0x1048(%rbx),%rsi
   140139271:	lea    0x8(%rsi),%r8
   140139275:	mov    %rax,0x30(%rsp)
   14013927a:	jmp    1401366ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1310f>
   14013927f:	mov    0x1c8(%rsp),%rax
   140139287:	movslq %edi,%rdx
   14013928a:	lea    0x540(%rsp),%rcx
   140139292:	mov    %rax,0x1d0(%rsp)
   14013929a:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   14013929f:	mov    0x540(%rsp),%rax
   1401392a7:	mov    %rax,0x1c8(%rsp)
   1401392af:	jmp    14012e5b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafd5>
   1401392b4:	movslq %edi,%rdx
   1401392b7:	lea    0x540(%rsp),%rcx
   1401392bf:	call   14021ea20 <setun::VMValue::VMValue(long long)>
   1401392c4:	mov    0x540(%rsp),%rax
   1401392cc:	mov    %rax,0x1c8(%rsp)
   1401392d4:	jmp    140135016 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a36>
   1401392d9:	sub    $0x1,%r12b
   1401392dd:	je     14013969f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x160bf>
   1401392e3:	lea    0x8(%rsi),%r8
   1401392e7:	cmp    0x30(%rsp),%r8
   1401392ec:	jae    14013964a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1606a>
   1401392f2:	mov    0x1d0(%rsp),%rax
   1401392fa:	mov    $0x2,%r12d
   140139300:	mov    %rax,(%rsi)
   140139303:	mov    0x1c8(%rsp),%rax
   14013930b:	mov    %r8,%rsi
   14013930e:	mov    %rax,0x1d0(%rsp)
   140139316:	mov    0x8(%rdi),%rax
   14013931a:	mov    (%rax,%r14,8),%rax
   14013931e:	mov    %rax,0x1c8(%rsp)
   140139326:	jmp    140135179 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b99>
   14013932b:	mov    0x1050(%rbx),%rax
   140139332:	mov    0x1048(%rbx),%rdx
   140139339:	mov    %rax,0x30(%rsp)
   14013933e:	sub    %rdx,%rax
   140139341:	sar    $0x3,%rax
   140139345:	lea    (%rax,%rax,1),%rcx
   140139349:	cmp    %rcx,%rax
   14013934c:	jae    140135259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c79>
   140139352:	sub    %rdx,%rsi
   140139355:	mov    %rcx,%rdx
   140139358:	lea    0x1048(%rbx),%rcx
   14013935f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139364:	mov    0x1050(%rbx),%rax
   14013936b:	add    0x1048(%rbx),%rsi
   140139372:	lea    0x8(%rsi),%r8
   140139376:	mov    %rax,0x30(%rsp)
   14013937b:	jmp    140135259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c79>
   140139380:	mov    0x1050(%rbx),%rax
   140139387:	mov    %rax,0x30(%rsp)
   14013938c:	sub    %rdx,%rax
   14013938f:	sar    $0x3,%rax
   140139393:	lea    (%rax,%rax,1),%r8
   140139397:	cmp    %r8,%rax
   14013939a:	jae    140132055 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea75>
   1401393a0:	sub    %rdx,%rsi
   1401393a3:	lea    0x1048(%rbx),%rcx
   1401393aa:	mov    %r8,%rdx
   1401393ad:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401393b2:	mov    0x1048(%rbx),%rdx
   1401393b9:	mov    0x1050(%rbx),%rax
   1401393c0:	add    %rdx,%rsi
   1401393c3:	mov    %rax,0x30(%rsp)
   1401393c8:	lea    0x10(%rsi),%rcx
   1401393cc:	jmp    140132055 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea75>
   1401393d1:	sub    $0x1,%r12b
   1401393d5:	je     14013268a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0aa>
   1401393db:	mov    0x1048(%rbx),%rdx
   1401393e2:	mov    0x1068(%rbx),%r8
   1401393e9:	jmp    140124814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1234>
   1401393ee:	mov    %r9,%rdx
   1401393f1:	lea    0x1048(%rbx),%rcx
   1401393f8:	vzeroupper
   1401393fb:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139400:	mov    0x1048(%rbx),%rdx
   140139407:	mov    0x1050(%rbx),%rax
   14013940e:	lea    (%rdx,%r12,1),%rsi
   140139412:	lea    0x8(%rsi),%r8
   140139416:	jmp    14012e69e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0be>
   14013941b:	mov    0x1050(%rbx),%rax
   140139422:	mov    0x1048(%rbx),%rdx
   140139429:	mov    %rax,0x30(%rsp)
   14013942e:	sub    %rdx,%rax
   140139431:	sar    $0x3,%rax
   140139435:	lea    (%rax,%rax,1),%rcx
   140139439:	cmp    %rcx,%rax
   14013943c:	jae    140135076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a96>
   140139442:	sub    %rdx,%r14
   140139445:	mov    %rcx,%rdx
   140139448:	lea    0x1048(%rbx),%rcx
   14013944f:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139454:	mov    0x1050(%rbx),%rax
   14013945b:	add    0x1048(%rbx),%r14
   140139462:	lea    0x8(%r14),%r12
   140139466:	mov    %rax,0x30(%rsp)
   14013946b:	jmp    140135076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a96>
   140139470:	mov    0x1c8(%rsp),%rax
   140139478:	mov    $0x2,%r12d
   14013947e:	mov    %rax,0x1d0(%rsp)
   140139486:	mov    $0x1fff,%eax
   14013948b:	shl    $0x33,%rax
   14013948f:	mov    %rax,0x1c8(%rsp)
   140139497:	jmp    14013264f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf06f>
   14013949c:	mov    0x1c8(%rsp),%rdx
   1401394a4:	sub    $0x8,%rsi
   1401394a8:	mov    %rdx,0x8(%rax,%r13,8)
   1401394ad:	mov    (%rsi),%rdx
   1401394b0:	mov    %rdx,(%rax,%r13,8)
   1401394b4:	jmp    140138a5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1547e>
   1401394b9:	mov    0x1d0(%rsp),%rdx
   1401394c1:	mov    %rdx,(%rax,%r13,8)
   1401394c5:	mov    0x1c8(%rsp),%rdx
   1401394cd:	mov    %rdx,0x8(%rax,%r13,8)
   1401394d2:	jmp    140138a5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1547e>
   1401394d7:	mov    0x1050(%rbx),%rax
   1401394de:	mov    0x1048(%rbx),%rdx
   1401394e5:	mov    %rax,0x30(%rsp)
   1401394ea:	sub    %rdx,%rax
   1401394ed:	sar    $0x3,%rax
   1401394f1:	lea    (%rax,%rax,1),%rcx
   1401394f5:	cmp    %rcx,%rax
   1401394f8:	jae    14012f9d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3f9>
   1401394fe:	sub    %rdx,%rsi
   140139501:	mov    %rcx,%rdx
   140139504:	lea    0x1048(%rbx),%rcx
   14013950b:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139510:	jmp    1401346e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11107>
   140139515:	mov    $0xfffb,%eax
   14013951a:	mov    $0xffff,%edx
   14013951f:	mov    $0xfffd,%ecx
   140139524:	sub    $0x8,%rsi
   140139528:	shl    $0x30,%rax
   14013952c:	shl    $0x30,%rdx
   140139530:	mov    %rax,0x3e0(%rsp)
   140139538:	mov    (%rsi),%rax
   14013953b:	shl    $0x30,%rcx
   14013953f:	and    %rax,%rdx
   140139542:	mov    %rax,0x3e0(%rsp)
   14013954a:	cmp    %rcx,%rdx
   14013954d:	jne    14012f4c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbee3>
   140139553:	jmp    14012e3dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadfc>
   140139558:	vzeroupper
   14013955b:	jmp    1401353b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11dd1>
   140139560:	mov    0xa0(%rsp),%rcx
   140139568:	call   140152c50 <setun::ArrayObject::size() const>
   14013956d:	add    %rax,0x40(%rsp)
   140139572:	test   %rdi,%rdi
   140139575:	jns    140139587 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15fa7>
   140139577:	mov    0xc0(%rsp),%rcx
   14013957f:	call   140152c50 <setun::ArrayObject::size() const>
   140139584:	add    %rax,%rdi
   140139587:	cmpq   $0x0,0x40(%rsp)
   14013958d:	js     140127a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4463>
   140139593:	jmp    140135424 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e44>
   140139598:	mov    0x1c8(%rsp),%rax
   1401395a0:	lea    0x1a0(%rsp),%rdx
   1401395a8:	lea    0x680(%rsp),%rcx
   1401395b0:	mov    $0x2,%r12d
   1401395b6:	mov    %rax,0x1d0(%rsp)
   1401395be:	imul   $0x18,%r14,%rax
   1401395c2:	add    0x68(%rdi),%rax
   1401395c6:	vmovdqu (%rax),%xmm7
   1401395ca:	vmovdqa %xmm7,0x1a0(%rsp)
   1401395d3:	mov    0x10(%rax),%rax
   1401395d7:	mov    %rax,0x1b0(%rsp)
   1401395df:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401395e4:	mov    0x680(%rsp),%rax
   1401395ec:	mov    %rax,0x1c8(%rsp)
   1401395f4:	jmp    1401352ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cea>
   1401395f9:	imul   $0x18,%r14,%rax
   1401395fd:	add    0x68(%rdi),%rax
   140139601:	lea    0x1a0(%rsp),%rdx
   140139609:	mov    $0x1,%r12d
   14013960f:	vmovdqu (%rax),%xmm7
   140139613:	lea    0x680(%rsp),%rcx
   14013961b:	vmovdqa %xmm7,0x1a0(%rsp)
   140139624:	mov    0x10(%rax),%rax
   140139628:	mov    %rax,0x1b0(%rsp)
   140139630:	call   14021cec0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140139635:	mov    0x680(%rsp),%rax
   14013963d:	mov    %rax,0x1c8(%rsp)
   140139645:	jmp    1401352ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cea>
   14013964a:	mov    0x1050(%rbx),%rax
   140139651:	mov    0x1048(%rbx),%rdx
   140139658:	mov    %rax,0x30(%rsp)
   14013965d:	sub    %rdx,%rax
   140139660:	sar    $0x3,%rax
   140139664:	lea    (%rax,%rax,1),%rcx
   140139668:	cmp    %rcx,%rax
   14013966b:	jae    1401392f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15d12>
   140139671:	sub    %rdx,%rsi
   140139674:	mov    %rcx,%rdx
   140139677:	lea    0x1048(%rbx),%rcx
   14013967e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139683:	mov    0x1050(%rbx),%rax
   14013968a:	add    0x1048(%rbx),%rsi
   140139691:	lea    0x8(%rsi),%r8
   140139695:	mov    %rax,0x30(%rsp)
   14013969a:	jmp    1401392f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15d12>
   14013969f:	mov    0x1c8(%rsp),%rax
   1401396a7:	mov    $0x2,%r12d
   1401396ad:	mov    %rax,0x1d0(%rsp)
   1401396b5:	mov    0x8(%rdi),%rax
   1401396b9:	mov    (%rax,%r14,8),%rax
   1401396bd:	mov    %rax,0x1c8(%rsp)
   1401396c5:	jmp    140135179 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b99>
   1401396ca:	lea    0x0(%rbp,%rbp,1),%rdx
   1401396cf:	lea    0x1048(%rbx),%rcx
   1401396d6:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401396db:	jmp    1401348b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112d9>
   1401396e0:	mov    0x1050(%rbx),%rcx
   1401396e7:	mov    0x1048(%rbx),%rax
   1401396ee:	mov    %rcx,0x30(%rsp)
   1401396f3:	sub    %rax,%rcx
   1401396f6:	sar    $0x3,%rcx
   1401396fa:	lea    (%rcx,%rcx,1),%rdx
   1401396fe:	cmp    %rdx,%rcx
   140139701:	jae    140134af8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11518>
   140139707:	lea    0x1048(%rbx),%rcx
   14013970e:	sub    %rax,%rsi
   140139711:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139716:	mov    0x1050(%rbx),%rax
   14013971d:	add    0x1048(%rbx),%rsi
   140139724:	lea    0x8(%rsi),%r8
   140139728:	mov    %rax,0x30(%rsp)
   14013972d:	jmp    140134af8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11518>
   140139732:	mov    0x1c8(%rsp),%rax
   14013973a:	mov    %r14,%rdx
   14013973d:	mov    %rdi,%rcx
   140139740:	mov    %rax,0x1d0(%rsp)
   140139748:	call   140153f20 <setun::ArrayObject::get(unsigned long long) const>
   14013974d:	jmp    140134d02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11722>
   140139752:	mov    %rax,%r8
   140139755:	mov    %rax,0x30(%rsp)
   14013975a:	sub    %rdx,%r8
   14013975d:	sar    $0x3,%r8
   140139761:	lea    (%r8,%r8,1),%r9
   140139765:	cmp    %r9,%r8
   140139768:	jae    140134ca6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116c6>
   14013976e:	sub    %rdx,%rsi
   140139771:	lea    0x1048(%rbx),%rcx
   140139778:	mov    %r9,%rdx
   14013977b:	vzeroupper
   14013977e:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139783:	mov    0x1048(%rbx),%rdx
   14013978a:	mov    0x1050(%rbx),%rax
   140139791:	add    %rdx,%rsi
   140139794:	mov    %rax,0x30(%rsp)
   140139799:	lea    0x10(%rsi),%rcx
   14013979d:	jmp    140134ca6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116c6>
   1401397a2:	mov    %rax,%rcx
   1401397a5:	mov    %rax,0x30(%rsp)
   1401397aa:	sub    %rdx,%rcx
   1401397ad:	sar    $0x3,%rcx
   1401397b1:	lea    (%rcx,%rcx,1),%r9
   1401397b5:	cmp    %r9,%rcx
   1401397b8:	jae    140138972 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15392>
   1401397be:	sub    %rdx,%rsi
   1401397c1:	lea    0x1048(%rbx),%rcx
   1401397c8:	mov    %r9,%rdx
   1401397cb:	vzeroupper
   1401397ce:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401397d3:	mov    0x1048(%rbx),%rdx
   1401397da:	mov    0x1050(%rbx),%rax
   1401397e1:	add    %rdx,%rsi
   1401397e4:	mov    %rax,0x30(%rsp)
   1401397e9:	lea    0x8(%rsi),%r8
   1401397ed:	jmp    140138972 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15392>
   1401397f2:	mov    0x1050(%rbx),%rax
   1401397f9:	mov    0x1048(%rbx),%rdx
   140139800:	mov    %rax,0x30(%rsp)
   140139805:	sub    %rdx,%rax
   140139808:	sar    $0x3,%rax
   14013980c:	lea    (%rax,%rax,1),%rcx
   140139810:	cmp    %rcx,%rax
   140139813:	jae    140138b33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15553>
   140139819:	sub    %rdx,%rsi
   14013981c:	mov    %rcx,%rdx
   14013981f:	lea    0x1048(%rbx),%rcx
   140139826:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013982b:	mov    0x1050(%rbx),%rax
   140139832:	add    0x1048(%rbx),%rsi
   140139839:	lea    0x8(%rsi),%r8
   14013983d:	mov    %rax,0x30(%rsp)
   140139842:	jmp    140138b33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15553>
   140139847:	mov    0x1c8(%rsp),%rax
   14013984f:	mov    $0x2,%r12d
   140139855:	mov    %rax,0x1d0(%rsp)
   14013985d:	mov    $0x1fff,%eax
   140139862:	shl    $0x33,%rax
   140139866:	mov    %rax,0x1c8(%rsp)
   14013986e:	jmp    140131bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe61f>
   140139873:	sub    $0x1,%rdx
   140139877:	mov    %rax,%rcx
   14013987a:	jne    1401398b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162d8>
   14013987c:	vzeroupper
   14013987f:	call   14034a390 <__cxa_begin_catch>
   140139884:	call   14034a500 <__cxa_end_catch>
   140139889:	mov    0x15108(%rbx),%rax
   140139890:	cmp    0x15100(%rbx),%rax
   140139897:	jne    1401398cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ef>
   140139899:	call   14034a960 <__cxa_rethrow>
   14013989e:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   1401398a0:	mov    %rax,%rbx
   1401398a3:	cmpq   $0x0,0x40(%rsp)
   1401398a9:	jne    1401398c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162e0>
   1401398ab:	vzeroupper
   1401398ae:	mov    %rbx,%rcx
   1401398b1:	call   1401fde00 <_Unwind_Resume>
   1401398b6:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   1401398b8:	vzeroupper
   1401398bb:	call   1401fde00 <_Unwind_Resume>
   1401398c0:	mov    0x40(%rsp),%rcx
   1401398c5:	vzeroupper
   1401398c8:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401398cd:	jmp    1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   1401398cf:	mov    -0x20(%rax),%rdi
   1401398d3:	mov    -0x18(%rax),%rcx
   1401398d7:	sub    $0x20,%rax
   1401398db:	mov    0x10(%rax),%rdx
   1401398df:	mov    0x18(%rax),%rsi
   1401398e3:	mov    %rax,0x15108(%rbx)
   1401398ea:	cmp    0x1060(%rbx),%rcx
   1401398f1:	jae    1401398fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1631a>
   1401398f3:	mov    %rcx,0x1060(%rbx)
   1401398fa:	cmpb   $0x0,0x15211(%rbx)
   140139901:	je     1401399b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x163d5>
   140139907:	mov    %rdx,0x15268(%rbx)
   14013990e:	cmp    %rsi,0x150c0(%rbx)
   140139915:	jb     14013992b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1634b>
   140139917:	cmp    $0x800,%rsi
   14013991e:	ja     140139a97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164b7>
   140139924:	mov    %rsi,0x150c0(%rbx)
   14013992b:	mov    %rdi,0x1038(%rbx)
   140139932:	lea    0x2349c6(%rip),%rdx        # 14036e2ff <.rdata+0xc7f>
   140139939:	lea    0x680(%rsp),%rcx
   140139941:	call   14021da00 <setun::VMValue::VMValue(char const*)>
   140139946:	lea    0x680(%rsp),%rdx
   14013994e:	lea    0x1048(%rbx),%rcx
   140139955:	call   14021ce40 <setun::VMStack::push(setun::VMValue const&)>
   14013995a:	mov    0x1060(%rbx),%rax
   140139961:	mov    0x38(%rsp),%r14
   140139966:	mov    0x1048(%rbx),%rdx
   14013996d:	mov    0x150c0(%rbx),%r13
   140139974:	add    0x1038(%rbx),%r14
   14013997b:	lea    (%rdx,%rax,8),%rsi
   14013997f:	mov    0x1050(%rbx),%rax
   140139986:	mov    %rax,0x30(%rsp)
   14013998b:	test   %r13,%r13
   14013998e:	jne    1401399e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16401>
   140139990:	cmpb   $0x0,0x1040(%rbx)
   140139997:	je     14012a20e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c2e>
   14013999d:	movzbl (%r14),%eax
   1401399a1:	lea    0x2996f8(%rip),%rdi        # 1403d30a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401399a8:	lea    0x1(%r14),%rbp
   1401399ac:	xor    %r12d,%r12d
   1401399af:	mov    (%rdi,%rax,8),%rax
   1401399b3:	jmp    *%rax
   1401399b5:	mov    0x1070(%rbx),%rax
   1401399bc:	sub    0x1068(%rbx),%rax
   1401399c3:	sar    $0x3,%rax
   1401399c7:	cmp    %rdx,%rax
   1401399ca:	jb     14013990e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1632e>
   1401399d0:	lea    0x1068(%rbx),%rcx
   1401399d7:	call   1402f9ae0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401399dc:	jmp    14013990e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1632e>
   1401399e1:	lea    -0x1(%r13),%rcx
   1401399e5:	imul   $0x28,%rcx,%rcx
   1401399e9:	mov    0x10c8(%rbx,%rcx,1),%r13
   1401399f1:	jmp    140139990 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x163b0>
   1401399f3:	mov    %rax,%rbx
   1401399f6:	test   %r14,%r14
   1401399f9:	je     1401398ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162cb>
   1401399ff:	mov    %r14,%rcx
   140139a02:	vzeroupper
   140139a05:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139a0a:	jmp    1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139a0f:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a14:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a19:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a1e:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a23:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a28:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a2d:	mov    0x680(%rsp),%rcx
   140139a35:	mov    %rax,%rbx
   140139a38:	cmp    %r12,%rcx
   140139a3b:	jne    140139ccb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x166eb>
   140139a41:	vzeroupper
   140139a44:	jmp    140139aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164c2>
   140139a46:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a4b:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a50:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a55:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a5a:	mov    0x680(%rsp),%rcx
   140139a62:	mov    %rax,%rbx
   140139a65:	lea    0x690(%rsp),%rax
   140139a6d:	cmp    %rax,%rcx
   140139a70:	je     1401398ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162cb>
   140139a76:	mov    0x690(%rsp),%rax
   140139a7e:	lea    0x1(%rax),%rdx
   140139a82:	vzeroupper
   140139a85:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139a8a:	jmp    1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139a8f:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139a94:	vzeroupper
   140139a97:	call   140350630 <setun::FixedFrameArena::handle_overflow() const [clone .isra.0]>
   140139a9c:	mov    %rax,%rbx
   140139a9f:	vzeroupper
   140139aa2:	mov    0x540(%rsp),%rcx
   140139aaa:	lea    0x550(%rsp),%rax
   140139ab2:	cmp    %rax,%rcx
   140139ab5:	je     1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139abb:	mov    0x550(%rsp),%rax
   140139ac3:	lea    0x1(%rax),%rdx
   140139ac7:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139acc:	jmp    1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139ad1:	mov    0x680(%rsp),%rcx
   140139ad9:	mov    %rax,%rbx
   140139adc:	lea    0x690(%rsp),%rax
   140139ae4:	cmp    %rax,%rcx
   140139ae7:	je     140139b83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x165a3>
   140139aed:	mov    0x690(%rsp),%rax
   140139af5:	lea    0x1(%rax),%rdx
   140139af9:	vzeroupper
   140139afc:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139b01:	mov    0x540(%rsp),%rcx
   140139b09:	lea    0x550(%rsp),%rax
   140139b11:	cmp    %rax,%rcx
   140139b14:	je     140139b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16547>
   140139b16:	mov    0x550(%rsp),%rax
   140139b1e:	lea    0x1(%rax),%rdx
   140139b22:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139b27:	mov    0x520(%rsp),%rcx
   140139b2f:	lea    0x530(%rsp),%rax
   140139b37:	cmp    %rax,%rcx
   140139b3a:	je     140139b4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1656d>
   140139b3c:	mov    0x530(%rsp),%rax
   140139b44:	lea    0x1(%rax),%rdx
   140139b48:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139b4d:	mov    0x500(%rsp),%rcx
   140139b55:	lea    0x510(%rsp),%rax
   140139b5d:	cmp    %rax,%rcx
   140139b60:	je     140139b73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16593>
   140139b62:	mov    0x510(%rsp),%rax
   140139b6a:	lea    0x1(%rax),%rdx
   140139b6e:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139b73:	mov    %rsi,%rcx
   140139b76:	call   14034a5d0 <__cxa_free_exception>
   140139b7b:	mov    %rbx,%rcx
   140139b7e:	call   1401fde00 <_Unwind_Resume>
   140139b83:	vzeroupper
   140139b86:	jmp    140139b01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16521>
   140139b8b:	mov    %rax,%rbx
   140139b8e:	vzeroupper
   140139b91:	mov    %rdi,%rcx
   140139b94:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139b99:	mov    %rbx,%rcx
   140139b9c:	call   1401fde00 <_Unwind_Resume>
   140139ba1:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139ba6:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139bab:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139bb0:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139bb5:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139bba:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139bbf:	jmp    1401398a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162c0>
   140139bc4:	mov    0x688(%rsp),%rcx
   140139bcc:	mov    %rax,%rbx
   140139bcf:	test   %rcx,%rcx
   140139bd2:	je     140139c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1666b>
   140139bd4:	vzeroupper
   140139bd7:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139bdc:	jmp    140139b91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x165b1>
   140139bde:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139be3:	jmp    140139a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1644d>
   140139be8:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139bed:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139bf2:	mov    0x680(%rsp),%rcx
   140139bfa:	mov    %rax,%rbx
   140139bfd:	lea    0x690(%rsp),%rax
   140139c05:	cmp    %rax,%rcx
   140139c08:	jne    140139c2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1664b>
   140139c0a:	vzeroupper
   140139c0d:	jmp    140139c15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16635>
   140139c0f:	mov    %rax,%rbx
   140139c12:	vzeroupper
   140139c15:	test   %rdi,%rdi
   140139c18:	je     1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139c1e:	mov    %rdi,%rcx
   140139c21:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139c26:	jmp    1401398ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162ce>
   140139c2b:	mov    0x690(%rsp),%rax
   140139c33:	lea    0x1(%rax),%rdx
   140139c37:	vzeroupper
   140139c3a:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139c3f:	jmp    140139c15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16635>
   140139c41:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c46:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c4b:	vzeroupper
   140139c4e:	jmp    140139b91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x165b1>
   140139c53:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139c58:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c5d:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c62:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c67:	mov    0x548(%rsp),%rcx
   140139c6f:	mov    %rax,%rbx
   140139c72:	test   %rcx,%rcx
   140139c75:	jne    140139a02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16422>
   140139c7b:	jmp    1401398ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x162cb>
   140139c80:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139c85:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c8a:	jmp    140139a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1644d>
   140139c8f:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139c94:	jmp    140139a9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164bc>
   140139c99:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139c9e:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139ca3:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139ca8:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139cad:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139cb2:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139cb7:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139cbc:	jmp    140139bc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x165e4>
   140139cc1:	jmp    140139a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1644d>
   140139cc6:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139ccb:	mov    0x690(%rsp),%rax
   140139cd3:	lea    0x1(%rax),%rdx
   140139cd7:	vzeroupper
   140139cda:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139cdf:	jmp    140139aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x164c2>
   140139ce4:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139ce9:	mov    %rax,%rbx
   140139cec:	mov    %rsi,%rcx
   140139cef:	vzeroupper
   140139cf2:	call   1402e80a0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139cf7:	mov    %rbx,%rcx
   140139cfa:	call   1401fde00 <_Unwind_Resume>
   140139cff:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139d04:	mov    %rax,%rbx
   140139d07:	vzeroupper
   140139d0a:	jmp    140139b01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16521>
   140139d0f:	mov    %rax,%rbx
   140139d12:	vzeroupper
   140139d15:	jmp    140139b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16547>
   140139d1a:	mov    %rax,%rbx
   140139d1d:	vzeroupper
   140139d20:	jmp    140139b4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1656d>
   140139d25:	mov    %rax,%rbx
   140139d28:	vzeroupper
   140139d2b:	jmp    140139b73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16593>
   140139d30:	jmp    140139a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1644d>
   140139d35:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139d3a:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139d3f:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139d44:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139d49:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139d4e:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139d53:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139d58:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139d5d:	mov    0x680(%rsp),%rcx
   140139d65:	mov    %rax,%rbx
   140139d68:	lea    0x690(%rsp),%rax
   140139d70:	cmp    %rax,%rcx
   140139d73:	je     140139d28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16748>
   140139d75:	mov    0x690(%rsp),%rax
   140139d7d:	lea    0x1(%rax),%rdx
   140139d81:	vzeroupper
   140139d84:	call   14034a160 <operator delete(void*, unsigned long long)>
   140139d89:	jmp    140139b73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16593>
   140139d8e:	jmp    140139d25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16745>
   140139d90:	jmp    140139a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1644d>
   140139d95:	jmp    140139bc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x165e4>
   140139d9a:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139d9f:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139da4:	jmp    140139a5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1647a>
   140139da9:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139dae:	jmp    140139873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16293>
   140139db3:	nop
   140139db4:	nop
   140139db5:	data16 cs nopw 0x0(%rax,%rax,1)

