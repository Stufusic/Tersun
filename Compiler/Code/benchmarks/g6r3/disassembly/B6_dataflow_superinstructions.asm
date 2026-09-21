00000001401238d0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   1401238d0:	push   %r15
   1401238d2:	push   %r14
   1401238d4:	push   %r13
   1401238d6:	push   %r12
   1401238d8:	push   %rbp
   1401238d9:	push   %rdi
   1401238da:	push   %rsi
   1401238db:	push   %rbx
   1401238dc:	sub    $0x968,%rsp
   1401238e3:	vmovaps %xmm6,0x8c0(%rsp)
   1401238ec:	vmovaps %xmm7,0x8d0(%rsp)
   1401238f5:	vmovaps %xmm8,0x8e0(%rsp)
   1401238fe:	vmovaps %xmm9,0x8f0(%rsp)
   140123907:	vmovaps %xmm10,0x900(%rsp)
   140123910:	vmovaps %xmm11,0x910(%rsp)
   140123919:	vmovaps %xmm12,0x920(%rsp)
   140123922:	vmovaps %xmm13,0x930(%rsp)
   14012392b:	vmovaps %xmm14,0x940(%rsp)
   140123934:	vmovaps %xmm15,0x950(%rsp)
   14012393d:	mov    0x8(%rdx),%rax
   140123941:	sub    (%rdx),%rax
   140123944:	mov    %rcx,%rbx
   140123947:	mov    %rdx,%r14
   14012394a:	cmp    %rax,0x1038(%rcx)
   140123951:	jb     14012395e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   140123953:	movq   $0x0,0x1038(%rcx)
   14012395e:	mov    0x152c8(%rbx),%rsi
   140123965:	movb   $0x1,0x1040(%rbx)
   14012396c:	test   %rsi,%rsi
   14012396f:	je     14012397e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140123971:	cmpb   $0x0,0x152c1(%rbx)
   140123978:	jne    1401243b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae0>
   14012397e:	mov    0x58(%r14),%rbp
   140123982:	test   %rbp,%rbp
   140123985:	je     140123a84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b4>
   14012398b:	mov    0x2391ae(%rip),%rdi        # 14035cb40 <CSWTCH.3087+0x240>
   140123992:	lea    0x1000(%rbx),%r15
   140123999:	mov    $0x88,%ecx
   14012399e:	lea    0x8(%rbp),%r12
   1401239a2:	call   140338480 <operator new(unsigned long long)>
   1401239a7:	vpxor  %xmm3,%xmm3,%xmm3
   1401239ab:	mov    %r12,%rdx
   1401239ae:	mov    %rax,%rsi
   1401239b1:	mov    %rdi,0x8(%rax)
   1401239b5:	lea    0x258384(%rip),%rax        # 14037bd40 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   1401239bc:	mov    %rax,(%rsi)
   1401239bf:	lea    0x20(%rsi),%rax
   1401239c3:	lea    0x10(%rsi),%r13
   1401239c7:	vmovdqu %ymm3,0x10(%rsi)
   1401239cc:	mov    %r13,%rcx
   1401239cf:	mov    %rax,0x10(%rsi)
   1401239d3:	lea    0x40(%rsi),%rax
   1401239d7:	vmovdqu %ymm3,0x30(%rsi)
   1401239dc:	mov    %rax,0x30(%rsi)
   1401239e0:	lea    0x80(%rsi),%rax
   1401239e7:	vmovdqu %ymm3,0x68(%rsi)
   1401239ec:	mov    %rax,0x50(%rsi)
   1401239f0:	movq   $0x1,0x58(%rsi)
   1401239f8:	movq   $0x0,0x60(%rsi)
   140123a00:	movq   $0x3f800000,0x70(%rsi)
   140123a08:	vzeroupper
   140123a0b:	call   1402efaa0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123a10:	lea    0x28(%rbp),%rdx
   140123a14:	lea    0x50(%rsi),%rcx
   140123a18:	cmp    %rdx,%rcx
   140123a1b:	je     140123a22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   140123a1d:	call   14029ebb0 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140123a22:	mov    %r12,%rdx
   140123a25:	mov    %r15,%rcx
   140123a28:	call   1403205a0 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123a2d:	mov    %r13,(%rax)
   140123a30:	cmp    %rsi,0x8(%rax)
   140123a34:	je     140123a6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f>
   140123a36:	lock addl $0x1,0x8(%rsi)
   140123a3b:	mov    0x8(%rax),%r12
   140123a3f:	test   %r12,%r12
   140123a42:	je     140123a6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   140123a44:	mov    0x8(%r12),%r8
   140123a49:	lea    0x8(%r12),%rdx
   140123a4e:	movabs $0x100000001,%rcx
   140123a58:	cmp    %rcx,%r8
   140123a5b:	je     14012a2f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a20>
   140123a61:	lock subl $0x1,(%rdx)
   140123a65:	je     14012a541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c71>
   140123a6b:	mov    %rsi,0x8(%rax)
   140123a6f:	mov    %rsi,%rcx
   140123a72:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140123a77:	mov    0x0(%rbp),%rbp
   140123a7b:	test   %rbp,%rbp
   140123a7e:	jne    140123999 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   140123a84:	mov    0x1060(%rbx),%rax
   140123a8b:	mov    0x1048(%rbx),%rdx
   140123a92:	mov    (%r14),%r15
   140123a95:	mov    0x1038(%rbx),%rcx
   140123a9c:	lea    (%rdx,%rax,8),%rsi
   140123aa0:	mov    0x150c0(%rbx),%r13
   140123aa7:	mov    0x1050(%rbx),%rax
   140123aae:	add    %r15,%rcx
   140123ab1:	mov    %rax,0x38(%rsp)
   140123ab6:	test   %r13,%r13
   140123ab9:	jne    140123b20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x250>
   140123abb:	mov    0xb0(%r14),%rax
   140123ac2:	mov    $0x20,%edx
   140123ac7:	cmp    %rdx,%rax
   140123aca:	cmovb  %rdx,%rax
   140123ace:	cmpb   $0x0,0x29c5ab(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140123ad5:	mov    %rax,0x15268(%rbx)
   140123adc:	je     140123b4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b>
   140123ade:	movabs $0xfffb000000000000,%rax
   140123ae8:	mov    %rax,0x1c8(%rsp)
   140123af0:	mov    %rax,0x1d0(%rsp)
   140123af8:	cmpb   $0x0,0x1040(%rbx)
   140123aff:	je     14012a32f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a5f>
   140123b05:	movzbl (%rcx),%eax
   140123b08:	lea    0x29c591(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123b0f:	lea    0x1(%rcx),%rbp
   140123b13:	xor    %r12d,%r12d
   140123b16:	mov    (%rdi,%rax,8),%rax
   140123b1a:	jmp    *%rax
   140123b1c:	nopl   0x0(%rax)
   140123b20:	lea    0x0(%r13,%r13,4),%rax
   140123b25:	mov    0x10a0(%rbx,%rax,8),%r13
   140123b2d:	mov    0x10b0(%rbx,%rax,8),%rdi
   140123b35:	add    %r13,%rdi
   140123b38:	cmpb   $0x0,0x29c541(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140123b3f:	mov    %rdi,%rax
   140123b42:	mov    %rax,0x15268(%rbx)
   140123b49:	jne    140123ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   140123b4b:	lea    0x65ed(%rip),%rdi        # 14012a13f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x686f>
   140123b52:	lea    0x665c(%rip),%rax        # 14012a1b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68e5>
   140123b59:	vmovq  %rdi,%xmm0
   140123b5e:	lea    0x64ef(%rip),%rdi        # 14012a054 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6784>
   140123b65:	lea    0x311d(%rip),%rdx        # 140126c89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33b9>
   140123b6c:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123b72:	vmovq  %rdi,%xmm1
   140123b77:	lea    0x654b(%rip),%rax        # 14012a0c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   140123b7e:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123b84:	lea    0x4145(%rip),%rdi        # 140127cd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4400>
   140123b8b:	lea    0x4182(%rip),%rax        # 140127d14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4444>
   140123b92:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123b98:	vmovq  %rdi,%xmm0
   140123b9d:	lea    0x6687(%rip),%rdi        # 14012a22b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x695b>
   140123ba4:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123baa:	vmovq  %rdi,%xmm1
   140123baf:	lea    0x40d6(%rip),%rax        # 140127c8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43bc>
   140123bb6:	vmovdqu %ymm2,0x180(%rsp)
   140123bbf:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123bc5:	lea    0x433e(%rip),%rdi        # 140127f0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x463a>
   140123bcc:	lea    0x43c6(%rip),%rax        # 140127f99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46c9>
   140123bd3:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123bd9:	vmovq  %rdi,%xmm0
   140123bde:	lea    0x4173(%rip),%rdi        # 140127d58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4488>
   140123be5:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123beb:	vmovq  %rdi,%xmm1
   140123bf0:	lea    0x4205(%rip),%rax        # 140127dfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x452c>
   140123bf7:	vmovdqu %ymm2,0x160(%rsp)
   140123c00:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123c06:	lea    0x45c3(%rip),%rdi        # 1401281d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4900>
   140123c0d:	lea    0x4677(%rip),%rax        # 14012828b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49bb>
   140123c14:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123c1a:	vmovq  %rdi,%xmm0
   140123c1f:	lea    0x4434(%rip),%rdi        # 14012805a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478a>
   140123c26:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123c2c:	vmovq  %rdi,%xmm1
   140123c31:	lea    0x44dd(%rip),%rax        # 140128115 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4845>
   140123c38:	vmovdqu %ymm2,0x140(%rsp)
   140123c41:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123c47:	lea    0x4d1f(%rip),%rdi        # 14012896d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x509d>
   140123c4e:	lea    0x3c18(%rip),%rax        # 14012786d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f9d>
   140123c55:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123c5b:	vmovq  %rdi,%xmm0
   140123c60:	lea    0x4784(%rip),%rdi        # 1401283eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b1b>
   140123c67:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123c6d:	vmovq  %rdi,%xmm1
   140123c72:	lea    0x48d2(%rip),%rax        # 14012854b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c7b>
   140123c79:	vmovdqu %ymm2,0x120(%rsp)
   140123c82:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123c88:	lea    0x3f34(%rip),%rdi        # 140127bc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42f3>
   140123c8f:	lea    0x3f70(%rip),%rax        # 140127c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4336>
   140123c96:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123c9c:	vmovq  %rdi,%xmm0
   140123ca1:	lea    0x38f2(%rip),%rdi        # 14012759a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cca>
   140123ca8:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123cae:	vmovq  %rdi,%xmm1
   140123cb3:	lea    0x3ec7(%rip),%rax        # 140127b81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42b1>
   140123cba:	vmovdqu %ymm2,0x100(%rsp)
   140123cc3:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123cc9:	lea    0x39a9(%rip),%rdi        # 140127679 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3da9>
   140123cd0:	lea    0x3a61(%rip),%rax        # 140127738 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e68>
   140123cd7:	vinserti128 $0x1,%xmm0,%ymm1,%ymm3
   140123cdd:	vmovq  %rdi,%xmm0
   140123ce2:	lea    0x3f60(%rip),%rdi        # 140127c49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4379>
   140123ce9:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123cef:	vmovq  %rdi,%xmm1
   140123cf4:	lea    0x3914(%rip),%rax        # 14012760f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d3f>
   140123cfb:	vmovdqu %ymm3,0xe0(%rsp)
   140123d04:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123d0a:	lea    0x499c(%rip),%rdi        # 1401286ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ddd>
   140123d11:	lea    0x4af5(%rip),%rax        # 14012880d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f3d>
   140123d18:	vinserti128 $0x1,%xmm0,%ymm1,%ymm4
   140123d1e:	vmovq  %rdi,%xmm0
   140123d23:	lea    0x916(%rip),%rdi        # 140124640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd70>
   140123d2a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d30:	vmovq  %rdi,%xmm1
   140123d35:	lea    0xb0b(%rip),%rax        # 140124847 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf77>
   140123d3c:	vmovdqu %ymm4,0xc0(%rsp)
   140123d45:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123d4b:	lea    0x61d8(%rip),%rdi        # 140129f2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x665a>
   140123d52:	lea    0x5ad1(%rip),%rax        # 14012982a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f5a>
   140123d59:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123d5f:	vmovq  %rdi,%xmm0
   140123d64:	lea    0x5919(%rip),%rdi        # 140129684 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5db4>
   140123d6b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d71:	vmovq  %rdi,%xmm1
   140123d76:	lea    0x59da(%rip),%rax        # 140129757 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e87>
   140123d7d:	vmovdqu %ymm2,0xa0(%rsp)
   140123d86:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123d8c:	lea    0x600b(%rip),%rdi        # 140129d9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64ce>
   140123d93:	lea    0x5c36(%rip),%rax        # 1401299d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6100>
   140123d9a:	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   140123da0:	vmovq  %rdi,%xmm0
   140123da5:	lea    0x5b51(%rip),%rdi        # 1401298fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x602d>
   140123dac:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123db2:	vmovq  %rdi,%xmm2
   140123db7:	lea    0x620a(%rip),%rax        # 140129fc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66f8>
   140123dbe:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123dc4:	lea    0x5e2d(%rip),%rdi        # 140129bf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6328>
   140123dcb:	lea    0x5ef9(%rip),%rax        # 140129ccb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63fb>
   140123dd2:	vinserti128 $0x1,%xmm0,%ymm2,%ymm3
   140123dd8:	vmovq  %rdi,%xmm0
   140123ddd:	lea    0x5cbf(%rip),%rdi        # 140129aa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61d3>
   140123de4:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123dea:	vmovq  %rdi,%xmm2
   140123def:	lea    0x5d35(%rip),%rax        # 140129b2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x625b>
   140123df6:	vmovdqu %ymm3,0x80(%rsp)
   140123dff:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123e05:	lea    0x3515(%rip),%rdi        # 140127321 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a51>
   140123e0c:	lea    0x5033(%rip),%rax        # 140128e46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5576>
   140123e13:	vinserti128 $0x1,%xmm0,%ymm2,%ymm4
   140123e19:	vmovq  %rdi,%xmm0
   140123e1e:	lea    0x3356(%rip),%rdi        # 14012717b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38ab>
   140123e25:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e2b:	vmovdqu %ymm4,0x60(%rsp)
   140123e31:	lea    0x3416(%rip),%rax        # 14012724e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x397e>
   140123e38:	vmovq  %rdi,%xmm4
   140123e3d:	vpinsrq $0x1,%rax,%xmm4,%xmm4
   140123e43:	lea    0x5275(%rip),%rdi        # 1401290bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57ef>
   140123e4a:	lea    0x5341(%rip),%rax        # 140129192 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58c2>
   140123e51:	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   140123e57:	vmovq  %rdi,%xmm0
   140123e5c:	lea    0x50b6(%rip),%rdi        # 140128f19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5649>
   140123e63:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e69:	vmovq  %rdi,%xmm3
   140123e6e:	lea    0x5177(%rip),%rax        # 140128fec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x571c>
   140123e75:	vpinsrq $0x1,%rax,%xmm3,%xmm3
   140123e7b:	lea    0x5589(%rip),%rdi        # 14012940b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b3b>
   140123e82:	lea    0x5655(%rip),%rax        # 1401294de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c0e>
   140123e89:	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   140123e8f:	vmovq  %rdi,%xmm0
   140123e94:	lea    0x53ca(%rip),%rdi        # 140129265 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5995>
   140123e9b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ea1:	vmovq  %rdi,%xmm2
   140123ea6:	lea    0x548b(%rip),%rax        # 140129338 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a68>
   140123ead:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123eb3:	lea    0x4b6d(%rip),%rdi        # 140128a27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5157>
   140123eba:	lea    0x4c39(%rip),%rax        # 140128afa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x522a>
   140123ec1:	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   140123ec7:	vmovq  %rdi,%xmm0
   140123ecc:	lea    0x3521(%rip),%rdi        # 1401273f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b24>
   140123ed3:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ed9:	vmovq  %rdi,%xmm5
   140123ede:	lea    0x35e2(%rip),%rax        # 1401274c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bf7>
   140123ee5:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140123eeb:	lea    0x3010(%rip),%rdi        # 140126f02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3632>
   140123ef2:	lea    0x30dc(%rip),%rax        # 140126fd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3705>
   140123ef9:	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   140123eff:	vmovq  %rdi,%xmm0
   140123f04:	lea    0x2e51(%rip),%rdi        # 140126d5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x348c>
   140123f0b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f11:	vmovdqu %ymm5,0x40(%rsp)
   140123f17:	lea    0x2f11(%rip),%rax        # 140126e2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x355f>
   140123f1e:	vmovq  %rdi,%xmm5
   140123f23:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140123f29:	lea    0x4d70(%rip),%rdi        # 140128ca0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53d0>
   140123f30:	lea    0x4e3c(%rip),%rax        # 140128d73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54a3>
   140123f37:	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   140123f3d:	vmovq  %rdi,%xmm0
   140123f42:	lea    0x25cd(%rip),%rdi        # 140126516 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c46>
   140123f49:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123f4f:	lea    0x4c77(%rip),%rax        # 140128bcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52fd>
   140123f56:	vmovq  %rdx,%xmm0
   140123f5b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f61:	lea    0x2209(%rip),%rdx        # 140126171 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28a1>
   140123f68:	lea    0x2694(%rip),%rax        # 140126603 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d33>
   140123f6f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   140123f75:	vmovq  %rdi,%xmm0
   140123f7a:	lea    0x1b97(%rip),%rdi        # 140125b18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2248>
   140123f81:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123f87:	lea    0x24c1(%rip),%rax        # 14012644f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b7f>
   140123f8e:	vmovq  %rdx,%xmm0
   140123f93:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f99:	lea    0x1918(%rip),%rdx        # 1401258b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fe8>
   140123fa0:	lea    0x1ca0(%rip),%rax        # 140125c47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2377>
   140123fa7:	vinserti128 $0x1,%xmm6,%ymm0,%ymm14
   140123fad:	vmovq  %rdi,%xmm0
   140123fb2:	lea    0x11ea(%rip),%rdi        # 1401251a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18d3>
   140123fb9:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123fbf:	lea    0x1a23(%rip),%rax        # 1401259e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2119>
   140123fc6:	vmovq  %rdx,%xmm0
   140123fcb:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123fd1:	lea    0x105d(%rip),%rdx        # 140125035 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1765>
   140123fd8:	lea    0x127b(%rip),%rax        # 14012525a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x198a>
   140123fdf:	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   140123fe5:	vmovq  %rdi,%xmm0
   140123fea:	lea    0x294c(%rip),%rdi        # 14012693d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x306d>
   140123ff1:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140123ff7:	lea    0x10ee(%rip),%rax        # 1401250ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x181c>
   140123ffe:	vmovq  %rdx,%xmm0
   140124003:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124009:	lea    0x161e(%rip),%rdx        # 14012562e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d5e>
   140124010:	lea    0x165f(%rip),%rax        # 140125676 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1da6>
   140124017:	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   14012401d:	vmovq  %rdi,%xmm0
   140124022:	lea    0x1349(%rip),%rdi        # 140125372 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aa2>
   140124029:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14012402f:	lea    0x2834(%rip),%rax        # 14012686a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f9a>
   140124036:	vmovq  %rdx,%xmm0
   14012403b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124041:	lea    0x174f(%rip),%rdx        # 140125797 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ec7>
   140124048:	lea    0x13af(%rip),%rax        # 1401253fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b2e>
   14012404f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   140124055:	vmovq  %rdi,%xmm0
   14012405a:	lea    0xed6(%rip),%rdi        # 140124f37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1667>
   140124061:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124067:	lea    0x1278(%rip),%rax        # 1401252e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a16>
   14012406e:	vmovq  %rdx,%xmm0
   140124073:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124079:	lea    0xda6(%rip),%rdx        # 140124e26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1556>
   140124080:	lea    0xf48(%rip),%rax        # 140124fcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ff>
   140124087:	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   14012408d:	vmovq  %rdi,%xmm0
   140124092:	lea    0xaf1(%rip),%rdi        # 140124b8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ba>
   140124099:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14012409f:	lea    0xe1b(%rip),%rax        # 140124ec1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f1>
   1401240a6:	vmovq  %rdx,%xmm0
   1401240ab:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401240b1:	lea    0xa17(%rip),%rdx        # 140124acf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ff>
   1401240b8:	lea    0xb4d(%rip),%rax        # 140124c0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133c>
   1401240bf:	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   1401240c5:	vmovq  %rdi,%xmm0
   1401240ca:	lea    0xc11(%rip),%rdi        # 140124ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1412>
   1401240d1:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401240d7:	lea    0xa13(%rip),%rax        # 140124af1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1221>
   1401240de:	vmovq  %rdx,%xmm0
   1401240e3:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401240e9:	lea    0xc4a(%rip),%rdx        # 140124d3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146a>
   1401240f0:	lea    0xc9e(%rip),%rax        # 140124d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c5>
   1401240f7:	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   1401240fd:	vmovq  %rdx,%xmm6
   140124102:	vmovq  %rdi,%xmm0
   140124107:	vpinsrq $0x1,%rax,%xmm6,%xmm6
   14012410d:	lea    0x2683(%rip),%rax        # 140126797 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ec7>
   140124114:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012411a:	lea    0x487(%rip),%rax        # 1401245a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd8>
   140124121:	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   140124127:	vmovq  %rax,%xmm0
   14012412c:	lea    0x29bf6d(%rip),%rax        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124133:	vpbroadcastq %xmm0,%ymm0
   140124138:	lea    0x800(%rax),%rdx
   14012413f:	nop
   140124140:	vmovdqa %ymm0,(%rax)
   140124144:	add    $0x40,%rax
   140124148:	vmovdqa %ymm0,-0x20(%rax)
   14012414d:	cmp    %rdx,%rax
   140124150:	jne    140124140 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x870>
   140124152:	lea    0xc6b(%rip),%rax        # 140124dc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f4>
   140124159:	lea    0x132a(%rip),%rdi        # 14012548a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1bba>
   140124160:	vmovdqu 0x40(%rsp),%ymm6
   140124166:	vmovdqa %ymm3,0x29c3d2(%rip)        # 1403c0540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   14012416e:	mov    %rax,0x29bf6b(%rip)        # 1403c00e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140124175:	vmovq  %rdi,%xmm0
   14012417a:	lea    0x1395(%rip),%rax        # 140125516 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c46>
   140124181:	lea    0x1bee(%rip),%rdi        # 140125d76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24a6>
   140124188:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012418e:	lea    0x140d(%rip),%rax        # 1401255a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1cd2>
   140124195:	vmovdqu 0x60(%rsp),%ymm3
   14012419b:	vmovdqa %ymm2,0x29c3bd(%rip)        # 1403c0560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   1401241a3:	vmovdqu 0x80(%rsp),%ymm2
   1401241ac:	mov    %rax,0x29c05d(%rip)        # 1403c0210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   1401241b3:	lea    0x1ceb(%rip),%rax        # 140125ea5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25d5>
   1401241ba:	vmovdqa %xmm0,0x29c03e(%rip)        # 1403c0200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   1401241c2:	vmovq  %rdi,%xmm0
   1401241c7:	lea    0x2842(%rip),%rdi        # 140126a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3140>
   1401241ce:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401241d4:	lea    0x2908(%rip),%rax        # 140126ae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3213>
   1401241db:	vmovdqa %ymm5,0x29c2dd(%rip)        # 1403c04c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   1401241e3:	vmovdqa %xmm0,0x29c055(%rip)        # 1403c0240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   1401241eb:	vmovq  %rdi,%xmm0
   1401241f0:	lea    0x1ddd(%rip),%rdi        # 140125fd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2704>
   1401241f7:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401241fd:	lea    0x29b2(%rip),%rax        # 140126bb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32e6>
   140124204:	vmovdqa %ymm4,0x29c314(%rip)        # 1403c0520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   14012420c:	mov    %rax,0x29c09d(%rip)        # 1403c02b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   140124213:	lea    0x1df0(%rip),%rax        # 14012600a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273a>
   14012421a:	vmovdqa %xmm0,0x29c07e(%rip)        # 1403c02a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   140124222:	vmovq  %rdi,%xmm0
   140124227:	lea    0x36be(%rip),%rdi        # 1401278ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x401c>
   14012422e:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124234:	lea    0x1e4a(%rip),%rax        # 140126085 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b5>
   14012423b:	vmovdqa %ymm2,0x29c37d(%rip)        # 1403c05c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   140124243:	mov    %rax,0x29c0e6(%rip)        # 1403c0330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   14012424a:	lea    0x24b8(%rip),%rax        # 140126709 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e39>
   140124251:	mov    %rax,0x29c168(%rip)        # 1403c03c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x320>
   140124258:	lea    0x252(%rip),%rax        # 1401244b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   14012425f:	mov    %rax,0x29c632(%rip)        # 1403c0898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140124266:	lea    0x2e3b(%rip),%rax        # 1401270a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37d8>
   14012426d:	mov    %rax,0x29c26c(%rip)        # 1403c04e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140124274:	lea    0x5336(%rip),%rax        # 1401295b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ce1>
   14012427b:	mov    %rax,0x29c2fe(%rip)        # 1403c0580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   140124282:	lea    0x37ac(%rip),%rax        # 140127a35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4165>
   140124289:	vmovdqa %xmm0,0x29c08f(%rip)        # 1403c0320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   140124291:	vmovq  %rdi,%xmm0
   140124296:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012429c:	vmovdqa %ymm3,0x29c33c(%rip)        # 1403c05e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   1401242a4:	lea    0x385e(%rip),%rax        # 140127b09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4239>
   1401242ab:	vmovdqa %ymm11,0x29bded(%rip)        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242b3:	vmovdqa %ymm7,0x29be05(%rip)        # 1403c00c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   1401242bb:	vmovdqa %ymm12,0x29be5d(%rip)        # 1403c0120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   1401242c3:	vmovdqa %ymm9,0x29bed5(%rip)        # 1403c01a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   1401242cb:	vmovdqa %ymm8,0x29beed(%rip)        # 1403c01c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   1401242d3:	vmovdqa %ymm13,0x29bf05(%rip)        # 1403c01e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   1401242db:	vmovdqa %ymm10,0x29bf3d(%rip)        # 1403c0220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   1401242e3:	vmovdqa %ymm14,0x29c0b5(%rip)        # 1403c03a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   1401242eb:	vmovdqa %ymm15,0x29c12d(%rip)        # 1403c0420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   1401242f3:	vmovdqa %ymm6,0x29c1a5(%rip)        # 1403c04a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   1401242fb:	vmovdqa %ymm1,0x29c29d(%rip)        # 1403c05a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   140124303:	vmovdqa %xmm0,0x29c415(%rip)        # 1403c0720 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x680>
   14012430b:	vmovdqu 0x180(%rsp),%ymm4
   140124314:	vmovdqu 0x160(%rsp),%ymm2
   14012431d:	vmovdqu 0x140(%rsp),%ymm3
   140124326:	mov    %rax,0x29c403(%rip)        # 1403c0730 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x690>
   14012432d:	vmovdqu 0x100(%rsp),%ymm5
   140124336:	vmovdqa %ymm4,0x29c2e2(%rip)        # 1403c0620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   14012433e:	vmovdqu 0x120(%rsp),%ymm4
   140124347:	vmovdqa %ymm2,0x29c2f1(%rip)        # 1403c0640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   14012434f:	vmovdqu 0xe0(%rsp),%ymm2
   140124358:	vmovdqa %ymm3,0x29c300(%rip)        # 1403c0660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140124360:	vmovdqu 0xc0(%rsp),%ymm3
   140124369:	vmovdqa %ymm4,0x29c30f(%rip)        # 1403c0680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140124371:	vmovdqu 0xa0(%rsp),%ymm4
   14012437a:	movb   $0x1,0x29bcff(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140124381:	vmovdqa %ymm5,0x29c317(%rip)        # 1403c06a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   140124389:	vmovdqa %ymm2,0x29c32f(%rip)        # 1403c06c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140124391:	vmovdqa %ymm3,0x29c347(%rip)        # 1403c06e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   140124399:	vmovdqa %ymm4,0x29c35f(%rip)        # 1403c0700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   1401243a1:	jmp    140123ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   1401243a6:	cs nopw 0x0(%rax,%rax,1)
   1401243b0:	mov    0xe0(%rsi),%rax
   1401243b7:	cmp    %rax,0xd8(%rsi)
   1401243be:	jne    140124498 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc8>
   1401243c4:	mov    0x88(%r14),%rax
   1401243cb:	sub    0x80(%r14),%rax
   1401243d2:	mov    $0x80,%edx
   1401243d7:	lea    0xd8(%rsi),%rcx
   1401243de:	sar    $0x2,%rax
   1401243e2:	add    $0x10,%rax
   1401243e6:	cmp    $0x80,%rax
   1401243ec:	jbe    1401243f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb28>
   1401243ee:	xchg   %ax,%ax
   1401243f0:	add    %rdx,%rdx
   1401243f3:	cmp    %rax,%rdx
   1401243f6:	jb     1401243f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb20>
   1401243f8:	mov    0x8c(%rsi),%eax
   1401243fe:	mov    0x88(%rsi),%r9d
   140124405:	mov    $0x80,%r8d
   14012440b:	mov    %eax,0x28(%rsp)
   14012440f:	mov    0x90(%rsi),%eax
   140124415:	mov    %eax,0x20(%rsp)
   140124419:	call   14019ec80 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   14012441e:	vmovdqu 0xd8(%rsi),%xmm1
   140124426:	vmovdqu 0xe8(%rsi),%xmm0
   14012442e:	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140124434:	vmovq  %xmm1,%rax
   140124439:	vpextrq $0x1,%xmm0,%rcx
   14012443f:	vmovdqu %xmm2,0x152d8(%rbx)
   140124447:	mov    0xe0(%rsi),%rdx
   14012444e:	sub    %rax,%rdx
   140124451:	mov    0xf8(%rsi),%rax
   140124458:	sar    $0x5,%rdx
   14012445c:	sub    %rcx,%rax
   14012445f:	mov    %rdx,0x152e8(%rbx)
   140124466:	sar    $0x5,%rax
   14012446a:	cmp    $0x1,%rdx
   14012446e:	adc    $0xffffffffffffffff,%rdx
   140124472:	cmp    $0x1,%rax
   140124476:	mov    %rax,0x152f0(%rbx)
   14012447d:	adc    $0xffffffffffffffff,%rax
   140124481:	mov    %rdx,0x152f8(%rbx)
   140124488:	mov    %rax,0x15300(%rbx)
   14012448f:	jmp    14012397e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140124494:	nopl   0x0(%rax)
   140124498:	mov    0xf0(%rsi),%rax
   14012449f:	cmp    %rax,0xf8(%rsi)
   1401244a6:	jne    14012441e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e>
   1401244ac:	jmp    1401243c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf4>
   1401244b1:	movb   $0x0,0x1040(%rbx)
   1401244b8:	mov    0x1048(%rbx),%rdx
   1401244bf:	vzeroupper
   1401244c2:	cmp    $0x2,%r12b
   1401244c6:	jne    14012a2c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f0>
   1401244cc:	mov    0x1050(%rbx),%rax
   1401244d3:	lea    0x10(%rsi),%r8
   1401244d7:	cmp    0x38(%rsp),%r8
   1401244dc:	jae    14012cf2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x965e>
   1401244e2:	mov    0x1d0(%rsp),%rcx
   1401244ea:	mov    %rcx,(%rsi)
   1401244ed:	mov    0x1c8(%rsp),%rcx
   1401244f5:	mov    %rcx,0x8(%rsi)
   1401244f9:	mov    %r8,%rsi
   1401244fc:	sub    %r15,%rbp
   1401244ff:	sub    %rdx,%rsi
   140124502:	sub    %rdx,%rax
   140124505:	mov    %rbp,0x1038(%rbx)
   14012450c:	mov    %rsi,%rbp
   14012450f:	sar    $0x3,%rbp
   140124513:	cmp    %rsi,%rax
   140124516:	jb     14012a2d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a08>
   14012451c:	vmovdqa 0x2385bc(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140124524:	mov    %rbp,0x1060(%rbx)
   14012452b:	movb   $0x0,0x153a0(%rbx)
   140124532:	vmovdqa %xmm0,0x15390(%rbx)
   14012453a:	vmovaps 0x8c0(%rsp),%xmm6
   140124543:	vmovaps 0x8d0(%rsp),%xmm7
   14012454c:	vmovaps 0x8e0(%rsp),%xmm8
   140124555:	vmovaps 0x8f0(%rsp),%xmm9
   14012455e:	vmovaps 0x900(%rsp),%xmm10
   140124567:	vmovaps 0x910(%rsp),%xmm11
   140124570:	vmovaps 0x920(%rsp),%xmm12
   140124579:	vmovaps 0x930(%rsp),%xmm13
   140124582:	vmovaps 0x940(%rsp),%xmm14
   14012458b:	vmovaps 0x950(%rsp),%xmm15
   140124594:	add    $0x968,%rsp
   14012459b:	pop    %rbx
   14012459c:	pop    %rsi
   14012459d:	pop    %rdi
   14012459e:	pop    %rbp
   14012459f:	pop    %r12
   1401245a1:	pop    %r13
   1401245a3:	pop    %r14
   1401245a5:	pop    %r15
   1401245a7:	ret
   1401245a8:	cmp    $0x2,%r12b
   1401245ac:	je     14012b681 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7db1>
   1401245b2:	cmp    $0x1,%r12b
   1401245b6:	jne    140136b2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1325a>
   1401245bc:	mov    0x1048(%rbx),%rdx
   1401245c3:	lea    0x8(%rsi),%r8
   1401245c7:	cmp    0x38(%rsp),%r8
   1401245cc:	jae    1401316cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xddfd>
   1401245d2:	mov    0x1050(%rbx),%rax
   1401245d9:	vzeroupper
   1401245dc:	mov    0x1c8(%rsp),%rcx
   1401245e4:	mov    %rcx,(%rsi)
   1401245e7:	sub    %rdx,%r8
   1401245ea:	sub    %r15,%rbp
   1401245ed:	sub    %rdx,%rax
   1401245f0:	mov    %r8,%rsi
   1401245f3:	mov    %rbp,0x1038(%rbx)
   1401245fa:	sar    $0x3,%rsi
   1401245fe:	cmp    %r8,%rax
   140124601:	jae    140124613 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd43>
   140124603:	lea    (%rsi,%rsi,1),%rdx
   140124607:	lea    0x1048(%rbx),%rcx
   14012460e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140124613:	vmovdqa 0x2384c5(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012461b:	mov    %rsi,0x1060(%rbx)
   140124622:	movb   $0x0,0x153a0(%rbx)
   140124629:	mov    0x1038(%rbx),%rcx
   140124630:	vmovdqa %xmm0,0x15390(%rbx)
   140124638:	call   14033e7ce <setun::cold_throw_unknown_opcode(unsigned long long)>
   14012463d:	nopl   (%rax)
   140124640:	movzwl 0x6(%rbp),%edx
   140124644:	lea    0x8(%rbp),%rdi
   140124648:	movzwl 0x0(%rbp),%r9d
   14012464d:	mov    %rdi,0xa0(%rsp)
   140124655:	movzwl 0x2(%rbp),%r8d
   14012465a:	movzwl 0x4(%rbp),%eax
   14012465e:	lea    (%rdx,%r13,1),%rdi
   140124662:	cmp    0x15268(%rbx),%rdi
   140124669:	jae    14012f485 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbb5>
   14012466f:	vzeroupper
   140124672:	mov    0x1070(%rbx),%rcx
   140124679:	sub    0x1068(%rbx),%rcx
   140124680:	sar    $0x3,%rcx
   140124684:	cmp    %rcx,%rdi
   140124687:	jae    14012f44e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb7e>
   14012468d:	mov    0x1068(%rbx),%rdx
   140124694:	movzwl %r9w,%ecx
   140124698:	movzwl %ax,%eax
   14012469b:	add    %r13,%rcx
   14012469e:	add    %r13,%rax
   1401246a1:	lea    (%rdx,%rcx,8),%r10
   1401246a5:	movzwl %r8w,%ecx
   1401246a9:	lea    (%rdx,%rax,8),%r11
   1401246ad:	add    %r13,%rcx
   1401246b0:	mov    (%r10),%rax
   1401246b3:	lea    (%rdx,%rcx,8),%r9
   1401246b7:	movabs $0xfff7ffffffffffff,%rdx
   1401246c1:	cmp    %rax,%rdx
   1401246c4:	jae    1401247a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed3>
   1401246ca:	movabs $0xfffc000000000000,%rdx
   1401246d4:	cmp    %rdx,%rax
   1401246d7:	je     1401247a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed3>
   1401246dd:	movabs $0xffffffff00000000,%rdx
   1401246e7:	and    %rdx,%rax
   1401246ea:	movabs $0xfffd000100000000,%rdx
   1401246f4:	cmp    %rdx,%rax
   1401246f7:	je     1401314ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbfa>
   1401246fd:	movabs $0xffffffff00000000,%rax
   140124707:	mov    (%r9),%rdx
   14012470a:	movabs $0xfffd000100000000,%rcx
   140124714:	and    %rax,%rdx
   140124717:	cmp    %rcx,%rdx
   14012471a:	je     1401314ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbfa>
   140124720:	and    (%r11),%rax
   140124723:	cmp    %rcx,%rax
   140124726:	je     1401314ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbfa>
   14012472c:	mov    %r11,%rcx
   14012472f:	mov    %r10,0x60(%rsp)
   140124734:	mov    %r9,0x40(%rsp)
   140124739:	call   14021bc80 <setun::VMValue::as_float() const>
   14012473e:	mov    0x40(%rsp),%rcx
   140124743:	vmovapd %xmm0,%xmm6
   140124747:	call   14021bc80 <setun::VMValue::as_float() const>
   14012474c:	mov    0x60(%rsp),%rcx
   140124751:	vmovapd %xmm0,%xmm7
   140124755:	call   14021bc80 <setun::VMValue::as_float() const>
   14012475a:	movabs $0xfffc000000000000,%rax
   140124764:	vfmadd132sd %xmm7,%xmm6,%xmm0
   140124769:	vucomisd %xmm0,%xmm0
   14012476d:	vmovq  %xmm0,%rdx
   140124772:	cmovnp %rdx,%rax
   140124776:	mov    0x1068(%rbx),%rdx
   14012477d:	mov    %rax,(%rdx,%rdi,8)
   140124781:	cmpb   $0x0,0x1040(%rbx)
   140124788:	je     14012d160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9890>
   14012478e:	movzbl 0x8(%rbp),%eax
   140124792:	lea    0x29b907(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124799:	add    $0x9,%rbp
   14012479d:	mov    (%rdi,%rax,8),%rax
   1401247a1:	jmp    *%rax
   1401247a3:	movabs $0xfff7ffffffffffff,%rdx
   1401247ad:	mov    (%r9),%rax
   1401247b0:	cmp    %rax,%rdx
   1401247b3:	jae    1401247c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef8>
   1401247b5:	movabs $0xfffc000000000000,%rdx
   1401247bf:	cmp    %rdx,%rax
   1401247c2:	jne    1401246fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d>
   1401247c8:	movabs $0xfff7ffffffffffff,%rdx
   1401247d2:	mov    (%r11),%rax
   1401247d5:	cmp    %rax,%rdx
   1401247d8:	jae    1401247ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1d>
   1401247da:	movabs $0xfffc000000000000,%rdx
   1401247e4:	cmp    %rdx,%rax
   1401247e7:	jne    1401246fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d>
   1401247ed:	mov    %r11,%rcx
   1401247f0:	mov    %r10,0x60(%rsp)
   1401247f5:	mov    %r9,0x40(%rsp)
   1401247fa:	call   14021bc80 <setun::VMValue::as_float() const>
   1401247ff:	mov    0x40(%rsp),%rcx
   140124804:	vmovapd %xmm0,%xmm7
   140124808:	call   14021bc80 <setun::VMValue::as_float() const>
   14012480d:	mov    0x60(%rsp),%rcx
   140124812:	vmovapd %xmm0,%xmm6
   140124816:	call   14021bc80 <setun::VMValue::as_float() const>
   14012481b:	mov    0x1068(%rbx),%rdx
   140124822:	movabs $0xfffc000000000000,%rax
   14012482c:	vfmadd132sd %xmm6,%xmm7,%xmm0
   140124831:	vucomisd %xmm0,%xmm0
   140124835:	vmovq  %xmm0,%rcx
   14012483a:	cmovnp %rcx,%rax
   14012483e:	mov    %rax,(%rdx,%rdi,8)
   140124842:	jmp    140124781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1>
   140124847:	movzwl 0x6(%rbp),%edx
   14012484b:	lea    0x8(%rbp),%rdi
   14012484f:	movzwl 0x0(%rbp),%r9d
   140124854:	mov    %rdi,0xa0(%rsp)
   14012485c:	movzwl 0x2(%rbp),%r8d
   140124861:	movzwl 0x4(%rbp),%eax
   140124865:	lea    (%rdx,%r13,1),%rdi
   140124869:	cmp    0x15268(%rbx),%rdi
   140124870:	jae    14012f7c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbef8>
   140124876:	vzeroupper
   140124879:	mov    0x1070(%rbx),%rcx
   140124880:	sub    0x1068(%rbx),%rcx
   140124887:	sar    $0x3,%rcx
   14012488b:	cmp    %rcx,%rdi
   14012488e:	jae    1401306b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcde4>
   140124894:	mov    0x1068(%rbx),%rdx
   14012489b:	movzwl %r9w,%ecx
   14012489f:	movzwl %r8w,%r8d
   1401248a3:	movzwl %ax,%eax
   1401248a6:	add    %r13,%rcx
   1401248a9:	add    %r13,%r8
   1401248ac:	add    %r13,%rax
   1401248af:	lea    (%rdx,%rcx,8),%rcx
   1401248b3:	lea    (%rdx,%rax,8),%rax
   1401248b7:	lea    (%rdx,%r8,8),%r9
   1401248bb:	mov    (%rcx),%rdx
   1401248be:	mov    %rax,0x40(%rsp)
   1401248c3:	movabs $0xffff000000000000,%rax
   1401248cd:	movabs $0xfffd000000000000,%r8
   1401248d7:	and    %rdx,%rax
   1401248da:	cmp    %r8,%rax
   1401248dd:	je     14012b657 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d87>
   1401248e3:	movabs $0xfff8000000000000,%rdx
   1401248ed:	cmp    %rdx,%rax
   1401248f0:	je     14012b66f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d9f>
   1401248f6:	mov    %r9,0x80(%rsp)
   1401248fe:	call   14021bc80 <setun::VMValue::as_float() const>
   140124903:	vcvttsd2si %xmm0,%rax
   140124908:	mov    %rax,0x420(%rsp)
   140124910:	lea    0x420(%rsp),%rax
   140124918:	mov    0x80(%rsp),%r9
   140124920:	movq   $0x0,0x428(%rsp)
   14012492c:	movq   $0x0,0x430(%rsp)
   140124938:	mov    %rax,0x60(%rsp)
   14012493d:	movabs $0xffff000000000000,%rax
   140124947:	mov    (%r9),%rdx
   14012494a:	movabs $0xfffd000000000000,%rcx
   140124954:	and    %rdx,%rax
   140124957:	cmp    %rcx,%rax
   14012495a:	je     14012d1c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98f0>
   140124960:	movabs $0xfff8000000000000,%rdx
   14012496a:	cmp    %rdx,%rax
   14012496d:	je     14012d1d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9908>
   140124973:	mov    %r9,%rcx
   140124976:	call   14021bc80 <setun::VMValue::as_float() const>
   14012497b:	lea    0x440(%rsp),%r8
   140124983:	movq   $0x0,0x448(%rsp)
   14012498f:	vcvttsd2si %xmm0,%rax
   140124994:	movq   $0x0,0x450(%rsp)
   1401249a0:	mov    %rax,0x440(%rsp)
   1401249a8:	movabs $0xfffd000000000000,%rcx
   1401249b2:	mov    0x40(%rsp),%rax
   1401249b7:	mov    (%rax),%rdx
   1401249ba:	movabs $0xffff000000000000,%rax
   1401249c4:	and    %rdx,%rax
   1401249c7:	cmp    %rcx,%rax
   1401249ca:	je     14012d191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98c1>
   1401249d0:	movabs $0xfff8000000000000,%rdx
   1401249da:	cmp    %rdx,%rax
   1401249dd:	je     14012d1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98d9>
   1401249e3:	mov    0x40(%rsp),%rcx
   1401249e8:	mov    %r8,0xc0(%rsp)
   1401249f0:	call   14021bc80 <setun::VMValue::as_float() const>
   1401249f5:	vcvttsd2si %xmm0,%rax
   1401249fa:	mov    %rax,0x460(%rsp)
   140124a02:	lea    0x460(%rsp),%rax
   140124a0a:	mov    0xc0(%rsp),%r8
   140124a12:	movq   $0x0,0x468(%rsp)
   140124a1e:	movq   $0x0,0x470(%rsp)
   140124a2a:	mov    %rax,0x80(%rsp)
   140124a32:	lea    0x680(%rsp),%rax
   140124a3a:	mov    0x60(%rsp),%rdx
   140124a3f:	mov    %rax,%rcx
   140124a42:	mov    %rax,0x40(%rsp)
   140124a47:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140124a4c:	mov    0x40(%rsp),%r8
   140124a51:	mov    0x80(%rsp),%rdx
   140124a59:	lea    0x4e0(%rsp),%rcx
   140124a61:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140124a66:	mov    0x4f0(%rsp),%rax
   140124a6e:	vmovdqa 0x4e0(%rsp),%xmm5
   140124a77:	lea    0x1a0(%rsp),%rdx
   140124a7f:	mov    0x40(%rsp),%rcx
   140124a84:	mov    %rax,0x1b0(%rsp)
   140124a8c:	vmovdqa %xmm5,0x1a0(%rsp)
   140124a95:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   140124a9a:	mov    0x1068(%rbx),%rax
   140124aa1:	mov    0x680(%rsp),%rdx
   140124aa9:	mov    %rdx,(%rax,%rdi,8)
   140124aad:	cmpb   $0x0,0x1040(%rbx)
   140124ab4:	je     14012d160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9890>
   140124aba:	movzbl 0x8(%rbp),%eax
   140124abe:	lea    0x29b5db(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124ac5:	add    $0x9,%rbp
   140124ac9:	mov    (%rdi,%rax,8),%rax
   140124acd:	jmp    *%rax
   140124acf:	cmpb   $0x0,0x1040(%rbx)
   140124ad6:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124adc:	movzbl 0x0(%rbp),%eax
   140124ae0:	lea    0x29b5b9(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124ae7:	add    $0x1,%rbp
   140124aeb:	mov    (%rdi,%rax,8),%rax
   140124aef:	jmp    *%rax
   140124af1:	lea    0x8(%rbp),%rax
   140124af5:	mov    0x0(%rbp),%rdi
   140124af9:	mov    %rax,0x40(%rsp)
   140124afe:	test   %r12b,%r12b
   140124b01:	je     14012ac69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7399>
   140124b07:	cmp    $0x1,%r12b
   140124b0b:	je     14012e870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa0>
   140124b11:	lea    0x8(%rsi),%r8
   140124b15:	cmp    0x38(%rsp),%r8
   140124b1a:	jae    140131c8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3bb>
   140124b20:	vzeroupper
   140124b23:	mov    0x1d0(%rsp),%rax
   140124b2b:	lea    0x680(%rsp),%rcx
   140124b33:	mov    %rdi,%rdx
   140124b36:	mov    %r8,0x60(%rsp)
   140124b3b:	mov    %rax,(%rsi)
   140124b3e:	mov    0x1c8(%rsp),%rax
   140124b46:	mov    %rax,0x1d0(%rsp)
   140124b4e:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140124b53:	mov    0x680(%rsp),%rax
   140124b5b:	mov    0x60(%rsp),%rsi
   140124b60:	mov    %rax,0x1c8(%rsp)
   140124b68:	cmpb   $0x0,0x1040(%rbx)
   140124b6f:	je     14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140124b75:	movzbl 0x8(%rbp),%eax
   140124b79:	lea    0x29b520(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124b80:	add    $0x9,%rbp
   140124b84:	mov    (%rdi,%rax,8),%rax
   140124b88:	jmp    *%rax
   140124b8a:	movzwl 0x0(%rbp),%eax
   140124b8e:	lea    0x2(%rbp),%rdi
   140124b92:	test   %r12b,%r12b
   140124b95:	je     14012a50b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c3b>
   140124b9b:	cmp    $0x1,%r12b
   140124b9f:	je     14012e772 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaea2>
   140124ba5:	lea    0x8(%rsi),%r8
   140124ba9:	cmp    0x38(%rsp),%r8
   140124bae:	jae    14013330a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa3a>
   140124bb4:	mov    0x1d0(%rsp),%rdx
   140124bbc:	movzwl %ax,%eax
   140124bbf:	mov    %rdx,(%rsi)
   140124bc2:	mov    0x1c8(%rsp),%rdx
   140124bca:	mov    %r8,%rsi
   140124bcd:	mov    %rdx,0x1d0(%rsp)
   140124bd5:	movabs $0xfff9000000000000,%rdx
   140124bdf:	or     %rdx,%rax
   140124be2:	mov    %rax,0x1c8(%rsp)
   140124bea:	cmpb   $0x0,0x1040(%rbx)
   140124bf1:	je     14012cf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   140124bf7:	movzbl 0x2(%rbp),%eax
   140124bfb:	lea    0x29b49e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c02:	add    $0x3,%rbp
   140124c06:	mov    (%rdi,%rax,8),%rax
   140124c0a:	jmp    *%rax
   140124c0c:	lea    0x14(%rbp),%rax
   140124c10:	vmovdqu 0x0(%rbp),%xmm0
   140124c15:	mov    0x10(%rbp),%edi
   140124c18:	mov    %rax,0x40(%rsp)
   140124c1d:	test   %r12b,%r12b
   140124c20:	je     14012afad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76dd>
   140124c26:	cmp    $0x1,%r12b
   140124c2a:	je     14012e7f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf29>
   140124c30:	lea    0x8(%rsi),%r8
   140124c34:	cmp    0x38(%rsp),%r8
   140124c39:	jae    140131d1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe44e>
   140124c3f:	vzeroupper
   140124c42:	mov    0x1d0(%rsp),%rax
   140124c4a:	lea    0x1a0(%rsp),%rdx
   140124c52:	mov    %r8,0x60(%rsp)
   140124c57:	lea    0x540(%rsp),%rcx
   140124c5f:	mov    %rax,(%rsi)
   140124c62:	mov    0x1c8(%rsp),%rax
   140124c6a:	mov    %edi,0x690(%rsp)
   140124c71:	mov    %rax,0x1d0(%rsp)
   140124c79:	movl   $0x0,0x694(%rsp)
   140124c84:	mov    0x690(%rsp),%rax
   140124c8c:	vmovdqa %xmm0,0x680(%rsp)
   140124c95:	mov    %rax,0x1b0(%rsp)
   140124c9d:	vmovdqa %xmm0,0x1a0(%rsp)
   140124ca6:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   140124cab:	mov    0x540(%rsp),%rax
   140124cb3:	mov    0x60(%rsp),%rsi
   140124cb8:	mov    %rax,0x1c8(%rsp)
   140124cc0:	cmpb   $0x0,0x1040(%rbx)
   140124cc7:	je     14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140124ccd:	movzbl 0x14(%rbp),%eax
   140124cd1:	lea    0x29b3c8(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124cd8:	add    $0x15,%rbp
   140124cdc:	mov    (%rdi,%rax,8),%rax
   140124ce0:	jmp    *%rax
   140124ce2:	mov    0x0(%rbp),%rax
   140124ce6:	lea    0x8(%rbp),%rdi
   140124cea:	test   %r12b,%r12b
   140124ced:	jne    14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b40>
   140124cf3:	vmovq  %rax,%xmm0
   140124cf8:	mov    $0x1,%r12d
   140124cfe:	movabs $0xfffc000000000000,%rdx
   140124d08:	vucomisd %xmm0,%xmm0
   140124d0c:	cmovp  %rdx,%rax
   140124d10:	mov    %rax,0x1c8(%rsp)
   140124d18:	cmpb   $0x0,0x1040(%rbx)
   140124d1f:	je     14012cf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   140124d25:	movzbl 0x8(%rbp),%eax
   140124d29:	lea    0x29b370(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d30:	add    $0x9,%rbp
   140124d34:	mov    (%rdi,%rax,8),%rax
   140124d38:	jmp    *%rax
   140124d3a:	movzbl 0x0(%rbp),%eax
   140124d3e:	lea    0x1(%rbp),%rdi
   140124d42:	test   %r12b,%r12b
   140124d45:	jne    14012a498 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bc8>
   140124d4b:	test   %al,%al
   140124d4d:	mov    $0x1,%r12d
   140124d53:	movabs $0xfffa000000000000,%rdx
   140124d5d:	movabs $0xfffa000000000001,%rax
   140124d67:	cmovne %rax,%rdx
   140124d6b:	mov    %rdx,0x1c8(%rsp)
   140124d73:	cmpb   $0x0,0x1040(%rbx)
   140124d7a:	je     14012cf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   140124d80:	movzbl 0x1(%rbp),%eax
   140124d84:	lea    0x29b315(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d8b:	add    $0x2,%rbp
   140124d8f:	mov    (%rdi,%rax,8),%rax
   140124d93:	jmp    *%rax
   140124d95:	cmp    $0x1,%r12b
   140124d99:	jne    14012f43b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb6b>
   140124d9f:	xor    %r12d,%r12d
   140124da2:	cmpb   $0x0,0x1040(%rbx)
   140124da9:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124daf:	movzbl 0x0(%rbp),%eax
   140124db3:	lea    0x29b2e6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124dba:	add    $0x1,%rbp
   140124dbe:	mov    (%rdi,%rax,8),%rax
   140124dc2:	jmp    *%rax
   140124dc4:	test   %r12b,%r12b
   140124dc7:	je     14012a463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b93>
   140124dcd:	cmp    $0x1,%r12b
   140124dd1:	je     14012e757 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae87>
   140124dd7:	lea    0x8(%rsi),%r8
   140124ddb:	cmp    0x38(%rsp),%r8
   140124de0:	jae    1401334e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc19>
   140124de6:	mov    0x1d0(%rsp),%rax
   140124dee:	mov    %rax,(%rsi)
   140124df1:	mov    0x1c8(%rsp),%rax
   140124df9:	mov    %r8,%rsi
   140124dfc:	mov    %rax,0x1d0(%rsp)
   140124e04:	cmpb   $0x0,0x1040(%rbx)
   140124e0b:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124e11:	movzbl 0x0(%rbp),%eax
   140124e15:	lea    0x29b284(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e1c:	add    $0x1,%rbp
   140124e20:	mov    (%rdi,%rax,8),%rax
   140124e24:	jmp    *%rax
   140124e26:	movzwl 0x0(%rbp),%eax
   140124e2a:	mov    0x1070(%rbx),%rdx
   140124e31:	lea    0x2(%rbp),%rdi
   140124e35:	sub    0x1068(%rbx),%rdx
   140124e3c:	add    %r13,%rax
   140124e3f:	sar    $0x3,%rdx
   140124e43:	cmp    %rdx,%rax
   140124e46:	jae    140130790 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcec0>
   140124e4c:	test   %r12b,%r12b
   140124e4f:	je     14012a47a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6baa>
   140124e55:	cmp    $0x1,%r12b
   140124e59:	je     14012e550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac80>
   140124e5f:	lea    0x8(%rsi),%r8
   140124e63:	cmp    0x38(%rsp),%r8
   140124e68:	jae    140132d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf446>
   140124e6e:	mov    0x1d0(%rsp),%rdx
   140124e76:	mov    %rdx,(%rsi)
   140124e79:	mov    0x1c8(%rsp),%rdx
   140124e81:	mov    %r8,%rsi
   140124e84:	mov    %rdx,0x1d0(%rsp)
   140124e8c:	mov    0x1068(%rbx),%rdx
   140124e93:	mov    (%rdx,%rax,8),%rax
   140124e97:	mov    %rax,0x1c8(%rsp)
   140124e9f:	cmpb   $0x0,0x1040(%rbx)
   140124ea6:	je     14012cf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   140124eac:	movzbl 0x2(%rbp),%eax
   140124eb0:	lea    0x29b1e9(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124eb7:	add    $0x3,%rbp
   140124ebb:	mov    (%rdi,%rax,8),%rax
   140124ebf:	jmp    *%rax
   140124ec1:	movzwl 0x0(%rbp),%edi
   140124ec5:	lea    0x2(%rbp),%r8
   140124ec9:	add    %r13,%rdi
   140124ecc:	cmp    0x15268(%rbx),%rdi
   140124ed3:	jae    14012fd96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4c6>
   140124ed9:	mov    0x1070(%rbx),%rax
   140124ee0:	sub    0x1068(%rbx),%rax
   140124ee7:	sar    $0x3,%rax
   140124eeb:	cmp    %rax,%rdi
   140124eee:	jae    140130158 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc888>
   140124ef4:	lea    -0x8(%rsi),%rdx
   140124ef8:	lea    0x1c8(%rsp),%rax
   140124f00:	test   %r12b,%r12b
   140124f03:	cmove  %rdx,%rax
   140124f07:	mov    0x1068(%rbx),%rdx
   140124f0e:	mov    (%rax),%rax
   140124f11:	mov    %rax,(%rdx,%rdi,8)
   140124f15:	cmpb   $0x0,0x1040(%rbx)
   140124f1c:	je     14012a31c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   140124f22:	movzbl 0x2(%rbp),%eax
   140124f26:	lea    0x29b173(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f2d:	add    $0x3,%rbp
   140124f31:	mov    (%rdi,%rax,8),%rax
   140124f35:	jmp    *%rax
   140124f37:	mov    0x1088(%rbx),%rdx
   140124f3e:	movzwl 0x0(%rbp),%eax
   140124f42:	lea    0x2(%rbp),%rdi
   140124f46:	sub    0x1080(%rbx),%rdx
   140124f4d:	sar    $0x3,%rdx
   140124f51:	cmp    %rdx,%rax
   140124f54:	jae    14013076e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce9e>
   140124f5a:	test   %r12b,%r12b
   140124f5d:	je     14012a523 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c53>
   140124f63:	cmp    $0x1,%r12b
   140124f67:	je     14012e6e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae15>
   140124f6d:	lea    0x8(%rsi),%r8
   140124f71:	cmp    0x38(%rsp),%r8
   140124f76:	jae    140133447 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb77>
   140124f7c:	mov    0x1d0(%rsp),%rdx
   140124f84:	mov    %rdx,(%rsi)
   140124f87:	mov    0x1c8(%rsp),%rdx
   140124f8f:	mov    %r8,%rsi
   140124f92:	mov    %rdx,0x1d0(%rsp)
   140124f9a:	mov    0x1080(%rbx),%rdx
   140124fa1:	mov    (%rdx,%rax,8),%rax
   140124fa5:	mov    %rax,0x1c8(%rsp)
   140124fad:	cmpb   $0x0,0x1040(%rbx)
   140124fb4:	je     14012cf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   140124fba:	movzbl 0x2(%rbp),%eax
   140124fbe:	lea    0x29b0db(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124fc5:	add    $0x3,%rbp
   140124fc9:	mov    (%rdi,%rax,8),%rax
   140124fcd:	jmp    *%rax
   140124fcf:	mov    0x1088(%rbx),%rax
   140124fd6:	movzwl 0x0(%rbp),%edi
   140124fda:	lea    0x2(%rbp),%r8
   140124fde:	sub    0x1080(%rbx),%rax
   140124fe5:	sar    $0x3,%rax
   140124fe9:	cmp    %rax,%rdi
   140124fec:	jae    140130692 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdc2>
   140124ff2:	lea    -0x8(%rsi),%rdx
   140124ff6:	lea    0x1c8(%rsp),%rax
   140124ffe:	test   %r12b,%r12b
   140125001:	cmove  %rdx,%rax
   140125005:	mov    0x1080(%rbx),%rdx
   14012500c:	mov    (%rax),%rax
   14012500f:	mov    %rax,(%rdx,%rdi,8)
   140125013:	cmpb   $0x0,0x1040(%rbx)
   14012501a:	je     14012a31c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   140125020:	movzbl 0x2(%rbp),%eax
   140125024:	lea    0x29b075(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012502b:	add    $0x3,%rbp
   14012502f:	mov    (%rdi,%rax,8),%rax
   140125033:	jmp    *%rax
   140125035:	movabs $0xfffb000000000000,%rax
   14012503f:	mov    %rax,0x1d8(%rsp)
   140125047:	mov    %rax,0x1e0(%rsp)
   14012504f:	cmp    $0x2,%r12b
   140125053:	jne    140130514 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc44>
   140125059:	mov    0x1c8(%rsp),%rax
   140125061:	mov    $0x1,%r12d
   140125067:	mov    %rax,0x1e0(%rsp)
   14012506f:	mov    0x1d0(%rsp),%rax
   140125077:	mov    %rax,0x1d8(%rsp)
   14012507f:	mov    0x1d8(%rsp),%rax
   140125087:	movabs $0xffff000000000000,%rdx
   140125091:	movabs $0xfff8000000000000,%r8
   14012509b:	mov    %rax,%rcx
   14012509e:	and    %rdx,%rcx
   1401250a1:	cmp    %r8,%rcx
   1401250a4:	je     14012b5a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cd3>
   1401250aa:	lea    0x1e0(%rsp),%rdx
   1401250b2:	lea    0x1d8(%rsp),%rcx
   1401250ba:	vzeroupper
   1401250bd:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   1401250c2:	mov    %rax,0x1c8(%rsp)
   1401250ca:	cmpb   $0x0,0x1040(%rbx)
   1401250d1:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401250d7:	movzbl 0x0(%rbp),%eax
   1401250db:	lea    0x29afbe(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401250e2:	add    $0x1,%rbp
   1401250e6:	mov    (%rdi,%rax,8),%rax
   1401250ea:	jmp    *%rax
   1401250ec:	movabs $0xfffb000000000000,%rax
   1401250f6:	mov    %rax,0x1e8(%rsp)
   1401250fe:	mov    %rax,0x1f0(%rsp)
   140125106:	cmp    $0x2,%r12b
   14012510a:	jne    1401304e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc14>
   140125110:	mov    0x1c8(%rsp),%rax
   140125118:	mov    $0x1,%r12d
   14012511e:	mov    %rax,0x1f0(%rsp)
   140125126:	mov    0x1d0(%rsp),%rax
   14012512e:	mov    %rax,0x1e8(%rsp)
   140125136:	mov    0x1e8(%rsp),%rax
   14012513e:	movabs $0xffff000000000000,%rdx
   140125148:	movabs $0xfff8000000000000,%r8
   140125152:	mov    %rax,%rcx
   140125155:	and    %rdx,%rcx
   140125158:	cmp    %r8,%rcx
   14012515b:	je     14012b4ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c1f>
   140125161:	lea    0x1f0(%rsp),%rdx
   140125169:	lea    0x1e8(%rsp),%rcx
   140125171:	vzeroupper
   140125174:	call   14021a250 <setun::VMValue::sub(setun::VMValue const&) const>
   140125179:	mov    %rax,0x1c8(%rsp)
   140125181:	cmpb   $0x0,0x1040(%rbx)
   140125188:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012518e:	movzbl 0x0(%rbp),%eax
   140125192:	lea    0x29af07(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125199:	add    $0x1,%rbp
   14012519d:	mov    (%rdi,%rax,8),%rax
   1401251a1:	jmp    *%rax
   1401251a3:	movabs $0xfffb000000000000,%rax
   1401251ad:	mov    %rax,0x1f8(%rsp)
   1401251b5:	mov    %rax,0x200(%rsp)
   1401251bd:	cmp    $0x2,%r12b
   1401251c1:	jne    14012ffd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc708>
   1401251c7:	mov    0x1c8(%rsp),%rax
   1401251cf:	mov    $0x1,%r12d
   1401251d5:	mov    %rax,0x200(%rsp)
   1401251dd:	mov    0x1d0(%rsp),%rax
   1401251e5:	mov    %rax,0x1f8(%rsp)
   1401251ed:	mov    0x1f8(%rsp),%rdx
   1401251f5:	movabs $0xffff000000000000,%rax
   1401251ff:	movabs $0xfff8000000000000,%rcx
   140125209:	mov    %rdx,%r8
   14012520c:	and    %rax,%r8
   14012520f:	cmp    %rcx,%r8
   140125212:	je     14012b43d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b6d>
   140125218:	lea    0x200(%rsp),%rdx
   140125220:	lea    0x1f8(%rsp),%rcx
   140125228:	vzeroupper
   14012522b:	call   1402199e0 <setun::VMValue::mul(setun::VMValue const&) const>
   140125230:	mov    %rax,0x1c8(%rsp)
   140125238:	cmpb   $0x0,0x1040(%rbx)
   14012523f:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125245:	movzbl 0x0(%rbp),%eax
   140125249:	lea    0x29ae50(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125250:	add    $0x1,%rbp
   140125254:	mov    (%rdi,%rax,8),%rax
   140125258:	jmp    *%rax
   14012525a:	movabs $0xfffb000000000000,%rax
   140125264:	mov    %rax,0x208(%rsp)
   14012526c:	mov    %rax,0x210(%rsp)
   140125274:	cmp    $0x2,%r12b
   140125278:	jne    140130128 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc858>
   14012527e:	mov    0x1c8(%rsp),%rax
   140125286:	mov    $0x1,%r12d
   14012528c:	mov    %rax,0x210(%rsp)
   140125294:	mov    0x1d0(%rsp),%rax
   14012529c:	mov    %rax,0x208(%rsp)
   1401252a4:	lea    0x210(%rsp),%rdx
   1401252ac:	lea    0x208(%rsp),%rcx
   1401252b4:	vzeroupper
   1401252b7:	call   140219450 <setun::VMValue::div(setun::VMValue const&) const>
   1401252bc:	mov    %rax,0x1c8(%rsp)
   1401252c4:	cmpb   $0x0,0x1040(%rbx)
   1401252cb:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401252d1:	movzbl 0x0(%rbp),%eax
   1401252d5:	lea    0x29adc4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401252dc:	add    $0x1,%rbp
   1401252e0:	mov    (%rdi,%rax,8),%rax
   1401252e4:	jmp    *%rax
   1401252e6:	movabs $0xfffb000000000000,%rax
   1401252f0:	mov    %rax,0x218(%rsp)
   1401252f8:	mov    %rax,0x220(%rsp)
   140125300:	cmp    $0x2,%r12b
   140125304:	jne    1401305d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd08>
   14012530a:	mov    0x1c8(%rsp),%rax
   140125312:	mov    $0x1,%r12d
   140125318:	mov    %rax,0x220(%rsp)
   140125320:	mov    0x1d0(%rsp),%rax
   140125328:	mov    %rax,0x218(%rsp)
   140125330:	lea    0x220(%rsp),%rdx
   140125338:	lea    0x218(%rsp),%rcx
   140125340:	vzeroupper
   140125343:	call   140219840 <setun::VMValue::mod(setun::VMValue const&) const>
   140125348:	mov    %rax,0x1c8(%rsp)
   140125350:	cmpb   $0x0,0x1040(%rbx)
   140125357:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012535d:	movzbl 0x0(%rbp),%eax
   140125361:	lea    0x29ad38(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125368:	add    $0x1,%rbp
   14012536c:	mov    (%rdi,%rax,8),%rax
   140125370:	jmp    *%rax
   140125372:	movabs $0xfffb000000000000,%rax
   14012537c:	mov    %rax,0x228(%rsp)
   140125384:	mov    %rax,0x230(%rsp)
   14012538c:	cmp    $0x2,%r12b
   140125390:	jne    14013023d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc96d>
   140125396:	mov    0x1c8(%rsp),%rax
   14012539e:	mov    $0x1,%r12d
   1401253a4:	mov    %rax,0x230(%rsp)
   1401253ac:	mov    0x1d0(%rsp),%rax
   1401253b4:	mov    %rax,0x228(%rsp)
   1401253bc:	lea    0x230(%rsp),%rdx
   1401253c4:	lea    0x228(%rsp),%rcx
   1401253cc:	vzeroupper
   1401253cf:	call   14021af00 <setun::VMValue::bit_and(setun::VMValue const&) const>
   1401253d4:	mov    %rax,0x1c8(%rsp)
   1401253dc:	cmpb   $0x0,0x1040(%rbx)
   1401253e3:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401253e9:	movzbl 0x0(%rbp),%eax
   1401253ed:	lea    0x29acac(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401253f4:	add    $0x1,%rbp
   1401253f8:	mov    (%rdi,%rax,8),%rax
   1401253fc:	jmp    *%rax
   1401253fe:	movabs $0xfffb000000000000,%rax
   140125408:	mov    %rax,0x238(%rsp)
   140125410:	mov    %rax,0x240(%rsp)
   140125418:	cmp    $0x2,%r12b
   14012541c:	jne    1401305a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccd8>
   140125422:	mov    0x1c8(%rsp),%rax
   14012542a:	mov    $0x1,%r12d
   140125430:	mov    %rax,0x240(%rsp)
   140125438:	mov    0x1d0(%rsp),%rax
   140125440:	mov    %rax,0x238(%rsp)
   140125448:	lea    0x240(%rsp),%rdx
   140125450:	lea    0x238(%rsp),%rcx
   140125458:	vzeroupper
   14012545b:	call   14021a6d0 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140125460:	mov    %rax,0x1c8(%rsp)
   140125468:	cmpb   $0x0,0x1040(%rbx)
   14012546f:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125475:	movzbl 0x0(%rbp),%eax
   140125479:	lea    0x29ac20(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125480:	add    $0x1,%rbp
   140125484:	mov    (%rdi,%rax,8),%rax
   140125488:	jmp    *%rax
   14012548a:	movabs $0xfffb000000000000,%rax
   140125494:	mov    %rax,0x248(%rsp)
   14012549c:	mov    %rax,0x250(%rsp)
   1401254a4:	cmp    $0x2,%r12b
   1401254a8:	jne    14013009e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7ce>
   1401254ae:	mov    0x1c8(%rsp),%rax
   1401254b6:	mov    $0x1,%r12d
   1401254bc:	mov    %rax,0x250(%rsp)
   1401254c4:	mov    0x1d0(%rsp),%rax
   1401254cc:	mov    %rax,0x248(%rsp)
   1401254d4:	lea    0x250(%rsp),%rdx
   1401254dc:	lea    0x248(%rsp),%rcx
   1401254e4:	vzeroupper
   1401254e7:	call   14021b400 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   1401254ec:	mov    %rax,0x1c8(%rsp)
   1401254f4:	cmpb   $0x0,0x1040(%rbx)
   1401254fb:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125501:	movzbl 0x0(%rbp),%eax
   140125505:	lea    0x29ab94(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012550c:	add    $0x1,%rbp
   140125510:	mov    (%rdi,%rax,8),%rax
   140125514:	jmp    *%rax
   140125516:	movabs $0xfffb000000000000,%rax
   140125520:	mov    %rax,0x258(%rsp)
   140125528:	mov    %rax,0x260(%rsp)
   140125530:	cmp    $0x2,%r12b
   140125534:	jne    1401301dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc90d>
   14012553a:	mov    0x1c8(%rsp),%rax
   140125542:	mov    $0x1,%r12d
   140125548:	mov    %rax,0x260(%rsp)
   140125550:	mov    0x1d0(%rsp),%rax
   140125558:	mov    %rax,0x258(%rsp)
   140125560:	lea    0x260(%rsp),%rdx
   140125568:	lea    0x258(%rsp),%rcx
   140125570:	vzeroupper
   140125573:	call   140219e10 <setun::VMValue::shl(setun::VMValue const&) const>
   140125578:	mov    %rax,0x1c8(%rsp)
   140125580:	cmpb   $0x0,0x1040(%rbx)
   140125587:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012558d:	movzbl 0x0(%rbp),%eax
   140125591:	lea    0x29ab08(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125598:	add    $0x1,%rbp
   14012559c:	mov    (%rdi,%rax,8),%rax
   1401255a0:	jmp    *%rax
   1401255a2:	movabs $0xfffb000000000000,%rax
   1401255ac:	mov    %rax,0x268(%rsp)
   1401255b4:	mov    %rax,0x270(%rsp)
   1401255bc:	cmp    $0x2,%r12b
   1401255c0:	jne    14012fd33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc463>
   1401255c6:	mov    0x1c8(%rsp),%rax
   1401255ce:	mov    $0x1,%r12d
   1401255d4:	mov    %rax,0x270(%rsp)
   1401255dc:	mov    0x1d0(%rsp),%rax
   1401255e4:	mov    %rax,0x268(%rsp)
   1401255ec:	lea    0x270(%rsp),%rdx
   1401255f4:	lea    0x268(%rsp),%rcx
   1401255fc:	vzeroupper
   1401255ff:	call   14021a020 <setun::VMValue::shr(setun::VMValue const&) const>
   140125604:	mov    %rax,0x1c8(%rsp)
   14012560c:	cmpb   $0x0,0x1040(%rbx)
   140125613:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125619:	movzbl 0x0(%rbp),%eax
   14012561d:	lea    0x29aa7c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125624:	add    $0x1,%rbp
   140125628:	mov    (%rdi,%rax,8),%rax
   14012562c:	jmp    *%rax
   14012562e:	test   %r12b,%r12b
   140125631:	jne    14012a4ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c1e>
   140125637:	sub    $0x8,%rsi
   14012563b:	mov    $0x1,%r12d
   140125641:	mov    %rsi,%rcx
   140125644:	vzeroupper
   140125647:	call   140219cd0 <setun::VMValue::neg() const>
   14012564c:	mov    %rax,0x1c8(%rsp)
   140125654:	cmpb   $0x0,0x1040(%rbx)
   14012565b:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   140125661:	movzbl 0x0(%rbp),%eax
   140125665:	lea    0x29aa34(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012566c:	add    $0x1,%rbp
   140125670:	mov    (%rdi,%rax,8),%rax
   140125674:	jmp    *%rax
   140125676:	movabs $0xfffb000000000000,%rax
   140125680:	mov    %rax,0x278(%rsp)
   140125688:	mov    %rax,0x280(%rsp)
   140125690:	cmp    $0x2,%r12b
   140125694:	jne    14013006e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc79e>
   14012569a:	mov    0x1c8(%rsp),%rax
   1401256a2:	mov    $0x1,%r12d
   1401256a8:	mov    %rax,0x280(%rsp)
   1401256b0:	mov    0x1d0(%rsp),%rax
   1401256b8:	mov    %rax,0x278(%rsp)
   1401256c0:	mov    0x278(%rsp),%rcx
   1401256c8:	movabs $0xffffffff00000000,%rax
   1401256d2:	movabs $0xfffd000100000000,%rdx
   1401256dc:	and    %rax,%rcx
   1401256df:	cmp    %rdx,%rcx
   1401256e2:	je     14012c7d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f08>
   1401256e8:	and    0x280(%rsp),%rax
   1401256f0:	cmp    %rdx,%rax
   1401256f3:	je     14012c7d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f08>
   1401256f9:	lea    0x278(%rsp),%rcx
   140125701:	vzeroupper
   140125704:	call   14021a530 <setun::VMValue::as_int() const>
   140125709:	lea    0x280(%rsp),%rcx
   140125711:	mov    %rax,%rdi
   140125714:	call   14021a530 <setun::VMValue::as_int() const>
   140125719:	mov    0x278(%rsp),%rcx
   140125721:	movabs $0xffff000000000000,%rdx
   14012572b:	movabs $0xfffa000000000000,%r8
   140125735:	and    %rdx,%rcx
   140125738:	cmp    %r8,%rcx
   14012573b:	jne    14012574e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e7e>
   14012573d:	and    0x280(%rsp),%rdx
   140125745:	cmp    %rcx,%rdx
   140125748:	je     14012e8ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafde>
   14012574e:	cmp    %rax,%rdi
   140125751:	lea    0x680(%rsp),%rcx
   140125759:	cmovle %rdi,%rax
   14012575d:	mov    %rax,%rdx
   140125760:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140125765:	mov    0x680(%rsp),%rax
   14012576d:	mov    %rax,0x1c8(%rsp)
   140125775:	cmpb   $0x0,0x1040(%rbx)
   14012577c:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125782:	movzbl 0x0(%rbp),%eax
   140125786:	lea    0x29a913(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012578d:	add    $0x1,%rbp
   140125791:	mov    (%rdi,%rax,8),%rax
   140125795:	jmp    *%rax
   140125797:	movabs $0xfffb000000000000,%rax
   1401257a1:	mov    %rax,0x288(%rsp)
   1401257a9:	mov    %rax,0x290(%rsp)
   1401257b1:	cmp    $0x2,%r12b
   1401257b5:	jne    1401306eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce1b>
   1401257bb:	mov    0x1c8(%rsp),%rax
   1401257c3:	mov    $0x1,%r12d
   1401257c9:	mov    %rax,0x290(%rsp)
   1401257d1:	mov    0x1d0(%rsp),%rax
   1401257d9:	mov    %rax,0x288(%rsp)
   1401257e1:	mov    0x288(%rsp),%rcx
   1401257e9:	movabs $0xffffffff00000000,%rax
   1401257f3:	movabs $0xfffd000100000000,%rdx
   1401257fd:	and    %rax,%rcx
   140125800:	cmp    %rdx,%rcx
   140125803:	je     14012c83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f6c>
   140125809:	and    0x290(%rsp),%rax
   140125811:	cmp    %rdx,%rax
   140125814:	je     14012c83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f6c>
   14012581a:	lea    0x288(%rsp),%rcx
   140125822:	vzeroupper
   140125825:	call   14021a530 <setun::VMValue::as_int() const>
   14012582a:	lea    0x290(%rsp),%rcx
   140125832:	mov    %rax,%rdi
   140125835:	call   14021a530 <setun::VMValue::as_int() const>
   14012583a:	mov    0x288(%rsp),%rcx
   140125842:	movabs $0xffff000000000000,%rdx
   14012584c:	movabs $0xfffa000000000000,%r8
   140125856:	and    %rdx,%rcx
   140125859:	cmp    %r8,%rcx
   14012585c:	jne    14012586f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f9f>
   14012585e:	and    0x290(%rsp),%rdx
   140125866:	cmp    %rcx,%rdx
   140125869:	je     14012e7cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaefd>
   14012586f:	cmp    %rax,%rdi
   140125872:	lea    0x680(%rsp),%rcx
   14012587a:	cmovge %rdi,%rax
   14012587e:	mov    %rax,%rdx
   140125881:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140125886:	mov    0x680(%rsp),%rax
   14012588e:	mov    %rax,0x1c8(%rsp)
   140125896:	cmpb   $0x0,0x1040(%rbx)
   14012589d:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401258a3:	movzbl 0x0(%rbp),%eax
   1401258a7:	lea    0x29a7f2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401258ae:	add    $0x1,%rbp
   1401258b2:	mov    (%rdi,%rax,8),%rax
   1401258b6:	jmp    *%rax
   1401258b8:	movabs $0xfffb000000000000,%rax
   1401258c2:	mov    %rax,0x298(%rsp)
   1401258ca:	mov    %rax,0x2a0(%rsp)
   1401258d2:	cmp    $0x2,%r12b
   1401258d6:	jne    14012fe78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5a8>
   1401258dc:	mov    0x1c8(%rsp),%rax
   1401258e4:	mov    $0x1,%r12d
   1401258ea:	mov    %rax,0x2a0(%rsp)
   1401258f2:	mov    0x1d0(%rsp),%rax
   1401258fa:	mov    %rax,0x298(%rsp)
   140125902:	mov    %rax,%rcx
   140125905:	movabs $0xffff000000000000,%rax
   14012590f:	mov    %rcx,%r8
   140125912:	movabs $0xfff8000000000000,%r9
   14012591c:	mov    0x2a0(%rsp),%rdx
   140125924:	and    %rax,%r8
   140125927:	cmp    %r9,%r8
   14012592a:	je     14012a691 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dc1>
   140125930:	movabs $0xfffd000000000000,%r10
   14012593a:	cmp    %r10,%r8
   14012593d:	je     14012e3d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab00>
   140125943:	movabs $0xfffc000000000000,%r8
   14012594d:	cmp    %r8,%rcx
   140125950:	je     14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   140125956:	movabs $0xfff7ffffffffffff,%r9
   140125960:	cmp    %rcx,%r9
   140125963:	jae    14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   140125969:	cmp    %rdx,%r9
   14012596c:	jae    14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   140125972:	cmp    %r8,%rdx
   140125975:	je     14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   14012597b:	and    %rdx,%rax
   14012597e:	cmp    %r10,%rax
   140125981:	je     140130b84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2b4>
   140125987:	lea    0x298(%rsp),%rcx
   14012598f:	vzeroupper
   140125992:	call   14021a530 <setun::VMValue::as_int() const>
   140125997:	lea    0x2a0(%rsp),%rcx
   14012599f:	mov    %rax,%rdi
   1401259a2:	call   14021a530 <setun::VMValue::as_int() const>
   1401259a7:	cmp    %rax,%rdi
   1401259aa:	sete   %dil
   1401259ae:	movabs $0xfffa000000000000,%rdx
   1401259b8:	movzbl %dil,%eax
   1401259bc:	add    %rdx,%rax
   1401259bf:	mov    %rax,0x1c8(%rsp)
   1401259c7:	cmpb   $0x0,0x1040(%rbx)
   1401259ce:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401259d4:	movzbl 0x0(%rbp),%eax
   1401259d8:	lea    0x29a6c1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401259df:	add    $0x1,%rbp
   1401259e3:	mov    (%rdi,%rax,8),%rax
   1401259e7:	jmp    *%rax
   1401259e9:	movabs $0xfffb000000000000,%rax
   1401259f3:	mov    %rax,0x2a8(%rsp)
   1401259fb:	mov    %rax,0x2b0(%rsp)
   140125a03:	cmp    $0x2,%r12b
   140125a07:	jne    14012fd63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc493>
   140125a0d:	mov    0x1c8(%rsp),%rax
   140125a15:	mov    $0x1,%r12d
   140125a1b:	mov    %rax,0x2b0(%rsp)
   140125a23:	mov    0x1d0(%rsp),%rax
   140125a2b:	mov    %rax,0x2a8(%rsp)
   140125a33:	mov    %rax,%rdx
   140125a36:	movabs $0xffff000000000000,%rcx
   140125a40:	mov    %rdx,%rax
   140125a43:	movabs $0xfff8000000000000,%r8
   140125a4d:	and    %rcx,%rax
   140125a50:	cmp    %r8,%rax
   140125a53:	je     14012a581 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cb1>
   140125a59:	movabs $0xfffd000000000000,%r8
   140125a63:	cmp    %r8,%rax
   140125a66:	je     14012a574 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ca4>
   140125a6c:	movabs $0xfffc000000000000,%r9
   140125a76:	cmp    %r9,%rdx
   140125a79:	je     14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   140125a7f:	movabs $0xfff7ffffffffffff,%r10
   140125a89:	cmp    %rdx,%r10
   140125a8c:	jae    14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   140125a92:	mov    0x2b0(%rsp),%rax
   140125a9a:	cmp    %r9,%rax
   140125a9d:	je     14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   140125aa3:	cmp    %rax,%r10
   140125aa6:	jae    14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   140125aac:	and    %rax,%rcx
   140125aaf:	cmp    %r8,%rcx
   140125ab2:	je     14013123e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd96e>
   140125ab8:	lea    0x2a8(%rsp),%rcx
   140125ac0:	vzeroupper
   140125ac3:	call   14021a530 <setun::VMValue::as_int() const>
   140125ac8:	lea    0x2b0(%rsp),%rcx
   140125ad0:	mov    %rax,%rdi
   140125ad3:	call   14021a530 <setun::VMValue::as_int() const>
   140125ad8:	cmp    %rax,%rdi
   140125adb:	setne  %al
   140125ade:	movabs $0xfffa000000000000,%rdx
   140125ae8:	movzbl %al,%eax
   140125aeb:	add    %rdx,%rax
   140125aee:	mov    %rax,0x1c8(%rsp)
   140125af6:	cmpb   $0x0,0x1040(%rbx)
   140125afd:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125b03:	movzbl 0x0(%rbp),%eax
   140125b07:	lea    0x29a592(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125b0e:	add    $0x1,%rbp
   140125b12:	mov    (%rdi,%rax,8),%rax
   140125b16:	jmp    *%rax
   140125b18:	movabs $0xfffb000000000000,%rax
   140125b22:	mov    %rax,0x2b8(%rsp)
   140125b2a:	mov    %rax,0x2c0(%rsp)
   140125b32:	cmp    $0x2,%r12b
   140125b36:	jne    14012fede <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc60e>
   140125b3c:	mov    0x1c8(%rsp),%rax
   140125b44:	mov    $0x1,%r12d
   140125b4a:	mov    %rax,0x2c0(%rsp)
   140125b52:	mov    0x1d0(%rsp),%rax
   140125b5a:	mov    %rax,0x2b8(%rsp)
   140125b62:	mov    %rax,%rcx
   140125b65:	movabs $0xffff000000000000,%rdx
   140125b6f:	mov    %rcx,%r8
   140125b72:	movabs $0xfff8000000000000,%r9
   140125b7c:	mov    0x2c0(%rsp),%rax
   140125b84:	and    %rdx,%r8
   140125b87:	cmp    %r9,%r8
   140125b8a:	je     14012a8da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x700a>
   140125b90:	movabs $0xfffd000000000000,%r10
   140125b9a:	cmp    %r10,%r8
   140125b9d:	je     14012e450 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab80>
   140125ba3:	movabs $0xfffc000000000000,%r8
   140125bad:	cmp    %r8,%rcx
   140125bb0:	je     14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   140125bb6:	movabs $0xfff7ffffffffffff,%r9
   140125bc0:	cmp    %rcx,%r9
   140125bc3:	jae    14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   140125bc9:	cmp    %r8,%rax
   140125bcc:	je     14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   140125bd2:	cmp    %rax,%r9
   140125bd5:	jae    14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   140125bdb:	and    %rax,%rdx
   140125bde:	cmp    %r10,%rdx
   140125be1:	je     140130ff1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd721>
   140125be7:	lea    0x2b8(%rsp),%rcx
   140125bef:	vzeroupper
   140125bf2:	call   14021a530 <setun::VMValue::as_int() const>
   140125bf7:	lea    0x2c0(%rsp),%rcx
   140125bff:	mov    %rax,%rdi
   140125c02:	call   14021a530 <setun::VMValue::as_int() const>
   140125c07:	cmp    %rax,%rdi
   140125c0a:	setl   %al
   140125c0d:	movabs $0xfffa000000000000,%rdx
   140125c17:	movzbl %al,%eax
   140125c1a:	add    %rdx,%rax
   140125c1d:	mov    %rax,0x1c8(%rsp)
   140125c25:	cmpb   $0x0,0x1040(%rbx)
   140125c2c:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125c32:	movzbl 0x0(%rbp),%eax
   140125c36:	lea    0x29a463(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125c3d:	add    $0x1,%rbp
   140125c41:	mov    (%rdi,%rax,8),%rax
   140125c45:	jmp    *%rax
   140125c47:	movabs $0xfffb000000000000,%rax
   140125c51:	mov    %rax,0x2c8(%rsp)
   140125c59:	mov    %rax,0x2d0(%rsp)
   140125c61:	cmp    $0x2,%r12b
   140125c65:	jne    14013017a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8aa>
   140125c6b:	mov    0x1c8(%rsp),%rax
   140125c73:	mov    $0x1,%r12d
   140125c79:	mov    %rax,0x2d0(%rsp)
   140125c81:	mov    0x1d0(%rsp),%rax
   140125c89:	mov    %rax,0x2c8(%rsp)
   140125c91:	mov    %rax,%rcx
   140125c94:	movabs $0xffff000000000000,%rdx
   140125c9e:	mov    %rcx,%r8
   140125ca1:	movabs $0xfff8000000000000,%r9
   140125cab:	mov    0x2d0(%rsp),%rax
   140125cb3:	and    %rdx,%r8
   140125cb6:	cmp    %r9,%r8
   140125cb9:	je     14012bb38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8268>
   140125cbf:	movabs $0xfffd000000000000,%r10
   140125cc9:	cmp    %r10,%r8
   140125ccc:	je     14012e348 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa78>
   140125cd2:	movabs $0xfffc000000000000,%r8
   140125cdc:	cmp    %r8,%rcx
   140125cdf:	je     14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   140125ce5:	movabs $0xfff7ffffffffffff,%r9
   140125cef:	cmp    %rcx,%r9
   140125cf2:	jae    14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   140125cf8:	cmp    %r8,%rax
   140125cfb:	je     14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   140125d01:	cmp    %rax,%r9
   140125d04:	jae    14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   140125d0a:	and    %rax,%rdx
   140125d0d:	cmp    %r10,%rdx
   140125d10:	je     140130e18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd548>
   140125d16:	lea    0x2c8(%rsp),%rcx
   140125d1e:	vzeroupper
   140125d21:	call   14021a530 <setun::VMValue::as_int() const>
   140125d26:	lea    0x2d0(%rsp),%rcx
   140125d2e:	mov    %rax,%rdi
   140125d31:	call   14021a530 <setun::VMValue::as_int() const>
   140125d36:	cmp    %rax,%rdi
   140125d39:	setle  %al
   140125d3c:	movabs $0xfffa000000000000,%rdx
   140125d46:	movzbl %al,%eax
   140125d49:	add    %rdx,%rax
   140125d4c:	mov    %rax,0x1c8(%rsp)
   140125d54:	cmpb   $0x0,0x1040(%rbx)
   140125d5b:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125d61:	movzbl 0x0(%rbp),%eax
   140125d65:	lea    0x29a334(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125d6c:	add    $0x1,%rbp
   140125d70:	mov    (%rdi,%rax,8),%rax
   140125d74:	jmp    *%rax
   140125d76:	movabs $0xfffb000000000000,%rax
   140125d80:	mov    %rax,0x2d8(%rsp)
   140125d88:	mov    %rax,0x2e0(%rsp)
   140125d90:	cmp    $0x2,%r12b
   140125d94:	jne    14012feab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5db>
   140125d9a:	mov    0x1c8(%rsp),%rax
   140125da2:	mov    $0x1,%r12d
   140125da8:	mov    %rax,0x2e0(%rsp)
   140125db0:	mov    0x1d0(%rsp),%rax
   140125db8:	mov    %rax,0x2d8(%rsp)
   140125dc0:	mov    %rax,%rcx
   140125dc3:	movabs $0xffff000000000000,%rdx
   140125dcd:	mov    %rcx,%r8
   140125dd0:	movabs $0xfff8000000000000,%r9
   140125dda:	mov    0x2e0(%rsp),%rax
   140125de2:	and    %rdx,%r8
   140125de5:	cmp    %r9,%r8
   140125de8:	je     14012b22b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x795b>
   140125dee:	movabs $0xfffd000000000000,%r10
   140125df8:	cmp    %r10,%r8
   140125dfb:	je     14012e230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa960>
   140125e01:	movabs $0xfff7ffffffffffff,%r8
   140125e0b:	cmp    %rcx,%r8
   140125e0e:	jae    14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   140125e14:	movabs $0xfffc000000000000,%r9
   140125e1e:	cmp    %r9,%rcx
   140125e21:	je     14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   140125e27:	cmp    %rax,%r8
   140125e2a:	jae    14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   140125e30:	cmp    %r9,%rax
   140125e33:	je     14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   140125e39:	and    %rax,%rdx
   140125e3c:	cmp    %r10,%rdx
   140125e3f:	je     1401309e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd118>
   140125e45:	lea    0x2d8(%rsp),%rcx
   140125e4d:	vzeroupper
   140125e50:	call   14021a530 <setun::VMValue::as_int() const>
   140125e55:	lea    0x2e0(%rsp),%rcx
   140125e5d:	mov    %rax,%rdi
   140125e60:	call   14021a530 <setun::VMValue::as_int() const>
   140125e65:	cmp    %rax,%rdi
   140125e68:	setg   %al
   140125e6b:	movabs $0xfffa000000000000,%rdx
   140125e75:	movzbl %al,%eax
   140125e78:	add    %rdx,%rax
   140125e7b:	mov    %rax,0x1c8(%rsp)
   140125e83:	cmpb   $0x0,0x1040(%rbx)
   140125e8a:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125e90:	movzbl 0x0(%rbp),%eax
   140125e94:	lea    0x29a205(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e9b:	add    $0x1,%rbp
   140125e9f:	mov    (%rdi,%rax,8),%rax
   140125ea3:	jmp    *%rax
   140125ea5:	movabs $0xfffb000000000000,%rax
   140125eaf:	mov    %rax,0x2e8(%rsp)
   140125eb7:	mov    %rax,0x2f0(%rsp)
   140125ebf:	cmp    $0x2,%r12b
   140125ec3:	jne    1401307b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcee2>
   140125ec9:	mov    0x1c8(%rsp),%rax
   140125ed1:	mov    $0x1,%r12d
   140125ed7:	mov    %rax,0x2f0(%rsp)
   140125edf:	mov    0x1d0(%rsp),%rax
   140125ee7:	mov    %rax,0x2e8(%rsp)
   140125eef:	mov    %rax,%rcx
   140125ef2:	movabs $0xffff000000000000,%rdx
   140125efc:	mov    %rcx,%r8
   140125eff:	movabs $0xfff8000000000000,%r9
   140125f09:	mov    0x2f0(%rsp),%rax
   140125f11:	and    %rdx,%r8
   140125f14:	cmp    %r9,%r8
   140125f17:	je     14012aece <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75fe>
   140125f1d:	movabs $0xfffd000000000000,%r10
   140125f27:	cmp    %r10,%r8
   140125f2a:	je     14012e2c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9f4>
   140125f30:	movabs $0xfffc000000000000,%r8
   140125f3a:	cmp    %r8,%rcx
   140125f3d:	je     14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   140125f43:	movabs $0xfff7ffffffffffff,%r9
   140125f4d:	cmp    %rcx,%r9
   140125f50:	jae    14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   140125f56:	cmp    %rax,%r9
   140125f59:	jae    14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   140125f5f:	cmp    %r8,%rax
   140125f62:	je     14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   140125f68:	and    %rax,%rdx
   140125f6b:	cmp    %r10,%rdx
   140125f6e:	je     140130c7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3ac>
   140125f74:	lea    0x2e8(%rsp),%rcx
   140125f7c:	vzeroupper
   140125f7f:	call   14021a530 <setun::VMValue::as_int() const>
   140125f84:	lea    0x2f0(%rsp),%rcx
   140125f8c:	mov    %rax,%rdi
   140125f8f:	call   14021a530 <setun::VMValue::as_int() const>
   140125f94:	cmp    %rax,%rdi
   140125f97:	setge  %al
   140125f9a:	movabs $0xfffa000000000000,%rdx
   140125fa4:	movzbl %al,%eax
   140125fa7:	add    %rdx,%rax
   140125faa:	mov    %rax,0x1c8(%rsp)
   140125fb2:	cmpb   $0x0,0x1040(%rbx)
   140125fb9:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125fbf:	movzbl 0x0(%rbp),%eax
   140125fc3:	lea    0x29a0d6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125fca:	add    $0x1,%rbp
   140125fce:	mov    (%rdi,%rax,8),%rax
   140125fd2:	jmp    *%rax
   140125fd4:	movzwl 0x0(%rbp),%edi
   140125fd8:	test   %di,%di
   140125fdb:	js     1401302ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9dc>
   140125fe1:	movswl %di,%eax
   140125fe4:	add    $0x2,%eax
   140125fe7:	cltq
   140125fe9:	add    %rbp,%rax
   140125fec:	cmpb   $0x0,0x1040(%rbx)
   140125ff3:	je     14013029a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9ca>
   140125ff9:	lea    0x1(%rax),%rbp
   140125ffd:	movzbl (%rax),%eax
   140126000:	lea    0x29a099(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126007:	jmp    *(%rdi,%rax,8)
   14012600a:	movzwl 0x0(%rbp),%eax
   14012600e:	lea    0x2(%rbp),%rdi
   140126012:	mov    %ax,0x40(%rsp)
   140126017:	movabs $0xfffb000000000000,%rax
   140126021:	mov    %rax,0x2f8(%rsp)
   140126029:	cmp    $0x1,%r12b
   14012602d:	jne    14013004f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc77f>
   140126033:	mov    0x1c8(%rsp),%rax
   14012603b:	xor    %r12d,%r12d
   14012603e:	mov    %rax,0x2f8(%rsp)
   140126046:	lea    0x2f8(%rsp),%rcx
   14012604e:	vzeroupper
   140126051:	call   14021abc0 <setun::VMValue::as_bool() const>
   140126056:	mov    %eax,%ecx
   140126058:	movswq 0x40(%rsp),%rax
   14012605e:	add    %rdi,%rax
   140126061:	test   %cl,%cl
   140126063:	cmove  %rax,%rdi
   140126067:	cmpb   $0x0,0x1040(%rbx)
   14012606e:	je     14012e532 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac62>
   140126074:	movzbl (%rdi),%eax
   140126077:	lea    0x1(%rdi),%rbp
   14012607b:	lea    0x29a01e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126082:	jmp    *(%rdi,%rax,8)
   140126085:	movzwl 0x2(%rbp),%eax
   140126089:	movzwl 0x0(%rbp),%edi
   14012608d:	add    $0x6,%rbp
   140126091:	mov    %ax,0x40(%rsp)
   140126096:	movzwl -0x2(%rbp),%eax
   14012609a:	mov    %ax,0x60(%rsp)
   14012609f:	movabs $0xfffb000000000000,%rax
   1401260a9:	mov    %rax,0x300(%rsp)
   1401260b1:	cmp    $0x1,%r12b
   1401260b5:	jne    1401300ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7fe>
   1401260bb:	mov    0x1c8(%rsp),%rax
   1401260c3:	xor    %r12d,%r12d
   1401260c6:	mov    %rax,0x300(%rsp)
   1401260ce:	mov    0x300(%rsp),%rdx
   1401260d6:	movabs $0xffff000000000000,%rax
   1401260e0:	movabs $0xfffd000000000000,%rcx
   1401260ea:	and    %rdx,%rax
   1401260ed:	cmp    %rcx,%rax
   1401260f0:	je     14012bd9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84cb>
   1401260f6:	movabs $0xfffc000000000000,%rax
   140126100:	cmp    %rax,%rdx
   140126103:	je     140126118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2848>
   140126105:	movabs $0xfff7ffffffffffff,%rax
   14012610f:	cmp    %rdx,%rax
   140126112:	jb     14012bda9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84d9>
   140126118:	lea    0x300(%rsp),%rcx
   140126120:	vzeroupper
   140126123:	call   14021bc80 <setun::VMValue::as_float() const>
   140126128:	vmovsd 0x2369f0(%rip),%xmm1        # 14035cb20 <CSWTCH.3087+0x220>
   140126130:	vcomisd %xmm0,%xmm1
   140126134:	ja     14012c7ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8efa>
   14012613a:	vcomisd 0x2369e6(%rip),%xmm0        # 14035cb28 <CSWTCH.3087+0x228>
   140126142:	ja     14012bdc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84f8>
   140126148:	movswq 0x40(%rsp),%rax
   14012614e:	lea    -0x2(%rbp,%rax,1),%rax
   140126153:	cmpb   $0x0,0x1040(%rbx)
   14012615a:	je     14012f868 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf98>
   140126160:	lea    0x1(%rax),%rbp
   140126164:	movzbl (%rax),%eax
   140126167:	lea    0x299f32(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012616e:	jmp    *(%rdi,%rax,8)
   140126171:	mov    0x88(%r14),%rdx
   140126178:	mov    0x80(%r14),%rcx
   14012617f:	lea    0x2(%rbp),%rdi
   140126183:	movzwl 0x0(%rbp),%eax
   140126187:	cmp    %rdx,%rcx
   14012618a:	je     14012c762 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e92>
   140126190:	sub    %rcx,%rdx
   140126193:	sar    $0x2,%rdx
   140126197:	cmp    %rdx,%rax
   14012619a:	jae    14013195e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe08e>
   1401261a0:	mov    (%rcx,%rax,4),%edi
   1401261a3:	mov    %edi,0x80(%rsp)
   1401261aa:	movzbl 0x2(%rbp),%ecx
   1401261ae:	lea    0x3(%rbp),%rdi
   1401261b2:	mov    0xa0(%r14),%rdx
   1401261b9:	mov    $0x20,%r8d
   1401261bf:	mov    %rdi,0x60(%rsp)
   1401261c4:	mov    %rcx,0x40(%rsp)
   1401261c9:	mov    %rcx,%rdi
   1401261cc:	mov    0x98(%r14),%rcx
   1401261d3:	sub    %rcx,%rdx
   1401261d6:	sar    $1,%rdx
   1401261d9:	cmp    %rdx,%rax
   1401261dc:	jae    1401261e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2919>
   1401261de:	movzwl (%rcx,%rax,2),%ecx
   1401261e2:	test   %cx,%cx
   1401261e5:	cmovne %rcx,%r8
   1401261e9:	movzbl %dil,%ecx
   1401261ed:	lea    0x8(%rcx),%rdx
   1401261f1:	mov    %r8,%rcx
   1401261f4:	cmp    %r8,%rdx
   1401261f7:	cmovae %rdx,%rcx
   1401261fb:	mov    %rcx,0x40(%rsp)
   140126200:	cmpb   $0x0,0x152c1(%rbx)
   140126207:	je     14012cc63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9393>
   14012620d:	mov    0x152d8(%rbx),%rdx
   140126214:	test   %rdx,%rdx
   140126217:	je     14012cc63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9393>
   14012621d:	and    0x152f8(%rbx),%rax
   140126224:	shl    $0x5,%rax
   140126228:	add    %rdx,%rax
   14012622b:	mov    %rax,0xc0(%rsp)
   140126233:	cmpq   $0x0,(%rax)
   140126237:	je     14012cb78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a8>
   14012623d:	cmpb   $0x0,0x15211(%rbx)
   140126244:	je     14012f32c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba5c>
   14012624a:	mov    0x15268(%rbx),%rax
   140126251:	mov    0x1070(%rbx),%rdx
   140126258:	sub    0x1068(%rbx),%rdx
   14012625f:	mov    %rax,0xa0(%rsp)
   140126267:	add    %rcx,%rax
   14012626a:	sar    $0x3,%rdx
   14012626e:	mov    %rax,0x15268(%rbx)
   140126275:	add    $0x40,%rax
   140126279:	cmp    %rdx,%rax
   14012627c:	jae    140133f79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106a9>
   140126282:	vzeroupper
   140126285:	test   %dil,%dil
   140126288:	je     140130fab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6db>
   14012628e:	mov    0xa0(%rsp),%r11
   140126296:	movzbl %dil,%edx
   14012629a:	movzbl %dil,%r8d
   14012629e:	sub    $0x1,%r8d
   1401262a2:	lea    -0x1(%rdx,%r11,1),%rcx
   1401262a7:	sub    $0x2,%rdx
   1401262ab:	sub    %r8,%rdx
   1401262ae:	lea    0x0(,%rcx,8),%rax
   1401262b6:	mov    0x1068(%rbx),%r8
   1401262bd:	add    %r11,%rdx
   1401262c0:	shl    $0x3,%rdx
   1401262c4:	cmp    $0x1,%r12b
   1401262c8:	je     1401262f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a29>
   1401262ca:	cmp    $0x2,%r12b
   1401262ce:	jne    14012630e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a3e>
   1401262d0:	mov    0x1c8(%rsp),%r9
   1401262d8:	sub    $0x8,%rax
   1401262dc:	mov    %r9,(%r8,%rcx,8)
   1401262e0:	mov    0x1d0(%rsp),%rcx
   1401262e8:	mov    %rcx,0x1c8(%rsp)
   1401262f0:	cmp    %rdx,%rax
   1401262f3:	je     140131c5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe38b>
   1401262f9:	mov    0x1c8(%rsp),%rcx
   140126301:	mov    %rcx,(%r8,%rax,1)
   140126305:	sub    $0x8,%rax
   140126309:	cmp    %rdx,%rax
   14012630c:	je     140126326 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a56>
   14012630e:	mov    %rsi,%rcx
   140126311:	sub    $0x8,%rsi
   140126315:	mov    -0x8(%rcx),%rcx
   140126319:	mov    %rcx,(%r8,%rax,1)
   14012631d:	sub    $0x8,%rax
   140126321:	cmp    %rdx,%rax
   140126324:	jne    14012630e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a3e>
   140126326:	mov    0x1048(%rbx),%rdx
   14012632d:	lea    0x7a0(%rsp),%r12
   140126335:	xor    %eax,%eax
   140126337:	mov    $0x23,%ecx
   14012633c:	mov    %r12,%rdi
   14012633f:	rep stos %rax,(%rdi)
   140126342:	mov    0xa0(%rsp),%rax
   14012634a:	mov    %rdx,0x7c0(%rsp)
   140126352:	movb   $0x1,0x8a8(%rsp)
   14012635a:	lea    (%r8,%rax,8),%rax
   14012635e:	mov    %rbx,0x7a0(%rsp)
   140126366:	mov    %rax,0x7b0(%rsp)
   14012636e:	mov    0x40(%rsp),%rax
   140126373:	mov    %rax,0x7b8(%rsp)
   14012637b:	mov    %rsi,%rax
   14012637e:	sub    %rdx,%rax
   140126381:	mov    0x150c0(%rbx),%rdx
   140126388:	sar    $0x3,%rax
   14012638c:	mov    %rax,0x7c8(%rsp)
   140126394:	xor    %eax,%eax
   140126396:	test   %rdx,%rdx
   140126399:	je     1401263a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ad7>
   14012639b:	lea    (%rdx,%rdx,4),%rax
   14012639f:	lea    0x1098(%rbx,%rax,8),%rax
   1401263a7:	vmovq  %rax,%xmm7
   1401263ac:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401263b6:	mov    %r12,0x152b8(%rbx)
   1401263bd:	vmovdqa %xmm0,0x7d0(%rsp)
   1401263c6:	call   1402128e0 <tersun::VMTelemetryManager::instance()>
   1401263cb:	cmpb   $0x0,(%rax)
   1401263ce:	je     1401263d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b05>
   1401263d0:	addq   $0x1,0x28(%rax)
   1401263d5:	mov    0xc0(%rsp),%rax
   1401263dd:	mov    %r12,%rdx
   1401263e0:	mov    %rbx,%rcx
   1401263e3:	call   *(%rax)
   1401263e5:	mov    0x7d8(%rsp),%rdx
   1401263ed:	mov    %rdx,0x152b8(%rbx)
   1401263f4:	cmpq   $0x0,0x7e8(%rsp)
   1401263fd:	jg     14013383c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff6c>
   140126403:	mov    %rax,0x1c8(%rsp)
   14012640b:	cmpb   $0x0,0x15211(%rbx)
   140126412:	je     140131a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1c4>
   140126418:	mov    0xa0(%rsp),%rax
   140126420:	mov    %rax,0x15268(%rbx)
   140126427:	cmpb   $0x0,0x1040(%rbx)
   14012642e:	je     14012a2a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d0>
   140126434:	movzbl 0x3(%rbp),%eax
   140126438:	mov    $0x1,%r12d
   14012643e:	add    $0x4,%rbp
   140126442:	lea    0x299c57(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126449:	mov    (%rdi,%rax,8),%rax
   14012644d:	jmp    *%rax
   14012644f:	mov    0x150c0(%rbx),%rax
   140126456:	test   %rax,%rax
   140126459:	je     1401244b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   14012645f:	lea    (%rax,%rax,4),%rdx
   140126463:	sub    $0x1,%rax
   140126467:	mov    0x1c8(%rsp),%rbp
   14012646f:	lea    (%rbx,%rdx,8),%rdx
   140126473:	mov    0x1098(%rdx),%rdi
   14012647a:	mov    0x10a0(%rdx),%rcx
   140126481:	mov    0x10a8(%rdx),%r13
   140126488:	mov    %rax,0x150c0(%rbx)
   14012648f:	test   %r12b,%r12b
   140126492:	jne    1401264ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bdb>
   140126494:	movabs $0xfffb000000000000,%rbp
   14012649e:	cmp    %rsi,0x1048(%rbx)
   1401264a5:	jae    1401264ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bdb>
   1401264a7:	mov    -0x8(%rsi),%rbp
   1401264ab:	cmpb   $0x0,0x15211(%rbx)
   1401264b2:	je     14012c74b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e7b>
   1401264b8:	mov    %rcx,0x15268(%rbx)
   1401264bf:	mov    0x1048(%rbx),%rdx
   1401264c6:	mov    %rbp,0x1c8(%rsp)
   1401264ce:	lea    (%rdx,%r13,8),%rsi
   1401264d2:	mov    0x150c0(%rbx),%r13
   1401264d9:	test   %r13,%r13
   1401264dc:	je     1401264eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c1b>
   1401264de:	lea    -0x5(%r13,%r13,4),%rax
   1401264e3:	mov    0x10c8(%rbx,%rax,8),%r13
   1401264eb:	lea    (%r15,%rdi,1),%rax
   1401264ef:	cmpb   $0x0,0x1040(%rbx)
   1401264f6:	je     14012ca94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91c4>
   1401264fc:	lea    0x1(%rax),%rbp
   140126500:	movzbl (%rax),%eax
   140126503:	lea    0x299b96(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012650a:	mov    $0x1,%r12d
   140126510:	mov    (%rdi,%rax,8),%rax
   140126514:	jmp    *%rax
   140126516:	movzwl 0x0(%rbp),%edi
   14012651a:	movzbl 0x2(%rbp),%r9d
   14012651f:	add    $0x3,%rbp
   140126523:	cmp    $0x2,%r12b
   140126527:	je     14012a771 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ea1>
   14012652d:	cmp    $0x1,%r12b
   140126531:	je     14012df91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6c1>
   140126537:	mov    0x15268(%rbx),%r13
   14012653e:	mov    0x1070(%rbx),%rdx
   140126545:	sub    0x1068(%rbx),%rdx
   14012654c:	lea    (%r9,%r13,1),%rcx
   140126550:	sar    $0x3,%rdx
   140126554:	mov    %rcx,0x15268(%rbx)
   14012655b:	add    $0x40,%rcx
   14012655f:	cmp    %rdx,%rcx
   140126562:	jae    14013071b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce4b>
   140126568:	mov    0x1048(%rbx),%rdx
   14012656f:	mov    %rsi,%r11
   140126572:	mov    0x150c0(%rbx),%rax
   140126579:	sub    %r15,%rbp
   14012657c:	sub    %rdx,%r11
   14012657f:	mov    %r11,%r10
   140126582:	sar    $0x3,%r10
   140126586:	cmp    $0x7ff,%rax
   14012658c:	ja     140138798 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec8>
   140126592:	lea    0x1(%rax),%rcx
   140126596:	lea    (%rax,%rax,4),%rax
   14012659a:	mov    %rcx,0x150c0(%rbx)
   1401265a1:	mov    0x15270(%rbx),%rcx
   1401265a8:	mov    %r9,0x10d8(%rbx,%rax,8)
   1401265b0:	mov    0x152a0(%rbx),%r9
   1401265b7:	mov    %rbp,0x10c0(%rbx,%rax,8)
   1401265bf:	mov    %r13,0x10c8(%rbx,%rax,8)
   1401265c7:	mov    %r10,0x10d0(%rbx,%rax,8)
   1401265cf:	mov    %rdi,0x10e0(%rbx,%rax,8)
   1401265d7:	cmp    %r9,0x68(%rcx)
   1401265db:	jae    140130657 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd87>
   1401265e1:	lea    (%r15,%rdi,1),%rax
   1401265e5:	cmpb   $0x0,0x1040(%rbx)
   1401265ec:	je     14012e4d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac00>
   1401265f2:	lea    0x1(%rax),%rbp
   1401265f6:	movzbl (%rax),%eax
   1401265f9:	lea    0x299aa0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126600:	jmp    *(%rdi,%rax,8)
   140126603:	mov    0x15268(%rbx),%r13
   14012660a:	movzbl 0x2(%rbp),%r9d
   14012660f:	lea    0x3(%rbp),%rax
   140126613:	mov    0x1070(%rbx),%rdx
   14012661a:	sub    0x1068(%rbx),%rdx
   140126621:	lea    (%r9,%r13,1),%rcx
   140126625:	movzwl 0x0(%rbp),%r11d
   14012662a:	sar    $0x3,%rdx
   14012662e:	mov    %rcx,0x15268(%rbx)
   140126635:	add    $0x40,%rcx
   140126639:	cmp    %rdx,%rcx
   14012663c:	jae    14012f82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf5d>
   140126642:	mov    0x1068(%rbx),%rdx
   140126649:	cmp    $0x1,%r12b
   14012664d:	je     14012b429 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b59>
   140126653:	cmp    $0x2,%r12b
   140126657:	je     14012ded4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa604>
   14012665d:	mov    -0x8(%rsi),%rcx
   140126661:	sub    $0x8,%rsi
   140126665:	mov    %rcx,(%rdx,%r13,8)
   140126669:	mov    0x1048(%rbx),%rdx
   140126670:	mov    %rsi,%r10
   140126673:	mov    0x150c0(%rbx),%rcx
   14012667a:	sub    %r15,%rax
   14012667d:	movzwl %r11w,%ebp
   140126681:	sub    %rdx,%r10
   140126684:	mov    %r10,%rdi
   140126687:	sar    $0x3,%rdi
   14012668b:	cmp    $0x7ff,%rcx
   140126692:	ja     140138798 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec8>
   140126698:	lea    0x1(%rcx),%r11
   14012669c:	lea    (%rcx,%rcx,4),%rcx
   1401266a0:	mov    %r11,0x150c0(%rbx)
   1401266a7:	mov    %r9,0x10d8(%rbx,%rcx,8)
   1401266af:	mov    0x152a0(%rbx),%r9
   1401266b6:	mov    %rax,0x10c0(%rbx,%rcx,8)
   1401266be:	mov    %r13,0x10c8(%rbx,%rcx,8)
   1401266c6:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   1401266ce:	mov    %rbp,0x10e0(%rbx,%rcx,8)
   1401266d6:	mov    0x15270(%rbx),%rcx
   1401266dd:	cmp    %r9,0x68(%rcx)
   1401266e1:	jae    14012fde8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc518>
   1401266e7:	lea    (%r15,%rbp,1),%rax
   1401266eb:	cmpb   $0x0,0x1040(%rbx)
   1401266f2:	je     14012e4d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac00>
   1401266f8:	lea    0x1(%rax),%rbp
   1401266fc:	movzbl (%rax),%eax
   1401266ff:	lea    0x29999a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126706:	jmp    *(%rdi,%rax,8)
   140126709:	mov    0x150c0(%rbx),%rax
   140126710:	test   %rax,%rax
   140126713:	je     1401244b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   140126719:	lea    -0x1(%rax),%r13
   14012671d:	test   %r12b,%r12b
   140126720:	jne    14012672e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e5e>
   140126722:	mov    -0x8(%rsi),%rdx
   140126726:	mov    %rdx,0x1c8(%rsp)
   14012672e:	lea    (%rax,%rax,4),%rax
   140126732:	mov    0x1048(%rbx),%rdx
   140126739:	lea    (%rbx,%rax,8),%rcx
   14012673d:	mov    0x10a0(%rcx),%rax
   140126744:	mov    %rax,0x15268(%rbx)
   14012674b:	mov    0x10a8(%rcx),%rax
   140126752:	lea    (%rdx,%rax,8),%rsi
   140126756:	mov    0x1098(%rcx),%rax
   14012675d:	mov    %r13,0x150c0(%rbx)
   140126764:	test   %r13,%r13
   140126767:	jne    14012a558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c88>
   14012676d:	add    %r15,%rax
   140126770:	cmpb   $0x0,0x1040(%rbx)
   140126777:	je     14012ca94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91c4>
   14012677d:	lea    0x1(%rax),%rbp
   140126781:	movzbl (%rax),%eax
   140126784:	lea    0x299915(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012678b:	mov    $0x1,%r12d
   140126791:	mov    (%rdi,%rax,8),%rax
   140126795:	jmp    *%rax
   140126797:	cmp    $0x2,%r12b
   14012679b:	je     14012b6bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ded>
   1401267a1:	cmp    $0x1,%r12b
   1401267a5:	je     14012e0e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa815>
   1401267ab:	mov    0x1048(%rbx),%rdx
   1401267b2:	mov    0x1050(%rbx),%rax
   1401267b9:	vzeroupper
   1401267bc:	sub    %rdx,%rsi
   1401267bf:	sub    %r15,%rbp
   1401267c2:	sub    %rdx,%rax
   1401267c5:	mov    %rsi,%rdi
   1401267c8:	mov    %rbp,0x1038(%rbx)
   1401267cf:	sar    $0x3,%rdi
   1401267d3:	cmp    %rsi,%rax
   1401267d6:	jb     14012d4a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd0>
   1401267dc:	vmovdqa 0x2362fc(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401267e4:	mov    %rdi,0x1060(%rbx)
   1401267eb:	mov    %r14,%rdx
   1401267ee:	mov    %rbx,%rcx
   1401267f1:	movb   $0x0,0x153a0(%rbx)
   1401267f8:	vmovdqa %xmm0,0x15390(%rbx)
   140126800:	call   140107960 <setun::VM::handle_push_string(setun::Chunk const&)>
   140126805:	mov    0x1060(%rbx),%rax
   14012680c:	mov    0x1048(%rbx),%rdx
   140126813:	mov    0x1038(%rbx),%rcx
   14012681a:	mov    0x150c0(%rbx),%r13
   140126821:	lea    (%rdx,%rax,8),%rsi
   140126825:	mov    0x1050(%rbx),%rax
   14012682c:	add    %r15,%rcx
   14012682f:	mov    %rax,0x38(%rsp)
   140126834:	test   %r13,%r13
   140126837:	je     140126846 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f76>
   140126839:	lea    -0x5(%r13,%r13,4),%r8
   14012683e:	mov    0x10c8(%rbx,%r8,8),%r13
   140126846:	cmpb   $0x0,0x1040(%rbx)
   14012684d:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126853:	movzbl (%rcx),%eax
   140126856:	lea    0x299843(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012685d:	lea    0x1(%rcx),%rbp
   140126861:	xor    %r12d,%r12d
   140126864:	mov    (%rdi,%rax,8),%rax
   140126868:	jmp    *%rax
   14012686a:	cmp    $0x2,%r12b
   14012686e:	je     14012a9f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7126>
   140126874:	cmp    $0x1,%r12b
   140126878:	je     14012db52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa282>
   14012687e:	mov    0x1048(%rbx),%rdx
   140126885:	mov    0x1050(%rbx),%rax
   14012688c:	vzeroupper
   14012688f:	sub    %rdx,%rsi
   140126892:	sub    %r15,%rbp
   140126895:	sub    %rdx,%rax
   140126898:	mov    %rsi,%rdi
   14012689b:	mov    %rbp,0x1038(%rbx)
   1401268a2:	sar    $0x3,%rdi
   1401268a6:	cmp    %rsi,%rax
   1401268a9:	jb     14012d2a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99d4>
   1401268af:	vmovdqa 0x236229(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401268b7:	mov    %rdi,0x1060(%rbx)
   1401268be:	mov    %r14,%rdx
   1401268c1:	mov    %rbx,%rcx
   1401268c4:	movb   $0x0,0x153a0(%rbx)
   1401268cb:	vmovdqa %xmm0,0x15390(%rbx)
   1401268d3:	call   140107fd0 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   1401268d8:	mov    0x1060(%rbx),%rax
   1401268df:	mov    0x1048(%rbx),%rdx
   1401268e6:	mov    0x1038(%rbx),%rcx
   1401268ed:	mov    0x150c0(%rbx),%r13
   1401268f4:	lea    (%rdx,%rax,8),%rsi
   1401268f8:	mov    0x1050(%rbx),%rax
   1401268ff:	add    %r15,%rcx
   140126902:	mov    %rax,0x38(%rsp)
   140126907:	test   %r13,%r13
   14012690a:	je     140126919 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3049>
   14012690c:	lea    -0x5(%r13,%r13,4),%r8
   140126911:	mov    0x10c8(%rbx,%r8,8),%r13
   140126919:	cmpb   $0x0,0x1040(%rbx)
   140126920:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126926:	movzbl (%rcx),%eax
   140126929:	lea    0x299770(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126930:	lea    0x1(%rcx),%rbp
   140126934:	xor    %r12d,%r12d
   140126937:	mov    (%rdi,%rax,8),%rax
   14012693b:	jmp    *%rax
   14012693d:	cmp    $0x2,%r12b
   140126941:	je     14012b765 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e95>
   140126947:	cmp    $0x1,%r12b
   14012694b:	je     14012ddb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4e1>
   140126951:	mov    0x1048(%rbx),%rdx
   140126958:	mov    0x1050(%rbx),%rax
   14012695f:	vzeroupper
   140126962:	sub    %rdx,%rsi
   140126965:	sub    %r15,%rbp
   140126968:	sub    %rdx,%rax
   14012696b:	mov    %rsi,%rdi
   14012696e:	mov    %rbp,0x1038(%rbx)
   140126975:	sar    $0x3,%rdi
   140126979:	cmp    %rsi,%rax
   14012697c:	jb     14012d5b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ce1>
   140126982:	vmovdqa 0x236156(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012698a:	mov    %rdi,0x1060(%rbx)
   140126991:	mov    %r14,%rdx
   140126994:	mov    %rbx,%rcx
   140126997:	movb   $0x0,0x153a0(%rbx)
   14012699e:	vmovdqa %xmm0,0x15390(%rbx)
   1401269a6:	call   14010c9d0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   1401269ab:	mov    0x1060(%rbx),%rax
   1401269b2:	mov    0x1048(%rbx),%rdx
   1401269b9:	mov    0x1038(%rbx),%rcx
   1401269c0:	mov    0x150c0(%rbx),%r13
   1401269c7:	lea    (%rdx,%rax,8),%rsi
   1401269cb:	mov    0x1050(%rbx),%rax
   1401269d2:	add    %r15,%rcx
   1401269d5:	mov    %rax,0x38(%rsp)
   1401269da:	test   %r13,%r13
   1401269dd:	je     1401269ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x311c>
   1401269df:	lea    -0x5(%r13,%r13,4),%r8
   1401269e4:	mov    0x10c8(%rbx,%r8,8),%r13
   1401269ec:	cmpb   $0x0,0x1040(%rbx)
   1401269f3:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401269f9:	movzbl (%rcx),%eax
   1401269fc:	lea    0x29969d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126a03:	lea    0x1(%rcx),%rbp
   140126a07:	xor    %r12d,%r12d
   140126a0a:	mov    (%rdi,%rax,8),%rax
   140126a0e:	jmp    *%rax
   140126a10:	cmp    $0x2,%r12b
   140126a14:	je     14012b7a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ed4>
   140126a1a:	cmp    $0x1,%r12b
   140126a1e:	je     14012e082 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7b2>
   140126a24:	mov    0x1048(%rbx),%rdx
   140126a2b:	mov    0x1050(%rbx),%rax
   140126a32:	vzeroupper
   140126a35:	sub    %rdx,%rsi
   140126a38:	sub    %r15,%rbp
   140126a3b:	sub    %rdx,%rax
   140126a3e:	mov    %rsi,%rdi
   140126a41:	mov    %rbp,0x1038(%rbx)
   140126a48:	sar    $0x3,%rdi
   140126a4c:	cmp    %rsi,%rax
   140126a4f:	jb     14012d5c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cf6>
   140126a55:	vmovdqa 0x236083(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126a5d:	mov    %rdi,0x1060(%rbx)
   140126a64:	mov    %r14,%rdx
   140126a67:	mov    %rbx,%rcx
   140126a6a:	movb   $0x0,0x153a0(%rbx)
   140126a71:	vmovdqa %xmm0,0x15390(%rbx)
   140126a79:	call   140103b40 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140126a7e:	mov    0x1060(%rbx),%rax
   140126a85:	mov    0x1048(%rbx),%rdx
   140126a8c:	mov    0x1038(%rbx),%rcx
   140126a93:	mov    0x150c0(%rbx),%r13
   140126a9a:	lea    (%rdx,%rax,8),%rsi
   140126a9e:	mov    0x1050(%rbx),%rax
   140126aa5:	add    %r15,%rcx
   140126aa8:	mov    %rax,0x38(%rsp)
   140126aad:	test   %r13,%r13
   140126ab0:	je     140126abf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31ef>
   140126ab2:	lea    -0x5(%r13,%r13,4),%r8
   140126ab7:	mov    0x10c8(%rbx,%r8,8),%r13
   140126abf:	cmpb   $0x0,0x1040(%rbx)
   140126ac6:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126acc:	movzbl (%rcx),%eax
   140126acf:	lea    0x2995ca(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ad6:	lea    0x1(%rcx),%rbp
   140126ada:	xor    %r12d,%r12d
   140126add:	mov    (%rdi,%rax,8),%rax
   140126ae1:	jmp    *%rax
   140126ae3:	cmp    $0x2,%r12b
   140126ae7:	je     14012b105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7835>
   140126aed:	cmp    $0x1,%r12b
   140126af1:	je     14012dfb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6e6>
   140126af7:	mov    0x1048(%rbx),%rdx
   140126afe:	mov    0x1050(%rbx),%rax
   140126b05:	vzeroupper
   140126b08:	sub    %rdx,%rsi
   140126b0b:	sub    %r15,%rbp
   140126b0e:	sub    %rdx,%rax
   140126b11:	mov    %rsi,%rdi
   140126b14:	mov    %rbp,0x1038(%rbx)
   140126b1b:	sar    $0x3,%rdi
   140126b1f:	cmp    %rsi,%rax
   140126b22:	jb     14012d59c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ccc>
   140126b28:	vmovdqa 0x235fb0(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126b30:	mov    %rdi,0x1060(%rbx)
   140126b37:	mov    %r14,%rdx
   140126b3a:	mov    %rbx,%rcx
   140126b3d:	movb   $0x0,0x153a0(%rbx)
   140126b44:	vmovdqa %xmm0,0x15390(%rbx)
   140126b4c:	call   1401020e0 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   140126b51:	mov    0x1060(%rbx),%rax
   140126b58:	mov    0x1048(%rbx),%rdx
   140126b5f:	mov    0x1038(%rbx),%rcx
   140126b66:	mov    0x150c0(%rbx),%r13
   140126b6d:	lea    (%rdx,%rax,8),%rsi
   140126b71:	mov    0x1050(%rbx),%rax
   140126b78:	add    %r15,%rcx
   140126b7b:	mov    %rax,0x38(%rsp)
   140126b80:	test   %r13,%r13
   140126b83:	je     140126b92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32c2>
   140126b85:	lea    -0x5(%r13,%r13,4),%r8
   140126b8a:	mov    0x10c8(%rbx,%r8,8),%r13
   140126b92:	cmpb   $0x0,0x1040(%rbx)
   140126b99:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126b9f:	movzbl (%rcx),%eax
   140126ba2:	lea    0x2994f7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ba9:	lea    0x1(%rcx),%rbp
   140126bad:	xor    %r12d,%r12d
   140126bb0:	mov    (%rdi,%rax,8),%rax
   140126bb4:	jmp    *%rax
   140126bb6:	cmp    $0x2,%r12b
   140126bba:	je     14012b144 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7874>
   140126bc0:	cmp    $0x1,%r12b
   140126bc4:	je     14012d954 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa084>
   140126bca:	mov    0x1048(%rbx),%rdx
   140126bd1:	mov    0x1050(%rbx),%rax
   140126bd8:	vzeroupper
   140126bdb:	sub    %rdx,%rsi
   140126bde:	sub    %r15,%rbp
   140126be1:	sub    %rdx,%rax
   140126be4:	mov    %rsi,%rdi
   140126be7:	mov    %rbp,0x1038(%rbx)
   140126bee:	sar    $0x3,%rdi
   140126bf2:	cmp    %rsi,%rax
   140126bf5:	jb     14012d48b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bbb>
   140126bfb:	vmovdqa 0x235edd(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126c03:	mov    %rdi,0x1060(%rbx)
   140126c0a:	mov    %r14,%rdx
   140126c0d:	mov    %rbx,%rcx
   140126c10:	movb   $0x0,0x153a0(%rbx)
   140126c17:	vmovdqa %xmm0,0x15390(%rbx)
   140126c1f:	call   140103200 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   140126c24:	mov    0x1060(%rbx),%rax
   140126c2b:	mov    0x1048(%rbx),%rdx
   140126c32:	mov    0x1038(%rbx),%rcx
   140126c39:	mov    0x150c0(%rbx),%r13
   140126c40:	lea    (%rdx,%rax,8),%rsi
   140126c44:	mov    0x1050(%rbx),%rax
   140126c4b:	add    %r15,%rcx
   140126c4e:	mov    %rax,0x38(%rsp)
   140126c53:	test   %r13,%r13
   140126c56:	je     140126c65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3395>
   140126c58:	lea    -0x5(%r13,%r13,4),%r8
   140126c5d:	mov    0x10c8(%rbx,%r8,8),%r13
   140126c65:	cmpb   $0x0,0x1040(%rbx)
   140126c6c:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126c72:	movzbl (%rcx),%eax
   140126c75:	lea    0x299424(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126c7c:	lea    0x1(%rcx),%rbp
   140126c80:	xor    %r12d,%r12d
   140126c83:	mov    (%rdi,%rax,8),%rax
   140126c87:	jmp    *%rax
   140126c89:	cmp    $0x2,%r12b
   140126c8d:	je     14012b183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78b3>
   140126c93:	cmp    $0x1,%r12b
   140126c97:	je     14012db1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa24f>
   140126c9d:	mov    0x1048(%rbx),%rdx
   140126ca4:	mov    0x1050(%rbx),%rax
   140126cab:	vzeroupper
   140126cae:	sub    %rdx,%rsi
   140126cb1:	sub    %r15,%rbp
   140126cb4:	sub    %rdx,%rax
   140126cb7:	mov    %rsi,%rdi
   140126cba:	mov    %rbp,0x1038(%rbx)
   140126cc1:	sar    $0x3,%rdi
   140126cc5:	cmp    %rsi,%rax
   140126cc8:	jb     14012d461 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b91>
   140126cce:	vmovdqa 0x235e0a(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126cd6:	mov    %rdi,0x1060(%rbx)
   140126cdd:	mov    %r14,%rdx
   140126ce0:	mov    %rbx,%rcx
   140126ce3:	movb   $0x0,0x153a0(%rbx)
   140126cea:	vmovdqa %xmm0,0x15390(%rbx)
   140126cf2:	call   14010b980 <setun::VM::handle_print(setun::Chunk const&)>
   140126cf7:	mov    0x1060(%rbx),%rax
   140126cfe:	mov    0x1048(%rbx),%rdx
   140126d05:	mov    0x1038(%rbx),%rcx
   140126d0c:	mov    0x150c0(%rbx),%r13
   140126d13:	lea    (%rdx,%rax,8),%rsi
   140126d17:	mov    0x1050(%rbx),%rax
   140126d1e:	add    %r15,%rcx
   140126d21:	mov    %rax,0x38(%rsp)
   140126d26:	test   %r13,%r13
   140126d29:	je     140126d38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3468>
   140126d2b:	lea    -0x5(%r13,%r13,4),%r8
   140126d30:	mov    0x10c8(%rbx,%r8,8),%r13
   140126d38:	cmpb   $0x0,0x1040(%rbx)
   140126d3f:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126d45:	movzbl (%rcx),%eax
   140126d48:	lea    0x299351(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d4f:	lea    0x1(%rcx),%rbp
   140126d53:	xor    %r12d,%r12d
   140126d56:	mov    (%rdi,%rax,8),%rax
   140126d5a:	jmp    *%rax
   140126d5c:	cmp    $0x2,%r12b
   140126d60:	je     14012bd1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x844d>
   140126d66:	cmp    $0x1,%r12b
   140126d6a:	je     14012d9ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa11d>
   140126d70:	mov    0x1048(%rbx),%rdx
   140126d77:	mov    0x1050(%rbx),%rax
   140126d7e:	vzeroupper
   140126d81:	sub    %rdx,%rsi
   140126d84:	sub    %r15,%rbp
   140126d87:	sub    %rdx,%rax
   140126d8a:	mov    %rsi,%rdi
   140126d8d:	mov    %rbp,0x1038(%rbx)
   140126d94:	sar    $0x3,%rdi
   140126d98:	cmp    %rsi,%rax
   140126d9b:	jb     14012d3e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b13>
   140126da1:	vmovdqa 0x235d37(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126da9:	mov    %rdi,0x1060(%rbx)
   140126db0:	mov    %r14,%rdx
   140126db3:	mov    %rbx,%rcx
   140126db6:	movb   $0x0,0x153a0(%rbx)
   140126dbd:	vmovdqa %xmm0,0x15390(%rbx)
   140126dc5:	call   140104b10 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140126dca:	mov    0x1060(%rbx),%rax
   140126dd1:	mov    0x1048(%rbx),%rdx
   140126dd8:	mov    0x1038(%rbx),%rcx
   140126ddf:	mov    0x150c0(%rbx),%r13
   140126de6:	lea    (%rdx,%rax,8),%rsi
   140126dea:	mov    0x1050(%rbx),%rax
   140126df1:	add    %r15,%rcx
   140126df4:	mov    %rax,0x38(%rsp)
   140126df9:	test   %r13,%r13
   140126dfc:	je     140126e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x353b>
   140126dfe:	lea    -0x5(%r13,%r13,4),%r8
   140126e03:	mov    0x10c8(%rbx,%r8,8),%r13
   140126e0b:	cmpb   $0x0,0x1040(%rbx)
   140126e12:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126e18:	movzbl (%rcx),%eax
   140126e1b:	lea    0x29927e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126e22:	lea    0x1(%rcx),%rbp
   140126e26:	xor    %r12d,%r12d
   140126e29:	mov    (%rdi,%rax,8),%rax
   140126e2d:	jmp    *%rax
   140126e2f:	cmp    $0x2,%r12b
   140126e33:	je     14012aa74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71a4>
   140126e39:	cmp    $0x1,%r12b
   140126e3d:	je     14012da86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1b6>
   140126e43:	mov    0x1048(%rbx),%rdx
   140126e4a:	mov    0x1050(%rbx),%rax
   140126e51:	vzeroupper
   140126e54:	sub    %rdx,%rsi
   140126e57:	sub    %r15,%rbp
   140126e5a:	sub    %rdx,%rax
   140126e5d:	mov    %rsi,%rdi
   140126e60:	mov    %rbp,0x1038(%rbx)
   140126e67:	sar    $0x3,%rdi
   140126e6b:	cmp    %rsi,%rax
   140126e6e:	jb     14012d3f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b28>
   140126e74:	vmovdqa 0x235c64(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126e7c:	mov    %rdi,0x1060(%rbx)
   140126e83:	mov    %r14,%rdx
   140126e86:	mov    %rbx,%rcx
   140126e89:	movb   $0x0,0x153a0(%rbx)
   140126e90:	vmovdqa %xmm0,0x15390(%rbx)
   140126e98:	call   14010c610 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   140126e9d:	mov    0x1060(%rbx),%rax
   140126ea4:	mov    0x1048(%rbx),%rdx
   140126eab:	mov    0x1038(%rbx),%rcx
   140126eb2:	mov    0x150c0(%rbx),%r13
   140126eb9:	lea    (%rdx,%rax,8),%rsi
   140126ebd:	mov    0x1050(%rbx),%rax
   140126ec4:	add    %r15,%rcx
   140126ec7:	mov    %rax,0x38(%rsp)
   140126ecc:	test   %r13,%r13
   140126ecf:	je     140126ede <setun::VM::run_optimized(setun::OptimizedChunk&)+0x360e>
   140126ed1:	lea    -0x5(%r13,%r13,4),%r8
   140126ed6:	mov    0x10c8(%rbx,%r8,8),%r13
   140126ede:	cmpb   $0x0,0x1040(%rbx)
   140126ee5:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126eeb:	movzbl (%rcx),%eax
   140126eee:	lea    0x2991ab(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ef5:	lea    0x1(%rcx),%rbp
   140126ef9:	xor    %r12d,%r12d
   140126efc:	mov    (%rdi,%rax,8),%rax
   140126f00:	jmp    *%rax
   140126f02:	cmp    $0x2,%r12b
   140126f06:	je     14012bcde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x840e>
   140126f0c:	cmp    $0x1,%r12b
   140126f10:	je     14012d921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa051>
   140126f16:	mov    0x1048(%rbx),%rdx
   140126f1d:	mov    0x1050(%rbx),%rax
   140126f24:	vzeroupper
   140126f27:	sub    %rdx,%rsi
   140126f2a:	sub    %r15,%rbp
   140126f2d:	sub    %rdx,%rax
   140126f30:	mov    %rsi,%rdi
   140126f33:	mov    %rbp,0x1038(%rbx)
   140126f3a:	sar    $0x3,%rdi
   140126f3e:	cmp    %rsi,%rax
   140126f41:	jb     14012d476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ba6>
   140126f47:	vmovdqa 0x235b91(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140126f4f:	mov    %rdi,0x1060(%rbx)
   140126f56:	mov    %r14,%rdx
   140126f59:	mov    %rbx,%rcx
   140126f5c:	movb   $0x0,0x153a0(%rbx)
   140126f63:	vmovdqa %xmm0,0x15390(%rbx)
   140126f6b:	call   1401004e0 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   140126f70:	mov    0x1060(%rbx),%rax
   140126f77:	mov    0x1048(%rbx),%rdx
   140126f7e:	mov    0x1038(%rbx),%rcx
   140126f85:	mov    0x150c0(%rbx),%r13
   140126f8c:	lea    (%rdx,%rax,8),%rsi
   140126f90:	mov    0x1050(%rbx),%rax
   140126f97:	add    %r15,%rcx
   140126f9a:	mov    %rax,0x38(%rsp)
   140126f9f:	test   %r13,%r13
   140126fa2:	je     140126fb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e1>
   140126fa4:	lea    -0x5(%r13,%r13,4),%r8
   140126fa9:	mov    0x10c8(%rbx,%r8,8),%r13
   140126fb1:	cmpb   $0x0,0x1040(%rbx)
   140126fb8:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140126fbe:	movzbl (%rcx),%eax
   140126fc1:	lea    0x2990d8(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126fc8:	lea    0x1(%rcx),%rbp
   140126fcc:	xor    %r12d,%r12d
   140126fcf:	mov    (%rdi,%rax,8),%rax
   140126fd3:	jmp    *%rax
   140126fd5:	cmp    $0x2,%r12b
   140126fd9:	je     14012b7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f13>
   140126fdf:	cmp    $0x1,%r12b
   140126fe3:	je     14012daec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa21c>
   140126fe9:	mov    0x1048(%rbx),%rdx
   140126ff0:	mov    0x1050(%rbx),%rax
   140126ff7:	vzeroupper
   140126ffa:	sub    %rdx,%rsi
   140126ffd:	sub    %r15,%rbp
   140127000:	sub    %rdx,%rax
   140127003:	mov    %rsi,%rdi
   140127006:	mov    %rbp,0x1038(%rbx)
   14012700d:	sar    $0x3,%rdi
   140127011:	cmp    %rsi,%rax
   140127014:	jb     14012d40d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b3d>
   14012701a:	vmovdqa 0x235abe(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140127022:	mov    %rdi,0x1060(%rbx)
   140127029:	mov    %r14,%rdx
   14012702c:	mov    %rbx,%rcx
   14012702f:	movb   $0x0,0x153a0(%rbx)
   140127036:	vmovdqa %xmm0,0x15390(%rbx)
   14012703e:	call   140100580 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140127043:	mov    0x1060(%rbx),%rax
   14012704a:	mov    0x1048(%rbx),%rdx
   140127051:	mov    0x1038(%rbx),%rcx
   140127058:	mov    0x150c0(%rbx),%r13
   14012705f:	lea    (%rdx,%rax,8),%rsi
   140127063:	mov    0x1050(%rbx),%rax
   14012706a:	add    %r15,%rcx
   14012706d:	mov    %rax,0x38(%rsp)
   140127072:	test   %r13,%r13
   140127075:	je     140127084 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37b4>
   140127077:	lea    -0x5(%r13,%r13,4),%r8
   14012707c:	mov    0x10c8(%rbx,%r8,8),%r13
   140127084:	cmpb   $0x0,0x1040(%rbx)
   14012708b:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140127091:	movzbl (%rcx),%eax
   140127094:	lea    0x299005(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012709b:	lea    0x1(%rcx),%rbp
   14012709f:	xor    %r12d,%r12d
   1401270a2:	mov    (%rdi,%rax,8),%rax
   1401270a6:	jmp    *%rax
   1401270a8:	cmp    $0x2,%r12b
   1401270ac:	je     14012bdd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8506>
   1401270b2:	cmp    $0x1,%r12b
   1401270b6:	je     14012e17e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ae>
   1401270bc:	mov    0x1048(%rbx),%rdx
   1401270c3:	mov    0x1050(%rbx),%rax
   1401270ca:	vzeroupper
   1401270cd:	sub    %rdx,%rsi
   1401270d0:	sub    %r15,%rbp
   1401270d3:	sub    %rdx,%rax
   1401270d6:	mov    %rsi,%rdi
   1401270d9:	mov    %rbp,0x1038(%rbx)
   1401270e0:	sar    $0x3,%rdi
   1401270e4:	cmp    %rsi,%rax
   1401270e7:	jb     14012d376 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aa6>
   1401270ed:	vmovdqa 0x2359eb(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401270f5:	mov    %rdi,0x1060(%rbx)
   1401270fc:	mov    %r14,%rdx
   1401270ff:	mov    %rbx,%rcx
   140127102:	movb   $0x0,0x153a0(%rbx)
   140127109:	vmovdqa %xmm0,0x15390(%rbx)
   140127111:	call   1400fe760 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140127116:	mov    0x1060(%rbx),%rax
   14012711d:	mov    0x1048(%rbx),%rdx
   140127124:	mov    0x1038(%rbx),%rcx
   14012712b:	mov    0x150c0(%rbx),%r13
   140127132:	lea    (%rdx,%rax,8),%rsi
   140127136:	mov    0x1050(%rbx),%rax
   14012713d:	add    %r15,%rcx
   140127140:	mov    %rax,0x38(%rsp)
   140127145:	test   %r13,%r13
   140127148:	je     140127157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3887>
   14012714a:	lea    -0x5(%r13,%r13,4),%r8
   14012714f:	mov    0x10c8(%rbx,%r8,8),%r13
   140127157:	cmpb   $0x0,0x1040(%rbx)
   14012715e:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140127164:	movzbl (%rcx),%eax
   140127167:	lea    0x298f32(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012716e:	lea    0x1(%rcx),%rbp
   140127172:	xor    %r12d,%r12d
   140127175:	mov    (%rdi,%rax,8),%rax
   140127179:	jmp    *%rax
   14012717b:	cmp    $0x2,%r12b
   14012717f:	je     14012baf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8229>
   140127185:	cmp    $0x1,%r12b
   140127189:	je     14012dfe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa719>
   14012718f:	mov    0x1048(%rbx),%rdx
   140127196:	mov    0x1050(%rbx),%rax
   14012719d:	vzeroupper
   1401271a0:	sub    %rdx,%rsi
   1401271a3:	sub    %r15,%rbp
   1401271a6:	sub    %rdx,%rax
   1401271a9:	mov    %rsi,%rdi
   1401271ac:	mov    %rbp,0x1038(%rbx)
   1401271b3:	sar    $0x3,%rdi
   1401271b7:	cmp    %rsi,%rax
   1401271ba:	jb     14012d265 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9995>
   1401271c0:	vmovdqa 0x235918(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401271c8:	mov    %rdi,0x1060(%rbx)
   1401271cf:	mov    %r14,%rdx
   1401271d2:	mov    %rbx,%rcx
   1401271d5:	movb   $0x0,0x153a0(%rbx)
   1401271dc:	vmovdqa %xmm0,0x15390(%rbx)
   1401271e4:	call   140104230 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   1401271e9:	mov    0x1060(%rbx),%rax
   1401271f0:	mov    0x1048(%rbx),%rdx
   1401271f7:	mov    0x1038(%rbx),%rcx
   1401271fe:	mov    0x150c0(%rbx),%r13
   140127205:	lea    (%rdx,%rax,8),%rsi
   140127209:	mov    0x1050(%rbx),%rax
   140127210:	add    %r15,%rcx
   140127213:	mov    %rax,0x38(%rsp)
   140127218:	test   %r13,%r13
   14012721b:	je     14012722a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x395a>
   14012721d:	lea    -0x5(%r13,%r13,4),%r8
   140127222:	mov    0x10c8(%rbx,%r8,8),%r13
   14012722a:	cmpb   $0x0,0x1040(%rbx)
   140127231:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140127237:	movzbl (%rcx),%eax
   14012723a:	lea    0x298e5f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127241:	lea    0x1(%rcx),%rbp
   140127245:	xor    %r12d,%r12d
   140127248:	mov    (%rdi,%rax,8),%rax
   14012724c:	jmp    *%rax
   14012724e:	cmp    $0x2,%r12b
   140127252:	je     14012bd5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x848c>
   140127258:	cmp    $0x1,%r12b
   14012725c:	je     14012dab9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1e9>
   140127262:	mov    0x1048(%rbx),%rdx
   140127269:	mov    0x1050(%rbx),%rax
   140127270:	vzeroupper
   140127273:	sub    %rdx,%rsi
   140127276:	sub    %r15,%rbp
   140127279:	sub    %rdx,%rax
   14012727c:	mov    %rsi,%rdi
   14012727f:	mov    %rbp,0x1038(%rbx)
   140127286:	sar    $0x3,%rdi
   14012728a:	cmp    %rsi,%rax
   14012728d:	jb     14012d437 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b67>
   140127293:	vmovdqa 0x235845(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012729b:	mov    %rdi,0x1060(%rbx)
   1401272a2:	mov    %r14,%rdx
   1401272a5:	mov    %rbx,%rcx
   1401272a8:	movb   $0x0,0x153a0(%rbx)
   1401272af:	vmovdqa %xmm0,0x15390(%rbx)
   1401272b7:	call   140104460 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   1401272bc:	mov    0x1060(%rbx),%rax
   1401272c3:	mov    0x1048(%rbx),%rdx
   1401272ca:	mov    0x1038(%rbx),%rcx
   1401272d1:	mov    0x150c0(%rbx),%r13
   1401272d8:	lea    (%rdx,%rax,8),%rsi
   1401272dc:	mov    0x1050(%rbx),%rax
   1401272e3:	add    %r15,%rcx
   1401272e6:	mov    %rax,0x38(%rsp)
   1401272eb:	test   %r13,%r13
   1401272ee:	je     1401272fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a2d>
   1401272f0:	lea    -0x5(%r13,%r13,4),%r8
   1401272f5:	mov    0x10c8(%rbx,%r8,8),%r13
   1401272fd:	cmpb   $0x0,0x1040(%rbx)
   140127304:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   14012730a:	movzbl (%rcx),%eax
   14012730d:	lea    0x298d8c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127314:	lea    0x1(%rcx),%rbp
   140127318:	xor    %r12d,%r12d
   14012731b:	mov    (%rdi,%rax,8),%rax
   14012731f:	jmp    *%rax
   140127321:	cmp    $0x2,%r12b
   140127325:	je     14012b90a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x803a>
   14012732b:	cmp    $0x1,%r12b
   14012732f:	je     14012da53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa183>
   140127335:	mov    0x1048(%rbx),%rdx
   14012733c:	mov    0x1050(%rbx),%rax
   140127343:	vzeroupper
   140127346:	sub    %rdx,%rsi
   140127349:	sub    %r15,%rbp
   14012734c:	sub    %rdx,%rax
   14012734f:	mov    %rsi,%rdi
   140127352:	mov    %rbp,0x1038(%rbx)
   140127359:	sar    $0x3,%rdi
   14012735d:	cmp    %rsi,%rax
   140127360:	jb     14012d44c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b7c>
   140127366:	vmovdqa 0x235772(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012736e:	mov    %rdi,0x1060(%rbx)
   140127375:	mov    %r14,%rdx
   140127378:	mov    %rbx,%rcx
   14012737b:	movb   $0x0,0x153a0(%rbx)
   140127382:	vmovdqa %xmm0,0x15390(%rbx)
   14012738a:	call   140103920 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   14012738f:	mov    0x1060(%rbx),%rax
   140127396:	mov    0x1048(%rbx),%rdx
   14012739d:	mov    0x1038(%rbx),%rcx
   1401273a4:	mov    0x150c0(%rbx),%r13
   1401273ab:	lea    (%rdx,%rax,8),%rsi
   1401273af:	mov    0x1050(%rbx),%rax
   1401273b6:	add    %r15,%rcx
   1401273b9:	mov    %rax,0x38(%rsp)
   1401273be:	test   %r13,%r13
   1401273c1:	je     1401273d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b00>
   1401273c3:	lea    -0x5(%r13,%r13,4),%r8
   1401273c8:	mov    0x10c8(%rbx,%r8,8),%r13
   1401273d0:	cmpb   $0x0,0x1040(%rbx)
   1401273d7:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401273dd:	movzbl (%rcx),%eax
   1401273e0:	lea    0x298cb9(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401273e7:	lea    0x1(%rcx),%rbp
   1401273eb:	xor    %r12d,%r12d
   1401273ee:	mov    (%rdi,%rax,8),%rax
   1401273f2:	jmp    *%rax
   1401273f4:	cmp    $0x2,%r12b
   1401273f8:	je     14012b949 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8079>
   1401273fe:	cmp    $0x1,%r12b
   140127402:	je     14012d987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0b7>
   140127408:	mov    0x1048(%rbx),%rdx
   14012740f:	mov    0x1050(%rbx),%rax
   140127416:	vzeroupper
   140127419:	sub    %rdx,%rsi
   14012741c:	sub    %r15,%rbp
   14012741f:	sub    %rdx,%rax
   140127422:	mov    %rsi,%rdi
   140127425:	mov    %rbp,0x1038(%rbx)
   14012742c:	sar    $0x3,%rdi
   140127430:	cmp    %rsi,%rax
   140127433:	jb     14012d422 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b52>
   140127439:	vmovdqa 0x23569f(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140127441:	mov    %rdi,0x1060(%rbx)
   140127448:	mov    %r14,%rdx
   14012744b:	mov    %rbx,%rcx
   14012744e:	movb   $0x0,0x153a0(%rbx)
   140127455:	vmovdqa %xmm0,0x15390(%rbx)
   14012745d:	call   14010cf00 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140127462:	mov    0x1060(%rbx),%rax
   140127469:	mov    0x1048(%rbx),%rdx
   140127470:	mov    0x1038(%rbx),%rcx
   140127477:	mov    0x150c0(%rbx),%r13
   14012747e:	lea    (%rdx,%rax,8),%rsi
   140127482:	mov    0x1050(%rbx),%rax
   140127489:	add    %r15,%rcx
   14012748c:	mov    %rax,0x38(%rsp)
   140127491:	test   %r13,%r13
   140127494:	je     1401274a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bd3>
   140127496:	lea    -0x5(%r13,%r13,4),%r8
   14012749b:	mov    0x10c8(%rbx,%r8,8),%r13
   1401274a3:	cmpb   $0x0,0x1040(%rbx)
   1401274aa:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401274b0:	movzbl (%rcx),%eax
   1401274b3:	lea    0x298be6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274ba:	lea    0x1(%rcx),%rbp
   1401274be:	xor    %r12d,%r12d
   1401274c1:	mov    (%rdi,%rax,8),%rax
   1401274c5:	jmp    *%rax
   1401274c7:	cmp    $0x2,%r12b
   1401274cb:	je     14012b3ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7adb>
   1401274d1:	cmp    $0x1,%r12b
   1401274d5:	je     14012def8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa628>
   1401274db:	mov    0x1048(%rbx),%rdx
   1401274e2:	mov    0x1050(%rbx),%rax
   1401274e9:	vzeroupper
   1401274ec:	sub    %rdx,%rsi
   1401274ef:	sub    %r15,%rbp
   1401274f2:	sub    %rdx,%rax
   1401274f5:	mov    %rsi,%rdi
   1401274f8:	mov    %rbp,0x1038(%rbx)
   1401274ff:	sar    $0x3,%rdi
   140127503:	cmp    %rsi,%rax
   140127506:	jb     14012d572 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ca2>
   14012750c:	vmovdqa 0x2355cc(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140127514:	mov    %rdi,0x1060(%rbx)
   14012751b:	mov    %r14,%rdx
   14012751e:	mov    %rbx,%rcx
   140127521:	movb   $0x0,0x153a0(%rbx)
   140127528:	vmovdqa %xmm0,0x15390(%rbx)
   140127530:	call   140101460 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   140127535:	mov    0x1060(%rbx),%rax
   14012753c:	mov    0x1048(%rbx),%rdx
   140127543:	mov    0x1038(%rbx),%rcx
   14012754a:	mov    0x150c0(%rbx),%r13
   140127551:	lea    (%rdx,%rax,8),%rsi
   140127555:	mov    0x1050(%rbx),%rax
   14012755c:	add    %r15,%rcx
   14012755f:	mov    %rax,0x38(%rsp)
   140127564:	test   %r13,%r13
   140127567:	je     140127576 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ca6>
   140127569:	lea    -0x5(%r13,%r13,4),%r8
   14012756e:	mov    0x10c8(%rbx,%r8,8),%r13
   140127576:	cmpb   $0x0,0x1040(%rbx)
   14012757d:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140127583:	movzbl (%rcx),%eax
   140127586:	lea    0x298b13(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012758d:	lea    0x1(%rcx),%rbp
   140127591:	xor    %r12d,%r12d
   140127594:	mov    (%rdi,%rax,8),%rax
   140127598:	jmp    *%rax
   14012759a:	movzwl 0x0(%rbp),%edi
   14012759e:	lea    0x2(%rbp),%r8
   1401275a2:	add    %r13,%rdi
   1401275a5:	cmp    0x15268(%rbx),%rdi
   1401275ac:	jae    14012fe23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc553>
   1401275b2:	mov    0x1070(%rbx),%rax
   1401275b9:	sub    0x1068(%rbx),%rax
   1401275c0:	sar    $0x3,%rax
   1401275c4:	cmp    %rax,%rdi
   1401275c7:	jae    14012f96d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc09d>
   1401275cd:	mov    0x1068(%rbx),%rax
   1401275d4:	cmp    $0x1,%r12b
   1401275d8:	jne    14012f952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc082>
   1401275de:	mov    0x1c8(%rsp),%rdx
   1401275e6:	xor    %r12d,%r12d
   1401275e9:	mov    %rdx,(%rax,%rdi,8)
   1401275ed:	cmpb   $0x0,0x1040(%rbx)
   1401275f4:	je     14012a31c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   1401275fa:	movzbl 0x2(%rbp),%eax
   1401275fe:	lea    0x298a9b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127605:	add    $0x3,%rbp
   140127609:	mov    (%rdi,%rax,8),%rax
   14012760d:	jmp    *%rax
   14012760f:	movzwl 0x0(%rbp),%r9d
   140127614:	movzwl 0x2(%rbp),%eax
   140127618:	lea    0x4(%rbp),%rdi
   14012761c:	mov    0x1068(%rbx),%r10
   140127623:	test   %r12b,%r12b
   140127626:	jne    14012f91a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc04a>
   14012762c:	movzwl %r9w,%edx
   140127630:	movzwl %ax,%eax
   140127633:	add    %r13,%rdx
   140127636:	add    %r13,%rax
   140127639:	mov    (%r10,%rdx,8),%rdx
   14012763d:	mov    (%r10,%rax,8),%rax
   140127641:	mov    %rdx,0x1d0(%rsp)
   140127649:	mov    %rax,0x1c8(%rsp)
   140127651:	cmpb   $0x0,0x1040(%rbx)
   140127658:	je     14012f908 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc038>
   14012765e:	movzbl 0x4(%rbp),%eax
   140127662:	mov    $0x2,%r12d
   140127668:	add    $0x5,%rbp
   14012766c:	lea    0x298a2d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127673:	mov    (%rdi,%rax,8),%rax
   140127677:	jmp    *%rax
   140127679:	movzwl 0x4(%rbp),%r8d
   14012767e:	lea    0x6(%rbp),%rax
   140127682:	movzwl 0x0(%rbp),%r10d
   140127687:	mov    %rax,0x40(%rsp)
   14012768c:	movzwl 0x2(%rbp),%r9d
   140127691:	lea    (%r8,%r13,1),%rdi
   140127695:	cmp    0x15268(%rbx),%rdi
   14012769c:	jae    14012ff43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc673>
   1401276a2:	mov    0x1070(%rbx),%rax
   1401276a9:	sub    0x1068(%rbx),%rax
   1401276b0:	sar    $0x3,%rax
   1401276b4:	cmp    %rax,%rdi
   1401276b7:	jae    14012ff11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc641>
   1401276bd:	mov    0x1068(%rbx),%rax
   1401276c4:	movzwl %r10w,%edx
   1401276c8:	movabs $0xfff8000000000000,%r10
   1401276d2:	add    %r13,%rdx
   1401276d5:	lea    (%rax,%rdx,8),%rcx
   1401276d9:	movzwl %r9w,%edx
   1401276dd:	movabs $0xffff000000000000,%r9
   1401276e7:	mov    (%rcx),%r8
   1401276ea:	add    %r13,%rdx
   1401276ed:	lea    (%rax,%rdx,8),%r11
   1401276f1:	mov    %r8,%rdx
   1401276f4:	and    %r9,%rdx
   1401276f7:	cmp    %r10,%rdx
   1401276fa:	je     14012b88b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fbb>
   140127700:	mov    %r11,%rdx
   140127703:	vzeroupper
   140127706:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   14012770b:	mov    0x1068(%rbx),%rdx
   140127712:	mov    %rax,(%rdx,%rdi,8)
   140127716:	cmpb   $0x0,0x1040(%rbx)
   14012771d:	je     14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140127723:	movzbl 0x6(%rbp),%eax
   140127727:	lea    0x298972(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012772e:	add    $0x7,%rbp
   140127732:	mov    (%rdi,%rax,8),%rax
   140127736:	jmp    *%rax
   140127738:	movzwl 0x6(%rbp),%edx
   14012773c:	lea    0x8(%rbp),%rdi
   140127740:	movzwl 0x0(%rbp),%r10d
   140127745:	mov    %rdi,0xa0(%rsp)
   14012774d:	movzwl 0x2(%rbp),%r9d
   140127752:	movzwl 0x4(%rbp),%eax
   140127756:	lea    (%rdx,%r13,1),%rdi
   14012775a:	cmp    0x15268(%rbx),%rdi
   140127761:	jae    140130808 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf38>
   140127767:	mov    0x1070(%rbx),%rcx
   14012776e:	sub    0x1068(%rbx),%rcx
   140127775:	sar    $0x3,%rcx
   140127779:	cmp    %rcx,%rdi
   14012777c:	jae    140130870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfa0>
   140127782:	mov    0x1068(%rbx),%r8
   140127789:	movzwl %r10w,%edx
   14012778d:	movzwl %ax,%eax
   140127790:	add    %r13,%rdx
   140127793:	add    %r13,%rax
   140127796:	lea    (%r8,%rdx,8),%r11
   14012779a:	movzwl %r9w,%edx
   14012779e:	lea    (%r8,%rax,8),%rax
   1401277a2:	mov    (%r11),%r9
   1401277a5:	add    %r13,%rdx
   1401277a8:	mov    %rax,0x40(%rsp)
   1401277ad:	movabs $0xfff8000000000000,%rax
   1401277b7:	lea    (%r8,%rdx,8),%rcx
   1401277bb:	movabs $0xffff000000000000,%rdx
   1401277c5:	mov    %r9,%r10
   1401277c8:	mov    %rcx,0x60(%rsp)
   1401277cd:	and    %rdx,%r10
   1401277d0:	cmp    %rax,%r10
   1401277d3:	jne    14012c932 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9062>
   1401277d9:	mov    (%rcx),%rcx
   1401277dc:	mov    %rcx,%rax
   1401277df:	and    %rdx,%rax
   1401277e2:	cmp    %r10,%rax
   1401277e5:	jne    14012c952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9082>
   1401277eb:	mov    0x40(%rsp),%r10
   1401277f0:	mov    (%r10),%r10
   1401277f3:	and    %r10,%rdx
   1401277f6:	cmp    %rax,%rdx
   1401277f9:	jne    14012c952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9082>
   1401277ff:	shl    $0x10,%rcx
   140127803:	mov    %r9,%rax
   140127806:	shl    $0x10,%r10
   14012780a:	shl    $0x10,%rax
   14012780e:	sar    $0x10,%rcx
   140127812:	sar    $0x10,%rax
   140127816:	sar    $0x10,%r10
   14012781a:	imul   %rcx,%rax
   14012781e:	movabs $0x800000000000,%rcx
   140127828:	add    %r10,%rax
   14012782b:	movabs $0xffffffffffff,%r10
   140127835:	add    %rax,%rcx
   140127838:	cmp    %rcx,%r10
   14012783b:	jb     14012c952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9082>
   140127841:	and    %r10,%rax
   140127844:	or     %rdx,%rax
   140127847:	mov    %rax,(%r8,%rdi,8)
   14012784b:	cmpb   $0x0,0x1040(%rbx)
   140127852:	je     14012d15d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x988d>
   140127858:	movzbl 0x8(%rbp),%eax
   14012785c:	lea    0x29883d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127863:	add    $0x9,%rbp
   140127867:	mov    (%rdi,%rax,8),%rax
   14012786b:	jmp    *%rax
   14012786d:	lea    0x2(%rbp),%rax
   140127871:	movzwl 0x0(%rbp),%edx
   140127875:	mov    %rax,0x40(%rsp)
   14012787a:	mov    0xb8(%r14),%rax
   140127881:	lea    (%rax,%rdx,8),%r9
   140127885:	cmp    $0x2,%r12b
   140127889:	jne    1401307e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf15>
   14012788f:	mov    0x1d0(%rsp),%rdi
   140127897:	movabs $0xffff000000000000,%rax
   1401278a1:	movabs $0xfffd000000000000,%rdx
   1401278ab:	and    %rdi,%rax
   1401278ae:	cmp    %rdx,%rax
   1401278b1:	je     14012c52a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c5a>
   1401278b7:	mov    0x1c8(%rsp),%rax
   1401278bf:	xor    %r12d,%r12d
   1401278c2:	mov    %rax,0x3f0(%rsp)
   1401278ca:	cmpb   $0x0,0x1040(%rbx)
   1401278d1:	je     14012c91e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   1401278d7:	movzbl 0x2(%rbp),%eax
   1401278db:	lea    0x2987be(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401278e2:	add    $0x3,%rbp
   1401278e6:	mov    (%rdi,%rax,8),%rax
   1401278ea:	jmp    *%rax
   1401278ec:	lea    0x3(%rbp),%rax
   1401278f0:	movzbl 0x2(%rbp),%edi
   1401278f4:	mov    %rax,0x60(%rsp)
   1401278f9:	movzwl 0x0(%rbp),%eax
   1401278fd:	shl    $0x4,%rax
   140127901:	add    0xd0(%r14),%rax
   140127908:	mov    %rax,0x40(%rsp)
   14012790d:	test   %dil,%dil
   140127910:	jne    14012a3c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6af3>
   140127916:	lea    -0x8(%rsi),%rdx
   14012791a:	lea    0x1c8(%rsp),%rax
   140127922:	test   %r12b,%r12b
   140127925:	cmove  %rdx,%rax
   140127929:	mov    (%rax),%rdx
   14012792c:	movabs $0xffffffff00000000,%rax
   140127936:	movabs $0xfffd000200000000,%rcx
   140127940:	and    %rdx,%rax
   140127943:	cmp    %rcx,%rax
   140127946:	je     14012ecaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3df>
   14012794c:	vzeroupper
   14012794f:	cmp    $0x2,%r12b
   140127953:	je     14012d605 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d35>
   140127959:	cmp    $0x1,%r12b
   14012795d:	je     14012dd51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa481>
   140127963:	mov    0x1048(%rbx),%rdx
   14012796a:	mov    0x1050(%rbx),%rax
   140127971:	mov    %rsi,%r8
   140127974:	mov    0x60(%rsp),%rcx
   140127979:	sub    %rdx,%r8
   14012797c:	sub    %rdx,%rax
   14012797f:	mov    %r8,%rsi
   140127982:	sub    %r15,%rcx
   140127985:	sar    $0x3,%rsi
   140127989:	mov    %rcx,0x1038(%rbx)
   140127990:	cmp    %r8,%rax
   140127993:	jb     14012d5f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d20>
   140127999:	mov    0x40(%rsp),%rax
   14012799e:	movzbl %dil,%r9d
   1401279a2:	mov    %r14,%rdx
   1401279a5:	mov    %rbx,%rcx
   1401279a8:	movb   $0x0,0x153a0(%rbx)
   1401279af:	vmovdqa 0x235129(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401279b7:	mov    %rsi,0x1060(%rbx)
   1401279be:	movzwl 0xa(%rax),%r8d
   1401279c3:	vmovdqa %xmm0,0x15390(%rbx)
   1401279cb:	call   140114700 <setun::VM::handle_invoke_method_direct(setun::Chunk const&, unsigned short, unsigned char)>
   1401279d0:	mov    0x1038(%rbx),%rax
   1401279d7:	mov    0x1060(%rbx),%rcx
   1401279de:	mov    0x1048(%rbx),%rdx
   1401279e5:	mov    0x150c0(%rbx),%r13
   1401279ec:	add    %r15,%rax
   1401279ef:	lea    (%rdx,%rcx,8),%rsi
   1401279f3:	test   %r13,%r13
   1401279f6:	je     140127a05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4135>
   1401279f8:	lea    -0x5(%r13,%r13,4),%rcx
   1401279fd:	mov    0x10c8(%rbx,%rcx,8),%r13
   140127a05:	cmpb   $0x0,0x1040(%rbx)
   140127a0c:	je     140130608 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd38>
   140127a12:	mov    0x1050(%rbx),%rdi
   140127a19:	lea    0x1(%rax),%rbp
   140127a1d:	movzbl (%rax),%eax
   140127a20:	xor    %r12d,%r12d
   140127a23:	mov    %rdi,0x38(%rsp)
   140127a28:	lea    0x298671(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a2f:	mov    (%rdi,%rax,8),%rax
   140127a33:	jmp    *%rax
   140127a35:	movzwl 0x4(%rbp),%r8d
   140127a3a:	lea    0x6(%rbp),%rax
   140127a3e:	movzwl 0x0(%rbp),%edi
   140127a42:	mov    %rax,0x40(%rsp)
   140127a47:	movzwl 0x2(%rbp),%r10d
   140127a4c:	add    %r13,%r8
   140127a4f:	cmp    0x15268(%rbx),%r8
   140127a56:	jae    140130544 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc74>
   140127a5c:	mov    0x1070(%rbx),%rcx
   140127a63:	sub    0x1068(%rbx),%rcx
   140127a6a:	sar    $0x3,%rcx
   140127a6e:	cmp    %rcx,%r8
   140127a71:	jae    14013073c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce6c>
   140127a77:	movzwl %di,%eax
   140127a7a:	mov    0x1068(%rbx),%r9
   140127a81:	movabs $0xffff000000000000,%rdx
   140127a8b:	add    %r13,%rax
   140127a8e:	lea    (%r9,%rax,8),%rdi
   140127a92:	mov    (%rdi),%rax
   140127a95:	and    %rax,%rdx
   140127a98:	mov    %rdx,%r11
   140127a9b:	movabs $0xfff8000000000000,%rdx
   140127aa5:	cmp    %rdx,%r11
   140127aa8:	jne    14012ca9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91cf>
   140127aae:	shl    $0x10,%rax
   140127ab2:	movswq %r10w,%rdx
   140127ab6:	movabs $0x800000000000,%rcx
   140127ac0:	movabs $0xffffffffffff,%r10
   140127aca:	sar    $0x10,%rax
   140127ace:	add    %rdx,%rax
   140127ad1:	add    %rax,%rcx
   140127ad4:	cmp    %rcx,%r10
   140127ad7:	jb     14012caa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91d3>
   140127add:	and    %r10,%rax
   140127ae0:	or     %r11,%rax
   140127ae3:	mov    %rax,(%r9,%r8,8)
   140127ae7:	cmpb   $0x0,0x1040(%rbx)
   140127aee:	je     14012c91e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   140127af4:	movzbl 0x6(%rbp),%eax
   140127af8:	lea    0x2985a1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127aff:	add    $0x7,%rbp
   140127b03:	mov    (%rdi,%rax,8),%rax
   140127b07:	jmp    *%rax
   140127b09:	movzwl 0x8(%rbp),%eax
   140127b0d:	movzwl 0x0(%rbp),%edx
   140127b11:	movabs $0xfffd000300000000,%r8
   140127b1b:	movzwl 0x2(%rbp),%r9d
   140127b20:	movzwl 0x4(%rbp),%r11d
   140127b25:	mov    %ax,0x40(%rsp)
   140127b2a:	lea    0xa(%rbp),%rax
   140127b2e:	add    %r13,%rdx
   140127b31:	movzwl 0x6(%rbp),%r10d
   140127b36:	mov    %rax,0x60(%rsp)
   140127b3b:	mov    0x1068(%rbx),%rax
   140127b42:	lea    (%rax,%rdx,8),%rdi
   140127b46:	movabs $0xffffffff00000000,%rdx
   140127b50:	mov    (%rdi),%rcx
   140127b53:	and    %rdx,%rcx
   140127b56:	cmp    %r8,%rcx
   140127b59:	je     14012ee36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb566>
   140127b5f:	cmpb   $0x0,0x1040(%rbx)
   140127b66:	je     14012e2b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e0>
   140127b6c:	movzbl 0xa(%rbp),%eax
   140127b70:	lea    0x298529(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127b77:	add    $0xb,%rbp
   140127b7b:	mov    (%rdi,%rax,8),%rax
   140127b7f:	jmp    *%rax
   140127b81:	mov    0x1068(%rbx),%rax
   140127b88:	cmp    $0x1,%r12b
   140127b8c:	jne    14012fa66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc196>
   140127b92:	mov    0x1c8(%rsp),%rdx
   140127b9a:	xor    %r12d,%r12d
   140127b9d:	mov    %rdx,(%rax,%r13,8)
   140127ba1:	cmpb   $0x0,0x1040(%rbx)
   140127ba8:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127bae:	movzbl 0x0(%rbp),%eax
   140127bb2:	lea    0x2984e7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127bb9:	add    $0x1,%rbp
   140127bbd:	mov    (%rdi,%rax,8),%rax
   140127bc1:	jmp    *%rax
   140127bc3:	mov    0x1068(%rbx),%rax
   140127bca:	cmp    $0x1,%r12b
   140127bce:	jne    14012fa20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc150>
   140127bd4:	mov    0x1c8(%rsp),%rdx
   140127bdc:	xor    %r12d,%r12d
   140127bdf:	mov    %rdx,0x8(%rax,%r13,8)
   140127be4:	cmpb   $0x0,0x1040(%rbx)
   140127beb:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127bf1:	movzbl 0x0(%rbp),%eax
   140127bf5:	lea    0x2984a4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127bfc:	add    $0x1,%rbp
   140127c00:	mov    (%rdi,%rax,8),%rax
   140127c04:	jmp    *%rax
   140127c06:	mov    0x1068(%rbx),%rax
   140127c0d:	cmp    $0x1,%r12b
   140127c11:	jne    14012fa04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc134>
   140127c17:	mov    0x1c8(%rsp),%rdx
   140127c1f:	xor    %r12d,%r12d
   140127c22:	mov    %rdx,0x10(%rax,%r13,8)
   140127c27:	cmpb   $0x0,0x1040(%rbx)
   140127c2e:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127c34:	movzbl 0x0(%rbp),%eax
   140127c38:	lea    0x298461(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127c3f:	add    $0x1,%rbp
   140127c43:	mov    (%rdi,%rax,8),%rax
   140127c47:	jmp    *%rax
   140127c49:	mov    0x1068(%rbx),%rax
   140127c50:	cmp    $0x1,%r12b
   140127c54:	jne    14012f9e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc118>
   140127c5a:	mov    0x1c8(%rsp),%rdx
   140127c62:	xor    %r12d,%r12d
   140127c65:	mov    %rdx,0x18(%rax,%r13,8)
   140127c6a:	cmpb   $0x0,0x1040(%rbx)
   140127c71:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127c77:	movzbl 0x0(%rbp),%eax
   140127c7b:	lea    0x29841e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127c82:	add    $0x1,%rbp
   140127c86:	mov    (%rdi,%rax,8),%rax
   140127c8a:	jmp    *%rax
   140127c8c:	lea    -0x8(%rsi),%rdx
   140127c90:	lea    0x1c8(%rsp),%rax
   140127c98:	test   %r12b,%r12b
   140127c9b:	cmove  %rdx,%rax
   140127c9f:	mov    0x1068(%rbx),%rdx
   140127ca6:	mov    (%rax),%rax
   140127ca9:	mov    %rax,0x8(%rdx,%r13,8)
   140127cae:	cmpb   $0x0,0x1040(%rbx)
   140127cb5:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127cbb:	movzbl 0x0(%rbp),%eax
   140127cbf:	lea    0x2983da(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127cc6:	add    $0x1,%rbp
   140127cca:	mov    (%rdi,%rax,8),%rax
   140127cce:	jmp    *%rax
   140127cd0:	lea    -0x8(%rsi),%rdx
   140127cd4:	lea    0x1c8(%rsp),%rax
   140127cdc:	test   %r12b,%r12b
   140127cdf:	cmove  %rdx,%rax
   140127ce3:	mov    0x1068(%rbx),%rdx
   140127cea:	mov    (%rax),%rax
   140127ced:	mov    %rax,0x10(%rdx,%r13,8)
   140127cf2:	cmpb   $0x0,0x1040(%rbx)
   140127cf9:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127cff:	movzbl 0x0(%rbp),%eax
   140127d03:	lea    0x298396(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d0a:	add    $0x1,%rbp
   140127d0e:	mov    (%rdi,%rax,8),%rax
   140127d12:	jmp    *%rax
   140127d14:	lea    -0x8(%rsi),%rdx
   140127d18:	lea    0x1c8(%rsp),%rax
   140127d20:	test   %r12b,%r12b
   140127d23:	cmove  %rdx,%rax
   140127d27:	mov    0x1068(%rbx),%rdx
   140127d2e:	mov    (%rax),%rax
   140127d31:	mov    %rax,0x18(%rdx,%r13,8)
   140127d36:	cmpb   $0x0,0x1040(%rbx)
   140127d3d:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127d43:	movzbl 0x0(%rbp),%eax
   140127d47:	lea    0x298352(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d4e:	add    $0x1,%rbp
   140127d52:	mov    (%rdi,%rax,8),%rax
   140127d56:	jmp    *%rax
   140127d58:	movzwl 0x0(%rbp),%eax
   140127d5c:	movzwl 0x2(%rbp),%edi
   140127d60:	lea    0x4(%rbp),%r9
   140127d64:	add    %r13,%rax
   140127d67:	cmp    0x15268(%rbx),%rax
   140127d6e:	jae    14012f98f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0bf>
   140127d74:	mov    0x1068(%rbx),%rdx
   140127d7b:	movabs $0xfff8000000000000,%rcx
   140127d85:	lea    (%rdx,%rax,8),%r8
   140127d89:	movabs $0xffff000000000000,%rdx
   140127d93:	mov    (%r8),%rax
   140127d96:	and    %rax,%rdx
   140127d99:	cmp    %rcx,%rdx
   140127d9c:	jne    14012ca32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9162>
   140127da2:	shl    $0x10,%rax
   140127da6:	movswq %di,%rcx
   140127daa:	movabs $0x800000000000,%r10
   140127db4:	movabs $0xffffffffffff,%r11
   140127dbe:	sar    $0x10,%rax
   140127dc2:	add    %rcx,%rax
   140127dc5:	add    %rax,%r10
   140127dc8:	cmp    %r10,%r11
   140127dcb:	jb     14012ca36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9166>
   140127dd1:	and    %r11,%rax
   140127dd4:	or     %rdx,%rax
   140127dd7:	mov    %rax,(%r8)
   140127dda:	cmpb   $0x0,0x1040(%rbx)
   140127de1:	je     1401308aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfda>
   140127de7:	movzbl 0x4(%rbp),%eax
   140127deb:	lea    0x2982ae(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127df2:	add    $0x5,%rbp
   140127df6:	mov    (%rdi,%rax,8),%rax
   140127dfa:	jmp    *%rax
   140127dfc:	movabs $0xfffb000000000000,%rax
   140127e06:	mov    %rax,0x330(%rsp)
   140127e0e:	mov    %rax,0x338(%rsp)
   140127e16:	cmp    $0x2,%r12b
   140127e1a:	jne    14012fa3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc16c>
   140127e20:	mov    0x1c8(%rsp),%rax
   140127e28:	xor    %r12d,%r12d
   140127e2b:	mov    %rax,0x338(%rsp)
   140127e33:	mov    0x1d0(%rsp),%rax
   140127e3b:	mov    %rax,0x330(%rsp)
   140127e43:	movabs $0xffffffff00000000,%rax
   140127e4d:	movabs $0xfffd000300000000,%rdx
   140127e57:	and    0x330(%rsp),%rax
   140127e5f:	cmp    %rdx,%rax
   140127e62:	je     14012f008 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb738>
   140127e68:	mov    0x330(%rsp),%rdx
   140127e70:	movabs $0xffff000000000000,%rax
   140127e7a:	movabs $0xfffd000000000000,%rcx
   140127e84:	and    %rdx,%rax
   140127e87:	cmp    %rcx,%rax
   140127e8a:	je     14012c608 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d38>
   140127e90:	test   %r12b,%r12b
   140127e93:	je     14012d174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98a4>
   140127e99:	cmp    $0x1,%r12b
   140127e9d:	je     14012f3e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb17>
   140127ea3:	lea    0x8(%rsi),%r8
   140127ea7:	cmp    0x38(%rsp),%r8
   140127eac:	jae    140134d9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114cb>
   140127eb2:	mov    0x1d0(%rsp),%rax
   140127eba:	mov    %rax,(%rsi)
   140127ebd:	mov    0x1c8(%rsp),%rax
   140127ec5:	mov    %rax,0x1d0(%rsp)
   140127ecd:	movabs $0xfff8000000000000,%rax
   140127ed7:	mov    %rax,0x1c8(%rsp)
   140127edf:	mov    %r8,%rsi
   140127ee2:	mov    $0x2,%r12d
   140127ee8:	cmpb   $0x0,0x1040(%rbx)
   140127eef:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127ef5:	movzbl 0x0(%rbp),%eax
   140127ef9:	lea    0x2981a0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127f00:	add    $0x1,%rbp
   140127f04:	mov    (%rdi,%rax,8),%rax
   140127f08:	jmp    *%rax
   140127f0a:	movabs $0xfffb000000000000,%rax
   140127f14:	mov    %rax,0x340(%rsp)
   140127f1c:	mov    %rax,0x348(%rsp)
   140127f24:	cmp    $0x1,%r12b
   140127f28:	jne    140130610 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd40>
   140127f2e:	mov    0x1c8(%rsp),%rax
   140127f36:	xor    %r12d,%r12d
   140127f39:	mov    %rax,0x340(%rsp)
   140127f41:	mov    -0x8(%rsi),%rax
   140127f45:	sub    $0x10,%rsi
   140127f49:	mov    %rax,0x348(%rsp)
   140127f51:	mov    (%rsi),%rdi
   140127f54:	movabs $0xffff000000000000,%rdx
   140127f5e:	mov    %rdi,%rcx
   140127f61:	movabs $0xfffd000000000000,%rax
   140127f6b:	and    %rdx,%rcx
   140127f6e:	cmp    %rax,%rcx
   140127f71:	je     14012b30a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a3a>
   140127f77:	cmpb   $0x0,0x1040(%rbx)
   140127f7e:	je     14012e217 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa947>
   140127f84:	movzbl 0x0(%rbp),%eax
   140127f88:	lea    0x298111(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127f8f:	add    $0x1,%rbp
   140127f93:	mov    (%rdi,%rax,8),%rax
   140127f97:	jmp    *%rax
   140127f99:	movzwl 0x2(%rbp),%eax
   140127f9d:	movzwl 0x4(%rbp),%edi
   140127fa1:	movzwl 0x6(%rbp),%ecx
   140127fa5:	mov    0x1068(%rbx),%rdx
   140127fac:	mov    %ax,0x60(%rsp)
   140127fb1:	movzwl 0x0(%rbp),%eax
   140127fb5:	mov    %di,0x40(%rsp)
   140127fba:	lea    0x8(%rbp),%rdi
   140127fbe:	mov    %cx,0x80(%rsp)
   140127fc6:	add    %r13,%rax
   140127fc9:	lea    (%rdx,%rax,8),%rcx
   140127fcd:	vzeroupper
   140127fd0:	call   14021a530 <setun::VMValue::as_int() const>
   140127fd5:	mov    0x1068(%rbx),%rdx
   140127fdc:	mov    %rax,0xa0(%rsp)
   140127fe4:	movzwl 0x60(%rsp),%eax
   140127fe9:	add    %r13,%rax
   140127fec:	lea    (%rdx,%rax,8),%rcx
   140127ff0:	call   14021a530 <setun::VMValue::as_int() const>
   140127ff5:	mov    0x1068(%rbx),%rdx
   140127ffc:	mov    %rax,%rbp
   140127fff:	movzwl 0x40(%rsp),%eax
   140128004:	add    %r13,%rax
   140128007:	lea    (%rdx,%rax,8),%rcx
   14012800b:	call   14021a530 <setun::VMValue::as_int() const>
   140128010:	test   %rax,%rax
   140128013:	je     14012f877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfa7>
   140128019:	jle    14012a564 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c94>
   14012801f:	cmp    %rbp,0xa0(%rsp)
   140128027:	setl   %dl
   14012802a:	movswq 0x80(%rsp),%rax
   140128033:	add    %rdi,%rax
   140128036:	test   %dl,%dl
   140128038:	cmove  %rax,%rdi
   14012803c:	cmpb   $0x0,0x1040(%rbx)
   140128043:	je     14012e532 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac62>
   140128049:	movzbl (%rdi),%eax
   14012804c:	lea    0x1(%rdi),%rbp
   140128050:	lea    0x298049(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128057:	jmp    *(%rdi,%rax,8)
   14012805a:	movabs $0xfffb000000000000,%rax
   140128064:	mov    %rax,0x358(%rsp)
   14012806c:	mov    %rax,0x360(%rsp)
   140128074:	cmp    $0x2,%r12b
   140128078:	jne    1401300ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc81d>
   14012807e:	mov    0x1c8(%rsp),%rax
   140128086:	mov    $0x1,%r12d
   14012808c:	mov    %rax,0x360(%rsp)
   140128094:	mov    0x1d0(%rsp),%rax
   14012809c:	mov    %rax,0x358(%rsp)
   1401280a4:	mov    0x358(%rsp),%rdx
   1401280ac:	movabs $0xffff000000000000,%rax
   1401280b6:	movabs $0xfff8000000000000,%rcx
   1401280c0:	mov    %rdx,%r8
   1401280c3:	and    %rax,%r8
   1401280c6:	cmp    %rcx,%r8
   1401280c9:	je     14012b014 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7744>
   1401280cf:	movb   $0x20,-0x1(%rbp)
   1401280d3:	lea    0x360(%rsp),%rdx
   1401280db:	lea    0x358(%rsp),%rcx
   1401280e3:	vzeroupper
   1401280e6:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   1401280eb:	mov    %rax,0x1c8(%rsp)
   1401280f3:	cmpb   $0x0,0x1040(%rbx)
   1401280fa:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128100:	movzbl 0x0(%rbp),%eax
   140128104:	lea    0x297f95(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012810b:	add    $0x1,%rbp
   14012810f:	mov    (%rdi,%rax,8),%rax
   140128113:	jmp    *%rax
   140128115:	movabs $0xfffb000000000000,%rax
   14012811f:	mov    %rax,0x368(%rsp)
   140128127:	mov    %rax,0x370(%rsp)
   14012812f:	cmp    $0x2,%r12b
   140128133:	jne    14012f6d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe00>
   140128139:	mov    0x1c8(%rsp),%rax
   140128141:	mov    $0x1,%r12d
   140128147:	mov    %rax,0x370(%rsp)
   14012814f:	mov    0x1d0(%rsp),%rax
   140128157:	mov    %rax,0x368(%rsp)
   14012815f:	mov    0x368(%rsp),%rax
   140128167:	movabs $0xffff000000000000,%rdx
   140128171:	movabs $0xfff8000000000000,%r8
   14012817b:	mov    %rax,%rcx
   14012817e:	and    %rdx,%rcx
   140128181:	cmp    %r8,%rcx
   140128184:	je     14012b08b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77bb>
   14012818a:	movb   $0x21,-0x1(%rbp)
   14012818e:	lea    0x370(%rsp),%rdx
   140128196:	lea    0x368(%rsp),%rcx
   14012819e:	vzeroupper
   1401281a1:	call   14021a250 <setun::VMValue::sub(setun::VMValue const&) const>
   1401281a6:	mov    %rax,0x1c8(%rsp)
   1401281ae:	cmpb   $0x0,0x1040(%rbx)
   1401281b5:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401281bb:	movzbl 0x0(%rbp),%eax
   1401281bf:	lea    0x297eda(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401281c6:	add    $0x1,%rbp
   1401281ca:	mov    (%rdi,%rax,8),%rax
   1401281ce:	jmp    *%rax
   1401281d0:	movabs $0xfffb000000000000,%rax
   1401281da:	mov    %rax,0x378(%rsp)
   1401281e2:	mov    %rax,0x380(%rsp)
   1401281ea:	cmp    $0x2,%r12b
   1401281ee:	jne    14012f7fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2d>
   1401281f4:	mov    0x1c8(%rsp),%rax
   1401281fc:	mov    $0x1,%r12d
   140128202:	mov    %rax,0x380(%rsp)
   14012820a:	mov    0x1d0(%rsp),%rax
   140128212:	mov    %rax,0x378(%rsp)
   14012821a:	mov    0x378(%rsp),%rdx
   140128222:	movabs $0xffff000000000000,%rax
   14012822c:	movabs $0xfff8000000000000,%rcx
   140128236:	mov    %rdx,%r8
   140128239:	and    %rax,%r8
   14012823c:	cmp    %rcx,%r8
   14012823f:	je     14012b988 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80b8>
   140128245:	movb   $0x22,-0x1(%rbp)
   140128249:	lea    0x380(%rsp),%rdx
   140128251:	lea    0x378(%rsp),%rcx
   140128259:	vzeroupper
   14012825c:	call   1402199e0 <setun::VMValue::mul(setun::VMValue const&) const>
   140128261:	mov    %rax,0x1c8(%rsp)
   140128269:	cmpb   $0x0,0x1040(%rbx)
   140128270:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128276:	movzbl 0x0(%rbp),%eax
   14012827a:	lea    0x297e1f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128281:	add    $0x1,%rbp
   140128285:	mov    (%rdi,%rax,8),%rax
   140128289:	jmp    *%rax
   14012828b:	movabs $0xfffb000000000000,%rax
   140128295:	mov    %rax,0x388(%rsp)
   14012829d:	mov    %rax,0x390(%rsp)
   1401282a5:	cmp    $0x2,%r12b
   1401282a9:	jne    14012f6a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdd0>
   1401282af:	mov    0x1c8(%rsp),%rax
   1401282b7:	mov    $0x1,%r12d
   1401282bd:	mov    %rax,0x390(%rsp)
   1401282c5:	mov    0x1d0(%rsp),%rax
   1401282cd:	mov    %rax,0x388(%rsp)
   1401282d5:	mov    0x388(%rsp),%rcx
   1401282dd:	movabs $0xffff000000000000,%rax
   1401282e7:	movabs $0xfff8000000000000,%r8
   1401282f1:	and    %rax,%rcx
   1401282f4:	cmp    %r8,%rcx
   1401282f7:	je     14012b6fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e2c>
   1401282fd:	movabs $0xffff000000000000,%rdx
   140128307:	movb   $0x32,-0x1(%rbp)
   14012830b:	mov    0x388(%rsp),%rax
   140128313:	movabs $0xfff8000000000000,%r8
   14012831d:	mov    %rax,%rcx
   140128320:	and    %rdx,%rcx
   140128323:	cmp    %r8,%rcx
   140128326:	je     14012bf3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x866f>
   14012832c:	movabs $0xfffd000000000000,%r8
   140128336:	cmp    %r8,%rcx
   140128339:	je     14012bf32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8662>
   14012833f:	movabs $0xfff7ffffffffffff,%rcx
   140128349:	cmp    %rax,%rcx
   14012834c:	jae    14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   140128352:	movabs $0xfffc000000000000,%r9
   14012835c:	cmp    %r9,%rax
   14012835f:	je     14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   140128365:	mov    0x390(%rsp),%rax
   14012836d:	cmp    %rax,%rcx
   140128370:	jae    14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   140128376:	cmp    %r9,%rax
   140128379:	je     14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   14012837f:	and    %rax,%rdx
   140128382:	cmp    %r8,%rdx
   140128385:	je     140130d5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd48c>
   14012838b:	lea    0x388(%rsp),%rcx
   140128393:	vzeroupper
   140128396:	call   14021a530 <setun::VMValue::as_int() const>
   14012839b:	lea    0x390(%rsp),%rcx
   1401283a3:	mov    %rax,%rdi
   1401283a6:	call   14021a530 <setun::VMValue::as_int() const>
   1401283ab:	cmp    %rax,%rdi
   1401283ae:	setl   %al
   1401283b1:	movabs $0xfffa000000000000,%rdx
   1401283bb:	movzbl %al,%eax
   1401283be:	add    %rdx,%rax
   1401283c1:	mov    %rax,0x1c8(%rsp)
   1401283c9:	cmpb   $0x0,0x1040(%rbx)
   1401283d0:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401283d6:	movzbl 0x0(%rbp),%eax
   1401283da:	lea    0x297cbf(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401283e1:	add    $0x1,%rbp
   1401283e5:	mov    (%rdi,%rax,8),%rax
   1401283e9:	jmp    *%rax
   1401283eb:	movabs $0xfffb000000000000,%rax
   1401283f5:	mov    %rax,0x398(%rsp)
   1401283fd:	mov    %rax,0x3a0(%rsp)
   140128405:	cmp    $0x2,%r12b
   140128409:	jne    14012ffa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6d8>
   14012840f:	mov    0x1c8(%rsp),%rax
   140128417:	mov    $0x1,%r12d
   14012841d:	mov    %rax,0x3a0(%rsp)
   140128425:	mov    0x1d0(%rsp),%rax
   14012842d:	mov    %rax,0x398(%rsp)
   140128435:	mov    0x398(%rsp),%rcx
   14012843d:	movabs $0xffff000000000000,%rax
   140128447:	movabs $0xfff8000000000000,%r8
   140128451:	and    %rax,%rcx
   140128454:	cmp    %r8,%rcx
   140128457:	je     14012b822 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f52>
   14012845d:	movabs $0xffff000000000000,%rdx
   140128467:	movb   $0x33,-0x1(%rbp)
   14012846b:	mov    0x398(%rsp),%rax
   140128473:	movabs $0xfff8000000000000,%r8
   14012847d:	mov    %rax,%rcx
   140128480:	and    %rdx,%rcx
   140128483:	cmp    %r8,%rcx
   140128486:	je     14012c05a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   14012848c:	movabs $0xfffd000000000000,%r8
   140128496:	cmp    %r8,%rcx
   140128499:	je     14012c04d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x877d>
   14012849f:	movabs $0xfff7ffffffffffff,%rcx
   1401284a9:	cmp    %rax,%rcx
   1401284ac:	jae    14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   1401284b2:	movabs $0xfffc000000000000,%r9
   1401284bc:	cmp    %r9,%rax
   1401284bf:	je     14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   1401284c5:	mov    0x3a0(%rsp),%rax
   1401284cd:	cmp    %rax,%rcx
   1401284d0:	jae    14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   1401284d6:	cmp    %r9,%rax
   1401284d9:	je     14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   1401284df:	and    %rax,%rdx
   1401284e2:	cmp    %r8,%rdx
   1401284e5:	je     1401310cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7ff>
   1401284eb:	lea    0x398(%rsp),%rcx
   1401284f3:	vzeroupper
   1401284f6:	call   14021a530 <setun::VMValue::as_int() const>
   1401284fb:	lea    0x3a0(%rsp),%rcx
   140128503:	mov    %rax,%rdi
   140128506:	call   14021a530 <setun::VMValue::as_int() const>
   14012850b:	cmp    %rax,%rdi
   14012850e:	setle  %al
   140128511:	movabs $0xfffa000000000000,%rdx
   14012851b:	movzbl %al,%eax
   14012851e:	add    %rdx,%rax
   140128521:	mov    %rax,0x1c8(%rsp)
   140128529:	cmpb   $0x0,0x1040(%rbx)
   140128530:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128536:	movzbl 0x0(%rbp),%eax
   14012853a:	lea    0x297b5f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128541:	add    $0x1,%rbp
   140128545:	mov    (%rdi,%rax,8),%rax
   140128549:	jmp    *%rax
   14012854b:	movabs $0xfffb000000000000,%rax
   140128555:	mov    %rax,0x3a8(%rsp)
   14012855d:	mov    %rax,0x3b0(%rsp)
   140128565:	cmp    $0x2,%r12b
   140128569:	jne    14013020d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc93d>
   14012856f:	mov    0x1c8(%rsp),%rax
   140128577:	mov    $0x1,%r12d
   14012857d:	mov    %rax,0x3b0(%rsp)
   140128585:	mov    0x1d0(%rsp),%rax
   14012858d:	mov    %rax,0x3a8(%rsp)
   140128595:	mov    0x3a8(%rsp),%rdx
   14012859d:	movabs $0xffff000000000000,%rax
   1401285a7:	movabs $0xfff8000000000000,%r8
   1401285b1:	and    %rax,%rdx
   1401285b4:	cmp    %r8,%rdx
   1401285b7:	je     14012bc80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83b0>
   1401285bd:	movabs $0xffff000000000000,%rdx
   1401285c7:	movb   $0x30,-0x1(%rbp)
   1401285cb:	mov    0x3a8(%rsp),%rax
   1401285d3:	movabs $0xfff8000000000000,%r8
   1401285dd:	mov    %rax,%rcx
   1401285e0:	and    %rdx,%rcx
   1401285e3:	cmp    %r8,%rcx
   1401285e6:	je     14012c294 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89c4>
   1401285ec:	movabs $0xfffd000000000000,%r8
   1401285f6:	cmp    %r8,%rcx
   1401285f9:	je     14012c287 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89b7>
   1401285ff:	movabs $0xfff7ffffffffffff,%rcx
   140128609:	cmp    %rax,%rcx
   14012860c:	jae    14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   140128612:	movabs $0xfffc000000000000,%r9
   14012861c:	cmp    %r9,%rax
   14012861f:	je     14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   140128625:	mov    0x3b0(%rsp),%rax
   14012862d:	cmp    %r9,%rax
   140128630:	je     14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   140128636:	cmp    %rax,%rcx
   140128639:	jae    14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   14012863f:	and    %rax,%rdx
   140128642:	cmp    %r8,%rdx
   140128645:	je     14013118b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8bb>
   14012864b:	lea    0x3a8(%rsp),%rcx
   140128653:	vzeroupper
   140128656:	call   14021a530 <setun::VMValue::as_int() const>
   14012865b:	lea    0x3b0(%rsp),%rcx
   140128663:	mov    %rax,%rdi
   140128666:	call   14021a530 <setun::VMValue::as_int() const>
   14012866b:	cmp    %rax,%rdi
   14012866e:	sete   %dil
   140128672:	movabs $0xfffa000000000000,%rdx
   14012867c:	movzbl %dil,%eax
   140128680:	add    %rdx,%rax
   140128683:	mov    %rax,0x1c8(%rsp)
   14012868b:	cmpb   $0x0,0x1040(%rbx)
   140128692:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128698:	movzbl 0x0(%rbp),%eax
   14012869c:	lea    0x2979fd(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401286a3:	add    $0x1,%rbp
   1401286a7:	mov    (%rdi,%rax,8),%rax
   1401286ab:	jmp    *%rax
   1401286ad:	movabs $0xfffb000000000000,%rax
   1401286b7:	mov    %rax,0x3b8(%rsp)
   1401286bf:	mov    %rax,0x3c0(%rsp)
   1401286c7:	cmp    $0x2,%r12b
   1401286cb:	jne    14012fa81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1b1>
   1401286d1:	mov    0x1c8(%rsp),%rax
   1401286d9:	mov    $0x1,%r12d
   1401286df:	mov    %rax,0x3c0(%rsp)
   1401286e7:	mov    0x1d0(%rsp),%rax
   1401286ef:	mov    %rax,0x3b8(%rsp)
   1401286f7:	mov    0x3b8(%rsp),%rcx
   1401286ff:	movabs $0xffff000000000000,%rax
   140128709:	movabs $0xfff8000000000000,%r8
   140128713:	and    %rax,%rcx
   140128716:	cmp    %r8,%rcx
   140128719:	je     14012b1c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78f2>
   14012871f:	movabs $0xffff000000000000,%rdx
   140128729:	movb   $0x34,-0x1(%rbp)
   14012872d:	mov    0x3b8(%rsp),%rax
   140128735:	movabs $0xfff8000000000000,%r8
   14012873f:	mov    %rax,%rcx
   140128742:	and    %rdx,%rcx
   140128745:	cmp    %r8,%rcx
   140128748:	je     14012be22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8552>
   14012874e:	movabs $0xfffd000000000000,%r8
   140128758:	cmp    %r8,%rcx
   14012875b:	je     14012be15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8545>
   140128761:	movabs $0xfff7ffffffffffff,%rcx
   14012876b:	cmp    %rax,%rcx
   14012876e:	jae    14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   140128774:	movabs $0xfffc000000000000,%r9
   14012877e:	cmp    %r9,%rax
   140128781:	je     14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   140128787:	mov    0x3c0(%rsp),%rax
   14012878f:	cmp    %rax,%rcx
   140128792:	jae    14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   140128798:	cmp    %r9,%rax
   14012879b:	je     14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   1401287a1:	and    %rax,%rdx
   1401287a4:	cmp    %r8,%rdx
   1401287a7:	je     140131306 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda36>
   1401287ad:	lea    0x3b8(%rsp),%rcx
   1401287b5:	vzeroupper
   1401287b8:	call   14021a530 <setun::VMValue::as_int() const>
   1401287bd:	lea    0x3c0(%rsp),%rcx
   1401287c5:	mov    %rax,%rdi
   1401287c8:	call   14021a530 <setun::VMValue::as_int() const>
   1401287cd:	cmp    %rax,%rdi
   1401287d0:	setg   %al
   1401287d3:	movabs $0xfffa000000000000,%rdx
   1401287dd:	movzbl %al,%eax
   1401287e0:	add    %rdx,%rax
   1401287e3:	mov    %rax,0x1c8(%rsp)
   1401287eb:	cmpb   $0x0,0x1040(%rbx)
   1401287f2:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401287f8:	movzbl 0x0(%rbp),%eax
   1401287fc:	lea    0x29789d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128803:	add    $0x1,%rbp
   140128807:	mov    (%rdi,%rax,8),%rax
   14012880b:	jmp    *%rax
   14012880d:	movabs $0xfffb000000000000,%rax
   140128817:	mov    %rax,0x3c8(%rsp)
   14012881f:	mov    %rax,0x3d0(%rsp)
   140128827:	cmp    $0x2,%r12b
   14012882b:	jne    1401301ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8dd>
   140128831:	mov    0x1c8(%rsp),%rax
   140128839:	mov    $0x1,%r12d
   14012883f:	mov    %rax,0x3d0(%rsp)
   140128847:	mov    0x1d0(%rsp),%rax
   14012884f:	mov    %rax,0x3c8(%rsp)
   140128857:	mov    0x3c8(%rsp),%rcx
   14012885f:	movabs $0xffff000000000000,%rax
   140128869:	movabs $0xfff8000000000000,%r8
   140128873:	and    %rax,%rcx
   140128876:	cmp    %r8,%rcx
   140128879:	je     14012bc17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8347>
   14012887f:	movabs $0xffff000000000000,%rdx
   140128889:	movb   $0x35,-0x1(%rbp)
   14012888d:	mov    0x3c8(%rsp),%rax
   140128895:	movabs $0xfff8000000000000,%r8
   14012889f:	mov    %rax,%rcx
   1401288a2:	and    %rdx,%rcx
   1401288a5:	cmp    %r8,%rcx
   1401288a8:	je     14012c177 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88a7>
   1401288ae:	movabs $0xfffd000000000000,%r8
   1401288b8:	cmp    %r8,%rcx
   1401288bb:	je     14012c16a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x889a>
   1401288c1:	movabs $0xfff7ffffffffffff,%rcx
   1401288cb:	cmp    %rax,%rcx
   1401288ce:	jae    14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   1401288d4:	movabs $0xfffc000000000000,%r9
   1401288de:	cmp    %r9,%rax
   1401288e1:	je     14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   1401288e7:	mov    0x3d0(%rsp),%rax
   1401288ef:	cmp    %r9,%rax
   1401288f2:	je     14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   1401288f8:	cmp    %rax,%rcx
   1401288fb:	jae    14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   140128901:	and    %rax,%rdx
   140128904:	cmp    %r8,%rdx
   140128907:	je     140130ac6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1f6>
   14012890d:	lea    0x3c8(%rsp),%rcx
   140128915:	vzeroupper
   140128918:	call   14021a530 <setun::VMValue::as_int() const>
   14012891d:	lea    0x3d0(%rsp),%rcx
   140128925:	mov    %rax,%rdi
   140128928:	call   14021a530 <setun::VMValue::as_int() const>
   14012892d:	cmp    %rax,%rdi
   140128930:	setge  %al
   140128933:	movabs $0xfffa000000000000,%rdx
   14012893d:	movzbl %al,%eax
   140128940:	add    %rdx,%rax
   140128943:	mov    %rax,0x1c8(%rsp)
   14012894b:	cmpb   $0x0,0x1040(%rbx)
   140128952:	je     14012a270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128958:	movzbl 0x0(%rbp),%eax
   14012895c:	lea    0x29773d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128963:	add    $0x1,%rbp
   140128967:	mov    (%rdi,%rax,8),%rax
   14012896b:	jmp    *%rax
   14012896d:	lea    0x2(%rbp),%rax
   140128971:	movzwl 0x0(%rbp),%edx
   140128975:	mov    %rax,0x60(%rsp)
   14012897a:	mov    0xb8(%r14),%rax
   140128981:	lea    (%rax,%rdx,8),%r9
   140128985:	test   %r12b,%r12b
   140128988:	je     14012f700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe30>
   14012898e:	movabs $0xffffffff00000000,%rax
   140128998:	movabs $0xfffd000200000000,%rdx
   1401289a2:	and    0x1c8(%rsp),%rax
   1401289aa:	cmp    %rdx,%rax
   1401289ad:	je     14012c8a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fd0>
   1401289b3:	cmp    $0x1,%r12b
   1401289b7:	jne    14012cb05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9235>
   1401289bd:	mov    0x1c8(%rsp),%rax
   1401289c5:	movabs $0xffff000000000000,%rdx
   1401289cf:	movabs $0xfffd000000000000,%rcx
   1401289d9:	and    %rax,%rdx
   1401289dc:	mov    %rax,0x3e0(%rsp)
   1401289e4:	cmp    %rcx,%rdx
   1401289e7:	je     14012d63e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d6e>
   1401289ed:	mov    $0x1,%r12d
   1401289f3:	movabs $0xfff8000000000000,%rax
   1401289fd:	mov    %rax,0x1c8(%rsp)
   140128a05:	cmpb   $0x0,0x1040(%rbx)
   140128a0c:	je     14012e2b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e0>
   140128a12:	movzbl 0x2(%rbp),%eax
   140128a16:	lea    0x297683(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128a1d:	add    $0x3,%rbp
   140128a21:	mov    (%rdi,%rax,8),%rax
   140128a25:	jmp    *%rax
   140128a27:	cmp    $0x2,%r12b
   140128a2b:	je     14012aa35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7165>
   140128a31:	cmp    $0x1,%r12b
   140128a35:	je     14012e1b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8e1>
   140128a3b:	mov    0x1048(%rbx),%rdx
   140128a42:	mov    0x1050(%rbx),%rax
   140128a49:	vzeroupper
   140128a4c:	sub    %rdx,%rsi
   140128a4f:	sub    %r15,%rbp
   140128a52:	sub    %rdx,%rax
   140128a55:	mov    %rsi,%rdi
   140128a58:	mov    %rbp,0x1038(%rbx)
   140128a5f:	sar    $0x3,%rdi
   140128a63:	cmp    %rsi,%rax
   140128a66:	jb     14012d4ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bfa>
   140128a6c:	vmovdqa 0x23406c(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128a74:	mov    %rdi,0x1060(%rbx)
   140128a7b:	mov    %r14,%rdx
   140128a7e:	mov    %rbx,%rcx
   140128a81:	movb   $0x0,0x153a0(%rbx)
   140128a88:	vmovdqa %xmm0,0x15390(%rbx)
   140128a90:	call   140101100 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   140128a95:	mov    0x1060(%rbx),%rax
   140128a9c:	mov    0x1048(%rbx),%rdx
   140128aa3:	mov    0x1038(%rbx),%rcx
   140128aaa:	mov    0x150c0(%rbx),%r13
   140128ab1:	lea    (%rdx,%rax,8),%rsi
   140128ab5:	mov    0x1050(%rbx),%rax
   140128abc:	add    %r15,%rcx
   140128abf:	mov    %rax,0x38(%rsp)
   140128ac4:	test   %r13,%r13
   140128ac7:	je     140128ad6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5206>
   140128ac9:	lea    -0x5(%r13,%r13,4),%r8
   140128ace:	mov    0x10c8(%rbx,%r8,8),%r13
   140128ad6:	cmpb   $0x0,0x1040(%rbx)
   140128add:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128ae3:	movzbl (%rcx),%eax
   140128ae6:	lea    0x2975b3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128aed:	lea    0x1(%rcx),%rbp
   140128af1:	xor    %r12d,%r12d
   140128af4:	mov    (%rdi,%rax,8),%rax
   140128af8:	jmp    *%rax
   140128afa:	cmp    $0x2,%r12b
   140128afe:	je     14012ad15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7445>
   140128b04:	cmp    $0x1,%r12b
   140128b08:	je     14012d9ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0ea>
   140128b0e:	mov    0x1048(%rbx),%rdx
   140128b15:	mov    0x1050(%rbx),%rax
   140128b1c:	vzeroupper
   140128b1f:	sub    %rdx,%rsi
   140128b22:	sub    %r15,%rbp
   140128b25:	sub    %rdx,%rax
   140128b28:	mov    %rsi,%rdi
   140128b2b:	mov    %rbp,0x1038(%rbx)
   140128b32:	sar    $0x3,%rdi
   140128b36:	cmp    %rsi,%rax
   140128b39:	jb     14012d5db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d0b>
   140128b3f:	vmovdqa 0x233f99(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128b47:	mov    %rdi,0x1060(%rbx)
   140128b4e:	mov    %r14,%rdx
   140128b51:	mov    %rbx,%rcx
   140128b54:	movb   $0x0,0x153a0(%rbx)
   140128b5b:	vmovdqa %xmm0,0x15390(%rbx)
   140128b63:	call   140105bf0 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   140128b68:	mov    0x1060(%rbx),%rax
   140128b6f:	mov    0x1048(%rbx),%rdx
   140128b76:	mov    0x1038(%rbx),%rcx
   140128b7d:	mov    0x150c0(%rbx),%r13
   140128b84:	lea    (%rdx,%rax,8),%rsi
   140128b88:	mov    0x1050(%rbx),%rax
   140128b8f:	add    %r15,%rcx
   140128b92:	mov    %rax,0x38(%rsp)
   140128b97:	test   %r13,%r13
   140128b9a:	je     140128ba9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52d9>
   140128b9c:	lea    -0x5(%r13,%r13,4),%r8
   140128ba1:	mov    0x10c8(%rbx,%r8,8),%r13
   140128ba9:	cmpb   $0x0,0x1040(%rbx)
   140128bb0:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128bb6:	movzbl (%rcx),%eax
   140128bb9:	lea    0x2974e0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128bc0:	lea    0x1(%rcx),%rbp
   140128bc4:	xor    %r12d,%r12d
   140128bc7:	mov    (%rdi,%rax,8),%rax
   140128bcb:	jmp    *%rax
   140128bcd:	cmp    $0x2,%r12b
   140128bd1:	je     14012ae11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7541>
   140128bd7:	cmp    $0x1,%r12b
   140128bdb:	je     14012e04f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa77f>
   140128be1:	mov    0x1048(%rbx),%rdx
   140128be8:	mov    0x1050(%rbx),%rax
   140128bef:	vzeroupper
   140128bf2:	sub    %rdx,%rsi
   140128bf5:	sub    %r15,%rbp
   140128bf8:	sub    %rdx,%rax
   140128bfb:	mov    %rsi,%rdi
   140128bfe:	mov    %rbp,0x1038(%rbx)
   140128c05:	sar    $0x3,%rdi
   140128c09:	cmp    %rsi,%rax
   140128c0c:	jb     14012d2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99e9>
   140128c12:	vmovdqa 0x233ec6(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128c1a:	mov    %rdi,0x1060(%rbx)
   140128c21:	mov    %r14,%rdx
   140128c24:	mov    %rbx,%rcx
   140128c27:	movb   $0x0,0x153a0(%rbx)
   140128c2e:	vmovdqa %xmm0,0x15390(%rbx)
   140128c36:	call   14010bde0 <setun::VM::handle_println(setun::Chunk const&)>
   140128c3b:	mov    0x1060(%rbx),%rax
   140128c42:	mov    0x1048(%rbx),%rdx
   140128c49:	mov    0x1038(%rbx),%rcx
   140128c50:	mov    0x150c0(%rbx),%r13
   140128c57:	lea    (%rdx,%rax,8),%rsi
   140128c5b:	mov    0x1050(%rbx),%rax
   140128c62:	add    %r15,%rcx
   140128c65:	mov    %rax,0x38(%rsp)
   140128c6a:	test   %r13,%r13
   140128c6d:	je     140128c7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53ac>
   140128c6f:	lea    -0x5(%r13,%r13,4),%r8
   140128c74:	mov    0x10c8(%rbx,%r8,8),%r13
   140128c7c:	cmpb   $0x0,0x1040(%rbx)
   140128c83:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128c89:	movzbl (%rcx),%eax
   140128c8c:	lea    0x29740d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128c93:	lea    0x1(%rcx),%rbp
   140128c97:	xor    %r12d,%r12d
   140128c9a:	mov    (%rdi,%rax,8),%rax
   140128c9e:	jmp    *%rax
   140128ca0:	cmp    $0x2,%r12b
   140128ca4:	je     14012a89b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fcb>
   140128caa:	cmp    $0x1,%r12b
   140128cae:	je     14012df2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa65b>
   140128cb4:	mov    0x1048(%rbx),%rdx
   140128cbb:	mov    0x1050(%rbx),%rax
   140128cc2:	vzeroupper
   140128cc5:	sub    %rdx,%rsi
   140128cc8:	sub    %r15,%rbp
   140128ccb:	sub    %rdx,%rax
   140128cce:	mov    %rsi,%rdi
   140128cd1:	mov    %rbp,0x1038(%rbx)
   140128cd8:	sar    $0x3,%rdi
   140128cdc:	cmp    %rsi,%rax
   140128cdf:	jb     14012d337 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a67>
   140128ce5:	vmovdqa 0x233df3(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128ced:	mov    %rdi,0x1060(%rbx)
   140128cf4:	mov    %r14,%rdx
   140128cf7:	mov    %rbx,%rcx
   140128cfa:	movb   $0x0,0x153a0(%rbx)
   140128d01:	vmovdqa %xmm0,0x15390(%rbx)
   140128d09:	call   14010c590 <setun::VM::handle_trace(setun::Chunk const&)>
   140128d0e:	mov    0x1060(%rbx),%rax
   140128d15:	mov    0x1048(%rbx),%rdx
   140128d1c:	mov    0x1038(%rbx),%rcx
   140128d23:	mov    0x150c0(%rbx),%r13
   140128d2a:	lea    (%rdx,%rax,8),%rsi
   140128d2e:	mov    0x1050(%rbx),%rax
   140128d35:	add    %r15,%rcx
   140128d38:	mov    %rax,0x38(%rsp)
   140128d3d:	test   %r13,%r13
   140128d40:	je     140128d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x547f>
   140128d42:	lea    -0x5(%r13,%r13,4),%r8
   140128d47:	mov    0x10c8(%rbx,%r8,8),%r13
   140128d4f:	cmpb   $0x0,0x1040(%rbx)
   140128d56:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128d5c:	movzbl (%rcx),%eax
   140128d5f:	lea    0x29733a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128d66:	lea    0x1(%rcx),%rbp
   140128d6a:	xor    %r12d,%r12d
   140128d6d:	mov    (%rdi,%rax,8),%rax
   140128d71:	jmp    *%rax
   140128d73:	cmp    $0x2,%r12b
   140128d77:	je     14012ad54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7484>
   140128d7d:	cmp    $0x1,%r12b
   140128d81:	je     14012e118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa848>
   140128d87:	mov    0x1048(%rbx),%rdx
   140128d8e:	mov    0x1050(%rbx),%rax
   140128d95:	vzeroupper
   140128d98:	sub    %rdx,%rsi
   140128d9b:	sub    %r15,%rbp
   140128d9e:	sub    %rdx,%rax
   140128da1:	mov    %rsi,%rdi
   140128da4:	mov    %rbp,0x1038(%rbx)
   140128dab:	sar    $0x3,%rdi
   140128daf:	cmp    %rsi,%rax
   140128db2:	jb     14012d2e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a13>
   140128db8:	vmovdqa 0x233d20(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128dc0:	mov    %rdi,0x1060(%rbx)
   140128dc7:	mov    %r14,%rdx
   140128dca:	mov    %rbx,%rcx
   140128dcd:	movb   $0x0,0x153a0(%rbx)
   140128dd4:	vmovdqa %xmm0,0x15390(%rbx)
   140128ddc:	call   140110f10 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   140128de1:	mov    0x1060(%rbx),%rax
   140128de8:	mov    0x1048(%rbx),%rdx
   140128def:	mov    0x1038(%rbx),%rcx
   140128df6:	mov    0x150c0(%rbx),%r13
   140128dfd:	lea    (%rdx,%rax,8),%rsi
   140128e01:	mov    0x1050(%rbx),%rax
   140128e08:	add    %r15,%rcx
   140128e0b:	mov    %rax,0x38(%rsp)
   140128e10:	test   %r13,%r13
   140128e13:	je     140128e22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5552>
   140128e15:	lea    -0x5(%r13,%r13,4),%r8
   140128e1a:	mov    0x10c8(%rbx,%r8,8),%r13
   140128e22:	cmpb   $0x0,0x1040(%rbx)
   140128e29:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128e2f:	movzbl (%rcx),%eax
   140128e32:	lea    0x297267(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128e39:	lea    0x1(%rcx),%rbp
   140128e3d:	xor    %r12d,%r12d
   140128e40:	mov    (%rdi,%rax,8),%rax
   140128e44:	jmp    *%rax
   140128e46:	cmp    $0x2,%r12b
   140128e4a:	je     14012ab31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7261>
   140128e50:	cmp    $0x1,%r12b
   140128e54:	je     14012e1e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa914>
   140128e5a:	mov    0x1048(%rbx),%rdx
   140128e61:	mov    0x1050(%rbx),%rax
   140128e68:	vzeroupper
   140128e6b:	sub    %rdx,%rsi
   140128e6e:	sub    %r15,%rbp
   140128e71:	sub    %rdx,%rax
   140128e74:	mov    %rsi,%rdi
   140128e77:	mov    %rbp,0x1038(%rbx)
   140128e7e:	sar    $0x3,%rdi
   140128e82:	cmp    %rsi,%rax
   140128e85:	jb     14012d2ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99fe>
   140128e8b:	vmovdqa 0x233c4d(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128e93:	mov    %rdi,0x1060(%rbx)
   140128e9a:	mov    %r14,%rdx
   140128e9d:	mov    %rbx,%rcx
   140128ea0:	movb   $0x0,0x153a0(%rbx)
   140128ea7:	vmovdqa %xmm0,0x15390(%rbx)
   140128eaf:	call   140102910 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140128eb4:	mov    0x1060(%rbx),%rax
   140128ebb:	mov    0x1048(%rbx),%rdx
   140128ec2:	mov    0x1038(%rbx),%rcx
   140128ec9:	mov    0x150c0(%rbx),%r13
   140128ed0:	lea    (%rdx,%rax,8),%rsi
   140128ed4:	mov    0x1050(%rbx),%rax
   140128edb:	add    %r15,%rcx
   140128ede:	mov    %rax,0x38(%rsp)
   140128ee3:	test   %r13,%r13
   140128ee6:	je     140128ef5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5625>
   140128ee8:	lea    -0x5(%r13,%r13,4),%r8
   140128eed:	mov    0x10c8(%rbx,%r8,8),%r13
   140128ef5:	cmpb   $0x0,0x1040(%rbx)
   140128efc:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128f02:	movzbl (%rcx),%eax
   140128f05:	lea    0x297194(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128f0c:	lea    0x1(%rcx),%rbp
   140128f10:	xor    %r12d,%r12d
   140128f13:	mov    (%rdi,%rax,8),%rax
   140128f17:	jmp    *%rax
   140128f19:	cmp    $0x2,%r12b
   140128f1d:	je     14012ae8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75bf>
   140128f23:	cmp    $0x1,%r12b
   140128f27:	je     14012dc1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa34e>
   140128f2d:	mov    0x1048(%rbx),%rdx
   140128f34:	mov    0x1050(%rbx),%rax
   140128f3b:	vzeroupper
   140128f3e:	sub    %rdx,%rsi
   140128f41:	sub    %r15,%rbp
   140128f44:	sub    %rdx,%rax
   140128f47:	mov    %rsi,%rdi
   140128f4a:	mov    %rbp,0x1038(%rbx)
   140128f51:	sar    $0x3,%rdi
   140128f55:	cmp    %rsi,%rax
   140128f58:	jb     14012d509 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c39>
   140128f5e:	vmovdqa 0x233b7a(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140128f66:	mov    %rdi,0x1060(%rbx)
   140128f6d:	mov    %r14,%rdx
   140128f70:	mov    %rbx,%rcx
   140128f73:	movb   $0x0,0x153a0(%rbx)
   140128f7a:	vmovdqa %xmm0,0x15390(%rbx)
   140128f82:	call   1401014f0 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140128f87:	mov    0x1060(%rbx),%rax
   140128f8e:	mov    0x1048(%rbx),%rdx
   140128f95:	mov    0x1038(%rbx),%rcx
   140128f9c:	mov    0x150c0(%rbx),%r13
   140128fa3:	lea    (%rdx,%rax,8),%rsi
   140128fa7:	mov    0x1050(%rbx),%rax
   140128fae:	add    %r15,%rcx
   140128fb1:	mov    %rax,0x38(%rsp)
   140128fb6:	test   %r13,%r13
   140128fb9:	je     140128fc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x56f8>
   140128fbb:	lea    -0x5(%r13,%r13,4),%r8
   140128fc0:	mov    0x10c8(%rbx,%r8,8),%r13
   140128fc8:	cmpb   $0x0,0x1040(%rbx)
   140128fcf:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140128fd5:	movzbl (%rcx),%eax
   140128fd8:	lea    0x2970c1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128fdf:	lea    0x1(%rcx),%rbp
   140128fe3:	xor    %r12d,%r12d
   140128fe6:	mov    (%rdi,%rax,8),%rax
   140128fea:	jmp    *%rax
   140128fec:	cmp    $0x2,%r12b
   140128ff0:	je     14012a81d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f4d>
   140128ff6:	cmp    $0x1,%r12b
   140128ffa:	je     14012dde4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa514>
   140129000:	mov    0x1048(%rbx),%rdx
   140129007:	mov    0x1050(%rbx),%rax
   14012900e:	vzeroupper
   140129011:	sub    %rdx,%rsi
   140129014:	sub    %r15,%rbp
   140129017:	sub    %rdx,%rax
   14012901a:	mov    %rsi,%rdi
   14012901d:	mov    %rbp,0x1038(%rbx)
   140129024:	sar    $0x3,%rdi
   140129028:	cmp    %rsi,%rax
   14012902b:	jb     14012d2f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a28>
   140129031:	vmovdqa 0x233aa7(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129039:	mov    %rdi,0x1060(%rbx)
   140129040:	mov    %r14,%rdx
   140129043:	mov    %rbx,%rcx
   140129046:	movb   $0x0,0x153a0(%rbx)
   14012904d:	vmovdqa %xmm0,0x15390(%rbx)
   140129055:	call   1400fefb0 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   14012905a:	mov    0x1060(%rbx),%rax
   140129061:	mov    0x1048(%rbx),%rdx
   140129068:	mov    0x1038(%rbx),%rcx
   14012906f:	mov    0x150c0(%rbx),%r13
   140129076:	lea    (%rdx,%rax,8),%rsi
   14012907a:	mov    0x1050(%rbx),%rax
   140129081:	add    %r15,%rcx
   140129084:	mov    %rax,0x38(%rsp)
   140129089:	test   %r13,%r13
   14012908c:	je     14012909b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57cb>
   14012908e:	lea    -0x5(%r13,%r13,4),%r8
   140129093:	mov    0x10c8(%rbx,%r8,8),%r13
   14012909b:	cmpb   $0x0,0x1040(%rbx)
   1401290a2:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401290a8:	movzbl (%rcx),%eax
   1401290ab:	lea    0x296fee(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401290b2:	lea    0x1(%rcx),%rbp
   1401290b6:	xor    %r12d,%r12d
   1401290b9:	mov    (%rdi,%rax,8),%rax
   1401290bd:	jmp    *%rax
   1401290bf:	cmp    $0x2,%r12b
   1401290c3:	je     14012ac97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73c7>
   1401290c9:	cmp    $0x1,%r12b
   1401290cd:	je     14012dcb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3e7>
   1401290d3:	mov    0x1048(%rbx),%rdx
   1401290da:	mov    0x1050(%rbx),%rax
   1401290e1:	vzeroupper
   1401290e4:	sub    %rdx,%rsi
   1401290e7:	sub    %r15,%rbp
   1401290ea:	sub    %rdx,%rax
   1401290ed:	mov    %rsi,%rdi
   1401290f0:	mov    %rbp,0x1038(%rbx)
   1401290f7:	sar    $0x3,%rdi
   1401290fb:	cmp    %rsi,%rax
   1401290fe:	jb     14012d51e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c4e>
   140129104:	vmovdqa 0x2339d4(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012910c:	mov    %rdi,0x1060(%rbx)
   140129113:	mov    %r14,%rdx
   140129116:	mov    %rbx,%rcx
   140129119:	movb   $0x0,0x153a0(%rbx)
   140129120:	vmovdqa %xmm0,0x15390(%rbx)
   140129128:	call   140102c70 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   14012912d:	mov    0x1060(%rbx),%rax
   140129134:	mov    0x1048(%rbx),%rdx
   14012913b:	mov    0x1038(%rbx),%rcx
   140129142:	mov    0x150c0(%rbx),%r13
   140129149:	lea    (%rdx,%rax,8),%rsi
   14012914d:	mov    0x1050(%rbx),%rax
   140129154:	add    %r15,%rcx
   140129157:	mov    %rax,0x38(%rsp)
   14012915c:	test   %r13,%r13
   14012915f:	je     14012916e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x589e>
   140129161:	lea    -0x5(%r13,%r13,4),%r8
   140129166:	mov    0x10c8(%rbx,%r8,8),%r13
   14012916e:	cmpb   $0x0,0x1040(%rbx)
   140129175:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   14012917b:	movzbl (%rcx),%eax
   14012917e:	lea    0x296f1b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129185:	lea    0x1(%rcx),%rbp
   140129189:	xor    %r12d,%r12d
   14012918c:	mov    (%rdi,%rax,8),%rax
   140129190:	jmp    *%rax
   140129192:	cmp    $0x2,%r12b
   140129196:	je     14012aab3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71e3>
   14012919c:	cmp    $0x1,%r12b
   1401291a0:	je     14012dbb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2e8>
   1401291a6:	mov    0x1048(%rbx),%rdx
   1401291ad:	mov    0x1050(%rbx),%rax
   1401291b4:	vzeroupper
   1401291b7:	sub    %rdx,%rsi
   1401291ba:	sub    %r15,%rbp
   1401291bd:	sub    %rdx,%rax
   1401291c0:	mov    %rsi,%rdi
   1401291c3:	mov    %rbp,0x1038(%rbx)
   1401291ca:	sar    $0x3,%rdi
   1401291ce:	cmp    %rsi,%rax
   1401291d1:	jb     14012d34c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a7c>
   1401291d7:	vmovdqa 0x233901(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401291df:	mov    %rdi,0x1060(%rbx)
   1401291e6:	mov    %r14,%rdx
   1401291e9:	mov    %rbx,%rcx
   1401291ec:	movb   $0x0,0x153a0(%rbx)
   1401291f3:	vmovdqa %xmm0,0x15390(%rbx)
   1401291fb:	call   1400ff2b0 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140129200:	mov    0x1060(%rbx),%rax
   140129207:	mov    0x1048(%rbx),%rdx
   14012920e:	mov    0x1038(%rbx),%rcx
   140129215:	mov    0x150c0(%rbx),%r13
   14012921c:	lea    (%rdx,%rax,8),%rsi
   140129220:	mov    0x1050(%rbx),%rax
   140129227:	add    %r15,%rcx
   14012922a:	mov    %rax,0x38(%rsp)
   14012922f:	test   %r13,%r13
   140129232:	je     140129241 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5971>
   140129234:	lea    -0x5(%r13,%r13,4),%r8
   140129239:	mov    0x10c8(%rbx,%r8,8),%r13
   140129241:	cmpb   $0x0,0x1040(%rbx)
   140129248:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   14012924e:	movzbl (%rcx),%eax
   140129251:	lea    0x296e48(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129258:	lea    0x1(%rcx),%rbp
   14012925c:	xor    %r12d,%r12d
   14012925f:	mov    (%rdi,%rax,8),%rax
   140129263:	jmp    *%rax
   140129265:	cmp    $0x2,%r12b
   140129269:	je     14012acd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7406>
   14012926f:	cmp    $0x1,%r12b
   140129273:	je     14012dc84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3b4>
   140129279:	mov    0x1048(%rbx),%rdx
   140129280:	mov    0x1050(%rbx),%rax
   140129287:	vzeroupper
   14012928a:	sub    %rdx,%rsi
   14012928d:	sub    %r15,%rbp
   140129290:	sub    %rdx,%rax
   140129293:	mov    %rsi,%rdi
   140129296:	mov    %rbp,0x1038(%rbx)
   14012929d:	sar    $0x3,%rdi
   1401292a1:	cmp    %rsi,%rax
   1401292a4:	jb     14012d4f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c24>
   1401292aa:	vmovdqa 0x23382e(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401292b2:	mov    %rdi,0x1060(%rbx)
   1401292b9:	mov    %r14,%rdx
   1401292bc:	mov    %rbx,%rcx
   1401292bf:	movb   $0x0,0x153a0(%rbx)
   1401292c6:	vmovdqa %xmm0,0x15390(%rbx)
   1401292ce:	call   1401025f0 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   1401292d3:	mov    0x1060(%rbx),%rax
   1401292da:	mov    0x1048(%rbx),%rdx
   1401292e1:	mov    0x1038(%rbx),%rcx
   1401292e8:	mov    0x150c0(%rbx),%r13
   1401292ef:	lea    (%rdx,%rax,8),%rsi
   1401292f3:	mov    0x1050(%rbx),%rax
   1401292fa:	add    %r15,%rcx
   1401292fd:	mov    %rax,0x38(%rsp)
   140129302:	test   %r13,%r13
   140129305:	je     140129314 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a44>
   140129307:	lea    -0x5(%r13,%r13,4),%r8
   14012930c:	mov    0x10c8(%rbx,%r8,8),%r13
   140129314:	cmpb   $0x0,0x1040(%rbx)
   14012931b:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129321:	movzbl (%rcx),%eax
   140129324:	lea    0x296d75(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012932b:	lea    0x1(%rcx),%rbp
   14012932f:	xor    %r12d,%r12d
   140129332:	mov    (%rdi,%rax,8),%rax
   140129336:	jmp    *%rax
   140129338:	cmp    $0x2,%r12b
   14012933c:	je     14012a9b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70e7>
   140129342:	cmp    $0x1,%r12b
   140129346:	je     14012db85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2b5>
   14012934c:	mov    0x1048(%rbx),%rdx
   140129353:	mov    0x1050(%rbx),%rax
   14012935a:	vzeroupper
   14012935d:	sub    %rdx,%rsi
   140129360:	sub    %r15,%rbp
   140129363:	sub    %rdx,%rax
   140129366:	mov    %rsi,%rdi
   140129369:	mov    %rbp,0x1038(%rbx)
   140129370:	sar    $0x3,%rdi
   140129374:	cmp    %rsi,%rax
   140129377:	jb     14012d533 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c63>
   14012937d:	vmovdqa 0x23375b(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129385:	mov    %rdi,0x1060(%rbx)
   14012938c:	mov    %r14,%rdx
   14012938f:	mov    %rbx,%rcx
   140129392:	movb   $0x0,0x153a0(%rbx)
   140129399:	vmovdqa %xmm0,0x15390(%rbx)
   1401293a1:	call   1401035a0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   1401293a6:	mov    0x1060(%rbx),%rax
   1401293ad:	mov    0x1048(%rbx),%rdx
   1401293b4:	mov    0x1038(%rbx),%rcx
   1401293bb:	mov    0x150c0(%rbx),%r13
   1401293c2:	lea    (%rdx,%rax,8),%rsi
   1401293c6:	mov    0x1050(%rbx),%rax
   1401293cd:	add    %r15,%rcx
   1401293d0:	mov    %rax,0x38(%rsp)
   1401293d5:	test   %r13,%r13
   1401293d8:	je     1401293e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b17>
   1401293da:	lea    -0x5(%r13,%r13,4),%r8
   1401293df:	mov    0x10c8(%rbx,%r8,8),%r13
   1401293e7:	cmpb   $0x0,0x1040(%rbx)
   1401293ee:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401293f4:	movzbl (%rcx),%eax
   1401293f7:	lea    0x296ca2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401293fe:	lea    0x1(%rcx),%rbp
   140129402:	xor    %r12d,%r12d
   140129405:	mov    (%rdi,%rax,8),%rax
   140129409:	jmp    *%rax
   14012940b:	cmp    $0x2,%r12b
   14012940f:	je     14012add2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7502>
   140129415:	cmp    $0x1,%r12b
   140129419:	je     14012dbeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa31b>
   14012941f:	mov    0x1048(%rbx),%rdx
   140129426:	mov    0x1050(%rbx),%rax
   14012942d:	vzeroupper
   140129430:	sub    %rdx,%rsi
   140129433:	sub    %r15,%rbp
   140129436:	sub    %rdx,%rax
   140129439:	mov    %rsi,%rdi
   14012943c:	mov    %rbp,0x1038(%rbx)
   140129443:	sar    $0x3,%rdi
   140129447:	cmp    %rsi,%rax
   14012944a:	jb     14012d55d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c8d>
   140129450:	vmovdqa 0x233688(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129458:	mov    %rdi,0x1060(%rbx)
   14012945f:	mov    %r14,%rdx
   140129462:	mov    %rbx,%rcx
   140129465:	movb   $0x0,0x153a0(%rbx)
   14012946c:	vmovdqa %xmm0,0x15390(%rbx)
   140129474:	call   1400ff5b0 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   140129479:	mov    0x1060(%rbx),%rax
   140129480:	mov    0x1048(%rbx),%rdx
   140129487:	mov    0x1038(%rbx),%rcx
   14012948e:	mov    0x150c0(%rbx),%r13
   140129495:	lea    (%rdx,%rax,8),%rsi
   140129499:	mov    0x1050(%rbx),%rax
   1401294a0:	add    %r15,%rcx
   1401294a3:	mov    %rax,0x38(%rsp)
   1401294a8:	test   %r13,%r13
   1401294ab:	je     1401294ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5bea>
   1401294ad:	lea    -0x5(%r13,%r13,4),%r8
   1401294b2:	mov    0x10c8(%rbx,%r8,8),%r13
   1401294ba:	cmpb   $0x0,0x1040(%rbx)
   1401294c1:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401294c7:	movzbl (%rcx),%eax
   1401294ca:	lea    0x296bcf(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401294d1:	lea    0x1(%rcx),%rbp
   1401294d5:	xor    %r12d,%r12d
   1401294d8:	mov    (%rdi,%rax,8),%rax
   1401294dc:	jmp    *%rax
   1401294de:	cmp    $0x2,%r12b
   1401294e2:	je     14012abac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72dc>
   1401294e8:	cmp    $0x1,%r12b
   1401294ec:	je     14012dc51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa381>
   1401294f2:	mov    0x1048(%rbx),%rdx
   1401294f9:	mov    0x1050(%rbx),%rax
   140129500:	vzeroupper
   140129503:	sub    %rdx,%rsi
   140129506:	sub    %r15,%rbp
   140129509:	sub    %rdx,%rax
   14012950c:	mov    %rsi,%rdi
   14012950f:	mov    %rbp,0x1038(%rbx)
   140129516:	sar    $0x3,%rdi
   14012951a:	cmp    %rsi,%rax
   14012951d:	jb     14012d548 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c78>
   140129523:	vmovdqa 0x2335b5(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012952b:	mov    %rdi,0x1060(%rbx)
   140129532:	mov    %r14,%rdx
   140129535:	mov    %rbx,%rcx
   140129538:	movb   $0x0,0x153a0(%rbx)
   14012953f:	vmovdqa %xmm0,0x15390(%rbx)
   140129547:	call   1400ff8b0 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   14012954c:	mov    0x1060(%rbx),%rax
   140129553:	mov    0x1048(%rbx),%rdx
   14012955a:	mov    0x1038(%rbx),%rcx
   140129561:	mov    0x150c0(%rbx),%r13
   140129568:	lea    (%rdx,%rax,8),%rsi
   14012956c:	mov    0x1050(%rbx),%rax
   140129573:	add    %r15,%rcx
   140129576:	mov    %rax,0x38(%rsp)
   14012957b:	test   %r13,%r13
   14012957e:	je     14012958d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5cbd>
   140129580:	lea    -0x5(%r13,%r13,4),%r8
   140129585:	mov    0x10c8(%rbx,%r8,8),%r13
   14012958d:	cmpb   $0x0,0x1040(%rbx)
   140129594:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   14012959a:	movzbl (%rcx),%eax
   14012959d:	lea    0x296afc(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401295a4:	lea    0x1(%rcx),%rbp
   1401295a8:	xor    %r12d,%r12d
   1401295ab:	mov    (%rdi,%rax,8),%rax
   1401295af:	jmp    *%rax
   1401295b1:	cmp    $0x2,%r12b
   1401295b5:	je     14012ae50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7580>
   1401295bb:	cmp    $0x1,%r12b
   1401295bf:	je     14012e01c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa74c>
   1401295c5:	mov    0x1048(%rbx),%rdx
   1401295cc:	mov    0x1050(%rbx),%rax
   1401295d3:	vzeroupper
   1401295d6:	sub    %rdx,%rsi
   1401295d9:	sub    %r15,%rbp
   1401295dc:	sub    %rdx,%rax
   1401295df:	mov    %rsi,%rdi
   1401295e2:	mov    %rbp,0x1038(%rbx)
   1401295e9:	sar    $0x3,%rdi
   1401295ed:	cmp    %rsi,%rax
   1401295f0:	jb     14012d361 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a91>
   1401295f6:	vmovdqa 0x2334e2(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401295fe:	mov    %rdi,0x1060(%rbx)
   140129605:	mov    %r14,%rdx
   140129608:	mov    %rbx,%rcx
   14012960b:	movb   $0x0,0x153a0(%rbx)
   140129612:	vmovdqa %xmm0,0x15390(%rbx)
   14012961a:	call   1400fe7e0 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   14012961f:	mov    0x1060(%rbx),%rax
   140129626:	mov    0x1048(%rbx),%rdx
   14012962d:	mov    0x1038(%rbx),%rcx
   140129634:	mov    0x150c0(%rbx),%r13
   14012963b:	lea    (%rdx,%rax,8),%rsi
   14012963f:	mov    0x1050(%rbx),%rax
   140129646:	add    %r15,%rcx
   140129649:	mov    %rax,0x38(%rsp)
   14012964e:	test   %r13,%r13
   140129651:	je     140129660 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d90>
   140129653:	lea    -0x5(%r13,%r13,4),%r8
   140129658:	mov    0x10c8(%rbx,%r8,8),%r13
   140129660:	cmpb   $0x0,0x1040(%rbx)
   140129667:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   14012966d:	movzbl (%rcx),%eax
   140129670:	lea    0x296a29(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129677:	lea    0x1(%rcx),%rbp
   14012967b:	xor    %r12d,%r12d
   14012967e:	mov    (%rdi,%rax,8),%rax
   140129682:	jmp    *%rax
   140129684:	cmp    $0x2,%r12b
   140129688:	je     14012b3ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b1a>
   14012968e:	cmp    $0x1,%r12b
   140129692:	je     14012df5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa68e>
   140129698:	mov    0x1048(%rbx),%rdx
   14012969f:	mov    0x1050(%rbx),%rax
   1401296a6:	vzeroupper
   1401296a9:	sub    %rdx,%rsi
   1401296ac:	sub    %r15,%rbp
   1401296af:	sub    %rdx,%rax
   1401296b2:	mov    %rsi,%rdi
   1401296b5:	mov    %rbp,0x1038(%rbx)
   1401296bc:	sar    $0x3,%rdi
   1401296c0:	cmp    %rsi,%rax
   1401296c3:	jb     14012d4df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c0f>
   1401296c9:	vmovdqa 0x23340f(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401296d1:	mov    %rdi,0x1060(%rbx)
   1401296d8:	mov    %r14,%rdx
   1401296db:	mov    %rbx,%rcx
   1401296de:	movb   $0x0,0x153a0(%rbx)
   1401296e5:	vmovdqa %xmm0,0x15390(%rbx)
   1401296ed:	call   14010e480 <setun::VM::handle_get_field(setun::Chunk const&)>
   1401296f2:	mov    0x1060(%rbx),%rax
   1401296f9:	mov    0x1048(%rbx),%rdx
   140129700:	mov    0x1038(%rbx),%rcx
   140129707:	mov    0x150c0(%rbx),%r13
   14012970e:	lea    (%rdx,%rax,8),%rsi
   140129712:	mov    0x1050(%rbx),%rax
   140129719:	add    %r15,%rcx
   14012971c:	mov    %rax,0x38(%rsp)
   140129721:	test   %r13,%r13
   140129724:	je     140129733 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e63>
   140129726:	lea    -0x5(%r13,%r13,4),%r8
   14012972b:	mov    0x10c8(%rbx,%r8,8),%r13
   140129733:	cmpb   $0x0,0x1040(%rbx)
   14012973a:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129740:	movzbl (%rcx),%eax
   140129743:	lea    0x296956(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012974a:	lea    0x1(%rcx),%rbp
   14012974e:	xor    %r12d,%r12d
   140129751:	mov    (%rdi,%rax,8),%rax
   140129755:	jmp    *%rax
   140129757:	cmp    $0x2,%r12b
   14012975b:	je     14012a85c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f8c>
   140129761:	cmp    $0x1,%r12b
   140129765:	je     14012e14b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa87b>
   14012976b:	mov    0x1048(%rbx),%rdx
   140129772:	mov    0x1050(%rbx),%rax
   140129779:	vzeroupper
   14012977c:	sub    %rdx,%rsi
   14012977f:	sub    %r15,%rbp
   140129782:	sub    %rdx,%rax
   140129785:	mov    %rsi,%rdi
   140129788:	mov    %rbp,0x1038(%rbx)
   14012978f:	sar    $0x3,%rdi
   140129793:	cmp    %rsi,%rax
   140129796:	jb     14012d4b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9be5>
   14012979c:	vmovdqa 0x23333c(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401297a4:	mov    %rdi,0x1060(%rbx)
   1401297ab:	mov    %r14,%rdx
   1401297ae:	mov    %rbx,%rcx
   1401297b1:	movb   $0x0,0x153a0(%rbx)
   1401297b8:	vmovdqa %xmm0,0x15390(%rbx)
   1401297c0:	call   140111fe0 <setun::VM::handle_new_instance(setun::Chunk const&)>
   1401297c5:	mov    0x1060(%rbx),%rax
   1401297cc:	mov    0x1048(%rbx),%rdx
   1401297d3:	mov    0x1038(%rbx),%rcx
   1401297da:	mov    0x150c0(%rbx),%r13
   1401297e1:	lea    (%rdx,%rax,8),%rsi
   1401297e5:	mov    0x1050(%rbx),%rax
   1401297ec:	add    %r15,%rcx
   1401297ef:	mov    %rax,0x38(%rsp)
   1401297f4:	test   %r13,%r13
   1401297f7:	je     140129806 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f36>
   1401297f9:	lea    -0x5(%r13,%r13,4),%r8
   1401297fe:	mov    0x10c8(%rbx,%r8,8),%r13
   140129806:	cmpb   $0x0,0x1040(%rbx)
   14012980d:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129813:	movzbl (%rcx),%eax
   140129816:	lea    0x296883(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012981d:	lea    0x1(%rcx),%rbp
   140129821:	xor    %r12d,%r12d
   140129824:	mov    (%rdi,%rax,8),%rax
   140129828:	jmp    *%rax
   14012982a:	cmp    $0x2,%r12b
   14012982e:	je     14012aaf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7222>
   140129834:	cmp    $0x1,%r12b
   140129838:	je     14012de17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa547>
   14012983e:	mov    0x1048(%rbx),%rdx
   140129845:	mov    0x1050(%rbx),%rax
   14012984c:	vzeroupper
   14012984f:	sub    %rdx,%rsi
   140129852:	sub    %r15,%rbp
   140129855:	sub    %rdx,%rax
   140129858:	mov    %rsi,%rdi
   14012985b:	mov    %rbp,0x1038(%rbx)
   140129862:	sar    $0x3,%rdi
   140129866:	cmp    %rsi,%rax
   140129869:	jb     14012d30d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a3d>
   14012986f:	vmovdqa 0x233269(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129877:	mov    %rdi,0x1060(%rbx)
   14012987e:	mov    %r14,%rdx
   140129881:	mov    %rbx,%rcx
   140129884:	movb   $0x0,0x153a0(%rbx)
   14012988b:	vmovdqa %xmm0,0x15390(%rbx)
   140129893:	call   140111940 <setun::VM::handle_set_field(setun::Chunk const&)>
   140129898:	mov    0x1060(%rbx),%rax
   14012989f:	mov    0x1048(%rbx),%rdx
   1401298a6:	mov    0x1038(%rbx),%rcx
   1401298ad:	mov    0x150c0(%rbx),%r13
   1401298b4:	lea    (%rdx,%rax,8),%rsi
   1401298b8:	mov    0x1050(%rbx),%rax
   1401298bf:	add    %r15,%rcx
   1401298c2:	mov    %rax,0x38(%rsp)
   1401298c7:	test   %r13,%r13
   1401298ca:	je     1401298d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6009>
   1401298cc:	lea    -0x5(%r13,%r13,4),%r8
   1401298d1:	mov    0x10c8(%rbx,%r8,8),%r13
   1401298d9:	cmpb   $0x0,0x1040(%rbx)
   1401298e0:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401298e6:	movzbl (%rcx),%eax
   1401298e9:	lea    0x2967b0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401298f0:	lea    0x1(%rcx),%rbp
   1401298f4:	xor    %r12d,%r12d
   1401298f7:	mov    (%rdi,%rax,8),%rax
   1401298fb:	jmp    *%rax
   1401298fd:	cmp    $0x2,%r12b
   140129901:	je     14012a7a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ed2>
   140129907:	cmp    $0x1,%r12b
   14012990b:	je     14012dcea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa41a>
   140129911:	mov    0x1048(%rbx),%rdx
   140129918:	mov    0x1050(%rbx),%rax
   14012991f:	vzeroupper
   140129922:	sub    %rdx,%rsi
   140129925:	sub    %r15,%rbp
   140129928:	sub    %rdx,%rax
   14012992b:	mov    %rsi,%rdi
   14012992e:	mov    %rbp,0x1038(%rbx)
   140129935:	sar    $0x3,%rdi
   140129939:	cmp    %rsi,%rax
   14012993c:	jb     14012d322 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a52>
   140129942:	vmovdqa 0x233196(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012994a:	mov    %rdi,0x1060(%rbx)
   140129951:	mov    %r14,%rdx
   140129954:	mov    %rbx,%rcx
   140129957:	movb   $0x0,0x153a0(%rbx)
   14012995e:	vmovdqa %xmm0,0x15390(%rbx)
   140129966:	call   140119350 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   14012996b:	mov    0x1060(%rbx),%rax
   140129972:	mov    0x1048(%rbx),%rdx
   140129979:	mov    0x1038(%rbx),%rcx
   140129980:	mov    0x150c0(%rbx),%r13
   140129987:	lea    (%rdx,%rax,8),%rsi
   14012998b:	mov    0x1050(%rbx),%rax
   140129992:	add    %r15,%rcx
   140129995:	mov    %rax,0x38(%rsp)
   14012999a:	test   %r13,%r13
   14012999d:	je     1401299ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60dc>
   14012999f:	lea    -0x5(%r13,%r13,4),%r8
   1401299a4:	mov    0x10c8(%rbx,%r8,8),%r13
   1401299ac:	cmpb   $0x0,0x1040(%rbx)
   1401299b3:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   1401299b9:	movzbl (%rcx),%eax
   1401299bc:	lea    0x2966dd(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401299c3:	lea    0x1(%rcx),%rbp
   1401299c7:	xor    %r12d,%r12d
   1401299ca:	mov    (%rdi,%rax,8),%rax
   1401299ce:	jmp    *%rax
   1401299d0:	cmp    $0x2,%r12b
   1401299d4:	je     14012ac2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x735a>
   1401299da:	cmp    $0x1,%r12b
   1401299de:	je     14012da20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa150>
   1401299e4:	mov    0x1048(%rbx),%rdx
   1401299eb:	mov    0x1050(%rbx),%rax
   1401299f2:	vzeroupper
   1401299f5:	sub    %rdx,%rsi
   1401299f8:	sub    %r15,%rbp
   1401299fb:	sub    %rdx,%rax
   1401299fe:	mov    %rsi,%rdi
   140129a01:	mov    %rbp,0x1038(%rbx)
   140129a08:	sar    $0x3,%rdi
   140129a0c:	cmp    %rsi,%rax
   140129a0f:	jb     14012d38b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9abb>
   140129a15:	vmovdqa 0x2330c3(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129a1d:	mov    %rdi,0x1060(%rbx)
   140129a24:	mov    %r14,%rdx
   140129a27:	mov    %rbx,%rcx
   140129a2a:	movb   $0x0,0x153a0(%rbx)
   140129a31:	vmovdqa %xmm0,0x15390(%rbx)
   140129a39:	call   1400fb660 <setun::VM::handle_try(setun::Chunk const&)>
   140129a3e:	mov    0x1060(%rbx),%rax
   140129a45:	mov    0x1048(%rbx),%rdx
   140129a4c:	mov    0x1038(%rbx),%rcx
   140129a53:	mov    0x150c0(%rbx),%r13
   140129a5a:	lea    (%rdx,%rax,8),%rsi
   140129a5e:	mov    0x1050(%rbx),%rax
   140129a65:	add    %r15,%rcx
   140129a68:	mov    %rax,0x38(%rsp)
   140129a6d:	test   %r13,%r13
   140129a70:	je     140129a7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61af>
   140129a72:	lea    -0x5(%r13,%r13,4),%r8
   140129a77:	mov    0x10c8(%rbx,%r8,8),%r13
   140129a7f:	cmpb   $0x0,0x1040(%rbx)
   140129a86:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129a8c:	movzbl (%rcx),%eax
   140129a8f:	lea    0x29660a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129a96:	lea    0x1(%rcx),%rbp
   140129a9a:	xor    %r12d,%r12d
   140129a9d:	mov    (%rdi,%rax,8),%rax
   140129aa1:	jmp    *%rax
   140129aa3:	cmp    $0x2,%r12b
   140129aa7:	je     14012a7e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f11>
   140129aad:	cmp    $0x1,%r12b
   140129ab1:	jne    140137b70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142a0>
   140129ab7:	mov    0x1048(%rbx),%rdx
   140129abe:	lea    0x8(%rsi),%r8
   140129ac2:	cmp    0x38(%rsp),%r8
   140129ac7:	jae    140131a68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe198>
   140129acd:	mov    0x1050(%rbx),%rax
   140129ad4:	vzeroupper
   140129ad7:	mov    0x1c8(%rsp),%rcx
   140129adf:	mov    %rcx,(%rsi)
   140129ae2:	sub    %rdx,%r8
   140129ae5:	sub    %r15,%rbp
   140129ae8:	sub    %rdx,%rax
   140129aeb:	mov    %r8,%rsi
   140129aee:	mov    %rbp,0x1038(%rbx)
   140129af5:	sar    $0x3,%rsi
   140129af9:	cmp    %r8,%rax
   140129afc:	jb     14012d587 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cb7>
   140129b02:	vmovdqa 0x232fd6(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129b0a:	mov    %rsi,0x1060(%rbx)
   140129b11:	mov    %r14,%rdx
   140129b14:	mov    %rbx,%rcx
   140129b17:	movb   $0x0,0x153a0(%rbx)
   140129b1e:	vmovdqa %xmm0,0x15390(%rbx)
   140129b26:	call   14010c910 <setun::VM::handle_throw(setun::Chunk const&)>
   140129b2b:	cmp    $0x2,%r12b
   140129b2f:	je     14012ab70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72a0>
   140129b35:	cmp    $0x1,%r12b
   140129b39:	je     14012e0b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7e5>
   140129b3f:	mov    0x1048(%rbx),%rdx
   140129b46:	mov    0x1050(%rbx),%rax
   140129b4d:	sub    %rdx,%rsi
   140129b50:	mov    %rax,%rcx
   140129b53:	sub    %r15,%rbp
   140129b56:	mov    %rsi,%rdi
   140129b59:	sub    %rdx,%rcx
   140129b5c:	mov    %rbp,0x1038(%rbx)
   140129b63:	sar    $0x3,%rdi
   140129b67:	cmp    %rsi,%rcx
   140129b6a:	jb     14012d23f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x996f>
   140129b70:	vmovdqa 0x232f68(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129b78:	mov    %rdi,0x1060(%rbx)
   140129b7f:	movb   $0x0,0x153a0(%rbx)
   140129b86:	mov    0x15108(%rbx),%rcx
   140129b8d:	vmovdqa %xmm0,0x15390(%rbx)
   140129b95:	cmp    0x15100(%rbx),%rcx
   140129b9c:	je     140129ba9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62d9>
   140129b9e:	sub    $0x20,%rcx
   140129ba2:	mov    %rcx,0x15108(%rbx)
   140129ba9:	mov    0x1038(%rbx),%rcx
   140129bb0:	mov    0x150c0(%rbx),%r13
   140129bb7:	mov    %rax,0x38(%rsp)
   140129bbc:	add    %rdx,%rsi
   140129bbf:	add    %r15,%rcx
   140129bc2:	test   %r13,%r13
   140129bc5:	je     140129bd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6304>
   140129bc7:	lea    -0x5(%r13,%r13,4),%r8
   140129bcc:	mov    0x10c8(%rbx,%r8,8),%r13
   140129bd4:	cmpb   $0x0,0x1040(%rbx)
   140129bdb:	je     14013011d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc84d>
   140129be1:	movzbl (%rcx),%eax
   140129be4:	lea    0x2964b5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129beb:	lea    0x1(%rcx),%rbp
   140129bef:	xor    %r12d,%r12d
   140129bf2:	mov    (%rdi,%rax,8),%rax
   140129bf6:	jmp    *%rax
   140129bf8:	cmp    $0x2,%r12b
   140129bfc:	je     14012abeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x731b>
   140129c02:	cmp    $0x1,%r12b
   140129c06:	je     14012de4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa57a>
   140129c0c:	mov    0x1048(%rbx),%rdx
   140129c13:	mov    0x1050(%rbx),%rax
   140129c1a:	vzeroupper
   140129c1d:	sub    %rdx,%rsi
   140129c20:	sub    %r15,%rbp
   140129c23:	sub    %rdx,%rax
   140129c26:	mov    %rsi,%rdi
   140129c29:	mov    %rbp,0x1038(%rbx)
   140129c30:	sar    $0x3,%rdi
   140129c34:	cmp    %rsi,%rax
   140129c37:	jb     14012d27a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99aa>
   140129c3d:	vmovdqa 0x232e9b(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129c45:	mov    %rdi,0x1060(%rbx)
   140129c4c:	mov    %r14,%rdx
   140129c4f:	mov    %rbx,%rcx
   140129c52:	movb   $0x0,0x153a0(%rbx)
   140129c59:	vmovdqa %xmm0,0x15390(%rbx)
   140129c61:	call   14010f200 <setun::VM::handle_closure(setun::Chunk const&)>
   140129c66:	mov    0x1060(%rbx),%rax
   140129c6d:	mov    0x1048(%rbx),%rdx
   140129c74:	mov    0x1038(%rbx),%rcx
   140129c7b:	mov    0x150c0(%rbx),%r13
   140129c82:	lea    (%rdx,%rax,8),%rsi
   140129c86:	mov    0x1050(%rbx),%rax
   140129c8d:	add    %r15,%rcx
   140129c90:	mov    %rax,0x38(%rsp)
   140129c95:	test   %r13,%r13
   140129c98:	je     140129ca7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63d7>
   140129c9a:	lea    -0x5(%r13,%r13,4),%r8
   140129c9f:	mov    0x10c8(%rbx,%r8,8),%r13
   140129ca7:	cmpb   $0x0,0x1040(%rbx)
   140129cae:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129cb4:	movzbl (%rcx),%eax
   140129cb7:	lea    0x2963e2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129cbe:	lea    0x1(%rcx),%rbp
   140129cc2:	xor    %r12d,%r12d
   140129cc5:	mov    (%rdi,%rax,8),%rax
   140129cc9:	jmp    *%rax
   140129ccb:	cmp    $0x2,%r12b
   140129ccf:	je     14012ad93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74c3>
   140129cd5:	cmp    $0x1,%r12b
   140129cd9:	je     14012dd7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4ae>
   140129cdf:	mov    0x1048(%rbx),%rdx
   140129ce6:	mov    0x1050(%rbx),%rax
   140129ced:	vzeroupper
   140129cf0:	sub    %rdx,%rsi
   140129cf3:	sub    %r15,%rbp
   140129cf6:	sub    %rdx,%rax
   140129cf9:	mov    %rsi,%rdi
   140129cfc:	mov    %rbp,0x1038(%rbx)
   140129d03:	sar    $0x3,%rdi
   140129d07:	cmp    %rsi,%rax
   140129d0a:	jb     14012d28f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   140129d10:	vmovdqa 0x232dc8(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140129d18:	mov    %rdi,0x1060(%rbx)
   140129d1f:	mov    %r14,%rdx
   140129d22:	mov    %rbx,%rcx
   140129d25:	movb   $0x0,0x153a0(%rbx)
   140129d2c:	vmovdqa %xmm0,0x15390(%rbx)
   140129d34:	call   14010fd10 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   140129d39:	mov    0x1060(%rbx),%rax
   140129d40:	mov    0x1048(%rbx),%rdx
   140129d47:	mov    0x1038(%rbx),%rcx
   140129d4e:	mov    0x150c0(%rbx),%r13
   140129d55:	lea    (%rdx,%rax,8),%rsi
   140129d59:	mov    0x1050(%rbx),%rax
   140129d60:	add    %r15,%rcx
   140129d63:	mov    %rax,0x38(%rsp)
   140129d68:	test   %r13,%r13
   140129d6b:	je     140129d7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64aa>
   140129d6d:	lea    -0x5(%r13,%r13,4),%r8
   140129d72:	mov    0x10c8(%rbx,%r8,8),%r13
   140129d7a:	cmpb   $0x0,0x1040(%rbx)
   140129d81:	je     14012cb70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92a0>
   140129d87:	movzbl (%rcx),%eax
   140129d8a:	lea    0x29630f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129d91:	lea    0x1(%rcx),%rbp
   140129d95:	xor    %r12d,%r12d
   140129d98:	mov    (%rdi,%rax,8),%rax
   140129d9c:	jmp    *%rax
   140129d9e:	movzwl 0x0(%rbp),%eax
   140129da2:	mov    %ax,0x40(%rsp)
   140129da7:	lea    0x2(%rbp),%rax
   140129dab:	mov    %rax,0xa0(%rsp)
   140129db3:	cmp    $0x2,%r12b
   140129db7:	je     14012bac5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81f5>
   140129dbd:	cmp    $0x1,%r12b
   140129dc1:	jne    14012d775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ea5>
   140129dc7:	lea    0x8(%rsi),%r8
   140129dcb:	cmp    0x38(%rsp),%r8
   140129dd0:	jae    140131f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe636>
   140129dd6:	vzeroupper
   140129dd9:	mov    0x1c8(%rsp),%rax
   140129de1:	xor    %r12d,%r12d
   140129de4:	mov    %rax,(%rsi)
   140129de7:	mov    %r8,%rsi
   140129dea:	mov    $0x90,%ecx
   140129def:	call   140338480 <operator new(unsigned long long)>
   140129df4:	vpxor  %xmm0,%xmm0,%xmm0
   140129df8:	mov    %rax,%rdi
   140129dfb:	mov    0x232d3e(%rip),%rax        # 14035cb40 <CSWTCH.3087+0x240>
   140129e02:	vmovdqu %ymm0,0x10(%rdi)
   140129e07:	lea    0x18(%rdi),%rcx
   140129e0b:	mov    %rax,0x8(%rdi)
   140129e0f:	lea    0x251dea(%rip),%rax        # 14037bc00 <vtable for std::_Sp_counted_ptr_inplace<setun::ArrayObject, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140129e16:	mov    %rax,(%rdi)
   140129e19:	lea    0x10(%rdi),%rax
   140129e1d:	mov    %rax,0x60(%rsp)
   140129e22:	movzwl 0x40(%rsp),%eax
   140129e27:	vmovdqu %ymm0,0x30(%rdi)
   140129e2c:	mov    %rax,0x80(%rsp)
   140129e34:	mov    %rax,%rdx
   140129e37:	vmovdqu %ymm0,0x50(%rdi)
   140129e3c:	vmovdqu %ymm0,0x70(%rdi)
   140129e41:	vzeroupper
   140129e44:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140129e49:	cmpw   $0x0,0x40(%rsp)
   140129e4f:	je     140129e96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65c6>
   140129e51:	mov    0x80(%rsp),%rax
   140129e59:	mov    0x18(%rdi),%rcx
   140129e5d:	mov    %rax,%rdx
   140129e60:	lea    (%rcx,%rax,8),%rcx
   140129e64:	xor    %eax,%eax
   140129e66:	neg    %rdx
   140129e69:	shl    $0x3,%rdx
   140129e6d:	nopl   0x0(%rax,%rax,1)
   140129e75:	data16 cs nopw 0x0(%rax,%rax,1)
   140129e80:	mov    -0x8(%rsi,%rax,1),%r8
   140129e85:	mov    %r8,-0x8(%rcx,%rax,1)
   140129e8a:	sub    $0x8,%rax
   140129e8e:	cmp    %rdx,%rax
   140129e91:	jne    140129e80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65b0>
   140129e93:	add    %rax,%rsi
   140129e96:	mov    0x60(%rsp),%rcx
   140129e9b:	call   14014b320 <setun::ArrayObject::try_promote()>
   140129ea0:	test   %r12b,%r12b
   140129ea3:	jne    14012ce89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95b9>
   140129ea9:	mov    0x60(%rsp),%rax
   140129eae:	mov    %rax,0x680(%rsp)
   140129eb6:	lock addl $0x1,0x8(%rdi)
   140129ebb:	lea    0x680(%rsp),%rdx
   140129ec3:	lea    0x540(%rsp),%rcx
   140129ecb:	mov    %rdi,0x688(%rsp)
   140129ed3:	call   14020ee00 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   140129ed8:	mov    0x540(%rsp),%rax
   140129ee0:	mov    0x688(%rsp),%rcx
   140129ee8:	mov    %rax,0x1c8(%rsp)
   140129ef0:	test   %rcx,%rcx
   140129ef3:	je     140129efa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x662a>
   140129ef5:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140129efa:	mov    $0x1,%r12d
   140129f00:	mov    %rdi,%rcx
   140129f03:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140129f08:	cmpb   $0x0,0x1040(%rbx)
   140129f0f:	je     14012d160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9890>
   140129f15:	movzbl 0x2(%rbp),%eax
   140129f19:	lea    0x296180(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129f20:	add    $0x3,%rbp
   140129f24:	mov    (%rdi,%rax,8),%rax
   140129f28:	jmp    *%rax
   140129f2a:	movabs $0xfffb000000000000,%rax
   140129f34:	mov    %rax,0x308(%rsp)
   140129f3c:	mov    %rax,0x310(%rsp)
   140129f44:	cmp    $0x2,%r12b
   140129f48:	jne    14012f76a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe9a>
   140129f4e:	mov    0x1c8(%rsp),%rax
   140129f56:	movabs $0xffff000000000000,%rdx
   140129f60:	movabs $0xfffd000000000000,%rcx
   140129f6a:	mov    %rax,0x310(%rsp)
   140129f72:	mov    0x1d0(%rsp),%rax
   140129f7a:	and    %rax,%rdx
   140129f7d:	mov    %rax,0x308(%rsp)
   140129f85:	cmp    %rcx,%rdx
   140129f88:	je     14012c3e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b14>
   140129f8e:	movabs $0xfff8000000000000,%rax
   140129f98:	mov    $0x1,%r12d
   140129f9e:	mov    %rax,0x1c8(%rsp)
   140129fa6:	cmpb   $0x0,0x1040(%rbx)
   140129fad:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140129fb3:	movzbl 0x0(%rbp),%eax
   140129fb7:	lea    0x2960e2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129fbe:	add    $0x1,%rbp
   140129fc2:	mov    (%rdi,%rax,8),%rax
   140129fc6:	jmp    *%rax
   140129fc8:	movabs $0xfffb000000000000,%rax
   140129fd2:	mov    %rax,0x318(%rsp)
   140129fda:	mov    %rax,0x320(%rsp)
   140129fe2:	cmp    $0x1,%r12b
   140129fe6:	jne    140130008 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc738>
   140129fec:	mov    0x1c8(%rsp),%rax
   140129ff4:	xor    %r12d,%r12d
   140129ff7:	mov    %rax,0x318(%rsp)
   140129fff:	mov    -0x8(%rsi),%rax
   14012a003:	sub    $0x10,%rsi
   14012a007:	mov    %rax,0x320(%rsp)
   14012a00f:	mov    (%rsi),%rdx
   14012a012:	movabs $0xffff000000000000,%rax
   14012a01c:	movabs $0xfffd000000000000,%rcx
   14012a026:	and    %rdx,%rax
   14012a029:	cmp    %rcx,%rax
   14012a02c:	je     14012ba00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8130>
   14012a032:	cmpb   $0x0,0x1040(%rbx)
   14012a039:	je     14012e217 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa947>
   14012a03f:	movzbl 0x0(%rbp),%eax
   14012a043:	lea    0x296056(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a04a:	add    $0x1,%rbp
   14012a04e:	mov    (%rdi,%rax,8),%rax
   14012a052:	jmp    *%rax
   14012a054:	test   %r12b,%r12b
   14012a057:	je     14012a3a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad5>
   14012a05d:	cmp    $0x1,%r12b
   14012a061:	je     14012e60b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad3b>
   14012a067:	lea    0x8(%rsi),%r8
   14012a06b:	cmp    0x38(%rsp),%r8
   14012a070:	jae    140132723 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee53>
   14012a076:	mov    0x1d0(%rsp),%rax
   14012a07e:	mov    %rax,(%rsi)
   14012a081:	mov    0x1c8(%rsp),%rax
   14012a089:	mov    %r8,%rsi
   14012a08c:	mov    %rax,0x1d0(%rsp)
   14012a094:	mov    0x1068(%rbx),%rax
   14012a09b:	mov    (%rax,%r13,8),%rax
   14012a09f:	mov    %rax,0x1c8(%rsp)
   14012a0a7:	cmpb   $0x0,0x1040(%rbx)
   14012a0ae:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a0b4:	movzbl 0x0(%rbp),%eax
   14012a0b8:	lea    0x295fe1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a0bf:	add    $0x1,%rbp
   14012a0c3:	mov    (%rdi,%rax,8),%rax
   14012a0c7:	jmp    *%rax
   14012a0c9:	test   %r12b,%r12b
   14012a0cc:	je     14012a367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a97>
   14012a0d2:	cmp    $0x1,%r12b
   14012a0d6:	je     14012e5dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad0c>
   14012a0dc:	lea    0x8(%rsi),%r8
   14012a0e0:	cmp    0x38(%rsp),%r8
   14012a0e5:	jae    140132e3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf56e>
   14012a0eb:	mov    0x1d0(%rsp),%rax
   14012a0f3:	mov    %rax,(%rsi)
   14012a0f6:	mov    0x1c8(%rsp),%rax
   14012a0fe:	mov    %r8,%rsi
   14012a101:	mov    %rax,0x1d0(%rsp)
   14012a109:	mov    0x1068(%rbx),%rax
   14012a110:	mov    0x8(%rax,%r13,8),%rax
   14012a115:	mov    %rax,0x1c8(%rsp)
   14012a11d:	cmpb   $0x0,0x1040(%rbx)
   14012a124:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a12a:	movzbl 0x0(%rbp),%eax
   14012a12e:	lea    0x295f6b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a135:	add    $0x1,%rbp
   14012a139:	mov    (%rdi,%rax,8),%rax
   14012a13d:	jmp    *%rax
   14012a13f:	test   %r12b,%r12b
   14012a142:	je     14012a386 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ab6>
   14012a148:	cmp    $0x1,%r12b
   14012a14c:	je     14012e5ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacdd>
   14012a152:	lea    0x8(%rsi),%r8
   14012a156:	cmp    0x38(%rsp),%r8
   14012a15b:	jae    140132de3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf513>
   14012a161:	mov    0x1d0(%rsp),%rax
   14012a169:	mov    %rax,(%rsi)
   14012a16c:	mov    0x1c8(%rsp),%rax
   14012a174:	mov    %r8,%rsi
   14012a177:	mov    %rax,0x1d0(%rsp)
   14012a17f:	mov    0x1068(%rbx),%rax
   14012a186:	mov    0x10(%rax,%r13,8),%rax
   14012a18b:	mov    %rax,0x1c8(%rsp)
   14012a193:	cmpb   $0x0,0x1040(%rbx)
   14012a19a:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a1a0:	movzbl 0x0(%rbp),%eax
   14012a1a4:	lea    0x295ef5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a1ab:	add    $0x1,%rbp
   14012a1af:	mov    (%rdi,%rax,8),%rax
   14012a1b3:	jmp    *%rax
   14012a1b5:	test   %r12b,%r12b
   14012a1b8:	je     14012a348 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a78>
   14012a1be:	cmp    $0x1,%r12b
   14012a1c2:	je     14012e57e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacae>
   14012a1c8:	lea    0x8(%rsi),%r8
   14012a1cc:	cmp    0x38(%rsp),%r8
   14012a1d1:	jae    140132d88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4b8>
   14012a1d7:	mov    0x1d0(%rsp),%rax
   14012a1df:	mov    %rax,(%rsi)
   14012a1e2:	mov    0x1c8(%rsp),%rax
   14012a1ea:	mov    %r8,%rsi
   14012a1ed:	mov    %rax,0x1d0(%rsp)
   14012a1f5:	mov    0x1068(%rbx),%rax
   14012a1fc:	mov    0x18(%rax,%r13,8),%rax
   14012a201:	mov    %rax,0x1c8(%rsp)
   14012a209:	cmpb   $0x0,0x1040(%rbx)
   14012a210:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a216:	movzbl 0x0(%rbp),%eax
   14012a21a:	lea    0x295e7f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a221:	add    $0x1,%rbp
   14012a225:	mov    (%rdi,%rax,8),%rax
   14012a229:	jmp    *%rax
   14012a22b:	lea    -0x8(%rsi),%rdx
   14012a22f:	lea    0x1c8(%rsp),%rax
   14012a237:	test   %r12b,%r12b
   14012a23a:	cmove  %rdx,%rax
   14012a23e:	mov    0x1068(%rbx),%rdx
   14012a245:	mov    (%rax),%rax
   14012a248:	mov    %rax,(%rdx,%r13,8)
   14012a24c:	cmpb   $0x0,0x1040(%rbx)
   14012a253:	je     14012a320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a259:	movzbl 0x0(%rbp),%eax
   14012a25d:	lea    0x295e3c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a264:	add    $0x1,%rbp
   14012a268:	mov    (%rdi,%rax,8),%rax
   14012a26c:	jmp    *%rax
   14012a26e:	xchg   %ax,%ax
   14012a270:	mov    0x1048(%rbx),%rdx
   14012a277:	mov    0x1050(%rbx),%rax
   14012a27e:	lea    0x8(%rsi),%r8
   14012a282:	cmp    0x38(%rsp),%r8
   14012a287:	jae    14012d3a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ad0>
   14012a28d:	mov    0x1c8(%rsp),%rcx
   14012a295:	mov    %rcx,(%rsi)
   14012a298:	mov    %r8,%rsi
   14012a29b:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a2a0:	mov    $0x1,%r12d
   14012a2a6:	mov    0x60(%rsp),%rbp
   14012a2ab:	mov    0x1048(%rbx),%rdx
   14012a2b2:	nopl   (%rax)
   14012a2b5:	data16 cs nopw 0x0(%rax,%rax,1)
   14012a2c0:	cmp    $0x1,%r12b
   14012a2c4:	je     14012a277 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012a2c6:	mov    0x1050(%rbx),%rax
   14012a2cd:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a2d2:	nopw   0x0(%rax,%rax,1)
   14012a2d8:	lea    0x0(%rbp,%rbp,1),%rdx
   14012a2dd:	lea    0x1048(%rbx),%rcx
   14012a2e4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a2e9:	jmp    14012451c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4c>
   14012a2ee:	xchg   %ax,%ax
   14012a2f0:	mov    (%r12),%rdx
   14012a2f4:	mov    %rax,0x38(%rsp)
   14012a2f9:	mov    %r12,%rcx
   14012a2fc:	movq   $0x0,0x8(%r12)
   14012a305:	call   *0x10(%rdx)
   14012a308:	mov    (%r12),%rdx
   14012a30c:	mov    %r12,%rcx
   14012a30f:	call   *0x18(%rdx)
   14012a312:	mov    0x38(%rsp),%rax
   14012a317:	jmp    140123a6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012a31c:	mov    %r8,%rbp
   14012a31f:	nop
   14012a320:	mov    0x1048(%rbx),%rdx
   14012a327:	vzeroupper
   14012a32a:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012a32f:	mov    0x1048(%rbx),%rdx
   14012a336:	vzeroupper
   14012a339:	mov    0x1050(%rbx),%rax
   14012a340:	mov    %rcx,%rbp
   14012a343:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a348:	mov    0x1068(%rbx),%rax
   14012a34f:	mov    $0x1,%r12d
   14012a355:	mov    0x18(%rax,%r13,8),%rax
   14012a35a:	mov    %rax,0x1c8(%rsp)
   14012a362:	jmp    14012a209 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6939>
   14012a367:	mov    0x1068(%rbx),%rax
   14012a36e:	mov    $0x1,%r12d
   14012a374:	mov    0x8(%rax,%r13,8),%rax
   14012a379:	mov    %rax,0x1c8(%rsp)
   14012a381:	jmp    14012a11d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x684d>
   14012a386:	mov    0x1068(%rbx),%rax
   14012a38d:	mov    $0x1,%r12d
   14012a393:	mov    0x10(%rax,%r13,8),%rax
   14012a398:	mov    %rax,0x1c8(%rsp)
   14012a3a0:	jmp    14012a193 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68c3>
   14012a3a5:	mov    0x1068(%rbx),%rax
   14012a3ac:	mov    $0x1,%r12d
   14012a3b2:	mov    (%rax,%r13,8),%rax
   14012a3b6:	mov    %rax,0x1c8(%rsp)
   14012a3be:	jmp    14012a0a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67d7>
   14012a3c3:	cmp    $0x1,%dil
   14012a3c7:	je     14012e68d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadbd>
   14012a3cd:	test   %r12b,%r12b
   14012a3d0:	jne    14012e66e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad9e>
   14012a3d6:	movzbl %dil,%eax
   14012a3da:	mov    %rsi,%rdx
   14012a3dd:	movabs $0xfffd000200000000,%rcx
   14012a3e7:	shl    $0x3,%rax
   14012a3eb:	sub    %rax,%rdx
   14012a3ee:	movabs $0xffffffff00000000,%rax
   14012a3f8:	mov    -0x8(%rdx),%rdx
   14012a3fc:	and    %rdx,%rax
   14012a3ff:	cmp    %rcx,%rax
   14012a402:	je     14012ecaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3df>
   14012a408:	vzeroupper
   14012a40b:	jmp    140127963 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4093>
   14012a410:	cmp    $0x1,%r12b
   14012a414:	je     14012e6b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xade3>
   14012a41a:	lea    0x8(%rsi),%r8
   14012a41e:	cmp    0x38(%rsp),%r8
   14012a423:	jae    14013292a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf05a>
   14012a429:	mov    0x1d0(%rsp),%rdx
   14012a431:	vmovq  %rax,%xmm0
   14012a436:	vucomisd %xmm0,%xmm0
   14012a43a:	mov    %rdx,(%rsi)
   14012a43d:	mov    0x1c8(%rsp),%rdx
   14012a445:	mov    %r8,%rsi
   14012a448:	mov    %rdx,0x1d0(%rsp)
   14012a450:	movabs $0xfffc000000000000,%rdx
   14012a45a:	cmovp  %rdx,%rax
   14012a45e:	jmp    140124d10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1440>
   14012a463:	mov    -0x8(%rsi),%rax
   14012a467:	mov    $0x1,%r12d
   14012a46d:	mov    %rax,0x1c8(%rsp)
   14012a475:	jmp    140124e04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534>
   14012a47a:	mov    0x1068(%rbx),%rdx
   14012a481:	mov    $0x1,%r12d
   14012a487:	mov    (%rdx,%rax,8),%rax
   14012a48b:	mov    %rax,0x1c8(%rsp)
   14012a493:	jmp    140124e9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cf>
   14012a498:	cmp    $0x1,%r12b
   14012a49c:	je     14012e639 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad69>
   14012a4a2:	lea    0x8(%rsi),%r8
   14012a4a6:	cmp    0x38(%rsp),%r8
   14012a4ab:	jae    140132527 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec57>
   14012a4b1:	mov    0x1d0(%rsp),%rdx
   14012a4b9:	test   %al,%al
   14012a4bb:	movabs $0xfffa000000000001,%rax
   14012a4c5:	mov    %rdx,(%rsi)
   14012a4c8:	mov    0x1c8(%rsp),%rdx
   14012a4d0:	mov    %r8,%rsi
   14012a4d3:	mov    %rdx,0x1d0(%rsp)
   14012a4db:	movabs $0xfffa000000000000,%rdx
   14012a4e5:	cmovne %rax,%rdx
   14012a4e9:	jmp    140124d6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b>
   14012a4ee:	lea    0x1c8(%rsp),%rcx
   14012a4f6:	vzeroupper
   14012a4f9:	call   140219cd0 <setun::VMValue::neg() const>
   14012a4fe:	mov    %rax,0x1c8(%rsp)
   14012a506:	jmp    140125654 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d84>
   14012a50b:	movabs $0xfff9000000000000,%rdx
   14012a515:	mov    $0x1,%r12d
   14012a51b:	or     %rdx,%rax
   14012a51e:	jmp    140124be2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1312>
   14012a523:	mov    0x1080(%rbx),%rdx
   14012a52a:	mov    $0x1,%r12d
   14012a530:	mov    (%rdx,%rax,8),%rax
   14012a534:	mov    %rax,0x1c8(%rsp)
   14012a53c:	jmp    140124fad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16dd>
   14012a541:	mov    %r12,%rcx
   14012a544:	mov    %rax,0x38(%rsp)
   14012a549:	call   1402d7cf0 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release_last_use_cold()>
   14012a54e:	mov    0x38(%rsp),%rax
   14012a553:	jmp    140123a6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012a558:	mov    0x1078(%rcx),%r13
   14012a55f:	jmp    14012676d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e9d>
   14012a564:	cmp    %rbp,0xa0(%rsp)
   14012a56c:	setg   %dl
   14012a56f:	jmp    14012802a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x475a>
   14012a574:	mov    %rdx,%rax
   14012a577:	shr    $0x20,%rax
   14012a57b:	cmp    $0x5,%ax
   14012a57f:	jne    14012a5c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cf9>
   14012a581:	mov    0x2b0(%rsp),%rcx
   14012a589:	movabs $0xffff000000000000,%rax
   14012a593:	movabs $0xfff8000000000000,%r8
   14012a59d:	and    %rcx,%rax
   14012a5a0:	cmp    %r8,%rax
   14012a5a3:	je     140125ab8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a5a9:	movabs $0xffffffff00000000,%rax
   14012a5b3:	and    %rax,%rcx
   14012a5b6:	movabs $0xfffd000500000000,%rax
   14012a5c0:	cmp    %rax,%rcx
   14012a5c3:	je     140125ab8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a5c9:	mov    0x2b0(%rsp),%rax
   14012a5d1:	movabs $0xfffc000000000000,%rcx
   14012a5db:	cmp    %rcx,%rax
   14012a5de:	je     14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   14012a5e4:	movabs $0xfff7ffffffffffff,%rcx
   14012a5ee:	cmp    %rax,%rcx
   14012a5f1:	jae    14012ce4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x957c>
   14012a5f7:	movabs $0xffffffff00000000,%rcx
   14012a601:	movabs $0xfffd000000000000,%r8
   14012a60b:	and    %rcx,%rdx
   14012a60e:	cmp    %r8,%rdx
   14012a611:	je     14013124d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd97d>
   14012a617:	movabs $0xffff000000000000,%rcx
   14012a621:	and    %rax,%rcx
   14012a624:	cmp    %r8,%rcx
   14012a627:	je     140131ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe41d>
   14012a62d:	movabs $0xfffd000100000000,%rax
   14012a637:	cmp    %rax,%rdx
   14012a63a:	jne    140125ab8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a640:	lea    0x2b0(%rsp),%rdx
   14012a648:	lea    0x680(%rsp),%rcx
   14012a650:	vzeroupper
   14012a653:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a658:	lea    0x540(%rsp),%rax
   14012a660:	lea    0x2a8(%rsp),%rdx
   14012a668:	mov    %rax,%rcx
   14012a66b:	mov    %rax,0x40(%rsp)
   14012a670:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a675:	mov    0x40(%rsp),%rcx
   14012a67a:	lea    0x680(%rsp),%rdx
   14012a682:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012a687:	test   %eax,%eax
   14012a689:	setne  %al
   14012a68c:	jmp    140125ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   14012a691:	and    %rdx,%rax
   14012a694:	cmp    %r8,%rax
   14012a697:	je     14012ea91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1c1>
   14012a69d:	movabs $0xfffd000000000000,%r8
   14012a6a7:	cmp    %r8,%rax
   14012a6aa:	je     140130c36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd366>
   14012a6b0:	movabs $0xfffc000000000000,%rax
   14012a6ba:	cmp    %rax,%rdx
   14012a6bd:	je     14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   14012a6c3:	movabs $0xfff7ffffffffffff,%rax
   14012a6cd:	cmp    %rdx,%rax
   14012a6d0:	jae    14012d094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97c4>
   14012a6d6:	movabs $0xffffffff00000000,%rax
   14012a6e0:	movabs $0xfffd000000000000,%r8
   14012a6ea:	and    %rax,%rcx
   14012a6ed:	cmp    %r8,%rcx
   14012a6f0:	je     140130b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2c3>
   14012a6f6:	movabs $0xffff000000000000,%rax
   14012a700:	and    %rdx,%rax
   14012a703:	cmp    %r8,%rax
   14012a706:	je     14012e41f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab4f>
   14012a70c:	movabs $0xfffd000100000000,%rax
   14012a716:	cmp    %rax,%rcx
   14012a719:	jne    140125987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012a71f:	lea    0x2a0(%rsp),%rdx
   14012a727:	lea    0x680(%rsp),%rcx
   14012a72f:	vzeroupper
   14012a732:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a737:	lea    0x540(%rsp),%rax
   14012a73f:	lea    0x298(%rsp),%rdx
   14012a747:	mov    %rax,%rcx
   14012a74a:	mov    %rax,0x40(%rsp)
   14012a74f:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a754:	mov    0x40(%rsp),%rcx
   14012a759:	lea    0x680(%rsp),%rdx
   14012a761:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012a766:	test   %eax,%eax
   14012a768:	sete   %dil
   14012a76c:	jmp    1401259ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   14012a771:	lea    0x10(%rsi),%r8
   14012a775:	cmp    0x38(%rsp),%r8
   14012a77a:	jae    140132bc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2f8>
   14012a780:	mov    0x1d0(%rsp),%rdx
   14012a788:	xor    %r12d,%r12d
   14012a78b:	mov    %rdx,(%rsi)
   14012a78e:	mov    0x1c8(%rsp),%rdx
   14012a796:	mov    %rdx,0x8(%rsi)
   14012a79a:	mov    %r8,%rsi
   14012a79d:	jmp    140126537 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c67>
   14012a7a2:	mov    0x1048(%rbx),%rdx
   14012a7a9:	lea    0x10(%rsi),%r8
   14012a7ad:	cmp    0x38(%rsp),%r8
   14012a7b2:	jae    14013262b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed5b>
   14012a7b8:	mov    0x1050(%rbx),%rax
   14012a7bf:	vzeroupper
   14012a7c2:	mov    0x1d0(%rsp),%rcx
   14012a7ca:	mov    %rcx,(%rsi)
   14012a7cd:	mov    0x1c8(%rsp),%rcx
   14012a7d5:	mov    %rcx,0x8(%rsi)
   14012a7d9:	mov    %r8,%rsi
   14012a7dc:	jmp    140129922 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6052>
   14012a7e1:	mov    0x1048(%rbx),%rdx
   14012a7e8:	lea    0x10(%rsi),%r8
   14012a7ec:	cmp    0x38(%rsp),%r8
   14012a7f1:	jae    140133002 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf732>
   14012a7f7:	mov    0x1050(%rbx),%rax
   14012a7fe:	vzeroupper
   14012a801:	mov    0x1d0(%rsp),%rcx
   14012a809:	mov    %rcx,(%rsi)
   14012a80c:	mov    0x1c8(%rsp),%rcx
   14012a814:	mov    %rcx,0x8(%rsi)
   14012a818:	jmp    140129ae2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6212>
   14012a81d:	mov    0x1048(%rbx),%rdx
   14012a824:	lea    0x10(%rsi),%r8
   14012a828:	cmp    0x38(%rsp),%r8
   14012a82d:	jae    140132faa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6da>
   14012a833:	mov    0x1050(%rbx),%rax
   14012a83a:	vzeroupper
   14012a83d:	mov    0x1d0(%rsp),%rcx
   14012a845:	mov    %rcx,(%rsi)
   14012a848:	mov    0x1c8(%rsp),%rcx
   14012a850:	mov    %rcx,0x8(%rsi)
   14012a854:	mov    %r8,%rsi
   14012a857:	jmp    140129011 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5741>
   14012a85c:	mov    0x1048(%rbx),%rdx
   14012a863:	lea    0x10(%rsi),%r8
   14012a867:	cmp    0x38(%rsp),%r8
   14012a86c:	jae    14013202c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe75c>
   14012a872:	mov    0x1050(%rbx),%rax
   14012a879:	vzeroupper
   14012a87c:	mov    0x1d0(%rsp),%rcx
   14012a884:	mov    %rcx,(%rsi)
   14012a887:	mov    0x1c8(%rsp),%rcx
   14012a88f:	mov    %rcx,0x8(%rsi)
   14012a893:	mov    %r8,%rsi
   14012a896:	jmp    14012977c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5eac>
   14012a89b:	mov    0x1048(%rbx),%rdx
   14012a8a2:	lea    0x10(%rsi),%r8
   14012a8a6:	cmp    0x38(%rsp),%r8
   14012a8ab:	jae    14013282d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef5d>
   14012a8b1:	mov    0x1050(%rbx),%rax
   14012a8b8:	vzeroupper
   14012a8bb:	mov    0x1d0(%rsp),%rcx
   14012a8c3:	mov    %rcx,(%rsi)
   14012a8c6:	mov    0x1c8(%rsp),%rcx
   14012a8ce:	mov    %rcx,0x8(%rsi)
   14012a8d2:	mov    %r8,%rsi
   14012a8d5:	jmp    140128cc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53f5>
   14012a8da:	and    %rax,%rdx
   14012a8dd:	cmp    %r8,%rdx
   14012a8e0:	je     14012f2a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9d5>
   14012a8e6:	movabs $0xfffd000000000000,%r8
   14012a8f0:	cmp    %r8,%rdx
   14012a8f3:	je     1401310ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7dc>
   14012a8f9:	movabs $0xfffc000000000000,%rdx
   14012a903:	cmp    %rdx,%rax
   14012a906:	je     14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   14012a90c:	movabs $0xfff7ffffffffffff,%rdx
   14012a916:	cmp    %rax,%rdx
   14012a919:	jae    14012d0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9806>
   14012a91f:	movabs $0xffffffff00000000,%rdx
   14012a929:	movabs $0xfffd000000000000,%r8
   14012a933:	and    %rdx,%rcx
   14012a936:	cmp    %r8,%rcx
   14012a939:	je     140131000 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd730>
   14012a93f:	movabs $0xffff000000000000,%rdx
   14012a949:	and    %rax,%rdx
   14012a94c:	cmp    %r8,%rdx
   14012a94f:	je     14012e49f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabcf>
   14012a955:	movabs $0xfffd000100000000,%rax
   14012a95f:	cmp    %rax,%rcx
   14012a962:	jne    140125be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012a968:	lea    0x2c0(%rsp),%rdx
   14012a970:	lea    0x680(%rsp),%rcx
   14012a978:	vzeroupper
   14012a97b:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a980:	lea    0x540(%rsp),%rax
   14012a988:	lea    0x2b8(%rsp),%rdx
   14012a990:	mov    %rax,%rcx
   14012a993:	mov    %rax,0x40(%rsp)
   14012a998:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012a99d:	mov    0x40(%rsp),%rcx
   14012a9a2:	lea    0x680(%rsp),%rdx
   14012a9aa:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012a9af:	shr    $0x1f,%eax
   14012a9b2:	jmp    140125c0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   14012a9b7:	mov    0x1048(%rbx),%rdx
   14012a9be:	lea    0x10(%rsi),%r8
   14012a9c2:	cmp    0x38(%rsp),%r8
   14012a9c7:	jae    140132f7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6ae>
   14012a9cd:	mov    0x1050(%rbx),%rax
   14012a9d4:	vzeroupper
   14012a9d7:	mov    0x1d0(%rsp),%rcx
   14012a9df:	mov    %rcx,(%rsi)
   14012a9e2:	mov    0x1c8(%rsp),%rcx
   14012a9ea:	mov    %rcx,0x8(%rsi)
   14012a9ee:	mov    %r8,%rsi
   14012a9f1:	jmp    14012935d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a8d>
   14012a9f6:	mov    0x1048(%rbx),%rdx
   14012a9fd:	lea    0x10(%rsi),%r8
   14012aa01:	cmp    0x38(%rsp),%r8
   14012aa06:	jae    1401332de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa0e>
   14012aa0c:	mov    0x1050(%rbx),%rax
   14012aa13:	vzeroupper
   14012aa16:	mov    0x1d0(%rsp),%rcx
   14012aa1e:	mov    %rcx,(%rsi)
   14012aa21:	mov    0x1c8(%rsp),%rcx
   14012aa29:	mov    %rcx,0x8(%rsi)
   14012aa2d:	mov    %r8,%rsi
   14012aa30:	jmp    14012688f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fbf>
   14012aa35:	mov    0x1048(%rbx),%rdx
   14012aa3c:	lea    0x10(%rsi),%r8
   14012aa40:	cmp    0x38(%rsp),%r8
   14012aa45:	jae    1401324fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec2b>
   14012aa4b:	mov    0x1050(%rbx),%rax
   14012aa52:	vzeroupper
   14012aa55:	mov    0x1d0(%rsp),%rcx
   14012aa5d:	mov    %rcx,(%rsi)
   14012aa60:	mov    0x1c8(%rsp),%rcx
   14012aa68:	mov    %rcx,0x8(%rsi)
   14012aa6c:	mov    %r8,%rsi
   14012aa6f:	jmp    140128a4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x517c>
   14012aa74:	mov    0x1048(%rbx),%rdx
   14012aa7b:	lea    0x10(%rsi),%r8
   14012aa7f:	cmp    0x38(%rsp),%r8
   14012aa84:	jae    1401324cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebff>
   14012aa8a:	mov    0x1050(%rbx),%rax
   14012aa91:	vzeroupper
   14012aa94:	mov    0x1d0(%rsp),%rcx
   14012aa9c:	mov    %rcx,(%rsi)
   14012aa9f:	mov    0x1c8(%rsp),%rcx
   14012aaa7:	mov    %rcx,0x8(%rsi)
   14012aaab:	mov    %r8,%rsi
   14012aaae:	jmp    140126e54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3584>
   14012aab3:	mov    0x1048(%rbx),%rdx
   14012aaba:	lea    0x10(%rsi),%r8
   14012aabe:	cmp    0x38(%rsp),%r8
   14012aac3:	jae    140132f52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf682>
   14012aac9:	mov    0x1050(%rbx),%rax
   14012aad0:	vzeroupper
   14012aad3:	mov    0x1d0(%rsp),%rcx
   14012aadb:	mov    %rcx,(%rsi)
   14012aade:	mov    0x1c8(%rsp),%rcx
   14012aae6:	mov    %rcx,0x8(%rsi)
   14012aaea:	mov    %r8,%rsi
   14012aaed:	jmp    1401291b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58e7>
   14012aaf2:	mov    0x1048(%rbx),%rdx
   14012aaf9:	lea    0x10(%rsi),%r8
   14012aafd:	cmp    0x38(%rsp),%r8
   14012ab02:	jae    140132058 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe788>
   14012ab08:	mov    0x1050(%rbx),%rax
   14012ab0f:	vzeroupper
   14012ab12:	mov    0x1d0(%rsp),%rcx
   14012ab1a:	mov    %rcx,(%rsi)
   14012ab1d:	mov    0x1c8(%rsp),%rcx
   14012ab25:	mov    %rcx,0x8(%rsi)
   14012ab29:	mov    %r8,%rsi
   14012ab2c:	jmp    14012984f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f7f>
   14012ab31:	mov    0x1048(%rbx),%rdx
   14012ab38:	lea    0x10(%rsi),%r8
   14012ab3c:	cmp    0x38(%rsp),%r8
   14012ab41:	jae    140132657 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed87>
   14012ab47:	mov    0x1050(%rbx),%rax
   14012ab4e:	vzeroupper
   14012ab51:	mov    0x1d0(%rsp),%rcx
   14012ab59:	mov    %rcx,(%rsi)
   14012ab5c:	mov    0x1c8(%rsp),%rcx
   14012ab64:	mov    %rcx,0x8(%rsi)
   14012ab68:	mov    %r8,%rsi
   14012ab6b:	jmp    140128e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x559b>
   14012ab70:	mov    0x1048(%rbx),%rdx
   14012ab77:	lea    0x10(%rsi),%r8
   14012ab7b:	cmp    0x38(%rsp),%r8
   14012ab80:	jae    14013229d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9cd>
   14012ab86:	mov    0x1050(%rbx),%rax
   14012ab8d:	mov    0x1d0(%rsp),%rcx
   14012ab95:	mov    %rcx,(%rsi)
   14012ab98:	mov    0x1c8(%rsp),%rcx
   14012aba0:	mov    %rcx,0x8(%rsi)
   14012aba4:	mov    %r8,%rsi
   14012aba7:	jmp    140129b4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x627d>
   14012abac:	mov    0x1048(%rbx),%rdx
   14012abb3:	lea    0x10(%rsi),%r8
   14012abb7:	cmp    0x38(%rsp),%r8
   14012abbc:	jae    140132b22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf252>
   14012abc2:	mov    0x1050(%rbx),%rax
   14012abc9:	vzeroupper
   14012abcc:	mov    0x1d0(%rsp),%rcx
   14012abd4:	mov    %rcx,(%rsi)
   14012abd7:	mov    0x1c8(%rsp),%rcx
   14012abdf:	mov    %rcx,0x8(%rsi)
   14012abe3:	mov    %r8,%rsi
   14012abe6:	jmp    140129503 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c33>
   14012abeb:	mov    0x1048(%rbx),%rdx
   14012abf2:	lea    0x10(%rsi),%r8
   14012abf6:	cmp    0x38(%rsp),%r8
   14012abfb:	jae    1401322ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea1e>
   14012ac01:	mov    0x1050(%rbx),%rax
   14012ac08:	vzeroupper
   14012ac0b:	mov    0x1d0(%rsp),%rcx
   14012ac13:	mov    %rcx,(%rsi)
   14012ac16:	mov    0x1c8(%rsp),%rcx
   14012ac1e:	mov    %rcx,0x8(%rsi)
   14012ac22:	mov    %r8,%rsi
   14012ac25:	jmp    140129c1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x634d>
   14012ac2a:	mov    0x1048(%rbx),%rdx
   14012ac31:	lea    0x10(%rsi),%r8
   14012ac35:	cmp    0x38(%rsp),%r8
   14012ac3a:	jae    140132b9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2cc>
   14012ac40:	mov    0x1050(%rbx),%rax
   14012ac47:	vzeroupper
   14012ac4a:	mov    0x1d0(%rsp),%rcx
   14012ac52:	mov    %rcx,(%rsi)
   14012ac55:	mov    0x1c8(%rsp),%rcx
   14012ac5d:	mov    %rcx,0x8(%rsi)
   14012ac61:	mov    %r8,%rsi
   14012ac64:	jmp    1401299f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6125>
   14012ac69:	lea    0x680(%rsp),%rcx
   14012ac71:	mov    %rdi,%rdx
   14012ac74:	vzeroupper
   14012ac77:	mov    $0x1,%r12d
   14012ac7d:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012ac82:	mov    0x680(%rsp),%rax
   14012ac8a:	mov    %rax,0x1c8(%rsp)
   14012ac92:	jmp    140124b68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1298>
   14012ac97:	mov    0x1048(%rbx),%rdx
   14012ac9e:	lea    0x10(%rsi),%r8
   14012aca2:	cmp    0x38(%rsp),%r8
   14012aca7:	jae    14013221d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe94d>
   14012acad:	mov    0x1050(%rbx),%rax
   14012acb4:	vzeroupper
   14012acb7:	mov    0x1d0(%rsp),%rcx
   14012acbf:	mov    %rcx,(%rsi)
   14012acc2:	mov    0x1c8(%rsp),%rcx
   14012acca:	mov    %rcx,0x8(%rsi)
   14012acce:	mov    %r8,%rsi
   14012acd1:	jmp    1401290e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5814>
   14012acd6:	mov    0x1048(%rbx),%rdx
   14012acdd:	lea    0x10(%rsi),%r8
   14012ace1:	cmp    0x38(%rsp),%r8
   14012ace6:	jae    140132fd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf706>
   14012acec:	mov    0x1050(%rbx),%rax
   14012acf3:	vzeroupper
   14012acf6:	mov    0x1d0(%rsp),%rcx
   14012acfe:	mov    %rcx,(%rsi)
   14012ad01:	mov    0x1c8(%rsp),%rcx
   14012ad09:	mov    %rcx,0x8(%rsi)
   14012ad0d:	mov    %r8,%rsi
   14012ad10:	jmp    14012928a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59ba>
   14012ad15:	mov    0x1048(%rbx),%rdx
   14012ad1c:	lea    0x10(%rsi),%r8
   14012ad20:	cmp    0x38(%rsp),%r8
   14012ad25:	jae    140132084 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7b4>
   14012ad2b:	mov    0x1050(%rbx),%rax
   14012ad32:	vzeroupper
   14012ad35:	mov    0x1d0(%rsp),%rcx
   14012ad3d:	mov    %rcx,(%rsi)
   14012ad40:	mov    0x1c8(%rsp),%rcx
   14012ad48:	mov    %rcx,0x8(%rsi)
   14012ad4c:	mov    %r8,%rsi
   14012ad4f:	jmp    140128b1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x524f>
   14012ad54:	mov    0x1048(%rbx),%rdx
   14012ad5b:	lea    0x10(%rsi),%r8
   14012ad5f:	cmp    0x38(%rsp),%r8
   14012ad64:	jae    140132b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf27e>
   14012ad6a:	mov    0x1050(%rbx),%rax
   14012ad71:	vzeroupper
   14012ad74:	mov    0x1d0(%rsp),%rcx
   14012ad7c:	mov    %rcx,(%rsi)
   14012ad7f:	mov    0x1c8(%rsp),%rcx
   14012ad87:	mov    %rcx,0x8(%rsi)
   14012ad8b:	mov    %r8,%rsi
   14012ad8e:	jmp    140128d98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54c8>
   14012ad93:	mov    0x1048(%rbx),%rdx
   14012ad9a:	lea    0x10(%rsi),%r8
   14012ad9e:	cmp    0x38(%rsp),%r8
   14012ada3:	jae    1401323ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeaea>
   14012ada9:	mov    0x1050(%rbx),%rax
   14012adb0:	vzeroupper
   14012adb3:	mov    0x1d0(%rsp),%rcx
   14012adbb:	mov    %rcx,(%rsi)
   14012adbe:	mov    0x1c8(%rsp),%rcx
   14012adc6:	mov    %rcx,0x8(%rsi)
   14012adca:	mov    %r8,%rsi
   14012adcd:	jmp    140129cf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6420>
   14012add2:	mov    0x1048(%rbx),%rdx
   14012add9:	lea    0x10(%rsi),%r8
   14012addd:	cmp    0x38(%rsp),%r8
   14012ade2:	jae    1401332b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9e2>
   14012ade8:	mov    0x1050(%rbx),%rax
   14012adef:	vzeroupper
   14012adf2:	mov    0x1d0(%rsp),%rcx
   14012adfa:	mov    %rcx,(%rsi)
   14012adfd:	mov    0x1c8(%rsp),%rcx
   14012ae05:	mov    %rcx,0x8(%rsi)
   14012ae09:	mov    %r8,%rsi
   14012ae0c:	jmp    140129430 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b60>
   14012ae11:	mov    0x1048(%rbx),%rdx
   14012ae18:	lea    0x10(%rsi),%r8
   14012ae1c:	cmp    0x38(%rsp),%r8
   14012ae21:	jae    1401323e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb16>
   14012ae27:	mov    0x1050(%rbx),%rax
   14012ae2e:	vzeroupper
   14012ae31:	mov    0x1d0(%rsp),%rcx
   14012ae39:	mov    %rcx,(%rsi)
   14012ae3c:	mov    0x1c8(%rsp),%rcx
   14012ae44:	mov    %rcx,0x8(%rsi)
   14012ae48:	mov    %r8,%rsi
   14012ae4b:	jmp    140128bf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5322>
   14012ae50:	mov    0x1048(%rbx),%rdx
   14012ae57:	lea    0x10(%rsi),%r8
   14012ae5b:	cmp    0x38(%rsp),%r8
   14012ae60:	jae    1401320b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7e0>
   14012ae66:	mov    0x1050(%rbx),%rax
   14012ae6d:	vzeroupper
   14012ae70:	mov    0x1d0(%rsp),%rcx
   14012ae78:	mov    %rcx,(%rsi)
   14012ae7b:	mov    0x1c8(%rsp),%rcx
   14012ae83:	mov    %rcx,0x8(%rsi)
   14012ae87:	mov    %r8,%rsi
   14012ae8a:	jmp    1401295d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d06>
   14012ae8f:	mov    0x1048(%rbx),%rdx
   14012ae96:	lea    0x10(%rsi),%r8
   14012ae9a:	cmp    0x38(%rsp),%r8
   14012ae9f:	jae    1401327d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef02>
   14012aea5:	mov    0x1050(%rbx),%rax
   14012aeac:	vzeroupper
   14012aeaf:	mov    0x1d0(%rsp),%rcx
   14012aeb7:	mov    %rcx,(%rsi)
   14012aeba:	mov    0x1c8(%rsp),%rcx
   14012aec2:	mov    %rcx,0x8(%rsi)
   14012aec6:	mov    %r8,%rsi
   14012aec9:	jmp    140128f3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x566e>
   14012aece:	and    %rax,%rdx
   14012aed1:	cmp    %r8,%rdx
   14012aed4:	je     14012ec28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb358>
   14012aeda:	movabs $0xfffd000000000000,%r8
   14012aee4:	cmp    %r8,%rdx
   14012aee7:	je     140130d39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd469>
   14012aeed:	movabs $0xfffc000000000000,%rdx
   14012aef7:	cmp    %rdx,%rax
   14012aefa:	je     14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   14012af00:	movabs $0xfff7ffffffffffff,%rdx
   14012af0a:	cmp    %rax,%rdx
   14012af0d:	jae    14012d03a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x976a>
   14012af13:	movabs $0xffffffff00000000,%rdx
   14012af1d:	movabs $0xfffd000000000000,%r8
   14012af27:	and    %rdx,%rcx
   14012af2a:	cmp    %r8,%rcx
   14012af2d:	je     140130c8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3bb>
   14012af33:	movabs $0xffff000000000000,%rdx
   14012af3d:	and    %rax,%rdx
   14012af40:	cmp    %r8,%rdx
   14012af43:	je     14012e313 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa43>
   14012af49:	movabs $0xfffd000100000000,%rax
   14012af53:	cmp    %rax,%rcx
   14012af56:	jne    140125f74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012af5c:	lea    0x2f0(%rsp),%rdx
   14012af64:	lea    0x680(%rsp),%rcx
   14012af6c:	vzeroupper
   14012af6f:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012af74:	lea    0x540(%rsp),%rax
   14012af7c:	lea    0x2e8(%rsp),%rdx
   14012af84:	mov    %rax,%rcx
   14012af87:	mov    %rax,0x40(%rsp)
   14012af8c:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012af91:	mov    0x40(%rsp),%rcx
   14012af96:	lea    0x680(%rsp),%rdx
   14012af9e:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012afa3:	not    %eax
   14012afa5:	shr    $0x1f,%eax
   14012afa8:	jmp    140125f9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   14012afad:	mov    %edi,0x690(%rsp)
   14012afb4:	mov    $0x1,%r12d
   14012afba:	lea    0x1a0(%rsp),%rdx
   14012afc2:	lea    0x540(%rsp),%rcx
   14012afca:	movl   $0x0,0x694(%rsp)
   14012afd5:	mov    0x690(%rsp),%rax
   14012afdd:	vmovdqa %xmm0,0x680(%rsp)
   14012afe6:	mov    %rax,0x1b0(%rsp)
   14012afee:	vmovdqa %xmm0,0x1a0(%rsp)
   14012aff7:	vzeroupper
   14012affa:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012afff:	mov    0x540(%rsp),%rax
   14012b007:	mov    %rax,0x1c8(%rsp)
   14012b00f:	jmp    140124cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0>
   14012b014:	mov    0x360(%rsp),%rcx
   14012b01c:	and    %rcx,%rax
   14012b01f:	cmp    %r8,%rax
   14012b022:	jne    1401280cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47ff>
   14012b028:	shl    $0x10,%rcx
   14012b02c:	shl    $0x10,%rdx
   14012b030:	movabs $0xffffffffffff,%r8
   14012b03a:	sar    $0x10,%rcx
   14012b03e:	sar    $0x10,%rdx
   14012b042:	add    %rcx,%rdx
   14012b045:	movabs $0x800000000000,%rcx
   14012b04f:	add    %rdx,%rcx
   14012b052:	cmp    %rcx,%r8
   14012b055:	jb     1401280cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47ff>
   14012b05b:	and    %r8,%rdx
   14012b05e:	or     %rdx,%rax
   14012b061:	mov    %rax,0x1c8(%rsp)
   14012b069:	cmpb   $0x0,0x1040(%rbx)
   14012b070:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b076:	movzbl 0x0(%rbp),%eax
   14012b07a:	lea    0x29501f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b081:	add    $0x1,%rbp
   14012b085:	mov    (%rdi,%rax,8),%rax
   14012b089:	jmp    *%rax
   14012b08b:	mov    0x370(%rsp),%r8
   14012b093:	and    %r8,%rdx
   14012b096:	cmp    %rcx,%rdx
   14012b099:	jne    14012818a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48ba>
   14012b09f:	mov    %r8,%rcx
   14012b0a2:	shl    $0x10,%rax
   14012b0a6:	movabs $0xffffffffffff,%r8
   14012b0b0:	shl    $0x10,%rcx
   14012b0b4:	sar    $0x10,%rax
   14012b0b8:	sar    $0x10,%rcx
   14012b0bc:	sub    %rcx,%rax
   14012b0bf:	movabs $0x800000000000,%rcx
   14012b0c9:	add    %rax,%rcx
   14012b0cc:	cmp    %rcx,%r8
   14012b0cf:	jb     14012818a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48ba>
   14012b0d5:	and    %r8,%rax
   14012b0d8:	or     %rdx,%rax
   14012b0db:	mov    %rax,0x1c8(%rsp)
   14012b0e3:	cmpb   $0x0,0x1040(%rbx)
   14012b0ea:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b0f0:	movzbl 0x0(%rbp),%eax
   14012b0f4:	lea    0x294fa5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b0fb:	add    $0x1,%rbp
   14012b0ff:	mov    (%rdi,%rax,8),%rax
   14012b103:	jmp    *%rax
   14012b105:	mov    0x1048(%rbx),%rdx
   14012b10c:	lea    0x10(%rsi),%r8
   14012b110:	cmp    0x38(%rsp),%r8
   14012b115:	jae    140132000 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe730>
   14012b11b:	mov    0x1050(%rbx),%rax
   14012b122:	vzeroupper
   14012b125:	mov    0x1d0(%rsp),%rcx
   14012b12d:	mov    %rcx,(%rsi)
   14012b130:	mov    0x1c8(%rsp),%rcx
   14012b138:	mov    %rcx,0x8(%rsi)
   14012b13c:	mov    %r8,%rsi
   14012b13f:	jmp    140126b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3238>
   14012b144:	mov    0x1048(%rbx),%rdx
   14012b14b:	lea    0x10(%rsi),%r8
   14012b14f:	cmp    0x38(%rsp),%r8
   14012b154:	jae    14013218c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8bc>
   14012b15a:	mov    0x1050(%rbx),%rax
   14012b161:	vzeroupper
   14012b164:	mov    0x1d0(%rsp),%rcx
   14012b16c:	mov    %rcx,(%rsi)
   14012b16f:	mov    0x1c8(%rsp),%rcx
   14012b177:	mov    %rcx,0x8(%rsi)
   14012b17b:	mov    %r8,%rsi
   14012b17e:	jmp    140126bdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x330b>
   14012b183:	mov    0x1048(%rbx),%rdx
   14012b18a:	lea    0x10(%rsi),%r8
   14012b18e:	cmp    0x38(%rsp),%r8
   14012b193:	jae    1401329c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0f8>
   14012b199:	mov    0x1050(%rbx),%rax
   14012b1a0:	vzeroupper
   14012b1a3:	mov    0x1d0(%rsp),%rcx
   14012b1ab:	mov    %rcx,(%rsi)
   14012b1ae:	mov    0x1c8(%rsp),%rcx
   14012b1b6:	mov    %rcx,0x8(%rsi)
   14012b1ba:	mov    %r8,%rsi
   14012b1bd:	jmp    140126cae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33de>
   14012b1c2:	mov    0x3c0(%rsp),%r8
   14012b1ca:	and    %r8,%rax
   14012b1cd:	cmp    %rcx,%rax
   14012b1d0:	jne    14012871f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e4f>
   14012b1d6:	mov    0x3b8(%rsp),%rax
   14012b1de:	shl    $0x10,%r8
   14012b1e2:	movabs $0xfffa000000000000,%rdx
   14012b1ec:	shl    $0x10,%rax
   14012b1f0:	cmp    %r8,%rax
   14012b1f3:	movabs $0xfffa000000000001,%rax
   14012b1fd:	cmovg  %rax,%rdx
   14012b201:	mov    %rdx,0x1c8(%rsp)
   14012b209:	cmpb   $0x0,0x1040(%rbx)
   14012b210:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b216:	movzbl 0x0(%rbp),%eax
   14012b21a:	lea    0x294e7f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b221:	add    $0x1,%rbp
   14012b225:	mov    (%rdi,%rax,8),%rax
   14012b229:	jmp    *%rax
   14012b22b:	and    %rax,%rdx
   14012b22e:	cmp    %r8,%rdx
   14012b231:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba90>
   14012b237:	movabs $0xfffd000000000000,%r8
   14012b241:	cmp    %r8,%rdx
   14012b244:	je     140130c59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd389>
   14012b24a:	movabs $0xfffc000000000000,%rdx
   14012b254:	cmp    %rdx,%rax
   14012b257:	je     14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   14012b25d:	movabs $0xfff7ffffffffffff,%rdx
   14012b267:	cmp    %rax,%rdx
   14012b26a:	jae    14012d103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9833>
   14012b270:	movabs $0xffffffff00000000,%rdx
   14012b27a:	movabs $0xfffd000000000000,%r8
   14012b284:	and    %rdx,%rcx
   14012b287:	cmp    %r8,%rcx
   14012b28a:	je     1401309f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd127>
   14012b290:	movabs $0xffff000000000000,%rdx
   14012b29a:	and    %rax,%rdx
   14012b29d:	cmp    %r8,%rdx
   14012b2a0:	je     14012e27f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9af>
   14012b2a6:	movabs $0xfffd000100000000,%rax
   14012b2b0:	cmp    %rax,%rcx
   14012b2b3:	jne    140125e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012b2b9:	lea    0x2e0(%rsp),%rdx
   14012b2c1:	lea    0x680(%rsp),%rcx
   14012b2c9:	vzeroupper
   14012b2cc:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012b2d1:	lea    0x540(%rsp),%rax
   14012b2d9:	lea    0x2d8(%rsp),%rdx
   14012b2e1:	mov    %rax,%rcx
   14012b2e4:	mov    %rax,0x40(%rsp)
   14012b2e9:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012b2ee:	mov    0x40(%rsp),%rcx
   14012b2f3:	lea    0x680(%rsp),%rdx
   14012b2fb:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012b300:	test   %eax,%eax
   14012b302:	setg   %al
   14012b305:	jmp    140125e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   14012b30a:	mov    %rdi,%rax
   14012b30d:	shr    $0x20,%rax
   14012b311:	cmp    $0x3,%ax
   14012b315:	je     14012e8da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb00a>
   14012b31b:	cmp    $0x2,%ax
   14012b31f:	jne    140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012b325:	mov    %rdi,0x350(%rsp)
   14012b32d:	lea    0x350(%rsp),%rcx
   14012b335:	vzeroupper
   14012b338:	call   14021b9a0 <setun::VMValue::payload() const>
   14012b33d:	mov    0x48(%rax),%rdi
   14012b341:	test   %rdi,%rdi
   14012b344:	je     140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012b34a:	lea    0x680(%rsp),%rax
   14012b352:	lea    0x348(%rsp),%rdx
   14012b35a:	mov    %rax,%rcx
   14012b35d:	mov    %rax,0x40(%rsp)
   14012b362:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b367:	mov    0x40(%rsp),%rdx
   14012b36c:	lea    0x340(%rsp),%r8
   14012b374:	mov    %rdi,%rcx
   14012b377:	call   140211300 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b37c:	mov    0x680(%rsp),%rcx
   14012b384:	lea    0x690(%rsp),%rax
   14012b38c:	cmp    %rax,%rcx
   14012b38f:	je     140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012b395:	mov    0x690(%rsp),%rax
   14012b39d:	lea    0x1(%rax),%rdx
   14012b3a1:	call   140338430 <operator delete(void*, unsigned long long)>
   14012b3a6:	jmp    140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012b3ab:	mov    0x1048(%rbx),%rdx
   14012b3b2:	lea    0x10(%rsi),%r8
   14012b3b6:	cmp    0x38(%rsp),%r8
   14012b3bb:	jae    1401328fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf02e>
   14012b3c1:	mov    0x1050(%rbx),%rax
   14012b3c8:	vzeroupper
   14012b3cb:	mov    0x1d0(%rsp),%rcx
   14012b3d3:	mov    %rcx,(%rsi)
   14012b3d6:	mov    0x1c8(%rsp),%rcx
   14012b3de:	mov    %rcx,0x8(%rsi)
   14012b3e2:	mov    %r8,%rsi
   14012b3e5:	jmp    1401274ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c1c>
   14012b3ea:	mov    0x1048(%rbx),%rdx
   14012b3f1:	lea    0x10(%rsi),%r8
   14012b3f5:	cmp    0x38(%rsp),%r8
   14012b3fa:	jae    140133262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf992>
   14012b400:	mov    0x1050(%rbx),%rax
   14012b407:	vzeroupper
   14012b40a:	mov    0x1d0(%rsp),%rcx
   14012b412:	mov    %rcx,(%rsi)
   14012b415:	mov    0x1c8(%rsp),%rcx
   14012b41d:	mov    %rcx,0x8(%rsi)
   14012b421:	mov    %r8,%rsi
   14012b424:	jmp    1401296a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dd9>
   14012b429:	mov    0x1c8(%rsp),%rcx
   14012b431:	xor    %r12d,%r12d
   14012b434:	mov    %rcx,(%rdx,%r13,8)
   14012b438:	jmp    140126669 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d99>
   14012b43d:	mov    0x200(%rsp),%rcx
   14012b445:	and    %rcx,%rax
   14012b448:	cmp    %r8,%rax
   14012b44b:	jne    140125218 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1948>
   14012b451:	shl    $0x10,%rcx
   14012b455:	shl    $0x10,%rdx
   14012b459:	movabs $0xffffffffffff,%r8
   14012b463:	sar    $0x10,%rcx
   14012b467:	sar    $0x10,%rdx
   14012b46b:	imul   %rcx,%rdx
   14012b46f:	movabs $0x800000000000,%rcx
   14012b479:	add    %rdx,%rcx
   14012b47c:	cmp    %rcx,%r8
   14012b47f:	jb     140125218 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1948>
   14012b485:	and    %r8,%rdx
   14012b488:	or     %rdx,%rax
   14012b48b:	lea    -0x1(%rbp),%rdx
   14012b48f:	mov    %rax,0x1c8(%rsp)
   14012b497:	cmpb   $0x0,0x1520f(%rbx)
   14012b49e:	je     14012b4cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bfd>
   14012b4a0:	mov    0xe8(%r14),%rax
   14012b4a7:	mov    0xf0(%r14),%rcx
   14012b4ae:	sub    %r15,%rdx
   14012b4b1:	sub    %rax,%rcx
   14012b4b4:	cmp    %rcx,%rdx
   14012b4b7:	jae    14012b4cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bfd>
   14012b4b9:	add    %rdx,%rax
   14012b4bc:	movzbl (%rax),%edi
   14012b4bf:	lea    0x1(%rdi),%edx
   14012b4c2:	mov    %dl,(%rax)
   14012b4c4:	cmp    $0x7,%dl
   14012b4c7:	jbe    14012b4cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bfd>
   14012b4c9:	movb   $0xbe,-0x1(%rbp)
   14012b4cd:	cmpb   $0x0,0x1040(%rbx)
   14012b4d4:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b4da:	movzbl 0x0(%rbp),%eax
   14012b4de:	lea    0x294bbb(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b4e5:	add    $0x1,%rbp
   14012b4e9:	mov    (%rdi,%rax,8),%rax
   14012b4ed:	jmp    *%rax
   14012b4ef:	mov    0x1f0(%rsp),%r8
   14012b4f7:	and    %r8,%rdx
   14012b4fa:	cmp    %rcx,%rdx
   14012b4fd:	jne    140125161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1891>
   14012b503:	mov    %r8,%rcx
   14012b506:	shl    $0x10,%rax
   14012b50a:	movabs $0xffffffffffff,%r8
   14012b514:	shl    $0x10,%rcx
   14012b518:	sar    $0x10,%rax
   14012b51c:	sar    $0x10,%rcx
   14012b520:	sub    %rcx,%rax
   14012b523:	movabs $0x800000000000,%rcx
   14012b52d:	add    %rax,%rcx
   14012b530:	cmp    %rcx,%r8
   14012b533:	jb     140125161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1891>
   14012b539:	and    %r8,%rax
   14012b53c:	or     %rdx,%rax
   14012b53f:	lea    -0x1(%rbp),%rdx
   14012b543:	mov    %rax,0x1c8(%rsp)
   14012b54b:	cmpb   $0x0,0x1520f(%rbx)
   14012b552:	je     14012b581 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cb1>
   14012b554:	mov    0xe8(%r14),%rax
   14012b55b:	mov    0xf0(%r14),%rcx
   14012b562:	sub    %r15,%rdx
   14012b565:	sub    %rax,%rcx
   14012b568:	cmp    %rcx,%rdx
   14012b56b:	jae    14012b581 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cb1>
   14012b56d:	add    %rdx,%rax
   14012b570:	movzbl (%rax),%edi
   14012b573:	lea    0x1(%rdi),%edx
   14012b576:	mov    %dl,(%rax)
   14012b578:	cmp    $0x7,%dl
   14012b57b:	jbe    14012b581 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cb1>
   14012b57d:	movb   $0xbd,-0x1(%rbp)
   14012b581:	cmpb   $0x0,0x1040(%rbx)
   14012b588:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b58e:	movzbl 0x0(%rbp),%eax
   14012b592:	lea    0x294b07(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b599:	add    $0x1,%rbp
   14012b59d:	mov    (%rdi,%rax,8),%rax
   14012b5a1:	jmp    *%rax
   14012b5a3:	mov    0x1e0(%rsp),%r8
   14012b5ab:	and    %r8,%rdx
   14012b5ae:	cmp    %rcx,%rdx
   14012b5b1:	jne    1401250aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012b5b7:	mov    %r8,%rcx
   14012b5ba:	shl    $0x10,%rax
   14012b5be:	movabs $0xffffffffffff,%r8
   14012b5c8:	shl    $0x10,%rcx
   14012b5cc:	sar    $0x10,%rax
   14012b5d0:	sar    $0x10,%rcx
   14012b5d4:	add    %rcx,%rax
   14012b5d7:	movabs $0x800000000000,%rcx
   14012b5e1:	add    %rax,%rcx
   14012b5e4:	cmp    %rcx,%r8
   14012b5e7:	jb     1401250aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012b5ed:	and    %r8,%rax
   14012b5f0:	or     %rdx,%rax
   14012b5f3:	lea    -0x1(%rbp),%rdx
   14012b5f7:	mov    %rax,0x1c8(%rsp)
   14012b5ff:	cmpb   $0x0,0x1520f(%rbx)
   14012b606:	je     14012b635 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d65>
   14012b608:	mov    0xe8(%r14),%rax
   14012b60f:	mov    0xf0(%r14),%rcx
   14012b616:	sub    %r15,%rdx
   14012b619:	sub    %rax,%rcx
   14012b61c:	cmp    %rcx,%rdx
   14012b61f:	jae    14012b635 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d65>
   14012b621:	add    %rdx,%rax
   14012b624:	movzbl (%rax),%edi
   14012b627:	lea    0x1(%rdi),%edx
   14012b62a:	mov    %dl,(%rax)
   14012b62c:	cmp    $0x7,%dl
   14012b62f:	jbe    14012b635 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d65>
   14012b631:	movb   $0xbc,-0x1(%rbp)
   14012b635:	cmpb   $0x0,0x1040(%rbx)
   14012b63c:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b642:	movzbl 0x0(%rbp),%eax
   14012b646:	lea    0x294a53(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b64d:	add    $0x1,%rbp
   14012b651:	mov    (%rdi,%rax,8),%rax
   14012b655:	jmp    *%rax
   14012b657:	shr    $0x20,%rdx
   14012b65b:	cmp    $0x1,%dx
   14012b65f:	je     14012f40e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb3e>
   14012b665:	cmp    $0x5,%dx
   14012b669:	jne    1401248f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1026>
   14012b66f:	mov    %r9,0x80(%rsp)
   14012b677:	call   14021a530 <setun::VMValue::as_int() const>
   14012b67c:	jmp    140124908 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1038>
   14012b681:	mov    0x1048(%rbx),%rdx
   14012b688:	lea    0x10(%rsi),%r8
   14012b68c:	cmp    0x38(%rsp),%r8
   14012b691:	jae    140132683 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedb3>
   14012b697:	mov    0x1050(%rbx),%rax
   14012b69e:	vzeroupper
   14012b6a1:	mov    0x1d0(%rsp),%rcx
   14012b6a9:	mov    %rcx,(%rsi)
   14012b6ac:	mov    0x1c8(%rsp),%rcx
   14012b6b4:	mov    %rcx,0x8(%rsi)
   14012b6b8:	jmp    1401245e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd17>
   14012b6bd:	mov    0x1048(%rbx),%rdx
   14012b6c4:	lea    0x10(%rsi),%r8
   14012b6c8:	cmp    0x38(%rsp),%r8
   14012b6cd:	jae    1401321b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8e8>
   14012b6d3:	mov    0x1050(%rbx),%rax
   14012b6da:	vzeroupper
   14012b6dd:	mov    0x1d0(%rsp),%rcx
   14012b6e5:	mov    %rcx,(%rsi)
   14012b6e8:	mov    0x1c8(%rsp),%rcx
   14012b6f0:	mov    %rcx,0x8(%rsi)
   14012b6f4:	mov    %r8,%rsi
   14012b6f7:	jmp    1401267bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eec>
   14012b6fc:	mov    0x390(%rsp),%r8
   14012b704:	and    %r8,%rax
   14012b707:	cmp    %rcx,%rax
   14012b70a:	jne    1401282fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a2d>
   14012b710:	mov    0x388(%rsp),%rax
   14012b718:	shl    $0x10,%r8
   14012b71c:	movabs $0xfffa000000000000,%rdx
   14012b726:	shl    $0x10,%rax
   14012b72a:	cmp    %r8,%rax
   14012b72d:	movabs $0xfffa000000000001,%rax
   14012b737:	cmovl  %rax,%rdx
   14012b73b:	mov    %rdx,0x1c8(%rsp)
   14012b743:	cmpb   $0x0,0x1040(%rbx)
   14012b74a:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b750:	movzbl 0x0(%rbp),%eax
   14012b754:	lea    0x294945(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b75b:	add    $0x1,%rbp
   14012b75f:	mov    (%rdi,%rax,8),%rax
   14012b763:	jmp    *%rax
   14012b765:	mov    0x1048(%rbx),%rdx
   14012b76c:	lea    0x10(%rsi),%r8
   14012b770:	cmp    0x38(%rsp),%r8
   14012b775:	jae    1401328ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefdb>
   14012b77b:	mov    0x1050(%rbx),%rax
   14012b782:	vzeroupper
   14012b785:	mov    0x1d0(%rsp),%rcx
   14012b78d:	mov    %rcx,(%rsi)
   14012b790:	mov    0x1c8(%rsp),%rcx
   14012b798:	mov    %rcx,0x8(%rsi)
   14012b79c:	mov    %r8,%rsi
   14012b79f:	jmp    140126962 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3092>
   14012b7a4:	mov    0x1048(%rbx),%rdx
   14012b7ab:	lea    0x10(%rsi),%r8
   14012b7af:	cmp    0x38(%rsp),%r8
   14012b7b4:	jae    14013299c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0cc>
   14012b7ba:	mov    0x1050(%rbx),%rax
   14012b7c1:	vzeroupper
   14012b7c4:	mov    0x1d0(%rsp),%rcx
   14012b7cc:	mov    %rcx,(%rsi)
   14012b7cf:	mov    0x1c8(%rsp),%rcx
   14012b7d7:	mov    %rcx,0x8(%rsi)
   14012b7db:	mov    %r8,%rsi
   14012b7de:	jmp    140126a35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3165>
   14012b7e3:	mov    0x1048(%rbx),%rdx
   14012b7ea:	lea    0x10(%rsi),%r8
   14012b7ee:	cmp    0x38(%rsp),%r8
   14012b7f3:	jae    1401326f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee27>
   14012b7f9:	mov    0x1050(%rbx),%rax
   14012b800:	vzeroupper
   14012b803:	mov    0x1d0(%rsp),%rcx
   14012b80b:	mov    %rcx,(%rsi)
   14012b80e:	mov    0x1c8(%rsp),%rcx
   14012b816:	mov    %rcx,0x8(%rsi)
   14012b81a:	mov    %r8,%rsi
   14012b81d:	jmp    140126ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x372a>
   14012b822:	mov    0x3a0(%rsp),%r8
   14012b82a:	and    %r8,%rax
   14012b82d:	cmp    %rcx,%rax
   14012b830:	jne    14012845d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b8d>
   14012b836:	mov    0x398(%rsp),%rax
   14012b83e:	shl    $0x10,%r8
   14012b842:	movabs $0xfffa000000000000,%rdx
   14012b84c:	shl    $0x10,%rax
   14012b850:	cmp    %r8,%rax
   14012b853:	movabs $0xfffa000000000001,%rax
   14012b85d:	cmovle %rax,%rdx
   14012b861:	mov    %rdx,0x1c8(%rsp)
   14012b869:	cmpb   $0x0,0x1040(%rbx)
   14012b870:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b876:	movzbl 0x0(%rbp),%eax
   14012b87a:	lea    0x29481f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b881:	add    $0x1,%rbp
   14012b885:	mov    (%rdi,%rax,8),%rax
   14012b889:	jmp    *%rax
   14012b88b:	mov    (%r11),%r10
   14012b88e:	and    %r10,%r9
   14012b891:	mov    %r9,0x60(%rsp)
   14012b896:	cmp    %rdx,%r9
   14012b899:	jne    140127700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e30>
   14012b89f:	mov    %r10,%rdx
   14012b8a2:	mov    %r8,%r9
   14012b8a5:	shl    $0x10,%rdx
   14012b8a9:	shl    $0x10,%r9
   14012b8ad:	sar    $0x10,%rdx
   14012b8b1:	sar    $0x10,%r9
   14012b8b5:	lea    (%rdx,%r9,1),%r10
   14012b8b9:	movabs $0x800000000000,%rdx
   14012b8c3:	movabs $0xffffffffffff,%r9
   14012b8cd:	add    %r10,%rdx
   14012b8d0:	cmp    %rdx,%r9
   14012b8d3:	jb     140127700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e30>
   14012b8d9:	mov    %r10,%rdx
   14012b8dc:	and    %r9,%rdx
   14012b8df:	or     0x60(%rsp),%rdx
   14012b8e4:	mov    %rdx,(%rax,%rdi,8)
   14012b8e8:	cmpb   $0x0,0x1040(%rbx)
   14012b8ef:	je     14012c91e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   14012b8f5:	movzbl 0x6(%rbp),%eax
   14012b8f9:	lea    0x2947a0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b900:	add    $0x7,%rbp
   14012b904:	mov    (%rdi,%rax,8),%rax
   14012b908:	jmp    *%rax
   14012b90a:	mov    0x1048(%rbx),%rdx
   14012b911:	lea    0x10(%rsi),%r8
   14012b915:	cmp    0x38(%rsp),%r8
   14012b91a:	jae    14013337a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfaaa>
   14012b920:	mov    0x1050(%rbx),%rax
   14012b927:	vzeroupper
   14012b92a:	mov    0x1d0(%rsp),%rcx
   14012b932:	mov    %rcx,(%rsi)
   14012b935:	mov    0x1c8(%rsp),%rcx
   14012b93d:	mov    %rcx,0x8(%rsi)
   14012b941:	mov    %r8,%rsi
   14012b944:	jmp    140127346 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a76>
   14012b949:	mov    0x1048(%rbx),%rdx
   14012b950:	lea    0x10(%rsi),%r8
   14012b954:	cmp    0x38(%rsp),%r8
   14012b959:	jae    14013233e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea6e>
   14012b95f:	mov    0x1050(%rbx),%rax
   14012b966:	vzeroupper
   14012b969:	mov    0x1d0(%rsp),%rcx
   14012b971:	mov    %rcx,(%rsi)
   14012b974:	mov    0x1c8(%rsp),%rcx
   14012b97c:	mov    %rcx,0x8(%rsi)
   14012b980:	mov    %r8,%rsi
   14012b983:	jmp    140127419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b49>
   14012b988:	mov    0x380(%rsp),%rcx
   14012b990:	and    %rcx,%rax
   14012b993:	cmp    %r8,%rax
   14012b996:	jne    140128245 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4975>
   14012b99c:	shl    $0x10,%rcx
   14012b9a0:	shl    $0x10,%rdx
   14012b9a4:	movabs $0xffffffffffff,%r8
   14012b9ae:	sar    $0x10,%rcx
   14012b9b2:	sar    $0x10,%rdx
   14012b9b6:	imul   %rcx,%rdx
   14012b9ba:	movabs $0x800000000000,%rcx
   14012b9c4:	add    %rdx,%rcx
   14012b9c7:	cmp    %rcx,%r8
   14012b9ca:	jb     140128245 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4975>
   14012b9d0:	and    %r8,%rdx
   14012b9d3:	or     %rdx,%rax
   14012b9d6:	mov    %rax,0x1c8(%rsp)
   14012b9de:	cmpb   $0x0,0x1040(%rbx)
   14012b9e5:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012b9eb:	movzbl 0x0(%rbp),%eax
   14012b9ef:	lea    0x2946aa(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b9f6:	add    $0x1,%rbp
   14012b9fa:	mov    (%rdi,%rax,8),%rax
   14012b9fe:	jmp    *%rax
   14012ba00:	mov    %rdx,%rax
   14012ba03:	shr    $0x20,%rax
   14012ba07:	cmp    $0x3,%ax
   14012ba0b:	je     14012f21f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb94f>
   14012ba11:	cmp    $0x2,%ax
   14012ba15:	jne    14012a032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012ba1b:	mov    %rdx,0x328(%rsp)
   14012ba23:	lea    0x540(%rsp),%rcx
   14012ba2b:	lea    0x328(%rsp),%rdx
   14012ba33:	vzeroupper
   14012ba36:	call   14021c010 <setun::VMValue::as_object() const>
   14012ba3b:	mov    0x540(%rsp),%rax
   14012ba43:	mov    0x548(%rsp),%rdi
   14012ba4b:	test   %rax,%rax
   14012ba4e:	je     14012baaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81df>
   14012ba50:	lea    0x680(%rsp),%r10
   14012ba58:	lea    0x320(%rsp),%rdx
   14012ba60:	mov    %rax,0x60(%rsp)
   14012ba65:	mov    %r10,%rcx
   14012ba68:	mov    %r10,0x40(%rsp)
   14012ba6d:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012ba72:	mov    0x40(%rsp),%rdx
   14012ba77:	mov    0x60(%rsp),%rcx
   14012ba7c:	lea    0x318(%rsp),%r8
   14012ba84:	call   140211300 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012ba89:	mov    0x680(%rsp),%rcx
   14012ba91:	lea    0x690(%rsp),%rax
   14012ba99:	cmp    %rax,%rcx
   14012ba9c:	je     14012baaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81df>
   14012ba9e:	mov    0x690(%rsp),%rax
   14012baa6:	lea    0x1(%rax),%rdx
   14012baaa:	call   140338430 <operator delete(void*, unsigned long long)>
   14012baaf:	test   %rdi,%rdi
   14012bab2:	je     14012a032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012bab8:	mov    %rdi,%rcx
   14012babb:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012bac0:	jmp    14012a032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012bac5:	lea    0x10(%rsi),%r8
   14012bac9:	cmp    0x38(%rsp),%r8
   14012bace:	jae    140131fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6d5>
   14012bad4:	vzeroupper
   14012bad7:	mov    0x1d0(%rsp),%rax
   14012badf:	xor    %r12d,%r12d
   14012bae2:	mov    %rax,(%rsi)
   14012bae5:	mov    0x1c8(%rsp),%rax
   14012baed:	mov    %rax,0x8(%rsi)
   14012baf1:	mov    %r8,%rsi
   14012baf4:	jmp    140129dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x651a>
   14012baf9:	mov    0x1048(%rbx),%rdx
   14012bb00:	lea    0x10(%rsi),%r8
   14012bb04:	cmp    0x38(%rsp),%r8
   14012bb09:	jae    140132160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe890>
   14012bb0f:	mov    0x1050(%rbx),%rax
   14012bb16:	vzeroupper
   14012bb19:	mov    0x1d0(%rsp),%rcx
   14012bb21:	mov    %rcx,(%rsi)
   14012bb24:	mov    0x1c8(%rsp),%rcx
   14012bb2c:	mov    %rcx,0x8(%rsi)
   14012bb30:	mov    %r8,%rsi
   14012bb33:	jmp    1401271a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38d0>
   14012bb38:	and    %rax,%rdx
   14012bb3b:	cmp    %r8,%rdx
   14012bb3e:	je     14012ea0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb13a>
   14012bb44:	movabs $0xfffd000000000000,%r8
   14012bb4e:	cmp    %r8,%rdx
   14012bb51:	je     140130aa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1d3>
   14012bb57:	movabs $0xfffc000000000000,%rdx
   14012bb61:	cmp    %rdx,%rax
   14012bb64:	je     14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   14012bb6a:	movabs $0xfff7ffffffffffff,%rdx
   14012bb74:	cmp    %rax,%rdx
   14012bb77:	jae    14012d067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9797>
   14012bb7d:	movabs $0xffffffff00000000,%rdx
   14012bb87:	movabs $0xfffd000000000000,%r8
   14012bb91:	and    %rdx,%rcx
   14012bb94:	cmp    %r8,%rcx
   14012bb97:	je     140130e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd557>
   14012bb9d:	movabs $0xffff000000000000,%rdx
   14012bba7:	and    %rax,%rdx
   14012bbaa:	cmp    %r8,%rdx
   14012bbad:	je     14012e397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac7>
   14012bbb3:	movabs $0xfffd000100000000,%rax
   14012bbbd:	cmp    %rax,%rcx
   14012bbc0:	jne    140125d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012bbc6:	lea    0x2d0(%rsp),%rdx
   14012bbce:	lea    0x680(%rsp),%rcx
   14012bbd6:	vzeroupper
   14012bbd9:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012bbde:	lea    0x540(%rsp),%rax
   14012bbe6:	lea    0x2c8(%rsp),%rdx
   14012bbee:	mov    %rax,%rcx
   14012bbf1:	mov    %rax,0x40(%rsp)
   14012bbf6:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012bbfb:	mov    0x40(%rsp),%rcx
   14012bc00:	lea    0x680(%rsp),%rdx
   14012bc08:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bc0d:	test   %eax,%eax
   14012bc0f:	setle  %al
   14012bc12:	jmp    140125d3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   14012bc17:	mov    0x3d0(%rsp),%r8
   14012bc1f:	and    %r8,%rax
   14012bc22:	cmp    %rcx,%rax
   14012bc25:	jne    14012887f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4faf>
   14012bc2b:	mov    0x3c8(%rsp),%rax
   14012bc33:	shl    $0x10,%r8
   14012bc37:	movabs $0xfffa000000000000,%rdx
   14012bc41:	shl    $0x10,%rax
   14012bc45:	cmp    %r8,%rax
   14012bc48:	movabs $0xfffa000000000001,%rax
   14012bc52:	cmovge %rax,%rdx
   14012bc56:	mov    %rdx,0x1c8(%rsp)
   14012bc5e:	cmpb   $0x0,0x1040(%rbx)
   14012bc65:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012bc6b:	movzbl 0x0(%rbp),%eax
   14012bc6f:	lea    0x29442a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bc76:	add    $0x1,%rbp
   14012bc7a:	mov    (%rdi,%rax,8),%rax
   14012bc7e:	jmp    *%rax
   14012bc80:	mov    0x3b0(%rsp),%r8
   14012bc88:	and    %r8,%rax
   14012bc8b:	cmp    %rdx,%rax
   14012bc8e:	jne    1401285bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ced>
   14012bc94:	movabs $0xfffa000000000000,%rax
   14012bc9e:	cmp    0x3a8(%rsp),%r8
   14012bca6:	movabs $0xfffa000000000001,%rdx
   14012bcb0:	cmove  %rdx,%rax
   14012bcb4:	mov    %rax,0x1c8(%rsp)
   14012bcbc:	cmpb   $0x0,0x1040(%rbx)
   14012bcc3:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012bcc9:	movzbl 0x0(%rbp),%eax
   14012bccd:	lea    0x2943cc(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bcd4:	add    $0x1,%rbp
   14012bcd8:	mov    (%rdi,%rax,8),%rax
   14012bcdc:	jmp    *%rax
   14012bcde:	mov    0x1048(%rbx),%rdx
   14012bce5:	lea    0x10(%rsi),%r8
   14012bce9:	cmp    0x38(%rsp),%r8
   14012bcee:	jae    14013236a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea9a>
   14012bcf4:	mov    0x1050(%rbx),%rax
   14012bcfb:	vzeroupper
   14012bcfe:	mov    0x1d0(%rsp),%rcx
   14012bd06:	mov    %rcx,(%rsi)
   14012bd09:	mov    0x1c8(%rsp),%rcx
   14012bd11:	mov    %rcx,0x8(%rsi)
   14012bd15:	mov    %r8,%rsi
   14012bd18:	jmp    140126f27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3657>
   14012bd1d:	mov    0x1048(%rbx),%rdx
   14012bd24:	lea    0x10(%rsi),%r8
   14012bd28:	cmp    0x38(%rsp),%r8
   14012bd2d:	jae    140131f79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6a9>
   14012bd33:	mov    0x1050(%rbx),%rax
   14012bd3a:	vzeroupper
   14012bd3d:	mov    0x1d0(%rsp),%rcx
   14012bd45:	mov    %rcx,(%rsi)
   14012bd48:	mov    0x1c8(%rsp),%rcx
   14012bd50:	mov    %rcx,0x8(%rsi)
   14012bd54:	mov    %r8,%rsi
   14012bd57:	jmp    140126d81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34b1>
   14012bd5c:	mov    0x1048(%rbx),%rdx
   14012bd63:	lea    0x10(%rsi),%r8
   14012bd67:	cmp    0x38(%rsp),%r8
   14012bd6c:	jae    140132a30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf160>
   14012bd72:	mov    0x1050(%rbx),%rax
   14012bd79:	vzeroupper
   14012bd7c:	mov    0x1d0(%rsp),%rcx
   14012bd84:	mov    %rcx,(%rsi)
   14012bd87:	mov    0x1c8(%rsp),%rcx
   14012bd8f:	mov    %rcx,0x8(%rsi)
   14012bd93:	mov    %r8,%rsi
   14012bd96:	jmp    140127273 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39a3>
   14012bd9b:	shr    $0x20,%rdx
   14012bd9f:	cmp    $0x1,%dx
   14012bda3:	je     14012c771 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ea1>
   14012bda9:	lea    0x300(%rsp),%rcx
   14012bdb1:	vzeroupper
   14012bdb4:	call   14021a530 <setun::VMValue::as_int() const>
   14012bdb9:	test   %rax,%rax
   14012bdbc:	js     14012c7ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8efa>
   14012bdc2:	je     140126148 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2878>
   14012bdc8:	movswq 0x60(%rsp),%rax
   14012bdce:	add    %rbp,%rax
   14012bdd1:	jmp    140126153 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2883>
   14012bdd6:	mov    0x1048(%rbx),%rdx
   14012bddd:	lea    0x10(%rsi),%r8
   14012bde1:	cmp    0x38(%rsp),%r8
   14012bde6:	jae    140132ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5ed>
   14012bdec:	mov    0x1050(%rbx),%rax
   14012bdf3:	vzeroupper
   14012bdf6:	mov    0x1d0(%rsp),%rcx
   14012bdfe:	mov    %rcx,(%rsi)
   14012be01:	mov    0x1c8(%rsp),%rcx
   14012be09:	mov    %rcx,0x8(%rsi)
   14012be0d:	mov    %r8,%rsi
   14012be10:	jmp    1401270cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37fd>
   14012be15:	mov    %rax,%rdx
   14012be18:	shr    $0x20,%rdx
   14012be1c:	cmp    $0x5,%dx
   14012be20:	jne    14012be6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x859a>
   14012be22:	mov    0x3c0(%rsp),%rcx
   14012be2a:	movabs $0xffff000000000000,%rdx
   14012be34:	movabs $0xfff8000000000000,%r8
   14012be3e:	and    %rcx,%rdx
   14012be41:	cmp    %r8,%rdx
   14012be44:	je     1401287ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4edd>
   14012be4a:	movabs $0xffffffff00000000,%rdx
   14012be54:	and    %rdx,%rcx
   14012be57:	movabs $0xfffd000500000000,%rdx
   14012be61:	cmp    %rdx,%rcx
   14012be64:	je     1401287ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4edd>
   14012be6a:	mov    0x3c0(%rsp),%rdx
   14012be72:	movabs $0xfff7ffffffffffff,%rcx
   14012be7c:	cmp    %rdx,%rcx
   14012be7f:	jae    14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   14012be85:	movabs $0xfffc000000000000,%rcx
   14012be8f:	cmp    %rcx,%rdx
   14012be92:	je     14012cfcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96fb>
   14012be98:	movabs $0xffffffff00000000,%rcx
   14012bea2:	movabs $0xfffd000000000000,%r8
   14012beac:	and    %rax,%rcx
   14012beaf:	cmp    %r8,%rcx
   14012beb2:	je     140131316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda46>
   14012beb8:	movabs $0xffff000000000000,%rax
   14012bec2:	and    %rdx,%rax
   14012bec5:	cmp    %r8,%rax
   14012bec8:	je     140131e83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5b3>
   14012bece:	movabs $0xfffd000100000000,%rax
   14012bed8:	cmp    %rax,%rcx
   14012bedb:	jne    1401287ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4edd>
   14012bee1:	lea    0x3c0(%rsp),%rdx
   14012bee9:	lea    0x680(%rsp),%rcx
   14012bef1:	vzeroupper
   14012bef4:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012bef9:	lea    0x540(%rsp),%rax
   14012bf01:	lea    0x3b8(%rsp),%rdx
   14012bf09:	mov    %rax,%rcx
   14012bf0c:	mov    %rax,0x40(%rsp)
   14012bf11:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012bf16:	mov    0x40(%rsp),%rcx
   14012bf1b:	lea    0x680(%rsp),%rdx
   14012bf23:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bf28:	test   %eax,%eax
   14012bf2a:	setg   %al
   14012bf2d:	jmp    1401287d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f03>
   14012bf32:	mov    %rax,%rdx
   14012bf35:	shr    $0x20,%rdx
   14012bf39:	cmp    $0x5,%dx
   14012bf3d:	jne    14012bf87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86b7>
   14012bf3f:	mov    0x390(%rsp),%rcx
   14012bf47:	movabs $0xffff000000000000,%rdx
   14012bf51:	movabs $0xfff8000000000000,%r8
   14012bf5b:	and    %rcx,%rdx
   14012bf5e:	cmp    %r8,%rdx
   14012bf61:	je     14012838b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abb>
   14012bf67:	movabs $0xffffffff00000000,%rdx
   14012bf71:	and    %rdx,%rcx
   14012bf74:	movabs $0xfffd000500000000,%rdx
   14012bf7e:	cmp    %rdx,%rcx
   14012bf81:	je     14012838b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abb>
   14012bf87:	mov    0x390(%rsp),%rdx
   14012bf8f:	movabs $0xfff7ffffffffffff,%rcx
   14012bf99:	cmp    %rdx,%rcx
   14012bf9c:	jae    14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   14012bfa2:	movabs $0xfffc000000000000,%rcx
   14012bfac:	cmp    %rcx,%rdx
   14012bfaf:	je     14012d130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9860>
   14012bfb5:	movabs $0xffffffff00000000,%rcx
   14012bfbf:	movabs $0xfffd000000000000,%r8
   14012bfc9:	and    %rax,%rcx
   14012bfcc:	cmp    %r8,%rcx
   14012bfcf:	je     140130d6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd49c>
   14012bfd5:	movabs $0xffff000000000000,%rax
   14012bfdf:	and    %rdx,%rax
   14012bfe2:	cmp    %r8,%rax
   14012bfe5:	je     140131e50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe580>
   14012bfeb:	movabs $0xfffd000100000000,%rax
   14012bff5:	cmp    %rax,%rcx
   14012bff8:	jne    14012838b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abb>
   14012bffe:	lea    0x390(%rsp),%rdx
   14012c006:	lea    0x680(%rsp),%rcx
   14012c00e:	vzeroupper
   14012c011:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c016:	lea    0x540(%rsp),%rax
   14012c01e:	lea    0x388(%rsp),%rdx
   14012c026:	mov    %rax,%rcx
   14012c029:	mov    %rax,0x40(%rsp)
   14012c02e:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c033:	mov    0x40(%rsp),%rcx
   14012c038:	lea    0x680(%rsp),%rdx
   14012c040:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c045:	shr    $0x1f,%eax
   14012c048:	jmp    1401283b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae1>
   14012c04d:	mov    %rax,%rdx
   14012c050:	shr    $0x20,%rdx
   14012c054:	cmp    $0x5,%dx
   14012c058:	jne    14012c0a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87d2>
   14012c05a:	mov    0x3a0(%rsp),%rcx
   14012c062:	movabs $0xffff000000000000,%rdx
   14012c06c:	movabs $0xfff8000000000000,%r8
   14012c076:	and    %rcx,%rdx
   14012c079:	cmp    %r8,%rdx
   14012c07c:	je     1401284eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1b>
   14012c082:	movabs $0xffffffff00000000,%rdx
   14012c08c:	and    %rdx,%rcx
   14012c08f:	movabs $0xfffd000500000000,%rdx
   14012c099:	cmp    %rdx,%rcx
   14012c09c:	je     1401284eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1b>
   14012c0a2:	mov    0x3a0(%rsp),%rdx
   14012c0aa:	movabs $0xfff7ffffffffffff,%rcx
   14012c0b4:	cmp    %rdx,%rcx
   14012c0b7:	jae    14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   14012c0bd:	movabs $0xfffc000000000000,%rcx
   14012c0c7:	cmp    %rcx,%rdx
   14012c0ca:	je     14012cf9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96ce>
   14012c0d0:	movabs $0xffffffff00000000,%rcx
   14012c0da:	movabs $0xfffd000000000000,%r8
   14012c0e4:	and    %rax,%rcx
   14012c0e7:	cmp    %r8,%rcx
   14012c0ea:	je     1401310df <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd80f>
   14012c0f0:	movabs $0xffff000000000000,%rax
   14012c0fa:	and    %rdx,%rax
   14012c0fd:	cmp    %r8,%rax
   14012c100:	je     140131eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5e6>
   14012c106:	movabs $0xfffd000100000000,%rax
   14012c110:	cmp    %rax,%rcx
   14012c113:	jne    1401284eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1b>
   14012c119:	lea    0x3a0(%rsp),%rdx
   14012c121:	lea    0x680(%rsp),%rcx
   14012c129:	vzeroupper
   14012c12c:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c131:	lea    0x540(%rsp),%rax
   14012c139:	lea    0x398(%rsp),%rdx
   14012c141:	mov    %rax,%rcx
   14012c144:	mov    %rax,0x40(%rsp)
   14012c149:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c14e:	mov    0x40(%rsp),%rcx
   14012c153:	lea    0x680(%rsp),%rdx
   14012c15b:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c160:	test   %eax,%eax
   14012c162:	setle  %al
   14012c165:	jmp    140128511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c41>
   14012c16a:	mov    %rax,%rdx
   14012c16d:	shr    $0x20,%rdx
   14012c171:	cmp    $0x5,%dx
   14012c175:	jne    14012c1bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88ef>
   14012c177:	mov    0x3d0(%rsp),%rcx
   14012c17f:	movabs $0xffff000000000000,%rdx
   14012c189:	movabs $0xfff8000000000000,%r8
   14012c193:	and    %rcx,%rdx
   14012c196:	cmp    %r8,%rdx
   14012c199:	je     14012890d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503d>
   14012c19f:	movabs $0xffffffff00000000,%rdx
   14012c1a9:	and    %rdx,%rcx
   14012c1ac:	movabs $0xfffd000500000000,%rdx
   14012c1b6:	cmp    %rdx,%rcx
   14012c1b9:	je     14012890d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503d>
   14012c1bf:	mov    0x3d0(%rsp),%rdx
   14012c1c7:	movabs $0xfff7ffffffffffff,%rcx
   14012c1d1:	cmp    %rdx,%rcx
   14012c1d4:	jae    14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   14012c1da:	movabs $0xfffc000000000000,%rcx
   14012c1e4:	cmp    %rcx,%rdx
   14012c1e7:	je     14012cf71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96a1>
   14012c1ed:	movabs $0xffffffff00000000,%rcx
   14012c1f7:	movabs $0xfffd000000000000,%r8
   14012c201:	and    %rax,%rcx
   14012c204:	cmp    %r8,%rcx
   14012c207:	je     140130ad6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd206>
   14012c20d:	movabs $0xffff000000000000,%rax
   14012c217:	and    %rdx,%rax
   14012c21a:	cmp    %r8,%rax
   14012c21d:	je     140131c28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe358>
   14012c223:	movabs $0xfffd000100000000,%rax
   14012c22d:	cmp    %rax,%rcx
   14012c230:	jne    14012890d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503d>
   14012c236:	lea    0x3d0(%rsp),%rdx
   14012c23e:	lea    0x680(%rsp),%rcx
   14012c246:	vzeroupper
   14012c249:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c24e:	lea    0x540(%rsp),%rax
   14012c256:	lea    0x3c8(%rsp),%rdx
   14012c25e:	mov    %rax,%rcx
   14012c261:	mov    %rax,0x40(%rsp)
   14012c266:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c26b:	mov    0x40(%rsp),%rcx
   14012c270:	lea    0x680(%rsp),%rdx
   14012c278:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c27d:	not    %eax
   14012c27f:	shr    $0x1f,%eax
   14012c282:	jmp    140128933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5063>
   14012c287:	mov    %rax,%rdx
   14012c28a:	shr    $0x20,%rdx
   14012c28e:	cmp    $0x5,%dx
   14012c292:	jne    14012c2dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a0c>
   14012c294:	mov    0x3b0(%rsp),%rcx
   14012c29c:	movabs $0xffff000000000000,%rdx
   14012c2a6:	movabs $0xfff8000000000000,%r8
   14012c2b0:	and    %rcx,%rdx
   14012c2b3:	cmp    %r8,%rdx
   14012c2b6:	je     14012864b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7b>
   14012c2bc:	movabs $0xffffffff00000000,%rdx
   14012c2c6:	and    %rdx,%rcx
   14012c2c9:	movabs $0xfffd000500000000,%rdx
   14012c2d3:	cmp    %rdx,%rcx
   14012c2d6:	je     14012864b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7b>
   14012c2dc:	mov    0x3b0(%rsp),%rdx
   14012c2e4:	movabs $0xfff7ffffffffffff,%rcx
   14012c2ee:	cmp    %rdx,%rcx
   14012c2f1:	jae    14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   14012c2f7:	movabs $0xfffc000000000000,%rcx
   14012c301:	cmp    %rcx,%rdx
   14012c304:	je     14012cff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9728>
   14012c30a:	movabs $0xffffffff00000000,%rcx
   14012c314:	movabs $0xfffd000000000000,%r8
   14012c31e:	and    %rax,%rcx
   14012c321:	cmp    %r8,%rcx
   14012c324:	je     14013119b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8cb>
   14012c32a:	movabs $0xffff000000000000,%rax
   14012c334:	and    %rdx,%rax
   14012c337:	cmp    %r8,%rax
   14012c33a:	je     140131d92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4c2>
   14012c340:	movabs $0xfffd000100000000,%rax
   14012c34a:	cmp    %rax,%rcx
   14012c34d:	jne    14012864b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7b>
   14012c353:	lea    0x3b0(%rsp),%rdx
   14012c35b:	lea    0x680(%rsp),%rcx
   14012c363:	vzeroupper
   14012c366:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c36b:	lea    0x540(%rsp),%rax
   14012c373:	lea    0x3a8(%rsp),%rdx
   14012c37b:	mov    %rax,%rcx
   14012c37e:	mov    %rax,0x40(%rsp)
   14012c383:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c388:	mov    0x40(%rsp),%rcx
   14012c38d:	lea    0x680(%rsp),%rdx
   14012c395:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c39a:	test   %eax,%eax
   14012c39c:	sete   %dil
   14012c3a0:	jmp    140128672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da2>
   14012c3a5:	mov    0x1c8(%rsp),%rax
   14012c3ad:	sub    $0x8,%rsi
   14012c3b1:	movabs $0xffff000000000000,%rdx
   14012c3bb:	movabs $0xfffd000000000000,%rcx
   14012c3c5:	mov    %rax,0x310(%rsp)
   14012c3cd:	mov    (%rsi),%rax
   14012c3d0:	and    %rax,%rdx
   14012c3d3:	mov    %rax,0x308(%rsp)
   14012c3db:	cmp    %rcx,%rdx
   14012c3de:	jne    140129f8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14012c3e4:	xor    %r12d,%r12d
   14012c3e7:	shr    $0x20,%rax
   14012c3eb:	cmp    $0x3,%ax
   14012c3ef:	je     14012f16a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb89a>
   14012c3f5:	test   %ax,%ax
   14012c3f8:	jne    14012d77d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ead>
   14012c3fe:	lea    0x540(%rsp),%rcx
   14012c406:	lea    0x308(%rsp),%rdx
   14012c40e:	vzeroupper
   14012c411:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012c416:	lea    0x310(%rsp),%rcx
   14012c41e:	call   14021a530 <setun::VMValue::as_int() const>
   14012c423:	mov    %rax,%rdi
   14012c426:	test   %rax,%rax
   14012c429:	js     140131446 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb76>
   14012c42f:	cmp    0x548(%rsp),%rdi
   14012c437:	jae    140131454 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb84>
   14012c43d:	test   %r12b,%r12b
   14012c440:	je     1401355ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d1a>
   14012c446:	cmp    $0x1,%r12b
   14012c44a:	je     1401356c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11df1>
   14012c450:	lea    0x8(%rsi),%rax
   14012c454:	cmp    0x38(%rsp),%rax
   14012c459:	jae    140137d47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14477>
   14012c45f:	mov    0x1d0(%rsp),%rax
   14012c467:	lea    0x680(%rsp),%r10
   14012c46f:	mov    $0x1,%edx
   14012c474:	lea    0x690(%rsp),%r12
   14012c47c:	mov    %r10,%rcx
   14012c47f:	mov    %r10,0x40(%rsp)
   14012c484:	mov    %rax,(%rsi)
   14012c487:	mov    0x1c8(%rsp),%rax
   14012c48f:	mov    %rax,0x1d0(%rsp)
   14012c497:	mov    0x540(%rsp),%rax
   14012c49f:	movsbl (%rax,%rdi,1),%r8d
   14012c4a4:	mov    %r12,0x680(%rsp)
   14012c4ac:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012c4b1:	mov    0x40(%rsp),%rdx
   14012c4b6:	lea    0x520(%rsp),%rcx
   14012c4be:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012c4c3:	mov    0x520(%rsp),%rax
   14012c4cb:	mov    0x680(%rsp),%rcx
   14012c4d3:	mov    %rax,0x1c8(%rsp)
   14012c4db:	cmp    %r12,%rcx
   14012c4de:	je     14012c4f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c21>
   14012c4e0:	mov    0x690(%rsp),%rax
   14012c4e8:	lea    0x1(%rax),%rdx
   14012c4ec:	call   140338430 <operator delete(void*, unsigned long long)>
   14012c4f1:	add    $0x8,%rsi
   14012c4f5:	mov    $0x2,%r12d
   14012c4fb:	mov    0x540(%rsp),%rcx
   14012c503:	lea    0x550(%rsp),%rax
   14012c50b:	cmp    %rax,%rcx
   14012c50e:	je     140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012c514:	mov    0x550(%rsp),%rax
   14012c51c:	lea    0x1(%rax),%rdx
   14012c520:	call   140338430 <operator delete(void*, unsigned long long)>
   14012c525:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012c52a:	mov    %rdi,%rax
   14012c52d:	shr    $0x20,%rax
   14012c531:	cmp    $0x2,%ax
   14012c535:	je     14012fc9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3ce>
   14012c53b:	mov    0x1c8(%rsp),%rax
   14012c543:	xor    %r12d,%r12d
   14012c546:	mov    %rax,0x3f0(%rsp)
   14012c54e:	movabs $0xffffffff00000000,%rax
   14012c558:	movabs $0xfffd000200000000,%rdx
   14012c562:	and    %rdi,%rax
   14012c565:	cmp    %rdx,%rax
   14012c568:	jne    1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14012c56e:	mov    %r9,0x60(%rsp)
   14012c573:	lea    0x3e8(%rsp),%rcx
   14012c57b:	mov    %rdi,0x3e8(%rsp)
   14012c583:	vzeroupper
   14012c586:	call   14021b9a0 <setun::VMValue::payload() const>
   14012c58b:	mov    0x48(%rax),%rdi
   14012c58f:	test   %rdi,%rdi
   14012c592:	je     1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14012c598:	mov    0x38(%rdi),%rcx
   14012c59c:	mov    0x60(%rsp),%r9
   14012c5a1:	test   %rcx,%rcx
   14012c5a4:	je     140133116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf846>
   14012c5aa:	mov    (%r9),%edx
   14012c5ad:	cmp    %edx,(%rcx)
   14012c5af:	jne    140133116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf846>
   14012c5b5:	test   %edx,%edx
   14012c5b7:	je     140133116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf846>
   14012c5bd:	mov    0x48(%rdi),%rcx
   14012c5c1:	mov    0x50(%rdi),%rdx
   14012c5c5:	movzwl 0x4(%r9),%r8d
   14012c5ca:	sub    %rcx,%rdx
   14012c5cd:	sar    $0x3,%rdx
   14012c5d1:	cmp    %rdx,%r8
   14012c5d4:	jae    140133116 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf846>
   14012c5da:	mov    0x3f0(%rsp),%rax
   14012c5e2:	mov    %rax,(%rcx,%r8,8)
   14012c5e6:	cmpb   $0x0,0x1040(%rbx)
   14012c5ed:	je     14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   14012c5f3:	movzbl 0x2(%rbp),%eax
   14012c5f7:	lea    0x293aa2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c5fe:	add    $0x3,%rbp
   14012c602:	mov    (%rdi,%rax,8),%rax
   14012c606:	jmp    *%rax
   14012c608:	shr    $0x20,%rdx
   14012c60c:	cmp    $0x3,%dx
   14012c610:	je     14012eb81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2b1>
   14012c616:	test   %dx,%dx
   14012c619:	jne    14012d7ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f1e>
   14012c61f:	lea    0x540(%rsp),%rcx
   14012c627:	lea    0x330(%rsp),%rdx
   14012c62f:	vzeroupper
   14012c632:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012c637:	lea    0x338(%rsp),%rcx
   14012c63f:	call   14021a530 <setun::VMValue::as_int() const>
   14012c644:	mov    %rax,%rdi
   14012c647:	test   %rax,%rax
   14012c64a:	js     1401313c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaf2>
   14012c650:	cmp    0x548(%rsp),%rdi
   14012c658:	jae    1401313d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb00>
   14012c65e:	test   %r12b,%r12b
   14012c661:	je     140134be1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11311>
   14012c667:	cmp    $0x1,%r12b
   14012c66b:	je     140136d5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1348b>
   14012c671:	lea    0x8(%rsi),%rax
   14012c675:	cmp    0x38(%rsp),%rax
   14012c67a:	jae    140136e18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13548>
   14012c680:	mov    0x1d0(%rsp),%rax
   14012c688:	lea    0x680(%rsp),%r10
   14012c690:	mov    $0x1,%edx
   14012c695:	lea    0x690(%rsp),%r12
   14012c69d:	mov    %r10,%rcx
   14012c6a0:	mov    %r10,0x40(%rsp)
   14012c6a5:	mov    %rax,(%rsi)
   14012c6a8:	mov    0x1c8(%rsp),%rax
   14012c6b0:	mov    %rax,0x1d0(%rsp)
   14012c6b8:	mov    0x540(%rsp),%rax
   14012c6c0:	movsbl (%rax,%rdi,1),%r8d
   14012c6c5:	mov    %r12,0x680(%rsp)
   14012c6cd:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012c6d2:	mov    0x40(%rsp),%rdx
   14012c6d7:	lea    0x520(%rsp),%rcx
   14012c6df:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012c6e4:	mov    0x520(%rsp),%rax
   14012c6ec:	mov    0x680(%rsp),%rcx
   14012c6f4:	mov    %rax,0x1c8(%rsp)
   14012c6fc:	cmp    %r12,%rcx
   14012c6ff:	je     14012c712 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e42>
   14012c701:	mov    0x690(%rsp),%rax
   14012c709:	lea    0x1(%rax),%rdx
   14012c70d:	call   140338430 <operator delete(void*, unsigned long long)>
   14012c712:	add    $0x8,%rsi
   14012c716:	mov    $0x2,%r12d
   14012c71c:	mov    0x540(%rsp),%rcx
   14012c724:	lea    0x550(%rsp),%rax
   14012c72c:	cmp    %rax,%rcx
   14012c72f:	je     140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   14012c735:	mov    0x550(%rsp),%rax
   14012c73d:	lea    0x1(%rax),%rdx
   14012c741:	call   140338430 <operator delete(void*, unsigned long long)>
   14012c746:	jmp    140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   14012c74b:	mov    %rcx,%rdx
   14012c74e:	lea    0x1068(%rbx),%rcx
   14012c755:	vzeroupper
   14012c758:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012c75d:	jmp    1401264bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bef>
   14012c762:	movzwl %ax,%edi
   14012c765:	mov    %edi,0x80(%rsp)
   14012c76c:	jmp    1401261aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28da>
   14012c771:	lea    0x540(%rsp),%rax
   14012c779:	vpxor  %xmm0,%xmm0,%xmm0
   14012c77d:	movq   $0x0,0x690(%rsp)
   14012c789:	lea    0x300(%rsp),%rdx
   14012c791:	mov    %rax,0x80(%rsp)
   14012c799:	mov    %rax,%rcx
   14012c79c:	vmovdqa %xmm0,0x680(%rsp)
   14012c7a5:	vzeroupper
   14012c7a8:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c7ad:	mov    0x80(%rsp),%rcx
   14012c7b5:	lea    0x680(%rsp),%rdx
   14012c7bd:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c7c2:	test   %eax,%eax
   14012c7c4:	jns    14012bdc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84f2>
   14012c7ca:	movswq %di,%rax
   14012c7ce:	lea    -0x4(%rbp,%rax,1),%rax
   14012c7d3:	jmp    140126153 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2883>
   14012c7d8:	lea    0x280(%rsp),%rdx
   14012c7e0:	lea    0x680(%rsp),%rcx
   14012c7e8:	vzeroupper
   14012c7eb:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c7f0:	lea    0x540(%rsp),%rax
   14012c7f8:	lea    0x278(%rsp),%rdx
   14012c800:	mov    %rax,%rcx
   14012c803:	mov    %rax,0x40(%rsp)
   14012c808:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c80d:	mov    0x40(%rsp),%rcx
   14012c812:	lea    0x680(%rsp),%rdx
   14012c81a:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c81f:	test   %eax,%eax
   14012c821:	jle    1401312f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda21>
   14012c827:	mov    0x280(%rsp),%rax
   14012c82f:	mov    %rax,0x1c8(%rsp)
   14012c837:	jmp    140125775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   14012c83c:	lea    0x290(%rsp),%rdx
   14012c844:	lea    0x680(%rsp),%rcx
   14012c84c:	vzeroupper
   14012c84f:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c854:	lea    0x540(%rsp),%rax
   14012c85c:	lea    0x288(%rsp),%rdx
   14012c864:	mov    %rax,%rcx
   14012c867:	mov    %rax,0x40(%rsp)
   14012c86c:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012c871:	mov    0x40(%rsp),%rcx
   14012c876:	lea    0x680(%rsp),%rdx
   14012c87e:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c883:	test   %eax,%eax
   14012c885:	js     140130f96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6c6>
   14012c88b:	mov    0x288(%rsp),%rax
   14012c893:	mov    %rax,0x1c8(%rsp)
   14012c89b:	jmp    140125896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   14012c8a0:	mov    %r9,0x40(%rsp)
   14012c8a5:	lea    0x1c8(%rsp),%rcx
   14012c8ad:	vzeroupper
   14012c8b0:	call   14021b9a0 <setun::VMValue::payload() const>
   14012c8b5:	mov    0x40(%rsp),%r9
   14012c8ba:	mov    0x48(%rax),%rax
   14012c8be:	test   %rax,%rax
   14012c8c1:	je     1401289b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e3>
   14012c8c7:	mov    0x38(%rax),%rcx
   14012c8cb:	test   %rcx,%rcx
   14012c8ce:	je     1401289b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e3>
   14012c8d4:	mov    (%r9),%edx
   14012c8d7:	cmp    %edx,(%rcx)
   14012c8d9:	jne    1401289b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e3>
   14012c8df:	test   %edx,%edx
   14012c8e1:	je     1401289b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e3>
   14012c8e7:	movzwl 0x4(%r9),%edx
   14012c8ec:	mov    0x48(%rax),%rax
   14012c8f0:	mov    (%rax,%rdx,8),%rax
   14012c8f4:	mov    %rax,0x1c8(%rsp)
   14012c8fc:	cmpb   $0x0,0x1040(%rbx)
   14012c903:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   14012c909:	movzbl 0x2(%rbp),%eax
   14012c90d:	lea    0x29378c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c914:	add    $0x3,%rbp
   14012c918:	mov    (%rdi,%rax,8),%rax
   14012c91c:	jmp    *%rax
   14012c91e:	vzeroupper
   14012c921:	mov    0x40(%rsp),%rbp
   14012c926:	mov    0x1048(%rbx),%rdx
   14012c92d:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012c932:	movabs $0xffffffff00000000,%rax
   14012c93c:	movabs $0xfffd000100000000,%rdx
   14012c946:	and    %r9,%rax
   14012c949:	cmp    %rdx,%rax
   14012c94c:	je     14012fab1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1e1>
   14012c952:	movabs $0xfffd000100000000,%rdx
   14012c95c:	mov    0x60(%rsp),%rax
   14012c961:	mov    (%rax),%r8
   14012c964:	movabs $0xffffffff00000000,%rax
   14012c96e:	mov    %r8,%rcx
   14012c971:	and    %rax,%rcx
   14012c974:	cmp    %rdx,%rcx
   14012c977:	je     14012fab1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1e1>
   14012c97d:	mov    0x40(%rsp),%rcx
   14012c982:	mov    (%rcx),%rcx
   14012c985:	and    %rcx,%rax
   14012c988:	cmp    %rdx,%rax
   14012c98b:	je     14012fab1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1e1>
   14012c991:	movabs $0xfff7ffffffffffff,%rdx
   14012c99b:	cmp    %r9,%rdx
   14012c99e:	jae    14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9a4:	movabs $0xfffc000000000000,%rax
   14012c9ae:	cmp    %rax,%r9
   14012c9b1:	je     14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9b7:	cmp    %r8,%rdx
   14012c9ba:	jae    14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9c0:	cmp    %rax,%r8
   14012c9c3:	je     14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9c9:	cmp    %rcx,%rdx
   14012c9cc:	jae    14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9d2:	cmp    %rax,%rcx
   14012c9d5:	je     14012de7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5ad>
   14012c9db:	mov    0x60(%rsp),%rdx
   14012c9e0:	mov    %r11,%rcx
   14012c9e3:	vzeroupper
   14012c9e6:	call   1402199e0 <setun::VMValue::mul(setun::VMValue const&) const>
   14012c9eb:	mov    0x40(%rsp),%rdx
   14012c9f0:	lea    0x680(%rsp),%rcx
   14012c9f8:	mov    %rax,0x680(%rsp)
   14012ca00:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   14012ca05:	mov    0x1068(%rbx),%rdx
   14012ca0c:	mov    %rax,(%rdx,%rdi,8)
   14012ca10:	cmpb   $0x0,0x1040(%rbx)
   14012ca17:	je     14012d160 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9890>
   14012ca1d:	movzbl 0x8(%rbp),%eax
   14012ca21:	lea    0x293678(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ca28:	add    $0x9,%rbp
   14012ca2c:	mov    (%rdi,%rax,8),%rax
   14012ca30:	jmp    *%rax
   14012ca32:	movswq %di,%rcx
   14012ca36:	mov    %r8,0x40(%rsp)
   14012ca3b:	mov    %rcx,%rdx
   14012ca3e:	lea    0x680(%rsp),%rcx
   14012ca46:	mov    %r9,0x60(%rsp)
   14012ca4b:	vzeroupper
   14012ca4e:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012ca53:	mov    0x40(%rsp),%rcx
   14012ca58:	lea    0x680(%rsp),%rdx
   14012ca60:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   14012ca65:	mov    0x40(%rsp),%r8
   14012ca6a:	mov    0x60(%rsp),%r9
   14012ca6f:	cmpb   $0x0,0x1040(%rbx)
   14012ca76:	mov    %rax,(%r8)
   14012ca79:	je     1401308ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfdd>
   14012ca7f:	movzbl 0x4(%rbp),%eax
   14012ca83:	lea    0x293616(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ca8a:	add    $0x5,%rbp
   14012ca8e:	mov    (%rdi,%rax,8),%rax
   14012ca92:	jmp    *%rax
   14012ca94:	mov    %rax,%rbp
   14012ca97:	vzeroupper
   14012ca9a:	jmp    14012a277 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012ca9f:	movswq %r10w,%rdx
   14012caa3:	lea    0x680(%rsp),%rax
   14012caab:	mov    %r8,0x80(%rsp)
   14012cab3:	mov    %rax,0x60(%rsp)
   14012cab8:	mov    %rax,%rcx
   14012cabb:	vzeroupper
   14012cabe:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012cac3:	mov    0x60(%rsp),%rdx
   14012cac8:	mov    %rdi,%rcx
   14012cacb:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   14012cad0:	mov    0x1068(%rbx),%rdx
   14012cad7:	mov    0x80(%rsp),%r8
   14012cadf:	mov    %rax,(%rdx,%r8,8)
   14012cae3:	cmpb   $0x0,0x1040(%rbx)
   14012caea:	je     14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   14012caf0:	movzbl 0x6(%rbp),%eax
   14012caf4:	lea    0x2935a5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cafb:	add    $0x7,%rbp
   14012caff:	mov    (%rdi,%rax,8),%rax
   14012cb03:	jmp    *%rax
   14012cb05:	cmp    $0x2,%r12b
   14012cb09:	jne    14013644e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b7e>
   14012cb0f:	mov    0x1d0(%rsp),%rdx
   14012cb17:	mov    0x1c8(%rsp),%rax
   14012cb1f:	movabs $0xfffd000000000000,%rcx
   14012cb29:	mov    %rdx,0x1c8(%rsp)
   14012cb31:	movabs $0xffff000000000000,%rdx
   14012cb3b:	and    %rax,%rdx
   14012cb3e:	mov    %rax,0x3e0(%rsp)
   14012cb46:	cmp    %rcx,%rdx
   14012cb49:	je     140133fe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10719>
   14012cb4f:	mov    0x1c8(%rsp),%rax
   14012cb57:	mov    $0x2,%r12d
   14012cb5d:	mov    %rax,0x1d0(%rsp)
   14012cb65:	jmp    1401289f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5123>
   14012cb6a:	nopw   0x0(%rax,%rax,1)
   14012cb70:	mov    %rcx,%rbp
   14012cb73:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012cb78:	mov    %rax,%rcx
   14012cb7b:	mov    0x8(%rax),%eax
   14012cb7e:	mov    %eax,0xa0(%rsp)
   14012cb85:	add    $0x1,%eax
   14012cb88:	mov    %eax,0x8(%rcx)
   14012cb8b:	cmp    0xc(%rcx),%eax
   14012cb8e:	jb     14012cc63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9393>
   14012cb94:	cmp    $0x2,%r12b
   14012cb98:	je     140136a03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13133>
   14012cb9e:	sub    $0x1,%r12b
   14012cba2:	je     140136a54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13184>
   14012cba8:	mov    0x1048(%rbx),%rdx
   14012cbaf:	mov    0x1050(%rbx),%rax
   14012cbb6:	vzeroupper
   14012cbb9:	mov    0x60(%rsp),%rcx
   14012cbbe:	sub    %rdx,%rsi
   14012cbc1:	sub    %rdx,%rax
   14012cbc4:	mov    %rsi,%rbp
   14012cbc7:	sub    %r15,%rcx
   14012cbca:	sar    $0x3,%rbp
   14012cbce:	mov    %rcx,0x1038(%rbx)
   14012cbd5:	cmp    %rsi,%rax
   14012cbd8:	jb     140136a3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1316e>
   14012cbde:	vmovdqa 0x22fefa(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012cbe6:	mov    0xc0(%rsp),%rax
   14012cbee:	mov    %rbp,0x1060(%rbx)
   14012cbf5:	mov    %rbx,%rdx
   14012cbf8:	mov    0x152c8(%rbx),%rcx
   14012cbff:	movb   $0x0,0x153a0(%rbx)
   14012cc06:	mov    %r14,%r8
   14012cc09:	vmovdqa %xmm0,0x15390(%rbx)
   14012cc11:	mov    0x80(%rsp),%r9d
   14012cc19:	mov    %rax,0x20(%rsp)
   14012cc1e:	call   140171a20 <setun::JITManager::slow_tiering_coordinator_call(setun::VM*, setun::Chunk const&, unsigned long long, setun::FunctionHotData&)>
   14012cc23:	mov    0x1038(%rbx),%rsi
   14012cc2a:	mov    0x1048(%rbx),%rdx
   14012cc31:	mov    0x1060(%rbx),%rcx
   14012cc38:	add    %r15,%rsi
   14012cc3b:	mov    %rsi,0x60(%rsp)
   14012cc40:	lea    (%rdx,%rcx,8),%rsi
   14012cc44:	mov    0x1050(%rbx),%rdx
   14012cc4b:	mov    %rdx,0x38(%rsp)
   14012cc50:	test   %al,%al
   14012cc52:	jne    14012cc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9390>
   14012cc54:	mov    0xc0(%rsp),%rax
   14012cc5c:	addl   $0x64,0xc(%rax)
   14012cc60:	xor    %r12d,%r12d
   14012cc63:	cmpb   $0x0,0x15211(%rbx)
   14012cc6a:	je     14012d20d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x993d>
   14012cc70:	mov    0x150c0(%rbx),%rax
   14012cc77:	mov    0x15268(%rbx),%r13
   14012cc7e:	test   %rax,%rax
   14012cc81:	je     14012e526 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac56>
   14012cc87:	lea    (%rax,%rax,4),%rax
   14012cc8b:	lea    (%rbx,%rax,8),%rdx
   14012cc8f:	mov    0x10a0(%rdx),%rax
   14012cc96:	mov    0x10b0(%rdx),%rdx
   14012cc9d:	add    %rdx,%rax
   14012cca0:	cmp    %rax,%r13
   14012cca3:	jb     140135f33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12663>
   14012cca9:	mov    0x40(%rsp),%rax
   14012ccae:	lea    (%rax,%r13,1),%rdx
   14012ccb2:	mov    0x1070(%rbx),%rax
   14012ccb9:	sub    0x1068(%rbx),%rax
   14012ccc0:	mov    %rdx,0x15268(%rbx)
   14012ccc7:	sar    $0x3,%rax
   14012cccb:	add    $0x40,%rdx
   14012cccf:	cmp    %rax,%rdx
   14012ccd2:	jae    140131f61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe691>
   14012ccd8:	test   %dil,%dil
   14012ccdb:	je     14012d8c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ff9>
   14012cce1:	movzbl %dil,%edx
   14012cce5:	movzbl %dil,%r8d
   14012cce9:	lea    -0x1(%rdx,%r13,1),%rcx
   14012ccee:	sub    $0x1,%r8d
   14012ccf2:	sub    $0x2,%rdx
   14012ccf6:	sub    %r8,%rdx
   14012ccf9:	lea    0x0(,%rcx,8),%rax
   14012cd01:	mov    0x1068(%rbx),%r8
   14012cd08:	add    %r13,%rdx
   14012cd0b:	shl    $0x3,%rdx
   14012cd0f:	cmp    $0x1,%r12b
   14012cd13:	je     14012cd44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9474>
   14012cd15:	cmp    $0x2,%r12b
   14012cd19:	jne    14012cd59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9489>
   14012cd1b:	mov    0x1c8(%rsp),%r9
   14012cd23:	sub    $0x8,%rax
   14012cd27:	mov    %r9,(%r8,%rcx,8)
   14012cd2b:	mov    0x1d0(%rsp),%rcx
   14012cd33:	mov    %rcx,0x1c8(%rsp)
   14012cd3b:	cmp    %rdx,%rax
   14012cd3e:	je     14012e7a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaed4>
   14012cd44:	mov    0x1c8(%rsp),%rcx
   14012cd4c:	mov    %rcx,(%r8,%rax,1)
   14012cd50:	sub    $0x8,%rax
   14012cd54:	cmp    %rdx,%rax
   14012cd57:	je     14012cd71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94a1>
   14012cd59:	mov    %rsi,%rcx
   14012cd5c:	sub    $0x8,%rsi
   14012cd60:	mov    -0x8(%rcx),%rcx
   14012cd64:	mov    %rcx,(%r8,%rax,1)
   14012cd68:	sub    $0x8,%rax
   14012cd6c:	cmp    %rdx,%rax
   14012cd6f:	jne    14012cd59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9489>
   14012cd71:	mov    0x1048(%rbx),%rdx
   14012cd78:	mov    0x60(%rsp),%rcx
   14012cd7d:	sub    %rdx,%rsi
   14012cd80:	mov    0x150c0(%rbx),%rax
   14012cd87:	mov    %rsi,%rbp
   14012cd8a:	mov    0x80(%rsp),%edi
   14012cd91:	sub    %r15,%rcx
   14012cd94:	sar    $0x3,%rbp
   14012cd98:	cmp    $0x7ff,%rax
   14012cd9e:	ja     140138798 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec8>
   14012cda4:	lea    0x1(%rax),%r8
   14012cda8:	lea    (%rax,%rax,4),%rax
   14012cdac:	mov    %r8,0x150c0(%rbx)
   14012cdb3:	mov    %rcx,0x10c0(%rbx,%rax,8)
   14012cdbb:	mov    0x40(%rsp),%rcx
   14012cdc0:	mov    %r13,0x10c8(%rbx,%rax,8)
   14012cdc8:	mov    %rbp,0x10d0(%rbx,%rax,8)
   14012cdd0:	mov    %rcx,0x10d8(%rbx,%rax,8)
   14012cdd8:	mov    %rdi,0x10e0(%rbx,%rax,8)
   14012cde0:	mov    0x1050(%rbx),%rax
   14012cde7:	sub    %rdx,%rax
   14012cdea:	cmp    %rsi,%rax
   14012cded:	jb     14012d908 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa038>
   14012cdf3:	mov    0x15270(%rbx),%rax
   14012cdfa:	mov    %rbp,0x1060(%rbx)
   14012ce01:	mov    0x152a0(%rbx),%rsi
   14012ce08:	cmp    %rsi,0x68(%rax)
   14012ce0c:	jae    140131aad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1dd>
   14012ce12:	mov    0x1060(%rbx),%rax
   14012ce19:	mov    0x1048(%rbx),%rdx
   14012ce20:	lea    (%rdx,%rax,8),%rsi
   14012ce24:	lea    (%r15,%rdi,1),%rax
   14012ce28:	cmpb   $0x0,0x1040(%rbx)
   14012ce2f:	je     140131720 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde50>
   14012ce35:	lea    0x1(%rax),%rbp
   14012ce39:	movzbl (%rax),%eax
   14012ce3c:	lea    0x29325d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ce43:	xor    %r12d,%r12d
   14012ce46:	mov    (%rdi,%rax,8),%rax
   14012ce4a:	jmp    *%rax
   14012ce4c:	lea    0x2a8(%rsp),%rcx
   14012ce54:	vzeroupper
   14012ce57:	call   14021bc80 <setun::VMValue::as_float() const>
   14012ce5c:	lea    0x2b0(%rsp),%rcx
   14012ce64:	vmovapd %xmm0,%xmm7
   14012ce68:	call   14021bc80 <setun::VMValue::as_float() const>
   14012ce6d:	vsubsd %xmm0,%xmm7,%xmm0
   14012ce71:	vandpd 0x22fcd7(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3087+0x250>
   14012ce79:	vcomisd 0x22fca7(%rip),%xmm0        # 14035cb28 <CSWTCH.3087+0x228>
   14012ce81:	setae  %al
   14012ce84:	jmp    140125ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   14012ce89:	cmp    $0x1,%r12b
   14012ce8d:	je     14012e713 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae43>
   14012ce93:	lea    0x8(%rsi),%r8
   14012ce97:	cmp    0x38(%rsp),%r8
   14012ce9c:	jae    140132859 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef89>
   14012cea2:	mov    0x1d0(%rsp),%rax
   14012ceaa:	mov    %rax,(%rsi)
   14012cead:	mov    0x1c8(%rsp),%rax
   14012ceb5:	mov    %r8,%rsi
   14012ceb8:	mov    %rax,0x1d0(%rsp)
   14012cec0:	mov    0x60(%rsp),%rax
   14012cec5:	mov    %rax,0x680(%rsp)
   14012cecd:	lock addl $0x1,0x8(%rdi)
   14012ced2:	lea    0x680(%rsp),%rdx
   14012ceda:	lea    0x540(%rsp),%rcx
   14012cee2:	mov    %rdi,0x688(%rsp)
   14012ceea:	call   14020ee00 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012ceef:	mov    0x540(%rsp),%rax
   14012cef7:	mov    0x688(%rsp),%rcx
   14012ceff:	mov    %rax,0x1c8(%rsp)
   14012cf07:	test   %rcx,%rcx
   14012cf0a:	je     14012cf11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9641>
   14012cf0c:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012cf11:	mov    $0x2,%r12d
   14012cf17:	jmp    140129f00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6630>
   14012cf1c:	mov    0x1048(%rbx),%rdx
   14012cf23:	mov    %rdi,%rbp
   14012cf26:	vzeroupper
   14012cf29:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012cf2e:	mov    %rax,%rcx
   14012cf31:	sub    %rdx,%rcx
   14012cf34:	sar    $0x3,%rcx
   14012cf38:	lea    (%rcx,%rcx,1),%r9
   14012cf3c:	cmp    %r9,%rcx
   14012cf3f:	jae    1401244e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   14012cf45:	sub    %rdx,%rsi
   14012cf48:	lea    0x1048(%rbx),%rcx
   14012cf4f:	mov    %r9,%rdx
   14012cf52:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012cf57:	mov    0x1048(%rbx),%rdx
   14012cf5e:	mov    0x1050(%rbx),%rax
   14012cf65:	add    %rdx,%rsi
   14012cf68:	lea    0x10(%rsi),%r8
   14012cf6c:	jmp    1401244e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   14012cf71:	lea    0x3c8(%rsp),%rcx
   14012cf79:	vzeroupper
   14012cf7c:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cf81:	lea    0x3d0(%rsp),%rcx
   14012cf89:	vmovapd %xmm0,%xmm7
   14012cf8d:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cf92:	vcomisd %xmm0,%xmm7
   14012cf96:	setae  %al
   14012cf99:	jmp    140128933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5063>
   14012cf9e:	lea    0x398(%rsp),%rcx
   14012cfa6:	vzeroupper
   14012cfa9:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cfae:	lea    0x3a0(%rsp),%rcx
   14012cfb6:	vmovapd %xmm0,%xmm7
   14012cfba:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cfbf:	vcomisd %xmm7,%xmm0
   14012cfc3:	setae  %al
   14012cfc6:	jmp    140128511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c41>
   14012cfcb:	lea    0x3b8(%rsp),%rcx
   14012cfd3:	vzeroupper
   14012cfd6:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cfdb:	lea    0x3c0(%rsp),%rcx
   14012cfe3:	vmovapd %xmm0,%xmm7
   14012cfe7:	call   14021bc80 <setun::VMValue::as_float() const>
   14012cfec:	vcomisd %xmm0,%xmm7
   14012cff0:	seta   %al
   14012cff3:	jmp    1401287d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f03>
   14012cff8:	lea    0x3a8(%rsp),%rcx
   14012d000:	vzeroupper
   14012d003:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d008:	lea    0x3b0(%rsp),%rcx
   14012d010:	vmovapd %xmm0,%xmm7
   14012d014:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d019:	vmovsd 0x22fb07(%rip),%xmm1        # 14035cb28 <CSWTCH.3087+0x228>
   14012d021:	vsubsd %xmm0,%xmm7,%xmm0
   14012d025:	vandpd 0x22fb23(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3087+0x250>
   14012d02d:	vcomisd %xmm0,%xmm1
   14012d031:	seta   %dil
   14012d035:	jmp    140128672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da2>
   14012d03a:	lea    0x2e8(%rsp),%rcx
   14012d042:	vzeroupper
   14012d045:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d04a:	lea    0x2f0(%rsp),%rcx
   14012d052:	vmovapd %xmm0,%xmm7
   14012d056:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d05b:	vcomisd %xmm0,%xmm7
   14012d05f:	setae  %al
   14012d062:	jmp    140125f9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   14012d067:	lea    0x2c8(%rsp),%rcx
   14012d06f:	vzeroupper
   14012d072:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d077:	lea    0x2d0(%rsp),%rcx
   14012d07f:	vmovapd %xmm0,%xmm7
   14012d083:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d088:	vcomisd %xmm7,%xmm0
   14012d08c:	setae  %al
   14012d08f:	jmp    140125d3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   14012d094:	lea    0x298(%rsp),%rcx
   14012d09c:	vzeroupper
   14012d09f:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d0a4:	lea    0x2a0(%rsp),%rcx
   14012d0ac:	vmovapd %xmm0,%xmm7
   14012d0b0:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d0b5:	vmovsd 0x22fa6b(%rip),%xmm1        # 14035cb28 <CSWTCH.3087+0x228>
   14012d0bd:	vsubsd %xmm0,%xmm7,%xmm0
   14012d0c1:	vandpd 0x22fa87(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3087+0x250>
   14012d0c9:	vcomisd %xmm0,%xmm1
   14012d0cd:	seta   %dil
   14012d0d1:	jmp    1401259ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   14012d0d6:	lea    0x2b8(%rsp),%rcx
   14012d0de:	vzeroupper
   14012d0e1:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d0e6:	lea    0x2c0(%rsp),%rcx
   14012d0ee:	vmovapd %xmm0,%xmm7
   14012d0f2:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d0f7:	vcomisd %xmm7,%xmm0
   14012d0fb:	seta   %al
   14012d0fe:	jmp    140125c0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   14012d103:	lea    0x2d8(%rsp),%rcx
   14012d10b:	vzeroupper
   14012d10e:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d113:	lea    0x2e0(%rsp),%rcx
   14012d11b:	vmovapd %xmm0,%xmm7
   14012d11f:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d124:	vcomisd %xmm0,%xmm7
   14012d128:	seta   %al
   14012d12b:	jmp    140125e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   14012d130:	lea    0x388(%rsp),%rcx
   14012d138:	vzeroupper
   14012d13b:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d140:	lea    0x390(%rsp),%rcx
   14012d148:	vmovapd %xmm0,%xmm7
   14012d14c:	call   14021bc80 <setun::VMValue::as_float() const>
   14012d151:	vcomisd %xmm7,%xmm0
   14012d155:	seta   %al
   14012d158:	jmp    1401283b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae1>
   14012d15d:	vzeroupper
   14012d160:	mov    0xa0(%rsp),%rbp
   14012d168:	mov    0x1048(%rbx),%rdx
   14012d16f:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012d174:	movabs $0xfff8000000000000,%rax
   14012d17e:	mov    %rax,0x1c8(%rsp)
   14012d186:	mov    $0x1,%r12d
   14012d18c:	jmp    140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   14012d191:	shr    $0x20,%rdx
   14012d195:	cmp    $0x1,%dx
   14012d199:	je     14012f138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb868>
   14012d19f:	cmp    $0x5,%dx
   14012d1a3:	jne    1401249e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1113>
   14012d1a9:	mov    0x40(%rsp),%rcx
   14012d1ae:	mov    %r8,0xc0(%rsp)
   14012d1b6:	call   14021a530 <setun::VMValue::as_int() const>
   14012d1bb:	jmp    1401249fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112a>
   14012d1c0:	shr    $0x20,%rdx
   14012d1c4:	cmp    $0x1,%dx
   14012d1c8:	je     14012ee0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb53e>
   14012d1ce:	cmp    $0x5,%dx
   14012d1d2:	jne    140124973 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a3>
   14012d1d8:	mov    %r9,%rcx
   14012d1db:	call   14021a530 <setun::VMValue::as_int() const>
   14012d1e0:	lea    0x440(%rsp),%r8
   14012d1e8:	movq   $0x0,0x448(%rsp)
   14012d1f4:	mov    %rax,0x440(%rsp)
   14012d1fc:	movq   $0x0,0x450(%rsp)
   14012d208:	jmp    1401249a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d8>
   14012d20d:	mov    0x1070(%rbx),%rax
   14012d214:	sub    0x1068(%rbx),%rax
   14012d21b:	lea    0x1068(%rbx),%rcx
   14012d222:	sar    $0x3,%rax
   14012d226:	mov    %rax,%r13
   14012d229:	mov    0x40(%rsp),%rax
   14012d22e:	lea    (%rax,%r13,1),%rdx
   14012d232:	vzeroupper
   14012d235:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d23a:	jmp    14012ccd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9408>
   14012d23f:	lea    (%rdi,%rdi,1),%rdx
   14012d243:	lea    0x1048(%rbx),%rcx
   14012d24a:	vzeroupper
   14012d24d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d252:	mov    0x1048(%rbx),%rdx
   14012d259:	mov    0x1050(%rbx),%rax
   14012d260:	jmp    140129b70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62a0>
   14012d265:	lea    (%rdi,%rdi,1),%rdx
   14012d269:	lea    0x1048(%rbx),%rcx
   14012d270:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d275:	jmp    1401271c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38f0>
   14012d27a:	lea    (%rdi,%rdi,1),%rdx
   14012d27e:	lea    0x1048(%rbx),%rcx
   14012d285:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d28a:	jmp    140129c3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x636d>
   14012d28f:	lea    (%rdi,%rdi,1),%rdx
   14012d293:	lea    0x1048(%rbx),%rcx
   14012d29a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d29f:	jmp    140129d10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6440>
   14012d2a4:	lea    (%rdi,%rdi,1),%rdx
   14012d2a8:	lea    0x1048(%rbx),%rcx
   14012d2af:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d2b4:	jmp    1401268af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fdf>
   14012d2b9:	lea    (%rdi,%rdi,1),%rdx
   14012d2bd:	lea    0x1048(%rbx),%rcx
   14012d2c4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d2c9:	jmp    140128c12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5342>
   14012d2ce:	lea    (%rdi,%rdi,1),%rdx
   14012d2d2:	lea    0x1048(%rbx),%rcx
   14012d2d9:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d2de:	jmp    140128e8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55bb>
   14012d2e3:	lea    (%rdi,%rdi,1),%rdx
   14012d2e7:	lea    0x1048(%rbx),%rcx
   14012d2ee:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d2f3:	jmp    140128db8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54e8>
   14012d2f8:	lea    (%rdi,%rdi,1),%rdx
   14012d2fc:	lea    0x1048(%rbx),%rcx
   14012d303:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d308:	jmp    140129031 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5761>
   14012d30d:	lea    (%rdi,%rdi,1),%rdx
   14012d311:	lea    0x1048(%rbx),%rcx
   14012d318:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d31d:	jmp    14012986f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f9f>
   14012d322:	lea    (%rdi,%rdi,1),%rdx
   14012d326:	lea    0x1048(%rbx),%rcx
   14012d32d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d332:	jmp    140129942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6072>
   14012d337:	lea    (%rdi,%rdi,1),%rdx
   14012d33b:	lea    0x1048(%rbx),%rcx
   14012d342:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d347:	jmp    140128ce5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5415>
   14012d34c:	lea    (%rdi,%rdi,1),%rdx
   14012d350:	lea    0x1048(%rbx),%rcx
   14012d357:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d35c:	jmp    1401291d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5907>
   14012d361:	lea    (%rdi,%rdi,1),%rdx
   14012d365:	lea    0x1048(%rbx),%rcx
   14012d36c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d371:	jmp    1401295f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d26>
   14012d376:	lea    (%rdi,%rdi,1),%rdx
   14012d37a:	lea    0x1048(%rbx),%rcx
   14012d381:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d386:	jmp    1401270ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x381d>
   14012d38b:	lea    (%rdi,%rdi,1),%rdx
   14012d38f:	lea    0x1048(%rbx),%rcx
   14012d396:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d39b:	jmp    140129a15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6145>
   14012d3a0:	mov    %rax,%rcx
   14012d3a3:	sub    %rdx,%rcx
   14012d3a6:	sar    $0x3,%rcx
   14012d3aa:	lea    (%rcx,%rcx,1),%r9
   14012d3ae:	cmp    %r9,%rcx
   14012d3b1:	jae    14012a28d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bd>
   14012d3b7:	sub    %rdx,%rsi
   14012d3ba:	lea    0x1048(%rbx),%rcx
   14012d3c1:	mov    %r9,%rdx
   14012d3c4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3c9:	mov    0x1048(%rbx),%rdx
   14012d3d0:	mov    0x1050(%rbx),%rax
   14012d3d7:	add    %rdx,%rsi
   14012d3da:	lea    0x8(%rsi),%r8
   14012d3de:	jmp    14012a28d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bd>
   14012d3e3:	lea    (%rdi,%rdi,1),%rdx
   14012d3e7:	lea    0x1048(%rbx),%rcx
   14012d3ee:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3f3:	jmp    140126da1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34d1>
   14012d3f8:	lea    (%rdi,%rdi,1),%rdx
   14012d3fc:	lea    0x1048(%rbx),%rcx
   14012d403:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d408:	jmp    140126e74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35a4>
   14012d40d:	lea    (%rdi,%rdi,1),%rdx
   14012d411:	lea    0x1048(%rbx),%rcx
   14012d418:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d41d:	jmp    14012701a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x374a>
   14012d422:	lea    (%rdi,%rdi,1),%rdx
   14012d426:	lea    0x1048(%rbx),%rcx
   14012d42d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d432:	jmp    140127439 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b69>
   14012d437:	lea    (%rdi,%rdi,1),%rdx
   14012d43b:	lea    0x1048(%rbx),%rcx
   14012d442:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d447:	jmp    140127293 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39c3>
   14012d44c:	lea    (%rdi,%rdi,1),%rdx
   14012d450:	lea    0x1048(%rbx),%rcx
   14012d457:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d45c:	jmp    140127366 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a96>
   14012d461:	lea    (%rdi,%rdi,1),%rdx
   14012d465:	lea    0x1048(%rbx),%rcx
   14012d46c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d471:	jmp    140126cce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fe>
   14012d476:	lea    (%rdi,%rdi,1),%rdx
   14012d47a:	lea    0x1048(%rbx),%rcx
   14012d481:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d486:	jmp    140126f47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3677>
   14012d48b:	lea    (%rdi,%rdi,1),%rdx
   14012d48f:	lea    0x1048(%rbx),%rcx
   14012d496:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d49b:	jmp    140126bfb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x332b>
   14012d4a0:	lea    (%rdi,%rdi,1),%rdx
   14012d4a4:	lea    0x1048(%rbx),%rcx
   14012d4ab:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4b0:	jmp    1401267dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f0c>
   14012d4b5:	lea    (%rdi,%rdi,1),%rdx
   14012d4b9:	lea    0x1048(%rbx),%rcx
   14012d4c0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4c5:	jmp    14012979c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ecc>
   14012d4ca:	lea    (%rdi,%rdi,1),%rdx
   14012d4ce:	lea    0x1048(%rbx),%rcx
   14012d4d5:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4da:	jmp    140128a6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x519c>
   14012d4df:	lea    (%rdi,%rdi,1),%rdx
   14012d4e3:	lea    0x1048(%rbx),%rcx
   14012d4ea:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4ef:	jmp    1401296c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5df9>
   14012d4f4:	lea    (%rdi,%rdi,1),%rdx
   14012d4f8:	lea    0x1048(%rbx),%rcx
   14012d4ff:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d504:	jmp    1401292aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59da>
   14012d509:	lea    (%rdi,%rdi,1),%rdx
   14012d50d:	lea    0x1048(%rbx),%rcx
   14012d514:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d519:	jmp    140128f5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x568e>
   14012d51e:	lea    (%rdi,%rdi,1),%rdx
   14012d522:	lea    0x1048(%rbx),%rcx
   14012d529:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d52e:	jmp    140129104 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5834>
   14012d533:	lea    (%rdi,%rdi,1),%rdx
   14012d537:	lea    0x1048(%rbx),%rcx
   14012d53e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d543:	jmp    14012937d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aad>
   14012d548:	lea    (%rdi,%rdi,1),%rdx
   14012d54c:	lea    0x1048(%rbx),%rcx
   14012d553:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d558:	jmp    140129523 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c53>
   14012d55d:	lea    (%rdi,%rdi,1),%rdx
   14012d561:	lea    0x1048(%rbx),%rcx
   14012d568:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d56d:	jmp    140129450 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b80>
   14012d572:	lea    (%rdi,%rdi,1),%rdx
   14012d576:	lea    0x1048(%rbx),%rcx
   14012d57d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d582:	jmp    14012750c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c3c>
   14012d587:	lea    (%rsi,%rsi,1),%rdx
   14012d58b:	lea    0x1048(%rbx),%rcx
   14012d592:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d597:	jmp    140129b02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6232>
   14012d59c:	lea    (%rdi,%rdi,1),%rdx
   14012d5a0:	lea    0x1048(%rbx),%rcx
   14012d5a7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5ac:	jmp    140126b28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3258>
   14012d5b1:	lea    (%rdi,%rdi,1),%rdx
   14012d5b5:	lea    0x1048(%rbx),%rcx
   14012d5bc:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5c1:	jmp    140126982 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30b2>
   14012d5c6:	lea    (%rdi,%rdi,1),%rdx
   14012d5ca:	lea    0x1048(%rbx),%rcx
   14012d5d1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5d6:	jmp    140126a55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3185>
   14012d5db:	lea    (%rdi,%rdi,1),%rdx
   14012d5df:	lea    0x1048(%rbx),%rcx
   14012d5e6:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5eb:	jmp    140128b3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x526f>
   14012d5f0:	lea    (%rsi,%rsi,1),%rdx
   14012d5f4:	lea    0x1048(%rbx),%rcx
   14012d5fb:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d600:	jmp    140127999 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40c9>
   14012d605:	mov    0x1048(%rbx),%rdx
   14012d60c:	lea    0x10(%rsi),%r8
   14012d610:	cmp    0x38(%rsp),%r8
   14012d615:	jae    1401333d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb05>
   14012d61b:	mov    0x1050(%rbx),%rax
   14012d622:	mov    0x1d0(%rsp),%rcx
   14012d62a:	mov    %rcx,(%rsi)
   14012d62d:	mov    0x1c8(%rsp),%rcx
   14012d635:	mov    %rcx,0x8(%rsi)
   14012d639:	jmp    140127974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40a4>
   14012d63e:	xor    %r12d,%r12d
   14012d641:	shr    $0x20,%rax
   14012d645:	cmp    $0x2,%ax
   14012d649:	je     14012f57f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcaf>
   14012d64f:	cmp    $0x3,%ax
   14012d653:	je     14012f4ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbea>
   14012d659:	cmp    $0x1,%ax
   14012d65d:	je     1401308bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfec>
   14012d663:	test   %ax,%ax
   14012d666:	jne    14012e4db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac0b>
   14012d66c:	movzwl 0x6(%r9),%edi
   14012d671:	lea    0x22e452(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14012d678:	shl    $0x5,%rdi
   14012d67c:	add    0x30(%r14),%rdi
   14012d680:	mov    %rdi,%rcx
   14012d683:	vzeroupper
   14012d686:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012d68b:	test   %al,%al
   14012d68d:	jne    14012d6a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dd6>
   14012d68f:	lea    0x22e430(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   14012d696:	mov    %rdi,%rcx
   14012d699:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012d69e:	test   %al,%al
   14012d6a0:	je     14012e4db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac0b>
   14012d6a6:	test   %r12b,%r12b
   14012d6a9:	je     1401335ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcea>
   14012d6af:	cmp    $0x1,%r12b
   14012d6b3:	je     140135c43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12373>
   14012d6b9:	lea    0x8(%rsi),%r8
   14012d6bd:	cmp    0x38(%rsp),%r8
   14012d6c2:	jae    140137b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142b9>
   14012d6c8:	mov    0x1d0(%rsp),%rax
   14012d6d0:	mov    %r8,0x40(%rsp)
   14012d6d5:	lea    0x680(%rsp),%rcx
   14012d6dd:	lea    0x3e0(%rsp),%rdx
   14012d6e5:	mov    %rax,(%rsi)
   14012d6e8:	mov    0x1c8(%rsp),%rax
   14012d6f0:	mov    %rax,0x1d0(%rsp)
   14012d6f8:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012d6fd:	mov    0x688(%rsp),%rdx
   14012d705:	mov    0x40(%rsp),%rsi
   14012d70a:	lea    0x540(%rsp),%rcx
   14012d712:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012d717:	mov    0x540(%rsp),%rax
   14012d71f:	mov    0x680(%rsp),%rcx
   14012d727:	mov    %rax,0x1c8(%rsp)
   14012d72f:	lea    0x690(%rsp),%rax
   14012d737:	cmp    %rax,%rcx
   14012d73a:	je     14012d74d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e7d>
   14012d73c:	mov    0x690(%rsp),%rax
   14012d744:	lea    0x1(%rax),%rdx
   14012d748:	call   140338430 <operator delete(void*, unsigned long long)>
   14012d74d:	mov    $0x2,%r12d
   14012d753:	cmpb   $0x0,0x1040(%rbx)
   14012d75a:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   14012d760:	movzbl 0x2(%rbp),%eax
   14012d764:	lea    0x292935(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d76b:	add    $0x3,%rbp
   14012d76f:	mov    (%rdi,%rax,8),%rax
   14012d773:	jmp    *%rax
   14012d775:	vzeroupper
   14012d778:	jmp    140129dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x651a>
   14012d77d:	cmp    $0x1,%ax
   14012d781:	je     140130ed3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd603>
   14012d787:	cmp    $0x2,%ax
   14012d78b:	je     140131acf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1ff>
   14012d791:	test   %r12b,%r12b
   14012d794:	je     140129f8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14012d79a:	cmp    $0x1,%r12b
   14012d79e:	je     14013026d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   14012d7a4:	lea    0x8(%rsi),%r8
   14012d7a8:	cmp    0x38(%rsp),%r8
   14012d7ad:	jae    140135173 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118a3>
   14012d7b3:	mov    0x1d0(%rsp),%rax
   14012d7bb:	mov    %rax,(%rsi)
   14012d7be:	mov    0x1c8(%rsp),%rax
   14012d7c6:	mov    %r8,%rsi
   14012d7c9:	mov    %rax,0x1d0(%rsp)
   14012d7d1:	movabs $0xfff8000000000000,%rax
   14012d7db:	mov    %rax,0x1c8(%rsp)
   14012d7e3:	mov    $0x2,%r12d
   14012d7e9:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012d7ee:	cmp    $0x2,%dx
   14012d7f2:	jne    140127e90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45c0>
   14012d7f8:	lea    0x330(%rsp),%rcx
   14012d800:	vzeroupper
   14012d803:	call   14021b9a0 <setun::VMValue::payload() const>
   14012d808:	mov    0x48(%rax),%rax
   14012d80c:	mov    %rax,0x40(%rsp)
   14012d811:	test   %rax,%rax
   14012d814:	je     14012ebaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2da>
   14012d81a:	test   %r12b,%r12b
   14012d81d:	je     140133bb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102e1>
   14012d823:	cmp    $0x1,%r12b
   14012d827:	je     1401376f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e24>
   14012d82d:	lea    0x8(%rsi),%r8
   14012d831:	cmp    0x38(%rsp),%r8
   14012d836:	jae    1401376a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dd2>
   14012d83c:	mov    0x1d0(%rsp),%rax
   14012d844:	lea    0x338(%rsp),%rdx
   14012d84c:	mov    %r8,0x60(%rsp)
   14012d851:	lea    0x680(%rsp),%rcx
   14012d859:	mov    %rax,(%rsi)
   14012d85c:	mov    0x1c8(%rsp),%rax
   14012d864:	mov    %rax,0x1d0(%rsp)
   14012d86c:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14012d871:	mov    0x40(%rsp),%rcx
   14012d876:	lea    0x680(%rsp),%rdx
   14012d87e:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14012d883:	mov    0x680(%rsp),%rcx
   14012d88b:	mov    0x60(%rsp),%r8
   14012d890:	mov    %rax,0x1c8(%rsp)
   14012d898:	lea    0x690(%rsp),%rax
   14012d8a0:	cmp    %rax,%rcx
   14012d8a3:	je     140127edf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x460f>
   14012d8a9:	mov    0x690(%rsp),%rax
   14012d8b1:	mov    %r8,0x40(%rsp)
   14012d8b6:	lea    0x1(%rax),%rdx
   14012d8ba:	call   140338430 <operator delete(void*, unsigned long long)>
   14012d8bf:	mov    0x40(%rsp),%r8
   14012d8c4:	jmp    140127edf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x460f>
   14012d8c9:	cmp    $0x2,%r12b
   14012d8cd:	jne    14012e79a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaeca>
   14012d8d3:	mov    0x1048(%rbx),%rdx
   14012d8da:	lea    0x10(%rsi),%r8
   14012d8de:	cmp    0x38(%rsp),%r8
   14012d8e3:	jae    1401347a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ed7>
   14012d8e9:	mov    0x1d0(%rsp),%rax
   14012d8f1:	mov    %rax,(%rsi)
   14012d8f4:	mov    0x1c8(%rsp),%rax
   14012d8fc:	mov    %rax,0x8(%rsi)
   14012d900:	mov    %r8,%rsi
   14012d903:	jmp    14012cd78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94a8>
   14012d908:	lea    0x0(%rbp,%rbp,1),%rdx
   14012d90d:	lea    0x1048(%rbx),%rcx
   14012d914:	vzeroupper
   14012d917:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d91c:	jmp    14012cdf3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9523>
   14012d921:	mov    0x1048(%rbx),%rdx
   14012d928:	lea    0x8(%rsi),%r8
   14012d92c:	cmp    0x38(%rsp),%r8
   14012d931:	jae    140135806 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f36>
   14012d937:	mov    0x1050(%rbx),%rax
   14012d93e:	vzeroupper
   14012d941:	mov    0x1c8(%rsp),%rcx
   14012d949:	mov    %rcx,(%rsi)
   14012d94c:	mov    %r8,%rsi
   14012d94f:	jmp    140126f27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3657>
   14012d954:	mov    0x1048(%rbx),%rdx
   14012d95b:	lea    0x8(%rsi),%r8
   14012d95f:	cmp    0x38(%rsp),%r8
   14012d964:	jae    140134367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a97>
   14012d96a:	mov    0x1050(%rbx),%rax
   14012d971:	vzeroupper
   14012d974:	mov    0x1c8(%rsp),%rcx
   14012d97c:	mov    %rcx,(%rsi)
   14012d97f:	mov    %r8,%rsi
   14012d982:	jmp    140126bdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x330b>
   14012d987:	mov    0x1048(%rbx),%rdx
   14012d98e:	lea    0x8(%rsi),%r8
   14012d992:	cmp    0x38(%rsp),%r8
   14012d997:	jae    140133810 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff40>
   14012d99d:	mov    0x1050(%rbx),%rax
   14012d9a4:	vzeroupper
   14012d9a7:	mov    0x1c8(%rsp),%rcx
   14012d9af:	mov    %rcx,(%rsi)
   14012d9b2:	mov    %r8,%rsi
   14012d9b5:	jmp    140127419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b49>
   14012d9ba:	mov    0x1048(%rbx),%rdx
   14012d9c1:	lea    0x8(%rsi),%r8
   14012d9c5:	cmp    0x38(%rsp),%r8
   14012d9ca:	jae    140134ca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113d2>
   14012d9d0:	mov    0x1050(%rbx),%rax
   14012d9d7:	vzeroupper
   14012d9da:	mov    0x1c8(%rsp),%rcx
   14012d9e2:	mov    %rcx,(%rsi)
   14012d9e5:	mov    %r8,%rsi
   14012d9e8:	jmp    140128b1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x524f>
   14012d9ed:	mov    0x1048(%rbx),%rdx
   14012d9f4:	lea    0x8(%rsi),%r8
   14012d9f8:	cmp    0x38(%rsp),%r8
   14012d9fd:	jae    140133e9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105cf>
   14012da03:	mov    0x1050(%rbx),%rax
   14012da0a:	vzeroupper
   14012da0d:	mov    0x1c8(%rsp),%rcx
   14012da15:	mov    %rcx,(%rsi)
   14012da18:	mov    %r8,%rsi
   14012da1b:	jmp    140126d81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34b1>
   14012da20:	mov    0x1048(%rbx),%rdx
   14012da27:	lea    0x8(%rsi),%r8
   14012da2b:	cmp    0x38(%rsp),%r8
   14012da30:	jae    140134dd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11507>
   14012da36:	mov    0x1050(%rbx),%rax
   14012da3d:	vzeroupper
   14012da40:	mov    0x1c8(%rsp),%rcx
   14012da48:	mov    %rcx,(%rsi)
   14012da4b:	mov    %r8,%rsi
   14012da4e:	jmp    1401299f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6125>
   14012da53:	mov    0x1048(%rbx),%rdx
   14012da5a:	lea    0x8(%rsi),%r8
   14012da5e:	cmp    0x38(%rsp),%r8
   14012da63:	jae    1401351dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1190c>
   14012da69:	mov    0x1050(%rbx),%rax
   14012da70:	vzeroupper
   14012da73:	mov    0x1c8(%rsp),%rcx
   14012da7b:	mov    %rcx,(%rsi)
   14012da7e:	mov    %r8,%rsi
   14012da81:	jmp    140127346 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a76>
   14012da86:	mov    0x1048(%rbx),%rdx
   14012da8d:	lea    0x8(%rsi),%r8
   14012da91:	cmp    0x38(%rsp),%r8
   14012da96:	jae    140134393 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ac3>
   14012da9c:	mov    0x1050(%rbx),%rax
   14012daa3:	vzeroupper
   14012daa6:	mov    0x1c8(%rsp),%rcx
   14012daae:	mov    %rcx,(%rsi)
   14012dab1:	mov    %r8,%rsi
   14012dab4:	jmp    140126e54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3584>
   14012dab9:	mov    0x1048(%rbx),%rdx
   14012dac0:	lea    0x8(%rsi),%r8
   14012dac4:	cmp    0x38(%rsp),%r8
   14012dac9:	jae    140135208 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11938>
   14012dacf:	mov    0x1050(%rbx),%rax
   14012dad6:	vzeroupper
   14012dad9:	mov    0x1c8(%rsp),%rcx
   14012dae1:	mov    %rcx,(%rsi)
   14012dae4:	mov    %r8,%rsi
   14012dae7:	jmp    140127273 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39a3>
   14012daec:	mov    0x1048(%rbx),%rdx
   14012daf3:	lea    0x8(%rsi),%r8
   14012daf7:	cmp    0x38(%rsp),%r8
   14012dafc:	jae    140134e03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11533>
   14012db02:	mov    0x1050(%rbx),%rax
   14012db09:	vzeroupper
   14012db0c:	mov    0x1c8(%rsp),%rcx
   14012db14:	mov    %rcx,(%rsi)
   14012db17:	mov    %r8,%rsi
   14012db1a:	jmp    140126ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x372a>
   14012db1f:	mov    0x1048(%rbx),%rdx
   14012db26:	lea    0x8(%rsi),%r8
   14012db2a:	cmp    0x38(%rsp),%r8
   14012db2f:	jae    140134d6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1149f>
   14012db35:	mov    0x1050(%rbx),%rax
   14012db3c:	vzeroupper
   14012db3f:	mov    0x1c8(%rsp),%rcx
   14012db47:	mov    %rcx,(%rsi)
   14012db4a:	mov    %r8,%rsi
   14012db4d:	jmp    140126cae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33de>
   14012db52:	mov    0x1048(%rbx),%rdx
   14012db59:	lea    0x8(%rsi),%r8
   14012db5d:	cmp    0x38(%rsp),%r8
   14012db62:	jae    14013430f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a3f>
   14012db68:	mov    0x1050(%rbx),%rax
   14012db6f:	vzeroupper
   14012db72:	mov    0x1c8(%rsp),%rcx
   14012db7a:	mov    %rcx,(%rsi)
   14012db7d:	mov    %r8,%rsi
   14012db80:	jmp    14012688f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fbf>
   14012db85:	mov    0x1048(%rbx),%rdx
   14012db8c:	lea    0x8(%rsi),%r8
   14012db90:	cmp    0x38(%rsp),%r8
   14012db95:	jae    1401346fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e2c>
   14012db9b:	mov    0x1050(%rbx),%rax
   14012dba2:	vzeroupper
   14012dba5:	mov    0x1c8(%rsp),%rcx
   14012dbad:	mov    %rcx,(%rsi)
   14012dbb0:	mov    %r8,%rsi
   14012dbb3:	jmp    14012935d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a8d>
   14012dbb8:	mov    0x1048(%rbx),%rdx
   14012dbbf:	lea    0x8(%rsi),%r8
   14012dbc3:	cmp    0x38(%rsp),%r8
   14012dbc8:	jae    140134b62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11292>
   14012dbce:	mov    0x1050(%rbx),%rax
   14012dbd5:	vzeroupper
   14012dbd8:	mov    0x1c8(%rsp),%rcx
   14012dbe0:	mov    %rcx,(%rsi)
   14012dbe3:	mov    %r8,%rsi
   14012dbe6:	jmp    1401291b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58e7>
   14012dbeb:	mov    0x1048(%rbx),%rdx
   14012dbf2:	lea    0x8(%rsi),%r8
   14012dbf6:	cmp    0x38(%rsp),%r8
   14012dbfb:	jae    1401343bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10aef>
   14012dc01:	mov    0x1050(%rbx),%rax
   14012dc08:	vzeroupper
   14012dc0b:	mov    0x1c8(%rsp),%rcx
   14012dc13:	mov    %rcx,(%rsi)
   14012dc16:	mov    %r8,%rsi
   14012dc19:	jmp    140129430 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b60>
   14012dc1e:	mov    0x1048(%rbx),%rdx
   14012dc25:	lea    0x8(%rsi),%r8
   14012dc29:	cmp    0x38(%rsp),%r8
   14012dc2e:	jae    14013433b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a6b>
   14012dc34:	mov    0x1050(%rbx),%rax
   14012dc3b:	vzeroupper
   14012dc3e:	mov    0x1c8(%rsp),%rcx
   14012dc46:	mov    %rcx,(%rsi)
   14012dc49:	mov    %r8,%rsi
   14012dc4c:	jmp    140128f3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x566e>
   14012dc51:	mov    0x1048(%rbx),%rdx
   14012dc58:	lea    0x8(%rsi),%r8
   14012dc5c:	cmp    0x38(%rsp),%r8
   14012dc61:	jae    140133de2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10512>
   14012dc67:	mov    0x1050(%rbx),%rax
   14012dc6e:	vzeroupper
   14012dc71:	mov    0x1c8(%rsp),%rcx
   14012dc79:	mov    %rcx,(%rsi)
   14012dc7c:	mov    %r8,%rsi
   14012dc7f:	jmp    140129503 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c33>
   14012dc84:	mov    0x1048(%rbx),%rdx
   14012dc8b:	lea    0x8(%rsi),%r8
   14012dc8f:	cmp    0x38(%rsp),%r8
   14012dc94:	jae    140133db6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104e6>
   14012dc9a:	mov    0x1050(%rbx),%rax
   14012dca1:	vzeroupper
   14012dca4:	mov    0x1c8(%rsp),%rcx
   14012dcac:	mov    %rcx,(%rsi)
   14012dcaf:	mov    %r8,%rsi
   14012dcb2:	jmp    14012928a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59ba>
   14012dcb7:	mov    0x1048(%rbx),%rdx
   14012dcbe:	lea    0x8(%rsi),%r8
   14012dcc2:	cmp    0x38(%rsp),%r8
   14012dcc7:	jae    140133f90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106c0>
   14012dccd:	mov    0x1050(%rbx),%rax
   14012dcd4:	vzeroupper
   14012dcd7:	mov    0x1c8(%rsp),%rcx
   14012dcdf:	mov    %rcx,(%rsi)
   14012dce2:	mov    %r8,%rsi
   14012dce5:	jmp    1401290e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5814>
   14012dcea:	mov    0x1048(%rbx),%rdx
   14012dcf1:	lea    0x8(%rsi),%r8
   14012dcf5:	cmp    0x38(%rsp),%r8
   14012dcfa:	jae    140134443 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b73>
   14012dd00:	mov    0x1050(%rbx),%rax
   14012dd07:	vzeroupper
   14012dd0a:	mov    0x1c8(%rsp),%rcx
   14012dd12:	mov    %rcx,(%rsi)
   14012dd15:	mov    %r8,%rsi
   14012dd18:	jmp    140129922 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6052>
   14012dd1d:	movzbl %dil,%eax
   14012dd21:	mov    %rsi,%rdx
   14012dd24:	movabs $0xfffd000200000000,%rcx
   14012dd2e:	shl    $0x3,%rax
   14012dd32:	sub    %rax,%rdx
   14012dd35:	movabs $0xffffffff00000000,%rax
   14012dd3f:	mov    (%rdx),%rdx
   14012dd42:	and    %rdx,%rax
   14012dd45:	cmp    %rcx,%rax
   14012dd48:	je     14012ecaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3df>
   14012dd4e:	vzeroupper
   14012dd51:	mov    0x1048(%rbx),%rdx
   14012dd58:	lea    0x8(%rsi),%r8
   14012dd5c:	cmp    0x38(%rsp),%r8
   14012dd61:	jae    1401345d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d01>
   14012dd67:	mov    0x1050(%rbx),%rax
   14012dd6e:	mov    0x1c8(%rsp),%rcx
   14012dd76:	mov    %rcx,(%rsi)
   14012dd79:	jmp    140127974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40a4>
   14012dd7e:	mov    0x1048(%rbx),%rdx
   14012dd85:	lea    0x8(%rsi),%r8
   14012dd89:	cmp    0x38(%rsp),%r8
   14012dd8e:	jae    1401336f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe21>
   14012dd94:	mov    0x1050(%rbx),%rax
   14012dd9b:	vzeroupper
   14012dd9e:	mov    0x1c8(%rsp),%rcx
   14012dda6:	mov    %rcx,(%rsi)
   14012dda9:	mov    %r8,%rsi
   14012ddac:	jmp    140129cf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6420>
   14012ddb1:	mov    0x1048(%rbx),%rdx
   14012ddb8:	lea    0x8(%rsi),%r8
   14012ddbc:	cmp    0x38(%rsp),%r8
   14012ddc1:	jae    140133a4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1017f>
   14012ddc7:	mov    0x1050(%rbx),%rax
   14012ddce:	vzeroupper
   14012ddd1:	mov    0x1c8(%rsp),%rcx
   14012ddd9:	mov    %rcx,(%rsi)
   14012dddc:	mov    %r8,%rsi
   14012dddf:	jmp    140126962 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3092>
   14012dde4:	mov    0x1048(%rbx),%rdx
   14012ddeb:	lea    0x8(%rsi),%r8
   14012ddef:	cmp    0x38(%rsp),%r8
   14012ddf4:	jae    140133abf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101ef>
   14012ddfa:	mov    0x1050(%rbx),%rax
   14012de01:	vzeroupper
   14012de04:	mov    0x1c8(%rsp),%rcx
   14012de0c:	mov    %rcx,(%rsi)
   14012de0f:	mov    %r8,%rsi
   14012de12:	jmp    140129011 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5741>
   14012de17:	mov    0x1048(%rbx),%rdx
   14012de1e:	lea    0x8(%rsi),%r8
   14012de22:	cmp    0x38(%rsp),%r8
   14012de27:	jae    140133ff4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10724>
   14012de2d:	mov    0x1050(%rbx),%rax
   14012de34:	vzeroupper
   14012de37:	mov    0x1c8(%rsp),%rcx
   14012de3f:	mov    %rcx,(%rsi)
   14012de42:	mov    %r8,%rsi
   14012de45:	jmp    14012984f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f7f>
   14012de4a:	mov    0x1048(%rbx),%rdx
   14012de51:	lea    0x8(%rsi),%r8
   14012de55:	cmp    0x38(%rsp),%r8
   14012de5a:	jae    1401347fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f2b>
   14012de60:	mov    0x1050(%rbx),%rax
   14012de67:	vzeroupper
   14012de6a:	mov    0x1c8(%rsp),%rcx
   14012de72:	mov    %rcx,(%rsi)
   14012de75:	mov    %r8,%rsi
   14012de78:	jmp    140129c1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x634d>
   14012de7d:	movb   $0xcc,-0x1(%rbp)
   14012de81:	mov    %r11,%rcx
   14012de84:	vzeroupper
   14012de87:	call   14021bc80 <setun::VMValue::as_float() const>
   14012de8c:	mov    0x60(%rsp),%rcx
   14012de91:	vmovapd %xmm0,%xmm7
   14012de95:	call   14021bc80 <setun::VMValue::as_float() const>
   14012de9a:	mov    0x40(%rsp),%rcx
   14012de9f:	vmovapd %xmm0,%xmm6
   14012dea3:	call   14021bc80 <setun::VMValue::as_float() const>
   14012dea8:	movabs $0xfffc000000000000,%rax
   14012deb2:	vfmadd132sd %xmm6,%xmm0,%xmm7
   14012deb7:	vucomisd %xmm7,%xmm7
   14012debb:	vmovq  %xmm7,%rdx
   14012dec0:	cmovnp %rdx,%rax
   14012dec4:	mov    0x1068(%rbx),%rdx
   14012decb:	mov    %rax,(%rdx,%rdi,8)
   14012decf:	jmp    14012ca10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9140>
   14012ded4:	mov    0x1c8(%rsp),%rcx
   14012dedc:	add    $0x8,%rsi
   14012dee0:	xor    %r12d,%r12d
   14012dee3:	mov    %rcx,(%rdx,%r13,8)
   14012dee7:	mov    0x1d0(%rsp),%rdx
   14012deef:	mov    %rdx,-0x8(%rsi)
   14012def3:	jmp    140126669 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d99>
   14012def8:	mov    0x1048(%rbx),%rdx
   14012deff:	lea    0x8(%rsi),%r8
   14012df03:	cmp    0x38(%rsp),%r8
   14012df08:	jae    140135bea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1231a>
   14012df0e:	mov    0x1050(%rbx),%rax
   14012df15:	vzeroupper
   14012df18:	mov    0x1c8(%rsp),%rcx
   14012df20:	mov    %rcx,(%rsi)
   14012df23:	mov    %r8,%rsi
   14012df26:	jmp    1401274ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c1c>
   14012df2b:	mov    0x1048(%rbx),%rdx
   14012df32:	lea    0x8(%rsi),%r8
   14012df36:	cmp    0x38(%rsp),%r8
   14012df3b:	jae    140135a25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12155>
   14012df41:	mov    0x1050(%rbx),%rax
   14012df48:	vzeroupper
   14012df4b:	mov    0x1c8(%rsp),%rcx
   14012df53:	mov    %rcx,(%rsi)
   14012df56:	mov    %r8,%rsi
   14012df59:	jmp    140128cc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53f5>
   14012df5e:	mov    0x1048(%rbx),%rdx
   14012df65:	lea    0x8(%rsi),%r8
   14012df69:	cmp    0x38(%rsp),%r8
   14012df6e:	jae    14013446f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b9f>
   14012df74:	mov    0x1050(%rbx),%rax
   14012df7b:	vzeroupper
   14012df7e:	mov    0x1c8(%rsp),%rcx
   14012df86:	mov    %rcx,(%rsi)
   14012df89:	mov    %r8,%rsi
   14012df8c:	jmp    1401296a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dd9>
   14012df91:	lea    0x8(%rsi),%r8
   14012df95:	cmp    0x38(%rsp),%r8
   14012df9a:	jae    14013371d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe4d>
   14012dfa0:	mov    0x1c8(%rsp),%rdx
   14012dfa8:	xor    %r12d,%r12d
   14012dfab:	mov    %rdx,(%rsi)
   14012dfae:	mov    %r8,%rsi
   14012dfb1:	jmp    140126537 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c67>
   14012dfb6:	mov    0x1048(%rbx),%rdx
   14012dfbd:	lea    0x8(%rsi),%r8
   14012dfc1:	cmp    0x38(%rsp),%r8
   14012dfc6:	jae    140133f33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10663>
   14012dfcc:	mov    0x1050(%rbx),%rax
   14012dfd3:	vzeroupper
   14012dfd6:	mov    0x1c8(%rsp),%rcx
   14012dfde:	mov    %rcx,(%rsi)
   14012dfe1:	mov    %r8,%rsi
   14012dfe4:	jmp    140126b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3238>
   14012dfe9:	mov    0x1048(%rbx),%rdx
   14012dff0:	lea    0x8(%rsi),%r8
   14012dff4:	cmp    0x38(%rsp),%r8
   14012dff9:	jae    140135b91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122c1>
   14012dfff:	mov    0x1050(%rbx),%rax
   14012e006:	vzeroupper
   14012e009:	mov    0x1c8(%rsp),%rcx
   14012e011:	mov    %rcx,(%rsi)
   14012e014:	mov    %r8,%rsi
   14012e017:	jmp    1401271a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38d0>
   14012e01c:	mov    0x1048(%rbx),%rdx
   14012e023:	lea    0x8(%rsi),%r8
   14012e027:	cmp    0x38(%rsp),%r8
   14012e02c:	jae    1401359cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120fc>
   14012e032:	mov    0x1050(%rbx),%rax
   14012e039:	vzeroupper
   14012e03c:	mov    0x1c8(%rsp),%rcx
   14012e044:	mov    %rcx,(%rsi)
   14012e047:	mov    %r8,%rsi
   14012e04a:	jmp    1401295d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d06>
   14012e04f:	mov    0x1048(%rbx),%rdx
   14012e056:	lea    0x8(%rsi),%r8
   14012e05a:	cmp    0x38(%rsp),%r8
   14012e05f:	jae    1401336c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdf5>
   14012e065:	mov    0x1050(%rbx),%rax
   14012e06c:	vzeroupper
   14012e06f:	mov    0x1c8(%rsp),%rcx
   14012e077:	mov    %rcx,(%rsi)
   14012e07a:	mov    %r8,%rsi
   14012e07d:	jmp    140128bf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5322>
   14012e082:	mov    0x1048(%rbx),%rdx
   14012e089:	lea    0x8(%rsi),%r8
   14012e08d:	cmp    0x38(%rsp),%r8
   14012e092:	jae    14013461f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d4f>
   14012e098:	mov    0x1050(%rbx),%rax
   14012e09f:	vzeroupper
   14012e0a2:	mov    0x1c8(%rsp),%rcx
   14012e0aa:	mov    %rcx,(%rsi)
   14012e0ad:	mov    %r8,%rsi
   14012e0b0:	jmp    140126a35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3165>
   14012e0b5:	mov    0x1048(%rbx),%rdx
   14012e0bc:	lea    0x8(%rsi),%r8
   14012e0c0:	cmp    0x38(%rsp),%r8
   14012e0c5:	jae    140135540 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c70>
   14012e0cb:	mov    0x1050(%rbx),%rax
   14012e0d2:	mov    0x1c8(%rsp),%rcx
   14012e0da:	mov    %rcx,(%rsi)
   14012e0dd:	mov    %r8,%rsi
   14012e0e0:	jmp    140129b4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x627d>
   14012e0e5:	mov    0x1048(%rbx),%rdx
   14012e0ec:	lea    0x8(%rsi),%r8
   14012e0f0:	cmp    0x38(%rsp),%r8
   14012e0f5:	jae    140135591 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cc1>
   14012e0fb:	mov    0x1050(%rbx),%rax
   14012e102:	vzeroupper
   14012e105:	mov    0x1c8(%rsp),%rcx
   14012e10d:	mov    %rcx,(%rsi)
   14012e110:	mov    %r8,%rsi
   14012e113:	jmp    1401267bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eec>
   14012e118:	mov    0x1048(%rbx),%rdx
   14012e11f:	lea    0x8(%rsi),%r8
   14012e123:	cmp    0x38(%rsp),%r8
   14012e128:	jae    140134020 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10750>
   14012e12e:	mov    0x1050(%rbx),%rax
   14012e135:	vzeroupper
   14012e138:	mov    0x1c8(%rsp),%rcx
   14012e140:	mov    %rcx,(%rsi)
   14012e143:	mov    %r8,%rsi
   14012e146:	jmp    140128d98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54c8>
   14012e14b:	mov    0x1048(%rbx),%rdx
   14012e152:	lea    0x8(%rsi),%r8
   14012e156:	cmp    0x38(%rsp),%r8
   14012e15b:	jae    1401346a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dd3>
   14012e161:	mov    0x1050(%rbx),%rax
   14012e168:	vzeroupper
   14012e16b:	mov    0x1c8(%rsp),%rcx
   14012e173:	mov    %rcx,(%rsi)
   14012e176:	mov    %r8,%rsi
   14012e179:	jmp    14012977c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5eac>
   14012e17e:	mov    0x1048(%rbx),%rdx
   14012e185:	lea    0x8(%rsi),%r8
   14012e189:	cmp    0x38(%rsp),%r8
   14012e18e:	jae    140135aaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121da>
   14012e194:	mov    0x1050(%rbx),%rax
   14012e19b:	vzeroupper
   14012e19e:	mov    0x1c8(%rsp),%rcx
   14012e1a6:	mov    %rcx,(%rsi)
   14012e1a9:	mov    %r8,%rsi
   14012e1ac:	jmp    1401270cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37fd>
   14012e1b1:	mov    0x1048(%rbx),%rdx
   14012e1b8:	lea    0x8(%rsi),%r8
   14012e1bc:	cmp    0x38(%rsp),%r8
   14012e1c1:	jae    140135caf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123df>
   14012e1c7:	mov    0x1050(%rbx),%rax
   14012e1ce:	vzeroupper
   14012e1d1:	mov    0x1c8(%rsp),%rcx
   14012e1d9:	mov    %rcx,(%rsi)
   14012e1dc:	mov    %r8,%rsi
   14012e1df:	jmp    140128a4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x517c>
   14012e1e4:	mov    0x1048(%rbx),%rdx
   14012e1eb:	lea    0x8(%rsi),%r8
   14012e1ef:	cmp    0x38(%rsp),%r8
   14012e1f4:	jae    1401339e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10114>
   14012e1fa:	mov    0x1050(%rbx),%rax
   14012e201:	vzeroupper
   14012e204:	mov    0x1c8(%rsp),%rcx
   14012e20c:	mov    %rcx,(%rsi)
   14012e20f:	mov    %r8,%rsi
   14012e212:	jmp    140128e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x559b>
   14012e217:	vzeroupper
   14012e21a:	mov    0x1048(%rbx),%rdx
   14012e221:	cmp    $0x2,%r12b
   14012e225:	jne    14012a2c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f6>
   14012e22b:	jmp    1401244cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   14012e230:	mov    %rcx,%r10
   14012e233:	shr    $0x20,%r10
   14012e237:	cmp    $0x5,%r10w
   14012e23c:	jne    14012b24a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x797a>
   14012e242:	and    %rax,%rdx
   14012e245:	cmp    %r9,%rdx
   14012e248:	je     140125e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e24e:	cmp    %r8,%rdx
   14012e251:	jne    14012b24a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x797a>
   14012e257:	mov    %rax,%r8
   14012e25a:	shr    $0x20,%r8
   14012e25e:	cmp    $0x5,%r8w
   14012e263:	je     140125e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e269:	movabs $0xffffffff00000000,%r8
   14012e273:	and    %r8,%rcx
   14012e276:	cmp    %rdx,%rcx
   14012e279:	je     1401309f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd127>
   14012e27f:	shr    $0x20,%rax
   14012e283:	mov    %eax,%edx
   14012e285:	test   %ax,%ax
   14012e288:	je     1401309f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd127>
   14012e28e:	movabs $0xfffd000100000000,%rax
   14012e298:	cmp    %rax,%rcx
   14012e29b:	je     14012b2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79e9>
   14012e2a1:	cmp    $0x1,%dx
   14012e2a5:	jne    140125e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e2ab:	jmp    14012b2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79e9>
   14012e2b0:	vzeroupper
   14012e2b3:	mov    0x60(%rsp),%rbp
   14012e2b8:	mov    0x1048(%rbx),%rdx
   14012e2bf:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e2c4:	mov    %rcx,%r10
   14012e2c7:	shr    $0x20,%r10
   14012e2cb:	cmp    $0x5,%r10w
   14012e2d0:	jne    14012aeed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x761d>
   14012e2d6:	and    %rax,%rdx
   14012e2d9:	cmp    %r9,%rdx
   14012e2dc:	je     140125f74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e2e2:	cmp    %r8,%rdx
   14012e2e5:	jne    14012aeed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x761d>
   14012e2eb:	mov    %rax,%r8
   14012e2ee:	shr    $0x20,%r8
   14012e2f2:	cmp    $0x5,%r8w
   14012e2f7:	je     140125f74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e2fd:	movabs $0xffffffff00000000,%r8
   14012e307:	and    %r8,%rcx
   14012e30a:	cmp    %rdx,%rcx
   14012e30d:	je     140130c8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3bb>
   14012e313:	shr    $0x20,%rax
   14012e317:	mov    %eax,%edx
   14012e319:	test   %ax,%ax
   14012e31c:	je     140130c8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3bb>
   14012e322:	movabs $0xfffd000100000000,%rax
   14012e32c:	cmp    %rax,%rcx
   14012e32f:	je     14012af5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x768c>
   14012e335:	cmp    $0x1,%dx
   14012e339:	jne    140125f74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e33f:	jmp    14012af5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x768c>
   14012e344:	nopl   0x0(%rax)
   14012e348:	mov    %rcx,%r10
   14012e34b:	shr    $0x20,%r10
   14012e34f:	cmp    $0x5,%r10w
   14012e354:	jne    14012bb57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8287>
   14012e35a:	and    %rax,%rdx
   14012e35d:	cmp    %r9,%rdx
   14012e360:	je     140125d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e366:	cmp    %r8,%rdx
   14012e369:	jne    14012bb57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8287>
   14012e36f:	mov    %rax,%r8
   14012e372:	shr    $0x20,%r8
   14012e376:	cmp    $0x5,%r8w
   14012e37b:	je     140125d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e381:	movabs $0xffffffff00000000,%r8
   14012e38b:	and    %r8,%rcx
   14012e38e:	cmp    %rdx,%rcx
   14012e391:	je     140130e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd557>
   14012e397:	shr    $0x20,%rax
   14012e39b:	mov    %eax,%edx
   14012e39d:	test   %ax,%ax
   14012e3a0:	je     140130e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd557>
   14012e3a6:	movabs $0xfffd000100000000,%rax
   14012e3b0:	cmp    %rax,%rcx
   14012e3b3:	je     14012bbc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82f6>
   14012e3b9:	cmp    $0x1,%dx
   14012e3bd:	jne    140125d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e3c3:	jmp    14012bbc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82f6>
   14012e3c8:	nopl   0x0(%rax,%rax,1)
   14012e3d0:	mov    %rcx,%r10
   14012e3d3:	shr    $0x20,%r10
   14012e3d7:	cmp    $0x5,%r10w
   14012e3dc:	jne    14012a6b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6de0>
   14012e3e2:	and    %rdx,%rax
   14012e3e5:	cmp    %r9,%rax
   14012e3e8:	je     140125987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e3ee:	cmp    %r8,%rax
   14012e3f1:	jne    14012a6b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6de0>
   14012e3f7:	mov    %rdx,%r8
   14012e3fa:	shr    $0x20,%r8
   14012e3fe:	cmp    $0x5,%r8w
   14012e403:	je     140125987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e409:	movabs $0xffffffff00000000,%r8
   14012e413:	and    %r8,%rcx
   14012e416:	cmp    %rax,%rcx
   14012e419:	je     140130b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2c3>
   14012e41f:	shr    $0x20,%rdx
   14012e423:	mov    %edx,%eax
   14012e425:	test   %dx,%dx
   14012e428:	je     140130b93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2c3>
   14012e42e:	movabs $0xfffd000100000000,%rdx
   14012e438:	cmp    %rdx,%rcx
   14012e43b:	je     14012a71f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e4f>
   14012e441:	cmp    $0x1,%ax
   14012e445:	jne    140125987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e44b:	jmp    14012a71f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e4f>
   14012e450:	mov    %rcx,%r10
   14012e453:	shr    $0x20,%r10
   14012e457:	cmp    $0x5,%r10w
   14012e45c:	jne    14012a8f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7029>
   14012e462:	and    %rax,%rdx
   14012e465:	cmp    %r9,%rdx
   14012e468:	je     140125be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e46e:	cmp    %r8,%rdx
   14012e471:	jne    14012a8f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7029>
   14012e477:	mov    %rax,%r8
   14012e47a:	shr    $0x20,%r8
   14012e47e:	cmp    $0x5,%r8w
   14012e483:	je     140125be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e489:	movabs $0xffffffff00000000,%r8
   14012e493:	and    %r8,%rcx
   14012e496:	cmp    %rdx,%rcx
   14012e499:	je     140131000 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd730>
   14012e49f:	shr    $0x20,%rax
   14012e4a3:	mov    %eax,%edx
   14012e4a5:	test   %ax,%ax
   14012e4a8:	je     140131000 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd730>
   14012e4ae:	movabs $0xfffd000100000000,%rax
   14012e4b8:	cmp    %rax,%rcx
   14012e4bb:	je     14012a968 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7098>
   14012e4c1:	cmp    $0x1,%dx
   14012e4c5:	jne    140125be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e4cb:	jmp    14012a968 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7098>
   14012e4d0:	mov    %rax,%rbp
   14012e4d3:	vzeroupper
   14012e4d6:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e4db:	test   %r12b,%r12b
   14012e4de:	je     1401289ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x511d>
   14012e4e4:	cmp    $0x1,%r12b
   14012e4e8:	je     14012cb4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x927f>
   14012e4ee:	lea    0x8(%rsi),%r8
   14012e4f2:	cmp    0x38(%rsp),%r8
   14012e4f7:	jae    14013464b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d7b>
   14012e4fd:	mov    0x1d0(%rsp),%rax
   14012e505:	mov    $0x2,%r12d
   14012e50b:	mov    %rax,(%rsi)
   14012e50e:	mov    0x1c8(%rsp),%rax
   14012e516:	mov    %r8,%rsi
   14012e519:	mov    %rax,0x1d0(%rsp)
   14012e521:	jmp    1401289f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5123>
   14012e526:	mov    0xb0(%r14),%rdx
   14012e52d:	jmp    14012cc9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93cd>
   14012e532:	mov    0x1048(%rbx),%rdx
   14012e539:	mov    %rdi,%rbp
   14012e53c:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e541:	mov    0x1048(%rbx),%rdx
   14012e548:	vzeroupper
   14012e54b:	jmp    14012a277 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012e550:	mov    0x1c8(%rsp),%rdx
   14012e558:	mov    $0x2,%r12d
   14012e55e:	mov    %rdx,0x1d0(%rsp)
   14012e566:	mov    0x1068(%rbx),%rdx
   14012e56d:	mov    (%rdx,%rax,8),%rax
   14012e571:	mov    %rax,0x1c8(%rsp)
   14012e579:	jmp    140124e9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cf>
   14012e57e:	mov    0x1c8(%rsp),%rax
   14012e586:	mov    $0x2,%r12d
   14012e58c:	mov    %rax,0x1d0(%rsp)
   14012e594:	mov    0x1068(%rbx),%rax
   14012e59b:	mov    0x18(%rax,%r13,8),%rax
   14012e5a0:	mov    %rax,0x1c8(%rsp)
   14012e5a8:	jmp    14012a209 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6939>
   14012e5ad:	mov    0x1c8(%rsp),%rax
   14012e5b5:	mov    $0x2,%r12d
   14012e5bb:	mov    %rax,0x1d0(%rsp)
   14012e5c3:	mov    0x1068(%rbx),%rax
   14012e5ca:	mov    0x10(%rax,%r13,8),%rax
   14012e5cf:	mov    %rax,0x1c8(%rsp)
   14012e5d7:	jmp    14012a193 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68c3>
   14012e5dc:	mov    0x1c8(%rsp),%rax
   14012e5e4:	mov    $0x2,%r12d
   14012e5ea:	mov    %rax,0x1d0(%rsp)
   14012e5f2:	mov    0x1068(%rbx),%rax
   14012e5f9:	mov    0x8(%rax,%r13,8),%rax
   14012e5fe:	mov    %rax,0x1c8(%rsp)
   14012e606:	jmp    14012a11d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x684d>
   14012e60b:	mov    0x1c8(%rsp),%rax
   14012e613:	mov    $0x2,%r12d
   14012e619:	mov    %rax,0x1d0(%rsp)
   14012e621:	mov    0x1068(%rbx),%rax
   14012e628:	mov    (%rax,%r13,8),%rax
   14012e62c:	mov    %rax,0x1c8(%rsp)
   14012e634:	jmp    14012a0a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67d7>
   14012e639:	mov    0x1c8(%rsp),%rdx
   14012e641:	test   %al,%al
   14012e643:	mov    $0x2,%r12d
   14012e649:	movabs $0xfffa000000000001,%rax
   14012e653:	mov    %rdx,0x1d0(%rsp)
   14012e65b:	movabs $0xfffa000000000000,%rdx
   14012e665:	cmovne %rax,%rdx
   14012e669:	jmp    140124d6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b>
   14012e66e:	cmp    $0x1,%r12b
   14012e672:	je     14012dd1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa44d>
   14012e678:	movzbl %dil,%edx
   14012e67c:	mov    $0x1,%eax
   14012e681:	sub    %rdx,%rax
   14012e684:	mov    (%rsi,%rax,8),%rdx
   14012e688:	jmp    14012792c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x405c>
   14012e68d:	lea    0x1d0(%rsp),%rax
   14012e695:	cmp    $0x2,%r12b
   14012e699:	je     14012e6ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaddb>
   14012e69b:	lea    -0x8(%rsi),%rdx
   14012e69f:	lea    -0x10(%rsi),%rax
   14012e6a3:	cmp    $0x1,%r12b
   14012e6a7:	cmove  %rdx,%rax
   14012e6ab:	mov    (%rax),%rdx
   14012e6ae:	jmp    14012792c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x405c>
   14012e6b3:	vmovq  %rax,%xmm0
   14012e6b8:	mov    0x1c8(%rsp),%rdx
   14012e6c0:	mov    $0x2,%r12d
   14012e6c6:	vucomisd %xmm0,%xmm0
   14012e6ca:	mov    %rdx,0x1d0(%rsp)
   14012e6d2:	movabs $0xfffc000000000000,%rdx
   14012e6dc:	cmovp  %rdx,%rax
   14012e6e0:	jmp    140124d10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1440>
   14012e6e5:	mov    0x1c8(%rsp),%rdx
   14012e6ed:	mov    $0x2,%r12d
   14012e6f3:	mov    %rdx,0x1d0(%rsp)
   14012e6fb:	mov    0x1080(%rbx),%rdx
   14012e702:	mov    (%rdx,%rax,8),%rax
   14012e706:	mov    %rax,0x1c8(%rsp)
   14012e70e:	jmp    140124fad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16dd>
   14012e713:	mov    0x1c8(%rsp),%rax
   14012e71b:	mov    %rax,0x1d0(%rsp)
   14012e723:	mov    0x60(%rsp),%rax
   14012e728:	mov    %rax,0x680(%rsp)
   14012e730:	lock addl $0x1,0x8(%rdi)
   14012e735:	lea    0x680(%rsp),%rdx
   14012e73d:	lea    0x540(%rsp),%rcx
   14012e745:	mov    %rdi,0x688(%rsp)
   14012e74d:	call   14020ee00 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012e752:	jmp    14012ceef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x961f>
   14012e757:	mov    0x1c8(%rsp),%rax
   14012e75f:	mov    $0x2,%r12d
   14012e765:	mov    %rax,0x1d0(%rsp)
   14012e76d:	jmp    140124e04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534>
   14012e772:	mov    0x1c8(%rsp),%rdx
   14012e77a:	mov    $0x2,%r12d
   14012e780:	mov    %rdx,0x1d0(%rsp)
   14012e788:	movabs $0xfff9000000000000,%rdx
   14012e792:	or     %rdx,%rax
   14012e795:	jmp    140124be2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1312>
   14012e79a:	sub    $0x1,%r12b
   14012e79e:	jne    14012cd71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94a1>
   14012e7a4:	mov    0x1048(%rbx),%rdx
   14012e7ab:	lea    0x8(%rsi),%r8
   14012e7af:	cmp    0x38(%rsp),%r8
   14012e7b4:	jae    140133c0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1033f>
   14012e7ba:	mov    0x1c8(%rsp),%rax
   14012e7c2:	mov    %rax,(%rsi)
   14012e7c5:	mov    %r8,%rsi
   14012e7c8:	jmp    14012cd78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94a8>
   14012e7cd:	cmp    %rax,%rdi
   14012e7d0:	jle    140131732 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde62>
   14012e7d6:	test   %rdi,%rdi
   14012e7d9:	setne  %al
   14012e7dc:	movabs $0xfffa000000000000,%rdx
   14012e7e6:	movzbl %al,%eax
   14012e7e9:	add    %rdx,%rax
   14012e7ec:	mov    %rax,0x1c8(%rsp)
   14012e7f4:	jmp    140125896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   14012e7f9:	mov    0x1c8(%rsp),%rax
   14012e801:	mov    %edi,0x690(%rsp)
   14012e808:	lea    0x1a0(%rsp),%rdx
   14012e810:	lea    0x540(%rsp),%rcx
   14012e818:	vmovdqa %xmm0,0x680(%rsp)
   14012e821:	mov    $0x2,%r12d
   14012e827:	mov    %rax,0x1d0(%rsp)
   14012e82f:	movl   $0x0,0x694(%rsp)
   14012e83a:	mov    0x690(%rsp),%rax
   14012e842:	vmovdqa %xmm0,0x1a0(%rsp)
   14012e84b:	mov    %rax,0x1b0(%rsp)
   14012e853:	vzeroupper
   14012e856:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012e85b:	mov    0x540(%rsp),%rax
   14012e863:	mov    %rax,0x1c8(%rsp)
   14012e86b:	jmp    140124cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0>
   14012e870:	mov    0x1c8(%rsp),%rax
   14012e878:	mov    %rdi,%rdx
   14012e87b:	lea    0x680(%rsp),%rcx
   14012e883:	mov    $0x2,%r12d
   14012e889:	mov    %rax,0x1d0(%rsp)
   14012e891:	vzeroupper
   14012e894:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012e899:	mov    0x680(%rsp),%rax
   14012e8a1:	mov    %rax,0x1c8(%rsp)
   14012e8a9:	jmp    140124b68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1298>
   14012e8ae:	cmp    %rax,%rdi
   14012e8b1:	jge    140131ac4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1f4>
   14012e8b7:	test   %rdi,%rdi
   14012e8ba:	setne  %al
   14012e8bd:	movabs $0xfffa000000000000,%rdx
   14012e8c7:	movzbl %al,%eax
   14012e8ca:	add    %rdx,%rax
   14012e8cd:	mov    %rax,0x1c8(%rsp)
   14012e8d5:	jmp    140125775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   14012e8da:	mov    0x348(%rsp),%rax
   14012e8e2:	and    %rdx,%rax
   14012e8e5:	mov    %rax,0x40(%rsp)
   14012e8ea:	mov    %rax,%rcx
   14012e8ed:	movabs $0xfff8000000000000,%rax
   14012e8f7:	cmp    %rax,%rcx
   14012e8fa:	jne    14012eb10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb240>
   14012e900:	lea    0x350(%rsp),%r11
   14012e908:	mov    %rdi,0x350(%rsp)
   14012e910:	mov    %r11,0x60(%rsp)
   14012e915:	mov    %r11,%rcx
   14012e918:	vzeroupper
   14012e91b:	call   14021b9a0 <setun::VMValue::payload() const>
   14012e920:	mov    0x60(%rsp),%r11
   14012e925:	mov    0x58(%rax),%r10
   14012e929:	test   %r10,%r10
   14012e92c:	je     14012eb1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb24b>
   14012e932:	mov    0x348(%rsp),%r9
   14012e93a:	shl    $0x10,%r9
   14012e93e:	sar    $0x10,%r9
   14012e942:	js     14012eb1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb24b>
   14012e948:	mov    %r10,%rcx
   14012e94b:	mov    %r11,0x80(%rsp)
   14012e953:	mov    %r9,0xa0(%rsp)
   14012e95b:	mov    %r10,0x60(%rsp)
   14012e960:	call   140146e40 <setun::ArrayObject::size() const>
   14012e965:	mov    0xa0(%rsp),%r9
   14012e96d:	mov    0x80(%rsp),%r11
   14012e975:	cmp    %rax,%r9
   14012e978:	jae    14012eb1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb24b>
   14012e97e:	mov    0x60(%rsp),%r10
   14012e983:	movzbl (%r10),%eax
   14012e987:	cmp    $0x3,%al
   14012e989:	je     140134206 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10936>
   14012e98f:	ja     140134176 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108a6>
   14012e995:	movabs $0xffff000000000000,%rdx
   14012e99f:	cmp    $0x1,%al
   14012e9a1:	je     14013412e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1085e>
   14012e9a7:	cmp    $0x2,%al
   14012e9a9:	jne    1401340fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1082c>
   14012e9af:	mov    0x340(%rsp),%rax
   14012e9b7:	mov    $0xffff,%edx
   14012e9bc:	mov    $0x1fff,%ecx
   14012e9c1:	shl    $0x30,%rdx
   14012e9c5:	shl    $0x33,%rcx
   14012e9c9:	and    %rax,%rdx
   14012e9cc:	cmp    %rcx,%rdx
   14012e9cf:	je     140137a7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141ab>
   14012e9d5:	lea    0x340(%rsp),%r8
   14012e9dd:	mov    %r9,%rdx
   14012e9e0:	mov    %r10,%rcx
   14012e9e3:	call   14014a420 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012e9e8:	cmpb   $0x0,0x1040(%rbx)
   14012e9ef:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   14012e9f5:	movzbl 0x0(%rbp),%eax
   14012e9f9:	lea    0x2916a0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ea00:	add    $0x1,%rbp
   14012ea04:	mov    (%rdi,%rax,8),%rax
   14012ea08:	jmp    *%rax
   14012ea0a:	shl    $0x10,%rax
   14012ea0e:	shl    $0x10,%rcx
   14012ea12:	movabs $0xfffa000000000000,%rdx
   14012ea1c:	cmp    %rcx,%rax
   14012ea1f:	movabs $0xfffa000000000001,%rax
   14012ea29:	cmovge %rax,%rdx
   14012ea2d:	mov    %rdx,0x1c8(%rsp)
   14012ea35:	lea    -0x1(%rbp),%rdx
   14012ea39:	cmpb   $0x0,0x1520f(%rbx)
   14012ea40:	je     14012ea6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb19f>
   14012ea42:	mov    0xe8(%r14),%rax
   14012ea49:	mov    0xf0(%r14),%rcx
   14012ea50:	sub    %r15,%rdx
   14012ea53:	sub    %rax,%rcx
   14012ea56:	cmp    %rcx,%rdx
   14012ea59:	jae    14012ea6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb19f>
   14012ea5b:	add    %rdx,%rax
   14012ea5e:	movzbl (%rax),%edi
   14012ea61:	lea    0x1(%rdi),%edx
   14012ea64:	mov    %dl,(%rax)
   14012ea66:	cmp    $0x7,%dl
   14012ea69:	jbe    14012ea6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb19f>
   14012ea6b:	movb   $0xc0,-0x1(%rbp)
   14012ea6f:	cmpb   $0x0,0x1040(%rbx)
   14012ea76:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012ea7c:	movzbl 0x0(%rbp),%eax
   14012ea80:	lea    0x291619(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ea87:	add    $0x1,%rbp
   14012ea8b:	mov    (%rdi,%rax,8),%rax
   14012ea8f:	jmp    *%rax
   14012ea91:	movabs $0xfffa000000000000,%rax
   14012ea9b:	cmp    %rcx,%rdx
   14012ea9e:	movabs $0xfffa000000000001,%rdx
   14012eaa8:	cmove  %rdx,%rax
   14012eaac:	lea    -0x1(%rbp),%rdx
   14012eab0:	mov    %rax,0x1c8(%rsp)
   14012eab8:	cmpb   $0x0,0x1520f(%rbx)
   14012eabf:	je     14012eaee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb21e>
   14012eac1:	mov    0xe8(%r14),%rax
   14012eac8:	mov    0xf0(%r14),%rcx
   14012eacf:	sub    %r15,%rdx
   14012ead2:	sub    %rax,%rcx
   14012ead5:	cmp    %rcx,%rdx
   14012ead8:	jae    14012eaee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb21e>
   14012eada:	add    %rdx,%rax
   14012eadd:	movzbl (%rax),%edi
   14012eae0:	lea    0x1(%rdi),%edx
   14012eae3:	mov    %dl,(%rax)
   14012eae5:	cmp    $0x7,%dl
   14012eae8:	jbe    14012eaee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb21e>
   14012eaea:	movb   $0xc1,-0x1(%rbp)
   14012eaee:	cmpb   $0x0,0x1040(%rbx)
   14012eaf5:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012eafb:	movzbl 0x0(%rbp),%eax
   14012eaff:	lea    0x29159a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012eb06:	add    $0x1,%rbp
   14012eb0a:	mov    (%rdi,%rax,8),%rax
   14012eb0e:	jmp    *%rax
   14012eb10:	lea    0x350(%rsp),%r11
   14012eb18:	vzeroupper
   14012eb1b:	mov    %r11,%rcx
   14012eb1e:	mov    %rdi,0x350(%rsp)
   14012eb26:	call   14021b9a0 <setun::VMValue::payload() const>
   14012eb2b:	mov    0x58(%rax),%rdi
   14012eb2f:	test   %rdi,%rdi
   14012eb32:	je     140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012eb38:	lea    0x348(%rsp),%rcx
   14012eb40:	call   14021a530 <setun::VMValue::as_int() const>
   14012eb45:	mov    %rax,%rdx
   14012eb48:	test   %rax,%rax
   14012eb4b:	js     140135751 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e81>
   14012eb51:	mov    %rdi,%rcx
   14012eb54:	mov    %rdx,0x40(%rsp)
   14012eb59:	call   140146e40 <setun::ArrayObject::size() const>
   14012eb5e:	mov    0x40(%rsp),%rdx
   14012eb63:	cmp    %rax,%rdx
   14012eb66:	jae    140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012eb6c:	lea    0x340(%rsp),%r8
   14012eb74:	mov    %rdi,%rcx
   14012eb77:	call   14014a420 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012eb7c:	jmp    140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   14012eb81:	lea    0x330(%rsp),%rcx
   14012eb89:	vzeroupper
   14012eb8c:	call   14021b9a0 <setun::VMValue::payload() const>
   14012eb91:	mov    0x58(%rax),%rdi
   14012eb95:	test   %rdi,%rdi
   14012eb98:	je     14012ebaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2da>
   14012eb9a:	mov    %rdi,%rcx
   14012eb9d:	call   140146f20 <setun::ArrayObject::empty() const>
   14012eba2:	test   %al,%al
   14012eba4:	je     140133b18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10248>
   14012ebaa:	test   %r12b,%r12b
   14012ebad:	je     14012d174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98a4>
   14012ebb3:	cmp    $0x1,%r12b
   14012ebb7:	je     14012f3e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb17>
   14012ebbd:	lea    0x8(%rsi),%r8
   14012ebc1:	cmp    0x38(%rsp),%r8
   14012ebc6:	jb     140127eb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e2>
   14012ebcc:	mov    0x1050(%rbx),%rax
   14012ebd3:	mov    0x1048(%rbx),%rdx
   14012ebda:	mov    %rax,0x38(%rsp)
   14012ebdf:	sub    %rdx,%rax
   14012ebe2:	sar    $0x3,%rax
   14012ebe6:	lea    (%rax,%rax,1),%rcx
   14012ebea:	cmp    %rcx,%rax
   14012ebed:	jae    140127eb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e2>
   14012ebf3:	sub    %rdx,%rsi
   14012ebf6:	mov    %rcx,%rdx
   14012ebf9:	lea    0x1048(%rbx),%rcx
   14012ec00:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ec05:	mov    0x1050(%rbx),%rax
   14012ec0c:	add    0x1048(%rbx),%rsi
   14012ec13:	lea    0x8(%rsi),%r8
   14012ec17:	mov    %rax,0x38(%rsp)
   14012ec1c:	jmp    140127eb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e2>
   14012ec21:	nopl   0x0(%rax)
   14012ec28:	shl    $0x10,%rax
   14012ec2c:	shl    $0x10,%rcx
   14012ec30:	movabs $0xfffa000000000000,%rdx
   14012ec3a:	cmp    %rcx,%rax
   14012ec3d:	movabs $0xfffa000000000001,%rax
   14012ec47:	cmovle %rax,%rdx
   14012ec4b:	mov    %rdx,0x1c8(%rsp)
   14012ec53:	lea    -0x1(%rbp),%rdx
   14012ec57:	cmpb   $0x0,0x1520f(%rbx)
   14012ec5e:	je     14012ec8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3bd>
   14012ec60:	mov    0xe8(%r14),%rax
   14012ec67:	mov    0xf0(%r14),%rcx
   14012ec6e:	sub    %r15,%rdx
   14012ec71:	sub    %rax,%rcx
   14012ec74:	cmp    %rcx,%rdx
   14012ec77:	jae    14012ec8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3bd>
   14012ec79:	add    %rdx,%rax
   14012ec7c:	movzbl (%rax),%edi
   14012ec7f:	lea    0x1(%rdi),%edx
   14012ec82:	mov    %dl,(%rax)
   14012ec84:	cmp    $0x7,%dl
   14012ec87:	jbe    14012ec8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3bd>
   14012ec89:	movb   $0xcf,-0x1(%rbp)
   14012ec8d:	cmpb   $0x0,0x1040(%rbx)
   14012ec94:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012ec9a:	movzbl 0x0(%rbp),%eax
   14012ec9e:	lea    0x2913fb(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012eca5:	add    $0x1,%rbp
   14012eca9:	mov    (%rdi,%rax,8),%rax
   14012ecad:	jmp    *%rax
   14012ecaf:	mov    %rdx,0x3f8(%rsp)
   14012ecb7:	lea    0x3f8(%rsp),%rcx
   14012ecbf:	vzeroupper
   14012ecc2:	call   14021b9a0 <setun::VMValue::payload() const>
   14012ecc7:	mov    0x48(%rax),%rbp
   14012eccb:	test   %rbp,%rbp
   14012ecce:	je     14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   14012ecd4:	mov    0x38(%rbp),%rdx
   14012ecd8:	test   %rdx,%rdx
   14012ecdb:	je     14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   14012ece1:	mov    0x40(%rsp),%rax
   14012ece6:	mov    (%rax),%eax
   14012ece8:	cmp    %eax,(%rdx)
   14012ecea:	jne    140135314 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a44>
   14012ecf0:	test   %eax,%eax
   14012ecf2:	je     140135314 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a44>
   14012ecf8:	mov    0x40(%rsp),%rax
   14012ecfd:	mov    0x15268(%rbx),%r13
   14012ed04:	mov    0x1070(%rbx),%rdx
   14012ed0b:	sub    0x1068(%rbx),%rdx
   14012ed12:	movzwl 0x8(%rax),%eax
   14012ed16:	sar    $0x3,%rdx
   14012ed1a:	add    %r13,%rax
   14012ed1d:	mov    %rax,0x15268(%rbx)
   14012ed24:	add    $0x40,%rax
   14012ed28:	cmp    %rdx,%rax
   14012ed2b:	jae    140137beb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1431b>
   14012ed31:	test   %dil,%dil
   14012ed34:	jne    140133e0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1053e>
   14012ed3a:	mov    0x1068(%rbx),%rax
   14012ed41:	cmp    $0x1,%r12b
   14012ed45:	je     14013811b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1484b>
   14012ed4b:	cmp    $0x2,%r12b
   14012ed4f:	je     1401381a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148d3>
   14012ed55:	mov    -0x8(%rsi),%rdx
   14012ed59:	sub    $0x8,%rsi
   14012ed5d:	mov    %rdx,(%rax,%r13,8)
   14012ed61:	mov    0x1048(%rbx),%rdx
   14012ed68:	mov    %rsi,%r8
   14012ed6b:	mov    0x40(%rsp),%rax
   14012ed70:	mov    0x60(%rsp),%r11
   14012ed75:	sub    %rdx,%r8
   14012ed78:	mov    0x150c0(%rbx),%rcx
   14012ed7f:	mov    %r8,%rbp
   14012ed82:	movzwl 0x8(%rax),%r10d
   14012ed87:	sub    %r15,%r11
   14012ed8a:	mov    0x4(%rax),%eax
   14012ed8d:	sar    $0x3,%rbp
   14012ed91:	cmp    $0x7ff,%rcx
   14012ed98:	ja     14013879b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ecb>
   14012ed9e:	lea    0x1(%rcx),%r9
   14012eda2:	lea    (%rcx,%rcx,4),%rcx
   14012eda6:	mov    0x152a0(%rbx),%rdi
   14012edad:	mov    %r9,0x150c0(%rbx)
   14012edb4:	mov    %r11,0x10c0(%rbx,%rcx,8)
   14012edbc:	mov    %r13,0x10c8(%rbx,%rcx,8)
   14012edc4:	mov    %rbp,0x10d0(%rbx,%rcx,8)
   14012edcc:	mov    %r10,0x10d8(%rbx,%rcx,8)
   14012edd4:	mov    %rax,0x10e0(%rbx,%rcx,8)
   14012eddc:	mov    0x15270(%rbx),%rcx
   14012ede3:	cmp    %rdi,0x68(%rcx)
   14012ede7:	jae    140138161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14891>
   14012eded:	add    %r15,%rax
   14012edf0:	cmpb   $0x0,0x1040(%rbx)
   14012edf7:	je     140138159 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14889>
   14012edfd:	lea    0x1(%rax),%rbp
   14012ee01:	movzbl (%rax),%eax
   14012ee04:	lea    0x291295(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ee0b:	jmp    *(%rdi,%rax,8)
   14012ee0e:	lea    0x440(%rsp),%r8
   14012ee16:	mov    %r9,%rdx
   14012ee19:	mov    %r8,%rcx
   14012ee1c:	mov    %r8,0x80(%rsp)
   14012ee24:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012ee29:	mov    0x80(%rsp),%r8
   14012ee31:	jmp    1401249a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d8>
   14012ee36:	movzwl %r10w,%r8d
   14012ee3a:	add    %r13,%r8
   14012ee3d:	lea    (%rax,%r8,8),%r10
   14012ee41:	and    (%r10),%rdx
   14012ee44:	mov    %r10,0xe0(%rsp)
   14012ee4c:	cmp    %rcx,%rdx
   14012ee4f:	jne    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   14012ee55:	movzwl %r9w,%edx
   14012ee59:	add    %r13,%rdx
   14012ee5c:	lea    (%rax,%rdx,8),%rcx
   14012ee60:	movzwl %r11w,%edx
   14012ee64:	add    %r13,%rdx
   14012ee67:	mov    %rcx,0x100(%rsp)
   14012ee6f:	lea    (%rax,%rdx,8),%r11
   14012ee73:	movzwl 0x40(%rsp),%edx
   14012ee78:	mov    %r11,0xa0(%rsp)
   14012ee80:	add    %r13,%rdx
   14012ee83:	lea    (%rax,%rdx,8),%r10
   14012ee87:	mov    (%rcx),%rdx
   14012ee8a:	mov    $0xffff,%eax
   14012ee8f:	shl    $0x30,%rax
   14012ee93:	mov    %r10,0x80(%rsp)
   14012ee9b:	and    %rax,%rdx
   14012ee9e:	mov    %rdx,%rcx
   14012eea1:	mov    $0x1fff,%edx
   14012eea6:	shl    $0x33,%rdx
   14012eeaa:	cmp    %rdx,%rcx
   14012eead:	jne    140137d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144c5>
   14012eeb3:	mov    (%r10),%rdx
   14012eeb6:	and    %rax,%rdx
   14012eeb9:	cmp    %rcx,%rdx
   14012eebc:	jne    140137d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144c5>
   14012eec2:	and    (%r11),%rax
   14012eec5:	cmp    %rdx,%rax
   14012eec8:	jne    140137d95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144c5>
   14012eece:	mov    %rdi,%rcx
   14012eed1:	vzeroupper
   14012eed4:	call   14021b9a0 <setun::VMValue::payload() const>
   14012eed9:	mov    0x58(%rax),%rcx
   14012eedd:	mov    %rcx,0x40(%rsp)
   14012eee2:	mov    0xe0(%rsp),%rcx
   14012eeea:	call   14021b9a0 <setun::VMValue::payload() const>
   14012eeef:	mov    0x40(%rsp),%rcx
   14012eef4:	mov    0x58(%rax),%rdx
   14012eef8:	test   %rcx,%rcx
   14012eefb:	je     140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef01:	test   %rdx,%rdx
   14012ef04:	je     140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef0a:	cmpb   $0x1,(%rcx)
   14012ef0d:	jne    140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef13:	cmpb   $0x1,(%rdx)
   14012ef16:	jne    140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef1c:	mov    0x100(%rsp),%rax
   14012ef24:	mov    (%rax),%rax
   14012ef27:	mov    %rax,0x40(%rsp)
   14012ef2c:	shl    $0x10,%rax
   14012ef30:	sar    $0x10,%rax
   14012ef34:	mov    %rax,0x120(%rsp)
   14012ef3c:	js     140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef42:	mov    0x80(%rsp),%r10
   14012ef4a:	mov    %rcx,0x40(%rsp)
   14012ef4f:	mov    %rdx,0x140(%rsp)
   14012ef57:	mov    (%r10),%rax
   14012ef5a:	shl    $0x10,%rax
   14012ef5e:	sar    $0x10,%rax
   14012ef62:	mov    %rax,0xc0(%rsp)
   14012ef6a:	call   140146e40 <setun::ArrayObject::size() const>
   14012ef6f:	cmp    %rax,0x120(%rsp)
   14012ef77:	jae    140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef7d:	cmpq   $0x0,0xc0(%rsp)
   14012ef86:	js     140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012ef8c:	mov    0x140(%rsp),%rcx
   14012ef94:	call   140146e40 <setun::ArrayObject::size() const>
   14012ef99:	mov    0xc0(%rsp),%r11
   14012efa1:	cmp    %rax,%r11
   14012efa4:	jae    140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f62>
   14012efaa:	mov    0x40(%rsp),%rcx
   14012efaf:	mov    0x140(%rsp),%rdx
   14012efb7:	mov    0xa0(%rsp),%rdi
   14012efbf:	mov    0x20(%rcx),%rax
   14012efc3:	mov    0x20(%rdx),%rcx
   14012efc7:	mov    (%rdi),%rdx
   14012efca:	mov    0x120(%rsp),%rdi
   14012efd2:	shl    $0x10,%rdx
   14012efd6:	sar    $0x10,%rdx
   14012efda:	imul   (%rcx,%r11,8),%rdx
   14012efdf:	add    %rdx,(%rax,%rdi,8)
   14012efe3:	cmpb   $0x0,0x1040(%rbx)
   14012efea:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   14012eff0:	movzbl 0xa(%rbp),%eax
   14012eff4:	lea    0x2910a5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012effb:	add    $0xb,%rbp
   14012efff:	mov    (%rdi,%rax,8),%rax
   14012f003:	jmp    *%rax
   14012f005:	nopl   (%rax)
   14012f008:	movabs $0xffff000000000000,%rax
   14012f012:	movabs $0xfff8000000000000,%rdx
   14012f01c:	and    0x338(%rsp),%rax
   14012f024:	cmp    %rdx,%rax
   14012f027:	jne    14012eb81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2b1>
   14012f02d:	lea    0x330(%rsp),%rcx
   14012f035:	vzeroupper
   14012f038:	call   14021b9a0 <setun::VMValue::payload() const>
   14012f03d:	mov    0x58(%rax),%r10
   14012f041:	test   %r10,%r10
   14012f044:	je     140127e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4598>
   14012f04a:	mov    0x338(%rsp),%r9
   14012f052:	shl    $0x10,%r9
   14012f056:	mov    %r9,%rdi
   14012f059:	sar    $0x10,%rdi
   14012f05d:	js     140127e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4598>
   14012f063:	mov    %r10,%rcx
   14012f066:	mov    %r10,0x40(%rsp)
   14012f06b:	call   140146e40 <setun::ArrayObject::size() const>
   14012f070:	cmp    %rax,%rdi
   14012f073:	jae    140127e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4598>
   14012f079:	mov    0x40(%rsp),%r10
   14012f07e:	movzbl (%r10),%eax
   14012f082:	cmp    $0x3,%al
   14012f084:	je     140135012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11742>
   14012f08a:	ja     140134f55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11685>
   14012f090:	cmp    $0x1,%al
   14012f092:	je     14013506b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1179b>
   14012f098:	cmp    $0x2,%al
   14012f09a:	jne    140134c61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11391>
   14012f0a0:	test   %r12b,%r12b
   14012f0a3:	je     140137311 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a41>
   14012f0a9:	sub    $0x1,%r12b
   14012f0ad:	je     1401372d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a01>
   14012f0b3:	lea    0x8(%rsi),%r8
   14012f0b7:	cmp    0x38(%rsp),%r8
   14012f0bc:	jae    140136977 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130a7>
   14012f0c2:	mov    0x1d0(%rsp),%rax
   14012f0ca:	lea    0x680(%rsp),%rcx
   14012f0d2:	mov    %r8,0x40(%rsp)
   14012f0d7:	mov    $0x2,%r12d
   14012f0dd:	mov    %rax,(%rsi)
   14012f0e0:	mov    0x1c8(%rsp),%rax
   14012f0e8:	mov    %rax,0x1d0(%rsp)
   14012f0f0:	mov    0x38(%r10),%rax
   14012f0f4:	movzbl (%rax,%rdi,1),%edx
   14012f0f8:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012f0fd:	mov    0x680(%rsp),%rax
   14012f105:	mov    0x40(%rsp),%rsi
   14012f10a:	mov    %rax,0x1c8(%rsp)
   14012f112:	cmpb   $0x0,0x1040(%rbx)
   14012f119:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   14012f11f:	movzbl 0x0(%rbp),%eax
   14012f123:	lea    0x290f76(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f12a:	add    $0x1,%rbp
   14012f12e:	mov    (%rdi,%rax,8),%rax
   14012f132:	jmp    *%rax
   14012f134:	nopl   0x0(%rax)
   14012f138:	lea    0x460(%rsp),%rax
   14012f140:	mov    0x40(%rsp),%rdx
   14012f145:	mov    %r8,0xc0(%rsp)
   14012f14d:	mov    %rax,%rcx
   14012f150:	mov    %rax,0x80(%rsp)
   14012f158:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012f15d:	mov    0xc0(%rsp),%r8
   14012f165:	jmp    140124a32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1162>
   14012f16a:	lea    0x680(%rsp),%rcx
   14012f172:	lea    0x308(%rsp),%rdx
   14012f17a:	vzeroupper
   14012f17d:	call   14021bb40 <setun::VMValue::as_array() const>
   14012f182:	mov    0x688(%rsp),%rax
   14012f18a:	mov    0x680(%rsp),%rdi
   14012f192:	mov    %rax,0x40(%rsp)
   14012f197:	test   %rdi,%rdi
   14012f19a:	je     14012f1ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8dc>
   14012f19c:	mov    %rdi,%rcx
   14012f19f:	call   140146f20 <setun::ArrayObject::empty() const>
   14012f1a4:	test   %al,%al
   14012f1a6:	je     140134854 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f84>
   14012f1ac:	test   %r12b,%r12b
   14012f1af:	je     140131ee9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe619>
   14012f1b5:	cmp    $0x1,%r12b
   14012f1b9:	je     1401345a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cd5>
   14012f1bf:	lea    0x8(%rsi),%r8
   14012f1c3:	cmp    0x38(%rsp),%r8
   14012f1c8:	jae    1401375da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d0a>
   14012f1ce:	mov    0x1d0(%rsp),%rax
   14012f1d6:	mov    %rax,(%rsi)
   14012f1d9:	mov    0x1c8(%rsp),%rax
   14012f1e1:	mov    %r8,%rsi
   14012f1e4:	mov    %rax,0x1d0(%rsp)
   14012f1ec:	movabs $0xfff8000000000000,%rax
   14012f1f6:	mov    %rax,0x1c8(%rsp)
   14012f1fe:	mov    $0x2,%r12d
   14012f204:	mov    0x40(%rsp),%rax
   14012f209:	test   %rax,%rax
   14012f20c:	je     140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012f212:	mov    %rax,%rcx
   14012f215:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012f21a:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012f21f:	mov    %rdx,0x328(%rsp)
   14012f227:	lea    0x680(%rsp),%rcx
   14012f22f:	lea    0x328(%rsp),%rdx
   14012f237:	vzeroupper
   14012f23a:	call   14021bb40 <setun::VMValue::as_array() const>
   14012f23f:	mov    0x688(%rsp),%rax
   14012f247:	mov    %rax,0x60(%rsp)
   14012f24c:	mov    0x680(%rsp),%rax
   14012f254:	mov    %rax,0x40(%rsp)
   14012f259:	test   %rax,%rax
   14012f25c:	je     14012f28a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9ba>
   14012f25e:	lea    0x320(%rsp),%rcx
   14012f266:	call   14021a530 <setun::VMValue::as_int() const>
   14012f26b:	mov    %rax,%rdi
   14012f26e:	test   %rax,%rax
   14012f271:	js     1401329f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf124>
   14012f277:	mov    0x40(%rsp),%rcx
   14012f27c:	call   140146e40 <setun::ArrayObject::size() const>
   14012f281:	cmp    %rax,%rdi
   14012f284:	jb     140133f5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1068f>
   14012f28a:	mov    0x60(%rsp),%rax
   14012f28f:	test   %rax,%rax
   14012f292:	je     14012a032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012f298:	mov    %rax,%rcx
   14012f29b:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012f2a0:	jmp    14012a032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012f2a5:	shl    $0x10,%rax
   14012f2a9:	shl    $0x10,%rcx
   14012f2ad:	movabs $0xfffa000000000000,%rdx
   14012f2b7:	cmp    %rax,%rcx
   14012f2ba:	movabs $0xfffa000000000001,%rax
   14012f2c4:	cmovl  %rax,%rdx
   14012f2c8:	mov    %rdx,0x1c8(%rsp)
   14012f2d0:	lea    -0x1(%rbp),%rdx
   14012f2d4:	cmpb   $0x0,0x1520f(%rbx)
   14012f2db:	je     14012f30a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba3a>
   14012f2dd:	mov    0xe8(%r14),%rax
   14012f2e4:	mov    0xf0(%r14),%rcx
   14012f2eb:	sub    %r15,%rdx
   14012f2ee:	sub    %rax,%rcx
   14012f2f1:	cmp    %rcx,%rdx
   14012f2f4:	jae    14012f30a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba3a>
   14012f2f6:	add    %rdx,%rax
   14012f2f9:	movzbl (%rax),%edi
   14012f2fc:	lea    0x1(%rdi),%edx
   14012f2ff:	mov    %dl,(%rax)
   14012f301:	cmp    $0x7,%dl
   14012f304:	jbe    14012f30a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba3a>
   14012f306:	movb   $0xbf,-0x1(%rbp)
   14012f30a:	cmpb   $0x0,0x1040(%rbx)
   14012f311:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012f317:	movzbl 0x0(%rbp),%eax
   14012f31b:	lea    0x290d7e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f322:	add    $0x1,%rbp
   14012f326:	mov    (%rdi,%rax,8),%rax
   14012f32a:	jmp    *%rax
   14012f32c:	mov    0x1070(%rbx),%rax
   14012f333:	sub    0x1068(%rbx),%rax
   14012f33a:	mov    %rcx,%rdx
   14012f33d:	lea    0x1068(%rbx),%rcx
   14012f344:	sar    $0x3,%rax
   14012f348:	mov    %rax,0xa0(%rsp)
   14012f350:	add    %rax,%rdx
   14012f353:	vzeroupper
   14012f356:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f35b:	jmp    140126285 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b5>
   14012f360:	shl    $0x10,%rax
   14012f364:	shl    $0x10,%rcx
   14012f368:	movabs $0xfffa000000000000,%rdx
   14012f372:	cmp    %rax,%rcx
   14012f375:	movabs $0xfffa000000000001,%rax
   14012f37f:	cmovg  %rax,%rdx
   14012f383:	mov    %rdx,0x1c8(%rsp)
   14012f38b:	lea    -0x1(%rbp),%rdx
   14012f38f:	cmpb   $0x0,0x1520f(%rbx)
   14012f396:	je     14012f3c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf5>
   14012f398:	mov    0xe8(%r14),%rax
   14012f39f:	mov    0xf0(%r14),%rcx
   14012f3a6:	sub    %r15,%rdx
   14012f3a9:	sub    %rax,%rcx
   14012f3ac:	cmp    %rcx,%rdx
   14012f3af:	jae    14012f3c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf5>
   14012f3b1:	add    %rdx,%rax
   14012f3b4:	movzbl (%rax),%edi
   14012f3b7:	lea    0x1(%rdi),%edx
   14012f3ba:	mov    %dl,(%rax)
   14012f3bc:	cmp    $0x7,%dl
   14012f3bf:	jbe    14012f3c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf5>
   14012f3c1:	movb   $0xce,-0x1(%rbp)
   14012f3c5:	cmpb   $0x0,0x1040(%rbx)
   14012f3cc:	je     14012e541 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac71>
   14012f3d2:	movzbl 0x0(%rbp),%eax
   14012f3d6:	lea    0x290cc3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f3dd:	add    $0x1,%rbp
   14012f3e1:	mov    (%rdi,%rax,8),%rax
   14012f3e5:	jmp    *%rax
   14012f3e7:	mov    0x1c8(%rsp),%rax
   14012f3ef:	mov    %rax,0x1d0(%rsp)
   14012f3f7:	movabs $0xfff8000000000000,%rax
   14012f401:	mov    %rax,0x1c8(%rsp)
   14012f409:	jmp    140127ee2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4612>
   14012f40e:	lea    0x420(%rsp),%rax
   14012f416:	mov    %rcx,%rdx
   14012f419:	mov    %r9,0x80(%rsp)
   14012f421:	mov    %rax,%rcx
   14012f424:	mov    %rax,0x60(%rsp)
   14012f429:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14012f42e:	mov    0x80(%rsp),%r9
   14012f436:	jmp    14012493d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106d>
   14012f43b:	cmp    $0x2,%r12b
   14012f43f:	je     140132494 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebc4>
   14012f445:	sub    $0x8,%rsi
   14012f449:	jmp    140124da2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2>
   14012f44e:	lea    0x20(%rdi),%rdx
   14012f452:	lea    0x1068(%rbx),%rcx
   14012f459:	mov    %eax,0x60(%rsp)
   14012f45d:	mov    %r8d,0x80(%rsp)
   14012f465:	mov    %r9d,0x40(%rsp)
   14012f46a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f46f:	mov    0x60(%rsp),%eax
   14012f473:	mov    0x40(%rsp),%r9d
   14012f478:	mov    0x80(%rsp),%r8d
   14012f480:	jmp    14012468d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbd>
   14012f485:	lea    0x8(%rdi),%rdx
   14012f489:	lea    0x48(%rdi),%r10
   14012f48d:	mov    %rdx,0x15268(%rbx)
   14012f494:	mov    0x1070(%rbx),%rdx
   14012f49b:	sub    0x1068(%rbx),%rdx
   14012f4a2:	sar    $0x3,%rdx
   14012f4a6:	mov    %rdx,%rcx
   14012f4a9:	cmp    %rdx,%r10
   14012f4ac:	jae    1401340c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107f3>
   14012f4b2:	vzeroupper
   14012f4b5:	jmp    140124684 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb4>
   14012f4ba:	mov    %r9,0x80(%rsp)
   14012f4c2:	lea    0x3e0(%rsp),%rcx
   14012f4ca:	vzeroupper
   14012f4cd:	call   14021b9a0 <setun::VMValue::payload() const>
   14012f4d2:	mov    0x80(%rsp),%r9
   14012f4da:	lea    0x22c5e5(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   14012f4e1:	mov    %rax,0x40(%rsp)
   14012f4e6:	movzwl 0x6(%r9),%edi
   14012f4eb:	shl    $0x5,%rdi
   14012f4ef:	add    0x30(%r14),%rdi
   14012f4f3:	mov    %rdi,%rcx
   14012f4f6:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012f4fb:	test   %al,%al
   14012f4fd:	jne    14012f516 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc46>
   14012f4ff:	lea    0x22c5c4(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14012f506:	mov    %rdi,%rcx
   14012f509:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012f50e:	test   %al,%al
   14012f510:	je     14012e4db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac0b>
   14012f516:	mov    0x40(%rsp),%rax
   14012f51b:	mov    0x58(%rax),%rdi
   14012f51f:	test   %r12b,%r12b
   14012f522:	jne    140132412 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb42>
   14012f528:	xor    %edx,%edx
   14012f52a:	test   %rdi,%rdi
   14012f52d:	je     14012f53a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc6a>
   14012f52f:	mov    %rdi,%rcx
   14012f532:	call   140146e40 <setun::ArrayObject::size() const>
   14012f537:	mov    %rax,%rdx
   14012f53a:	lea    0x680(%rsp),%rcx
   14012f542:	mov    $0x1,%r12d
   14012f548:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14012f54d:	mov    0x680(%rsp),%rax
   14012f555:	mov    %rax,0x1c8(%rsp)
   14012f55d:	cmpb   $0x0,0x1040(%rbx)
   14012f564:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   14012f56a:	movzbl 0x2(%rbp),%eax
   14012f56e:	lea    0x290b2b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f575:	add    $0x3,%rbp
   14012f579:	mov    (%rdi,%rax,8),%rax
   14012f57d:	jmp    *%rax
   14012f57f:	mov    %r9,0x40(%rsp)
   14012f584:	lea    0x3e0(%rsp),%rcx
   14012f58c:	vzeroupper
   14012f58f:	call   14021b9a0 <setun::VMValue::payload() const>
   14012f594:	mov    0x48(%rax),%rdi
   14012f598:	test   %rdi,%rdi
   14012f59b:	je     14012e4db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac0b>
   14012f5a1:	mov    0x40(%rsp),%r9
   14012f5a6:	lea    0x22c519(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   14012f5ad:	movzwl 0x6(%r9),%eax
   14012f5b2:	mov    %r9,0x80(%rsp)
   14012f5ba:	shl    $0x5,%rax
   14012f5be:	add    0x30(%r14),%rax
   14012f5c2:	mov    %rax,%rcx
   14012f5c5:	mov    %rax,0x40(%rsp)
   14012f5ca:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012f5cf:	test   %al,%al
   14012f5d1:	jne    140131bbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2ec>
   14012f5d7:	mov    0x40(%rsp),%rcx
   14012f5dc:	lea    0x22c4e7(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14012f5e3:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012f5e8:	test   %al,%al
   14012f5ea:	jne    140131bbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2ec>
   14012f5f0:	mov    0x38(%rdi),%rdx
   14012f5f4:	test   %rdx,%rdx
   14012f5f7:	je     140134e89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b9>
   14012f5fd:	mov    0x40(%rsp),%r8
   14012f602:	lea    0x680(%rsp),%rcx
   14012f60a:	add    $0x28,%rdx
   14012f60e:	call   140221b00 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14012f613:	mov    0x680(%rsp),%rax
   14012f61b:	test   %rax,%rax
   14012f61e:	je     140134e89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b9>
   14012f624:	mov    (%rax),%rax
   14012f627:	test   %rax,%rax
   14012f62a:	je     140134e89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b9>
   14012f630:	mov    0x48(%rdi),%rcx
   14012f634:	mov    0x50(%rdi),%rdx
   14012f638:	movzwl 0x28(%rax),%eax
   14012f63c:	sub    %rcx,%rdx
   14012f63f:	sar    $0x3,%rdx
   14012f643:	cmp    %rdx,%rax
   14012f646:	jae    140134e89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b9>
   14012f64c:	mov    0x38(%rdi),%rdx
   14012f650:	mov    0x80(%rsp),%r9
   14012f658:	mov    (%rdx),%edx
   14012f65a:	mov    %ax,0x4(%r9)
   14012f65f:	mov    %edx,(%r9)
   14012f662:	test   %r12b,%r12b
   14012f665:	jne    140137084 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137b4>
   14012f66b:	mov    (%rcx,%rax,8),%rax
   14012f66f:	mov    $0x1,%r12d
   14012f675:	mov    %rax,0x1c8(%rsp)
   14012f67d:	cmpb   $0x0,0x1040(%rbx)
   14012f684:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   14012f68a:	movzbl 0x2(%rbp),%eax
   14012f68e:	lea    0x290a0b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f695:	add    $0x3,%rbp
   14012f699:	mov    (%rdi,%rax,8),%rax
   14012f69d:	jmp    *%rax
   14012f69f:	nop
   14012f6a0:	cmp    $0x1,%r12b
   14012f6a4:	je     140132598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecc8>
   14012f6aa:	mov    -0x8(%rsi),%rax
   14012f6ae:	mov    $0x1,%r12d
   14012f6b4:	sub    $0x10,%rsi
   14012f6b8:	mov    %rax,0x390(%rsp)
   14012f6c0:	mov    (%rsi),%rax
   14012f6c3:	mov    %rax,0x388(%rsp)
   14012f6cb:	jmp    1401282d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a05>
   14012f6d0:	cmp    $0x1,%r12b
   14012f6d4:	je     14013231a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea4a>
   14012f6da:	mov    -0x8(%rsi),%rax
   14012f6de:	mov    $0x1,%r12d
   14012f6e4:	sub    $0x10,%rsi
   14012f6e8:	mov    %rax,0x370(%rsp)
   14012f6f0:	mov    (%rsi),%rax
   14012f6f3:	mov    %rax,0x368(%rsp)
   14012f6fb:	jmp    14012815f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x488f>
   14012f700:	movabs $0xffffffff00000000,%rax
   14012f70a:	mov    -0x8(%rsi),%rdx
   14012f70e:	movabs $0xfffd000200000000,%rcx
   14012f718:	and    %rdx,%rax
   14012f71b:	cmp    %rcx,%rax
   14012f71e:	je     1401348ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1101d>
   14012f724:	movabs $0xfffb000000000000,%rax
   14012f72e:	sub    $0x8,%rsi
   14012f732:	movabs $0xffff000000000000,%rdx
   14012f73c:	movabs $0xfffd000000000000,%rcx
   14012f746:	mov    %rax,0x3e0(%rsp)
   14012f74e:	mov    (%rsi),%rax
   14012f751:	and    %rax,%rdx
   14012f754:	mov    %rax,0x3e0(%rsp)
   14012f75c:	cmp    %rcx,%rdx
   14012f75f:	je     14012d641 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d71>
   14012f765:	jmp    1401289ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x511d>
   14012f76a:	cmp    $0x1,%r12b
   14012f76e:	je     14012c3a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ad5>
   14012f774:	mov    -0x8(%rsi),%rax
   14012f778:	lea    -0x10(%rsi),%rdx
   14012f77c:	movabs $0xffff000000000000,%rcx
   14012f786:	movabs $0xfffd000000000000,%r8
   14012f790:	mov    %rax,0x310(%rsp)
   14012f798:	mov    -0x10(%rsi),%rax
   14012f79c:	mov    %rdx,%rsi
   14012f79f:	and    %rax,%rcx
   14012f7a2:	mov    %rax,0x308(%rsp)
   14012f7aa:	cmp    %r8,%rcx
   14012f7ad:	je     14012c3e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b17>
   14012f7b3:	test   %r12b,%r12b
   14012f7b6:	jne    14012d7a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed4>
   14012f7bc:	jmp    140129f8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14012f7c1:	nopl   0x0(%rax)
   14012f7c8:	lea    0x8(%rdi),%rdx
   14012f7cc:	lea    0x48(%rdi),%r10
   14012f7d0:	mov    %rdx,0x15268(%rbx)
   14012f7d7:	mov    0x1070(%rbx),%rdx
   14012f7de:	sub    0x1068(%rbx),%rdx
   14012f7e5:	sar    $0x3,%rdx
   14012f7e9:	mov    %rdx,%rcx
   14012f7ec:	cmp    %rdx,%r10
   14012f7ef:	jae    1401342d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a06>
   14012f7f5:	vzeroupper
   14012f7f8:	jmp    14012488b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbb>
   14012f7fd:	cmp    $0x1,%r12b
   14012f801:	je     14013364d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd7d>
   14012f807:	mov    -0x8(%rsi),%rax
   14012f80b:	mov    $0x1,%r12d
   14012f811:	sub    $0x10,%rsi
   14012f815:	mov    %rax,0x380(%rsp)
   14012f81d:	mov    (%rsi),%rax
   14012f820:	mov    %rax,0x378(%rsp)
   14012f828:	jmp    14012821a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494a>
   14012f82d:	mov    %rax,0x60(%rsp)
   14012f832:	add    %rdx,%rdx
   14012f835:	lea    0x1068(%rbx),%rcx
   14012f83c:	mov    %r11d,0x80(%rsp)
   14012f844:	mov    %r9,0x40(%rsp)
   14012f849:	vzeroupper
   14012f84c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f851:	mov    0x80(%rsp),%r11d
   14012f859:	mov    0x60(%rsp),%rax
   14012f85e:	mov    0x40(%rsp),%r9
   14012f863:	jmp    140126642 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d72>
   14012f868:	mov    0x1048(%rbx),%rdx
   14012f86f:	mov    %rax,%rbp
   14012f872:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012f877:	cmp    $0x2,%r12b
   14012f87b:	je     1401321e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe914>
   14012f881:	cmp    $0x1,%r12b
   14012f885:	jne    14013619c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128cc>
   14012f88b:	mov    0x1048(%rbx),%rdx
   14012f892:	mov    0x1050(%rbx),%rax
   14012f899:	lea    0x8(%rsi),%r8
   14012f89d:	cmp    0x38(%rsp),%r8
   14012f8a2:	jae    1401371b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138e2>
   14012f8a8:	mov    0x1c8(%rsp),%rcx
   14012f8b0:	mov    %rcx,(%rsi)
   14012f8b3:	sub    %rdx,%r8
   14012f8b6:	sub    %r15,%rdi
   14012f8b9:	sub    %rdx,%rax
   14012f8bc:	mov    %r8,%rsi
   14012f8bf:	mov    %rdi,0x1038(%rbx)
   14012f8c6:	sar    $0x3,%rsi
   14012f8ca:	cmp    %r8,%rax
   14012f8cd:	jae    14012f8df <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc00f>
   14012f8cf:	lea    (%rsi,%rsi,1),%rdx
   14012f8d3:	lea    0x1048(%rbx),%rcx
   14012f8da:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f8df:	vmovdqa 0x22d1f9(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14012f8e7:	mov    %rsi,0x1060(%rbx)
   14012f8ee:	movb   $0x0,0x153a0(%rbx)
   14012f8f5:	vmovdqa %xmm0,0x15390(%rbx)
   14012f8fd:	call   14033e560 <setun::cold_throw_range_step_zero()>
   14012f902:	nopw   0x0(%rax,%rax,1)
   14012f908:	mov    0x1048(%rbx),%rdx
   14012f90f:	mov    %rdi,%rbp
   14012f912:	vzeroupper
   14012f915:	jmp    1401244cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   14012f91a:	cmp    $0x1,%r12b
   14012f91e:	je     140132b7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2aa>
   14012f924:	lea    0x10(%rsi),%r8
   14012f928:	cmp    0x38(%rsp),%r8
   14012f92d:	jae    140137eb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145e8>
   14012f933:	mov    0x1d0(%rsp),%rdx
   14012f93b:	mov    %rdx,(%rsi)
   14012f93e:	mov    0x1c8(%rsp),%rdx
   14012f946:	mov    %rdx,0x8(%rsi)
   14012f94a:	mov    %r8,%rsi
   14012f94d:	jmp    14012762c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d5c>
   14012f952:	cmp    $0x2,%r12b
   14012f956:	je     140133671 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfda1>
   14012f95c:	mov    -0x8(%rsi),%rdx
   14012f960:	sub    $0x8,%rsi
   14012f964:	mov    %rdx,(%rax,%rdi,8)
   14012f968:	jmp    1401275ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d1d>
   14012f96d:	mov    %r8,0x40(%rsp)
   14012f972:	lea    0x20(%rdi),%rdx
   14012f976:	lea    0x1068(%rbx),%rcx
   14012f97d:	vzeroupper
   14012f980:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f985:	mov    0x40(%rsp),%r8
   14012f98a:	jmp    1401275cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cfd>
   14012f98f:	lea    0x8(%rax),%rdx
   14012f993:	lea    0x48(%rax),%rcx
   14012f997:	mov    %rdx,0x15268(%rbx)
   14012f99e:	mov    0x1070(%rbx),%rdx
   14012f9a5:	sub    0x1068(%rbx),%rdx
   14012f9ac:	sar    $0x3,%rdx
   14012f9b0:	cmp    %rdx,%rcx
   14012f9b3:	jb     140127d74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44a4>
   14012f9b9:	mov    %rax,0x60(%rsp)
   14012f9be:	add    %rdx,%rdx
   14012f9c1:	lea    0x1068(%rbx),%rcx
   14012f9c8:	mov    %r9,0x40(%rsp)
   14012f9cd:	vzeroupper
   14012f9d0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f9d5:	mov    0x60(%rsp),%rax
   14012f9da:	mov    0x40(%rsp),%r9
   14012f9df:	jmp    140127d74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44a4>
   14012f9e4:	nopl   0x0(%rax)
   14012f9e8:	cmp    $0x2,%r12b
   14012f9ec:	je     1401330ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf81e>
   14012f9f2:	mov    -0x8(%rsi),%rdx
   14012f9f6:	sub    $0x8,%rsi
   14012f9fa:	mov    %rdx,0x18(%rax,%r13,8)
   14012f9ff:	jmp    140127c6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x439a>
   14012fa04:	cmp    $0x2,%r12b
   14012fa08:	je     1401331c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8f3>
   14012fa0e:	mov    -0x8(%rsi),%rdx
   14012fa12:	sub    $0x8,%rsi
   14012fa16:	mov    %rdx,0x10(%rax,%r13,8)
   14012fa1b:	jmp    140127c27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4357>
   14012fa20:	cmp    $0x2,%r12b
   14012fa24:	je     140133212 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf942>
   14012fa2a:	mov    -0x8(%rsi),%rdx
   14012fa2e:	sub    $0x8,%rsi
   14012fa32:	mov    %rdx,0x8(%rax,%r13,8)
   14012fa37:	jmp    140127be4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4314>
   14012fa3c:	cmp    $0x1,%r12b
   14012fa40:	je     1401331eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf91b>
   14012fa46:	mov    -0x8(%rsi),%rax
   14012fa4a:	sub    $0x10,%rsi
   14012fa4e:	mov    %rax,0x338(%rsp)
   14012fa56:	mov    (%rsi),%rax
   14012fa59:	mov    %rax,0x330(%rsp)
   14012fa61:	jmp    140127e43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4573>
   14012fa66:	cmp    $0x2,%r12b
   14012fa6a:	je     140132a80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1b0>
   14012fa70:	mov    -0x8(%rsi),%rdx
   14012fa74:	sub    $0x8,%rsi
   14012fa78:	mov    %rdx,(%rax,%r13,8)
   14012fa7c:	jmp    140127ba1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42d1>
   14012fa81:	cmp    $0x1,%r12b
   14012fa85:	je     14013319f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8cf>
   14012fa8b:	mov    -0x8(%rsi),%rax
   14012fa8f:	mov    $0x1,%r12d
   14012fa95:	sub    $0x10,%rsi
   14012fa99:	mov    %rax,0x3c0(%rsp)
   14012faa1:	mov    (%rsi),%rax
   14012faa4:	mov    %rax,0x3b8(%rsp)
   14012faac:	jmp    1401286f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e27>
   14012fab1:	movabs $0xffff000000000000,%rdx
   14012fabb:	movb   $0xcd,-0x1(%rbp)
   14012fabf:	mov    (%r11),%rax
   14012fac2:	movabs $0xfffd000000000000,%rcx
   14012facc:	and    %rax,%rdx
   14012facf:	cmp    %rcx,%rdx
   14012fad2:	je     14013323a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf96a>
   14012fad8:	movabs $0xfff8000000000000,%rax
   14012fae2:	cmp    %rax,%rdx
   14012fae5:	je     140133252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf982>
   14012faeb:	mov    %r11,%rcx
   14012faee:	vzeroupper
   14012faf1:	call   14021bc80 <setun::VMValue::as_float() const>
   14012faf6:	vcvttsd2si %xmm0,%rax
   14012fafb:	mov    %rax,0x500(%rsp)
   14012fb03:	lea    0x500(%rsp),%rax
   14012fb0b:	movq   $0x0,0x508(%rsp)
   14012fb17:	movq   $0x0,0x510(%rsp)
   14012fb23:	mov    %rax,0x80(%rsp)
   14012fb2b:	movabs $0xffff000000000000,%rdx
   14012fb35:	mov    0x60(%rsp),%rax
   14012fb3a:	movabs $0xfffd000000000000,%rcx
   14012fb44:	mov    (%rax),%rax
   14012fb47:	and    %rax,%rdx
   14012fb4a:	cmp    %rcx,%rdx
   14012fb4d:	je     140132ad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf203>
   14012fb53:	movabs $0xfff8000000000000,%rax
   14012fb5d:	cmp    %rax,%rdx
   14012fb60:	je     140132aeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf21b>
   14012fb66:	mov    0x60(%rsp),%rcx
   14012fb6b:	call   14021bc80 <setun::VMValue::as_float() const>
   14012fb70:	lea    0x520(%rsp),%r8
   14012fb78:	movq   $0x0,0x528(%rsp)
   14012fb84:	vcvttsd2si %xmm0,%rax
   14012fb89:	movq   $0x0,0x530(%rsp)
   14012fb95:	mov    %rax,0x520(%rsp)
   14012fb9d:	movabs $0xffff000000000000,%rdx
   14012fba7:	mov    0x40(%rsp),%rax
   14012fbac:	movabs $0xfffd000000000000,%rcx
   14012fbb6:	mov    (%rax),%rax
   14012fbb9:	and    %rax,%rdx
   14012fbbc:	cmp    %rcx,%rdx
   14012fbbf:	je     140132aa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1d7>
   14012fbc5:	movabs $0xfff8000000000000,%rax
   14012fbcf:	cmp    %rax,%rdx
   14012fbd2:	je     140132abf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1ef>
   14012fbd8:	mov    0x40(%rsp),%rcx
   14012fbdd:	mov    %r8,0x60(%rsp)
   14012fbe2:	call   14021bc80 <setun::VMValue::as_float() const>
   14012fbe7:	vcvttsd2si %xmm0,%rax
   14012fbec:	mov    0x60(%rsp),%r8
   14012fbf1:	mov    %rax,0x540(%rsp)
   14012fbf9:	lea    0x540(%rsp),%rax
   14012fc01:	movq   $0x0,0x548(%rsp)
   14012fc0d:	movq   $0x0,0x550(%rsp)
   14012fc19:	mov    %rax,0x60(%rsp)
   14012fc1e:	mov    0x80(%rsp),%rdx
   14012fc26:	lea    0x680(%rsp),%rax
   14012fc2e:	mov    %rax,%rcx
   14012fc31:	mov    %rax,0x40(%rsp)
   14012fc36:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012fc3b:	mov    0x40(%rsp),%r8
   14012fc40:	mov    0x60(%rsp),%rdx
   14012fc45:	lea    0x4a0(%rsp),%rcx
   14012fc4d:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012fc52:	mov    0x4b0(%rsp),%rax
   14012fc5a:	vmovdqa 0x4a0(%rsp),%xmm7
   14012fc63:	lea    0x1a0(%rsp),%rdx
   14012fc6b:	mov    0x40(%rsp),%rcx
   14012fc70:	mov    %rax,0x1b0(%rsp)
   14012fc78:	vmovdqa %xmm7,0x1a0(%rsp)
   14012fc81:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012fc86:	mov    0x1068(%rbx),%rax
   14012fc8d:	mov    0x680(%rsp),%rdx
   14012fc95:	mov    %rdx,(%rax,%rdi,8)
   14012fc99:	jmp    14012ca10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9140>
   14012fc9e:	mov    %r9,0x60(%rsp)
   14012fca3:	lea    0x1d0(%rsp),%rcx
   14012fcab:	vzeroupper
   14012fcae:	call   14021b9a0 <setun::VMValue::payload() const>
   14012fcb3:	mov    0x60(%rsp),%r9
   14012fcb8:	mov    0x48(%rax),%rax
   14012fcbc:	test   %rax,%rax
   14012fcbf:	je     14012c53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c6b>
   14012fcc5:	mov    0x38(%rax),%rcx
   14012fcc9:	test   %rcx,%rcx
   14012fccc:	je     14012c53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c6b>
   14012fcd2:	mov    (%r9),%edx
   14012fcd5:	cmp    %edx,(%rcx)
   14012fcd7:	jne    14012c53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c6b>
   14012fcdd:	test   %edx,%edx
   14012fcdf:	je     14012c53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c6b>
   14012fce5:	mov    0x48(%rax),%rdx
   14012fce9:	mov    0x50(%rax),%rax
   14012fced:	movzwl 0x4(%r9),%ecx
   14012fcf2:	sub    %rdx,%rax
   14012fcf5:	sar    $0x3,%rax
   14012fcf9:	cmp    %rax,%rcx
   14012fcfc:	jae    14012c53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c6b>
   14012fd02:	mov    0x1c8(%rsp),%rax
   14012fd0a:	mov    %rax,(%rdx,%rcx,8)
   14012fd0e:	cmpb   $0x0,0x1040(%rbx)
   14012fd15:	je     140137a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14149>
   14012fd1b:	movzbl 0x2(%rbp),%eax
   14012fd1f:	lea    0x29037a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fd26:	add    $0x3,%rbp
   14012fd2a:	xor    %r12d,%r12d
   14012fd2d:	mov    (%rdi,%rax,8),%rax
   14012fd31:	jmp    *%rax
   14012fd33:	cmp    $0x1,%r12b
   14012fd37:	je     140132c34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf364>
   14012fd3d:	mov    -0x8(%rsi),%rax
   14012fd41:	mov    $0x1,%r12d
   14012fd47:	sub    $0x10,%rsi
   14012fd4b:	mov    %rax,0x270(%rsp)
   14012fd53:	mov    (%rsi),%rax
   14012fd56:	mov    %rax,0x268(%rsp)
   14012fd5e:	jmp    1401255ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d1c>
   14012fd63:	cmp    $0x1,%r12b
   14012fd67:	je     140133544 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc74>
   14012fd6d:	mov    -0x8(%rsi),%rax
   14012fd71:	mov    $0x1,%r12d
   14012fd77:	sub    $0x10,%rsi
   14012fd7b:	mov    %rax,0x2b0(%rsp)
   14012fd83:	mov    (%rsi),%rax
   14012fd86:	mov    %rax,0x2a8(%rsp)
   14012fd8e:	mov    %rax,%rdx
   14012fd91:	jmp    140125a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2166>
   14012fd96:	mov    0x1070(%rbx),%rdx
   14012fd9d:	lea    0x8(%rdi),%rax
   14012fda1:	lea    0x48(%rdi),%rcx
   14012fda5:	sub    0x1068(%rbx),%rdx
   14012fdac:	sar    $0x3,%rdx
   14012fdb0:	mov    %rax,0x15268(%rbx)
   14012fdb7:	mov    %rdx,%rax
   14012fdba:	cmp    %rdx,%rcx
   14012fdbd:	jb     140124eeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x161b>
   14012fdc3:	mov    %r8,0x40(%rsp)
   14012fdc8:	add    %rdx,%rdx
   14012fdcb:	lea    0x1068(%rbx),%rcx
   14012fdd2:	vzeroupper
   14012fdd5:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fdda:	mov    0x40(%rsp),%r8
   14012fddf:	jmp    140124ed9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1609>
   14012fde4:	nopl   0x0(%rax)
   14012fde8:	mov    0x1050(%rbx),%rax
   14012fdef:	sub    %rdx,%rax
   14012fdf2:	cmp    %r10,%rax
   14012fdf5:	jb     1401330c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7f8>
   14012fdfb:	mov    %rdi,0x1060(%rbx)
   14012fe02:	cmp    %r9,0x68(%rcx)
   14012fe06:	jae    1401357ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f1f>
   14012fe0c:	mov    0x1060(%rbx),%rax
   14012fe13:	mov    0x1048(%rbx),%rdx
   14012fe1a:	lea    (%rdx,%rax,8),%rsi
   14012fe1e:	jmp    1401266e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e17>
   14012fe23:	mov    0x1070(%rbx),%rdx
   14012fe2a:	lea    0x8(%rdi),%rax
   14012fe2e:	lea    0x48(%rdi),%rcx
   14012fe32:	sub    0x1068(%rbx),%rdx
   14012fe39:	sar    $0x3,%rdx
   14012fe3d:	mov    %rax,0x15268(%rbx)
   14012fe44:	mov    %rdx,%rax
   14012fe47:	cmp    %rdx,%rcx
   14012fe4a:	jb     1401275c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cf4>
   14012fe50:	mov    %r8,0x40(%rsp)
   14012fe55:	add    %rdx,%rdx
   14012fe58:	lea    0x1068(%rbx),%rcx
   14012fe5f:	vzeroupper
   14012fe62:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fe67:	mov    0x40(%rsp),%r8
   14012fe6c:	jmp    1401275b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ce2>
   14012fe71:	nopl   0x0(%rax)
   14012fe78:	cmp    $0x1,%r12b
   14012fe7c:	je     1401330a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7d1>
   14012fe82:	mov    -0x8(%rsi),%rax
   14012fe86:	mov    $0x1,%r12d
   14012fe8c:	sub    $0x10,%rsi
   14012fe90:	mov    %rax,0x2a0(%rsp)
   14012fe98:	mov    (%rsi),%rax
   14012fe9b:	mov    %rax,0x298(%rsp)
   14012fea3:	mov    %rax,%rcx
   14012fea6:	jmp    140125905 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2035>
   14012feab:	cmp    $0x1,%r12b
   14012feaf:	je     1401328d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf007>
   14012feb5:	mov    -0x8(%rsi),%rax
   14012feb9:	mov    $0x1,%r12d
   14012febf:	sub    $0x10,%rsi
   14012fec3:	mov    %rax,0x2e0(%rsp)
   14012fecb:	mov    (%rsi),%rax
   14012fece:	mov    %rax,0x2d8(%rsp)
   14012fed6:	mov    %rax,%rcx
   14012fed9:	jmp    140125dc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24f3>
   14012fede:	cmp    $0x1,%r12b
   14012fee2:	je     1401325bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecec>
   14012fee8:	mov    -0x8(%rsi),%rax
   14012feec:	mov    $0x1,%r12d
   14012fef2:	sub    $0x10,%rsi
   14012fef6:	mov    %rax,0x2c0(%rsp)
   14012fefe:	mov    (%rsi),%rax
   14012ff01:	mov    %rax,0x2b8(%rsp)
   14012ff09:	mov    %rax,%rcx
   14012ff0c:	jmp    140125b65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2295>
   14012ff11:	mov    %r10d,0x60(%rsp)
   14012ff16:	lea    0x20(%rdi),%rdx
   14012ff1a:	lea    0x1068(%rbx),%rcx
   14012ff21:	mov    %r9d,0x80(%rsp)
   14012ff29:	vzeroupper
   14012ff2c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ff31:	mov    0x80(%rsp),%r9d
   14012ff39:	mov    0x60(%rsp),%r10d
   14012ff3e:	jmp    1401276bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ded>
   14012ff43:	mov    0x1070(%rbx),%rdx
   14012ff4a:	lea    0x8(%rdi),%rax
   14012ff4e:	lea    0x48(%rdi),%rcx
   14012ff52:	sub    0x1068(%rbx),%rdx
   14012ff59:	sar    $0x3,%rdx
   14012ff5d:	mov    %rax,0x15268(%rbx)
   14012ff64:	mov    %rdx,%rax
   14012ff67:	cmp    %rdx,%rcx
   14012ff6a:	jb     1401276b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3de4>
   14012ff70:	mov    %r10d,0x60(%rsp)
   14012ff75:	add    %rdx,%rdx
   14012ff78:	lea    0x1068(%rbx),%rcx
   14012ff7f:	mov    %r9d,0x80(%rsp)
   14012ff87:	vzeroupper
   14012ff8a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ff8f:	mov    0x80(%rsp),%r9d
   14012ff97:	mov    0x60(%rsp),%r10d
   14012ff9c:	jmp    1401276a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dd2>
   14012ffa1:	nopl   0x0(%rax)
   14012ffa8:	cmp    $0x1,%r12b
   14012ffac:	je     14013302e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf75e>
   14012ffb2:	mov    -0x8(%rsi),%rax
   14012ffb6:	mov    $0x1,%r12d
   14012ffbc:	sub    $0x10,%rsi
   14012ffc0:	mov    %rax,0x3a0(%rsp)
   14012ffc8:	mov    (%rsi),%rax
   14012ffcb:	mov    %rax,0x398(%rsp)
   14012ffd3:	jmp    140128435 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b65>
   14012ffd8:	cmp    $0x1,%r12b
   14012ffdc:	je     1401326d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee03>
   14012ffe2:	mov    -0x8(%rsi),%rax
   14012ffe6:	mov    $0x1,%r12d
   14012ffec:	sub    $0x10,%rsi
   14012fff0:	mov    %rax,0x200(%rsp)
   14012fff8:	mov    (%rsi),%rax
   14012fffb:	mov    %rax,0x1f8(%rsp)
   140130003:	jmp    1401251ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x191d>
   140130008:	cmp    $0x2,%r12b
   14013000c:	je     140133625 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd55>
   140130012:	mov    -0x8(%rsi),%rdx
   140130016:	lea    -0x8(%rsi),%rax
   14013001a:	mov    %rax,%rsi
   14013001d:	mov    %rdx,0x318(%rsp)
   140130025:	cmp    $0x1,%r12b
   140130029:	jne    140129fff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x672f>
   14013002f:	mov    0x1c8(%rsp),%rdx
   140130037:	lea    -0x8(%rax),%rsi
   14013003b:	xor    %r12d,%r12d
   14013003e:	mov    %rdx,0x320(%rsp)
   140130046:	mov    -0x8(%rax),%rdx
   14013004a:	jmp    14012a012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6742>
   14013004f:	cmp    $0x2,%r12b
   140130053:	je     140132ceb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf41b>
   140130059:	mov    -0x8(%rsi),%rax
   14013005d:	sub    $0x8,%rsi
   140130061:	mov    %rax,0x2f8(%rsp)
   140130069:	jmp    140126046 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2776>
   14013006e:	cmp    $0x1,%r12b
   140130072:	je     1401326af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeddf>
   140130078:	mov    -0x8(%rsi),%rax
   14013007c:	mov    $0x1,%r12d
   140130082:	sub    $0x10,%rsi
   140130086:	mov    %rax,0x280(%rsp)
   14013008e:	mov    (%rsi),%rax
   140130091:	mov    %rax,0x278(%rsp)
   140130099:	jmp    1401256c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1df0>
   14013009e:	cmp    $0x1,%r12b
   1401300a2:	je     140132a5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf18c>
   1401300a8:	mov    -0x8(%rsi),%rax
   1401300ac:	mov    $0x1,%r12d
   1401300b2:	sub    $0x10,%rsi
   1401300b6:	mov    %rax,0x250(%rsp)
   1401300be:	mov    (%rsi),%rax
   1401300c1:	mov    %rax,0x248(%rsp)
   1401300c9:	jmp    1401254d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c04>
   1401300ce:	cmp    $0x2,%r12b
   1401300d2:	je     14013356b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc9b>
   1401300d8:	mov    -0x8(%rsi),%rax
   1401300dc:	sub    $0x8,%rsi
   1401300e0:	mov    %rax,0x300(%rsp)
   1401300e8:	jmp    1401260ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27fe>
   1401300ed:	cmp    $0x1,%r12b
   1401300f1:	je     140132c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3af>
   1401300f7:	mov    -0x8(%rsi),%rax
   1401300fb:	mov    $0x1,%r12d
   140130101:	sub    $0x10,%rsi
   140130105:	mov    %rax,0x360(%rsp)
   14013010d:	mov    (%rsi),%rax
   140130110:	mov    %rax,0x358(%rsp)
   140130118:	jmp    1401280a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47d4>
   14013011d:	mov    %rcx,%rbp
   140130120:	vzeroupper
   140130123:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140130128:	cmp    $0x1,%r12b
   14013012c:	je     140133423 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb53>
   140130132:	mov    -0x8(%rsi),%rax
   140130136:	mov    $0x1,%r12d
   14013013c:	sub    $0x10,%rsi
   140130140:	mov    %rax,0x210(%rsp)
   140130148:	mov    (%rsi),%rax
   14013014b:	mov    %rax,0x208(%rsp)
   140130153:	jmp    1401252a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19d4>
   140130158:	mov    %r8,0x40(%rsp)
   14013015d:	lea    0x20(%rdi),%rdx
   140130161:	lea    0x1068(%rbx),%rcx
   140130168:	vzeroupper
   14013016b:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130170:	mov    0x40(%rsp),%r8
   140130175:	jmp    140124ef4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1624>
   14013017a:	cmp    $0x1,%r12b
   14013017e:	je     14013307a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7aa>
   140130184:	mov    -0x8(%rsi),%rax
   140130188:	mov    $0x1,%r12d
   14013018e:	sub    $0x10,%rsi
   140130192:	mov    %rax,0x2d0(%rsp)
   14013019a:	mov    (%rsi),%rax
   14013019d:	mov    %rax,0x2c8(%rsp)
   1401301a5:	mov    %rax,%rcx
   1401301a8:	jmp    140125c94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23c4>
   1401301ad:	cmp    $0x1,%r12b
   1401301b1:	je     140133596 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcc6>
   1401301b7:	mov    -0x8(%rsi),%rax
   1401301bb:	mov    $0x1,%r12d
   1401301c1:	sub    $0x10,%rsi
   1401301c5:	mov    %rax,0x3d0(%rsp)
   1401301cd:	mov    (%rsi),%rax
   1401301d0:	mov    %rax,0x3c8(%rsp)
   1401301d8:	jmp    140128857 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f87>
   1401301dd:	cmp    $0x1,%r12b
   1401301e1:	je     140132607 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed37>
   1401301e7:	mov    -0x8(%rsi),%rax
   1401301eb:	mov    $0x1,%r12d
   1401301f1:	sub    $0x10,%rsi
   1401301f5:	mov    %rax,0x260(%rsp)
   1401301fd:	mov    (%rsi),%rax
   140130200:	mov    %rax,0x258(%rsp)
   140130208:	jmp    140125560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c90>
   14013020d:	cmp    $0x1,%r12b
   140130211:	je     140132ca3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3d3>
   140130217:	mov    -0x8(%rsi),%rax
   14013021b:	mov    $0x1,%r12d
   140130221:	sub    $0x10,%rsi
   140130225:	mov    %rax,0x3b0(%rsp)
   14013022d:	mov    (%rsi),%rax
   140130230:	mov    %rax,0x3a8(%rsp)
   140130238:	jmp    140128595 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc5>
   14013023d:	cmp    $0x1,%r12b
   140130241:	je     140132a0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf13c>
   140130247:	mov    -0x8(%rsi),%rax
   14013024b:	mov    $0x1,%r12d
   140130251:	sub    $0x10,%rsi
   140130255:	mov    %rax,0x230(%rsp)
   14013025d:	mov    (%rsi),%rax
   140130260:	mov    %rax,0x228(%rsp)
   140130268:	jmp    1401253bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aec>
   14013026d:	mov    0x1c8(%rsp),%rax
   140130275:	mov    $0x2,%r12d
   14013027b:	mov    %rax,0x1d0(%rsp)
   140130283:	movabs $0xfff8000000000000,%rax
   14013028d:	mov    %rax,0x1c8(%rsp)
   140130295:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14013029a:	mov    0x1048(%rbx),%rdx
   1401302a1:	mov    %rax,%rbp
   1401302a4:	vzeroupper
   1401302a7:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   1401302ac:	mov    0x15270(%rbx),%rax
   1401302b3:	mov    0x152a0(%rbx),%rdx
   1401302ba:	cmp    %rdx,0x68(%rax)
   1401302be:	jae    140133ecb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105fb>
   1401302c4:	cmpb   $0x0,0x152c1(%rbx)
   1401302cb:	je     14013173d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde6d>
   1401302d1:	cmpq   $0x0,0x152e0(%rbx)
   1401302d9:	je     14013173d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde6d>
   1401302df:	cmp    $0x2,%r12b
   1401302e3:	je     140134d18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11448>
   1401302e9:	cmp    $0x1,%r12b
   1401302ed:	je     140138076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147a6>
   1401302f3:	mov    0x1048(%rbx),%rdx
   1401302fa:	mov    0x1050(%rbx),%rax
   140130301:	mov    %rsi,%rcx
   140130304:	sub    %rdx,%rax
   140130307:	sub    %rdx,%rcx
   14013030a:	mov    %rcx,%r12
   14013030d:	sar    $0x3,%r12
   140130311:	cmp    %rcx,%rax
   140130314:	jb     1401356a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11dd9>
   14013031a:	movswq %di,%rax
   14013031e:	mov    %r12,0x1060(%rbx)
   140130325:	lea    0x2(%rbp,%rax,1),%rax
   14013032a:	sub    %r15,%rax
   14013032d:	mov    %rax,0x40(%rsp)
   140130332:	and    0x15300(%rbx),%rax
   140130339:	mov    %rax,%r10
   14013033c:	shl    $0x5,%r10
   140130340:	add    0x152e0(%rbx),%r10
   140130347:	cmpq   $0x0,(%r10)
   14013034b:	je     14013449b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bcb>
   140130351:	mov    0x1068(%rbx),%rdx
   140130358:	lea    0x560(%rsp),%r12
   140130360:	xor    %eax,%eax
   140130362:	mov    $0x23,%ecx
   140130367:	mov    %r12,%rdi
   14013036a:	rep stos %rax,(%rdi)
   14013036d:	lea    (%rdx,%r13,8),%rax
   140130371:	movb   $0x1,0x668(%rsp)
   140130379:	mov    %rax,0x570(%rsp)
   140130381:	mov    0x1070(%rbx),%rax
   140130388:	mov    %rbx,0x560(%rsp)
   140130390:	sub    %rdx,%rax
   140130393:	mov    0x1048(%rbx),%rdx
   14013039a:	sar    $0x3,%rax
   14013039e:	sub    %r13,%rax
   1401303a1:	mov    %rdx,0x580(%rsp)
   1401303a9:	mov    %rax,0x578(%rsp)
   1401303b1:	mov    %rsi,%rax
   1401303b4:	sub    %rdx,%rax
   1401303b7:	mov    0x150c0(%rbx),%rdx
   1401303be:	sar    $0x3,%rax
   1401303c2:	mov    %rax,0x588(%rsp)
   1401303ca:	xor    %eax,%eax
   1401303cc:	test   %rdx,%rdx
   1401303cf:	je     1401303dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb0d>
   1401303d1:	imul   $0x28,%rdx,%rdx
   1401303d5:	lea    0x1098(%rbx,%rdx,1),%rax
   1401303dd:	mov    %r10,0x60(%rsp)
   1401303e2:	vmovq  %rax,%xmm7
   1401303e7:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401303f1:	mov    %r12,0x152b8(%rbx)
   1401303f8:	vmovdqa %xmm0,0x590(%rsp)
   140130401:	vzeroupper
   140130404:	call   1402128e0 <tersun::VMTelemetryManager::instance()>
   140130409:	mov    0x60(%rsp),%r10
   14013040e:	cmpb   $0x0,(%rax)
   140130411:	je     140130418 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb48>
   140130413:	addq   $0x1,0x78(%rax)
   140130418:	mov    %r12,%rdx
   14013041b:	mov    %rbx,%rcx
   14013041e:	call   *(%r10)
   140130421:	mov    %rax,%r12
   140130424:	mov    0x598(%rsp),%rax
   14013042c:	mov    %rax,0x152b8(%rbx)
   140130433:	cmpq   $0x0,0x5a8(%rsp)
   14013043c:	jg     14013788a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fba>
   140130442:	mov    0x150c0(%rbx),%rax
   140130449:	test   %rax,%rax
   14013044c:	je     14013786d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f9d>
   140130452:	lea    (%rax,%rax,4),%rdx
   140130456:	sub    $0x1,%rax
   14013045a:	lea    (%rbx,%rdx,8),%rdx
   14013045e:	mov    0x1098(%rdx),%rdi
   140130465:	mov    0x10a0(%rdx),%rcx
   14013046c:	mov    0x10a8(%rdx),%rsi
   140130473:	mov    %rax,0x150c0(%rbx)
   14013047a:	cmpb   $0x0,0x15211(%rbx)
   140130481:	je     1401379bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140ef>
   140130487:	mov    %rcx,0x15268(%rbx)
   14013048e:	mov    0x1048(%rbx),%rdx
   140130495:	mov    0x150c0(%rbx),%r13
   14013049c:	lea    (%rdx,%rsi,8),%rax
   1401304a0:	mov    %r12,(%rax)
   1401304a3:	lea    0x8(%rax),%rsi
   1401304a7:	test   %r13,%r13
   1401304aa:	je     1401304bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbec>
   1401304ac:	lea    -0x1(%r13),%rax
   1401304b0:	imul   $0x28,%rax,%rax
   1401304b4:	mov    0x10c8(%rbx,%rax,1),%r13
   1401304bc:	lea    (%r15,%rdi,1),%rcx
   1401304c0:	cmpb   $0x0,0x1040(%rbx)
   1401304c7:	je     14012a339 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   1401304cd:	movzbl (%rcx),%eax
   1401304d0:	lea    0x28fbc9(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401304d7:	lea    0x1(%rcx),%rbp
   1401304db:	xor    %r12d,%r12d
   1401304de:	mov    (%rdi,%rax,8),%rax
   1401304e2:	jmp    *%rax
   1401304e4:	cmp    $0x1,%r12b
   1401304e8:	je     14013328e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9be>
   1401304ee:	mov    -0x8(%rsi),%rax
   1401304f2:	mov    $0x1,%r12d
   1401304f8:	sub    $0x10,%rsi
   1401304fc:	mov    %rax,0x1f0(%rsp)
   140130504:	mov    (%rsi),%rax
   140130507:	mov    %rax,0x1e8(%rsp)
   14013050f:	jmp    140125136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1866>
   140130514:	cmp    $0x1,%r12b
   140130518:	je     1401325e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed13>
   14013051e:	mov    -0x8(%rsi),%rax
   140130522:	mov    $0x1,%r12d
   140130528:	sub    $0x10,%rsi
   14013052c:	mov    %rax,0x1e0(%rsp)
   140130534:	mov    (%rsi),%rax
   140130537:	mov    %rax,0x1d8(%rsp)
   14013053f:	jmp    14012507f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17af>
   140130544:	lea    0x8(%r8),%rdx
   140130548:	lea    0x48(%r8),%r9
   14013054c:	mov    %rdx,0x15268(%rbx)
   140130553:	mov    0x1070(%rbx),%rdx
   14013055a:	sub    0x1068(%rbx),%rdx
   140130561:	sar    $0x3,%rdx
   140130565:	mov    %rdx,%rcx
   140130568:	cmp    %rdx,%r9
   14013056b:	jb     140127a6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x419e>
   140130571:	mov    %r8,0x60(%rsp)
   140130576:	add    %rdx,%rdx
   140130579:	lea    0x1068(%rbx),%rcx
   140130580:	mov    %r10d,0x80(%rsp)
   140130588:	vzeroupper
   14013058b:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130590:	mov    0x80(%rsp),%r10d
   140130598:	mov    0x60(%rsp),%r8
   14013059d:	jmp    140127a5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x418c>
   1401305a2:	nopw   0x0(%rax,%rax,1)
   1401305a8:	cmp    $0x1,%r12b
   1401305ac:	je     140132cc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3f7>
   1401305b2:	mov    -0x8(%rsi),%rax
   1401305b6:	mov    $0x1,%r12d
   1401305bc:	sub    $0x10,%rsi
   1401305c0:	mov    %rax,0x240(%rsp)
   1401305c8:	mov    (%rsi),%rax
   1401305cb:	mov    %rax,0x238(%rsp)
   1401305d3:	jmp    140125448 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b78>
   1401305d8:	cmp    $0x1,%r12b
   1401305dc:	je     140132e99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5c9>
   1401305e2:	mov    -0x8(%rsi),%rax
   1401305e6:	mov    $0x1,%r12d
   1401305ec:	sub    $0x10,%rsi
   1401305f0:	mov    %rax,0x220(%rsp)
   1401305f8:	mov    (%rsi),%rax
   1401305fb:	mov    %rax,0x218(%rsp)
   140130603:	jmp    140125330 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a60>
   140130608:	mov    %rax,%rbp
   14013060b:	jmp    14012a2c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f6>
   140130610:	cmp    $0x2,%r12b
   140130614:	je     140133052 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf782>
   14013061a:	mov    -0x8(%rsi),%rdx
   14013061e:	lea    -0x8(%rsi),%rax
   140130622:	mov    %rax,%rsi
   140130625:	mov    %rdx,0x340(%rsp)
   14013062d:	cmp    $0x1,%r12b
   140130631:	jne    140127f41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4671>
   140130637:	mov    0x1c8(%rsp),%rdx
   14013063f:	lea    -0x8(%rax),%rsi
   140130643:	xor    %r12d,%r12d
   140130646:	mov    %rdx,0x348(%rsp)
   14013064e:	mov    -0x8(%rax),%rdi
   140130652:	jmp    140127f54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4684>
   140130657:	mov    0x1050(%rbx),%rax
   14013065e:	sub    %rdx,%rax
   140130661:	cmp    %r11,%rax
   140130664:	jb     1401334b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbe9>
   14013066a:	mov    %r10,0x1060(%rbx)
   140130671:	cmp    %r9,0x68(%rcx)
   140130675:	jae    140133aa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101d8>
   14013067b:	mov    0x1060(%rbx),%rax
   140130682:	mov    0x1048(%rbx),%rdx
   140130689:	lea    (%rdx,%rax,8),%rsi
   14013068d:	jmp    1401265e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d11>
   140130692:	mov    %r8,0x40(%rsp)
   140130697:	lea    0x20(%rdi),%rdx
   14013069b:	lea    0x1080(%rbx),%rcx
   1401306a2:	vzeroupper
   1401306a5:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401306aa:	mov    0x40(%rsp),%r8
   1401306af:	jmp    140124ff2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1722>
   1401306b4:	lea    0x20(%rdi),%rdx
   1401306b8:	lea    0x1068(%rbx),%rcx
   1401306bf:	mov    %r8d,0x60(%rsp)
   1401306c4:	mov    %r9d,0x80(%rsp)
   1401306cc:	mov    %eax,0x40(%rsp)
   1401306d0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401306d5:	mov    0x60(%rsp),%r8d
   1401306da:	mov    0x40(%rsp),%eax
   1401306de:	mov    0x80(%rsp),%r9d
   1401306e6:	jmp    140124894 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc4>
   1401306eb:	cmp    $0x1,%r12b
   1401306ef:	je     140132396 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeac6>
   1401306f5:	mov    -0x8(%rsi),%rax
   1401306f9:	mov    $0x1,%r12d
   1401306ff:	sub    $0x10,%rsi
   140130703:	mov    %rax,0x290(%rsp)
   14013070b:	mov    (%rsi),%rax
   14013070e:	mov    %rax,0x288(%rsp)
   140130716:	jmp    1401257e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f11>
   14013071b:	mov    %r9,0x40(%rsp)
   140130720:	add    %rdx,%rdx
   140130723:	lea    0x1068(%rbx),%rcx
   14013072a:	vzeroupper
   14013072d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130732:	mov    0x40(%rsp),%r9
   140130737:	jmp    140126568 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c98>
   14013073c:	mov    %r8,0x60(%rsp)
   140130741:	lea    0x20(%r8),%rdx
   140130745:	lea    0x1068(%rbx),%rcx
   14013074c:	mov    %r10d,0x80(%rsp)
   140130754:	vzeroupper
   140130757:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013075c:	mov    0x80(%rsp),%r10d
   140130764:	mov    0x60(%rsp),%r8
   140130769:	jmp    140127a77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41a7>
   14013076e:	mov    %rax,0x40(%rsp)
   140130773:	lea    0x20(%rax),%rdx
   140130777:	lea    0x1080(%rbx),%rcx
   14013077e:	vzeroupper
   140130781:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130786:	mov    0x40(%rsp),%rax
   14013078b:	jmp    140124f5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x168a>
   140130790:	mov    %rax,0x40(%rsp)
   140130795:	lea    0x20(%rax),%rdx
   140130799:	lea    0x1068(%rbx),%rcx
   1401307a0:	vzeroupper
   1401307a3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401307a8:	mov    0x40(%rsp),%rax
   1401307ad:	jmp    140124e4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x157c>
   1401307b2:	cmp    $0x1,%r12b
   1401307b6:	je     140132c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf388>
   1401307bc:	mov    -0x8(%rsi),%rax
   1401307c0:	mov    $0x1,%r12d
   1401307c6:	sub    $0x10,%rsi
   1401307ca:	mov    %rax,0x2f0(%rsp)
   1401307d2:	mov    (%rsi),%rax
   1401307d5:	mov    %rax,0x2e8(%rsp)
   1401307dd:	mov    %rax,%rcx
   1401307e0:	jmp    140125ef2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2622>
   1401307e5:	cmp    $0x1,%r12b
   1401307e9:	je     1401324af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebdf>
   1401307ef:	mov    -0x8(%rsi),%rax
   1401307f3:	mov    -0x10(%rsi),%rdi
   1401307f7:	sub    $0x10,%rsi
   1401307fb:	mov    %rax,0x3f0(%rsp)
   140130803:	jmp    14012c54e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c7e>
   140130808:	lea    0x8(%rdi),%rdx
   14013080c:	lea    0x48(%rdi),%r8
   140130810:	mov    %rdx,0x15268(%rbx)
   140130817:	mov    0x1070(%rbx),%rdx
   14013081e:	sub    0x1068(%rbx),%rdx
   140130825:	sar    $0x3,%rdx
   140130829:	mov    %rdx,%rcx
   14013082c:	cmp    %rdx,%r8
   14013082f:	jb     140127779 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ea9>
   140130835:	mov    %r10d,0x60(%rsp)
   14013083a:	add    %rdx,%rdx
   14013083d:	lea    0x1068(%rbx),%rcx
   140130844:	mov    %eax,0x80(%rsp)
   14013084b:	mov    %r9d,0x40(%rsp)
   140130850:	vzeroupper
   140130853:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130858:	mov    0x80(%rsp),%eax
   14013085f:	mov    0x60(%rsp),%r10d
   140130864:	mov    0x40(%rsp),%r9d
   140130869:	jmp    140127767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e97>
   14013086e:	xchg   %ax,%ax
   140130870:	mov    %r10d,0x60(%rsp)
   140130875:	lea    0x20(%rdi),%rdx
   140130879:	lea    0x1068(%rbx),%rcx
   140130880:	mov    %eax,0x80(%rsp)
   140130887:	mov    %r9d,0x40(%rsp)
   14013088c:	vzeroupper
   14013088f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130894:	mov    0x80(%rsp),%eax
   14013089b:	mov    0x60(%rsp),%r10d
   1401308a0:	mov    0x40(%rsp),%r9d
   1401308a5:	jmp    140127782 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3eb2>
   1401308aa:	vzeroupper
   1401308ad:	mov    0x1048(%rbx),%rdx
   1401308b4:	mov    %r9,%rbp
   1401308b7:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   1401308bc:	mov    %r9,0x40(%rsp)
   1401308c1:	lea    0x400(%rsp),%rcx
   1401308c9:	lea    0x3e0(%rsp),%rdx
   1401308d1:	vzeroupper
   1401308d4:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   1401308d9:	mov    0x40(%rsp),%r9
   1401308de:	lea    0x22b1e1(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   1401308e5:	movzwl 0x6(%r9),%eax
   1401308ea:	shl    $0x5,%rax
   1401308ee:	add    0x30(%r14),%rax
   1401308f2:	mov    %rax,%rcx
   1401308f5:	mov    %rax,%rdi
   1401308f8:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401308fd:	test   %al,%al
   1401308ff:	jne    1401316f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde29>
   140130905:	lea    0x22b1be(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14013090c:	mov    %rdi,%rcx
   14013090f:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130914:	test   %al,%al
   140130916:	jne    1401316f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde29>
   14013091c:	lea    0x22b1d3(%rip),%rdx        # 14035baf6 <.rdata+0x536>
   140130923:	mov    %rdi,%rcx
   140130926:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14013092b:	test   %al,%al
   14013092d:	jne    1401349fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1112e>
   140130933:	lea    0x22b1be(%rip),%rdx        # 14035baf8 <.rdata+0x538>
   14013093a:	mov    %rdi,%rcx
   14013093d:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130942:	test   %al,%al
   140130944:	jne    1401349fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1112e>
   14013094a:	lea    0x22b1a9(%rip),%rdx        # 14035bafa <.rdata+0x53a>
   140130951:	mov    %rdi,%rcx
   140130954:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130959:	test   %al,%al
   14013095b:	jne    140135e70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125a0>
   140130961:	lea    0x22b194(%rip),%rdx        # 14035bafc <.rdata+0x53c>
   140130968:	mov    %rdi,%rcx
   14013096b:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130970:	test   %al,%al
   140130972:	jne    140135e70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125a0>
   140130978:	lea    0x22b17f(%rip),%rdx        # 14035bafe <.rdata+0x53e>
   14013097f:	mov    %rdi,%rcx
   140130982:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130987:	test   %al,%al
   140130989:	jne    140135e17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12547>
   14013098f:	lea    0x22b16a(%rip),%rdx        # 14035bb00 <.rdata+0x540>
   140130996:	mov    %rdi,%rcx
   140130999:	call   14032f920 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14013099e:	test   %al,%al
   1401309a0:	jne    140135e17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12547>
   1401309a6:	test   %r12b,%r12b
   1401309a9:	jne    140138352 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a82>
   1401309af:	mov    $0x1fff,%eax
   1401309b4:	mov    $0x1,%r12d
   1401309ba:	shl    $0x33,%rax
   1401309be:	mov    %rax,0x1c8(%rsp)
   1401309c6:	cmpb   $0x0,0x1040(%rbx)
   1401309cd:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   1401309d3:	movzbl 0x2(%rbp),%eax
   1401309d7:	lea    0x28f6c2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401309de:	add    $0x3,%rbp
   1401309e2:	mov    (%rdi,%rax,8),%rax
   1401309e6:	jmp    *%rax
   1401309e8:	shr    $0x20,%rax
   1401309ec:	mov    %eax,%edx
   1401309ee:	test   %ax,%ax
   1401309f1:	jne    14012e2a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9d1>
   1401309f7:	lea    0x680(%rsp),%rcx
   1401309ff:	lea    0x2e0(%rsp),%rdx
   140130a07:	vzeroupper
   140130a0a:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130a0f:	lea    0x2d8(%rsp),%rdx
   140130a17:	lea    0x540(%rsp),%rcx
   140130a1f:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130a24:	mov    0x540(%rsp),%rcx
   140130a2c:	mov    0x688(%rsp),%r9
   140130a34:	mov    0x680(%rsp),%r8
   140130a3c:	mov    0x548(%rsp),%rdx
   140130a44:	mov    %rcx,0x40(%rsp)
   140130a49:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140130a4e:	mov    0x40(%rsp),%rcx
   140130a53:	mov    %eax,%edi
   140130a55:	lea    0x550(%rsp),%rax
   140130a5d:	cmp    %rax,%rcx
   140130a60:	je     140130a73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1a3>
   140130a62:	mov    0x550(%rsp),%rax
   140130a6a:	lea    0x1(%rax),%rdx
   140130a6e:	call   140338430 <operator delete(void*, unsigned long long)>
   140130a73:	mov    0x680(%rsp),%rcx
   140130a7b:	lea    0x690(%rsp),%rax
   140130a83:	cmp    %rax,%rcx
   140130a86:	je     140130a99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1c9>
   140130a88:	mov    0x690(%rsp),%rax
   140130a90:	lea    0x1(%rax),%rdx
   140130a94:	call   140338430 <operator delete(void*, unsigned long long)>
   140130a99:	test   %edi,%edi
   140130a9b:	setg   %al
   140130a9e:	jmp    140125e6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   140130aa3:	mov    %rax,%rdx
   140130aa6:	shr    $0x20,%rdx
   140130aaa:	cmp    $0x5,%dx
   140130aae:	je     140125d16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   140130ab4:	movabs $0xffffffff00000000,%rdx
   140130abe:	and    %rdx,%rcx
   140130ac1:	jmp    14012e397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac7>
   140130ac6:	shr    $0x20,%rax
   140130aca:	mov    %eax,%r8d
   140130acd:	test   %ax,%ax
   140130ad0:	jne    140131c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe37b>
   140130ad6:	lea    0x680(%rsp),%rcx
   140130ade:	lea    0x3d0(%rsp),%rdx
   140130ae6:	vzeroupper
   140130ae9:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130aee:	lea    0x3c8(%rsp),%rdx
   140130af6:	lea    0x540(%rsp),%rcx
   140130afe:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130b03:	mov    0x540(%rsp),%rcx
   140130b0b:	mov    0x688(%rsp),%r9
   140130b13:	mov    0x680(%rsp),%r8
   140130b1b:	mov    0x548(%rsp),%rdx
   140130b23:	mov    %rcx,0x40(%rsp)
   140130b28:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140130b2d:	mov    0x40(%rsp),%rcx
   140130b32:	mov    %eax,%edi
   140130b34:	lea    0x550(%rsp),%rax
   140130b3c:	cmp    %rax,%rcx
   140130b3f:	je     140130b52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd282>
   140130b41:	mov    0x550(%rsp),%rax
   140130b49:	lea    0x1(%rax),%rdx
   140130b4d:	call   140338430 <operator delete(void*, unsigned long long)>
   140130b52:	mov    0x680(%rsp),%rcx
   140130b5a:	lea    0x690(%rsp),%rax
   140130b62:	cmp    %rax,%rcx
   140130b65:	je     140130b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2a8>
   140130b67:	mov    0x690(%rsp),%rax
   140130b6f:	lea    0x1(%rax),%rdx
   140130b73:	call   140338430 <operator delete(void*, unsigned long long)>
   140130b78:	mov    %edi,%eax
   140130b7a:	not    %eax
   140130b7c:	shr    $0x1f,%eax
   140130b7f:	jmp    140128933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5063>
   140130b84:	shr    $0x20,%rdx
   140130b88:	mov    %edx,%eax
   140130b8a:	test   %dx,%dx
   140130b8d:	jne    14012e441 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab71>
   140130b93:	lea    0x680(%rsp),%r10
   140130b9b:	lea    0x2a0(%rsp),%rdx
   140130ba3:	mov    %r10,0x60(%rsp)
   140130ba8:	mov    %r10,%rcx
   140130bab:	vzeroupper
   140130bae:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130bb3:	lea    0x540(%rsp),%rax
   140130bbb:	lea    0x298(%rsp),%rdx
   140130bc3:	mov    %rax,%rcx
   140130bc6:	mov    %rax,0x40(%rsp)
   140130bcb:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130bd0:	mov    0x40(%rsp),%rcx
   140130bd5:	mov    0x60(%rsp),%rdx
   140130bda:	call   14032f980 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140130bdf:	mov    0x540(%rsp),%rcx
   140130be7:	mov    %eax,%edi
   140130be9:	lea    0x550(%rsp),%rax
   140130bf1:	cmp    %rax,%rcx
   140130bf4:	je     140130c07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd337>
   140130bf6:	mov    0x550(%rsp),%rax
   140130bfe:	lea    0x1(%rax),%rdx
   140130c02:	call   140338430 <operator delete(void*, unsigned long long)>
   140130c07:	mov    0x680(%rsp),%rcx
   140130c0f:	lea    0x690(%rsp),%rax
   140130c17:	cmp    %rax,%rcx
   140130c1a:	je     1401259ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   140130c20:	mov    0x690(%rsp),%rax
   140130c28:	lea    0x1(%rax),%rdx
   140130c2c:	call   140338430 <operator delete(void*, unsigned long long)>
   140130c31:	jmp    1401259ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   140130c36:	mov    %rdx,%rax
   140130c39:	shr    $0x20,%rax
   140130c3d:	cmp    $0x5,%ax
   140130c41:	je     140125987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   140130c47:	movabs $0xffffffff00000000,%rax
   140130c51:	and    %rax,%rcx
   140130c54:	jmp    14012e41f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab4f>
   140130c59:	mov    %rax,%rdx
   140130c5c:	shr    $0x20,%rdx
   140130c60:	cmp    $0x5,%dx
   140130c64:	je     140125e45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   140130c6a:	movabs $0xffffffff00000000,%rdx
   140130c74:	and    %rdx,%rcx
   140130c77:	jmp    14012e27f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9af>
   140130c7c:	shr    $0x20,%rax
   140130c80:	mov    %eax,%edx
   140130c82:	test   %ax,%ax
   140130c85:	jne    14012e335 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa65>
   140130c8b:	lea    0x680(%rsp),%rcx
   140130c93:	lea    0x2f0(%rsp),%rdx
   140130c9b:	vzeroupper
   140130c9e:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130ca3:	lea    0x2e8(%rsp),%rdx
   140130cab:	lea    0x540(%rsp),%rcx
   140130cb3:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130cb8:	mov    0x540(%rsp),%rcx
   140130cc0:	mov    0x688(%rsp),%r9
   140130cc8:	mov    0x680(%rsp),%r8
   140130cd0:	mov    0x548(%rsp),%rdx
   140130cd8:	mov    %rcx,0x40(%rsp)
   140130cdd:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140130ce2:	mov    0x40(%rsp),%rcx
   140130ce7:	mov    %eax,%edi
   140130ce9:	lea    0x550(%rsp),%rax
   140130cf1:	cmp    %rax,%rcx
   140130cf4:	je     140130d07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd437>
   140130cf6:	mov    0x550(%rsp),%rax
   140130cfe:	lea    0x1(%rax),%rdx
   140130d02:	call   140338430 <operator delete(void*, unsigned long long)>
   140130d07:	mov    0x680(%rsp),%rcx
   140130d0f:	lea    0x690(%rsp),%rax
   140130d17:	cmp    %rax,%rcx
   140130d1a:	je     140130d2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd45d>
   140130d1c:	mov    0x690(%rsp),%rax
   140130d24:	lea    0x1(%rax),%rdx
   140130d28:	call   140338430 <operator delete(void*, unsigned long long)>
   140130d2d:	mov    %edi,%eax
   140130d2f:	not    %eax
   140130d31:	shr    $0x1f,%eax
   140130d34:	jmp    140125f9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   140130d39:	mov    %rax,%rdx
   140130d3c:	shr    $0x20,%rdx
   140130d40:	cmp    $0x5,%dx
   140130d44:	je     140125f74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   140130d4a:	movabs $0xffffffff00000000,%rdx
   140130d54:	and    %rdx,%rcx
   140130d57:	jmp    14012e313 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa43>
   140130d5c:	shr    $0x20,%rax
   140130d60:	mov    %eax,%r8d
   140130d63:	test   %ax,%ax
   140130d66:	jne    140131e73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5a3>
   140130d6c:	lea    0x680(%rsp),%rcx
   140130d74:	lea    0x390(%rsp),%rdx
   140130d7c:	vzeroupper
   140130d7f:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130d84:	lea    0x388(%rsp),%rdx
   140130d8c:	lea    0x540(%rsp),%rcx
   140130d94:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130d99:	mov    0x540(%rsp),%rcx
   140130da1:	mov    0x688(%rsp),%r9
   140130da9:	mov    0x680(%rsp),%r8
   140130db1:	mov    0x548(%rsp),%rdx
   140130db9:	mov    %rcx,0x40(%rsp)
   140130dbe:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140130dc3:	mov    0x40(%rsp),%rcx
   140130dc8:	mov    %eax,%edi
   140130dca:	lea    0x550(%rsp),%rax
   140130dd2:	cmp    %rax,%rcx
   140130dd5:	je     140130de8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd518>
   140130dd7:	mov    0x550(%rsp),%rax
   140130ddf:	lea    0x1(%rax),%rdx
   140130de3:	call   140338430 <operator delete(void*, unsigned long long)>
   140130de8:	mov    0x680(%rsp),%rcx
   140130df0:	lea    0x690(%rsp),%rax
   140130df8:	cmp    %rax,%rcx
   140130dfb:	je     140130e0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd53e>
   140130dfd:	mov    0x690(%rsp),%rax
   140130e05:	lea    0x1(%rax),%rdx
   140130e09:	call   140338430 <operator delete(void*, unsigned long long)>
   140130e0e:	shr    $0x1f,%edi
   140130e11:	mov    %edi,%eax
   140130e13:	jmp    1401283b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae1>
   140130e18:	shr    $0x20,%rax
   140130e1c:	mov    %eax,%edx
   140130e1e:	test   %ax,%ax
   140130e21:	jne    14012e3b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaae9>
   140130e27:	lea    0x680(%rsp),%rcx
   140130e2f:	lea    0x2d0(%rsp),%rdx
   140130e37:	vzeroupper
   140130e3a:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130e3f:	lea    0x2c8(%rsp),%rdx
   140130e47:	lea    0x540(%rsp),%rcx
   140130e4f:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140130e54:	mov    0x540(%rsp),%rcx
   140130e5c:	mov    0x688(%rsp),%r9
   140130e64:	mov    0x680(%rsp),%r8
   140130e6c:	mov    0x548(%rsp),%rdx
   140130e74:	mov    %rcx,0x40(%rsp)
   140130e79:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140130e7e:	mov    0x40(%rsp),%rcx
   140130e83:	mov    %eax,%edi
   140130e85:	lea    0x550(%rsp),%rax
   140130e8d:	cmp    %rax,%rcx
   140130e90:	je     140130ea3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d3>
   140130e92:	mov    0x550(%rsp),%rax
   140130e9a:	lea    0x1(%rax),%rdx
   140130e9e:	call   140338430 <operator delete(void*, unsigned long long)>
   140130ea3:	mov    0x680(%rsp),%rcx
   140130eab:	lea    0x690(%rsp),%rax
   140130eb3:	cmp    %rax,%rcx
   140130eb6:	je     140130ec9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5f9>
   140130eb8:	mov    0x690(%rsp),%rax
   140130ec0:	lea    0x1(%rax),%rdx
   140130ec4:	call   140338430 <operator delete(void*, unsigned long long)>
   140130ec9:	test   %edi,%edi
   140130ecb:	setle  %al
   140130ece:	jmp    140125d3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   140130ed3:	lea    0x680(%rsp),%rcx
   140130edb:	lea    0x308(%rsp),%rdx
   140130ee3:	vzeroupper
   140130ee6:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   140130eeb:	mov    0x680(%rsp),%rax
   140130ef3:	lea    0x310(%rsp),%rcx
   140130efb:	mov    0x690(%rsp),%edi
   140130f02:	mov    %rax,0x60(%rsp)
   140130f07:	mov    0x688(%rsp),%rax
   140130f0f:	mov    %rax,0x40(%rsp)
   140130f14:	call   14021a530 <setun::VMValue::as_int() const>
   140130f19:	test   %rax,%rax
   140130f1c:	jne    140131dc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4f5>
   140130f22:	test   %r12b,%r12b
   140130f25:	je     140135b64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12294>
   140130f2b:	cmp    $0x1,%r12b
   140130f2f:	je     140137e81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145b1>
   140130f35:	lea    0x8(%rsi),%r8
   140130f39:	cmp    0x38(%rsp),%r8
   140130f3e:	jae    140137e2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1455f>
   140130f44:	mov    0x1d0(%rsp),%rax
   140130f4c:	mov    0x60(%rsp),%rdx
   140130f51:	mov    %r8,0x40(%rsp)
   140130f56:	mov    %rax,(%rsi)
   140130f59:	mov    0x1c8(%rsp),%rax
   140130f61:	mov    %rax,0x1d0(%rsp)
   140130f69:	lea    0x540(%rsp),%rcx
   140130f71:	mov    $0x2,%r12d
   140130f77:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140130f7c:	mov    0x540(%rsp),%rax
   140130f84:	mov    0x40(%rsp),%rsi
   140130f89:	mov    %rax,0x1c8(%rsp)
   140130f91:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140130f96:	mov    0x290(%rsp),%rax
   140130f9e:	mov    %rax,0x1c8(%rsp)
   140130fa6:	jmp    140125896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   140130fab:	cmp    $0x2,%r12b
   140130faf:	jne    140137b0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1423d>
   140130fb5:	mov    0x1048(%rbx),%rdx
   140130fbc:	lea    0x10(%rsi),%r8
   140130fc0:	cmp    0x38(%rsp),%r8
   140130fc5:	jae    140137abc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141ec>
   140130fcb:	mov    0x1d0(%rsp),%rax
   140130fd3:	mov    %rax,(%rsi)
   140130fd6:	mov    0x1c8(%rsp),%rax
   140130fde:	mov    %rax,0x8(%rsi)
   140130fe2:	mov    %r8,%rsi
   140130fe5:	mov    0x1068(%rbx),%r8
   140130fec:	jmp    14012632d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   140130ff1:	shr    $0x20,%rax
   140130ff5:	mov    %eax,%edx
   140130ff7:	test   %ax,%ax
   140130ffa:	jne    14012e4c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf1>
   140131000:	lea    0x680(%rsp),%rcx
   140131008:	lea    0x2c0(%rsp),%rdx
   140131010:	vzeroupper
   140131013:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140131018:	lea    0x2b8(%rsp),%rdx
   140131020:	lea    0x540(%rsp),%rcx
   140131028:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013102d:	mov    0x540(%rsp),%rcx
   140131035:	mov    0x688(%rsp),%r9
   14013103d:	mov    0x680(%rsp),%r8
   140131045:	mov    0x548(%rsp),%rdx
   14013104d:	mov    %rcx,0x40(%rsp)
   140131052:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131057:	mov    0x40(%rsp),%rcx
   14013105c:	mov    %eax,%edi
   14013105e:	lea    0x550(%rsp),%rax
   140131066:	cmp    %rax,%rcx
   140131069:	je     14013107c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7ac>
   14013106b:	mov    0x550(%rsp),%rax
   140131073:	lea    0x1(%rax),%rdx
   140131077:	call   140338430 <operator delete(void*, unsigned long long)>
   14013107c:	mov    0x680(%rsp),%rcx
   140131084:	lea    0x690(%rsp),%rax
   14013108c:	cmp    %rax,%rcx
   14013108f:	je     1401310a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7d2>
   140131091:	mov    0x690(%rsp),%rax
   140131099:	lea    0x1(%rax),%rdx
   14013109d:	call   140338430 <operator delete(void*, unsigned long long)>
   1401310a2:	shr    $0x1f,%edi
   1401310a5:	mov    %edi,%eax
   1401310a7:	jmp    140125c0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   1401310ac:	mov    %rax,%rdx
   1401310af:	shr    $0x20,%rdx
   1401310b3:	cmp    $0x5,%dx
   1401310b7:	je     140125be7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   1401310bd:	movabs $0xffffffff00000000,%rdx
   1401310c7:	and    %rdx,%rcx
   1401310ca:	jmp    14012e49f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabcf>
   1401310cf:	shr    $0x20,%rax
   1401310d3:	mov    %eax,%r8d
   1401310d6:	test   %ax,%ax
   1401310d9:	jne    140131ed9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe609>
   1401310df:	lea    0x680(%rsp),%rcx
   1401310e7:	lea    0x3a0(%rsp),%rdx
   1401310ef:	vzeroupper
   1401310f2:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   1401310f7:	lea    0x398(%rsp),%rdx
   1401310ff:	lea    0x540(%rsp),%rcx
   140131107:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013110c:	mov    0x540(%rsp),%rcx
   140131114:	mov    0x688(%rsp),%r9
   14013111c:	mov    0x680(%rsp),%r8
   140131124:	mov    0x548(%rsp),%rdx
   14013112c:	mov    %rcx,0x40(%rsp)
   140131131:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131136:	mov    0x40(%rsp),%rcx
   14013113b:	mov    %eax,%edi
   14013113d:	lea    0x550(%rsp),%rax
   140131145:	cmp    %rax,%rcx
   140131148:	je     14013115b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd88b>
   14013114a:	mov    0x550(%rsp),%rax
   140131152:	lea    0x1(%rax),%rdx
   140131156:	call   140338430 <operator delete(void*, unsigned long long)>
   14013115b:	mov    0x680(%rsp),%rcx
   140131163:	lea    0x690(%rsp),%rax
   14013116b:	cmp    %rax,%rcx
   14013116e:	je     140131181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8b1>
   140131170:	mov    0x690(%rsp),%rax
   140131178:	lea    0x1(%rax),%rdx
   14013117c:	call   140338430 <operator delete(void*, unsigned long long)>
   140131181:	test   %edi,%edi
   140131183:	setle  %al
   140131186:	jmp    140128511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c41>
   14013118b:	shr    $0x20,%rax
   14013118f:	mov    %eax,%r8d
   140131192:	test   %ax,%ax
   140131195:	jne    140131db5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4e5>
   14013119b:	lea    0x680(%rsp),%r10
   1401311a3:	lea    0x3b0(%rsp),%rdx
   1401311ab:	mov    %r10,0x60(%rsp)
   1401311b0:	mov    %r10,%rcx
   1401311b3:	vzeroupper
   1401311b6:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   1401311bb:	lea    0x540(%rsp),%rax
   1401311c3:	lea    0x3a8(%rsp),%rdx
   1401311cb:	mov    %rax,%rcx
   1401311ce:	mov    %rax,0x40(%rsp)
   1401311d3:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   1401311d8:	mov    0x40(%rsp),%rcx
   1401311dd:	mov    0x60(%rsp),%rdx
   1401311e2:	call   14032f980 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   1401311e7:	mov    0x540(%rsp),%rcx
   1401311ef:	mov    %eax,%edi
   1401311f1:	lea    0x550(%rsp),%rax
   1401311f9:	cmp    %rax,%rcx
   1401311fc:	je     14013120f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd93f>
   1401311fe:	mov    0x550(%rsp),%rax
   140131206:	lea    0x1(%rax),%rdx
   14013120a:	call   140338430 <operator delete(void*, unsigned long long)>
   14013120f:	mov    0x680(%rsp),%rcx
   140131217:	lea    0x690(%rsp),%rax
   14013121f:	cmp    %rax,%rcx
   140131222:	je     140128672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da2>
   140131228:	mov    0x690(%rsp),%rax
   140131230:	lea    0x1(%rax),%rdx
   140131234:	call   140338430 <operator delete(void*, unsigned long long)>
   140131239:	jmp    140128672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da2>
   14013123e:	shr    $0x20,%rax
   140131242:	mov    %eax,%ecx
   140131244:	test   %ax,%ax
   140131247:	jne    140131d0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe43f>
   14013124d:	lea    0x680(%rsp),%r10
   140131255:	lea    0x2b0(%rsp),%rdx
   14013125d:	mov    %r10,0x60(%rsp)
   140131262:	mov    %r10,%rcx
   140131265:	vzeroupper
   140131268:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013126d:	lea    0x540(%rsp),%rax
   140131275:	lea    0x2a8(%rsp),%rdx
   14013127d:	mov    %rax,%rcx
   140131280:	mov    %rax,0x40(%rsp)
   140131285:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013128a:	mov    0x40(%rsp),%rcx
   14013128f:	mov    0x60(%rsp),%rdx
   140131294:	call   14032f980 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131299:	mov    0x540(%rsp),%rcx
   1401312a1:	mov    %eax,%edi
   1401312a3:	lea    0x550(%rsp),%rax
   1401312ab:	cmp    %rax,%rcx
   1401312ae:	je     1401312c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9f1>
   1401312b0:	mov    0x550(%rsp),%rax
   1401312b8:	lea    0x1(%rax),%rdx
   1401312bc:	call   140338430 <operator delete(void*, unsigned long long)>
   1401312c1:	mov    0x680(%rsp),%rcx
   1401312c9:	lea    0x690(%rsp),%rax
   1401312d1:	cmp    %rax,%rcx
   1401312d4:	je     1401312e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda17>
   1401312d6:	mov    0x690(%rsp),%rax
   1401312de:	lea    0x1(%rax),%rdx
   1401312e2:	call   140338430 <operator delete(void*, unsigned long long)>
   1401312e7:	mov    %edi,%eax
   1401312e9:	xor    $0x1,%eax
   1401312ec:	jmp    140125ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   1401312f1:	mov    0x278(%rsp),%rax
   1401312f9:	mov    %rax,0x1c8(%rsp)
   140131301:	jmp    140125775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   140131306:	shr    $0x20,%rax
   14013130a:	mov    %eax,%r8d
   14013130d:	test   %ax,%ax
   140131310:	jne    140131ea6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5d6>
   140131316:	lea    0x680(%rsp),%rcx
   14013131e:	lea    0x3c0(%rsp),%rdx
   140131326:	vzeroupper
   140131329:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013132e:	lea    0x3b8(%rsp),%rdx
   140131336:	lea    0x540(%rsp),%rcx
   14013133e:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140131343:	mov    0x540(%rsp),%rcx
   14013134b:	mov    0x688(%rsp),%r9
   140131353:	mov    0x680(%rsp),%r8
   14013135b:	mov    0x548(%rsp),%rdx
   140131363:	mov    %rcx,0x40(%rsp)
   140131368:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14013136d:	mov    0x40(%rsp),%rcx
   140131372:	mov    %eax,%edi
   140131374:	lea    0x550(%rsp),%rax
   14013137c:	cmp    %rax,%rcx
   14013137f:	je     140131392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdac2>
   140131381:	mov    0x550(%rsp),%rax
   140131389:	lea    0x1(%rax),%rdx
   14013138d:	call   140338430 <operator delete(void*, unsigned long long)>
   140131392:	mov    0x680(%rsp),%rcx
   14013139a:	lea    0x690(%rsp),%rax
   1401313a2:	cmp    %rax,%rcx
   1401313a5:	je     1401313b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdae8>
   1401313a7:	mov    0x690(%rsp),%rax
   1401313af:	lea    0x1(%rax),%rdx
   1401313b3:	call   140338430 <operator delete(void*, unsigned long long)>
   1401313b8:	test   %edi,%edi
   1401313ba:	setg   %al
   1401313bd:	jmp    1401287d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f03>
   1401313c2:	add    0x548(%rsp),%rdi
   1401313ca:	jns    14012c650 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d80>
   1401313d0:	test   %r12b,%r12b
   1401313d3:	je     1401327fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef2e>
   1401313d9:	cmp    $0x1,%r12b
   1401313dd:	je     14013566a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9a>
   1401313e3:	lea    0x8(%rsi),%r8
   1401313e7:	cmp    0x38(%rsp),%r8
   1401313ec:	jae    1401377ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f1e>
   1401313f2:	mov    0x1d0(%rsp),%rax
   1401313fa:	lea    0x680(%rsp),%rcx
   140131402:	mov    %r8,0x40(%rsp)
   140131407:	lea    0x22a6b7(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   14013140e:	mov    %rax,(%rsi)
   140131411:	mov    0x1c8(%rsp),%rax
   140131419:	mov    %rax,0x1d0(%rsp)
   140131421:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   140131426:	mov    0x680(%rsp),%rax
   14013142e:	mov    0x40(%rsp),%rsi
   140131433:	mov    %rax,0x1c8(%rsp)
   14013143b:	mov    $0x2,%r12d
   140131441:	jmp    14012c71c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e4c>
   140131446:	add    0x548(%rsp),%rdi
   14013144e:	jns    14012c42f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b5f>
   140131454:	test   %r12b,%r12b
   140131457:	je     1401333a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfad6>
   14013145d:	cmp    $0x1,%r12b
   140131461:	je     140133a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10140>
   140131467:	lea    0x8(%rsi),%r8
   14013146b:	cmp    0x38(%rsp),%r8
   140131470:	jae    140137f3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1466b>
   140131476:	mov    0x1d0(%rsp),%rax
   14013147e:	lea    0x680(%rsp),%rcx
   140131486:	mov    %r8,0x40(%rsp)
   14013148b:	lea    0x22a633(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140131492:	mov    %rax,(%rsi)
   140131495:	mov    0x1c8(%rsp),%rax
   14013149d:	mov    %rax,0x1d0(%rsp)
   1401314a5:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   1401314aa:	mov    0x680(%rsp),%rax
   1401314b2:	mov    0x40(%rsp),%rsi
   1401314b7:	mov    %rax,0x1c8(%rsp)
   1401314bf:	mov    $0x2,%r12d
   1401314c5:	jmp    14012c4fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   1401314ca:	movabs $0xffff000000000000,%rdx
   1401314d4:	movb   $0xcd,-0x1(%rbp)
   1401314d8:	mov    (%r10),%rax
   1401314db:	and    %rax,%rdx
   1401314de:	mov    %rdx,%rcx
   1401314e1:	movabs $0xfffd000000000000,%rdx
   1401314eb:	cmp    %rdx,%rcx
   1401314ee:	je     140132ee9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf619>
   1401314f4:	movabs $0xfff8000000000000,%rax
   1401314fe:	cmp    %rax,%rcx
   140131501:	je     140132f01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf631>
   140131507:	mov    %r10,%rcx
   14013150a:	mov    %r9,0x60(%rsp)
   14013150f:	mov    %r11,0x40(%rsp)
   140131514:	call   14021bc80 <setun::VMValue::as_float() const>
   140131519:	mov    0x60(%rsp),%r9
   14013151e:	mov    0x40(%rsp),%r11
   140131523:	movq   $0x0,0x508(%rsp)
   14013152f:	vcvttsd2si %xmm0,%rax
   140131534:	movq   $0x0,0x510(%rsp)
   140131540:	mov    %rax,0x500(%rsp)
   140131548:	lea    0x500(%rsp),%rax
   140131550:	mov    %rax,0x80(%rsp)
   140131558:	movabs $0xffff000000000000,%rdx
   140131562:	mov    (%r9),%rax
   140131565:	and    %rax,%rdx
   140131568:	mov    %rdx,%rcx
   14013156b:	movabs $0xfffd000000000000,%rdx
   140131575:	cmp    %rdx,%rcx
   140131578:	je     1401327a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeed8>
   14013157e:	movabs $0xfff8000000000000,%rax
   140131588:	cmp    %rax,%rcx
   14013158b:	je     1401327c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeef0>
   140131591:	mov    %r9,%rcx
   140131594:	mov    %r11,0x40(%rsp)
   140131599:	call   14021bc80 <setun::VMValue::as_float() const>
   14013159e:	vcvttsd2si %xmm0,%rax
   1401315a3:	mov    %rax,0x520(%rsp)
   1401315ab:	mov    0x40(%rsp),%r11
   1401315b0:	lea    0x520(%rsp),%r8
   1401315b8:	movq   $0x0,0x528(%rsp)
   1401315c4:	movq   $0x0,0x530(%rsp)
   1401315d0:	movabs $0xffff000000000000,%rdx
   1401315da:	mov    (%r11),%rax
   1401315dd:	and    %rax,%rdx
   1401315e0:	mov    %rdx,%rcx
   1401315e3:	movabs $0xfffd000000000000,%rdx
   1401315ed:	cmp    %rdx,%rcx
   1401315f0:	je     14013277e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeeae>
   1401315f6:	movabs $0xfff8000000000000,%rax
   140131600:	cmp    %rax,%rcx
   140131603:	je     140132796 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeec6>
   140131609:	mov    %r11,%rcx
   14013160c:	mov    %r8,0x40(%rsp)
   140131611:	call   14021bc80 <setun::VMValue::as_float() const>
   140131616:	vcvttsd2si %xmm0,%rax
   14013161b:	mov    0x40(%rsp),%r8
   140131620:	mov    %rax,0x540(%rsp)
   140131628:	lea    0x540(%rsp),%rax
   140131630:	movq   $0x0,0x548(%rsp)
   14013163c:	movq   $0x0,0x550(%rsp)
   140131648:	mov    %rax,0x60(%rsp)
   14013164d:	mov    0x80(%rsp),%rdx
   140131655:	lea    0x680(%rsp),%rax
   14013165d:	mov    %rax,%rcx
   140131660:	mov    %rax,0x40(%rsp)
   140131665:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14013166a:	mov    0x40(%rsp),%r8
   14013166f:	mov    0x60(%rsp),%rdx
   140131674:	lea    0x4c0(%rsp),%rcx
   14013167c:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140131681:	mov    0x4d0(%rsp),%rax
   140131689:	vmovdqa 0x4c0(%rsp),%xmm7
   140131692:	lea    0x1a0(%rsp),%rdx
   14013169a:	mov    0x40(%rsp),%rcx
   14013169f:	mov    %rax,0x1b0(%rsp)
   1401316a7:	vmovdqa %xmm7,0x1a0(%rsp)
   1401316b0:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401316b5:	mov    0x1068(%rbx),%rax
   1401316bc:	mov    0x680(%rsp),%rdx
   1401316c4:	mov    %rdx,(%rax,%rdi,8)
   1401316c8:	jmp    140124781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1>
   1401316cd:	mov    0x1050(%rbx),%rax
   1401316d4:	mov    %rsi,%rdi
   1401316d7:	sub    %rdx,%rdi
   1401316da:	mov    %rax,%rcx
   1401316dd:	sub    %rdx,%rcx
   1401316e0:	sar    $0x3,%rcx
   1401316e4:	lea    (%rcx,%rcx,1),%r9
   1401316e8:	cmp    %r9,%rcx
   1401316eb:	jb     140134a78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111a8>
   1401316f1:	vzeroupper
   1401316f4:	jmp    1401245dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0c>
   1401316f9:	test   %r12b,%r12b
   1401316fc:	jne    140132249 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe979>
   140131702:	movabs $0xfff8000000000003,%rax
   14013170c:	mov    %rax,0x1c8(%rsp)
   140131714:	mov    $0x1,%r12d
   14013171a:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   14013171f:	nop
   140131720:	mov    %rax,%rbp
   140131723:	mov    0x1050(%rbx),%rax
   14013172a:	vzeroupper
   14013172d:	jmp    1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140131732:	test   %rax,%rax
   140131735:	setne  %al
   140131738:	jmp    14012e7dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf0c>
   14013173d:	cmpb   $0x0,0x152c0(%rbx)
   140131744:	je     140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   14013174a:	mov    0x152c8(%rbx),%rcx
   140131751:	test   %rcx,%rcx
   140131754:	je     140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   14013175a:	mov    0x150c0(%rbx),%rax
   140131761:	mov    %rax,0x40(%rsp)
   140131766:	test   %rax,%rax
   140131769:	je     140131780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdeb0>
   14013176b:	sub    $0x1,%rax
   14013176f:	imul   $0x28,%rax,%rax
   140131773:	mov    0x10e0(%rbx,%rax,1),%rax
   14013177b:	mov    %rax,0x40(%rsp)
   140131780:	movswq %di,%rax
   140131784:	mov    0x40(%rsp),%rdx
   140131789:	lea    0x2(%rbp,%rax,1),%rax
   14013178e:	mov    %rax,0x60(%rsp)
   140131793:	vzeroupper
   140131796:	call   140171740 <setun::JITManager::record_backedge(unsigned long long)>
   14013179b:	mov    0x152c8(%rbx),%rdx
   1401317a2:	mov    0x40(%rsp),%r8
   1401317a7:	lea    0x540(%rsp),%rcx
   1401317af:	call   140171260 <setun::JITManager::get_or_create(unsigned long long)>
   1401317b4:	mov    0x540(%rsp),%rax
   1401317bc:	cmpb   $0x0,0xa8(%rax)
   1401317c3:	jne    140131804 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf34>
   1401317c5:	mov    0x152c8(%rbx),%rcx
   1401317cc:	mov    0x88(%rcx),%edx
   1401317d2:	cmp    %edx,0xac(%rax)
   1401317d8:	jae    1401317e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf18>
   1401317da:	mov    0x8c(%rcx),%edx
   1401317e0:	cmp    %edx,0xb0(%rax)
   1401317e6:	jb     140131804 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf34>
   1401317e8:	mov    0x40(%rsp),%r8
   1401317ed:	mov    0x8(%r14),%r9
   1401317f1:	mov    %r14,%rdx
   1401317f4:	sub    (%r14),%r9
   1401317f7:	call   140171550 <setun::JITManager::compile_function(setun::Chunk const&, unsigned long long, unsigned long long)>
   1401317fc:	mov    0x540(%rsp),%rax
   140131804:	mov    0x60(%rsp),%r9
   140131809:	mov    %rax,%rcx
   14013180c:	sub    %r15,%r9
   14013180f:	mov    %r9d,%edx
   140131812:	mov    %r9,0x60(%rsp)
   140131817:	call   1402188a0 <setun::JITCodeObject::has_osr_entry(unsigned int) const>
   14013181c:	mov    0x60(%rsp),%r9
   140131821:	test   %al,%al
   140131823:	je     140134d54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11484>
   140131829:	lea    0x680(%rsp),%r10
   140131831:	xor    %eax,%eax
   140131833:	mov    $0x23,%ecx
   140131838:	mov    0x40(%rsp),%r8
   14013183d:	mov    %r10,%rdi
   140131840:	rep stos %rax,(%rdi)
   140131843:	mov    0x1068(%rbx),%rcx
   14013184a:	movb   $0x1,0x788(%rsp)
   140131852:	mov    %rbx,0x680(%rsp)
   14013185a:	lea    (%rcx,%r13,8),%rdx
   14013185e:	mov    %rdx,0x690(%rsp)
   140131866:	mov    0x1070(%rbx),%rdx
   14013186d:	sub    %rcx,%rdx
   140131870:	mov    0x1048(%rbx),%rcx
   140131877:	sar    $0x3,%rdx
   14013187b:	sub    %r13,%rdx
   14013187e:	mov    %rcx,0x6a0(%rsp)
   140131886:	mov    %rdx,0x698(%rsp)
   14013188e:	mov    %rsi,%rdx
   140131891:	sub    %rcx,%rdx
   140131894:	mov    0x150c0(%rbx),%rcx
   14013189b:	sar    $0x3,%rdx
   14013189f:	mov    %rdx,0x6a8(%rsp)
   1401318a7:	imul   $0x28,%rcx,%rdx
   1401318ab:	test   %rcx,%rcx
   1401318ae:	mov    0x152c8(%rbx),%rcx
   1401318b5:	lea    0x1098(%rbx,%rdx,1),%rdx
   1401318bd:	cmove  %rax,%rdx
   1401318c1:	vmovq  %rdx,%xmm7
   1401318c6:	mov    %rbx,%rdx
   1401318c9:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401318d3:	mov    %r10,0x152b8(%rbx)
   1401318da:	mov    %r10,0x20(%rsp)
   1401318df:	vmovdqa %xmm0,0x6b0(%rsp)
   1401318e8:	call   14016f3d0 <setun::JITManager::execute_osr(setun::VM*, unsigned long long, unsigned int, setun::JITFrame*)>
   1401318ed:	mov    %rax,0x40(%rsp)
   1401318f2:	mov    0x6c8(%rsp),%rdi
   1401318fa:	mov    0x6b8(%rsp),%rax
   140131902:	mov    0x548(%rsp),%rcx
   14013190a:	mov    %rax,0x152b8(%rbx)
   140131911:	test   %rdi,%rdi
   140131914:	jle    140136491 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bc1>
   14013191a:	test   %rcx,%rcx
   14013191d:	je     140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe054>
   14013191f:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140131924:	mov    0x1060(%rbx),%rax
   14013192b:	mov    0x1048(%rbx),%rdx
   140131932:	mov    %edi,%edi
   140131934:	lea    (%r15,%rdi,1),%rbp
   140131938:	lea    (%rdx,%rax,8),%rsi
   14013193c:	cmpb   $0x0,0x1040(%rbx)
   140131943:	je     1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140131949:	movzbl 0x0(%rbp),%eax
   14013194d:	lea    0x28e74c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131954:	add    $0x1,%rbp
   140131958:	mov    (%rdi,%rax,8),%rax
   14013195c:	jmp    *%rax
   14013195e:	cmp    $0x2,%r12b
   140131962:	je     140133d20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10450>
   140131968:	cmp    $0x1,%r12b
   14013196c:	jne    140137c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143c7>
   140131972:	mov    0x1048(%rbx),%rdx
   140131979:	mov    0x1050(%rbx),%rax
   140131980:	lea    0x8(%rsi),%r8
   140131984:	cmp    0x38(%rsp),%r8
   140131989:	jae    140137b2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1425a>
   14013198f:	vzeroupper
   140131992:	mov    0x1c8(%rsp),%rcx
   14013199a:	mov    %rcx,(%rsi)
   14013199d:	sub    %rdx,%r8
   1401319a0:	sub    %r15,%rdi
   1401319a3:	sub    %rdx,%rax
   1401319a6:	mov    %r8,%rsi
   1401319a9:	mov    %rdi,0x1038(%rbx)
   1401319b0:	sar    $0x3,%rsi
   1401319b4:	cmp    %r8,%rax
   1401319b7:	jae    1401319c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0f9>
   1401319b9:	lea    (%rsi,%rsi,1),%rdx
   1401319bd:	lea    0x1048(%rbx),%rcx
   1401319c4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401319c9:	mov    %rsi,0x1060(%rbx)
   1401319d0:	vmovdqa 0x22b108(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   1401319d8:	mov    $0x10,%ecx
   1401319dd:	movb   $0x0,0x153a0(%rbx)
   1401319e4:	vmovdqa %xmm0,0x15390(%rbx)
   1401319ec:	call   1403385e0 <__cxa_allocate_exception>
   1401319f1:	lea    0x680(%rsp),%r10
   1401319f9:	lea    0x22abd8(%rip),%rdx        # 14035c5d8 <.rdata+0x1018>
   140131a00:	mov    %r10,%rcx
   140131a03:	mov    %r10,0x38(%rsp)
   140131a08:	mov    %rax,%rsi
   140131a0b:	call   1400fb160 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string<std::allocator<char> >(char const*, std::allocator<char> const&) [clone .isra.0]>
   140131a10:	mov    0x38(%rsp),%rdx
   140131a15:	mov    %rsi,%rcx
   140131a18:	call   1402d0280 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131a1d:	lea    0x246efc(%rip),%rax        # 140378920 <vtable for setun::VMException+0x10>
   140131a24:	mov    0x680(%rsp),%rcx
   140131a2c:	mov    %rax,(%rsi)
   140131a2f:	lea    0x690(%rsp),%rax
   140131a37:	cmp    %rax,%rcx
   140131a3a:	je     140131a4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe17d>
   140131a3c:	mov    0x690(%rsp),%rax
   140131a44:	lea    0x1(%rax),%rdx
   140131a48:	call   140338430 <operator delete(void*, unsigned long long)>
   140131a4d:	lea    0xd451c(%rip),%r8        # 140205f70 <setun::VMException::~VMException()>
   140131a54:	lea    0x240c65(%rip),%rdx        # 1403726c0 <typeinfo for setun::VMException>
   140131a5b:	mov    %rsi,%rcx
   140131a5e:	call   140338c80 <__cxa_throw>
   140131a63:	nopl   0x0(%rax,%rax,1)
   140131a68:	mov    0x1050(%rbx),%rax
   140131a6f:	mov    %rsi,%r12
   140131a72:	sub    %rdx,%r12
   140131a75:	mov    %rax,%rcx
   140131a78:	sub    %rdx,%rcx
   140131a7b:	sar    $0x3,%rcx
   140131a7f:	lea    (%rcx,%rcx,1),%r9
   140131a83:	cmp    %r9,%rcx
   140131a86:	jb     140133966 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10096>
   140131a8c:	vzeroupper
   140131a8f:	jmp    140129ad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6207>
   140131a94:	mov    0xa0(%rsp),%rdx
   140131a9c:	lea    0x1068(%rbx),%rcx
   140131aa3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131aa8:	jmp    140126427 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b57>
   140131aad:	lea    0x15270(%rbx),%rcx
   140131ab4:	mov    %rbx,%rdx
   140131ab7:	vzeroupper
   140131aba:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140131abf:	jmp    14012ce12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9542>
   140131ac4:	test   %rax,%rax
   140131ac7:	setne  %al
   140131aca:	jmp    14012e8bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafed>
   140131acf:	lea    0x308(%rsp),%rdx
   140131ad7:	lea    0x540(%rsp),%rcx
   140131adf:	vzeroupper
   140131ae2:	call   14021c010 <setun::VMValue::as_object() const>
   140131ae7:	mov    0x540(%rsp),%rax
   140131aef:	mov    0x548(%rsp),%rdi
   140131af7:	mov    %rax,0x40(%rsp)
   140131afc:	test   %rax,%rax
   140131aff:	je     140134782 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10eb2>
   140131b05:	test   %r12b,%r12b
   140131b08:	je     140134aa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111d5>
   140131b0e:	cmp    $0x1,%r12b
   140131b12:	je     14013626d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1299d>
   140131b18:	lea    0x8(%rsi),%rax
   140131b1c:	cmp    0x38(%rsp),%rax
   140131b21:	jae    140135ec0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125f0>
   140131b27:	mov    0x1d0(%rsp),%rax
   140131b2f:	lea    0x680(%rsp),%r10
   140131b37:	lea    0x310(%rsp),%rdx
   140131b3f:	mov    %r10,%rcx
   140131b42:	mov    %r10,0x60(%rsp)
   140131b47:	mov    %rax,(%rsi)
   140131b4a:	mov    0x1c8(%rsp),%rax
   140131b52:	mov    %rax,0x1d0(%rsp)
   140131b5a:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140131b5f:	mov    0x40(%rsp),%rcx
   140131b64:	mov    0x60(%rsp),%rdx
   140131b69:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140131b6e:	mov    0x680(%rsp),%rcx
   140131b76:	mov    %rax,0x1c8(%rsp)
   140131b7e:	lea    0x690(%rsp),%rax
   140131b86:	cmp    %rax,%rcx
   140131b89:	je     140131b9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2cc>
   140131b8b:	mov    0x690(%rsp),%rax
   140131b93:	lea    0x1(%rax),%rdx
   140131b97:	call   140338430 <operator delete(void*, unsigned long long)>
   140131b9c:	add    $0x8,%rsi
   140131ba0:	mov    $0x2,%r12d
   140131ba6:	test   %rdi,%rdi
   140131ba9:	je     140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140131baf:	mov    %rdi,%rcx
   140131bb2:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140131bb7:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140131bbc:	test   %r12b,%r12b
   140131bbf:	jne    1401320dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe80c>
   140131bc5:	mov    0x60(%rdi),%rcx
   140131bc9:	mov    0x50(%rdi),%rdx
   140131bcd:	xor    %eax,%eax
   140131bcf:	sub    0x48(%rdi),%rdx
   140131bd3:	sar    $0x3,%rdx
   140131bd7:	test   %rcx,%rcx
   140131bda:	je     140131be0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe310>
   140131bdc:	mov    0x18(%rcx),%rax
   140131be0:	add    %rax,%rdx
   140131be3:	lea    0x680(%rsp),%rcx
   140131beb:	mov    $0x1,%r12d
   140131bf1:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140131bf6:	mov    0x680(%rsp),%rax
   140131bfe:	mov    %rax,0x1c8(%rsp)
   140131c06:	cmpb   $0x0,0x1040(%rbx)
   140131c0d:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   140131c13:	movzbl 0x2(%rbp),%eax
   140131c17:	lea    0x28e482(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131c1e:	add    $0x3,%rbp
   140131c22:	mov    (%rdi,%rax,8),%rax
   140131c26:	jmp    *%rax
   140131c28:	shr    $0x20,%rdx
   140131c2c:	mov    %edx,%r8d
   140131c2f:	test   %dx,%dx
   140131c32:	je     140130ad6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd206>
   140131c38:	movabs $0xfffd000100000000,%rax
   140131c42:	cmp    %rax,%rcx
   140131c45:	je     14012c236 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8966>
   140131c4b:	cmp    $0x1,%r8w
   140131c50:	jne    14012890d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503d>
   140131c56:	jmp    14012c236 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8966>
   140131c5b:	mov    0x1048(%rbx),%rdx
   140131c62:	lea    0x8(%rsi),%r8
   140131c66:	cmp    0x38(%rsp),%r8
   140131c6b:	jae    1401360f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12821>
   140131c71:	mov    0x1c8(%rsp),%rax
   140131c79:	mov    %rax,(%rsi)
   140131c7c:	mov    %r8,%rsi
   140131c7f:	mov    0x1068(%rbx),%r8
   140131c86:	jmp    14012632d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   140131c8b:	mov    0x1048(%rbx),%rdx
   140131c92:	mov    %rsi,%rax
   140131c95:	sub    %rdx,%rax
   140131c98:	mov    %rax,0x60(%rsp)
   140131c9d:	mov    0x1050(%rbx),%rax
   140131ca4:	mov    %rax,0x38(%rsp)
   140131ca9:	sub    %rdx,%rax
   140131cac:	sar    $0x3,%rax
   140131cb0:	lea    (%rax,%rax,1),%rdx
   140131cb4:	cmp    %rdx,%rax
   140131cb7:	jae    140124b20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1250>
   140131cbd:	lea    0x1048(%rbx),%rcx
   140131cc4:	vzeroupper
   140131cc7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131ccc:	mov    0x1050(%rbx),%rax
   140131cd3:	mov    0x60(%rsp),%rsi
   140131cd8:	add    0x1048(%rbx),%rsi
   140131cdf:	mov    %rax,0x38(%rsp)
   140131ce4:	lea    0x8(%rsi),%r8
   140131ce8:	jmp    140124b23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1253>
   140131ced:	shr    $0x20,%rax
   140131cf1:	mov    %eax,%ecx
   140131cf3:	test   %ax,%ax
   140131cf6:	je     14013124d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd97d>
   140131cfc:	movabs $0xfffd000100000000,%rax
   140131d06:	cmp    %rax,%rdx
   140131d09:	je     14012a640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d70>
   140131d0f:	cmp    $0x1,%cx
   140131d13:	jne    140125ab8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   140131d19:	jmp    14012a640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d70>
   140131d1e:	mov    0x1048(%rbx),%rdx
   140131d25:	mov    %rsi,%rax
   140131d28:	sub    %rdx,%rax
   140131d2b:	mov    %rax,0x60(%rsp)
   140131d30:	mov    0x1050(%rbx),%rax
   140131d37:	mov    %rax,0x38(%rsp)
   140131d3c:	sub    %rdx,%rax
   140131d3f:	sar    $0x3,%rax
   140131d43:	lea    (%rax,%rax,1),%rdx
   140131d47:	cmp    %rdx,%rax
   140131d4a:	jae    140124c3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136f>
   140131d50:	vmovdqa %xmm0,0x80(%rsp)
   140131d59:	lea    0x1048(%rbx),%rcx
   140131d60:	vzeroupper
   140131d63:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131d68:	mov    0x1050(%rbx),%rax
   140131d6f:	mov    0x60(%rsp),%rsi
   140131d74:	vmovdqa 0x80(%rsp),%xmm0
   140131d7d:	add    0x1048(%rbx),%rsi
   140131d84:	mov    %rax,0x38(%rsp)
   140131d89:	lea    0x8(%rsi),%r8
   140131d8d:	jmp    140124c42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1372>
   140131d92:	shr    $0x20,%rdx
   140131d96:	mov    %edx,%r8d
   140131d99:	test   %dx,%dx
   140131d9c:	je     14013119b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8cb>
   140131da2:	movabs $0xfffd000100000000,%rax
   140131dac:	cmp    %rax,%rcx
   140131daf:	je     14012c353 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a83>
   140131db5:	cmp    $0x1,%r8w
   140131dba:	jne    14012864b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7b>
   140131dc0:	jmp    14012c353 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a83>
   140131dc5:	cmp    $0x1,%rax
   140131dc9:	je     1401350ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1182f>
   140131dcf:	cmp    $0x2,%rax
   140131dd3:	je     14013404c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1077c>
   140131dd9:	test   %r12b,%r12b
   140131ddc:	je     140129f8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   140131de2:	sub    $0x1,%r12b
   140131de6:	je     14013026d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   140131dec:	lea    0x8(%rsi),%r8
   140131df0:	cmp    0x38(%rsp),%r8
   140131df5:	jb     14012d7b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ee3>
   140131dfb:	mov    0x1050(%rbx),%rax
   140131e02:	mov    0x1048(%rbx),%rdx
   140131e09:	mov    %rax,0x38(%rsp)
   140131e0e:	sub    %rdx,%rax
   140131e11:	sar    $0x3,%rax
   140131e15:	lea    (%rax,%rax,1),%rcx
   140131e19:	cmp    %rcx,%rax
   140131e1c:	jae    14012d7b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ee3>
   140131e22:	sub    %rdx,%rsi
   140131e25:	mov    %rcx,%rdx
   140131e28:	lea    0x1048(%rbx),%rcx
   140131e2f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131e34:	mov    0x1050(%rbx),%rax
   140131e3b:	add    0x1048(%rbx),%rsi
   140131e42:	lea    0x8(%rsi),%r8
   140131e46:	mov    %rax,0x38(%rsp)
   140131e4b:	jmp    14012d7b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ee3>
   140131e50:	shr    $0x20,%rdx
   140131e54:	mov    %edx,%r8d
   140131e57:	test   %dx,%dx
   140131e5a:	je     140130d6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd49c>
   140131e60:	movabs $0xfffd000100000000,%rax
   140131e6a:	cmp    %rax,%rcx
   140131e6d:	je     14012bffe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x872e>
   140131e73:	cmp    $0x1,%r8w
   140131e78:	jne    14012838b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abb>
   140131e7e:	jmp    14012bffe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x872e>
   140131e83:	shr    $0x20,%rdx
   140131e87:	mov    %edx,%r8d
   140131e8a:	test   %dx,%dx
   140131e8d:	je     140131316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda46>
   140131e93:	movabs $0xfffd000100000000,%rax
   140131e9d:	cmp    %rax,%rcx
   140131ea0:	je     14012bee1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8611>
   140131ea6:	cmp    $0x1,%r8w
   140131eab:	jne    1401287ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4edd>
   140131eb1:	jmp    14012bee1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8611>
   140131eb6:	shr    $0x20,%rdx
   140131eba:	mov    %edx,%r8d
   140131ebd:	test   %dx,%dx
   140131ec0:	je     1401310df <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd80f>
   140131ec6:	movabs $0xfffd000100000000,%rax
   140131ed0:	cmp    %rax,%rcx
   140131ed3:	je     14012c119 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8849>
   140131ed9:	cmp    $0x1,%r8w
   140131ede:	jne    1401284eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1b>
   140131ee4:	jmp    14012c119 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8849>
   140131ee9:	movabs $0xfff8000000000000,%rax
   140131ef3:	mov    %rax,0x1c8(%rsp)
   140131efb:	mov    $0x1,%r12d
   140131f01:	jmp    14012f204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb934>
   140131f06:	mov    0x1048(%rbx),%rdx
   140131f0d:	mov    0x1050(%rbx),%rax
   140131f14:	mov    %rsi,%r12
   140131f17:	mov    %rax,0x38(%rsp)
   140131f1c:	sub    %rdx,%rax
   140131f1f:	sub    %rdx,%r12
   140131f22:	sar    $0x3,%rax
   140131f26:	lea    (%rax,%rax,1),%rdx
   140131f2a:	cmp    %rdx,%rax
   140131f2d:	jae    140129dd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6506>
   140131f33:	lea    0x1048(%rbx),%rcx
   140131f3a:	vzeroupper
   140131f3d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131f42:	mov    0x1048(%rbx),%rsi
   140131f49:	mov    0x1050(%rbx),%rax
   140131f50:	add    %r12,%rsi
   140131f53:	mov    %rax,0x38(%rsp)
   140131f58:	lea    0x8(%rsi),%r8
   140131f5c:	jmp    140129dd9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6509>
   140131f61:	lea    (%rax,%rax,1),%rdx
   140131f65:	lea    0x1068(%rbx),%rcx
   140131f6c:	vzeroupper
   140131f6f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131f74:	jmp    14012ccd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9408>
   140131f79:	mov    0x1050(%rbx),%rax
   140131f80:	mov    %rsi,%r12
   140131f83:	sub    %rdx,%r12
   140131f86:	mov    %rax,%rcx
   140131f89:	sub    %rdx,%rcx
   140131f8c:	sar    $0x3,%rcx
   140131f90:	lea    (%rcx,%rcx,1),%r9
   140131f94:	cmp    %r9,%rcx
   140131f97:	jb     1401346cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dff>
   140131f9d:	vzeroupper
   140131fa0:	jmp    14012bd3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x846d>
   140131fa5:	mov    0x1048(%rbx),%rdx
   140131fac:	mov    0x1050(%rbx),%rax
   140131fb3:	mov    %rsi,%r12
   140131fb6:	mov    %rax,0x38(%rsp)
   140131fbb:	sub    %rdx,%rax
   140131fbe:	sub    %rdx,%r12
   140131fc1:	sar    $0x3,%rax
   140131fc5:	lea    (%rax,%rax,1),%rdx
   140131fc9:	cmp    %rdx,%rax
   140131fcc:	jae    14012bad4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8204>
   140131fd2:	lea    0x1048(%rbx),%rcx
   140131fd9:	vzeroupper
   140131fdc:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131fe1:	mov    0x1048(%rbx),%rsi
   140131fe8:	mov    0x1050(%rbx),%rax
   140131fef:	add    %r12,%rsi
   140131ff2:	mov    %rax,0x38(%rsp)
   140131ff7:	lea    0x10(%rsi),%r8
   140131ffb:	jmp    14012bad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8207>
   140132000:	mov    0x1050(%rbx),%rax
   140132007:	mov    %rsi,%r12
   14013200a:	sub    %rdx,%r12
   14013200d:	mov    %rax,%rcx
   140132010:	sub    %rdx,%rcx
   140132013:	sar    $0x3,%rcx
   140132017:	lea    (%rcx,%rcx,1),%r9
   14013201b:	cmp    %r9,%rcx
   14013201e:	jb     1401359f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12128>
   140132024:	vzeroupper
   140132027:	jmp    14012b125 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7855>
   14013202c:	mov    0x1050(%rbx),%rax
   140132033:	mov    %rsi,%r12
   140132036:	sub    %rdx,%r12
   140132039:	mov    %rax,%rcx
   14013203c:	sub    %rdx,%rcx
   14013203f:	sar    $0x3,%rcx
   140132043:	lea    (%rcx,%rcx,1),%r9
   140132047:	cmp    %r9,%rcx
   14013204a:	jb     1401355bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ced>
   140132050:	vzeroupper
   140132053:	jmp    14012a87c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fac>
   140132058:	mov    0x1050(%rbx),%rax
   14013205f:	mov    %rsi,%r12
   140132062:	sub    %rdx,%r12
   140132065:	mov    %rax,%rcx
   140132068:	sub    %rdx,%rcx
   14013206b:	sar    $0x3,%rcx
   14013206f:	lea    (%rcx,%rcx,1),%r9
   140132073:	cmp    %r9,%rcx
   140132076:	jb     140135c16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12346>
   14013207c:	vzeroupper
   14013207f:	jmp    14012ab12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7242>
   140132084:	mov    0x1050(%rbx),%rax
   14013208b:	mov    %rsi,%r12
   14013208e:	sub    %rdx,%r12
   140132091:	mov    %rax,%rcx
   140132094:	sub    %rdx,%rcx
   140132097:	sar    $0x3,%rcx
   14013209b:	lea    (%rcx,%rcx,1),%r9
   14013209f:	cmp    %r9,%rcx
   1401320a2:	jb     140135cd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12407>
   1401320a8:	vzeroupper
   1401320ab:	jmp    14012ad35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7465>
   1401320b0:	mov    0x1050(%rbx),%rax
   1401320b7:	mov    %rsi,%r12
   1401320ba:	sub    %rdx,%r12
   1401320bd:	mov    %rax,%rcx
   1401320c0:	sub    %rdx,%rcx
   1401320c3:	sar    $0x3,%rcx
   1401320c7:	lea    (%rcx,%rcx,1),%r9
   1401320cb:	cmp    %r9,%rcx
   1401320ce:	jb     140134f28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11658>
   1401320d4:	vzeroupper
   1401320d7:	jmp    14012ae70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75a0>
   1401320dc:	cmp    $0x1,%r12b
   1401320e0:	je     1401343eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b1b>
   1401320e6:	lea    0x8(%rsi),%r8
   1401320ea:	cmp    0x38(%rsp),%r8
   1401320ef:	jae    140135f50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12680>
   1401320f5:	mov    0x1d0(%rsp),%rax
   1401320fd:	mov    0x60(%rdi),%rcx
   140132101:	mov    0x50(%rdi),%rdx
   140132105:	sub    0x48(%rdi),%rdx
   140132109:	mov    %rax,(%rsi)
   14013210c:	mov    0x1c8(%rsp),%rax
   140132114:	sar    $0x3,%rdx
   140132118:	mov    %rax,0x1d0(%rsp)
   140132120:	xor    %eax,%eax
   140132122:	test   %rcx,%rcx
   140132125:	je     14013212b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe85b>
   140132127:	mov    0x18(%rcx),%rax
   14013212b:	add    %rax,%rdx
   14013212e:	lea    0x680(%rsp),%rcx
   140132136:	mov    %r8,0x40(%rsp)
   14013213b:	mov    $0x2,%r12d
   140132141:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140132146:	mov    0x680(%rsp),%rax
   14013214e:	mov    0x40(%rsp),%rsi
   140132153:	mov    %rax,0x1c8(%rsp)
   14013215b:	jmp    140131c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe336>
   140132160:	mov    0x1050(%rbx),%rax
   140132167:	mov    %rsi,%r12
   14013216a:	sub    %rdx,%r12
   14013216d:	mov    %rax,%rcx
   140132170:	sub    %rdx,%rcx
   140132173:	sar    $0x3,%rcx
   140132177:	lea    (%rcx,%rcx,1),%r9
   14013217b:	cmp    %r9,%rcx
   14013217e:	jb     140134b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11238>
   140132184:	vzeroupper
   140132187:	jmp    14012bb19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8249>
   14013218c:	mov    0x1050(%rbx),%rax
   140132193:	mov    %rsi,%r12
   140132196:	sub    %rdx,%r12
   140132199:	mov    %rax,%rcx
   14013219c:	sub    %rdx,%rcx
   14013219f:	sar    $0x3,%rcx
   1401321a3:	lea    (%rcx,%rcx,1),%r9
   1401321a7:	cmp    %r9,%rcx
   1401321aa:	jb     14013427c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109ac>
   1401321b0:	vzeroupper
   1401321b3:	jmp    14012b164 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7894>
   1401321b8:	mov    0x1050(%rbx),%rax
   1401321bf:	mov    %rsi,%r12
   1401321c2:	sub    %rdx,%r12
   1401321c5:	mov    %rax,%rcx
   1401321c8:	sub    %rdx,%rcx
   1401321cb:	sar    $0x3,%rcx
   1401321cf:	lea    (%rcx,%rcx,1),%r9
   1401321d3:	cmp    %r9,%rcx
   1401321d6:	jb     1401349d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11101>
   1401321dc:	vzeroupper
   1401321df:	jmp    14012b6dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e0d>
   1401321e4:	mov    0x1048(%rbx),%rdx
   1401321eb:	mov    0x1050(%rbx),%rax
   1401321f2:	lea    0x10(%rsi),%r8
   1401321f6:	cmp    0x38(%rsp),%r8
   1401321fb:	jae    1401360ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127de>
   140132201:	mov    0x1d0(%rsp),%rcx
   140132209:	mov    %rcx,(%rsi)
   14013220c:	mov    0x1c8(%rsp),%rcx
   140132214:	mov    %rcx,0x8(%rsi)
   140132218:	jmp    14012f8b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfe3>
   14013221d:	mov    0x1050(%rbx),%rax
   140132224:	mov    %rsi,%r12
   140132227:	sub    %rdx,%r12
   14013222a:	mov    %rax,%rcx
   14013222d:	sub    %rdx,%rcx
   140132230:	sar    $0x3,%rcx
   140132234:	lea    (%rcx,%rcx,1),%r9
   140132238:	cmp    %r9,%rcx
   14013223b:	jb     140134827 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f57>
   140132241:	vzeroupper
   140132244:	jmp    14012acb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73e7>
   140132249:	cmp    $0x1,%r12b
   14013224d:	je     1401342a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109d9>
   140132253:	lea    0x8(%rsi),%r8
   140132257:	cmp    0x38(%rsp),%r8
   14013225c:	jae    140137002 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13732>
   140132262:	mov    0x1d0(%rsp),%rax
   14013226a:	mov    $0x2,%r12d
   140132270:	mov    %rax,(%rsi)
   140132273:	mov    0x1c8(%rsp),%rax
   14013227b:	mov    %r8,%rsi
   14013227e:	mov    %rax,0x1d0(%rsp)
   140132286:	movabs $0xfff8000000000003,%rax
   140132290:	mov    %rax,0x1c8(%rsp)
   140132298:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   14013229d:	mov    0x1050(%rbx),%rax
   1401322a4:	mov    %rsi,%r12
   1401322a7:	sub    %rdx,%r12
   1401322aa:	mov    %rax,%rcx
   1401322ad:	sub    %rdx,%rcx
   1401322b0:	sar    $0x3,%rcx
   1401322b4:	lea    (%rcx,%rcx,1),%r9
   1401322b8:	cmp    %r9,%rcx
   1401322bb:	jae    14012ab8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72bd>
   1401322c1:	mov    %r9,%rdx
   1401322c4:	lea    0x1048(%rbx),%rcx
   1401322cb:	vzeroupper
   1401322ce:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401322d3:	mov    0x1048(%rbx),%rdx
   1401322da:	mov    0x1050(%rbx),%rax
   1401322e1:	lea    (%rdx,%r12,1),%rsi
   1401322e5:	lea    0x10(%rsi),%r8
   1401322e9:	jmp    14012ab8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72bd>
   1401322ee:	mov    0x1050(%rbx),%rax
   1401322f5:	mov    %rsi,%r12
   1401322f8:	sub    %rdx,%r12
   1401322fb:	mov    %rax,%rcx
   1401322fe:	sub    %rdx,%rcx
   140132301:	sar    $0x3,%rcx
   140132305:	lea    (%rcx,%rcx,1),%r9
   140132309:	cmp    %r9,%rcx
   14013230c:	jb     140133fbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106ec>
   140132312:	vzeroupper
   140132315:	jmp    14012ac0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x733b>
   14013231a:	mov    0x1c8(%rsp),%rax
   140132322:	sub    $0x8,%rsi
   140132326:	mov    %rax,0x370(%rsp)
   14013232e:	mov    (%rsi),%rax
   140132331:	mov    %rax,0x368(%rsp)
   140132339:	jmp    14012815f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x488f>
   14013233e:	mov    0x1050(%rbx),%rax
   140132345:	mov    %rsi,%r12
   140132348:	sub    %rdx,%r12
   14013234b:	mov    %rax,%rcx
   14013234e:	sub    %rdx,%rcx
   140132351:	sar    $0x3,%rcx
   140132355:	lea    (%rcx,%rcx,1),%r9
   140132359:	cmp    %r9,%rcx
   14013235c:	jb     140134b35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11265>
   140132362:	vzeroupper
   140132365:	jmp    14012b969 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8099>
   14013236a:	mov    0x1050(%rbx),%rax
   140132371:	mov    %rsi,%r12
   140132374:	sub    %rdx,%r12
   140132377:	mov    %rax,%rcx
   14013237a:	sub    %rdx,%rcx
   14013237d:	sar    $0x3,%rcx
   140132381:	lea    (%rcx,%rcx,1),%r9
   140132385:	cmp    %r9,%rcx
   140132388:	jb     140133d89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104b9>
   14013238e:	vzeroupper
   140132391:	jmp    14012bcfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x842e>
   140132396:	mov    0x1c8(%rsp),%rax
   14013239e:	sub    $0x8,%rsi
   1401323a2:	mov    %rax,0x290(%rsp)
   1401323aa:	mov    (%rsi),%rax
   1401323ad:	mov    %rax,0x288(%rsp)
   1401323b5:	jmp    1401257e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f11>
   1401323ba:	mov    0x1050(%rbx),%rax
   1401323c1:	mov    %rsi,%r12
   1401323c4:	sub    %rdx,%r12
   1401323c7:	mov    %rax,%rcx
   1401323ca:	sub    %rdx,%rcx
   1401323cd:	sar    $0x3,%rcx
   1401323d1:	lea    (%rcx,%rcx,1),%r9
   1401323d5:	cmp    %r9,%rcx
   1401323d8:	jb     140134755 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e85>
   1401323de:	vzeroupper
   1401323e1:	jmp    14012adb3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74e3>
   1401323e6:	mov    0x1050(%rbx),%rax
   1401323ed:	mov    %rsi,%r12
   1401323f0:	sub    %rdx,%r12
   1401323f3:	mov    %rax,%rcx
   1401323f6:	sub    %rdx,%rcx
   1401323f9:	sar    $0x3,%rcx
   1401323fd:	lea    (%rcx,%rcx,1),%r9
   140132401:	cmp    %r9,%rcx
   140132404:	jb     140134728 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e58>
   14013240a:	vzeroupper
   14013240d:	jmp    14012ae31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7561>
   140132412:	cmp    $0x1,%r12b
   140132416:	je     140134cce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113fe>
   14013241c:	lea    0x8(%rsi),%r8
   140132420:	cmp    0x38(%rsp),%r8
   140132425:	jae    14013724f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1397f>
   14013242b:	mov    0x1d0(%rsp),%rax
   140132433:	xor    %edx,%edx
   140132435:	mov    %rax,(%rsi)
   140132438:	mov    0x1c8(%rsp),%rax
   140132440:	mov    %rax,0x1d0(%rsp)
   140132448:	test   %rdi,%rdi
   14013244b:	je     140132462 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb92>
   14013244d:	mov    %rdi,%rcx
   140132450:	mov    %r8,0x40(%rsp)
   140132455:	call   140146e40 <setun::ArrayObject::size() const>
   14013245a:	mov    0x40(%rsp),%r8
   14013245f:	mov    %rax,%rdx
   140132462:	lea    0x680(%rsp),%rcx
   14013246a:	mov    %r8,0x40(%rsp)
   14013246f:	mov    $0x2,%r12d
   140132475:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14013247a:	mov    0x680(%rsp),%rax
   140132482:	mov    0x40(%rsp),%rsi
   140132487:	mov    %rax,0x1c8(%rsp)
   14013248f:	jmp    14012f55d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc8d>
   140132494:	mov    0x1d0(%rsp),%rax
   14013249c:	mov    $0x1,%r12d
   1401324a2:	mov    %rax,0x1c8(%rsp)
   1401324aa:	jmp    140124da2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2>
   1401324af:	mov    0x1c8(%rsp),%rax
   1401324b7:	mov    -0x8(%rsi),%rdi
   1401324bb:	xor    %r12d,%r12d
   1401324be:	sub    $0x8,%rsi
   1401324c2:	mov    %rax,0x3f0(%rsp)
   1401324ca:	jmp    14012c54e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c7e>
   1401324cf:	mov    0x1050(%rbx),%rax
   1401324d6:	mov    %rsi,%r12
   1401324d9:	sub    %rdx,%r12
   1401324dc:	mov    %rax,%rcx
   1401324df:	sub    %rdx,%rcx
   1401324e2:	sar    $0x3,%rcx
   1401324e6:	lea    (%rcx,%rcx,1),%r9
   1401324ea:	cmp    %r9,%rcx
   1401324ed:	jb     140134e2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1155f>
   1401324f3:	vzeroupper
   1401324f6:	jmp    14012aa94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71c4>
   1401324fb:	mov    0x1050(%rbx),%rax
   140132502:	mov    %rsi,%r12
   140132505:	sub    %rdx,%r12
   140132508:	mov    %rax,%rcx
   14013250b:	sub    %rdx,%rcx
   14013250e:	sar    $0x3,%rcx
   140132512:	lea    (%rcx,%rcx,1),%r9
   140132516:	cmp    %r9,%rcx
   140132519:	jb     140133c63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10393>
   14013251f:	vzeroupper
   140132522:	jmp    14012aa55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7185>
   140132527:	mov    0x1048(%rbx),%rdx
   14013252e:	mov    %rsi,%rcx
   140132531:	sub    %rdx,%rcx
   140132534:	mov    %rcx,0x40(%rsp)
   140132539:	mov    0x1050(%rbx),%rcx
   140132540:	mov    %rcx,0x38(%rsp)
   140132545:	sub    %rdx,%rcx
   140132548:	mov    %rcx,%rdx
   14013254b:	sar    $0x3,%rdx
   14013254f:	lea    (%rdx,%rdx,1),%rcx
   140132553:	cmp    %rcx,%rdx
   140132556:	jae    14012a4b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6be1>
   14013255c:	mov    %al,0x60(%rsp)
   140132560:	mov    %rcx,%rdx
   140132563:	lea    0x1048(%rbx),%rcx
   14013256a:	vzeroupper
   14013256d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132572:	mov    0x1050(%rbx),%rax
   140132579:	mov    0x40(%rsp),%rsi
   14013257e:	add    0x1048(%rbx),%rsi
   140132585:	mov    %rax,0x38(%rsp)
   14013258a:	lea    0x8(%rsi),%r8
   14013258e:	movzbl 0x60(%rsp),%eax
   140132593:	jmp    14012a4b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6be1>
   140132598:	mov    0x1c8(%rsp),%rax
   1401325a0:	sub    $0x8,%rsi
   1401325a4:	mov    %rax,0x390(%rsp)
   1401325ac:	mov    (%rsi),%rax
   1401325af:	mov    %rax,0x388(%rsp)
   1401325b7:	jmp    1401282d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a05>
   1401325bc:	mov    0x1c8(%rsp),%rax
   1401325c4:	sub    $0x8,%rsi
   1401325c8:	mov    %rax,0x2c0(%rsp)
   1401325d0:	mov    (%rsi),%rax
   1401325d3:	mov    %rax,0x2b8(%rsp)
   1401325db:	mov    %rax,%rcx
   1401325de:	jmp    140125b65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2295>
   1401325e3:	mov    0x1c8(%rsp),%rax
   1401325eb:	sub    $0x8,%rsi
   1401325ef:	mov    %rax,0x1e0(%rsp)
   1401325f7:	mov    (%rsi),%rax
   1401325fa:	mov    %rax,0x1d8(%rsp)
   140132602:	jmp    14012507f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17af>
   140132607:	mov    0x1c8(%rsp),%rax
   14013260f:	sub    $0x8,%rsi
   140132613:	mov    %rax,0x260(%rsp)
   14013261b:	mov    (%rsi),%rax
   14013261e:	mov    %rax,0x258(%rsp)
   140132626:	jmp    140125560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c90>
   14013262b:	mov    0x1050(%rbx),%rax
   140132632:	mov    %rsi,%r12
   140132635:	sub    %rdx,%r12
   140132638:	mov    %rax,%rcx
   14013263b:	sub    %rdx,%rcx
   14013263e:	sar    $0x3,%rcx
   140132642:	lea    (%rcx,%rcx,1),%r9
   140132646:	cmp    %r9,%rcx
   140132649:	jb     140134e5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1158c>
   14013264f:	vzeroupper
   140132652:	jmp    14012a7c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ef2>
   140132657:	mov    0x1050(%rbx),%rax
   14013265e:	mov    %rsi,%r12
   140132661:	sub    %rdx,%r12
   140132664:	mov    %rax,%rcx
   140132667:	sub    %rdx,%rcx
   14013266a:	sar    $0x3,%rcx
   14013266e:	lea    (%rcx,%rcx,1),%r9
   140132672:	cmp    %r9,%rcx
   140132675:	jb     140133789 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfeb9>
   14013267b:	vzeroupper
   14013267e:	jmp    14012ab51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7281>
   140132683:	mov    0x1050(%rbx),%rax
   14013268a:	mov    %rsi,%rdi
   14013268d:	sub    %rdx,%rdi
   140132690:	mov    %rax,%rcx
   140132693:	sub    %rdx,%rcx
   140132696:	sar    $0x3,%rcx
   14013269a:	lea    (%rcx,%rcx,1),%r9
   14013269e:	cmp    %r9,%rcx
   1401326a1:	jb     140135771 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ea1>
   1401326a7:	vzeroupper
   1401326aa:	jmp    14012b6a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7dd1>
   1401326af:	mov    0x1c8(%rsp),%rax
   1401326b7:	sub    $0x8,%rsi
   1401326bb:	mov    %rax,0x280(%rsp)
   1401326c3:	mov    (%rsi),%rax
   1401326c6:	mov    %rax,0x278(%rsp)
   1401326ce:	jmp    1401256c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1df0>
   1401326d3:	mov    0x1c8(%rsp),%rax
   1401326db:	sub    $0x8,%rsi
   1401326df:	mov    %rax,0x200(%rsp)
   1401326e7:	mov    (%rsi),%rax
   1401326ea:	mov    %rax,0x1f8(%rsp)
   1401326f2:	jmp    1401251ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x191d>
   1401326f7:	mov    0x1050(%rbx),%rax
   1401326fe:	mov    %rsi,%r12
   140132701:	sub    %rdx,%r12
   140132704:	mov    %rax,%rcx
   140132707:	sub    %rdx,%rcx
   14013270a:	sar    $0x3,%rcx
   14013270e:	lea    (%rcx,%rcx,1),%r9
   140132712:	cmp    %r9,%rcx
   140132715:	jb     1401337e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff13>
   14013271b:	vzeroupper
   14013271e:	jmp    14012b803 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f33>
   140132723:	mov    0x1048(%rbx),%rdx
   14013272a:	mov    0x1050(%rbx),%rax
   140132731:	mov    %rsi,%rdi
   140132734:	mov    %rax,0x38(%rsp)
   140132739:	sub    %rdx,%rax
   14013273c:	sub    %rdx,%rdi
   14013273f:	sar    $0x3,%rax
   140132743:	lea    (%rax,%rax,1),%rdx
   140132747:	cmp    %rdx,%rax
   14013274a:	jae    14012a076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67a6>
   140132750:	lea    0x1048(%rbx),%rcx
   140132757:	vzeroupper
   14013275a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013275f:	mov    0x1050(%rbx),%rax
   140132766:	add    0x1048(%rbx),%rdi
   14013276d:	mov    %rdi,%rsi
   140132770:	lea    0x8(%rdi),%r8
   140132774:	mov    %rax,0x38(%rsp)
   140132779:	jmp    14012a076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67a6>
   14013277e:	shr    $0x20,%rax
   140132782:	cmp    $0x1,%ax
   140132786:	je     140135261 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11991>
   14013278c:	cmp    $0x5,%ax
   140132790:	jne    140131609 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd39>
   140132796:	mov    %r11,%rcx
   140132799:	mov    %r8,0x40(%rsp)
   14013279e:	call   14021a530 <setun::VMValue::as_int() const>
   1401327a3:	jmp    14013161b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd4b>
   1401327a8:	shr    $0x20,%rax
   1401327ac:	cmp    $0x1,%ax
   1401327b0:	je     140135a51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12181>
   1401327b6:	cmp    $0x5,%ax
   1401327ba:	jne    140131591 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcc1>
   1401327c0:	mov    %r9,%rcx
   1401327c3:	mov    %r11,0x40(%rsp)
   1401327c8:	call   14021a530 <setun::VMValue::as_int() const>
   1401327cd:	jmp    1401315a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcd3>
   1401327d2:	mov    0x1050(%rbx),%rax
   1401327d9:	mov    %rsi,%r12
   1401327dc:	sub    %rdx,%r12
   1401327df:	mov    %rax,%rcx
   1401327e2:	sub    %rdx,%rcx
   1401327e5:	sar    $0x3,%rcx
   1401327e9:	lea    (%rcx,%rcx,1),%r9
   1401327ed:	cmp    %r9,%rcx
   1401327f0:	jb     140135c82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123b2>
   1401327f6:	vzeroupper
   1401327f9:	jmp    14012aeaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75df>
   1401327fe:	lea    0x680(%rsp),%rcx
   140132806:	lea    0x2292b8(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   14013280d:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   140132812:	mov    0x680(%rsp),%rax
   14013281a:	mov    %rax,0x1c8(%rsp)
   140132822:	mov    $0x1,%r12d
   140132828:	jmp    14012c71c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e4c>
   14013282d:	mov    0x1050(%rbx),%rax
   140132834:	mov    %rsi,%r12
   140132837:	sub    %rdx,%r12
   14013283a:	mov    %rax,%rcx
   14013283d:	sub    %rdx,%rcx
   140132840:	sar    $0x3,%rcx
   140132844:	lea    (%rcx,%rcx,1),%r9
   140132848:	cmp    %r9,%rcx
   14013284b:	jb     140134096 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107c6>
   140132851:	vzeroupper
   140132854:	jmp    14012a8bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6feb>
   140132859:	mov    0x1050(%rbx),%rcx
   140132860:	mov    0x1048(%rbx),%rax
   140132867:	mov    %rcx,0x38(%rsp)
   14013286c:	sub    %rax,%rcx
   14013286f:	sar    $0x3,%rcx
   140132873:	lea    (%rcx,%rcx,1),%rdx
   140132877:	cmp    %rdx,%rcx
   14013287a:	jae    14012cea2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95d2>
   140132880:	lea    0x1048(%rbx),%rcx
   140132887:	sub    %rax,%rsi
   14013288a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013288f:	mov    0x1050(%rbx),%rax
   140132896:	add    0x1048(%rbx),%rsi
   14013289d:	lea    0x8(%rsi),%r8
   1401328a1:	mov    %rax,0x38(%rsp)
   1401328a6:	jmp    14012cea2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95d2>
   1401328ab:	mov    0x1050(%rbx),%rax
   1401328b2:	mov    %rsi,%r12
   1401328b5:	sub    %rdx,%r12
   1401328b8:	mov    %rax,%rcx
   1401328bb:	sub    %rdx,%rcx
   1401328be:	sar    $0x3,%rcx
   1401328c2:	lea    (%rcx,%rcx,1),%r9
   1401328c6:	cmp    %r9,%rcx
   1401328c9:	jb     140135234 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11964>
   1401328cf:	vzeroupper
   1401328d2:	jmp    14012b785 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eb5>
   1401328d7:	mov    0x1c8(%rsp),%rax
   1401328df:	sub    $0x8,%rsi
   1401328e3:	mov    %rax,0x2e0(%rsp)
   1401328eb:	mov    (%rsi),%rax
   1401328ee:	mov    %rax,0x2d8(%rsp)
   1401328f6:	mov    %rax,%rcx
   1401328f9:	jmp    140125dc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24f3>
   1401328fe:	mov    0x1050(%rbx),%rax
   140132905:	mov    %rsi,%r12
   140132908:	sub    %rdx,%r12
   14013290b:	mov    %rax,%rcx
   14013290e:	sub    %rdx,%rcx
   140132911:	sar    $0x3,%rcx
   140132915:	lea    (%rcx,%rcx,1),%r9
   140132919:	cmp    %r9,%rcx
   14013291c:	jb     140133d5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1048c>
   140132922:	vzeroupper
   140132925:	jmp    14012b3cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afb>
   14013292a:	mov    0x1048(%rbx),%rdx
   140132931:	mov    %rsi,%rcx
   140132934:	sub    %rdx,%rcx
   140132937:	mov    %rcx,0x40(%rsp)
   14013293c:	mov    0x1050(%rbx),%rcx
   140132943:	mov    %rcx,0x38(%rsp)
   140132948:	sub    %rdx,%rcx
   14013294b:	mov    %rcx,%rdx
   14013294e:	sar    $0x3,%rdx
   140132952:	lea    (%rdx,%rdx,1),%rcx
   140132956:	cmp    %rcx,%rdx
   140132959:	jae    14012a429 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b59>
   14013295f:	mov    %rax,0x60(%rsp)
   140132964:	mov    %rcx,%rdx
   140132967:	lea    0x1048(%rbx),%rcx
   14013296e:	vzeroupper
   140132971:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132976:	mov    0x1050(%rbx),%rax
   14013297d:	mov    0x40(%rsp),%rsi
   140132982:	add    0x1048(%rbx),%rsi
   140132989:	mov    %rax,0x38(%rsp)
   14013298e:	lea    0x8(%rsi),%r8
   140132992:	mov    0x60(%rsp),%rax
   140132997:	jmp    14012a429 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b59>
   14013299c:	mov    0x1050(%rbx),%rax
   1401329a3:	mov    %rsi,%r12
   1401329a6:	sub    %rdx,%r12
   1401329a9:	mov    %rax,%rcx
   1401329ac:	sub    %rdx,%rcx
   1401329af:	sar    $0x3,%rcx
   1401329b3:	lea    (%rcx,%rcx,1),%r9
   1401329b7:	cmp    %r9,%rcx
   1401329ba:	jb     140135bbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122ed>
   1401329c0:	vzeroupper
   1401329c3:	jmp    14012b7c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef4>
   1401329c8:	mov    0x1050(%rbx),%rax
   1401329cf:	mov    %rsi,%r12
   1401329d2:	sub    %rdx,%r12
   1401329d5:	mov    %rax,%rcx
   1401329d8:	sub    %rdx,%rcx
   1401329db:	sar    $0x3,%rcx
   1401329df:	lea    (%rcx,%rcx,1),%r9
   1401329e3:	cmp    %r9,%rcx
   1401329e6:	jb     1401337b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfee6>
   1401329ec:	vzeroupper
   1401329ef:	jmp    14012b1a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78d3>
   1401329f4:	mov    0x40(%rsp),%rcx
   1401329f9:	call   140146e40 <setun::ArrayObject::size() const>
   1401329fe:	add    %rax,%rdi
   140132a01:	jns    14012f277 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9a7>
   140132a07:	jmp    14012f28a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9ba>
   140132a0c:	mov    0x1c8(%rsp),%rax
   140132a14:	sub    $0x8,%rsi
   140132a18:	mov    %rax,0x230(%rsp)
   140132a20:	mov    (%rsi),%rax
   140132a23:	mov    %rax,0x228(%rsp)
   140132a2b:	jmp    1401253bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aec>
   140132a30:	mov    0x1050(%rbx),%rax
   140132a37:	mov    %rsi,%r12
   140132a3a:	sub    %rdx,%r12
   140132a3d:	mov    %rax,%rcx
   140132a40:	sub    %rdx,%rcx
   140132a43:	sar    $0x3,%rcx
   140132a47:	lea    (%rcx,%rcx,1),%r9
   140132a4b:	cmp    %r9,%rcx
   140132a4e:	jb     1401351af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118df>
   140132a54:	vzeroupper
   140132a57:	jmp    14012bd7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84ac>
   140132a5c:	mov    0x1c8(%rsp),%rax
   140132a64:	sub    $0x8,%rsi
   140132a68:	mov    %rax,0x250(%rsp)
   140132a70:	mov    (%rsi),%rax
   140132a73:	mov    %rax,0x248(%rsp)
   140132a7b:	jmp    1401254d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c04>
   140132a80:	mov    0x1c8(%rsp),%rdx
   140132a88:	mov    $0x1,%r12d
   140132a8e:	mov    %rdx,(%rax,%r13,8)
   140132a92:	mov    0x1d0(%rsp),%rax
   140132a9a:	mov    %rax,0x1c8(%rsp)
   140132aa2:	jmp    140127ba1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42d1>
   140132aa7:	shr    $0x20,%rax
   140132aab:	cmp    $0x1,%ax
   140132aaf:	je     14013579e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ece>
   140132ab5:	cmp    $0x5,%ax
   140132ab9:	jne    14012fbd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc308>
   140132abf:	mov    0x40(%rsp),%rcx
   140132ac4:	mov    %r8,0x60(%rsp)
   140132ac9:	call   14021a530 <setun::VMValue::as_int() const>
   140132ace:	jmp    14012fbec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31c>
   140132ad3:	shr    $0x20,%rax
   140132ad7:	cmp    $0x1,%ax
   140132adb:	je     140133993 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100c3>
   140132ae1:	cmp    $0x5,%ax
   140132ae5:	jne    14012fb66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc296>
   140132aeb:	mov    0x60(%rsp),%rcx
   140132af0:	call   14021a530 <setun::VMValue::as_int() const>
   140132af5:	lea    0x520(%rsp),%r8
   140132afd:	movq   $0x0,0x528(%rsp)
   140132b09:	mov    %rax,0x520(%rsp)
   140132b11:	movq   $0x0,0x530(%rsp)
   140132b1d:	jmp    14012fb9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2cd>
   140132b22:	mov    0x1050(%rbx),%rax
   140132b29:	mov    %rsi,%r12
   140132b2c:	sub    %rdx,%r12
   140132b2f:	mov    %rax,%rcx
   140132b32:	sub    %rdx,%rcx
   140132b35:	sar    $0x3,%rcx
   140132b39:	lea    (%rcx,%rcx,1),%r9
   140132b3d:	cmp    %r9,%rcx
   140132b40:	jb     140135a7d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121ad>
   140132b46:	vzeroupper
   140132b49:	jmp    14012abcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72fc>
   140132b4e:	mov    0x1050(%rbx),%rax
   140132b55:	mov    %rsi,%r12
   140132b58:	sub    %rdx,%r12
   140132b5b:	mov    %rax,%rcx
   140132b5e:	sub    %rdx,%rcx
   140132b61:	sar    $0x3,%rcx
   140132b65:	lea    (%rcx,%rcx,1),%r9
   140132b69:	cmp    %r9,%rcx
   140132b6c:	jb     1401339b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100e7>
   140132b72:	vzeroupper
   140132b75:	jmp    14012ad74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74a4>
   140132b7a:	lea    0x8(%rsi),%r8
   140132b7e:	cmp    0x38(%rsp),%r8
   140132b83:	jae    140136b43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13273>
   140132b89:	mov    0x1c8(%rsp),%rdx
   140132b91:	mov    %rdx,(%rsi)
   140132b94:	mov    %r8,%rsi
   140132b97:	jmp    14012762c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d5c>
   140132b9c:	mov    0x1050(%rbx),%rax
   140132ba3:	mov    %rsi,%r12
   140132ba6:	sub    %rdx,%r12
   140132ba9:	mov    %rax,%rcx
   140132bac:	sub    %rdx,%rcx
   140132baf:	sar    $0x3,%rcx
   140132bb3:	lea    (%rcx,%rcx,1),%r9
   140132bb7:	cmp    %r9,%rcx
   140132bba:	jb     140133aeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1021b>
   140132bc0:	vzeroupper
   140132bc3:	jmp    14012ac4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x737a>
   140132bc8:	mov    0x1048(%rbx),%rcx
   140132bcf:	mov    0x1050(%rbx),%rax
   140132bd6:	mov    %rsi,%r12
   140132bd9:	mov    %rax,0x38(%rsp)
   140132bde:	sub    %rcx,%rax
   140132be1:	sub    %rcx,%r12
   140132be4:	mov    %rax,%rdx
   140132be7:	sar    $0x3,%rdx
   140132beb:	lea    (%rdx,%rdx,1),%rcx
   140132bef:	cmp    %rcx,%rdx
   140132bf2:	jae    14012a780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6eb0>
   140132bf8:	mov    %r9b,0x40(%rsp)
   140132bfd:	mov    %rcx,%rdx
   140132c00:	lea    0x1048(%rbx),%rcx
   140132c07:	vzeroupper
   140132c0a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132c0f:	mov    0x1048(%rbx),%rsi
   140132c16:	mov    0x1050(%rbx),%rax
   140132c1d:	movzbl 0x40(%rsp),%r9d
   140132c23:	add    %r12,%rsi
   140132c26:	mov    %rax,0x38(%rsp)
   140132c2b:	lea    0x10(%rsi),%r8
   140132c2f:	jmp    14012a780 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6eb0>
   140132c34:	mov    0x1c8(%rsp),%rax
   140132c3c:	sub    $0x8,%rsi
   140132c40:	mov    %rax,0x270(%rsp)
   140132c48:	mov    (%rsi),%rax
   140132c4b:	mov    %rax,0x268(%rsp)
   140132c53:	jmp    1401255ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d1c>
   140132c58:	mov    0x1c8(%rsp),%rax
   140132c60:	sub    $0x8,%rsi
   140132c64:	mov    %rax,0x2f0(%rsp)
   140132c6c:	mov    (%rsi),%rax
   140132c6f:	mov    %rax,0x2e8(%rsp)
   140132c77:	mov    %rax,%rcx
   140132c7a:	jmp    140125ef2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2622>
   140132c7f:	mov    0x1c8(%rsp),%rax
   140132c87:	sub    $0x8,%rsi
   140132c8b:	mov    %rax,0x360(%rsp)
   140132c93:	mov    (%rsi),%rax
   140132c96:	mov    %rax,0x358(%rsp)
   140132c9e:	jmp    1401280a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47d4>
   140132ca3:	mov    0x1c8(%rsp),%rax
   140132cab:	sub    $0x8,%rsi
   140132caf:	mov    %rax,0x3b0(%rsp)
   140132cb7:	mov    (%rsi),%rax
   140132cba:	mov    %rax,0x3a8(%rsp)
   140132cc2:	jmp    140128595 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc5>
   140132cc7:	mov    0x1c8(%rsp),%rax
   140132ccf:	sub    $0x8,%rsi
   140132cd3:	mov    %rax,0x240(%rsp)
   140132cdb:	mov    (%rsi),%rax
   140132cde:	mov    %rax,0x238(%rsp)
   140132ce6:	jmp    140125448 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b78>
   140132ceb:	mov    0x1c8(%rsp),%rax
   140132cf3:	mov    $0x1,%r12d
   140132cf9:	mov    %rax,0x2f8(%rsp)
   140132d01:	mov    0x1d0(%rsp),%rax
   140132d09:	mov    %rax,0x1c8(%rsp)
   140132d11:	jmp    140126046 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2776>
   140132d16:	mov    0x1048(%rbx),%rdx
   140132d1d:	mov    %rsi,%rcx
   140132d20:	sub    %rdx,%rcx
   140132d23:	mov    %rcx,0x40(%rsp)
   140132d28:	mov    0x1050(%rbx),%rcx
   140132d2f:	mov    %rcx,0x38(%rsp)
   140132d34:	sub    %rdx,%rcx
   140132d37:	mov    %rcx,%rdx
   140132d3a:	sar    $0x3,%rdx
   140132d3e:	lea    (%rdx,%rdx,1),%rcx
   140132d42:	cmp    %rcx,%rdx
   140132d45:	jae    140124e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159e>
   140132d4b:	mov    %rax,0x60(%rsp)
   140132d50:	mov    %rcx,%rdx
   140132d53:	lea    0x1048(%rbx),%rcx
   140132d5a:	vzeroupper
   140132d5d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132d62:	mov    0x1050(%rbx),%rax
   140132d69:	mov    0x40(%rsp),%rsi
   140132d6e:	add    0x1048(%rbx),%rsi
   140132d75:	mov    %rax,0x38(%rsp)
   140132d7a:	lea    0x8(%rsi),%r8
   140132d7e:	mov    0x60(%rsp),%rax
   140132d83:	jmp    140124e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159e>
   140132d88:	mov    0x1048(%rbx),%rdx
   140132d8f:	mov    0x1050(%rbx),%rax
   140132d96:	mov    %rsi,%rdi
   140132d99:	mov    %rax,0x38(%rsp)
   140132d9e:	sub    %rdx,%rax
   140132da1:	sub    %rdx,%rdi
   140132da4:	sar    $0x3,%rax
   140132da8:	lea    (%rax,%rax,1),%rdx
   140132dac:	cmp    %rdx,%rax
   140132daf:	jae    14012a1d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6907>
   140132db5:	lea    0x1048(%rbx),%rcx
   140132dbc:	vzeroupper
   140132dbf:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132dc4:	mov    0x1050(%rbx),%rax
   140132dcb:	add    0x1048(%rbx),%rdi
   140132dd2:	mov    %rdi,%rsi
   140132dd5:	lea    0x8(%rdi),%r8
   140132dd9:	mov    %rax,0x38(%rsp)
   140132dde:	jmp    14012a1d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6907>
   140132de3:	mov    0x1048(%rbx),%rdx
   140132dea:	mov    0x1050(%rbx),%rax
   140132df1:	mov    %rsi,%rdi
   140132df4:	mov    %rax,0x38(%rsp)
   140132df9:	sub    %rdx,%rax
   140132dfc:	sub    %rdx,%rdi
   140132dff:	sar    $0x3,%rax
   140132e03:	lea    (%rax,%rax,1),%rdx
   140132e07:	cmp    %rdx,%rax
   140132e0a:	jae    14012a161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6891>
   140132e10:	lea    0x1048(%rbx),%rcx
   140132e17:	vzeroupper
   140132e1a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132e1f:	mov    0x1050(%rbx),%rax
   140132e26:	add    0x1048(%rbx),%rdi
   140132e2d:	mov    %rdi,%rsi
   140132e30:	lea    0x8(%rdi),%r8
   140132e34:	mov    %rax,0x38(%rsp)
   140132e39:	jmp    14012a161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6891>
   140132e3e:	mov    0x1048(%rbx),%rdx
   140132e45:	mov    0x1050(%rbx),%rax
   140132e4c:	mov    %rsi,%rdi
   140132e4f:	mov    %rax,0x38(%rsp)
   140132e54:	sub    %rdx,%rax
   140132e57:	sub    %rdx,%rdi
   140132e5a:	sar    $0x3,%rax
   140132e5e:	lea    (%rax,%rax,1),%rdx
   140132e62:	cmp    %rdx,%rax
   140132e65:	jae    14012a0eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x681b>
   140132e6b:	lea    0x1048(%rbx),%rcx
   140132e72:	vzeroupper
   140132e75:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132e7a:	mov    0x1050(%rbx),%rax
   140132e81:	add    0x1048(%rbx),%rdi
   140132e88:	mov    %rdi,%rsi
   140132e8b:	lea    0x8(%rdi),%r8
   140132e8f:	mov    %rax,0x38(%rsp)
   140132e94:	jmp    14012a0eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x681b>
   140132e99:	mov    0x1c8(%rsp),%rax
   140132ea1:	sub    $0x8,%rsi
   140132ea5:	mov    %rax,0x220(%rsp)
   140132ead:	mov    (%rsi),%rax
   140132eb0:	mov    %rax,0x218(%rsp)
   140132eb8:	jmp    140125330 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a60>
   140132ebd:	mov    0x1050(%rbx),%rax
   140132ec4:	mov    %rsi,%r12
   140132ec7:	sub    %rdx,%r12
   140132eca:	mov    %rax,%rcx
   140132ecd:	sub    %rdx,%rcx
   140132ed0:	sar    $0x3,%rcx
   140132ed4:	lea    (%rcx,%rcx,1),%r9
   140132ed8:	cmp    %r9,%rcx
   140132edb:	jb     1401352ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119ea>
   140132ee1:	vzeroupper
   140132ee4:	jmp    14012bdf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8526>
   140132ee9:	shr    $0x20,%rax
   140132eed:	cmp    $0x1,%ax
   140132ef1:	je     140135ad6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12206>
   140132ef7:	cmp    $0x5,%ax
   140132efb:	jne    140131507 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc37>
   140132f01:	mov    %r10,%rcx
   140132f04:	mov    %r9,0x60(%rsp)
   140132f09:	mov    %r11,0x40(%rsp)
   140132f0e:	call   14021a530 <setun::VMValue::as_int() const>
   140132f13:	mov    0x40(%rsp),%r11
   140132f18:	mov    0x60(%rsp),%r9
   140132f1d:	movq   $0x0,0x508(%rsp)
   140132f29:	mov    %rax,0x500(%rsp)
   140132f31:	lea    0x500(%rsp),%rax
   140132f39:	movq   $0x0,0x510(%rsp)
   140132f45:	mov    %rax,0x80(%rsp)
   140132f4d:	jmp    140131558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc88>
   140132f52:	mov    0x1050(%rbx),%rax
   140132f59:	mov    %rsi,%r12
   140132f5c:	sub    %rdx,%r12
   140132f5f:	mov    %rax,%rcx
   140132f62:	sub    %rdx,%rcx
   140132f65:	sar    $0x3,%rcx
   140132f69:	lea    (%rcx,%rcx,1),%r9
   140132f6d:	cmp    %r9,%rcx
   140132f70:	jb     140135b0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1223a>
   140132f76:	vzeroupper
   140132f79:	jmp    14012aad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7203>
   140132f7e:	mov    0x1050(%rbx),%rax
   140132f85:	mov    %rsi,%r12
   140132f88:	sub    %rdx,%r12
   140132f8b:	mov    %rax,%rcx
   140132f8e:	sub    %rdx,%rcx
   140132f91:	sar    $0x3,%rcx
   140132f95:	lea    (%rcx,%rcx,1),%r9
   140132f99:	cmp    %r9,%rcx
   140132f9c:	jb     14013528d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119bd>
   140132fa2:	vzeroupper
   140132fa5:	jmp    14012a9d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7107>
   140132faa:	mov    0x1050(%rbx),%rax
   140132fb1:	mov    %rsi,%r12
   140132fb4:	sub    %rdx,%r12
   140132fb7:	mov    %rax,%rcx
   140132fba:	sub    %rdx,%rcx
   140132fbd:	sar    $0x3,%rcx
   140132fc1:	lea    (%rcx,%rcx,1),%r9
   140132fc5:	cmp    %r9,%rcx
   140132fc8:	jb     1401352e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a17>
   140132fce:	vzeroupper
   140132fd1:	jmp    14012a83d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f6d>
   140132fd6:	mov    0x1050(%rbx),%rax
   140132fdd:	mov    %rsi,%r12
   140132fe0:	sub    %rdx,%r12
   140132fe3:	mov    %rax,%rcx
   140132fe6:	sub    %rdx,%rcx
   140132fe9:	sar    $0x3,%rcx
   140132fed:	lea    (%rcx,%rcx,1),%r9
   140132ff1:	cmp    %r9,%rcx
   140132ff4:	jb     14013599f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120cf>
   140132ffa:	vzeroupper
   140132ffd:	jmp    14012acf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7426>
   140133002:	mov    0x1050(%rbx),%rax
   140133009:	mov    %rsi,%r12
   14013300c:	sub    %rdx,%r12
   14013300f:	mov    %rax,%rcx
   140133012:	sub    %rdx,%rcx
   140133015:	sar    $0x3,%rcx
   140133019:	lea    (%rcx,%rcx,1),%r9
   14013301d:	cmp    %r9,%rcx
   140133020:	jb     140133698 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdc8>
   140133026:	vzeroupper
   140133029:	jmp    14012a801 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f31>
   14013302e:	mov    0x1c8(%rsp),%rax
   140133036:	sub    $0x8,%rsi
   14013303a:	mov    %rax,0x3a0(%rsp)
   140133042:	mov    (%rsi),%rax
   140133045:	mov    %rax,0x398(%rsp)
   14013304d:	jmp    140128435 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b65>
   140133052:	mov    0x1c8(%rsp),%rax
   14013305a:	mov    %rax,0x340(%rsp)
   140133062:	mov    0x1d0(%rsp),%rax
   14013306a:	mov    %rax,0x1c8(%rsp)
   140133072:	mov    %rsi,%rax
   140133075:	jmp    140130637 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd67>
   14013307a:	mov    0x1c8(%rsp),%rax
   140133082:	sub    $0x8,%rsi
   140133086:	mov    %rax,0x2d0(%rsp)
   14013308e:	mov    (%rsi),%rax
   140133091:	mov    %rax,0x2c8(%rsp)
   140133099:	mov    %rax,%rcx
   14013309c:	jmp    140125c94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23c4>
   1401330a1:	mov    0x1c8(%rsp),%rax
   1401330a9:	sub    $0x8,%rsi
   1401330ad:	mov    %rax,0x2a0(%rsp)
   1401330b5:	mov    (%rsi),%rax
   1401330b8:	mov    %rax,0x298(%rsp)
   1401330c0:	mov    %rax,%rcx
   1401330c3:	jmp    140125905 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2035>
   1401330c8:	lea    0x1048(%rbx),%rcx
   1401330cf:	lea    (%rdi,%rdi,1),%rdx
   1401330d3:	vzeroupper
   1401330d6:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401330db:	mov    0x15270(%rbx),%rcx
   1401330e2:	mov    0x152a0(%rbx),%r9
   1401330e9:	jmp    14012fdfb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc52b>
   1401330ee:	mov    0x1c8(%rsp),%rdx
   1401330f6:	mov    $0x1,%r12d
   1401330fc:	mov    %rdx,0x18(%rax,%r13,8)
   140133101:	mov    0x1d0(%rsp),%rax
   140133109:	mov    %rax,0x1c8(%rsp)
   140133111:	jmp    140127c6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x439a>
   140133116:	movzwl 0x6(%r9),%edx
   14013311b:	lea    0x3f0(%rsp),%r8
   140133123:	mov    %rdi,%rcx
   140133126:	mov    %r9,0x80(%rsp)
   14013312e:	shl    $0x5,%rdx
   140133132:	add    0x30(%r14),%rdx
   140133136:	mov    %rdx,0x60(%rsp)
   14013313b:	call   140211300 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   140133140:	mov    0x38(%rdi),%r10
   140133144:	test   %r10,%r10
   140133147:	je     1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14013314d:	mov    0x60(%rsp),%r8
   140133152:	lea    0x28(%r10),%rdx
   140133156:	lea    0x680(%rsp),%rcx
   14013315e:	call   140221b00 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133163:	mov    0x680(%rsp),%rdx
   14013316b:	test   %rdx,%rdx
   14013316e:	je     1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   140133174:	mov    (%rdx),%rdx
   140133177:	test   %rdx,%rdx
   14013317a:	je     1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   140133180:	mov    0x38(%rdi),%rax
   140133184:	movzwl 0x28(%rdx),%edx
   140133188:	mov    0x80(%rsp),%r9
   140133190:	mov    (%rax),%eax
   140133192:	mov    %dx,0x4(%r9)
   140133197:	mov    %eax,(%r9)
   14013319a:	jmp    1401278ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14013319f:	mov    0x1c8(%rsp),%rax
   1401331a7:	sub    $0x8,%rsi
   1401331ab:	mov    %rax,0x3c0(%rsp)
   1401331b3:	mov    (%rsi),%rax
   1401331b6:	mov    %rax,0x3b8(%rsp)
   1401331be:	jmp    1401286f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e27>
   1401331c3:	mov    0x1c8(%rsp),%rdx
   1401331cb:	mov    $0x1,%r12d
   1401331d1:	mov    %rdx,0x10(%rax,%r13,8)
   1401331d6:	mov    0x1d0(%rsp),%rax
   1401331de:	mov    %rax,0x1c8(%rsp)
   1401331e6:	jmp    140127c27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4357>
   1401331eb:	mov    0x1c8(%rsp),%rax
   1401331f3:	sub    $0x8,%rsi
   1401331f7:	xor    %r12d,%r12d
   1401331fa:	mov    %rax,0x338(%rsp)
   140133202:	mov    (%rsi),%rax
   140133205:	mov    %rax,0x330(%rsp)
   14013320d:	jmp    140127e43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4573>
   140133212:	mov    0x1c8(%rsp),%rdx
   14013321a:	mov    $0x1,%r12d
   140133220:	mov    %rdx,0x8(%rax,%r13,8)
   140133225:	mov    0x1d0(%rsp),%rax
   14013322d:	mov    %rax,0x1c8(%rsp)
   140133235:	jmp    140127be4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4314>
   14013323a:	shr    $0x20,%rax
   14013323e:	cmp    $0x1,%ax
   140133242:	je     1401357cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11efc>
   140133248:	cmp    $0x5,%ax
   14013324c:	jne    14012faeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc21b>
   140133252:	mov    %r11,%rcx
   140133255:	vzeroupper
   140133258:	call   14021a530 <setun::VMValue::as_int() const>
   14013325d:	jmp    14012fafb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc22b>
   140133262:	mov    0x1050(%rbx),%rax
   140133269:	mov    %rsi,%r12
   14013326c:	sub    %rdx,%r12
   14013326f:	mov    %rax,%rcx
   140133272:	sub    %rdx,%rcx
   140133275:	sar    $0x3,%rcx
   140133279:	lea    (%rcx,%rcx,1),%r9
   14013327d:	cmp    %r9,%rcx
   140133280:	jb     140133a7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101ab>
   140133286:	vzeroupper
   140133289:	jmp    14012b40a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b3a>
   14013328e:	mov    0x1c8(%rsp),%rax
   140133296:	sub    $0x8,%rsi
   14013329a:	mov    %rax,0x1f0(%rsp)
   1401332a2:	mov    (%rsi),%rax
   1401332a5:	mov    %rax,0x1e8(%rsp)
   1401332ad:	jmp    140125136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1866>
   1401332b2:	mov    0x1050(%rbx),%rax
   1401332b9:	mov    %rsi,%r12
   1401332bc:	sub    %rdx,%r12
   1401332bf:	mov    %rax,%rcx
   1401332c2:	sub    %rdx,%rcx
   1401332c5:	sar    $0x3,%rcx
   1401332c9:	lea    (%rcx,%rcx,1),%r9
   1401332cd:	cmp    %r9,%rcx
   1401332d0:	jb     140133939 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10069>
   1401332d6:	vzeroupper
   1401332d9:	jmp    14012adf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7522>
   1401332de:	mov    0x1050(%rbx),%rax
   1401332e5:	mov    %rsi,%r12
   1401332e8:	sub    %rdx,%r12
   1401332eb:	mov    %rax,%rcx
   1401332ee:	sub    %rdx,%rcx
   1401332f1:	sar    $0x3,%rcx
   1401332f5:	lea    (%rcx,%rcx,1),%r9
   1401332f9:	cmp    %r9,%rcx
   1401332fc:	jb     140133c90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103c0>
   140133302:	vzeroupper
   140133305:	jmp    14012aa16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7146>
   14013330a:	mov    0x1048(%rbx),%rdx
   140133311:	mov    %rsi,%rcx
   140133314:	sub    %rdx,%rcx
   140133317:	mov    %rcx,0x40(%rsp)
   14013331c:	mov    0x1050(%rbx),%rcx
   140133323:	mov    %rcx,0x38(%rsp)
   140133328:	sub    %rdx,%rcx
   14013332b:	sar    $0x3,%rcx
   14013332f:	mov    %rcx,%rdx
   140133332:	lea    (%rcx,%rcx,1),%rcx
   140133336:	cmp    %rcx,%rdx
   140133339:	jae    140124bb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e4>
   14013333f:	mov    %eax,0x60(%rsp)
   140133343:	mov    %rcx,%rdx
   140133346:	lea    0x1048(%rbx),%rcx
   14013334d:	vzeroupper
   140133350:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133355:	mov    0x1050(%rbx),%rax
   14013335c:	mov    0x40(%rsp),%rsi
   140133361:	add    0x1048(%rbx),%rsi
   140133368:	mov    %rax,0x38(%rsp)
   14013336d:	lea    0x8(%rsi),%r8
   140133371:	mov    0x60(%rsp),%eax
   140133375:	jmp    140124bb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e4>
   14013337a:	mov    0x1050(%rbx),%rax
   140133381:	mov    %rsi,%r12
   140133384:	sub    %rdx,%r12
   140133387:	mov    %rax,%rcx
   14013338a:	sub    %rdx,%rcx
   14013338d:	sar    $0x3,%rcx
   140133391:	lea    (%rcx,%rcx,1),%r9
   140133395:	cmp    %r9,%rcx
   140133398:	jb     140135b37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12267>
   14013339e:	vzeroupper
   1401333a1:	jmp    14012b92a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x805a>
   1401333a6:	lea    0x680(%rsp),%rcx
   1401333ae:	lea    0x228710(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   1401333b5:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   1401333ba:	mov    0x680(%rsp),%rax
   1401333c2:	mov    %rax,0x1c8(%rsp)
   1401333ca:	mov    $0x1,%r12d
   1401333d0:	jmp    14012c4fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   1401333d5:	mov    0x1050(%rbx),%rax
   1401333dc:	mov    %rsi,%rbp
   1401333df:	sub    %rdx,%rbp
   1401333e2:	mov    %rax,%rcx
   1401333e5:	sub    %rdx,%rcx
   1401333e8:	sar    $0x3,%rcx
   1401333ec:	lea    (%rcx,%rcx,1),%r10
   1401333f0:	cmp    %r10,%rcx
   1401333f3:	jae    14012d622 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d52>
   1401333f9:	mov    %r10,%rdx
   1401333fc:	lea    0x1048(%rbx),%rcx
   140133403:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133408:	mov    0x1048(%rbx),%rdx
   14013340f:	mov    0x1050(%rbx),%rax
   140133416:	lea    (%rdx,%rbp,1),%rsi
   14013341a:	lea    0x10(%rsi),%r8
   14013341e:	jmp    14012d622 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d52>
   140133423:	mov    0x1c8(%rsp),%rax
   14013342b:	sub    $0x8,%rsi
   14013342f:	mov    %rax,0x210(%rsp)
   140133437:	mov    (%rsi),%rax
   14013343a:	mov    %rax,0x208(%rsp)
   140133442:	jmp    1401252a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19d4>
   140133447:	mov    0x1048(%rbx),%rdx
   14013344e:	mov    %rsi,%rcx
   140133451:	sub    %rdx,%rcx
   140133454:	mov    %rcx,0x40(%rsp)
   140133459:	mov    0x1050(%rbx),%rcx
   140133460:	mov    %rcx,0x38(%rsp)
   140133465:	sub    %rdx,%rcx
   140133468:	mov    %rcx,%rdx
   14013346b:	sar    $0x3,%rdx
   14013346f:	lea    (%rdx,%rdx,1),%rcx
   140133473:	cmp    %rcx,%rdx
   140133476:	jae    140124f7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ac>
   14013347c:	mov    %rax,0x60(%rsp)
   140133481:	mov    %rcx,%rdx
   140133484:	lea    0x1048(%rbx),%rcx
   14013348b:	vzeroupper
   14013348e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133493:	mov    0x1050(%rbx),%rax
   14013349a:	mov    0x40(%rsp),%rsi
   14013349f:	add    0x1048(%rbx),%rsi
   1401334a6:	mov    %rax,0x38(%rsp)
   1401334ab:	lea    0x8(%rsi),%r8
   1401334af:	mov    0x60(%rsp),%rax
   1401334b4:	jmp    140124f7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ac>
   1401334b9:	mov    %r10,0x40(%rsp)
   1401334be:	lea    (%r10,%r10,1),%rdx
   1401334c2:	lea    0x1048(%rbx),%rcx
   1401334c9:	vzeroupper
   1401334cc:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401334d1:	mov    0x15270(%rbx),%rcx
   1401334d8:	mov    0x152a0(%rbx),%r9
   1401334df:	mov    0x40(%rsp),%r10
   1401334e4:	jmp    14013066a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd9a>
   1401334e9:	mov    0x1048(%rbx),%rdx
   1401334f0:	mov    0x1050(%rbx),%rax
   1401334f7:	mov    %rsi,%rdi
   1401334fa:	mov    %rax,0x38(%rsp)
   1401334ff:	sub    %rdx,%rax
   140133502:	sub    %rdx,%rdi
   140133505:	sar    $0x3,%rax
   140133509:	lea    (%rax,%rax,1),%rdx
   14013350d:	cmp    %rdx,%rax
   140133510:	jae    140124de6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1516>
   140133516:	lea    0x1048(%rbx),%rcx
   14013351d:	vzeroupper
   140133520:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133525:	mov    0x1050(%rbx),%rax
   14013352c:	add    0x1048(%rbx),%rdi
   140133533:	mov    %rdi,%rsi
   140133536:	lea    0x8(%rdi),%r8
   14013353a:	mov    %rax,0x38(%rsp)
   14013353f:	jmp    140124de6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1516>
   140133544:	mov    0x1c8(%rsp),%rax
   14013354c:	sub    $0x8,%rsi
   140133550:	mov    %rax,0x2b0(%rsp)
   140133558:	mov    (%rsi),%rax
   14013355b:	mov    %rax,0x2a8(%rsp)
   140133563:	mov    %rax,%rdx
   140133566:	jmp    140125a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2166>
   14013356b:	mov    0x1c8(%rsp),%rax
   140133573:	mov    $0x1,%r12d
   140133579:	mov    %rax,0x300(%rsp)
   140133581:	mov    0x1d0(%rsp),%rax
   140133589:	mov    %rax,0x1c8(%rsp)
   140133591:	jmp    1401260ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27fe>
   140133596:	mov    0x1c8(%rsp),%rax
   14013359e:	sub    $0x8,%rsi
   1401335a2:	mov    %rax,0x3d0(%rsp)
   1401335aa:	mov    (%rsi),%rax
   1401335ad:	mov    %rax,0x3c8(%rsp)
   1401335b5:	jmp    140128857 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f87>
   1401335ba:	lea    0x680(%rsp),%rcx
   1401335c2:	lea    0x3e0(%rsp),%rdx
   1401335ca:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   1401335cf:	mov    0x688(%rsp),%rdx
   1401335d7:	lea    0x540(%rsp),%rcx
   1401335df:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401335e4:	mov    0x540(%rsp),%rax
   1401335ec:	mov    0x680(%rsp),%rcx
   1401335f4:	mov    %rax,0x1c8(%rsp)
   1401335fc:	lea    0x690(%rsp),%rax
   140133604:	cmp    %rax,%rcx
   140133607:	je     14013361a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd4a>
   140133609:	mov    0x690(%rsp),%rax
   140133611:	lea    0x1(%rax),%rdx
   140133615:	call   140338430 <operator delete(void*, unsigned long long)>
   14013361a:	mov    $0x1,%r12d
   140133620:	jmp    14012d753 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e83>
   140133625:	mov    0x1c8(%rsp),%rax
   14013362d:	mov    %rax,0x318(%rsp)
   140133635:	mov    0x1d0(%rsp),%rax
   14013363d:	mov    %rax,0x1c8(%rsp)
   140133645:	mov    %rsi,%rax
   140133648:	jmp    14013002f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc75f>
   14013364d:	mov    0x1c8(%rsp),%rax
   140133655:	sub    $0x8,%rsi
   140133659:	mov    %rax,0x380(%rsp)
   140133661:	mov    (%rsi),%rax
   140133664:	mov    %rax,0x378(%rsp)
   14013366c:	jmp    14012821a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494a>
   140133671:	mov    0x1c8(%rsp),%rdx
   140133679:	mov    $0x1,%r12d
   14013367f:	mov    %rdx,(%rax,%rdi,8)
   140133683:	mov    0x1d0(%rsp),%rax
   14013368b:	mov    %rax,0x1c8(%rsp)
   140133693:	jmp    1401275ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d1d>
   140133698:	mov    %r9,%rdx
   14013369b:	lea    0x1048(%rbx),%rcx
   1401336a2:	vzeroupper
   1401336a5:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401336aa:	mov    0x1048(%rbx),%rdx
   1401336b1:	mov    0x1050(%rbx),%rax
   1401336b8:	lea    (%rdx,%r12,1),%rsi
   1401336bc:	lea    0x10(%rsi),%r8
   1401336c0:	jmp    14012a801 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f31>
   1401336c5:	mov    0x1050(%rbx),%rax
   1401336cc:	mov    %rsi,%r12
   1401336cf:	sub    %rdx,%r12
   1401336d2:	mov    %rax,%rcx
   1401336d5:	sub    %rdx,%rcx
   1401336d8:	sar    $0x3,%rcx
   1401336dc:	lea    (%rcx,%rcx,1),%r9
   1401336e0:	cmp    %r9,%rcx
   1401336e3:	jb     140137a4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1417e>
   1401336e9:	vzeroupper
   1401336ec:	jmp    14012e06f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa79f>
   1401336f1:	mov    0x1050(%rbx),%rax
   1401336f8:	mov    %rsi,%r12
   1401336fb:	sub    %rdx,%r12
   1401336fe:	mov    %rax,%rcx
   140133701:	sub    %rdx,%rcx
   140133704:	sar    $0x3,%rcx
   140133708:	lea    (%rcx,%rcx,1),%r9
   14013370c:	cmp    %r9,%rcx
   14013370f:	jb     140137a21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14151>
   140133715:	vzeroupper
   140133718:	jmp    14012dd9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4ce>
   14013371d:	mov    0x1048(%rbx),%rcx
   140133724:	mov    0x1050(%rbx),%rax
   14013372b:	mov    %rsi,%r12
   14013372e:	mov    %rax,0x38(%rsp)
   140133733:	sub    %rcx,%rax
   140133736:	sub    %rcx,%r12
   140133739:	mov    %rax,%rdx
   14013373c:	sar    $0x3,%rdx
   140133740:	lea    (%rdx,%rdx,1),%rcx
   140133744:	cmp    %rcx,%rdx
   140133747:	jae    14012dfa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6d0>
   14013374d:	mov    %r9b,0x40(%rsp)
   140133752:	mov    %rcx,%rdx
   140133755:	lea    0x1048(%rbx),%rcx
   14013375c:	vzeroupper
   14013375f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133764:	mov    0x1048(%rbx),%rsi
   14013376b:	mov    0x1050(%rbx),%rax
   140133772:	movzbl 0x40(%rsp),%r9d
   140133778:	add    %r12,%rsi
   14013377b:	mov    %rax,0x38(%rsp)
   140133780:	lea    0x8(%rsi),%r8
   140133784:	jmp    14012dfa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6d0>
   140133789:	mov    %r9,%rdx
   14013378c:	lea    0x1048(%rbx),%rcx
   140133793:	vzeroupper
   140133796:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013379b:	mov    0x1048(%rbx),%rdx
   1401337a2:	mov    0x1050(%rbx),%rax
   1401337a9:	lea    (%rdx,%r12,1),%rsi
   1401337ad:	lea    0x10(%rsi),%r8
   1401337b1:	jmp    14012ab51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7281>
   1401337b6:	mov    %r9,%rdx
   1401337b9:	lea    0x1048(%rbx),%rcx
   1401337c0:	vzeroupper
   1401337c3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401337c8:	mov    0x1048(%rbx),%rdx
   1401337cf:	mov    0x1050(%rbx),%rax
   1401337d6:	lea    (%rdx,%r12,1),%rsi
   1401337da:	lea    0x10(%rsi),%r8
   1401337de:	jmp    14012b1a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78d3>
   1401337e3:	mov    %r9,%rdx
   1401337e6:	lea    0x1048(%rbx),%rcx
   1401337ed:	vzeroupper
   1401337f0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401337f5:	mov    0x1048(%rbx),%rdx
   1401337fc:	mov    0x1050(%rbx),%rax
   140133803:	lea    (%rdx,%r12,1),%rsi
   140133807:	lea    0x10(%rsi),%r8
   14013380b:	jmp    14012b803 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f33>
   140133810:	mov    0x1050(%rbx),%rax
   140133817:	mov    %rsi,%r12
   14013381a:	sub    %rdx,%r12
   14013381d:	mov    %rax,%rcx
   140133820:	sub    %rdx,%rcx
   140133823:	sar    $0x3,%rcx
   140133827:	lea    (%rcx,%rcx,1),%r9
   14013382b:	cmp    %r9,%rcx
   14013382e:	jb     140137185 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138b5>
   140133834:	vzeroupper
   140133837:	jmp    14012d9a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0d7>
   14013383c:	call   1402128e0 <tersun::VMTelemetryManager::instance()>
   140133841:	cmpb   $0x0,(%rax)
   140133844:	je     14013384e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff7e>
   140133846:	addq   $0x1,0x90(%rax)
   14013384e:	mov    0x80(%rsp),%ebp
   140133855:	mov    0x152c8(%rbx),%rcx
   14013385c:	xor    %r8d,%r8d
   14013385f:	movzbl 0x7f0(%rsp),%r9d
   140133868:	mov    %rbp,%rdx
   14013386b:	call   1401717d0 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   140133870:	mov    0x1048(%rbx),%rdx
   140133877:	mov    %rsi,%rcx
   14013387a:	mov    0x60(%rsp),%r8
   14013387f:	mov    0x150c0(%rbx),%rax
   140133886:	sub    %rdx,%rcx
   140133889:	sub    %r15,%r8
   14013388c:	mov    %rcx,%rdi
   14013388f:	sar    $0x3,%rdi
   140133893:	cmp    $0x7ff,%rax
   140133899:	ja     14013879b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ecb>
   14013389f:	mov    0xa0(%rsp),%r11
   1401338a7:	lea    0x1(%rax),%r9
   1401338ab:	lea    (%rax,%rax,4),%rax
   1401338af:	mov    %r9,0x150c0(%rbx)
   1401338b6:	mov    %r11,0x10c8(%rbx,%rax,8)
   1401338be:	mov    0x40(%rsp),%r11
   1401338c3:	mov    %r8,0x10c0(%rbx,%rax,8)
   1401338cb:	mov    %rdi,0x10d0(%rbx,%rax,8)
   1401338d3:	mov    %r11,0x10d8(%rbx,%rax,8)
   1401338db:	mov    %rbp,0x10e0(%rbx,%rax,8)
   1401338e3:	mov    0x1050(%rbx),%rax
   1401338ea:	sub    %rdx,%rax
   1401338ed:	cmp    %rcx,%rax
   1401338f0:	jb     140137c07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14337>
   1401338f6:	mov    0x7e8(%rsp),%rax
   1401338fe:	mov    %rdi,0x1060(%rbx)
   140133905:	add    %r15,%rax
   140133908:	mov    %rax,0x60(%rsp)
   14013390d:	cmpb   $0x0,0x1040(%rbx)
   140133914:	je     140137bff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1432f>
   14013391a:	lea    0x1(%rax),%rbp
   14013391e:	movzbl (%rax),%eax
   140133921:	lea    0x28c778(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140133928:	xor    %r12d,%r12d
   14013392b:	mov    0xa0(%rsp),%r13
   140133933:	mov    (%rdi,%rax,8),%rax
   140133937:	jmp    *%rax
   140133939:	mov    %r9,%rdx
   14013393c:	lea    0x1048(%rbx),%rcx
   140133943:	vzeroupper
   140133946:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013394b:	mov    0x1048(%rbx),%rdx
   140133952:	mov    0x1050(%rbx),%rax
   140133959:	lea    (%rdx,%r12,1),%rsi
   14013395d:	lea    0x10(%rsi),%r8
   140133961:	jmp    14012adf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7522>
   140133966:	mov    %r9,%rdx
   140133969:	lea    0x1048(%rbx),%rcx
   140133970:	vzeroupper
   140133973:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133978:	mov    0x1048(%rbx),%rdx
   14013397f:	mov    0x1050(%rbx),%rax
   140133986:	lea    (%rdx,%r12,1),%rsi
   14013398a:	lea    0x8(%rsi),%r8
   14013398e:	jmp    140129ad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6207>
   140133993:	lea    0x520(%rsp),%r8
   14013399b:	mov    0x60(%rsp),%rdx
   1401339a0:	mov    %r8,%rcx
   1401339a3:	mov    %r8,0x60(%rsp)
   1401339a8:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   1401339ad:	mov    0x60(%rsp),%r8
   1401339b2:	jmp    14012fb9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2cd>
   1401339b7:	mov    %r9,%rdx
   1401339ba:	lea    0x1048(%rbx),%rcx
   1401339c1:	vzeroupper
   1401339c4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401339c9:	mov    0x1048(%rbx),%rdx
   1401339d0:	mov    0x1050(%rbx),%rax
   1401339d7:	lea    (%rdx,%r12,1),%rsi
   1401339db:	lea    0x10(%rsi),%r8
   1401339df:	jmp    14012ad74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74a4>
   1401339e4:	mov    0x1050(%rbx),%rax
   1401339eb:	mov    %rsi,%r12
   1401339ee:	sub    %rdx,%r12
   1401339f1:	mov    %rax,%rcx
   1401339f4:	sub    %rdx,%rcx
   1401339f7:	sar    $0x3,%rcx
   1401339fb:	lea    (%rcx,%rcx,1),%r9
   1401339ff:	cmp    %r9,%rcx
   140133a02:	jb     140137e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14532>
   140133a08:	vzeroupper
   140133a0b:	jmp    14012e204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa934>
   140133a10:	mov    0x1c8(%rsp),%rax
   140133a18:	lea    0x680(%rsp),%rcx
   140133a20:	lea    0x22809e(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140133a27:	mov    %rax,0x1d0(%rsp)
   140133a2f:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   140133a34:	mov    0x680(%rsp),%rax
   140133a3c:	mov    $0x2,%r12d
   140133a42:	mov    %rax,0x1c8(%rsp)
   140133a4a:	jmp    14012c4fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   140133a4f:	mov    0x1050(%rbx),%rax
   140133a56:	mov    %rsi,%r12
   140133a59:	sub    %rdx,%r12
   140133a5c:	mov    %rax,%rcx
   140133a5f:	sub    %rdx,%rcx
   140133a62:	sar    $0x3,%rcx
   140133a66:	lea    (%rcx,%rcx,1),%r9
   140133a6a:	cmp    %r9,%rcx
   140133a6d:	jb     1401371f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13925>
   140133a73:	vzeroupper
   140133a76:	jmp    14012ddd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa501>
   140133a7b:	mov    %r9,%rdx
   140133a7e:	lea    0x1048(%rbx),%rcx
   140133a85:	vzeroupper
   140133a88:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133a8d:	mov    0x1048(%rbx),%rdx
   140133a94:	mov    0x1050(%rbx),%rax
   140133a9b:	lea    (%rdx,%r12,1),%rsi
   140133a9f:	lea    0x10(%rsi),%r8
   140133aa3:	jmp    14012b40a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b3a>
   140133aa8:	lea    0x15270(%rbx),%rcx
   140133aaf:	mov    %rbx,%rdx
   140133ab2:	vzeroupper
   140133ab5:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140133aba:	jmp    14013067b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdab>
   140133abf:	mov    0x1050(%rbx),%rax
   140133ac6:	mov    %rsi,%r12
   140133ac9:	sub    %rdx,%r12
   140133acc:	mov    %rax,%rcx
   140133acf:	sub    %rdx,%rcx
   140133ad2:	sar    $0x3,%rcx
   140133ad6:	lea    (%rcx,%rcx,1),%r9
   140133ada:	cmp    %r9,%rcx
   140133add:	jb     140137762 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e92>
   140133ae3:	vzeroupper
   140133ae6:	jmp    14012de04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa534>
   140133aeb:	mov    %r9,%rdx
   140133aee:	lea    0x1048(%rbx),%rcx
   140133af5:	vzeroupper
   140133af8:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133afd:	mov    0x1048(%rbx),%rdx
   140133b04:	mov    0x1050(%rbx),%rax
   140133b0b:	lea    (%rdx,%r12,1),%rsi
   140133b0f:	lea    0x10(%rsi),%r8
   140133b13:	jmp    14012ac4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x737a>
   140133b18:	lea    0x338(%rsp),%rcx
   140133b20:	call   14021a530 <setun::VMValue::as_int() const>
   140133b25:	mov    %rax,%r9
   140133b28:	test   %rax,%rax
   140133b2b:	js     140133cbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103ed>
   140133b31:	mov    %rdi,%rcx
   140133b34:	mov    %r9,0x40(%rsp)
   140133b39:	call   140146e40 <setun::ArrayObject::size() const>
   140133b3e:	mov    0x40(%rsp),%r9
   140133b43:	cmp    %rax,%r9
   140133b46:	jae    140133cd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10408>
   140133b4c:	test   %r12b,%r12b
   140133b4f:	je     140137684 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13db4>
   140133b55:	sub    $0x1,%r12b
   140133b59:	je     14013765c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d8c>
   140133b5f:	lea    0x8(%rsi),%r8
   140133b63:	cmp    0x38(%rsp),%r8
   140133b68:	jae    14013778f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ebf>
   140133b6e:	mov    0x1d0(%rsp),%rax
   140133b76:	mov    %r9,%rdx
   140133b79:	mov    %rdi,%rcx
   140133b7c:	mov    %r8,0x40(%rsp)
   140133b81:	mov    $0x2,%r12d
   140133b87:	mov    %rax,(%rsi)
   140133b8a:	mov    0x1c8(%rsp),%rax
   140133b92:	mov    %rax,0x1d0(%rsp)
   140133b9a:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140133b9f:	mov    0x40(%rsp),%rsi
   140133ba4:	mov    %rax,0x1c8(%rsp)
   140133bac:	jmp    140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   140133bb1:	lea    0x338(%rsp),%rdx
   140133bb9:	lea    0x680(%rsp),%rcx
   140133bc1:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140133bc6:	mov    0x40(%rsp),%rcx
   140133bcb:	lea    0x680(%rsp),%rdx
   140133bd3:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133bd8:	mov    0x680(%rsp),%rcx
   140133be0:	mov    %rax,0x1c8(%rsp)
   140133be8:	lea    0x690(%rsp),%rax
   140133bf0:	cmp    %rax,%rcx
   140133bf3:	je     14012d186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b6>
   140133bf9:	mov    0x690(%rsp),%rax
   140133c01:	lea    0x1(%rax),%rdx
   140133c05:	call   140338430 <operator delete(void*, unsigned long long)>
   140133c0a:	jmp    14012d186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b6>
   140133c0f:	mov    0x1050(%rbx),%rax
   140133c16:	mov    %rax,0x38(%rsp)
   140133c1b:	sub    %rdx,%rax
   140133c1e:	sar    $0x3,%rax
   140133c22:	lea    (%rax,%rax,1),%rcx
   140133c26:	cmp    %rcx,%rax
   140133c29:	jae    14012e7ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaeea>
   140133c2f:	sub    %rdx,%rsi
   140133c32:	mov    %rcx,%rdx
   140133c35:	lea    0x1048(%rbx),%rcx
   140133c3c:	vzeroupper
   140133c3f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133c44:	mov    0x1048(%rbx),%rdx
   140133c4b:	mov    0x1050(%rbx),%rax
   140133c52:	add    %rdx,%rsi
   140133c55:	mov    %rax,0x38(%rsp)
   140133c5a:	lea    0x8(%rsi),%r8
   140133c5e:	jmp    14012e7ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaeea>
   140133c63:	mov    %r9,%rdx
   140133c66:	lea    0x1048(%rbx),%rcx
   140133c6d:	vzeroupper
   140133c70:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133c75:	mov    0x1048(%rbx),%rdx
   140133c7c:	mov    0x1050(%rbx),%rax
   140133c83:	lea    (%rdx,%r12,1),%rsi
   140133c87:	lea    0x10(%rsi),%r8
   140133c8b:	jmp    14012aa55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7185>
   140133c90:	mov    %r9,%rdx
   140133c93:	lea    0x1048(%rbx),%rcx
   140133c9a:	vzeroupper
   140133c9d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133ca2:	mov    0x1048(%rbx),%rdx
   140133ca9:	mov    0x1050(%rbx),%rax
   140133cb0:	lea    (%rdx,%r12,1),%rsi
   140133cb4:	lea    0x10(%rsi),%r8
   140133cb8:	jmp    14012aa16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7146>
   140133cbd:	mov    %rdi,%rcx
   140133cc0:	mov    %rax,0x40(%rsp)
   140133cc5:	call   140146e40 <setun::ArrayObject::size() const>
   140133cca:	mov    0x40(%rsp),%r9
   140133ccf:	add    %rax,%r9
   140133cd2:	jns    140133b31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10261>
   140133cd8:	test   %r12b,%r12b
   140133cdb:	je     14012d174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98a4>
   140133ce1:	sub    $0x1,%r12b
   140133ce5:	jne    14012ebbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb2ed>
   140133ceb:	mov    0x1c8(%rsp),%rax
   140133cf3:	mov    $0x2,%r12d
   140133cf9:	mov    %rax,0x1d0(%rsp)
   140133d01:	mov    $0x1fff,%eax
   140133d06:	shl    $0x33,%rax
   140133d0a:	mov    %rax,0x1c8(%rsp)
   140133d12:	jmp    140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   140133d17:	nopw   0x0(%rax,%rax,1)
   140133d20:	mov    0x1048(%rbx),%rdx
   140133d27:	mov    0x1050(%rbx),%rax
   140133d2e:	lea    0x10(%rsi),%r8
   140133d32:	cmp    0x38(%rsp),%r8
   140133d37:	jae    1401379d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14103>
   140133d3d:	vzeroupper
   140133d40:	mov    0x1d0(%rsp),%rcx
   140133d48:	mov    %rcx,(%rsi)
   140133d4b:	mov    0x1c8(%rsp),%rcx
   140133d53:	mov    %rcx,0x8(%rsi)
   140133d57:	jmp    14013199d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0cd>
   140133d5c:	mov    %r9,%rdx
   140133d5f:	lea    0x1048(%rbx),%rcx
   140133d66:	vzeroupper
   140133d69:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133d6e:	mov    0x1048(%rbx),%rdx
   140133d75:	mov    0x1050(%rbx),%rax
   140133d7c:	lea    (%rdx,%r12,1),%rsi
   140133d80:	lea    0x10(%rsi),%r8
   140133d84:	jmp    14012b3cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7afb>
   140133d89:	mov    %r9,%rdx
   140133d8c:	lea    0x1048(%rbx),%rcx
   140133d93:	vzeroupper
   140133d96:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133d9b:	mov    0x1048(%rbx),%rdx
   140133da2:	mov    0x1050(%rbx),%rax
   140133da9:	lea    (%rdx,%r12,1),%rsi
   140133dad:	lea    0x10(%rsi),%r8
   140133db1:	jmp    14012bcfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x842e>
   140133db6:	mov    0x1050(%rbx),%rax
   140133dbd:	mov    %rsi,%r12
   140133dc0:	sub    %rdx,%r12
   140133dc3:	mov    %rax,%rcx
   140133dc6:	sub    %rdx,%rcx
   140133dc9:	sar    $0x3,%rcx
   140133dcd:	lea    (%rcx,%rcx,1),%r9
   140133dd1:	cmp    %r9,%rcx
   140133dd4:	jb     140136142 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12872>
   140133dda:	vzeroupper
   140133ddd:	jmp    14012dca4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3d4>
   140133de2:	mov    0x1050(%rbx),%rax
   140133de9:	mov    %rsi,%r12
   140133dec:	sub    %rdx,%r12
   140133def:	mov    %rax,%rcx
   140133df2:	sub    %rdx,%rcx
   140133df5:	sar    $0x3,%rcx
   140133df9:	lea    (%rcx,%rcx,1),%r9
   140133dfd:	cmp    %r9,%rcx
   140133e00:	jb     14013812c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1485c>
   140133e06:	vzeroupper
   140133e09:	jmp    14012dc71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a1>
   140133e0e:	cmp    $0x1,%dil
   140133e12:	je     140137c5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1438c>
   140133e18:	cmp    $0x2,%r12b
   140133e1c:	je     140137c28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14358>
   140133e22:	cmp    $0x1,%r12b
   140133e26:	jne    140137c1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1434c>
   140133e2c:	mov    0x1048(%rbx),%rdx
   140133e33:	lea    0x8(%rsi),%r8
   140133e37:	cmp    0x38(%rsp),%r8
   140133e3c:	jae    140136fad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136dd>
   140133e42:	mov    0x1c8(%rsp),%rax
   140133e4a:	xor    %r12d,%r12d
   140133e4d:	mov    %rax,(%rsi)
   140133e50:	mov    %r8,%rsi
   140133e53:	movzbl %dil,%r9d
   140133e57:	mov    0x1068(%rbx),%rcx
   140133e5e:	movzbl %dil,%eax
   140133e62:	imul   $0xfffffffffffffff8,%r9,%r10
   140133e66:	add    %r13,%r9
   140133e69:	lea    -0x1(%rax),%r11d
   140133e6d:	xor    %eax,%eax
   140133e6f:	lea    (%rcx,%r9,8),%r8
   140133e73:	mov    -0x8(%rsi,%rax,1),%r9
   140133e78:	mov    %r9,(%r8,%rax,1)
   140133e7c:	sub    $0x8,%rax
   140133e80:	cmp    %r10,%rax
   140133e83:	jne    140133e73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105a3>
   140133e85:	mov    %rsi,%r8
   140133e88:	imul   $0xfffffffffffffff8,%r11,%r11
   140133e8c:	mov    -0x8(%r8,%rax,1),%rax
   140133e91:	lea    -0x10(%rsi,%r11,1),%rsi
   140133e96:	mov    %rax,(%rcx,%r13,8)
   140133e9a:	jmp    14012ed68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb498>
   140133e9f:	mov    0x1050(%rbx),%rax
   140133ea6:	mov    %rsi,%r12
   140133ea9:	sub    %rdx,%r12
   140133eac:	mov    %rax,%rcx
   140133eaf:	sub    %rdx,%rcx
   140133eb2:	sar    $0x3,%rcx
   140133eb6:	lea    (%rcx,%rcx,1),%r9
   140133eba:	cmp    %r9,%rcx
   140133ebd:	jb     140136deb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1351b>
   140133ec3:	vzeroupper
   140133ec6:	jmp    14012da0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa13d>
   140133ecb:	cmp    $0x2,%r12b
   140133ecf:	je     140137467 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b97>
   140133ed5:	cmp    $0x1,%r12b
   140133ed9:	je     140137435 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b65>
   140133edf:	mov    0x1048(%rbx),%rdx
   140133ee6:	mov    0x1050(%rbx),%rax
   140133eed:	vzeroupper
   140133ef0:	sub    %rdx,%rsi
   140133ef3:	sub    %rdx,%rax
   140133ef6:	mov    %rsi,%r8
   140133ef9:	sar    $0x3,%r8
   140133efd:	cmp    %rsi,%rax
   140133f00:	jb     140137416 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b46>
   140133f06:	mov    %r8,0x1060(%rbx)
   140133f0d:	mov    %rbx,%rdx
   140133f10:	lea    0x15270(%rbx),%rcx
   140133f17:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140133f1c:	mov    0x1060(%rbx),%rax
   140133f23:	mov    0x1048(%rbx),%rdx
   140133f2a:	lea    (%rdx,%rax,8),%rsi
   140133f2e:	jmp    1401302c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9f4>
   140133f33:	mov    0x1050(%rbx),%rax
   140133f3a:	mov    %rsi,%r12
   140133f3d:	sub    %rdx,%r12
   140133f40:	mov    %rax,%rcx
   140133f43:	sub    %rdx,%rcx
   140133f46:	sar    $0x3,%rcx
   140133f4a:	lea    (%rcx,%rcx,1),%r9
   140133f4e:	cmp    %r9,%rcx
   140133f51:	jb     140135d41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12471>
   140133f57:	vzeroupper
   140133f5a:	jmp    14012dfd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa706>
   140133f5f:	mov    0x40(%rsp),%rcx
   140133f64:	lea    0x318(%rsp),%r8
   140133f6c:	mov    %rdi,%rdx
   140133f6f:	call   14014a420 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   140133f74:	jmp    14012f28a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9ba>
   140133f79:	add    %rdx,%rdx
   140133f7c:	lea    0x1068(%rbx),%rcx
   140133f83:	vzeroupper
   140133f86:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133f8b:	jmp    140126285 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b5>
   140133f90:	mov    0x1050(%rbx),%rax
   140133f97:	mov    %rsi,%r12
   140133f9a:	sub    %rdx,%r12
   140133f9d:	mov    %rax,%rcx
   140133fa0:	sub    %rdx,%rcx
   140133fa3:	sar    $0x3,%rcx
   140133fa7:	lea    (%rcx,%rcx,1),%r9
   140133fab:	cmp    %r9,%rcx
   140133fae:	jb     140135d6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1249e>
   140133fb4:	vzeroupper
   140133fb7:	jmp    14012dcd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa407>
   140133fbc:	mov    %r9,%rdx
   140133fbf:	lea    0x1048(%rbx),%rcx
   140133fc6:	vzeroupper
   140133fc9:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133fce:	mov    0x1048(%rbx),%rdx
   140133fd5:	mov    0x1050(%rbx),%rax
   140133fdc:	lea    (%rdx,%r12,1),%rsi
   140133fe0:	lea    0x10(%rsi),%r8
   140133fe4:	jmp    14012ac0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x733b>
   140133fe9:	mov    $0x1,%r12d
   140133fef:	jmp    14012d641 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d71>
   140133ff4:	mov    0x1050(%rbx),%rax
   140133ffb:	mov    %rsi,%r12
   140133ffe:	sub    %rdx,%r12
   140134001:	mov    %rax,%rcx
   140134004:	sub    %rdx,%rcx
   140134007:	sar    $0x3,%rcx
   14013400b:	lea    (%rcx,%rcx,1),%r9
   14013400f:	cmp    %r9,%rcx
   140134012:	jb     140137384 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ab4>
   140134018:	vzeroupper
   14013401b:	jmp    14012de37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa567>
   140134020:	mov    0x1050(%rbx),%rax
   140134027:	mov    %rsi,%r12
   14013402a:	sub    %rdx,%r12
   14013402d:	mov    %rax,%rcx
   140134030:	sub    %rdx,%rcx
   140134033:	sar    $0x3,%rcx
   140134037:	lea    (%rcx,%rcx,1),%r9
   14013403b:	cmp    %r9,%rcx
   14013403e:	jb     1401381fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1492c>
   140134044:	vzeroupper
   140134047:	jmp    14012e138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa868>
   14013404c:	test   %r12b,%r12b
   14013404f:	je     14013799a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140ca>
   140134055:	sub    $0x1,%r12b
   140134059:	je     140137965 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14095>
   14013405f:	lea    0x8(%rsi),%r8
   140134063:	cmp    0x38(%rsp),%r8
   140134068:	jae    140137913 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14043>
   14013406e:	mov    0x1d0(%rsp),%rax
   140134076:	mov    %r8,0x40(%rsp)
   14013407b:	movslq %edi,%rdx
   14013407e:	mov    %rax,(%rsi)
   140134081:	mov    0x1c8(%rsp),%rax
   140134089:	mov    %rax,0x1d0(%rsp)
   140134091:	jmp    140130f69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd699>
   140134096:	mov    %r9,%rdx
   140134099:	lea    0x1048(%rbx),%rcx
   1401340a0:	vzeroupper
   1401340a3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401340a8:	mov    0x1048(%rbx),%rdx
   1401340af:	mov    0x1050(%rbx),%rax
   1401340b6:	lea    (%rdx,%r12,1),%rsi
   1401340ba:	lea    0x10(%rsi),%r8
   1401340be:	jmp    14012a8bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6feb>
   1401340c3:	mov    %eax,0x60(%rsp)
   1401340c7:	add    %rdx,%rdx
   1401340ca:	lea    0x1068(%rbx),%rcx
   1401340d1:	mov    %r8d,0x80(%rsp)
   1401340d9:	mov    %r9d,0x40(%rsp)
   1401340de:	vzeroupper
   1401340e1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401340e6:	mov    0x80(%rsp),%r8d
   1401340ee:	mov    0x60(%rsp),%eax
   1401340f2:	mov    0x40(%rsp),%r9d
   1401340f7:	jmp    140124672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda2>
   1401340fc:	mov    0x8(%r10),%rax
   140134100:	mov    0x340(%rsp),%rdx
   140134108:	mov    %rdx,(%rax,%r9,8)
   14013410c:	cmpb   $0x0,0x1040(%rbx)
   140134113:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   140134119:	movzbl 0x0(%rbp),%eax
   14013411d:	lea    0x28bf7c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134124:	add    $0x1,%rbp
   140134128:	mov    (%rdi,%rax,8),%rax
   14013412c:	jmp    *%rax
   14013412e:	mov    0x340(%rsp),%rax
   140134136:	and    %rax,%rdx
   140134139:	cmp    0x40(%rsp),%rdx
   14013413e:	jne    14012e9d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb105>
   140134144:	mov    0x20(%r10),%rdx
   140134148:	shl    $0x10,%rax
   14013414c:	sar    $0x10,%rax
   140134150:	mov    %rax,(%rdx,%r9,8)
   140134154:	cmpb   $0x0,0x1040(%rbx)
   14013415b:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   140134161:	movzbl 0x0(%rbp),%eax
   140134165:	lea    0x28bf34(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013416c:	add    $0x1,%rbp
   140134170:	mov    (%rdi,%rax,8),%rax
   140134174:	jmp    *%rax
   140134176:	cmp    $0x4,%al
   140134178:	jne    1401340fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1082c>
   14013417a:	mov    $0xffffffff,%eax
   14013417f:	mov    $0xfffd0001,%edx
   140134184:	shl    $0x20,%rax
   140134188:	shl    $0x20,%rdx
   14013418c:	and    0x340(%rsp),%rax
   140134194:	cmp    %rdx,%rax
   140134197:	jne    14012e9d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb105>
   14013419d:	lea    0x340(%rsp),%rdx
   1401341a5:	lea    0x480(%rsp),%rcx
   1401341ad:	mov    %r10,0x40(%rsp)
   1401341b2:	mov    %r9,0x60(%rsp)
   1401341b7:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   1401341bc:	mov    0x40(%rsp),%r10
   1401341c1:	vmovdqa 0x480(%rsp),%xmm7
   1401341ca:	mov    0x490(%rsp),%rdx
   1401341d2:	imul   $0x18,0x60(%rsp),%rax
   1401341d8:	add    0x68(%r10),%rax
   1401341dc:	mov    %rdx,0x10(%rax)
   1401341e0:	vmovdqu %xmm7,(%rax)
   1401341e4:	cmpb   $0x0,0x1040(%rbx)
   1401341eb:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   1401341f1:	movzbl 0x0(%rbp),%eax
   1401341f5:	lea    0x28bea4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401341fc:	add    $0x1,%rbp
   140134200:	mov    (%rdi,%rax,8),%rax
   140134204:	jmp    *%rax
   140134206:	mov    0x340(%rsp),%rax
   14013420e:	movabs $0xfff7ffffffffffff,%rdx
   140134218:	cmp    %rax,%rdx
   14013421b:	jae    14013422f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1095f>
   14013421d:	mov    $0x3fff,%edx
   140134222:	shl    $0x32,%rdx
   140134226:	cmp    %rdx,%rax
   140134229:	jne    14012e9d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb105>
   14013422f:	lea    0x340(%rsp),%rcx
   140134237:	mov    %r9,0x60(%rsp)
   14013423c:	mov    %r10,0x40(%rsp)
   140134241:	call   14021bc80 <setun::VMValue::as_float() const>
   140134246:	mov    0x40(%rsp),%r10
   14013424b:	mov    0x60(%rsp),%r9
   140134250:	mov    0x50(%r10),%rax
   140134254:	vmovsd %xmm0,(%rax,%r9,8)
   14013425a:	cmpb   $0x0,0x1040(%rbx)
   140134261:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   140134267:	movzbl 0x0(%rbp),%eax
   14013426b:	lea    0x28be2e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134272:	add    $0x1,%rbp
   140134276:	mov    (%rdi,%rax,8),%rax
   14013427a:	jmp    *%rax
   14013427c:	mov    %r9,%rdx
   14013427f:	lea    0x1048(%rbx),%rcx
   140134286:	vzeroupper
   140134289:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013428e:	mov    0x1048(%rbx),%rdx
   140134295:	mov    0x1050(%rbx),%rax
   14013429c:	lea    (%rdx,%r12,1),%rsi
   1401342a0:	lea    0x10(%rsi),%r8
   1401342a4:	jmp    14012b164 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7894>
   1401342a9:	mov    0x1c8(%rsp),%rax
   1401342b1:	mov    %rax,0x1d0(%rsp)
   1401342b9:	movabs $0xfff8000000000003,%rax
   1401342c3:	mov    %rax,0x1c8(%rsp)
   1401342cb:	mov    $0x2,%r12d
   1401342d1:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   1401342d6:	mov    %r8d,0x60(%rsp)
   1401342db:	add    %rdx,%rdx
   1401342de:	lea    0x1068(%rbx),%rcx
   1401342e5:	mov    %r9d,0x80(%rsp)
   1401342ed:	mov    %eax,0x40(%rsp)
   1401342f1:	vzeroupper
   1401342f4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401342f9:	mov    0x80(%rsp),%r9d
   140134301:	mov    0x40(%rsp),%eax
   140134305:	mov    0x60(%rsp),%r8d
   14013430a:	jmp    140124879 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa9>
   14013430f:	mov    0x1050(%rbx),%rax
   140134316:	mov    %rsi,%r12
   140134319:	sub    %rdx,%r12
   14013431c:	mov    %rax,%rcx
   14013431f:	sub    %rdx,%rcx
   140134322:	sar    $0x3,%rcx
   140134326:	lea    (%rcx,%rcx,1),%r9
   14013432a:	cmp    %r9,%rcx
   14013432d:	jb     1401362e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a10>
   140134333:	vzeroupper
   140134336:	jmp    14012db72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2a2>
   14013433b:	mov    0x1050(%rbx),%rax
   140134342:	mov    %rsi,%r12
   140134345:	sub    %rdx,%r12
   140134348:	mov    %rax,%rcx
   14013434b:	sub    %rdx,%rcx
   14013434e:	sar    $0x3,%rcx
   140134352:	lea    (%rcx,%rcx,1),%r9
   140134356:	cmp    %r9,%rcx
   140134359:	jb     140138325 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a55>
   14013435f:	vzeroupper
   140134362:	jmp    14012dc3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa36e>
   140134367:	mov    0x1050(%rbx),%rax
   14013436e:	mov    %rsi,%r12
   140134371:	sub    %rdx,%r12
   140134374:	mov    %rax,%rcx
   140134377:	sub    %rdx,%rcx
   14013437a:	sar    $0x3,%rcx
   14013437e:	lea    (%rcx,%rcx,1),%r9
   140134382:	cmp    %r9,%rcx
   140134385:	jb     140137057 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13787>
   14013438b:	vzeroupper
   14013438e:	jmp    14012d974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0a4>
   140134393:	mov    0x1050(%rbx),%rax
   14013439a:	mov    %rsi,%r12
   14013439d:	sub    %rdx,%r12
   1401343a0:	mov    %rax,%rcx
   1401343a3:	sub    %rdx,%rcx
   1401343a6:	sar    $0x3,%rcx
   1401343aa:	lea    (%rcx,%rcx,1),%r9
   1401343ae:	cmp    %r9,%rcx
   1401343b1:	jb     14013755d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c8d>
   1401343b7:	vzeroupper
   1401343ba:	jmp    14012daa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1d6>
   1401343bf:	mov    0x1050(%rbx),%rax
   1401343c6:	mov    %rsi,%r12
   1401343c9:	sub    %rdx,%r12
   1401343cc:	mov    %rax,%rcx
   1401343cf:	sub    %rdx,%rcx
   1401343d2:	sar    $0x3,%rcx
   1401343d6:	lea    (%rcx,%rcx,1),%r9
   1401343da:	cmp    %r9,%rcx
   1401343dd:	jb     140135fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126d5>
   1401343e3:	vzeroupper
   1401343e6:	jmp    14012dc0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa33b>
   1401343eb:	mov    0x1c8(%rsp),%rax
   1401343f3:	mov    0x50(%rdi),%rdx
   1401343f7:	sub    0x48(%rdi),%rdx
   1401343fb:	mov    %rax,0x1d0(%rsp)
   140134403:	mov    0x60(%rdi),%rax
   140134407:	sar    $0x3,%rdx
   14013440b:	test   %rax,%rax
   14013440e:	je     140137f8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146bd>
   140134414:	mov    0x18(%rax),%rax
   140134418:	add    %rax,%rdx
   14013441b:	lea    0x680(%rsp),%rcx
   140134423:	mov    $0x2,%r12d
   140134429:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14013442e:	mov    0x680(%rsp),%rax
   140134436:	mov    %rax,0x1c8(%rsp)
   14013443e:	jmp    140131c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe336>
   140134443:	mov    0x1050(%rbx),%rax
   14013444a:	mov    %rsi,%r12
   14013444d:	sub    %rdx,%r12
   140134450:	mov    %rax,%rcx
   140134453:	sub    %rdx,%rcx
   140134456:	sar    $0x3,%rcx
   14013445a:	lea    (%rcx,%rcx,1),%r9
   14013445e:	cmp    %r9,%rcx
   140134461:	jb     1401372a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139d4>
   140134467:	vzeroupper
   14013446a:	jmp    14012dd0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa43a>
   14013446f:	mov    0x1050(%rbx),%rax
   140134476:	mov    %rsi,%r12
   140134479:	sub    %rdx,%r12
   14013447c:	mov    %rax,%rcx
   14013447f:	sub    %rdx,%rcx
   140134482:	sar    $0x3,%rcx
   140134486:	lea    (%rcx,%rcx,1),%r9
   14013448a:	cmp    %r9,%rcx
   14013448d:	jb     140137840 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f70>
   140134493:	vzeroupper
   140134496:	jmp    14012df7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6ae>
   14013449b:	mov    0x8(%r10),%eax
   14013449f:	xor    %r12d,%r12d
   1401344a2:	add    $0x1,%eax
   1401344a5:	mov    %eax,0x8(%r10)
   1401344a9:	cmp    0xc(%r10),%eax
   1401344ad:	jb     140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   1401344b3:	mov    0x150c0(%rbx),%r12
   1401344ba:	test   %r12,%r12
   1401344bd:	je     1401344d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c00>
   1401344bf:	lea    -0x1(%r12),%rax
   1401344c4:	imul   $0x28,%rax,%rax
   1401344c8:	mov    0x10e0(%rbx,%rax,1),%r12
   1401344d0:	mov    0x1048(%rbx),%rdx
   1401344d7:	mov    0x1050(%rbx),%rax
   1401344de:	sub    %r15,%rbp
   1401344e1:	mov    %rbp,0x1038(%rbx)
   1401344e8:	sub    %rdx,%rsi
   1401344eb:	sub    %rdx,%rax
   1401344ee:	mov    %rsi,%rbp
   1401344f1:	sar    $0x3,%rbp
   1401344f5:	cmp    %rsi,%rax
   1401344f8:	jb     1401375b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ce7>
   1401344fe:	vzeroupper
   140134501:	mov    %rbp,0x1060(%rbx)
   140134508:	mov    %rbx,%rdx
   14013450b:	mov    %r12,%r9
   14013450e:	mov    %r14,%r8
   140134511:	mov    0x40(%rsp),%eax
   140134515:	vmovdqa 0x2285c3(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   14013451d:	movb   $0x0,0x153a0(%rbx)
   140134524:	mov    0x152c8(%rbx),%rcx
   14013452b:	mov    %r10,0x60(%rsp)
   140134530:	vmovdqa %xmm0,0x15390(%rbx)
   140134538:	mov    %r10,0x28(%rsp)
   14013453d:	mov    %eax,0x20(%rsp)
   140134541:	call   140172af0 <setun::JITManager::slow_tiering_coordinator_osr(setun::VM*, setun::Chunk const&, unsigned long long, unsigned int, setun::LoopHotData&)>
   140134546:	mov    0x1048(%rbx),%rdx
   14013454d:	mov    0x60(%rsp),%r10
   140134552:	mov    %eax,%ecx
   140134554:	mov    0x1060(%rbx),%rax
   14013455b:	mov    0x1038(%rbx),%rbp
   140134562:	mov    0x150c0(%rbx),%r13
   140134569:	lea    (%rdx,%rax,8),%rsi
   14013456d:	mov    0x1050(%rbx),%rax
   140134574:	add    %r15,%rbp
   140134577:	test   %r13,%r13
   14013457a:	mov    %rax,0x38(%rsp)
   14013457f:	je     140134591 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cc1>
   140134581:	lea    -0x1(%r13),%rax
   140134585:	imul   $0x28,%rax,%rax
   140134589:	mov    0x10c8(%rbx,%rax,1),%r13
   140134591:	test   %cl,%cl
   140134593:	jne    14013459d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ccd>
   140134595:	addl   $0x3e8,0xc(%r10)
   14013459d:	xor    %r12d,%r12d
   1401345a0:	jmp    140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   1401345a5:	mov    0x1c8(%rsp),%rax
   1401345ad:	mov    $0x2,%r12d
   1401345b3:	mov    %rax,0x1d0(%rsp)
   1401345bb:	mov    $0x1fff,%eax
   1401345c0:	shl    $0x33,%rax
   1401345c4:	mov    %rax,0x1c8(%rsp)
   1401345cc:	jmp    14012f204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb934>
   1401345d1:	mov    0x1050(%rbx),%rax
   1401345d8:	mov    %rsi,%rbp
   1401345db:	sub    %rdx,%rbp
   1401345de:	mov    %rax,%rcx
   1401345e1:	sub    %rdx,%rcx
   1401345e4:	sar    $0x3,%rcx
   1401345e8:	lea    (%rcx,%rcx,1),%r10
   1401345ec:	cmp    %r10,%rcx
   1401345ef:	jae    14012dd6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa49e>
   1401345f5:	mov    %r10,%rdx
   1401345f8:	lea    0x1048(%rbx),%rcx
   1401345ff:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134604:	mov    0x1048(%rbx),%rdx
   14013460b:	mov    0x1050(%rbx),%rax
   140134612:	lea    (%rdx,%rbp,1),%rsi
   140134616:	lea    0x8(%rsi),%r8
   14013461a:	jmp    14012dd6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa49e>
   14013461f:	mov    0x1050(%rbx),%rax
   140134626:	mov    %rsi,%r12
   140134629:	sub    %rdx,%r12
   14013462c:	mov    %rax,%rcx
   14013462f:	sub    %rdx,%rcx
   140134632:	sar    $0x3,%rcx
   140134636:	lea    (%rcx,%rcx,1),%r9
   14013463a:	cmp    %r9,%rcx
   14013463d:	jb     14013762f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d5f>
   140134643:	vzeroupper
   140134646:	jmp    14012e0a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7d2>
   14013464b:	mov    0x1050(%rbx),%rax
   140134652:	mov    0x1048(%rbx),%rdx
   140134659:	mov    %rax,0x38(%rsp)
   14013465e:	sub    %rdx,%rax
   140134661:	sar    $0x3,%rax
   140134665:	lea    (%rax,%rax,1),%rcx
   140134669:	cmp    %rcx,%rax
   14013466c:	jae    14012e4fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac2d>
   140134672:	sub    %rdx,%rsi
   140134675:	mov    %rcx,%rdx
   140134678:	lea    0x1048(%rbx),%rcx
   14013467f:	vzeroupper
   140134682:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134687:	mov    0x1050(%rbx),%rax
   14013468e:	add    0x1048(%rbx),%rsi
   140134695:	lea    0x8(%rsi),%r8
   140134699:	mov    %rax,0x38(%rsp)
   14013469e:	jmp    14012e4fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac2d>
   1401346a3:	mov    0x1050(%rbx),%rax
   1401346aa:	mov    %rsi,%r12
   1401346ad:	sub    %rdx,%r12
   1401346b0:	mov    %rax,%rcx
   1401346b3:	sub    %rdx,%rcx
   1401346b6:	sar    $0x3,%rcx
   1401346ba:	lea    (%rcx,%rcx,1),%r9
   1401346be:	cmp    %r9,%rcx
   1401346c1:	jb     140136081 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127b1>
   1401346c7:	vzeroupper
   1401346ca:	jmp    14012e16b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa89b>
   1401346cf:	mov    %r9,%rdx
   1401346d2:	lea    0x1048(%rbx),%rcx
   1401346d9:	vzeroupper
   1401346dc:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401346e1:	mov    0x1048(%rbx),%rdx
   1401346e8:	mov    0x1050(%rbx),%rax
   1401346ef:	lea    (%rdx,%r12,1),%rsi
   1401346f3:	lea    0x10(%rsi),%r8
   1401346f7:	jmp    14012bd3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x846d>
   1401346fc:	mov    0x1050(%rbx),%rax
   140134703:	mov    %rsi,%r12
   140134706:	sub    %rdx,%r12
   140134709:	mov    %rax,%rcx
   14013470c:	sub    %rdx,%rcx
   14013470f:	sar    $0x3,%rcx
   140134713:	lea    (%rcx,%rcx,1),%r9
   140134717:	cmp    %r9,%rcx
   14013471a:	jb     14013616f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1289f>
   140134720:	vzeroupper
   140134723:	jmp    14012dba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2d5>
   140134728:	mov    %r9,%rdx
   14013472b:	lea    0x1048(%rbx),%rcx
   140134732:	vzeroupper
   140134735:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013473a:	mov    0x1048(%rbx),%rdx
   140134741:	mov    0x1050(%rbx),%rax
   140134748:	lea    (%rdx,%r12,1),%rsi
   14013474c:	lea    0x10(%rsi),%r8
   140134750:	jmp    14012ae31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7561>
   140134755:	mov    %r9,%rdx
   140134758:	lea    0x1048(%rbx),%rcx
   14013475f:	vzeroupper
   140134762:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134767:	mov    0x1048(%rbx),%rdx
   14013476e:	mov    0x1050(%rbx),%rax
   140134775:	lea    (%rdx,%r12,1),%rsi
   140134779:	lea    0x10(%rsi),%r8
   14013477d:	jmp    14012adb3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74e3>
   140134782:	test   %r12b,%r12b
   140134785:	jne    140134b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112be>
   14013478b:	mov    $0x1fff,%eax
   140134790:	shl    $0x33,%rax
   140134794:	mov    %rax,0x1c8(%rsp)
   14013479c:	mov    $0x1,%r12d
   1401347a2:	jmp    140131ba6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d6>
   1401347a7:	mov    0x1050(%rbx),%rax
   1401347ae:	mov    %rax,0x38(%rsp)
   1401347b3:	sub    %rdx,%rax
   1401347b6:	sar    $0x3,%rax
   1401347ba:	lea    (%rax,%rax,1),%rcx
   1401347be:	cmp    %rcx,%rax
   1401347c1:	jae    14012d8e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa019>
   1401347c7:	sub    %rdx,%rsi
   1401347ca:	mov    %rcx,%rdx
   1401347cd:	lea    0x1048(%rbx),%rcx
   1401347d4:	vzeroupper
   1401347d7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401347dc:	mov    0x1048(%rbx),%rdx
   1401347e3:	mov    0x1050(%rbx),%rax
   1401347ea:	add    %rdx,%rsi
   1401347ed:	mov    %rax,0x38(%rsp)
   1401347f2:	lea    0x10(%rsi),%r8
   1401347f6:	jmp    14012d8e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa019>
   1401347fb:	mov    0x1050(%rbx),%rax
   140134802:	mov    %rsi,%r12
   140134805:	sub    %rdx,%r12
   140134808:	mov    %rax,%rcx
   14013480b:	sub    %rdx,%rcx
   14013480e:	sar    $0x3,%rcx
   140134812:	lea    (%rcx,%rcx,1),%r9
   140134816:	cmp    %r9,%rcx
   140134819:	jb     1401369d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13106>
   14013481f:	vzeroupper
   140134822:	jmp    14012de6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59a>
   140134827:	mov    %r9,%rdx
   14013482a:	lea    0x1048(%rbx),%rcx
   140134831:	vzeroupper
   140134834:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134839:	mov    0x1048(%rbx),%rdx
   140134840:	mov    0x1050(%rbx),%rax
   140134847:	lea    (%rdx,%r12,1),%rsi
   14013484b:	lea    0x10(%rsi),%r8
   14013484f:	jmp    14012acb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73e7>
   140134854:	lea    0x310(%rsp),%rcx
   14013485c:	call   14021a530 <setun::VMValue::as_int() const>
   140134861:	mov    %rax,%r9
   140134864:	test   %rax,%rax
   140134867:	js     14013497d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110ad>
   14013486d:	mov    %rdi,%rcx
   140134870:	mov    %r9,0x60(%rsp)
   140134875:	call   140146e40 <setun::ArrayObject::size() const>
   14013487a:	mov    0x60(%rsp),%r9
   14013487f:	cmp    %rax,%r9
   140134882:	jae    140134998 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110c8>
   140134888:	test   %r12b,%r12b
   14013488b:	je     140135d31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12461>
   140134891:	sub    $0x1,%r12b
   140134895:	je     140135df7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12527>
   14013489b:	lea    0x8(%rsi),%r8
   14013489f:	cmp    0x38(%rsp),%r8
   1401348a4:	jae    140135d9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124cb>
   1401348aa:	mov    0x1d0(%rsp),%rax
   1401348b2:	mov    %r9,%rdx
   1401348b5:	mov    %rdi,%rcx
   1401348b8:	mov    %r8,0x60(%rsp)
   1401348bd:	mov    %rax,(%rsi)
   1401348c0:	mov    0x1c8(%rsp),%rax
   1401348c8:	mov    %rax,0x1d0(%rsp)
   1401348d0:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   1401348d5:	mov    %rax,0x1c8(%rsp)
   1401348dd:	mov    0x60(%rsp),%rsi
   1401348e2:	mov    $0x2,%r12d
   1401348e8:	jmp    14012f204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb934>
   1401348ed:	mov    %r9,0x40(%rsp)
   1401348f2:	lea    0x3d8(%rsp),%rcx
   1401348fa:	mov    %rdx,0x3d8(%rsp)
   140134902:	vzeroupper
   140134905:	call   14021b9a0 <setun::VMValue::payload() const>
   14013490a:	mov    0x40(%rsp),%r9
   14013490f:	mov    0x48(%rax),%rax
   140134913:	test   %rax,%rax
   140134916:	je     14012f724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe54>
   14013491c:	mov    0x38(%rax),%rcx
   140134920:	test   %rcx,%rcx
   140134923:	je     14012f724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe54>
   140134929:	mov    (%r9),%edx
   14013492c:	cmp    %edx,(%rcx)
   14013492e:	jne    14012f724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe54>
   140134934:	test   %edx,%edx
   140134936:	je     14012f724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe54>
   14013493c:	movzwl 0x4(%r9),%edx
   140134941:	mov    0x48(%rax),%rax
   140134945:	sub    $0x8,%rsi
   140134949:	mov    $0x1,%r12d
   14013494f:	mov    (%rax,%rdx,8),%rax
   140134953:	mov    %rax,0x1c8(%rsp)
   14013495b:	cmpb   $0x0,0x1040(%rbx)
   140134962:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   140134968:	movzbl 0x2(%rbp),%eax
   14013496c:	lea    0x28b72d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134973:	add    $0x3,%rbp
   140134977:	mov    (%rdi,%rax,8),%rax
   14013497b:	jmp    *%rax
   14013497d:	mov    %rdi,%rcx
   140134980:	mov    %rax,0x60(%rsp)
   140134985:	call   140146e40 <setun::ArrayObject::size() const>
   14013498a:	mov    0x60(%rsp),%r9
   14013498f:	add    %rax,%r9
   140134992:	jns    14013486d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f9d>
   140134998:	test   %r12b,%r12b
   14013499b:	je     140131ee9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe619>
   1401349a1:	sub    $0x1,%r12b
   1401349a5:	jne    14012f1bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8ef>
   1401349ab:	mov    0x1c8(%rsp),%rax
   1401349b3:	mov    %rax,0x1d0(%rsp)
   1401349bb:	mov    $0x1fff,%eax
   1401349c0:	shl    $0x33,%rax
   1401349c4:	mov    %rax,0x1c8(%rsp)
   1401349cc:	jmp    14012f1fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb92e>
   1401349d1:	mov    %r9,%rdx
   1401349d4:	lea    0x1048(%rbx),%rcx
   1401349db:	vzeroupper
   1401349de:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401349e3:	mov    0x1048(%rbx),%rdx
   1401349ea:	mov    0x1050(%rbx),%rax
   1401349f1:	lea    (%rdx,%r12,1),%rsi
   1401349f5:	lea    0x10(%rsi),%r8
   1401349f9:	jmp    14012b6dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e0d>
   1401349fe:	mov    0x400(%rsp),%rdi
   140134a06:	test   %r12b,%r12b
   140134a09:	je     140136242 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12972>
   140134a0f:	sub    $0x1,%r12b
   140134a13:	je     140136207 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12937>
   140134a19:	lea    0x8(%rsi),%r8
   140134a1d:	cmp    0x38(%rsp),%r8
   140134a22:	jae    1401361b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128e2>
   140134a28:	mov    0x1d0(%rsp),%rax
   140134a30:	mov    %r8,0x40(%rsp)
   140134a35:	lea    0x680(%rsp),%rcx
   140134a3d:	mov    %rdi,%rdx
   140134a40:	mov    %rax,(%rsi)
   140134a43:	mov    0x1c8(%rsp),%rax
   140134a4b:	mov    %rax,0x1d0(%rsp)
   140134a53:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140134a58:	mov    $0x2,%r12d
   140134a5e:	mov    0x40(%rsp),%rsi
   140134a63:	mov    0x680(%rsp),%rax
   140134a6b:	mov    %rax,0x1c8(%rsp)
   140134a73:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   140134a78:	mov    %r9,%rdx
   140134a7b:	lea    0x1048(%rbx),%rcx
   140134a82:	vzeroupper
   140134a85:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134a8a:	mov    0x1048(%rbx),%rdx
   140134a91:	mov    0x1050(%rbx),%rax
   140134a98:	lea    (%rdx,%rdi,1),%rsi
   140134a9c:	lea    0x8(%rsi),%r8
   140134aa0:	jmp    1401245dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0c>
   140134aa5:	lea    0x680(%rsp),%r10
   140134aad:	lea    0x310(%rsp),%rdx
   140134ab5:	mov    %r10,%rcx
   140134ab8:	mov    %r10,0x60(%rsp)
   140134abd:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140134ac2:	mov    0x40(%rsp),%rcx
   140134ac7:	mov    0x60(%rsp),%rdx
   140134acc:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134ad1:	mov    0x680(%rsp),%rcx
   140134ad9:	mov    %rax,0x1c8(%rsp)
   140134ae1:	lea    0x690(%rsp),%rax
   140134ae9:	cmp    %rax,%rcx
   140134aec:	je     14013479c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ecc>
   140134af2:	mov    0x690(%rsp),%rax
   140134afa:	lea    0x1(%rax),%rdx
   140134afe:	call   140338430 <operator delete(void*, unsigned long long)>
   140134b03:	jmp    14013479c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ecc>
   140134b08:	mov    %r9,%rdx
   140134b0b:	lea    0x1048(%rbx),%rcx
   140134b12:	vzeroupper
   140134b15:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b1a:	mov    0x1048(%rbx),%rdx
   140134b21:	mov    0x1050(%rbx),%rax
   140134b28:	lea    (%rdx,%r12,1),%rsi
   140134b2c:	lea    0x10(%rsi),%r8
   140134b30:	jmp    14012bb19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8249>
   140134b35:	mov    %r9,%rdx
   140134b38:	lea    0x1048(%rbx),%rcx
   140134b3f:	vzeroupper
   140134b42:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b47:	mov    0x1048(%rbx),%rdx
   140134b4e:	mov    0x1050(%rbx),%rax
   140134b55:	lea    (%rdx,%r12,1),%rsi
   140134b59:	lea    0x10(%rsi),%r8
   140134b5d:	jmp    14012b969 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8099>
   140134b62:	mov    0x1050(%rbx),%rax
   140134b69:	mov    %rsi,%r12
   140134b6c:	sub    %rdx,%r12
   140134b6f:	mov    %rax,%rcx
   140134b72:	sub    %rdx,%rcx
   140134b75:	sar    $0x3,%rcx
   140134b79:	lea    (%rcx,%rcx,1),%r9
   140134b7d:	cmp    %r9,%rcx
   140134b80:	jb     14013630d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a3d>
   140134b86:	vzeroupper
   140134b89:	jmp    14012dbd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa308>
   140134b8e:	sub    $0x1,%r12b
   140134b92:	je     140136ebb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135eb>
   140134b98:	lea    0x8(%rsi),%r8
   140134b9c:	cmp    0x38(%rsp),%r8
   140134ba1:	jae    140136e66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13596>
   140134ba7:	mov    0x1d0(%rsp),%rax
   140134baf:	mov    %rax,(%rsi)
   140134bb2:	mov    0x1c8(%rsp),%rax
   140134bba:	mov    %r8,%rsi
   140134bbd:	mov    %rax,0x1d0(%rsp)
   140134bc5:	mov    $0x1fff,%eax
   140134bca:	shl    $0x33,%rax
   140134bce:	mov    %rax,0x1c8(%rsp)
   140134bd6:	mov    $0x2,%r12d
   140134bdc:	jmp    140131ba6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d6>
   140134be1:	mov    0x540(%rsp),%rax
   140134be9:	lea    0x680(%rsp),%r10
   140134bf1:	mov    $0x1,%edx
   140134bf6:	lea    0x690(%rsp),%r12
   140134bfe:	mov    %r10,%rcx
   140134c01:	mov    %r10,0x40(%rsp)
   140134c06:	movsbl (%rax,%rdi,1),%r8d
   140134c0b:	mov    %r12,0x680(%rsp)
   140134c13:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140134c18:	mov    0x40(%rsp),%rdx
   140134c1d:	lea    0x520(%rsp),%rcx
   140134c25:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140134c2a:	mov    0x520(%rsp),%rax
   140134c32:	mov    0x680(%rsp),%rcx
   140134c3a:	mov    %rax,0x1c8(%rsp)
   140134c42:	cmp    %r12,%rcx
   140134c45:	je     140132822 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef52>
   140134c4b:	mov    0x690(%rsp),%rax
   140134c53:	lea    0x1(%rax),%rdx
   140134c57:	call   140338430 <operator delete(void*, unsigned long long)>
   140134c5c:	jmp    140132822 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef52>
   140134c61:	test   %r12b,%r12b
   140134c64:	jne    140136bf3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13323>
   140134c6a:	mov    0x8(%r10),%rax
   140134c6e:	mov    $0x1,%r12d
   140134c74:	mov    (%rax,%rdi,8),%rax
   140134c78:	mov    %rax,0x1c8(%rsp)
   140134c80:	cmpb   $0x0,0x1040(%rbx)
   140134c87:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   140134c8d:	movzbl 0x0(%rbp),%eax
   140134c91:	lea    0x28b408(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134c98:	add    $0x1,%rbp
   140134c9c:	mov    (%rdi,%rax,8),%rax
   140134ca0:	jmp    *%rax
   140134ca2:	mov    0x1050(%rbx),%rax
   140134ca9:	mov    %rsi,%r12
   140134cac:	sub    %rdx,%r12
   140134caf:	mov    %rax,%rcx
   140134cb2:	sub    %rdx,%rcx
   140134cb5:	sar    $0x3,%rcx
   140134cb9:	lea    (%rcx,%rcx,1),%r9
   140134cbd:	cmp    %r9,%rcx
   140134cc0:	jb     1401370ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137fe>
   140134cc6:	vzeroupper
   140134cc9:	jmp    14012d9da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa10a>
   140134cce:	mov    0x1c8(%rsp),%rax
   140134cd6:	xor    %edx,%edx
   140134cd8:	mov    %rax,0x1d0(%rsp)
   140134ce0:	test   %rdi,%rdi
   140134ce3:	je     140134cf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11420>
   140134ce5:	mov    %rdi,%rcx
   140134ce8:	call   140146e40 <setun::ArrayObject::size() const>
   140134ced:	mov    %rax,%rdx
   140134cf0:	lea    0x680(%rsp),%rcx
   140134cf8:	mov    $0x2,%r12d
   140134cfe:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140134d03:	mov    0x680(%rsp),%rax
   140134d0b:	mov    %rax,0x1c8(%rsp)
   140134d13:	jmp    14012f55d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc8d>
   140134d18:	mov    0x1048(%rbx),%rdx
   140134d1f:	mov    0x1050(%rbx),%rax
   140134d26:	lea    0x10(%rsi),%r8
   140134d2a:	cmp    0x38(%rsp),%r8
   140134d2f:	jae    14013656b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c9b>
   140134d35:	mov    0x1d0(%rsp),%rcx
   140134d3d:	mov    %rcx,(%rsi)
   140134d40:	mov    0x1c8(%rsp),%rcx
   140134d48:	mov    %rcx,0x8(%rsi)
   140134d4c:	mov    %r8,%rsi
   140134d4f:	jmp    140130301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca31>
   140134d54:	mov    0x548(%rsp),%rcx
   140134d5c:	test   %rcx,%rcx
   140134d5f:	je     140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140134d65:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140134d6a:	jmp    140125fe1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140134d6f:	mov    0x1050(%rbx),%rax
   140134d76:	mov    %rsi,%r12
   140134d79:	sub    %rdx,%r12
   140134d7c:	mov    %rax,%rcx
   140134d7f:	sub    %rdx,%rcx
   140134d82:	sar    $0x3,%rcx
   140134d86:	lea    (%rcx,%rcx,1),%r9
   140134d8a:	cmp    %r9,%rcx
   140134d8d:	jb     1401380a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147d2>
   140134d93:	vzeroupper
   140134d96:	jmp    14012db3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26f>
   140134d9b:	mov    0x1050(%rbx),%rax
   140134da2:	mov    0x1048(%rbx),%rdx
   140134da9:	mov    %rax,0x38(%rsp)
   140134dae:	sub    %rdx,%rax
   140134db1:	sar    $0x3,%rax
   140134db5:	lea    (%rax,%rax,1),%rcx
   140134db9:	cmp    %rcx,%rax
   140134dbc:	jae    140127eb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e2>
   140134dc2:	sub    %rdx,%rsi
   140134dc5:	mov    %rcx,%rdx
   140134dc8:	lea    0x1048(%rbx),%rcx
   140134dcf:	vzeroupper
   140134dd2:	jmp    14012ec00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb330>
   140134dd7:	mov    0x1050(%rbx),%rax
   140134dde:	mov    %rsi,%r12
   140134de1:	sub    %rdx,%r12
   140134de4:	mov    %rax,%rcx
   140134de7:	sub    %rdx,%rcx
   140134dea:	sar    $0x3,%rcx
   140134dee:	lea    (%rcx,%rcx,1),%r9
   140134df2:	cmp    %r9,%rcx
   140134df5:	jb     140137222 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13952>
   140134dfb:	vzeroupper
   140134dfe:	jmp    14012da40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa170>
   140134e03:	mov    0x1050(%rbx),%rax
   140134e0a:	mov    %rsi,%r12
   140134e0d:	sub    %rdx,%r12
   140134e10:	mov    %rax,%rcx
   140134e13:	sub    %rdx,%rcx
   140134e16:	sar    $0x3,%rcx
   140134e1a:	lea    (%rcx,%rcx,1),%r9
   140134e1e:	cmp    %r9,%rcx
   140134e21:	jb     140136bc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132f6>
   140134e27:	vzeroupper
   140134e2a:	jmp    14012db0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa23c>
   140134e2f:	mov    %r9,%rdx
   140134e32:	lea    0x1048(%rbx),%rcx
   140134e39:	vzeroupper
   140134e3c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134e41:	mov    0x1048(%rbx),%rdx
   140134e48:	mov    0x1050(%rbx),%rax
   140134e4f:	lea    (%rdx,%r12,1),%rsi
   140134e53:	lea    0x10(%rsi),%r8
   140134e57:	jmp    14012aa94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71c4>
   140134e5c:	mov    %r9,%rdx
   140134e5f:	lea    0x1048(%rbx),%rcx
   140134e66:	vzeroupper
   140134e69:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134e6e:	mov    0x1048(%rbx),%rdx
   140134e75:	mov    0x1050(%rbx),%rax
   140134e7c:	lea    (%rdx,%r12,1),%rsi
   140134e80:	lea    0x10(%rsi),%r8
   140134e84:	jmp    14012a7c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ef2>
   140134e89:	mov    0x40(%rsp),%rdx
   140134e8e:	mov    %rdi,%rcx
   140134e91:	call   14021d340 <setun::VMObject::has_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134e96:	test   %al,%al
   140134e98:	je     1401366f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e27>
   140134e9e:	test   %r12b,%r12b
   140134ea1:	je     1401366d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e07>
   140134ea7:	sub    $0x1,%r12b
   140134eab:	je     1401366a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dd7>
   140134eb1:	lea    0x8(%rsi),%r8
   140134eb5:	cmp    0x38(%rsp),%r8
   140134eba:	jae    140136655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d85>
   140134ec0:	mov    0x1d0(%rsp),%rax
   140134ec8:	mov    0x40(%rsp),%rdx
   140134ecd:	mov    %rdi,%rcx
   140134ed0:	mov    %r8,0x80(%rsp)
   140134ed8:	mov    $0x2,%r12d
   140134ede:	mov    %rax,(%rsi)
   140134ee1:	mov    0x1c8(%rsp),%rax
   140134ee9:	mov    %rax,0x1d0(%rsp)
   140134ef1:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134ef6:	mov    0x80(%rsp),%rsi
   140134efe:	mov    %rax,0x1c8(%rsp)
   140134f06:	cmpb   $0x0,0x1040(%rbx)
   140134f0d:	je     14012e2b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9e3>
   140134f13:	movzbl 0x2(%rbp),%eax
   140134f17:	lea    0x28b182(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134f1e:	add    $0x3,%rbp
   140134f22:	mov    (%rdi,%rax,8),%rax
   140134f26:	jmp    *%rax
   140134f28:	mov    %r9,%rdx
   140134f2b:	lea    0x1048(%rbx),%rcx
   140134f32:	vzeroupper
   140134f35:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134f3a:	mov    0x1048(%rbx),%rdx
   140134f41:	mov    0x1050(%rbx),%rax
   140134f48:	lea    (%rdx,%r12,1),%rsi
   140134f4c:	lea    0x10(%rsi),%r8
   140134f50:	jmp    14012ae70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75a0>
   140134f55:	cmp    $0x4,%al
   140134f57:	jne    140134c61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11391>
   140134f5d:	test   %r12b,%r12b
   140134f60:	je     14013639b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12acb>
   140134f66:	sub    $0x1,%r12b
   140134f6a:	je     14013633a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a6a>
   140134f70:	lea    0x8(%rsi),%r8
   140134f74:	cmp    0x38(%rsp),%r8
   140134f79:	jae    140136c45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13375>
   140134f7f:	mov    0x1d0(%rsp),%rax
   140134f87:	mov    %r8,0x40(%rsp)
   140134f8c:	lea    0x1a0(%rsp),%rdx
   140134f94:	lea    0x680(%rsp),%rcx
   140134f9c:	mov    $0x2,%r12d
   140134fa2:	mov    %rax,(%rsi)
   140134fa5:	mov    0x1c8(%rsp),%rax
   140134fad:	mov    %rax,0x1d0(%rsp)
   140134fb5:	imul   $0x18,%rdi,%rax
   140134fb9:	add    0x68(%r10),%rax
   140134fbd:	vmovdqu (%rax),%xmm7
   140134fc1:	vmovdqa %xmm7,0x1a0(%rsp)
   140134fca:	mov    0x10(%rax),%rax
   140134fce:	mov    %rax,0x1b0(%rsp)
   140134fd6:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   140134fdb:	mov    0x680(%rsp),%rax
   140134fe3:	mov    0x40(%rsp),%rsi
   140134fe8:	mov    %rax,0x1c8(%rsp)
   140134ff0:	cmpb   $0x0,0x1040(%rbx)
   140134ff7:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   140134ffd:	movzbl 0x0(%rbp),%eax
   140135001:	lea    0x28b098(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135008:	add    $0x1,%rbp
   14013500c:	mov    (%rdi,%rax,8),%rax
   140135010:	jmp    *%rax
   140135012:	test   %r12b,%r12b
   140135015:	jne    1401363ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b1c>
   14013501b:	mov    0x50(%r10),%rax
   14013501f:	mov    $0x1,%r12d
   140135025:	movabs $0xfffc000000000000,%rdx
   14013502f:	vmovsd (%rax,%rdi,8),%xmm0
   140135034:	vucomisd %xmm0,%xmm0
   140135038:	vmovq  %xmm0,%rax
   14013503d:	cmovp  %rdx,%rax
   140135041:	mov    %rax,0x1c8(%rsp)
   140135049:	cmpb   $0x0,0x1040(%rbx)
   140135050:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   140135056:	movzbl 0x0(%rbp),%eax
   14013505a:	lea    0x28b03f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135061:	add    $0x1,%rbp
   140135065:	mov    (%rdi,%rax,8),%rax
   140135069:	jmp    *%rax
   14013506b:	test   %r12b,%r12b
   14013506e:	je     1401382c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149f8>
   140135074:	sub    $0x1,%r12b
   140135078:	je     140138288 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b8>
   14013507e:	lea    0x8(%rsi),%r8
   140135082:	cmp    0x38(%rsp),%r8
   140135087:	jae    140138229 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14959>
   14013508d:	mov    0x1d0(%rsp),%rax
   140135095:	lea    0x680(%rsp),%rcx
   14013509d:	mov    %r8,0x40(%rsp)
   1401350a2:	mov    $0x2,%r12d
   1401350a8:	mov    %rax,(%rsi)
   1401350ab:	mov    0x1c8(%rsp),%rax
   1401350b3:	mov    %rax,0x1d0(%rsp)
   1401350bb:	mov    0x20(%r10),%rax
   1401350bf:	mov    (%rax,%rdi,8),%rdx
   1401350c3:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401350c8:	mov    0x680(%rsp),%rax
   1401350d0:	mov    0x40(%rsp),%rsi
   1401350d5:	mov    %rax,0x1c8(%rsp)
   1401350dd:	cmpb   $0x0,0x1040(%rbx)
   1401350e4:	je     14012d168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9898>
   1401350ea:	movzbl 0x0(%rbp),%eax
   1401350ee:	lea    0x28afab(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401350f5:	add    $0x1,%rbp
   1401350f9:	mov    (%rdi,%rax,8),%rax
   1401350fd:	jmp    *%rax
   1401350ff:	test   %r12b,%r12b
   140135102:	je     140136f24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13654>
   140135108:	sub    $0x1,%r12b
   14013510c:	je     140136ee7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13617>
   140135112:	lea    0x8(%rsi),%r8
   140135116:	cmp    0x38(%rsp),%r8
   14013511b:	jae    140136f2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1365e>
   140135121:	mov    0x40(%rsp),%rdx
   140135126:	mov    %r8,0x60(%rsp)
   14013512b:	lea    0x540(%rsp),%rcx
   140135133:	mov    $0x2,%r12d
   140135139:	mov    0x1d0(%rsp),%rax
   140135141:	mov    %rax,(%rsi)
   140135144:	mov    0x1c8(%rsp),%rax
   14013514c:	mov    %rax,0x1d0(%rsp)
   140135154:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140135159:	mov    0x540(%rsp),%rax
   140135161:	mov    0x60(%rsp),%rsi
   140135166:	mov    %rax,0x1c8(%rsp)
   14013516e:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140135173:	mov    0x1050(%rbx),%rax
   14013517a:	mov    0x1048(%rbx),%rdx
   140135181:	mov    %rax,0x38(%rsp)
   140135186:	sub    %rdx,%rax
   140135189:	sar    $0x3,%rax
   14013518d:	lea    (%rax,%rax,1),%rcx
   140135191:	cmp    %rcx,%rax
   140135194:	jae    14012d7b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ee3>
   14013519a:	sub    %rdx,%rsi
   14013519d:	mov    %rcx,%rdx
   1401351a0:	lea    0x1048(%rbx),%rcx
   1401351a7:	vzeroupper
   1401351aa:	jmp    140131e2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe55f>
   1401351af:	mov    %r9,%rdx
   1401351b2:	lea    0x1048(%rbx),%rcx
   1401351b9:	vzeroupper
   1401351bc:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401351c1:	mov    0x1048(%rbx),%rdx
   1401351c8:	mov    0x1050(%rbx),%rax
   1401351cf:	lea    (%rdx,%r12,1),%rsi
   1401351d3:	lea    0x10(%rsi),%r8
   1401351d7:	jmp    14012bd7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84ac>
   1401351dc:	mov    0x1050(%rbx),%rax
   1401351e3:	mov    %rsi,%r12
   1401351e6:	sub    %rdx,%r12
   1401351e9:	mov    %rax,%rcx
   1401351ec:	sub    %rdx,%rcx
   1401351ef:	sar    $0x3,%rcx
   1401351f3:	lea    (%rcx,%rcx,1),%r9
   1401351f7:	cmp    %r9,%rcx
   1401351fa:	jb     140136ca4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133d4>
   140135200:	vzeroupper
   140135203:	jmp    14012da73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1a3>
   140135208:	mov    0x1050(%rbx),%rax
   14013520f:	mov    %rsi,%r12
   140135212:	sub    %rdx,%r12
   140135215:	mov    %rax,%rcx
   140135218:	sub    %rdx,%rcx
   14013521b:	sar    $0x3,%rcx
   14013521f:	lea    (%rcx,%rcx,1),%r9
   140135223:	cmp    %r9,%rcx
   140135226:	jb     140136f80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136b0>
   14013522c:	vzeroupper
   14013522f:	jmp    14012dad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa209>
   140135234:	mov    %r9,%rdx
   140135237:	lea    0x1048(%rbx),%rcx
   14013523e:	vzeroupper
   140135241:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135246:	mov    0x1048(%rbx),%rdx
   14013524d:	mov    0x1050(%rbx),%rax
   140135254:	lea    (%rdx,%r12,1),%rsi
   140135258:	lea    0x10(%rsi),%r8
   14013525c:	jmp    14012b785 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eb5>
   140135261:	lea    0x540(%rsp),%rax
   140135269:	mov    %r11,%rdx
   14013526c:	mov    %r8,0x60(%rsp)
   140135271:	mov    %rax,%rcx
   140135274:	mov    %rax,0x40(%rsp)
   140135279:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   14013527e:	mov    0x40(%rsp),%rax
   140135283:	mov    0x60(%rsp),%r8
   140135288:	jmp    140131648 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd78>
   14013528d:	mov    %r9,%rdx
   140135290:	lea    0x1048(%rbx),%rcx
   140135297:	vzeroupper
   14013529a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013529f:	mov    0x1048(%rbx),%rdx
   1401352a6:	mov    0x1050(%rbx),%rax
   1401352ad:	lea    (%rdx,%r12,1),%rsi
   1401352b1:	lea    0x10(%rsi),%r8
   1401352b5:	jmp    14012a9d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7107>
   1401352ba:	mov    %r9,%rdx
   1401352bd:	lea    0x1048(%rbx),%rcx
   1401352c4:	vzeroupper
   1401352c7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401352cc:	mov    0x1048(%rbx),%rdx
   1401352d3:	mov    0x1050(%rbx),%rax
   1401352da:	lea    (%rdx,%r12,1),%rsi
   1401352de:	lea    0x10(%rsi),%r8
   1401352e2:	jmp    14012bdf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8526>
   1401352e7:	mov    %r9,%rdx
   1401352ea:	lea    0x1048(%rbx),%rcx
   1401352f1:	vzeroupper
   1401352f4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401352f9:	mov    0x1048(%rbx),%rdx
   140135300:	mov    0x1050(%rbx),%rax
   140135307:	lea    (%rdx,%r12,1),%rsi
   14013530b:	lea    0x10(%rsi),%r8
   14013530f:	jmp    14012a83d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f6d>
   140135314:	mov    0x28(%rbp),%rdx
   140135318:	test   %rdx,%rdx
   14013531b:	je     14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   140135321:	mov    0x40(%rsp),%rax
   140135326:	mov    0x30(%r14),%r8
   14013532a:	mov    0x38(%r14),%rcx
   14013532e:	movzwl 0xa(%rax),%eax
   140135332:	sub    %r8,%rcx
   140135335:	sar    $0x5,%rcx
   140135339:	cmp    %rcx,%rax
   14013533c:	jae    14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   140135342:	shl    $0x5,%rax
   140135346:	lea    0x680(%rsp),%rcx
   14013534e:	add    $0x40,%rdx
   140135352:	add    %rax,%r8
   140135355:	call   140221b00 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14013535a:	mov    0x680(%rsp),%rax
   140135362:	test   %rax,%rax
   140135365:	je     14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   14013536b:	mov    (%rax),%rcx
   14013536e:	test   %rcx,%rcx
   140135371:	je     14012794f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   140135377:	mov    0x88(%r14),%rax
   14013537e:	mov    0x80(%r14),%rdx
   140135385:	cmp    %rdx,%rax
   140135388:	je     140137bdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1430b>
   14013538e:	sub    %rdx,%rax
   140135391:	movzwl 0x28(%rcx),%r8d
   140135396:	xor    %r9d,%r9d
   140135399:	sar    $0x2,%rax
   14013539d:	mov    %r9d,0x80(%rsp)
   1401353a5:	cmp    %rax,%r8
   1401353a8:	jae    1401353b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ae5>
   1401353aa:	mov    (%rdx,%r8,4),%eax
   1401353ae:	mov    %eax,0x80(%rsp)
   1401353b5:	mov    0xa0(%r14),%rax
   1401353bc:	mov    0x98(%r14),%rdx
   1401353c3:	cmp    %rdx,%rax
   1401353c6:	je     1401373de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b0e>
   1401353cc:	sub    %rdx,%rax
   1401353cf:	movzwl 0x28(%rcx),%ecx
   1401353d3:	mov    $0x20,%r8d
   1401353d9:	sar    $1,%rax
   1401353dc:	cmp    %rax,%rcx
   1401353df:	jae    1401353e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b16>
   1401353e1:	movzwl (%rdx,%rcx,2),%r8d
   1401353e6:	movzbl %dil,%eax
   1401353ea:	mov    %r8,%rcx
   1401353ed:	mov    0x15268(%rbx),%r13
   1401353f4:	mov    0x1070(%rbx),%rdx
   1401353fb:	mov    %rax,0xa0(%rsp)
   140135403:	add    $0x9,%rax
   140135407:	cmp    %r8,%rax
   14013540a:	cmovae %rax,%rcx
   14013540e:	mov    0x38(%rbp),%rax
   140135412:	sub    0x1068(%rbx),%rdx
   140135419:	sar    $0x3,%rdx
   14013541d:	vmovd  (%rax),%xmm7
   140135421:	mov    0x40(%rsp),%rax
   140135426:	mov    %rcx,0xc0(%rsp)
   14013542e:	vpinsrd $0x1,0x80(%rsp),%xmm7,%xmm0
   140135439:	mov    %cx,0x8(%rax)
   14013543d:	vmovq  %xmm0,(%rax)
   140135441:	lea    (%rcx,%r13,1),%rax
   140135445:	mov    %rax,0x15268(%rbx)
   14013544c:	add    $0x40,%rax
   140135450:	cmp    %rdx,%rax
   140135453:	jae    140138430 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b60>
   140135459:	test   %dil,%dil
   14013545c:	jne    14013839f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14acf>
   140135462:	mov    0x1068(%rbx),%rax
   140135469:	cmp    $0x1,%r12b
   14013546d:	je     14013805b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1478b>
   140135473:	cmp    $0x2,%r12b
   140135477:	je     140138030 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14760>
   14013547d:	mov    -0x8(%rsi),%rdx
   140135481:	sub    $0x8,%rsi
   140135485:	mov    %rdx,(%rax,%r13,8)
   140135489:	mov    0x1048(%rbx),%rdx
   140135490:	mov    %rsi,%r9
   140135493:	mov    0x60(%rsp),%rcx
   140135498:	mov    0x150c0(%rbx),%rax
   14013549f:	sub    %rdx,%r9
   1401354a2:	mov    0x80(%rsp),%ebp
   1401354a9:	mov    %r9,%rdi
   1401354ac:	sub    %r15,%rcx
   1401354af:	sar    $0x3,%rdi
   1401354b3:	cmp    $0x7ff,%rax
   1401354b9:	ja     14013879b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ecb>
   1401354bf:	lea    0x1(%rax),%r10
   1401354c3:	imul   $0x28,%rax,%rax
   1401354c7:	mov    %r10,0x150c0(%rbx)
   1401354ce:	mov    %rcx,0x10c0(%rbx,%rax,1)
   1401354d6:	mov    0xc0(%rsp),%rcx
   1401354de:	mov    %r13,0x10c8(%rbx,%rax,1)
   1401354e6:	mov    %rcx,0x10d8(%rbx,%rax,1)
   1401354ee:	mov    0x15270(%rbx),%rcx
   1401354f5:	mov    %rdi,0x10d0(%rbx,%rax,1)
   1401354fd:	mov    %rbp,0x10e0(%rbx,%rax,1)
   140135505:	mov    0x152a0(%rbx),%rax
   14013550c:	cmp    %rax,0x68(%rcx)
   140135510:	jae    140137fee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1471e>
   140135516:	lea    (%r15,%rbp,1),%rax
   14013551a:	cmpb   $0x0,0x1040(%rbx)
   140135521:	je     140138159 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14889>
   140135527:	lea    0x1(%rax),%rbp
   14013552b:	movzbl (%rax),%eax
   14013552e:	lea    0x28ab6b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135535:	jmp    *(%rdi,%rax,8)
   140135538:	nopl   0x0(%rax,%rax,1)
   140135540:	mov    0x1050(%rbx),%rax
   140135547:	mov    %rsi,%r12
   14013554a:	sub    %rdx,%r12
   14013554d:	mov    %rax,%rcx
   140135550:	sub    %rdx,%rcx
   140135553:	sar    $0x3,%rcx
   140135557:	lea    (%rcx,%rcx,1),%r9
   14013555b:	cmp    %r9,%rcx
   14013555e:	jae    14012e0d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa802>
   140135564:	mov    %r9,%rdx
   140135567:	lea    0x1048(%rbx),%rcx
   14013556e:	vzeroupper
   140135571:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135576:	mov    0x1048(%rbx),%rdx
   14013557d:	mov    0x1050(%rbx),%rax
   140135584:	lea    (%rdx,%r12,1),%rsi
   140135588:	lea    0x8(%rsi),%r8
   14013558c:	jmp    14012e0d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa802>
   140135591:	mov    0x1050(%rbx),%rax
   140135598:	mov    %rsi,%r12
   14013559b:	sub    %rdx,%r12
   14013559e:	mov    %rax,%rcx
   1401355a1:	sub    %rdx,%rcx
   1401355a4:	sar    $0x3,%rcx
   1401355a8:	lea    (%rcx,%rcx,1),%r9
   1401355ac:	cmp    %r9,%rcx
   1401355af:	jb     1401373e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b19>
   1401355b5:	vzeroupper
   1401355b8:	jmp    14012e105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa835>
   1401355bd:	mov    %r9,%rdx
   1401355c0:	lea    0x1048(%rbx),%rcx
   1401355c7:	vzeroupper
   1401355ca:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401355cf:	mov    0x1048(%rbx),%rdx
   1401355d6:	mov    0x1050(%rbx),%rax
   1401355dd:	lea    (%rdx,%r12,1),%rsi
   1401355e1:	lea    0x10(%rsi),%r8
   1401355e5:	jmp    14012a87c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fac>
   1401355ea:	mov    0x540(%rsp),%rax
   1401355f2:	lea    0x680(%rsp),%r10
   1401355fa:	mov    $0x1,%edx
   1401355ff:	lea    0x690(%rsp),%r12
   140135607:	mov    %r10,%rcx
   14013560a:	mov    %r10,0x40(%rsp)
   14013560f:	movsbl (%rax,%rdi,1),%r8d
   140135614:	mov    %r12,0x680(%rsp)
   14013561c:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140135621:	mov    0x40(%rsp),%rdx
   140135626:	lea    0x520(%rsp),%rcx
   14013562e:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140135633:	mov    0x520(%rsp),%rax
   14013563b:	mov    0x680(%rsp),%rcx
   140135643:	mov    %rax,0x1c8(%rsp)
   14013564b:	cmp    %r12,%rcx
   14013564e:	je     1401333ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfafa>
   140135654:	mov    0x690(%rsp),%rax
   14013565c:	lea    0x1(%rax),%rdx
   140135660:	call   140338430 <operator delete(void*, unsigned long long)>
   140135665:	jmp    1401333ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfafa>
   14013566a:	mov    0x1c8(%rsp),%rax
   140135672:	lea    0x680(%rsp),%rcx
   14013567a:	lea    0x226444(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140135681:	mov    %rax,0x1d0(%rsp)
   140135689:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   14013568e:	mov    0x680(%rsp),%rax
   140135696:	mov    $0x2,%r12d
   14013569c:	mov    %rax,0x1c8(%rsp)
   1401356a4:	jmp    14012c71c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e4c>
   1401356a9:	lea    (%r12,%r12,1),%rdx
   1401356ad:	lea    0x1048(%rbx),%rcx
   1401356b4:	vzeroupper
   1401356b7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401356bc:	jmp    14013031a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca4a>
   1401356c1:	mov    0x1c8(%rsp),%rax
   1401356c9:	lea    0x680(%rsp),%r10
   1401356d1:	mov    $0x1,%edx
   1401356d6:	lea    0x690(%rsp),%r12
   1401356de:	mov    %r10,%rcx
   1401356e1:	mov    %r10,0x40(%rsp)
   1401356e6:	mov    %rax,0x1d0(%rsp)
   1401356ee:	mov    0x540(%rsp),%rax
   1401356f6:	movsbl (%rax,%rdi,1),%r8d
   1401356fb:	mov    %r12,0x680(%rsp)
   140135703:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140135708:	mov    0x40(%rsp),%rdx
   14013570d:	lea    0x520(%rsp),%rcx
   140135715:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14013571a:	mov    0x520(%rsp),%rax
   140135722:	mov    0x680(%rsp),%rcx
   14013572a:	mov    %rax,0x1c8(%rsp)
   140135732:	cmp    %r12,%rcx
   140135735:	je     1401314bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbef>
   14013573b:	mov    0x690(%rsp),%rax
   140135743:	lea    0x1(%rax),%rdx
   140135747:	call   140338430 <operator delete(void*, unsigned long long)>
   14013574c:	jmp    1401314bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbef>
   140135751:	mov    %rdi,%rcx
   140135754:	mov    %rax,0x40(%rsp)
   140135759:	call   140146e40 <setun::ArrayObject::size() const>
   14013575e:	mov    0x40(%rsp),%rdx
   140135763:	add    %rax,%rdx
   140135766:	jns    14012eb51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb281>
   14013576c:	jmp    140127f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a7>
   140135771:	mov    %r9,%rdx
   140135774:	lea    0x1048(%rbx),%rcx
   14013577b:	vzeroupper
   14013577e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135783:	mov    0x1048(%rbx),%rdx
   14013578a:	mov    0x1050(%rbx),%rax
   140135791:	lea    (%rdx,%rdi,1),%rsi
   140135795:	lea    0x10(%rsi),%r8
   140135799:	jmp    14012b6a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7dd1>
   14013579e:	lea    0x540(%rsp),%rax
   1401357a6:	mov    0x40(%rsp),%rdx
   1401357ab:	mov    %r8,0x60(%rsp)
   1401357b0:	mov    %rax,%rcx
   1401357b3:	mov    %rax,0x40(%rsp)
   1401357b8:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   1401357bd:	mov    0x40(%rsp),%rax
   1401357c2:	mov    0x60(%rsp),%r8
   1401357c7:	jmp    14012fc19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc349>
   1401357cc:	lea    0x500(%rsp),%rax
   1401357d4:	mov    %r11,%rdx
   1401357d7:	mov    %rax,0x80(%rsp)
   1401357df:	mov    %rax,%rcx
   1401357e2:	vzeroupper
   1401357e5:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   1401357ea:	jmp    14012fb2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc25b>
   1401357ef:	lea    0x15270(%rbx),%rcx
   1401357f6:	mov    %rbx,%rdx
   1401357f9:	vzeroupper
   1401357fc:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140135801:	jmp    14012fe0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc53c>
   140135806:	mov    0x1050(%rbx),%rax
   14013580d:	mov    %rsi,%r12
   140135810:	sub    %rdx,%r12
   140135813:	mov    %rax,%rcx
   140135816:	sub    %rdx,%rcx
   140135819:	sar    $0x3,%rcx
   14013581d:	lea    (%rcx,%rcx,1),%r9
   140135821:	cmp    %r9,%rcx
   140135824:	jb     140137d9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144cd>
   14013582a:	vzeroupper
   14013582d:	jmp    14012d941 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa071>
   140135832:	mov    (%rdi),%rdx
   140135835:	mov    $0xffffffff,%eax
   14013583a:	mov    $0xfffd0003,%ecx
   14013583f:	shl    $0x20,%rax
   140135843:	shl    $0x20,%rcx
   140135847:	and    %rax,%rdx
   14013584a:	cmp    %rcx,%rdx
   14013584d:	jne    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   140135853:	mov    0xe0(%rsp),%rcx
   14013585b:	and    (%rcx),%rax
   14013585e:	cmp    %rdx,%rax
   140135861:	jne    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   140135867:	mov    %rdi,%rcx
   14013586a:	call   14021b9a0 <setun::VMValue::payload() const>
   14013586f:	mov    0xe0(%rsp),%rcx
   140135877:	mov    0x58(%rax),%rdi
   14013587b:	mov    %rdi,0xc0(%rsp)
   140135883:	call   14021b9a0 <setun::VMValue::payload() const>
   140135888:	mov    0x58(%rax),%rax
   14013588c:	mov    %rax,0xe0(%rsp)
   140135894:	test   %rdi,%rdi
   140135897:	je     140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   14013589d:	test   %rax,%rax
   1401358a0:	je     140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   1401358a6:	mov    0x100(%rsp),%rcx
   1401358ae:	call   14021a530 <setun::VMValue::as_int() const>
   1401358b3:	mov    0x80(%rsp),%rcx
   1401358bb:	mov    %rax,0x40(%rsp)
   1401358c0:	call   14021a530 <setun::VMValue::as_int() const>
   1401358c5:	mov    %rax,%rdi
   1401358c8:	cmpq   $0x0,0x40(%rsp)
   1401358ce:	js     140137dca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144fa>
   1401358d4:	test   %rax,%rax
   1401358d7:	js     140137de1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14511>
   1401358dd:	mov    0xc0(%rsp),%rcx
   1401358e5:	call   140146e40 <setun::ArrayObject::size() const>
   1401358ea:	cmp    %rax,0x40(%rsp)
   1401358ef:	jae    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   1401358f5:	test   %rdi,%rdi
   1401358f8:	js     140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   1401358fe:	mov    0xe0(%rsp),%rcx
   140135906:	call   140146e40 <setun::ArrayObject::size() const>
   14013590b:	cmp    %rax,%rdi
   14013590e:	jae    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   140135914:	mov    0xe0(%rsp),%rcx
   14013591c:	mov    %rdi,%rdx
   14013591f:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140135924:	mov    0xa0(%rsp),%rcx
   14013592c:	lea    0x680(%rsp),%rdx
   140135934:	mov    %rax,0x680(%rsp)
   14013593c:	call   1402199e0 <setun::VMValue::mul(setun::VMValue const&) const>
   140135941:	mov    0x40(%rsp),%rdx
   140135946:	mov    0xc0(%rsp),%rcx
   14013594e:	mov    %rax,0x520(%rsp)
   140135956:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   14013595b:	lea    0x520(%rsp),%rdx
   140135963:	lea    0x680(%rsp),%rcx
   14013596b:	mov    %rax,0x680(%rsp)
   140135973:	call   140218980 <setun::VMValue::add(setun::VMValue const&) const>
   140135978:	mov    0x40(%rsp),%rdx
   14013597d:	mov    0xc0(%rsp),%rcx
   140135985:	lea    0x540(%rsp),%r8
   14013598d:	mov    %rax,0x540(%rsp)
   140135995:	call   14014a420 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14013599a:	jmp    140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   14013599f:	mov    %r9,%rdx
   1401359a2:	lea    0x1048(%rbx),%rcx
   1401359a9:	vzeroupper
   1401359ac:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401359b1:	mov    0x1048(%rbx),%rdx
   1401359b8:	mov    0x1050(%rbx),%rax
   1401359bf:	lea    (%rdx,%r12,1),%rsi
   1401359c3:	lea    0x10(%rsi),%r8
   1401359c7:	jmp    14012acf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7426>
   1401359cc:	mov    0x1050(%rbx),%rax
   1401359d3:	mov    %rsi,%r12
   1401359d6:	sub    %rdx,%r12
   1401359d9:	mov    %rax,%rcx
   1401359dc:	sub    %rdx,%rcx
   1401359df:	sar    $0x3,%rcx
   1401359e3:	lea    (%rcx,%rcx,1),%r9
   1401359e7:	cmp    %r9,%rcx
   1401359ea:	jb     14013758a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cba>
   1401359f0:	vzeroupper
   1401359f3:	jmp    14012e03c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa76c>
   1401359f8:	mov    %r9,%rdx
   1401359fb:	lea    0x1048(%rbx),%rcx
   140135a02:	vzeroupper
   140135a05:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135a0a:	mov    0x1048(%rbx),%rdx
   140135a11:	mov    0x1050(%rbx),%rax
   140135a18:	lea    (%rdx,%r12,1),%rsi
   140135a1c:	lea    0x10(%rsi),%r8
   140135a20:	jmp    14012b125 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7855>
   140135a25:	mov    0x1050(%rbx),%rax
   140135a2c:	mov    %rsi,%r12
   140135a2f:	sub    %rdx,%r12
   140135a32:	mov    %rax,%rcx
   140135a35:	sub    %rdx,%rcx
   140135a38:	sar    $0x3,%rcx
   140135a3c:	lea    (%rcx,%rcx,1),%r9
   140135a40:	cmp    %r9,%rcx
   140135a43:	jb     1401382f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a28>
   140135a49:	vzeroupper
   140135a4c:	jmp    14012df4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa67b>
   140135a51:	lea    0x520(%rsp),%r8
   140135a59:	mov    %r9,%rdx
   140135a5c:	mov    %r11,0x60(%rsp)
   140135a61:	mov    %r8,%rcx
   140135a64:	mov    %r8,0x40(%rsp)
   140135a69:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   140135a6e:	mov    0x40(%rsp),%r8
   140135a73:	mov    0x60(%rsp),%r11
   140135a78:	jmp    1401315d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd00>
   140135a7d:	mov    %r9,%rdx
   140135a80:	lea    0x1048(%rbx),%rcx
   140135a87:	vzeroupper
   140135a8a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135a8f:	mov    0x1048(%rbx),%rdx
   140135a96:	mov    0x1050(%rbx),%rax
   140135a9d:	lea    (%rdx,%r12,1),%rsi
   140135aa1:	lea    0x10(%rsi),%r8
   140135aa5:	jmp    14012abcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72fc>
   140135aaa:	mov    0x1050(%rbx),%rax
   140135ab1:	mov    %rsi,%r12
   140135ab4:	sub    %rdx,%r12
   140135ab7:	mov    %rax,%rcx
   140135aba:	sub    %rdx,%rcx
   140135abd:	sar    $0x3,%rcx
   140135ac1:	lea    (%rcx,%rcx,1),%r9
   140135ac5:	cmp    %r9,%rcx
   140135ac8:	jb     140137fc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146f1>
   140135ace:	vzeroupper
   140135ad1:	jmp    14012e19e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ce>
   140135ad6:	lea    0x500(%rsp),%rax
   140135ade:	mov    %r10,%rdx
   140135ae1:	mov    %r9,0x60(%rsp)
   140135ae6:	mov    %rax,%rcx
   140135ae9:	mov    %r11,0x40(%rsp)
   140135aee:	mov    %rax,0x80(%rsp)
   140135af6:	call   14021bda0 <setun::VMValue::as_tafpu() const>
   140135afb:	mov    0x40(%rsp),%r11
   140135b00:	mov    0x60(%rsp),%r9
   140135b05:	jmp    140131558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc88>
   140135b0a:	mov    %r9,%rdx
   140135b0d:	lea    0x1048(%rbx),%rcx
   140135b14:	vzeroupper
   140135b17:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135b1c:	mov    0x1048(%rbx),%rdx
   140135b23:	mov    0x1050(%rbx),%rax
   140135b2a:	lea    (%rdx,%r12,1),%rsi
   140135b2e:	lea    0x10(%rsi),%r8
   140135b32:	jmp    14012aad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7203>
   140135b37:	mov    %r9,%rdx
   140135b3a:	lea    0x1048(%rbx),%rcx
   140135b41:	vzeroupper
   140135b44:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135b49:	mov    0x1048(%rbx),%rdx
   140135b50:	mov    0x1050(%rbx),%rax
   140135b57:	lea    (%rdx,%r12,1),%rsi
   140135b5b:	lea    0x10(%rsi),%r8
   140135b5f:	jmp    14012b92a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x805a>
   140135b64:	mov    0x60(%rsp),%rdx
   140135b69:	lea    0x540(%rsp),%rcx
   140135b71:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140135b76:	mov    0x540(%rsp),%rax
   140135b7e:	mov    %rax,0x1c8(%rsp)
   140135b86:	mov    $0x1,%r12d
   140135b8c:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140135b91:	mov    0x1050(%rbx),%rax
   140135b98:	mov    %rsi,%r12
   140135b9b:	sub    %rdx,%r12
   140135b9e:	mov    %rax,%rcx
   140135ba1:	sub    %rdx,%rcx
   140135ba4:	sar    $0x3,%rcx
   140135ba8:	lea    (%rcx,%rcx,1),%r9
   140135bac:	cmp    %r9,%rcx
   140135baf:	jb     140137f94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146c4>
   140135bb5:	vzeroupper
   140135bb8:	jmp    14012e009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa739>
   140135bbd:	mov    %r9,%rdx
   140135bc0:	lea    0x1048(%rbx),%rcx
   140135bc7:	vzeroupper
   140135bca:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135bcf:	mov    0x1048(%rbx),%rdx
   140135bd6:	mov    0x1050(%rbx),%rax
   140135bdd:	lea    (%rdx,%r12,1),%rsi
   140135be1:	lea    0x10(%rsi),%r8
   140135be5:	jmp    14012b7c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ef4>
   140135bea:	mov    0x1050(%rbx),%rax
   140135bf1:	mov    %rsi,%r12
   140135bf4:	sub    %rdx,%r12
   140135bf7:	mov    %rax,%rcx
   140135bfa:	sub    %rdx,%rcx
   140135bfd:	sar    $0x3,%rcx
   140135c01:	lea    (%rcx,%rcx,1),%r9
   140135c05:	cmp    %r9,%rcx
   140135c08:	jb     1401373b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ae1>
   140135c0e:	vzeroupper
   140135c11:	jmp    14012df18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa648>
   140135c16:	mov    %r9,%rdx
   140135c19:	lea    0x1048(%rbx),%rcx
   140135c20:	vzeroupper
   140135c23:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135c28:	mov    0x1048(%rbx),%rdx
   140135c2f:	mov    0x1050(%rbx),%rax
   140135c36:	lea    (%rdx,%r12,1),%rsi
   140135c3a:	lea    0x10(%rsi),%r8
   140135c3e:	jmp    14012ab12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7242>
   140135c43:	mov    0x1c8(%rsp),%rax
   140135c4b:	lea    0x680(%rsp),%rcx
   140135c53:	lea    0x3e0(%rsp),%rdx
   140135c5b:	mov    %rax,0x1d0(%rsp)
   140135c63:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140135c68:	mov    0x688(%rsp),%rdx
   140135c70:	lea    0x540(%rsp),%rcx
   140135c78:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140135c7d:	jmp    14012d717 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e47>
   140135c82:	mov    %r9,%rdx
   140135c85:	lea    0x1048(%rbx),%rcx
   140135c8c:	vzeroupper
   140135c8f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135c94:	mov    0x1048(%rbx),%rdx
   140135c9b:	mov    0x1050(%rbx),%rax
   140135ca2:	lea    (%rdx,%r12,1),%rsi
   140135ca6:	lea    0x10(%rsi),%r8
   140135caa:	jmp    14012aeaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75df>
   140135caf:	mov    0x1050(%rbx),%rax
   140135cb6:	mov    %rsi,%r12
   140135cb9:	sub    %rdx,%r12
   140135cbc:	mov    %rax,%rcx
   140135cbf:	sub    %rdx,%rcx
   140135cc2:	sar    $0x3,%rcx
   140135cc6:	lea    (%rcx,%rcx,1),%r9
   140135cca:	cmp    %r9,%rcx
   140135ccd:	jb     140135d04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12434>
   140135ccf:	vzeroupper
   140135cd2:	jmp    14012e1d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa901>
   140135cd7:	mov    %r9,%rdx
   140135cda:	lea    0x1048(%rbx),%rcx
   140135ce1:	vzeroupper
   140135ce4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135ce9:	mov    0x1048(%rbx),%rdx
   140135cf0:	mov    0x1050(%rbx),%rax
   140135cf7:	lea    (%rdx,%r12,1),%rsi
   140135cfb:	lea    0x10(%rsi),%r8
   140135cff:	jmp    14012ad35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7465>
   140135d04:	mov    %r9,%rdx
   140135d07:	lea    0x1048(%rbx),%rcx
   140135d0e:	vzeroupper
   140135d11:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d16:	mov    0x1048(%rbx),%rdx
   140135d1d:	mov    0x1050(%rbx),%rax
   140135d24:	lea    (%rdx,%r12,1),%rsi
   140135d28:	lea    0x8(%rsi),%r8
   140135d2c:	jmp    14012e1d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa901>
   140135d31:	mov    %r9,%rdx
   140135d34:	mov    %rdi,%rcx
   140135d37:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140135d3c:	jmp    140131ef3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe623>
   140135d41:	mov    %r9,%rdx
   140135d44:	lea    0x1048(%rbx),%rcx
   140135d4b:	vzeroupper
   140135d4e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d53:	mov    0x1048(%rbx),%rdx
   140135d5a:	mov    0x1050(%rbx),%rax
   140135d61:	lea    (%rdx,%r12,1),%rsi
   140135d65:	lea    0x8(%rsi),%r8
   140135d69:	jmp    14012dfd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa706>
   140135d6e:	mov    %r9,%rdx
   140135d71:	lea    0x1048(%rbx),%rcx
   140135d78:	vzeroupper
   140135d7b:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d80:	mov    0x1048(%rbx),%rdx
   140135d87:	mov    0x1050(%rbx),%rax
   140135d8e:	lea    (%rdx,%r12,1),%rsi
   140135d92:	lea    0x8(%rsi),%r8
   140135d96:	jmp    14012dcd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa407>
   140135d9b:	mov    0x1050(%rbx),%rcx
   140135da2:	mov    0x1048(%rbx),%rax
   140135da9:	mov    %rcx,0x38(%rsp)
   140135dae:	sub    %rax,%rcx
   140135db1:	sar    $0x3,%rcx
   140135db5:	lea    (%rcx,%rcx,1),%rdx
   140135db9:	cmp    %rdx,%rcx
   140135dbc:	jae    1401348aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fda>
   140135dc2:	lea    0x1048(%rbx),%rcx
   140135dc9:	mov    %r9,0x60(%rsp)
   140135dce:	sub    %rax,%rsi
   140135dd1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135dd6:	mov    0x1050(%rbx),%rax
   140135ddd:	add    0x1048(%rbx),%rsi
   140135de4:	mov    0x60(%rsp),%r9
   140135de9:	lea    0x8(%rsi),%r8
   140135ded:	mov    %rax,0x38(%rsp)
   140135df2:	jmp    1401348aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fda>
   140135df7:	mov    0x1c8(%rsp),%rax
   140135dff:	mov    %r9,%rdx
   140135e02:	mov    %rdi,%rcx
   140135e05:	mov    %rax,0x1d0(%rsp)
   140135e0d:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140135e12:	jmp    1401349c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110f4>
   140135e17:	mov    0x410(%rsp),%edi
   140135e1e:	test   %r12b,%r12b
   140135e21:	je     14013605c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1278c>
   140135e27:	sub    $0x1,%r12b
   140135e2b:	je     140136027 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12757>
   140135e31:	lea    0x8(%rsi),%r8
   140135e35:	cmp    0x38(%rsp),%r8
   140135e3a:	jae    140135fd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12702>
   140135e40:	mov    0x1d0(%rsp),%rax
   140135e48:	mov    %r8,0x40(%rsp)
   140135e4d:	movslq %edi,%rdx
   140135e50:	lea    0x680(%rsp),%rcx
   140135e58:	mov    %rax,(%rsi)
   140135e5b:	mov    0x1c8(%rsp),%rax
   140135e63:	mov    %rax,0x1d0(%rsp)
   140135e6b:	jmp    140134a53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11183>
   140135e70:	mov    0x408(%rsp),%rdi
   140135e78:	test   %r12b,%r12b
   140135e7b:	je     140135f0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1263e>
   140135e81:	sub    $0x1,%r12b
   140135e85:	jne    140134a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11149>
   140135e8b:	mov    0x1c8(%rsp),%rax
   140135e93:	lea    0x680(%rsp),%rcx
   140135e9b:	mov    %rdi,%rdx
   140135e9e:	mov    %rax,0x1d0(%rsp)
   140135ea6:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140135eab:	mov    0x680(%rsp),%rax
   140135eb3:	mov    %rax,0x1c8(%rsp)
   140135ebb:	jmp    1401342cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109fb>
   140135ec0:	mov    0x1050(%rbx),%rax
   140135ec7:	mov    0x1048(%rbx),%rcx
   140135ece:	mov    %rax,0x38(%rsp)
   140135ed3:	sub    %rcx,%rax
   140135ed6:	sar    $0x3,%rax
   140135eda:	lea    (%rax,%rax,1),%rdx
   140135ede:	cmp    %rdx,%rax
   140135ee1:	jae    140131b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe257>
   140135ee7:	sub    %rcx,%rsi
   140135eea:	lea    0x1048(%rbx),%rcx
   140135ef1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135ef6:	mov    0x1050(%rbx),%rax
   140135efd:	add    0x1048(%rbx),%rsi
   140135f04:	mov    %rax,0x38(%rsp)
   140135f09:	jmp    140131b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe257>
   140135f0e:	lea    0x680(%rsp),%rcx
   140135f16:	mov    %rdi,%rdx
   140135f19:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140135f1e:	mov    0x680(%rsp),%rax
   140135f26:	mov    %rax,0x1c8(%rsp)
   140135f2e:	jmp    140131714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde44>
   140135f33:	mov    $0x6ab,%r8d
   140135f39:	lea    0x225c50(%rip),%rdx        # 14035bb90 <.rdata+0x5d0>
   140135f40:	lea    0x2266b9(%rip),%rcx        # 14035c600 <.rdata+0x1040>
   140135f47:	vzeroupper
   140135f4a:	call   *0x28dc50(%rip)        # 1403c3ba0 <__imp__assert>
   140135f50:	mov    0x1050(%rbx),%rax
   140135f57:	mov    0x1048(%rbx),%rdx
   140135f5e:	mov    %rax,0x38(%rsp)
   140135f63:	sub    %rdx,%rax
   140135f66:	sar    $0x3,%rax
   140135f6a:	lea    (%rax,%rax,1),%rcx
   140135f6e:	cmp    %rcx,%rax
   140135f71:	jae    1401320f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe825>
   140135f77:	sub    %rdx,%rsi
   140135f7a:	mov    %rcx,%rdx
   140135f7d:	lea    0x1048(%rbx),%rcx
   140135f84:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135f89:	mov    0x1050(%rbx),%rax
   140135f90:	add    0x1048(%rbx),%rsi
   140135f97:	lea    0x8(%rsi),%r8
   140135f9b:	mov    %rax,0x38(%rsp)
   140135fa0:	jmp    1401320f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe825>
   140135fa5:	mov    %r9,%rdx
   140135fa8:	lea    0x1048(%rbx),%rcx
   140135faf:	vzeroupper
   140135fb2:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135fb7:	mov    0x1048(%rbx),%rdx
   140135fbe:	mov    0x1050(%rbx),%rax
   140135fc5:	lea    (%rdx,%r12,1),%rsi
   140135fc9:	lea    0x8(%rsi),%r8
   140135fcd:	jmp    14012dc0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa33b>
   140135fd2:	mov    0x1050(%rbx),%rax
   140135fd9:	mov    0x1048(%rbx),%rdx
   140135fe0:	mov    %rax,0x38(%rsp)
   140135fe5:	sub    %rdx,%rax
   140135fe8:	sar    $0x3,%rax
   140135fec:	lea    (%rax,%rax,1),%rcx
   140135ff0:	cmp    %rcx,%rax
   140135ff3:	jae    140135e40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12570>
   140135ff9:	sub    %rdx,%rsi
   140135ffc:	mov    %rcx,%rdx
   140135fff:	lea    0x1048(%rbx),%rcx
   140136006:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013600b:	mov    0x1050(%rbx),%rax
   140136012:	add    0x1048(%rbx),%rsi
   140136019:	lea    0x8(%rsi),%r8
   14013601d:	mov    %rax,0x38(%rsp)
   140136022:	jmp    140135e40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12570>
   140136027:	mov    0x1c8(%rsp),%rax
   14013602f:	movslq %edi,%rdx
   140136032:	lea    0x680(%rsp),%rcx
   14013603a:	mov    %rax,0x1d0(%rsp)
   140136042:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140136047:	mov    0x680(%rsp),%rax
   14013604f:	mov    %rax,0x1c8(%rsp)
   140136057:	jmp    1401342cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109fb>
   14013605c:	movslq %edi,%rdx
   14013605f:	lea    0x680(%rsp),%rcx
   140136067:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14013606c:	mov    0x680(%rsp),%rax
   140136074:	mov    %rax,0x1c8(%rsp)
   14013607c:	jmp    140131714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde44>
   140136081:	mov    %r9,%rdx
   140136084:	lea    0x1048(%rbx),%rcx
   14013608b:	vzeroupper
   14013608e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136093:	mov    0x1048(%rbx),%rdx
   14013609a:	mov    0x1050(%rbx),%rax
   1401360a1:	lea    (%rdx,%r12,1),%rsi
   1401360a5:	lea    0x8(%rsi),%r8
   1401360a9:	jmp    14012e16b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa89b>
   1401360ae:	mov    %rax,%rcx
   1401360b1:	sub    %rdx,%rcx
   1401360b4:	sar    $0x3,%rcx
   1401360b8:	lea    (%rcx,%rcx,1),%r10
   1401360bc:	cmp    %r10,%rcx
   1401360bf:	jae    140132201 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe931>
   1401360c5:	sub    %rdx,%rsi
   1401360c8:	lea    0x1048(%rbx),%rcx
   1401360cf:	mov    %r10,%rdx
   1401360d2:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401360d7:	mov    0x1048(%rbx),%rdx
   1401360de:	mov    0x1050(%rbx),%rax
   1401360e5:	add    %rdx,%rsi
   1401360e8:	lea    0x10(%rsi),%r8
   1401360ec:	jmp    140132201 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe931>
   1401360f1:	mov    0x1050(%rbx),%rax
   1401360f8:	mov    %rax,0x38(%rsp)
   1401360fd:	sub    %rdx,%rax
   140136100:	sar    $0x3,%rax
   140136104:	lea    (%rax,%rax,1),%rcx
   140136108:	cmp    %rcx,%rax
   14013610b:	jae    140131c71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3a1>
   140136111:	sub    %rdx,%rsi
   140136114:	mov    %rcx,%rdx
   140136117:	lea    0x1048(%rbx),%rcx
   14013611e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136123:	mov    0x1048(%rbx),%rdx
   14013612a:	mov    0x1050(%rbx),%rax
   140136131:	add    %rdx,%rsi
   140136134:	mov    %rax,0x38(%rsp)
   140136139:	lea    0x8(%rsi),%r8
   14013613d:	jmp    140131c71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3a1>
   140136142:	mov    %r9,%rdx
   140136145:	lea    0x1048(%rbx),%rcx
   14013614c:	vzeroupper
   14013614f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136154:	mov    0x1048(%rbx),%rdx
   14013615b:	mov    0x1050(%rbx),%rax
   140136162:	lea    (%rdx,%r12,1),%rsi
   140136166:	lea    0x8(%rsi),%r8
   14013616a:	jmp    14012dca4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3d4>
   14013616f:	mov    %r9,%rdx
   140136172:	lea    0x1048(%rbx),%rcx
   140136179:	vzeroupper
   14013617c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136181:	mov    0x1048(%rbx),%rdx
   140136188:	mov    0x1050(%rbx),%rax
   14013618f:	lea    (%rdx,%r12,1),%rsi
   140136193:	lea    0x8(%rsi),%r8
   140136197:	jmp    14012dba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2d5>
   14013619c:	mov    0x1048(%rbx),%rdx
   1401361a3:	mov    0x1050(%rbx),%rax
   1401361aa:	mov    %rsi,%r8
   1401361ad:	jmp    14012f8b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfe3>
   1401361b2:	mov    0x1050(%rbx),%rax
   1401361b9:	mov    0x1048(%rbx),%rdx
   1401361c0:	mov    %rax,0x38(%rsp)
   1401361c5:	sub    %rdx,%rax
   1401361c8:	sar    $0x3,%rax
   1401361cc:	lea    (%rax,%rax,1),%rcx
   1401361d0:	cmp    %rcx,%rax
   1401361d3:	jae    140134a28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11158>
   1401361d9:	sub    %rdx,%rsi
   1401361dc:	mov    %rcx,%rdx
   1401361df:	lea    0x1048(%rbx),%rcx
   1401361e6:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401361eb:	mov    0x1050(%rbx),%rax
   1401361f2:	add    0x1048(%rbx),%rsi
   1401361f9:	lea    0x8(%rsi),%r8
   1401361fd:	mov    %rax,0x38(%rsp)
   140136202:	jmp    140134a28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11158>
   140136207:	mov    0x1c8(%rsp),%rax
   14013620f:	mov    %rdi,%rdx
   140136212:	lea    0x680(%rsp),%rcx
   14013621a:	mov    $0x2,%r12d
   140136220:	mov    %rax,0x1d0(%rsp)
   140136228:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14013622d:	mov    0x680(%rsp),%rax
   140136235:	mov    %rax,0x1c8(%rsp)
   14013623d:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   140136242:	lea    0x680(%rsp),%rcx
   14013624a:	mov    %rdi,%rdx
   14013624d:	mov    $0x1,%r12d
   140136253:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140136258:	mov    0x680(%rsp),%rax
   140136260:	mov    %rax,0x1c8(%rsp)
   140136268:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   14013626d:	lea    0x680(%rsp),%r10
   140136275:	mov    0x1c8(%rsp),%rax
   14013627d:	lea    0x310(%rsp),%rdx
   140136285:	mov    %r10,%rcx
   140136288:	mov    %r10,0x60(%rsp)
   14013628d:	mov    %rax,0x1d0(%rsp)
   140136295:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   14013629a:	mov    0x40(%rsp),%rcx
   14013629f:	mov    0x60(%rsp),%rdx
   1401362a4:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401362a9:	mov    0x680(%rsp),%rcx
   1401362b1:	mov    %rax,0x1c8(%rsp)
   1401362b9:	lea    0x690(%rsp),%rax
   1401362c1:	cmp    %rax,%rcx
   1401362c4:	je     140134bd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11306>
   1401362ca:	mov    0x690(%rsp),%rax
   1401362d2:	lea    0x1(%rax),%rdx
   1401362d6:	call   140338430 <operator delete(void*, unsigned long long)>
   1401362db:	jmp    140134bd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11306>
   1401362e0:	mov    %r9,%rdx
   1401362e3:	lea    0x1048(%rbx),%rcx
   1401362ea:	vzeroupper
   1401362ed:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401362f2:	mov    0x1048(%rbx),%rdx
   1401362f9:	mov    0x1050(%rbx),%rax
   140136300:	lea    (%rdx,%r12,1),%rsi
   140136304:	lea    0x8(%rsi),%r8
   140136308:	jmp    14012db72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2a2>
   14013630d:	mov    %r9,%rdx
   140136310:	lea    0x1048(%rbx),%rcx
   140136317:	vzeroupper
   14013631a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013631f:	mov    0x1048(%rbx),%rdx
   140136326:	mov    0x1050(%rbx),%rax
   14013632d:	lea    (%rdx,%r12,1),%rsi
   140136331:	lea    0x8(%rsi),%r8
   140136335:	jmp    14012dbd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa308>
   14013633a:	mov    0x1c8(%rsp),%rax
   140136342:	lea    0x1a0(%rsp),%rdx
   14013634a:	lea    0x680(%rsp),%rcx
   140136352:	mov    $0x2,%r12d
   140136358:	mov    %rax,0x1d0(%rsp)
   140136360:	imul   $0x18,%rdi,%rax
   140136364:	add    0x68(%r10),%rax
   140136368:	vmovdqu (%rax),%xmm7
   14013636c:	vmovdqa %xmm7,0x1a0(%rsp)
   140136375:	mov    0x10(%rax),%rax
   140136379:	mov    %rax,0x1b0(%rsp)
   140136381:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   140136386:	mov    0x680(%rsp),%rax
   14013638e:	mov    %rax,0x1c8(%rsp)
   140136396:	jmp    140134ff0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11720>
   14013639b:	imul   $0x18,%rdi,%rax
   14013639f:	add    0x68(%r10),%rax
   1401363a3:	lea    0x1a0(%rsp),%rdx
   1401363ab:	mov    $0x1,%r12d
   1401363b1:	vmovdqu (%rax),%xmm7
   1401363b5:	lea    0x680(%rsp),%rcx
   1401363bd:	vmovdqa %xmm7,0x1a0(%rsp)
   1401363c6:	mov    0x10(%rax),%rax
   1401363ca:	mov    %rax,0x1b0(%rsp)
   1401363d2:	call   14020dd80 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401363d7:	mov    0x680(%rsp),%rax
   1401363df:	mov    %rax,0x1c8(%rsp)
   1401363e7:	jmp    140134ff0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11720>
   1401363ec:	sub    $0x1,%r12b
   1401363f0:	je     14013661a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d4a>
   1401363f6:	lea    0x8(%rsi),%r8
   1401363fa:	cmp    0x38(%rsp),%r8
   1401363ff:	jae    1401365bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ceb>
   140136405:	mov    0x1d0(%rsp),%rax
   14013640d:	mov    $0x2,%r12d
   140136413:	movabs $0xfffc000000000000,%rdx
   14013641d:	mov    %rax,(%rsi)
   140136420:	mov    0x1c8(%rsp),%rax
   140136428:	mov    %r8,%rsi
   14013642b:	mov    %rax,0x1d0(%rsp)
   140136433:	mov    0x50(%r10),%rax
   140136437:	vmovsd (%rax,%rdi,8),%xmm0
   14013643c:	vucomisd %xmm0,%xmm0
   140136440:	vmovq  %xmm0,%rax
   140136445:	cmovp  %rdx,%rax
   140136449:	jmp    140135041 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11771>
   14013644e:	mov    $0xfffb,%eax
   140136453:	mov    $0xffff,%edx
   140136458:	mov    $0xfffd,%ecx
   14013645d:	sub    $0x8,%rsi
   140136461:	shl    $0x30,%rax
   140136465:	shl    $0x30,%rdx
   140136469:	mov    %rax,0x3e0(%rsp)
   140136471:	mov    (%rsi),%rax
   140136474:	shl    $0x30,%rcx
   140136478:	and    %rax,%rdx
   14013647b:	mov    %rax,0x3e0(%rsp)
   140136483:	cmp    %rcx,%rdx
   140136486:	jne    14012e4ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac1e>
   14013648c:	jmp    14012d641 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d71>
   140136491:	test   %rcx,%rcx
   140136494:	je     14013649b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bcb>
   140136496:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14013649b:	mov    0x150c0(%rbx),%rax
   1401364a2:	test   %rax,%rax
   1401364a5:	je     14013654b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c7b>
   1401364ab:	imul   $0x28,%rax,%rdx
   1401364af:	sub    $0x1,%rax
   1401364b3:	add    %rbx,%rdx
   1401364b6:	mov    0x1098(%rdx),%rbp
   1401364bd:	mov    0x10a0(%rdx),%rcx
   1401364c4:	mov    0x10a8(%rdx),%rsi
   1401364cb:	mov    %rax,0x150c0(%rbx)
   1401364d2:	cmpb   $0x0,0x15211(%rbx)
   1401364d9:	je     14013653a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c6a>
   1401364db:	mov    %rcx,0x15268(%rbx)
   1401364e2:	mov    0x1048(%rbx),%rdx
   1401364e9:	mov    0x40(%rsp),%rdi
   1401364ee:	mov    0x150c0(%rbx),%r13
   1401364f5:	lea    (%rdx,%rsi,8),%rax
   1401364f9:	mov    %rdi,(%rax)
   1401364fc:	lea    0x8(%rax),%rsi
   140136500:	test   %r13,%r13
   140136503:	je     140136515 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c45>
   140136505:	lea    -0x1(%r13),%rax
   140136509:	imul   $0x28,%rax,%rax
   14013650d:	mov    0x10c8(%rbx,%rax,1),%r13
   140136515:	add    %r15,%rbp
   140136518:	cmpb   $0x0,0x1040(%rbx)
   14013651f:	je     1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140136525:	movzbl 0x0(%rbp),%eax
   140136529:	lea    0x289b70(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140136530:	add    $0x1,%rbp
   140136534:	mov    (%rdi,%rax,8),%rax
   140136538:	jmp    *%rax
   14013653a:	mov    %rcx,%rdx
   14013653d:	lea    0x1068(%rbx),%rcx
   140136544:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136549:	jmp    1401364e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c12>
   14013654b:	mov    0x40(%rsp),%rax
   140136550:	mov    0x1048(%rbx),%rdx
   140136557:	add    $0x8,%rsi
   14013655b:	mov    %rax,-0x8(%rsi)
   14013655f:	movb   $0x0,0x1040(%rbx)
   140136566:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14013656b:	mov    %rax,%rcx
   14013656e:	mov    %rax,0x38(%rsp)
   140136573:	sub    %rdx,%rcx
   140136576:	sar    $0x3,%rcx
   14013657a:	lea    (%rcx,%rcx,1),%r9
   14013657e:	cmp    %r9,%rcx
   140136581:	jae    140134d35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11465>
   140136587:	sub    %rdx,%rsi
   14013658a:	lea    0x1048(%rbx),%rcx
   140136591:	mov    %r9,%rdx
   140136594:	vzeroupper
   140136597:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013659c:	mov    0x1048(%rbx),%rdx
   1401365a3:	mov    0x1050(%rbx),%rax
   1401365aa:	add    %rdx,%rsi
   1401365ad:	mov    %rax,0x38(%rsp)
   1401365b2:	lea    0x10(%rsi),%r8
   1401365b6:	jmp    140134d35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11465>
   1401365bb:	mov    0x1050(%rbx),%rax
   1401365c2:	mov    0x1048(%rbx),%rdx
   1401365c9:	mov    %rax,0x38(%rsp)
   1401365ce:	sub    %rdx,%rax
   1401365d1:	sar    $0x3,%rax
   1401365d5:	lea    (%rax,%rax,1),%rcx
   1401365d9:	cmp    %rcx,%rax
   1401365dc:	jae    140136405 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b35>
   1401365e2:	sub    %rdx,%rsi
   1401365e5:	mov    %rcx,%rdx
   1401365e8:	lea    0x1048(%rbx),%rcx
   1401365ef:	mov    %r10,0x40(%rsp)
   1401365f4:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401365f9:	mov    0x1050(%rbx),%rax
   140136600:	mov    0x40(%rsp),%r10
   140136605:	add    0x1048(%rbx),%rsi
   14013660c:	mov    %rax,0x38(%rsp)
   140136611:	lea    0x8(%rsi),%r8
   140136615:	jmp    140136405 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b35>
   14013661a:	mov    0x1c8(%rsp),%rax
   140136622:	mov    $0x2,%r12d
   140136628:	movabs $0xfffc000000000000,%rdx
   140136632:	mov    %rax,0x1d0(%rsp)
   14013663a:	mov    0x50(%r10),%rax
   14013663e:	vmovsd (%rax,%rdi,8),%xmm0
   140136643:	vucomisd %xmm0,%xmm0
   140136647:	vmovq  %xmm0,%rax
   14013664c:	cmovp  %rdx,%rax
   140136650:	jmp    140135041 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11771>
   140136655:	mov    0x1050(%rbx),%rcx
   14013665c:	mov    0x1048(%rbx),%rax
   140136663:	mov    %rcx,0x38(%rsp)
   140136668:	sub    %rax,%rcx
   14013666b:	sar    $0x3,%rcx
   14013666f:	lea    (%rcx,%rcx,1),%rdx
   140136673:	cmp    %rdx,%rcx
   140136676:	jae    140134ec0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115f0>
   14013667c:	lea    0x1048(%rbx),%rcx
   140136683:	sub    %rax,%rsi
   140136686:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013668b:	mov    0x1050(%rbx),%rax
   140136692:	add    0x1048(%rbx),%rsi
   140136699:	lea    0x8(%rsi),%r8
   14013669d:	mov    %rax,0x38(%rsp)
   1401366a2:	jmp    140134ec0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115f0>
   1401366a7:	mov    0x1c8(%rsp),%rax
   1401366af:	mov    0x40(%rsp),%rdx
   1401366b4:	mov    %rdi,%rcx
   1401366b7:	mov    $0x2,%r12d
   1401366bd:	mov    %rax,0x1d0(%rsp)
   1401366c5:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401366ca:	mov    %rax,0x1c8(%rsp)
   1401366d2:	jmp    140134f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11636>
   1401366d7:	mov    0x40(%rsp),%rdx
   1401366dc:	mov    %rdi,%rcx
   1401366df:	mov    $0x1,%r12d
   1401366e5:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401366ea:	mov    %rax,0x1c8(%rsp)
   1401366f2:	jmp    140134f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11636>
   1401366f7:	cmp    $0x2,%r12b
   1401366fb:	je     14013693b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1306b>
   140136701:	sub    $0x1,%r12b
   140136705:	jne    140136928 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13058>
   14013670b:	mov    0x1048(%rbx),%rdx
   140136712:	mov    0x1050(%rbx),%rax
   140136719:	lea    0x8(%rsi),%r8
   14013671d:	cmp    0x38(%rsp),%r8
   140136722:	jae    1401368e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13015>
   140136728:	mov    0x1c8(%rsp),%rcx
   140136730:	mov    %rcx,(%rsi)
   140136733:	mov    %r8,%rsi
   140136736:	mov    0x60(%rsp),%rcx
   14013673b:	sub    %rdx,%rsi
   14013673e:	sub    %rdx,%rax
   140136741:	mov    %rsi,%rbp
   140136744:	sub    %r15,%rcx
   140136747:	sar    $0x3,%rbp
   14013674b:	mov    %rcx,0x1038(%rbx)
   140136752:	cmp    %rsi,%rax
   140136755:	jae    140136768 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e98>
   140136757:	lea    0x0(%rbp,%rbp,1),%rdx
   14013675c:	lea    0x1048(%rbx),%rcx
   140136763:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136768:	vmovdqa 0x226370(%rip),%xmm0        # 14035cae0 <CSWTCH.3087+0x1e0>
   140136770:	mov    %rbp,0x1060(%rbx)
   140136777:	mov    $0x10,%ecx
   14013677c:	movb   $0x0,0x153a0(%rbx)
   140136783:	vmovdqa %xmm0,0x15390(%rbx)
   14013678b:	call   1403385e0 <__cxa_allocate_exception>
   140136790:	mov    0x8(%rdi),%r9
   140136794:	mov    (%rdi),%r8
   140136797:	lea    0x225333(%rip),%rdx        # 14035bad1 <.rdata+0x511>
   14013679e:	mov    %rax,%rsi
   1401367a1:	lea    0x500(%rsp),%rax
   1401367a9:	mov    %rax,%rcx
   1401367ac:	mov    %rax,0x80(%rsp)
   1401367b4:	call   1400fb2e0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > std::operator+<char, std::char_traits<char>, std::allocator<char> >(char const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) [clone .isra.0]>
   1401367b9:	mov    0x80(%rsp),%rcx
   1401367c1:	lea    0x22531a(%rip),%rdx        # 14035bae2 <.rdata+0x522>
   1401367c8:	call   1402edc30 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   1401367cd:	mov    %rax,%rdx
   1401367d0:	lea    0x520(%rsp),%rcx
   1401367d8:	call   1402f0020 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   1401367dd:	mov    0x40(%rsp),%rax
   1401367e2:	lea    0x520(%rsp),%rcx
   1401367ea:	mov    0x8(%rax),%r8
   1401367ee:	mov    (%rax),%rdx
   1401367f1:	call   1402ee040 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*, unsigned long long)>
   1401367f6:	mov    %rax,%rdx
   1401367f9:	lea    0x540(%rsp),%rcx
   140136801:	call   1402f0020 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   140136806:	lea    0x2252e6(%rip),%rdx        # 14035baf3 <.rdata+0x533>
   14013680d:	lea    0x540(%rsp),%rcx
   140136815:	call   1402edc30 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   14013681a:	mov    %rax,%rdx
   14013681d:	lea    0x680(%rsp),%rcx
   140136825:	call   1402f0020 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   14013682a:	lea    0x680(%rsp),%rdx
   140136832:	mov    %rsi,%rcx
   140136835:	call   1402d0280 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14013683a:	lea    0x2420df(%rip),%rax        # 140378920 <vtable for setun::VMException+0x10>
   140136841:	mov    0x680(%rsp),%rcx
   140136849:	mov    %rax,(%rsi)
   14013684c:	lea    0x690(%rsp),%rax
   140136854:	cmp    %rax,%rcx
   140136857:	je     14013686a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f9a>
   140136859:	mov    0x690(%rsp),%rax
   140136861:	lea    0x1(%rax),%rdx
   140136865:	call   140338430 <operator delete(void*, unsigned long long)>
   14013686a:	mov    0x540(%rsp),%rcx
   140136872:	lea    0x550(%rsp),%rax
   14013687a:	cmp    %rax,%rcx
   14013687d:	je     140136890 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12fc0>
   14013687f:	mov    0x550(%rsp),%rax
   140136887:	lea    0x1(%rax),%rdx
   14013688b:	call   140338430 <operator delete(void*, unsigned long long)>
   140136890:	mov    0x520(%rsp),%rcx
   140136898:	lea    0x530(%rsp),%rax
   1401368a0:	cmp    %rax,%rcx
   1401368a3:	je     1401368b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12fe6>
   1401368a5:	mov    0x530(%rsp),%rax
   1401368ad:	lea    0x1(%rax),%rdx
   1401368b1:	call   140338430 <operator delete(void*, unsigned long long)>
   1401368b6:	mov    0x500(%rsp),%rcx
   1401368be:	lea    0x510(%rsp),%rax
   1401368c6:	cmp    %rax,%rcx
   1401368c9:	je     140131a4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe17d>
   1401368cf:	mov    0x510(%rsp),%rax
   1401368d7:	lea    0x1(%rax),%rdx
   1401368db:	call   140338430 <operator delete(void*, unsigned long long)>
   1401368e0:	jmp    140131a4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe17d>
   1401368e5:	mov    %rax,%rcx
   1401368e8:	sub    %rdx,%rcx
   1401368eb:	sar    $0x3,%rcx
   1401368ef:	lea    (%rcx,%rcx,1),%r9
   1401368f3:	cmp    %r9,%rcx
   1401368f6:	jae    140136728 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e58>
   1401368fc:	sub    %rdx,%rsi
   1401368ff:	lea    0x1048(%rbx),%rcx
   140136906:	mov    %r9,%rdx
   140136909:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013690e:	mov    0x1048(%rbx),%rdx
   140136915:	mov    0x1050(%rbx),%rax
   14013691c:	add    %rdx,%rsi
   14013691f:	lea    0x8(%rsi),%r8
   140136923:	jmp    140136728 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e58>
   140136928:	mov    0x1048(%rbx),%rdx
   14013692f:	mov    0x1050(%rbx),%rax
   140136936:	jmp    140136736 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e66>
   14013693b:	mov    0x1048(%rbx),%rdx
   140136942:	mov    0x1050(%rbx),%rax
   140136949:	lea    0x10(%rsi),%r8
   14013694d:	cmp    0x38(%rsp),%r8
   140136952:	jae    140137341 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a71>
   140136958:	mov    0x1d0(%rsp),%rcx
   140136960:	mov    %rcx,(%rsi)
   140136963:	mov    0x1c8(%rsp),%rcx
   14013696b:	mov    %rcx,0x8(%rsi)
   14013696f:	mov    %r8,%rsi
   140136972:	jmp    140136736 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e66>
   140136977:	mov    0x1050(%rbx),%rax
   14013697e:	mov    0x1048(%rbx),%rdx
   140136985:	mov    %rax,0x38(%rsp)
   14013698a:	sub    %rdx,%rax
   14013698d:	sar    $0x3,%rax
   140136991:	lea    (%rax,%rax,1),%rcx
   140136995:	cmp    %rcx,%rax
   140136998:	jae    14012f0c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7f2>
   14013699e:	sub    %rdx,%rsi
   1401369a1:	mov    %rcx,%rdx
   1401369a4:	lea    0x1048(%rbx),%rcx
   1401369ab:	mov    %r10,0x40(%rsp)
   1401369b0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401369b5:	mov    0x1050(%rbx),%rax
   1401369bc:	mov    0x40(%rsp),%r10
   1401369c1:	add    0x1048(%rbx),%rsi
   1401369c8:	mov    %rax,0x38(%rsp)
   1401369cd:	lea    0x8(%rsi),%r8
   1401369d1:	jmp    14012f0c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7f2>
   1401369d6:	mov    %r9,%rdx
   1401369d9:	lea    0x1048(%rbx),%rcx
   1401369e0:	vzeroupper
   1401369e3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401369e8:	mov    0x1048(%rbx),%rdx
   1401369ef:	mov    0x1050(%rbx),%rax
   1401369f6:	lea    (%rdx,%r12,1),%rsi
   1401369fa:	lea    0x8(%rsi),%r8
   1401369fe:	jmp    14012de6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59a>
   140136a03:	mov    0x1048(%rbx),%rdx
   140136a0a:	lea    0x10(%rsi),%r8
   140136a0e:	cmp    0x38(%rsp),%r8
   140136a13:	jae    140136a83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131b3>
   140136a15:	mov    0x1050(%rbx),%rax
   140136a1c:	vzeroupper
   140136a1f:	mov    0x1d0(%rsp),%rcx
   140136a27:	mov    %rcx,(%rsi)
   140136a2a:	mov    0x1c8(%rsp),%rcx
   140136a32:	mov    %rcx,0x8(%rsi)
   140136a36:	mov    %r8,%rsi
   140136a39:	jmp    14012cbb9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92e9>
   140136a3e:	lea    0x0(%rbp,%rbp,1),%rdx
   140136a43:	lea    0x1048(%rbx),%rcx
   140136a4a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136a4f:	jmp    14012cbde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x930e>
   140136a54:	mov    0x1048(%rbx),%rdx
   140136a5b:	lea    0x8(%rsi),%r8
   140136a5f:	cmp    0x38(%rsp),%r8
   140136a64:	jae    140136aab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131db>
   140136a66:	mov    0x1050(%rbx),%rax
   140136a6d:	vzeroupper
   140136a70:	mov    0x1c8(%rsp),%rcx
   140136a78:	mov    %rcx,(%rsi)
   140136a7b:	mov    %r8,%rsi
   140136a7e:	jmp    14012cbb9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92e9>
   140136a83:	mov    0x1050(%rbx),%rax
   140136a8a:	mov    %rsi,%rbp
   140136a8d:	sub    %rdx,%rbp
   140136a90:	mov    %rax,%rcx
   140136a93:	sub    %rdx,%rcx
   140136a96:	sar    $0x3,%rcx
   140136a9a:	lea    (%rcx,%rcx,1),%r9
   140136a9e:	cmp    %r9,%rcx
   140136aa1:	jb     140136ad0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13200>
   140136aa3:	vzeroupper
   140136aa6:	jmp    140136a1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1314f>
   140136aab:	mov    0x1050(%rbx),%rax
   140136ab2:	mov    %rsi,%rbp
   140136ab5:	sub    %rdx,%rbp
   140136ab8:	mov    %rax,%rcx
   140136abb:	sub    %rdx,%rcx
   140136abe:	sar    $0x3,%rcx
   140136ac2:	lea    (%rcx,%rcx,1),%r9
   140136ac6:	cmp    %r9,%rcx
   140136ac9:	jb     140136afd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1322d>
   140136acb:	vzeroupper
   140136ace:	jmp    140136a70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131a0>
   140136ad0:	mov    %r9,%rdx
   140136ad3:	lea    0x1048(%rbx),%rcx
   140136ada:	vzeroupper
   140136add:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136ae2:	mov    0x1048(%rbx),%rdx
   140136ae9:	mov    0x1050(%rbx),%rax
   140136af0:	lea    (%rdx,%rbp,1),%rsi
   140136af4:	lea    0x10(%rsi),%r8
   140136af8:	jmp    140136a1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1314f>
   140136afd:	mov    %r9,%rdx
   140136b00:	lea    0x1048(%rbx),%rcx
   140136b07:	vzeroupper
   140136b0a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136b0f:	mov    0x1048(%rbx),%rdx
   140136b16:	mov    0x1050(%rbx),%rax
   140136b1d:	lea    (%rdx,%rbp,1),%rsi
   140136b21:	lea    0x8(%rsi),%r8
   140136b25:	jmp    140136a70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131a0>
   140136b2a:	mov    0x1048(%rbx),%rdx
   140136b31:	mov    0x1050(%rbx),%rax
   140136b38:	mov    %rsi,%r8
   140136b3b:	vzeroupper
   140136b3e:	jmp    1401245e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd17>
   140136b43:	mov    0x1048(%rbx),%rdx
   140136b4a:	mov    0x1050(%rbx),%rcx
   140136b51:	mov    %rsi,%r12
   140136b54:	mov    %rcx,0x38(%rsp)
   140136b59:	sub    %rdx,%rcx
   140136b5c:	sub    %rdx,%r12
   140136b5f:	mov    %rcx,%rdx
   140136b62:	sar    $0x3,%rdx
   140136b66:	lea    (%rdx,%rdx,1),%rcx
   140136b6a:	cmp    %rcx,%rdx
   140136b6d:	jae    140132b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2b9>
   140136b73:	mov    %r10,0x80(%rsp)
   140136b7b:	mov    %rcx,%rdx
   140136b7e:	lea    0x1048(%rbx),%rcx
   140136b85:	mov    %eax,0x60(%rsp)
   140136b89:	mov    %r9d,0x40(%rsp)
   140136b8e:	vzeroupper
   140136b91:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136b96:	mov    0x1048(%rbx),%rsi
   140136b9d:	mov    0x1050(%rbx),%rax
   140136ba4:	mov    0x80(%rsp),%r10
   140136bac:	mov    0x40(%rsp),%r9d
   140136bb1:	add    %r12,%rsi
   140136bb4:	mov    %rax,0x38(%rsp)
   140136bb9:	mov    0x60(%rsp),%eax
   140136bbd:	lea    0x8(%rsi),%r8
   140136bc1:	jmp    140132b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2b9>
   140136bc6:	mov    %r9,%rdx
   140136bc9:	lea    0x1048(%rbx),%rcx
   140136bd0:	vzeroupper
   140136bd3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136bd8:	mov    0x1048(%rbx),%rdx
   140136bdf:	mov    0x1050(%rbx),%rax
   140136be6:	lea    (%rdx,%r12,1),%rsi
   140136bea:	lea    0x8(%rsi),%r8
   140136bee:	jmp    14012db0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa23c>
   140136bf3:	sub    $0x1,%r12b
   140136bf7:	je     140136d30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13460>
   140136bfd:	lea    0x8(%rsi),%r8
   140136c01:	cmp    0x38(%rsp),%r8
   140136c06:	jae    140136cd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13401>
   140136c0c:	mov    0x1d0(%rsp),%rax
   140136c14:	mov    $0x2,%r12d
   140136c1a:	mov    %rax,(%rsi)
   140136c1d:	mov    0x1c8(%rsp),%rax
   140136c25:	mov    %r8,%rsi
   140136c28:	mov    %rax,0x1d0(%rsp)
   140136c30:	mov    0x8(%r10),%rax
   140136c34:	mov    (%rax,%rdi,8),%rax
   140136c38:	mov    %rax,0x1c8(%rsp)
   140136c40:	jmp    140134c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113b0>
   140136c45:	mov    0x1050(%rbx),%rax
   140136c4c:	mov    0x1048(%rbx),%rdx
   140136c53:	mov    %rax,0x38(%rsp)
   140136c58:	sub    %rdx,%rax
   140136c5b:	sar    $0x3,%rax
   140136c5f:	lea    (%rax,%rax,1),%rcx
   140136c63:	cmp    %rcx,%rax
   140136c66:	jae    140134f7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116af>
   140136c6c:	sub    %rdx,%rsi
   140136c6f:	mov    %rcx,%rdx
   140136c72:	lea    0x1048(%rbx),%rcx
   140136c79:	mov    %r10,0x40(%rsp)
   140136c7e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c83:	mov    0x1050(%rbx),%rax
   140136c8a:	mov    0x40(%rsp),%r10
   140136c8f:	add    0x1048(%rbx),%rsi
   140136c96:	mov    %rax,0x38(%rsp)
   140136c9b:	lea    0x8(%rsi),%r8
   140136c9f:	jmp    140134f7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116af>
   140136ca4:	mov    %r9,%rdx
   140136ca7:	lea    0x1048(%rbx),%rcx
   140136cae:	vzeroupper
   140136cb1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136cb6:	mov    0x1048(%rbx),%rdx
   140136cbd:	mov    0x1050(%rbx),%rax
   140136cc4:	lea    (%rdx,%r12,1),%rsi
   140136cc8:	lea    0x8(%rsi),%r8
   140136ccc:	jmp    14012da73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1a3>
   140136cd1:	mov    0x1050(%rbx),%rax
   140136cd8:	mov    0x1048(%rbx),%rdx
   140136cdf:	mov    %rax,0x38(%rsp)
   140136ce4:	sub    %rdx,%rax
   140136ce7:	sar    $0x3,%rax
   140136ceb:	lea    (%rax,%rax,1),%rcx
   140136cef:	cmp    %rcx,%rax
   140136cf2:	jae    140136c0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1333c>
   140136cf8:	sub    %rdx,%rsi
   140136cfb:	mov    %rcx,%rdx
   140136cfe:	lea    0x1048(%rbx),%rcx
   140136d05:	mov    %r10,0x40(%rsp)
   140136d0a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136d0f:	mov    0x1050(%rbx),%rax
   140136d16:	mov    0x40(%rsp),%r10
   140136d1b:	add    0x1048(%rbx),%rsi
   140136d22:	mov    %rax,0x38(%rsp)
   140136d27:	lea    0x8(%rsi),%r8
   140136d2b:	jmp    140136c0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1333c>
   140136d30:	mov    0x1c8(%rsp),%rax
   140136d38:	mov    $0x2,%r12d
   140136d3e:	mov    %rax,0x1d0(%rsp)
   140136d46:	mov    0x8(%r10),%rax
   140136d4a:	mov    (%rax,%rdi,8),%rax
   140136d4e:	mov    %rax,0x1c8(%rsp)
   140136d56:	jmp    140134c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113b0>
   140136d5b:	mov    0x1c8(%rsp),%rax
   140136d63:	lea    0x680(%rsp),%r10
   140136d6b:	mov    $0x1,%edx
   140136d70:	lea    0x690(%rsp),%r12
   140136d78:	mov    %r10,%rcx
   140136d7b:	mov    %r10,0x40(%rsp)
   140136d80:	mov    %rax,0x1d0(%rsp)
   140136d88:	mov    0x540(%rsp),%rax
   140136d90:	movsbl (%rax,%rdi,1),%r8d
   140136d95:	mov    %r12,0x680(%rsp)
   140136d9d:	call   1402ecc70 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140136da2:	mov    0x40(%rsp),%rdx
   140136da7:	lea    0x520(%rsp),%rcx
   140136daf:	call   14020e260 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140136db4:	mov    0x520(%rsp),%rax
   140136dbc:	mov    0x680(%rsp),%rcx
   140136dc4:	mov    %rax,0x1c8(%rsp)
   140136dcc:	cmp    %r12,%rcx
   140136dcf:	je     14013143b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb6b>
   140136dd5:	mov    0x690(%rsp),%rax
   140136ddd:	lea    0x1(%rax),%rdx
   140136de1:	call   140338430 <operator delete(void*, unsigned long long)>
   140136de6:	jmp    14013143b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb6b>
   140136deb:	mov    %r9,%rdx
   140136dee:	lea    0x1048(%rbx),%rcx
   140136df5:	vzeroupper
   140136df8:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136dfd:	mov    0x1048(%rbx),%rdx
   140136e04:	mov    0x1050(%rbx),%rax
   140136e0b:	lea    (%rdx,%r12,1),%rsi
   140136e0f:	lea    0x8(%rsi),%r8
   140136e13:	jmp    14012da0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa13d>
   140136e18:	mov    0x1050(%rbx),%rax
   140136e1f:	mov    0x1048(%rbx),%rcx
   140136e26:	mov    %rax,0x38(%rsp)
   140136e2b:	sub    %rcx,%rax
   140136e2e:	sar    $0x3,%rax
   140136e32:	lea    (%rax,%rax,1),%rdx
   140136e36:	cmp    %rdx,%rax
   140136e39:	jae    14012c680 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8db0>
   140136e3f:	sub    %rcx,%rsi
   140136e42:	lea    0x1048(%rbx),%rcx
   140136e49:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e4e:	mov    0x1050(%rbx),%rax
   140136e55:	add    0x1048(%rbx),%rsi
   140136e5c:	mov    %rax,0x38(%rsp)
   140136e61:	jmp    14012c680 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8db0>
   140136e66:	mov    0x1050(%rbx),%rax
   140136e6d:	mov    0x1048(%rbx),%rdx
   140136e74:	mov    %rax,0x38(%rsp)
   140136e79:	sub    %rdx,%rax
   140136e7c:	sar    $0x3,%rax
   140136e80:	lea    (%rax,%rax,1),%rcx
   140136e84:	cmp    %rcx,%rax
   140136e87:	jae    140134ba7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112d7>
   140136e8d:	sub    %rdx,%rsi
   140136e90:	mov    %rcx,%rdx
   140136e93:	lea    0x1048(%rbx),%rcx
   140136e9a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e9f:	mov    0x1050(%rbx),%rax
   140136ea6:	add    0x1048(%rbx),%rsi
   140136ead:	lea    0x8(%rsi),%r8
   140136eb1:	mov    %rax,0x38(%rsp)
   140136eb6:	jmp    140134ba7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112d7>
   140136ebb:	mov    0x1c8(%rsp),%rax
   140136ec3:	mov    $0x2,%r12d
   140136ec9:	mov    %rax,0x1d0(%rsp)
   140136ed1:	mov    $0x1fff,%eax
   140136ed6:	shl    $0x33,%rax
   140136eda:	mov    %rax,0x1c8(%rsp)
   140136ee2:	jmp    140131ba6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d6>
   140136ee7:	mov    0x1c8(%rsp),%rax
   140136eef:	mov    0x40(%rsp),%rdx
   140136ef4:	lea    0x540(%rsp),%rcx
   140136efc:	mov    $0x2,%r12d
   140136f02:	mov    %rax,0x1d0(%rsp)
   140136f0a:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140136f0f:	mov    0x540(%rsp),%rax
   140136f17:	mov    %rax,0x1c8(%rsp)
   140136f1f:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140136f24:	mov    0x40(%rsp),%rdx
   140136f29:	jmp    140135b69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12299>
   140136f2e:	mov    0x1050(%rbx),%rax
   140136f35:	mov    0x1048(%rbx),%rcx
   140136f3c:	mov    %rax,0x38(%rsp)
   140136f41:	sub    %rcx,%rax
   140136f44:	sar    $0x3,%rax
   140136f48:	lea    (%rax,%rax,1),%rdx
   140136f4c:	cmp    %rdx,%rax
   140136f4f:	jae    140135121 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11851>
   140136f55:	sub    %rcx,%rsi
   140136f58:	lea    0x1048(%rbx),%rcx
   140136f5f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f64:	mov    0x1050(%rbx),%rax
   140136f6b:	add    0x1048(%rbx),%rsi
   140136f72:	lea    0x8(%rsi),%r8
   140136f76:	mov    %rax,0x38(%rsp)
   140136f7b:	jmp    140135121 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11851>
   140136f80:	mov    %r9,%rdx
   140136f83:	lea    0x1048(%rbx),%rcx
   140136f8a:	vzeroupper
   140136f8d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f92:	mov    0x1048(%rbx),%rdx
   140136f99:	mov    0x1050(%rbx),%rax
   140136fa0:	lea    (%rdx,%r12,1),%rsi
   140136fa4:	lea    0x8(%rsi),%r8
   140136fa8:	jmp    14012dad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa209>
   140136fad:	mov    0x1050(%rbx),%rax
   140136fb4:	mov    %rsi,%rbp
   140136fb7:	sub    %rdx,%rbp
   140136fba:	mov    %rax,0x38(%rsp)
   140136fbf:	sub    %rdx,%rax
   140136fc2:	sar    $0x3,%rax
   140136fc6:	lea    (%rax,%rax,1),%rcx
   140136fca:	cmp    %rcx,%rax
   140136fcd:	jae    140133e42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10572>
   140136fd3:	mov    %rcx,%rdx
   140136fd6:	lea    0x1048(%rbx),%rcx
   140136fdd:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136fe2:	mov    0x1048(%rbx),%rdx
   140136fe9:	mov    0x1050(%rbx),%rax
   140136ff0:	lea    (%rdx,%rbp,1),%rsi
   140136ff4:	mov    %rax,0x38(%rsp)
   140136ff9:	lea    0x8(%rsi),%r8
   140136ffd:	jmp    140133e42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10572>
   140137002:	mov    0x1050(%rbx),%rax
   140137009:	mov    0x1048(%rbx),%rdx
   140137010:	mov    %rax,0x38(%rsp)
   140137015:	sub    %rdx,%rax
   140137018:	sar    $0x3,%rax
   14013701c:	lea    (%rax,%rax,1),%rcx
   140137020:	cmp    %rcx,%rax
   140137023:	jae    140132262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe992>
   140137029:	sub    %rdx,%rsi
   14013702c:	mov    %rcx,%rdx
   14013702f:	lea    0x1048(%rbx),%rcx
   140137036:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013703b:	mov    0x1050(%rbx),%rax
   140137042:	add    0x1048(%rbx),%rsi
   140137049:	lea    0x8(%rsi),%r8
   14013704d:	mov    %rax,0x38(%rsp)
   140137052:	jmp    140132262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe992>
   140137057:	mov    %r9,%rdx
   14013705a:	lea    0x1048(%rbx),%rcx
   140137061:	vzeroupper
   140137064:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137069:	mov    0x1048(%rbx),%rdx
   140137070:	mov    0x1050(%rbx),%rax
   140137077:	lea    (%rdx,%r12,1),%rsi
   14013707b:	lea    0x8(%rsi),%r8
   14013707f:	jmp    14012d974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0a4>
   140137084:	sub    $0x1,%r12b
   140137088:	je     14013715e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1388e>
   14013708e:	lea    0x8(%rsi),%r8
   140137092:	cmp    0x38(%rsp),%r8
   140137097:	jae    1401370fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1382b>
   140137099:	mov    0x1d0(%rsp),%rdx
   1401370a1:	mov    $0x2,%r12d
   1401370a7:	mov    %rdx,(%rsi)
   1401370aa:	mov    0x1c8(%rsp),%rdx
   1401370b2:	mov    %r8,%rsi
   1401370b5:	mov    (%rcx,%rax,8),%rax
   1401370b9:	mov    %rdx,0x1d0(%rsp)
   1401370c1:	mov    %rax,0x1c8(%rsp)
   1401370c9:	jmp    14012f67d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdad>
   1401370ce:	mov    %r9,%rdx
   1401370d1:	lea    0x1048(%rbx),%rcx
   1401370d8:	vzeroupper
   1401370db:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401370e0:	mov    0x1048(%rbx),%rdx
   1401370e7:	mov    0x1050(%rbx),%rax
   1401370ee:	lea    (%rdx,%r12,1),%rsi
   1401370f2:	lea    0x8(%rsi),%r8
   1401370f6:	jmp    14012d9da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa10a>
   1401370fb:	mov    0x1050(%rbx),%r11
   140137102:	mov    0x1048(%rbx),%rdx
   140137109:	mov    %r11,0x38(%rsp)
   14013710e:	sub    %rdx,%r11
   140137111:	sar    $0x3,%r11
   140137115:	lea    (%r11,%r11,1),%r9
   140137119:	cmp    %r9,%r11
   14013711c:	jae    140137099 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137c9>
   140137122:	sub    %rdx,%rsi
   140137125:	lea    0x1048(%rbx),%rcx
   14013712c:	mov    %r9,%rdx
   14013712f:	mov    %rax,0x40(%rsp)
   140137134:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137139:	mov    0x1050(%rbx),%rax
   140137140:	add    0x1048(%rbx),%rsi
   140137147:	mov    0x48(%rdi),%rcx
   14013714b:	lea    0x8(%rsi),%r8
   14013714f:	mov    %rax,0x38(%rsp)
   140137154:	mov    0x40(%rsp),%rax
   140137159:	jmp    140137099 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137c9>
   14013715e:	mov    0x1c8(%rsp),%rdx
   140137166:	mov    (%rcx,%rax,8),%rax
   14013716a:	mov    $0x2,%r12d
   140137170:	mov    %rdx,0x1d0(%rsp)
   140137178:	mov    %rax,0x1c8(%rsp)
   140137180:	jmp    14012f67d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdad>
   140137185:	mov    %r9,%rdx
   140137188:	lea    0x1048(%rbx),%rcx
   14013718f:	vzeroupper
   140137192:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137197:	mov    0x1048(%rbx),%rdx
   14013719e:	mov    0x1050(%rbx),%rax
   1401371a5:	lea    (%rdx,%r12,1),%rsi
   1401371a9:	lea    0x8(%rsi),%r8
   1401371ad:	jmp    14012d9a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0d7>
   1401371b2:	mov    %rax,%rcx
   1401371b5:	sub    %rdx,%rcx
   1401371b8:	sar    $0x3,%rcx
   1401371bc:	lea    (%rcx,%rcx,1),%r10
   1401371c0:	cmp    %r10,%rcx
   1401371c3:	jae    14012f8a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfd8>
   1401371c9:	sub    %rdx,%rsi
   1401371cc:	lea    0x1048(%rbx),%rcx
   1401371d3:	mov    %r10,%rdx
   1401371d6:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401371db:	mov    0x1048(%rbx),%rdx
   1401371e2:	mov    0x1050(%rbx),%rax
   1401371e9:	add    %rdx,%rsi
   1401371ec:	lea    0x8(%rsi),%r8
   1401371f0:	jmp    14012f8a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfd8>
   1401371f5:	mov    %r9,%rdx
   1401371f8:	lea    0x1048(%rbx),%rcx
   1401371ff:	vzeroupper
   140137202:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137207:	mov    0x1048(%rbx),%rdx
   14013720e:	mov    0x1050(%rbx),%rax
   140137215:	lea    (%rdx,%r12,1),%rsi
   140137219:	lea    0x8(%rsi),%r8
   14013721d:	jmp    14012ddd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa501>
   140137222:	mov    %r9,%rdx
   140137225:	lea    0x1048(%rbx),%rcx
   14013722c:	vzeroupper
   14013722f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137234:	mov    0x1048(%rbx),%rdx
   14013723b:	mov    0x1050(%rbx),%rax
   140137242:	lea    (%rdx,%r12,1),%rsi
   140137246:	lea    0x8(%rsi),%r8
   14013724a:	jmp    14012da40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa170>
   14013724f:	mov    0x1050(%rbx),%rax
   140137256:	mov    0x1048(%rbx),%rdx
   14013725d:	mov    %rax,0x38(%rsp)
   140137262:	sub    %rdx,%rax
   140137265:	sar    $0x3,%rax
   140137269:	lea    (%rax,%rax,1),%rcx
   14013726d:	cmp    %rcx,%rax
   140137270:	jae    14013242b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb5b>
   140137276:	sub    %rdx,%rsi
   140137279:	mov    %rcx,%rdx
   14013727c:	lea    0x1048(%rbx),%rcx
   140137283:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137288:	mov    0x1050(%rbx),%rax
   14013728f:	add    0x1048(%rbx),%rsi
   140137296:	lea    0x8(%rsi),%r8
   14013729a:	mov    %rax,0x38(%rsp)
   14013729f:	jmp    14013242b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb5b>
   1401372a4:	mov    %r9,%rdx
   1401372a7:	lea    0x1048(%rbx),%rcx
   1401372ae:	vzeroupper
   1401372b1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401372b6:	mov    0x1048(%rbx),%rdx
   1401372bd:	mov    0x1050(%rbx),%rax
   1401372c4:	lea    (%rdx,%r12,1),%rsi
   1401372c8:	lea    0x8(%rsi),%r8
   1401372cc:	jmp    14012dd0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa43a>
   1401372d1:	mov    0x1c8(%rsp),%rax
   1401372d9:	lea    0x680(%rsp),%rcx
   1401372e1:	mov    $0x2,%r12d
   1401372e7:	mov    %rax,0x1d0(%rsp)
   1401372ef:	mov    0x38(%r10),%rax
   1401372f3:	movzbl (%rax,%rdi,1),%edx
   1401372f7:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401372fc:	mov    0x680(%rsp),%rax
   140137304:	mov    %rax,0x1c8(%rsp)
   14013730c:	jmp    14012f112 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb842>
   140137311:	mov    0x38(%r10),%rax
   140137315:	lea    0x680(%rsp),%rcx
   14013731d:	mov    $0x1,%r12d
   140137323:	movzbl (%rax,%rdi,1),%edx
   140137327:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   14013732c:	mov    0x680(%rsp),%rax
   140137334:	mov    %rax,0x1c8(%rsp)
   14013733c:	jmp    14012f112 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb842>
   140137341:	mov    %rax,%rcx
   140137344:	sub    %rdx,%rcx
   140137347:	sar    $0x3,%rcx
   14013734b:	lea    (%rcx,%rcx,1),%r9
   14013734f:	cmp    %r9,%rcx
   140137352:	jae    140136958 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13088>
   140137358:	sub    %rdx,%rsi
   14013735b:	lea    0x1048(%rbx),%rcx
   140137362:	mov    %r9,%rdx
   140137365:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013736a:	mov    0x1048(%rbx),%rdx
   140137371:	mov    0x1050(%rbx),%rax
   140137378:	add    %rdx,%rsi
   14013737b:	lea    0x10(%rsi),%r8
   14013737f:	jmp    140136958 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13088>
   140137384:	mov    %r9,%rdx
   140137387:	lea    0x1048(%rbx),%rcx
   14013738e:	vzeroupper
   140137391:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137396:	mov    0x1048(%rbx),%rdx
   14013739d:	mov    0x1050(%rbx),%rax
   1401373a4:	lea    (%rdx,%r12,1),%rsi
   1401373a8:	lea    0x8(%rsi),%r8
   1401373ac:	jmp    14012de37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa567>
   1401373b1:	mov    %r9,%rdx
   1401373b4:	lea    0x1048(%rbx),%rcx
   1401373bb:	vzeroupper
   1401373be:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401373c3:	mov    0x1048(%rbx),%rdx
   1401373ca:	mov    0x1050(%rbx),%rax
   1401373d1:	lea    (%rdx,%r12,1),%rsi
   1401373d5:	lea    0x8(%rsi),%r8
   1401373d9:	jmp    14012df18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa648>
   1401373de:	mov    $0x20,%r8d
   1401373e4:	jmp    1401353e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b16>
   1401373e9:	mov    %r9,%rdx
   1401373ec:	lea    0x1048(%rbx),%rcx
   1401373f3:	vzeroupper
   1401373f6:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401373fb:	mov    0x1048(%rbx),%rdx
   140137402:	mov    0x1050(%rbx),%rax
   140137409:	lea    (%rdx,%r12,1),%rsi
   14013740d:	lea    0x8(%rsi),%r8
   140137411:	jmp    14012e105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa835>
   140137416:	lea    (%r8,%r8,1),%rdx
   14013741a:	lea    0x1048(%rbx),%rcx
   140137421:	mov    %r8,0x40(%rsp)
   140137426:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013742b:	mov    0x40(%rsp),%r8
   140137430:	jmp    140133f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10636>
   140137435:	mov    0x1048(%rbx),%rdx
   14013743c:	lea    0x8(%rsi),%r8
   140137440:	cmp    0x38(%rsp),%r8
   140137445:	jae    1401374a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bd5>
   140137447:	mov    0x1050(%rbx),%rax
   14013744e:	vzeroupper
   140137451:	mov    0x1c8(%rsp),%rcx
   140137459:	xor    %r12d,%r12d
   14013745c:	mov    %rcx,(%rsi)
   14013745f:	mov    %r8,%rsi
   140137462:	jmp    140133ef0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10620>
   140137467:	mov    0x1048(%rbx),%rdx
   14013746e:	lea    0x10(%rsi),%r8
   140137472:	cmp    0x38(%rsp),%r8
   140137477:	jae    1401374cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bff>
   140137479:	mov    0x1050(%rbx),%rax
   140137480:	vzeroupper
   140137483:	mov    0x1d0(%rsp),%rcx
   14013748b:	xor    %r12d,%r12d
   14013748e:	mov    %rcx,(%rsi)
   140137491:	mov    0x1c8(%rsp),%rcx
   140137499:	mov    %rcx,0x8(%rsi)
   14013749d:	mov    %r8,%rsi
   1401374a0:	jmp    140133ef0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10620>
   1401374a5:	mov    0x1050(%rbx),%rax
   1401374ac:	mov    %rsi,%r12
   1401374af:	sub    %rdx,%r12
   1401374b2:	mov    %rax,%rcx
   1401374b5:	mov    %rax,0x38(%rsp)
   1401374ba:	sub    %rdx,%rcx
   1401374bd:	sar    $0x3,%rcx
   1401374c1:	lea    (%rcx,%rcx,1),%r9
   1401374c5:	cmp    %r9,%rcx
   1401374c8:	jb     1401374f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c29>
   1401374ca:	vzeroupper
   1401374cd:	jmp    140137451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b81>
   1401374cf:	mov    0x1050(%rbx),%rax
   1401374d6:	mov    %rsi,%r12
   1401374d9:	sub    %rdx,%r12
   1401374dc:	mov    %rax,%rcx
   1401374df:	mov    %rax,0x38(%rsp)
   1401374e4:	sub    %rdx,%rcx
   1401374e7:	sar    $0x3,%rcx
   1401374eb:	lea    (%rcx,%rcx,1),%r9
   1401374ef:	cmp    %r9,%rcx
   1401374f2:	jb     14013752b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c5b>
   1401374f4:	vzeroupper
   1401374f7:	jmp    140137483 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bb3>
   1401374f9:	mov    %r9,%rdx
   1401374fc:	lea    0x1048(%rbx),%rcx
   140137503:	vzeroupper
   140137506:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013750b:	mov    0x1048(%rbx),%rdx
   140137512:	mov    0x1050(%rbx),%rax
   140137519:	lea    (%rdx,%r12,1),%rsi
   14013751d:	mov    %rax,0x38(%rsp)
   140137522:	lea    0x8(%rsi),%r8
   140137526:	jmp    140137451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b81>
   14013752b:	mov    %r9,%rdx
   14013752e:	lea    0x1048(%rbx),%rcx
   140137535:	vzeroupper
   140137538:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013753d:	mov    0x1048(%rbx),%rdx
   140137544:	mov    0x1050(%rbx),%rax
   14013754b:	lea    (%rdx,%r12,1),%rsi
   14013754f:	mov    %rax,0x38(%rsp)
   140137554:	lea    0x10(%rsi),%r8
   140137558:	jmp    140137483 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bb3>
   14013755d:	mov    %r9,%rdx
   140137560:	lea    0x1048(%rbx),%rcx
   140137567:	vzeroupper
   14013756a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013756f:	mov    0x1048(%rbx),%rdx
   140137576:	mov    0x1050(%rbx),%rax
   14013757d:	lea    (%rdx,%r12,1),%rsi
   140137581:	lea    0x8(%rsi),%r8
   140137585:	jmp    14012daa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1d6>
   14013758a:	mov    %r9,%rdx
   14013758d:	lea    0x1048(%rbx),%rcx
   140137594:	vzeroupper
   140137597:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013759c:	mov    0x1048(%rbx),%rdx
   1401375a3:	mov    0x1050(%rbx),%rax
   1401375aa:	lea    (%rdx,%r12,1),%rsi
   1401375ae:	lea    0x8(%rsi),%r8
   1401375b2:	jmp    14012e03c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa76c>
   1401375b7:	mov    %r10,0x38(%rsp)
   1401375bc:	lea    0x0(%rbp,%rbp,1),%rdx
   1401375c1:	lea    0x1048(%rbx),%rcx
   1401375c8:	vzeroupper
   1401375cb:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401375d0:	mov    0x38(%rsp),%r10
   1401375d5:	jmp    140134501 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c31>
   1401375da:	mov    0x1050(%rbx),%rax
   1401375e1:	mov    0x1048(%rbx),%rdx
   1401375e8:	mov    %rax,0x38(%rsp)
   1401375ed:	sub    %rdx,%rax
   1401375f0:	sar    $0x3,%rax
   1401375f4:	lea    (%rax,%rax,1),%rcx
   1401375f8:	cmp    %rcx,%rax
   1401375fb:	jae    14012f1ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8fe>
   140137601:	sub    %rdx,%rsi
   140137604:	mov    %rcx,%rdx
   140137607:	lea    0x1048(%rbx),%rcx
   14013760e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137613:	mov    0x1050(%rbx),%rax
   14013761a:	add    0x1048(%rbx),%rsi
   140137621:	lea    0x8(%rsi),%r8
   140137625:	mov    %rax,0x38(%rsp)
   14013762a:	jmp    14012f1ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8fe>
   14013762f:	mov    %r9,%rdx
   140137632:	lea    0x1048(%rbx),%rcx
   140137639:	vzeroupper
   14013763c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137641:	mov    0x1048(%rbx),%rdx
   140137648:	mov    0x1050(%rbx),%rax
   14013764f:	lea    (%rdx,%r12,1),%rsi
   140137653:	lea    0x8(%rsi),%r8
   140137657:	jmp    14012e0a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7d2>
   14013765c:	mov    0x1c8(%rsp),%rax
   140137664:	mov    %r9,%rdx
   140137667:	mov    %rdi,%rcx
   14013766a:	mov    %rax,0x1d0(%rsp)
   140137672:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140137677:	mov    %rax,0x1c8(%rsp)
   14013767f:	jmp    140127ee2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4612>
   140137684:	mov    %r9,%rdx
   140137687:	mov    %rdi,%rcx
   14013768a:	mov    $0x1,%r12d
   140137690:	call   1401480d0 <setun::ArrayObject::get(unsigned long long) const>
   140137695:	mov    %rax,0x1c8(%rsp)
   14013769d:	jmp    140127ee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4618>
   1401376a2:	mov    0x1050(%rbx),%rax
   1401376a9:	mov    0x1048(%rbx),%rcx
   1401376b0:	mov    %rax,0x38(%rsp)
   1401376b5:	sub    %rcx,%rax
   1401376b8:	sar    $0x3,%rax
   1401376bc:	lea    (%rax,%rax,1),%rdx
   1401376c0:	cmp    %rdx,%rax
   1401376c3:	jae    14012d83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6c>
   1401376c9:	sub    %rcx,%rsi
   1401376cc:	lea    0x1048(%rbx),%rcx
   1401376d3:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376d8:	mov    0x1050(%rbx),%rax
   1401376df:	add    0x1048(%rbx),%rsi
   1401376e6:	lea    0x8(%rsi),%r8
   1401376ea:	mov    %rax,0x38(%rsp)
   1401376ef:	jmp    14012d83c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6c>
   1401376f4:	mov    0x1c8(%rsp),%rax
   1401376fc:	lea    0x338(%rsp),%rdx
   140137704:	lea    0x680(%rsp),%rcx
   14013770c:	mov    %rax,0x1d0(%rsp)
   140137714:	call   14021c150 <setun::VMValue::to_string[abi:cxx11]() const>
   140137719:	mov    0x40(%rsp),%rcx
   14013771e:	lea    0x680(%rsp),%rdx
   140137726:	call   14021cf80 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14013772b:	mov    0x680(%rsp),%rcx
   140137733:	mov    %rax,0x1c8(%rsp)
   14013773b:	lea    0x690(%rsp),%rax
   140137743:	cmp    %rax,%rcx
   140137746:	je     140127ee2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4612>
   14013774c:	mov    0x690(%rsp),%rax
   140137754:	lea    0x1(%rax),%rdx
   140137758:	call   140338430 <operator delete(void*, unsigned long long)>
   14013775d:	jmp    140127ee2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4612>
   140137762:	mov    %r9,%rdx
   140137765:	lea    0x1048(%rbx),%rcx
   14013776c:	vzeroupper
   14013776f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137774:	mov    0x1048(%rbx),%rdx
   14013777b:	mov    0x1050(%rbx),%rax
   140137782:	lea    (%rdx,%r12,1),%rsi
   140137786:	lea    0x8(%rsi),%r8
   14013778a:	jmp    14012de04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa534>
   14013778f:	mov    0x1050(%rbx),%rax
   140137796:	mov    0x1048(%rbx),%rdx
   14013779d:	mov    %rax,0x38(%rsp)
   1401377a2:	sub    %rdx,%rax
   1401377a5:	sar    $0x3,%rax
   1401377a9:	lea    (%rax,%rax,1),%rcx
   1401377ad:	cmp    %rcx,%rax
   1401377b0:	jae    140133b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1029e>
   1401377b6:	sub    %rdx,%rsi
   1401377b9:	mov    %rcx,%rdx
   1401377bc:	lea    0x1048(%rbx),%rcx
   1401377c3:	mov    %r9,0x40(%rsp)
   1401377c8:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401377cd:	mov    0x1050(%rbx),%rax
   1401377d4:	mov    0x40(%rsp),%r9
   1401377d9:	add    0x1048(%rbx),%rsi
   1401377e0:	mov    %rax,0x38(%rsp)
   1401377e5:	lea    0x8(%rsi),%r8
   1401377e9:	jmp    140133b6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1029e>
   1401377ee:	mov    0x1050(%rbx),%rax
   1401377f5:	mov    0x1048(%rbx),%rcx
   1401377fc:	mov    %rax,0x38(%rsp)
   140137801:	sub    %rcx,%rax
   140137804:	sar    $0x3,%rax
   140137808:	lea    (%rax,%rax,1),%rdx
   14013780c:	cmp    %rdx,%rax
   14013780f:	jae    1401313f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb22>
   140137815:	sub    %rcx,%rsi
   140137818:	lea    0x1048(%rbx),%rcx
   14013781f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137824:	mov    0x1050(%rbx),%rax
   14013782b:	add    0x1048(%rbx),%rsi
   140137832:	lea    0x8(%rsi),%r8
   140137836:	mov    %rax,0x38(%rsp)
   14013783b:	jmp    1401313f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb22>
   140137840:	mov    %r9,%rdx
   140137843:	lea    0x1048(%rbx),%rcx
   14013784a:	vzeroupper
   14013784d:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137852:	mov    0x1048(%rbx),%rdx
   140137859:	mov    0x1050(%rbx),%rax
   140137860:	lea    (%rdx,%r12,1),%rsi
   140137864:	lea    0x8(%rsi),%r8
   140137868:	jmp    14012df7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6ae>
   14013786d:	mov    %r12,(%rsi)
   140137870:	mov    0x1048(%rbx),%rdx
   140137877:	add    $0x8,%rsi
   14013787b:	mov    %rbp,%rcx
   14013787e:	movb   $0x0,0x1040(%rbx)
   140137885:	jmp    14012a339 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   14013788a:	call   1402128e0 <tersun::VMTelemetryManager::instance()>
   14013788f:	cmpb   $0x0,(%rax)
   140137892:	je     14013789c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fcc>
   140137894:	addq   $0x1,0x90(%rax)
   14013789c:	mov    0x150c0(%rbx),%rdx
   1401378a3:	mov    0x152c8(%rbx),%rcx
   1401378aa:	movzbl 0x5b0(%rsp),%r9d
   1401378b3:	test   %rdx,%rdx
   1401378b6:	je     1401378c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ff8>
   1401378b8:	lea    -0x1(%rdx),%rax
   1401378bc:	imul   $0x28,%rax,%rax
   1401378c0:	mov    0x10e0(%rbx,%rax,1),%rdx
   1401378c8:	mov    0x40(%rsp),%r8d
   1401378cd:	call   1401717d0 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   1401378d2:	mov    0x5a8(%rsp),%rcx
   1401378da:	mov    0x1060(%rbx),%rax
   1401378e1:	mov    0x1048(%rbx),%rdx
   1401378e8:	add    %r15,%rcx
   1401378eb:	lea    (%rdx,%rax,8),%rsi
   1401378ef:	cmpb   $0x0,0x1040(%rbx)
   1401378f6:	je     14012a339 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   1401378fc:	movzbl (%rcx),%eax
   1401378ff:	lea    0x28879a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137906:	lea    0x1(%rcx),%rbp
   14013790a:	xor    %r12d,%r12d
   14013790d:	mov    (%rdi,%rax,8),%rax
   140137911:	jmp    *%rax
   140137913:	mov    0x1050(%rbx),%rax
   14013791a:	mov    0x1048(%rbx),%rcx
   140137921:	mov    %rax,0x38(%rsp)
   140137926:	sub    %rcx,%rax
   140137929:	sar    $0x3,%rax
   14013792d:	lea    (%rax,%rax,1),%rdx
   140137931:	cmp    %rdx,%rax
   140137934:	jae    14013406e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1079e>
   14013793a:	sub    %rcx,%rsi
   14013793d:	lea    0x1048(%rbx),%rcx
   140137944:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137949:	mov    0x1050(%rbx),%rax
   140137950:	add    0x1048(%rbx),%rsi
   140137957:	lea    0x8(%rsi),%r8
   14013795b:	mov    %rax,0x38(%rsp)
   140137960:	jmp    14013406e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1079e>
   140137965:	mov    0x1c8(%rsp),%rax
   14013796d:	movslq %edi,%rdx
   140137970:	lea    0x540(%rsp),%rcx
   140137978:	mov    %rax,0x1d0(%rsp)
   140137980:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140137985:	mov    0x540(%rsp),%rax
   14013798d:	mov    %rax,0x1c8(%rsp)
   140137995:	jmp    14012d7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f13>
   14013799a:	movslq %edi,%rdx
   14013799d:	lea    0x540(%rsp),%rcx
   1401379a5:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401379aa:	mov    0x540(%rsp),%rax
   1401379b2:	mov    %rax,0x1c8(%rsp)
   1401379ba:	jmp    140135b86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122b6>
   1401379bf:	mov    %rcx,%rdx
   1401379c2:	lea    0x1068(%rbx),%rcx
   1401379c9:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401379ce:	jmp    14013048e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbbe>
   1401379d3:	mov    %rax,%rcx
   1401379d6:	sub    %rdx,%rcx
   1401379d9:	sar    $0x3,%rcx
   1401379dd:	lea    (%rcx,%rcx,1),%r10
   1401379e1:	cmp    %r10,%rcx
   1401379e4:	jae    140133d3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1046d>
   1401379ea:	sub    %rdx,%rsi
   1401379ed:	lea    0x1048(%rbx),%rcx
   1401379f4:	mov    %r10,%rdx
   1401379f7:	vzeroupper
   1401379fa:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401379ff:	mov    0x1048(%rbx),%rdx
   140137a06:	mov    0x1050(%rbx),%rax
   140137a0d:	add    %rdx,%rsi
   140137a10:	lea    0x10(%rsi),%r8
   140137a14:	jmp    140133d40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10470>
   140137a19:	xor    %r12d,%r12d
   140137a1c:	jmp    14012c921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140137a21:	mov    %r9,%rdx
   140137a24:	lea    0x1048(%rbx),%rcx
   140137a2b:	vzeroupper
   140137a2e:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a33:	mov    0x1048(%rbx),%rdx
   140137a3a:	mov    0x1050(%rbx),%rax
   140137a41:	lea    (%rdx,%r12,1),%rsi
   140137a45:	lea    0x8(%rsi),%r8
   140137a49:	jmp    14012dd9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4ce>
   140137a4e:	mov    %r9,%rdx
   140137a51:	lea    0x1048(%rbx),%rcx
   140137a58:	vzeroupper
   140137a5b:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a60:	mov    0x1048(%rbx),%rdx
   140137a67:	mov    0x1050(%rbx),%rax
   140137a6e:	lea    (%rdx,%r12,1),%rsi
   140137a72:	lea    0x8(%rsi),%r8
   140137a76:	jmp    14012e06f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa79f>
   140137a7b:	shl    $0x10,%rax
   140137a7f:	mov    %rax,%rdx
   140137a82:	sar    $0x10,%rdx
   140137a86:	cmp    $0xff0000,%rax
   140137a8c:	ja     14012e9d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb105>
   140137a92:	mov    0x38(%r10),%rax
   140137a96:	mov    %dl,(%rax,%r9,1)
   140137a9a:	cmpb   $0x0,0x1040(%rbx)
   140137aa1:	je     14012e21a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94a>
   140137aa7:	movzbl 0x0(%rbp),%eax
   140137aab:	lea    0x2885ee(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137ab2:	add    $0x1,%rbp
   140137ab6:	mov    (%rdi,%rax,8),%rax
   140137aba:	jmp    *%rax
   140137abc:	mov    0x1050(%rbx),%rax
   140137ac3:	mov    %rax,0x38(%rsp)
   140137ac8:	sub    %rdx,%rax
   140137acb:	sar    $0x3,%rax
   140137acf:	lea    (%rax,%rax,1),%rcx
   140137ad3:	cmp    %rcx,%rax
   140137ad6:	jae    140130fcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6fb>
   140137adc:	sub    %rdx,%rsi
   140137adf:	mov    %rcx,%rdx
   140137ae2:	lea    0x1048(%rbx),%rcx
   140137ae9:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137aee:	mov    0x1048(%rbx),%rdx
   140137af5:	mov    0x1050(%rbx),%rax
   140137afc:	add    %rdx,%rsi
   140137aff:	mov    %rax,0x38(%rsp)
   140137b04:	lea    0x10(%rsi),%r8
   140137b08:	jmp    140130fcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6fb>
   140137b0d:	sub    $0x1,%r12b
   140137b11:	je     140131c5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe38b>
   140137b17:	mov    0x1048(%rbx),%rdx
   140137b1e:	mov    0x1068(%rbx),%r8
   140137b25:	jmp    14012632d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   140137b2a:	mov    %rax,%rcx
   140137b2d:	sub    %rdx,%rcx
   140137b30:	sar    $0x3,%rcx
   140137b34:	lea    (%rcx,%rcx,1),%r10
   140137b38:	cmp    %r10,%rcx
   140137b3b:	jae    14013198f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0bf>
   140137b41:	sub    %rdx,%rsi
   140137b44:	lea    0x1048(%rbx),%rcx
   140137b4b:	mov    %r10,%rdx
   140137b4e:	vzeroupper
   140137b51:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137b56:	mov    0x1048(%rbx),%rdx
   140137b5d:	mov    0x1050(%rbx),%rax
   140137b64:	add    %rdx,%rsi
   140137b67:	lea    0x8(%rsi),%r8
   140137b6b:	jmp    140131992 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0c2>
   140137b70:	mov    0x1048(%rbx),%rdx
   140137b77:	mov    0x1050(%rbx),%rax
   140137b7e:	mov    %rsi,%r8
   140137b81:	vzeroupper
   140137b84:	jmp    140129ae2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6212>
   140137b89:	mov    0x1050(%rbx),%rax
   140137b90:	mov    0x1048(%rbx),%rcx
   140137b97:	mov    %rax,0x38(%rsp)
   140137b9c:	sub    %rcx,%rax
   140137b9f:	sar    $0x3,%rax
   140137ba3:	lea    (%rax,%rax,1),%rdx
   140137ba7:	cmp    %rdx,%rax
   140137baa:	jae    14012d6c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9df8>
   140137bb0:	sub    %rcx,%rsi
   140137bb3:	lea    0x1048(%rbx),%rcx
   140137bba:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137bbf:	mov    0x1050(%rbx),%rax
   140137bc6:	add    0x1048(%rbx),%rsi
   140137bcd:	lea    0x8(%rsi),%r8
   140137bd1:	mov    %rax,0x38(%rsp)
   140137bd6:	jmp    14012d6c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9df8>
   140137bdb:	movzwl 0x28(%rcx),%eax
   140137bdf:	mov    %eax,0x80(%rsp)
   140137be6:	jmp    1401353b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ae5>
   140137beb:	add    %rdx,%rdx
   140137bee:	lea    0x1068(%rbx),%rcx
   140137bf5:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137bfa:	jmp    14012ed31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb461>
   140137bff:	xor    %r12d,%r12d
   140137c02:	jmp    14012a2a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   140137c07:	lea    (%rdi,%rdi,1),%rdx
   140137c0b:	lea    0x1048(%rbx),%rcx
   140137c12:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137c17:	jmp    1401338f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10026>
   140137c1c:	mov    0x1048(%rbx),%rdx
   140137c23:	jmp    140133e53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10583>
   140137c28:	mov    0x1048(%rbx),%rdx
   140137c2f:	lea    0x10(%rsi),%r8
   140137c33:	cmp    0x38(%rsp),%r8
   140137c38:	jae    140137cb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143e0>
   140137c3a:	mov    0x1d0(%rsp),%rax
   140137c42:	xor    %r12d,%r12d
   140137c45:	mov    %rax,(%rsi)
   140137c48:	mov    0x1c8(%rsp),%rax
   140137c50:	mov    %rax,0x8(%rsi)
   140137c54:	mov    %r8,%rsi
   140137c57:	jmp    140133e53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10583>
   140137c5c:	mov    0x1068(%rbx),%rax
   140137c63:	cmp    $0x2,%r12b
   140137c67:	je     140137d2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1445c>
   140137c6d:	cmp    $0x1,%r12b
   140137c71:	je     140137d05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14435>
   140137c77:	mov    -0x8(%rsi),%rdx
   140137c7b:	sub    $0x10,%rsi
   140137c7f:	mov    %rdx,0x8(%rax,%r13,8)
   140137c84:	mov    (%rsi),%rdx
   140137c87:	mov    %rdx,(%rax,%r13,8)
   140137c8b:	mov    0x1048(%rbx),%rdx
   140137c92:	jmp    14012ed68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb498>
   140137c97:	mov    0x1048(%rbx),%rdx
   140137c9e:	mov    0x1050(%rbx),%rax
   140137ca5:	mov    %rsi,%r8
   140137ca8:	vzeroupper
   140137cab:	jmp    14013199d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0cd>
   140137cb0:	mov    0x1050(%rbx),%rax
   140137cb7:	mov    %rsi,%rbp
   140137cba:	sub    %rdx,%rbp
   140137cbd:	mov    %rax,0x38(%rsp)
   140137cc2:	sub    %rdx,%rax
   140137cc5:	sar    $0x3,%rax
   140137cc9:	lea    (%rax,%rax,1),%rcx
   140137ccd:	cmp    %rcx,%rax
   140137cd0:	jae    140137c3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1436a>
   140137cd6:	mov    %rcx,%rdx
   140137cd9:	lea    0x1048(%rbx),%rcx
   140137ce0:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ce5:	mov    0x1048(%rbx),%rdx
   140137cec:	mov    0x1050(%rbx),%rax
   140137cf3:	lea    (%rdx,%rbp,1),%rsi
   140137cf7:	mov    %rax,0x38(%rsp)
   140137cfc:	lea    0x10(%rsi),%r8
   140137d00:	jmp    140137c3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1436a>
   140137d05:	mov    0x1c8(%rsp),%rdx
   140137d0d:	sub    $0x8,%rsi
   140137d11:	mov    %rdx,0x8(%rax,%r13,8)
   140137d16:	mov    (%rsi),%rdx
   140137d19:	mov    %rdx,(%rax,%r13,8)
   140137d1d:	mov    0x1048(%rbx),%rdx
   140137d24:	xor    %r12d,%r12d
   140137d27:	jmp    14012ed68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb498>
   140137d2c:	mov    0x1d0(%rsp),%rdx
   140137d34:	mov    %rdx,(%rax,%r13,8)
   140137d38:	mov    0x1c8(%rsp),%rdx
   140137d40:	mov    %rdx,0x8(%rax,%r13,8)
   140137d45:	jmp    140137d1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1444d>
   140137d47:	mov    0x1050(%rbx),%rax
   140137d4e:	mov    0x1048(%rbx),%rcx
   140137d55:	mov    %rax,0x38(%rsp)
   140137d5a:	sub    %rcx,%rax
   140137d5d:	sar    $0x3,%rax
   140137d61:	lea    (%rax,%rax,1),%rdx
   140137d65:	cmp    %rdx,%rax
   140137d68:	jae    14012c45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b8f>
   140137d6e:	sub    %rcx,%rsi
   140137d71:	lea    0x1048(%rbx),%rcx
   140137d78:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d7d:	mov    0x1050(%rbx),%rax
   140137d84:	add    0x1048(%rbx),%rsi
   140137d8b:	mov    %rax,0x38(%rsp)
   140137d90:	jmp    14012c45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b8f>
   140137d95:	vzeroupper
   140137d98:	jmp    140135867 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f97>
   140137d9d:	mov    %r9,%rdx
   140137da0:	lea    0x1048(%rbx),%rcx
   140137da7:	vzeroupper
   140137daa:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137daf:	mov    0x1048(%rbx),%rdx
   140137db6:	mov    0x1050(%rbx),%rax
   140137dbd:	lea    (%rdx,%r12,1),%rsi
   140137dc1:	lea    0x8(%rsi),%r8
   140137dc5:	jmp    14012d941 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa071>
   140137dca:	mov    0xc0(%rsp),%rcx
   140137dd2:	call   140146e40 <setun::ArrayObject::size() const>
   140137dd7:	add    %rax,0x40(%rsp)
   140137ddc:	test   %rdi,%rdi
   140137ddf:	jns    140137df1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14521>
   140137de1:	mov    0xe0(%rsp),%rcx
   140137de9:	call   140146e40 <setun::ArrayObject::size() const>
   140137dee:	add    %rax,%rdi
   140137df1:	cmpq   $0x0,0x40(%rsp)
   140137df7:	js     140127b5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x428f>
   140137dfd:	jmp    1401358dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1200d>
   140137e02:	mov    %r9,%rdx
   140137e05:	lea    0x1048(%rbx),%rcx
   140137e0c:	vzeroupper
   140137e0f:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137e14:	mov    0x1048(%rbx),%rdx
   140137e1b:	mov    0x1050(%rbx),%rax
   140137e22:	lea    (%rdx,%r12,1),%rsi
   140137e26:	lea    0x8(%rsi),%r8
   140137e2a:	jmp    14012e204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa934>
   140137e2f:	mov    0x1050(%rbx),%rax
   140137e36:	mov    0x1048(%rbx),%rcx
   140137e3d:	mov    %rax,0x38(%rsp)
   140137e42:	sub    %rcx,%rax
   140137e45:	sar    $0x3,%rax
   140137e49:	lea    (%rax,%rax,1),%rdx
   140137e4d:	cmp    %rdx,%rax
   140137e50:	jae    140130f44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd674>
   140137e56:	sub    %rcx,%rsi
   140137e59:	lea    0x1048(%rbx),%rcx
   140137e60:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137e65:	mov    0x1050(%rbx),%rax
   140137e6c:	add    0x1048(%rbx),%rsi
   140137e73:	lea    0x8(%rsi),%r8
   140137e77:	mov    %rax,0x38(%rsp)
   140137e7c:	jmp    140130f44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd674>
   140137e81:	mov    0x1c8(%rsp),%rax
   140137e89:	mov    0x60(%rsp),%rdx
   140137e8e:	lea    0x540(%rsp),%rcx
   140137e96:	mov    %rax,0x1d0(%rsp)
   140137e9e:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   140137ea3:	mov    0x540(%rsp),%rax
   140137eab:	mov    %rax,0x1c8(%rsp)
   140137eb3:	jmp    14012d7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f13>
   140137eb8:	mov    0x1048(%rbx),%rdx
   140137ebf:	mov    0x1050(%rbx),%rcx
   140137ec6:	mov    %rsi,%r12
   140137ec9:	mov    %rcx,0x38(%rsp)
   140137ece:	sub    %rdx,%rcx
   140137ed1:	sub    %rdx,%r12
   140137ed4:	mov    %rcx,%rdx
   140137ed7:	sar    $0x3,%rdx
   140137edb:	lea    (%rdx,%rdx,1),%rcx
   140137edf:	cmp    %rcx,%rdx
   140137ee2:	jae    14012f933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc063>
   140137ee8:	mov    %r10,0x80(%rsp)
   140137ef0:	mov    %rcx,%rdx
   140137ef3:	lea    0x1048(%rbx),%rcx
   140137efa:	mov    %eax,0x60(%rsp)
   140137efe:	mov    %r9d,0x40(%rsp)
   140137f03:	vzeroupper
   140137f06:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137f0b:	mov    0x1048(%rbx),%rsi
   140137f12:	mov    0x1050(%rbx),%rax
   140137f19:	mov    0x80(%rsp),%r10
   140137f21:	mov    0x40(%rsp),%r9d
   140137f26:	add    %r12,%rsi
   140137f29:	mov    %rax,0x38(%rsp)
   140137f2e:	mov    0x60(%rsp),%eax
   140137f32:	lea    0x10(%rsi),%r8
   140137f36:	jmp    14012f933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc063>
   140137f3b:	mov    0x1050(%rbx),%rax
   140137f42:	mov    0x1048(%rbx),%rcx
   140137f49:	mov    %rax,0x38(%rsp)
   140137f4e:	sub    %rcx,%rax
   140137f51:	sar    $0x3,%rax
   140137f55:	lea    (%rax,%rax,1),%rdx
   140137f59:	cmp    %rdx,%rax
   140137f5c:	jae    140131476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdba6>
   140137f62:	sub    %rcx,%rsi
   140137f65:	lea    0x1048(%rbx),%rcx
   140137f6c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137f71:	mov    0x1050(%rbx),%rax
   140137f78:	add    0x1048(%rbx),%rsi
   140137f7f:	lea    0x8(%rsi),%r8
   140137f83:	mov    %rax,0x38(%rsp)
   140137f88:	jmp    140131476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdba6>
   140137f8d:	xor    %eax,%eax
   140137f8f:	jmp    140134418 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b48>
   140137f94:	mov    %r9,%rdx
   140137f97:	lea    0x1048(%rbx),%rcx
   140137f9e:	vzeroupper
   140137fa1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137fa6:	mov    0x1048(%rbx),%rdx
   140137fad:	mov    0x1050(%rbx),%rax
   140137fb4:	lea    (%rdx,%r12,1),%rsi
   140137fb8:	lea    0x8(%rsi),%r8
   140137fbc:	jmp    14012e009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa739>
   140137fc1:	mov    %r9,%rdx
   140137fc4:	lea    0x1048(%rbx),%rcx
   140137fcb:	vzeroupper
   140137fce:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137fd3:	mov    0x1048(%rbx),%rdx
   140137fda:	mov    0x1050(%rbx),%rax
   140137fe1:	lea    (%rdx,%r12,1),%rsi
   140137fe5:	lea    0x8(%rsi),%r8
   140137fe9:	jmp    14012e19e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ce>
   140137fee:	mov    0x1050(%rbx),%rax
   140137ff5:	sub    %rdx,%rax
   140137ff8:	cmp    %r9,%rax
   140137ffb:	jb     1401385b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ce0>
   140138001:	mov    %rdi,0x1060(%rbx)
   140138008:	mov    0x152a0(%rbx),%rax
   14013800f:	cmp    %rax,0x68(%rcx)
   140138013:	jae    14013859c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ccc>
   140138019:	mov    0x1060(%rbx),%rax
   140138020:	mov    0x1048(%rbx),%rdx
   140138027:	lea    (%rdx,%rax,8),%rsi
   14013802b:	jmp    140135516 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c46>
   140138030:	mov    0x1c8(%rsp),%rdx
   140138038:	xor    %r12d,%r12d
   14013803b:	add    $0x8,%rsi
   14013803f:	mov    %rdx,(%rax,%r13,8)
   140138043:	mov    0x1d0(%rsp),%rax
   14013804b:	mov    0x1048(%rbx),%rdx
   140138052:	mov    %rax,-0x8(%rsi)
   140138056:	jmp    140135490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bc0>
   14013805b:	mov    0x1c8(%rsp),%rdx
   140138063:	mov    %rdx,(%rax,%r13,8)
   140138067:	mov    0x1048(%rbx),%rdx
   14013806e:	xor    %r12d,%r12d
   140138071:	jmp    140135490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bc0>
   140138076:	mov    0x1048(%rbx),%rdx
   14013807d:	mov    0x1050(%rbx),%rax
   140138084:	lea    0x8(%rsi),%r8
   140138088:	cmp    0x38(%rsp),%r8
   14013808d:	jae    1401380cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147ff>
   14013808f:	mov    0x1c8(%rsp),%rcx
   140138097:	mov    %rcx,(%rsi)
   14013809a:	mov    %r8,%rsi
   14013809d:	jmp    140130301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca31>
   1401380a2:	mov    %r9,%rdx
   1401380a5:	lea    0x1048(%rbx),%rcx
   1401380ac:	vzeroupper
   1401380af:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401380b4:	mov    0x1048(%rbx),%rdx
   1401380bb:	mov    0x1050(%rbx),%rax
   1401380c2:	lea    (%rdx,%r12,1),%rsi
   1401380c6:	lea    0x8(%rsi),%r8
   1401380ca:	jmp    14012db3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26f>
   1401380cf:	mov    %rax,%rcx
   1401380d2:	mov    %rax,0x38(%rsp)
   1401380d7:	sub    %rdx,%rcx
   1401380da:	sar    $0x3,%rcx
   1401380de:	lea    (%rcx,%rcx,1),%r9
   1401380e2:	cmp    %r9,%rcx
   1401380e5:	jae    14013808f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147bf>
   1401380e7:	sub    %rdx,%rsi
   1401380ea:	lea    0x1048(%rbx),%rcx
   1401380f1:	mov    %r9,%rdx
   1401380f4:	vzeroupper
   1401380f7:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401380fc:	mov    0x1048(%rbx),%rdx
   140138103:	mov    0x1050(%rbx),%rax
   14013810a:	add    %rdx,%rsi
   14013810d:	mov    %rax,0x38(%rsp)
   140138112:	lea    0x8(%rsi),%r8
   140138116:	jmp    14013808f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147bf>
   14013811b:	mov    0x1c8(%rsp),%rdx
   140138123:	mov    %rdx,(%rax,%r13,8)
   140138127:	jmp    140137d1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1444d>
   14013812c:	mov    %r9,%rdx
   14013812f:	lea    0x1048(%rbx),%rcx
   140138136:	vzeroupper
   140138139:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013813e:	mov    0x1048(%rbx),%rdx
   140138145:	mov    0x1050(%rbx),%rax
   14013814c:	lea    (%rdx,%r12,1),%rsi
   140138150:	lea    0x8(%rsi),%r8
   140138154:	jmp    14012dc71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a1>
   140138159:	mov    %rax,%rbp
   14013815c:	jmp    1401244c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140138161:	mov    0x1050(%rbx),%rax
   140138168:	sub    %rdx,%rax
   14013816b:	cmp    %r8,%rax
   14013816e:	jb     1401381df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1490f>
   140138170:	mov    %rbp,0x1060(%rbx)
   140138177:	mov    0x152a0(%rbx),%rax
   14013817e:	cmp    %rax,0x68(%rcx)
   140138182:	jae    1401381ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148fe>
   140138184:	mov    0x1060(%rbx),%rax
   14013818b:	mov    0x1048(%rbx),%rdx
   140138192:	lea    (%rdx,%rax,8),%rsi
   140138196:	mov    0x40(%rsp),%rax
   14013819b:	mov    0x4(%rax),%eax
   14013819e:	jmp    14012eded <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb51d>
   1401381a3:	mov    0x1c8(%rsp),%rdx
   1401381ab:	xor    %r12d,%r12d
   1401381ae:	add    $0x8,%rsi
   1401381b2:	mov    %rdx,(%rax,%r13,8)
   1401381b6:	mov    0x1d0(%rsp),%rax
   1401381be:	mov    0x1048(%rbx),%rdx
   1401381c5:	mov    %rax,-0x8(%rsi)
   1401381c9:	jmp    14012ed68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb498>
   1401381ce:	lea    0x15270(%rbx),%rcx
   1401381d5:	mov    %rbx,%rdx
   1401381d8:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401381dd:	jmp    140138184 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148b4>
   1401381df:	lea    0x1048(%rbx),%rcx
   1401381e6:	lea    0x0(%rbp,%rbp,1),%rdx
   1401381eb:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401381f0:	mov    0x15270(%rbx),%rcx
   1401381f7:	jmp    140138170 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148a0>
   1401381fc:	mov    %r9,%rdx
   1401381ff:	lea    0x1048(%rbx),%rcx
   140138206:	vzeroupper
   140138209:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013820e:	mov    0x1048(%rbx),%rdx
   140138215:	mov    0x1050(%rbx),%rax
   14013821c:	lea    (%rdx,%r12,1),%rsi
   140138220:	lea    0x8(%rsi),%r8
   140138224:	jmp    14012e138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa868>
   140138229:	mov    0x1050(%rbx),%rax
   140138230:	mov    0x1048(%rbx),%rdx
   140138237:	mov    %rax,0x38(%rsp)
   14013823c:	sub    %rdx,%rax
   14013823f:	sar    $0x3,%rax
   140138243:	lea    (%rax,%rax,1),%rcx
   140138247:	cmp    %rcx,%rax
   14013824a:	jae    14013508d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117bd>
   140138250:	sub    %rdx,%rsi
   140138253:	mov    %rcx,%rdx
   140138256:	lea    0x1048(%rbx),%rcx
   14013825d:	mov    %r10,0x40(%rsp)
   140138262:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138267:	mov    0x1050(%rbx),%rax
   14013826e:	mov    0x40(%rsp),%r10
   140138273:	add    0x1048(%rbx),%rsi
   14013827a:	mov    %rax,0x38(%rsp)
   14013827f:	lea    0x8(%rsi),%r8
   140138283:	jmp    14013508d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117bd>
   140138288:	mov    0x1c8(%rsp),%rax
   140138290:	lea    0x680(%rsp),%rcx
   140138298:	mov    $0x2,%r12d
   14013829e:	mov    %rax,0x1d0(%rsp)
   1401382a6:	mov    0x20(%r10),%rax
   1401382aa:	mov    (%rax,%rdi,8),%rdx
   1401382ae:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401382b3:	mov    0x680(%rsp),%rax
   1401382bb:	mov    %rax,0x1c8(%rsp)
   1401382c3:	jmp    1401350dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1180d>
   1401382c8:	mov    0x20(%r10),%rax
   1401382cc:	lea    0x680(%rsp),%rcx
   1401382d4:	mov    $0x1,%r12d
   1401382da:	mov    (%rax,%rdi,8),%rdx
   1401382de:	call   14020f8c0 <setun::VMValue::VMValue(long long)>
   1401382e3:	mov    0x680(%rsp),%rax
   1401382eb:	mov    %rax,0x1c8(%rsp)
   1401382f3:	jmp    1401350dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1180d>
   1401382f8:	mov    %r9,%rdx
   1401382fb:	lea    0x1048(%rbx),%rcx
   140138302:	vzeroupper
   140138305:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013830a:	mov    0x1048(%rbx),%rdx
   140138311:	mov    0x1050(%rbx),%rax
   140138318:	lea    (%rdx,%r12,1),%rsi
   14013831c:	lea    0x8(%rsi),%r8
   140138320:	jmp    14012df4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa67b>
   140138325:	mov    %r9,%rdx
   140138328:	lea    0x1048(%rbx),%rcx
   14013832f:	vzeroupper
   140138332:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138337:	mov    0x1048(%rbx),%rdx
   14013833e:	mov    0x1050(%rbx),%rax
   140138345:	lea    (%rdx,%r12,1),%rsi
   140138349:	lea    0x8(%rsi),%r8
   14013834d:	jmp    14012dc3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa36e>
   140138352:	sub    $0x1,%r12b
   140138356:	je     140138621 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d51>
   14013835c:	lea    0x8(%rsi),%r8
   140138360:	cmp    0x38(%rsp),%r8
   140138365:	jae    1401385cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cfc>
   14013836b:	mov    0x1d0(%rsp),%rax
   140138373:	mov    %rax,(%rsi)
   140138376:	mov    0x1c8(%rsp),%rax
   14013837e:	mov    %r8,%rsi
   140138381:	mov    %rax,0x1d0(%rsp)
   140138389:	mov    $0x1fff,%eax
   14013838e:	shl    $0x33,%rax
   140138392:	mov    %rax,0x1c8(%rsp)
   14013839a:	jmp    1401342cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109fb>
   14013839f:	cmp    $0x1,%dil
   1401383a3:	je     1401384d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c09>
   1401383a9:	cmp    $0x2,%r12b
   1401383ad:	je     1401384a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bd5>
   1401383b3:	cmp    $0x1,%r12b
   1401383b7:	jne    140138499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bc9>
   1401383bd:	mov    0x1048(%rbx),%rdx
   1401383c4:	lea    0x8(%rsi),%r8
   1401383c8:	cmp    0x38(%rsp),%r8
   1401383cd:	jae    140138444 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b74>
   1401383cf:	mov    0x1c8(%rsp),%rax
   1401383d7:	xor    %r12d,%r12d
   1401383da:	mov    %rax,(%rsi)
   1401383dd:	mov    %r8,%rsi
   1401383e0:	mov    0xa0(%rsp),%rax
   1401383e8:	mov    0x1068(%rbx),%rcx
   1401383ef:	movzbl %dil,%r9d
   1401383f3:	mov    %r9d,%r10d
   1401383f6:	add    %r13,%rax
   1401383f9:	lea    (%rcx,%rax,8),%r8
   1401383fd:	xor    %eax,%eax
   1401383ff:	mov    -0x8(%rsi,%rax,1),%r11
   140138404:	mov    %r11,(%r8,%rax,1)
   140138408:	sub    $0x8,%rax
   14013840c:	sub    $0x1,%r10d
   140138410:	jne    1401383ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b2f>
   140138412:	lea    -0x1(%r9),%eax
   140138416:	mov    %rsi,%r8
   140138419:	imul   $0xfffffffffffffff8,%rax,%rax
   14013841d:	lea    -0x10(%rsi,%rax,1),%rsi
   140138422:	mov    -0x10(%r8,%rax,1),%rax
   140138427:	mov    %rax,(%rcx,%r13,8)
   14013842b:	jmp    140135490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bc0>
   140138430:	add    %rdx,%rdx
   140138433:	lea    0x1068(%rbx),%rcx
   14013843a:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013843f:	jmp    140135459 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b89>
   140138444:	mov    0x1050(%rbx),%rax
   14013844b:	mov    %rsi,%rbp
   14013844e:	sub    %rdx,%rbp
   140138451:	mov    %rax,0x38(%rsp)
   140138456:	sub    %rdx,%rax
   140138459:	sar    $0x3,%rax
   14013845d:	lea    (%rax,%rax,1),%rcx
   140138461:	cmp    %rcx,%rax
   140138464:	jae    1401383cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aff>
   14013846a:	mov    %rcx,%rdx
   14013846d:	lea    0x1048(%rbx),%rcx
   140138474:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138479:	mov    0x1048(%rbx),%rdx
   140138480:	mov    0x1050(%rbx),%rax
   140138487:	lea    (%rdx,%rbp,1),%rsi
   14013848b:	mov    %rax,0x38(%rsp)
   140138490:	lea    0x8(%rsi),%r8
   140138494:	jmp    1401383cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aff>
   140138499:	mov    0x1048(%rbx),%rdx
   1401384a0:	jmp    1401383e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b10>
   1401384a5:	mov    0x1048(%rbx),%rdx
   1401384ac:	lea    0x10(%rsi),%r8
   1401384b0:	cmp    0x38(%rsp),%r8
   1401384b5:	jae    140138510 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c40>
   1401384b7:	mov    0x1d0(%rsp),%rax
   1401384bf:	xor    %r12d,%r12d
   1401384c2:	mov    %rax,(%rsi)
   1401384c5:	mov    0x1c8(%rsp),%rax
   1401384cd:	mov    %rax,0x8(%rsi)
   1401384d1:	mov    %r8,%rsi
   1401384d4:	jmp    1401383e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b10>
   1401384d9:	mov    0x1068(%rbx),%rax
   1401384e0:	cmp    $0x2,%r12b
   1401384e4:	je     14013857e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cae>
   1401384ea:	cmp    $0x1,%r12b
   1401384ee:	je     140138561 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c91>
   1401384f0:	mov    -0x8(%rsi),%rdx
   1401384f4:	sub    $0x10,%rsi
   1401384f8:	mov    %rdx,0x8(%rax,%r13,8)
   1401384fd:	mov    (%rsi),%rdx
   140138500:	mov    %rdx,(%rax,%r13,8)
   140138504:	mov    0x1048(%rbx),%rdx
   14013850b:	jmp    140135490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bc0>
   140138510:	mov    0x1050(%rbx),%rax
   140138517:	mov    %rsi,%rbp
   14013851a:	sub    %rdx,%rbp
   14013851d:	mov    %rax,0x38(%rsp)
   140138522:	sub    %rdx,%rax
   140138525:	sar    $0x3,%rax
   140138529:	lea    (%rax,%rax,1),%rcx
   14013852d:	cmp    %rcx,%rax
   140138530:	jae    1401384b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14be7>
   140138532:	mov    %rcx,%rdx
   140138535:	lea    0x1048(%rbx),%rcx
   14013853c:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138541:	mov    0x1048(%rbx),%rdx
   140138548:	mov    0x1050(%rbx),%rax
   14013854f:	lea    (%rdx,%rbp,1),%rsi
   140138553:	mov    %rax,0x38(%rsp)
   140138558:	lea    0x10(%rsi),%r8
   14013855c:	jmp    1401384b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14be7>
   140138561:	mov    0x1c8(%rsp),%rdx
   140138569:	sub    $0x8,%rsi
   14013856d:	mov    %rdx,0x8(%rax,%r13,8)
   140138572:	mov    (%rsi),%rdx
   140138575:	mov    %rdx,(%rax,%r13,8)
   140138579:	jmp    140138067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14797>
   14013857e:	mov    0x1d0(%rsp),%rdx
   140138586:	mov    %rdx,(%rax,%r13,8)
   14013858a:	mov    0x1c8(%rsp),%rdx
   140138592:	mov    %rdx,0x8(%rax,%r13,8)
   140138597:	jmp    140138067 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14797>
   14013859c:	lea    0x15270(%rbx),%rcx
   1401385a3:	mov    %rbx,%rdx
   1401385a6:	call   1401577b0 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401385ab:	jmp    140138019 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14749>
   1401385b0:	lea    0x1048(%rbx),%rcx
   1401385b7:	lea    (%rdi,%rdi,1),%rdx
   1401385bb:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401385c0:	mov    0x15270(%rbx),%rcx
   1401385c7:	jmp    140138001 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14731>
   1401385cc:	mov    0x1050(%rbx),%rax
   1401385d3:	mov    0x1048(%rbx),%rdx
   1401385da:	mov    %rax,0x38(%rsp)
   1401385df:	sub    %rdx,%rax
   1401385e2:	sar    $0x3,%rax
   1401385e6:	lea    (%rax,%rax,1),%rcx
   1401385ea:	cmp    %rcx,%rax
   1401385ed:	jae    14013836b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a9b>
   1401385f3:	sub    %rdx,%rsi
   1401385f6:	mov    %rcx,%rdx
   1401385f9:	lea    0x1048(%rbx),%rcx
   140138600:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138605:	mov    0x1050(%rbx),%rax
   14013860c:	add    0x1048(%rbx),%rsi
   140138613:	lea    0x8(%rsi),%r8
   140138617:	mov    %rax,0x38(%rsp)
   14013861c:	jmp    14013836b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a9b>
   140138621:	mov    0x1c8(%rsp),%rax
   140138629:	mov    $0x2,%r12d
   14013862f:	mov    %rax,0x1d0(%rsp)
   140138637:	mov    $0x1fff,%eax
   14013863c:	shl    $0x33,%rax
   140138640:	mov    %rax,0x1c8(%rsp)
   140138648:	jmp    1401309c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0f6>
   14013864d:	mov    %rax,%rbx
   140138650:	cmpq   $0x0,0x60(%rsp)
   140138656:	jne    14013872c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e5c>
   14013865c:	vzeroupper
   14013865f:	mov    %rbx,%rcx
   140138662:	call   1401efa80 <_Unwind_Resume>
   140138667:	mov    0x680(%rsp),%rcx
   14013866f:	mov    %rax,%rbx
   140138672:	cmp    %r12,%rcx
   140138675:	je     14013873e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e6e>
   14013867b:	mov    0x690(%rsp),%rax
   140138683:	lea    0x1(%rax),%rdx
   140138687:	vzeroupper
   14013868a:	call   140338430 <operator delete(void*, unsigned long long)>
   14013868f:	mov    0x540(%rsp),%rcx
   140138697:	lea    0x550(%rsp),%rax
   14013869f:	cmp    %rax,%rcx
   1401386a2:	je     14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   1401386a4:	mov    0x550(%rsp),%rax
   1401386ac:	lea    0x1(%rax),%rdx
   1401386b0:	call   140338430 <operator delete(void*, unsigned long long)>
   1401386b5:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   1401386b7:	mov    0x680(%rsp),%rcx
   1401386bf:	mov    %rax,%rbx
   1401386c2:	lea    0x690(%rsp),%rax
   1401386ca:	cmp    %rax,%rcx
   1401386cd:	je     1401386f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e26>
   1401386cf:	mov    0x690(%rsp),%rax
   1401386d7:	lea    0x1(%rax),%rdx
   1401386db:	vzeroupper
   1401386de:	call   140338430 <operator delete(void*, unsigned long long)>
   1401386e3:	mov    %rsi,%rcx
   1401386e6:	call   1403388a0 <__cxa_free_exception>
   1401386eb:	mov    %rbx,%rcx
   1401386ee:	call   1401efa80 <_Unwind_Resume>
   1401386f3:	mov    %rax,%rbx
   1401386f6:	vzeroupper
   1401386f9:	jmp    1401386e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e13>
   1401386fb:	sub    $0x1,%rdx
   1401386ff:	mov    %rax,%rcx
   140138702:	jne    140138746 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e76>
   140138704:	vzeroupper
   140138707:	call   140338660 <__cxa_begin_catch>
   14013870c:	call   1403387d0 <__cxa_end_catch>
   140138711:	mov    0x15108(%rbx),%rax
   140138718:	cmp    0x15100(%rbx),%rax
   14013871f:	jne    1401387bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eef>
   140138725:	call   140338c30 <__cxa_rethrow>
   14013872a:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   14013872c:	mov    0x60(%rsp),%rcx
   140138731:	vzeroupper
   140138734:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138739:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   14013873e:	vzeroupper
   140138741:	jmp    14013868f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dbf>
   140138746:	vzeroupper
   140138749:	call   1401efa80 <_Unwind_Resume>
   14013874e:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138750:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138752:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138754:	mov    0x680(%rsp),%rcx
   14013875c:	mov    %rax,%rbx
   14013875f:	lea    0x690(%rsp),%rax
   140138767:	cmp    %rax,%rcx
   14013876a:	je     14013865c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8c>
   140138770:	mov    0x690(%rsp),%rax
   140138778:	lea    0x1(%rax),%rdx
   14013877c:	vzeroupper
   14013877f:	call   140338430 <operator delete(void*, unsigned long long)>
   140138784:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   140138789:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   14013878e:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138793:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138798:	vzeroupper
   14013879b:	call   14033e8c0 <setun::FixedFrameArena::handle_overflow() const [clone .isra.0]>
   1401387a0:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401387a5:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401387aa:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401387af:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401387b4:	jmp    140138667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d97>
   1401387b9:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   1401387bb:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   1401387bd:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   1401387bf:	mov    -0x20(%rax),%rdi
   1401387c3:	mov    -0x18(%rax),%rcx
   1401387c7:	sub    $0x20,%rax
   1401387cb:	mov    0x10(%rax),%rdx
   1401387cf:	mov    0x18(%rax),%rsi
   1401387d3:	mov    %rax,0x15108(%rbx)
   1401387da:	cmp    0x1060(%rbx),%rcx
   1401387e1:	jae    1401387ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f1a>
   1401387e3:	mov    %rcx,0x1060(%rbx)
   1401387ea:	cmpb   $0x0,0x15211(%rbx)
   1401387f1:	je     14013889f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fcf>
   1401387f7:	mov    %rdx,0x15268(%rbx)
   1401387fe:	cmp    %rsi,0x150c0(%rbx)
   140138805:	jb     140138817 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f47>
   140138807:	cmp    $0x800,%rsi
   14013880e:	ja     14013879b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ecb>
   140138810:	mov    %rsi,0x150c0(%rbx)
   140138817:	mov    %rdi,0x1038(%rbx)
   14013881e:	lea    0x223e4a(%rip),%rdx        # 14035c66f <.rdata+0x10af>
   140138825:	lea    0x680(%rsp),%rcx
   14013882d:	call   14020e8c0 <setun::VMValue::VMValue(char const*)>
   140138832:	lea    0x680(%rsp),%rdx
   14013883a:	lea    0x1048(%rbx),%rcx
   140138841:	call   14020dd20 <setun::VMStack::push(setun::VMValue const&)>
   140138846:	mov    0x1060(%rbx),%rax
   14013884d:	mov    0x1048(%rbx),%rdx
   140138854:	mov    0x1038(%rbx),%rbp
   14013885b:	mov    0x150c0(%rbx),%r13
   140138862:	lea    (%rdx,%rax,8),%rsi
   140138866:	mov    0x1050(%rbx),%rax
   14013886d:	add    %r15,%rbp
   140138870:	mov    %rax,0x38(%rsp)
   140138875:	test   %r13,%r13
   140138878:	jne    1401388cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ffb>
   14013887a:	cmpb   $0x0,0x1040(%rbx)
   140138881:	je     1401244fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140138887:	movzbl 0x0(%rbp),%eax
   14013888b:	lea    0x28780e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140138892:	add    $0x1,%rbp
   140138896:	xor    %r12d,%r12d
   140138899:	mov    (%rdi,%rax,8),%rax
   14013889d:	jmp    *%rax
   14013889f:	mov    0x1070(%rbx),%rax
   1401388a6:	sub    0x1068(%rbx),%rax
   1401388ad:	sar    $0x3,%rax
   1401388b1:	cmp    %rdx,%rax
   1401388b4:	jb     1401387fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f2e>
   1401388ba:	lea    0x1068(%rbx),%rcx
   1401388c1:	call   1402e8f20 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401388c6:	jmp    1401387fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f2e>
   1401388cb:	lea    -0x1(%r13),%rcx
   1401388cf:	imul   $0x28,%rcx,%rcx
   1401388d3:	mov    0x10c8(%rbx,%rcx,1),%r13
   1401388db:	jmp    14013887a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14faa>
   1401388dd:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401388e2:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   1401388e7:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401388ec:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401388f1:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401388f6:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401388fb:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138900:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138905:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   14013890a:	mov    0x688(%rsp),%rcx
   140138912:	mov    %rax,%rbx
   140138915:	test   %rcx,%rcx
   140138918:	jne    140138966 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15096>
   14013891a:	vzeroupper
   14013891d:	mov    %rdi,%rcx
   140138920:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138925:	mov    %rbx,%rcx
   140138928:	call   1401efa80 <_Unwind_Resume>
   14013892d:	mov    0x680(%rsp),%rcx
   140138935:	mov    %rax,%rbx
   140138938:	lea    0x690(%rsp),%rax
   140138940:	cmp    %rax,%rcx
   140138943:	jne    140138970 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150a0>
   140138945:	vzeroupper
   140138948:	jmp    140138950 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15080>
   14013894a:	mov    %rax,%rbx
   14013894d:	vzeroupper
   140138950:	test   %rdi,%rdi
   140138953:	je     14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   140138959:	mov    %rdi,%rcx
   14013895c:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138961:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   140138966:	vzeroupper
   140138969:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14013896e:	jmp    14013891d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1504d>
   140138970:	mov    0x690(%rsp),%rax
   140138978:	lea    0x1(%rax),%rdx
   14013897c:	vzeroupper
   14013897f:	call   140338430 <operator delete(void*, unsigned long long)>
   140138984:	jmp    140138950 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15080>
   140138986:	jmp    14013890a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1503a>
   140138988:	jmp    14013890a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1503a>
   14013898a:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   14013898f:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138994:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138999:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   14013899e:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401389a3:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401389a8:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401389ad:	jmp    140138667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d97>
   1401389b2:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   1401389b7:	mov    0x680(%rsp),%rcx
   1401389bf:	mov    %rax,%rbx
   1401389c2:	lea    0x690(%rsp),%rax
   1401389ca:	cmp    %rax,%rcx
   1401389cd:	je     140138a6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1519c>
   1401389d3:	mov    0x690(%rsp),%rax
   1401389db:	lea    0x1(%rax),%rdx
   1401389df:	vzeroupper
   1401389e2:	call   140338430 <operator delete(void*, unsigned long long)>
   1401389e7:	mov    0x540(%rsp),%rcx
   1401389ef:	lea    0x550(%rsp),%rax
   1401389f7:	cmp    %rax,%rcx
   1401389fa:	je     140138a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1513d>
   1401389fc:	mov    0x550(%rsp),%rax
   140138a04:	lea    0x1(%rax),%rdx
   140138a08:	call   140338430 <operator delete(void*, unsigned long long)>
   140138a0d:	mov    0x520(%rsp),%rcx
   140138a15:	lea    0x530(%rsp),%rax
   140138a1d:	cmp    %rax,%rcx
   140138a20:	je     140138a33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15163>
   140138a22:	mov    0x530(%rsp),%rax
   140138a2a:	lea    0x1(%rax),%rdx
   140138a2e:	call   140338430 <operator delete(void*, unsigned long long)>
   140138a33:	mov    0x500(%rsp),%rcx
   140138a3b:	lea    0x510(%rsp),%rax
   140138a43:	cmp    %rax,%rcx
   140138a46:	je     1401386e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e13>
   140138a4c:	mov    0x510(%rsp),%rax
   140138a54:	lea    0x1(%rax),%rdx
   140138a58:	call   140338430 <operator delete(void*, unsigned long long)>
   140138a5d:	jmp    1401386e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e13>
   140138a62:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a67:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a6c:	vzeroupper
   140138a6f:	jmp    1401389e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15117>
   140138a74:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a79:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138a7e:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a83:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a88:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138a8d:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a92:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a97:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138a9c:	jmp    140138667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d97>
   140138aa1:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138aa6:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138aab:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138ab0:	mov    %rax,%rbx
   140138ab3:	vzeroupper
   140138ab6:	jmp    1401389e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15117>
   140138abb:	mov    %rax,%rbx
   140138abe:	vzeroupper
   140138ac1:	jmp    140138a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1513d>
   140138ac6:	mov    %rax,%rbx
   140138ac9:	vzeroupper
   140138acc:	jmp    140138a33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15163>
   140138ad1:	jmp    1401386f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e23>
   140138ad6:	mov    %rax,%rbx
   140138ad9:	mov    %rsi,%rcx
   140138adc:	vzeroupper
   140138adf:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138ae4:	mov    %rbx,%rcx
   140138ae7:	call   1401efa80 <_Unwind_Resume>
   140138aec:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138af1:	mov    0x548(%rsp),%rcx
   140138af9:	mov    %rax,%rbx
   140138afc:	test   %rcx,%rcx
   140138aff:	jne    140138731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e61>
   140138b05:	jmp    14013865c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8c>
   140138b0a:	jmp    140138667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d97>
   140138b0f:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138b14:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138b19:	mov    %rax,%rbx
   140138b1c:	cmpq   $0x0,0x40(%rsp)
   140138b22:	je     14013865c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8c>
   140138b28:	mov    0x40(%rsp),%rcx
   140138b2d:	vzeroupper
   140138b30:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138b35:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   140138b3a:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138b3f:	mov    %rax,%rbx
   140138b42:	vzeroupper
   140138b45:	jmp    14013868f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dbf>
   140138b4a:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138b4f:	mov    %rax,%rbx
   140138b52:	test   %rdi,%rdi
   140138b55:	je     14013865c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8c>
   140138b5b:	mov    %rdi,%rcx
   140138b5e:	vzeroupper
   140138b61:	call   1402d7c80 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138b66:	jmp    14013865f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d8f>
   140138b6b:	mov    %rax,%rbx
   140138b6e:	vzeroupper
   140138b71:	jmp    14013891d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1504d>
   140138b76:	jmp    140138b3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1526f>
   140138b78:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138b7d:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138b82:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138b87:	jmp    1401386fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2b>
   140138b8c:	jmp    140138667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d97>
   140138b91:	jmp    140138754 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e84>
   140138b96:	cs nopw 0x0(%rax,%rax,1)

