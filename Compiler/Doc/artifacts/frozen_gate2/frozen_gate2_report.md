# Master Scientific Baseline Freeze Report: Gate 2 (VMArena Subsystem)

**Status:** 🔒 **FROZEN & IMMUTABLE GATE 2 ARTIFACT**  
**Freeze Timestamp:** 2026-09-06 17:39:03  
**Milestone:** Gate 2 (16B TaggedValue + VMArena Controlled Handle Subsystem)  

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
| **Memory Subsystem** | 256 MB contiguous primary pool, 16 MB secondary chunk expansion, 32-bit handle indexing (ptr = base + handle), O(1) bulk lifetime reset |

## 2. Allocation Throughput Benchmark (1,000,000 Heap Allocations, N = 10)

| Allocator Subsystem | Median Latency | Mean Latency | StdDev | Throughput (alloc/sec) |
| :--- | :---: | :---: | :---: | :---: |
| **Standard `malloc` + `free`** | 122.165 ms | 120.159 ms | 13.5228 | ~8,185,650 ops/s |
| **VMArena Bump + O(1) Reset** | **2.62 ms** | **2.619 ms** | 0.4156 | **~381,679,389 ops/s** |

> **Empirical Throughput Advantage:** VMArena bump-pointer allocation and O(1) bulk memory reset operates **46.63× faster** than system `malloc`/`free`.

## 3. Heavy Benchmark Suite Raw Performance (N = 10 Repetitions)

| Workload | Tersun VM (Gate 2) Median | Tersun Native AOT Median | CPython 3.14 Median | C++20 -O3 Median | AOT vs CPython | Gate 2 vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **H1 Prime Sieve (100k)** | **37.59 ms** | 1.99 ms | 24.68 ms | 0.112 ms | **12.4× faster** | 1.52× of Py |
| **H2 Matmul (100x100)** | **267.40 ms** | 3.60 ms | 203.93 ms | 0.617 ms | **56.6× faster** | 1.31× of Py |
| **H3 N-Queens (N=11)** | **72.60 ms** | 1.66 ms | 59.07 ms | 1.288 ms | **35.5× faster** | 1.23× of Py |
| **H4 Binary Trees (D=14)** | **41.67 ms** | 0.00 ms | 10.29 ms | 1.415 ms | **N/A** | 4.05× of Py |

## 4. Classical Microbenchmark Suite Raw Performance (N = 10 Repetitions)

| Workload | Tersun VM (Gate 2) Median | Tersun Native AOT Median | CPython 3.14 Median | C++20 -O3 Median | AOT vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **B1 fib(24)** | **14.12 ms** | 0.236 ms | 4.70 ms | 0.060 ms | **19.9× faster** |
| **B2 branchy 2M** | **369.65 ms** | 1.226 ms | 167.70 ms | 1.448 ms | **136.8× faster** |
| **B3 sum 5M** | **953.22 ms** | 1.279 ms | 500.10 ms | 4.872 ms | **391.0× faster** |

## 5. Cryptographic SHA-256 Signatures for Frozen Gate 2 Artifacts

| Artifact File | Type | SHA-256 Checksum |
| :--- | :---: | :--- |
| `exhaustive_verify.cpp` | File | `913027a8748d03480982911059e8ee40a8717ad1b5139262d1015abc8fdf1268` |
| `exhaustive_verify.exe` | File | `4bb7ae982aaec9f42f32b0d4acc2fc17f126aad19ad5634e038e545365d5890f` |
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
| `libtersun_rt.a` | File | `57029efb69e626db71347973d36e758f68a2cb28f3cc785d2f887a9ea7a1482e` |
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
| `setunc.exe` | File | `3521441b1259d0fbf23d0d2579c4989b0ed449ee4fc4f88521932ed9cc7f4181` |
| `setunc_test.exe` | File | `9b65d04055ce6f5e8e2501642acd5c4051d188e0c4c6d70dc38c7a30412ed884` |
| `test_gate2_vm_arena.cpp` | File | `f1e8dfe00980758d31ad295363e9ed73c2d52efb2ce9f1f4c9d5206369041606` |
| `test_gate2_vm_arena.exe` | File | `67c1d54ca46ff8b64bb9aea66879cb827dde72cb1fbe83167430850bd375c37d` |
| `value.hpp` | File | `17f2d85b3f64e449db4c9366f1b9e9e9e5b3106dfee521e69e204730375fe82c` |
| `vm_arena.hpp` | File | `01195c7932018279ea311104332975fe19d83bfeb734ff7dc0315963ddfb013d` |

> **Scientific Freeze Guarantee:** All Gate 2 source codes (`value.hpp`, `vm_arena.hpp`), unit tests, emitted assembly (.s), LLVM IR (.ll), bytecode binaries (.tbc), and raw execution datasets are cryptographically pinned and immutably preserved in `Doc/artifacts/frozen_gate2/`.
