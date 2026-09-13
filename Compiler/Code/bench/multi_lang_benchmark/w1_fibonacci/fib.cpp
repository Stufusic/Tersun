#include <iostream>
#include <chrono>
#include <cstdint>

int64_t fib(int64_t n) {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

int main() {
    auto t0 = std::chrono::high_resolution_clock::now();
    int64_t res = fib(30);
    auto t1 = std::chrono::high_resolution_clock::now();
    auto us = std::chrono::duration_cast<std::chrono::microseconds>(t1 - t0).count();
    std::cout << "W1_FIB checksum=" << res << " time_us=" << us << "\n";
    return 0;
}
