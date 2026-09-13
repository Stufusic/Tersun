import time

def main():
    t0 = time.perf_counter()
    n = 100000
    flags = [0] * (n + 1)

    for p in range(2, 320):
        if flags[p] == 0:
            mult = p * p
            while mult <= n:
                flags[mult] = 1
                mult += p

    count = 0
    for i in range(2, n + 1):
        if flags[i] == 0:
            count += 1

    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"W2_SIEVE checksum={count} time_us={us}")

if __name__ == "__main__":
    main()
