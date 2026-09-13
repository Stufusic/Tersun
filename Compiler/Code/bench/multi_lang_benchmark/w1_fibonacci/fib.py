import time

def fib(n: int) -> int:
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)

def main():
    t0 = time.perf_counter()
    res = fib(30)
    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"W1_FIB checksum={res} time_us={us}")

if __name__ == "__main__":
    main()
