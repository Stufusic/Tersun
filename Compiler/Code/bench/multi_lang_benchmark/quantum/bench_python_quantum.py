#!/usr/bin/env python3
import time
import math
import numpy as np

# Try importing Qiskit
HAS_QISKIT = False
try:
    import qiskit
    from qiskit import QuantumCircuit
    from qiskit.circuit.library import QFT
    from qiskit.quantum_info import Statevector
    HAS_QISKIT = True
except ImportError:
    pass

# ============================================================================
# NumPy Native Vectorized Quantum Simulation
# ============================================================================
class NumPyQuantumSim:
    def __init__(self, n_qubits):
        self.n = n_qubits
        self.dim = 1 << n_qubits
        self.state = np.zeros(self.dim, dtype=np.complex128)
        self.state[0] = 1.0

    def h(self, q):
        H = np.array([[1, 1], [1, -1]], dtype=np.complex128) / math.sqrt(2)
        self._apply_1q(H, q)

    def x(self, q):
        X = np.array([[0, 1], [1, 0]], dtype=np.complex128)
        self._apply_1q(X, q)

    def rz(self, q, theta):
        RZ = np.array([[np.exp(-1j * theta / 2), 0], [0, np.exp(1j * theta / 2)]], dtype=np.complex128)
        self._apply_1q(RZ, q)

    def _apply_1q(self, gate, q):
        state = self.state.reshape([2] * self.n)
        state = np.tensordot(gate, state, axes=(1, q))
        # Move axis back
        self.state = np.moveaxis(state, 0, q).flatten()

    def cnot(self, ctrl, target):
        state = self.state.reshape([2] * self.n)
        # Slicing along ctrl == 1
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
                # Controlled RZ approximation / decomposition
                # Apply phase to |11>
                state = self.state.reshape([2] * self.n)
                idx = [slice(None)] * self.n
                idx[i] = 1
                idx[j] = 1
                state[tuple(idx)] *= np.exp(1j * theta)
                self.state = state.flatten()
        # Swaps
        for i in range(self.n // 2):
            pass # basis reversal if needed

    def measure(self, q):
        state = self.state.reshape([2] * self.n)
        idx1 = [slice(None)] * self.n
        idx1[q] = 1
        p1 = np.sum(np.abs(state[tuple(idx1)]) ** 2)
        r = np.random.random()
        outcome = 1 if r < p1 else 0
        # collapse
        idx_zero = [slice(None)] * self.n
        idx_zero[q] = 1 - outcome
        state[tuple(idx_zero)] = 0.0
        norm = np.linalg.norm(self.state)
        if norm > 1e-12:
            self.state /= norm
        return outcome

# ============================================================================
# Benchmark Functions
# ============================================================================
import warnings
warnings.filterwarnings('ignore')

def bench_qiskit():
    if not HAS_QISKIT:
        print("[QISKIT_BENCHMARK] Qiskit not installed")
        return

    print("[PYTHON_QISKIT_BENCHMARK]")
    
    # Q-Task 1: QFT on 4 and 8 qubits
    for n, iters in [(4, 1000), (8, 100)]:
        qc = QuantumCircuit(n)
        qc.append(QFT(n), range(n))
        t0 = time.perf_counter()
        for _ in range(iters):
            sv = Statevector.from_instruction(qc)
        t1 = time.perf_counter()
        us = int((t1 - t0) * 1_000_000)
        print(f"QISKIT_TASK1_QFT{n} iters={iters} total_time_us={us} avg_time_us={us/iters:.2f}")

    # Q-Task 2: Bell State + 10,000 shots
    qc_bell = QuantumCircuit(2)
    qc_bell.h(0)
    qc_bell.cx(0, 1)
    sv_bell = Statevector.from_instruction(qc_bell)
    t0 = time.perf_counter()
    counts = sv_bell.sample_counts(10000)
    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    c00 = counts.get('00', 0)
    c11 = counts.get('11', 0)
    print(f"QISKIT_TASK2_BELL shots=10000 total_time_us={us} avg_time_us={us/10000:.2f} count00={c00} count11={c11}")

    # Q-Task 3: Grover Search on 3 qubits
    qc_g = QuantumCircuit(3)
    qc_g.h(range(3))
    qc_g.h(2)
    qc_g.ccx(0, 1, 2)
    qc_g.h(2)
    qc_g.h(range(3))
    qc_g.x(range(3))
    qc_g.h(2)
    qc_g.ccx(0, 1, 2)
    qc_g.h(2)
    qc_g.x(range(3))
    qc_g.h(range(3))

    iters = 1000
    t0 = time.perf_counter()
    for _ in range(iters):
        sv_g = Statevector.from_instruction(qc_g)
    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    target_prob = np.abs(sv_g.data[7]) ** 2
    print(f"QISKIT_TASK3_GROVER3 iters={iters} total_time_us={us} avg_time_us={us/iters:.2f} target_prob={target_prob:.4f}")

def bench_numpy():
    print("\n[PYTHON_NUMPY_BENCHMARK]")
    # Q-Task 1: QFT on 4 and 8 qubits
    for n, iters in [(4, 1000), (8, 100)]:
        t0 = time.perf_counter()
        for _ in range(iters):
            sim = NumPyQuantumSim(n)
            sim.qft()
        t1 = time.perf_counter()
        us = int((t1 - t0) * 1_000_000)
        print(f"NUMPY_TASK1_QFT{n} iters={iters} total_time_us={us} avg_time_us={us/iters:.2f}")

    # Q-Task 2: Bell State + 10,000 shots
    t0 = time.perf_counter()
    count00 = 0
    count11 = 0
    for _ in range(10000):
        sim = NumPyQuantumSim(2)
        sim.h(0)
        sim.cnot(0, 1)
        m0 = sim.measure(0)
        m1 = sim.measure(1)
        if m0 == 0 and m1 == 0: count00 += 1
        elif m0 == 1 and m1 == 1: count11 += 1
    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"NUMPY_TASK2_BELL shots=10000 total_time_us={us} avg_time_us={us/10000:.2f} count00={count00} count11={count11}")

    # Q-Task 3: Grover Search on 3 qubits
    iters = 1000
    t0 = time.perf_counter()
    target_prob = 0.0
    for i in range(iters):
        sim = NumPyQuantumSim(3)
        for q in range(3): sim.h(q)
        # Oracle: flip phase of |111>
        sim.state[7] *= -1
        # Diffusion operator
        for q in range(3): sim.h(q)
        for q in range(3): sim.x(q)
        sim.state[7] *= -1
        for q in range(3): sim.x(q)
        for q in range(3): sim.h(q)
        sim.state *= -1
        if i == 0:
            target_prob = float(np.abs(sim.state[7]) ** 2)
    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"NUMPY_TASK3_GROVER3 iters={iters} total_time_us={us} avg_time_us={us/iters:.2f} target_prob={target_prob:.4f}")

if __name__ == "__main__":
    bench_qiskit()
    bench_numpy()
