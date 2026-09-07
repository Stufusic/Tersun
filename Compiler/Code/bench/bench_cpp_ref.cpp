// C++ reference (-O3) covering all benchmark categories
#include <chrono>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include <string>
#include <vector>

static uint64_t fib(int n) {
    if (n < 2) return (uint64_t)n;
    return fib(n - 1) + fib(n - 2);
}

int main(int argc, char** argv) {
    if (argc < 3) { std::fprintf(stderr, "usage: %s dispatch|fib|branch|memory|sum N\n", argv[0]); return 1; }
    std::string mode = argv[1];
    long long n = std::atoll(argv[2]);
    using clk = std::chrono::steady_clock;
    auto t0 = clk::now();
    uint64_t result = 0;
    
    if (mode == "dispatch") {
        uint64_t x = 0;
        for (long long i = 0; i < n; ++i) {
            x = x + 1;
        }
        result = x;
    } else if (mode == "fib") {
        result = fib((int)n);
    } else if (mode == "branch") {
        uint64_t acc = 0;
        for (long long i = 0; i < n; ++i) {
            if (i > 700000) acc += (uint64_t)i;
            else acc += 1;
        }
        result = acc;
    } else if (mode == "memory") {
        std::vector<int64_t> arr(10, 0);
        uint64_t sum = 0;
        for (long long i = 0; i < n; ++i) {
            size_t idx = (size_t)(i - (i / 10) * 10);
            arr[idx] = arr[idx] + 1;
            sum += arr[idx];
        }
        result = sum;
    } else { // sum
        uint64_t s = 0;
        for (long long i = 0; i < n; ++i) {
            s += (uint64_t)i;
            if (s > 1000000000ULL) s = 0;
        }
        result = s;
    }
    auto t1 = clk::now();
    double us = std::chrono::duration<double, std::micro>(t1 - t0).count();
    std::printf("%s(%lld) = %llu in %.0f us\n", mode.c_str(), n, (unsigned long long)result, us);
    return 0;
}
