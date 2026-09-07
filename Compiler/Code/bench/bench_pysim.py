# Pure-Python statevector simulator. Parses the exact OpenQASM 3.0 that
# `setunc emit-qasm` exported for a .stn QFT program, then runs the same
# gate list on a 2^n complex statevector - the same workload the QVM
# performs in C++. No numpy: interpreter-overhead comparison.
import sys, time, math, re

def parse_qasm(path):
    nq, gates = 0, []
    for line in open(path):
        line = line.strip().rstrip(";")
        if not line or line.startswith("//") or line.startswith("OPENQASM") \
           or line.startswith("include") or line.startswith("qubit[") \
           or line.startswith("bit[") or line.startswith("c ="):
            if line.startswith("qubit["):
                nq = int(re.match(r"qubit\[(\d+)\]", line).group(1))
            continue
        m = re.match(r"rz\(([-0-9.e+]+)\)\s+q\[(\d+)\]", line)
        if m:
            gates.append(("rz", float(m.group(1)), int(m.group(2)))); continue
        m = re.match(r"ccx\s+q\[(\d+)\]\s*,\s*q\[(\d+)\]\s*,\s*q\[(\d+)\]", line)
        if m:
            gates.append(("ccx", int(m.group(1)), int(m.group(2)), int(m.group(3)))); continue
        m = re.match(r"(h|x|z|s|t|y)\s+q\[(\d+)\]", line)
        if m:
            gates.append((m.group(1), int(m.group(2)))); continue
        m = re.match(r"(cx|cz|swap)\s+q\[(\d+)\]\s*,\s*q\[(\d+)\]", line)
        if m:
            gates.append((m.group(1), int(m.group(2)), int(m.group(3)))); continue
    return nq, gates

def run(nq, gates):
    dim = 1 << nq
    sv = [complex(0.0, 0.0)] * dim
    sv[0] = complex(1.0, 0.0)
    inv2 = 1.0 / math.sqrt(2.0)
    for g in gates:
        k = g[0]
        if k == "h":
            q = g[1]; step = 1 << q
            for i in range(0, dim, step << 1):
                for j in range(i, i + step):
                    a, b = sv[j], sv[j + step]
                    sv[j] = (a + b) * inv2
                    sv[j + step] = (a - b) * inv2
        elif k == "x":
            q = g[1]; step = 1 << q
            for i in range(0, dim, step << 1):
                for j in range(i, i + step):
                    sv[j], sv[j + step] = sv[j + step], sv[j]
        elif k == "rz":
            th, q = g[1], g[2]; step = 1 << q
            u = complex(math.cos(-th * 0.5), math.sin(-th * 0.5))
            v = complex(math.cos(th * 0.5), math.sin(th * 0.5))
            for i in range(0, dim, step << 1):
                for j in range(i, i + step):
                    sv[j] *= u
                    sv[j + step] *= v
        elif k == "cx":
            c, t = g[1], g[2]; cs, ts = 1 << c, 1 << t
            for i in range(dim):
                if (i & cs) and not (i & ts):
                    sv[i], sv[i | ts] = sv[i | ts], sv[i]
        elif k == "cz":
            c, t = g[1], g[2]; m = (1 << c) | (1 << t)
            for i in range(dim):
                if (i & m) == m:
                    sv[i] = -sv[i]
        elif k == "swap":
            a, b = g[1], g[2]; m = (1 << a) | (1 << b)
            for i in range(dim):
                ai, bi = (i >> a) & 1, (i >> b) & 1
                if ai == 0 and bi == 1:
                    sv[i], sv[i ^ m] = sv[i ^ m], sv[i]
        elif k == "ccx":
            a, b, c = g[1], g[2], g[3]; m = (1 << a) | (1 << b) | (1 << c)
            for i in range(dim):
                if (i & m) == m:
                    sv[i], sv[i ^ (1 << c)] = sv[i ^ (1 << c)], sv[i]
    return sv

if __name__ == "__main__":
    nq, gates = parse_qasm(sys.argv[1])
    t0 = time.perf_counter()
    sv = run(nq, gates)
    t1 = time.perf_counter()
    # |amp| of the last basis state as a light checksum
    print(f"qubits={nq} gates={len(gates)} wall_ms={(t1-t0)*1000:.1f} "
          f"gates_per_s={len(gates)/((t1-t0) if t1>t0 else 1e-9):.0f} "
          f"last_amp_abs={abs(sv[-1]):.6f}")
