# Master Scientific Baseline Freeze Report: Gate 3 (8B NaNBoxValue)

**Status:** 🔒 **FROZEN & IMMUTABLE GATE 3 ARTIFACT**  
**Freeze Timestamp:** 2026-09-06 18:00:04  
**Milestone:** Gate 3 (8B NaNBoxValue Architecture, trivially copyable)  

## 1. Machine & Environment Specification

| Specification | Value |
| :--- | :--- |
| **Host OS** | Windows-11-10.0.26200-SP0 (64bit) |
| **CPU Model** | 12th Gen Intel(R) Core(TM) i5-1245U |
| **CPU Topology** | 10 Cores (12 Threads) |
| **L1 Cache** | 32 KB D-Cache + 48 KB I-Cache per P-core |
| **L2 / L3 Cache** | 6656 KB L2 / 12288 KB L3 |
| **Host Memory** | 16.0 GB Physical RAM |
| **C++ Compiler** | GCC 15.2.0 (MinGW-w64 x86_64-posix-seh) (-std=c++20 -O3) |
| **Python Runtime** | CPython 3.14.3 (CPython) |
| **Tersun Version** | 1.0.3 |
| **Bit Layout Spec** | 16-bit Major Tag [0xFFF8..0xFFFF] + 16-bit Heap Subtype + 32-bit VMArena Handle. Exact IEEE 754 float bit-roundtrip, 48-bit immediate int with boxed Int64 fallback. |

## 2. 8B Trivially Copyable Stack Throughput (10,000,000 Operations, N = 10)

| Metric | Median Latency | Mean Latency | StdDev | Throughput |
| :--- | :---: | :---: | :---: | :---: |
| **10M Push/Pop/Copy Cycles** | **83.545 ms** | 84.958 ms | 4.6857 | **119.7 M ops/sec** |

## 3. Heavy Benchmark Suite Performance (N = 10 Repetitions)

| Workload | Gate 0 Baseline (40B) | Gate 2 (16B + Arena) | Gate 3 (8B NaNBox) | CPython 3.14 | Speedup vs Gate 0 | Parity vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **H1 Prime Sieve (100k)** | 96.22 ms | 37.59 ms | **50.82 ms** | 26.04 ms | **1.89×** | 1.95× of Py |
| **H2 Matmul (100x100)** | 819.82 ms | 267.40 ms | **409.33 ms** | 195.33 ms | **2.00×** | 2.10× of Py |
| **H3 N-Queens (N=11)** | 101.40 ms | 72.60 ms | **77.09 ms** | 43.60 ms | **1.32×** | 1.77× of Py |
| **H4 Binary Trees (D=14)** | 66.86 ms | 41.67 ms | **51.76 ms** | 13.20 ms | **1.29×** | 3.92× of Py |

## 4. Classical Microbenchmark Suite Performance (N = 10 Repetitions)

| Workload | Gate 0 Baseline (40B) | Gate 2 (16B + Arena) | Gate 3 (8B NaNBox) | CPython 3.14 | Speedup vs Gate 0 | Status vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **B1 fib(24)** | 17.50 ms | 14.12 ms | **7.74 ms** | 5.83 ms | **2.26×** | 1.33× of Py |
| **B2 branchy 2M** | 672.40 ms | 369.65 ms | **276.23 ms** | 157.29 ms | **2.43×** | 1.76× of Py |
| **B3 sum 5M** | 1571.60 ms | 953.22 ms | **687.25 ms** | 448.04 ms | **2.29×** | 1.53× of Py |

## 5. Cryptographic SHA-256 Signatures for Frozen Gate 3 Artifacts

