import time

def main():
    t0 = time.perf_counter()
    n = 100
    size = n * n

    A = [0] * size
    B = [0] * size
    C = [0] * size

    for i in range(n):
        for j in range(n):
            idx = i * n + j
            A[idx] = (i + j) % 10
            B[idx] = (i * 2 + j) % 10

    for i in range(n):
        for k in range(n):
            a_val = A[i * n + k]
            for j in range(n):
                C[i * n + j] += a_val * B[k * n + j]

    checksum = 0
    for i in range(size):
        checksum += C[i]
        if checksum > 1000000000:
            checksum %= 1000000000

    t1 = time.perf_counter()
    us = int((t1 - t0) * 1_000_000)
    print(f"W3_MATMUL checksum={checksum} time_us={us}")

if __name__ == "__main__":
    main()
