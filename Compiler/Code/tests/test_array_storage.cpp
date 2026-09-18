#include "vm/array_storage.hpp"
#include "vm/value.hpp"
#include "vm/vm.hpp"
#include "vm/vm_profiler.hpp"
#include <iostream>
#include <cassert>

namespace setun {

void test_array_storage_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 6.0-E] Phase 5: Flat Array Storage Verification Suite      \n";
    std::cout << "===================================================================\n";

    // 1. Basic Representation and Initial Layouts
    {
        std::cout << "  [ST-Flat.1] Flat Buffer Types & Initialization Contracts...\n";
        ArrayObject arr_i64(ArrayRep::I64);
        assert(arr_i64.rep == ArrayRep::I64);
        assert(arr_i64.size() == 0);
        assert(arr_i64.empty());

        ArrayObject arr_f64(ArrayRep::F64);
        assert(arr_f64.rep == ArrayRep::F64);

        ArrayObject arr_u8(ArrayRep::U8);
        assert(arr_u8.rep == ArrayRep::U8);

        ArrayObject arr_tafpu(ArrayRep::TAFPU);
        assert(arr_tafpu.rep == ArrayRep::TAFPU);

        ArrayObject arr_gen(ArrayRep::Generic);
        assert(arr_gen.rep == ArrayRep::Generic);

        std::cout << "    -> All 5 ArrayRep variants initialized with correct contracts!\n";
    }

    // 2. Homogeneous Promotion: Generic -> I64, F64, TAFPU
    {
        std::cout << "  [ST-Flat.2] Automatic Homogeneous Promotion Engine...\n";
        // Integer array
        std::vector<VMValue> int_vec = {VMValue(static_cast<int64_t>(10)),
                                        VMValue(static_cast<int64_t>(20)),
                                        VMValue(static_cast<int64_t>(30))};
        ArrayObject arr1(int_vec);
        assert(arr1.rep == ArrayRep::I64);
        assert(arr1.size() == 3);
        assert(arr1.get_i64_fast(0) == 10);
        assert(arr1.get_i64_fast(1) == 20);
        assert(arr1.get_i64_fast(2) == 30);
        assert(arr1.generic_data.empty());

        // Float array
        std::vector<VMValue> float_vec = {VMValue(1.5), VMValue(2.5), VMValue(3.5)};
        ArrayObject arr2(float_vec);
        assert(arr2.rep == ArrayRep::F64);
        assert(arr2.size() == 3);
        assert(arr2.get_f64_fast(1) == 2.5);

        // TAFPU array
        std::vector<VMValue> tafpu_vec = {VMValue(TafpuNum{1, 0, 0}), VMValue(TafpuNum{0, 1, 0})};
        ArrayObject arr3(tafpu_vec);
        assert(arr3.rep == ArrayRep::TAFPU);
        assert(arr3.size() == 2);
        assert(arr3.get_tafpu_fast(1).b == 1);

        // Mixed array -> stays Generic
        std::vector<VMValue> mixed_vec = {VMValue(static_cast<int64_t>(10)), VMValue("hello")};
        ArrayObject arr4(mixed_vec);
        assert(arr4.rep == ArrayRep::Generic);
        assert(arr4.size() == 2);
        assert(arr4.get(1).to_string() == "hello");

        std::cout << "    -> Homogeneous I64, F64, TAFPU promotion verified (mixed preserved)!\n";
    }

    // 3. Graceful Degradation on Heterogeneous Mutation
    {
        std::cout << "  [ST-Flat.3] Zero-Loss Degradation on Heterogeneous Mutation...\n";
        ArrayObject arr(std::vector<int64_t>{100, 200, 300});
        assert(arr.rep == ArrayRep::I64);

        // Homogeneous write preserves I64 flat buffer
        arr.set(1, VMValue(static_cast<int64_t>(999)));
        assert(arr.rep == ArrayRep::I64);
        assert(arr.get_i64_fast(1) == 999);

        // Heterogeneous write degrades gracefully to Generic without data loss
        arr.set(2, VMValue("degraded_string"));
        assert(arr.rep == ArrayRep::Generic);
        assert(arr.size() == 3);
        assert(arr.get(0).as_int() == 100);
        assert(arr.get(1).as_int() == 999);
        assert(arr.get(2).to_string() == "degraded_string");

        std::cout << "    -> Degradation preserved all existing elements with exact parity!\n";
    }

    // 4. Exact Mathematical Zero-Drift on TAFPU Flat Buffers
    {
        std::cout << "  [ST-Flat.4] Mathematical Exactness Invariant in Q(sqrt(3))...\n";
        ArrayObject arr(ArrayRep::TAFPU);
        TafpuNum v1{1, 2, 0}; // 1 + 2*sqrt(3)
        TafpuNum v2{3, -1, 0}; // 3 - sqrt(3)
        arr.push_back(VMValue(v1));
        arr.push_back(VMValue(v2));

        assert(arr.rep == ArrayRep::TAFPU);
        assert(arr.size() == 2);
        assert(arr.get_tafpu_fast(0).a == 1 && arr.get_tafpu_fast(0).b == 2);
        assert(arr.get_tafpu_fast(1).a == 3 && arr.get_tafpu_fast(1).b == -1);

        // Sum in Q(sqrt(3)): (1 + 2sqrt(3)) + (3 - sqrt(3)) = 4 + sqrt(3)
        TafpuNum sum = tafpu_add(arr.get_tafpu_fast(0), arr.get_tafpu_fast(1));
        assert(sum.a == 4);
        assert(sum.b == 1);
        std::cout << "    -> Exact Zero-Drift arithmetic preserved in flat TAFPU array!\n";
    }

    // 5. Array Methods: Slice, Sort, Reverse, Fast Access
    {
        std::cout << "  [ST-Flat.5] Flat Array Methods (Slice, Sort, Reverse)...\n";
        ArrayObject arr(std::vector<int64_t>{50, 10, 40, 20, 30});
        assert(arr.rep == ArrayRep::I64);

        arr.sort();
        assert(arr.rep == ArrayRep::I64);
        assert(arr.get_i64_fast(0) == 10);
        assert(arr.get_i64_fast(4) == 50);

        arr.reverse();
        assert(arr.get_i64_fast(0) == 50);
        assert(arr.get_i64_fast(4) == 10);

        auto sliced = arr.slice(1, 3);
        assert(sliced->rep == ArrayRep::I64);
        assert(sliced->size() == 3);
        assert(sliced->get_i64_fast(0) == 40);
        assert(sliced->get_i64_fast(1) == 30);
        assert(sliced->get_i64_fast(2) == 20);

        std::cout << "    -> In-place sorting, reversal and slicing executed on flat memory!\n";
    }

    // 6. End-to-End VM Execution & Flat Profiling Metrics
    {
        std::cout << "  [ST-Flat.6] End-to-End VM Flat Array Profiling Counters...\n";
        Chunk chunk;
        // let a = [10, 20, 30]
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(10, 1);
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(20, 1);
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(30, 1);
        chunk.write_opcode(OpCode::OP_NEW_ARRAY, 1); chunk.write_int16(3, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1); chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        // a[1] = 99
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1); chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(1, 1);
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(99, 1);
        chunk.write_opcode(OpCode::OP_SET_INDEX_ARRAY, 1);

        // read a[1] into local 1
        chunk.write_opcode(OpCode::OP_LOAD_LOCAL, 1); chunk.write_int16(0, 1);
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1); chunk.write_int64(1, 1);
        chunk.write_opcode(OpCode::OP_GET_INDEX_ARRAY, 1);
        chunk.write_opcode(OpCode::OP_STORE_LOCAL, 1); chunk.write_int16(1, 1);
        chunk.write_opcode(OpCode::OP_POP, 1);

        chunk.write_opcode(OpCode::OP_HALT, 1);

        auto profiler = std::make_shared<VMProfiler>();
        VM vm;
        vm.set_profiler(profiler);
        vm.run_cached(chunk);

        assert(vm.locals()[1].as_int() == 99);
        assert(profiler->array_flat_writes() >= 1);
        assert(profiler->array_flat_reads() >= 1);
        std::cout << "    -> Profiler captured flat array hits: reads=" << profiler->array_flat_reads()
                  << ", writes=" << profiler->array_flat_writes() << "!\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 6.0-E: All Flat Storage Tests Passed (100% Success)         \n";
    std::cout << "===================================================================\n";
}

} // namespace setun
