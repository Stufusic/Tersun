#include <iostream>
#include <iomanip>
#include <cassert>
#include <cmath>
#include <limits>
#include <chrono>
#include <vector>
#include "vm/value.hpp"
#include "vm/vm_arena.hpp"

using namespace setun;

void run_gate3a_encoding_tests() {
    std::cout << "===================================================================\n";
    std::cout << "  Gate 3A: 8B NaNBoxValue Encoding & Layout Verification Suite     \n";
    std::cout << "===================================================================\n";

    // Test 1: Compile-Time & Runtime Footprint Invariants
    std::cout << "[Test 1/8] Verifying 8-Byte Footprint & Trivial Copyability...\n";
    static_assert(sizeof(VMValue) == 8, "Gate 3 Core Invariant Violated: sizeof(VMValue) != 8");
    static_assert(std::is_trivially_copyable_v<VMValue>, "Gate 3 Core Invariant Violated: VMValue is not trivially copyable");
    assert(sizeof(VMValue) == 8);
    std::cout << "  -> PASSED: sizeof(VMValue) is exactly 8 bytes (64 bits) & trivially copyable!\n";

    // Test 2: IEEE 754 Double Precision Exact Bit Round-Trips
    std::cout << "[Test 2/8] Verifying IEEE 754 Float Bit Invariants (finite, inf, subnormal)...\n";
    double test_floats[] = {
        0.0,
        1.0,
        -1.0,
        42.125,
        -9999.875,
        3.141592653589793,
        1e100,
        -1e100,
        std::numeric_limits<double>::min(),       // Smallest normal
        std::numeric_limits<double>::denorm_min(),// Subnormal
        std::numeric_limits<double>::infinity(),  // +inf
        -std::numeric_limits<double>::infinity()  // -inf
    };

    for (double f : test_floats) {
        VMValue v(f);
        assert(v.is_float());
        assert(!v.is_int());
        assert(!v.is_nil());
        if (std::isinf(f)) {
            assert(std::isinf(v.as_float()));
            assert(std::signbit(f) == std::signbit(v.as_float()));
        } else {
            assert(v.as_float() == f);
            // Verify exact 64-bit IEEE representation preservation
            uint64_t expected_raw, actual_raw;
            std::memcpy(&expected_raw, &f, sizeof(double));
            actual_raw = v.raw_;
            assert(actual_raw == expected_raw);
        }
    }

    // Negative Zero test (-0.0)
    double neg_zero = -0.0;
    VMValue v_nz(neg_zero);
    assert(v_nz.is_float());
    assert(std::signbit(v_nz.as_float()) == true);
    std::cout << "  -> PASSED: All finite doubles, ±inf, subnormals, and -0.0 bit-exact!\n";

    // Test 3: IEEE 754 NaN Canonicalization
    std::cout << "[Test 3/8] Verifying IEEE 754 NaN Semantics (TAG_FLOAT_NAN != NIL)...\n";
    double qnan = std::numeric_limits<double>::quiet_NaN();
    VMValue v_nan(qnan);
    assert(v_nan.is_float());
    assert(!v_nan.is_nil());
    assert(v_nan.raw_ == VMValue::TAG_FLOAT_NAN);
    assert(std::isnan(v_nan.as_float()));

    VMValue v_nil;
    assert(v_nil.is_nil());
    assert(!v_nil.is_float());
    assert(v_nil.raw_ != v_nan.raw_);
    std::cout << "  -> PASSED: NaN canonicalized to TAG_FLOAT_NAN, perfectly distinct from NIL!\n";

    // Test 4: 48-bit Immediate Signed Integer Boundaries & Sign Extension
    std::cout << "[Test 4/8] Verifying 48-bit Immediate Signed Integer Boundaries...\n";
    int64_t immediate_ints[] = {
        0LL,
        1LL,
        -1LL,
        42LL,
        -42LL,
        1000000LL,
        -1000000LL,
        VMValue::MAX_INT48, // 140,737,488,355,327
        VMValue::MIN_INT48, // -140,737,488,355,328
        VMValue::MAX_INT48 - 1,
        VMValue::MIN_INT48 + 1
    };

    for (int64_t x : immediate_ints) {
        VMValue v(x);
        assert(v.is_int());
        assert(v.is_immediate_int());
        assert(!v.is_boxed_int());
        assert(!v.is_float());
        assert(v.as_int() == x);
    }
    std::cout << "  -> PASSED: 48-bit signed immediate integer boundaries and sign extensions verified!\n";

    // Test 5: Boxed 64-bit Integer Fallback in VMArena
    std::cout << "[Test 5/8] Verifying Automatic Boxed Int64 Fallback (> 48-bit)...\n";
    int64_t huge_ints[] = {
        std::numeric_limits<int64_t>::max(),
        std::numeric_limits<int64_t>::min(),
        VMValue::MAX_INT48 + 1,
        VMValue::MIN_INT48 - 1,
        0x123456789ABCDEF0LL,
        -0x123456789ABCDEF0LL
    };

    for (int64_t h : huge_ints) {
        VMValue v(h);
        assert(v.is_int());
        assert(!v.is_immediate_int());
        assert(v.is_boxed_int());
        assert(v.has_handle());
        assert(v.as_int() == h);
    }
    std::cout << "  -> PASSED: 64-bit integers outside [-2^47, 2^47-1] transparently boxed into VMArena!\n";

    // Test 6: Balanced Tryte Boundaries ([-364, +364])
    std::cout << "[Test 6/8] Verifying Balanced Tryte Packing & Invariants...\n";
    int16_t trytes[] = {-364, -100, -1, 0, 1, 100, 364};
    for (int16_t t : trytes) {
        VMValue v(t);
        assert(v.is_tryte());
        assert(!v.is_int());
        assert(v.as_tryte() == t);
        assert(v.as_int() == static_cast<int64_t>(t));
    }
    std::cout << "  -> PASSED: Balanced tryte range [-364, +364] cleanly encoded in 16 bits!\n";

    // Test 7: VMArena 32-bit Handle Indexing for Heap Types
    std::cout << "[Test 7/8] Verifying VMArena Handle Indexing & Subtypes...\n";
    {
        VMValue v_str("Tersun Gate 3 NaN-Box");
        assert(v_str.is_string());
        assert(v_str.has_handle());
        assert(v_str.handle() > 0);
        assert(v_str.to_string() == "Tersun Gate 3 NaN-Box");

        VMValue v_taf(TafpuNum(15, 30, 2));
        assert(v_taf.is_tafpu());
        assert(v_taf.has_handle());
        assert(v_taf.as_tafpu().a == 15);
        assert(v_taf.as_tafpu().b == 30);
        assert(v_taf.as_tafpu().s == 2);

        auto obj = std::make_shared<VMObject>();
        obj->type_name = "Point3D";
        obj->fields["x"] = VMValue(10);
        obj->fields["y"] = VMValue(20);
        obj->fields["z"] = VMValue(30);
        VMValue v_obj(obj);
        assert(v_obj.is_object());
        assert(v_obj.as_object()->fields["x"].as_int() == 10);
        assert(v_obj.as_object()->fields["y"].as_int() == 20);
        assert(v_obj.as_object()->fields["z"].as_int() == 30);

        auto arr = std::make_shared<std::vector<VMValue>>();
        arr->push_back(VMValue(100));
        arr->push_back(VMValue(200));
        VMValue v_arr(arr);
        assert(v_arr.is_array());
        assert(v_arr.as_array()->size() == 2);
        assert((*v_arr.as_array())[0].as_int() == 100);
        assert((*v_arr.as_array())[1].as_int() == 200);
    }
    std::cout << "  -> PASSED: String, Tafpu, Object, and Array heap payloads bound to 32-bit handles!\n";

    // Test 8: Trivially Copyable Stack Throughput (10,000,000 Operations)
    std::cout << "[Test 8/8] Benchmarking 8B Trivially Copyable Stack Throughput (10,000,000 ops)...\n";
    constexpr size_t N_OPS = 10000000;
    std::vector<VMValue> stack;
    stack.reserve(1024);

    auto t0 = std::chrono::high_resolution_clock::now();
    VMValue accum(0LL);
    for (size_t i = 0; i < N_OPS; ++i) {
        VMValue item(static_cast<int64_t>(i & 0x3FF));
        stack.push_back(item);
        VMValue popped = stack.back();
        stack.pop_back();
        accum = accum.add(popped);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    std::cout << std::fixed << std::setprecision(2);
    std::cout << "  -> 10,000,000 stack push/pop/copy operations: " << ms << " ms (" 
              << (N_OPS / (ms / 1000.0) / 1e6) << " M ops/sec)\n";
    std::cout << "  -> Accumulator result: " << accum.as_int() << "\n";

    std::cout << "===================================================================\n";
    std::cout << "  ALL GATE 3A ENCODING INVARIANTS PASSED SUCCESSFULLY (8/8 SUCCESS)!\n";
    std::cout << "===================================================================\n";
}

int main() {
    try {
        run_gate3a_encoding_tests();
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Gate 3A Verification Failed with exception: " << e.what() << "\n";
        return 1;
    }
}
