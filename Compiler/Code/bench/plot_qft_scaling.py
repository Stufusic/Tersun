#!/usr/bin/env python3
# ==============================================================================
# Plotting and Scientific Analysis: QFT Scaling N=16..22 on Tersun QVM
# Generates high-res charts and analyzes divergence from O(N * 2^N)
# ==============================================================================

import os
import json
import math
import matplotlib.pyplot as plt
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
CODE_DIR = os.path.dirname(HERE)
ROOT_DIR = os.path.dirname(CODE_DIR)
FROZEN_DIR = os.path.join(ROOT_DIR, "Doc", "artifacts", "frozen_qvm_qft")
JSON_PATH = os.path.join(FROZEN_DIR, "qft_scaling_data.json")

with open(JSON_PATH, "r", encoding="utf-8") as f:
    data = json.load(f)["datapoints"]

N = np.array([d["n"] for d in data])
dim = np.array([d["dim"] for d in data])
gates = np.array([d["gates"] for d in data])
runtime_ms = np.array([d["runtime_ms"] for d in data])
log2_t = np.array([d["log2_runtime_ms"] for d in data])
gates_sec = np.array([d["gates_per_sec"] for d in data])
state_ram = np.array([d["state_ram_mb"] for d in data])
peak_rss = np.array([d["peak_rss_mb"] for d in data])
ratio_n2n = np.array([d["ratio_vs_n2n"] for d in data])
ratio_g2n = np.array([d["ratio_vs_g2n"] for d in data])

# Theoretical models anchored at N=16
# 1. O(N * 2^N)
c_n2n = runtime_ms[0] / (N[0] * dim[0])
t_model_n2n = c_n2n * (N * dim)
log2_t_n2n = np.log2(t_model_n2n)

# 2. O(G(N) * 2^N)
c_g2n = runtime_ms[0] / (gates[0] * dim[0])
t_model_g2n = c_g2n * (gates * dim)
log2_t_g2n = np.log2(t_model_g2n)

fig, axes = plt.subplots(2, 2, figsize=(14, 10), dpi=150)
fig.suptitle("Tersun QVM: Quantum Fourier Transform (QFT) Scaling Analysis (N = 16 .. 22)", fontsize=15, fontweight='bold')

# -----------------------------------------------------------------------------
# Subplot 1: log2(Runtime) vs N
# -----------------------------------------------------------------------------
ax1 = axes[0, 0]
ax1.plot(N, log2_t, 'ro-', linewidth=2.5, markersize=8, label='Empirical QVM Runtime: log2(T_ms)')
ax1.plot(N, log2_t_n2n, 'b--', linewidth=1.8, label='Hypothesis 1: O(N * 2^N) slope')
ax1.plot(N, log2_t_g2n, 'g-.', linewidth=1.8, label='Hypothesis 2: O(G(N) * 2^N) FLOPs')
ax1.set_title("1. Scaling Curve: log2(Runtime in ms) vs Qubits (N)", fontsize=11, fontweight='semibold')
ax1.set_xlabel("Number of Qubits (N)")
ax1.set_ylabel("log2(Runtime in ms)")
ax1.set_xticks(N)
ax1.grid(True, linestyle=':', alpha=0.6)
ax1.legend(loc='upper left', framealpha=0.9)

for i in range(len(N)):
    ax1.annotate(f"{log2_t[i]:.2f}\n({runtime_ms[i]:.1f}ms)", (N[i], log2_t[i]),
                 textcoords="offset points", xytext=(0, 8), ha='center', fontsize=8, fontweight='bold', color='darkred')

