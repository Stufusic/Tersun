# Master Scientific Baseline Freeze Report: Tersun 1.0.3 (Gate 1 Baseline)

**Status:** 🔒 **FROZEN & IMMUTABLE BASELINE ARTIFACT**
**Freeze Timestamp:** 2026-09-06 17:20:29

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
| **VM Representation** | Gate 1 (16B TaggedValue, alignas(16)) |

## 2. Heavy Benchmark Suite Raw Performance (N = 10 Repetitions)

| Workload | Tersun VM (16B) Median | Tersun Native AOT Median | CPython 3.14 Median | C++20 -O3 Median | AOT vs CPython | VM vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **H1 Prime Sieve (100k)** | 38.78 ms | 1.94 ms | 22.96 ms | 0.114 ms | **11.8× faster** | 1.69× of Py |
| **H2 Matmul (100x100)** | 310.63 ms | 3.37 ms | 219.27 ms | 0.467 ms | **65.1× faster** | 1.42× of Py |
| **H3 N-Queens (N=11)** | 75.02 ms | 1.68 ms | 58.73 ms | 1.312 ms | **34.9× faster** | 1.28× of Py |
| **H4 Binary Trees (D=14)** | 42.66 ms | 0.00 ms | 11.51 ms | 1.557 ms | **N/A** | 3.71× of Py |

## 3. Classical Microbenchmark Suite Raw Performance (N = 10 Repetitions)

| Workload | Tersun VM (16B) Median | Tersun Native AOT Median | CPython 3.14 Median | C++20 -O3 Median | AOT vs CPython |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **B1 fib(24)** | 13.33 ms | 0.333 ms | 7.39 ms | 0.105 ms | **22.2× faster** |
| **B2 branchy 2M** | 396.76 ms | 1.261 ms | 149.89 ms | 1.305 ms | **118.9× faster** |
| **B3 sum 5M** | 921.33 ms | 1.258 ms | 453.81 ms | 4.845 ms | **360.7× faster** |

## 4. Cryptographic SHA-256 Signatures for Frozen Artifacts

| Artifact File | Type | SHA-256 Checksum |
| :--- | :---: | :--- |
| `heavy_matmul.stn` | File | `36235b3f5b55afd19f25f54d59eb3971c1e0e2150a5a033b8d59be1c2b6dea92` |
| `heavy_matmul.tbc` | File | `dff7fc25eb9e484af085d34830c1aebbfb37a42151758270f3ff628e205a9ee7` |
| `heavy_nqueens.ll` | File | `34c4bcc5b6a3279361aa79b7a10bff312d912f183e2b3d66dd4b3b77ac88e1cc` |
| `heavy_nqueens.stn` | File | `240227c028d81d29ed685bb9f2db1fc05c3870cd18da4623041beafdf5870292` |
| `heavy_nqueens.tbc` | File | `876a6332f2275381c4e59a0ab0039e55393f4a94c255f8a5effb7da244115d44` |
| `heavy_sieve.stn` | File | `a27bbfc46ef6830e7a3603e213f41965aef8630fbfa52511badc9366f4a6bfee` |
| `heavy_sieve.tbc` | File | `61a53cd44dc42ca72c95e222a40340e59234b923c6dec61b9aa715189d2b97fa` |
| `heavy_trees.ll` | File | `01d81629bd13ae562992b9c5b9633d8562fa89458a71f3fc2b633fd174ccfd15` |
| `heavy_trees.stn` | File | `240709c40a3e0a6a17951809099de237e2100cbf2e449eed036987d84138cb11` |
| `heavy_trees.tbc` | File | `101d2a5f895cb12204d9eebc46fa89430b208769d9c97f0667c7c1fdd849e4e2` |
| `libtersun_rt.a` | File | `e02f114ae74e8721ac6c94d6958b1794a48cbbba0eca04f071bba801f9a2caa3` |
| `native_branch.ll` | File | `f3ccc5c8ae533b7eaa3e84927f39ba426f028db53415b2c20508d04f758a4c2c` |
| `native_branch.stn` | File | `5364cca618c7fa861b3618289842aa5d680b110e4ad96bb0b97cf4a60f98b48d` |
| `native_branch.tbc` | File | `c1aab97e2d0935c0510312481286010db1dd030d36cc9f25202c5fd6a830bf69` |
| `native_fib.ll` | File | `9a936a2cbad37f89c4839f45c77d40d4c460c6b1f5598be3e924ae4d5d4f2a3b` |
| `native_fib.stn` | File | `1f9c8d06fbf0509cf60b52903939a6e1b7b4a37a0ba0bde1078f6bb1fa07432a` |
| `native_fib.tbc` | File | `2e29abe35e906cf938492590eabd5cf29b0ab742cdc78f09e077526aa6476bb6` |
| `native_sum.ll` | File | `d8cd66a423bde68ba18e2767c354df7664e0863a4a3ed67d874b10113f0fb868` |
| `native_sum.stn` | File | `cf3822a6e322710a4f1df3ef59b5c037b8d6911dd6d4bfbdf83ab3d1e803c22d` |
| `native_sum.tbc` | File | `33291c754f87a9cff143d26613d3edd43b06aa31dcb088e2b67131b869fcb217` |
| `qft12.ll` | File | `0e1d133d998f31fcef9e6cdbea73f3de915989a64af4e47c6b34eddd41efb432` |
| `qft12.qbc` | File | `756af850c674ae9abd0e3ae15e4a5ceba349f5f941819c403e14a7b4ab09a342` |
| `qft12.stn` | File | `d1495d2f8db7bec3a12a84e1617bcf3a93bcdd6c2aa80137244272db0b2c16fb` |
| `qft8.ll` | File | `dff9b7e2ade9235fd94f6c2be813d6a7807afe1c96f8835643707708a813737f` |
| `qft8.qbc` | File | `b1cb4a2922950a17076220be6e092f4d981df3d19cb54ea6f425c70b892a5c54` |
| `qft8.stn` | File | `c9b6a4c6589f0878d5e834318fe72c39c5c87769acb37dcd21221a18a46f7cde` |
| `setunc.exe` | File | `b6262b66ef718f83323a1c3cf04e5e995931f77f816bf5490ab5f150249752eb` |
| `setunc_test.exe` | File | `4c2db7b31fc9e8a16f511c455e77dbccc33bc103c9208e22a83e125a43f096b1` |

> **Scientific Freeze Guarantee:** All baseline source codes, emitted assembly (.s), LLVM IR (.ll), bytecode binaries (.tbc), and raw execution datasets are cryptographically pinned and immutably preserved in `Doc/artifacts/frozen_baseline/`.
