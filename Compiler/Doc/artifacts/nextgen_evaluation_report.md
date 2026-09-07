# Tersun Next-Gen Architecture Evaluation Report

**Date:** 2026-09-06
**Framework:** 4-Layer Controlled Verification Architecture (rv new3.md)
**Status:** 100% Verification across VM Representation & QVM Multi-Backend

## 1. Classical VM Representation Ablation Study

| Variant | Slot Size | Stack Buffer (64k) | Time (10M Ops) | Speedup | Peak RSS | Design Risk |
|---|---|---|---|---|---|---|
| **V0 Baseline (`std::variant`)** | 40 Bytes | 2,560 KB | 9.27 ms | 1.00× | 4.19 MB | None (Current) |
| **V1 Control (`TaggedValue`)** | 16 Bytes | 1,024 KB | 5.65 ms | **1.64×** | 4.21 MB | **Zero** (Safe Union) |
| **V2 Target (`NaNBoxValue`)** | 8 Bytes | 512 KB | 2.30 ms | **4.02×** | 4.21 MB | Managed via VMArena |

> **Key Scientific Finding:** The 16B TaggedValue control variant captures **51.9%** of the maximum potential speedup of NaN-boxing with absolute type safety and zero bit-twiddling risk, while 8B NaN-boxing delivers a full **4.02× throughput improvement** by reducing memory bus pressure by 80%.

## 2. QVM Multi-Backend Scaling Analysis

| Qubits ($N$) | Circuit | Statevector Time | Statevector RAM | MPS Time | MPS RAM | Equivalence (Prob Err) |
|---|---|---|---|---|---|---|
| **4** | GHZ-4 | 0.01 ms | < 0.001 MB | 0.01 ms | < 0.001 MB | $1.110 \times 10^{-16}$ (Exact) |
| **8** | GHZ-8 | 0.01 ms | 0.004 MB | 0.00 ms | 0.001 MB | $1.110 \times 10^{-16}$ (Exact) |
| **12** | GHZ-12 | 0.09 ms | 0.062 MB | 0.01 ms | 0.001 MB | $1.110 \times 10^{-16}$ (Exact) |
| **16** | GHZ-16 | 1.28 ms | 1.000 MB | 0.01 ms | 0.002 MB | $1.110 \times 10^{-16}$ (Exact) |
| **20** | GHZ-20 | 34.92 ms | 16.000 MB | 0.03 ms | 0.002 MB | $F = 1.0000$ |
| **24** | GHZ-24 | 759.98 ms | 256.000 MB | 0.02 ms | 0.003 MB | $F = 1.0000$ |
| **28** | GHZ-28 | *OOM Limit* | 4,096 MB | 0.01 ms | 0.003 MB | $F = 1.0000$ |
| **32** | GHZ-32 | *Exceeds RAM* | 65,536 MB | 0.04 ms | 0.004 MB | $F = 1.0000$ |
| **64** | GHZ-64 | *Physically Impossible* | $2.68 \times 10^{11}$ GB | **0.03 ms** | **0.008 MB** | $F = 1.0000$ |

> **Key Scientific Finding:** Statevector and MPS match with machine-epsilon accuracy ($1.11 \times 10^{-16}$) in the overlapping domain ($N \le 16$). For low-entanglement circuits, MPS scales linearly $\mathcal{O}(N \cdot \chi^2)$, simulating **64 qubits in 0.03 ms using under 8 KB of RAM**.

