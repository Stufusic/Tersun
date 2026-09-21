00000001401245b0 <setun::VM::run_optimized(setun::OptimizedChunk&)>:
   1401245b0:	push   %r15
   1401245b2:	push   %r14
   1401245b4:	push   %r13
   1401245b6:	push   %r12
   1401245b8:	push   %rbp
   1401245b9:	push   %rdi
   1401245ba:	push   %rsi
   1401245bb:	push   %rbx
   1401245bc:	sub    $0x9f8,%rsp
   1401245c3:	vmovaps %xmm6,0x950(%rsp)
   1401245cc:	vmovaps %xmm7,0x960(%rsp)
   1401245d5:	vmovaps %xmm8,0x970(%rsp)
   1401245de:	vmovaps %xmm9,0x980(%rsp)
   1401245e7:	vmovaps %xmm10,0x990(%rsp)
   1401245f0:	vmovaps %xmm11,0x9a0(%rsp)
   1401245f9:	vmovaps %xmm12,0x9b0(%rsp)
   140124602:	vmovaps %xmm13,0x9c0(%rsp)
   14012460b:	vmovaps %xmm14,0x9d0(%rsp)
   140124614:	vmovaps %xmm15,0x9e0(%rsp)
   14012461d:	mov    0x8(%rdx),%rax
   140124621:	sub    (%rdx),%rax
   140124624:	mov    %rcx,%rbx
   140124627:	mov    %rdx,%r14
   14012462a:	cmp    %rax,0x1038(%rcx)
   140124631:	jb     14012463e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e>
   140124633:	movq   $0x0,0x1038(%rcx)
   14012463e:	mov    0x152c8(%rbx),%rsi
   140124645:	movb   $0x1,0x1040(%rbx)
   14012464c:	test   %rsi,%rsi
   14012464f:	je     14012465e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140124651:	cmpb   $0x0,0x152c1(%rbx)
   140124658:	jne    140125090 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae0>
   14012465e:	mov    0x58(%r14),%rbp
   140124662:	test   %rbp,%rbp
   140124665:	je     140124764 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b4>
   14012466b:	mov    0x2394be(%rip),%rdi        # 14035db30 <CSWTCH.4381+0x230>
   140124672:	lea    0x1000(%rbx),%r15
   140124679:	mov    $0x88,%ecx
   14012467e:	lea    0x8(%rbp),%r12
   140124682:	call   140339200 <operator new(unsigned long long)>
   140124687:	vpxor  %xmm3,%xmm3,%xmm3
   14012468b:	mov    %r12,%rdx
   14012468e:	mov    %rax,%rsi
   140124691:	mov    %rdi,0x8(%rax)
   140124695:	lea    0x2586a4(%rip),%rax        # 14037cd40 <vtable for std::_Sp_counted_ptr_inplace<setun::VTable, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   14012469c:	mov    %rax,(%rsi)
   14012469f:	lea    0x20(%rsi),%rax
   1401246a3:	lea    0x10(%rsi),%r13
   1401246a7:	vmovdqu %ymm3,0x10(%rsi)
   1401246ac:	mov    %r13,%rcx
   1401246af:	mov    %rax,0x10(%rsi)
   1401246b3:	lea    0x40(%rsi),%rax
   1401246b7:	vmovdqu %ymm3,0x30(%rsi)
   1401246bc:	mov    %rax,0x30(%rsi)
   1401246c0:	lea    0x80(%rsi),%rax
   1401246c7:	vmovdqu %ymm3,0x68(%rsi)
   1401246cc:	mov    %rax,0x50(%rsi)
   1401246d0:	movq   $0x1,0x58(%rsi)
   1401246d8:	movq   $0x0,0x60(%rsi)
   1401246e0:	movq   $0x3f800000,0x70(%rsi)
   1401246e8:	vzeroupper
   1401246eb:	call   1402f0820 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_assign(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   1401246f0:	lea    0x28(%rbp),%rdx
   1401246f4:	lea    0x50(%rsi),%rcx
   1401246f8:	cmp    %rdx,%rcx
   1401246fb:	je     140124702 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x152>
   1401246fd:	call   14029f930 <void std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_assign_elements<std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&>(std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> > const&)>
   140124702:	mov    %r12,%rdx
   140124705:	mov    %r15,%rcx
   140124708:	call   140321320 <std::__detail::_Map_base<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> >, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, std::shared_ptr<setun::VTable> > >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true>, true>::operator[](std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14012470d:	mov    %r13,(%rax)
   140124710:	cmp    %rsi,0x8(%rax)
   140124714:	je     14012474f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f>
   140124716:	lock addl $0x1,0x8(%rsi)
   14012471b:	mov    0x8(%rax),%r12
   14012471f:	test   %r12,%r12
   140124722:	je     14012474b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   140124724:	mov    0x8(%r12),%r8
   140124729:	lea    0x8(%r12),%rdx
   14012472e:	movabs $0x100000001,%rcx
   140124738:	cmp    %rcx,%r8
   14012473b:	je     14012b110 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b60>
   140124741:	lock subl $0x1,(%rdx)
   140124745:	je     14012b362 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6db2>
   14012474b:	mov    %rsi,0x8(%rax)
   14012474f:	mov    %rsi,%rcx
   140124752:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140124757:	mov    0x0(%rbp),%rbp
   14012475b:	test   %rbp,%rbp
   14012475e:	jne    140124679 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9>
   140124764:	mov    0x1060(%rbx),%rax
   14012476b:	mov    0x1048(%rbx),%r11
   140124772:	mov    (%r14),%r15
   140124775:	mov    0x1038(%rbx),%r12
   14012477c:	lea    (%r11,%rax,8),%r13
   140124780:	mov    0x150c0(%rbx),%rbp
   140124787:	mov    0x1050(%rbx),%rax
   14012478e:	add    %r15,%r12
   140124791:	mov    %rax,0x30(%rsp)
   140124796:	test   %rbp,%rbp
   140124799:	jne    140124800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x250>
   14012479b:	mov    0xb0(%r14),%rax
   1401247a2:	mov    $0x20,%edx
   1401247a7:	cmp    %rdx,%rax
   1401247aa:	cmovb  %rdx,%rax
   1401247ae:	cmpb   $0x0,0x29c8cb(%rip)        # 1403c1080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   1401247b5:	mov    %rax,0x15268(%rbx)
   1401247bc:	je     14012482b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27b>
   1401247be:	movabs $0xfffb000000000000,%rax
   1401247c8:	mov    %rax,0x1c8(%rsp)
   1401247d0:	mov    %rax,0x1d0(%rsp)
   1401247d8:	cmpb   $0x0,0x1040(%rbx)
   1401247df:	je     14012b13c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b8c>
   1401247e5:	mov    %r12,%rax
   1401247e8:	lea    0x29c8b1(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401247ef:	lea    0x1(%r12),%r12
   1401247f4:	xor    %esi,%esi
   1401247f6:	movzbl (%rax),%eax
   1401247f9:	mov    (%rdi,%rax,8),%rax
   1401247fd:	jmp    *%rax
   1401247ff:	nop
   140124800:	lea    0x0(%rbp,%rbp,4),%rax
   140124805:	mov    0x10a0(%rbx,%rax,8),%rbp
   14012480d:	mov    0x10b0(%rbx,%rax,8),%rdi
   140124815:	add    %rbp,%rdi
   140124818:	cmpb   $0x0,0x29c861(%rip)        # 1403c1080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   14012481f:	mov    %rdi,%rax
   140124822:	mov    %rax,0x15268(%rbx)
   140124829:	jne    1401247be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   14012482b:	lea    0x671b(%rip),%rdi        # 14012af4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x699d>
   140124832:	lea    0x678e(%rip),%rax        # 14012afc7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a17>
   140124839:	vmovq  %rdi,%xmm0
   14012483e:	lea    0x6615(%rip),%rdi        # 14012ae5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68aa>
   140124845:	lea    0x3188(%rip),%rdx        # 1401279d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3424>
   14012484c:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124852:	vmovq  %rdi,%xmm1
   140124857:	lea    0x6675(%rip),%rax        # 14012aed3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6923>
   14012485e:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140124864:	lea    0x41fa(%rip),%rdi        # 140128a65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44b5>
   14012486b:	lea    0x4237(%rip),%rax        # 140128aa9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x44f9>
   140124872:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140124878:	vmovq  %rdi,%xmm0
   14012487d:	lea    0x67bd(%rip),%rdi        # 14012b041 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a91>
   140124884:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012488a:	vmovq  %rdi,%xmm1
   14012488f:	lea    0x418b(%rip),%rax        # 140128a21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4471>
   140124896:	vmovdqu %ymm2,0xe0(%rsp)
   14012489f:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401248a5:	lea    0x43f6(%rip),%rdi        # 140128ca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46f2>
   1401248ac:	lea    0x4481(%rip),%rax        # 140128d34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4784>
   1401248b3:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   1401248b9:	vmovq  %rdi,%xmm0
   1401248be:	lea    0x4228(%rip),%rdi        # 140128aed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x453d>
   1401248c5:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401248cb:	vmovq  %rdi,%xmm1
   1401248d0:	lea    0x42bf(%rip),%rax        # 140128b96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x45e6>
   1401248d7:	vmovdqu %ymm2,0x100(%rsp)
   1401248e0:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401248e6:	lea    0x4685(%rip),%rdi        # 140128f72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x49c2>
   1401248ed:	lea    0x473a(%rip),%rax        # 14012902e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a7e>
   1401248f4:	vinserti128 $0x1,%xmm0,%ymm1,%ymm9
   1401248fa:	vmovq  %rdi,%xmm0
   1401248ff:	lea    0x44f4(%rip),%rdi        # 140128dfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x484a>
   140124906:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012490c:	vmovq  %rdi,%xmm1
   140124911:	lea    0x459e(%rip),%rax        # 140128eb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4906>
   140124918:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   14012491e:	lea    0x4dff(%rip),%rdi        # 140129724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5174>
   140124925:	lea    0x3cdf(%rip),%rax        # 14012860b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x405b>
   14012492c:	vinserti128 $0x1,%xmm0,%ymm1,%ymm10
   140124932:	vmovq  %rdi,%xmm0
   140124937:	lea    0x4854(%rip),%rdi        # 140129192 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4be2>
   14012493e:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124944:	vmovq  %rdi,%xmm1
   140124949:	lea    0x49a6(%rip),%rax        # 1401292f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d46>
   140124950:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140124956:	lea    0x3ffe(%rip),%rdi        # 14012895b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43ab>
   14012495d:	lea    0x4039(%rip),%rax        # 14012899d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43ed>
   140124964:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   14012496a:	vmovq  %rdi,%xmm0
   14012496f:	lea    0x3990(%rip),%rdi        # 140128306 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d56>
   140124976:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   14012497c:	vmovq  %rdi,%xmm1
   140124981:	lea    0x3f92(%rip),%rax        # 14012891a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x436a>
   140124988:	vmovdqu %ymm2,0x160(%rsp)
   140124991:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140124997:	lea    0x3a4e(%rip),%rdi        # 1401283ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e3c>
   14012499e:	lea    0x3b15(%rip),%rax        # 1401284ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f0a>
   1401249a5:	vinserti128 $0x1,%xmm0,%ymm1,%ymm3
   1401249ab:	vmovq  %rdi,%xmm0
   1401249b0:	lea    0x4028(%rip),%rdi        # 1401289df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x442f>
   1401249b7:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401249bd:	vmovq  %rdi,%xmm1
   1401249c2:	lea    0x39b4(%rip),%rax        # 14012837d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dcd>
   1401249c9:	vmovdqu %ymm3,0xc0(%rsp)
   1401249d2:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   1401249d8:	lea    0x4a7d(%rip),%rdi        # 14012945c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4eac>
   1401249df:	lea    0x4bda(%rip),%rax        # 1401295c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5010>
   1401249e6:	vinserti128 $0x1,%xmm0,%ymm1,%ymm11
   1401249ec:	vmovq  %rdi,%xmm0
   1401249f1:	lea    0x938(%rip),%rdi        # 140125330 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd80>
   1401249f8:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   1401249fe:	vmovq  %rdi,%xmm1
   140124a03:	lea    0xb1f(%rip),%rax        # 140125529 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf79>
   140124a0a:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140124a10:	lea    0x6317(%rip),%rdi        # 14012ad2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x677e>
   140124a17:	lea    0x5bf3(%rip),%rax        # 14012a611 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6061>
   140124a1e:	vinserti128 $0x1,%xmm0,%ymm1,%ymm2
   140124a24:	vmovq  %rdi,%xmm0
   140124a29:	lea    0x5a35(%rip),%rdi        # 14012a465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5eb5>
   140124a30:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124a36:	vmovq  %rdi,%xmm1
   140124a3b:	lea    0x5af9(%rip),%rax        # 14012a53b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f8b>
   140124a42:	vmovdqu %ymm2,0x120(%rsp)
   140124a4b:	vpinsrq $0x1,%rax,%xmm1,%xmm1
   140124a51:	lea    0x6146(%rip),%rdi        # 14012ab9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65ee>
   140124a58:	lea    0x5d5e(%rip),%rax        # 14012a7bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x620d>
   140124a5f:	vinserti128 $0x1,%xmm0,%ymm1,%ymm1
   140124a65:	vmovq  %rdi,%xmm0
   140124a6a:	lea    0x5c76(%rip),%rdi        # 14012a6e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6137>
   140124a71:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124a77:	vmovq  %rdi,%xmm2
   140124a7c:	lea    0x6348(%rip),%rax        # 14012adcb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x681b>
   140124a83:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140124a89:	lea    0x5f62(%rip),%rdi        # 14012a9f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6442>
   140124a90:	lea    0x6031(%rip),%rax        # 14012aac8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6518>
   140124a97:	vinserti128 $0x1,%xmm0,%ymm2,%ymm12
   140124a9d:	vmovq  %rdi,%xmm0
   140124aa2:	lea    0x5dea(%rip),%rdi        # 14012a893 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62e3>
   140124aa9:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124aaf:	vmovq  %rdi,%xmm2
   140124ab4:	lea    0x5e67(%rip),%rax        # 14012a922 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6372>
   140124abb:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140124ac1:	lea    0x35bc(%rip),%rdi        # 140128084 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ad4>
   140124ac8:	lea    0x513a(%rip),%rax        # 140129c09 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5659>
   140124acf:	vinserti128 $0x1,%xmm0,%ymm2,%ymm14
   140124ad5:	vmovq  %rdi,%xmm0
   140124ada:	lea    0x33f7(%rip),%rdi        # 140127ed8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3928>
   140124ae1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124ae7:	vmovq  %rdi,%xmm4
   140124aec:	lea    0x34bb(%rip),%rax        # 140127fae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39fe>
   140124af3:	vpinsrq $0x1,%rax,%xmm4,%xmm4
   140124af9:	lea    0x538b(%rip),%rdi        # 140129e8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58db>
   140124b00:	lea    0x545a(%rip),%rax        # 140129f61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59b1>
   140124b07:	vinserti128 $0x1,%xmm0,%ymm4,%ymm4
   140124b0d:	vmovq  %rdi,%xmm0
   140124b12:	lea    0x51c6(%rip),%rdi        # 140129cdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x572f>
   140124b19:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124b1f:	vmovq  %rdi,%xmm3
   140124b24:	lea    0x528a(%rip),%rax        # 140129db5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5805>
   140124b2b:	vpinsrq $0x1,%rax,%xmm3,%xmm3
   140124b31:	lea    0x56ab(%rip),%rdi        # 14012a1e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c33>
   140124b38:	lea    0x577a(%rip),%rax        # 14012a2b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d09>
   140124b3f:	vinserti128 $0x1,%xmm0,%ymm3,%ymm3
   140124b45:	vmovq  %rdi,%xmm0
   140124b4a:	lea    0x54e6(%rip),%rdi        # 14012a037 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a87>
   140124b51:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124b57:	vmovq  %rdi,%xmm2
   140124b5c:	lea    0x55aa(%rip),%rax        # 14012a10d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b5d>
   140124b63:	vpinsrq $0x1,%rax,%xmm2,%xmm2
   140124b69:	lea    0x4c6b(%rip),%rdi        # 1401297db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x522b>
   140124b70:	lea    0x4d3a(%rip),%rax        # 1401298b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5301>
   140124b77:	vinserti128 $0x1,%xmm0,%ymm2,%ymm2
   140124b7d:	vmovq  %rdi,%xmm0
   140124b82:	lea    0x35d1(%rip),%rdi        # 14012815a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3baa>
   140124b89:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124b8f:	vmovq  %rdi,%xmm5
   140124b94:	lea    0x3695(%rip),%rax        # 140128230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c80>
   140124b9b:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140124ba1:	lea    0x30ae(%rip),%rdi        # 140127c56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36a6>
   140124ba8:	lea    0x317d(%rip),%rax        # 140127d2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x377c>
   140124baf:	vinserti128 $0x1,%xmm0,%ymm5,%ymm13
   140124bb5:	vmovq  %rdi,%xmm0
   140124bba:	lea    0x2ee9(%rip),%rdi        # 140127aaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34fa>
   140124bc1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124bc7:	vmovq  %rdi,%xmm5
   140124bcc:	lea    0x2fad(%rip),%rax        # 140127b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35d0>
   140124bd3:	vpinsrq $0x1,%rax,%xmm5,%xmm5
   140124bd9:	lea    0x4e7d(%rip),%rdi        # 140129a5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54ad>
   140124be0:	lea    0x4f4c(%rip),%rax        # 140129b33 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5583>
   140124be7:	vinserti128 $0x1,%xmm0,%ymm5,%ymm5
   140124bed:	vmovq  %rdi,%xmm0
   140124bf2:	lea    0x2637(%rip),%rdi        # 140127230 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c80>
   140124bf9:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124bff:	lea    0x4d81(%rip),%rax        # 140129987 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53d7>
   140124c06:	vmovq  %rdx,%xmm0
   140124c0b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124c11:	lea    0x226c(%rip),%rdx        # 140126e84 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28d4>
   140124c18:	lea    0x270f(%rip),%rax        # 14012732e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d7e>
   140124c1f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm8
   140124c25:	vmovq  %rdi,%xmm0
   140124c2a:	lea    0x1be2(%rip),%rdi        # 140126813 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2263>
   140124c31:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124c37:	lea    0x2508(%rip),%rax        # 140127146 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b96>
   140124c3e:	vmovq  %rdx,%xmm0
   140124c43:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124c49:	lea    0x195b(%rip),%rdx        # 1401265ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ffb>
   140124c50:	lea    0x1cef(%rip),%rax        # 140126946 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2396>
   140124c57:	vinserti128 $0x1,%xmm6,%ymm0,%ymm7
   140124c5d:	vmovq  %rdi,%xmm0
   140124c62:	lea    0x1238(%rip),%rdi        # 140125ea1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18f1>
   140124c69:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124c6f:	lea    0x1a6a(%rip),%rax        # 1401266e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2130>
   140124c76:	vmovq  %rdx,%xmm0
   140124c7b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124c81:	lea    0x10ad(%rip),%rdx        # 140125d35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1785>
   140124c88:	lea    0x12c8(%rip),%rax        # 140125f57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19a7>
   140124c8f:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124c95:	vmovq  %rdi,%xmm0
   140124c9a:	lea    0x29db(%rip),%rdi        # 14012767c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30cc>
   140124ca1:	vmovdqu %ymm6,0x140(%rsp)
   140124caa:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124cb0:	lea    0x1134(%rip),%rax        # 140125deb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x183b>
   140124cb7:	vmovq  %rdx,%xmm0
   140124cbc:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124cc2:	lea    0x165b(%rip),%rdx        # 140126324 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d74>
   140124cc9:	lea    0x169b(%rip),%rax        # 14012636b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dbb>
   140124cd0:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124cd6:	vmovq  %rdi,%xmm0
   140124cdb:	lea    0x138b(%rip),%rdi        # 14012606d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1abd>
   140124ce2:	vmovdqu %ymm6,0x180(%rsp)
   140124ceb:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124cf1:	lea    0x28ae(%rip),%rax        # 1401275a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ff6>
   140124cf8:	vmovq  %rdx,%xmm0
   140124cfd:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124d03:	lea    0x1781(%rip),%rdx        # 14012648b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1edb>
   140124d0a:	lea    0x13e7(%rip),%rax        # 1401260f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b48>
   140124d11:	vinserti128 $0x1,%xmm6,%ymm0,%ymm15
   140124d17:	vmovq  %rdi,%xmm0
   140124d1c:	lea    0xf0d(%rip),%rdi        # 140125c30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1680>
   140124d23:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124d29:	lea    0x12b2(%rip),%rax        # 140125fe2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a32>
   140124d30:	vmovq  %rdx,%xmm0
   140124d35:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124d3b:	lea    0xdd4(%rip),%rdx        # 140125b16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1566>
   140124d42:	lea    0xf84(%rip),%rax        # 140125ccd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x171d>
   140124d49:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124d4f:	vmovq  %rdi,%xmm0
   140124d54:	lea    0xb1a(%rip),%rdi        # 140125875 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c5>
   140124d5b:	vmovdqu %ymm6,0x40(%rsp)
   140124d61:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124d67:	lea    0xe4a(%rip),%rax        # 140125bb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1608>
   140124d6e:	vmovq  %rdx,%xmm0
   140124d73:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124d79:	lea    0xa42(%rip),%rdx        # 1401257c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1212>
   140124d80:	lea    0xb75(%rip),%rax        # 1401258fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134c>
   140124d87:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124d8d:	vmovq  %rdi,%xmm0
   140124d92:	lea    0xc34(%rip),%rdi        # 1401259cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141d>
   140124d99:	vmovdqu %ymm6,0x60(%rsp)
   140124d9f:	vpinsrq $0x1,%rax,%xmm0,%xmm6
   140124da5:	lea    0xa38(%rip),%rax        # 1401257e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1234>
   140124dac:	vmovq  %rdx,%xmm0
   140124db1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124db7:	lea    0xc66(%rip),%rdx        # 140125a24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1474>
   140124dbe:	lea    0xcbd(%rip),%rax        # 140125a82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d2>
   140124dc5:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124dcb:	vmovq  %rdi,%xmm0
   140124dd0:	vmovdqu %ymm6,0x80(%rsp)
   140124dd9:	vmovq  %rdx,%xmm6
   140124dde:	vpinsrq $0x1,%rax,%xmm6,%xmm6
   140124de4:	lea    0x26e5(%rip),%rax        # 1401274d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f20>
   140124deb:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124df1:	lea    0x495(%rip),%rax        # 14012528d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdd>
   140124df8:	vinserti128 $0x1,%xmm6,%ymm0,%ymm6
   140124dfe:	vmovq  %rax,%xmm0
   140124e03:	lea    0x29c296(%rip),%rax        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e0a:	vmovdqu %ymm6,0xa0(%rsp)
   140124e13:	vpbroadcastq %xmm0,%ymm0
   140124e18:	lea    0x800(%rax),%rdx
   140124e1f:	nop
   140124e20:	vmovdqa %ymm0,(%rax)
   140124e24:	add    $0x40,%rax
   140124e28:	vmovdqa %ymm0,-0x20(%rax)
   140124e2d:	cmp    %rdx,%rax
   140124e30:	jne    140124e20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x870>
   140124e32:	lea    0xc77(%rip),%rax        # 140125ab0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1500>
   140124e39:	lea    0x1343(%rip),%rdi        # 140126183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1bd3>
   140124e40:	vmovdqu 0x80(%rsp),%ymm6
   140124e49:	vmovdqa %ymm5,0x29c66f(%rip)        # 1403c14c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x420>
   140124e51:	mov    %rax,0x29c288(%rip)        # 1403c10e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x40>
   140124e58:	vmovq  %rdi,%xmm0
   140124e5d:	lea    0x13aa(%rip),%rax        # 14012620e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c5e>
   140124e64:	lea    0x1c0e(%rip),%rdi        # 140126a79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x24c9>
   140124e6b:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124e71:	lea    0x1421(%rip),%rax        # 140126299 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ce9>
   140124e78:	vmovdqa %ymm6,0x29c220(%rip)        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140124e80:	vmovdqu 0xa0(%rsp),%ymm6
   140124e89:	mov    %rax,0x29c380(%rip)        # 1403c1210 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x170>
   140124e90:	lea    0x1d15(%rip),%rax        # 140126bac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25fc>
   140124e97:	vmovdqa %xmm0,0x29c361(%rip)        # 1403c1200 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x160>
   140124e9f:	vmovq  %rdi,%xmm0
   140124ea4:	lea    0x28a7(%rip),%rdi        # 140127752 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31a2>
   140124eab:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124eb1:	vmovdqa %ymm6,0x29c207(%rip)        # 1403c10c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x20>
   140124eb9:	lea    0x2968(%rip),%rax        # 140127828 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3278>
   140124ec0:	vmovdqu 0x60(%rsp),%ymm6
   140124ec6:	vmovdqa %xmm0,0x29c372(%rip)        # 1403c1240 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x1a0>
   140124ece:	vmovq  %rdi,%xmm0
   140124ed3:	lea    0x1e05(%rip),%rdi        # 140126cdf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x272f>
   140124eda:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124ee0:	lea    0x2a17(%rip),%rax        # 1401278fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x334e>
   140124ee7:	vmovdqa %ymm6,0x29c231(%rip)        # 1403c1120 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x80>
   140124eef:	vmovdqu 0x180(%rsp),%ymm6
   140124ef8:	mov    %rax,0x29c3b1(%rip)        # 1403c12b0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x210>
   140124eff:	lea    0x1e13(%rip),%rax        # 140126d19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2769>
   140124f06:	vmovdqa %xmm0,0x29c392(%rip)        # 1403c12a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x200>
   140124f0e:	vmovq  %rdi,%xmm0
   140124f13:	lea    0x376d(%rip),%rdi        # 140128687 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40d7>
   140124f1a:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124f20:	lea    0x1e6a(%rip),%rax        # 140126d91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27e1>
   140124f27:	vmovdqa %ymm6,0x29c271(%rip)        # 1403c11a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x100>
   140124f2f:	vmovdqu 0x40(%rsp),%ymm6
   140124f35:	mov    %rax,0x29c3f4(%rip)        # 1403c1330 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x290>
   140124f3c:	lea    0x24fd(%rip),%rax        # 140127440 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e90>
   140124f43:	mov    %rax,0x29c476(%rip)        # 1403c13c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x320>
   140124f4a:	lea    0x240(%rip),%rax        # 140125191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   140124f51:	mov    %rax,0x29c940(%rip)        # 1403c1898 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x7f8>
   140124f58:	lea    0x2ea3(%rip),%rax        # 140127e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3852>
   140124f5f:	vmovdqa %ymm6,0x29c279(%rip)        # 1403c11e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x140>
   140124f67:	vmovdqu 0x140(%rsp),%ymm6
   140124f70:	mov    %rax,0x29c569(%rip)        # 1403c14e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x440>
   140124f77:	lea    0x5411(%rip),%rax        # 14012a38f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ddf>
   140124f7e:	mov    %rax,0x29c5fb(%rip)        # 1403c1580 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4e0>
   140124f85:	lea    0x383a(%rip),%rax        # 1401287c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4216>
   140124f8c:	vmovdqa %xmm0,0x29c38c(%rip)        # 1403c1320 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x280>
   140124f94:	vmovq  %rdi,%xmm0
   140124f99:	vmovdqa %ymm4,0x29c57f(%rip)        # 1403c1520 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x480>
   140124fa1:	vpinsrq $0x1,%rax,%xmm0,%xmm0
   140124fa7:	lea    0x38ef(%rip),%rax        # 14012889d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x42ed>
   140124fae:	vmovdqa %ymm2,0x29c5aa(%rip)        # 1403c1560 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4c0>
   140124fb6:	vmovdqa %ymm15,0x29c202(%rip)        # 1403c11c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x120>
   140124fbe:	vmovdqa %ymm6,0x29c25a(%rip)        # 1403c1220 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x180>
   140124fc6:	vmovdqa %ymm7,0x29c3d2(%rip)        # 1403c13a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x300>
   140124fce:	vmovdqa %ymm8,0x29c44a(%rip)        # 1403c1420 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x380>
   140124fd6:	vmovdqa %ymm13,0x29c4c2(%rip)        # 1403c14a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x400>
   140124fde:	vmovdqa %ymm3,0x29c55a(%rip)        # 1403c1540 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x4a0>
   140124fe6:	vmovdqa %ymm1,0x29c5b2(%rip)        # 1403c15a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x500>
   140124fee:	vmovdqu 0xe0(%rsp),%ymm4
   140124ff7:	vmovdqu 0x100(%rsp),%ymm2
   140125000:	vmovdqu 0x160(%rsp),%ymm5
   140125009:	mov    %rax,0x29c720(%rip)        # 1403c1730 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x690>
   140125010:	vmovdqa %ymm4,0x29c608(%rip)        # 1403c1620 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x580>
   140125018:	vmovdqu 0x120(%rsp),%ymm4
   140125021:	vmovdqa %ymm2,0x29c617(%rip)        # 1403c1640 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5a0>
   140125029:	vmovdqu 0xc0(%rsp),%ymm2
   140125032:	movb   $0x1,0x29c047(%rip)        # 1403c1080 <setun::VM::run_optimized(setun::OptimizedChunk&)::inited>
   140125039:	vmovdqa %ymm12,0x29c57f(%rip)        # 1403c15c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x520>
   140125041:	vmovdqa %ymm14,0x29c597(%rip)        # 1403c15e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x540>
   140125049:	vmovdqa %xmm0,0x29c6cf(%rip)        # 1403c1720 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x680>
   140125051:	vmovdqa %ymm9,0x29c607(%rip)        # 1403c1660 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5c0>
   140125059:	vmovdqa %ymm10,0x29c61f(%rip)        # 1403c1680 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x5e0>
   140125061:	vmovdqa %ymm5,0x29c637(%rip)        # 1403c16a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x600>
   140125069:	vmovdqa %ymm2,0x29c64f(%rip)        # 1403c16c0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x620>
   140125071:	vmovdqa %ymm11,0x29c667(%rip)        # 1403c16e0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x640>
   140125079:	vmovdqa %ymm4,0x29c67f(%rip)        # 1403c1700 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table+0x660>
   140125081:	jmp    1401247be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20e>
   140125086:	cs nopw 0x0(%rax,%rax,1)
   140125090:	mov    0xd8(%rsi),%rax
   140125097:	cmp    %rax,0xe0(%rsi)
   14012509e:	jne    140125178 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc8>
   1401250a4:	mov    0x88(%r14),%rax
   1401250ab:	sub    0x80(%r14),%rax
   1401250b2:	mov    $0x80,%edx
   1401250b7:	lea    0xd8(%rsi),%rcx
   1401250be:	sar    $0x2,%rax
   1401250c2:	add    $0x10,%rax
   1401250c6:	cmp    $0x80,%rax
   1401250cc:	jbe    1401250d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb28>
   1401250ce:	xchg   %ax,%ax
   1401250d0:	add    %rdx,%rdx
   1401250d3:	cmp    %rax,%rdx
   1401250d6:	jb     1401250d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb20>
   1401250d8:	mov    0x8c(%rsi),%eax
   1401250de:	mov    0x88(%rsi),%r9d
   1401250e5:	mov    $0x80,%r8d
   1401250eb:	mov    %eax,0x28(%rsp)
   1401250ef:	mov    0x90(%rsi),%eax
   1401250f5:	mov    %eax,0x20(%rsp)
   1401250f9:	call   14019f740 <setun::ChunkRuntimeMetadata::initialize(unsigned long long, unsigned long long, unsigned int, unsigned int, unsigned int)>
   1401250fe:	vmovdqu 0xd8(%rsi),%xmm1
   140125106:	vmovdqu 0xe8(%rsi),%xmm0
   14012510e:	vpblendw $0xf,%xmm1,%xmm0,%xmm2
   140125114:	vmovq  %xmm1,%rax
   140125119:	vpextrq $0x1,%xmm0,%rcx
   14012511f:	vmovdqu %xmm2,0x152d8(%rbx)
   140125127:	mov    0xe0(%rsi),%rdx
   14012512e:	sub    %rax,%rdx
   140125131:	mov    0xf8(%rsi),%rax
   140125138:	sar    $0x5,%rdx
   14012513c:	sub    %rcx,%rax
   14012513f:	mov    %rdx,0x152e8(%rbx)
   140125146:	sar    $0x5,%rax
   14012514a:	cmp    $0x1,%rdx
   14012514e:	adc    $0xffffffffffffffff,%rdx
   140125152:	cmp    $0x1,%rax
   140125156:	mov    %rax,0x152f0(%rbx)
   14012515d:	adc    $0xffffffffffffffff,%rax
   140125161:	mov    %rdx,0x152f8(%rbx)
   140125168:	mov    %rax,0x15300(%rbx)
   14012516f:	jmp    14012465e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae>
   140125174:	nopl   0x0(%rax)
   140125178:	mov    0xf0(%rsi),%rax
   14012517f:	cmp    %rax,0xf8(%rsi)
   140125186:	jne    1401250fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb4e>
   14012518c:	jmp    1401250a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf4>
   140125191:	movb   $0x0,0x1040(%rbx)
   140125198:	mov    0x1048(%rbx),%r11
   14012519f:	vzeroupper
   1401251a2:	cmp    $0x2,%sil
   1401251a6:	jne    14012b0d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b20>
   1401251ac:	lea    0x10(%r13),%rax
   1401251b0:	cmp    0x30(%rsp),%rax
   1401251b5:	jae    14012dd06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9756>
   1401251bb:	mov    0x1050(%rbx),%rax
   1401251c2:	mov    0x1d0(%rsp),%rcx
   1401251ca:	mov    %r13,%rdx
   1401251cd:	lea    0x10(%r13),%r13
   1401251d1:	mov    %rcx,-0x10(%r13)
   1401251d5:	mov    0x1c8(%rsp),%rcx
   1401251dd:	mov    %rcx,0x8(%rdx)
   1401251e1:	sub    %r11,%r13
   1401251e4:	sub    %r15,%r12
   1401251e7:	sub    %r11,%rax
   1401251ea:	mov    %r13,%rsi
   1401251ed:	mov    %r12,0x1038(%rbx)
   1401251f4:	sar    $0x3,%rsi
   1401251f8:	cmp    %r13,%rax
   1401251fb:	jb     14012b0e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b38>
   140125201:	vmovdqa 0x2388b7(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140125209:	mov    %rsi,0x1060(%rbx)
   140125210:	movb   $0x0,0x153a0(%rbx)
   140125217:	vmovdqa %xmm0,0x15390(%rbx)
   14012521f:	vmovaps 0x950(%rsp),%xmm6
   140125228:	vmovaps 0x960(%rsp),%xmm7
   140125231:	vmovaps 0x970(%rsp),%xmm8
   14012523a:	vmovaps 0x980(%rsp),%xmm9
   140125243:	vmovaps 0x990(%rsp),%xmm10
   14012524c:	vmovaps 0x9a0(%rsp),%xmm11
   140125255:	vmovaps 0x9b0(%rsp),%xmm12
   14012525e:	vmovaps 0x9c0(%rsp),%xmm13
   140125267:	vmovaps 0x9d0(%rsp),%xmm14
   140125270:	vmovaps 0x9e0(%rsp),%xmm15
   140125279:	add    $0x9f8,%rsp
   140125280:	pop    %rbx
   140125281:	pop    %rsi
   140125282:	pop    %rdi
   140125283:	pop    %rbp
   140125284:	pop    %r12
   140125286:	pop    %r13
   140125288:	pop    %r14
   14012528a:	pop    %r15
   14012528c:	ret
   14012528d:	cmp    $0x2,%sil
   140125291:	je     14012c1f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c49>
   140125297:	cmp    $0x1,%sil
   14012529b:	jne    140136f22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12972>
   1401252a1:	mov    0x1048(%rbx),%r11
   1401252a8:	lea    0x8(%r13),%rax
   1401252ac:	cmp    0x30(%rsp),%rax
   1401252b1:	jae    140132b50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5a0>
   1401252b7:	mov    0x1050(%rbx),%rax
   1401252be:	vzeroupper
   1401252c1:	mov    0x1c8(%rsp),%rcx
   1401252c9:	mov    %r13,%rdx
   1401252cc:	lea    0x8(%r13),%r13
   1401252d0:	mov    %rcx,(%rdx)
   1401252d3:	sub    %r11,%r13
   1401252d6:	sub    %r15,%r12
   1401252d9:	sub    %r11,%rax
   1401252dc:	mov    %r13,%rsi
   1401252df:	mov    %r12,0x1038(%rbx)
   1401252e6:	sar    $0x3,%rsi
   1401252ea:	cmp    %r13,%rax
   1401252ed:	jae    1401252ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4f>
   1401252ef:	lea    (%rsi,%rsi,1),%rdx
   1401252f3:	lea    0x1048(%rbx),%rcx
   1401252fa:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401252ff:	vmovdqa 0x2387b9(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140125307:	mov    %rsi,0x1060(%rbx)
   14012530e:	movb   $0x0,0x153a0(%rbx)
   140125315:	mov    0x1038(%rbx),%rcx
   14012531c:	vmovdqa %xmm0,0x15390(%rbx)
   140125324:	call   14033f54e <setun::cold_throw_unknown_opcode(unsigned long long)>
   140125329:	nopl   0x0(%rax)
   140125330:	mov    %r12,%rdi
   140125333:	movzwl (%r12),%r10d
   140125338:	lea    0x8(%r12),%r12
   14012533d:	movzwl -0x6(%r12),%r8d
   140125343:	movzwl 0x6(%rdi),%edx
   140125347:	movzwl -0x4(%r12),%eax
   14012534d:	lea    (%rdx,%rbp,1),%rcx
   140125351:	mov    %rcx,0x40(%rsp)
   140125356:	cmp    0x15268(%rbx),%rcx
   14012535d:	jae    14013142a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce7a>
   140125363:	vzeroupper
   140125366:	mov    0x1070(%rbx),%rcx
   14012536d:	sub    0x1068(%rbx),%rcx
   140125374:	sar    $0x3,%rcx
   140125378:	cmp    %rcx,0x40(%rsp)
   14012537d:	jae    140130f44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc994>
   140125383:	mov    0x1068(%rbx),%rdx
   14012538a:	movzwl %r10w,%ecx
   14012538e:	movzwl %ax,%eax
   140125391:	add    %rbp,%rcx
   140125394:	add    %rbp,%rax
   140125397:	lea    (%rdx,%rcx,8),%r10
   14012539b:	movzwl %r8w,%ecx
   14012539f:	lea    (%rdx,%rax,8),%r9
   1401253a3:	add    %rbp,%rcx
   1401253a6:	mov    (%r10),%rax
   1401253a9:	lea    (%rdx,%rcx,8),%r11
   1401253ad:	movabs $0xfff7ffffffffffff,%rdx
   1401253b7:	cmp    %rax,%rdx
   1401253ba:	jae    1401254a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef1>
   1401253c0:	movabs $0xfffc000000000000,%rdx
   1401253ca:	cmp    %rdx,%rax
   1401253cd:	je     1401254a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef1>
   1401253d3:	movabs $0xffffffff00000000,%rdx
   1401253dd:	and    %rdx,%rax
   1401253e0:	movabs $0xfffd000100000000,%rdx
   1401253ea:	cmp    %rdx,%rax
   1401253ed:	je     1401321d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc29>
   1401253f3:	movabs $0xffffffff00000000,%rdx
   1401253fd:	mov    (%r11),%rax
   140125400:	movabs $0xfffd000100000000,%rcx
   14012540a:	and    %rdx,%rax
   14012540d:	cmp    %rcx,%rax
   140125410:	je     1401321d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc29>
   140125416:	and    (%r9),%rdx
   140125419:	cmp    %rcx,%rdx
   14012541c:	je     1401321d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc29>
   140125422:	mov    %r9,%rcx
   140125425:	mov    %r10,0x80(%rsp)
   14012542d:	mov    %r11,0x60(%rsp)
   140125432:	call   14021ca10 <setun::VMValue::as_float() const>
   140125437:	mov    0x60(%rsp),%rcx
   14012543c:	vmovapd %xmm0,%xmm6
   140125440:	call   14021ca10 <setun::VMValue::as_float() const>
   140125445:	mov    0x80(%rsp),%rcx
   14012544d:	vmovapd %xmm0,%xmm7
   140125451:	call   14021ca10 <setun::VMValue::as_float() const>
   140125456:	vfmadd132sd %xmm7,%xmm6,%xmm0
   14012545b:	vucomisd %xmm0,%xmm0
   14012545f:	vmovq  %xmm0,%rcx
   140125464:	movabs $0xfffc000000000000,%rax
   14012546e:	mov    0x1068(%rbx),%rdx
   140125475:	cmovnp %rcx,%rax
   140125479:	mov    0x40(%rsp),%rcx
   14012547e:	mov    %rax,(%rdx,%rcx,8)
   140125482:	cmpb   $0x0,0x1040(%rbx)
   140125489:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012548f:	movzbl 0x8(%rdi),%eax
   140125493:	lea    0x9(%rdi),%r12
   140125497:	lea    0x29bc02(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012549e:	jmp    *(%rdi,%rax,8)
   1401254a1:	movabs $0xfff7ffffffffffff,%rdx
   1401254ab:	mov    (%r11),%rax
   1401254ae:	cmp    %rax,%rdx
   1401254b1:	jae    1401254c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf16>
   1401254b3:	movabs $0xfffc000000000000,%rdx
   1401254bd:	cmp    %rdx,%rax
   1401254c0:	jne    1401253f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe43>
   1401254c6:	movabs $0xfff7ffffffffffff,%rdx
   1401254d0:	mov    (%r9),%rax
   1401254d3:	cmp    %rax,%rdx
   1401254d6:	jae    1401254eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3b>
   1401254d8:	movabs $0xfffc000000000000,%rdx
   1401254e2:	cmp    %rdx,%rax
   1401254e5:	jne    1401253f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe43>
   1401254eb:	mov    %r9,%rcx
   1401254ee:	mov    %r10,0x80(%rsp)
   1401254f6:	mov    %r11,0x60(%rsp)
   1401254fb:	call   14021ca10 <setun::VMValue::as_float() const>
   140125500:	mov    0x60(%rsp),%rcx
   140125505:	vmovapd %xmm0,%xmm7
   140125509:	call   14021ca10 <setun::VMValue::as_float() const>
   14012550e:	mov    0x80(%rsp),%rcx
   140125516:	vmovapd %xmm0,%xmm6
   14012551a:	call   14021ca10 <setun::VMValue::as_float() const>
   14012551f:	vfmadd132sd %xmm6,%xmm7,%xmm0
   140125524:	jmp    14012545b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeab>
   140125529:	mov    %r12,%rdi
   14012552c:	movzwl (%r12),%r9d
   140125531:	lea    0x8(%r12),%r12
   140125536:	movzwl -0x6(%r12),%r8d
   14012553c:	movzwl 0x6(%rdi),%edx
   140125540:	movzwl -0x4(%r12),%eax
   140125546:	lea    (%rdx,%rbp,1),%rcx
   14012554a:	mov    %rcx,0x60(%rsp)
   14012554f:	cmp    0x15268(%rbx),%rcx
   140125556:	jae    1401315e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd034>
   14012555c:	vzeroupper
   14012555f:	mov    0x1070(%rbx),%rcx
   140125566:	sub    0x1068(%rbx),%rcx
   14012556d:	sar    $0x3,%rcx
   140125571:	cmp    %rcx,0x60(%rsp)
   140125576:	jae    14013102a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca7a>
   14012557c:	mov    0x1068(%rbx),%rdx
   140125583:	movzwl %r9w,%ecx
   140125587:	movzwl %ax,%eax
   14012558a:	movzwl %r8w,%r8d
   14012558e:	add    %rbp,%rcx
   140125591:	add    %rbp,%rax
   140125594:	add    %rbp,%r8
   140125597:	lea    (%rdx,%rax,8),%rax
   14012559b:	lea    (%rdx,%rcx,8),%rcx
   14012559f:	mov    %rax,0x40(%rsp)
   1401255a4:	mov    (%rcx),%rax
   1401255a7:	lea    (%rdx,%r8,8),%r9
   1401255ab:	movabs $0xffff000000000000,%rdx
   1401255b5:	and    %rax,%rdx
   1401255b8:	mov    %rdx,%r8
   1401255bb:	movabs $0xfffd000000000000,%rdx
   1401255c5:	cmp    %rdx,%r8
   1401255c8:	je     14012bdcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x781f>
   1401255ce:	movabs $0xfff8000000000000,%rax
   1401255d8:	cmp    %rax,%r8
   1401255db:	je     14012bde7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7837>
   1401255e1:	mov    %r9,0xa0(%rsp)
   1401255e9:	call   14021ca10 <setun::VMValue::as_float() const>
   1401255ee:	vcvttsd2si %xmm0,%rax
   1401255f3:	mov    %rax,0x420(%rsp)
   1401255fb:	lea    0x420(%rsp),%rax
   140125603:	mov    0xa0(%rsp),%r9
   14012560b:	movq   $0x0,0x428(%rsp)
   140125617:	movq   $0x0,0x430(%rsp)
   140125623:	mov    %rax,0x80(%rsp)
   14012562b:	movabs $0xffff000000000000,%rax
   140125635:	mov    (%r9),%rdx
   140125638:	movabs $0xfffd000000000000,%rcx
   140125642:	and    %rdx,%rax
   140125645:	cmp    %rcx,%rax
   140125648:	je     14012dfb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a01>
   14012564e:	movabs $0xfff8000000000000,%rdx
   140125658:	cmp    %rdx,%rax
   14012565b:	je     14012dfc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a19>
   140125661:	mov    %r9,%rcx
   140125664:	call   14021ca10 <setun::VMValue::as_float() const>
   140125669:	lea    0x440(%rsp),%r8
   140125671:	movq   $0x0,0x448(%rsp)
   14012567d:	vcvttsd2si %xmm0,%rax
   140125682:	movq   $0x0,0x450(%rsp)
   14012568e:	mov    %rax,0x440(%rsp)
   140125696:	movabs $0xfffd000000000000,%rcx
   1401256a0:	mov    0x40(%rsp),%rax
   1401256a5:	mov    (%rax),%rdx
   1401256a8:	movabs $0xffff000000000000,%rax
   1401256b2:	and    %rdx,%rax
   1401256b5:	cmp    %rcx,%rax
   1401256b8:	je     14012dffe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a4e>
   1401256be:	movabs $0xfff8000000000000,%rdx
   1401256c8:	cmp    %rdx,%rax
   1401256cb:	je     14012e016 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a66>
   1401256d1:	mov    0x40(%rsp),%rcx
   1401256d6:	mov    %r8,0xc0(%rsp)
   1401256de:	call   14021ca10 <setun::VMValue::as_float() const>
   1401256e3:	vcvttsd2si %xmm0,%rax
   1401256e8:	mov    %rax,0x460(%rsp)
   1401256f0:	lea    0x460(%rsp),%rax
   1401256f8:	mov    0xc0(%rsp),%r8
   140125700:	movq   $0x0,0x468(%rsp)
   14012570c:	movq   $0x0,0x470(%rsp)
   140125718:	mov    %rax,0xa0(%rsp)
   140125720:	lea    0x710(%rsp),%rax
   140125728:	mov    0x80(%rsp),%rdx
   140125730:	mov    %rax,%rcx
   140125733:	mov    %rax,0x40(%rsp)
   140125738:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012573d:	mov    0x40(%rsp),%r8
   140125742:	mov    0xa0(%rsp),%rdx
   14012574a:	lea    0x4e0(%rsp),%rcx
   140125752:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140125757:	mov    0x4f0(%rsp),%rax
   14012575f:	vmovdqa 0x4e0(%rsp),%xmm5
   140125768:	lea    0x1a0(%rsp),%rdx
   140125770:	mov    0x40(%rsp),%rcx
   140125775:	mov    %rax,0x1b0(%rsp)
   14012577d:	vmovdqa %xmm5,0x1a0(%rsp)
   140125786:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012578b:	mov    0x1068(%rbx),%rax
   140125792:	mov    0x60(%rsp),%rcx
   140125797:	mov    0x710(%rsp),%rdx
   14012579f:	mov    %rdx,(%rax,%rcx,8)
   1401257a3:	cmpb   $0x0,0x1040(%rbx)
   1401257aa:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401257b0:	movzbl 0x8(%rdi),%eax
   1401257b4:	lea    0x9(%rdi),%r12
   1401257b8:	lea    0x29b8e1(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401257bf:	jmp    *(%rdi,%rax,8)
   1401257c2:	cmpb   $0x0,0x1040(%rbx)
   1401257c9:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   1401257cf:	mov    %r12,%rax
   1401257d2:	lea    0x29b8c7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401257d9:	lea    0x1(%r12),%r12
   1401257de:	movzbl (%rax),%eax
   1401257e1:	jmp    *(%rdi,%rax,8)
   1401257e4:	mov    (%r12),%rdi
   1401257e8:	add    $0x8,%r12
   1401257ec:	test   %sil,%sil
   1401257ef:	je     14012c732 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8182>
   1401257f5:	cmp    $0x1,%sil
   1401257f9:	je     14012f73a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb18a>
   1401257ff:	lea    0x8(%r13),%rax
   140125803:	cmp    0x30(%rsp),%rax
   140125808:	jae    140132edb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe92b>
   14012580e:	vzeroupper
   140125811:	mov    0x1d0(%rsp),%rdx
   140125819:	mov    %r13,%rax
   14012581c:	lea    0x710(%rsp),%rcx
   140125824:	lea    0x8(%r13),%r13
   140125828:	mov    %rdx,(%rax)
   14012582b:	mov    0x1c8(%rsp),%rax
   140125833:	mov    %rdi,%rdx
   140125836:	mov    %rax,0x1d0(%rsp)
   14012583e:	call   140210640 <setun::VMValue::VMValue(long long)>
   140125843:	mov    0x710(%rsp),%rax
   14012584b:	mov    %rax,0x1c8(%rsp)
   140125853:	cmpb   $0x0,0x1040(%rbx)
   14012585a:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140125860:	mov    %r12,%rax
   140125863:	lea    0x29b836(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012586a:	lea    0x1(%r12),%r12
   14012586f:	movzbl (%rax),%eax
   140125872:	jmp    *(%rdi,%rax,8)
   140125875:	movzwl (%r12),%edi
   14012587a:	add    $0x2,%r12
   14012587e:	test   %sil,%sil
   140125881:	je     14012b29d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ced>
   140125887:	cmp    $0x1,%sil
   14012588b:	je     14012f3b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae04>
   140125891:	lea    0x8(%r13),%rax
   140125895:	cmp    0x30(%rsp),%rax
   14012589a:	jae    140133223 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec73>
   1401258a0:	mov    0x1d0(%rsp),%rdx
   1401258a8:	mov    %r13,%rax
   1401258ab:	lea    0x8(%r13),%r13
   1401258af:	mov    %rdx,(%rax)
   1401258b2:	mov    0x1c8(%rsp),%rax
   1401258ba:	movabs $0xfff9000000000000,%rdx
   1401258c4:	mov    %rax,0x1d0(%rsp)
   1401258cc:	movzwl %di,%eax
   1401258cf:	or     %rdx,%rax
   1401258d2:	mov    %rax,0x1c8(%rsp)
   1401258da:	cmpb   $0x0,0x1040(%rbx)
   1401258e1:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   1401258e7:	mov    %r12,%rax
   1401258ea:	lea    0x29b7af(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401258f1:	lea    0x1(%r12),%r12
   1401258f6:	movzbl (%rax),%eax
   1401258f9:	jmp    *(%rdi,%rax,8)
   1401258fc:	vmovdqu (%r12),%xmm0
   140125902:	mov    0x10(%r12),%edi
   140125907:	add    $0x14,%r12
   14012590b:	test   %sil,%sil
   14012590e:	je     14012bdf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7849>
   140125914:	cmp    $0x1,%sil
   140125918:	je     14012f6c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb114>
   14012591e:	lea    0x8(%r13),%rax
   140125922:	cmp    0x30(%rsp),%rax
   140125927:	jae    140132dd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe824>
   14012592d:	vzeroupper
   140125930:	mov    0x1d0(%rsp),%rdx
   140125938:	mov    %r13,%rax
   14012593b:	lea    0x540(%rsp),%rcx
   140125943:	lea    0x8(%r13),%r13
   140125947:	mov    %rdx,(%rax)
   14012594a:	mov    0x1c8(%rsp),%rax
   140125952:	lea    0x1a0(%rsp),%rdx
   14012595a:	mov    %edi,0x720(%rsp)
   140125961:	mov    %rax,0x1d0(%rsp)
   140125969:	movl   $0x0,0x724(%rsp)
   140125974:	mov    0x720(%rsp),%rax
   14012597c:	vmovdqa %xmm0,0x710(%rsp)
   140125985:	mov    %rax,0x1b0(%rsp)
   14012598d:	vmovdqa %xmm0,0x1a0(%rsp)
   140125996:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012599b:	mov    0x540(%rsp),%rax
   1401259a3:	mov    %rax,0x1c8(%rsp)
   1401259ab:	cmpb   $0x0,0x1040(%rbx)
   1401259b2:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401259b8:	mov    %r12,%rax
   1401259bb:	lea    0x29b6de(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401259c2:	lea    0x1(%r12),%r12
   1401259c7:	movzbl (%rax),%eax
   1401259ca:	jmp    *(%rdi,%rax,8)
   1401259cd:	mov    (%r12),%rdi
   1401259d1:	add    $0x8,%r12
   1401259d5:	test   %sil,%sil
   1401259d8:	jne    14012b246 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c96>
   1401259de:	vmovq  %rdi,%xmm0
   1401259e3:	mov    $0x1,%esi
   1401259e8:	movabs $0xfffc000000000000,%rax
   1401259f2:	vucomisd %xmm0,%xmm0
   1401259f6:	cmovnp %rdi,%rax
   1401259fa:	mov    %rax,0x1c8(%rsp)
   140125a02:	cmpb   $0x0,0x1040(%rbx)
   140125a09:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125a0f:	mov    %r12,%rax
   140125a12:	lea    0x29b687(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a19:	lea    0x1(%r12),%r12
   140125a1e:	movzbl (%rax),%eax
   140125a21:	jmp    *(%rdi,%rax,8)
   140125a24:	mov    %r12,%rax
   140125a27:	lea    0x1(%r12),%r12
   140125a2c:	movzbl (%rax),%edi
   140125a2f:	test   %sil,%sil
   140125a32:	jne    14012b307 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d57>
   140125a38:	movabs $0xfffa000000000000,%rax
   140125a42:	test   %dil,%dil
   140125a45:	mov    $0x1,%esi
   140125a4a:	movabs $0xfffa000000000001,%rdx
   140125a54:	cmovne %rdx,%rax
   140125a58:	mov    %rax,0x1c8(%rsp)
   140125a60:	cmpb   $0x0,0x1040(%rbx)
   140125a67:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125a6d:	mov    %r12,%rax
   140125a70:	lea    0x29b629(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125a77:	lea    0x1(%r12),%r12
   140125a7c:	movzbl (%rax),%eax
   140125a7f:	jmp    *(%rdi,%rax,8)
   140125a82:	cmp    $0x1,%sil
   140125a86:	jne    140131808 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd258>
   140125a8c:	xor    %esi,%esi
   140125a8e:	cmpb   $0x0,0x1040(%rbx)
   140125a95:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125a9b:	mov    %r12,%rax
   140125a9e:	lea    0x29b5fb(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125aa5:	lea    0x1(%r12),%r12
   140125aaa:	movzbl (%rax),%eax
   140125aad:	jmp    *(%rdi,%rax,8)
   140125ab0:	test   %sil,%sil
   140125ab3:	je     14012b2f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d41>
   140125ab9:	cmp    $0x1,%sil
   140125abd:	je     14012f40c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae5c>
   140125ac3:	lea    0x8(%r13),%rax
   140125ac7:	cmp    0x30(%rsp),%rax
   140125acc:	jae    1401330ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb1e>
   140125ad2:	mov    0x1d0(%rsp),%rdx
   140125ada:	mov    %r13,%rax
   140125add:	lea    0x8(%r13),%r13
   140125ae1:	mov    %rdx,(%rax)
   140125ae4:	mov    0x1c8(%rsp),%rax
   140125aec:	mov    %rax,0x1d0(%rsp)
   140125af4:	cmpb   $0x0,0x1040(%rbx)
   140125afb:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125b01:	mov    %r12,%rax
   140125b04:	lea    0x29b595(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125b0b:	lea    0x1(%r12),%r12
   140125b10:	movzbl (%rax),%eax
   140125b13:	jmp    *(%rdi,%rax,8)
   140125b16:	mov    %r12,%rax
   140125b19:	lea    0x2(%r12),%r12
   140125b1e:	movzwl (%rax),%edi
   140125b21:	mov    0x1070(%rbx),%rax
   140125b28:	sub    0x1068(%rbx),%rax
   140125b2f:	add    %rbp,%rdi
   140125b32:	sar    $0x3,%rax
   140125b36:	cmp    %rax,%rdi
   140125b39:	jae    14013155c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfac>
   140125b3f:	test   %sil,%sil
   140125b42:	je     14012b1d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c20>
   140125b48:	cmp    $0x1,%sil
   140125b4c:	je     14012f426 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae76>
   140125b52:	lea    0x8(%r13),%rax
   140125b56:	cmp    0x30(%rsp),%rax
   140125b5b:	jae    140133bd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf621>
   140125b61:	mov    0x1d0(%rsp),%rdx
   140125b69:	mov    %r13,%rax
   140125b6c:	lea    0x8(%r13),%r13
   140125b70:	mov    %rdx,(%rax)
   140125b73:	mov    0x1c8(%rsp),%rax
   140125b7b:	mov    %rax,0x1d0(%rsp)
   140125b83:	mov    0x1068(%rbx),%rax
   140125b8a:	mov    (%rax,%rdi,8),%rax
   140125b8e:	mov    %rax,0x1c8(%rsp)
   140125b96:	cmpb   $0x0,0x1040(%rbx)
   140125b9d:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125ba3:	mov    %r12,%rax
   140125ba6:	lea    0x29b4f3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125bad:	lea    0x1(%r12),%r12
   140125bb2:	movzbl (%rax),%eax
   140125bb5:	jmp    *(%rdi,%rax,8)
   140125bb8:	mov    %r12,%r8
   140125bbb:	lea    0x2(%r12),%r12
   140125bc0:	movzwl (%r8),%edi
   140125bc4:	add    %rbp,%rdi
   140125bc7:	cmp    0x15268(%rbx),%rdi
   140125bce:	jae    1401317b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd207>
   140125bd4:	mov    0x1070(%rbx),%rax
   140125bdb:	sub    0x1068(%rbx),%rax
   140125be2:	sar    $0x3,%rax
   140125be6:	cmp    %rax,%rdi
   140125be9:	jae    140131795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1e5>
   140125bef:	lea    -0x8(%r13),%rdx
   140125bf3:	lea    0x1c8(%rsp),%rax
   140125bfb:	test   %sil,%sil
   140125bfe:	cmove  %rdx,%rax
   140125c02:	mov    0x1068(%rbx),%rdx
   140125c09:	mov    (%rax),%rax
   140125c0c:	mov    %rax,(%rdx,%rdi,8)
   140125c10:	cmpb   $0x0,0x1040(%rbx)
   140125c17:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125c1d:	movzbl 0x2(%r8),%eax
   140125c22:	lea    0x29b477(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125c29:	lea    0x3(%r8),%r12
   140125c2d:	jmp    *(%rdi,%rax,8)
   140125c30:	movzwl (%r12),%edi
   140125c35:	mov    0x1088(%rbx),%rax
   140125c3c:	add    $0x2,%r12
   140125c40:	sub    0x1080(%rbx),%rax
   140125c47:	sar    $0x3,%rax
   140125c4b:	cmp    %rax,%rdi
   140125c4e:	jae    1401310c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb18>
   140125c54:	test   %sil,%sil
   140125c57:	je     14012b20b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c5b>
   140125c5d:	cmp    $0x1,%sil
   140125c61:	je     14012f51e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf6e>
   140125c67:	lea    0x8(%r13),%rax
   140125c6b:	cmp    0x30(%rsp),%rax
   140125c70:	jae    140133aeb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf53b>
   140125c76:	mov    0x1d0(%rsp),%rdx
   140125c7e:	mov    %r13,%rax
   140125c81:	lea    0x8(%r13),%r13
   140125c85:	mov    %rdx,(%rax)
   140125c88:	mov    0x1c8(%rsp),%rax
   140125c90:	mov    %rax,0x1d0(%rsp)
   140125c98:	mov    0x1080(%rbx),%rax
   140125c9f:	mov    (%rax,%rdi,8),%rax
   140125ca3:	mov    %rax,0x1c8(%rsp)
   140125cab:	cmpb   $0x0,0x1040(%rbx)
   140125cb2:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125cb8:	mov    %r12,%rax
   140125cbb:	lea    0x29b3de(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125cc2:	lea    0x1(%r12),%r12
   140125cc7:	movzbl (%rax),%eax
   140125cca:	jmp    *(%rdi,%rax,8)
   140125ccd:	movzwl (%r12),%r8d
   140125cd2:	mov    0x1088(%rbx),%rax
   140125cd9:	mov    %r12,%rdi
   140125cdc:	lea    0x2(%r12),%r12
   140125ce1:	sub    0x1080(%rbx),%rax
   140125ce8:	sar    $0x3,%rax
   140125cec:	cmp    %rax,%r8
   140125cef:	jae    140131008 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca58>
   140125cf5:	lea    -0x8(%r13),%rdx
   140125cf9:	lea    0x1c8(%rsp),%rax
   140125d01:	test   %sil,%sil
   140125d04:	cmove  %rdx,%rax
   140125d08:	mov    0x1080(%rbx),%rdx
   140125d0f:	mov    (%rax),%rax
   140125d12:	mov    %rax,(%rdx,%r8,8)
   140125d16:	cmpb   $0x0,0x1040(%rbx)
   140125d1d:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140125d23:	movzbl 0x2(%rdi),%eax
   140125d27:	lea    0x3(%rdi),%r12
   140125d2b:	lea    0x29b36e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125d32:	jmp    *(%rdi,%rax,8)
   140125d35:	movabs $0xfffb000000000000,%rax
   140125d3f:	mov    %rax,0x1d8(%rsp)
   140125d47:	mov    %rax,0x1e0(%rsp)
   140125d4f:	cmp    $0x2,%sil
   140125d53:	jne    140130fac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9fc>
   140125d59:	mov    0x1c8(%rsp),%rax
   140125d61:	mov    %rax,0x1e0(%rsp)
   140125d69:	mov    0x1d0(%rsp),%rax
   140125d71:	mov    %rax,0x1d8(%rsp)
   140125d79:	mov    $0x1,%esi
   140125d7e:	mov    0x1d8(%rsp),%rax
   140125d86:	movabs $0xffff000000000000,%rdx
   140125d90:	movabs $0xfff8000000000000,%r8
   140125d9a:	mov    %rax,%rcx
   140125d9d:	and    %rdx,%rcx
   140125da0:	cmp    %r8,%rcx
   140125da3:	je     14012c638 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8088>
   140125da9:	lea    0x1e0(%rsp),%rdx
   140125db1:	lea    0x1d8(%rsp),%rcx
   140125db9:	vzeroupper
   140125dbc:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   140125dc1:	mov    %rax,0x1c8(%rsp)
   140125dc9:	cmpb   $0x0,0x1040(%rbx)
   140125dd0:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140125dd6:	mov    %r12,%rax
   140125dd9:	lea    0x29b2c0(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125de0:	lea    0x1(%r12),%r12
   140125de5:	movzbl (%rax),%eax
   140125de8:	jmp    *(%rdi,%rax,8)
   140125deb:	movabs $0xfffb000000000000,%rax
   140125df5:	mov    %rax,0x1e8(%rsp)
   140125dfd:	mov    %rax,0x1f0(%rsp)
   140125e05:	cmp    $0x2,%sil
   140125e09:	jne    140131372 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdc2>
   140125e0f:	mov    0x1c8(%rsp),%rax
   140125e17:	mov    %rax,0x1f0(%rsp)
   140125e1f:	mov    0x1d0(%rsp),%rax
   140125e27:	mov    %rax,0x1e8(%rsp)
   140125e2f:	mov    $0x1,%esi
   140125e34:	mov    0x1e8(%rsp),%rax
   140125e3c:	movabs $0xffff000000000000,%rdx
   140125e46:	movabs $0xfff8000000000000,%r8
   140125e50:	mov    %rax,%rcx
   140125e53:	and    %rdx,%rcx
   140125e56:	cmp    %r8,%rcx
   140125e59:	je     14012b8d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7324>
   140125e5f:	lea    0x1f0(%rsp),%rdx
   140125e67:	lea    0x1e8(%rsp),%rcx
   140125e6f:	vzeroupper
   140125e72:	call   14021afe0 <setun::VMValue::sub(setun::VMValue const&) const>
   140125e77:	mov    %rax,0x1c8(%rsp)
   140125e7f:	cmpb   $0x0,0x1040(%rbx)
   140125e86:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140125e8c:	mov    %r12,%rax
   140125e8f:	lea    0x29b20a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125e96:	lea    0x1(%r12),%r12
   140125e9b:	movzbl (%rax),%eax
   140125e9e:	jmp    *(%rdi,%rax,8)
   140125ea1:	movabs $0xfffb000000000000,%rax
   140125eab:	mov    %rax,0x1f8(%rsp)
   140125eb3:	mov    %rax,0x200(%rsp)
   140125ebb:	cmp    $0x2,%sil
   140125ebf:	jne    140130fda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xca2a>
   140125ec5:	mov    0x1c8(%rsp),%rax
   140125ecd:	mov    %rax,0x200(%rsp)
   140125ed5:	mov    0x1d0(%rsp),%rax
   140125edd:	mov    %rax,0x1f8(%rsp)
   140125ee5:	mov    $0x1,%esi
   140125eea:	mov    0x1f8(%rsp),%rax
   140125ef2:	movabs $0xffff000000000000,%rdx
   140125efc:	movabs $0xfff8000000000000,%r8
   140125f06:	mov    %rax,%rcx
   140125f09:	and    %rdx,%rcx
   140125f0c:	cmp    %r8,%rcx
   140125f0f:	je     14012c23d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c8d>
   140125f15:	lea    0x200(%rsp),%rdx
   140125f1d:	lea    0x1f8(%rsp),%rcx
   140125f25:	vzeroupper
   140125f28:	call   14021a760 <setun::VMValue::mul(setun::VMValue const&) const>
   140125f2d:	mov    %rax,0x1c8(%rsp)
   140125f35:	cmpb   $0x0,0x1040(%rbx)
   140125f3c:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140125f42:	mov    %r12,%rax
   140125f45:	lea    0x29b154(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125f4c:	lea    0x1(%r12),%r12
   140125f51:	movzbl (%rax),%eax
   140125f54:	jmp    *(%rdi,%rax,8)
   140125f57:	movabs $0xfffb000000000000,%rax
   140125f61:	mov    %rax,0x208(%rsp)
   140125f69:	mov    %rax,0x210(%rsp)
   140125f71:	cmp    $0x2,%sil
   140125f75:	jne    1401312ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd3c>
   140125f7b:	mov    0x1c8(%rsp),%rax
   140125f83:	mov    %rax,0x210(%rsp)
   140125f8b:	mov    0x1d0(%rsp),%rax
   140125f93:	mov    %rax,0x208(%rsp)
   140125f9b:	mov    $0x1,%esi
   140125fa0:	lea    0x210(%rsp),%rdx
   140125fa8:	lea    0x208(%rsp),%rcx
   140125fb0:	vzeroupper
   140125fb3:	call   14021a1d0 <setun::VMValue::div(setun::VMValue const&) const>
   140125fb8:	mov    %rax,0x1c8(%rsp)
   140125fc0:	cmpb   $0x0,0x1040(%rbx)
   140125fc7:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140125fcd:	mov    %r12,%rax
   140125fd0:	lea    0x29b0c9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140125fd7:	lea    0x1(%r12),%r12
   140125fdc:	movzbl (%rax),%eax
   140125fdf:	jmp    *(%rdi,%rax,8)
   140125fe2:	movabs $0xfffb000000000000,%rax
   140125fec:	mov    %rax,0x218(%rsp)
   140125ff4:	mov    %rax,0x220(%rsp)
   140125ffc:	cmp    $0x2,%sil
   140126000:	jne    1401312be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd0e>
   140126006:	mov    0x1c8(%rsp),%rax
   14012600e:	mov    %rax,0x220(%rsp)
   140126016:	mov    0x1d0(%rsp),%rax
   14012601e:	mov    %rax,0x218(%rsp)
   140126026:	mov    $0x1,%esi
   14012602b:	lea    0x220(%rsp),%rdx
   140126033:	lea    0x218(%rsp),%rcx
   14012603b:	vzeroupper
   14012603e:	call   14021a5c0 <setun::VMValue::mod(setun::VMValue const&) const>
   140126043:	mov    %rax,0x1c8(%rsp)
   14012604b:	cmpb   $0x0,0x1040(%rbx)
   140126052:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126058:	mov    %r12,%rax
   14012605b:	lea    0x29b03e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126062:	lea    0x1(%r12),%r12
   140126067:	movzbl (%rax),%eax
   14012606a:	jmp    *(%rdi,%rax,8)
   14012606d:	movabs $0xfffb000000000000,%rax
   140126077:	mov    %rax,0x228(%rsp)
   14012607f:	mov    %rax,0x230(%rsp)
   140126087:	cmp    $0x2,%sil
   14012608b:	jne    14013152e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf7e>
   140126091:	mov    0x1c8(%rsp),%rax
   140126099:	mov    %rax,0x230(%rsp)
   1401260a1:	mov    0x1d0(%rsp),%rax
   1401260a9:	mov    %rax,0x228(%rsp)
   1401260b1:	mov    $0x1,%esi
   1401260b6:	lea    0x230(%rsp),%rdx
   1401260be:	lea    0x228(%rsp),%rcx
   1401260c6:	vzeroupper
   1401260c9:	call   14021bc90 <setun::VMValue::bit_and(setun::VMValue const&) const>
   1401260ce:	mov    %rax,0x1c8(%rsp)
   1401260d6:	cmpb   $0x0,0x1040(%rbx)
   1401260dd:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401260e3:	mov    %r12,%rax
   1401260e6:	lea    0x29afb3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401260ed:	lea    0x1(%r12),%r12
   1401260f2:	movzbl (%rax),%eax
   1401260f5:	jmp    *(%rdi,%rax,8)
   1401260f8:	movabs $0xfffb000000000000,%rax
   140126102:	mov    %rax,0x238(%rsp)
   14012610a:	mov    %rax,0x240(%rsp)
   140126112:	cmp    $0x2,%sil
   140126116:	jne    140131500 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcf50>
   14012611c:	mov    0x1c8(%rsp),%rax
   140126124:	mov    %rax,0x240(%rsp)
   14012612c:	mov    0x1d0(%rsp),%rax
   140126134:	mov    %rax,0x238(%rsp)
   14012613c:	mov    $0x1,%esi
   140126141:	lea    0x240(%rsp),%rdx
   140126149:	lea    0x238(%rsp),%rcx
   140126151:	vzeroupper
   140126154:	call   14021b460 <setun::VMValue::bit_or(setun::VMValue const&) const>
   140126159:	mov    %rax,0x1c8(%rsp)
   140126161:	cmpb   $0x0,0x1040(%rbx)
   140126168:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   14012616e:	mov    %r12,%rax
   140126171:	lea    0x29af28(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126178:	lea    0x1(%r12),%r12
   14012617d:	movzbl (%rax),%eax
   140126180:	jmp    *(%rdi,%rax,8)
   140126183:	movabs $0xfffb000000000000,%rax
   14012618d:	mov    %rax,0x248(%rsp)
   140126195:	mov    %rax,0x250(%rsp)
   14012619d:	cmp    $0x2,%sil
   1401261a1:	jne    140131670 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0c0>
   1401261a7:	mov    0x1c8(%rsp),%rax
   1401261af:	mov    %rax,0x250(%rsp)
   1401261b7:	mov    0x1d0(%rsp),%rax
   1401261bf:	mov    %rax,0x248(%rsp)
   1401261c7:	mov    $0x1,%esi
   1401261cc:	lea    0x250(%rsp),%rdx
   1401261d4:	lea    0x248(%rsp),%rcx
   1401261dc:	vzeroupper
   1401261df:	call   14021c190 <setun::VMValue::bit_xor(setun::VMValue const&) const>
   1401261e4:	mov    %rax,0x1c8(%rsp)
   1401261ec:	cmpb   $0x0,0x1040(%rbx)
   1401261f3:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401261f9:	mov    %r12,%rax
   1401261fc:	lea    0x29ae9d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126203:	lea    0x1(%r12),%r12
   140126208:	movzbl (%rax),%eax
   14012620b:	jmp    *(%rdi,%rax,8)
   14012620e:	movabs $0xfffb000000000000,%rax
   140126218:	mov    %rax,0x258(%rsp)
   140126220:	mov    %rax,0x260(%rsp)
   140126228:	cmp    $0x2,%sil
   14012622c:	jne    1401313fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce4c>
   140126232:	mov    0x1c8(%rsp),%rax
   14012623a:	mov    %rax,0x260(%rsp)
   140126242:	mov    0x1d0(%rsp),%rax
   14012624a:	mov    %rax,0x258(%rsp)
   140126252:	mov    $0x1,%esi
   140126257:	lea    0x260(%rsp),%rdx
   14012625f:	lea    0x258(%rsp),%rcx
   140126267:	vzeroupper
   14012626a:	call   14021ab90 <setun::VMValue::shl(setun::VMValue const&) const>
   14012626f:	mov    %rax,0x1c8(%rsp)
   140126277:	cmpb   $0x0,0x1040(%rbx)
   14012627e:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126284:	mov    %r12,%rax
   140126287:	lea    0x29ae12(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012628e:	lea    0x1(%r12),%r12
   140126293:	movzbl (%rax),%eax
   140126296:	jmp    *(%rdi,%rax,8)
   140126299:	movabs $0xfffb000000000000,%rax
   1401262a3:	mov    %rax,0x268(%rsp)
   1401262ab:	mov    %rax,0x270(%rsp)
   1401262b3:	cmp    $0x2,%sil
   1401262b7:	jne    140131767 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd1b7>
   1401262bd:	mov    0x1c8(%rsp),%rax
   1401262c5:	mov    %rax,0x270(%rsp)
   1401262cd:	mov    0x1d0(%rsp),%rax
   1401262d5:	mov    %rax,0x268(%rsp)
   1401262dd:	mov    $0x1,%esi
   1401262e2:	lea    0x270(%rsp),%rdx
   1401262ea:	lea    0x268(%rsp),%rcx
   1401262f2:	vzeroupper
   1401262f5:	call   14021adb0 <setun::VMValue::shr(setun::VMValue const&) const>
   1401262fa:	mov    %rax,0x1c8(%rsp)
   140126302:	cmpb   $0x0,0x1040(%rbx)
   140126309:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   14012630f:	mov    %r12,%rax
   140126312:	lea    0x29ad87(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126319:	lea    0x1(%r12),%r12
   14012631e:	movzbl (%rax),%eax
   140126321:	jmp    *(%rdi,%rax,8)
   140126324:	test   %sil,%sil
   140126327:	jne    14012b2d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d24>
   14012632d:	lea    -0x8(%r13),%rcx
   140126331:	vzeroupper
   140126334:	mov    $0x1,%esi
   140126339:	mov    %rcx,%r13
   14012633c:	call   14021aa50 <setun::VMValue::neg() const>
   140126341:	mov    %rax,0x1c8(%rsp)
   140126349:	cmpb   $0x0,0x1040(%rbx)
   140126350:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140126356:	mov    %r12,%rax
   140126359:	lea    0x29ad40(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126360:	lea    0x1(%r12),%r12
   140126365:	movzbl (%rax),%eax
   140126368:	jmp    *(%rdi,%rax,8)
   14012636b:	movabs $0xfffb000000000000,%rax
   140126375:	mov    %rax,0x278(%rsp)
   14012637d:	mov    %rax,0x280(%rsp)
   140126385:	cmp    $0x2,%sil
   140126389:	jne    14013145f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xceaf>
   14012638f:	mov    0x1c8(%rsp),%rax
   140126397:	mov    %rax,0x280(%rsp)
   14012639f:	mov    0x1d0(%rsp),%rax
   1401263a7:	mov    %rax,0x278(%rsp)
   1401263af:	mov    $0x1,%esi
   1401263b4:	mov    0x278(%rsp),%rcx
   1401263bc:	movabs $0xffffffff00000000,%rax
   1401263c6:	movabs $0xfffd000100000000,%rdx
   1401263d0:	and    %rax,%rcx
   1401263d3:	cmp    %rdx,%rcx
   1401263d6:	je     14012d6b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9100>
   1401263dc:	and    0x280(%rsp),%rax
   1401263e4:	cmp    %rdx,%rax
   1401263e7:	je     14012d6b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9100>
   1401263ed:	lea    0x278(%rsp),%rcx
   1401263f5:	vzeroupper
   1401263f8:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401263fd:	lea    0x280(%rsp),%rcx
   140126405:	mov    %rax,%rdi
   140126408:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012640d:	mov    0x278(%rsp),%rcx
   140126415:	movabs $0xffff000000000000,%rdx
   14012641f:	movabs $0xfffa000000000000,%r8
   140126429:	and    %rdx,%rcx
   14012642c:	cmp    %r8,%rcx
   14012642f:	jne    140126442 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e92>
   140126431:	and    0x280(%rsp),%rdx
   140126439:	cmp    %rcx,%rdx
   14012643c:	je     14012f7a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1f3>
   140126442:	cmp    %rax,%rdi
   140126445:	lea    0x710(%rsp),%rcx
   14012644d:	cmovle %rdi,%rax
   140126451:	mov    %rax,%rdx
   140126454:	call   140210640 <setun::VMValue::VMValue(long long)>
   140126459:	mov    0x710(%rsp),%rax
   140126461:	mov    %rax,0x1c8(%rsp)
   140126469:	cmpb   $0x0,0x1040(%rbx)
   140126470:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126476:	mov    %r12,%rax
   140126479:	lea    0x29ac20(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126480:	lea    0x1(%r12),%r12
   140126485:	movzbl (%rax),%eax
   140126488:	jmp    *(%rdi,%rax,8)
   14012648b:	movabs $0xfffb000000000000,%rax
   140126495:	mov    %rax,0x288(%rsp)
   14012649d:	mov    %rax,0x290(%rsp)
   1401264a5:	cmp    $0x2,%sil
   1401264a9:	jne    1401313ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xce1e>
   1401264af:	mov    0x1c8(%rsp),%rax
   1401264b7:	mov    %rax,0x290(%rsp)
   1401264bf:	mov    0x1d0(%rsp),%rax
   1401264c7:	mov    %rax,0x288(%rsp)
   1401264cf:	mov    $0x1,%esi
   1401264d4:	mov    0x288(%rsp),%rcx
   1401264dc:	movabs $0xffffffff00000000,%rax
   1401264e6:	movabs $0xfffd000100000000,%rdx
   1401264f0:	and    %rax,%rcx
   1401264f3:	cmp    %rdx,%rcx
   1401264f6:	je     14012d714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9164>
   1401264fc:	and    0x290(%rsp),%rax
   140126504:	cmp    %rdx,%rax
   140126507:	je     14012d714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9164>
   14012650d:	lea    0x288(%rsp),%rcx
   140126515:	vzeroupper
   140126518:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012651d:	lea    0x290(%rsp),%rcx
   140126525:	mov    %rax,%rdi
   140126528:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012652d:	mov    0x288(%rsp),%rcx
   140126535:	movabs $0xffff000000000000,%rdx
   14012653f:	movabs $0xfffa000000000000,%r8
   140126549:	and    %rdx,%rcx
   14012654c:	cmp    %r8,%rcx
   14012654f:	jne    140126562 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fb2>
   140126551:	and    0x290(%rsp),%rdx
   140126559:	cmp    %rcx,%rdx
   14012655c:	je     14012f777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1c7>
   140126562:	cmp    %rax,%rdi
   140126565:	lea    0x710(%rsp),%rcx
   14012656d:	cmovge %rdi,%rax
   140126571:	mov    %rax,%rdx
   140126574:	call   140210640 <setun::VMValue::VMValue(long long)>
   140126579:	mov    0x710(%rsp),%rax
   140126581:	mov    %rax,0x1c8(%rsp)
   140126589:	cmpb   $0x0,0x1040(%rbx)
   140126590:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126596:	mov    %r12,%rax
   140126599:	lea    0x29ab00(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401265a0:	lea    0x1(%r12),%r12
   1401265a5:	movzbl (%rax),%eax
   1401265a8:	jmp    *(%rdi,%rax,8)
   1401265ab:	movabs $0xfffb000000000000,%rax
   1401265b5:	mov    %rax,0x298(%rsp)
   1401265bd:	mov    %rax,0x2a0(%rsp)
   1401265c5:	cmp    $0x2,%sil
   1401265c9:	jne    140131739 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd189>
   1401265cf:	mov    0x1c8(%rsp),%rax
   1401265d7:	mov    %rax,0x2a0(%rsp)
   1401265df:	mov    0x1d0(%rsp),%rax
   1401265e7:	mov    %rax,0x298(%rsp)
   1401265ef:	mov    $0x1,%esi
   1401265f4:	mov    0x298(%rsp),%r8
   1401265fc:	mov    0x2a0(%rsp),%rcx
   140126604:	movabs $0xffff000000000000,%rdx
   14012660e:	movabs $0xfff8000000000000,%rax
   140126618:	mov    %r8,%r9
   14012661b:	and    %rdx,%r9
   14012661e:	cmp    %rax,%r9
   140126621:	je     14012bf98 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79e8>
   140126627:	movabs $0xfffd000000000000,%r10
   140126631:	cmp    %r10,%r9
   140126634:	je     14012f2e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad30>
   14012663a:	movabs $0xfffc000000000000,%rax
   140126644:	cmp    %rax,%r8
   140126647:	je     14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   14012664d:	movabs $0xfff7ffffffffffff,%r9
   140126657:	cmp    %r8,%r9
   14012665a:	jae    14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   140126660:	cmp    %rax,%rcx
   140126663:	je     14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   140126669:	cmp    %rcx,%r9
   14012666c:	jae    14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   140126672:	and    %rcx,%rdx
   140126675:	cmp    %r10,%rdx
   140126678:	je     140131edd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd92d>
   14012667e:	lea    0x298(%rsp),%rcx
   140126686:	vzeroupper
   140126689:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012668e:	lea    0x2a0(%rsp),%rcx
   140126696:	mov    %rax,%rdi
   140126699:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012669e:	cmp    %rax,%rdi
   1401266a1:	sete   %dil
   1401266a5:	movabs $0xfffa000000000000,%rdx
   1401266af:	movzbl %dil,%eax
   1401266b3:	add    %rdx,%rax
   1401266b6:	mov    %rax,0x1c8(%rsp)
   1401266be:	cmpb   $0x0,0x1040(%rbx)
   1401266c5:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401266cb:	mov    %r12,%rax
   1401266ce:	lea    0x29a9cb(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401266d5:	lea    0x1(%r12),%r12
   1401266da:	movzbl (%rax),%eax
   1401266dd:	jmp    *(%rdi,%rax,8)
   1401266e0:	movabs $0xfffb000000000000,%rax
   1401266ea:	mov    %rax,0x2a8(%rsp)
   1401266f2:	mov    %rax,0x2b0(%rsp)
   1401266fa:	cmp    $0x2,%sil
   1401266fe:	jne    14013106c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcabc>
   140126704:	mov    0x1c8(%rsp),%rax
   14012670c:	mov    %rax,0x2b0(%rsp)
   140126714:	mov    0x1d0(%rsp),%rax
   14012671c:	mov    %rax,0x2a8(%rsp)
   140126724:	mov    $0x1,%esi
   140126729:	mov    0x2a8(%rsp),%rdx
   140126731:	movabs $0xffff000000000000,%rcx
   14012673b:	movabs $0xfff8000000000000,%r8
   140126745:	mov    %rdx,%rax
   140126748:	and    %rcx,%rax
   14012674b:	cmp    %r8,%rax
   14012674e:	je     14012b3af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dff>
   140126754:	movabs $0xfffd000000000000,%r8
   14012675e:	cmp    %r8,%rax
   140126761:	je     14012b3a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6df2>
   140126767:	movabs $0xfffc000000000000,%r9
   140126771:	cmp    %r9,%rdx
   140126774:	je     14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   14012677a:	movabs $0xfff7ffffffffffff,%r10
   140126784:	cmp    %rdx,%r10
   140126787:	jae    14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   14012678d:	mov    0x2b0(%rsp),%rax
   140126795:	cmp    %rax,%r10
   140126798:	jae    14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   14012679e:	cmp    %r9,%rax
   1401267a1:	je     14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   1401267a7:	and    %rax,%rcx
   1401267aa:	cmp    %r8,%rcx
   1401267ad:	je     140131f8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9df>
   1401267b3:	lea    0x2a8(%rsp),%rcx
   1401267bb:	vzeroupper
   1401267be:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401267c3:	lea    0x2b0(%rsp),%rcx
   1401267cb:	mov    %rax,%rdi
   1401267ce:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401267d3:	cmp    %rax,%rdi
   1401267d6:	setne  %al
   1401267d9:	movabs $0xfffa000000000000,%rdx
   1401267e3:	movzbl %al,%eax
   1401267e6:	add    %rdx,%rax
   1401267e9:	mov    %rax,0x1c8(%rsp)
   1401267f1:	cmpb   $0x0,0x1040(%rbx)
   1401267f8:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401267fe:	mov    %r12,%rax
   140126801:	lea    0x29a898(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126808:	lea    0x1(%r12),%r12
   14012680d:	movzbl (%rax),%eax
   140126810:	jmp    *(%rdi,%rax,8)
   140126813:	movabs $0xfffb000000000000,%rax
   14012681d:	mov    %rax,0x2b8(%rsp)
   140126825:	mov    %rax,0x2c0(%rsp)
   14012682d:	cmp    $0x2,%sil
   140126831:	jne    14013109a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcaea>
   140126837:	mov    0x1c8(%rsp),%rax
   14012683f:	mov    %rax,0x2c0(%rsp)
   140126847:	mov    0x1d0(%rsp),%rax
   14012684f:	mov    %rax,0x2b8(%rsp)
   140126857:	mov    $0x1,%esi
   14012685c:	mov    0x2b8(%rsp),%r8
   140126864:	mov    0x2c0(%rsp),%rdx
   14012686c:	movabs $0xffff000000000000,%rcx
   140126876:	movabs $0xfff8000000000000,%rax
   140126880:	mov    %r8,%r9
   140126883:	and    %rcx,%r9
   140126886:	cmp    %rax,%r9
   140126889:	je     14012bc13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7663>
   14012688f:	movabs $0xfffd000000000000,%r10
   140126899:	cmp    %r10,%r9
   14012689c:	je     14012f1c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac10>
   1401268a2:	movabs $0xfff7ffffffffffff,%rax
   1401268ac:	cmp    %r8,%rax
   1401268af:	jae    14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   1401268b5:	movabs $0xfffc000000000000,%r9
   1401268bf:	cmp    %r9,%r8
   1401268c2:	je     14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   1401268c8:	cmp    %r9,%rdx
   1401268cb:	je     14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   1401268d1:	cmp    %rdx,%rax
   1401268d4:	jae    14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   1401268da:	and    %rdx,%rcx
   1401268dd:	cmp    %r10,%rcx
   1401268e0:	je     140131946 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd396>
   1401268e6:	lea    0x2b8(%rsp),%rcx
   1401268ee:	vzeroupper
   1401268f1:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401268f6:	lea    0x2c0(%rsp),%rcx
   1401268fe:	mov    %rax,%rdi
   140126901:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126906:	cmp    %rax,%rdi
   140126909:	setl   %al
   14012690c:	movabs $0xfffa000000000000,%rdx
   140126916:	movzbl %al,%eax
   140126919:	add    %rdx,%rax
   14012691c:	mov    %rax,0x1c8(%rsp)
   140126924:	cmpb   $0x0,0x1040(%rbx)
   14012692b:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126931:	mov    %r12,%rax
   140126934:	lea    0x29a765(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012693b:	lea    0x1(%r12),%r12
   140126940:	movzbl (%rax),%eax
   140126943:	jmp    *(%rdi,%rax,8)
   140126946:	movabs $0xfffb000000000000,%rax
   140126950:	mov    %rax,0x2c8(%rsp)
   140126958:	mov    %rax,0x2d0(%rsp)
   140126960:	cmp    $0x2,%sil
   140126964:	jne    14013117f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbcf>
   14012696a:	mov    0x1c8(%rsp),%rax
   140126972:	mov    %rax,0x2d0(%rsp)
   14012697a:	mov    0x1d0(%rsp),%rax
   140126982:	mov    %rax,0x2c8(%rsp)
   14012698a:	mov    $0x1,%esi
   14012698f:	mov    0x2c8(%rsp),%r8
   140126997:	mov    0x2d0(%rsp),%rdx
   14012699f:	movabs $0xffff000000000000,%rcx
   1401269a9:	movabs $0xfff8000000000000,%rax
   1401269b3:	mov    %r8,%r9
   1401269b6:	and    %rcx,%r9
   1401269b9:	cmp    %rax,%r9
   1401269bc:	je     14012bcf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7740>
   1401269c2:	movabs $0xfffd000000000000,%r10
   1401269cc:	cmp    %r10,%r9
   1401269cf:	je     14012f261 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacb1>
   1401269d5:	movabs $0xfffc000000000000,%rax
   1401269df:	cmp    %rax,%r8
   1401269e2:	je     14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   1401269e8:	movabs $0xfff7ffffffffffff,%r9
   1401269f2:	cmp    %r8,%r9
   1401269f5:	jae    14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   1401269fb:	cmp    %rax,%rdx
   1401269fe:	je     14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   140126a04:	cmp    %rdx,%r9
   140126a07:	jae    14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   140126a0d:	and    %rdx,%rcx
   140126a10:	cmp    %r10,%rcx
   140126a13:	je     140132543 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf93>
   140126a19:	lea    0x2c8(%rsp),%rcx
   140126a21:	vzeroupper
   140126a24:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126a29:	lea    0x2d0(%rsp),%rcx
   140126a31:	mov    %rax,%rdi
   140126a34:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126a39:	cmp    %rax,%rdi
   140126a3c:	setle  %al
   140126a3f:	movabs $0xfffa000000000000,%rdx
   140126a49:	movzbl %al,%eax
   140126a4c:	add    %rdx,%rax
   140126a4f:	mov    %rax,0x1c8(%rsp)
   140126a57:	cmpb   $0x0,0x1040(%rbx)
   140126a5e:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126a64:	mov    %r12,%rax
   140126a67:	lea    0x29a632(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126a6e:	lea    0x1(%r12),%r12
   140126a73:	movzbl (%rax),%eax
   140126a76:	jmp    *(%rdi,%rax,8)
   140126a79:	movabs $0xfffb000000000000,%rax
   140126a83:	mov    %rax,0x2d8(%rsp)
   140126a8b:	mov    %rax,0x2e0(%rsp)
   140126a93:	cmp    $0x2,%sil
   140126a97:	jne    14013131a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd6a>
   140126a9d:	mov    0x1c8(%rsp),%rax
   140126aa5:	mov    %rax,0x2e0(%rsp)
   140126aad:	mov    0x1d0(%rsp),%rax
   140126ab5:	mov    %rax,0x2d8(%rsp)
   140126abd:	mov    $0x1,%esi
   140126ac2:	mov    0x2d8(%rsp),%r8
   140126aca:	mov    0x2e0(%rsp),%rdx
   140126ad2:	movabs $0xffff000000000000,%rcx
   140126adc:	movabs $0xfff8000000000000,%rax
   140126ae6:	mov    %r8,%r9
   140126ae9:	and    %rcx,%r9
   140126aec:	cmp    %rax,%r9
   140126aef:	je     14012c559 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fa9>
   140126af5:	movabs $0xfffd000000000000,%r10
   140126aff:	cmp    %r10,%r9
   140126b02:	je     14012f138 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab88>
   140126b08:	movabs $0xfff7ffffffffffff,%rax
   140126b12:	cmp    %r8,%rax
   140126b15:	jae    14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   140126b1b:	movabs $0xfffc000000000000,%r9
   140126b25:	cmp    %r9,%r8
   140126b28:	je     14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   140126b2e:	cmp    %r9,%rdx
   140126b31:	je     14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   140126b37:	cmp    %rdx,%rax
   140126b3a:	jae    14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   140126b40:	and    %rdx,%rcx
   140126b43:	cmp    %r10,%rcx
   140126b46:	je     140132623 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe073>
   140126b4c:	lea    0x2d8(%rsp),%rcx
   140126b54:	vzeroupper
   140126b57:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126b5c:	lea    0x2e0(%rsp),%rcx
   140126b64:	mov    %rax,%rdi
   140126b67:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126b6c:	cmp    %rax,%rdi
   140126b6f:	setg   %al
   140126b72:	movabs $0xfffa000000000000,%rdx
   140126b7c:	movzbl %al,%eax
   140126b7f:	add    %rdx,%rax
   140126b82:	mov    %rax,0x1c8(%rsp)
   140126b8a:	cmpb   $0x0,0x1040(%rbx)
   140126b91:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126b97:	mov    %r12,%rax
   140126b9a:	lea    0x29a4ff(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126ba1:	lea    0x1(%r12),%r12
   140126ba6:	movzbl (%rax),%eax
   140126ba9:	jmp    *(%rdi,%rax,8)
   140126bac:	movabs $0xfffb000000000000,%rax
   140126bb6:	mov    %rax,0x2e8(%rsp)
   140126bbe:	mov    %rax,0x2f0(%rsp)
   140126bc6:	cmp    $0x2,%sil
   140126bca:	jne    1401313a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcdf0>
   140126bd0:	mov    0x1c8(%rsp),%rax
   140126bd8:	mov    %rax,0x2f0(%rsp)
   140126be0:	mov    0x1d0(%rsp),%rax
   140126be8:	mov    %rax,0x2e8(%rsp)
   140126bf0:	mov    $0x1,%esi
   140126bf5:	mov    0x2e8(%rsp),%r8
   140126bfd:	mov    0x2f0(%rsp),%rdx
   140126c05:	movabs $0xffff000000000000,%rcx
   140126c0f:	movabs $0xfff8000000000000,%rax
   140126c19:	mov    %r8,%r9
   140126c1c:	and    %rcx,%r9
   140126c1f:	cmp    %rax,%r9
   140126c22:	je     14012c078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ac8>
   140126c28:	movabs $0xfffd000000000000,%r10
   140126c32:	cmp    %r10,%r9
   140126c35:	je     14012f0b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab07>
   140126c3b:	movabs $0xfffc000000000000,%rax
   140126c45:	cmp    %rax,%r8
   140126c48:	je     14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   140126c4e:	movabs $0xfff7ffffffffffff,%r9
   140126c58:	cmp    %r8,%r9
   140126c5b:	jae    14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   140126c61:	cmp    %rax,%rdx
   140126c64:	je     14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   140126c6a:	cmp    %rdx,%r9
   140126c6d:	jae    14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   140126c73:	and    %rdx,%rcx
   140126c76:	cmp    %r10,%rcx
   140126c79:	je     140132440 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde90>
   140126c7f:	lea    0x2e8(%rsp),%rcx
   140126c87:	vzeroupper
   140126c8a:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126c8f:	lea    0x2f0(%rsp),%rcx
   140126c97:	mov    %rax,%rdi
   140126c9a:	call   14021b2c0 <setun::VMValue::as_int() const>
   140126c9f:	cmp    %rax,%rdi
   140126ca2:	setge  %al
   140126ca5:	movabs $0xfffa000000000000,%rdx
   140126caf:	movzbl %al,%eax
   140126cb2:	add    %rdx,%rax
   140126cb5:	mov    %rax,0x1c8(%rsp)
   140126cbd:	cmpb   $0x0,0x1040(%rbx)
   140126cc4:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140126cca:	mov    %r12,%rax
   140126ccd:	lea    0x29a3cc(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126cd4:	lea    0x1(%r12),%r12
   140126cd9:	movzbl (%rax),%eax
   140126cdc:	jmp    *(%rdi,%rax,8)
   140126cdf:	movzwl (%r12),%edi
   140126ce4:	test   %di,%di
   140126ce7:	js     1401304c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf19>
   140126ced:	movswl %di,%eax
   140126cf0:	add    $0x2,%eax
   140126cf3:	cltq
   140126cf5:	add    %r12,%rax
   140126cf8:	mov    %rax,%r12
   140126cfb:	cmpb   $0x0,0x1040(%rbx)
   140126d02:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140126d08:	lea    0x1(%rax),%r12
   140126d0c:	movzbl (%rax),%eax
   140126d0f:	lea    0x29a38a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d16:	jmp    *(%rdi,%rax,8)
   140126d19:	movabs $0xfffb000000000000,%rax
   140126d23:	movzwl (%r12),%edi
   140126d28:	add    $0x2,%r12
   140126d2c:	mov    %rax,0x2f8(%rsp)
   140126d34:	cmp    $0x1,%sil
   140126d38:	jne    140130f22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc972>
   140126d3e:	mov    0x1c8(%rsp),%rax
   140126d46:	xor    %esi,%esi
   140126d48:	mov    %rax,0x2f8(%rsp)
   140126d50:	lea    0x2f8(%rsp),%rcx
   140126d58:	vzeroupper
   140126d5b:	call   14021b950 <setun::VMValue::as_bool() const>
   140126d60:	mov    %eax,%edx
   140126d62:	movswq %di,%rax
   140126d66:	add    %r12,%rax
   140126d69:	test   %dl,%dl
   140126d6b:	cmove  %rax,%r12
   140126d6f:	cmpb   $0x0,0x1040(%rbx)
   140126d76:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140126d7c:	mov    %r12,%rax
   140126d7f:	lea    0x29a31a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126d86:	movzbl (%rax),%eax
   140126d89:	lea    0x1(%r12),%r12
   140126d8e:	jmp    *(%rdi,%rax,8)
   140126d91:	movzwl 0x2(%r12),%eax
   140126d97:	movzwl (%r12),%edi
   140126d9c:	add    $0x6,%r12
   140126da0:	mov    %ax,0x60(%rsp)
   140126da5:	movzwl -0x2(%r12),%eax
   140126dab:	mov    %ax,0x40(%rsp)
   140126db0:	movabs $0xfffb000000000000,%rax
   140126dba:	mov    %rax,0x300(%rsp)
   140126dc2:	cmp    $0x1,%sil
   140126dc6:	jne    140130f00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc950>
   140126dcc:	mov    0x1c8(%rsp),%rax
   140126dd4:	xor    %esi,%esi
   140126dd6:	mov    %rax,0x300(%rsp)
   140126dde:	mov    0x300(%rsp),%rax
   140126de6:	movabs $0xffff000000000000,%rdx
   140126df0:	movabs $0xfffd000000000000,%rcx
   140126dfa:	and    %rax,%rdx
   140126dfd:	cmp    %rcx,%rdx
   140126e00:	je     14012c7e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8237>
   140126e06:	movabs $0xfffc000000000000,%rdx
   140126e10:	cmp    %rdx,%rax
   140126e13:	je     140126e28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2878>
   140126e15:	movabs $0xfff7ffffffffffff,%rdx
   140126e1f:	cmp    %rax,%rdx
   140126e22:	jb     14012c7f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8245>
   140126e28:	lea    0x300(%rsp),%rcx
   140126e30:	vzeroupper
   140126e33:	call   14021ca10 <setun::VMValue::as_float() const>
   140126e38:	vmovsd 0x236ce0(%rip),%xmm1        # 14035db20 <CSWTCH.4381+0x220>
   140126e40:	vcomisd %xmm0,%xmm1
   140126e44:	ja     14012d6a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90f2>
   140126e4a:	vcomisd 0x236cd6(%rip),%xmm0        # 14035db28 <CSWTCH.4381+0x228>
   140126e52:	ja     14012c814 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8264>
   140126e58:	movswq 0x60(%rsp),%rax
   140126e5e:	lea    -0x2(%r12,%rax,1),%rax
   140126e63:	mov    %rax,%r12
   140126e66:	cmpb   $0x0,0x1040(%rbx)
   140126e6d:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140126e73:	lea    0x1(%rax),%r12
   140126e77:	movzbl (%rax),%eax
   140126e7a:	lea    0x29a21f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140126e81:	jmp    *(%rdi,%rax,8)
   140126e84:	mov    0x88(%r14),%rdx
   140126e8b:	mov    0x80(%r14),%r8
   140126e92:	mov    %r12,%rcx
   140126e95:	lea    0x2(%r12),%r12
   140126e9a:	movzwl -0x2(%r12),%eax
   140126ea0:	cmp    %rdx,%r8
   140126ea3:	je     14012d41b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e6b>
   140126ea9:	sub    %r8,%rdx
   140126eac:	sar    $0x2,%rdx
   140126eb0:	cmp    %rdx,%rax
   140126eb3:	jae    140132b7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5cc>
   140126eb9:	mov    (%r8,%rax,4),%edi
   140126ebd:	mov    %edi,0x60(%rsp)
   140126ec1:	mov    0x98(%r14),%r8
   140126ec8:	mov    0xa0(%r14),%rdx
   140126ecf:	lea    0x3(%rcx),%r12
   140126ed3:	movzbl 0x2(%rcx),%ecx
   140126ed7:	sub    %r8,%rdx
   140126eda:	sar    $1,%rdx
   140126edd:	mov    %rcx,0x40(%rsp)
   140126ee2:	mov    %rcx,%rdi
   140126ee5:	mov    $0x20,%ecx
   140126eea:	cmp    %rdx,%rax
   140126eed:	jae    140126efc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x294c>
   140126eef:	movzwl (%r8,%rax,2),%r8d
   140126ef4:	test   %r8w,%r8w
   140126ef8:	cmovne %r8,%rcx
   140126efc:	movzbl %dil,%edx
   140126f00:	add    $0x8,%rdx
   140126f04:	cmp    %rcx,%rdx
   140126f07:	cmovae %rdx,%rcx
   140126f0b:	mov    %rcx,0x40(%rsp)
   140126f10:	cmpb   $0x0,0x152c1(%rbx)
   140126f17:	je     14012dae7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9537>
   140126f1d:	mov    0x152d8(%rbx),%rdx
   140126f24:	test   %rdx,%rdx
   140126f27:	je     14012dae7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9537>
   140126f2d:	and    0x152f8(%rbx),%rax
   140126f34:	shl    $0x5,%rax
   140126f38:	add    %rdx,%rax
   140126f3b:	mov    %rax,0xa0(%rsp)
   140126f43:	cmpq   $0x0,(%rax)
   140126f47:	je     14012da0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x945c>
   140126f4d:	cmpb   $0x0,0x15211(%rbx)
   140126f54:	je     14013000a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba5a>
   140126f5a:	mov    0x15268(%rbx),%rax
   140126f61:	mov    0x1070(%rbx),%rdx
   140126f68:	sub    0x1068(%rbx),%rdx
   140126f6f:	mov    %rax,0x80(%rsp)
   140126f77:	add    %rcx,%rax
   140126f7a:	sar    $0x3,%rdx
   140126f7e:	mov    %rax,0x15268(%rbx)
   140126f85:	add    $0x40,%rax
   140126f89:	cmp    %rdx,%rax
   140126f8c:	jae    140135960 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113b0>
   140126f92:	vzeroupper
   140126f95:	test   %dil,%dil
   140126f98:	je     1401320a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdaf9>
   140126f9e:	mov    0x80(%rsp),%r10
   140126fa6:	movzbl %dil,%edx
   140126faa:	movzbl %dil,%r8d
   140126fae:	sub    $0x1,%r8d
   140126fb2:	lea    -0x1(%rdx,%r10,1),%rcx
   140126fb7:	sub    $0x2,%rdx
   140126fbb:	sub    %r8,%rdx
   140126fbe:	lea    0x0(,%rcx,8),%rax
   140126fc6:	mov    0x1068(%rbx),%r8
   140126fcd:	add    %r10,%rdx
   140126fd0:	shl    $0x3,%rdx
   140126fd4:	cmp    $0x1,%sil
   140126fd8:	jne    140132042 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda92>
   140126fde:	mov    0x1c8(%rsp),%rcx
   140126fe6:	mov    %rcx,(%r8,%rax,1)
   140126fea:	sub    $0x8,%rax
   140126fee:	cmp    %rax,%rdx
   140126ff1:	je     14012700b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a5b>
   140126ff3:	mov    %r13,%rcx
   140126ff6:	sub    $0x8,%r13
   140126ffa:	mov    -0x8(%rcx),%rcx
   140126ffe:	mov    %rcx,(%r8,%rax,1)
   140127002:	sub    $0x8,%rax
   140127006:	cmp    %rax,%rdx
   140127009:	jne    140126ff3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a43>
   14012700b:	mov    0x1048(%rbx),%r11
   140127012:	lea    0x830(%rsp),%rdx
   14012701a:	xor    %eax,%eax
   14012701c:	mov    $0x23,%ecx
   140127021:	mov    %r13,%rsi
   140127024:	mov    %rdx,%rdi
   140127027:	rep stos %rax,(%rdi)
   14012702a:	mov    0x80(%rsp),%rax
   140127032:	mov    0x150c0(%rbx),%rcx
   140127039:	movb   $0x1,0x938(%rsp)
   140127041:	mov    %rbx,0x830(%rsp)
   140127049:	lea    (%r8,%rax,8),%rax
   14012704d:	mov    %r11,0x850(%rsp)
   140127055:	mov    %rax,0x840(%rsp)
   14012705d:	mov    0x40(%rsp),%rax
   140127062:	mov    %rax,0x848(%rsp)
   14012706a:	mov    %r13,%rax
   14012706d:	sub    %r11,%rax
   140127070:	sar    $0x3,%rax
   140127074:	mov    %rax,0x858(%rsp)
   14012707c:	xor    %eax,%eax
   14012707e:	test   %rcx,%rcx
   140127081:	je     14012708f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2adf>
   140127083:	lea    (%rcx,%rcx,4),%rax
   140127087:	lea    0x1098(%rbx,%rax,8),%rax
   14012708f:	vmovq  %rax,%xmm7
   140127094:	mov    %rdx,0xc0(%rsp)
   14012709c:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   1401270a6:	mov    %rdx,0x152b8(%rbx)
   1401270ad:	vmovdqa %xmm0,0x860(%rsp)
   1401270b6:	call   140213660 <tersun::VMTelemetryManager::instance()>
   1401270bb:	mov    0xc0(%rsp),%rdx
   1401270c3:	cmpb   $0x0,(%rax)
   1401270c6:	je     1401270cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b1d>
   1401270c8:	addq   $0x1,0x28(%rax)
   1401270cd:	mov    0xa0(%rsp),%rax
   1401270d5:	mov    %rbx,%rcx
   1401270d8:	call   *(%rax)
   1401270da:	mov    0x868(%rsp),%rdx
   1401270e2:	mov    %rdx,0x152b8(%rbx)
   1401270e9:	cmpq   $0x0,0x878(%rsp)
   1401270f2:	jg     14013518f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bdf>
   1401270f8:	mov    %rax,0x1c8(%rsp)
   140127100:	cmpb   $0x0,0x15211(%rbx)
   140127107:	je     140132c97 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6e7>
   14012710d:	mov    0x80(%rsp),%rax
   140127115:	mov    %rax,0x15268(%rbx)
   14012711c:	cmpb   $0x0,0x1040(%rbx)
   140127123:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140127129:	mov    %r12,%rax
   14012712c:	lea    0x299f6d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127133:	lea    0x1(%r12),%r12
   140127138:	mov    $0x1,%esi
   14012713d:	movzbl (%rax),%eax
   140127140:	mov    (%rdi,%rax,8),%rax
   140127144:	jmp    *%rax
   140127146:	mov    0x150c0(%rbx),%rax
   14012714d:	test   %rax,%rax
   140127150:	je     140125191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   140127156:	lea    -0x1(%rax),%rcx
   14012715a:	lea    (%rax,%rax,4),%rax
   14012715e:	lea    (%rcx,%rcx,4),%rdx
   140127162:	vmovdqu 0x10c0(%rbx,%rdx,8),%ymm0
   14012716b:	mov    0x10e0(%rbx,%rdx,8),%rdx
   140127173:	mov    %rdx,0x5e0(%rsp)
   14012717b:	lea    (%rbx,%rax,8),%rdx
   14012717f:	mov    0x1098(%rdx),%rdi
   140127186:	mov    0x10a0(%rdx),%rax
   14012718d:	vmovdqu %ymm0,0x5c0(%rsp)
   140127196:	mov    0x10a8(%rdx),%rbp
   14012719d:	mov    %rcx,0x150c0(%rbx)
   1401271a4:	test   %sil,%sil
   1401271a7:	jne    14012b385 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dd5>
   1401271ad:	movabs $0xfffb000000000000,%rsi
   1401271b7:	cmp    %r13,0x1048(%rbx)
   1401271be:	jae    1401271c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c14>
   1401271c0:	mov    -0x8(%r13),%rsi
   1401271c4:	cmpb   $0x0,0x15211(%rbx)
   1401271cb:	je     14012e465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9eb5>
   1401271d1:	mov    %rax,0x15268(%rbx)
   1401271d8:	mov    0x1048(%rbx),%r11
   1401271df:	mov    %rsi,0x1c8(%rsp)
   1401271e7:	lea    (%r11,%rbp,8),%r13
   1401271eb:	mov    0x150c0(%rbx),%rbp
   1401271f2:	test   %rbp,%rbp
   1401271f5:	je     140127204 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c54>
   1401271f7:	lea    -0x5(%rbp,%rbp,4),%rax
   1401271fc:	mov    0x10c8(%rbx,%rax,8),%rbp
   140127204:	add    %r15,%rdi
   140127207:	mov    %rdi,%r12
   14012720a:	cmpb   $0x0,0x1040(%rbx)
   140127211:	je     14012d9a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93f0>
   140127217:	movzbl (%rdi),%eax
   14012721a:	lea    0x1(%rdi),%r12
   14012721e:	lea    0x299e7b(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127225:	mov    $0x1,%esi
   14012722a:	mov    (%rdi,%rax,8),%rax
   14012722e:	jmp    *%rax
   140127230:	movzwl (%r12),%r8d
   140127235:	movzbl 0x2(%r12),%edi
   14012723b:	add    $0x3,%r12
   14012723f:	cmp    $0x2,%sil
   140127243:	je     14012be5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78af>
   140127249:	cmp    $0x1,%sil
   14012724d:	je     14012ea63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4b3>
   140127253:	mov    0x15268(%rbx),%rbp
   14012725a:	movzbl %dil,%eax
   14012725e:	mov    0x1070(%rbx),%rdx
   140127265:	sub    0x1068(%rbx),%rdx
   14012726c:	lea    (%rax,%rbp,1),%rcx
   140127270:	sar    $0x3,%rdx
   140127274:	mov    %rcx,0x15268(%rbx)
   14012727b:	add    $0x40,%rcx
   14012727f:	cmp    %rdx,%rcx
   140127282:	jae    14013169e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd0ee>
   140127288:	mov    0x1048(%rbx),%r11
   14012728f:	mov    %r13,%rdx
   140127292:	mov    0x150c0(%rbx),%rcx
   140127299:	mov    %r12,%r10
   14012729c:	sub    %r15,%r10
   14012729f:	movzwl %r8w,%r12d
   1401272a3:	sub    %r11,%rdx
   1401272a6:	mov    %rdx,%rdi
   1401272a9:	sar    $0x3,%rdi
   1401272ad:	cmp    $0x7ff,%rcx
   1401272b4:	ja     14013945b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eab>
   1401272ba:	lea    0x1(%rcx),%r8
   1401272be:	lea    (%rcx,%rcx,4),%rcx
   1401272c2:	mov    %r8,0x150c0(%rbx)
   1401272c9:	mov    %rax,0x10d8(%rbx,%rcx,8)
   1401272d1:	mov    0x152a0(%rbx),%rax
   1401272d8:	mov    %r10,0x10c0(%rbx,%rcx,8)
   1401272e0:	mov    %rbp,0x10c8(%rbx,%rcx,8)
   1401272e8:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   1401272f0:	mov    %r12,0x10e0(%rbx,%rcx,8)
   1401272f8:	mov    0x15270(%rbx),%rcx
   1401272ff:	cmp    %rax,0x68(%rcx)
   140127303:	jae    1401316c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd119>
   140127309:	lea    (%r15,%r12,1),%rax
   14012730d:	mov    %rax,%r12
   140127310:	cmpb   $0x0,0x1040(%rbx)
   140127317:	je     14012f259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaca9>
   14012731d:	lea    0x1(%rax),%r12
   140127321:	movzbl (%rax),%eax
   140127324:	lea    0x299d75(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012732b:	jmp    *(%rdi,%rax,8)
   14012732e:	mov    %r12,%rax
   140127331:	movzwl (%r12),%r9d
   140127336:	lea    0x3(%r12),%r12
   14012733b:	mov    0x15268(%rbx),%rbp
   140127342:	movzbl 0x2(%rax),%eax
   140127346:	mov    0x1070(%rbx),%rdx
   14012734d:	sub    0x1068(%rbx),%rdx
   140127354:	lea    (%rax,%rbp,1),%rcx
   140127358:	sar    $0x3,%rdx
   14012735c:	mov    %rcx,0x15268(%rbx)
   140127363:	add    $0x40,%rcx
   140127367:	cmp    %rdx,%rcx
   14012736a:	jae    140130dd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc828>
   140127370:	cmp    $0x1,%sil
   140127374:	je     14012c1df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c2f>
   14012737a:	cmp    $0x2,%sil
   14012737e:	je     14012e9c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa419>
   140127384:	mov    %r13,%rdx
   140127387:	mov    0x1068(%rbx),%rcx
   14012738e:	lea    -0x8(%r13),%r13
   140127392:	mov    -0x8(%rdx),%rdx
   140127396:	mov    %rdx,(%rcx,%rbp,8)
   14012739a:	mov    0x1048(%rbx),%r11
   1401273a1:	mov    %r13,%rdx
   1401273a4:	mov    0x150c0(%rbx),%rcx
   1401273ab:	mov    %r12,%r10
   1401273ae:	sub    %r15,%r10
   1401273b1:	movzwl %r9w,%r12d
   1401273b5:	sub    %r11,%rdx
   1401273b8:	mov    %rdx,%rdi
   1401273bb:	sar    $0x3,%rdi
   1401273bf:	cmp    $0x7ff,%rcx
   1401273c6:	ja     14013945b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eab>
   1401273cc:	lea    0x1(%rcx),%r9
   1401273d0:	lea    (%rcx,%rcx,4),%rcx
   1401273d4:	mov    %r9,0x150c0(%rbx)
   1401273db:	mov    %rax,0x10d8(%rbx,%rcx,8)
   1401273e3:	mov    0x152a0(%rbx),%rax
   1401273ea:	mov    %r10,0x10c0(%rbx,%rcx,8)
   1401273f2:	mov    %rbp,0x10c8(%rbx,%rcx,8)
   1401273fa:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   140127402:	mov    %r12,0x10e0(%rbx,%rcx,8)
   14012740a:	mov    0x15270(%rbx),%rcx
   140127411:	cmp    %rax,0x68(%rcx)
   140127415:	jae    140131574 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfc4>
   14012741b:	lea    (%r15,%r12,1),%rax
   14012741f:	mov    %rax,%r12
   140127422:	cmpb   $0x0,0x1040(%rbx)
   140127429:	je     14012f259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaca9>
   14012742f:	lea    0x1(%rax),%r12
   140127433:	movzbl (%rax),%eax
   140127436:	lea    0x299c63(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012743d:	jmp    *(%rdi,%rax,8)
   140127440:	mov    0x150c0(%rbx),%rax
   140127447:	test   %rax,%rax
   14012744a:	je     140125191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe1>
   140127450:	lea    -0x1(%rax),%rbp
   140127454:	test   %sil,%sil
   140127457:	jne    140127465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2eb5>
   140127459:	mov    -0x8(%r13),%rdx
   14012745d:	mov    %rdx,0x1c8(%rsp)
   140127465:	lea    (%rax,%rax,4),%rax
   140127469:	mov    0x1048(%rbx),%r11
   140127470:	lea    (%rbx,%rax,8),%rdx
   140127474:	mov    0x10a0(%rdx),%rax
   14012747b:	mov    %rax,0x15268(%rbx)
   140127482:	mov    0x10a8(%rdx),%rax
   140127489:	lea    (%r11,%rax,8),%r13
   14012748d:	mov    0x1098(%rdx),%rax
   140127494:	mov    %rbp,0x150c0(%rbx)
   14012749b:	test   %rbp,%rbp
   14012749e:	jne    14012b379 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6dc9>
   1401274a4:	add    %r15,%rax
   1401274a7:	mov    %rax,%r12
   1401274aa:	cmpb   $0x0,0x1040(%rbx)
   1401274b1:	je     14012d9a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93f0>
   1401274b7:	lea    0x1(%rax),%r12
   1401274bb:	movzbl (%rax),%eax
   1401274be:	lea    0x299bdb(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401274c5:	mov    $0x1,%esi
   1401274ca:	mov    (%rdi,%rax,8),%rax
   1401274ce:	jmp    *%rax
   1401274d0:	cmp    $0x2,%sil
   1401274d4:	je     14012b6c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7119>
   1401274da:	cmp    $0x1,%sil
   1401274de:	je     14012eb30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa580>
   1401274e4:	mov    0x1048(%rbx),%r11
   1401274eb:	mov    0x1050(%rbx),%rax
   1401274f2:	vzeroupper
   1401274f5:	sub    %r11,%r13
   1401274f8:	sub    %r15,%r12
   1401274fb:	sub    %r11,%rax
   1401274fe:	mov    %r13,%rsi
   140127501:	mov    %r12,0x1038(%rbx)
   140127508:	sar    $0x3,%rsi
   14012750c:	cmp    %r13,%rax
   14012750f:	jb     14012e313 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d63>
   140127515:	vmovdqa 0x2365a3(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012751d:	mov    %rsi,0x1060(%rbx)
   140127524:	mov    %r14,%rdx
   140127527:	mov    %rbx,%rcx
   14012752a:	movb   $0x0,0x153a0(%rbx)
   140127531:	vmovdqa %xmm0,0x15390(%rbx)
   140127539:	call   140107e00 <setun::VM::handle_push_string(setun::Chunk const&)>
   14012753e:	mov    0x1060(%rbx),%rax
   140127545:	mov    0x1048(%rbx),%r11
   14012754c:	mov    0x1038(%rbx),%r12
   140127553:	mov    0x150c0(%rbx),%rbp
   14012755a:	lea    (%r11,%rax,8),%r13
   14012755e:	mov    0x1050(%rbx),%rax
   140127565:	add    %r15,%r12
   140127568:	mov    %rax,0x30(%rsp)
   14012756d:	test   %rbp,%rbp
   140127570:	je     14012757f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2fcf>
   140127572:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127577:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012757f:	cmpb   $0x0,0x1040(%rbx)
   140127586:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012758c:	mov    %r12,%rax
   14012758f:	lea    0x299b0a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127596:	lea    0x1(%r12),%r12
   14012759b:	xor    %esi,%esi
   14012759d:	movzbl (%rax),%eax
   1401275a0:	mov    (%rdi,%rax,8),%rax
   1401275a4:	jmp    *%rax
   1401275a6:	cmp    $0x2,%sil
   1401275aa:	je     14012b890 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x72e0>
   1401275b0:	cmp    $0x1,%sil
   1401275b4:	je     14012e95b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3ab>
   1401275ba:	mov    0x1048(%rbx),%r11
   1401275c1:	mov    0x1050(%rbx),%rax
   1401275c8:	vzeroupper
   1401275cb:	sub    %r11,%r13
   1401275ce:	sub    %r15,%r12
   1401275d1:	sub    %r11,%rax
   1401275d4:	mov    %r13,%rsi
   1401275d7:	mov    %r12,0x1038(%rbx)
   1401275de:	sar    $0x3,%rsi
   1401275e2:	cmp    %r13,%rax
   1401275e5:	jb     14012e078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ac8>
   1401275eb:	vmovdqa 0x2364cd(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401275f3:	mov    %rsi,0x1060(%rbx)
   1401275fa:	mov    %r14,%rdx
   1401275fd:	mov    %rbx,%rcx
   140127600:	movb   $0x0,0x153a0(%rbx)
   140127607:	vmovdqa %xmm0,0x15390(%rbx)
   14012760f:	call   140108510 <setun::VM::handle_ternary_not(setun::Chunk const&)>
   140127614:	mov    0x1060(%rbx),%rax
   14012761b:	mov    0x1048(%rbx),%r11
   140127622:	mov    0x1038(%rbx),%r12
   140127629:	mov    0x150c0(%rbx),%rbp
   140127630:	lea    (%r11,%rax,8),%r13
   140127634:	mov    0x1050(%rbx),%rax
   14012763b:	add    %r15,%r12
   14012763e:	mov    %rax,0x30(%rsp)
   140127643:	test   %rbp,%rbp
   140127646:	je     140127655 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30a5>
   140127648:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012764d:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127655:	cmpb   $0x0,0x1040(%rbx)
   14012765c:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127662:	mov    %r12,%rax
   140127665:	lea    0x299a34(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012766c:	lea    0x1(%r12),%r12
   140127671:	xor    %esi,%esi
   140127673:	movzbl (%rax),%eax
   140127676:	mov    (%rdi,%rax,8),%rax
   14012767a:	jmp    *%rax
   14012767c:	cmp    $0x2,%sil
   140127680:	je     14012bed8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7928>
   140127686:	cmp    $0x1,%sil
   14012768a:	je     14012ed7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7ce>
   140127690:	mov    0x1048(%rbx),%r11
   140127697:	mov    0x1050(%rbx),%rax
   14012769e:	vzeroupper
   1401276a1:	sub    %r11,%r13
   1401276a4:	sub    %r15,%r12
   1401276a7:	sub    %r11,%rax
   1401276aa:	mov    %r13,%rsi
   1401276ad:	mov    %r12,0x1038(%rbx)
   1401276b4:	sar    $0x3,%rsi
   1401276b8:	cmp    %r13,%rax
   1401276bb:	jb     14012e0f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b46>
   1401276c1:	vmovdqa 0x2363f7(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401276c9:	mov    %rsi,0x1060(%rbx)
   1401276d0:	mov    %r14,%rdx
   1401276d3:	mov    %rbx,%rcx
   1401276d6:	movb   $0x0,0x153a0(%rbx)
   1401276dd:	vmovdqa %xmm0,0x15390(%rbx)
   1401276e5:	call   14010d2b0 <setun::VM::handle_ternary_cmp(setun::Chunk const&)>
   1401276ea:	mov    0x1060(%rbx),%rax
   1401276f1:	mov    0x1048(%rbx),%r11
   1401276f8:	mov    0x1038(%rbx),%r12
   1401276ff:	mov    0x150c0(%rbx),%rbp
   140127706:	lea    (%r11,%rax,8),%r13
   14012770a:	mov    0x1050(%rbx),%rax
   140127711:	add    %r15,%r12
   140127714:	mov    %rax,0x30(%rsp)
   140127719:	test   %rbp,%rbp
   14012771c:	je     14012772b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x317b>
   14012771e:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127723:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012772b:	cmpb   $0x0,0x1040(%rbx)
   140127732:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127738:	mov    %r12,%rax
   14012773b:	lea    0x29995e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127742:	lea    0x1(%r12),%r12
   140127747:	xor    %esi,%esi
   140127749:	movzbl (%rax),%eax
   14012774c:	mov    (%rdi,%rax,8),%rax
   140127750:	jmp    *%rax
   140127752:	cmp    $0x2,%sil
   140127756:	je     14012c48d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7edd>
   14012775c:	cmp    $0x1,%sil
   140127760:	je     14012ed10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa760>
   140127766:	mov    0x1048(%rbx),%r11
   14012776d:	mov    0x1050(%rbx),%rax
   140127774:	vzeroupper
   140127777:	sub    %r11,%r13
   14012777a:	sub    %r15,%r12
   14012777d:	sub    %r11,%rax
   140127780:	mov    %r13,%rsi
   140127783:	mov    %r12,0x1038(%rbx)
   14012778a:	sar    $0x3,%rsi
   14012778e:	cmp    %r13,%rax
   140127791:	jb     14012e3e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e35>
   140127797:	vmovdqa 0x236321(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012779f:	mov    %rsi,0x1060(%rbx)
   1401277a6:	mov    %r14,%rdx
   1401277a9:	mov    %rbx,%rcx
   1401277ac:	movb   $0x0,0x153a0(%rbx)
   1401277b3:	vmovdqa %xmm0,0x15390(%rbx)
   1401277bb:	call   140103d20 <setun::VM::handle_tafpu_construct(setun::Chunk const&)>
   1401277c0:	mov    0x1060(%rbx),%rax
   1401277c7:	mov    0x1048(%rbx),%r11
   1401277ce:	mov    0x1038(%rbx),%r12
   1401277d5:	mov    0x150c0(%rbx),%rbp
   1401277dc:	lea    (%r11,%rax,8),%r13
   1401277e0:	mov    0x1050(%rbx),%rax
   1401277e7:	add    %r15,%r12
   1401277ea:	mov    %rax,0x30(%rsp)
   1401277ef:	test   %rbp,%rbp
   1401277f2:	je     140127801 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3251>
   1401277f4:	lea    -0x5(%rbp,%rbp,4),%rdx
   1401277f9:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127801:	cmpb   $0x0,0x1040(%rbx)
   140127808:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012780e:	mov    %r12,%rax
   140127811:	lea    0x299888(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127818:	lea    0x1(%r12),%r12
   14012781d:	xor    %esi,%esi
   14012781f:	movzbl (%rax),%eax
   140127822:	mov    (%rdi,%rax,8),%rax
   140127826:	jmp    *%rax
   140127828:	cmp    $0x2,%sil
   14012782c:	je     14012c4d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f21>
   140127832:	cmp    $0x1,%sil
   140127836:	je     14012e992 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3e2>
   14012783c:	mov    0x1048(%rbx),%r11
   140127843:	mov    0x1050(%rbx),%rax
   14012784a:	vzeroupper
   14012784d:	sub    %r11,%r13
   140127850:	sub    %r15,%r12
   140127853:	sub    %r11,%rax
   140127856:	mov    %r13,%rsi
   140127859:	mov    %r12,0x1038(%rbx)
   140127860:	sar    $0x3,%rsi
   140127864:	cmp    %r13,%rax
   140127867:	jb     14012e0b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b07>
   14012786d:	vmovdqa 0x23624b(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127875:	mov    %rsi,0x1060(%rbx)
   14012787c:	mov    %r14,%rdx
   14012787f:	mov    %rbx,%rcx
   140127882:	movb   $0x0,0x153a0(%rbx)
   140127889:	vmovdqa %xmm0,0x15390(%rbx)
   140127891:	call   140102120 <setun::VM::handle_tafpu_encode(setun::Chunk const&)>
   140127896:	mov    0x1060(%rbx),%rax
   14012789d:	mov    0x1048(%rbx),%r11
   1401278a4:	mov    0x1038(%rbx),%r12
   1401278ab:	mov    0x150c0(%rbx),%rbp
   1401278b2:	lea    (%r11,%rax,8),%r13
   1401278b6:	mov    0x1050(%rbx),%rax
   1401278bd:	add    %r15,%r12
   1401278c0:	mov    %rax,0x30(%rsp)
   1401278c5:	test   %rbp,%rbp
   1401278c8:	je     1401278d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3327>
   1401278ca:	lea    -0x5(%rbp,%rbp,4),%rdx
   1401278cf:	mov    0x10c8(%rbx,%rdx,8),%rbp
   1401278d7:	cmpb   $0x0,0x1040(%rbx)
   1401278de:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   1401278e4:	mov    %r12,%rax
   1401278e7:	lea    0x2997b2(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401278ee:	lea    0x1(%r12),%r12
   1401278f3:	xor    %esi,%esi
   1401278f5:	movzbl (%rax),%eax
   1401278f8:	mov    (%rdi,%rax,8),%rax
   1401278fc:	jmp    *%rax
   1401278fe:	cmp    $0x2,%sil
   140127902:	je     14012c866 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82b6>
   140127908:	cmp    $0x1,%sil
   14012790c:	je     14012ec34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa684>
   140127912:	mov    0x1048(%rbx),%r11
   140127919:	mov    0x1050(%rbx),%rax
   140127920:	vzeroupper
   140127923:	sub    %r11,%r13
   140127926:	sub    %r15,%r12
   140127929:	sub    %r11,%rax
   14012792c:	mov    %r13,%rsi
   14012792f:	mov    %r12,0x1038(%rbx)
   140127936:	sar    $0x3,%rsi
   14012793a:	cmp    %r13,%rax
   14012793d:	jb     14012e0e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b31>
   140127943:	vmovdqa 0x236175(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012794b:	mov    %rsi,0x1060(%rbx)
   140127952:	mov    %r14,%rdx
   140127955:	mov    %rbx,%rcx
   140127958:	movb   $0x0,0x153a0(%rbx)
   14012795f:	vmovdqa %xmm0,0x15390(%rbx)
   140127967:	call   140103240 <setun::VM::handle_tafpu_todbl(setun::Chunk const&)>
   14012796c:	mov    0x1060(%rbx),%rax
   140127973:	mov    0x1048(%rbx),%r11
   14012797a:	mov    0x1038(%rbx),%r12
   140127981:	mov    0x150c0(%rbx),%rbp
   140127988:	lea    (%r11,%rax,8),%r13
   14012798c:	mov    0x1050(%rbx),%rax
   140127993:	add    %r15,%r12
   140127996:	mov    %rax,0x30(%rsp)
   14012799b:	test   %rbp,%rbp
   14012799e:	je     1401279ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x33fd>
   1401279a0:	lea    -0x5(%rbp,%rbp,4),%rdx
   1401279a5:	mov    0x10c8(%rbx,%rdx,8),%rbp
   1401279ad:	cmpb   $0x0,0x1040(%rbx)
   1401279b4:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   1401279ba:	mov    %r12,%rax
   1401279bd:	lea    0x2996dc(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401279c4:	lea    0x1(%r12),%r12
   1401279c9:	xor    %esi,%esi
   1401279cb:	movzbl (%rax),%eax
   1401279ce:	mov    (%rdi,%rax,8),%rax
   1401279d2:	jmp    *%rax
   1401279d4:	cmp    $0x2,%sil
   1401279d8:	je     14012c976 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83c6>
   1401279de:	cmp    $0x1,%sil
   1401279e2:	je     14012ec6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6bb>
   1401279e8:	mov    0x1048(%rbx),%r11
   1401279ef:	mov    0x1050(%rbx),%rax
   1401279f6:	vzeroupper
   1401279f9:	sub    %r11,%r13
   1401279fc:	sub    %r15,%r12
   1401279ff:	sub    %r11,%rax
   140127a02:	mov    %r13,%rsi
   140127a05:	mov    %r12,0x1038(%rbx)
   140127a0c:	sar    $0x3,%rsi
   140127a10:	cmp    %r13,%rax
   140127a13:	jb     14012e120 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b70>
   140127a19:	vmovdqa 0x23609f(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127a21:	mov    %rsi,0x1060(%rbx)
   140127a28:	mov    %r14,%rdx
   140127a2b:	mov    %rbx,%rcx
   140127a2e:	movb   $0x0,0x153a0(%rbx)
   140127a35:	vmovdqa %xmm0,0x15390(%rbx)
   140127a3d:	call   14010c260 <setun::VM::handle_print(setun::Chunk const&)>
   140127a42:	mov    0x1060(%rbx),%rax
   140127a49:	mov    0x1048(%rbx),%r11
   140127a50:	mov    0x1038(%rbx),%r12
   140127a57:	mov    0x150c0(%rbx),%rbp
   140127a5e:	lea    (%r11,%rax,8),%r13
   140127a62:	mov    0x1050(%rbx),%rax
   140127a69:	add    %r15,%r12
   140127a6c:	mov    %rax,0x30(%rsp)
   140127a71:	test   %rbp,%rbp
   140127a74:	je     140127a83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x34d3>
   140127a76:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127a7b:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127a83:	cmpb   $0x0,0x1040(%rbx)
   140127a8a:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127a90:	mov    %r12,%rax
   140127a93:	lea    0x299606(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127a9a:	lea    0x1(%r12),%r12
   140127a9f:	xor    %esi,%esi
   140127aa1:	movzbl (%rax),%eax
   140127aa4:	mov    (%rdi,%rax,8),%rax
   140127aa8:	jmp    *%rax
   140127aaa:	cmp    $0x2,%sil
   140127aae:	je     14012b98a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73da>
   140127ab4:	cmp    $0x1,%sil
   140127ab8:	je     14012ea2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa47c>
   140127abe:	mov    0x1048(%rbx),%r11
   140127ac5:	mov    0x1050(%rbx),%rax
   140127acc:	vzeroupper
   140127acf:	sub    %r11,%r13
   140127ad2:	sub    %r15,%r12
   140127ad5:	sub    %r11,%rax
   140127ad8:	mov    %r13,%rsi
   140127adb:	mov    %r12,0x1038(%rbx)
   140127ae2:	sar    $0x3,%rsi
   140127ae6:	cmp    %r13,%rax
   140127ae9:	jb     14012e0cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b1c>
   140127aef:	vmovdqa 0x235fc9(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127af7:	mov    %rsi,0x1060(%rbx)
   140127afe:	mov    %r14,%rdx
   140127b01:	mov    %rbx,%rcx
   140127b04:	movb   $0x0,0x153a0(%rbx)
   140127b0b:	vmovdqa %xmm0,0x15390(%rbx)
   140127b13:	call   140104f30 <setun::VM::handle_gfx_draw_circle(setun::Chunk const&)>
   140127b18:	mov    0x1060(%rbx),%rax
   140127b1f:	mov    0x1048(%rbx),%r11
   140127b26:	mov    0x1038(%rbx),%r12
   140127b2d:	mov    0x150c0(%rbx),%rbp
   140127b34:	lea    (%r11,%rax,8),%r13
   140127b38:	mov    0x1050(%rbx),%rax
   140127b3f:	add    %r15,%r12
   140127b42:	mov    %rax,0x30(%rsp)
   140127b47:	test   %rbp,%rbp
   140127b4a:	je     140127b59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35a9>
   140127b4c:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127b51:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127b59:	cmpb   $0x0,0x1040(%rbx)
   140127b60:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127b66:	mov    %r12,%rax
   140127b69:	lea    0x299530(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127b70:	lea    0x1(%r12),%r12
   140127b75:	xor    %esi,%esi
   140127b77:	movzbl (%rax),%eax
   140127b7a:	mov    (%rdi,%rax,8),%rax
   140127b7e:	jmp    *%rax
   140127b80:	cmp    $0x2,%sil
   140127b84:	je     14012b9ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x741e>
   140127b8a:	cmp    $0x1,%sil
   140127b8e:	je     14012e9f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa445>
   140127b94:	mov    0x1048(%rbx),%r11
   140127b9b:	mov    0x1050(%rbx),%rax
   140127ba2:	vzeroupper
   140127ba5:	sub    %r11,%r13
   140127ba8:	sub    %r15,%r12
   140127bab:	sub    %r11,%rax
   140127bae:	mov    %r13,%rsi
   140127bb1:	mov    %r12,0x1038(%rbx)
   140127bb8:	sar    $0x3,%rsi
   140127bbc:	cmp    %r13,%rax
   140127bbf:	jb     14012e14a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b9a>
   140127bc5:	vmovdqa 0x235ef3(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127bcd:	mov    %rsi,0x1060(%rbx)
   140127bd4:	mov    %r14,%rdx
   140127bd7:	mov    %rbx,%rcx
   140127bda:	movb   $0x0,0x153a0(%rbx)
   140127be1:	vmovdqa %xmm0,0x15390(%rbx)
   140127be9:	call   14010cef0 <setun::VM::handle_gfx_draw_text(setun::Chunk const&)>
   140127bee:	mov    0x1060(%rbx),%rax
   140127bf5:	mov    0x1048(%rbx),%r11
   140127bfc:	mov    0x1038(%rbx),%r12
   140127c03:	mov    0x150c0(%rbx),%rbp
   140127c0a:	lea    (%r11,%rax,8),%r13
   140127c0e:	mov    0x1050(%rbx),%rax
   140127c15:	add    %r15,%r12
   140127c18:	mov    %rax,0x30(%rsp)
   140127c1d:	test   %rbp,%rbp
   140127c20:	je     140127c2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x367f>
   140127c22:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127c27:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127c2f:	cmpb   $0x0,0x1040(%rbx)
   140127c36:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127c3c:	mov    %r12,%rax
   140127c3f:	lea    0x29945a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127c46:	lea    0x1(%r12),%r12
   140127c4b:	xor    %esi,%esi
   140127c4d:	movzbl (%rax),%eax
   140127c50:	mov    (%rdi,%rax,8),%rax
   140127c54:	jmp    *%rax
   140127c56:	cmp    $0x2,%sil
   140127c5a:	je     14012ba56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74a6>
   140127c60:	cmp    $0x1,%sil
   140127c64:	je     14012ecd9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa729>
   140127c6a:	mov    0x1048(%rbx),%r11
   140127c71:	mov    0x1050(%rbx),%rax
   140127c78:	vzeroupper
   140127c7b:	sub    %r11,%r13
   140127c7e:	sub    %r15,%r12
   140127c81:	sub    %r11,%rax
   140127c84:	mov    %r13,%rsi
   140127c87:	mov    %r12,0x1038(%rbx)
   140127c8e:	sar    $0x3,%rsi
   140127c92:	cmp    %r13,%rax
   140127c95:	jb     14012e135 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b85>
   140127c9b:	vmovdqa 0x235e1d(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127ca3:	mov    %rsi,0x1060(%rbx)
   140127caa:	mov    %r14,%rdx
   140127cad:	mov    %rbx,%rcx
   140127cb0:	movb   $0x0,0x153a0(%rbx)
   140127cb7:	vmovdqa %xmm0,0x15390(%rbx)
   140127cbf:	call   140100520 <setun::VM::handle_gfx_flip(setun::Chunk const&)>
   140127cc4:	mov    0x1060(%rbx),%rax
   140127ccb:	mov    0x1048(%rbx),%r11
   140127cd2:	mov    0x1038(%rbx),%r12
   140127cd9:	mov    0x150c0(%rbx),%rbp
   140127ce0:	lea    (%r11,%rax,8),%r13
   140127ce4:	mov    0x1050(%rbx),%rax
   140127ceb:	add    %r15,%r12
   140127cee:	mov    %rax,0x30(%rsp)
   140127cf3:	test   %rbp,%rbp
   140127cf6:	je     140127d05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3755>
   140127cf8:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127cfd:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127d05:	cmpb   $0x0,0x1040(%rbx)
   140127d0c:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127d12:	mov    %r12,%rax
   140127d15:	lea    0x299384(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127d1c:	lea    0x1(%r12),%r12
   140127d21:	xor    %esi,%esi
   140127d23:	movzbl (%rax),%eax
   140127d26:	mov    (%rdi,%rax,8),%rax
   140127d2a:	jmp    *%rax
   140127d2c:	cmp    $0x2,%sil
   140127d30:	je     14012bade <setun::VM::run_optimized(setun::OptimizedChunk&)+0x752e>
   140127d36:	cmp    $0x1,%sil
   140127d3a:	je     14012ee23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa873>
   140127d40:	mov    0x1048(%rbx),%r11
   140127d47:	mov    0x1050(%rbx),%rax
   140127d4e:	vzeroupper
   140127d51:	sub    %r11,%r13
   140127d54:	sub    %r15,%r12
   140127d57:	sub    %r11,%rax
   140127d5a:	mov    %r13,%rsi
   140127d5d:	mov    %r12,0x1038(%rbx)
   140127d64:	sar    $0x3,%rsi
   140127d68:	cmp    %r13,%rax
   140127d6b:	jb     14012e174 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bc4>
   140127d71:	vmovdqa 0x235d47(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127d79:	mov    %rsi,0x1060(%rbx)
   140127d80:	mov    %r14,%rdx
   140127d83:	mov    %rbx,%rcx
   140127d86:	movb   $0x0,0x153a0(%rbx)
   140127d8d:	vmovdqa %xmm0,0x15390(%rbx)
   140127d95:	call   1401005c0 <setun::VM::handle_gfx_get_key(setun::Chunk const&)>
   140127d9a:	mov    0x1060(%rbx),%rax
   140127da1:	mov    0x1048(%rbx),%r11
   140127da8:	mov    0x1038(%rbx),%r12
   140127daf:	mov    0x150c0(%rbx),%rbp
   140127db6:	lea    (%r11,%rax,8),%r13
   140127dba:	mov    0x1050(%rbx),%rax
   140127dc1:	add    %r15,%r12
   140127dc4:	mov    %rax,0x30(%rsp)
   140127dc9:	test   %rbp,%rbp
   140127dcc:	je     140127ddb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x382b>
   140127dce:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127dd3:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127ddb:	cmpb   $0x0,0x1040(%rbx)
   140127de2:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127de8:	mov    %r12,%rax
   140127deb:	lea    0x2992ae(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127df2:	lea    0x1(%r12),%r12
   140127df7:	xor    %esi,%esi
   140127df9:	movzbl (%rax),%eax
   140127dfc:	mov    (%rdi,%rax,8),%rax
   140127e00:	jmp    *%rax
   140127e02:	cmp    $0x2,%sil
   140127e06:	je     14012ba12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7462>
   140127e0c:	cmp    $0x1,%sil
   140127e10:	je     14012eeff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa94f>
   140127e16:	mov    0x1048(%rbx),%r11
   140127e1d:	mov    0x1050(%rbx),%rax
   140127e24:	vzeroupper
   140127e27:	sub    %r11,%r13
   140127e2a:	sub    %r15,%r12
   140127e2d:	sub    %r11,%rax
   140127e30:	mov    %r13,%rsi
   140127e33:	mov    %r12,0x1038(%rbx)
   140127e3a:	sar    $0x3,%rsi
   140127e3e:	cmp    %r13,%rax
   140127e41:	jb     14012e15f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9baf>
   140127e47:	vmovdqa 0x235c71(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127e4f:	mov    %rsi,0x1060(%rbx)
   140127e56:	mov    %r14,%rdx
   140127e59:	mov    %rbx,%rcx
   140127e5c:	movb   $0x0,0x153a0(%rbx)
   140127e63:	vmovdqa %xmm0,0x15390(%rbx)
   140127e6b:	call   1400fe7a0 <setun::VM::handle_gfx_close(setun::Chunk const&)>
   140127e70:	mov    0x1060(%rbx),%rax
   140127e77:	mov    0x1048(%rbx),%r11
   140127e7e:	mov    0x1038(%rbx),%r12
   140127e85:	mov    0x150c0(%rbx),%rbp
   140127e8c:	lea    (%r11,%rax,8),%r13
   140127e90:	mov    0x1050(%rbx),%rax
   140127e97:	add    %r15,%r12
   140127e9a:	mov    %rax,0x30(%rsp)
   140127e9f:	test   %rbp,%rbp
   140127ea2:	je     140127eb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3901>
   140127ea4:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127ea9:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127eb1:	cmpb   $0x0,0x1040(%rbx)
   140127eb8:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127ebe:	mov    %r12,%rax
   140127ec1:	lea    0x2991d8(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127ec8:	lea    0x1(%r12),%r12
   140127ecd:	xor    %esi,%esi
   140127ecf:	movzbl (%rax),%eax
   140127ed2:	mov    (%rdi,%rax,8),%rax
   140127ed6:	jmp    *%rax
   140127ed8:	cmp    $0x2,%sil
   140127edc:	je     14012bb22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7572>
   140127ee2:	cmp    $0x1,%sil
   140127ee6:	je     14012e7e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa233>
   140127eec:	mov    0x1048(%rbx),%r11
   140127ef3:	mov    0x1050(%rbx),%rax
   140127efa:	vzeroupper
   140127efd:	sub    %r11,%r13
   140127f00:	sub    %r15,%r12
   140127f03:	sub    %r11,%rax
   140127f06:	mov    %r13,%rsi
   140127f09:	mov    %r12,0x1038(%rbx)
   140127f10:	sar    $0x3,%rsi
   140127f14:	cmp    %r13,%rax
   140127f17:	jb     14012e19e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bee>
   140127f1d:	vmovdqa 0x235b9b(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127f25:	mov    %rsi,0x1060(%rbx)
   140127f2c:	mov    %r14,%rdx
   140127f2f:	mov    %rbx,%rcx
   140127f32:	movb   $0x0,0x153a0(%rbx)
   140127f39:	vmovdqa %xmm0,0x15390(%rbx)
   140127f41:	call   1401045b0 <setun::VM::handle_nn_create_dense(setun::Chunk const&)>
   140127f46:	mov    0x1060(%rbx),%rax
   140127f4d:	mov    0x1048(%rbx),%r11
   140127f54:	mov    0x1038(%rbx),%r12
   140127f5b:	mov    0x150c0(%rbx),%rbp
   140127f62:	lea    (%r11,%rax,8),%r13
   140127f66:	mov    0x1050(%rbx),%rax
   140127f6d:	add    %r15,%r12
   140127f70:	mov    %rax,0x30(%rsp)
   140127f75:	test   %rbp,%rbp
   140127f78:	je     140127f87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x39d7>
   140127f7a:	lea    -0x5(%rbp,%rbp,4),%rdx
   140127f7f:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140127f87:	cmpb   $0x0,0x1040(%rbx)
   140127f8e:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140127f94:	mov    %r12,%rax
   140127f97:	lea    0x299102(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140127f9e:	lea    0x1(%r12),%r12
   140127fa3:	xor    %esi,%esi
   140127fa5:	movzbl (%rax),%eax
   140127fa8:	mov    (%rdi,%rax,8),%rax
   140127fac:	jmp    *%rax
   140127fae:	cmp    $0x2,%sil
   140127fb2:	je     14012ba9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74ea>
   140127fb8:	cmp    $0x1,%sil
   140127fbc:	je     14012e707 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa157>
   140127fc2:	mov    0x1048(%rbx),%r11
   140127fc9:	mov    0x1050(%rbx),%rax
   140127fd0:	vzeroupper
   140127fd3:	sub    %r11,%r13
   140127fd6:	sub    %r15,%r12
   140127fd9:	sub    %r11,%rax
   140127fdc:	mov    %r13,%rsi
   140127fdf:	mov    %r12,0x1038(%rbx)
   140127fe6:	sar    $0x3,%rsi
   140127fea:	cmp    %r13,%rax
   140127fed:	jb     14012e189 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9bd9>
   140127ff3:	vmovdqa 0x235ac5(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140127ffb:	mov    %rsi,0x1060(%rbx)
   140128002:	mov    %r14,%rdx
   140128005:	mov    %rbx,%rcx
   140128008:	movb   $0x0,0x153a0(%rbx)
   14012800f:	vmovdqa %xmm0,0x15390(%rbx)
   140128017:	call   1401047e0 <setun::VM::handle_nn_set_weight(setun::Chunk const&)>
   14012801c:	mov    0x1060(%rbx),%rax
   140128023:	mov    0x1048(%rbx),%r11
   14012802a:	mov    0x1038(%rbx),%r12
   140128031:	mov    0x150c0(%rbx),%rbp
   140128038:	lea    (%r11,%rax,8),%r13
   14012803c:	mov    0x1050(%rbx),%rax
   140128043:	add    %r15,%r12
   140128046:	mov    %rax,0x30(%rsp)
   14012804b:	test   %rbp,%rbp
   14012804e:	je     14012805d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3aad>
   140128050:	lea    -0x5(%rbp,%rbp,4),%rdx
   140128055:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012805d:	cmpb   $0x0,0x1040(%rbx)
   140128064:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012806a:	mov    %r12,%rax
   14012806d:	lea    0x29902c(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128074:	lea    0x1(%r12),%r12
   140128079:	xor    %esi,%esi
   14012807b:	movzbl (%rax),%eax
   14012807e:	mov    (%rdi,%rax,8),%rax
   140128082:	jmp    *%rax
   140128084:	cmp    $0x2,%sil
   140128088:	je     14012bb66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75b6>
   14012808e:	cmp    $0x1,%sil
   140128092:	je     14012eca2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6f2>
   140128098:	mov    0x1048(%rbx),%r11
   14012809f:	mov    0x1050(%rbx),%rax
   1401280a6:	vzeroupper
   1401280a9:	sub    %r11,%r13
   1401280ac:	sub    %r15,%r12
   1401280af:	sub    %r11,%rax
   1401280b2:	mov    %r13,%rsi
   1401280b5:	mov    %r12,0x1038(%rbx)
   1401280bc:	sar    $0x3,%rsi
   1401280c0:	cmp    %r13,%rax
   1401280c3:	jb     14012e08d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9add>
   1401280c9:	vmovdqa 0x2359ef(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401280d1:	mov    %rsi,0x1060(%rbx)
   1401280d8:	mov    %r14,%rdx
   1401280db:	mov    %rbx,%rcx
   1401280de:	movb   $0x0,0x153a0(%rbx)
   1401280e5:	vmovdqa %xmm0,0x15390(%rbx)
   1401280ed:	call   140103960 <setun::VM::handle_nn_set_bias(setun::Chunk const&)>
   1401280f2:	mov    0x1060(%rbx),%rax
   1401280f9:	mov    0x1048(%rbx),%r11
   140128100:	mov    0x1038(%rbx),%r12
   140128107:	mov    0x150c0(%rbx),%rbp
   14012810e:	lea    (%r11,%rax,8),%r13
   140128112:	mov    0x1050(%rbx),%rax
   140128119:	add    %r15,%r12
   14012811c:	mov    %rax,0x30(%rsp)
   140128121:	test   %rbp,%rbp
   140128124:	je     140128133 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b83>
   140128126:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012812b:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140128133:	cmpb   $0x0,0x1040(%rbx)
   14012813a:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140128140:	mov    %r12,%rax
   140128143:	lea    0x298f56(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012814a:	lea    0x1(%r12),%r12
   14012814f:	xor    %esi,%esi
   140128151:	movzbl (%rax),%eax
   140128154:	mov    (%rdi,%rax,8),%rax
   140128158:	jmp    *%rax
   14012815a:	cmp    $0x2,%sil
   14012815e:	je     14012c8ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x833e>
   140128164:	cmp    $0x1,%sil
   140128168:	je     14012eaf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa549>
   14012816e:	mov    0x1048(%rbx),%r11
   140128175:	mov    0x1050(%rbx),%rax
   14012817c:	vzeroupper
   14012817f:	sub    %r11,%r13
   140128182:	sub    %r15,%r12
   140128185:	sub    %r11,%rax
   140128188:	mov    %r13,%rsi
   14012818b:	mov    %r12,0x1038(%rbx)
   140128192:	sar    $0x3,%rsi
   140128196:	cmp    %r13,%rax
   140128199:	jb     14012e0a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9af2>
   14012819f:	vmovdqa 0x235919(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401281a7:	mov    %rsi,0x1060(%rbx)
   1401281ae:	mov    %r14,%rdx
   1401281b1:	mov    %rbx,%rcx
   1401281b4:	movb   $0x0,0x153a0(%rbx)
   1401281bb:	vmovdqa %xmm0,0x15390(%rbx)
   1401281c3:	call   14010d7e0 <setun::VM::handle_gfx_init(setun::Chunk const&)>
   1401281c8:	mov    0x1060(%rbx),%rax
   1401281cf:	mov    0x1048(%rbx),%r11
   1401281d6:	mov    0x1038(%rbx),%r12
   1401281dd:	mov    0x150c0(%rbx),%rbp
   1401281e4:	lea    (%r11,%rax,8),%r13
   1401281e8:	mov    0x1050(%rbx),%rax
   1401281ef:	add    %r15,%r12
   1401281f2:	mov    %rax,0x30(%rsp)
   1401281f7:	test   %rbp,%rbp
   1401281fa:	je     140128209 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3c59>
   1401281fc:	lea    -0x5(%rbp,%rbp,4),%rdx
   140128201:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140128209:	cmpb   $0x0,0x1040(%rbx)
   140128210:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140128216:	mov    %r12,%rax
   140128219:	lea    0x298e80(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128220:	lea    0x1(%r12),%r12
   140128225:	xor    %esi,%esi
   140128227:	movzbl (%rax),%eax
   14012822a:	mov    (%rdi,%rax,8),%rax
   14012822e:	jmp    *%rax
   140128230:	cmp    $0x2,%sil
   140128234:	je     14012b70d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x715d>
   14012823a:	cmp    $0x1,%sil
   14012823e:	je     14012e7ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1fc>
   140128244:	mov    0x1048(%rbx),%r11
   14012824b:	mov    0x1050(%rbx),%rax
   140128252:	vzeroupper
   140128255:	sub    %r11,%r13
   140128258:	sub    %r15,%r12
   14012825b:	sub    %r11,%rax
   14012825e:	mov    %r13,%rsi
   140128261:	mov    %r12,0x1038(%rbx)
   140128268:	sar    $0x3,%rsi
   14012826c:	cmp    %r13,%rax
   14012826f:	jb     14012e1dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c2d>
   140128275:	vmovdqa 0x235843(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012827d:	mov    %rsi,0x1060(%rbx)
   140128284:	mov    %r14,%rdx
   140128287:	mov    %rbx,%rcx
   14012828a:	movb   $0x0,0x153a0(%rbx)
   140128291:	vmovdqa %xmm0,0x15390(%rbx)
   140128299:	call   1401014a0 <setun::VM::handle_gfx_is_running(setun::Chunk const&)>
   14012829e:	mov    0x1060(%rbx),%rax
   1401282a5:	mov    0x1048(%rbx),%r11
   1401282ac:	mov    0x1038(%rbx),%r12
   1401282b3:	mov    0x150c0(%rbx),%rbp
   1401282ba:	lea    (%r11,%rax,8),%r13
   1401282be:	mov    0x1050(%rbx),%rax
   1401282c5:	add    %r15,%r12
   1401282c8:	mov    %rax,0x30(%rsp)
   1401282cd:	test   %rbp,%rbp
   1401282d0:	je     1401282df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d2f>
   1401282d2:	lea    -0x5(%rbp,%rbp,4),%rdx
   1401282d7:	mov    0x10c8(%rbx,%rdx,8),%rbp
   1401282df:	cmpb   $0x0,0x1040(%rbx)
   1401282e6:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   1401282ec:	mov    %r12,%rax
   1401282ef:	lea    0x298daa(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401282f6:	lea    0x1(%r12),%r12
   1401282fb:	xor    %esi,%esi
   1401282fd:	movzbl (%rax),%eax
   140128300:	mov    (%rdi,%rax,8),%rax
   140128304:	jmp    *%rax
   140128306:	mov    %r12,%rax
   140128309:	lea    0x2(%r12),%r12
   14012830e:	movzwl (%rax),%edi
   140128311:	add    %rbp,%rdi
   140128314:	cmp    0x15268(%rbx),%rdi
   14012831b:	jae    140130433 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe83>
   140128321:	mov    0x1070(%rbx),%rax
   140128328:	sub    0x1068(%rbx),%rax
   14012832f:	sar    $0x3,%rax
   140128333:	cmp    %rax,%rdi
   140128336:	jae    140130961 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3b1>
   14012833c:	cmp    $0x1,%sil
   140128340:	jne    14013093c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc38c>
   140128346:	mov    0x1068(%rbx),%rax
   14012834d:	mov    0x1c8(%rsp),%rdx
   140128355:	xor    %esi,%esi
   140128357:	mov    %rdx,(%rax,%rdi,8)
   14012835b:	cmpb   $0x0,0x1040(%rbx)
   140128362:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128368:	mov    %r12,%rax
   14012836b:	lea    0x298d2e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128372:	lea    0x1(%r12),%r12
   140128377:	movzbl (%rax),%eax
   14012837a:	jmp    *(%rdi,%rax,8)
   14012837d:	movzwl (%r12),%r9d
   140128382:	movzwl 0x2(%r12),%r8d
   140128388:	add    $0x4,%r12
   14012838c:	mov    0x1068(%rbx),%rdi
   140128393:	test   %sil,%sil
   140128396:	jne    1401308ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc34f>
   14012839c:	movzwl %r9w,%eax
   1401283a0:	add    %rbp,%rax
   1401283a3:	mov    (%rdi,%rax,8),%rax
   1401283a7:	mov    %rax,0x1d0(%rsp)
   1401283af:	movzwl %r8w,%eax
   1401283b3:	add    %rbp,%rax
   1401283b6:	mov    (%rdi,%rax,8),%rax
   1401283ba:	mov    %rax,0x1c8(%rsp)
   1401283c2:	cmpb   $0x0,0x1040(%rbx)
   1401283c9:	je     1401308f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc340>
   1401283cf:	mov    %r12,%rax
   1401283d2:	lea    0x298cc7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401283d9:	lea    0x1(%r12),%r12
   1401283de:	mov    $0x2,%esi
   1401283e3:	movzbl (%rax),%eax
   1401283e6:	mov    (%rdi,%rax,8),%rax
   1401283ea:	jmp    *%rax
   1401283ec:	mov    %r12,%rdi
   1401283ef:	movzwl (%r12),%r10d
   1401283f4:	movzwl 0x2(%r12),%eax
   1401283fa:	lea    0x6(%r12),%r12
   1401283ff:	movzwl 0x4(%rdi),%r9d
   140128404:	add    %rbp,%r9
   140128407:	cmp    0x15268(%rbx),%r9
   14012840e:	jae    140130e99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8e9>
   140128414:	mov    0x1070(%rbx),%rcx
   14012841b:	sub    0x1068(%rbx),%rcx
   140128422:	sar    $0x3,%rcx
   140128426:	cmp    %rcx,%r9
   140128429:	jae    140130e5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc8af>
   14012842f:	mov    0x1068(%rbx),%rdx
   140128436:	movzwl %r10w,%ecx
   14012843a:	movzwl %ax,%eax
   14012843d:	movabs $0xfff8000000000000,%r10
   140128447:	add    %rbp,%rcx
   14012844a:	add    %rbp,%rax
   14012844d:	lea    (%rdx,%rcx,8),%r11
   140128451:	lea    (%rdx,%rax,8),%rax
   140128455:	movabs $0xffff000000000000,%rcx
   14012845f:	mov    (%r11),%r8
   140128462:	mov    %rax,0x40(%rsp)
   140128467:	mov    %r8,%rax
   14012846a:	and    %rcx,%rax
   14012846d:	cmp    %r10,%rax
   140128470:	je     14012b5d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7027>
   140128476:	mov    %r9,0x60(%rsp)
   14012847b:	mov    0x40(%rsp),%rdx
   140128480:	mov    %r11,%rcx
   140128483:	vzeroupper
   140128486:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   14012848b:	mov    0x1068(%rbx),%rdx
   140128492:	mov    0x60(%rsp),%r9
   140128497:	mov    %rax,(%rdx,%r9,8)
   14012849b:	cmpb   $0x0,0x1040(%rbx)
   1401284a2:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401284a8:	movzbl 0x6(%rdi),%eax
   1401284ac:	lea    0x7(%rdi),%r12
   1401284b0:	lea    0x298be9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401284b7:	jmp    *(%rdi,%rax,8)
   1401284ba:	mov    %r12,%rdi
   1401284bd:	movzwl (%r12),%r9d
   1401284c2:	lea    0x8(%r12),%r12
   1401284c7:	movzwl -0x6(%r12),%r8d
   1401284cd:	movzwl 0x6(%rdi),%edx
   1401284d1:	movzwl -0x4(%r12),%eax
   1401284d7:	lea    (%rdx,%rbp,1),%rcx
   1401284db:	mov    %rcx,0x40(%rsp)
   1401284e0:	cmp    0x15268(%rbx),%rcx
   1401284e7:	jae    14013148d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcedd>
   1401284ed:	mov    0x1070(%rbx),%rcx
   1401284f4:	sub    0x1068(%rbx),%rcx
   1401284fb:	sar    $0x3,%rcx
   1401284ff:	cmp    %rcx,0x40(%rsp)
   140128504:	jae    1401311ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcbfd>
   14012850a:	mov    0x1068(%rbx),%rdx
   140128511:	movzwl %r9w,%ecx
   140128515:	movzwl %ax,%eax
   140128518:	add    %rbp,%rcx
   14012851b:	add    %rbp,%rax
   14012851e:	lea    (%rdx,%rcx,8),%r11
   140128522:	movzwl %r8w,%ecx
   140128526:	lea    (%rdx,%rax,8),%rax
   14012852a:	movabs $0xffff000000000000,%r8
   140128534:	mov    (%r11),%r10
   140128537:	add    %rbp,%rcx
   14012853a:	mov    %rax,0x60(%rsp)
   14012853f:	movabs $0xfff8000000000000,%rax
   140128549:	lea    (%rdx,%rcx,8),%r9
   14012854d:	mov    %r10,%rcx
   140128550:	mov    %r9,0x80(%rsp)
   140128558:	and    %r8,%rcx
   14012855b:	cmp    %rax,%rcx
   14012855e:	jne    140130bb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc604>
   140128564:	mov    (%r9),%rax
   140128567:	mov    %rax,%r9
   14012856a:	and    %r8,%r9
   14012856d:	cmp    %rcx,%r9
   140128570:	jne    14012d7f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9243>
   140128576:	mov    0x60(%rsp),%rcx
   14012857b:	mov    (%rcx),%rcx
   14012857e:	and    %rcx,%r8
   140128581:	mov    %r8,0xa0(%rsp)
   140128589:	cmp    %r9,%r8
   14012858c:	jne    14012d7f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9243>
   140128592:	shl    $0x10,%rax
   140128596:	mov    %r10,%r9
   140128599:	shl    $0x10,%rcx
   14012859d:	shl    $0x10,%r9
   1401285a1:	sar    $0x10,%rax
   1401285a5:	mov    %r9,%r8
   1401285a8:	sar    $0x10,%rcx
   1401285ac:	sar    $0x10,%r8
   1401285b0:	imul   %rax,%r8
   1401285b4:	lea    (%r8,%rcx,1),%rax
   1401285b8:	movabs $0x800000000000,%rcx
   1401285c2:	movabs $0xffffffffffff,%r8
   1401285cc:	add    %rax,%rcx
   1401285cf:	cmp    %rcx,%r8
   1401285d2:	jb     14012d7f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9243>
   1401285d8:	mov    0x40(%rsp),%rcx
   1401285dd:	and    %r8,%rax
   1401285e0:	or     0xa0(%rsp),%rax
   1401285e8:	mov    %rax,(%rdx,%rcx,8)
   1401285ec:	cmpb   $0x0,0x1040(%rbx)
   1401285f3:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   1401285f9:	movzbl 0x8(%rdi),%eax
   1401285fd:	lea    0x9(%rdi),%r12
   140128601:	lea    0x298a98(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128608:	jmp    *(%rdi,%rax,8)
   14012860b:	mov    %r12,%rdi
   14012860e:	mov    0xb8(%r14),%rax
   140128615:	lea    0x2(%r12),%r12
   14012861a:	movzwl (%rdi),%edx
   14012861d:	lea    (%rax,%rdx,8),%r9
   140128621:	cmp    $0x2,%sil
   140128625:	jne    140130f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc9d6>
   14012862b:	mov    0x1d0(%rsp),%rdx
   140128633:	movabs $0xffff000000000000,%rax
   14012863d:	movabs $0xfffd000000000000,%rcx
   140128647:	and    %rdx,%rax
   14012864a:	cmp    %rcx,%rax
   14012864d:	je     14012d427 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e77>
   140128653:	mov    0x1c8(%rsp),%rax
   14012865b:	xor    %esi,%esi
   14012865d:	mov    %rax,0x3f0(%rsp)
   140128665:	cmpb   $0x0,0x1040(%rbx)
   14012866c:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128672:	mov    %r12,%rax
   140128675:	lea    0x298a24(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012867c:	lea    0x1(%r12),%r12
   140128681:	movzbl (%rax),%eax
   140128684:	jmp    *(%rdi,%rax,8)
   140128687:	mov    %r12,%rax
   14012868a:	movzbl 0x2(%r12),%edi
   140128690:	lea    0x3(%r12),%r12
   140128695:	movzwl (%rax),%eax
   140128698:	shl    $0x4,%rax
   14012869c:	add    0xd0(%r14),%rax
   1401286a3:	mov    %rax,0x40(%rsp)
   1401286a8:	test   %dil,%dil
   1401286ab:	je     14012b170 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bc0>
   1401286b1:	cmp    $0x1,%dil
   1401286b5:	je     14012f473 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaec3>
   1401286bb:	test   %sil,%sil
   1401286be:	jne    14012f453 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaea3>
   1401286c4:	movzbl %dil,%edx
   1401286c8:	mov    %r13,%rax
   1401286cb:	movabs $0xfffd000200000000,%rcx
   1401286d5:	shl    $0x3,%rdx
   1401286d9:	sub    %rdx,%rax
   1401286dc:	mov    -0x8(%rax),%rdx
   1401286e0:	movabs $0xffffffff00000000,%rax
   1401286ea:	and    %rdx,%rax
   1401286ed:	cmp    %rcx,%rax
   1401286f0:	je     14012fdcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb81f>
   1401286f6:	mov    0x1048(%rbx),%r11
   1401286fd:	mov    0x1050(%rbx),%rax
   140128704:	vzeroupper
   140128707:	sub    %r11,%r13
   14012870a:	sub    %r15,%r12
   14012870d:	sub    %r11,%rax
   140128710:	mov    %r13,%rsi
   140128713:	mov    %r12,0x1038(%rbx)
   14012871a:	sar    $0x3,%rsi
   14012871e:	cmp    %r13,%rax
   140128721:	jb     14012e450 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ea0>
   140128727:	mov    0x40(%rsp),%rax
   14012872c:	movzbl %dil,%r9d
   140128730:	mov    %r14,%rdx
   140128733:	mov    %rbx,%rcx
   140128736:	movb   $0x0,0x153a0(%rbx)
   14012873d:	vmovdqa 0x23537b(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140128745:	mov    %rsi,0x1060(%rbx)
   14012874c:	movzwl 0xa(%rax),%r8d
   140128751:	vmovdqa %xmm0,0x15390(%rbx)
   140128759:	call   140115400 <setun::VM::handle_invoke_method_direct(setun::Chunk const&, unsigned short, unsigned char)>
   14012875e:	mov    0x1060(%rbx),%rax
   140128765:	mov    0x1038(%rbx),%r12
   14012876c:	mov    0x1048(%rbx),%r11
   140128773:	mov    0x150c0(%rbx),%rbp
   14012877a:	add    %r15,%r12
   14012877d:	lea    (%r11,%rax,8),%r13
   140128781:	test   %rbp,%rbp
   140128784:	je     140128793 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x41e3>
   140128786:	lea    -0x5(%rbp,%rbp,4),%rax
   14012878b:	mov    0x10c8(%rbx,%rax,8),%rbp
   140128793:	cmpb   $0x0,0x1040(%rbx)
   14012879a:	mov    0x1050(%rbx),%rax
   1401287a1:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   1401287a7:	mov    %rax,0x30(%rsp)
   1401287ac:	mov    %r12,%rax
   1401287af:	lea    0x2988ea(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401287b6:	xor    %esi,%esi
   1401287b8:	movzbl (%rax),%eax
   1401287bb:	lea    0x1(%r12),%r12
   1401287c0:	mov    (%rdi,%rax,8),%rax
   1401287c4:	jmp    *%rax
   1401287c6:	mov    %r12,%rdi
   1401287c9:	movzwl (%r12),%eax
   1401287ce:	movzwl 0x2(%r12),%r10d
   1401287d4:	lea    0x6(%r12),%r12
   1401287d9:	movzwl 0x4(%rdi),%r9d
   1401287de:	add    %rbp,%r9
   1401287e1:	cmp    0x15268(%rbx),%r9
   1401287e8:	jae    140130882 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc2d2>
   1401287ee:	mov    0x1070(%rbx),%rcx
   1401287f5:	sub    0x1068(%rbx),%rcx
   1401287fc:	sar    $0x3,%rcx
   140128800:	cmp    %rcx,%r9
   140128803:	jae    140130848 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc298>
   140128809:	mov    0x1068(%rbx),%r11
   140128810:	movzwl %ax,%eax
   140128813:	movabs $0xffff000000000000,%rdx
   14012881d:	add    %rbp,%rax
   140128820:	lea    (%r11,%rax,8),%rax
   140128824:	mov    %rax,0x40(%rsp)
   140128829:	mov    (%rax),%rax
   14012882c:	and    %rax,%rdx
   14012882f:	mov    %rdx,%r8
   140128832:	movabs $0xfff8000000000000,%rdx
   14012883c:	cmp    %rdx,%r8
   14012883f:	jne    14012d93b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x938b>
   140128845:	shl    $0x10,%rax
   140128849:	movswq %r10w,%rdx
   14012884d:	movabs $0x800000000000,%rcx
   140128857:	movabs $0xffffffffffff,%r10
   140128861:	sar    $0x10,%rax
   140128865:	add    %rdx,%rax
   140128868:	add    %rax,%rcx
   14012886b:	cmp    %rcx,%r10
   14012886e:	jb     14012d93f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x938f>
   140128874:	and    %r10,%rax
   140128877:	or     %r8,%rax
   14012887a:	mov    %rax,(%r11,%r9,8)
   14012887e:	cmpb   $0x0,0x1040(%rbx)
   140128885:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012888b:	movzbl 0x6(%rdi),%eax
   14012888f:	lea    0x7(%rdi),%r12
   140128893:	lea    0x298806(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012889a:	jmp    *(%rdi,%rax,8)
   14012889d:	movzwl 0x4(%r12),%eax
   1401288a3:	mov    %r12,%rdi
   1401288a6:	movabs $0xfffd000300000000,%r8
   1401288b0:	movzwl 0x2(%r12),%r11d
   1401288b6:	movzwl (%rdi),%edx
   1401288b9:	movzwl 0x6(%r12),%r10d
   1401288bf:	lea    0xa(%r12),%r12
   1401288c4:	mov    %ax,0x60(%rsp)
   1401288c9:	movzwl -0x2(%r12),%eax
   1401288cf:	add    %rbp,%rdx
   1401288d2:	mov    %ax,0x40(%rsp)
   1401288d7:	mov    0x1068(%rbx),%rax
   1401288de:	lea    (%rax,%rdx,8),%r9
   1401288e2:	movabs $0xffffffff00000000,%rdx
   1401288ec:	mov    (%r9),%rcx
   1401288ef:	and    %rdx,%rcx
   1401288f2:	cmp    %r8,%rcx
   1401288f5:	je     14012fa11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb461>
   1401288fb:	cmpb   $0x0,0x1040(%rbx)
   140128902:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128908:	movzbl 0xa(%rdi),%eax
   14012890c:	lea    0xb(%rdi),%r12
   140128910:	lea    0x298789(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128917:	jmp    *(%rdi,%rax,8)
   14012891a:	cmp    $0x1,%sil
   14012891e:	jne    1401303e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe38>
   140128924:	mov    0x1068(%rbx),%rax
   14012892b:	mov    0x1c8(%rsp),%rdx
   140128933:	xor    %esi,%esi
   140128935:	mov    %rdx,(%rax,%rbp,8)
   140128939:	cmpb   $0x0,0x1040(%rbx)
   140128940:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128946:	mov    %r12,%rax
   140128949:	lea    0x298750(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128950:	lea    0x1(%r12),%r12
   140128955:	movzbl (%rax),%eax
   140128958:	jmp    *(%rdi,%rax,8)
   14012895b:	cmp    $0x1,%sil
   14012895f:	jne    1401303c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe12>
   140128965:	mov    0x1068(%rbx),%rax
   14012896c:	mov    0x1c8(%rsp),%rdx
   140128974:	xor    %esi,%esi
   140128976:	mov    %rdx,0x8(%rax,%rbp,8)
   14012897b:	cmpb   $0x0,0x1040(%rbx)
   140128982:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128988:	mov    %r12,%rax
   14012898b:	lea    0x29870e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128992:	lea    0x1(%r12),%r12
   140128997:	movzbl (%rax),%eax
   14012899a:	jmp    *(%rdi,%rax,8)
   14012899d:	cmp    $0x1,%sil
   1401289a1:	jne    14013040d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbe5d>
   1401289a7:	mov    0x1068(%rbx),%rax
   1401289ae:	mov    0x1c8(%rsp),%rdx
   1401289b6:	xor    %esi,%esi
   1401289b8:	mov    %rdx,0x10(%rax,%rbp,8)
   1401289bd:	cmpb   $0x0,0x1040(%rbx)
   1401289c4:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   1401289ca:	mov    %r12,%rax
   1401289cd:	lea    0x2986cc(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401289d4:	lea    0x1(%r12),%r12
   1401289d9:	movzbl (%rax),%eax
   1401289dc:	jmp    *(%rdi,%rax,8)
   1401289df:	cmp    $0x1,%sil
   1401289e3:	jne    14013039c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdec>
   1401289e9:	mov    0x1068(%rbx),%rax
   1401289f0:	mov    0x1c8(%rsp),%rdx
   1401289f8:	xor    %esi,%esi
   1401289fa:	mov    %rdx,0x18(%rax,%rbp,8)
   1401289ff:	cmpb   $0x0,0x1040(%rbx)
   140128a06:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128a0c:	mov    %r12,%rax
   140128a0f:	lea    0x29868a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128a16:	lea    0x1(%r12),%r12
   140128a1b:	movzbl (%rax),%eax
   140128a1e:	jmp    *(%rdi,%rax,8)
   140128a21:	lea    -0x8(%r13),%rdx
   140128a25:	lea    0x1c8(%rsp),%rax
   140128a2d:	test   %sil,%sil
   140128a30:	cmove  %rdx,%rax
   140128a34:	mov    0x1068(%rbx),%rdx
   140128a3b:	mov    (%rax),%rax
   140128a3e:	mov    %rax,0x8(%rdx,%rbp,8)
   140128a43:	cmpb   $0x0,0x1040(%rbx)
   140128a4a:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128a50:	mov    %r12,%rax
   140128a53:	lea    0x298646(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128a5a:	lea    0x1(%r12),%r12
   140128a5f:	movzbl (%rax),%eax
   140128a62:	jmp    *(%rdi,%rax,8)
   140128a65:	lea    -0x8(%r13),%rdx
   140128a69:	lea    0x1c8(%rsp),%rax
   140128a71:	test   %sil,%sil
   140128a74:	cmove  %rdx,%rax
   140128a78:	mov    0x1068(%rbx),%rdx
   140128a7f:	mov    (%rax),%rax
   140128a82:	mov    %rax,0x10(%rdx,%rbp,8)
   140128a87:	cmpb   $0x0,0x1040(%rbx)
   140128a8e:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128a94:	mov    %r12,%rax
   140128a97:	lea    0x298602(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128a9e:	lea    0x1(%r12),%r12
   140128aa3:	movzbl (%rax),%eax
   140128aa6:	jmp    *(%rdi,%rax,8)
   140128aa9:	lea    -0x8(%r13),%rdx
   140128aad:	lea    0x1c8(%rsp),%rax
   140128ab5:	test   %sil,%sil
   140128ab8:	cmove  %rdx,%rax
   140128abc:	mov    0x1068(%rbx),%rdx
   140128ac3:	mov    (%rax),%rax
   140128ac6:	mov    %rax,0x18(%rdx,%rbp,8)
   140128acb:	cmpb   $0x0,0x1040(%rbx)
   140128ad2:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128ad8:	mov    %r12,%rax
   140128adb:	lea    0x2985be(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128ae2:	lea    0x1(%r12),%r12
   140128ae7:	movzbl (%rax),%eax
   140128aea:	jmp    *(%rdi,%rax,8)
   140128aed:	mov    %r12,%r8
   140128af0:	movzwl 0x2(%r12),%edi
   140128af6:	lea    0x4(%r12),%r12
   140128afb:	movzwl (%r8),%eax
   140128aff:	lea    (%rax,%rbp,1),%r9
   140128b03:	cmp    0x15268(%rbx),%r9
   140128b0a:	jae    140131619 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd069>
   140128b10:	mov    0x1068(%rbx),%rax
   140128b17:	movabs $0xffff000000000000,%rdx
   140128b21:	movabs $0xfff8000000000000,%rcx
   140128b2b:	lea    (%rax,%r9,8),%r9
   140128b2f:	mov    (%r9),%rax
   140128b32:	and    %rax,%rdx
   140128b35:	cmp    %rcx,%rdx
   140128b38:	jne    14012d8db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x932b>
   140128b3e:	shl    $0x10,%rax
   140128b42:	movswq %di,%rcx
   140128b46:	movabs $0x800000000000,%r10
   140128b50:	movabs $0xffffffffffff,%r11
   140128b5a:	sar    $0x10,%rax
   140128b5e:	add    %rcx,%rax
   140128b61:	add    %rax,%r10
   140128b64:	cmp    %r10,%r11
   140128b67:	jb     14012d8df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x932f>
   140128b6d:	and    %r11,%rax
   140128b70:	or     %rdx,%rax
   140128b73:	mov    %rax,(%r9)
   140128b76:	cmpb   $0x0,0x1040(%rbx)
   140128b7d:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128b83:	movzbl 0x4(%r8),%eax
   140128b88:	lea    0x298511(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128b8f:	lea    0x5(%r8),%r12
   140128b93:	jmp    *(%rdi,%rax,8)
   140128b96:	movabs $0xfffb000000000000,%rax
   140128ba0:	mov    %rax,0x330(%rsp)
   140128ba8:	mov    %rax,0x338(%rsp)
   140128bb0:	cmp    $0x2,%sil
   140128bb4:	jne    140130340 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd90>
   140128bba:	mov    0x1c8(%rsp),%rax
   140128bc2:	mov    %rax,0x338(%rsp)
   140128bca:	mov    0x1d0(%rsp),%rax
   140128bd2:	mov    %rax,0x330(%rsp)
   140128bda:	xor    %esi,%esi
   140128bdc:	movabs $0xffffffff00000000,%rax
   140128be6:	movabs $0xfffd000300000000,%rdx
   140128bf0:	and    0x330(%rsp),%rax
   140128bf8:	cmp    %rdx,%rax
   140128bfb:	je     1401300c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbb15>
   140128c01:	mov    0x330(%rsp),%rdx
   140128c09:	movabs $0xffff000000000000,%rax
   140128c13:	movabs $0xfffd000000000000,%rcx
   140128c1d:	and    %rdx,%rax
   140128c20:	cmp    %rcx,%rax
   140128c23:	je     14012d504 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f54>
   140128c29:	test   %sil,%sil
   140128c2c:	je     14012e05c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aac>
   140128c32:	cmp    $0x1,%sil
   140128c36:	je     140128c59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a9>
   140128c38:	lea    0x8(%r13),%rax
   140128c3c:	cmp    0x30(%rsp),%rax
   140128c41:	jae    1401359cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1141d>
   140128c47:	mov    0x1d0(%rsp),%rdx
   140128c4f:	mov    %r13,%rax
   140128c52:	lea    0x8(%r13),%r13
   140128c56:	mov    %rdx,(%rax)
   140128c59:	mov    0x1c8(%rsp),%rax
   140128c61:	mov    %rax,0x1d0(%rsp)
   140128c69:	movabs $0xfff8000000000000,%rax
   140128c73:	mov    %rax,0x1c8(%rsp)
   140128c7b:	mov    $0x2,%esi
   140128c80:	cmpb   $0x0,0x1040(%rbx)
   140128c87:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   140128c8d:	mov    %r12,%rax
   140128c90:	lea    0x298409(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128c97:	lea    0x1(%r12),%r12
   140128c9c:	movzbl (%rax),%eax
   140128c9f:	jmp    *(%rdi,%rax,8)
   140128ca2:	movabs $0xfffb000000000000,%rax
   140128cac:	mov    %rax,0x340(%rsp)
   140128cb4:	mov    %rax,0x348(%rsp)
   140128cbc:	cmp    $0x1,%sil
   140128cc0:	jne    140130480 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbed0>
   140128cc6:	mov    0x1c8(%rsp),%rax
   140128cce:	xor    %esi,%esi
   140128cd0:	mov    %rax,0x340(%rsp)
   140128cd8:	mov    -0x8(%r13),%rdx
   140128cdc:	mov    %r13,%rax
   140128cdf:	lea    -0x10(%r13),%r13
   140128ce3:	mov    %rdx,0x348(%rsp)
   140128ceb:	mov    -0x10(%rax),%r8
   140128cef:	movabs $0xffff000000000000,%rdx
   140128cf9:	mov    %r8,%rcx
   140128cfc:	movabs $0xfffd000000000000,%rax
   140128d06:	and    %rdx,%rcx
   140128d09:	cmp    %rax,%rcx
   140128d0c:	je     14012b536 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f86>
   140128d12:	cmpb   $0x0,0x1040(%rbx)
   140128d19:	je     14012f240 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac90>
   140128d1f:	mov    %r12,%rax
   140128d22:	lea    0x298377(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128d29:	lea    0x1(%r12),%r12
   140128d2e:	movzbl (%rax),%eax
   140128d31:	jmp    *(%rdi,%rax,8)
   140128d34:	movzwl 0x2(%r12),%edi
   140128d3a:	mov    %r12,%rax
   140128d3d:	mov    0x1068(%rbx),%rdx
   140128d44:	movzwl 0x6(%rax),%ecx
   140128d48:	movzwl 0x4(%r12),%r12d
   140128d4e:	mov    %di,0x40(%rsp)
   140128d53:	lea    0x8(%rax),%rdi
   140128d57:	movzwl (%rax),%eax
   140128d5a:	mov    %cx,0x60(%rsp)
   140128d5f:	add    %rbp,%rax
   140128d62:	lea    (%rdx,%rax,8),%rcx
   140128d66:	vzeroupper
   140128d69:	call   14021b2c0 <setun::VMValue::as_int() const>
   140128d6e:	mov    0x1068(%rbx),%rdx
   140128d75:	mov    %rax,0x80(%rsp)
   140128d7d:	movzwl 0x40(%rsp),%eax
   140128d82:	add    %rbp,%rax
   140128d85:	lea    (%rdx,%rax,8),%rcx
   140128d89:	call   14021b2c0 <setun::VMValue::as_int() const>
   140128d8e:	mov    0x1068(%rbx),%rdx
   140128d95:	mov    %rax,0x40(%rsp)
   140128d9a:	movzwl %r12w,%eax
   140128d9e:	add    %rbp,%rax
   140128da1:	lea    (%rdx,%rax,8),%rcx
   140128da5:	call   14021b2c0 <setun::VMValue::as_int() const>
   140128daa:	test   %rax,%rax
   140128dad:	je     1401307af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1ff>
   140128db3:	mov    0x40(%rsp),%rcx
   140128db8:	jle    14012b392 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6de2>
   140128dbe:	cmp    %rcx,0x80(%rsp)
   140128dc6:	setl   %al
   140128dc9:	movswq 0x60(%rsp),%r12
   140128dcf:	add    %rdi,%r12
   140128dd2:	test   %al,%al
   140128dd4:	cmovne %rdi,%r12
   140128dd8:	cmpb   $0x0,0x1040(%rbx)
   140128ddf:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140128de5:	mov    %r12,%rax
   140128de8:	lea    0x2982b1(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128def:	movzbl (%rax),%eax
   140128df2:	lea    0x1(%r12),%r12
   140128df7:	jmp    *(%rdi,%rax,8)
   140128dfa:	movabs $0xfffb000000000000,%rax
   140128e04:	mov    %rax,0x358(%rsp)
   140128e0c:	mov    %rax,0x360(%rsp)
   140128e14:	cmp    $0x2,%sil
   140128e18:	jne    140130b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5a8>
   140128e1e:	mov    0x1c8(%rsp),%rax
   140128e26:	mov    %rax,0x360(%rsp)
   140128e2e:	mov    0x1d0(%rsp),%rax
   140128e36:	mov    %rax,0x358(%rsp)
   140128e3e:	mov    $0x1,%esi
   140128e43:	mov    0x358(%rsp),%rdx
   140128e4b:	movabs $0xffff000000000000,%rax
   140128e55:	movabs $0xfff8000000000000,%rcx
   140128e5f:	mov    %rdx,%r8
   140128e62:	and    %rax,%r8
   140128e65:	cmp    %rcx,%r8
   140128e68:	je     14012b4bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6f0f>
   140128e6e:	movb   $0x20,-0x1(%r12)
   140128e74:	lea    0x360(%rsp),%rdx
   140128e7c:	lea    0x358(%rsp),%rcx
   140128e84:	mov    %r12,%rdi
   140128e87:	vzeroupper
   140128e8a:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   140128e8f:	mov    %rax,0x1c8(%rsp)
   140128e97:	cmpb   $0x0,0x1040(%rbx)
   140128e9e:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140128ea4:	movzbl (%rdi),%eax
   140128ea7:	lea    0x2981f2(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128eae:	lea    0x1(%r12),%r12
   140128eb3:	jmp    *(%rdi,%rax,8)
   140128eb6:	movabs $0xfffb000000000000,%rax
   140128ec0:	mov    %rax,0x368(%rsp)
   140128ec8:	mov    %rax,0x370(%rsp)
   140128ed0:	cmp    $0x2,%sil
   140128ed4:	jne    14013170b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd15b>
   140128eda:	mov    0x1c8(%rsp),%rax
   140128ee2:	mov    %rax,0x370(%rsp)
   140128eea:	mov    0x1d0(%rsp),%rax
   140128ef2:	mov    %rax,0x368(%rsp)
   140128efa:	mov    $0x1,%esi
   140128eff:	mov    0x368(%rsp),%rax
   140128f07:	movabs $0xffff000000000000,%rdx
   140128f11:	movabs $0xfff8000000000000,%r8
   140128f1b:	mov    %rax,%rcx
   140128f1e:	and    %rdx,%rcx
   140128f21:	cmp    %r8,%rcx
   140128f24:	je     14012b816 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7266>
   140128f2a:	movb   $0x21,-0x1(%r12)
   140128f30:	lea    0x370(%rsp),%rdx
   140128f38:	lea    0x368(%rsp),%rcx
   140128f40:	mov    %r12,%rdi
   140128f43:	vzeroupper
   140128f46:	call   14021afe0 <setun::VMValue::sub(setun::VMValue const&) const>
   140128f4b:	mov    %rax,0x1c8(%rsp)
   140128f53:	cmpb   $0x0,0x1040(%rbx)
   140128f5a:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140128f60:	movzbl (%rdi),%eax
   140128f63:	lea    0x298136(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140128f6a:	lea    0x1(%r12),%r12
   140128f6f:	jmp    *(%rdi,%rax,8)
   140128f72:	movabs $0xfffb000000000000,%rax
   140128f7c:	mov    %rax,0x378(%rsp)
   140128f84:	mov    %rax,0x380(%rsp)
   140128f8c:	cmp    $0x2,%sil
   140128f90:	jne    14013036e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbdbe>
   140128f96:	mov    0x1c8(%rsp),%rax
   140128f9e:	mov    %rax,0x380(%rsp)
   140128fa6:	mov    0x1d0(%rsp),%rax
   140128fae:	mov    %rax,0x378(%rsp)
   140128fb6:	mov    $0x1,%esi
   140128fbb:	mov    0x378(%rsp),%rdx
   140128fc3:	movabs $0xffff000000000000,%rax
   140128fcd:	movabs $0xfff8000000000000,%rcx
   140128fd7:	mov    %rdx,%r8
   140128fda:	and    %rax,%r8
   140128fdd:	cmp    %rcx,%r8
   140128fe0:	je     14012b651 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x70a1>
   140128fe6:	movb   $0x22,-0x1(%r12)
   140128fec:	lea    0x380(%rsp),%rdx
   140128ff4:	lea    0x378(%rsp),%rcx
   140128ffc:	mov    %r12,%rdi
   140128fff:	vzeroupper
   140129002:	call   14021a760 <setun::VMValue::mul(setun::VMValue const&) const>
   140129007:	mov    %rax,0x1c8(%rsp)
   14012900f:	cmpb   $0x0,0x1040(%rbx)
   140129016:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   14012901c:	movzbl (%rdi),%eax
   14012901f:	lea    0x29807a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129026:	lea    0x1(%r12),%r12
   14012902b:	jmp    *(%rdi,%rax,8)
   14012902e:	movabs $0xfffb000000000000,%rax
   140129038:	mov    %rax,0x388(%rsp)
   140129040:	mov    %rax,0x390(%rsp)
   140129048:	cmp    $0x2,%sil
   14012904c:	jne    140130b86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc5d6>
   140129052:	mov    0x1c8(%rsp),%rax
   14012905a:	mov    %rax,0x390(%rsp)
   140129062:	mov    0x1d0(%rsp),%rax
   14012906a:	mov    %rax,0x388(%rsp)
   140129072:	mov    $0x1,%esi
   140129077:	mov    0x388(%rsp),%rdx
   14012907f:	movabs $0xffff000000000000,%rax
   140129089:	movabs $0xfff8000000000000,%rcx
   140129093:	and    %rax,%rdx
   140129096:	cmp    %rcx,%rdx
   140129099:	je     14012c424 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e74>
   14012909f:	movb   $0x32,-0x1(%r12)
   1401290a5:	mov    0x388(%rsp),%rdx
   1401290ad:	mov    %r12,%rdi
   1401290b0:	movabs $0xffff000000000000,%rcx
   1401290ba:	movabs $0xfff8000000000000,%r8
   1401290c4:	mov    %rdx,%rax
   1401290c7:	and    %rcx,%rax
   1401290ca:	cmp    %r8,%rax
   1401290cd:	je     14012d308 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d58>
   1401290d3:	movabs $0xfffd000000000000,%r8
   1401290dd:	cmp    %r8,%rax
   1401290e0:	je     14012d2fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8d4b>
   1401290e6:	movabs $0xfff7ffffffffffff,%rax
   1401290f0:	cmp    %rdx,%rax
   1401290f3:	jae    14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   1401290f9:	movabs $0xfffc000000000000,%r9
   140129103:	cmp    %r9,%rdx
   140129106:	je     14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   14012910c:	mov    0x390(%rsp),%rdx
   140129114:	cmp    %r9,%rdx
   140129117:	je     14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   14012911d:	cmp    %rdx,%rax
   140129120:	jae    14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   140129126:	and    %rdx,%rcx
   140129129:	cmp    %r8,%rcx
   14012912c:	je     140131d2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd77f>
   140129132:	lea    0x388(%rsp),%rcx
   14012913a:	vzeroupper
   14012913d:	call   14021b2c0 <setun::VMValue::as_int() const>
   140129142:	lea    0x390(%rsp),%rcx
   14012914a:	mov    %rax,0x40(%rsp)
   14012914f:	call   14021b2c0 <setun::VMValue::as_int() const>
   140129154:	cmp    %rax,0x40(%rsp)
   140129159:	setl   %al
   14012915c:	movabs $0xfffa000000000000,%rdx
   140129166:	movzbl %al,%eax
   140129169:	add    %rdx,%rax
   14012916c:	mov    %rax,0x1c8(%rsp)
   140129174:	cmpb   $0x0,0x1040(%rbx)
   14012917b:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140129181:	movzbl (%rdi),%eax
   140129184:	lea    0x1(%rdi),%r12
   140129188:	lea    0x297f11(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012918f:	jmp    *(%rdi,%rax,8)
   140129192:	movabs $0xfffb000000000000,%rax
   14012919c:	mov    %rax,0x398(%rsp)
   1401291a4:	mov    %rax,0x3a0(%rsp)
   1401291ac:	cmp    $0x2,%sil
   1401291b0:	jne    140130e31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc881>
   1401291b6:	mov    0x1c8(%rsp),%rax
   1401291be:	mov    %rax,0x3a0(%rsp)
   1401291c6:	mov    0x1d0(%rsp),%rax
   1401291ce:	mov    %rax,0x398(%rsp)
   1401291d6:	mov    $0x1,%esi
   1401291db:	mov    0x398(%rsp),%rdx
   1401291e3:	movabs $0xffff000000000000,%rax
   1401291ed:	movabs $0xfff8000000000000,%rcx
   1401291f7:	and    %rax,%rdx
   1401291fa:	cmp    %rcx,%rdx
   1401291fd:	je     14012c3bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7e0b>
   140129203:	movb   $0x33,-0x1(%r12)
   140129209:	mov    0x398(%rsp),%rdx
   140129211:	mov    %r12,%rdi
   140129214:	movabs $0xffff000000000000,%rcx
   14012921e:	movabs $0xfff8000000000000,%r8
   140129228:	mov    %rdx,%rax
   14012922b:	and    %rcx,%rax
   14012922e:	cmp    %r8,%rax
   140129231:	je     14012d1e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c36>
   140129237:	movabs $0xfffd000000000000,%r8
   140129241:	cmp    %r8,%rax
   140129244:	je     14012d1d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c29>
   14012924a:	movabs $0xfff7ffffffffffff,%rax
   140129254:	cmp    %rdx,%rax
   140129257:	jae    14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   14012925d:	movabs $0xfffc000000000000,%r9
   140129267:	cmp    %r9,%rdx
   14012926a:	je     14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   140129270:	mov    0x3a0(%rsp),%rdx
   140129278:	cmp    %r9,%rdx
   14012927b:	je     14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   140129281:	cmp    %rdx,%rax
   140129284:	jae    14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   14012928a:	and    %rdx,%rcx
   14012928d:	cmp    %r8,%rcx
   140129290:	je     140131ba7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5f7>
   140129296:	lea    0x398(%rsp),%rcx
   14012929e:	vzeroupper
   1401292a1:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401292a6:	lea    0x3a0(%rsp),%rcx
   1401292ae:	mov    %rax,0x40(%rsp)
   1401292b3:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401292b8:	cmp    %rax,0x40(%rsp)
   1401292bd:	setle  %al
   1401292c0:	movabs $0xfffa000000000000,%rdx
   1401292ca:	movzbl %al,%eax
   1401292cd:	add    %rdx,%rax
   1401292d0:	mov    %rax,0x1c8(%rsp)
   1401292d8:	cmpb   $0x0,0x1040(%rbx)
   1401292df:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401292e5:	movzbl (%rdi),%eax
   1401292e8:	lea    0x1(%rdi),%r12
   1401292ec:	lea    0x297dad(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401292f3:	jmp    *(%rdi,%rax,8)
   1401292f6:	movabs $0xfffb000000000000,%rax
   140129300:	mov    %rax,0x3a8(%rsp)
   140129308:	mov    %rax,0x3b0(%rsp)
   140129310:	cmp    $0x2,%sil
   140129314:	jne    140130e03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc853>
   14012931a:	mov    0x1c8(%rsp),%rax
   140129322:	mov    %rax,0x3b0(%rsp)
   14012932a:	mov    0x1d0(%rsp),%rax
   140129332:	mov    %rax,0x3a8(%rsp)
   14012933a:	mov    $0x1,%esi
   14012933f:	mov    0x3a8(%rsp),%rdx
   140129347:	movabs $0xffff000000000000,%rax
   140129351:	movabs $0xfff8000000000000,%rcx
   14012935b:	and    %rax,%rdx
   14012935e:	cmp    %rcx,%rdx
   140129361:	je     14012c2f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d44>
   140129367:	movb   $0x30,-0x1(%r12)
   14012936d:	mov    0x3a8(%rsp),%rdx
   140129375:	mov    %r12,%rdi
   140129378:	movabs $0xffff000000000000,%rcx
   140129382:	movabs $0xfff8000000000000,%r9
   14012938c:	mov    %rdx,%rax
   14012938f:	and    %rcx,%rax
   140129392:	cmp    %r9,%rax
   140129395:	je     14012cfa1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89f1>
   14012939b:	movabs $0xfffd000000000000,%r9
   1401293a5:	cmp    %r9,%rax
   1401293a8:	je     14012cf94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x89e4>
   1401293ae:	movabs $0xfff7ffffffffffff,%rax
   1401293b8:	cmp    %rdx,%rax
   1401293bb:	jae    14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   1401293c1:	movabs $0xfffc000000000000,%r10
   1401293cb:	cmp    %r10,%rdx
   1401293ce:	je     14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   1401293d4:	mov    0x3b0(%rsp),%rdx
   1401293dc:	cmp    %r10,%rdx
   1401293df:	je     14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   1401293e5:	cmp    %rdx,%rax
   1401293e8:	jae    14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   1401293ee:	and    %rdx,%rcx
   1401293f1:	cmp    %r9,%rcx
   1401293f4:	je     1401326e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe130>
   1401293fa:	lea    0x3a8(%rsp),%rcx
   140129402:	vzeroupper
   140129405:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012940a:	lea    0x3b0(%rsp),%rcx
   140129412:	mov    %rax,0x40(%rsp)
   140129417:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012941c:	cmp    %rax,0x40(%rsp)
   140129421:	sete   %r8b
   140129425:	movabs $0xfffa000000000000,%rdx
   14012942f:	movzbl %r8b,%eax
   140129433:	add    %rdx,%rax
   140129436:	mov    %rax,0x1c8(%rsp)
   14012943e:	cmpb   $0x0,0x1040(%rbx)
   140129445:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   14012944b:	movzbl (%rdi),%eax
   14012944e:	lea    0x1(%rdi),%r12
   140129452:	lea    0x297c47(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129459:	jmp    *(%rdi,%rax,8)
   14012945c:	movabs $0xfffb000000000000,%rax
   140129466:	mov    %rax,0x3b8(%rsp)
   14012946e:	mov    %rax,0x3c0(%rsp)
   140129476:	cmp    $0x2,%sil
   14012947a:	jne    140130738 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc188>
   140129480:	mov    0x1c8(%rsp),%rax
   140129488:	mov    %rax,0x3c0(%rsp)
   140129490:	mov    0x1d0(%rsp),%rax
   140129498:	mov    %rax,0x3b8(%rsp)
   1401294a0:	mov    $0x1,%esi
   1401294a5:	mov    0x3b8(%rsp),%rdx
   1401294ad:	movabs $0xffff000000000000,%rax
   1401294b7:	movabs $0xfff8000000000000,%rcx
   1401294c1:	and    %rax,%rdx
   1401294c4:	cmp    %rcx,%rdx
   1401294c7:	je     14012bbaa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75fa>
   1401294cd:	movb   $0x34,-0x1(%r12)
   1401294d3:	mov    0x3b8(%rsp),%rdx
   1401294db:	mov    %r12,%rdi
   1401294de:	movabs $0xffff000000000000,%rcx
   1401294e8:	movabs $0xfff8000000000000,%r8
   1401294f2:	mov    %rdx,%rax
   1401294f5:	and    %rcx,%rax
   1401294f8:	cmp    %r8,%rax
   1401294fb:	je     14012ce7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88cf>
   140129501:	movabs $0xfffd000000000000,%r8
   14012950b:	cmp    %r8,%rax
   14012950e:	je     14012ce72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x88c2>
   140129514:	movabs $0xfff7ffffffffffff,%rax
   14012951e:	cmp    %rdx,%rax
   140129521:	jae    14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   140129527:	movabs $0xfffc000000000000,%r9
   140129531:	cmp    %r9,%rdx
   140129534:	je     14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   14012953a:	mov    0x3c0(%rsp),%rdx
   140129542:	cmp    %r9,%rdx
   140129545:	je     14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   14012954b:	cmp    %rdx,%rax
   14012954e:	jae    14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   140129554:	and    %rdx,%rcx
   140129557:	cmp    %r8,%rcx
   14012955a:	je     140131c6b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6bb>
   140129560:	lea    0x3b8(%rsp),%rcx
   140129568:	vzeroupper
   14012956b:	call   14021b2c0 <setun::VMValue::as_int() const>
   140129570:	lea    0x3c0(%rsp),%rcx
   140129578:	mov    %rax,0x40(%rsp)
   14012957d:	call   14021b2c0 <setun::VMValue::as_int() const>
   140129582:	cmp    %rax,0x40(%rsp)
   140129587:	setg   %al
   14012958a:	movabs $0xfffa000000000000,%rdx
   140129594:	movzbl %al,%eax
   140129597:	add    %rdx,%rax
   14012959a:	mov    %rax,0x1c8(%rsp)
   1401295a2:	cmpb   $0x0,0x1040(%rbx)
   1401295a9:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401295af:	movzbl (%rdi),%eax
   1401295b2:	lea    0x1(%rdi),%r12
   1401295b6:	lea    0x297ae3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401295bd:	jmp    *(%rdi,%rax,8)
   1401295c0:	movabs $0xfffb000000000000,%rax
   1401295ca:	mov    %rax,0x3c8(%rsp)
   1401295d2:	mov    %rax,0x3d0(%rsp)
   1401295da:	cmp    $0x2,%sil
   1401295de:	jne    1401315b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd006>
   1401295e4:	mov    0x1c8(%rsp),%rax
   1401295ec:	mov    %rax,0x3d0(%rsp)
   1401295f4:	mov    0x1d0(%rsp),%rax
   1401295fc:	mov    %rax,0x3c8(%rsp)
   140129604:	mov    $0x1,%esi
   140129609:	mov    0x3c8(%rsp),%rdx
   140129611:	movabs $0xffff000000000000,%rax
   14012961b:	movabs $0xfff8000000000000,%rcx
   140129625:	and    %rax,%rdx
   140129628:	cmp    %rcx,%rdx
   14012962b:	je     14012c352 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7da2>
   140129631:	movb   $0x35,-0x1(%r12)
   140129637:	mov    0x3c8(%rsp),%rdx
   14012963f:	mov    %r12,%rdi
   140129642:	movabs $0xffff000000000000,%rcx
   14012964c:	movabs $0xfff8000000000000,%r8
   140129656:	mov    %rdx,%rax
   140129659:	and    %rcx,%rax
   14012965c:	cmp    %r8,%rax
   14012965f:	je     14012d0c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b14>
   140129665:	movabs $0xfffd000000000000,%r8
   14012966f:	cmp    %r8,%rax
   140129672:	je     14012d0b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b07>
   140129678:	movabs $0xfff7ffffffffffff,%rax
   140129682:	cmp    %rdx,%rax
   140129685:	jae    14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   14012968b:	movabs $0xfffc000000000000,%r9
   140129695:	cmp    %r9,%rdx
   140129698:	je     14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   14012969e:	mov    0x3d0(%rsp),%rdx
   1401296a6:	cmp    %r9,%rdx
   1401296a9:	je     14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   1401296af:	cmp    %rdx,%rax
   1401296b2:	jae    14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   1401296b8:	and    %rdx,%rcx
   1401296bb:	cmp    %r8,%rcx
   1401296be:	je     140132117 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb67>
   1401296c4:	lea    0x3c8(%rsp),%rcx
   1401296cc:	vzeroupper
   1401296cf:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401296d4:	lea    0x3d0(%rsp),%rcx
   1401296dc:	mov    %rax,0x40(%rsp)
   1401296e1:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401296e6:	cmp    %rax,0x40(%rsp)
   1401296eb:	setge  %al
   1401296ee:	movabs $0xfffa000000000000,%rdx
   1401296f8:	movzbl %al,%eax
   1401296fb:	add    %rdx,%rax
   1401296fe:	mov    %rax,0x1c8(%rsp)
   140129706:	cmpb   $0x0,0x1040(%rbx)
   14012970d:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   140129713:	movzbl (%rdi),%eax
   140129716:	lea    0x1(%rdi),%r12
   14012971a:	lea    0x29797f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129721:	jmp    *(%rdi,%rax,8)
   140129724:	mov    %r12,%rdi
   140129727:	mov    0xb8(%r14),%rax
   14012972e:	lea    0x2(%r12),%r12
   140129733:	movzwl (%rdi),%edx
   140129736:	lea    (%rax,%rdx,8),%r9
   14012973a:	test   %sil,%sil
   14012973d:	je     140131250 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcca0>
   140129743:	movabs $0xffffffff00000000,%rax
   14012974d:	movabs $0xfffd000200000000,%rdx
   140129757:	and    0x1c8(%rsp),%rax
   14012975f:	cmp    %rdx,%rax
   140129762:	je     14012d778 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x91c8>
   140129768:	cmp    $0x1,%sil
   14012976c:	jne    14012d9a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x93f8>
   140129772:	mov    0x1c8(%rsp),%rax
   14012977a:	movabs $0xffff000000000000,%rdx
   140129784:	movabs $0xfffd000000000000,%rcx
   14012978e:	and    %rax,%rdx
   140129791:	mov    %rax,0x3e0(%rsp)
   140129799:	cmp    %rcx,%rdx
   14012979c:	je     14012e484 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed4>
   1401297a2:	mov    $0x1,%esi
   1401297a7:	movabs $0xfff8000000000000,%rax
   1401297b1:	mov    %rax,0x1c8(%rsp)
   1401297b9:	cmpb   $0x0,0x1040(%rbx)
   1401297c0:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   1401297c6:	mov    %r12,%rax
   1401297c9:	lea    0x2978d0(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401297d0:	lea    0x1(%r12),%r12
   1401297d5:	movzbl (%rax),%eax
   1401297d8:	jmp    *(%rdi,%rax,8)
   1401297db:	cmp    $0x2,%sil
   1401297df:	je     14012c7a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81f3>
   1401297e5:	cmp    $0x1,%sil
   1401297e9:	je     14012ef6d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9bd>
   1401297ef:	mov    0x1048(%rbx),%r11
   1401297f6:	mov    0x1050(%rbx),%rax
   1401297fd:	vzeroupper
   140129800:	sub    %r11,%r13
   140129803:	sub    %r15,%r12
   140129806:	sub    %r11,%rax
   140129809:	mov    %r13,%rsi
   14012980c:	mov    %r12,0x1038(%rbx)
   140129813:	sar    $0x3,%rsi
   140129817:	cmp    %r13,%rax
   14012981a:	jb     14012e295 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ce5>
   140129820:	vmovdqa 0x234298(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129828:	mov    %rsi,0x1060(%rbx)
   14012982f:	mov    %r14,%rdx
   140129832:	mov    %rbx,%rcx
   140129835:	movb   $0x0,0x153a0(%rbx)
   14012983c:	vmovdqa %xmm0,0x15390(%rbx)
   140129844:	call   140101140 <setun::VM::handle_gfx_clear(setun::Chunk const&)>
   140129849:	mov    0x1060(%rbx),%rax
   140129850:	mov    0x1048(%rbx),%r11
   140129857:	mov    0x1038(%rbx),%r12
   14012985e:	mov    0x150c0(%rbx),%rbp
   140129865:	lea    (%r11,%rax,8),%r13
   140129869:	mov    0x1050(%rbx),%rax
   140129870:	add    %r15,%r12
   140129873:	mov    %rax,0x30(%rsp)
   140129878:	test   %rbp,%rbp
   14012987b:	je     14012988a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x52da>
   14012987d:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129882:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012988a:	cmpb   $0x0,0x1040(%rbx)
   140129891:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129897:	mov    %r12,%rax
   14012989a:	lea    0x2977ff(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401298a1:	lea    0x1(%r12),%r12
   1401298a6:	xor    %esi,%esi
   1401298a8:	movzbl (%rax),%eax
   1401298ab:	mov    (%rdi,%rax,8),%rax
   1401298af:	jmp    *%rax
   1401298b1:	cmp    $0x2,%sil
   1401298b5:	je     14012c75f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81af>
   1401298bb:	cmp    $0x1,%sil
   1401298bf:	je     14012f049 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa99>
   1401298c5:	mov    0x1048(%rbx),%r11
   1401298cc:	mov    0x1050(%rbx),%rax
   1401298d3:	vzeroupper
   1401298d6:	sub    %r11,%r13
   1401298d9:	sub    %r15,%r12
   1401298dc:	sub    %r11,%rax
   1401298df:	mov    %r13,%rsi
   1401298e2:	mov    %r12,0x1038(%rbx)
   1401298e9:	sar    $0x3,%rsi
   1401298ed:	cmp    %r13,%rax
   1401298f0:	jb     14012e2aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cfa>
   1401298f6:	vmovdqa 0x2341c2(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401298fe:	mov    %rsi,0x1060(%rbx)
   140129905:	mov    %r14,%rdx
   140129908:	mov    %rbx,%rcx
   14012990b:	movb   $0x0,0x153a0(%rbx)
   140129912:	vmovdqa %xmm0,0x15390(%rbx)
   14012991a:	call   140106090 <setun::VM::handle_gfx_draw_rect(setun::Chunk const&)>
   14012991f:	mov    0x1060(%rbx),%rax
   140129926:	mov    0x1048(%rbx),%r11
   14012992d:	mov    0x1038(%rbx),%r12
   140129934:	mov    0x150c0(%rbx),%rbp
   14012993b:	lea    (%r11,%rax,8),%r13
   14012993f:	mov    0x1050(%rbx),%rax
   140129946:	add    %r15,%r12
   140129949:	mov    %rax,0x30(%rsp)
   14012994e:	test   %rbp,%rbp
   140129951:	je     140129960 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53b0>
   140129953:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129958:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129960:	cmpb   $0x0,0x1040(%rbx)
   140129967:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012996d:	mov    %r12,%rax
   140129970:	lea    0x297729(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129977:	lea    0x1(%r12),%r12
   14012997c:	xor    %esi,%esi
   14012997e:	movzbl (%rax),%eax
   140129981:	mov    (%rdi,%rax,8),%rax
   140129985:	jmp    *%rax
   140129987:	cmp    $0x2,%sil
   14012998b:	je     14012caca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x851a>
   140129991:	cmp    $0x1,%sil
   140129995:	je     14012edb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa805>
   14012999b:	mov    0x1048(%rbx),%r11
   1401299a2:	mov    0x1050(%rbx),%rax
   1401299a9:	vzeroupper
   1401299ac:	sub    %r11,%r13
   1401299af:	sub    %r15,%r12
   1401299b2:	sub    %r11,%rax
   1401299b5:	mov    %r13,%rsi
   1401299b8:	mov    %r12,0x1038(%rbx)
   1401299bf:	sar    $0x3,%rsi
   1401299c3:	cmp    %r13,%rax
   1401299c6:	jb     14012e2bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d0f>
   1401299cc:	vmovdqa 0x2340ec(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401299d4:	mov    %rsi,0x1060(%rbx)
   1401299db:	mov    %r14,%rdx
   1401299de:	mov    %rbx,%rcx
   1401299e1:	movb   $0x0,0x153a0(%rbx)
   1401299e8:	vmovdqa %xmm0,0x15390(%rbx)
   1401299f0:	call   14010c6c0 <setun::VM::handle_println(setun::Chunk const&)>
   1401299f5:	mov    0x1060(%rbx),%rax
   1401299fc:	mov    0x1048(%rbx),%r11
   140129a03:	mov    0x1038(%rbx),%r12
   140129a0a:	mov    0x150c0(%rbx),%rbp
   140129a11:	lea    (%r11,%rax,8),%r13
   140129a15:	mov    0x1050(%rbx),%rax
   140129a1c:	add    %r15,%r12
   140129a1f:	mov    %rax,0x30(%rsp)
   140129a24:	test   %rbp,%rbp
   140129a27:	je     140129a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5486>
   140129a29:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129a2e:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129a36:	cmpb   $0x0,0x1040(%rbx)
   140129a3d:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129a43:	mov    %r12,%rax
   140129a46:	lea    0x297653(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129a4d:	lea    0x1(%r12),%r12
   140129a52:	xor    %esi,%esi
   140129a54:	movzbl (%rax),%eax
   140129a57:	mov    (%rdi,%rax,8),%rax
   140129a5b:	jmp    *%rax
   140129a5d:	cmp    $0x2,%sil
   140129a61:	je     14012cc5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86af>
   140129a67:	cmp    $0x1,%sil
   140129a6b:	je     14012efdb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa2b>
   140129a71:	mov    0x1048(%rbx),%r11
   140129a78:	mov    0x1050(%rbx),%rax
   140129a7f:	vzeroupper
   140129a82:	sub    %r11,%r13
   140129a85:	sub    %r15,%r12
   140129a88:	sub    %r11,%rax
   140129a8b:	mov    %r13,%rsi
   140129a8e:	mov    %r12,0x1038(%rbx)
   140129a95:	sar    $0x3,%rsi
   140129a99:	cmp    %r13,%rax
   140129a9c:	jb     14012e2d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d24>
   140129aa2:	vmovdqa 0x234016(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129aaa:	mov    %rsi,0x1060(%rbx)
   140129ab1:	mov    %r14,%rdx
   140129ab4:	mov    %rbx,%rcx
   140129ab7:	movb   $0x0,0x153a0(%rbx)
   140129abe:	vmovdqa %xmm0,0x15390(%rbx)
   140129ac6:	call   14010ce70 <setun::VM::handle_trace(setun::Chunk const&)>
   140129acb:	mov    0x1060(%rbx),%rax
   140129ad2:	mov    0x1048(%rbx),%r11
   140129ad9:	mov    0x1038(%rbx),%r12
   140129ae0:	mov    0x150c0(%rbx),%rbp
   140129ae7:	lea    (%r11,%rax,8),%r13
   140129aeb:	mov    0x1050(%rbx),%rax
   140129af2:	add    %r15,%r12
   140129af5:	mov    %rax,0x30(%rsp)
   140129afa:	test   %rbp,%rbp
   140129afd:	je     140129b0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x555c>
   140129aff:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129b04:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129b0c:	cmpb   $0x0,0x1040(%rbx)
   140129b13:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129b19:	mov    %r12,%rax
   140129b1c:	lea    0x29757d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129b23:	lea    0x1(%r12),%r12
   140129b28:	xor    %esi,%esi
   140129b2a:	movzbl (%rax),%eax
   140129b2d:	mov    (%rdi,%rax,8),%rax
   140129b31:	jmp    *%rax
   140129b33:	cmp    $0x2,%sil
   140129b37:	je     14012c9ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x840a>
   140129b3d:	cmp    $0x1,%sil
   140129b41:	je     14012ed47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa797>
   140129b47:	mov    0x1048(%rbx),%r11
   140129b4e:	mov    0x1050(%rbx),%rax
   140129b55:	vzeroupper
   140129b58:	sub    %r11,%r13
   140129b5b:	sub    %r15,%r12
   140129b5e:	sub    %r11,%rax
   140129b61:	mov    %r13,%rsi
   140129b64:	mov    %r12,0x1038(%rbx)
   140129b6b:	sar    $0x3,%rsi
   140129b6f:	cmp    %r13,%rax
   140129b72:	jb     14012e2e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d39>
   140129b78:	vmovdqa 0x233f40(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129b80:	mov    %rsi,0x1060(%rbx)
   140129b87:	mov    %r14,%rdx
   140129b8a:	mov    %rbx,%rcx
   140129b8d:	movb   $0x0,0x153a0(%rbx)
   140129b94:	vmovdqa %xmm0,0x15390(%rbx)
   140129b9c:	call   140111890 <setun::VM::handle_assert_eq(setun::Chunk const&)>
   140129ba1:	mov    0x1060(%rbx),%rax
   140129ba8:	mov    0x1048(%rbx),%r11
   140129baf:	mov    0x1038(%rbx),%r12
   140129bb6:	mov    0x150c0(%rbx),%rbp
   140129bbd:	lea    (%r11,%rax,8),%r13
   140129bc1:	mov    0x1050(%rbx),%rax
   140129bc8:	add    %r15,%r12
   140129bcb:	mov    %rax,0x30(%rsp)
   140129bd0:	test   %rbp,%rbp
   140129bd3:	je     140129be2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5632>
   140129bd5:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129bda:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129be2:	cmpb   $0x0,0x1040(%rbx)
   140129be9:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129bef:	mov    %r12,%rax
   140129bf2:	lea    0x2974a7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129bf9:	lea    0x1(%r12),%r12
   140129bfe:	xor    %esi,%esi
   140129c00:	movzbl (%rax),%eax
   140129c03:	mov    (%rdi,%rax,8),%rax
   140129c07:	jmp    *%rax
   140129c09:	cmp    $0x2,%sil
   140129c0d:	je     14012cca3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86f3>
   140129c13:	cmp    $0x1,%sil
   140129c17:	je     14012ef36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa986>
   140129c1d:	mov    0x1048(%rbx),%r11
   140129c24:	mov    0x1050(%rbx),%rax
   140129c2b:	vzeroupper
   140129c2e:	sub    %r11,%r13
   140129c31:	sub    %r15,%r12
   140129c34:	sub    %r11,%rax
   140129c37:	mov    %r13,%rsi
   140129c3a:	mov    %r12,0x1038(%rbx)
   140129c41:	sar    $0x3,%rsi
   140129c45:	cmp    %r13,%rax
   140129c48:	jb     14012e2fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d4e>
   140129c4e:	vmovdqa 0x233e6a(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129c56:	mov    %rsi,0x1060(%rbx)
   140129c5d:	mov    %r14,%rdx
   140129c60:	mov    %rbx,%rcx
   140129c63:	movb   $0x0,0x153a0(%rbx)
   140129c6a:	vmovdqa %xmm0,0x15390(%rbx)
   140129c72:	call   140102950 <setun::VM::handle_nn_set_input(setun::Chunk const&)>
   140129c77:	mov    0x1060(%rbx),%rax
   140129c7e:	mov    0x1048(%rbx),%r11
   140129c85:	mov    0x1038(%rbx),%r12
   140129c8c:	mov    0x150c0(%rbx),%rbp
   140129c93:	lea    (%r11,%rax,8),%r13
   140129c97:	mov    0x1050(%rbx),%rax
   140129c9e:	add    %r15,%r12
   140129ca1:	mov    %rax,0x30(%rsp)
   140129ca6:	test   %rbp,%rbp
   140129ca9:	je     140129cb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5708>
   140129cab:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129cb0:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129cb8:	cmpb   $0x0,0x1040(%rbx)
   140129cbf:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129cc5:	mov    %r12,%rax
   140129cc8:	lea    0x2973d1(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129ccf:	lea    0x1(%r12),%r12
   140129cd4:	xor    %esi,%esi
   140129cd6:	movzbl (%rax),%eax
   140129cd9:	mov    (%rdi,%rax,8),%rax
   140129cdd:	jmp    *%rax
   140129cdf:	cmp    $0x2,%sil
   140129ce3:	je     14012cbd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8627>
   140129ce9:	cmp    $0x1,%sil
   140129ced:	je     14012ee5a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8aa>
   140129cf3:	mov    0x1048(%rbx),%r11
   140129cfa:	mov    0x1050(%rbx),%rax
   140129d01:	vzeroupper
   140129d04:	sub    %r11,%r13
   140129d07:	sub    %r15,%r12
   140129d0a:	sub    %r11,%rax
   140129d0d:	mov    %r13,%rsi
   140129d10:	mov    %r12,0x1038(%rbx)
   140129d17:	sar    $0x3,%rsi
   140129d1b:	cmp    %r13,%rax
   140129d1e:	jb     14012e328 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d78>
   140129d24:	vmovdqa 0x233d94(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129d2c:	mov    %rsi,0x1060(%rbx)
   140129d33:	mov    %r14,%rdx
   140129d36:	mov    %rbx,%rcx
   140129d39:	movb   $0x0,0x153a0(%rbx)
   140129d40:	vmovdqa %xmm0,0x15390(%rbx)
   140129d48:	call   140101530 <setun::VM::handle_nn_get_input(setun::Chunk const&)>
   140129d4d:	mov    0x1060(%rbx),%rax
   140129d54:	mov    0x1048(%rbx),%r11
   140129d5b:	mov    0x1038(%rbx),%r12
   140129d62:	mov    0x150c0(%rbx),%rbp
   140129d69:	lea    (%r11,%rax,8),%r13
   140129d6d:	mov    0x1050(%rbx),%rax
   140129d74:	add    %r15,%r12
   140129d77:	mov    %rax,0x30(%rsp)
   140129d7c:	test   %rbp,%rbp
   140129d7f:	je     140129d8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x57de>
   140129d81:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129d86:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129d8e:	cmpb   $0x0,0x1040(%rbx)
   140129d95:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129d9b:	mov    %r12,%rax
   140129d9e:	lea    0x2972fb(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129da5:	lea    0x1(%r12),%r12
   140129daa:	xor    %esi,%esi
   140129dac:	movzbl (%rax),%eax
   140129daf:	mov    (%rdi,%rax,8),%rax
   140129db3:	jmp    *%rax
   140129db5:	cmp    $0x2,%sil
   140129db9:	je     14012cce7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8737>
   140129dbf:	cmp    $0x1,%sil
   140129dc3:	je     14012edec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa83c>
   140129dc9:	mov    0x1048(%rbx),%r11
   140129dd0:	mov    0x1050(%rbx),%rax
   140129dd7:	vzeroupper
   140129dda:	sub    %r11,%r13
   140129ddd:	sub    %r15,%r12
   140129de0:	sub    %r11,%rax
   140129de3:	mov    %r13,%rsi
   140129de6:	mov    %r12,0x1038(%rbx)
   140129ded:	sar    $0x3,%rsi
   140129df1:	cmp    %r13,%rax
   140129df4:	jb     14012e367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9db7>
   140129dfa:	vmovdqa 0x233cbe(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129e02:	mov    %rsi,0x1060(%rbx)
   140129e09:	mov    %r14,%rdx
   140129e0c:	mov    %rbx,%rcx
   140129e0f:	movb   $0x0,0x153a0(%rbx)
   140129e16:	vmovdqa %xmm0,0x15390(%rbx)
   140129e1e:	call   1400feff0 <setun::VM::handle_nn_forward(setun::Chunk const&)>
   140129e23:	mov    0x1060(%rbx),%rax
   140129e2a:	mov    0x1048(%rbx),%r11
   140129e31:	mov    0x1038(%rbx),%r12
   140129e38:	mov    0x150c0(%rbx),%rbp
   140129e3f:	lea    (%r11,%rax,8),%r13
   140129e43:	mov    0x1050(%rbx),%rax
   140129e4a:	add    %r15,%r12
   140129e4d:	mov    %rax,0x30(%rsp)
   140129e52:	test   %rbp,%rbp
   140129e55:	je     140129e64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x58b4>
   140129e57:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129e5c:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129e64:	cmpb   $0x0,0x1040(%rbx)
   140129e6b:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129e71:	mov    %r12,%rax
   140129e74:	lea    0x297225(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129e7b:	lea    0x1(%r12),%r12
   140129e80:	xor    %esi,%esi
   140129e82:	movzbl (%rax),%eax
   140129e85:	mov    (%rdi,%rax,8),%rax
   140129e89:	jmp    *%rax
   140129e8b:	cmp    $0x2,%sil
   140129e8f:	je     14012c8aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82fa>
   140129e95:	cmp    $0x1,%sil
   140129e99:	je     14012f012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa62>
   140129e9f:	mov    0x1048(%rbx),%r11
   140129ea6:	mov    0x1050(%rbx),%rax
   140129ead:	vzeroupper
   140129eb0:	sub    %r11,%r13
   140129eb3:	sub    %r15,%r12
   140129eb6:	sub    %r11,%rax
   140129eb9:	mov    %r13,%rsi
   140129ebc:	mov    %r12,0x1038(%rbx)
   140129ec3:	sar    $0x3,%rsi
   140129ec7:	cmp    %r13,%rax
   140129eca:	jb     14012e37c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9dcc>
   140129ed0:	vmovdqa 0x233be8(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129ed8:	mov    %rsi,0x1060(%rbx)
   140129edf:	mov    %r14,%rdx
   140129ee2:	mov    %rbx,%rcx
   140129ee5:	movb   $0x0,0x153a0(%rbx)
   140129eec:	vmovdqa %xmm0,0x15390(%rbx)
   140129ef4:	call   140102cb0 <setun::VM::handle_nn_get_output(setun::Chunk const&)>
   140129ef9:	mov    0x1060(%rbx),%rax
   140129f00:	mov    0x1048(%rbx),%r11
   140129f07:	mov    0x1038(%rbx),%r12
   140129f0e:	mov    0x150c0(%rbx),%rbp
   140129f15:	lea    (%r11,%rax,8),%r13
   140129f19:	mov    0x1050(%rbx),%rax
   140129f20:	add    %r15,%r12
   140129f23:	mov    %rax,0x30(%rsp)
   140129f28:	test   %rbp,%rbp
   140129f2b:	je     140129f3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x598a>
   140129f2d:	lea    -0x5(%rbp,%rbp,4),%rdx
   140129f32:	mov    0x10c8(%rbx,%rdx,8),%rbp
   140129f3a:	cmpb   $0x0,0x1040(%rbx)
   140129f41:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140129f47:	mov    %r12,%rax
   140129f4a:	lea    0x29714f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140129f51:	lea    0x1(%r12),%r12
   140129f56:	xor    %esi,%esi
   140129f58:	movzbl (%rax),%eax
   140129f5b:	mov    (%rdi,%rax,8),%rax
   140129f5f:	jmp    *%rax
   140129f61:	cmp    $0x2,%sil
   140129f65:	je     14012cb4f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x859f>
   140129f6b:	cmp    $0x1,%sil
   140129f6f:	je     14012eac2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa512>
   140129f75:	mov    0x1048(%rbx),%r11
   140129f7c:	mov    0x1050(%rbx),%rax
   140129f83:	vzeroupper
   140129f86:	sub    %r11,%r13
   140129f89:	sub    %r15,%r12
   140129f8c:	sub    %r11,%rax
   140129f8f:	mov    %r13,%rsi
   140129f92:	mov    %r12,0x1038(%rbx)
   140129f99:	sar    $0x3,%rsi
   140129f9d:	cmp    %r13,%rax
   140129fa0:	jb     14012e26b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cbb>
   140129fa6:	vmovdqa 0x233b12(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140129fae:	mov    %rsi,0x1060(%rbx)
   140129fb5:	mov    %r14,%rdx
   140129fb8:	mov    %rbx,%rcx
   140129fbb:	movb   $0x0,0x153a0(%rbx)
   140129fc2:	vmovdqa %xmm0,0x15390(%rbx)
   140129fca:	call   1400ff2f0 <setun::VM::handle_nn_copy_out_in(setun::Chunk const&)>
   140129fcf:	mov    0x1060(%rbx),%rax
   140129fd6:	mov    0x1048(%rbx),%r11
   140129fdd:	mov    0x1038(%rbx),%r12
   140129fe4:	mov    0x150c0(%rbx),%rbp
   140129feb:	lea    (%r11,%rax,8),%r13
   140129fef:	mov    0x1050(%rbx),%rax
   140129ff6:	add    %r15,%r12
   140129ff9:	mov    %rax,0x30(%rsp)
   140129ffe:	test   %rbp,%rbp
   14012a001:	je     14012a010 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5a60>
   14012a003:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a008:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a010:	cmpb   $0x0,0x1040(%rbx)
   14012a017:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a01d:	mov    %r12,%rax
   14012a020:	lea    0x297079(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a027:	lea    0x1(%r12),%r12
   14012a02c:	xor    %esi,%esi
   14012a02e:	movzbl (%rax),%eax
   14012a031:	mov    (%rdi,%rax,8),%rax
   14012a035:	jmp    *%rax
   14012a037:	cmp    $0x2,%sil
   14012a03b:	je     14012ca42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8492>
   14012a041:	cmp    $0x1,%sil
   14012a045:	je     14012ee91 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8e1>
   14012a04b:	mov    0x1048(%rbx),%r11
   14012a052:	mov    0x1050(%rbx),%rax
   14012a059:	vzeroupper
   14012a05c:	sub    %r11,%r13
   14012a05f:	sub    %r15,%r12
   14012a062:	sub    %r11,%rax
   14012a065:	mov    %r13,%rsi
   14012a068:	mov    %r12,0x1038(%rbx)
   14012a06f:	sar    $0x3,%rsi
   14012a073:	cmp    %r13,%rax
   14012a076:	jb     14012e280 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9cd0>
   14012a07c:	vmovdqa 0x233a3c(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a084:	mov    %rsi,0x1060(%rbx)
   14012a08b:	mov    %r14,%rdx
   14012a08e:	mov    %rbx,%rcx
   14012a091:	movb   $0x0,0x153a0(%rbx)
   14012a098:	vmovdqa %xmm0,0x15390(%rbx)
   14012a0a0:	call   140102630 <setun::VM::handle_nn_predict(setun::Chunk const&)>
   14012a0a5:	mov    0x1060(%rbx),%rax
   14012a0ac:	mov    0x1048(%rbx),%r11
   14012a0b3:	mov    0x1038(%rbx),%r12
   14012a0ba:	mov    0x150c0(%rbx),%rbp
   14012a0c1:	lea    (%r11,%rax,8),%r13
   14012a0c5:	mov    0x1050(%rbx),%rax
   14012a0cc:	add    %r15,%r12
   14012a0cf:	mov    %rax,0x30(%rsp)
   14012a0d4:	test   %rbp,%rbp
   14012a0d7:	je     14012a0e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b36>
   14012a0d9:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a0de:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a0e6:	cmpb   $0x0,0x1040(%rbx)
   14012a0ed:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a0f3:	mov    %r12,%rax
   14012a0f6:	lea    0x296fa3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a0fd:	lea    0x1(%r12),%r12
   14012a102:	xor    %esi,%esi
   14012a104:	movzbl (%rax),%eax
   14012a107:	mov    (%rdi,%rax,8),%rax
   14012a10b:	jmp    *%rax
   14012a10d:	cmp    $0x2,%sil
   14012a111:	je     14012cc1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x866b>
   14012a117:	cmp    $0x1,%sil
   14012a11b:	je     14012efa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9f4>
   14012a121:	mov    0x1048(%rbx),%r11
   14012a128:	mov    0x1050(%rbx),%rax
   14012a12f:	vzeroupper
   14012a132:	sub    %r11,%r13
   14012a135:	sub    %r15,%r12
   14012a138:	sub    %r11,%rax
   14012a13b:	mov    %r13,%rsi
   14012a13e:	mov    %r12,0x1038(%rbx)
   14012a145:	sar    $0x3,%rsi
   14012a149:	cmp    %r13,%rax
   14012a14c:	jb     14012e33d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9d8d>
   14012a152:	vmovdqa 0x233966(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a15a:	mov    %rsi,0x1060(%rbx)
   14012a161:	mov    %r14,%rdx
   14012a164:	mov    %rbx,%rcx
   14012a167:	movb   $0x0,0x153a0(%rbx)
   14012a16e:	vmovdqa %xmm0,0x15390(%rbx)
   14012a176:	call   1401035e0 <setun::VM::handle_nn_confidence(setun::Chunk const&)>
   14012a17b:	mov    0x1060(%rbx),%rax
   14012a182:	mov    0x1048(%rbx),%r11
   14012a189:	mov    0x1038(%rbx),%r12
   14012a190:	mov    0x150c0(%rbx),%rbp
   14012a197:	lea    (%r11,%rax,8),%r13
   14012a19b:	mov    0x1050(%rbx),%rax
   14012a1a2:	add    %r15,%r12
   14012a1a5:	mov    %rax,0x30(%rsp)
   14012a1aa:	test   %rbp,%rbp
   14012a1ad:	je     14012a1bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c0c>
   14012a1af:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a1b4:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a1bc:	cmpb   $0x0,0x1040(%rbx)
   14012a1c3:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a1c9:	mov    %r12,%rax
   14012a1cc:	lea    0x296ecd(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a1d3:	lea    0x1(%r12),%r12
   14012a1d8:	xor    %esi,%esi
   14012a1da:	movzbl (%rax),%eax
   14012a1dd:	mov    (%rdi,%rax,8),%rax
   14012a1e1:	jmp    *%rax
   14012a1e3:	cmp    $0x2,%sil
   14012a1e7:	je     14012c157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ba7>
   14012a1ed:	cmp    $0x1,%sil
   14012a1f1:	je     14012f080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaad0>
   14012a1f7:	mov    0x1048(%rbx),%r11
   14012a1fe:	mov    0x1050(%rbx),%rax
   14012a205:	vzeroupper
   14012a208:	sub    %r11,%r13
   14012a20b:	sub    %r15,%r12
   14012a20e:	sub    %r11,%rax
   14012a211:	mov    %r13,%rsi
   14012a214:	mov    %r12,0x1038(%rbx)
   14012a21b:	sar    $0x3,%rsi
   14012a21f:	cmp    %r13,%rax
   14012a222:	jb     14012e352 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9da2>
   14012a228:	vmovdqa 0x233890(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a230:	mov    %rsi,0x1060(%rbx)
   14012a237:	mov    %r14,%rdx
   14012a23a:	mov    %rbx,%rcx
   14012a23d:	movb   $0x0,0x153a0(%rbx)
   14012a244:	vmovdqa %xmm0,0x15390(%rbx)
   14012a24c:	call   1400ff5f0 <setun::VM::handle_nn_load_mnist(setun::Chunk const&)>
   14012a251:	mov    0x1060(%rbx),%rax
   14012a258:	mov    0x1048(%rbx),%r11
   14012a25f:	mov    0x1038(%rbx),%r12
   14012a266:	mov    0x150c0(%rbx),%rbp
   14012a26d:	lea    (%r11,%rax,8),%r13
   14012a271:	mov    0x1050(%rbx),%rax
   14012a278:	add    %r15,%r12
   14012a27b:	mov    %rax,0x30(%rsp)
   14012a280:	test   %rbp,%rbp
   14012a283:	je     14012a292 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ce2>
   14012a285:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a28a:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a292:	cmpb   $0x0,0x1040(%rbx)
   14012a299:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a29f:	mov    %r12,%rax
   14012a2a2:	lea    0x296df7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a2a9:	lea    0x1(%r12),%r12
   14012a2ae:	xor    %esi,%esi
   14012a2b0:	movzbl (%rax),%eax
   14012a2b3:	mov    (%rdi,%rax,8),%rax
   14012a2b7:	jmp    *%rax
   14012a2b9:	cmp    $0x2,%sil
   14012a2bd:	je     14012c19b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7beb>
   14012a2c3:	cmp    $0x1,%sil
   14012a2c7:	je     14012ea8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4db>
   14012a2cd:	mov    0x1048(%rbx),%r11
   14012a2d4:	mov    0x1050(%rbx),%rax
   14012a2db:	vzeroupper
   14012a2de:	sub    %r11,%r13
   14012a2e1:	sub    %r15,%r12
   14012a2e4:	sub    %r11,%rax
   14012a2e7:	mov    %r13,%rsi
   14012a2ea:	mov    %r12,0x1038(%rbx)
   14012a2f1:	sar    $0x3,%rsi
   14012a2f5:	cmp    %r13,%rax
   14012a2f8:	jb     14012e1b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c03>
   14012a2fe:	vmovdqa 0x2337ba(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a306:	mov    %rsi,0x1060(%rbx)
   14012a30d:	mov    %r14,%rdx
   14012a310:	mov    %rbx,%rcx
   14012a313:	movb   $0x0,0x153a0(%rbx)
   14012a31a:	vmovdqa %xmm0,0x15390(%rbx)
   14012a322:	call   1400ff8f0 <setun::VM::handle_nn_free_layer(setun::Chunk const&)>
   14012a327:	mov    0x1060(%rbx),%rax
   14012a32e:	mov    0x1048(%rbx),%r11
   14012a335:	mov    0x1038(%rbx),%r12
   14012a33c:	mov    0x150c0(%rbx),%rbp
   14012a343:	lea    (%r11,%rax,8),%r13
   14012a347:	mov    0x1050(%rbx),%rax
   14012a34e:	add    %r15,%r12
   14012a351:	mov    %rax,0x30(%rsp)
   14012a356:	test   %rbp,%rbp
   14012a359:	je     14012a368 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5db8>
   14012a35b:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a360:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a368:	cmpb   $0x0,0x1040(%rbx)
   14012a36f:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a375:	mov    %r12,%rax
   14012a378:	lea    0x296d21(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a37f:	lea    0x1(%r12),%r12
   14012a384:	xor    %esi,%esi
   14012a386:	movzbl (%rax),%eax
   14012a389:	mov    (%rdi,%rax,8),%rax
   14012a38d:	jmp    *%rax
   14012a38f:	cmp    $0x2,%sil
   14012a393:	je     14012bf54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79a4>
   14012a399:	cmp    $0x1,%sil
   14012a39d:	je     14012e8ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa33d>
   14012a3a3:	mov    0x1048(%rbx),%r11
   14012a3aa:	mov    0x1050(%rbx),%rax
   14012a3b1:	vzeroupper
   14012a3b4:	sub    %r11,%r13
   14012a3b7:	sub    %r15,%r12
   14012a3ba:	sub    %r11,%rax
   14012a3bd:	mov    %r13,%rsi
   14012a3c0:	mov    %r12,0x1038(%rbx)
   14012a3c7:	sar    $0x3,%rsi
   14012a3cb:	cmp    %r13,%rax
   14012a3ce:	jb     14012e1c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c18>
   14012a3d4:	vmovdqa 0x2336e4(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a3dc:	mov    %rsi,0x1060(%rbx)
   14012a3e3:	mov    %r14,%rdx
   14012a3e6:	mov    %rbx,%rcx
   14012a3e9:	movb   $0x0,0x153a0(%rbx)
   14012a3f0:	vmovdqa %xmm0,0x15390(%rbx)
   14012a3f8:	call   1400fe820 <setun::VM::handle_time_now_us(setun::Chunk const&)>
   14012a3fd:	mov    0x1060(%rbx),%rax
   14012a404:	mov    0x1048(%rbx),%r11
   14012a40b:	mov    0x1038(%rbx),%r12
   14012a412:	mov    0x150c0(%rbx),%rbp
   14012a419:	lea    (%r11,%rax,8),%r13
   14012a41d:	mov    0x1050(%rbx),%rax
   14012a424:	add    %r15,%r12
   14012a427:	mov    %rax,0x30(%rsp)
   14012a42c:	test   %rbp,%rbp
   14012a42f:	je     14012a43e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e8e>
   14012a431:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a436:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a43e:	cmpb   $0x0,0x1040(%rbx)
   14012a445:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a44b:	mov    %r12,%rax
   14012a44e:	lea    0x296c4b(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a455:	lea    0x1(%r12),%r12
   14012a45a:	xor    %esi,%esi
   14012a45c:	movzbl (%rax),%eax
   14012a45f:	mov    (%rdi,%rax,8),%rax
   14012a463:	jmp    *%rax
   14012a465:	cmp    $0x2,%sil
   14012a469:	je     14012c6ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x813e>
   14012a46f:	cmp    $0x1,%sil
   14012a473:	je     14012e73e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa18e>
   14012a479:	mov    0x1048(%rbx),%r11
   14012a480:	mov    0x1050(%rbx),%rax
   14012a487:	vzeroupper
   14012a48a:	sub    %r11,%r13
   14012a48d:	sub    %r15,%r12
   14012a490:	sub    %r11,%rax
   14012a493:	mov    %r13,%rsi
   14012a496:	mov    %r12,0x1038(%rbx)
   14012a49d:	sar    $0x3,%rsi
   14012a4a1:	cmp    %r13,%rax
   14012a4a4:	jb     14012e3bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e0b>
   14012a4aa:	vmovdqa 0x23360e(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a4b2:	mov    %rsi,0x1060(%rbx)
   14012a4b9:	mov    %r14,%rdx
   14012a4bc:	mov    %rbx,%rcx
   14012a4bf:	movb   $0x0,0x153a0(%rbx)
   14012a4c6:	vmovdqa %xmm0,0x15390(%rbx)
   14012a4ce:	call   14010ed60 <setun::VM::handle_get_field(setun::Chunk const&)>
   14012a4d3:	mov    0x1060(%rbx),%rax
   14012a4da:	mov    0x1048(%rbx),%r11
   14012a4e1:	mov    0x1038(%rbx),%r12
   14012a4e8:	mov    0x150c0(%rbx),%rbp
   14012a4ef:	lea    (%r11,%rax,8),%r13
   14012a4f3:	mov    0x1050(%rbx),%rax
   14012a4fa:	add    %r15,%r12
   14012a4fd:	mov    %rax,0x30(%rsp)
   14012a502:	test   %rbp,%rbp
   14012a505:	je     14012a514 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5f64>
   14012a507:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a50c:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a514:	cmpb   $0x0,0x1040(%rbx)
   14012a51b:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a521:	mov    %r12,%rax
   14012a524:	lea    0x296b75(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a52b:	lea    0x1(%r12),%r12
   14012a530:	xor    %esi,%esi
   14012a532:	movzbl (%rax),%eax
   14012a535:	mov    (%rdi,%rax,8),%rax
   14012a539:	jmp    *%rax
   14012a53b:	cmp    $0x2,%sil
   14012a53f:	je     14012c932 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8382>
   14012a545:	cmp    $0x1,%sil
   14012a549:	je     14012ebc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa616>
   14012a54f:	mov    0x1048(%rbx),%r11
   14012a556:	mov    0x1050(%rbx),%rax
   14012a55d:	vzeroupper
   14012a560:	sub    %r11,%r13
   14012a563:	sub    %r15,%r12
   14012a566:	sub    %r11,%rax
   14012a569:	mov    %r13,%rsi
   14012a56c:	mov    %r12,0x1038(%rbx)
   14012a573:	sar    $0x3,%rsi
   14012a577:	cmp    %r13,%rax
   14012a57a:	jb     14012e391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9de1>
   14012a580:	vmovdqa 0x233538(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a588:	mov    %rsi,0x1060(%rbx)
   14012a58f:	mov    %r14,%rdx
   14012a592:	mov    %rbx,%rcx
   14012a595:	movb   $0x0,0x153a0(%rbx)
   14012a59c:	vmovdqa %xmm0,0x15390(%rbx)
   14012a5a4:	call   140112a00 <setun::VM::handle_new_instance(setun::Chunk const&)>
   14012a5a9:	mov    0x1060(%rbx),%rax
   14012a5b0:	mov    0x1048(%rbx),%r11
   14012a5b7:	mov    0x1038(%rbx),%r12
   14012a5be:	mov    0x150c0(%rbx),%rbp
   14012a5c5:	lea    (%r11,%rax,8),%r13
   14012a5c9:	mov    0x1050(%rbx),%rax
   14012a5d0:	add    %r15,%r12
   14012a5d3:	mov    %rax,0x30(%rsp)
   14012a5d8:	test   %rbp,%rbp
   14012a5db:	je     14012a5ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x603a>
   14012a5dd:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a5e2:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a5ea:	cmpb   $0x0,0x1040(%rbx)
   14012a5f1:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a5f7:	mov    %r12,%rax
   14012a5fa:	lea    0x296a9f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a601:	lea    0x1(%r12),%r12
   14012a606:	xor    %esi,%esi
   14012a608:	movzbl (%rax),%eax
   14012a60b:	mov    (%rdi,%rax,8),%rax
   14012a60f:	jmp    *%rax
   14012a611:	cmp    $0x2,%sil
   14012a615:	je     14012ca86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84d6>
   14012a61b:	cmp    $0x1,%sil
   14012a61f:	je     14012eec8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa918>
   14012a625:	mov    0x1048(%rbx),%r11
   14012a62c:	mov    0x1050(%rbx),%rax
   14012a633:	vzeroupper
   14012a636:	sub    %r11,%r13
   14012a639:	sub    %r15,%r12
   14012a63c:	sub    %r11,%rax
   14012a63f:	mov    %r13,%rsi
   14012a642:	mov    %r12,0x1038(%rbx)
   14012a649:	sar    $0x3,%rsi
   14012a64d:	cmp    %r13,%rax
   14012a650:	jb     14012e10b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9b5b>
   14012a656:	vmovdqa 0x233462(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a65e:	mov    %rsi,0x1060(%rbx)
   14012a665:	mov    %r14,%rdx
   14012a668:	mov    %rbx,%rcx
   14012a66b:	movb   $0x0,0x153a0(%rbx)
   14012a672:	vmovdqa %xmm0,0x15390(%rbx)
   14012a67a:	call   1401122c0 <setun::VM::handle_set_field(setun::Chunk const&)>
   14012a67f:	mov    0x1060(%rbx),%rax
   14012a686:	mov    0x1048(%rbx),%r11
   14012a68d:	mov    0x1038(%rbx),%r12
   14012a694:	mov    0x150c0(%rbx),%rbp
   14012a69b:	lea    (%r11,%rax,8),%r13
   14012a69f:	mov    0x1050(%rbx),%rax
   14012a6a6:	add    %r15,%r12
   14012a6a9:	mov    %rax,0x30(%rsp)
   14012a6ae:	test   %rbp,%rbp
   14012a6b1:	je     14012a6c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6110>
   14012a6b3:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a6b8:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a6c0:	cmpb   $0x0,0x1040(%rbx)
   14012a6c7:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a6cd:	mov    %r12,%rax
   14012a6d0:	lea    0x2969c9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a6d7:	lea    0x1(%r12),%r12
   14012a6dc:	xor    %esi,%esi
   14012a6de:	movzbl (%rax),%eax
   14012a6e1:	mov    (%rdi,%rax,8),%rax
   14012a6e5:	jmp    *%rax
   14012a6e7:	cmp    $0x2,%sil
   14012a6eb:	je     14012c515 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f65>
   14012a6f1:	cmp    $0x1,%sil
   14012a6f5:	je     14012e924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa374>
   14012a6fb:	mov    0x1048(%rbx),%r11
   14012a702:	mov    0x1050(%rbx),%rax
   14012a709:	vzeroupper
   14012a70c:	sub    %r11,%r13
   14012a70f:	sub    %r15,%r12
   14012a712:	sub    %r11,%rax
   14012a715:	mov    %r13,%rsi
   14012a718:	mov    %r12,0x1038(%rbx)
   14012a71f:	sar    $0x3,%rsi
   14012a723:	cmp    %r13,%rax
   14012a726:	jb     14012e3fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e4a>
   14012a72c:	vmovdqa 0x23338c(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a734:	mov    %rsi,0x1060(%rbx)
   14012a73b:	mov    %r14,%rdx
   14012a73e:	mov    %rbx,%rcx
   14012a741:	movb   $0x0,0x153a0(%rbx)
   14012a748:	vmovdqa %xmm0,0x15390(%rbx)
   14012a750:	call   14011a030 <setun::VM::handle_invoke_method(setun::Chunk const&)>
   14012a755:	mov    0x1060(%rbx),%rax
   14012a75c:	mov    0x1048(%rbx),%r11
   14012a763:	mov    0x1038(%rbx),%r12
   14012a76a:	mov    0x150c0(%rbx),%rbp
   14012a771:	lea    (%r11,%rax,8),%r13
   14012a775:	mov    0x1050(%rbx),%rax
   14012a77c:	add    %r15,%r12
   14012a77f:	mov    %rax,0x30(%rsp)
   14012a784:	test   %rbp,%rbp
   14012a787:	je     14012a796 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x61e6>
   14012a789:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a78e:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a796:	cmpb   $0x0,0x1040(%rbx)
   14012a79d:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a7a3:	mov    %r12,%rax
   14012a7a6:	lea    0x2968f3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a7ad:	lea    0x1(%r12),%r12
   14012a7b2:	xor    %esi,%esi
   14012a7b4:	movzbl (%rax),%eax
   14012a7b7:	mov    (%rdi,%rax,8),%rax
   14012a7bb:	jmp    *%rax
   14012a7bd:	cmp    $0x2,%sil
   14012a7c1:	je     14012be94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78e4>
   14012a7c7:	cmp    $0x1,%sil
   14012a7cb:	je     14012ebfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa64d>
   14012a7d1:	mov    0x1048(%rbx),%r11
   14012a7d8:	mov    0x1050(%rbx),%rax
   14012a7df:	vzeroupper
   14012a7e2:	sub    %r11,%r13
   14012a7e5:	sub    %r15,%r12
   14012a7e8:	sub    %r11,%rax
   14012a7eb:	mov    %r13,%rsi
   14012a7ee:	mov    %r12,0x1038(%rbx)
   14012a7f5:	sar    $0x3,%rsi
   14012a7f9:	cmp    %r13,%rax
   14012a7fc:	jb     14012e3a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9df6>
   14012a802:	vmovdqa 0x2332b6(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a80a:	mov    %rsi,0x1060(%rbx)
   14012a811:	mov    %r14,%rdx
   14012a814:	mov    %rbx,%rcx
   14012a817:	movb   $0x0,0x153a0(%rbx)
   14012a81e:	vmovdqa %xmm0,0x15390(%rbx)
   14012a826:	call   1400fb660 <setun::VM::handle_try(setun::Chunk const&)>
   14012a82b:	mov    0x1060(%rbx),%rax
   14012a832:	mov    0x1048(%rbx),%r11
   14012a839:	mov    0x1038(%rbx),%r12
   14012a840:	mov    0x150c0(%rbx),%rbp
   14012a847:	lea    (%r11,%rax,8),%r13
   14012a84b:	mov    0x1050(%rbx),%rax
   14012a852:	add    %r15,%r12
   14012a855:	mov    %rax,0x30(%rsp)
   14012a85a:	test   %rbp,%rbp
   14012a85d:	je     14012a86c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x62bc>
   14012a85f:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a864:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a86c:	cmpb   $0x0,0x1040(%rbx)
   14012a873:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012a879:	mov    %r12,%rax
   14012a87c:	lea    0x29681d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a883:	lea    0x1(%r12),%r12
   14012a888:	xor    %esi,%esi
   14012a88a:	movzbl (%rax),%eax
   14012a88d:	mov    (%rdi,%rax,8),%rax
   14012a891:	jmp    *%rax
   14012a893:	cmp    $0x2,%sil
   14012a897:	je     14012c822 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8272>
   14012a89d:	cmp    $0x1,%sil
   14012a8a1:	jne    140137e6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138ba>
   14012a8a7:	mov    0x1048(%rbx),%r11
   14012a8ae:	lea    0x8(%r13),%rax
   14012a8b2:	cmp    0x30(%rsp),%rax
   14012a8b7:	jae    140132b0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe55d>
   14012a8bd:	mov    0x1050(%rbx),%rax
   14012a8c4:	vzeroupper
   14012a8c7:	mov    0x1c8(%rsp),%rcx
   14012a8cf:	mov    %r13,%rdx
   14012a8d2:	lea    0x8(%r13),%r13
   14012a8d6:	mov    %rcx,(%rdx)
   14012a8d9:	sub    %r11,%r13
   14012a8dc:	sub    %r15,%r12
   14012a8df:	sub    %r11,%rax
   14012a8e2:	mov    %r13,%rsi
   14012a8e5:	mov    %r12,0x1038(%rbx)
   14012a8ec:	sar    $0x3,%rsi
   14012a8f0:	cmp    %r13,%rax
   14012a8f3:	jb     14012e3d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e20>
   14012a8f9:	vmovdqa 0x2331bf(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a901:	mov    %rsi,0x1060(%rbx)
   14012a908:	mov    %r14,%rdx
   14012a90b:	mov    %rbx,%rcx
   14012a90e:	movb   $0x0,0x153a0(%rbx)
   14012a915:	vmovdqa %xmm0,0x15390(%rbx)
   14012a91d:	call   14010d1f0 <setun::VM::handle_throw(setun::Chunk const&)>
   14012a922:	cmp    $0x2,%sil
   14012a926:	je     14012cb0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x855e>
   14012a92c:	cmp    $0x1,%sil
   14012a930:	je     14012e81a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa26a>
   14012a936:	mov    0x1048(%rbx),%r11
   14012a93d:	mov    0x1050(%rbx),%rax
   14012a944:	sub    %r11,%r13
   14012a947:	mov    %rax,%rdx
   14012a94a:	sub    %r15,%r12
   14012a94d:	mov    %r13,%rsi
   14012a950:	sub    %r11,%rdx
   14012a953:	mov    %r12,0x1038(%rbx)
   14012a95a:	sar    $0x3,%rsi
   14012a95e:	cmp    %r13,%rdx
   14012a961:	jb     14012e21b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c6b>
   14012a967:	vmovdqa 0x233151(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012a96f:	mov    %rsi,0x1060(%rbx)
   14012a976:	movb   $0x0,0x153a0(%rbx)
   14012a97d:	mov    0x15108(%rbx),%rdx
   14012a984:	vmovdqa %xmm0,0x15390(%rbx)
   14012a98c:	cmp    0x15100(%rbx),%rdx
   14012a993:	je     14012a9a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63f0>
   14012a995:	sub    $0x20,%rdx
   14012a999:	mov    %rdx,0x15108(%rbx)
   14012a9a0:	mov    0x1038(%rbx),%r12
   14012a9a7:	mov    0x150c0(%rbx),%rbp
   14012a9ae:	mov    %rax,0x30(%rsp)
   14012a9b3:	add    %r11,%r13
   14012a9b6:	add    %r15,%r12
   14012a9b9:	test   %rbp,%rbp
   14012a9bc:	je     14012a9cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x641b>
   14012a9be:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012a9c3:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012a9cb:	cmpb   $0x0,0x1040(%rbx)
   14012a9d2:	je     140131348 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcd98>
   14012a9d8:	mov    %r12,%rax
   14012a9db:	lea    0x2966be(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012a9e2:	lea    0x1(%r12),%r12
   14012a9e7:	xor    %esi,%esi
   14012a9e9:	movzbl (%rax),%eax
   14012a9ec:	mov    (%rdi,%rax,8),%rax
   14012a9f0:	jmp    *%rax
   14012a9f2:	cmp    $0x2,%sil
   14012a9f6:	je     14012c9fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x844e>
   14012a9fc:	cmp    $0x1,%sil
   14012aa00:	je     14012e84e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa29e>
   14012aa06:	mov    0x1048(%rbx),%r11
   14012aa0d:	mov    0x1050(%rbx),%rax
   14012aa14:	vzeroupper
   14012aa17:	sub    %r11,%r13
   14012aa1a:	sub    %r15,%r12
   14012aa1d:	sub    %r11,%rax
   14012aa20:	mov    %r13,%rsi
   14012aa23:	mov    %r12,0x1038(%rbx)
   14012aa2a:	sar    $0x3,%rsi
   14012aa2e:	cmp    %r13,%rax
   14012aa31:	jb     14012e256 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ca6>
   14012aa37:	vmovdqa 0x233081(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012aa3f:	mov    %rsi,0x1060(%rbx)
   14012aa46:	mov    %r14,%rdx
   14012aa49:	mov    %rbx,%rcx
   14012aa4c:	movb   $0x0,0x153a0(%rbx)
   14012aa53:	vmovdqa %xmm0,0x15390(%rbx)
   14012aa5b:	call   14010fac0 <setun::VM::handle_closure(setun::Chunk const&)>
   14012aa60:	mov    0x1060(%rbx),%rax
   14012aa67:	mov    0x1048(%rbx),%r11
   14012aa6e:	mov    0x1038(%rbx),%r12
   14012aa75:	mov    0x150c0(%rbx),%rbp
   14012aa7c:	lea    (%r11,%rax,8),%r13
   14012aa80:	mov    0x1050(%rbx),%rax
   14012aa87:	add    %r15,%r12
   14012aa8a:	mov    %rax,0x30(%rsp)
   14012aa8f:	test   %rbp,%rbp
   14012aa92:	je     14012aaa1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x64f1>
   14012aa94:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012aa99:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012aaa1:	cmpb   $0x0,0x1040(%rbx)
   14012aaa8:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012aaae:	mov    %r12,%rax
   14012aab1:	lea    0x2965e8(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012aab8:	lea    0x1(%r12),%r12
   14012aabd:	xor    %esi,%esi
   14012aabf:	movzbl (%rax),%eax
   14012aac2:	mov    (%rdi,%rax,8),%rax
   14012aac6:	jmp    *%rax
   14012aac8:	cmp    $0x2,%sil
   14012aacc:	je     14012cb93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85e3>
   14012aad2:	cmp    $0x1,%sil
   14012aad6:	je     14012e775 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1c5>
   14012aadc:	mov    0x1048(%rbx),%r11
   14012aae3:	mov    0x1050(%rbx),%rax
   14012aaea:	vzeroupper
   14012aaed:	sub    %r11,%r13
   14012aaf0:	sub    %r15,%r12
   14012aaf3:	sub    %r11,%rax
   14012aaf6:	mov    %r13,%rsi
   14012aaf9:	mov    %r12,0x1038(%rbx)
   14012ab00:	sar    $0x3,%rsi
   14012ab04:	cmp    %r13,%rax
   14012ab07:	jb     14012e241 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c91>
   14012ab0d:	vmovdqa 0x232fab(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012ab15:	mov    %rsi,0x1060(%rbx)
   14012ab1c:	mov    %r14,%rdx
   14012ab1f:	mov    %rbx,%rcx
   14012ab22:	movb   $0x0,0x153a0(%rbx)
   14012ab29:	vmovdqa %xmm0,0x15390(%rbx)
   14012ab31:	call   140110670 <setun::VM::handle_call_indirect(setun::Chunk const&)>
   14012ab36:	mov    0x1060(%rbx),%rax
   14012ab3d:	mov    0x1048(%rbx),%r11
   14012ab44:	mov    0x1038(%rbx),%r12
   14012ab4b:	mov    0x150c0(%rbx),%rbp
   14012ab52:	lea    (%r11,%rax,8),%r13
   14012ab56:	mov    0x1050(%rbx),%rax
   14012ab5d:	add    %r15,%r12
   14012ab60:	mov    %rax,0x30(%rsp)
   14012ab65:	test   %rbp,%rbp
   14012ab68:	je     14012ab77 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x65c7>
   14012ab6a:	lea    -0x5(%rbp,%rbp,4),%rdx
   14012ab6f:	mov    0x10c8(%rbx,%rdx,8),%rbp
   14012ab77:	cmpb   $0x0,0x1040(%rbx)
   14012ab7e:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012ab84:	mov    %r12,%rax
   14012ab87:	lea    0x296512(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ab8e:	lea    0x1(%r12),%r12
   14012ab93:	xor    %esi,%esi
   14012ab95:	movzbl (%rax),%eax
   14012ab98:	mov    (%rdi,%rax,8),%rax
   14012ab9c:	jmp    *%rax
   14012ab9e:	movzwl (%r12),%eax
   14012aba3:	add    $0x2,%r12
   14012aba7:	mov    %ax,0x40(%rsp)
   14012abac:	cmp    $0x2,%sil
   14012abb0:	je     14012bf1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x796c>
   14012abb6:	cmp    $0x1,%sil
   14012abba:	jne    14012e47c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ecc>
   14012abc0:	lea    0x8(%r13),%rax
   14012abc4:	cmp    0x30(%rsp),%rax
   14012abc9:	jae    140133760 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1b0>
   14012abcf:	vzeroupper
   14012abd2:	mov    0x1c8(%rsp),%rdx
   14012abda:	mov    %r13,%rax
   14012abdd:	xor    %esi,%esi
   14012abdf:	lea    0x8(%r13),%r13
   14012abe3:	mov    %rdx,(%rax)
   14012abe6:	mov    $0x90,%ecx
   14012abeb:	call   140339200 <operator new(unsigned long long)>
   14012abf0:	movzwl 0x40(%rsp),%edx
   14012abf5:	vpxor  %xmm0,%xmm0,%xmm0
   14012abf9:	mov    %rax,%rdi
   14012abfc:	mov    0x232f2d(%rip),%rax        # 14035db30 <CSWTCH.4381+0x230>
   14012ac03:	mov    %rdx,0x80(%rsp)
   14012ac0b:	lea    0x18(%rdi),%rcx
   14012ac0f:	mov    %rax,0x8(%rdi)
   14012ac13:	lea    0x251fe6(%rip),%rax        # 14037cc00 <vtable for std::_Sp_counted_ptr_inplace<setun::ArrayObject, std::allocator<void>, (__gnu_cxx::_Lock_policy)2>+0x10>
   14012ac1a:	mov    %rax,(%rdi)
   14012ac1d:	lea    0x10(%rdi),%rax
   14012ac21:	mov    %rax,0x60(%rsp)
   14012ac26:	vmovdqu %ymm0,0x10(%rdi)
   14012ac2b:	vmovdqu %ymm0,0x30(%rdi)
   14012ac30:	vmovdqu %ymm0,0x50(%rdi)
   14012ac35:	vmovdqu %ymm0,0x70(%rdi)
   14012ac3a:	vzeroupper
   14012ac3d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012ac42:	movzwl 0x40(%rsp),%eax
   14012ac47:	test   %ax,%ax
   14012ac4a:	je     14012ac9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66eb>
   14012ac4c:	mov    0x80(%rsp),%rdx
   14012ac54:	lea    -0x1(%rax),%r9d
   14012ac58:	mov    0x18(%rdi),%rax
   14012ac5c:	mov    %rdx,%r8
   14012ac5f:	lea    (%rax,%rdx,8),%rcx
   14012ac63:	xor    %eax,%eax
   14012ac65:	neg    %r8
   14012ac68:	shl    $0x3,%r8
   14012ac6c:	nopw   0x0(%rax,%rax,1)
   14012ac75:	data16 cs nopw 0x0(%rax,%rax,1)
   14012ac80:	mov    -0x8(%r13,%rax,1),%rdx
   14012ac85:	mov    %rdx,-0x8(%rcx,%rax,1)
   14012ac8a:	sub    $0x8,%rax
   14012ac8e:	cmp    %r8,%rax
   14012ac91:	jne    14012ac80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x66d0>
   14012ac93:	neg    %r9
   14012ac96:	lea    -0x8(%r13,%r9,8),%r13
   14012ac9b:	mov    0x60(%rsp),%rcx
   14012aca0:	call   14014bde0 <setun::ArrayObject::try_promote()>
   14012aca5:	test   %sil,%sil
   14012aca8:	jne    14012dd2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x977f>
   14012acae:	mov    0x60(%rsp),%rax
   14012acb3:	mov    %rax,0x710(%rsp)
   14012acbb:	lock addl $0x1,0x8(%rdi)
   14012acc0:	lea    0x710(%rsp),%rdx
   14012acc8:	lea    0x540(%rsp),%rcx
   14012acd0:	mov    %rdi,0x718(%rsp)
   14012acd8:	call   14020fb80 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012acdd:	mov    0x540(%rsp),%rax
   14012ace5:	mov    0x718(%rsp),%rcx
   14012aced:	mov    %rax,0x1c8(%rsp)
   14012acf5:	test   %rcx,%rcx
   14012acf8:	je     14012acff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x674f>
   14012acfa:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012acff:	mov    $0x1,%esi
   14012ad04:	mov    %rdi,%rcx
   14012ad07:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012ad0c:	cmpb   $0x0,0x1040(%rbx)
   14012ad13:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012ad19:	mov    %r12,%rax
   14012ad1c:	lea    0x29637d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ad23:	lea    0x1(%r12),%r12
   14012ad28:	movzbl (%rax),%eax
   14012ad2b:	jmp    *(%rdi,%rax,8)
   14012ad2e:	movabs $0xfffb000000000000,%rax
   14012ad38:	mov    %rax,0x308(%rsp)
   14012ad40:	mov    %rax,0x310(%rsp)
   14012ad48:	cmp    $0x2,%sil
   14012ad4c:	jne    1401311f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcc42>
   14012ad52:	mov    0x1c8(%rsp),%rax
   14012ad5a:	mov    %rax,0x310(%rsp)
   14012ad62:	mov    0x1d0(%rsp),%rax
   14012ad6a:	movabs $0xffff000000000000,%rdx
   14012ad74:	mov    %rax,0x308(%rsp)
   14012ad7c:	movabs $0xfffd000000000000,%rcx
   14012ad86:	and    %rax,%rdx
   14012ad89:	cmp    %rcx,%rdx
   14012ad8c:	je     14012cd2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x877b>
   14012ad92:	movabs $0xfff8000000000000,%rax
   14012ad9c:	mov    $0x1,%esi
   14012ada1:	mov    %rax,0x1c8(%rsp)
   14012ada9:	cmpb   $0x0,0x1040(%rbx)
   14012adb0:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012adb6:	mov    %r12,%rax
   14012adb9:	lea    0x2962e0(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012adc0:	lea    0x1(%r12),%r12
   14012adc5:	movzbl (%rax),%eax
   14012adc8:	jmp    *(%rdi,%rax,8)
   14012adcb:	movabs $0xfffb000000000000,%rax
   14012add5:	mov    %rax,0x318(%rsp)
   14012addd:	mov    %rax,0x320(%rsp)
   14012ade5:	cmp    $0x1,%sil
   14012ade9:	jne    140130766 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1b6>
   14012adef:	mov    0x1c8(%rsp),%rax
   14012adf7:	xor    %esi,%esi
   14012adf9:	mov    %rax,0x318(%rsp)
   14012ae01:	mov    -0x8(%r13),%rdx
   14012ae05:	mov    %r13,%rax
   14012ae08:	lea    -0x10(%r13),%r13
   14012ae0c:	mov    %rdx,0x320(%rsp)
   14012ae14:	mov    -0x10(%rax),%rdx
   14012ae18:	movabs $0xffff000000000000,%rax
   14012ae22:	movabs $0xfffd000000000000,%rcx
   14012ae2c:	and    %rdx,%rax
   14012ae2f:	cmp    %rcx,%rax
   14012ae32:	je     14012b751 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x71a1>
   14012ae38:	cmpb   $0x0,0x1040(%rbx)
   14012ae3f:	je     14012f240 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac90>
   14012ae45:	mov    %r12,%rax
   14012ae48:	lea    0x296251(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ae4f:	lea    0x1(%r12),%r12
   14012ae54:	movzbl (%rax),%eax
   14012ae57:	jmp    *(%rdi,%rax,8)
   14012ae5a:	test   %sil,%sil
   14012ae5d:	je     14012b2b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d07>
   14012ae63:	cmp    $0x1,%sil
   14012ae67:	je     14012f54b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf9b>
   14012ae6d:	lea    0x8(%r13),%rax
   14012ae71:	cmp    0x30(%rsp),%rax
   14012ae76:	jae    140133c76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6c6>
   14012ae7c:	mov    0x1d0(%rsp),%rdx
   14012ae84:	mov    %r13,%rax
   14012ae87:	lea    0x8(%r13),%r13
   14012ae8b:	mov    %rdx,(%rax)
   14012ae8e:	mov    0x1c8(%rsp),%rax
   14012ae96:	mov    %rax,0x1d0(%rsp)
   14012ae9e:	mov    0x1068(%rbx),%rax
   14012aea5:	mov    (%rax,%rbp,8),%rax
   14012aea9:	mov    %rax,0x1c8(%rsp)
   14012aeb1:	cmpb   $0x0,0x1040(%rbx)
   14012aeb8:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012aebe:	mov    %r12,%rax
   14012aec1:	lea    0x2961d8(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012aec8:	lea    0x1(%r12),%r12
   14012aecd:	movzbl (%rax),%eax
   14012aed0:	jmp    *(%rdi,%rax,8)
   14012aed3:	test   %sil,%sil
   14012aed6:	je     14012b1ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c3d>
   14012aedc:	cmp    $0x1,%sil
   14012aee0:	je     14012f578 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xafc8>
   14012aee6:	lea    0x8(%r13),%rax
   14012aeea:	cmp    0x30(%rsp),%rax
   14012aeef:	jae    140133da5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7f5>
   14012aef5:	mov    0x1d0(%rsp),%rdx
   14012aefd:	mov    %r13,%rax
   14012af00:	lea    0x8(%r13),%r13
   14012af04:	mov    %rdx,(%rax)
   14012af07:	mov    0x1c8(%rsp),%rax
   14012af0f:	mov    %rax,0x1d0(%rsp)
   14012af17:	mov    0x1068(%rbx),%rax
   14012af1e:	mov    0x8(%rax,%rbp,8),%rax
   14012af23:	mov    %rax,0x1c8(%rsp)
   14012af2b:	cmpb   $0x0,0x1040(%rbx)
   14012af32:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012af38:	mov    %r12,%rax
   14012af3b:	lea    0x29615e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012af42:	lea    0x1(%r12),%r12
   14012af47:	movzbl (%rax),%eax
   14012af4a:	jmp    *(%rdi,%rax,8)
   14012af4d:	test   %sil,%sil
   14012af50:	je     14012b228 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6c78>
   14012af56:	cmp    $0x1,%sil
   14012af5a:	je     14012f3de <setun::VM::run_optimized(setun::OptimizedChunk&)+0xae2e>
   14012af60:	lea    0x8(%r13),%rax
   14012af64:	cmp    0x30(%rsp),%rax
   14012af69:	jae    140133099 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeae9>
   14012af6f:	mov    0x1d0(%rsp),%rdx
   14012af77:	mov    %r13,%rax
   14012af7a:	lea    0x8(%r13),%r13
   14012af7e:	mov    %rdx,(%rax)
   14012af81:	mov    0x1c8(%rsp),%rax
   14012af89:	mov    %rax,0x1d0(%rsp)
   14012af91:	mov    0x1068(%rbx),%rax
   14012af98:	mov    0x10(%rax,%rbp,8),%rax
   14012af9d:	mov    %rax,0x1c8(%rsp)
   14012afa5:	cmpb   $0x0,0x1040(%rbx)
   14012afac:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012afb2:	mov    %r12,%rax
   14012afb5:	lea    0x2960e4(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012afbc:	lea    0x1(%r12),%r12
   14012afc1:	movzbl (%rax),%eax
   14012afc4:	jmp    *(%rdi,%rax,8)
   14012afc7:	test   %sil,%sil
   14012afca:	je     14012b152 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ba2>
   14012afd0:	cmp    $0x1,%sil
   14012afd4:	je     14012f499 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaee9>
   14012afda:	lea    0x8(%r13),%rax
   14012afde:	cmp    0x30(%rsp),%rax
   14012afe3:	jae    1401343bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe0d>
   14012afe9:	mov    0x1d0(%rsp),%rdx
   14012aff1:	mov    %r13,%rax
   14012aff4:	lea    0x8(%r13),%r13
   14012aff8:	mov    %rdx,(%rax)
   14012affb:	mov    0x1c8(%rsp),%rax
   14012b003:	mov    %rax,0x1d0(%rsp)
   14012b00b:	mov    0x1068(%rbx),%rax
   14012b012:	mov    0x18(%rax,%rbp,8),%rax
   14012b017:	mov    %rax,0x1c8(%rsp)
   14012b01f:	cmpb   $0x0,0x1040(%rbx)
   14012b026:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012b02c:	mov    %r12,%rax
   14012b02f:	lea    0x29606a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b036:	lea    0x1(%r12),%r12
   14012b03b:	movzbl (%rax),%eax
   14012b03e:	jmp    *(%rdi,%rax,8)
   14012b041:	lea    -0x8(%r13),%rdx
   14012b045:	lea    0x1c8(%rsp),%rax
   14012b04d:	test   %sil,%sil
   14012b050:	cmove  %rdx,%rax
   14012b054:	mov    0x1068(%rbx),%rdx
   14012b05b:	mov    (%rax),%rax
   14012b05e:	mov    %rax,(%rdx,%rbp,8)
   14012b062:	cmpb   $0x0,0x1040(%rbx)
   14012b069:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012b06f:	mov    %r12,%rax
   14012b072:	lea    0x296027(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b079:	lea    0x1(%r12),%r12
   14012b07e:	movzbl (%rax),%eax
   14012b081:	jmp    *(%rdi,%rax,8)
   14012b084:	nopl   0x0(%rax)
   14012b088:	mov    0x1048(%rbx),%r11
   14012b08f:	lea    0x8(%r13),%rax
   14012b093:	cmp    0x30(%rsp),%rax
   14012b098:	jae    14012e1f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c42>
   14012b09e:	mov    0x1050(%rbx),%rax
   14012b0a5:	mov    0x1c8(%rsp),%rcx
   14012b0ad:	mov    %r13,%rdx
   14012b0b0:	lea    0x8(%r13),%r13
   14012b0b4:	mov    %rcx,(%rdx)
   14012b0b7:	jmp    1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012b0bc:	mov    0x1048(%rbx),%r11
   14012b0c3:	jmp    1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012b0c8:	nopl   0x0(%rax,%rax,1)
   14012b0d0:	cmp    $0x1,%sil
   14012b0d4:	je     14012b08f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6adf>
   14012b0d6:	mov    0x1050(%rbx),%rax
   14012b0dd:	jmp    1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012b0e2:	nopw   0x0(%rax,%rax,1)
   14012b0e8:	lea    (%rsi,%rsi,1),%rdx
   14012b0ec:	lea    0x1048(%rbx),%rcx
   14012b0f3:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012b0f8:	jmp    140125201 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc51>
   14012b0fd:	nopl   (%rax)
   14012b100:	mov    0x1048(%rbx),%r11
   14012b107:	vzeroupper
   14012b10a:	jmp    1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012b10f:	nop
   14012b110:	mov    (%r12),%rdx
   14012b114:	mov    %rax,0x30(%rsp)
   14012b119:	mov    %r12,%rcx
   14012b11c:	movq   $0x0,0x8(%r12)
   14012b125:	call   *0x10(%rdx)
   14012b128:	mov    (%r12),%rdx
   14012b12c:	mov    %r12,%rcx
   14012b12f:	call   *0x18(%rdx)
   14012b132:	mov    0x30(%rsp),%rax
   14012b137:	jmp    14012474b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012b13c:	mov    0x1048(%rbx),%r11
   14012b143:	mov    0x1050(%rbx),%rax
   14012b14a:	vzeroupper
   14012b14d:	jmp    1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   14012b152:	mov    0x1068(%rbx),%rax
   14012b159:	mov    $0x1,%esi
   14012b15e:	mov    0x18(%rax,%rbp,8),%rax
   14012b163:	mov    %rax,0x1c8(%rsp)
   14012b16b:	jmp    14012b01f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a6f>
   14012b170:	lea    -0x8(%r13),%rdx
   14012b174:	lea    0x1c8(%rsp),%rax
   14012b17c:	test   %sil,%sil
   14012b17f:	cmove  %rdx,%rax
   14012b183:	mov    (%rax),%rdx
   14012b186:	movabs $0xffffffff00000000,%rax
   14012b190:	movabs $0xfffd000200000000,%rcx
   14012b19a:	and    %rdx,%rax
   14012b19d:	cmp    %rcx,%rax
   14012b1a0:	je     14012fdcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb81f>
   14012b1a6:	vzeroupper
   14012b1a9:	cmp    $0x2,%sil
   14012b1ad:	je     14012e40f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e5f>
   14012b1b3:	cmp    $0x1,%sil
   14012b1b7:	je     14012e8b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa309>
   14012b1bd:	mov    0x1048(%rbx),%r11
   14012b1c4:	mov    0x1050(%rbx),%rax
   14012b1cb:	jmp    140128707 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4157>
   14012b1d0:	mov    0x1068(%rbx),%rax
   14012b1d7:	mov    $0x1,%esi
   14012b1dc:	mov    (%rax,%rdi,8),%rax
   14012b1e0:	mov    %rax,0x1c8(%rsp)
   14012b1e8:	jmp    140125b96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e6>
   14012b1ed:	mov    0x1068(%rbx),%rax
   14012b1f4:	mov    $0x1,%esi
   14012b1f9:	mov    0x8(%rax,%rbp,8),%rax
   14012b1fe:	mov    %rax,0x1c8(%rsp)
   14012b206:	jmp    14012af2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x697b>
   14012b20b:	mov    0x1080(%rbx),%rax
   14012b212:	mov    $0x1,%esi
   14012b217:	mov    (%rax,%rdi,8),%rax
   14012b21b:	mov    %rax,0x1c8(%rsp)
   14012b223:	jmp    140125cab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16fb>
   14012b228:	mov    0x1068(%rbx),%rax
   14012b22f:	mov    $0x1,%esi
   14012b234:	mov    0x10(%rax,%rbp,8),%rax
   14012b239:	mov    %rax,0x1c8(%rsp)
   14012b241:	jmp    14012afa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f5>
   14012b246:	cmp    $0x1,%sil
   14012b24a:	je     14012f5ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb03a>
   14012b250:	lea    0x8(%r13),%rax
   14012b254:	cmp    0x30(%rsp),%rax
   14012b259:	jae    140133a8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4de>
   14012b25f:	mov    0x1d0(%rsp),%rdx
   14012b267:	mov    %r13,%rax
   14012b26a:	vmovq  %rdi,%xmm0
   14012b26f:	lea    0x8(%r13),%r13
   14012b273:	vucomisd %xmm0,%xmm0
   14012b277:	mov    %rdx,(%rax)
   14012b27a:	mov    0x1c8(%rsp),%rax
   14012b282:	mov    %rax,0x1d0(%rsp)
   14012b28a:	movabs $0xfffc000000000000,%rax
   14012b294:	cmovnp %rdi,%rax
   14012b298:	jmp    1401259fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144a>
   14012b29d:	movzwl %di,%eax
   14012b2a0:	mov    $0x1,%esi
   14012b2a5:	movabs $0xfff9000000000000,%rdx
   14012b2af:	or     %rdx,%rax
   14012b2b2:	jmp    1401258d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1322>
   14012b2b7:	mov    0x1068(%rbx),%rax
   14012b2be:	mov    $0x1,%esi
   14012b2c3:	mov    (%rax,%rbp,8),%rax
   14012b2c7:	mov    %rax,0x1c8(%rsp)
   14012b2cf:	jmp    14012aeb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6901>
   14012b2d4:	lea    0x1c8(%rsp),%rcx
   14012b2dc:	vzeroupper
   14012b2df:	call   14021aa50 <setun::VMValue::neg() const>
   14012b2e4:	mov    %rax,0x1c8(%rsp)
   14012b2ec:	jmp    140126349 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d99>
   14012b2f1:	mov    -0x8(%r13),%rax
   14012b2f5:	mov    $0x1,%esi
   14012b2fa:	mov    %rax,0x1c8(%rsp)
   14012b302:	jmp    140125af4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1544>
   14012b307:	cmp    $0x1,%sil
   14012b30b:	je     14012f4c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf17>
   14012b311:	lea    0x8(%r13),%rax
   14012b315:	cmp    0x30(%rsp),%rax
   14012b31a:	jae    140134461 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfeb1>
   14012b320:	mov    0x1d0(%rsp),%rdx
   14012b328:	mov    %r13,%rax
   14012b32b:	test   %dil,%dil
   14012b32e:	lea    0x8(%r13),%r13
   14012b332:	mov    %rdx,(%rax)
   14012b335:	mov    0x1c8(%rsp),%rax
   14012b33d:	movabs $0xfffa000000000001,%rdx
   14012b347:	mov    %rax,0x1d0(%rsp)
   14012b34f:	movabs $0xfffa000000000000,%rax
   14012b359:	cmovne %rdx,%rax
   14012b35d:	jmp    140125a58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a8>
   14012b362:	mov    %r12,%rcx
   14012b365:	mov    %rax,0x30(%rsp)
   14012b36a:	call   1402d8a70 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release_last_use_cold()>
   14012b36f:	mov    0x30(%rsp),%rax
   14012b374:	jmp    14012474b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19b>
   14012b379:	mov    0x1078(%rdx),%rbp
   14012b380:	jmp    1401274a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ef4>
   14012b385:	mov    0x1c8(%rsp),%rsi
   14012b38d:	jmp    1401271c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c14>
   14012b392:	cmp    %rcx,0x80(%rsp)
   14012b39a:	setg   %al
   14012b39d:	jmp    140128dc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4819>
   14012b3a2:	mov    %rdx,%rax
   14012b3a5:	shr    $0x20,%rax
   14012b3a9:	cmp    $0x5,%ax
   14012b3ad:	jne    14012b3f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6e47>
   14012b3af:	mov    0x2b0(%rsp),%rcx
   14012b3b7:	movabs $0xffff000000000000,%rax
   14012b3c1:	movabs $0xfff8000000000000,%r8
   14012b3cb:	and    %rcx,%rax
   14012b3ce:	cmp    %r8,%rax
   14012b3d1:	je     1401267b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2203>
   14012b3d7:	movabs $0xffffffff00000000,%rax
   14012b3e1:	and    %rax,%rcx
   14012b3e4:	movabs $0xfffd000500000000,%rax
   14012b3ee:	cmp    %rax,%rcx
   14012b3f1:	je     1401267b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2203>
   14012b3f7:	mov    0x2b0(%rsp),%rax
   14012b3ff:	movabs $0xfffc000000000000,%rcx
   14012b409:	cmp    %rcx,%rax
   14012b40c:	je     14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   14012b412:	movabs $0xfff7ffffffffffff,%rcx
   14012b41c:	cmp    %rax,%rcx
   14012b41f:	jae    14012dcc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9719>
   14012b425:	movabs $0xffffffff00000000,%rcx
   14012b42f:	movabs $0xfffd000000000000,%r8
   14012b439:	and    %rdx,%rcx
   14012b43c:	cmp    %r8,%rcx
   14012b43f:	je     140131f9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9ee>
   14012b445:	movabs $0xffff000000000000,%rdx
   14012b44f:	and    %rax,%rdx
   14012b452:	cmp    %r8,%rdx
   14012b455:	je     140132e0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe85c>
   14012b45b:	movabs $0xfffd000100000000,%rax
   14012b465:	cmp    %rax,%rcx
   14012b468:	jne    1401267b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2203>
   14012b46e:	lea    0x2b0(%rsp),%rdx
   14012b476:	lea    0x710(%rsp),%rcx
   14012b47e:	vzeroupper
   14012b481:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012b486:	lea    0x540(%rsp),%rax
   14012b48e:	lea    0x2a8(%rsp),%rdx
   14012b496:	mov    %rax,%rcx
   14012b499:	mov    %rax,0x40(%rsp)
   14012b49e:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012b4a3:	mov    0x40(%rsp),%rcx
   14012b4a8:	lea    0x710(%rsp),%rdx
   14012b4b0:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012b4b5:	test   %eax,%eax
   14012b4b7:	setne  %al
   14012b4ba:	jmp    1401267d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2229>
   14012b4bf:	mov    0x360(%rsp),%rcx
   14012b4c7:	and    %rcx,%rax
   14012b4ca:	cmp    %r8,%rax
   14012b4cd:	jne    140128e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48be>
   14012b4d3:	shl    $0x10,%rcx
   14012b4d7:	shl    $0x10,%rdx
   14012b4db:	movabs $0xffffffffffff,%r8
   14012b4e5:	sar    $0x10,%rcx
   14012b4e9:	sar    $0x10,%rdx
   14012b4ed:	add    %rcx,%rdx
   14012b4f0:	movabs $0x800000000000,%rcx
   14012b4fa:	add    %rdx,%rcx
   14012b4fd:	cmp    %rcx,%r8
   14012b500:	jb     140128e6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x48be>
   14012b506:	and    %r8,%rdx
   14012b509:	or     %rdx,%rax
   14012b50c:	mov    %rax,0x1c8(%rsp)
   14012b514:	cmpb   $0x0,0x1040(%rbx)
   14012b51b:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012b521:	mov    %r12,%rax
   14012b524:	lea    0x295b75(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b52b:	lea    0x1(%r12),%r12
   14012b530:	movzbl (%rax),%eax
   14012b533:	jmp    *(%rdi,%rax,8)
   14012b536:	mov    %r8,%rax
   14012b539:	shr    $0x20,%rax
   14012b53d:	cmp    $0x3,%ax
   14012b541:	je     14012f84c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb29c>
   14012b547:	cmp    $0x2,%ax
   14012b54b:	jne    140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012b551:	mov    %r8,0x350(%rsp)
   14012b559:	lea    0x350(%rsp),%rcx
   14012b561:	vzeroupper
   14012b564:	call   14021c730 <setun::VMValue::payload() const>
   14012b569:	mov    0x48(%rax),%rdi
   14012b56d:	test   %rdi,%rdi
   14012b570:	je     140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012b576:	lea    0x710(%rsp),%rax
   14012b57e:	lea    0x348(%rsp),%rdx
   14012b586:	mov    %rax,%rcx
   14012b589:	mov    %rax,0x40(%rsp)
   14012b58e:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b593:	mov    0x40(%rsp),%rdx
   14012b598:	lea    0x340(%rsp),%r8
   14012b5a0:	mov    %rdi,%rcx
   14012b5a3:	call   140212080 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b5a8:	mov    0x710(%rsp),%rcx
   14012b5b0:	lea    0x720(%rsp),%rax
   14012b5b8:	cmp    %rax,%rcx
   14012b5bb:	je     140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012b5c1:	mov    0x720(%rsp),%rax
   14012b5c9:	lea    0x1(%rax),%rdx
   14012b5cd:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012b5d2:	jmp    140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012b5d7:	mov    0x40(%rsp),%r10
   14012b5dc:	mov    (%r10),%r10
   14012b5df:	and    %r10,%rcx
   14012b5e2:	cmp    %rax,%rcx
   14012b5e5:	jne    140128476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ec6>
   14012b5eb:	mov    %r10,%rax
   14012b5ee:	shl    $0x10,%rax
   14012b5f2:	sar    $0x10,%rax
   14012b5f6:	mov    %rax,%r10
   14012b5f9:	mov    %r8,%rax
   14012b5fc:	shl    $0x10,%rax
   14012b600:	sar    $0x10,%rax
   14012b604:	add    %rax,%r10
   14012b607:	movabs $0x800000000000,%rax
   14012b611:	lea    (%r10,%rax,1),%r8
   14012b615:	movabs $0xffffffffffff,%rax
   14012b61f:	cmp    %r8,%rax
   14012b622:	jb     140128476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ec6>
   14012b628:	and    %r10,%rax
   14012b62b:	or     %rcx,%rax
   14012b62e:	mov    %rax,(%rdx,%r9,8)
   14012b632:	cmpb   $0x0,0x1040(%rbx)
   14012b639:	je     14012b100 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b50>
   14012b63f:	movzbl 0x6(%rdi),%eax
   14012b643:	lea    0x7(%rdi),%r12
   14012b647:	lea    0x295a52(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b64e:	jmp    *(%rdi,%rax,8)
   14012b651:	mov    0x380(%rsp),%rcx
   14012b659:	and    %rcx,%rax
   14012b65c:	cmp    %r8,%rax
   14012b65f:	jne    140128fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a36>
   14012b665:	shl    $0x10,%rcx
   14012b669:	shl    $0x10,%rdx
   14012b66d:	movabs $0xffffffffffff,%r8
   14012b677:	sar    $0x10,%rcx
   14012b67b:	sar    $0x10,%rdx
   14012b67f:	imul   %rcx,%rdx
   14012b683:	movabs $0x800000000000,%rcx
   14012b68d:	add    %rdx,%rcx
   14012b690:	cmp    %rcx,%r8
   14012b693:	jb     140128fe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a36>
   14012b699:	and    %r8,%rdx
   14012b69c:	or     %rdx,%rax
   14012b69f:	mov    %rax,0x1c8(%rsp)
   14012b6a7:	cmpb   $0x0,0x1040(%rbx)
   14012b6ae:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012b6b4:	mov    %r12,%rax
   14012b6b7:	lea    0x2959e2(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b6be:	lea    0x1(%r12),%r12
   14012b6c3:	movzbl (%rax),%eax
   14012b6c6:	jmp    *(%rdi,%rax,8)
   14012b6c9:	mov    0x1048(%rbx),%r11
   14012b6d0:	lea    0x10(%r13),%rax
   14012b6d4:	cmp    0x30(%rsp),%rax
   14012b6d9:	jae    140133a34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf484>
   14012b6df:	mov    0x1050(%rbx),%rax
   14012b6e6:	vzeroupper
   14012b6e9:	mov    0x1d0(%rsp),%rcx
   14012b6f1:	mov    %r13,%rdx
   14012b6f4:	lea    0x10(%r13),%r13
   14012b6f8:	mov    %rcx,-0x10(%r13)
   14012b6fc:	mov    0x1c8(%rsp),%rcx
   14012b704:	mov    %rcx,0x8(%rdx)
   14012b708:	jmp    1401274f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f45>
   14012b70d:	mov    0x1048(%rbx),%r11
   14012b714:	lea    0x10(%r13),%rax
   14012b718:	cmp    0x30(%rsp),%rax
   14012b71d:	jae    1401344bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff0c>
   14012b723:	mov    0x1050(%rbx),%rax
   14012b72a:	vzeroupper
   14012b72d:	mov    0x1d0(%rsp),%rcx
   14012b735:	mov    %r13,%rdx
   14012b738:	lea    0x10(%r13),%r13
   14012b73c:	mov    %rcx,-0x10(%r13)
   14012b740:	mov    0x1c8(%rsp),%rcx
   14012b748:	mov    %rcx,0x8(%rdx)
   14012b74c:	jmp    140128255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ca5>
   14012b751:	mov    %rdx,%rax
   14012b754:	shr    $0x20,%rax
   14012b758:	cmp    $0x3,%ax
   14012b75c:	je     14012f98b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3db>
   14012b762:	cmp    $0x2,%ax
   14012b766:	jne    14012ae38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6888>
   14012b76c:	mov    %rdx,0x328(%rsp)
   14012b774:	lea    0x540(%rsp),%rcx
   14012b77c:	lea    0x328(%rsp),%rdx
   14012b784:	vzeroupper
   14012b787:	call   14021cda0 <setun::VMValue::as_object() const>
   14012b78c:	mov    0x540(%rsp),%rax
   14012b794:	mov    0x548(%rsp),%rdi
   14012b79c:	test   %rax,%rax
   14012b79f:	je     14012b800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7250>
   14012b7a1:	lea    0x710(%rsp),%r10
   14012b7a9:	lea    0x320(%rsp),%rdx
   14012b7b1:	mov    %rax,0x60(%rsp)
   14012b7b6:	mov    %r10,%rcx
   14012b7b9:	mov    %r10,0x40(%rsp)
   14012b7be:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012b7c3:	mov    0x40(%rsp),%rdx
   14012b7c8:	mov    0x60(%rsp),%rcx
   14012b7cd:	lea    0x318(%rsp),%r8
   14012b7d5:	call   140212080 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   14012b7da:	mov    0x710(%rsp),%rcx
   14012b7e2:	lea    0x720(%rsp),%rax
   14012b7ea:	cmp    %rax,%rcx
   14012b7ed:	je     14012b800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7250>
   14012b7ef:	mov    0x720(%rsp),%rax
   14012b7f7:	lea    0x1(%rax),%rdx
   14012b7fb:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012b800:	test   %rdi,%rdi
   14012b803:	je     14012ae38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6888>
   14012b809:	mov    %rdi,%rcx
   14012b80c:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012b811:	jmp    14012ae38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6888>
   14012b816:	mov    0x370(%rsp),%r8
   14012b81e:	and    %r8,%rdx
   14012b821:	cmp    %rcx,%rdx
   14012b824:	jne    140128f2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x497a>
   14012b82a:	mov    %r8,%rcx
   14012b82d:	shl    $0x10,%rax
   14012b831:	movabs $0xffffffffffff,%r8
   14012b83b:	shl    $0x10,%rcx
   14012b83f:	sar    $0x10,%rax
   14012b843:	sar    $0x10,%rcx
   14012b847:	sub    %rcx,%rax
   14012b84a:	movabs $0x800000000000,%rcx
   14012b854:	add    %rax,%rcx
   14012b857:	cmp    %rcx,%r8
   14012b85a:	jb     140128f2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x497a>
   14012b860:	and    %r8,%rax
   14012b863:	or     %rdx,%rax
   14012b866:	mov    %rax,0x1c8(%rsp)
   14012b86e:	cmpb   $0x0,0x1040(%rbx)
   14012b875:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012b87b:	mov    %r12,%rax
   14012b87e:	lea    0x29581b(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b885:	lea    0x1(%r12),%r12
   14012b88a:	movzbl (%rax),%eax
   14012b88d:	jmp    *(%rdi,%rax,8)
   14012b890:	mov    0x1048(%rbx),%r11
   14012b897:	lea    0x10(%r13),%rax
   14012b89b:	cmp    0x30(%rsp),%rax
   14012b8a0:	jae    140134241 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc91>
   14012b8a6:	mov    0x1050(%rbx),%rax
   14012b8ad:	vzeroupper
   14012b8b0:	mov    0x1d0(%rsp),%rcx
   14012b8b8:	mov    %r13,%rdx
   14012b8bb:	lea    0x10(%r13),%r13
   14012b8bf:	mov    %rcx,-0x10(%r13)
   14012b8c3:	mov    0x1c8(%rsp),%rcx
   14012b8cb:	mov    %rcx,0x8(%rdx)
   14012b8cf:	jmp    1401275cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x301b>
   14012b8d4:	mov    0x1f0(%rsp),%r8
   14012b8dc:	and    %r8,%rdx
   14012b8df:	cmp    %rcx,%rdx
   14012b8e2:	jne    140125e5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18af>
   14012b8e8:	mov    %r8,%rcx
   14012b8eb:	shl    $0x10,%rax
   14012b8ef:	movabs $0xffffffffffff,%r8
   14012b8f9:	shl    $0x10,%rcx
   14012b8fd:	sar    $0x10,%rax
   14012b901:	sar    $0x10,%rcx
   14012b905:	sub    %rcx,%rax
   14012b908:	movabs $0x800000000000,%rcx
   14012b912:	add    %rax,%rcx
   14012b915:	cmp    %rcx,%r8
   14012b918:	jb     140125e5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x18af>
   14012b91e:	and    %r8,%rax
   14012b921:	mov    %r12,%rcx
   14012b924:	or     %rdx,%rax
   14012b927:	mov    %rax,0x1c8(%rsp)
   14012b92f:	cmpb   $0x0,0x1520f(%rbx)
   14012b936:	je     14012b96c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73bc>
   14012b938:	mov    0xe8(%r14),%rax
   14012b93f:	mov    0xf0(%r14),%r8
   14012b946:	lea    -0x1(%r12),%rdx
   14012b94b:	sub    %r15,%rdx
   14012b94e:	sub    %rax,%r8
   14012b951:	cmp    %r8,%rdx
   14012b954:	jae    14012b96c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73bc>
   14012b956:	add    %rdx,%rax
   14012b959:	movzbl (%rax),%edi
   14012b95c:	lea    0x1(%rdi),%edx
   14012b95f:	mov    %dl,(%rax)
   14012b961:	cmp    $0x7,%dl
   14012b964:	jbe    14012b96c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73bc>
   14012b966:	movb   $0xbd,-0x1(%r12)
   14012b96c:	cmpb   $0x0,0x1040(%rbx)
   14012b973:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012b979:	movzbl (%rcx),%eax
   14012b97c:	lea    0x29571d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012b983:	lea    0x1(%rcx),%r12
   14012b987:	jmp    *(%rdi,%rax,8)
   14012b98a:	mov    0x1048(%rbx),%r11
   14012b991:	lea    0x10(%r13),%rax
   14012b995:	cmp    0x30(%rsp),%rax
   14012b99a:	jae    140133e87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8d7>
   14012b9a0:	mov    0x1050(%rbx),%rax
   14012b9a7:	vzeroupper
   14012b9aa:	mov    0x1d0(%rsp),%rcx
   14012b9b2:	mov    %r13,%rdx
   14012b9b5:	lea    0x10(%r13),%r13
   14012b9b9:	mov    %rcx,-0x10(%r13)
   14012b9bd:	mov    0x1c8(%rsp),%rcx
   14012b9c5:	mov    %rcx,0x8(%rdx)
   14012b9c9:	jmp    140127acf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x351f>
   14012b9ce:	mov    0x1048(%rbx),%r11
   14012b9d5:	lea    0x10(%r13),%rax
   14012b9d9:	cmp    0x30(%rsp),%rax
   14012b9de:	jae    140133cab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6fb>
   14012b9e4:	mov    0x1050(%rbx),%rax
   14012b9eb:	vzeroupper
   14012b9ee:	mov    0x1d0(%rsp),%rcx
   14012b9f6:	mov    %r13,%rdx
   14012b9f9:	lea    0x10(%r13),%r13
   14012b9fd:	mov    %rcx,-0x10(%r13)
   14012ba01:	mov    0x1c8(%rsp),%rcx
   14012ba09:	mov    %rcx,0x8(%rdx)
   14012ba0d:	jmp    140127ba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35f5>
   14012ba12:	mov    0x1048(%rbx),%r11
   14012ba19:	lea    0x10(%r13),%rax
   14012ba1d:	cmp    0x30(%rsp),%rax
   14012ba22:	jae    1401341e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc39>
   14012ba28:	mov    0x1050(%rbx),%rax
   14012ba2f:	vzeroupper
   14012ba32:	mov    0x1d0(%rsp),%rcx
   14012ba3a:	mov    %r13,%rdx
   14012ba3d:	lea    0x10(%r13),%r13
   14012ba41:	mov    %rcx,-0x10(%r13)
   14012ba45:	mov    0x1c8(%rsp),%rcx
   14012ba4d:	mov    %rcx,0x8(%rdx)
   14012ba51:	jmp    140127e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3877>
   14012ba56:	mov    0x1048(%rbx),%r11
   14012ba5d:	lea    0x10(%r13),%rax
   14012ba61:	cmp    0x30(%rsp),%rax
   14012ba66:	jae    140134391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfde1>
   14012ba6c:	mov    0x1050(%rbx),%rax
   14012ba73:	vzeroupper
   14012ba76:	mov    0x1d0(%rsp),%rcx
   14012ba7e:	mov    %r13,%rdx
   14012ba81:	lea    0x10(%r13),%r13
   14012ba85:	mov    %rcx,-0x10(%r13)
   14012ba89:	mov    0x1c8(%rsp),%rcx
   14012ba91:	mov    %rcx,0x8(%rdx)
   14012ba95:	jmp    140127c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36cb>
   14012ba9a:	mov    0x1048(%rbx),%r11
   14012baa1:	lea    0x10(%r13),%rax
   14012baa5:	cmp    0x30(%rsp),%rax
   14012baaa:	jae    140134297 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfce7>
   14012bab0:	mov    0x1050(%rbx),%rax
   14012bab7:	vzeroupper
   14012baba:	mov    0x1d0(%rsp),%rcx
   14012bac2:	mov    %r13,%rdx
   14012bac5:	lea    0x10(%r13),%r13
   14012bac9:	mov    %rcx,-0x10(%r13)
   14012bacd:	mov    0x1c8(%rsp),%rcx
   14012bad5:	mov    %rcx,0x8(%rdx)
   14012bad9:	jmp    140127fd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a23>
   14012bade:	mov    0x1048(%rbx),%r11
   14012bae5:	lea    0x10(%r13),%rax
   14012bae9:	cmp    0x30(%rsp),%rax
   14012baee:	jae    1401342c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd13>
   14012baf4:	mov    0x1050(%rbx),%rax
   14012bafb:	vzeroupper
   14012bafe:	mov    0x1d0(%rsp),%rcx
   14012bb06:	mov    %r13,%rdx
   14012bb09:	lea    0x10(%r13),%r13
   14012bb0d:	mov    %rcx,-0x10(%r13)
   14012bb11:	mov    0x1c8(%rsp),%rcx
   14012bb19:	mov    %rcx,0x8(%rdx)
   14012bb1d:	jmp    140127d51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37a1>
   14012bb22:	mov    0x1048(%rbx),%r11
   14012bb29:	lea    0x10(%r13),%rax
   14012bb2d:	cmp    0x30(%rsp),%rax
   14012bb32:	jae    140132f79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9c9>
   14012bb38:	mov    0x1050(%rbx),%rax
   14012bb3f:	vzeroupper
   14012bb42:	mov    0x1d0(%rsp),%rcx
   14012bb4a:	mov    %r13,%rdx
   14012bb4d:	lea    0x10(%r13),%r13
   14012bb51:	mov    %rcx,-0x10(%r13)
   14012bb55:	mov    0x1c8(%rsp),%rcx
   14012bb5d:	mov    %rcx,0x8(%rdx)
   14012bb61:	jmp    140127efd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x394d>
   14012bb66:	mov    0x1048(%rbx),%r11
   14012bb6d:	lea    0x10(%r13),%rax
   14012bb71:	cmp    0x30(%rsp),%rax
   14012bb76:	jae    140134215 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc65>
   14012bb7c:	mov    0x1050(%rbx),%rax
   14012bb83:	vzeroupper
   14012bb86:	mov    0x1d0(%rsp),%rcx
   14012bb8e:	mov    %r13,%rdx
   14012bb91:	lea    0x10(%r13),%r13
   14012bb95:	mov    %rcx,-0x10(%r13)
   14012bb99:	mov    0x1c8(%rsp),%rcx
   14012bba1:	mov    %rcx,0x8(%rdx)
   14012bba5:	jmp    1401280a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3af9>
   14012bbaa:	mov    0x3c0(%rsp),%rcx
   14012bbb2:	and    %rcx,%rax
   14012bbb5:	cmp    %rdx,%rax
   14012bbb8:	jne    1401294cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4f1d>
   14012bbbe:	mov    0x3b8(%rsp),%rax
   14012bbc6:	shl    $0x10,%rcx
   14012bbca:	movabs $0xfffa000000000000,%rdx
   14012bbd4:	shl    $0x10,%rax
   14012bbd8:	cmp    %rcx,%rax
   14012bbdb:	movabs $0xfffa000000000001,%rax
   14012bbe5:	cmovg  %rax,%rdx
   14012bbe9:	mov    %rdx,0x1c8(%rsp)
   14012bbf1:	cmpb   $0x0,0x1040(%rbx)
   14012bbf8:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012bbfe:	mov    %r12,%rax
   14012bc01:	lea    0x295498(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012bc08:	lea    0x1(%r12),%r12
   14012bc0d:	movzbl (%rax),%eax
   14012bc10:	jmp    *(%rdi,%rax,8)
   14012bc13:	and    %rdx,%rcx
   14012bc16:	cmp    %r9,%rcx
   14012bc19:	je     14013003c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba8c>
   14012bc1f:	movabs $0xfffd000000000000,%rax
   14012bc29:	cmp    %rax,%rcx
   14012bc2c:	je     140131a01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd451>
   14012bc32:	movabs $0xfffc000000000000,%rax
   14012bc3c:	cmp    %rax,%rdx
   14012bc3f:	je     14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   14012bc45:	movabs $0xfff7ffffffffffff,%rax
   14012bc4f:	cmp    %rdx,%rax
   14012bc52:	jae    14012de8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98de>
   14012bc58:	movabs $0xffffffff00000000,%rax
   14012bc62:	and    %r8,%rax
   14012bc65:	movabs $0xfffd000000000000,%r8
   14012bc6f:	cmp    %r8,%rax
   14012bc72:	je     140131955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3a5>
   14012bc78:	movabs $0xffff000000000000,%rcx
   14012bc82:	and    %rdx,%rcx
   14012bc85:	cmp    %r8,%rcx
   14012bc88:	je     14012f20d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac5d>
   14012bc8e:	movabs $0xfffd000100000000,%rdx
   14012bc98:	cmp    %rdx,%rax
   14012bc9b:	jne    1401268e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2336>
   14012bca1:	lea    0x2c0(%rsp),%rdx
   14012bca9:	lea    0x710(%rsp),%rcx
   14012bcb1:	vzeroupper
   14012bcb4:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012bcb9:	lea    0x540(%rsp),%rax
   14012bcc1:	lea    0x2b8(%rsp),%rdx
   14012bcc9:	mov    %rax,%rcx
   14012bccc:	mov    %rax,0x40(%rsp)
   14012bcd1:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012bcd6:	mov    0x40(%rsp),%rcx
   14012bcdb:	lea    0x710(%rsp),%rdx
   14012bce3:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bce8:	shr    $0x1f,%eax
   14012bceb:	jmp    14012690c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x235c>
   14012bcf0:	and    %rdx,%rcx
   14012bcf3:	cmp    %r9,%rcx
   14012bcf6:	je     14012fd16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb766>
   14012bcfc:	movabs $0xfffd000000000000,%rax
   14012bd06:	cmp    %rax,%rcx
   14012bd09:	je     140132600 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe050>
   14012bd0f:	movabs $0xfff7ffffffffffff,%rax
   14012bd19:	cmp    %rdx,%rax
   14012bd1c:	jae    14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   14012bd22:	movabs $0xfffc000000000000,%rax
   14012bd2c:	cmp    %rax,%rdx
   14012bd2f:	je     14012ddf2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9842>
   14012bd35:	movabs $0xffffffff00000000,%rax
   14012bd3f:	and    %r8,%rax
   14012bd42:	movabs $0xfffd000000000000,%r8
   14012bd4c:	cmp    %r8,%rax
   14012bd4f:	je     140132552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfa2>
   14012bd55:	movabs $0xffff000000000000,%rcx
   14012bd5f:	and    %rdx,%rcx
   14012bd62:	cmp    %r8,%rcx
   14012bd65:	je     14012f2ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacfe>
   14012bd6b:	movabs $0xfffd000100000000,%rdx
   14012bd75:	cmp    %rdx,%rax
   14012bd78:	jne    140126a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2469>
   14012bd7e:	lea    0x2d0(%rsp),%rdx
   14012bd86:	lea    0x710(%rsp),%rcx
   14012bd8e:	vzeroupper
   14012bd91:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012bd96:	lea    0x540(%rsp),%rax
   14012bd9e:	lea    0x2c8(%rsp),%rdx
   14012bda6:	mov    %rax,%rcx
   14012bda9:	mov    %rax,0x40(%rsp)
   14012bdae:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012bdb3:	mov    0x40(%rsp),%rcx
   14012bdb8:	lea    0x710(%rsp),%rdx
   14012bdc0:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012bdc5:	test   %eax,%eax
   14012bdc7:	setle  %al
   14012bdca:	jmp    140126a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x248f>
   14012bdcf:	shr    $0x20,%rax
   14012bdd3:	cmp    $0x1,%ax
   14012bdd7:	je     14012fd9f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7ef>
   14012bddd:	cmp    $0x5,%ax
   14012bde1:	jne    1401255e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1031>
   14012bde7:	mov    %r9,0xa0(%rsp)
   14012bdef:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012bdf4:	jmp    1401255f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1043>
   14012bdf9:	mov    %edi,0x720(%rsp)
   14012be00:	mov    $0x1,%esi
   14012be05:	lea    0x1a0(%rsp),%rdx
   14012be0d:	lea    0x540(%rsp),%rcx
   14012be15:	movl   $0x0,0x724(%rsp)
   14012be20:	mov    0x720(%rsp),%rax
   14012be28:	vmovdqa %xmm0,0x710(%rsp)
   14012be31:	mov    %rax,0x1b0(%rsp)
   14012be39:	vmovdqa %xmm0,0x1a0(%rsp)
   14012be42:	vzeroupper
   14012be45:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012be4a:	mov    0x540(%rsp),%rax
   14012be52:	mov    %rax,0x1c8(%rsp)
   14012be5a:	jmp    1401259ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fb>
   14012be5f:	lea    0x10(%r13),%rax
   14012be63:	cmp    0x30(%rsp),%rax
   14012be68:	jae    140133b9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5ec>
   14012be6e:	mov    0x1d0(%rsp),%rdx
   14012be76:	mov    %r13,%rax
   14012be79:	xor    %esi,%esi
   14012be7b:	lea    0x10(%r13),%r13
   14012be7f:	mov    %rdx,-0x10(%r13)
   14012be83:	mov    0x1c8(%rsp),%rdx
   14012be8b:	mov    %rdx,0x8(%rax)
   14012be8f:	jmp    140127253 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ca3>
   14012be94:	mov    0x1048(%rbx),%r11
   14012be9b:	lea    0x10(%r13),%rax
   14012be9f:	cmp    0x30(%rsp),%rax
   14012bea4:	jae    140133d79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7c9>
   14012beaa:	mov    0x1050(%rbx),%rax
   14012beb1:	vzeroupper
   14012beb4:	mov    0x1d0(%rsp),%rcx
   14012bebc:	mov    %r13,%rdx
   14012bebf:	lea    0x10(%r13),%r13
   14012bec3:	mov    %rcx,-0x10(%r13)
   14012bec7:	mov    0x1c8(%rsp),%rcx
   14012becf:	mov    %rcx,0x8(%rdx)
   14012bed3:	jmp    14012a7e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6232>
   14012bed8:	mov    0x1048(%rbx),%r11
   14012bedf:	lea    0x10(%r13),%rax
   14012bee3:	cmp    0x30(%rsp),%rax
   14012bee8:	jae    14013386e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2be>
   14012beee:	mov    0x1050(%rbx),%rax
   14012bef5:	vzeroupper
   14012bef8:	mov    0x1d0(%rsp),%rcx
   14012bf00:	mov    %r13,%rdx
   14012bf03:	lea    0x10(%r13),%r13
   14012bf07:	mov    %rcx,-0x10(%r13)
   14012bf0b:	mov    0x1c8(%rsp),%rcx
   14012bf13:	mov    %rcx,0x8(%rdx)
   14012bf17:	jmp    1401276a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30f1>
   14012bf1c:	lea    0x10(%r13),%rax
   14012bf20:	cmp    0x30(%rsp),%rax
   14012bf25:	jae    140133c3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf68e>
   14012bf2b:	vzeroupper
   14012bf2e:	mov    0x1d0(%rsp),%rdx
   14012bf36:	mov    %r13,%rax
   14012bf39:	xor    %esi,%esi
   14012bf3b:	lea    0x10(%r13),%r13
   14012bf3f:	mov    %rdx,-0x10(%r13)
   14012bf43:	mov    0x1c8(%rsp),%rdx
   14012bf4b:	mov    %rdx,0x8(%rax)
   14012bf4f:	jmp    14012abe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6636>
   14012bf54:	mov    0x1048(%rbx),%r11
   14012bf5b:	lea    0x10(%r13),%rax
   14012bf5f:	cmp    0x30(%rsp),%rax
   14012bf64:	jae    1401339e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf430>
   14012bf6a:	mov    0x1050(%rbx),%rax
   14012bf71:	vzeroupper
   14012bf74:	mov    0x1d0(%rsp),%rcx
   14012bf7c:	mov    %r13,%rdx
   14012bf7f:	lea    0x10(%r13),%r13
   14012bf83:	mov    %rcx,-0x10(%r13)
   14012bf87:	mov    0x1c8(%rsp),%rcx
   14012bf8f:	mov    %rcx,0x8(%rdx)
   14012bf93:	jmp    14012a3b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e04>
   14012bf98:	and    %rcx,%rdx
   14012bf9b:	cmp    %r9,%rdx
   14012bf9e:	je     14012ff2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb97f>
   14012bfa4:	movabs $0xfffd000000000000,%rax
   14012bfae:	cmp    %rax,%rdx
   14012bfb1:	je     1401320f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb44>
   14012bfb7:	movabs $0xfffc000000000000,%rax
   14012bfc1:	cmp    %rax,%rcx
   14012bfc4:	je     14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   14012bfca:	movabs $0xfff7ffffffffffff,%rax
   14012bfd4:	cmp    %rcx,%rax
   14012bfd7:	jae    14012df6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x99bf>
   14012bfdd:	movabs $0xffffffff00000000,%rax
   14012bfe7:	and    %r8,%rax
   14012bfea:	movabs $0xfffd000000000000,%r8
   14012bff4:	cmp    %r8,%rax
   14012bff7:	je     140131eec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd93c>
   14012bffd:	movabs $0xffff000000000000,%rdx
   14012c007:	and    %rcx,%rdx
   14012c00a:	cmp    %r8,%rdx
   14012c00d:	je     14012f32d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad7d>
   14012c013:	movabs $0xfffd000100000000,%rdx
   14012c01d:	cmp    %rdx,%rax
   14012c020:	jne    14012667e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ce>
   14012c026:	lea    0x2a0(%rsp),%rdx
   14012c02e:	lea    0x710(%rsp),%rcx
   14012c036:	vzeroupper
   14012c039:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c03e:	lea    0x540(%rsp),%rax
   14012c046:	lea    0x298(%rsp),%rdx
   14012c04e:	mov    %rax,%rcx
   14012c051:	mov    %rax,0x40(%rsp)
   14012c056:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c05b:	mov    0x40(%rsp),%rcx
   14012c060:	lea    0x710(%rsp),%rdx
   14012c068:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c06d:	test   %eax,%eax
   14012c06f:	sete   %dil
   14012c073:	jmp    1401266a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20f5>
   14012c078:	and    %rdx,%rcx
   14012c07b:	cmp    %r9,%rcx
   14012c07e:	je     1401301f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc40>
   14012c084:	movabs $0xfffd000000000000,%rax
   14012c08e:	cmp    %rax,%rcx
   14012c091:	je     1401324fd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf4d>
   14012c097:	movabs $0xfffc000000000000,%rax
   14012c0a1:	cmp    %rax,%rdx
   14012c0a4:	je     14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   14012c0aa:	movabs $0xfff7ffffffffffff,%rax
   14012c0b4:	cmp    %rdx,%rax
   14012c0b7:	jae    14012debb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x990b>
   14012c0bd:	movabs $0xffffffff00000000,%rax
   14012c0c7:	and    %r8,%rax
   14012c0ca:	movabs $0xfffd000000000000,%r8
   14012c0d4:	cmp    %r8,%rax
   14012c0d7:	je     14013244f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde9f>
   14012c0dd:	movabs $0xffff000000000000,%rcx
   14012c0e7:	and    %rdx,%rcx
   14012c0ea:	cmp    %r8,%rcx
   14012c0ed:	je     14012f104 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab54>
   14012c0f3:	movabs $0xfffd000100000000,%rdx
   14012c0fd:	cmp    %rdx,%rax
   14012c100:	jne    140126c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26cf>
   14012c106:	lea    0x2f0(%rsp),%rdx
   14012c10e:	lea    0x710(%rsp),%rcx
   14012c116:	vzeroupper
   14012c119:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c11e:	lea    0x540(%rsp),%rax
   14012c126:	lea    0x2e8(%rsp),%rdx
   14012c12e:	mov    %rax,%rcx
   14012c131:	mov    %rax,0x40(%rsp)
   14012c136:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c13b:	mov    0x40(%rsp),%rcx
   14012c140:	lea    0x710(%rsp),%rdx
   14012c148:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c14d:	not    %eax
   14012c14f:	shr    $0x1f,%eax
   14012c152:	jmp    140126ca5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26f5>
   14012c157:	mov    0x1048(%rbx),%r11
   14012c15e:	lea    0x10(%r13),%rax
   14012c162:	cmp    0x30(%rsp),%rax
   14012c167:	jae    140133b70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5c0>
   14012c16d:	mov    0x1050(%rbx),%rax
   14012c174:	vzeroupper
   14012c177:	mov    0x1d0(%rsp),%rcx
   14012c17f:	mov    %r13,%rdx
   14012c182:	lea    0x10(%r13),%r13
   14012c186:	mov    %rcx,-0x10(%r13)
   14012c18a:	mov    0x1c8(%rsp),%rcx
   14012c192:	mov    %rcx,0x8(%rdx)
   14012c196:	jmp    14012a208 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c58>
   14012c19b:	mov    0x1048(%rbx),%r11
   14012c1a2:	lea    0x10(%r13),%rax
   14012c1a6:	cmp    0x30(%rsp),%rax
   14012c1ab:	jae    140133396 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xede6>
   14012c1b1:	mov    0x1050(%rbx),%rax
   14012c1b8:	vzeroupper
   14012c1bb:	mov    0x1d0(%rsp),%rcx
   14012c1c3:	mov    %r13,%rdx
   14012c1c6:	lea    0x10(%r13),%r13
   14012c1ca:	mov    %rcx,-0x10(%r13)
   14012c1ce:	mov    0x1c8(%rsp),%rcx
   14012c1d6:	mov    %rcx,0x8(%rdx)
   14012c1da:	jmp    14012a2de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d2e>
   14012c1df:	mov    0x1068(%rbx),%rdx
   14012c1e6:	mov    0x1c8(%rsp),%rcx
   14012c1ee:	xor    %esi,%esi
   14012c1f0:	mov    %rcx,(%rdx,%rbp,8)
   14012c1f4:	jmp    14012739a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2dea>
   14012c1f9:	mov    0x1048(%rbx),%r11
   14012c200:	lea    0x10(%r13),%rax
   14012c204:	cmp    0x30(%rsp),%rax
   14012c209:	jae    140133916 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf366>
   14012c20f:	mov    0x1050(%rbx),%rax
   14012c216:	vzeroupper
   14012c219:	mov    0x1d0(%rsp),%rcx
   14012c221:	mov    %r13,%rdx
   14012c224:	lea    0x10(%r13),%r13
   14012c228:	mov    %rcx,-0x10(%r13)
   14012c22c:	mov    0x1c8(%rsp),%rcx
   14012c234:	mov    %rcx,0x8(%rdx)
   14012c238:	jmp    1401252d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd23>
   14012c23d:	mov    0x200(%rsp),%r8
   14012c245:	and    %r8,%rdx
   14012c248:	cmp    %rcx,%rdx
   14012c24b:	jne    140125f15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1965>
   14012c251:	mov    %r8,%rcx
   14012c254:	shl    $0x10,%rax
   14012c258:	movabs $0xffffffffffff,%r8
   14012c262:	shl    $0x10,%rcx
   14012c266:	sar    $0x10,%rax
   14012c26a:	sar    $0x10,%rcx
   14012c26e:	imul   %rcx,%rax
   14012c272:	movabs $0x800000000000,%rcx
   14012c27c:	add    %rax,%rcx
   14012c27f:	cmp    %rcx,%r8
   14012c282:	jb     140125f15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1965>
   14012c288:	and    %r8,%rax
   14012c28b:	mov    %r12,%rcx
   14012c28e:	or     %rdx,%rax
   14012c291:	mov    %rax,0x1c8(%rsp)
   14012c299:	cmpb   $0x0,0x1520f(%rbx)
   14012c2a0:	je     14012c2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d26>
   14012c2a2:	mov    0xe8(%r14),%rax
   14012c2a9:	mov    0xf0(%r14),%r8
   14012c2b0:	lea    -0x1(%r12),%rdx
   14012c2b5:	sub    %r15,%rdx
   14012c2b8:	sub    %rax,%r8
   14012c2bb:	cmp    %r8,%rdx
   14012c2be:	jae    14012c2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d26>
   14012c2c0:	add    %rdx,%rax
   14012c2c3:	movzbl (%rax),%edi
   14012c2c6:	lea    0x1(%rdi),%edx
   14012c2c9:	mov    %dl,(%rax)
   14012c2cb:	cmp    $0x7,%dl
   14012c2ce:	jbe    14012c2d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7d26>
   14012c2d0:	movb   $0xbe,-0x1(%r12)
   14012c2d6:	cmpb   $0x0,0x1040(%rbx)
   14012c2dd:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c2e3:	movzbl (%rcx),%eax
   14012c2e6:	lea    0x294db3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c2ed:	lea    0x1(%rcx),%r12
   14012c2f1:	jmp    *(%rdi,%rax,8)
   14012c2f4:	mov    0x3b0(%rsp),%rcx
   14012c2fc:	and    %rcx,%rax
   14012c2ff:	cmp    %rdx,%rax
   14012c302:	jne    140129367 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4db7>
   14012c308:	movabs $0xfffa000000000000,%rax
   14012c312:	cmp    0x3a8(%rsp),%rcx
   14012c31a:	movabs $0xfffa000000000001,%rdx
   14012c324:	cmove  %rdx,%rax
   14012c328:	mov    %rax,0x1c8(%rsp)
   14012c330:	cmpb   $0x0,0x1040(%rbx)
   14012c337:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c33d:	mov    %r12,%rax
   14012c340:	lea    0x294d59(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c347:	lea    0x1(%r12),%r12
   14012c34c:	movzbl (%rax),%eax
   14012c34f:	jmp    *(%rdi,%rax,8)
   14012c352:	mov    0x3d0(%rsp),%rcx
   14012c35a:	and    %rcx,%rax
   14012c35d:	cmp    %rdx,%rax
   14012c360:	jne    140129631 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5081>
   14012c366:	mov    0x3c8(%rsp),%rax
   14012c36e:	shl    $0x10,%rcx
   14012c372:	movabs $0xfffa000000000000,%rdx
   14012c37c:	shl    $0x10,%rax
   14012c380:	cmp    %rcx,%rax
   14012c383:	movabs $0xfffa000000000001,%rax
   14012c38d:	cmovge %rax,%rdx
   14012c391:	mov    %rdx,0x1c8(%rsp)
   14012c399:	cmpb   $0x0,0x1040(%rbx)
   14012c3a0:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c3a6:	mov    %r12,%rax
   14012c3a9:	lea    0x294cf0(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c3b0:	lea    0x1(%r12),%r12
   14012c3b5:	movzbl (%rax),%eax
   14012c3b8:	jmp    *(%rdi,%rax,8)
   14012c3bb:	mov    0x3a0(%rsp),%rcx
   14012c3c3:	and    %rcx,%rax
   14012c3c6:	cmp    %rdx,%rax
   14012c3c9:	jne    140129203 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c53>
   14012c3cf:	mov    0x398(%rsp),%rax
   14012c3d7:	shl    $0x10,%rcx
   14012c3db:	movabs $0xfffa000000000000,%rdx
   14012c3e5:	shl    $0x10,%rax
   14012c3e9:	cmp    %rcx,%rax
   14012c3ec:	movabs $0xfffa000000000001,%rax
   14012c3f6:	cmovle %rax,%rdx
   14012c3fa:	mov    %rdx,0x1c8(%rsp)
   14012c402:	cmpb   $0x0,0x1040(%rbx)
   14012c409:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c40f:	mov    %r12,%rax
   14012c412:	lea    0x294c87(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c419:	lea    0x1(%r12),%r12
   14012c41e:	movzbl (%rax),%eax
   14012c421:	jmp    *(%rdi,%rax,8)
   14012c424:	mov    0x390(%rsp),%rcx
   14012c42c:	and    %rcx,%rax
   14012c42f:	cmp    %rdx,%rax
   14012c432:	jne    14012909f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4aef>
   14012c438:	mov    0x388(%rsp),%rax
   14012c440:	shl    $0x10,%rcx
   14012c444:	movabs $0xfffa000000000000,%rdx
   14012c44e:	shl    $0x10,%rax
   14012c452:	cmp    %rcx,%rax
   14012c455:	movabs $0xfffa000000000001,%rax
   14012c45f:	cmovl  %rax,%rdx
   14012c463:	mov    %rdx,0x1c8(%rsp)
   14012c46b:	cmpb   $0x0,0x1040(%rbx)
   14012c472:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c478:	mov    %r12,%rax
   14012c47b:	lea    0x294c1e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c482:	lea    0x1(%r12),%r12
   14012c487:	movzbl (%rax),%eax
   14012c48a:	jmp    *(%rdi,%rax,8)
   14012c48d:	mov    0x1048(%rbx),%r11
   14012c494:	lea    0x10(%r13),%rax
   14012c498:	cmp    0x30(%rsp),%rax
   14012c49d:	jae    140133714 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf164>
   14012c4a3:	mov    0x1050(%rbx),%rax
   14012c4aa:	vzeroupper
   14012c4ad:	mov    0x1d0(%rsp),%rcx
   14012c4b5:	mov    %r13,%rdx
   14012c4b8:	lea    0x10(%r13),%r13
   14012c4bc:	mov    %rcx,-0x10(%r13)
   14012c4c0:	mov    0x1c8(%rsp),%rcx
   14012c4c8:	mov    %rcx,0x8(%rdx)
   14012c4cc:	jmp    140127777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31c7>
   14012c4d1:	mov    0x1048(%rbx),%r11
   14012c4d8:	lea    0x10(%r13),%rax
   14012c4dc:	cmp    0x30(%rsp),%rax
   14012c4e1:	jae    140133583 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefd3>
   14012c4e7:	mov    0x1050(%rbx),%rax
   14012c4ee:	vzeroupper
   14012c4f1:	mov    0x1d0(%rsp),%rcx
   14012c4f9:	mov    %r13,%rdx
   14012c4fc:	lea    0x10(%r13),%r13
   14012c500:	mov    %rcx,-0x10(%r13)
   14012c504:	mov    0x1c8(%rsp),%rcx
   14012c50c:	mov    %rcx,0x8(%rdx)
   14012c510:	jmp    14012784d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x329d>
   14012c515:	mov    0x1048(%rbx),%r11
   14012c51c:	lea    0x10(%r13),%rax
   14012c520:	cmp    0x30(%rsp),%rax
   14012c525:	jae    1401333c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee12>
   14012c52b:	mov    0x1050(%rbx),%rax
   14012c532:	vzeroupper
   14012c535:	mov    0x1d0(%rsp),%rcx
   14012c53d:	mov    %r13,%rdx
   14012c540:	lea    0x10(%r13),%r13
   14012c544:	mov    %rcx,-0x10(%r13)
   14012c548:	mov    0x1c8(%rsp),%rcx
   14012c550:	mov    %rcx,0x8(%rdx)
   14012c554:	jmp    14012a70c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x615c>
   14012c559:	and    %rdx,%rcx
   14012c55c:	cmp    %r9,%rcx
   14012c55f:	je     14012fc8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6dd>
   14012c565:	movabs $0xfffd000000000000,%rax
   14012c56f:	cmp    %rax,%rcx
   14012c572:	je     140132520 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf70>
   14012c578:	movabs $0xfffc000000000000,%rax
   14012c582:	cmp    %rax,%rdx
   14012c585:	je     14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   14012c58b:	movabs $0xfff7ffffffffffff,%rax
   14012c595:	cmp    %rdx,%rax
   14012c598:	jae    14012de61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x98b1>
   14012c59e:	movabs $0xffffffff00000000,%rax
   14012c5a8:	and    %r8,%rax
   14012c5ab:	movabs $0xfffd000000000000,%r8
   14012c5b5:	cmp    %r8,%rax
   14012c5b8:	je     140132632 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe082>
   14012c5be:	movabs $0xffff000000000000,%rcx
   14012c5c8:	and    %rdx,%rcx
   14012c5cb:	cmp    %r8,%rcx
   14012c5ce:	je     14012f185 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabd5>
   14012c5d4:	movabs $0xfffd000100000000,%rdx
   14012c5de:	cmp    %rdx,%rax
   14012c5e1:	jne    140126b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259c>
   14012c5e7:	lea    0x2e0(%rsp),%rdx
   14012c5ef:	lea    0x710(%rsp),%rcx
   14012c5f7:	vzeroupper
   14012c5fa:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c5ff:	lea    0x540(%rsp),%rax
   14012c607:	lea    0x2d8(%rsp),%rdx
   14012c60f:	mov    %rax,%rcx
   14012c612:	mov    %rax,0x40(%rsp)
   14012c617:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012c61c:	mov    0x40(%rsp),%rcx
   14012c621:	lea    0x710(%rsp),%rdx
   14012c629:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012c62e:	test   %eax,%eax
   14012c630:	setg   %al
   14012c633:	jmp    140126b72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25c2>
   14012c638:	mov    0x1e0(%rsp),%r8
   14012c640:	and    %r8,%rdx
   14012c643:	cmp    %rcx,%rdx
   14012c646:	jne    140125da9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17f9>
   14012c64c:	mov    %r8,%rcx
   14012c64f:	shl    $0x10,%rax
   14012c653:	movabs $0xffffffffffff,%r8
   14012c65d:	shl    $0x10,%rcx
   14012c661:	sar    $0x10,%rax
   14012c665:	sar    $0x10,%rcx
   14012c669:	add    %rcx,%rax
   14012c66c:	movabs $0x800000000000,%rcx
   14012c676:	add    %rax,%rcx
   14012c679:	cmp    %rcx,%r8
   14012c67c:	jb     140125da9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17f9>
   14012c682:	and    %r8,%rax
   14012c685:	mov    %r12,%rcx
   14012c688:	or     %rdx,%rax
   14012c68b:	mov    %rax,0x1c8(%rsp)
   14012c693:	cmpb   $0x0,0x1520f(%rbx)
   14012c69a:	je     14012c6d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8120>
   14012c69c:	mov    0xe8(%r14),%rax
   14012c6a3:	mov    0xf0(%r14),%r8
   14012c6aa:	lea    -0x1(%r12),%rdx
   14012c6af:	sub    %r15,%rdx
   14012c6b2:	sub    %rax,%r8
   14012c6b5:	cmp    %r8,%rdx
   14012c6b8:	jae    14012c6d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8120>
   14012c6ba:	add    %rdx,%rax
   14012c6bd:	movzbl (%rax),%edi
   14012c6c0:	lea    0x1(%rdi),%edx
   14012c6c3:	mov    %dl,(%rax)
   14012c6c5:	cmp    $0x7,%dl
   14012c6c8:	jbe    14012c6d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8120>
   14012c6ca:	movb   $0xbc,-0x1(%r12)
   14012c6d0:	cmpb   $0x0,0x1040(%rbx)
   14012c6d7:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012c6dd:	movzbl (%rcx),%eax
   14012c6e0:	lea    0x2949b9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012c6e7:	lea    0x1(%rcx),%r12
   14012c6eb:	jmp    *(%rdi,%rax,8)
   14012c6ee:	mov    0x1048(%rbx),%r11
   14012c6f5:	lea    0x10(%r13),%rax
   14012c6f9:	cmp    0x30(%rsp),%rax
   14012c6fe:	jae    140133103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb53>
   14012c704:	mov    0x1050(%rbx),%rax
   14012c70b:	vzeroupper
   14012c70e:	mov    0x1d0(%rsp),%rcx
   14012c716:	mov    %r13,%rdx
   14012c719:	lea    0x10(%r13),%r13
   14012c71d:	mov    %rcx,-0x10(%r13)
   14012c721:	mov    0x1c8(%rsp),%rcx
   14012c729:	mov    %rcx,0x8(%rdx)
   14012c72d:	jmp    14012a48a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5eda>
   14012c732:	lea    0x710(%rsp),%rcx
   14012c73a:	mov    %rdi,%rdx
   14012c73d:	vzeroupper
   14012c740:	mov    $0x1,%esi
   14012c745:	call   140210640 <setun::VMValue::VMValue(long long)>
   14012c74a:	mov    0x710(%rsp),%rax
   14012c752:	mov    %rax,0x1c8(%rsp)
   14012c75a:	jmp    140125853 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a3>
   14012c75f:	mov    0x1048(%rbx),%r11
   14012c766:	lea    0x10(%r13),%rax
   14012c76a:	cmp    0x30(%rsp),%rax
   14012c76f:	jae    140134139 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb89>
   14012c775:	mov    0x1050(%rbx),%rax
   14012c77c:	vzeroupper
   14012c77f:	mov    0x1d0(%rsp),%rcx
   14012c787:	mov    %r13,%rdx
   14012c78a:	lea    0x10(%r13),%r13
   14012c78e:	mov    %rcx,-0x10(%r13)
   14012c792:	mov    0x1c8(%rsp),%rcx
   14012c79a:	mov    %rcx,0x8(%rdx)
   14012c79e:	jmp    1401298d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5326>
   14012c7a3:	mov    0x1048(%rbx),%r11
   14012c7aa:	lea    0x10(%r13),%rax
   14012c7ae:	cmp    0x30(%rsp),%rax
   14012c7b3:	jae    1401331cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec1b>
   14012c7b9:	mov    0x1050(%rbx),%rax
   14012c7c0:	vzeroupper
   14012c7c3:	mov    0x1d0(%rsp),%rcx
   14012c7cb:	mov    %r13,%rdx
   14012c7ce:	lea    0x10(%r13),%r13
   14012c7d2:	mov    %rcx,-0x10(%r13)
   14012c7d6:	mov    0x1c8(%rsp),%rcx
   14012c7de:	mov    %rcx,0x8(%rdx)
   14012c7e2:	jmp    140129800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5250>
   14012c7e7:	shr    $0x20,%rax
   14012c7eb:	cmp    $0x1,%ax
   14012c7ef:	je     14012d649 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9099>
   14012c7f5:	lea    0x300(%rsp),%rcx
   14012c7fd:	vzeroupper
   14012c800:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012c805:	test   %rax,%rax
   14012c808:	js     14012d6a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x90f2>
   14012c80e:	je     140126e58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28a8>
   14012c814:	movswq 0x40(%rsp),%rax
   14012c81a:	add    %r12,%rax
   14012c81d:	jmp    140126e63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28b3>
   14012c822:	mov    0x1048(%rbx),%r11
   14012c829:	lea    0x10(%r13),%rax
   14012c82d:	cmp    0x30(%rsp),%rax
   14012c832:	jae    1401336e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf138>
   14012c838:	mov    0x1050(%rbx),%rax
   14012c83f:	vzeroupper
   14012c842:	mov    0x1d0(%rsp),%rcx
   14012c84a:	mov    %r13,%rdx
   14012c84d:	lea    0x10(%r13),%r13
   14012c851:	mov    %rcx,-0x10(%r13)
   14012c855:	mov    0x1c8(%rsp),%rcx
   14012c85d:	mov    %rcx,0x8(%rdx)
   14012c861:	jmp    14012a8d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6329>
   14012c866:	mov    0x1048(%rbx),%r11
   14012c86d:	lea    0x10(%r13),%rax
   14012c871:	cmp    0x30(%rsp),%rax
   14012c876:	jae    140133e08 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf858>
   14012c87c:	mov    0x1050(%rbx),%rax
   14012c883:	vzeroupper
   14012c886:	mov    0x1d0(%rsp),%rcx
   14012c88e:	mov    %r13,%rdx
   14012c891:	lea    0x10(%r13),%r13
   14012c895:	mov    %rcx,-0x10(%r13)
   14012c899:	mov    0x1c8(%rsp),%rcx
   14012c8a1:	mov    %rcx,0x8(%rdx)
   14012c8a5:	jmp    140127923 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3373>
   14012c8aa:	mov    0x1048(%rbx),%r11
   14012c8b1:	lea    0x10(%r13),%rax
   14012c8b5:	cmp    0x30(%rsp),%rax
   14012c8ba:	jae    140132fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9f5>
   14012c8c0:	mov    0x1050(%rbx),%rax
   14012c8c7:	vzeroupper
   14012c8ca:	mov    0x1d0(%rsp),%rcx
   14012c8d2:	mov    %r13,%rdx
   14012c8d5:	lea    0x10(%r13),%r13
   14012c8d9:	mov    %rcx,-0x10(%r13)
   14012c8dd:	mov    0x1c8(%rsp),%rcx
   14012c8e5:	mov    %rcx,0x8(%rdx)
   14012c8e9:	jmp    140129eb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5900>
   14012c8ee:	mov    0x1048(%rbx),%r11
   14012c8f5:	lea    0x10(%r13),%rax
   14012c8f9:	cmp    0x30(%rsp),%rax
   14012c8fe:	jae    140133cd7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf727>
   14012c904:	mov    0x1050(%rbx),%rax
   14012c90b:	vzeroupper
   14012c90e:	mov    0x1d0(%rsp),%rcx
   14012c916:	mov    %r13,%rdx
   14012c919:	lea    0x10(%r13),%r13
   14012c91d:	mov    %rcx,-0x10(%r13)
   14012c921:	mov    0x1c8(%rsp),%rcx
   14012c929:	mov    %rcx,0x8(%rdx)
   14012c92d:	jmp    14012817f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bcf>
   14012c932:	mov    0x1048(%rbx),%r11
   14012c939:	lea    0x10(%r13),%rax
   14012c93d:	cmp    0x30(%rsp),%rax
   14012c942:	jae    14013389a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2ea>
   14012c948:	mov    0x1050(%rbx),%rax
   14012c94f:	vzeroupper
   14012c952:	mov    0x1d0(%rsp),%rcx
   14012c95a:	mov    %r13,%rdx
   14012c95d:	lea    0x10(%r13),%r13
   14012c961:	mov    %rcx,-0x10(%r13)
   14012c965:	mov    0x1c8(%rsp),%rcx
   14012c96d:	mov    %rcx,0x8(%rdx)
   14012c971:	jmp    14012a560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fb0>
   14012c976:	mov    0x1048(%rbx),%r11
   14012c97d:	lea    0x10(%r13),%rax
   14012c981:	cmp    0x30(%rsp),%rax
   14012c986:	jae    14013401d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa6d>
   14012c98c:	mov    0x1050(%rbx),%rax
   14012c993:	vzeroupper
   14012c996:	mov    0x1d0(%rsp),%rcx
   14012c99e:	mov    %r13,%rdx
   14012c9a1:	lea    0x10(%r13),%r13
   14012c9a5:	mov    %rcx,-0x10(%r13)
   14012c9a9:	mov    0x1c8(%rsp),%rcx
   14012c9b1:	mov    %rcx,0x8(%rdx)
   14012c9b5:	jmp    1401279f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3449>
   14012c9ba:	mov    0x1048(%rbx),%r11
   14012c9c1:	lea    0x10(%r13),%rax
   14012c9c5:	cmp    0x30(%rsp),%rax
   14012c9ca:	jae    140133f81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9d1>
   14012c9d0:	mov    0x1050(%rbx),%rax
   14012c9d7:	vzeroupper
   14012c9da:	mov    0x1d0(%rsp),%rcx
   14012c9e2:	mov    %r13,%rdx
   14012c9e5:	lea    0x10(%r13),%r13
   14012c9e9:	mov    %rcx,-0x10(%r13)
   14012c9ed:	mov    0x1c8(%rsp),%rcx
   14012c9f5:	mov    %rcx,0x8(%rdx)
   14012c9f9:	jmp    140129b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55a8>
   14012c9fe:	mov    0x1048(%rbx),%r11
   14012ca05:	lea    0x10(%r13),%rax
   14012ca09:	cmp    0x30(%rsp),%rax
   14012ca0e:	jae    1401340b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb09>
   14012ca14:	mov    0x1050(%rbx),%rax
   14012ca1b:	vzeroupper
   14012ca1e:	mov    0x1d0(%rsp),%rcx
   14012ca26:	mov    %r13,%rdx
   14012ca29:	lea    0x10(%r13),%r13
   14012ca2d:	mov    %rcx,-0x10(%r13)
   14012ca31:	mov    0x1c8(%rsp),%rcx
   14012ca39:	mov    %rcx,0x8(%rdx)
   14012ca3d:	jmp    14012aa17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6467>
   14012ca42:	mov    0x1048(%rbx),%r11
   14012ca49:	lea    0x10(%r13),%rax
   14012ca4d:	cmp    0x30(%rsp),%rax
   14012ca52:	jae    140133ff1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa41>
   14012ca58:	mov    0x1050(%rbx),%rax
   14012ca5f:	vzeroupper
   14012ca62:	mov    0x1d0(%rsp),%rcx
   14012ca6a:	mov    %r13,%rdx
   14012ca6d:	lea    0x10(%r13),%r13
   14012ca71:	mov    %rcx,-0x10(%r13)
   14012ca75:	mov    0x1c8(%rsp),%rcx
   14012ca7d:	mov    %rcx,0x8(%rdx)
   14012ca81:	jmp    14012a05c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aac>
   14012ca86:	mov    0x1048(%rbx),%r11
   14012ca8d:	lea    0x10(%r13),%rax
   14012ca91:	cmp    0x30(%rsp),%rax
   14012ca96:	jae    140134061 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfab1>
   14012ca9c:	mov    0x1050(%rbx),%rax
   14012caa3:	vzeroupper
   14012caa6:	mov    0x1d0(%rsp),%rcx
   14012caae:	mov    %r13,%rdx
   14012cab1:	lea    0x10(%r13),%r13
   14012cab5:	mov    %rcx,-0x10(%r13)
   14012cab9:	mov    0x1c8(%rsp),%rcx
   14012cac1:	mov    %rcx,0x8(%rdx)
   14012cac5:	jmp    14012a636 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6086>
   14012caca:	mov    0x1048(%rbx),%r11
   14012cad1:	lea    0x10(%r13),%rax
   14012cad5:	cmp    0x30(%rsp),%rax
   14012cada:	jae    140133f05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf955>
   14012cae0:	mov    0x1050(%rbx),%rax
   14012cae7:	vzeroupper
   14012caea:	mov    0x1d0(%rsp),%rcx
   14012caf2:	mov    %r13,%rdx
   14012caf5:	lea    0x10(%r13),%r13
   14012caf9:	mov    %rcx,-0x10(%r13)
   14012cafd:	mov    0x1c8(%rsp),%rcx
   14012cb05:	mov    %rcx,0x8(%rdx)
   14012cb09:	jmp    1401299ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53fc>
   14012cb0e:	mov    0x1048(%rbx),%r11
   14012cb15:	lea    0x10(%r13),%rax
   14012cb19:	cmp    0x30(%rsp),%rax
   14012cb1e:	jae    140133e34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf884>
   14012cb24:	mov    0x1050(%rbx),%rax
   14012cb2b:	mov    0x1d0(%rsp),%rcx
   14012cb33:	mov    %r13,%rdx
   14012cb36:	lea    0x10(%r13),%r13
   14012cb3a:	mov    %rcx,-0x10(%r13)
   14012cb3e:	mov    0x1c8(%rsp),%rcx
   14012cb46:	mov    %rcx,0x8(%rdx)
   14012cb4a:	jmp    14012a944 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6394>
   14012cb4f:	mov    0x1048(%rbx),%r11
   14012cb56:	lea    0x10(%r13),%rax
   14012cb5a:	cmp    0x30(%rsp),%rax
   14012cb5f:	jae    140133fad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9fd>
   14012cb65:	mov    0x1050(%rbx),%rax
   14012cb6c:	vzeroupper
   14012cb6f:	mov    0x1d0(%rsp),%rcx
   14012cb77:	mov    %r13,%rdx
   14012cb7a:	lea    0x10(%r13),%r13
   14012cb7e:	mov    %rcx,-0x10(%r13)
   14012cb82:	mov    0x1c8(%rsp),%rcx
   14012cb8a:	mov    %rcx,0x8(%rdx)
   14012cb8e:	jmp    140129f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59d6>
   14012cb93:	mov    0x1048(%rbx),%r11
   14012cb9a:	lea    0x10(%r13),%rax
   14012cb9e:	cmp    0x30(%rsp),%rax
   14012cba3:	jae    1401340e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb35>
   14012cba9:	mov    0x1050(%rbx),%rax
   14012cbb0:	vzeroupper
   14012cbb3:	mov    0x1d0(%rsp),%rcx
   14012cbbb:	mov    %r13,%rdx
   14012cbbe:	lea    0x10(%r13),%r13
   14012cbc2:	mov    %rcx,-0x10(%r13)
   14012cbc6:	mov    0x1c8(%rsp),%rcx
   14012cbce:	mov    %rcx,0x8(%rdx)
   14012cbd2:	jmp    14012aaed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x653d>
   14012cbd7:	mov    0x1048(%rbx),%r11
   14012cbde:	lea    0x10(%r13),%rax
   14012cbe2:	cmp    0x30(%rsp),%rax
   14012cbe7:	jae    140134191 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbe1>
   14012cbed:	mov    0x1050(%rbx),%rax
   14012cbf4:	vzeroupper
   14012cbf7:	mov    0x1d0(%rsp),%rcx
   14012cbff:	mov    %r13,%rdx
   14012cc02:	lea    0x10(%r13),%r13
   14012cc06:	mov    %rcx,-0x10(%r13)
   14012cc0a:	mov    0x1c8(%rsp),%rcx
   14012cc12:	mov    %rcx,0x8(%rdx)
   14012cc16:	jmp    140129d04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5754>
   14012cc1b:	mov    0x1048(%rbx),%r11
   14012cc22:	lea    0x10(%r13),%rax
   14012cc26:	cmp    0x30(%rsp),%rax
   14012cc2b:	jae    14013408d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfadd>
   14012cc31:	mov    0x1050(%rbx),%rax
   14012cc38:	vzeroupper
   14012cc3b:	mov    0x1d0(%rsp),%rcx
   14012cc43:	mov    %r13,%rdx
   14012cc46:	lea    0x10(%r13),%r13
   14012cc4a:	mov    %rcx,-0x10(%r13)
   14012cc4e:	mov    0x1c8(%rsp),%rcx
   14012cc56:	mov    %rcx,0x8(%rdx)
   14012cc5a:	jmp    14012a132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b82>
   14012cc5f:	mov    0x1048(%rbx),%r11
   14012cc66:	lea    0x10(%r13),%rax
   14012cc6a:	cmp    0x30(%rsp),%rax
   14012cc6f:	jae    140134165 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbb5>
   14012cc75:	mov    0x1050(%rbx),%rax
   14012cc7c:	vzeroupper
   14012cc7f:	mov    0x1d0(%rsp),%rcx
   14012cc87:	mov    %r13,%rdx
   14012cc8a:	lea    0x10(%r13),%r13
   14012cc8e:	mov    %rcx,-0x10(%r13)
   14012cc92:	mov    0x1c8(%rsp),%rcx
   14012cc9a:	mov    %rcx,0x8(%rdx)
   14012cc9e:	jmp    140129a82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54d2>
   14012cca3:	mov    0x1048(%rbx),%r11
   14012ccaa:	lea    0x10(%r13),%rax
   14012ccae:	cmp    0x30(%rsp),%rax
   14012ccb3:	jae    1401341bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc0d>
   14012ccb9:	mov    0x1050(%rbx),%rax
   14012ccc0:	vzeroupper
   14012ccc3:	mov    0x1d0(%rsp),%rcx
   14012cccb:	mov    %r13,%rdx
   14012ccce:	lea    0x10(%r13),%r13
   14012ccd2:	mov    %rcx,-0x10(%r13)
   14012ccd6:	mov    0x1c8(%rsp),%rcx
   14012ccde:	mov    %rcx,0x8(%rdx)
   14012cce2:	jmp    140129c2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x567e>
   14012cce7:	mov    0x1048(%rbx),%r11
   14012ccee:	lea    0x10(%r13),%rax
   14012ccf2:	cmp    0x30(%rsp),%rax
   14012ccf7:	jae    1401331f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec47>
   14012ccfd:	mov    0x1050(%rbx),%rax
   14012cd04:	vzeroupper
   14012cd07:	mov    0x1d0(%rsp),%rcx
   14012cd0f:	mov    %r13,%rdx
   14012cd12:	lea    0x10(%r13),%r13
   14012cd16:	mov    %rcx,-0x10(%r13)
   14012cd1a:	mov    0x1c8(%rsp),%rcx
   14012cd22:	mov    %rcx,0x8(%rdx)
   14012cd26:	jmp    140129dda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x582a>
   14012cd2b:	xor    %esi,%esi
   14012cd2d:	shr    $0x20,%rax
   14012cd31:	cmp    $0x3,%ax
   14012cd35:	je     14012f7cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb21f>
   14012cd3b:	test   %ax,%ax
   14012cd3e:	jne    14012e5b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa002>
   14012cd44:	lea    0x540(%rsp),%rcx
   14012cd4c:	lea    0x308(%rsp),%rdx
   14012cd54:	vzeroupper
   14012cd57:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012cd5c:	lea    0x310(%rsp),%rcx
   14012cd64:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012cd69:	mov    %rax,%rdi
   14012cd6c:	test   %rax,%rax
   14012cd6f:	js     140131e66 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8b6>
   14012cd75:	cmp    0x548(%rsp),%rdi
   14012cd7d:	jae    140131e74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8c4>
   14012cd83:	test   %sil,%sil
   14012cd86:	je     1401348d7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10327>
   14012cd8c:	cmp    $0x1,%sil
   14012cd90:	je     1401363e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e35>
   14012cd96:	lea    0x8(%r13),%rax
   14012cd9a:	cmp    0x30(%rsp),%rax
   14012cd9f:	jae    140137b4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1359e>
   14012cda5:	mov    0x1d0(%rsp),%rdx
   14012cdad:	mov    %r13,%rax
   14012cdb0:	lea    0x710(%rsp),%r10
   14012cdb8:	lea    0x720(%rsp),%rsi
   14012cdc0:	mov    %r10,%rcx
   14012cdc3:	mov    %r10,0x40(%rsp)
   14012cdc8:	lea    0x8(%r13),%r13
   14012cdcc:	mov    %rdx,(%rax)
   14012cdcf:	mov    0x1c8(%rsp),%rax
   14012cdd7:	mov    $0x1,%edx
   14012cddc:	mov    %rax,0x1d0(%rsp)
   14012cde4:	mov    0x540(%rsp),%rax
   14012cdec:	movsbl (%rax,%rdi,1),%r8d
   14012cdf1:	mov    %rsi,0x710(%rsp)
   14012cdf9:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012cdfe:	mov    0x40(%rsp),%rdx
   14012ce03:	lea    0x520(%rsp),%rcx
   14012ce0b:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012ce10:	mov    0x520(%rsp),%rax
   14012ce18:	mov    0x710(%rsp),%rcx
   14012ce20:	mov    %rax,0x1c8(%rsp)
   14012ce28:	cmp    %rsi,%rcx
   14012ce2b:	je     14012ce3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x888e>
   14012ce2d:	mov    0x720(%rsp),%rax
   14012ce35:	lea    0x1(%rax),%rdx
   14012ce39:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012ce3e:	mov    $0x2,%esi
   14012ce43:	mov    0x540(%rsp),%rcx
   14012ce4b:	lea    0x550(%rsp),%rax
   14012ce53:	cmp    %rax,%rcx
   14012ce56:	je     14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   14012ce5c:	mov    0x550(%rsp),%rax
   14012ce64:	lea    0x1(%rax),%rdx
   14012ce68:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012ce6d:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   14012ce72:	mov    %rdx,%rax
   14012ce75:	shr    $0x20,%rax
   14012ce79:	cmp    $0x5,%ax
   14012ce7d:	jne    14012cec7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8917>
   14012ce7f:	mov    0x3c0(%rsp),%rcx
   14012ce87:	movabs $0xffff000000000000,%rax
   14012ce91:	movabs $0xfff8000000000000,%r8
   14012ce9b:	and    %rcx,%rax
   14012ce9e:	cmp    %r8,%rax
   14012cea1:	je     140129560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fb0>
   14012cea7:	movabs $0xffffffff00000000,%rax
   14012ceb1:	and    %rax,%rcx
   14012ceb4:	movabs $0xfffd000500000000,%rax
   14012cebe:	cmp    %rax,%rcx
   14012cec1:	je     140129560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fb0>
   14012cec7:	mov    0x3c0(%rsp),%rax
   14012cecf:	movabs $0xfff7ffffffffffff,%rcx
   14012ced9:	cmp    %rax,%rcx
   14012cedc:	jae    14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   14012cee2:	movabs $0xfffc000000000000,%rcx
   14012ceec:	cmp    %rcx,%rax
   14012ceef:	je     14012dee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9938>
   14012cef5:	movabs $0xffffffff00000000,%rcx
   14012ceff:	movabs $0xfffd000000000000,%r8
   14012cf09:	and    %rdx,%rcx
   14012cf0c:	cmp    %r8,%rcx
   14012cf0f:	je     140131c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6cb>
   14012cf15:	movabs $0xffff000000000000,%rdx
   14012cf1f:	and    %rax,%rdx
   14012cf22:	cmp    %r8,%rdx
   14012cf25:	je     140132f13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe963>
   14012cf2b:	movabs $0xfffd000100000000,%rax
   14012cf35:	cmp    %rax,%rcx
   14012cf38:	jne    140129560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fb0>
   14012cf3e:	lea    0x710(%rsp),%r8
   14012cf46:	lea    0x3c0(%rsp),%rdx
   14012cf4e:	mov    %r8,0x60(%rsp)
   14012cf53:	mov    %r8,%rcx
   14012cf56:	vzeroupper
   14012cf59:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012cf5e:	lea    0x540(%rsp),%rax
   14012cf66:	lea    0x3b8(%rsp),%rdx
   14012cf6e:	mov    %rax,%rcx
   14012cf71:	mov    %rax,0x40(%rsp)
   14012cf76:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012cf7b:	mov    0x60(%rsp),%rdx
   14012cf80:	mov    0x40(%rsp),%rcx
   14012cf85:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012cf8a:	test   %eax,%eax
   14012cf8c:	setg   %al
   14012cf8f:	jmp    14012958a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fda>
   14012cf94:	mov    %rdx,%rax
   14012cf97:	shr    $0x20,%rax
   14012cf9b:	cmp    $0x5,%ax
   14012cf9f:	jne    14012cfe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8a39>
   14012cfa1:	mov    0x3b0(%rsp),%rcx
   14012cfa9:	movabs $0xffff000000000000,%rax
   14012cfb3:	movabs $0xfff8000000000000,%r9
   14012cfbd:	and    %rcx,%rax
   14012cfc0:	cmp    %r9,%rax
   14012cfc3:	je     1401293fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e4a>
   14012cfc9:	movabs $0xffffffff00000000,%rax
   14012cfd3:	and    %rax,%rcx
   14012cfd6:	movabs $0xfffd000500000000,%rax
   14012cfe0:	cmp    %rax,%rcx
   14012cfe3:	je     1401293fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e4a>
   14012cfe9:	mov    0x3b0(%rsp),%rax
   14012cff1:	movabs $0xfff7ffffffffffff,%rcx
   14012cffb:	cmp    %rax,%rcx
   14012cffe:	jae    14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   14012d004:	movabs $0xfffc000000000000,%rcx
   14012d00e:	cmp    %rcx,%rax
   14012d011:	je     14012de1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x986f>
   14012d017:	movabs $0xffffffff00000000,%rcx
   14012d021:	movabs $0xfffd000000000000,%r9
   14012d02b:	and    %rdx,%rcx
   14012d02e:	cmp    %r9,%rcx
   14012d031:	je     1401326f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe140>
   14012d037:	movabs $0xffff000000000000,%rdx
   14012d041:	and    %rax,%rdx
   14012d044:	cmp    %r9,%rdx
   14012d047:	je     140132e3d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe88d>
   14012d04d:	movabs $0xfffd000100000000,%rax
   14012d057:	cmp    %rax,%rcx
   14012d05a:	jne    1401293fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e4a>
   14012d060:	lea    0x710(%rsp),%r8
   14012d068:	lea    0x3b0(%rsp),%rdx
   14012d070:	mov    %r8,0x60(%rsp)
   14012d075:	mov    %r8,%rcx
   14012d078:	vzeroupper
   14012d07b:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d080:	lea    0x540(%rsp),%rax
   14012d088:	lea    0x3a8(%rsp),%rdx
   14012d090:	mov    %rax,%rcx
   14012d093:	mov    %rax,0x40(%rsp)
   14012d098:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d09d:	mov    0x60(%rsp),%rdx
   14012d0a2:	mov    0x40(%rsp),%rcx
   14012d0a7:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d0ac:	test   %eax,%eax
   14012d0ae:	sete   %r8b
   14012d0b2:	jmp    140129425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e75>
   14012d0b7:	mov    %rdx,%rax
   14012d0ba:	shr    $0x20,%rax
   14012d0be:	cmp    $0x5,%ax
   14012d0c2:	jne    14012d10c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8b5c>
   14012d0c4:	mov    0x3d0(%rsp),%rcx
   14012d0cc:	movabs $0xffff000000000000,%rax
   14012d0d6:	movabs $0xfff8000000000000,%r8
   14012d0e0:	and    %rcx,%rax
   14012d0e3:	cmp    %r8,%rax
   14012d0e6:	je     1401296c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5114>
   14012d0ec:	movabs $0xffffffff00000000,%rax
   14012d0f6:	and    %rax,%rcx
   14012d0f9:	movabs $0xfffd000500000000,%rax
   14012d103:	cmp    %rax,%rcx
   14012d106:	je     1401296c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5114>
   14012d10c:	mov    0x3d0(%rsp),%rax
   14012d114:	movabs $0xfff7ffffffffffff,%rcx
   14012d11e:	cmp    %rax,%rcx
   14012d121:	jae    14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   14012d127:	movabs $0xfffc000000000000,%rcx
   14012d131:	cmp    %rcx,%rax
   14012d134:	je     14012df15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9965>
   14012d13a:	movabs $0xffffffff00000000,%rcx
   14012d144:	movabs $0xfffd000000000000,%r8
   14012d14e:	and    %rdx,%rcx
   14012d151:	cmp    %r8,%rcx
   14012d154:	je     140132127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb77>
   14012d15a:	movabs $0xffff000000000000,%rdx
   14012d164:	and    %rax,%rdx
   14012d167:	cmp    %r8,%rdx
   14012d16a:	je     140132da1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7f1>
   14012d170:	movabs $0xfffd000100000000,%rax
   14012d17a:	cmp    %rax,%rcx
   14012d17d:	jne    1401296c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5114>
   14012d183:	lea    0x710(%rsp),%r8
   14012d18b:	lea    0x3d0(%rsp),%rdx
   14012d193:	mov    %r8,0x60(%rsp)
   14012d198:	mov    %r8,%rcx
   14012d19b:	vzeroupper
   14012d19e:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d1a3:	lea    0x540(%rsp),%rax
   14012d1ab:	lea    0x3c8(%rsp),%rdx
   14012d1b3:	mov    %rax,%rcx
   14012d1b6:	mov    %rax,0x40(%rsp)
   14012d1bb:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d1c0:	mov    0x60(%rsp),%rdx
   14012d1c5:	mov    0x40(%rsp),%rcx
   14012d1ca:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d1cf:	not    %eax
   14012d1d1:	shr    $0x1f,%eax
   14012d1d4:	jmp    1401296ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x513e>
   14012d1d9:	mov    %rdx,%rax
   14012d1dc:	shr    $0x20,%rax
   14012d1e0:	cmp    $0x5,%ax
   14012d1e4:	jne    14012d22e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8c7e>
   14012d1e6:	mov    0x3a0(%rsp),%rcx
   14012d1ee:	movabs $0xffff000000000000,%rax
   14012d1f8:	movabs $0xfff8000000000000,%r8
   14012d202:	and    %rcx,%rax
   14012d205:	cmp    %r8,%rax
   14012d208:	je     140129296 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ce6>
   14012d20e:	movabs $0xffffffff00000000,%rax
   14012d218:	and    %rax,%rcx
   14012d21b:	movabs $0xfffd000500000000,%rax
   14012d225:	cmp    %rax,%rcx
   14012d228:	je     140129296 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ce6>
   14012d22e:	mov    0x3a0(%rsp),%rax
   14012d236:	movabs $0xfff7ffffffffffff,%rcx
   14012d240:	cmp    %rax,%rcx
   14012d243:	jae    14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   14012d249:	movabs $0xfffc000000000000,%rcx
   14012d253:	cmp    %rcx,%rax
   14012d256:	je     14012df42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9992>
   14012d25c:	movabs $0xffffffff00000000,%rcx
   14012d266:	movabs $0xfffd000000000000,%r8
   14012d270:	and    %rdx,%rcx
   14012d273:	cmp    %r8,%rcx
   14012d276:	je     140131bb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd607>
   14012d27c:	movabs $0xffff000000000000,%rdx
   14012d286:	and    %rax,%rdx
   14012d289:	cmp    %r8,%rdx
   14012d28c:	je     140132cb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe700>
   14012d292:	movabs $0xfffd000100000000,%rax
   14012d29c:	cmp    %rax,%rcx
   14012d29f:	jne    140129296 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ce6>
   14012d2a5:	lea    0x710(%rsp),%r8
   14012d2ad:	lea    0x3a0(%rsp),%rdx
   14012d2b5:	mov    %r8,0x60(%rsp)
   14012d2ba:	mov    %r8,%rcx
   14012d2bd:	vzeroupper
   14012d2c0:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d2c5:	lea    0x540(%rsp),%rax
   14012d2cd:	lea    0x398(%rsp),%rdx
   14012d2d5:	mov    %rax,%rcx
   14012d2d8:	mov    %rax,0x40(%rsp)
   14012d2dd:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d2e2:	mov    0x60(%rsp),%rdx
   14012d2e7:	mov    0x40(%rsp),%rcx
   14012d2ec:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d2f1:	test   %eax,%eax
   14012d2f3:	setle  %al
   14012d2f6:	jmp    1401292c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d10>
   14012d2fb:	mov    %rdx,%rax
   14012d2fe:	shr    $0x20,%rax
   14012d302:	cmp    $0x5,%ax
   14012d306:	jne    14012d350 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8da0>
   14012d308:	mov    0x390(%rsp),%rcx
   14012d310:	movabs $0xffff000000000000,%rax
   14012d31a:	movabs $0xfff8000000000000,%r8
   14012d324:	and    %rcx,%rax
   14012d327:	cmp    %r8,%rax
   14012d32a:	je     140129132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b82>
   14012d330:	movabs $0xffffffff00000000,%rax
   14012d33a:	and    %rax,%rcx
   14012d33d:	movabs $0xfffd000500000000,%rax
   14012d347:	cmp    %rax,%rcx
   14012d34a:	je     140129132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b82>
   14012d350:	mov    0x390(%rsp),%rax
   14012d358:	movabs $0xfff7ffffffffffff,%rcx
   14012d362:	cmp    %rax,%rcx
   14012d365:	jae    14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   14012d36b:	movabs $0xfffc000000000000,%rcx
   14012d375:	cmp    %rcx,%rax
   14012d378:	je     14012ddc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9815>
   14012d37e:	movabs $0xffffffff00000000,%rcx
   14012d388:	movabs $0xfffd000000000000,%r8
   14012d392:	and    %rdx,%rcx
   14012d395:	cmp    %r8,%rcx
   14012d398:	je     140131d3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd78f>
   14012d39e:	movabs $0xffff000000000000,%rdx
   14012d3a8:	and    %rax,%rdx
   14012d3ab:	cmp    %r8,%rdx
   14012d3ae:	je     140132f46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe996>
   14012d3b4:	movabs $0xfffd000100000000,%rax
   14012d3be:	cmp    %rax,%rcx
   14012d3c1:	jne    140129132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b82>
   14012d3c7:	lea    0x710(%rsp),%r8
   14012d3cf:	lea    0x390(%rsp),%rdx
   14012d3d7:	mov    %r8,0x60(%rsp)
   14012d3dc:	mov    %r8,%rcx
   14012d3df:	vzeroupper
   14012d3e2:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d3e7:	lea    0x540(%rsp),%rax
   14012d3ef:	lea    0x388(%rsp),%rdx
   14012d3f7:	mov    %rax,%rcx
   14012d3fa:	mov    %rax,0x40(%rsp)
   14012d3ff:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d404:	mov    0x60(%rsp),%rdx
   14012d409:	mov    0x40(%rsp),%rcx
   14012d40e:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d413:	shr    $0x1f,%eax
   14012d416:	jmp    14012915c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bac>
   14012d41b:	movzwl %ax,%edi
   14012d41e:	mov    %edi,0x60(%rsp)
   14012d422:	jmp    140126ec1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2911>
   14012d427:	mov    %rdx,%rax
   14012d42a:	shr    $0x20,%rax
   14012d42e:	cmp    $0x2,%ax
   14012d432:	je     1401310e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcb30>
   14012d438:	mov    0x1c8(%rsp),%rax
   14012d440:	xor    %esi,%esi
   14012d442:	mov    %rax,0x3f0(%rsp)
   14012d44a:	movabs $0xffffffff00000000,%rax
   14012d454:	movabs $0xfffd000200000000,%rcx
   14012d45e:	and    %rdx,%rax
   14012d461:	cmp    %rcx,%rax
   14012d464:	jne    140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   14012d46a:	mov    %r9,0x40(%rsp)
   14012d46f:	lea    0x3e8(%rsp),%rcx
   14012d477:	mov    %rdx,0x3e8(%rsp)
   14012d47f:	vzeroupper
   14012d482:	call   14021c730 <setun::VMValue::payload() const>
   14012d487:	mov    0x48(%rax),%rdi
   14012d48b:	test   %rdi,%rdi
   14012d48e:	je     140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   14012d494:	mov    0x38(%rdi),%rdx
   14012d498:	mov    0x40(%rsp),%r9
   14012d49d:	test   %rdx,%rdx
   14012d4a0:	je     1401337e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf238>
   14012d4a6:	mov    (%r9),%eax
   14012d4a9:	cmp    %eax,(%rdx)
   14012d4ab:	jne    1401337e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf238>
   14012d4b1:	test   %eax,%eax
   14012d4b3:	je     1401337e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf238>
   14012d4b9:	mov    0x48(%rdi),%rdx
   14012d4bd:	mov    0x50(%rdi),%rax
   14012d4c1:	movzwl 0x4(%r9),%ecx
   14012d4c6:	sub    %rdx,%rax
   14012d4c9:	sar    $0x3,%rax
   14012d4cd:	cmp    %rax,%rcx
   14012d4d0:	jae    1401337e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf238>
   14012d4d6:	mov    0x3f0(%rsp),%rax
   14012d4de:	mov    %rax,(%rdx,%rcx,8)
   14012d4e2:	cmpb   $0x0,0x1040(%rbx)
   14012d4e9:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012d4ef:	mov    %r12,%rax
   14012d4f2:	lea    0x293ba7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d4f9:	lea    0x1(%r12),%r12
   14012d4fe:	movzbl (%rax),%eax
   14012d501:	jmp    *(%rdi,%rax,8)
   14012d504:	shr    $0x20,%rdx
   14012d508:	cmp    $0x3,%dx
   14012d50c:	je     140130279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcc9>
   14012d512:	test   %dx,%dx
   14012d515:	jne    14012e622 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa072>
   14012d51b:	lea    0x540(%rsp),%rcx
   14012d523:	lea    0x330(%rsp),%rdx
   14012d52b:	vzeroupper
   14012d52e:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012d533:	lea    0x338(%rsp),%rcx
   14012d53b:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012d540:	mov    %rax,%rdi
   14012d543:	test   %rax,%rax
   14012d546:	js     140131def <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd83f>
   14012d54c:	cmp    0x548(%rsp),%rdi
   14012d554:	jae    140131dfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd84d>
   14012d55a:	test   %sil,%sil
   14012d55d:	je     140135ac2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11512>
   14012d563:	cmp    $0x1,%sil
   14012d567:	je     14013807a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13aca>
   14012d56d:	lea    0x8(%r13),%rax
   14012d571:	cmp    0x30(%rsp),%rax
   14012d576:	jae    140137870 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132c0>
   14012d57c:	mov    0x1d0(%rsp),%rdx
   14012d584:	mov    %r13,%rax
   14012d587:	lea    0x710(%rsp),%r10
   14012d58f:	lea    0x720(%rsp),%rsi
   14012d597:	mov    %r10,%rcx
   14012d59a:	mov    %r10,0x40(%rsp)
   14012d59f:	lea    0x8(%r13),%r13
   14012d5a3:	mov    %rdx,(%rax)
   14012d5a6:	mov    0x1c8(%rsp),%rax
   14012d5ae:	mov    $0x1,%edx
   14012d5b3:	mov    %rax,0x1d0(%rsp)
   14012d5bb:	mov    0x540(%rsp),%rax
   14012d5c3:	movsbl (%rax,%rdi,1),%r8d
   14012d5c8:	mov    %rsi,0x710(%rsp)
   14012d5d0:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14012d5d5:	mov    0x40(%rsp),%rdx
   14012d5da:	lea    0x520(%rsp),%rcx
   14012d5e2:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14012d5e7:	mov    0x520(%rsp),%rax
   14012d5ef:	mov    0x710(%rsp),%rcx
   14012d5f7:	mov    %rax,0x1c8(%rsp)
   14012d5ff:	cmp    %rsi,%rcx
   14012d602:	je     14012d615 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9065>
   14012d604:	mov    0x720(%rsp),%rax
   14012d60c:	lea    0x1(%rax),%rdx
   14012d610:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012d615:	mov    $0x2,%esi
   14012d61a:	mov    0x540(%rsp),%rcx
   14012d622:	lea    0x550(%rsp),%rax
   14012d62a:	cmp    %rax,%rcx
   14012d62d:	je     140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   14012d633:	mov    0x550(%rsp),%rax
   14012d63b:	lea    0x1(%rax),%rdx
   14012d63f:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012d644:	jmp    140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   14012d649:	lea    0x540(%rsp),%rax
   14012d651:	vpxor  %xmm0,%xmm0,%xmm0
   14012d655:	movq   $0x0,0x720(%rsp)
   14012d661:	lea    0x300(%rsp),%rdx
   14012d669:	mov    %rax,0x80(%rsp)
   14012d671:	mov    %rax,%rcx
   14012d674:	vmovdqa %xmm0,0x710(%rsp)
   14012d67d:	vzeroupper
   14012d680:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d685:	mov    0x80(%rsp),%rcx
   14012d68d:	lea    0x710(%rsp),%rdx
   14012d695:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d69a:	test   %eax,%eax
   14012d69c:	jns    14012c80e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x825e>
   14012d6a2:	movswq %di,%rax
   14012d6a6:	lea    -0x4(%r12,%rax,1),%rax
   14012d6ab:	jmp    140126e63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x28b3>
   14012d6b0:	lea    0x280(%rsp),%rdx
   14012d6b8:	lea    0x710(%rsp),%rcx
   14012d6c0:	vzeroupper
   14012d6c3:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d6c8:	lea    0x540(%rsp),%rax
   14012d6d0:	lea    0x278(%rsp),%rdx
   14012d6d8:	mov    %rax,%rcx
   14012d6db:	mov    %rax,0x40(%rsp)
   14012d6e0:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d6e5:	mov    0x40(%rsp),%rcx
   14012d6ea:	lea    0x710(%rsp),%rdx
   14012d6f2:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d6f7:	test   %eax,%eax
   14012d6f9:	jle    14013242b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde7b>
   14012d6ff:	mov    0x280(%rsp),%rax
   14012d707:	mov    %rax,0x1c8(%rsp)
   14012d70f:	jmp    140126469 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1eb9>
   14012d714:	lea    0x290(%rsp),%rdx
   14012d71c:	lea    0x710(%rsp),%rcx
   14012d724:	vzeroupper
   14012d727:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d72c:	lea    0x540(%rsp),%rax
   14012d734:	lea    0x288(%rsp),%rdx
   14012d73c:	mov    %rax,%rcx
   14012d73f:	mov    %rax,0x40(%rsp)
   14012d744:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012d749:	mov    0x40(%rsp),%rcx
   14012d74e:	lea    0x710(%rsp),%rdx
   14012d756:	call   140010f10 <setun::tafpu_cmp(setun::TafpuNum const&, setun::TafpuNum const&)>
   14012d75b:	test   %eax,%eax
   14012d75d:	js     1401327aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1fa>
   14012d763:	mov    0x288(%rsp),%rax
   14012d76b:	mov    %rax,0x1c8(%rsp)
   14012d773:	jmp    140126589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fd9>
   14012d778:	mov    %r9,0x40(%rsp)
   14012d77d:	lea    0x1c8(%rsp),%rcx
   14012d785:	vzeroupper
   14012d788:	call   14021c730 <setun::VMValue::payload() const>
   14012d78d:	mov    0x40(%rsp),%r9
   14012d792:	mov    0x48(%rax),%rax
   14012d796:	test   %rax,%rax
   14012d799:	je     140129768 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51b8>
   14012d79f:	mov    0x38(%rax),%rcx
   14012d7a3:	test   %rcx,%rcx
   14012d7a6:	je     140129768 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51b8>
   14012d7ac:	mov    (%r9),%edx
   14012d7af:	cmp    %edx,(%rcx)
   14012d7b1:	jne    140129768 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51b8>
   14012d7b7:	test   %edx,%edx
   14012d7b9:	je     140129768 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51b8>
   14012d7bf:	movzwl 0x4(%r9),%edx
   14012d7c4:	mov    0x48(%rax),%rax
   14012d7c8:	mov    (%rax,%rdx,8),%rax
   14012d7cc:	mov    %rax,0x1c8(%rsp)
   14012d7d4:	cmpb   $0x0,0x1040(%rbx)
   14012d7db:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012d7e1:	movzbl 0x2(%rdi),%eax
   14012d7e5:	lea    0x3(%rdi),%r12
   14012d7e9:	lea    0x2938b0(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d7f0:	jmp    *(%rdi,%rax,8)
   14012d7f3:	mov    0x80(%rsp),%rax
   14012d7fb:	movabs $0xfffd000100000000,%rdx
   14012d805:	mov    (%rax),%r8
   14012d808:	movabs $0xffffffff00000000,%rax
   14012d812:	mov    %r8,%rcx
   14012d815:	and    %rax,%rcx
   14012d818:	cmp    %rdx,%rcx
   14012d81b:	je     140130bd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc624>
   14012d821:	mov    0x60(%rsp),%rcx
   14012d826:	mov    (%rcx),%rcx
   14012d829:	and    %rcx,%rax
   14012d82c:	cmp    %rdx,%rax
   14012d82f:	je     140130bd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc624>
   14012d835:	movabs $0xfff7ffffffffffff,%rdx
   14012d83f:	cmp    %r10,%rdx
   14012d842:	jae    14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d848:	movabs $0xfffc000000000000,%rax
   14012d852:	cmp    %rax,%r10
   14012d855:	je     14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d85b:	cmp    %r8,%rdx
   14012d85e:	jae    14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d864:	cmp    %rax,%r8
   14012d867:	je     14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d86d:	cmp    %rcx,%rdx
   14012d870:	jae    14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d876:	cmp    %rax,%rcx
   14012d879:	je     14012eb67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5b7>
   14012d87f:	mov    0x80(%rsp),%rdx
   14012d887:	mov    %r11,%rcx
   14012d88a:	vzeroupper
   14012d88d:	call   14021a760 <setun::VMValue::mul(setun::VMValue const&) const>
   14012d892:	mov    0x60(%rsp),%rdx
   14012d897:	lea    0x710(%rsp),%rcx
   14012d89f:	mov    %rax,0x710(%rsp)
   14012d8a7:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   14012d8ac:	mov    0x1068(%rbx),%rdx
   14012d8b3:	mov    0x40(%rsp),%rcx
   14012d8b8:	mov    %rax,(%rdx,%rcx,8)
   14012d8bc:	cmpb   $0x0,0x1040(%rbx)
   14012d8c3:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012d8c9:	movzbl 0x8(%rdi),%eax
   14012d8cd:	lea    0x9(%rdi),%r12
   14012d8d1:	lea    0x2937c8(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d8d8:	jmp    *(%rdi,%rax,8)
   14012d8db:	movswq %di,%rcx
   14012d8df:	mov    %r8,0x60(%rsp)
   14012d8e4:	mov    %rcx,%rdx
   14012d8e7:	lea    0x710(%rsp),%rcx
   14012d8ef:	mov    %r9,0x40(%rsp)
   14012d8f4:	vzeroupper
   14012d8f7:	call   140210640 <setun::VMValue::VMValue(long long)>
   14012d8fc:	mov    0x40(%rsp),%rcx
   14012d901:	lea    0x710(%rsp),%rdx
   14012d909:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   14012d90e:	mov    0x40(%rsp),%r9
   14012d913:	mov    0x60(%rsp),%r8
   14012d918:	cmpb   $0x0,0x1040(%rbx)
   14012d91f:	mov    %rax,(%r9)
   14012d922:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012d928:	movzbl 0x4(%r8),%eax
   14012d92d:	lea    0x29376c(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d934:	lea    0x5(%r8),%r12
   14012d938:	jmp    *(%rdi,%rax,8)
   14012d93b:	movswq %r10w,%rdx
   14012d93f:	lea    0x710(%rsp),%rax
   14012d947:	mov    %r9,0x80(%rsp)
   14012d94f:	mov    %rax,0x60(%rsp)
   14012d954:	mov    %rax,%rcx
   14012d957:	vzeroupper
   14012d95a:	call   140210640 <setun::VMValue::VMValue(long long)>
   14012d95f:	mov    0x60(%rsp),%rdx
   14012d964:	mov    0x40(%rsp),%rcx
   14012d969:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   14012d96e:	mov    0x1068(%rbx),%rdx
   14012d975:	mov    0x80(%rsp),%r9
   14012d97d:	mov    %rax,(%rdx,%r9,8)
   14012d981:	cmpb   $0x0,0x1040(%rbx)
   14012d988:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012d98e:	movzbl 0x6(%rdi),%eax
   14012d992:	lea    0x7(%rdi),%r12
   14012d996:	lea    0x293703(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012d99d:	jmp    *(%rdi,%rax,8)
   14012d9a0:	vzeroupper
   14012d9a3:	jmp    14012b08f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6adf>
   14012d9a8:	cmp    $0x2,%sil
   14012d9ac:	jne    140136c8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126db>
   14012d9b2:	mov    0x1d0(%rsp),%rdx
   14012d9ba:	mov    0x1c8(%rsp),%rax
   14012d9c2:	movabs $0xfffd000000000000,%rcx
   14012d9cc:	mov    %rdx,0x1c8(%rsp)
   14012d9d4:	movabs $0xffff000000000000,%rdx
   14012d9de:	and    %rax,%rdx
   14012d9e1:	mov    %rax,0x3e0(%rsp)
   14012d9e9:	cmp    %rcx,%rdx
   14012d9ec:	je     140135956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113a6>
   14012d9f2:	mov    0x1c8(%rsp),%rax
   14012d9fa:	mov    $0x2,%esi
   14012d9ff:	mov    %rax,0x1d0(%rsp)
   14012da07:	jmp    1401297a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51f7>
   14012da0c:	mov    %rax,%rcx
   14012da0f:	mov    0x8(%rax),%eax
   14012da12:	mov    %eax,0x80(%rsp)
   14012da19:	add    $0x1,%eax
   14012da1c:	mov    %eax,0x8(%rcx)
   14012da1f:	cmp    0xc(%rcx),%eax
   14012da22:	jb     14012dae7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9537>
   14012da28:	cmp    $0x2,%sil
   14012da2c:	je     140137f00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13950>
   14012da32:	sub    $0x1,%sil
   14012da36:	je     140137ecd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1391d>
   14012da3c:	mov    0x1048(%rbx),%r11
   14012da43:	mov    0x1050(%rbx),%rax
   14012da4a:	vzeroupper
   14012da4d:	mov    %r12,%rdx
   14012da50:	sub    %r11,%rax
   14012da53:	sub    %r15,%rdx
   14012da56:	mov    %rdx,0x1038(%rbx)
   14012da5d:	mov    %r13,%rdx
   14012da60:	sub    %r11,%rdx
   14012da63:	mov    %rdx,%rsi
   14012da66:	sar    $0x3,%rsi
   14012da6a:	cmp    %rdx,%rax
   14012da6d:	jb     140137eb8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13908>
   14012da73:	mov    %rsi,0x1060(%rbx)
   14012da7a:	mov    0x60(%rsp),%r9d
   14012da7f:	mov    %rbx,%rdx
   14012da82:	mov    %r14,%r8
   14012da85:	vmovdqa 0x230033(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   14012da8d:	mov    0xa0(%rsp),%rax
   14012da95:	movb   $0x0,0x153a0(%rbx)
   14012da9c:	mov    0x152c8(%rbx),%rcx
   14012daa3:	vmovdqa %xmm0,0x15390(%rbx)
   14012daab:	mov    %rax,0x20(%rsp)
   14012dab0:	call   1401724e0 <setun::JITManager::slow_tiering_coordinator_call(setun::VM*, setun::Chunk const&, unsigned long long, setun::FunctionHotData&)>
   14012dab5:	mov    0x1060(%rbx),%rdx
   14012dabc:	mov    0x1038(%rbx),%r12
   14012dac3:	mov    0x1048(%rbx),%r11
   14012daca:	mov    0x1050(%rbx),%rsi
   14012dad1:	add    %r15,%r12
   14012dad4:	mov    %rsi,0x30(%rsp)
   14012dad9:	lea    (%r11,%rdx,8),%r13
   14012dadd:	test   %al,%al
   14012dadf:	je     140137ea5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138f5>
   14012dae5:	xor    %esi,%esi
   14012dae7:	cmpb   $0x0,0x15211(%rbx)
   14012daee:	je     14012e02d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9a7d>
   14012daf4:	mov    0x150c0(%rbx),%rax
   14012dafb:	mov    0x15268(%rbx),%rbp
   14012db02:	test   %rax,%rax
   14012db05:	je     14012f3a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadf8>
   14012db0b:	lea    (%rax,%rax,4),%rax
   14012db0f:	lea    (%rbx,%rax,8),%rdx
   14012db13:	mov    0x10a0(%rdx),%rax
   14012db1a:	mov    0x10b0(%rdx),%rdx
   14012db21:	add    %rdx,%rax
   14012db24:	cmp    %rax,%rbp
   14012db27:	jb     140136c02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12652>
   14012db2d:	mov    0x40(%rsp),%rax
   14012db32:	lea    (%rax,%rbp,1),%rdx
   14012db36:	mov    0x1070(%rbx),%rax
   14012db3d:	sub    0x1068(%rbx),%rax
   14012db44:	mov    %rdx,0x15268(%rbx)
   14012db4b:	sar    $0x3,%rax
   14012db4f:	add    $0x40,%rdx
   14012db53:	cmp    %rax,%rdx
   14012db56:	jae    140134049 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa99>
   14012db5c:	test   %dil,%dil
   14012db5f:	je     1401323e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde37>
   14012db65:	movzbl %dil,%edx
   14012db69:	movzbl %dil,%r8d
   14012db6d:	lea    -0x1(%rdx,%rbp,1),%rcx
   14012db72:	sub    $0x1,%r8d
   14012db76:	sub    $0x2,%rdx
   14012db7a:	sub    %r8,%rdx
   14012db7d:	lea    0x0(,%rcx,8),%rax
   14012db85:	mov    0x1068(%rbx),%r8
   14012db8c:	add    %rbp,%rdx
   14012db8f:	shl    $0x3,%rdx
   14012db93:	cmp    $0x1,%sil
   14012db97:	je     14012dbc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9618>
   14012db99:	cmp    $0x2,%sil
   14012db9d:	jne    14012dbdd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x962d>
   14012db9f:	mov    0x1c8(%rsp),%r9
   14012dba7:	sub    $0x8,%rax
   14012dbab:	mov    %r9,(%r8,%rcx,8)
   14012dbaf:	mov    0x1d0(%rsp),%rcx
   14012dbb7:	mov    %rcx,0x1c8(%rsp)
   14012dbbf:	cmp    %rax,%rdx
   14012dbc2:	je     14012f625 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb075>
   14012dbc8:	mov    0x1c8(%rsp),%rcx
   14012dbd0:	mov    %rcx,(%r8,%rax,1)
   14012dbd4:	sub    $0x8,%rax
   14012dbd8:	cmp    %rax,%rdx
   14012dbdb:	je     14012dbf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9645>
   14012dbdd:	mov    %r13,%rcx
   14012dbe0:	sub    $0x8,%r13
   14012dbe4:	mov    -0x8(%rcx),%rcx
   14012dbe8:	mov    %rcx,(%r8,%rax,1)
   14012dbec:	sub    $0x8,%rax
   14012dbf0:	cmp    %rax,%rdx
   14012dbf3:	jne    14012dbdd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x962d>
   14012dbf5:	mov    0x1048(%rbx),%r11
   14012dbfc:	sub    %r11,%r13
   14012dbff:	mov    0x150c0(%rbx),%rax
   14012dc06:	mov    0x60(%rsp),%esi
   14012dc0a:	sub    %r15,%r12
   14012dc0d:	mov    %r13,%rdi
   14012dc10:	sar    $0x3,%rdi
   14012dc14:	cmp    $0x7ff,%rax
   14012dc1a:	ja     14013945b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14eab>
   14012dc20:	mov    0x40(%rsp),%rcx
   14012dc25:	lea    0x1(%rax),%rdx
   14012dc29:	lea    (%rax,%rax,4),%rax
   14012dc2d:	mov    %rdx,0x150c0(%rbx)
   14012dc34:	mov    %r12,0x10c0(%rbx,%rax,8)
   14012dc3c:	mov    %rbp,0x10c8(%rbx,%rax,8)
   14012dc44:	mov    %rdi,0x10d0(%rbx,%rax,8)
   14012dc4c:	mov    %rcx,0x10d8(%rbx,%rax,8)
   14012dc54:	mov    %rsi,0x10e0(%rbx,%rax,8)
   14012dc5c:	mov    0x1050(%rbx),%rax
   14012dc63:	sub    %r11,%rax
   14012dc66:	cmp    %r13,%rax
   14012dc69:	jb     14012e6ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa13f>
   14012dc6f:	mov    0x15270(%rbx),%rax
   14012dc76:	mov    %rdi,0x1060(%rbx)
   14012dc7d:	mov    0x152a0(%rbx),%rdi
   14012dc84:	cmp    %rdi,0x68(%rax)
   14012dc88:	jae    140132b39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe589>
   14012dc8e:	mov    0x1060(%rbx),%rax
   14012dc95:	mov    0x1048(%rbx),%r11
   14012dc9c:	add    %r15,%rsi
   14012dc9f:	mov    %rsi,%r12
   14012dca2:	lea    (%r11,%rax,8),%r13
   14012dca6:	cmpb   $0x0,0x1040(%rbx)
   14012dcad:	je     140132c88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6d8>
   14012dcb3:	movzbl (%rsi),%eax
   14012dcb6:	lea    0x2933e3(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012dcbd:	lea    0x1(%rsi),%r12
   14012dcc1:	xor    %esi,%esi
   14012dcc3:	mov    (%rdi,%rax,8),%rax
   14012dcc7:	jmp    *%rax
   14012dcc9:	lea    0x2a8(%rsp),%rcx
   14012dcd1:	vzeroupper
   14012dcd4:	call   14021ca10 <setun::VMValue::as_float() const>
   14012dcd9:	lea    0x2b0(%rsp),%rcx
   14012dce1:	vmovapd %xmm0,%xmm7
   14012dce5:	call   14021ca10 <setun::VMValue::as_float() const>
   14012dcea:	vsubsd %xmm0,%xmm7,%xmm0
   14012dcee:	vandpd 0x22fe4a(%rip),%xmm0,%xmm0        # 14035db40 <CSWTCH.4381+0x240>
   14012dcf6:	vcomisd 0x22fe2a(%rip),%xmm0        # 14035db28 <CSWTCH.4381+0x228>
   14012dcfe:	setae  %al
   14012dd01:	jmp    1401267d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2229>
   14012dd06:	mov    0x1050(%rbx),%rax
   14012dd0d:	sub    %r11,%r13
   14012dd10:	mov    %rax,%rdx
   14012dd13:	sub    %r11,%rdx
   14012dd16:	sar    $0x3,%rdx
   14012dd1a:	lea    (%rdx,%rdx,1),%rcx
   14012dd1e:	cmp    %rcx,%rdx
   14012dd21:	jb     14012f4fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaf4c>
   14012dd27:	add    %r11,%r13
   14012dd2a:	jmp    1401251c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc12>
   14012dd2f:	cmp    $0x1,%sil
   14012dd33:	je     14012f5a6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaff6>
   14012dd39:	lea    0x8(%r13),%rax
   14012dd3d:	cmp    0x30(%rsp),%rax
   14012dd42:	jae    140133c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf656>
   14012dd48:	mov    0x1d0(%rsp),%rdx
   14012dd50:	mov    %r13,%rax
   14012dd53:	lea    0x8(%r13),%r13
   14012dd57:	mov    %rdx,(%rax)
   14012dd5a:	mov    0x1c8(%rsp),%rax
   14012dd62:	mov    %rax,0x1d0(%rsp)
   14012dd6a:	mov    0x60(%rsp),%rax
   14012dd6f:	mov    %rax,0x710(%rsp)
   14012dd77:	lock addl $0x1,0x8(%rdi)
   14012dd7c:	lea    0x710(%rsp),%rdx
   14012dd84:	lea    0x540(%rsp),%rcx
   14012dd8c:	mov    %rdi,0x718(%rsp)
   14012dd94:	call   14020fb80 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012dd99:	mov    0x540(%rsp),%rax
   14012dda1:	mov    0x718(%rsp),%rcx
   14012dda9:	mov    %rax,0x1c8(%rsp)
   14012ddb1:	test   %rcx,%rcx
   14012ddb4:	je     14012ddbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x980b>
   14012ddb6:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012ddbb:	mov    $0x2,%esi
   14012ddc0:	jmp    14012ad04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6754>
   14012ddc5:	lea    0x388(%rsp),%rcx
   14012ddcd:	vzeroupper
   14012ddd0:	call   14021ca10 <setun::VMValue::as_float() const>
   14012ddd5:	lea    0x390(%rsp),%rcx
   14012dddd:	vmovapd %xmm0,%xmm7
   14012dde1:	call   14021ca10 <setun::VMValue::as_float() const>
   14012dde6:	vcomisd %xmm7,%xmm0
   14012ddea:	seta   %al
   14012dded:	jmp    14012915c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bac>
   14012ddf2:	lea    0x2c8(%rsp),%rcx
   14012ddfa:	vzeroupper
   14012ddfd:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de02:	lea    0x2d0(%rsp),%rcx
   14012de0a:	vmovapd %xmm0,%xmm7
   14012de0e:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de13:	vcomisd %xmm7,%xmm0
   14012de17:	setae  %al
   14012de1a:	jmp    140126a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x248f>
   14012de1f:	lea    0x3a8(%rsp),%rcx
   14012de27:	vzeroupper
   14012de2a:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de2f:	lea    0x3b0(%rsp),%rcx
   14012de37:	vmovapd %xmm0,%xmm7
   14012de3b:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de40:	vmovsd 0x22fce0(%rip),%xmm1        # 14035db28 <CSWTCH.4381+0x228>
   14012de48:	vsubsd %xmm0,%xmm7,%xmm0
   14012de4c:	vandpd 0x22fcec(%rip),%xmm0,%xmm0        # 14035db40 <CSWTCH.4381+0x240>
   14012de54:	vcomisd %xmm0,%xmm1
   14012de58:	seta   %r8b
   14012de5c:	jmp    140129425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e75>
   14012de61:	lea    0x2d8(%rsp),%rcx
   14012de69:	vzeroupper
   14012de6c:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de71:	lea    0x2e0(%rsp),%rcx
   14012de79:	vmovapd %xmm0,%xmm7
   14012de7d:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de82:	vcomisd %xmm0,%xmm7
   14012de86:	seta   %al
   14012de89:	jmp    140126b72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25c2>
   14012de8e:	lea    0x2b8(%rsp),%rcx
   14012de96:	vzeroupper
   14012de99:	call   14021ca10 <setun::VMValue::as_float() const>
   14012de9e:	lea    0x2c0(%rsp),%rcx
   14012dea6:	vmovapd %xmm0,%xmm7
   14012deaa:	call   14021ca10 <setun::VMValue::as_float() const>
   14012deaf:	vcomisd %xmm7,%xmm0
   14012deb3:	seta   %al
   14012deb6:	jmp    14012690c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x235c>
   14012debb:	lea    0x2e8(%rsp),%rcx
   14012dec3:	vzeroupper
   14012dec6:	call   14021ca10 <setun::VMValue::as_float() const>
   14012decb:	lea    0x2f0(%rsp),%rcx
   14012ded3:	vmovapd %xmm0,%xmm7
   14012ded7:	call   14021ca10 <setun::VMValue::as_float() const>
   14012dedc:	vcomisd %xmm0,%xmm7
   14012dee0:	setae  %al
   14012dee3:	jmp    140126ca5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26f5>
   14012dee8:	lea    0x3b8(%rsp),%rcx
   14012def0:	vzeroupper
   14012def3:	call   14021ca10 <setun::VMValue::as_float() const>
   14012def8:	lea    0x3c0(%rsp),%rcx
   14012df00:	vmovapd %xmm0,%xmm7
   14012df04:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df09:	vcomisd %xmm0,%xmm7
   14012df0d:	seta   %al
   14012df10:	jmp    14012958a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fda>
   14012df15:	lea    0x3c8(%rsp),%rcx
   14012df1d:	vzeroupper
   14012df20:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df25:	lea    0x3d0(%rsp),%rcx
   14012df2d:	vmovapd %xmm0,%xmm7
   14012df31:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df36:	vcomisd %xmm0,%xmm7
   14012df3a:	setae  %al
   14012df3d:	jmp    1401296ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x513e>
   14012df42:	lea    0x398(%rsp),%rcx
   14012df4a:	vzeroupper
   14012df4d:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df52:	lea    0x3a0(%rsp),%rcx
   14012df5a:	vmovapd %xmm0,%xmm7
   14012df5e:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df63:	vcomisd %xmm7,%xmm0
   14012df67:	setae  %al
   14012df6a:	jmp    1401292c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d10>
   14012df6f:	lea    0x298(%rsp),%rcx
   14012df77:	vzeroupper
   14012df7a:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df7f:	lea    0x2a0(%rsp),%rcx
   14012df87:	vmovapd %xmm0,%xmm7
   14012df8b:	call   14021ca10 <setun::VMValue::as_float() const>
   14012df90:	vmovsd 0x22fb90(%rip),%xmm1        # 14035db28 <CSWTCH.4381+0x228>
   14012df98:	vsubsd %xmm0,%xmm7,%xmm0
   14012df9c:	vandpd 0x22fb9c(%rip),%xmm0,%xmm0        # 14035db40 <CSWTCH.4381+0x240>
   14012dfa4:	vcomisd %xmm0,%xmm1
   14012dfa8:	seta   %dil
   14012dfac:	jmp    1401266a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20f5>
   14012dfb1:	shr    $0x20,%rdx
   14012dfb5:	cmp    $0x1,%dx
   14012dfb9:	je     14012ffb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba00>
   14012dfbf:	cmp    $0x5,%dx
   14012dfc3:	jne    140125661 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b1>
   14012dfc9:	mov    %r9,%rcx
   14012dfcc:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012dfd1:	lea    0x440(%rsp),%r8
   14012dfd9:	movq   $0x0,0x448(%rsp)
   14012dfe5:	mov    %rax,0x440(%rsp)
   14012dfed:	movq   $0x0,0x450(%rsp)
   14012dff9:	jmp    140125696 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e6>
   14012dffe:	shr    $0x20,%rdx
   14012e002:	cmp    $0x1,%dx
   14012e006:	je     14012ffd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xba28>
   14012e00c:	cmp    $0x5,%dx
   14012e010:	jne    1401256d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1121>
   14012e016:	mov    0x40(%rsp),%rcx
   14012e01b:	mov    %r8,0xc0(%rsp)
   14012e023:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012e028:	jmp    1401256e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1138>
   14012e02d:	mov    0x40(%rsp),%rax
   14012e032:	mov    0x1070(%rbx),%rbp
   14012e039:	lea    0x1068(%rbx),%rcx
   14012e040:	sub    0x1068(%rbx),%rbp
   14012e047:	sar    $0x3,%rbp
   14012e04b:	lea    (%rax,%rbp,1),%rdx
   14012e04f:	vzeroupper
   14012e052:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e057:	jmp    14012db5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ac>
   14012e05c:	movabs $0xfff8000000000000,%rax
   14012e066:	mov    %rax,0x1c8(%rsp)
   14012e06e:	mov    $0x1,%esi
   14012e073:	jmp    140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   14012e078:	lea    (%rsi,%rsi,1),%rdx
   14012e07c:	lea    0x1048(%rbx),%rcx
   14012e083:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e088:	jmp    1401275eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x303b>
   14012e08d:	lea    (%rsi,%rsi,1),%rdx
   14012e091:	lea    0x1048(%rbx),%rcx
   14012e098:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e09d:	jmp    1401280c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3b19>
   14012e0a2:	lea    (%rsi,%rsi,1),%rdx
   14012e0a6:	lea    0x1048(%rbx),%rcx
   14012e0ad:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e0b2:	jmp    14012819f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bef>
   14012e0b7:	lea    (%rsi,%rsi,1),%rdx
   14012e0bb:	lea    0x1048(%rbx),%rcx
   14012e0c2:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e0c7:	jmp    14012786d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x32bd>
   14012e0cc:	lea    (%rsi,%rsi,1),%rdx
   14012e0d0:	lea    0x1048(%rbx),%rcx
   14012e0d7:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e0dc:	jmp    140127aef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x353f>
   14012e0e1:	lea    (%rsi,%rsi,1),%rdx
   14012e0e5:	lea    0x1048(%rbx),%rcx
   14012e0ec:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e0f1:	jmp    140127943 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3393>
   14012e0f6:	lea    (%rsi,%rsi,1),%rdx
   14012e0fa:	lea    0x1048(%rbx),%rcx
   14012e101:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e106:	jmp    1401276c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3111>
   14012e10b:	lea    (%rsi,%rsi,1),%rdx
   14012e10f:	lea    0x1048(%rbx),%rcx
   14012e116:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e11b:	jmp    14012a656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x60a6>
   14012e120:	lea    (%rsi,%rsi,1),%rdx
   14012e124:	lea    0x1048(%rbx),%rcx
   14012e12b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e130:	jmp    140127a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3469>
   14012e135:	lea    (%rsi,%rsi,1),%rdx
   14012e139:	lea    0x1048(%rbx),%rcx
   14012e140:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e145:	jmp    140127c9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36eb>
   14012e14a:	lea    (%rsi,%rsi,1),%rdx
   14012e14e:	lea    0x1048(%rbx),%rcx
   14012e155:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e15a:	jmp    140127bc5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3615>
   14012e15f:	lea    (%rsi,%rsi,1),%rdx
   14012e163:	lea    0x1048(%rbx),%rcx
   14012e16a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e16f:	jmp    140127e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3897>
   14012e174:	lea    (%rsi,%rsi,1),%rdx
   14012e178:	lea    0x1048(%rbx),%rcx
   14012e17f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e184:	jmp    140127d71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37c1>
   14012e189:	lea    (%rsi,%rsi,1),%rdx
   14012e18d:	lea    0x1048(%rbx),%rcx
   14012e194:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e199:	jmp    140127ff3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a43>
   14012e19e:	lea    (%rsi,%rsi,1),%rdx
   14012e1a2:	lea    0x1048(%rbx),%rcx
   14012e1a9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e1ae:	jmp    140127f1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x396d>
   14012e1b3:	lea    (%rsi,%rsi,1),%rdx
   14012e1b7:	lea    0x1048(%rbx),%rcx
   14012e1be:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e1c3:	jmp    14012a2fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d4e>
   14012e1c8:	lea    (%rsi,%rsi,1),%rdx
   14012e1cc:	lea    0x1048(%rbx),%rcx
   14012e1d3:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e1d8:	jmp    14012a3d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e24>
   14012e1dd:	lea    (%rsi,%rsi,1),%rdx
   14012e1e1:	lea    0x1048(%rbx),%rcx
   14012e1e8:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e1ed:	jmp    140128275 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3cc5>
   14012e1f2:	mov    0x1050(%rbx),%rax
   14012e1f9:	sub    %r11,%r13
   14012e1fc:	mov    %rax,%rdx
   14012e1ff:	sub    %r11,%rdx
   14012e202:	sar    $0x3,%rdx
   14012e206:	lea    (%rdx,%rdx,1),%rcx
   14012e20a:	cmp    %rcx,%rdx
   14012e20d:	jb     140131350 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcda0>
   14012e213:	add    %r11,%r13
   14012e216:	jmp    14012b0a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6af5>
   14012e21b:	lea    (%rsi,%rsi,1),%rdx
   14012e21f:	lea    0x1048(%rbx),%rcx
   14012e226:	vzeroupper
   14012e229:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e22e:	mov    0x1048(%rbx),%r11
   14012e235:	mov    0x1050(%rbx),%rax
   14012e23c:	jmp    14012a967 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x63b7>
   14012e241:	lea    (%rsi,%rsi,1),%rdx
   14012e245:	lea    0x1048(%rbx),%rcx
   14012e24c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e251:	jmp    14012ab0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x655d>
   14012e256:	lea    (%rsi,%rsi,1),%rdx
   14012e25a:	lea    0x1048(%rbx),%rcx
   14012e261:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e266:	jmp    14012aa37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6487>
   14012e26b:	lea    (%rsi,%rsi,1),%rdx
   14012e26f:	lea    0x1048(%rbx),%rcx
   14012e276:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e27b:	jmp    140129fa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59f6>
   14012e280:	lea    (%rsi,%rsi,1),%rdx
   14012e284:	lea    0x1048(%rbx),%rcx
   14012e28b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e290:	jmp    14012a07c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5acc>
   14012e295:	lea    (%rsi,%rsi,1),%rdx
   14012e299:	lea    0x1048(%rbx),%rcx
   14012e2a0:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2a5:	jmp    140129820 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5270>
   14012e2aa:	lea    (%rsi,%rsi,1),%rdx
   14012e2ae:	lea    0x1048(%rbx),%rcx
   14012e2b5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2ba:	jmp    1401298f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5346>
   14012e2bf:	lea    (%rsi,%rsi,1),%rdx
   14012e2c3:	lea    0x1048(%rbx),%rcx
   14012e2ca:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2cf:	jmp    1401299cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x541c>
   14012e2d4:	lea    (%rsi,%rsi,1),%rdx
   14012e2d8:	lea    0x1048(%rbx),%rcx
   14012e2df:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2e4:	jmp    140129aa2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54f2>
   14012e2e9:	lea    (%rsi,%rsi,1),%rdx
   14012e2ed:	lea    0x1048(%rbx),%rcx
   14012e2f4:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e2f9:	jmp    140129b78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55c8>
   14012e2fe:	lea    (%rsi,%rsi,1),%rdx
   14012e302:	lea    0x1048(%rbx),%rcx
   14012e309:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e30e:	jmp    140129c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x569e>
   14012e313:	lea    (%rsi,%rsi,1),%rdx
   14012e317:	lea    0x1048(%rbx),%rcx
   14012e31e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e323:	jmp    140127515 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f65>
   14012e328:	lea    (%rsi,%rsi,1),%rdx
   14012e32c:	lea    0x1048(%rbx),%rcx
   14012e333:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e338:	jmp    140129d24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5774>
   14012e33d:	lea    (%rsi,%rsi,1),%rdx
   14012e341:	lea    0x1048(%rbx),%rcx
   14012e348:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e34d:	jmp    14012a152 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5ba2>
   14012e352:	lea    (%rsi,%rsi,1),%rdx
   14012e356:	lea    0x1048(%rbx),%rcx
   14012e35d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e362:	jmp    14012a228 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c78>
   14012e367:	lea    (%rsi,%rsi,1),%rdx
   14012e36b:	lea    0x1048(%rbx),%rcx
   14012e372:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e377:	jmp    140129dfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x584a>
   14012e37c:	lea    (%rsi,%rsi,1),%rdx
   14012e380:	lea    0x1048(%rbx),%rcx
   14012e387:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e38c:	jmp    140129ed0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5920>
   14012e391:	lea    (%rsi,%rsi,1),%rdx
   14012e395:	lea    0x1048(%rbx),%rcx
   14012e39c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e3a1:	jmp    14012a580 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fd0>
   14012e3a6:	lea    (%rsi,%rsi,1),%rdx
   14012e3aa:	lea    0x1048(%rbx),%rcx
   14012e3b1:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e3b6:	jmp    14012a802 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6252>
   14012e3bb:	lea    (%rsi,%rsi,1),%rdx
   14012e3bf:	lea    0x1048(%rbx),%rcx
   14012e3c6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e3cb:	jmp    14012a4aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5efa>
   14012e3d0:	lea    (%rsi,%rsi,1),%rdx
   14012e3d4:	lea    0x1048(%rbx),%rcx
   14012e3db:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e3e0:	jmp    14012a8f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6349>
   14012e3e5:	lea    (%rsi,%rsi,1),%rdx
   14012e3e9:	lea    0x1048(%rbx),%rcx
   14012e3f0:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e3f5:	jmp    140127797 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31e7>
   14012e3fa:	lea    (%rsi,%rsi,1),%rdx
   14012e3fe:	lea    0x1048(%rbx),%rcx
   14012e405:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e40a:	jmp    14012a72c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x617c>
   14012e40f:	mov    0x1048(%rbx),%r11
   14012e416:	lea    0x10(%r13),%rax
   14012e41a:	cmp    0x30(%rsp),%rax
   14012e41f:	jae    1401339b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf407>
   14012e425:	mov    0x1050(%rbx),%rax
   14012e42c:	mov    0x1d0(%rsp),%rcx
   14012e434:	mov    %r13,%rdx
   14012e437:	lea    0x10(%r13),%r13
   14012e43b:	mov    %rcx,-0x10(%r13)
   14012e43f:	mov    0x1c8(%rsp),%rcx
   14012e447:	mov    %rcx,0x8(%rdx)
   14012e44b:	jmp    140128707 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4157>
   14012e450:	lea    (%rsi,%rsi,1),%rdx
   14012e454:	lea    0x1048(%rbx),%rcx
   14012e45b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e460:	jmp    140128727 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4177>
   14012e465:	lea    0x1068(%rbx),%rcx
   14012e46c:	mov    %rax,%rdx
   14012e46f:	vzeroupper
   14012e472:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e477:	jmp    1401271d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2c28>
   14012e47c:	vzeroupper
   14012e47f:	jmp    14012abe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6636>
   14012e484:	xor    %esi,%esi
   14012e486:	shr    $0x20,%rax
   14012e48a:	cmp    $0x2,%ax
   14012e48e:	je     140130a37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc487>
   14012e494:	cmp    $0x3,%ax
   14012e498:	je     140130979 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc3c9>
   14012e49e:	cmp    $0x1,%ax
   14012e4a2:	je     14013181b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd26b>
   14012e4a8:	test   %ax,%ax
   14012e4ab:	jne    14012f36f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadbf>
   14012e4b1:	movzwl 0x6(%r9),%edi
   14012e4b6:	lea    0x22e605(%rip),%rdx        # 14035cac2 <.rdata+0x502>
   14012e4bd:	shl    $0x5,%rdi
   14012e4c1:	add    0x30(%r14),%rdi
   14012e4c5:	mov    %rdi,%rcx
   14012e4c8:	vzeroupper
   14012e4cb:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012e4d0:	test   %al,%al
   14012e4d2:	jne    14012e4eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f3b>
   14012e4d4:	lea    0x22e5e3(%rip),%rdx        # 14035cabe <.rdata+0x4fe>
   14012e4db:	mov    %rdi,%rcx
   14012e4de:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14012e4e3:	test   %al,%al
   14012e4e5:	je     14012f36f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadbf>
   14012e4eb:	test   %sil,%sil
   14012e4ee:	je     1401334d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef28>
   14012e4f4:	cmp    $0x1,%sil
   14012e4f8:	je     1401350a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10af5>
   14012e4fe:	mov    %r13,%rsi
   14012e501:	lea    0x8(%r13),%r13
   14012e505:	cmp    0x30(%rsp),%r13
   14012e50a:	jae    140138423 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e73>
   14012e510:	mov    0x1d0(%rsp),%rdx
   14012e518:	mov    %rdx,(%rsi)
   14012e51b:	mov    0x1c8(%rsp),%rax
   14012e523:	lea    0x710(%rsp),%rcx
   14012e52b:	lea    0x3e0(%rsp),%rdx
   14012e533:	mov    %rax,0x1d0(%rsp)
   14012e53b:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012e540:	mov    0x718(%rsp),%rdx
   14012e548:	lea    0x540(%rsp),%rcx
   14012e550:	call   140210640 <setun::VMValue::VMValue(long long)>
   14012e555:	mov    0x540(%rsp),%rax
   14012e55d:	mov    0x710(%rsp),%rcx
   14012e565:	mov    %rax,0x1c8(%rsp)
   14012e56d:	lea    0x720(%rsp),%rax
   14012e575:	cmp    %rax,%rcx
   14012e578:	je     14012e58b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fdb>
   14012e57a:	mov    0x720(%rsp),%rax
   14012e582:	lea    0x1(%rax),%rdx
   14012e586:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012e58b:	mov    $0x2,%esi
   14012e590:	cmpb   $0x0,0x1040(%rbx)
   14012e597:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012e59d:	mov    %r12,%rax
   14012e5a0:	lea    0x292af9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012e5a7:	lea    0x1(%r12),%r12
   14012e5ac:	movzbl (%rax),%eax
   14012e5af:	jmp    *(%rdi,%rax,8)
   14012e5b2:	cmp    $0x1,%ax
   14012e5b6:	je     140131ae8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd538>
   14012e5bc:	cmp    $0x2,%ax
   14012e5c0:	je     1401327fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe24e>
   14012e5c6:	test   %sil,%sil
   14012e5c9:	je     14012ad92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67e2>
   14012e5cf:	cmp    $0x1,%sil
   14012e5d3:	je     14012e5f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa046>
   14012e5d5:	lea    0x8(%r13),%rax
   14012e5d9:	cmp    0x30(%rsp),%rax
   14012e5de:	jae    140136167 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11bb7>
   14012e5e4:	mov    0x1d0(%rsp),%rdx
   14012e5ec:	mov    %r13,%rax
   14012e5ef:	lea    0x8(%r13),%r13
   14012e5f3:	mov    %rdx,(%rax)
   14012e5f6:	mov    0x1c8(%rsp),%rax
   14012e5fe:	mov    %rax,0x1d0(%rsp)
   14012e606:	movabs $0xfff8000000000000,%rax
   14012e610:	mov    %rax,0x1c8(%rsp)
   14012e618:	mov    $0x2,%esi
   14012e61d:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   14012e622:	cmp    $0x1,%dx
   14012e626:	je     140131a24 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd474>
   14012e62c:	cmp    $0x2,%dx
   14012e630:	jne    140128c29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4679>
   14012e636:	lea    0x330(%rsp),%rcx
   14012e63e:	vzeroupper
   14012e641:	call   14021c730 <setun::VMValue::payload() const>
   14012e646:	mov    0x48(%rax),%rdi
   14012e64a:	test   %rdi,%rdi
   14012e64d:	je     14012f66d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0bd>
   14012e653:	test   %sil,%sil
   14012e656:	je     140135311 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d61>
   14012e65c:	cmp    $0x1,%sil
   14012e660:	je     14012e683 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0d3>
   14012e662:	lea    0x8(%r13),%rax
   14012e666:	cmp    0x30(%rsp),%rax
   14012e66b:	jae    140138389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dd9>
   14012e671:	mov    0x1d0(%rsp),%rdx
   14012e679:	mov    %r13,%rax
   14012e67c:	lea    0x8(%r13),%r13
   14012e680:	mov    %rdx,(%rax)
   14012e683:	mov    0x1c8(%rsp),%rax
   14012e68b:	lea    0x338(%rsp),%rdx
   14012e693:	lea    0x710(%rsp),%rcx
   14012e69b:	mov    %rax,0x1d0(%rsp)
   14012e6a3:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14012e6a8:	mov    %rdi,%rcx
   14012e6ab:	lea    0x710(%rsp),%rdx
   14012e6b3:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14012e6b8:	mov    0x710(%rsp),%rcx
   14012e6c0:	mov    %rax,0x1c8(%rsp)
   14012e6c8:	lea    0x720(%rsp),%rax
   14012e6d0:	cmp    %rax,%rcx
   14012e6d3:	je     140128c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46cb>
   14012e6d9:	mov    0x720(%rsp),%rax
   14012e6e1:	lea    0x1(%rax),%rdx
   14012e6e5:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14012e6ea:	jmp    140128c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46cb>
   14012e6ef:	lea    (%rdi,%rdi,1),%rdx
   14012e6f3:	lea    0x1048(%rbx),%rcx
   14012e6fa:	vzeroupper
   14012e6fd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012e702:	jmp    14012dc6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96bf>
   14012e707:	mov    0x1048(%rbx),%r11
   14012e70e:	lea    0x8(%r13),%rax
   14012e712:	cmp    0x30(%rsp),%rax
   14012e717:	jae    140135f05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11955>
   14012e71d:	mov    0x1050(%rbx),%rax
   14012e724:	vzeroupper
   14012e727:	mov    0x1c8(%rsp),%rcx
   14012e72f:	mov    %r13,%rdx
   14012e732:	lea    0x8(%r13),%r13
   14012e736:	mov    %rcx,(%rdx)
   14012e739:	jmp    140127fd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3a23>
   14012e73e:	mov    0x1048(%rbx),%r11
   14012e745:	lea    0x8(%r13),%rax
   14012e749:	cmp    0x30(%rsp),%rax
   14012e74e:	jae    140134b30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10580>
   14012e754:	mov    0x1050(%rbx),%rax
   14012e75b:	vzeroupper
   14012e75e:	mov    0x1c8(%rsp),%rcx
   14012e766:	mov    %r13,%rdx
   14012e769:	lea    0x8(%r13),%r13
   14012e76d:	mov    %rcx,(%rdx)
   14012e770:	jmp    14012a48a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5eda>
   14012e775:	mov    0x1048(%rbx),%r11
   14012e77c:	lea    0x8(%r13),%rax
   14012e780:	cmp    0x30(%rsp),%rax
   14012e785:	jae    140134535 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff85>
   14012e78b:	mov    0x1050(%rbx),%rax
   14012e792:	vzeroupper
   14012e795:	mov    0x1c8(%rsp),%rcx
   14012e79d:	mov    %r13,%rdx
   14012e7a0:	lea    0x8(%r13),%r13
   14012e7a4:	mov    %rcx,(%rdx)
   14012e7a7:	jmp    14012aaed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x653d>
   14012e7ac:	mov    0x1048(%rbx),%r11
   14012e7b3:	lea    0x8(%r13),%rax
   14012e7b7:	cmp    0x30(%rsp),%rax
   14012e7bc:	jae    140134b04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10554>
   14012e7c2:	mov    0x1050(%rbx),%rax
   14012e7c9:	vzeroupper
   14012e7cc:	mov    0x1c8(%rsp),%rcx
   14012e7d4:	mov    %r13,%rdx
   14012e7d7:	lea    0x8(%r13),%r13
   14012e7db:	mov    %rcx,(%rdx)
   14012e7de:	jmp    140128255 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3ca5>
   14012e7e3:	mov    0x1048(%rbx),%r11
   14012e7ea:	lea    0x8(%r13),%rax
   14012e7ee:	cmp    0x30(%rsp),%rax
   14012e7f3:	jae    140134a87 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104d7>
   14012e7f9:	mov    0x1050(%rbx),%rax
   14012e800:	vzeroupper
   14012e803:	mov    0x1c8(%rsp),%rcx
   14012e80b:	mov    %r13,%rdx
   14012e80e:	lea    0x8(%r13),%r13
   14012e812:	mov    %rcx,(%rdx)
   14012e815:	jmp    140127efd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x394d>
   14012e81a:	mov    0x1048(%rbx),%r11
   14012e821:	lea    0x8(%r13),%rax
   14012e825:	cmp    0x30(%rsp),%rax
   14012e82a:	jae    140134b8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105db>
   14012e830:	mov    0x1050(%rbx),%rax
   14012e837:	mov    0x1c8(%rsp),%rcx
   14012e83f:	mov    %r13,%rdx
   14012e842:	lea    0x8(%r13),%r13
   14012e846:	mov    %rcx,(%rdx)
   14012e849:	jmp    14012a944 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6394>
   14012e84e:	mov    0x1048(%rbx),%r11
   14012e855:	lea    0x8(%r13),%rax
   14012e859:	cmp    0x30(%rsp),%rax
   14012e85e:	jae    1401352e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d35>
   14012e864:	mov    0x1050(%rbx),%rax
   14012e86b:	vzeroupper
   14012e86e:	mov    0x1c8(%rsp),%rcx
   14012e876:	mov    %r13,%rdx
   14012e879:	lea    0x8(%r13),%r13
   14012e87d:	mov    %rcx,(%rdx)
   14012e880:	jmp    14012aa17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6467>
   14012e885:	movzbl %dil,%edx
   14012e889:	mov    %r13,%rax
   14012e88c:	movabs $0xfffd000200000000,%rcx
   14012e896:	shl    $0x3,%rdx
   14012e89a:	sub    %rdx,%rax
   14012e89d:	mov    (%rax),%rdx
   14012e8a0:	movabs $0xffffffff00000000,%rax
   14012e8aa:	and    %rdx,%rax
   14012e8ad:	cmp    %rcx,%rax
   14012e8b0:	je     14012fdcf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb81f>
   14012e8b6:	vzeroupper
   14012e8b9:	mov    0x1048(%rbx),%r11
   14012e8c0:	lea    0x8(%r13),%rax
   14012e8c4:	cmp    0x30(%rsp),%rax
   14012e8c9:	jae    14013477f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101cf>
   14012e8cf:	mov    0x1050(%rbx),%rax
   14012e8d6:	mov    0x1c8(%rsp),%rcx
   14012e8de:	mov    %r13,%rdx
   14012e8e1:	lea    0x8(%r13),%r13
   14012e8e5:	mov    %rcx,(%rdx)
   14012e8e8:	jmp    140128707 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4157>
   14012e8ed:	mov    0x1048(%rbx),%r11
   14012e8f4:	lea    0x8(%r13),%rax
   14012e8f8:	cmp    0x30(%rsp),%rax
   14012e8fd:	jae    140134bd9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10629>
   14012e903:	mov    0x1050(%rbx),%rax
   14012e90a:	vzeroupper
   14012e90d:	mov    0x1c8(%rsp),%rcx
   14012e915:	mov    %r13,%rdx
   14012e918:	lea    0x8(%r13),%r13
   14012e91c:	mov    %rcx,(%rdx)
   14012e91f:	jmp    14012a3b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5e04>
   14012e924:	mov    0x1048(%rbx),%r11
   14012e92b:	lea    0x8(%r13),%rax
   14012e92f:	cmp    0x30(%rsp),%rax
   14012e934:	jae    1401347cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1021d>
   14012e93a:	mov    0x1050(%rbx),%rax
   14012e941:	vzeroupper
   14012e944:	mov    0x1c8(%rsp),%rcx
   14012e94c:	mov    %r13,%rdx
   14012e94f:	lea    0x8(%r13),%r13
   14012e953:	mov    %rcx,(%rdx)
   14012e956:	jmp    14012a70c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x615c>
   14012e95b:	mov    0x1048(%rbx),%r11
   14012e962:	lea    0x8(%r13),%rax
   14012e966:	cmp    0x30(%rsp),%rax
   14012e96b:	jae    140134c20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10670>
   14012e971:	mov    0x1050(%rbx),%rax
   14012e978:	vzeroupper
   14012e97b:	mov    0x1c8(%rsp),%rcx
   14012e983:	mov    %r13,%rdx
   14012e986:	lea    0x8(%r13),%r13
   14012e98a:	mov    %rcx,(%rdx)
   14012e98d:	jmp    1401275cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x301b>
   14012e992:	mov    0x1048(%rbx),%r11
   14012e999:	lea    0x8(%r13),%rax
   14012e99d:	cmp    0x30(%rsp),%rax
   14012e9a2:	jae    140135fb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a04>
   14012e9a8:	mov    0x1050(%rbx),%rax
   14012e9af:	vzeroupper
   14012e9b2:	mov    0x1c8(%rsp),%rcx
   14012e9ba:	mov    %r13,%rdx
   14012e9bd:	lea    0x8(%r13),%r13
   14012e9c1:	mov    %rcx,(%rdx)
   14012e9c4:	jmp    14012784d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x329d>
   14012e9c9:	mov    0x1068(%rbx),%rdx
   14012e9d0:	mov    0x1c8(%rsp),%rcx
   14012e9d8:	xor    %esi,%esi
   14012e9da:	mov    %rcx,(%rdx,%rbp,8)
   14012e9de:	mov    0x1d0(%rsp),%rcx
   14012e9e6:	mov    %r13,%rdx
   14012e9e9:	lea    0x8(%r13),%r13
   14012e9ed:	mov    %rcx,(%rdx)
   14012e9f0:	jmp    14012739a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2dea>
   14012e9f5:	mov    0x1048(%rbx),%r11
   14012e9fc:	lea    0x8(%r13),%rax
   14012ea00:	cmp    0x30(%rsp),%rax
   14012ea05:	jae    1401345d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10020>
   14012ea0b:	mov    0x1050(%rbx),%rax
   14012ea12:	vzeroupper
   14012ea15:	mov    0x1c8(%rsp),%rcx
   14012ea1d:	mov    %r13,%rdx
   14012ea20:	lea    0x8(%r13),%r13
   14012ea24:	mov    %rcx,(%rdx)
   14012ea27:	jmp    140127ba5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x35f5>
   14012ea2c:	mov    0x1048(%rbx),%r11
   14012ea33:	lea    0x8(%r13),%rax
   14012ea37:	cmp    0x30(%rsp),%rax
   14012ea3c:	jae    140135054 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10aa4>
   14012ea42:	mov    0x1050(%rbx),%rax
   14012ea49:	vzeroupper
   14012ea4c:	mov    0x1c8(%rsp),%rcx
   14012ea54:	mov    %r13,%rdx
   14012ea57:	lea    0x8(%r13),%r13
   14012ea5b:	mov    %rcx,(%rdx)
   14012ea5e:	jmp    140127acf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x351f>
   14012ea63:	lea    0x8(%r13),%rax
   14012ea67:	cmp    0x30(%rsp),%rax
   14012ea6c:	jae    140135ca7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116f7>
   14012ea72:	mov    0x1c8(%rsp),%rdx
   14012ea7a:	mov    %r13,%rax
   14012ea7d:	xor    %esi,%esi
   14012ea7f:	lea    0x8(%r13),%r13
   14012ea83:	mov    %rdx,(%rax)
   14012ea86:	jmp    140127253 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2ca3>
   14012ea8b:	mov    0x1048(%rbx),%r11
   14012ea92:	lea    0x8(%r13),%rax
   14012ea96:	cmp    0x30(%rsp),%rax
   14012ea9b:	jae    140134f78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109c8>
   14012eaa1:	mov    0x1050(%rbx),%rax
   14012eaa8:	vzeroupper
   14012eaab:	mov    0x1c8(%rsp),%rcx
   14012eab3:	mov    %r13,%rdx
   14012eab6:	lea    0x8(%r13),%r13
   14012eaba:	mov    %rcx,(%rdx)
   14012eabd:	jmp    14012a2de <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5d2e>
   14012eac2:	mov    0x1048(%rbx),%r11
   14012eac9:	lea    0x8(%r13),%rax
   14012eacd:	cmp    0x30(%rsp),%rax
   14012ead2:	jae    1401355a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ff4>
   14012ead8:	mov    0x1050(%rbx),%rax
   14012eadf:	vzeroupper
   14012eae2:	mov    0x1c8(%rsp),%rcx
   14012eaea:	mov    %r13,%rdx
   14012eaed:	lea    0x8(%r13),%r13
   14012eaf1:	mov    %rcx,(%rdx)
   14012eaf4:	jmp    140129f86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x59d6>
   14012eaf9:	mov    0x1048(%rbx),%r11
   14012eb00:	lea    0x8(%r13),%rax
   14012eb04:	cmp    0x30(%rsp),%rax
   14012eb09:	jae    1401350e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b34>
   14012eb0f:	mov    0x1050(%rbx),%rax
   14012eb16:	vzeroupper
   14012eb19:	mov    0x1c8(%rsp),%rcx
   14012eb21:	mov    %r13,%rdx
   14012eb24:	lea    0x8(%r13),%r13
   14012eb28:	mov    %rcx,(%rdx)
   14012eb2b:	jmp    14012817f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3bcf>
   14012eb30:	mov    0x1048(%rbx),%r11
   14012eb37:	lea    0x8(%r13),%rax
   14012eb3b:	cmp    0x30(%rsp),%rax
   14012eb40:	jae    1401349eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1043b>
   14012eb46:	mov    0x1050(%rbx),%rax
   14012eb4d:	vzeroupper
   14012eb50:	mov    0x1c8(%rsp),%rcx
   14012eb58:	mov    %r13,%rdx
   14012eb5b:	lea    0x8(%r13),%r13
   14012eb5f:	mov    %rcx,(%rdx)
   14012eb62:	jmp    1401274f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2f45>
   14012eb67:	movb   $0xcc,-0x1(%rdi)
   14012eb6b:	mov    %r11,%rcx
   14012eb6e:	vzeroupper
   14012eb71:	call   14021ca10 <setun::VMValue::as_float() const>
   14012eb76:	mov    0x80(%rsp),%rcx
   14012eb7e:	vmovapd %xmm0,%xmm7
   14012eb82:	call   14021ca10 <setun::VMValue::as_float() const>
   14012eb87:	mov    0x60(%rsp),%rcx
   14012eb8c:	vmovapd %xmm0,%xmm6
   14012eb90:	call   14021ca10 <setun::VMValue::as_float() const>
   14012eb95:	mov    0x1068(%rbx),%rdx
   14012eb9c:	movabs $0xfffc000000000000,%rax
   14012eba6:	vfmadd132sd %xmm6,%xmm0,%xmm7
   14012ebab:	vucomisd %xmm7,%xmm7
   14012ebaf:	vmovq  %xmm7,%rcx
   14012ebb4:	cmovnp %rcx,%rax
   14012ebb8:	mov    0x40(%rsp),%rcx
   14012ebbd:	mov    %rax,(%rdx,%rcx,8)
   14012ebc1:	jmp    14012d8bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x930c>
   14012ebc6:	mov    0x1048(%rbx),%r11
   14012ebcd:	lea    0x8(%r13),%rax
   14012ebd1:	cmp    0x30(%rsp),%rax
   14012ebd6:	jae    140136078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ac8>
   14012ebdc:	mov    0x1050(%rbx),%rax
   14012ebe3:	vzeroupper
   14012ebe6:	mov    0x1c8(%rsp),%rcx
   14012ebee:	mov    %r13,%rdx
   14012ebf1:	lea    0x8(%r13),%r13
   14012ebf5:	mov    %rcx,(%rdx)
   14012ebf8:	jmp    14012a560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5fb0>
   14012ebfd:	mov    0x1048(%rbx),%r11
   14012ec04:	lea    0x8(%r13),%rax
   14012ec08:	cmp    0x30(%rsp),%rax
   14012ec0d:	jae    140135b95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115e5>
   14012ec13:	mov    0x1050(%rbx),%rax
   14012ec1a:	vzeroupper
   14012ec1d:	mov    0x1c8(%rsp),%rcx
   14012ec25:	mov    %r13,%rdx
   14012ec28:	lea    0x8(%r13),%r13
   14012ec2c:	mov    %rcx,(%rdx)
   14012ec2f:	jmp    14012a7e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6232>
   14012ec34:	mov    0x1048(%rbx),%r11
   14012ec3b:	lea    0x8(%r13),%rax
   14012ec3f:	cmp    0x30(%rsp),%rax
   14012ec44:	jae    140135110 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b60>
   14012ec4a:	mov    0x1050(%rbx),%rax
   14012ec51:	vzeroupper
   14012ec54:	mov    0x1c8(%rsp),%rcx
   14012ec5c:	mov    %r13,%rdx
   14012ec5f:	lea    0x8(%r13),%r13
   14012ec63:	mov    %rcx,(%rdx)
   14012ec66:	jmp    140127923 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3373>
   14012ec6b:	mov    0x1048(%rbx),%r11
   14012ec72:	lea    0x8(%r13),%rax
   14012ec76:	cmp    0x30(%rsp),%rax
   14012ec7b:	jae    1401353fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e4a>
   14012ec81:	mov    0x1050(%rbx),%rax
   14012ec88:	vzeroupper
   14012ec8b:	mov    0x1c8(%rsp),%rcx
   14012ec93:	mov    %r13,%rdx
   14012ec96:	lea    0x8(%r13),%r13
   14012ec9a:	mov    %rcx,(%rdx)
   14012ec9d:	jmp    1401279f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3449>
   14012eca2:	mov    0x1048(%rbx),%r11
   14012eca9:	lea    0x8(%r13),%rax
   14012ecad:	cmp    0x30(%rsp),%rax
   14012ecb2:	jae    140134ad8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10528>
   14012ecb8:	mov    0x1050(%rbx),%rax
   14012ecbf:	vzeroupper
   14012ecc2:	mov    0x1c8(%rsp),%rcx
   14012ecca:	mov    %r13,%rdx
   14012eccd:	lea    0x8(%r13),%r13
   14012ecd1:	mov    %rcx,(%rdx)
   14012ecd4:	jmp    1401280a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3af9>
   14012ecd9:	mov    0x1048(%rbx),%r11
   14012ece0:	lea    0x8(%r13),%rax
   14012ece4:	cmp    0x30(%rsp),%rax
   14012ece9:	jae    140134c4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1069c>
   14012ecef:	mov    0x1050(%rbx),%rax
   14012ecf6:	vzeroupper
   14012ecf9:	mov    0x1c8(%rsp),%rcx
   14012ed01:	mov    %r13,%rdx
   14012ed04:	lea    0x8(%r13),%r13
   14012ed08:	mov    %rcx,(%rdx)
   14012ed0b:	jmp    140127c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x36cb>
   14012ed10:	mov    0x1048(%rbx),%r11
   14012ed17:	lea    0x8(%r13),%rax
   14012ed1b:	cmp    0x30(%rsp),%rax
   14012ed20:	jae    140135c2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1167a>
   14012ed26:	mov    0x1050(%rbx),%rax
   14012ed2d:	vzeroupper
   14012ed30:	mov    0x1c8(%rsp),%rcx
   14012ed38:	mov    %r13,%rdx
   14012ed3b:	lea    0x8(%r13),%r13
   14012ed3f:	mov    %rcx,(%rdx)
   14012ed42:	jmp    140127777 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x31c7>
   14012ed47:	mov    0x1048(%rbx),%r11
   14012ed4e:	lea    0x8(%r13),%rax
   14012ed52:	cmp    0x30(%rsp),%rax
   14012ed57:	jae    140135dc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11816>
   14012ed5d:	mov    0x1050(%rbx),%rax
   14012ed64:	vzeroupper
   14012ed67:	mov    0x1c8(%rsp),%rcx
   14012ed6f:	mov    %r13,%rdx
   14012ed72:	lea    0x8(%r13),%r13
   14012ed76:	mov    %rcx,(%rdx)
   14012ed79:	jmp    140129b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x55a8>
   14012ed7e:	mov    0x1048(%rbx),%r11
   14012ed85:	lea    0x8(%r13),%rax
   14012ed89:	cmp    0x30(%rsp),%rax
   14012ed8e:	jae    140134fa4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109f4>
   14012ed94:	mov    0x1050(%rbx),%rax
   14012ed9b:	vzeroupper
   14012ed9e:	mov    0x1c8(%rsp),%rcx
   14012eda6:	mov    %r13,%rdx
   14012eda9:	lea    0x8(%r13),%r13
   14012edad:	mov    %rcx,(%rdx)
   14012edb0:	jmp    1401276a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x30f1>
   14012edb5:	mov    0x1048(%rbx),%r11
   14012edbc:	lea    0x8(%r13),%rax
   14012edc0:	cmp    0x30(%rsp),%rax
   14012edc5:	jae    1401358a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112f0>
   14012edcb:	mov    0x1050(%rbx),%rax
   14012edd2:	vzeroupper
   14012edd5:	mov    0x1c8(%rsp),%rcx
   14012eddd:	mov    %r13,%rdx
   14012ede0:	lea    0x8(%r13),%r13
   14012ede4:	mov    %rcx,(%rdx)
   14012ede7:	jmp    1401299ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x53fc>
   14012edec:	mov    0x1048(%rbx),%r11
   14012edf3:	lea    0x8(%r13),%rax
   14012edf7:	cmp    0x30(%rsp),%rax
   14012edfc:	jae    140134a17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10467>
   14012ee02:	mov    0x1050(%rbx),%rax
   14012ee09:	vzeroupper
   14012ee0c:	mov    0x1c8(%rsp),%rcx
   14012ee14:	mov    %r13,%rdx
   14012ee17:	lea    0x8(%r13),%r13
   14012ee1b:	mov    %rcx,(%rdx)
   14012ee1e:	jmp    140129dda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x582a>
   14012ee23:	mov    0x1048(%rbx),%r11
   14012ee2a:	lea    0x8(%r13),%rax
   14012ee2e:	cmp    0x30(%rsp),%rax
   14012ee33:	jae    140135f31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11981>
   14012ee39:	mov    0x1050(%rbx),%rax
   14012ee40:	vzeroupper
   14012ee43:	mov    0x1c8(%rsp),%rcx
   14012ee4b:	mov    %r13,%rdx
   14012ee4e:	lea    0x8(%r13),%r13
   14012ee52:	mov    %rcx,(%rdx)
   14012ee55:	jmp    140127d51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x37a1>
   14012ee5a:	mov    0x1048(%rbx),%r11
   14012ee61:	lea    0x8(%r13),%rax
   14012ee65:	cmp    0x30(%rsp),%rax
   14012ee6a:	jae    140135b69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115b9>
   14012ee70:	mov    0x1050(%rbx),%rax
   14012ee77:	vzeroupper
   14012ee7a:	mov    0x1c8(%rsp),%rcx
   14012ee82:	mov    %r13,%rdx
   14012ee85:	lea    0x8(%r13),%r13
   14012ee89:	mov    %rcx,(%rdx)
   14012ee8c:	jmp    140129d04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5754>
   14012ee91:	mov    0x1048(%rbx),%r11
   14012ee98:	lea    0x8(%r13),%rax
   14012ee9c:	cmp    0x30(%rsp),%rax
   14012eea1:	jae    1401360a4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11af4>
   14012eea7:	mov    0x1050(%rbx),%rax
   14012eeae:	vzeroupper
   14012eeb1:	mov    0x1c8(%rsp),%rcx
   14012eeb9:	mov    %r13,%rdx
   14012eebc:	lea    0x8(%r13),%r13
   14012eec0:	mov    %rcx,(%rdx)
   14012eec3:	jmp    14012a05c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5aac>
   14012eec8:	mov    0x1048(%rbx),%r11
   14012eecf:	lea    0x8(%r13),%rax
   14012eed3:	cmp    0x30(%rsp),%rax
   14012eed8:	jae    140135a71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114c1>
   14012eede:	mov    0x1050(%rbx),%rax
   14012eee5:	vzeroupper
   14012eee8:	mov    0x1c8(%rsp),%rcx
   14012eef0:	mov    %r13,%rdx
   14012eef3:	lea    0x8(%r13),%r13
   14012eef7:	mov    %rcx,(%rdx)
   14012eefa:	jmp    14012a636 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6086>
   14012eeff:	mov    0x1048(%rbx),%r11
   14012ef06:	lea    0x8(%r13),%rax
   14012ef0a:	cmp    0x30(%rsp),%rax
   14012ef0f:	jae    140135c56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116a6>
   14012ef15:	mov    0x1050(%rbx),%rax
   14012ef1c:	vzeroupper
   14012ef1f:	mov    0x1c8(%rsp),%rcx
   14012ef27:	mov    %r13,%rdx
   14012ef2a:	lea    0x8(%r13),%r13
   14012ef2e:	mov    %rcx,(%rdx)
   14012ef31:	jmp    140127e27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3877>
   14012ef36:	mov    0x1048(%rbx),%r11
   14012ef3d:	lea    0x8(%r13),%rax
   14012ef41:	cmp    0x30(%rsp),%rax
   14012ef46:	jae    140134fd0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a20>
   14012ef4c:	mov    0x1050(%rbx),%rax
   14012ef53:	vzeroupper
   14012ef56:	mov    0x1c8(%rsp),%rcx
   14012ef5e:	mov    %r13,%rdx
   14012ef61:	lea    0x8(%r13),%r13
   14012ef65:	mov    %rcx,(%rdx)
   14012ef68:	jmp    140129c2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x567e>
   14012ef6d:	mov    0x1048(%rbx),%r11
   14012ef74:	lea    0x8(%r13),%rax
   14012ef78:	cmp    0x30(%rsp),%rax
   14012ef7d:	jae    1401358cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1131c>
   14012ef83:	mov    0x1050(%rbx),%rax
   14012ef8a:	vzeroupper
   14012ef8d:	mov    0x1c8(%rsp),%rcx
   14012ef95:	mov    %r13,%rdx
   14012ef98:	lea    0x8(%r13),%r13
   14012ef9c:	mov    %rcx,(%rdx)
   14012ef9f:	jmp    140129800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5250>
   14012efa4:	mov    0x1048(%rbx),%r11
   14012efab:	lea    0x8(%r13),%rax
   14012efaf:	cmp    0x30(%rsp),%rax
   14012efb4:	jae    140134ffc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a4c>
   14012efba:	mov    0x1050(%rbx),%rax
   14012efc1:	vzeroupper
   14012efc4:	mov    0x1c8(%rsp),%rcx
   14012efcc:	mov    %r13,%rdx
   14012efcf:	lea    0x8(%r13),%r13
   14012efd3:	mov    %rcx,(%rdx)
   14012efd6:	jmp    14012a132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5b82>
   14012efdb:	mov    0x1048(%rbx),%r11
   14012efe2:	lea    0x8(%r13),%rax
   14012efe6:	cmp    0x30(%rsp),%rax
   14012efeb:	jae    14013604c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a9c>
   14012eff1:	mov    0x1050(%rbx),%rax
   14012eff8:	vzeroupper
   14012effb:	mov    0x1c8(%rsp),%rcx
   14012f003:	mov    %r13,%rdx
   14012f006:	lea    0x8(%r13),%r13
   14012f00a:	mov    %rcx,(%rdx)
   14012f00d:	jmp    140129a82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x54d2>
   14012f012:	mov    0x1048(%rbx),%r11
   14012f019:	lea    0x8(%r13),%rax
   14012f01d:	cmp    0x30(%rsp),%rax
   14012f022:	jae    140135028 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a78>
   14012f028:	mov    0x1050(%rbx),%rax
   14012f02f:	vzeroupper
   14012f032:	mov    0x1c8(%rsp),%rcx
   14012f03a:	mov    %r13,%rdx
   14012f03d:	lea    0x8(%r13),%r13
   14012f041:	mov    %rcx,(%rdx)
   14012f044:	jmp    140129eb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5900>
   14012f049:	mov    0x1048(%rbx),%r11
   14012f050:	lea    0x8(%r13),%rax
   14012f054:	cmp    0x30(%rsp),%rax
   14012f059:	jae    1401358f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11348>
   14012f05f:	mov    0x1050(%rbx),%rax
   14012f066:	vzeroupper
   14012f069:	mov    0x1c8(%rsp),%rcx
   14012f071:	mov    %r13,%rdx
   14012f074:	lea    0x8(%r13),%r13
   14012f078:	mov    %rcx,(%rdx)
   14012f07b:	jmp    1401298d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5326>
   14012f080:	mov    0x1048(%rbx),%r11
   14012f087:	lea    0x8(%r13),%rax
   14012f08b:	cmp    0x30(%rsp),%rax
   14012f090:	jae    140135e61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118b1>
   14012f096:	mov    0x1050(%rbx),%rax
   14012f09d:	vzeroupper
   14012f0a0:	mov    0x1c8(%rsp),%rcx
   14012f0a8:	mov    %r13,%rdx
   14012f0ab:	lea    0x8(%r13),%r13
   14012f0af:	mov    %rcx,(%rdx)
   14012f0b2:	jmp    14012a208 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5c58>
   14012f0b7:	mov    %r8,%r10
   14012f0ba:	shr    $0x20,%r10
   14012f0be:	cmp    $0x5,%r10w
   14012f0c3:	jne    14012c097 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ae7>
   14012f0c9:	and    %rdx,%rcx
   14012f0cc:	cmp    %rax,%rcx
   14012f0cf:	je     140126c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26cf>
   14012f0d5:	cmp    %r9,%rcx
   14012f0d8:	jne    14012c097 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7ae7>
   14012f0de:	mov    %rdx,%rax
   14012f0e1:	shr    $0x20,%rax
   14012f0e5:	cmp    $0x5,%ax
   14012f0e9:	je     140126c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26cf>
   14012f0ef:	mov    $0xffffffff,%eax
   14012f0f4:	shl    $0x20,%rax
   14012f0f8:	and    %r8,%rax
   14012f0fb:	cmp    %rcx,%rax
   14012f0fe:	je     14013244f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde9f>
   14012f104:	shr    $0x20,%rdx
   14012f108:	mov    %edx,%ecx
   14012f10a:	test   %dx,%dx
   14012f10d:	je     14013244f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde9f>
   14012f113:	movabs $0xfffd000100000000,%rdx
   14012f11d:	cmp    %rdx,%rax
   14012f120:	je     14012c106 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b56>
   14012f126:	cmp    $0x1,%cx
   14012f12a:	jne    140126c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26cf>
   14012f130:	jmp    14012c106 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7b56>
   14012f135:	nopl   (%rax)
   14012f138:	mov    %r8,%r10
   14012f13b:	shr    $0x20,%r10
   14012f13f:	cmp    $0x5,%r10w
   14012f144:	jne    14012c578 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fc8>
   14012f14a:	and    %rdx,%rcx
   14012f14d:	cmp    %rax,%rcx
   14012f150:	je     140126b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259c>
   14012f156:	cmp    %r9,%rcx
   14012f159:	jne    14012c578 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7fc8>
   14012f15f:	mov    %rdx,%rax
   14012f162:	shr    $0x20,%rax
   14012f166:	cmp    $0x5,%ax
   14012f16a:	je     140126b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259c>
   14012f170:	mov    $0xffffffff,%eax
   14012f175:	shl    $0x20,%rax
   14012f179:	and    %r8,%rax
   14012f17c:	cmp    %rcx,%rax
   14012f17f:	je     140132632 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe082>
   14012f185:	shr    $0x20,%rdx
   14012f189:	mov    %edx,%ecx
   14012f18b:	test   %dx,%dx
   14012f18e:	je     140132632 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe082>
   14012f194:	movabs $0xfffd000100000000,%rdx
   14012f19e:	cmp    %rdx,%rax
   14012f1a1:	je     14012c5e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8037>
   14012f1a7:	cmp    $0x1,%cx
   14012f1ab:	jne    140126b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259c>
   14012f1b1:	jmp    14012c5e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8037>
   14012f1b6:	cs nopw 0x0(%rax,%rax,1)
   14012f1c0:	mov    %r8,%r10
   14012f1c3:	shr    $0x20,%r10
   14012f1c7:	cmp    $0x5,%r10w
   14012f1cc:	jne    14012bc32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7682>
   14012f1d2:	and    %rdx,%rcx
   14012f1d5:	cmp    %rax,%rcx
   14012f1d8:	je     1401268e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2336>
   14012f1de:	cmp    %r9,%rcx
   14012f1e1:	jne    14012bc32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7682>
   14012f1e7:	mov    %rdx,%rax
   14012f1ea:	shr    $0x20,%rax
   14012f1ee:	cmp    $0x5,%ax
   14012f1f2:	je     1401268e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2336>
   14012f1f8:	mov    $0xffffffff,%eax
   14012f1fd:	shl    $0x20,%rax
   14012f201:	and    %r8,%rax
   14012f204:	cmp    %rcx,%rax
   14012f207:	je     140131955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3a5>
   14012f20d:	shr    $0x20,%rdx
   14012f211:	mov    %edx,%ecx
   14012f213:	test   %dx,%dx
   14012f216:	je     140131955 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd3a5>
   14012f21c:	movabs $0xfffd000100000000,%rdx
   14012f226:	cmp    %rdx,%rax
   14012f229:	je     14012bca1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76f1>
   14012f22f:	cmp    $0x1,%cx
   14012f233:	jne    1401268e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2336>
   14012f239:	jmp    14012bca1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x76f1>
   14012f23e:	xchg   %ax,%ax
   14012f240:	vzeroupper
   14012f243:	mov    0x1048(%rbx),%r11
   14012f24a:	cmp    $0x2,%sil
   14012f24e:	jne    14012b0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b26>
   14012f254:	jmp    1401251ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   14012f259:	vzeroupper
   14012f25c:	jmp    1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012f261:	mov    %r8,%r10
   14012f264:	shr    $0x20,%r10
   14012f268:	cmp    $0x5,%r10w
   14012f26d:	jne    14012bd0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x775f>
   14012f273:	and    %rdx,%rcx
   14012f276:	cmp    %rax,%rcx
   14012f279:	je     140126a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2469>
   14012f27f:	cmp    %r9,%rcx
   14012f282:	jne    14012bd0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x775f>
   14012f288:	mov    %rdx,%rax
   14012f28b:	shr    $0x20,%rax
   14012f28f:	cmp    $0x5,%ax
   14012f293:	je     140126a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2469>
   14012f299:	mov    $0xffffffff,%eax
   14012f29e:	shl    $0x20,%rax
   14012f2a2:	and    %r8,%rax
   14012f2a5:	cmp    %rcx,%rax
   14012f2a8:	je     140132552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfa2>
   14012f2ae:	shr    $0x20,%rdx
   14012f2b2:	mov    %edx,%ecx
   14012f2b4:	test   %dx,%dx
   14012f2b7:	je     140132552 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdfa2>
   14012f2bd:	movabs $0xfffd000100000000,%rdx
   14012f2c7:	cmp    %rdx,%rax
   14012f2ca:	je     14012bd7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77ce>
   14012f2d0:	cmp    $0x1,%cx
   14012f2d4:	jne    140126a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2469>
   14012f2da:	jmp    14012bd7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x77ce>
   14012f2df:	nop
   14012f2e0:	mov    %r8,%r10
   14012f2e3:	shr    $0x20,%r10
   14012f2e7:	cmp    $0x5,%r10w
   14012f2ec:	jne    14012bfb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   14012f2f2:	and    %rcx,%rdx
   14012f2f5:	cmp    %rax,%rdx
   14012f2f8:	je     14012667e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ce>
   14012f2fe:	cmp    %r9,%rdx
   14012f301:	jne    14012bfb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a07>
   14012f307:	mov    %rcx,%rax
   14012f30a:	shr    $0x20,%rax
   14012f30e:	cmp    $0x5,%ax
   14012f312:	je     14012667e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ce>
   14012f318:	mov    $0xffffffff,%eax
   14012f31d:	shl    $0x20,%rax
   14012f321:	and    %r8,%rax
   14012f324:	cmp    %rdx,%rax
   14012f327:	je     140131eec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd93c>
   14012f32d:	shr    $0x20,%rcx
   14012f331:	mov    %ecx,%edx
   14012f333:	test   %cx,%cx
   14012f336:	je     140131eec <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd93c>
   14012f33c:	movabs $0xfffd000100000000,%rcx
   14012f346:	cmp    %rcx,%rax
   14012f349:	je     14012c026 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a76>
   14012f34f:	cmp    $0x1,%dx
   14012f353:	jne    14012667e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ce>
   14012f359:	jmp    14012c026 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7a76>
   14012f35e:	xchg   %ax,%ax
   14012f360:	mov    0x1048(%rbx),%r11
   14012f367:	vzeroupper
   14012f36a:	jmp    14012b08f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6adf>
   14012f36f:	test   %sil,%sil
   14012f372:	je     1401297a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51f2>
   14012f378:	cmp    $0x1,%sil
   14012f37c:	je     14012d9f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9442>
   14012f382:	lea    0x8(%r13),%rax
   14012f386:	cmp    0x30(%rsp),%rax
   14012f38b:	jae    140134700 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10150>
   14012f391:	mov    0x1d0(%rsp),%rdx
   14012f399:	mov    %r13,%rax
   14012f39c:	lea    0x8(%r13),%r13
   14012f3a0:	mov    %rdx,(%rax)
   14012f3a3:	jmp    14012d9f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9442>
   14012f3a8:	mov    0xb0(%r14),%rdx
   14012f3af:	jmp    14012db21 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9571>
   14012f3b4:	mov    0x1c8(%rsp),%rax
   14012f3bc:	mov    $0x2,%esi
   14012f3c1:	movabs $0xfff9000000000000,%rdx
   14012f3cb:	mov    %rax,0x1d0(%rsp)
   14012f3d3:	movzwl %di,%eax
   14012f3d6:	or     %rdx,%rax
   14012f3d9:	jmp    1401258d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1322>
   14012f3de:	mov    0x1c8(%rsp),%rax
   14012f3e6:	mov    $0x2,%esi
   14012f3eb:	mov    %rax,0x1d0(%rsp)
   14012f3f3:	mov    0x1068(%rbx),%rax
   14012f3fa:	mov    0x10(%rax,%rbp,8),%rax
   14012f3ff:	mov    %rax,0x1c8(%rsp)
   14012f407:	jmp    14012afa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69f5>
   14012f40c:	mov    0x1c8(%rsp),%rax
   14012f414:	mov    $0x2,%esi
   14012f419:	mov    %rax,0x1d0(%rsp)
   14012f421:	jmp    140125af4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1544>
   14012f426:	mov    0x1c8(%rsp),%rax
   14012f42e:	mov    $0x2,%esi
   14012f433:	mov    %rax,0x1d0(%rsp)
   14012f43b:	mov    0x1068(%rbx),%rax
   14012f442:	mov    (%rax,%rdi,8),%rax
   14012f446:	mov    %rax,0x1c8(%rsp)
   14012f44e:	jmp    140125b96 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15e6>
   14012f453:	cmp    $0x1,%sil
   14012f457:	je     14012e885 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2d5>
   14012f45d:	movzbl %dil,%edx
   14012f461:	mov    $0x1,%eax
   14012f466:	sub    %rdx,%rax
   14012f469:	mov    0x0(%r13,%rax,8),%rdx
   14012f46e:	jmp    14012b186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bd6>
   14012f473:	lea    0x1d0(%rsp),%rax
   14012f47b:	cmp    $0x2,%sil
   14012f47f:	je     14012f491 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaee1>
   14012f481:	lea    -0x8(%r13),%rdx
   14012f485:	lea    -0x10(%r13),%rax
   14012f489:	cmp    $0x1,%sil
   14012f48d:	cmove  %rdx,%rax
   14012f491:	mov    (%rax),%rdx
   14012f494:	jmp    14012b186 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bd6>
   14012f499:	mov    0x1c8(%rsp),%rax
   14012f4a1:	mov    $0x2,%esi
   14012f4a6:	mov    %rax,0x1d0(%rsp)
   14012f4ae:	mov    0x1068(%rbx),%rax
   14012f4b5:	mov    0x18(%rax,%rbp,8),%rax
   14012f4ba:	mov    %rax,0x1c8(%rsp)
   14012f4c2:	jmp    14012b01f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a6f>
   14012f4c7:	mov    0x1c8(%rsp),%rax
   14012f4cf:	test   %dil,%dil
   14012f4d2:	mov    $0x2,%esi
   14012f4d7:	movabs $0xfffa000000000001,%rdx
   14012f4e1:	mov    %rax,0x1d0(%rsp)
   14012f4e9:	movabs $0xfffa000000000000,%rax
   14012f4f3:	cmovne %rdx,%rax
   14012f4f7:	jmp    140125a58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a8>
   14012f4fc:	mov    %rcx,%rdx
   14012f4ff:	lea    0x1048(%rbx),%rcx
   14012f506:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14012f50b:	mov    0x1048(%rbx),%r11
   14012f512:	mov    0x1050(%rbx),%rax
   14012f519:	jmp    14012dd27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9777>
   14012f51e:	mov    0x1c8(%rsp),%rax
   14012f526:	mov    $0x2,%esi
   14012f52b:	mov    %rax,0x1d0(%rsp)
   14012f533:	mov    0x1080(%rbx),%rax
   14012f53a:	mov    (%rax,%rdi,8),%rax
   14012f53e:	mov    %rax,0x1c8(%rsp)
   14012f546:	jmp    140125cab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16fb>
   14012f54b:	mov    0x1c8(%rsp),%rax
   14012f553:	mov    $0x2,%esi
   14012f558:	mov    %rax,0x1d0(%rsp)
   14012f560:	mov    0x1068(%rbx),%rax
   14012f567:	mov    (%rax,%rbp,8),%rax
   14012f56b:	mov    %rax,0x1c8(%rsp)
   14012f573:	jmp    14012aeb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6901>
   14012f578:	mov    0x1c8(%rsp),%rax
   14012f580:	mov    $0x2,%esi
   14012f585:	mov    %rax,0x1d0(%rsp)
   14012f58d:	mov    0x1068(%rbx),%rax
   14012f594:	mov    0x8(%rax,%rbp,8),%rax
   14012f599:	mov    %rax,0x1c8(%rsp)
   14012f5a1:	jmp    14012af2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x697b>
   14012f5a6:	mov    0x1c8(%rsp),%rax
   14012f5ae:	mov    %rax,0x1d0(%rsp)
   14012f5b6:	mov    0x60(%rsp),%rax
   14012f5bb:	mov    %rax,0x710(%rsp)
   14012f5c3:	lock addl $0x1,0x8(%rdi)
   14012f5c8:	lea    0x710(%rsp),%rdx
   14012f5d0:	lea    0x540(%rsp),%rcx
   14012f5d8:	mov    %rdi,0x718(%rsp)
   14012f5e0:	call   14020fb80 <setun::VMValue::VMValue(std::shared_ptr<setun::ArrayObject>)>
   14012f5e5:	jmp    14012dd99 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x97e9>
   14012f5ea:	vmovq  %rdi,%xmm0
   14012f5ef:	mov    0x1c8(%rsp),%rax
   14012f5f7:	mov    $0x2,%esi
   14012f5fc:	vucomisd %xmm0,%xmm0
   14012f600:	mov    %rax,0x1d0(%rsp)
   14012f608:	movabs $0xfffc000000000000,%rax
   14012f612:	cmovnp %rdi,%rax
   14012f616:	jmp    1401259fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144a>
   14012f61b:	sub    $0x1,%sil
   14012f61f:	jne    14012dbf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9645>
   14012f625:	mov    0x1048(%rbx),%r11
   14012f62c:	lea    0x8(%r13),%rax
   14012f630:	cmp    0x30(%rsp),%rax
   14012f635:	jae    14013513c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b8c>
   14012f63b:	mov    0x1c8(%rsp),%rdx
   14012f643:	mov    %r13,%rax
   14012f646:	lea    0x8(%r13),%r13
   14012f64a:	mov    %rdx,(%rax)
   14012f64d:	jmp    14012dbfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   14012f652:	mov    %rdi,%rcx
   14012f655:	mov    %rax,0x40(%rsp)
   14012f65a:	call   140147900 <setun::ArrayObject::size() const>
   14012f65f:	mov    0x40(%rsp),%r8
   14012f664:	add    %rax,%r8
   14012f667:	jns    1401302bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd0f>
   14012f66d:	test   %sil,%sil
   14012f670:	je     14012e05c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9aac>
   14012f676:	cmp    $0x1,%sil
   14012f67a:	je     140128c59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46a9>
   14012f680:	lea    0x8(%r13),%rax
   14012f684:	cmp    0x30(%rsp),%rax
   14012f689:	jb     140128c47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4697>
   14012f68f:	mov    0x1050(%rbx),%rax
   14012f696:	mov    0x1048(%rbx),%r11
   14012f69d:	mov    %rax,%rdx
   14012f6a0:	sub    %r11,%r13
   14012f6a3:	sub    %r11,%rdx
   14012f6a6:	sar    $0x3,%rdx
   14012f6aa:	lea    (%rdx,%rdx,1),%rcx
   14012f6ae:	cmp    %rcx,%rdx
   14012f6b1:	jb     140136d9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127eb>
   14012f6b7:	mov    %rax,0x30(%rsp)
   14012f6bc:	add    %r11,%r13
   14012f6bf:	jmp    140128c47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4697>
   14012f6c4:	mov    0x1c8(%rsp),%rax
   14012f6cc:	mov    %edi,0x720(%rsp)
   14012f6d3:	lea    0x1a0(%rsp),%rdx
   14012f6db:	lea    0x540(%rsp),%rcx
   14012f6e3:	movl   $0x0,0x724(%rsp)
   14012f6ee:	mov    $0x2,%esi
   14012f6f3:	mov    %rax,0x1d0(%rsp)
   14012f6fb:	mov    0x720(%rsp),%rax
   14012f703:	vmovdqa %xmm0,0x710(%rsp)
   14012f70c:	mov    %rax,0x1b0(%rsp)
   14012f714:	vmovdqa %xmm0,0x1a0(%rsp)
   14012f71d:	vzeroupper
   14012f720:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   14012f725:	mov    0x540(%rsp),%rax
   14012f72d:	mov    %rax,0x1c8(%rsp)
   14012f735:	jmp    1401259ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fb>
   14012f73a:	mov    0x1c8(%rsp),%rax
   14012f742:	lea    0x710(%rsp),%rcx
   14012f74a:	mov    %rdi,%rdx
   14012f74d:	mov    $0x2,%esi
   14012f752:	mov    %rax,0x1d0(%rsp)
   14012f75a:	vzeroupper
   14012f75d:	call   140210640 <setun::VMValue::VMValue(long long)>
   14012f762:	mov    0x710(%rsp),%rax
   14012f76a:	mov    %rax,0x1c8(%rsp)
   14012f772:	jmp    140125853 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a3>
   14012f777:	cmp    %rax,%rdi
   14012f77a:	jle    1401327e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe238>
   14012f780:	test   %rdi,%rdi
   14012f783:	setne  %al
   14012f786:	movabs $0xfffa000000000000,%rdx
   14012f790:	movzbl %al,%eax
   14012f793:	add    %rdx,%rax
   14012f796:	mov    %rax,0x1c8(%rsp)
   14012f79e:	jmp    140126589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fd9>
   14012f7a3:	cmp    %rax,%rdi
   14012f7a6:	jge    1401327f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe243>
   14012f7ac:	test   %rdi,%rdi
   14012f7af:	setne  %al
   14012f7b2:	movabs $0xfffa000000000000,%rdx
   14012f7bc:	movzbl %al,%eax
   14012f7bf:	add    %rdx,%rax
   14012f7c2:	mov    %rax,0x1c8(%rsp)
   14012f7ca:	jmp    140126469 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1eb9>
   14012f7cf:	lea    0x710(%rsp),%rcx
   14012f7d7:	lea    0x308(%rsp),%rdx
   14012f7df:	vzeroupper
   14012f7e2:	call   14021c8d0 <setun::VMValue::as_array() const>
   14012f7e7:	mov    0x718(%rsp),%rax
   14012f7ef:	mov    0x710(%rsp),%rdi
   14012f7f7:	mov    %rax,0x40(%rsp)
   14012f7fc:	test   %rdi,%rdi
   14012f7ff:	je     14012f811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb261>
   14012f801:	mov    %rdi,%rcx
   14012f804:	call   1401479e0 <setun::ArrayObject::empty() const>
   14012f809:	test   %al,%al
   14012f80b:	je     140134621 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10071>
   14012f811:	test   %sil,%sil
   14012f814:	jne    140132d4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe79e>
   14012f81a:	movabs $0xfff8000000000000,%rax
   14012f824:	mov    %rax,0x1c8(%rsp)
   14012f82c:	mov    $0x1,%esi
   14012f831:	mov    0x40(%rsp),%rax
   14012f836:	test   %rax,%rax
   14012f839:	je     14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   14012f83f:	mov    %rax,%rcx
   14012f842:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012f847:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   14012f84c:	mov    0x348(%rsp),%rax
   14012f854:	and    %rdx,%rax
   14012f857:	mov    %rax,0x40(%rsp)
   14012f85c:	mov    %rax,%rdi
   14012f85f:	movabs $0xfff8000000000000,%rax
   14012f869:	cmp    %rax,%rdi
   14012f86c:	jne    14012fc1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb66a>
   14012f872:	lea    0x350(%rsp),%r10
   14012f87a:	mov    %r8,0x350(%rsp)
   14012f882:	mov    %r8,0x80(%rsp)
   14012f88a:	mov    %r10,%rcx
   14012f88d:	mov    %r10,0x60(%rsp)
   14012f892:	vzeroupper
   14012f895:	call   14021c730 <setun::VMValue::payload() const>
   14012f89a:	mov    0x60(%rsp),%r10
   14012f89f:	mov    0x80(%rsp),%r8
   14012f8a7:	mov    0x58(%rax),%rdi
   14012f8ab:	test   %rdi,%rdi
   14012f8ae:	je     14012fc25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb675>
   14012f8b4:	mov    0x348(%rsp),%r9
   14012f8bc:	shl    $0x10,%r9
   14012f8c0:	sar    $0x10,%r9
   14012f8c4:	js     14012fc25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb675>
   14012f8ca:	mov    %rdi,%rcx
   14012f8cd:	mov    %r10,0x80(%rsp)
   14012f8d5:	mov    %r8,0x60(%rsp)
   14012f8da:	mov    %r9,0xa0(%rsp)
   14012f8e2:	call   140147900 <setun::ArrayObject::size() const>
   14012f8e7:	mov    0xa0(%rsp),%r9
   14012f8ef:	mov    0x60(%rsp),%r8
   14012f8f4:	mov    0x80(%rsp),%r10
   14012f8fc:	cmp    %rax,%r9
   14012f8ff:	jae    14012fc25 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb675>
   14012f905:	movzbl (%rdi),%eax
   14012f908:	cmp    $0x3,%al
   14012f90a:	je     140136607 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12057>
   14012f910:	ja     14013657d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fcd>
   14012f916:	movabs $0xffff000000000000,%rdx
   14012f920:	cmp    $0x1,%al
   14012f922:	je     1401367f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12244>
   14012f928:	cmp    $0x2,%al
   14012f92a:	jne    140135924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11374>
   14012f930:	mov    0x340(%rsp),%rax
   14012f938:	mov    $0xffff,%edx
   14012f93d:	mov    $0x1fff,%ecx
   14012f942:	shl    $0x30,%rdx
   14012f946:	shl    $0x33,%rcx
   14012f94a:	and    %rax,%rdx
   14012f94d:	cmp    %rcx,%rdx
   14012f950:	je     140137a86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134d6>
   14012f956:	lea    0x340(%rsp),%r8
   14012f95e:	mov    %r9,%rdx
   14012f961:	mov    %rdi,%rcx
   14012f964:	call   14014aee0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012f969:	cmpb   $0x0,0x1040(%rbx)
   14012f970:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   14012f976:	mov    %r12,%rax
   14012f979:	lea    0x291720(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012f980:	lea    0x1(%r12),%r12
   14012f985:	movzbl (%rax),%eax
   14012f988:	jmp    *(%rdi,%rax,8)
   14012f98b:	mov    %rdx,0x328(%rsp)
   14012f993:	lea    0x710(%rsp),%rcx
   14012f99b:	lea    0x328(%rsp),%rdx
   14012f9a3:	vzeroupper
   14012f9a6:	call   14021c8d0 <setun::VMValue::as_array() const>
   14012f9ab:	mov    0x718(%rsp),%rax
   14012f9b3:	mov    %rax,0x60(%rsp)
   14012f9b8:	mov    0x710(%rsp),%rax
   14012f9c0:	mov    %rax,0x40(%rsp)
   14012f9c5:	test   %rax,%rax
   14012f9c8:	je     14012f9f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb446>
   14012f9ca:	lea    0x320(%rsp),%rcx
   14012f9d2:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012f9d7:	mov    %rax,%rdi
   14012f9da:	test   %rax,%rax
   14012f9dd:	js     140133fd9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa29>
   14012f9e3:	mov    0x40(%rsp),%rcx
   14012f9e8:	call   140147900 <setun::ArrayObject::size() const>
   14012f9ed:	cmp    %rax,%rdi
   14012f9f0:	jb     1401346c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10111>
   14012f9f6:	mov    0x60(%rsp),%rax
   14012f9fb:	test   %rax,%rax
   14012f9fe:	je     14012ae38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6888>
   14012fa04:	mov    %rax,%rcx
   14012fa07:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   14012fa0c:	jmp    14012ae38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6888>
   14012fa11:	movzwl %r10w,%r8d
   14012fa15:	add    %rbp,%r8
   14012fa18:	lea    (%rax,%r8,8),%r10
   14012fa1c:	and    (%r10),%rdx
   14012fa1f:	mov    %r10,0xc0(%rsp)
   14012fa27:	cmp    %rcx,%rdx
   14012fa2a:	jne    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   14012fa30:	movzwl %r11w,%edx
   14012fa34:	add    %rbp,%rdx
   14012fa37:	lea    (%rax,%rdx,8),%rcx
   14012fa3b:	movzwl 0x60(%rsp),%edx
   14012fa40:	mov    %rcx,0xe0(%rsp)
   14012fa48:	add    %rbp,%rdx
   14012fa4b:	lea    (%rax,%rdx,8),%r10
   14012fa4f:	movzwl 0x40(%rsp),%edx
   14012fa54:	mov    %r10,0xa0(%rsp)
   14012fa5c:	add    %rbp,%rdx
   14012fa5f:	lea    (%rax,%rdx,8),%r8
   14012fa63:	mov    (%rcx),%rdx
   14012fa66:	mov    $0xffff,%eax
   14012fa6b:	shl    $0x30,%rax
   14012fa6f:	mov    %r8,0x60(%rsp)
   14012fa74:	and    %rax,%rdx
   14012fa77:	mov    %rdx,%rcx
   14012fa7a:	mov    $0x1fff,%edx
   14012fa7f:	shl    $0x33,%rdx
   14012fa83:	cmp    %rdx,%rcx
   14012fa86:	jne    140137a7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134ce>
   14012fa8c:	mov    (%r8),%rdx
   14012fa8f:	and    %rax,%rdx
   14012fa92:	cmp    %rcx,%rdx
   14012fa95:	jne    140137a7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134ce>
   14012fa9b:	and    (%r10),%rax
   14012fa9e:	cmp    %rdx,%rax
   14012faa1:	jne    140137a7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134ce>
   14012faa7:	mov    %r9,0x80(%rsp)
   14012faaf:	mov    %r9,%rcx
   14012fab2:	vzeroupper
   14012fab5:	call   14021c730 <setun::VMValue::payload() const>
   14012faba:	mov    0x58(%rax),%rcx
   14012fabe:	mov    %rcx,0x40(%rsp)
   14012fac3:	mov    0xc0(%rsp),%rcx
   14012facb:	call   14021c730 <setun::VMValue::payload() const>
   14012fad0:	mov    0x40(%rsp),%rcx
   14012fad5:	mov    0x80(%rsp),%r9
   14012fadd:	mov    0x58(%rax),%r8
   14012fae1:	test   %rcx,%rcx
   14012fae4:	je     140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012faea:	test   %r8,%r8
   14012faed:	je     140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012faf3:	cmpb   $0x1,(%rcx)
   14012faf6:	jne    140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fafc:	cmpb   $0x1,(%r8)
   14012fb00:	jne    140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fb06:	mov    0xe0(%rsp),%rax
   14012fb0e:	mov    (%rax),%r11
   14012fb11:	mov    %r11,%rax
   14012fb14:	mov    %r11,0x40(%rsp)
   14012fb19:	shl    $0x10,%rax
   14012fb1d:	sar    $0x10,%rax
   14012fb21:	mov    %rax,0x100(%rsp)
   14012fb29:	js     140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fb2f:	mov    0x60(%rsp),%rdx
   14012fb34:	mov    %r9,0x120(%rsp)
   14012fb3c:	mov    %rcx,0x40(%rsp)
   14012fb41:	mov    (%rdx),%r9
   14012fb44:	mov    %r8,0x160(%rsp)
   14012fb4c:	shl    $0x10,%r9
   14012fb50:	mov    %r9,%rax
   14012fb53:	sar    $0x10,%rax
   14012fb57:	mov    %rax,0x80(%rsp)
   14012fb5f:	call   140147900 <setun::ArrayObject::size() const>
   14012fb64:	cmp    %rax,0x100(%rsp)
   14012fb6c:	mov    0x120(%rsp),%r9
   14012fb74:	jae    140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fb7a:	cmpq   $0x0,0x80(%rsp)
   14012fb83:	js     140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fb89:	mov    0x160(%rsp),%r8
   14012fb91:	mov    %r9,0x140(%rsp)
   14012fb99:	mov    %r8,%rcx
   14012fb9c:	mov    %r8,0x120(%rsp)
   14012fba4:	call   140147900 <setun::ArrayObject::size() const>
   14012fba9:	mov    0x80(%rsp),%r10
   14012fbb1:	mov    0x140(%rsp),%r9
   14012fbb9:	cmp    %rax,%r10
   14012fbbc:	jae    140136673 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120c3>
   14012fbc2:	mov    0xa0(%rsp),%rax
   14012fbca:	mov    0x40(%rsp),%rcx
   14012fbcf:	mov    0x120(%rsp),%r8
   14012fbd7:	mov    (%rax),%rax
   14012fbda:	mov    0x20(%rcx),%rdx
   14012fbde:	mov    0x20(%r8),%rcx
   14012fbe2:	shl    $0x10,%rax
   14012fbe6:	sar    $0x10,%rax
   14012fbea:	imul   (%rcx,%r10,8),%rax
   14012fbef:	mov    0x100(%rsp),%rcx
   14012fbf7:	add    %rax,(%rdx,%rcx,8)
   14012fbfb:	cmpb   $0x0,0x1040(%rbx)
   14012fc02:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14012fc08:	movzbl 0xa(%rdi),%eax
   14012fc0c:	lea    0xb(%rdi),%r12
   14012fc10:	lea    0x291489(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fc17:	jmp    *(%rdi,%rax,8)
   14012fc1a:	lea    0x350(%rsp),%r10
   14012fc22:	vzeroupper
   14012fc25:	mov    %r10,%rcx
   14012fc28:	mov    %r8,0x350(%rsp)
   14012fc30:	call   14021c730 <setun::VMValue::payload() const>
   14012fc35:	mov    0x58(%rax),%rax
   14012fc39:	mov    %rax,0x40(%rsp)
   14012fc3e:	test   %rax,%rax
   14012fc41:	je     140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012fc47:	lea    0x348(%rsp),%rcx
   14012fc4f:	call   14021b2c0 <setun::VMValue::as_int() const>
   14012fc54:	mov    %rax,%rdi
   14012fc57:	test   %rax,%rax
   14012fc5a:	js     14013691c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1236c>
   14012fc60:	mov    0x40(%rsp),%rcx
   14012fc65:	call   140147900 <setun::ArrayObject::size() const>
   14012fc6a:	cmp    %rax,%rdi
   14012fc6d:	jae    140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012fc73:	mov    0x40(%rsp),%rcx
   14012fc78:	lea    0x340(%rsp),%r8
   14012fc80:	mov    %rdi,%rdx
   14012fc83:	call   14014aee0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   14012fc88:	jmp    140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   14012fc8d:	shl    $0x10,%rdx
   14012fc91:	shl    $0x10,%r8
   14012fc95:	mov    %r12,%rcx
   14012fc98:	movabs $0xfffa000000000000,%rax
   14012fca2:	cmp    %r8,%rdx
   14012fca5:	movabs $0xfffa000000000001,%rdx
   14012fcaf:	cmovl  %rdx,%rax
   14012fcb3:	mov    %rax,0x1c8(%rsp)
   14012fcbb:	cmpb   $0x0,0x1520f(%rbx)
   14012fcc2:	je     14012fcf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb748>
   14012fcc4:	mov    0xe8(%r14),%rax
   14012fccb:	mov    0xf0(%r14),%r8
   14012fcd2:	lea    -0x1(%r12),%rdx
   14012fcd7:	sub    %r15,%rdx
   14012fcda:	sub    %rax,%r8
   14012fcdd:	cmp    %r8,%rdx
   14012fce0:	jae    14012fcf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb748>
   14012fce2:	add    %rdx,%rax
   14012fce5:	movzbl (%rax),%edi
   14012fce8:	lea    0x1(%rdi),%edx
   14012fceb:	mov    %dl,(%rax)
   14012fced:	cmp    $0x7,%dl
   14012fcf0:	jbe    14012fcf8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb748>
   14012fcf2:	movb   $0xce,-0x1(%r12)
   14012fcf8:	cmpb   $0x0,0x1040(%rbx)
   14012fcff:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012fd05:	movzbl (%rcx),%eax
   14012fd08:	lea    0x291391(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fd0f:	lea    0x1(%rcx),%r12
   14012fd13:	jmp    *(%rdi,%rax,8)
   14012fd16:	shl    $0x10,%rdx
   14012fd1a:	shl    $0x10,%r8
   14012fd1e:	mov    %r12,%rcx
   14012fd21:	movabs $0xfffa000000000000,%rax
   14012fd2b:	cmp    %r8,%rdx
   14012fd2e:	movabs $0xfffa000000000001,%rdx
   14012fd38:	cmovge %rdx,%rax
   14012fd3c:	mov    %rax,0x1c8(%rsp)
   14012fd44:	cmpb   $0x0,0x1520f(%rbx)
   14012fd4b:	je     14012fd81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d1>
   14012fd4d:	mov    0xe8(%r14),%rax
   14012fd54:	mov    0xf0(%r14),%r8
   14012fd5b:	lea    -0x1(%r12),%rdx
   14012fd60:	sub    %r15,%rdx
   14012fd63:	sub    %rax,%r8
   14012fd66:	cmp    %r8,%rdx
   14012fd69:	jae    14012fd81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d1>
   14012fd6b:	add    %rdx,%rax
   14012fd6e:	movzbl (%rax),%edi
   14012fd71:	lea    0x1(%rdi),%edx
   14012fd74:	mov    %dl,(%rax)
   14012fd76:	cmp    $0x7,%dl
   14012fd79:	jbe    14012fd81 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb7d1>
   14012fd7b:	movb   $0xc0,-0x1(%r12)
   14012fd81:	cmpb   $0x0,0x1040(%rbx)
   14012fd88:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012fd8e:	movzbl (%rcx),%eax
   14012fd91:	lea    0x291308(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012fd98:	lea    0x1(%rcx),%r12
   14012fd9c:	jmp    *(%rdi,%rax,8)
   14012fd9f:	lea    0x420(%rsp),%rax
   14012fda7:	mov    %rcx,%rdx
   14012fdaa:	mov    %r9,0xa0(%rsp)
   14012fdb2:	mov    %rax,%rcx
   14012fdb5:	mov    %rax,0x80(%rsp)
   14012fdbd:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012fdc2:	mov    0xa0(%rsp),%r9
   14012fdca:	jmp    14012562b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107b>
   14012fdcf:	mov    %rdx,0x3f8(%rsp)
   14012fdd7:	lea    0x3f8(%rsp),%rcx
   14012fddf:	vzeroupper
   14012fde2:	call   14021c730 <setun::VMValue::payload() const>
   14012fde7:	mov    0x48(%rax),%rbp
   14012fdeb:	test   %rbp,%rbp
   14012fdee:	je     14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   14012fdf4:	mov    0x38(%rbp),%rdx
   14012fdf8:	test   %rdx,%rdx
   14012fdfb:	je     14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   14012fe01:	mov    0x40(%rsp),%rax
   14012fe06:	mov    (%rax),%eax
   14012fe08:	cmp    %eax,(%rdx)
   14012fe0a:	jne    140134d56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107a6>
   14012fe10:	test   %eax,%eax
   14012fe12:	je     140134d56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x107a6>
   14012fe18:	mov    0x40(%rsp),%rax
   14012fe1d:	mov    0x15268(%rbx),%rbp
   14012fe24:	mov    0x1070(%rbx),%rdx
   14012fe2b:	sub    0x1068(%rbx),%rdx
   14012fe32:	movzwl 0x8(%rax),%eax
   14012fe36:	sar    $0x3,%rdx
   14012fe3a:	add    %rbp,%rax
   14012fe3d:	mov    %rax,0x15268(%rbx)
   14012fe44:	add    $0x40,%rax
   14012fe48:	cmp    %rdx,%rax
   14012fe4b:	jae    140138d38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14788>
   14012fe51:	test   %dil,%dil
   14012fe54:	jne    140134cc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10712>
   14012fe5a:	cmp    $0x1,%sil
   14012fe5e:	je     140138cca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1471a>
   14012fe64:	cmp    $0x2,%sil
   14012fe68:	je     140138bfa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1464a>
   14012fe6e:	mov    %r13,%rax
   14012fe71:	mov    0x1068(%rbx),%rdx
   14012fe78:	lea    -0x8(%r13),%r13
   14012fe7c:	mov    0x1048(%rbx),%r11
   14012fe83:	mov    -0x8(%rax),%rax
   14012fe87:	mov    %rax,(%rdx,%rbp,8)
   14012fe8b:	mov    %r13,%rdx
   14012fe8e:	mov    0x40(%rsp),%rax
   14012fe93:	mov    0x150c0(%rbx),%rcx
   14012fe9a:	sub    %r15,%r12
   14012fe9d:	sub    %r11,%rdx
   14012fea0:	mov    %rdx,%rdi
   14012fea3:	movzwl 0x8(%rax),%r10d
   14012fea8:	mov    0x4(%rax),%eax
   14012feab:	sar    $0x3,%rdi
   14012feaf:	cmp    $0x7ff,%rcx
   14012feb6:	ja     1401392b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d07>
   14012febc:	lea    0x1(%rcx),%r9
   14012fec0:	lea    (%rcx,%rcx,4),%rcx
   14012fec4:	mov    %r9,0x150c0(%rbx)
   14012fecb:	mov    %r10,0x10d8(%rbx,%rcx,8)
   14012fed3:	mov    0x152a0(%rbx),%r10
   14012feda:	mov    %r12,0x10c0(%rbx,%rcx,8)
   14012fee2:	mov    %rbp,0x10c8(%rbx,%rcx,8)
   14012feea:	mov    %rdi,0x10d0(%rbx,%rcx,8)
   14012fef2:	mov    %rax,0x10e0(%rbx,%rcx,8)
   14012fefa:	mov    0x15270(%rbx),%rcx
   14012ff01:	cmp    %r10,0x68(%rcx)
   14012ff05:	jae    140136d00 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12750>
   14012ff0b:	add    %r15,%rax
   14012ff0e:	mov    %rax,%r12
   14012ff11:	cmpb   $0x0,0x1040(%rbx)
   14012ff18:	je     1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   14012ff1e:	lea    0x1(%rax),%r12
   14012ff22:	movzbl (%rax),%eax
   14012ff25:	lea    0x291174(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ff2c:	jmp    *(%rdi,%rax,8)
   14012ff2f:	movabs $0xfffa000000000000,%rax
   14012ff39:	cmp    %r8,%rcx
   14012ff3c:	mov    %r12,%rcx
   14012ff3f:	movabs $0xfffa000000000001,%rdx
   14012ff49:	cmove  %rdx,%rax
   14012ff4d:	mov    %rax,0x1c8(%rsp)
   14012ff55:	cmpb   $0x0,0x1520f(%rbx)
   14012ff5c:	je     14012ff92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9e2>
   14012ff5e:	mov    0xe8(%r14),%rax
   14012ff65:	mov    0xf0(%r14),%r8
   14012ff6c:	lea    -0x1(%r12),%rdx
   14012ff71:	sub    %r15,%rdx
   14012ff74:	sub    %rax,%r8
   14012ff77:	cmp    %r8,%rdx
   14012ff7a:	jae    14012ff92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9e2>
   14012ff7c:	add    %rdx,%rax
   14012ff7f:	movzbl (%rax),%edi
   14012ff82:	lea    0x1(%rdi),%edx
   14012ff85:	mov    %dl,(%rax)
   14012ff87:	cmp    $0x7,%dl
   14012ff8a:	jbe    14012ff92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb9e2>
   14012ff8c:	movb   $0xc1,-0x1(%r12)
   14012ff92:	cmpb   $0x0,0x1040(%rbx)
   14012ff99:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   14012ff9f:	movzbl (%rcx),%eax
   14012ffa2:	lea    0x2910f7(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14012ffa9:	lea    0x1(%rcx),%r12
   14012ffad:	jmp    *(%rdi,%rax,8)
   14012ffb0:	lea    0x440(%rsp),%r8
   14012ffb8:	mov    %r9,%rdx
   14012ffbb:	mov    %r8,%rcx
   14012ffbe:	mov    %r8,0xa0(%rsp)
   14012ffc6:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012ffcb:	mov    0xa0(%rsp),%r8
   14012ffd3:	jmp    140125696 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e6>
   14012ffd8:	lea    0x460(%rsp),%rax
   14012ffe0:	mov    0x40(%rsp),%rdx
   14012ffe5:	mov    %r8,0xc0(%rsp)
   14012ffed:	mov    %rax,%rcx
   14012fff0:	mov    %rax,0xa0(%rsp)
   14012fff8:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14012fffd:	mov    0xc0(%rsp),%r8
   140130005:	jmp    140125720 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1170>
   14013000a:	mov    0x1070(%rbx),%rax
   140130011:	sub    0x1068(%rbx),%rax
   140130018:	sar    $0x3,%rax
   14013001c:	mov    %rax,0x80(%rsp)
   140130024:	lea    (%rax,%rcx,1),%rdx
   140130028:	lea    0x1068(%rbx),%rcx
   14013002f:	vzeroupper
   140130032:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130037:	jmp    140126f95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29e5>
   14013003c:	shl    $0x10,%rdx
   140130040:	shl    $0x10,%r8
   140130044:	mov    %r12,%rcx
   140130047:	movabs $0xfffa000000000000,%rax
   140130051:	cmp    %r8,%rdx
   140130054:	movabs $0xfffa000000000001,%rdx
   14013005e:	cmovg  %rdx,%rax
   140130062:	mov    %rax,0x1c8(%rsp)
   14013006a:	cmpb   $0x0,0x1520f(%rbx)
   140130071:	je     1401300a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf7>
   140130073:	mov    0xe8(%r14),%rax
   14013007a:	mov    0xf0(%r14),%r8
   140130081:	lea    -0x1(%r12),%rdx
   140130086:	sub    %r15,%rdx
   140130089:	sub    %rax,%r8
   14013008c:	cmp    %r8,%rdx
   14013008f:	jae    1401300a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf7>
   140130091:	add    %rdx,%rax
   140130094:	movzbl (%rax),%edi
   140130097:	lea    0x1(%rdi),%edx
   14013009a:	mov    %dl,(%rax)
   14013009c:	cmp    $0x7,%dl
   14013009f:	jbe    1401300a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbaf7>
   1401300a1:	movb   $0xbf,-0x1(%r12)
   1401300a7:	cmpb   $0x0,0x1040(%rbx)
   1401300ae:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   1401300b4:	movzbl (%rcx),%eax
   1401300b7:	lea    0x290fe2(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401300be:	lea    0x1(%rcx),%r12
   1401300c2:	jmp    *(%rdi,%rax,8)
   1401300c5:	movabs $0xffff000000000000,%rax
   1401300cf:	movabs $0xfff8000000000000,%rdx
   1401300d9:	and    0x338(%rsp),%rax
   1401300e1:	cmp    %rdx,%rax
   1401300e4:	jne    140130279 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcc9>
   1401300ea:	lea    0x330(%rsp),%rcx
   1401300f2:	vzeroupper
   1401300f5:	call   14021c730 <setun::VMValue::payload() const>
   1401300fa:	mov    0x58(%rax),%r9
   1401300fe:	test   %r9,%r9
   140130101:	je     140128c01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4651>
   140130107:	mov    0x338(%rsp),%r8
   14013010f:	shl    $0x10,%r8
   140130113:	mov    %r8,%rdi
   140130116:	sar    $0x10,%rdi
   14013011a:	js     140128c01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4651>
   140130120:	mov    %r9,%rcx
   140130123:	mov    %r9,0x40(%rsp)
   140130128:	call   140147900 <setun::ArrayObject::size() const>
   14013012d:	cmp    %rax,%rdi
   140130130:	jae    140128c01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4651>
   140130136:	mov    0x40(%rsp),%r9
   14013013b:	movzbl (%r9),%eax
   14013013f:	cmp    $0x3,%al
   140130141:	je     14013551a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f6a>
   140130147:	ja     140135465 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10eb5>
   14013014d:	cmp    $0x1,%al
   14013014f:	je     140136934 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12384>
   140130155:	cmp    $0x2,%al
   140130157:	jne    140135f5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119ad>
   14013015d:	test   %sil,%sil
   140130160:	je     14013748c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12edc>
   140130166:	sub    $0x1,%sil
   14013016a:	je     14013018d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbdd>
   14013016c:	lea    0x8(%r13),%rax
   140130170:	cmp    0x30(%rsp),%rax
   140130175:	jae    1401382e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d35>
   14013017b:	mov    0x1d0(%rsp),%rdx
   140130183:	mov    %r13,%rax
   140130186:	lea    0x8(%r13),%r13
   14013018a:	mov    %rdx,(%rax)
   14013018d:	mov    0x1c8(%rsp),%rax
   140130195:	lea    0x710(%rsp),%rcx
   14013019d:	mov    $0x2,%esi
   1401301a2:	mov    %rax,0x1d0(%rsp)
   1401301aa:	mov    0x38(%r9),%rax
   1401301ae:	movzbl (%rax,%rdi,1),%edx
   1401301b2:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401301b7:	mov    0x710(%rsp),%rax
   1401301bf:	mov    %rax,0x1c8(%rsp)
   1401301c7:	cmpb   $0x0,0x1040(%rbx)
   1401301ce:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401301d4:	mov    %r12,%rax
   1401301d7:	lea    0x290ec2(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401301de:	lea    0x1(%r12),%r12
   1401301e3:	movzbl (%rax),%eax
   1401301e6:	jmp    *(%rdi,%rax,8)
   1401301e9:	nopl   0x0(%rax)
   1401301f0:	shl    $0x10,%rdx
   1401301f4:	shl    $0x10,%r8
   1401301f8:	mov    %r12,%rcx
   1401301fb:	movabs $0xfffa000000000000,%rax
   140130205:	cmp    %rdx,%r8
   140130208:	movabs $0xfffa000000000001,%rdx
   140130212:	cmovge %rdx,%rax
   140130216:	mov    %rax,0x1c8(%rsp)
   14013021e:	cmpb   $0x0,0x1520f(%rbx)
   140130225:	je     14013025b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcab>
   140130227:	mov    0xe8(%r14),%rax
   14013022e:	mov    0xf0(%r14),%r8
   140130235:	lea    -0x1(%r12),%rdx
   14013023a:	sub    %r15,%rdx
   14013023d:	sub    %rax,%r8
   140130240:	cmp    %r8,%rdx
   140130243:	jae    14013025b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcab>
   140130245:	add    %rdx,%rax
   140130248:	movzbl (%rax),%edi
   14013024b:	lea    0x1(%rdi),%edx
   14013024e:	mov    %dl,(%rax)
   140130250:	cmp    $0x7,%dl
   140130253:	jbe    14013025b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbcab>
   140130255:	movb   $0xcf,-0x1(%r12)
   14013025b:	cmpb   $0x0,0x1040(%rbx)
   140130262:	je     14012f360 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadb0>
   140130268:	movzbl (%rcx),%eax
   14013026b:	lea    0x290e2e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130272:	lea    0x1(%rcx),%r12
   140130276:	jmp    *(%rdi,%rax,8)
   140130279:	lea    0x330(%rsp),%rcx
   140130281:	vzeroupper
   140130284:	call   14021c730 <setun::VMValue::payload() const>
   140130289:	mov    0x58(%rax),%rdi
   14013028d:	test   %rdi,%rdi
   140130290:	je     14012f66d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0bd>
   140130296:	mov    %rdi,%rcx
   140130299:	call   1401479e0 <setun::ArrayObject::empty() const>
   14013029e:	test   %al,%al
   1401302a0:	jne    14012f66d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0bd>
   1401302a6:	lea    0x338(%rsp),%rcx
   1401302ae:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401302b3:	mov    %rax,%r8
   1401302b6:	test   %rax,%rax
   1401302b9:	js     14012f652 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0a2>
   1401302bf:	mov    %rdi,%rcx
   1401302c2:	mov    %r8,0x40(%rsp)
   1401302c7:	call   140147900 <setun::ArrayObject::size() const>
   1401302cc:	mov    0x40(%rsp),%r8
   1401302d1:	cmp    %rax,%r8
   1401302d4:	jae    14012f66d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0bd>
   1401302da:	test   %sil,%sil
   1401302dd:	je     14013906a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aba>
   1401302e3:	sub    $0x1,%sil
   1401302e7:	je     140139087 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ad7>
   1401302ed:	lea    0x8(%r13),%rax
   1401302f1:	cmp    0x30(%rsp),%rax
   1401302f6:	jae    140138a9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144ed>
   1401302fc:	mov    0x1d0(%rsp),%rdx
   140130304:	mov    %r13,%rax
   140130307:	mov    %rdi,%rcx
   14013030a:	lea    0x8(%r13),%r13
   14013030e:	mov    $0x2,%esi
   140130313:	mov    %rdx,(%rax)
   140130316:	mov    0x1c8(%rsp),%rax
   14013031e:	mov    %r8,%rdx
   140130321:	mov    %rax,0x1d0(%rsp)
   140130329:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   14013032e:	mov    %rax,0x1c8(%rsp)
   140130336:	jmp    140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   14013033b:	nopl   0x0(%rax,%rax,1)
   140130340:	cmp    $0x1,%sil
   140130344:	je     140133692 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0e2>
   14013034a:	mov    -0x8(%r13),%rdx
   14013034e:	mov    %r13,%rax
   140130351:	lea    -0x10(%r13),%r13
   140130355:	mov    %rdx,0x338(%rsp)
   14013035d:	mov    -0x10(%rax),%rax
   140130361:	mov    %rax,0x330(%rsp)
   140130369:	jmp    140128bdc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x462c>
   14013036e:	cmp    $0x1,%sil
   140130372:	je     14013363d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf08d>
   140130378:	mov    -0x8(%r13),%rdx
   14013037c:	mov    %r13,%rax
   14013037f:	lea    -0x10(%r13),%r13
   140130383:	mov    %rdx,0x380(%rsp)
   14013038b:	mov    -0x10(%rax),%rax
   14013038f:	mov    %rax,0x378(%rsp)
   140130397:	jmp    140128fb6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a06>
   14013039c:	cmp    $0x2,%sil
   1401303a0:	je     1401336ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf10a>
   1401303a6:	mov    %r13,%rax
   1401303a9:	mov    0x1068(%rbx),%rdx
   1401303b0:	lea    -0x8(%r13),%r13
   1401303b4:	mov    -0x8(%rax),%rax
   1401303b8:	mov    %rax,0x18(%rdx,%rbp,8)
   1401303bd:	jmp    1401289ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x444f>
   1401303c2:	cmp    $0x2,%sil
   1401303c6:	je     14013360f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf05f>
   1401303cc:	mov    %r13,%rax
   1401303cf:	mov    0x1068(%rbx),%rdx
   1401303d6:	lea    -0x8(%r13),%r13
   1401303da:	mov    -0x8(%rax),%rax
   1401303de:	mov    %rax,0x8(%rdx,%rbp,8)
   1401303e3:	jmp    14012897b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43cb>
   1401303e8:	cmp    $0x2,%sil
   1401303ec:	je     140133665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf0b5>
   1401303f2:	mov    %r13,%rax
   1401303f5:	mov    0x1068(%rbx),%rdx
   1401303fc:	lea    -0x8(%r13),%r13
   140130400:	mov    -0x8(%rax),%rax
   140130404:	mov    %rax,(%rdx,%rbp,8)
   140130408:	jmp    140128939 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4389>
   14013040d:	cmp    $0x2,%sil
   140130411:	je     140133a60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4b0>
   140130417:	mov    %r13,%rax
   14013041a:	mov    0x1068(%rbx),%rdx
   140130421:	lea    -0x8(%r13),%r13
   140130425:	mov    -0x8(%rax),%rax
   140130429:	mov    %rax,0x10(%rdx,%rbp,8)
   14013042e:	jmp    1401289bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x440d>
   140130433:	mov    0x1070(%rbx),%rdx
   14013043a:	lea    0x8(%rdi),%rax
   14013043e:	lea    0x48(%rdi),%rcx
   140130442:	sub    0x1068(%rbx),%rdx
   140130449:	sar    $0x3,%rdx
   14013044d:	mov    %rax,0x15268(%rbx)
   140130454:	mov    %rdx,%rax
   140130457:	cmp    %rdx,%rcx
   14013045a:	jb     140128333 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d83>
   140130460:	add    %rdx,%rdx
   140130463:	lea    0x1068(%rbx),%rcx
   14013046a:	vzeroupper
   14013046d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130472:	jmp    140128321 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d71>
   140130477:	nopw   0x0(%rax,%rax,1)
   140130480:	cmp    $0x2,%sil
   140130484:	je     140133371 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xedc1>
   14013048a:	mov    %r13,%rax
   14013048d:	lea    -0x8(%r13),%r13
   140130491:	mov    -0x8(%rax),%rax
   140130495:	mov    %rax,0x340(%rsp)
   14013049d:	cmp    $0x1,%sil
   1401304a1:	jne    140128cd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4728>
   1401304a7:	mov    0x1c8(%rsp),%rax
   1401304af:	xor    %esi,%esi
   1401304b1:	mov    %rax,0x348(%rsp)
   1401304b9:	mov    %r13,%rax
   1401304bc:	lea    -0x8(%r13),%r13
   1401304c0:	mov    -0x8(%rax),%r8
   1401304c4:	jmp    140128cef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x473f>
   1401304c9:	mov    0x15270(%rbx),%rax
   1401304d0:	mov    0x152a0(%rbx),%rcx
   1401304d7:	cmp    %rcx,0x68(%rax)
   1401304db:	jae    140135835 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11285>
   1401304e1:	cmpb   $0x0,0x152c1(%rbx)
   1401304e8:	je     1401328e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe339>
   1401304ee:	cmpq   $0x0,0x152e0(%rbx)
   1401304f6:	je     1401328e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe339>
   1401304fc:	cmp    $0x2,%sil
   140130500:	je     1401357f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11244>
   140130506:	cmp    $0x1,%sil
   14013050a:	je     140138fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149f5>
   140130510:	mov    0x1048(%rbx),%r11
   140130517:	mov    0x1050(%rbx),%rax
   14013051e:	mov    %r13,%rdx
   140130521:	sub    %r11,%rax
   140130524:	mov    %r13,0x40(%rsp)
   140130529:	sub    %r11,%rdx
   14013052c:	mov    %rdx,%rsi
   14013052f:	sar    $0x3,%rsi
   140130533:	cmp    %rdx,%rax
   140130536:	jb     1401357dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1122c>
   14013053c:	movswq %di,%rdx
   140130540:	mov    %rsi,0x1060(%rbx)
   140130547:	mov    %r12,%rax
   14013054a:	lea    0x2(%r12,%rdx,1),%rdx
   14013054f:	sub    %r15,%rdx
   140130552:	mov    %rdx,0x60(%rsp)
   140130557:	and    0x15300(%rbx),%rdx
   14013055e:	mov    %rdx,%r10
   140130561:	shl    $0x5,%r10
   140130565:	add    0x152e0(%rbx),%r10
   14013056c:	cmpq   $0x0,(%r10)
   140130570:	je     1401356d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11120>
   140130576:	mov    0x1068(%rbx),%rdx
   14013057d:	lea    0x5f0(%rsp),%rsi
   140130585:	xor    %eax,%eax
   140130587:	mov    $0x23,%ecx
   14013058c:	mov    %rsi,%rdi
   14013058f:	rep stos %rax,(%rdi)
   140130592:	lea    (%rdx,%rbp,8),%rax
   140130596:	movb   $0x1,0x6f8(%rsp)
   14013059e:	mov    %rax,0x600(%rsp)
   1401305a6:	mov    0x1070(%rbx),%rax
   1401305ad:	mov    %rbx,0x5f0(%rsp)
   1401305b5:	sub    %rdx,%rax
   1401305b8:	mov    0x1048(%rbx),%rdx
   1401305bf:	sar    $0x3,%rax
   1401305c3:	sub    %rbp,%rax
   1401305c6:	mov    %rdx,0x610(%rsp)
   1401305ce:	mov    %rax,0x608(%rsp)
   1401305d6:	mov    0x40(%rsp),%rax
   1401305db:	sub    %rdx,%rax
   1401305de:	mov    0x150c0(%rbx),%rdx
   1401305e5:	sar    $0x3,%rax
   1401305e9:	mov    %rax,0x618(%rsp)
   1401305f1:	xor    %eax,%eax
   1401305f3:	test   %rdx,%rdx
   1401305f6:	je     140130604 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc054>
   1401305f8:	imul   $0x28,%rdx,%rdx
   1401305fc:	lea    0x1098(%rbx,%rdx,1),%rax
   140130604:	mov    %r10,0x80(%rsp)
   14013060c:	vmovq  %rax,%xmm7
   140130611:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   14013061b:	mov    %rsi,0x152b8(%rbx)
   140130622:	vmovdqa %xmm0,0x620(%rsp)
   14013062b:	vzeroupper
   14013062e:	call   140213660 <tersun::VMTelemetryManager::instance()>
   140130633:	mov    0x80(%rsp),%r10
   14013063b:	cmpb   $0x0,(%rax)
   14013063e:	je     140130645 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc095>
   140130640:	addq   $0x1,0x78(%rax)
   140130645:	mov    %rsi,%rdx
   140130648:	mov    %rbx,%rcx
   14013064b:	call   *(%r10)
   14013064e:	mov    %rax,%rdi
   140130651:	mov    0x628(%rsp),%rax
   140130659:	mov    %rax,0x152b8(%rbx)
   140130660:	cmpq   $0x0,0x638(%rsp)
   140130669:	jg     140137904 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13354>
   14013066f:	mov    0x150c0(%rbx),%rax
   140130676:	test   %rax,%rax
   140130679:	je     140134a68 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104b8>
   14013067f:	lea    -0x1(%rax),%rdx
   140130683:	lea    (%rax,%rax,4),%rax
   140130687:	lea    (%rdx,%rdx,4),%rcx
   14013068b:	lea    (%rbx,%rax,8),%rax
   14013068f:	lea    (%rbx,%rcx,8),%rcx
   140130693:	mov    0x1098(%rax),%rsi
   14013069a:	mov    0x10a8(%rax),%rbp
   1401306a1:	vmovdqu 0x10c0(%rcx),%ymm0
   1401306a9:	mov    0x10e0(%rcx),%rcx
   1401306b0:	vmovdqu %ymm0,0x560(%rsp)
   1401306b9:	mov    %rcx,0x580(%rsp)
   1401306c1:	mov    0x10a0(%rax),%rcx
   1401306c8:	mov    %rdx,0x150c0(%rbx)
   1401306cf:	cmpb   $0x0,0x15211(%rbx)
   1401306d6:	je     140137731 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13181>
   1401306dc:	mov    %rcx,0x15268(%rbx)
   1401306e3:	mov    0x1048(%rbx),%r11
   1401306ea:	mov    %rdi,(%r11,%rbp,8)
   1401306ee:	lea    0x8(%r11,%rbp,8),%r13
   1401306f3:	mov    0x150c0(%rbx),%rbp
   1401306fa:	test   %rbp,%rbp
   1401306fd:	je     14013070f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc15f>
   1401306ff:	lea    -0x1(%rbp),%rax
   140130703:	imul   $0x28,%rax,%rax
   140130707:	mov    0x10c8(%rbx,%rax,1),%rbp
   14013070f:	add    %r15,%rsi
   140130712:	mov    %rsi,%r12
   140130715:	cmpb   $0x0,0x1040(%rbx)
   14013071c:	je     140132c88 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe6d8>
   140130722:	movzbl (%rsi),%eax
   140130725:	lea    0x290974(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013072c:	lea    0x1(%rsi),%r12
   140130730:	xor    %esi,%esi
   140130732:	mov    (%rdi,%rax,8),%rax
   140130736:	jmp    *%rax
   140130738:	cmp    $0x1,%sil
   14013073c:	je     1401344e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff38>
   140130742:	mov    -0x8(%r13),%rdx
   140130746:	mov    %r13,%rax
   140130749:	lea    -0x10(%r13),%r13
   14013074d:	mov    %rdx,0x3c0(%rsp)
   140130755:	mov    -0x10(%rax),%rax
   140130759:	mov    %rax,0x3b8(%rsp)
   140130761:	jmp    1401294a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ef0>
   140130766:	cmp    $0x2,%sil
   14013076a:	je     1401333ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee3e>
   140130770:	mov    %r13,%rax
   140130773:	lea    -0x8(%r13),%r13
   140130777:	mov    -0x8(%rax),%rax
   14013077b:	mov    %rax,0x318(%rsp)
   140130783:	cmp    $0x1,%sil
   140130787:	jne    14012ae01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6851>
   14013078d:	mov    0x1c8(%rsp),%rax
   140130795:	xor    %esi,%esi
   140130797:	mov    %rax,0x320(%rsp)
   14013079f:	mov    %r13,%rax
   1401307a2:	lea    -0x8(%r13),%r13
   1401307a6:	mov    -0x8(%rax),%rdx
   1401307aa:	jmp    14012ae18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6868>
   1401307af:	cmp    $0x2,%sil
   1401307b3:	je     140133542 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef92>
   1401307b9:	cmp    $0x1,%sil
   1401307bd:	jne    1401377f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13241>
   1401307c3:	mov    0x1048(%rbx),%r11
   1401307ca:	lea    0x8(%r13),%rax
   1401307ce:	cmp    0x30(%rsp),%rax
   1401307d3:	jae    1401377c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13218>
   1401307d9:	mov    0x1050(%rbx),%rax
   1401307e0:	mov    0x1c8(%rsp),%rcx
   1401307e8:	mov    %r13,%rdx
   1401307eb:	lea    0x8(%r13),%r13
   1401307ef:	mov    %rcx,(%rdx)
   1401307f2:	mov    %r13,%rdx
   1401307f5:	sub    %r15,%rdi
   1401307f8:	sub    %r11,%rax
   1401307fb:	sub    %r11,%rdx
   1401307fe:	mov    %rdi,0x1038(%rbx)
   140130805:	mov    %rdx,%rsi
   140130808:	sar    $0x3,%rsi
   14013080c:	cmp    %rdx,%rax
   14013080f:	jae    140130821 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc271>
   140130811:	lea    (%rsi,%rsi,1),%rdx
   140130815:	lea    0x1048(%rbx),%rcx
   14013081c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130821:	vmovdqa 0x22d297(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140130829:	mov    %rsi,0x1060(%rbx)
   140130830:	movb   $0x0,0x153a0(%rbx)
   140130837:	vmovdqa %xmm0,0x15390(%rbx)
   14013083f:	call   14033f2e0 <setun::cold_throw_range_step_zero()>
   140130844:	nopl   0x0(%rax)
   140130848:	mov    %r10d,0x60(%rsp)
   14013084d:	lea    0x20(%r9),%rdx
   140130851:	lea    0x1068(%rbx),%rcx
   140130858:	mov    %eax,0x80(%rsp)
   14013085f:	mov    %r9,0x40(%rsp)
   140130864:	vzeroupper
   140130867:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013086c:	mov    0x80(%rsp),%eax
   140130873:	mov    0x60(%rsp),%r10d
   140130878:	mov    0x40(%rsp),%r9
   14013087d:	jmp    140128809 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4259>
   140130882:	lea    0x8(%r9),%rdx
   140130886:	lea    0x48(%r9),%r11
   14013088a:	mov    %rdx,0x15268(%rbx)
   140130891:	mov    0x1070(%rbx),%rdx
   140130898:	sub    0x1068(%rbx),%rdx
   14013089f:	sar    $0x3,%rdx
   1401308a3:	mov    %rdx,%rcx
   1401308a6:	cmp    %rdx,%r11
   1401308a9:	jb     140128800 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4250>
   1401308af:	mov    %r10d,0x60(%rsp)
   1401308b4:	add    %rdx,%rdx
   1401308b7:	lea    0x1068(%rbx),%rcx
   1401308be:	mov    %eax,0x80(%rsp)
   1401308c5:	mov    %r9,0x40(%rsp)
   1401308ca:	vzeroupper
   1401308cd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401308d2:	mov    0x80(%rsp),%eax
   1401308d9:	mov    0x60(%rsp),%r10d
   1401308de:	mov    0x40(%rsp),%r9
   1401308e3:	jmp    1401287ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x423e>
   1401308e8:	nopl   0x0(%rax,%rax,1)
   1401308f0:	mov    0x1048(%rbx),%r11
   1401308f7:	vzeroupper
   1401308fa:	jmp    1401251ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbfc>
   1401308ff:	cmp    $0x1,%sil
   140130903:	je     140134496 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfee6>
   140130909:	lea    0x10(%r13),%rax
   14013090d:	cmp    0x30(%rsp),%rax
   140130912:	jae    140137b86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135d6>
   140130918:	mov    0x1d0(%rsp),%rdx
   140130920:	mov    %r13,%rax
   140130923:	lea    0x10(%r13),%r13
   140130927:	mov    %rdx,-0x10(%r13)
   14013092b:	mov    0x1c8(%rsp),%rdx
   140130933:	mov    %rdx,0x8(%rax)
   140130937:	jmp    14012839c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dec>
   14013093c:	cmp    $0x2,%sil
   140130940:	je     1401334ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeefb>
   140130946:	mov    %r13,%rax
   140130949:	mov    0x1068(%rbx),%rdx
   140130950:	lea    -0x8(%r13),%r13
   140130954:	mov    -0x8(%rax),%rax
   140130958:	mov    %rax,(%rdx,%rdi,8)
   14013095c:	jmp    14012835b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dab>
   140130961:	lea    0x20(%rdi),%rdx
   140130965:	lea    0x1068(%rbx),%rcx
   14013096c:	vzeroupper
   14013096f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130974:	jmp    14012833c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3d8c>
   140130979:	mov    %r9,0x60(%rsp)
   14013097e:	lea    0x3e0(%rsp),%rcx
   140130986:	vzeroupper
   140130989:	call   14021c730 <setun::VMValue::payload() const>
   14013098e:	mov    0x60(%rsp),%r9
   140130993:	lea    0x22c124(%rip),%rdx        # 14035cabe <.rdata+0x4fe>
   14013099a:	mov    %rax,0x40(%rsp)
   14013099f:	movzwl 0x6(%r9),%edi
   1401309a4:	shl    $0x5,%rdi
   1401309a8:	add    0x30(%r14),%rdi
   1401309ac:	mov    %rdi,%rcx
   1401309af:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401309b4:	test   %al,%al
   1401309b6:	jne    1401309cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc41f>
   1401309b8:	lea    0x22c103(%rip),%rdx        # 14035cac2 <.rdata+0x502>
   1401309bf:	mov    %rdi,%rcx
   1401309c2:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401309c7:	test   %al,%al
   1401309c9:	je     14012f36f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadbf>
   1401309cf:	mov    0x40(%rsp),%rax
   1401309d4:	mov    0x58(%rax),%rdi
   1401309d8:	test   %sil,%sil
   1401309db:	jne    14013343b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee8b>
   1401309e1:	xor    %edx,%edx
   1401309e3:	test   %rdi,%rdi
   1401309e6:	je     1401309f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc443>
   1401309e8:	mov    %rdi,%rcx
   1401309eb:	call   140147900 <setun::ArrayObject::size() const>
   1401309f0:	mov    %rax,%rdx
   1401309f3:	lea    0x710(%rsp),%rcx
   1401309fb:	mov    $0x1,%esi
   140130a00:	call   140210640 <setun::VMValue::VMValue(long long)>
   140130a05:	mov    0x710(%rsp),%rax
   140130a0d:	mov    %rax,0x1c8(%rsp)
   140130a15:	cmpb   $0x0,0x1040(%rbx)
   140130a1c:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140130a22:	mov    %r12,%rax
   140130a25:	lea    0x290674(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130a2c:	lea    0x1(%r12),%r12
   140130a31:	movzbl (%rax),%eax
   140130a34:	jmp    *(%rdi,%rax,8)
   140130a37:	mov    %r9,0x40(%rsp)
   140130a3c:	lea    0x3e0(%rsp),%rcx
   140130a44:	vzeroupper
   140130a47:	call   14021c730 <setun::VMValue::payload() const>
   140130a4c:	mov    0x48(%rax),%rdi
   140130a50:	test   %rdi,%rdi
   140130a53:	je     14012f36f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadbf>
   140130a59:	mov    0x40(%rsp),%r9
   140130a5e:	lea    0x22c059(%rip),%rdx        # 14035cabe <.rdata+0x4fe>
   140130a65:	movzwl 0x6(%r9),%eax
   140130a6a:	mov    %r9,0x60(%rsp)
   140130a6f:	shl    $0x5,%rax
   140130a73:	add    0x30(%r14),%rax
   140130a77:	mov    %rax,%rcx
   140130a7a:	mov    %rax,0x40(%rsp)
   140130a7f:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130a84:	test   %al,%al
   140130a86:	jne    140132ce3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe733>
   140130a8c:	mov    0x40(%rsp),%rcx
   140130a91:	lea    0x22c02a(%rip),%rdx        # 14035cac2 <.rdata+0x502>
   140130a98:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140130a9d:	test   %al,%al
   140130a9f:	jne    140132ce3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe733>
   140130aa5:	mov    0x38(%rdi),%rax
   140130aa9:	test   %rax,%rax
   140130aac:	je     14013563f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1108f>
   140130ab2:	mov    0x40(%rsp),%r8
   140130ab7:	lea    0x28(%rax),%rdx
   140130abb:	lea    0x710(%rsp),%rcx
   140130ac3:	call   1402228a0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140130ac8:	mov    0x710(%rsp),%rax
   140130ad0:	test   %rax,%rax
   140130ad3:	je     14013563f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1108f>
   140130ad9:	mov    (%rax),%rax
   140130adc:	test   %rax,%rax
   140130adf:	je     14013563f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1108f>
   140130ae5:	movzwl 0x28(%rax),%r8d
   140130aea:	mov    0x48(%rdi),%rdx
   140130aee:	mov    0x50(%rdi),%rax
   140130af2:	sub    %rdx,%rax
   140130af5:	sar    $0x3,%rax
   140130af9:	cmp    %rax,%r8
   140130afc:	jae    14013563f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1108f>
   140130b02:	mov    0x38(%rdi),%rax
   140130b06:	mov    0x60(%rsp),%r9
   140130b0b:	mov    (%rax),%eax
   140130b0d:	mov    %r8w,0x4(%r9)
   140130b12:	mov    %eax,(%r9)
   140130b15:	test   %sil,%sil
   140130b18:	jne    140138958 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143a8>
   140130b1e:	mov    (%rdx,%r8,8),%rax
   140130b22:	mov    $0x1,%esi
   140130b27:	mov    %rax,0x1c8(%rsp)
   140130b2f:	cmpb   $0x0,0x1040(%rbx)
   140130b36:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140130b3c:	mov    %r12,%rax
   140130b3f:	lea    0x29055a(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140130b46:	lea    0x1(%r12),%r12
   140130b4b:	movzbl (%rax),%eax
   140130b4e:	jmp    *(%rdi,%rax,8)
   140130b51:	nopl   0x0(%rax)
   140130b58:	cmp    $0x1,%sil
   140130b5c:	je     140133798 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1e8>
   140130b62:	mov    -0x8(%r13),%rdx
   140130b66:	mov    %r13,%rax
   140130b69:	lea    -0x10(%r13),%r13
   140130b6d:	mov    %rdx,0x360(%rsp)
   140130b75:	mov    -0x10(%rax),%rax
   140130b79:	mov    %rax,0x358(%rsp)
   140130b81:	jmp    140128e3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x488e>
   140130b86:	cmp    $0x1,%sil
   140130b8a:	je     140133349 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed99>
   140130b90:	mov    -0x8(%r13),%rdx
   140130b94:	mov    %r13,%rax
   140130b97:	lea    -0x10(%r13),%r13
   140130b9b:	mov    %rdx,0x390(%rsp)
   140130ba3:	mov    -0x10(%rax),%rax
   140130ba7:	mov    %rax,0x388(%rsp)
   140130baf:	jmp    140129072 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ac2>
   140130bb4:	movabs $0xffffffff00000000,%rax
   140130bbe:	movabs $0xfffd000100000000,%rdx
   140130bc8:	and    %r10,%rax
   140130bcb:	cmp    %rdx,%rax
   140130bce:	jne    14012d7f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9243>
   140130bd4:	movabs $0xffff000000000000,%rdx
   140130bde:	movb   $0xcd,-0x1(%rdi)
   140130be2:	mov    (%r11),%rax
   140130be5:	movabs $0xfffd000000000000,%rcx
   140130bef:	and    %rax,%rdx
   140130bf2:	cmp    %rcx,%rdx
   140130bf5:	je     140134369 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdb9>
   140130bfb:	movabs $0xfff8000000000000,%rax
   140130c05:	cmp    %rax,%rdx
   140130c08:	je     140134381 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfdd1>
   140130c0e:	mov    %r11,%rcx
   140130c11:	vzeroupper
   140130c14:	call   14021ca10 <setun::VMValue::as_float() const>
   140130c19:	vcvttsd2si %xmm0,%rax
   140130c1e:	mov    %rax,0x500(%rsp)
   140130c26:	lea    0x500(%rsp),%rax
   140130c2e:	movq   $0x0,0x508(%rsp)
   140130c3a:	movq   $0x0,0x510(%rsp)
   140130c46:	mov    %rax,0xa0(%rsp)
   140130c4e:	mov    0x80(%rsp),%rax
   140130c56:	movabs $0xffff000000000000,%rdx
   140130c60:	movabs $0xfffd000000000000,%rcx
   140130c6a:	mov    (%rax),%rax
   140130c6d:	and    %rax,%rdx
   140130c70:	cmp    %rcx,%rdx
   140130c73:	je     140134317 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd67>
   140130c79:	movabs $0xfff8000000000000,%rax
   140130c83:	cmp    %rax,%rdx
   140130c86:	je     14013432f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd7f>
   140130c8c:	mov    0x80(%rsp),%rcx
   140130c94:	call   14021ca10 <setun::VMValue::as_float() const>
   140130c99:	lea    0x520(%rsp),%r8
   140130ca1:	movq   $0x0,0x528(%rsp)
   140130cad:	vcvttsd2si %xmm0,%rax
   140130cb2:	movq   $0x0,0x530(%rsp)
   140130cbe:	mov    %rax,0x520(%rsp)
   140130cc6:	movabs $0xffff000000000000,%rdx
   140130cd0:	mov    0x60(%rsp),%rax
   140130cd5:	movabs $0xfffd000000000000,%rcx
   140130cdf:	mov    (%rax),%rax
   140130ce2:	and    %rax,%rdx
   140130ce5:	cmp    %rcx,%rdx
   140130ce8:	je     140133d03 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf753>
   140130cee:	movabs $0xfff8000000000000,%rax
   140130cf8:	cmp    %rax,%rdx
   140130cfb:	je     140133d1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf76b>
   140130d01:	mov    0x60(%rsp),%rcx
   140130d06:	mov    %r8,0x80(%rsp)
   140130d0e:	call   14021ca10 <setun::VMValue::as_float() const>
   140130d13:	vcvttsd2si %xmm0,%rax
   140130d18:	mov    0x80(%rsp),%r8
   140130d20:	mov    %rax,0x540(%rsp)
   140130d28:	lea    0x540(%rsp),%rax
   140130d30:	movq   $0x0,0x548(%rsp)
   140130d3c:	movq   $0x0,0x550(%rsp)
   140130d48:	mov    %rax,0x80(%rsp)
   140130d50:	mov    0xa0(%rsp),%rdx
   140130d58:	lea    0x710(%rsp),%rax
   140130d60:	mov    %rax,%rcx
   140130d63:	mov    %rax,0x60(%rsp)
   140130d68:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   140130d6d:	mov    0x60(%rsp),%r8
   140130d72:	mov    0x80(%rsp),%rdx
   140130d7a:	lea    0x4a0(%rsp),%rcx
   140130d82:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140130d87:	mov    0x4b0(%rsp),%rax
   140130d8f:	vmovdqa 0x4a0(%rsp),%xmm7
   140130d98:	lea    0x1a0(%rsp),%rdx
   140130da0:	mov    0x60(%rsp),%rcx
   140130da5:	mov    %rax,0x1b0(%rsp)
   140130dad:	vmovdqa %xmm7,0x1a0(%rsp)
   140130db6:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   140130dbb:	mov    0x1068(%rbx),%rax
   140130dc2:	mov    0x40(%rsp),%rcx
   140130dc7:	mov    0x710(%rsp),%rdx
   140130dcf:	mov    %rdx,(%rax,%rcx,8)
   140130dd3:	jmp    14012d8bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x930c>
   140130dd8:	mov    %r9d,0x60(%rsp)
   140130ddd:	add    %rdx,%rdx
   140130de0:	lea    0x1068(%rbx),%rcx
   140130de7:	mov    %rax,0x40(%rsp)
   140130dec:	vzeroupper
   140130def:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130df4:	mov    0x60(%rsp),%r9d
   140130df9:	mov    0x40(%rsp),%rax
   140130dfe:	jmp    140127370 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2dc0>
   140130e03:	cmp    $0x1,%sil
   140130e07:	je     140133413 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee63>
   140130e0d:	mov    -0x8(%r13),%rdx
   140130e11:	mov    %r13,%rax
   140130e14:	lea    -0x10(%r13),%r13
   140130e18:	mov    %rdx,0x3b0(%rsp)
   140130e20:	mov    -0x10(%rax),%rax
   140130e24:	mov    %rax,0x3a8(%rsp)
   140130e2c:	jmp    14012933a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d8a>
   140130e31:	cmp    $0x1,%sil
   140130e35:	je     1401337c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf210>
   140130e3b:	mov    -0x8(%r13),%rdx
   140130e3f:	mov    %r13,%rax
   140130e42:	lea    -0x10(%r13),%r13
   140130e46:	mov    %rdx,0x3a0(%rsp)
   140130e4e:	mov    -0x10(%rax),%rax
   140130e52:	mov    %rax,0x398(%rsp)
   140130e5a:	jmp    1401291d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c26>
   140130e5f:	mov    %r10d,0x60(%rsp)
   140130e64:	lea    0x20(%r9),%rdx
   140130e68:	lea    0x1068(%rbx),%rcx
   140130e6f:	mov    %eax,0x80(%rsp)
   140130e76:	mov    %r9,0x40(%rsp)
   140130e7b:	vzeroupper
   140130e7e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130e83:	mov    0x80(%rsp),%eax
   140130e8a:	mov    0x60(%rsp),%r10d
   140130e8f:	mov    0x40(%rsp),%r9
   140130e94:	jmp    14012842f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e7f>
   140130e99:	lea    0x8(%r9),%rdx
   140130e9d:	lea    0x48(%r9),%r11
   140130ea1:	mov    %rdx,0x15268(%rbx)
   140130ea8:	mov    0x1070(%rbx),%rdx
   140130eaf:	sub    0x1068(%rbx),%rdx
   140130eb6:	sar    $0x3,%rdx
   140130eba:	mov    %rdx,%rcx
   140130ebd:	cmp    %rdx,%r11
   140130ec0:	jb     140128426 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e76>
   140130ec6:	mov    %eax,0x60(%rsp)
   140130eca:	add    %rdx,%rdx
   140130ecd:	lea    0x1068(%rbx),%rcx
   140130ed4:	mov    %r9,0x80(%rsp)
   140130edc:	mov    %r10d,0x40(%rsp)
   140130ee1:	vzeroupper
   140130ee4:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130ee9:	mov    0x80(%rsp),%r9
   140130ef1:	mov    0x60(%rsp),%eax
   140130ef5:	mov    0x40(%rsp),%r10d
   140130efa:	jmp    140128414 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3e64>
   140130eff:	nop
   140130f00:	cmp    $0x2,%sil
   140130f04:	je     1401331a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebf1>
   140130f0a:	mov    %r13,%rax
   140130f0d:	lea    -0x8(%r13),%r13
   140130f11:	mov    -0x8(%rax),%rax
   140130f15:	mov    %rax,0x300(%rsp)
   140130f1d:	jmp    140126dde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x282e>
   140130f22:	cmp    $0x2,%sil
   140130f26:	je     140133eb3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf903>
   140130f2c:	mov    %r13,%rax
   140130f2f:	lea    -0x8(%r13),%r13
   140130f33:	mov    -0x8(%rax),%rax
   140130f37:	mov    %rax,0x2f8(%rsp)
   140130f3f:	jmp    140126d50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27a0>
   140130f44:	mov    %eax,0x80(%rsp)
   140130f4b:	mov    0x40(%rsp),%rax
   140130f50:	lea    0x1068(%rbx),%rcx
   140130f57:	mov    %r8d,0xa0(%rsp)
   140130f5f:	lea    0x20(%rax),%rdx
   140130f63:	mov    %r10d,0x60(%rsp)
   140130f68:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140130f6d:	mov    0xa0(%rsp),%r8d
   140130f75:	mov    0x60(%rsp),%r10d
   140130f7a:	mov    0x80(%rsp),%eax
   140130f81:	jmp    140125383 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd3>
   140130f86:	cmp    $0x1,%sil
   140130f8a:	je     140133157 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeba7>
   140130f90:	mov    -0x8(%r13),%rdx
   140130f94:	mov    %r13,%rax
   140130f97:	lea    -0x10(%r13),%r13
   140130f9b:	mov    %rdx,0x3f0(%rsp)
   140130fa3:	mov    -0x10(%rax),%rdx
   140130fa7:	jmp    14012d44a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e9a>
   140130fac:	cmp    $0x1,%sil
   140130fb0:	je     14013312f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb7f>
   140130fb6:	mov    -0x8(%r13),%rdx
   140130fba:	mov    %r13,%rax
   140130fbd:	lea    -0x10(%r13),%r13
   140130fc1:	mov    %rdx,0x1e0(%rsp)
   140130fc9:	mov    -0x10(%rax),%rax
   140130fcd:	mov    %rax,0x1d8(%rsp)
   140130fd5:	jmp    140125d79 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17c9>
   140130fda:	cmp    $0x1,%sil
   140130fde:	je     140133179 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xebc9>
   140130fe4:	mov    -0x8(%r13),%rdx
   140130fe8:	mov    %r13,%rax
   140130feb:	lea    -0x10(%r13),%r13
   140130fef:	mov    %rdx,0x200(%rsp)
   140130ff7:	mov    -0x10(%rax),%rax
   140130ffb:	mov    %rax,0x1f8(%rsp)
   140131003:	jmp    140125ee5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1935>
   140131008:	mov    %r8,0x40(%rsp)
   14013100d:	lea    0x20(%r8),%rdx
   140131011:	lea    0x1080(%rbx),%rcx
   140131018:	vzeroupper
   14013101b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131020:	mov    0x40(%rsp),%r8
   140131025:	jmp    140125cf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1745>
   14013102a:	mov    %eax,0xa0(%rsp)
   140131031:	mov    0x60(%rsp),%rax
   140131036:	lea    0x1068(%rbx),%rcx
   14013103d:	mov    %r8d,0x80(%rsp)
   140131045:	lea    0x20(%rax),%rdx
   140131049:	mov    %r9d,0x40(%rsp)
   14013104e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140131053:	mov    0xa0(%rsp),%eax
   14013105a:	mov    0x40(%rsp),%r9d
   14013105f:	mov    0x80(%rsp),%r8d
   140131067:	jmp    14012557c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcc>
   14013106c:	cmp    $0x1,%sil
   140131070:	je     1401338c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf316>
   140131076:	mov    -0x8(%r13),%rdx
   14013107a:	mov    %r13,%rax
   14013107d:	lea    -0x10(%r13),%r13
   140131081:	mov    %rdx,0x2b0(%rsp)
   140131089:	mov    -0x10(%rax),%rax
   14013108d:	mov    %rax,0x2a8(%rsp)
   140131095:	jmp    140126724 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2174>
   14013109a:	cmp    $0x1,%sil
   14013109e:	je     140133b20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf570>
   1401310a4:	mov    -0x8(%r13),%rdx
   1401310a8:	mov    %r13,%rax
   1401310ab:	lea    -0x10(%r13),%r13
   1401310af:	mov    %rdx,0x2c0(%rsp)
   1401310b7:	mov    -0x10(%rax),%rax
   1401310bb:	mov    %rax,0x2b8(%rsp)
   1401310c3:	jmp    140126857 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22a7>
   1401310c8:	lea    0x20(%rdi),%rdx
   1401310cc:	lea    0x1080(%rbx),%rcx
   1401310d3:	vzeroupper
   1401310d6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401310db:	jmp    140125c54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16a4>
   1401310e0:	mov    %r9,0x60(%rsp)
   1401310e5:	lea    0x1d0(%rsp),%rcx
   1401310ed:	mov    %rdx,0x40(%rsp)
   1401310f2:	vzeroupper
   1401310f5:	call   14021c730 <setun::VMValue::payload() const>
   1401310fa:	mov    0x40(%rsp),%rdx
   1401310ff:	mov    0x60(%rsp),%r9
   140131104:	mov    0x48(%rax),%rax
   140131108:	test   %rax,%rax
   14013110b:	je     14012d438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e88>
   140131111:	mov    0x38(%rax),%r8
   140131115:	test   %r8,%r8
   140131118:	je     14012d438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e88>
   14013111e:	mov    (%r9),%ecx
   140131121:	cmp    %ecx,(%r8)
   140131124:	jne    14012d438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e88>
   14013112a:	test   %ecx,%ecx
   14013112c:	je     14012d438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e88>
   140131132:	mov    0x48(%rax),%rcx
   140131136:	mov    0x50(%rax),%rax
   14013113a:	movzwl 0x4(%r9),%r8d
   14013113f:	sub    %rcx,%rax
   140131142:	sar    $0x3,%rax
   140131146:	cmp    %rax,%r8
   140131149:	jae    14012d438 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e88>
   14013114f:	mov    0x1c8(%rsp),%rax
   140131157:	mov    %rax,(%rcx,%r8,8)
   14013115b:	cmpb   $0x0,0x1040(%rbx)
   140131162:	je     140134a7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104cb>
   140131168:	movzbl 0x2(%rdi),%eax
   14013116c:	lea    0x3(%rdi),%r12
   140131170:	lea    0x28ff29(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140131177:	xor    %esi,%esi
   140131179:	mov    (%rdi,%rax,8),%rax
   14013117d:	jmp    *%rax
   14013117f:	cmp    $0x1,%sil
   140131183:	je     140132ff9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea49>
   140131189:	mov    -0x8(%r13),%rdx
   14013118d:	mov    %r13,%rax
   140131190:	lea    -0x10(%r13),%r13
   140131194:	mov    %rdx,0x2d0(%rsp)
   14013119c:	mov    -0x10(%rax),%rax
   1401311a0:	mov    %rax,0x2c8(%rsp)
   1401311a8:	jmp    14012698a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23da>
   1401311ad:	mov    %r8d,0x80(%rsp)
   1401311b5:	lea    0x1068(%rbx),%rcx
   1401311bc:	mov    %r9d,0x60(%rsp)
   1401311c1:	mov    %eax,0xa0(%rsp)
   1401311c8:	mov    0x40(%rsp),%rax
   1401311cd:	lea    0x20(%rax),%rdx
   1401311d1:	vzeroupper
   1401311d4:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401311d9:	mov    0xa0(%rsp),%eax
   1401311e0:	mov    0x80(%rsp),%r8d
   1401311e8:	mov    0x60(%rsp),%r9d
   1401311ed:	jmp    14012850a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f5a>
   1401311f2:	cmp    $0x1,%sil
   1401311f6:	je     140133740 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf190>
   1401311fc:	mov    -0x8(%r13),%rdx
   140131200:	mov    %r13,%rax
   140131203:	movabs $0xfffd000000000000,%rcx
   14013120d:	lea    -0x10(%r13),%r13
   140131211:	mov    %rdx,0x310(%rsp)
   140131219:	mov    -0x10(%rax),%rax
   14013121d:	movabs $0xffff000000000000,%rdx
   140131227:	and    %rax,%rdx
   14013122a:	mov    %rax,0x308(%rsp)
   140131232:	cmp    %rcx,%rdx
   140131235:	je     14012cd2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x877d>
   14013123b:	test   %sil,%sil
   14013123e:	je     14012ad92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67e2>
   140131244:	jmp    14012e5d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa025>
   140131249:	nopl   0x0(%rax)
   140131250:	movabs $0xffffffff00000000,%rax
   14013125a:	mov    -0x8(%r13),%rdx
   14013125e:	movabs $0xfffd000200000000,%rcx
   140131268:	and    %rdx,%rax
   14013126b:	cmp    %rcx,%rax
   14013126e:	je     140136443 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e93>
   140131274:	movabs $0xfffb000000000000,%rax
   14013127e:	movabs $0xffff000000000000,%rdx
   140131288:	movabs $0xfffd000000000000,%rcx
   140131292:	mov    %rax,0x3e0(%rsp)
   14013129a:	mov    %r13,%rax
   14013129d:	lea    -0x8(%r13),%r13
   1401312a1:	mov    -0x8(%rax),%rax
   1401312a5:	and    %rax,%rdx
   1401312a8:	mov    %rax,0x3e0(%rsp)
   1401312b0:	cmp    %rcx,%rdx
   1401312b3:	je     14012e486 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed6>
   1401312b9:	jmp    1401297a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x51f2>
   1401312be:	cmp    $0x1,%sil
   1401312c2:	je     140133942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf392>
   1401312c8:	mov    -0x8(%r13),%rdx
   1401312cc:	mov    %r13,%rax
   1401312cf:	lea    -0x10(%r13),%r13
   1401312d3:	mov    %rdx,0x220(%rsp)
   1401312db:	mov    -0x10(%rax),%rax
   1401312df:	mov    %rax,0x218(%rsp)
   1401312e7:	jmp    140126026 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a76>
   1401312ec:	cmp    $0x1,%sil
   1401312f0:	je     1401342ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd3f>
   1401312f6:	mov    -0x8(%r13),%rdx
   1401312fa:	mov    %r13,%rax
   1401312fd:	lea    -0x10(%r13),%r13
   140131301:	mov    %rdx,0x210(%rsp)
   140131309:	mov    -0x10(%rax),%rax
   14013130d:	mov    %rax,0x208(%rsp)
   140131315:	jmp    140125f9b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19eb>
   14013131a:	cmp    $0x1,%sil
   14013131e:	je     140133f31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf981>
   140131324:	mov    -0x8(%r13),%rdx
   140131328:	mov    %r13,%rax
   14013132b:	lea    -0x10(%r13),%r13
   14013132f:	mov    %rdx,0x2e0(%rsp)
   140131337:	mov    -0x10(%rax),%rax
   14013133b:	mov    %rax,0x2d8(%rsp)
   140131343:	jmp    140126abd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x250d>
   140131348:	vzeroupper
   14013134b:	jmp    1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140131350:	mov    %rcx,%rdx
   140131353:	lea    0x1048(%rbx),%rcx
   14013135a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013135f:	mov    0x1048(%rbx),%r11
   140131366:	mov    0x1050(%rbx),%rax
   14013136d:	jmp    14012e213 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9c63>
   140131372:	cmp    $0x1,%sil
   140131376:	je     140133d51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7a1>
   14013137c:	mov    -0x8(%r13),%rdx
   140131380:	mov    %r13,%rax
   140131383:	lea    -0x10(%r13),%r13
   140131387:	mov    %rdx,0x1f0(%rsp)
   14013138f:	mov    -0x10(%rax),%rax
   140131393:	mov    %rax,0x1e8(%rsp)
   14013139b:	jmp    140125e2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x187f>
   1401313a0:	cmp    $0x1,%sil
   1401313a4:	je     140133049 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea99>
   1401313aa:	mov    -0x8(%r13),%rdx
   1401313ae:	mov    %r13,%rax
   1401313b1:	lea    -0x10(%r13),%r13
   1401313b5:	mov    %rdx,0x2f0(%rsp)
   1401313bd:	mov    -0x10(%rax),%rax
   1401313c1:	mov    %rax,0x2e8(%rsp)
   1401313c9:	jmp    140126bf0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2640>
   1401313ce:	cmp    $0x1,%sil
   1401313d2:	je     140133a0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf45c>
   1401313d8:	mov    -0x8(%r13),%rdx
   1401313dc:	mov    %r13,%rax
   1401313df:	lea    -0x10(%r13),%r13
   1401313e3:	mov    %rdx,0x290(%rsp)
   1401313eb:	mov    -0x10(%rax),%rax
   1401313ef:	mov    %rax,0x288(%rsp)
   1401313f7:	jmp    1401264cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f1f>
   1401313fc:	cmp    $0x1,%sil
   140131400:	je     140133edd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf92d>
   140131406:	mov    -0x8(%r13),%rdx
   14013140a:	mov    %r13,%rax
   14013140d:	lea    -0x10(%r13),%r13
   140131411:	mov    %rdx,0x260(%rsp)
   140131419:	mov    -0x10(%rax),%rax
   14013141d:	mov    %rax,0x258(%rsp)
   140131425:	jmp    140126252 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ca2>
   14013142a:	lea    0x8(%rcx),%rdx
   14013142e:	lea    0x48(%rcx),%r11
   140131432:	mov    %rdx,0x15268(%rbx)
   140131439:	mov    0x1070(%rbx),%rdx
   140131440:	sub    0x1068(%rbx),%rdx
   140131447:	sar    $0x3,%rdx
   14013144b:	mov    %rdx,%rcx
   14013144e:	cmp    %rdx,%r11
   140131451:	jae    1401361b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c04>
   140131457:	vzeroupper
   14013145a:	jmp    140125378 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc8>
   14013145f:	cmp    $0x1,%sil
   140131463:	je     140133021 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea71>
   140131469:	mov    -0x8(%r13),%rdx
   14013146d:	mov    %r13,%rax
   140131470:	lea    -0x10(%r13),%r13
   140131474:	mov    %rdx,0x280(%rsp)
   14013147c:	mov    -0x10(%rax),%rax
   140131480:	mov    %rax,0x278(%rsp)
   140131488:	jmp    1401263af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1dff>
   14013148d:	lea    0x8(%rcx),%rdx
   140131491:	lea    0x48(%rcx),%r10
   140131495:	mov    %rdx,0x15268(%rbx)
   14013149c:	mov    0x1070(%rbx),%rdx
   1401314a3:	sub    0x1068(%rbx),%rdx
   1401314aa:	sar    $0x3,%rdx
   1401314ae:	mov    %rdx,%rcx
   1401314b1:	cmp    %rdx,%r10
   1401314b4:	jb     1401284ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f4f>
   1401314ba:	mov    %r9d,0x60(%rsp)
   1401314bf:	add    %rdx,%rdx
   1401314c2:	lea    0x1068(%rbx),%rcx
   1401314c9:	mov    %eax,0xa0(%rsp)
   1401314d0:	mov    %r8d,0x80(%rsp)
   1401314d8:	vzeroupper
   1401314db:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401314e0:	mov    0xa0(%rsp),%eax
   1401314e7:	mov    0x80(%rsp),%r8d
   1401314ef:	mov    0x60(%rsp),%r9d
   1401314f4:	jmp    1401284ed <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3f3d>
   1401314f9:	nopl   0x0(%rax)
   140131500:	cmp    $0x1,%sil
   140131504:	je     140134111 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb61>
   14013150a:	mov    -0x8(%r13),%rdx
   14013150e:	mov    %r13,%rax
   140131511:	lea    -0x10(%r13),%r13
   140131515:	mov    %rdx,0x240(%rsp)
   14013151d:	mov    -0x10(%rax),%rax
   140131521:	mov    %rax,0x238(%rsp)
   140131529:	jmp    14012613c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b8c>
   14013152e:	cmp    $0x1,%sil
   140131532:	je     140133f59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9a9>
   140131538:	mov    -0x8(%r13),%rdx
   14013153c:	mov    %r13,%rax
   14013153f:	lea    -0x10(%r13),%r13
   140131543:	mov    %rdx,0x230(%rsp)
   14013154b:	mov    -0x10(%rax),%rax
   14013154f:	mov    %rax,0x228(%rsp)
   140131557:	jmp    1401260b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b01>
   14013155c:	lea    0x20(%rdi),%rdx
   140131560:	lea    0x1068(%rbx),%rcx
   140131567:	vzeroupper
   14013156a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013156f:	jmp    140125b3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x158f>
   140131574:	mov    0x1050(%rbx),%rax
   14013157b:	sub    %r11,%rax
   14013157e:	cmp    %rdx,%rax
   140131581:	jb     14013396a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3ba>
   140131587:	mov    %rdi,0x1060(%rbx)
   14013158e:	mov    0x152a0(%rbx),%rax
   140131595:	cmp    %rax,0x68(%rcx)
   140131599:	jae    140135f9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119ed>
   14013159f:	mov    0x1060(%rbx),%rax
   1401315a6:	mov    0x1048(%rbx),%r11
   1401315ad:	lea    (%r11,%rax,8),%r13
   1401315b1:	jmp    14012741b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2e6b>
   1401315b6:	cmp    $0x1,%sil
   1401315ba:	je     1401338ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf33e>
   1401315c0:	mov    -0x8(%r13),%rdx
   1401315c4:	mov    %r13,%rax
   1401315c7:	lea    -0x10(%r13),%r13
   1401315cb:	mov    %rdx,0x3d0(%rsp)
   1401315d3:	mov    -0x10(%rax),%rax
   1401315d7:	mov    %rax,0x3c8(%rsp)
   1401315df:	jmp    140129604 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5054>
   1401315e4:	lea    0x8(%rcx),%rdx
   1401315e8:	lea    0x48(%rcx),%r10
   1401315ec:	mov    %rdx,0x15268(%rbx)
   1401315f3:	mov    0x1070(%rbx),%rdx
   1401315fa:	sub    0x1068(%rbx),%rdx
   140131601:	sar    $0x3,%rdx
   140131605:	mov    %rdx,%rcx
   140131608:	cmp    %rdx,%r10
   14013160b:	jae    140135426 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e76>
   140131611:	vzeroupper
   140131614:	jmp    140125571 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc1>
   140131619:	lea    0x8(%r9),%rax
   14013161d:	mov    0x1070(%rbx),%rdx
   140131624:	sub    0x1068(%rbx),%rdx
   14013162b:	mov    %rax,0x15268(%rbx)
   140131632:	sar    $0x3,%rdx
   140131636:	lea    0x48(%r9),%rax
   14013163a:	cmp    %rdx,%rax
   14013163d:	jb     140128b10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4560>
   140131643:	mov    %r8,0x60(%rsp)
   140131648:	add    %rdx,%rdx
   14013164b:	lea    0x1068(%rbx),%rcx
   140131652:	mov    %r9,0x40(%rsp)
   140131657:	vzeroupper
   14013165a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013165f:	mov    0x60(%rsp),%r8
   140131664:	mov    0x40(%rsp),%r9
   140131669:	jmp    140128b10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4560>
   14013166e:	xchg   %ax,%ax
   140131670:	cmp    $0x1,%sil
   140131674:	je     140133ac3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf513>
   14013167a:	mov    -0x8(%r13),%rdx
   14013167e:	mov    %r13,%rax
   140131681:	lea    -0x10(%r13),%r13
   140131685:	mov    %rdx,0x250(%rsp)
   14013168d:	mov    -0x10(%rax),%rax
   140131691:	mov    %rax,0x248(%rsp)
   140131699:	jmp    1401261c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c17>
   14013169e:	mov    %r8d,0x60(%rsp)
   1401316a3:	add    %rdx,%rdx
   1401316a6:	lea    0x1068(%rbx),%rcx
   1401316ad:	mov    %rax,0x40(%rsp)
   1401316b2:	vzeroupper
   1401316b5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401316ba:	mov    0x60(%rsp),%r8d
   1401316bf:	mov    0x40(%rsp),%rax
   1401316c4:	jmp    140127288 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2cd8>
   1401316c9:	mov    0x1050(%rbx),%rax
   1401316d0:	sub    %r11,%rax
   1401316d3:	cmp    %rdx,%rax
   1401316d6:	jb     140133d32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf782>
   1401316dc:	mov    %rdi,0x1060(%rbx)
   1401316e3:	mov    0x152a0(%rbx),%rax
   1401316ea:	cmp    %rax,0x68(%rcx)
   1401316ee:	jae    1401364f7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f47>
   1401316f4:	mov    0x1060(%rbx),%rax
   1401316fb:	mov    0x1048(%rbx),%r11
   140131702:	lea    (%r11,%rax,8),%r13
   140131706:	jmp    140127309 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2d59>
   14013170b:	cmp    $0x1,%sil
   14013170f:	je     140132fd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea21>
   140131715:	mov    -0x8(%r13),%rdx
   140131719:	mov    %r13,%rax
   14013171c:	lea    -0x10(%r13),%r13
   140131720:	mov    %rdx,0x370(%rsp)
   140131728:	mov    -0x10(%rax),%rax
   14013172c:	mov    %rax,0x368(%rsp)
   140131734:	jmp    140128efa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494a>
   140131739:	cmp    $0x1,%sil
   14013173d:	je     140133071 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeac1>
   140131743:	mov    -0x8(%r13),%rdx
   140131747:	mov    %r13,%rax
   14013174a:	lea    -0x10(%r13),%r13
   14013174e:	mov    %rdx,0x2a0(%rsp)
   140131756:	mov    -0x10(%rax),%rax
   14013175a:	mov    %rax,0x298(%rsp)
   140131762:	jmp    1401265ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x203f>
   140131767:	cmp    $0x1,%sil
   14013176b:	je     140133b48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf598>
   140131771:	mov    -0x8(%r13),%rdx
   140131775:	mov    %r13,%rax
   140131778:	lea    -0x10(%r13),%r13
   14013177c:	mov    %rdx,0x270(%rsp)
   140131784:	mov    -0x10(%rax),%rax
   140131788:	mov    %rax,0x268(%rsp)
   140131790:	jmp    1401262dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d2d>
   140131795:	mov    %r8,0x40(%rsp)
   14013179a:	lea    0x20(%rdi),%rdx
   14013179e:	lea    0x1068(%rbx),%rcx
   1401317a5:	vzeroupper
   1401317a8:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401317ad:	mov    0x40(%rsp),%r8
   1401317b2:	jmp    140125bef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x163f>
   1401317b7:	mov    0x1070(%rbx),%rdx
   1401317be:	lea    0x8(%rdi),%rax
   1401317c2:	lea    0x48(%rdi),%rcx
   1401317c6:	sub    0x1068(%rbx),%rdx
   1401317cd:	sar    $0x3,%rdx
   1401317d1:	mov    %rax,0x15268(%rbx)
   1401317d8:	mov    %rdx,%rax
   1401317db:	cmp    %rdx,%rcx
   1401317de:	jb     140125be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1636>
   1401317e4:	mov    %r8,0x40(%rsp)
   1401317e9:	add    %rdx,%rdx
   1401317ec:	lea    0x1068(%rbx),%rcx
   1401317f3:	vzeroupper
   1401317f6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401317fb:	mov    0x40(%rsp),%r8
   140131800:	jmp    140125bd4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1624>
   140131805:	nopl   (%rax)
   140131808:	cmp    $0x2,%sil
   14013180c:	je     1401332af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecff>
   140131812:	sub    $0x8,%r13
   140131816:	jmp    140125a8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14de>
   14013181b:	mov    %r9,0x40(%rsp)
   140131820:	lea    0x400(%rsp),%rcx
   140131828:	lea    0x3e0(%rsp),%rdx
   140131830:	vzeroupper
   140131833:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   140131838:	mov    0x40(%rsp),%r9
   14013183d:	lea    0x22b27a(%rip),%rdx        # 14035cabe <.rdata+0x4fe>
   140131844:	movzwl 0x6(%r9),%eax
   140131849:	shl    $0x5,%rax
   14013184d:	add    0x30(%r14),%rax
   140131851:	mov    %rax,%rcx
   140131854:	mov    %rax,%rdi
   140131857:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14013185c:	test   %al,%al
   14013185e:	jne    1401327bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe20f>
   140131864:	lea    0x22b257(%rip),%rdx        # 14035cac2 <.rdata+0x502>
   14013186b:	mov    %rdi,%rcx
   14013186e:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   140131873:	test   %al,%al
   140131875:	jne    1401327bf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe20f>
   14013187b:	lea    0x22b26c(%rip),%rdx        # 14035caee <.rdata+0x52e>
   140131882:	mov    %rdi,%rcx
   140131885:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   14013188a:	test   %al,%al
   14013188c:	jne    1401360f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b45>
   140131892:	lea    0x22b257(%rip),%rdx        # 14035caf0 <.rdata+0x530>
   140131899:	mov    %rdi,%rcx
   14013189c:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401318a1:	test   %al,%al
   1401318a3:	jne    1401360f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b45>
   1401318a9:	lea    0x22b242(%rip),%rdx        # 14035caf2 <.rdata+0x532>
   1401318b0:	mov    %rdi,%rcx
   1401318b3:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401318b8:	test   %al,%al
   1401318ba:	jne    140137530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f80>
   1401318c0:	lea    0x22b22d(%rip),%rdx        # 14035caf4 <.rdata+0x534>
   1401318c7:	mov    %rdi,%rcx
   1401318ca:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401318cf:	test   %al,%al
   1401318d1:	jne    140137530 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f80>
   1401318d7:	lea    0x22b218(%rip),%rdx        # 14035caf6 <.rdata+0x536>
   1401318de:	mov    %rdi,%rcx
   1401318e1:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401318e6:	test   %al,%al
   1401318e8:	jne    1401374bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f0b>
   1401318ee:	lea    0x22b203(%rip),%rdx        # 14035caf8 <.rdata+0x538>
   1401318f5:	mov    %rdi,%rcx
   1401318f8:	call   1403306a0 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, char const*)>
   1401318fd:	test   %al,%al
   1401318ff:	jne    1401374bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f0b>
   140131905:	test   %sil,%sil
   140131908:	jne    14013723f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c8f>
   14013190e:	mov    $0x1fff,%eax
   140131913:	mov    $0x1,%esi
   140131918:	shl    $0x33,%rax
   14013191c:	mov    %rax,0x1c8(%rsp)
   140131924:	cmpb   $0x0,0x1040(%rbx)
   14013192b:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140131931:	mov    %r12,%rax
   140131934:	lea    0x28f765(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013193b:	lea    0x1(%r12),%r12
   140131940:	movzbl (%rax),%eax
   140131943:	jmp    *(%rdi,%rax,8)
   140131946:	shr    $0x20,%rdx
   14013194a:	mov    %edx,%ecx
   14013194c:	test   %dx,%dx
   14013194f:	jne    14012f22f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac7f>
   140131955:	lea    0x710(%rsp),%rcx
   14013195d:	lea    0x2c0(%rsp),%rdx
   140131965:	vzeroupper
   140131968:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013196d:	lea    0x2b8(%rsp),%rdx
   140131975:	lea    0x540(%rsp),%rcx
   14013197d:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131982:	mov    0x540(%rsp),%rdi
   14013198a:	mov    0x718(%rsp),%r9
   140131992:	mov    0x710(%rsp),%r8
   14013199a:	mov    0x548(%rsp),%rdx
   1401319a2:	mov    %rdi,%rcx
   1401319a5:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401319aa:	mov    %eax,0x40(%rsp)
   1401319ae:	lea    0x550(%rsp),%rax
   1401319b6:	cmp    %rax,%rdi
   1401319b9:	je     1401319cf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd41f>
   1401319bb:	mov    0x550(%rsp),%rax
   1401319c3:	mov    %rdi,%rcx
   1401319c6:	lea    0x1(%rax),%rdx
   1401319ca:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401319cf:	mov    0x710(%rsp),%rcx
   1401319d7:	lea    0x720(%rsp),%rax
   1401319df:	cmp    %rax,%rcx
   1401319e2:	je     1401319f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd445>
   1401319e4:	mov    0x720(%rsp),%rax
   1401319ec:	lea    0x1(%rax),%rdx
   1401319f0:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401319f5:	mov    0x40(%rsp),%eax
   1401319f9:	shr    $0x1f,%eax
   1401319fc:	jmp    14012690c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x235c>
   140131a01:	mov    %rdx,%rax
   140131a04:	shr    $0x20,%rax
   140131a08:	cmp    $0x5,%ax
   140131a0c:	je     1401268e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2336>
   140131a12:	movabs $0xffffffff00000000,%rax
   140131a1c:	and    %r8,%rax
   140131a1f:	jmp    14012f20d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac5d>
   140131a24:	lea    0x710(%rsp),%rcx
   140131a2c:	lea    0x330(%rsp),%rdx
   140131a34:	vzeroupper
   140131a37:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   140131a3c:	mov    0x710(%rsp),%rax
   140131a44:	lea    0x338(%rsp),%rcx
   140131a4c:	mov    0x720(%rsp),%edi
   140131a53:	mov    %rax,0x60(%rsp)
   140131a58:	mov    0x718(%rsp),%rax
   140131a60:	mov    %rax,0x40(%rsp)
   140131a65:	call   14021b2c0 <setun::VMValue::as_int() const>
   140131a6a:	test   %rax,%rax
   140131a6d:	jne    1401335af <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefff>
   140131a73:	mov    0x60(%rsp),%rdx
   140131a78:	test   %sil,%sil
   140131a7b:	je     140135b47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11597>
   140131a81:	cmp    $0x1,%sil
   140131a85:	je     140137fff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a4f>
   140131a8b:	lea    0x8(%r13),%rax
   140131a8f:	cmp    0x30(%rsp),%rax
   140131a94:	jae    140137fce <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a1e>
   140131a9a:	mov    0x1d0(%rsp),%rdx
   140131aa2:	mov    %r13,%rax
   140131aa5:	lea    0x8(%r13),%r13
   140131aa9:	mov    %rdx,(%rax)
   140131aac:	mov    0x1c8(%rsp),%rax
   140131ab4:	mov    0x60(%rsp),%rdx
   140131ab9:	mov    %rax,0x1d0(%rsp)
   140131ac1:	lea    0x540(%rsp),%rcx
   140131ac9:	mov    $0x2,%esi
   140131ace:	call   140210640 <setun::VMValue::VMValue(long long)>
   140131ad3:	mov    0x540(%rsp),%rax
   140131adb:	mov    %rax,0x1c8(%rsp)
   140131ae3:	jmp    140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   140131ae8:	lea    0x710(%rsp),%rcx
   140131af0:	lea    0x308(%rsp),%rdx
   140131af8:	vzeroupper
   140131afb:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   140131b00:	mov    0x710(%rsp),%rax
   140131b08:	lea    0x310(%rsp),%rcx
   140131b10:	mov    0x720(%rsp),%edi
   140131b17:	mov    %rax,0x60(%rsp)
   140131b1c:	mov    0x718(%rsp),%rax
   140131b24:	mov    %rax,0x40(%rsp)
   140131b29:	call   14021b2c0 <setun::VMValue::as_int() const>
   140131b2e:	test   %rax,%rax
   140131b31:	jne    140132e70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8c0>
   140131b37:	test   %sil,%sil
   140131b3a:	je     1401363b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e09>
   140131b40:	cmp    $0x1,%sil
   140131b44:	je     140137cf3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13743>
   140131b4a:	lea    0x8(%r13),%rax
   140131b4e:	cmp    0x30(%rsp),%rax
   140131b53:	jae    140137be4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13634>
   140131b59:	mov    0x1d0(%rsp),%rdx
   140131b61:	mov    %r13,%rax
   140131b64:	lea    0x8(%r13),%r13
   140131b68:	mov    %rdx,(%rax)
   140131b6b:	mov    0x1c8(%rsp),%rax
   140131b73:	mov    0x60(%rsp),%rdx
   140131b78:	mov    %rax,0x1d0(%rsp)
   140131b80:	lea    0x540(%rsp),%rcx
   140131b88:	mov    $0x2,%esi
   140131b8d:	call   140210640 <setun::VMValue::VMValue(long long)>
   140131b92:	mov    0x540(%rsp),%rax
   140131b9a:	mov    %rax,0x1c8(%rsp)
   140131ba2:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   140131ba7:	shr    $0x20,%rdx
   140131bab:	mov    %edx,%r8d
   140131bae:	test   %dx,%dx
   140131bb1:	jne    140132cd3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe723>
   140131bb7:	lea    0x710(%rsp),%rcx
   140131bbf:	lea    0x3a0(%rsp),%rdx
   140131bc7:	vzeroupper
   140131bca:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131bcf:	lea    0x398(%rsp),%rdx
   140131bd7:	lea    0x540(%rsp),%rcx
   140131bdf:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131be4:	mov    0x540(%rsp),%rcx
   140131bec:	mov    0x718(%rsp),%r9
   140131bf4:	mov    0x710(%rsp),%r8
   140131bfc:	mov    0x548(%rsp),%rdx
   140131c04:	mov    %rcx,0x60(%rsp)
   140131c09:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131c0e:	mov    0x60(%rsp),%rcx
   140131c13:	mov    %eax,0x40(%rsp)
   140131c17:	lea    0x550(%rsp),%rax
   140131c1f:	cmp    %rax,%rcx
   140131c22:	je     140131c35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd685>
   140131c24:	mov    0x550(%rsp),%rax
   140131c2c:	lea    0x1(%rax),%rdx
   140131c30:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131c35:	mov    0x710(%rsp),%rcx
   140131c3d:	lea    0x720(%rsp),%rax
   140131c45:	cmp    %rax,%rcx
   140131c48:	je     140131c5b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6ab>
   140131c4a:	mov    0x720(%rsp),%rax
   140131c52:	lea    0x1(%rax),%rdx
   140131c56:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131c5b:	mov    0x40(%rsp),%r11d
   140131c60:	test   %r11d,%r11d
   140131c63:	setle  %al
   140131c66:	jmp    1401292c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d10>
   140131c6b:	shr    $0x20,%rdx
   140131c6f:	mov    %edx,%r8d
   140131c72:	test   %dx,%dx
   140131c75:	jne    140132f36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe986>
   140131c7b:	lea    0x710(%rsp),%rcx
   140131c83:	lea    0x3c0(%rsp),%rdx
   140131c8b:	vzeroupper
   140131c8e:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131c93:	lea    0x3b8(%rsp),%rdx
   140131c9b:	lea    0x540(%rsp),%rcx
   140131ca3:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131ca8:	mov    0x540(%rsp),%rcx
   140131cb0:	mov    0x718(%rsp),%r9
   140131cb8:	mov    0x710(%rsp),%r8
   140131cc0:	mov    0x548(%rsp),%rdx
   140131cc8:	mov    %rcx,0x60(%rsp)
   140131ccd:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131cd2:	mov    0x60(%rsp),%rcx
   140131cd7:	mov    %eax,0x40(%rsp)
   140131cdb:	lea    0x550(%rsp),%rax
   140131ce3:	cmp    %rax,%rcx
   140131ce6:	je     140131cf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd749>
   140131ce8:	mov    0x550(%rsp),%rax
   140131cf0:	lea    0x1(%rax),%rdx
   140131cf4:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131cf9:	mov    0x710(%rsp),%rcx
   140131d01:	lea    0x720(%rsp),%rax
   140131d09:	cmp    %rax,%rcx
   140131d0c:	je     140131d1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd76f>
   140131d0e:	mov    0x720(%rsp),%rax
   140131d16:	lea    0x1(%rax),%rdx
   140131d1a:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131d1f:	mov    0x40(%rsp),%r10d
   140131d24:	test   %r10d,%r10d
   140131d27:	setg   %al
   140131d2a:	jmp    14012958a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fda>
   140131d2f:	shr    $0x20,%rdx
   140131d33:	mov    %edx,%r8d
   140131d36:	test   %dx,%dx
   140131d39:	jne    140132f69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9b9>
   140131d3f:	lea    0x710(%rsp),%rcx
   140131d47:	lea    0x390(%rsp),%rdx
   140131d4f:	vzeroupper
   140131d52:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131d57:	lea    0x388(%rsp),%rdx
   140131d5f:	lea    0x540(%rsp),%rcx
   140131d67:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131d6c:	mov    0x540(%rsp),%rcx
   140131d74:	mov    0x718(%rsp),%r9
   140131d7c:	mov    0x710(%rsp),%r8
   140131d84:	mov    0x548(%rsp),%rdx
   140131d8c:	mov    %rcx,0x60(%rsp)
   140131d91:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140131d96:	mov    0x60(%rsp),%rcx
   140131d9b:	mov    %eax,0x40(%rsp)
   140131d9f:	lea    0x550(%rsp),%rax
   140131da7:	cmp    %rax,%rcx
   140131daa:	je     140131dbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd80d>
   140131dac:	mov    0x550(%rsp),%rax
   140131db4:	lea    0x1(%rax),%rdx
   140131db8:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131dbd:	mov    0x710(%rsp),%rcx
   140131dc5:	lea    0x720(%rsp),%rax
   140131dcd:	cmp    %rax,%rcx
   140131dd0:	je     140131de3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd833>
   140131dd2:	mov    0x720(%rsp),%rax
   140131dda:	lea    0x1(%rax),%rdx
   140131dde:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131de3:	mov    0x40(%rsp),%eax
   140131de7:	shr    $0x1f,%eax
   140131dea:	jmp    14012915c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4bac>
   140131def:	add    0x548(%rsp),%rdi
   140131df7:	jns    14012d54c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8f9c>
   140131dfd:	test   %sil,%sil
   140131e00:	je     140133dda <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf82a>
   140131e06:	cmp    $0x1,%sil
   140131e0a:	je     140131e2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd87d>
   140131e0c:	lea    0x8(%r13),%rax
   140131e10:	cmp    0x30(%rsp),%rax
   140131e15:	jae    140138a65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144b5>
   140131e1b:	mov    0x1d0(%rsp),%rdx
   140131e23:	mov    %r13,%rax
   140131e26:	lea    0x8(%r13),%r13
   140131e2a:	mov    %rdx,(%rax)
   140131e2d:	mov    0x1c8(%rsp),%rax
   140131e35:	lea    0x710(%rsp),%rcx
   140131e3d:	lea    0x22ac79(%rip),%rdx        # 14035cabd <.rdata+0x4fd>
   140131e44:	mov    %rax,0x1d0(%rsp)
   140131e4c:	call   14020f640 <setun::VMValue::VMValue(char const*)>
   140131e51:	mov    0x710(%rsp),%rax
   140131e59:	mov    %rax,0x1c8(%rsp)
   140131e61:	jmp    14012d615 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9065>
   140131e66:	add    0x548(%rsp),%rdi
   140131e6e:	jns    14012cd75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87c5>
   140131e74:	test   %sil,%sil
   140131e77:	je     140133989 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3d9>
   140131e7d:	cmp    $0x1,%sil
   140131e81:	je     140131ea4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8f4>
   140131e83:	lea    0x8(%r13),%rax
   140131e87:	cmp    0x30(%rsp),%rax
   140131e8c:	jae    140136aee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1253e>
   140131e92:	mov    0x1d0(%rsp),%rdx
   140131e9a:	mov    %r13,%rax
   140131e9d:	lea    0x8(%r13),%r13
   140131ea1:	mov    %rdx,(%rax)
   140131ea4:	mov    0x1c8(%rsp),%rax
   140131eac:	lea    0x710(%rsp),%rcx
   140131eb4:	lea    0x22ac02(%rip),%rdx        # 14035cabd <.rdata+0x4fd>
   140131ebb:	mov    %rax,0x1d0(%rsp)
   140131ec3:	call   14020f640 <setun::VMValue::VMValue(char const*)>
   140131ec8:	mov    0x710(%rsp),%rax
   140131ed0:	mov    %rax,0x1c8(%rsp)
   140131ed8:	jmp    14012ce3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x888e>
   140131edd:	shr    $0x20,%rcx
   140131ee1:	mov    %ecx,%edx
   140131ee3:	test   %cx,%cx
   140131ee6:	jne    14012f34f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad9f>
   140131eec:	lea    0x710(%rsp),%r10
   140131ef4:	lea    0x2a0(%rsp),%rdx
   140131efc:	mov    %r10,0x60(%rsp)
   140131f01:	mov    %r10,%rcx
   140131f04:	vzeroupper
   140131f07:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131f0c:	lea    0x540(%rsp),%rax
   140131f14:	lea    0x298(%rsp),%rdx
   140131f1c:	mov    %rax,%rcx
   140131f1f:	mov    %rax,0x40(%rsp)
   140131f24:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131f29:	mov    0x40(%rsp),%rcx
   140131f2e:	mov    0x60(%rsp),%rdx
   140131f33:	call   140330700 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131f38:	mov    0x540(%rsp),%rcx
   140131f40:	mov    %eax,%edi
   140131f42:	lea    0x550(%rsp),%rax
   140131f4a:	cmp    %rax,%rcx
   140131f4d:	je     140131f60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9b0>
   140131f4f:	mov    0x550(%rsp),%rax
   140131f57:	lea    0x1(%rax),%rdx
   140131f5b:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131f60:	mov    0x710(%rsp),%rcx
   140131f68:	lea    0x720(%rsp),%rax
   140131f70:	cmp    %rax,%rcx
   140131f73:	je     1401266a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20f5>
   140131f79:	mov    0x720(%rsp),%rax
   140131f81:	lea    0x1(%rax),%rdx
   140131f85:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140131f8a:	jmp    1401266a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20f5>
   140131f8f:	shr    $0x20,%rax
   140131f93:	mov    %eax,%edx
   140131f95:	test   %ax,%ax
   140131f98:	jne    140132e2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe87e>
   140131f9e:	lea    0x710(%rsp),%r10
   140131fa6:	lea    0x2b0(%rsp),%rdx
   140131fae:	mov    %r10,0x60(%rsp)
   140131fb3:	mov    %r10,%rcx
   140131fb6:	vzeroupper
   140131fb9:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131fbe:	lea    0x540(%rsp),%rax
   140131fc6:	lea    0x2a8(%rsp),%rdx
   140131fce:	mov    %rax,%rcx
   140131fd1:	mov    %rax,0x40(%rsp)
   140131fd6:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140131fdb:	mov    0x40(%rsp),%rcx
   140131fe0:	mov    0x60(%rsp),%rdx
   140131fe5:	call   140330700 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140131fea:	mov    0x540(%rsp),%rcx
   140131ff2:	mov    %eax,%edi
   140131ff4:	lea    0x550(%rsp),%rax
   140131ffc:	cmp    %rax,%rcx
   140131fff:	je     140132012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda62>
   140132001:	mov    0x550(%rsp),%rax
   140132009:	lea    0x1(%rax),%rdx
   14013200d:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140132012:	mov    0x710(%rsp),%rcx
   14013201a:	lea    0x720(%rsp),%rax
   140132022:	cmp    %rax,%rcx
   140132025:	je     140132038 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xda88>
   140132027:	mov    0x720(%rsp),%rax
   14013202f:	lea    0x1(%rax),%rdx
   140132033:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140132038:	mov    %edi,%eax
   14013203a:	xor    $0x1,%eax
   14013203d:	jmp    1401267d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2229>
   140132042:	cmp    $0x2,%sil
   140132046:	jne    140126ff3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a43>
   14013204c:	mov    0x1c8(%rsp),%r9
   140132054:	sub    $0x8,%rax
   140132058:	mov    %r9,(%r8,%rcx,8)
   14013205c:	mov    0x1d0(%rsp),%rcx
   140132064:	mov    %rcx,0x1c8(%rsp)
   14013206c:	cmp    %rdx,%rax
   14013206f:	jne    140126fde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a2e>
   140132075:	mov    0x1048(%rbx),%r11
   14013207c:	lea    0x8(%r13),%rax
   140132080:	cmp    0x30(%rsp),%rax
   140132085:	jae    140136cd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12722>
   14013208b:	mov    0x1c8(%rsp),%rdx
   140132093:	mov    %r13,%rax
   140132096:	mov    0x1068(%rbx),%r8
   14013209d:	lea    0x8(%r13),%r13
   1401320a1:	mov    %rdx,(%rax)
   1401320a4:	jmp    140127012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a62>
   1401320a9:	cmp    $0x2,%sil
   1401320ad:	jne    140138c57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146a7>
   1401320b3:	mov    0x1048(%rbx),%r11
   1401320ba:	lea    0x10(%r13),%rax
   1401320be:	cmp    0x30(%rsp),%rax
   1401320c3:	jae    140138c2d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1467d>
   1401320c9:	mov    0x1d0(%rsp),%rdx
   1401320d1:	mov    %r13,%rax
   1401320d4:	mov    0x1068(%rbx),%r8
   1401320db:	lea    0x10(%r13),%r13
   1401320df:	mov    %rdx,-0x10(%r13)
   1401320e3:	mov    0x1c8(%rsp),%rdx
   1401320eb:	mov    %rdx,0x8(%rax)
   1401320ef:	jmp    140127012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a62>
   1401320f4:	mov    %rcx,%rax
   1401320f7:	shr    $0x20,%rax
   1401320fb:	cmp    $0x5,%ax
   1401320ff:	je     14012667e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x20ce>
   140132105:	movabs $0xffffffff00000000,%rax
   14013210f:	and    %r8,%rax
   140132112:	jmp    14012f32d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad7d>
   140132117:	shr    $0x20,%rdx
   14013211b:	mov    %edx,%r8d
   14013211e:	test   %dx,%dx
   140132121:	jne    140132dc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe814>
   140132127:	lea    0x710(%rsp),%rcx
   14013212f:	lea    0x3d0(%rsp),%rdx
   140132137:	vzeroupper
   14013213a:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013213f:	lea    0x3c8(%rsp),%rdx
   140132147:	lea    0x540(%rsp),%rcx
   14013214f:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140132154:	mov    0x540(%rsp),%rcx
   14013215c:	mov    0x718(%rsp),%r9
   140132164:	mov    0x710(%rsp),%r8
   14013216c:	mov    0x548(%rsp),%rdx
   140132174:	mov    %rcx,0x60(%rsp)
   140132179:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   14013217e:	mov    0x60(%rsp),%rcx
   140132183:	mov    %eax,0x40(%rsp)
   140132187:	lea    0x550(%rsp),%rax
   14013218f:	cmp    %rax,%rcx
   140132192:	je     1401321a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdbf5>
   140132194:	mov    0x550(%rsp),%rax
   14013219c:	lea    0x1(%rax),%rdx
   1401321a0:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401321a5:	mov    0x710(%rsp),%rcx
   1401321ad:	lea    0x720(%rsp),%rax
   1401321b5:	cmp    %rax,%rcx
   1401321b8:	je     1401321cb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc1b>
   1401321ba:	mov    0x720(%rsp),%rax
   1401321c2:	lea    0x1(%rax),%rdx
   1401321c6:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401321cb:	mov    0x40(%rsp),%eax
   1401321cf:	not    %eax
   1401321d1:	shr    $0x1f,%eax
   1401321d4:	jmp    1401296ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x513e>
   1401321d9:	movabs $0xffff000000000000,%rax
   1401321e3:	movb   $0xcd,-0x1(%rdi)
   1401321e7:	mov    (%r10),%rdx
   1401321ea:	and    %rdx,%rax
   1401321ed:	mov    %rax,%rcx
   1401321f0:	movabs $0xfffd000000000000,%rax
   1401321fa:	cmp    %rax,%rcx
   1401321fd:	je     1401343f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe42>
   140132203:	movabs $0xfff8000000000000,%rax
   14013220d:	cmp    %rax,%rcx
   140132210:	je     14013440a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe5a>
   140132216:	mov    %r10,%rcx
   140132219:	mov    %r11,0x80(%rsp)
   140132221:	mov    %r9,0x60(%rsp)
   140132226:	call   14021ca10 <setun::VMValue::as_float() const>
   14013222b:	mov    0x80(%rsp),%r11
   140132233:	mov    0x60(%rsp),%r9
   140132238:	movq   $0x0,0x508(%rsp)
   140132244:	vcvttsd2si %xmm0,%rax
   140132249:	movq   $0x0,0x510(%rsp)
   140132255:	mov    %rax,0x500(%rsp)
   14013225d:	lea    0x500(%rsp),%rax
   140132265:	mov    %rax,0xa0(%rsp)
   14013226d:	movabs $0xffff000000000000,%rcx
   140132277:	mov    (%r11),%rax
   14013227a:	movabs $0xfffd000000000000,%rdx
   140132284:	and    %rax,%rcx
   140132287:	cmp    %rdx,%rcx
   14013228a:	je     140133e5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8ad>
   140132290:	movabs $0xfff8000000000000,%rax
   14013229a:	cmp    %rax,%rcx
   14013229d:	je     140133e75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8c5>
   1401322a3:	mov    %r11,%rcx
   1401322a6:	mov    %r9,0x60(%rsp)
   1401322ab:	call   14021ca10 <setun::VMValue::as_float() const>
   1401322b0:	vcvttsd2si %xmm0,%rax
   1401322b5:	mov    %rax,0x520(%rsp)
   1401322bd:	mov    0x60(%rsp),%r9
   1401322c2:	lea    0x520(%rsp),%r8
   1401322ca:	movq   $0x0,0x528(%rsp)
   1401322d6:	movq   $0x0,0x530(%rsp)
   1401322e2:	movabs $0xffff000000000000,%rcx
   1401322ec:	mov    (%r9),%rax
   1401322ef:	movabs $0xfffd000000000000,%rdx
   1401322f9:	and    %rax,%rcx
   1401322fc:	cmp    %rdx,%rcx
   1401322ff:	je     14013426d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcbd>
   140132305:	movabs $0xfff8000000000000,%rax
   14013230f:	cmp    %rax,%rcx
   140132312:	je     140134285 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcd5>
   140132318:	mov    %r9,%rcx
   14013231b:	mov    %r8,0x60(%rsp)
   140132320:	call   14021ca10 <setun::VMValue::as_float() const>
   140132325:	vcvttsd2si %xmm0,%rax
   14013232a:	mov    0x60(%rsp),%r8
   14013232f:	mov    %rax,0x540(%rsp)
   140132337:	lea    0x540(%rsp),%rax
   14013233f:	movq   $0x0,0x548(%rsp)
   14013234b:	movq   $0x0,0x550(%rsp)
   140132357:	mov    %rax,0x80(%rsp)
   14013235f:	mov    0xa0(%rsp),%rdx
   140132367:	lea    0x710(%rsp),%rax
   14013236f:	mov    %rax,%rcx
   140132372:	mov    %rax,0x60(%rsp)
   140132377:	call   140010830 <setun::tafpu_mul(setun::TafpuNum const&, setun::TafpuNum const&)>
   14013237c:	mov    0x60(%rsp),%r8
   140132381:	mov    0x80(%rsp),%rdx
   140132389:	lea    0x4c0(%rsp),%rcx
   140132391:	call   1400102c0 <setun::tafpu_add(setun::TafpuNum const&, setun::TafpuNum const&)>
   140132396:	mov    0x4d0(%rsp),%rax
   14013239e:	vmovdqa 0x4c0(%rsp),%xmm7
   1401323a7:	lea    0x1a0(%rsp),%rdx
   1401323af:	mov    0x60(%rsp),%rcx
   1401323b4:	mov    %rax,0x1b0(%rsp)
   1401323bc:	vmovdqa %xmm7,0x1a0(%rsp)
   1401323c5:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401323ca:	mov    0x1068(%rbx),%rax
   1401323d1:	mov    0x40(%rsp),%rcx
   1401323d6:	mov    0x710(%rsp),%rdx
   1401323de:	mov    %rdx,(%rax,%rcx,8)
   1401323e2:	jmp    140125482 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed2>
   1401323e7:	cmp    $0x2,%sil
   1401323eb:	jne    14012f61b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb06b>
   1401323f1:	mov    0x1048(%rbx),%r11
   1401323f8:	lea    0x10(%r13),%rax
   1401323fc:	cmp    0x30(%rsp),%rax
   140132401:	jae    140135ed7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11927>
   140132407:	mov    0x1d0(%rsp),%rdx
   14013240f:	mov    %r13,%rax
   140132412:	lea    0x10(%r13),%r13
   140132416:	mov    %rdx,-0x10(%r13)
   14013241a:	mov    0x1c8(%rsp),%rdx
   140132422:	mov    %rdx,0x8(%rax)
   140132426:	jmp    14012dbfc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x964c>
   14013242b:	mov    0x278(%rsp),%rax
   140132433:	mov    %rax,0x1c8(%rsp)
   14013243b:	jmp    140126469 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1eb9>
   140132440:	shr    $0x20,%rdx
   140132444:	mov    %edx,%ecx
   140132446:	test   %dx,%dx
   140132449:	jne    14012f126 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab76>
   14013244f:	lea    0x710(%rsp),%rcx
   140132457:	lea    0x2f0(%rsp),%rdx
   14013245f:	vzeroupper
   140132462:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140132467:	lea    0x2e8(%rsp),%rdx
   14013246f:	lea    0x540(%rsp),%rcx
   140132477:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013247c:	mov    0x540(%rsp),%rdi
   140132484:	mov    0x718(%rsp),%r9
   14013248c:	mov    0x710(%rsp),%r8
   140132494:	mov    0x548(%rsp),%rdx
   14013249c:	mov    %rdi,%rcx
   14013249f:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401324a4:	mov    %eax,0x40(%rsp)
   1401324a8:	lea    0x550(%rsp),%rax
   1401324b0:	cmp    %rax,%rdi
   1401324b3:	je     1401324c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf19>
   1401324b5:	mov    0x550(%rsp),%rax
   1401324bd:	mov    %rdi,%rcx
   1401324c0:	lea    0x1(%rax),%rdx
   1401324c4:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401324c9:	mov    0x710(%rsp),%rcx
   1401324d1:	lea    0x720(%rsp),%rax
   1401324d9:	cmp    %rax,%rcx
   1401324dc:	je     1401324ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdf3f>
   1401324de:	mov    0x720(%rsp),%rax
   1401324e6:	lea    0x1(%rax),%rdx
   1401324ea:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401324ef:	mov    0x40(%rsp),%eax
   1401324f3:	not    %eax
   1401324f5:	shr    $0x1f,%eax
   1401324f8:	jmp    140126ca5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26f5>
   1401324fd:	mov    %rdx,%rax
   140132500:	shr    $0x20,%rax
   140132504:	cmp    $0x5,%ax
   140132508:	je     140126c7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x26cf>
   14013250e:	movabs $0xffffffff00000000,%rax
   140132518:	and    %r8,%rax
   14013251b:	jmp    14012f104 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xab54>
   140132520:	mov    %rdx,%rax
   140132523:	shr    $0x20,%rax
   140132527:	cmp    $0x5,%ax
   14013252b:	je     140126b4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x259c>
   140132531:	movabs $0xffffffff00000000,%rax
   14013253b:	and    %r8,%rax
   14013253e:	jmp    14012f185 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabd5>
   140132543:	shr    $0x20,%rdx
   140132547:	mov    %edx,%ecx
   140132549:	test   %dx,%dx
   14013254c:	jne    14012f2d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xad20>
   140132552:	lea    0x710(%rsp),%rcx
   14013255a:	lea    0x2d0(%rsp),%rdx
   140132562:	vzeroupper
   140132565:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013256a:	lea    0x2c8(%rsp),%rdx
   140132572:	lea    0x540(%rsp),%rcx
   14013257a:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013257f:	mov    0x540(%rsp),%rdi
   140132587:	mov    0x718(%rsp),%r9
   14013258f:	mov    0x710(%rsp),%r8
   140132597:	mov    0x548(%rsp),%rdx
   14013259f:	mov    %rdi,%rcx
   1401325a2:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   1401325a7:	mov    %eax,0x40(%rsp)
   1401325ab:	lea    0x550(%rsp),%rax
   1401325b3:	cmp    %rax,%rdi
   1401325b6:	je     1401325cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe01c>
   1401325b8:	mov    0x550(%rsp),%rax
   1401325c0:	mov    %rdi,%rcx
   1401325c3:	lea    0x1(%rax),%rdx
   1401325c7:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401325cc:	mov    0x710(%rsp),%rcx
   1401325d4:	lea    0x720(%rsp),%rax
   1401325dc:	cmp    %rax,%rcx
   1401325df:	je     1401325f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe042>
   1401325e1:	mov    0x720(%rsp),%rax
   1401325e9:	lea    0x1(%rax),%rdx
   1401325ed:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401325f2:	mov    0x40(%rsp),%eax
   1401325f6:	test   %eax,%eax
   1401325f8:	setle  %al
   1401325fb:	jmp    140126a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x248f>
   140132600:	mov    %rdx,%rax
   140132603:	shr    $0x20,%rax
   140132607:	cmp    $0x5,%ax
   14013260b:	je     140126a19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2469>
   140132611:	movabs $0xffffffff00000000,%rax
   14013261b:	and    %r8,%rax
   14013261e:	jmp    14012f2ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0xacfe>
   140132623:	shr    $0x20,%rdx
   140132627:	mov    %edx,%ecx
   140132629:	test   %dx,%dx
   14013262c:	jne    14012f1a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xabf7>
   140132632:	lea    0x710(%rsp),%rcx
   14013263a:	lea    0x2e0(%rsp),%rdx
   140132642:	vzeroupper
   140132645:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013264a:	lea    0x2d8(%rsp),%rdx
   140132652:	lea    0x540(%rsp),%rcx
   14013265a:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013265f:	mov    0x540(%rsp),%rdi
   140132667:	mov    0x718(%rsp),%r9
   14013266f:	mov    0x710(%rsp),%r8
   140132677:	mov    0x548(%rsp),%rdx
   14013267f:	mov    %rdi,%rcx
   140132682:	call   1400faee0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const [clone .isra.0]>
   140132687:	mov    %eax,0x40(%rsp)
   14013268b:	lea    0x550(%rsp),%rax
   140132693:	cmp    %rax,%rdi
   140132696:	je     1401326ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe0fc>
   140132698:	mov    0x550(%rsp),%rax
   1401326a0:	mov    %rdi,%rcx
   1401326a3:	lea    0x1(%rax),%rdx
   1401326a7:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401326ac:	mov    0x710(%rsp),%rcx
   1401326b4:	lea    0x720(%rsp),%rax
   1401326bc:	cmp    %rax,%rcx
   1401326bf:	je     1401326d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe122>
   1401326c1:	mov    0x720(%rsp),%rax
   1401326c9:	lea    0x1(%rax),%rdx
   1401326cd:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401326d2:	mov    0x40(%rsp),%edi
   1401326d6:	test   %edi,%edi
   1401326d8:	setg   %al
   1401326db:	jmp    140126b72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x25c2>
   1401326e0:	shr    $0x20,%rdx
   1401326e4:	mov    %edx,%r9d
   1401326e7:	test   %dx,%dx
   1401326ea:	jne    140132e60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe8b0>
   1401326f0:	lea    0x710(%rsp),%r10
   1401326f8:	lea    0x3b0(%rsp),%rdx
   140132700:	mov    %r10,0x60(%rsp)
   140132705:	mov    %r10,%rcx
   140132708:	vzeroupper
   14013270b:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140132710:	lea    0x540(%rsp),%rax
   140132718:	lea    0x3a8(%rsp),%rdx
   140132720:	mov    %rax,%rcx
   140132723:	mov    %rax,0x40(%rsp)
   140132728:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013272d:	mov    0x40(%rsp),%rcx
   140132732:	mov    0x60(%rsp),%rdx
   140132737:	call   140330700 <bool std::operator==<char, std::char_traits<char>, std::allocator<char> >(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14013273c:	mov    0x540(%rsp),%rcx
   140132744:	mov    %eax,%r8d
   140132747:	lea    0x550(%rsp),%rax
   14013274f:	cmp    %rax,%rcx
   140132752:	je     140132770 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe1c0>
   140132754:	mov    0x550(%rsp),%rax
   14013275c:	mov    %r8b,0x40(%rsp)
   140132761:	lea    0x1(%rax),%rdx
   140132765:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14013276a:	movzbl 0x40(%rsp),%r8d
   140132770:	mov    0x710(%rsp),%rcx
   140132778:	lea    0x720(%rsp),%rax
   140132780:	cmp    %rax,%rcx
   140132783:	je     140129425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e75>
   140132789:	mov    0x720(%rsp),%rax
   140132791:	mov    %r8b,0x40(%rsp)
   140132796:	lea    0x1(%rax),%rdx
   14013279a:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14013279f:	movzbl 0x40(%rsp),%r8d
   1401327a5:	jmp    140129425 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e75>
   1401327aa:	mov    0x290(%rsp),%rax
   1401327b2:	mov    %rax,0x1c8(%rsp)
   1401327ba:	jmp    140126589 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1fd9>
   1401327bf:	test   %sil,%sil
   1401327c2:	jne    140133258 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeca8>
   1401327c8:	movabs $0xfff8000000000003,%rax
   1401327d2:	mov    %rax,0x1c8(%rsp)
   1401327da:	mov    $0x1,%esi
   1401327df:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   1401327e4:	nopl   0x0(%rax)
   1401327e8:	test   %rax,%rax
   1401327eb:	setne  %al
   1401327ee:	jmp    14012f786 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb1d6>
   1401327f3:	test   %rax,%rax
   1401327f6:	setne  %al
   1401327f9:	jmp    14012f7b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb202>
   1401327fe:	lea    0x308(%rsp),%rdx
   140132806:	lea    0x540(%rsp),%rcx
   14013280e:	vzeroupper
   140132811:	call   14021cda0 <setun::VMValue::as_object() const>
   140132816:	mov    0x540(%rsp),%rax
   14013281e:	mov    0x548(%rsp),%rdi
   140132826:	mov    %rax,0x40(%rsp)
   14013282b:	test   %rax,%rax
   14013282e:	je     14013536d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dbd>
   140132834:	test   %sil,%sil
   140132837:	je     140135281 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10cd1>
   14013283d:	cmp    $0x1,%sil
   140132841:	je     140132864 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2b4>
   140132843:	lea    0x8(%r13),%rax
   140132847:	cmp    0x30(%rsp),%rax
   14013284c:	jae    140137171 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bc1>
   140132852:	mov    0x1d0(%rsp),%rdx
   14013285a:	mov    %r13,%rax
   14013285d:	lea    0x8(%r13),%r13
   140132861:	mov    %rdx,(%rax)
   140132864:	lea    0x710(%rsp),%r10
   14013286c:	mov    0x1c8(%rsp),%rax
   140132874:	lea    0x310(%rsp),%rdx
   14013287c:	mov    %r10,%rcx
   14013287f:	mov    %r10,0x60(%rsp)
   140132884:	mov    %rax,0x1d0(%rsp)
   14013288c:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140132891:	mov    0x40(%rsp),%rcx
   140132896:	mov    0x60(%rsp),%rdx
   14013289b:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401328a0:	mov    0x710(%rsp),%rcx
   1401328a8:	mov    %rax,0x1c8(%rsp)
   1401328b0:	lea    0x720(%rsp),%rax
   1401328b8:	cmp    %rax,%rcx
   1401328bb:	je     1401328ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe31e>
   1401328bd:	mov    0x720(%rsp),%rax
   1401328c5:	lea    0x1(%rax),%rdx
   1401328c9:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401328ce:	mov    $0x2,%esi
   1401328d3:	test   %rdi,%rdi
   1401328d6:	je     14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   1401328dc:	mov    %rdi,%rcx
   1401328df:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401328e4:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   1401328e9:	cmpb   $0x0,0x152c0(%rbx)
   1401328f0:	je     140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   1401328f6:	mov    0x152c8(%rbx),%rcx
   1401328fd:	test   %rcx,%rcx
   140132900:	je     140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   140132906:	mov    0x150c0(%rbx),%rax
   14013290d:	mov    %rax,0x40(%rsp)
   140132912:	test   %rax,%rax
   140132915:	je     14013292c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe37c>
   140132917:	sub    $0x1,%rax
   14013291b:	imul   $0x28,%rax,%rax
   14013291f:	mov    0x10e0(%rbx,%rax,1),%rax
   140132927:	mov    %rax,0x40(%rsp)
   14013292c:	mov    %r12,0x60(%rsp)
   140132931:	mov    0x40(%rsp),%rdx
   140132936:	vzeroupper
   140132939:	call   140172200 <setun::JITManager::record_backedge(unsigned long long)>
   14013293e:	mov    0x152c8(%rbx),%rdx
   140132945:	mov    0x40(%rsp),%r8
   14013294a:	lea    0x540(%rsp),%rcx
   140132952:	call   140171d20 <setun::JITManager::get_or_create(unsigned long long)>
   140132957:	mov    0x540(%rsp),%rcx
   14013295f:	cmpb   $0x0,0xa8(%rcx)
   140132966:	jne    1401329aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3fa>
   140132968:	mov    0x152c8(%rbx),%rax
   14013296f:	mov    0x88(%rax),%edx
   140132975:	cmp    %edx,0xac(%rcx)
   14013297b:	jae    14013298b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3db>
   14013297d:	mov    0x8c(%rax),%edx
   140132983:	cmp    %edx,0xb0(%rcx)
   140132989:	jb     1401329aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe3fa>
   14013298b:	mov    0x40(%rsp),%r8
   140132990:	mov    0x8(%r14),%r9
   140132994:	mov    %r14,%rdx
   140132997:	mov    %rax,%rcx
   14013299a:	sub    (%r14),%r9
   14013299d:	call   140172010 <setun::JITManager::compile_function(setun::Chunk const&, unsigned long long, unsigned long long)>
   1401329a2:	mov    0x540(%rsp),%rcx
   1401329aa:	mov    0x60(%rsp),%rdx
   1401329af:	movswq %di,%rax
   1401329b3:	lea    0x2(%rdx,%rax,1),%r9
   1401329b8:	sub    %r15,%r9
   1401329bb:	mov    %r9d,%edx
   1401329be:	mov    %r9,0x60(%rsp)
   1401329c3:	call   140219620 <setun::JITCodeObject::has_osr_entry(unsigned int) const>
   1401329c8:	mov    0x60(%rsp),%r9
   1401329cd:	test   %al,%al
   1401329cf:	je     140134c05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10655>
   1401329d5:	lea    0x710(%rsp),%r10
   1401329dd:	xor    %eax,%eax
   1401329df:	mov    $0x23,%ecx
   1401329e4:	mov    0x40(%rsp),%r8
   1401329e9:	mov    %r10,%rdi
   1401329ec:	rep stos %rax,(%rdi)
   1401329ef:	mov    0x1068(%rbx),%rcx
   1401329f6:	movb   $0x1,0x818(%rsp)
   1401329fe:	mov    %r13,%rdi
   140132a01:	mov    %rbx,0x710(%rsp)
   140132a09:	lea    (%rcx,%rbp,8),%rdx
   140132a0d:	mov    %rdx,0x720(%rsp)
   140132a15:	mov    0x1070(%rbx),%rdx
   140132a1c:	sub    %rcx,%rdx
   140132a1f:	mov    0x1048(%rbx),%rcx
   140132a26:	sar    $0x3,%rdx
   140132a2a:	sub    %rbp,%rdx
   140132a2d:	mov    %rcx,0x730(%rsp)
   140132a35:	mov    %rdx,0x728(%rsp)
   140132a3d:	mov    %r13,%rdx
   140132a40:	sub    %rcx,%rdx
   140132a43:	mov    0x150c0(%rbx),%rcx
   140132a4a:	sar    $0x3,%rdx
   140132a4e:	mov    %rdx,0x738(%rsp)
   140132a56:	imul   $0x28,%rcx,%rdx
   140132a5a:	test   %rcx,%rcx
   140132a5d:	mov    0x152c8(%rbx),%rcx
   140132a64:	lea    0x1098(%rbx,%rdx,1),%rdx
   140132a6c:	cmove  %rax,%rdx
   140132a70:	vmovq  %rdx,%xmm7
   140132a75:	mov    %rbx,%rdx
   140132a78:	vpinsrq $0x1,0x152b8(%rbx),%xmm7,%xmm0
   140132a82:	mov    %r10,0x152b8(%rbx)
   140132a89:	mov    %r10,0x20(%rsp)
   140132a8e:	vmovdqa %xmm0,0x740(%rsp)
   140132a97:	call   14016fe90 <setun::JITManager::execute_osr(setun::VM*, unsigned long long, unsigned int, setun::JITFrame*)>
   140132a9c:	mov    %rax,0x40(%rsp)
   140132aa1:	mov    0x758(%rsp),%r13
   140132aa9:	mov    0x748(%rsp),%rax
   140132ab1:	mov    0x548(%rsp),%rcx
   140132ab9:	mov    %rax,0x152b8(%rbx)
   140132ac0:	test   %r13,%r13
   140132ac3:	jle    140137d6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137be>
   140132ac9:	test   %rcx,%rcx
   140132acc:	je     140132ad3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe523>
   140132ace:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140132ad3:	mov    0x1060(%rbx),%rax
   140132ada:	mov    0x1048(%rbx),%r11
   140132ae1:	mov    %r13d,%r12d
   140132ae4:	add    %r15,%r12
   140132ae7:	lea    (%r11,%rax,8),%r13
   140132aeb:	cmpb   $0x0,0x1040(%rbx)
   140132af2:	je     1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140132af8:	mov    %r12,%rax
   140132afb:	lea    0x28e59e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140132b02:	lea    0x1(%r12),%r12
   140132b07:	movzbl (%rax),%eax
   140132b0a:	jmp    *(%rdi,%rax,8)
   140132b0d:	mov    0x1050(%rbx),%rax
   140132b14:	sub    %r11,%r13
   140132b17:	mov    %rax,%rdx
   140132b1a:	sub    %r11,%rdx
   140132b1d:	sar    $0x3,%rdx
   140132b21:	lea    (%rdx,%rdx,1),%rcx
   140132b25:	cmp    %rcx,%rdx
   140132b28:	jb     140135388 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dd8>
   140132b2e:	vzeroupper
   140132b31:	add    %r11,%r13
   140132b34:	jmp    14012a8c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6317>
   140132b39:	lea    0x15270(%rbx),%rcx
   140132b40:	mov    %rbx,%rdx
   140132b43:	vzeroupper
   140132b46:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   140132b4b:	jmp    14012dc8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x96de>
   140132b50:	mov    0x1050(%rbx),%rax
   140132b57:	sub    %r11,%r13
   140132b5a:	mov    %rax,%rdx
   140132b5d:	sub    %r11,%rdx
   140132b60:	sar    $0x3,%rdx
   140132b64:	lea    (%rdx,%rdx,1),%rcx
   140132b68:	cmp    %rcx,%rdx
   140132b6b:	jb     140135977 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113c7>
   140132b71:	vzeroupper
   140132b74:	add    %r11,%r13
   140132b77:	jmp    1401252c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd11>
   140132b7c:	cmp    $0x2,%sil
   140132b80:	je     140135be6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11636>
   140132b86:	cmp    $0x1,%sil
   140132b8a:	jne    140138ef7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14947>
   140132b90:	mov    0x1048(%rbx),%r11
   140132b97:	lea    0x8(%r13),%rax
   140132b9b:	cmp    0x30(%rsp),%rax
   140132ba0:	jae    1401371a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12bf5>
   140132ba6:	mov    0x1050(%rbx),%rax
   140132bad:	vzeroupper
   140132bb0:	mov    0x1c8(%rsp),%rcx
   140132bb8:	mov    %r13,%rdx
   140132bbb:	lea    0x8(%r13),%r13
   140132bbf:	mov    %rcx,(%rdx)
   140132bc2:	mov    %r12,%rdx
   140132bc5:	sub    %r11,%rax
   140132bc8:	sub    %r15,%rdx
   140132bcb:	mov    %rdx,0x1038(%rbx)
   140132bd2:	mov    %r13,%rdx
   140132bd5:	sub    %r11,%rdx
   140132bd8:	mov    %rdx,%rsi
   140132bdb:	sar    $0x3,%rsi
   140132bdf:	cmp    %rdx,%rax
   140132be2:	jae    140132bf4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe644>
   140132be4:	lea    (%rsi,%rsi,1),%rdx
   140132be8:	lea    0x1048(%rbx),%rcx
   140132bef:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132bf4:	mov    %rsi,0x1060(%rbx)
   140132bfb:	vmovdqa 0x22aebd(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140132c03:	mov    $0x10,%ecx
   140132c08:	movb   $0x0,0x153a0(%rbx)
   140132c0f:	vmovdqa %xmm0,0x15390(%rbx)
   140132c17:	call   140339360 <__cxa_allocate_exception>
   140132c1c:	lea    0x710(%rsp),%r10
   140132c24:	lea    0x22a9a5(%rip),%rdx        # 14035d5d0 <.rdata+0x1010>
   140132c2b:	mov    %r10,%rcx
   140132c2e:	mov    %r10,0x30(%rsp)
   140132c33:	mov    %rax,%rsi
   140132c36:	call   1400fb160 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string<std::allocator<char> >(char const*, std::allocator<char> const&) [clone .isra.0]>
   140132c3b:	mov    0x30(%rsp),%rdx
   140132c40:	mov    %rsi,%rcx
   140132c43:	call   1402d1000 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   140132c48:	lea    0x246cd1(%rip),%rax        # 140379920 <vtable for setun::VMException+0x10>
   140132c4f:	mov    0x710(%rsp),%rcx
   140132c57:	mov    %rax,(%rsi)
   140132c5a:	lea    0x720(%rsp),%rax
   140132c62:	cmp    %rax,%rcx
   140132c65:	je     140138810 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14260>
   140132c6b:	mov    0x720(%rsp),%rax
   140132c73:	lea    0x1(%rax),%rdx
   140132c77:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140132c7c:	jmp    140138810 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14260>
   140132c81:	nopl   0x0(%rax)
   140132c88:	mov    0x1050(%rbx),%rax
   140132c8f:	vzeroupper
   140132c92:	jmp    1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140132c97:	mov    0x80(%rsp),%rdx
   140132c9f:	lea    0x1068(%rbx),%rcx
   140132ca6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140132cab:	jmp    14012711c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2b6c>
   140132cb0:	shr    $0x20,%rax
   140132cb4:	mov    %eax,%r8d
   140132cb7:	test   %ax,%ax
   140132cba:	je     140131bb7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd607>
   140132cc0:	movabs $0xfffd000100000000,%rax
   140132cca:	cmp    %rax,%rcx
   140132ccd:	je     14012d2a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cf5>
   140132cd3:	cmp    $0x1,%r8w
   140132cd8:	jne    140129296 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ce6>
   140132cde:	jmp    14012d2a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8cf5>
   140132ce3:	test   %sil,%sil
   140132ce6:	jne    1401332c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed19>
   140132cec:	mov    0x60(%rdi),%rcx
   140132cf0:	mov    0x50(%rdi),%rdx
   140132cf4:	xor    %eax,%eax
   140132cf6:	sub    0x48(%rdi),%rdx
   140132cfa:	sar    $0x3,%rdx
   140132cfe:	test   %rcx,%rcx
   140132d01:	je     140132d07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe757>
   140132d03:	mov    0x18(%rcx),%rax
   140132d07:	add    %rax,%rdx
   140132d0a:	lea    0x710(%rsp),%rcx
   140132d12:	mov    $0x1,%esi
   140132d17:	call   140210640 <setun::VMValue::VMValue(long long)>
   140132d1c:	mov    0x710(%rsp),%rax
   140132d24:	mov    %rax,0x1c8(%rsp)
   140132d2c:	cmpb   $0x0,0x1040(%rbx)
   140132d33:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140132d39:	mov    %r12,%rax
   140132d3c:	lea    0x28e35d(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140132d43:	lea    0x1(%r12),%r12
   140132d48:	movzbl (%rax),%eax
   140132d4b:	jmp    *(%rdi,%rax,8)
   140132d4e:	cmp    $0x1,%sil
   140132d52:	je     140132d75 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7c5>
   140132d54:	lea    0x8(%r13),%rax
   140132d58:	cmp    0x30(%rsp),%rax
   140132d5d:	jae    140137c19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13669>
   140132d63:	mov    0x1d0(%rsp),%rdx
   140132d6b:	mov    %r13,%rax
   140132d6e:	lea    0x8(%r13),%r13
   140132d72:	mov    %rdx,(%rax)
   140132d75:	mov    0x1c8(%rsp),%rax
   140132d7d:	mov    %rax,0x1d0(%rsp)
   140132d85:	movabs $0xfff8000000000000,%rax
   140132d8f:	mov    %rax,0x1c8(%rsp)
   140132d97:	mov    $0x2,%esi
   140132d9c:	jmp    14012f831 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb281>
   140132da1:	shr    $0x20,%rax
   140132da5:	mov    %eax,%r8d
   140132da8:	test   %ax,%ax
   140132dab:	je     140132127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb77>
   140132db1:	movabs $0xfffd000100000000,%rax
   140132dbb:	cmp    %rax,%rcx
   140132dbe:	je     14012d183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bd3>
   140132dc4:	cmp    $0x1,%r8w
   140132dc9:	jne    1401296c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5114>
   140132dcf:	jmp    14012d183 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8bd3>
   140132dd4:	mov    0x1050(%rbx),%rax
   140132ddb:	mov    0x1048(%rbx),%r11
   140132de2:	mov    %rax,%rdx
   140132de5:	sub    %r11,%r13
   140132de8:	sub    %r11,%rdx
   140132deb:	sar    $0x3,%rdx
   140132def:	lea    (%rdx,%rdx,1),%rcx
   140132df3:	cmp    %rcx,%rdx
   140132df6:	jb     14013599c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x113ec>
   140132dfc:	vzeroupper
   140132dff:	mov    %rax,0x30(%rsp)
   140132e04:	add    %r11,%r13
   140132e07:	jmp    140125930 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1380>
   140132e0c:	shr    $0x20,%rax
   140132e10:	mov    %eax,%edx
   140132e12:	test   %ax,%ax
   140132e15:	je     140131f9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd9ee>
   140132e1b:	movabs $0xfffd000100000000,%rax
   140132e25:	cmp    %rax,%rcx
   140132e28:	je     14012b46e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ebe>
   140132e2e:	cmp    $0x1,%dx
   140132e32:	jne    1401267b3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2203>
   140132e38:	jmp    14012b46e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ebe>
   140132e3d:	shr    $0x20,%rax
   140132e41:	mov    %eax,%r9d
   140132e44:	test   %ax,%ax
   140132e47:	je     1401326f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe140>
   140132e4d:	movabs $0xfffd000100000000,%rax
   140132e57:	cmp    %rax,%rcx
   140132e5a:	je     14012d060 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ab0>
   140132e60:	cmp    $0x1,%r9w
   140132e65:	jne    1401293fa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4e4a>
   140132e6b:	jmp    14012d060 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8ab0>
   140132e70:	cmp    $0x1,%rax
   140132e74:	je     1401368d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12322>
   140132e7a:	cmp    $0x2,%rax
   140132e7e:	je     140136886 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122d6>
   140132e84:	test   %sil,%sil
   140132e87:	je     14012ad92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67e2>
   140132e8d:	sub    $0x1,%sil
   140132e91:	je     14012e5f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa046>
   140132e97:	lea    0x8(%r13),%rax
   140132e9b:	cmp    0x30(%rsp),%rax
   140132ea0:	jb     14012e5e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa034>
   140132ea6:	mov    0x1050(%rbx),%rax
   140132ead:	mov    0x1048(%rbx),%r11
   140132eb4:	mov    %rax,%rdx
   140132eb7:	sub    %r11,%r13
   140132eba:	sub    %r11,%rdx
   140132ebd:	sar    $0x3,%rdx
   140132ec1:	lea    (%rdx,%rdx,1),%rcx
   140132ec5:	cmp    %rcx,%rdx
   140132ec8:	jb     140136a7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124cb>
   140132ece:	mov    %rax,0x30(%rsp)
   140132ed3:	add    %r11,%r13
   140132ed6:	jmp    14012e5e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa034>
   140132edb:	mov    0x1050(%rbx),%rax
   140132ee2:	mov    0x1048(%rbx),%r11
   140132ee9:	mov    %rax,%rdx
   140132eec:	sub    %r11,%r13
   140132eef:	sub    %r11,%rdx
   140132ef2:	sar    $0x3,%rdx
   140132ef6:	lea    (%rdx,%rdx,1),%rcx
   140132efa:	cmp    %rcx,%rdx
   140132efd:	jb     140134bb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10604>
   140132f03:	vzeroupper
   140132f06:	mov    %rax,0x30(%rsp)
   140132f0b:	add    %r11,%r13
   140132f0e:	jmp    140125811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1261>
   140132f13:	shr    $0x20,%rax
   140132f17:	mov    %eax,%r8d
   140132f1a:	test   %ax,%ax
   140132f1d:	je     140131c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd6cb>
   140132f23:	movabs $0xfffd000100000000,%rax
   140132f2d:	cmp    %rax,%rcx
   140132f30:	je     14012cf3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x898e>
   140132f36:	cmp    $0x1,%r8w
   140132f3b:	jne    140129560 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4fb0>
   140132f41:	jmp    14012cf3e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x898e>
   140132f46:	shr    $0x20,%rax
   140132f4a:	mov    %eax,%r8d
   140132f4d:	test   %ax,%ax
   140132f50:	je     140131d3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd78f>
   140132f56:	movabs $0xfffd000100000000,%rax
   140132f60:	cmp    %rax,%rcx
   140132f63:	je     14012d3c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e17>
   140132f69:	cmp    $0x1,%r8w
   140132f6e:	jne    140129132 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4b82>
   140132f74:	jmp    14012d3c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e17>
   140132f79:	mov    0x1050(%rbx),%rax
   140132f80:	sub    %r11,%r13
   140132f83:	mov    %rax,%rdx
   140132f86:	sub    %r11,%rdx
   140132f89:	sar    $0x3,%rdx
   140132f8d:	lea    (%rdx,%rdx,1),%rcx
   140132f91:	cmp    %rcx,%rdx
   140132f94:	jb     140135080 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ad0>
   140132f9a:	vzeroupper
   140132f9d:	add    %r11,%r13
   140132fa0:	jmp    14012bb42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7592>
   140132fa5:	mov    0x1050(%rbx),%rax
   140132fac:	sub    %r11,%r13
   140132faf:	mov    %rax,%rdx
   140132fb2:	sub    %r11,%rdx
   140132fb5:	sar    $0x3,%rdx
   140132fb9:	lea    (%rdx,%rdx,1),%rcx
   140132fbd:	cmp    %rcx,%rdx
   140132fc0:	jb     1401361f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c43>
   140132fc6:	vzeroupper
   140132fc9:	add    %r11,%r13
   140132fcc:	jmp    14012c8ca <setun::VM::run_optimized(setun::OptimizedChunk&)+0x831a>
   140132fd1:	mov    0x1c8(%rsp),%rax
   140132fd9:	mov    %rax,0x370(%rsp)
   140132fe1:	mov    %r13,%rax
   140132fe4:	lea    -0x8(%r13),%r13
   140132fe8:	mov    -0x8(%rax),%rax
   140132fec:	mov    %rax,0x368(%rsp)
   140132ff4:	jmp    140128eff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x494f>
   140132ff9:	mov    0x1c8(%rsp),%rax
   140133001:	mov    %rax,0x2d0(%rsp)
   140133009:	mov    %r13,%rax
   14013300c:	lea    -0x8(%r13),%r13
   140133010:	mov    -0x8(%rax),%rax
   140133014:	mov    %rax,0x2c8(%rsp)
   14013301c:	jmp    14012698f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x23df>
   140133021:	mov    0x1c8(%rsp),%rax
   140133029:	mov    %rax,0x280(%rsp)
   140133031:	mov    %r13,%rax
   140133034:	lea    -0x8(%r13),%r13
   140133038:	mov    -0x8(%rax),%rax
   14013303c:	mov    %rax,0x278(%rsp)
   140133044:	jmp    1401263b4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1e04>
   140133049:	mov    0x1c8(%rsp),%rax
   140133051:	mov    %rax,0x2f0(%rsp)
   140133059:	mov    %r13,%rax
   14013305c:	lea    -0x8(%r13),%r13
   140133060:	mov    -0x8(%rax),%rax
   140133064:	mov    %rax,0x2e8(%rsp)
   14013306c:	jmp    140126bf5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2645>
   140133071:	mov    0x1c8(%rsp),%rax
   140133079:	mov    %rax,0x2a0(%rsp)
   140133081:	mov    %r13,%rax
   140133084:	lea    -0x8(%r13),%r13
   140133088:	mov    -0x8(%rax),%rax
   14013308c:	mov    %rax,0x298(%rsp)
   140133094:	jmp    1401265f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2044>
   140133099:	mov    0x1050(%rbx),%rax
   1401330a0:	mov    0x1048(%rbx),%r11
   1401330a7:	mov    %rax,%rdx
   1401330aa:	sub    %r11,%r13
   1401330ad:	sub    %r11,%rdx
   1401330b0:	sar    $0x3,%rdx
   1401330b4:	lea    (%rdx,%rdx,1),%rcx
   1401330b8:	cmp    %rcx,%rdx
   1401330bb:	jb     1401355f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11045>
   1401330c1:	mov    %rax,0x30(%rsp)
   1401330c6:	add    %r11,%r13
   1401330c9:	jmp    14012af6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x69bf>
   1401330ce:	mov    0x1050(%rbx),%rax
   1401330d5:	mov    0x1048(%rbx),%r11
   1401330dc:	mov    %rax,%rdx
   1401330df:	sub    %r11,%r13
   1401330e2:	sub    %r11,%rdx
   1401330e5:	sar    $0x3,%rdx
   1401330e9:	lea    (%rdx,%rdx,1),%rcx
   1401330ed:	cmp    %rcx,%rdx
   1401330f0:	jb     14013561a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1106a>
   1401330f6:	mov    %rax,0x30(%rsp)
   1401330fb:	add    %r11,%r13
   1401330fe:	jmp    140125ad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1522>
   140133103:	mov    0x1050(%rbx),%rax
   14013310a:	sub    %r11,%r13
   14013310d:	mov    %rax,%rdx
   140133110:	sub    %r11,%rdx
   140133113:	sar    $0x3,%rdx
   140133117:	lea    (%rdx,%rdx,1),%rcx
   14013311b:	cmp    %rcx,%rdx
   14013311e:	jb     140135df2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11842>
   140133124:	vzeroupper
   140133127:	add    %r11,%r13
   14013312a:	jmp    14012c70e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x815e>
   14013312f:	mov    0x1c8(%rsp),%rax
   140133137:	mov    %rax,0x1e0(%rsp)
   14013313f:	mov    %r13,%rax
   140133142:	lea    -0x8(%r13),%r13
   140133146:	mov    -0x8(%rax),%rax
   14013314a:	mov    %rax,0x1d8(%rsp)
   140133152:	jmp    140125d7e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x17ce>
   140133157:	mov    0x1c8(%rsp),%rax
   14013315f:	xor    %esi,%esi
   140133161:	mov    %rax,0x3f0(%rsp)
   140133169:	mov    %r13,%rax
   14013316c:	lea    -0x8(%r13),%r13
   140133170:	mov    -0x8(%rax),%rdx
   140133174:	jmp    14012d44a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8e9a>
   140133179:	mov    0x1c8(%rsp),%rax
   140133181:	mov    %rax,0x200(%rsp)
   140133189:	mov    %r13,%rax
   14013318c:	lea    -0x8(%r13),%r13
   140133190:	mov    -0x8(%rax),%rax
   140133194:	mov    %rax,0x1f8(%rsp)
   14013319c:	jmp    140125eea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x193a>
   1401331a1:	mov    0x1c8(%rsp),%rax
   1401331a9:	mov    $0x1,%esi
   1401331ae:	mov    %rax,0x300(%rsp)
   1401331b6:	mov    0x1d0(%rsp),%rax
   1401331be:	mov    %rax,0x1c8(%rsp)
   1401331c6:	jmp    140126dde <setun::VM::run_optimized(setun::OptimizedChunk&)+0x282e>
   1401331cb:	mov    0x1050(%rbx),%rax
   1401331d2:	sub    %r11,%r13
   1401331d5:	mov    %rax,%rdx
   1401331d8:	sub    %r11,%rdx
   1401331db:	sar    $0x3,%rdx
   1401331df:	lea    (%rdx,%rdx,1),%rcx
   1401331e3:	cmp    %rcx,%rdx
   1401331e6:	jb     140136244 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c94>
   1401331ec:	vzeroupper
   1401331ef:	add    %r11,%r13
   1401331f2:	jmp    14012c7c3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8213>
   1401331f7:	mov    0x1050(%rbx),%rax
   1401331fe:	sub    %r11,%r13
   140133201:	mov    %rax,%rdx
   140133204:	sub    %r11,%rdx
   140133207:	sar    $0x3,%rdx
   14013320b:	lea    (%rdx,%rdx,1),%rcx
   14013320f:	cmp    %rcx,%rdx
   140133212:	jb     1401355d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11020>
   140133218:	vzeroupper
   14013321b:	add    %r11,%r13
   14013321e:	jmp    14012cd07 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8757>
   140133223:	mov    0x1050(%rbx),%rax
   14013322a:	mov    0x1048(%rbx),%r11
   140133231:	mov    %rax,%rdx
   140133234:	sub    %r11,%r13
   140133237:	sub    %r11,%rdx
   14013323a:	sar    $0x3,%rdx
   14013323e:	lea    (%rdx,%rdx,1),%rcx
   140133242:	cmp    %rcx,%rdx
   140133245:	jb     140136269 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cb9>
   14013324b:	mov    %rax,0x30(%rsp)
   140133250:	add    %r11,%r13
   140133253:	jmp    1401258a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f0>
   140133258:	cmp    $0x1,%sil
   14013325c:	je     140136218 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c68>
   140133262:	lea    0x8(%r13),%rax
   140133266:	cmp    0x30(%rsp),%rax
   14013326b:	jae    140137748 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13198>
   140133271:	mov    0x1d0(%rsp),%rdx
   140133279:	mov    %r13,%rax
   14013327c:	mov    $0x2,%esi
   140133281:	lea    0x8(%r13),%r13
   140133285:	mov    %rdx,(%rax)
   140133288:	mov    0x1c8(%rsp),%rax
   140133290:	mov    %rax,0x1d0(%rsp)
   140133298:	movabs $0xfff8000000000003,%rax
   1401332a2:	mov    %rax,0x1c8(%rsp)
   1401332aa:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   1401332af:	mov    0x1d0(%rsp),%rax
   1401332b7:	mov    $0x1,%esi
   1401332bc:	mov    %rax,0x1c8(%rsp)
   1401332c4:	jmp    140125a8e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14de>
   1401332c9:	cmp    $0x1,%sil
   1401332cd:	je     140135572 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10fc2>
   1401332d3:	lea    0x8(%r13),%rax
   1401332d7:	cmp    0x30(%rsp),%rax
   1401332dc:	jae    140136f5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129ad>
   1401332e2:	mov    0x1d0(%rsp),%rdx
   1401332ea:	mov    %r13,%rax
   1401332ed:	mov    0x60(%rdi),%rcx
   1401332f1:	lea    0x8(%r13),%r13
   1401332f5:	mov    %rdx,(%rax)
   1401332f8:	mov    0x1c8(%rsp),%rax
   140133300:	mov    0x50(%rdi),%rdx
   140133304:	sub    0x48(%rdi),%rdx
   140133308:	mov    %rax,0x1d0(%rsp)
   140133310:	sar    $0x3,%rdx
   140133314:	xor    %eax,%eax
   140133316:	test   %rcx,%rcx
   140133319:	je     14013331f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6f>
   14013331b:	mov    0x18(%rcx),%rax
   14013331f:	add    %rax,%rdx
   140133322:	lea    0x710(%rsp),%rcx
   14013332a:	mov    $0x2,%esi
   14013332f:	call   140210640 <setun::VMValue::VMValue(long long)>
   140133334:	mov    0x710(%rsp),%rax
   14013333c:	mov    %rax,0x1c8(%rsp)
   140133344:	jmp    140132d2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe77c>
   140133349:	mov    0x1c8(%rsp),%rax
   140133351:	mov    %rax,0x390(%rsp)
   140133359:	mov    %r13,%rax
   14013335c:	lea    -0x8(%r13),%r13
   140133360:	mov    -0x8(%rax),%rax
   140133364:	mov    %rax,0x388(%rsp)
   14013336c:	jmp    140129077 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ac7>
   140133371:	mov    0x1c8(%rsp),%rax
   140133379:	mov    %rax,0x340(%rsp)
   140133381:	mov    0x1d0(%rsp),%rax
   140133389:	mov    %rax,0x1c8(%rsp)
   140133391:	jmp    1401304a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbef7>
   140133396:	mov    0x1050(%rbx),%rax
   14013339d:	sub    %r11,%r13
   1401333a0:	mov    %rax,%rdx
   1401333a3:	sub    %r11,%rdx
   1401333a6:	sar    $0x3,%rdx
   1401333aa:	lea    (%rdx,%rdx,1),%rcx
   1401333ae:	cmp    %rcx,%rdx
   1401333b1:	jb     14013516a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bba>
   1401333b7:	vzeroupper
   1401333ba:	add    %r11,%r13
   1401333bd:	jmp    14012c1bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c0b>
   1401333c2:	mov    0x1050(%rbx),%rax
   1401333c9:	sub    %r11,%r13
   1401333cc:	mov    %rax,%rdx
   1401333cf:	sub    %r11,%rdx
   1401333d2:	sar    $0x3,%rdx
   1401333d6:	lea    (%rdx,%rdx,1),%rcx
   1401333da:	cmp    %rcx,%rdx
   1401333dd:	jb     140135e8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118dd>
   1401333e3:	vzeroupper
   1401333e6:	add    %r11,%r13
   1401333e9:	jmp    14012c535 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f85>
   1401333ee:	mov    0x1c8(%rsp),%rax
   1401333f6:	mov    %rax,0x318(%rsp)
   1401333fe:	mov    0x1d0(%rsp),%rax
   140133406:	mov    %rax,0x1c8(%rsp)
   14013340e:	jmp    14013078d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc1dd>
   140133413:	mov    0x1c8(%rsp),%rax
   14013341b:	mov    %rax,0x3b0(%rsp)
   140133423:	mov    %r13,%rax
   140133426:	lea    -0x8(%r13),%r13
   14013342a:	mov    -0x8(%rax),%rax
   14013342e:	mov    %rax,0x3a8(%rsp)
   140133436:	jmp    14012933f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4d8f>
   14013343b:	cmp    $0x1,%sil
   14013343f:	je     140133462 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeeb2>
   140133441:	lea    0x8(%r13),%rax
   140133445:	cmp    0x30(%rsp),%rax
   14013344a:	jae    14013720e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c5e>
   140133450:	mov    0x1d0(%rsp),%rdx
   140133458:	mov    %r13,%rax
   14013345b:	lea    0x8(%r13),%r13
   14013345f:	mov    %rdx,(%rax)
   140133462:	mov    0x1c8(%rsp),%rax
   14013346a:	xor    %edx,%edx
   14013346c:	mov    %rax,0x1d0(%rsp)
   140133474:	test   %rdi,%rdi
   140133477:	je     140133484 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeed4>
   140133479:	mov    %rdi,%rcx
   14013347c:	call   140147900 <setun::ArrayObject::size() const>
   140133481:	mov    %rax,%rdx
   140133484:	lea    0x710(%rsp),%rcx
   14013348c:	mov    $0x2,%esi
   140133491:	call   140210640 <setun::VMValue::VMValue(long long)>
   140133496:	mov    0x710(%rsp),%rax
   14013349e:	mov    %rax,0x1c8(%rsp)
   1401334a6:	jmp    140130a15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc465>
   1401334ab:	mov    0x1068(%rbx),%rax
   1401334b2:	mov    0x1c8(%rsp),%rdx
   1401334ba:	mov    $0x1,%esi
   1401334bf:	mov    %rdx,(%rax,%rdi,8)
   1401334c3:	mov    0x1d0(%rsp),%rax
   1401334cb:	mov    %rax,0x1c8(%rsp)
   1401334d3:	jmp    14012835b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dab>
   1401334d8:	lea    0x710(%rsp),%rcx
   1401334e0:	lea    0x3e0(%rsp),%rdx
   1401334e8:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401334ed:	mov    0x718(%rsp),%rdx
   1401334f5:	lea    0x540(%rsp),%rcx
   1401334fd:	call   140210640 <setun::VMValue::VMValue(long long)>
   140133502:	mov    0x540(%rsp),%rax
   14013350a:	mov    0x710(%rsp),%rcx
   140133512:	mov    %rax,0x1c8(%rsp)
   14013351a:	lea    0x720(%rsp),%rax
   140133522:	cmp    %rax,%rcx
   140133525:	je     140133538 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xef88>
   140133527:	mov    0x720(%rsp),%rax
   14013352f:	lea    0x1(%rax),%rdx
   140133533:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140133538:	mov    $0x1,%esi
   14013353d:	jmp    14012e590 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fe0>
   140133542:	mov    0x1048(%rbx),%r11
   140133549:	lea    0x10(%r13),%rax
   14013354d:	cmp    0x30(%rsp),%rax
   140133552:	jae    140137bbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1360b>
   140133558:	mov    0x1050(%rbx),%rax
   14013355f:	mov    0x1d0(%rsp),%rcx
   140133567:	mov    %r13,%rdx
   14013356a:	lea    0x10(%r13),%r13
   14013356e:	mov    %rcx,-0x10(%r13)
   140133572:	mov    0x1c8(%rsp),%rcx
   14013357a:	mov    %rcx,0x8(%rdx)
   14013357e:	jmp    1401307f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc242>
   140133583:	mov    0x1050(%rbx),%rax
   14013358a:	sub    %r11,%r13
   14013358d:	mov    %rax,%rdx
   140133590:	sub    %r11,%rdx
   140133593:	sar    $0x3,%rdx
   140133597:	lea    (%rdx,%rdx,1),%rcx
   14013359b:	cmp    %rcx,%rdx
   14013359e:	jb     140135eb2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11902>
   1401335a4:	vzeroupper
   1401335a7:	add    %r11,%r13
   1401335aa:	jmp    14012c4f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7f41>
   1401335af:	cmp    $0x1,%rax
   1401335b3:	je     140135e17 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11867>
   1401335b9:	cmp    $0x2,%rax
   1401335bd:	jne    14012f66d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb0bd>
   1401335c3:	test   %sil,%sil
   1401335c6:	je     140138b27 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14577>
   1401335cc:	sub    $0x1,%sil
   1401335d0:	je     140138197 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13be7>
   1401335d6:	lea    0x8(%r13),%rax
   1401335da:	cmp    0x30(%rsp),%rax
   1401335df:	jae    140138162 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bb2>
   1401335e5:	mov    0x1d0(%rsp),%rdx
   1401335ed:	mov    %r13,%rax
   1401335f0:	lea    0x8(%r13),%r13
   1401335f4:	mov    %rdx,(%rax)
   1401335f7:	mov    0x1c8(%rsp),%rax
   1401335ff:	movslq %edi,%rdx
   140133602:	mov    %rax,0x1d0(%rsp)
   14013360a:	jmp    140131ac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd511>
   14013360f:	mov    0x1068(%rbx),%rax
   140133616:	mov    0x1c8(%rsp),%rdx
   14013361e:	mov    $0x1,%esi
   140133623:	mov    %rdx,0x8(%rax,%rbp,8)
   140133628:	mov    0x1d0(%rsp),%rax
   140133630:	mov    %rax,0x1c8(%rsp)
   140133638:	jmp    14012897b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x43cb>
   14013363d:	mov    0x1c8(%rsp),%rax
   140133645:	mov    %rax,0x380(%rsp)
   14013364d:	mov    %r13,%rax
   140133650:	lea    -0x8(%r13),%r13
   140133654:	mov    -0x8(%rax),%rax
   140133658:	mov    %rax,0x378(%rsp)
   140133660:	jmp    140128fbb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4a0b>
   140133665:	mov    0x1068(%rbx),%rax
   14013366c:	mov    0x1c8(%rsp),%rdx
   140133674:	mov    $0x1,%esi
   140133679:	mov    %rdx,(%rax,%rbp,8)
   14013367d:	mov    0x1d0(%rsp),%rax
   140133685:	mov    %rax,0x1c8(%rsp)
   14013368d:	jmp    140128939 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4389>
   140133692:	mov    0x1c8(%rsp),%rax
   14013369a:	mov    %rax,0x338(%rsp)
   1401336a2:	mov    %r13,%rax
   1401336a5:	lea    -0x8(%r13),%r13
   1401336a9:	mov    -0x8(%rax),%rax
   1401336ad:	mov    %rax,0x330(%rsp)
   1401336b5:	jmp    140128bda <setun::VM::run_optimized(setun::OptimizedChunk&)+0x462a>
   1401336ba:	mov    0x1068(%rbx),%rax
   1401336c1:	mov    0x1c8(%rsp),%rdx
   1401336c9:	mov    $0x1,%esi
   1401336ce:	mov    %rdx,0x18(%rax,%rbp,8)
   1401336d3:	mov    0x1d0(%rsp),%rax
   1401336db:	mov    %rax,0x1c8(%rsp)
   1401336e3:	jmp    1401289ff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x444f>
   1401336e8:	mov    0x1050(%rbx),%rax
   1401336ef:	sub    %r11,%r13
   1401336f2:	mov    %rax,%rdx
   1401336f5:	sub    %r11,%rdx
   1401336f8:	sar    $0x3,%rdx
   1401336fc:	lea    (%rdx,%rdx,1),%rcx
   140133700:	cmp    %rcx,%rdx
   140133703:	jb     140134c9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106ed>
   140133709:	vzeroupper
   14013370c:	add    %r11,%r13
   14013370f:	jmp    14012c842 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8292>
   140133714:	mov    0x1050(%rbx),%rax
   14013371b:	sub    %r11,%r13
   14013371e:	mov    %rax,%rdx
   140133721:	sub    %r11,%rdx
   140133724:	sar    $0x3,%rdx
   140133728:	lea    (%rdx,%rdx,1),%rcx
   14013372c:	cmp    %rcx,%rdx
   14013372f:	jb     140134735 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10185>
   140133735:	vzeroupper
   140133738:	add    %r11,%r13
   14013373b:	jmp    14012c4ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7efd>
   140133740:	mov    0x1c8(%rsp),%rax
   140133748:	mov    %rax,0x310(%rsp)
   140133750:	mov    %r13,%rax
   140133753:	lea    -0x8(%r13),%r13
   140133757:	mov    -0x8(%rax),%rax
   14013375b:	jmp    14012ad6a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67ba>
   140133760:	mov    0x1050(%rbx),%rax
   140133767:	mov    0x1048(%rbx),%r11
   14013376e:	mov    %rax,%rdx
   140133771:	sub    %r11,%r13
   140133774:	sub    %r11,%rdx
   140133777:	sar    $0x3,%rdx
   14013377b:	lea    (%rdx,%rdx,1),%rcx
   14013377f:	cmp    %rcx,%rdx
   140133782:	jb     140135bc1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11611>
   140133788:	vzeroupper
   14013378b:	mov    %rax,0x30(%rsp)
   140133790:	add    %r11,%r13
   140133793:	jmp    14012abd2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6622>
   140133798:	mov    0x1c8(%rsp),%rax
   1401337a0:	mov    %rax,0x360(%rsp)
   1401337a8:	mov    %r13,%rax
   1401337ab:	lea    -0x8(%r13),%r13
   1401337af:	mov    -0x8(%rax),%rax
   1401337b3:	mov    %rax,0x358(%rsp)
   1401337bb:	jmp    140128e43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4893>
   1401337c0:	mov    0x1c8(%rsp),%rax
   1401337c8:	mov    %rax,0x3a0(%rsp)
   1401337d0:	mov    %r13,%rax
   1401337d3:	lea    -0x8(%r13),%r13
   1401337d7:	mov    -0x8(%rax),%rax
   1401337db:	mov    %rax,0x398(%rsp)
   1401337e3:	jmp    1401291db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4c2b>
   1401337e8:	movzwl 0x6(%r9),%eax
   1401337ed:	lea    0x3f0(%rsp),%r8
   1401337f5:	mov    %rdi,%rcx
   1401337f8:	mov    %r9,0x60(%rsp)
   1401337fd:	shl    $0x5,%rax
   140133801:	add    0x30(%r14),%rax
   140133805:	mov    %rax,%rdx
   140133808:	mov    %rax,0x40(%rsp)
   14013380d:	call   140212080 <setun::VMObject::set_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, setun::VMValue const&)>
   140133812:	mov    0x38(%rdi),%rdx
   140133816:	test   %rdx,%rdx
   140133819:	je     140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   14013381f:	mov    0x40(%rsp),%r8
   140133824:	lea    0x710(%rsp),%rcx
   14013382c:	add    $0x28,%rdx
   140133830:	call   1402228a0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140133835:	mov    0x710(%rsp),%rax
   14013383d:	test   %rax,%rax
   140133840:	je     140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   140133846:	mov    (%rax),%rax
   140133849:	test   %rax,%rax
   14013384c:	je     140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   140133852:	mov    0x38(%rdi),%rdx
   140133856:	movzwl 0x28(%rax),%eax
   14013385a:	mov    0x60(%rsp),%r9
   14013385f:	mov    (%rdx),%edx
   140133861:	mov    %ax,0x4(%r9)
   140133866:	mov    %edx,(%r9)
   140133869:	jmp    140128665 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x40b5>
   14013386e:	mov    0x1050(%rbx),%rax
   140133875:	sub    %r11,%r13
   140133878:	mov    %rax,%rdx
   14013387b:	sub    %r11,%rdx
   14013387e:	sar    $0x3,%rdx
   140133882:	lea    (%rdx,%rdx,1),%rcx
   140133886:	cmp    %rcx,%rdx
   140133889:	jb     140136027 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a77>
   14013388f:	vzeroupper
   140133892:	add    %r11,%r13
   140133895:	jmp    14012bef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7948>
   14013389a:	mov    0x1050(%rbx),%rax
   1401338a1:	sub    %r11,%r13
   1401338a4:	mov    %rax,%rdx
   1401338a7:	sub    %r11,%rdx
   1401338aa:	sar    $0x3,%rdx
   1401338ae:	lea    (%rdx,%rdx,1),%rcx
   1401338b2:	cmp    %rcx,%rdx
   1401338b5:	jb     140135c82 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116d2>
   1401338bb:	vzeroupper
   1401338be:	add    %r11,%r13
   1401338c1:	jmp    14012c952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83a2>
   1401338c6:	mov    0x1c8(%rsp),%rax
   1401338ce:	mov    %rax,0x2b0(%rsp)
   1401338d6:	mov    %r13,%rax
   1401338d9:	lea    -0x8(%r13),%r13
   1401338dd:	mov    -0x8(%rax),%rax
   1401338e1:	mov    %rax,0x2a8(%rsp)
   1401338e9:	jmp    140126729 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2179>
   1401338ee:	mov    0x1c8(%rsp),%rax
   1401338f6:	mov    %rax,0x3d0(%rsp)
   1401338fe:	mov    %r13,%rax
   140133901:	lea    -0x8(%r13),%r13
   140133905:	mov    -0x8(%rax),%rax
   140133909:	mov    %rax,0x3c8(%rsp)
   140133911:	jmp    140129609 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x5059>
   140133916:	mov    0x1050(%rbx),%rax
   14013391d:	sub    %r11,%r13
   140133920:	mov    %rax,%rdx
   140133923:	sub    %r11,%rdx
   140133926:	sar    $0x3,%rdx
   14013392a:	lea    (%rdx,%rdx,1),%rcx
   14013392e:	cmp    %rcx,%rdx
   140133931:	jb     1401364d2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f22>
   140133937:	vzeroupper
   14013393a:	add    %r11,%r13
   14013393d:	jmp    14012c219 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7c69>
   140133942:	mov    0x1c8(%rsp),%rax
   14013394a:	mov    %rax,0x220(%rsp)
   140133952:	mov    %r13,%rax
   140133955:	lea    -0x8(%r13),%r13
   140133959:	mov    -0x8(%rax),%rax
   14013395d:	mov    %rax,0x218(%rsp)
   140133965:	jmp    14012602b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1a7b>
   14013396a:	lea    0x1048(%rbx),%rcx
   140133971:	lea    (%rdi,%rdi,1),%rdx
   140133975:	vzeroupper
   140133978:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013397d:	mov    0x15270(%rbx),%rcx
   140133984:	jmp    140131587 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfd7>
   140133989:	lea    0x710(%rsp),%rcx
   140133991:	lea    0x229125(%rip),%rdx        # 14035cabd <.rdata+0x4fd>
   140133998:	call   14020f640 <setun::VMValue::VMValue(char const*)>
   14013399d:	mov    0x710(%rsp),%rax
   1401339a5:	mov    %rax,0x1c8(%rsp)
   1401339ad:	mov    $0x1,%esi
   1401339b2:	jmp    14012ce43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8893>
   1401339b7:	mov    0x1050(%rbx),%rax
   1401339be:	sub    %r11,%r13
   1401339c1:	mov    %rax,%rdx
   1401339c4:	sub    %r11,%rdx
   1401339c7:	sar    $0x3,%rdx
   1401339cb:	lea    (%rdx,%rdx,1),%rcx
   1401339cf:	cmp    %rcx,%rdx
   1401339d2:	jb     140135fe0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a30>
   1401339d8:	add    %r11,%r13
   1401339db:	jmp    14012e42c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9e7c>
   1401339e0:	mov    0x1050(%rbx),%rax
   1401339e7:	sub    %r11,%r13
   1401339ea:	mov    %rax,%rdx
   1401339ed:	sub    %r11,%rdx
   1401339f0:	sar    $0x3,%rdx
   1401339f4:	lea    (%rdx,%rdx,1),%rcx
   1401339f8:	cmp    %rcx,%rdx
   1401339fb:	jb     1401345ab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfffb>
   140133a01:	vzeroupper
   140133a04:	add    %r11,%r13
   140133a07:	jmp    14012bf74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x79c4>
   140133a0c:	mov    0x1c8(%rsp),%rax
   140133a14:	mov    %rax,0x290(%rsp)
   140133a1c:	mov    %r13,%rax
   140133a1f:	lea    -0x8(%r13),%r13
   140133a23:	mov    -0x8(%rax),%rax
   140133a27:	mov    %rax,0x288(%rsp)
   140133a2f:	jmp    1401264d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1f24>
   140133a34:	mov    0x1050(%rbx),%rax
   140133a3b:	sub    %r11,%r13
   140133a3e:	mov    %rax,%rdx
   140133a41:	sub    %r11,%rdx
   140133a44:	sar    $0x3,%rdx
   140133a48:	lea    (%rdx,%rdx,1),%rcx
   140133a4c:	cmp    %rcx,%rdx
   140133a4f:	jb     14013636f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11dbf>
   140133a55:	vzeroupper
   140133a58:	add    %r11,%r13
   140133a5b:	jmp    14012b6e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7139>
   140133a60:	mov    0x1068(%rbx),%rax
   140133a67:	mov    0x1c8(%rsp),%rdx
   140133a6f:	mov    $0x1,%esi
   140133a74:	mov    %rdx,0x10(%rax,%rbp,8)
   140133a79:	mov    0x1d0(%rsp),%rax
   140133a81:	mov    %rax,0x1c8(%rsp)
   140133a89:	jmp    1401289bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x440d>
   140133a8e:	mov    0x1050(%rbx),%rax
   140133a95:	mov    0x1048(%rbx),%r11
   140133a9c:	mov    %rax,%rdx
   140133a9f:	sub    %r11,%r13
   140133aa2:	sub    %r11,%rdx
   140133aa5:	sar    $0x3,%rdx
   140133aa9:	lea    (%rdx,%rdx,1),%rcx
   140133aad:	cmp    %rcx,%rdx
   140133ab0:	jb     140136861 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122b1>
   140133ab6:	mov    %rax,0x30(%rsp)
   140133abb:	add    %r11,%r13
   140133abe:	jmp    14012b25f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6caf>
   140133ac3:	mov    0x1c8(%rsp),%rax
   140133acb:	mov    %rax,0x250(%rsp)
   140133ad3:	mov    %r13,%rax
   140133ad6:	lea    -0x8(%r13),%r13
   140133ada:	mov    -0x8(%rax),%rax
   140133ade:	mov    %rax,0x248(%rsp)
   140133ae6:	jmp    1401261cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1c1c>
   140133aeb:	mov    0x1050(%rbx),%rax
   140133af2:	mov    0x1048(%rbx),%r11
   140133af9:	mov    %rax,%rdx
   140133afc:	sub    %r11,%r13
   140133aff:	sub    %r11,%rdx
   140133b02:	sar    $0x3,%rdx
   140133b06:	lea    (%rdx,%rdx,1),%rcx
   140133b0a:	cmp    %rcx,%rdx
   140133b0d:	jb     14013683c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1228c>
   140133b13:	mov    %rax,0x30(%rsp)
   140133b18:	add    %r11,%r13
   140133b1b:	jmp    140125c76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x16c6>
   140133b20:	mov    0x1c8(%rsp),%rax
   140133b28:	mov    %rax,0x2c0(%rsp)
   140133b30:	mov    %r13,%rax
   140133b33:	lea    -0x8(%r13),%r13
   140133b37:	mov    -0x8(%rax),%rax
   140133b3b:	mov    %rax,0x2b8(%rsp)
   140133b43:	jmp    14012685c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x22ac>
   140133b48:	mov    0x1c8(%rsp),%rax
   140133b50:	mov    %rax,0x270(%rsp)
   140133b58:	mov    %r13,%rax
   140133b5b:	lea    -0x8(%r13),%r13
   140133b5f:	mov    -0x8(%rax),%rax
   140133b63:	mov    %rax,0x268(%rsp)
   140133b6b:	jmp    1401262e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1d32>
   140133b70:	mov    0x1050(%rbx),%rax
   140133b77:	sub    %r11,%r13
   140133b7a:	mov    %rax,%rdx
   140133b7d:	sub    %r11,%rdx
   140133b80:	sar    $0x3,%rdx
   140133b84:	lea    (%rdx,%rdx,1),%rcx
   140133b88:	cmp    %rcx,%rdx
   140133b8b:	jb     14013650e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f5e>
   140133b91:	vzeroupper
   140133b94:	add    %r11,%r13
   140133b97:	jmp    14012c177 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7bc7>
   140133b9c:	mov    0x1050(%rbx),%rax
   140133ba3:	mov    0x1048(%rbx),%r11
   140133baa:	mov    %rax,%rdx
   140133bad:	sub    %r11,%r13
   140133bb0:	sub    %r11,%rdx
   140133bb3:	sar    $0x3,%rdx
   140133bb7:	lea    (%rdx,%rdx,1),%rcx
   140133bbb:	cmp    %rcx,%rdx
   140133bbe:	jb     140134b5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105ac>
   140133bc4:	mov    %rax,0x30(%rsp)
   140133bc9:	add    %r11,%r13
   140133bcc:	jmp    14012be6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x78be>
   140133bd1:	mov    0x1050(%rbx),%rax
   140133bd8:	mov    0x1048(%rbx),%r11
   140133bdf:	mov    %rax,%rdx
   140133be2:	sub    %r11,%r13
   140133be5:	sub    %r11,%rdx
   140133be8:	sar    $0x3,%rdx
   140133bec:	lea    (%rdx,%rdx,1),%rcx
   140133bf0:	cmp    %rcx,%rdx
   140133bf3:	jb     14013475a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101aa>
   140133bf9:	mov    %rax,0x30(%rsp)
   140133bfe:	add    %r11,%r13
   140133c01:	jmp    140125b61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15b1>
   140133c06:	mov    0x1050(%rbx),%rax
   140133c0d:	mov    0x1048(%rbx),%rsi
   140133c14:	mov    %rax,%rdx
   140133c17:	mov    %rsi,%r11
   140133c1a:	sub    %rsi,%rdx
   140133c1d:	sar    $0x3,%rdx
   140133c21:	lea    (%rdx,%rdx,1),%rcx
   140133c25:	cmp    %rcx,%rdx
   140133c28:	jb     140135cdc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1172c>
   140133c2e:	sub    %rsi,%r13
   140133c31:	mov    %rax,0x30(%rsp)
   140133c36:	add    %r11,%r13
   140133c39:	jmp    14012dd48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9798>
   140133c3e:	mov    0x1050(%rbx),%rax
   140133c45:	mov    0x1048(%rbx),%r11
   140133c4c:	mov    %rax,%rdx
   140133c4f:	sub    %r11,%r13
   140133c52:	sub    %r11,%rdx
   140133c55:	sar    $0x3,%rdx
   140133c59:	lea    (%rdx,%rdx,1),%rcx
   140133c5d:	cmp    %rcx,%rdx
   140133c60:	jb     140136533 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11f83>
   140133c66:	vzeroupper
   140133c69:	mov    %rax,0x30(%rsp)
   140133c6e:	add    %r11,%r13
   140133c71:	jmp    14012bf2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x797e>
   140133c76:	mov    0x1050(%rbx),%rax
   140133c7d:	mov    0x1048(%rbx),%r11
   140133c84:	mov    %rax,%rdx
   140133c87:	sub    %r11,%r13
   140133c8a:	sub    %r11,%rdx
   140133c8d:	sar    $0x3,%rdx
   140133c91:	lea    (%rdx,%rdx,1),%rcx
   140133c95:	cmp    %rcx,%rdx
   140133c98:	jb     140134a43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10493>
   140133c9e:	mov    %rax,0x30(%rsp)
   140133ca3:	add    %r11,%r13
   140133ca6:	jmp    14012ae7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x68cc>
   140133cab:	mov    0x1050(%rbx),%rax
   140133cb2:	sub    %r11,%r13
   140133cb5:	mov    %rax,%rdx
   140133cb8:	sub    %r11,%rdx
   140133cbb:	sar    $0x3,%rdx
   140133cbf:	lea    (%rdx,%rdx,1),%rcx
   140133cc3:	cmp    %rcx,%rdx
   140133cc6:	jb     140134561 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffb1>
   140133ccc:	vzeroupper
   140133ccf:	add    %r11,%r13
   140133cd2:	jmp    14012b9ee <setun::VM::run_optimized(setun::OptimizedChunk&)+0x743e>
   140133cd7:	mov    0x1050(%rbx),%rax
   140133cde:	sub    %r11,%r13
   140133ce1:	mov    %rax,%rdx
   140133ce4:	sub    %r11,%rdx
   140133ce7:	sar    $0x3,%rdx
   140133ceb:	lea    (%rdx,%rdx,1),%rcx
   140133cef:	cmp    %rcx,%rdx
   140133cf2:	jb     140135a1a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1146a>
   140133cf8:	vzeroupper
   140133cfb:	add    %r11,%r13
   140133cfe:	jmp    14012c90e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x835e>
   140133d03:	shr    $0x20,%rax
   140133d07:	cmp    $0x1,%ax
   140133d0b:	je     140135d23 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11773>
   140133d11:	cmp    $0x5,%ax
   140133d15:	jne    140130d01 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc751>
   140133d1b:	mov    0x60(%rsp),%rcx
   140133d20:	mov    %r8,0x80(%rsp)
   140133d28:	call   14021b2c0 <setun::VMValue::as_int() const>
   140133d2d:	jmp    140130d18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc768>
   140133d32:	lea    0x1048(%rbx),%rcx
   140133d39:	lea    (%rdi,%rdi,1),%rdx
   140133d3d:	vzeroupper
   140133d40:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140133d45:	mov    0x15270(%rbx),%rcx
   140133d4c:	jmp    1401316dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd12c>
   140133d51:	mov    0x1c8(%rsp),%rax
   140133d59:	mov    %rax,0x1f0(%rsp)
   140133d61:	mov    %r13,%rax
   140133d64:	lea    -0x8(%r13),%r13
   140133d68:	mov    -0x8(%rax),%rax
   140133d6c:	mov    %rax,0x1e8(%rsp)
   140133d74:	jmp    140125e34 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1884>
   140133d79:	mov    0x1050(%rbx),%rax
   140133d80:	sub    %r11,%r13
   140133d83:	mov    %rax,%rdx
   140133d86:	sub    %r11,%rdx
   140133d89:	sar    $0x3,%rdx
   140133d8d:	lea    (%rdx,%rdx,1),%rcx
   140133d91:	cmp    %rcx,%rdx
   140133d94:	jb     140136558 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11fa8>
   140133d9a:	vzeroupper
   140133d9d:	add    %r11,%r13
   140133da0:	jmp    14012beb4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7904>
   140133da5:	mov    0x1050(%rbx),%rax
   140133dac:	mov    0x1048(%rbx),%r11
   140133db3:	mov    %rax,%rdx
   140133db6:	sub    %r11,%r13
   140133db9:	sub    %r11,%rdx
   140133dbc:	sar    $0x3,%rdx
   140133dc0:	lea    (%rdx,%rdx,1),%rcx
   140133dc4:	cmp    %rcx,%rdx
   140133dc7:	jb     140134c78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106c8>
   140133dcd:	mov    %rax,0x30(%rsp)
   140133dd2:	add    %r11,%r13
   140133dd5:	jmp    14012aef5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6945>
   140133dda:	lea    0x710(%rsp),%rcx
   140133de2:	lea    0x228cd4(%rip),%rdx        # 14035cabd <.rdata+0x4fd>
   140133de9:	call   14020f640 <setun::VMValue::VMValue(char const*)>
   140133dee:	mov    0x710(%rsp),%rax
   140133df6:	mov    %rax,0x1c8(%rsp)
   140133dfe:	mov    $0x1,%esi
   140133e03:	jmp    14012d61a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x906a>
   140133e08:	mov    0x1050(%rbx),%rax
   140133e0f:	sub    %r11,%r13
   140133e12:	mov    %rax,%rdx
   140133e15:	sub    %r11,%rdx
   140133e18:	sar    $0x3,%rdx
   140133e1c:	lea    (%rdx,%rdx,1),%rcx
   140133e20:	cmp    %rcx,%rdx
   140133e23:	jb     1401347f9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10249>
   140133e29:	vzeroupper
   140133e2c:	add    %r11,%r13
   140133e2f:	jmp    14012c886 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x82d6>
   140133e34:	mov    0x1050(%rbx),%rax
   140133e3b:	sub    %r11,%r13
   140133e3e:	mov    %rax,%rdx
   140133e41:	sub    %r11,%rdx
   140133e44:	sar    $0x3,%rdx
   140133e48:	lea    (%rdx,%rdx,1),%rcx
   140133e4c:	cmp    %rcx,%rdx
   140133e4f:	jb     140135cfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1174e>
   140133e55:	add    %r11,%r13
   140133e58:	jmp    14012cb2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x857b>
   140133e5d:	shr    $0x20,%rax
   140133e61:	cmp    $0x1,%ax
   140133e65:	je     14013631a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d6a>
   140133e6b:	cmp    $0x5,%ax
   140133e6f:	jne    1401322a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcf3>
   140133e75:	mov    %r11,%rcx
   140133e78:	mov    %r9,0x60(%rsp)
   140133e7d:	call   14021b2c0 <setun::VMValue::as_int() const>
   140133e82:	jmp    1401322b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd05>
   140133e87:	mov    0x1050(%rbx),%rax
   140133e8e:	sub    %r11,%r13
   140133e91:	mov    %rax,%rdx
   140133e94:	sub    %r11,%rdx
   140133e97:	sar    $0x3,%rdx
   140133e9b:	lea    (%rdx,%rdx,1),%rcx
   140133e9f:	cmp    %rcx,%rdx
   140133ea2:	jb     1401345fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1004c>
   140133ea8:	vzeroupper
   140133eab:	add    %r11,%r13
   140133eae:	jmp    14012b9aa <setun::VM::run_optimized(setun::OptimizedChunk&)+0x73fa>
   140133eb3:	mov    0x1c8(%rsp),%rax
   140133ebb:	mov    $0x1,%esi
   140133ec0:	mov    %rax,0x2f8(%rsp)
   140133ec8:	mov    0x1d0(%rsp),%rax
   140133ed0:	mov    %rax,0x1c8(%rsp)
   140133ed8:	jmp    140126d50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x27a0>
   140133edd:	mov    0x1c8(%rsp),%rax
   140133ee5:	mov    %rax,0x260(%rsp)
   140133eed:	mov    %r13,%rax
   140133ef0:	lea    -0x8(%r13),%r13
   140133ef4:	mov    -0x8(%rax),%rax
   140133ef8:	mov    %rax,0x258(%rsp)
   140133f00:	jmp    140126257 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1ca7>
   140133f05:	mov    0x1050(%rbx),%rax
   140133f0c:	sub    %r11,%r13
   140133f0f:	mov    %rax,%rdx
   140133f12:	sub    %r11,%rdx
   140133f15:	sar    $0x3,%rdx
   140133f19:	lea    (%rdx,%rdx,1),%rcx
   140133f1d:	cmp    %rcx,%rdx
   140133f20:	jb     140134586 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffd6>
   140133f26:	vzeroupper
   140133f29:	add    %r11,%r13
   140133f2c:	jmp    14012caea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x853a>
   140133f31:	mov    0x1c8(%rsp),%rax
   140133f39:	mov    %rax,0x2e0(%rsp)
   140133f41:	mov    %r13,%rax
   140133f44:	lea    -0x8(%r13),%r13
   140133f48:	mov    -0x8(%rax),%rax
   140133f4c:	mov    %rax,0x2d8(%rsp)
   140133f54:	jmp    140126ac2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2512>
   140133f59:	mov    0x1c8(%rsp),%rax
   140133f61:	mov    %rax,0x230(%rsp)
   140133f69:	mov    %r13,%rax
   140133f6c:	lea    -0x8(%r13),%r13
   140133f70:	mov    -0x8(%rax),%rax
   140133f74:	mov    %rax,0x228(%rsp)
   140133f7c:	jmp    1401260b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b06>
   140133f81:	mov    0x1050(%rbx),%rax
   140133f88:	sub    %r11,%r13
   140133f8b:	mov    %rax,%rdx
   140133f8e:	sub    %r11,%rdx
   140133f91:	sar    $0x3,%rdx
   140133f95:	lea    (%rdx,%rdx,1),%rcx
   140133f99:	cmp    %rcx,%rdx
   140133f9c:	jb     1401347a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101f8>
   140133fa2:	vzeroupper
   140133fa5:	add    %r11,%r13
   140133fa8:	jmp    14012c9da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x842a>
   140133fad:	mov    0x1050(%rbx),%rax
   140133fb4:	sub    %r11,%r13
   140133fb7:	mov    %rax,%rdx
   140133fba:	sub    %r11,%rdx
   140133fbd:	sar    $0x3,%rdx
   140133fc1:	lea    (%rdx,%rdx,1),%rcx
   140133fc5:	cmp    %rcx,%rdx
   140133fc8:	jb     1401346db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1012b>
   140133fce:	vzeroupper
   140133fd1:	add    %r11,%r13
   140133fd4:	jmp    14012cb6f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x85bf>
   140133fd9:	mov    0x40(%rsp),%rcx
   140133fde:	call   140147900 <setun::ArrayObject::size() const>
   140133fe3:	add    %rax,%rdi
   140133fe6:	jns    14012f9e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb433>
   140133fec:	jmp    14012f9f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb446>
   140133ff1:	mov    0x1050(%rbx),%rax
   140133ff8:	sub    %r11,%r13
   140133ffb:	mov    %rax,%rdx
   140133ffe:	sub    %r11,%rdx
   140134001:	sar    $0x3,%rdx
   140134005:	lea    (%rdx,%rdx,1),%rcx
   140134009:	cmp    %rcx,%rdx
   14013400c:	jb     14013481e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1026e>
   140134012:	vzeroupper
   140134015:	add    %r11,%r13
   140134018:	jmp    14012ca62 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84b2>
   14013401d:	mov    0x1050(%rbx),%rax
   140134024:	sub    %r11,%r13
   140134027:	mov    %rax,%rdx
   14013402a:	sub    %r11,%rdx
   14013402d:	sar    $0x3,%rdx
   140134031:	lea    (%rdx,%rdx,1),%rcx
   140134035:	cmp    %rcx,%rdx
   140134038:	jb     140134957 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103a7>
   14013403e:	vzeroupper
   140134041:	add    %r11,%r13
   140134044:	jmp    14012c996 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x83e6>
   140134049:	lea    (%rax,%rax,1),%rdx
   14013404d:	lea    0x1068(%rbx),%rcx
   140134054:	vzeroupper
   140134057:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013405c:	jmp    14012db5c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x95ac>
   140134061:	mov    0x1050(%rbx),%rax
   140134068:	sub    %r11,%r13
   14013406b:	mov    %rax,%rdx
   14013406e:	sub    %r11,%rdx
   140134071:	sar    $0x3,%rdx
   140134075:	lea    (%rdx,%rdx,1),%rcx
   140134079:	cmp    %rcx,%rdx
   14013407c:	jb     1401348b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10302>
   140134082:	vzeroupper
   140134085:	add    %r11,%r13
   140134088:	jmp    14012caa6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x84f6>
   14013408d:	mov    0x1050(%rbx),%rax
   140134094:	sub    %r11,%r13
   140134097:	mov    %rax,%rdx
   14013409a:	sub    %r11,%rdx
   14013409d:	sar    $0x3,%rdx
   1401340a1:	lea    (%rdx,%rdx,1),%rcx
   1401340a5:	cmp    %rcx,%rdx
   1401340a8:	jb     14013497c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103cc>
   1401340ae:	vzeroupper
   1401340b1:	add    %r11,%r13
   1401340b4:	jmp    14012cc3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x868b>
   1401340b9:	mov    0x1050(%rbx),%rax
   1401340c0:	sub    %r11,%r13
   1401340c3:	mov    %rax,%rdx
   1401340c6:	sub    %r11,%rdx
   1401340c9:	sar    $0x3,%rdx
   1401340cd:	lea    (%rdx,%rdx,1),%rcx
   1401340d1:	cmp    %rcx,%rdx
   1401340d4:	jb     140134868 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102b8>
   1401340da:	vzeroupper
   1401340dd:	add    %r11,%r13
   1401340e0:	jmp    14012ca1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x846e>
   1401340e5:	mov    0x1050(%rbx),%rax
   1401340ec:	sub    %r11,%r13
   1401340ef:	mov    %rax,%rdx
   1401340f2:	sub    %r11,%rdx
   1401340f5:	sar    $0x3,%rdx
   1401340f9:	lea    (%rdx,%rdx,1),%rcx
   1401340fd:	cmp    %rcx,%rdx
   140134100:	jb     1401349c6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10416>
   140134106:	vzeroupper
   140134109:	add    %r11,%r13
   14013410c:	jmp    14012cbb3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8603>
   140134111:	mov    0x1c8(%rsp),%rax
   140134119:	mov    %rax,0x240(%rsp)
   140134121:	mov    %r13,%rax
   140134124:	lea    -0x8(%r13),%r13
   140134128:	mov    -0x8(%rax),%rax
   14013412c:	mov    %rax,0x238(%rsp)
   140134134:	jmp    140126141 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1b91>
   140134139:	mov    0x1050(%rbx),%rax
   140134140:	sub    %r11,%r13
   140134143:	mov    %rax,%rdx
   140134146:	sub    %r11,%rdx
   140134149:	sar    $0x3,%rdx
   14013414d:	lea    (%rdx,%rdx,1),%rcx
   140134151:	cmp    %rcx,%rdx
   140134154:	jb     140134843 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10293>
   14013415a:	vzeroupper
   14013415d:	add    %r11,%r13
   140134160:	jmp    14012c77f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x81cf>
   140134165:	mov    0x1050(%rbx),%rax
   14013416c:	sub    %r11,%r13
   14013416f:	mov    %rax,%rdx
   140134172:	sub    %r11,%rdx
   140134175:	sar    $0x3,%rdx
   140134179:	lea    (%rdx,%rdx,1),%rcx
   14013417d:	cmp    %rcx,%rdx
   140134180:	jb     1401349a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x103f1>
   140134186:	vzeroupper
   140134189:	add    %r11,%r13
   14013418c:	jmp    14012cc7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x86cf>
   140134191:	mov    0x1050(%rbx),%rax
   140134198:	sub    %r11,%r13
   14013419b:	mov    %rax,%rdx
   14013419e:	sub    %r11,%rdx
   1401341a1:	sar    $0x3,%rdx
   1401341a5:	lea    (%rdx,%rdx,1),%rcx
   1401341a9:	cmp    %rcx,%rdx
   1401341ac:	jb     14013488d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x102dd>
   1401341b2:	vzeroupper
   1401341b5:	add    %r11,%r13
   1401341b8:	jmp    14012cbf7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8647>
   1401341bd:	mov    0x1050(%rbx),%rax
   1401341c4:	sub    %r11,%r13
   1401341c7:	mov    %rax,%rdx
   1401341ca:	sub    %r11,%rdx
   1401341cd:	sar    $0x3,%rdx
   1401341d1:	lea    (%rdx,%rdx,1),%rcx
   1401341d5:	cmp    %rcx,%rdx
   1401341d8:	jb     1401360d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b20>
   1401341de:	vzeroupper
   1401341e1:	add    %r11,%r13
   1401341e4:	jmp    14012ccc3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8713>
   1401341e9:	mov    0x1050(%rbx),%rax
   1401341f0:	sub    %r11,%r13
   1401341f3:	mov    %rax,%rdx
   1401341f6:	sub    %r11,%rdx
   1401341f9:	sar    $0x3,%rdx
   1401341fd:	lea    (%rdx,%rdx,1),%rcx
   140134201:	cmp    %rcx,%rdx
   140134204:	jb     1401362f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d45>
   14013420a:	vzeroupper
   14013420d:	add    %r11,%r13
   140134210:	jmp    14012ba32 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7482>
   140134215:	mov    0x1050(%rbx),%rax
   14013421c:	sub    %r11,%r13
   14013421f:	mov    %rax,%rdx
   140134222:	sub    %r11,%rdx
   140134225:	sar    $0x3,%rdx
   140134229:	lea    (%rdx,%rdx,1),%rcx
   14013422d:	cmp    %rcx,%rdx
   140134230:	jb     140134ab3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10503>
   140134236:	vzeroupper
   140134239:	add    %r11,%r13
   14013423c:	jmp    14012bb86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x75d6>
   140134241:	mov    0x1050(%rbx),%rax
   140134248:	sub    %r11,%r13
   14013424b:	mov    %rax,%rdx
   14013424e:	sub    %r11,%rdx
   140134251:	sar    $0x3,%rdx
   140134255:	lea    (%rdx,%rdx,1),%rcx
   140134259:	cmp    %rcx,%rdx
   14013425c:	jb     140135da1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117f1>
   140134262:	vzeroupper
   140134265:	add    %r11,%r13
   140134268:	jmp    14012b8b0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x7300>
   14013426d:	shr    $0x20,%rax
   140134271:	cmp    $0x1,%ax
   140134275:	je     140135a3f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1148f>
   14013427b:	cmp    $0x5,%ax
   14013427f:	jne    140132318 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd68>
   140134285:	mov    %r9,%rcx
   140134288:	mov    %r8,0x60(%rsp)
   14013428d:	call   14021b2c0 <setun::VMValue::as_int() const>
   140134292:	jmp    14013232a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd7a>
   140134297:	mov    0x1050(%rbx),%rax
   14013429e:	sub    %r11,%r13
   1401342a1:	mov    %rax,%rdx
   1401342a4:	sub    %r11,%rdx
   1401342a7:	sar    $0x3,%rdx
   1401342ab:	lea    (%rdx,%rdx,1),%rcx
   1401342af:	cmp    %rcx,%rdx
   1401342b2:	jb     140135a9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114ed>
   1401342b8:	vzeroupper
   1401342bb:	add    %r11,%r13
   1401342be:	jmp    14012baba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x750a>
   1401342c3:	mov    0x1050(%rbx),%rax
   1401342ca:	sub    %r11,%r13
   1401342cd:	mov    %rax,%rdx
   1401342d0:	sub    %r11,%rdx
   1401342d3:	sar    $0x3,%rdx
   1401342d7:	lea    (%rdx,%rdx,1),%rcx
   1401342db:	cmp    %rcx,%rdx
   1401342de:	jb     140136002 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a52>
   1401342e4:	vzeroupper
   1401342e7:	add    %r11,%r13
   1401342ea:	jmp    14012bafe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x754e>
   1401342ef:	mov    0x1c8(%rsp),%rax
   1401342f7:	mov    %rax,0x210(%rsp)
   1401342ff:	mov    %r13,%rax
   140134302:	lea    -0x8(%r13),%r13
   140134306:	mov    -0x8(%rax),%rax
   14013430a:	mov    %rax,0x208(%rsp)
   140134312:	jmp    140125fa0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x19f0>
   140134317:	shr    $0x20,%rax
   14013431b:	cmp    $0x1,%ax
   14013431f:	je     14013628e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11cde>
   140134325:	cmp    $0x5,%ax
   140134329:	jne    140130c8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc6dc>
   14013432f:	mov    0x80(%rsp),%rcx
   140134337:	call   14021b2c0 <setun::VMValue::as_int() const>
   14013433c:	lea    0x520(%rsp),%r8
   140134344:	movq   $0x0,0x528(%rsp)
   140134350:	mov    %rax,0x520(%rsp)
   140134358:	movq   $0x0,0x530(%rsp)
   140134364:	jmp    140130cc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc716>
   140134369:	shr    $0x20,%rax
   14013436d:	cmp    $0x1,%ax
   140134371:	je     14013634c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d9c>
   140134377:	cmp    $0x5,%ax
   14013437b:	jne    140130c0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc65e>
   140134381:	mov    %r11,%rcx
   140134384:	vzeroupper
   140134387:	call   14021b2c0 <setun::VMValue::as_int() const>
   14013438c:	jmp    140130c1e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc66e>
   140134391:	mov    0x1050(%rbx),%rax
   140134398:	sub    %r11,%r13
   14013439b:	mov    %rax,%rdx
   14013439e:	sub    %r11,%rdx
   1401343a1:	sar    $0x3,%rdx
   1401343a5:	lea    (%rdx,%rdx,1),%rcx
   1401343a9:	cmp    %rcx,%rdx
   1401343ac:	jb     140134510 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff60>
   1401343b2:	vzeroupper
   1401343b5:	add    %r11,%r13
   1401343b8:	jmp    14012ba76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x74c6>
   1401343bd:	mov    0x1050(%rbx),%rax
   1401343c4:	mov    0x1048(%rbx),%r11
   1401343cb:	mov    %rax,%rdx
   1401343ce:	sub    %r11,%r13
   1401343d1:	sub    %r11,%rdx
   1401343d4:	sar    $0x3,%rdx
   1401343d8:	lea    (%rdx,%rdx,1),%rcx
   1401343dc:	cmp    %rcx,%rdx
   1401343df:	jb     140135d57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117a7>
   1401343e5:	mov    %rax,0x30(%rsp)
   1401343ea:	add    %r11,%r13
   1401343ed:	jmp    14012afe9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6a39>
   1401343f2:	shr    $0x20,%rdx
   1401343f6:	cmp    $0x1,%dx
   1401343fa:	je     1401362bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11d0b>
   140134400:	cmp    $0x5,%dx
   140134404:	jne    140132216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdc66>
   14013440a:	mov    %r10,%rcx
   14013440d:	mov    %r11,0x80(%rsp)
   140134415:	mov    %r9,0x60(%rsp)
   14013441a:	call   14021b2c0 <setun::VMValue::as_int() const>
   14013441f:	mov    0x60(%rsp),%r9
   140134424:	movq   $0x0,0x508(%rsp)
   140134430:	mov    %rax,0x500(%rsp)
   140134438:	lea    0x500(%rsp),%rax
   140134440:	mov    0x80(%rsp),%r11
   140134448:	movq   $0x0,0x510(%rsp)
   140134454:	mov    %rax,0xa0(%rsp)
   14013445c:	jmp    14013226d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcbd>
   140134461:	mov    0x1050(%rbx),%rax
   140134468:	mov    0x1048(%rbx),%r11
   14013446f:	mov    %rax,%rdx
   140134472:	sub    %r11,%r13
   140134475:	sub    %r11,%rdx
   140134478:	sar    $0x3,%rdx
   14013447c:	lea    (%rdx,%rdx,1),%rcx
   140134480:	cmp    %rcx,%rdx
   140134483:	jb     140136394 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11de4>
   140134489:	mov    %rax,0x30(%rsp)
   14013448e:	add    %r11,%r13
   140134491:	jmp    14012b320 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6d70>
   140134496:	lea    0x8(%r13),%rax
   14013449a:	cmp    0x30(%rsp),%rax
   14013449f:	jae    140136ec8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12918>
   1401344a5:	mov    0x1c8(%rsp),%rdx
   1401344ad:	mov    %r13,%rax
   1401344b0:	lea    0x8(%r13),%r13
   1401344b4:	mov    %rdx,(%rax)
   1401344b7:	jmp    14012839c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x3dec>
   1401344bc:	mov    0x1050(%rbx),%rax
   1401344c3:	sub    %r11,%r13
   1401344c6:	mov    %rax,%rdx
   1401344c9:	sub    %r11,%rdx
   1401344cc:	sar    $0x3,%rdx
   1401344d0:	lea    (%rdx,%rdx,1),%rcx
   1401344d4:	cmp    %rcx,%rdx
   1401344d7:	jb     140135d7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x117cc>
   1401344dd:	vzeroupper
   1401344e0:	add    %r11,%r13
   1401344e3:	jmp    14012b72d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x717d>
   1401344e8:	mov    0x1c8(%rsp),%rax
   1401344f0:	mov    %rax,0x3c0(%rsp)
   1401344f8:	mov    %r13,%rax
   1401344fb:	lea    -0x8(%r13),%r13
   1401344ff:	mov    -0x8(%rax),%rax
   140134503:	mov    %rax,0x3b8(%rsp)
   14013450b:	jmp    1401294a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4ef5>
   140134510:	mov    %rcx,%rdx
   140134513:	lea    0x1048(%rbx),%rcx
   14013451a:	vzeroupper
   14013451d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134522:	mov    0x1048(%rbx),%r11
   140134529:	mov    0x1050(%rbx),%rax
   140134530:	jmp    1401343b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe05>
   140134535:	mov    0x1050(%rbx),%rax
   14013453c:	sub    %r11,%r13
   14013453f:	mov    %rax,%rdx
   140134542:	sub    %r11,%rdx
   140134545:	sar    $0x3,%rdx
   140134549:	lea    (%rdx,%rdx,1),%rcx
   14013454d:	cmp    %rcx,%rdx
   140134550:	jb     140136bb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12601>
   140134556:	vzeroupper
   140134559:	add    %r11,%r13
   14013455c:	jmp    14012e795 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1e5>
   140134561:	mov    %rcx,%rdx
   140134564:	lea    0x1048(%rbx),%rcx
   14013456b:	vzeroupper
   14013456e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134573:	mov    0x1048(%rbx),%r11
   14013457a:	mov    0x1050(%rbx),%rax
   140134581:	jmp    140133ccf <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf71f>
   140134586:	mov    %rcx,%rdx
   140134589:	lea    0x1048(%rbx),%rcx
   140134590:	vzeroupper
   140134593:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134598:	mov    0x1048(%rbx),%r11
   14013459f:	mov    0x1050(%rbx),%rax
   1401345a6:	jmp    140133f29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf979>
   1401345ab:	mov    %rcx,%rdx
   1401345ae:	lea    0x1048(%rbx),%rcx
   1401345b5:	vzeroupper
   1401345b8:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401345bd:	mov    0x1048(%rbx),%r11
   1401345c4:	mov    0x1050(%rbx),%rax
   1401345cb:	jmp    140133a04 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf454>
   1401345d0:	mov    0x1050(%rbx),%rax
   1401345d7:	sub    %r11,%r13
   1401345da:	mov    %rax,%rdx
   1401345dd:	sub    %r11,%rdx
   1401345e0:	sar    $0x3,%rdx
   1401345e4:	lea    (%rdx,%rdx,1),%rcx
   1401345e8:	cmp    %rcx,%rdx
   1401345eb:	jb     140136b8c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125dc>
   1401345f1:	vzeroupper
   1401345f4:	add    %r11,%r13
   1401345f7:	jmp    14012ea15 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa465>
   1401345fc:	mov    %rcx,%rdx
   1401345ff:	lea    0x1048(%rbx),%rcx
   140134606:	vzeroupper
   140134609:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013460e:	mov    0x1048(%rbx),%r11
   140134615:	mov    0x1050(%rbx),%rax
   14013461c:	jmp    140133eab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8fb>
   140134621:	lea    0x310(%rsp),%rcx
   140134629:	call   14021b2c0 <setun::VMValue::as_int() const>
   14013462e:	mov    %rax,%r8
   140134631:	test   %rax,%rax
   140134634:	js     1401346a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100f1>
   140134636:	mov    %rdi,%rcx
   140134639:	mov    %r8,0x60(%rsp)
   14013463e:	call   140147900 <setun::ArrayObject::size() const>
   140134643:	mov    0x60(%rsp),%r8
   140134648:	cmp    %rax,%r8
   14013464b:	jae    14012f811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb261>
   140134651:	test   %sil,%sil
   140134654:	je     140136b26 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12576>
   14013465a:	sub    $0x1,%sil
   14013465e:	je     140134681 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100d1>
   140134660:	lea    0x8(%r13),%rax
   140134664:	cmp    0x30(%rsp),%rax
   140134669:	jae    140136b58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125a8>
   14013466f:	mov    0x1d0(%rsp),%rdx
   140134677:	mov    %r13,%rax
   14013467a:	lea    0x8(%r13),%r13
   14013467e:	mov    %rdx,(%rax)
   140134681:	mov    0x1c8(%rsp),%rax
   140134689:	mov    %r8,%rdx
   14013468c:	mov    %rdi,%rcx
   14013468f:	mov    %rax,0x1d0(%rsp)
   140134697:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   14013469c:	jmp    140132d8f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7df>
   1401346a1:	mov    %rdi,%rcx
   1401346a4:	mov    %rax,0x60(%rsp)
   1401346a9:	call   140147900 <setun::ArrayObject::size() const>
   1401346ae:	mov    0x60(%rsp),%r8
   1401346b3:	add    %rax,%r8
   1401346b6:	jns    140134636 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10086>
   1401346bc:	jmp    14012f811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb261>
   1401346c1:	mov    0x40(%rsp),%rcx
   1401346c6:	lea    0x318(%rsp),%r8
   1401346ce:	mov    %rdi,%rdx
   1401346d1:	call   14014aee0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   1401346d6:	jmp    14012f9f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb446>
   1401346db:	mov    %rcx,%rdx
   1401346de:	lea    0x1048(%rbx),%rcx
   1401346e5:	vzeroupper
   1401346e8:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401346ed:	mov    0x1048(%rbx),%r11
   1401346f4:	mov    0x1050(%rbx),%rax
   1401346fb:	jmp    140133fd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa21>
   140134700:	mov    0x1050(%rbx),%rax
   140134707:	mov    0x1048(%rbx),%r11
   14013470e:	mov    %rax,%rdx
   140134711:	sub    %r11,%r13
   140134714:	sub    %r11,%rdx
   140134717:	sar    $0x3,%rdx
   14013471b:	lea    (%rdx,%rdx,1),%rcx
   14013471f:	cmp    %rcx,%rdx
   140134722:	jb     140136c44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12694>
   140134728:	mov    %rax,0x30(%rsp)
   14013472d:	add    %r11,%r13
   140134730:	jmp    14012f391 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xade1>
   140134735:	mov    %rcx,%rdx
   140134738:	lea    0x1048(%rbx),%rcx
   14013473f:	vzeroupper
   140134742:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134747:	mov    0x1048(%rbx),%r11
   14013474e:	mov    0x1050(%rbx),%rax
   140134755:	jmp    140133738 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf188>
   14013475a:	mov    %rcx,%rdx
   14013475d:	lea    0x1048(%rbx),%rcx
   140134764:	vzeroupper
   140134767:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013476c:	mov    0x1048(%rbx),%r11
   140134773:	mov    0x1050(%rbx),%rax
   14013477a:	jmp    140133bf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf649>
   14013477f:	mov    0x1050(%rbx),%rax
   140134786:	sub    %r11,%r13
   140134789:	mov    %rax,%rdx
   14013478c:	sub    %r11,%rdx
   14013478f:	sar    $0x3,%rdx
   140134793:	lea    (%rdx,%rdx,1),%rcx
   140134797:	cmp    %rcx,%rdx
   14013479a:	jb     140136b36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12586>
   1401347a0:	add    %r11,%r13
   1401347a3:	jmp    14012e8d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa326>
   1401347a8:	mov    %rcx,%rdx
   1401347ab:	lea    0x1048(%rbx),%rcx
   1401347b2:	vzeroupper
   1401347b5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401347ba:	mov    0x1048(%rbx),%r11
   1401347c1:	mov    0x1050(%rbx),%rax
   1401347c8:	jmp    140133fa5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf9f5>
   1401347cd:	mov    0x1050(%rbx),%rax
   1401347d4:	sub    %r11,%r13
   1401347d7:	mov    %rax,%rdx
   1401347da:	sub    %r11,%rdx
   1401347dd:	sar    $0x3,%rdx
   1401347e1:	lea    (%rdx,%rdx,1),%rcx
   1401347e5:	cmp    %rcx,%rdx
   1401347e8:	jb     140136c1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1266f>
   1401347ee:	vzeroupper
   1401347f1:	add    %r11,%r13
   1401347f4:	jmp    14012e944 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa394>
   1401347f9:	mov    %rcx,%rdx
   1401347fc:	lea    0x1048(%rbx),%rcx
   140134803:	vzeroupper
   140134806:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013480b:	mov    0x1048(%rbx),%r11
   140134812:	mov    0x1050(%rbx),%rax
   140134819:	jmp    140133e2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf87c>
   14013481e:	mov    %rcx,%rdx
   140134821:	lea    0x1048(%rbx),%rcx
   140134828:	vzeroupper
   14013482b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134830:	mov    0x1048(%rbx),%r11
   140134837:	mov    0x1050(%rbx),%rax
   14013483e:	jmp    140134015 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa65>
   140134843:	mov    %rcx,%rdx
   140134846:	lea    0x1048(%rbx),%rcx
   14013484d:	vzeroupper
   140134850:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134855:	mov    0x1048(%rbx),%r11
   14013485c:	mov    0x1050(%rbx),%rax
   140134863:	jmp    14013415d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbad>
   140134868:	mov    %rcx,%rdx
   14013486b:	lea    0x1048(%rbx),%rcx
   140134872:	vzeroupper
   140134875:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013487a:	mov    0x1048(%rbx),%r11
   140134881:	mov    0x1050(%rbx),%rax
   140134888:	jmp    1401340dd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb2d>
   14013488d:	mov    %rcx,%rdx
   140134890:	lea    0x1048(%rbx),%rcx
   140134897:	vzeroupper
   14013489a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013489f:	mov    0x1048(%rbx),%r11
   1401348a6:	mov    0x1050(%rbx),%rax
   1401348ad:	jmp    1401341b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc05>
   1401348b2:	mov    %rcx,%rdx
   1401348b5:	lea    0x1048(%rbx),%rcx
   1401348bc:	vzeroupper
   1401348bf:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401348c4:	mov    0x1048(%rbx),%r11
   1401348cb:	mov    0x1050(%rbx),%rax
   1401348d2:	jmp    140134085 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfad5>
   1401348d7:	mov    0x540(%rsp),%rax
   1401348df:	lea    0x710(%rsp),%r10
   1401348e7:	mov    $0x1,%edx
   1401348ec:	lea    0x720(%rsp),%rsi
   1401348f4:	mov    %r10,%rcx
   1401348f7:	mov    %r10,0x40(%rsp)
   1401348fc:	movsbl (%rax,%rdi,1),%r8d
   140134901:	mov    %rsi,0x710(%rsp)
   140134909:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14013490e:	mov    0x40(%rsp),%rdx
   140134913:	lea    0x520(%rsp),%rcx
   14013491b:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140134920:	mov    0x520(%rsp),%rax
   140134928:	mov    0x710(%rsp),%rcx
   140134930:	mov    %rax,0x1c8(%rsp)
   140134938:	cmp    %rsi,%rcx
   14013493b:	je     1401339ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3fd>
   140134941:	mov    0x720(%rsp),%rax
   140134949:	lea    0x1(%rax),%rdx
   14013494d:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140134952:	jmp    1401339ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf3fd>
   140134957:	mov    %rcx,%rdx
   14013495a:	lea    0x1048(%rbx),%rcx
   140134961:	vzeroupper
   140134964:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134969:	mov    0x1048(%rbx),%r11
   140134970:	mov    0x1050(%rbx),%rax
   140134977:	jmp    140134041 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfa91>
   14013497c:	mov    %rcx,%rdx
   14013497f:	lea    0x1048(%rbx),%rcx
   140134986:	vzeroupper
   140134989:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013498e:	mov    0x1048(%rbx),%r11
   140134995:	mov    0x1050(%rbx),%rax
   14013499c:	jmp    1401340b1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb01>
   1401349a1:	mov    %rcx,%rdx
   1401349a4:	lea    0x1048(%rbx),%rcx
   1401349ab:	vzeroupper
   1401349ae:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401349b3:	mov    0x1048(%rbx),%r11
   1401349ba:	mov    0x1050(%rbx),%rax
   1401349c1:	jmp    140134189 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfbd9>
   1401349c6:	mov    %rcx,%rdx
   1401349c9:	lea    0x1048(%rbx),%rcx
   1401349d0:	vzeroupper
   1401349d3:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401349d8:	mov    0x1048(%rbx),%r11
   1401349df:	mov    0x1050(%rbx),%rax
   1401349e6:	jmp    140134109 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfb59>
   1401349eb:	mov    0x1050(%rbx),%rax
   1401349f2:	sub    %r11,%r13
   1401349f5:	mov    %rax,%rdx
   1401349f8:	sub    %r11,%rdx
   1401349fb:	sar    $0x3,%rdx
   1401349ff:	lea    (%rdx,%rdx,1),%rcx
   140134a03:	cmp    %rcx,%rdx
   140134a06:	jb     140138add <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1452d>
   140134a0c:	vzeroupper
   140134a0f:	add    %r11,%r13
   140134a12:	jmp    14012eb50 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa5a0>
   140134a17:	mov    0x1050(%rbx),%rax
   140134a1e:	sub    %r11,%r13
   140134a21:	mov    %rax,%rdx
   140134a24:	sub    %r11,%rdx
   140134a27:	sar    $0x3,%rdx
   140134a2b:	lea    (%rdx,%rdx,1),%rcx
   140134a2f:	cmp    %rcx,%rdx
   140134a32:	jb     1401381cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c1c>
   140134a38:	vzeroupper
   140134a3b:	add    %r11,%r13
   140134a3e:	jmp    14012ee0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa85c>
   140134a43:	mov    %rcx,%rdx
   140134a46:	lea    0x1048(%rbx),%rcx
   140134a4d:	vzeroupper
   140134a50:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134a55:	mov    0x1048(%rbx),%r11
   140134a5c:	mov    0x1050(%rbx),%rax
   140134a63:	jmp    140133c9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6ee>
   140134a68:	mov    0x40(%rsp),%rax
   140134a6d:	mov    %rdi,(%rax)
   140134a70:	lea    0x8(%rax),%r13
   140134a74:	movb   $0x0,0x1040(%rbx)
   140134a7b:	mov    0x1048(%rbx),%r11
   140134a82:	jmp    14012b0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b26>
   140134a87:	mov    0x1050(%rbx),%rax
   140134a8e:	sub    %r11,%r13
   140134a91:	mov    %rax,%rdx
   140134a94:	sub    %r11,%rdx
   140134a97:	sar    $0x3,%rdx
   140134a9b:	lea    (%rdx,%rdx,1),%rcx
   140134a9f:	cmp    %rcx,%rdx
   140134aa2:	jb     1401381f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c41>
   140134aa8:	vzeroupper
   140134aab:	add    %r11,%r13
   140134aae:	jmp    14012e803 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa253>
   140134ab3:	mov    %rcx,%rdx
   140134ab6:	lea    0x1048(%rbx),%rcx
   140134abd:	vzeroupper
   140134ac0:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134ac5:	mov    0x1048(%rbx),%r11
   140134acc:	mov    0x1050(%rbx),%rax
   140134ad3:	jmp    140134239 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc89>
   140134ad8:	mov    0x1050(%rbx),%rax
   140134adf:	sub    %r11,%r13
   140134ae2:	mov    %rax,%rdx
   140134ae5:	sub    %r11,%rdx
   140134ae8:	sar    $0x3,%rdx
   140134aec:	lea    (%rdx,%rdx,1),%rcx
   140134af0:	cmp    %rcx,%rdx
   140134af3:	jb     140138216 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c66>
   140134af9:	vzeroupper
   140134afc:	add    %r11,%r13
   140134aff:	jmp    14012ecc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa712>
   140134b04:	mov    0x1050(%rbx),%rax
   140134b0b:	sub    %r11,%r13
   140134b0e:	mov    %rax,%rdx
   140134b11:	sub    %r11,%rdx
   140134b14:	sar    $0x3,%rdx
   140134b18:	lea    (%rdx,%rdx,1),%rcx
   140134b1c:	cmp    %rcx,%rdx
   140134b1f:	jb     1401383fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e4e>
   140134b25:	vzeroupper
   140134b28:	add    %r11,%r13
   140134b2b:	jmp    14012e7cc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa21c>
   140134b30:	mov    0x1050(%rbx),%rax
   140134b37:	sub    %r11,%r13
   140134b3a:	mov    %rax,%rdx
   140134b3d:	sub    %r11,%rdx
   140134b40:	sar    $0x3,%rdx
   140134b44:	lea    (%rdx,%rdx,1),%rcx
   140134b48:	cmp    %rcx,%rdx
   140134b4b:	jb     140138364 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13db4>
   140134b51:	vzeroupper
   140134b54:	add    %r11,%r13
   140134b57:	jmp    14012e75e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa1ae>
   140134b5c:	mov    %r8d,0x30(%rsp)
   140134b61:	mov    %rcx,%rdx
   140134b64:	lea    0x1048(%rbx),%rcx
   140134b6b:	vzeroupper
   140134b6e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134b73:	mov    0x1048(%rbx),%r11
   140134b7a:	mov    0x1050(%rbx),%rax
   140134b81:	mov    0x30(%rsp),%r8d
   140134b86:	jmp    140133bc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf614>
   140134b8b:	mov    0x1050(%rbx),%rax
   140134b92:	sub    %r11,%r13
   140134b95:	mov    %rax,%rdx
   140134b98:	sub    %r11,%rdx
   140134b9b:	sar    $0x3,%rdx
   140134b9f:	lea    (%rdx,%rdx,1),%rcx
   140134ba3:	cmp    %rcx,%rdx
   140134ba6:	jb     1401383ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e0a>
   140134bac:	add    %r11,%r13
   140134baf:	jmp    14012e837 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa287>
   140134bb4:	mov    %rcx,%rdx
   140134bb7:	lea    0x1048(%rbx),%rcx
   140134bbe:	vzeroupper
   140134bc1:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134bc6:	mov    0x1048(%rbx),%r11
   140134bcd:	mov    0x1050(%rbx),%rax
   140134bd4:	jmp    140132f06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe956>
   140134bd9:	mov    0x1050(%rbx),%rax
   140134be0:	sub    %r11,%r13
   140134be3:	mov    %rax,%rdx
   140134be6:	sub    %r11,%rdx
   140134be9:	sar    $0x3,%rdx
   140134bed:	lea    (%rdx,%rdx,1),%rcx
   140134bf1:	cmp    %rcx,%rdx
   140134bf4:	jb     140138468 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13eb8>
   140134bfa:	vzeroupper
   140134bfd:	add    %r11,%r13
   140134c00:	jmp    14012e90d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa35d>
   140134c05:	mov    0x548(%rsp),%rcx
   140134c0d:	test   %rcx,%rcx
   140134c10:	je     140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   140134c16:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140134c1b:	jmp    140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   140134c20:	mov    0x1050(%rbx),%rax
   140134c27:	sub    %r11,%r13
   140134c2a:	mov    %rax,%rdx
   140134c2d:	sub    %r11,%rdx
   140134c30:	sar    $0x3,%rdx
   140134c34:	lea    (%rdx,%rdx,1),%rcx
   140134c38:	cmp    %rcx,%rdx
   140134c3b:	jb     140138316 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d66>
   140134c41:	vzeroupper
   140134c44:	add    %r11,%r13
   140134c47:	jmp    14012e97b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa3cb>
   140134c4c:	mov    0x1050(%rbx),%rax
   140134c53:	sub    %r11,%r13
   140134c56:	mov    %rax,%rdx
   140134c59:	sub    %r11,%rdx
   140134c5c:	sar    $0x3,%rdx
   140134c60:	lea    (%rdx,%rdx,1),%rcx
   140134c64:	cmp    %rcx,%rdx
   140134c67:	jb     140138bb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14600>
   140134c6d:	vzeroupper
   140134c70:	add    %r11,%r13
   140134c73:	jmp    14012ecf9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa749>
   140134c78:	mov    %rcx,%rdx
   140134c7b:	lea    0x1048(%rbx),%rcx
   140134c82:	vzeroupper
   140134c85:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134c8a:	mov    0x1048(%rbx),%r11
   140134c91:	mov    0x1050(%rbx),%rax
   140134c98:	jmp    140133dcd <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf81d>
   140134c9d:	mov    %rcx,%rdx
   140134ca0:	lea    0x1048(%rbx),%rcx
   140134ca7:	vzeroupper
   140134caa:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140134caf:	mov    0x1048(%rbx),%r11
   140134cb6:	mov    0x1050(%rbx),%rax
   140134cbd:	jmp    14013370c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf15c>
   140134cc2:	cmp    $0x1,%dil
   140134cc6:	je     140138c93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146e3>
   140134ccc:	cmp    $0x2,%sil
   140134cd0:	je     140138e0e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1485e>
   140134cd6:	cmp    $0x1,%sil
   140134cda:	jne    140138e02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14852>
   140134ce0:	mov    0x1048(%rbx),%r11
   140134ce7:	lea    0x8(%r13),%rax
   140134ceb:	cmp    0x30(%rsp),%rax
   140134cf0:	jae    140138a0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1445b>
   140134cf6:	mov    0x1c8(%rsp),%rdx
   140134cfe:	mov    %r13,%rax
   140134d01:	xor    %esi,%esi
   140134d03:	lea    0x8(%r13),%r13
   140134d07:	mov    %rdx,(%rax)
   140134d0a:	movzbl %dil,%r9d
   140134d0e:	mov    0x1068(%rbx),%rdx
   140134d15:	movzbl %dil,%eax
   140134d19:	imul   $0xfffffffffffffff8,%r9,%r8
   140134d1d:	add    %rbp,%r9
   140134d20:	lea    -0x1(%rax),%r10d
   140134d24:	xor    %eax,%eax
   140134d26:	lea    (%rdx,%r9,8),%rcx
   140134d2a:	mov    -0x8(%r13,%rax,1),%r9
   140134d2f:	mov    %r9,(%rcx,%rax,1)
   140134d33:	sub    $0x8,%rax
   140134d37:	cmp    %r8,%rax
   140134d3a:	jne    140134d2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1077a>
   140134d3c:	imul   $0xfffffffffffffff8,%r10,%r10
   140134d40:	lea    0x0(%r13,%r10,1),%rax
   140134d45:	lea    -0x10(%rax),%r13
   140134d49:	mov    -0x10(%rax),%rax
   140134d4d:	mov    %rax,(%rdx,%rbp,8)
   140134d51:	jmp    14012fe8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8db>
   140134d56:	mov    0x28(%rbp),%rdx
   140134d5a:	test   %rdx,%rdx
   140134d5d:	je     14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   140134d63:	mov    0x40(%rsp),%rax
   140134d68:	mov    0x30(%r14),%r8
   140134d6c:	mov    0x38(%r14),%rcx
   140134d70:	movzwl 0xa(%rax),%eax
   140134d74:	sub    %r8,%rcx
   140134d77:	sar    $0x5,%rcx
   140134d7b:	cmp    %rcx,%rax
   140134d7e:	jae    14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   140134d84:	shl    $0x5,%rax
   140134d88:	lea    0x710(%rsp),%rcx
   140134d90:	add    $0x40,%rdx
   140134d94:	add    %rax,%r8
   140134d97:	call   1402228a0 <std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, unsigned short> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_M_locate(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140134d9c:	mov    0x710(%rsp),%rax
   140134da4:	test   %rax,%rax
   140134da7:	je     14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   140134dad:	mov    (%rax),%rcx
   140134db0:	test   %rcx,%rcx
   140134db3:	je     14012b1a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6bf9>
   140134db9:	mov    0x88(%r14),%rax
   140134dc0:	mov    0x80(%r14),%rdx
   140134dc7:	cmp    %rdx,%rax
   140134dca:	je     140138e46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14896>
   140134dd0:	sub    %rdx,%rax
   140134dd3:	movzwl 0x28(%rcx),%r8d
   140134dd8:	xor    %r9d,%r9d
   140134ddb:	sar    $0x2,%rax
   140134ddf:	mov    %r9d,0x60(%rsp)
   140134de4:	cmp    %rax,%r8
   140134de7:	jae    140134df1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10841>
   140134de9:	mov    (%rdx,%r8,4),%eax
   140134ded:	mov    %eax,0x60(%rsp)
   140134df1:	mov    0xa0(%r14),%rax
   140134df8:	mov    0x98(%r14),%rdx
   140134dff:	cmp    %rdx,%rax
   140134e02:	je     140138ad2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14522>
   140134e08:	sub    %rdx,%rax
   140134e0b:	movzwl 0x28(%rcx),%ecx
   140134e0f:	mov    $0x20,%r8d
   140134e15:	sar    $1,%rax
   140134e18:	cmp    %rax,%rcx
   140134e1b:	jae    140134e22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10872>
   140134e1d:	movzwl (%rdx,%rcx,2),%r8d
   140134e22:	movzbl %dil,%eax
   140134e26:	mov    %r8,%rcx
   140134e29:	mov    0x1070(%rbx),%rdx
   140134e30:	mov    %rax,0x80(%rsp)
   140134e38:	add    $0x9,%rax
   140134e3c:	cmp    %r8,%rax
   140134e3f:	cmovae %rax,%rcx
   140134e43:	mov    0x38(%rbp),%rax
   140134e47:	mov    0x15268(%rbx),%rbp
   140134e4e:	sub    0x1068(%rbx),%rdx
   140134e55:	vmovd  (%rax),%xmm7
   140134e59:	mov    0x40(%rsp),%rax
   140134e5e:	sar    $0x3,%rdx
   140134e62:	mov    %rcx,0xa0(%rsp)
   140134e6a:	vpinsrd $0x1,0x60(%rsp),%xmm7,%xmm0
   140134e72:	mov    %cx,0x8(%rax)
   140134e76:	vmovq  %xmm0,(%rax)
   140134e7a:	lea    (%rcx,%rbp,1),%rax
   140134e7e:	mov    %rax,0x15268(%rbx)
   140134e85:	add    $0x40,%rax
   140134e89:	cmp    %rdx,%rax
   140134e8c:	jae    1401382d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d21>
   140134e92:	test   %dil,%dil
   140134e95:	jne    14013823b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13c8b>
   140134e9b:	cmp    $0x1,%sil
   140134e9f:	je     14013814d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b9d>
   140134ea5:	cmp    $0x2,%sil
   140134ea9:	je     14013811a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b6a>
   140134eaf:	mov    %r13,%rax
   140134eb2:	mov    0x1068(%rbx),%rdx
   140134eb9:	lea    -0x8(%r13),%r13
   140134ebd:	mov    0x1048(%rbx),%r11
   140134ec4:	mov    -0x8(%rax),%rax
   140134ec8:	mov    %rax,(%rdx,%rbp,8)
   140134ecc:	mov    %r13,%rdx
   140134ecf:	mov    0x150c0(%rbx),%rax
   140134ed6:	mov    %r12,%rcx
   140134ed9:	mov    0x60(%rsp),%r12d
   140134ede:	sub    %r11,%rdx
   140134ee1:	sub    %r15,%rcx
   140134ee4:	mov    %rdx,%rdi
   140134ee7:	sar    $0x3,%rdi
   140134eeb:	cmp    $0x7ff,%rax
   140134ef1:	ja     1401392b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d07>
   140134ef7:	lea    0x1(%rax),%r9
   140134efb:	imul   $0x28,%rax,%rax
   140134eff:	mov    %r9,0x150c0(%rbx)
   140134f06:	mov    %rcx,0x10c0(%rbx,%rax,1)
   140134f0e:	mov    0xa0(%rsp),%rcx
   140134f16:	mov    %rbp,0x10c8(%rbx,%rax,1)
   140134f1e:	mov    %rcx,0x10d8(%rbx,%rax,1)
   140134f26:	mov    0x15270(%rbx),%rcx
   140134f2d:	mov    %rdi,0x10d0(%rbx,%rax,1)
   140134f35:	mov    %r12,0x10e0(%rbx,%rax,1)
   140134f3d:	mov    0x152a0(%rbx),%rax
   140134f44:	cmp    %rax,0x68(%rcx)
   140134f48:	jae    1401380d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b28>
   140134f4e:	lea    (%r15,%r12,1),%rax
   140134f52:	mov    %rax,%r12
   140134f55:	cmpb   $0x0,0x1040(%rbx)
   140134f5c:	je     1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140134f62:	lea    0x1(%rax),%r12
   140134f66:	movzbl (%rax),%eax
   140134f69:	lea    0x28c130(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140134f70:	jmp    *(%rdi,%rax,8)
   140134f73:	nopl   0x0(%rax,%rax,1)
   140134f78:	mov    0x1050(%rbx),%rax
   140134f7f:	sub    %r11,%r13
   140134f82:	mov    %rax,%rdx
   140134f85:	sub    %r11,%rdx
   140134f88:	sar    $0x3,%rdx
   140134f8c:	lea    (%rdx,%rdx,1),%rcx
   140134f90:	cmp    %rcx,%rdx
   140134f93:	jb     140138d6e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147be>
   140134f99:	vzeroupper
   140134f9c:	add    %r11,%r13
   140134f9f:	jmp    14012eaab <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4fb>
   140134fa4:	mov    0x1050(%rbx),%rax
   140134fab:	sub    %r11,%r13
   140134fae:	mov    %rax,%rdx
   140134fb1:	sub    %r11,%rdx
   140134fb4:	sar    $0x3,%rdx
   140134fb8:	lea    (%rdx,%rdx,1),%rcx
   140134fbc:	cmp    %rcx,%rdx
   140134fbf:	jb     140138db8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14808>
   140134fc5:	vzeroupper
   140134fc8:	add    %r11,%r13
   140134fcb:	jmp    14012ed9e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7ee>
   140134fd0:	mov    0x1050(%rbx),%rax
   140134fd7:	sub    %r11,%r13
   140134fda:	mov    %rax,%rdx
   140134fdd:	sub    %r11,%rdx
   140134fe0:	sar    $0x3,%rdx
   140134fe4:	lea    (%rdx,%rdx,1),%rcx
   140134fe8:	cmp    %rcx,%rdx
   140134feb:	jb     140138d93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x147e3>
   140134ff1:	vzeroupper
   140134ff4:	add    %r11,%r13
   140134ff7:	jmp    14012ef56 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9a6>
   140134ffc:	mov    0x1050(%rbx),%rax
   140135003:	sub    %r11,%r13
   140135006:	mov    %rax,%rdx
   140135009:	sub    %r11,%rdx
   14013500c:	sar    $0x3,%rdx
   140135010:	lea    (%rdx,%rdx,1),%rcx
   140135014:	cmp    %rcx,%rdx
   140135017:	jb     140138ddd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1482d>
   14013501d:	vzeroupper
   140135020:	add    %r11,%r13
   140135023:	jmp    14012efc4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa14>
   140135028:	mov    0x1050(%rbx),%rax
   14013502f:	sub    %r11,%r13
   140135032:	mov    %rax,%rdx
   140135035:	sub    %r11,%rdx
   140135038:	sar    $0x3,%rdx
   14013503c:	lea    (%rdx,%rdx,1),%rcx
   140135040:	cmp    %rcx,%rdx
   140135043:	jb     140137ac7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13517>
   140135049:	vzeroupper
   14013504c:	add    %r11,%r13
   14013504f:	jmp    14012f032 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa82>
   140135054:	mov    0x1050(%rbx),%rax
   14013505b:	sub    %r11,%r13
   14013505e:	mov    %rax,%rdx
   140135061:	sub    %r11,%rdx
   140135064:	sar    $0x3,%rdx
   140135068:	lea    (%rdx,%rdx,1),%rcx
   14013506c:	cmp    %rcx,%rdx
   14013506f:	jb     140137451 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ea1>
   140135075:	vzeroupper
   140135078:	add    %r11,%r13
   14013507b:	jmp    14012ea4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa49c>
   140135080:	mov    %rcx,%rdx
   140135083:	lea    0x1048(%rbx),%rcx
   14013508a:	vzeroupper
   14013508d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135092:	mov    0x1048(%rbx),%r11
   140135099:	mov    0x1050(%rbx),%rax
   1401350a0:	jmp    140132f9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe9ed>
   1401350a5:	mov    0x1c8(%rsp),%rax
   1401350ad:	lea    0x710(%rsp),%rcx
   1401350b5:	lea    0x3e0(%rsp),%rdx
   1401350bd:	mov    %rax,0x1d0(%rsp)
   1401350c5:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   1401350ca:	mov    0x718(%rsp),%rdx
   1401350d2:	lea    0x540(%rsp),%rcx
   1401350da:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401350df:	jmp    14012e555 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9fa5>
   1401350e4:	mov    0x1050(%rbx),%rax
   1401350eb:	sub    %r11,%r13
   1401350ee:	mov    %rax,%rdx
   1401350f1:	sub    %r11,%rdx
   1401350f4:	sar    $0x3,%rdx
   1401350f8:	lea    (%rdx,%rdx,1),%rcx
   1401350fc:	cmp    %rcx,%rdx
   1401350ff:	jb     1401370e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b39>
   140135105:	vzeroupper
   140135108:	add    %r11,%r13
   14013510b:	jmp    14012eb19 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa569>
   140135110:	mov    0x1050(%rbx),%rax
   140135117:	sub    %r11,%r13
   14013511a:	mov    %rax,%rdx
   14013511d:	sub    %r11,%rdx
   140135120:	sar    $0x3,%rdx
   140135124:	lea    (%rdx,%rdx,1),%rcx
   140135128:	cmp    %rcx,%rdx
   14013512b:	jb     1401372f5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d45>
   140135131:	vzeroupper
   140135134:	add    %r11,%r13
   140135137:	jmp    14012ec54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6a4>
   14013513c:	mov    0x1050(%rbx),%rax
   140135143:	sub    %r11,%r13
   140135146:	mov    %rax,%rdx
   140135149:	sub    %r11,%rdx
   14013514c:	sar    $0x3,%rdx
   140135150:	lea    (%rdx,%rdx,1),%rcx
   140135154:	cmp    %rcx,%rdx
   140135157:	jb     14013731a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d6a>
   14013515d:	mov    %rax,0x30(%rsp)
   140135162:	add    %r11,%r13
   140135165:	jmp    14012f63b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb08b>
   14013516a:	mov    %rcx,%rdx
   14013516d:	lea    0x1048(%rbx),%rcx
   140135174:	vzeroupper
   140135177:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013517c:	mov    0x1048(%rbx),%r11
   140135183:	mov    0x1050(%rbx),%rax
   14013518a:	jmp    1401333ba <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee0a>
   14013518f:	call   140213660 <tersun::VMTelemetryManager::instance()>
   140135194:	cmpb   $0x0,(%rax)
   140135197:	je     1401351a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bf1>
   140135199:	addq   $0x1,0x90(%rax)
   1401351a1:	mov    0x60(%rsp),%edi
   1401351a5:	mov    0x152c8(%rbx),%rcx
   1401351ac:	xor    %r8d,%r8d
   1401351af:	movzbl 0x880(%rsp),%r9d
   1401351b8:	mov    %rdi,%rdx
   1401351bb:	call   140172290 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   1401351c0:	mov    0x1048(%rbx),%r11
   1401351c7:	mov    0x150c0(%rbx),%rax
   1401351ce:	mov    %r12,%rdx
   1401351d1:	sub    %r15,%rdx
   1401351d4:	sub    %r11,%rsi
   1401351d7:	mov    %rsi,%rcx
   1401351da:	sar    $0x3,%rsi
   1401351de:	cmp    $0x7ff,%rax
   1401351e4:	ja     1401392b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d07>
   1401351ea:	lea    0x1(%rax),%r8
   1401351ee:	lea    (%rax,%rax,4),%rax
   1401351f2:	mov    %r8,0x150c0(%rbx)
   1401351f9:	mov    %rdx,0x10c0(%rbx,%rax,8)
   140135201:	mov    0x80(%rsp),%rdx
   140135209:	mov    %rsi,0x10d0(%rbx,%rax,8)
   140135211:	mov    %rdx,0x10c8(%rbx,%rax,8)
   140135219:	mov    0x40(%rsp),%rdx
   14013521e:	mov    %rdi,0x10e0(%rbx,%rax,8)
   140135226:	mov    %rdx,0x10d8(%rbx,%rax,8)
   14013522e:	mov    0x1050(%rbx),%rax
   140135235:	sub    %r11,%rax
   140135238:	cmp    %rcx,%rax
   14013523b:	jb     140137137 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b87>
   140135241:	mov    0x878(%rsp),%rax
   140135249:	mov    %rsi,0x1060(%rbx)
   140135250:	add    %r15,%rax
   140135253:	mov    %rax,%r12
   140135256:	cmpb   $0x0,0x1040(%rbx)
   14013525d:	je     140134a7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104cb>
   140135263:	lea    0x1(%rax),%r12
   140135267:	movzbl (%rax),%eax
   14013526a:	lea    0x28be2f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135271:	xor    %esi,%esi
   140135273:	mov    0x80(%rsp),%rbp
   14013527b:	mov    (%rdi,%rax,8),%rax
   14013527f:	jmp    *%rax
   140135281:	lea    0x710(%rsp),%r10
   140135289:	lea    0x310(%rsp),%rdx
   140135291:	mov    %r10,%rcx
   140135294:	mov    %r10,0x60(%rsp)
   140135299:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   14013529e:	mov    0x40(%rsp),%rcx
   1401352a3:	mov    0x60(%rsp),%rdx
   1401352a8:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401352ad:	mov    0x710(%rsp),%rcx
   1401352b5:	mov    %rax,0x1c8(%rsp)
   1401352bd:	lea    0x720(%rsp),%rax
   1401352c5:	cmp    %rax,%rcx
   1401352c8:	je     1401352db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d2b>
   1401352ca:	mov    0x720(%rsp),%rax
   1401352d2:	lea    0x1(%rax),%rdx
   1401352d6:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401352db:	mov    $0x1,%esi
   1401352e0:	jmp    1401328d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe323>
   1401352e5:	mov    0x1050(%rbx),%rax
   1401352ec:	sub    %r11,%r13
   1401352ef:	mov    %rax,%rdx
   1401352f2:	sub    %r11,%rdx
   1401352f5:	sar    $0x3,%rdx
   1401352f9:	lea    (%rdx,%rdx,1),%rcx
   1401352fd:	cmp    %rcx,%rdx
   140135300:	jb     14013714c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b9c>
   140135306:	vzeroupper
   140135309:	add    %r11,%r13
   14013530c:	jmp    14012e86e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa2be>
   140135311:	lea    0x338(%rsp),%rdx
   140135319:	lea    0x710(%rsp),%rcx
   140135321:	call   14021cee0 <setun::VMValue::to_string[abi:cxx11]() const>
   140135326:	mov    %rdi,%rcx
   140135329:	lea    0x710(%rsp),%rdx
   140135331:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   140135336:	mov    0x710(%rsp),%rcx
   14013533e:	mov    %rax,0x1c8(%rsp)
   140135346:	lea    0x720(%rsp),%rax
   14013534e:	cmp    %rax,%rcx
   140135351:	je     14012e06e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9abe>
   140135357:	mov    0x720(%rsp),%rax
   14013535f:	lea    0x1(%rax),%rdx
   140135363:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140135368:	jmp    14012e06e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9abe>
   14013536d:	test   %sil,%sil
   140135370:	jne    1401353ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10dfd>
   140135372:	mov    $0x1fff,%eax
   140135377:	shl    $0x33,%rax
   14013537b:	mov    %rax,0x1c8(%rsp)
   140135383:	jmp    1401352db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d2b>
   140135388:	mov    %rcx,%rdx
   14013538b:	lea    0x1048(%rbx),%rcx
   140135392:	vzeroupper
   140135395:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013539a:	mov    0x1048(%rbx),%r11
   1401353a1:	mov    0x1050(%rbx),%rax
   1401353a8:	jmp    140132b31 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe581>
   1401353ad:	sub    $0x1,%sil
   1401353b1:	je     1401353d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e24>
   1401353b3:	lea    0x8(%r13),%rax
   1401353b7:	cmp    0x30(%rsp),%rax
   1401353bc:	jae    1401389d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14423>
   1401353c2:	mov    0x1d0(%rsp),%rdx
   1401353ca:	mov    %r13,%rax
   1401353cd:	lea    0x8(%r13),%r13
   1401353d1:	mov    %rdx,(%rax)
   1401353d4:	mov    0x1c8(%rsp),%rax
   1401353dc:	mov    %rax,0x1d0(%rsp)
   1401353e4:	mov    $0x1fff,%eax
   1401353e9:	shl    $0x33,%rax
   1401353ed:	mov    %rax,0x1c8(%rsp)
   1401353f5:	jmp    1401328ce <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe31e>
   1401353fa:	mov    0x1050(%rbx),%rax
   140135401:	sub    %r11,%r13
   140135404:	mov    %rax,%rdx
   140135407:	sub    %r11,%rdx
   14013540a:	sar    $0x3,%rdx
   14013540e:	lea    (%rdx,%rdx,1),%rcx
   140135412:	cmp    %rcx,%rdx
   140135415:	jb     140138ead <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148fd>
   14013541b:	vzeroupper
   14013541e:	add    %r11,%r13
   140135421:	jmp    14012ec8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa6db>
   140135426:	mov    %r9d,0x40(%rsp)
   14013542b:	add    %rdx,%rdx
   14013542e:	lea    0x1068(%rbx),%rcx
   140135435:	mov    %eax,0xa0(%rsp)
   14013543c:	mov    %r8d,0x80(%rsp)
   140135444:	vzeroupper
   140135447:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013544c:	mov    0xa0(%rsp),%eax
   140135453:	mov    0x80(%rsp),%r8d
   14013545b:	mov    0x40(%rsp),%r9d
   140135460:	jmp    14012555f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfaf>
   140135465:	cmp    $0x4,%al
   140135467:	jne    140135f5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119ad>
   14013546d:	test   %sil,%sil
   140135470:	je     140137068 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ab8>
   140135476:	sub    $0x1,%sil
   14013547a:	je     14013549d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10eed>
   14013547c:	lea    0x8(%r13),%rax
   140135480:	cmp    0x30(%rsp),%rax
   140135485:	jae    1401370b8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b08>
   14013548b:	mov    0x1d0(%rsp),%rdx
   140135493:	mov    %r13,%rax
   140135496:	lea    0x8(%r13),%r13
   14013549a:	mov    %rdx,(%rax)
   14013549d:	mov    0x1c8(%rsp),%rax
   1401354a5:	lea    0x1a0(%rsp),%rdx
   1401354ad:	mov    $0x2,%esi
   1401354b2:	lea    0x710(%rsp),%rcx
   1401354ba:	mov    %rax,0x1d0(%rsp)
   1401354c2:	imul   $0x18,%rdi,%rax
   1401354c6:	add    0x68(%r9),%rax
   1401354ca:	vmovdqu (%rax),%xmm7
   1401354ce:	vmovdqa %xmm7,0x1a0(%rsp)
   1401354d7:	mov    0x10(%rax),%rax
   1401354db:	mov    %rax,0x1b0(%rsp)
   1401354e3:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401354e8:	mov    0x710(%rsp),%rax
   1401354f0:	mov    %rax,0x1c8(%rsp)
   1401354f8:	cmpb   $0x0,0x1040(%rbx)
   1401354ff:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140135505:	mov    %r12,%rax
   140135508:	lea    0x28bb91(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013550f:	lea    0x1(%r12),%r12
   140135514:	movzbl (%rax),%eax
   140135517:	jmp    *(%rdi,%rax,8)
   14013551a:	test   %sil,%sil
   14013551d:	jne    140136f92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129e2>
   140135523:	mov    0x50(%r9),%rax
   140135527:	mov    $0x1,%esi
   14013552c:	movabs $0xfffc000000000000,%rdx
   140135536:	vmovsd (%rax,%rdi,8),%xmm0
   14013553b:	vucomisd %xmm0,%xmm0
   14013553f:	vmovq  %xmm0,%rax
   140135544:	cmovp  %rdx,%rax
   140135548:	mov    %rax,0x1c8(%rsp)
   140135550:	cmpb   $0x0,0x1040(%rbx)
   140135557:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   14013555d:	mov    %r12,%rax
   140135560:	lea    0x28bb39(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135567:	lea    0x1(%r12),%r12
   14013556c:	movzbl (%rax),%eax
   14013556f:	jmp    *(%rdi,%rax,8)
   140135572:	mov    0x1c8(%rsp),%rax
   14013557a:	mov    0x50(%rdi),%rdx
   14013557e:	sub    0x48(%rdi),%rdx
   140135582:	mov    %rax,0x1d0(%rsp)
   14013558a:	mov    0x60(%rdi),%rax
   14013558e:	sar    $0x3,%rdx
   140135592:	test   %rax,%rax
   140135595:	je     140138951 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143a1>
   14013559b:	mov    0x18(%rax),%rax
   14013559f:	jmp    14013331f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6f>
   1401355a4:	mov    0x1050(%rbx),%rax
   1401355ab:	sub    %r11,%r13
   1401355ae:	mov    %rax,%rdx
   1401355b1:	sub    %r11,%rdx
   1401355b4:	sar    $0x3,%rdx
   1401355b8:	lea    (%rdx,%rdx,1),%rcx
   1401355bc:	cmp    %rcx,%rdx
   1401355bf:	jb     140136f38 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12988>
   1401355c5:	vzeroupper
   1401355c8:	add    %r11,%r13
   1401355cb:	jmp    14012eae2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa532>
   1401355d0:	mov    %rcx,%rdx
   1401355d3:	lea    0x1048(%rbx),%rcx
   1401355da:	vzeroupper
   1401355dd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401355e2:	mov    0x1048(%rbx),%r11
   1401355e9:	mov    0x1050(%rbx),%rax
   1401355f0:	jmp    14013321b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec6b>
   1401355f5:	mov    %rcx,%rdx
   1401355f8:	lea    0x1048(%rbx),%rcx
   1401355ff:	vzeroupper
   140135602:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135607:	mov    0x1048(%rbx),%r11
   14013560e:	mov    0x1050(%rbx),%rax
   140135615:	jmp    1401330c1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb11>
   14013561a:	mov    %rcx,%rdx
   14013561d:	lea    0x1048(%rbx),%rcx
   140135624:	vzeroupper
   140135627:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013562c:	mov    0x1048(%rbx),%r11
   140135633:	mov    0x1050(%rbx),%rax
   14013563a:	jmp    1401330f6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb46>
   14013563f:	mov    0x40(%rsp),%rdx
   140135644:	mov    %rdi,%rcx
   140135647:	call   14021e0e0 <setun::VMObject::has_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   14013564c:	test   %al,%al
   14013564e:	je     140138627 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14077>
   140135654:	test   %sil,%sil
   140135657:	je     1401377a9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131f9>
   14013565d:	sub    $0x1,%sil
   140135661:	je     140135684 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110d4>
   140135663:	lea    0x8(%r13),%rax
   140135667:	cmp    0x30(%rsp),%rax
   14013566c:	jae    140138888 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142d8>
   140135672:	mov    0x1d0(%rsp),%rdx
   14013567a:	mov    %r13,%rax
   14013567d:	lea    0x8(%r13),%r13
   140135681:	mov    %rdx,(%rax)
   140135684:	mov    0x1c8(%rsp),%rax
   14013568c:	mov    0x40(%rsp),%rdx
   140135691:	mov    %rdi,%rcx
   140135694:	mov    $0x2,%esi
   140135699:	mov    %rax,0x1d0(%rsp)
   1401356a1:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401356a6:	mov    %rax,0x1c8(%rsp)
   1401356ae:	cmpb   $0x0,0x1040(%rbx)
   1401356b5:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401356bb:	mov    %r12,%rax
   1401356be:	lea    0x28b9db(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401356c5:	lea    0x1(%r12),%r12
   1401356ca:	movzbl (%rax),%eax
   1401356cd:	jmp    *(%rdi,%rax,8)
   1401356d0:	mov    0x8(%r10),%esi
   1401356d4:	lea    0x1(%rsi),%edx
   1401356d7:	xor    %esi,%esi
   1401356d9:	mov    %edx,0x8(%r10)
   1401356dd:	cmp    0xc(%r10),%edx
   1401356e1:	jb     140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   1401356e7:	mov    0x150c0(%rbx),%rsi
   1401356ee:	test   %rsi,%rsi
   1401356f1:	je     140135703 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11153>
   1401356f3:	lea    -0x1(%rsi),%rdx
   1401356f7:	imul   $0x28,%rdx,%rdx
   1401356fb:	mov    0x10e0(%rbx,%rdx,1),%rsi
   140135703:	sub    %r15,%rax
   140135706:	mov    0x1048(%rbx),%rcx
   14013570d:	mov    0x1050(%rbx),%rdx
   140135714:	mov    %rax,0x1038(%rbx)
   14013571b:	mov    0x40(%rsp),%rax
   140135720:	sub    %rcx,%rdx
   140135723:	sub    %rcx,%rax
   140135726:	mov    %rax,%rbp
   140135729:	sar    $0x3,%rbp
   14013572d:	cmp    %rax,%rdx
   140135730:	jb     1401378e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13331>
   140135736:	vzeroupper
   140135739:	mov    %rbp,0x1060(%rbx)
   140135740:	mov    %rbx,%rdx
   140135743:	mov    %rsi,%r9
   140135746:	mov    %r14,%r8
   140135749:	mov    0x60(%rsp),%eax
   14013574d:	vmovdqa 0x22836b(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   140135755:	movb   $0x0,0x153a0(%rbx)
   14013575c:	mov    0x152c8(%rbx),%rcx
   140135763:	mov    %r10,0x40(%rsp)
   140135768:	vmovdqa %xmm0,0x15390(%rbx)
   140135770:	mov    %r10,0x28(%rsp)
   140135775:	mov    %eax,0x20(%rsp)
   140135779:	call   1401735b0 <setun::JITManager::slow_tiering_coordinator_osr(setun::VM*, setun::Chunk const&, unsigned long long, unsigned int, setun::LoopHotData&)>
   14013577e:	mov    0x1048(%rbx),%r11
   140135785:	mov    0x40(%rsp),%r10
   14013578a:	mov    %eax,%edx
   14013578c:	mov    0x1060(%rbx),%rax
   140135793:	mov    0x1038(%rbx),%r12
   14013579a:	mov    0x150c0(%rbx),%rbp
   1401357a1:	lea    (%r11,%rax,8),%r13
   1401357a5:	mov    0x1050(%rbx),%rax
   1401357ac:	add    %r15,%r12
   1401357af:	test   %rbp,%rbp
   1401357b2:	mov    %rax,0x30(%rsp)
   1401357b7:	je     1401357c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11219>
   1401357b9:	lea    -0x1(%rbp),%rax
   1401357bd:	imul   $0x28,%rax,%rax
   1401357c1:	mov    0x10c8(%rbx,%rax,1),%rbp
   1401357c9:	test   %dl,%dl
   1401357cb:	jne    1401357d5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11225>
   1401357cd:	addl   $0x3e8,0xc(%r10)
   1401357d5:	xor    %esi,%esi
   1401357d7:	jmp    140126ced <setun::VM::run_optimized(setun::OptimizedChunk&)+0x273d>
   1401357dc:	lea    (%rsi,%rsi,1),%rdx
   1401357e0:	lea    0x1048(%rbx),%rcx
   1401357e7:	vzeroupper
   1401357ea:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401357ef:	jmp    14013053c <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf8c>
   1401357f4:	mov    0x1048(%rbx),%r11
   1401357fb:	lea    0x10(%r13),%rax
   1401357ff:	cmp    0x30(%rsp),%rax
   140135804:	jae    140138fd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a25>
   14013580a:	mov    0x1050(%rbx),%rax
   140135811:	mov    0x1d0(%rsp),%rcx
   140135819:	mov    %r13,%rdx
   14013581c:	lea    0x10(%r13),%r13
   140135820:	mov    %rcx,-0x10(%r13)
   140135824:	mov    0x1c8(%rsp),%rcx
   14013582c:	mov    %rcx,0x8(%rdx)
   140135830:	jmp    14013051e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf6e>
   140135835:	cmp    $0x2,%sil
   140135839:	je     140137374 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dc4>
   14013583f:	cmp    $0x1,%sil
   140135843:	je     14013733f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d8f>
   140135849:	mov    0x1048(%rbx),%r11
   140135850:	mov    0x1050(%rbx),%rax
   140135857:	vzeroupper
   14013585a:	mov    %r13,%rdx
   14013585d:	sub    %r11,%rax
   140135860:	sub    %r11,%rdx
   140135863:	mov    %rdx,%r13
   140135866:	sar    $0x3,%r13
   14013586a:	cmp    %rdx,%rax
   14013586d:	jb     140137476 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ec6>
   140135873:	mov    %r13,0x1060(%rbx)
   14013587a:	lea    0x15270(%rbx),%rcx
   140135881:	mov    %rbx,%rdx
   140135884:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   140135889:	mov    0x1060(%rbx),%rax
   140135890:	mov    0x1048(%rbx),%r11
   140135897:	lea    (%r11,%rax,8),%r13
   14013589b:	jmp    1401304e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf31>
   1401358a0:	mov    0x1050(%rbx),%rax
   1401358a7:	sub    %r11,%r13
   1401358aa:	mov    %rax,%rdx
   1401358ad:	sub    %r11,%rdx
   1401358b0:	sar    $0x3,%rdx
   1401358b4:	lea    (%rdx,%rdx,1),%rcx
   1401358b8:	cmp    %rcx,%rdx
   1401358bb:	jb     140137826 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13276>
   1401358c1:	vzeroupper
   1401358c4:	add    %r11,%r13
   1401358c7:	jmp    14012edd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa825>
   1401358cc:	mov    0x1050(%rbx),%rax
   1401358d3:	sub    %r11,%r13
   1401358d6:	mov    %rax,%rdx
   1401358d9:	sub    %r11,%rdx
   1401358dc:	sar    $0x3,%rdx
   1401358e0:	lea    (%rdx,%rdx,1),%rcx
   1401358e4:	cmp    %rcx,%rdx
   1401358e7:	jb     14013784b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1329b>
   1401358ed:	vzeroupper
   1401358f0:	add    %r11,%r13
   1401358f3:	jmp    14012ef8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa9dd>
   1401358f8:	mov    0x1050(%rbx),%rax
   1401358ff:	sub    %r11,%r13
   140135902:	mov    %rax,%rdx
   140135905:	sub    %r11,%rdx
   140135908:	sar    $0x3,%rdx
   14013590c:	lea    (%rdx,%rdx,1),%rcx
   140135910:	cmp    %rcx,%rdx
   140135913:	jb     140137b29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13579>
   140135919:	vzeroupper
   14013591c:	add    %r11,%r13
   14013591f:	jmp    14012f069 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaab9>
   140135924:	mov    0x8(%rdi),%rax
   140135928:	mov    0x340(%rsp),%rdx
   140135930:	mov    %rdx,(%rax,%r9,8)
   140135934:	cmpb   $0x0,0x1040(%rbx)
   14013593b:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   140135941:	mov    %r12,%rax
   140135944:	lea    0x28b755(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   14013594b:	lea    0x1(%r12),%r12
   140135950:	movzbl (%rax),%eax
   140135953:	jmp    *(%rdi,%rax,8)
   140135956:	mov    $0x1,%esi
   14013595b:	jmp    14012e486 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed6>
   140135960:	add    %rdx,%rdx
   140135963:	lea    0x1068(%rbx),%rcx
   14013596a:	vzeroupper
   14013596d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135972:	jmp    140126f95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x29e5>
   140135977:	mov    %rcx,%rdx
   14013597a:	lea    0x1048(%rbx),%rcx
   140135981:	vzeroupper
   140135984:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135989:	mov    0x1048(%rbx),%r11
   140135990:	mov    0x1050(%rbx),%rax
   140135997:	jmp    140132b74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe5c4>
   14013599c:	vmovdqa %xmm0,0x30(%rsp)
   1401359a2:	mov    %rcx,%rdx
   1401359a5:	lea    0x1048(%rbx),%rcx
   1401359ac:	vzeroupper
   1401359af:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401359b4:	mov    0x1048(%rbx),%r11
   1401359bb:	mov    0x1050(%rbx),%rax
   1401359c2:	vmovdqa 0x30(%rsp),%xmm0
   1401359c8:	jmp    140132dff <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe84f>
   1401359cd:	mov    0x1050(%rbx),%rax
   1401359d4:	mov    0x1048(%rbx),%r11
   1401359db:	mov    %rax,%rdx
   1401359de:	sub    %r11,%r13
   1401359e1:	sub    %r11,%rdx
   1401359e4:	sar    $0x3,%rdx
   1401359e8:	lea    (%rdx,%rdx,1),%rcx
   1401359ec:	cmp    %rcx,%rdx
   1401359ef:	jae    14012f6b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb107>
   1401359f5:	mov    %rcx,%rdx
   1401359f8:	lea    0x1048(%rbx),%rcx
   1401359ff:	vzeroupper
   140135a02:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135a07:	mov    0x1048(%rbx),%r11
   140135a0e:	mov    0x1050(%rbx),%rax
   140135a15:	jmp    14012f6b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb107>
   140135a1a:	mov    %rcx,%rdx
   140135a1d:	lea    0x1048(%rbx),%rcx
   140135a24:	vzeroupper
   140135a27:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135a2c:	mov    0x1048(%rbx),%r11
   140135a33:	mov    0x1050(%rbx),%rax
   140135a3a:	jmp    140133cfb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf74b>
   140135a3f:	lea    0x540(%rsp),%rax
   140135a47:	mov    %r9,%rdx
   140135a4a:	mov    %r8,0x80(%rsp)
   140135a52:	mov    %rax,%rcx
   140135a55:	mov    %rax,0x60(%rsp)
   140135a5a:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   140135a5f:	mov    0x60(%rsp),%rax
   140135a64:	mov    0x80(%rsp),%r8
   140135a6c:	jmp    140132357 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdda7>
   140135a71:	mov    0x1050(%rbx),%rax
   140135a78:	sub    %r11,%r13
   140135a7b:	mov    %rax,%rdx
   140135a7e:	sub    %r11,%rdx
   140135a81:	sar    $0x3,%rdx
   140135a85:	lea    (%rdx,%rdx,1),%rcx
   140135a89:	cmp    %rcx,%rdx
   140135a8c:	jb     140136e44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12894>
   140135a92:	vzeroupper
   140135a95:	add    %r11,%r13
   140135a98:	jmp    14012eee8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa938>
   140135a9d:	mov    %rcx,%rdx
   140135aa0:	lea    0x1048(%rbx),%rcx
   140135aa7:	vzeroupper
   140135aaa:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135aaf:	mov    0x1048(%rbx),%r11
   140135ab6:	mov    0x1050(%rbx),%rax
   140135abd:	jmp    1401342bb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd0b>
   140135ac2:	mov    0x540(%rsp),%rax
   140135aca:	lea    0x710(%rsp),%r10
   140135ad2:	mov    $0x1,%edx
   140135ad7:	lea    0x720(%rsp),%rsi
   140135adf:	mov    %r10,%rcx
   140135ae2:	mov    %r10,0x40(%rsp)
   140135ae7:	movsbl (%rax,%rdi,1),%r8d
   140135aec:	mov    %rsi,0x710(%rsp)
   140135af4:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   140135af9:	mov    0x40(%rsp),%rdx
   140135afe:	lea    0x520(%rsp),%rcx
   140135b06:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   140135b0b:	mov    0x520(%rsp),%rax
   140135b13:	mov    0x710(%rsp),%rcx
   140135b1b:	mov    %rax,0x1c8(%rsp)
   140135b23:	cmp    %rsi,%rcx
   140135b26:	je     140133dfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf84e>
   140135b2c:	mov    0x720(%rsp),%rax
   140135b34:	lea    0x1(%rax),%rdx
   140135b38:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140135b3d:	jmp    140133dfe <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf84e>
   140135b42:	mov    0x40(%rsp),%rdx
   140135b47:	lea    0x540(%rsp),%rcx
   140135b4f:	call   140210640 <setun::VMValue::VMValue(long long)>
   140135b54:	mov    0x540(%rsp),%rax
   140135b5c:	mov    %rax,0x1c8(%rsp)
   140135b64:	jmp    14012e06e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9abe>
   140135b69:	mov    0x1050(%rbx),%rax
   140135b70:	sub    %r11,%r13
   140135b73:	mov    %rax,%rdx
   140135b76:	sub    %r11,%rdx
   140135b79:	sar    $0x3,%rdx
   140135b7d:	lea    (%rdx,%rdx,1),%rcx
   140135b81:	cmp    %rcx,%rdx
   140135b84:	jb     140136efd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1294d>
   140135b8a:	vzeroupper
   140135b8d:	add    %r11,%r13
   140135b90:	jmp    14012ee7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa8ca>
   140135b95:	mov    0x1050(%rbx),%rax
   140135b9c:	sub    %r11,%r13
   140135b9f:	mov    %rax,%rdx
   140135ba2:	sub    %r11,%rdx
   140135ba5:	sar    $0x3,%rdx
   140135ba9:	lea    (%rdx,%rdx,1),%rcx
   140135bad:	cmp    %rcx,%rdx
   140135bb0:	jb     140137cac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136fc>
   140135bb6:	vzeroupper
   140135bb9:	add    %r11,%r13
   140135bbc:	jmp    14012ec1d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa66d>
   140135bc1:	mov    %rcx,%rdx
   140135bc4:	lea    0x1048(%rbx),%rcx
   140135bcb:	vzeroupper
   140135bce:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135bd3:	mov    0x1048(%rbx),%r11
   140135bda:	mov    0x1050(%rbx),%rax
   140135be1:	jmp    14013378b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf1db>
   140135be6:	mov    0x1048(%rbx),%r11
   140135bed:	lea    0x10(%r13),%rax
   140135bf1:	cmp    0x30(%rsp),%rax
   140135bf6:	jae    140138a39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14489>
   140135bfc:	mov    0x1050(%rbx),%rax
   140135c03:	vzeroupper
   140135c06:	mov    0x1d0(%rsp),%rcx
   140135c0e:	mov    %r13,%rdx
   140135c11:	lea    0x10(%r13),%r13
   140135c15:	mov    %rcx,-0x10(%r13)
   140135c19:	mov    0x1c8(%rsp),%rcx
   140135c21:	mov    %rcx,0x8(%rdx)
   140135c25:	jmp    140132bc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe612>
   140135c2a:	mov    0x1050(%rbx),%rax
   140135c31:	sub    %r11,%r13
   140135c34:	mov    %rax,%rdx
   140135c37:	sub    %r11,%rdx
   140135c3a:	sar    $0x3,%rdx
   140135c3e:	lea    (%rdx,%rdx,1),%rcx
   140135c42:	cmp    %rcx,%rdx
   140135c45:	jb     140138f3c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1498c>
   140135c4b:	vzeroupper
   140135c4e:	add    %r11,%r13
   140135c51:	jmp    14012ed30 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa780>
   140135c56:	mov    0x1050(%rbx),%rax
   140135c5d:	sub    %r11,%r13
   140135c60:	mov    %rax,%rdx
   140135c63:	sub    %r11,%rdx
   140135c66:	sar    $0x3,%rdx
   140135c6a:	lea    (%rdx,%rdx,1),%rcx
   140135c6e:	cmp    %rcx,%rdx
   140135c71:	jb     140138ed2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14922>
   140135c77:	vzeroupper
   140135c7a:	add    %r11,%r13
   140135c7d:	jmp    14012ef1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa96f>
   140135c82:	mov    %rcx,%rdx
   140135c85:	lea    0x1048(%rbx),%rcx
   140135c8c:	vzeroupper
   140135c8f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135c94:	mov    0x1048(%rbx),%r11
   140135c9b:	mov    0x1050(%rbx),%rax
   140135ca2:	jmp    1401338be <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf30e>
   140135ca7:	mov    0x1050(%rbx),%rax
   140135cae:	mov    0x1048(%rbx),%r11
   140135cb5:	mov    %rax,%rdx
   140135cb8:	sub    %r11,%r13
   140135cbb:	sub    %r11,%rdx
   140135cbe:	sar    $0x3,%rdx
   140135cc2:	lea    (%rdx,%rdx,1),%rcx
   140135cc6:	cmp    %rcx,%rdx
   140135cc9:	jb     140138f0d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1495d>
   140135ccf:	mov    %rax,0x30(%rsp)
   140135cd4:	add    %r11,%r13
   140135cd7:	jmp    14012ea72 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa4c2>
   140135cdc:	mov    %rcx,%rdx
   140135cdf:	lea    0x1048(%rbx),%rcx
   140135ce6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135ceb:	mov    0x1048(%rbx),%r11
   140135cf2:	mov    0x1050(%rbx),%rax
   140135cf9:	jmp    140133c2e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf67e>
   140135cfe:	mov    %rcx,%rdx
   140135d01:	lea    0x1048(%rbx),%rcx
   140135d08:	vzeroupper
   140135d0b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d10:	mov    0x1048(%rbx),%r11
   140135d17:	mov    0x1050(%rbx),%rax
   140135d1e:	jmp    140133e55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf8a5>
   140135d23:	lea    0x540(%rsp),%rax
   140135d2b:	mov    0x60(%rsp),%rdx
   140135d30:	mov    %r8,0x80(%rsp)
   140135d38:	mov    %rax,%rcx
   140135d3b:	mov    %rax,0x60(%rsp)
   140135d40:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   140135d45:	mov    0x60(%rsp),%rax
   140135d4a:	mov    0x80(%rsp),%r8
   140135d52:	jmp    140130d48 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc798>
   140135d57:	mov    %rcx,%rdx
   140135d5a:	lea    0x1048(%rbx),%rcx
   140135d61:	vzeroupper
   140135d64:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d69:	mov    0x1048(%rbx),%r11
   140135d70:	mov    0x1050(%rbx),%rax
   140135d77:	jmp    1401343e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfe35>
   140135d7c:	mov    %rcx,%rdx
   140135d7f:	lea    0x1048(%rbx),%rcx
   140135d86:	vzeroupper
   140135d89:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135d8e:	mov    0x1048(%rbx),%r11
   140135d95:	mov    0x1050(%rbx),%rax
   140135d9c:	jmp    1401344e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xff30>
   140135da1:	mov    %rcx,%rdx
   140135da4:	lea    0x1048(%rbx),%rcx
   140135dab:	vzeroupper
   140135dae:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135db3:	mov    0x1048(%rbx),%r11
   140135dba:	mov    0x1050(%rbx),%rax
   140135dc1:	jmp    140134265 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfcb5>
   140135dc6:	mov    0x1050(%rbx),%rax
   140135dcd:	sub    %r11,%r13
   140135dd0:	mov    %rax,%rdx
   140135dd3:	sub    %r11,%rdx
   140135dd6:	sar    $0x3,%rdx
   140135dda:	lea    (%rdx,%rdx,1),%rcx
   140135dde:	cmp    %rcx,%rdx
   140135de1:	jb     1401376ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1313a>
   140135de7:	vzeroupper
   140135dea:	add    %r11,%r13
   140135ded:	jmp    14012ed67 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa7b7>
   140135df2:	mov    %rcx,%rdx
   140135df5:	lea    0x1048(%rbx),%rcx
   140135dfc:	vzeroupper
   140135dff:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135e04:	mov    0x1048(%rbx),%r11
   140135e0b:	mov    0x1050(%rbx),%rax
   140135e12:	jmp    140133127 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeb77>
   140135e17:	test   %sil,%sil
   140135e1a:	je     140135b42 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11592>
   140135e20:	sub    $0x1,%sil
   140135e24:	je     140135e47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11897>
   140135e26:	lea    0x8(%r13),%rax
   140135e2a:	cmp    0x30(%rsp),%rax
   140135e2f:	jae    140138b2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1457f>
   140135e35:	mov    0x1d0(%rsp),%rdx
   140135e3d:	mov    %r13,%rax
   140135e40:	lea    0x8(%r13),%r13
   140135e44:	mov    %rdx,(%rax)
   140135e47:	mov    0x1c8(%rsp),%rax
   140135e4f:	mov    0x40(%rsp),%rdx
   140135e54:	mov    %rax,0x1d0(%rsp)
   140135e5c:	jmp    140131ac1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd511>
   140135e61:	mov    0x1050(%rbx),%rax
   140135e68:	sub    %r11,%r13
   140135e6b:	mov    %rax,%rdx
   140135e6e:	sub    %r11,%rdx
   140135e71:	sar    $0x3,%rdx
   140135e75:	lea    (%rdx,%rdx,1),%rcx
   140135e79:	cmp    %rcx,%rdx
   140135e7c:	jb     140138b02 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14552>
   140135e82:	vzeroupper
   140135e85:	add    %r11,%r13
   140135e88:	jmp    14012f0a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaaf0>
   140135e8d:	mov    %rcx,%rdx
   140135e90:	lea    0x1048(%rbx),%rcx
   140135e97:	vzeroupper
   140135e9a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135e9f:	mov    0x1048(%rbx),%r11
   140135ea6:	mov    0x1050(%rbx),%rax
   140135ead:	jmp    1401333e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xee36>
   140135eb2:	mov    %rcx,%rdx
   140135eb5:	lea    0x1048(%rbx),%rcx
   140135ebc:	vzeroupper
   140135ebf:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135ec4:	mov    0x1048(%rbx),%r11
   140135ecb:	mov    0x1050(%rbx),%rax
   140135ed2:	jmp    1401335a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeff7>
   140135ed7:	mov    0x1050(%rbx),%rax
   140135ede:	sub    %r11,%r13
   140135ee1:	mov    %rax,%rdx
   140135ee4:	sub    %r11,%rdx
   140135ee7:	sar    $0x3,%rdx
   140135eeb:	lea    (%rdx,%rdx,1),%rcx
   140135eef:	cmp    %rcx,%rdx
   140135ef2:	jb     140137e80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x138d0>
   140135ef8:	mov    %rax,0x30(%rsp)
   140135efd:	add    %r11,%r13
   140135f00:	jmp    140132407 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xde57>
   140135f05:	mov    0x1050(%rbx),%rax
   140135f0c:	sub    %r11,%r13
   140135f0f:	mov    %rax,%rdx
   140135f12:	sub    %r11,%rdx
   140135f15:	sar    $0x3,%rdx
   140135f19:	lea    (%rdx,%rdx,1),%rcx
   140135f1d:	cmp    %rcx,%rdx
   140135f20:	jb     140137656 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130a6>
   140135f26:	vzeroupper
   140135f29:	add    %r11,%r13
   140135f2c:	jmp    14012e727 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa177>
   140135f31:	mov    0x1050(%rbx),%rax
   140135f38:	sub    %r11,%r13
   140135f3b:	mov    %rax,%rdx
   140135f3e:	sub    %r11,%rdx
   140135f41:	sar    $0x3,%rdx
   140135f45:	lea    (%rdx,%rdx,1),%rcx
   140135f49:	cmp    %rcx,%rdx
   140135f4c:	jb     1401369ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1243c>
   140135f52:	vzeroupper
   140135f55:	add    %r11,%r13
   140135f58:	jmp    14012ee43 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa893>
   140135f5d:	test   %sil,%sil
   140135f60:	jne    140136d4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1279a>
   140135f66:	mov    0x8(%r9),%rax
   140135f6a:	mov    $0x1,%esi
   140135f6f:	mov    (%rax,%rdi,8),%rax
   140135f73:	mov    %rax,0x1c8(%rsp)
   140135f7b:	cmpb   $0x0,0x1040(%rbx)
   140135f82:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   140135f88:	mov    %r12,%rax
   140135f8b:	lea    0x28b10e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140135f92:	lea    0x1(%r12),%r12
   140135f97:	movzbl (%rax),%eax
   140135f9a:	jmp    *(%rdi,%rax,8)
   140135f9d:	lea    0x15270(%rbx),%rcx
   140135fa4:	mov    %rbx,%rdx
   140135fa7:	vzeroupper
   140135faa:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   140135faf:	jmp    14013159f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xcfef>
   140135fb4:	mov    0x1050(%rbx),%rax
   140135fbb:	sub    %r11,%r13
   140135fbe:	mov    %rax,%rdx
   140135fc1:	sub    %r11,%rdx
   140135fc4:	sar    $0x3,%rdx
   140135fc8:	lea    (%rdx,%rdx,1),%rcx
   140135fcc:	cmp    %rcx,%rdx
   140135fcf:	jb     140138055 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13aa5>
   140135fd5:	vzeroupper
   140135fd8:	add    %r11,%r13
   140135fdb:	jmp    14012e9b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa402>
   140135fe0:	mov    %rcx,%rdx
   140135fe3:	lea    0x1048(%rbx),%rcx
   140135fea:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140135fef:	mov    0x1048(%rbx),%r11
   140135ff6:	mov    0x1050(%rbx),%rax
   140135ffd:	jmp    1401339d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf428>
   140136002:	mov    %rcx,%rdx
   140136005:	lea    0x1048(%rbx),%rcx
   14013600c:	vzeroupper
   14013600f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136014:	mov    0x1048(%rbx),%r11
   14013601b:	mov    0x1050(%rbx),%rax
   140136022:	jmp    1401342e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfd37>
   140136027:	mov    %rcx,%rdx
   14013602a:	lea    0x1048(%rbx),%rcx
   140136031:	vzeroupper
   140136034:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136039:	mov    0x1048(%rbx),%r11
   140136040:	mov    0x1050(%rbx),%rax
   140136047:	jmp    140133892 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf2e2>
   14013604c:	mov    0x1050(%rbx),%rax
   140136053:	sub    %r11,%r13
   140136056:	mov    %rax,%rdx
   140136059:	sub    %r11,%rdx
   14013605c:	sar    $0x3,%rdx
   140136060:	lea    (%rdx,%rdx,1),%rcx
   140136064:	cmp    %rcx,%rdx
   140136067:	jb     1401376a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130f0>
   14013606d:	vzeroupper
   140136070:	add    %r11,%r13
   140136073:	jmp    14012effb <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaa4b>
   140136078:	mov    0x1050(%rbx),%rax
   14013607f:	sub    %r11,%r13
   140136082:	mov    %rax,%rdx
   140136085:	sub    %r11,%rdx
   140136088:	sar    $0x3,%rdx
   14013608c:	lea    (%rdx,%rdx,1),%rcx
   140136090:	cmp    %rcx,%rdx
   140136093:	jb     14013767b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x130cb>
   140136099:	vzeroupper
   14013609c:	add    %r11,%r13
   14013609f:	jmp    14012ebe6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa636>
   1401360a4:	mov    0x1050(%rbx),%rax
   1401360ab:	sub    %r11,%r13
   1401360ae:	mov    %rax,%rdx
   1401360b1:	sub    %r11,%rdx
   1401360b4:	sar    $0x3,%rdx
   1401360b8:	lea    (%rdx,%rdx,1),%rcx
   1401360bc:	cmp    %rcx,%rdx
   1401360bf:	jb     1401376c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13115>
   1401360c5:	vzeroupper
   1401360c8:	add    %r11,%r13
   1401360cb:	jmp    14012eeb1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa901>
   1401360d0:	mov    %rcx,%rdx
   1401360d3:	lea    0x1048(%rbx),%rcx
   1401360da:	vzeroupper
   1401360dd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401360e2:	mov    0x1048(%rbx),%r11
   1401360e9:	mov    0x1050(%rbx),%rax
   1401360f0:	jmp    1401341e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc31>
   1401360f5:	mov    0x400(%rsp),%rdi
   1401360fd:	test   %sil,%sil
   140136100:	je     140136e69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128b9>
   140136106:	sub    $0x1,%sil
   14013610a:	je     14013612d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b7d>
   14013610c:	lea    0x8(%r13),%rax
   140136110:	cmp    0x30(%rsp),%rax
   140136115:	jae    140136e93 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x128e3>
   14013611b:	mov    0x1d0(%rsp),%rdx
   140136123:	mov    %r13,%rax
   140136126:	lea    0x8(%r13),%r13
   14013612a:	mov    %rdx,(%rax)
   14013612d:	mov    0x1c8(%rsp),%rax
   140136135:	lea    0x710(%rsp),%rcx
   14013613d:	mov    %rdi,%rdx
   140136140:	mov    $0x2,%esi
   140136145:	mov    %rax,0x1d0(%rsp)
   14013614d:	call   140210640 <setun::VMValue::VMValue(long long)>
   140136152:	mov    0x710(%rsp),%rax
   14013615a:	mov    %rax,0x1c8(%rsp)
   140136162:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   140136167:	mov    0x1050(%rbx),%rax
   14013616e:	mov    0x1048(%rbx),%r11
   140136175:	mov    %rax,%rdx
   140136178:	sub    %r11,%r13
   14013617b:	sub    %r11,%rdx
   14013617e:	sar    $0x3,%rdx
   140136182:	lea    (%rdx,%rdx,1),%rcx
   140136186:	cmp    %rcx,%rdx
   140136189:	jae    140132ece <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe91e>
   14013618f:	mov    %rcx,%rdx
   140136192:	lea    0x1048(%rbx),%rcx
   140136199:	vzeroupper
   14013619c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401361a1:	mov    0x1048(%rbx),%r11
   1401361a8:	mov    0x1050(%rbx),%rax
   1401361af:	jmp    140132ece <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe91e>
   1401361b4:	mov    %r10d,0x60(%rsp)
   1401361b9:	add    %rdx,%rdx
   1401361bc:	lea    0x1068(%rbx),%rcx
   1401361c3:	mov    %r8d,0xa0(%rsp)
   1401361cb:	mov    %eax,0x80(%rsp)
   1401361d2:	vzeroupper
   1401361d5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401361da:	mov    0xa0(%rsp),%r8d
   1401361e2:	mov    0x80(%rsp),%eax
   1401361e9:	mov    0x60(%rsp),%r10d
   1401361ee:	jmp    140125366 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb6>
   1401361f3:	mov    %rcx,%rdx
   1401361f6:	lea    0x1048(%rbx),%rcx
   1401361fd:	vzeroupper
   140136200:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136205:	mov    0x1048(%rbx),%r11
   14013620c:	mov    0x1050(%rbx),%rax
   140136213:	jmp    140132fc9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xea19>
   140136218:	mov    0x1c8(%rsp),%rax
   140136220:	mov    %rax,0x1d0(%rsp)
   140136228:	movabs $0xfff8000000000003,%rax
   140136232:	mov    %rax,0x1c8(%rsp)
   14013623a:	mov    $0x2,%esi
   14013623f:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   140136244:	mov    %rcx,%rdx
   140136247:	lea    0x1048(%rbx),%rcx
   14013624e:	vzeroupper
   140136251:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136256:	mov    0x1048(%rbx),%r11
   14013625d:	mov    0x1050(%rbx),%rax
   140136264:	jmp    1401331ef <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec3f>
   140136269:	mov    %rcx,%rdx
   14013626c:	lea    0x1048(%rbx),%rcx
   140136273:	vzeroupper
   140136276:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013627b:	mov    0x1048(%rbx),%r11
   140136282:	mov    0x1050(%rbx),%rax
   140136289:	jmp    14013324b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xec9b>
   14013628e:	lea    0x520(%rsp),%r8
   140136296:	mov    0x80(%rsp),%rdx
   14013629e:	mov    %r8,%rcx
   1401362a1:	mov    %r8,0x80(%rsp)
   1401362a9:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   1401362ae:	mov    0x80(%rsp),%r8
   1401362b6:	jmp    140130cc6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc716>
   1401362bb:	lea    0x500(%rsp),%rax
   1401362c3:	mov    %r10,%rdx
   1401362c6:	mov    %r9,0x60(%rsp)
   1401362cb:	mov    %rax,%rcx
   1401362ce:	mov    %r11,0x80(%rsp)
   1401362d6:	mov    %rax,0xa0(%rsp)
   1401362de:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   1401362e3:	mov    0x60(%rsp),%r9
   1401362e8:	mov    0x80(%rsp),%r11
   1401362f0:	jmp    14013226d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdcbd>
   1401362f5:	mov    %rcx,%rdx
   1401362f8:	lea    0x1048(%rbx),%rcx
   1401362ff:	vzeroupper
   140136302:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136307:	mov    0x1048(%rbx),%r11
   14013630e:	mov    0x1050(%rbx),%rax
   140136315:	jmp    14013420d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfc5d>
   14013631a:	lea    0x520(%rsp),%r8
   140136322:	mov    %r11,%rdx
   140136325:	mov    %r9,0x80(%rsp)
   14013632d:	mov    %r8,%rcx
   140136330:	mov    %r8,0x60(%rsp)
   140136335:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14013633a:	mov    0x60(%rsp),%r8
   14013633f:	mov    0x80(%rsp),%r9
   140136347:	jmp    1401322e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdd32>
   14013634c:	lea    0x500(%rsp),%rax
   140136354:	mov    %r11,%rdx
   140136357:	mov    %rax,0xa0(%rsp)
   14013635f:	mov    %rax,%rcx
   140136362:	vzeroupper
   140136365:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   14013636a:	jmp    140130c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc69e>
   14013636f:	mov    %rcx,%rdx
   140136372:	lea    0x1048(%rbx),%rcx
   140136379:	vzeroupper
   14013637c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136381:	mov    0x1048(%rbx),%r11
   140136388:	mov    0x1050(%rbx),%rax
   14013638f:	jmp    140133a58 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf4a8>
   140136394:	mov    %rcx,%rdx
   140136397:	lea    0x1048(%rbx),%rcx
   14013639e:	vzeroupper
   1401363a1:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401363a6:	mov    0x1048(%rbx),%r11
   1401363ad:	mov    0x1050(%rbx),%rax
   1401363b4:	jmp    140134489 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfed9>
   1401363b9:	mov    0x60(%rsp),%rdx
   1401363be:	lea    0x540(%rsp),%rcx
   1401363c6:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401363cb:	mov    0x540(%rsp),%rax
   1401363d3:	mov    %rax,0x1c8(%rsp)
   1401363db:	mov    $0x1,%esi
   1401363e0:	jmp    14012ada9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x67f9>
   1401363e5:	mov    0x1c8(%rsp),%rax
   1401363ed:	lea    0x710(%rsp),%r10
   1401363f5:	mov    $0x1,%edx
   1401363fa:	lea    0x720(%rsp),%rsi
   140136402:	mov    %r10,%rcx
   140136405:	mov    %r10,0x40(%rsp)
   14013640a:	mov    %rax,0x1d0(%rsp)
   140136412:	mov    0x540(%rsp),%rax
   14013641a:	movsbl (%rax,%rdi,1),%r8d
   14013641f:	mov    %rsi,0x710(%rsp)
   140136427:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   14013642c:	mov    0x40(%rsp),%rdx
   140136431:	lea    0x520(%rsp),%rcx
   140136439:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   14013643e:	jmp    14012ce10 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8860>
   140136443:	mov    %r9,0x40(%rsp)
   140136448:	lea    0x3d8(%rsp),%rcx
   140136450:	mov    %rdx,0x3d8(%rsp)
   140136458:	vzeroupper
   14013645b:	call   14021c730 <setun::VMValue::payload() const>
   140136460:	mov    0x40(%rsp),%r9
   140136465:	mov    0x48(%rax),%rax
   140136469:	test   %rax,%rax
   14013646c:	je     140131274 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccc4>
   140136472:	mov    0x38(%rax),%rcx
   140136476:	test   %rcx,%rcx
   140136479:	je     140131274 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccc4>
   14013647f:	mov    (%r9),%edx
   140136482:	cmp    %edx,(%rcx)
   140136484:	jne    140131274 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccc4>
   14013648a:	test   %edx,%edx
   14013648c:	je     140131274 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xccc4>
   140136492:	movzwl 0x4(%r9),%edx
   140136497:	mov    0x48(%rax),%rax
   14013649b:	lea    -0x8(%r13),%r13
   14013649f:	mov    $0x1,%esi
   1401364a4:	mov    (%rax,%rdx,8),%rax
   1401364a8:	mov    %rax,0x1c8(%rsp)
   1401364b0:	cmpb   $0x0,0x1040(%rbx)
   1401364b7:	je     14012b088 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6ad8>
   1401364bd:	mov    %r12,%rax
   1401364c0:	lea    0x28abd9(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401364c7:	lea    0x1(%r12),%r12
   1401364cc:	movzbl (%rax),%eax
   1401364cf:	jmp    *(%rdi,%rax,8)
   1401364d2:	mov    %rcx,%rdx
   1401364d5:	lea    0x1048(%rbx),%rcx
   1401364dc:	vzeroupper
   1401364df:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401364e4:	mov    0x1048(%rbx),%r11
   1401364eb:	mov    0x1050(%rbx),%rax
   1401364f2:	jmp    14013393a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf38a>
   1401364f7:	lea    0x15270(%rbx),%rcx
   1401364fe:	mov    %rbx,%rdx
   140136501:	vzeroupper
   140136504:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   140136509:	jmp    1401316f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd144>
   14013650e:	mov    %rcx,%rdx
   140136511:	lea    0x1048(%rbx),%rcx
   140136518:	vzeroupper
   14013651b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136520:	mov    0x1048(%rbx),%r11
   140136527:	mov    0x1050(%rbx),%rax
   14013652e:	jmp    140133b94 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf5e4>
   140136533:	mov    %rcx,%rdx
   140136536:	lea    0x1048(%rbx),%rcx
   14013653d:	vzeroupper
   140136540:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136545:	mov    0x1048(%rbx),%r11
   14013654c:	mov    0x1050(%rbx),%rax
   140136553:	jmp    140133c69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf6b9>
   140136558:	mov    %rcx,%rdx
   14013655b:	lea    0x1048(%rbx),%rcx
   140136562:	vzeroupper
   140136565:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013656a:	mov    0x1048(%rbx),%r11
   140136571:	mov    0x1050(%rbx),%rax
   140136578:	jmp    140133d9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf7ed>
   14013657d:	cmp    $0x4,%al
   14013657f:	jne    140135924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11374>
   140136585:	mov    $0xffffffff,%eax
   14013658a:	mov    $0xfffd0001,%edx
   14013658f:	shl    $0x20,%rax
   140136593:	shl    $0x20,%rdx
   140136597:	and    0x340(%rsp),%rax
   14013659f:	cmp    %rdx,%rax
   1401365a2:	jne    14012f956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3a6>
   1401365a8:	lea    0x340(%rsp),%rdx
   1401365b0:	lea    0x480(%rsp),%rcx
   1401365b8:	mov    %r9,0x40(%rsp)
   1401365bd:	call   14021cb30 <setun::VMValue::as_tafpu() const>
   1401365c2:	mov    0x490(%rsp),%rdx
   1401365ca:	vmovdqa 0x480(%rsp),%xmm7
   1401365d3:	imul   $0x18,0x40(%rsp),%rax
   1401365d9:	add    0x68(%rdi),%rax
   1401365dd:	mov    %rdx,0x10(%rax)
   1401365e1:	vmovdqu %xmm7,(%rax)
   1401365e5:	cmpb   $0x0,0x1040(%rbx)
   1401365ec:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   1401365f2:	mov    %r12,%rax
   1401365f5:	lea    0x28aaa4(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401365fc:	lea    0x1(%r12),%r12
   140136601:	movzbl (%rax),%eax
   140136604:	jmp    *(%rdi,%rax,8)
   140136607:	mov    0x340(%rsp),%rax
   14013660f:	movabs $0xfff7ffffffffffff,%rdx
   140136619:	cmp    %rax,%rdx
   14013661c:	jae    140136630 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12080>
   14013661e:	mov    $0x3fff,%edx
   140136623:	shl    $0x32,%rdx
   140136627:	cmp    %rdx,%rax
   14013662a:	jne    14012f956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3a6>
   140136630:	lea    0x340(%rsp),%rcx
   140136638:	mov    %r9,0x40(%rsp)
   14013663d:	call   14021ca10 <setun::VMValue::as_float() const>
   140136642:	mov    0x50(%rdi),%rax
   140136646:	mov    0x40(%rsp),%r9
   14013664b:	vmovsd %xmm0,(%rax,%r9,8)
   140136651:	cmpb   $0x0,0x1040(%rbx)
   140136658:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   14013665e:	mov    %r12,%rax
   140136661:	lea    0x28aa38(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140136668:	lea    0x1(%r12),%r12
   14013666d:	movzbl (%rax),%eax
   140136670:	jmp    *(%rdi,%rax,8)
   140136673:	mov    (%r9),%rdx
   140136676:	mov    $0xffffffff,%eax
   14013667b:	mov    $0xfffd0003,%ecx
   140136680:	shl    $0x20,%rax
   140136684:	shl    $0x20,%rcx
   140136688:	and    %rax,%rdx
   14013668b:	cmp    %rcx,%rdx
   14013668e:	jne    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   140136694:	mov    0xc0(%rsp),%rcx
   14013669c:	and    (%rcx),%rax
   14013669f:	cmp    %rdx,%rax
   1401366a2:	jne    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   1401366a8:	mov    %r9,%rcx
   1401366ab:	call   14021c730 <setun::VMValue::payload() const>
   1401366b0:	mov    0xc0(%rsp),%rcx
   1401366b8:	mov    0x58(%rax),%rax
   1401366bc:	mov    %rax,0x80(%rsp)
   1401366c4:	call   14021c730 <setun::VMValue::payload() const>
   1401366c9:	mov    0x58(%rax),%rcx
   1401366cd:	mov    %rcx,0xc0(%rsp)
   1401366d5:	cmpq   $0x0,0x80(%rsp)
   1401366de:	je     1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   1401366e4:	test   %rcx,%rcx
   1401366e7:	je     1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   1401366ed:	mov    0xe0(%rsp),%rcx
   1401366f5:	call   14021b2c0 <setun::VMValue::as_int() const>
   1401366fa:	mov    0x60(%rsp),%rcx
   1401366ff:	mov    %rax,0x40(%rsp)
   140136704:	call   14021b2c0 <setun::VMValue::as_int() const>
   140136709:	mov    %rax,0x60(%rsp)
   14013670e:	cmpq   $0x0,0x40(%rsp)
   140136714:	js     140137aec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1353c>
   14013671a:	cmpq   $0x0,0x60(%rsp)
   140136720:	js     140137b06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13556>
   140136726:	mov    0x80(%rsp),%rcx
   14013672e:	call   140147900 <setun::ArrayObject::size() const>
   140136733:	cmp    %rax,0x40(%rsp)
   140136738:	jae    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   14013673e:	cmpq   $0x0,0x60(%rsp)
   140136744:	js     1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   14013674a:	mov    0xc0(%rsp),%rcx
   140136752:	call   140147900 <setun::ArrayObject::size() const>
   140136757:	cmp    %rax,0x60(%rsp)
   14013675c:	jae    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   140136762:	mov    0x60(%rsp),%rdx
   140136767:	mov    0xc0(%rsp),%rcx
   14013676f:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   140136774:	lea    0x710(%rsp),%r10
   14013677c:	mov    0xa0(%rsp),%rcx
   140136784:	mov    %r10,%rdx
   140136787:	mov    %r10,0x60(%rsp)
   14013678c:	mov    %rax,0x710(%rsp)
   140136794:	call   14021a760 <setun::VMValue::mul(setun::VMValue const&) const>
   140136799:	mov    0x40(%rsp),%rdx
   14013679e:	mov    0x80(%rsp),%rcx
   1401367a6:	mov    %rax,0x520(%rsp)
   1401367ae:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   1401367b3:	mov    0x60(%rsp),%rcx
   1401367b8:	lea    0x520(%rsp),%rdx
   1401367c0:	mov    %rax,0x710(%rsp)
   1401367c8:	call   140219700 <setun::VMValue::add(setun::VMValue const&) const>
   1401367cd:	mov    0x40(%rsp),%rdx
   1401367d2:	mov    0x80(%rsp),%rcx
   1401367da:	lea    0x540(%rsp),%r8
   1401367e2:	mov    %rax,0x540(%rsp)
   1401367ea:	call   14014aee0 <setun::ArrayObject::set(unsigned long long, setun::VMValue const&)>
   1401367ef:	jmp    1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   1401367f4:	mov    0x340(%rsp),%rax
   1401367fc:	and    %rax,%rdx
   1401367ff:	cmp    0x40(%rsp),%rdx
   140136804:	jne    14012f956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3a6>
   14013680a:	mov    0x20(%rdi),%rdx
   14013680e:	shl    $0x10,%rax
   140136812:	sar    $0x10,%rax
   140136816:	mov    %rax,(%rdx,%r9,8)
   14013681a:	cmpb   $0x0,0x1040(%rbx)
   140136821:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   140136827:	mov    %r12,%rax
   14013682a:	lea    0x28a86f(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140136831:	lea    0x1(%r12),%r12
   140136836:	movzbl (%rax),%eax
   140136839:	jmp    *(%rdi,%rax,8)
   14013683c:	mov    %rcx,%rdx
   14013683f:	lea    0x1048(%rbx),%rcx
   140136846:	vzeroupper
   140136849:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013684e:	mov    0x1048(%rbx),%r11
   140136855:	mov    0x1050(%rbx),%rax
   14013685c:	jmp    140133b13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf563>
   140136861:	mov    %rcx,%rdx
   140136864:	lea    0x1048(%rbx),%rcx
   14013686b:	vzeroupper
   14013686e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136873:	mov    0x1048(%rbx),%r11
   14013687a:	mov    0x1050(%rbx),%rax
   140136881:	jmp    140133ab6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf506>
   140136886:	test   %sil,%sil
   140136889:	je     140136a9d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x124ed>
   14013688f:	sub    $0x1,%sil
   140136893:	je     140136a46 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12496>
   140136899:	lea    0x8(%r13),%rax
   14013689d:	cmp    0x30(%rsp),%rax
   1401368a2:	jae    1401379d4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13424>
   1401368a8:	mov    0x1d0(%rsp),%rdx
   1401368b0:	mov    %r13,%rax
   1401368b3:	lea    0x8(%r13),%r13
   1401368b7:	mov    %rdx,(%rax)
   1401368ba:	mov    0x1c8(%rsp),%rax
   1401368c2:	movslq %edi,%rdx
   1401368c5:	mov    %rax,0x1d0(%rsp)
   1401368cd:	jmp    140131b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d0>
   1401368d2:	test   %sil,%sil
   1401368d5:	je     140137a74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134c4>
   1401368db:	sub    $0x1,%sil
   1401368df:	je     140136902 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12352>
   1401368e1:	lea    0x8(%r13),%rax
   1401368e5:	cmp    0x30(%rsp),%rax
   1401368ea:	jae    140137a05 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13455>
   1401368f0:	mov    0x1d0(%rsp),%rdx
   1401368f8:	mov    %r13,%rax
   1401368fb:	lea    0x8(%r13),%r13
   1401368ff:	mov    %rdx,(%rax)
   140136902:	mov    0x1c8(%rsp),%rax
   14013690a:	mov    0x40(%rsp),%rdx
   14013690f:	mov    %rax,0x1d0(%rsp)
   140136917:	jmp    140131b80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5d0>
   14013691c:	mov    0x40(%rsp),%rcx
   140136921:	call   140147900 <setun::ArrayObject::size() const>
   140136926:	add    %rax,%rdi
   140136929:	jns    14012fc60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb6b0>
   14013692f:	jmp    140128d12 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x4762>
   140136934:	test   %sil,%sil
   140136937:	je     1401369c0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12410>
   14013693d:	sub    $0x1,%sil
   140136941:	je     140136964 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123b4>
   140136943:	lea    0x8(%r13),%rax
   140136947:	cmp    0x30(%rsp),%rax
   14013694c:	jae    140136a11 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12461>
   140136952:	mov    0x1d0(%rsp),%rdx
   14013695a:	mov    %r13,%rax
   14013695d:	lea    0x8(%r13),%r13
   140136961:	mov    %rdx,(%rax)
   140136964:	mov    0x1c8(%rsp),%rax
   14013696c:	lea    0x710(%rsp),%rcx
   140136974:	mov    $0x2,%esi
   140136979:	mov    %rax,0x1d0(%rsp)
   140136981:	mov    0x20(%r9),%rax
   140136985:	mov    (%rax,%rdi,8),%rdx
   140136989:	call   140210640 <setun::VMValue::VMValue(long long)>
   14013698e:	mov    0x710(%rsp),%rax
   140136996:	mov    %rax,0x1c8(%rsp)
   14013699e:	cmpb   $0x0,0x1040(%rbx)
   1401369a5:	je     14012b0bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b0c>
   1401369ab:	mov    %r12,%rax
   1401369ae:	lea    0x28a6eb(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   1401369b5:	lea    0x1(%r12),%r12
   1401369ba:	movzbl (%rax),%eax
   1401369bd:	jmp    *(%rdi,%rax,8)
   1401369c0:	mov    0x20(%r9),%rax
   1401369c4:	lea    0x710(%rsp),%rcx
   1401369cc:	mov    $0x1,%esi
   1401369d1:	mov    (%rax,%rdi,8),%rdx
   1401369d5:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401369da:	mov    0x710(%rsp),%rax
   1401369e2:	mov    %rax,0x1c8(%rsp)
   1401369ea:	jmp    14013699e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123ee>
   1401369ec:	mov    %rcx,%rdx
   1401369ef:	lea    0x1048(%rbx),%rcx
   1401369f6:	vzeroupper
   1401369f9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401369fe:	mov    0x1048(%rbx),%r11
   140136a05:	mov    0x1050(%rbx),%rax
   140136a0c:	jmp    140135f55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119a5>
   140136a11:	mov    0x1050(%rbx),%rax
   140136a18:	mov    0x1048(%rbx),%r11
   140136a1f:	mov    %rax,%rdx
   140136a22:	sub    %r11,%r13
   140136a25:	sub    %r11,%rdx
   140136a28:	sar    $0x3,%rdx
   140136a2c:	lea    (%rdx,%rdx,1),%rcx
   140136a30:	cmp    %rcx,%rdx
   140136a33:	jb     140136ac2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12512>
   140136a39:	mov    %rax,0x30(%rsp)
   140136a3e:	add    %r11,%r13
   140136a41:	jmp    140136952 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x123a2>
   140136a46:	mov    0x1c8(%rsp),%rax
   140136a4e:	movslq %edi,%rdx
   140136a51:	lea    0x540(%rsp),%rcx
   140136a59:	mov    %rax,0x1d0(%rsp)
   140136a61:	call   140210640 <setun::VMValue::VMValue(long long)>
   140136a66:	mov    0x540(%rsp),%rax
   140136a6e:	mov    %rax,0x1c8(%rsp)
   140136a76:	jmp    14012e618 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa068>
   140136a7b:	mov    %rcx,%rdx
   140136a7e:	lea    0x1048(%rbx),%rcx
   140136a85:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136a8a:	mov    0x1048(%rbx),%r11
   140136a91:	mov    0x1050(%rbx),%rax
   140136a98:	jmp    140132ece <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe91e>
   140136a9d:	movslq %edi,%rdx
   140136aa0:	lea    0x540(%rsp),%rcx
   140136aa8:	call   140210640 <setun::VMValue::VMValue(long long)>
   140136aad:	mov    0x540(%rsp),%rax
   140136ab5:	mov    %rax,0x1c8(%rsp)
   140136abd:	jmp    1401363db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e2b>
   140136ac2:	mov    %rcx,%rdx
   140136ac5:	lea    0x1048(%rbx),%rcx
   140136acc:	mov    %r9,0x30(%rsp)
   140136ad1:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136ad6:	mov    0x1048(%rbx),%r11
   140136add:	mov    0x30(%rsp),%r9
   140136ae2:	mov    0x1050(%rbx),%rax
   140136ae9:	jmp    140136a39 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12489>
   140136aee:	mov    0x1050(%rbx),%rax
   140136af5:	mov    0x1048(%rbx),%rsi
   140136afc:	mov    %rax,%rdx
   140136aff:	mov    %rsi,%r11
   140136b02:	sub    %rsi,%rdx
   140136b05:	sar    $0x3,%rdx
   140136b09:	lea    (%rdx,%rdx,1),%rcx
   140136b0d:	cmp    %rcx,%rdx
   140136b10:	jb     140136c69 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x126b9>
   140136b16:	sub    %rsi,%r13
   140136b19:	mov    %rax,0x30(%rsp)
   140136b1e:	add    %r11,%r13
   140136b21:	jmp    140131e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd8e2>
   140136b26:	mov    %r8,%rdx
   140136b29:	mov    %rdi,%rcx
   140136b2c:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   140136b31:	jmp    14012f824 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb274>
   140136b36:	mov    %rcx,%rdx
   140136b39:	lea    0x1048(%rbx),%rcx
   140136b40:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136b45:	mov    0x1048(%rbx),%r11
   140136b4c:	mov    0x1050(%rbx),%rax
   140136b53:	jmp    1401347a0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x101f0>
   140136b58:	mov    0x1050(%rbx),%rax
   140136b5f:	mov    0x1048(%rbx),%rsi
   140136b66:	mov    %rax,%rdx
   140136b69:	mov    %rsi,%r11
   140136b6c:	sub    %rsi,%rdx
   140136b6f:	sar    $0x3,%rdx
   140136b73:	lea    (%rdx,%rdx,1),%rcx
   140136b77:	cmp    %rcx,%rdx
   140136b7a:	jb     140136bd6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12626>
   140136b7c:	sub    %rsi,%r13
   140136b7f:	mov    %rax,0x30(%rsp)
   140136b84:	add    %r11,%r13
   140136b87:	jmp    14013466f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x100bf>
   140136b8c:	mov    %rcx,%rdx
   140136b8f:	lea    0x1048(%rbx),%rcx
   140136b96:	vzeroupper
   140136b99:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136b9e:	mov    0x1048(%rbx),%r11
   140136ba5:	mov    0x1050(%rbx),%rax
   140136bac:	jmp    1401345f4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10044>
   140136bb1:	mov    %rcx,%rdx
   140136bb4:	lea    0x1048(%rbx),%rcx
   140136bbb:	vzeroupper
   140136bbe:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136bc3:	mov    0x1048(%rbx),%r11
   140136bca:	mov    0x1050(%rbx),%rax
   140136bd1:	jmp    140134559 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xffa9>
   140136bd6:	mov    %rcx,%rdx
   140136bd9:	lea    0x1048(%rbx),%rcx
   140136be0:	mov    %r8,0x30(%rsp)
   140136be5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136bea:	mov    0x1048(%rbx),%r11
   140136bf1:	mov    0x1050(%rbx),%rax
   140136bf8:	mov    0x30(%rsp),%r8
   140136bfd:	jmp    140136b7c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x125cc>
   140136c02:	mov    $0x6ab,%r8d
   140136c08:	lea    0x225f79(%rip),%rdx        # 14035cb88 <.rdata+0x5c8>
   140136c0f:	lea    0x2269e2(%rip),%rcx        # 14035d5f8 <.rdata+0x1038>
   140136c16:	vzeroupper
   140136c19:	call   *0x28df81(%rip)        # 1403c4ba0 <__imp__assert>
   140136c1f:	mov    %rcx,%rdx
   140136c22:	lea    0x1048(%rbx),%rcx
   140136c29:	vzeroupper
   140136c2c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c31:	mov    0x1048(%rbx),%r11
   140136c38:	mov    0x1050(%rbx),%rax
   140136c3f:	jmp    1401347f1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10241>
   140136c44:	mov    %rcx,%rdx
   140136c47:	lea    0x1048(%rbx),%rcx
   140136c4e:	vzeroupper
   140136c51:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c56:	mov    0x1048(%rbx),%r11
   140136c5d:	mov    0x1050(%rbx),%rax
   140136c64:	jmp    140134728 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10178>
   140136c69:	mov    %rcx,%rdx
   140136c6c:	lea    0x1048(%rbx),%rcx
   140136c73:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136c78:	mov    0x1048(%rbx),%r11
   140136c7f:	mov    0x1050(%rbx),%rax
   140136c86:	jmp    140136b16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12566>
   140136c8b:	mov    $0xfffb,%eax
   140136c90:	mov    $0xffff,%edx
   140136c95:	mov    $0xfffd,%ecx
   140136c9a:	shl    $0x30,%rax
   140136c9e:	shl    $0x30,%rdx
   140136ca2:	mov    %rax,0x3e0(%rsp)
   140136caa:	mov    %r13,%rax
   140136cad:	shl    $0x30,%rcx
   140136cb1:	lea    -0x8(%r13),%r13
   140136cb5:	mov    -0x8(%rax),%rax
   140136cb9:	and    %rax,%rdx
   140136cbc:	mov    %rax,0x3e0(%rsp)
   140136cc4:	cmp    %rcx,%rdx
   140136cc7:	jne    14012f382 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xadd2>
   140136ccd:	jmp    14012e486 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9ed6>
   140136cd2:	mov    0x1050(%rbx),%rax
   140136cd9:	sub    %r11,%r13
   140136cdc:	mov    %rax,%rdx
   140136cdf:	sub    %r11,%rdx
   140136ce2:	sar    $0x3,%rdx
   140136ce6:	lea    (%rdx,%rdx,1),%rcx
   140136cea:	cmp    %rcx,%rdx
   140136ced:	jb     140136dbd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1280d>
   140136cf3:	mov    %rax,0x30(%rsp)
   140136cf8:	add    %r11,%r13
   140136cfb:	jmp    14013208b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdadb>
   140136d00:	mov    0x1050(%rbx),%rax
   140136d07:	sub    %r11,%rax
   140136d0a:	cmp    %rdx,%rax
   140136d0d:	jb     140136df3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12843>
   140136d13:	mov    %rdi,0x1060(%rbx)
   140136d1a:	mov    0x152a0(%rbx),%rax
   140136d21:	cmp    %rax,0x68(%rcx)
   140136d25:	jae    140136ddf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1282f>
   140136d2b:	mov    0x1060(%rbx),%rax
   140136d32:	mov    0x1048(%rbx),%r11
   140136d39:	lea    (%r11,%rax,8),%r13
   140136d3d:	mov    0x40(%rsp),%rax
   140136d42:	mov    0x4(%rax),%eax
   140136d45:	jmp    14012ff0b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb95b>
   140136d4a:	sub    $0x1,%sil
   140136d4e:	je     140136d71 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127c1>
   140136d50:	lea    0x8(%r13),%rax
   140136d54:	cmp    0x30(%rsp),%rax
   140136d59:	jae    140136e0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1285f>
   140136d5f:	mov    0x1d0(%rsp),%rdx
   140136d67:	mov    %r13,%rax
   140136d6a:	lea    0x8(%r13),%r13
   140136d6e:	mov    %rdx,(%rax)
   140136d71:	mov    0x1c8(%rsp),%rax
   140136d79:	mov    $0x2,%esi
   140136d7e:	mov    %rax,0x1d0(%rsp)
   140136d86:	mov    0x8(%r9),%rax
   140136d8a:	mov    (%rax,%rdi,8),%rax
   140136d8e:	mov    %rax,0x1c8(%rsp)
   140136d96:	jmp    140135f7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x119cb>
   140136d9b:	mov    %rcx,%rdx
   140136d9e:	lea    0x1048(%rbx),%rcx
   140136da5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136daa:	mov    0x1048(%rbx),%r11
   140136db1:	mov    0x1050(%rbx),%rax
   140136db8:	jmp    14012f6b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb107>
   140136dbd:	mov    %rcx,%rdx
   140136dc0:	lea    0x1048(%rbx),%rcx
   140136dc7:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136dcc:	mov    0x1048(%rbx),%r11
   140136dd3:	mov    0x1050(%rbx),%rax
   140136dda:	jmp    140136cf3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12743>
   140136ddf:	lea    0x15270(%rbx),%rcx
   140136de6:	mov    %rbx,%rdx
   140136de9:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   140136dee:	jmp    140136d2b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1277b>
   140136df3:	lea    0x1048(%rbx),%rcx
   140136dfa:	lea    (%rdi,%rdi,1),%rdx
   140136dfe:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e03:	mov    0x15270(%rbx),%rcx
   140136e0a:	jmp    140136d13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12763>
   140136e0f:	mov    0x1050(%rbx),%rax
   140136e16:	mov    0x1048(%rbx),%r11
   140136e1d:	mov    %rax,%rdx
   140136e20:	sub    %r11,%r13
   140136e23:	sub    %r11,%rdx
   140136e26:	sar    $0x3,%rdx
   140136e2a:	lea    (%rdx,%rdx,1),%rcx
   140136e2e:	cmp    %rcx,%rdx
   140136e31:	jb     14013777d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131cd>
   140136e37:	mov    %rax,0x30(%rsp)
   140136e3c:	add    %r11,%r13
   140136e3f:	jmp    140136d5f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x127af>
   140136e44:	mov    %rcx,%rdx
   140136e47:	lea    0x1048(%rbx),%rcx
   140136e4e:	vzeroupper
   140136e51:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136e56:	mov    0x1048(%rbx),%r11
   140136e5d:	mov    0x1050(%rbx),%rax
   140136e64:	jmp    140135a95 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x114e5>
   140136e69:	lea    0x710(%rsp),%rcx
   140136e71:	mov    %rdi,%rdx
   140136e74:	mov    $0x1,%esi
   140136e79:	call   140210640 <setun::VMValue::VMValue(long long)>
   140136e7e:	mov    0x710(%rsp),%rax
   140136e86:	mov    %rax,0x1c8(%rsp)
   140136e8e:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   140136e93:	mov    0x1050(%rbx),%rax
   140136e9a:	mov    0x1048(%rbx),%r11
   140136ea1:	mov    %rax,%rdx
   140136ea4:	sub    %r11,%r13
   140136ea7:	sub    %r11,%rdx
   140136eaa:	sar    $0x3,%rdx
   140136eae:	lea    (%rdx,%rdx,1),%rcx
   140136eb2:	cmp    %rcx,%rdx
   140136eb5:	jb     14013770f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1315f>
   140136ebb:	mov    %rax,0x30(%rsp)
   140136ec0:	add    %r11,%r13
   140136ec3:	jmp    14013611b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b6b>
   140136ec8:	mov    0x1050(%rbx),%rax
   140136ecf:	mov    0x1048(%rbx),%r11
   140136ed6:	mov    %rax,%rdx
   140136ed9:	sub    %r11,%r13
   140136edc:	sub    %r11,%rdx
   140136edf:	sar    $0x3,%rdx
   140136ee3:	lea    (%rdx,%rdx,1),%rcx
   140136ee7:	cmp    %rcx,%rdx
   140136eea:	jb     1401378a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132f8>
   140136ef0:	mov    %rax,0x30(%rsp)
   140136ef5:	add    %r11,%r13
   140136ef8:	jmp    1401344a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xfef5>
   140136efd:	mov    %rcx,%rdx
   140136f00:	lea    0x1048(%rbx),%rcx
   140136f07:	vzeroupper
   140136f0a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f0f:	mov    0x1048(%rbx),%r11
   140136f16:	mov    0x1050(%rbx),%rax
   140136f1d:	jmp    140135b8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x115dd>
   140136f22:	mov    0x1048(%rbx),%r11
   140136f29:	mov    0x1050(%rbx),%rax
   140136f30:	vzeroupper
   140136f33:	jmp    1401252d3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd23>
   140136f38:	mov    %rcx,%rdx
   140136f3b:	lea    0x1048(%rbx),%rcx
   140136f42:	vzeroupper
   140136f45:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140136f4a:	mov    0x1048(%rbx),%r11
   140136f51:	mov    0x1050(%rbx),%rax
   140136f58:	jmp    1401355c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11018>
   140136f5d:	mov    0x1050(%rbx),%rax
   140136f64:	mov    0x1048(%rbx),%r11
   140136f6b:	mov    %rax,%rdx
   140136f6e:	sub    %r11,%r13
   140136f71:	sub    %r11,%rdx
   140136f74:	sar    $0x3,%rdx
   140136f78:	lea    (%rdx,%rdx,1),%rcx
   140136f7c:	cmp    %rcx,%rdx
   140136f7f:	jb     14013701d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a6d>
   140136f85:	mov    %rax,0x30(%rsp)
   140136f8a:	add    %r11,%r13
   140136f8d:	jmp    1401332e2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed32>
   140136f92:	sub    $0x1,%sil
   140136f96:	je     140136fb5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a05>
   140136f98:	lea    0x8(%r13),%rax
   140136f9c:	cmp    0x30(%rsp),%rax
   140136fa1:	jae    140136fef <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a3f>
   140136fa3:	mov    0x1d0(%rsp),%rdx
   140136fab:	mov    %r13,%rax
   140136fae:	lea    0x8(%r13),%r13
   140136fb2:	mov    %rdx,(%rax)
   140136fb5:	mov    0x1c8(%rsp),%rax
   140136fbd:	mov    $0x2,%esi
   140136fc2:	movabs $0xfffc000000000000,%rdx
   140136fcc:	mov    %rax,0x1d0(%rsp)
   140136fd4:	mov    0x50(%r9),%rax
   140136fd8:	vmovsd (%rax,%rdi,8),%xmm0
   140136fdd:	vucomisd %xmm0,%xmm0
   140136fe1:	vmovq  %xmm0,%rax
   140136fe6:	cmovp  %rdx,%rax
   140136fea:	jmp    140135548 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f98>
   140136fef:	mov    0x1050(%rbx),%rax
   140136ff6:	mov    0x1048(%rbx),%r11
   140136ffd:	mov    %rax,%rdx
   140137000:	sub    %r11,%r13
   140137003:	sub    %r11,%rdx
   140137006:	sar    $0x3,%rdx
   14013700a:	lea    (%rdx,%rdx,1),%rcx
   14013700e:	cmp    %rcx,%rdx
   140137011:	jb     14013703f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a8f>
   140137013:	mov    %rax,0x30(%rsp)
   140137018:	add    %r11,%r13
   14013701b:	jmp    140136fa3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129f3>
   14013701d:	mov    %rcx,%rdx
   140137020:	lea    0x1048(%rbx),%rcx
   140137027:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013702c:	mov    0x1048(%rbx),%r11
   140137033:	mov    0x1050(%rbx),%rax
   14013703a:	jmp    140136f85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x129d5>
   14013703f:	mov    %rcx,%rdx
   140137042:	lea    0x1048(%rbx),%rcx
   140137049:	mov    %r9,0x30(%rsp)
   14013704e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137053:	mov    0x1048(%rbx),%r11
   14013705a:	mov    0x30(%rsp),%r9
   14013705f:	mov    0x1050(%rbx),%rax
   140137066:	jmp    140137013 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12a63>
   140137068:	imul   $0x18,%rdi,%rax
   14013706c:	add    0x68(%r9),%rax
   140137070:	mov    $0x1,%esi
   140137075:	vmovdqu (%rax),%xmm7
   140137079:	lea    0x1a0(%rsp),%rdx
   140137081:	lea    0x710(%rsp),%rcx
   140137089:	vmovdqa %xmm7,0x1a0(%rsp)
   140137092:	mov    0x10(%rax),%rax
   140137096:	mov    %rax,0x1b0(%rsp)
   14013709e:	call   14020eb00 <setun::VMValue::VMValue(setun::TafpuNum)>
   1401370a3:	mov    0x710(%rsp),%rax
   1401370ab:	mov    %rax,0x1c8(%rsp)
   1401370b3:	jmp    1401354f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10f48>
   1401370b8:	mov    0x1050(%rbx),%rax
   1401370bf:	mov    0x1048(%rbx),%r11
   1401370c6:	mov    %rax,%rdx
   1401370c9:	sub    %r11,%r13
   1401370cc:	sub    %r11,%rdx
   1401370cf:	sar    $0x3,%rdx
   1401370d3:	lea    (%rdx,%rdx,1),%rcx
   1401370d7:	cmp    %rcx,%rdx
   1401370da:	jb     14013710e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b5e>
   1401370dc:	mov    %rax,0x30(%rsp)
   1401370e1:	add    %r11,%r13
   1401370e4:	jmp    14013548b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10edb>
   1401370e9:	mov    %rcx,%rdx
   1401370ec:	lea    0x1048(%rbx),%rcx
   1401370f3:	vzeroupper
   1401370f6:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401370fb:	mov    0x1048(%rbx),%r11
   140137102:	mov    0x1050(%rbx),%rax
   140137109:	jmp    140135108 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b58>
   14013710e:	mov    %rcx,%rdx
   140137111:	lea    0x1048(%rbx),%rcx
   140137118:	mov    %r9,0x30(%rsp)
   14013711d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137122:	mov    0x1048(%rbx),%r11
   140137129:	mov    0x30(%rsp),%r9
   14013712e:	mov    0x1050(%rbx),%rax
   140137135:	jmp    1401370dc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12b2c>
   140137137:	lea    (%rsi,%rsi,1),%rdx
   14013713b:	lea    0x1048(%rbx),%rcx
   140137142:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137147:	jmp    140135241 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10c91>
   14013714c:	mov    %rcx,%rdx
   14013714f:	lea    0x1048(%rbx),%rcx
   140137156:	vzeroupper
   140137159:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013715e:	mov    0x1048(%rbx),%r11
   140137165:	mov    0x1050(%rbx),%rax
   14013716c:	jmp    140135309 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10d59>
   140137171:	mov    0x1050(%rbx),%rax
   140137178:	mov    0x1048(%rbx),%rsi
   14013717f:	mov    %rax,%rdx
   140137182:	mov    %rsi,%r11
   140137185:	sub    %rsi,%rdx
   140137188:	sar    $0x3,%rdx
   14013718c:	lea    (%rdx,%rdx,1),%rcx
   140137190:	cmp    %rcx,%rdx
   140137193:	jb     1401371cd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c1d>
   140137195:	sub    %rsi,%r13
   140137198:	mov    %rax,0x30(%rsp)
   14013719d:	add    %r11,%r13
   1401371a0:	jmp    140132852 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe2a2>
   1401371a5:	mov    0x1050(%rbx),%rax
   1401371ac:	sub    %r11,%r13
   1401371af:	mov    %rax,%rdx
   1401371b2:	sub    %r11,%rdx
   1401371b5:	sar    $0x3,%rdx
   1401371b9:	lea    (%rdx,%rdx,1),%rcx
   1401371bd:	cmp    %rcx,%rdx
   1401371c0:	jb     1401371ec <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c3c>
   1401371c2:	vzeroupper
   1401371c5:	add    %r11,%r13
   1401371c8:	jmp    140132bb0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe600>
   1401371cd:	mov    %rcx,%rdx
   1401371d0:	lea    0x1048(%rbx),%rcx
   1401371d7:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401371dc:	mov    0x1048(%rbx),%r11
   1401371e3:	mov    0x1050(%rbx),%rax
   1401371ea:	jmp    140137195 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12be5>
   1401371ec:	mov    %rcx,%rdx
   1401371ef:	lea    0x1048(%rbx),%rcx
   1401371f6:	vzeroupper
   1401371f9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401371fe:	mov    0x1048(%rbx),%r11
   140137205:	mov    0x1050(%rbx),%rax
   14013720c:	jmp    1401371c5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c15>
   14013720e:	mov    0x1050(%rbx),%rax
   140137215:	mov    0x1048(%rbx),%r11
   14013721c:	mov    %rax,%rdx
   14013721f:	sub    %r11,%r13
   140137222:	sub    %r11,%rdx
   140137225:	sar    $0x3,%rdx
   140137229:	lea    (%rdx,%rdx,1),%rcx
   14013722d:	cmp    %rcx,%rdx
   140137230:	jb     140137288 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cd8>
   140137232:	mov    %rax,0x30(%rsp)
   140137237:	add    %r11,%r13
   14013723a:	jmp    140133450 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xeea0>
   14013723f:	sub    $0x1,%sil
   140137243:	je     140137262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cb2>
   140137245:	lea    0x8(%r13),%rax
   140137249:	cmp    0x30(%rsp),%rax
   14013724e:	jae    1401372a7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12cf7>
   140137250:	mov    0x1d0(%rsp),%rdx
   140137258:	mov    %r13,%rax
   14013725b:	lea    0x8(%r13),%r13
   14013725f:	mov    %rdx,(%rax)
   140137262:	mov    0x1c8(%rsp),%rax
   14013726a:	mov    %rax,0x1d0(%rsp)
   140137272:	mov    $0x1fff,%eax
   140137277:	shl    $0x33,%rax
   14013727b:	mov    %rax,0x1c8(%rsp)
   140137283:	jmp    14013623a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c8a>
   140137288:	mov    %rcx,%rdx
   14013728b:	lea    0x1048(%rbx),%rcx
   140137292:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137297:	mov    0x1048(%rbx),%r11
   14013729e:	mov    0x1050(%rbx),%rax
   1401372a5:	jmp    140137232 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12c82>
   1401372a7:	mov    0x1050(%rbx),%rax
   1401372ae:	mov    0x1048(%rbx),%r11
   1401372b5:	mov    %rax,%rdx
   1401372b8:	sub    %r11,%r13
   1401372bb:	sub    %r11,%rdx
   1401372be:	sar    $0x3,%rdx
   1401372c2:	lea    (%rdx,%rdx,1),%rcx
   1401372c6:	cmp    %rcx,%rdx
   1401372c9:	jae    1401372e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12d38>
   1401372cb:	mov    %rcx,%rdx
   1401372ce:	lea    0x1048(%rbx),%rcx
   1401372d5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401372da:	mov    0x1048(%rbx),%r11
   1401372e1:	mov    0x1050(%rbx),%rax
   1401372e8:	mov    %rax,0x30(%rsp)
   1401372ed:	add    %r11,%r13
   1401372f0:	jmp    140137250 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ca0>
   1401372f5:	mov    %rcx,%rdx
   1401372f8:	lea    0x1048(%rbx),%rcx
   1401372ff:	vzeroupper
   140137302:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137307:	mov    0x1048(%rbx),%r11
   14013730e:	mov    0x1050(%rbx),%rax
   140137315:	jmp    140135134 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10b84>
   14013731a:	mov    %rcx,%rdx
   14013731d:	lea    0x1048(%rbx),%rcx
   140137324:	vzeroupper
   140137327:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013732c:	mov    0x1048(%rbx),%r11
   140137333:	mov    0x1050(%rbx),%rax
   14013733a:	jmp    14013515d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10bad>
   14013733f:	mov    0x1048(%rbx),%r11
   140137346:	lea    0x8(%r13),%rax
   14013734a:	cmp    0x30(%rsp),%rax
   14013734f:	jae    1401373b6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e06>
   140137351:	mov    0x1050(%rbx),%rax
   140137358:	vzeroupper
   14013735b:	mov    0x1c8(%rsp),%rcx
   140137363:	mov    %r13,%rdx
   140137366:	xor    %esi,%esi
   140137368:	lea    0x8(%r13),%r13
   14013736c:	mov    %rcx,(%rdx)
   14013736f:	jmp    14013585a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112aa>
   140137374:	mov    0x1048(%rbx),%r11
   14013737b:	lea    0x10(%r13),%rax
   14013737f:	cmp    0x30(%rsp),%rax
   140137384:	jae    1401373e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e33>
   140137386:	mov    0x1050(%rbx),%rax
   14013738d:	vzeroupper
   140137390:	mov    0x1d0(%rsp),%rcx
   140137398:	mov    %r13,%rdx
   14013739b:	xor    %esi,%esi
   14013739d:	lea    0x10(%r13),%r13
   1401373a1:	mov    %rcx,-0x10(%r13)
   1401373a5:	mov    0x1c8(%rsp),%rcx
   1401373ad:	mov    %rcx,0x8(%rdx)
   1401373b1:	jmp    14013585a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112aa>
   1401373b6:	mov    0x1050(%rbx),%rax
   1401373bd:	sub    %r11,%r13
   1401373c0:	mov    %rax,%rdx
   1401373c3:	sub    %r11,%rdx
   1401373c6:	sar    $0x3,%rdx
   1401373ca:	lea    (%rdx,%rdx,1),%rcx
   1401373ce:	cmp    %rcx,%rdx
   1401373d1:	jb     14013740d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e5d>
   1401373d3:	vzeroupper
   1401373d6:	mov    %rax,0x30(%rsp)
   1401373db:	add    %r11,%r13
   1401373de:	jmp    14013735b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12dab>
   1401373e3:	mov    0x1050(%rbx),%rax
   1401373ea:	sub    %r11,%r13
   1401373ed:	mov    %rax,%rdx
   1401373f0:	sub    %r11,%rdx
   1401373f3:	sar    $0x3,%rdx
   1401373f7:	lea    (%rdx,%rdx,1),%rcx
   1401373fb:	cmp    %rcx,%rdx
   1401373fe:	jb     14013742f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e7f>
   140137400:	vzeroupper
   140137403:	mov    %rax,0x30(%rsp)
   140137408:	add    %r11,%r13
   14013740b:	jmp    140137390 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12de0>
   14013740d:	mov    %rcx,%rdx
   140137410:	lea    0x1048(%rbx),%rcx
   140137417:	vzeroupper
   14013741a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013741f:	mov    0x1048(%rbx),%r11
   140137426:	mov    0x1050(%rbx),%rax
   14013742d:	jmp    1401373d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e26>
   14013742f:	mov    %rcx,%rdx
   140137432:	lea    0x1048(%rbx),%rcx
   140137439:	vzeroupper
   14013743c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137441:	mov    0x1048(%rbx),%r11
   140137448:	mov    0x1050(%rbx),%rax
   14013744f:	jmp    140137403 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12e53>
   140137451:	mov    %rcx,%rdx
   140137454:	lea    0x1048(%rbx),%rcx
   14013745b:	vzeroupper
   14013745e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137463:	mov    0x1048(%rbx),%r11
   14013746a:	mov    0x1050(%rbx),%rax
   140137471:	jmp    140135078 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10ac8>
   140137476:	lea    0x0(%r13,%r13,1),%rdx
   14013747b:	lea    0x1048(%rbx),%rcx
   140137482:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137487:	jmp    140135873 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x112c3>
   14013748c:	mov    0x38(%r9),%rax
   140137490:	lea    0x710(%rsp),%rcx
   140137498:	mov    $0x1,%esi
   14013749d:	movzbl (%rax,%rdi,1),%edx
   1401374a1:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401374a6:	mov    0x710(%rsp),%rax
   1401374ae:	mov    %rax,0x1c8(%rsp)
   1401374b6:	jmp    1401301c7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbc17>
   1401374bb:	mov    0x410(%rsp),%edi
   1401374c2:	test   %sil,%sil
   1401374c5:	je     14013760f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1305f>
   1401374cb:	sub    $0x1,%sil
   1401374cf:	je     1401375b5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13005>
   1401374d5:	lea    0x8(%r13),%rax
   1401374d9:	cmp    0x30(%rsp),%rax
   1401374de:	jae    140137580 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12fd0>
   1401374e4:	mov    0x1d0(%rsp),%rdx
   1401374ec:	mov    %r13,%rax
   1401374ef:	mov    $0x2,%esi
   1401374f4:	lea    0x710(%rsp),%rcx
   1401374fc:	lea    0x8(%r13),%r13
   140137500:	mov    %rdx,(%rax)
   140137503:	mov    0x1c8(%rsp),%rax
   14013750b:	movslq %edi,%rdx
   14013750e:	mov    %rax,0x1d0(%rsp)
   140137516:	call   140210640 <setun::VMValue::VMValue(long long)>
   14013751b:	mov    0x710(%rsp),%rax
   140137523:	mov    %rax,0x1c8(%rsp)
   14013752b:	jmp    140131924 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd374>
   140137530:	mov    0x408(%rsp),%rdi
   140137538:	test   %sil,%sil
   14013753b:	je     1401375ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1303a>
   140137541:	sub    $0x1,%sil
   140137545:	jne    14013610c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b5c>
   14013754b:	mov    0x1c8(%rsp),%rax
   140137553:	lea    0x710(%rsp),%rcx
   14013755b:	mov    %rdi,%rdx
   14013755e:	mov    %rax,0x1d0(%rsp)
   140137566:	call   140210640 <setun::VMValue::VMValue(long long)>
   14013756b:	mov    0x710(%rsp),%rax
   140137573:	mov    %rax,0x1c8(%rsp)
   14013757b:	jmp    14013623a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c8a>
   140137580:	mov    0x1050(%rbx),%rax
   140137587:	mov    0x1048(%rbx),%r11
   14013758e:	mov    %rax,%rdx
   140137591:	sub    %r11,%r13
   140137594:	sub    %r11,%rdx
   140137597:	sar    $0x3,%rdx
   14013759b:	lea    (%rdx,%rdx,1),%rcx
   14013759f:	cmp    %rcx,%rdx
   1401375a2:	jb     140137634 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13084>
   1401375a8:	mov    %rax,0x30(%rsp)
   1401375ad:	add    %r11,%r13
   1401375b0:	jmp    1401374e4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12f34>
   1401375b5:	mov    0x1c8(%rsp),%rax
   1401375bd:	movslq %edi,%rdx
   1401375c0:	lea    0x710(%rsp),%rcx
   1401375c8:	mov    %rax,0x1d0(%rsp)
   1401375d0:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401375d5:	mov    0x710(%rsp),%rax
   1401375dd:	mov    %rax,0x1c8(%rsp)
   1401375e5:	jmp    14013623a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11c8a>
   1401375ea:	lea    0x710(%rsp),%rcx
   1401375f2:	mov    %rdi,%rdx
   1401375f5:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401375fa:	mov    0x710(%rsp),%rax
   140137602:	mov    %rax,0x1c8(%rsp)
   14013760a:	jmp    1401327da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe22a>
   14013760f:	movslq %edi,%rdx
   140137612:	lea    0x710(%rsp),%rcx
   14013761a:	call   140210640 <setun::VMValue::VMValue(long long)>
   14013761f:	mov    0x710(%rsp),%rax
   140137627:	mov    %rax,0x1c8(%rsp)
   14013762f:	jmp    1401327da <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe22a>
   140137634:	mov    %rcx,%rdx
   140137637:	lea    0x1048(%rbx),%rcx
   14013763e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137643:	mov    0x1048(%rbx),%r11
   14013764a:	mov    0x1050(%rbx),%rax
   140137651:	jmp    1401375a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12ff8>
   140137656:	mov    %rcx,%rdx
   140137659:	lea    0x1048(%rbx),%rcx
   140137660:	vzeroupper
   140137663:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137668:	mov    0x1048(%rbx),%r11
   14013766f:	mov    0x1050(%rbx),%rax
   140137676:	jmp    140135f29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11979>
   14013767b:	mov    %rcx,%rdx
   14013767e:	lea    0x1048(%rbx),%rcx
   140137685:	vzeroupper
   140137688:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013768d:	mov    0x1048(%rbx),%r11
   140137694:	mov    0x1050(%rbx),%rax
   14013769b:	jmp    14013609c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11aec>
   1401376a0:	mov    %rcx,%rdx
   1401376a3:	lea    0x1048(%rbx),%rcx
   1401376aa:	vzeroupper
   1401376ad:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376b2:	mov    0x1048(%rbx),%r11
   1401376b9:	mov    0x1050(%rbx),%rax
   1401376c0:	jmp    140136070 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11ac0>
   1401376c5:	mov    %rcx,%rdx
   1401376c8:	lea    0x1048(%rbx),%rcx
   1401376cf:	vzeroupper
   1401376d2:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376d7:	mov    0x1048(%rbx),%r11
   1401376de:	mov    0x1050(%rbx),%rax
   1401376e5:	jmp    1401360c8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11b18>
   1401376ea:	mov    %rcx,%rdx
   1401376ed:	lea    0x1048(%rbx),%rcx
   1401376f4:	vzeroupper
   1401376f7:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401376fc:	mov    0x1048(%rbx),%r11
   140137703:	mov    0x1050(%rbx),%rax
   14013770a:	jmp    140135dea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1183a>
   14013770f:	mov    %rcx,%rdx
   140137712:	lea    0x1048(%rbx),%rcx
   140137719:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013771e:	mov    0x1048(%rbx),%r11
   140137725:	mov    0x1050(%rbx),%rax
   14013772c:	jmp    140136ebb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1290b>
   140137731:	mov    %rcx,%rdx
   140137734:	lea    0x1068(%rbx),%rcx
   14013773b:	vzeroupper
   14013773e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137743:	jmp    1401306e3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc133>
   140137748:	mov    0x1050(%rbx),%rax
   14013774f:	mov    0x1048(%rbx),%r11
   140137756:	mov    %rax,%rdx
   140137759:	sub    %r11,%r13
   14013775c:	sub    %r11,%rdx
   14013775f:	sar    $0x3,%rdx
   140137763:	lea    (%rdx,%rdx,1),%rcx
   140137767:	cmp    %rcx,%rdx
   14013776a:	jb     140137804 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13254>
   140137770:	mov    %rax,0x30(%rsp)
   140137775:	add    %r11,%r13
   140137778:	jmp    140133271 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xecc1>
   14013777d:	mov    %rcx,%rdx
   140137780:	lea    0x1048(%rbx),%rcx
   140137787:	mov    %r9,0x30(%rsp)
   14013778c:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137791:	mov    0x1048(%rbx),%r11
   140137798:	mov    0x30(%rsp),%r9
   14013779d:	mov    0x1050(%rbx),%rax
   1401377a4:	jmp    140136e37 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12887>
   1401377a9:	mov    0x40(%rsp),%rdx
   1401377ae:	mov    %rdi,%rcx
   1401377b1:	mov    $0x1,%esi
   1401377b6:	call   14021dd20 <setun::VMObject::get_field(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const>
   1401377bb:	mov    %rax,0x1c8(%rsp)
   1401377c3:	jmp    1401356ae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110fe>
   1401377c8:	mov    0x1050(%rbx),%rax
   1401377cf:	sub    %r11,%r13
   1401377d2:	mov    %rax,%rdx
   1401377d5:	sub    %r11,%rdx
   1401377d8:	sar    $0x3,%rdx
   1401377dc:	lea    (%rdx,%rdx,1),%rcx
   1401377e0:	cmp    %rcx,%rdx
   1401377e3:	jb     140137990 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x133e0>
   1401377e9:	add    %r11,%r13
   1401377ec:	jmp    1401307e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc230>
   1401377f1:	mov    0x1048(%rbx),%r11
   1401377f8:	mov    0x1050(%rbx),%rax
   1401377ff:	jmp    1401307f2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc242>
   140137804:	mov    %rcx,%rdx
   140137807:	lea    0x1048(%rbx),%rcx
   14013780e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137813:	mov    0x1048(%rbx),%r11
   14013781a:	mov    0x1050(%rbx),%rax
   140137821:	jmp    140137770 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x131c0>
   140137826:	mov    %rcx,%rdx
   140137829:	lea    0x1048(%rbx),%rcx
   140137830:	vzeroupper
   140137833:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137838:	mov    0x1048(%rbx),%r11
   14013783f:	mov    0x1050(%rbx),%rax
   140137846:	jmp    1401358c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11314>
   14013784b:	mov    %rcx,%rdx
   14013784e:	lea    0x1048(%rbx),%rcx
   140137855:	vzeroupper
   140137858:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013785d:	mov    0x1048(%rbx),%r11
   140137864:	mov    0x1050(%rbx),%rax
   14013786b:	jmp    1401358f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11340>
   140137870:	mov    0x1050(%rbx),%rax
   140137877:	mov    0x1048(%rbx),%rsi
   14013787e:	mov    %rax,%rdx
   140137881:	mov    %rsi,%r11
   140137884:	sub    %rsi,%rdx
   140137887:	sar    $0x3,%rdx
   14013788b:	lea    (%rdx,%rdx,1),%rcx
   14013788f:	cmp    %rcx,%rdx
   140137892:	jb     1401379b2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13402>
   140137898:	sub    %rsi,%r13
   14013789b:	mov    %rax,0x30(%rsp)
   1401378a0:	add    %r11,%r13
   1401378a3:	jmp    14012d57c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x8fcc>
   1401378a8:	mov    %r8d,0x40(%rsp)
   1401378ad:	mov    %rcx,%rdx
   1401378b0:	lea    0x1048(%rbx),%rcx
   1401378b7:	mov    %r9d,0x30(%rsp)
   1401378bc:	vzeroupper
   1401378bf:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401378c4:	mov    0x1048(%rbx),%r11
   1401378cb:	mov    0x1050(%rbx),%rax
   1401378d2:	mov    0x40(%rsp),%r8d
   1401378d7:	mov    0x30(%rsp),%r9d
   1401378dc:	jmp    140136ef0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12940>
   1401378e1:	mov    %r10,0x30(%rsp)
   1401378e6:	lea    0x0(%rbp,%rbp,1),%rdx
   1401378eb:	lea    0x1048(%rbx),%rcx
   1401378f2:	vzeroupper
   1401378f5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401378fa:	mov    0x30(%rsp),%r10
   1401378ff:	jmp    140135739 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11189>
   140137904:	call   140213660 <tersun::VMTelemetryManager::instance()>
   140137909:	cmpb   $0x0,(%rax)
   14013790c:	je     140137916 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13366>
   14013790e:	addq   $0x1,0x90(%rax)
   140137916:	mov    0x150c0(%rbx),%rdx
   14013791d:	mov    0x152c8(%rbx),%rcx
   140137924:	movzbl 0x640(%rsp),%r9d
   14013792d:	test   %rdx,%rdx
   140137930:	je     140137942 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13392>
   140137932:	lea    -0x1(%rdx),%rax
   140137936:	imul   $0x28,%rax,%rax
   14013793a:	mov    0x10e0(%rbx,%rax,1),%rdx
   140137942:	mov    0x60(%rsp),%r8d
   140137947:	call   140172290 <setun::JITManager::handle_deopt_feedback(unsigned long long, unsigned int, setun::DeoptReason)>
   14013794c:	mov    0x638(%rsp),%r12
   140137954:	mov    0x1060(%rbx),%rax
   14013795b:	mov    0x1048(%rbx),%r11
   140137962:	add    %r15,%r12
   140137965:	lea    (%r11,%rax,8),%r13
   140137969:	cmpb   $0x0,0x1040(%rbx)
   140137970:	je     14012b0d6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6b26>
   140137976:	mov    %r12,%rax
   140137979:	lea    0x289720(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137980:	lea    0x1(%r12),%r12
   140137985:	xor    %esi,%esi
   140137987:	movzbl (%rax),%eax
   14013798a:	mov    (%rdi,%rax,8),%rax
   14013798e:	jmp    *%rax
   140137990:	mov    %rcx,%rdx
   140137993:	lea    0x1048(%rbx),%rcx
   14013799a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013799f:	mov    0x1048(%rbx),%r11
   1401379a6:	mov    0x1050(%rbx),%rax
   1401379ad:	jmp    1401377e9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13239>
   1401379b2:	mov    %rcx,%rdx
   1401379b5:	lea    0x1048(%rbx),%rcx
   1401379bc:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401379c1:	mov    0x1048(%rbx),%r11
   1401379c8:	mov    0x1050(%rbx),%rax
   1401379cf:	jmp    140137898 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x132e8>
   1401379d4:	mov    0x1050(%rbx),%rax
   1401379db:	mov    0x1048(%rbx),%r11
   1401379e2:	mov    %rax,%rdx
   1401379e5:	sub    %r11,%r13
   1401379e8:	sub    %r11,%rdx
   1401379eb:	sar    $0x3,%rdx
   1401379ef:	lea    (%rdx,%rdx,1),%rcx
   1401379f3:	cmp    %rcx,%rdx
   1401379f6:	jb     140137a36 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13486>
   1401379f8:	mov    %rax,0x30(%rsp)
   1401379fd:	add    %r11,%r13
   140137a00:	jmp    1401368a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x122f8>
   140137a05:	mov    0x1050(%rbx),%rax
   140137a0c:	mov    0x1048(%rbx),%r11
   140137a13:	mov    %rax,%rdx
   140137a16:	sub    %r11,%r13
   140137a19:	sub    %r11,%rdx
   140137a1c:	sar    $0x3,%rdx
   140137a20:	lea    (%rdx,%rdx,1),%rcx
   140137a24:	cmp    %rcx,%rdx
   140137a27:	jb     140137a55 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x134a5>
   140137a29:	mov    %rax,0x30(%rsp)
   140137a2e:	add    %r11,%r13
   140137a31:	jmp    1401368f0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12340>
   140137a36:	mov    %rcx,%rdx
   140137a39:	lea    0x1048(%rbx),%rcx
   140137a40:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a45:	mov    0x1048(%rbx),%r11
   140137a4c:	mov    0x1050(%rbx),%rax
   140137a53:	jmp    1401379f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13448>
   140137a55:	mov    %rcx,%rdx
   140137a58:	lea    0x1048(%rbx),%rcx
   140137a5f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137a64:	mov    0x1048(%rbx),%r11
   140137a6b:	mov    0x1050(%rbx),%rax
   140137a72:	jmp    140137a29 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13479>
   140137a74:	mov    0x40(%rsp),%rdx
   140137a79:	jmp    1401363be <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11e0e>
   140137a7e:	vzeroupper
   140137a81:	jmp    1401366a8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x120f8>
   140137a86:	shl    $0x10,%rax
   140137a8a:	mov    %rax,%rdx
   140137a8d:	sar    $0x10,%rdx
   140137a91:	cmp    $0xff0000,%rax
   140137a97:	ja     14012f956 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb3a6>
   140137a9d:	mov    0x38(%rdi),%rax
   140137aa1:	mov    %dl,(%rax,%r9,1)
   140137aa5:	cmpb   $0x0,0x1040(%rbx)
   140137aac:	je     14012f243 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xac93>
   140137ab2:	mov    %r12,%rax
   140137ab5:	lea    0x2895e4(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137abc:	lea    0x1(%r12),%r12
   140137ac1:	movzbl (%rax),%eax
   140137ac4:	jmp    *(%rdi,%rax,8)
   140137ac7:	mov    %rcx,%rdx
   140137aca:	lea    0x1048(%rbx),%rcx
   140137ad1:	vzeroupper
   140137ad4:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ad9:	mov    0x1048(%rbx),%r11
   140137ae0:	mov    0x1050(%rbx),%rax
   140137ae7:	jmp    14013504c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a9c>
   140137aec:	mov    0x80(%rsp),%rcx
   140137af4:	call   140147900 <setun::ArrayObject::size() const>
   140137af9:	add    %rax,0x40(%rsp)
   140137afe:	cmpq   $0x0,0x60(%rsp)
   140137b04:	jns    140137b18 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13568>
   140137b06:	mov    0xc0(%rsp),%rcx
   140137b0e:	call   140147900 <setun::ArrayObject::size() const>
   140137b13:	add    %rax,0x60(%rsp)
   140137b18:	cmpq   $0x0,0x40(%rsp)
   140137b1e:	js     1401288fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x434b>
   140137b24:	jmp    140136726 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x12176>
   140137b29:	mov    %rcx,%rdx
   140137b2c:	lea    0x1048(%rbx),%rcx
   140137b33:	vzeroupper
   140137b36:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137b3b:	mov    0x1048(%rbx),%r11
   140137b42:	mov    0x1050(%rbx),%rax
   140137b49:	jmp    14013591c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1136c>
   140137b4e:	mov    0x1050(%rbx),%rax
   140137b55:	mov    0x1048(%rbx),%rsi
   140137b5c:	mov    %rax,%rdx
   140137b5f:	mov    %rsi,%r11
   140137b62:	sub    %rsi,%rdx
   140137b65:	sar    $0x3,%rdx
   140137b69:	lea    (%rdx,%rdx,1),%rcx
   140137b6d:	cmp    %rcx,%rdx
   140137b70:	jb     140137c51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136a1>
   140137b76:	sub    %rsi,%r13
   140137b79:	mov    %rax,0x30(%rsp)
   140137b7e:	add    %r11,%r13
   140137b81:	jmp    14012cda5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x87f5>
   140137b86:	mov    0x1050(%rbx),%rax
   140137b8d:	mov    0x1048(%rbx),%r11
   140137b94:	mov    %rax,%rdx
   140137b97:	sub    %r11,%r13
   140137b9a:	sub    %r11,%rdx
   140137b9d:	sar    $0x3,%rdx
   140137ba1:	lea    (%rdx,%rdx,1),%rcx
   140137ba5:	cmp    %rcx,%rdx
   140137ba8:	jb     140137c73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x136c3>
   140137bae:	mov    %rax,0x30(%rsp)
   140137bb3:	add    %r11,%r13
   140137bb6:	jmp    140130918 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc368>
   140137bbb:	mov    0x1050(%rbx),%rax
   140137bc2:	sub    %r11,%r13
   140137bc5:	mov    %rax,%rdx
   140137bc8:	sub    %r11,%rdx
   140137bcb:	sar    $0x3,%rdx
   140137bcf:	lea    (%rdx,%rdx,1),%rcx
   140137bd3:	cmp    %rcx,%rdx
   140137bd6:	jb     140137d2a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1377a>
   140137bdc:	add    %r11,%r13
   140137bdf:	jmp    14013355f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xefaf>
   140137be4:	mov    0x1050(%rbx),%rax
   140137beb:	mov    0x1048(%rbx),%r11
   140137bf2:	mov    %rax,%rdx
   140137bf5:	sub    %r11,%r13
   140137bf8:	sub    %r11,%rdx
   140137bfb:	sar    $0x3,%rdx
   140137bff:	lea    (%rdx,%rdx,1),%rcx
   140137c03:	cmp    %rcx,%rdx
   140137c06:	jb     140137cd1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13721>
   140137c0c:	mov    %rax,0x30(%rsp)
   140137c11:	add    %r11,%r13
   140137c14:	jmp    140131b59 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd5a9>
   140137c19:	mov    0x1050(%rbx),%rax
   140137c20:	mov    0x1048(%rbx),%rsi
   140137c27:	mov    %rax,%rdx
   140137c2a:	mov    %rsi,%r11
   140137c2d:	sub    %rsi,%rdx
   140137c30:	sar    $0x3,%rdx
   140137c34:	lea    (%rdx,%rdx,1),%rcx
   140137c38:	cmp    %rcx,%rdx
   140137c3b:	jb     140137d4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1379c>
   140137c41:	sub    %rsi,%r13
   140137c44:	mov    %rax,0x30(%rsp)
   140137c49:	add    %r11,%r13
   140137c4c:	jmp    140132d63 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe7b3>
   140137c51:	mov    %rcx,%rdx
   140137c54:	lea    0x1048(%rbx),%rcx
   140137c5b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137c60:	mov    0x1048(%rbx),%r11
   140137c67:	mov    0x1050(%rbx),%rax
   140137c6e:	jmp    140137b76 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135c6>
   140137c73:	mov    %r8d,0x40(%rsp)
   140137c78:	mov    %rcx,%rdx
   140137c7b:	lea    0x1048(%rbx),%rcx
   140137c82:	mov    %r9d,0x30(%rsp)
   140137c87:	vzeroupper
   140137c8a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137c8f:	mov    0x1048(%rbx),%r11
   140137c96:	mov    0x1050(%rbx),%rax
   140137c9d:	mov    0x40(%rsp),%r8d
   140137ca2:	mov    0x30(%rsp),%r9d
   140137ca7:	jmp    140137bae <setun::VM::run_optimized(setun::OptimizedChunk&)+0x135fe>
   140137cac:	mov    %rcx,%rdx
   140137caf:	lea    0x1048(%rbx),%rcx
   140137cb6:	vzeroupper
   140137cb9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137cbe:	mov    0x1048(%rbx),%r11
   140137cc5:	mov    0x1050(%rbx),%rax
   140137ccc:	jmp    140135bb9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11609>
   140137cd1:	mov    %rcx,%rdx
   140137cd4:	lea    0x1048(%rbx),%rcx
   140137cdb:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ce0:	mov    0x1048(%rbx),%r11
   140137ce7:	mov    0x1050(%rbx),%rax
   140137cee:	jmp    140137c0c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1365c>
   140137cf3:	mov    0x1c8(%rsp),%rax
   140137cfb:	mov    0x60(%rsp),%rdx
   140137d00:	lea    0x540(%rsp),%rcx
   140137d08:	mov    %rax,0x1d0(%rsp)
   140137d10:	call   140210640 <setun::VMValue::VMValue(long long)>
   140137d15:	mov    0x540(%rsp),%rax
   140137d1d:	mov    %rax,0x1c8(%rsp)
   140137d25:	jmp    14012e618 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa068>
   140137d2a:	mov    %rcx,%rdx
   140137d2d:	lea    0x1048(%rbx),%rcx
   140137d34:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d39:	mov    0x1048(%rbx),%r11
   140137d40:	mov    0x1050(%rbx),%rax
   140137d47:	jmp    140137bdc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1362c>
   140137d4c:	mov    %rcx,%rdx
   140137d4f:	lea    0x1048(%rbx),%rcx
   140137d56:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137d5b:	mov    0x1048(%rbx),%r11
   140137d62:	mov    0x1050(%rbx),%rax
   140137d69:	jmp    140137c41 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13691>
   140137d6e:	test   %rcx,%rcx
   140137d71:	je     140137d78 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x137c8>
   140137d73:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140137d78:	mov    0x150c0(%rbx),%rax
   140137d7f:	test   %rax,%rax
   140137d82:	je     140137e4b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1389b>
   140137d88:	lea    -0x1(%rax),%rcx
   140137d8c:	imul   $0x28,%rcx,%rdx
   140137d90:	imul   $0x28,%rax,%rax
   140137d94:	vmovdqu 0x10c0(%rbx,%rdx,1),%ymm0
   140137d9d:	mov    0x10e0(%rbx,%rdx,1),%rdx
   140137da5:	add    %rbx,%rax
   140137da8:	mov    %rdx,0x5b0(%rsp)
   140137db0:	mov    0x1098(%rax),%rdi
   140137db7:	mov    0x10a0(%rax),%rdx
   140137dbe:	mov    0x10a8(%rax),%rbp
   140137dc5:	vmovdqu %ymm0,0x590(%rsp)
   140137dce:	mov    %rcx,0x150c0(%rbx)
   140137dd5:	cmpb   $0x0,0x15211(%rbx)
   140137ddc:	je     140137e3a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1388a>
   140137dde:	mov    %rdx,0x15268(%rbx)
   140137de5:	mov    0x1048(%rbx),%r11
   140137dec:	mov    0x40(%rsp),%rcx
   140137df1:	lea    0x8(%r11,%rbp,8),%r13
   140137df6:	mov    %rcx,(%r11,%rbp,8)
   140137dfa:	mov    0x150c0(%rbx),%rbp
   140137e01:	test   %rbp,%rbp
   140137e04:	je     140137e16 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13866>
   140137e06:	lea    -0x1(%rbp),%rax
   140137e0a:	imul   $0x28,%rax,%rax
   140137e0e:	mov    0x10c8(%rbx,%rax,1),%rbp
   140137e16:	add    %r15,%rdi
   140137e19:	mov    %rdi,%r12
   140137e1c:	cmpb   $0x0,0x1040(%rbx)
   140137e23:	je     14012f259 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xaca9>
   140137e29:	movzbl (%rdi),%eax
   140137e2c:	lea    0x1(%rdi),%r12
   140137e30:	lea    0x289269(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140137e37:	jmp    *(%rdi,%rax,8)
   140137e3a:	lea    0x1068(%rbx),%rcx
   140137e41:	vzeroupper
   140137e44:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137e49:	jmp    140137de5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13835>
   140137e4b:	mov    0x40(%rsp),%rax
   140137e50:	mov    0x1048(%rbx),%r11
   140137e57:	lea    0x8(%rdi),%r13
   140137e5b:	mov    %rax,(%rdi)
   140137e5e:	movb   $0x0,0x1040(%rbx)
   140137e65:	jmp    1401251a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf2>
   140137e6a:	mov    0x1048(%rbx),%r11
   140137e71:	mov    0x1050(%rbx),%rax
   140137e78:	vzeroupper
   140137e7b:	jmp    14012a8d9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x6329>
   140137e80:	mov    %rcx,%rdx
   140137e83:	lea    0x1048(%rbx),%rcx
   140137e8a:	vzeroupper
   140137e8d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137e92:	mov    0x1048(%rbx),%r11
   140137e99:	mov    0x1050(%rbx),%rax
   140137ea0:	jmp    140135ef8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11948>
   140137ea5:	mov    0xa0(%rsp),%rax
   140137ead:	xor    %esi,%esi
   140137eaf:	addl   $0x64,0xc(%rax)
   140137eb3:	jmp    14012dae7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9537>
   140137eb8:	lea    (%rsi,%rsi,1),%rdx
   140137ebc:	lea    0x1048(%rbx),%rcx
   140137ec3:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137ec8:	jmp    14012da73 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x94c3>
   140137ecd:	mov    0x1048(%rbx),%r11
   140137ed4:	lea    0x8(%r13),%rax
   140137ed8:	cmp    0x30(%rsp),%rax
   140137edd:	jae    140137f40 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13990>
   140137edf:	mov    0x1050(%rbx),%rax
   140137ee6:	vzeroupper
   140137ee9:	mov    0x1c8(%rsp),%rcx
   140137ef1:	mov    %r13,%rdx
   140137ef4:	lea    0x8(%r13),%r13
   140137ef8:	mov    %rcx,(%rdx)
   140137efb:	jmp    14012da4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x949d>
   140137f00:	mov    0x1048(%rbx),%r11
   140137f07:	lea    0x10(%r13),%rax
   140137f0b:	cmp    0x30(%rsp),%rax
   140137f10:	jae    140137f65 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139b5>
   140137f12:	mov    0x1050(%rbx),%rax
   140137f19:	vzeroupper
   140137f1c:	mov    0x1d0(%rsp),%rcx
   140137f24:	mov    %r13,%rdx
   140137f27:	lea    0x10(%r13),%r13
   140137f2b:	mov    %rcx,-0x10(%r13)
   140137f2f:	mov    0x1c8(%rsp),%rcx
   140137f37:	mov    %rcx,0x8(%rdx)
   140137f3b:	jmp    14012da4d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x949d>
   140137f40:	mov    0x1050(%rbx),%rax
   140137f47:	sub    %r11,%r13
   140137f4a:	mov    %rax,%rdx
   140137f4d:	sub    %r11,%rdx
   140137f50:	sar    $0x3,%rdx
   140137f54:	lea    (%rdx,%rdx,1),%rcx
   140137f58:	cmp    %rcx,%rdx
   140137f5b:	jb     140137f8a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139da>
   140137f5d:	vzeroupper
   140137f60:	add    %r11,%r13
   140137f63:	jmp    140137ee9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13939>
   140137f65:	mov    0x1050(%rbx),%rax
   140137f6c:	sub    %r11,%r13
   140137f6f:	mov    %rax,%rdx
   140137f72:	sub    %r11,%rdx
   140137f75:	sar    $0x3,%rdx
   140137f79:	lea    (%rdx,%rdx,1),%rcx
   140137f7d:	cmp    %rcx,%rdx
   140137f80:	jb     140137fac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139fc>
   140137f82:	vzeroupper
   140137f85:	add    %r11,%r13
   140137f88:	jmp    140137f1c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1396c>
   140137f8a:	mov    %rcx,%rdx
   140137f8d:	lea    0x1048(%rbx),%rcx
   140137f94:	vzeroupper
   140137f97:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137f9c:	mov    0x1048(%rbx),%r11
   140137fa3:	mov    0x1050(%rbx),%rax
   140137faa:	jmp    140137f60 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139b0>
   140137fac:	mov    %rcx,%rdx
   140137faf:	lea    0x1048(%rbx),%rcx
   140137fb6:	vzeroupper
   140137fb9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140137fbe:	mov    0x1048(%rbx),%r11
   140137fc5:	mov    0x1050(%rbx),%rax
   140137fcc:	jmp    140137f85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x139d5>
   140137fce:	mov    0x1050(%rbx),%rax
   140137fd5:	mov    0x1048(%rbx),%r11
   140137fdc:	mov    %rax,%rdx
   140137fdf:	sub    %r11,%r13
   140137fe2:	sub    %r11,%rdx
   140137fe5:	sar    $0x3,%rdx
   140137fe9:	lea    (%rdx,%rdx,1),%rcx
   140137fed:	cmp    %rcx,%rdx
   140137ff0:	jb     140138036 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a86>
   140137ff2:	mov    %rax,0x30(%rsp)
   140137ff7:	add    %r11,%r13
   140137ffa:	jmp    140131a9a <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd4ea>
   140137fff:	mov    0x1c8(%rsp),%rax
   140138007:	mov    0x60(%rsp),%rdx
   14013800c:	lea    0x540(%rsp),%rcx
   140138014:	mov    %rax,0x1d0(%rsp)
   14013801c:	call   140210640 <setun::VMValue::VMValue(long long)>
   140138021:	mov    0x540(%rsp),%rax
   140138029:	mov    %rax,0x1c8(%rsp)
   140138031:	jmp    140128c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46cb>
   140138036:	mov    %rcx,%rdx
   140138039:	lea    0x1048(%rbx),%rcx
   140138040:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138045:	mov    0x1048(%rbx),%r11
   14013804c:	mov    0x1050(%rbx),%rax
   140138053:	jmp    140137ff2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13a42>
   140138055:	mov    %rcx,%rdx
   140138058:	lea    0x1048(%rbx),%rcx
   14013805f:	vzeroupper
   140138062:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138067:	mov    0x1048(%rbx),%r11
   14013806e:	mov    0x1050(%rbx),%rax
   140138075:	jmp    140135fd8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11a28>
   14013807a:	mov    0x1c8(%rsp),%rax
   140138082:	lea    0x710(%rsp),%r10
   14013808a:	mov    $0x1,%edx
   14013808f:	lea    0x720(%rsp),%rsi
   140138097:	mov    %r10,%rcx
   14013809a:	mov    %r10,0x40(%rsp)
   14013809f:	mov    %rax,0x1d0(%rsp)
   1401380a7:	mov    0x540(%rsp),%rax
   1401380af:	movsbl (%rax,%rdi,1),%r8d
   1401380b4:	mov    %rsi,0x710(%rsp)
   1401380bc:	call   1402ed9f0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_construct(unsigned long long, char)>
   1401380c1:	mov    0x40(%rsp),%rdx
   1401380c6:	lea    0x520(%rsp),%rcx
   1401380ce:	call   14020efe0 <setun::VMValue::VMValue(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >)>
   1401380d3:	jmp    14012d5e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9037>
   1401380d8:	mov    0x1050(%rbx),%rax
   1401380df:	sub    %r11,%rax
   1401380e2:	cmp    %rdx,%rax
   1401380e5:	jb     1401384a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ef1>
   1401380eb:	mov    %rdi,0x1060(%rbx)
   1401380f2:	mov    0x152a0(%rbx),%rax
   1401380f9:	cmp    %rax,0x68(%rcx)
   1401380fd:	jae    14013848d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13edd>
   140138103:	mov    0x1060(%rbx),%rax
   14013810a:	mov    0x1048(%rbx),%r11
   140138111:	lea    (%r11,%rax,8),%r13
   140138115:	jmp    140134f4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1099e>
   14013811a:	mov    0x1068(%rbx),%rax
   140138121:	mov    0x1c8(%rsp),%rdx
   140138129:	mov    %rdx,(%rax,%rbp,8)
   14013812d:	mov    0x1d0(%rsp),%rdx
   140138135:	mov    %r13,%rax
   140138138:	lea    0x8(%r13),%r13
   14013813c:	mov    %rdx,(%rax)
   14013813f:	mov    0x1048(%rbx),%r11
   140138146:	xor    %esi,%esi
   140138148:	jmp    140134ecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1091c>
   14013814d:	mov    0x1068(%rbx),%rax
   140138154:	mov    0x1c8(%rsp),%rdx
   14013815c:	mov    %rdx,(%rax,%rbp,8)
   140138160:	jmp    14013813f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b8f>
   140138162:	mov    0x1050(%rbx),%rax
   140138169:	mov    0x1048(%rbx),%r11
   140138170:	mov    %rax,%rdx
   140138173:	sub    %r11,%r13
   140138176:	sub    %r11,%rdx
   140138179:	sar    $0x3,%rdx
   14013817d:	lea    (%rdx,%rdx,1),%rcx
   140138181:	cmp    %rcx,%rdx
   140138184:	jb     140138b64 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145b4>
   14013818a:	mov    %rax,0x30(%rsp)
   14013818f:	add    %r11,%r13
   140138192:	jmp    1401335e5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xf035>
   140138197:	mov    0x1c8(%rsp),%rax
   14013819f:	movslq %edi,%rdx
   1401381a2:	lea    0x540(%rsp),%rcx
   1401381aa:	mov    %rax,0x1d0(%rsp)
   1401381b2:	call   140210640 <setun::VMValue::VMValue(long long)>
   1401381b7:	mov    0x540(%rsp),%rax
   1401381bf:	mov    %rax,0x1c8(%rsp)
   1401381c7:	jmp    140128c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46cb>
   1401381cc:	mov    %rcx,%rdx
   1401381cf:	lea    0x1048(%rbx),%rcx
   1401381d6:	vzeroupper
   1401381d9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401381de:	mov    0x1048(%rbx),%r11
   1401381e5:	mov    0x1050(%rbx),%rax
   1401381ec:	jmp    140134a3b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1048b>
   1401381f1:	mov    %rcx,%rdx
   1401381f4:	lea    0x1048(%rbx),%rcx
   1401381fb:	vzeroupper
   1401381fe:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138203:	mov    0x1048(%rbx),%r11
   14013820a:	mov    0x1050(%rbx),%rax
   140138211:	jmp    140134aab <setun::VM::run_optimized(setun::OptimizedChunk&)+0x104fb>
   140138216:	mov    %rcx,%rdx
   140138219:	lea    0x1048(%rbx),%rcx
   140138220:	vzeroupper
   140138223:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138228:	mov    0x1048(%rbx),%r11
   14013822f:	mov    0x1050(%rbx),%rax
   140138236:	jmp    140134afc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1054c>
   14013823b:	cmp    $0x1,%dil
   14013823f:	je     14013854a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f9a>
   140138245:	cmp    $0x2,%sil
   140138249:	je     140138512 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f62>
   14013824f:	cmp    $0x1,%sil
   140138253:	jne    1401384e7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f37>
   140138259:	mov    0x1048(%rbx),%r11
   140138260:	lea    0x8(%r13),%rax
   140138264:	cmp    0x30(%rsp),%rax
   140138269:	jae    1401384bd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f0d>
   14013826f:	mov    0x1c8(%rsp),%rdx
   140138277:	mov    %r13,%rax
   14013827a:	xor    %esi,%esi
   14013827c:	lea    0x8(%r13),%r13
   140138280:	mov    %rdx,(%rax)
   140138283:	mov    0x80(%rsp),%rax
   14013828b:	mov    0x1068(%rbx),%rdx
   140138292:	movzbl %dil,%r9d
   140138296:	mov    %r9d,%r8d
   140138299:	add    %rbp,%rax
   14013829c:	lea    (%rdx,%rax,8),%rcx
   1401382a0:	xor    %eax,%eax
   1401382a2:	mov    -0x8(%r13,%rax,1),%r10
   1401382a7:	mov    %r10,(%rcx,%rax,1)
   1401382ab:	sub    $0x8,%rax
   1401382af:	sub    $0x1,%r8d
   1401382b3:	jne    1401382a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cf2>
   1401382b5:	lea    -0x1(%r9),%eax
   1401382b9:	imul   $0xfffffffffffffff8,%rax,%rax
   1401382bd:	add    %r13,%rax
   1401382c0:	lea    -0x10(%rax),%r13
   1401382c4:	mov    -0x10(%rax),%rax
   1401382c8:	mov    %rax,(%rdx,%rbp,8)
   1401382cc:	jmp    140134ecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1091c>
   1401382d1:	add    %rdx,%rdx
   1401382d4:	lea    0x1068(%rbx),%rcx
   1401382db:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401382e0:	jmp    140134e92 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x108e2>
   1401382e5:	mov    0x1050(%rbx),%rax
   1401382ec:	mov    0x1048(%rbx),%r11
   1401382f3:	mov    %rax,%rdx
   1401382f6:	sub    %r11,%r13
   1401382f9:	sub    %r11,%rdx
   1401382fc:	sar    $0x3,%rdx
   140138300:	lea    (%rdx,%rdx,1),%rcx
   140138304:	cmp    %rcx,%rdx
   140138307:	jb     14013833b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d8b>
   140138309:	mov    %rax,0x30(%rsp)
   14013830e:	add    %r11,%r13
   140138311:	jmp    14013017b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbbcb>
   140138316:	mov    %rcx,%rdx
   140138319:	lea    0x1048(%rbx),%rcx
   140138320:	vzeroupper
   140138323:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138328:	mov    0x1048(%rbx),%r11
   14013832f:	mov    0x1050(%rbx),%rax
   140138336:	jmp    140134c44 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10694>
   14013833b:	mov    %rcx,%rdx
   14013833e:	lea    0x1048(%rbx),%rcx
   140138345:	mov    %r9,0x30(%rsp)
   14013834a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013834f:	mov    0x1048(%rbx),%r11
   140138356:	mov    0x30(%rsp),%r9
   14013835b:	mov    0x1050(%rbx),%rax
   140138362:	jmp    140138309 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13d59>
   140138364:	mov    %rcx,%rdx
   140138367:	lea    0x1048(%rbx),%rcx
   14013836e:	vzeroupper
   140138371:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138376:	mov    0x1048(%rbx),%r11
   14013837d:	mov    0x1050(%rbx),%rax
   140138384:	jmp    140134b54 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105a4>
   140138389:	mov    0x1050(%rbx),%rax
   140138390:	mov    0x1048(%rbx),%r11
   140138397:	mov    %rax,%rdx
   14013839a:	sub    %r11,%r13
   14013839d:	sub    %r11,%rdx
   1401383a0:	sar    $0x3,%rdx
   1401383a4:	lea    (%rdx,%rdx,1),%rcx
   1401383a8:	cmp    %rcx,%rdx
   1401383ab:	jb     1401383df <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13e2f>
   1401383ad:	mov    %rax,0x30(%rsp)
   1401383b2:	add    %r11,%r13
   1401383b5:	jmp    14012e671 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xa0c1>
   1401383ba:	mov    %rcx,%rdx
   1401383bd:	lea    0x1048(%rbx),%rcx
   1401383c4:	vzeroupper
   1401383c7:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401383cc:	mov    0x1048(%rbx),%r11
   1401383d3:	mov    0x1050(%rbx),%rax
   1401383da:	jmp    140134bac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x105fc>
   1401383df:	mov    %rcx,%rdx
   1401383e2:	lea    0x1048(%rbx),%rcx
   1401383e9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401383ee:	mov    0x1048(%rbx),%r11
   1401383f5:	mov    0x1050(%rbx),%rax
   1401383fc:	jmp    1401383ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13dfd>
   1401383fe:	mov    %rcx,%rdx
   140138401:	lea    0x1048(%rbx),%rcx
   140138408:	vzeroupper
   14013840b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138410:	mov    0x1048(%rbx),%r11
   140138417:	mov    0x1050(%rbx),%rax
   14013841e:	jmp    140134b28 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10578>
   140138423:	mov    0x1050(%rbx),%rcx
   14013842a:	mov    0x1048(%rbx),%rdx
   140138431:	mov    %rcx,%rax
   140138434:	sub    %rdx,%rsi
   140138437:	sub    %rdx,%rax
   14013843a:	sar    $0x3,%rax
   14013843e:	lea    (%rax,%rax,1),%r8
   140138442:	cmp    %r8,%rax
   140138445:	jb     140138b86 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145d6>
   14013844b:	mov    %rcx,0x30(%rsp)
   140138450:	lea    (%rsi,%rdx,1),%rax
   140138454:	mov    0x1d0(%rsp),%rdx
   14013845c:	lea    0x8(%rax),%r13
   140138460:	mov    %rdx,(%rax)
   140138463:	jmp    14012e51b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x9f6b>
   140138468:	mov    %rcx,%rdx
   14013846b:	lea    0x1048(%rbx),%rcx
   140138472:	vzeroupper
   140138475:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013847a:	mov    0x1048(%rbx),%r11
   140138481:	mov    0x1050(%rbx),%rax
   140138488:	jmp    140134bfd <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1064d>
   14013848d:	lea    0x15270(%rbx),%rcx
   140138494:	mov    %rbx,%rdx
   140138497:	call   140158270 <setun::GCEngine::collect_garbage(setun::VM&)>
   14013849c:	jmp    140138103 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b53>
   1401384a1:	lea    0x1048(%rbx),%rcx
   1401384a8:	lea    (%rdi,%rdi,1),%rdx
   1401384ac:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401384b1:	mov    0x15270(%rbx),%rcx
   1401384b8:	jmp    1401380eb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b3b>
   1401384bd:	mov    0x1050(%rbx),%rax
   1401384c4:	sub    %r11,%r13
   1401384c7:	mov    %rax,%rdx
   1401384ca:	sub    %r11,%rdx
   1401384cd:	sar    $0x3,%rdx
   1401384d1:	lea    (%rdx,%rdx,1),%rcx
   1401384d5:	cmp    %rcx,%rdx
   1401384d8:	jb     1401384f3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f43>
   1401384da:	mov    %rax,0x30(%rsp)
   1401384df:	add    %r11,%r13
   1401384e2:	jmp    14013826f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cbf>
   1401384e7:	mov    0x1048(%rbx),%r11
   1401384ee:	jmp    140138283 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cd3>
   1401384f3:	mov    %rcx,%rdx
   1401384f6:	lea    0x1048(%rbx),%rcx
   1401384fd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138502:	mov    0x1048(%rbx),%r11
   140138509:	mov    0x1050(%rbx),%rax
   140138510:	jmp    1401384da <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f2a>
   140138512:	mov    0x1048(%rbx),%r11
   140138519:	lea    0x10(%r13),%rax
   14013851d:	cmp    0x30(%rsp),%rax
   140138522:	jae    140138585 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fd5>
   140138524:	mov    0x1d0(%rsp),%rdx
   14013852c:	mov    %r13,%rax
   14013852f:	xor    %esi,%esi
   140138531:	lea    0x10(%r13),%r13
   140138535:	mov    %rdx,-0x10(%r13)
   140138539:	mov    0x1c8(%rsp),%rdx
   140138541:	mov    %rdx,0x8(%rax)
   140138545:	jmp    140138283 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13cd3>
   14013854a:	cmp    $0x2,%sil
   14013854e:	je     1401385e0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14030>
   140138554:	cmp    $0x1,%sil
   140138558:	je     1401385af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13fff>
   14013855a:	mov    -0x8(%r13),%rcx
   14013855e:	mov    0x1068(%rbx),%rdx
   140138565:	mov    %r13,%rax
   140138568:	lea    -0x10(%r13),%r13
   14013856c:	mov    0x1048(%rbx),%r11
   140138573:	mov    %rcx,0x8(%rdx,%rbp,8)
   140138578:	mov    -0x10(%rax),%rax
   14013857c:	mov    %rax,(%rdx,%rbp,8)
   140138580:	jmp    140134ecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1091c>
   140138585:	mov    0x1050(%rbx),%rax
   14013858c:	sub    %r11,%r13
   14013858f:	mov    %rax,%rdx
   140138592:	sub    %r11,%rdx
   140138595:	sar    $0x3,%rdx
   140138599:	lea    (%rdx,%rdx,1),%rcx
   14013859d:	cmp    %rcx,%rdx
   1401385a0:	jb     140138605 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14055>
   1401385a2:	mov    %rax,0x30(%rsp)
   1401385a7:	add    %r11,%r13
   1401385aa:	jmp    140138524 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13f74>
   1401385af:	mov    0x1068(%rbx),%rax
   1401385b6:	mov    0x1c8(%rsp),%rdx
   1401385be:	xor    %esi,%esi
   1401385c0:	mov    0x1048(%rbx),%r11
   1401385c7:	mov    %rdx,0x8(%rax,%rbp,8)
   1401385cc:	mov    %r13,%rdx
   1401385cf:	lea    -0x8(%r13),%r13
   1401385d3:	mov    -0x8(%rdx),%rdx
   1401385d7:	mov    %rdx,(%rax,%rbp,8)
   1401385db:	jmp    140134ecc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1091c>
   1401385e0:	mov    0x1068(%rbx),%rax
   1401385e7:	mov    0x1d0(%rsp),%rdx
   1401385ef:	mov    %rdx,(%rax,%rbp,8)
   1401385f3:	mov    0x1c8(%rsp),%rdx
   1401385fb:	mov    %rdx,0x8(%rax,%rbp,8)
   140138600:	jmp    14013813f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13b8f>
   140138605:	mov    %rcx,%rdx
   140138608:	lea    0x1048(%rbx),%rcx
   14013860f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138614:	mov    0x1048(%rbx),%r11
   14013861b:	mov    0x1050(%rbx),%rax
   140138622:	jmp    1401385a2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ff2>
   140138627:	cmp    $0x2,%sil
   14013862b:	je     14013884b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1429b>
   140138631:	sub    $0x1,%sil
   140138635:	jne    14013893e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1438e>
   14013863b:	mov    0x1048(%rbx),%r11
   140138642:	lea    0x8(%r13),%rax
   140138646:	cmp    0x30(%rsp),%rax
   14013864b:	jae    140138826 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14276>
   140138651:	mov    0x1050(%rbx),%rax
   140138658:	mov    0x1c8(%rsp),%rcx
   140138660:	mov    %r13,%rdx
   140138663:	lea    0x8(%r13),%r13
   140138667:	mov    %rcx,(%rdx)
   14013866a:	mov    %r12,%rdx
   14013866d:	sub    %r11,%rax
   140138670:	sub    %r15,%rdx
   140138673:	mov    %rdx,0x1038(%rbx)
   14013867a:	mov    %r13,%rdx
   14013867d:	sub    %r11,%rdx
   140138680:	mov    %rdx,%rsi
   140138683:	sar    $0x3,%rsi
   140138687:	cmp    %rdx,%rax
   14013868a:	jae    14013869c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140ec>
   14013868c:	lea    (%rsi,%rsi,1),%rdx
   140138690:	lea    0x1048(%rbx),%rcx
   140138697:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013869c:	mov    %rsi,0x1060(%rbx)
   1401386a3:	vmovdqa 0x225415(%rip),%xmm0        # 14035dac0 <CSWTCH.4381+0x1c0>
   1401386ab:	mov    $0x10,%ecx
   1401386b0:	movb   $0x0,0x153a0(%rbx)
   1401386b7:	vmovdqa %xmm0,0x15390(%rbx)
   1401386bf:	call   140339360 <__cxa_allocate_exception>
   1401386c4:	mov    0x8(%rdi),%r9
   1401386c8:	mov    (%rdi),%r8
   1401386cb:	lea    0x2243f7(%rip),%rdx        # 14035cac9 <.rdata+0x509>
   1401386d2:	mov    %rax,%rsi
   1401386d5:	lea    0x500(%rsp),%rax
   1401386dd:	mov    %rax,%rcx
   1401386e0:	mov    %rax,0xa0(%rsp)
   1401386e8:	call   1400fb2e0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > std::operator+<char, std::char_traits<char>, std::allocator<char> >(char const*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) [clone .isra.0]>
   1401386ed:	mov    0xa0(%rsp),%rcx
   1401386f5:	lea    0x2243de(%rip),%rdx        # 14035cada <.rdata+0x51a>
   1401386fc:	call   1402ee9b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   140138701:	mov    %rax,%rdx
   140138704:	lea    0x520(%rsp),%rcx
   14013870c:	call   1402f0da0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   140138711:	mov    0x40(%rsp),%rax
   140138716:	lea    0x520(%rsp),%rcx
   14013871e:	mov    0x8(%rax),%r8
   140138722:	mov    (%rax),%rdx
   140138725:	call   1402eedc0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*, unsigned long long)>
   14013872a:	mov    %rax,%rdx
   14013872d:	lea    0x540(%rsp),%rcx
   140138735:	call   1402f0da0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   14013873a:	lea    0x2243aa(%rip),%rdx        # 14035caeb <.rdata+0x52b>
   140138741:	lea    0x540(%rsp),%rcx
   140138749:	call   1402ee9b0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::append(char const*)>
   14013874e:	mov    %rax,%rdx
   140138751:	lea    0x710(%rsp),%rcx
   140138759:	call   1402f0da0 <std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&&)>
   14013875e:	lea    0x710(%rsp),%rdx
   140138766:	mov    %rsi,%rcx
   140138769:	call   1402d1000 <std::runtime_error::runtime_error(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>
   14013876e:	lea    0x2411ab(%rip),%rax        # 140379920 <vtable for setun::VMException+0x10>
   140138775:	mov    0x710(%rsp),%rcx
   14013877d:	mov    %rax,(%rsi)
   140138780:	lea    0x720(%rsp),%rax
   140138788:	cmp    %rax,%rcx
   14013878b:	je     14013879e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x141ee>
   14013878d:	mov    0x720(%rsp),%rax
   140138795:	lea    0x1(%rax),%rdx
   140138799:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14013879e:	mov    0x540(%rsp),%rcx
   1401387a6:	lea    0x550(%rsp),%rax
   1401387ae:	cmp    %rax,%rcx
   1401387b1:	je     1401387c4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14214>
   1401387b3:	mov    0x550(%rsp),%rax
   1401387bb:	lea    0x1(%rax),%rdx
   1401387bf:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401387c4:	mov    0x520(%rsp),%rcx
   1401387cc:	lea    0x530(%rsp),%rax
   1401387d4:	cmp    %rax,%rcx
   1401387d7:	je     1401387ea <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1423a>
   1401387d9:	mov    0x530(%rsp),%rax
   1401387e1:	lea    0x1(%rax),%rdx
   1401387e5:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401387ea:	mov    0x500(%rsp),%rcx
   1401387f2:	lea    0x510(%rsp),%rax
   1401387fa:	cmp    %rax,%rcx
   1401387fd:	je     140138810 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14260>
   1401387ff:	mov    0x510(%rsp),%rax
   140138807:	lea    0x1(%rax),%rdx
   14013880b:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140138810:	lea    0xce219(%rip),%r8        # 140206a30 <setun::VMException::~VMException()>
   140138817:	lea    0x23aea2(%rip),%rdx        # 1403736c0 <typeinfo for setun::VMException>
   14013881e:	mov    %rsi,%rcx
   140138821:	call   140339a00 <__cxa_throw>
   140138826:	mov    0x1050(%rbx),%rax
   14013882d:	sub    %r11,%r13
   140138830:	mov    %rax,%rdx
   140138833:	sub    %r11,%rdx
   140138836:	sar    $0x3,%rdx
   14013883a:	lea    (%rdx,%rdx,1),%rcx
   14013883e:	cmp    %rcx,%rdx
   140138841:	jb     1401388b9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14309>
   140138843:	add    %r11,%r13
   140138846:	jmp    140138658 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140a8>
   14013884b:	mov    0x1048(%rbx),%r11
   140138852:	lea    0x10(%r13),%rax
   140138856:	cmp    0x30(%rsp),%rax
   14013885b:	jae    1401388db <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1432b>
   14013885d:	mov    0x1050(%rbx),%rax
   140138864:	mov    0x1d0(%rsp),%rcx
   14013886c:	mov    %r13,%rdx
   14013886f:	lea    0x10(%r13),%r13
   140138873:	mov    %rcx,-0x10(%r13)
   140138877:	mov    0x1c8(%rsp),%rcx
   14013887f:	mov    %rcx,0x8(%rdx)
   140138883:	jmp    14013866a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140ba>
   140138888:	mov    0x1050(%rbx),%rax
   14013888f:	mov    0x1048(%rbx),%r11
   140138896:	mov    %rax,%rdx
   140138899:	sub    %r11,%r13
   14013889c:	sub    %r11,%rdx
   14013889f:	sar    $0x3,%rdx
   1401388a3:	lea    (%rdx,%rdx,1),%rcx
   1401388a7:	cmp    %rcx,%rdx
   1401388aa:	jb     140138900 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14350>
   1401388ac:	mov    %rax,0x30(%rsp)
   1401388b1:	add    %r11,%r13
   1401388b4:	jmp    140135672 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x110c2>
   1401388b9:	mov    %rcx,%rdx
   1401388bc:	lea    0x1048(%rbx),%rcx
   1401388c3:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401388c8:	mov    0x1048(%rbx),%r11
   1401388cf:	mov    0x1050(%rbx),%rax
   1401388d6:	jmp    140138843 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14293>
   1401388db:	mov    0x1050(%rbx),%rax
   1401388e2:	sub    %r11,%r13
   1401388e5:	mov    %rax,%rdx
   1401388e8:	sub    %r11,%rdx
   1401388eb:	sar    $0x3,%rdx
   1401388ef:	lea    (%rdx,%rdx,1),%rcx
   1401388f3:	cmp    %rcx,%rdx
   1401388f6:	jb     14013891f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1436f>
   1401388f8:	add    %r11,%r13
   1401388fb:	jmp    140138864 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142b4>
   140138900:	mov    %rcx,%rdx
   140138903:	lea    0x1048(%rbx),%rcx
   14013890a:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013890f:	mov    0x1048(%rbx),%r11
   140138916:	mov    0x1050(%rbx),%rax
   14013891d:	jmp    1401388ac <setun::VM::run_optimized(setun::OptimizedChunk&)+0x142fc>
   14013891f:	mov    %rcx,%rdx
   140138922:	lea    0x1048(%rbx),%rcx
   140138929:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013892e:	mov    0x1048(%rbx),%r11
   140138935:	mov    0x1050(%rbx),%rax
   14013893c:	jmp    1401388f8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14348>
   14013893e:	mov    0x1048(%rbx),%r11
   140138945:	mov    0x1050(%rbx),%rax
   14013894c:	jmp    14013866a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x140ba>
   140138951:	xor    %eax,%eax
   140138953:	jmp    14013331f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xed6f>
   140138958:	sub    $0x1,%sil
   14013895c:	je     14013897b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143cb>
   14013895e:	lea    0x8(%r13),%rax
   140138962:	cmp    0x30(%rsp),%rax
   140138967:	jae    1401389a1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143f1>
   140138969:	mov    0x1d0(%rsp),%rcx
   140138971:	mov    %r13,%rax
   140138974:	lea    0x8(%r13),%r13
   140138978:	mov    %rcx,(%rax)
   14013897b:	mov    0x1c8(%rsp),%rax
   140138983:	mov    $0x2,%esi
   140138988:	mov    %rax,0x1d0(%rsp)
   140138990:	mov    (%rdx,%r8,8),%rax
   140138994:	mov    %rax,0x1c8(%rsp)
   14013899c:	jmp    140130b2f <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc57f>
   1401389a1:	mov    0x1050(%rbx),%rax
   1401389a8:	mov    0x1048(%rbx),%r11
   1401389af:	mov    %rax,%rcx
   1401389b2:	sub    %r11,%r13
   1401389b5:	sub    %r11,%rcx
   1401389b8:	sar    $0x3,%rcx
   1401389bc:	lea    (%rcx,%rcx,1),%r9
   1401389c0:	cmp    %r9,%rcx
   1401389c3:	jb     1401390d1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b21>
   1401389c9:	mov    %rax,0x30(%rsp)
   1401389ce:	add    %r11,%r13
   1401389d1:	jmp    140138969 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x143b9>
   1401389d3:	mov    0x1050(%rbx),%rax
   1401389da:	mov    0x1048(%rbx),%rsi
   1401389e1:	mov    %rax,%rdx
   1401389e4:	mov    %rsi,%r11
   1401389e7:	sub    %rsi,%rdx
   1401389ea:	sar    $0x3,%rdx
   1401389ee:	lea    (%rdx,%rdx,1),%rcx
   1401389f2:	cmp    %rcx,%rdx
   1401389f5:	jb     140138d4c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1479c>
   1401389fb:	sub    %rsi,%r13
   1401389fe:	mov    %rax,0x30(%rsp)
   140138a03:	add    %r11,%r13
   140138a06:	jmp    1401353c2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e12>
   140138a0b:	mov    0x1050(%rbx),%rax
   140138a12:	sub    %r11,%r13
   140138a15:	mov    %rax,%rdx
   140138a18:	sub    %r11,%rdx
   140138a1b:	sar    $0x3,%rdx
   140138a1f:	lea    (%rdx,%rdx,1),%rcx
   140138a23:	cmp    %rcx,%rdx
   140138a26:	jb     140138f61 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149b1>
   140138a2c:	mov    %rax,0x30(%rsp)
   140138a31:	add    %r11,%r13
   140138a34:	jmp    140134cf6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10746>
   140138a39:	mov    0x1050(%rbx),%rax
   140138a40:	sub    %r11,%r13
   140138a43:	mov    %rax,%rdx
   140138a46:	sub    %r11,%rdx
   140138a49:	sar    $0x3,%rdx
   140138a4d:	lea    (%rdx,%rdx,1),%rcx
   140138a51:	cmp    %rcx,%rdx
   140138a54:	jb     140138bd5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14625>
   140138a5a:	vzeroupper
   140138a5d:	add    %r11,%r13
   140138a60:	jmp    140135c06 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11656>
   140138a65:	mov    0x1050(%rbx),%rax
   140138a6c:	mov    0x1048(%rbx),%rsi
   140138a73:	mov    %rax,%rdx
   140138a76:	mov    %rsi,%r11
   140138a79:	sub    %rsi,%rdx
   140138a7c:	sar    $0x3,%rdx
   140138a80:	lea    (%rdx,%rdx,1),%rcx
   140138a84:	cmp    %rcx,%rdx
   140138a87:	jb     1401390af <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14aff>
   140138a8d:	sub    %rsi,%r13
   140138a90:	mov    %rax,0x30(%rsp)
   140138a95:	add    %r11,%r13
   140138a98:	jmp    140131e1b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xd86b>
   140138a9d:	mov    0x1050(%rbx),%rax
   140138aa4:	mov    0x1048(%rbx),%r11
   140138aab:	mov    %rax,%rdx
   140138aae:	sub    %r11,%r13
   140138ab1:	sub    %r11,%rdx
   140138ab4:	sar    $0x3,%rdx
   140138ab8:	lea    (%rdx,%rdx,1),%rcx
   140138abc:	cmp    %rcx,%rdx
   140138abf:	jb     140138e53 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148a3>
   140138ac5:	mov    %rax,0x30(%rsp)
   140138aca:	add    %r11,%r13
   140138acd:	jmp    1401302fc <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbd4c>
   140138ad2:	mov    $0x20,%r8d
   140138ad8:	jmp    140134e22 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10872>
   140138add:	mov    %rcx,%rdx
   140138ae0:	lea    0x1048(%rbx),%rcx
   140138ae7:	vzeroupper
   140138aea:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138aef:	mov    0x1048(%rbx),%r11
   140138af6:	mov    0x1050(%rbx),%rax
   140138afd:	jmp    140134a0f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1045f>
   140138b02:	mov    %rcx,%rdx
   140138b05:	lea    0x1048(%rbx),%rcx
   140138b0c:	vzeroupper
   140138b0f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138b14:	mov    0x1048(%rbx),%r11
   140138b1b:	mov    0x1050(%rbx),%rax
   140138b22:	jmp    140135e85 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x118d5>
   140138b27:	movslq %edi,%rdx
   140138b2a:	jmp    140135b47 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11597>
   140138b2f:	mov    0x1050(%rbx),%rax
   140138b36:	mov    0x1048(%rbx),%r11
   140138b3d:	mov    %rax,%rdx
   140138b40:	sub    %r11,%r13
   140138b43:	sub    %r11,%rdx
   140138b46:	sar    $0x3,%rdx
   140138b4a:	lea    (%rdx,%rdx,1),%rcx
   140138b4e:	cmp    %rcx,%rdx
   140138b51:	jb     140138f83 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x149d3>
   140138b57:	mov    %rax,0x30(%rsp)
   140138b5c:	add    %r11,%r13
   140138b5f:	jmp    140135e35 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11885>
   140138b64:	mov    %rcx,%rdx
   140138b67:	lea    0x1048(%rbx),%rcx
   140138b6e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138b73:	mov    0x1048(%rbx),%r11
   140138b7a:	mov    0x1050(%rbx),%rax
   140138b81:	jmp    14013818a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13bda>
   140138b86:	lea    0x1048(%rbx),%rcx
   140138b8d:	mov    %r8,%rdx
   140138b90:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138b95:	mov    0x1048(%rbx),%rax
   140138b9c:	mov    0x1050(%rbx),%rdi
   140138ba3:	add    %rsi,%rax
   140138ba6:	mov    %rdi,0x30(%rsp)
   140138bab:	jmp    140138454 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x13ea4>
   140138bb0:	mov    %rcx,%rdx
   140138bb3:	lea    0x1048(%rbx),%rcx
   140138bba:	vzeroupper
   140138bbd:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138bc2:	mov    0x1048(%rbx),%r11
   140138bc9:	mov    0x1050(%rbx),%rax
   140138bd0:	jmp    140134c70 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x106c0>
   140138bd5:	mov    %rcx,%rdx
   140138bd8:	lea    0x1048(%rbx),%rcx
   140138bdf:	vzeroupper
   140138be2:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138be7:	mov    0x1048(%rbx),%r11
   140138bee:	mov    0x1050(%rbx),%rax
   140138bf5:	jmp    140138a5d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144ad>
   140138bfa:	mov    0x1068(%rbx),%rax
   140138c01:	mov    0x1c8(%rsp),%rdx
   140138c09:	mov    %rdx,(%rax,%rbp,8)
   140138c0d:	mov    0x1d0(%rsp),%rdx
   140138c15:	mov    %r13,%rax
   140138c18:	lea    0x8(%r13),%r13
   140138c1c:	mov    %rdx,(%rax)
   140138c1f:	mov    0x1048(%rbx),%r11
   140138c26:	xor    %esi,%esi
   140138c28:	jmp    14012fe8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8db>
   140138c2d:	mov    0x1050(%rbx),%rax
   140138c34:	sub    %r11,%r13
   140138c37:	mov    %rax,%rdx
   140138c3a:	sub    %r11,%rdx
   140138c3d:	sar    $0x3,%rdx
   140138c41:	lea    (%rdx,%rdx,1),%rcx
   140138c45:	cmp    %rcx,%rdx
   140138c48:	jb     140138c74 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x146c4>
   140138c4a:	mov    %rax,0x30(%rsp)
   140138c4f:	add    %r11,%r13
   140138c52:	jmp    1401320c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdb19>
   140138c57:	sub    $0x1,%sil
   140138c5b:	je     140132075 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xdac5>
   140138c61:	mov    0x1048(%rbx),%r11
   140138c68:	mov    0x1068(%rbx),%r8
   140138c6f:	jmp    140127012 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x2a62>
   140138c74:	mov    %rcx,%rdx
   140138c77:	lea    0x1048(%rbx),%rcx
   140138c7e:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138c83:	mov    0x1048(%rbx),%r11
   140138c8a:	mov    0x1050(%rbx),%rax
   140138c91:	jmp    140138c4a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1469a>
   140138c93:	cmp    $0x2,%sil
   140138c97:	je     140138d13 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14763>
   140138c99:	cmp    $0x1,%sil
   140138c9d:	je     140138ce2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14732>
   140138c9f:	mov    -0x8(%r13),%rcx
   140138ca3:	mov    0x1068(%rbx),%rdx
   140138caa:	mov    %r13,%rax
   140138cad:	lea    -0x10(%r13),%r13
   140138cb1:	mov    0x1048(%rbx),%r11
   140138cb8:	mov    %rcx,0x8(%rdx,%rbp,8)
   140138cbd:	mov    -0x10(%rax),%rax
   140138cc1:	mov    %rax,(%rdx,%rbp,8)
   140138cc5:	jmp    14012fe8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8db>
   140138cca:	mov    0x1068(%rbx),%rax
   140138cd1:	mov    0x1c8(%rsp),%rdx
   140138cd9:	mov    %rdx,(%rax,%rbp,8)
   140138cdd:	jmp    140138c1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1466f>
   140138ce2:	mov    0x1068(%rbx),%rax
   140138ce9:	mov    0x1c8(%rsp),%rdx
   140138cf1:	xor    %esi,%esi
   140138cf3:	mov    0x1048(%rbx),%r11
   140138cfa:	mov    %rdx,0x8(%rax,%rbp,8)
   140138cff:	mov    %r13,%rdx
   140138d02:	lea    -0x8(%r13),%r13
   140138d06:	mov    -0x8(%rdx),%rdx
   140138d0a:	mov    %rdx,(%rax,%rbp,8)
   140138d0e:	jmp    14012fe8b <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8db>
   140138d13:	mov    0x1068(%rbx),%rax
   140138d1a:	mov    0x1d0(%rsp),%rdx
   140138d22:	mov    %rdx,(%rax,%rbp,8)
   140138d26:	mov    0x1c8(%rsp),%rdx
   140138d2e:	mov    %rdx,0x8(%rax,%rbp,8)
   140138d33:	jmp    140138c1f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1466f>
   140138d38:	add    %rdx,%rdx
   140138d3b:	lea    0x1068(%rbx),%rcx
   140138d42:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138d47:	jmp    14012fe51 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xb8a1>
   140138d4c:	mov    %rcx,%rdx
   140138d4f:	lea    0x1048(%rbx),%rcx
   140138d56:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138d5b:	mov    0x1048(%rbx),%r11
   140138d62:	mov    0x1050(%rbx),%rax
   140138d69:	jmp    1401389fb <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1444b>
   140138d6e:	mov    %rcx,%rdx
   140138d71:	lea    0x1048(%rbx),%rcx
   140138d78:	vzeroupper
   140138d7b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138d80:	mov    0x1048(%rbx),%r11
   140138d87:	mov    0x1050(%rbx),%rax
   140138d8e:	jmp    140134f9c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x109ec>
   140138d93:	mov    %rcx,%rdx
   140138d96:	lea    0x1048(%rbx),%rcx
   140138d9d:	vzeroupper
   140138da0:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138da5:	mov    0x1048(%rbx),%r11
   140138dac:	mov    0x1050(%rbx),%rax
   140138db3:	jmp    140134ff4 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a44>
   140138db8:	mov    %rcx,%rdx
   140138dbb:	lea    0x1048(%rbx),%rcx
   140138dc2:	vzeroupper
   140138dc5:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138dca:	mov    0x1048(%rbx),%r11
   140138dd1:	mov    0x1050(%rbx),%rax
   140138dd8:	jmp    140134fc8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a18>
   140138ddd:	mov    %rcx,%rdx
   140138de0:	lea    0x1048(%rbx),%rcx
   140138de7:	vzeroupper
   140138dea:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138def:	mov    0x1048(%rbx),%r11
   140138df6:	mov    0x1050(%rbx),%rax
   140138dfd:	jmp    140135020 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10a70>
   140138e02:	mov    0x1048(%rbx),%r11
   140138e09:	jmp    140134d0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1075a>
   140138e0e:	mov    0x1048(%rbx),%r11
   140138e15:	lea    0x10(%r13),%rax
   140138e19:	cmp    0x30(%rsp),%rax
   140138e1e:	jae    140138e7f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148cf>
   140138e20:	mov    0x1d0(%rsp),%rdx
   140138e28:	mov    %r13,%rax
   140138e2b:	xor    %esi,%esi
   140138e2d:	lea    0x10(%r13),%r13
   140138e31:	mov    %rdx,-0x10(%r13)
   140138e35:	mov    0x1c8(%rsp),%rdx
   140138e3d:	mov    %rdx,0x8(%rax)
   140138e41:	jmp    140134d0a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1075a>
   140138e46:	movzwl 0x28(%rcx),%eax
   140138e4a:	mov    %eax,0x60(%rsp)
   140138e4e:	jmp    140134df1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10841>
   140138e53:	mov    %rcx,%rdx
   140138e56:	lea    0x1048(%rbx),%rcx
   140138e5d:	mov    %r8,0x30(%rsp)
   140138e62:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138e67:	mov    0x1048(%rbx),%r11
   140138e6e:	mov    0x30(%rsp),%r8
   140138e73:	mov    0x1050(%rbx),%rax
   140138e7a:	jmp    140138ac5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14515>
   140138e7f:	mov    0x1050(%rbx),%rax
   140138e86:	sub    %r11,%r13
   140138e89:	mov    %rax,%rdx
   140138e8c:	sub    %r11,%rdx
   140138e8f:	sar    $0x3,%rdx
   140138e93:	lea    (%rdx,%rdx,1),%rcx
   140138e97:	cmp    %rcx,%rdx
   140138e9a:	jb     140139101 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b51>
   140138ea0:	mov    %rax,0x30(%rsp)
   140138ea5:	add    %r11,%r13
   140138ea8:	jmp    140138e20 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14870>
   140138ead:	mov    %rcx,%rdx
   140138eb0:	lea    0x1048(%rbx),%rcx
   140138eb7:	vzeroupper
   140138eba:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138ebf:	mov    0x1048(%rbx),%r11
   140138ec6:	mov    0x1050(%rbx),%rax
   140138ecd:	jmp    14013541e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x10e6e>
   140138ed2:	mov    %rcx,%rdx
   140138ed5:	lea    0x1048(%rbx),%rcx
   140138edc:	vzeroupper
   140138edf:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138ee4:	mov    0x1048(%rbx),%r11
   140138eeb:	mov    0x1050(%rbx),%rax
   140138ef2:	jmp    140135c7a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x116ca>
   140138ef7:	mov    0x1048(%rbx),%r11
   140138efe:	mov    0x1050(%rbx),%rax
   140138f05:	vzeroupper
   140138f08:	jmp    140132bc2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xe612>
   140138f0d:	mov    %r8d,0x30(%rsp)
   140138f12:	mov    %rcx,%rdx
   140138f15:	lea    0x1048(%rbx),%rcx
   140138f1c:	vzeroupper
   140138f1f:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138f24:	mov    0x1048(%rbx),%r11
   140138f2b:	mov    0x1050(%rbx),%rax
   140138f32:	mov    0x30(%rsp),%r8d
   140138f37:	jmp    140135ccf <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1171f>
   140138f3c:	mov    %rcx,%rdx
   140138f3f:	lea    0x1048(%rbx),%rcx
   140138f46:	vzeroupper
   140138f49:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138f4e:	mov    0x1048(%rbx),%r11
   140138f55:	mov    0x1050(%rbx),%rax
   140138f5c:	jmp    140135c4e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1169e>
   140138f61:	mov    %rcx,%rdx
   140138f64:	lea    0x1048(%rbx),%rcx
   140138f6b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138f70:	mov    0x1048(%rbx),%r11
   140138f77:	mov    0x1050(%rbx),%rax
   140138f7e:	jmp    140138a2c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x1447c>
   140138f83:	mov    %rcx,%rdx
   140138f86:	lea    0x1048(%rbx),%rcx
   140138f8d:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140138f92:	mov    0x1048(%rbx),%r11
   140138f99:	mov    0x1050(%rbx),%rax
   140138fa0:	jmp    140138b57 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x145a7>
   140138fa5:	mov    0x1048(%rbx),%r11
   140138fac:	lea    0x8(%r13),%rax
   140138fb0:	cmp    0x30(%rsp),%rax
   140138fb5:	jae    140138fff <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a4f>
   140138fb7:	mov    0x1050(%rbx),%rax
   140138fbe:	mov    0x1c8(%rsp),%rcx
   140138fc6:	mov    %r13,%rdx
   140138fc9:	lea    0x8(%r13),%r13
   140138fcd:	mov    %rcx,(%rdx)
   140138fd0:	jmp    14013051e <setun::VM::run_optimized(setun::OptimizedChunk&)+0xbf6e>
   140138fd5:	mov    0x1050(%rbx),%rax
   140138fdc:	sub    %r11,%r13
   140138fdf:	mov    %rax,%rdx
   140138fe2:	sub    %r11,%rdx
   140138fe5:	sar    $0x3,%rdx
   140138fe9:	lea    (%rdx,%rdx,1),%rcx
   140138fed:	cmp    %rcx,%rdx
   140138ff0:	jb     140139026 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a76>
   140138ff2:	mov    %rax,0x30(%rsp)
   140138ff7:	add    %r11,%r13
   140138ffa:	jmp    140135811 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x11261>
   140138fff:	mov    0x1050(%rbx),%rax
   140139006:	sub    %r11,%r13
   140139009:	mov    %rax,%rdx
   14013900c:	sub    %r11,%rdx
   14013900f:	sar    $0x3,%rdx
   140139013:	lea    (%rdx,%rdx,1),%rcx
   140139017:	cmp    %rcx,%rdx
   14013901a:	jb     140139048 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a98>
   14013901c:	mov    %rax,0x30(%rsp)
   140139021:	add    %r11,%r13
   140139024:	jmp    140138fbe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a0e>
   140139026:	mov    %rcx,%rdx
   140139029:	lea    0x1048(%rbx),%rcx
   140139030:	vzeroupper
   140139033:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139038:	mov    0x1048(%rbx),%r11
   14013903f:	mov    0x1050(%rbx),%rax
   140139046:	jmp    140138ff2 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a42>
   140139048:	mov    %rcx,%rdx
   14013904b:	lea    0x1048(%rbx),%rcx
   140139052:	vzeroupper
   140139055:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   14013905a:	mov    0x1048(%rbx),%r11
   140139061:	mov    0x1050(%rbx),%rax
   140139068:	jmp    14013901c <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14a6c>
   14013906a:	mov    %r8,%rdx
   14013906d:	mov    %rdi,%rcx
   140139070:	mov    $0x1,%esi
   140139075:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   14013907a:	mov    %rax,0x1c8(%rsp)
   140139082:	jmp    140128c80 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46d0>
   140139087:	mov    0x1c8(%rsp),%rax
   14013908f:	mov    %r8,%rdx
   140139092:	mov    %rdi,%rcx
   140139095:	mov    %rax,0x1d0(%rsp)
   14013909d:	call   140148b90 <setun::ArrayObject::get(unsigned long long) const>
   1401390a2:	mov    %rax,0x1c8(%rsp)
   1401390aa:	jmp    140128c7b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x46cb>
   1401390af:	mov    %rcx,%rdx
   1401390b2:	lea    0x1048(%rbx),%rcx
   1401390b9:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401390be:	mov    0x1048(%rbx),%r11
   1401390c5:	mov    0x1050(%rbx),%rax
   1401390cc:	jmp    140138a8d <setun::VM::run_optimized(setun::OptimizedChunk&)+0x144dd>
   1401390d1:	mov    %r9,%rdx
   1401390d4:	lea    0x1048(%rbx),%rcx
   1401390db:	mov    %r8,0x30(%rsp)
   1401390e0:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401390e5:	mov    0x1048(%rbx),%r11
   1401390ec:	mov    0x48(%rdi),%rdx
   1401390f0:	mov    0x1050(%rbx),%rax
   1401390f7:	mov    0x30(%rsp),%r8
   1401390fc:	jmp    1401389c9 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14419>
   140139101:	mov    %rcx,%rdx
   140139104:	lea    0x1048(%rbx),%rcx
   14013910b:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   140139110:	mov    0x1048(%rbx),%r11
   140139117:	mov    0x1050(%rbx),%rax
   14013911e:	jmp    140138ea0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x148f0>
   140139123:	mov    %rax,%rbx
   140139126:	test   %rdi,%rdi
   140139129:	jne    14013919b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14beb>
   14013912b:	vzeroupper
   14013912e:	mov    %rbx,%rcx
   140139131:	call   1401f0540 <_Unwind_Resume>
   140139136:	sub    $0x1,%rdx
   14013913a:	mov    %rax,%rcx
   14013913d:	jne    140139262 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cb2>
   140139143:	vzeroupper
   140139146:	call   1403393e0 <__cxa_begin_catch>
   14013914b:	call   140339550 <__cxa_end_catch>
   140139150:	mov    0x15108(%rbx),%rax
   140139157:	cmp    0x15100(%rbx),%rax
   14013915e:	jne    14013926a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cba>
   140139164:	call   1403399b0 <__cxa_rethrow>
   140139169:	mov    0x710(%rsp),%rcx
   140139171:	mov    %rax,%rbx
   140139174:	lea    0x720(%rsp),%rax
   14013917c:	cmp    %rax,%rcx
   14013917f:	je     14013912b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7b>
   140139181:	mov    0x720(%rsp),%rax
   140139189:	lea    0x1(%rax),%rdx
   14013918d:	vzeroupper
   140139190:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140139195:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   140139197:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139199:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013919b:	mov    %rdi,%rcx
   14013919e:	vzeroupper
   1401391a1:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401391a6:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401391a8:	mov    0x710(%rsp),%rcx
   1401391b0:	mov    %rax,%rbx
   1401391b3:	lea    0x720(%rsp),%rax
   1401391bb:	cmp    %rax,%rcx
   1401391be:	je     14013925a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14caa>
   1401391c4:	mov    0x720(%rsp),%rax
   1401391cc:	lea    0x1(%rax),%rdx
   1401391d0:	vzeroupper
   1401391d3:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401391d8:	mov    0x540(%rsp),%rcx
   1401391e0:	lea    0x550(%rsp),%rax
   1401391e8:	cmp    %rax,%rcx
   1401391eb:	je     1401391fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c4e>
   1401391ed:	mov    0x550(%rsp),%rax
   1401391f5:	lea    0x1(%rax),%rdx
   1401391f9:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401391fe:	mov    0x520(%rsp),%rcx
   140139206:	lea    0x530(%rsp),%rax
   14013920e:	cmp    %rax,%rcx
   140139211:	je     140139224 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c74>
   140139213:	mov    0x530(%rsp),%rax
   14013921b:	lea    0x1(%rax),%rdx
   14013921f:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140139224:	mov    0x500(%rsp),%rcx
   14013922c:	lea    0x510(%rsp),%rax
   140139234:	cmp    %rax,%rcx
   140139237:	je     14013924a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c9a>
   140139239:	mov    0x510(%rsp),%rax
   140139241:	lea    0x1(%rax),%rdx
   140139245:	call   1403391b0 <operator delete(void*, unsigned long long)>
   14013924a:	mov    %rsi,%rcx
   14013924d:	call   140339620 <__cxa_free_exception>
   140139252:	mov    %rbx,%rcx
   140139255:	call   1401f0540 <_Unwind_Resume>
   14013925a:	vzeroupper
   14013925d:	jmp    1401391d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c28>
   140139262:	vzeroupper
   140139265:	call   1401f0540 <_Unwind_Resume>
   14013926a:	mov    -0x20(%rax),%rdi
   14013926e:	mov    -0x18(%rax),%rcx
   140139272:	sub    $0x20,%rax
   140139276:	mov    0x10(%rax),%rdx
   14013927a:	mov    0x18(%rax),%rsi
   14013927e:	mov    %rax,0x15108(%rbx)
   140139285:	cmp    0x1060(%rbx),%rcx
   14013928c:	jae    140139295 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ce5>
   14013928e:	mov    %rcx,0x1060(%rbx)
   140139295:	cmpb   $0x0,0x15211(%rbx)
   14013929c:	je     1401392bc <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d0c>
   14013929e:	mov    %rdx,0x15268(%rbx)
   1401392a5:	cmp    %rsi,0x150c0(%rbx)
   1401392ac:	jb     1401392e8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d38>
   1401392ae:	cmp    $0x800,%rsi
   1401392b5:	jbe    1401392e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d31>
   1401392b7:	call   14033f640 <setun::FixedFrameArena::handle_overflow() const [clone .isra.0]>
   1401392bc:	mov    0x1070(%rbx),%rax
   1401392c3:	sub    0x1068(%rbx),%rax
   1401392ca:	sar    $0x3,%rax
   1401392ce:	cmp    %rdx,%rax
   1401392d1:	jb     1401392a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cf5>
   1401392d3:	lea    0x1068(%rbx),%rcx
   1401392da:	call   1402e9ca0 <std::vector<setun::VMValue, std::allocator<setun::VMValue> >::resize(unsigned long long)>
   1401392df:	jmp    1401392a5 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14cf5>
   1401392e1:	mov    %rsi,0x150c0(%rbx)
   1401392e8:	mov    %rdi,0x1038(%rbx)
   1401392ef:	lea    0x224371(%rip),%rdx        # 14035d667 <.rdata+0x10a7>
   1401392f6:	lea    0x710(%rsp),%rcx
   1401392fe:	call   14020f640 <setun::VMValue::VMValue(char const*)>
   140139303:	lea    0x1048(%rbx),%rcx
   14013930a:	lea    0x710(%rsp),%rdx
   140139312:	call   14020e7e0 <setun::VMStack::push(setun::VMValue const&)>
   140139317:	mov    0x1060(%rbx),%rax
   14013931e:	mov    0x1048(%rbx),%r11
   140139325:	mov    0x1038(%rbx),%r12
   14013932c:	mov    0x150c0(%rbx),%rbp
   140139333:	lea    (%r11,%rax,8),%r13
   140139337:	mov    0x1050(%rbx),%rax
   14013933e:	add    %r15,%r12
   140139341:	mov    %rax,0x30(%rsp)
   140139346:	test   %rbp,%rbp
   140139349:	jne    140139372 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dc2>
   14013934b:	cmpb   $0x0,0x1040(%rbx)
   140139352:	je     1401251e1 <setun::VM::run_optimized(setun::OptimizedChunk&)+0xc31>
   140139358:	mov    %r12,%rax
   14013935b:	lea    0x287d3e(%rip),%rdi        # 1403c10a0 <setun::VM::run_optimized(setun::OptimizedChunk&)::lbl_table>
   140139362:	lea    0x1(%r12),%r12
   140139367:	xor    %esi,%esi
   140139369:	movzbl (%rax),%eax
   14013936c:	mov    (%rdi,%rax,8),%rax
   140139370:	jmp    *%rax
   140139372:	lea    -0x1(%rbp),%rdx
   140139376:	imul   $0x28,%rdx,%rdx
   14013937a:	mov    0x10c8(%rbx,%rdx,1),%rbp
   140139382:	jmp    14013934b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d9b>
   140139384:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139389:	mov    0x710(%rsp),%rcx
   140139391:	mov    %rax,%rbx
   140139394:	cmp    %rsi,%rcx
   140139397:	je     14013940f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e5f>
   140139399:	mov    0x720(%rsp),%rax
   1401393a1:	lea    0x1(%rax),%rdx
   1401393a5:	vzeroupper
   1401393a8:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401393ad:	mov    0x540(%rsp),%rcx
   1401393b5:	lea    0x550(%rsp),%rax
   1401393bd:	cmp    %rax,%rcx
   1401393c0:	je     14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401393c6:	mov    0x550(%rsp),%rax
   1401393ce:	lea    0x1(%rax),%rdx
   1401393d2:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401393d7:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401393dc:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   1401393e1:	jmp    140139389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd9>
   1401393e3:	mov    %rax,%rbx
   1401393e6:	vzeroupper
   1401393e9:	jmp    1401391d8 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c28>
   1401393ee:	mov    %rax,%rbx
   1401393f1:	vzeroupper
   1401393f4:	jmp    1401391fe <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c4e>
   1401393f9:	mov    %rax,%rbx
   1401393fc:	vzeroupper
   1401393ff:	jmp    140139224 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c74>
   140139404:	mov    %rax,%rbx
   140139407:	vzeroupper
   14013940a:	jmp    14013924a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c9a>
   14013940f:	vzeroupper
   140139412:	jmp    1401393ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dfd>
   140139414:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139419:	mov    %rax,%rbx
   14013941c:	vzeroupper
   14013941f:	jmp    1401393ad <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dfd>
   140139421:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139426:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013942b:	mov    0x548(%rsp),%rcx
   140139433:	mov    %rax,%rbx
   140139436:	test   %rcx,%rcx
   140139439:	je     14013912b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7b>
   14013943f:	vzeroupper
   140139442:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139447:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   14013944c:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139451:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139456:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   14013945b:	vzeroupper
   14013945e:	jmp    1401392b7 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14d07>
   140139463:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139468:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013946d:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139472:	jmp    140139389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd9>
   140139477:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   14013947c:	jmp    140139389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd9>
   140139481:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139486:	mov    %rax,%rbx
   140139489:	mov    %rsi,%rcx
   14013948c:	vzeroupper
   14013948f:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139494:	mov    %rbx,%rcx
   140139497:	call   1401f0540 <_Unwind_Resume>
   14013949c:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394a1:	mov    %rax,%rbx
   1401394a4:	cmpq   $0x0,0x60(%rsp)
   1401394aa:	je     14013912b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7b>
   1401394b0:	mov    0x60(%rsp),%rcx
   1401394b5:	jmp    14013943f <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e8f>
   1401394b7:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394bc:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394c1:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394c6:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394cb:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394d0:	mov    %rax,%rbx
   1401394d3:	cmpq   $0x0,0x40(%rsp)
   1401394d9:	je     14013912b <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7b>
   1401394df:	mov    0x40(%rsp),%rcx
   1401394e4:	vzeroupper
   1401394e7:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401394ec:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401394f1:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394f6:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   1401394fb:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139500:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139505:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013950a:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013950f:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139514:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139519:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013951e:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139523:	mov    0x710(%rsp),%rcx
   14013952b:	mov    %rax,%rbx
   14013952e:	lea    0x720(%rsp),%rax
   140139536:	cmp    %rax,%rcx
   140139539:	je     140139407 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e57>
   14013953f:	mov    0x720(%rsp),%rax
   140139547:	lea    0x1(%rax),%rdx
   14013954b:	vzeroupper
   14013954e:	call   1403391b0 <operator delete(void*, unsigned long long)>
   140139553:	jmp    14013924a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14c9a>
   140139558:	jmp    140139404 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e54>
   14013955d:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139562:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139567:	mov    0x718(%rsp),%rcx
   14013956f:	mov    %rax,%rbx
   140139572:	test   %rcx,%rcx
   140139575:	jne    1401395a3 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14ff3>
   140139577:	vzeroupper
   14013957a:	mov    %rdi,%rcx
   14013957d:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   140139582:	mov    %rbx,%rcx
   140139585:	call   1401f0540 <_Unwind_Resume>
   14013958a:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   14013958f:	jmp    140139419 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14e69>
   140139594:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139599:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   14013959e:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   1401395a3:	vzeroupper
   1401395a6:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401395ab:	jmp    14013957a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fca>
   1401395ad:	mov    0x710(%rsp),%rcx
   1401395b5:	mov    %rax,%rbx
   1401395b8:	lea    0x720(%rsp),%rax
   1401395c0:	cmp    %rax,%rcx
   1401395c3:	jne    1401395e6 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15036>
   1401395c5:	vzeroupper
   1401395c8:	jmp    1401395d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15020>
   1401395ca:	mov    %rax,%rbx
   1401395cd:	vzeroupper
   1401395d0:	test   %rdi,%rdi
   1401395d3:	je     14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401395d9:	mov    %rdi,%rcx
   1401395dc:	call   1402d8a00 <std::_Sp_counted_base<(__gnu_cxx::_Lock_policy)2>::_M_release()>
   1401395e1:	jmp    14013912e <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b7e>
   1401395e6:	mov    0x720(%rsp),%rax
   1401395ee:	lea    0x1(%rax),%rdx
   1401395f2:	vzeroupper
   1401395f5:	call   1403391b0 <operator delete(void*, unsigned long long)>
   1401395fa:	jmp    1401395d0 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x15020>
   1401395fc:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139601:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139606:	jmp    140139567 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fb7>
   14013960b:	mov    %rax,%rbx
   14013960e:	vzeroupper
   140139611:	jmp    14013957a <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fca>
   140139616:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013961b:	jmp    140139389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd9>
   140139620:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139625:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   14013962a:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013962f:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139634:	jmp    140139169 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14bb9>
   140139639:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013963e:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139643:	jmp    140139567 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14fb7>
   140139648:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013964d:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139652:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139657:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013965c:	jmp    140139389 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14dd9>
   140139661:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   140139666:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>
   14013966b:	jmp    140139136 <setun::VM::run_optimized(setun::OptimizedChunk&)+0x14b86>