| Artifact File | Type | SHA-256 Checksum |
| :--- | :---: | :--- |
| `exhaustive_verify.cpp` | File | `913027a8748d03480982911059e8ee40a8717ad1b5139262d1015abc8fdf1268` |
| `exhaustive_verify.exe` | File | `a628f81d76e75d3990a2283e57b221c1679a24ddcc4d689aa679654dd6ac0cf8` |
| `heavy_matmul.stn` | File | `549043494ac816276af62b8ac718d44f1f3995d00e1a5172f4936e7d8f27a839` |
| `heavy_matmul.tbc` | File | `dff7fc25eb9e484af085d34830c1aebbfb37a42151758270f3ff628e205a9ee7` |
| `heavy_nqueens.ll` | File | `34c4bcc5b6a3279361aa79b7a10bff312d912f183e2b3d66dd4b3b77ac88e1cc` |
| `heavy_nqueens.stn` | File | `1bf656333851037d8479a99e2420a0e15845470b67e229119bc7e86043fd4f4e` |
| `heavy_nqueens.tbc` | File | `876a6332f2275381c4e59a0ab0039e55393f4a94c255f8a5effb7da244115d44` |
| `heavy_sieve.stn` | File | `9c816776713d6703b3eb98514cb5dadaf48241e18816f5a2ef9af7a9dbb466a3` |
| `heavy_sieve.tbc` | File | `61a53cd44dc42ca72c95e222a40340e59234b923c6dec61b9aa715189d2b97fa` |
| `heavy_trees.ll` | File | `01d81629bd13ae562992b9c5b9633d8562fa89458a71f3fc2b633fd174ccfd15` |
| `heavy_trees.stn` | File | `aa9912cebbe7fd6a1edd350120e5f1e4a8459e06a9ad82536b1a6956c3917ffe` |
| `heavy_trees.tbc` | File | `101d2a5f895cb12204d9eebc46fa89430b208769d9c97f0667c7c1fdd849e4e2` |
| `libtersun_rt.a` | File | `f7daf6d5b718442e738cec279c63aaea415af7ec8a050387048534f3070fe93c` |
| `native_branch.ll` | File | `f3ccc5c8ae533b7eaa3e84927f39ba426f028db53415b2c20508d04f758a4c2c` |
| `native_branch.stn` | File | `f6158935a726a98053c0f9bba1638af62e7cee85a8e2460a28e85282b50e001a` |
| `native_branch.tbc` | File | `c1aab97e2d0935c0510312481286010db1dd030d36cc9f25202c5fd6a830bf69` |
| `native_fib.ll` | File | `9a936a2cbad37f89c4839f45c77d40d4c460c6b1f5598be3e924ae4d5d4f2a3b` |
| `native_fib.stn` | File | `0a4850c1de14a8ae2b11e76df1fc056af416284c7388a7c16af97c7f3a2f8390` |
| `native_fib.tbc` | File | `2e29abe35e906cf938492590eabd5cf29b0ab742cdc78f09e077526aa6476bb6` |
| `native_sum.ll` | File | `d8cd66a423bde68ba18e2767c354df7664e0863a4a3ed67d874b10113f0fb868` |
| `native_sum.stn` | File | `cf3822a6e322710a4f1df3ef59b5c037b8d6911dd6d4bfbdf83ab3d1e803c22d` |
| `native_sum.tbc` | File | `33291c754f87a9cff143d26613d3edd43b06aa31dcb088e2b67131b869fcb217` |
| `qft12.ll` | File | `0e1d133d998f31fcef9e6cdbea73f3de915989a64af4e47c6b34eddd41efb432` |
| `qft12.qbc` | File | `756af850c674ae9abd0e3ae15e4a5ceba349f5f941819c403e14a7b4ab09a342` |
| `qft12.stn` | File | `12562059137059b6261f2caecb800fb1fae81e6f454321446324aa4f4be25ee5` |
| `qft8.ll` | File | `dff9b7e2ade9235fd94f6c2be813d6a7807afe1c96f8835643707708a813737f` |
| `qft8.qbc` | File | `b1cb4a2922950a17076220be6e092f4d981df3d19cb54ea6f425c70b892a5c54` |
| `qft8.stn` | File | `798e3ce030d50e7733d79c7c3dc10905753c12259d63dfcd9116964af31aa5c9` |
| `setunc.exe` | File | `079fa672b778cb2517cf756a86418b6af6fc6ff90099ce90371917291825d360` |
| `setunc_test.exe` | File | `3452b56300e32565c6d68deea02dbc7ce8d069d1d642b0e248f53818b47c8735` |
| `test_gate3_differential.py` | File | `52d69c2609eb0482464ceaee8d1777435820f52a8fed9a7a77606720a48eec94` |
| `test_gate3_encoding.cpp` | File | `6cf2d60574dbbb6fc3601d7fc843ecf5de012f79d61861aa25cb0ca91491a913` |
| `test_gate3_encoding.exe` | File | `b2f08327734797f23055e43c091e93ea81d86f3329f7a6de92da7700386fad14` |
| `test_gate3_memory.cpp` | File | `f55a3f7ed791ffe2eb96632dddacff41d025d50e9579b565a3f14fe83a163101` |
| `test_gate3_memory.exe` | File | `78b96a1e23e4aab9e564b985dd4a8213b51d7c0277b9900b1f105a013dfae83f` |
| `value.hpp` | File | `62ac2d467921ca31b0fc111225fc30a2a9a833964dbf21b49675fcc1dcf35945` |
| `vm_arena.hpp` | File | `01195c7932018279ea311104332975fe19d83bfeb734ff7dc0315963ddfb013d` |

> **Scientific Freeze Guarantee:** All Gate 3 source codes (`value.hpp`), unit tests, emitted assembly (.s), LLVM IR (.ll), bytecode binaries (.tbc), and raw execution datasets are cryptographically pinned and immutably preserved in `Doc/artifacts/frozen_gate3/`.
