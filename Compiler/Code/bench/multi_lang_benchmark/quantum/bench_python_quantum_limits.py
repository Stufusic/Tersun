#!/usr/bin/env python3
import os
import sys
import time
import math
import json
import warnings
warnings.filterwarnings('ignore')

import numpy as np

HAS_QISKIT = False
try:
    import qiskit
    from qiskit import QuantumCircuit
    from qiskit.circuit.library import QFT
    from qiskit.quantum_info import Statevector
    HAS_QISKIT = True
except ImportError:
    pass

class NumPyQuantumSim:
    def __init__(self, n_qubits):
        self.n = n_qubits
        self.dim = 1 << n_qubits
        self.state = np.zeros(self.dim, dtype=np.complex128)
        self.state[0] = 1.0

    def h(self, q):
        H = np.array([[1, 1], [1, -1]], dtype=np.complex128) / math.sqrt(2)
        state = self.state.reshape([2] * self.n)
        state = np.tensordot(H, state, axes=(1, q))
        self.state = np.moveaxis(state, 0, q).flatten()

    def cnot(self, ctrl, target):
        state = self.state.reshape([2] * self.n)
        slices_0 = [slice(None)] * self.n
        slices_1 = [slice(None)] * self.n
        slices_0[ctrl] = 1
        slices_0[target] = 0
        slices_1[ctrl] = 1
        slices_1[target] = 1
        tmp = state[tuple(slices_0)].copy()
        state[tuple(slices_0)] = state[tuple(slices_1)]
        state[tuple(slices_1)] = tmp
        self.state = state.flatten()

    def qft(self):
        for i in range(self.n):
            self.h(i)
            for j in range(i + 1, self.n):
                theta = math.pi / (1 << (j - i))
                state = self.state.reshape([2] * self.n)
                idx = [slice(None)] * self.n
                idx[i] = 1
                idx[j] = 1
                state[tuple(idx)] *= np.exp(1j * theta)
                self.state = state.flatten()

    def measure(self, q):
        state = self.state.reshape([2] * self.n)
        idx1 = [slice(None)] * self.n
        idx1[q] = 1
        p1 = np.sum(np.abs(state[tuple(idx1)]) ** 2)
        r = np.random.random()
        outcome = 1 if r < p1 else 0
        idx_zero = [slice(None)] * self.n
        idx_zero[q] = 1 - outcome
        state[tuple(idx_zero)] = 0.0
        norm = np.linalg.norm(self.state)
        if norm > 1e-12:
            self.state /= norm
        return outcome

def bench_numpy_limits():
    results = {}
    print("\n--- NumPy Quantum Limits (N = 10 to 26) ---")
    for n in [10, 14, 18, 20, 22, 24, 25, 26]:
        dim = 1 << n
        mem_mb = (dim * 16) / (1024 * 1024)
        try:
            t0 = time.perf_counter()
            sim = NumPyQuantumSim(n)
            t_alloc = time.perf_counter()
            
            for i in range(n):
                sim.h(i)
            for i in range(n - 1):
                sim.cnot(i, i + 1)
            t_circuit = time.perf_counter()
            
            m0 = sim.measure(0)
            mN = sim.measure(n - 1)
            t_meas = time.perf_counter()

            total_ms = (t_meas - t0) * 1000.0
            print(f"NumPy N={n:2d} ({mem_mb:8.1f} MB) -> Total: {total_ms:8.2f} ms")
            results[n] = {
                "dim": dim, "mem_mb": mem_mb, "total_ms": total_ms, "status": "SUCCESS"
            }
        except MemoryError:
            print(f"NumPy N={n:2d} ({mem_mb:8.1f} MB) -> MemoryError!")
            results[n] = {"dim": dim, "mem_mb": mem_mb, "total_ms": None, "status": "OUT_OF_MEMORY"}
            break
        except Exception as e:
            print(f"NumPy N={n:2d} ({mem_mb:8.1f} MB) -> Error: {e}")
            break
    return results

def bench_qiskit_limits():
    if not HAS_QISKIT:
        return {}
    results = {}
    print("\n--- Qiskit Quantum Limits (N = 4 to 18) ---")
    for n in [4, 6, 8, 10, 12, 14, 16, 18]:
        dim = 1 << n
        mem_mb = (dim * 16) / (1024 * 1024)
        try:
            t0 = time.perf_counter()
            qc = QuantumCircuit(n)
            for i in range(n):
                qc.h(i)
            for i in range(n - 1):
                qc.cx(i, i + 1)
            sv = Statevector.from_instruction(qc)
            t_circuit = time.perf_counter()
            counts = sv.sample_counts(1)
            t_meas = time.perf_counter()
            total_ms = (t_meas - t0) * 1000.0
            print(f"Qiskit N={n:2d} ({mem_mb:8.2f} MB) -> Total: {total_ms:8.2f} ms")
            results[n] = {
                "dim": dim, "mem_mb": mem_mb, "total_ms": total_ms, "status": "SUCCESS"
            }
        except Exception as e:
            print(f"Qiskit N={n:2d} -> Error: {e}")
            results[n] = {"dim": dim, "mem_mb": mem_mb, "total_ms": None, "status": "ERROR"}
            break
    return results

if __name__ == "__main__":
    np_res = bench_numpy_limits()
    qk_res = bench_qiskit_limits()
    out = {"numpy": np_res, "qiskit": qk_res}
    with open("bench/multi_lang_benchmark/quantum/python_quantum_limits.json", "w") as f:
        json.dump(out, f, indent=2)
    print("\nSaved python_quantum_limits.json successfully.")