# -----------------------------------------------------------------------------
# Subplot 2: Memory Footprint (State RAM vs Peak RSS)
# -----------------------------------------------------------------------------
ax2 = axes[0, 1]
ax2.plot(N, state_ram, 's-', color='darkblue', linewidth=2.2, markersize=7, label='Theoretical State RAM (MB)')
ax2.plot(N, peak_rss, '^-', color='darkorange', linewidth=2.2, markersize=7, label='Windows OS Peak RSS (MB)')
ax2.axhline(y=16.0, color='purple', linestyle=':', label='Typical CPU L3 Cache Boundary (~16MB)')
ax2.set_title("2. Memory Scaling: Statevector RAM vs Peak RSS", fontsize=11, fontweight='semibold')
ax2.set_xlabel("Number of Qubits (N)")
ax2.set_ylabel("Memory (MB)")
ax2.set_yscale('log', base=2)
ax2.set_xticks(N)
ax2.grid(True, which="both", linestyle=':', alpha=0.6)
ax2.legend(loc='upper left', framealpha=0.9)

for i in range(len(N)):
    ax2.annotate(f"{state_ram[i]:.0f}MB", (N[i], state_ram[i]),
                 textcoords="offset points", xytext=(-12, 6), fontsize=8, color='darkblue')
    ax2.annotate(f"{peak_rss[i]:.0f}MB", (N[i], peak_rss[i]),
                 textcoords="offset points", xytext=(10, -10), fontsize=8, color='darkorange')

# -----------------------------------------------------------------------------
# Subplot 3: Gate Throughput (Gates/sec)
# -----------------------------------------------------------------------------
ax3 = axes[1, 0]
ax3.plot(N, gates_sec, 'd-', color='teal', linewidth=2.2, markersize=8, label='Gate Throughput (Gates/sec)')
ax3.set_title("3. Quantum Gate Throughput Decay vs State Dimension", fontsize=11, fontweight='semibold')
ax3.set_xlabel("Number of Qubits (N)")
ax3.set_ylabel("Gates / Second (log scale)")
ax3.set_yscale('log')
ax3.set_xticks(N)
ax3.grid(True, which="both", linestyle=':', alpha=0.6)
ax3.legend(loc='upper right', framealpha=0.9)

for i in range(len(N)):
    ax3.annotate(f"{gates_sec[i]:.1e}", (N[i], gates_sec[i]),
                 textcoords="offset points", xytext=(0, 7), ha='center', fontsize=8, color='teal')

# -----------------------------------------------------------------------------
# Subplot 4: Scaling Divergence Ratio (T / Model)
# -----------------------------------------------------------------------------
ax4 = axes[1, 1]
ax4.plot(N, ratio_n2n, 'o-', color='crimson', linewidth=2.5, markersize=8, label='Divergence from O(N * 2^N)')
ax4.plot(N, ratio_g2n, 's-', color='navy', linewidth=2.0, markersize=7, label='Divergence from O(G(N) * 2^N)')
ax4.axhline(y=1.0, color='gray', linestyle='--', alpha=0.7, label='Ideal Baseline (N=16)')
ax4.axvline(x=20.5, color='purple', linestyle='-.', alpha=0.8, label='L3 Cache Overflow Knee (N >= 21)')
ax4.set_title("4. Empirical Divergence Factor Relative to N=16 Baseline", fontsize=11, fontweight='semibold')
ax4.set_xlabel("Number of Qubits (N)")
ax4.set_ylabel("Ratio T(N) / Model(N)")
ax4.set_xticks(N)
ax4.grid(True, linestyle=':', alpha=0.6)
ax4.legend(loc='upper left', framealpha=0.9)

for i in range(len(N)):
    ax4.annotate(f"{ratio_n2n[i]:.2f}x", (N[i], ratio_n2n[i]),
                 textcoords="offset points", xytext=(0, 7), ha='center', fontsize=8, fontweight='bold', color='crimson')

plt.tight_layout()
out_png = os.path.join(FROZEN_DIR, "qft_scaling_curves.png")
out_svg = os.path.join(FROZEN_DIR, "qft_scaling_curves.svg")
plt.savefig(out_png, dpi=200)
plt.savefig(out_svg)
plt.close()
print(f"[OK] Saved scaling curves to:")
print(f"     - {out_png}")
print(f"     - {out_svg}")
