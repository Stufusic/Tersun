// ============================================================================
// Heavy Benchmark Suite Reference for C++20 (g++ -O3)
// H1: Prime Sieve (N=100,000)
// H2: Matrix Multiplication (100x100)
// H3: N-Queens Solver (N=11)
// H4: Binary Trees (Depth=14)
// ============================================================================

#include <chrono>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include <string>
#include <vector>
#include <memory>

using clk = std::chrono::steady_clock;

// --- H3 Helper ---
static int64_t solve_nqueens(int64_t row, int64_t n, int64_t cols, int64_t diag1, int64_t diag2) {
    if (row == n) return 1;
    int64_t count = 0;
    int64_t all_ones = (1LL << n) - 1;
    int64_t occupied = cols | diag1 | diag2;
    int64_t available = all_ones ^ (all_ones & occupied);
    while (available > 0) {
        int64_t bit = available & (-available);
        available ^= bit;
        count += solve_nqueens(row + 1, n, cols | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1);
    }
    return count;
}

// --- H4 Helper ---
struct TreeNode {
    int64_t item;
    std::unique_ptr<TreeNode> left;
    std::unique_ptr<TreeNode> right;
    explicit TreeNode(int64_t it) : item(it), left(nullptr), right(nullptr) {}
};

static std::unique_ptr<TreeNode> make_tree(int64_t depth, int64_t item) {
    auto node = std::make_unique<TreeNode>(item);
    if (depth > 0) {
        node->left = make_tree(depth - 1, 2 * item - 1);
        node->right = make_tree(depth - 1, 2 * item);
    }
    return node;
}

static int64_t check_tree(const TreeNode* node, int64_t depth) {
    int64_t sum = node->item;
    if (depth > 0) {
        if (node->left) sum += check_tree(node->left.get(), depth - 1);
        if (node->right) sum += check_tree(node->right.get(), depth - 1);
    }
    return sum;
}

int main(int argc, char** argv) {
    std::string mode = (argc > 1) ? argv[1] : "all";

    // ------------------------------------------------------------ H1: Sieve
    if (mode == "all" || mode == "sieve") {
        auto t0 = clk::now();
        int64_t n = 100000;
        std::vector<uint8_t> flags(n + 1, 0);
        for (int64_t p = 2; p < 320; ++p) {
            if (flags[p] == 0) {
                int64_t mult = p * p;
                while (mult <= n) {
                    flags[mult] = 1;
                    mult += p;
                }
            }
        }
        int64_t count = 0;
        for (int64_t i = 2; i <= n; ++i) {
            if (flags[i] == 0) count++;
        }
        auto t1 = clk::now();
        double us = std::chrono::duration<double, std::micro>(t1 - t0).count();
        std::printf("HEAVY_SIEVE count=%lld time_us=%.0f\n", (long long)count, us);
    }

    // ------------------------------------------------------------ H2: Matmul
    if (mode == "all" || mode == "matmul") {
        auto t0 = clk::now();
        int64_t n = 100;
        int64_t size = n * n;
        std::vector<int64_t> A(size, 0);
        std::vector<int64_t> B(size, 0);
        std::vector<int64_t> C(size, 0);

        for (int64_t i = 0; i < n; ++i) {
            for (int64_t j = 0; j < n; ++j) {
                int64_t idx = i * n + j;
                A[idx] = (i + j) % 10;
                B[idx] = (i * 2 + j) % 10;
            }
        }

        for (int64_t i = 0; i < n; ++i) {
            for (int64_t k = 0; k < n; ++k) {
                int64_t a_val = A[i * n + k];
                for (int64_t j = 0; j < n; ++j) {
                    C[i * n + j] += a_val * B[k * n + j];
                }
            }
        }

        int64_t checksum = 0;
        for (int64_t i = 0; i < size; ++i) {
            checksum += C[i];
            if (checksum > 1000000000LL) checksum %= 1000000000LL;
        }
        auto t1 = clk::now();
        double us = std::chrono::duration<double, std::micro>(t1 - t0).count();
        std::printf("HEAVY_MATMUL checksum=%lld time_us=%.0f\n", (long long)checksum, us);
    }

    // ------------------------------------------------------------ H3: NQueens
    if (mode == "all" || mode == "nqueens") {
        auto t0 = clk::now();
        int64_t solutions = solve_nqueens(0, 11, 0, 0, 0);
        auto t1 = clk::now();
        double us = std::chrono::duration<double, std::micro>(t1 - t0).count();
        std::printf("HEAVY_NQUEENS solutions=%lld time_us=%.0f\n", (long long)solutions, us);
    }

    // ------------------------------------------------------------ H4: Trees
    if (mode == "all" || mode == "trees") {
        auto t0 = clk::now();
        int64_t d = 14;
        auto root = make_tree(d, 1);
        int64_t chk = check_tree(root.get(), d);
        auto t1 = clk::now();
        double us = std::chrono::duration<double, std::micro>(t1 - t0).count();
        std::printf("HEAVY_TREES checksum=%lld time_us=%.0f\n", (long long)chk, us);
    }

    return 0;
}
