0000000140123a70 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   140123a70:	push   %r15
   140123a72:	push   %r14
   140123a74:	push   %r13
   140123a76:	push   %r12
   140123a78:	push   %rbp
   140123a79:	push   %rdi
   140123a7a:	push   %rsi
   140123a7b:	push   %rbx
   140123a7c:	sub    $0x968,%rsp
   140123a83:	vmovaps %xmm6,0x8c0(%rsp)
   140123a8c:	vmovaps %xmm7,0x8d0(%rsp)
   140123a95:	vmovaps %xmm8,0x8e0(%rsp)
   140123a9e:	vmovaps %xmm9,0x8f0(%rsp)
   140123aa7:	vmovaps %xmm10,0x900(%rsp)
   140123ab0:	vmovaps %xmm11,0x910(%rsp)
   140123ab9:	vmovaps %xmm12,0x920(%rsp)
   140123ac2:	vmovaps %xmm13,0x930(%rsp)
   140123acb:	vmovaps %xmm14,0x940(%rsp)
   140123ad4:	vmovaps %xmm15,0x950(%rsp)
   140123add:	mov    0x8(%rdx),%rax
   140123ae1:	sub    (%rdx),%rax
   140123ae4:	mov    %rcx,%rbx
   140123ae7:	mov    %rdx,%r14
   140123aea:	cmp    %rax,0x1038(%rcx)
   140123af1:	jb     140123afe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   140123af3:	movq   $0x0,0x1038(%rcx)
   140123afe:	mov    0x152c8(%rbx),%rsi
   140123b05:	movb   $0x1,0x1040(%rbx)
   140123b0c:	test   %rsi,%rsi
   140123b0f:	je     140123b1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140123b11:	cmpb   $0x0,0x152c1(%rbx)
   140123b18:	jne    140124550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae0>
   140123b1e:	mov    0x58(%r14),%rbp
   140123b22:	test   %rbp,%rbp
   140123b25:	je     140123c24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b4>
   140123b2b:	mov    0x23900e(%rip),%rdi        # 14035cb40 <CSWTCH.3092+0x240>
   140123b32:	lea    0x1000(%rbx),%r15
   140123b39:	mov    $0x88,%ecx
   140123b3e:	lea    0x8(%rbp),%r12
   140123b42:	call   140338a00 <operator new(unsigned long long)>
   140123b47:	vpxor  %xmm3,%xmm3,%xmm3
   140123b4b:	mov    %r12,%rdx
   140123b4e:	mov    %rax,%rsi
   140123b51:	mov    %rdi,0x8(%rax)
   140123b55:	lea    0x2581e4(%rip),%rax        # 14037bd40 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140123b5c:	mov    %rax,(%rsi)
   140123b5f:	lea    0x20(%rsi),%rax
   140123b63:	lea    0x10(%rsi),%r13
   140123b67:	vmovdqu %ymm3,0x10(%rsi)
   140123b6c:	mov    %r13,%rcx
   140123b6f:	mov    %rax,0x10(%rsi)
   140123b73:	lea    0x40(%rsi),%rax
   140123b77:	vmovdqu %ymm3,0x30(%rsi)
   140123b7c:	mov    %rax,0x30(%rsi)
   140123b80:	lea    0x80(%rsi),%rax
   140123b87:	vmovdqu %ymm3,0x68(%rsi)
   140123b8c:	mov    %rax,0x50(%rsi)
   140123b90:	movq   $0x1,0x58(%rsi)
   140123b98:	movq   $0x0,0x60(%rsi)
   140123ba0:	movq   $0x3f800000,0x70(%rsi)
   140123ba8:	vzeroupper
   140123bab:	call   1402f0020 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123bb0:	lea    0x28(%rbp),%rdx
   140123bb4:	lea    0x50(%rsi),%rcx
   140123bb8:	cmp    %rdx,%rcx
   140123bbb:	je     140123bc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   140123bbd:	call   14029f130 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140123bc2:	mov    %r12,%rdx
   140123bc5:	mov    %r15,%rcx
   140123bc8:	call   140320b20 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140123bcd:	mov    %r13,(%rax)
   140123bd0:	cmp    %rsi,0x8(%rax)
   140123bd4:	je     140123c0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f>
   140123bd6:	lock addl $0x1,0x8(%rsi)
   140123bdb:	mov    0x8(%rax),%r12
   140123bdf:	test   %r12,%r12
   140123be2:	je     140123c0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   140123be4:	mov    0x8(%r12),%r8
   140123be9:	lea    0x8(%r12),%rdx
   140123bee:	movabs $0x100000001,%rcx
   140123bf8:	cmp    %rcx,%r8
   140123bfb:	je     14012a490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a20>
   140123c01:	lock subl $0x1,(%rdx)
   140123c05:	je     14012a6e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c71>
   140123c0b:	mov    %rsi,0x8(%rax)
   140123c0f:	mov    %rsi,%rcx
   140123c12:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140123c17:	mov    0x0(%rbp),%rbp
   140123c1b:	test   %rbp,%rbp
   140123c1e:	jne    140123b39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   140123c24:	mov    0x1060(%rbx),%rax
   140123c2b:	mov    0x1048(%rbx),%rdx
   140123c32:	mov    (%r14),%r15
   140123c35:	mov    0x1038(%rbx),%rcx
   140123c3c:	lea    (%rdx,%rax,8),%rsi
   140123c40:	mov    0x150c0(%rbx),%r13
   140123c47:	mov    0x1050(%rbx),%rax
   140123c4e:	add    %r15,%rcx
   140123c51:	mov    %rax,0x38(%rsp)
   140123c56:	test   %r13,%r13
   140123c59:	jne    140123cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x250>
   140123c5b:	mov    0xb0(%r14),%rax
   140123c62:	mov    $0x20,%edx
   140123c67:	cmp    %rdx,%rax
   140123c6a:	cmovb  %rdx,%rax
   140123c6e:	cmpb   $0x0,0x29c40b(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140123c75:	mov    %rax,0x15268(%rbx)
   140123c7c:	je     140123ceb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b>
   140123c7e:	movabs $0xfffb000000000000,%rax
   140123c88:	mov    %rax,0x1c8(%rsp)
   140123c90:	mov    %rax,0x1d0(%rsp)
   140123c98:	cmpb   $0x0,0x1040(%rbx)
   140123c9f:	je     14012a4cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a5f>
   140123ca5:	movzbl (%rcx),%eax
   140123ca8:	lea    0x29c3f1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140123caf:	lea    0x1(%rcx),%rbp
   140123cb3:	xor    %r12d,%r12d
   140123cb6:	mov    (%rdi,%rax,8),%rax
   140123cba:	jmp    *%rax
   140123cbc:	nopl   0x0(%rax)
   140123cc0:	lea    0x0(%r13,%r13,4),%rax
   140123cc5:	mov    0x10a0(%rbx,%rax,8),%r13
   140123ccd:	mov    0x10b0(%rbx,%rax,8),%rdi
   140123cd5:	add    %r13,%rdi
   140123cd8:	cmpb   $0x0,0x29c3a1(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140123cdf:	mov    %rdi,%rax
   140123ce2:	mov    %rax,0x15268(%rbx)
   140123ce9:	jne    140123c7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   140123ceb:	lea    0x65ed(%rip),%rdi        # 14012a2df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x686f>
   140123cf2:	lea    0x665c(%rip),%rax        # 14012a355 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68e5>
   140123cf9:	vmovq  %rdi,%xmm0
   140123cfe:	lea    0x64ef(%rip),%rdi        # 14012a1f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6784>
   140123d05:	lea    0x311d(%rip),%rdx        # 140126e29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33b9>
   140123d0c:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d12:	vmovq  %rdi,%xmm1
   140123d17:	lea    0x654b(%rip),%rax        # 14012a269 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   140123d1e:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123d24:	lea    0x4146(%rip),%rdi        # 140127e71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4401>
   140123d2b:	lea    0x4183(%rip),%rax        # 140127eb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4445>
   140123d32:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123d38:	vmovq  %rdi,%xmm0
   140123d3d:	lea    0x6687(%rip),%rdi        # 14012a3cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x695b>
   140123d44:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d4a:	vmovq  %rdi,%xmm1
   140123d4f:	lea    0x40d7(%rip),%rax        # 140127e2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43bd>
   140123d56:	vmovdqu %ymm2,0x140(%rsp)
   140123d5f:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123d65:	lea    0x433f(%rip),%rdi        # 1401280ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x463b>
   140123d6c:	lea    0x43c7(%rip),%rax        # 14012813a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46ca>
   140123d73:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123d79:	vmovq  %rdi,%xmm0
   140123d7e:	lea    0x4174(%rip),%rdi        # 140127ef9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4489>
   140123d85:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123d8b:	vmovq  %rdi,%xmm1
   140123d90:	lea    0x4206(%rip),%rax        # 140127f9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x452d>
   140123d97:	vmovdqu %ymm2,0x120(%rsp)
   140123da0:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123da6:	lea    0x45c4(%rip),%rdi        # 140128371 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4901>
   140123dad:	lea    0x4678(%rip),%rax        # 14012842c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49bc>
   140123db4:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123dba:	vmovq  %rdi,%xmm0
   140123dbf:	lea    0x4435(%rip),%rdi        # 1401281fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x478b>
   140123dc6:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123dcc:	vmovq  %rdi,%xmm1
   140123dd1:	lea    0x44de(%rip),%rax        # 1401282b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4846>
   140123dd8:	vmovdqu %ymm2,0x100(%rsp)
   140123de1:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123de7:	lea    0x4d20(%rip),%rdi        # 140128b0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x509e>
   140123dee:	lea    0x3c18(%rip),%rax        # 140127a0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f9d>
   140123df5:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123dfb:	vmovq  %rdi,%xmm0
   140123e00:	lea    0x4785(%rip),%rdi        # 14012858c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b1c>
   140123e07:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e0d:	vmovq  %rdi,%xmm1
   140123e12:	lea    0x48d3(%rip),%rax        # 1401286ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c7c>
   140123e19:	vmovdqu %ymm2,0xe0(%rsp)
   140123e22:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123e28:	lea    0x3f35(%rip),%rdi        # 140127d64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42f4>
   140123e2f:	lea    0x3f71(%rip),%rax        # 140127da7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4337>
   140123e36:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123e3c:	vmovq  %rdi,%xmm0
   140123e41:	lea    0x38f2(%rip),%rdi        # 14012773a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cca>
   140123e48:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e4e:	vmovq  %rdi,%xmm1
   140123e53:	lea    0x3ec8(%rip),%rax        # 140127d22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42b2>
   140123e5a:	vmovdqu %ymm2,0xc0(%rsp)
   140123e63:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123e69:	lea    0x39a9(%rip),%rdi        # 140127819 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3da9>
   140123e70:	lea    0x3a61(%rip),%rax        # 1401278d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e68>
   140123e77:	vinserti128 $0x1,%xmm0,%ymm1,%ymm3
   140123e7d:	vmovq  %rdi,%xmm0
   140123e82:	lea    0x3f61(%rip),%rdi        # 140127dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x437a>
   140123e89:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123e8f:	vmovq  %rdi,%xmm1
   140123e94:	lea    0x3914(%rip),%rax        # 1401277af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d3f>
   140123e9b:	vmovdqu %ymm3,0xa0(%rsp)
   140123ea4:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123eaa:	lea    0x499d(%rip),%rdi        # 14012884e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4dde>
   140123eb1:	lea    0x4af6(%rip),%rax        # 1401289ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f3e>
   140123eb8:	vinserti128 $0x1,%xmm0,%ymm1,%ymm4
   140123ebe:	vmovq  %rdi,%xmm0
   140123ec3:	lea    0x916(%rip),%rdi        # 1401247e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd70>
   140123eca:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ed0:	vmovq  %rdi,%xmm1
   140123ed5:	lea    0xb0b(%rip),%rax        # 1401249e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf77>
   140123edc:	vmovdqu %ymm4,0x80(%rsp)
   140123ee5:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123eeb:	lea    0x61d8(%rip),%rdi        # 14012a0ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x665a>
   140123ef2:	lea    0x5ad2(%rip),%rax        # 1401299cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f5b>
   140123ef9:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140123eff:	vmovq  %rdi,%xmm0
   140123f04:	lea    0x591a(%rip),%rdi        # 140129825 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5db5>
   140123f0b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f11:	vmovq  %rdi,%xmm1
   140123f16:	lea    0x59db(%rip),%rax        # 1401298f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e88>
   140123f1d:	vmovdqu %ymm2,0x60(%rsp)
   140123f23:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140123f29:	lea    0x600f(%rip),%rdi        # 140129f3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64cf>
   140123f30:	lea    0x5c3a(%rip),%rax        # 140129b71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6101>
   140123f37:	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   140123f3d:	vmovq  %rdi,%xmm0
   140123f42:	lea    0x5b55(%rip),%rdi        # 140129a9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x602e>
   140123f49:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f4f:	vmovq  %rdi,%xmm2
   140123f54:	lea    0x620d(%rip),%rax        # 14012a168 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66f8>
   140123f5b:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123f61:	lea    0x5e31(%rip),%rdi        # 140129d99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6329>
   140123f68:	lea    0x5efd(%rip),%rax        # 140129e6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63fc>
   140123f6f:	vinserti128 $0x1,%xmm0,%ymm2,%ymm3
   140123f75:	vmovq  %rdi,%xmm0
   140123f7a:	lea    0x5cc3(%rip),%rdi        # 140129c44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61d4>
   140123f81:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123f87:	vmovq  %rdi,%xmm2
   140123f8c:	lea    0x5d39(%rip),%rax        # 140129ccc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x625c>
   140123f93:	vmovdqu %ymm3,0x40(%rsp)
   140123f99:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140123f9f:	lea    0x351b(%rip),%rdi        # 1401274c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a51>
   140123fa6:	lea    0x503a(%rip),%rax        # 140128fe7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5577>
   140123fad:	vinserti128 $0x1,%xmm0,%ymm2,%ymm14
   140123fb3:	vmovq  %rdi,%xmm0
   140123fb8:	lea    0x335c(%rip),%rdi        # 14012731b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38ab>
   140123fbf:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123fc5:	vmovq  %rdi,%xmm4
   140123fca:	lea    0x341d(%rip),%rax        # 1401273ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x397e>
   140123fd1:	vpinsrq $0x1,%rax,%xmm4,%xmm4
   140123fd7:	lea    0x5282(%rip),%rdi        # 140129260 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57f0>
   140123fde:	lea    0x534e(%rip),%rax        # 140129333 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58c3>
   140123fe5:	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   140123feb:	vmovq  %rdi,%xmm0
   140123ff0:	lea    0x50c3(%rip),%rdi        # 1401290ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x564a>
   140123ff7:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140123ffd:	vmovq  %rdi,%xmm3
   140124002:	lea    0x5184(%rip),%rax        # 14012918d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x571d>
   140124009:	vpinsrq $0x1,%rax,%xmm3,%xmm3
   14012400f:	lea    0x5596(%rip),%rdi        # 1401295ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b3c>
   140124016:	lea    0x5662(%rip),%rax        # 14012967f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c0f>
   14012401d:	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   140124023:	vmovq  %rdi,%xmm0
   140124028:	lea    0x53d7(%rip),%rdi        # 140129406 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5996>
   14012402f:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124035:	vmovq  %rdi,%xmm2
   14012403a:	lea    0x5498(%rip),%rax        # 1401294d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a69>
   140124041:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140124047:	lea    0x4b7a(%rip),%rdi        # 140128bc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5158>
   14012404e:	lea    0x4c46(%rip),%rax        # 140128c9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x522b>
   140124055:	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   14012405b:	vmovq  %rdi,%xmm0
   140124060:	lea    0x352d(%rip),%rdi        # 140127594 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b24>
   140124067:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012406d:	vmovq  %rdi,%xmm5
   140124072:	lea    0x35ee(%rip),%rax        # 140127667 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bf7>
   140124079:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   14012407f:	lea    0x301c(%rip),%rdi        # 1401270a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3632>
   140124086:	lea    0x30e8(%rip),%rax        # 140127175 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3705>
   14012408d:	vinserti128 $0x1,%xmm0,%ymm5,%ymm15
   140124093:	vmovq  %rdi,%xmm0
   140124098:	lea    0x2e5d(%rip),%rdi        # 140126efc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x348c>
   14012409f:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401240a5:	vmovq  %rdi,%xmm5
   1401240aa:	lea    0x2f1e(%rip),%rax        # 140126fcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x355f>
   1401240b1:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   1401240b7:	lea    0x4d83(%rip),%rdi        # 140128e41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53d1>
   1401240be:	lea    0x4e4f(%rip),%rax        # 140128f14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54a4>
   1401240c5:	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   1401240cb:	vmovq  %rdi,%xmm0
   1401240d0:	lea    0x25df(%rip),%rdi        # 1401266b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c46>
   1401240d7:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401240dd:	lea    0x4c8a(%rip),%rax        # 140128d6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52fe>
   1401240e4:	vmovq  %rdx,%xmm0
   1401240e9:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401240ef:	lea    0x221b(%rip),%rdx        # 140126311 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28a1>
   1401240f6:	lea    0x26a6(%rip),%rax        # 1401267a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d33>
   1401240fd:	vinserti128 $0x1,%xmm6,%ymm0,%ymm13
   140124103:	vmovq  %rdi,%xmm0
   140124108:	lea    0x1ba9(%rip),%rdi        # 140125cb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2248>
   14012410f:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124115:	lea    0x24d3(%rip),%rax        # 1401265ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b7f>
   14012411c:	vmovq  %rdx,%xmm0
   140124121:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124127:	lea    0x192a(%rip),%rdx        # 140125a58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fe8>
   14012412e:	lea    0x1cb2(%rip),%rax        # 140125de7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2377>
   140124135:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   14012413b:	vmovq  %rdi,%xmm0
   140124140:	lea    0x11fc(%rip),%rdi        # 140125343 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18d3>
   140124147:	vmovdqu %ymm6,0x180(%rsp)
   140124150:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124156:	lea    0x1a2c(%rip),%rax        # 140125b89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2119>
   14012415d:	vmovq  %rdx,%xmm0
   140124162:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124168:	lea    0x1066(%rip),%rdx        # 1401251d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1765>
   14012416f:	lea    0x1284(%rip),%rax        # 1401253fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x198a>
   140124176:	vinserti128 $0x1,%xmm6,%ymm0,%ymm10
   14012417c:	vmovq  %rdi,%xmm0
   140124181:	lea    0x2955(%rip),%rdi        # 140126add <setun::VM::run_optimized(setun::OptimizedChunk&)+0x306d>
   140124188:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14012418e:	lea    0x10f7(%rip),%rax        # 14012528c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x181c>
   140124195:	vmovq  %rdx,%xmm0
   14012419a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401241a0:	lea    0x1627(%rip),%rdx        # 1401257ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d5e>
   1401241a7:	lea    0x1668(%rip),%rax        # 140125816 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1da6>
   1401241ae:	vinserti128 $0x1,%xmm6,%ymm0,%ymm9
   1401241b4:	vmovq  %rdi,%xmm0
   1401241b9:	lea    0x1352(%rip),%rdi        # 140125512 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aa2>
   1401241c0:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401241c6:	lea    0x283d(%rip),%rax        # 140126a0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f9a>
   1401241cd:	vmovq  %rdx,%xmm0
   1401241d2:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401241d8:	lea    0x1758(%rip),%rdx        # 140125937 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ec7>
   1401241df:	lea    0x13b8(%rip),%rax        # 14012559e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b2e>
   1401241e6:	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   1401241ec:	vmovq  %rdi,%xmm0
   1401241f1:	lea    0xedf(%rip),%rdi        # 1401250d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1667>
   1401241f8:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   1401241fe:	lea    0x1281(%rip),%rax        # 140125486 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a16>
   140124205:	vmovq  %rdx,%xmm0
   14012420a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124210:	lea    0xdaf(%rip),%rdx        # 140124fc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1556>
   140124217:	lea    0xf51(%rip),%rax        # 14012516f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ff>
   14012421e:	vinserti128 $0x1,%xmm6,%ymm0,%ymm12
   140124224:	vmovq  %rdi,%xmm0
   140124229:	lea    0xafa(%rip),%rdi        # 140124d2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ba>
   140124230:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124236:	lea    0xe24(%rip),%rax        # 140125061 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15f1>
   14012423d:	vmovq  %rdx,%xmm0
   140124242:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124248:	lea    0xa20(%rip),%rdx        # 140124c6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ff>
   14012424f:	lea    0xb56(%rip),%rax        # 140124dac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133c>
   140124256:	vinserti128 $0x1,%xmm6,%ymm0,%ymm11
   14012425c:	vmovq  %rdi,%xmm0
   140124261:	lea    0xc1a(%rip),%rdi        # 140124e82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1412>
   140124268:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   14012426e:	lea    0xa1c(%rip),%rax        # 140124c91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1221>
   140124275:	vmovq  %rdx,%xmm0
   14012427a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124280:	lea    0xc53(%rip),%rdx        # 140124eda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146a>
   140124287:	lea    0xca7(%rip),%rax        # 140124f35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c5>
   14012428e:	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   140124294:	vmovq  %rdx,%xmm6
   140124299:	vmovq  %rdi,%xmm0
   14012429e:	vpinsrq $0x1,%rax,%xmm6,%xmm6
   1401242a4:	lea    0x268c(%rip),%rax        # 140126937 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ec7>
   1401242ab:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401242b1:	lea    0x490(%rip),%rax        # 140124748 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd8>
   1401242b8:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   1401242be:	vmovq  %rax,%xmm0
   1401242c3:	lea    0x29bdd6(%rip),%rax        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401242ca:	vmovdqu %ymm6,0x160(%rsp)
   1401242d3:	vpbroadcastq %xmm0,%ymm0
   1401242d8:	lea    0x800(%rax),%rdx
   1401242df:	nop
   1401242e0:	vmovdqa %ymm0,(%rax)
   1401242e4:	add    $0x40,%rax
   1401242e8:	vmovdqa %ymm0,-0x20(%rax)
   1401242ed:	cmp    %rdx,%rax
   1401242f0:	jne    1401242e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x870>
   1401242f2:	lea    0xc6b(%rip),%rax        # 140124f64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f4>
   1401242f9:	lea    0x132a(%rip),%rdi        # 14012562a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1bba>
   140124300:	vmovdqu 0x160(%rsp),%ymm6
   140124309:	vmovdqa %ymm2,0x29c24f(%rip)        # 1403c0560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   140124311:	mov    %rax,0x29bdc8(%rip)        # 1403c00e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140124318:	vmovq  %rdi,%xmm0
   14012431d:	lea    0x1392(%rip),%rax        # 1401256b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c46>
   140124324:	lea    0x1beb(%rip),%rdi        # 140125f16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24a6>
   14012432b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124331:	lea    0x140a(%rip),%rax        # 140125742 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1cd2>
   140124338:	vmovdqu 0x40(%rsp),%ymm2
   14012433e:	vmovdqa %ymm6,0x29bd7a(%rip)        # 1403c00c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   140124346:	vmovdqu 0x180(%rsp),%ymm6
   14012434f:	mov    %rax,0x29beba(%rip)        # 1403c0210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   140124356:	lea    0x1ce8(%rip),%rax        # 140126045 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25d5>
   14012435d:	vmovdqa %xmm0,0x29be9b(%rip)        # 1403c0200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   140124365:	vmovq  %rdi,%xmm0
   14012436a:	lea    0x283f(%rip),%rdi        # 140126bb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3140>
   140124371:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124377:	lea    0x2905(%rip),%rax        # 140126c83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3213>
   14012437e:	vmovdqa %ymm5,0x29c13a(%rip)        # 1403c04c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   140124386:	vmovdqa %xmm0,0x29beb2(%rip)        # 1403c0240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   14012438e:	vmovq  %rdi,%xmm0
   140124393:	lea    0x1dda(%rip),%rdi        # 140126174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2704>
   14012439a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401243a0:	lea    0x29af(%rip),%rax        # 140126d56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32e6>
   1401243a7:	vmovdqa %ymm4,0x29c171(%rip)        # 1403c0520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   1401243af:	mov    %rax,0x29befa(%rip)        # 1403c02b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   1401243b6:	lea    0x1ded(%rip),%rax        # 1401261aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273a>
   1401243bd:	vmovdqa %xmm0,0x29bedb(%rip)        # 1403c02a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   1401243c5:	vmovq  %rdi,%xmm0
   1401243ca:	lea    0x36bb(%rip),%rdi        # 140127a8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x401c>
   1401243d1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401243d7:	lea    0x1e47(%rip),%rax        # 140126225 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b5>
   1401243de:	vmovdqa %ymm3,0x29c15a(%rip)        # 1403c0540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   1401243e6:	mov    %rax,0x29bf43(%rip)        # 1403c0330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   1401243ed:	lea    0x24b5(%rip),%rax        # 1401268a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e39>
   1401243f4:	mov    %rax,0x29bfc5(%rip)        # 1403c03c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x320>
   1401243fb:	lea    0x24f(%rip),%rax        # 140124651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   140124402:	mov    %rax,0x29c48f(%rip)        # 1403c0898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140124409:	lea    0x2e38(%rip),%rax        # 140127248 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37d8>
   140124410:	mov    %rax,0x29c0c9(%rip)        # 1403c04e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140124417:	lea    0x5334(%rip),%rax        # 140129752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ce2>
   14012441e:	mov    %rax,0x29c15b(%rip)        # 1403c0580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   140124425:	lea    0x37a9(%rip),%rax        # 140127bd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4165>
   14012442c:	vmovdqa %xmm0,0x29beec(%rip)        # 1403c0320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   140124434:	vmovq  %rdi,%xmm0
   140124439:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012443f:	vmovdqa %ymm2,0x29c179(%rip)        # 1403c05c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   140124447:	lea    0x385c(%rip),%rax        # 140127caa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x423a>
   14012444e:	vmovdqa %ymm7,0x29bc4a(%rip)        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124456:	vmovdqa %ymm11,0x29bcc2(%rip)        # 1403c0120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   14012445e:	vmovdqa %ymm9,0x29bd3a(%rip)        # 1403c01a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   140124466:	vmovdqa %ymm8,0x29bd52(%rip)        # 1403c01c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   14012446e:	vmovdqa %ymm12,0x29bd6a(%rip)        # 1403c01e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   140124476:	vmovdqa %ymm10,0x29bda2(%rip)        # 1403c0220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   14012447e:	vmovdqa %ymm6,0x29bf1a(%rip)        # 1403c03a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   140124486:	vmovdqa %ymm13,0x29bf92(%rip)        # 1403c0420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   14012448e:	vmovdqa %ymm15,0x29c00a(%rip)        # 1403c04a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   140124496:	vmovdqa %ymm1,0x29c102(%rip)        # 1403c05a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   14012449e:	vmovdqa %ymm14,0x29c13a(%rip)        # 1403c05e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   1401244a6:	vmovdqa %xmm0,0x29c272(%rip)        # 1403c0720 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x680>
   1401244ae:	vmovdqu 0x140(%rsp),%ymm4
   1401244b7:	vmovdqu 0x120(%rsp),%ymm2
   1401244c0:	vmovdqu 0x100(%rsp),%ymm3
   1401244c9:	mov    %rax,0x29c260(%rip)        # 1403c0730 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x690>
   1401244d0:	vmovdqu 0xc0(%rsp),%ymm5
   1401244d9:	vmovdqa %ymm4,0x29c13f(%rip)        # 1403c0620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   1401244e1:	vmovdqu 0xe0(%rsp),%ymm4
   1401244ea:	vmovdqa %ymm2,0x29c14e(%rip)        # 1403c0640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   1401244f2:	vmovdqu 0xa0(%rsp),%ymm2
   1401244fb:	vmovdqa %ymm3,0x29c15d(%rip)        # 1403c0660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140124503:	vmovdqu 0x80(%rsp),%ymm3
   14012450c:	vmovdqa %ymm4,0x29c16c(%rip)        # 1403c0680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140124514:	vmovdqu 0x60(%rsp),%ymm4
   14012451a:	movb   $0x1,0x29bb5f(%rip)        # 1403c0080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140124521:	vmovdqa %ymm5,0x29c177(%rip)        # 1403c06a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   140124529:	vmovdqa %ymm2,0x29c18f(%rip)        # 1403c06c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140124531:	vmovdqa %ymm3,0x29c1a7(%rip)        # 1403c06e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   140124539:	vmovdqa %ymm4,0x29c1bf(%rip)        # 1403c0700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140124541:	jmp    140123c7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   140124546:	cs nopw 0x0(%rax,%rax,1)
   140124550:	mov    0xe0(%rsi),%rax
   140124557:	cmp    %rax,0xd8(%rsi)
   14012455e:	jne    140124638 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc8>
   140124564:	mov    0x88(%r14),%rax
   14012456b:	sub    0x80(%r14),%rax
   140124572:	mov    $0x80,%edx
   140124577:	lea    0xd8(%rsi),%rcx
   14012457e:	sar    $0x2,%rax
   140124582:	add    $0x10,%rax
   140124586:	cmp    $0x80,%rax
   14012458c:	jbe    140124598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb28>
   14012458e:	xchg   %ax,%ax
   140124590:	add    %rdx,%rdx
   140124593:	cmp    %rax,%rdx
   140124596:	jb     140124590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb20>
   140124598:	mov    0x8c(%rsi),%eax
   14012459e:	mov    0x88(%rsi),%r9d
   1401245a5:	mov    $0x80,%r8d
   1401245ab:	mov    %eax,0x28(%rsp)
   1401245af:	mov    0x90(%rsi),%eax
   1401245b5:	mov    %eax,0x20(%rsp)
   1401245b9:	call   14019f1c0 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   1401245be:	vmovdqu 0xd8(%rsi),%xmm1
   1401245c6:	vmovdqu 0xe8(%rsi),%xmm0
   1401245ce:	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   1401245d4:	vmovq  %xmm1,%rax
   1401245d9:	vpextrq $0x1,%xmm0,%rcx
   1401245df:	vmovdqu %xmm2,0x152d8(%rbx)
   1401245e7:	mov    0xe0(%rsi),%rdx
   1401245ee:	sub    %rax,%rdx
   1401245f1:	mov    0xf8(%rsi),%rax
   1401245f8:	sar    $0x5,%rdx
   1401245fc:	sub    %rcx,%rax
   1401245ff:	mov    %rdx,0x152e8(%rbx)
   140124606:	sar    $0x5,%rax
   14012460a:	cmp    $0x1,%rdx
   14012460e:	adc    $0xffffffffffffffff,%rdx
   140124612:	cmp    $0x1,%rax
   140124616:	mov    %rax,0x152f0(%rbx)
   14012461d:	adc    $0xffffffffffffffff,%rax
   140124621:	mov    %rdx,0x152f8(%rbx)
   140124628:	mov    %rax,0x15300(%rbx)
   14012462f:	jmp    140123b1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140124634:	nopl   0x0(%rax)
   140124638:	mov    0xf0(%rsi),%rax
   14012463f:	cmp    %rax,0xf8(%rsi)
   140124646:	jne    1401245be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e>
   14012464c:	jmp    140124564 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf4>
   140124651:	movb   $0x0,0x1040(%rbx)
   140124658:	mov    0x1048(%rbx),%rdx
   14012465f:	vzeroupper
   140124662:	cmp    $0x2,%r12b
   140124666:	jne    14012a460 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f0>
   14012466c:	mov    0x1050(%rbx),%rax
   140124673:	lea    0x10(%rsi),%r8
   140124677:	cmp    0x38(%rsp),%r8
   14012467c:	jae    14012d09c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x962c>
   140124682:	mov    0x1d0(%rsp),%rcx
   14012468a:	mov    %rcx,(%rsi)
   14012468d:	mov    0x1c8(%rsp),%rcx
   140124695:	mov    %rcx,0x8(%rsi)
   140124699:	mov    %r8,%rsi
   14012469c:	sub    %r15,%rbp
   14012469f:	sub    %rdx,%rsi
   1401246a2:	sub    %rdx,%rax
   1401246a5:	mov    %rbp,0x1038(%rbx)
   1401246ac:	mov    %rsi,%rbp
   1401246af:	sar    $0x3,%rbp
   1401246b3:	cmp    %rsi,%rax
   1401246b6:	jb     14012a478 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a08>
   1401246bc:	vmovdqa 0x23841c(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401246c4:	mov    %rbp,0x1060(%rbx)
   1401246cb:	movb   $0x0,0x153a0(%rbx)
   1401246d2:	vmovdqa %xmm0,0x15390(%rbx)
   1401246da:	vmovaps 0x8c0(%rsp),%xmm6
   1401246e3:	vmovaps 0x8d0(%rsp),%xmm7
   1401246ec:	vmovaps 0x8e0(%rsp),%xmm8
   1401246f5:	vmovaps 0x8f0(%rsp),%xmm9
   1401246fe:	vmovaps 0x900(%rsp),%xmm10
   140124707:	vmovaps 0x910(%rsp),%xmm11
   140124710:	vmovaps 0x920(%rsp),%xmm12
   140124719:	vmovaps 0x930(%rsp),%xmm13
   140124722:	vmovaps 0x940(%rsp),%xmm14
   14012472b:	vmovaps 0x950(%rsp),%xmm15
   140124734:	add    $0x968,%rsp
   14012473b:	pop    %rbx
   14012473c:	pop    %rsi
   14012473d:	pop    %rdi
   14012473e:	pop    %rbp
   14012473f:	pop    %r12
   140124741:	pop    %r13
   140124743:	pop    %r14
   140124745:	pop    %r15
   140124747:	ret
   140124748:	cmp    $0x2,%r12b
   14012474c:	je     14012b8c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e53>
   140124752:	cmp    $0x1,%r12b
   140124756:	jne    140137f3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144ce>
   14012475c:	mov    0x1048(%rbx),%rdx
   140124763:	lea    0x8(%rsi),%r8
   140124767:	cmp    0x38(%rsp),%r8
   14012476c:	jae    140131a68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdff8>
   140124772:	mov    0x1050(%rbx),%rax
   140124779:	vzeroupper
   14012477c:	mov    0x1c8(%rsp),%rcx
   140124784:	mov    %rcx,(%rsi)
   140124787:	sub    %rdx,%r8
   14012478a:	sub    %r15,%rbp
   14012478d:	sub    %rdx,%rax
   140124790:	mov    %r8,%rsi
   140124793:	mov    %rbp,0x1038(%rbx)
   14012479a:	sar    $0x3,%rsi
   14012479e:	cmp    %r8,%rax
   1401247a1:	jae    1401247b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd43>
   1401247a3:	lea    (%rsi,%rsi,1),%rdx
   1401247a7:	lea    0x1048(%rbx),%rcx
   1401247ae:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401247b3:	vmovdqa 0x238325(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401247bb:	mov    %rsi,0x1060(%rbx)
   1401247c2:	movb   $0x0,0x153a0(%rbx)
   1401247c9:	mov    0x1038(%rbx),%rcx
   1401247d0:	vmovdqa %xmm0,0x15390(%rbx)
   1401247d8:	call   14033ed4e <setun::cold_throw_unknown_opcode(unsigned long long)>
   1401247dd:	nopl   (%rax)
   1401247e0:	movzwl 0x6(%rbp),%edx
   1401247e4:	lea    0x8(%rbp),%rdi
   1401247e8:	movzwl 0x0(%rbp),%r9d
   1401247ed:	mov    %rdi,0xa0(%rsp)
   1401247f5:	movzwl 0x2(%rbp),%r8d
   1401247fa:	movzwl 0x4(%rbp),%eax
   1401247fe:	lea    (%rdx,%r13,1),%rdi
   140124802:	cmp    0x15268(%rbx),%rdi
   140124809:	jae    14012fa60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbff0>
   14012480f:	vzeroupper
   140124812:	mov    0x1070(%rbx),%rcx
   140124819:	sub    0x1068(%rbx),%rcx
   140124820:	sar    $0x3,%rcx
   140124824:	cmp    %rcx,%rdi
   140124827:	jae    14012f782 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd12>
   14012482d:	mov    0x1068(%rbx),%rdx
   140124834:	movzwl %r9w,%ecx
   140124838:	movzwl %ax,%eax
   14012483b:	add    %r13,%rcx
   14012483e:	add    %r13,%rax
   140124841:	lea    (%rdx,%rcx,8),%r10
   140124845:	movzwl %r8w,%ecx
   140124849:	lea    (%rdx,%rax,8),%r11
   14012484d:	add    %r13,%rcx
   140124850:	mov    (%r10),%rax
   140124853:	lea    (%rdx,%rcx,8),%r9
   140124857:	movabs $0xfff7ffffffffffff,%rdx
   140124861:	cmp    %rax,%rdx
   140124864:	jae    140124943 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed3>
   14012486a:	movabs $0xfffc000000000000,%rdx
   140124874:	cmp    %rdx,%rax
   140124877:	je     140124943 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed3>
   14012487d:	movabs $0xffffffff00000000,%rdx
   140124887:	and    %rdx,%rax
   14012488a:	movabs $0xfffd000100000000,%rdx
   140124894:	cmp    %rdx,%rax
   140124897:	je     140130b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0e8>
   14012489d:	movabs $0xffffffff00000000,%rax
   1401248a7:	mov    (%r9),%rdx
   1401248aa:	movabs $0xfffd000100000000,%rcx
   1401248b4:	and    %rax,%rdx
   1401248b7:	cmp    %rcx,%rdx
   1401248ba:	je     140130b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0e8>
   1401248c0:	and    (%r11),%rax
   1401248c3:	cmp    %rcx,%rax
   1401248c6:	je     140130b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0e8>
   1401248cc:	mov    %r11,%rcx
   1401248cf:	mov    %r10,0x60(%rsp)
   1401248d4:	mov    %r9,0x40(%rsp)
   1401248d9:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401248de:	mov    0x40(%rsp),%rcx
   1401248e3:	vmovapd %xmm0,%xmm6
   1401248e7:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401248ec:	mov    0x60(%rsp),%rcx
   1401248f1:	vmovapd %xmm0,%xmm7
   1401248f5:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401248fa:	movabs $0xfffc000000000000,%rax
   140124904:	vfmadd132sd %xmm7,%xmm6,%xmm0
   140124909:	vucomisd %xmm0,%xmm0
   14012490d:	vmovq  %xmm0,%rdx
   140124912:	cmovnp %rdx,%rax
   140124916:	mov    0x1068(%rbx),%rdx
   14012491d:	mov    %rax,(%rdx,%rdi,8)
   140124921:	cmpb   $0x0,0x1040(%rbx)
   140124928:	je     14012d2ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x985e>
   14012492e:	movzbl 0x8(%rbp),%eax
   140124932:	lea    0x29b767(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124939:	add    $0x9,%rbp
   14012493d:	mov    (%rdi,%rax,8),%rax
   140124941:	jmp    *%rax
   140124943:	movabs $0xfff7ffffffffffff,%rdx
   14012494d:	mov    (%r9),%rax
   140124950:	cmp    %rax,%rdx
   140124953:	jae    140124968 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef8>
   140124955:	movabs $0xfffc000000000000,%rdx
   14012495f:	cmp    %rdx,%rax
   140124962:	jne    14012489d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d>
   140124968:	movabs $0xfff7ffffffffffff,%rdx
   140124972:	mov    (%r11),%rax
   140124975:	cmp    %rax,%rdx
   140124978:	jae    14012498d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1d>
   14012497a:	movabs $0xfffc000000000000,%rdx
   140124984:	cmp    %rdx,%rax
   140124987:	jne    14012489d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d>
   14012498d:	mov    %r11,%rcx
   140124990:	mov    %r10,0x60(%rsp)
   140124995:	mov    %r9,0x40(%rsp)
   14012499a:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012499f:	mov    0x40(%rsp),%rcx
   1401249a4:	vmovapd %xmm0,%xmm7
   1401249a8:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401249ad:	mov    0x60(%rsp),%rcx
   1401249b2:	vmovapd %xmm0,%xmm6
   1401249b6:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401249bb:	mov    0x1068(%rbx),%rdx
   1401249c2:	movabs $0xfffc000000000000,%rax
   1401249cc:	vfmadd132sd %xmm6,%xmm7,%xmm0
   1401249d1:	vucomisd %xmm0,%xmm0
   1401249d5:	vmovq  %xmm0,%rcx
   1401249da:	cmovnp %rcx,%rax
   1401249de:	mov    %rax,(%rdx,%rdi,8)
   1401249e2:	jmp    140124921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1>
   1401249e7:	movzwl 0x6(%rbp),%edx
   1401249eb:	lea    0x8(%rbp),%rdi
   1401249ef:	movzwl 0x0(%rbp),%r9d
   1401249f4:	mov    %rdi,0xa0(%rsp)
   1401249fc:	movzwl 0x2(%rbp),%r8d
   140124a01:	movzwl 0x4(%rbp),%eax
   140124a05:	lea    (%rdx,%r13,1),%rdi
   140124a09:	cmp    0x15268(%rbx),%rdi
   140124a10:	jae    1401306cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc5b>
   140124a16:	vzeroupper
   140124a19:	mov    0x1070(%rbx),%rcx
   140124a20:	sub    0x1068(%rbx),%rcx
   140124a27:	sar    $0x3,%rcx
   140124a2b:	cmp    %rcx,%rdi
   140124a2e:	jae    140130938 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcec8>
   140124a34:	mov    0x1068(%rbx),%rdx
   140124a3b:	movzwl %r9w,%ecx
   140124a3f:	movzwl %r8w,%r8d
   140124a43:	movzwl %ax,%eax
   140124a46:	add    %r13,%rcx
   140124a49:	add    %r13,%r8
   140124a4c:	add    %r13,%rax
   140124a4f:	lea    (%rdx,%rcx,8),%rcx
   140124a53:	lea    (%rdx,%rax,8),%rax
   140124a57:	lea    (%rdx,%r8,8),%r9
   140124a5b:	mov    (%rcx),%rdx
   140124a5e:	mov    %rax,0x40(%rsp)
   140124a63:	movabs $0xffff000000000000,%rax
   140124a6d:	movabs $0xfffd000000000000,%r8
   140124a77:	and    %rdx,%rax
   140124a7a:	cmp    %r8,%rax
   140124a7d:	je     14012b899 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e29>
   140124a83:	movabs $0xfff8000000000000,%rdx
   140124a8d:	cmp    %rdx,%rax
   140124a90:	je     14012b8b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e41>
   140124a96:	mov    %r9,0x80(%rsp)
   140124a9e:	call   14021c1d0 <setun::VMValue::as_float() const>
   140124aa3:	vcvttsd2si %xmm0,%rax
   140124aa8:	mov    %rax,0x420(%rsp)
   140124ab0:	lea    0x420(%rsp),%rax
   140124ab8:	mov    0x80(%rsp),%r9
   140124ac0:	movq   $0x0,0x428(%rsp)
   140124acc:	movq   $0x0,0x430(%rsp)
   140124ad8:	mov    %rax,0x60(%rsp)
   140124add:	movabs $0xffff000000000000,%rax
   140124ae7:	mov    (%r9),%rdx
   140124aea:	movabs $0xfffd000000000000,%rcx
   140124af4:	and    %rdx,%rax
   140124af7:	cmp    %rcx,%rax
   140124afa:	je     14012d2f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9884>
   140124b00:	movabs $0xfff8000000000000,%rdx
   140124b0a:	cmp    %rdx,%rax
   140124b0d:	je     14012d30c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x989c>
   140124b13:	mov    %r9,%rcx
   140124b16:	call   14021c1d0 <setun::VMValue::as_float() const>
   140124b1b:	lea    0x440(%rsp),%r8
   140124b23:	movq   $0x0,0x448(%rsp)
   140124b2f:	vcvttsd2si %xmm0,%rax
   140124b34:	movq   $0x0,0x450(%rsp)
   140124b40:	mov    %rax,0x440(%rsp)
   140124b48:	movabs $0xfffd000000000000,%rcx
   140124b52:	mov    0x40(%rsp),%rax
   140124b57:	mov    (%rax),%rdx
   140124b5a:	movabs $0xffff000000000000,%rax
   140124b64:	and    %rdx,%rax
   140124b67:	cmp    %rcx,%rax
   140124b6a:	je     14012d341 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98d1>
   140124b70:	movabs $0xfff8000000000000,%rdx
   140124b7a:	cmp    %rdx,%rax
   140124b7d:	je     14012d359 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98e9>
   140124b83:	mov    0x40(%rsp),%rcx
   140124b88:	mov    %r8,0xc0(%rsp)
   140124b90:	call   14021c1d0 <setun::VMValue::as_float() const>
   140124b95:	vcvttsd2si %xmm0,%rax
   140124b9a:	mov    %rax,0x460(%rsp)
   140124ba2:	lea    0x460(%rsp),%rax
   140124baa:	mov    0xc0(%rsp),%r8
   140124bb2:	movq   $0x0,0x468(%rsp)
   140124bbe:	movq   $0x0,0x470(%rsp)
   140124bca:	mov    %rax,0x80(%rsp)
   140124bd2:	lea    0x680(%rsp),%rax
   140124bda:	mov    0x60(%rsp),%rdx
   140124bdf:	mov    %rax,%rcx
   140124be2:	mov    %rax,0x40(%rsp)
   140124be7:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140124bec:	mov    0x40(%rsp),%r8
   140124bf1:	mov    0x80(%rsp),%rdx
   140124bf9:	lea    0x4e0(%rsp),%rcx
   140124c01:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140124c06:	mov    0x4f0(%rsp),%rax
   140124c0e:	vmovdqa 0x4e0(%rsp),%xmm5
   140124c17:	lea    0x1a0(%rsp),%rdx
   140124c1f:	mov    0x40(%rsp),%rcx
   140124c24:	mov    %rax,0x1b0(%rsp)
   140124c2c:	vmovdqa %xmm5,0x1a0(%rsp)
   140124c35:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140124c3a:	mov    0x1068(%rbx),%rax
   140124c41:	mov    0x680(%rsp),%rdx
   140124c49:	mov    %rdx,(%rax,%rdi,8)
   140124c4d:	cmpb   $0x0,0x1040(%rbx)
   140124c54:	je     14012d2ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x985e>
   140124c5a:	movzbl 0x8(%rbp),%eax
   140124c5e:	lea    0x29b43b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c65:	add    $0x9,%rbp
   140124c69:	mov    (%rdi,%rax,8),%rax
   140124c6d:	jmp    *%rax
   140124c6f:	cmpb   $0x0,0x1040(%rbx)
   140124c76:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124c7c:	movzbl 0x0(%rbp),%eax
   140124c80:	lea    0x29b419(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124c87:	add    $0x1,%rbp
   140124c8b:	mov    (%rdi,%rax,8),%rax
   140124c8f:	jmp    *%rax
   140124c91:	lea    0x8(%rbp),%rax
   140124c95:	mov    0x0(%rbp),%rdi
   140124c99:	mov    %rax,0x40(%rsp)
   140124c9e:	test   %r12b,%r12b
   140124ca1:	je     14012aff1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7581>
   140124ca7:	cmp    $0x1,%r12b
   140124cab:	je     14012ea30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafc0>
   140124cb1:	lea    0x8(%rsi),%r8
   140124cb5:	cmp    0x38(%rsp),%r8
   140124cba:	jae    140131e63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3f3>
   140124cc0:	vzeroupper
   140124cc3:	mov    0x1d0(%rsp),%rax
   140124ccb:	lea    0x680(%rsp),%rcx
   140124cd3:	mov    %rdi,%rdx
   140124cd6:	mov    %r8,0x60(%rsp)
   140124cdb:	mov    %rax,(%rsi)
   140124cde:	mov    0x1c8(%rsp),%rax
   140124ce6:	mov    %rax,0x1d0(%rsp)
   140124cee:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140124cf3:	mov    0x680(%rsp),%rax
   140124cfb:	mov    0x60(%rsp),%rsi
   140124d00:	mov    %rax,0x1c8(%rsp)
   140124d08:	cmpb   $0x0,0x1040(%rbx)
   140124d0f:	je     14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140124d15:	movzbl 0x8(%rbp),%eax
   140124d19:	lea    0x29b380(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124d20:	add    $0x9,%rbp
   140124d24:	mov    (%rdi,%rax,8),%rax
   140124d28:	jmp    *%rax
   140124d2a:	movzwl 0x0(%rbp),%eax
   140124d2e:	lea    0x2(%rbp),%rdi
   140124d32:	test   %r12b,%r12b
   140124d35:	je     14012a6ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c3b>
   140124d3b:	cmp    $0x1,%r12b
   140124d3f:	je     14012e762 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacf2>
   140124d45:	lea    0x8(%rsi),%r8
   140124d49:	cmp    0x38(%rsp),%r8
   140124d4e:	jae    140132561 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeaf1>
   140124d54:	mov    0x1d0(%rsp),%rdx
   140124d5c:	movzwl %ax,%eax
   140124d5f:	mov    %rdx,(%rsi)
   140124d62:	mov    0x1c8(%rsp),%rdx
   140124d6a:	mov    %r8,%rsi
   140124d6d:	mov    %rdx,0x1d0(%rsp)
   140124d75:	movabs $0xfff9000000000000,%rdx
   140124d7f:	or     %rdx,%rax
   140124d82:	mov    %rax,0x1c8(%rsp)
   140124d8a:	cmpb   $0x0,0x1040(%rbx)
   140124d91:	je     14012fa00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf90>
   140124d97:	movzbl 0x2(%rbp),%eax
   140124d9b:	lea    0x29b2fe(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124da2:	add    $0x3,%rbp
   140124da6:	mov    (%rdi,%rax,8),%rax
   140124daa:	jmp    *%rax
   140124dac:	lea    0x14(%rbp),%rax
   140124db0:	vmovdqu 0x0(%rbp),%xmm0
   140124db5:	mov    0x10(%rbp),%edi
   140124db8:	mov    %rax,0x40(%rsp)
   140124dbd:	test   %r12b,%r12b
   140124dc0:	je     14012b3d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7963>
   140124dc6:	cmp    $0x1,%r12b
   140124dca:	je     14012e98d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf1d>
   140124dd0:	lea    0x8(%rsi),%r8
   140124dd4:	cmp    0x38(%rsp),%r8
   140124dd9:	jae    14013202d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5bd>
   140124ddf:	vzeroupper
   140124de2:	mov    0x1d0(%rsp),%rax
   140124dea:	lea    0x1a0(%rsp),%rdx
   140124df2:	mov    %r8,0x60(%rsp)
   140124df7:	lea    0x540(%rsp),%rcx
   140124dff:	mov    %rax,(%rsi)
   140124e02:	mov    0x1c8(%rsp),%rax
   140124e0a:	mov    %edi,0x690(%rsp)
   140124e11:	mov    %rax,0x1d0(%rsp)
   140124e19:	movl   $0x0,0x694(%rsp)
   140124e24:	mov    0x690(%rsp),%rax
   140124e2c:	vmovdqa %xmm0,0x680(%rsp)
   140124e35:	mov    %rax,0x1b0(%rsp)
   140124e3d:	vmovdqa %xmm0,0x1a0(%rsp)
   140124e46:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140124e4b:	mov    0x540(%rsp),%rax
   140124e53:	mov    0x60(%rsp),%rsi
   140124e58:	mov    %rax,0x1c8(%rsp)
   140124e60:	cmpb   $0x0,0x1040(%rbx)
   140124e67:	je     14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   140124e6d:	movzbl 0x14(%rbp),%eax
   140124e71:	lea    0x29b228(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e78:	add    $0x15,%rbp
   140124e7c:	mov    (%rdi,%rax,8),%rax
   140124e80:	jmp    *%rax
   140124e82:	mov    0x0(%rbp),%rax
   140124e86:	lea    0x8(%rbp),%rdi
   140124e8a:	test   %r12b,%r12b
   140124e8d:	jne    14012a5b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b40>
   140124e93:	vmovq  %rax,%xmm0
   140124e98:	mov    $0x1,%r12d
   140124e9e:	movabs $0xfffc000000000000,%rdx
   140124ea8:	vucomisd %xmm0,%xmm0
   140124eac:	cmovp  %rdx,%rax
   140124eb0:	mov    %rax,0x1c8(%rsp)
   140124eb8:	cmpb   $0x0,0x1040(%rbx)
   140124ebf:	je     14012d2e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9872>
   140124ec5:	movzbl 0x8(%rbp),%eax
   140124ec9:	lea    0x29b1d0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124ed0:	add    $0x9,%rbp
   140124ed4:	mov    (%rdi,%rax,8),%rax
   140124ed8:	jmp    *%rax
   140124eda:	movzbl 0x0(%rbp),%eax
   140124ede:	lea    0x1(%rbp),%rdi
   140124ee2:	test   %r12b,%r12b
   140124ee5:	jne    14012a638 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bc8>
   140124eeb:	test   %al,%al
   140124eed:	mov    $0x1,%r12d
   140124ef3:	movabs $0xfffa000000000000,%rdx
   140124efd:	movabs $0xfffa000000000001,%rax
   140124f07:	cmovne %rax,%rdx
   140124f0b:	mov    %rdx,0x1c8(%rsp)
   140124f13:	cmpb   $0x0,0x1040(%rbx)
   140124f1a:	je     14012d2e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9872>
   140124f20:	movzbl 0x1(%rbp),%eax
   140124f24:	lea    0x29b175(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f2b:	add    $0x2,%rbp
   140124f2f:	mov    (%rdi,%rax,8),%rax
   140124f33:	jmp    *%rax
   140124f35:	cmp    $0x1,%r12b
   140124f39:	jne    14012ff14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4a4>
   140124f3f:	xor    %r12d,%r12d
   140124f42:	cmpb   $0x0,0x1040(%rbx)
   140124f49:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124f4f:	movzbl 0x0(%rbp),%eax
   140124f53:	lea    0x29b146(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124f5a:	add    $0x1,%rbp
   140124f5e:	mov    (%rdi,%rax,8),%rax
   140124f62:	jmp    *%rax
   140124f64:	test   %r12b,%r12b
   140124f67:	je     14012a603 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b93>
   140124f6d:	cmp    $0x1,%r12b
   140124f71:	je     14012e747 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacd7>
   140124f77:	lea    0x8(%rsi),%r8
   140124f7b:	cmp    0x38(%rsp),%r8
   140124f80:	jae    140132506 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea96>
   140124f86:	mov    0x1d0(%rsp),%rax
   140124f8e:	mov    %rax,(%rsi)
   140124f91:	mov    0x1c8(%rsp),%rax
   140124f99:	mov    %r8,%rsi
   140124f9c:	mov    %rax,0x1d0(%rsp)
   140124fa4:	cmpb   $0x0,0x1040(%rbx)
   140124fab:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140124fb1:	movzbl 0x0(%rbp),%eax
   140124fb5:	lea    0x29b0e4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124fbc:	add    $0x1,%rbp
   140124fc0:	mov    (%rdi,%rax,8),%rax
   140124fc4:	jmp    *%rax
   140124fc6:	movzwl 0x0(%rbp),%eax
   140124fca:	mov    0x1070(%rbx),%rdx
   140124fd1:	lea    0x2(%rbp),%rdi
   140124fd5:	sub    0x1068(%rbx),%rdx
   140124fdc:	add    %r13,%rax
   140124fdf:	sar    $0x3,%rdx
   140124fe3:	cmp    %rdx,%rax
   140124fe6:	jae    14012f730 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcc0>
   140124fec:	test   %r12b,%r12b
   140124fef:	je     14012a61a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6baa>
   140124ff5:	cmp    $0x1,%r12b
   140124ff9:	je     14012e719 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaca9>
   140124fff:	lea    0x8(%rsi),%r8
   140125003:	cmp    0x38(%rsp),%r8
   140125008:	jae    140132c56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1e6>
   14012500e:	mov    0x1d0(%rsp),%rdx
   140125016:	mov    %rdx,(%rsi)
   140125019:	mov    0x1c8(%rsp),%rdx
   140125021:	mov    %r8,%rsi
   140125024:	mov    %rdx,0x1d0(%rsp)
   14012502c:	mov    0x1068(%rbx),%rdx
   140125033:	mov    (%rdx,%rax,8),%rax
   140125037:	mov    %rax,0x1c8(%rsp)
   14012503f:	cmpb   $0x0,0x1040(%rbx)
   140125046:	je     14012d2e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9872>
   14012504c:	movzbl 0x2(%rbp),%eax
   140125050:	lea    0x29b049(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125057:	add    $0x3,%rbp
   14012505b:	mov    (%rdi,%rax,8),%rax
   14012505f:	jmp    *%rax
   140125061:	movzwl 0x0(%rbp),%edi
   140125065:	lea    0x2(%rbp),%r8
   140125069:	add    %r13,%rdi
   14012506c:	cmp    0x15268(%rbx),%rdi
   140125073:	jae    14012fa08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf98>
   140125079:	mov    0x1070(%rbx),%rax
   140125080:	sub    0x1068(%rbx),%rax
   140125087:	sar    $0x3,%rax
   14012508b:	cmp    %rax,%rdi
   14012508e:	jae    140130394 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc924>
   140125094:	lea    -0x8(%rsi),%rdx
   140125098:	lea    0x1c8(%rsp),%rax
   1401250a0:	test   %r12b,%r12b
   1401250a3:	cmove  %rdx,%rax
   1401250a7:	mov    0x1068(%rbx),%rdx
   1401250ae:	mov    (%rax),%rax
   1401250b1:	mov    %rax,(%rdx,%rdi,8)
   1401250b5:	cmpb   $0x0,0x1040(%rbx)
   1401250bc:	je     14012a4bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   1401250c2:	movzbl 0x2(%rbp),%eax
   1401250c6:	lea    0x29afd3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401250cd:	add    $0x3,%rbp
   1401250d1:	mov    (%rdi,%rax,8),%rax
   1401250d5:	jmp    *%rax
   1401250d7:	mov    0x1088(%rbx),%rdx
   1401250de:	movzwl 0x0(%rbp),%eax
   1401250e2:	lea    0x2(%rbp),%rdi
   1401250e6:	sub    0x1080(%rbx),%rdx
   1401250ed:	sar    $0x3,%rdx
   1401250f1:	cmp    %rdx,%rax
   1401250f4:	jae    140130049 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5d9>
   1401250fa:	test   %r12b,%r12b
   1401250fd:	je     14012a6c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c53>
   140125103:	cmp    $0x1,%r12b
   140125107:	je     14012e900 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae90>
   14012510d:	lea    0x8(%rsi),%r8
   140125111:	cmp    0x38(%rsp),%r8
   140125116:	jae    14013298d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef1d>
   14012511c:	mov    0x1d0(%rsp),%rdx
   140125124:	mov    %rdx,(%rsi)
   140125127:	mov    0x1c8(%rsp),%rdx
   14012512f:	mov    %r8,%rsi
   140125132:	mov    %rdx,0x1d0(%rsp)
   14012513a:	mov    0x1080(%rbx),%rdx
   140125141:	mov    (%rdx,%rax,8),%rax
   140125145:	mov    %rax,0x1c8(%rsp)
   14012514d:	cmpb   $0x0,0x1040(%rbx)
   140125154:	je     14012d2e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9872>
   14012515a:	movzbl 0x2(%rbp),%eax
   14012515e:	lea    0x29af3b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125165:	add    $0x3,%rbp
   140125169:	mov    (%rdi,%rax,8),%rax
   14012516d:	jmp    *%rax
   14012516f:	mov    0x1088(%rbx),%rax
   140125176:	movzwl 0x0(%rbp),%edi
   14012517a:	lea    0x2(%rbp),%r8
   14012517e:	sub    0x1080(%rbx),%rax
   140125185:	sar    $0x3,%rax
   140125189:	cmp    %rax,%rdi
   14012518c:	jae    140130027 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5b7>
   140125192:	lea    -0x8(%rsi),%rdx
   140125196:	lea    0x1c8(%rsp),%rax
   14012519e:	test   %r12b,%r12b
   1401251a1:	cmove  %rdx,%rax
   1401251a5:	mov    0x1080(%rbx),%rdx
   1401251ac:	mov    (%rax),%rax
   1401251af:	mov    %rax,(%rdx,%rdi,8)
   1401251b3:	cmpb   $0x0,0x1040(%rbx)
   1401251ba:	je     14012a4bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   1401251c0:	movzbl 0x2(%rbp),%eax
   1401251c4:	lea    0x29aed5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401251cb:	add    $0x3,%rbp
   1401251cf:	mov    (%rdi,%rax,8),%rax
   1401251d3:	jmp    *%rax
   1401251d5:	movabs $0xfffb000000000000,%rax
   1401251df:	mov    %rax,0x1d8(%rsp)
   1401251e7:	mov    %rax,0x1e0(%rsp)
   1401251ef:	cmp    $0x2,%r12b
   1401251f3:	jne    14013025d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7ed>
   1401251f9:	mov    0x1c8(%rsp),%rax
   140125201:	mov    $0x1,%r12d
   140125207:	mov    %rax,0x1e0(%rsp)
   14012520f:	mov    0x1d0(%rsp),%rax
   140125217:	mov    %rax,0x1d8(%rsp)
   14012521f:	mov    0x1d8(%rsp),%rax
   140125227:	movabs $0xffff000000000000,%rdx
   140125231:	movabs $0xfff8000000000000,%r8
   14012523b:	mov    %rax,%rcx
   14012523e:	and    %rdx,%rcx
   140125241:	cmp    %r8,%rcx
   140125244:	je     14012aab2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7042>
   14012524a:	lea    0x1e0(%rsp),%rdx
   140125252:	lea    0x1d8(%rsp),%rcx
   14012525a:	vzeroupper
   14012525d:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   140125262:	mov    %rax,0x1c8(%rsp)
   14012526a:	cmpb   $0x0,0x1040(%rbx)
   140125271:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125277:	movzbl 0x0(%rbp),%eax
   14012527b:	lea    0x29ae1e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125282:	add    $0x1,%rbp
   140125286:	mov    (%rdi,%rax,8),%rax
   14012528a:	jmp    *%rax
   14012528c:	movabs $0xfffb000000000000,%rax
   140125296:	mov    %rax,0x1e8(%rsp)
   14012529e:	mov    %rax,0x1f0(%rsp)
   1401252a6:	cmp    $0x2,%r12b
   1401252aa:	jne    140130528 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcab8>
   1401252b0:	mov    0x1c8(%rsp),%rax
   1401252b8:	mov    $0x1,%r12d
   1401252be:	mov    %rax,0x1f0(%rsp)
   1401252c6:	mov    0x1d0(%rsp),%rax
   1401252ce:	mov    %rax,0x1e8(%rsp)
   1401252d6:	mov    0x1e8(%rsp),%rax
   1401252de:	movabs $0xffff000000000000,%rdx
   1401252e8:	movabs $0xfff8000000000000,%r8
   1401252f2:	mov    %rax,%rcx
   1401252f5:	and    %rdx,%rcx
   1401252f8:	cmp    %r8,%rcx
   1401252fb:	je     14012b7e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d75>
   140125301:	lea    0x1f0(%rsp),%rdx
   140125309:	lea    0x1e8(%rsp),%rcx
   140125311:	vzeroupper
   140125314:	call   14021a7a0 <setun::VMValue::sub(setun::VMValue const&) const>
   140125319:	mov    %rax,0x1c8(%rsp)
   140125321:	cmpb   $0x0,0x1040(%rbx)
   140125328:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012532e:	movzbl 0x0(%rbp),%eax
   140125332:	lea    0x29ad67(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125339:	add    $0x1,%rbp
   14012533d:	mov    (%rdi,%rax,8),%rax
   140125341:	jmp    *%rax
   140125343:	movabs $0xfffb000000000000,%rax
   14012534d:	mov    %rax,0x1f8(%rsp)
   140125355:	mov    %rax,0x200(%rsp)
   14012535d:	cmp    $0x2,%r12b
   140125361:	jne    140130364 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8f4>
   140125367:	mov    0x1c8(%rsp),%rax
   14012536f:	mov    $0x1,%r12d
   140125375:	mov    %rax,0x200(%rsp)
   14012537d:	mov    0x1d0(%rsp),%rax
   140125385:	mov    %rax,0x1f8(%rsp)
   14012538d:	mov    0x1f8(%rsp),%rdx
   140125395:	movabs $0xffff000000000000,%rax
   14012539f:	movabs $0xfff8000000000000,%rcx
   1401253a9:	mov    %rdx,%r8
   1401253ac:	and    %rax,%r8
   1401253af:	cmp    %rcx,%r8
   1401253b2:	je     14012b733 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7cc3>
   1401253b8:	lea    0x200(%rsp),%rdx
   1401253c0:	lea    0x1f8(%rsp),%rcx
   1401253c8:	vzeroupper
   1401253cb:	call   140219f20 <setun::VMValue::mul(setun::VMValue const&) const>
   1401253d0:	mov    %rax,0x1c8(%rsp)
   1401253d8:	cmpb   $0x0,0x1040(%rbx)
   1401253df:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401253e5:	movzbl 0x0(%rbp),%eax
   1401253e9:	lea    0x29acb0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401253f0:	add    $0x1,%rbp
   1401253f4:	mov    (%rdi,%rax,8),%rax
   1401253f8:	jmp    *%rax
   1401253fa:	movabs $0xfffb000000000000,%rax
   140125404:	mov    %rax,0x208(%rsp)
   14012540c:	mov    %rax,0x210(%rsp)
   140125414:	cmp    $0x2,%r12b
   140125418:	jne    140130334 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8c4>
   14012541e:	mov    0x1c8(%rsp),%rax
   140125426:	mov    $0x1,%r12d
   14012542c:	mov    %rax,0x210(%rsp)
   140125434:	mov    0x1d0(%rsp),%rax
   14012543c:	mov    %rax,0x208(%rsp)
   140125444:	lea    0x210(%rsp),%rdx
   14012544c:	lea    0x208(%rsp),%rcx
   140125454:	vzeroupper
   140125457:	call   140219990 <setun::VMValue::div(setun::VMValue const&) const>
   14012545c:	mov    %rax,0x1c8(%rsp)
   140125464:	cmpb   $0x0,0x1040(%rbx)
   14012546b:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125471:	movzbl 0x0(%rbp),%eax
   140125475:	lea    0x29ac24(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012547c:	add    $0x1,%rbp
   140125480:	mov    (%rdi,%rax,8),%rax
   140125484:	jmp    *%rax
   140125486:	movabs $0xfffb000000000000,%rax
   140125490:	mov    %rax,0x218(%rsp)
   140125498:	mov    %rax,0x220(%rsp)
   1401254a0:	cmp    $0x2,%r12b
   1401254a4:	jne    14012f910 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbea0>
   1401254aa:	mov    0x1c8(%rsp),%rax
   1401254b2:	mov    $0x1,%r12d
   1401254b8:	mov    %rax,0x220(%rsp)
   1401254c0:	mov    0x1d0(%rsp),%rax
   1401254c8:	mov    %rax,0x218(%rsp)
   1401254d0:	lea    0x220(%rsp),%rdx
   1401254d8:	lea    0x218(%rsp),%rcx
   1401254e0:	vzeroupper
   1401254e3:	call   140219d80 <setun::VMValue::mod(setun::VMValue const&) const>
   1401254e8:	mov    %rax,0x1c8(%rsp)
   1401254f0:	cmpb   $0x0,0x1040(%rbx)
   1401254f7:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401254fd:	movzbl 0x0(%rbp),%eax
   140125501:	lea    0x29ab98(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125508:	add    $0x1,%rbp
   14012550c:	mov    (%rdi,%rax,8),%rax
   140125510:	jmp    *%rax
   140125512:	movabs $0xfffb000000000000,%rax
   14012551c:	mov    %rax,0x228(%rsp)
   140125524:	mov    %rax,0x230(%rsp)
   14012552c:	cmp    $0x2,%r12b
   140125530:	jne    14012f8e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe70>
   140125536:	mov    0x1c8(%rsp),%rax
   14012553e:	mov    $0x1,%r12d
   140125544:	mov    %rax,0x230(%rsp)
   14012554c:	mov    0x1d0(%rsp),%rax
   140125554:	mov    %rax,0x228(%rsp)
   14012555c:	lea    0x230(%rsp),%rdx
   140125564:	lea    0x228(%rsp),%rcx
   14012556c:	vzeroupper
   14012556f:	call   14021b450 <setun::VMValue::bit_and(setun::VMValue const&) const>
   140125574:	mov    %rax,0x1c8(%rsp)
   14012557c:	cmpb   $0x0,0x1040(%rbx)
   140125583:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125589:	movzbl 0x0(%rbp),%eax
   14012558d:	lea    0x29ab0c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125594:	add    $0x1,%rbp
   140125598:	mov    (%rdi,%rax,8),%rax
   14012559c:	jmp    *%rax
   14012559e:	movabs $0xfffb000000000000,%rax
   1401255a8:	mov    %rax,0x238(%rsp)
   1401255b0:	mov    %rax,0x240(%rsp)
   1401255b8:	cmp    $0x2,%r12b
   1401255bc:	jne    14012f940 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   1401255c2:	mov    0x1c8(%rsp),%rax
   1401255ca:	mov    $0x1,%r12d
   1401255d0:	mov    %rax,0x240(%rsp)
   1401255d8:	mov    0x1d0(%rsp),%rax
   1401255e0:	mov    %rax,0x238(%rsp)
   1401255e8:	lea    0x240(%rsp),%rdx
   1401255f0:	lea    0x238(%rsp),%rcx
   1401255f8:	vzeroupper
   1401255fb:	call   14021ac20 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140125600:	mov    %rax,0x1c8(%rsp)
   140125608:	cmpb   $0x0,0x1040(%rbx)
   14012560f:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125615:	movzbl 0x0(%rbp),%eax
   140125619:	lea    0x29aa80(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125620:	add    $0x1,%rbp
   140125624:	mov    (%rdi,%rax,8),%rax
   140125628:	jmp    *%rax
   14012562a:	movabs $0xfffb000000000000,%rax
   140125634:	mov    %rax,0x248(%rsp)
   14012563c:	mov    %rax,0x250(%rsp)
   140125644:	cmp    $0x2,%r12b
   140125648:	jne    14012f7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd73>
   14012564e:	mov    0x1c8(%rsp),%rax
   140125656:	mov    $0x1,%r12d
   14012565c:	mov    %rax,0x250(%rsp)
   140125664:	mov    0x1d0(%rsp),%rax
   14012566c:	mov    %rax,0x248(%rsp)
   140125674:	lea    0x250(%rsp),%rdx
   14012567c:	lea    0x248(%rsp),%rcx
   140125684:	vzeroupper
   140125687:	call   14021b950 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   14012568c:	mov    %rax,0x1c8(%rsp)
   140125694:	cmpb   $0x0,0x1040(%rbx)
   14012569b:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401256a1:	movzbl 0x0(%rbp),%eax
   1401256a5:	lea    0x29a9f4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401256ac:	add    $0x1,%rbp
   1401256b0:	mov    (%rdi,%rax,8),%rax
   1401256b4:	jmp    *%rax
   1401256b6:	movabs $0xfffb000000000000,%rax
   1401256c0:	mov    %rax,0x258(%rsp)
   1401256c8:	mov    %rax,0x260(%rsp)
   1401256d0:	cmp    $0x2,%r12b
   1401256d4:	jne    14012f875 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe05>
   1401256da:	mov    0x1c8(%rsp),%rax
   1401256e2:	mov    $0x1,%r12d
   1401256e8:	mov    %rax,0x260(%rsp)
   1401256f0:	mov    0x1d0(%rsp),%rax
   1401256f8:	mov    %rax,0x258(%rsp)
   140125700:	lea    0x260(%rsp),%rdx
   140125708:	lea    0x258(%rsp),%rcx
   140125710:	vzeroupper
   140125713:	call   14021a350 <setun::VMValue::shl(setun::VMValue const&) const>
   140125718:	mov    %rax,0x1c8(%rsp)
   140125720:	cmpb   $0x0,0x1040(%rbx)
   140125727:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012572d:	movzbl 0x0(%rbp),%eax
   140125731:	lea    0x29a968(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125738:	add    $0x1,%rbp
   14012573c:	mov    (%rdi,%rax,8),%rax
   140125740:	jmp    *%rax
   140125742:	movabs $0xfffb000000000000,%rax
   14012574c:	mov    %rax,0x268(%rsp)
   140125754:	mov    %rax,0x270(%rsp)
   14012575c:	cmp    $0x2,%r12b
   140125760:	jne    14012f845 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdd5>
   140125766:	mov    0x1c8(%rsp),%rax
   14012576e:	mov    $0x1,%r12d
   140125774:	mov    %rax,0x270(%rsp)
   14012577c:	mov    0x1d0(%rsp),%rax
   140125784:	mov    %rax,0x268(%rsp)
   14012578c:	lea    0x270(%rsp),%rdx
   140125794:	lea    0x268(%rsp),%rcx
   14012579c:	vzeroupper
   14012579f:	call   14021a570 <setun::VMValue::shr(setun::VMValue const&) const>
   1401257a4:	mov    %rax,0x1c8(%rsp)
   1401257ac:	cmpb   $0x0,0x1040(%rbx)
   1401257b3:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401257b9:	movzbl 0x0(%rbp),%eax
   1401257bd:	lea    0x29a8dc(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401257c4:	add    $0x1,%rbp
   1401257c8:	mov    (%rdi,%rax,8),%rax
   1401257cc:	jmp    *%rax
   1401257ce:	test   %r12b,%r12b
   1401257d1:	jne    14012a68e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c1e>
   1401257d7:	sub    $0x8,%rsi
   1401257db:	mov    $0x1,%r12d
   1401257e1:	mov    %rsi,%rcx
   1401257e4:	vzeroupper
   1401257e7:	call   14021a210 <setun::VMValue::neg() const>
   1401257ec:	mov    %rax,0x1c8(%rsp)
   1401257f4:	cmpb   $0x0,0x1040(%rbx)
   1401257fb:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   140125801:	movzbl 0x0(%rbp),%eax
   140125805:	lea    0x29a894(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012580c:	add    $0x1,%rbp
   140125810:	mov    (%rdi,%rax,8),%rax
   140125814:	jmp    *%rax
   140125816:	movabs $0xfffb000000000000,%rax
   140125820:	mov    %rax,0x278(%rsp)
   140125828:	mov    %rax,0x280(%rsp)
   140125830:	cmp    $0x2,%r12b
   140125834:	jne    14012f752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbce2>
   14012583a:	mov    0x1c8(%rsp),%rax
   140125842:	mov    $0x1,%r12d
   140125848:	mov    %rax,0x280(%rsp)
   140125850:	mov    0x1d0(%rsp),%rax
   140125858:	mov    %rax,0x278(%rsp)
   140125860:	mov    0x278(%rsp),%rcx
   140125868:	movabs $0xffffffff00000000,%rax
   140125872:	movabs $0xfffd000100000000,%rdx
   14012587c:	and    %rax,%rcx
   14012587f:	cmp    %rdx,%rcx
   140125882:	je     14012c978 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f08>
   140125888:	and    0x280(%rsp),%rax
   140125890:	cmp    %rdx,%rax
   140125893:	je     14012c978 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f08>
   140125899:	lea    0x278(%rsp),%rcx
   1401258a1:	vzeroupper
   1401258a4:	call   14021aa80 <setun::VMValue::as_int() const>
   1401258a9:	lea    0x280(%rsp),%rcx
   1401258b1:	mov    %rax,%rdi
   1401258b4:	call   14021aa80 <setun::VMValue::as_int() const>
   1401258b9:	mov    0x278(%rsp),%rcx
   1401258c1:	movabs $0xffff000000000000,%rdx
   1401258cb:	movabs $0xfffa000000000000,%r8
   1401258d5:	and    %rdx,%rcx
   1401258d8:	cmp    %r8,%rcx
   1401258db:	jne    1401258ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e7e>
   1401258dd:	and    0x280(%rsp),%rdx
   1401258e5:	cmp    %rcx,%rdx
   1401258e8:	je     14012ea04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf94>
   1401258ee:	cmp    %rax,%rdi
   1401258f1:	lea    0x680(%rsp),%rcx
   1401258f9:	cmovle %rdi,%rax
   1401258fd:	mov    %rax,%rdx
   140125900:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140125905:	mov    0x680(%rsp),%rax
   14012590d:	mov    %rax,0x1c8(%rsp)
   140125915:	cmpb   $0x0,0x1040(%rbx)
   14012591c:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125922:	movzbl 0x0(%rbp),%eax
   140125926:	lea    0x29a773(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012592d:	add    $0x1,%rbp
   140125931:	mov    (%rdi,%rax,8),%rax
   140125935:	jmp    *%rax
   140125937:	movabs $0xfffb000000000000,%rax
   140125941:	mov    %rax,0x288(%rsp)
   140125949:	mov    %rax,0x290(%rsp)
   140125951:	cmp    $0x2,%r12b
   140125955:	jne    140130131 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6c1>
   14012595b:	mov    0x1c8(%rsp),%rax
   140125963:	mov    $0x1,%r12d
   140125969:	mov    %rax,0x290(%rsp)
   140125971:	mov    0x1d0(%rsp),%rax
   140125979:	mov    %rax,0x288(%rsp)
   140125981:	mov    0x288(%rsp),%rcx
   140125989:	movabs $0xffffffff00000000,%rax
   140125993:	movabs $0xfffd000100000000,%rdx
   14012599d:	and    %rax,%rcx
   1401259a0:	cmp    %rdx,%rcx
   1401259a3:	je     14012c9dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f6c>
   1401259a9:	and    0x290(%rsp),%rax
   1401259b1:	cmp    %rdx,%rax
   1401259b4:	je     14012c9dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f6c>
   1401259ba:	lea    0x288(%rsp),%rcx
   1401259c2:	vzeroupper
   1401259c5:	call   14021aa80 <setun::VMValue::as_int() const>
   1401259ca:	lea    0x290(%rsp),%rcx
   1401259d2:	mov    %rax,%rdi
   1401259d5:	call   14021aa80 <setun::VMValue::as_int() const>
   1401259da:	mov    0x288(%rsp),%rcx
   1401259e2:	movabs $0xffff000000000000,%rdx
   1401259ec:	movabs $0xfffa000000000000,%r8
   1401259f6:	and    %rdx,%rcx
   1401259f9:	cmp    %r8,%rcx
   1401259fc:	jne    140125a0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f9f>
   1401259fe:	and    0x290(%rsp),%rdx
   140125a06:	cmp    %rcx,%rdx
   140125a09:	je     14012e961 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaef1>
   140125a0f:	cmp    %rax,%rdi
   140125a12:	lea    0x680(%rsp),%rcx
   140125a1a:	cmovge %rdi,%rax
   140125a1e:	mov    %rax,%rdx
   140125a21:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140125a26:	mov    0x680(%rsp),%rax
   140125a2e:	mov    %rax,0x1c8(%rsp)
   140125a36:	cmpb   $0x0,0x1040(%rbx)
   140125a3d:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125a43:	movzbl 0x0(%rbp),%eax
   140125a47:	lea    0x29a652(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a4e:	add    $0x1,%rbp
   140125a52:	mov    (%rdi,%rax,8),%rax
   140125a56:	jmp    *%rax
   140125a58:	movabs $0xfffb000000000000,%rax
   140125a62:	mov    %rax,0x298(%rsp)
   140125a6a:	mov    %rax,0x2a0(%rsp)
   140125a72:	cmp    $0x2,%r12b
   140125a76:	jne    14012fa95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc025>
   140125a7c:	mov    0x1c8(%rsp),%rax
   140125a84:	mov    $0x1,%r12d
   140125a8a:	mov    %rax,0x2a0(%rsp)
   140125a92:	mov    0x1d0(%rsp),%rax
   140125a9a:	mov    %rax,0x298(%rsp)
   140125aa2:	mov    %rax,%rcx
   140125aa5:	movabs $0xffff000000000000,%rax
   140125aaf:	mov    %rcx,%r8
   140125ab2:	movabs $0xfff8000000000000,%r9
   140125abc:	mov    0x2a0(%rsp),%rdx
   140125ac4:	and    %rax,%r8
   140125ac7:	cmp    %r9,%r8
   140125aca:	je     14012b2f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7883>
   140125ad0:	movabs $0xfffd000000000000,%r10
   140125ada:	cmp    %r10,%r8
   140125add:	je     14012e4c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa58>
   140125ae3:	movabs $0xfffc000000000000,%r8
   140125aed:	cmp    %r8,%rcx
   140125af0:	je     14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140125af6:	movabs $0xfff7ffffffffffff,%r9
   140125b00:	cmp    %rcx,%r9
   140125b03:	jae    14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140125b09:	cmp    %r8,%rdx
   140125b0c:	je     14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140125b12:	cmp    %rdx,%r9
   140125b15:	jae    14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   140125b1b:	and    %rdx,%rax
   140125b1e:	cmp    %r10,%rax
   140125b21:	je     14013110d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd69d>
   140125b27:	lea    0x298(%rsp),%rcx
   140125b2f:	vzeroupper
   140125b32:	call   14021aa80 <setun::VMValue::as_int() const>
   140125b37:	lea    0x2a0(%rsp),%rcx
   140125b3f:	mov    %rax,%rdi
   140125b42:	call   14021aa80 <setun::VMValue::as_int() const>
   140125b47:	cmp    %rax,%rdi
   140125b4a:	sete   %dil
   140125b4e:	movabs $0xfffa000000000000,%rdx
   140125b58:	movzbl %dil,%eax
   140125b5c:	add    %rdx,%rax
   140125b5f:	mov    %rax,0x1c8(%rsp)
   140125b67:	cmpb   $0x0,0x1040(%rbx)
   140125b6e:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125b74:	movzbl 0x0(%rbp),%eax
   140125b78:	lea    0x29a521(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125b7f:	add    $0x1,%rbp
   140125b83:	mov    (%rdi,%rax,8),%rax
   140125b87:	jmp    *%rax
   140125b89:	movabs $0xfffb000000000000,%rax
   140125b93:	mov    %rax,0x2a8(%rsp)
   140125b9b:	mov    %rax,0x2b0(%rsp)
   140125ba3:	cmp    $0x2,%r12b
   140125ba7:	jne    14013022a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc7ba>
   140125bad:	mov    0x1c8(%rsp),%rax
   140125bb5:	mov    $0x1,%r12d
   140125bbb:	mov    %rax,0x2b0(%rsp)
   140125bc3:	mov    0x1d0(%rsp),%rax
   140125bcb:	mov    %rax,0x2a8(%rsp)
   140125bd3:	mov    %rax,%rdx
   140125bd6:	movabs $0xffff000000000000,%rcx
   140125be0:	mov    %rdx,%rax
   140125be3:	movabs $0xfff8000000000000,%r8
   140125bed:	and    %rcx,%rax
   140125bf0:	cmp    %r8,%rax
   140125bf3:	je     14012a721 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cb1>
   140125bf9:	movabs $0xfffd000000000000,%r8
   140125c03:	cmp    %r8,%rax
   140125c06:	je     14012a714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ca4>
   140125c0c:	movabs $0xfffc000000000000,%r9
   140125c16:	cmp    %r9,%rdx
   140125c19:	je     14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   140125c1f:	movabs $0xfff7ffffffffffff,%r10
   140125c29:	cmp    %rdx,%r10
   140125c2c:	jae    14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   140125c32:	mov    0x2b0(%rsp),%rax
   140125c3a:	cmp    %r9,%rax
   140125c3d:	je     14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   140125c43:	cmp    %rax,%r10
   140125c46:	jae    14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   140125c4c:	and    %rax,%rcx
   140125c4f:	cmp    %r8,%rcx
   140125c52:	je     1401311e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd772>
   140125c58:	lea    0x2a8(%rsp),%rcx
   140125c60:	vzeroupper
   140125c63:	call   14021aa80 <setun::VMValue::as_int() const>
   140125c68:	lea    0x2b0(%rsp),%rcx
   140125c70:	mov    %rax,%rdi
   140125c73:	call   14021aa80 <setun::VMValue::as_int() const>
   140125c78:	cmp    %rax,%rdi
   140125c7b:	setne  %al
   140125c7e:	movabs $0xfffa000000000000,%rdx
   140125c88:	movzbl %al,%eax
   140125c8b:	add    %rdx,%rax
   140125c8e:	mov    %rax,0x1c8(%rsp)
   140125c96:	cmpb   $0x0,0x1040(%rbx)
   140125c9d:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125ca3:	movzbl 0x0(%rbp),%eax
   140125ca7:	lea    0x29a3f2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125cae:	add    $0x1,%rbp
   140125cb2:	mov    (%rdi,%rax,8),%rax
   140125cb6:	jmp    *%rax
   140125cb8:	movabs $0xfffb000000000000,%rax
   140125cc2:	mov    %rax,0x2b8(%rsp)
   140125cca:	mov    %rax,0x2c0(%rsp)
   140125cd2:	cmp    $0x2,%r12b
   140125cd6:	jne    1401303b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc946>
   140125cdc:	mov    0x1c8(%rsp),%rax
   140125ce4:	mov    $0x1,%r12d
   140125cea:	mov    %rax,0x2c0(%rsp)
   140125cf2:	mov    0x1d0(%rsp),%rax
   140125cfa:	mov    %rax,0x2b8(%rsp)
   140125d02:	mov    %rax,%rcx
   140125d05:	movabs $0xffff000000000000,%rdx
   140125d0f:	mov    %rcx,%r8
   140125d12:	movabs $0xfff8000000000000,%r9
   140125d1c:	mov    0x2c0(%rsp),%rax
   140125d24:	and    %rdx,%r8
   140125d27:	cmp    %r9,%r8
   140125d2a:	je     14012ac62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71f2>
   140125d30:	movabs $0xfffd000000000000,%r10
   140125d3a:	cmp    %r10,%r8
   140125d3d:	je     14012e550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaae0>
   140125d43:	movabs $0xfffc000000000000,%r8
   140125d4d:	cmp    %r8,%rcx
   140125d50:	je     14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   140125d56:	movabs $0xfff7ffffffffffff,%r9
   140125d60:	cmp    %rcx,%r9
   140125d63:	jae    14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   140125d69:	cmp    %r8,%rax
   140125d6c:	je     14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   140125d72:	cmp    %rax,%r9
   140125d75:	jae    14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   140125d7b:	and    %rax,%rdx
   140125d7e:	cmp    %r10,%rdx
   140125d81:	je     140131373 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd903>
   140125d87:	lea    0x2b8(%rsp),%rcx
   140125d8f:	vzeroupper
   140125d92:	call   14021aa80 <setun::VMValue::as_int() const>
   140125d97:	lea    0x2c0(%rsp),%rcx
   140125d9f:	mov    %rax,%rdi
   140125da2:	call   14021aa80 <setun::VMValue::as_int() const>
   140125da7:	cmp    %rax,%rdi
   140125daa:	setl   %al
   140125dad:	movabs $0xfffa000000000000,%rdx
   140125db7:	movzbl %al,%eax
   140125dba:	add    %rdx,%rax
   140125dbd:	mov    %rax,0x1c8(%rsp)
   140125dc5:	cmpb   $0x0,0x1040(%rbx)
   140125dcc:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125dd2:	movzbl 0x0(%rbp),%eax
   140125dd6:	lea    0x29a2c3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125ddd:	add    $0x1,%rbp
   140125de1:	mov    (%rdi,%rax,8),%rax
   140125de5:	jmp    *%rax
   140125de7:	movabs $0xfffb000000000000,%rax
   140125df1:	mov    %rax,0x2c8(%rsp)
   140125df9:	mov    %rax,0x2d0(%rsp)
   140125e01:	cmp    $0x2,%r12b
   140125e05:	jne    1401301f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc787>
   140125e0b:	mov    0x1c8(%rsp),%rax
   140125e13:	mov    $0x1,%r12d
   140125e19:	mov    %rax,0x2d0(%rsp)
   140125e21:	mov    0x1d0(%rsp),%rax
   140125e29:	mov    %rax,0x2c8(%rsp)
   140125e31:	mov    %rax,%rcx
   140125e34:	movabs $0xffff000000000000,%rdx
   140125e3e:	mov    %rcx,%r8
   140125e41:	movabs $0xfff8000000000000,%r9
   140125e4b:	mov    0x2d0(%rsp),%rax
   140125e53:	and    %rdx,%r8
   140125e56:	cmp    %r9,%r8
   140125e59:	je     14012bb61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80f1>
   140125e5f:	movabs $0xfffd000000000000,%r10
   140125e69:	cmp    %r10,%r8
   140125e6c:	je     14012e3a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa935>
   140125e72:	movabs $0xfff7ffffffffffff,%r8
   140125e7c:	cmp    %rcx,%r8
   140125e7f:	jae    14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   140125e85:	movabs $0xfffc000000000000,%r9
   140125e8f:	cmp    %r9,%rcx
   140125e92:	je     14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   140125e98:	cmp    %r9,%rax
   140125e9b:	je     14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   140125ea1:	cmp    %rax,%r8
   140125ea4:	jae    14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   140125eaa:	and    %rax,%rdx
   140125ead:	cmp    %r10,%rdx
   140125eb0:	je     140131295 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd825>
   140125eb6:	lea    0x2c8(%rsp),%rcx
   140125ebe:	vzeroupper
   140125ec1:	call   14021aa80 <setun::VMValue::as_int() const>
   140125ec6:	lea    0x2d0(%rsp),%rcx
   140125ece:	mov    %rax,%rdi
   140125ed1:	call   14021aa80 <setun::VMValue::as_int() const>
   140125ed6:	cmp    %rax,%rdi
   140125ed9:	setle  %al
   140125edc:	movabs $0xfffa000000000000,%rdx
   140125ee6:	movzbl %al,%eax
   140125ee9:	add    %rdx,%rax
   140125eec:	mov    %rax,0x1c8(%rsp)
   140125ef4:	cmpb   $0x0,0x1040(%rbx)
   140125efb:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140125f01:	movzbl 0x0(%rbp),%eax
   140125f05:	lea    0x29a194(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125f0c:	add    $0x1,%rbp
   140125f10:	mov    (%rdi,%rax,8),%rax
   140125f14:	jmp    *%rax
   140125f16:	movabs $0xfffb000000000000,%rax
   140125f20:	mov    %rax,0x2d8(%rsp)
   140125f28:	mov    %rax,0x2e0(%rsp)
   140125f30:	cmp    $0x2,%r12b
   140125f34:	jne    1401302ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc84a>
   140125f3a:	mov    0x1c8(%rsp),%rax
   140125f42:	mov    $0x1,%r12d
   140125f48:	mov    %rax,0x2e0(%rsp)
   140125f50:	mov    0x1d0(%rsp),%rax
   140125f58:	mov    %rax,0x2d8(%rsp)
   140125f60:	mov    %rax,%rcx
   140125f63:	movabs $0xffff000000000000,%rdx
   140125f6d:	mov    %rcx,%r8
   140125f70:	movabs $0xfff8000000000000,%r9
   140125f7a:	mov    0x2e0(%rsp),%rax
   140125f82:	and    %rdx,%r8
   140125f85:	cmp    %r9,%r8
   140125f88:	je     14012b560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7af0>
   140125f8e:	movabs $0xfffd000000000000,%r10
   140125f98:	cmp    %r10,%r8
   140125f9b:	je     14012e5d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab60>
   140125fa1:	movabs $0xfffc000000000000,%r8
   140125fab:	cmp    %r8,%rcx
   140125fae:	je     14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   140125fb4:	movabs $0xfff7ffffffffffff,%r9
   140125fbe:	cmp    %rcx,%r9
   140125fc1:	jae    14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   140125fc7:	cmp    %rax,%r9
   140125fca:	jae    14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   140125fd0:	cmp    %r8,%rax
   140125fd3:	je     14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   140125fd9:	and    %rax,%rdx
   140125fdc:	cmp    %r10,%rdx
   140125fdf:	je     14013187a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde0a>
   140125fe5:	lea    0x2d8(%rsp),%rcx
   140125fed:	vzeroupper
   140125ff0:	call   14021aa80 <setun::VMValue::as_int() const>
   140125ff5:	lea    0x2e0(%rsp),%rcx
   140125ffd:	mov    %rax,%rdi
   140126000:	call   14021aa80 <setun::VMValue::as_int() const>
   140126005:	cmp    %rax,%rdi
   140126008:	setg   %al
   14012600b:	movabs $0xfffa000000000000,%rdx
   140126015:	movzbl %al,%eax
   140126018:	add    %rdx,%rax
   14012601b:	mov    %rax,0x1c8(%rsp)
   140126023:	cmpb   $0x0,0x1040(%rbx)
   14012602a:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140126030:	movzbl 0x0(%rbp),%eax
   140126034:	lea    0x29a065(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012603b:	add    $0x1,%rbp
   14012603f:	mov    (%rdi,%rax,8),%rax
   140126043:	jmp    *%rax
   140126045:	movabs $0xfffb000000000000,%rax
   14012604f:	mov    %rax,0x2e8(%rsp)
   140126057:	mov    %rax,0x2f0(%rsp)
   14012605f:	cmp    $0x2,%r12b
   140126063:	jne    14012fcd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc265>
   140126069:	mov    0x1c8(%rsp),%rax
   140126071:	mov    $0x1,%r12d
   140126077:	mov    %rax,0x2f0(%rsp)
   14012607f:	mov    0x1d0(%rsp),%rax
   140126087:	mov    %rax,0x2e8(%rsp)
   14012608f:	mov    %rax,%rcx
   140126092:	movabs $0xffff000000000000,%rdx
   14012609c:	mov    %rcx,%r8
   14012609f:	movabs $0xfff8000000000000,%r9
   1401260a9:	mov    0x2f0(%rsp),%rax
   1401260b1:	and    %rdx,%r8
   1401260b4:	cmp    %r9,%r8
   1401260b7:	je     14012b214 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77a4>
   1401260bd:	movabs $0xfffd000000000000,%r10
   1401260c7:	cmp    %r10,%r8
   1401260ca:	je     14012e441 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9d1>
   1401260d0:	movabs $0xfffc000000000000,%r8
   1401260da:	cmp    %r8,%rcx
   1401260dd:	je     14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   1401260e3:	movabs $0xfff7ffffffffffff,%r9
   1401260ed:	cmp    %rcx,%r9
   1401260f0:	jae    14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   1401260f6:	cmp    %rax,%r9
   1401260f9:	jae    14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   1401260ff:	cmp    %r8,%rax
   140126102:	je     14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   140126108:	and    %rax,%rdx
   14012610b:	cmp    %r10,%rdx
   14012610e:	je     140131050 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5e0>
   140126114:	lea    0x2e8(%rsp),%rcx
   14012611c:	vzeroupper
   14012611f:	call   14021aa80 <setun::VMValue::as_int() const>
   140126124:	lea    0x2f0(%rsp),%rcx
   14012612c:	mov    %rax,%rdi
   14012612f:	call   14021aa80 <setun::VMValue::as_int() const>
   140126134:	cmp    %rax,%rdi
   140126137:	setge  %al
   14012613a:	movabs $0xfffa000000000000,%rdx
   140126144:	movzbl %al,%eax
   140126147:	add    %rdx,%rax
   14012614a:	mov    %rax,0x1c8(%rsp)
   140126152:	cmpb   $0x0,0x1040(%rbx)
   140126159:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012615f:	movzbl 0x0(%rbp),%eax
   140126163:	lea    0x299f36(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012616a:	add    $0x1,%rbp
   14012616e:	mov    (%rdi,%rax,8),%rax
   140126172:	jmp    *%rax
   140126174:	movzwl 0x0(%rbp),%edi
   140126178:	test   %di,%di
   14012617b:	js     140130700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc90>
   140126181:	movswl %di,%eax
   140126184:	add    $0x2,%eax
   140126187:	cltq
   140126189:	add    %rbp,%rax
   14012618c:	cmpb   $0x0,0x1040(%rbx)
   140126193:	je     140130453 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9e3>
   140126199:	lea    0x1(%rax),%rbp
   14012619d:	movzbl (%rax),%eax
   1401261a0:	lea    0x299ef9(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401261a7:	jmp    *(%rdi,%rax,8)
   1401261aa:	movzwl 0x0(%rbp),%eax
   1401261ae:	lea    0x2(%rbp),%rdi
   1401261b2:	mov    %ax,0x40(%rsp)
   1401261b7:	movabs $0xfffb000000000000,%rax
   1401261c1:	mov    %rax,0x2f8(%rsp)
   1401261c9:	cmp    $0x1,%r12b
   1401261cd:	jne    1401309b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf46>
   1401261d3:	mov    0x1c8(%rsp),%rax
   1401261db:	xor    %r12d,%r12d
   1401261de:	mov    %rax,0x2f8(%rsp)
   1401261e6:	lea    0x2f8(%rsp),%rcx
   1401261ee:	vzeroupper
   1401261f1:	call   14021b110 <setun::VMValue::as_bool() const>
   1401261f6:	mov    %eax,%ecx
   1401261f8:	movswq 0x40(%rsp),%rax
   1401261fe:	add    %rdi,%rax
   140126201:	test   %cl,%cl
   140126203:	cmove  %rax,%rdi
   140126207:	cmpb   $0x0,0x1040(%rbx)
   14012620e:	je     14012e6c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac56>
   140126214:	movzbl (%rdi),%eax
   140126217:	lea    0x1(%rdi),%rbp
   14012621b:	lea    0x299e7e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126222:	jmp    *(%rdi,%rax,8)
   140126225:	movzwl 0x2(%rbp),%eax
   140126229:	movzwl 0x0(%rbp),%edi
   14012622d:	add    $0x6,%rbp
   140126231:	mov    %ax,0x40(%rsp)
   140126236:	movzwl -0x2(%rbp),%eax
   14012623a:	mov    %ax,0x60(%rsp)
   14012623f:	movabs $0xfffb000000000000,%rax
   140126249:	mov    %rax,0x300(%rsp)
   140126251:	cmp    $0x1,%r12b
   140126255:	jne    1401300c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc658>
   14012625b:	mov    0x1c8(%rsp),%rax
   140126263:	xor    %r12d,%r12d
   140126266:	mov    %rax,0x300(%rsp)
   14012626e:	mov    0x300(%rsp),%rdx
   140126276:	movabs $0xffff000000000000,%rax
   140126280:	movabs $0xfffd000000000000,%rcx
   14012628a:	and    %rdx,%rax
   14012628d:	cmp    %rcx,%rax
   140126290:	je     14012bdec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x837c>
   140126296:	movabs $0xfffc000000000000,%rax
   1401262a0:	cmp    %rax,%rdx
   1401262a3:	je     1401262b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2848>
   1401262a5:	movabs $0xfff7ffffffffffff,%rax
   1401262af:	cmp    %rdx,%rax
   1401262b2:	jb     14012bdfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x838a>
   1401262b8:	lea    0x300(%rsp),%rcx
   1401262c0:	vzeroupper
   1401262c3:	call   14021c1d0 <setun::VMValue::as_float() const>
   1401262c8:	vmovsd 0x236850(%rip),%xmm1        # 14035cb20 <CSWTCH.3092+0x220>
   1401262d0:	vcomisd %xmm0,%xmm1
   1401262d4:	ja     14012c96a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8efa>
   1401262da:	vcomisd 0x236846(%rip),%xmm0        # 14035cb28 <CSWTCH.3092+0x228>
   1401262e2:	ja     14012be19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83a9>
   1401262e8:	movswq 0x40(%rsp),%rax
   1401262ee:	lea    -0x2(%rbp,%rax,1),%rax
   1401262f3:	cmpb   $0x0,0x1040(%rbx)
   1401262fa:	je     140130161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6f1>
   140126300:	lea    0x1(%rax),%rbp
   140126304:	movzbl (%rax),%eax
   140126307:	lea    0x299d92(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012630e:	jmp    *(%rdi,%rax,8)
   140126311:	mov    0x88(%r14),%rdx
   140126318:	mov    0x80(%r14),%rcx
   14012631f:	lea    0x2(%rbp),%rdi
   140126323:	movzwl 0x0(%rbp),%eax
   140126327:	cmp    %rcx,%rdx
   14012632a:	je     14012c6ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c5a>
   140126330:	sub    %rcx,%rdx
   140126333:	sar    $0x2,%rdx
   140126337:	cmp    %rdx,%rax
   14012633a:	jae    140131d5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2ea>
   140126340:	mov    (%rcx,%rax,4),%edi
   140126343:	mov    %edi,0x80(%rsp)
   14012634a:	movzbl 0x2(%rbp),%ecx
   14012634e:	lea    0x3(%rbp),%rdi
   140126352:	mov    0xa0(%r14),%rdx
   140126359:	mov    $0x20,%r8d
   14012635f:	mov    %rdi,0x60(%rsp)
   140126364:	mov    %rcx,0x40(%rsp)
   140126369:	mov    %rcx,%rdi
   14012636c:	mov    0x98(%r14),%rcx
   140126373:	sub    %rcx,%rdx
   140126376:	sar    $1,%rdx
   140126379:	cmp    %rdx,%rax
   14012637c:	jae    140126389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2919>
   14012637e:	movzwl (%rcx,%rax,2),%ecx
   140126382:	test   %cx,%cx
   140126385:	cmovne %rcx,%r8
   140126389:	movzbl %dil,%ecx
   14012638d:	lea    0x8(%rcx),%rdx
   140126391:	mov    %r8,%rcx
   140126394:	cmp    %r8,%rdx
   140126397:	cmovae %rdx,%rcx
   14012639b:	mov    %rcx,0x40(%rsp)
   1401263a0:	cmpb   $0x0,0x152c1(%rbx)
   1401263a7:	je     14012cde3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9373>
   1401263ad:	mov    0x152d8(%rbx),%rdx
   1401263b4:	test   %rdx,%rdx
   1401263b7:	je     14012cde3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9373>
   1401263bd:	and    0x152f8(%rbx),%rax
   1401263c4:	shl    $0x5,%rax
   1401263c8:	add    %rdx,%rax
   1401263cb:	mov    %rax,0xc0(%rsp)
   1401263d3:	cmpq   $0x0,(%rax)
   1401263d7:	je     14012ccf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9288>
   1401263dd:	cmpb   $0x0,0x15211(%rbx)
   1401263e4:	je     14012f511 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaa1>
   1401263ea:	mov    0x15268(%rbx),%rax
   1401263f1:	mov    0x1070(%rbx),%rdx
   1401263f8:	sub    0x1068(%rbx),%rdx
   1401263ff:	mov    %rax,0xa0(%rsp)
   140126407:	add    %rcx,%rax
   14012640a:	sar    $0x3,%rdx
   14012640e:	mov    %rax,0x15268(%rbx)
   140126415:	add    $0x40,%rax
   140126419:	cmp    %rdx,%rax
   14012641c:	jae    140134c47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111d7>
   140126422:	vzeroupper
   140126425:	test   %dil,%dil
   140126428:	je     140130d6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2fd>
   14012642e:	mov    0xa0(%rsp),%r11
   140126436:	movzbl %dil,%edx
   14012643a:	movzbl %dil,%r8d
   14012643e:	sub    $0x1,%r8d
   140126442:	lea    -0x1(%rdx,%r11,1),%rcx
   140126447:	sub    $0x2,%rdx
   14012644b:	sub    %r8,%rdx
   14012644e:	lea    0x0(,%rcx,8),%rax
   140126456:	mov    0x1068(%rbx),%r8
   14012645d:	add    %r11,%rdx
   140126460:	shl    $0x3,%rdx
   140126464:	cmp    $0x1,%r12b
   140126468:	je     140126499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a29>
   14012646a:	cmp    $0x2,%r12b
   14012646e:	jne    1401264ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a3e>
   140126470:	mov    0x1c8(%rsp),%r9
   140126478:	sub    $0x8,%rax
   14012647c:	mov    %r9,(%r8,%rcx,8)
   140126480:	mov    0x1d0(%rsp),%rcx
   140126488:	mov    %rcx,0x1c8(%rsp)
   140126490:	cmp    %rdx,%rax
   140126493:	je     140131ec5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe455>
   140126499:	mov    0x1c8(%rsp),%rcx
   1401264a1:	mov    %rcx,(%r8,%rax,1)
   1401264a5:	sub    $0x8,%rax
   1401264a9:	cmp    %rdx,%rax
   1401264ac:	je     1401264c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a56>
   1401264ae:	mov    %rsi,%rcx
   1401264b1:	sub    $0x8,%rsi
   1401264b5:	mov    -0x8(%rcx),%rcx
   1401264b9:	mov    %rcx,(%r8,%rax,1)
   1401264bd:	sub    $0x8,%rax
   1401264c1:	cmp    %rdx,%rax
   1401264c4:	jne    1401264ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a3e>
   1401264c6:	mov    0x1048(%rbx),%rdx
   1401264cd:	lea    0x7a0(%rsp),%r12
   1401264d5:	xor    %eax,%eax
   1401264d7:	mov    $0x23,%ecx
   1401264dc:	mov    %r12,%rdi
   1401264df:	rep stos %rax,(%rdi)
   1401264e2:	mov    0xa0(%rsp),%rax
   1401264ea:	mov    %rdx,0x7c0(%rsp)
   1401264f2:	movb   $0x1,0x8a8(%rsp)
   1401264fa:	lea    (%r8,%rax,8),%rax
   1401264fe:	mov    %rbx,0x7a0(%rsp)
   140126506:	mov    %rax,0x7b0(%rsp)
   14012650e:	mov    0x40(%rsp),%rax
   140126513:	mov    %rax,0x7b8(%rsp)
   14012651b:	mov    %rsi,%rax
   14012651e:	sub    %rdx,%rax
   140126521:	mov    0x150c0(%rbx),%rdx
   140126528:	sar    $0x3,%rax
   14012652c:	mov    %rax,0x7c8(%rsp)
   140126534:	xor    %eax,%eax
   140126536:	test   %rdx,%rdx
   140126539:	je     140126547 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ad7>
   14012653b:	lea    (%rdx,%rdx,4),%rax
   14012653f:	lea    0x1098(%rbx,%rax,8),%rax
   140126547:	vmovq  %rax,%xmm7
   14012654c:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140126556:	mov    %r12,0x152b8(%rbx)
   14012655d:	vmovdqa %xmm0,0x7d0(%rsp)
   140126566:	call   140212e20 <tersun::VMTelemetryManager::instance()>
   14012656b:	cmpb   $0x0,(%rax)
   14012656e:	je     140126575 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b05>
   140126570:	addq   $0x1,0x28(%rax)
   140126575:	mov    0xc0(%rsp),%rax
   14012657d:	mov    %r12,%rdx
   140126580:	mov    %rbx,%rcx
   140126583:	call   *(%rax)
   140126585:	mov    0x7d8(%rsp),%rdx
   14012658d:	mov    %rdx,0x152b8(%rbx)
   140126594:	cmpq   $0x0,0x7e8(%rsp)
   14012659d:	jg     140133a1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffad>
   1401265a3:	mov    %rax,0x1c8(%rsp)
   1401265ab:	cmpb   $0x0,0x15211(%rbx)
   1401265b2:	je     140131ac0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe050>
   1401265b8:	mov    0xa0(%rsp),%rax
   1401265c0:	mov    %rax,0x15268(%rbx)
   1401265c7:	cmpb   $0x0,0x1040(%rbx)
   1401265ce:	je     14012a440 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d0>
   1401265d4:	movzbl 0x3(%rbp),%eax
   1401265d8:	mov    $0x1,%r12d
   1401265de:	add    $0x4,%rbp
   1401265e2:	lea    0x299ab7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401265e9:	mov    (%rdi,%rax,8),%rax
   1401265ed:	jmp    *%rax
   1401265ef:	mov    0x150c0(%rbx),%rax
   1401265f6:	test   %rax,%rax
   1401265f9:	je     140124651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   1401265ff:	lea    (%rax,%rax,4),%rdx
   140126603:	sub    $0x1,%rax
   140126607:	mov    0x1c8(%rsp),%rbp
   14012660f:	lea    (%rbx,%rdx,8),%rdx
   140126613:	mov    0x1098(%rdx),%rdi
   14012661a:	mov    0x10a0(%rdx),%rcx
   140126621:	mov    0x10a8(%rdx),%r13
   140126628:	mov    %rax,0x150c0(%rbx)
   14012662f:	test   %r12b,%r12b
   140126632:	jne    14012664b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bdb>
   140126634:	movabs $0xfffb000000000000,%rbp
   14012663e:	cmp    %rsi,0x1048(%rbx)
   140126645:	jae    14012664b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bdb>
   140126647:	mov    -0x8(%rsi),%rbp
   14012664b:	cmpb   $0x0,0x15211(%rbx)
   140126652:	je     14012c8fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e8a>
   140126658:	mov    %rcx,0x15268(%rbx)
   14012665f:	mov    0x1048(%rbx),%rdx
   140126666:	mov    %rbp,0x1c8(%rsp)
   14012666e:	lea    (%rdx,%r13,8),%rsi
   140126672:	mov    0x150c0(%rbx),%r13
   140126679:	test   %r13,%r13
   14012667c:	je     14012668b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c1b>
   14012667e:	lea    -0x5(%r13,%r13,4),%rax
   140126683:	mov    0x10c8(%rbx,%rax,8),%r13
   14012668b:	lea    (%r15,%rdi,1),%rax
   14012668f:	cmpb   $0x0,0x1040(%rbx)
   140126696:	je     14012cbb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9142>
   14012669c:	lea    0x1(%rax),%rbp
   1401266a0:	movzbl (%rax),%eax
   1401266a3:	lea    0x2999f6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401266aa:	mov    $0x1,%r12d
   1401266b0:	mov    (%rdi,%rax,8),%rax
   1401266b4:	jmp    *%rax
   1401266b6:	movzwl 0x0(%rbp),%edi
   1401266ba:	movzbl 0x2(%rbp),%r9d
   1401266bf:	add    $0x3,%rbp
   1401266c3:	cmp    $0x2,%r12b
   1401266c7:	je     14012aa03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f93>
   1401266cd:	cmp    $0x1,%r12b
   1401266d1:	je     14012ddcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa35b>
   1401266d7:	mov    0x15268(%rbx),%r13
   1401266de:	mov    0x1070(%rbx),%rdx
   1401266e5:	sub    0x1068(%rbx),%rdx
   1401266ec:	lea    (%r9,%r13,1),%rcx
   1401266f0:	sar    $0x3,%rdx
   1401266f4:	mov    %rcx,0x15268(%rbx)
   1401266fb:	add    $0x40,%rcx
   1401266ff:	cmp    %rdx,%rcx
   140126702:	jae    1401304a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca37>
   140126708:	mov    0x1048(%rbx),%rdx
   14012670f:	mov    %rsi,%r11
   140126712:	mov    0x150c0(%rbx),%rax
   140126719:	sub    %r15,%rbp
   14012671c:	sub    %rdx,%r11
   14012671f:	mov    %r11,%r10
   140126722:	sar    $0x3,%r10
   140126726:	cmp    $0x7ff,%rax
   14012672c:	ja     140139030 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155c0>
   140126732:	lea    0x1(%rax),%rcx
   140126736:	lea    (%rax,%rax,4),%rax
   14012673a:	mov    %rcx,0x150c0(%rbx)
   140126741:	mov    0x15270(%rbx),%rcx
   140126748:	mov    %rbp,0x10c0(%rbx,%rax,8)
   140126750:	mov    %r13,0x10c8(%rbx,%rax,8)
   140126758:	mov    %r10,0x10d0(%rbx,%rax,8)
   140126760:	mov    %r9,0x10d8(%rbx,%rax,8)
   140126768:	mov    %rdi,0x10e0(%rbx,%rax,8)
   140126770:	mov    0x152a0(%rbx),%rax
   140126777:	cmp    %rax,0x68(%rcx)
   14012677b:	jae    140130465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9f5>
   140126781:	lea    (%r15,%rdi,1),%rax
   140126785:	cmpb   $0x0,0x1040(%rbx)
   14012678c:	je     14012e664 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf4>
   140126792:	lea    0x1(%rax),%rbp
   140126796:	movzbl (%rax),%eax
   140126799:	lea    0x299900(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401267a0:	jmp    *(%rdi,%rax,8)
   1401267a3:	mov    0x15268(%rbx),%r13
   1401267aa:	movzbl 0x2(%rbp),%r8d
   1401267af:	lea    0x3(%rbp),%rax
   1401267b3:	mov    0x1070(%rbx),%rdx
   1401267ba:	sub    0x1068(%rbx),%rdx
   1401267c1:	lea    (%r8,%r13,1),%rcx
   1401267c5:	movzwl 0x0(%rbp),%r11d
   1401267ca:	sar    $0x3,%rdx
   1401267ce:	mov    %rcx,0x15268(%rbx)
   1401267d5:	add    $0x40,%rcx
   1401267d9:	cmp    %rdx,%rcx
   1401267dc:	jae    14012f8a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe35>
   1401267e2:	mov    0x1068(%rbx),%rdx
   1401267e9:	cmp    $0x1,%r12b
   1401267ed:	je     14012b71f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7caf>
   1401267f3:	cmp    $0x2,%r12b
   1401267f7:	je     14012debc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa44c>
   1401267fd:	mov    -0x8(%rsi),%rcx
   140126801:	sub    $0x8,%rsi
   140126805:	mov    %rcx,(%rdx,%r13,8)
   140126809:	mov    0x1048(%rbx),%rdx
   140126810:	mov    %rsi,%r10
   140126813:	mov    0x150c0(%rbx),%rcx
   14012681a:	sub    %r15,%rax
   14012681d:	movzwl %r11w,%ebp
   140126821:	sub    %rdx,%r10
   140126824:	mov    %r10,%rdi
   140126827:	sar    $0x3,%rdi
   14012682b:	cmp    $0x7ff,%rcx
   140126832:	ja     140139030 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155c0>
   140126838:	lea    0x1(%rcx),%r11
   14012683c:	lea    (%rcx,%rcx,4),%rcx
   140126840:	mov    %r11,0x150c0(%rbx)
   140126847:	mov    %r8,0x10d8(%rbx,%rcx,8)
   14012684f:	mov    0x152a0(%rbx),%r8
   140126856:	mov    %rax,0x10c0(%rbx,%rcx,8)
   14012685e:	mov    %r13,0x10c8(%rbx,%rcx,8)
   140126866:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   14012686e:	mov    %rbp,0x10e0(%rbx,%rcx,8)
   140126876:	mov    0x15270(%rbx),%rcx
   14012687d:	cmp    %r8,0x68(%rcx)
   140126881:	jae    14012ffec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc57c>
   140126887:	lea    (%r15,%rbp,1),%rax
   14012688b:	cmpb   $0x0,0x1040(%rbx)
   140126892:	je     14012e664 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf4>
   140126898:	lea    0x1(%rax),%rbp
   14012689c:	movzbl (%rax),%eax
   14012689f:	lea    0x2997fa(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401268a6:	jmp    *(%rdi,%rax,8)
   1401268a9:	mov    0x150c0(%rbx),%rax
   1401268b0:	test   %rax,%rax
   1401268b3:	je     140124651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   1401268b9:	lea    -0x1(%rax),%r13
   1401268bd:	test   %r12b,%r12b
   1401268c0:	jne    1401268ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e5e>
   1401268c2:	mov    -0x8(%rsi),%rdx
   1401268c6:	mov    %rdx,0x1c8(%rsp)
   1401268ce:	lea    (%rax,%rax,4),%rax
   1401268d2:	mov    0x1048(%rbx),%rdx
   1401268d9:	lea    (%rbx,%rax,8),%rcx
   1401268dd:	mov    0x10a0(%rcx),%rax
   1401268e4:	mov    %rax,0x15268(%rbx)
   1401268eb:	mov    0x10a8(%rcx),%rax
   1401268f2:	lea    (%rdx,%rax,8),%rsi
   1401268f6:	mov    0x1098(%rcx),%rax
   1401268fd:	mov    %r13,0x150c0(%rbx)
   140126904:	test   %r13,%r13
   140126907:	jne    14012a6f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c88>
   14012690d:	add    %r15,%rax
   140126910:	cmpb   $0x0,0x1040(%rbx)
   140126917:	je     14012cbb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9142>
   14012691d:	lea    0x1(%rax),%rbp
   140126921:	movzbl (%rax),%eax
   140126924:	lea    0x299775(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012692b:	mov    $0x1,%r12d
   140126931:	mov    (%rdi,%rax,8),%rax
   140126935:	jmp    *%rax
   140126937:	cmp    $0x2,%r12b
   14012693b:	je     14012b8ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e8f>
   140126941:	cmp    $0x1,%r12b
   140126945:	je     14012de56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3e6>
   14012694b:	mov    0x1048(%rbx),%rdx
   140126952:	mov    0x1050(%rbx),%rax
   140126959:	vzeroupper
   14012695c:	sub    %rdx,%rsi
   14012695f:	sub    %r15,%rbp
   140126962:	sub    %rdx,%rax
   140126965:	mov    %rsi,%rdi
   140126968:	mov    %rbp,0x1038(%rbx)
   14012696f:	sar    $0x3,%rdi
   140126973:	cmp    %rsi,%rax
   140126976:	jb     14012d3b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9947>
   14012697c:	vmovdqa 0x23615c(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126984:	mov    %rdi,0x1060(%rbx)
   14012698b:	mov    %r14,%rdx
   14012698e:	mov    %rbx,%rcx
   140126991:	movb   $0x0,0x153a0(%rbx)
   140126998:	vmovdqa %xmm0,0x15390(%rbx)
   1401269a0:	call   140107960 <setun::VM::handle_push_string(setun::Chunk const&)>
   1401269a5:	mov    0x1060(%rbx),%rax
   1401269ac:	mov    0x1048(%rbx),%rdx
   1401269b3:	mov    0x1038(%rbx),%rcx
   1401269ba:	mov    0x150c0(%rbx),%r13
   1401269c1:	lea    (%rdx,%rax,8),%rsi
   1401269c5:	mov    0x1050(%rbx),%rax
   1401269cc:	add    %r15,%rcx
   1401269cf:	mov    %rax,0x38(%rsp)
   1401269d4:	test   %r13,%r13
   1401269d7:	je     1401269e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f76>
   1401269d9:	lea    -0x5(%r13,%r13,4),%r8
   1401269de:	mov    0x10c8(%rbx,%r8,8),%r13
   1401269e6:	cmpb   $0x0,0x1040(%rbx)
   1401269ed:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401269f3:	movzbl (%rcx),%eax
   1401269f6:	lea    0x2996a3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401269fd:	lea    0x1(%rcx),%rbp
   140126a01:	xor    %r12d,%r12d
   140126a04:	mov    (%rdi,%rax,8),%rax
   140126a08:	jmp    *%rax
   140126a0a:	cmp    $0x2,%r12b
   140126a0e:	je     14012aa34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fc4>
   140126a14:	cmp    $0x1,%r12b
   140126a18:	je     14012de89 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa419>
   140126a1e:	mov    0x1048(%rbx),%rdx
   140126a25:	mov    0x1050(%rbx),%rax
   140126a2c:	vzeroupper
   140126a2f:	sub    %rdx,%rsi
   140126a32:	sub    %r15,%rbp
   140126a35:	sub    %rdx,%rax
   140126a38:	mov    %rsi,%rdi
   140126a3b:	mov    %rbp,0x1038(%rbx)
   140126a42:	sar    $0x3,%rdi
   140126a46:	cmp    %rsi,%rax
   140126a49:	jb     14012d631 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bc1>
   140126a4f:	vmovdqa 0x236089(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126a57:	mov    %rdi,0x1060(%rbx)
   140126a5e:	mov    %r14,%rdx
   140126a61:	mov    %rbx,%rcx
   140126a64:	movb   $0x0,0x153a0(%rbx)
   140126a6b:	vmovdqa %xmm0,0x15390(%rbx)
   140126a73:	call   140107fd0 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140126a78:	mov    0x1060(%rbx),%rax
   140126a7f:	mov    0x1048(%rbx),%rdx
   140126a86:	mov    0x1038(%rbx),%rcx
   140126a8d:	mov    0x150c0(%rbx),%r13
   140126a94:	lea    (%rdx,%rax,8),%rsi
   140126a98:	mov    0x1050(%rbx),%rax
   140126a9f:	add    %r15,%rcx
   140126aa2:	mov    %rax,0x38(%rsp)
   140126aa7:	test   %r13,%r13
   140126aaa:	je     140126ab9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3049>
   140126aac:	lea    -0x5(%r13,%r13,4),%r8
   140126ab1:	mov    0x10c8(%rbx,%r8,8),%r13
   140126ab9:	cmpb   $0x0,0x1040(%rbx)
   140126ac0:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126ac6:	movzbl (%rcx),%eax
   140126ac9:	lea    0x2995d0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ad0:	lea    0x1(%rcx),%rbp
   140126ad4:	xor    %r12d,%r12d
   140126ad7:	mov    (%rdi,%rax,8),%rax
   140126adb:	jmp    *%rax
   140126add:	cmp    $0x2,%r12b
   140126ae1:	je     14012b97d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f0d>
   140126ae7:	cmp    $0x1,%r12b
   140126aeb:	je     14012df79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa509>
   140126af1:	mov    0x1048(%rbx),%rdx
   140126af8:	mov    0x1050(%rbx),%rax
   140126aff:	vzeroupper
   140126b02:	sub    %rdx,%rsi
   140126b05:	sub    %r15,%rbp
   140126b08:	sub    %rdx,%rax
   140126b0b:	mov    %rsi,%rdi
   140126b0e:	mov    %rbp,0x1038(%rbx)
   140126b15:	sar    $0x3,%rdi
   140126b19:	cmp    %rsi,%rax
   140126b1c:	jb     14012d6cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c5c>
   140126b22:	vmovdqa 0x235fb6(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126b2a:	mov    %rdi,0x1060(%rbx)
   140126b31:	mov    %r14,%rdx
   140126b34:	mov    %rbx,%rcx
   140126b37:	movb   $0x0,0x153a0(%rbx)
   140126b3e:	vmovdqa %xmm0,0x15390(%rbx)
   140126b46:	call   14010cbb0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   140126b4b:	mov    0x1060(%rbx),%rax
   140126b52:	mov    0x1048(%rbx),%rdx
   140126b59:	mov    0x1038(%rbx),%rcx
   140126b60:	mov    0x150c0(%rbx),%r13
   140126b67:	lea    (%rdx,%rax,8),%rsi
   140126b6b:	mov    0x1050(%rbx),%rax
   140126b72:	add    %r15,%rcx
   140126b75:	mov    %rax,0x38(%rsp)
   140126b7a:	test   %r13,%r13
   140126b7d:	je     140126b8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x311c>
   140126b7f:	lea    -0x5(%r13,%r13,4),%r8
   140126b84:	mov    0x10c8(%rbx,%r8,8),%r13
   140126b8c:	cmpb   $0x0,0x1040(%rbx)
   140126b93:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126b99:	movzbl (%rcx),%eax
   140126b9c:	lea    0x2994fd(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ba3:	lea    0x1(%rcx),%rbp
   140126ba7:	xor    %r12d,%r12d
   140126baa:	mov    (%rdi,%rax,8),%rax
   140126bae:	jmp    *%rax
   140126bb0:	cmp    $0x2,%r12b
   140126bb4:	je     14012be66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83f6>
   140126bba:	cmp    $0x1,%r12b
   140126bbe:	je     14012e042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5d2>
   140126bc4:	mov    0x1048(%rbx),%rdx
   140126bcb:	mov    0x1050(%rbx),%rax
   140126bd2:	vzeroupper
   140126bd5:	sub    %rdx,%rsi
   140126bd8:	sub    %r15,%rbp
   140126bdb:	sub    %rdx,%rax
   140126bde:	mov    %rsi,%rdi
   140126be1:	mov    %rbp,0x1038(%rbx)
   140126be8:	sar    $0x3,%rdi
   140126bec:	cmp    %rsi,%rax
   140126bef:	jb     14012d6e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c71>
   140126bf5:	vmovdqa 0x235ee3(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126bfd:	mov    %rdi,0x1060(%rbx)
   140126c04:	mov    %r14,%rdx
   140126c07:	mov    %rbx,%rcx
   140126c0a:	movb   $0x0,0x153a0(%rbx)
   140126c11:	vmovdqa %xmm0,0x15390(%rbx)
   140126c19:	call   140103b40 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   140126c1e:	mov    0x1060(%rbx),%rax
   140126c25:	mov    0x1048(%rbx),%rdx
   140126c2c:	mov    0x1038(%rbx),%rcx
   140126c33:	mov    0x150c0(%rbx),%r13
   140126c3a:	lea    (%rdx,%rax,8),%rsi
   140126c3e:	mov    0x1050(%rbx),%rax
   140126c45:	add    %r15,%rcx
   140126c48:	mov    %rax,0x38(%rsp)
   140126c4d:	test   %r13,%r13
   140126c50:	je     140126c5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31ef>
   140126c52:	lea    -0x5(%r13,%r13,4),%r8
   140126c57:	mov    0x10c8(%rbx,%r8,8),%r13
   140126c5f:	cmpb   $0x0,0x1040(%rbx)
   140126c66:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126c6c:	movzbl (%rcx),%eax
   140126c6f:	lea    0x29942a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126c76:	lea    0x1(%rcx),%rbp
   140126c7a:	xor    %r12d,%r12d
   140126c7d:	mov    (%rdi,%rax,8),%rax
   140126c81:	jmp    *%rax
   140126c83:	cmp    $0x2,%r12b
   140126c87:	je     14012b43a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ca>
   140126c8d:	cmp    $0x1,%r12b
   140126c91:	je     14012dc75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa205>
   140126c97:	mov    0x1048(%rbx),%rdx
   140126c9e:	mov    0x1050(%rbx),%rax
   140126ca5:	vzeroupper
   140126ca8:	sub    %rdx,%rsi
   140126cab:	sub    %r15,%rbp
   140126cae:	sub    %rdx,%rax
   140126cb1:	mov    %rsi,%rdi
   140126cb4:	mov    %rbp,0x1038(%rbx)
   140126cbb:	sar    $0x3,%rdi
   140126cbf:	cmp    %rsi,%rax
   140126cc2:	jb     14012d6f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c86>
   140126cc8:	vmovdqa 0x235e10(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126cd0:	mov    %rdi,0x1060(%rbx)
   140126cd7:	mov    %r14,%rdx
   140126cda:	mov    %rbx,%rcx
   140126cdd:	movb   $0x0,0x153a0(%rbx)
   140126ce4:	vmovdqa %xmm0,0x15390(%rbx)
   140126cec:	call   1401020e0 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   140126cf1:	mov    0x1060(%rbx),%rax
   140126cf8:	mov    0x1048(%rbx),%rdx
   140126cff:	mov    0x1038(%rbx),%rcx
   140126d06:	mov    0x150c0(%rbx),%r13
   140126d0d:	lea    (%rdx,%rax,8),%rsi
   140126d11:	mov    0x1050(%rbx),%rax
   140126d18:	add    %r15,%rcx
   140126d1b:	mov    %rax,0x38(%rsp)
   140126d20:	test   %r13,%r13
   140126d23:	je     140126d32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32c2>
   140126d25:	lea    -0x5(%r13,%r13,4),%r8
   140126d2a:	mov    0x10c8(%rbx,%r8,8),%r13
   140126d32:	cmpb   $0x0,0x1040(%rbx)
   140126d39:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126d3f:	movzbl (%rcx),%eax
   140126d42:	lea    0x299357(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d49:	lea    0x1(%rcx),%rbp
   140126d4d:	xor    %r12d,%r12d
   140126d50:	mov    (%rdi,%rax,8),%rax
   140126d54:	jmp    *%rax
   140126d56:	cmp    $0x2,%r12b
   140126d5a:	je     14012b479 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a09>
   140126d60:	cmp    $0x1,%r12b
   140126d64:	je     14012e273 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa803>
   140126d6a:	mov    0x1048(%rbx),%rdx
   140126d71:	mov    0x1050(%rbx),%rax
   140126d78:	vzeroupper
   140126d7b:	sub    %rdx,%rsi
   140126d7e:	sub    %r15,%rbp
   140126d81:	sub    %rdx,%rax
   140126d84:	mov    %rsi,%rdi
   140126d87:	mov    %rbp,0x1038(%rbx)
   140126d8e:	sar    $0x3,%rdi
   140126d92:	cmp    %rsi,%rax
   140126d95:	jb     14012d489 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a19>
   140126d9b:	vmovdqa 0x235d3d(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126da3:	mov    %rdi,0x1060(%rbx)
   140126daa:	mov    %r14,%rdx
   140126dad:	mov    %rbx,%rcx
   140126db0:	movb   $0x0,0x153a0(%rbx)
   140126db7:	vmovdqa %xmm0,0x15390(%rbx)
   140126dbf:	call   140103200 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   140126dc4:	mov    0x1060(%rbx),%rax
   140126dcb:	mov    0x1048(%rbx),%rdx
   140126dd2:	mov    0x1038(%rbx),%rcx
   140126dd9:	mov    0x150c0(%rbx),%r13
   140126de0:	lea    (%rdx,%rax,8),%rsi
   140126de4:	mov    0x1050(%rbx),%rax
   140126deb:	add    %r15,%rcx
   140126dee:	mov    %rax,0x38(%rsp)
   140126df3:	test   %r13,%r13
   140126df6:	je     140126e05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3395>
   140126df8:	lea    -0x5(%r13,%r13,4),%r8
   140126dfd:	mov    0x10c8(%rbx,%r8,8),%r13
   140126e05:	cmpb   $0x0,0x1040(%rbx)
   140126e0c:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126e12:	movzbl (%rcx),%eax
   140126e15:	lea    0x299284(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126e1c:	lea    0x1(%rcx),%rbp
   140126e20:	xor    %r12d,%r12d
   140126e23:	mov    (%rdi,%rax,8),%rax
   140126e27:	jmp    *%rax
   140126e29:	cmp    $0x2,%r12b
   140126e2d:	je     14012b4b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a48>
   140126e33:	cmp    $0x1,%r12b
   140126e37:	je     14012dd32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2c2>
   140126e3d:	mov    0x1048(%rbx),%rdx
   140126e44:	mov    0x1050(%rbx),%rax
   140126e4b:	vzeroupper
   140126e4e:	sub    %rdx,%rsi
   140126e51:	sub    %r15,%rbp
   140126e54:	sub    %rdx,%rax
   140126e57:	mov    %rsi,%rdi
   140126e5a:	mov    %rbp,0x1038(%rbx)
   140126e61:	sar    $0x3,%rdi
   140126e65:	cmp    %rsi,%rax
   140126e68:	jb     14012d45f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99ef>
   140126e6e:	vmovdqa 0x235c6a(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126e76:	mov    %rdi,0x1060(%rbx)
   140126e7d:	mov    %r14,%rdx
   140126e80:	mov    %rbx,%rcx
   140126e83:	movb   $0x0,0x153a0(%rbx)
   140126e8a:	vmovdqa %xmm0,0x15390(%rbx)
   140126e92:	call   14010bb60 <setun::VM::handle_print(setun::Chunk const&)>
   140126e97:	mov    0x1060(%rbx),%rax
   140126e9e:	mov    0x1048(%rbx),%rdx
   140126ea5:	mov    0x1038(%rbx),%rcx
   140126eac:	mov    0x150c0(%rbx),%r13
   140126eb3:	lea    (%rdx,%rax,8),%rsi
   140126eb7:	mov    0x1050(%rbx),%rax
   140126ebe:	add    %r15,%rcx
   140126ec1:	mov    %rax,0x38(%rsp)
   140126ec6:	test   %r13,%r13
   140126ec9:	je     140126ed8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3468>
   140126ecb:	lea    -0x5(%r13,%r13,4),%r8
   140126ed0:	mov    0x10c8(%rbx,%r8,8),%r13
   140126ed8:	cmpb   $0x0,0x1040(%rbx)
   140126edf:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126ee5:	movzbl (%rcx),%eax
   140126ee8:	lea    0x2991b1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126eef:	lea    0x1(%rcx),%rbp
   140126ef3:	xor    %r12d,%r12d
   140126ef6:	mov    (%rdi,%rax,8),%rax
   140126efa:	jmp    *%rax
   140126efc:	cmp    $0x2,%r12b
   140126f00:	je     14012bd44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82d4>
   140126f06:	cmp    $0x1,%r12b
   140126f0a:	je     14012e372 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa902>
   140126f10:	mov    0x1048(%rbx),%rdx
   140126f17:	mov    0x1050(%rbx),%rax
   140126f1e:	vzeroupper
   140126f21:	sub    %rdx,%rsi
   140126f24:	sub    %r15,%rbp
   140126f27:	sub    %rdx,%rax
   140126f2a:	mov    %rsi,%rdi
   140126f2d:	mov    %rbp,0x1038(%rbx)
   140126f34:	sar    $0x3,%rdi
   140126f38:	cmp    %rsi,%rax
   140126f3b:	jb     14012d49e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a2e>
   140126f41:	vmovdqa 0x235b97(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140126f49:	mov    %rdi,0x1060(%rbx)
   140126f50:	mov    %r14,%rdx
   140126f53:	mov    %rbx,%rcx
   140126f56:	movb   $0x0,0x153a0(%rbx)
   140126f5d:	vmovdqa %xmm0,0x15390(%rbx)
   140126f65:	call   140104b10 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140126f6a:	mov    0x1060(%rbx),%rax
   140126f71:	mov    0x1048(%rbx),%rdx
   140126f78:	mov    0x1038(%rbx),%rcx
   140126f7f:	mov    0x150c0(%rbx),%r13
   140126f86:	lea    (%rdx,%rax,8),%rsi
   140126f8a:	mov    0x1050(%rbx),%rax
   140126f91:	add    %r15,%rcx
   140126f94:	mov    %rax,0x38(%rsp)
   140126f99:	test   %r13,%r13
   140126f9c:	je     140126fab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x353b>
   140126f9e:	lea    -0x5(%r13,%r13,4),%r8
   140126fa3:	mov    0x10c8(%rbx,%r8,8),%r13
   140126fab:	cmpb   $0x0,0x1040(%rbx)
   140126fb2:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140126fb8:	movzbl (%rcx),%eax
   140126fbb:	lea    0x2990de(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126fc2:	lea    0x1(%rcx),%rbp
   140126fc6:	xor    %r12d,%r12d
   140126fc9:	mov    (%rdi,%rax,8),%rax
   140126fcd:	jmp    *%rax
   140126fcf:	cmp    $0x2,%r12b
   140126fd3:	je     14012adfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x738c>
   140126fd9:	cmp    $0x1,%r12b
   140126fdd:	je     14012e33f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8cf>
   140126fe3:	mov    0x1048(%rbx),%rdx
   140126fea:	mov    0x1050(%rbx),%rax
   140126ff1:	vzeroupper
   140126ff4:	sub    %rdx,%rsi
   140126ff7:	sub    %r15,%rbp
   140126ffa:	sub    %rdx,%rax
   140126ffd:	mov    %rsi,%rdi
   140127000:	mov    %rbp,0x1038(%rbx)
   140127007:	sar    $0x3,%rdi
   14012700b:	cmp    %rsi,%rax
   14012700e:	jb     14012d4b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a43>
   140127014:	vmovdqa 0x235ac4(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012701c:	mov    %rdi,0x1060(%rbx)
   140127023:	mov    %r14,%rdx
   140127026:	mov    %rbx,%rcx
   140127029:	movb   $0x0,0x153a0(%rbx)
   140127030:	vmovdqa %xmm0,0x15390(%rbx)
   140127038:	call   14010c7f0 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   14012703d:	mov    0x1060(%rbx),%rax
   140127044:	mov    0x1048(%rbx),%rdx
   14012704b:	mov    0x1038(%rbx),%rcx
   140127052:	mov    0x150c0(%rbx),%r13
   140127059:	lea    (%rdx,%rax,8),%rsi
   14012705d:	mov    0x1050(%rbx),%rax
   140127064:	add    %r15,%rcx
   140127067:	mov    %rax,0x38(%rsp)
   14012706c:	test   %r13,%r13
   14012706f:	je     14012707e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x360e>
   140127071:	lea    -0x5(%r13,%r13,4),%r8
   140127076:	mov    0x10c8(%rbx,%r8,8),%r13
   14012707e:	cmpb   $0x0,0x1040(%rbx)
   140127085:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012708b:	movzbl (%rcx),%eax
   14012708e:	lea    0x29900b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127095:	lea    0x1(%rcx),%rbp
   140127099:	xor    %r12d,%r12d
   14012709c:	mov    (%rdi,%rax,8),%rax
   1401270a0:	jmp    *%rax
   1401270a2:	cmp    $0x2,%r12b
   1401270a6:	je     14012bd05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8295>
   1401270ac:	cmp    $0x1,%r12b
   1401270b0:	je     14012dd65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2f5>
   1401270b6:	mov    0x1048(%rbx),%rdx
   1401270bd:	mov    0x1050(%rbx),%rax
   1401270c4:	vzeroupper
   1401270c7:	sub    %rdx,%rsi
   1401270ca:	sub    %r15,%rbp
   1401270cd:	sub    %rdx,%rax
   1401270d0:	mov    %rsi,%rdi
   1401270d3:	mov    %rbp,0x1038(%rbx)
   1401270da:	sar    $0x3,%rdi
   1401270de:	cmp    %rsi,%rax
   1401270e1:	jb     14012d474 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a04>
   1401270e7:	vmovdqa 0x2359f1(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401270ef:	mov    %rdi,0x1060(%rbx)
   1401270f6:	mov    %r14,%rdx
   1401270f9:	mov    %rbx,%rcx
   1401270fc:	movb   $0x0,0x153a0(%rbx)
   140127103:	vmovdqa %xmm0,0x15390(%rbx)
   14012710b:	call   1401004e0 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   140127110:	mov    0x1060(%rbx),%rax
   140127117:	mov    0x1048(%rbx),%rdx
   14012711e:	mov    0x1038(%rbx),%rcx
   140127125:	mov    0x150c0(%rbx),%r13
   14012712c:	lea    (%rdx,%rax,8),%rsi
   140127130:	mov    0x1050(%rbx),%rax
   140127137:	add    %r15,%rcx
   14012713a:	mov    %rax,0x38(%rsp)
   14012713f:	test   %r13,%r13
   140127142:	je     140127151 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36e1>
   140127144:	lea    -0x5(%r13,%r13,4),%r8
   140127149:	mov    0x10c8(%rbx,%r8,8),%r13
   140127151:	cmpb   $0x0,0x1040(%rbx)
   140127158:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012715e:	movzbl (%rcx),%eax
   140127161:	lea    0x298f38(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127168:	lea    0x1(%rcx),%rbp
   14012716c:	xor    %r12d,%r12d
   14012716f:	mov    (%rdi,%rax,8),%rax
   140127173:	jmp    *%rax
   140127175:	cmp    $0x2,%r12b
   140127179:	je     14012b9bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f4c>
   14012717f:	cmp    $0x1,%r12b
   140127183:	je     14012df46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4d6>
   140127189:	mov    0x1048(%rbx),%rdx
   140127190:	mov    0x1050(%rbx),%rax
   140127197:	vzeroupper
   14012719a:	sub    %rdx,%rsi
   14012719d:	sub    %r15,%rbp
   1401271a0:	sub    %rdx,%rax
   1401271a3:	mov    %rsi,%rdi
   1401271a6:	mov    %rbp,0x1038(%rbx)
   1401271ad:	sar    $0x3,%rdi
   1401271b1:	cmp    %rsi,%rax
   1401271b4:	jb     14012d40b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x999b>
   1401271ba:	vmovdqa 0x23591e(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401271c2:	mov    %rdi,0x1060(%rbx)
   1401271c9:	mov    %r14,%rdx
   1401271cc:	mov    %rbx,%rcx
   1401271cf:	movb   $0x0,0x153a0(%rbx)
   1401271d6:	vmovdqa %xmm0,0x15390(%rbx)
   1401271de:	call   140100580 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   1401271e3:	mov    0x1060(%rbx),%rax
   1401271ea:	mov    0x1048(%rbx),%rdx
   1401271f1:	mov    0x1038(%rbx),%rcx
   1401271f8:	mov    0x150c0(%rbx),%r13
   1401271ff:	lea    (%rdx,%rax,8),%rsi
   140127203:	mov    0x1050(%rbx),%rax
   14012720a:	add    %r15,%rcx
   14012720d:	mov    %rax,0x38(%rsp)
   140127212:	test   %r13,%r13
   140127215:	je     140127224 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37b4>
   140127217:	lea    -0x5(%r13,%r13,4),%r8
   14012721c:	mov    0x10c8(%rbx,%r8,8),%r13
   140127224:	cmpb   $0x0,0x1040(%rbx)
   14012722b:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140127231:	movzbl (%rcx),%eax
   140127234:	lea    0x298e65(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012723b:	lea    0x1(%rcx),%rbp
   14012723f:	xor    %r12d,%r12d
   140127242:	mov    (%rdi,%rax,8),%rax
   140127246:	jmp    *%rax
   140127248:	cmp    $0x2,%r12b
   14012724c:	je     14012be27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83b7>
   140127252:	cmp    $0x1,%r12b
   140127256:	je     14012e0a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa638>
   14012725c:	mov    0x1048(%rbx),%rdx
   140127263:	mov    0x1050(%rbx),%rax
   14012726a:	vzeroupper
   14012726d:	sub    %rdx,%rsi
   140127270:	sub    %r15,%rbp
   140127273:	sub    %rdx,%rax
   140127276:	mov    %rsi,%rdi
   140127279:	mov    %rbp,0x1038(%rbx)
   140127280:	sar    $0x3,%rdi
   140127284:	cmp    %rsi,%rax
   140127287:	jb     14012d670 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c00>
   14012728d:	vmovdqa 0x23584b(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140127295:	mov    %rdi,0x1060(%rbx)
   14012729c:	mov    %r14,%rdx
   14012729f:	mov    %rbx,%rcx
   1401272a2:	movb   $0x0,0x153a0(%rbx)
   1401272a9:	vmovdqa %xmm0,0x15390(%rbx)
   1401272b1:	call   1400fe760 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   1401272b6:	mov    0x1060(%rbx),%rax
   1401272bd:	mov    0x1048(%rbx),%rdx
   1401272c4:	mov    0x1038(%rbx),%rcx
   1401272cb:	mov    0x150c0(%rbx),%r13
   1401272d2:	lea    (%rdx,%rax,8),%rsi
   1401272d6:	mov    0x1050(%rbx),%rax
   1401272dd:	add    %r15,%rcx
   1401272e0:	mov    %rax,0x38(%rsp)
   1401272e5:	test   %r13,%r13
   1401272e8:	je     1401272f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3887>
   1401272ea:	lea    -0x5(%r13,%r13,4),%r8
   1401272ef:	mov    0x10c8(%rbx,%r8,8),%r13
   1401272f7:	cmpb   $0x0,0x1040(%rbx)
   1401272fe:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140127304:	movzbl (%rcx),%eax
   140127307:	lea    0x298d92(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012730e:	lea    0x1(%rcx),%rbp
   140127312:	xor    %r12d,%r12d
   140127315:	mov    (%rdi,%rax,8),%rax
   140127319:	jmp    *%rax
   14012731b:	cmp    $0x2,%r12b
   14012731f:	je     14012bf03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8493>
   140127325:	cmp    $0x1,%r12b
   140127329:	je     14012dc0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa19f>
   14012732f:	mov    0x1048(%rbx),%rdx
   140127336:	mov    0x1050(%rbx),%rax
   14012733d:	vzeroupper
   140127340:	sub    %rdx,%rsi
   140127343:	sub    %r15,%rbp
   140127346:	sub    %rdx,%rax
   140127349:	mov    %rsi,%rdi
   14012734c:	mov    %rbp,0x1038(%rbx)
   140127353:	sar    $0x3,%rdi
   140127357:	cmp    %rsi,%rax
   14012735a:	jb     14012d75b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ceb>
   140127360:	vmovdqa 0x235778(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140127368:	mov    %rdi,0x1060(%rbx)
   14012736f:	mov    %r14,%rdx
   140127372:	mov    %rbx,%rcx
   140127375:	movb   $0x0,0x153a0(%rbx)
   14012737c:	vmovdqa %xmm0,0x15390(%rbx)
   140127384:	call   140104230 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140127389:	mov    0x1060(%rbx),%rax
   140127390:	mov    0x1048(%rbx),%rdx
   140127397:	mov    0x1038(%rbx),%rcx
   14012739e:	mov    0x150c0(%rbx),%r13
   1401273a5:	lea    (%rdx,%rax,8),%rsi
   1401273a9:	mov    0x1050(%rbx),%rax
   1401273b0:	add    %r15,%rcx
   1401273b3:	mov    %rax,0x38(%rsp)
   1401273b8:	test   %r13,%r13
   1401273bb:	je     1401273ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x395a>
   1401273bd:	lea    -0x5(%r13,%r13,4),%r8
   1401273c2:	mov    0x10c8(%rbx,%r8,8),%r13
   1401273ca:	cmpb   $0x0,0x1040(%rbx)
   1401273d1:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401273d7:	movzbl (%rcx),%eax
   1401273da:	lea    0x298cbf(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401273e1:	lea    0x1(%rcx),%rbp
   1401273e5:	xor    %r12d,%r12d
   1401273e8:	mov    (%rdi,%rax,8),%rax
   1401273ec:	jmp    *%rax
   1401273ee:	cmp    $0x2,%r12b
   1401273f2:	je     14012bf42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84d2>
   1401273f8:	cmp    $0x1,%r12b
   1401273fc:	je     14012dd98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa328>
   140127402:	mov    0x1048(%rbx),%rdx
   140127409:	mov    0x1050(%rbx),%rax
   140127410:	vzeroupper
   140127413:	sub    %rdx,%rsi
   140127416:	sub    %r15,%rbp
   140127419:	sub    %rdx,%rax
   14012741c:	mov    %rsi,%rdi
   14012741f:	mov    %rbp,0x1038(%rbx)
   140127426:	sar    $0x3,%rdi
   14012742a:	cmp    %rsi,%rax
   14012742d:	jb     14012d435 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99c5>
   140127433:	vmovdqa 0x2356a5(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012743b:	mov    %rdi,0x1060(%rbx)
   140127442:	mov    %r14,%rdx
   140127445:	mov    %rbx,%rcx
   140127448:	movb   $0x0,0x153a0(%rbx)
   14012744f:	vmovdqa %xmm0,0x15390(%rbx)
   140127457:	call   140104460 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   14012745c:	mov    0x1060(%rbx),%rax
   140127463:	mov    0x1048(%rbx),%rdx
   14012746a:	mov    0x1038(%rbx),%rcx
   140127471:	mov    0x150c0(%rbx),%r13
   140127478:	lea    (%rdx,%rax,8),%rsi
   14012747c:	mov    0x1050(%rbx),%rax
   140127483:	add    %r15,%rcx
   140127486:	mov    %rax,0x38(%rsp)
   14012748b:	test   %r13,%r13
   14012748e:	je     14012749d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a2d>
   140127490:	lea    -0x5(%r13,%r13,4),%r8
   140127495:	mov    0x10c8(%rbx,%r8,8),%r13
   14012749d:	cmpb   $0x0,0x1040(%rbx)
   1401274a4:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401274aa:	movzbl (%rcx),%eax
   1401274ad:	lea    0x298bec(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274b4:	lea    0x1(%rcx),%rbp
   1401274b8:	xor    %r12d,%r12d
   1401274bb:	mov    (%rdi,%rax,8),%rax
   1401274bf:	jmp    *%rax
   1401274c1:	cmp    $0x2,%r12b
   1401274c5:	je     14012bae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8073>
   1401274cb:	cmp    $0x1,%r12b
   1401274cf:	je     14012e0db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa66b>
   1401274d5:	mov    0x1048(%rbx),%rdx
   1401274dc:	mov    0x1050(%rbx),%rax
   1401274e3:	vzeroupper
   1401274e6:	sub    %rdx,%rsi
   1401274e9:	sub    %r15,%rbp
   1401274ec:	sub    %rdx,%rax
   1401274ef:	mov    %rsi,%rdi
   1401274f2:	mov    %rbp,0x1038(%rbx)
   1401274f9:	sar    $0x3,%rdi
   1401274fd:	cmp    %rsi,%rax
   140127500:	jb     14012d44a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99da>
   140127506:	vmovdqa 0x2355d2(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012750e:	mov    %rdi,0x1060(%rbx)
   140127515:	mov    %r14,%rdx
   140127518:	mov    %rbx,%rcx
   14012751b:	movb   $0x0,0x153a0(%rbx)
   140127522:	vmovdqa %xmm0,0x15390(%rbx)
   14012752a:	call   140103920 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   14012752f:	mov    0x1060(%rbx),%rax
   140127536:	mov    0x1048(%rbx),%rdx
   14012753d:	mov    0x1038(%rbx),%rcx
   140127544:	mov    0x150c0(%rbx),%r13
   14012754b:	lea    (%rdx,%rax,8),%rsi
   14012754f:	mov    0x1050(%rbx),%rax
   140127556:	add    %r15,%rcx
   140127559:	mov    %rax,0x38(%rsp)
   14012755e:	test   %r13,%r13
   140127561:	je     140127570 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b00>
   140127563:	lea    -0x5(%r13,%r13,4),%r8
   140127568:	mov    0x10c8(%rbx,%r8,8),%r13
   140127570:	cmpb   $0x0,0x1040(%rbx)
   140127577:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012757d:	movzbl (%rcx),%eax
   140127580:	lea    0x298b19(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127587:	lea    0x1(%rcx),%rbp
   14012758b:	xor    %r12d,%r12d
   14012758e:	mov    (%rdi,%rax,8),%rax
   140127592:	jmp    *%rax
   140127594:	cmp    $0x2,%r12b
   140127598:	je     14012bb22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80b2>
   14012759e:	cmp    $0x1,%r12b
   1401275a2:	je     14012e1a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa737>
   1401275a8:	mov    0x1048(%rbx),%rdx
   1401275af:	mov    0x1050(%rbx),%rax
   1401275b6:	vzeroupper
   1401275b9:	sub    %rdx,%rsi
   1401275bc:	sub    %r15,%rbp
   1401275bf:	sub    %rdx,%rax
   1401275c2:	mov    %rsi,%rdi
   1401275c5:	mov    %rbp,0x1038(%rbx)
   1401275cc:	sar    $0x3,%rdi
   1401275d0:	cmp    %rsi,%rax
   1401275d3:	jb     14012d420 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99b0>
   1401275d9:	vmovdqa 0x2354ff(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401275e1:	mov    %rdi,0x1060(%rbx)
   1401275e8:	mov    %r14,%rdx
   1401275eb:	mov    %rbx,%rcx
   1401275ee:	movb   $0x0,0x153a0(%rbx)
   1401275f5:	vmovdqa %xmm0,0x15390(%rbx)
   1401275fd:	call   14010d0e0 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   140127602:	mov    0x1060(%rbx),%rax
   140127609:	mov    0x1048(%rbx),%rdx
   140127610:	mov    0x1038(%rbx),%rcx
   140127617:	mov    0x150c0(%rbx),%r13
   14012761e:	lea    (%rdx,%rax,8),%rsi
   140127622:	mov    0x1050(%rbx),%rax
   140127629:	add    %r15,%rcx
   14012762c:	mov    %rax,0x38(%rsp)
   140127631:	test   %r13,%r13
   140127634:	je     140127643 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bd3>
   140127636:	lea    -0x5(%r13,%r13,4),%r8
   14012763b:	mov    0x10c8(%rbx,%r8,8),%r13
   140127643:	cmpb   $0x0,0x1040(%rbx)
   14012764a:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140127650:	movzbl (%rcx),%eax
   140127653:	lea    0x298a46(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012765a:	lea    0x1(%rcx),%rbp
   14012765e:	xor    %r12d,%r12d
   140127661:	mov    (%rdi,%rax,8),%rax
   140127665:	jmp    *%rax
   140127667:	cmp    $0x2,%r12b
   14012766b:	je     14012b93e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ece>
   140127671:	cmp    $0x1,%r12b
   140127675:	je     14012de23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3b3>
   14012767b:	mov    0x1048(%rbx),%rdx
   140127682:	mov    0x1050(%rbx),%rax
   140127689:	vzeroupper
   14012768c:	sub    %rdx,%rsi
   14012768f:	sub    %r15,%rbp
   140127692:	sub    %rdx,%rax
   140127695:	mov    %rsi,%rdi
   140127698:	mov    %rbp,0x1038(%rbx)
   14012769f:	sar    $0x3,%rdi
   1401276a3:	cmp    %rsi,%rax
   1401276a6:	jb     14012d546 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ad6>
   1401276ac:	vmovdqa 0x23542c(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401276b4:	mov    %rdi,0x1060(%rbx)
   1401276bb:	mov    %r14,%rdx
   1401276be:	mov    %rbx,%rcx
   1401276c1:	movb   $0x0,0x153a0(%rbx)
   1401276c8:	vmovdqa %xmm0,0x15390(%rbx)
   1401276d0:	call   140101460 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   1401276d5:	mov    0x1060(%rbx),%rax
   1401276dc:	mov    0x1048(%rbx),%rdx
   1401276e3:	mov    0x1038(%rbx),%rcx
   1401276ea:	mov    0x150c0(%rbx),%r13
   1401276f1:	lea    (%rdx,%rax,8),%rsi
   1401276f5:	mov    0x1050(%rbx),%rax
   1401276fc:	add    %r15,%rcx
   1401276ff:	mov    %rax,0x38(%rsp)
   140127704:	test   %r13,%r13
   140127707:	je     140127716 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ca6>
   140127709:	lea    -0x5(%r13,%r13,4),%r8
   14012770e:	mov    0x10c8(%rbx,%r8,8),%r13
   140127716:	cmpb   $0x0,0x1040(%rbx)
   14012771d:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140127723:	movzbl (%rcx),%eax
   140127726:	lea    0x298973(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012772d:	lea    0x1(%rcx),%rbp
   140127731:	xor    %r12d,%r12d
   140127734:	mov    (%rdi,%rax,8),%rax
   140127738:	jmp    *%rax
   14012773a:	movzwl 0x0(%rbp),%edi
   14012773e:	lea    0x2(%rbp),%r8
   140127742:	add    %r13,%rdi
   140127745:	cmp    0x15268(%rbx),%rdi
   14012774c:	jae    14012f5e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb76>
   140127752:	mov    0x1070(%rbx),%rax
   140127759:	sub    0x1068(%rbx),%rax
   140127760:	sar    $0x3,%rax
   140127764:	cmp    %rax,%rdi
   140127767:	jae    1401301d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc765>
   14012776d:	mov    0x1068(%rbx),%rax
   140127774:	cmp    $0x1,%r12b
   140127778:	jne    1401301ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc74a>
   14012777e:	mov    0x1c8(%rsp),%rdx
   140127786:	xor    %r12d,%r12d
   140127789:	mov    %rdx,(%rax,%rdi,8)
   14012778d:	cmpb   $0x0,0x1040(%rbx)
   140127794:	je     14012a4bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a4c>
   14012779a:	movzbl 0x2(%rbp),%eax
   14012779e:	lea    0x2988fb(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401277a5:	add    $0x3,%rbp
   1401277a9:	mov    (%rdi,%rax,8),%rax
   1401277ad:	jmp    *%rax
   1401277af:	movzwl 0x0(%rbp),%r9d
   1401277b4:	movzwl 0x2(%rbp),%eax
   1401277b8:	lea    0x4(%rbp),%rdi
   1401277bc:	mov    0x1068(%rbx),%r10
   1401277c3:	test   %r12b,%r12b
   1401277c6:	jne    140130182 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc712>
   1401277cc:	movzwl %r9w,%edx
   1401277d0:	movzwl %ax,%eax
   1401277d3:	add    %r13,%rdx
   1401277d6:	add    %r13,%rax
   1401277d9:	mov    (%r10,%rdx,8),%rdx
   1401277dd:	mov    (%r10,%rax,8),%rax
   1401277e1:	mov    %rdx,0x1d0(%rsp)
   1401277e9:	mov    %rax,0x1c8(%rsp)
   1401277f1:	cmpb   $0x0,0x1040(%rbx)
   1401277f8:	je     140130170 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc700>
   1401277fe:	movzbl 0x4(%rbp),%eax
   140127802:	mov    $0x2,%r12d
   140127808:	add    $0x5,%rbp
   14012780c:	lea    0x29888d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127813:	mov    (%rdi,%rax,8),%rax
   140127817:	jmp    *%rax
   140127819:	movzwl 0x4(%rbp),%r8d
   14012781e:	lea    0x6(%rbp),%rax
   140127822:	movzwl 0x0(%rbp),%r10d
   140127827:	mov    %rax,0x40(%rsp)
   14012782c:	movzwl 0x2(%rbp),%r9d
   140127831:	lea    (%r8,%r13,1),%rdi
   140127835:	cmp    0x15268(%rbx),%rdi
   14012783c:	jae    14012fe08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc398>
   140127842:	mov    0x1070(%rbx),%rax
   140127849:	sub    0x1068(%rbx),%rax
   140127850:	sar    $0x3,%rax
   140127854:	cmp    %rax,%rdi
   140127857:	jae    14012f813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbda3>
   14012785d:	mov    0x1068(%rbx),%rax
   140127864:	movzwl %r10w,%edx
   140127868:	movabs $0xfff8000000000000,%r10
   140127872:	add    %r13,%rdx
   140127875:	lea    (%rax,%rdx,8),%rcx
   140127879:	movzwl %r9w,%edx
   14012787d:	movabs $0xffff000000000000,%r9
   140127887:	mov    (%rcx),%r8
   14012788a:	add    %r13,%rdx
   14012788d:	lea    (%rax,%rdx,8),%r11
   140127891:	mov    %r8,%rdx
   140127894:	and    %r9,%rdx
   140127897:	cmp    %r10,%rdx
   14012789a:	je     14012ba64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ff4>
   1401278a0:	mov    %r11,%rdx
   1401278a3:	vzeroupper
   1401278a6:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   1401278ab:	mov    0x1068(%rbx),%rdx
   1401278b2:	mov    %rax,(%rdx,%rdi,8)
   1401278b6:	cmpb   $0x0,0x1040(%rbx)
   1401278bd:	je     14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   1401278c3:	movzbl 0x6(%rbp),%eax
   1401278c7:	lea    0x2987d2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401278ce:	add    $0x7,%rbp
   1401278d2:	mov    (%rdi,%rax,8),%rax
   1401278d6:	jmp    *%rax
   1401278d8:	movzwl 0x6(%rbp),%edx
   1401278dc:	lea    0x8(%rbp),%rdi
   1401278e0:	movzwl 0x0(%rbp),%r10d
   1401278e5:	mov    %rdi,0xa0(%rsp)
   1401278ed:	movzwl 0x2(%rbp),%r9d
   1401278f2:	movzwl 0x4(%rbp),%eax
   1401278f6:	lea    (%rdx,%r13,1),%rdi
   1401278fa:	cmp    0x15268(%rbx),%rdi
   140127901:	jae    14012fd9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc32d>
   140127907:	mov    0x1070(%rbx),%rcx
   14012790e:	sub    0x1068(%rbx),%rcx
   140127915:	sar    $0x3,%rcx
   140127919:	cmp    %rcx,%rdi
   14012791c:	jae    14012fe70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc400>
   140127922:	mov    0x1068(%rbx),%r8
   140127929:	movzwl %r10w,%edx
   14012792d:	movzwl %ax,%eax
   140127930:	add    %r13,%rdx
   140127933:	add    %r13,%rax
   140127936:	lea    (%r8,%rdx,8),%r11
   14012793a:	movzwl %r9w,%edx
   14012793e:	lea    (%r8,%rax,8),%rax
   140127942:	mov    (%r11),%r9
   140127945:	add    %r13,%rdx
   140127948:	mov    %rax,0x40(%rsp)
   14012794d:	movabs $0xfff8000000000000,%rax
   140127957:	lea    (%r8,%rdx,8),%rcx
   14012795b:	movabs $0xffff000000000000,%rdx
   140127965:	mov    %r9,%r10
   140127968:	mov    %rcx,0x60(%rsp)
   14012796d:	and    %rdx,%r10
   140127970:	cmp    %rax,%r10
   140127973:	jne    14012fac8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc058>
   140127979:	mov    (%rcx),%rcx
   14012797c:	mov    %rcx,%rax
   14012797f:	and    %rdx,%rax
   140127982:	cmp    %r10,%rax
   140127985:	jne    14012cad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9062>
   14012798b:	mov    0x40(%rsp),%r10
   140127990:	mov    (%r10),%r10
   140127993:	and    %r10,%rdx
   140127996:	cmp    %rax,%rdx
   140127999:	jne    14012cad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9062>
   14012799f:	shl    $0x10,%rcx
   1401279a3:	mov    %r9,%rax
   1401279a6:	shl    $0x10,%r10
   1401279aa:	shl    $0x10,%rax
   1401279ae:	sar    $0x10,%rcx
   1401279b2:	sar    $0x10,%rax
   1401279b6:	sar    $0x10,%r10
   1401279ba:	imul   %rcx,%rax
   1401279be:	movabs $0x800000000000,%rcx
   1401279c8:	add    %r10,%rax
   1401279cb:	movabs $0xffffffffffff,%r10
   1401279d5:	add    %rax,%rcx
   1401279d8:	cmp    %rcx,%r10
   1401279db:	jb     14012cad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9062>
   1401279e1:	and    %r10,%rax
   1401279e4:	or     %rdx,%rax
   1401279e7:	mov    %rax,(%r8,%rdi,8)
   1401279eb:	cmpb   $0x0,0x1040(%rbx)
   1401279f2:	je     14012d2cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x985b>
   1401279f8:	movzbl 0x8(%rbp),%eax
   1401279fc:	lea    0x29869d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a03:	add    $0x9,%rbp
   140127a07:	mov    (%rdi,%rax,8),%rax
   140127a0b:	jmp    *%rax
   140127a0d:	lea    0x2(%rbp),%rax
   140127a11:	movzwl 0x0(%rbp),%edx
   140127a15:	mov    %rax,0x40(%rsp)
   140127a1a:	mov    0xb8(%r14),%rax
   140127a21:	lea    (%rax,%rdx,8),%r9
   140127a25:	cmp    $0x2,%r12b
   140127a29:	jne    140130103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc693>
   140127a2f:	mov    0x1d0(%rsp),%rdi
   140127a37:	movabs $0xffff000000000000,%rax
   140127a41:	movabs $0xfffd000000000000,%rdx
   140127a4b:	and    %rdi,%rax
   140127a4e:	cmp    %rdx,%rax
   140127a51:	je     14012c81c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dac>
   140127a57:	mov    0x1c8(%rsp),%rax
   140127a5f:	xor    %r12d,%r12d
   140127a62:	mov    %rax,0x3f0(%rsp)
   140127a6a:	cmpb   $0x0,0x1040(%rbx)
   140127a71:	je     14012cabe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   140127a77:	movzbl 0x2(%rbp),%eax
   140127a7b:	lea    0x29861e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a82:	add    $0x3,%rbp
   140127a86:	mov    (%rdi,%rax,8),%rax
   140127a8a:	jmp    *%rax
   140127a8c:	lea    0x3(%rbp),%rax
   140127a90:	movzbl 0x2(%rbp),%edi
   140127a94:	mov    %rax,0x60(%rsp)
   140127a99:	movzwl 0x0(%rbp),%eax
   140127a9d:	shl    $0x4,%rax
   140127aa1:	add    0xd0(%r14),%rax
   140127aa8:	mov    %rax,0x40(%rsp)
   140127aad:	test   %dil,%dil
   140127ab0:	jne    14012a563 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6af3>
   140127ab6:	lea    -0x8(%rsi),%rdx
   140127aba:	lea    0x1c8(%rsp),%rax
   140127ac2:	test   %r12b,%r12b
   140127ac5:	cmove  %rdx,%rax
   140127ac9:	mov    (%rax),%rdx
   140127acc:	movabs $0xffffffff00000000,%rax
   140127ad6:	movabs $0xfffd000200000000,%rcx
   140127ae0:	and    %rdx,%rax
   140127ae3:	cmp    %rcx,%rax
   140127ae6:	je     14012f3b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb942>
   140127aec:	vzeroupper
   140127aef:	cmp    $0x2,%r12b
   140127af3:	je     14012d785 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d15>
   140127af9:	cmp    $0x1,%r12b
   140127afd:	je     14012dae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa073>
   140127b03:	mov    0x1048(%rbx),%rdx
   140127b0a:	mov    0x1050(%rbx),%rax
   140127b11:	mov    %rsi,%r8
   140127b14:	mov    0x60(%rsp),%rcx
   140127b19:	sub    %rdx,%r8
   140127b1c:	sub    %rdx,%rax
   140127b1f:	mov    %r8,%rsi
   140127b22:	sub    %r15,%rcx
   140127b25:	sar    $0x3,%rsi
   140127b29:	mov    %rcx,0x1038(%rbx)
   140127b30:	cmp    %r8,%rax
   140127b33:	jb     14012d770 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d00>
   140127b39:	mov    0x40(%rsp),%rax
   140127b3e:	movzbl %dil,%r9d
   140127b42:	mov    %r14,%rdx
   140127b45:	mov    %rbx,%rcx
   140127b48:	movb   $0x0,0x153a0(%rbx)
   140127b4f:	vmovdqa 0x234f89(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140127b57:	mov    %rsi,0x1060(%rbx)
   140127b5e:	movzwl 0xa(%rax),%r8d
   140127b63:	vmovdqa %xmm0,0x15390(%rbx)
   140127b6b:	call   1401148c0 <setun::VM::handle_invoke_method_direct(setun::Chunk const&, unsigned short, unsigned char)>
   140127b70:	mov    0x1038(%rbx),%rax
   140127b77:	mov    0x1060(%rbx),%rcx
   140127b7e:	mov    0x1048(%rbx),%rdx
   140127b85:	mov    0x150c0(%rbx),%r13
   140127b8c:	add    %r15,%rax
   140127b8f:	lea    (%rdx,%rcx,8),%rsi
   140127b93:	test   %r13,%r13
   140127b96:	je     140127ba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4135>
   140127b98:	lea    -0x5(%r13,%r13,4),%rcx
   140127b9d:	mov    0x10c8(%rbx,%rcx,8),%r13
   140127ba5:	cmpb   $0x0,0x1040(%rbx)
   140127bac:	je     14012f634 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbc4>
   140127bb2:	mov    0x1050(%rbx),%rdi
   140127bb9:	lea    0x1(%rax),%rbp
   140127bbd:	movzbl (%rax),%eax
   140127bc0:	xor    %r12d,%r12d
   140127bc3:	mov    %rdi,0x38(%rsp)
   140127bc8:	lea    0x2984d1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127bcf:	mov    (%rdi,%rax,8),%rax
   140127bd3:	jmp    *%rax
   140127bd5:	movzwl 0x4(%rbp),%r8d
   140127bda:	lea    0x6(%rbp),%rdi
   140127bde:	movzwl 0x0(%rbp),%eax
   140127be2:	mov    %rdi,0x40(%rsp)
   140127be7:	movzwl 0x2(%rbp),%r10d
   140127bec:	lea    (%r8,%r13,1),%rdi
   140127bf0:	cmp    0x15268(%rbx),%rdi
   140127bf7:	jae    14012f63c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbcc>
   140127bfd:	mov    0x1070(%rbx),%rcx
   140127c04:	sub    0x1068(%rbx),%rcx
   140127c0b:	sar    $0x3,%rcx
   140127c0f:	cmp    %rcx,%rdi
   140127c12:	jae    1401309d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf65>
   140127c18:	mov    0x1068(%rbx),%r9
   140127c1f:	movzwl %ax,%eax
   140127c22:	movabs $0xffff000000000000,%rdx
   140127c2c:	add    %r13,%rax
   140127c2f:	lea    (%r9,%rax,8),%r8
   140127c33:	mov    (%r8),%rax
   140127c36:	and    %rax,%rdx
   140127c39:	mov    %rdx,%r11
   140127c3c:	movabs $0xfff8000000000000,%rdx
   140127c46:	cmp    %rdx,%r11
   140127c49:	jne    14012cc1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91af>
   140127c4f:	shl    $0x10,%rax
   140127c53:	movswq %r10w,%rdx
   140127c57:	movabs $0x800000000000,%rcx
   140127c61:	movabs $0xffffffffffff,%r10
   140127c6b:	sar    $0x10,%rax
   140127c6f:	add    %rdx,%rax
   140127c72:	add    %rax,%rcx
   140127c75:	cmp    %rcx,%r10
   140127c78:	jb     14012cc23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91b3>
   140127c7e:	and    %r10,%rax
   140127c81:	or     %r11,%rax
   140127c84:	mov    %rax,(%r9,%rdi,8)
   140127c88:	cmpb   $0x0,0x1040(%rbx)
   140127c8f:	je     14012cabe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   140127c95:	movzbl 0x6(%rbp),%eax
   140127c99:	lea    0x298400(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127ca0:	add    $0x7,%rbp
   140127ca4:	mov    (%rdi,%rax,8),%rax
   140127ca8:	jmp    *%rax
   140127caa:	movzwl 0x8(%rbp),%eax
   140127cae:	movzwl 0x0(%rbp),%edx
   140127cb2:	movabs $0xfffd000300000000,%r8
   140127cbc:	movzwl 0x2(%rbp),%r9d
   140127cc1:	movzwl 0x4(%rbp),%r11d
   140127cc6:	mov    %ax,0x40(%rsp)
   140127ccb:	lea    0xa(%rbp),%rax
   140127ccf:	add    %r13,%rdx
   140127cd2:	movzwl 0x6(%rbp),%r10d
   140127cd7:	mov    %rax,0x60(%rsp)
   140127cdc:	mov    0x1068(%rbx),%rax
   140127ce3:	lea    (%rax,%rdx,8),%rdi
   140127ce7:	movabs $0xffffffff00000000,%rdx
   140127cf1:	mov    (%rdi),%rcx
   140127cf4:	and    %rdx,%rcx
   140127cf7:	cmp    %r8,%rcx
   140127cfa:	je     14012ecd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb260>
   140127d00:	cmpb   $0x0,0x1040(%rbx)
   140127d07:	je     14012e650 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe0>
   140127d0d:	movzbl 0xa(%rbp),%eax
   140127d11:	lea    0x298388(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d18:	add    $0xb,%rbp
   140127d1c:	mov    (%rdi,%rax,8),%rax
   140127d20:	jmp    *%rax
   140127d22:	mov    0x1068(%rbx),%rax
   140127d29:	cmp    $0x1,%r12b
   140127d2d:	jne    140130680 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc10>
   140127d33:	mov    0x1c8(%rsp),%rdx
   140127d3b:	xor    %r12d,%r12d
   140127d3e:	mov    %rdx,(%rax,%r13,8)
   140127d42:	cmpb   $0x0,0x1040(%rbx)
   140127d49:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127d4f:	movzbl 0x0(%rbp),%eax
   140127d53:	lea    0x298346(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d5a:	add    $0x1,%rbp
   140127d5e:	mov    (%rdi,%rax,8),%rax
   140127d62:	jmp    *%rax
   140127d64:	mov    0x1068(%rbx),%rax
   140127d6b:	cmp    $0x1,%r12b
   140127d6f:	jne    1401300e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc677>
   140127d75:	mov    0x1c8(%rsp),%rdx
   140127d7d:	xor    %r12d,%r12d
   140127d80:	mov    %rdx,0x8(%rax,%r13,8)
   140127d85:	cmpb   $0x0,0x1040(%rbx)
   140127d8c:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127d92:	movzbl 0x0(%rbp),%eax
   140127d96:	lea    0x298303(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d9d:	add    $0x1,%rbp
   140127da1:	mov    (%rdi,%rax,8),%rax
   140127da5:	jmp    *%rax
   140127da7:	mov    0x1068(%rbx),%rax
   140127dae:	cmp    $0x1,%r12b
   140127db2:	jne    14012f714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbca4>
   140127db8:	mov    0x1c8(%rsp),%rdx
   140127dc0:	xor    %r12d,%r12d
   140127dc3:	mov    %rdx,0x10(%rax,%r13,8)
   140127dc8:	cmpb   $0x0,0x1040(%rbx)
   140127dcf:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127dd5:	movzbl 0x0(%rbp),%eax
   140127dd9:	lea    0x2982c0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127de0:	add    $0x1,%rbp
   140127de4:	mov    (%rdi,%rax,8),%rax
   140127de8:	jmp    *%rax
   140127dea:	mov    0x1068(%rbx),%rax
   140127df1:	cmp    $0x1,%r12b
   140127df5:	jne    14012f6f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc88>
   140127dfb:	mov    0x1c8(%rsp),%rdx
   140127e03:	xor    %r12d,%r12d
   140127e06:	mov    %rdx,0x18(%rax,%r13,8)
   140127e0b:	cmpb   $0x0,0x1040(%rbx)
   140127e12:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127e18:	movzbl 0x0(%rbp),%eax
   140127e1c:	lea    0x29827d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127e23:	add    $0x1,%rbp
   140127e27:	mov    (%rdi,%rax,8),%rax
   140127e2b:	jmp    *%rax
   140127e2d:	lea    -0x8(%rsi),%rdx
   140127e31:	lea    0x1c8(%rsp),%rax
   140127e39:	test   %r12b,%r12b
   140127e3c:	cmove  %rdx,%rax
   140127e40:	mov    0x1068(%rbx),%rdx
   140127e47:	mov    (%rax),%rax
   140127e4a:	mov    %rax,0x8(%rdx,%r13,8)
   140127e4f:	cmpb   $0x0,0x1040(%rbx)
   140127e56:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127e5c:	movzbl 0x0(%rbp),%eax
   140127e60:	lea    0x298239(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127e67:	add    $0x1,%rbp
   140127e6b:	mov    (%rdi,%rax,8),%rax
   140127e6f:	jmp    *%rax
   140127e71:	lea    -0x8(%rsi),%rdx
   140127e75:	lea    0x1c8(%rsp),%rax
   140127e7d:	test   %r12b,%r12b
   140127e80:	cmove  %rdx,%rax
   140127e84:	mov    0x1068(%rbx),%rdx
   140127e8b:	mov    (%rax),%rax
   140127e8e:	mov    %rax,0x10(%rdx,%r13,8)
   140127e93:	cmpb   $0x0,0x1040(%rbx)
   140127e9a:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127ea0:	movzbl 0x0(%rbp),%eax
   140127ea4:	lea    0x2981f5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127eab:	add    $0x1,%rbp
   140127eaf:	mov    (%rdi,%rax,8),%rax
   140127eb3:	jmp    *%rax
   140127eb5:	lea    -0x8(%rsi),%rdx
   140127eb9:	lea    0x1c8(%rsp),%rax
   140127ec1:	test   %r12b,%r12b
   140127ec4:	cmove  %rdx,%rax
   140127ec8:	mov    0x1068(%rbx),%rdx
   140127ecf:	mov    (%rax),%rax
   140127ed2:	mov    %rax,0x18(%rdx,%r13,8)
   140127ed7:	cmpb   $0x0,0x1040(%rbx)
   140127ede:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140127ee4:	movzbl 0x0(%rbp),%eax
   140127ee8:	lea    0x2981b1(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127eef:	add    $0x1,%rbp
   140127ef3:	mov    (%rdi,%rax,8),%rax
   140127ef7:	jmp    *%rax
   140127ef9:	movzwl 0x0(%rbp),%eax
   140127efd:	movzwl 0x2(%rbp),%edi
   140127f01:	lea    0x4(%rbp),%r9
   140127f05:	add    %r13,%rax
   140127f08:	cmp    0x15268(%rbx),%rax
   140127f0f:	jae    14012f6a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc30>
   140127f15:	mov    0x1068(%rbx),%rdx
   140127f1c:	movabs $0xfff8000000000000,%rcx
   140127f26:	lea    (%rdx,%rax,8),%r8
   140127f2a:	movabs $0xffff000000000000,%rdx
   140127f34:	mov    (%r8),%rax
   140127f37:	and    %rax,%rdx
   140127f3a:	cmp    %rcx,%rdx
   140127f3d:	jne    14012cbbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x914d>
   140127f43:	shl    $0x10,%rax
   140127f47:	movswq %di,%rcx
   140127f4b:	movabs $0x800000000000,%r10
   140127f55:	movabs $0xffffffffffff,%r11
   140127f5f:	sar    $0x10,%rax
   140127f63:	add    %rcx,%rax
   140127f66:	add    %rax,%r10
   140127f69:	cmp    %r10,%r11
   140127f6c:	jb     14012cbc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9151>
   140127f72:	and    %r11,%rax
   140127f75:	or     %rdx,%rax
   140127f78:	mov    %rax,(%r8)
   140127f7b:	cmpb   $0x0,0x1040(%rbx)
   140127f82:	je     140130d5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2eb>
   140127f88:	movzbl 0x4(%rbp),%eax
   140127f8c:	lea    0x29810d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127f93:	add    $0x5,%rbp
   140127f97:	mov    (%rdi,%rax,8),%rax
   140127f9b:	jmp    *%rax
   140127f9d:	movabs $0xfffb000000000000,%rax
   140127fa7:	mov    %rax,0x330(%rsp)
   140127faf:	mov    %rax,0x338(%rsp)
   140127fb7:	cmp    $0x2,%r12b
   140127fbb:	jne    14012f7b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd49>
   140127fc1:	mov    0x1c8(%rsp),%rax
   140127fc9:	xor    %r12d,%r12d
   140127fcc:	mov    %rax,0x338(%rsp)
   140127fd4:	mov    0x1d0(%rsp),%rax
   140127fdc:	mov    %rax,0x330(%rsp)
   140127fe4:	movabs $0xffffffff00000000,%rax
   140127fee:	movabs $0xfffd000300000000,%rdx
   140127ff8:	and    0x330(%rsp),%rax
   140128000:	cmp    %rdx,%rax
   140128003:	je     14012eba1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb131>
   140128009:	mov    0x330(%rsp),%rdx
   140128011:	movabs $0xffff000000000000,%rax
   14012801b:	movabs $0xfffd000000000000,%rcx
   140128025:	and    %rdx,%rax
   140128028:	cmp    %rcx,%rax
   14012802b:	je     14012c6d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c69>
   140128031:	test   %r12b,%r12b
   140128034:	je     14012d6af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c3f>
   14012803a:	cmp    $0x1,%r12b
   14012803e:	je     14012feed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc47d>
   140128044:	lea    0x8(%rsi),%r8
   140128048:	cmp    0x38(%rsp),%r8
   14012804d:	jae    140133e04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10394>
   140128053:	mov    0x1d0(%rsp),%rax
   14012805b:	mov    %rax,(%rsi)
   14012805e:	mov    0x1c8(%rsp),%rax
   140128066:	mov    %rax,0x1d0(%rsp)
   14012806e:	movabs $0xfff8000000000000,%rax
   140128078:	mov    %rax,0x1c8(%rsp)
   140128080:	mov    %r8,%rsi
   140128083:	mov    $0x2,%r12d
   140128089:	cmpb   $0x0,0x1040(%rbx)
   140128090:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   140128096:	movzbl 0x0(%rbp),%eax
   14012809a:	lea    0x297fff(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401280a1:	add    $0x1,%rbp
   1401280a5:	mov    (%rdi,%rax,8),%rax
   1401280a9:	jmp    *%rax
   1401280ab:	movabs $0xfffb000000000000,%rax
   1401280b5:	mov    %rax,0x340(%rsp)
   1401280bd:	mov    %rax,0x348(%rsp)
   1401280c5:	cmp    $0x1,%r12b
   1401280c9:	jne    1401302ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc87d>
   1401280cf:	mov    0x1c8(%rsp),%rax
   1401280d7:	xor    %r12d,%r12d
   1401280da:	mov    %rax,0x340(%rsp)
   1401280e2:	mov    -0x8(%rsi),%rax
   1401280e6:	sub    $0x10,%rsi
   1401280ea:	mov    %rax,0x348(%rsp)
   1401280f2:	mov    (%rsi),%r8
   1401280f5:	movabs $0xffff000000000000,%rdx
   1401280ff:	mov    %r8,%rcx
   140128102:	movabs $0xfffd000000000000,%rax
   14012810c:	and    %rdx,%rcx
   14012810f:	cmp    %rax,%rcx
   140128112:	je     14012b63f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bcf>
   140128118:	cmpb   $0x0,0x1040(%rbx)
   14012811f:	je     14012e428 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b8>
   140128125:	movzbl 0x0(%rbp),%eax
   140128129:	lea    0x297f70(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128130:	add    $0x1,%rbp
   140128134:	mov    (%rdi,%rax,8),%rax
   140128138:	jmp    *%rax
   14012813a:	movzwl 0x2(%rbp),%eax
   14012813e:	movzwl 0x4(%rbp),%edi
   140128142:	movzwl 0x6(%rbp),%ecx
   140128146:	mov    0x1068(%rbx),%rdx
   14012814d:	mov    %ax,0x60(%rsp)
   140128152:	movzwl 0x0(%rbp),%eax
   140128156:	mov    %di,0x40(%rsp)
   14012815b:	lea    0x8(%rbp),%rdi
   14012815f:	mov    %cx,0x80(%rsp)
   140128167:	add    %r13,%rax
   14012816a:	lea    (%rdx,%rax,8),%rcx
   14012816e:	vzeroupper
   140128171:	call   14021aa80 <setun::VMValue::as_int() const>
   140128176:	mov    0x1068(%rbx),%rdx
   14012817d:	mov    %rax,0xa0(%rsp)
   140128185:	movzwl 0x60(%rsp),%eax
   14012818a:	add    %r13,%rax
   14012818d:	lea    (%rdx,%rax,8),%rcx
   140128191:	call   14021aa80 <setun::VMValue::as_int() const>
   140128196:	mov    0x1068(%rbx),%rdx
   14012819d:	mov    %rax,%rbp
   1401281a0:	movzwl 0x40(%rsp),%eax
   1401281a5:	add    %r13,%rax
   1401281a8:	lea    (%rdx,%rax,8),%rcx
   1401281ac:	call   14021aa80 <setun::VMValue::as_int() const>
   1401281b1:	test   %rax,%rax
   1401281b4:	je     14012f970 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf00>
   1401281ba:	jle    14012a704 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c94>
   1401281c0:	cmp    %rbp,0xa0(%rsp)
   1401281c8:	setl   %dl
   1401281cb:	movswq 0x80(%rsp),%rax
   1401281d4:	add    %rdi,%rax
   1401281d7:	test   %dl,%dl
   1401281d9:	cmove  %rax,%rdi
   1401281dd:	cmpb   $0x0,0x1040(%rbx)
   1401281e4:	je     14012e6c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac56>
   1401281ea:	movzbl (%rdi),%eax
   1401281ed:	lea    0x1(%rdi),%rbp
   1401281f1:	lea    0x297ea8(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401281f8:	jmp    *(%rdi,%rax,8)
   1401281fb:	movabs $0xfffb000000000000,%rax
   140128205:	mov    %rax,0x358(%rsp)
   14012820d:	mov    %rax,0x360(%rsp)
   140128215:	cmp    $0x2,%r12b
   140128219:	jne    14012feaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc43a>
   14012821f:	mov    0x1c8(%rsp),%rax
   140128227:	mov    $0x1,%r12d
   14012822d:	mov    %rax,0x360(%rsp)
   140128235:	mov    0x1d0(%rsp),%rax
   14012823d:	mov    %rax,0x358(%rsp)
   140128245:	mov    0x358(%rsp),%rdx
   14012824d:	movabs $0xffff000000000000,%rax
   140128257:	movabs $0xfff8000000000000,%rcx
   140128261:	mov    %rdx,%r8
   140128264:	and    %rax,%r8
   140128267:	cmp    %rcx,%r8
   14012826a:	je     14012a831 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dc1>
   140128270:	movb   $0x20,-0x1(%rbp)
   140128274:	lea    0x360(%rsp),%rdx
   14012827c:	lea    0x358(%rsp),%rcx
   140128284:	vzeroupper
   140128287:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   14012828c:	mov    %rax,0x1c8(%rsp)
   140128294:	cmpb   $0x0,0x1040(%rbx)
   14012829b:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401282a1:	movzbl 0x0(%rbp),%eax
   1401282a5:	lea    0x297df4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401282ac:	add    $0x1,%rbp
   1401282b0:	mov    (%rdi,%rax,8),%rax
   1401282b4:	jmp    *%rax
   1401282b6:	movabs $0xfffb000000000000,%rax
   1401282c0:	mov    %rax,0x368(%rsp)
   1401282c8:	mov    %rax,0x370(%rsp)
   1401282d0:	cmp    $0x2,%r12b
   1401282d4:	jne    140130a65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcff5>
   1401282da:	mov    0x1c8(%rsp),%rax
   1401282e2:	mov    $0x1,%r12d
   1401282e8:	mov    %rax,0x370(%rsp)
   1401282f0:	mov    0x1d0(%rsp),%rax
   1401282f8:	mov    %rax,0x368(%rsp)
   140128300:	mov    0x368(%rsp),%rax
   140128308:	movabs $0xffff000000000000,%rdx
   140128312:	movabs $0xfff8000000000000,%r8
   14012831c:	mov    %rax,%rcx
   14012831f:	and    %rdx,%rcx
   140128322:	cmp    %r8,%rcx
   140128325:	je     14012a8a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e38>
   14012832b:	movb   $0x21,-0x1(%rbp)
   14012832f:	lea    0x370(%rsp),%rdx
   140128337:	lea    0x368(%rsp),%rcx
   14012833f:	vzeroupper
   140128342:	call   14021a7a0 <setun::VMValue::sub(setun::VMValue const&) const>
   140128347:	mov    %rax,0x1c8(%rsp)
   14012834f:	cmpb   $0x0,0x1040(%rbx)
   140128356:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   14012835c:	movzbl 0x0(%rbp),%eax
   140128360:	lea    0x297d39(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128367:	add    $0x1,%rbp
   14012836b:	mov    (%rdi,%rax,8),%rax
   14012836f:	jmp    *%rax
   140128371:	movabs $0xfffb000000000000,%rax
   14012837b:	mov    %rax,0x378(%rsp)
   140128383:	mov    %rax,0x380(%rsp)
   14012838b:	cmp    $0x2,%r12b
   14012838f:	jne    14013069b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc2b>
   140128395:	mov    0x1c8(%rsp),%rax
   14012839d:	mov    $0x1,%r12d
   1401283a3:	mov    %rax,0x380(%rsp)
   1401283ab:	mov    0x1d0(%rsp),%rax
   1401283b3:	mov    %rax,0x378(%rsp)
   1401283bb:	mov    0x378(%rsp),%rdx
   1401283c3:	movabs $0xffff000000000000,%rax
   1401283cd:	movabs $0xfff8000000000000,%rcx
   1401283d7:	mov    %rdx,%r8
   1401283da:	and    %rax,%r8
   1401283dd:	cmp    %rcx,%r8
   1401283e0:	je     14012a98b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f1b>
   1401283e6:	movb   $0x22,-0x1(%rbp)
   1401283ea:	lea    0x380(%rsp),%rdx
   1401283f2:	lea    0x378(%rsp),%rcx
   1401283fa:	vzeroupper
   1401283fd:	call   140219f20 <setun::VMValue::mul(setun::VMValue const&) const>
   140128402:	mov    %rax,0x1c8(%rsp)
   14012840a:	cmpb   $0x0,0x1040(%rbx)
   140128411:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128417:	movzbl 0x0(%rbp),%eax
   14012841b:	lea    0x297c7e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128422:	add    $0x1,%rbp
   140128426:	mov    (%rdi,%rax,8),%rax
   14012842a:	jmp    *%rax
   14012842c:	movabs $0xfffb000000000000,%rax
   140128436:	mov    %rax,0x388(%rsp)
   14012843e:	mov    %rax,0x390(%rsp)
   140128446:	cmp    $0x2,%r12b
   14012844a:	jne    140130a35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfc5>
   140128450:	mov    0x1c8(%rsp),%rax
   140128458:	mov    $0x1,%r12d
   14012845e:	mov    %rax,0x390(%rsp)
   140128466:	mov    0x1d0(%rsp),%rax
   14012846e:	mov    %rax,0x388(%rsp)
   140128476:	mov    0x388(%rsp),%rcx
   14012847e:	movabs $0xffff000000000000,%rax
   140128488:	movabs $0xfff8000000000000,%r8
   140128492:	and    %rax,%rcx
   140128495:	cmp    %r8,%rcx
   140128498:	je     14012a922 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6eb2>
   14012849e:	movabs $0xffff000000000000,%rdx
   1401284a8:	movb   $0x32,-0x1(%rbp)
   1401284ac:	mov    0x388(%rsp),%rax
   1401284b4:	movabs $0xfff8000000000000,%r8
   1401284be:	mov    %rax,%rcx
   1401284c1:	and    %rdx,%rcx
   1401284c4:	cmp    %r8,%rcx
   1401284c7:	je     14012bfc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8552>
   1401284cd:	movabs $0xfffd000000000000,%r8
   1401284d7:	cmp    %r8,%rcx
   1401284da:	je     14012bfb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8545>
   1401284e0:	movabs $0xfff7ffffffffffff,%rcx
   1401284ea:	cmp    %rax,%rcx
   1401284ed:	jae    14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   1401284f3:	movabs $0xfffc000000000000,%r9
   1401284fd:	cmp    %r9,%rax
   140128500:	je     14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   140128506:	mov    0x390(%rsp),%rax
   14012850e:	cmp    %rax,%rcx
   140128511:	jae    14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   140128517:	cmp    %r9,%rax
   14012851a:	je     14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   140128520:	and    %rax,%rdx
   140128523:	cmp    %r8,%rdx
   140128526:	je     140131588 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb18>
   14012852c:	lea    0x388(%rsp),%rcx
   140128534:	vzeroupper
   140128537:	call   14021aa80 <setun::VMValue::as_int() const>
   14012853c:	lea    0x390(%rsp),%rcx
   140128544:	mov    %rax,%rdi
   140128547:	call   14021aa80 <setun::VMValue::as_int() const>
   14012854c:	cmp    %rax,%rdi
   14012854f:	setl   %al
   140128552:	movabs $0xfffa000000000000,%rdx
   14012855c:	movzbl %al,%eax
   14012855f:	add    %rdx,%rax
   140128562:	mov    %rax,0x1c8(%rsp)
   14012856a:	cmpb   $0x0,0x1040(%rbx)
   140128571:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128577:	movzbl 0x0(%rbp),%eax
   14012857b:	lea    0x297b1e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128582:	add    $0x1,%rbp
   140128586:	mov    (%rdi,%rax,8),%rax
   14012858a:	jmp    *%rax
   14012858c:	movabs $0xfffb000000000000,%rax
   140128596:	mov    %rax,0x398(%rsp)
   14012859e:	mov    %rax,0x3a0(%rsp)
   1401285a6:	cmp    $0x2,%r12b
   1401285aa:	jne    14012f5b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb46>
   1401285b0:	mov    0x1c8(%rsp),%rax
   1401285b8:	mov    $0x1,%r12d
   1401285be:	mov    %rax,0x3a0(%rsp)
   1401285c6:	mov    0x1d0(%rsp),%rax
   1401285ce:	mov    %rax,0x398(%rsp)
   1401285d6:	mov    0x398(%rsp),%rcx
   1401285de:	movabs $0xffff000000000000,%rax
   1401285e8:	movabs $0xfff8000000000000,%r8
   1401285f2:	and    %rax,%rcx
   1401285f5:	cmp    %r8,%rcx
   1401285f8:	je     14012b9fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f8b>
   1401285fe:	movabs $0xffff000000000000,%rdx
   140128608:	movb   $0x33,-0x1(%rbp)
   14012860c:	mov    0x398(%rsp),%rax
   140128614:	movabs $0xfff8000000000000,%r8
   14012861e:	mov    %rax,%rcx
   140128621:	and    %rdx,%rcx
   140128624:	cmp    %r8,%rcx
   140128627:	je     14012c317 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88a7>
   14012862d:	movabs $0xfffd000000000000,%r8
   140128637:	cmp    %r8,%rcx
   14012863a:	je     14012c30a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x889a>
   140128640:	movabs $0xfff7ffffffffffff,%rcx
   14012864a:	cmp    %rax,%rcx
   14012864d:	jae    14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   140128653:	movabs $0xfffc000000000000,%r9
   14012865d:	cmp    %r9,%rax
   140128660:	je     14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   140128666:	mov    0x3a0(%rsp),%rax
   14012866e:	cmp    %rax,%rcx
   140128671:	jae    14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   140128677:	cmp    %r9,%rax
   14012867a:	je     14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   140128680:	and    %rax,%rdx
   140128683:	cmp    %r8,%rdx
   140128686:	je     1401317be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd4e>
   14012868c:	lea    0x398(%rsp),%rcx
   140128694:	vzeroupper
   140128697:	call   14021aa80 <setun::VMValue::as_int() const>
   14012869c:	lea    0x3a0(%rsp),%rcx
   1401286a4:	mov    %rax,%rdi
   1401286a7:	call   14021aa80 <setun::VMValue::as_int() const>
   1401286ac:	cmp    %rax,%rdi
   1401286af:	setle  %al
   1401286b2:	movabs $0xfffa000000000000,%rdx
   1401286bc:	movzbl %al,%eax
   1401286bf:	add    %rdx,%rax
   1401286c2:	mov    %rax,0x1c8(%rsp)
   1401286ca:	cmpb   $0x0,0x1040(%rbx)
   1401286d1:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   1401286d7:	movzbl 0x0(%rbp),%eax
   1401286db:	lea    0x2979be(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401286e2:	add    $0x1,%rbp
   1401286e6:	mov    (%rdi,%rax,8),%rax
   1401286ea:	jmp    *%rax
   1401286ec:	movabs $0xfffb000000000000,%rax
   1401286f6:	mov    %rax,0x3a8(%rsp)
   1401286fe:	mov    %rax,0x3b0(%rsp)
   140128706:	cmp    $0x2,%r12b
   14012870a:	jne    1401304c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca58>
   140128710:	mov    0x1c8(%rsp),%rax
   140128718:	mov    $0x1,%r12d
   14012871e:	mov    %rax,0x3b0(%rsp)
   140128726:	mov    0x1d0(%rsp),%rax
   14012872e:	mov    %rax,0x3a8(%rsp)
   140128736:	mov    0x3a8(%rsp),%rdx
   14012873e:	movabs $0xffff000000000000,%rax
   140128748:	movabs $0xfff8000000000000,%r8
   140128752:	and    %rax,%rdx
   140128755:	cmp    %r8,%rdx
   140128758:	je     14012bea5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8435>
   14012875e:	movabs $0xffff000000000000,%rdx
   140128768:	movb   $0x30,-0x1(%rbp)
   14012876c:	mov    0x3a8(%rsp),%rax
   140128774:	movabs $0xfff8000000000000,%r8
   14012877e:	mov    %rax,%rcx
   140128781:	and    %rdx,%rcx
   140128784:	cmp    %r8,%rcx
   140128787:	je     14012c434 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89c4>
   14012878d:	movabs $0xfffd000000000000,%r8
   140128797:	cmp    %r8,%rcx
   14012879a:	je     14012c427 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89b7>
   1401287a0:	movabs $0xfff7ffffffffffff,%rcx
   1401287aa:	cmp    %rax,%rcx
   1401287ad:	jae    14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   1401287b3:	movabs $0xfffc000000000000,%r9
   1401287bd:	cmp    %r9,%rax
   1401287c0:	je     14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   1401287c6:	mov    0x3b0(%rsp),%rax
   1401287ce:	cmp    %rax,%rcx
   1401287d1:	jae    14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   1401287d7:	cmp    %r9,%rax
   1401287da:	je     14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   1401287e0:	and    %rax,%rdx
   1401287e3:	cmp    %r8,%rdx
   1401287e6:	je     1401314d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda65>
   1401287ec:	lea    0x3a8(%rsp),%rcx
   1401287f4:	vzeroupper
   1401287f7:	call   14021aa80 <setun::VMValue::as_int() const>
   1401287fc:	lea    0x3b0(%rsp),%rcx
   140128804:	mov    %rax,%rdi
   140128807:	call   14021aa80 <setun::VMValue::as_int() const>
   14012880c:	cmp    %rax,%rdi
   14012880f:	sete   %dil
   140128813:	movabs $0xfffa000000000000,%rdx
   14012881d:	movzbl %dil,%eax
   140128821:	add    %rdx,%rax
   140128824:	mov    %rax,0x1c8(%rsp)
   14012882c:	cmpb   $0x0,0x1040(%rbx)
   140128833:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128839:	movzbl 0x0(%rbp),%eax
   14012883d:	lea    0x29785c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128844:	add    $0x1,%rbp
   140128848:	mov    (%rdi,%rax,8),%rax
   14012884c:	jmp    *%rax
   14012884e:	movabs $0xfffb000000000000,%rax
   140128858:	mov    %rax,0x3b8(%rsp)
   140128860:	mov    %rax,0x3c0(%rsp)
   140128868:	cmp    $0x2,%r12b
   14012886c:	jne    140130a05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf95>
   140128872:	mov    0x1c8(%rsp),%rax
   14012887a:	mov    $0x1,%r12d
   140128880:	mov    %rax,0x3c0(%rsp)
   140128888:	mov    0x1d0(%rsp),%rax
   140128890:	mov    %rax,0x3b8(%rsp)
   140128898:	mov    0x3b8(%rsp),%rcx
   1401288a0:	movabs $0xffff000000000000,%rax
   1401288aa:	movabs $0xfff8000000000000,%r8
   1401288b4:	and    %rax,%rcx
   1401288b7:	cmp    %r8,%rcx
   1401288ba:	je     14012b4f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a87>
   1401288c0:	movabs $0xffff000000000000,%rdx
   1401288ca:	movb   $0x34,-0x1(%rbp)
   1401288ce:	mov    0x3b8(%rsp),%rax
   1401288d6:	movabs $0xfff8000000000000,%r8
   1401288e0:	mov    %rax,%rcx
   1401288e3:	and    %rdx,%rcx
   1401288e6:	cmp    %r8,%rcx
   1401288e9:	je     14012c0dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x866d>
   1401288ef:	movabs $0xfffd000000000000,%r8
   1401288f9:	cmp    %r8,%rcx
   1401288fc:	je     14012c0d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8660>
   140128902:	movabs $0xfff7ffffffffffff,%rcx
   14012890c:	cmp    %rax,%rcx
   14012890f:	jae    14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   140128915:	movabs $0xfffc000000000000,%r9
   14012891f:	cmp    %r9,%rax
   140128922:	je     14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   140128928:	mov    0x3c0(%rsp),%rax
   140128930:	cmp    %rax,%rcx
   140128933:	jae    14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   140128939:	cmp    %r9,%rax
   14012893c:	je     14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   140128942:	and    %rax,%rdx
   140128945:	cmp    %r8,%rdx
   140128948:	je     140131702 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc92>
   14012894e:	lea    0x3b8(%rsp),%rcx
   140128956:	vzeroupper
   140128959:	call   14021aa80 <setun::VMValue::as_int() const>
   14012895e:	lea    0x3c0(%rsp),%rcx
   140128966:	mov    %rax,%rdi
   140128969:	call   14021aa80 <setun::VMValue::as_int() const>
   14012896e:	cmp    %rax,%rdi
   140128971:	setg   %al
   140128974:	movabs $0xfffa000000000000,%rdx
   14012897e:	movzbl %al,%eax
   140128981:	add    %rdx,%rax
   140128984:	mov    %rax,0x1c8(%rsp)
   14012898c:	cmpb   $0x0,0x1040(%rbx)
   140128993:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128999:	movzbl 0x0(%rbp),%eax
   14012899d:	lea    0x2976fc(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401289a4:	add    $0x1,%rbp
   1401289a8:	mov    (%rdi,%rax,8),%rax
   1401289ac:	jmp    *%rax
   1401289ae:	movabs $0xfffb000000000000,%rax
   1401289b8:	mov    %rax,0x3c8(%rsp)
   1401289c0:	mov    %rax,0x3d0(%rsp)
   1401289c8:	cmp    $0x2,%r12b
   1401289cc:	jne    1401304f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca88>
   1401289d2:	mov    0x1c8(%rsp),%rax
   1401289da:	mov    $0x1,%r12d
   1401289e0:	mov    %rax,0x3d0(%rsp)
   1401289e8:	mov    0x1d0(%rsp),%rax
   1401289f0:	mov    %rax,0x3c8(%rsp)
   1401289f8:	mov    0x3c8(%rsp),%rcx
   140128a00:	movabs $0xffff000000000000,%rax
   140128a0a:	movabs $0xfff8000000000000,%r8
   140128a14:	and    %rax,%rcx
   140128a17:	cmp    %r8,%rcx
   140128a1a:	je     14012bd83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8313>
   140128a20:	movabs $0xffff000000000000,%rdx
   140128a2a:	movb   $0x35,-0x1(%rbp)
   140128a2e:	mov    0x3c8(%rsp),%rax
   140128a36:	movabs $0xfff8000000000000,%r8
   140128a40:	mov    %rax,%rcx
   140128a43:	and    %rdx,%rcx
   140128a46:	cmp    %r8,%rcx
   140128a49:	je     14012c1fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x878a>
   140128a4f:	movabs $0xfffd000000000000,%r8
   140128a59:	cmp    %r8,%rcx
   140128a5c:	je     14012c1ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x877d>
   140128a62:	movabs $0xfff7ffffffffffff,%rcx
   140128a6c:	cmp    %rax,%rcx
   140128a6f:	jae    14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   140128a75:	movabs $0xfffc000000000000,%r9
   140128a7f:	cmp    %r9,%rax
   140128a82:	je     14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   140128a88:	mov    0x3d0(%rsp),%rax
   140128a90:	cmp    %r9,%rax
   140128a93:	je     14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   140128a99:	cmp    %rax,%rcx
   140128a9c:	jae    14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   140128aa2:	and    %rax,%rdx
   140128aa5:	cmp    %r8,%rdx
   140128aa8:	je     140131644 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbd4>
   140128aae:	lea    0x3c8(%rsp),%rcx
   140128ab6:	vzeroupper
   140128ab9:	call   14021aa80 <setun::VMValue::as_int() const>
   140128abe:	lea    0x3d0(%rsp),%rcx
   140128ac6:	mov    %rax,%rdi
   140128ac9:	call   14021aa80 <setun::VMValue::as_int() const>
   140128ace:	cmp    %rax,%rdi
   140128ad1:	setge  %al
   140128ad4:	movabs $0xfffa000000000000,%rdx
   140128ade:	movzbl %al,%eax
   140128ae1:	add    %rdx,%rax
   140128ae4:	mov    %rax,0x1c8(%rsp)
   140128aec:	cmpb   $0x0,0x1040(%rbx)
   140128af3:	je     14012a410 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a0>
   140128af9:	movzbl 0x0(%rbp),%eax
   140128afd:	lea    0x29759c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128b04:	add    $0x1,%rbp
   140128b08:	mov    (%rdi,%rax,8),%rax
   140128b0c:	jmp    *%rax
   140128b0e:	lea    0x2(%rbp),%rax
   140128b12:	movzwl 0x0(%rbp),%edx
   140128b16:	mov    %rax,0x60(%rsp)
   140128b1b:	mov    0xb8(%r14),%rax
   140128b22:	lea    (%rax,%rdx,8),%r9
   140128b26:	test   %r12b,%r12b
   140128b29:	je     1401303e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc979>
   140128b2f:	movabs $0xffffffff00000000,%rax
   140128b39:	movabs $0xfffd000200000000,%rdx
   140128b43:	and    0x1c8(%rsp),%rax
   140128b4b:	cmp    %rdx,%rax
   140128b4e:	je     14012ca40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fd0>
   140128b54:	cmp    $0x1,%r12b
   140128b58:	jne    14012cc82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9212>
   140128b5e:	mov    0x1c8(%rsp),%rax
   140128b66:	movabs $0xffff000000000000,%rdx
   140128b70:	movabs $0xfffd000000000000,%rcx
   140128b7a:	and    %rax,%rdx
   140128b7d:	mov    %rax,0x3e0(%rsp)
   140128b85:	cmp    %rcx,%rdx
   140128b88:	je     14012d7be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d4e>
   140128b8e:	mov    $0x1,%r12d
   140128b94:	movabs $0xfff8000000000000,%rax
   140128b9e:	mov    %rax,0x1c8(%rsp)
   140128ba6:	cmpb   $0x0,0x1040(%rbx)
   140128bad:	je     14012e650 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe0>
   140128bb3:	movzbl 0x2(%rbp),%eax
   140128bb7:	lea    0x2974e2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128bbe:	add    $0x3,%rbp
   140128bc2:	mov    (%rdi,%rax,8),%rax
   140128bc6:	jmp    *%rax
   140128bc8:	cmp    $0x2,%r12b
   140128bcc:	je     14012adbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x734d>
   140128bd2:	cmp    $0x1,%r12b
   140128bd6:	je     14012e141 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6d1>
   140128bdc:	mov    0x1048(%rbx),%rdx
   140128be3:	mov    0x1050(%rbx),%rax
   140128bea:	vzeroupper
   140128bed:	sub    %rdx,%rsi
   140128bf0:	sub    %r15,%rbp
   140128bf3:	sub    %rdx,%rax
   140128bf6:	mov    %rsi,%rdi
   140128bf9:	mov    %rbp,0x1038(%rbx)
   140128c00:	sar    $0x3,%rdi
   140128c04:	cmp    %rsi,%rax
   140128c07:	jb     14012d3e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9971>
   140128c0d:	vmovdqa 0x233ecb(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140128c15:	mov    %rdi,0x1060(%rbx)
   140128c1c:	mov    %r14,%rdx
   140128c1f:	mov    %rbx,%rcx
   140128c22:	movb   $0x0,0x153a0(%rbx)
   140128c29:	vmovdqa %xmm0,0x15390(%rbx)
   140128c31:	call   140101100 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   140128c36:	mov    0x1060(%rbx),%rax
   140128c3d:	mov    0x1048(%rbx),%rdx
   140128c44:	mov    0x1038(%rbx),%rcx
   140128c4b:	mov    0x150c0(%rbx),%r13
   140128c52:	lea    (%rdx,%rax,8),%rsi
   140128c56:	mov    0x1050(%rbx),%rax
   140128c5d:	add    %r15,%rcx
   140128c60:	mov    %rax,0x38(%rsp)
   140128c65:	test   %r13,%r13
   140128c68:	je     140128c77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5207>
   140128c6a:	lea    -0x5(%r13,%r13,4),%r8
   140128c6f:	mov    0x10c8(%rbx,%r8,8),%r13
   140128c77:	cmpb   $0x0,0x1040(%rbx)
   140128c7e:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140128c84:	movzbl (%rcx),%eax
   140128c87:	lea    0x297412(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128c8e:	lea    0x1(%rcx),%rbp
   140128c92:	xor    %r12d,%r12d
   140128c95:	mov    (%rdi,%rax,8),%rax
   140128c99:	jmp    *%rax
   140128c9b:	cmp    $0x2,%r12b
   140128c9f:	je     14012af73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7503>
   140128ca5:	cmp    $0x1,%r12b
   140128ca9:	je     14012e1da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa76a>
   140128caf:	mov    0x1048(%rbx),%rdx
   140128cb6:	mov    0x1050(%rbx),%rax
   140128cbd:	vzeroupper
   140128cc0:	sub    %rdx,%rsi
   140128cc3:	sub    %r15,%rbp
   140128cc6:	sub    %rdx,%rax
   140128cc9:	mov    %rsi,%rdi
   140128ccc:	mov    %rbp,0x1038(%rbx)
   140128cd3:	sar    $0x3,%rdi
   140128cd7:	cmp    %rsi,%rax
   140128cda:	jb     14012d69a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c2a>
   140128ce0:	vmovdqa 0x233df8(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140128ce8:	mov    %rdi,0x1060(%rbx)
   140128cef:	mov    %r14,%rdx
   140128cf2:	mov    %rbx,%rcx
   140128cf5:	movb   $0x0,0x153a0(%rbx)
   140128cfc:	vmovdqa %xmm0,0x15390(%rbx)
   140128d04:	call   140105bf0 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   140128d09:	mov    0x1060(%rbx),%rax
   140128d10:	mov    0x1048(%rbx),%rdx
   140128d17:	mov    0x1038(%rbx),%rcx
   140128d1e:	mov    0x150c0(%rbx),%r13
   140128d25:	lea    (%rdx,%rax,8),%rsi
   140128d29:	mov    0x1050(%rbx),%rax
   140128d30:	add    %r15,%rcx
   140128d33:	mov    %rax,0x38(%rsp)
   140128d38:	test   %r13,%r13
   140128d3b:	je     140128d4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52da>
   140128d3d:	lea    -0x5(%r13,%r13,4),%r8
   140128d42:	mov    0x10c8(%rbx,%r8,8),%r13
   140128d4a:	cmpb   $0x0,0x1040(%rbx)
   140128d51:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140128d57:	movzbl (%rcx),%eax
   140128d5a:	lea    0x29733f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128d61:	lea    0x1(%rcx),%rbp
   140128d65:	xor    %r12d,%r12d
   140128d68:	mov    (%rdi,%rax,8),%rax
   140128d6c:	jmp    *%rax
   140128d6e:	cmp    $0x2,%r12b
   140128d72:	je     14012b196 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7726>
   140128d78:	cmp    $0x1,%r12b
   140128d7c:	je     14012e240 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7d0>
   140128d82:	mov    0x1048(%rbx),%rdx
   140128d89:	mov    0x1050(%rbx),%rax
   140128d90:	vzeroupper
   140128d93:	sub    %rdx,%rsi
   140128d96:	sub    %r15,%rbp
   140128d99:	sub    %rdx,%rax
   140128d9c:	mov    %rsi,%rdi
   140128d9f:	mov    %rbp,0x1038(%rbx)
   140128da6:	sar    $0x3,%rdi
   140128daa:	cmp    %rsi,%rax
   140128dad:	jb     14012d55b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aeb>
   140128db3:	vmovdqa 0x233d25(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140128dbb:	mov    %rdi,0x1060(%rbx)
   140128dc2:	mov    %r14,%rdx
   140128dc5:	mov    %rbx,%rcx
   140128dc8:	movb   $0x0,0x153a0(%rbx)
   140128dcf:	vmovdqa %xmm0,0x15390(%rbx)
   140128dd7:	call   14010bfc0 <setun::VM::handle_println(setun::Chunk const&)>
   140128ddc:	mov    0x1060(%rbx),%rax
   140128de3:	mov    0x1048(%rbx),%rdx
   140128dea:	mov    0x1038(%rbx),%rcx
   140128df1:	mov    0x150c0(%rbx),%r13
   140128df8:	lea    (%rdx,%rax,8),%rsi
   140128dfc:	mov    0x1050(%rbx),%rax
   140128e03:	add    %r15,%rcx
   140128e06:	mov    %rax,0x38(%rsp)
   140128e0b:	test   %r13,%r13
   140128e0e:	je     140128e1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53ad>
   140128e10:	lea    -0x5(%r13,%r13,4),%r8
   140128e15:	mov    0x10c8(%rbx,%r8,8),%r13
   140128e1d:	cmpb   $0x0,0x1040(%rbx)
   140128e24:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140128e2a:	movzbl (%rcx),%eax
   140128e2d:	lea    0x29726c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128e34:	lea    0x1(%rcx),%rbp
   140128e38:	xor    %r12d,%r12d
   140128e3b:	mov    (%rdi,%rax,8),%rax
   140128e3f:	jmp    *%rax
   140128e41:	cmp    $0x2,%r12b
   140128e45:	je     14012ac23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71b3>
   140128e4b:	cmp    $0x1,%r12b
   140128e4f:	je     14012e2a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa836>
   140128e55:	mov    0x1048(%rbx),%rdx
   140128e5c:	mov    0x1050(%rbx),%rax
   140128e63:	vzeroupper
   140128e66:	sub    %rdx,%rsi
   140128e69:	sub    %r15,%rbp
   140128e6c:	sub    %rdx,%rax
   140128e6f:	mov    %rsi,%rdi
   140128e72:	mov    %rbp,0x1038(%rbx)
   140128e79:	sar    $0x3,%rdi
   140128e7d:	cmp    %rsi,%rax
   140128e80:	jb     14012d5d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b69>
   140128e86:	vmovdqa 0x233c52(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140128e8e:	mov    %rdi,0x1060(%rbx)
   140128e95:	mov    %r14,%rdx
   140128e98:	mov    %rbx,%rcx
   140128e9b:	movb   $0x0,0x153a0(%rbx)
   140128ea2:	vmovdqa %xmm0,0x15390(%rbx)
   140128eaa:	call   14010c770 <setun::VM::handle_trace(setun::Chunk const&)>
   140128eaf:	mov    0x1060(%rbx),%rax
   140128eb6:	mov    0x1048(%rbx),%rdx
   140128ebd:	mov    0x1038(%rbx),%rcx
   140128ec4:	mov    0x150c0(%rbx),%r13
   140128ecb:	lea    (%rdx,%rax,8),%rsi
   140128ecf:	mov    0x1050(%rbx),%rax
   140128ed6:	add    %r15,%rcx
   140128ed9:	mov    %rax,0x38(%rsp)
   140128ede:	test   %r13,%r13
   140128ee1:	je     140128ef0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5480>
   140128ee3:	lea    -0x5(%r13,%r13,4),%r8
   140128ee8:	mov    0x10c8(%rbx,%r8,8),%r13
   140128ef0:	cmpb   $0x0,0x1040(%rbx)
   140128ef7:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140128efd:	movzbl (%rcx),%eax
   140128f00:	lea    0x297199(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128f07:	lea    0x1(%rcx),%rbp
   140128f0b:	xor    %r12d,%r12d
   140128f0e:	mov    (%rdi,%rax,8),%rax
   140128f12:	jmp    *%rax
   140128f14:	cmp    $0x2,%r12b
   140128f18:	je     14012b0dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x766c>
   140128f1e:	cmp    $0x1,%r12b
   140128f22:	je     14012e30c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa89c>
   140128f28:	mov    0x1048(%rbx),%rdx
   140128f2f:	mov    0x1050(%rbx),%rax
   140128f36:	vzeroupper
   140128f39:	sub    %rdx,%rsi
   140128f3c:	sub    %r15,%rbp
   140128f3f:	sub    %rdx,%rax
   140128f42:	mov    %rsi,%rdi
   140128f45:	mov    %rbp,0x1038(%rbx)
   140128f4c:	sar    $0x3,%rdi
   140128f50:	cmp    %rsi,%rax
   140128f53:	jb     14012d585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b15>
   140128f59:	vmovdqa 0x233b7f(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140128f61:	mov    %rdi,0x1060(%rbx)
   140128f68:	mov    %r14,%rdx
   140128f6b:	mov    %rbx,%rcx
   140128f6e:	movb   $0x0,0x153a0(%rbx)
   140128f75:	vmovdqa %xmm0,0x15390(%rbx)
   140128f7d:	call   1401110d0 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   140128f82:	mov    0x1060(%rbx),%rax
   140128f89:	mov    0x1048(%rbx),%rdx
   140128f90:	mov    0x1038(%rbx),%rcx
   140128f97:	mov    0x150c0(%rbx),%r13
   140128f9e:	lea    (%rdx,%rax,8),%rsi
   140128fa2:	mov    0x1050(%rbx),%rax
   140128fa9:	add    %r15,%rcx
   140128fac:	mov    %rax,0x38(%rsp)
   140128fb1:	test   %r13,%r13
   140128fb4:	je     140128fc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5553>
   140128fb6:	lea    -0x5(%r13,%r13,4),%r8
   140128fbb:	mov    0x10c8(%rbx,%r8,8),%r13
   140128fc3:	cmpb   $0x0,0x1040(%rbx)
   140128fca:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140128fd0:	movzbl (%rcx),%eax
   140128fd3:	lea    0x2970c6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128fda:	lea    0x1(%rcx),%rbp
   140128fde:	xor    %r12d,%r12d
   140128fe1:	mov    (%rdi,%rax,8),%rax
   140128fe5:	jmp    *%rax
   140128fe7:	cmp    $0x2,%r12b
   140128feb:	je     14012aeb9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7449>
   140128ff1:	cmp    $0x1,%r12b
   140128ff5:	je     14012ddf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa380>
   140128ffb:	mov    0x1048(%rbx),%rdx
   140129002:	mov    0x1050(%rbx),%rax
   140129009:	vzeroupper
   14012900c:	sub    %rdx,%rsi
   14012900f:	sub    %r15,%rbp
   140129012:	sub    %rdx,%rax
   140129015:	mov    %rsi,%rdi
   140129018:	mov    %rbp,0x1038(%rbx)
   14012901f:	sar    $0x3,%rdi
   140129023:	cmp    %rsi,%rax
   140129026:	jb     14012d570 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b00>
   14012902c:	vmovdqa 0x233aac(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129034:	mov    %rdi,0x1060(%rbx)
   14012903b:	mov    %r14,%rdx
   14012903e:	mov    %rbx,%rcx
   140129041:	movb   $0x0,0x153a0(%rbx)
   140129048:	vmovdqa %xmm0,0x15390(%rbx)
   140129050:	call   140102910 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140129055:	mov    0x1060(%rbx),%rax
   14012905c:	mov    0x1048(%rbx),%rdx
   140129063:	mov    0x1038(%rbx),%rcx
   14012906a:	mov    0x150c0(%rbx),%r13
   140129071:	lea    (%rdx,%rax,8),%rsi
   140129075:	mov    0x1050(%rbx),%rax
   14012907c:	add    %r15,%rcx
   14012907f:	mov    %rax,0x38(%rsp)
   140129084:	test   %r13,%r13
   140129087:	je     140129096 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5626>
   140129089:	lea    -0x5(%r13,%r13,4),%r8
   14012908e:	mov    0x10c8(%rbx,%r8,8),%r13
   140129096:	cmpb   $0x0,0x1040(%rbx)
   14012909d:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401290a3:	movzbl (%rcx),%eax
   1401290a6:	lea    0x296ff3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401290ad:	lea    0x1(%rcx),%rbp
   1401290b1:	xor    %r12d,%r12d
   1401290b4:	mov    (%rdi,%rax,8),%rax
   1401290b8:	jmp    *%rax
   1401290ba:	cmp    $0x2,%r12b
   1401290be:	je     14012b1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7765>
   1401290c4:	cmp    $0x1,%r12b
   1401290c8:	je     14012db10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0a0>
   1401290ce:	mov    0x1048(%rbx),%rdx
   1401290d5:	mov    0x1050(%rbx),%rax
   1401290dc:	vzeroupper
   1401290df:	sub    %rdx,%rsi
   1401290e2:	sub    %r15,%rbp
   1401290e5:	sub    %rdx,%rax
   1401290e8:	mov    %rsi,%rdi
   1401290eb:	mov    %rbp,0x1038(%rbx)
   1401290f2:	sar    $0x3,%rdi
   1401290f6:	cmp    %rsi,%rax
   1401290f9:	jb     14012d4c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a58>
   1401290ff:	vmovdqa 0x2339d9(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129107:	mov    %rdi,0x1060(%rbx)
   14012910e:	mov    %r14,%rdx
   140129111:	mov    %rbx,%rcx
   140129114:	movb   $0x0,0x153a0(%rbx)
   14012911b:	vmovdqa %xmm0,0x15390(%rbx)
   140129123:	call   1401014f0 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140129128:	mov    0x1060(%rbx),%rax
   14012912f:	mov    0x1048(%rbx),%rdx
   140129136:	mov    0x1038(%rbx),%rcx
   14012913d:	mov    0x150c0(%rbx),%r13
   140129144:	lea    (%rdx,%rax,8),%rsi
   140129148:	mov    0x1050(%rbx),%rax
   14012914f:	add    %r15,%rcx
   140129152:	mov    %rax,0x38(%rsp)
   140129157:	test   %r13,%r13
   14012915a:	je     140129169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x56f9>
   14012915c:	lea    -0x5(%r13,%r13,4),%r8
   140129161:	mov    0x10c8(%rbx,%r8,8),%r13
   140129169:	cmpb   $0x0,0x1040(%rbx)
   140129170:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129176:	movzbl (%rcx),%eax
   140129179:	lea    0x296f20(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129180:	lea    0x1(%rcx),%rbp
   140129184:	xor    %r12d,%r12d
   140129187:	mov    (%rdi,%rax,8),%rax
   14012918b:	jmp    *%rax
   14012918d:	cmp    $0x2,%r12b
   140129191:	je     14012ab66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70f6>
   140129197:	cmp    $0x1,%r12b
   14012919b:	je     14012e20d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa79d>
   1401291a1:	mov    0x1048(%rbx),%rdx
   1401291a8:	mov    0x1050(%rbx),%rax
   1401291af:	vzeroupper
   1401291b2:	sub    %rdx,%rsi
   1401291b5:	sub    %r15,%rbp
   1401291b8:	sub    %rdx,%rax
   1401291bb:	mov    %rsi,%rdi
   1401291be:	mov    %rbp,0x1038(%rbx)
   1401291c5:	sar    $0x3,%rdi
   1401291c9:	cmp    %rsi,%rax
   1401291cc:	jb     14012d59a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b2a>
   1401291d2:	vmovdqa 0x233906(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401291da:	mov    %rdi,0x1060(%rbx)
   1401291e1:	mov    %r14,%rdx
   1401291e4:	mov    %rbx,%rcx
   1401291e7:	movb   $0x0,0x153a0(%rbx)
   1401291ee:	vmovdqa %xmm0,0x15390(%rbx)
   1401291f6:	call   1400fefb0 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   1401291fb:	mov    0x1060(%rbx),%rax
   140129202:	mov    0x1048(%rbx),%rdx
   140129209:	mov    0x1038(%rbx),%rcx
   140129210:	mov    0x150c0(%rbx),%r13
   140129217:	lea    (%rdx,%rax,8),%rsi
   14012921b:	mov    0x1050(%rbx),%rax
   140129222:	add    %r15,%rcx
   140129225:	mov    %rax,0x38(%rsp)
   14012922a:	test   %r13,%r13
   14012922d:	je     14012923c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57cc>
   14012922f:	lea    -0x5(%r13,%r13,4),%r8
   140129234:	mov    0x10c8(%rbx,%r8,8),%r13
   14012923c:	cmpb   $0x0,0x1040(%rbx)
   140129243:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129249:	movzbl (%rcx),%eax
   14012924c:	lea    0x296e4d(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129253:	lea    0x1(%rcx),%rbp
   140129257:	xor    %r12d,%r12d
   14012925a:	mov    (%rdi,%rax,8),%rax
   14012925e:	jmp    *%rax
   140129260:	cmp    $0x2,%r12b
   140129264:	je     14012aba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7135>
   14012926a:	cmp    $0x1,%r12b
   14012926e:	je     14012e174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa704>
   140129274:	mov    0x1048(%rbx),%rdx
   14012927b:	mov    0x1050(%rbx),%rax
   140129282:	vzeroupper
   140129285:	sub    %rdx,%rsi
   140129288:	sub    %r15,%rbp
   14012928b:	sub    %rdx,%rax
   14012928e:	mov    %rsi,%rdi
   140129291:	mov    %rbp,0x1038(%rbx)
   140129298:	sar    $0x3,%rdi
   14012929c:	cmp    %rsi,%rax
   14012929f:	jb     14012d4f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a82>
   1401292a5:	vmovdqa 0x233833(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401292ad:	mov    %rdi,0x1060(%rbx)
   1401292b4:	mov    %r14,%rdx
   1401292b7:	mov    %rbx,%rcx
   1401292ba:	movb   $0x0,0x153a0(%rbx)
   1401292c1:	vmovdqa %xmm0,0x15390(%rbx)
   1401292c9:	call   140102c70 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   1401292ce:	mov    0x1060(%rbx),%rax
   1401292d5:	mov    0x1048(%rbx),%rdx
   1401292dc:	mov    0x1038(%rbx),%rcx
   1401292e3:	mov    0x150c0(%rbx),%r13
   1401292ea:	lea    (%rdx,%rax,8),%rsi
   1401292ee:	mov    0x1050(%rbx),%rax
   1401292f5:	add    %r15,%rcx
   1401292f8:	mov    %rax,0x38(%rsp)
   1401292fd:	test   %r13,%r13
   140129300:	je     14012930f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x589f>
   140129302:	lea    -0x5(%r13,%r13,4),%r8
   140129307:	mov    0x10c8(%rbx,%r8,8),%r13
   14012930f:	cmpb   $0x0,0x1040(%rbx)
   140129316:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012931c:	movzbl (%rcx),%eax
   14012931f:	lea    0x296d7a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129326:	lea    0x1(%rcx),%rbp
   14012932a:	xor    %r12d,%r12d
   14012932d:	mov    (%rdi,%rax,8),%rax
   140129331:	jmp    *%rax
   140129333:	cmp    $0x2,%r12b
   140129337:	je     14012ae3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73cb>
   14012933d:	cmp    $0x1,%r12b
   140129341:	je     14012db43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0d3>
   140129347:	mov    0x1048(%rbx),%rdx
   14012934e:	mov    0x1050(%rbx),%rax
   140129355:	vzeroupper
   140129358:	sub    %rdx,%rsi
   14012935b:	sub    %r15,%rbp
   14012935e:	sub    %rdx,%rax
   140129361:	mov    %rsi,%rdi
   140129364:	mov    %rbp,0x1038(%rbx)
   14012936b:	sar    $0x3,%rdi
   14012936f:	cmp    %rsi,%rax
   140129372:	jb     14012d507 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a97>
   140129378:	vmovdqa 0x233760(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129380:	mov    %rdi,0x1060(%rbx)
   140129387:	mov    %r14,%rdx
   14012938a:	mov    %rbx,%rcx
   14012938d:	movb   $0x0,0x153a0(%rbx)
   140129394:	vmovdqa %xmm0,0x15390(%rbx)
   14012939c:	call   1400ff2b0 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   1401293a1:	mov    0x1060(%rbx),%rax
   1401293a8:	mov    0x1048(%rbx),%rdx
   1401293af:	mov    0x1038(%rbx),%rcx
   1401293b6:	mov    0x150c0(%rbx),%r13
   1401293bd:	lea    (%rdx,%rax,8),%rsi
   1401293c1:	mov    0x1050(%rbx),%rax
   1401293c8:	add    %r15,%rcx
   1401293cb:	mov    %rax,0x38(%rsp)
   1401293d0:	test   %r13,%r13
   1401293d3:	je     1401293e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5972>
   1401293d5:	lea    -0x5(%r13,%r13,4),%r8
   1401293da:	mov    0x10c8(%rbx,%r8,8),%r13
   1401293e2:	cmpb   $0x0,0x1040(%rbx)
   1401293e9:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401293ef:	movzbl (%rcx),%eax
   1401293f2:	lea    0x296ca7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401293f9:	lea    0x1(%rcx),%rbp
   1401293fd:	xor    %r12d,%r12d
   140129400:	mov    (%rdi,%rax,8),%rax
   140129404:	jmp    *%rax
   140129406:	cmp    $0x2,%r12b
   14012940a:	je     14012b01f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75af>
   140129410:	cmp    $0x1,%r12b
   140129414:	je     14012db76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa106>
   14012941a:	mov    0x1048(%rbx),%rdx
   140129421:	mov    0x1050(%rbx),%rax
   140129428:	vzeroupper
   14012942b:	sub    %rdx,%rsi
   14012942e:	sub    %r15,%rbp
   140129431:	sub    %rdx,%rax
   140129434:	mov    %rsi,%rdi
   140129437:	mov    %rbp,0x1038(%rbx)
   14012943e:	sar    $0x3,%rdi
   140129442:	cmp    %rsi,%rax
   140129445:	jb     14012d65b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9beb>
   14012944b:	vmovdqa 0x23368d(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129453:	mov    %rdi,0x1060(%rbx)
   14012945a:	mov    %r14,%rdx
   14012945d:	mov    %rbx,%rcx
   140129460:	movb   $0x0,0x153a0(%rbx)
   140129467:	vmovdqa %xmm0,0x15390(%rbx)
   14012946f:	call   1401025f0 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   140129474:	mov    0x1060(%rbx),%rax
   14012947b:	mov    0x1048(%rbx),%rdx
   140129482:	mov    0x1038(%rbx),%rcx
   140129489:	mov    0x150c0(%rbx),%r13
   140129490:	lea    (%rdx,%rax,8),%rsi
   140129494:	mov    0x1050(%rbx),%rax
   14012949b:	add    %r15,%rcx
   14012949e:	mov    %rax,0x38(%rsp)
   1401294a3:	test   %r13,%r13
   1401294a6:	je     1401294b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a45>
   1401294a8:	lea    -0x5(%r13,%r13,4),%r8
   1401294ad:	mov    0x10c8(%rbx,%r8,8),%r13
   1401294b5:	cmpb   $0x0,0x1040(%rbx)
   1401294bc:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401294c2:	movzbl (%rcx),%eax
   1401294c5:	lea    0x296bd4(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401294cc:	lea    0x1(%rcx),%rbp
   1401294d0:	xor    %r12d,%r12d
   1401294d3:	mov    (%rdi,%rax,8),%rax
   1401294d7:	jmp    *%rax
   1401294d9:	cmp    $0x2,%r12b
   1401294dd:	je     14012ad3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72cf>
   1401294e3:	cmp    $0x1,%r12b
   1401294e7:	je     14012e075 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa605>
   1401294ed:	mov    0x1048(%rbx),%rdx
   1401294f4:	mov    0x1050(%rbx),%rax
   1401294fb:	vzeroupper
   1401294fe:	sub    %rdx,%rsi
   140129501:	sub    %r15,%rbp
   140129504:	sub    %rdx,%rax
   140129507:	mov    %rsi,%rdi
   14012950a:	mov    %rbp,0x1038(%rbx)
   140129511:	sar    $0x3,%rdi
   140129515:	cmp    %rsi,%rax
   140129518:	jb     14012d4dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a6d>
   14012951e:	vmovdqa 0x2335ba(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129526:	mov    %rdi,0x1060(%rbx)
   14012952d:	mov    %r14,%rdx
   140129530:	mov    %rbx,%rcx
   140129533:	movb   $0x0,0x153a0(%rbx)
   14012953a:	vmovdqa %xmm0,0x15390(%rbx)
   140129542:	call   1401035a0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   140129547:	mov    0x1060(%rbx),%rax
   14012954e:	mov    0x1048(%rbx),%rdx
   140129555:	mov    0x1038(%rbx),%rcx
   14012955c:	mov    0x150c0(%rbx),%r13
   140129563:	lea    (%rdx,%rax,8),%rsi
   140129567:	mov    0x1050(%rbx),%rax
   14012956e:	add    %r15,%rcx
   140129571:	mov    %rax,0x38(%rsp)
   140129576:	test   %r13,%r13
   140129579:	je     140129588 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b18>
   14012957b:	lea    -0x5(%r13,%r13,4),%r8
   140129580:	mov    0x10c8(%rbx,%r8,8),%r13
   140129588:	cmpb   $0x0,0x1040(%rbx)
   14012958f:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129595:	movzbl (%rcx),%eax
   140129598:	lea    0x296b01(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012959f:	lea    0x1(%rcx),%rbp
   1401295a3:	xor    %r12d,%r12d
   1401295a6:	mov    (%rdi,%rax,8),%rax
   1401295aa:	jmp    *%rax
   1401295ac:	cmp    $0x2,%r12b
   1401295b0:	je     14012b05e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75ee>
   1401295b6:	cmp    $0x1,%r12b
   1401295ba:	je     14012e2d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa869>
   1401295c0:	mov    0x1048(%rbx),%rdx
   1401295c7:	mov    0x1050(%rbx),%rax
   1401295ce:	vzeroupper
   1401295d1:	sub    %rdx,%rsi
   1401295d4:	sub    %r15,%rbp
   1401295d7:	sub    %rdx,%rax
   1401295da:	mov    %rsi,%rdi
   1401295dd:	mov    %rbp,0x1038(%rbx)
   1401295e4:	sar    $0x3,%rdi
   1401295e8:	cmp    %rsi,%rax
   1401295eb:	jb     14012d531 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ac1>
   1401295f1:	vmovdqa 0x2334e7(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401295f9:	mov    %rdi,0x1060(%rbx)
   140129600:	mov    %r14,%rdx
   140129603:	mov    %rbx,%rcx
   140129606:	movb   $0x0,0x153a0(%rbx)
   14012960d:	vmovdqa %xmm0,0x15390(%rbx)
   140129615:	call   1400ff5b0 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   14012961a:	mov    0x1060(%rbx),%rax
   140129621:	mov    0x1048(%rbx),%rdx
   140129628:	mov    0x1038(%rbx),%rcx
   14012962f:	mov    0x150c0(%rbx),%r13
   140129636:	lea    (%rdx,%rax,8),%rsi
   14012963a:	mov    0x1050(%rbx),%rax
   140129641:	add    %r15,%rcx
   140129644:	mov    %rax,0x38(%rsp)
   140129649:	test   %r13,%r13
   14012964c:	je     14012965b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5beb>
   14012964e:	lea    -0x5(%r13,%r13,4),%r8
   140129653:	mov    0x10c8(%rbx,%r8,8),%r13
   14012965b:	cmpb   $0x0,0x1040(%rbx)
   140129662:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129668:	movzbl (%rcx),%eax
   14012966b:	lea    0x296a2e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129672:	lea    0x1(%rcx),%rbp
   140129676:	xor    %r12d,%r12d
   140129679:	mov    (%rdi,%rax,8),%rax
   14012967d:	jmp    *%rax
   14012967f:	cmp    $0x2,%r12b
   140129683:	je     14012af34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74c4>
   140129689:	cmp    $0x1,%r12b
   14012968d:	je     14012dca8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa238>
   140129693:	mov    0x1048(%rbx),%rdx
   14012969a:	mov    0x1050(%rbx),%rax
   1401296a1:	vzeroupper
   1401296a4:	sub    %rdx,%rsi
   1401296a7:	sub    %r15,%rbp
   1401296aa:	sub    %rdx,%rax
   1401296ad:	mov    %rsi,%rdi
   1401296b0:	mov    %rbp,0x1038(%rbx)
   1401296b7:	sar    $0x3,%rdi
   1401296bb:	cmp    %rsi,%rax
   1401296be:	jb     14012d51c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aac>
   1401296c4:	vmovdqa 0x233414(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   1401296cc:	mov    %rdi,0x1060(%rbx)
   1401296d3:	mov    %r14,%rdx
   1401296d6:	mov    %rbx,%rcx
   1401296d9:	movb   $0x0,0x153a0(%rbx)
   1401296e0:	vmovdqa %xmm0,0x15390(%rbx)
   1401296e8:	call   1400ff8b0 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   1401296ed:	mov    0x1060(%rbx),%rax
   1401296f4:	mov    0x1048(%rbx),%rdx
   1401296fb:	mov    0x1038(%rbx),%rcx
   140129702:	mov    0x150c0(%rbx),%r13
   140129709:	lea    (%rdx,%rax,8),%rsi
   14012970d:	mov    0x1050(%rbx),%rax
   140129714:	add    %r15,%rcx
   140129717:	mov    %rax,0x38(%rsp)
   14012971c:	test   %r13,%r13
   14012971f:	je     14012972e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5cbe>
   140129721:	lea    -0x5(%r13,%r13,4),%r8
   140129726:	mov    0x10c8(%rbx,%r8,8),%r13
   14012972e:	cmpb   $0x0,0x1040(%rbx)
   140129735:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012973b:	movzbl (%rcx),%eax
   14012973e:	lea    0x29695b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129745:	lea    0x1(%rcx),%rbp
   140129749:	xor    %r12d,%r12d
   14012974c:	mov    (%rdi,%rax,8),%rax
   140129750:	jmp    *%rax
   140129752:	cmp    $0x2,%r12b
   140129756:	je     14012b157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76e7>
   14012975c:	cmp    $0x1,%r12b
   140129760:	je     14012dba9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa139>
   140129766:	mov    0x1048(%rbx),%rdx
   14012976d:	mov    0x1050(%rbx),%rax
   140129774:	vzeroupper
   140129777:	sub    %rdx,%rsi
   14012977a:	sub    %r15,%rbp
   14012977d:	sub    %rdx,%rax
   140129780:	mov    %rsi,%rdi
   140129783:	mov    %rbp,0x1038(%rbx)
   14012978a:	sar    $0x3,%rdi
   14012978e:	cmp    %rsi,%rax
   140129791:	jb     14012d685 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c15>
   140129797:	vmovdqa 0x233341(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012979f:	mov    %rdi,0x1060(%rbx)
   1401297a6:	mov    %r14,%rdx
   1401297a9:	mov    %rbx,%rcx
   1401297ac:	movb   $0x0,0x153a0(%rbx)
   1401297b3:	vmovdqa %xmm0,0x15390(%rbx)
   1401297bb:	call   1400fe7e0 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   1401297c0:	mov    0x1060(%rbx),%rax
   1401297c7:	mov    0x1048(%rbx),%rdx
   1401297ce:	mov    0x1038(%rbx),%rcx
   1401297d5:	mov    0x150c0(%rbx),%r13
   1401297dc:	lea    (%rdx,%rax,8),%rsi
   1401297e0:	mov    0x1050(%rbx),%rax
   1401297e7:	add    %r15,%rcx
   1401297ea:	mov    %rax,0x38(%rsp)
   1401297ef:	test   %r13,%r13
   1401297f2:	je     140129801 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d91>
   1401297f4:	lea    -0x5(%r13,%r13,4),%r8
   1401297f9:	mov    0x10c8(%rbx,%r8,8),%r13
   140129801:	cmpb   $0x0,0x1040(%rbx)
   140129808:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   14012980e:	movzbl (%rcx),%eax
   140129811:	lea    0x296888(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129818:	lea    0x1(%rcx),%rbp
   14012981c:	xor    %r12d,%r12d
   14012981f:	mov    (%rdi,%rax,8),%rax
   140129823:	jmp    *%rax
   140129825:	cmp    $0x2,%r12b
   140129829:	je     14012b6e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c70>
   14012982f:	cmp    $0x1,%r12b
   140129833:	je     14012dc42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1d2>
   140129839:	mov    0x1048(%rbx),%rdx
   140129840:	mov    0x1050(%rbx),%rax
   140129847:	vzeroupper
   14012984a:	sub    %rdx,%rsi
   14012984d:	sub    %r15,%rbp
   140129850:	sub    %rdx,%rax
   140129853:	mov    %rsi,%rdi
   140129856:	mov    %rbp,0x1038(%rbx)
   14012985d:	sar    $0x3,%rdi
   140129861:	cmp    %rsi,%rax
   140129864:	jb     14012d3f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9986>
   14012986a:	vmovdqa 0x23326e(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129872:	mov    %rdi,0x1060(%rbx)
   140129879:	mov    %r14,%rdx
   14012987c:	mov    %rbx,%rcx
   14012987f:	movb   $0x0,0x153a0(%rbx)
   140129886:	vmovdqa %xmm0,0x15390(%rbx)
   14012988e:	call   14010e660 <setun::VM::handle_get_field(setun::Chunk const&)>
   140129893:	mov    0x1060(%rbx),%rax
   14012989a:	mov    0x1048(%rbx),%rdx
   1401298a1:	mov    0x1038(%rbx),%rcx
   1401298a8:	mov    0x150c0(%rbx),%r13
   1401298af:	lea    (%rdx,%rax,8),%rsi
   1401298b3:	mov    0x1050(%rbx),%rax
   1401298ba:	add    %r15,%rcx
   1401298bd:	mov    %rax,0x38(%rsp)
   1401298c2:	test   %r13,%r13
   1401298c5:	je     1401298d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e64>
   1401298c7:	lea    -0x5(%r13,%r13,4),%r8
   1401298cc:	mov    0x10c8(%rbx,%r8,8),%r13
   1401298d4:	cmpb   $0x0,0x1040(%rbx)
   1401298db:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401298e1:	movzbl (%rcx),%eax
   1401298e4:	lea    0x2967b5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401298eb:	lea    0x1(%rcx),%rbp
   1401298ef:	xor    %r12d,%r12d
   1401298f2:	mov    (%rdi,%rax,8),%rax
   1401298f6:	jmp    *%rax
   1401298f8:	cmp    $0x2,%r12b
   1401298fc:	je     14012abe4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7174>
   140129902:	cmp    $0x1,%r12b
   140129906:	je     14012e00f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa59f>
   14012990c:	mov    0x1048(%rbx),%rdx
   140129913:	mov    0x1050(%rbx),%rax
   14012991a:	vzeroupper
   14012991d:	sub    %rdx,%rsi
   140129920:	sub    %r15,%rbp
   140129923:	sub    %rdx,%rax
   140129926:	mov    %rsi,%rdi
   140129929:	mov    %rbp,0x1038(%rbx)
   140129930:	sar    $0x3,%rdi
   140129934:	cmp    %rsi,%rax
   140129937:	jb     14012d3cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x995c>
   14012993d:	vmovdqa 0x23319b(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129945:	mov    %rdi,0x1060(%rbx)
   14012994c:	mov    %r14,%rdx
   14012994f:	mov    %rbx,%rcx
   140129952:	movb   $0x0,0x153a0(%rbx)
   140129959:	vmovdqa %xmm0,0x15390(%rbx)
   140129961:	call   1401121a0 <setun::VM::handle_new_instance(setun::Chunk const&)>
   140129966:	mov    0x1060(%rbx),%rax
   14012996d:	mov    0x1048(%rbx),%rdx
   140129974:	mov    0x1038(%rbx),%rcx
   14012997b:	mov    0x150c0(%rbx),%r13
   140129982:	lea    (%rdx,%rax,8),%rsi
   140129986:	mov    0x1050(%rbx),%rax
   14012998d:	add    %r15,%rcx
   140129990:	mov    %rax,0x38(%rsp)
   140129995:	test   %r13,%r13
   140129998:	je     1401299a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f37>
   14012999a:	lea    -0x5(%r13,%r13,4),%r8
   14012999f:	mov    0x10c8(%rbx,%r8,8),%r13
   1401299a7:	cmpb   $0x0,0x1040(%rbx)
   1401299ae:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   1401299b4:	movzbl (%rcx),%eax
   1401299b7:	lea    0x2966e2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401299be:	lea    0x1(%rcx),%rbp
   1401299c2:	xor    %r12d,%r12d
   1401299c5:	mov    (%rdi,%rax,8),%rax
   1401299c9:	jmp    *%rax
   1401299cb:	cmp    $0x2,%r12b
   1401299cf:	je     14012ad7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x730e>
   1401299d5:	cmp    $0x1,%r12b
   1401299d9:	je     14012dbdc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa16c>
   1401299df:	mov    0x1048(%rbx),%rdx
   1401299e6:	mov    0x1050(%rbx),%rax
   1401299ed:	vzeroupper
   1401299f0:	sub    %rdx,%rsi
   1401299f3:	sub    %r15,%rbp
   1401299f6:	sub    %rdx,%rax
   1401299f9:	mov    %rsi,%rdi
   1401299fc:	mov    %rbp,0x1038(%rbx)
   140129a03:	sar    $0x3,%rdi
   140129a07:	cmp    %rsi,%rax
   140129a0a:	jb     14012d5af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b3f>
   140129a10:	vmovdqa 0x2330c8(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129a18:	mov    %rdi,0x1060(%rbx)
   140129a1f:	mov    %r14,%rdx
   140129a22:	mov    %rbx,%rcx
   140129a25:	movb   $0x0,0x153a0(%rbx)
   140129a2c:	vmovdqa %xmm0,0x15390(%rbx)
   140129a34:	call   140111b00 <setun::VM::handle_set_field(setun::Chunk const&)>
   140129a39:	mov    0x1060(%rbx),%rax
   140129a40:	mov    0x1048(%rbx),%rdx
   140129a47:	mov    0x1038(%rbx),%rcx
   140129a4e:	mov    0x150c0(%rbx),%r13
   140129a55:	lea    (%rdx,%rax,8),%rsi
   140129a59:	mov    0x1050(%rbx),%rax
   140129a60:	add    %r15,%rcx
   140129a63:	mov    %rax,0x38(%rsp)
   140129a68:	test   %r13,%r13
   140129a6b:	je     140129a7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x600a>
   140129a6d:	lea    -0x5(%r13,%r13,4),%r8
   140129a72:	mov    0x10c8(%rbx,%r8,8),%r13
   140129a7a:	cmpb   $0x0,0x1040(%rbx)
   140129a81:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129a87:	movzbl (%rcx),%eax
   140129a8a:	lea    0x29660f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129a91:	lea    0x1(%rcx),%rbp
   140129a95:	xor    %r12d,%r12d
   140129a98:	mov    (%rdi,%rax,8),%rax
   140129a9c:	jmp    *%rax
   140129a9e:	cmp    $0x2,%r12b
   140129aa2:	je     14012aa73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7003>
   140129aa8:	cmp    $0x1,%r12b
   140129aac:	je     14012dfac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa53c>
   140129ab2:	mov    0x1048(%rbx),%rdx
   140129ab9:	mov    0x1050(%rbx),%rax
   140129ac0:	vzeroupper
   140129ac3:	sub    %rdx,%rsi
   140129ac6:	sub    %r15,%rbp
   140129ac9:	sub    %rdx,%rax
   140129acc:	mov    %rsi,%rdi
   140129acf:	mov    %rbp,0x1038(%rbx)
   140129ad6:	sar    $0x3,%rdi
   140129ada:	cmp    %rsi,%rax
   140129add:	jb     14012d5c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b54>
   140129ae3:	vmovdqa 0x232ff5(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129aeb:	mov    %rdi,0x1060(%rbx)
   140129af2:	mov    %r14,%rdx
   140129af5:	mov    %rbx,%rcx
   140129af8:	movb   $0x0,0x153a0(%rbx)
   140129aff:	vmovdqa %xmm0,0x15390(%rbx)
   140129b07:	call   1401194f0 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   140129b0c:	mov    0x1060(%rbx),%rax
   140129b13:	mov    0x1048(%rbx),%rdx
   140129b1a:	mov    0x1038(%rbx),%rcx
   140129b21:	mov    0x150c0(%rbx),%r13
   140129b28:	lea    (%rdx,%rax,8),%rsi
   140129b2c:	mov    0x1050(%rbx),%rax
   140129b33:	add    %r15,%rcx
   140129b36:	mov    %rax,0x38(%rsp)
   140129b3b:	test   %r13,%r13
   140129b3e:	je     140129b4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60dd>
   140129b40:	lea    -0x5(%r13,%r13,4),%r8
   140129b45:	mov    0x10c8(%rbx,%r8,8),%r13
   140129b4d:	cmpb   $0x0,0x1040(%rbx)
   140129b54:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129b5a:	movzbl (%rcx),%eax
   140129b5d:	lea    0x29653c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129b64:	lea    0x1(%rcx),%rbp
   140129b68:	xor    %r12d,%r12d
   140129b6b:	mov    (%rdi,%rax,8),%rax
   140129b6f:	jmp    *%rax
   140129b71:	cmp    $0x2,%r12b
   140129b75:	je     14012afb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7542>
   140129b7b:	cmp    $0x1,%r12b
   140129b7f:	je     14012e10e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa69e>
   140129b85:	mov    0x1048(%rbx),%rdx
   140129b8c:	mov    0x1050(%rbx),%rax
   140129b93:	vzeroupper
   140129b96:	sub    %rdx,%rsi
   140129b99:	sub    %r15,%rbp
   140129b9c:	sub    %rdx,%rax
   140129b9f:	mov    %rsi,%rdi
   140129ba2:	mov    %rbp,0x1038(%rbx)
   140129ba9:	sar    $0x3,%rdi
   140129bad:	cmp    %rsi,%rax
   140129bb0:	jb     14012d3a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9932>
   140129bb6:	vmovdqa 0x232f22(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129bbe:	mov    %rdi,0x1060(%rbx)
   140129bc5:	mov    %r14,%rdx
   140129bc8:	mov    %rbx,%rcx
   140129bcb:	movb   $0x0,0x153a0(%rbx)
   140129bd2:	vmovdqa %xmm0,0x15390(%rbx)
   140129bda:	call   1400fb660 <setun::VM::handle_try(setun::Chunk const&)>
   140129bdf:	mov    0x1060(%rbx),%rax
   140129be6:	mov    0x1048(%rbx),%rdx
   140129bed:	mov    0x1038(%rbx),%rcx
   140129bf4:	mov    0x150c0(%rbx),%r13
   140129bfb:	lea    (%rdx,%rax,8),%rsi
   140129bff:	mov    0x1050(%rbx),%rax
   140129c06:	add    %r15,%rcx
   140129c09:	mov    %rax,0x38(%rsp)
   140129c0e:	test   %r13,%r13
   140129c11:	je     140129c20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61b0>
   140129c13:	lea    -0x5(%r13,%r13,4),%r8
   140129c18:	mov    0x10c8(%rbx,%r8,8),%r13
   140129c20:	cmpb   $0x0,0x1040(%rbx)
   140129c27:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129c2d:	movzbl (%rcx),%eax
   140129c30:	lea    0x296469(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129c37:	lea    0x1(%rcx),%rbp
   140129c3b:	xor    %r12d,%r12d
   140129c3e:	mov    (%rdi,%rax,8),%rax
   140129c42:	jmp    *%rax
   140129c44:	cmp    $0x2,%r12b
   140129c48:	je     14012aef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7488>
   140129c4e:	cmp    $0x1,%r12b
   140129c52:	jne    14013766c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bfc>
   140129c58:	mov    0x1048(%rbx),%rdx
   140129c5f:	lea    0x8(%rsi),%r8
   140129c63:	cmp    0x38(%rsp),%r8
   140129c68:	jae    140131d11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2a1>
   140129c6e:	mov    0x1050(%rbx),%rax
   140129c75:	vzeroupper
   140129c78:	mov    0x1c8(%rsp),%rcx
   140129c80:	mov    %rcx,(%rsi)
   140129c83:	sub    %rdx,%r8
   140129c86:	sub    %r15,%rbp
   140129c89:	sub    %rdx,%rax
   140129c8c:	mov    %r8,%rsi
   140129c8f:	mov    %rbp,0x1038(%rbx)
   140129c96:	sar    $0x3,%rsi
   140129c9a:	cmp    %r8,%rax
   140129c9d:	jb     14012d646 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd6>
   140129ca3:	vmovdqa 0x232e35(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129cab:	mov    %rsi,0x1060(%rbx)
   140129cb2:	mov    %r14,%rdx
   140129cb5:	mov    %rbx,%rcx
   140129cb8:	movb   $0x0,0x153a0(%rbx)
   140129cbf:	vmovdqa %xmm0,0x15390(%rbx)
   140129cc7:	call   14010caf0 <setun::VM::handle_throw(setun::Chunk const&)>
   140129ccc:	cmp    $0x2,%r12b
   140129cd0:	je     14012b11b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76ab>
   140129cd6:	cmp    $0x1,%r12b
   140129cda:	je     14012dfdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa56f>
   140129ce0:	mov    0x1048(%rbx),%rdx
   140129ce7:	mov    0x1050(%rbx),%rax
   140129cee:	sub    %rdx,%rsi
   140129cf1:	mov    %rax,%rcx
   140129cf4:	sub    %r15,%rbp
   140129cf7:	mov    %rsi,%rdi
   140129cfa:	sub    %rdx,%rcx
   140129cfd:	mov    %rbp,0x1038(%rbx)
   140129d04:	sar    $0x3,%rdi
   140129d08:	cmp    %rsi,%rcx
   140129d0b:	jb     14012d735 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cc5>
   140129d11:	vmovdqa 0x232dc7(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129d19:	mov    %rdi,0x1060(%rbx)
   140129d20:	movb   $0x0,0x153a0(%rbx)
   140129d27:	mov    0x15108(%rbx),%rcx
   140129d2e:	vmovdqa %xmm0,0x15390(%rbx)
   140129d36:	cmp    0x15100(%rbx),%rcx
   140129d3d:	je     140129d4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62da>
   140129d3f:	sub    $0x20,%rcx
   140129d43:	mov    %rcx,0x15108(%rbx)
   140129d4a:	mov    0x1038(%rbx),%rcx
   140129d51:	mov    0x150c0(%rbx),%r13
   140129d58:	mov    %rax,0x38(%rsp)
   140129d5d:	add    %rdx,%rsi
   140129d60:	add    %r15,%rcx
   140129d63:	test   %r13,%r13
   140129d66:	je     140129d75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6305>
   140129d68:	lea    -0x5(%r13,%r13,4),%r8
   140129d6d:	mov    0x10c8(%rbx,%r8,8),%r13
   140129d75:	cmpb   $0x0,0x1040(%rbx)
   140129d7c:	je     140130126 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6b6>
   140129d82:	movzbl (%rcx),%eax
   140129d85:	lea    0x296314(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129d8c:	lea    0x1(%rcx),%rbp
   140129d90:	xor    %r12d,%r12d
   140129d93:	mov    (%rdi,%rax,8),%rax
   140129d97:	jmp    *%rax
   140129d99:	cmp    $0x2,%r12b
   140129d9d:	je     14012ae7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x740a>
   140129da3:	cmp    $0x1,%r12b
   140129da7:	je     14012dee0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa470>
   140129dad:	mov    0x1048(%rbx),%rdx
   140129db4:	mov    0x1050(%rbx),%rax
   140129dbb:	vzeroupper
   140129dbe:	sub    %rdx,%rsi
   140129dc1:	sub    %r15,%rbp
   140129dc4:	sub    %rdx,%rax
   140129dc7:	mov    %rsi,%rdi
   140129dca:	mov    %rbp,0x1038(%rbx)
   140129dd1:	sar    $0x3,%rdi
   140129dd5:	cmp    %rsi,%rax
   140129dd8:	jb     14012d70b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c9b>
   140129dde:	vmovdqa 0x232cfa(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129de6:	mov    %rdi,0x1060(%rbx)
   140129ded:	mov    %r14,%rdx
   140129df0:	mov    %rbx,%rcx
   140129df3:	movb   $0x0,0x153a0(%rbx)
   140129dfa:	vmovdqa %xmm0,0x15390(%rbx)
   140129e02:	call   14010f3c0 <setun::VM::handle_closure(setun::Chunk const&)>
   140129e07:	mov    0x1060(%rbx),%rax
   140129e0e:	mov    0x1048(%rbx),%rdx
   140129e15:	mov    0x1038(%rbx),%rcx
   140129e1c:	mov    0x150c0(%rbx),%r13
   140129e23:	lea    (%rdx,%rax,8),%rsi
   140129e27:	mov    0x1050(%rbx),%rax
   140129e2e:	add    %r15,%rcx
   140129e31:	mov    %rax,0x38(%rsp)
   140129e36:	test   %r13,%r13
   140129e39:	je     140129e48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63d8>
   140129e3b:	lea    -0x5(%r13,%r13,4),%r8
   140129e40:	mov    0x10c8(%rbx,%r8,8),%r13
   140129e48:	cmpb   $0x0,0x1040(%rbx)
   140129e4f:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129e55:	movzbl (%rcx),%eax
   140129e58:	lea    0x296241(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129e5f:	lea    0x1(%rcx),%rbp
   140129e63:	xor    %r12d,%r12d
   140129e66:	mov    (%rdi,%rax,8),%rax
   140129e6a:	jmp    *%rax
   140129e6c:	cmp    $0x2,%r12b
   140129e70:	je     14012b09d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x762d>
   140129e76:	cmp    $0x1,%r12b
   140129e7a:	je     14012df13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4a3>
   140129e80:	mov    0x1048(%rbx),%rdx
   140129e87:	mov    0x1050(%rbx),%rax
   140129e8e:	vzeroupper
   140129e91:	sub    %rdx,%rsi
   140129e94:	sub    %r15,%rbp
   140129e97:	sub    %rdx,%rax
   140129e9a:	mov    %rsi,%rdi
   140129e9d:	mov    %rbp,0x1038(%rbx)
   140129ea4:	sar    $0x3,%rdi
   140129ea8:	cmp    %rsi,%rax
   140129eab:	jb     14012d720 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cb0>
   140129eb1:	vmovdqa 0x232c27(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140129eb9:	mov    %rdi,0x1060(%rbx)
   140129ec0:	mov    %r14,%rdx
   140129ec3:	mov    %rbx,%rcx
   140129ec6:	movb   $0x0,0x153a0(%rbx)
   140129ecd:	vmovdqa %xmm0,0x15390(%rbx)
   140129ed5:	call   14010fed0 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   140129eda:	mov    0x1060(%rbx),%rax
   140129ee1:	mov    0x1048(%rbx),%rdx
   140129ee8:	mov    0x1038(%rbx),%rcx
   140129eef:	mov    0x150c0(%rbx),%r13
   140129ef6:	lea    (%rdx,%rax,8),%rsi
   140129efa:	mov    0x1050(%rbx),%rax
   140129f01:	add    %r15,%rcx
   140129f04:	mov    %rax,0x38(%rsp)
   140129f09:	test   %r13,%r13
   140129f0c:	je     140129f1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64ab>
   140129f0e:	lea    -0x5(%r13,%r13,4),%r8
   140129f13:	mov    0x10c8(%rbx,%r8,8),%r13
   140129f1b:	cmpb   $0x0,0x1040(%rbx)
   140129f22:	je     14012ccf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9280>
   140129f28:	movzbl (%rcx),%eax
   140129f2b:	lea    0x29616e(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129f32:	lea    0x1(%rcx),%rbp
   140129f36:	xor    %r12d,%r12d
   140129f39:	mov    (%rdi,%rax,8),%rax
   140129f3d:	jmp    *%rax
   140129f3f:	movzwl 0x0(%rbp),%eax
   140129f43:	mov    %ax,0x40(%rsp)
   140129f48:	lea    0x2(%rbp),%rax
   140129f4c:	mov    %rax,0xa0(%rsp)
   140129f54:	cmp    $0x2,%r12b
   140129f58:	je     14012bf81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8511>
   140129f5e:	cmp    $0x1,%r12b
   140129f62:	jne    14012d8f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e85>
   140129f68:	lea    0x8(%rsi),%r8
   140129f6c:	cmp    0x38(%rsp),%r8
   140129f71:	jae    140132d13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2a3>
   140129f77:	vzeroupper
   140129f7a:	mov    0x1c8(%rsp),%rax
   140129f82:	xor    %r12d,%r12d
   140129f85:	mov    %rax,(%rsi)
   140129f88:	mov    %r8,%rsi
   140129f8b:	mov    $0x90,%ecx
   140129f90:	call   140338a00 <operator new(unsigned long long)>
   140129f95:	vpxor  %xmm0,%xmm0,%xmm0
   140129f99:	mov    %rax,%rdi
   140129f9c:	mov    0x232b9d(%rip),%rax        # 14035cb40 <CSWTCH.3092+0x240>
   140129fa3:	vmovdqu %ymm0,0x10(%rdi)
   140129fa8:	lea    0x18(%rdi),%rcx
   140129fac:	mov    %rax,0x8(%rdi)
   140129fb0:	lea    0x251c49(%rip),%rax        # 14037bc00 <vtable for std::_Sp_counted_ptr_inplace<setun::ArrayObject, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   140129fb7:	mov    %rax,(%rdi)
   140129fba:	lea    0x10(%rdi),%rax
   140129fbe:	mov    %rax,0x60(%rsp)
   140129fc3:	movzwl 0x40(%rsp),%eax
   140129fc8:	vmovdqu %ymm0,0x30(%rdi)
   140129fcd:	mov    %rax,0x80(%rsp)
   140129fd5:	mov    %rax,%rdx
   140129fd8:	vmovdqu %ymm0,0x50(%rdi)
   140129fdd:	vmovdqu %ymm0,0x70(%rdi)
   140129fe2:	vzeroupper
   140129fe5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140129fea:	cmpw   $0x0,0x40(%rsp)
   140129ff0:	je     14012a036 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65c6>
   140129ff2:	mov    0x80(%rsp),%rax
   140129ffa:	mov    0x18(%rdi),%rcx
   140129ffe:	mov    %rax,%rdx
   14012a001:	lea    (%rcx,%rax,8),%rcx
   14012a005:	xor    %eax,%eax
   14012a007:	neg    %rdx
   14012a00a:	shl    $0x3,%rdx
   14012a00e:	nopl   0x0(%rax)
   14012a015:	data16 cs nopw 0x0(%rax,%rax,1)
   14012a020:	mov    -0x8(%rsi,%rax,1),%r8
   14012a025:	mov    %r8,-0x8(%rcx,%rax,1)
   14012a02a:	sub    $0x8,%rax
   14012a02e:	cmp    %rdx,%rax
   14012a031:	jne    14012a020 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65b0>
   14012a033:	add    %rax,%rsi
   14012a036:	mov    0x60(%rsp),%rcx
   14012a03b:	call   14014b860 <setun::ArrayObject::try_promote()>
   14012a040:	test   %r12b,%r12b
   14012a043:	jne    14012d009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9599>
   14012a049:	mov    0x60(%rsp),%rax
   14012a04e:	mov    %rax,0x680(%rsp)
   14012a056:	lock addl $0x1,0x8(%rdi)
   14012a05b:	lea    0x680(%rsp),%rdx
   14012a063:	lea    0x540(%rsp),%rcx
   14012a06b:	mov    %rdi,0x688(%rsp)
   14012a073:	call   14020f340 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012a078:	mov    0x540(%rsp),%rax
   14012a080:	mov    0x688(%rsp),%rcx
   14012a088:	mov    %rax,0x1c8(%rsp)
   14012a090:	test   %rcx,%rcx
   14012a093:	je     14012a09a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x662a>
   14012a095:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012a09a:	mov    $0x1,%r12d
   14012a0a0:	mov    %rdi,%rcx
   14012a0a3:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012a0a8:	cmpb   $0x0,0x1040(%rbx)
   14012a0af:	je     14012d2ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x985e>
   14012a0b5:	movzbl 0x2(%rbp),%eax
   14012a0b9:	lea    0x295fe0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a0c0:	add    $0x3,%rbp
   14012a0c4:	mov    (%rdi,%rax,8),%rax
   14012a0c8:	jmp    *%rax
   14012a0ca:	movabs $0xfffb000000000000,%rax
   14012a0d4:	mov    %rax,0x308(%rsp)
   14012a0dc:	mov    %rax,0x310(%rsp)
   14012a0e4:	cmp    $0x2,%r12b
   14012a0e8:	jne    14013006b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5fb>
   14012a0ee:	mov    0x1c8(%rsp),%rax
   14012a0f6:	movabs $0xffff000000000000,%rdx
   14012a100:	movabs $0xfffd000000000000,%rcx
   14012a10a:	mov    %rax,0x310(%rsp)
   14012a112:	mov    0x1d0(%rsp),%rax
   14012a11a:	and    %rax,%rdx
   14012a11d:	mov    %rax,0x308(%rsp)
   14012a125:	cmp    %rcx,%rdx
   14012a128:	je     14012c584 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b14>
   14012a12e:	movabs $0xfff8000000000000,%rax
   14012a138:	mov    $0x1,%r12d
   14012a13e:	mov    %rax,0x1c8(%rsp)
   14012a146:	cmpb   $0x0,0x1040(%rbx)
   14012a14d:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a153:	movzbl 0x0(%rbp),%eax
   14012a157:	lea    0x295f42(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a15e:	add    $0x1,%rbp
   14012a162:	mov    (%rdi,%rax,8),%rax
   14012a166:	jmp    *%rax
   14012a168:	movabs $0xfffb000000000000,%rax
   14012a172:	mov    %rax,0x318(%rsp)
   14012a17a:	mov    %rax,0x320(%rsp)
   14012a182:	cmp    $0x1,%r12b
   14012a186:	jne    14013096f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xceff>
   14012a18c:	mov    0x1c8(%rsp),%rax
   14012a194:	xor    %r12d,%r12d
   14012a197:	mov    %rax,0x318(%rsp)
   14012a19f:	mov    -0x8(%rsi),%rax
   14012a1a3:	sub    $0x10,%rsi
   14012a1a7:	mov    %rax,0x320(%rsp)
   14012a1af:	mov    (%rsi),%rdx
   14012a1b2:	movabs $0xffff000000000000,%rax
   14012a1bc:	movabs $0xfffd000000000000,%rcx
   14012a1c6:	and    %rdx,%rax
   14012a1c9:	cmp    %rcx,%rax
   14012a1cc:	je     14012bc40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81d0>
   14012a1d2:	cmpb   $0x0,0x1040(%rbx)
   14012a1d9:	je     14012e428 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9b8>
   14012a1df:	movzbl 0x0(%rbp),%eax
   14012a1e3:	lea    0x295eb6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a1ea:	add    $0x1,%rbp
   14012a1ee:	mov    (%rdi,%rax,8),%rax
   14012a1f2:	jmp    *%rax
   14012a1f4:	test   %r12b,%r12b
   14012a1f7:	je     14012a545 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad5>
   14012a1fd:	cmp    $0x1,%r12b
   14012a201:	je     14012e8a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae30>
   14012a207:	lea    0x8(%rsi),%r8
   14012a20b:	cmp    0x38(%rsp),%r8
   14012a210:	jae    140133215 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7a5>
   14012a216:	mov    0x1d0(%rsp),%rax
   14012a21e:	mov    %rax,(%rsi)
   14012a221:	mov    0x1c8(%rsp),%rax
   14012a229:	mov    %r8,%rsi
   14012a22c:	mov    %rax,0x1d0(%rsp)
   14012a234:	mov    0x1068(%rbx),%rax
   14012a23b:	mov    (%rax,%r13,8),%rax
   14012a23f:	mov    %rax,0x1c8(%rsp)
   14012a247:	cmpb   $0x0,0x1040(%rbx)
   14012a24e:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a254:	movzbl 0x0(%rbp),%eax
   14012a258:	lea    0x295e41(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a25f:	add    $0x1,%rbp
   14012a263:	mov    (%rdi,%rax,8),%rax
   14012a267:	jmp    *%rax
   14012a269:	test   %r12b,%r12b
   14012a26c:	je     14012a507 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a97>
   14012a272:	cmp    $0x1,%r12b
   14012a276:	je     14012e871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae01>
   14012a27c:	lea    0x8(%rsi),%r8
   14012a280:	cmp    0x38(%rsp),%r8
   14012a285:	jae    140133042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5d2>
   14012a28b:	mov    0x1d0(%rsp),%rax
   14012a293:	mov    %rax,(%rsi)
   14012a296:	mov    0x1c8(%rsp),%rax
   14012a29e:	mov    %r8,%rsi
   14012a2a1:	mov    %rax,0x1d0(%rsp)
   14012a2a9:	mov    0x1068(%rbx),%rax
   14012a2b0:	mov    0x8(%rax,%r13,8),%rax
   14012a2b5:	mov    %rax,0x1c8(%rsp)
   14012a2bd:	cmpb   $0x0,0x1040(%rbx)
   14012a2c4:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a2ca:	movzbl 0x0(%rbp),%eax
   14012a2ce:	lea    0x295dcb(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a2d5:	add    $0x1,%rbp
   14012a2d9:	mov    (%rdi,%rax,8),%rax
   14012a2dd:	jmp    *%rax
   14012a2df:	test   %r12b,%r12b
   14012a2e2:	je     14012a526 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ab6>
   14012a2e8:	cmp    $0x1,%r12b
   14012a2ec:	je     14012e842 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadd2>
   14012a2f2:	lea    0x8(%rsi),%r8
   14012a2f6:	cmp    0x38(%rsp),%r8
   14012a2fb:	jae    1401337ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd3d>
   14012a301:	mov    0x1d0(%rsp),%rax
   14012a309:	mov    %rax,(%rsi)
   14012a30c:	mov    0x1c8(%rsp),%rax
   14012a314:	mov    %r8,%rsi
   14012a317:	mov    %rax,0x1d0(%rsp)
   14012a31f:	mov    0x1068(%rbx),%rax
   14012a326:	mov    0x10(%rax,%r13,8),%rax
   14012a32b:	mov    %rax,0x1c8(%rsp)
   14012a333:	cmpb   $0x0,0x1040(%rbx)
   14012a33a:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a340:	movzbl 0x0(%rbp),%eax
   14012a344:	lea    0x295d55(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a34b:	add    $0x1,%rbp
   14012a34f:	mov    (%rdi,%rax,8),%rax
   14012a353:	jmp    *%rax
   14012a355:	test   %r12b,%r12b
   14012a358:	je     14012a4e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a78>
   14012a35e:	cmp    $0x1,%r12b
   14012a362:	je     14012e813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xada3>
   14012a368:	lea    0x8(%rsi),%r8
   14012a36c:	cmp    0x38(%rsp),%r8
   14012a371:	jae    1401335a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb35>
   14012a377:	mov    0x1d0(%rsp),%rax
   14012a37f:	mov    %rax,(%rsi)
   14012a382:	mov    0x1c8(%rsp),%rax
   14012a38a:	mov    %r8,%rsi
   14012a38d:	mov    %rax,0x1d0(%rsp)
   14012a395:	mov    0x1068(%rbx),%rax
   14012a39c:	mov    0x18(%rax,%r13,8),%rax
   14012a3a1:	mov    %rax,0x1c8(%rsp)
   14012a3a9:	cmpb   $0x0,0x1040(%rbx)
   14012a3b0:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a3b6:	movzbl 0x0(%rbp),%eax
   14012a3ba:	lea    0x295cdf(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a3c1:	add    $0x1,%rbp
   14012a3c5:	mov    (%rdi,%rax,8),%rax
   14012a3c9:	jmp    *%rax
   14012a3cb:	lea    -0x8(%rsi),%rdx
   14012a3cf:	lea    0x1c8(%rsp),%rax
   14012a3d7:	test   %r12b,%r12b
   14012a3da:	cmove  %rdx,%rax
   14012a3de:	mov    0x1068(%rbx),%rdx
   14012a3e5:	mov    (%rax),%rax
   14012a3e8:	mov    %rax,(%rdx,%r13,8)
   14012a3ec:	cmpb   $0x0,0x1040(%rbx)
   14012a3f3:	je     14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012a3f9:	movzbl 0x0(%rbp),%eax
   14012a3fd:	lea    0x295c9c(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a404:	add    $0x1,%rbp
   14012a408:	mov    (%rdi,%rax,8),%rax
   14012a40c:	jmp    *%rax
   14012a40e:	xchg   %ax,%ax
   14012a410:	mov    0x1048(%rbx),%rdx
   14012a417:	mov    0x1050(%rbx),%rax
   14012a41e:	lea    0x8(%rsi),%r8
   14012a422:	cmp    0x38(%rsp),%r8
   14012a427:	jae    14012d5ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b7e>
   14012a42d:	mov    0x1c8(%rsp),%rcx
   14012a435:	mov    %rcx,(%rsi)
   14012a438:	mov    %r8,%rsi
   14012a43b:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a440:	mov    $0x1,%r12d
   14012a446:	mov    0x60(%rsp),%rbp
   14012a44b:	mov    0x1048(%rbx),%rdx
   14012a452:	nopl   (%rax)
   14012a455:	data16 cs nopw 0x0(%rax,%rax,1)
   14012a460:	cmp    $0x1,%r12b
   14012a464:	je     14012a417 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012a466:	mov    0x1050(%rbx),%rax
   14012a46d:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a472:	nopw   0x0(%rax,%rax,1)
   14012a478:	lea    0x0(%rbp,%rbp,1),%rdx
   14012a47d:	lea    0x1048(%rbx),%rcx
   14012a484:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012a489:	jmp    1401246bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4c>
   14012a48e:	xchg   %ax,%ax
   14012a490:	mov    (%r12),%rdx
   14012a494:	mov    %rax,0x38(%rsp)
   14012a499:	mov    %r12,%rcx
   14012a49c:	movq   $0x0,0x8(%r12)
   14012a4a5:	call   *0x10(%rdx)
   14012a4a8:	mov    (%r12),%rdx
   14012a4ac:	mov    %r12,%rcx
   14012a4af:	call   *0x18(%rdx)
   14012a4b2:	mov    0x38(%rsp),%rax
   14012a4b7:	jmp    140123c0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012a4bc:	mov    %r8,%rbp
   14012a4bf:	nop
   14012a4c0:	mov    0x1048(%rbx),%rdx
   14012a4c7:	vzeroupper
   14012a4ca:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012a4cf:	mov    0x1048(%rbx),%rdx
   14012a4d6:	vzeroupper
   14012a4d9:	mov    0x1050(%rbx),%rax
   14012a4e0:	mov    %rcx,%rbp
   14012a4e3:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012a4e8:	mov    0x1068(%rbx),%rax
   14012a4ef:	mov    $0x1,%r12d
   14012a4f5:	mov    0x18(%rax,%r13,8),%rax
   14012a4fa:	mov    %rax,0x1c8(%rsp)
   14012a502:	jmp    14012a3a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6939>
   14012a507:	mov    0x1068(%rbx),%rax
   14012a50e:	mov    $0x1,%r12d
   14012a514:	mov    0x8(%rax,%r13,8),%rax
   14012a519:	mov    %rax,0x1c8(%rsp)
   14012a521:	jmp    14012a2bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x684d>
   14012a526:	mov    0x1068(%rbx),%rax
   14012a52d:	mov    $0x1,%r12d
   14012a533:	mov    0x10(%rax,%r13,8),%rax
   14012a538:	mov    %rax,0x1c8(%rsp)
   14012a540:	jmp    14012a333 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68c3>
   14012a545:	mov    0x1068(%rbx),%rax
   14012a54c:	mov    $0x1,%r12d
   14012a552:	mov    (%rax,%r13,8),%rax
   14012a556:	mov    %rax,0x1c8(%rsp)
   14012a55e:	jmp    14012a247 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67d7>
   14012a563:	cmp    $0x1,%dil
   14012a567:	je     14012e7ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad7d>
   14012a56d:	test   %r12b,%r12b
   14012a570:	jne    14012e7ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad5e>
   14012a576:	movzbl %dil,%eax
   14012a57a:	mov    %rsi,%rdx
   14012a57d:	movabs $0xfffd000200000000,%rcx
   14012a587:	shl    $0x3,%rax
   14012a58b:	sub    %rax,%rdx
   14012a58e:	movabs $0xffffffff00000000,%rax
   14012a598:	mov    -0x8(%rdx),%rdx
   14012a59c:	and    %rdx,%rax
   14012a59f:	cmp    %rcx,%rax
   14012a5a2:	je     14012f3b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb942>
   14012a5a8:	vzeroupper
   14012a5ab:	jmp    140127b03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4093>
   14012a5b0:	cmp    $0x1,%r12b
   14012a5b4:	je     14012e8ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae5e>
   14012a5ba:	lea    0x8(%rsi),%r8
   14012a5be:	cmp    0x38(%rsp),%r8
   14012a5c3:	jae    14013291b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeeab>
   14012a5c9:	mov    0x1d0(%rsp),%rdx
   14012a5d1:	vmovq  %rax,%xmm0
   14012a5d6:	vucomisd %xmm0,%xmm0
   14012a5da:	mov    %rdx,(%rsi)
   14012a5dd:	mov    0x1c8(%rsp),%rdx
   14012a5e5:	mov    %r8,%rsi
   14012a5e8:	mov    %rdx,0x1d0(%rsp)
   14012a5f0:	movabs $0xfffc000000000000,%rdx
   14012a5fa:	cmovp  %rdx,%rax
   14012a5fe:	jmp    140124eb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1440>
   14012a603:	mov    -0x8(%rsi),%rax
   14012a607:	mov    $0x1,%r12d
   14012a60d:	mov    %rax,0x1c8(%rsp)
   14012a615:	jmp    140124fa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534>
   14012a61a:	mov    0x1068(%rbx),%rdx
   14012a621:	mov    $0x1,%r12d
   14012a627:	mov    (%rdx,%rax,8),%rax
   14012a62b:	mov    %rax,0x1c8(%rsp)
   14012a633:	jmp    14012503f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cf>
   14012a638:	cmp    $0x1,%r12b
   14012a63c:	je     14012e6e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac74>
   14012a642:	lea    0x8(%rsi),%r8
   14012a646:	cmp    0x38(%rsp),%r8
   14012a64b:	jae    140132be5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf175>
   14012a651:	mov    0x1d0(%rsp),%rdx
   14012a659:	test   %al,%al
   14012a65b:	movabs $0xfffa000000000001,%rax
   14012a665:	mov    %rdx,(%rsi)
   14012a668:	mov    0x1c8(%rsp),%rdx
   14012a670:	mov    %r8,%rsi
   14012a673:	mov    %rdx,0x1d0(%rsp)
   14012a67b:	movabs $0xfffa000000000000,%rdx
   14012a685:	cmovne %rax,%rdx
   14012a689:	jmp    140124f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b>
   14012a68e:	lea    0x1c8(%rsp),%rcx
   14012a696:	vzeroupper
   14012a699:	call   14021a210 <setun::VMValue::neg() const>
   14012a69e:	mov    %rax,0x1c8(%rsp)
   14012a6a6:	jmp    1401257f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d84>
   14012a6ab:	movabs $0xfff9000000000000,%rdx
   14012a6b5:	mov    $0x1,%r12d
   14012a6bb:	or     %rdx,%rax
   14012a6be:	jmp    140124d82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1312>
   14012a6c3:	mov    0x1080(%rbx),%rdx
   14012a6ca:	mov    $0x1,%r12d
   14012a6d0:	mov    (%rdx,%rax,8),%rax
   14012a6d4:	mov    %rax,0x1c8(%rsp)
   14012a6dc:	jmp    14012514d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16dd>
   14012a6e1:	mov    %r12,%rcx
   14012a6e4:	mov    %rax,0x38(%rsp)
   14012a6e9:	call   1402d8270 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release_last_use_cold()>
   14012a6ee:	mov    0x38(%rsp),%rax
   14012a6f3:	jmp    140123c0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012a6f8:	mov    0x1078(%rcx),%r13
   14012a6ff:	jmp    14012690d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e9d>
   14012a704:	cmp    %rbp,0xa0(%rsp)
   14012a70c:	setg   %dl
   14012a70f:	jmp    1401281cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x475b>
   14012a714:	mov    %rdx,%rax
   14012a717:	shr    $0x20,%rax
   14012a71b:	cmp    $0x5,%ax
   14012a71f:	jne    14012a769 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6cf9>
   14012a721:	mov    0x2b0(%rsp),%rcx
   14012a729:	movabs $0xffff000000000000,%rax
   14012a733:	movabs $0xfff8000000000000,%r8
   14012a73d:	and    %rcx,%rax
   14012a740:	cmp    %r8,%rax
   14012a743:	je     140125c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a749:	movabs $0xffffffff00000000,%rax
   14012a753:	and    %rax,%rcx
   14012a756:	movabs $0xfffd000500000000,%rax
   14012a760:	cmp    %rax,%rcx
   14012a763:	je     140125c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a769:	mov    0x2b0(%rsp),%rax
   14012a771:	movabs $0xfffc000000000000,%rcx
   14012a77b:	cmp    %rcx,%rax
   14012a77e:	je     14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   14012a784:	movabs $0xfff7ffffffffffff,%rcx
   14012a78e:	cmp    %rax,%rcx
   14012a791:	jae    14012cfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x955c>
   14012a797:	movabs $0xffffffff00000000,%rcx
   14012a7a1:	movabs $0xfffd000000000000,%r8
   14012a7ab:	and    %rcx,%rdx
   14012a7ae:	cmp    %r8,%rdx
   14012a7b1:	je     1401311f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd781>
   14012a7b7:	movabs $0xffff000000000000,%rcx
   14012a7c1:	and    %rax,%rcx
   14012a7c4:	cmp    %r8,%rcx
   14012a7c7:	je     1401320f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe681>
   14012a7cd:	movabs $0xfffd000100000000,%rax
   14012a7d7:	cmp    %rax,%rdx
   14012a7da:	jne    140125c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14012a7e0:	lea    0x2b0(%rsp),%rdx
   14012a7e8:	lea    0x680(%rsp),%rcx
   14012a7f0:	vzeroupper
   14012a7f3:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012a7f8:	lea    0x540(%rsp),%rax
   14012a800:	lea    0x2a8(%rsp),%rdx
   14012a808:	mov    %rax,%rcx
   14012a80b:	mov    %rax,0x40(%rsp)
   14012a810:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012a815:	mov    0x40(%rsp),%rcx
   14012a81a:	lea    0x680(%rsp),%rdx
   14012a822:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012a827:	test   %eax,%eax
   14012a829:	setne  %al
   14012a82c:	jmp    140125c7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   14012a831:	mov    0x360(%rsp),%rcx
   14012a839:	and    %rcx,%rax
   14012a83c:	cmp    %r8,%rax
   14012a83f:	jne    140128270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4800>
   14012a845:	shl    $0x10,%rcx
   14012a849:	shl    $0x10,%rdx
   14012a84d:	movabs $0xffffffffffff,%r8
   14012a857:	sar    $0x10,%rcx
   14012a85b:	sar    $0x10,%rdx
   14012a85f:	add    %rcx,%rdx
   14012a862:	movabs $0x800000000000,%rcx
   14012a86c:	add    %rdx,%rcx
   14012a86f:	cmp    %rcx,%r8
   14012a872:	jb     140128270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4800>
   14012a878:	and    %r8,%rdx
   14012a87b:	or     %rdx,%rax
   14012a87e:	mov    %rax,0x1c8(%rsp)
   14012a886:	cmpb   $0x0,0x1040(%rbx)
   14012a88d:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012a893:	movzbl 0x0(%rbp),%eax
   14012a897:	lea    0x295802(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a89e:	add    $0x1,%rbp
   14012a8a2:	mov    (%rdi,%rax,8),%rax
   14012a8a6:	jmp    *%rax
   14012a8a8:	mov    0x370(%rsp),%r8
   14012a8b0:	and    %r8,%rdx
   14012a8b3:	cmp    %rcx,%rdx
   14012a8b6:	jne    14012832b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48bb>
   14012a8bc:	mov    %r8,%rcx
   14012a8bf:	shl    $0x10,%rax
   14012a8c3:	movabs $0xffffffffffff,%r8
   14012a8cd:	shl    $0x10,%rcx
   14012a8d1:	sar    $0x10,%rax
   14012a8d5:	sar    $0x10,%rcx
   14012a8d9:	sub    %rcx,%rax
   14012a8dc:	movabs $0x800000000000,%rcx
   14012a8e6:	add    %rax,%rcx
   14012a8e9:	cmp    %rcx,%r8
   14012a8ec:	jb     14012832b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48bb>
   14012a8f2:	and    %r8,%rax
   14012a8f5:	or     %rdx,%rax
   14012a8f8:	mov    %rax,0x1c8(%rsp)
   14012a900:	cmpb   $0x0,0x1040(%rbx)
   14012a907:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012a90d:	movzbl 0x0(%rbp),%eax
   14012a911:	lea    0x295788(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a918:	add    $0x1,%rbp
   14012a91c:	mov    (%rdi,%rax,8),%rax
   14012a920:	jmp    *%rax
   14012a922:	mov    0x390(%rsp),%r8
   14012a92a:	and    %r8,%rax
   14012a92d:	cmp    %rcx,%rax
   14012a930:	jne    14012849e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a2e>
   14012a936:	mov    0x388(%rsp),%rax
   14012a93e:	shl    $0x10,%r8
   14012a942:	movabs $0xfffa000000000000,%rdx
   14012a94c:	shl    $0x10,%rax
   14012a950:	cmp    %r8,%rax
   14012a953:	movabs $0xfffa000000000001,%rax
   14012a95d:	cmovl  %rax,%rdx
   14012a961:	mov    %rdx,0x1c8(%rsp)
   14012a969:	cmpb   $0x0,0x1040(%rbx)
   14012a970:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012a976:	movzbl 0x0(%rbp),%eax
   14012a97a:	lea    0x29571f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a981:	add    $0x1,%rbp
   14012a985:	mov    (%rdi,%rax,8),%rax
   14012a989:	jmp    *%rax
   14012a98b:	mov    0x380(%rsp),%rcx
   14012a993:	and    %rcx,%rax
   14012a996:	cmp    %r8,%rax
   14012a999:	jne    1401283e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4976>
   14012a99f:	shl    $0x10,%rcx
   14012a9a3:	shl    $0x10,%rdx
   14012a9a7:	movabs $0xffffffffffff,%r8
   14012a9b1:	sar    $0x10,%rcx
   14012a9b5:	sar    $0x10,%rdx
   14012a9b9:	imul   %rcx,%rdx
   14012a9bd:	movabs $0x800000000000,%rcx
   14012a9c7:	add    %rdx,%rcx
   14012a9ca:	cmp    %rcx,%r8
   14012a9cd:	jb     1401283e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4976>
   14012a9d3:	and    %r8,%rdx
   14012a9d6:	or     %rdx,%rax
   14012a9d9:	mov    %rax,0x1c8(%rsp)
   14012a9e1:	cmpb   $0x0,0x1040(%rbx)
   14012a9e8:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012a9ee:	movzbl 0x0(%rbp),%eax
   14012a9f2:	lea    0x2956a7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a9f9:	add    $0x1,%rbp
   14012a9fd:	mov    (%rdi,%rax,8),%rax
   14012aa01:	jmp    *%rax
   14012aa03:	lea    0x10(%rsi),%r8
   14012aa07:	cmp    0x38(%rsp),%r8
   14012aa0c:	jae    1401323ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe97d>
   14012aa12:	mov    0x1d0(%rsp),%rdx
   14012aa1a:	xor    %r12d,%r12d
   14012aa1d:	mov    %rdx,(%rsi)
   14012aa20:	mov    0x1c8(%rsp),%rdx
   14012aa28:	mov    %rdx,0x8(%rsi)
   14012aa2c:	mov    %r8,%rsi
   14012aa2f:	jmp    1401266d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c67>
   14012aa34:	mov    0x1048(%rbx),%rdx
   14012aa3b:	lea    0x10(%rsi),%r8
   14012aa3f:	cmp    0x38(%rsp),%r8
   14012aa44:	jae    140132e88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf418>
   14012aa4a:	mov    0x1050(%rbx),%rax
   14012aa51:	vzeroupper
   14012aa54:	mov    0x1d0(%rsp),%rcx
   14012aa5c:	mov    %rcx,(%rsi)
   14012aa5f:	mov    0x1c8(%rsp),%rcx
   14012aa67:	mov    %rcx,0x8(%rsi)
   14012aa6b:	mov    %r8,%rsi
   14012aa6e:	jmp    140126a2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fbf>
   14012aa73:	mov    0x1048(%rbx),%rdx
   14012aa7a:	lea    0x10(%rsi),%r8
   14012aa7e:	cmp    0x38(%rsp),%r8
   14012aa83:	jae    140133270 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf800>
   14012aa89:	mov    0x1050(%rbx),%rax
   14012aa90:	vzeroupper
   14012aa93:	mov    0x1d0(%rsp),%rcx
   14012aa9b:	mov    %rcx,(%rsi)
   14012aa9e:	mov    0x1c8(%rsp),%rcx
   14012aaa6:	mov    %rcx,0x8(%rsi)
   14012aaaa:	mov    %r8,%rsi
   14012aaad:	jmp    140129ac3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6053>
   14012aab2:	mov    0x1e0(%rsp),%r8
   14012aaba:	and    %r8,%rdx
   14012aabd:	cmp    %rcx,%rdx
   14012aac0:	jne    14012524a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012aac6:	mov    %r8,%rcx
   14012aac9:	shl    $0x10,%rax
   14012aacd:	movabs $0xffffffffffff,%r8
   14012aad7:	shl    $0x10,%rcx
   14012aadb:	sar    $0x10,%rax
   14012aadf:	sar    $0x10,%rcx
   14012aae3:	add    %rcx,%rax
   14012aae6:	movabs $0x800000000000,%rcx
   14012aaf0:	add    %rax,%rcx
   14012aaf3:	cmp    %rcx,%r8
   14012aaf6:	jb     14012524a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17da>
   14012aafc:	and    %r8,%rax
   14012aaff:	or     %rdx,%rax
   14012ab02:	lea    -0x1(%rbp),%rdx
   14012ab06:	mov    %rax,0x1c8(%rsp)
   14012ab0e:	cmpb   $0x0,0x1520f(%rbx)
   14012ab15:	je     14012ab44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d4>
   14012ab17:	mov    0xe8(%r14),%rax
   14012ab1e:	mov    0xf0(%r14),%rcx
   14012ab25:	sub    %r15,%rdx
   14012ab28:	sub    %rax,%rcx
   14012ab2b:	cmp    %rcx,%rdx
   14012ab2e:	jae    14012ab44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d4>
   14012ab30:	add    %rdx,%rax
   14012ab33:	movzbl (%rax),%edi
   14012ab36:	lea    0x1(%rdi),%edx
   14012ab39:	mov    %dl,(%rax)
   14012ab3b:	cmp    $0x7,%dl
   14012ab3e:	jbe    14012ab44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70d4>
   14012ab40:	movb   $0xbc,-0x1(%rbp)
   14012ab44:	cmpb   $0x0,0x1040(%rbx)
   14012ab4b:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012ab51:	movzbl 0x0(%rbp),%eax
   14012ab55:	lea    0x295544(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ab5c:	add    $0x1,%rbp
   14012ab60:	mov    (%rdi,%rax,8),%rax
   14012ab64:	jmp    *%rax
   14012ab66:	mov    0x1048(%rbx),%rdx
   14012ab6d:	lea    0x10(%rsi),%r8
   14012ab71:	cmp    0x38(%rsp),%r8
   14012ab76:	jae    140132aee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf07e>
   14012ab7c:	mov    0x1050(%rbx),%rax
   14012ab83:	vzeroupper
   14012ab86:	mov    0x1d0(%rsp),%rcx
   14012ab8e:	mov    %rcx,(%rsi)
   14012ab91:	mov    0x1c8(%rsp),%rcx
   14012ab99:	mov    %rcx,0x8(%rsi)
   14012ab9d:	mov    %r8,%rsi
   14012aba0:	jmp    1401291b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5742>
   14012aba5:	mov    0x1048(%rbx),%rdx
   14012abac:	lea    0x10(%rsi),%r8
   14012abb0:	cmp    0x38(%rsp),%r8
   14012abb5:	jae    140132395 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe925>
   14012abbb:	mov    0x1050(%rbx),%rax
   14012abc2:	vzeroupper
   14012abc5:	mov    0x1d0(%rsp),%rcx
   14012abcd:	mov    %rcx,(%rsi)
   14012abd0:	mov    0x1c8(%rsp),%rcx
   14012abd8:	mov    %rcx,0x8(%rsi)
   14012abdc:	mov    %r8,%rsi
   14012abdf:	jmp    140129285 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5815>
   14012abe4:	mov    0x1048(%rbx),%rdx
   14012abeb:	lea    0x10(%rsi),%r8
   14012abef:	cmp    0x38(%rsp),%r8
   14012abf4:	jae    1401334fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa8a>
   14012abfa:	mov    0x1050(%rbx),%rax
   14012ac01:	vzeroupper
   14012ac04:	mov    0x1d0(%rsp),%rcx
   14012ac0c:	mov    %rcx,(%rsi)
   14012ac0f:	mov    0x1c8(%rsp),%rcx
   14012ac17:	mov    %rcx,0x8(%rsi)
   14012ac1b:	mov    %r8,%rsi
   14012ac1e:	jmp    14012991d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ead>
   14012ac23:	mov    0x1048(%rbx),%rdx
   14012ac2a:	lea    0x10(%rsi),%r8
   14012ac2e:	cmp    0x38(%rsp),%r8
   14012ac33:	jae    140132218 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7a8>
   14012ac39:	mov    0x1050(%rbx),%rax
   14012ac40:	vzeroupper
   14012ac43:	mov    0x1d0(%rsp),%rcx
   14012ac4b:	mov    %rcx,(%rsi)
   14012ac4e:	mov    0x1c8(%rsp),%rcx
   14012ac56:	mov    %rcx,0x8(%rsi)
   14012ac5a:	mov    %r8,%rsi
   14012ac5d:	jmp    140128e66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53f6>
   14012ac62:	and    %rax,%rdx
   14012ac65:	cmp    %r8,%rdx
   14012ac68:	je     14012f276 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb806>
   14012ac6e:	movabs $0xfffd000000000000,%r8
   14012ac78:	cmp    %r8,%rdx
   14012ac7b:	je     14013142e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9be>
   14012ac81:	movabs $0xfffc000000000000,%rdx
   14012ac8b:	cmp    %rdx,%rax
   14012ac8e:	je     14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   14012ac94:	movabs $0xfff7ffffffffffff,%rdx
   14012ac9e:	cmp    %rax,%rdx
   14012aca1:	jae    14012d17b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x970b>
   14012aca7:	movabs $0xffffffff00000000,%rdx
   14012acb1:	movabs $0xfffd000000000000,%r8
   14012acbb:	and    %rdx,%rcx
   14012acbe:	cmp    %r8,%rcx
   14012acc1:	je     140131382 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd912>
   14012acc7:	movabs $0xffff000000000000,%rdx
   14012acd1:	and    %rax,%rdx
   14012acd4:	cmp    %r8,%rdx
   14012acd7:	je     14012e59f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab2f>
   14012acdd:	movabs $0xfffd000100000000,%rax
   14012ace7:	cmp    %rax,%rcx
   14012acea:	jne    140125d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012acf0:	lea    0x2c0(%rsp),%rdx
   14012acf8:	lea    0x680(%rsp),%rcx
   14012ad00:	vzeroupper
   14012ad03:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012ad08:	lea    0x540(%rsp),%rax
   14012ad10:	lea    0x2b8(%rsp),%rdx
   14012ad18:	mov    %rax,%rcx
   14012ad1b:	mov    %rax,0x40(%rsp)
   14012ad20:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012ad25:	mov    0x40(%rsp),%rcx
   14012ad2a:	lea    0x680(%rsp),%rdx
   14012ad32:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012ad37:	shr    $0x1f,%eax
   14012ad3a:	jmp    140125dad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   14012ad3f:	mov    0x1048(%rbx),%rdx
   14012ad46:	lea    0x10(%rsi),%r8
   14012ad4a:	cmp    0x38(%rsp),%r8
   14012ad4f:	jae    1401323c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe951>
   14012ad55:	mov    0x1050(%rbx),%rax
   14012ad5c:	vzeroupper
   14012ad5f:	mov    0x1d0(%rsp),%rcx
   14012ad67:	mov    %rcx,(%rsi)
   14012ad6a:	mov    0x1c8(%rsp),%rcx
   14012ad72:	mov    %rcx,0x8(%rsi)
   14012ad76:	mov    %r8,%rsi
   14012ad79:	jmp    1401294fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a8e>
   14012ad7e:	mov    0x1048(%rbx),%rdx
   14012ad85:	lea    0x10(%rsi),%r8
   14012ad89:	cmp    0x38(%rsp),%r8
   14012ad8e:	jae    140132e5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3ec>
   14012ad94:	mov    0x1050(%rbx),%rax
   14012ad9b:	vzeroupper
   14012ad9e:	mov    0x1d0(%rsp),%rcx
   14012ada6:	mov    %rcx,(%rsi)
   14012ada9:	mov    0x1c8(%rsp),%rcx
   14012adb1:	mov    %rcx,0x8(%rsi)
   14012adb5:	mov    %r8,%rsi
   14012adb8:	jmp    1401299f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f80>
   14012adbd:	mov    0x1048(%rbx),%rdx
   14012adc4:	lea    0x10(%rsi),%r8
   14012adc8:	cmp    0x38(%rsp),%r8
   14012adcd:	jae    140133346 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8d6>
   14012add3:	mov    0x1050(%rbx),%rax
   14012adda:	vzeroupper
   14012addd:	mov    0x1d0(%rsp),%rcx
   14012ade5:	mov    %rcx,(%rsi)
   14012ade8:	mov    0x1c8(%rsp),%rcx
   14012adf0:	mov    %rcx,0x8(%rsi)
   14012adf4:	mov    %r8,%rsi
   14012adf7:	jmp    140128bed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x517d>
   14012adfc:	mov    0x1048(%rbx),%rdx
   14012ae03:	lea    0x10(%rsi),%r8
   14012ae07:	cmp    0x38(%rsp),%r8
   14012ae0c:	jae    140132f38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4c8>
   14012ae12:	mov    0x1050(%rbx),%rax
   14012ae19:	vzeroupper
   14012ae1c:	mov    0x1d0(%rsp),%rcx
   14012ae24:	mov    %rcx,(%rsi)
   14012ae27:	mov    0x1c8(%rsp),%rcx
   14012ae2f:	mov    %rcx,0x8(%rsi)
   14012ae33:	mov    %r8,%rsi
   14012ae36:	jmp    140126ff4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3584>
   14012ae3b:	mov    0x1048(%rbx),%rdx
   14012ae42:	lea    0x10(%rsi),%r8
   14012ae46:	cmp    0x38(%rsp),%r8
   14012ae4b:	jae    14013233d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8cd>
   14012ae51:	mov    0x1050(%rbx),%rax
   14012ae58:	vzeroupper
   14012ae5b:	mov    0x1d0(%rsp),%rcx
   14012ae63:	mov    %rcx,(%rsi)
   14012ae66:	mov    0x1c8(%rsp),%rcx
   14012ae6e:	mov    %rcx,0x8(%rsi)
   14012ae72:	mov    %r8,%rsi
   14012ae75:	jmp    140129358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58e8>
   14012ae7a:	mov    0x1048(%rbx),%rdx
   14012ae81:	lea    0x10(%rsi),%r8
   14012ae85:	cmp    0x38(%rsp),%r8
   14012ae8a:	jae    140133600 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb90>
   14012ae90:	mov    0x1050(%rbx),%rax
   14012ae97:	vzeroupper
   14012ae9a:	mov    0x1d0(%rsp),%rcx
   14012aea2:	mov    %rcx,(%rsi)
   14012aea5:	mov    0x1c8(%rsp),%rcx
   14012aead:	mov    %rcx,0x8(%rsi)
   14012aeb1:	mov    %r8,%rsi
   14012aeb4:	jmp    140129dbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x634e>
   14012aeb9:	mov    0x1048(%rbx),%rdx
   14012aec0:	lea    0x10(%rsi),%r8
   14012aec4:	cmp    0x38(%rsp),%r8
   14012aec9:	jae    140133579 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb09>
   14012aecf:	mov    0x1050(%rbx),%rax
   14012aed6:	vzeroupper
   14012aed9:	mov    0x1d0(%rsp),%rcx
   14012aee1:	mov    %rcx,(%rsi)
   14012aee4:	mov    0x1c8(%rsp),%rcx
   14012aeec:	mov    %rcx,0x8(%rsi)
   14012aef0:	mov    %r8,%rsi
   14012aef3:	jmp    14012900c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x559c>
   14012aef8:	mov    0x1048(%rbx),%rdx
   14012aeff:	lea    0x10(%rsi),%r8
   14012af03:	cmp    0x38(%rsp),%r8
   14012af08:	jae    140132b1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0aa>
   14012af0e:	mov    0x1050(%rbx),%rax
   14012af15:	vzeroupper
   14012af18:	mov    0x1d0(%rsp),%rcx
   14012af20:	mov    %rcx,(%rsi)
   14012af23:	mov    0x1c8(%rsp),%rcx
   14012af2b:	mov    %rcx,0x8(%rsi)
   14012af2f:	jmp    140129c83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6213>
   14012af34:	mov    0x1048(%rbx),%rdx
   14012af3b:	lea    0x10(%rsi),%r8
   14012af3f:	cmp    0x38(%rsp),%r8
   14012af44:	jae    140132459 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9e9>
   14012af4a:	mov    0x1050(%rbx),%rax
   14012af51:	vzeroupper
   14012af54:	mov    0x1d0(%rsp),%rcx
   14012af5c:	mov    %rcx,(%rsi)
   14012af5f:	mov    0x1c8(%rsp),%rcx
   14012af67:	mov    %rcx,0x8(%rsi)
   14012af6b:	mov    %r8,%rsi
   14012af6e:	jmp    1401296a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c34>
   14012af73:	mov    0x1048(%rbx),%rdx
   14012af7a:	lea    0x10(%rsi),%r8
   14012af7e:	cmp    0x38(%rsp),%r8
   14012af83:	jae    14013339a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf92a>
   14012af89:	mov    0x1050(%rbx),%rax
   14012af90:	vzeroupper
   14012af93:	mov    0x1d0(%rsp),%rcx
   14012af9b:	mov    %rcx,(%rsi)
   14012af9e:	mov    0x1c8(%rsp),%rcx
   14012afa6:	mov    %rcx,0x8(%rsi)
   14012afaa:	mov    %r8,%rsi
   14012afad:	jmp    140128cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5250>
   14012afb2:	mov    0x1048(%rbx),%rdx
   14012afb9:	lea    0x10(%rsi),%r8
   14012afbd:	cmp    0x38(%rsp),%r8
   14012afc2:	jae    14013341e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9ae>
   14012afc8:	mov    0x1050(%rbx),%rax
   14012afcf:	vzeroupper
   14012afd2:	mov    0x1d0(%rsp),%rcx
   14012afda:	mov    %rcx,(%rsi)
   14012afdd:	mov    0x1c8(%rsp),%rcx
   14012afe5:	mov    %rcx,0x8(%rsi)
   14012afe9:	mov    %r8,%rsi
   14012afec:	jmp    140129b96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6126>
   14012aff1:	lea    0x680(%rsp),%rcx
   14012aff9:	mov    %rdi,%rdx
   14012affc:	vzeroupper
   14012afff:	mov    $0x1,%r12d
   14012b005:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012b00a:	mov    0x680(%rsp),%rax
   14012b012:	mov    %rax,0x1c8(%rsp)
   14012b01a:	jmp    140124d08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1298>
   14012b01f:	mov    0x1048(%rbx),%rdx
   14012b026:	lea    0x10(%rsi),%r8
   14012b02a:	cmp    0x38(%rsp),%r8
   14012b02f:	jae    140132a71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf001>
   14012b035:	mov    0x1050(%rbx),%rax
   14012b03c:	vzeroupper
   14012b03f:	mov    0x1d0(%rsp),%rcx
   14012b047:	mov    %rcx,(%rsi)
   14012b04a:	mov    0x1c8(%rsp),%rcx
   14012b052:	mov    %rcx,0x8(%rsi)
   14012b056:	mov    %r8,%rsi
   14012b059:	jmp    14012942b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59bb>
   14012b05e:	mov    0x1048(%rbx),%rdx
   14012b065:	lea    0x10(%rsi),%r8
   14012b069:	cmp    0x38(%rsp),%r8
   14012b06e:	jae    140132369 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8f9>
   14012b074:	mov    0x1050(%rbx),%rax
   14012b07b:	vzeroupper
   14012b07e:	mov    0x1d0(%rsp),%rcx
   14012b086:	mov    %rcx,(%rsi)
   14012b089:	mov    0x1c8(%rsp),%rcx
   14012b091:	mov    %rcx,0x8(%rsi)
   14012b095:	mov    %r8,%rsi
   14012b098:	jmp    1401295d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b61>
   14012b09d:	mov    0x1048(%rbx),%rdx
   14012b0a4:	lea    0x10(%rsi),%r8
   14012b0a8:	cmp    0x38(%rsp),%r8
   14012b0ad:	jae    1401333c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf956>
   14012b0b3:	mov    0x1050(%rbx),%rax
   14012b0ba:	vzeroupper
   14012b0bd:	mov    0x1d0(%rsp),%rcx
   14012b0c5:	mov    %rcx,(%rsi)
   14012b0c8:	mov    0x1c8(%rsp),%rcx
   14012b0d0:	mov    %rcx,0x8(%rsi)
   14012b0d4:	mov    %r8,%rsi
   14012b0d7:	jmp    140129e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6421>
   14012b0dc:	mov    0x1048(%rbx),%rdx
   14012b0e3:	lea    0x10(%rsi),%r8
   14012b0e7:	cmp    0x38(%rsp),%r8
   14012b0ec:	jae    14013362c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbbc>
   14012b0f2:	mov    0x1050(%rbx),%rax
   14012b0f9:	vzeroupper
   14012b0fc:	mov    0x1d0(%rsp),%rcx
   14012b104:	mov    %rcx,(%rsi)
   14012b107:	mov    0x1c8(%rsp),%rcx
   14012b10f:	mov    %rcx,0x8(%rsi)
   14012b113:	mov    %r8,%rsi
   14012b116:	jmp    140128f39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54c9>
   14012b11b:	mov    0x1048(%rbx),%rdx
   14012b122:	lea    0x10(%rsi),%r8
   14012b126:	cmp    0x38(%rsp),%r8
   14012b12b:	jae    140132a9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf02d>
   14012b131:	mov    0x1050(%rbx),%rax
   14012b138:	mov    0x1d0(%rsp),%rcx
   14012b140:	mov    %rcx,(%rsi)
   14012b143:	mov    0x1c8(%rsp),%rcx
   14012b14b:	mov    %rcx,0x8(%rsi)
   14012b14f:	mov    %r8,%rsi
   14012b152:	jmp    140129cee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x627e>
   14012b157:	mov    0x1048(%rbx),%rdx
   14012b15e:	lea    0x10(%rsi),%r8
   14012b162:	cmp    0x38(%rsp),%r8
   14012b167:	jae    14013354d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfadd>
   14012b16d:	mov    0x1050(%rbx),%rax
   14012b174:	vzeroupper
   14012b177:	mov    0x1d0(%rsp),%rcx
   14012b17f:	mov    %rcx,(%rsi)
   14012b182:	mov    0x1c8(%rsp),%rcx
   14012b18a:	mov    %rcx,0x8(%rsi)
   14012b18e:	mov    %r8,%rsi
   14012b191:	jmp    140129777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d07>
   14012b196:	mov    0x1048(%rbx),%rdx
   14012b19d:	lea    0x10(%rsi),%r8
   14012b1a1:	cmp    0x38(%rsp),%r8
   14012b1a6:	jae    1401334ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa5e>
   14012b1ac:	mov    0x1050(%rbx),%rax
   14012b1b3:	vzeroupper
   14012b1b6:	mov    0x1d0(%rsp),%rcx
   14012b1be:	mov    %rcx,(%rsi)
   14012b1c1:	mov    0x1c8(%rsp),%rcx
   14012b1c9:	mov    %rcx,0x8(%rsi)
   14012b1cd:	mov    %r8,%rsi
   14012b1d0:	jmp    140128d93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5323>
   14012b1d5:	mov    0x1048(%rbx),%rdx
   14012b1dc:	lea    0x10(%rsi),%r8
   14012b1e0:	cmp    0x38(%rsp),%r8
   14012b1e5:	jae    1401333f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf982>
   14012b1eb:	mov    0x1050(%rbx),%rax
   14012b1f2:	vzeroupper
   14012b1f5:	mov    0x1d0(%rsp),%rcx
   14012b1fd:	mov    %rcx,(%rsi)
   14012b200:	mov    0x1c8(%rsp),%rcx
   14012b208:	mov    %rcx,0x8(%rsi)
   14012b20c:	mov    %r8,%rsi
   14012b20f:	jmp    1401290df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x566f>
   14012b214:	and    %rax,%rdx
   14012b217:	cmp    %r8,%rdx
   14012b21a:	je     14012ea9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb02b>
   14012b220:	movabs $0xfffd000000000000,%r8
   14012b22a:	cmp    %r8,%rdx
   14012b22d:	je     140131958 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdee8>
   14012b233:	movabs $0xfff7ffffffffffff,%rdx
   14012b23d:	cmp    %rax,%rdx
   14012b240:	jae    14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   14012b246:	movabs $0xfffc000000000000,%rdx
   14012b250:	cmp    %rdx,%rax
   14012b253:	je     14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x969c>
   14012b259:	movabs $0xffffffff00000000,%rdx
   14012b263:	movabs $0xfffd000000000000,%r8
   14012b26d:	and    %rdx,%rcx
   14012b270:	cmp    %r8,%rcx
   14012b273:	je     14013105f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5ef>
   14012b279:	movabs $0xffff000000000000,%rdx
   14012b283:	and    %rax,%rdx
   14012b286:	cmp    %r8,%rdx
   14012b289:	je     14012e490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa20>
   14012b28f:	movabs $0xfffd000100000000,%rax
   14012b299:	cmp    %rax,%rcx
   14012b29c:	jne    140126114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012b2a2:	lea    0x2f0(%rsp),%rdx
   14012b2aa:	lea    0x680(%rsp),%rcx
   14012b2b2:	vzeroupper
   14012b2b5:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b2ba:	lea    0x540(%rsp),%rax
   14012b2c2:	lea    0x2e8(%rsp),%rdx
   14012b2ca:	mov    %rax,%rcx
   14012b2cd:	mov    %rax,0x40(%rsp)
   14012b2d2:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b2d7:	mov    0x40(%rsp),%rcx
   14012b2dc:	lea    0x680(%rsp),%rdx
   14012b2e4:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012b2e9:	not    %eax
   14012b2eb:	shr    $0x1f,%eax
   14012b2ee:	jmp    14012613a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   14012b2f3:	and    %rdx,%rax
   14012b2f6:	cmp    %r8,%rax
   14012b2f9:	je     14012eb22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0b2>
   14012b2ff:	movabs $0xfffd000000000000,%r8
   14012b309:	cmp    %r8,%rax
   14012b30c:	je     1401311bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd74f>
   14012b312:	movabs $0xfffc000000000000,%rax
   14012b31c:	cmp    %rax,%rdx
   14012b31f:	je     14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   14012b325:	movabs $0xfff7ffffffffffff,%rax
   14012b32f:	cmp    %rdx,%rax
   14012b332:	jae    14012d139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96c9>
   14012b338:	movabs $0xffffffff00000000,%rax
   14012b342:	movabs $0xfffd000000000000,%r8
   14012b34c:	and    %rax,%rcx
   14012b34f:	cmp    %r8,%rcx
   14012b352:	je     14013111c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6ac>
   14012b358:	movabs $0xffff000000000000,%rax
   14012b362:	and    %rdx,%rax
   14012b365:	cmp    %r8,%rax
   14012b368:	je     14012e517 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaa7>
   14012b36e:	movabs $0xfffd000100000000,%rax
   14012b378:	cmp    %rax,%rcx
   14012b37b:	jne    140125b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012b381:	lea    0x2a0(%rsp),%rdx
   14012b389:	lea    0x680(%rsp),%rcx
   14012b391:	vzeroupper
   14012b394:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b399:	lea    0x540(%rsp),%rax
   14012b3a1:	lea    0x298(%rsp),%rdx
   14012b3a9:	mov    %rax,%rcx
   14012b3ac:	mov    %rax,0x40(%rsp)
   14012b3b1:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b3b6:	mov    0x40(%rsp),%rcx
   14012b3bb:	lea    0x680(%rsp),%rdx
   14012b3c3:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012b3c8:	test   %eax,%eax
   14012b3ca:	sete   %dil
   14012b3ce:	jmp    140125b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   14012b3d3:	mov    %edi,0x690(%rsp)
   14012b3da:	mov    $0x1,%r12d
   14012b3e0:	lea    0x1a0(%rsp),%rdx
   14012b3e8:	lea    0x540(%rsp),%rcx
   14012b3f0:	movl   $0x0,0x694(%rsp)
   14012b3fb:	mov    0x690(%rsp),%rax
   14012b403:	vmovdqa %xmm0,0x680(%rsp)
   14012b40c:	mov    %rax,0x1b0(%rsp)
   14012b414:	vmovdqa %xmm0,0x1a0(%rsp)
   14012b41d:	vzeroupper
   14012b420:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012b425:	mov    0x540(%rsp),%rax
   14012b42d:	mov    %rax,0x1c8(%rsp)
   14012b435:	jmp    140124e60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0>
   14012b43a:	mov    0x1048(%rbx),%rdx
   14012b441:	lea    0x10(%rsi),%r8
   14012b445:	cmp    0x38(%rsp),%r8
   14012b44a:	jae    1401322ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe87d>
   14012b450:	mov    0x1050(%rbx),%rax
   14012b457:	vzeroupper
   14012b45a:	mov    0x1d0(%rsp),%rcx
   14012b462:	mov    %rcx,(%rsi)
   14012b465:	mov    0x1c8(%rsp),%rcx
   14012b46d:	mov    %rcx,0x8(%rsi)
   14012b471:	mov    %r8,%rsi
   14012b474:	jmp    140126ca8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3238>
   14012b479:	mov    0x1048(%rbx),%rdx
   14012b480:	lea    0x10(%rsi),%r8
   14012b484:	cmp    0x38(%rsp),%r8
   14012b489:	jae    140132871 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee01>
   14012b48f:	mov    0x1050(%rbx),%rax
   14012b496:	vzeroupper
   14012b499:	mov    0x1d0(%rsp),%rcx
   14012b4a1:	mov    %rcx,(%rsi)
   14012b4a4:	mov    0x1c8(%rsp),%rcx
   14012b4ac:	mov    %rcx,0x8(%rsi)
   14012b4b0:	mov    %r8,%rsi
   14012b4b3:	jmp    140126d7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x330b>
   14012b4b8:	mov    0x1048(%rbx),%rdx
   14012b4bf:	lea    0x10(%rsi),%r8
   14012b4c3:	cmp    0x38(%rsp),%r8
   14012b4c8:	jae    1401332c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf852>
   14012b4ce:	mov    0x1050(%rbx),%rax
   14012b4d5:	vzeroupper
   14012b4d8:	mov    0x1d0(%rsp),%rcx
   14012b4e0:	mov    %rcx,(%rsi)
   14012b4e3:	mov    0x1c8(%rsp),%rcx
   14012b4eb:	mov    %rcx,0x8(%rsi)
   14012b4ef:	mov    %r8,%rsi
   14012b4f2:	jmp    140126e4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33de>
   14012b4f7:	mov    0x3c0(%rsp),%r8
   14012b4ff:	and    %r8,%rax
   14012b502:	cmp    %rcx,%rax
   14012b505:	jne    1401288c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e50>
   14012b50b:	mov    0x3b8(%rsp),%rax
   14012b513:	shl    $0x10,%r8
   14012b517:	movabs $0xfffa000000000000,%rdx
   14012b521:	shl    $0x10,%rax
   14012b525:	cmp    %r8,%rax
   14012b528:	movabs $0xfffa000000000001,%rax
   14012b532:	cmovg  %rax,%rdx
   14012b536:	mov    %rdx,0x1c8(%rsp)
   14012b53e:	cmpb   $0x0,0x1040(%rbx)
   14012b545:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012b54b:	movzbl 0x0(%rbp),%eax
   14012b54f:	lea    0x294b4a(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b556:	add    $0x1,%rbp
   14012b55a:	mov    (%rdi,%rax,8),%rax
   14012b55e:	jmp    *%rax
   14012b560:	and    %rax,%rdx
   14012b563:	cmp    %r8,%rdx
   14012b566:	je     14012eea0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb430>
   14012b56c:	movabs $0xfffd000000000000,%r8
   14012b576:	cmp    %r8,%rdx
   14012b579:	je     140131935 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdec5>
   14012b57f:	movabs $0xfffc000000000000,%rdx
   14012b589:	cmp    %rdx,%rax
   14012b58c:	je     14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   14012b592:	movabs $0xfff7ffffffffffff,%rdx
   14012b59c:	cmp    %rax,%rdx
   14012b59f:	jae    14012d1a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9738>
   14012b5a5:	movabs $0xffffffff00000000,%rdx
   14012b5af:	movabs $0xfffd000000000000,%r8
   14012b5b9:	and    %rdx,%rcx
   14012b5bc:	cmp    %r8,%rcx
   14012b5bf:	je     140131889 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde19>
   14012b5c5:	movabs $0xffff000000000000,%rdx
   14012b5cf:	and    %rax,%rdx
   14012b5d2:	cmp    %r8,%rdx
   14012b5d5:	je     14012e61f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabaf>
   14012b5db:	movabs $0xfffd000100000000,%rax
   14012b5e5:	cmp    %rax,%rcx
   14012b5e8:	jne    140125fe5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012b5ee:	lea    0x2e0(%rsp),%rdx
   14012b5f6:	lea    0x680(%rsp),%rcx
   14012b5fe:	vzeroupper
   14012b601:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b606:	lea    0x540(%rsp),%rax
   14012b60e:	lea    0x2d8(%rsp),%rdx
   14012b616:	mov    %rax,%rcx
   14012b619:	mov    %rax,0x40(%rsp)
   14012b61e:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012b623:	mov    0x40(%rsp),%rcx
   14012b628:	lea    0x680(%rsp),%rdx
   14012b630:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012b635:	test   %eax,%eax
   14012b637:	setg   %al
   14012b63a:	jmp    14012600b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   14012b63f:	mov    %r8,%rax
   14012b642:	shr    $0x20,%rax
   14012b646:	cmp    $0x3,%ax
   14012b64a:	je     14012f105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb695>
   14012b650:	cmp    $0x2,%ax
   14012b654:	jne    140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012b65a:	mov    %r8,0x350(%rsp)
   14012b662:	lea    0x350(%rsp),%rcx
   14012b66a:	vzeroupper
   14012b66d:	call   14021bef0 <setun::VMValue::payload() const>
   14012b672:	mov    0x48(%rax),%rdi
   14012b676:	test   %rdi,%rdi
   14012b679:	je     140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012b67f:	lea    0x680(%rsp),%rax
   14012b687:	lea    0x348(%rsp),%rdx
   14012b68f:	mov    %rax,%rcx
   14012b692:	mov    %rax,0x40(%rsp)
   14012b697:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b69c:	mov    0x40(%rsp),%rdx
   14012b6a1:	lea    0x340(%rsp),%r8
   14012b6a9:	mov    %rdi,%rcx
   14012b6ac:	call   140211840 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b6b1:	mov    0x680(%rsp),%rcx
   14012b6b9:	lea    0x690(%rsp),%rax
   14012b6c1:	cmp    %rax,%rcx
   14012b6c4:	je     140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012b6ca:	mov    0x690(%rsp),%rax
   14012b6d2:	lea    0x1(%rax),%rdx
   14012b6d6:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012b6db:	jmp    140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012b6e0:	mov    0x1048(%rbx),%rdx
   14012b6e7:	lea    0x10(%rsi),%r8
   14012b6eb:	cmp    0x38(%rsp),%r8
   14012b6f0:	jae    140133171 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf701>
   14012b6f6:	mov    0x1050(%rbx),%rax
   14012b6fd:	vzeroupper
   14012b700:	mov    0x1d0(%rsp),%rcx
   14012b708:	mov    %rcx,(%rsi)
   14012b70b:	mov    0x1c8(%rsp),%rcx
   14012b713:	mov    %rcx,0x8(%rsi)
   14012b717:	mov    %r8,%rsi
   14012b71a:	jmp    14012984a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dda>
   14012b71f:	mov    0x1c8(%rsp),%rcx
   14012b727:	xor    %r12d,%r12d
   14012b72a:	mov    %rcx,(%rdx,%r13,8)
   14012b72e:	jmp    140126809 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d99>
   14012b733:	mov    0x200(%rsp),%rcx
   14012b73b:	and    %rcx,%rax
   14012b73e:	cmp    %r8,%rax
   14012b741:	jne    1401253b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1948>
   14012b747:	shl    $0x10,%rcx
   14012b74b:	shl    $0x10,%rdx
   14012b74f:	movabs $0xffffffffffff,%r8
   14012b759:	sar    $0x10,%rcx
   14012b75d:	sar    $0x10,%rdx
   14012b761:	imul   %rcx,%rdx
   14012b765:	movabs $0x800000000000,%rcx
   14012b76f:	add    %rdx,%rcx
   14012b772:	cmp    %rcx,%r8
   14012b775:	jb     1401253b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1948>
   14012b77b:	and    %r8,%rdx
   14012b77e:	or     %rdx,%rax
   14012b781:	lea    -0x1(%rbp),%rdx
   14012b785:	mov    %rax,0x1c8(%rsp)
   14012b78d:	cmpb   $0x0,0x1520f(%rbx)
   14012b794:	je     14012b7c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d53>
   14012b796:	mov    0xe8(%r14),%rax
   14012b79d:	mov    0xf0(%r14),%rcx
   14012b7a4:	sub    %r15,%rdx
   14012b7a7:	sub    %rax,%rcx
   14012b7aa:	cmp    %rcx,%rdx
   14012b7ad:	jae    14012b7c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d53>
   14012b7af:	add    %rdx,%rax
   14012b7b2:	movzbl (%rax),%edi
   14012b7b5:	lea    0x1(%rdi),%edx
   14012b7b8:	mov    %dl,(%rax)
   14012b7ba:	cmp    $0x7,%dl
   14012b7bd:	jbe    14012b7c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d53>
   14012b7bf:	movb   $0xbe,-0x1(%rbp)
   14012b7c3:	cmpb   $0x0,0x1040(%rbx)
   14012b7ca:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012b7d0:	movzbl 0x0(%rbp),%eax
   14012b7d4:	lea    0x2948c5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b7db:	add    $0x1,%rbp
   14012b7df:	mov    (%rdi,%rax,8),%rax
   14012b7e3:	jmp    *%rax
   14012b7e5:	mov    0x1f0(%rsp),%r8
   14012b7ed:	and    %r8,%rdx
   14012b7f0:	cmp    %rcx,%rdx
   14012b7f3:	jne    140125301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1891>
   14012b7f9:	mov    %r8,%rcx
   14012b7fc:	shl    $0x10,%rax
   14012b800:	movabs $0xffffffffffff,%r8
   14012b80a:	shl    $0x10,%rcx
   14012b80e:	sar    $0x10,%rax
   14012b812:	sar    $0x10,%rcx
   14012b816:	sub    %rcx,%rax
   14012b819:	movabs $0x800000000000,%rcx
   14012b823:	add    %rax,%rcx
   14012b826:	cmp    %rcx,%r8
   14012b829:	jb     140125301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1891>
   14012b82f:	and    %r8,%rax
   14012b832:	or     %rdx,%rax
   14012b835:	lea    -0x1(%rbp),%rdx
   14012b839:	mov    %rax,0x1c8(%rsp)
   14012b841:	cmpb   $0x0,0x1520f(%rbx)
   14012b848:	je     14012b877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e07>
   14012b84a:	mov    0xe8(%r14),%rax
   14012b851:	mov    0xf0(%r14),%rcx
   14012b858:	sub    %r15,%rdx
   14012b85b:	sub    %rax,%rcx
   14012b85e:	cmp    %rcx,%rdx
   14012b861:	jae    14012b877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e07>
   14012b863:	add    %rdx,%rax
   14012b866:	movzbl (%rax),%edi
   14012b869:	lea    0x1(%rdi),%edx
   14012b86c:	mov    %dl,(%rax)
   14012b86e:	cmp    $0x7,%dl
   14012b871:	jbe    14012b877 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e07>
   14012b873:	movb   $0xbd,-0x1(%rbp)
   14012b877:	cmpb   $0x0,0x1040(%rbx)
   14012b87e:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012b884:	movzbl 0x0(%rbp),%eax
   14012b888:	lea    0x294811(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b88f:	add    $0x1,%rbp
   14012b893:	mov    (%rdi,%rax,8),%rax
   14012b897:	jmp    *%rax
   14012b899:	shr    $0x20,%rdx
   14012b89d:	cmp    $0x1,%dx
   14012b8a1:	je     14012ea6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaffe>
   14012b8a7:	cmp    $0x5,%dx
   14012b8ab:	jne    140124a96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1026>
   14012b8b1:	mov    %r9,0x80(%rsp)
   14012b8b9:	call   14021aa80 <setun::VMValue::as_int() const>
   14012b8be:	jmp    140124aa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1038>
   14012b8c3:	mov    0x1048(%rbx),%rdx
   14012b8ca:	lea    0x10(%rsi),%r8
   14012b8ce:	cmp    0x38(%rsp),%r8
   14012b8d3:	jae    140132dc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf352>
   14012b8d9:	mov    0x1050(%rbx),%rax
   14012b8e0:	vzeroupper
   14012b8e3:	mov    0x1d0(%rsp),%rcx
   14012b8eb:	mov    %rcx,(%rsi)
   14012b8ee:	mov    0x1c8(%rsp),%rcx
   14012b8f6:	mov    %rcx,0x8(%rsi)
   14012b8fa:	jmp    140124787 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd17>
   14012b8ff:	mov    0x1048(%rbx),%rdx
   14012b906:	lea    0x10(%rsi),%r8
   14012b90a:	cmp    0x38(%rsp),%r8
   14012b90f:	jae    1401321ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe73d>
   14012b915:	mov    0x1050(%rbx),%rax
   14012b91c:	vzeroupper
   14012b91f:	mov    0x1d0(%rsp),%rcx
   14012b927:	mov    %rcx,(%rsi)
   14012b92a:	mov    0x1c8(%rsp),%rcx
   14012b932:	mov    %rcx,0x8(%rsi)
   14012b936:	mov    %r8,%rsi
   14012b939:	jmp    14012695c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eec>
   14012b93e:	mov    0x1048(%rbx),%rdx
   14012b945:	lea    0x10(%rsi),%r8
   14012b949:	cmp    0x38(%rsp),%r8
   14012b94e:	jae    140132eb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf444>
   14012b954:	mov    0x1050(%rbx),%rax
   14012b95b:	vzeroupper
   14012b95e:	mov    0x1d0(%rsp),%rcx
   14012b966:	mov    %rcx,(%rsi)
   14012b969:	mov    0x1c8(%rsp),%rcx
   14012b971:	mov    %rcx,0x8(%rsi)
   14012b975:	mov    %r8,%rsi
   14012b978:	jmp    14012768c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c1c>
   14012b97d:	mov    0x1048(%rbx),%rdx
   14012b984:	lea    0x10(%rsi),%r8
   14012b988:	cmp    0x38(%rsp),%r8
   14012b98d:	jae    140132ee0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf470>
   14012b993:	mov    0x1050(%rbx),%rax
   14012b99a:	vzeroupper
   14012b99d:	mov    0x1d0(%rsp),%rcx
   14012b9a5:	mov    %rcx,(%rsi)
   14012b9a8:	mov    0x1c8(%rsp),%rcx
   14012b9b0:	mov    %rcx,0x8(%rsi)
   14012b9b4:	mov    %r8,%rsi
   14012b9b7:	jmp    140126b02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3092>
   14012b9bc:	mov    0x1048(%rbx),%rdx
   14012b9c3:	lea    0x10(%rsi),%r8
   14012b9c7:	cmp    0x38(%rsp),%r8
   14012b9cc:	jae    14013331a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8aa>
   14012b9d2:	mov    0x1050(%rbx),%rax
   14012b9d9:	vzeroupper
   14012b9dc:	mov    0x1d0(%rsp),%rcx
   14012b9e4:	mov    %rcx,(%rsi)
   14012b9e7:	mov    0x1c8(%rsp),%rcx
   14012b9ef:	mov    %rcx,0x8(%rsi)
   14012b9f3:	mov    %r8,%rsi
   14012b9f6:	jmp    14012719a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x372a>
   14012b9fb:	mov    0x3a0(%rsp),%r8
   14012ba03:	and    %r8,%rax
   14012ba06:	cmp    %rcx,%rax
   14012ba09:	jne    1401285fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b8e>
   14012ba0f:	mov    0x398(%rsp),%rax
   14012ba17:	shl    $0x10,%r8
   14012ba1b:	movabs $0xfffa000000000000,%rdx
   14012ba25:	shl    $0x10,%rax
   14012ba29:	cmp    %r8,%rax
   14012ba2c:	movabs $0xfffa000000000001,%rax
   14012ba36:	cmovle %rax,%rdx
   14012ba3a:	mov    %rdx,0x1c8(%rsp)
   14012ba42:	cmpb   $0x0,0x1040(%rbx)
   14012ba49:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012ba4f:	movzbl 0x0(%rbp),%eax
   14012ba53:	lea    0x294646(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ba5a:	add    $0x1,%rbp
   14012ba5e:	mov    (%rdi,%rax,8),%rax
   14012ba62:	jmp    *%rax
   14012ba64:	mov    (%r11),%r10
   14012ba67:	and    %r10,%r9
   14012ba6a:	mov    %r9,0x60(%rsp)
   14012ba6f:	cmp    %rdx,%r9
   14012ba72:	jne    1401278a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e30>
   14012ba78:	mov    %r10,%rdx
   14012ba7b:	mov    %r8,%r9
   14012ba7e:	shl    $0x10,%rdx
   14012ba82:	shl    $0x10,%r9
   14012ba86:	sar    $0x10,%rdx
   14012ba8a:	sar    $0x10,%r9
   14012ba8e:	lea    (%rdx,%r9,1),%r10
   14012ba92:	movabs $0x800000000000,%rdx
   14012ba9c:	movabs $0xffffffffffff,%r9
   14012baa6:	add    %r10,%rdx
   14012baa9:	cmp    %rdx,%r9
   14012baac:	jb     1401278a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e30>
   14012bab2:	mov    %r10,%rdx
   14012bab5:	and    %r9,%rdx
   14012bab8:	or     0x60(%rsp),%rdx
   14012babd:	mov    %rdx,(%rax,%rdi,8)
   14012bac1:	cmpb   $0x0,0x1040(%rbx)
   14012bac8:	je     14012cabe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x904e>
   14012bace:	movzbl 0x6(%rbp),%eax
   14012bad2:	lea    0x2945c7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bad9:	add    $0x7,%rbp
   14012badd:	mov    (%rdi,%rax,8),%rax
   14012bae1:	jmp    *%rax
   14012bae3:	mov    0x1048(%rbx),%rdx
   14012baea:	lea    0x10(%rsi),%r8
   14012baee:	cmp    0x38(%rsp),%r8
   14012baf3:	jae    140133016 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5a6>
   14012baf9:	mov    0x1050(%rbx),%rax
   14012bb00:	vzeroupper
   14012bb03:	mov    0x1d0(%rsp),%rcx
   14012bb0b:	mov    %rcx,(%rsi)
   14012bb0e:	mov    0x1c8(%rsp),%rcx
   14012bb16:	mov    %rcx,0x8(%rsi)
   14012bb1a:	mov    %r8,%rsi
   14012bb1d:	jmp    1401274e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a76>
   14012bb22:	mov    0x1048(%rbx),%rdx
   14012bb29:	lea    0x10(%rsi),%r8
   14012bb2d:	cmp    0x38(%rsp),%r8
   14012bb32:	jae    140132f0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf49c>
   14012bb38:	mov    0x1050(%rbx),%rax
   14012bb3f:	vzeroupper
   14012bb42:	mov    0x1d0(%rsp),%rcx
   14012bb4a:	mov    %rcx,(%rsi)
   14012bb4d:	mov    0x1c8(%rsp),%rcx
   14012bb55:	mov    %rcx,0x8(%rsi)
   14012bb59:	mov    %r8,%rsi
   14012bb5c:	jmp    1401275b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b49>
   14012bb61:	and    %rax,%rdx
   14012bb64:	cmp    %r8,%rdx
   14012bb67:	je     14012f07e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb60e>
   14012bb6d:	movabs $0xfffd000000000000,%r8
   14012bb77:	cmp    %r8,%rdx
   14012bb7a:	je     140131350 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8e0>
   14012bb80:	movabs $0xfffc000000000000,%rdx
   14012bb8a:	cmp    %rdx,%rax
   14012bb8d:	je     14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   14012bb93:	movabs $0xfff7ffffffffffff,%rdx
   14012bb9d:	cmp    %rax,%rdx
   14012bba0:	jae    14012d0df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x966f>
   14012bba6:	movabs $0xffffffff00000000,%rdx
   14012bbb0:	movabs $0xfffd000000000000,%r8
   14012bbba:	and    %rdx,%rcx
   14012bbbd:	cmp    %r8,%rcx
   14012bbc0:	je     1401312a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd834>
   14012bbc6:	movabs $0xffff000000000000,%rdx
   14012bbd0:	and    %rax,%rdx
   14012bbd3:	cmp    %r8,%rdx
   14012bbd6:	je     14012e3f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa984>
   14012bbdc:	movabs $0xfffd000100000000,%rax
   14012bbe6:	cmp    %rax,%rcx
   14012bbe9:	jne    140125eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012bbef:	lea    0x2d0(%rsp),%rdx
   14012bbf7:	lea    0x680(%rsp),%rcx
   14012bbff:	vzeroupper
   14012bc02:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012bc07:	lea    0x540(%rsp),%rax
   14012bc0f:	lea    0x2c8(%rsp),%rdx
   14012bc17:	mov    %rax,%rcx
   14012bc1a:	mov    %rax,0x40(%rsp)
   14012bc1f:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012bc24:	mov    0x40(%rsp),%rcx
   14012bc29:	lea    0x680(%rsp),%rdx
   14012bc31:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bc36:	test   %eax,%eax
   14012bc38:	setle  %al
   14012bc3b:	jmp    140125edc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   14012bc40:	mov    %rdx,%rax
   14012bc43:	shr    $0x20,%rax
   14012bc47:	cmp    $0x3,%ax
   14012bc4b:	je     14012eff8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb588>
   14012bc51:	cmp    $0x2,%ax
   14012bc55:	jne    14012a1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012bc5b:	mov    %rdx,0x328(%rsp)
   14012bc63:	lea    0x540(%rsp),%rcx
   14012bc6b:	lea    0x328(%rsp),%rdx
   14012bc73:	vzeroupper
   14012bc76:	call   14021c560 <setun::VMValue::as_object() const>
   14012bc7b:	mov    0x540(%rsp),%rax
   14012bc83:	mov    0x548(%rsp),%rdi
   14012bc8b:	test   %rax,%rax
   14012bc8e:	je     14012bcef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x827f>
   14012bc90:	lea    0x680(%rsp),%r10
   14012bc98:	lea    0x320(%rsp),%rdx
   14012bca0:	mov    %rax,0x60(%rsp)
   14012bca5:	mov    %r10,%rcx
   14012bca8:	mov    %r10,0x40(%rsp)
   14012bcad:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012bcb2:	mov    0x40(%rsp),%rdx
   14012bcb7:	mov    0x60(%rsp),%rcx
   14012bcbc:	lea    0x318(%rsp),%r8
   14012bcc4:	call   140211840 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012bcc9:	mov    0x680(%rsp),%rcx
   14012bcd1:	lea    0x690(%rsp),%rax
   14012bcd9:	cmp    %rax,%rcx
   14012bcdc:	je     14012bcef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x827f>
   14012bcde:	mov    0x690(%rsp),%rax
   14012bce6:	lea    0x1(%rax),%rdx
   14012bcea:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012bcef:	test   %rdi,%rdi
   14012bcf2:	je     14012a1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012bcf8:	mov    %rdi,%rcx
   14012bcfb:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012bd00:	jmp    14012a1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012bd05:	mov    0x1048(%rbx),%rdx
   14012bd0c:	lea    0x10(%rsi),%r8
   14012bd10:	cmp    0x38(%rsp),%r8
   14012bd15:	jae    14013289d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee2d>
   14012bd1b:	mov    0x1050(%rbx),%rax
   14012bd22:	vzeroupper
   14012bd25:	mov    0x1d0(%rsp),%rcx
   14012bd2d:	mov    %rcx,(%rsi)
   14012bd30:	mov    0x1c8(%rsp),%rcx
   14012bd38:	mov    %rcx,0x8(%rsi)
   14012bd3c:	mov    %r8,%rsi
   14012bd3f:	jmp    1401270c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3657>
   14012bd44:	mov    0x1048(%rbx),%rdx
   14012bd4b:	lea    0x10(%rsi),%r8
   14012bd4f:	cmp    0x38(%rsp),%r8
   14012bd54:	jae    1401332ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf87e>
   14012bd5a:	mov    0x1050(%rbx),%rax
   14012bd61:	vzeroupper
   14012bd64:	mov    0x1d0(%rsp),%rcx
   14012bd6c:	mov    %rcx,(%rsi)
   14012bd6f:	mov    0x1c8(%rsp),%rcx
   14012bd77:	mov    %rcx,0x8(%rsi)
   14012bd7b:	mov    %r8,%rsi
   14012bd7e:	jmp    140126f21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34b1>
   14012bd83:	mov    0x3d0(%rsp),%r8
   14012bd8b:	and    %r8,%rax
   14012bd8e:	cmp    %rcx,%rax
   14012bd91:	jne    140128a20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fb0>
   14012bd97:	mov    0x3c8(%rsp),%rax
   14012bd9f:	shl    $0x10,%r8
   14012bda3:	movabs $0xfffa000000000000,%rdx
   14012bdad:	shl    $0x10,%rax
   14012bdb1:	cmp    %r8,%rax
   14012bdb4:	movabs $0xfffa000000000001,%rax
   14012bdbe:	cmovge %rax,%rdx
   14012bdc2:	mov    %rdx,0x1c8(%rsp)
   14012bdca:	cmpb   $0x0,0x1040(%rbx)
   14012bdd1:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012bdd7:	movzbl 0x0(%rbp),%eax
   14012bddb:	lea    0x2942be(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bde2:	add    $0x1,%rbp
   14012bde6:	mov    (%rdi,%rax,8),%rax
   14012bdea:	jmp    *%rax
   14012bdec:	shr    $0x20,%rdx
   14012bdf0:	cmp    $0x1,%dx
   14012bdf4:	je     14012c911 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ea1>
   14012bdfa:	lea    0x300(%rsp),%rcx
   14012be02:	vzeroupper
   14012be05:	call   14021aa80 <setun::VMValue::as_int() const>
   14012be0a:	test   %rax,%rax
   14012be0d:	js     14012c96a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8efa>
   14012be13:	je     1401262e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2878>
   14012be19:	movswq 0x60(%rsp),%rax
   14012be1f:	add    %rbp,%rax
   14012be22:	jmp    1401262f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2883>
   14012be27:	mov    0x1048(%rbx),%rdx
   14012be2e:	lea    0x10(%rsi),%r8
   14012be32:	cmp    0x38(%rsp),%r8
   14012be37:	jae    140133739 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcc9>
   14012be3d:	mov    0x1050(%rbx),%rax
   14012be44:	vzeroupper
   14012be47:	mov    0x1d0(%rsp),%rcx
   14012be4f:	mov    %rcx,(%rsi)
   14012be52:	mov    0x1c8(%rsp),%rcx
   14012be5a:	mov    %rcx,0x8(%rsi)
   14012be5e:	mov    %r8,%rsi
   14012be61:	jmp    14012726d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37fd>
   14012be66:	mov    0x1048(%rbx),%rdx
   14012be6d:	lea    0x10(%rsi),%r8
   14012be71:	cmp    0x38(%rsp),%r8
   14012be76:	jae    14013382f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdbf>
   14012be7c:	mov    0x1050(%rbx),%rax
   14012be83:	vzeroupper
   14012be86:	mov    0x1d0(%rsp),%rcx
   14012be8e:	mov    %rcx,(%rsi)
   14012be91:	mov    0x1c8(%rsp),%rcx
   14012be99:	mov    %rcx,0x8(%rsi)
   14012be9d:	mov    %r8,%rsi
   14012bea0:	jmp    140126bd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3165>
   14012bea5:	mov    0x3b0(%rsp),%r8
   14012bead:	and    %r8,%rax
   14012beb0:	cmp    %rdx,%rax
   14012beb3:	jne    14012875e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cee>
   14012beb9:	movabs $0xfffa000000000000,%rax
   14012bec3:	cmp    0x3a8(%rsp),%r8
   14012becb:	movabs $0xfffa000000000001,%rdx
   14012bed5:	cmove  %rdx,%rax
   14012bed9:	mov    %rax,0x1c8(%rsp)
   14012bee1:	cmpb   $0x0,0x1040(%rbx)
   14012bee8:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012beee:	movzbl 0x0(%rbp),%eax
   14012bef2:	lea    0x2941a7(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bef9:	add    $0x1,%rbp
   14012befd:	mov    (%rdi,%rax,8),%rax
   14012bf01:	jmp    *%rax
   14012bf03:	mov    0x1048(%rbx),%rdx
   14012bf0a:	lea    0x10(%rsi),%r8
   14012bf0e:	cmp    0x38(%rsp),%r8
   14012bf13:	jae    1401338e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe73>
   14012bf19:	mov    0x1050(%rbx),%rax
   14012bf20:	vzeroupper
   14012bf23:	mov    0x1d0(%rsp),%rcx
   14012bf2b:	mov    %rcx,(%rsi)
   14012bf2e:	mov    0x1c8(%rsp),%rcx
   14012bf36:	mov    %rcx,0x8(%rsi)
   14012bf3a:	mov    %r8,%rsi
   14012bf3d:	jmp    140127340 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38d0>
   14012bf42:	mov    0x1048(%rbx),%rdx
   14012bf49:	lea    0x10(%rsi),%r8
   14012bf4d:	cmp    0x38(%rsp),%r8
   14012bf52:	jae    14013390f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe9f>
   14012bf58:	mov    0x1050(%rbx),%rax
   14012bf5f:	vzeroupper
   14012bf62:	mov    0x1d0(%rsp),%rcx
   14012bf6a:	mov    %rcx,(%rsi)
   14012bf6d:	mov    0x1c8(%rsp),%rcx
   14012bf75:	mov    %rcx,0x8(%rsi)
   14012bf79:	mov    %r8,%rsi
   14012bf7c:	jmp    140127413 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39a3>
   14012bf81:	lea    0x10(%rsi),%r8
   14012bf85:	cmp    0x38(%rsp),%r8
   14012bf8a:	jae    14013393b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfecb>
   14012bf90:	vzeroupper
   14012bf93:	mov    0x1d0(%rsp),%rax
   14012bf9b:	xor    %r12d,%r12d
   14012bf9e:	mov    %rax,(%rsi)
   14012bfa1:	mov    0x1c8(%rsp),%rax
   14012bfa9:	mov    %rax,0x8(%rsi)
   14012bfad:	mov    %r8,%rsi
   14012bfb0:	jmp    140129f8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x651b>
   14012bfb5:	mov    %rax,%rdx
   14012bfb8:	shr    $0x20,%rdx
   14012bfbc:	cmp    $0x5,%dx
   14012bfc0:	jne    14012c00a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x859a>
   14012bfc2:	mov    0x390(%rsp),%rcx
   14012bfca:	movabs $0xffff000000000000,%rdx
   14012bfd4:	movabs $0xfff8000000000000,%r8
   14012bfde:	and    %rcx,%rdx
   14012bfe1:	cmp    %r8,%rdx
   14012bfe4:	je     14012852c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abc>
   14012bfea:	movabs $0xffffffff00000000,%rdx
   14012bff4:	and    %rdx,%rcx
   14012bff7:	movabs $0xfffd000500000000,%rdx
   14012c001:	cmp    %rdx,%rcx
   14012c004:	je     14012852c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abc>
   14012c00a:	mov    0x390(%rsp),%rdx
   14012c012:	movabs $0xfff7ffffffffffff,%rcx
   14012c01c:	cmp    %rdx,%rcx
   14012c01f:	jae    14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   14012c025:	movabs $0xfffc000000000000,%rcx
   14012c02f:	cmp    %rcx,%rdx
   14012c032:	je     14012d29e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x982e>
   14012c038:	movabs $0xffffffff00000000,%rcx
   14012c042:	movabs $0xfffd000000000000,%r8
   14012c04c:	and    %rax,%rcx
   14012c04f:	cmp    %r8,%rcx
   14012c052:	je     140131598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb28>
   14012c058:	movabs $0xffff000000000000,%rax
   14012c062:	and    %rdx,%rax
   14012c065:	cmp    %r8,%rax
   14012c068:	je     140131fc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe557>
   14012c06e:	movabs $0xfffd000100000000,%rax
   14012c078:	cmp    %rax,%rcx
   14012c07b:	jne    14012852c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abc>
   14012c081:	lea    0x390(%rsp),%rdx
   14012c089:	lea    0x680(%rsp),%rcx
   14012c091:	vzeroupper
   14012c094:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c099:	lea    0x540(%rsp),%rax
   14012c0a1:	lea    0x388(%rsp),%rdx
   14012c0a9:	mov    %rax,%rcx
   14012c0ac:	mov    %rax,0x40(%rsp)
   14012c0b1:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c0b6:	mov    0x40(%rsp),%rcx
   14012c0bb:	lea    0x680(%rsp),%rdx
   14012c0c3:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c0c8:	shr    $0x1f,%eax
   14012c0cb:	jmp    140128552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae2>
   14012c0d0:	mov    %rax,%rdx
   14012c0d3:	shr    $0x20,%rdx
   14012c0d7:	cmp    $0x5,%dx
   14012c0db:	jne    14012c125 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86b5>
   14012c0dd:	mov    0x3c0(%rsp),%rcx
   14012c0e5:	movabs $0xffff000000000000,%rdx
   14012c0ef:	movabs $0xfff8000000000000,%r8
   14012c0f9:	and    %rcx,%rdx
   14012c0fc:	cmp    %r8,%rdx
   14012c0ff:	je     14012894e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ede>
   14012c105:	movabs $0xffffffff00000000,%rdx
   14012c10f:	and    %rdx,%rcx
   14012c112:	movabs $0xfffd000500000000,%rdx
   14012c11c:	cmp    %rdx,%rcx
   14012c11f:	je     14012894e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ede>
   14012c125:	mov    0x3c0(%rsp),%rdx
   14012c12d:	movabs $0xfff7ffffffffffff,%rcx
   14012c137:	cmp    %rdx,%rcx
   14012c13a:	jae    14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   14012c140:	movabs $0xfffc000000000000,%rcx
   14012c14a:	cmp    %rcx,%rdx
   14012c14d:	je     14012d22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97bf>
   14012c153:	movabs $0xffffffff00000000,%rcx
   14012c15d:	movabs $0xfffd000000000000,%r8
   14012c167:	and    %rax,%rcx
   14012c16a:	cmp    %r8,%rcx
   14012c16d:	je     140131712 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdca2>
   14012c173:	movabs $0xffff000000000000,%rax
   14012c17d:	and    %rdx,%rax
   14012c180:	cmp    %r8,%rax
   14012c183:	je     140131f61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4f1>
   14012c189:	movabs $0xfffd000100000000,%rax
   14012c193:	cmp    %rax,%rcx
   14012c196:	jne    14012894e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ede>
   14012c19c:	lea    0x3c0(%rsp),%rdx
   14012c1a4:	lea    0x680(%rsp),%rcx
   14012c1ac:	vzeroupper
   14012c1af:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c1b4:	lea    0x540(%rsp),%rax
   14012c1bc:	lea    0x3b8(%rsp),%rdx
   14012c1c4:	mov    %rax,%rcx
   14012c1c7:	mov    %rax,0x40(%rsp)
   14012c1cc:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c1d1:	mov    0x40(%rsp),%rcx
   14012c1d6:	lea    0x680(%rsp),%rdx
   14012c1de:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c1e3:	test   %eax,%eax
   14012c1e5:	setg   %al
   14012c1e8:	jmp    140128974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f04>
   14012c1ed:	mov    %rax,%rdx
   14012c1f0:	shr    $0x20,%rdx
   14012c1f4:	cmp    $0x5,%dx
   14012c1f8:	jne    14012c242 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87d2>
   14012c1fa:	mov    0x3d0(%rsp),%rcx
   14012c202:	movabs $0xffff000000000000,%rdx
   14012c20c:	movabs $0xfff8000000000000,%r8
   14012c216:	and    %rcx,%rdx
   14012c219:	cmp    %r8,%rdx
   14012c21c:	je     140128aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503e>
   14012c222:	movabs $0xffffffff00000000,%rdx
   14012c22c:	and    %rdx,%rcx
   14012c22f:	movabs $0xfffd000500000000,%rdx
   14012c239:	cmp    %rdx,%rcx
   14012c23c:	je     140128aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503e>
   14012c242:	mov    0x3d0(%rsp),%rdx
   14012c24a:	movabs $0xfff7ffffffffffff,%rcx
   14012c254:	cmp    %rdx,%rcx
   14012c257:	jae    14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   14012c25d:	movabs $0xfffc000000000000,%rcx
   14012c267:	cmp    %rcx,%rdx
   14012c26a:	je     14012d1d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9765>
   14012c270:	movabs $0xffffffff00000000,%rcx
   14012c27a:	movabs $0xfffd000000000000,%r8
   14012c284:	and    %rax,%rcx
   14012c287:	cmp    %r8,%rcx
   14012c28a:	je     140131654 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbe4>
   14012c290:	movabs $0xffff000000000000,%rax
   14012c29a:	and    %rdx,%rax
   14012c29d:	cmp    %r8,%rax
   14012c2a0:	je     140131f94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe524>
   14012c2a6:	movabs $0xfffd000100000000,%rax
   14012c2b0:	cmp    %rax,%rcx
   14012c2b3:	jne    140128aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503e>
   14012c2b9:	lea    0x3d0(%rsp),%rdx
   14012c2c1:	lea    0x680(%rsp),%rcx
   14012c2c9:	vzeroupper
   14012c2cc:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c2d1:	lea    0x540(%rsp),%rax
   14012c2d9:	lea    0x3c8(%rsp),%rdx
   14012c2e1:	mov    %rax,%rcx
   14012c2e4:	mov    %rax,0x40(%rsp)
   14012c2e9:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c2ee:	mov    0x40(%rsp),%rcx
   14012c2f3:	lea    0x680(%rsp),%rdx
   14012c2fb:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c300:	not    %eax
   14012c302:	shr    $0x1f,%eax
   14012c305:	jmp    140128ad4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5064>
   14012c30a:	mov    %rax,%rdx
   14012c30d:	shr    $0x20,%rdx
   14012c311:	cmp    $0x5,%dx
   14012c315:	jne    14012c35f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88ef>
   14012c317:	mov    0x3a0(%rsp),%rcx
   14012c31f:	movabs $0xffff000000000000,%rdx
   14012c329:	movabs $0xfff8000000000000,%r8
   14012c333:	and    %rcx,%rdx
   14012c336:	cmp    %r8,%rdx
   14012c339:	je     14012868c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1c>
   14012c33f:	movabs $0xffffffff00000000,%rdx
   14012c349:	and    %rdx,%rcx
   14012c34c:	movabs $0xfffd000500000000,%rdx
   14012c356:	cmp    %rdx,%rcx
   14012c359:	je     14012868c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1c>
   14012c35f:	mov    0x3a0(%rsp),%rdx
   14012c367:	movabs $0xfff7ffffffffffff,%rcx
   14012c371:	cmp    %rdx,%rcx
   14012c374:	jae    14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   14012c37a:	movabs $0xfffc000000000000,%rcx
   14012c384:	cmp    %rcx,%rdx
   14012c387:	je     14012d202 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9792>
   14012c38d:	movabs $0xffffffff00000000,%rcx
   14012c397:	movabs $0xfffd000000000000,%r8
   14012c3a1:	and    %rax,%rcx
   14012c3a4:	cmp    %r8,%rcx
   14012c3a7:	je     1401317ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd5e>
   14012c3ad:	movabs $0xffff000000000000,%rax
   14012c3b7:	and    %rdx,%rax
   14012c3ba:	cmp    %r8,%rax
   14012c3bd:	je     140131ffa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe58a>
   14012c3c3:	movabs $0xfffd000100000000,%rax
   14012c3cd:	cmp    %rax,%rcx
   14012c3d0:	jne    14012868c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1c>
   14012c3d6:	lea    0x3a0(%rsp),%rdx
   14012c3de:	lea    0x680(%rsp),%rcx
   14012c3e6:	vzeroupper
   14012c3e9:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c3ee:	lea    0x540(%rsp),%rax
   14012c3f6:	lea    0x398(%rsp),%rdx
   14012c3fe:	mov    %rax,%rcx
   14012c401:	mov    %rax,0x40(%rsp)
   14012c406:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c40b:	mov    0x40(%rsp),%rcx
   14012c410:	lea    0x680(%rsp),%rdx
   14012c418:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c41d:	test   %eax,%eax
   14012c41f:	setle  %al
   14012c422:	jmp    1401286b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c42>
   14012c427:	mov    %rax,%rdx
   14012c42a:	shr    $0x20,%rdx
   14012c42e:	cmp    $0x5,%dx
   14012c432:	jne    14012c47c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a0c>
   14012c434:	mov    0x3b0(%rsp),%rcx
   14012c43c:	movabs $0xffff000000000000,%rdx
   14012c446:	movabs $0xfff8000000000000,%r8
   14012c450:	and    %rcx,%rdx
   14012c453:	cmp    %r8,%rdx
   14012c456:	je     1401287ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7c>
   14012c45c:	movabs $0xffffffff00000000,%rdx
   14012c466:	and    %rdx,%rcx
   14012c469:	movabs $0xfffd000500000000,%rdx
   14012c473:	cmp    %rdx,%rcx
   14012c476:	je     1401287ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7c>
   14012c47c:	mov    0x3b0(%rsp),%rdx
   14012c484:	movabs $0xfff7ffffffffffff,%rcx
   14012c48e:	cmp    %rdx,%rcx
   14012c491:	jae    14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   14012c497:	movabs $0xfffc000000000000,%rcx
   14012c4a1:	cmp    %rcx,%rdx
   14012c4a4:	je     14012d25c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97ec>
   14012c4aa:	movabs $0xffffffff00000000,%rcx
   14012c4b4:	movabs $0xfffd000000000000,%r8
   14012c4be:	and    %rax,%rcx
   14012c4c1:	cmp    %r8,%rcx
   14012c4c4:	je     1401314e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda75>
   14012c4ca:	movabs $0xffff000000000000,%rax
   14012c4d4:	and    %rdx,%rax
   14012c4d7:	cmp    %r8,%rax
   14012c4da:	je     1401320be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe64e>
   14012c4e0:	movabs $0xfffd000100000000,%rax
   14012c4ea:	cmp    %rax,%rcx
   14012c4ed:	jne    1401287ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7c>
   14012c4f3:	lea    0x3b0(%rsp),%rdx
   14012c4fb:	lea    0x680(%rsp),%rcx
   14012c503:	vzeroupper
   14012c506:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c50b:	lea    0x540(%rsp),%rax
   14012c513:	lea    0x3a8(%rsp),%rdx
   14012c51b:	mov    %rax,%rcx
   14012c51e:	mov    %rax,0x40(%rsp)
   14012c523:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c528:	mov    0x40(%rsp),%rcx
   14012c52d:	lea    0x680(%rsp),%rdx
   14012c535:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c53a:	test   %eax,%eax
   14012c53c:	sete   %dil
   14012c540:	jmp    140128813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da3>
   14012c545:	mov    0x1c8(%rsp),%rax
   14012c54d:	sub    $0x8,%rsi
   14012c551:	movabs $0xffff000000000000,%rdx
   14012c55b:	movabs $0xfffd000000000000,%rcx
   14012c565:	mov    %rax,0x310(%rsp)
   14012c56d:	mov    (%rsi),%rax
   14012c570:	and    %rax,%rdx
   14012c573:	mov    %rax,0x308(%rsp)
   14012c57b:	cmp    %rcx,%rdx
   14012c57e:	jne    14012a12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14012c584:	xor    %r12d,%r12d
   14012c587:	shr    $0x20,%rax
   14012c58b:	cmp    $0x3,%ax
   14012c58f:	je     14012f2fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb88d>
   14012c595:	test   %ax,%ax
   14012c598:	jne    14012d8fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e8d>
   14012c59e:	lea    0x540(%rsp),%rcx
   14012c5a6:	lea    0x308(%rsp),%rdx
   14012c5ae:	vzeroupper
   14012c5b1:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012c5b6:	lea    0x310(%rsp),%rcx
   14012c5be:	call   14021aa80 <setun::VMValue::as_int() const>
   14012c5c3:	mov    %rax,%rdi
   14012c5c6:	test   %rax,%rax
   14012c5c9:	js     140131451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9e1>
   14012c5cf:	cmp    0x548(%rsp),%rdi
   14012c5d7:	jae    14013145f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9ef>
   14012c5dd:	test   %r12b,%r12b
   14012c5e0:	je     140134805 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d95>
   14012c5e6:	cmp    $0x1,%r12b
   14012c5ea:	je     140134775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d05>
   14012c5f0:	lea    0x8(%rsi),%rax
   14012c5f4:	cmp    0x38(%rsp),%rax
   14012c5f9:	jae    14013726e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137fe>
   14012c5ff:	mov    0x1d0(%rsp),%rax
   14012c607:	lea    0x680(%rsp),%r10
   14012c60f:	mov    $0x1,%edx
   14012c614:	lea    0x690(%rsp),%r12
   14012c61c:	mov    %r10,%rcx
   14012c61f:	mov    %r10,0x40(%rsp)
   14012c624:	mov    %rax,(%rsi)
   14012c627:	mov    0x1c8(%rsp),%rax
   14012c62f:	mov    %rax,0x1d0(%rsp)
   14012c637:	mov    0x540(%rsp),%rax
   14012c63f:	movsbl (%rax,%rdi,1),%r8d
   14012c644:	mov    %r12,0x680(%rsp)
   14012c64c:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012c651:	mov    0x40(%rsp),%rdx
   14012c656:	lea    0x520(%rsp),%rcx
   14012c65e:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012c663:	mov    0x520(%rsp),%rax
   14012c66b:	mov    0x680(%rsp),%rcx
   14012c673:	mov    %rax,0x1c8(%rsp)
   14012c67b:	cmp    %r12,%rcx
   14012c67e:	je     14012c691 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c21>
   14012c680:	mov    0x690(%rsp),%rax
   14012c688:	lea    0x1(%rax),%rdx
   14012c68c:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012c691:	add    $0x8,%rsi
   14012c695:	mov    $0x2,%r12d
   14012c69b:	mov    0x540(%rsp),%rcx
   14012c6a3:	lea    0x550(%rsp),%rax
   14012c6ab:	cmp    %rax,%rcx
   14012c6ae:	je     14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012c6b4:	mov    0x550(%rsp),%rax
   14012c6bc:	lea    0x1(%rax),%rdx
   14012c6c0:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012c6c5:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012c6ca:	movzwl %ax,%edi
   14012c6cd:	mov    %edi,0x80(%rsp)
   14012c6d4:	jmp    14012634a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28da>
   14012c6d9:	shr    $0x20,%rdx
   14012c6dd:	cmp    $0x3,%dx
   14012c6e1:	je     14012ef27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4b7>
   14012c6e7:	test   %dx,%dx
   14012c6ea:	jne    14012d987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f17>
   14012c6f0:	lea    0x540(%rsp),%rcx
   14012c6f8:	lea    0x330(%rsp),%rdx
   14012c700:	vzeroupper
   14012c703:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012c708:	lea    0x338(%rsp),%rcx
   14012c710:	call   14021aa80 <setun::VMValue::as_int() const>
   14012c715:	mov    %rax,%rdi
   14012c718:	test   %rax,%rax
   14012c71b:	js     140130fcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd55c>
   14012c721:	cmp    0x548(%rsp),%rdi
   14012c729:	jae    140130fda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd56a>
   14012c72f:	test   %r12b,%r12b
   14012c732:	je     140134d53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112e3>
   14012c738:	cmp    $0x1,%r12b
   14012c73c:	je     1401368bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e4d>
   14012c742:	lea    0x8(%rsi),%rax
   14012c746:	cmp    0x38(%rsp),%rax
   14012c74b:	jae    14013686f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dff>
   14012c751:	mov    0x1d0(%rsp),%rax
   14012c759:	lea    0x680(%rsp),%r10
   14012c761:	mov    $0x1,%edx
   14012c766:	lea    0x690(%rsp),%r12
   14012c76e:	mov    %r10,%rcx
   14012c771:	mov    %r10,0x40(%rsp)
   14012c776:	mov    %rax,(%rsi)
   14012c779:	mov    0x1c8(%rsp),%rax
   14012c781:	mov    %rax,0x1d0(%rsp)
   14012c789:	mov    0x540(%rsp),%rax
   14012c791:	movsbl (%rax,%rdi,1),%r8d
   14012c796:	mov    %r12,0x680(%rsp)
   14012c79e:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012c7a3:	mov    0x40(%rsp),%rdx
   14012c7a8:	lea    0x520(%rsp),%rcx
   14012c7b0:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012c7b5:	mov    0x520(%rsp),%rax
   14012c7bd:	mov    0x680(%rsp),%rcx
   14012c7c5:	mov    %rax,0x1c8(%rsp)
   14012c7cd:	cmp    %r12,%rcx
   14012c7d0:	je     14012c7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d73>
   14012c7d2:	mov    0x690(%rsp),%rax
   14012c7da:	lea    0x1(%rax),%rdx
   14012c7de:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012c7e3:	add    $0x8,%rsi
   14012c7e7:	mov    $0x2,%r12d
   14012c7ed:	mov    0x540(%rsp),%rcx
   14012c7f5:	lea    0x550(%rsp),%rax
   14012c7fd:	cmp    %rax,%rcx
   14012c800:	je     140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   14012c806:	mov    0x550(%rsp),%rax
   14012c80e:	lea    0x1(%rax),%rdx
   14012c812:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012c817:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   14012c81c:	mov    %rdi,%rax
   14012c81f:	shr    $0x20,%rax
   14012c823:	cmp    $0x2,%ax
   14012c827:	je     14012fd08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc298>
   14012c82d:	mov    0x1c8(%rsp),%rax
   14012c835:	xor    %r12d,%r12d
   14012c838:	mov    %rax,0x3f0(%rsp)
   14012c840:	movabs $0xffffffff00000000,%rax
   14012c84a:	movabs $0xfffd000200000000,%rdx
   14012c854:	and    %rdi,%rax
   14012c857:	cmp    %rdx,%rax
   14012c85a:	jne    140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14012c860:	mov    %r9,0x60(%rsp)
   14012c865:	lea    0x3e8(%rsp),%rcx
   14012c86d:	mov    %rdi,0x3e8(%rsp)
   14012c875:	vzeroupper
   14012c878:	call   14021bef0 <setun::VMValue::payload() const>
   14012c87d:	mov    0x48(%rax),%rdi
   14012c881:	test   %rdi,%rdi
   14012c884:	je     140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14012c88a:	mov    0x38(%rdi),%rcx
   14012c88e:	mov    0x60(%rsp),%r9
   14012c893:	test   %rcx,%rcx
   14012c896:	je     1401330c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf651>
   14012c89c:	mov    (%r9),%edx
   14012c89f:	cmp    %edx,(%rcx)
   14012c8a1:	jne    1401330c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf651>
   14012c8a7:	test   %edx,%edx
   14012c8a9:	je     1401330c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf651>
   14012c8af:	mov    0x48(%rdi),%rcx
   14012c8b3:	mov    0x50(%rdi),%rdx
   14012c8b7:	movzwl 0x4(%r9),%r8d
   14012c8bc:	sub    %rcx,%rdx
   14012c8bf:	sar    $0x3,%rdx
   14012c8c3:	cmp    %rdx,%r8
   14012c8c6:	jae    1401330c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf651>
   14012c8cc:	mov    0x3f0(%rsp),%rax
   14012c8d4:	mov    %rax,(%rcx,%r8,8)
   14012c8d8:	cmpb   $0x0,0x1040(%rbx)
   14012c8df:	je     14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   14012c8e5:	movzbl 0x2(%rbp),%eax
   14012c8e9:	lea    0x2937b0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c8f0:	add    $0x3,%rbp
   14012c8f4:	mov    (%rdi,%rax,8),%rax
   14012c8f8:	jmp    *%rax
   14012c8fa:	mov    %rcx,%rdx
   14012c8fd:	lea    0x1068(%rbx),%rcx
   14012c904:	vzeroupper
   14012c907:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012c90c:	jmp    14012665f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2bef>
   14012c911:	lea    0x540(%rsp),%rax
   14012c919:	vpxor  %xmm0,%xmm0,%xmm0
   14012c91d:	movq   $0x0,0x690(%rsp)
   14012c929:	lea    0x300(%rsp),%rdx
   14012c931:	mov    %rax,0x80(%rsp)
   14012c939:	mov    %rax,%rcx
   14012c93c:	vmovdqa %xmm0,0x680(%rsp)
   14012c945:	vzeroupper
   14012c948:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c94d:	mov    0x80(%rsp),%rcx
   14012c955:	lea    0x680(%rsp),%rdx
   14012c95d:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c962:	test   %eax,%eax
   14012c964:	jns    14012be13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83a3>
   14012c96a:	movswq %di,%rax
   14012c96e:	lea    -0x4(%rbp,%rax,1),%rax
   14012c973:	jmp    1401262f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2883>
   14012c978:	lea    0x280(%rsp),%rdx
   14012c980:	lea    0x680(%rsp),%rcx
   14012c988:	vzeroupper
   14012c98b:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c990:	lea    0x540(%rsp),%rax
   14012c998:	lea    0x278(%rsp),%rdx
   14012c9a0:	mov    %rax,%rcx
   14012c9a3:	mov    %rax,0x40(%rsp)
   14012c9a8:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c9ad:	mov    0x40(%rsp),%rcx
   14012c9b2:	lea    0x680(%rsp),%rdx
   14012c9ba:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c9bf:	test   %eax,%eax
   14012c9c1:	jle    140130edf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd46f>
   14012c9c7:	mov    0x280(%rsp),%rax
   14012c9cf:	mov    %rax,0x1c8(%rsp)
   14012c9d7:	jmp    140125915 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   14012c9dc:	lea    0x290(%rsp),%rdx
   14012c9e4:	lea    0x680(%rsp),%rcx
   14012c9ec:	vzeroupper
   14012c9ef:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012c9f4:	lea    0x540(%rsp),%rax
   14012c9fc:	lea    0x288(%rsp),%rdx
   14012ca04:	mov    %rax,%rcx
   14012ca07:	mov    %rax,0x40(%rsp)
   14012ca0c:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012ca11:	mov    0x40(%rsp),%rcx
   14012ca16:	lea    0x680(%rsp),%rdx
   14012ca1e:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012ca23:	test   %eax,%eax
   14012ca25:	js     140130ef4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd484>
   14012ca2b:	mov    0x288(%rsp),%rax
   14012ca33:	mov    %rax,0x1c8(%rsp)
   14012ca3b:	jmp    140125a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   14012ca40:	mov    %r9,0x40(%rsp)
   14012ca45:	lea    0x1c8(%rsp),%rcx
   14012ca4d:	vzeroupper
   14012ca50:	call   14021bef0 <setun::VMValue::payload() const>
   14012ca55:	mov    0x40(%rsp),%r9
   14012ca5a:	mov    0x48(%rax),%rax
   14012ca5e:	test   %rax,%rax
   14012ca61:	je     140128b54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e4>
   14012ca67:	mov    0x38(%rax),%rcx
   14012ca6b:	test   %rcx,%rcx
   14012ca6e:	je     140128b54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e4>
   14012ca74:	mov    (%r9),%edx
   14012ca77:	cmp    %edx,(%rcx)
   14012ca79:	jne    140128b54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e4>
   14012ca7f:	test   %edx,%edx
   14012ca81:	je     140128b54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x50e4>
   14012ca87:	movzwl 0x4(%r9),%edx
   14012ca8c:	mov    0x48(%rax),%rax
   14012ca90:	mov    (%rax,%rdx,8),%rax
   14012ca94:	mov    %rax,0x1c8(%rsp)
   14012ca9c:	cmpb   $0x0,0x1040(%rbx)
   14012caa3:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   14012caa9:	movzbl 0x2(%rbp),%eax
   14012caad:	lea    0x2935ec(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cab4:	add    $0x3,%rbp
   14012cab8:	mov    (%rdi,%rax,8),%rax
   14012cabc:	jmp    *%rax
   14012cabe:	vzeroupper
   14012cac1:	mov    0x40(%rsp),%rbp
   14012cac6:	mov    0x1048(%rbx),%rdx
   14012cacd:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012cad2:	movabs $0xfffd000100000000,%rdx
   14012cadc:	mov    0x60(%rsp),%rax
   14012cae1:	mov    (%rax),%r8
   14012cae4:	movabs $0xffffffff00000000,%rax
   14012caee:	mov    %r8,%rcx
   14012caf1:	and    %rax,%rcx
   14012caf4:	cmp    %rdx,%rcx
   14012caf7:	je     14012fae8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc078>
   14012cafd:	mov    0x40(%rsp),%rcx
   14012cb02:	mov    (%rcx),%rcx
   14012cb05:	and    %rcx,%rax
   14012cb08:	cmp    %rdx,%rax
   14012cb0b:	je     14012fae8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc078>
   14012cb11:	movabs $0xfff7ffffffffffff,%rdx
   14012cb1b:	cmp    %r9,%rdx
   14012cb1e:	jae    14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb24:	movabs $0xfffc000000000000,%rax
   14012cb2e:	cmp    %rax,%r9
   14012cb31:	je     14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb37:	cmp    %r8,%rdx
   14012cb3a:	jae    14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb40:	cmp    %rax,%r8
   14012cb43:	je     14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb49:	cmp    %rcx,%rdx
   14012cb4c:	jae    14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb52:	cmp    %rax,%rcx
   14012cb55:	je     14012dcdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26b>
   14012cb5b:	mov    0x60(%rsp),%rdx
   14012cb60:	mov    %r11,%rcx
   14012cb63:	vzeroupper
   14012cb66:	call   140219f20 <setun::VMValue::mul(setun::VMValue const&) const>
   14012cb6b:	mov    0x40(%rsp),%rdx
   14012cb70:	lea    0x680(%rsp),%rcx
   14012cb78:	mov    %rax,0x680(%rsp)
   14012cb80:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   14012cb85:	mov    0x1068(%rbx),%rdx
   14012cb8c:	mov    %rax,(%rdx,%rdi,8)
   14012cb90:	cmpb   $0x0,0x1040(%rbx)
   14012cb97:	je     14012d2ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x985e>
   14012cb9d:	movzbl 0x8(%rbp),%eax
   14012cba1:	lea    0x2934f8(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cba8:	add    $0x9,%rbp
   14012cbac:	mov    (%rdi,%rax,8),%rax
   14012cbb0:	jmp    *%rax
   14012cbb2:	mov    %rax,%rbp
   14012cbb5:	vzeroupper
   14012cbb8:	jmp    14012a417 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012cbbd:	movswq %di,%rcx
   14012cbc1:	mov    %r8,0x40(%rsp)
   14012cbc6:	mov    %rcx,%rdx
   14012cbc9:	lea    0x680(%rsp),%rcx
   14012cbd1:	mov    %r9,0x60(%rsp)
   14012cbd6:	vzeroupper
   14012cbd9:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012cbde:	mov    0x40(%rsp),%rcx
   14012cbe3:	lea    0x680(%rsp),%rdx
   14012cbeb:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   14012cbf0:	mov    0x40(%rsp),%r8
   14012cbf5:	mov    0x60(%rsp),%r9
   14012cbfa:	cmpb   $0x0,0x1040(%rbx)
   14012cc01:	mov    %rax,(%r8)
   14012cc04:	je     140130d5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd2ee>
   14012cc0a:	movzbl 0x4(%rbp),%eax
   14012cc0e:	lea    0x29348b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cc15:	add    $0x5,%rbp
   14012cc19:	mov    (%rdi,%rax,8),%rax
   14012cc1d:	jmp    *%rax
   14012cc1f:	movswq %r10w,%rdx
   14012cc23:	lea    0x680(%rsp),%rax
   14012cc2b:	mov    %r8,0x80(%rsp)
   14012cc33:	mov    %rax,0x60(%rsp)
   14012cc38:	mov    %rax,%rcx
   14012cc3b:	vzeroupper
   14012cc3e:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012cc43:	mov    0x60(%rsp),%rdx
   14012cc48:	mov    0x80(%rsp),%rcx
   14012cc50:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   14012cc55:	mov    0x1068(%rbx),%rdx
   14012cc5c:	mov    %rax,(%rdx,%rdi,8)
   14012cc60:	cmpb   $0x0,0x1040(%rbx)
   14012cc67:	je     14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   14012cc6d:	movzbl 0x6(%rbp),%eax
   14012cc71:	lea    0x293428(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cc78:	add    $0x7,%rbp
   14012cc7c:	mov    (%rdi,%rax,8),%rax
   14012cc80:	jmp    *%rax
   14012cc82:	cmp    $0x2,%r12b
   14012cc86:	jne    1401366fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c8e>
   14012cc8c:	mov    0x1d0(%rsp),%rdx
   14012cc94:	mov    0x1c8(%rsp),%rax
   14012cc9c:	movabs $0xfffd000000000000,%rcx
   14012cca6:	mov    %rdx,0x1c8(%rsp)
   14012ccae:	movabs $0xffff000000000000,%rdx
   14012ccb8:	and    %rax,%rdx
   14012ccbb:	mov    %rax,0x3e0(%rsp)
   14012ccc3:	cmp    %rcx,%rdx
   14012ccc6:	je     140135832 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11dc2>
   14012cccc:	mov    0x1c8(%rsp),%rax
   14012ccd4:	mov    $0x2,%r12d
   14012ccda:	mov    %rax,0x1d0(%rsp)
   14012cce2:	jmp    140128b94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5124>
   14012cce7:	nopw   0x0(%rax,%rax,1)
   14012ccf0:	mov    %rcx,%rbp
   14012ccf3:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   14012ccf8:	mov    %rax,%rcx
   14012ccfb:	mov    0x8(%rax),%eax
   14012ccfe:	mov    %eax,0xa0(%rsp)
   14012cd05:	add    $0x1,%eax
   14012cd08:	mov    %eax,0x8(%rcx)
   14012cd0b:	cmp    0xc(%rcx),%eax
   14012cd0e:	jb     14012cde3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9373>
   14012cd14:	cmp    $0x2,%r12b
   14012cd18:	je     14013699f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f2f>
   14012cd1e:	sub    $0x1,%r12b
   14012cd22:	je     140137390 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13920>
   14012cd28:	mov    0x1048(%rbx),%rdx
   14012cd2f:	mov    0x1050(%rbx),%rax
   14012cd36:	vzeroupper
   14012cd39:	mov    0x60(%rsp),%rcx
   14012cd3e:	sub    %rdx,%rsi
   14012cd41:	sub    %rdx,%rax
   14012cd44:	mov    %rsi,%rbp
   14012cd47:	sub    %r15,%rcx
   14012cd4a:	sar    $0x3,%rbp
   14012cd4e:	mov    %rcx,0x1038(%rbx)
   14012cd55:	cmp    %rsi,%rax
   14012cd58:	jb     14013737a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1390a>
   14012cd5e:	vmovdqa 0x22fd7a(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012cd66:	mov    0xc0(%rsp),%rax
   14012cd6e:	mov    %rbp,0x1060(%rbx)
   14012cd75:	mov    %rbx,%rdx
   14012cd78:	mov    0x152c8(%rbx),%rcx
   14012cd7f:	movb   $0x0,0x153a0(%rbx)
   14012cd86:	mov    %r14,%r8
   14012cd89:	vmovdqa %xmm0,0x15390(%rbx)
   14012cd91:	mov    0x80(%rsp),%r9d
   14012cd99:	mov    %rax,0x20(%rsp)
   14012cd9e:	call   140171f60 <setun::JITManager::slow_tiering_coordinator_call(setun::VM*, setun::Chunk const&, unsigned long long, setun::FunctionHotData&)>
   14012cda3:	mov    0x1038(%rbx),%rsi
   14012cdaa:	mov    0x1048(%rbx),%rdx
   14012cdb1:	mov    0x1060(%rbx),%rcx
   14012cdb8:	add    %r15,%rsi
   14012cdbb:	mov    %rsi,0x60(%rsp)
   14012cdc0:	lea    (%rdx,%rcx,8),%rsi
   14012cdc4:	mov    0x1050(%rbx),%rdx
   14012cdcb:	mov    %rdx,0x38(%rsp)
   14012cdd0:	test   %al,%al
   14012cdd2:	jne    14012cde0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9370>
   14012cdd4:	mov    0xc0(%rsp),%rax
   14012cddc:	addl   $0x64,0xc(%rax)
   14012cde0:	xor    %r12d,%r12d
   14012cde3:	cmpb   $0x0,0x15211(%rbx)
   14012cdea:	je     14012d370 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9900>
   14012cdf0:	mov    0x150c0(%rbx),%rax
   14012cdf7:	mov    0x15268(%rbx),%r13
   14012cdfe:	test   %rax,%rax
   14012ce01:	je     14012e6ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac4a>
   14012ce07:	lea    (%rax,%rax,4),%rax
   14012ce0b:	lea    (%rbx,%rax,8),%rdx
   14012ce0f:	mov    0x10a0(%rdx),%rax
   14012ce16:	mov    0x10b0(%rdx),%rdx
   14012ce1d:	add    %rdx,%rax
   14012ce20:	cmp    %rax,%r13
   14012ce23:	jb     1401364bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a4f>
   14012ce29:	mov    0x40(%rsp),%rax
   14012ce2e:	lea    (%rax,%r13,1),%rdx
   14012ce32:	mov    0x1070(%rbx),%rax
   14012ce39:	sub    0x1068(%rbx),%rax
   14012ce40:	mov    %rdx,0x15268(%rbx)
   14012ce47:	sar    $0x3,%rax
   14012ce4b:	add    $0x40,%rdx
   14012ce4f:	cmp    %rax,%rdx
   14012ce52:	jae    1401321d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe769>
   14012ce58:	test   %dil,%dil
   14012ce5b:	je     14012da70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa000>
   14012ce61:	movzbl %dil,%edx
   14012ce65:	movzbl %dil,%r8d
   14012ce69:	lea    -0x1(%rdx,%r13,1),%rcx
   14012ce6e:	sub    $0x1,%r8d
   14012ce72:	sub    $0x2,%rdx
   14012ce76:	sub    %r8,%rdx
   14012ce79:	lea    0x0(,%rcx,8),%rax
   14012ce81:	mov    0x1068(%rbx),%r8
   14012ce88:	add    %r13,%rdx
   14012ce8b:	shl    $0x3,%rdx
   14012ce8f:	cmp    $0x1,%r12b
   14012ce93:	je     14012cec4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9454>
   14012ce95:	cmp    $0x2,%r12b
   14012ce99:	jne    14012ced9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9469>
   14012ce9b:	mov    0x1c8(%rsp),%r9
   14012cea3:	sub    $0x8,%rax
   14012cea7:	mov    %r9,(%r8,%rcx,8)
   14012ceab:	mov    0x1d0(%rsp),%rcx
   14012ceb3:	mov    %rcx,0x1c8(%rsp)
   14012cebb:	cmp    %rdx,%rax
   14012cebe:	je     14012e938 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaec8>
   14012cec4:	mov    0x1c8(%rsp),%rcx
   14012cecc:	mov    %rcx,(%r8,%rax,1)
   14012ced0:	sub    $0x8,%rax
   14012ced4:	cmp    %rdx,%rax
   14012ced7:	je     14012cef1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9481>
   14012ced9:	mov    %rsi,%rcx
   14012cedc:	sub    $0x8,%rsi
   14012cee0:	mov    -0x8(%rcx),%rcx
   14012cee4:	mov    %rcx,(%r8,%rax,1)
   14012cee8:	sub    $0x8,%rax
   14012ceec:	cmp    %rdx,%rax
   14012ceef:	jne    14012ced9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9469>
   14012cef1:	mov    0x1048(%rbx),%rdx
   14012cef8:	mov    0x60(%rsp),%rcx
   14012cefd:	sub    %rdx,%rsi
   14012cf00:	mov    0x150c0(%rbx),%rax
   14012cf07:	mov    %rsi,%rbp
   14012cf0a:	mov    0x80(%rsp),%edi
   14012cf11:	sub    %r15,%rcx
   14012cf14:	sar    $0x3,%rbp
   14012cf18:	cmp    $0x7ff,%rax
   14012cf1e:	ja     140139030 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x155c0>
   14012cf24:	lea    0x1(%rax),%r8
   14012cf28:	lea    (%rax,%rax,4),%rax
   14012cf2c:	mov    %r8,0x150c0(%rbx)
   14012cf33:	mov    %rcx,0x10c0(%rbx,%rax,8)
   14012cf3b:	mov    0x40(%rsp),%rcx
   14012cf40:	mov    %r13,0x10c8(%rbx,%rax,8)
   14012cf48:	mov    %rbp,0x10d0(%rbx,%rax,8)
   14012cf50:	mov    %rcx,0x10d8(%rbx,%rax,8)
   14012cf58:	mov    %rdi,0x10e0(%rbx,%rax,8)
   14012cf60:	mov    0x1050(%rbx),%rax
   14012cf67:	sub    %rdx,%rax
   14012cf6a:	cmp    %rsi,%rax
   14012cf6d:	jb     14012d96e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9efe>
   14012cf73:	mov    0x15270(%rbx),%rax
   14012cf7a:	mov    %rbp,0x1060(%rbx)
   14012cf81:	mov    0x152a0(%rbx),%rsi
   14012cf88:	cmp    %rsi,0x68(%rax)
   14012cf8c:	jae    140131cfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe28a>
   14012cf92:	mov    0x1060(%rbx),%rax
   14012cf99:	mov    0x1048(%rbx),%rdx
   14012cfa0:	lea    (%rdx,%rax,8),%rsi
   14012cfa4:	lea    (%r15,%rdi,1),%rax
   14012cfa8:	cmpb   $0x0,0x1040(%rbx)
   14012cfaf:	je     140131d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2d8>
   14012cfb5:	lea    0x1(%rax),%rbp
   14012cfb9:	movzbl (%rax),%eax
   14012cfbc:	lea    0x2930dd(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012cfc3:	xor    %r12d,%r12d
   14012cfc6:	mov    (%rdi,%rax,8),%rax
   14012cfca:	jmp    *%rax
   14012cfcc:	lea    0x2a8(%rsp),%rcx
   14012cfd4:	vzeroupper
   14012cfd7:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012cfdc:	lea    0x2b0(%rsp),%rcx
   14012cfe4:	vmovapd %xmm0,%xmm7
   14012cfe8:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012cfed:	vsubsd %xmm0,%xmm7,%xmm0
   14012cff1:	vandpd 0x22fb57(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3092+0x250>
   14012cff9:	vcomisd 0x22fb27(%rip),%xmm0        # 14035cb28 <CSWTCH.3092+0x228>
   14012d001:	setae  %al
   14012d004:	jmp    140125c7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   14012d009:	cmp    $0x1,%r12b
   14012d00d:	je     14012e78a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad1a>
   14012d013:	lea    0x8(%rsi),%r8
   14012d017:	cmp    0x38(%rsp),%r8
   14012d01c:	jae    1401328c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee59>
   14012d022:	mov    0x1d0(%rsp),%rax
   14012d02a:	mov    %rax,(%rsi)
   14012d02d:	mov    0x1c8(%rsp),%rax
   14012d035:	mov    %r8,%rsi
   14012d038:	mov    %rax,0x1d0(%rsp)
   14012d040:	mov    0x60(%rsp),%rax
   14012d045:	mov    %rax,0x680(%rsp)
   14012d04d:	lock addl $0x1,0x8(%rdi)
   14012d052:	lea    0x680(%rsp),%rdx
   14012d05a:	lea    0x540(%rsp),%rcx
   14012d062:	mov    %rdi,0x688(%rsp)
   14012d06a:	call   14020f340 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012d06f:	mov    0x540(%rsp),%rax
   14012d077:	mov    0x688(%rsp),%rcx
   14012d07f:	mov    %rax,0x1c8(%rsp)
   14012d087:	test   %rcx,%rcx
   14012d08a:	je     14012d091 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9621>
   14012d08c:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012d091:	mov    $0x2,%r12d
   14012d097:	jmp    14012a0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6630>
   14012d09c:	mov    %rax,%rcx
   14012d09f:	sub    %rdx,%rcx
   14012d0a2:	sar    $0x3,%rcx
   14012d0a6:	lea    (%rcx,%rcx,1),%r9
   14012d0aa:	cmp    %r9,%rcx
   14012d0ad:	jae    140124682 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   14012d0b3:	sub    %rdx,%rsi
   14012d0b6:	lea    0x1048(%rbx),%rcx
   14012d0bd:	mov    %r9,%rdx
   14012d0c0:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d0c5:	mov    0x1048(%rbx),%rdx
   14012d0cc:	mov    0x1050(%rbx),%rax
   14012d0d3:	add    %rdx,%rsi
   14012d0d6:	lea    0x10(%rsi),%r8
   14012d0da:	jmp    140124682 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   14012d0df:	lea    0x2c8(%rsp),%rcx
   14012d0e7:	vzeroupper
   14012d0ea:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d0ef:	lea    0x2d0(%rsp),%rcx
   14012d0f7:	vmovapd %xmm0,%xmm7
   14012d0fb:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d100:	vcomisd %xmm7,%xmm0
   14012d104:	setae  %al
   14012d107:	jmp    140125edc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   14012d10c:	lea    0x2e8(%rsp),%rcx
   14012d114:	vzeroupper
   14012d117:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d11c:	lea    0x2f0(%rsp),%rcx
   14012d124:	vmovapd %xmm0,%xmm7
   14012d128:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d12d:	vcomisd %xmm0,%xmm7
   14012d131:	setae  %al
   14012d134:	jmp    14012613a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   14012d139:	lea    0x298(%rsp),%rcx
   14012d141:	vzeroupper
   14012d144:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d149:	lea    0x2a0(%rsp),%rcx
   14012d151:	vmovapd %xmm0,%xmm7
   14012d155:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d15a:	vmovsd 0x22f9c6(%rip),%xmm1        # 14035cb28 <CSWTCH.3092+0x228>
   14012d162:	vsubsd %xmm0,%xmm7,%xmm0
   14012d166:	vandpd 0x22f9e2(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3092+0x250>
   14012d16e:	vcomisd %xmm0,%xmm1
   14012d172:	seta   %dil
   14012d176:	jmp    140125b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   14012d17b:	lea    0x2b8(%rsp),%rcx
   14012d183:	vzeroupper
   14012d186:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d18b:	lea    0x2c0(%rsp),%rcx
   14012d193:	vmovapd %xmm0,%xmm7
   14012d197:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d19c:	vcomisd %xmm7,%xmm0
   14012d1a0:	seta   %al
   14012d1a3:	jmp    140125dad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   14012d1a8:	lea    0x2d8(%rsp),%rcx
   14012d1b0:	vzeroupper
   14012d1b3:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d1b8:	lea    0x2e0(%rsp),%rcx
   14012d1c0:	vmovapd %xmm0,%xmm7
   14012d1c4:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d1c9:	vcomisd %xmm0,%xmm7
   14012d1cd:	seta   %al
   14012d1d0:	jmp    14012600b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   14012d1d5:	lea    0x3c8(%rsp),%rcx
   14012d1dd:	vzeroupper
   14012d1e0:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d1e5:	lea    0x3d0(%rsp),%rcx
   14012d1ed:	vmovapd %xmm0,%xmm7
   14012d1f1:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d1f6:	vcomisd %xmm0,%xmm7
   14012d1fa:	setae  %al
   14012d1fd:	jmp    140128ad4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5064>
   14012d202:	lea    0x398(%rsp),%rcx
   14012d20a:	vzeroupper
   14012d20d:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d212:	lea    0x3a0(%rsp),%rcx
   14012d21a:	vmovapd %xmm0,%xmm7
   14012d21e:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d223:	vcomisd %xmm7,%xmm0
   14012d227:	setae  %al
   14012d22a:	jmp    1401286b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c42>
   14012d22f:	lea    0x3b8(%rsp),%rcx
   14012d237:	vzeroupper
   14012d23a:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d23f:	lea    0x3c0(%rsp),%rcx
   14012d247:	vmovapd %xmm0,%xmm7
   14012d24b:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d250:	vcomisd %xmm0,%xmm7
   14012d254:	seta   %al
   14012d257:	jmp    140128974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f04>
   14012d25c:	lea    0x3a8(%rsp),%rcx
   14012d264:	vzeroupper
   14012d267:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d26c:	lea    0x3b0(%rsp),%rcx
   14012d274:	vmovapd %xmm0,%xmm7
   14012d278:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d27d:	vmovsd 0x22f8a3(%rip),%xmm1        # 14035cb28 <CSWTCH.3092+0x228>
   14012d285:	vsubsd %xmm0,%xmm7,%xmm0
   14012d289:	vandpd 0x22f8bf(%rip),%xmm0,%xmm0        # 14035cb50 <CSWTCH.3092+0x250>
   14012d291:	vcomisd %xmm0,%xmm1
   14012d295:	seta   %dil
   14012d299:	jmp    140128813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da3>
   14012d29e:	lea    0x388(%rsp),%rcx
   14012d2a6:	vzeroupper
   14012d2a9:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d2ae:	lea    0x390(%rsp),%rcx
   14012d2b6:	vmovapd %xmm0,%xmm7
   14012d2ba:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012d2bf:	vcomisd %xmm7,%xmm0
   14012d2c3:	seta   %al
   14012d2c6:	jmp    140128552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae2>
   14012d2cb:	vzeroupper
   14012d2ce:	mov    0xa0(%rsp),%rbp
   14012d2d6:	mov    0x1048(%rbx),%rdx
   14012d2dd:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012d2e2:	mov    0x1048(%rbx),%rdx
   14012d2e9:	mov    %rdi,%rbp
   14012d2ec:	vzeroupper
   14012d2ef:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012d2f4:	shr    $0x20,%rdx
   14012d2f8:	cmp    $0x1,%dx
   14012d2fc:	je     14012efd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb560>
   14012d302:	cmp    $0x5,%dx
   14012d306:	jne    140124b13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a3>
   14012d30c:	mov    %r9,%rcx
   14012d30f:	call   14021aa80 <setun::VMValue::as_int() const>
   14012d314:	lea    0x440(%rsp),%r8
   14012d31c:	movq   $0x0,0x448(%rsp)
   14012d328:	mov    %rax,0x440(%rsp)
   14012d330:	movq   $0x0,0x450(%rsp)
   14012d33c:	jmp    140124b48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d8>
   14012d341:	shr    $0x20,%rdx
   14012d345:	cmp    $0x1,%dx
   14012d349:	je     14012f244 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d4>
   14012d34f:	cmp    $0x5,%dx
   14012d353:	jne    140124b83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1113>
   14012d359:	mov    0x40(%rsp),%rcx
   14012d35e:	mov    %r8,0xc0(%rsp)
   14012d366:	call   14021aa80 <setun::VMValue::as_int() const>
   14012d36b:	jmp    140124b9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112a>
   14012d370:	mov    0x1070(%rbx),%rax
   14012d377:	sub    0x1068(%rbx),%rax
   14012d37e:	lea    0x1068(%rbx),%rcx
   14012d385:	sar    $0x3,%rax
   14012d389:	mov    %rax,%r13
   14012d38c:	mov    0x40(%rsp),%rax
   14012d391:	lea    (%rax,%r13,1),%rdx
   14012d395:	vzeroupper
   14012d398:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d39d:	jmp    14012ce58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93e8>
   14012d3a2:	lea    (%rdi,%rdi,1),%rdx
   14012d3a6:	lea    0x1048(%rbx),%rcx
   14012d3ad:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3b2:	jmp    140129bb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6146>
   14012d3b7:	lea    (%rdi,%rdi,1),%rdx
   14012d3bb:	lea    0x1048(%rbx),%rcx
   14012d3c2:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3c7:	jmp    14012697c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f0c>
   14012d3cc:	lea    (%rdi,%rdi,1),%rdx
   14012d3d0:	lea    0x1048(%rbx),%rcx
   14012d3d7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3dc:	jmp    14012993d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ecd>
   14012d3e1:	lea    (%rdi,%rdi,1),%rdx
   14012d3e5:	lea    0x1048(%rbx),%rcx
   14012d3ec:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d3f1:	jmp    140128c0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x519d>
   14012d3f6:	lea    (%rdi,%rdi,1),%rdx
   14012d3fa:	lea    0x1048(%rbx),%rcx
   14012d401:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d406:	jmp    14012986a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dfa>
   14012d40b:	lea    (%rdi,%rdi,1),%rdx
   14012d40f:	lea    0x1048(%rbx),%rcx
   14012d416:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d41b:	jmp    1401271ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x374a>
   14012d420:	lea    (%rdi,%rdi,1),%rdx
   14012d424:	lea    0x1048(%rbx),%rcx
   14012d42b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d430:	jmp    1401275d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b69>
   14012d435:	lea    (%rdi,%rdi,1),%rdx
   14012d439:	lea    0x1048(%rbx),%rcx
   14012d440:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d445:	jmp    140127433 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39c3>
   14012d44a:	lea    (%rdi,%rdi,1),%rdx
   14012d44e:	lea    0x1048(%rbx),%rcx
   14012d455:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d45a:	jmp    140127506 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a96>
   14012d45f:	lea    (%rdi,%rdi,1),%rdx
   14012d463:	lea    0x1048(%rbx),%rcx
   14012d46a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d46f:	jmp    140126e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fe>
   14012d474:	lea    (%rdi,%rdi,1),%rdx
   14012d478:	lea    0x1048(%rbx),%rcx
   14012d47f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d484:	jmp    1401270e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3677>
   14012d489:	lea    (%rdi,%rdi,1),%rdx
   14012d48d:	lea    0x1048(%rbx),%rcx
   14012d494:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d499:	jmp    140126d9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x332b>
   14012d49e:	lea    (%rdi,%rdi,1),%rdx
   14012d4a2:	lea    0x1048(%rbx),%rcx
   14012d4a9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4ae:	jmp    140126f41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34d1>
   14012d4b3:	lea    (%rdi,%rdi,1),%rdx
   14012d4b7:	lea    0x1048(%rbx),%rcx
   14012d4be:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4c3:	jmp    140127014 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35a4>
   14012d4c8:	lea    (%rdi,%rdi,1),%rdx
   14012d4cc:	lea    0x1048(%rbx),%rcx
   14012d4d3:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4d8:	jmp    1401290ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x568f>
   14012d4dd:	lea    (%rdi,%rdi,1),%rdx
   14012d4e1:	lea    0x1048(%rbx),%rcx
   14012d4e8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d4ed:	jmp    14012951e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aae>
   14012d4f2:	lea    (%rdi,%rdi,1),%rdx
   14012d4f6:	lea    0x1048(%rbx),%rcx
   14012d4fd:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d502:	jmp    1401292a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5835>
   14012d507:	lea    (%rdi,%rdi,1),%rdx
   14012d50b:	lea    0x1048(%rbx),%rcx
   14012d512:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d517:	jmp    140129378 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5908>
   14012d51c:	lea    (%rdi,%rdi,1),%rdx
   14012d520:	lea    0x1048(%rbx),%rcx
   14012d527:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d52c:	jmp    1401296c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c54>
   14012d531:	lea    (%rdi,%rdi,1),%rdx
   14012d535:	lea    0x1048(%rbx),%rcx
   14012d53c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d541:	jmp    1401295f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b81>
   14012d546:	lea    (%rdi,%rdi,1),%rdx
   14012d54a:	lea    0x1048(%rbx),%rcx
   14012d551:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d556:	jmp    1401276ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c3c>
   14012d55b:	lea    (%rdi,%rdi,1),%rdx
   14012d55f:	lea    0x1048(%rbx),%rcx
   14012d566:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d56b:	jmp    140128db3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5343>
   14012d570:	lea    (%rdi,%rdi,1),%rdx
   14012d574:	lea    0x1048(%rbx),%rcx
   14012d57b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d580:	jmp    14012902c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55bc>
   14012d585:	lea    (%rdi,%rdi,1),%rdx
   14012d589:	lea    0x1048(%rbx),%rcx
   14012d590:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d595:	jmp    140128f59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54e9>
   14012d59a:	lea    (%rdi,%rdi,1),%rdx
   14012d59e:	lea    0x1048(%rbx),%rcx
   14012d5a5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5aa:	jmp    1401291d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5762>
   14012d5af:	lea    (%rdi,%rdi,1),%rdx
   14012d5b3:	lea    0x1048(%rbx),%rcx
   14012d5ba:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5bf:	jmp    140129a10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fa0>
   14012d5c4:	lea    (%rdi,%rdi,1),%rdx
   14012d5c8:	lea    0x1048(%rbx),%rcx
   14012d5cf:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5d4:	jmp    140129ae3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6073>
   14012d5d9:	lea    (%rdi,%rdi,1),%rdx
   14012d5dd:	lea    0x1048(%rbx),%rcx
   14012d5e4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d5e9:	jmp    140128e86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5416>
   14012d5ee:	mov    %rax,%rcx
   14012d5f1:	sub    %rdx,%rcx
   14012d5f4:	sar    $0x3,%rcx
   14012d5f8:	lea    (%rcx,%rcx,1),%r9
   14012d5fc:	cmp    %r9,%rcx
   14012d5ff:	jae    14012a42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bd>
   14012d605:	sub    %rdx,%rsi
   14012d608:	lea    0x1048(%rbx),%rcx
   14012d60f:	mov    %r9,%rdx
   14012d612:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d617:	mov    0x1048(%rbx),%rdx
   14012d61e:	mov    0x1050(%rbx),%rax
   14012d625:	add    %rdx,%rsi
   14012d628:	lea    0x8(%rsi),%r8
   14012d62c:	jmp    14012a42d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bd>
   14012d631:	lea    (%rdi,%rdi,1),%rdx
   14012d635:	lea    0x1048(%rbx),%rcx
   14012d63c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d641:	jmp    140126a4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fdf>
   14012d646:	lea    (%rsi,%rsi,1),%rdx
   14012d64a:	lea    0x1048(%rbx),%rcx
   14012d651:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d656:	jmp    140129ca3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6233>
   14012d65b:	lea    (%rdi,%rdi,1),%rdx
   14012d65f:	lea    0x1048(%rbx),%rcx
   14012d666:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d66b:	jmp    14012944b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59db>
   14012d670:	lea    (%rdi,%rdi,1),%rdx
   14012d674:	lea    0x1048(%rbx),%rcx
   14012d67b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d680:	jmp    14012728d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x381d>
   14012d685:	lea    (%rdi,%rdi,1),%rdx
   14012d689:	lea    0x1048(%rbx),%rcx
   14012d690:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d695:	jmp    140129797 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d27>
   14012d69a:	lea    (%rdi,%rdi,1),%rdx
   14012d69e:	lea    0x1048(%rbx),%rcx
   14012d6a5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d6aa:	jmp    140128ce0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5270>
   14012d6af:	movabs $0xfff8000000000000,%rax
   14012d6b9:	mov    %rax,0x1c8(%rsp)
   14012d6c1:	mov    $0x1,%r12d
   14012d6c7:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   14012d6cc:	lea    (%rdi,%rdi,1),%rdx
   14012d6d0:	lea    0x1048(%rbx),%rcx
   14012d6d7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d6dc:	jmp    140126b22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30b2>
   14012d6e1:	lea    (%rdi,%rdi,1),%rdx
   14012d6e5:	lea    0x1048(%rbx),%rcx
   14012d6ec:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d6f1:	jmp    140126bf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3185>
   14012d6f6:	lea    (%rdi,%rdi,1),%rdx
   14012d6fa:	lea    0x1048(%rbx),%rcx
   14012d701:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d706:	jmp    140126cc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3258>
   14012d70b:	lea    (%rdi,%rdi,1),%rdx
   14012d70f:	lea    0x1048(%rbx),%rcx
   14012d716:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d71b:	jmp    140129dde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x636e>
   14012d720:	lea    (%rdi,%rdi,1),%rdx
   14012d724:	lea    0x1048(%rbx),%rcx
   14012d72b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d730:	jmp    140129eb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6441>
   14012d735:	lea    (%rdi,%rdi,1),%rdx
   14012d739:	lea    0x1048(%rbx),%rcx
   14012d740:	vzeroupper
   14012d743:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d748:	mov    0x1048(%rbx),%rdx
   14012d74f:	mov    0x1050(%rbx),%rax
   14012d756:	jmp    140129d11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62a1>
   14012d75b:	lea    (%rdi,%rdi,1),%rdx
   14012d75f:	lea    0x1048(%rbx),%rcx
   14012d766:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d76b:	jmp    140127360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38f0>
   14012d770:	lea    (%rsi,%rsi,1),%rdx
   14012d774:	lea    0x1048(%rbx),%rcx
   14012d77b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d780:	jmp    140127b39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40c9>
   14012d785:	mov    0x1048(%rbx),%rdx
   14012d78c:	lea    0x10(%rsi),%r8
   14012d790:	cmp    0x38(%rsp),%r8
   14012d795:	jae    1401329ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef8f>
   14012d79b:	mov    0x1050(%rbx),%rax
   14012d7a2:	mov    0x1d0(%rsp),%rcx
   14012d7aa:	mov    %rcx,(%rsi)
   14012d7ad:	mov    0x1c8(%rsp),%rcx
   14012d7b5:	mov    %rcx,0x8(%rsi)
   14012d7b9:	jmp    140127b14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40a4>
   14012d7be:	xor    %r12d,%r12d
   14012d7c1:	shr    $0x20,%rax
   14012d7c5:	cmp    $0x2,%ax
   14012d7c9:	je     140130558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcae8>
   14012d7cf:	cmp    $0x3,%ax
   14012d7d3:	je     14012ff27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc4b7>
   14012d7d9:	cmp    $0x1,%ax
   14012d7dd:	je     140130db3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd343>
   14012d7e3:	test   %ax,%ax
   14012d7e6:	jne    14012e66f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabff>
   14012d7ec:	movzwl 0x6(%r9),%edi
   14012d7f1:	lea    0x22e2d2(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14012d7f8:	shl    $0x5,%rdi
   14012d7fc:	add    0x30(%r14),%rdi
   14012d800:	mov    %rdi,%rcx
   14012d803:	vzeroupper
   14012d806:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012d80b:	test   %al,%al
   14012d80d:	jne    14012d826 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9db6>
   14012d80f:	lea    0x22e2b0(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   14012d816:	mov    %rdi,%rcx
   14012d819:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012d81e:	test   %al,%al
   14012d820:	je     14012e66f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabff>
   14012d826:	test   %r12b,%r12b
   14012d829:	je     1401325d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb61>
   14012d82f:	cmp    $0x1,%r12b
   14012d833:	je     1401345bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b4b>
   14012d839:	lea    0x8(%rsi),%r8
   14012d83d:	cmp    0x38(%rsp),%r8
   14012d842:	jae    140136161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126f1>
   14012d848:	mov    0x1d0(%rsp),%rax
   14012d850:	mov    %r8,0x40(%rsp)
   14012d855:	lea    0x680(%rsp),%rcx
   14012d85d:	lea    0x3e0(%rsp),%rdx
   14012d865:	mov    %rax,(%rsi)
   14012d868:	mov    0x1c8(%rsp),%rax
   14012d870:	mov    %rax,0x1d0(%rsp)
   14012d878:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012d87d:	mov    0x688(%rsp),%rdx
   14012d885:	mov    0x40(%rsp),%rsi
   14012d88a:	lea    0x540(%rsp),%rcx
   14012d892:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012d897:	mov    0x540(%rsp),%rax
   14012d89f:	mov    0x680(%rsp),%rcx
   14012d8a7:	mov    %rax,0x1c8(%rsp)
   14012d8af:	lea    0x690(%rsp),%rax
   14012d8b7:	cmp    %rax,%rcx
   14012d8ba:	je     14012d8cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e5d>
   14012d8bc:	mov    0x690(%rsp),%rax
   14012d8c4:	lea    0x1(%rax),%rdx
   14012d8c8:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012d8cd:	mov    $0x2,%r12d
   14012d8d3:	cmpb   $0x0,0x1040(%rbx)
   14012d8da:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   14012d8e0:	movzbl 0x2(%rbp),%eax
   14012d8e4:	lea    0x2927b5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d8eb:	add    $0x3,%rbp
   14012d8ef:	mov    (%rdi,%rax,8),%rax
   14012d8f3:	jmp    *%rax
   14012d8f5:	vzeroupper
   14012d8f8:	jmp    140129f8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x651b>
   14012d8fd:	cmp    $0x1,%ax
   14012d901:	je     140130f09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd499>
   14012d907:	cmp    $0x2,%ax
   14012d90b:	je     14013197b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf0b>
   14012d911:	test   %r12b,%r12b
   14012d914:	je     14012a12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14012d91a:	cmp    $0x1,%r12b
   14012d91e:	je     14013028d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc81d>
   14012d924:	lea    0x8(%rsi),%r8
   14012d928:	cmp    0x38(%rsp),%r8
   14012d92d:	jae    140134dd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11363>
   14012d933:	mov    0x1d0(%rsp),%rax
   14012d93b:	mov    %rax,(%rsi)
   14012d93e:	mov    0x1c8(%rsp),%rax
   14012d946:	mov    %r8,%rsi
   14012d949:	mov    %rax,0x1d0(%rsp)
   14012d951:	movabs $0xfff8000000000000,%rax
   14012d95b:	mov    %rax,0x1c8(%rsp)
   14012d963:	mov    $0x2,%r12d
   14012d969:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012d96e:	lea    0x0(%rbp,%rbp,1),%rdx
   14012d973:	lea    0x1048(%rbx),%rcx
   14012d97a:	vzeroupper
   14012d97d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012d982:	jmp    14012cf73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9503>
   14012d987:	cmp    $0x1,%dx
   14012d98b:	je     140130a95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd025>
   14012d991:	cmp    $0x2,%dx
   14012d995:	jne    140128031 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45c1>
   14012d99b:	lea    0x330(%rsp),%rcx
   14012d9a3:	vzeroupper
   14012d9a6:	call   14021bef0 <setun::VMValue::payload() const>
   14012d9ab:	mov    0x48(%rax),%rax
   14012d9af:	mov    %rax,0x40(%rsp)
   14012d9b4:	test   %rax,%rax
   14012d9b7:	je     14012feda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc46a>
   14012d9bd:	test   %r12b,%r12b
   14012d9c0:	je     140134acf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1105f>
   14012d9c6:	cmp    $0x1,%r12b
   14012d9ca:	je     14013855b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aeb>
   14012d9d0:	lea    0x8(%rsi),%r8
   14012d9d4:	cmp    0x38(%rsp),%r8
   14012d9d9:	jae    14013694d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12edd>
   14012d9df:	mov    0x1d0(%rsp),%rax
   14012d9e7:	lea    0x338(%rsp),%rdx
   14012d9ef:	mov    %r8,0x60(%rsp)
   14012d9f4:	lea    0x680(%rsp),%rcx
   14012d9fc:	mov    %rax,(%rsi)
   14012d9ff:	mov    0x1c8(%rsp),%rax
   14012da07:	mov    %rax,0x1d0(%rsp)
   14012da0f:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012da14:	mov    0x40(%rsp),%rcx
   14012da19:	lea    0x680(%rsp),%rdx
   14012da21:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14012da26:	mov    0x680(%rsp),%rcx
   14012da2e:	mov    0x60(%rsp),%r8
   14012da33:	mov    %rax,0x1c8(%rsp)
   14012da3b:	lea    0x690(%rsp),%rax
   14012da43:	cmp    %rax,%rcx
   14012da46:	je     140128080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4610>
   14012da4c:	mov    0x690(%rsp),%rax
   14012da54:	mov    %r8,0x40(%rsp)
   14012da59:	lea    0x1(%rax),%rdx
   14012da5d:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14012da62:	mov    0x40(%rsp),%r8
   14012da67:	jmp    140128080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4610>
   14012da6c:	nopl   0x0(%rax)
   14012da70:	cmp    $0x2,%r12b
   14012da74:	jne    14012e92e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaebe>
   14012da7a:	mov    0x1048(%rbx),%rdx
   14012da81:	lea    0x10(%rsi),%r8
   14012da85:	cmp    0x38(%rsp),%r8
   14012da8a:	jae    140135fa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12537>
   14012da90:	mov    0x1d0(%rsp),%rax
   14012da98:	mov    %rax,(%rsi)
   14012da9b:	mov    0x1c8(%rsp),%rax
   14012daa3:	mov    %rax,0x8(%rsi)
   14012daa7:	mov    %r8,%rsi
   14012daaa:	jmp    14012cef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9488>
   14012daaf:	movzbl %dil,%eax
   14012dab3:	mov    %rsi,%rdx
   14012dab6:	movabs $0xfffd000200000000,%rcx
   14012dac0:	shl    $0x3,%rax
   14012dac4:	sub    %rax,%rdx
   14012dac7:	movabs $0xffffffff00000000,%rax
   14012dad1:	mov    (%rdx),%rdx
   14012dad4:	and    %rdx,%rax
   14012dad7:	cmp    %rcx,%rax
   14012dada:	je     14012f3b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb942>
   14012dae0:	vzeroupper
   14012dae3:	mov    0x1048(%rbx),%rdx
   14012daea:	lea    0x8(%rsi),%r8
   14012daee:	cmp    0x38(%rsp),%r8
   14012daf3:	jae    140133ed5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10465>
   14012daf9:	mov    0x1050(%rbx),%rax
   14012db00:	mov    0x1c8(%rsp),%rcx
   14012db08:	mov    %rcx,(%rsi)
   14012db0b:	jmp    140127b14 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40a4>
   14012db10:	mov    0x1048(%rbx),%rdx
   14012db17:	lea    0x8(%rsi),%r8
   14012db1b:	cmp    0x38(%rsp),%r8
   14012db20:	jae    140134942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ed2>
   14012db26:	mov    0x1050(%rbx),%rax
   14012db2d:	vzeroupper
   14012db30:	mov    0x1c8(%rsp),%rcx
   14012db38:	mov    %rcx,(%rsi)
   14012db3b:	mov    %r8,%rsi
   14012db3e:	jmp    1401290df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x566f>
   14012db43:	mov    0x1048(%rbx),%rdx
   14012db4a:	lea    0x8(%rsi),%r8
   14012db4e:	cmp    0x38(%rsp),%r8
   14012db53:	jae    140133f23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104b3>
   14012db59:	mov    0x1050(%rbx),%rax
   14012db60:	vzeroupper
   14012db63:	mov    0x1c8(%rsp),%rcx
   14012db6b:	mov    %rcx,(%rsi)
   14012db6e:	mov    %r8,%rsi
   14012db71:	jmp    140129358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58e8>
   14012db76:	mov    0x1048(%rbx),%rdx
   14012db7d:	lea    0x8(%rsi),%r8
   14012db81:	cmp    0x38(%rsp),%r8
   14012db86:	jae    140133c40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101d0>
   14012db8c:	mov    0x1050(%rbx),%rax
   14012db93:	vzeroupper
   14012db96:	mov    0x1c8(%rsp),%rcx
   14012db9e:	mov    %rcx,(%rsi)
   14012dba1:	mov    %r8,%rsi
   14012dba4:	jmp    14012942b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59bb>
   14012dba9:	mov    0x1048(%rbx),%rdx
   14012dbb0:	lea    0x8(%rsi),%r8
   14012dbb4:	cmp    0x38(%rsp),%r8
   14012dbb9:	jae    140134242 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107d2>
   14012dbbf:	mov    0x1050(%rbx),%rax
   14012dbc6:	vzeroupper
   14012dbc9:	mov    0x1c8(%rsp),%rcx
   14012dbd1:	mov    %rcx,(%rsi)
   14012dbd4:	mov    %r8,%rsi
   14012dbd7:	jmp    140129777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d07>
   14012dbdc:	mov    0x1048(%rbx),%rdx
   14012dbe3:	lea    0x8(%rsi),%r8
   14012dbe7:	cmp    0x38(%rsp),%r8
   14012dbec:	jae    1401356a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c30>
   14012dbf2:	mov    0x1050(%rbx),%rax
   14012dbf9:	vzeroupper
   14012dbfc:	mov    0x1c8(%rsp),%rcx
   14012dc04:	mov    %rcx,(%rsi)
   14012dc07:	mov    %r8,%rsi
   14012dc0a:	jmp    1401299f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f80>
   14012dc0f:	mov    0x1048(%rbx),%rdx
   14012dc16:	lea    0x8(%rsi),%r8
   14012dc1a:	cmp    0x38(%rsp),%r8
   14012dc1f:	jae    1401345fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b8a>
   14012dc25:	mov    0x1050(%rbx),%rax
   14012dc2c:	vzeroupper
   14012dc2f:	mov    0x1c8(%rsp),%rcx
   14012dc37:	mov    %rcx,(%rsi)
   14012dc3a:	mov    %r8,%rsi
   14012dc3d:	jmp    140127340 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x38d0>
   14012dc42:	mov    0x1048(%rbx),%rdx
   14012dc49:	lea    0x8(%rsi),%r8
   14012dc4d:	cmp    0x38(%rsp),%r8
   14012dc52:	jae    140134885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e15>
   14012dc58:	mov    0x1050(%rbx),%rax
   14012dc5f:	vzeroupper
   14012dc62:	mov    0x1c8(%rsp),%rcx
   14012dc6a:	mov    %rcx,(%rsi)
   14012dc6d:	mov    %r8,%rsi
   14012dc70:	jmp    14012984a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5dda>
   14012dc75:	mov    0x1048(%rbx),%rdx
   14012dc7c:	lea    0x8(%rsi),%r8
   14012dc80:	cmp    0x38(%rsp),%r8
   14012dc85:	jae    14013467e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c0e>
   14012dc8b:	mov    0x1050(%rbx),%rax
   14012dc92:	vzeroupper
   14012dc95:	mov    0x1c8(%rsp),%rcx
   14012dc9d:	mov    %rcx,(%rsi)
   14012dca0:	mov    %r8,%rsi
   14012dca3:	jmp    140126ca8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3238>
   14012dca8:	mov    0x1048(%rbx),%rdx
   14012dcaf:	lea    0x8(%rsi),%r8
   14012dcb3:	cmp    0x38(%rsp),%r8
   14012dcb8:	jae    14013445f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109ef>
   14012dcbe:	mov    0x1050(%rbx),%rax
   14012dcc5:	vzeroupper
   14012dcc8:	mov    0x1c8(%rsp),%rcx
   14012dcd0:	mov    %rcx,(%rsi)
   14012dcd3:	mov    %r8,%rsi
   14012dcd6:	jmp    1401296a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c34>
   14012dcdb:	movb   $0xcc,-0x1(%rbp)
   14012dcdf:	mov    %r11,%rcx
   14012dce2:	vzeroupper
   14012dce5:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012dcea:	mov    0x60(%rsp),%rcx
   14012dcef:	vmovapd %xmm0,%xmm7
   14012dcf3:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012dcf8:	mov    0x40(%rsp),%rcx
   14012dcfd:	vmovapd %xmm0,%xmm6
   14012dd01:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012dd06:	movabs $0xfffc000000000000,%rax
   14012dd10:	vfmadd132sd %xmm6,%xmm0,%xmm7
   14012dd15:	vucomisd %xmm7,%xmm7
   14012dd19:	vmovq  %xmm7,%rdx
   14012dd1e:	cmovnp %rdx,%rax
   14012dd22:	mov    0x1068(%rbx),%rdx
   14012dd29:	mov    %rax,(%rdx,%rdi,8)
   14012dd2d:	jmp    14012cb90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9120>
   14012dd32:	mov    0x1048(%rbx),%rdx
   14012dd39:	lea    0x8(%rsi),%r8
   14012dd3d:	cmp    0x38(%rsp),%r8
   14012dd42:	jae    1401342f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10884>
   14012dd48:	mov    0x1050(%rbx),%rax
   14012dd4f:	vzeroupper
   14012dd52:	mov    0x1c8(%rsp),%rcx
   14012dd5a:	mov    %rcx,(%rsi)
   14012dd5d:	mov    %r8,%rsi
   14012dd60:	jmp    140126e4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33de>
   14012dd65:	mov    0x1048(%rbx),%rdx
   14012dd6c:	lea    0x8(%rsi),%r8
   14012dd70:	cmp    0x38(%rsp),%r8
   14012dd75:	jae    140135e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12421>
   14012dd7b:	mov    0x1050(%rbx),%rax
   14012dd82:	vzeroupper
   14012dd85:	mov    0x1c8(%rsp),%rcx
   14012dd8d:	mov    %rcx,(%rsi)
   14012dd90:	mov    %r8,%rsi
   14012dd93:	jmp    1401270c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3657>
   14012dd98:	mov    0x1048(%rbx),%rdx
   14012dd9f:	lea    0x8(%rsi),%r8
   14012dda3:	cmp    0x38(%rsp),%r8
   14012dda8:	jae    1401354a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a39>
   14012ddae:	mov    0x1050(%rbx),%rax
   14012ddb5:	vzeroupper
   14012ddb8:	mov    0x1c8(%rsp),%rcx
   14012ddc0:	mov    %rcx,(%rsi)
   14012ddc3:	mov    %r8,%rsi
   14012ddc6:	jmp    140127413 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39a3>
   14012ddcb:	lea    0x8(%rsi),%r8
   14012ddcf:	cmp    0x38(%rsp),%r8
   14012ddd4:	jae    140134124 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106b4>
   14012ddda:	mov    0x1c8(%rsp),%rdx
   14012dde2:	xor    %r12d,%r12d
   14012dde5:	mov    %rdx,(%rsi)
   14012dde8:	mov    %r8,%rsi
   14012ddeb:	jmp    1401266d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c67>
   14012ddf0:	mov    0x1048(%rbx),%rdx
   14012ddf7:	lea    0x8(%rsi),%r8
   14012ddfb:	cmp    0x38(%rsp),%r8
   14012de00:	jae    1401352d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11867>
   14012de06:	mov    0x1050(%rbx),%rax
   14012de0d:	vzeroupper
   14012de10:	mov    0x1c8(%rsp),%rcx
   14012de18:	mov    %rcx,(%rsi)
   14012de1b:	mov    %r8,%rsi
   14012de1e:	jmp    14012900c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x559c>
   14012de23:	mov    0x1048(%rbx),%rdx
   14012de2a:	lea    0x8(%rsi),%r8
   14012de2e:	cmp    0x38(%rsp),%r8
   14012de33:	jae    140134508 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a98>
   14012de39:	mov    0x1050(%rbx),%rax
   14012de40:	vzeroupper
   14012de43:	mov    0x1c8(%rsp),%rcx
   14012de4b:	mov    %rcx,(%rsi)
   14012de4e:	mov    %r8,%rsi
   14012de51:	jmp    14012768c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c1c>
   14012de56:	mov    0x1048(%rbx),%rdx
   14012de5d:	lea    0x8(%rsi),%r8
   14012de61:	cmp    0x38(%rsp),%r8
   14012de66:	jae    14013583d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11dcd>
   14012de6c:	mov    0x1050(%rbx),%rax
   14012de73:	vzeroupper
   14012de76:	mov    0x1c8(%rsp),%rcx
   14012de7e:	mov    %rcx,(%rsi)
   14012de81:	mov    %r8,%rsi
   14012de84:	jmp    14012695c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eec>
   14012de89:	mov    0x1048(%rbx),%rdx
   14012de90:	lea    0x8(%rsi),%r8
   14012de94:	cmp    0x38(%rsp),%r8
   14012de99:	jae    140135674 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c04>
   14012de9f:	mov    0x1050(%rbx),%rax
   14012dea6:	vzeroupper
   14012dea9:	mov    0x1c8(%rsp),%rcx
   14012deb1:	mov    %rcx,(%rsi)
   14012deb4:	mov    %r8,%rsi
   14012deb7:	jmp    140126a2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fbf>
   14012debc:	mov    0x1c8(%rsp),%rcx
   14012dec4:	add    $0x8,%rsi
   14012dec8:	xor    %r12d,%r12d
   14012decb:	mov    %rcx,(%rdx,%r13,8)
   14012decf:	mov    0x1d0(%rsp),%rdx
   14012ded7:	mov    %rdx,-0x8(%rsi)
   14012dedb:	jmp    140126809 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d99>
   14012dee0:	mov    0x1048(%rbx),%rdx
   14012dee7:	lea    0x8(%rsi),%r8
   14012deeb:	cmp    0x38(%rsp),%r8
   14012def0:	jae    140134320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108b0>
   14012def6:	mov    0x1050(%rbx),%rax
   14012defd:	vzeroupper
   14012df00:	mov    0x1c8(%rsp),%rcx
   14012df08:	mov    %rcx,(%rsi)
   14012df0b:	mov    %r8,%rsi
   14012df0e:	jmp    140129dbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x634e>
   14012df13:	mov    0x1048(%rbx),%rdx
   14012df1a:	lea    0x8(%rsi),%r8
   14012df1e:	cmp    0x38(%rsp),%r8
   14012df23:	jae    140135ffb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1258b>
   14012df29:	mov    0x1050(%rbx),%rax
   14012df30:	vzeroupper
   14012df33:	mov    0x1c8(%rsp),%rcx
   14012df3b:	mov    %rcx,(%rsi)
   14012df3e:	mov    %r8,%rsi
   14012df41:	jmp    140129e91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6421>
   14012df46:	mov    0x1048(%rbx),%rdx
   14012df4d:	lea    0x8(%rsi),%r8
   14012df51:	cmp    0x38(%rsp),%r8
   14012df56:	jae    140135377 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11907>
   14012df5c:	mov    0x1050(%rbx),%rax
   14012df63:	vzeroupper
   14012df66:	mov    0x1c8(%rsp),%rcx
   14012df6e:	mov    %rcx,(%rsi)
   14012df71:	mov    %r8,%rsi
   14012df74:	jmp    14012719a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x372a>
   14012df79:	mov    0x1048(%rbx),%rdx
   14012df80:	lea    0x8(%rsi),%r8
   14012df84:	cmp    0x38(%rsp),%r8
   14012df89:	jae    1401341bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1074d>
   14012df8f:	mov    0x1050(%rbx),%rax
   14012df96:	vzeroupper
   14012df99:	mov    0x1c8(%rsp),%rcx
   14012dfa1:	mov    %rcx,(%rsi)
   14012dfa4:	mov    %r8,%rsi
   14012dfa7:	jmp    140126b02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3092>
   14012dfac:	mov    0x1048(%rbx),%rdx
   14012dfb3:	lea    0x8(%rsi),%r8
   14012dfb7:	cmp    0x38(%rsp),%r8
   14012dfbc:	jae    1401356f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c89>
   14012dfc2:	mov    0x1050(%rbx),%rax
   14012dfc9:	vzeroupper
   14012dfcc:	mov    0x1c8(%rsp),%rcx
   14012dfd4:	mov    %rcx,(%rsi)
   14012dfd7:	mov    %r8,%rsi
   14012dfda:	jmp    140129ac3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6053>
   14012dfdf:	mov    0x1048(%rbx),%rdx
   14012dfe6:	lea    0x8(%rsi),%r8
   14012dfea:	cmp    0x38(%rsp),%r8
   14012dfef:	jae    1401344b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a47>
   14012dff5:	mov    0x1050(%rbx),%rax
   14012dffc:	mov    0x1c8(%rsp),%rcx
   14012e004:	mov    %rcx,(%rsi)
   14012e007:	mov    %r8,%rsi
   14012e00a:	jmp    140129cee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x627e>
   14012e00f:	mov    0x1048(%rbx),%rdx
   14012e016:	lea    0x8(%rsi),%r8
   14012e01a:	cmp    0x38(%rsp),%r8
   14012e01f:	jae    140133d0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1029b>
   14012e025:	mov    0x1050(%rbx),%rax
   14012e02c:	vzeroupper
   14012e02f:	mov    0x1c8(%rsp),%rcx
   14012e037:	mov    %rcx,(%rsi)
   14012e03a:	mov    %r8,%rsi
   14012e03d:	jmp    14012991d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ead>
   14012e042:	mov    0x1048(%rbx),%rdx
   14012e049:	lea    0x8(%rsi),%r8
   14012e04d:	cmp    0x38(%rsp),%r8
   14012e052:	jae    140134e0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1139f>
   14012e058:	mov    0x1050(%rbx),%rax
   14012e05f:	vzeroupper
   14012e062:	mov    0x1c8(%rsp),%rcx
   14012e06a:	mov    %rcx,(%rsi)
   14012e06d:	mov    %r8,%rsi
   14012e070:	jmp    140126bd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3165>
   14012e075:	mov    0x1048(%rbx),%rdx
   14012e07c:	lea    0x8(%rsi),%r8
   14012e080:	cmp    0x38(%rsp),%r8
   14012e085:	jae    1401353cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1195f>
   14012e08b:	mov    0x1050(%rbx),%rax
   14012e092:	vzeroupper
   14012e095:	mov    0x1c8(%rsp),%rcx
   14012e09d:	mov    %rcx,(%rsi)
   14012e0a0:	mov    %r8,%rsi
   14012e0a3:	jmp    1401294fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a8e>
   14012e0a8:	mov    0x1048(%rbx),%rdx
   14012e0af:	lea    0x8(%rsi),%r8
   14012e0b3:	cmp    0x38(%rsp),%r8
   14012e0b8:	jae    140135ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1244d>
   14012e0be:	mov    0x1050(%rbx),%rax
   14012e0c5:	vzeroupper
   14012e0c8:	mov    0x1c8(%rsp),%rcx
   14012e0d0:	mov    %rcx,(%rsi)
   14012e0d3:	mov    %r8,%rsi
   14012e0d6:	jmp    14012726d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37fd>
   14012e0db:	mov    0x1048(%rbx),%rdx
   14012e0e2:	lea    0x8(%rsi),%r8
   14012e0e6:	cmp    0x38(%rsp),%r8
   14012e0eb:	jae    140133fd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10565>
   14012e0f1:	mov    0x1050(%rbx),%rax
   14012e0f8:	vzeroupper
   14012e0fb:	mov    0x1c8(%rsp),%rcx
   14012e103:	mov    %rcx,(%rsi)
   14012e106:	mov    %r8,%rsi
   14012e109:	jmp    1401274e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a76>
   14012e10e:	mov    0x1048(%rbx),%rdx
   14012e115:	lea    0x8(%rsi),%r8
   14012e119:	cmp    0x38(%rsp),%r8
   14012e11e:	jae    14013448b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a1b>
   14012e124:	mov    0x1050(%rbx),%rax
   14012e12b:	vzeroupper
   14012e12e:	mov    0x1c8(%rsp),%rcx
   14012e136:	mov    %rcx,(%rsi)
   14012e139:	mov    %r8,%rsi
   14012e13c:	jmp    140129b96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6126>
   14012e141:	mov    0x1048(%rbx),%rdx
   14012e148:	lea    0x8(%rsi),%r8
   14012e14c:	cmp    0x38(%rsp),%r8
   14012e151:	jae    1401353a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11933>
   14012e157:	mov    0x1050(%rbx),%rax
   14012e15e:	vzeroupper
   14012e161:	mov    0x1c8(%rsp),%rcx
   14012e169:	mov    %rcx,(%rsi)
   14012e16c:	mov    %r8,%rsi
   14012e16f:	jmp    140128bed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x517d>
   14012e174:	mov    0x1048(%rbx),%rdx
   14012e17b:	lea    0x8(%rsi),%r8
   14012e17f:	cmp    0x38(%rsp),%r8
   14012e184:	jae    140136027 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125b7>
   14012e18a:	mov    0x1050(%rbx),%rax
   14012e191:	vzeroupper
   14012e194:	mov    0x1c8(%rsp),%rcx
   14012e19c:	mov    %rcx,(%rsi)
   14012e19f:	mov    %r8,%rsi
   14012e1a2:	jmp    140129285 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5815>
   14012e1a7:	mov    0x1048(%rbx),%rdx
   14012e1ae:	lea    0x8(%rsi),%r8
   14012e1b2:	cmp    0x38(%rsp),%r8
   14012e1b7:	jae    14013429b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1082b>
   14012e1bd:	mov    0x1050(%rbx),%rax
   14012e1c4:	vzeroupper
   14012e1c7:	mov    0x1c8(%rsp),%rcx
   14012e1cf:	mov    %rcx,(%rsi)
   14012e1d2:	mov    %r8,%rsi
   14012e1d5:	jmp    1401275b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b49>
   14012e1da:	mov    0x1048(%rbx),%rdx
   14012e1e1:	lea    0x8(%rsi),%r8
   14012e1e5:	cmp    0x38(%rsp),%r8
   14012e1ea:	jae    140134e3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113cb>
   14012e1f0:	mov    0x1050(%rbx),%rax
   14012e1f7:	vzeroupper
   14012e1fa:	mov    0x1c8(%rsp),%rcx
   14012e202:	mov    %rcx,(%rsi)
   14012e205:	mov    %r8,%rsi
   14012e208:	jmp    140128cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5250>
   14012e20d:	mov    0x1048(%rbx),%rdx
   14012e214:	lea    0x8(%rsi),%r8
   14012e218:	cmp    0x38(%rsp),%r8
   14012e21d:	jae    140134626 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bb6>
   14012e223:	mov    0x1050(%rbx),%rax
   14012e22a:	vzeroupper
   14012e22d:	mov    0x1c8(%rsp),%rcx
   14012e235:	mov    %rcx,(%rsi)
   14012e238:	mov    %r8,%rsi
   14012e23b:	jmp    1401291b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5742>
   14012e240:	mov    0x1048(%rbx),%rdx
   14012e247:	lea    0x8(%rsi),%r8
   14012e24b:	cmp    0x38(%rsp),%r8
   14012e250:	jae    140135e0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1239c>
   14012e256:	mov    0x1050(%rbx),%rax
   14012e25d:	vzeroupper
   14012e260:	mov    0x1c8(%rsp),%rcx
   14012e268:	mov    %rcx,(%rsi)
   14012e26b:	mov    %r8,%rsi
   14012e26e:	jmp    140128d93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5323>
   14012e273:	mov    0x1048(%rbx),%rdx
   14012e27a:	lea    0x8(%rsi),%r8
   14012e27e:	cmp    0x38(%rsp),%r8
   14012e283:	jae    1401341e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10779>
   14012e289:	mov    0x1050(%rbx),%rax
   14012e290:	vzeroupper
   14012e293:	mov    0x1c8(%rsp),%rcx
   14012e29b:	mov    %rcx,(%rsi)
   14012e29e:	mov    %r8,%rsi
   14012e2a1:	jmp    140126d7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x330b>
   14012e2a6:	mov    0x1048(%rbx),%rdx
   14012e2ad:	lea    0x8(%rsi),%r8
   14012e2b1:	cmp    0x38(%rsp),%r8
   14012e2b6:	jae    1401357d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d69>
   14012e2bc:	mov    0x1050(%rbx),%rax
   14012e2c3:	vzeroupper
   14012e2c6:	mov    0x1c8(%rsp),%rcx
   14012e2ce:	mov    %rcx,(%rsi)
   14012e2d1:	mov    %r8,%rsi
   14012e2d4:	jmp    140128e66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53f6>
   14012e2d9:	mov    0x1048(%rbx),%rdx
   14012e2e0:	lea    0x8(%rsi),%r8
   14012e2e4:	cmp    0x38(%rsp),%r8
   14012e2e9:	jae    140133f7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1050c>
   14012e2ef:	mov    0x1050(%rbx),%rax
   14012e2f6:	vzeroupper
   14012e2f9:	mov    0x1c8(%rsp),%rcx
   14012e301:	mov    %rcx,(%rsi)
   14012e304:	mov    %r8,%rsi
   14012e307:	jmp    1401295d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b61>
   14012e30c:	mov    0x1048(%rbx),%rdx
   14012e313:	lea    0x8(%rsi),%r8
   14012e317:	cmp    0x38(%rsp),%r8
   14012e31c:	jae    140134652 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10be2>
   14012e322:	mov    0x1050(%rbx),%rax
   14012e329:	vzeroupper
   14012e32c:	mov    0x1c8(%rsp),%rcx
   14012e334:	mov    %rcx,(%rsi)
   14012e337:	mov    %r8,%rsi
   14012e33a:	jmp    140128f39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54c9>
   14012e33f:	mov    0x1048(%rbx),%rdx
   14012e346:	lea    0x8(%rsi),%r8
   14012e34a:	cmp    0x38(%rsp),%r8
   14012e34f:	jae    140135e38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123c8>
   14012e355:	mov    0x1050(%rbx),%rax
   14012e35c:	vzeroupper
   14012e35f:	mov    0x1c8(%rsp),%rcx
   14012e367:	mov    %rcx,(%rsi)
   14012e36a:	mov    %r8,%rsi
   14012e36d:	jmp    140126ff4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3584>
   14012e372:	mov    0x1048(%rbx),%rdx
   14012e379:	lea    0x8(%rsi),%r8
   14012e37d:	cmp    0x38(%rsp),%r8
   14012e382:	jae    1401343ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1093e>
   14012e388:	mov    0x1050(%rbx),%rax
   14012e38f:	vzeroupper
   14012e392:	mov    0x1c8(%rsp),%rcx
   14012e39a:	mov    %rcx,(%rsi)
   14012e39d:	mov    %r8,%rsi
   14012e3a0:	jmp    140126f21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34b1>
   14012e3a5:	mov    %rcx,%r10
   14012e3a8:	shr    $0x20,%r10
   14012e3ac:	cmp    $0x5,%r10w
   14012e3b1:	jne    14012bb80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8110>
   14012e3b7:	and    %rax,%rdx
   14012e3ba:	cmp    %r9,%rdx
   14012e3bd:	je     140125eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e3c3:	cmp    %r8,%rdx
   14012e3c6:	jne    14012bb80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8110>
   14012e3cc:	mov    %rax,%r8
   14012e3cf:	shr    $0x20,%r8
   14012e3d3:	cmp    $0x5,%r8w
   14012e3d8:	je     140125eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e3de:	movabs $0xffffffff00000000,%r8
   14012e3e8:	and    %r8,%rcx
   14012e3eb:	cmp    %rdx,%rcx
   14012e3ee:	je     1401312a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd834>
   14012e3f4:	shr    $0x20,%rax
   14012e3f8:	mov    %eax,%edx
   14012e3fa:	test   %ax,%ax
   14012e3fd:	je     1401312a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd834>
   14012e403:	movabs $0xfffd000100000000,%rax
   14012e40d:	cmp    %rax,%rcx
   14012e410:	je     14012bbef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x817f>
   14012e416:	cmp    $0x1,%dx
   14012e41a:	jne    140125eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   14012e420:	jmp    14012bbef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x817f>
   14012e425:	nopl   (%rax)
   14012e428:	vzeroupper
   14012e42b:	mov    0x1048(%rbx),%rdx
   14012e432:	cmp    $0x2,%r12b
   14012e436:	jne    14012a466 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f6>
   14012e43c:	jmp    14012466c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   14012e441:	mov    %rcx,%r10
   14012e444:	shr    $0x20,%r10
   14012e448:	cmp    $0x5,%r10w
   14012e44d:	jne    14012b233 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77c3>
   14012e453:	and    %rax,%rdx
   14012e456:	cmp    %r9,%rdx
   14012e459:	je     140126114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e45f:	cmp    %r8,%rdx
   14012e462:	jne    14012b233 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77c3>
   14012e468:	mov    %rax,%r8
   14012e46b:	shr    $0x20,%r8
   14012e46f:	cmp    $0x5,%r8w
   14012e474:	je     140126114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e47a:	movabs $0xffffffff00000000,%r8
   14012e484:	and    %r8,%rcx
   14012e487:	cmp    %rdx,%rcx
   14012e48a:	je     14013105f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5ef>
   14012e490:	shr    $0x20,%rax
   14012e494:	mov    %eax,%edx
   14012e496:	test   %ax,%ax
   14012e499:	je     14013105f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5ef>
   14012e49f:	movabs $0xfffd000100000000,%rax
   14012e4a9:	cmp    %rax,%rcx
   14012e4ac:	je     14012b2a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7832>
   14012e4b2:	cmp    $0x1,%dx
   14012e4b6:	jne    140126114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   14012e4bc:	jmp    14012b2a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7832>
   14012e4c1:	nopl   0x0(%rax)
   14012e4c8:	mov    %rcx,%r10
   14012e4cb:	shr    $0x20,%r10
   14012e4cf:	cmp    $0x5,%r10w
   14012e4d4:	jne    14012b312 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78a2>
   14012e4da:	and    %rdx,%rax
   14012e4dd:	cmp    %r9,%rax
   14012e4e0:	je     140125b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e4e6:	cmp    %r8,%rax
   14012e4e9:	jne    14012b312 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78a2>
   14012e4ef:	mov    %rdx,%r8
   14012e4f2:	shr    $0x20,%r8
   14012e4f6:	cmp    $0x5,%r8w
   14012e4fb:	je     140125b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e501:	movabs $0xffffffff00000000,%r8
   14012e50b:	and    %r8,%rcx
   14012e50e:	cmp    %rax,%rcx
   14012e511:	je     14013111c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6ac>
   14012e517:	shr    $0x20,%rdx
   14012e51b:	mov    %edx,%eax
   14012e51d:	test   %dx,%dx
   14012e520:	je     14013111c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6ac>
   14012e526:	movabs $0xfffd000100000000,%rdx
   14012e530:	cmp    %rdx,%rcx
   14012e533:	je     14012b381 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7911>
   14012e539:	cmp    $0x1,%ax
   14012e53d:	jne    140125b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   14012e543:	jmp    14012b381 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7911>
   14012e548:	nopl   0x0(%rax,%rax,1)
   14012e550:	mov    %rcx,%r10
   14012e553:	shr    $0x20,%r10
   14012e557:	cmp    $0x5,%r10w
   14012e55c:	jne    14012ac81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7211>
   14012e562:	and    %rax,%rdx
   14012e565:	cmp    %r9,%rdx
   14012e568:	je     140125d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e56e:	cmp    %r8,%rdx
   14012e571:	jne    14012ac81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7211>
   14012e577:	mov    %rax,%r8
   14012e57a:	shr    $0x20,%r8
   14012e57e:	cmp    $0x5,%r8w
   14012e583:	je     140125d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e589:	movabs $0xffffffff00000000,%r8
   14012e593:	and    %r8,%rcx
   14012e596:	cmp    %rdx,%rcx
   14012e599:	je     140131382 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd912>
   14012e59f:	shr    $0x20,%rax
   14012e5a3:	mov    %eax,%edx
   14012e5a5:	test   %ax,%ax
   14012e5a8:	je     140131382 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd912>
   14012e5ae:	movabs $0xfffd000100000000,%rax
   14012e5b8:	cmp    %rax,%rcx
   14012e5bb:	je     14012acf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7280>
   14012e5c1:	cmp    $0x1,%dx
   14012e5c5:	jne    140125d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14012e5cb:	jmp    14012acf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7280>
   14012e5d0:	mov    %rcx,%r10
   14012e5d3:	shr    $0x20,%r10
   14012e5d7:	cmp    $0x5,%r10w
   14012e5dc:	jne    14012b57f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b0f>
   14012e5e2:	and    %rax,%rdx
   14012e5e5:	cmp    %r9,%rdx
   14012e5e8:	je     140125fe5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e5ee:	cmp    %r8,%rdx
   14012e5f1:	jne    14012b57f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b0f>
   14012e5f7:	mov    %rax,%r8
   14012e5fa:	shr    $0x20,%r8
   14012e5fe:	cmp    $0x5,%r8w
   14012e603:	je     140125fe5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e609:	movabs $0xffffffff00000000,%r8
   14012e613:	and    %r8,%rcx
   14012e616:	cmp    %rdx,%rcx
   14012e619:	je     140131889 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde19>
   14012e61f:	shr    $0x20,%rax
   14012e623:	mov    %eax,%edx
   14012e625:	test   %ax,%ax
   14012e628:	je     140131889 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde19>
   14012e62e:	movabs $0xfffd000100000000,%rax
   14012e638:	cmp    %rax,%rcx
   14012e63b:	je     14012b5ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b7e>
   14012e641:	cmp    $0x1,%dx
   14012e645:	jne    140125fe5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   14012e64b:	jmp    14012b5ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b7e>
   14012e650:	vzeroupper
   14012e653:	mov    0x60(%rsp),%rbp
   14012e658:	mov    0x1048(%rbx),%rdx
   14012e65f:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e664:	mov    %rax,%rbp
   14012e667:	vzeroupper
   14012e66a:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e66f:	test   %r12b,%r12b
   14012e672:	je     140128b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x511e>
   14012e678:	cmp    $0x1,%r12b
   14012e67c:	je     14012cccc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x925c>
   14012e682:	lea    0x8(%rsi),%r8
   14012e686:	cmp    0x38(%rsp),%r8
   14012e68b:	jae    140134407 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10997>
   14012e691:	mov    0x1d0(%rsp),%rax
   14012e699:	mov    $0x2,%r12d
   14012e69f:	mov    %rax,(%rsi)
   14012e6a2:	mov    0x1c8(%rsp),%rax
   14012e6aa:	mov    %r8,%rsi
   14012e6ad:	mov    %rax,0x1d0(%rsp)
   14012e6b5:	jmp    140128b94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5124>
   14012e6ba:	mov    0xb0(%r14),%rdx
   14012e6c1:	jmp    14012ce1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93ad>
   14012e6c6:	mov    0x1048(%rbx),%rdx
   14012e6cd:	mov    %rdi,%rbp
   14012e6d0:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012e6d5:	mov    0x1048(%rbx),%rdx
   14012e6dc:	vzeroupper
   14012e6df:	jmp    14012a417 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69a7>
   14012e6e4:	mov    0x1c8(%rsp),%rdx
   14012e6ec:	test   %al,%al
   14012e6ee:	mov    $0x2,%r12d
   14012e6f4:	movabs $0xfffa000000000001,%rax
   14012e6fe:	mov    %rdx,0x1d0(%rsp)
   14012e706:	movabs $0xfffa000000000000,%rdx
   14012e710:	cmovne %rax,%rdx
   14012e714:	jmp    140124f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b>
   14012e719:	mov    0x1c8(%rsp),%rdx
   14012e721:	mov    $0x2,%r12d
   14012e727:	mov    %rdx,0x1d0(%rsp)
   14012e72f:	mov    0x1068(%rbx),%rdx
   14012e736:	mov    (%rdx,%rax,8),%rax
   14012e73a:	mov    %rax,0x1c8(%rsp)
   14012e742:	jmp    14012503f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15cf>
   14012e747:	mov    0x1c8(%rsp),%rax
   14012e74f:	mov    $0x2,%r12d
   14012e755:	mov    %rax,0x1d0(%rsp)
   14012e75d:	jmp    140124fa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534>
   14012e762:	mov    0x1c8(%rsp),%rdx
   14012e76a:	mov    $0x2,%r12d
   14012e770:	mov    %rdx,0x1d0(%rsp)
   14012e778:	movabs $0xfff9000000000000,%rdx
   14012e782:	or     %rdx,%rax
   14012e785:	jmp    140124d82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1312>
   14012e78a:	mov    0x1c8(%rsp),%rax
   14012e792:	mov    %rax,0x1d0(%rsp)
   14012e79a:	mov    0x60(%rsp),%rax
   14012e79f:	mov    %rax,0x680(%rsp)
   14012e7a7:	lock addl $0x1,0x8(%rdi)
   14012e7ac:	lea    0x680(%rsp),%rdx
   14012e7b4:	lea    0x540(%rsp),%rcx
   14012e7bc:	mov    %rdi,0x688(%rsp)
   14012e7c4:	call   14020f340 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012e7c9:	jmp    14012d06f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ff>
   14012e7ce:	cmp    $0x1,%r12b
   14012e7d2:	je     14012daaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa03f>
   14012e7d8:	movzbl %dil,%edx
   14012e7dc:	mov    $0x1,%eax
   14012e7e1:	sub    %rdx,%rax
   14012e7e4:	mov    (%rsi,%rax,8),%rdx
   14012e7e8:	jmp    140127acc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x405c>
   14012e7ed:	lea    0x1d0(%rsp),%rax
   14012e7f5:	cmp    $0x2,%r12b
   14012e7f9:	je     14012e80b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad9b>
   14012e7fb:	lea    -0x8(%rsi),%rdx
   14012e7ff:	lea    -0x10(%rsi),%rax
   14012e803:	cmp    $0x1,%r12b
   14012e807:	cmove  %rdx,%rax
   14012e80b:	mov    (%rax),%rdx
   14012e80e:	jmp    140127acc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x405c>
   14012e813:	mov    0x1c8(%rsp),%rax
   14012e81b:	mov    $0x2,%r12d
   14012e821:	mov    %rax,0x1d0(%rsp)
   14012e829:	mov    0x1068(%rbx),%rax
   14012e830:	mov    0x18(%rax,%r13,8),%rax
   14012e835:	mov    %rax,0x1c8(%rsp)
   14012e83d:	jmp    14012a3a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6939>
   14012e842:	mov    0x1c8(%rsp),%rax
   14012e84a:	mov    $0x2,%r12d
   14012e850:	mov    %rax,0x1d0(%rsp)
   14012e858:	mov    0x1068(%rbx),%rax
   14012e85f:	mov    0x10(%rax,%r13,8),%rax
   14012e864:	mov    %rax,0x1c8(%rsp)
   14012e86c:	jmp    14012a333 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68c3>
   14012e871:	mov    0x1c8(%rsp),%rax
   14012e879:	mov    $0x2,%r12d
   14012e87f:	mov    %rax,0x1d0(%rsp)
   14012e887:	mov    0x1068(%rbx),%rax
   14012e88e:	mov    0x8(%rax,%r13,8),%rax
   14012e893:	mov    %rax,0x1c8(%rsp)
   14012e89b:	jmp    14012a2bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x684d>
   14012e8a0:	mov    0x1c8(%rsp),%rax
   14012e8a8:	mov    $0x2,%r12d
   14012e8ae:	mov    %rax,0x1d0(%rsp)
   14012e8b6:	mov    0x1068(%rbx),%rax
   14012e8bd:	mov    (%rax,%r13,8),%rax
   14012e8c1:	mov    %rax,0x1c8(%rsp)
   14012e8c9:	jmp    14012a247 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67d7>
   14012e8ce:	vmovq  %rax,%xmm0
   14012e8d3:	mov    0x1c8(%rsp),%rdx
   14012e8db:	mov    $0x2,%r12d
   14012e8e1:	vucomisd %xmm0,%xmm0
   14012e8e5:	mov    %rdx,0x1d0(%rsp)
   14012e8ed:	movabs $0xfffc000000000000,%rdx
   14012e8f7:	cmovp  %rdx,%rax
   14012e8fb:	jmp    140124eb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1440>
   14012e900:	mov    0x1c8(%rsp),%rdx
   14012e908:	mov    $0x2,%r12d
   14012e90e:	mov    %rdx,0x1d0(%rsp)
   14012e916:	mov    0x1080(%rbx),%rdx
   14012e91d:	mov    (%rdx,%rax,8),%rax
   14012e921:	mov    %rax,0x1c8(%rsp)
   14012e929:	jmp    14012514d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16dd>
   14012e92e:	sub    $0x1,%r12b
   14012e932:	jne    14012cef1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9481>
   14012e938:	mov    0x1048(%rbx),%rdx
   14012e93f:	lea    0x8(%rsi),%r8
   14012e943:	cmp    0x38(%rsp),%r8
   14012e948:	jae    1401349a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f37>
   14012e94e:	mov    0x1c8(%rsp),%rax
   14012e956:	mov    %rax,(%rsi)
   14012e959:	mov    %r8,%rsi
   14012e95c:	jmp    14012cef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9488>
   14012e961:	cmp    %rax,%rdi
   14012e964:	jle    140131d3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2cd>
   14012e96a:	test   %rdi,%rdi
   14012e96d:	setne  %al
   14012e970:	movabs $0xfffa000000000000,%rdx
   14012e97a:	movzbl %al,%eax
   14012e97d:	add    %rdx,%rax
   14012e980:	mov    %rax,0x1c8(%rsp)
   14012e988:	jmp    140125a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   14012e98d:	mov    0x1c8(%rsp),%rax
   14012e995:	mov    %edi,0x690(%rsp)
   14012e99c:	lea    0x1a0(%rsp),%rdx
   14012e9a4:	lea    0x540(%rsp),%rcx
   14012e9ac:	vmovdqa %xmm0,0x680(%rsp)
   14012e9b5:	mov    $0x2,%r12d
   14012e9bb:	mov    %rax,0x1d0(%rsp)
   14012e9c3:	movl   $0x0,0x694(%rsp)
   14012e9ce:	mov    0x690(%rsp),%rax
   14012e9d6:	vmovdqa %xmm0,0x1a0(%rsp)
   14012e9df:	mov    %rax,0x1b0(%rsp)
   14012e9e7:	vzeroupper
   14012e9ea:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012e9ef:	mov    0x540(%rsp),%rax
   14012e9f7:	mov    %rax,0x1c8(%rsp)
   14012e9ff:	jmp    140124e60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0>
   14012ea04:	cmp    %rax,%rdi
   14012ea07:	jge    140131e58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3e8>
   14012ea0d:	test   %rdi,%rdi
   14012ea10:	setne  %al
   14012ea13:	movabs $0xfffa000000000000,%rdx
   14012ea1d:	movzbl %al,%eax
   14012ea20:	add    %rdx,%rax
   14012ea23:	mov    %rax,0x1c8(%rsp)
   14012ea2b:	jmp    140125915 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   14012ea30:	mov    0x1c8(%rsp),%rax
   14012ea38:	mov    %rdi,%rdx
   14012ea3b:	lea    0x680(%rsp),%rcx
   14012ea43:	mov    $0x2,%r12d
   14012ea49:	mov    %rax,0x1d0(%rsp)
   14012ea51:	vzeroupper
   14012ea54:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012ea59:	mov    0x680(%rsp),%rax
   14012ea61:	mov    %rax,0x1c8(%rsp)
   14012ea69:	jmp    140124d08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1298>
   14012ea6e:	lea    0x420(%rsp),%rax
   14012ea76:	mov    %rcx,%rdx
   14012ea79:	mov    %r9,0x80(%rsp)
   14012ea81:	mov    %rax,%rcx
   14012ea84:	mov    %rax,0x60(%rsp)
   14012ea89:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012ea8e:	mov    0x80(%rsp),%r9
   14012ea96:	jmp    140124add <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106d>
   14012ea9b:	shl    $0x10,%rax
   14012ea9f:	shl    $0x10,%rcx
   14012eaa3:	movabs $0xfffa000000000000,%rdx
   14012eaad:	cmp    %rax,%rcx
   14012eab0:	movabs $0xfffa000000000001,%rax
   14012eaba:	cmovge %rax,%rdx
   14012eabe:	mov    %rdx,0x1c8(%rsp)
   14012eac6:	lea    -0x1(%rbp),%rdx
   14012eaca:	cmpb   $0x0,0x1520f(%rbx)
   14012ead1:	je     14012eb00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb090>
   14012ead3:	mov    0xe8(%r14),%rax
   14012eada:	mov    0xf0(%r14),%rcx
   14012eae1:	sub    %r15,%rdx
   14012eae4:	sub    %rax,%rcx
   14012eae7:	cmp    %rcx,%rdx
   14012eaea:	jae    14012eb00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb090>
   14012eaec:	add    %rdx,%rax
   14012eaef:	movzbl (%rax),%edi
   14012eaf2:	lea    0x1(%rdi),%edx
   14012eaf5:	mov    %dl,(%rax)
   14012eaf7:	cmp    $0x7,%dl
   14012eafa:	jbe    14012eb00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb090>
   14012eafc:	movb   $0xcf,-0x1(%rbp)
   14012eb00:	cmpb   $0x0,0x1040(%rbx)
   14012eb07:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012eb0d:	movzbl 0x0(%rbp),%eax
   14012eb11:	lea    0x291588(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012eb18:	add    $0x1,%rbp
   14012eb1c:	mov    (%rdi,%rax,8),%rax
   14012eb20:	jmp    *%rax
   14012eb22:	movabs $0xfffa000000000000,%rax
   14012eb2c:	cmp    %rcx,%rdx
   14012eb2f:	movabs $0xfffa000000000001,%rdx
   14012eb39:	cmove  %rdx,%rax
   14012eb3d:	lea    -0x1(%rbp),%rdx
   14012eb41:	mov    %rax,0x1c8(%rsp)
   14012eb49:	cmpb   $0x0,0x1520f(%rbx)
   14012eb50:	je     14012eb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb10f>
   14012eb52:	mov    0xe8(%r14),%rax
   14012eb59:	mov    0xf0(%r14),%rcx
   14012eb60:	sub    %r15,%rdx
   14012eb63:	sub    %rax,%rcx
   14012eb66:	cmp    %rcx,%rdx
   14012eb69:	jae    14012eb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb10f>
   14012eb6b:	add    %rdx,%rax
   14012eb6e:	movzbl (%rax),%edi
   14012eb71:	lea    0x1(%rdi),%edx
   14012eb74:	mov    %dl,(%rax)
   14012eb76:	cmp    $0x7,%dl
   14012eb79:	jbe    14012eb7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb10f>
   14012eb7b:	movb   $0xc1,-0x1(%rbp)
   14012eb7f:	cmpb   $0x0,0x1040(%rbx)
   14012eb86:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012eb8c:	movzbl 0x0(%rbp),%eax
   14012eb90:	lea    0x291509(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012eb97:	add    $0x1,%rbp
   14012eb9b:	mov    (%rdi,%rax,8),%rax
   14012eb9f:	jmp    *%rax
   14012eba1:	movabs $0xffff000000000000,%rax
   14012ebab:	movabs $0xfff8000000000000,%rdx
   14012ebb5:	and    0x338(%rsp),%rax
   14012ebbd:	cmp    %rdx,%rax
   14012ebc0:	jne    14012ef27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4b7>
   14012ebc6:	lea    0x330(%rsp),%rcx
   14012ebce:	vzeroupper
   14012ebd1:	call   14021bef0 <setun::VMValue::payload() const>
   14012ebd6:	mov    0x58(%rax),%r10
   14012ebda:	test   %r10,%r10
   14012ebdd:	je     140128009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4599>
   14012ebe3:	mov    0x338(%rsp),%r9
   14012ebeb:	shl    $0x10,%r9
   14012ebef:	mov    %r9,%rdi
   14012ebf2:	sar    $0x10,%rdi
   14012ebf6:	js     140128009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4599>
   14012ebfc:	mov    %r10,%rcx
   14012ebff:	mov    %r10,0x40(%rsp)
   14012ec04:	call   140147380 <setun::ArrayObject::size() const>
   14012ec09:	cmp    %rax,%rdi
   14012ec0c:	jae    140128009 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4599>
   14012ec12:	mov    0x40(%rsp),%r10
   14012ec17:	movzbl (%r10),%eax
   14012ec1b:	cmp    $0x3,%al
   14012ec1d:	je     1401351a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11735>
   14012ec23:	ja     1401350e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11678>
   14012ec29:	cmp    $0x1,%al
   14012ec2b:	je     140135054 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115e4>
   14012ec31:	cmp    $0x2,%al
   14012ec33:	jne    140135013 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115a3>
   14012ec39:	test   %r12b,%r12b
   14012ec3c:	je     140136b9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1312c>
   14012ec42:	sub    $0x1,%r12b
   14012ec46:	je     140136b5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130ec>
   14012ec4c:	lea    0x8(%rsi),%r8
   14012ec50:	cmp    0x38(%rsp),%r8
   14012ec55:	jae    140136afd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1308d>
   14012ec5b:	mov    0x1d0(%rsp),%rax
   14012ec63:	lea    0x680(%rsp),%rcx
   14012ec6b:	mov    %r8,0x40(%rsp)
   14012ec70:	mov    $0x2,%r12d
   14012ec76:	mov    %rax,(%rsi)
   14012ec79:	mov    0x1c8(%rsp),%rax
   14012ec81:	mov    %rax,0x1d0(%rsp)
   14012ec89:	mov    0x38(%r10),%rax
   14012ec8d:	movzbl (%rax,%rdi,1),%edx
   14012ec91:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012ec96:	mov    0x680(%rsp),%rax
   14012ec9e:	mov    0x40(%rsp),%rsi
   14012eca3:	mov    %rax,0x1c8(%rsp)
   14012ecab:	cmpb   $0x0,0x1040(%rbx)
   14012ecb2:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   14012ecb8:	movzbl 0x0(%rbp),%eax
   14012ecbc:	lea    0x2913dd(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ecc3:	add    $0x1,%rbp
   14012ecc7:	mov    (%rdi,%rax,8),%rax
   14012eccb:	jmp    *%rax
   14012eccd:	nopl   (%rax)
   14012ecd0:	movzwl %r10w,%r8d
   14012ecd4:	add    %r13,%r8
   14012ecd7:	lea    (%rax,%r8,8),%r10
   14012ecdb:	and    (%r10),%rdx
   14012ecde:	mov    %r10,0xe0(%rsp)
   14012ece6:	cmp    %rcx,%rdx
   14012ece9:	jne    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   14012ecef:	movzwl %r9w,%edx
   14012ecf3:	add    %r13,%rdx
   14012ecf6:	lea    (%rax,%rdx,8),%rcx
   14012ecfa:	movzwl %r11w,%edx
   14012ecfe:	add    %r13,%rdx
   14012ed01:	mov    %rcx,0x100(%rsp)
   14012ed09:	lea    (%rax,%rdx,8),%r11
   14012ed0d:	movzwl 0x40(%rsp),%edx
   14012ed12:	mov    %r11,0xa0(%rsp)
   14012ed1a:	add    %r13,%rdx
   14012ed1d:	lea    (%rax,%rdx,8),%r10
   14012ed21:	mov    (%rcx),%rdx
   14012ed24:	mov    $0xffff,%eax
   14012ed29:	shl    $0x30,%rax
   14012ed2d:	mov    %r10,0x80(%rsp)
   14012ed35:	and    %rax,%rdx
   14012ed38:	mov    %rdx,%rcx
   14012ed3b:	mov    $0x1fff,%edx
   14012ed40:	shl    $0x33,%rdx
   14012ed44:	cmp    %rdx,%rcx
   14012ed47:	jne    140136e13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133a3>
   14012ed4d:	mov    (%r10),%rdx
   14012ed50:	and    %rax,%rdx
   14012ed53:	cmp    %rcx,%rdx
   14012ed56:	jne    140136e13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133a3>
   14012ed5c:	and    (%r11),%rax
   14012ed5f:	cmp    %rdx,%rax
   14012ed62:	jne    140136e13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133a3>
   14012ed68:	mov    %rdi,%rcx
   14012ed6b:	vzeroupper
   14012ed6e:	call   14021bef0 <setun::VMValue::payload() const>
   14012ed73:	mov    0x58(%rax),%rcx
   14012ed77:	mov    %rcx,0x40(%rsp)
   14012ed7c:	mov    0xe0(%rsp),%rcx
   14012ed84:	call   14021bef0 <setun::VMValue::payload() const>
   14012ed89:	mov    0x40(%rsp),%rcx
   14012ed8e:	mov    0x58(%rax),%rdx
   14012ed92:	test   %rcx,%rcx
   14012ed95:	je     140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012ed9b:	test   %rdx,%rdx
   14012ed9e:	je     140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012eda4:	cmpb   $0x1,(%rcx)
   14012eda7:	jne    140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012edad:	cmpb   $0x1,(%rdx)
   14012edb0:	jne    140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012edb6:	mov    0x100(%rsp),%rax
   14012edbe:	mov    (%rax),%rax
   14012edc1:	mov    %rax,0x40(%rsp)
   14012edc6:	shl    $0x10,%rax
   14012edca:	sar    $0x10,%rax
   14012edce:	mov    %rax,0x120(%rsp)
   14012edd6:	js     140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012eddc:	mov    0x80(%rsp),%r10
   14012ede4:	mov    %rcx,0x40(%rsp)
   14012ede9:	mov    %rdx,0x140(%rsp)
   14012edf1:	mov    (%r10),%rax
   14012edf4:	shl    $0x10,%rax
   14012edf8:	sar    $0x10,%rax
   14012edfc:	mov    %rax,0xc0(%rsp)
   14012ee04:	call   140147380 <setun::ArrayObject::size() const>
   14012ee09:	cmp    %rax,0x120(%rsp)
   14012ee11:	jae    140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012ee17:	cmpq   $0x0,0xc0(%rsp)
   14012ee20:	js     140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012ee26:	mov    0x140(%rsp),%rcx
   14012ee2e:	call   140147380 <setun::ArrayObject::size() const>
   14012ee33:	mov    0xc0(%rsp),%r11
   14012ee3b:	cmp    %rax,%r11
   14012ee3e:	jae    140134e67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113f7>
   14012ee44:	mov    0x40(%rsp),%rcx
   14012ee49:	mov    0x140(%rsp),%rdx
   14012ee51:	mov    0xa0(%rsp),%rdi
   14012ee59:	mov    0x20(%rcx),%rax
   14012ee5d:	mov    0x20(%rdx),%rcx
   14012ee61:	mov    (%rdi),%rdx
   14012ee64:	mov    0x120(%rsp),%rdi
   14012ee6c:	shl    $0x10,%rdx
   14012ee70:	sar    $0x10,%rdx
   14012ee74:	imul   (%rcx,%r11,8),%rdx
   14012ee79:	add    %rdx,(%rax,%rdi,8)
   14012ee7d:	cmpb   $0x0,0x1040(%rbx)
   14012ee84:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   14012ee8a:	movzbl 0xa(%rbp),%eax
   14012ee8e:	lea    0x29120b(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ee95:	add    $0xb,%rbp
   14012ee99:	mov    (%rdi,%rax,8),%rax
   14012ee9d:	jmp    *%rax
   14012ee9f:	nop
   14012eea0:	shl    $0x10,%rax
   14012eea4:	shl    $0x10,%rcx
   14012eea8:	movabs $0xfffa000000000000,%rdx
   14012eeb2:	cmp    %rax,%rcx
   14012eeb5:	movabs $0xfffa000000000001,%rax
   14012eebf:	cmovg  %rax,%rdx
   14012eec3:	mov    %rdx,0x1c8(%rsp)
   14012eecb:	lea    -0x1(%rbp),%rdx
   14012eecf:	cmpb   $0x0,0x1520f(%rbx)
   14012eed6:	je     14012ef05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb495>
   14012eed8:	mov    0xe8(%r14),%rax
   14012eedf:	mov    0xf0(%r14),%rcx
   14012eee6:	sub    %r15,%rdx
   14012eee9:	sub    %rax,%rcx
   14012eeec:	cmp    %rcx,%rdx
   14012eeef:	jae    14012ef05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb495>
   14012eef1:	add    %rdx,%rax
   14012eef4:	movzbl (%rax),%edi
   14012eef7:	lea    0x1(%rdi),%edx
   14012eefa:	mov    %dl,(%rax)
   14012eefc:	cmp    $0x7,%dl
   14012eeff:	jbe    14012ef05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb495>
   14012ef01:	movb   $0xce,-0x1(%rbp)
   14012ef05:	cmpb   $0x0,0x1040(%rbx)
   14012ef0c:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012ef12:	movzbl 0x0(%rbp),%eax
   14012ef16:	lea    0x291183(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ef1d:	add    $0x1,%rbp
   14012ef21:	mov    (%rdi,%rax,8),%rax
   14012ef25:	jmp    *%rax
   14012ef27:	lea    0x330(%rsp),%rcx
   14012ef2f:	vzeroupper
   14012ef32:	call   14021bef0 <setun::VMValue::payload() const>
   14012ef37:	mov    0x58(%rax),%rdi
   14012ef3b:	test   %rdi,%rdi
   14012ef3e:	je     14012ef50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e0>
   14012ef40:	mov    %rdi,%rcx
   14012ef43:	call   140147460 <setun::ArrayObject::empty() const>
   14012ef48:	test   %al,%al
   14012ef4a:	je     140133d6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102fb>
   14012ef50:	test   %r12b,%r12b
   14012ef53:	je     14012d6af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c3f>
   14012ef59:	cmp    $0x1,%r12b
   14012ef5d:	je     14013544f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119df>
   14012ef63:	lea    0x8(%rsi),%r8
   14012ef67:	cmp    0x38(%rsp),%r8
   14012ef6c:	jb     140128053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e3>
   14012ef72:	mov    0x1050(%rbx),%rax
   14012ef79:	mov    0x1048(%rbx),%rdx
   14012ef80:	mov    %rax,0x38(%rsp)
   14012ef85:	sub    %rdx,%rax
   14012ef88:	sar    $0x3,%rax
   14012ef8c:	lea    (%rax,%rax,1),%rcx
   14012ef90:	cmp    %rcx,%rax
   14012ef93:	jae    140128053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e3>
   14012ef99:	sub    %rdx,%rsi
   14012ef9c:	mov    %rcx,%rdx
   14012ef9f:	lea    0x1048(%rbx),%rcx
   14012efa6:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012efab:	mov    0x1050(%rbx),%rax
   14012efb2:	add    0x1048(%rbx),%rsi
   14012efb9:	lea    0x8(%rsi),%r8
   14012efbd:	mov    %rax,0x38(%rsp)
   14012efc2:	jmp    140128053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e3>
   14012efc7:	nopw   0x0(%rax,%rax,1)
   14012efd0:	lea    0x440(%rsp),%r8
   14012efd8:	mov    %r9,%rdx
   14012efdb:	mov    %r8,%rcx
   14012efde:	mov    %r8,0x80(%rsp)
   14012efe6:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012efeb:	mov    0x80(%rsp),%r8
   14012eff3:	jmp    140124b48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d8>
   14012eff8:	mov    %rdx,0x328(%rsp)
   14012f000:	lea    0x680(%rsp),%rcx
   14012f008:	lea    0x328(%rsp),%rdx
   14012f010:	vzeroupper
   14012f013:	call   14021c090 <setun::VMValue::as_array() const>
   14012f018:	mov    0x688(%rsp),%rax
   14012f020:	mov    %rax,0x60(%rsp)
   14012f025:	mov    0x680(%rsp),%rax
   14012f02d:	mov    %rax,0x40(%rsp)
   14012f032:	test   %rax,%rax
   14012f035:	je     14012f063 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5f3>
   14012f037:	lea    0x320(%rsp),%rcx
   14012f03f:	call   14021aa80 <setun::VMValue::as_int() const>
   14012f044:	mov    %rax,%rdi
   14012f047:	test   %rax,%rax
   14012f04a:	js     14013385b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdeb>
   14012f050:	mov    0x40(%rsp),%rcx
   14012f055:	call   140147380 <setun::ArrayObject::size() const>
   14012f05a:	cmp    %rax,%rdi
   14012f05d:	jb     14013529d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1182d>
   14012f063:	mov    0x60(%rsp),%rax
   14012f068:	test   %rax,%rax
   14012f06b:	je     14012a1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012f071:	mov    %rax,%rcx
   14012f074:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012f079:	jmp    14012a1d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6762>
   14012f07e:	shl    $0x10,%rax
   14012f082:	shl    $0x10,%rcx
   14012f086:	movabs $0xfffa000000000000,%rdx
   14012f090:	cmp    %rcx,%rax
   14012f093:	movabs $0xfffa000000000001,%rax
   14012f09d:	cmovge %rax,%rdx
   14012f0a1:	mov    %rdx,0x1c8(%rsp)
   14012f0a9:	lea    -0x1(%rbp),%rdx
   14012f0ad:	cmpb   $0x0,0x1520f(%rbx)
   14012f0b4:	je     14012f0e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb673>
   14012f0b6:	mov    0xe8(%r14),%rax
   14012f0bd:	mov    0xf0(%r14),%rcx
   14012f0c4:	sub    %r15,%rdx
   14012f0c7:	sub    %rax,%rcx
   14012f0ca:	cmp    %rcx,%rdx
   14012f0cd:	jae    14012f0e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb673>
   14012f0cf:	add    %rdx,%rax
   14012f0d2:	movzbl (%rax),%edi
   14012f0d5:	lea    0x1(%rdi),%edx
   14012f0d8:	mov    %dl,(%rax)
   14012f0da:	cmp    $0x7,%dl
   14012f0dd:	jbe    14012f0e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb673>
   14012f0df:	movb   $0xc0,-0x1(%rbp)
   14012f0e3:	cmpb   $0x0,0x1040(%rbx)
   14012f0ea:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012f0f0:	movzbl 0x0(%rbp),%eax
   14012f0f4:	lea    0x290fa5(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f0fb:	add    $0x1,%rbp
   14012f0ff:	mov    (%rdi,%rax,8),%rax
   14012f103:	jmp    *%rax
   14012f105:	mov    0x348(%rsp),%rax
   14012f10d:	and    %rdx,%rax
   14012f110:	mov    %rax,0x40(%rsp)
   14012f115:	mov    %rax,%rdi
   14012f118:	movabs $0xfff8000000000000,%rax
   14012f122:	cmp    %rax,%rdi
   14012f125:	jne    14012f545 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbad5>
   14012f12b:	lea    0x350(%rsp),%r10
   14012f133:	mov    %r8,0x350(%rsp)
   14012f13b:	mov    %r8,0x80(%rsp)
   14012f143:	mov    %r10,%rcx
   14012f146:	mov    %r10,0x60(%rsp)
   14012f14b:	vzeroupper
   14012f14e:	call   14021bef0 <setun::VMValue::payload() const>
   14012f153:	mov    0x60(%rsp),%r10
   14012f158:	mov    0x80(%rsp),%r8
   14012f160:	mov    0x58(%rax),%rdi
   14012f164:	test   %rdi,%rdi
   14012f167:	je     14012f550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbae0>
   14012f16d:	mov    0x348(%rsp),%r9
   14012f175:	shl    $0x10,%r9
   14012f179:	sar    $0x10,%r9
   14012f17d:	js     14012f550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbae0>
   14012f183:	mov    %rdi,%rcx
   14012f186:	mov    %r10,0x80(%rsp)
   14012f18e:	mov    %r8,0x60(%rsp)
   14012f193:	mov    %r9,0xa0(%rsp)
   14012f19b:	call   140147380 <setun::ArrayObject::size() const>
   14012f1a0:	mov    0xa0(%rsp),%r9
   14012f1a8:	mov    0x60(%rsp),%r8
   14012f1ad:	mov    0x80(%rsp),%r10
   14012f1b5:	cmp    %rax,%r9
   14012f1b8:	jae    14012f550 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbae0>
   14012f1be:	movzbl (%rdi),%eax
   14012f1c1:	cmp    $0x3,%al
   14012f1c3:	je     140135d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122a9>
   14012f1c9:	ja     140135c93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12223>
   14012f1cf:	movabs $0xffff000000000000,%rdx
   14012f1d9:	cmp    $0x1,%al
   14012f1db:	je     140135c4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121db>
   14012f1e1:	cmp    $0x2,%al
   14012f1e3:	jne    140135c19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121a9>
   14012f1e9:	mov    0x340(%rsp),%rax
   14012f1f1:	mov    $0xffff,%edx
   14012f1f6:	mov    $0x1fff,%ecx
   14012f1fb:	shl    $0x30,%rdx
   14012f1ff:	shl    $0x33,%rcx
   14012f203:	and    %rax,%rdx
   14012f206:	cmp    %rcx,%rdx
   14012f209:	je     140137f57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144e7>
   14012f20f:	lea    0x340(%rsp),%r8
   14012f217:	mov    %r9,%rdx
   14012f21a:	mov    %rdi,%rcx
   14012f21d:	call   14014a960 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012f222:	cmpb   $0x0,0x1040(%rbx)
   14012f229:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   14012f22f:	movzbl 0x0(%rbp),%eax
   14012f233:	lea    0x290e66(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f23a:	add    $0x1,%rbp
   14012f23e:	mov    (%rdi,%rax,8),%rax
   14012f242:	jmp    *%rax
   14012f244:	lea    0x460(%rsp),%rax
   14012f24c:	mov    0x40(%rsp),%rdx
   14012f251:	mov    %r8,0xc0(%rsp)
   14012f259:	mov    %rax,%rcx
   14012f25c:	mov    %rax,0x80(%rsp)
   14012f264:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   14012f269:	mov    0xc0(%rsp),%r8
   14012f271:	jmp    140124bd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1162>
   14012f276:	shl    $0x10,%rax
   14012f27a:	shl    $0x10,%rcx
   14012f27e:	movabs $0xfffa000000000000,%rdx
   14012f288:	cmp    %rax,%rcx
   14012f28b:	movabs $0xfffa000000000001,%rax
   14012f295:	cmovl  %rax,%rdx
   14012f299:	mov    %rdx,0x1c8(%rsp)
   14012f2a1:	lea    -0x1(%rbp),%rdx
   14012f2a5:	cmpb   $0x0,0x1520f(%rbx)
   14012f2ac:	je     14012f2db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb86b>
   14012f2ae:	mov    0xe8(%r14),%rax
   14012f2b5:	mov    0xf0(%r14),%rcx
   14012f2bc:	sub    %r15,%rdx
   14012f2bf:	sub    %rax,%rcx
   14012f2c2:	cmp    %rcx,%rdx
   14012f2c5:	jae    14012f2db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb86b>
   14012f2c7:	add    %rdx,%rax
   14012f2ca:	movzbl (%rax),%edi
   14012f2cd:	lea    0x1(%rdi),%edx
   14012f2d0:	mov    %dl,(%rax)
   14012f2d2:	cmp    $0x7,%dl
   14012f2d5:	jbe    14012f2db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb86b>
   14012f2d7:	movb   $0xbf,-0x1(%rbp)
   14012f2db:	cmpb   $0x0,0x1040(%rbx)
   14012f2e2:	je     14012e6d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac65>
   14012f2e8:	movzbl 0x0(%rbp),%eax
   14012f2ec:	lea    0x290dad(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f2f3:	add    $0x1,%rbp
   14012f2f7:	mov    (%rdi,%rax,8),%rax
   14012f2fb:	jmp    *%rax
   14012f2fd:	lea    0x680(%rsp),%rcx
   14012f305:	lea    0x308(%rsp),%rdx
   14012f30d:	vzeroupper
   14012f310:	call   14021c090 <setun::VMValue::as_array() const>
   14012f315:	mov    0x688(%rsp),%rax
   14012f31d:	mov    0x680(%rsp),%rdi
   14012f325:	mov    %rax,0x40(%rsp)
   14012f32a:	test   %rdi,%rdi
   14012f32d:	je     14012f33f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8cf>
   14012f32f:	mov    %rdi,%rcx
   14012f332:	call   140147460 <setun::ArrayObject::empty() const>
   14012f337:	test   %al,%al
   14012f339:	je     140134bae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1113e>
   14012f33f:	test   %r12b,%r12b
   14012f342:	je     1401320a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe631>
   14012f348:	cmp    $0x1,%r12b
   14012f34c:	je     1401355f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b85>
   14012f352:	lea    0x8(%rsi),%r8
   14012f356:	cmp    0x38(%rsp),%r8
   14012f35b:	jae    1401361b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12743>
   14012f361:	mov    0x1d0(%rsp),%rax
   14012f369:	mov    %rax,(%rsi)
   14012f36c:	mov    0x1c8(%rsp),%rax
   14012f374:	mov    %r8,%rsi
   14012f377:	mov    %rax,0x1d0(%rsp)
   14012f37f:	movabs $0xfff8000000000000,%rax
   14012f389:	mov    %rax,0x1c8(%rsp)
   14012f391:	mov    $0x2,%r12d
   14012f397:	mov    0x40(%rsp),%rax
   14012f39c:	test   %rax,%rax
   14012f39f:	je     14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012f3a5:	mov    %rax,%rcx
   14012f3a8:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012f3ad:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   14012f3b2:	mov    %rdx,0x3f8(%rsp)
   14012f3ba:	lea    0x3f8(%rsp),%rcx
   14012f3c2:	vzeroupper
   14012f3c5:	call   14021bef0 <setun::VMValue::payload() const>
   14012f3ca:	mov    0x48(%rax),%rbp
   14012f3ce:	test   %rbp,%rbp
   14012f3d1:	je     140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   14012f3d7:	mov    0x38(%rbp),%rdx
   14012f3db:	test   %rdx,%rdx
   14012f3de:	je     140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   14012f3e4:	mov    0x40(%rsp),%rax
   14012f3e9:	mov    (%rax),%eax
   14012f3eb:	cmp    %eax,(%rdx)
   14012f3ed:	jne    14013598c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f1c>
   14012f3f3:	test   %eax,%eax
   14012f3f5:	je     14013598c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f1c>
   14012f3fb:	mov    0x40(%rsp),%rax
   14012f400:	mov    0x15268(%rbx),%r13
   14012f407:	mov    0x1070(%rbx),%rdx
   14012f40e:	sub    0x1068(%rbx),%rdx
   14012f415:	movzwl 0x8(%rax),%eax
   14012f419:	sar    $0x3,%rdx
   14012f41d:	add    %r13,%rax
   14012f420:	mov    %rax,0x15268(%rbx)
   14012f427:	add    $0x40,%rax
   14012f42b:	cmp    %rdx,%rax
   14012f42e:	jae    1401365e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b74>
   14012f434:	test   %dil,%dil
   14012f437:	jne    1401348b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e41>
   14012f43d:	mov    0x1068(%rbx),%rax
   14012f444:	cmp    $0x1,%r12b
   14012f448:	je     1401365f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b88>
   14012f44e:	cmp    $0x2,%r12b
   14012f452:	je     14013668a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c1a>
   14012f458:	mov    -0x8(%rsi),%rdx
   14012f45c:	sub    $0x8,%rsi
   14012f460:	mov    %rdx,(%rax,%r13,8)
   14012f464:	mov    0x1048(%rbx),%rdx
   14012f46b:	mov    %rsi,%r8
   14012f46e:	mov    0x40(%rsp),%rax
   14012f473:	mov    0x60(%rsp),%r11
   14012f478:	sub    %rdx,%r8
   14012f47b:	mov    0x150c0(%rbx),%rcx
   14012f482:	mov    %r8,%rbp
   14012f485:	movzwl 0x8(%rax),%r10d
   14012f48a:	sub    %r15,%r11
   14012f48d:	mov    0x4(%rax),%eax
   14012f490:	sar    $0x3,%rbp
   14012f494:	cmp    $0x7ff,%rcx
   14012f49b:	ja     140138c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151de>
   14012f4a1:	lea    0x1(%rcx),%r9
   14012f4a5:	lea    (%rcx,%rcx,4),%rcx
   14012f4a9:	mov    0x152a0(%rbx),%rdi
   14012f4b0:	mov    %r9,0x150c0(%rbx)
   14012f4b7:	mov    %r11,0x10c0(%rbx,%rcx,8)
   14012f4bf:	mov    %r13,0x10c8(%rbx,%rcx,8)
   14012f4c7:	mov    %rbp,0x10d0(%rbx,%rcx,8)
   14012f4cf:	mov    %r10,0x10d8(%rbx,%rcx,8)
   14012f4d7:	mov    %rax,0x10e0(%rbx,%rcx,8)
   14012f4df:	mov    0x15270(%rbx),%rcx
   14012f4e6:	cmp    %rdi,0x68(%rcx)
   14012f4ea:	jae    140136648 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bd8>
   14012f4f0:	add    %r15,%rax
   14012f4f3:	cmpb   $0x0,0x1040(%rbx)
   14012f4fa:	je     140136640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bd0>
   14012f500:	lea    0x1(%rax),%rbp
   14012f504:	movzbl (%rax),%eax
   14012f507:	lea    0x290b92(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f50e:	jmp    *(%rdi,%rax,8)
   14012f511:	mov    0x1070(%rbx),%rax
   14012f518:	sub    0x1068(%rbx),%rax
   14012f51f:	mov    %rcx,%rdx
   14012f522:	lea    0x1068(%rbx),%rcx
   14012f529:	sar    $0x3,%rax
   14012f52d:	mov    %rax,0xa0(%rsp)
   14012f535:	add    %rax,%rdx
   14012f538:	vzeroupper
   14012f53b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f540:	jmp    140126425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b5>
   14012f545:	lea    0x350(%rsp),%r10
   14012f54d:	vzeroupper
   14012f550:	mov    %r10,%rcx
   14012f553:	mov    %r8,0x350(%rsp)
   14012f55b:	call   14021bef0 <setun::VMValue::payload() const>
   14012f560:	mov    0x58(%rax),%rdi
   14012f564:	test   %rdi,%rdi
   14012f567:	je     140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012f56d:	lea    0x348(%rsp),%rcx
   14012f575:	call   14021aa80 <setun::VMValue::as_int() const>
   14012f57a:	mov    %rax,%rdx
   14012f57d:	test   %rax,%rax
   14012f580:	js     1401352b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11847>
   14012f586:	mov    %rdi,%rcx
   14012f589:	mov    %rdx,0x40(%rsp)
   14012f58e:	call   140147380 <setun::ArrayObject::size() const>
   14012f593:	mov    0x40(%rsp),%rdx
   14012f598:	cmp    %rax,%rdx
   14012f59b:	jae    140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012f5a1:	lea    0x340(%rsp),%r8
   14012f5a9:	mov    %rdi,%rcx
   14012f5ac:	call   14014a960 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012f5b1:	jmp    140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   14012f5b6:	cmp    $0x1,%r12b
   14012f5ba:	je     1401324be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea4e>
   14012f5c0:	mov    -0x8(%rsi),%rax
   14012f5c4:	mov    $0x1,%r12d
   14012f5ca:	sub    $0x10,%rsi
   14012f5ce:	mov    %rax,0x3a0(%rsp)
   14012f5d6:	mov    (%rsi),%rax
   14012f5d9:	mov    %rax,0x398(%rsp)
   14012f5e1:	jmp    1401285d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b66>
   14012f5e6:	mov    0x1070(%rbx),%rdx
   14012f5ed:	lea    0x8(%rdi),%rax
   14012f5f1:	lea    0x48(%rdi),%rcx
   14012f5f5:	sub    0x1068(%rbx),%rdx
   14012f5fc:	sar    $0x3,%rdx
   14012f600:	mov    %rax,0x15268(%rbx)
   14012f607:	mov    %rdx,%rax
   14012f60a:	cmp    %rdx,%rcx
   14012f60d:	jb     140127764 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cf4>
   14012f613:	mov    %r8,0x40(%rsp)
   14012f618:	add    %rdx,%rdx
   14012f61b:	lea    0x1068(%rbx),%rcx
   14012f622:	vzeroupper
   14012f625:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f62a:	mov    0x40(%rsp),%r8
   14012f62f:	jmp    140127752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ce2>
   14012f634:	mov    %rax,%rbp
   14012f637:	jmp    14012a466 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f6>
   14012f63c:	lea    0x8(%rdi),%rdx
   14012f640:	lea    0x48(%rdi),%r9
   14012f644:	mov    %rdx,0x15268(%rbx)
   14012f64b:	mov    0x1070(%rbx),%rdx
   14012f652:	sub    0x1068(%rbx),%rdx
   14012f659:	sar    $0x3,%rdx
   14012f65d:	mov    %rdx,%rcx
   14012f660:	cmp    %rdx,%r9
   14012f663:	jb     140127c0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x419f>
   14012f669:	mov    %r10d,0x60(%rsp)
   14012f66e:	add    %rdx,%rdx
   14012f671:	lea    0x1068(%rbx),%rcx
   14012f678:	mov    %eax,0x80(%rsp)
   14012f67f:	vzeroupper
   14012f682:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f687:	mov    0x80(%rsp),%eax
   14012f68e:	mov    0x60(%rsp),%r10d
   14012f693:	jmp    140127bfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x418d>
   14012f698:	nopl   0x0(%rax,%rax,1)
   14012f6a0:	lea    0x8(%rax),%rdx
   14012f6a4:	lea    0x48(%rax),%rcx
   14012f6a8:	mov    %rdx,0x15268(%rbx)
   14012f6af:	mov    0x1070(%rbx),%rdx
   14012f6b6:	sub    0x1068(%rbx),%rdx
   14012f6bd:	sar    $0x3,%rdx
   14012f6c1:	cmp    %rdx,%rcx
   14012f6c4:	jb     140127f15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44a5>
   14012f6ca:	mov    %rax,0x60(%rsp)
   14012f6cf:	add    %rdx,%rdx
   14012f6d2:	lea    0x1068(%rbx),%rcx
   14012f6d9:	mov    %r9,0x40(%rsp)
   14012f6de:	vzeroupper
   14012f6e1:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f6e6:	mov    0x60(%rsp),%rax
   14012f6eb:	mov    0x40(%rsp),%r9
   14012f6f0:	jmp    140127f15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44a5>
   14012f6f5:	nopl   (%rax)
   14012f6f8:	cmp    $0x2,%r12b
   14012f6fc:	je     140132dee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf37e>
   14012f702:	mov    -0x8(%rsi),%rdx
   14012f706:	sub    $0x8,%rsi
   14012f70a:	mov    %rdx,0x18(%rax,%r13,8)
   14012f70f:	jmp    140127e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x439b>
   14012f714:	cmp    $0x2,%r12b
   14012f718:	je     140132b99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf129>
   14012f71e:	mov    -0x8(%rsi),%rdx
   14012f722:	sub    $0x8,%rsi
   14012f726:	mov    %rdx,0x10(%rax,%r13,8)
   14012f72b:	jmp    140127dc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4358>
   14012f730:	mov    %rax,0x40(%rsp)
   14012f735:	lea    0x20(%rax),%rdx
   14012f739:	lea    0x1068(%rbx),%rcx
   14012f740:	vzeroupper
   14012f743:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f748:	mov    0x40(%rsp),%rax
   14012f74d:	jmp    140124fec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x157c>
   14012f752:	cmp    $0x1,%r12b
   14012f756:	je     14013263c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebcc>
   14012f75c:	mov    -0x8(%rsi),%rax
   14012f760:	mov    $0x1,%r12d
   14012f766:	sub    $0x10,%rsi
   14012f76a:	mov    %rax,0x280(%rsp)
   14012f772:	mov    (%rsi),%rax
   14012f775:	mov    %rax,0x278(%rsp)
   14012f77d:	jmp    140125860 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1df0>
   14012f782:	lea    0x20(%rdi),%rdx
   14012f786:	lea    0x1068(%rbx),%rcx
   14012f78d:	mov    %eax,0x60(%rsp)
   14012f791:	mov    %r8d,0x80(%rsp)
   14012f799:	mov    %r9d,0x40(%rsp)
   14012f79e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f7a3:	mov    0x60(%rsp),%eax
   14012f7a7:	mov    0x40(%rsp),%r9d
   14012f7ac:	mov    0x80(%rsp),%r8d
   14012f7b4:	jmp    14012482d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbd>
   14012f7b9:	cmp    $0x1,%r12b
   14012f7bd:	je     140132cc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf258>
   14012f7c3:	mov    -0x8(%rsi),%rax
   14012f7c7:	sub    $0x10,%rsi
   14012f7cb:	mov    %rax,0x338(%rsp)
   14012f7d3:	mov    (%rsi),%rax
   14012f7d6:	mov    %rax,0x330(%rsp)
   14012f7de:	jmp    140127fe4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4574>
   14012f7e3:	cmp    $0x1,%r12b
   14012f7e7:	je     14013309d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf62d>
   14012f7ed:	mov    -0x8(%rsi),%rax
   14012f7f1:	mov    $0x1,%r12d
   14012f7f7:	sub    $0x10,%rsi
   14012f7fb:	mov    %rax,0x250(%rsp)
   14012f803:	mov    (%rsi),%rax
   14012f806:	mov    %rax,0x248(%rsp)
   14012f80e:	jmp    140125674 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c04>
   14012f813:	mov    %r9d,0x60(%rsp)
   14012f818:	lea    0x20(%rdi),%rdx
   14012f81c:	lea    0x1068(%rbx),%rcx
   14012f823:	mov    %r10d,0x80(%rsp)
   14012f82b:	vzeroupper
   14012f82e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f833:	mov    0x80(%rsp),%r10d
   14012f83b:	mov    0x60(%rsp),%r9d
   14012f840:	jmp    14012785d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ded>
   14012f845:	cmp    $0x1,%r12b
   14012f849:	je     140132bc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf151>
   14012f84f:	mov    -0x8(%rsi),%rax
   14012f853:	mov    $0x1,%r12d
   14012f859:	sub    $0x10,%rsi
   14012f85d:	mov    %rax,0x270(%rsp)
   14012f865:	mov    (%rsi),%rax
   14012f868:	mov    %rax,0x268(%rsp)
   14012f870:	jmp    14012578c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d1c>
   14012f875:	cmp    $0x1,%r12b
   14012f879:	je     14013319d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf72d>
   14012f87f:	mov    -0x8(%rsi),%rax
   14012f883:	mov    $0x1,%r12d
   14012f889:	sub    $0x10,%rsi
   14012f88d:	mov    %rax,0x260(%rsp)
   14012f895:	mov    (%rsi),%rax
   14012f898:	mov    %rax,0x258(%rsp)
   14012f8a0:	jmp    140125700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c90>
   14012f8a5:	mov    %rax,0x60(%rsp)
   14012f8aa:	add    %rdx,%rdx
   14012f8ad:	lea    0x1068(%rbx),%rcx
   14012f8b4:	mov    %r11d,0x80(%rsp)
   14012f8bc:	mov    %r8,0x40(%rsp)
   14012f8c1:	vzeroupper
   14012f8c4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f8c9:	mov    0x80(%rsp),%r11d
   14012f8d1:	mov    0x60(%rsp),%rax
   14012f8d6:	mov    0x40(%rsp),%r8
   14012f8db:	jmp    1401267e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d72>
   14012f8e0:	cmp    $0x1,%r12b
   14012f8e4:	je     1401324e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea72>
   14012f8ea:	mov    -0x8(%rsi),%rax
   14012f8ee:	mov    $0x1,%r12d
   14012f8f4:	sub    $0x10,%rsi
   14012f8f8:	mov    %rax,0x230(%rsp)
   14012f900:	mov    (%rsi),%rax
   14012f903:	mov    %rax,0x228(%rsp)
   14012f90b:	jmp    14012555c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aec>
   14012f910:	cmp    $0x1,%r12b
   14012f914:	je     140132cef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf27f>
   14012f91a:	mov    -0x8(%rsi),%rax
   14012f91e:	mov    $0x1,%r12d
   14012f924:	sub    $0x10,%rsi
   14012f928:	mov    %rax,0x220(%rsp)
   14012f930:	mov    (%rsi),%rax
   14012f933:	mov    %rax,0x218(%rsp)
   14012f93b:	jmp    1401254d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a60>
   14012f940:	cmp    $0x1,%r12b
   14012f944:	je     140132319 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8a9>
   14012f94a:	mov    -0x8(%rsi),%rax
   14012f94e:	mov    $0x1,%r12d
   14012f954:	sub    $0x10,%rsi
   14012f958:	mov    %rax,0x240(%rsp)
   14012f960:	mov    (%rsi),%rax
   14012f963:	mov    %rax,0x238(%rsp)
   14012f96b:	jmp    1401255e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b78>
   14012f970:	cmp    $0x2,%r12b
   14012f974:	je     140132485 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea15>
   14012f97a:	cmp    $0x1,%r12b
   14012f97e:	jne    140138502 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a92>
   14012f984:	mov    0x1048(%rbx),%rdx
   14012f98b:	mov    0x1050(%rbx),%rax
   14012f992:	lea    0x8(%rsi),%r8
   14012f996:	cmp    0x38(%rsp),%r8
   14012f99b:	jae    140137cfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1428a>
   14012f9a1:	mov    0x1c8(%rsp),%rcx
   14012f9a9:	mov    %rcx,(%rsi)
   14012f9ac:	sub    %rdx,%r8
   14012f9af:	sub    %r15,%rdi
   14012f9b2:	sub    %rdx,%rax
   14012f9b5:	mov    %r8,%rsi
   14012f9b8:	mov    %rdi,0x1038(%rbx)
   14012f9bf:	sar    $0x3,%rsi
   14012f9c3:	cmp    %r8,%rax
   14012f9c6:	jae    14012f9d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf68>
   14012f9c8:	lea    (%rsi,%rsi,1),%rdx
   14012f9cc:	lea    0x1048(%rbx),%rcx
   14012f9d3:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f9d8:	vmovdqa 0x22d100(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   14012f9e0:	mov    %rsi,0x1060(%rbx)
   14012f9e7:	movb   $0x0,0x153a0(%rbx)
   14012f9ee:	vmovdqa %xmm0,0x15390(%rbx)
   14012f9f6:	call   14033eae0 <setun::cold_throw_range_step_zero()>
   14012f9fb:	nopl   0x0(%rax,%rax,1)
   14012fa00:	mov    %rdi,%rbp
   14012fa03:	jmp    14012a4c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a50>
   14012fa08:	mov    0x1070(%rbx),%rdx
   14012fa0f:	lea    0x8(%rdi),%rax
   14012fa13:	lea    0x48(%rdi),%rcx
   14012fa17:	sub    0x1068(%rbx),%rdx
   14012fa1e:	sar    $0x3,%rdx
   14012fa22:	mov    %rax,0x15268(%rbx)
   14012fa29:	mov    %rdx,%rax
   14012fa2c:	cmp    %rdx,%rcx
   14012fa2f:	jb     14012508b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x161b>
   14012fa35:	mov    %r8,0x40(%rsp)
   14012fa3a:	add    %rdx,%rdx
   14012fa3d:	lea    0x1068(%rbx),%rcx
   14012fa44:	vzeroupper
   14012fa47:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fa4c:	mov    0x40(%rsp),%r8
   14012fa51:	jmp    140125079 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1609>
   14012fa56:	cs nopw 0x0(%rax,%rax,1)
   14012fa60:	lea    0x8(%rdi),%rdx
   14012fa64:	lea    0x48(%rdi),%r10
   14012fa68:	mov    %rdx,0x15268(%rbx)
   14012fa6f:	mov    0x1070(%rbx),%rdx
   14012fa76:	sub    0x1068(%rbx),%rdx
   14012fa7d:	sar    $0x3,%rdx
   14012fa81:	mov    %rdx,%rcx
   14012fa84:	cmp    %rdx,%r10
   14012fa87:	jae    14013496e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10efe>
   14012fa8d:	vzeroupper
   14012fa90:	jmp    140124824 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb4>
   14012fa95:	cmp    $0x1,%r12b
   14012fa99:	je     140133526 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfab6>
   14012fa9f:	mov    -0x8(%rsi),%rax
   14012faa3:	mov    $0x1,%r12d
   14012faa9:	sub    $0x10,%rsi
   14012faad:	mov    %rax,0x2a0(%rsp)
   14012fab5:	mov    (%rsi),%rax
   14012fab8:	mov    %rax,0x298(%rsp)
   14012fac0:	mov    %rax,%rcx
   14012fac3:	jmp    140125aa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2035>
   14012fac8:	movabs $0xffffffff00000000,%rax
   14012fad2:	movabs $0xfffd000100000000,%rdx
   14012fadc:	and    %r9,%rax
   14012fadf:	cmp    %rdx,%rax
   14012fae2:	jne    14012cad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9062>
   14012fae8:	movabs $0xffff000000000000,%rdx
   14012faf2:	movb   $0xcd,-0x1(%rbp)
   14012faf6:	mov    (%r11),%rax
   14012faf9:	movabs $0xfffd000000000000,%rcx
   14012fb03:	and    %rax,%rdx
   14012fb06:	cmp    %rcx,%rdx
   14012fb09:	je     140132703 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec93>
   14012fb0f:	movabs $0xfff8000000000000,%rax
   14012fb19:	cmp    %rax,%rdx
   14012fb1c:	je     14013271b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecab>
   14012fb22:	mov    %r11,%rcx
   14012fb25:	vzeroupper
   14012fb28:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012fb2d:	vcvttsd2si %xmm0,%rax
   14012fb32:	mov    %rax,0x500(%rsp)
   14012fb3a:	lea    0x500(%rsp),%rax
   14012fb42:	movq   $0x0,0x508(%rsp)
   14012fb4e:	movq   $0x0,0x510(%rsp)
   14012fb5a:	mov    %rax,0x80(%rsp)
   14012fb62:	movabs $0xffff000000000000,%rdx
   14012fb6c:	mov    0x60(%rsp),%rax
   14012fb71:	movabs $0xfffd000000000000,%rcx
   14012fb7b:	mov    (%rax),%rax
   14012fb7e:	and    %rax,%rdx
   14012fb81:	cmp    %rcx,%rdx
   14012fb84:	je     1401326b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec44>
   14012fb8a:	movabs $0xfff8000000000000,%rax
   14012fb94:	cmp    %rax,%rdx
   14012fb97:	je     1401326cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec5c>
   14012fb9d:	mov    0x60(%rsp),%rcx
   14012fba2:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012fba7:	lea    0x520(%rsp),%r8
   14012fbaf:	movq   $0x0,0x528(%rsp)
   14012fbbb:	vcvttsd2si %xmm0,%rax
   14012fbc0:	movq   $0x0,0x530(%rsp)
   14012fbcc:	mov    %rax,0x520(%rsp)
   14012fbd4:	movabs $0xffff000000000000,%rdx
   14012fbde:	mov    0x40(%rsp),%rax
   14012fbe3:	movabs $0xfffd000000000000,%rcx
   14012fbed:	mov    (%rax),%rax
   14012fbf0:	and    %rax,%rdx
   14012fbf3:	cmp    %rcx,%rdx
   14012fbf6:	je     14013272b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecbb>
   14012fbfc:	movabs $0xfff8000000000000,%rax
   14012fc06:	cmp    %rax,%rdx
   14012fc09:	je     140132743 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecd3>
   14012fc0f:	mov    0x40(%rsp),%rcx
   14012fc14:	mov    %r8,0x60(%rsp)
   14012fc19:	call   14021c1d0 <setun::VMValue::as_float() const>
   14012fc1e:	vcvttsd2si %xmm0,%rax
   14012fc23:	mov    0x60(%rsp),%r8
   14012fc28:	mov    %rax,0x540(%rsp)
   14012fc30:	lea    0x540(%rsp),%rax
   14012fc38:	movq   $0x0,0x548(%rsp)
   14012fc44:	movq   $0x0,0x550(%rsp)
   14012fc50:	mov    %rax,0x60(%rsp)
   14012fc55:	mov    0x80(%rsp),%rdx
   14012fc5d:	lea    0x680(%rsp),%rax
   14012fc65:	mov    %rax,%rcx
   14012fc68:	mov    %rax,0x40(%rsp)
   14012fc6d:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012fc72:	mov    0x40(%rsp),%r8
   14012fc77:	mov    0x60(%rsp),%rdx
   14012fc7c:	lea    0x4a0(%rsp),%rcx
   14012fc84:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012fc89:	mov    0x4b0(%rsp),%rax
   14012fc91:	vmovdqa 0x4a0(%rsp),%xmm7
   14012fc9a:	lea    0x1a0(%rsp),%rdx
   14012fca2:	mov    0x40(%rsp),%rcx
   14012fca7:	mov    %rax,0x1b0(%rsp)
   14012fcaf:	vmovdqa %xmm7,0x1a0(%rsp)
   14012fcb8:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012fcbd:	mov    0x1068(%rbx),%rax
   14012fcc4:	mov    0x680(%rsp),%rdx
   14012fccc:	mov    %rdx,(%rax,%rdi,8)
   14012fcd0:	jmp    14012cb90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9120>
   14012fcd5:	cmp    $0x1,%r12b
   14012fcd9:	je     14013314a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6da>
   14012fcdf:	mov    -0x8(%rsi),%rax
   14012fce3:	mov    $0x1,%r12d
   14012fce9:	sub    $0x10,%rsi
   14012fced:	mov    %rax,0x2f0(%rsp)
   14012fcf5:	mov    (%rsi),%rax
   14012fcf8:	mov    %rax,0x2e8(%rsp)
   14012fd00:	mov    %rax,%rcx
   14012fd03:	jmp    140126092 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2622>
   14012fd08:	mov    %r9,0x60(%rsp)
   14012fd0d:	lea    0x1d0(%rsp),%rcx
   14012fd15:	vzeroupper
   14012fd18:	call   14021bef0 <setun::VMValue::payload() const>
   14012fd1d:	mov    0x60(%rsp),%r9
   14012fd22:	mov    0x48(%rax),%rax
   14012fd26:	test   %rax,%rax
   14012fd29:	je     14012c82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dbd>
   14012fd2f:	mov    0x38(%rax),%rcx
   14012fd33:	test   %rcx,%rcx
   14012fd36:	je     14012c82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dbd>
   14012fd3c:	mov    (%r9),%edx
   14012fd3f:	cmp    %edx,(%rcx)
   14012fd41:	jne    14012c82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dbd>
   14012fd47:	test   %edx,%edx
   14012fd49:	je     14012c82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dbd>
   14012fd4f:	mov    0x48(%rax),%rdx
   14012fd53:	mov    0x50(%rax),%rax
   14012fd57:	movzwl 0x4(%r9),%ecx
   14012fd5c:	sub    %rdx,%rax
   14012fd5f:	sar    $0x3,%rax
   14012fd63:	cmp    %rax,%rcx
   14012fd66:	jae    14012c82d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dbd>
   14012fd6c:	mov    0x1c8(%rsp),%rax
   14012fd74:	mov    %rax,(%rdx,%rcx,8)
   14012fd78:	cmpb   $0x0,0x1040(%rbx)
   14012fd7f:	je     140136235 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127c5>
   14012fd85:	movzbl 0x2(%rbp),%eax
   14012fd89:	lea    0x290310(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fd90:	add    $0x3,%rbp
   14012fd94:	xor    %r12d,%r12d
   14012fd97:	mov    (%rdi,%rax,8),%rax
   14012fd9b:	jmp    *%rax
   14012fd9d:	lea    0x8(%rdi),%rdx
   14012fda1:	lea    0x48(%rdi),%r8
   14012fda5:	mov    %rdx,0x15268(%rbx)
   14012fdac:	mov    0x1070(%rbx),%rdx
   14012fdb3:	sub    0x1068(%rbx),%rdx
   14012fdba:	sar    $0x3,%rdx
   14012fdbe:	mov    %rdx,%rcx
   14012fdc1:	cmp    %rdx,%r8
   14012fdc4:	jb     140127919 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ea9>
   14012fdca:	mov    %r9d,0x60(%rsp)
   14012fdcf:	add    %rdx,%rdx
   14012fdd2:	lea    0x1068(%rbx),%rcx
   14012fdd9:	mov    %r10d,0x80(%rsp)
   14012fde1:	mov    %eax,0x40(%rsp)
   14012fde5:	vzeroupper
   14012fde8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fded:	mov    0x80(%rsp),%r10d
   14012fdf5:	mov    0x40(%rsp),%eax
   14012fdf9:	mov    0x60(%rsp),%r9d
   14012fdfe:	jmp    140127907 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e97>
   14012fe03:	nopl   0x0(%rax,%rax,1)
   14012fe08:	mov    0x1070(%rbx),%rdx
   14012fe0f:	lea    0x8(%rdi),%rax
   14012fe13:	lea    0x48(%rdi),%rcx
   14012fe17:	sub    0x1068(%rbx),%rdx
   14012fe1e:	sar    $0x3,%rdx
   14012fe22:	mov    %rax,0x15268(%rbx)
   14012fe29:	mov    %rdx,%rax
   14012fe2c:	cmp    %rdx,%rcx
   14012fe2f:	jb     140127854 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3de4>
   14012fe35:	mov    %r9d,0x60(%rsp)
   14012fe3a:	add    %rdx,%rdx
   14012fe3d:	lea    0x1068(%rbx),%rcx
   14012fe44:	mov    %r10d,0x80(%rsp)
   14012fe4c:	vzeroupper
   14012fe4f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fe54:	mov    0x80(%rsp),%r10d
   14012fe5c:	mov    0x60(%rsp),%r9d
   14012fe61:	jmp    140127842 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dd2>
   14012fe66:	cs nopw 0x0(%rax,%rax,1)
   14012fe70:	mov    %r9d,0x60(%rsp)
   14012fe75:	lea    0x20(%rdi),%rdx
   14012fe79:	lea    0x1068(%rbx),%rcx
   14012fe80:	mov    %r10d,0x80(%rsp)
   14012fe88:	mov    %eax,0x40(%rsp)
   14012fe8c:	vzeroupper
   14012fe8f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012fe94:	mov    0x80(%rsp),%r10d
   14012fe9c:	mov    0x40(%rsp),%eax
   14012fea0:	mov    0x60(%rsp),%r9d
   14012fea5:	jmp    140127922 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3eb2>
   14012feaa:	cmp    $0x1,%r12b
   14012feae:	je     140132f7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf50f>
   14012feb4:	mov    -0x8(%rsi),%rax
   14012feb8:	mov    $0x1,%r12d
   14012febe:	sub    $0x10,%rsi
   14012fec2:	mov    %rax,0x360(%rsp)
   14012feca:	mov    (%rsi),%rax
   14012fecd:	mov    %rax,0x358(%rsp)
   14012fed5:	jmp    140128245 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47d5>
   14012feda:	test   %r12b,%r12b
   14012fedd:	je     14012d6af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c3f>
   14012fee3:	cmp    $0x1,%r12b
   14012fee7:	jne    14012ef63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4f3>
   14012feed:	mov    0x1c8(%rsp),%rax
   14012fef5:	mov    %rax,0x1d0(%rsp)
   14012fefd:	movabs $0xfff8000000000000,%rax
   14012ff07:	mov    %rax,0x1c8(%rsp)
   14012ff0f:	jmp    140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   14012ff14:	cmp    $0x2,%r12b
   14012ff18:	je     140132f64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4f4>
   14012ff1e:	sub    $0x8,%rsi
   14012ff22:	jmp    140124f42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2>
   14012ff27:	mov    %r9,0x80(%rsp)
   14012ff2f:	lea    0x3e0(%rsp),%rcx
   14012ff37:	vzeroupper
   14012ff3a:	call   14021bef0 <setun::VMValue::payload() const>
   14012ff3f:	mov    0x80(%rsp),%r9
   14012ff47:	lea    0x22bb78(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   14012ff4e:	mov    %rax,0x40(%rsp)
   14012ff53:	movzwl 0x6(%r9),%edi
   14012ff58:	shl    $0x5,%rdi
   14012ff5c:	add    0x30(%r14),%rdi
   14012ff60:	mov    %rdi,%rcx
   14012ff63:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012ff68:	test   %al,%al
   14012ff6a:	jne    14012ff83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc513>
   14012ff6c:	lea    0x22bb57(%rip),%rdx        # 14035baca <.rdata+0x50a>
   14012ff73:	mov    %rdi,%rcx
   14012ff76:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012ff7b:	test   %al,%al
   14012ff7d:	je     14012e66f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabff>
   14012ff83:	mov    0x40(%rsp),%rax
   14012ff88:	mov    0x58(%rax),%rdi
   14012ff8c:	test   %r12b,%r12b
   14012ff8f:	jne    1401327c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed50>
   14012ff95:	xor    %edx,%edx
   14012ff97:	test   %rdi,%rdi
   14012ff9a:	je     14012ffa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc537>
   14012ff9c:	mov    %rdi,%rcx
   14012ff9f:	call   140147380 <setun::ArrayObject::size() const>
   14012ffa4:	mov    %rax,%rdx
   14012ffa7:	lea    0x680(%rsp),%rcx
   14012ffaf:	mov    $0x1,%r12d
   14012ffb5:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14012ffba:	mov    0x680(%rsp),%rax
   14012ffc2:	mov    %rax,0x1c8(%rsp)
   14012ffca:	cmpb   $0x0,0x1040(%rbx)
   14012ffd1:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   14012ffd7:	movzbl 0x2(%rbp),%eax
   14012ffdb:	lea    0x2900be(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ffe2:	add    $0x3,%rbp
   14012ffe6:	mov    (%rdi,%rax,8),%rax
   14012ffea:	jmp    *%rax
   14012ffec:	mov    0x1050(%rbx),%rax
   14012fff3:	sub    %rdx,%rax
   14012fff6:	cmp    %r10,%rax
   14012fff9:	jb     14013329c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf82c>
   14012ffff:	mov    %rdi,0x1060(%rbx)
   140130006:	cmp    %r8,0x68(%rcx)
   14013000a:	jae    14013405b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105eb>
   140130010:	mov    0x1060(%rbx),%rax
   140130017:	mov    0x1048(%rbx),%rdx
   14013001e:	lea    (%rdx,%rax,8),%rsi
   140130022:	jmp    140126887 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e17>
   140130027:	mov    %r8,0x40(%rsp)
   14013002c:	lea    0x20(%rdi),%rdx
   140130030:	lea    0x1080(%rbx),%rcx
   140130037:	vzeroupper
   14013003a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013003f:	mov    0x40(%rsp),%r8
   140130044:	jmp    140125192 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1722>
   140130049:	mov    %rax,0x40(%rsp)
   14013004e:	lea    0x20(%rax),%rdx
   140130052:	lea    0x1080(%rbx),%rcx
   140130059:	vzeroupper
   14013005c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130061:	mov    0x40(%rsp),%rax
   140130066:	jmp    1401250fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x168a>
   14013006b:	cmp    $0x1,%r12b
   14013006f:	je     14012c545 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ad5>
   140130075:	mov    -0x8(%rsi),%rax
   140130079:	lea    -0x10(%rsi),%rdx
   14013007d:	movabs $0xffff000000000000,%rcx
   140130087:	movabs $0xfffd000000000000,%r8
   140130091:	mov    %rax,0x310(%rsp)
   140130099:	mov    -0x10(%rsi),%rax
   14013009d:	mov    %rdx,%rsi
   1401300a0:	and    %rax,%rcx
   1401300a3:	mov    %rax,0x308(%rsp)
   1401300ab:	cmp    %r8,%rcx
   1401300ae:	je     14012c587 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b17>
   1401300b4:	test   %r12b,%r12b
   1401300b7:	jne    14012d924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9eb4>
   1401300bd:	jmp    14012a12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   1401300c2:	nopw   0x0(%rax,%rax,1)
   1401300c8:	cmp    $0x2,%r12b
   1401300cc:	je     1401331c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf751>
   1401300d2:	mov    -0x8(%rsi),%rax
   1401300d6:	sub    $0x8,%rsi
   1401300da:	mov    %rax,0x300(%rsp)
   1401300e2:	jmp    14012626e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27fe>
   1401300e7:	cmp    $0x2,%r12b
   1401300eb:	je     140133372 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf902>
   1401300f1:	mov    -0x8(%rsi),%rdx
   1401300f5:	sub    $0x8,%rsi
   1401300f9:	mov    %rdx,0x8(%rax,%r13,8)
   1401300fe:	jmp    140127d85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4315>
   140130103:	cmp    $0x1,%r12b
   140130107:	je     14013367c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc0c>
   14013010d:	mov    -0x8(%rsi),%rax
   140130111:	mov    -0x10(%rsi),%rdi
   140130115:	sub    $0x10,%rsi
   140130119:	mov    %rax,0x3f0(%rsp)
   140130121:	jmp    14012c840 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dd0>
   140130126:	mov    %rcx,%rbp
   140130129:	vzeroupper
   14013012c:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140130131:	cmp    $0x1,%r12b
   140130135:	je     140132e16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3a6>
   14013013b:	mov    -0x8(%rsi),%rax
   14013013f:	mov    $0x1,%r12d
   140130145:	sub    $0x10,%rsi
   140130149:	mov    %rax,0x290(%rsp)
   140130151:	mov    (%rsi),%rax
   140130154:	mov    %rax,0x288(%rsp)
   14013015c:	jmp    140125981 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f11>
   140130161:	mov    0x1048(%rbx),%rdx
   140130168:	mov    %rax,%rbp
   14013016b:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140130170:	mov    0x1048(%rbx),%rdx
   140130177:	mov    %rdi,%rbp
   14013017a:	vzeroupper
   14013017d:	jmp    14012466c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   140130182:	cmp    $0x1,%r12b
   140130186:	je     140132e3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3ca>
   14013018c:	lea    0x10(%rsi),%r8
   140130190:	cmp    0x38(%rsp),%r8
   140130195:	jae    140136358 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128e8>
   14013019b:	mov    0x1d0(%rsp),%rdx
   1401301a3:	mov    %rdx,(%rsi)
   1401301a6:	mov    0x1c8(%rsp),%rdx
   1401301ae:	mov    %rdx,0x8(%rsi)
   1401301b2:	mov    %r8,%rsi
   1401301b5:	jmp    1401277cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d5c>
   1401301ba:	cmp    $0x2,%r12b
   1401301be:	je     140132244 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7d4>
   1401301c4:	mov    -0x8(%rsi),%rdx
   1401301c8:	sub    $0x8,%rsi
   1401301cc:	mov    %rdx,(%rax,%rdi,8)
   1401301d0:	jmp    14012778d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d1d>
   1401301d5:	mov    %r8,0x40(%rsp)
   1401301da:	lea    0x20(%rdi),%rdx
   1401301de:	lea    0x1068(%rbx),%rcx
   1401301e5:	vzeroupper
   1401301e8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401301ed:	mov    0x40(%rsp),%r8
   1401301f2:	jmp    14012776d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cfd>
   1401301f7:	cmp    $0x1,%r12b
   1401301fb:	je     140132fa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf533>
   140130201:	mov    -0x8(%rsi),%rax
   140130205:	mov    $0x1,%r12d
   14013020b:	sub    $0x10,%rsi
   14013020f:	mov    %rax,0x2d0(%rsp)
   140130217:	mov    (%rsi),%rax
   14013021a:	mov    %rax,0x2c8(%rsp)
   140130222:	mov    %rax,%rcx
   140130225:	jmp    140125e34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23c4>
   14013022a:	cmp    $0x1,%r12b
   14013022e:	je     14013369c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc2c>
   140130234:	mov    -0x8(%rsi),%rax
   140130238:	mov    $0x1,%r12d
   14013023e:	sub    $0x10,%rsi
   140130242:	mov    %rax,0x2b0(%rsp)
   14013024a:	mov    (%rsi),%rax
   14013024d:	mov    %rax,0x2a8(%rsp)
   140130255:	mov    %rax,%rdx
   140130258:	jmp    140125bd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2166>
   14013025d:	cmp    $0x1,%r12b
   140130261:	je     140132b46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0d6>
   140130267:	mov    -0x8(%rsi),%rax
   14013026b:	mov    $0x1,%r12d
   140130271:	sub    $0x10,%rsi
   140130275:	mov    %rax,0x1e0(%rsp)
   14013027d:	mov    (%rsi),%rax
   140130280:	mov    %rax,0x1d8(%rsp)
   140130288:	jmp    14012521f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17af>
   14013028d:	mov    0x1c8(%rsp),%rax
   140130295:	mov    $0x2,%r12d
   14013029b:	mov    %rax,0x1d0(%rsp)
   1401302a3:	movabs $0xfff8000000000000,%rax
   1401302ad:	mov    %rax,0x1c8(%rsp)
   1401302b5:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   1401302ba:	cmp    $0x1,%r12b
   1401302be:	je     1401321f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe781>
   1401302c4:	mov    -0x8(%rsi),%rax
   1401302c8:	mov    $0x1,%r12d
   1401302ce:	sub    $0x10,%rsi
   1401302d2:	mov    %rax,0x2e0(%rsp)
   1401302da:	mov    (%rsi),%rax
   1401302dd:	mov    %rax,0x2d8(%rsp)
   1401302e5:	mov    %rax,%rcx
   1401302e8:	jmp    140125f63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24f3>
   1401302ed:	cmp    $0x2,%r12b
   1401302f1:	je     140132fee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf57e>
   1401302f7:	mov    -0x8(%rsi),%rdx
   1401302fb:	lea    -0x8(%rsi),%rax
   1401302ff:	mov    %rax,%rsi
   140130302:	mov    %rdx,0x340(%rsp)
   14013030a:	cmp    $0x1,%r12b
   14013030e:	jne    1401280e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4672>
   140130314:	mov    0x1c8(%rsp),%rdx
   14013031c:	lea    -0x8(%rax),%rsi
   140130320:	xor    %r12d,%r12d
   140130323:	mov    %rdx,0x348(%rsp)
   14013032b:	mov    -0x8(%rax),%r8
   14013032f:	jmp    1401280f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4685>
   140130334:	cmp    $0x1,%r12b
   140130338:	je     140132fca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf55a>
   14013033e:	mov    -0x8(%rsi),%rax
   140130342:	mov    $0x1,%r12d
   140130348:	sub    $0x10,%rsi
   14013034c:	mov    %rax,0x210(%rsp)
   140130354:	mov    (%rsi),%rax
   140130357:	mov    %rax,0x208(%rsp)
   14013035f:	jmp    140125444 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19d4>
   140130364:	cmp    $0x1,%r12b
   140130368:	je     140132a4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefdd>
   14013036e:	mov    -0x8(%rsi),%rax
   140130372:	mov    $0x1,%r12d
   140130378:	sub    $0x10,%rsi
   14013037c:	mov    %rax,0x200(%rsp)
   140130384:	mov    (%rsi),%rax
   140130387:	mov    %rax,0x1f8(%rsp)
   14013038f:	jmp    14012538d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x191d>
   140130394:	mov    %r8,0x40(%rsp)
   140130399:	lea    0x20(%rdi),%rdx
   14013039d:	lea    0x1068(%rbx),%rcx
   1401303a4:	vzeroupper
   1401303a7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401303ac:	mov    0x40(%rsp),%r8
   1401303b1:	jmp    140125094 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1624>
   1401303b6:	cmp    $0x1,%r12b
   1401303ba:	je     1401336ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc7e>
   1401303c0:	mov    -0x8(%rsi),%rax
   1401303c4:	mov    $0x1,%r12d
   1401303ca:	sub    $0x10,%rsi
   1401303ce:	mov    %rax,0x2c0(%rsp)
   1401303d6:	mov    (%rsi),%rax
   1401303d9:	mov    %rax,0x2b8(%rsp)
   1401303e1:	mov    %rax,%rcx
   1401303e4:	jmp    140125d05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2295>
   1401303e9:	movabs $0xffffffff00000000,%rax
   1401303f3:	mov    -0x8(%rsi),%rdx
   1401303f7:	movabs $0xfffd000200000000,%rcx
   140130401:	and    %rdx,%rax
   140130404:	cmp    %rcx,%rax
   140130407:	je     140135896 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e26>
   14013040d:	movabs $0xfffb000000000000,%rax
   140130417:	sub    $0x8,%rsi
   14013041b:	movabs $0xffff000000000000,%rdx
   140130425:	movabs $0xfffd000000000000,%rcx
   14013042f:	mov    %rax,0x3e0(%rsp)
   140130437:	mov    (%rsi),%rax
   14013043a:	and    %rax,%rdx
   14013043d:	mov    %rax,0x3e0(%rsp)
   140130445:	cmp    %rcx,%rdx
   140130448:	je     14012d7c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d51>
   14013044e:	jmp    140128b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x511e>
   140130453:	mov    0x1048(%rbx),%rdx
   14013045a:	mov    %rax,%rbp
   14013045d:	vzeroupper
   140130460:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140130465:	mov    0x1050(%rbx),%rax
   14013046c:	sub    %rdx,%rax
   14013046f:	cmp    %r11,%rax
   140130472:	jb     1401331ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf77c>
   140130478:	mov    %r10,0x1060(%rbx)
   14013047f:	mov    0x152a0(%rbx),%rax
   140130486:	cmp    %rax,0x68(%rcx)
   14013048a:	jae    140134731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cc1>
   140130490:	mov    0x1060(%rbx),%rax
   140130497:	mov    0x1048(%rbx),%rdx
   14013049e:	lea    (%rdx,%rax,8),%rsi
   1401304a2:	jmp    140126781 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d11>
   1401304a7:	mov    %r9,0x40(%rsp)
   1401304ac:	add    %rdx,%rdx
   1401304af:	lea    0x1068(%rbx),%rcx
   1401304b6:	vzeroupper
   1401304b9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401304be:	mov    0x40(%rsp),%r9
   1401304c3:	jmp    140126708 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c98>
   1401304c8:	cmp    $0x1,%r12b
   1401304cc:	je     140133658 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbe8>
   1401304d2:	mov    -0x8(%rsi),%rax
   1401304d6:	mov    $0x1,%r12d
   1401304dc:	sub    $0x10,%rsi
   1401304e0:	mov    %rax,0x3b0(%rsp)
   1401304e8:	mov    (%rsi),%rax
   1401304eb:	mov    %rax,0x3a8(%rsp)
   1401304f3:	jmp    140128736 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc6>
   1401304f8:	cmp    $0x1,%r12b
   1401304fc:	je     140133789 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd19>
   140130502:	mov    -0x8(%rsi),%rax
   140130506:	mov    $0x1,%r12d
   14013050c:	sub    $0x10,%rsi
   140130510:	mov    %rax,0x3d0(%rsp)
   140130518:	mov    (%rsi),%rax
   14013051b:	mov    %rax,0x3c8(%rsp)
   140130523:	jmp    1401289f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f88>
   140130528:	cmp    $0x1,%r12b
   14013052c:	je     140133765 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcf5>
   140130532:	mov    -0x8(%rsi),%rax
   140130536:	mov    $0x1,%r12d
   14013053c:	sub    $0x10,%rsi
   140130540:	mov    %rax,0x1f0(%rsp)
   140130548:	mov    (%rsi),%rax
   14013054b:	mov    %rax,0x1e8(%rsp)
   140130553:	jmp    1401252d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1866>
   140130558:	mov    %r9,0x40(%rsp)
   14013055d:	lea    0x3e0(%rsp),%rcx
   140130565:	vzeroupper
   140130568:	call   14021bef0 <setun::VMValue::payload() const>
   14013056d:	mov    0x48(%rax),%rdi
   140130571:	test   %rdi,%rdi
   140130574:	je     14012e66f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabff>
   14013057a:	mov    0x40(%rsp),%r9
   14013057f:	lea    0x22b540(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   140130586:	movzwl 0x6(%r9),%eax
   14013058b:	mov    %r9,0x80(%rsp)
   140130593:	shl    $0x5,%rax
   140130597:	add    0x30(%r14),%rax
   14013059b:	mov    %rax,%rcx
   14013059e:	mov    %rax,0x40(%rsp)
   1401305a3:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401305a8:	test   %al,%al
   1401305aa:	jne    140131ef5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe485>
   1401305b0:	mov    0x40(%rsp),%rcx
   1401305b5:	lea    0x22b50e(%rip),%rdx        # 14035baca <.rdata+0x50a>
   1401305bc:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401305c1:	test   %al,%al
   1401305c3:	jne    140131ef5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe485>
   1401305c9:	mov    0x38(%rdi),%rdx
   1401305cd:	test   %rdx,%rdx
   1401305d0:	je     140133c6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101fc>
   1401305d6:	mov    0x40(%rsp),%r8
   1401305db:	lea    0x680(%rsp),%rcx
   1401305e3:	add    $0x28,%rdx
   1401305e7:	call   140222080 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401305ec:	mov    0x680(%rsp),%rax
   1401305f4:	test   %rax,%rax
   1401305f7:	je     140133c6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101fc>
   1401305fd:	mov    (%rax),%rax
   140130600:	test   %rax,%rax
   140130603:	je     140133c6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101fc>
   140130609:	mov    0x48(%rdi),%rcx
   14013060d:	mov    0x50(%rdi),%rdx
   140130611:	movzwl 0x28(%rax),%eax
   140130615:	sub    %rcx,%rdx
   140130618:	sar    $0x3,%rdx
   14013061c:	cmp    %rdx,%rax
   14013061f:	jae    140133c6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101fc>
   140130625:	mov    0x38(%rdi),%rdx
   140130629:	mov    0x80(%rsp),%r9
   140130631:	mov    (%rdx),%edx
   140130633:	mov    %ax,0x4(%r9)
   140130638:	mov    %edx,(%r9)
   14013063b:	test   %r12b,%r12b
   14013063e:	jne    140137220 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137b0>
   140130644:	mov    (%rcx,%rax,8),%rax
   140130648:	mov    $0x1,%r12d
   14013064e:	mov    %rax,0x1c8(%rsp)
   140130656:	cmpb   $0x0,0x1040(%rbx)
   14013065d:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   140130663:	movzbl 0x2(%rbp),%eax
   140130667:	lea    0x28fa32(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013066e:	add    $0x3,%rbp
   140130672:	mov    (%rdi,%rax,8),%rax
   140130676:	jmp    *%rax
   140130678:	nopl   0x0(%rax,%rax,1)
   140130680:	cmp    $0x2,%r12b
   140130684:	je     140133808 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd98>
   14013068a:	mov    -0x8(%rsi),%rdx
   14013068e:	sub    $0x8,%rsi
   140130692:	mov    %rdx,(%rax,%r13,8)
   140130696:	jmp    140127d42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42d2>
   14013069b:	cmp    $0x1,%r12b
   14013069f:	je     140133715 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfca5>
   1401306a5:	mov    -0x8(%rsi),%rax
   1401306a9:	mov    $0x1,%r12d
   1401306af:	sub    $0x10,%rsi
   1401306b3:	mov    %rax,0x380(%rsp)
   1401306bb:	mov    (%rsi),%rax
   1401306be:	mov    %rax,0x378(%rsp)
   1401306c6:	jmp    1401283bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494b>
   1401306cb:	lea    0x8(%rdi),%rdx
   1401306cf:	lea    0x48(%rdi),%r10
   1401306d3:	mov    %rdx,0x15268(%rbx)
   1401306da:	mov    0x1070(%rbx),%rdx
   1401306e1:	sub    0x1068(%rbx),%rdx
   1401306e8:	sar    $0x3,%rdx
   1401306ec:	mov    %rdx,%rcx
   1401306ef:	cmp    %rdx,%r10
   1401306f2:	jae    140135926 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11eb6>
   1401306f8:	vzeroupper
   1401306fb:	jmp    140124a2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbb>
   140130700:	mov    0x15270(%rbx),%rax
   140130707:	mov    0x152a0(%rbx),%rdx
   14013070e:	cmp    %rdx,0x68(%rax)
   140130712:	jae    140133e6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103fd>
   140130718:	cmpb   $0x0,0x152c1(%rbx)
   14013071f:	je     140131ad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe069>
   140130725:	cmpq   $0x0,0x152e0(%rbx)
   14013072d:	je     140131ad9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe069>
   140130733:	cmp    $0x2,%r12b
   140130737:	je     140135bb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12140>
   14013073d:	cmp    $0x1,%r12b
   140130741:	je     14013774a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cda>
   140130747:	mov    0x1048(%rbx),%rdx
   14013074e:	mov    0x1050(%rbx),%rax
   140130755:	mov    %rsi,%rcx
   140130758:	sub    %rdx,%rax
   14013075b:	sub    %rdx,%rcx
   14013075e:	mov    %rcx,%r12
   140130761:	sar    $0x3,%r12
   140130765:	cmp    %rcx,%rax
   140130768:	jb     140133b1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100aa>
   14013076e:	movswq %di,%rax
   140130772:	mov    %r12,0x1060(%rbx)
   140130779:	lea    0x2(%rbp,%rax,1),%rax
   14013077e:	sub    %r15,%rax
   140130781:	mov    %rax,0x40(%rsp)
   140130786:	and    0x15300(%rbx),%rax
   14013078d:	mov    %rax,%r10
   140130790:	shl    $0x5,%r10
   140130794:	add    0x152e0(%rbx),%r10
   14013079b:	cmpq   $0x0,(%r10)
   14013079f:	je     140133b32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100c2>
   1401307a5:	mov    0x1068(%rbx),%rdx
   1401307ac:	lea    0x560(%rsp),%r12
   1401307b4:	xor    %eax,%eax
   1401307b6:	mov    $0x23,%ecx
   1401307bb:	mov    %r12,%rdi
   1401307be:	rep stos %rax,(%rdi)
   1401307c1:	lea    (%rdx,%r13,8),%rax
   1401307c5:	movb   $0x1,0x668(%rsp)
   1401307cd:	mov    %rax,0x570(%rsp)
   1401307d5:	mov    0x1070(%rbx),%rax
   1401307dc:	mov    %rbx,0x560(%rsp)
   1401307e4:	sub    %rdx,%rax
   1401307e7:	mov    0x1048(%rbx),%rdx
   1401307ee:	sar    $0x3,%rax
   1401307f2:	sub    %r13,%rax
   1401307f5:	mov    %rdx,0x580(%rsp)
   1401307fd:	mov    %rax,0x578(%rsp)
   140130805:	mov    %rsi,%rax
   140130808:	sub    %rdx,%rax
   14013080b:	mov    0x150c0(%rbx),%rdx
   140130812:	sar    $0x3,%rax
   140130816:	mov    %rax,0x588(%rsp)
   14013081e:	xor    %eax,%eax
   140130820:	test   %rdx,%rdx
   140130823:	je     140130831 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdc1>
   140130825:	imul   $0x28,%rdx,%rdx
   140130829:	lea    0x1098(%rbx,%rdx,1),%rax
   140130831:	mov    %r10,0x60(%rsp)
   140130836:	vmovq  %rax,%xmm7
   14013083b:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140130845:	mov    %r12,0x152b8(%rbx)
   14013084c:	vmovdqa %xmm0,0x590(%rsp)
   140130855:	vzeroupper
   140130858:	call   140212e20 <tersun::VMTelemetryManager::instance()>
   14013085d:	mov    0x60(%rsp),%r10
   140130862:	cmpb   $0x0,(%rax)
   140130865:	je     14013086c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdfc>
   140130867:	addq   $0x1,0x78(%rax)
   14013086c:	mov    %r12,%rdx
   14013086f:	mov    %rbx,%rcx
   140130872:	call   *(%r10)
   140130875:	mov    %rax,%r12
   140130878:	mov    0x598(%rsp),%rax
   140130880:	mov    %rax,0x152b8(%rbx)
   140130887:	cmpq   $0x0,0x5a8(%rsp)
   140130890:	jg     14013777a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d0a>
   140130896:	mov    0x150c0(%rbx),%rax
   14013089d:	test   %rax,%rax
   1401308a0:	je     140137867 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13df7>
   1401308a6:	lea    (%rax,%rax,4),%rdx
   1401308aa:	sub    $0x1,%rax
   1401308ae:	lea    (%rbx,%rdx,8),%rdx
   1401308b2:	mov    0x1098(%rdx),%rdi
   1401308b9:	mov    0x10a0(%rdx),%rcx
   1401308c0:	mov    0x10a8(%rdx),%rsi
   1401308c7:	mov    %rax,0x150c0(%rbx)
   1401308ce:	cmpb   $0x0,0x15211(%rbx)
   1401308d5:	je     140137853 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13de3>
   1401308db:	mov    %rcx,0x15268(%rbx)
   1401308e2:	mov    0x1048(%rbx),%rdx
   1401308e9:	mov    0x150c0(%rbx),%r13
   1401308f0:	lea    (%rdx,%rsi,8),%rax
   1401308f4:	mov    %r12,(%rax)
   1401308f7:	lea    0x8(%rax),%rsi
   1401308fb:	test   %r13,%r13
   1401308fe:	je     140130910 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcea0>
   140130900:	lea    -0x1(%r13),%rax
   140130904:	imul   $0x28,%rax,%rax
   140130908:	mov    0x10c8(%rbx,%rax,1),%r13
   140130910:	lea    (%r15,%rdi,1),%rcx
   140130914:	cmpb   $0x0,0x1040(%rbx)
   14013091b:	je     14012a4d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   140130921:	movzbl (%rcx),%eax
   140130924:	lea    0x28f775(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013092b:	lea    0x1(%rcx),%rbp
   14013092f:	xor    %r12d,%r12d
   140130932:	mov    (%rdi,%rax,8),%rax
   140130936:	jmp    *%rax
   140130938:	lea    0x20(%rdi),%rdx
   14013093c:	lea    0x1068(%rbx),%rcx
   140130943:	mov    %r8d,0x60(%rsp)
   140130948:	mov    %r9d,0x80(%rsp)
   140130950:	mov    %eax,0x40(%rsp)
   140130954:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130959:	mov    0x60(%rsp),%r8d
   14013095e:	mov    0x40(%rsp),%eax
   140130962:	mov    0x80(%rsp),%r9d
   14013096a:	jmp    140124a34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc4>
   14013096f:	cmp    $0x2,%r12b
   140130973:	je     140133897 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe27>
   140130979:	mov    -0x8(%rsi),%rdx
   14013097d:	lea    -0x8(%rsi),%rax
   140130981:	mov    %rax,%rsi
   140130984:	mov    %rdx,0x318(%rsp)
   14013098c:	cmp    $0x1,%r12b
   140130990:	jne    14012a19f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x672f>
   140130996:	mov    0x1c8(%rsp),%rdx
   14013099e:	lea    -0x8(%rax),%rsi
   1401309a2:	xor    %r12d,%r12d
   1401309a5:	mov    %rdx,0x320(%rsp)
   1401309ad:	mov    -0x8(%rax),%rdx
   1401309b1:	jmp    14012a1b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6742>
   1401309b6:	cmp    $0x2,%r12b
   1401309ba:	je     1401336c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc53>
   1401309c0:	mov    -0x8(%rsi),%rax
   1401309c4:	sub    $0x8,%rsi
   1401309c8:	mov    %rax,0x2f8(%rsp)
   1401309d0:	jmp    1401261e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2776>
   1401309d5:	mov    %r10d,0x60(%rsp)
   1401309da:	lea    0x20(%rdi),%rdx
   1401309de:	lea    0x1068(%rbx),%rcx
   1401309e5:	mov    %eax,0x80(%rsp)
   1401309ec:	vzeroupper
   1401309ef:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401309f4:	mov    0x80(%rsp),%eax
   1401309fb:	mov    0x60(%rsp),%r10d
   140130a00:	jmp    140127c18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41a8>
   140130a05:	cmp    $0x1,%r12b
   140130a09:	je     140133873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe03>
   140130a0f:	mov    -0x8(%rsi),%rax
   140130a13:	mov    $0x1,%r12d
   140130a19:	sub    $0x10,%rsi
   140130a1d:	mov    %rax,0x3c0(%rsp)
   140130a25:	mov    (%rsi),%rax
   140130a28:	mov    %rax,0x3b8(%rsp)
   140130a30:	jmp    140128898 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e28>
   140130a35:	cmp    $0x1,%r12b
   140130a39:	je     1401338bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe4f>
   140130a3f:	mov    -0x8(%rsi),%rax
   140130a43:	mov    $0x1,%r12d
   140130a49:	sub    $0x10,%rsi
   140130a4d:	mov    %rax,0x390(%rsp)
   140130a55:	mov    (%rsi),%rax
   140130a58:	mov    %rax,0x388(%rsp)
   140130a60:	jmp    140128476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   140130a65:	cmp    $0x1,%r12b
   140130a69:	je     14013226b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7fb>
   140130a6f:	mov    -0x8(%rsi),%rax
   140130a73:	mov    $0x1,%r12d
   140130a79:	sub    $0x10,%rsi
   140130a7d:	mov    %rax,0x370(%rsp)
   140130a85:	mov    (%rsi),%rax
   140130a88:	mov    %rax,0x368(%rsp)
   140130a90:	jmp    140128300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4890>
   140130a95:	lea    0x680(%rsp),%rcx
   140130a9d:	lea    0x330(%rsp),%rdx
   140130aa5:	vzeroupper
   140130aa8:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140130aad:	mov    0x680(%rsp),%rax
   140130ab5:	lea    0x338(%rsp),%rcx
   140130abd:	mov    0x690(%rsp),%edi
   140130ac4:	mov    %rax,0x60(%rsp)
   140130ac9:	mov    0x688(%rsp),%rax
   140130ad1:	mov    %rax,0x40(%rsp)
   140130ad6:	call   14021aa80 <setun::VMValue::as_int() const>
   140130adb:	test   %rax,%rax
   140130ade:	jne    14013228f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe81f>
   140130ae4:	test   %r12b,%r12b
   140130ae7:	je     140134b87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11117>
   140130aed:	cmp    $0x1,%r12b
   140130af1:	je     140138767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cf7>
   140130af7:	lea    0x8(%rsi),%r8
   140130afb:	cmp    0x38(%rsp),%r8
   140130b00:	jae    140138715 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ca5>
   140130b06:	mov    0x1d0(%rsp),%rax
   140130b0e:	mov    0x60(%rsp),%rdx
   140130b13:	mov    %r8,0x40(%rsp)
   140130b18:	mov    %rax,(%rsi)
   140130b1b:	mov    0x1c8(%rsp),%rax
   140130b23:	mov    %rax,0x1d0(%rsp)
   140130b2b:	lea    0x540(%rsp),%rcx
   140130b33:	mov    $0x2,%r12d
   140130b39:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140130b3e:	mov    0x540(%rsp),%rax
   140130b46:	mov    0x40(%rsp),%rsi
   140130b4b:	mov    %rax,0x1c8(%rsp)
   140130b53:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   140130b58:	movabs $0xffff000000000000,%rdx
   140130b62:	movb   $0xcd,-0x1(%rbp)
   140130b66:	mov    (%r10),%rax
   140130b69:	and    %rax,%rdx
   140130b6c:	mov    %rdx,%rcx
   140130b6f:	movabs $0xfffd000000000000,%rdx
   140130b79:	cmp    %rdx,%rcx
   140130b7c:	je     140132757 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xece7>
   140130b82:	movabs $0xfff8000000000000,%rax
   140130b8c:	cmp    %rax,%rcx
   140130b8f:	je     14013276f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecff>
   140130b95:	mov    %r10,%rcx
   140130b98:	mov    %r9,0x60(%rsp)
   140130b9d:	mov    %r11,0x40(%rsp)
   140130ba2:	call   14021c1d0 <setun::VMValue::as_float() const>
   140130ba7:	mov    0x60(%rsp),%r9
   140130bac:	mov    0x40(%rsp),%r11
   140130bb1:	movq   $0x0,0x508(%rsp)
   140130bbd:	vcvttsd2si %xmm0,%rax
   140130bc2:	movq   $0x0,0x510(%rsp)
   140130bce:	mov    %rax,0x500(%rsp)
   140130bd6:	lea    0x500(%rsp),%rax
   140130bde:	mov    %rax,0x80(%rsp)
   140130be6:	movabs $0xffff000000000000,%rdx
   140130bf0:	mov    (%r9),%rax
   140130bf3:	and    %rax,%rdx
   140130bf6:	mov    %rdx,%rcx
   140130bf9:	movabs $0xfffd000000000000,%rdx
   140130c03:	cmp    %rdx,%rcx
   140130c06:	je     14013268a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec1a>
   140130c0c:	movabs $0xfff8000000000000,%rax
   140130c16:	cmp    %rax,%rcx
   140130c19:	je     1401326a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec32>
   140130c1f:	mov    %r9,%rcx
   140130c22:	mov    %r11,0x40(%rsp)
   140130c27:	call   14021c1d0 <setun::VMValue::as_float() const>
   140130c2c:	vcvttsd2si %xmm0,%rax
   140130c31:	mov    %rax,0x520(%rsp)
   140130c39:	mov    0x40(%rsp),%r11
   140130c3e:	lea    0x520(%rsp),%r8
   140130c46:	movq   $0x0,0x528(%rsp)
   140130c52:	movq   $0x0,0x530(%rsp)
   140130c5e:	movabs $0xffff000000000000,%rdx
   140130c68:	mov    (%r11),%rax
   140130c6b:	and    %rax,%rdx
   140130c6e:	mov    %rdx,%rcx
   140130c71:	movabs $0xfffd000000000000,%rdx
   140130c7b:	cmp    %rdx,%rcx
   140130c7e:	je     140132660 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebf0>
   140130c84:	movabs $0xfff8000000000000,%rax
   140130c8e:	cmp    %rax,%rcx
   140130c91:	je     140132678 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec08>
   140130c97:	mov    %r11,%rcx
   140130c9a:	mov    %r8,0x40(%rsp)
   140130c9f:	call   14021c1d0 <setun::VMValue::as_float() const>
   140130ca4:	vcvttsd2si %xmm0,%rax
   140130ca9:	mov    0x40(%rsp),%r8
   140130cae:	mov    %rax,0x540(%rsp)
   140130cb6:	lea    0x540(%rsp),%rax
   140130cbe:	movq   $0x0,0x548(%rsp)
   140130cca:	movq   $0x0,0x550(%rsp)
   140130cd6:	mov    %rax,0x60(%rsp)
   140130cdb:	mov    0x80(%rsp),%rdx
   140130ce3:	lea    0x680(%rsp),%rax
   140130ceb:	mov    %rax,%rcx
   140130cee:	mov    %rax,0x40(%rsp)
   140130cf3:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140130cf8:	mov    0x40(%rsp),%r8
   140130cfd:	mov    0x60(%rsp),%rdx
   140130d02:	lea    0x4c0(%rsp),%rcx
   140130d0a:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140130d0f:	mov    0x4d0(%rsp),%rax
   140130d17:	vmovdqa 0x4c0(%rsp),%xmm7
   140130d20:	lea    0x1a0(%rsp),%rdx
   140130d28:	mov    0x40(%rsp),%rcx
   140130d2d:	mov    %rax,0x1b0(%rsp)
   140130d35:	vmovdqa %xmm7,0x1a0(%rsp)
   140130d3e:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140130d43:	mov    0x1068(%rbx),%rax
   140130d4a:	mov    0x680(%rsp),%rdx
   140130d52:	mov    %rdx,(%rax,%rdi,8)
   140130d56:	jmp    140124921 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1>
   140130d5b:	vzeroupper
   140130d5e:	mov    0x1048(%rbx),%rdx
   140130d65:	mov    %r9,%rbp
   140130d68:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140130d6d:	cmp    $0x2,%r12b
   140130d71:	jne    14013707e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1360e>
   140130d77:	mov    0x1048(%rbx),%rdx
   140130d7e:	lea    0x10(%rsi),%r8
   140130d82:	cmp    0x38(%rsp),%r8
   140130d87:	jae    14013702d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135bd>
   140130d8d:	mov    0x1d0(%rsp),%rax
   140130d95:	mov    %rax,(%rsi)
   140130d98:	mov    0x1c8(%rsp),%rax
   140130da0:	mov    %rax,0x8(%rsi)
   140130da4:	mov    %r8,%rsi
   140130da7:	mov    0x1068(%rbx),%r8
   140130dae:	jmp    1401264cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   140130db3:	mov    %r9,0x40(%rsp)
   140130db8:	lea    0x400(%rsp),%rcx
   140130dc0:	lea    0x3e0(%rsp),%rdx
   140130dc8:	vzeroupper
   140130dcb:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140130dd0:	mov    0x40(%rsp),%r9
   140130dd5:	lea    0x22acea(%rip),%rdx        # 14035bac6 <.rdata+0x506>
   140130ddc:	movzwl 0x6(%r9),%eax
   140130de1:	shl    $0x5,%rax
   140130de5:	add    0x30(%r14),%rax
   140130de9:	mov    %rax,%rcx
   140130dec:	mov    %rax,%rdi
   140130def:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130df4:	test   %al,%al
   140130df6:	jne    140131a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe024>
   140130dfc:	lea    0x22acc7(%rip),%rdx        # 14035baca <.rdata+0x50a>
   140130e03:	mov    %rdi,%rcx
   140130e06:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e0b:	test   %al,%al
   140130e0d:	jne    140131a94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe024>
   140130e13:	lea    0x22acdc(%rip),%rdx        # 14035baf6 <.rdata+0x536>
   140130e1a:	mov    %rdi,%rcx
   140130e1d:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e22:	test   %al,%al
   140130e24:	jne    1401349fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f8b>
   140130e2a:	lea    0x22acc7(%rip),%rdx        # 14035baf8 <.rdata+0x538>
   140130e31:	mov    %rdi,%rcx
   140130e34:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e39:	test   %al,%al
   140130e3b:	jne    1401349fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f8b>
   140130e41:	lea    0x22acb2(%rip),%rdx        # 14035bafa <.rdata+0x53a>
   140130e48:	mov    %rdi,%rcx
   140130e4b:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e50:	test   %al,%al
   140130e52:	jne    1401387f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d87>
   140130e58:	lea    0x22ac9d(%rip),%rdx        # 14035bafc <.rdata+0x53c>
   140130e5f:	mov    %rdi,%rcx
   140130e62:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e67:	test   %al,%al
   140130e69:	jne    1401387f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d87>
   140130e6f:	lea    0x22ac88(%rip),%rdx        # 14035bafe <.rdata+0x53e>
   140130e76:	mov    %rdi,%rcx
   140130e79:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e7e:	test   %al,%al
   140130e80:	jne    14013879e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2e>
   140130e86:	lea    0x22ac73(%rip),%rdx        # 14035bb00 <.rdata+0x540>
   140130e8d:	mov    %rdi,%rcx
   140130e90:	call   14032fea0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130e95:	test   %al,%al
   140130e97:	jne    14013879e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2e>
   140130e9d:	test   %r12b,%r12b
   140130ea0:	jne    14013891b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eab>
   140130ea6:	mov    $0x1fff,%eax
   140130eab:	mov    $0x1,%r12d
   140130eb1:	shl    $0x33,%rax
   140130eb5:	mov    %rax,0x1c8(%rsp)
   140130ebd:	cmpb   $0x0,0x1040(%rbx)
   140130ec4:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   140130eca:	movzbl 0x2(%rbp),%eax
   140130ece:	lea    0x28f1cb(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130ed5:	add    $0x3,%rbp
   140130ed9:	mov    (%rdi,%rax,8),%rax
   140130edd:	jmp    *%rax
   140130edf:	mov    0x278(%rsp),%rax
   140130ee7:	mov    %rax,0x1c8(%rsp)
   140130eef:	jmp    140125915 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ea5>
   140130ef4:	mov    0x290(%rsp),%rax
   140130efc:	mov    %rax,0x1c8(%rsp)
   140130f04:	jmp    140125a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fc6>
   140130f09:	lea    0x680(%rsp),%rcx
   140130f11:	lea    0x308(%rsp),%rdx
   140130f19:	vzeroupper
   140130f1c:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140130f21:	mov    0x680(%rsp),%rax
   140130f29:	lea    0x310(%rsp),%rcx
   140130f31:	mov    0x690(%rsp),%edi
   140130f38:	mov    %rax,0x60(%rsp)
   140130f3d:	mov    0x688(%rsp),%rax
   140130f45:	mov    %rax,0x40(%rsp)
   140130f4a:	call   14021aa80 <setun::VMValue::as_int() const>
   140130f4f:	test   %rax,%rax
   140130f52:	jne    140132122 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6b2>
   140130f58:	test   %r12b,%r12b
   140130f5b:	je     1401346aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c3a>
   140130f61:	cmp    $0x1,%r12b
   140130f65:	je     1401378f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e83>
   140130f6b:	lea    0x8(%rsi),%r8
   140130f6f:	cmp    0x38(%rsp),%r8
   140130f74:	jae    1401378a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e31>
   140130f7a:	mov    0x1d0(%rsp),%rax
   140130f82:	mov    0x60(%rsp),%rdx
   140130f87:	mov    %r8,0x40(%rsp)
   140130f8c:	mov    %rax,(%rsi)
   140130f8f:	mov    0x1c8(%rsp),%rax
   140130f97:	mov    %rax,0x1d0(%rsp)
   140130f9f:	lea    0x540(%rsp),%rcx
   140130fa7:	mov    $0x2,%r12d
   140130fad:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140130fb2:	mov    0x540(%rsp),%rax
   140130fba:	mov    0x40(%rsp),%rsi
   140130fbf:	mov    %rax,0x1c8(%rsp)
   140130fc7:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140130fcc:	add    0x548(%rsp),%rdi
   140130fd4:	jns    14012c721 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cb1>
   140130fda:	test   %r12b,%r12b
   140130fdd:	je     140132b6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0fa>
   140130fe3:	cmp    $0x1,%r12b
   140130fe7:	je     140134fd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11564>
   140130fed:	lea    0x8(%rsi),%r8
   140130ff1:	cmp    0x38(%rsp),%r8
   140130ff6:	jae    140136e48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133d8>
   140130ffc:	mov    0x1d0(%rsp),%rax
   140131004:	lea    0x680(%rsp),%rcx
   14013100c:	mov    %r8,0x40(%rsp)
   140131011:	lea    0x22aaad(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140131018:	mov    %rax,(%rsi)
   14013101b:	mov    0x1c8(%rsp),%rax
   140131023:	mov    %rax,0x1d0(%rsp)
   14013102b:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   140131030:	mov    0x680(%rsp),%rax
   140131038:	mov    0x40(%rsp),%rsi
   14013103d:	mov    %rax,0x1c8(%rsp)
   140131045:	mov    $0x2,%r12d
   14013104b:	jmp    14012c7ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d7d>
   140131050:	shr    $0x20,%rax
   140131054:	mov    %eax,%edx
   140131056:	test   %ax,%ax
   140131059:	jne    14012e4b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa42>
   14013105f:	lea    0x680(%rsp),%rcx
   140131067:	lea    0x2f0(%rsp),%rdx
   14013106f:	vzeroupper
   140131072:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131077:	lea    0x2e8(%rsp),%rdx
   14013107f:	lea    0x540(%rsp),%rcx
   140131087:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013108c:	mov    0x540(%rsp),%rcx
   140131094:	mov    0x688(%rsp),%r9
   14013109c:	mov    0x680(%rsp),%r8
   1401310a4:	mov    0x548(%rsp),%rdx
   1401310ac:	mov    %rcx,0x40(%rsp)
   1401310b1:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401310b6:	mov    0x40(%rsp),%rcx
   1401310bb:	mov    %eax,%edi
   1401310bd:	lea    0x550(%rsp),%rax
   1401310c5:	cmp    %rax,%rcx
   1401310c8:	je     1401310db <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd66b>
   1401310ca:	mov    0x550(%rsp),%rax
   1401310d2:	lea    0x1(%rax),%rdx
   1401310d6:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401310db:	mov    0x680(%rsp),%rcx
   1401310e3:	lea    0x690(%rsp),%rax
   1401310eb:	cmp    %rax,%rcx
   1401310ee:	je     140131101 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd691>
   1401310f0:	mov    0x690(%rsp),%rax
   1401310f8:	lea    0x1(%rax),%rdx
   1401310fc:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131101:	mov    %edi,%eax
   140131103:	not    %eax
   140131105:	shr    $0x1f,%eax
   140131108:	jmp    14012613a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26ca>
   14013110d:	shr    $0x20,%rdx
   140131111:	mov    %edx,%eax
   140131113:	test   %dx,%dx
   140131116:	jne    14012e539 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaac9>
   14013111c:	lea    0x680(%rsp),%r10
   140131124:	lea    0x2a0(%rsp),%rdx
   14013112c:	mov    %r10,0x60(%rsp)
   140131131:	mov    %r10,%rcx
   140131134:	vzeroupper
   140131137:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013113c:	lea    0x540(%rsp),%rax
   140131144:	lea    0x298(%rsp),%rdx
   14013114c:	mov    %rax,%rcx
   14013114f:	mov    %rax,0x40(%rsp)
   140131154:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131159:	mov    0x40(%rsp),%rcx
   14013115e:	mov    0x60(%rsp),%rdx
   140131163:	call   14032ff00 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131168:	mov    0x540(%rsp),%rcx
   140131170:	mov    %eax,%edi
   140131172:	lea    0x550(%rsp),%rax
   14013117a:	cmp    %rax,%rcx
   14013117d:	je     140131190 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd720>
   14013117f:	mov    0x550(%rsp),%rax
   140131187:	lea    0x1(%rax),%rdx
   14013118b:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131190:	mov    0x680(%rsp),%rcx
   140131198:	lea    0x690(%rsp),%rax
   1401311a0:	cmp    %rax,%rcx
   1401311a3:	je     140125b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   1401311a9:	mov    0x690(%rsp),%rax
   1401311b1:	lea    0x1(%rax),%rdx
   1401311b5:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401311ba:	jmp    140125b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20de>
   1401311bf:	mov    %rdx,%rax
   1401311c2:	shr    $0x20,%rax
   1401311c6:	cmp    $0x5,%ax
   1401311ca:	je     140125b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20b7>
   1401311d0:	movabs $0xffffffff00000000,%rax
   1401311da:	and    %rax,%rcx
   1401311dd:	jmp    14012e517 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaa7>
   1401311e2:	shr    $0x20,%rax
   1401311e6:	mov    %eax,%ecx
   1401311e8:	test   %ax,%ax
   1401311eb:	jne    140132113 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6a3>
   1401311f1:	lea    0x680(%rsp),%r10
   1401311f9:	lea    0x2b0(%rsp),%rdx
   140131201:	mov    %r10,0x60(%rsp)
   140131206:	mov    %r10,%rcx
   140131209:	vzeroupper
   14013120c:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131211:	lea    0x540(%rsp),%rax
   140131219:	lea    0x2a8(%rsp),%rdx
   140131221:	mov    %rax,%rcx
   140131224:	mov    %rax,0x40(%rsp)
   140131229:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013122e:	mov    0x40(%rsp),%rcx
   140131233:	mov    0x60(%rsp),%rdx
   140131238:	call   14032ff00 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14013123d:	mov    0x540(%rsp),%rcx
   140131245:	mov    %eax,%edi
   140131247:	lea    0x550(%rsp),%rax
   14013124f:	cmp    %rax,%rcx
   140131252:	je     140131265 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd7f5>
   140131254:	mov    0x550(%rsp),%rax
   14013125c:	lea    0x1(%rax),%rdx
   140131260:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131265:	mov    0x680(%rsp),%rcx
   14013126d:	lea    0x690(%rsp),%rax
   140131275:	cmp    %rax,%rcx
   140131278:	je     14013128b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd81b>
   14013127a:	mov    0x690(%rsp),%rax
   140131282:	lea    0x1(%rax),%rdx
   140131286:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013128b:	mov    %edi,%eax
   14013128d:	xor    $0x1,%eax
   140131290:	jmp    140125c7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x220e>
   140131295:	shr    $0x20,%rax
   140131299:	mov    %eax,%edx
   14013129b:	test   %ax,%ax
   14013129e:	jne    14012e416 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9a6>
   1401312a4:	lea    0x680(%rsp),%rcx
   1401312ac:	lea    0x2d0(%rsp),%rdx
   1401312b4:	vzeroupper
   1401312b7:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401312bc:	lea    0x2c8(%rsp),%rdx
   1401312c4:	lea    0x540(%rsp),%rcx
   1401312cc:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401312d1:	mov    0x540(%rsp),%rcx
   1401312d9:	mov    0x688(%rsp),%r9
   1401312e1:	mov    0x680(%rsp),%r8
   1401312e9:	mov    0x548(%rsp),%rdx
   1401312f1:	mov    %rcx,0x40(%rsp)
   1401312f6:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401312fb:	mov    0x40(%rsp),%rcx
   140131300:	mov    %eax,%edi
   140131302:	lea    0x550(%rsp),%rax
   14013130a:	cmp    %rax,%rcx
   14013130d:	je     140131320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8b0>
   14013130f:	mov    0x550(%rsp),%rax
   140131317:	lea    0x1(%rax),%rdx
   14013131b:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131320:	mov    0x680(%rsp),%rcx
   140131328:	lea    0x690(%rsp),%rax
   140131330:	cmp    %rax,%rcx
   140131333:	je     140131346 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8d6>
   140131335:	mov    0x690(%rsp),%rax
   14013133d:	lea    0x1(%rax),%rdx
   140131341:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131346:	test   %edi,%edi
   140131348:	setle  %al
   14013134b:	jmp    140125edc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x246c>
   140131350:	mov    %rax,%rdx
   140131353:	shr    $0x20,%rdx
   140131357:	cmp    $0x5,%dx
   14013135b:	je     140125eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2446>
   140131361:	movabs $0xffffffff00000000,%rdx
   14013136b:	and    %rdx,%rcx
   14013136e:	jmp    14012e3f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa984>
   140131373:	shr    $0x20,%rax
   140131377:	mov    %eax,%edx
   140131379:	test   %ax,%ax
   14013137c:	jne    14012e5c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab51>
   140131382:	lea    0x680(%rsp),%rcx
   14013138a:	lea    0x2c0(%rsp),%rdx
   140131392:	vzeroupper
   140131395:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013139a:	lea    0x2b8(%rsp),%rdx
   1401313a2:	lea    0x540(%rsp),%rcx
   1401313aa:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401313af:	mov    0x540(%rsp),%rcx
   1401313b7:	mov    0x688(%rsp),%r9
   1401313bf:	mov    0x680(%rsp),%r8
   1401313c7:	mov    0x548(%rsp),%rdx
   1401313cf:	mov    %rcx,0x40(%rsp)
   1401313d4:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401313d9:	mov    0x40(%rsp),%rcx
   1401313de:	mov    %eax,%edi
   1401313e0:	lea    0x550(%rsp),%rax
   1401313e8:	cmp    %rax,%rcx
   1401313eb:	je     1401313fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd98e>
   1401313ed:	mov    0x550(%rsp),%rax
   1401313f5:	lea    0x1(%rax),%rdx
   1401313f9:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401313fe:	mov    0x680(%rsp),%rcx
   140131406:	lea    0x690(%rsp),%rax
   14013140e:	cmp    %rax,%rcx
   140131411:	je     140131424 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9b4>
   140131413:	mov    0x690(%rsp),%rax
   14013141b:	lea    0x1(%rax),%rdx
   14013141f:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131424:	shr    $0x1f,%edi
   140131427:	mov    %edi,%eax
   140131429:	jmp    140125dad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x233d>
   14013142e:	mov    %rax,%rdx
   140131431:	shr    $0x20,%rdx
   140131435:	cmp    $0x5,%dx
   140131439:	je     140125d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2317>
   14013143f:	movabs $0xffffffff00000000,%rdx
   140131449:	and    %rdx,%rcx
   14013144c:	jmp    14012e59f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab2f>
   140131451:	add    0x548(%rsp),%rdi
   140131459:	jns    14012c5cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b5f>
   14013145f:	test   %r12b,%r12b
   140131462:	je     140132842 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedd2>
   140131468:	cmp    $0x1,%r12b
   14013146c:	je     1401355b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b46>
   140131472:	lea    0x8(%rsi),%r8
   140131476:	cmp    0x38(%rsp),%r8
   14013147b:	jae    14013681d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dad>
   140131481:	mov    0x1d0(%rsp),%rax
   140131489:	lea    0x680(%rsp),%rcx
   140131491:	mov    %r8,0x40(%rsp)
   140131496:	lea    0x22a628(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   14013149d:	mov    %rax,(%rsi)
   1401314a0:	mov    0x1c8(%rsp),%rax
   1401314a8:	mov    %rax,0x1d0(%rsp)
   1401314b0:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   1401314b5:	mov    0x680(%rsp),%rax
   1401314bd:	mov    0x40(%rsp),%rsi
   1401314c2:	mov    %rax,0x1c8(%rsp)
   1401314ca:	mov    $0x2,%r12d
   1401314d0:	jmp    14012c69b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   1401314d5:	shr    $0x20,%rax
   1401314d9:	mov    %eax,%r8d
   1401314dc:	test   %ax,%ax
   1401314df:	jne    1401320e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe671>
   1401314e5:	lea    0x680(%rsp),%r10
   1401314ed:	lea    0x3b0(%rsp),%rdx
   1401314f5:	mov    %r10,0x60(%rsp)
   1401314fa:	mov    %r10,%rcx
   1401314fd:	vzeroupper
   140131500:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131505:	lea    0x540(%rsp),%rax
   14013150d:	lea    0x3a8(%rsp),%rdx
   140131515:	mov    %rax,%rcx
   140131518:	mov    %rax,0x40(%rsp)
   14013151d:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131522:	mov    0x40(%rsp),%rcx
   140131527:	mov    0x60(%rsp),%rdx
   14013152c:	call   14032ff00 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131531:	mov    0x540(%rsp),%rcx
   140131539:	mov    %eax,%edi
   14013153b:	lea    0x550(%rsp),%rax
   140131543:	cmp    %rax,%rcx
   140131546:	je     140131559 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdae9>
   140131548:	mov    0x550(%rsp),%rax
   140131550:	lea    0x1(%rax),%rdx
   140131554:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131559:	mov    0x680(%rsp),%rcx
   140131561:	lea    0x690(%rsp),%rax
   140131569:	cmp    %rax,%rcx
   14013156c:	je     140128813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da3>
   140131572:	mov    0x690(%rsp),%rax
   14013157a:	lea    0x1(%rax),%rdx
   14013157e:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131583:	jmp    140128813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4da3>
   140131588:	shr    $0x20,%rax
   14013158c:	mov    %eax,%r8d
   14013158f:	test   %ax,%ax
   140131592:	jne    140131fea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe57a>
   140131598:	lea    0x680(%rsp),%rcx
   1401315a0:	lea    0x390(%rsp),%rdx
   1401315a8:	vzeroupper
   1401315ab:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401315b0:	lea    0x388(%rsp),%rdx
   1401315b8:	lea    0x540(%rsp),%rcx
   1401315c0:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401315c5:	mov    0x540(%rsp),%rcx
   1401315cd:	mov    0x688(%rsp),%r9
   1401315d5:	mov    0x680(%rsp),%r8
   1401315dd:	mov    0x548(%rsp),%rdx
   1401315e5:	mov    %rcx,0x40(%rsp)
   1401315ea:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401315ef:	mov    0x40(%rsp),%rcx
   1401315f4:	mov    %eax,%edi
   1401315f6:	lea    0x550(%rsp),%rax
   1401315fe:	cmp    %rax,%rcx
   140131601:	je     140131614 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdba4>
   140131603:	mov    0x550(%rsp),%rax
   14013160b:	lea    0x1(%rax),%rdx
   14013160f:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131614:	mov    0x680(%rsp),%rcx
   14013161c:	lea    0x690(%rsp),%rax
   140131624:	cmp    %rax,%rcx
   140131627:	je     14013163a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbca>
   140131629:	mov    0x690(%rsp),%rax
   140131631:	lea    0x1(%rax),%rdx
   140131635:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013163a:	shr    $0x1f,%edi
   14013163d:	mov    %edi,%eax
   14013163f:	jmp    140128552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ae2>
   140131644:	shr    $0x20,%rax
   140131648:	mov    %eax,%r8d
   14013164b:	test   %ax,%ax
   14013164e:	jne    140131fb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe547>
   140131654:	lea    0x680(%rsp),%rcx
   14013165c:	lea    0x3d0(%rsp),%rdx
   140131664:	vzeroupper
   140131667:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013166c:	lea    0x3c8(%rsp),%rdx
   140131674:	lea    0x540(%rsp),%rcx
   14013167c:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131681:	mov    0x540(%rsp),%rcx
   140131689:	mov    0x688(%rsp),%r9
   140131691:	mov    0x680(%rsp),%r8
   140131699:	mov    0x548(%rsp),%rdx
   1401316a1:	mov    %rcx,0x40(%rsp)
   1401316a6:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401316ab:	mov    0x40(%rsp),%rcx
   1401316b0:	mov    %eax,%edi
   1401316b2:	lea    0x550(%rsp),%rax
   1401316ba:	cmp    %rax,%rcx
   1401316bd:	je     1401316d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc60>
   1401316bf:	mov    0x550(%rsp),%rax
   1401316c7:	lea    0x1(%rax),%rdx
   1401316cb:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401316d0:	mov    0x680(%rsp),%rcx
   1401316d8:	lea    0x690(%rsp),%rax
   1401316e0:	cmp    %rax,%rcx
   1401316e3:	je     1401316f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc86>
   1401316e5:	mov    0x690(%rsp),%rax
   1401316ed:	lea    0x1(%rax),%rdx
   1401316f1:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401316f6:	mov    %edi,%eax
   1401316f8:	not    %eax
   1401316fa:	shr    $0x1f,%eax
   1401316fd:	jmp    140128ad4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5064>
   140131702:	shr    $0x20,%rax
   140131706:	mov    %eax,%r8d
   140131709:	test   %ax,%ax
   14013170c:	jne    140131f84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe514>
   140131712:	lea    0x680(%rsp),%rcx
   14013171a:	lea    0x3c0(%rsp),%rdx
   140131722:	vzeroupper
   140131725:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013172a:	lea    0x3b8(%rsp),%rdx
   140131732:	lea    0x540(%rsp),%rcx
   14013173a:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013173f:	mov    0x540(%rsp),%rcx
   140131747:	mov    0x688(%rsp),%r9
   14013174f:	mov    0x680(%rsp),%r8
   140131757:	mov    0x548(%rsp),%rdx
   14013175f:	mov    %rcx,0x40(%rsp)
   140131764:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131769:	mov    0x40(%rsp),%rcx
   14013176e:	mov    %eax,%edi
   140131770:	lea    0x550(%rsp),%rax
   140131778:	cmp    %rax,%rcx
   14013177b:	je     14013178e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd1e>
   14013177d:	mov    0x550(%rsp),%rax
   140131785:	lea    0x1(%rax),%rdx
   140131789:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013178e:	mov    0x680(%rsp),%rcx
   140131796:	lea    0x690(%rsp),%rax
   14013179e:	cmp    %rax,%rcx
   1401317a1:	je     1401317b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd44>
   1401317a3:	mov    0x690(%rsp),%rax
   1401317ab:	lea    0x1(%rax),%rdx
   1401317af:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401317b4:	test   %edi,%edi
   1401317b6:	setg   %al
   1401317b9:	jmp    140128974 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f04>
   1401317be:	shr    $0x20,%rax
   1401317c2:	mov    %eax,%r8d
   1401317c5:	test   %ax,%ax
   1401317c8:	jne    14013201d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5ad>
   1401317ce:	lea    0x680(%rsp),%rcx
   1401317d6:	lea    0x3a0(%rsp),%rdx
   1401317de:	vzeroupper
   1401317e1:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401317e6:	lea    0x398(%rsp),%rdx
   1401317ee:	lea    0x540(%rsp),%rcx
   1401317f6:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401317fb:	mov    0x540(%rsp),%rcx
   140131803:	mov    0x688(%rsp),%r9
   14013180b:	mov    0x680(%rsp),%r8
   140131813:	mov    0x548(%rsp),%rdx
   14013181b:	mov    %rcx,0x40(%rsp)
   140131820:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131825:	mov    0x40(%rsp),%rcx
   14013182a:	mov    %eax,%edi
   14013182c:	lea    0x550(%rsp),%rax
   140131834:	cmp    %rax,%rcx
   140131837:	je     14013184a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xddda>
   140131839:	mov    0x550(%rsp),%rax
   140131841:	lea    0x1(%rax),%rdx
   140131845:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013184a:	mov    0x680(%rsp),%rcx
   140131852:	lea    0x690(%rsp),%rax
   14013185a:	cmp    %rax,%rcx
   14013185d:	je     140131870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde00>
   14013185f:	mov    0x690(%rsp),%rax
   140131867:	lea    0x1(%rax),%rdx
   14013186b:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131870:	test   %edi,%edi
   140131872:	setle  %al
   140131875:	jmp    1401286b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c42>
   14013187a:	shr    $0x20,%rax
   14013187e:	mov    %eax,%edx
   140131880:	test   %ax,%ax
   140131883:	jne    14012e641 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabd1>
   140131889:	lea    0x680(%rsp),%rcx
   140131891:	lea    0x2e0(%rsp),%rdx
   140131899:	vzeroupper
   14013189c:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401318a1:	lea    0x2d8(%rsp),%rdx
   1401318a9:	lea    0x540(%rsp),%rcx
   1401318b1:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401318b6:	mov    0x540(%rsp),%rcx
   1401318be:	mov    0x688(%rsp),%r9
   1401318c6:	mov    0x680(%rsp),%r8
   1401318ce:	mov    0x548(%rsp),%rdx
   1401318d6:	mov    %rcx,0x40(%rsp)
   1401318db:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401318e0:	mov    0x40(%rsp),%rcx
   1401318e5:	mov    %eax,%edi
   1401318e7:	lea    0x550(%rsp),%rax
   1401318ef:	cmp    %rax,%rcx
   1401318f2:	je     140131905 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde95>
   1401318f4:	mov    0x550(%rsp),%rax
   1401318fc:	lea    0x1(%rax),%rdx
   140131900:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131905:	mov    0x680(%rsp),%rcx
   14013190d:	lea    0x690(%rsp),%rax
   140131915:	cmp    %rax,%rcx
   140131918:	je     14013192b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdebb>
   14013191a:	mov    0x690(%rsp),%rax
   140131922:	lea    0x1(%rax),%rdx
   140131926:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013192b:	test   %edi,%edi
   14013192d:	setg   %al
   140131930:	jmp    14012600b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259b>
   140131935:	mov    %rax,%rdx
   140131938:	shr    $0x20,%rdx
   14013193c:	cmp    $0x5,%dx
   140131940:	je     140125fe5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2575>
   140131946:	movabs $0xffffffff00000000,%rdx
   140131950:	and    %rdx,%rcx
   140131953:	jmp    14012e61f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabaf>
   140131958:	mov    %rax,%rdx
   14013195b:	shr    $0x20,%rdx
   14013195f:	cmp    $0x5,%dx
   140131963:	je     140126114 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26a4>
   140131969:	movabs $0xffffffff00000000,%rdx
   140131973:	and    %rdx,%rcx
   140131976:	jmp    14012e490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa20>
   14013197b:	lea    0x308(%rsp),%rdx
   140131983:	lea    0x540(%rsp),%rcx
   14013198b:	vzeroupper
   14013198e:	call   14021c560 <setun::VMValue::as_object() const>
   140131993:	mov    0x540(%rsp),%rax
   14013199b:	mov    0x548(%rsp),%rdi
   1401319a3:	mov    %rax,0x40(%rsp)
   1401319a8:	test   %rax,%rax
   1401319ab:	je     140134d2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112be>
   1401319b1:	test   %r12b,%r12b
   1401319b4:	je     1401351fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1178e>
   1401319ba:	cmp    $0x1,%r12b
   1401319be:	je     140137e17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143a7>
   1401319c4:	lea    0x8(%rsi),%rax
   1401319c8:	cmp    0x38(%rsp),%rax
   1401319cd:	jae    140137dc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14359>
   1401319d3:	mov    0x1d0(%rsp),%rax
   1401319db:	lea    0x680(%rsp),%r10
   1401319e3:	lea    0x310(%rsp),%rdx
   1401319eb:	mov    %r10,%rcx
   1401319ee:	mov    %r10,0x60(%rsp)
   1401319f3:	mov    %rax,(%rsi)
   1401319f6:	mov    0x1c8(%rsp),%rax
   1401319fe:	mov    %rax,0x1d0(%rsp)
   140131a06:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131a0b:	mov    0x40(%rsp),%rcx
   140131a10:	mov    0x60(%rsp),%rdx
   140131a15:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140131a1a:	mov    0x680(%rsp),%rcx
   140131a22:	mov    %rax,0x1c8(%rsp)
   140131a2a:	lea    0x690(%rsp),%rax
   140131a32:	cmp    %rax,%rcx
   140131a35:	je     140131a48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfd8>
   140131a37:	mov    0x690(%rsp),%rax
   140131a3f:	lea    0x1(%rax),%rdx
   140131a43:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131a48:	add    $0x8,%rsi
   140131a4c:	mov    $0x2,%r12d
   140131a52:	test   %rdi,%rdi
   140131a55:	je     14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140131a5b:	mov    %rdi,%rcx
   140131a5e:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140131a63:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140131a68:	mov    0x1050(%rbx),%rax
   140131a6f:	mov    %rsi,%rdi
   140131a72:	sub    %rdx,%rdi
   140131a75:	mov    %rax,%rcx
   140131a78:	sub    %rdx,%rcx
   140131a7b:	sar    $0x3,%rcx
   140131a7f:	lea    (%rcx,%rcx,1),%r9
   140131a83:	cmp    %r9,%rcx
   140131a86:	jb     140134a75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11005>
   140131a8c:	vzeroupper
   140131a8f:	jmp    14012477c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0c>
   140131a94:	test   %r12b,%r12b
   140131a97:	jne    140132d6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2fe>
   140131a9d:	movabs $0xfff8000000000003,%rax
   140131aa7:	mov    %rax,0x1c8(%rsp)
   140131aaf:	mov    $0x1,%r12d
   140131ab5:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140131aba:	nopw   0x0(%rax,%rax,1)
   140131ac0:	mov    0xa0(%rsp),%rdx
   140131ac8:	lea    0x1068(%rbx),%rcx
   140131acf:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131ad4:	jmp    1401265c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b57>
   140131ad9:	cmpb   $0x0,0x152c0(%rbx)
   140131ae0:	je     140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140131ae6:	mov    0x152c8(%rbx),%rcx
   140131aed:	test   %rcx,%rcx
   140131af0:	je     140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140131af6:	mov    0x150c0(%rbx),%rax
   140131afd:	mov    %rax,0x40(%rsp)
   140131b02:	test   %rax,%rax
   140131b05:	je     140131b1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0ac>
   140131b07:	sub    $0x1,%rax
   140131b0b:	imul   $0x28,%rax,%rax
   140131b0f:	mov    0x10e0(%rbx,%rax,1),%rax
   140131b17:	mov    %rax,0x40(%rsp)
   140131b1c:	movswq %di,%rax
   140131b20:	mov    0x40(%rsp),%rdx
   140131b25:	lea    0x2(%rbp,%rax,1),%rax
   140131b2a:	mov    %rax,0x60(%rsp)
   140131b2f:	vzeroupper
   140131b32:	call   140171c80 <setun::JITManager::record_backedge(unsigned long long)>
   140131b37:	mov    0x152c8(%rbx),%rdx
   140131b3e:	mov    0x40(%rsp),%r8
   140131b43:	lea    0x540(%rsp),%rcx
   140131b4b:	call   1401717a0 <setun::JITManager::get_or_create(unsigned long long)>
   140131b50:	mov    0x540(%rsp),%rax
   140131b58:	cmpb   $0x0,0xa8(%rax)
   140131b5f:	jne    140131ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe130>
   140131b61:	mov    0x152c8(%rbx),%rcx
   140131b68:	mov    0x88(%rcx),%edx
   140131b6e:	cmp    %edx,0xac(%rax)
   140131b74:	jae    140131b84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe114>
   140131b76:	mov    0x8c(%rcx),%edx
   140131b7c:	cmp    %edx,0xb0(%rax)
   140131b82:	jb     140131ba0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe130>
   140131b84:	mov    0x40(%rsp),%r8
   140131b89:	mov    0x8(%r14),%r9
   140131b8d:	mov    %r14,%rdx
   140131b90:	sub    (%r14),%r9
   140131b93:	call   140171a90 <setun::JITManager::compile_function(setun::Chunk const&, unsigned long long, unsigned long long)>
   140131b98:	mov    0x540(%rsp),%rax
   140131ba0:	mov    0x60(%rsp),%r9
   140131ba5:	mov    %rax,%rcx
   140131ba8:	sub    %r15,%r9
   140131bab:	mov    %r9d,%edx
   140131bae:	mov    %r9,0x60(%rsp)
   140131bb3:	call   140218de0 <setun::JITCodeObject::has_osr_entry(unsigned int) const>
   140131bb8:	mov    0x60(%rsp),%r9
   140131bbd:	test   %al,%al
   140131bbf:	je     14013434c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108dc>
   140131bc5:	lea    0x680(%rsp),%r10
   140131bcd:	xor    %eax,%eax
   140131bcf:	mov    $0x23,%ecx
   140131bd4:	mov    0x40(%rsp),%r8
   140131bd9:	mov    %r10,%rdi
   140131bdc:	rep stos %rax,(%rdi)
   140131bdf:	mov    0x1068(%rbx),%rcx
   140131be6:	movb   $0x1,0x788(%rsp)
   140131bee:	mov    %rbx,0x680(%rsp)
   140131bf6:	lea    (%rcx,%r13,8),%rdx
   140131bfa:	mov    %rdx,0x690(%rsp)
   140131c02:	mov    0x1070(%rbx),%rdx
   140131c09:	sub    %rcx,%rdx
   140131c0c:	mov    0x1048(%rbx),%rcx
   140131c13:	sar    $0x3,%rdx
   140131c17:	sub    %r13,%rdx
   140131c1a:	mov    %rcx,0x6a0(%rsp)
   140131c22:	mov    %rdx,0x698(%rsp)
   140131c2a:	mov    %rsi,%rdx
   140131c2d:	sub    %rcx,%rdx
   140131c30:	mov    0x150c0(%rbx),%rcx
   140131c37:	sar    $0x3,%rdx
   140131c3b:	mov    %rdx,0x6a8(%rsp)
   140131c43:	imul   $0x28,%rcx,%rdx
   140131c47:	test   %rcx,%rcx
   140131c4a:	mov    0x152c8(%rbx),%rcx
   140131c51:	lea    0x1098(%rbx,%rdx,1),%rdx
   140131c59:	cmove  %rax,%rdx
   140131c5d:	vmovq  %rdx,%xmm7
   140131c62:	mov    %rbx,%rdx
   140131c65:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140131c6f:	mov    %r10,0x152b8(%rbx)
   140131c76:	mov    %r10,0x20(%rsp)
   140131c7b:	vmovdqa %xmm0,0x6b0(%rsp)
   140131c84:	call   14016f910 <setun::JITManager::execute_osr(setun::VM*, unsigned long long, unsigned int, setun::JITFrame*)>
   140131c89:	mov    %rax,0x40(%rsp)
   140131c8e:	mov    0x6c8(%rsp),%rdi
   140131c96:	mov    0x6b8(%rsp),%rax
   140131c9e:	mov    0x548(%rsp),%rcx
   140131ca6:	mov    %rax,0x152b8(%rbx)
   140131cad:	test   %rdi,%rdi
   140131cb0:	jle    140136efe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1348e>
   140131cb6:	test   %rcx,%rcx
   140131cb9:	je     140131cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe250>
   140131cbb:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140131cc0:	mov    0x1060(%rbx),%rax
   140131cc7:	mov    0x1048(%rbx),%rdx
   140131cce:	mov    %edi,%edi
   140131cd0:	lea    (%r15,%rdi,1),%rbp
   140131cd4:	lea    (%rdx,%rax,8),%rsi
   140131cd8:	cmpb   $0x0,0x1040(%rbx)
   140131cdf:	je     140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140131ce5:	movzbl 0x0(%rbp),%eax
   140131ce9:	lea    0x28e3b0(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131cf0:	add    $0x1,%rbp
   140131cf4:	mov    (%rdi,%rax,8),%rax
   140131cf8:	jmp    *%rax
   140131cfa:	lea    0x15270(%rbx),%rcx
   140131d01:	mov    %rbx,%rdx
   140131d04:	vzeroupper
   140131d07:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140131d0c:	jmp    14012cf92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9522>
   140131d11:	mov    0x1050(%rbx),%rax
   140131d18:	mov    %rsi,%r12
   140131d1b:	sub    %rdx,%r12
   140131d1e:	mov    %rax,%rcx
   140131d21:	sub    %rdx,%rcx
   140131d24:	sar    $0x3,%rcx
   140131d28:	lea    (%rcx,%rcx,1),%r9
   140131d2c:	cmp    %r9,%rcx
   140131d2f:	jb     140133996 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff26>
   140131d35:	vzeroupper
   140131d38:	jmp    140129c78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6208>
   140131d3d:	test   %rax,%rax
   140131d40:	setne  %al
   140131d43:	jmp    14012e970 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf00>
   140131d48:	mov    %rax,%rbp
   140131d4b:	mov    0x1050(%rbx),%rax
   140131d52:	vzeroupper
   140131d55:	jmp    14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140131d5a:	cmp    $0x2,%r12b
   140131d5e:	je     140135261 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117f1>
   140131d64:	cmp    $0x1,%r12b
   140131d68:	jne    140137db0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14340>
   140131d6e:	mov    0x1048(%rbx),%rdx
   140131d75:	mov    0x1050(%rbx),%rax
   140131d7c:	lea    0x8(%rsi),%r8
   140131d80:	cmp    0x38(%rsp),%r8
   140131d85:	jae    140137d6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142fa>
   140131d8b:	vzeroupper
   140131d8e:	mov    0x1c8(%rsp),%rcx
   140131d96:	mov    %rcx,(%rsi)
   140131d99:	sub    %rdx,%r8
   140131d9c:	sub    %r15,%rdi
   140131d9f:	sub    %rdx,%rax
   140131da2:	mov    %r8,%rsi
   140131da5:	mov    %rdi,0x1038(%rbx)
   140131dac:	sar    $0x3,%rsi
   140131db0:	cmp    %r8,%rax
   140131db3:	jae    140131dc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe355>
   140131db5:	lea    (%rsi,%rsi,1),%rdx
   140131db9:	lea    0x1048(%rbx),%rcx
   140131dc0:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131dc5:	mov    %rsi,0x1060(%rbx)
   140131dcc:	vmovdqa 0x22ad0c(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140131dd4:	mov    $0x10,%ecx
   140131dd9:	movb   $0x0,0x153a0(%rbx)
   140131de0:	vmovdqa %xmm0,0x15390(%rbx)
   140131de8:	call   140338b60 <__cxa_allocate_exception>
   140131ded:	lea    0x680(%rsp),%r10
   140131df5:	lea    0x22a7dc(%rip),%rdx        # 14035c5d8 <.rdata+0x1018>
   140131dfc:	mov    %r10,%rcx
   140131dff:	mov    %r10,0x38(%rsp)
   140131e04:	mov    %rax,%rsi
   140131e07:	call   1400fb160 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string<std::allocator<char> >(char const*, std::allocator<char> const&) [clone .isra.0]>
   140131e0c:	mov    0x38(%rsp),%rdx
   140131e11:	mov    %rsi,%rcx
   140131e14:	call   1402d0800 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131e19:	lea    0x246b00(%rip),%rax        # 140378920 <vtable for setun::VMException+0x10>
   140131e20:	mov    0x680(%rsp),%rcx
   140131e28:	mov    %rax,(%rsi)
   140131e2b:	lea    0x690(%rsp),%rax
   140131e33:	cmp    %rax,%rcx
   140131e36:	je     140137c52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141e2>
   140131e3c:	mov    0x690(%rsp),%rax
   140131e44:	lea    0x1(%rax),%rdx
   140131e48:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140131e4d:	jmp    140137c52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141e2>
   140131e52:	nopw   0x0(%rax,%rax,1)
   140131e58:	test   %rax,%rax
   140131e5b:	setne  %al
   140131e5e:	jmp    14012ea13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafa3>
   140131e63:	mov    0x1048(%rbx),%rdx
   140131e6a:	mov    %rsi,%rax
   140131e6d:	sub    %rdx,%rax
   140131e70:	mov    %rax,0x60(%rsp)
   140131e75:	mov    0x1050(%rbx),%rax
   140131e7c:	mov    %rax,0x38(%rsp)
   140131e81:	sub    %rdx,%rax
   140131e84:	sar    $0x3,%rax
   140131e88:	lea    (%rax,%rax,1),%rdx
   140131e8c:	cmp    %rdx,%rax
   140131e8f:	jae    140124cc0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1250>
   140131e95:	lea    0x1048(%rbx),%rcx
   140131e9c:	vzeroupper
   140131e9f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131ea4:	mov    0x1050(%rbx),%rax
   140131eab:	mov    0x60(%rsp),%rsi
   140131eb0:	add    0x1048(%rbx),%rsi
   140131eb7:	mov    %rax,0x38(%rsp)
   140131ebc:	lea    0x8(%rsi),%r8
   140131ec0:	jmp    140124cc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1253>
   140131ec5:	mov    0x1048(%rbx),%rdx
   140131ecc:	lea    0x8(%rsi),%r8
   140131ed0:	cmp    0x38(%rsp),%r8
   140131ed5:	jae    14013794d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13edd>
   140131edb:	mov    0x1c8(%rsp),%rax
   140131ee3:	mov    %rax,(%rsi)
   140131ee6:	mov    %r8,%rsi
   140131ee9:	mov    0x1068(%rbx),%r8
   140131ef0:	jmp    1401264cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   140131ef5:	test   %r12b,%r12b
   140131ef8:	jne    14013344a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9da>
   140131efe:	mov    0x60(%rdi),%rcx
   140131f02:	mov    0x50(%rdi),%rdx
   140131f06:	xor    %eax,%eax
   140131f08:	sub    0x48(%rdi),%rdx
   140131f0c:	sar    $0x3,%rdx
   140131f10:	test   %rcx,%rcx
   140131f13:	je     140131f19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4a9>
   140131f15:	mov    0x18(%rcx),%rax
   140131f19:	add    %rax,%rdx
   140131f1c:	lea    0x680(%rsp),%rcx
   140131f24:	mov    $0x1,%r12d
   140131f2a:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140131f2f:	mov    0x680(%rsp),%rax
   140131f37:	mov    %rax,0x1c8(%rsp)
   140131f3f:	cmpb   $0x0,0x1040(%rbx)
   140131f46:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   140131f4c:	movzbl 0x2(%rbp),%eax
   140131f50:	lea    0x28e149(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131f57:	add    $0x3,%rbp
   140131f5b:	mov    (%rdi,%rax,8),%rax
   140131f5f:	jmp    *%rax
   140131f61:	shr    $0x20,%rdx
   140131f65:	mov    %edx,%r8d
   140131f68:	test   %dx,%dx
   140131f6b:	je     140131712 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdca2>
   140131f71:	movabs $0xfffd000100000000,%rax
   140131f7b:	cmp    %rax,%rcx
   140131f7e:	je     14012c19c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x872c>
   140131f84:	cmp    $0x1,%r8w
   140131f89:	jne    14012894e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ede>
   140131f8f:	jmp    14012c19c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x872c>
   140131f94:	shr    $0x20,%rdx
   140131f98:	mov    %edx,%r8d
   140131f9b:	test   %dx,%dx
   140131f9e:	je     140131654 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbe4>
   140131fa4:	movabs $0xfffd000100000000,%rax
   140131fae:	cmp    %rax,%rcx
   140131fb1:	je     14012c2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8849>
   140131fb7:	cmp    $0x1,%r8w
   140131fbc:	jne    140128aae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x503e>
   140131fc2:	jmp    14012c2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8849>
   140131fc7:	shr    $0x20,%rdx
   140131fcb:	mov    %edx,%r8d
   140131fce:	test   %dx,%dx
   140131fd1:	je     140131598 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb28>
   140131fd7:	movabs $0xfffd000100000000,%rax
   140131fe1:	cmp    %rax,%rcx
   140131fe4:	je     14012c081 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8611>
   140131fea:	cmp    $0x1,%r8w
   140131fef:	jne    14012852c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4abc>
   140131ff5:	jmp    14012c081 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8611>
   140131ffa:	shr    $0x20,%rdx
   140131ffe:	mov    %edx,%r8d
   140132001:	test   %dx,%dx
   140132004:	je     1401317ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd5e>
   14013200a:	movabs $0xfffd000100000000,%rax
   140132014:	cmp    %rax,%rcx
   140132017:	je     14012c3d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8966>
   14013201d:	cmp    $0x1,%r8w
   140132022:	jne    14012868c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c1c>
   140132028:	jmp    14012c3d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8966>
   14013202d:	mov    0x1048(%rbx),%rdx
   140132034:	mov    %rsi,%rax
   140132037:	sub    %rdx,%rax
   14013203a:	mov    %rax,0x60(%rsp)
   14013203f:	mov    0x1050(%rbx),%rax
   140132046:	mov    %rax,0x38(%rsp)
   14013204b:	sub    %rdx,%rax
   14013204e:	sar    $0x3,%rax
   140132052:	lea    (%rax,%rax,1),%rdx
   140132056:	cmp    %rdx,%rax
   140132059:	jae    140124ddf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136f>
   14013205f:	vmovdqa %xmm0,0x80(%rsp)
   140132068:	lea    0x1048(%rbx),%rcx
   14013206f:	vzeroupper
   140132072:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132077:	mov    0x1050(%rbx),%rax
   14013207e:	mov    0x60(%rsp),%rsi
   140132083:	vmovdqa 0x80(%rsp),%xmm0
   14013208c:	add    0x1048(%rbx),%rsi
   140132093:	mov    %rax,0x38(%rsp)
   140132098:	lea    0x8(%rsi),%r8
   14013209c:	jmp    140124de2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1372>
   1401320a1:	movabs $0xfff8000000000000,%rax
   1401320ab:	mov    %rax,0x1c8(%rsp)
   1401320b3:	mov    $0x1,%r12d
   1401320b9:	jmp    14012f397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb927>
   1401320be:	shr    $0x20,%rdx
   1401320c2:	mov    %edx,%r8d
   1401320c5:	test   %dx,%dx
   1401320c8:	je     1401314e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda75>
   1401320ce:	movabs $0xfffd000100000000,%rax
   1401320d8:	cmp    %rax,%rcx
   1401320db:	je     14012c4f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a83>
   1401320e1:	cmp    $0x1,%r8w
   1401320e6:	jne    1401287ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d7c>
   1401320ec:	jmp    14012c4f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a83>
   1401320f1:	shr    $0x20,%rax
   1401320f5:	mov    %eax,%ecx
   1401320f7:	test   %ax,%ax
   1401320fa:	je     1401311f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd781>
   140132100:	movabs $0xfffd000100000000,%rax
   14013210a:	cmp    %rax,%rdx
   14013210d:	je     14012a7e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d70>
   140132113:	cmp    $0x1,%cx
   140132117:	jne    140125c58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x21e8>
   14013211d:	jmp    14012a7e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d70>
   140132122:	cmp    $0x1,%rax
   140132126:	je     140135f33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124c3>
   14013212c:	cmp    $0x2,%rax
   140132130:	je     140135ee9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12479>
   140132136:	test   %r12b,%r12b
   140132139:	je     14012a12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66be>
   14013213f:	sub    $0x1,%r12b
   140132143:	je     14013028d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc81d>
   140132149:	lea    0x8(%rsi),%r8
   14013214d:	cmp    0x38(%rsp),%r8
   140132152:	jb     14012d933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ec3>
   140132158:	mov    0x1050(%rbx),%rax
   14013215f:	mov    0x1048(%rbx),%rdx
   140132166:	mov    %rax,0x38(%rsp)
   14013216b:	sub    %rdx,%rax
   14013216e:	sar    $0x3,%rax
   140132172:	lea    (%rax,%rax,1),%rcx
   140132176:	cmp    %rcx,%rax
   140132179:	jae    14012d933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ec3>
   14013217f:	sub    %rdx,%rsi
   140132182:	mov    %rcx,%rdx
   140132185:	lea    0x1048(%rbx),%rcx
   14013218c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132191:	mov    0x1050(%rbx),%rax
   140132198:	add    0x1048(%rbx),%rsi
   14013219f:	lea    0x8(%rsi),%r8
   1401321a3:	mov    %rax,0x38(%rsp)
   1401321a8:	jmp    14012d933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ec3>
   1401321ad:	mov    0x1050(%rbx),%rax
   1401321b4:	mov    %rsi,%r12
   1401321b7:	sub    %rdx,%r12
   1401321ba:	mov    %rax,%rcx
   1401321bd:	sub    %rdx,%rcx
   1401321c0:	sar    $0x3,%rcx
   1401321c4:	lea    (%rcx,%rcx,1),%r9
   1401321c8:	cmp    %r9,%rcx
   1401321cb:	jb     140134b5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110ea>
   1401321d1:	vzeroupper
   1401321d4:	jmp    14012b91f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eaf>
   1401321d9:	lea    (%rax,%rax,1),%rdx
   1401321dd:	lea    0x1068(%rbx),%rcx
   1401321e4:	vzeroupper
   1401321e7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401321ec:	jmp    14012ce58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93e8>
   1401321f1:	mov    0x1c8(%rsp),%rax
   1401321f9:	sub    $0x8,%rsi
   1401321fd:	mov    %rax,0x2e0(%rsp)
   140132205:	mov    (%rsi),%rax
   140132208:	mov    %rax,0x2d8(%rsp)
   140132210:	mov    %rax,%rcx
   140132213:	jmp    140125f63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24f3>
   140132218:	mov    0x1050(%rbx),%rax
   14013221f:	mov    %rsi,%r12
   140132222:	sub    %rdx,%r12
   140132225:	mov    %rax,%rcx
   140132228:	sub    %rdx,%rcx
   14013222b:	sar    $0x3,%rcx
   14013222f:	lea    (%rcx,%rcx,1),%r9
   140132233:	cmp    %r9,%rcx
   140132236:	jb     140134b2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110bd>
   14013223c:	vzeroupper
   14013223f:	jmp    14012ac43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d3>
   140132244:	mov    0x1c8(%rsp),%rdx
   14013224c:	mov    $0x1,%r12d
   140132252:	mov    %rdx,(%rax,%rdi,8)
   140132256:	mov    0x1d0(%rsp),%rax
   14013225e:	mov    %rax,0x1c8(%rsp)
   140132266:	jmp    14012778d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d1d>
   14013226b:	mov    0x1c8(%rsp),%rax
   140132273:	sub    $0x8,%rsi
   140132277:	mov    %rax,0x370(%rsp)
   14013227f:	mov    (%rsi),%rax
   140132282:	mov    %rax,0x368(%rsp)
   14013228a:	jmp    140128300 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4890>
   14013228f:	cmp    $0x1,%rax
   140132293:	je     140135303 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11893>
   140132299:	cmp    $0x2,%rax
   14013229d:	jne    14012feda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc46a>
   1401322a3:	test   %r12b,%r12b
   1401322a6:	je     140138357 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148e7>
   1401322ac:	sub    $0x1,%r12b
   1401322b0:	je     140138322 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148b2>
   1401322b6:	lea    0x8(%rsi),%r8
   1401322ba:	cmp    0x38(%rsp),%r8
   1401322bf:	jae    1401382d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14860>
   1401322c5:	mov    0x1d0(%rsp),%rax
   1401322cd:	mov    %r8,0x40(%rsp)
   1401322d2:	movslq %edi,%rdx
   1401322d5:	mov    %rax,(%rsi)
   1401322d8:	mov    0x1c8(%rsp),%rax
   1401322e0:	mov    %rax,0x1d0(%rsp)
   1401322e8:	jmp    140130b2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0bb>
   1401322ed:	mov    0x1050(%rbx),%rax
   1401322f4:	mov    %rsi,%r12
   1401322f7:	sub    %rdx,%r12
   1401322fa:	mov    %rax,%rcx
   1401322fd:	sub    %rdx,%rcx
   140132300:	sar    $0x3,%rcx
   140132304:	lea    (%rcx,%rcx,1),%r9
   140132308:	cmp    %r9,%rcx
   14013230b:	jb     1401343da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1096a>
   140132311:	vzeroupper
   140132314:	jmp    14012b45a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ea>
   140132319:	mov    0x1c8(%rsp),%rax
   140132321:	sub    $0x8,%rsi
   140132325:	mov    %rax,0x240(%rsp)
   14013232d:	mov    (%rsi),%rax
   140132330:	mov    %rax,0x238(%rsp)
   140132338:	jmp    1401255e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b78>
   14013233d:	mov    0x1050(%rbx),%rax
   140132344:	mov    %rsi,%r12
   140132347:	sub    %rdx,%r12
   14013234a:	mov    %rax,%rcx
   14013234d:	sub    %rdx,%rcx
   140132350:	sar    $0x3,%rcx
   140132354:	lea    (%rcx,%rcx,1),%r9
   140132358:	cmp    %r9,%rcx
   14013235b:	jb     1401342c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10857>
   140132361:	vzeroupper
   140132364:	jmp    14012ae5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73eb>
   140132369:	mov    0x1050(%rbx),%rax
   140132370:	mov    %rsi,%r12
   140132373:	sub    %rdx,%r12
   140132376:	mov    %rax,%rcx
   140132379:	sub    %rdx,%rcx
   14013237c:	sar    $0x3,%rcx
   140132380:	lea    (%rcx,%rcx,1),%r9
   140132384:	cmp    %r9,%rcx
   140132387:	jb     140134aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11032>
   14013238d:	vzeroupper
   140132390:	jmp    14012b07e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x760e>
   140132395:	mov    0x1050(%rbx),%rax
   14013239c:	mov    %rsi,%r12
   14013239f:	sub    %rdx,%r12
   1401323a2:	mov    %rax,%rcx
   1401323a5:	sub    %rdx,%rcx
   1401323a8:	sar    $0x3,%rcx
   1401323ac:	lea    (%rcx,%rcx,1),%r9
   1401323b0:	cmp    %r9,%rcx
   1401323b3:	jb     140134561 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10af1>
   1401323b9:	vzeroupper
   1401323bc:	jmp    14012abc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7155>
   1401323c1:	mov    0x1050(%rbx),%rax
   1401323c8:	mov    %rsi,%r12
   1401323cb:	sub    %rdx,%r12
   1401323ce:	mov    %rax,%rcx
   1401323d1:	sub    %rdx,%rcx
   1401323d4:	sar    $0x3,%rcx
   1401323d8:	lea    (%rcx,%rcx,1),%r9
   1401323dc:	cmp    %r9,%rcx
   1401323df:	jb     140134534 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ac4>
   1401323e5:	vzeroupper
   1401323e8:	jmp    14012ad5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72ef>
   1401323ed:	mov    0x1048(%rbx),%rcx
   1401323f4:	mov    0x1050(%rbx),%rax
   1401323fb:	mov    %rsi,%r12
   1401323fe:	mov    %rax,0x38(%rsp)
   140132403:	sub    %rcx,%rax
   140132406:	sub    %rcx,%r12
   140132409:	mov    %rax,%rdx
   14013240c:	sar    $0x3,%rdx
   140132410:	lea    (%rdx,%rdx,1),%rcx
   140132414:	cmp    %rcx,%rdx
   140132417:	jae    14012aa12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fa2>
   14013241d:	mov    %r9b,0x40(%rsp)
   140132422:	mov    %rcx,%rdx
   140132425:	lea    0x1048(%rbx),%rcx
   14013242c:	vzeroupper
   14013242f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132434:	mov    0x1048(%rbx),%rsi
   14013243b:	mov    0x1050(%rbx),%rax
   140132442:	movzbl 0x40(%rsp),%r9d
   140132448:	add    %r12,%rsi
   14013244b:	mov    %rax,0x38(%rsp)
   140132450:	lea    0x10(%rsi),%r8
   140132454:	jmp    14012aa12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fa2>
   140132459:	mov    0x1050(%rbx),%rax
   140132460:	mov    %rsi,%r12
   140132463:	sub    %rdx,%r12
   140132466:	mov    %rax,%rcx
   140132469:	sub    %rdx,%rcx
   14013246c:	sar    $0x3,%rcx
   140132470:	lea    (%rcx,%rcx,1),%r9
   140132474:	cmp    %r9,%rcx
   140132477:	jb     14013458e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b1e>
   14013247d:	vzeroupper
   140132480:	jmp    14012af54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74e4>
   140132485:	mov    0x1048(%rbx),%rdx
   14013248c:	mov    0x1050(%rbx),%rax
   140132493:	lea    0x10(%rsi),%r8
   140132497:	cmp    0x38(%rsp),%r8
   14013249c:	jae    140136aba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1304a>
   1401324a2:	mov    0x1d0(%rsp),%rcx
   1401324aa:	mov    %rcx,(%rsi)
   1401324ad:	mov    0x1c8(%rsp),%rcx
   1401324b5:	mov    %rcx,0x8(%rsi)
   1401324b9:	jmp    14012f9ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf3c>
   1401324be:	mov    0x1c8(%rsp),%rax
   1401324c6:	sub    $0x8,%rsi
   1401324ca:	mov    %rax,0x3a0(%rsp)
   1401324d2:	mov    (%rsi),%rax
   1401324d5:	mov    %rax,0x398(%rsp)
   1401324dd:	jmp    1401285d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b66>
   1401324e2:	mov    0x1c8(%rsp),%rax
   1401324ea:	sub    $0x8,%rsi
   1401324ee:	mov    %rax,0x230(%rsp)
   1401324f6:	mov    (%rsi),%rax
   1401324f9:	mov    %rax,0x228(%rsp)
   140132501:	jmp    14012555c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1aec>
   140132506:	mov    0x1048(%rbx),%rdx
   14013250d:	mov    0x1050(%rbx),%rax
   140132514:	mov    %rsi,%rdi
   140132517:	mov    %rax,0x38(%rsp)
   14013251c:	sub    %rdx,%rax
   14013251f:	sub    %rdx,%rdi
   140132522:	sar    $0x3,%rax
   140132526:	lea    (%rax,%rax,1),%rdx
   14013252a:	cmp    %rdx,%rax
   14013252d:	jae    140124f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1516>
   140132533:	lea    0x1048(%rbx),%rcx
   14013253a:	vzeroupper
   14013253d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132542:	mov    0x1050(%rbx),%rax
   140132549:	add    0x1048(%rbx),%rdi
   140132550:	mov    %rdi,%rsi
   140132553:	lea    0x8(%rdi),%r8
   140132557:	mov    %rax,0x38(%rsp)
   14013255c:	jmp    140124f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1516>
   140132561:	mov    0x1048(%rbx),%rdx
   140132568:	mov    %rsi,%rcx
   14013256b:	sub    %rdx,%rcx
   14013256e:	mov    %rcx,0x40(%rsp)
   140132573:	mov    0x1050(%rbx),%rcx
   14013257a:	mov    %rcx,0x38(%rsp)
   14013257f:	sub    %rdx,%rcx
   140132582:	sar    $0x3,%rcx
   140132586:	mov    %rcx,%rdx
   140132589:	lea    (%rcx,%rcx,1),%rcx
   14013258d:	cmp    %rcx,%rdx
   140132590:	jae    140124d54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e4>
   140132596:	mov    %eax,0x60(%rsp)
   14013259a:	mov    %rcx,%rdx
   14013259d:	lea    0x1048(%rbx),%rcx
   1401325a4:	vzeroupper
   1401325a7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401325ac:	mov    0x1050(%rbx),%rax
   1401325b3:	mov    0x40(%rsp),%rsi
   1401325b8:	add    0x1048(%rbx),%rsi
   1401325bf:	mov    %rax,0x38(%rsp)
   1401325c4:	lea    0x8(%rsi),%r8
   1401325c8:	mov    0x60(%rsp),%eax
   1401325cc:	jmp    140124d54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e4>
   1401325d1:	lea    0x680(%rsp),%rcx
   1401325d9:	lea    0x3e0(%rsp),%rdx
   1401325e1:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401325e6:	mov    0x688(%rsp),%rdx
   1401325ee:	lea    0x540(%rsp),%rcx
   1401325f6:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401325fb:	mov    0x540(%rsp),%rax
   140132603:	mov    0x680(%rsp),%rcx
   14013260b:	mov    %rax,0x1c8(%rsp)
   140132613:	lea    0x690(%rsp),%rax
   14013261b:	cmp    %rax,%rcx
   14013261e:	je     140132631 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebc1>
   140132620:	mov    0x690(%rsp),%rax
   140132628:	lea    0x1(%rax),%rdx
   14013262c:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140132631:	mov    $0x1,%r12d
   140132637:	jmp    14012d8d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e63>
   14013263c:	mov    0x1c8(%rsp),%rax
   140132644:	sub    $0x8,%rsi
   140132648:	mov    %rax,0x280(%rsp)
   140132650:	mov    (%rsi),%rax
   140132653:	mov    %rax,0x278(%rsp)
   14013265b:	jmp    140125860 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1df0>
   140132660:	shr    $0x20,%rax
   140132664:	cmp    $0x1,%ax
   140132668:	je     140134ca8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11238>
   14013266e:	cmp    $0x5,%ax
   140132672:	jne    140130c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd227>
   140132678:	mov    %r11,%rcx
   14013267b:	mov    %r8,0x40(%rsp)
   140132680:	call   14021aa80 <setun::VMValue::as_int() const>
   140132685:	jmp    140130ca9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd239>
   14013268a:	shr    $0x20,%rax
   14013268e:	cmp    $0x1,%ax
   140132692:	je     140134d02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11292>
   140132698:	cmp    $0x5,%ax
   14013269c:	jne    140130c1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1af>
   1401326a2:	mov    %r9,%rcx
   1401326a5:	mov    %r11,0x40(%rsp)
   1401326aa:	call   14021aa80 <setun::VMValue::as_int() const>
   1401326af:	jmp    140130c31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1c1>
   1401326b4:	shr    $0x20,%rax
   1401326b8:	cmp    $0x1,%ax
   1401326bc:	je     140134367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108f7>
   1401326c2:	cmp    $0x5,%ax
   1401326c6:	jne    14012fb9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12d>
   1401326cc:	mov    0x60(%rsp),%rcx
   1401326d1:	call   14021aa80 <setun::VMValue::as_int() const>
   1401326d6:	lea    0x520(%rsp),%r8
   1401326de:	movq   $0x0,0x528(%rsp)
   1401326ea:	mov    %rax,0x520(%rsp)
   1401326f2:	movq   $0x0,0x530(%rsp)
   1401326fe:	jmp    14012fbd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc164>
   140132703:	shr    $0x20,%rax
   140132707:	cmp    $0x1,%ax
   14013270b:	je     14013438b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1091b>
   140132711:	cmp    $0x5,%ax
   140132715:	jne    14012fb22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0b2>
   14013271b:	mov    %r11,%rcx
   14013271e:	vzeroupper
   140132721:	call   14021aa80 <setun::VMValue::as_int() const>
   140132726:	jmp    14012fb32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0c2>
   14013272b:	shr    $0x20,%rax
   14013272f:	cmp    $0x1,%ax
   140132733:	je     140134cd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11264>
   140132739:	cmp    $0x5,%ax
   14013273d:	jne    14012fc0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc19f>
   140132743:	mov    0x40(%rsp),%rcx
   140132748:	mov    %r8,0x60(%rsp)
   14013274d:	call   14021aa80 <setun::VMValue::as_int() const>
   140132752:	jmp    14012fc23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1b3>
   140132757:	shr    $0x20,%rax
   14013275b:	cmp    $0x1,%ax
   14013275f:	je     140133d37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102c7>
   140132765:	cmp    $0x5,%ax
   140132769:	jne    140130b95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd125>
   14013276f:	mov    %r10,%rcx
   140132772:	mov    %r9,0x60(%rsp)
   140132777:	mov    %r11,0x40(%rsp)
   14013277c:	call   14021aa80 <setun::VMValue::as_int() const>
   140132781:	mov    0x40(%rsp),%r11
   140132786:	mov    0x60(%rsp),%r9
   14013278b:	movq   $0x0,0x508(%rsp)
   140132797:	mov    %rax,0x500(%rsp)
   14013279f:	lea    0x500(%rsp),%rax
   1401327a7:	movq   $0x0,0x510(%rsp)
   1401327b3:	mov    %rax,0x80(%rsp)
   1401327bb:	jmp    140130be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd176>
   1401327c0:	cmp    $0x1,%r12b
   1401327c4:	je     140134c5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x111ee>
   1401327ca:	lea    0x8(%rsi),%r8
   1401327ce:	cmp    0x38(%rsp),%r8
   1401327d3:	jae    1401367c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d58>
   1401327d9:	mov    0x1d0(%rsp),%rax
   1401327e1:	xor    %edx,%edx
   1401327e3:	mov    %rax,(%rsi)
   1401327e6:	mov    0x1c8(%rsp),%rax
   1401327ee:	mov    %rax,0x1d0(%rsp)
   1401327f6:	test   %rdi,%rdi
   1401327f9:	je     140132810 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeda0>
   1401327fb:	mov    %rdi,%rcx
   1401327fe:	mov    %r8,0x40(%rsp)
   140132803:	call   140147380 <setun::ArrayObject::size() const>
   140132808:	mov    0x40(%rsp),%r8
   14013280d:	mov    %rax,%rdx
   140132810:	lea    0x680(%rsp),%rcx
   140132818:	mov    %r8,0x40(%rsp)
   14013281d:	mov    $0x2,%r12d
   140132823:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140132828:	mov    0x680(%rsp),%rax
   140132830:	mov    0x40(%rsp),%rsi
   140132835:	mov    %rax,0x1c8(%rsp)
   14013283d:	jmp    14012ffca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc55a>
   140132842:	lea    0x680(%rsp),%rcx
   14013284a:	lea    0x229274(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140132851:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   140132856:	mov    0x680(%rsp),%rax
   14013285e:	mov    %rax,0x1c8(%rsp)
   140132866:	mov    $0x1,%r12d
   14013286c:	jmp    14012c69b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   140132871:	mov    0x1050(%rbx),%rax
   140132878:	mov    %rsi,%r12
   14013287b:	sub    %rdx,%r12
   14013287e:	mov    %rax,%rcx
   140132881:	sub    %rdx,%rcx
   140132884:	sar    $0x3,%rcx
   140132888:	lea    (%rcx,%rcx,1),%r9
   14013288c:	cmp    %r9,%rcx
   14013288f:	jb     1401357ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d3c>
   140132895:	vzeroupper
   140132898:	jmp    14012b499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a29>
   14013289d:	mov    0x1050(%rbx),%rax
   1401328a4:	mov    %rsi,%r12
   1401328a7:	sub    %rdx,%r12
   1401328aa:	mov    %rax,%rcx
   1401328ad:	sub    %rdx,%rcx
   1401328b0:	sar    $0x3,%rcx
   1401328b4:	lea    (%rcx,%rcx,1),%r9
   1401328b8:	cmp    %r9,%rcx
   1401328bb:	jb     1401339c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff53>
   1401328c1:	vzeroupper
   1401328c4:	jmp    14012bd25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82b5>
   1401328c9:	mov    0x1050(%rbx),%rcx
   1401328d0:	mov    0x1048(%rbx),%rax
   1401328d7:	mov    %rcx,0x38(%rsp)
   1401328dc:	sub    %rax,%rcx
   1401328df:	sar    $0x3,%rcx
   1401328e3:	lea    (%rcx,%rcx,1),%rdx
   1401328e7:	cmp    %rdx,%rcx
   1401328ea:	jae    14012d022 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95b2>
   1401328f0:	lea    0x1048(%rbx),%rcx
   1401328f7:	sub    %rax,%rsi
   1401328fa:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401328ff:	mov    0x1050(%rbx),%rax
   140132906:	add    0x1048(%rbx),%rsi
   14013290d:	lea    0x8(%rsi),%r8
   140132911:	mov    %rax,0x38(%rsp)
   140132916:	jmp    14012d022 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95b2>
   14013291b:	mov    0x1048(%rbx),%rdx
   140132922:	mov    %rsi,%rcx
   140132925:	sub    %rdx,%rcx
   140132928:	mov    %rcx,0x40(%rsp)
   14013292d:	mov    0x1050(%rbx),%rcx
   140132934:	mov    %rcx,0x38(%rsp)
   140132939:	sub    %rdx,%rcx
   14013293c:	mov    %rcx,%rdx
   14013293f:	sar    $0x3,%rdx
   140132943:	lea    (%rdx,%rdx,1),%rcx
   140132947:	cmp    %rcx,%rdx
   14013294a:	jae    14012a5c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b59>
   140132950:	mov    %rax,0x60(%rsp)
   140132955:	mov    %rcx,%rdx
   140132958:	lea    0x1048(%rbx),%rcx
   14013295f:	vzeroupper
   140132962:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132967:	mov    0x1050(%rbx),%rax
   14013296e:	mov    0x40(%rsp),%rsi
   140132973:	add    0x1048(%rbx),%rsi
   14013297a:	mov    %rax,0x38(%rsp)
   14013297f:	lea    0x8(%rsi),%r8
   140132983:	mov    0x60(%rsp),%rax
   140132988:	jmp    14012a5c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b59>
   14013298d:	mov    0x1048(%rbx),%rdx
   140132994:	mov    %rsi,%rcx
   140132997:	sub    %rdx,%rcx
   14013299a:	mov    %rcx,0x40(%rsp)
   14013299f:	mov    0x1050(%rbx),%rcx
   1401329a6:	mov    %rcx,0x38(%rsp)
   1401329ab:	sub    %rdx,%rcx
   1401329ae:	mov    %rcx,%rdx
   1401329b1:	sar    $0x3,%rdx
   1401329b5:	lea    (%rdx,%rdx,1),%rcx
   1401329b9:	cmp    %rcx,%rdx
   1401329bc:	jae    14012511c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ac>
   1401329c2:	mov    %rax,0x60(%rsp)
   1401329c7:	mov    %rcx,%rdx
   1401329ca:	lea    0x1048(%rbx),%rcx
   1401329d1:	vzeroupper
   1401329d4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401329d9:	mov    0x1050(%rbx),%rax
   1401329e0:	mov    0x40(%rsp),%rsi
   1401329e5:	add    0x1048(%rbx),%rsi
   1401329ec:	mov    %rax,0x38(%rsp)
   1401329f1:	lea    0x8(%rsi),%r8
   1401329f5:	mov    0x60(%rsp),%rax
   1401329fa:	jmp    14012511c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16ac>
   1401329ff:	mov    0x1050(%rbx),%rax
   140132a06:	mov    %rsi,%rbp
   140132a09:	sub    %rdx,%rbp
   140132a0c:	mov    %rax,%rcx
   140132a0f:	sub    %rdx,%rcx
   140132a12:	sar    $0x3,%rcx
   140132a16:	lea    (%rcx,%rcx,1),%r10
   140132a1a:	cmp    %r10,%rcx
   140132a1d:	jae    14012d7a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d32>
   140132a23:	mov    %r10,%rdx
   140132a26:	lea    0x1048(%rbx),%rcx
   140132a2d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132a32:	mov    0x1048(%rbx),%rdx
   140132a39:	mov    0x1050(%rbx),%rax
   140132a40:	lea    (%rdx,%rbp,1),%rsi
   140132a44:	lea    0x10(%rsi),%r8
   140132a48:	jmp    14012d7a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d32>
   140132a4d:	mov    0x1c8(%rsp),%rax
   140132a55:	sub    $0x8,%rsi
   140132a59:	mov    %rax,0x200(%rsp)
   140132a61:	mov    (%rsi),%rax
   140132a64:	mov    %rax,0x1f8(%rsp)
   140132a6c:	jmp    14012538d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x191d>
   140132a71:	mov    0x1050(%rbx),%rax
   140132a78:	mov    %rsi,%r12
   140132a7b:	sub    %rdx,%r12
   140132a7e:	mov    %rax,%rcx
   140132a81:	sub    %rdx,%rcx
   140132a84:	sar    $0x3,%rcx
   140132a88:	lea    (%rcx,%rcx,1),%r9
   140132a8c:	cmp    %r9,%rcx
   140132a8f:	jb     140135bec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1217c>
   140132a95:	vzeroupper
   140132a98:	jmp    14012b03f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75cf>
   140132a9d:	mov    0x1050(%rbx),%rax
   140132aa4:	mov    %rsi,%r12
   140132aa7:	sub    %rdx,%r12
   140132aaa:	mov    %rax,%rcx
   140132aad:	sub    %rdx,%rcx
   140132ab0:	sar    $0x3,%rcx
   140132ab4:	lea    (%rcx,%rcx,1),%r9
   140132ab8:	cmp    %r9,%rcx
   140132abb:	jae    14012b138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76c8>
   140132ac1:	mov    %r9,%rdx
   140132ac4:	lea    0x1048(%rbx),%rcx
   140132acb:	vzeroupper
   140132ace:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132ad3:	mov    0x1048(%rbx),%rdx
   140132ada:	mov    0x1050(%rbx),%rax
   140132ae1:	lea    (%rdx,%r12,1),%rsi
   140132ae5:	lea    0x10(%rsi),%r8
   140132ae9:	jmp    14012b138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76c8>
   140132aee:	mov    0x1050(%rbx),%rax
   140132af5:	mov    %rsi,%r12
   140132af8:	sub    %rdx,%r12
   140132afb:	mov    %rax,%rcx
   140132afe:	sub    %rdx,%rcx
   140132b01:	sar    $0x3,%rcx
   140132b05:	lea    (%rcx,%rcx,1),%r9
   140132b09:	cmp    %r9,%rcx
   140132b0c:	jb     140135805 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d95>
   140132b12:	vzeroupper
   140132b15:	jmp    14012ab86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7116>
   140132b1a:	mov    0x1050(%rbx),%rax
   140132b21:	mov    %rsi,%r12
   140132b24:	sub    %rdx,%r12
   140132b27:	mov    %rax,%rcx
   140132b2a:	sub    %rdx,%rcx
   140132b2d:	sar    $0x3,%rcx
   140132b31:	lea    (%rcx,%rcx,1),%r9
   140132b35:	cmp    %r9,%rcx
   140132b38:	jb     140135ddf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1236f>
   140132b3e:	vzeroupper
   140132b41:	jmp    14012af18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74a8>
   140132b46:	mov    0x1c8(%rsp),%rax
   140132b4e:	sub    $0x8,%rsi
   140132b52:	mov    %rax,0x1e0(%rsp)
   140132b5a:	mov    (%rsi),%rax
   140132b5d:	mov    %rax,0x1d8(%rsp)
   140132b65:	jmp    14012521f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17af>
   140132b6a:	lea    0x680(%rsp),%rcx
   140132b72:	lea    0x228f4c(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140132b79:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   140132b7e:	mov    0x680(%rsp),%rax
   140132b86:	mov    %rax,0x1c8(%rsp)
   140132b8e:	mov    $0x1,%r12d
   140132b94:	jmp    14012c7ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d7d>
   140132b99:	mov    0x1c8(%rsp),%rdx
   140132ba1:	mov    $0x1,%r12d
   140132ba7:	mov    %rdx,0x10(%rax,%r13,8)
   140132bac:	mov    0x1d0(%rsp),%rax
   140132bb4:	mov    %rax,0x1c8(%rsp)
   140132bbc:	jmp    140127dc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4358>
   140132bc1:	mov    0x1c8(%rsp),%rax
   140132bc9:	sub    $0x8,%rsi
   140132bcd:	mov    %rax,0x270(%rsp)
   140132bd5:	mov    (%rsi),%rax
   140132bd8:	mov    %rax,0x268(%rsp)
   140132be0:	jmp    14012578c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d1c>
   140132be5:	mov    0x1048(%rbx),%rdx
   140132bec:	mov    %rsi,%rcx
   140132bef:	sub    %rdx,%rcx
   140132bf2:	mov    %rcx,0x40(%rsp)
   140132bf7:	mov    0x1050(%rbx),%rcx
   140132bfe:	mov    %rcx,0x38(%rsp)
   140132c03:	sub    %rdx,%rcx
   140132c06:	mov    %rcx,%rdx
   140132c09:	sar    $0x3,%rdx
   140132c0d:	lea    (%rdx,%rdx,1),%rcx
   140132c11:	cmp    %rcx,%rdx
   140132c14:	jae    14012a651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6be1>
   140132c1a:	mov    %al,0x60(%rsp)
   140132c1e:	mov    %rcx,%rdx
   140132c21:	lea    0x1048(%rbx),%rcx
   140132c28:	vzeroupper
   140132c2b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132c30:	mov    0x1050(%rbx),%rax
   140132c37:	mov    0x40(%rsp),%rsi
   140132c3c:	add    0x1048(%rbx),%rsi
   140132c43:	mov    %rax,0x38(%rsp)
   140132c48:	lea    0x8(%rsi),%r8
   140132c4c:	movzbl 0x60(%rsp),%eax
   140132c51:	jmp    14012a651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6be1>
   140132c56:	mov    0x1048(%rbx),%rdx
   140132c5d:	mov    %rsi,%rcx
   140132c60:	sub    %rdx,%rcx
   140132c63:	mov    %rcx,0x40(%rsp)
   140132c68:	mov    0x1050(%rbx),%rcx
   140132c6f:	mov    %rcx,0x38(%rsp)
   140132c74:	sub    %rdx,%rcx
   140132c77:	mov    %rcx,%rdx
   140132c7a:	sar    $0x3,%rdx
   140132c7e:	lea    (%rdx,%rdx,1),%rcx
   140132c82:	cmp    %rcx,%rdx
   140132c85:	jae    14012500e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159e>
   140132c8b:	mov    %rax,0x60(%rsp)
   140132c90:	mov    %rcx,%rdx
   140132c93:	lea    0x1048(%rbx),%rcx
   140132c9a:	vzeroupper
   140132c9d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132ca2:	mov    0x1050(%rbx),%rax
   140132ca9:	mov    0x40(%rsp),%rsi
   140132cae:	add    0x1048(%rbx),%rsi
   140132cb5:	mov    %rax,0x38(%rsp)
   140132cba:	lea    0x8(%rsi),%r8
   140132cbe:	mov    0x60(%rsp),%rax
   140132cc3:	jmp    14012500e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x159e>
   140132cc8:	mov    0x1c8(%rsp),%rax
   140132cd0:	sub    $0x8,%rsi
   140132cd4:	xor    %r12d,%r12d
   140132cd7:	mov    %rax,0x338(%rsp)
   140132cdf:	mov    (%rsi),%rax
   140132ce2:	mov    %rax,0x330(%rsp)
   140132cea:	jmp    140127fe4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4574>
   140132cef:	mov    0x1c8(%rsp),%rax
   140132cf7:	sub    $0x8,%rsi
   140132cfb:	mov    %rax,0x220(%rsp)
   140132d03:	mov    (%rsi),%rax
   140132d06:	mov    %rax,0x218(%rsp)
   140132d0e:	jmp    1401254d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a60>
   140132d13:	mov    0x1048(%rbx),%rdx
   140132d1a:	mov    0x1050(%rbx),%rax
   140132d21:	mov    %rsi,%r12
   140132d24:	mov    %rax,0x38(%rsp)
   140132d29:	sub    %rdx,%rax
   140132d2c:	sub    %rdx,%r12
   140132d2f:	sar    $0x3,%rax
   140132d33:	lea    (%rax,%rax,1),%rdx
   140132d37:	cmp    %rdx,%rax
   140132d3a:	jae    140129f77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6507>
   140132d40:	lea    0x1048(%rbx),%rcx
   140132d47:	vzeroupper
   140132d4a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132d4f:	mov    0x1048(%rbx),%rsi
   140132d56:	mov    0x1050(%rbx),%rax
   140132d5d:	add    %r12,%rsi
   140132d60:	mov    %rax,0x38(%rsp)
   140132d65:	lea    0x8(%rsi),%r8
   140132d69:	jmp    140129f7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x650a>
   140132d6e:	cmp    $0x1,%r12b
   140132d72:	je     14013555c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11aec>
   140132d78:	lea    0x8(%rsi),%r8
   140132d7c:	cmp    0x38(%rsp),%r8
   140132d81:	jae    140136a0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f9b>
   140132d87:	mov    0x1d0(%rsp),%rax
   140132d8f:	mov    $0x2,%r12d
   140132d95:	mov    %rax,(%rsi)
   140132d98:	mov    0x1c8(%rsp),%rax
   140132da0:	mov    %r8,%rsi
   140132da3:	mov    %rax,0x1d0(%rsp)
   140132dab:	movabs $0xfff8000000000003,%rax
   140132db5:	mov    %rax,0x1c8(%rsp)
   140132dbd:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140132dc2:	mov    0x1050(%rbx),%rax
   140132dc9:	mov    %rsi,%rdi
   140132dcc:	sub    %rdx,%rdi
   140132dcf:	mov    %rax,%rcx
   140132dd2:	sub    %rdx,%rcx
   140132dd5:	sar    $0x3,%rcx
   140132dd9:	lea    (%rcx,%rcx,1),%r9
   140132ddd:	cmp    %r9,%rcx
   140132de0:	jb     14013409f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1062f>
   140132de6:	vzeroupper
   140132de9:	jmp    14012b8e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e73>
   140132dee:	mov    0x1c8(%rsp),%rdx
   140132df6:	mov    $0x1,%r12d
   140132dfc:	mov    %rdx,0x18(%rax,%r13,8)
   140132e01:	mov    0x1d0(%rsp),%rax
   140132e09:	mov    %rax,0x1c8(%rsp)
   140132e11:	jmp    140127e0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x439b>
   140132e16:	mov    0x1c8(%rsp),%rax
   140132e1e:	sub    $0x8,%rsi
   140132e22:	mov    %rax,0x290(%rsp)
   140132e2a:	mov    (%rsi),%rax
   140132e2d:	mov    %rax,0x288(%rsp)
   140132e35:	jmp    140125981 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f11>
   140132e3a:	lea    0x8(%rsi),%r8
   140132e3e:	cmp    0x38(%rsp),%r8
   140132e43:	jae    14013623d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127cd>
   140132e49:	mov    0x1c8(%rsp),%rdx
   140132e51:	mov    %rdx,(%rsi)
   140132e54:	mov    %r8,%rsi
   140132e57:	jmp    1401277cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d5c>
   140132e5c:	mov    0x1050(%rbx),%rax
   140132e63:	mov    %rsi,%r12
   140132e66:	sub    %rdx,%r12
   140132e69:	mov    %rax,%rcx
   140132e6c:	sub    %rdx,%rcx
   140132e6f:	sar    $0x3,%rcx
   140132e73:	lea    (%rcx,%rcx,1),%r9
   140132e77:	cmp    %r9,%rcx
   140132e7a:	jb     14013426e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107fe>
   140132e80:	vzeroupper
   140132e83:	jmp    14012ad9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x732e>
   140132e88:	mov    0x1050(%rbx),%rax
   140132e8f:	mov    %rsi,%r12
   140132e92:	sub    %rdx,%r12
   140132e95:	mov    %rax,%rcx
   140132e98:	sub    %rdx,%rcx
   140132e9b:	sar    $0x3,%rcx
   140132e9f:	lea    (%rcx,%rcx,1),%r9
   140132ea3:	cmp    %r9,%rcx
   140132ea6:	jb     140135869 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11df9>
   140132eac:	vzeroupper
   140132eaf:	jmp    14012aa54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fe4>
   140132eb4:	mov    0x1050(%rbx),%rax
   140132ebb:	mov    %rsi,%r12
   140132ebe:	sub    %rdx,%r12
   140132ec1:	mov    %rax,%rcx
   140132ec4:	sub    %rdx,%rcx
   140132ec7:	sar    $0x3,%rcx
   140132ecb:	lea    (%rcx,%rcx,1),%r9
   140132ecf:	cmp    %r9,%rcx
   140132ed2:	jb     140133e40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103d0>
   140132ed8:	vzeroupper
   140132edb:	jmp    14012b95e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eee>
   140132ee0:	mov    0x1050(%rbx),%rax
   140132ee7:	mov    %rsi,%r12
   140132eea:	sub    %rdx,%r12
   140132eed:	mov    %rax,%rcx
   140132ef0:	sub    %rdx,%rcx
   140132ef3:	sar    $0x3,%rcx
   140132ef7:	lea    (%rcx,%rcx,1),%r9
   140132efb:	cmp    %r9,%rcx
   140132efe:	jb     14013547c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a0c>
   140132f04:	vzeroupper
   140132f07:	jmp    14012b99d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f2d>
   140132f0c:	mov    0x1050(%rbx),%rax
   140132f13:	mov    %rsi,%r12
   140132f16:	sub    %rdx,%r12
   140132f19:	mov    %rax,%rcx
   140132f1c:	sub    %rdx,%rcx
   140132f1f:	sar    $0x3,%rcx
   140132f23:	lea    (%rcx,%rcx,1),%r9
   140132f27:	cmp    %r9,%rcx
   140132f2a:	jb     140135e64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123f4>
   140132f30:	vzeroupper
   140132f33:	jmp    14012bb42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80d2>
   140132f38:	mov    0x1050(%rbx),%rax
   140132f3f:	mov    %rsi,%r12
   140132f42:	sub    %rdx,%r12
   140132f45:	mov    %rax,%rcx
   140132f48:	sub    %rdx,%rcx
   140132f4b:	sar    $0x3,%rcx
   140132f4f:	lea    (%rcx,%rcx,1),%r9
   140132f53:	cmp    %r9,%rcx
   140132f56:	jb     140135502 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a92>
   140132f5c:	vzeroupper
   140132f5f:	jmp    14012ae1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73ac>
   140132f64:	mov    0x1d0(%rsp),%rax
   140132f6c:	mov    $0x1,%r12d
   140132f72:	mov    %rax,0x1c8(%rsp)
   140132f7a:	jmp    140124f42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2>
   140132f7f:	mov    0x1c8(%rsp),%rax
   140132f87:	sub    $0x8,%rsi
   140132f8b:	mov    %rax,0x360(%rsp)
   140132f93:	mov    (%rsi),%rax
   140132f96:	mov    %rax,0x358(%rsp)
   140132f9e:	jmp    140128245 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x47d5>
   140132fa3:	mov    0x1c8(%rsp),%rax
   140132fab:	sub    $0x8,%rsi
   140132faf:	mov    %rax,0x2d0(%rsp)
   140132fb7:	mov    (%rsi),%rax
   140132fba:	mov    %rax,0x2c8(%rsp)
   140132fc2:	mov    %rax,%rcx
   140132fc5:	jmp    140125e34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23c4>
   140132fca:	mov    0x1c8(%rsp),%rax
   140132fd2:	sub    $0x8,%rsi
   140132fd6:	mov    %rax,0x210(%rsp)
   140132fde:	mov    (%rsi),%rax
   140132fe1:	mov    %rax,0x208(%rsp)
   140132fe9:	jmp    140125444 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19d4>
   140132fee:	mov    0x1c8(%rsp),%rax
   140132ff6:	mov    %rax,0x340(%rsp)
   140132ffe:	mov    0x1d0(%rsp),%rax
   140133006:	mov    %rax,0x1c8(%rsp)
   14013300e:	mov    %rsi,%rax
   140133011:	jmp    140130314 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8a4>
   140133016:	mov    0x1050(%rbx),%rax
   14013301d:	mov    %rsi,%r12
   140133020:	sub    %rdx,%r12
   140133023:	mov    %rax,%rcx
   140133026:	sub    %rdx,%rcx
   140133029:	sar    $0x3,%rcx
   14013302d:	lea    (%rcx,%rcx,1),%r9
   140133031:	cmp    %r9,%rcx
   140133034:	jb     14013402e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105be>
   14013303a:	vzeroupper
   14013303d:	jmp    14012bb03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8093>
   140133042:	mov    0x1048(%rbx),%rdx
   140133049:	mov    0x1050(%rbx),%rax
   140133050:	mov    %rsi,%rdi
   140133053:	mov    %rax,0x38(%rsp)
   140133058:	sub    %rdx,%rax
   14013305b:	sub    %rdx,%rdi
   14013305e:	sar    $0x3,%rax
   140133062:	lea    (%rax,%rax,1),%rdx
   140133066:	cmp    %rdx,%rax
   140133069:	jae    14012a28b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x681b>
   14013306f:	lea    0x1048(%rbx),%rcx
   140133076:	vzeroupper
   140133079:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013307e:	mov    0x1050(%rbx),%rax
   140133085:	add    0x1048(%rbx),%rdi
   14013308c:	mov    %rdi,%rsi
   14013308f:	lea    0x8(%rdi),%r8
   140133093:	mov    %rax,0x38(%rsp)
   140133098:	jmp    14012a28b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x681b>
   14013309d:	mov    0x1c8(%rsp),%rax
   1401330a5:	sub    $0x8,%rsi
   1401330a9:	mov    %rax,0x250(%rsp)
   1401330b1:	mov    (%rsi),%rax
   1401330b4:	mov    %rax,0x248(%rsp)
   1401330bc:	jmp    140125674 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c04>
   1401330c1:	movzwl 0x6(%r9),%edx
   1401330c6:	lea    0x3f0(%rsp),%r8
   1401330ce:	mov    %rdi,%rcx
   1401330d1:	mov    %r9,0x80(%rsp)
   1401330d9:	shl    $0x5,%rdx
   1401330dd:	add    0x30(%r14),%rdx
   1401330e1:	mov    %rdx,0x60(%rsp)
   1401330e6:	call   140211840 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   1401330eb:	mov    0x38(%rdi),%r10
   1401330ef:	test   %r10,%r10
   1401330f2:	je     140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   1401330f8:	mov    0x60(%rsp),%r8
   1401330fd:	lea    0x28(%r10),%rdx
   140133101:	lea    0x680(%rsp),%rcx
   140133109:	call   140222080 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14013310e:	mov    0x680(%rsp),%rdx
   140133116:	test   %rdx,%rdx
   140133119:	je     140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14013311f:	mov    (%rdx),%rdx
   140133122:	test   %rdx,%rdx
   140133125:	je     140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14013312b:	mov    0x38(%rdi),%rax
   14013312f:	movzwl 0x28(%rdx),%edx
   140133133:	mov    0x80(%rsp),%r9
   14013313b:	mov    (%rax),%eax
   14013313d:	mov    %dx,0x4(%r9)
   140133142:	mov    %eax,(%r9)
   140133145:	jmp    140127a6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ffa>
   14013314a:	mov    0x1c8(%rsp),%rax
   140133152:	sub    $0x8,%rsi
   140133156:	mov    %rax,0x2f0(%rsp)
   14013315e:	mov    (%rsi),%rax
   140133161:	mov    %rax,0x2e8(%rsp)
   140133169:	mov    %rax,%rcx
   14013316c:	jmp    140126092 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2622>
   140133171:	mov    0x1050(%rbx),%rax
   140133178:	mov    %rsi,%r12
   14013317b:	sub    %rdx,%r12
   14013317e:	mov    %rax,%rcx
   140133181:	sub    %rdx,%rcx
   140133184:	sar    $0x3,%rcx
   140133188:	lea    (%rcx,%rcx,1),%r9
   14013318c:	cmp    %r9,%rcx
   14013318f:	jb     140133f4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104df>
   140133195:	vzeroupper
   140133198:	jmp    14012b700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c90>
   14013319d:	mov    0x1c8(%rsp),%rax
   1401331a5:	sub    $0x8,%rsi
   1401331a9:	mov    %rax,0x260(%rsp)
   1401331b1:	mov    (%rsi),%rax
   1401331b4:	mov    %rax,0x258(%rsp)
   1401331bc:	jmp    140125700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c90>
   1401331c1:	mov    0x1c8(%rsp),%rax
   1401331c9:	mov    $0x1,%r12d
   1401331cf:	mov    %rax,0x300(%rsp)
   1401331d7:	mov    0x1d0(%rsp),%rax
   1401331df:	mov    %rax,0x1c8(%rsp)
   1401331e7:	jmp    14012626e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27fe>
   1401331ec:	mov    %r10,0x40(%rsp)
   1401331f1:	lea    (%r10,%r10,1),%rdx
   1401331f5:	lea    0x1048(%rbx),%rcx
   1401331fc:	vzeroupper
   1401331ff:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133204:	mov    0x15270(%rbx),%rcx
   14013320b:	mov    0x40(%rsp),%r10
   140133210:	jmp    140130478 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca08>
   140133215:	mov    0x1048(%rbx),%rdx
   14013321c:	mov    0x1050(%rbx),%rax
   140133223:	mov    %rsi,%rdi
   140133226:	mov    %rax,0x38(%rsp)
   14013322b:	sub    %rdx,%rax
   14013322e:	sub    %rdx,%rdi
   140133231:	sar    $0x3,%rax
   140133235:	lea    (%rax,%rax,1),%rdx
   140133239:	cmp    %rdx,%rax
   14013323c:	jae    14012a216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67a6>
   140133242:	lea    0x1048(%rbx),%rcx
   140133249:	vzeroupper
   14013324c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133251:	mov    0x1050(%rbx),%rax
   140133258:	add    0x1048(%rbx),%rdi
   14013325f:	mov    %rdi,%rsi
   140133262:	lea    0x8(%rdi),%r8
   140133266:	mov    %rax,0x38(%rsp)
   14013326b:	jmp    14012a216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67a6>
   140133270:	mov    0x1050(%rbx),%rax
   140133277:	mov    %rsi,%r12
   14013327a:	sub    %rdx,%r12
   14013327d:	mov    %rax,%rcx
   140133280:	sub    %rdx,%rcx
   140133283:	sar    $0x3,%rcx
   140133287:	lea    (%rcx,%rcx,1),%r9
   14013328b:	cmp    %r9,%rcx
   14013328e:	jb     140134072 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10602>
   140133294:	vzeroupper
   140133297:	jmp    14012aa93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7023>
   14013329c:	lea    0x1048(%rbx),%rcx
   1401332a3:	lea    (%rdi,%rdi,1),%rdx
   1401332a7:	vzeroupper
   1401332aa:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401332af:	mov    0x15270(%rbx),%rcx
   1401332b6:	mov    0x152a0(%rbx),%r8
   1401332bd:	jmp    14012ffff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc58f>
   1401332c2:	mov    0x1050(%rbx),%rax
   1401332c9:	mov    %rsi,%r12
   1401332cc:	sub    %rdx,%r12
   1401332cf:	mov    %rax,%rcx
   1401332d2:	sub    %rdx,%rcx
   1401332d5:	sar    $0x3,%rcx
   1401332d9:	lea    (%rcx,%rcx,1),%r9
   1401332dd:	cmp    %r9,%rcx
   1401332e0:	jb     140134190 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10720>
   1401332e6:	vzeroupper
   1401332e9:	jmp    14012b4d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a68>
   1401332ee:	mov    0x1050(%rbx),%rax
   1401332f5:	mov    %rsi,%r12
   1401332f8:	sub    %rdx,%r12
   1401332fb:	mov    %rax,%rcx
   1401332fe:	sub    %rdx,%rcx
   140133301:	sar    $0x3,%rcx
   140133305:	lea    (%rcx,%rcx,1),%r9
   140133309:	cmp    %r9,%rcx
   14013330c:	jb     140134704 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c94>
   140133312:	vzeroupper
   140133315:	jmp    14012bd64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82f4>
   14013331a:	mov    0x1050(%rbx),%rax
   140133321:	mov    %rsi,%r12
   140133324:	sub    %rdx,%r12
   140133327:	mov    %rax,%rcx
   14013332a:	sub    %rdx,%rcx
   14013332d:	sar    $0x3,%rcx
   140133331:	lea    (%rcx,%rcx,1),%r9
   140133335:	cmp    %r9,%rcx
   140133338:	jb     140135d85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12315>
   14013333e:	vzeroupper
   140133341:	jmp    14012b9dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f6c>
   140133346:	mov    0x1050(%rbx),%rax
   14013334d:	mov    %rsi,%r12
   140133350:	sub    %rdx,%r12
   140133353:	mov    %rax,%rcx
   140133356:	sub    %rdx,%rcx
   140133359:	sar    $0x3,%rcx
   14013335d:	lea    (%rcx,%rcx,1),%r9
   140133361:	cmp    %r9,%rcx
   140133364:	jb     14013595f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11eef>
   14013336a:	vzeroupper
   14013336d:	jmp    14012addd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x736d>
   140133372:	mov    0x1c8(%rsp),%rdx
   14013337a:	mov    $0x1,%r12d
   140133380:	mov    %rdx,0x8(%rax,%r13,8)
   140133385:	mov    0x1d0(%rsp),%rax
   14013338d:	mov    %rax,0x1c8(%rsp)
   140133395:	jmp    140127d85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4315>
   14013339a:	mov    0x1050(%rbx),%rax
   1401333a1:	mov    %rsi,%r12
   1401333a4:	sub    %rdx,%r12
   1401333a7:	mov    %rax,%rcx
   1401333aa:	sub    %rdx,%rcx
   1401333ad:	sar    $0x3,%rcx
   1401333b1:	lea    (%rcx,%rcx,1),%r9
   1401333b5:	cmp    %r9,%rcx
   1401333b8:	jb     140134215 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107a5>
   1401333be:	vzeroupper
   1401333c1:	jmp    14012af93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7523>
   1401333c6:	mov    0x1050(%rbx),%rax
   1401333cd:	mov    %rsi,%r12
   1401333d0:	sub    %rdx,%r12
   1401333d3:	mov    %rax,%rcx
   1401333d6:	sub    %rdx,%rcx
   1401333d9:	sar    $0x3,%rcx
   1401333dd:	lea    (%rcx,%rcx,1),%r9
   1401333e1:	cmp    %r9,%rcx
   1401333e4:	jb     1401339f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff80>
   1401333ea:	vzeroupper
   1401333ed:	jmp    14012b0bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x764d>
   1401333f2:	mov    0x1050(%rbx),%rax
   1401333f9:	mov    %rsi,%r12
   1401333fc:	sub    %rdx,%r12
   1401333ff:	mov    %rax,%rcx
   140133402:	sub    %rdx,%rcx
   140133405:	sar    $0x3,%rcx
   140133409:	lea    (%rcx,%rcx,1),%r9
   14013340d:	cmp    %r9,%rcx
   140133410:	jb     140135db2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12342>
   140133416:	vzeroupper
   140133419:	jmp    14012b1f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7785>
   14013341e:	mov    0x1050(%rbx),%rax
   140133425:	mov    %rsi,%r12
   140133428:	sub    %rdx,%r12
   14013342b:	mov    %rax,%rcx
   14013342e:	sub    %rdx,%rcx
   140133431:	sar    $0x3,%rcx
   140133435:	lea    (%rcx,%rcx,1),%r9
   140133439:	cmp    %r9,%rcx
   14013343c:	jb     140134748 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cd8>
   140133442:	vzeroupper
   140133445:	jmp    14012afd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7562>
   14013344a:	cmp    $0x1,%r12b
   14013344e:	je     1401340cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1065c>
   140133454:	lea    0x8(%rsi),%r8
   140133458:	cmp    0x38(%rsp),%r8
   14013345d:	jae    1401373c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13953>
   140133463:	mov    0x1d0(%rsp),%rax
   14013346b:	mov    0x60(%rdi),%rcx
   14013346f:	mov    0x50(%rdi),%rdx
   140133473:	sub    0x48(%rdi),%rdx
   140133477:	mov    %rax,(%rsi)
   14013347a:	mov    0x1c8(%rsp),%rax
   140133482:	sar    $0x3,%rdx
   140133486:	mov    %rax,0x1d0(%rsp)
   14013348e:	xor    %eax,%eax
   140133490:	test   %rcx,%rcx
   140133493:	je     140133499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa29>
   140133495:	mov    0x18(%rcx),%rax
   140133499:	add    %rax,%rdx
   14013349c:	lea    0x680(%rsp),%rcx
   1401334a4:	mov    %r8,0x40(%rsp)
   1401334a9:	mov    $0x2,%r12d
   1401334af:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401334b4:	mov    0x680(%rsp),%rax
   1401334bc:	mov    0x40(%rsp),%rsi
   1401334c1:	mov    %rax,0x1c8(%rsp)
   1401334c9:	jmp    140131f3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4cf>
   1401334ce:	mov    0x1050(%rbx),%rax
   1401334d5:	mov    %rsi,%r12
   1401334d8:	sub    %rdx,%r12
   1401334db:	mov    %rax,%rcx
   1401334de:	sub    %rdx,%rcx
   1401334e1:	sar    $0x3,%rcx
   1401334e5:	lea    (%rcx,%rcx,1),%r9
   1401334e9:	cmp    %r9,%rcx
   1401334ec:	jb     140135589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b19>
   1401334f2:	vzeroupper
   1401334f5:	jmp    14012b1b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7746>
   1401334fa:	mov    0x1050(%rbx),%rax
   140133501:	mov    %rsi,%r12
   140133504:	sub    %rdx,%r12
   140133507:	mov    %rax,%rcx
   14013350a:	sub    %rdx,%rcx
   14013350d:	sar    $0x3,%rcx
   140133511:	lea    (%rcx,%rcx,1),%r9
   140133515:	cmp    %r9,%rcx
   140133518:	jb     140135752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ce2>
   14013351e:	vzeroupper
   140133521:	jmp    14012ac04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7194>
   140133526:	mov    0x1c8(%rsp),%rax
   14013352e:	sub    $0x8,%rsi
   140133532:	mov    %rax,0x2a0(%rsp)
   14013353a:	mov    (%rsi),%rax
   14013353d:	mov    %rax,0x298(%rsp)
   140133545:	mov    %rax,%rcx
   140133548:	jmp    140125aa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2035>
   14013354d:	mov    0x1050(%rbx),%rax
   140133554:	mov    %rsi,%r12
   140133557:	sub    %rdx,%r12
   14013355a:	mov    %rax,%rcx
   14013355d:	sub    %rdx,%rcx
   140133560:	sar    $0x3,%rcx
   140133564:	lea    (%rcx,%rcx,1),%r9
   140133568:	cmp    %r9,%rcx
   14013356b:	jb     140134001 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10591>
   140133571:	vzeroupper
   140133574:	jmp    14012b177 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7707>
   140133579:	mov    0x1050(%rbx),%rax
   140133580:	mov    %rsi,%r12
   140133583:	sub    %rdx,%r12
   140133586:	mov    %rax,%rcx
   140133589:	sub    %rdx,%rcx
   14013358c:	sar    $0x3,%rcx
   140133590:	lea    (%rcx,%rcx,1),%r9
   140133594:	cmp    %r9,%rcx
   140133597:	jb     1401346d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c67>
   14013359d:	vzeroupper
   1401335a0:	jmp    14012aed9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7469>
   1401335a5:	mov    0x1048(%rbx),%rdx
   1401335ac:	mov    0x1050(%rbx),%rax
   1401335b3:	mov    %rsi,%rdi
   1401335b6:	mov    %rax,0x38(%rsp)
   1401335bb:	sub    %rdx,%rax
   1401335be:	sub    %rdx,%rdi
   1401335c1:	sar    $0x3,%rax
   1401335c5:	lea    (%rax,%rax,1),%rdx
   1401335c9:	cmp    %rdx,%rax
   1401335cc:	jae    14012a377 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6907>
   1401335d2:	lea    0x1048(%rbx),%rcx
   1401335d9:	vzeroupper
   1401335dc:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401335e1:	mov    0x1050(%rbx),%rax
   1401335e8:	add    0x1048(%rbx),%rdi
   1401335ef:	mov    %rdi,%rsi
   1401335f2:	lea    0x8(%rdi),%r8
   1401335f6:	mov    %rax,0x38(%rsp)
   1401335fb:	jmp    14012a377 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6907>
   140133600:	mov    0x1050(%rbx),%rax
   140133607:	mov    %rsi,%r12
   14013360a:	sub    %rdx,%r12
   14013360d:	mov    %rax,%rcx
   140133610:	sub    %rdx,%rcx
   140133613:	sar    $0x3,%rcx
   140133617:	lea    (%rcx,%rcx,1),%r9
   14013361b:	cmp    %r9,%rcx
   14013361e:	jb     140133fa8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10538>
   140133624:	vzeroupper
   140133627:	jmp    14012ae9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x742a>
   14013362c:	mov    0x1050(%rbx),%rax
   140133633:	mov    %rsi,%r12
   140133636:	sub    %rdx,%r12
   140133639:	mov    %rax,%rcx
   14013363c:	sub    %rdx,%rcx
   14013363f:	sar    $0x3,%rcx
   140133643:	lea    (%rcx,%rcx,1),%r9
   140133647:	cmp    %r9,%rcx
   14013364a:	jb     1401354d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a65>
   140133650:	vzeroupper
   140133653:	jmp    14012b0fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x768c>
   140133658:	mov    0x1c8(%rsp),%rax
   140133660:	sub    $0x8,%rsi
   140133664:	mov    %rax,0x3b0(%rsp)
   14013366c:	mov    (%rsi),%rax
   14013366f:	mov    %rax,0x3a8(%rsp)
   140133677:	jmp    140128736 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4cc6>
   14013367c:	mov    0x1c8(%rsp),%rax
   140133684:	mov    -0x8(%rsi),%rdi
   140133688:	xor    %r12d,%r12d
   14013368b:	sub    $0x8,%rsi
   14013368f:	mov    %rax,0x3f0(%rsp)
   140133697:	jmp    14012c840 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8dd0>
   14013369c:	mov    0x1c8(%rsp),%rax
   1401336a4:	sub    $0x8,%rsi
   1401336a8:	mov    %rax,0x2b0(%rsp)
   1401336b0:	mov    (%rsi),%rax
   1401336b3:	mov    %rax,0x2a8(%rsp)
   1401336bb:	mov    %rax,%rdx
   1401336be:	jmp    140125bd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2166>
   1401336c3:	mov    0x1c8(%rsp),%rax
   1401336cb:	mov    $0x1,%r12d
   1401336d1:	mov    %rax,0x2f8(%rsp)
   1401336d9:	mov    0x1d0(%rsp),%rax
   1401336e1:	mov    %rax,0x1c8(%rsp)
   1401336e9:	jmp    1401261e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2776>
   1401336ee:	mov    0x1c8(%rsp),%rax
   1401336f6:	sub    $0x8,%rsi
   1401336fa:	mov    %rax,0x2c0(%rsp)
   140133702:	mov    (%rsi),%rax
   140133705:	mov    %rax,0x2b8(%rsp)
   14013370d:	mov    %rax,%rcx
   140133710:	jmp    140125d05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2295>
   140133715:	mov    0x1c8(%rsp),%rax
   14013371d:	sub    $0x8,%rsi
   140133721:	mov    %rax,0x380(%rsp)
   140133729:	mov    (%rsi),%rax
   14013372c:	mov    %rax,0x378(%rsp)
   140133734:	jmp    1401283bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494b>
   140133739:	mov    0x1050(%rbx),%rax
   140133740:	mov    %rsi,%r12
   140133743:	sub    %rdx,%r12
   140133746:	mov    %rax,%rcx
   140133749:	sub    %rdx,%rcx
   14013374c:	sar    $0x3,%rcx
   140133750:	lea    (%rcx,%rcx,1),%r9
   140133754:	cmp    %r9,%rcx
   140133757:	jb     14013552f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11abf>
   14013375d:	vzeroupper
   140133760:	jmp    14012be47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83d7>
   140133765:	mov    0x1c8(%rsp),%rax
   14013376d:	sub    $0x8,%rsi
   140133771:	mov    %rax,0x1f0(%rsp)
   140133779:	mov    (%rsi),%rax
   14013377c:	mov    %rax,0x1e8(%rsp)
   140133784:	jmp    1401252d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1866>
   140133789:	mov    0x1c8(%rsp),%rax
   140133791:	sub    $0x8,%rsi
   140133795:	mov    %rax,0x3d0(%rsp)
   14013379d:	mov    (%rsi),%rax
   1401337a0:	mov    %rax,0x3c8(%rsp)
   1401337a8:	jmp    1401289f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f88>
   1401337ad:	mov    0x1048(%rbx),%rdx
   1401337b4:	mov    0x1050(%rbx),%rax
   1401337bb:	mov    %rsi,%rdi
   1401337be:	mov    %rax,0x38(%rsp)
   1401337c3:	sub    %rdx,%rax
   1401337c6:	sub    %rdx,%rdi
   1401337c9:	sar    $0x3,%rax
   1401337cd:	lea    (%rax,%rax,1),%rdx
   1401337d1:	cmp    %rdx,%rax
   1401337d4:	jae    14012a301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6891>
   1401337da:	lea    0x1048(%rbx),%rcx
   1401337e1:	vzeroupper
   1401337e4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401337e9:	mov    0x1050(%rbx),%rax
   1401337f0:	add    0x1048(%rbx),%rdi
   1401337f7:	mov    %rdi,%rsi
   1401337fa:	lea    0x8(%rdi),%r8
   1401337fe:	mov    %rax,0x38(%rsp)
   140133803:	jmp    14012a301 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6891>
   140133808:	mov    0x1c8(%rsp),%rdx
   140133810:	mov    $0x1,%r12d
   140133816:	mov    %rdx,(%rax,%r13,8)
   14013381a:	mov    0x1d0(%rsp),%rax
   140133822:	mov    %rax,0x1c8(%rsp)
   14013382a:	jmp    140127d42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42d2>
   14013382f:	mov    0x1050(%rbx),%rax
   140133836:	mov    %rsi,%r12
   140133839:	sub    %rdx,%r12
   14013383c:	mov    %rax,%rcx
   14013383f:	sub    %rdx,%rcx
   140133842:	sar    $0x3,%rcx
   140133846:	lea    (%rcx,%rcx,1),%r9
   14013384a:	cmp    %r9,%rcx
   14013384d:	jb     1401356cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c5c>
   140133853:	vzeroupper
   140133856:	jmp    14012be86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8416>
   14013385b:	mov    0x40(%rsp),%rcx
   140133860:	call   140147380 <setun::ArrayObject::size() const>
   140133865:	add    %rax,%rdi
   140133868:	jns    14012f050 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5e0>
   14013386e:	jmp    14012f063 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5f3>
   140133873:	mov    0x1c8(%rsp),%rax
   14013387b:	sub    $0x8,%rsi
   14013387f:	mov    %rax,0x3c0(%rsp)
   140133887:	mov    (%rsi),%rax
   14013388a:	mov    %rax,0x3b8(%rsp)
   140133892:	jmp    140128898 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e28>
   140133897:	mov    0x1c8(%rsp),%rax
   14013389f:	mov    %rax,0x318(%rsp)
   1401338a7:	mov    0x1d0(%rsp),%rax
   1401338af:	mov    %rax,0x1c8(%rsp)
   1401338b7:	mov    %rsi,%rax
   1401338ba:	jmp    140130996 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf26>
   1401338bf:	mov    0x1c8(%rsp),%rax
   1401338c7:	sub    $0x8,%rsi
   1401338cb:	mov    %rax,0x390(%rsp)
   1401338d3:	mov    (%rsi),%rax
   1401338d6:	mov    %rax,0x388(%rsp)
   1401338de:	jmp    140128476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   1401338e3:	mov    0x1050(%rbx),%rax
   1401338ea:	mov    %rsi,%r12
   1401338ed:	sub    %rdx,%r12
   1401338f0:	mov    %rax,%rcx
   1401338f3:	sub    %rdx,%rcx
   1401338f6:	sar    $0x3,%rcx
   1401338fa:	lea    (%rcx,%rcx,1),%r9
   1401338fe:	cmp    %r9,%rcx
   140133901:	jb     140135725 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cb5>
   140133907:	vzeroupper
   14013390a:	jmp    14012bf23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84b3>
   14013390f:	mov    0x1050(%rbx),%rax
   140133916:	mov    %rsi,%r12
   140133919:	sub    %rdx,%r12
   14013391c:	mov    %rax,%rcx
   14013391f:	sub    %rdx,%rcx
   140133922:	sar    $0x3,%rcx
   140133926:	lea    (%rcx,%rcx,1),%r9
   14013392a:	cmp    %r9,%rcx
   14013392d:	jb     14013577f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d0f>
   140133933:	vzeroupper
   140133936:	jmp    14012bf62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84f2>
   14013393b:	mov    0x1048(%rbx),%rdx
   140133942:	mov    0x1050(%rbx),%rax
   140133949:	mov    %rsi,%r12
   14013394c:	mov    %rax,0x38(%rsp)
   140133951:	sub    %rdx,%rax
   140133954:	sub    %rdx,%r12
   140133957:	sar    $0x3,%rax
   14013395b:	lea    (%rax,%rax,1),%rdx
   14013395f:	cmp    %rdx,%rax
   140133962:	jae    14012bf90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8520>
   140133968:	lea    0x1048(%rbx),%rcx
   14013396f:	vzeroupper
   140133972:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133977:	mov    0x1048(%rbx),%rsi
   14013397e:	mov    0x1050(%rbx),%rax
   140133985:	add    %r12,%rsi
   140133988:	mov    %rax,0x38(%rsp)
   14013398d:	lea    0x10(%rsi),%r8
   140133991:	jmp    14012bf93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8523>
   140133996:	mov    %r9,%rdx
   140133999:	lea    0x1048(%rbx),%rcx
   1401339a0:	vzeroupper
   1401339a3:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401339a8:	mov    0x1048(%rbx),%rdx
   1401339af:	mov    0x1050(%rbx),%rax
   1401339b6:	lea    (%rdx,%r12,1),%rsi
   1401339ba:	lea    0x8(%rsi),%r8
   1401339be:	jmp    140129c78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6208>
   1401339c3:	mov    %r9,%rdx
   1401339c6:	lea    0x1048(%rbx),%rcx
   1401339cd:	vzeroupper
   1401339d0:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401339d5:	mov    0x1048(%rbx),%rdx
   1401339dc:	mov    0x1050(%rbx),%rax
   1401339e3:	lea    (%rdx,%r12,1),%rsi
   1401339e7:	lea    0x10(%rsi),%r8
   1401339eb:	jmp    14012bd25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82b5>
   1401339f0:	mov    %r9,%rdx
   1401339f3:	lea    0x1048(%rbx),%rcx
   1401339fa:	vzeroupper
   1401339fd:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133a02:	mov    0x1048(%rbx),%rdx
   140133a09:	mov    0x1050(%rbx),%rax
   140133a10:	lea    (%rdx,%r12,1),%rsi
   140133a14:	lea    0x10(%rsi),%r8
   140133a18:	jmp    14012b0bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x764d>
   140133a1d:	call   140212e20 <tersun::VMTelemetryManager::instance()>
   140133a22:	cmpb   $0x0,(%rax)
   140133a25:	je     140133a2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffbf>
   140133a27:	addq   $0x1,0x90(%rax)
   140133a2f:	mov    0x80(%rsp),%ebp
   140133a36:	mov    0x152c8(%rbx),%rcx
   140133a3d:	xor    %r8d,%r8d
   140133a40:	movzbl 0x7f0(%rsp),%r9d
   140133a49:	mov    %rbp,%rdx
   140133a4c:	call   140171d10 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   140133a51:	mov    0x1048(%rbx),%rdx
   140133a58:	mov    %rsi,%rcx
   140133a5b:	mov    0x60(%rsp),%r8
   140133a60:	mov    0x150c0(%rbx),%rax
   140133a67:	sub    %rdx,%rcx
   140133a6a:	sub    %r15,%r8
   140133a6d:	mov    %rcx,%rdi
   140133a70:	sar    $0x3,%rdi
   140133a74:	cmp    $0x7ff,%rax
   140133a7a:	ja     140138c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151de>
   140133a80:	mov    0xa0(%rsp),%r11
   140133a88:	lea    0x1(%rax),%r9
   140133a8c:	lea    (%rax,%rax,4),%rax
   140133a90:	mov    %r9,0x150c0(%rbx)
   140133a97:	mov    %r11,0x10c8(%rbx,%rax,8)
   140133a9f:	mov    0x40(%rsp),%r11
   140133aa4:	mov    %r8,0x10c0(%rbx,%rax,8)
   140133aac:	mov    %rdi,0x10d0(%rbx,%rax,8)
   140133ab4:	mov    %r11,0x10d8(%rbx,%rax,8)
   140133abc:	mov    %rbp,0x10e0(%rbx,%rax,8)
   140133ac4:	mov    0x1050(%rbx),%rax
   140133acb:	sub    %rdx,%rax
   140133ace:	cmp    %rcx,%rax
   140133ad1:	jb     14013788c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e1c>
   140133ad7:	mov    0x7e8(%rsp),%rax
   140133adf:	mov    %rdi,0x1060(%rbx)
   140133ae6:	add    %r15,%rax
   140133ae9:	mov    %rax,0x60(%rsp)
   140133aee:	cmpb   $0x0,0x1040(%rbx)
   140133af5:	je     140137884 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e14>
   140133afb:	lea    0x1(%rax),%rbp
   140133aff:	movzbl (%rax),%eax
   140133b02:	lea    0x28c597(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140133b09:	xor    %r12d,%r12d
   140133b0c:	mov    0xa0(%rsp),%r13
   140133b14:	mov    (%rdi,%rax,8),%rax
   140133b18:	jmp    *%rax
   140133b1a:	lea    (%r12,%r12,1),%rdx
   140133b1e:	lea    0x1048(%rbx),%rcx
   140133b25:	vzeroupper
   140133b28:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133b2d:	jmp    14013076e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccfe>
   140133b32:	mov    0x8(%r10),%eax
   140133b36:	xor    %r12d,%r12d
   140133b39:	add    $0x1,%eax
   140133b3c:	mov    %eax,0x8(%r10)
   140133b40:	cmp    0xc(%r10),%eax
   140133b44:	jb     140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140133b4a:	mov    0x150c0(%rbx),%r12
   140133b51:	test   %r12,%r12
   140133b54:	je     140133b67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100f7>
   140133b56:	lea    -0x1(%r12),%rax
   140133b5b:	imul   $0x28,%rax,%rax
   140133b5f:	mov    0x10e0(%rbx,%rax,1),%r12
   140133b67:	mov    0x1048(%rbx),%rdx
   140133b6e:	mov    0x1050(%rbx),%rax
   140133b75:	sub    %r15,%rbp
   140133b78:	mov    %rbp,0x1038(%rbx)
   140133b7f:	sub    %rdx,%rsi
   140133b82:	sub    %rdx,%rax
   140133b85:	mov    %rsi,%rbp
   140133b88:	sar    $0x3,%rbp
   140133b8c:	cmp    %rsi,%rax
   140133b8f:	jb     14013792a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13eba>
   140133b95:	vzeroupper
   140133b98:	mov    %rbp,0x1060(%rbx)
   140133b9f:	mov    %rbx,%rdx
   140133ba2:	mov    %r12,%r9
   140133ba5:	mov    %r14,%r8
   140133ba8:	mov    0x40(%rsp),%eax
   140133bac:	vmovdqa 0x228f2c(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140133bb4:	movb   $0x0,0x153a0(%rbx)
   140133bbb:	mov    0x152c8(%rbx),%rcx
   140133bc2:	mov    %r10,0x60(%rsp)
   140133bc7:	vmovdqa %xmm0,0x15390(%rbx)
   140133bcf:	mov    %r10,0x28(%rsp)
   140133bd4:	mov    %eax,0x20(%rsp)
   140133bd8:	call   140173030 <setun::JITManager::slow_tiering_coordinator_osr(setun::VM*, setun::Chunk const&, unsigned long long, unsigned int, setun::LoopHotData&)>
   140133bdd:	mov    0x1048(%rbx),%rdx
   140133be4:	mov    0x60(%rsp),%r10
   140133be9:	mov    %eax,%ecx
   140133beb:	mov    0x1060(%rbx),%rax
   140133bf2:	mov    0x1038(%rbx),%rbp
   140133bf9:	mov    0x150c0(%rbx),%r13
   140133c00:	lea    (%rdx,%rax,8),%rsi
   140133c04:	mov    0x1050(%rbx),%rax
   140133c0b:	add    %r15,%rbp
   140133c0e:	test   %r13,%r13
   140133c11:	mov    %rax,0x38(%rsp)
   140133c16:	je     140133c28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101b8>
   140133c18:	lea    -0x1(%r13),%rax
   140133c1c:	imul   $0x28,%rax,%rax
   140133c20:	mov    0x10c8(%rbx,%rax,1),%r13
   140133c28:	test   %cl,%cl
   140133c2a:	jne    140133c34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101c4>
   140133c2c:	addl   $0x3e8,0xc(%r10)
   140133c34:	xor    %r12d,%r12d
   140133c37:	jmp    140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140133c3c:	nopl   0x0(%rax)
   140133c40:	mov    0x1050(%rbx),%rax
   140133c47:	mov    %rsi,%r12
   140133c4a:	sub    %rdx,%r12
   140133c4d:	mov    %rax,%rcx
   140133c50:	sub    %rdx,%rcx
   140133c53:	sar    $0x3,%rcx
   140133c57:	lea    (%rcx,%rcx,1),%r9
   140133c5b:	cmp    %r9,%rcx
   140133c5e:	jb     14013799e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f2e>
   140133c64:	vzeroupper
   140133c67:	jmp    14012db96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa126>
   140133c6c:	mov    0x40(%rsp),%rdx
   140133c71:	mov    %rdi,%rcx
   140133c74:	call   14021d8c0 <setun::VMObject::has_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133c79:	test   %al,%al
   140133c7b:	je     140137a6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ffd>
   140133c81:	test   %r12b,%r12b
   140133c84:	je     140137a4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fdd>
   140133c8a:	sub    $0x1,%r12b
   140133c8e:	je     140137a1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fad>
   140133c94:	lea    0x8(%rsi),%r8
   140133c98:	cmp    0x38(%rsp),%r8
   140133c9d:	jae    1401379cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f5b>
   140133ca3:	mov    0x1d0(%rsp),%rax
   140133cab:	mov    0x40(%rsp),%rdx
   140133cb0:	mov    %rdi,%rcx
   140133cb3:	mov    %r8,0x80(%rsp)
   140133cbb:	mov    $0x2,%r12d
   140133cc1:	mov    %rax,(%rsi)
   140133cc4:	mov    0x1c8(%rsp),%rax
   140133ccc:	mov    %rax,0x1d0(%rsp)
   140133cd4:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133cd9:	mov    0x80(%rsp),%rsi
   140133ce1:	mov    %rax,0x1c8(%rsp)
   140133ce9:	cmpb   $0x0,0x1040(%rbx)
   140133cf0:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   140133cf6:	movzbl 0x2(%rbp),%eax
   140133cfa:	lea    0x28c39f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140133d01:	add    $0x3,%rbp
   140133d05:	mov    (%rdi,%rax,8),%rax
   140133d09:	jmp    *%rax
   140133d0b:	mov    0x1050(%rbx),%rax
   140133d12:	mov    %rsi,%r12
   140133d15:	sub    %rdx,%r12
   140133d18:	mov    %rax,%rcx
   140133d1b:	sub    %rdx,%rcx
   140133d1e:	sar    $0x3,%rcx
   140133d22:	lea    (%rcx,%rcx,1),%r9
   140133d26:	cmp    %r9,%rcx
   140133d29:	jb     14013763f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bcf>
   140133d2f:	vzeroupper
   140133d32:	jmp    14012e02f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5bf>
   140133d37:	lea    0x500(%rsp),%rax
   140133d3f:	mov    %r10,%rdx
   140133d42:	mov    %r9,0x60(%rsp)
   140133d47:	mov    %rax,%rcx
   140133d4a:	mov    %r11,0x40(%rsp)
   140133d4f:	mov    %rax,0x80(%rsp)
   140133d57:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140133d5c:	mov    0x40(%rsp),%r11
   140133d61:	mov    0x60(%rsp),%r9
   140133d66:	jmp    140130be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd176>
   140133d6b:	lea    0x338(%rsp),%rcx
   140133d73:	call   14021aa80 <setun::VMValue::as_int() const>
   140133d78:	mov    %rax,%r9
   140133d7b:	test   %rax,%rax
   140133d7e:	js     14013772a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cba>
   140133d84:	mov    %rdi,%rcx
   140133d87:	mov    %r9,0x40(%rsp)
   140133d8c:	call   140147380 <setun::ArrayObject::size() const>
   140133d91:	mov    0x40(%rsp),%r9
   140133d96:	cmp    %rax,%r9
   140133d99:	jae    14012ef50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e0>
   140133d9f:	test   %r12b,%r12b
   140133da2:	je     14013770c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c9c>
   140133da8:	sub    $0x1,%r12b
   140133dac:	je     1401376e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c74>
   140133db2:	lea    0x8(%rsi),%r8
   140133db6:	cmp    0x38(%rsp),%r8
   140133dbb:	jae    140137685 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c15>
   140133dc1:	mov    0x1d0(%rsp),%rax
   140133dc9:	mov    %r9,%rdx
   140133dcc:	mov    %rdi,%rcx
   140133dcf:	mov    %r8,0x40(%rsp)
   140133dd4:	mov    $0x2,%r12d
   140133dda:	mov    %rax,(%rsi)
   140133ddd:	mov    0x1c8(%rsp),%rax
   140133de5:	mov    %rax,0x1d0(%rsp)
   140133ded:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140133df2:	mov    0x40(%rsp),%rsi
   140133df7:	mov    %rax,0x1c8(%rsp)
   140133dff:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   140133e04:	mov    0x1050(%rbx),%rax
   140133e0b:	mov    0x1048(%rbx),%rdx
   140133e12:	mov    %rax,0x38(%rsp)
   140133e17:	sub    %rdx,%rax
   140133e1a:	sar    $0x3,%rax
   140133e1e:	lea    (%rax,%rax,1),%rcx
   140133e22:	cmp    %rcx,%rax
   140133e25:	jae    140128053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e3>
   140133e2b:	sub    %rdx,%rsi
   140133e2e:	mov    %rcx,%rdx
   140133e31:	lea    0x1048(%rbx),%rcx
   140133e38:	vzeroupper
   140133e3b:	jmp    14012efa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb536>
   140133e40:	mov    %r9,%rdx
   140133e43:	lea    0x1048(%rbx),%rcx
   140133e4a:	vzeroupper
   140133e4d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133e52:	mov    0x1048(%rbx),%rdx
   140133e59:	mov    0x1050(%rbx),%rax
   140133e60:	lea    (%rdx,%r12,1),%rsi
   140133e64:	lea    0x10(%rsi),%r8
   140133e68:	jmp    14012b95e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eee>
   140133e6d:	cmp    $0x2,%r12b
   140133e71:	je     140137549 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ad9>
   140133e77:	cmp    $0x1,%r12b
   140133e7b:	je     140137517 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13aa7>
   140133e81:	mov    0x1048(%rbx),%rdx
   140133e88:	mov    0x1050(%rbx),%rax
   140133e8f:	vzeroupper
   140133e92:	sub    %rdx,%rsi
   140133e95:	sub    %rdx,%rax
   140133e98:	mov    %rsi,%r8
   140133e9b:	sar    $0x3,%r8
   140133e9f:	cmp    %rsi,%rax
   140133ea2:	jb     1401374cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a5b>
   140133ea8:	mov    %r8,0x1060(%rbx)
   140133eaf:	mov    %rbx,%rdx
   140133eb2:	lea    0x15270(%rbx),%rcx
   140133eb9:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140133ebe:	mov    0x1060(%rbx),%rax
   140133ec5:	mov    0x1048(%rbx),%rdx
   140133ecc:	lea    (%rdx,%rax,8),%rsi
   140133ed0:	jmp    140130718 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcca8>
   140133ed5:	mov    0x1050(%rbx),%rax
   140133edc:	mov    %rsi,%rbp
   140133edf:	sub    %rdx,%rbp
   140133ee2:	mov    %rax,%rcx
   140133ee5:	sub    %rdx,%rcx
   140133ee8:	sar    $0x3,%rcx
   140133eec:	lea    (%rcx,%rcx,1),%r10
   140133ef0:	cmp    %r10,%rcx
   140133ef3:	jae    14012db00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa090>
   140133ef9:	mov    %r10,%rdx
   140133efc:	lea    0x1048(%rbx),%rcx
   140133f03:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133f08:	mov    0x1048(%rbx),%rdx
   140133f0f:	mov    0x1050(%rbx),%rax
   140133f16:	lea    (%rdx,%rbp,1),%rsi
   140133f1a:	lea    0x8(%rsi),%r8
   140133f1e:	jmp    14012db00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa090>
   140133f23:	mov    0x1050(%rbx),%rax
   140133f2a:	mov    %rsi,%r12
   140133f2d:	sub    %rdx,%r12
   140133f30:	mov    %rax,%rcx
   140133f33:	sub    %rdx,%rcx
   140133f36:	sar    $0x3,%rcx
   140133f3a:	lea    (%rcx,%rcx,1),%r9
   140133f3e:	cmp    %r9,%rcx
   140133f41:	jb     1401374ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a7a>
   140133f47:	vzeroupper
   140133f4a:	jmp    14012db63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0f3>
   140133f4f:	mov    %r9,%rdx
   140133f52:	lea    0x1048(%rbx),%rcx
   140133f59:	vzeroupper
   140133f5c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133f61:	mov    0x1048(%rbx),%rdx
   140133f68:	mov    0x1050(%rbx),%rax
   140133f6f:	lea    (%rdx,%r12,1),%rsi
   140133f73:	lea    0x10(%rsi),%r8
   140133f77:	jmp    14012b700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c90>
   140133f7c:	mov    0x1050(%rbx),%rax
   140133f83:	mov    %rsi,%r12
   140133f86:	sub    %rdx,%r12
   140133f89:	mov    %rax,%rcx
   140133f8c:	sub    %rdx,%rcx
   140133f8f:	sar    $0x3,%rcx
   140133f93:	lea    (%rcx,%rcx,1),%r9
   140133f97:	cmp    %r9,%rcx
   140133f9a:	jb     140137418 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139a8>
   140133fa0:	vzeroupper
   140133fa3:	jmp    14012e2f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa889>
   140133fa8:	mov    %r9,%rdx
   140133fab:	lea    0x1048(%rbx),%rcx
   140133fb2:	vzeroupper
   140133fb5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133fba:	mov    0x1048(%rbx),%rdx
   140133fc1:	mov    0x1050(%rbx),%rax
   140133fc8:	lea    (%rdx,%r12,1),%rsi
   140133fcc:	lea    0x10(%rsi),%r8
   140133fd0:	jmp    14012ae9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x742a>
   140133fd5:	mov    0x1050(%rbx),%rax
   140133fdc:	mov    %rsi,%r12
   140133fdf:	sub    %rdx,%r12
   140133fe2:	mov    %rax,%rcx
   140133fe5:	sub    %rdx,%rcx
   140133fe8:	sar    $0x3,%rcx
   140133fec:	lea    (%rcx,%rcx,1),%r9
   140133ff0:	cmp    %r9,%rcx
   140133ff3:	jb     140137445 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139d5>
   140133ff9:	vzeroupper
   140133ffc:	jmp    14012e0fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa68b>
   140134001:	mov    %r9,%rdx
   140134004:	lea    0x1048(%rbx),%rcx
   14013400b:	vzeroupper
   14013400e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134013:	mov    0x1048(%rbx),%rdx
   14013401a:	mov    0x1050(%rbx),%rax
   140134021:	lea    (%rdx,%r12,1),%rsi
   140134025:	lea    0x10(%rsi),%r8
   140134029:	jmp    14012b177 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7707>
   14013402e:	mov    %r9,%rdx
   140134031:	lea    0x1048(%rbx),%rcx
   140134038:	vzeroupper
   14013403b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134040:	mov    0x1048(%rbx),%rdx
   140134047:	mov    0x1050(%rbx),%rax
   14013404e:	lea    (%rdx,%r12,1),%rsi
   140134052:	lea    0x10(%rsi),%r8
   140134056:	jmp    14012bb03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8093>
   14013405b:	lea    0x15270(%rbx),%rcx
   140134062:	mov    %rbx,%rdx
   140134065:	vzeroupper
   140134068:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   14013406d:	jmp    140130010 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5a0>
   140134072:	mov    %r9,%rdx
   140134075:	lea    0x1048(%rbx),%rcx
   14013407c:	vzeroupper
   14013407f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134084:	mov    0x1048(%rbx),%rdx
   14013408b:	mov    0x1050(%rbx),%rax
   140134092:	lea    (%rdx,%r12,1),%rsi
   140134096:	lea    0x10(%rsi),%r8
   14013409a:	jmp    14012aa93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7023>
   14013409f:	mov    %r9,%rdx
   1401340a2:	lea    0x1048(%rbx),%rcx
   1401340a9:	vzeroupper
   1401340ac:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401340b1:	mov    0x1048(%rbx),%rdx
   1401340b8:	mov    0x1050(%rbx),%rax
   1401340bf:	lea    (%rdx,%rdi,1),%rsi
   1401340c3:	lea    0x10(%rsi),%r8
   1401340c7:	jmp    14012b8e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e73>
   1401340cc:	mov    0x1c8(%rsp),%rax
   1401340d4:	mov    0x50(%rdi),%rdx
   1401340d8:	sub    0x48(%rdi),%rdx
   1401340dc:	mov    %rax,0x1d0(%rsp)
   1401340e4:	mov    0x60(%rdi),%rax
   1401340e8:	sar    $0x3,%rdx
   1401340ec:	test   %rax,%rax
   1401340ef:	je     140137373 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13903>
   1401340f5:	mov    0x18(%rax),%rax
   1401340f9:	add    %rax,%rdx
   1401340fc:	lea    0x680(%rsp),%rcx
   140134104:	mov    $0x2,%r12d
   14013410a:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14013410f:	mov    0x680(%rsp),%rax
   140134117:	mov    %rax,0x1c8(%rsp)
   14013411f:	jmp    140131f3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe4cf>
   140134124:	mov    0x1048(%rbx),%rcx
   14013412b:	mov    0x1050(%rbx),%rax
   140134132:	mov    %rsi,%r12
   140134135:	mov    %rax,0x38(%rsp)
   14013413a:	sub    %rcx,%rax
   14013413d:	sub    %rcx,%r12
   140134140:	mov    %rax,%rdx
   140134143:	sar    $0x3,%rdx
   140134147:	lea    (%rdx,%rdx,1),%rcx
   14013414b:	cmp    %rcx,%rdx
   14013414e:	jae    14012ddda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa36a>
   140134154:	mov    %r9b,0x40(%rsp)
   140134159:	mov    %rcx,%rdx
   14013415c:	lea    0x1048(%rbx),%rcx
   140134163:	vzeroupper
   140134166:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013416b:	mov    0x1048(%rbx),%rsi
   140134172:	mov    0x1050(%rbx),%rax
   140134179:	movzbl 0x40(%rsp),%r9d
   14013417f:	add    %r12,%rsi
   140134182:	mov    %rax,0x38(%rsp)
   140134187:	lea    0x8(%rsi),%r8
   14013418b:	jmp    14012ddda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa36a>
   140134190:	mov    %r9,%rdx
   140134193:	lea    0x1048(%rbx),%rcx
   14013419a:	vzeroupper
   14013419d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401341a2:	mov    0x1048(%rbx),%rdx
   1401341a9:	mov    0x1050(%rbx),%rax
   1401341b0:	lea    (%rdx,%r12,1),%rsi
   1401341b4:	lea    0x10(%rsi),%r8
   1401341b8:	jmp    14012b4d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a68>
   1401341bd:	mov    0x1050(%rbx),%rax
   1401341c4:	mov    %rsi,%r12
   1401341c7:	sub    %rdx,%r12
   1401341ca:	mov    %rax,%rcx
   1401341cd:	sub    %rdx,%rcx
   1401341d0:	sar    $0x3,%rcx
   1401341d4:	lea    (%rcx,%rcx,1),%r9
   1401341d8:	cmp    %r9,%rcx
   1401341db:	jb     14013676e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cfe>
   1401341e1:	vzeroupper
   1401341e4:	jmp    14012df99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa529>
   1401341e9:	mov    0x1050(%rbx),%rax
   1401341f0:	mov    %rsi,%r12
   1401341f3:	sub    %rdx,%r12
   1401341f6:	mov    %rax,%rcx
   1401341f9:	sub    %rdx,%rcx
   1401341fc:	sar    $0x3,%rcx
   140134200:	lea    (%rcx,%rcx,1),%r9
   140134204:	cmp    %r9,%rcx
   140134207:	jb     14013679b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d2b>
   14013420d:	vzeroupper
   140134210:	jmp    14012e293 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa823>
   140134215:	mov    %r9,%rdx
   140134218:	lea    0x1048(%rbx),%rcx
   14013421f:	vzeroupper
   140134222:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134227:	mov    0x1048(%rbx),%rdx
   14013422e:	mov    0x1050(%rbx),%rax
   140134235:	lea    (%rdx,%r12,1),%rsi
   140134239:	lea    0x10(%rsi),%r8
   14013423d:	jmp    14012af93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7523>
   140134242:	mov    0x1050(%rbx),%rax
   140134249:	mov    %rsi,%r12
   14013424c:	sub    %rdx,%r12
   14013424f:	mov    %rax,%rcx
   140134252:	sub    %rdx,%rcx
   140134255:	sar    $0x3,%rcx
   140134259:	lea    (%rcx,%rcx,1),%r9
   14013425d:	cmp    %r9,%rcx
   140134260:	jb     140137346 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138d6>
   140134266:	vzeroupper
   140134269:	jmp    14012dbc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa159>
   14013426e:	mov    %r9,%rdx
   140134271:	lea    0x1048(%rbx),%rcx
   140134278:	vzeroupper
   14013427b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134280:	mov    0x1048(%rbx),%rdx
   140134287:	mov    0x1050(%rbx),%rax
   14013428e:	lea    (%rdx,%r12,1),%rsi
   140134292:	lea    0x10(%rsi),%r8
   140134296:	jmp    14012ad9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x732e>
   14013429b:	mov    0x1050(%rbx),%rax
   1401342a2:	mov    %rsi,%r12
   1401342a5:	sub    %rdx,%r12
   1401342a8:	mov    %rax,%rcx
   1401342ab:	sub    %rdx,%rcx
   1401342ae:	sar    $0x3,%rcx
   1401342b2:	lea    (%rcx,%rcx,1),%r9
   1401342b6:	cmp    %r9,%rcx
   1401342b9:	jb     1401384d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a65>
   1401342bf:	vzeroupper
   1401342c2:	jmp    14012e1c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa757>
   1401342c7:	mov    %r9,%rdx
   1401342ca:	lea    0x1048(%rbx),%rcx
   1401342d1:	vzeroupper
   1401342d4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401342d9:	mov    0x1048(%rbx),%rdx
   1401342e0:	mov    0x1050(%rbx),%rax
   1401342e7:	lea    (%rdx,%r12,1),%rsi
   1401342eb:	lea    0x10(%rsi),%r8
   1401342ef:	jmp    14012ae5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73eb>
   1401342f4:	mov    0x1050(%rbx),%rax
   1401342fb:	mov    %rsi,%r12
   1401342fe:	sub    %rdx,%r12
   140134301:	mov    %rax,%rcx
   140134304:	sub    %rdx,%rcx
   140134307:	sar    $0x3,%rcx
   14013430b:	lea    (%rcx,%rcx,1),%r9
   14013430f:	cmp    %r9,%rcx
   140134312:	jb     140136465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129f5>
   140134318:	vzeroupper
   14013431b:	jmp    14012dd52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2e2>
   140134320:	mov    0x1050(%rbx),%rax
   140134327:	mov    %rsi,%r12
   14013432a:	sub    %rdx,%r12
   14013432d:	mov    %rax,%rcx
   140134330:	sub    %rdx,%rcx
   140134333:	sar    $0x3,%rcx
   140134337:	lea    (%rcx,%rcx,1),%r9
   14013433b:	cmp    %r9,%rcx
   14013433e:	jb     140138246 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147d6>
   140134344:	vzeroupper
   140134347:	jmp    14012df00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa490>
   14013434c:	mov    0x548(%rsp),%rcx
   140134354:	test   %rcx,%rcx
   140134357:	je     140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   14013435d:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140134362:	jmp    140126181 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2711>
   140134367:	lea    0x520(%rsp),%r8
   14013436f:	mov    0x60(%rsp),%rdx
   140134374:	mov    %r8,%rcx
   140134377:	mov    %r8,0x60(%rsp)
   14013437c:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140134381:	mov    0x60(%rsp),%r8
   140134386:	jmp    14012fbd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc164>
   14013438b:	lea    0x500(%rsp),%rax
   140134393:	mov    %r11,%rdx
   140134396:	mov    %rax,0x80(%rsp)
   14013439e:	mov    %rax,%rcx
   1401343a1:	vzeroupper
   1401343a4:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   1401343a9:	jmp    14012fb62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc0f2>
   1401343ae:	mov    0x1050(%rbx),%rax
   1401343b5:	mov    %rsi,%r12
   1401343b8:	sub    %rdx,%r12
   1401343bb:	mov    %rax,%rcx
   1401343be:	sub    %rdx,%rcx
   1401343c1:	sar    $0x3,%rcx
   1401343c5:	lea    (%rcx,%rcx,1),%r9
   1401343c9:	cmp    %r9,%rcx
   1401343cc:	jb     140136492 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a22>
   1401343d2:	vzeroupper
   1401343d5:	jmp    14012e392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa922>
   1401343da:	mov    %r9,%rdx
   1401343dd:	lea    0x1048(%rbx),%rcx
   1401343e4:	vzeroupper
   1401343e7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401343ec:	mov    0x1048(%rbx),%rdx
   1401343f3:	mov    0x1050(%rbx),%rax
   1401343fa:	lea    (%rdx,%r12,1),%rsi
   1401343fe:	lea    0x10(%rsi),%r8
   140134402:	jmp    14012b45a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79ea>
   140134407:	mov    0x1050(%rbx),%rax
   14013440e:	mov    0x1048(%rbx),%rdx
   140134415:	mov    %rax,0x38(%rsp)
   14013441a:	sub    %rdx,%rax
   14013441d:	sar    $0x3,%rax
   140134421:	lea    (%rax,%rax,1),%rcx
   140134425:	cmp    %rcx,%rax
   140134428:	jae    14012e691 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac21>
   14013442e:	sub    %rdx,%rsi
   140134431:	mov    %rcx,%rdx
   140134434:	lea    0x1048(%rbx),%rcx
   14013443b:	vzeroupper
   14013443e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134443:	mov    0x1050(%rbx),%rax
   14013444a:	add    0x1048(%rbx),%rsi
   140134451:	lea    0x8(%rsi),%r8
   140134455:	mov    %rax,0x38(%rsp)
   14013445a:	jmp    14012e691 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac21>
   14013445f:	mov    0x1050(%rbx),%rax
   140134466:	mov    %rsi,%r12
   140134469:	sub    %rdx,%r12
   14013446c:	mov    %rax,%rcx
   14013446f:	sub    %rdx,%rcx
   140134472:	sar    $0x3,%rcx
   140134476:	lea    (%rcx,%rcx,1),%r9
   14013447a:	cmp    %r9,%rcx
   14013447d:	jb     1401364dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a6c>
   140134483:	vzeroupper
   140134486:	jmp    14012dcc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa258>
   14013448b:	mov    0x1050(%rbx),%rax
   140134492:	mov    %rsi,%r12
   140134495:	sub    %rdx,%r12
   140134498:	mov    %rax,%rcx
   14013449b:	sub    %rdx,%rcx
   14013449e:	sar    $0x3,%rcx
   1401344a2:	lea    (%rcx,%rcx,1),%r9
   1401344a6:	cmp    %r9,%rcx
   1401344a9:	jb     1401371f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13783>
   1401344af:	vzeroupper
   1401344b2:	jmp    14012e12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6be>
   1401344b7:	mov    0x1050(%rbx),%rax
   1401344be:	mov    %rsi,%r12
   1401344c1:	sub    %rdx,%r12
   1401344c4:	mov    %rax,%rcx
   1401344c7:	sub    %rdx,%rcx
   1401344ca:	sar    $0x3,%rcx
   1401344ce:	lea    (%rcx,%rcx,1),%r9
   1401344d2:	cmp    %r9,%rcx
   1401344d5:	jae    14012dffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa58c>
   1401344db:	mov    %r9,%rdx
   1401344de:	lea    0x1048(%rbx),%rcx
   1401344e5:	vzeroupper
   1401344e8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401344ed:	mov    0x1048(%rbx),%rdx
   1401344f4:	mov    0x1050(%rbx),%rax
   1401344fb:	lea    (%rdx,%r12,1),%rsi
   1401344ff:	lea    0x8(%rsi),%r8
   140134503:	jmp    14012dffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa58c>
   140134508:	mov    0x1050(%rbx),%rax
   14013450f:	mov    %rsi,%r12
   140134512:	sub    %rdx,%r12
   140134515:	mov    %rax,%rcx
   140134518:	sub    %rdx,%rcx
   14013451b:	sar    $0x3,%rcx
   14013451f:	lea    (%rcx,%rcx,1),%r9
   140134523:	cmp    %r9,%rcx
   140134526:	jb     140136509 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a99>
   14013452c:	vzeroupper
   14013452f:	jmp    14012de43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3d3>
   140134534:	mov    %r9,%rdx
   140134537:	lea    0x1048(%rbx),%rcx
   14013453e:	vzeroupper
   140134541:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134546:	mov    0x1048(%rbx),%rdx
   14013454d:	mov    0x1050(%rbx),%rax
   140134554:	lea    (%rdx,%r12,1),%rsi
   140134558:	lea    0x10(%rsi),%r8
   14013455c:	jmp    14012ad5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72ef>
   140134561:	mov    %r9,%rdx
   140134564:	lea    0x1048(%rbx),%rcx
   14013456b:	vzeroupper
   14013456e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134573:	mov    0x1048(%rbx),%rdx
   14013457a:	mov    0x1050(%rbx),%rax
   140134581:	lea    (%rdx,%r12,1),%rsi
   140134585:	lea    0x10(%rsi),%r8
   140134589:	jmp    14012abc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7155>
   14013458e:	mov    %r9,%rdx
   140134591:	lea    0x1048(%rbx),%rcx
   140134598:	vzeroupper
   14013459b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401345a0:	mov    0x1048(%rbx),%rdx
   1401345a7:	mov    0x1050(%rbx),%rax
   1401345ae:	lea    (%rdx,%r12,1),%rsi
   1401345b2:	lea    0x10(%rsi),%r8
   1401345b6:	jmp    14012af54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74e4>
   1401345bb:	mov    0x1c8(%rsp),%rax
   1401345c3:	lea    0x680(%rsp),%rcx
   1401345cb:	lea    0x3e0(%rsp),%rdx
   1401345d3:	mov    %rax,0x1d0(%rsp)
   1401345db:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401345e0:	mov    0x688(%rsp),%rdx
   1401345e8:	lea    0x540(%rsp),%rcx
   1401345f0:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401345f5:	jmp    14012d897 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e27>
   1401345fa:	mov    0x1050(%rbx),%rax
   140134601:	mov    %rsi,%r12
   140134604:	sub    %rdx,%r12
   140134607:	mov    %rax,%rcx
   14013460a:	sub    %rdx,%rcx
   14013460d:	sar    $0x3,%rcx
   140134611:	lea    (%rcx,%rcx,1),%r9
   140134615:	cmp    %r9,%rcx
   140134618:	jb     140136a60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ff0>
   14013461e:	vzeroupper
   140134621:	jmp    14012dc2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1bf>
   140134626:	mov    0x1050(%rbx),%rax
   14013462d:	mov    %rsi,%r12
   140134630:	sub    %rdx,%r12
   140134633:	mov    %rax,%rcx
   140134636:	sub    %rdx,%rcx
   140134639:	sar    $0x3,%rcx
   14013463d:	lea    (%rcx,%rcx,1),%r9
   140134641:	cmp    %r9,%rcx
   140134644:	jb     140137d3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142cd>
   14013464a:	vzeroupper
   14013464d:	jmp    14012e22d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7bd>
   140134652:	mov    0x1050(%rbx),%rax
   140134659:	mov    %rsi,%r12
   14013465c:	sub    %rdx,%r12
   14013465f:	mov    %rax,%rcx
   140134662:	sub    %rdx,%rcx
   140134665:	sar    $0x3,%rcx
   140134669:	lea    (%rcx,%rcx,1),%r9
   14013466d:	cmp    %r9,%rcx
   140134670:	jb     140136d96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13326>
   140134676:	vzeroupper
   140134679:	jmp    14012e32c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8bc>
   14013467e:	mov    0x1050(%rbx),%rax
   140134685:	mov    %rsi,%r12
   140134688:	sub    %rdx,%r12
   14013468b:	mov    %rax,%rcx
   14013468e:	sub    %rdx,%rcx
   140134691:	sar    $0x3,%rcx
   140134695:	lea    (%rcx,%rcx,1),%r9
   140134699:	cmp    %r9,%rcx
   14013469c:	jb     1401360da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1266a>
   1401346a2:	vzeroupper
   1401346a5:	jmp    14012dc95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa225>
   1401346aa:	mov    0x60(%rsp),%rdx
   1401346af:	lea    0x540(%rsp),%rcx
   1401346b7:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401346bc:	mov    0x540(%rsp),%rax
   1401346c4:	mov    %rax,0x1c8(%rsp)
   1401346cc:	mov    $0x1,%r12d
   1401346d2:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   1401346d7:	mov    %r9,%rdx
   1401346da:	lea    0x1048(%rbx),%rcx
   1401346e1:	vzeroupper
   1401346e4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401346e9:	mov    0x1048(%rbx),%rdx
   1401346f0:	mov    0x1050(%rbx),%rax
   1401346f7:	lea    (%rdx,%r12,1),%rsi
   1401346fb:	lea    0x10(%rsi),%r8
   1401346ff:	jmp    14012aed9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7469>
   140134704:	mov    %r9,%rdx
   140134707:	lea    0x1048(%rbx),%rcx
   14013470e:	vzeroupper
   140134711:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134716:	mov    0x1048(%rbx),%rdx
   14013471d:	mov    0x1050(%rbx),%rax
   140134724:	lea    (%rdx,%r12,1),%rsi
   140134728:	lea    0x10(%rsi),%r8
   14013472c:	jmp    14012bd64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82f4>
   140134731:	lea    0x15270(%rbx),%rcx
   140134738:	mov    %rbx,%rdx
   14013473b:	vzeroupper
   14013473e:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   140134743:	jmp    140130490 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca20>
   140134748:	mov    %r9,%rdx
   14013474b:	lea    0x1048(%rbx),%rcx
   140134752:	vzeroupper
   140134755:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013475a:	mov    0x1048(%rbx),%rdx
   140134761:	mov    0x1050(%rbx),%rax
   140134768:	lea    (%rdx,%r12,1),%rsi
   14013476c:	lea    0x10(%rsi),%r8
   140134770:	jmp    14012afd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7562>
   140134775:	mov    0x1c8(%rsp),%rax
   14013477d:	lea    0x680(%rsp),%r10
   140134785:	mov    $0x1,%edx
   14013478a:	lea    0x690(%rsp),%r12
   140134792:	mov    %r10,%rcx
   140134795:	mov    %r10,0x40(%rsp)
   14013479a:	mov    %rax,0x1d0(%rsp)
   1401347a2:	mov    0x540(%rsp),%rax
   1401347aa:	movsbl (%rax,%rdi,1),%r8d
   1401347af:	mov    %r12,0x680(%rsp)
   1401347b7:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   1401347bc:	mov    0x40(%rsp),%rdx
   1401347c1:	lea    0x520(%rsp),%rcx
   1401347c9:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   1401347ce:	mov    0x520(%rsp),%rax
   1401347d6:	mov    0x680(%rsp),%rcx
   1401347de:	mov    %rax,0x1c8(%rsp)
   1401347e6:	cmp    %r12,%rcx
   1401347e9:	je     1401314ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda5a>
   1401347ef:	mov    0x690(%rsp),%rax
   1401347f7:	lea    0x1(%rax),%rdx
   1401347fb:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140134800:	jmp    1401314ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda5a>
   140134805:	mov    0x540(%rsp),%rax
   14013480d:	lea    0x680(%rsp),%r10
   140134815:	mov    $0x1,%edx
   14013481a:	lea    0x690(%rsp),%r12
   140134822:	mov    %r10,%rcx
   140134825:	mov    %r10,0x40(%rsp)
   14013482a:	movsbl (%rax,%rdi,1),%r8d
   14013482f:	mov    %r12,0x680(%rsp)
   140134837:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14013483c:	mov    0x40(%rsp),%rdx
   140134841:	lea    0x520(%rsp),%rcx
   140134849:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14013484e:	mov    0x520(%rsp),%rax
   140134856:	mov    0x680(%rsp),%rcx
   14013485e:	mov    %rax,0x1c8(%rsp)
   140134866:	cmp    %r12,%rcx
   140134869:	je     140132866 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedf6>
   14013486f:	mov    0x690(%rsp),%rax
   140134877:	lea    0x1(%rax),%rdx
   14013487b:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140134880:	jmp    140132866 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedf6>
   140134885:	mov    0x1050(%rbx),%rax
   14013488c:	mov    %rsi,%r12
   14013488f:	sub    %rdx,%r12
   140134892:	mov    %rax,%rcx
   140134895:	sub    %rdx,%rcx
   140134898:	sar    $0x3,%rcx
   14013489c:	lea    (%rcx,%rcx,1),%r9
   1401348a0:	cmp    %r9,%rcx
   1401348a3:	jb     140136613 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ba3>
   1401348a9:	vzeroupper
   1401348ac:	jmp    14012dc62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1f2>
   1401348b1:	cmp    $0x1,%dil
   1401348b5:	je     140137130 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136c0>
   1401348bb:	cmp    $0x2,%r12b
   1401348bf:	je     1401370fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1368c>
   1401348c5:	cmp    $0x1,%r12b
   1401348c9:	jne    1401370f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13680>
   1401348cf:	mov    0x1048(%rbx),%rdx
   1401348d6:	lea    0x8(%rsi),%r8
   1401348da:	cmp    0x38(%rsp),%r8
   1401348df:	jae    14013709b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1362b>
   1401348e5:	mov    0x1c8(%rsp),%rax
   1401348ed:	xor    %r12d,%r12d
   1401348f0:	mov    %rax,(%rsi)
   1401348f3:	mov    %r8,%rsi
   1401348f6:	movzbl %dil,%r9d
   1401348fa:	mov    0x1068(%rbx),%rcx
   140134901:	movzbl %dil,%eax
   140134905:	imul   $0xfffffffffffffff8,%r9,%r10
   140134909:	add    %r13,%r9
   14013490c:	lea    -0x1(%rax),%r11d
   140134910:	xor    %eax,%eax
   140134912:	lea    (%rcx,%r9,8),%r8
   140134916:	mov    -0x8(%rsi,%rax,1),%r9
   14013491b:	mov    %r9,(%r8,%rax,1)
   14013491f:	sub    $0x8,%rax
   140134923:	cmp    %r10,%rax
   140134926:	jne    140134916 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ea6>
   140134928:	mov    %rsi,%r8
   14013492b:	imul   $0xfffffffffffffff8,%r11,%r11
   14013492f:	mov    -0x8(%r8,%rax,1),%rax
   140134934:	lea    -0x10(%rsi,%r11,1),%rsi
   140134939:	mov    %rax,(%rcx,%r13,8)
   14013493d:	jmp    14012f46b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9fb>
   140134942:	mov    0x1050(%rbx),%rax
   140134949:	mov    %rsi,%r12
   14013494c:	sub    %rdx,%r12
   14013494f:	mov    %rax,%rcx
   140134952:	sub    %rdx,%rcx
   140134955:	sar    $0x3,%rcx
   140134959:	lea    (%rcx,%rcx,1),%r9
   14013495d:	cmp    %r9,%rcx
   140134960:	jb     14013749e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a2e>
   140134966:	vzeroupper
   140134969:	jmp    14012db30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0c0>
   14013496e:	mov    %eax,0x60(%rsp)
   140134972:	add    %rdx,%rdx
   140134975:	lea    0x1068(%rbx),%rcx
   14013497c:	mov    %r8d,0x80(%rsp)
   140134984:	mov    %r9d,0x40(%rsp)
   140134989:	vzeroupper
   14013498c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134991:	mov    0x80(%rsp),%r8d
   140134999:	mov    0x60(%rsp),%eax
   14013499d:	mov    0x40(%rsp),%r9d
   1401349a2:	jmp    140124812 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda2>
   1401349a7:	mov    0x1050(%rbx),%rax
   1401349ae:	mov    %rax,0x38(%rsp)
   1401349b3:	sub    %rdx,%rax
   1401349b6:	sar    $0x3,%rax
   1401349ba:	lea    (%rax,%rax,1),%rcx
   1401349be:	cmp    %rcx,%rax
   1401349c1:	jae    14012e94e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaede>
   1401349c7:	sub    %rdx,%rsi
   1401349ca:	mov    %rcx,%rdx
   1401349cd:	lea    0x1048(%rbx),%rcx
   1401349d4:	vzeroupper
   1401349d7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401349dc:	mov    0x1048(%rbx),%rdx
   1401349e3:	mov    0x1050(%rbx),%rax
   1401349ea:	add    %rdx,%rsi
   1401349ed:	mov    %rax,0x38(%rsp)
   1401349f2:	lea    0x8(%rsi),%r8
   1401349f6:	jmp    14012e94e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaede>
   1401349fb:	mov    0x400(%rsp),%rdi
   140134a03:	test   %r12b,%r12b
   140134a06:	je     1401386ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c7a>
   140134a0c:	sub    $0x1,%r12b
   140134a10:	je     1401386af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c3f>
   140134a16:	lea    0x8(%rsi),%r8
   140134a1a:	cmp    0x38(%rsp),%r8
   140134a1f:	jae    140136fd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13568>
   140134a25:	mov    0x1d0(%rsp),%rax
   140134a2d:	mov    %r8,0x40(%rsp)
   140134a32:	lea    0x680(%rsp),%rcx
   140134a3a:	mov    %rdi,%rdx
   140134a3d:	mov    %rax,(%rsi)
   140134a40:	mov    0x1c8(%rsp),%rax
   140134a48:	mov    %rax,0x1d0(%rsp)
   140134a50:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140134a55:	mov    $0x2,%r12d
   140134a5b:	mov    0x40(%rsp),%rsi
   140134a60:	mov    0x680(%rsp),%rax
   140134a68:	mov    %rax,0x1c8(%rsp)
   140134a70:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140134a75:	mov    %r9,%rdx
   140134a78:	lea    0x1048(%rbx),%rcx
   140134a7f:	vzeroupper
   140134a82:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134a87:	mov    0x1048(%rbx),%rdx
   140134a8e:	mov    0x1050(%rbx),%rax
   140134a95:	lea    (%rdx,%rdi,1),%rsi
   140134a99:	lea    0x8(%rsi),%r8
   140134a9d:	jmp    14012477c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0c>
   140134aa2:	mov    %r9,%rdx
   140134aa5:	lea    0x1048(%rbx),%rcx
   140134aac:	vzeroupper
   140134aaf:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134ab4:	mov    0x1048(%rbx),%rdx
   140134abb:	mov    0x1050(%rbx),%rax
   140134ac2:	lea    (%rdx,%r12,1),%rsi
   140134ac6:	lea    0x10(%rsi),%r8
   140134aca:	jmp    14012b07e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x760e>
   140134acf:	lea    0x338(%rsp),%rdx
   140134ad7:	lea    0x680(%rsp),%rcx
   140134adf:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140134ae4:	mov    0x40(%rsp),%rcx
   140134ae9:	lea    0x680(%rsp),%rdx
   140134af1:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134af6:	mov    0x680(%rsp),%rcx
   140134afe:	mov    %rax,0x1c8(%rsp)
   140134b06:	lea    0x690(%rsp),%rax
   140134b0e:	cmp    %rax,%rcx
   140134b11:	je     14012d6c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c51>
   140134b17:	mov    0x690(%rsp),%rax
   140134b1f:	lea    0x1(%rax),%rdx
   140134b23:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140134b28:	jmp    14012d6c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c51>
   140134b2d:	mov    %r9,%rdx
   140134b30:	lea    0x1048(%rbx),%rcx
   140134b37:	vzeroupper
   140134b3a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b3f:	mov    0x1048(%rbx),%rdx
   140134b46:	mov    0x1050(%rbx),%rax
   140134b4d:	lea    (%rdx,%r12,1),%rsi
   140134b51:	lea    0x10(%rsi),%r8
   140134b55:	jmp    14012ac43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71d3>
   140134b5a:	mov    %r9,%rdx
   140134b5d:	lea    0x1048(%rbx),%rcx
   140134b64:	vzeroupper
   140134b67:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b6c:	mov    0x1048(%rbx),%rdx
   140134b73:	mov    0x1050(%rbx),%rax
   140134b7a:	lea    (%rdx,%r12,1),%rsi
   140134b7e:	lea    0x10(%rsi),%r8
   140134b82:	jmp    14012b91f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7eaf>
   140134b87:	mov    0x60(%rsp),%rdx
   140134b8c:	lea    0x540(%rsp),%rcx
   140134b94:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140134b99:	mov    0x540(%rsp),%rax
   140134ba1:	mov    %rax,0x1c8(%rsp)
   140134ba9:	jmp    14012d6c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c51>
   140134bae:	lea    0x310(%rsp),%rcx
   140134bb6:	call   14021aa80 <setun::VMValue::as_int() const>
   140134bbb:	mov    %rax,%r9
   140134bbe:	test   %rax,%rax
   140134bc1:	js     1401353fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1198b>
   140134bc7:	mov    %rdi,%rcx
   140134bca:	mov    %r9,0x60(%rsp)
   140134bcf:	call   140147380 <setun::ArrayObject::size() const>
   140134bd4:	mov    0x60(%rsp),%r9
   140134bd9:	cmp    %rax,%r9
   140134bdc:	jae    140135416 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119a6>
   140134be2:	test   %r12b,%r12b
   140134be5:	je     140138645 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bd5>
   140134beb:	sub    $0x1,%r12b
   140134bef:	je     140138625 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb5>
   140134bf5:	lea    0x8(%rsi),%r8
   140134bf9:	cmp    0x38(%rsp),%r8
   140134bfe:	jae    1401385c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b59>
   140134c04:	mov    0x1d0(%rsp),%rax
   140134c0c:	mov    %r9,%rdx
   140134c0f:	mov    %rdi,%rcx
   140134c12:	mov    %r8,0x60(%rsp)
   140134c17:	mov    %rax,(%rsi)
   140134c1a:	mov    0x1c8(%rsp),%rax
   140134c22:	mov    %rax,0x1d0(%rsp)
   140134c2a:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140134c2f:	mov    %rax,0x1c8(%rsp)
   140134c37:	mov    0x60(%rsp),%rsi
   140134c3c:	mov    $0x2,%r12d
   140134c42:	jmp    14012f397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb927>
   140134c47:	add    %rdx,%rdx
   140134c4a:	lea    0x1068(%rbx),%rcx
   140134c51:	vzeroupper
   140134c54:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134c59:	jmp    140126425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29b5>
   140134c5e:	mov    0x1c8(%rsp),%rax
   140134c66:	xor    %edx,%edx
   140134c68:	mov    %rax,0x1d0(%rsp)
   140134c70:	test   %rdi,%rdi
   140134c73:	je     140134c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11210>
   140134c75:	mov    %rdi,%rcx
   140134c78:	call   140147380 <setun::ArrayObject::size() const>
   140134c7d:	mov    %rax,%rdx
   140134c80:	lea    0x680(%rsp),%rcx
   140134c88:	mov    $0x2,%r12d
   140134c8e:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140134c93:	mov    0x680(%rsp),%rax
   140134c9b:	mov    %rax,0x1c8(%rsp)
   140134ca3:	jmp    14012ffca <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc55a>
   140134ca8:	lea    0x540(%rsp),%rax
   140134cb0:	mov    %r11,%rdx
   140134cb3:	mov    %r8,0x60(%rsp)
   140134cb8:	mov    %rax,%rcx
   140134cbb:	mov    %rax,0x40(%rsp)
   140134cc0:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140134cc5:	mov    0x40(%rsp),%rax
   140134cca:	mov    0x60(%rsp),%r8
   140134ccf:	jmp    140130cd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd266>
   140134cd4:	lea    0x540(%rsp),%rax
   140134cdc:	mov    0x40(%rsp),%rdx
   140134ce1:	mov    %r8,0x60(%rsp)
   140134ce6:	mov    %rax,%rcx
   140134ce9:	mov    %rax,0x40(%rsp)
   140134cee:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140134cf3:	mov    0x40(%rsp),%rax
   140134cf8:	mov    0x60(%rsp),%r8
   140134cfd:	jmp    14012fc50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1e0>
   140134d02:	lea    0x520(%rsp),%r8
   140134d0a:	mov    %r9,%rdx
   140134d0d:	mov    %r11,0x60(%rsp)
   140134d12:	mov    %r8,%rcx
   140134d15:	mov    %r8,0x40(%rsp)
   140134d1a:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140134d1f:	mov    0x40(%rsp),%r8
   140134d24:	mov    0x60(%rsp),%r11
   140134d29:	jmp    140130c5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1ee>
   140134d2e:	test   %r12b,%r12b
   140134d31:	jne    140135621 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bb1>
   140134d37:	mov    $0x1fff,%eax
   140134d3c:	shl    $0x33,%rax
   140134d40:	mov    %rax,0x1c8(%rsp)
   140134d48:	mov    $0x1,%r12d
   140134d4e:	jmp    140131a52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfe2>
   140134d53:	mov    0x540(%rsp),%rax
   140134d5b:	lea    0x680(%rsp),%r10
   140134d63:	mov    $0x1,%edx
   140134d68:	lea    0x690(%rsp),%r12
   140134d70:	mov    %r10,%rcx
   140134d73:	mov    %r10,0x40(%rsp)
   140134d78:	movsbl (%rax,%rdi,1),%r8d
   140134d7d:	mov    %r12,0x680(%rsp)
   140134d85:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140134d8a:	mov    0x40(%rsp),%rdx
   140134d8f:	lea    0x520(%rsp),%rcx
   140134d97:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140134d9c:	mov    0x520(%rsp),%rax
   140134da4:	mov    0x680(%rsp),%rcx
   140134dac:	mov    %rax,0x1c8(%rsp)
   140134db4:	cmp    %r12,%rcx
   140134db7:	je     140132b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf11e>
   140134dbd:	mov    0x690(%rsp),%rax
   140134dc5:	lea    0x1(%rax),%rdx
   140134dc9:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140134dce:	jmp    140132b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf11e>
   140134dd3:	mov    0x1050(%rbx),%rax
   140134dda:	mov    0x1048(%rbx),%rdx
   140134de1:	mov    %rax,0x38(%rsp)
   140134de6:	sub    %rdx,%rax
   140134de9:	sar    $0x3,%rax
   140134ded:	lea    (%rax,%rax,1),%rcx
   140134df1:	cmp    %rcx,%rax
   140134df4:	jae    14012d933 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ec3>
   140134dfa:	sub    %rdx,%rsi
   140134dfd:	mov    %rcx,%rdx
   140134e00:	lea    0x1048(%rbx),%rcx
   140134e07:	vzeroupper
   140134e0a:	jmp    14013218c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe71c>
   140134e0f:	mov    0x1050(%rbx),%rax
   140134e16:	mov    %rsi,%r12
   140134e19:	sub    %rdx,%r12
   140134e1c:	mov    %rax,%rcx
   140134e1f:	sub    %rdx,%rcx
   140134e22:	sar    $0x3,%rcx
   140134e26:	lea    (%rcx,%rcx,1),%r9
   140134e2a:	cmp    %r9,%rcx
   140134e2d:	jb     1401369de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f6e>
   140134e33:	vzeroupper
   140134e36:	jmp    14012e062 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5f2>
   140134e3b:	mov    0x1050(%rbx),%rax
   140134e42:	mov    %rsi,%r12
   140134e45:	sub    %rdx,%r12
   140134e48:	mov    %rax,%rcx
   140134e4b:	sub    %rdx,%rcx
   140134e4e:	sar    $0x3,%rcx
   140134e52:	lea    (%rcx,%rcx,1),%r9
   140134e56:	cmp    %r9,%rcx
   140134e59:	jb     140136e1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133ab>
   140134e5f:	vzeroupper
   140134e62:	jmp    14012e1fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78a>
   140134e67:	mov    (%rdi),%rdx
   140134e6a:	mov    $0xffffffff,%eax
   140134e6f:	mov    $0xfffd0003,%ecx
   140134e74:	shl    $0x20,%rax
   140134e78:	shl    $0x20,%rcx
   140134e7c:	and    %rax,%rdx
   140134e7f:	cmp    %rcx,%rdx
   140134e82:	jne    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134e88:	mov    0xe0(%rsp),%rcx
   140134e90:	and    (%rcx),%rax
   140134e93:	cmp    %rdx,%rax
   140134e96:	jne    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134e9c:	mov    %rdi,%rcx
   140134e9f:	call   14021bef0 <setun::VMValue::payload() const>
   140134ea4:	mov    0xe0(%rsp),%rcx
   140134eac:	mov    0x58(%rax),%rdi
   140134eb0:	mov    %rdi,0xc0(%rsp)
   140134eb8:	call   14021bef0 <setun::VMValue::payload() const>
   140134ebd:	mov    0x58(%rax),%rax
   140134ec1:	mov    %rax,0xe0(%rsp)
   140134ec9:	test   %rdi,%rdi
   140134ecc:	je     140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134ed2:	test   %rax,%rax
   140134ed5:	je     140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134edb:	mov    0x100(%rsp),%rcx
   140134ee3:	call   14021aa80 <setun::VMValue::as_int() const>
   140134ee8:	mov    0x80(%rsp),%rcx
   140134ef0:	mov    %rax,0x40(%rsp)
   140134ef5:	call   14021aa80 <setun::VMValue::as_int() const>
   140134efa:	mov    %rax,%rdi
   140134efd:	cmpq   $0x0,0x40(%rsp)
   140134f03:	js     140136e9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1342a>
   140134f09:	test   %rax,%rax
   140134f0c:	js     140136eb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13441>
   140134f12:	mov    0xc0(%rsp),%rcx
   140134f1a:	call   140147380 <setun::ArrayObject::size() const>
   140134f1f:	cmp    %rax,0x40(%rsp)
   140134f24:	jae    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134f2a:	test   %rdi,%rdi
   140134f2d:	js     140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134f33:	mov    0xe0(%rsp),%rcx
   140134f3b:	call   140147380 <setun::ArrayObject::size() const>
   140134f40:	cmp    %rax,%rdi
   140134f43:	jae    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134f49:	mov    0xe0(%rsp),%rcx
   140134f51:	mov    %rdi,%rdx
   140134f54:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140134f59:	mov    0xa0(%rsp),%rcx
   140134f61:	lea    0x680(%rsp),%rdx
   140134f69:	mov    %rax,0x680(%rsp)
   140134f71:	call   140219f20 <setun::VMValue::mul(setun::VMValue const&) const>
   140134f76:	mov    0x40(%rsp),%rdx
   140134f7b:	mov    0xc0(%rsp),%rcx
   140134f83:	mov    %rax,0x520(%rsp)
   140134f8b:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140134f90:	lea    0x520(%rsp),%rdx
   140134f98:	lea    0x680(%rsp),%rcx
   140134fa0:	mov    %rax,0x680(%rsp)
   140134fa8:	call   140218ec0 <setun::VMValue::add(setun::VMValue const&) const>
   140134fad:	mov    0x40(%rsp),%rdx
   140134fb2:	mov    0xc0(%rsp),%rcx
   140134fba:	lea    0x540(%rsp),%r8
   140134fc2:	mov    %rax,0x540(%rsp)
   140134fca:	call   14014a960 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   140134fcf:	jmp    140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140134fd4:	mov    0x1c8(%rsp),%rax
   140134fdc:	lea    0x680(%rsp),%rcx
   140134fe4:	lea    0x226ada(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   140134feb:	mov    %rax,0x1d0(%rsp)
   140134ff3:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   140134ff8:	mov    0x680(%rsp),%rax
   140135000:	mov    $0x2,%r12d
   140135006:	mov    %rax,0x1c8(%rsp)
   14013500e:	jmp    14012c7ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d7d>
   140135013:	test   %r12b,%r12b
   140135016:	jne    140136306 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12896>
   14013501c:	mov    0x8(%r10),%rax
   140135020:	mov    $0x1,%r12d
   140135026:	mov    (%rax,%rdi,8),%rax
   14013502a:	mov    %rax,0x1c8(%rsp)
   140135032:	cmpb   $0x0,0x1040(%rbx)
   140135039:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   14013503f:	movzbl 0x0(%rbp),%eax
   140135043:	lea    0x28b056(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013504a:	add    $0x1,%rbp
   14013504e:	mov    (%rdi,%rax,8),%rax
   140135052:	jmp    *%rax
   140135054:	test   %r12b,%r12b
   140135057:	je     1401384a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a35>
   14013505d:	sub    $0x1,%r12b
   140135061:	je     140138465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149f5>
   140135067:	lea    0x8(%rsi),%r8
   14013506b:	cmp    0x38(%rsp),%r8
   140135070:	jae    140136bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1315c>
   140135076:	mov    0x1d0(%rsp),%rax
   14013507e:	lea    0x680(%rsp),%rcx
   140135086:	mov    %r8,0x40(%rsp)
   14013508b:	mov    $0x2,%r12d
   140135091:	mov    %rax,(%rsi)
   140135094:	mov    0x1c8(%rsp),%rax
   14013509c:	mov    %rax,0x1d0(%rsp)
   1401350a4:	mov    0x20(%r10),%rax
   1401350a8:	mov    (%rax,%rdi,8),%rdx
   1401350ac:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401350b1:	mov    0x680(%rsp),%rax
   1401350b9:	mov    0x40(%rsp),%rsi
   1401350be:	mov    %rax,0x1c8(%rsp)
   1401350c6:	cmpb   $0x0,0x1040(%rbx)
   1401350cd:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   1401350d3:	movzbl 0x0(%rbp),%eax
   1401350d7:	lea    0x28afc2(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401350de:	add    $0x1,%rbp
   1401350e2:	mov    (%rdi,%rax,8),%rax
   1401350e6:	jmp    *%rax
   1401350e8:	cmp    $0x4,%al
   1401350ea:	jne    140135013 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115a3>
   1401350f0:	test   %r12b,%r12b
   1401350f3:	je     140136ceb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1327b>
   1401350f9:	sub    $0x1,%r12b
   1401350fd:	je     140136c8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1321a>
   140135103:	lea    0x8(%rsi),%r8
   140135107:	cmp    0x38(%rsp),%r8
   14013510c:	jae    140136c2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131bb>
   140135112:	mov    0x1d0(%rsp),%rax
   14013511a:	mov    %r8,0x40(%rsp)
   14013511f:	lea    0x1a0(%rsp),%rdx
   140135127:	lea    0x680(%rsp),%rcx
   14013512f:	mov    $0x2,%r12d
   140135135:	mov    %rax,(%rsi)
   140135138:	mov    0x1c8(%rsp),%rax
   140135140:	mov    %rax,0x1d0(%rsp)
   140135148:	imul   $0x18,%rdi,%rax
   14013514c:	add    0x68(%r10),%rax
   140135150:	vmovdqu (%rax),%xmm7
   140135154:	vmovdqa %xmm7,0x1a0(%rsp)
   14013515d:	mov    0x10(%rax),%rax
   140135161:	mov    %rax,0x1b0(%rsp)
   140135169:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   14013516e:	mov    0x680(%rsp),%rax
   140135176:	mov    0x40(%rsp),%rsi
   14013517b:	mov    %rax,0x1c8(%rsp)
   140135183:	cmpb   $0x0,0x1040(%rbx)
   14013518a:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   140135190:	movzbl 0x0(%rbp),%eax
   140135194:	lea    0x28af05(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013519b:	add    $0x1,%rbp
   14013519f:	mov    (%rdi,%rax,8),%rax
   1401351a3:	jmp    *%rax
   1401351a5:	test   %r12b,%r12b
   1401351a8:	jne    140137e8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1441a>
   1401351ae:	mov    0x50(%r10),%rax
   1401351b2:	mov    $0x1,%r12d
   1401351b8:	movabs $0xfffc000000000000,%rdx
   1401351c2:	vmovsd (%rax,%rdi,8),%xmm0
   1401351c7:	vucomisd %xmm0,%xmm0
   1401351cb:	vmovq  %xmm0,%rax
   1401351d0:	cmovp  %rdx,%rax
   1401351d4:	mov    %rax,0x1c8(%rsp)
   1401351dc:	cmpb   $0x0,0x1040(%rbx)
   1401351e3:	je     14012d2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9866>
   1401351e9:	movzbl 0x0(%rbp),%eax
   1401351ed:	lea    0x28aeac(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401351f4:	add    $0x1,%rbp
   1401351f8:	mov    (%rdi,%rax,8),%rax
   1401351fc:	jmp    *%rax
   1401351fe:	lea    0x680(%rsp),%r10
   140135206:	lea    0x310(%rsp),%rdx
   14013520e:	mov    %r10,%rcx
   140135211:	mov    %r10,0x60(%rsp)
   140135216:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013521b:	mov    0x40(%rsp),%rcx
   140135220:	mov    0x60(%rsp),%rdx
   140135225:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14013522a:	mov    0x680(%rsp),%rcx
   140135232:	mov    %rax,0x1c8(%rsp)
   14013523a:	lea    0x690(%rsp),%rax
   140135242:	cmp    %rax,%rcx
   140135245:	je     140134d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112d8>
   14013524b:	mov    0x690(%rsp),%rax
   140135253:	lea    0x1(%rax),%rdx
   140135257:	call   1403389b0 <operator delete(void*, unsigned long long)>
   14013525c:	jmp    140134d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112d8>
   140135261:	mov    0x1048(%rbx),%rdx
   140135268:	mov    0x1050(%rbx),%rax
   14013526f:	lea    0x10(%rsi),%r8
   140135273:	cmp    0x38(%rsp),%r8
   140135278:	jae    1401362c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12850>
   14013527e:	vzeroupper
   140135281:	mov    0x1d0(%rsp),%rcx
   140135289:	mov    %rcx,(%rsi)
   14013528c:	mov    0x1c8(%rsp),%rcx
   140135294:	mov    %rcx,0x8(%rsi)
   140135298:	jmp    140131d99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe329>
   14013529d:	mov    0x40(%rsp),%rcx
   1401352a2:	lea    0x318(%rsp),%r8
   1401352aa:	mov    %rdi,%rdx
   1401352ad:	call   14014a960 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   1401352b2:	jmp    14012f063 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb5f3>
   1401352b7:	mov    %rdi,%rcx
   1401352ba:	mov    %rax,0x40(%rsp)
   1401352bf:	call   140147380 <setun::ArrayObject::size() const>
   1401352c4:	mov    0x40(%rsp),%rdx
   1401352c9:	add    %rax,%rdx
   1401352cc:	jns    14012f586 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb16>
   1401352d2:	jmp    140128118 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a8>
   1401352d7:	mov    0x1050(%rbx),%rax
   1401352de:	mov    %rsi,%r12
   1401352e1:	sub    %rdx,%r12
   1401352e4:	mov    %rax,%rcx
   1401352e7:	sub    %rdx,%rcx
   1401352ea:	sar    $0x3,%rcx
   1401352ee:	lea    (%rcx,%rcx,1),%r9
   1401352f2:	cmp    %r9,%rcx
   1401352f5:	jb     14013837c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1490c>
   1401352fb:	vzeroupper
   1401352fe:	jmp    14012de10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a0>
   140135303:	test   %r12b,%r12b
   140135306:	je     140138438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149c8>
   14013530c:	sub    $0x1,%r12b
   140135310:	je     1401383fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1498b>
   140135316:	lea    0x8(%rsi),%r8
   14013531a:	cmp    0x38(%rsp),%r8
   14013531f:	jae    1401383a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14939>
   140135325:	mov    0x40(%rsp),%rdx
   14013532a:	mov    %r8,0x60(%rsp)
   14013532f:	lea    0x540(%rsp),%rcx
   140135337:	mov    $0x2,%r12d
   14013533d:	mov    0x1d0(%rsp),%rax
   140135345:	mov    %rax,(%rsi)
   140135348:	mov    0x1c8(%rsp),%rax
   140135350:	mov    %rax,0x1d0(%rsp)
   140135358:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   14013535d:	mov    0x540(%rsp),%rax
   140135365:	mov    0x60(%rsp),%rsi
   14013536a:	mov    %rax,0x1c8(%rsp)
   140135372:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   140135377:	mov    0x1050(%rbx),%rax
   14013537e:	mov    %rsi,%r12
   140135381:	sub    %rdx,%r12
   140135384:	mov    %rax,%rcx
   140135387:	sub    %rdx,%rcx
   14013538a:	sar    $0x3,%rcx
   14013538e:	lea    (%rcx,%rcx,1),%r9
   140135392:	cmp    %r9,%rcx
   140135395:	jb     140136053 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125e3>
   14013539b:	vzeroupper
   14013539e:	jmp    14012df66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4f6>
   1401353a3:	mov    0x1050(%rbx),%rax
   1401353aa:	mov    %rsi,%r12
   1401353ad:	sub    %rdx,%r12
   1401353b0:	mov    %rax,%rcx
   1401353b3:	sub    %rdx,%rcx
   1401353b6:	sar    $0x3,%rcx
   1401353ba:	lea    (%rcx,%rcx,1),%r9
   1401353be:	cmp    %r9,%rcx
   1401353c1:	jb     140137f98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14528>
   1401353c7:	vzeroupper
   1401353ca:	jmp    14012e161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6f1>
   1401353cf:	mov    0x1050(%rbx),%rax
   1401353d6:	mov    %rsi,%r12
   1401353d9:	sub    %rdx,%r12
   1401353dc:	mov    %rax,%rcx
   1401353df:	sub    %rdx,%rcx
   1401353e2:	sar    $0x3,%rcx
   1401353e6:	lea    (%rcx,%rcx,1),%r9
   1401353ea:	cmp    %r9,%rcx
   1401353ed:	jb     140138655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14be5>
   1401353f3:	vzeroupper
   1401353f6:	jmp    14012e095 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa625>
   1401353fb:	mov    %rdi,%rcx
   1401353fe:	mov    %rax,0x60(%rsp)
   140135403:	call   140147380 <setun::ArrayObject::size() const>
   140135408:	mov    0x60(%rsp),%r9
   14013540d:	add    %rax,%r9
   140135410:	jns    140134bc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11157>
   140135416:	test   %r12b,%r12b
   140135419:	je     1401320a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe631>
   14013541f:	sub    $0x1,%r12b
   140135423:	jne    14012f352 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8e2>
   140135429:	mov    0x1c8(%rsp),%rax
   140135431:	mov    %rax,0x1d0(%rsp)
   140135439:	mov    $0x1fff,%eax
   14013543e:	shl    $0x33,%rax
   140135442:	mov    %rax,0x1c8(%rsp)
   14013544a:	jmp    14012f391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb921>
   14013544f:	mov    0x1c8(%rsp),%rax
   140135457:	mov    $0x2,%r12d
   14013545d:	mov    %rax,0x1d0(%rsp)
   140135465:	movabs $0xfff8000000000000,%rax
   14013546f:	mov    %rax,0x1c8(%rsp)
   140135477:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   14013547c:	mov    %r9,%rdx
   14013547f:	lea    0x1048(%rbx),%rcx
   140135486:	vzeroupper
   140135489:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013548e:	mov    0x1048(%rbx),%rdx
   140135495:	mov    0x1050(%rbx),%rax
   14013549c:	lea    (%rdx,%r12,1),%rsi
   1401354a0:	lea    0x10(%rsi),%r8
   1401354a4:	jmp    14012b99d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f2d>
   1401354a9:	mov    0x1050(%rbx),%rax
   1401354b0:	mov    %rsi,%r12
   1401354b3:	sub    %rdx,%r12
   1401354b6:	mov    %rax,%rcx
   1401354b9:	sub    %rdx,%rcx
   1401354bc:	sar    $0x3,%rcx
   1401354c0:	lea    (%rcx,%rcx,1),%r9
   1401354c4:	cmp    %r9,%rcx
   1401354c7:	jb     140136a8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1301d>
   1401354cd:	vzeroupper
   1401354d0:	jmp    14012ddb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa348>
   1401354d5:	mov    %r9,%rdx
   1401354d8:	lea    0x1048(%rbx),%rcx
   1401354df:	vzeroupper
   1401354e2:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401354e7:	mov    0x1048(%rbx),%rdx
   1401354ee:	mov    0x1050(%rbx),%rax
   1401354f5:	lea    (%rdx,%r12,1),%rsi
   1401354f9:	lea    0x10(%rsi),%r8
   1401354fd:	jmp    14012b0fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x768c>
   140135502:	mov    %r9,%rdx
   140135505:	lea    0x1048(%rbx),%rcx
   14013550c:	vzeroupper
   14013550f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135514:	mov    0x1048(%rbx),%rdx
   14013551b:	mov    0x1050(%rbx),%rax
   140135522:	lea    (%rdx,%r12,1),%rsi
   140135526:	lea    0x10(%rsi),%r8
   14013552a:	jmp    14012ae1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73ac>
   14013552f:	mov    %r9,%rdx
   140135532:	lea    0x1048(%rbx),%rcx
   140135539:	vzeroupper
   14013553c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135541:	mov    0x1048(%rbx),%rdx
   140135548:	mov    0x1050(%rbx),%rax
   14013554f:	lea    (%rdx,%r12,1),%rsi
   140135553:	lea    0x10(%rsi),%r8
   140135557:	jmp    14012be47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83d7>
   14013555c:	mov    0x1c8(%rsp),%rax
   140135564:	mov    %rax,0x1d0(%rsp)
   14013556c:	movabs $0xfff8000000000003,%rax
   140135576:	mov    %rax,0x1c8(%rsp)
   14013557e:	mov    $0x2,%r12d
   140135584:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140135589:	mov    %r9,%rdx
   14013558c:	lea    0x1048(%rbx),%rcx
   140135593:	vzeroupper
   140135596:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013559b:	mov    0x1048(%rbx),%rdx
   1401355a2:	mov    0x1050(%rbx),%rax
   1401355a9:	lea    (%rdx,%r12,1),%rsi
   1401355ad:	lea    0x10(%rsi),%r8
   1401355b1:	jmp    14012b1b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7746>
   1401355b6:	mov    0x1c8(%rsp),%rax
   1401355be:	lea    0x680(%rsp),%rcx
   1401355c6:	lea    0x2264f8(%rip),%rdx        # 14035bac5 <.rdata+0x505>
   1401355cd:	mov    %rax,0x1d0(%rsp)
   1401355d5:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   1401355da:	mov    0x680(%rsp),%rax
   1401355e2:	mov    $0x2,%r12d
   1401355e8:	mov    %rax,0x1c8(%rsp)
   1401355f0:	jmp    14012c69b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c2b>
   1401355f5:	mov    0x1c8(%rsp),%rax
   1401355fd:	mov    $0x2,%r12d
   140135603:	mov    %rax,0x1d0(%rsp)
   14013560b:	mov    $0x1fff,%eax
   140135610:	shl    $0x33,%rax
   140135614:	mov    %rax,0x1c8(%rsp)
   14013561c:	jmp    14012f397 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb927>
   140135621:	sub    $0x1,%r12b
   140135625:	je     14013658b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b1b>
   14013562b:	lea    0x8(%rsi),%r8
   14013562f:	cmp    0x38(%rsp),%r8
   140135634:	jae    140136536 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ac6>
   14013563a:	mov    0x1d0(%rsp),%rax
   140135642:	mov    %rax,(%rsi)
   140135645:	mov    0x1c8(%rsp),%rax
   14013564d:	mov    %r8,%rsi
   140135650:	mov    %rax,0x1d0(%rsp)
   140135658:	mov    $0x1fff,%eax
   14013565d:	shl    $0x33,%rax
   140135661:	mov    %rax,0x1c8(%rsp)
   140135669:	mov    $0x2,%r12d
   14013566f:	jmp    140131a52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfe2>
   140135674:	mov    0x1050(%rbx),%rax
   14013567b:	mov    %rsi,%r12
   14013567e:	sub    %rdx,%r12
   140135681:	mov    %rax,%rcx
   140135684:	sub    %rdx,%rcx
   140135687:	sar    $0x3,%rcx
   14013568b:	lea    (%rcx,%rcx,1),%r9
   14013568f:	cmp    %r9,%rcx
   140135692:	jb     140136208 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12798>
   140135698:	vzeroupper
   14013569b:	jmp    14012dea9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa439>
   1401356a0:	mov    0x1050(%rbx),%rax
   1401356a7:	mov    %rsi,%r12
   1401356aa:	sub    %rdx,%r12
   1401356ad:	mov    %rax,%rcx
   1401356b0:	sub    %rdx,%rcx
   1401356b3:	sar    $0x3,%rcx
   1401356b7:	lea    (%rcx,%rcx,1),%r9
   1401356bb:	cmp    %r9,%rcx
   1401356be:	jb     1401365b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b47>
   1401356c4:	vzeroupper
   1401356c7:	jmp    14012dbfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa18c>
   1401356cc:	mov    %r9,%rdx
   1401356cf:	lea    0x1048(%rbx),%rcx
   1401356d6:	vzeroupper
   1401356d9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401356de:	mov    0x1048(%rbx),%rdx
   1401356e5:	mov    0x1050(%rbx),%rax
   1401356ec:	lea    (%rdx,%r12,1),%rsi
   1401356f0:	lea    0x10(%rsi),%r8
   1401356f4:	jmp    14012be86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8416>
   1401356f9:	mov    0x1050(%rbx),%rax
   140135700:	mov    %rsi,%r12
   140135703:	sub    %rdx,%r12
   140135706:	mov    %rax,%rcx
   140135709:	sub    %rdx,%rcx
   14013570c:	sar    $0x3,%rcx
   140135710:	lea    (%rcx,%rcx,1),%r9
   140135714:	cmp    %r9,%rcx
   140135717:	jb     140136d3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132cc>
   14013571d:	vzeroupper
   140135720:	jmp    14012dfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa55c>
   140135725:	mov    %r9,%rdx
   140135728:	lea    0x1048(%rbx),%rcx
   14013572f:	vzeroupper
   140135732:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135737:	mov    0x1048(%rbx),%rdx
   14013573e:	mov    0x1050(%rbx),%rax
   140135745:	lea    (%rdx,%r12,1),%rsi
   140135749:	lea    0x10(%rsi),%r8
   14013574d:	jmp    14012bf23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84b3>
   140135752:	mov    %r9,%rdx
   140135755:	lea    0x1048(%rbx),%rcx
   14013575c:	vzeroupper
   14013575f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135764:	mov    0x1048(%rbx),%rdx
   14013576b:	mov    0x1050(%rbx),%rax
   140135772:	lea    (%rdx,%r12,1),%rsi
   140135776:	lea    0x10(%rsi),%r8
   14013577a:	jmp    14012ac04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7194>
   14013577f:	mov    %r9,%rdx
   140135782:	lea    0x1048(%rbx),%rcx
   140135789:	vzeroupper
   14013578c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135791:	mov    0x1048(%rbx),%rdx
   140135798:	mov    0x1050(%rbx),%rax
   14013579f:	lea    (%rdx,%r12,1),%rsi
   1401357a3:	lea    0x10(%rsi),%r8
   1401357a7:	jmp    14012bf62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84f2>
   1401357ac:	mov    %r9,%rdx
   1401357af:	lea    0x1048(%rbx),%rcx
   1401357b6:	vzeroupper
   1401357b9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401357be:	mov    0x1048(%rbx),%rdx
   1401357c5:	mov    0x1050(%rbx),%rax
   1401357cc:	lea    (%rdx,%r12,1),%rsi
   1401357d0:	lea    0x10(%rsi),%r8
   1401357d4:	jmp    14012b499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a29>
   1401357d9:	mov    0x1050(%rbx),%rax
   1401357e0:	mov    %rsi,%r12
   1401357e3:	sub    %rdx,%r12
   1401357e6:	mov    %rax,%rcx
   1401357e9:	sub    %rdx,%rcx
   1401357ec:	sar    $0x3,%rcx
   1401357f0:	lea    (%rcx,%rcx,1),%r9
   1401357f4:	cmp    %r9,%rcx
   1401357f7:	jb     140136d69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132f9>
   1401357fd:	vzeroupper
   140135800:	jmp    14012e2c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa856>
   140135805:	mov    %r9,%rdx
   140135808:	lea    0x1048(%rbx),%rcx
   14013580f:	vzeroupper
   140135812:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135817:	mov    0x1048(%rbx),%rdx
   14013581e:	mov    0x1050(%rbx),%rax
   140135825:	lea    (%rdx,%r12,1),%rsi
   140135829:	lea    0x10(%rsi),%r8
   14013582d:	jmp    14012ab86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7116>
   140135832:	mov    $0x1,%r12d
   140135838:	jmp    14012d7c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d51>
   14013583d:	mov    0x1050(%rbx),%rax
   140135844:	mov    %rsi,%r12
   140135847:	sub    %rdx,%r12
   14013584a:	mov    %rax,%rcx
   14013584d:	sub    %rdx,%rcx
   140135850:	sar    $0x3,%rcx
   140135854:	lea    (%rcx,%rcx,1),%r9
   140135858:	cmp    %r9,%rcx
   14013585b:	jb     140136741 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cd1>
   140135861:	vzeroupper
   140135864:	jmp    14012de76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa406>
   140135869:	mov    %r9,%rdx
   14013586c:	lea    0x1048(%rbx),%rcx
   140135873:	vzeroupper
   140135876:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013587b:	mov    0x1048(%rbx),%rdx
   140135882:	mov    0x1050(%rbx),%rax
   140135889:	lea    (%rdx,%r12,1),%rsi
   14013588d:	lea    0x10(%rsi),%r8
   140135891:	jmp    14012aa54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6fe4>
   140135896:	mov    %r9,0x40(%rsp)
   14013589b:	lea    0x3d8(%rsp),%rcx
   1401358a3:	mov    %rdx,0x3d8(%rsp)
   1401358ab:	vzeroupper
   1401358ae:	call   14021bef0 <setun::VMValue::payload() const>
   1401358b3:	mov    0x40(%rsp),%r9
   1401358b8:	mov    0x48(%rax),%rax
   1401358bc:	test   %rax,%rax
   1401358bf:	je     14013040d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   1401358c5:	mov    0x38(%rax),%rcx
   1401358c9:	test   %rcx,%rcx
   1401358cc:	je     14013040d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   1401358d2:	mov    (%r9),%edx
   1401358d5:	cmp    %edx,(%rcx)
   1401358d7:	jne    14013040d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   1401358dd:	test   %edx,%edx
   1401358df:	je     14013040d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc99d>
   1401358e5:	movzwl 0x4(%r9),%edx
   1401358ea:	mov    0x48(%rax),%rax
   1401358ee:	sub    $0x8,%rsi
   1401358f2:	mov    $0x1,%r12d
   1401358f8:	mov    (%rax,%rdx,8),%rax
   1401358fc:	mov    %rax,0x1c8(%rsp)
   140135904:	cmpb   $0x0,0x1040(%rbx)
   14013590b:	je     14012e653 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabe3>
   140135911:	movzbl 0x2(%rbp),%eax
   140135915:	lea    0x28a784(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013591c:	add    $0x3,%rbp
   140135920:	mov    (%rdi,%rax,8),%rax
   140135924:	jmp    *%rax
   140135926:	mov    %r8d,0x60(%rsp)
   14013592b:	add    %rdx,%rdx
   14013592e:	lea    0x1068(%rbx),%rcx
   140135935:	mov    %r9d,0x80(%rsp)
   14013593d:	mov    %eax,0x40(%rsp)
   140135941:	vzeroupper
   140135944:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135949:	mov    0x80(%rsp),%r9d
   140135951:	mov    0x40(%rsp),%eax
   140135955:	mov    0x60(%rsp),%r8d
   14013595a:	jmp    140124a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa9>
   14013595f:	mov    %r9,%rdx
   140135962:	lea    0x1048(%rbx),%rcx
   140135969:	vzeroupper
   14013596c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135971:	mov    0x1048(%rbx),%rdx
   140135978:	mov    0x1050(%rbx),%rax
   14013597f:	lea    (%rdx,%r12,1),%rsi
   140135983:	lea    0x10(%rsi),%r8
   140135987:	jmp    14012addd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x736d>
   14013598c:	mov    0x28(%rbp),%rdx
   140135990:	test   %rdx,%rdx
   140135993:	je     140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   140135999:	mov    0x40(%rsp),%rax
   14013599e:	mov    0x30(%r14),%r8
   1401359a2:	mov    0x38(%r14),%rcx
   1401359a6:	movzwl 0xa(%rax),%eax
   1401359aa:	sub    %r8,%rcx
   1401359ad:	sar    $0x5,%rcx
   1401359b1:	cmp    %rcx,%rax
   1401359b4:	jae    140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   1401359ba:	shl    $0x5,%rax
   1401359be:	lea    0x680(%rsp),%rcx
   1401359c6:	add    $0x40,%rdx
   1401359ca:	add    %rax,%r8
   1401359cd:	call   140222080 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401359d2:	mov    0x680(%rsp),%rax
   1401359da:	test   %rax,%rax
   1401359dd:	je     140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   1401359e3:	mov    (%rax),%rcx
   1401359e6:	test   %rcx,%rcx
   1401359e9:	je     140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x407f>
   1401359ef:	mov    0x88(%r14),%rax
   1401359f6:	mov    0x80(%r14),%rdx
   1401359fd:	cmp    %rdx,%rax
   140135a00:	je     1401366ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c7e>
   140135a06:	sub    %rdx,%rax
   140135a09:	movzwl 0x28(%rcx),%r8d
   140135a0e:	xor    %r9d,%r9d
   140135a11:	sar    $0x2,%rax
   140135a15:	mov    %r9d,0x80(%rsp)
   140135a1d:	cmp    %rax,%r8
   140135a20:	jae    140135a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fbd>
   140135a22:	mov    (%rdx,%r8,4),%eax
   140135a26:	mov    %eax,0x80(%rsp)
   140135a2d:	mov    0xa0(%r14),%rax
   140135a34:	mov    0x98(%r14),%rdx
   140135a3b:	cmp    %rdx,%rax
   140135a3e:	je     1401366e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c73>
   140135a44:	sub    %rdx,%rax
   140135a47:	movzwl 0x28(%rcx),%ecx
   140135a4b:	mov    $0x20,%r8d
   140135a51:	sar    $1,%rax
   140135a54:	cmp    %rax,%rcx
   140135a57:	jae    140135a5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fee>
   140135a59:	movzwl (%rdx,%rcx,2),%r8d
   140135a5e:	movzbl %dil,%eax
   140135a62:	mov    %r8,%rcx
   140135a65:	mov    0x15268(%rbx),%r13
   140135a6c:	mov    0x1070(%rbx),%rdx
   140135a73:	mov    %rax,0xa0(%rsp)
   140135a7b:	add    $0x9,%rax
   140135a7f:	cmp    %r8,%rax
   140135a82:	cmovae %rax,%rcx
   140135a86:	mov    0x38(%rbp),%rax
   140135a8a:	sub    0x1068(%rbx),%rdx
   140135a91:	sar    $0x3,%rdx
   140135a95:	vmovd  (%rax),%xmm7
   140135a99:	mov    0x40(%rsp),%rax
   140135a9e:	mov    %rcx,0xc0(%rsp)
   140135aa6:	vpinsrd $0x1,0x80(%rsp),%xmm7,%xmm0
   140135ab1:	mov    %cx,0x8(%rax)
   140135ab5:	vmovq  %xmm0,(%rax)
   140135ab9:	lea    (%rcx,%r13,1),%rax
   140135abd:	mov    %rax,0x15268(%rbx)
   140135ac4:	add    $0x40,%rax
   140135ac8:	cmp    %rdx,%rax
   140135acb:	jae    14013809c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1462c>
   140135ad1:	test   %dil,%dil
   140135ad4:	jne    14013800b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1459b>
   140135ada:	mov    0x1068(%rbx),%rax
   140135ae1:	cmp    $0x1,%r12b
   140135ae5:	je     140137ff0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14580>
   140135aeb:	cmp    $0x2,%r12b
   140135aef:	je     140137fc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14555>
   140135af5:	mov    -0x8(%rsi),%rdx
   140135af9:	sub    $0x8,%rsi
   140135afd:	mov    %rdx,(%rax,%r13,8)
   140135b01:	mov    0x1048(%rbx),%rdx
   140135b08:	mov    %rsi,%r9
   140135b0b:	mov    0x60(%rsp),%rcx
   140135b10:	mov    0x150c0(%rbx),%rax
   140135b17:	sub    %rdx,%r9
   140135b1a:	mov    0x80(%rsp),%ebp
   140135b21:	mov    %r9,%rdi
   140135b24:	sub    %r15,%rcx
   140135b27:	sar    $0x3,%rdi
   140135b2b:	cmp    $0x7ff,%rax
   140135b31:	ja     140138c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151de>
   140135b37:	lea    0x1(%rax),%r10
   140135b3b:	imul   $0x28,%rax,%rax
   140135b3f:	mov    %r10,0x150c0(%rbx)
   140135b46:	mov    %rcx,0x10c0(%rbx,%rax,1)
   140135b4e:	mov    0xc0(%rsp),%rcx
   140135b56:	mov    %r13,0x10c8(%rbx,%rax,1)
   140135b5e:	mov    %rcx,0x10d8(%rbx,%rax,1)
   140135b66:	mov    0x15270(%rbx),%rcx
   140135b6d:	mov    %rdi,0x10d0(%rbx,%rax,1)
   140135b75:	mov    %rbp,0x10e0(%rbx,%rax,1)
   140135b7d:	mov    0x152a0(%rbx),%rax
   140135b84:	cmp    %rax,0x68(%rcx)
   140135b88:	jae    140138208 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14798>
   140135b8e:	lea    (%r15,%rbp,1),%rax
   140135b92:	cmpb   $0x0,0x1040(%rbx)
   140135b99:	je     140136640 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bd0>
   140135b9f:	lea    0x1(%rax),%rbp
   140135ba3:	movzbl (%rax),%eax
   140135ba6:	lea    0x28a4f3(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135bad:	jmp    *(%rdi,%rax,8)
   140135bb0:	mov    0x1048(%rbx),%rdx
   140135bb7:	mov    0x1050(%rbx),%rax
   140135bbe:	lea    0x10(%rsi),%r8
   140135bc2:	cmp    0x38(%rsp),%r8
   140135bc7:	jae    140136dc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13353>
   140135bcd:	mov    0x1d0(%rsp),%rcx
   140135bd5:	mov    %rcx,(%rsi)
   140135bd8:	mov    0x1c8(%rsp),%rcx
   140135be0:	mov    %rcx,0x8(%rsi)
   140135be4:	mov    %r8,%rsi
   140135be7:	jmp    140130755 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcce5>
   140135bec:	mov    %r9,%rdx
   140135bef:	lea    0x1048(%rbx),%rcx
   140135bf6:	vzeroupper
   140135bf9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135bfe:	mov    0x1048(%rbx),%rdx
   140135c05:	mov    0x1050(%rbx),%rax
   140135c0c:	lea    (%rdx,%r12,1),%rsi
   140135c10:	lea    0x10(%rsi),%r8
   140135c14:	jmp    14012b03f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75cf>
   140135c19:	mov    0x8(%rdi),%rax
   140135c1d:	mov    0x340(%rsp),%rdx
   140135c25:	mov    %rdx,(%rax,%r9,8)
   140135c29:	cmpb   $0x0,0x1040(%rbx)
   140135c30:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   140135c36:	movzbl 0x0(%rbp),%eax
   140135c3a:	lea    0x28a45f(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135c41:	add    $0x1,%rbp
   140135c45:	mov    (%rdi,%rax,8),%rax
   140135c49:	jmp    *%rax
   140135c4b:	mov    0x340(%rsp),%rax
   140135c53:	and    %rax,%rdx
   140135c56:	cmp    0x40(%rsp),%rdx
   140135c5b:	jne    14012f20f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb79f>
   140135c61:	mov    0x20(%rdi),%rdx
   140135c65:	shl    $0x10,%rax
   140135c69:	sar    $0x10,%rax
   140135c6d:	mov    %rax,(%rdx,%r9,8)
   140135c71:	cmpb   $0x0,0x1040(%rbx)
   140135c78:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   140135c7e:	movzbl 0x0(%rbp),%eax
   140135c82:	lea    0x28a417(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135c89:	add    $0x1,%rbp
   140135c8d:	mov    (%rdi,%rax,8),%rax
   140135c91:	jmp    *%rax
   140135c93:	cmp    $0x4,%al
   140135c95:	jne    140135c19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x121a9>
   140135c97:	mov    $0xffffffff,%eax
   140135c9c:	mov    $0xfffd0001,%edx
   140135ca1:	shl    $0x20,%rax
   140135ca5:	shl    $0x20,%rdx
   140135ca9:	and    0x340(%rsp),%rax
   140135cb1:	cmp    %rdx,%rax
   140135cb4:	jne    14012f20f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb79f>
   140135cba:	lea    0x340(%rsp),%rdx
   140135cc2:	lea    0x480(%rsp),%rcx
   140135cca:	mov    %r9,0x40(%rsp)
   140135ccf:	call   14021c2f0 <setun::VMValue::as_tafpu() const>
   140135cd4:	mov    0x490(%rsp),%rdx
   140135cdc:	vmovdqa 0x480(%rsp),%xmm7
   140135ce5:	imul   $0x18,0x40(%rsp),%rax
   140135ceb:	add    0x68(%rdi),%rax
   140135cef:	mov    %rdx,0x10(%rax)
   140135cf3:	vmovdqu %xmm7,(%rax)
   140135cf7:	cmpb   $0x0,0x1040(%rbx)
   140135cfe:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   140135d04:	movzbl 0x0(%rbp),%eax
   140135d08:	lea    0x28a391(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135d0f:	add    $0x1,%rbp
   140135d13:	mov    (%rdi,%rax,8),%rax
   140135d17:	jmp    *%rax
   140135d19:	mov    0x340(%rsp),%rax
   140135d21:	movabs $0xfff7ffffffffffff,%rdx
   140135d2b:	cmp    %rax,%rdx
   140135d2e:	jae    140135d42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122d2>
   140135d30:	mov    $0x3fff,%edx
   140135d35:	shl    $0x32,%rdx
   140135d39:	cmp    %rdx,%rax
   140135d3c:	jne    14012f20f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb79f>
   140135d42:	lea    0x340(%rsp),%rcx
   140135d4a:	mov    %r9,0x40(%rsp)
   140135d4f:	call   14021c1d0 <setun::VMValue::as_float() const>
   140135d54:	mov    0x50(%rdi),%rax
   140135d58:	mov    0x40(%rsp),%r9
   140135d5d:	vmovsd %xmm0,(%rax,%r9,8)
   140135d63:	cmpb   $0x0,0x1040(%rbx)
   140135d6a:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   140135d70:	movzbl 0x0(%rbp),%eax
   140135d74:	lea    0x28a325(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135d7b:	add    $0x1,%rbp
   140135d7f:	mov    (%rdi,%rax,8),%rax
   140135d83:	jmp    *%rax
   140135d85:	mov    %r9,%rdx
   140135d88:	lea    0x1048(%rbx),%rcx
   140135d8f:	vzeroupper
   140135d92:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d97:	mov    0x1048(%rbx),%rdx
   140135d9e:	mov    0x1050(%rbx),%rax
   140135da5:	lea    (%rdx,%r12,1),%rsi
   140135da9:	lea    0x10(%rsi),%r8
   140135dad:	jmp    14012b9dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f6c>
   140135db2:	mov    %r9,%rdx
   140135db5:	lea    0x1048(%rbx),%rcx
   140135dbc:	vzeroupper
   140135dbf:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135dc4:	mov    0x1048(%rbx),%rdx
   140135dcb:	mov    0x1050(%rbx),%rax
   140135dd2:	lea    (%rdx,%r12,1),%rsi
   140135dd6:	lea    0x10(%rsi),%r8
   140135dda:	jmp    14012b1f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7785>
   140135ddf:	mov    %r9,%rdx
   140135de2:	lea    0x1048(%rbx),%rcx
   140135de9:	vzeroupper
   140135dec:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135df1:	mov    0x1048(%rbx),%rdx
   140135df8:	mov    0x1050(%rbx),%rax
   140135dff:	lea    (%rdx,%r12,1),%rsi
   140135e03:	lea    0x10(%rsi),%r8
   140135e07:	jmp    14012af18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74a8>
   140135e0c:	mov    0x1050(%rbx),%rax
   140135e13:	mov    %rsi,%r12
   140135e16:	sub    %rdx,%r12
   140135e19:	mov    %rax,%rcx
   140135e1c:	sub    %rdx,%rcx
   140135e1f:	sar    $0x3,%rcx
   140135e23:	lea    (%rcx,%rcx,1),%r9
   140135e27:	cmp    %r9,%rcx
   140135e2a:	jb     140138a12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fa2>
   140135e30:	vzeroupper
   140135e33:	jmp    14012e260 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7f0>
   140135e38:	mov    0x1050(%rbx),%rax
   140135e3f:	mov    %rsi,%r12
   140135e42:	sub    %rdx,%r12
   140135e45:	mov    %rax,%rcx
   140135e48:	sub    %rdx,%rcx
   140135e4b:	sar    $0x3,%rcx
   140135e4f:	lea    (%rcx,%rcx,1),%r9
   140135e53:	cmp    %r9,%rcx
   140135e56:	jb     140136107 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12697>
   140135e5c:	vzeroupper
   140135e5f:	jmp    14012e35f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ef>
   140135e64:	mov    %r9,%rdx
   140135e67:	lea    0x1048(%rbx),%rcx
   140135e6e:	vzeroupper
   140135e71:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135e76:	mov    0x1048(%rbx),%rdx
   140135e7d:	mov    0x1050(%rbx),%rax
   140135e84:	lea    (%rdx,%r12,1),%rsi
   140135e88:	lea    0x10(%rsi),%r8
   140135e8c:	jmp    14012bb42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x80d2>
   140135e91:	mov    0x1050(%rbx),%rax
   140135e98:	mov    %rsi,%r12
   140135e9b:	sub    %rdx,%r12
   140135e9e:	mov    %rax,%rcx
   140135ea1:	sub    %rdx,%rcx
   140135ea4:	sar    $0x3,%rcx
   140135ea8:	lea    (%rcx,%rcx,1),%r9
   140135eac:	cmp    %r9,%rcx
   140135eaf:	jb     140138a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fcf>
   140135eb5:	vzeroupper
   140135eb8:	jmp    14012dd85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa315>
   140135ebd:	mov    0x1050(%rbx),%rax
   140135ec4:	mov    %rsi,%r12
   140135ec7:	sub    %rdx,%r12
   140135eca:	mov    %rax,%rcx
   140135ecd:	sub    %rdx,%rcx
   140135ed0:	sar    $0x3,%rcx
   140135ed4:	lea    (%rcx,%rcx,1),%r9
   140135ed8:	cmp    %r9,%rcx
   140135edb:	jb     140138682 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c12>
   140135ee1:	vzeroupper
   140135ee4:	jmp    14012e0c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa658>
   140135ee9:	test   %r12b,%r12b
   140135eec:	je     1401360b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12645>
   140135ef2:	sub    $0x1,%r12b
   140135ef6:	je     140136080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12610>
   140135efc:	lea    0x8(%rsi),%r8
   140135f00:	cmp    0x38(%rsp),%r8
   140135f05:	jae    140138a6c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ffc>
   140135f0b:	mov    0x1d0(%rsp),%rax
   140135f13:	mov    %r8,0x40(%rsp)
   140135f18:	movslq %edi,%rdx
   140135f1b:	mov    %rax,(%rsi)
   140135f1e:	mov    0x1c8(%rsp),%rax
   140135f26:	mov    %rax,0x1d0(%rsp)
   140135f2e:	jmp    140130f9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd52f>
   140135f33:	test   %r12b,%r12b
   140135f36:	je     140138b28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150b8>
   140135f3c:	sub    $0x1,%r12b
   140135f40:	je     140138aeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1507b>
   140135f46:	lea    0x8(%rsi),%r8
   140135f4a:	cmp    0x38(%rsp),%r8
   140135f4f:	jae    140137eec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1447c>
   140135f55:	mov    0x40(%rsp),%rdx
   140135f5a:	mov    %r8,0x60(%rsp)
   140135f5f:	lea    0x540(%rsp),%rcx
   140135f67:	mov    $0x2,%r12d
   140135f6d:	mov    0x1d0(%rsp),%rax
   140135f75:	mov    %rax,(%rsi)
   140135f78:	mov    0x1c8(%rsp),%rax
   140135f80:	mov    %rax,0x1d0(%rsp)
   140135f88:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140135f8d:	mov    0x540(%rsp),%rax
   140135f95:	mov    0x60(%rsp),%rsi
   140135f9a:	mov    %rax,0x1c8(%rsp)
   140135fa2:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140135fa7:	mov    0x1050(%rbx),%rax
   140135fae:	mov    %rax,0x38(%rsp)
   140135fb3:	sub    %rdx,%rax
   140135fb6:	sar    $0x3,%rax
   140135fba:	lea    (%rax,%rax,1),%rcx
   140135fbe:	cmp    %rcx,%rax
   140135fc1:	jae    14012da90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa020>
   140135fc7:	sub    %rdx,%rsi
   140135fca:	mov    %rcx,%rdx
   140135fcd:	lea    0x1048(%rbx),%rcx
   140135fd4:	vzeroupper
   140135fd7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135fdc:	mov    0x1048(%rbx),%rdx
   140135fe3:	mov    0x1050(%rbx),%rax
   140135fea:	add    %rdx,%rsi
   140135fed:	mov    %rax,0x38(%rsp)
   140135ff2:	lea    0x10(%rsi),%r8
   140135ff6:	jmp    14012da90 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa020>
   140135ffb:	mov    0x1050(%rbx),%rax
   140136002:	mov    %rsi,%r12
   140136005:	sub    %rdx,%r12
   140136008:	mov    %rax,%rcx
   14013600b:	sub    %rdx,%rcx
   14013600e:	sar    $0x3,%rcx
   140136012:	lea    (%rcx,%rcx,1),%r9
   140136016:	cmp    %r9,%rcx
   140136019:	jb     140138abe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1504e>
   14013601f:	vzeroupper
   140136022:	jmp    14012df33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4c3>
   140136027:	mov    0x1050(%rbx),%rax
   14013602e:	mov    %rsi,%r12
   140136031:	sub    %rdx,%r12
   140136034:	mov    %rax,%rcx
   140136037:	sub    %rdx,%rcx
   14013603a:	sar    $0x3,%rcx
   14013603e:	lea    (%rcx,%rcx,1),%r9
   140136042:	cmp    %r9,%rcx
   140136045:	jb     140136134 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126c4>
   14013604b:	vzeroupper
   14013604e:	jmp    14012e194 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa724>
   140136053:	mov    %r9,%rdx
   140136056:	lea    0x1048(%rbx),%rcx
   14013605d:	vzeroupper
   140136060:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136065:	mov    0x1048(%rbx),%rdx
   14013606c:	mov    0x1050(%rbx),%rax
   140136073:	lea    (%rdx,%r12,1),%rsi
   140136077:	lea    0x8(%rsi),%r8
   14013607b:	jmp    14012df66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4f6>
   140136080:	mov    0x1c8(%rsp),%rax
   140136088:	movslq %edi,%rdx
   14013608b:	lea    0x540(%rsp),%rcx
   140136093:	mov    %rax,0x1d0(%rsp)
   14013609b:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401360a0:	mov    0x540(%rsp),%rax
   1401360a8:	mov    %rax,0x1c8(%rsp)
   1401360b0:	jmp    14012d963 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ef3>
   1401360b5:	movslq %edi,%rdx
   1401360b8:	lea    0x540(%rsp),%rcx
   1401360c0:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401360c5:	mov    0x540(%rsp),%rax
   1401360cd:	mov    %rax,0x1c8(%rsp)
   1401360d5:	jmp    1401346cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c5c>
   1401360da:	mov    %r9,%rdx
   1401360dd:	lea    0x1048(%rbx),%rcx
   1401360e4:	vzeroupper
   1401360e7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401360ec:	mov    0x1048(%rbx),%rdx
   1401360f3:	mov    0x1050(%rbx),%rax
   1401360fa:	lea    (%rdx,%r12,1),%rsi
   1401360fe:	lea    0x8(%rsi),%r8
   140136102:	jmp    14012dc95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa225>
   140136107:	mov    %r9,%rdx
   14013610a:	lea    0x1048(%rbx),%rcx
   140136111:	vzeroupper
   140136114:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136119:	mov    0x1048(%rbx),%rdx
   140136120:	mov    0x1050(%rbx),%rax
   140136127:	lea    (%rdx,%r12,1),%rsi
   14013612b:	lea    0x8(%rsi),%r8
   14013612f:	jmp    14012e35f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ef>
   140136134:	mov    %r9,%rdx
   140136137:	lea    0x1048(%rbx),%rcx
   14013613e:	vzeroupper
   140136141:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136146:	mov    0x1048(%rbx),%rdx
   14013614d:	mov    0x1050(%rbx),%rax
   140136154:	lea    (%rdx,%r12,1),%rsi
   140136158:	lea    0x8(%rsi),%r8
   14013615c:	jmp    14012e194 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa724>
   140136161:	mov    0x1050(%rbx),%rax
   140136168:	mov    0x1048(%rbx),%rcx
   14013616f:	mov    %rax,0x38(%rsp)
   140136174:	sub    %rcx,%rax
   140136177:	sar    $0x3,%rax
   14013617b:	lea    (%rax,%rax,1),%rdx
   14013617f:	cmp    %rdx,%rax
   140136182:	jae    14012d848 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dd8>
   140136188:	sub    %rcx,%rsi
   14013618b:	lea    0x1048(%rbx),%rcx
   140136192:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136197:	mov    0x1050(%rbx),%rax
   14013619e:	add    0x1048(%rbx),%rsi
   1401361a5:	lea    0x8(%rsi),%r8
   1401361a9:	mov    %rax,0x38(%rsp)
   1401361ae:	jmp    14012d848 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dd8>
   1401361b3:	mov    0x1050(%rbx),%rax
   1401361ba:	mov    0x1048(%rbx),%rdx
   1401361c1:	mov    %rax,0x38(%rsp)
   1401361c6:	sub    %rdx,%rax
   1401361c9:	sar    $0x3,%rax
   1401361cd:	lea    (%rax,%rax,1),%rcx
   1401361d1:	cmp    %rcx,%rax
   1401361d4:	jae    14012f361 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8f1>
   1401361da:	sub    %rdx,%rsi
   1401361dd:	mov    %rcx,%rdx
   1401361e0:	lea    0x1048(%rbx),%rcx
   1401361e7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401361ec:	mov    0x1050(%rbx),%rax
   1401361f3:	add    0x1048(%rbx),%rsi
   1401361fa:	lea    0x8(%rsi),%r8
   1401361fe:	mov    %rax,0x38(%rsp)
   140136203:	jmp    14012f361 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8f1>
   140136208:	mov    %r9,%rdx
   14013620b:	lea    0x1048(%rbx),%rcx
   140136212:	vzeroupper
   140136215:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013621a:	mov    0x1048(%rbx),%rdx
   140136221:	mov    0x1050(%rbx),%rax
   140136228:	lea    (%rdx,%r12,1),%rsi
   14013622c:	lea    0x8(%rsi),%r8
   140136230:	jmp    14012dea9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa439>
   140136235:	xor    %r12d,%r12d
   140136238:	jmp    14012cac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9051>
   14013623d:	mov    0x1048(%rbx),%rdx
   140136244:	mov    0x1050(%rbx),%rcx
   14013624b:	mov    %rsi,%r12
   14013624e:	mov    %rcx,0x38(%rsp)
   140136253:	sub    %rdx,%rcx
   140136256:	sub    %rdx,%r12
   140136259:	mov    %rcx,%rdx
   14013625c:	sar    $0x3,%rdx
   140136260:	lea    (%rdx,%rdx,1),%rcx
   140136264:	cmp    %rcx,%rdx
   140136267:	jae    140132e49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3d9>
   14013626d:	mov    %r10,0x80(%rsp)
   140136275:	mov    %rcx,%rdx
   140136278:	lea    0x1048(%rbx),%rcx
   14013627f:	mov    %eax,0x60(%rsp)
   140136283:	mov    %r9d,0x40(%rsp)
   140136288:	vzeroupper
   14013628b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136290:	mov    0x1048(%rbx),%rsi
   140136297:	mov    0x1050(%rbx),%rax
   14013629e:	mov    0x80(%rsp),%r10
   1401362a6:	mov    0x40(%rsp),%r9d
   1401362ab:	add    %r12,%rsi
   1401362ae:	mov    %rax,0x38(%rsp)
   1401362b3:	mov    0x60(%rsp),%eax
   1401362b7:	lea    0x8(%rsi),%r8
   1401362bb:	jmp    140132e49 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3d9>
   1401362c0:	mov    %rax,%rcx
   1401362c3:	sub    %rdx,%rcx
   1401362c6:	sar    $0x3,%rcx
   1401362ca:	lea    (%rcx,%rcx,1),%r10
   1401362ce:	cmp    %r10,%rcx
   1401362d1:	jae    14013527e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1180e>
   1401362d7:	sub    %rdx,%rsi
   1401362da:	lea    0x1048(%rbx),%rcx
   1401362e1:	mov    %r10,%rdx
   1401362e4:	vzeroupper
   1401362e7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401362ec:	mov    0x1048(%rbx),%rdx
   1401362f3:	mov    0x1050(%rbx),%rax
   1401362fa:	add    %rdx,%rsi
   1401362fd:	lea    0x10(%rsi),%r8
   140136301:	jmp    140135281 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11811>
   140136306:	sub    $0x1,%r12b
   14013630a:	je     14013643a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129ca>
   140136310:	lea    0x8(%rsi),%r8
   140136314:	cmp    0x38(%rsp),%r8
   140136319:	jae    1401363db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1296b>
   14013631f:	mov    0x1d0(%rsp),%rax
   140136327:	mov    $0x2,%r12d
   14013632d:	mov    %rax,(%rsi)
   140136330:	mov    0x1c8(%rsp),%rax
   140136338:	mov    %r8,%rsi
   14013633b:	mov    %rax,0x1d0(%rsp)
   140136343:	mov    0x8(%r10),%rax
   140136347:	mov    (%rax,%rdi,8),%rax
   14013634b:	mov    %rax,0x1c8(%rsp)
   140136353:	jmp    140135032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115c2>
   140136358:	mov    0x1048(%rbx),%rdx
   14013635f:	mov    0x1050(%rbx),%rcx
   140136366:	mov    %rsi,%r12
   140136369:	mov    %rcx,0x38(%rsp)
   14013636e:	sub    %rdx,%rcx
   140136371:	sub    %rdx,%r12
   140136374:	mov    %rcx,%rdx
   140136377:	sar    $0x3,%rdx
   14013637b:	lea    (%rdx,%rdx,1),%rcx
   14013637f:	cmp    %rcx,%rdx
   140136382:	jae    14013019b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc72b>
   140136388:	mov    %r10,0x80(%rsp)
   140136390:	mov    %rcx,%rdx
   140136393:	lea    0x1048(%rbx),%rcx
   14013639a:	mov    %eax,0x60(%rsp)
   14013639e:	mov    %r9d,0x40(%rsp)
   1401363a3:	vzeroupper
   1401363a6:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401363ab:	mov    0x1048(%rbx),%rsi
   1401363b2:	mov    0x1050(%rbx),%rax
   1401363b9:	mov    0x80(%rsp),%r10
   1401363c1:	mov    0x40(%rsp),%r9d
   1401363c6:	add    %r12,%rsi
   1401363c9:	mov    %rax,0x38(%rsp)
   1401363ce:	mov    0x60(%rsp),%eax
   1401363d2:	lea    0x10(%rsi),%r8
   1401363d6:	jmp    14013019b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc72b>
   1401363db:	mov    0x1050(%rbx),%rax
   1401363e2:	mov    0x1048(%rbx),%rdx
   1401363e9:	mov    %rax,0x38(%rsp)
   1401363ee:	sub    %rdx,%rax
   1401363f1:	sar    $0x3,%rax
   1401363f5:	lea    (%rax,%rax,1),%rcx
   1401363f9:	cmp    %rcx,%rax
   1401363fc:	jae    14013631f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128af>
   140136402:	sub    %rdx,%rsi
   140136405:	mov    %rcx,%rdx
   140136408:	lea    0x1048(%rbx),%rcx
   14013640f:	mov    %r10,0x40(%rsp)
   140136414:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136419:	mov    0x1050(%rbx),%rax
   140136420:	mov    0x40(%rsp),%r10
   140136425:	add    0x1048(%rbx),%rsi
   14013642c:	mov    %rax,0x38(%rsp)
   140136431:	lea    0x8(%rsi),%r8
   140136435:	jmp    14013631f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128af>
   14013643a:	mov    0x1c8(%rsp),%rax
   140136442:	mov    $0x2,%r12d
   140136448:	mov    %rax,0x1d0(%rsp)
   140136450:	mov    0x8(%r10),%rax
   140136454:	mov    (%rax,%rdi,8),%rax
   140136458:	mov    %rax,0x1c8(%rsp)
   140136460:	jmp    140135032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115c2>
   140136465:	mov    %r9,%rdx
   140136468:	lea    0x1048(%rbx),%rcx
   14013646f:	vzeroupper
   140136472:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136477:	mov    0x1048(%rbx),%rdx
   14013647e:	mov    0x1050(%rbx),%rax
   140136485:	lea    (%rdx,%r12,1),%rsi
   140136489:	lea    0x8(%rsi),%r8
   14013648d:	jmp    14012dd52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2e2>
   140136492:	mov    %r9,%rdx
   140136495:	lea    0x1048(%rbx),%rcx
   14013649c:	vzeroupper
   14013649f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401364a4:	mov    0x1048(%rbx),%rdx
   1401364ab:	mov    0x1050(%rbx),%rax
   1401364b2:	lea    (%rdx,%r12,1),%rsi
   1401364b6:	lea    0x8(%rsi),%r8
   1401364ba:	jmp    14012e392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa922>
   1401364bf:	mov    $0x6ab,%r8d
   1401364c5:	lea    0x2256c4(%rip),%rdx        # 14035bb90 <.rdata+0x5d0>
   1401364cc:	lea    0x22612d(%rip),%rcx        # 14035c600 <.rdata+0x1040>
   1401364d3:	vzeroupper
   1401364d6:	call   *0x28d6c4(%rip)        # 1403c3ba0 <__imp__assert>
   1401364dc:	mov    %r9,%rdx
   1401364df:	lea    0x1048(%rbx),%rcx
   1401364e6:	vzeroupper
   1401364e9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401364ee:	mov    0x1048(%rbx),%rdx
   1401364f5:	mov    0x1050(%rbx),%rax
   1401364fc:	lea    (%rdx,%r12,1),%rsi
   140136500:	lea    0x8(%rsi),%r8
   140136504:	jmp    14012dcc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa258>
   140136509:	mov    %r9,%rdx
   14013650c:	lea    0x1048(%rbx),%rcx
   140136513:	vzeroupper
   140136516:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013651b:	mov    0x1048(%rbx),%rdx
   140136522:	mov    0x1050(%rbx),%rax
   140136529:	lea    (%rdx,%r12,1),%rsi
   14013652d:	lea    0x8(%rsi),%r8
   140136531:	jmp    14012de43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3d3>
   140136536:	mov    0x1050(%rbx),%rax
   14013653d:	mov    0x1048(%rbx),%rdx
   140136544:	mov    %rax,0x38(%rsp)
   140136549:	sub    %rdx,%rax
   14013654c:	sar    $0x3,%rax
   140136550:	lea    (%rax,%rax,1),%rcx
   140136554:	cmp    %rcx,%rax
   140136557:	jae    14013563a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bca>
   14013655d:	sub    %rdx,%rsi
   140136560:	mov    %rcx,%rdx
   140136563:	lea    0x1048(%rbx),%rcx
   14013656a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013656f:	mov    0x1050(%rbx),%rax
   140136576:	add    0x1048(%rbx),%rsi
   14013657d:	lea    0x8(%rsi),%r8
   140136581:	mov    %rax,0x38(%rsp)
   140136586:	jmp    14013563a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bca>
   14013658b:	mov    0x1c8(%rsp),%rax
   140136593:	mov    $0x2,%r12d
   140136599:	mov    %rax,0x1d0(%rsp)
   1401365a1:	mov    $0x1fff,%eax
   1401365a6:	shl    $0x33,%rax
   1401365aa:	mov    %rax,0x1c8(%rsp)
   1401365b2:	jmp    140131a52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfe2>
   1401365b7:	mov    %r9,%rdx
   1401365ba:	lea    0x1048(%rbx),%rcx
   1401365c1:	vzeroupper
   1401365c4:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401365c9:	mov    0x1048(%rbx),%rdx
   1401365d0:	mov    0x1050(%rbx),%rax
   1401365d7:	lea    (%rdx,%r12,1),%rsi
   1401365db:	lea    0x8(%rsi),%r8
   1401365df:	jmp    14012dbfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa18c>
   1401365e4:	add    %rdx,%rdx
   1401365e7:	lea    0x1068(%rbx),%rcx
   1401365ee:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401365f3:	jmp    14012f434 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9c4>
   1401365f8:	mov    0x1c8(%rsp),%rdx
   140136600:	mov    %rdx,(%rax,%r13,8)
   140136604:	mov    0x1048(%rbx),%rdx
   14013660b:	xor    %r12d,%r12d
   14013660e:	jmp    14012f46b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9fb>
   140136613:	mov    %r9,%rdx
   140136616:	lea    0x1048(%rbx),%rcx
   14013661d:	vzeroupper
   140136620:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136625:	mov    0x1048(%rbx),%rdx
   14013662c:	mov    0x1050(%rbx),%rax
   140136633:	lea    (%rdx,%r12,1),%rsi
   140136637:	lea    0x8(%rsi),%r8
   14013663b:	jmp    14012dc62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1f2>
   140136640:	mov    %rax,%rbp
   140136643:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140136648:	mov    0x1050(%rbx),%rax
   14013664f:	sub    %rdx,%rax
   140136652:	cmp    %r8,%rax
   140136655:	jb     1401366c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c56>
   140136657:	mov    %rbp,0x1060(%rbx)
   14013665e:	mov    0x152a0(%rbx),%rax
   140136665:	cmp    %rax,0x68(%rcx)
   140136669:	jae    1401366b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c45>
   14013666b:	mov    0x1060(%rbx),%rax
   140136672:	mov    0x1048(%rbx),%rdx
   140136679:	lea    (%rdx,%rax,8),%rsi
   14013667d:	mov    0x40(%rsp),%rax
   140136682:	mov    0x4(%rax),%eax
   140136685:	jmp    14012f4f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba80>
   14013668a:	mov    0x1c8(%rsp),%rdx
   140136692:	xor    %r12d,%r12d
   140136695:	add    $0x8,%rsi
   140136699:	mov    %rdx,(%rax,%r13,8)
   14013669d:	mov    0x1d0(%rsp),%rax
   1401366a5:	mov    0x1048(%rbx),%rdx
   1401366ac:	mov    %rax,-0x8(%rsi)
   1401366b0:	jmp    14012f46b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9fb>
   1401366b5:	lea    0x15270(%rbx),%rcx
   1401366bc:	mov    %rbx,%rdx
   1401366bf:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401366c4:	jmp    14013666b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bfb>
   1401366c6:	lea    0x1048(%rbx),%rcx
   1401366cd:	lea    0x0(%rbp,%rbp,1),%rdx
   1401366d2:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401366d7:	mov    0x15270(%rbx),%rcx
   1401366de:	jmp    140136657 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12be7>
   1401366e3:	mov    $0x20,%r8d
   1401366e9:	jmp    140135a5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fee>
   1401366ee:	movzwl 0x28(%rcx),%eax
   1401366f2:	mov    %eax,0x80(%rsp)
   1401366f9:	jmp    140135a2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fbd>
   1401366fe:	mov    $0xfffb,%eax
   140136703:	mov    $0xffff,%edx
   140136708:	mov    $0xfffd,%ecx
   14013670d:	sub    $0x8,%rsi
   140136711:	shl    $0x30,%rax
   140136715:	shl    $0x30,%rdx
   140136719:	mov    %rax,0x3e0(%rsp)
   140136721:	mov    (%rsi),%rax
   140136724:	shl    $0x30,%rcx
   140136728:	and    %rax,%rdx
   14013672b:	mov    %rax,0x3e0(%rsp)
   140136733:	cmp    %rcx,%rdx
   140136736:	jne    14012e682 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac12>
   14013673c:	jmp    14012d7c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d51>
   140136741:	mov    %r9,%rdx
   140136744:	lea    0x1048(%rbx),%rcx
   14013674b:	vzeroupper
   14013674e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136753:	mov    0x1048(%rbx),%rdx
   14013675a:	mov    0x1050(%rbx),%rax
   140136761:	lea    (%rdx,%r12,1),%rsi
   140136765:	lea    0x8(%rsi),%r8
   140136769:	jmp    14012de76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa406>
   14013676e:	mov    %r9,%rdx
   140136771:	lea    0x1048(%rbx),%rcx
   140136778:	vzeroupper
   14013677b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136780:	mov    0x1048(%rbx),%rdx
   140136787:	mov    0x1050(%rbx),%rax
   14013678e:	lea    (%rdx,%r12,1),%rsi
   140136792:	lea    0x8(%rsi),%r8
   140136796:	jmp    14012df99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa529>
   14013679b:	mov    %r9,%rdx
   14013679e:	lea    0x1048(%rbx),%rcx
   1401367a5:	vzeroupper
   1401367a8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401367ad:	mov    0x1048(%rbx),%rdx
   1401367b4:	mov    0x1050(%rbx),%rax
   1401367bb:	lea    (%rdx,%r12,1),%rsi
   1401367bf:	lea    0x8(%rsi),%r8
   1401367c3:	jmp    14012e293 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa823>
   1401367c8:	mov    0x1050(%rbx),%rax
   1401367cf:	mov    0x1048(%rbx),%rdx
   1401367d6:	mov    %rax,0x38(%rsp)
   1401367db:	sub    %rdx,%rax
   1401367de:	sar    $0x3,%rax
   1401367e2:	lea    (%rax,%rax,1),%rcx
   1401367e6:	cmp    %rcx,%rax
   1401367e9:	jae    1401327d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed69>
   1401367ef:	sub    %rdx,%rsi
   1401367f2:	mov    %rcx,%rdx
   1401367f5:	lea    0x1048(%rbx),%rcx
   1401367fc:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136801:	mov    0x1050(%rbx),%rax
   140136808:	add    0x1048(%rbx),%rsi
   14013680f:	lea    0x8(%rsi),%r8
   140136813:	mov    %rax,0x38(%rsp)
   140136818:	jmp    1401327d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed69>
   14013681d:	mov    0x1050(%rbx),%rax
   140136824:	mov    0x1048(%rbx),%rcx
   14013682b:	mov    %rax,0x38(%rsp)
   140136830:	sub    %rcx,%rax
   140136833:	sar    $0x3,%rax
   140136837:	lea    (%rax,%rax,1),%rdx
   14013683b:	cmp    %rdx,%rax
   14013683e:	jae    140131481 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda11>
   140136844:	sub    %rcx,%rsi
   140136847:	lea    0x1048(%rbx),%rcx
   14013684e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136853:	mov    0x1050(%rbx),%rax
   14013685a:	add    0x1048(%rbx),%rsi
   140136861:	lea    0x8(%rsi),%r8
   140136865:	mov    %rax,0x38(%rsp)
   14013686a:	jmp    140131481 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda11>
   14013686f:	mov    0x1050(%rbx),%rax
   140136876:	mov    0x1048(%rbx),%rcx
   14013687d:	mov    %rax,0x38(%rsp)
   140136882:	sub    %rcx,%rax
   140136885:	sar    $0x3,%rax
   140136889:	lea    (%rax,%rax,1),%rdx
   14013688d:	cmp    %rdx,%rax
   140136890:	jae    14012c751 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ce1>
   140136896:	sub    %rcx,%rsi
   140136899:	lea    0x1048(%rbx),%rcx
   1401368a0:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401368a5:	mov    0x1050(%rbx),%rax
   1401368ac:	add    0x1048(%rbx),%rsi
   1401368b3:	mov    %rax,0x38(%rsp)
   1401368b8:	jmp    14012c751 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ce1>
   1401368bd:	mov    0x1c8(%rsp),%rax
   1401368c5:	lea    0x680(%rsp),%r10
   1401368cd:	mov    $0x1,%edx
   1401368d2:	lea    0x690(%rsp),%r12
   1401368da:	mov    %r10,%rcx
   1401368dd:	mov    %r10,0x40(%rsp)
   1401368e2:	mov    %rax,0x1d0(%rsp)
   1401368ea:	mov    0x540(%rsp),%rax
   1401368f2:	movsbl (%rax,%rdi,1),%r8d
   1401368f7:	mov    %r12,0x680(%rsp)
   1401368ff:	call   1402ed1f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140136904:	mov    0x40(%rsp),%rdx
   140136909:	lea    0x520(%rsp),%rcx
   140136911:	call   14020e7a0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140136916:	mov    0x520(%rsp),%rax
   14013691e:	mov    0x680(%rsp),%rcx
   140136926:	mov    %rax,0x1c8(%rsp)
   14013692e:	cmp    %r12,%rcx
   140136931:	je     140131045 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d5>
   140136937:	mov    0x690(%rsp),%rax
   14013693f:	lea    0x1(%rax),%rdx
   140136943:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140136948:	jmp    140131045 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d5>
   14013694d:	mov    0x1050(%rbx),%rax
   140136954:	mov    0x1048(%rbx),%rcx
   14013695b:	mov    %rax,0x38(%rsp)
   140136960:	sub    %rcx,%rax
   140136963:	sar    $0x3,%rax
   140136967:	lea    (%rax,%rax,1),%rdx
   14013696b:	cmp    %rdx,%rax
   14013696e:	jae    14012d9df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6f>
   140136974:	sub    %rcx,%rsi
   140136977:	lea    0x1048(%rbx),%rcx
   14013697e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136983:	mov    0x1050(%rbx),%rax
   14013698a:	add    0x1048(%rbx),%rsi
   140136991:	lea    0x8(%rsi),%r8
   140136995:	mov    %rax,0x38(%rsp)
   14013699a:	jmp    14012d9df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6f>
   14013699f:	mov    0x1048(%rbx),%rdx
   1401369a6:	lea    0x10(%rsi),%r8
   1401369aa:	cmp    0x38(%rsp),%r8
   1401369af:	jae    140136ed2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13462>
   1401369b5:	mov    0x1050(%rbx),%rax
   1401369bc:	vzeroupper
   1401369bf:	mov    0x1d0(%rsp),%rcx
   1401369c7:	mov    %rcx,(%rsi)
   1401369ca:	mov    0x1c8(%rsp),%rcx
   1401369d2:	mov    %rcx,0x8(%rsi)
   1401369d6:	mov    %r8,%rsi
   1401369d9:	jmp    14012cd39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92c9>
   1401369de:	mov    %r9,%rdx
   1401369e1:	lea    0x1048(%rbx),%rcx
   1401369e8:	vzeroupper
   1401369eb:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401369f0:	mov    0x1048(%rbx),%rdx
   1401369f7:	mov    0x1050(%rbx),%rax
   1401369fe:	lea    (%rdx,%r12,1),%rsi
   140136a02:	lea    0x8(%rsi),%r8
   140136a06:	jmp    14012e062 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5f2>
   140136a0b:	mov    0x1050(%rbx),%rax
   140136a12:	mov    0x1048(%rbx),%rdx
   140136a19:	mov    %rax,0x38(%rsp)
   140136a1e:	sub    %rdx,%rax
   140136a21:	sar    $0x3,%rax
   140136a25:	lea    (%rax,%rax,1),%rcx
   140136a29:	cmp    %rcx,%rax
   140136a2c:	jae    140132d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf317>
   140136a32:	sub    %rdx,%rsi
   140136a35:	mov    %rcx,%rdx
   140136a38:	lea    0x1048(%rbx),%rcx
   140136a3f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136a44:	mov    0x1050(%rbx),%rax
   140136a4b:	add    0x1048(%rbx),%rsi
   140136a52:	lea    0x8(%rsi),%r8
   140136a56:	mov    %rax,0x38(%rsp)
   140136a5b:	jmp    140132d87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf317>
   140136a60:	mov    %r9,%rdx
   140136a63:	lea    0x1048(%rbx),%rcx
   140136a6a:	vzeroupper
   140136a6d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136a72:	mov    0x1048(%rbx),%rdx
   140136a79:	mov    0x1050(%rbx),%rax
   140136a80:	lea    (%rdx,%r12,1),%rsi
   140136a84:	lea    0x8(%rsi),%r8
   140136a88:	jmp    14012dc2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1bf>
   140136a8d:	mov    %r9,%rdx
   140136a90:	lea    0x1048(%rbx),%rcx
   140136a97:	vzeroupper
   140136a9a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136a9f:	mov    0x1048(%rbx),%rdx
   140136aa6:	mov    0x1050(%rbx),%rax
   140136aad:	lea    (%rdx,%r12,1),%rsi
   140136ab1:	lea    0x8(%rsi),%r8
   140136ab5:	jmp    14012ddb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa348>
   140136aba:	mov    %rax,%rcx
   140136abd:	sub    %rdx,%rcx
   140136ac0:	sar    $0x3,%rcx
   140136ac4:	lea    (%rcx,%rcx,1),%r10
   140136ac8:	cmp    %r10,%rcx
   140136acb:	jae    1401324a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea32>
   140136ad1:	sub    %rdx,%rsi
   140136ad4:	lea    0x1048(%rbx),%rcx
   140136adb:	mov    %r10,%rdx
   140136ade:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136ae3:	mov    0x1048(%rbx),%rdx
   140136aea:	mov    0x1050(%rbx),%rax
   140136af1:	add    %rdx,%rsi
   140136af4:	lea    0x10(%rsi),%r8
   140136af8:	jmp    1401324a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea32>
   140136afd:	mov    0x1050(%rbx),%rax
   140136b04:	mov    0x1048(%rbx),%rdx
   140136b0b:	mov    %rax,0x38(%rsp)
   140136b10:	sub    %rdx,%rax
   140136b13:	sar    $0x3,%rax
   140136b17:	lea    (%rax,%rax,1),%rcx
   140136b1b:	cmp    %rcx,%rax
   140136b1e:	jae    14012ec5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1eb>
   140136b24:	sub    %rdx,%rsi
   140136b27:	mov    %rcx,%rdx
   140136b2a:	lea    0x1048(%rbx),%rcx
   140136b31:	mov    %r10,0x40(%rsp)
   140136b36:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136b3b:	mov    0x1050(%rbx),%rax
   140136b42:	mov    0x40(%rsp),%r10
   140136b47:	add    0x1048(%rbx),%rsi
   140136b4e:	mov    %rax,0x38(%rsp)
   140136b53:	lea    0x8(%rsi),%r8
   140136b57:	jmp    14012ec5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1eb>
   140136b5c:	mov    0x1c8(%rsp),%rax
   140136b64:	lea    0x680(%rsp),%rcx
   140136b6c:	mov    $0x2,%r12d
   140136b72:	mov    %rax,0x1d0(%rsp)
   140136b7a:	mov    0x38(%r10),%rax
   140136b7e:	movzbl (%rax,%rdi,1),%edx
   140136b82:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140136b87:	mov    0x680(%rsp),%rax
   140136b8f:	mov    %rax,0x1c8(%rsp)
   140136b97:	jmp    14012ecab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb23b>
   140136b9c:	mov    0x38(%r10),%rax
   140136ba0:	lea    0x680(%rsp),%rcx
   140136ba8:	mov    $0x1,%r12d
   140136bae:	movzbl (%rax,%rdi,1),%edx
   140136bb2:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140136bb7:	mov    0x680(%rsp),%rax
   140136bbf:	mov    %rax,0x1c8(%rsp)
   140136bc7:	jmp    14012ecab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb23b>
   140136bcc:	mov    0x1050(%rbx),%rax
   140136bd3:	mov    0x1048(%rbx),%rdx
   140136bda:	mov    %rax,0x38(%rsp)
   140136bdf:	sub    %rdx,%rax
   140136be2:	sar    $0x3,%rax
   140136be6:	lea    (%rax,%rax,1),%rcx
   140136bea:	cmp    %rcx,%rax
   140136bed:	jae    140135076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11606>
   140136bf3:	sub    %rdx,%rsi
   140136bf6:	mov    %rcx,%rdx
   140136bf9:	lea    0x1048(%rbx),%rcx
   140136c00:	mov    %r10,0x40(%rsp)
   140136c05:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c0a:	mov    0x1050(%rbx),%rax
   140136c11:	mov    0x40(%rsp),%r10
   140136c16:	add    0x1048(%rbx),%rsi
   140136c1d:	mov    %rax,0x38(%rsp)
   140136c22:	lea    0x8(%rsi),%r8
   140136c26:	jmp    140135076 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11606>
   140136c2b:	mov    0x1050(%rbx),%rax
   140136c32:	mov    0x1048(%rbx),%rdx
   140136c39:	mov    %rax,0x38(%rsp)
   140136c3e:	sub    %rdx,%rax
   140136c41:	sar    $0x3,%rax
   140136c45:	lea    (%rax,%rax,1),%rcx
   140136c49:	cmp    %rcx,%rax
   140136c4c:	jae    140135112 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116a2>
   140136c52:	sub    %rdx,%rsi
   140136c55:	mov    %rcx,%rdx
   140136c58:	lea    0x1048(%rbx),%rcx
   140136c5f:	mov    %r10,0x40(%rsp)
   140136c64:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c69:	mov    0x1050(%rbx),%rax
   140136c70:	mov    0x40(%rsp),%r10
   140136c75:	add    0x1048(%rbx),%rsi
   140136c7c:	mov    %rax,0x38(%rsp)
   140136c81:	lea    0x8(%rsi),%r8
   140136c85:	jmp    140135112 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116a2>
   140136c8a:	mov    0x1c8(%rsp),%rax
   140136c92:	lea    0x1a0(%rsp),%rdx
   140136c9a:	lea    0x680(%rsp),%rcx
   140136ca2:	mov    $0x2,%r12d
   140136ca8:	mov    %rax,0x1d0(%rsp)
   140136cb0:	imul   $0x18,%rdi,%rax
   140136cb4:	add    0x68(%r10),%rax
   140136cb8:	vmovdqu (%rax),%xmm7
   140136cbc:	vmovdqa %xmm7,0x1a0(%rsp)
   140136cc5:	mov    0x10(%rax),%rax
   140136cc9:	mov    %rax,0x1b0(%rsp)
   140136cd1:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140136cd6:	mov    0x680(%rsp),%rax
   140136cde:	mov    %rax,0x1c8(%rsp)
   140136ce6:	jmp    140135183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11713>
   140136ceb:	imul   $0x18,%rdi,%rax
   140136cef:	add    0x68(%r10),%rax
   140136cf3:	lea    0x1a0(%rsp),%rdx
   140136cfb:	mov    $0x1,%r12d
   140136d01:	vmovdqu (%rax),%xmm7
   140136d05:	lea    0x680(%rsp),%rcx
   140136d0d:	vmovdqa %xmm7,0x1a0(%rsp)
   140136d16:	mov    0x10(%rax),%rax
   140136d1a:	mov    %rax,0x1b0(%rsp)
   140136d22:	call   14020e2c0 <setun::VMValue::VMValue(setun::TafpuNum)>
   140136d27:	mov    0x680(%rsp),%rax
   140136d2f:	mov    %rax,0x1c8(%rsp)
   140136d37:	jmp    140135183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11713>
   140136d3c:	mov    %r9,%rdx
   140136d3f:	lea    0x1048(%rbx),%rcx
   140136d46:	vzeroupper
   140136d49:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136d4e:	mov    0x1048(%rbx),%rdx
   140136d55:	mov    0x1050(%rbx),%rax
   140136d5c:	lea    (%rdx,%r12,1),%rsi
   140136d60:	lea    0x8(%rsi),%r8
   140136d64:	jmp    14012dfcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa55c>
   140136d69:	mov    %r9,%rdx
   140136d6c:	lea    0x1048(%rbx),%rcx
   140136d73:	vzeroupper
   140136d76:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136d7b:	mov    0x1048(%rbx),%rdx
   140136d82:	mov    0x1050(%rbx),%rax
   140136d89:	lea    (%rdx,%r12,1),%rsi
   140136d8d:	lea    0x8(%rsi),%r8
   140136d91:	jmp    14012e2c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa856>
   140136d96:	mov    %r9,%rdx
   140136d99:	lea    0x1048(%rbx),%rcx
   140136da0:	vzeroupper
   140136da3:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136da8:	mov    0x1048(%rbx),%rdx
   140136daf:	mov    0x1050(%rbx),%rax
   140136db6:	lea    (%rdx,%r12,1),%rsi
   140136dba:	lea    0x8(%rsi),%r8
   140136dbe:	jmp    14012e32c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8bc>
   140136dc3:	mov    %rax,%rcx
   140136dc6:	mov    %rax,0x38(%rsp)
   140136dcb:	sub    %rdx,%rcx
   140136dce:	sar    $0x3,%rcx
   140136dd2:	lea    (%rcx,%rcx,1),%r9
   140136dd6:	cmp    %r9,%rcx
   140136dd9:	jae    140135bcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1215d>
   140136ddf:	sub    %rdx,%rsi
   140136de2:	lea    0x1048(%rbx),%rcx
   140136de9:	mov    %r9,%rdx
   140136dec:	vzeroupper
   140136def:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136df4:	mov    0x1048(%rbx),%rdx
   140136dfb:	mov    0x1050(%rbx),%rax
   140136e02:	add    %rdx,%rsi
   140136e05:	mov    %rax,0x38(%rsp)
   140136e0a:	lea    0x10(%rsi),%r8
   140136e0e:	jmp    140135bcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1215d>
   140136e13:	vzeroupper
   140136e16:	jmp    140134e9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1142c>
   140136e1b:	mov    %r9,%rdx
   140136e1e:	lea    0x1048(%rbx),%rcx
   140136e25:	vzeroupper
   140136e28:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e2d:	mov    0x1048(%rbx),%rdx
   140136e34:	mov    0x1050(%rbx),%rax
   140136e3b:	lea    (%rdx,%r12,1),%rsi
   140136e3f:	lea    0x8(%rsi),%r8
   140136e43:	jmp    14012e1fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa78a>
   140136e48:	mov    0x1050(%rbx),%rax
   140136e4f:	mov    0x1048(%rbx),%rcx
   140136e56:	mov    %rax,0x38(%rsp)
   140136e5b:	sub    %rcx,%rax
   140136e5e:	sar    $0x3,%rax
   140136e62:	lea    (%rax,%rax,1),%rdx
   140136e66:	cmp    %rdx,%rax
   140136e69:	jae    140130ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd58c>
   140136e6f:	sub    %rcx,%rsi
   140136e72:	lea    0x1048(%rbx),%rcx
   140136e79:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e7e:	mov    0x1050(%rbx),%rax
   140136e85:	add    0x1048(%rbx),%rsi
   140136e8c:	lea    0x8(%rsi),%r8
   140136e90:	mov    %rax,0x38(%rsp)
   140136e95:	jmp    140130ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd58c>
   140136e9a:	mov    0xc0(%rsp),%rcx
   140136ea2:	call   140147380 <setun::ArrayObject::size() const>
   140136ea7:	add    %rax,0x40(%rsp)
   140136eac:	test   %rdi,%rdi
   140136eaf:	jns    140136ec1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13451>
   140136eb1:	mov    0xe0(%rsp),%rcx
   140136eb9:	call   140147380 <setun::ArrayObject::size() const>
   140136ebe:	add    %rax,%rdi
   140136ec1:	cmpq   $0x0,0x40(%rsp)
   140136ec7:	js     140127d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4290>
   140136ecd:	jmp    140134f12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114a2>
   140136ed2:	mov    0x1050(%rbx),%rax
   140136ed9:	mov    %rsi,%rbp
   140136edc:	sub    %rdx,%rbp
   140136edf:	mov    %rax,%rcx
   140136ee2:	sub    %rdx,%rcx
   140136ee5:	sar    $0x3,%rcx
   140136ee9:	lea    (%rcx,%rcx,1),%r9
   140136eed:	cmp    %r9,%rcx
   140136ef0:	jb     140138273 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14803>
   140136ef6:	vzeroupper
   140136ef9:	jmp    1401369bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f4f>
   140136efe:	test   %rcx,%rcx
   140136f01:	je     140136f08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13498>
   140136f03:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140136f08:	mov    0x150c0(%rbx),%rax
   140136f0f:	test   %rax,%rax
   140136f12:	je     140136fb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13548>
   140136f18:	imul   $0x28,%rax,%rdx
   140136f1c:	sub    $0x1,%rax
   140136f20:	add    %rbx,%rdx
   140136f23:	mov    0x1098(%rdx),%rbp
   140136f2a:	mov    0x10a0(%rdx),%rcx
   140136f31:	mov    0x10a8(%rdx),%rsi
   140136f38:	mov    %rax,0x150c0(%rbx)
   140136f3f:	cmpb   $0x0,0x15211(%rbx)
   140136f46:	je     140136fa7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13537>
   140136f48:	mov    %rcx,0x15268(%rbx)
   140136f4f:	mov    0x1048(%rbx),%rdx
   140136f56:	mov    0x40(%rsp),%rdi
   140136f5b:	mov    0x150c0(%rbx),%r13
   140136f62:	lea    (%rdx,%rsi,8),%rax
   140136f66:	mov    %rdi,(%rax)
   140136f69:	lea    0x8(%rax),%rsi
   140136f6d:	test   %r13,%r13
   140136f70:	je     140136f82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13512>
   140136f72:	lea    -0x1(%r13),%rax
   140136f76:	imul   $0x28,%rax,%rax
   140136f7a:	mov    0x10c8(%rbx,%rax,1),%r13
   140136f82:	add    %r15,%rbp
   140136f85:	cmpb   $0x0,0x1040(%rbx)
   140136f8c:	je     140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140136f92:	movzbl 0x0(%rbp),%eax
   140136f96:	lea    0x289103(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140136f9d:	add    $0x1,%rbp
   140136fa1:	mov    (%rdi,%rax,8),%rax
   140136fa5:	jmp    *%rax
   140136fa7:	mov    %rcx,%rdx
   140136faa:	lea    0x1068(%rbx),%rcx
   140136fb1:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136fb6:	jmp    140136f4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134df>
   140136fb8:	mov    0x40(%rsp),%rax
   140136fbd:	mov    0x1048(%rbx),%rdx
   140136fc4:	add    $0x8,%rsi
   140136fc8:	mov    %rax,-0x8(%rsi)
   140136fcc:	movb   $0x0,0x1040(%rbx)
   140136fd3:	jmp    140124662 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140136fd8:	mov    0x1050(%rbx),%rax
   140136fdf:	mov    0x1048(%rbx),%rdx
   140136fe6:	mov    %rax,0x38(%rsp)
   140136feb:	sub    %rdx,%rax
   140136fee:	sar    $0x3,%rax
   140136ff2:	lea    (%rax,%rax,1),%rcx
   140136ff6:	cmp    %rcx,%rax
   140136ff9:	jae    140134a25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fb5>
   140136fff:	sub    %rdx,%rsi
   140137002:	mov    %rcx,%rdx
   140137005:	lea    0x1048(%rbx),%rcx
   14013700c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137011:	mov    0x1050(%rbx),%rax
   140137018:	add    0x1048(%rbx),%rsi
   14013701f:	lea    0x8(%rsi),%r8
   140137023:	mov    %rax,0x38(%rsp)
   140137028:	jmp    140134a25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fb5>
   14013702d:	mov    0x1050(%rbx),%rax
   140137034:	mov    %rax,0x38(%rsp)
   140137039:	sub    %rdx,%rax
   14013703c:	sar    $0x3,%rax
   140137040:	lea    (%rax,%rax,1),%rcx
   140137044:	cmp    %rcx,%rax
   140137047:	jae    140130d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd31d>
   14013704d:	sub    %rdx,%rsi
   140137050:	mov    %rcx,%rdx
   140137053:	lea    0x1048(%rbx),%rcx
   14013705a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013705f:	mov    0x1048(%rbx),%rdx
   140137066:	mov    0x1050(%rbx),%rax
   14013706d:	add    %rdx,%rsi
   140137070:	mov    %rax,0x38(%rsp)
   140137075:	lea    0x10(%rsi),%r8
   140137079:	jmp    140130d8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd31d>
   14013707e:	sub    $0x1,%r12b
   140137082:	je     140131ec5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe455>
   140137088:	mov    0x1048(%rbx),%rdx
   14013708f:	mov    0x1068(%rbx),%r8
   140137096:	jmp    1401264cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5d>
   14013709b:	mov    0x1050(%rbx),%rax
   1401370a2:	mov    %rsi,%rbp
   1401370a5:	sub    %rdx,%rbp
   1401370a8:	mov    %rax,0x38(%rsp)
   1401370ad:	sub    %rdx,%rax
   1401370b0:	sar    $0x3,%rax
   1401370b4:	lea    (%rax,%rax,1),%rcx
   1401370b8:	cmp    %rcx,%rax
   1401370bb:	jae    1401348e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e75>
   1401370c1:	mov    %rcx,%rdx
   1401370c4:	lea    0x1048(%rbx),%rcx
   1401370cb:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401370d0:	mov    0x1048(%rbx),%rdx
   1401370d7:	mov    0x1050(%rbx),%rax
   1401370de:	lea    (%rdx,%rbp,1),%rsi
   1401370e2:	mov    %rax,0x38(%rsp)
   1401370e7:	lea    0x8(%rsi),%r8
   1401370eb:	jmp    1401348e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e75>
   1401370f0:	mov    0x1048(%rbx),%rdx
   1401370f7:	jmp    1401348f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e86>
   1401370fc:	mov    0x1048(%rbx),%rdx
   140137103:	lea    0x10(%rsi),%r8
   140137107:	cmp    0x38(%rsp),%r8
   14013710c:	jae    140137167 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136f7>
   14013710e:	mov    0x1d0(%rsp),%rax
   140137116:	xor    %r12d,%r12d
   140137119:	mov    %rax,(%rsi)
   14013711c:	mov    0x1c8(%rsp),%rax
   140137124:	mov    %rax,0x8(%rsi)
   140137128:	mov    %r8,%rsi
   14013712b:	jmp    1401348f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e86>
   140137130:	mov    0x1068(%rbx),%rax
   140137137:	cmp    $0x2,%r12b
   14013713b:	je     1401371d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13765>
   140137141:	cmp    $0x1,%r12b
   140137145:	je     1401371b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13748>
   140137147:	mov    -0x8(%rsi),%rdx
   14013714b:	sub    $0x10,%rsi
   14013714f:	mov    %rdx,0x8(%rax,%r13,8)
   140137154:	mov    (%rsi),%rdx
   140137157:	mov    %rdx,(%rax,%r13,8)
   14013715b:	mov    0x1048(%rbx),%rdx
   140137162:	jmp    14012f46b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9fb>
   140137167:	mov    0x1050(%rbx),%rax
   14013716e:	mov    %rsi,%rbp
   140137171:	sub    %rdx,%rbp
   140137174:	mov    %rax,0x38(%rsp)
   140137179:	sub    %rdx,%rax
   14013717c:	sar    $0x3,%rax
   140137180:	lea    (%rax,%rax,1),%rcx
   140137184:	cmp    %rcx,%rax
   140137187:	jae    14013710e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1369e>
   140137189:	mov    %rcx,%rdx
   14013718c:	lea    0x1048(%rbx),%rcx
   140137193:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137198:	mov    0x1048(%rbx),%rdx
   14013719f:	mov    0x1050(%rbx),%rax
   1401371a6:	lea    (%rdx,%rbp,1),%rsi
   1401371aa:	mov    %rax,0x38(%rsp)
   1401371af:	lea    0x10(%rsi),%r8
   1401371b3:	jmp    14013710e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1369e>
   1401371b8:	mov    0x1c8(%rsp),%rdx
   1401371c0:	sub    $0x8,%rsi
   1401371c4:	mov    %rdx,0x8(%rax,%r13,8)
   1401371c9:	mov    (%rsi),%rdx
   1401371cc:	mov    %rdx,(%rax,%r13,8)
   1401371d0:	jmp    140136604 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b94>
   1401371d5:	mov    0x1d0(%rsp),%rdx
   1401371dd:	mov    %rdx,(%rax,%r13,8)
   1401371e1:	mov    0x1c8(%rsp),%rdx
   1401371e9:	mov    %rdx,0x8(%rax,%r13,8)
   1401371ee:	jmp    140136604 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b94>
   1401371f3:	mov    %r9,%rdx
   1401371f6:	lea    0x1048(%rbx),%rcx
   1401371fd:	vzeroupper
   140137200:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137205:	mov    0x1048(%rbx),%rdx
   14013720c:	mov    0x1050(%rbx),%rax
   140137213:	lea    (%rdx,%r12,1),%rsi
   140137217:	lea    0x8(%rsi),%r8
   14013721b:	jmp    14012e12e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6be>
   140137220:	sub    $0x1,%r12b
   140137224:	je     14013731f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138af>
   14013722a:	lea    0x8(%rsi),%r8
   14013722e:	cmp    0x38(%rsp),%r8
   140137233:	jae    1401372bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1384c>
   140137239:	mov    0x1d0(%rsp),%rdx
   140137241:	mov    $0x2,%r12d
   140137247:	mov    %rdx,(%rsi)
   14013724a:	mov    0x1c8(%rsp),%rdx
   140137252:	mov    %r8,%rsi
   140137255:	mov    (%rcx,%rax,8),%rax
   140137259:	mov    %rdx,0x1d0(%rsp)
   140137261:	mov    %rax,0x1c8(%rsp)
   140137269:	jmp    140130656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbe6>
   14013726e:	mov    0x1050(%rbx),%rax
   140137275:	mov    0x1048(%rbx),%rcx
   14013727c:	mov    %rax,0x38(%rsp)
   140137281:	sub    %rcx,%rax
   140137284:	sar    $0x3,%rax
   140137288:	lea    (%rax,%rax,1),%rdx
   14013728c:	cmp    %rdx,%rax
   14013728f:	jae    14012c5ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b8f>
   140137295:	sub    %rcx,%rsi
   140137298:	lea    0x1048(%rbx),%rcx
   14013729f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401372a4:	mov    0x1050(%rbx),%rax
   1401372ab:	add    0x1048(%rbx),%rsi
   1401372b2:	mov    %rax,0x38(%rsp)
   1401372b7:	jmp    14012c5ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b8f>
   1401372bc:	mov    0x1050(%rbx),%r11
   1401372c3:	mov    0x1048(%rbx),%rdx
   1401372ca:	mov    %r11,0x38(%rsp)
   1401372cf:	sub    %rdx,%r11
   1401372d2:	sar    $0x3,%r11
   1401372d6:	lea    (%r11,%r11,1),%r9
   1401372da:	cmp    %r9,%r11
   1401372dd:	jae    140137239 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137c9>
   1401372e3:	sub    %rdx,%rsi
   1401372e6:	lea    0x1048(%rbx),%rcx
   1401372ed:	mov    %r9,%rdx
   1401372f0:	mov    %rax,0x40(%rsp)
   1401372f5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401372fa:	mov    0x1050(%rbx),%rax
   140137301:	add    0x1048(%rbx),%rsi
   140137308:	mov    0x48(%rdi),%rcx
   14013730c:	lea    0x8(%rsi),%r8
   140137310:	mov    %rax,0x38(%rsp)
   140137315:	mov    0x40(%rsp),%rax
   14013731a:	jmp    140137239 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137c9>
   14013731f:	mov    0x1c8(%rsp),%rdx
   140137327:	mov    (%rcx,%rax,8),%rax
   14013732b:	mov    $0x2,%r12d
   140137331:	mov    %rdx,0x1d0(%rsp)
   140137339:	mov    %rax,0x1c8(%rsp)
   140137341:	jmp    140130656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbe6>
   140137346:	mov    %r9,%rdx
   140137349:	lea    0x1048(%rbx),%rcx
   140137350:	vzeroupper
   140137353:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137358:	mov    0x1048(%rbx),%rdx
   14013735f:	mov    0x1050(%rbx),%rax
   140137366:	lea    (%rdx,%r12,1),%rsi
   14013736a:	lea    0x8(%rsi),%r8
   14013736e:	jmp    14012dbc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa159>
   140137373:	xor    %eax,%eax
   140137375:	jmp    1401340f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10689>
   14013737a:	lea    0x0(%rbp,%rbp,1),%rdx
   14013737f:	lea    0x1048(%rbx),%rcx
   140137386:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013738b:	jmp    14012cd5e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92ee>
   140137390:	mov    0x1048(%rbx),%rdx
   140137397:	lea    0x8(%rsi),%r8
   14013739b:	cmp    0x38(%rsp),%r8
   1401373a0:	jae    140137472 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a02>
   1401373a6:	mov    0x1050(%rbx),%rax
   1401373ad:	vzeroupper
   1401373b0:	mov    0x1c8(%rsp),%rcx
   1401373b8:	mov    %rcx,(%rsi)
   1401373bb:	mov    %r8,%rsi
   1401373be:	jmp    14012cd39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x92c9>
   1401373c3:	mov    0x1050(%rbx),%rax
   1401373ca:	mov    0x1048(%rbx),%rdx
   1401373d1:	mov    %rax,0x38(%rsp)
   1401373d6:	sub    %rdx,%rax
   1401373d9:	sar    $0x3,%rax
   1401373dd:	lea    (%rax,%rax,1),%rcx
   1401373e1:	cmp    %rcx,%rax
   1401373e4:	jae    140133463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9f3>
   1401373ea:	sub    %rdx,%rsi
   1401373ed:	mov    %rcx,%rdx
   1401373f0:	lea    0x1048(%rbx),%rcx
   1401373f7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401373fc:	mov    0x1050(%rbx),%rax
   140137403:	add    0x1048(%rbx),%rsi
   14013740a:	lea    0x8(%rsi),%r8
   14013740e:	mov    %rax,0x38(%rsp)
   140137413:	jmp    140133463 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9f3>
   140137418:	mov    %r9,%rdx
   14013741b:	lea    0x1048(%rbx),%rcx
   140137422:	vzeroupper
   140137425:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013742a:	mov    0x1048(%rbx),%rdx
   140137431:	mov    0x1050(%rbx),%rax
   140137438:	lea    (%rdx,%r12,1),%rsi
   14013743c:	lea    0x8(%rsi),%r8
   140137440:	jmp    14012e2f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa889>
   140137445:	mov    %r9,%rdx
   140137448:	lea    0x1048(%rbx),%rcx
   14013744f:	vzeroupper
   140137452:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137457:	mov    0x1048(%rbx),%rdx
   14013745e:	mov    0x1050(%rbx),%rax
   140137465:	lea    (%rdx,%r12,1),%rsi
   140137469:	lea    0x8(%rsi),%r8
   14013746d:	jmp    14012e0fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa68b>
   140137472:	mov    0x1050(%rbx),%rax
   140137479:	mov    %rsi,%rbp
   14013747c:	sub    %rdx,%rbp
   14013747f:	mov    %rax,%rcx
   140137482:	sub    %rdx,%rcx
   140137485:	sar    $0x3,%rcx
   140137489:	lea    (%rcx,%rcx,1),%r9
   14013748d:	cmp    %r9,%rcx
   140137490:	jb     140138964 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ef4>
   140137496:	vzeroupper
   140137499:	jmp    1401373b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13940>
   14013749e:	mov    %r9,%rdx
   1401374a1:	lea    0x1048(%rbx),%rcx
   1401374a8:	vzeroupper
   1401374ab:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401374b0:	mov    0x1048(%rbx),%rdx
   1401374b7:	mov    0x1050(%rbx),%rax
   1401374be:	lea    (%rdx,%r12,1),%rsi
   1401374c2:	lea    0x8(%rsi),%r8
   1401374c6:	jmp    14012db30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0c0>
   1401374cb:	lea    (%r8,%r8,1),%rdx
   1401374cf:	lea    0x1048(%rbx),%rcx
   1401374d6:	mov    %r8,0x40(%rsp)
   1401374db:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401374e0:	mov    0x40(%rsp),%r8
   1401374e5:	jmp    140133ea8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10438>
   1401374ea:	mov    %r9,%rdx
   1401374ed:	lea    0x1048(%rbx),%rcx
   1401374f4:	vzeroupper
   1401374f7:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401374fc:	mov    0x1048(%rbx),%rdx
   140137503:	mov    0x1050(%rbx),%rax
   14013750a:	lea    (%rdx,%r12,1),%rsi
   14013750e:	lea    0x8(%rsi),%r8
   140137512:	jmp    14012db63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0f3>
   140137517:	mov    0x1048(%rbx),%rdx
   14013751e:	lea    0x8(%rsi),%r8
   140137522:	cmp    0x38(%rsp),%r8
   140137527:	jae    140137587 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b17>
   140137529:	mov    0x1050(%rbx),%rax
   140137530:	vzeroupper
   140137533:	mov    0x1c8(%rsp),%rcx
   14013753b:	xor    %r12d,%r12d
   14013753e:	mov    %rcx,(%rsi)
   140137541:	mov    %r8,%rsi
   140137544:	jmp    140133e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10422>
   140137549:	mov    0x1048(%rbx),%rdx
   140137550:	lea    0x10(%rsi),%r8
   140137554:	cmp    0x38(%rsp),%r8
   140137559:	jae    1401375b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b41>
   14013755b:	mov    0x1050(%rbx),%rax
   140137562:	vzeroupper
   140137565:	mov    0x1d0(%rsp),%rcx
   14013756d:	xor    %r12d,%r12d
   140137570:	mov    %rcx,(%rsi)
   140137573:	mov    0x1c8(%rsp),%rcx
   14013757b:	mov    %rcx,0x8(%rsi)
   14013757f:	mov    %r8,%rsi
   140137582:	jmp    140133e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10422>
   140137587:	mov    0x1050(%rbx),%rax
   14013758e:	mov    %rsi,%r12
   140137591:	sub    %rdx,%r12
   140137594:	mov    %rax,%rcx
   140137597:	mov    %rax,0x38(%rsp)
   14013759c:	sub    %rdx,%rcx
   14013759f:	sar    $0x3,%rcx
   1401375a3:	lea    (%rcx,%rcx,1),%r9
   1401375a7:	cmp    %r9,%rcx
   1401375aa:	jb     1401375db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b6b>
   1401375ac:	vzeroupper
   1401375af:	jmp    140137533 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ac3>
   1401375b1:	mov    0x1050(%rbx),%rax
   1401375b8:	mov    %rsi,%r12
   1401375bb:	sub    %rdx,%r12
   1401375be:	mov    %rax,%rcx
   1401375c1:	mov    %rax,0x38(%rsp)
   1401375c6:	sub    %rdx,%rcx
   1401375c9:	sar    $0x3,%rcx
   1401375cd:	lea    (%rcx,%rcx,1),%r9
   1401375d1:	cmp    %r9,%rcx
   1401375d4:	jb     14013760d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b9d>
   1401375d6:	vzeroupper
   1401375d9:	jmp    140137565 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13af5>
   1401375db:	mov    %r9,%rdx
   1401375de:	lea    0x1048(%rbx),%rcx
   1401375e5:	vzeroupper
   1401375e8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401375ed:	mov    0x1048(%rbx),%rdx
   1401375f4:	mov    0x1050(%rbx),%rax
   1401375fb:	lea    (%rdx,%r12,1),%rsi
   1401375ff:	mov    %rax,0x38(%rsp)
   140137604:	lea    0x8(%rsi),%r8
   140137608:	jmp    140137533 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ac3>
   14013760d:	mov    %r9,%rdx
   140137610:	lea    0x1048(%rbx),%rcx
   140137617:	vzeroupper
   14013761a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013761f:	mov    0x1048(%rbx),%rdx
   140137626:	mov    0x1050(%rbx),%rax
   14013762d:	lea    (%rdx,%r12,1),%rsi
   140137631:	mov    %rax,0x38(%rsp)
   140137636:	lea    0x10(%rsi),%r8
   14013763a:	jmp    140137565 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13af5>
   14013763f:	mov    %r9,%rdx
   140137642:	lea    0x1048(%rbx),%rcx
   140137649:	vzeroupper
   14013764c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137651:	mov    0x1048(%rbx),%rdx
   140137658:	mov    0x1050(%rbx),%rax
   14013765f:	lea    (%rdx,%r12,1),%rsi
   140137663:	lea    0x8(%rsi),%r8
   140137667:	jmp    14012e02f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5bf>
   14013766c:	mov    0x1048(%rbx),%rdx
   140137673:	mov    0x1050(%rbx),%rax
   14013767a:	mov    %rsi,%r8
   14013767d:	vzeroupper
   140137680:	jmp    140129c83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6213>
   140137685:	mov    0x1050(%rbx),%rax
   14013768c:	mov    0x1048(%rbx),%rdx
   140137693:	mov    %rax,0x38(%rsp)
   140137698:	sub    %rdx,%rax
   14013769b:	sar    $0x3,%rax
   14013769f:	lea    (%rax,%rax,1),%rcx
   1401376a3:	cmp    %rcx,%rax
   1401376a6:	jae    140133dc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10351>
   1401376ac:	sub    %rdx,%rsi
   1401376af:	mov    %rcx,%rdx
   1401376b2:	lea    0x1048(%rbx),%rcx
   1401376b9:	mov    %r9,0x40(%rsp)
   1401376be:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376c3:	mov    0x1050(%rbx),%rax
   1401376ca:	mov    0x40(%rsp),%r9
   1401376cf:	add    0x1048(%rbx),%rsi
   1401376d6:	mov    %rax,0x38(%rsp)
   1401376db:	lea    0x8(%rsi),%r8
   1401376df:	jmp    140133dc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10351>
   1401376e4:	mov    0x1c8(%rsp),%rax
   1401376ec:	mov    %r9,%rdx
   1401376ef:	mov    %rdi,%rcx
   1401376f2:	mov    %rax,0x1d0(%rsp)
   1401376fa:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   1401376ff:	mov    %rax,0x1c8(%rsp)
   140137707:	jmp    140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   14013770c:	mov    %r9,%rdx
   14013770f:	mov    %rdi,%rcx
   140137712:	mov    $0x1,%r12d
   140137718:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   14013771d:	mov    %rax,0x1c8(%rsp)
   140137725:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   14013772a:	mov    %rdi,%rcx
   14013772d:	mov    %rax,0x40(%rsp)
   140137732:	call   140147380 <setun::ArrayObject::size() const>
   140137737:	mov    0x40(%rsp),%r9
   14013773c:	add    %rax,%r9
   14013773f:	jns    140133d84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10314>
   140137745:	jmp    14012ef50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e0>
   14013774a:	mov    0x1048(%rbx),%rdx
   140137751:	mov    0x1050(%rbx),%rax
   140137758:	lea    0x8(%rsi),%r8
   14013775c:	cmp    0x38(%rsp),%r8
   140137761:	jae    140137803 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d93>
   140137767:	mov    0x1c8(%rsp),%rcx
   14013776f:	mov    %rcx,(%rsi)
   140137772:	mov    %r8,%rsi
   140137775:	jmp    140130755 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcce5>
   14013777a:	call   140212e20 <tersun::VMTelemetryManager::instance()>
   14013777f:	cmpb   $0x0,(%rax)
   140137782:	je     14013778c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d1c>
   140137784:	addq   $0x1,0x90(%rax)
   14013778c:	mov    0x150c0(%rbx),%rdx
   140137793:	mov    0x152c8(%rbx),%rcx
   14013779a:	movzbl 0x5b0(%rsp),%r9d
   1401377a3:	test   %rdx,%rdx
   1401377a6:	je     1401377b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d48>
   1401377a8:	lea    -0x1(%rdx),%rax
   1401377ac:	imul   $0x28,%rax,%rax
   1401377b0:	mov    0x10e0(%rbx,%rax,1),%rdx
   1401377b8:	mov    0x40(%rsp),%r8d
   1401377bd:	call   140171d10 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   1401377c2:	mov    0x5a8(%rsp),%rcx
   1401377ca:	mov    0x1060(%rbx),%rax
   1401377d1:	mov    0x1048(%rbx),%rdx
   1401377d8:	add    %r15,%rcx
   1401377db:	lea    (%rdx,%rax,8),%rsi
   1401377df:	cmpb   $0x0,0x1040(%rbx)
   1401377e6:	je     14012a4d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   1401377ec:	movzbl (%rcx),%eax
   1401377ef:	lea    0x2888aa(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401377f6:	lea    0x1(%rcx),%rbp
   1401377fa:	xor    %r12d,%r12d
   1401377fd:	mov    (%rdi,%rax,8),%rax
   140137801:	jmp    *%rax
   140137803:	mov    %rax,%rcx
   140137806:	mov    %rax,0x38(%rsp)
   14013780b:	sub    %rdx,%rcx
   14013780e:	sar    $0x3,%rcx
   140137812:	lea    (%rcx,%rcx,1),%r9
   140137816:	cmp    %r9,%rcx
   140137819:	jae    140137767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cf7>
   14013781f:	sub    %rdx,%rsi
   140137822:	lea    0x1048(%rbx),%rcx
   140137829:	mov    %r9,%rdx
   14013782c:	vzeroupper
   14013782f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137834:	mov    0x1048(%rbx),%rdx
   14013783b:	mov    0x1050(%rbx),%rax
   140137842:	add    %rdx,%rsi
   140137845:	mov    %rax,0x38(%rsp)
   14013784a:	lea    0x8(%rsi),%r8
   14013784e:	jmp    140137767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cf7>
   140137853:	mov    %rcx,%rdx
   140137856:	lea    0x1068(%rbx),%rcx
   14013785d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137862:	jmp    1401308e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce72>
   140137867:	mov    %r12,(%rsi)
   14013786a:	mov    0x1048(%rbx),%rdx
   140137871:	add    $0x8,%rsi
   140137875:	mov    %rbp,%rcx
   140137878:	movb   $0x0,0x1040(%rbx)
   14013787f:	jmp    14012a4d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a69>
   140137884:	xor    %r12d,%r12d
   140137887:	jmp    14012a446 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69d6>
   14013788c:	lea    (%rdi,%rdi,1),%rdx
   140137890:	lea    0x1048(%rbx),%rcx
   140137897:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013789c:	jmp    140133ad7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10067>
   1401378a1:	mov    0x1050(%rbx),%rax
   1401378a8:	mov    0x1048(%rbx),%rcx
   1401378af:	mov    %rax,0x38(%rsp)
   1401378b4:	sub    %rcx,%rax
   1401378b7:	sar    $0x3,%rax
   1401378bb:	lea    (%rax,%rax,1),%rdx
   1401378bf:	cmp    %rdx,%rax
   1401378c2:	jae    140130f7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd50a>
   1401378c8:	sub    %rcx,%rsi
   1401378cb:	lea    0x1048(%rbx),%rcx
   1401378d2:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401378d7:	mov    0x1050(%rbx),%rax
   1401378de:	add    0x1048(%rbx),%rsi
   1401378e5:	lea    0x8(%rsi),%r8
   1401378e9:	mov    %rax,0x38(%rsp)
   1401378ee:	jmp    140130f7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd50a>
   1401378f3:	mov    0x1c8(%rsp),%rax
   1401378fb:	mov    0x60(%rsp),%rdx
   140137900:	lea    0x540(%rsp),%rcx
   140137908:	mov    %rax,0x1d0(%rsp)
   140137910:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140137915:	mov    0x540(%rsp),%rax
   14013791d:	mov    %rax,0x1c8(%rsp)
   140137925:	jmp    14012d963 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ef3>
   14013792a:	mov    %r10,0x38(%rsp)
   14013792f:	lea    0x0(%rbp,%rbp,1),%rdx
   140137934:	lea    0x1048(%rbx),%rcx
   14013793b:	vzeroupper
   14013793e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137943:	mov    0x38(%rsp),%r10
   140137948:	jmp    140133b98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10128>
   14013794d:	mov    0x1050(%rbx),%rax
   140137954:	mov    %rax,0x38(%rsp)
   140137959:	sub    %rdx,%rax
   14013795c:	sar    $0x3,%rax
   140137960:	lea    (%rax,%rax,1),%rcx
   140137964:	cmp    %rcx,%rax
   140137967:	jae    140131edb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe46b>
   14013796d:	sub    %rdx,%rsi
   140137970:	mov    %rcx,%rdx
   140137973:	lea    0x1048(%rbx),%rcx
   14013797a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013797f:	mov    0x1048(%rbx),%rdx
   140137986:	mov    0x1050(%rbx),%rax
   14013798d:	add    %rdx,%rsi
   140137990:	mov    %rax,0x38(%rsp)
   140137995:	lea    0x8(%rsi),%r8
   140137999:	jmp    140131edb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe46b>
   14013799e:	mov    %r9,%rdx
   1401379a1:	lea    0x1048(%rbx),%rcx
   1401379a8:	vzeroupper
   1401379ab:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401379b0:	mov    0x1048(%rbx),%rdx
   1401379b7:	mov    0x1050(%rbx),%rax
   1401379be:	lea    (%rdx,%r12,1),%rsi
   1401379c2:	lea    0x8(%rsi),%r8
   1401379c6:	jmp    14012db96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa126>
   1401379cb:	mov    0x1050(%rbx),%rcx
   1401379d2:	mov    0x1048(%rbx),%rax
   1401379d9:	mov    %rcx,0x38(%rsp)
   1401379de:	sub    %rax,%rcx
   1401379e1:	sar    $0x3,%rcx
   1401379e5:	lea    (%rcx,%rcx,1),%rdx
   1401379e9:	cmp    %rdx,%rcx
   1401379ec:	jae    140133ca3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10233>
   1401379f2:	lea    0x1048(%rbx),%rcx
   1401379f9:	sub    %rax,%rsi
   1401379fc:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a01:	mov    0x1050(%rbx),%rax
   140137a08:	add    0x1048(%rbx),%rsi
   140137a0f:	lea    0x8(%rsi),%r8
   140137a13:	mov    %rax,0x38(%rsp)
   140137a18:	jmp    140133ca3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10233>
   140137a1d:	mov    0x1c8(%rsp),%rax
   140137a25:	mov    0x40(%rsp),%rdx
   140137a2a:	mov    %rdi,%rcx
   140137a2d:	mov    $0x2,%r12d
   140137a33:	mov    %rax,0x1d0(%rsp)
   140137a3b:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140137a40:	mov    %rax,0x1c8(%rsp)
   140137a48:	jmp    140133ce9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10279>
   140137a4d:	mov    0x40(%rsp),%rdx
   140137a52:	mov    %rdi,%rcx
   140137a55:	mov    $0x1,%r12d
   140137a5b:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140137a60:	mov    %rax,0x1c8(%rsp)
   140137a68:	jmp    140133ce9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10279>
   140137a6d:	cmp    $0x2,%r12b
   140137a71:	je     140137cbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1424e>
   140137a77:	sub    $0x1,%r12b
   140137a7b:	jne    140137cab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1423b>
   140137a81:	mov    0x1048(%rbx),%rdx
   140137a88:	mov    0x1050(%rbx),%rax
   140137a8f:	lea    0x8(%rsi),%r8
   140137a93:	cmp    0x38(%rsp),%r8
   140137a98:	jae    140137c68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141f8>
   140137a9e:	mov    0x1c8(%rsp),%rcx
   140137aa6:	mov    %rcx,(%rsi)
   140137aa9:	mov    %r8,%rsi
   140137aac:	mov    0x60(%rsp),%rcx
   140137ab1:	sub    %rdx,%rsi
   140137ab4:	sub    %rdx,%rax
   140137ab7:	mov    %rsi,%rbp
   140137aba:	sub    %r15,%rcx
   140137abd:	sar    $0x3,%rbp
   140137ac1:	mov    %rcx,0x1038(%rbx)
   140137ac8:	cmp    %rsi,%rax
   140137acb:	jae    140137ade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1406e>
   140137acd:	lea    0x0(%rbp,%rbp,1),%rdx
   140137ad2:	lea    0x1048(%rbx),%rcx
   140137ad9:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ade:	vmovdqa 0x224ffa(%rip),%xmm0        # 14035cae0 <CSWTCH.3092+0x1e0>
   140137ae6:	mov    %rbp,0x1060(%rbx)
   140137aed:	mov    $0x10,%ecx
   140137af2:	movb   $0x0,0x153a0(%rbx)
   140137af9:	vmovdqa %xmm0,0x15390(%rbx)
   140137b01:	call   140338b60 <__cxa_allocate_exception>
   140137b06:	mov    0x8(%rdi),%r9
   140137b0a:	mov    (%rdi),%r8
   140137b0d:	lea    0x223fbd(%rip),%rdx        # 14035bad1 <.rdata+0x511>
   140137b14:	mov    %rax,%rsi
   140137b17:	lea    0x500(%rsp),%rax
   140137b1f:	mov    %rax,%rcx
   140137b22:	mov    %rax,0x80(%rsp)
   140137b2a:	call   1400fb2e0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > std::operator+<char, std::char_traits<char>, std::allocator<char> >(char const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) [clone .isra.0]>
   140137b2f:	mov    0x80(%rsp),%rcx
   140137b37:	lea    0x223fa4(%rip),%rdx        # 14035bae2 <.rdata+0x522>
   140137b3e:	call   1402ee1b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   140137b43:	mov    %rax,%rdx
   140137b46:	lea    0x520(%rsp),%rcx
   140137b4e:	call   1402f05a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   140137b53:	mov    0x40(%rsp),%rax
   140137b58:	lea    0x520(%rsp),%rcx
   140137b60:	mov    0x8(%rax),%r8
   140137b64:	mov    (%rax),%rdx
   140137b67:	call   1402ee5c0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*, unsigned long long)>
   140137b6c:	mov    %rax,%rdx
   140137b6f:	lea    0x540(%rsp),%rcx
   140137b77:	call   1402f05a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   140137b7c:	lea    0x223f70(%rip),%rdx        # 14035baf3 <.rdata+0x533>
   140137b83:	lea    0x540(%rsp),%rcx
   140137b8b:	call   1402ee1b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   140137b90:	mov    %rax,%rdx
   140137b93:	lea    0x680(%rsp),%rcx
   140137b9b:	call   1402f05a0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   140137ba0:	lea    0x680(%rsp),%rdx
   140137ba8:	mov    %rsi,%rcx
   140137bab:	call   1402d0800 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140137bb0:	lea    0x240d69(%rip),%rax        # 140378920 <vtable for setun::VMException+0x10>
   140137bb7:	mov    0x680(%rsp),%rcx
   140137bbf:	mov    %rax,(%rsi)
   140137bc2:	lea    0x690(%rsp),%rax
   140137bca:	cmp    %rax,%rcx
   140137bcd:	je     140137be0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14170>
   140137bcf:	mov    0x690(%rsp),%rax
   140137bd7:	lea    0x1(%rax),%rdx
   140137bdb:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140137be0:	mov    0x540(%rsp),%rcx
   140137be8:	lea    0x550(%rsp),%rax
   140137bf0:	cmp    %rax,%rcx
   140137bf3:	je     140137c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14196>
   140137bf5:	mov    0x550(%rsp),%rax
   140137bfd:	lea    0x1(%rax),%rdx
   140137c01:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140137c06:	mov    0x520(%rsp),%rcx
   140137c0e:	lea    0x530(%rsp),%rax
   140137c16:	cmp    %rax,%rcx
   140137c19:	je     140137c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141bc>
   140137c1b:	mov    0x530(%rsp),%rax
   140137c23:	lea    0x1(%rax),%rdx
   140137c27:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140137c2c:	mov    0x500(%rsp),%rcx
   140137c34:	lea    0x510(%rsp),%rax
   140137c3c:	cmp    %rax,%rcx
   140137c3f:	je     140137c52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141e2>
   140137c41:	mov    0x510(%rsp),%rax
   140137c49:	lea    0x1(%rax),%rdx
   140137c4d:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140137c52:	lea    0xce857(%rip),%r8        # 1402064b0 <setun::VMException::~VMException()>
   140137c59:	lea    0x23aa60(%rip),%rdx        # 1403726c0 <typeinfo for setun::VMException>
   140137c60:	mov    %rsi,%rcx
   140137c63:	call   140339200 <__cxa_throw>
   140137c68:	mov    %rax,%rcx
   140137c6b:	sub    %rdx,%rcx
   140137c6e:	sar    $0x3,%rcx
   140137c72:	lea    (%rcx,%rcx,1),%r9
   140137c76:	cmp    %r9,%rcx
   140137c79:	jae    140137a9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1402e>
   140137c7f:	sub    %rdx,%rsi
   140137c82:	lea    0x1048(%rbx),%rcx
   140137c89:	mov    %r9,%rdx
   140137c8c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137c91:	mov    0x1048(%rbx),%rdx
   140137c98:	mov    0x1050(%rbx),%rax
   140137c9f:	add    %rdx,%rsi
   140137ca2:	lea    0x8(%rsi),%r8
   140137ca6:	jmp    140137a9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1402e>
   140137cab:	mov    0x1048(%rbx),%rdx
   140137cb2:	mov    0x1050(%rbx),%rax
   140137cb9:	jmp    140137aac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1403c>
   140137cbe:	mov    0x1048(%rbx),%rdx
   140137cc5:	mov    0x1050(%rbx),%rax
   140137ccc:	lea    0x10(%rsi),%r8
   140137cd0:	cmp    0x38(%rsp),%r8
   140137cd5:	jae    140138518 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aa8>
   140137cdb:	mov    0x1d0(%rsp),%rcx
   140137ce3:	mov    %rcx,(%rsi)
   140137ce6:	mov    0x1c8(%rsp),%rcx
   140137cee:	mov    %rcx,0x8(%rsi)
   140137cf2:	mov    %r8,%rsi
   140137cf5:	jmp    140137aac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1403c>
   140137cfa:	mov    %rax,%rcx
   140137cfd:	sub    %rdx,%rcx
   140137d00:	sar    $0x3,%rcx
   140137d04:	lea    (%rcx,%rcx,1),%r10
   140137d08:	cmp    %r10,%rcx
   140137d0b:	jae    14012f9a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf31>
   140137d11:	sub    %rdx,%rsi
   140137d14:	lea    0x1048(%rbx),%rcx
   140137d1b:	mov    %r10,%rdx
   140137d1e:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d23:	mov    0x1048(%rbx),%rdx
   140137d2a:	mov    0x1050(%rbx),%rax
   140137d31:	add    %rdx,%rsi
   140137d34:	lea    0x8(%rsi),%r8
   140137d38:	jmp    14012f9a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf31>
   140137d3d:	mov    %r9,%rdx
   140137d40:	lea    0x1048(%rbx),%rcx
   140137d47:	vzeroupper
   140137d4a:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d4f:	mov    0x1048(%rbx),%rdx
   140137d56:	mov    0x1050(%rbx),%rax
   140137d5d:	lea    (%rdx,%r12,1),%rsi
   140137d61:	lea    0x8(%rsi),%r8
   140137d65:	jmp    14012e22d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7bd>
   140137d6a:	mov    %rax,%rcx
   140137d6d:	sub    %rdx,%rcx
   140137d70:	sar    $0x3,%rcx
   140137d74:	lea    (%rcx,%rcx,1),%r10
   140137d78:	cmp    %r10,%rcx
   140137d7b:	jae    140131d8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe31b>
   140137d81:	sub    %rdx,%rsi
   140137d84:	lea    0x1048(%rbx),%rcx
   140137d8b:	mov    %r10,%rdx
   140137d8e:	vzeroupper
   140137d91:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d96:	mov    0x1048(%rbx),%rdx
   140137d9d:	mov    0x1050(%rbx),%rax
   140137da4:	add    %rdx,%rsi
   140137da7:	lea    0x8(%rsi),%r8
   140137dab:	jmp    140131d8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe31e>
   140137db0:	mov    0x1048(%rbx),%rdx
   140137db7:	mov    0x1050(%rbx),%rax
   140137dbe:	mov    %rsi,%r8
   140137dc1:	vzeroupper
   140137dc4:	jmp    140131d99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe329>
   140137dc9:	mov    0x1050(%rbx),%rax
   140137dd0:	mov    0x1048(%rbx),%rcx
   140137dd7:	mov    %rax,0x38(%rsp)
   140137ddc:	sub    %rcx,%rax
   140137ddf:	sar    $0x3,%rax
   140137de3:	lea    (%rax,%rax,1),%rdx
   140137de7:	cmp    %rdx,%rax
   140137dea:	jae    1401319d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf63>
   140137df0:	sub    %rcx,%rsi
   140137df3:	lea    0x1048(%rbx),%rcx
   140137dfa:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137dff:	mov    0x1050(%rbx),%rax
   140137e06:	add    0x1048(%rbx),%rsi
   140137e0d:	mov    %rax,0x38(%rsp)
   140137e12:	jmp    1401319d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf63>
   140137e17:	lea    0x680(%rsp),%r10
   140137e1f:	mov    0x1c8(%rsp),%rax
   140137e27:	lea    0x310(%rsp),%rdx
   140137e2f:	mov    %r10,%rcx
   140137e32:	mov    %r10,0x60(%rsp)
   140137e37:	mov    %rax,0x1d0(%rsp)
   140137e3f:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140137e44:	mov    0x40(%rsp),%rcx
   140137e49:	mov    0x60(%rsp),%rdx
   140137e4e:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140137e53:	mov    0x680(%rsp),%rcx
   140137e5b:	mov    %rax,0x1c8(%rsp)
   140137e63:	lea    0x690(%rsp),%rax
   140137e6b:	cmp    %rax,%rcx
   140137e6e:	je     140135669 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bf9>
   140137e74:	mov    0x690(%rsp),%rax
   140137e7c:	lea    0x1(%rax),%rdx
   140137e80:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140137e85:	jmp    140135669 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bf9>
   140137e8a:	sub    $0x1,%r12b
   140137e8e:	je     140138b91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15121>
   140137e94:	lea    0x8(%rsi),%r8
   140137e98:	cmp    0x38(%rsp),%r8
   140137e9d:	jae    140138b32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x150c2>
   140137ea3:	mov    0x1d0(%rsp),%rax
   140137eab:	mov    $0x2,%r12d
   140137eb1:	movabs $0xfffc000000000000,%rdx
   140137ebb:	mov    %rax,(%rsi)
   140137ebe:	mov    0x1c8(%rsp),%rax
   140137ec6:	mov    %r8,%rsi
   140137ec9:	mov    %rax,0x1d0(%rsp)
   140137ed1:	mov    0x50(%r10),%rax
   140137ed5:	vmovsd (%rax,%rdi,8),%xmm0
   140137eda:	vucomisd %xmm0,%xmm0
   140137ede:	vmovq  %xmm0,%rax
   140137ee3:	cmovp  %rdx,%rax
   140137ee7:	jmp    1401351d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11764>
   140137eec:	mov    0x1050(%rbx),%rax
   140137ef3:	mov    0x1048(%rbx),%rcx
   140137efa:	mov    %rax,0x38(%rsp)
   140137eff:	sub    %rcx,%rax
   140137f02:	sar    $0x3,%rax
   140137f06:	lea    (%rax,%rax,1),%rdx
   140137f0a:	cmp    %rdx,%rax
   140137f0d:	jae    140135f55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124e5>
   140137f13:	sub    %rcx,%rsi
   140137f16:	lea    0x1048(%rbx),%rcx
   140137f1d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137f22:	mov    0x1050(%rbx),%rax
   140137f29:	add    0x1048(%rbx),%rsi
   140137f30:	lea    0x8(%rsi),%r8
   140137f34:	mov    %rax,0x38(%rsp)
   140137f39:	jmp    140135f55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124e5>
   140137f3e:	mov    0x1048(%rbx),%rdx
   140137f45:	mov    0x1050(%rbx),%rax
   140137f4c:	mov    %rsi,%r8
   140137f4f:	vzeroupper
   140137f52:	jmp    140124787 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd17>
   140137f57:	shl    $0x10,%rax
   140137f5b:	mov    %rax,%rdx
   140137f5e:	sar    $0x10,%rdx
   140137f62:	cmp    $0xff0000,%rax
   140137f68:	ja     14012f20f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb79f>
   140137f6e:	mov    0x38(%rdi),%rax
   140137f72:	mov    %dl,(%rax,%r9,1)
   140137f76:	cmpb   $0x0,0x1040(%rbx)
   140137f7d:	je     14012e42b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bb>
   140137f83:	movzbl 0x0(%rbp),%eax
   140137f87:	lea    0x288112(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137f8e:	add    $0x1,%rbp
   140137f92:	mov    (%rdi,%rax,8),%rax
   140137f96:	jmp    *%rax
   140137f98:	mov    %r9,%rdx
   140137f9b:	lea    0x1048(%rbx),%rcx
   140137fa2:	vzeroupper
   140137fa5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137faa:	mov    0x1048(%rbx),%rdx
   140137fb1:	mov    0x1050(%rbx),%rax
   140137fb8:	lea    (%rdx,%r12,1),%rsi
   140137fbc:	lea    0x8(%rsi),%r8
   140137fc0:	jmp    14012e161 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6f1>
   140137fc5:	mov    0x1c8(%rsp),%rdx
   140137fcd:	xor    %r12d,%r12d
   140137fd0:	add    $0x8,%rsi
   140137fd4:	mov    %rdx,(%rax,%r13,8)
   140137fd8:	mov    0x1d0(%rsp),%rax
   140137fe0:	mov    0x1048(%rbx),%rdx
   140137fe7:	mov    %rax,-0x8(%rsi)
   140137feb:	jmp    140135b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12098>
   140137ff0:	mov    0x1c8(%rsp),%rdx
   140137ff8:	mov    %rdx,(%rax,%r13,8)
   140137ffc:	mov    0x1048(%rbx),%rdx
   140138003:	xor    %r12d,%r12d
   140138006:	jmp    140135b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12098>
   14013800b:	cmp    $0x1,%dil
   14013800f:	je     140138145 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146d5>
   140138015:	cmp    $0x2,%r12b
   140138019:	je     140138111 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146a1>
   14013801f:	cmp    $0x1,%r12b
   140138023:	jne    140138105 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14695>
   140138029:	mov    0x1048(%rbx),%rdx
   140138030:	lea    0x8(%rsi),%r8
   140138034:	cmp    0x38(%rsp),%r8
   140138039:	jae    1401380b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14640>
   14013803b:	mov    0x1c8(%rsp),%rax
   140138043:	xor    %r12d,%r12d
   140138046:	mov    %rax,(%rsi)
   140138049:	mov    %r8,%rsi
   14013804c:	mov    0xa0(%rsp),%rax
   140138054:	mov    0x1068(%rbx),%rcx
   14013805b:	movzbl %dil,%r9d
   14013805f:	mov    %r9d,%r10d
   140138062:	add    %r13,%rax
   140138065:	lea    (%rcx,%rax,8),%r8
   140138069:	xor    %eax,%eax
   14013806b:	mov    -0x8(%rsi,%rax,1),%r11
   140138070:	mov    %r11,(%r8,%rax,1)
   140138074:	sub    $0x8,%rax
   140138078:	sub    $0x1,%r10d
   14013807c:	jne    14013806b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145fb>
   14013807e:	lea    -0x1(%r9),%eax
   140138082:	mov    %rsi,%r8
   140138085:	imul   $0xfffffffffffffff8,%rax,%rax
   140138089:	lea    -0x10(%rsi,%rax,1),%rsi
   14013808e:	mov    -0x10(%rax,%r8,1),%rax
   140138093:	mov    %rax,(%rcx,%r13,8)
   140138097:	jmp    140135b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12098>
   14013809c:	add    %rdx,%rdx
   14013809f:	lea    0x1068(%rbx),%rcx
   1401380a6:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401380ab:	jmp    140135ad1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12061>
   1401380b0:	mov    0x1050(%rbx),%rax
   1401380b7:	mov    %rsi,%rbp
   1401380ba:	sub    %rdx,%rbp
   1401380bd:	mov    %rax,0x38(%rsp)
   1401380c2:	sub    %rdx,%rax
   1401380c5:	sar    $0x3,%rax
   1401380c9:	lea    (%rax,%rax,1),%rcx
   1401380cd:	cmp    %rcx,%rax
   1401380d0:	jae    14013803b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145cb>
   1401380d6:	mov    %rcx,%rdx
   1401380d9:	lea    0x1048(%rbx),%rcx
   1401380e0:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401380e5:	mov    0x1048(%rbx),%rdx
   1401380ec:	mov    0x1050(%rbx),%rax
   1401380f3:	lea    (%rdx,%rbp,1),%rsi
   1401380f7:	mov    %rax,0x38(%rsp)
   1401380fc:	lea    0x8(%rsi),%r8
   140138100:	jmp    14013803b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145cb>
   140138105:	mov    0x1048(%rbx),%rdx
   14013810c:	jmp    14013804c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145dc>
   140138111:	mov    0x1048(%rbx),%rdx
   140138118:	lea    0x10(%rsi),%r8
   14013811c:	cmp    0x38(%rsp),%r8
   140138121:	jae    14013817c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1470c>
   140138123:	mov    0x1d0(%rsp),%rax
   14013812b:	xor    %r12d,%r12d
   14013812e:	mov    %rax,(%rsi)
   140138131:	mov    0x1c8(%rsp),%rax
   140138139:	mov    %rax,0x8(%rsi)
   14013813d:	mov    %r8,%rsi
   140138140:	jmp    14013804c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145dc>
   140138145:	mov    0x1068(%rbx),%rax
   14013814c:	cmp    $0x2,%r12b
   140138150:	je     1401381ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1477a>
   140138156:	cmp    $0x1,%r12b
   14013815a:	je     1401381cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1475d>
   14013815c:	mov    -0x8(%rsi),%rdx
   140138160:	sub    $0x10,%rsi
   140138164:	mov    %rdx,0x8(%rax,%r13,8)
   140138169:	mov    (%rsi),%rdx
   14013816c:	mov    %rdx,(%rax,%r13,8)
   140138170:	mov    0x1048(%rbx),%rdx
   140138177:	jmp    140135b08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12098>
   14013817c:	mov    0x1050(%rbx),%rax
   140138183:	mov    %rsi,%rbp
   140138186:	sub    %rdx,%rbp
   140138189:	mov    %rax,0x38(%rsp)
   14013818e:	sub    %rdx,%rax
   140138191:	sar    $0x3,%rax
   140138195:	lea    (%rax,%rax,1),%rcx
   140138199:	cmp    %rcx,%rax
   14013819c:	jae    140138123 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146b3>
   14013819e:	mov    %rcx,%rdx
   1401381a1:	lea    0x1048(%rbx),%rcx
   1401381a8:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401381ad:	mov    0x1048(%rbx),%rdx
   1401381b4:	mov    0x1050(%rbx),%rax
   1401381bb:	lea    (%rdx,%rbp,1),%rsi
   1401381bf:	mov    %rax,0x38(%rsp)
   1401381c4:	lea    0x10(%rsi),%r8
   1401381c8:	jmp    140138123 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146b3>
   1401381cd:	mov    0x1c8(%rsp),%rdx
   1401381d5:	sub    $0x8,%rsi
   1401381d9:	mov    %rdx,0x8(%rax,%r13,8)
   1401381de:	mov    (%rsi),%rdx
   1401381e1:	mov    %rdx,(%rax,%r13,8)
   1401381e5:	jmp    140137ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1458c>
   1401381ea:	mov    0x1d0(%rsp),%rdx
   1401381f2:	mov    %rdx,(%rax,%r13,8)
   1401381f6:	mov    0x1c8(%rsp),%rdx
   1401381fe:	mov    %rdx,0x8(%rax,%r13,8)
   140138203:	jmp    140137ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1458c>
   140138208:	mov    0x1050(%rbx),%rax
   14013820f:	sub    %rdx,%rax
   140138212:	cmp    %r9,%rax
   140138215:	jb     1401382b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14844>
   14013821b:	mov    %rdi,0x1060(%rbx)
   140138222:	mov    0x152a0(%rbx),%rax
   140138229:	cmp    %rax,0x68(%rcx)
   14013822d:	jae    1401382a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14830>
   14013822f:	mov    0x1060(%rbx),%rax
   140138236:	mov    0x1048(%rbx),%rdx
   14013823d:	lea    (%rdx,%rax,8),%rsi
   140138241:	jmp    140135b8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1211e>
   140138246:	mov    %r9,%rdx
   140138249:	lea    0x1048(%rbx),%rcx
   140138250:	vzeroupper
   140138253:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138258:	mov    0x1048(%rbx),%rdx
   14013825f:	mov    0x1050(%rbx),%rax
   140138266:	lea    (%rdx,%r12,1),%rsi
   14013826a:	lea    0x8(%rsi),%r8
   14013826e:	jmp    14012df00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa490>
   140138273:	mov    %r9,%rdx
   140138276:	lea    0x1048(%rbx),%rcx
   14013827d:	vzeroupper
   140138280:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138285:	mov    0x1048(%rbx),%rdx
   14013828c:	mov    0x1050(%rbx),%rax
   140138293:	lea    (%rdx,%rbp,1),%rsi
   140138297:	lea    0x10(%rsi),%r8
   14013829b:	jmp    1401369bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f4f>
   1401382a0:	lea    0x15270(%rbx),%rcx
   1401382a7:	mov    %rbx,%rdx
   1401382aa:	call   140157cf0 <setun::GCEngine::collect_garbage(setun::VM&)>
   1401382af:	jmp    14013822f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147bf>
   1401382b4:	lea    0x1048(%rbx),%rcx
   1401382bb:	lea    (%rdi,%rdi,1),%rdx
   1401382bf:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401382c4:	mov    0x15270(%rbx),%rcx
   1401382cb:	jmp    14013821b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147ab>
   1401382d0:	mov    0x1050(%rbx),%rax
   1401382d7:	mov    0x1048(%rbx),%rcx
   1401382de:	mov    %rax,0x38(%rsp)
   1401382e3:	sub    %rcx,%rax
   1401382e6:	sar    $0x3,%rax
   1401382ea:	lea    (%rax,%rax,1),%rdx
   1401382ee:	cmp    %rdx,%rax
   1401382f1:	jae    1401322c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe855>
   1401382f7:	sub    %rcx,%rsi
   1401382fa:	lea    0x1048(%rbx),%rcx
   140138301:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138306:	mov    0x1050(%rbx),%rax
   14013830d:	add    0x1048(%rbx),%rsi
   140138314:	lea    0x8(%rsi),%r8
   140138318:	mov    %rax,0x38(%rsp)
   14013831d:	jmp    1401322c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe855>
   140138322:	mov    0x1c8(%rsp),%rax
   14013832a:	movslq %edi,%rdx
   14013832d:	lea    0x540(%rsp),%rcx
   140138335:	mov    %rax,0x1d0(%rsp)
   14013833d:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138342:	mov    0x540(%rsp),%rax
   14013834a:	mov    %rax,0x1c8(%rsp)
   140138352:	jmp    140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   140138357:	movslq %edi,%rdx
   14013835a:	lea    0x540(%rsp),%rcx
   140138362:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138367:	mov    0x540(%rsp),%rax
   14013836f:	mov    %rax,0x1c8(%rsp)
   140138377:	jmp    14012d6c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c51>
   14013837c:	mov    %r9,%rdx
   14013837f:	lea    0x1048(%rbx),%rcx
   140138386:	vzeroupper
   140138389:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013838e:	mov    0x1048(%rbx),%rdx
   140138395:	mov    0x1050(%rbx),%rax
   14013839c:	lea    (%rdx,%r12,1),%rsi
   1401383a0:	lea    0x8(%rsi),%r8
   1401383a4:	jmp    14012de10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3a0>
   1401383a9:	mov    0x1050(%rbx),%rax
   1401383b0:	mov    0x1048(%rbx),%rcx
   1401383b7:	mov    %rax,0x38(%rsp)
   1401383bc:	sub    %rcx,%rax
   1401383bf:	sar    $0x3,%rax
   1401383c3:	lea    (%rax,%rax,1),%rdx
   1401383c7:	cmp    %rdx,%rax
   1401383ca:	jae    140135325 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118b5>
   1401383d0:	sub    %rcx,%rsi
   1401383d3:	lea    0x1048(%rbx),%rcx
   1401383da:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401383df:	mov    0x1050(%rbx),%rax
   1401383e6:	add    0x1048(%rbx),%rsi
   1401383ed:	lea    0x8(%rsi),%r8
   1401383f1:	mov    %rax,0x38(%rsp)
   1401383f6:	jmp    140135325 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118b5>
   1401383fb:	mov    0x1c8(%rsp),%rax
   140138403:	mov    0x40(%rsp),%rdx
   140138408:	lea    0x540(%rsp),%rcx
   140138410:	mov    $0x2,%r12d
   140138416:	mov    %rax,0x1d0(%rsp)
   14013841e:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138423:	mov    0x540(%rsp),%rax
   14013842b:	mov    %rax,0x1c8(%rsp)
   140138433:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   140138438:	mov    0x40(%rsp),%rdx
   14013843d:	lea    0x540(%rsp),%rcx
   140138445:	mov    $0x1,%r12d
   14013844b:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138450:	mov    0x540(%rsp),%rax
   140138458:	mov    %rax,0x1c8(%rsp)
   140138460:	jmp    140128089 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4619>
   140138465:	mov    0x1c8(%rsp),%rax
   14013846d:	lea    0x680(%rsp),%rcx
   140138475:	mov    $0x2,%r12d
   14013847b:	mov    %rax,0x1d0(%rsp)
   140138483:	mov    0x20(%r10),%rax
   140138487:	mov    (%rax,%rdi,8),%rdx
   14013848b:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138490:	mov    0x680(%rsp),%rax
   140138498:	mov    %rax,0x1c8(%rsp)
   1401384a0:	jmp    1401350c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11656>
   1401384a5:	mov    0x20(%r10),%rax
   1401384a9:	lea    0x680(%rsp),%rcx
   1401384b1:	mov    $0x1,%r12d
   1401384b7:	mov    (%rax,%rdi,8),%rdx
   1401384bb:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401384c0:	mov    0x680(%rsp),%rax
   1401384c8:	mov    %rax,0x1c8(%rsp)
   1401384d0:	jmp    1401350c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11656>
   1401384d5:	mov    %r9,%rdx
   1401384d8:	lea    0x1048(%rbx),%rcx
   1401384df:	vzeroupper
   1401384e2:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401384e7:	mov    0x1048(%rbx),%rdx
   1401384ee:	mov    0x1050(%rbx),%rax
   1401384f5:	lea    (%rdx,%r12,1),%rsi
   1401384f9:	lea    0x8(%rsi),%r8
   1401384fd:	jmp    14012e1c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa757>
   140138502:	mov    0x1048(%rbx),%rdx
   140138509:	mov    0x1050(%rbx),%rax
   140138510:	mov    %rsi,%r8
   140138513:	jmp    14012f9ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf3c>
   140138518:	mov    %rax,%rcx
   14013851b:	sub    %rdx,%rcx
   14013851e:	sar    $0x3,%rcx
   140138522:	lea    (%rcx,%rcx,1),%r9
   140138526:	cmp    %r9,%rcx
   140138529:	jae    140137cdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1426b>
   14013852f:	sub    %rdx,%rsi
   140138532:	lea    0x1048(%rbx),%rcx
   140138539:	mov    %r9,%rdx
   14013853c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138541:	mov    0x1048(%rbx),%rdx
   140138548:	mov    0x1050(%rbx),%rax
   14013854f:	add    %rdx,%rsi
   140138552:	lea    0x10(%rsi),%r8
   140138556:	jmp    140137cdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1426b>
   14013855b:	mov    0x1c8(%rsp),%rax
   140138563:	lea    0x338(%rsp),%rdx
   14013856b:	lea    0x680(%rsp),%rcx
   140138573:	mov    %rax,0x1d0(%rsp)
   14013857b:	call   14021c6a0 <setun::VMValue::to_string[abi:cxx11]() const>
   140138580:	mov    0x40(%rsp),%rcx
   140138585:	lea    0x680(%rsp),%rdx
   14013858d:	call   14021d500 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140138592:	mov    0x680(%rsp),%rcx
   14013859a:	mov    %rax,0x1c8(%rsp)
   1401385a2:	lea    0x690(%rsp),%rax
   1401385aa:	cmp    %rax,%rcx
   1401385ad:	je     140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   1401385b3:	mov    0x690(%rsp),%rax
   1401385bb:	lea    0x1(%rax),%rdx
   1401385bf:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401385c4:	jmp    140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   1401385c9:	mov    0x1050(%rbx),%rcx
   1401385d0:	mov    0x1048(%rbx),%rax
   1401385d7:	mov    %rcx,0x38(%rsp)
   1401385dc:	sub    %rax,%rcx
   1401385df:	sar    $0x3,%rcx
   1401385e3:	lea    (%rcx,%rcx,1),%rdx
   1401385e7:	cmp    %rdx,%rcx
   1401385ea:	jae    140134c04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11194>
   1401385f0:	lea    0x1048(%rbx),%rcx
   1401385f7:	mov    %r9,0x60(%rsp)
   1401385fc:	sub    %rax,%rsi
   1401385ff:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138604:	mov    0x1050(%rbx),%rax
   14013860b:	add    0x1048(%rbx),%rsi
   140138612:	mov    0x60(%rsp),%r9
   140138617:	lea    0x8(%rsi),%r8
   14013861b:	mov    %rax,0x38(%rsp)
   140138620:	jmp    140134c04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11194>
   140138625:	mov    0x1c8(%rsp),%rax
   14013862d:	mov    %r9,%rdx
   140138630:	mov    %rdi,%rcx
   140138633:	mov    %rax,0x1d0(%rsp)
   14013863b:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140138640:	jmp    140135442 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119d2>
   140138645:	mov    %r9,%rdx
   140138648:	mov    %rdi,%rcx
   14013864b:	call   140148610 <setun::ArrayObject::get(unsigned long long) const>
   140138650:	jmp    1401320ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe63b>
   140138655:	mov    %r9,%rdx
   140138658:	lea    0x1048(%rbx),%rcx
   14013865f:	vzeroupper
   140138662:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138667:	mov    0x1048(%rbx),%rdx
   14013866e:	mov    0x1050(%rbx),%rax
   140138675:	lea    (%rdx,%r12,1),%rsi
   140138679:	lea    0x8(%rsi),%r8
   14013867d:	jmp    14012e095 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa625>
   140138682:	mov    %r9,%rdx
   140138685:	lea    0x1048(%rbx),%rcx
   14013868c:	vzeroupper
   14013868f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138694:	mov    0x1048(%rbx),%rdx
   14013869b:	mov    0x1050(%rbx),%rax
   1401386a2:	lea    (%rdx,%r12,1),%rsi
   1401386a6:	lea    0x8(%rsi),%r8
   1401386aa:	jmp    14012e0c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa658>
   1401386af:	mov    0x1c8(%rsp),%rax
   1401386b7:	mov    %rdi,%rdx
   1401386ba:	lea    0x680(%rsp),%rcx
   1401386c2:	mov    $0x2,%r12d
   1401386c8:	mov    %rax,0x1d0(%rsp)
   1401386d0:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401386d5:	mov    0x680(%rsp),%rax
   1401386dd:	mov    %rax,0x1c8(%rsp)
   1401386e5:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   1401386ea:	lea    0x680(%rsp),%rcx
   1401386f2:	mov    %rdi,%rdx
   1401386f5:	mov    $0x1,%r12d
   1401386fb:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138700:	mov    0x680(%rsp),%rax
   140138708:	mov    %rax,0x1c8(%rsp)
   140138710:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140138715:	mov    0x1050(%rbx),%rax
   14013871c:	mov    0x1048(%rbx),%rcx
   140138723:	mov    %rax,0x38(%rsp)
   140138728:	sub    %rcx,%rax
   14013872b:	sar    $0x3,%rax
   14013872f:	lea    (%rax,%rax,1),%rdx
   140138733:	cmp    %rdx,%rax
   140138736:	jae    140130b06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd096>
   14013873c:	sub    %rcx,%rsi
   14013873f:	lea    0x1048(%rbx),%rcx
   140138746:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013874b:	mov    0x1050(%rbx),%rax
   140138752:	add    0x1048(%rbx),%rsi
   140138759:	lea    0x8(%rsi),%r8
   14013875d:	mov    %rax,0x38(%rsp)
   140138762:	jmp    140130b06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd096>
   140138767:	mov    0x1c8(%rsp),%rax
   14013876f:	mov    0x60(%rsp),%rdx
   140138774:	lea    0x540(%rsp),%rcx
   14013877c:	mov    %rax,0x1d0(%rsp)
   140138784:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138789:	mov    0x540(%rsp),%rax
   140138791:	mov    %rax,0x1c8(%rsp)
   140138799:	jmp    140128083 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4613>
   14013879e:	mov    0x410(%rsp),%edi
   1401387a5:	test   %r12b,%r12b
   1401387a8:	je     1401388f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e86>
   1401387ae:	sub    $0x1,%r12b
   1401387b2:	je     1401388c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e51>
   1401387b8:	lea    0x8(%rsi),%r8
   1401387bc:	cmp    0x38(%rsp),%r8
   1401387c1:	jae    140138847 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd7>
   1401387c7:	mov    0x1d0(%rsp),%rax
   1401387cf:	mov    %r8,0x40(%rsp)
   1401387d4:	movslq %edi,%rdx
   1401387d7:	lea    0x680(%rsp),%rcx
   1401387df:	mov    %rax,(%rsi)
   1401387e2:	mov    0x1c8(%rsp),%rax
   1401387ea:	mov    %rax,0x1d0(%rsp)
   1401387f2:	jmp    140134a50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fe0>
   1401387f7:	mov    0x408(%rsp),%rdi
   1401387ff:	test   %r12b,%r12b
   140138802:	je     14013889c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e2c>
   140138808:	sub    $0x1,%r12b
   14013880c:	jne    140134a16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fa6>
   140138812:	mov    0x1c8(%rsp),%rax
   14013881a:	lea    0x680(%rsp),%rcx
   140138822:	mov    %rdi,%rdx
   140138825:	mov    %rax,0x1d0(%rsp)
   14013882d:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138832:	mov    0x680(%rsp),%rax
   14013883a:	mov    %rax,0x1c8(%rsp)
   140138842:	jmp    14013557e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b0e>
   140138847:	mov    0x1050(%rbx),%rax
   14013884e:	mov    0x1048(%rbx),%rdx
   140138855:	mov    %rax,0x38(%rsp)
   14013885a:	sub    %rdx,%rax
   14013885d:	sar    $0x3,%rax
   140138861:	lea    (%rax,%rax,1),%rcx
   140138865:	cmp    %rcx,%rax
   140138868:	jae    1401387c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d57>
   14013886e:	sub    %rdx,%rsi
   140138871:	mov    %rcx,%rdx
   140138874:	lea    0x1048(%rbx),%rcx
   14013887b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138880:	mov    0x1050(%rbx),%rax
   140138887:	add    0x1048(%rbx),%rsi
   14013888e:	lea    0x8(%rsi),%r8
   140138892:	mov    %rax,0x38(%rsp)
   140138897:	jmp    1401387c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d57>
   14013889c:	lea    0x680(%rsp),%rcx
   1401388a4:	mov    %rdi,%rdx
   1401388a7:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401388ac:	mov    0x680(%rsp),%rax
   1401388b4:	mov    %rax,0x1c8(%rsp)
   1401388bc:	jmp    140131aaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe03f>
   1401388c1:	mov    0x1c8(%rsp),%rax
   1401388c9:	movslq %edi,%rdx
   1401388cc:	lea    0x680(%rsp),%rcx
   1401388d4:	mov    %rax,0x1d0(%rsp)
   1401388dc:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   1401388e1:	mov    0x680(%rsp),%rax
   1401388e9:	mov    %rax,0x1c8(%rsp)
   1401388f1:	jmp    14013557e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b0e>
   1401388f6:	movslq %edi,%rdx
   1401388f9:	lea    0x680(%rsp),%rcx
   140138901:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138906:	mov    0x680(%rsp),%rax
   14013890e:	mov    %rax,0x1c8(%rsp)
   140138916:	jmp    140131aaf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe03f>
   14013891b:	sub    $0x1,%r12b
   14013891f:	je     1401389e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f76>
   140138925:	lea    0x8(%rsi),%r8
   140138929:	cmp    0x38(%rsp),%r8
   14013892e:	jae    140138991 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14f21>
   140138930:	mov    0x1d0(%rsp),%rax
   140138938:	mov    %rax,(%rsi)
   14013893b:	mov    0x1c8(%rsp),%rax
   140138943:	mov    %r8,%rsi
   140138946:	mov    %rax,0x1d0(%rsp)
   14013894e:	mov    $0x1fff,%eax
   140138953:	shl    $0x33,%rax
   140138957:	mov    %rax,0x1c8(%rsp)
   14013895f:	jmp    14013557e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b0e>
   140138964:	mov    %r9,%rdx
   140138967:	lea    0x1048(%rbx),%rcx
   14013896e:	vzeroupper
   140138971:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138976:	mov    0x1048(%rbx),%rdx
   14013897d:	mov    0x1050(%rbx),%rax
   140138984:	lea    (%rdx,%rbp,1),%rsi
   140138988:	lea    0x8(%rsi),%r8
   14013898c:	jmp    1401373b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13940>
   140138991:	mov    0x1050(%rbx),%rax
   140138998:	mov    0x1048(%rbx),%rdx
   14013899f:	mov    %rax,0x38(%rsp)
   1401389a4:	sub    %rdx,%rax
   1401389a7:	sar    $0x3,%rax
   1401389ab:	lea    (%rax,%rax,1),%rcx
   1401389af:	cmp    %rcx,%rax
   1401389b2:	jae    140138930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec0>
   1401389b8:	sub    %rdx,%rsi
   1401389bb:	mov    %rcx,%rdx
   1401389be:	lea    0x1048(%rbx),%rcx
   1401389c5:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401389ca:	mov    0x1050(%rbx),%rax
   1401389d1:	add    0x1048(%rbx),%rsi
   1401389d8:	lea    0x8(%rsi),%r8
   1401389dc:	mov    %rax,0x38(%rsp)
   1401389e1:	jmp    140138930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ec0>
   1401389e6:	mov    0x1c8(%rsp),%rax
   1401389ee:	mov    $0x2,%r12d
   1401389f4:	mov    %rax,0x1d0(%rsp)
   1401389fc:	mov    $0x1fff,%eax
   140138a01:	shl    $0x33,%rax
   140138a05:	mov    %rax,0x1c8(%rsp)
   140138a0d:	jmp    140130ebd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd44d>
   140138a12:	mov    %r9,%rdx
   140138a15:	lea    0x1048(%rbx),%rcx
   140138a1c:	vzeroupper
   140138a1f:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138a24:	mov    0x1048(%rbx),%rdx
   140138a2b:	mov    0x1050(%rbx),%rax
   140138a32:	lea    (%rdx,%r12,1),%rsi
   140138a36:	lea    0x8(%rsi),%r8
   140138a3a:	jmp    14012e260 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7f0>
   140138a3f:	mov    %r9,%rdx
   140138a42:	lea    0x1048(%rbx),%rcx
   140138a49:	vzeroupper
   140138a4c:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138a51:	mov    0x1048(%rbx),%rdx
   140138a58:	mov    0x1050(%rbx),%rax
   140138a5f:	lea    (%rdx,%r12,1),%rsi
   140138a63:	lea    0x8(%rsi),%r8
   140138a67:	jmp    14012dd85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa315>
   140138a6c:	mov    0x1050(%rbx),%rax
   140138a73:	mov    0x1048(%rbx),%rcx
   140138a7a:	mov    %rax,0x38(%rsp)
   140138a7f:	sub    %rcx,%rax
   140138a82:	sar    $0x3,%rax
   140138a86:	lea    (%rax,%rax,1),%rdx
   140138a8a:	cmp    %rdx,%rax
   140138a8d:	jae    140135f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1249b>
   140138a93:	sub    %rcx,%rsi
   140138a96:	lea    0x1048(%rbx),%rcx
   140138a9d:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138aa2:	mov    0x1050(%rbx),%rax
   140138aa9:	add    0x1048(%rbx),%rsi
   140138ab0:	lea    0x8(%rsi),%r8
   140138ab4:	mov    %rax,0x38(%rsp)
   140138ab9:	jmp    140135f0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1249b>
   140138abe:	mov    %r9,%rdx
   140138ac1:	lea    0x1048(%rbx),%rcx
   140138ac8:	vzeroupper
   140138acb:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138ad0:	mov    0x1048(%rbx),%rdx
   140138ad7:	mov    0x1050(%rbx),%rax
   140138ade:	lea    (%rdx,%r12,1),%rsi
   140138ae2:	lea    0x8(%rsi),%r8
   140138ae6:	jmp    14012df33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4c3>
   140138aeb:	mov    0x1c8(%rsp),%rax
   140138af3:	mov    0x40(%rsp),%rdx
   140138af8:	lea    0x540(%rsp),%rcx
   140138b00:	mov    $0x2,%r12d
   140138b06:	mov    %rax,0x1d0(%rsp)
   140138b0e:	call   14020fe00 <setun::VMValue::VMValue(long long)>
   140138b13:	mov    0x540(%rsp),%rax
   140138b1b:	mov    %rax,0x1c8(%rsp)
   140138b23:	jmp    14012a146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d6>
   140138b28:	mov    0x40(%rsp),%rdx
   140138b2d:	jmp    1401346af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c3f>
   140138b32:	mov    0x1050(%rbx),%rax
   140138b39:	mov    0x1048(%rbx),%rdx
   140138b40:	mov    %rax,0x38(%rsp)
   140138b45:	sub    %rdx,%rax
   140138b48:	sar    $0x3,%rax
   140138b4c:	lea    (%rax,%rax,1),%rcx
   140138b50:	cmp    %rcx,%rax
   140138b53:	jae    140137ea3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14433>
   140138b59:	sub    %rdx,%rsi
   140138b5c:	mov    %rcx,%rdx
   140138b5f:	lea    0x1048(%rbx),%rcx
   140138b66:	mov    %r10,0x40(%rsp)
   140138b6b:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138b70:	mov    0x1050(%rbx),%rax
   140138b77:	mov    0x40(%rsp),%r10
   140138b7c:	add    0x1048(%rbx),%rsi
   140138b83:	mov    %rax,0x38(%rsp)
   140138b88:	lea    0x8(%rsi),%r8
   140138b8c:	jmp    140137ea3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14433>
   140138b91:	mov    0x1c8(%rsp),%rax
   140138b99:	mov    $0x2,%r12d
   140138b9f:	movabs $0xfffc000000000000,%rdx
   140138ba9:	mov    %rax,0x1d0(%rsp)
   140138bb1:	mov    0x50(%r10),%rax
   140138bb5:	vmovsd (%rax,%rdi,8),%xmm0
   140138bba:	vucomisd %xmm0,%xmm0
   140138bbe:	vmovq  %xmm0,%rax
   140138bc3:	cmovp  %rdx,%rax
   140138bc7:	jmp    1401351d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11764>
   140138bcc:	sub    $0x1,%rdx
   140138bd0:	mov    %rax,%rcx
   140138bd3:	jne    140138bf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15189>
   140138bd5:	vzeroupper
   140138bd8:	call   140338be0 <__cxa_begin_catch>
   140138bdd:	call   140338d50 <__cxa_end_catch>
   140138be2:	mov    0x15108(%rbx),%rax
   140138be9:	cmp    0x15100(%rbx),%rax
   140138bf0:	jne    140138c01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15191>
   140138bf2:	call   1403391b0 <__cxa_rethrow>
   140138bf7:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138bf9:	vzeroupper
   140138bfc:	call   1401effc0 <_Unwind_Resume>
   140138c01:	mov    -0x20(%rax),%rdi
   140138c05:	mov    -0x18(%rax),%rcx
   140138c09:	sub    $0x20,%rax
   140138c0d:	mov    0x10(%rax),%rdx
   140138c11:	mov    0x18(%rax),%rsi
   140138c15:	mov    %rax,0x15108(%rbx)
   140138c1c:	cmp    0x1060(%rbx),%rcx
   140138c23:	jae    140138c2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151bc>
   140138c25:	mov    %rcx,0x1060(%rbx)
   140138c2c:	cmpb   $0x0,0x15211(%rbx)
   140138c33:	je     140138c53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151e3>
   140138c35:	mov    %rdx,0x15268(%rbx)
   140138c3c:	cmp    %rsi,0x150c0(%rbx)
   140138c43:	jb     140138c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1520f>
   140138c45:	cmp    $0x800,%rsi
   140138c4c:	jbe    140138c78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15208>
   140138c4e:	call   14033ee40 <setun::FixedFrameArena::handle_overflow() const [clone .isra.0]>
   140138c53:	mov    0x1070(%rbx),%rax
   140138c5a:	sub    0x1068(%rbx),%rax
   140138c61:	sar    $0x3,%rax
   140138c65:	cmp    %rdx,%rax
   140138c68:	jb     140138c3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151cc>
   140138c6a:	lea    0x1068(%rbx),%rcx
   140138c71:	call   1402e94a0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138c76:	jmp    140138c3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151cc>
   140138c78:	mov    %rsi,0x150c0(%rbx)
   140138c7f:	mov    %rdi,0x1038(%rbx)
   140138c86:	lea    0x2239e2(%rip),%rdx        # 14035c66f <.rdata+0x10af>
   140138c8d:	lea    0x680(%rsp),%rcx
   140138c95:	call   14020ee00 <setun::VMValue::VMValue(char const*)>
   140138c9a:	lea    0x680(%rsp),%rdx
   140138ca2:	lea    0x1048(%rbx),%rcx
   140138ca9:	call   14020e260 <setun::VMStack::push(setun::VMValue const&)>
   140138cae:	mov    0x1060(%rbx),%rax
   140138cb5:	mov    0x1048(%rbx),%rdx
   140138cbc:	mov    0x1038(%rbx),%rbp
   140138cc3:	mov    0x150c0(%rbx),%r13
   140138cca:	lea    (%rdx,%rax,8),%rsi
   140138cce:	mov    0x1050(%rbx),%rax
   140138cd5:	add    %r15,%rbp
   140138cd8:	mov    %rax,0x38(%rsp)
   140138cdd:	test   %r13,%r13
   140138ce0:	jne    140138d07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15297>
   140138ce2:	cmpb   $0x0,0x1040(%rbx)
   140138ce9:	je     14012469c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2c>
   140138cef:	movzbl 0x0(%rbp),%eax
   140138cf3:	lea    0x2873a6(%rip),%rdi        # 1403c00a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140138cfa:	add    $0x1,%rbp
   140138cfe:	xor    %r12d,%r12d
   140138d01:	mov    (%rdi,%rax,8),%rax
   140138d05:	jmp    *%rax
   140138d07:	lea    -0x1(%r13),%rcx
   140138d0b:	imul   $0x28,%rcx,%rcx
   140138d0f:	mov    0x10c8(%rbx,%rcx,1),%r13
   140138d17:	jmp    140138ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15272>
   140138d19:	mov    0x680(%rsp),%rcx
   140138d21:	mov    %rax,%rbx
   140138d24:	lea    0x690(%rsp),%rax
   140138d2c:	cmp    %rax,%rcx
   140138d2f:	je     140138dac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1533c>
   140138d31:	mov    0x690(%rsp),%rax
   140138d39:	lea    0x1(%rax),%rdx
   140138d3d:	vzeroupper
   140138d40:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138d45:	mov    %rbx,%rcx
   140138d48:	call   1401effc0 <_Unwind_Resume>
   140138d4d:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140138d4f:	mov    0x680(%rsp),%rcx
   140138d57:	mov    %rax,%rbx
   140138d5a:	cmp    %r12,%rcx
   140138d5d:	je     140138db1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15341>
   140138d5f:	mov    0x690(%rsp),%rax
   140138d67:	lea    0x1(%rax),%rdx
   140138d6b:	vzeroupper
   140138d6e:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138d73:	mov    0x540(%rsp),%rcx
   140138d7b:	lea    0x550(%rsp),%rax
   140138d83:	cmp    %rax,%rcx
   140138d86:	je     140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138d88:	mov    0x550(%rsp),%rax
   140138d90:	lea    0x1(%rax),%rdx
   140138d94:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138d99:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138d9b:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138da0:	mov    %rax,%rbx
   140138da3:	test   %rdi,%rdi
   140138da6:	jne    140138e52 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153e2>
   140138dac:	vzeroupper
   140138daf:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138db1:	vzeroupper
   140138db4:	jmp    140138d73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15303>
   140138db6:	mov    %rax,%rbx
   140138db9:	vzeroupper
   140138dbc:	mov    0x540(%rsp),%rcx
   140138dc4:	lea    0x550(%rsp),%rax
   140138dcc:	cmp    %rax,%rcx
   140138dcf:	je     140138dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1537a>
   140138dd1:	mov    0x550(%rsp),%rax
   140138dd9:	lea    0x1(%rax),%rdx
   140138ddd:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138de2:	jmp    140138dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1537a>
   140138de4:	mov    %rax,%rbx
   140138de7:	vzeroupper
   140138dea:	mov    0x520(%rsp),%rcx
   140138df2:	lea    0x530(%rsp),%rax
   140138dfa:	cmp    %rax,%rcx
   140138dfd:	je     140138e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153f8>
   140138dff:	mov    0x530(%rsp),%rax
   140138e07:	lea    0x1(%rax),%rdx
   140138e0b:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138e10:	jmp    140138e68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153f8>
   140138e12:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138e17:	mov    0x680(%rsp),%rcx
   140138e1f:	mov    %rax,%rbx
   140138e22:	lea    0x690(%rsp),%rax
   140138e2a:	cmp    %rax,%rcx
   140138e2d:	jne    140138e39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x153c9>
   140138e2f:	vzeroupper
   140138e32:	jmp    140138dbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534c>
   140138e34:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138e39:	mov    0x690(%rsp),%rax
   140138e41:	lea    0x1(%rax),%rdx
   140138e45:	vzeroupper
   140138e48:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138e4d:	jmp    140138dbc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1534c>
   140138e52:	mov    %rdi,%rcx
   140138e55:	vzeroupper
   140138e58:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138e5d:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138e62:	mov    %rax,%rbx
   140138e65:	vzeroupper
   140138e68:	mov    0x500(%rsp),%rcx
   140138e70:	lea    0x510(%rsp),%rax
   140138e78:	cmp    %rax,%rcx
   140138e7b:	je     140138e8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1541e>
   140138e7d:	mov    0x510(%rsp),%rax
   140138e85:	lea    0x1(%rax),%rdx
   140138e89:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138e8e:	mov    %rsi,%rcx
   140138e91:	call   140338e20 <__cxa_free_exception>
   140138e96:	mov    %rbx,%rcx
   140138e99:	call   1401effc0 <_Unwind_Resume>
   140138e9e:	mov    %rax,%rbx
   140138ea1:	vzeroupper
   140138ea4:	jmp    140138e8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1541e>
   140138ea6:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138eab:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138eb0:	mov    0x548(%rsp),%rcx
   140138eb8:	mov    %rax,%rbx
   140138ebb:	test   %rcx,%rcx
   140138ebe:	je     140138dac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1533c>
   140138ec4:	vzeroupper
   140138ec7:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138ecc:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138ed1:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ed6:	jmp    140138d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   140138edb:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ee0:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ee5:	mov    %rax,%rbx
   140138ee8:	cmpq   $0x0,0x40(%rsp)
   140138eee:	je     140138dac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1533c>
   140138ef4:	mov    0x40(%rsp),%rcx
   140138ef9:	vzeroupper
   140138efc:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138f01:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138f06:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f0b:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140138f10:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f15:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f1a:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f1f:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f24:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f29:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f2e:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f33:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140138f38:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140138f3d:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f42:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140138f47:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f4c:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f51:	jmp    140138d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   140138f56:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f5b:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f60:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138f65:	mov    %rax,%rbx
   140138f68:	vzeroupper
   140138f6b:	mov    %rdi,%rcx
   140138f6e:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138f73:	mov    %rbx,%rcx
   140138f76:	call   1401effc0 <_Unwind_Resume>
   140138f7b:	mov    0x688(%rsp),%rcx
   140138f83:	mov    %rax,%rbx
   140138f86:	test   %rcx,%rcx
   140138f89:	je     140138fce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1555e>
   140138f8b:	vzeroupper
   140138f8e:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138f93:	jmp    140138f6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x154fb>
   140138f95:	mov    0x680(%rsp),%rcx
   140138f9d:	mov    %rax,%rbx
   140138fa0:	lea    0x690(%rsp),%rax
   140138fa8:	cmp    %rax,%rcx
   140138fab:	jne    140138fd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15563>
   140138fad:	vzeroupper
   140138fb0:	jmp    140138fb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15548>
   140138fb2:	mov    %rax,%rbx
   140138fb5:	vzeroupper
   140138fb8:	test   %rdi,%rdi
   140138fbb:	je     140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138fc1:	mov    %rdi,%rcx
   140138fc4:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140138fc9:	jmp    140138d45 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152d5>
   140138fce:	vzeroupper
   140138fd1:	jmp    140138f6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x154fb>
   140138fd3:	mov    0x690(%rsp),%rax
   140138fdb:	lea    0x1(%rax),%rdx
   140138fdf:	vzeroupper
   140138fe2:	call   1403389b0 <operator delete(void*, unsigned long long)>
   140138fe7:	jmp    140138fb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15548>
   140138fe9:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138fee:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ff3:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ff8:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140138ffd:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139002:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139007:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   14013900c:	mov    %rax,%rbx
   14013900f:	vzeroupper
   140139012:	jmp    140138d73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15303>
   140139017:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   14013901c:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139021:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139026:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   14013902b:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139030:	vzeroupper
   140139033:	jmp    140138c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x151de>
   140139038:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   14013903d:	jmp    140138f7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1550b>
   140139042:	mov    %rax,%rbx
   140139045:	cmpq   $0x0,0x60(%rsp)
   14013904b:	je     140138dac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1533c>
   140139051:	mov    0x60(%rsp),%rcx
   140139056:	jmp    140138ec4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15454>
   14013905b:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139060:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139065:	mov    %rax,%rbx
   140139068:	mov    %rsi,%rcx
   14013906b:	vzeroupper
   14013906e:	call   1402d8200 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139073:	mov    %rbx,%rcx
   140139076:	call   1401effc0 <_Unwind_Resume>
   14013907b:	jmp    140138f7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1550b>
   140139080:	jmp    140138d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   140139085:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   14013908a:	jmp    140138d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   14013908f:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140139094:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139099:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   14013909e:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   1401390a3:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   1401390a8:	mov    0x680(%rsp),%rcx
   1401390b0:	mov    %rax,%rbx
   1401390b3:	lea    0x690(%rsp),%rax
   1401390bb:	cmp    %rax,%rcx
   1401390be:	je     140138ea1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15431>
   1401390c4:	mov    0x690(%rsp),%rax
   1401390cc:	lea    0x1(%rax),%rdx
   1401390d0:	vzeroupper
   1401390d3:	call   1403389b0 <operator delete(void*, unsigned long long)>
   1401390d8:	jmp    140138e8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1541e>
   1401390dd:	jmp    140138e9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1542e>
   1401390e2:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   1401390e7:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   1401390ec:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   1401390f1:	jmp    140138d4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152df>
   1401390f6:	jmp    14013900c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1559c>
   1401390fb:	jmp    140138bcc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1515c>
   140139100:	jmp    140138d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152a9>
   140139105:	nop
   140139106:	cs nopw 0x0(%rax,%rax,1)

