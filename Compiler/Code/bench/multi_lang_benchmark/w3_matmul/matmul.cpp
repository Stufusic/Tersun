#include <iostream>
#include <vector>
#include <chrono>

int main() {
    auto t0 = std::chrono::high_resolution_clock::now();
    const int n = 100;
    const int size = n * n;

    std::vector<int64_t> A(size, 0);
    std::vector<int64_t> B(size, 0);
    std::vector<int64_t> C(size, 0);

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            int idx = i * n + j;
            A[idx] = (i + j) % 10;
            B[idx] = (i * 2 + j) % 10;
        }
    }

    for (int i = 0; i < n; ++i) {
        for (int k = 0; k < n; ++k) {
            int64_t a_val = A[i * n + k];
            for (int j = 0; j < n; ++j) {
                C[i * n + j] += a_val * B[k * n + j];
            }
        }
    }

    int64_t checksum = 0;
    for (int i = 0; i < size; ++i) {
        checksum += C[i];
        if (checksum > 1000000000) {
            checksum %= 1000000000;
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "W3_MATMUL checksum=" << checksum << " time_us=" << us << "\n";
    return 0;
}
