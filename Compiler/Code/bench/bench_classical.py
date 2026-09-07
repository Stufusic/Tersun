# CPython reference: all benchmark categories, self-timed.
import time, sys

mode = sys.argv[1] if len(sys.argv) > 1 else "all"

if mode in ("all", "dispatch"):
    x = 0
    t0 = time.perf_counter()
    for i in range(3000000):
        x = x + 1
    t1 = time.perf_counter()
    print(f"DISPATCH_HEAVY checksum={x} time_us={int((t1-t0)*1e6)}")

if mode in ("all", "fib"):
    def fib(n):
        return n if n < 2 else fib(n - 1) + fib(n - 2)
    t0 = time.perf_counter()
    r1 = fib(24)
    t1 = time.perf_counter()
    print(f"CONTROL_FIB checksum={r1} time_us={int((t1-t0)*1e6)}")

if mode in ("all", "branch"):
    acc = 0
    t0 = time.perf_counter()
    for i in range(2000000):
        if i > 700000:
            acc += i
        else:
            acc += 1
    t1 = time.perf_counter()
    print(f"CONTROL_BRANCH checksum={acc} time_us={int((t1-t0)*1e6)}")

if mode in ("all", "memory"):
    arr = [0] * 10
    total = 0
    t0 = time.perf_counter()
    for i in range(200000):
        idx = i - (i // 10) * 10
        arr[idx] = arr[idx] + 1
        total += arr[idx]
    t1 = time.perf_counter()
    print(f"MEMORY_ARRAY sum={total} time_us={int((t1-t0)*1e6)}")

if mode in ("all", "sum"):
    s = 0
    t0 = time.perf_counter()
    for i in range(5000000):
        s += i
        if s > 1000000000:
            s = 0
    t1 = time.perf_counter()
    print(f"ARITHMETIC_SUM checksum={s} time_us={int((t1-t0)*1e6)}")
