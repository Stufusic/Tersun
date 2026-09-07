# ============================================================================
# Heavy Benchmark Suite Reference for CPython 3.14
# H1: Prime Sieve (N=100,000)
# H2: Matrix Multiplication (100x100)
# H3: N-Queens Solver (N=11)
# H4: Binary Trees (Depth=14)
# ============================================================================

import time
import sys

mode = sys.argv[1] if len(sys.argv) > 1 else "all"

# ---------------------------------------------------------------- H1: Sieve
if mode in ("all", "sieve"):
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
    print(f"HEAVY_SIEVE count={count} time_us={int((t1 - t0) * 1e6)}")

# ---------------------------------------------------------------- H2: Matmul
if mode in ("all", "matmul"):
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
    print(f"HEAVY_MATMUL checksum={checksum} time_us={int((t1 - t0) * 1e6)}")

# --------------------------------------------------------------- H3: NQueens
if mode in ("all", "nqueens"):
    def solve_nqueens(row, n, cols, diag1, diag2):
        if row == n:
            return 1
        count = 0
        all_ones = (1 << n) - 1
        occupied = cols | diag1 | diag2
        available = all_ones ^ (all_ones & occupied)
        while available > 0:
            bit = available & (-available)
            available ^= bit
            count += solve_nqueens(row + 1, n, cols | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1)
        return count

    t0 = time.perf_counter()
    solutions = solve_nqueens(0, 11, 0, 0, 0)
    t1 = time.perf_counter()
    print(f"HEAVY_NQUEENS solutions={solutions} time_us={int((t1 - t0) * 1e6)}")

# ---------------------------------------------------------------- H4: Trees
if mode in ("all", "trees"):
    class TreeNode:
        __slots__ = ('left', 'right', 'item')
        def __init__(self, it):
            self.item = it
            self.left = None
            self.right = None

    def make_tree(depth, item):
        node = TreeNode(item)
        if depth > 0:
            node.left = make_tree(depth - 1, 2 * item - 1)
            node.right = make_tree(depth - 1, 2 * item)
        return node

    def check_tree(node, depth):
        s = node.item
        if depth > 0:
            s += check_tree(node.left, depth - 1)
            s += check_tree(node.right, depth - 1)
        return s

    t0 = time.perf_counter()
    d = 14
    root = make_tree(d, 1)
    chk = check_tree(root, d)
    t1 = time.perf_counter()
    print(f"HEAVY_TREES checksum={chk} time_us={int((t1 - t0) * 1e6)}")
