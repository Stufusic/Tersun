# Tersun benchmark orchestrator.
#   Classical: .stn -> .tbc (setunc VM), .stn -> --native (AOT C++),
#              CPython 3 reference, C++ -O3 reference.
#   Quantum:   .stn -> --qvm (.qbc) run on the QVM (C++ statevector)
#              vs the same emitted QASM on a pure-Python statevector sim.
# Timing: self-timed where the path supports it (VM time_now_us, Python
# perf_counter, C++ chrono); external best-of-N subprocess wall time for
# native, minus an empty-program baseline.
import subprocess, time, re, sys, os

HERE = os.path.dirname(os.path.abspath(__file__))
CODE = os.path.dirname(HERE)
ROOT = os.path.dirname(CODE)
SETUNC = os.path.join(CODE, "setunc.exe")
BUILD = os.path.join(HERE, "build")
os.makedirs(BUILD, exist_ok=True)
os.chdir(HERE)  # so -ltersun_rt resolves against libtersun_rt.a next to us

def sh(cmd, timeout=300, cwd=None):
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout,
                       cwd=cwd or HERE, shell=False)
    return r.returncode, r.stdout.strip(), r.stderr.strip()

def best_of(cmd, n=5, timeout=300):
    best, out = None, ""
    for _ in range(n):
        t0 = time.perf_counter()
        rc, o, e = sh(cmd, timeout)
        dt = (time.perf_counter() - t0) * 1000
        if rc != 0:
            return None, o + e
        if best is None or dt < best:
            best, out = dt, o
    return best, out

rows = []   # (bench, impl, time_ms, note)

# ---------------------------------------------------------------- classical
print("== Classical benchmarks (fib24 recursive | 2M branchy | 5M sum) ==")

# 1. Tersun VM (.tbc) - self-timed
rc, o, e = sh([SETUNC, "compile", "bench_vm.stn", "-o", "build/bench_vm.tbc"])
assert rc == 0, e
t_ext, vm_out = best_of([SETUNC, "run", "build/bench_vm.tbc"], n=3)
for line in vm_out.split("\n"):
    m = re.match(r"(B\d .+?)\s+checksum=(-?\d+) time_us=(\d+)", line)
    if m:
        rows.append((m.group(1).strip(), "Tersun VM (.tbc)", int(m.group(3)) / 1000.0, "self-timed"))
print(f"  VM external total (incl. startup): {t_ext:.0f} ms")

# 2. Tersun native (AOT C++) - external timing minus empty baseline
rc, o, e = sh([SETUNC, "compile", "bench_empty.stn", "--native", "-o", "build/bench_empty.exe"])
assert rc == 0, e
base, _ = best_of([os.path.join(BUILD, "bench_empty.exe")], n=7)
REPS = {"native_fib": 200, "native_branch": 20, "native_sum": 20}
for name, title in [("native_fib", "B1 fib(24)"), ("native_branch", "B2 branchy 2M"), ("native_sum", "B3 sum 5M")]:
    rc, o, e = sh([SETUNC, "compile", f"{name}.stn", "--native", "-o", f"build/{name}.exe"])
    assert rc == 0, e
    t, out = best_of([os.path.join(BUILD, f"{name}.exe")], n=7)
    per_rep = max((t - base) / REPS[name], 0.001)
    rows.append((title, "Tersun --native (AOT)", per_rep, f"{REPS[name]} reps, external - {base:.0f} ms startup"))

# 3. CPython reference - self-timed
rc, o, e = sh([sys.executable, "bench_classical.py"])
assert rc == 0, e
key_map = {
    "CONTROL_FIB": "B1 fib(24)",
    "CONTROL_BRANCH": "B2 branchy 2M",
    "ARITHMETIC_SUM": "B3 sum 5M"
}
for line in o.split("\n"):
    m = re.match(r"(B\d .+?)\s+checksum=(-?\d+) time_us=(\d+)", line)
    if m:
        rows.append((m.group(1).strip(), "CPython 3.14", int(m.group(3)) / 1000.0, "self-timed"))
    else:
        m2 = re.match(r"(CONTROL_FIB|CONTROL_BRANCH|ARITHMETIC_SUM)\s+checksum=(-?\d+) time_us=(\d+)", line)
        if m2:
            rows.append((key_map[m2.group(1)], "CPython 3.14", int(m2.group(3)) / 1000.0, "self-timed"))

# 4. C++ -O3 reference - self-timed (chrono)
rc, o, e = sh(["g++", "-std=c++20", "-O3", "bench_cpp_ref.cpp", "-o", "build/cpp_ref.exe"])
assert rc == 0, e
for mode, n, title in [("fib", 24, "B1 fib(24)"), ("branch", 2000000, "B2 branchy 2M"), ("sum", 5000000, "B3 sum 5M")]:
    best, out = None, ""
    for _ in range(7):
        rc, o, e = sh([os.path.join(BUILD, "cpp_ref.exe"), mode, str(n)])
        assert rc == 0, e
        m = re.search(r"in ([\d.]+) us", o)
        us = float(m.group(1))
        if best is None or us < best:
            best = us
    rows.append((title, "C++ g++ -O3", best / 1000.0, "self-timed"))

# ------------------------------------------------------------------ quantum
print("== Quantum benchmark: QFT(n) via .stn -> --qvm (.qbc) ==")

rc, o, e = sh(["g++", "-std=c++20", "-O2", "-Iinclude",
               "src/qvm/qreg.cpp", "src/qvm/qgate.cpp", "src/qvm/qvm.cpp",
               "bench/bench_qvm.cpp", "-o", "bench/build/bench_qvm.exe",
               "-lgdi32", "-luser32"], cwd=CODE)
assert rc == 0, e

for n in (8, 12):
    src = f"qft{n}.stn"
    rc, o, e = sh([SETUNC, "compile", src, "--qvm", "-o", f"build/qft{n}.qbc"])
    assert rc == 0, e
    rc, o, e = sh([SETUNC, "emit-qasm", src, "-o", f"build/qft{n}.qasm"])
    assert rc == 0, e
    rc, o, e = sh([os.path.join(BUILD, "bench_qvm.exe"), f"build/qft{n}.qbc", "3"])
    assert rc == 0, e
    m = re.search(r"gates=(\d+) per_run_ms=([\d.]+) gates_per_s=(\d+)", o)
    rows.append((f"QFT({n}) circuit", "QVM (.qbc, C++ sim)", float(m.group(2)), f"{m.group(1)} gates, {int(m.group(3)):,} gate/s"))
    rc, o, e = sh([sys.executable, "bench_pysim.py", f"build/qft{n}.qasm"], timeout=1200)
    assert rc == 0, e
    m = re.search(r"gates=(\d+) wall_ms=([\d.]+) gates_per_s=(\d+)", o)
    rows.append((f"QFT({n}) circuit", "Pure-Python sim", float(m.group(2)), f"{m.group(1)} gates, {int(m.group(3)):,} gate/s"))

# -------------------------------------------------------------------- table
print("\n" + "=" * 86)
print(f"{'Benchmark':<20}{'Implementation':<24}{'Time':>12}   Note")
print("-" * 86)
for b, impl, ms, note in rows:
    t = f"{ms:,.1f} ms" if ms >= 1 else f"{ms * 1000:,.0f} us"
    print(f"{b:<20}{impl:<24}{t:>12}   {note}")
print("=" * 86)
