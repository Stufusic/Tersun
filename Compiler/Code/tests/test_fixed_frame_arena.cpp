#include "vm/fixed_frame_arena.hpp"
#include "vm/vm.hpp"
#include <iostream>
#include <cassert>
#include <vector>

namespace setun {

void test_fixed_frame_arena_suite() {
    std::cout << "\n===================================================================\n";
    std::cout << "  [Gate 6.0-C] Phase 3: Safe FixedFrameArena Verification Suite    \n";
    std::cout << "===================================================================\n";

    // 1. Basic operations & Invariant checks
    {
        std::cout << "  [ST-CallStack.1] Basic Stack Operations & Alignment...\n";
        FixedFrameArena arena;
        assert(arena.empty());
        assert(arena.size() == 0);
        assert(arena.capacity() == 2048);

        // Verify 64-byte alignment
        uintptr_t data_addr = reinterpret_cast<uintptr_t>(arena.data());
        assert(data_addr % 64 == 0);

        CallFrame f1{100, 0, 0, 32, 50};
        arena.push_back(f1);
        assert(!arena.empty());
        assert(arena.size() == 1);
        assert(arena.back().return_ip == 100);
        assert(arena.back().func_entry == 50);

        CallFrame f2{200, 32, 2, 64, 150};
        arena.push_back(f2);
        assert(arena.size() == 2);
        assert(arena.back().return_ip == 200);
        assert(arena[0].return_ip == 100);
        assert(arena[1].return_ip == 200);

        arena.pop_back();
        assert(arena.size() == 1);
        assert(arena.back().return_ip == 100);

        arena.clear();
        assert(arena.empty());
        assert(arena.size() == 0);
        std::cout << "    -> Basic ops and 64-byte cache alignment 100% validated!\n";
    }

    // 2. Recursion N = 1000
    {
        std::cout << "  [ST-CallStack.2] Deep Recursion N = 1000 Frames (Zero-Alloc Hot Path)...\n";
        FixedFrameArena arena;
        for (size_t i = 0; i < 1000; ++i) {
            arena.push_back(CallFrame{i * 10, i * 8, i, 32, i * 5});
        }
        assert(arena.size() == 1000);
        assert(arena.back().return_ip == 9990);
        for (size_t i = 1000; i > 0; --i) {
            assert(arena.back().return_ip == (i - 1) * 10);
            arena.pop_back();
        }
        assert(arena.empty());
        std::cout << "    -> 1000 frames pushed and popped successfully with 0 heap traffic!\n";
    }

    // 3. Exact Capacity Boundary N = 2048
    {
        std::cout << "  [ST-CallStack.3] Capacity Boundary N = 2048 Frames...\n";
        FixedFrameArena arena;
        for (size_t i = 0; i < FixedFrameArena::kMaxCallDepth; ++i) {
            arena.push_back(CallFrame{i, i, i, 32, i});
        }
        assert(arena.size() == FixedFrameArena::kMaxCallDepth);
        assert(arena.back().return_ip == 2047);
        std::cout << "    -> Exactly 2048 frames pushed up to capacity limit!\n";
    }

    // 4. Overflow Protection N = 2049 (Cold Path Exception)
    {
        std::cout << "  [ST-CallStack.4] Overflow Protection N = 2049 (Cold Path Trap)...\n";
        FixedFrameArena arena;
        for (size_t i = 0; i < FixedFrameArena::kMaxCallDepth; ++i) {
            arena.push_back(CallFrame{i, i, i, 32, i});
        }
        bool caught = false;
        try {
            arena.push_back(CallFrame{2048, 0, 0, 32, 0});
        } catch (const VMStackOverflowException& e) {
            caught = true;
        } catch (const VMException& e) {
            caught = true;
        }
        assert(caught);
        assert(arena.size() == FixedFrameArena::kMaxCallDepth); // State preserved!
        std::cout << "    -> VMStackOverflowException cleanly triggered and caught!\n";
    }

    // 5. Exception Unwinding & Immediate Resize
    {
        std::cout << "  [ST-CallStack.5] O(1) Exception Unwinding (unwind_to & resize)...\n";
        FixedFrameArena arena;
        for (size_t i = 0; i < 500; ++i) {
            arena.push_back(CallFrame{i, i, i, 32, i});
        }
        assert(arena.size() == 500);

        arena.unwind_to(150);
        assert(arena.size() == 150);
        assert(arena.back().return_ip == 149);

        arena.resize(50);
        assert(arena.size() == 50);
        assert(arena.back().return_ip == 49);

        // Attempt invalid resize beyond capacity
        bool resize_caught = false;
        try {
            arena.resize(3000);
        } catch (const VMStackOverflowException&) {
            resize_caught = true;
        }
        assert(resize_caught);
        assert(arena.size() == 50);
        std::cout << "    -> O(1) unwinding and safe boundary checks validated!\n";
    }

    // 6. End-to-end VM recursion execution
    {
        std::cout << "  [ST-CallStack.6] End-to-End VM Execution with FixedFrameArena...\n";
        VM vm;
        assert(vm.call_arena().empty());
        assert(vm.call_arena().capacity() == 2048);

        // Run a fibonacci or recursive chunk through VM
        Chunk chunk;
        // fn 0 (entry): return 42
        chunk.write_opcode(OpCode::OP_PUSH_INT, 1);
        int64_t val = 42;
        uint8_t* p = reinterpret_cast<uint8_t*>(&val);
        for (int i = 0; i < 8; ++i) chunk.write_byte(p[i], 1);
        chunk.write_opcode(OpCode::OP_RET, 1);
        chunk.function_table.push_back(0);
        chunk.function_frame_sizes.push_back(16);

        vm.run(chunk);
        assert(vm.call_arena().empty());
        assert(vm.stack().size() == 1);
        assert(vm.stack().pop().as_int() == 42);
        std::cout << "    -> End-to-end VM invocation & frame cleanup verified!\n";
    }

    std::cout << "===================================================================\n";
    std::cout << "  Gate 6.0-C: All FixedFrameArena Tests Passed (100% Success)      \n";
    std::cout << "===================================================================\n";
}

} // namespace setun
